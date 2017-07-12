
{******************************************}
{                                          }
{     FastReport v2.4 - FIB components     }
{             Query component              }
{                                          }
{        Copyright (c) 2000 by EMS         }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{   Copyright (c) 2001 by Witaly Barmin    }
{                                          }
{******************************************}

unit FR_FIBQuery;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls,
  Forms, Menus, Dialogs, FR_Class, FR_Pars, FR_DBSet, DB, FIBDatabase,
  pFIBDatabase, pFIBDataset, FR_DBUtils, pFIBProps
  {$IFDEF VER140},Variants{$ENDIF};

type
  TfrFIBDataset = class(TfrNonVisualControl)
  protected
    FDataSet: TpFIBDataSet;
    FDataSource: TDataSource;
    FDBDataSet: TfrDBDataset;
    procedure FieldsEditor(Sender: TObject);
    procedure ReadFields(Stream: TStream);
    procedure WriteFields(Stream: TStream);
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
    function DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure DefineProperties; override;
    procedure Loaded; override;
    procedure ShowEditor; override;
  end;


  TfrFIBQuery = class(TfrFIBDataSet)
  private
    FQuery: TpFIBDataset;
    procedure RefreshParams;
    procedure SQLEditor(Sender: TObject);
    procedure ParamsEditor(Sender: TObject);
    procedure ReadParams(Stream: TStream);
    procedure WriteParams(Stream: TStream);
    procedure BeforeOpenQuery(DataSet: TDataSet);
  protected
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
    function DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant; override;
  public
    FParams: TfrVariables;
    constructor Create; override;
    destructor Destroy; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure DefineProperties; override;
    procedure Loaded; override;
    property Query: TpFIBDataset read FQuery;
  end;

implementation

uses
  FR_LEdit, FR_DBFldEditor, FR_Utils, FR_Const, FR_DBSQLEdit,
  FR_FIBQueryParam, FIBQuery;

{ TfrFIBDataSet }

constructor TfrFIBDataSet.Create;
begin
  inherited Create;
  FDataSource := TDataSource.Create(frDialogForm);
  FDataSource.DataSet := nil;

  FDBDataSet := TfrDBDataSet.Create(frDialogForm);
  FDBDataSet.DataSource := FDataSource;

  Flags := Flags or flDontUndo;
end;

destructor TfrFIBDataSet.Destroy;
begin
  FDBDataset.Free;
  FDataSource.Free;
  FDataSet.Free;
  inherited Destroy;
end;

procedure TfrFIBDataSet.DefineProperties;

  function GetDatabases: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(frDialogForm, TpFIBDatabase, sl, nil);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

begin
  inherited DefineProperties;
  AddProperty('Active', [frdtBoolean], nil);
  AddEnumProperty('Database', GetDatabases, [Null]);
  AddProperty('Fields', [frdtHasEditor, frdtOneObject], FieldsEditor);
  AddProperty('FieldCount', [], nil);
  AddProperty('Filter', [frdtString], nil);
  AddProperty('EOF', [], nil);
  AddProperty('RecordCount', [], nil);
end;

procedure TfrFIBDataSet.SetPropValue(Index: String; Value: Variant);
var
  d : TpFIBDatabase;
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'NAME' then
  begin
    FDataSource.Name := 'S' + FDataSet.Name;
    FDBDataSet.Name := '_' + FDataSet.Name;
  end
  else if Index = 'ACTIVE' then
    FDataSet.Active := Value
  else if Index = 'DATABASE' then
  begin
    d := frFindComponent(FDataSet.Owner, Value) as TpFIBDatabase;
    FDataSet.Database := d;
    if Assigned(d) then FDataSet.Transaction := d.DefaultTransaction
    else FDataSet.Transaction := Nil;
  end
  else if Index = 'FILTER' then
  begin
    FDataSet.Filter := Value;
    FDataSet.Filtered := Trim(Value) <> '';
  end;
end;

function TfrFIBDataSet.GetPropValue(Index: String): Variant;

  function frGetDataBaseName(Owner: TComponent; d: TFIBDatabase): String;
  begin
    Result := '';
    if d <> nil then
    begin
      Result := d.Name;
      if d.Owner <> Owner then
        Result := d.Owner.Name + '.' + Result;
    end;
  end;

begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'ACTIVE' then
    Result := FDataSet.Active
  else if Index = 'DATABASE' then
    Result := frGetDataBaseName(FDataSet.Owner, FDataSet.Database)
  else if Index = 'FILTER' then
    Result := FDataSet.Filter
  else if Index = 'EOF' then
    Result := FDataSet.Eof
  else if Index = 'RECORDCOUNT' then
    Result := FDataSet.RecordCount
  else if Index = 'FIELDCOUNT' then
    Result := FDataSet.FieldCount
end;

function TfrFIBDataSet.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
  if MethodName = 'GETINDEXPROPERTY' then
  begin
    if Par1 = 'FIELDS' then
      Result := FDataSet.FieldByName(Par2).AsVariant;
  end
  else if MethodName = 'OPEN' then
    FDataSet.Open
  else if MethodName = 'CLOSE' then
    FDataSet.Close
  else if MethodName = 'NEXT' then
    FDataSet.Next
  else if MethodName = 'PRIOR' then
    FDataSet.Prior
  else if MethodName = 'FIRST' then
    FDataSet.First
  else if MethodName = 'LAST' then
    FDataSet.Last
  else if MethodName = 'FETCHALL' then
    FDataSet.FetchAll
end;

procedure TfrFIBDataSet.ReadFields(Stream: TStream);
var
  i: Integer;
  n: Word;
  s: String;
  Field: TField;
  ds1: TDataset;
  fName: String;
  fType: TFieldType;
  fLookup: Boolean;
  fSize: Word;
  fDefs: TFieldDefs;
begin
  fDefs := FDataSet.FieldDefs;
  Stream.Read(n, 2);             // FieldCount
  for i := 0 to n - 1 do
  begin
    fType := TFieldType(frReadByte(Stream));                    // DataType
    fName := frReadString(Stream);                              // FieldName
    fLookup := frReadBoolean(Stream);                           // Lookup
    fSize := frReadWord(Stream);                                // Size

    fDefs.Add(fName, fType, fSize, False);
    Field := fDefs[fDefs.Count - 1].CreateField(FDataSet);
    if fLookup then
      with Field do
      begin
        Lookup := True;
        KeyFields := frReadString(Stream);                      // KeyFields
        s := frReadString(Stream);                              // LookupDataset
        ds1 := frFindComponent(FDataSet.Owner, s) as TDataSet;
        FFixupList['.' + FieldName] := s;
        LookupDataset := ds1;
        LookupKeyFields := frReadString(Stream);                // LookupKeyFields
        LookupResultField := frReadString(Stream);              // LookupResultField
      end;
  end;
end;

procedure TfrFIBDataSet.WriteFields(Stream: TStream);
var
  i: Integer;
  s: String;
  SaveActive: Boolean;
begin
  SaveActive := FDataSet.Active;
  FDataSet.Close;
  frWriteWord(Stream, FDataSet.FieldCount);  // FieldCount
  for i := 0 to FDataSet.FieldCount - 1 do
  with FDataSet.Fields[i] do
  begin
    frWriteByte(Stream, Byte(DataType));          // DataType
    frWriteString(Stream, FieldName);             // FieldName
    frWriteBoolean(Stream, Lookup);               // Lookup
    frWriteWord(Stream, Size);                    // Size

    if Lookup then
    begin
      frWriteString(Stream, KeyFields);           // KeyFields
      if LookupDataset <> nil then
      begin
        s := LookupDataset.Name;
        if LookupDataset.Owner <> FDataSet.Owner then
          s := LookupDataset.Owner.Name + '.' + s;
      end
      else
        s := '';
      frWriteString(Stream, s);                   // LookupDataset
      frWriteString(Stream, LookupKeyFields);     // LookupKeyFields
      frWriteString(Stream, LookupResultField);   // LookupResultField
    end;
  end;
  FDataSet.Active := SaveActive;
end;

procedure TfrFIBDataSet.Loaded;
var
  i: Integer;
  s: String;
  ds: TDataSet;
  f: TField;
begin
// fixup component references
  try
    Prop['DataBase'] := FFixupList['DataBase'];
    Prop['Active'] := FFixupList['Active'];
    for i := 0 to FFixupList.Count - 1 do
    begin
      s := FFixupList.Name[i];
      if s[1] = '.' then // lookup field
      begin
        f := FDataSet.FindField(Copy(s, 2, 255));
        ds := frFindComponent(FDataSet.Owner, FFixupList.Value[i]) as TDataSet;
        f.LookupDataset := ds;
      end
    end;
  except;
  end;
end;

procedure TfrFIBDataSet.ShowEditor;
begin
  FieldsEditor(nil);
end;

procedure TfrFIBDataSet.FieldsEditor(Sender: TObject);
var
  SaveActive: Boolean;
begin
  SaveActive := FDataSet.Active;
  FDataSet.Close;
  with TfrDBFieldsEditorForm.Create(nil) do
  begin
    DataSet := FDataSet;
    ShowModal;
    frDesigner.Modified := True;
    Free;
  end;
  FDataSet.Active := SaveActive;
end;



{ TfrFIBQuery }

constructor TfrFIBQuery.Create;
begin
  inherited Create;
  FQuery := TpFIBDataset.Create(frDialogForm);
  FQuery.BeforeOpen := BeforeOpenQuery;
  FQuery.Options := FQuery.Options - [poStartTransaction];
  FDataSet := FQuery;
  FDataSource.DataSet := FDataSet;
  FParams := TfrVariables.Create;
  Component := FQuery;
  BaseName := 'Query';
  Bmp.LoadFromResourceName(hInstance, 'FR_FIBQUERY');
end;

destructor TfrFIBQuery.Destroy;
begin
  FParams.Free;
  FDataSet := nil;
  FQuery.Free;
  inherited Destroy;
end;

procedure TfrFIBQuery.DefineProperties;

  function GetMasterSource: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(FQuery.Owner, TDataSet, sl, FQuery);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

begin
  inherited DefineProperties;
  AddEnumProperty('DataSource', GetMasterSource, [Null]);
  AddProperty('Params', [frdtHasEditor], ParamsEditor);
  AddProperty('SQL', [frdtHasEditor], SQLEditor);
  AddProperty('SQL.Count', [], nil);
end;

procedure TfrFIBQuery.SetPropValue(Index: String; Value: Variant);
var
  d: TDataset;
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'DATASOURCE' then
  begin
    d := frFindComponent(FQuery.Owner, Value) as TDataSet;
    FQuery.DataSource := frGetDataSource(FQuery.Owner, d);
  end
  else if Index = 'SQL' then
    FQuery.SelectSQL.Text := Value
end;

function TfrFIBQuery.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATASOURCE' then
    Result := frGetDataSetName(FQuery.Owner, FQuery.DataSource)
  else if Index = 'SQL' then
    Result := FQuery.SelectSQL.Text
  else if Index = 'SQL.Count' then
    Result := FQuery.SelectSQL.Count;
end;

function TfrFIBQuery.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
  if Result = Null then
    Result := LinesMethod(FQuery.SelectSQL, MethodName, 'SQL', Par1, Par2, Par3);
  if MethodName = 'EXECSQL' then
    FQuery.Open;
end;

procedure TfrFIBQuery.LoadFromStream(Stream: TStream);
var
  s: String;
begin
  FFixupList.Clear;
  inherited LoadFromStream(Stream);
  FFixupList['DataBase'] := frReadString(Stream);
  Prop['DataBase'] := FFixupList['DataBase'];
  FQuery.Filter := frReadString(Stream);
  FQuery.Filtered := Trim(FQuery.Filter) <> '';
  s := frReadString(Stream);
  FFixupList['DataSource'] := s;
  Prop['DataSource'] := FFixupList['DataSource'];
  frReadMemo(Stream, FQuery.SelectSQL);

  FFixupList['Active'] := frReadBoolean(Stream);
  ReadFields(Stream);
  ReadParams(Stream);
  try
    FQuery.Active := FFixupList['Active'];
  except;
  end;
end;

procedure TfrFIBQuery.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, Prop['DataBase']);
  frWriteString(Stream, FQuery.Filter);
  frWriteString(Stream, Prop['DataSource']);
  frWriteMemo(Stream, FQuery.SelectSQL);
  frWriteBoolean(Stream, FQuery.Active);
  WriteFields(Stream);
  WriteParams(Stream);
end;

procedure TfrFIBQuery.Loaded;
begin
  Prop['DataSource'] := FFixupList['DataSource'];
  inherited Loaded;
end;

procedure TfrFIBQuery.RefreshParams;
var
  i: integer;
begin
if FQuery.Params.Count = 0 then
  begin
  FParams.Clear;
  Exit;
  end;
i := 0; while i < FParams.Count do
 if not Assigned(FQuery.Params.ByName[FParams.Name[i]]) then
  FParams.Delete(i) else Inc(i);
for i := 0 to pred(FQuery.Params.Count) do
 if FParams.IndexOf(FQuery.Params[i].Name) = -1 then
  FParams[FQuery.Params[i].Name] := '';
end;

procedure TfrFIBQuery.SQLEditor(Sender: TObject);
begin
  with TfrDBSQLEditorForm.Create(nil) do
  begin
    Query := FQuery;
    M1.Lines.Assign(FQuery.SelectSQL);
    if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) then
    begin
      FQuery.SelectSQL := M1.Lines;
      frDesigner.Modified := True;
      RefreshParams;
    end;
    Free;
  end;
end;

procedure TfrFIBQuery.ParamsEditor(Sender: TObject);
var
  OldParams : TfrVariables;
begin
RefreshParams;
if FQuery.Params.Count = 0 then Exit;
OldParams := TfrVariables.Create;
OldParams.Assign(FParams);
  try
  with TfrFIBParamsForm.Create(nil) do
    begin
    QueryComp := Self;
    Query := FQuery;
    Caption := Self.Name + ' ' + LoadStr(SParams);
    if ShowModal = mrOk then frDesigner.Modified := True
    else FParams.Assign(OldParams);
    Free;
    end;
  finally
  OldParams.Free;
  end;
end;

procedure TfrFIBQuery.ReadParams(Stream: TStream);
var
  i: Integer;
  w, n: Word;
begin
  FParams.Clear;
  Stream.Read(n, 2);
  for i := 0 to n - 1 do
  begin
    Stream.Read(w, 2); //ParamDataType
    Stream.Read(w, 2); //ParamKind
    if (i <= pred(FQuery.Params.Count)) and Assigned(FQuery.Params[i]) then
      FParams[FQuery.Params[i].Name] := frReadString(Stream);
  end;
end;

procedure TfrFIBQuery.WriteParams(Stream: TStream);
var
  i: Integer;
  w: Word;
begin
  w := FQuery.Params.Count;
  Stream.Write(w, 2);
  for i := 0 to FQuery.Params.Count - 1 do
    begin
    w := 8; Stream.Write(w, 2); //ParamDataType = frString
    w := 1; Stream.Write(w, 2); //ParamKind = pkValue
    frWriteString(Stream, FParams[FQuery.Params[i].Name]);
    end;
end;

procedure TfrFIBQuery.BeforeOpenQuery(DataSet: TDataSet);
var
  i: Integer;
  s: String;
  SaveView: TfrView;
  SavePage: TfrPage;
  SaveBand: TfrBand;

begin
  SaveView := CurView;
  CurView := nil;
  SavePage := CurPage;
  CurPage := ParentPage;
  SaveBand := CurBand;
  CurBand := nil;
  for i := 0 to FQuery.Params.Count - 1 do
  begin
    s := Trim(VarToStr(FParams[FQuery.Params[i].Name]));
    if (s <> '') and (DocMode = dmPrinting) then
      FQuery.Params[i].AsString := frParser.Calc(s);
  end;
  if Assigned(FQuery.Database) then
    if not FQuery.Database.Connected then FQuery.Database.Open;
  if Assigned(FQuery.Transaction) then
    if not FQuery.Transaction.Active then FQuery.Transaction.StartTransaction;
  CurView := SaveView;
  CurPage := SavePage;
  CurBand := SaveBand;
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_FIBQUERYCONTROL');
  frRegisterControl(TfrFIBQuery, Bmp, LoadStr(SInsertQuery));

finalization
  frUnregisterObject(TfrFIBQuery);
  Bmp.Free;

end.

