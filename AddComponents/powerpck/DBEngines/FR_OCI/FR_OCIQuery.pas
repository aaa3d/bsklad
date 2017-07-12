{******************************************}
{                                          }
{     FastReport v2.4 - OCI components     }
{             Query component              }
{                                          }
{        Copyright (c) 2000 by EMS         }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{ Copyright (c) 2001 by Andre Romashchenko }
{                                          }
{******************************************}

unit FR_OCIQuery;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls,
  Forms, Menus, Dialogs, FR_Class, FR_Pars, FR_DBSet, DB,
  FR_DBUtils, NCOci, NCOciWrapper, NCOciDB;

type
  TfrOCIDataset = class(TfrNonVisualControl)
  protected
    FDataSet: TOCIQuery;
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


  TfrOCIQuery = class(TfrOCIDataSet)
  private
    FQuery: TOCIQuery;
    FParams: TfrVariables;
    procedure SQLEditor(Sender: TObject);
    procedure ParamsEditor(Sender: TObject);
    procedure OptionsEditor(Sender: TObject);
    procedure ReadParams(Stream: TStream);
    procedure WriteParams(Stream: TStream);
    function GetParamKind(Index: Integer): TfrParamKind;
    procedure SetParamKind(Index: Integer; Value: TfrParamKind);
    function GetParamText(Index: Integer): String;
    procedure SetParamText(Index: Integer; Value: String);
    procedure BeforeOpenQuery(DataSet: TDataSet);
  protected
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
    function DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure DefineProperties; override;
    procedure Loaded; override;
    property Query: TOCIQuery read FQuery;
    property ParamKind[Index: Integer]: TfrParamKind read GetParamKind write SetParamKind;
    property ParamText[Index: Integer]: String read GetParamText write SetParamText;
  end;

implementation

uses
  FR_LEdit, FR_DBFldEditor, FR_Utils, FR_Const, FR_DBSQLEdit,
  FR_OCIQueryParam, NCOciParams, FR_OCIQueryOptions;

{ TfrOCIDataSet }

constructor TfrOCIDataSet.Create;
begin
  inherited Create;
  FDataSource := TDataSource.Create(frDialogForm);
  FDataSource.DataSet := nil;

  FDBDataSet := TfrDBDataSet.Create(frDialogForm);
  FDBDataSet.DataSource := FDataSource;

  Flags := Flags or flDontUndo;
end;

destructor TfrOCIDataSet.Destroy;
begin
  FDBDataset.Free;
  FDataSource.Free;
  FDataSet.Free;
  inherited Destroy;
end;

procedure TfrOCIDataSet.DefineProperties;

  function GetDatabases: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    TOCIDatabase.GetObjectsList('', sl, '', okDatabase, True);
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

procedure TfrOCIDataSet.SetPropValue(Index: String; Value: Variant);
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
    FDataSet.Close;
    FDataSet.DatabaseName := Value;
  end
  else if Index = 'FILTER' then
  begin
    FDataSet.Filter := Value;
    FDataSet.Filtered := Trim(Value) <> '';
  end;
end;

function TfrOCIDataSet.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'ACTIVE' then
    Result := FDataSet.Active
  else if Index = 'DATABASE' then
    Result := FDataSet.DatabaseName
  else if Index = 'FILTER' then
    Result := FDataSet.Filter
  else if Index = 'EOF' then
    Result := FDataSet.Eof;
end;

function TfrOCIDataSet.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
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

procedure TfrOCIDataSet.ReadFields(Stream: TStream);
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

procedure TfrOCIDataSet.WriteFields(Stream: TStream);
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

procedure TfrOCIDataSet.Loaded;
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

procedure TfrOCIDataSet.ShowEditor;
begin
  FieldsEditor(nil);
end;

procedure TfrOCIDataSet.FieldsEditor(Sender: TObject);
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



{ TfrOCIQuery }

constructor TfrOCIQuery.Create;
begin
  inherited Create;
  FQuery := TOCIQuery.Create(frDialogForm);
  FQuery.BeforeOpen := BeforeOpenQuery;
  FDataSet := FQuery;
  FDataSource.DataSet := FDataSet;

  FParams := TfrVariables.Create;

  Component := FQuery;
  BaseName := 'Query';
  Bmp.LoadFromResourceName(hInstance, 'FR_OCIQUERY');
end;

destructor TfrOCIQuery.Destroy;
begin
  FParams.Free;
  inherited Destroy;
end;

procedure TfrOCIQuery.DefineProperties;

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
  AddProperty('ReadOnly', [frdtBoolean], OptionsEditor);
  AddProperty('Unidirectional', [frdtBoolean], nil);
  AddProperty('Options', [frdtHasEditor], OptionsEditor);
end;

procedure TfrOCIQuery.SetPropValue(Index: String; Value: Variant);
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
    FQuery.SQL.Text := Value
  else if Index = 'READONLY' then
    FQuery.ReadOnly:= Value
  else if Index = 'UNIDIRECTIONAL' then
    FQuery.Unidirectional:= Value;
end;

function TfrOCIQuery.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATASOURCE' then
    Result := frGetDataSetName(FQuery.Owner, FQuery.DataSource)
  else if Index = 'SQL' then
    Result := FQuery.SQL.Text
  else if Index = 'SQL.Count' then
    Result := FQuery.SQL.Count
  else if Index = 'RECORDCOUNT' then
    Result := FDataSet.RecordCount
  else if Index = 'FIELDCOUNT' then
    Result := FDataSet.FieldCount
  else if Index = 'READONLY' then
    Result := FQuery.ReadOnly
  else if Index = 'UNIDIRECTIONAL' then
    Result := FQuery.Unidirectional;
end;

function TfrOCIQuery.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
  if Result = Null then
    Result := LinesMethod(FQuery.SQL, MethodName, 'SQL', Par1, Par2, Par3);
  if MethodName = 'EXECSQL' then
  begin
    BeforeOpenQuery(FQuery);
    FQuery.ExecSQL
  end;
end;

procedure TfrOCIQuery.LoadFromStream(Stream: TStream);
var
  s: String;
begin
  FFixupList.Clear;
  inherited LoadFromStream(Stream);
  FQuery.DatabaseName := frReadString(Stream);
  FQuery.Filter := frReadString(Stream);
  FQuery.Filtered := Trim(FQuery.Filter) <> '';
  s := frReadString(Stream);
  FFixupList['DataSource'] := s;
  Prop['DataSource'] := FFixupList['DataSource'];
  frReadMemo(Stream, FQuery.SQL);
  FFixupList['Active'] := frReadBoolean(Stream);
  FQuery.ReadOnly:= frReadBoolean(Stream);
  FQuery.Unidirectional:= frReadBoolean(Stream);

  FQuery.DataFormat.AssignDateFormat:= frReadString(Stream);
  FQuery.DataFormat.AssignDateTimeFormat:= frReadString(Stream);
  FQuery.DataFormat.DateFormat:= frReadString(Stream);
  FQuery.DataFormat.DateTimeFormat:= frReadString(Stream);
  FQuery.DataFormat.FixedMacroChar:= Char(frReadByte(Stream));
  FQuery.DataFormat.SQLMacroChar:= Char(frReadByte(Stream));
  FQuery.DataFormat.EnableBCD:= frReadBoolean(Stream);
  FQuery.DataFormat.EnableFixedString:= frReadBoolean(Stream);
  FQuery.DataFormat.EnableInteger:= frReadBoolean(Stream);
  FQuery.DataFormat.EnableLongString:= frReadBoolean(Stream);
  FQuery.DataFormat.EnableNumber:= frReadBoolean(Stream);
  FQuery.DataFormat.EnableRequired:= frReadBoolean(Stream);
  FQuery.DataFormat.StrsEmpty2Null:= frReadBoolean(Stream);
  FQuery.DataFormat.StrsTrim:= frReadBoolean(Stream);

  FQuery.FetchParams.FetchAll:= frReadBoolean(Stream);
  FQuery.FetchParams.PieceBuffOwn:= frReadBoolean(Stream);
  FQuery.FetchParams.FetchExact:= frReadInteger(Stream);
  FQuery.FetchParams.InrecDataSize:= frReadInteger(Stream);
  FQuery.FetchParams.PieceBuffSize:= frReadInteger(Stream);
  FQuery.FetchParams.RowsetSize:= frReadInteger(Stream);

  ReadFields(Stream);
  ReadParams(Stream);
  try
    FQuery.Active := FFixupList['Active'];
  except;
  end;
end;

procedure TfrOCIQuery.SaveToStream(Stream: TStream);
begin
  LVersion := 1;
  inherited SaveToStream(Stream);
  frWriteString(Stream, FQuery.DatabaseName);
  frWriteString(Stream, FQuery.Filter);
  frWriteString(Stream, Prop['DataSource']);
  frWriteMemo(Stream, FQuery.SQL);
  frWriteBoolean(Stream, FQuery.Active);
  frWriteBoolean(Stream, FQuery.ReadOnly);
  frWriteBoolean(Stream, FQuery.Unidirectional);
  frWriteString(Stream, FQuery.DataFormat.AssignDateFormat);
  frWriteString(Stream, FQuery.DataFormat.AssignDateTimeFormat);
  frWriteString(Stream, FQuery.DataFormat.DateFormat);
  frWriteString(Stream, FQuery.DataFormat.DateTimeFormat);
  frWriteByte(Stream, Byte(FQuery.DataFormat.FixedMacroChar));
  frWriteByte(Stream, Byte(FQuery.DataFormat.SQLMacroChar));
  frWriteBoolean(Stream, FQuery.DataFormat.EnableBCD);
  frWriteBoolean(Stream, FQuery.DataFormat.EnableFixedString);
  frWriteBoolean(Stream, FQuery.DataFormat.EnableInteger);
  frWriteBoolean(Stream, FQuery.DataFormat.EnableLongString);
  frWriteBoolean(Stream, FQuery.DataFormat.EnableNumber);
  frWriteBoolean(Stream, FQuery.DataFormat.EnableRequired);
  frWriteBoolean(Stream, FQuery.DataFormat.StrsEmpty2Null);
  frWriteBoolean(Stream, FQuery.DataFormat.StrsTrim);

  frWriteBoolean(Stream, FQuery.FetchParams.FetchAll);
  frWriteBoolean(Stream, FQuery.FetchParams.PieceBuffOwn);
  frWriteInteger(Stream, FQuery.FetchParams.FetchExact);
  frWriteInteger(Stream, FQuery.FetchParams.InrecDataSize);
  frWriteInteger(Stream, FQuery.FetchParams.PieceBuffSize);
  frWriteInteger(Stream, FQuery.FetchParams.RowsetSize);

  WriteFields(Stream);
  WriteParams(Stream);
end;

procedure TfrOCIQuery.Loaded;
begin
  Prop['DataSource'] := FFixupList['DataSource'];
  inherited Loaded;
end;

procedure TfrOCIQuery.SQLEditor(Sender: TObject);
begin
  with TfrDBSQLEditorForm.Create(nil) do
  begin
    Query := FQuery;
    M1.Lines.Assign(FQuery.SQL);
{$IFDEF QBUILDER}
    QBEngine := TfrQBOCIEngine.Create(nil);
    TfrQBOCIEngine(QBEngine).Query := FQuery;
    QBEngine.DatabaseName := FQuery.DatabaseName;
{$ENDIF}
    if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) then
    begin
      FQuery.SQL := M1.Lines;
      frDesigner.Modified := True;
    end;
{$IFDEF QBUILDER}
    QBEngine.Free;
{$ENDIF}
    Free;
  end;
end;

procedure TfrOCIQuery.ParamsEditor(Sender: TObject);
var
  Params: TParams;
  ParamValues: TfrVariables;
begin
  if FQuery.Params.Count > 0 then
  begin
    Params := TParams.Create;
    Params.Assign(FQuery.Params);
    ParamValues := TfrVariables.Create;
    ParamValues.Assign(FParams);
    with TfrOCIParamsForm.Create(nil) do
    begin
      QueryComp := Self;
      Query := FQuery;
      Caption := Self.Name + ' ' + frLoadStr(SParams);
      if ShowModal = mrOk then
        frDesigner.Modified := True
      else
      begin
        FQuery.Params.Assign(Params);
        FParams.Assign(ParamValues);
      end;
      Free;
    end;
    Params.Free;
    ParamValues.Free;
  end;
end;

function TfrOCIQuery.GetParamKind(Index: Integer): TfrParamKind;
begin
  Result := pkValue;
  if not FQuery.Params[Index].Bound then
    Result := pkAssignFromMaster;
end;

procedure TfrOCIQuery.SetParamKind(Index: Integer; Value: TfrParamKind);
begin
  if Value = pkAssignFromMaster then
  begin
    FQuery.Params[Index].Bound := False;
    FParams.Delete(FParams.IndexOf(FQuery.Params[Index].Name));
  end
  else
  begin
    FQuery.Params[Index].Clear;
    FQuery.Params[Index].Bound := True;
    FParams[FQuery.Params[Index].Name] := '';
  end;
end;

function TfrOCIQuery.GetParamText(Index: Integer): String;
begin
  Result := '';
  if ParamKind[Index] = pkValue then
    Result := FParams[FQuery.Params[Index].Name];
end;

procedure TfrOCIQuery.SetParamText(Index: Integer; Value: String);
begin
  if ParamKind[Index] = pkValue then
    FParams[FQuery.Params[Index].Name] := Value;
end;

procedure TfrOCIQuery.ReadParams(Stream: TStream);
var
  i: Integer;
  w, n: Word;
begin
  Stream.Read(n, 2);
  for i := 0 to n - 1 do
  with FQuery.Params[i] do
  begin
    Stream.Read(w, 2);
    DataType := ParamTypes[w];
    Stream.Read(w, 2);
    ParamKind[i] := TfrParamKind(w);
    ParamText[i] := frReadString(Stream);
  end;
end;

procedure TfrOCIQuery.WriteParams(Stream: TStream);
var
  i: Integer;
  w: Word;
begin
  w := FQuery.Params.Count;
  Stream.Write(w, 2);
  for i := 0 to FQuery.Params.Count - 1 do
  with FQuery.Params[i] do
  begin
    for w := 0 to 10 do
      if DataType = ParamTypes[w] then
        break;
    Stream.Write(w, 2);
    w := Word(ParamKind[i]);
    Stream.Write(w, 2);
    frWriteString(Stream, ParamText[i]);
  end;
end;

procedure TfrOCIQuery.BeforeOpenQuery(DataSet: TDataSet);
var
  i: Integer;
  SaveView: TfrView;
  SavePage: TfrPage;
  SaveBand: TfrBand;

  function DefParamValue(Param: TOciParam): String;
  begin
    {if Param.DataType in [ftDate, ftDateTime] then
      Result := '01.01.00'
    else if Param.DataType = ftTime then
      Result := '00:00'
    else
      Result := '0';}
  end;

begin
  SaveView := CurView;
  CurView := nil;
  SavePage := CurPage;
  CurPage := ParentPage;
  SaveBand := CurBand;
  CurBand := nil;
  i := 0;
  try
    while i < FQuery.Params.Count do
    begin
      if ParamKind[i] = pkValue then
        if DocMode = dmPrinting then
          FQuery.Params[i].Text := frParser.Calc(ParamText[i]) else
          FQuery.Params[i].Text := DefParamValue(FQuery.Params[i]);
      Inc(i);
    end;
  except
    Memo.Clear;
    Memo.Add(ParamText[i]);
    CurView := Self;
    raise;
  end;
  CurView := SaveView;
  CurPage := SavePage;
  CurBand := SaveBand;
end;

procedure TfrOCIQuery.OptionsEditor(Sender: TObject);
begin
  TfrOCIQueryOptions.ShowfrOCIQueryOptions(FQuery);
end;

var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_OCIQUERYCONTROL');
  frRegisterControl(TfrOCIQuery, Bmp, LoadStr(SInsertQuery));

finalization
  frUnregisterObject(TfrOCIQuery);
  Bmp.Free;

end.

