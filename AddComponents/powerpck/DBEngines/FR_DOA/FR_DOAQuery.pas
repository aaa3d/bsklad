{*******************************************}
{                                           }
{    FastReport v2.4 - DOA components       }
{           Database component              }
{                                           }
{ Copyright (c) 1998-2001 by Tzyganenko A.  }
{ Copyright (c) 2002 by Raschektaev Dmitry. }
{                                           }
{                                           }
{*******************************************}

unit FR_DOAQuery;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls,
  Forms, Menus, Dialogs, FR_Class, FR_Pars, FR_DBSet, DB,
  FR_DBUtils, Oracle,OracleData,OracleVarEdit,OracleTypes,OracleSQLEdit;

type
  // Trick to access the 'protected' part of TOracleDataSet
  TOracleDataSet = class(OracleData.TOracleDataSet)
  end;

type
  TfrDOADataset = class(TfrNonVisualControl)
  protected
    FDataSet: TOracleDataset;
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


  TfrDOAQuery = class(TfrDOADataset)
  private
    FQuery: TOracleDataset;
    FParams: TfrVariables;
    procedure SQLEditor(Sender: TObject);
    procedure ParamsEditor(Sender: TObject);

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
    property Query: TOracleDataset read FQuery;
    property ParamKind[Index: Integer]: TfrParamKind read GetParamKind write SetParamKind;
    property ParamText[Index: Integer]: String read GetParamText write SetParamText;
  end;

implementation

uses
  FR_LEdit, FR_DBFldEditor, FR_Utils, FR_Const, FR_DBSQLEdit;


{ TfrDOADataset }

constructor TfrDOADataset.Create;
begin
  inherited Create;
  FDataSource := TDataSource.Create(frDialogForm);
  FDataSource.DataSet := nil;
  FDBDataSet := TfrDBDataSet.Create(frDialogForm);
  FDBDataSet.DataSource := FDataSource;


  Flags := Flags or flDontUndo;
end;

destructor TfrDOADataset.Destroy;
begin
  FDBDataset.Free;
  FDataSource.Free;
  FDataSet.Free;
  inherited Destroy;
end;

procedure TfrDOADataset.DefineProperties;

  function GetDatabases: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(frDialogForm, TOracleSession, sl, nil);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

begin
  inherited DefineProperties;
  AddProperty('Active', [frdtBoolean], nil);
  AddEnumProperty('Session', GetDatabases, [Null]);
//  AddProperty('Fields', [frdtHasEditor, frdtOneObject], FieldsEditor);
  AddProperty('FieldCount', [], nil);
  AddProperty('Filter', [frdtString], nil);
  AddProperty('EOF', [], nil);
  AddProperty('RecordCount', [], nil);
end;

procedure TfrDOADataset.SetPropValue(Index: String; Value: Variant);
var d: TOracleSession;
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'ACTIVE' then
    FDataSet.Active := Value
  else if Index = 'SESSION' then
  begin
    d := frFindComponent(FDataSet.Owner, Value) as TOracleSession;
    FDataSet.Session := d;
  end
  else if Index = 'FILTER' then
  begin
    FDataSet.Filter := Value;
    FDataSet.Filtered := Trim(Value) <> '';
  end;
end;

function TfrDOADataset.GetPropValue(Index: String): Variant;
  function frGetDataBaseName(Owner: TComponent; d: TOracleSession): String;
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
  else if Index = 'SESSION' then
    Result := frGetDataBaseName(FDataSet.Owner, FDataSet.Session)
  else if Index = 'FILTER' then
    Result := FDataSet.Filter
  else if Index = 'EOF' then
    Result := FDataSet.Eof;
end;

function TfrDOADataset.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
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
//  else if MethodName = 'FETCHALL' then
//    FDataSet.FetchAll
end;

procedure TfrDOADataset.ReadFields(Stream: TStream);
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

procedure TfrDOADataset.WriteFields(Stream: TStream);
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

procedure TfrDOADataset.Loaded;
var
  i: Integer;
  s: String;
  ds: TDataSet;
  f: TField;
begin
// fixup component references
  try
    Prop['Session'] := FFixupList['Session'];
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

procedure TfrDOADataset.ShowEditor;
begin
  FieldsEditor(nil);
end;

procedure TfrDOADataset.FieldsEditor(Sender: TObject);
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



{ TfrDOAQuery }

constructor TfrDOAQuery.Create;
begin
  inherited Create;
  FQuery := TOracleDataSet.Create(frDialogForm);
  FQuery.ReadOnly:=true;
  FQuery.BeforeOpen := BeforeOpenQuery;
  FDataSet := FQuery;
  FDataSource.DataSet := FDataSet;

  FParams := TfrVariables.Create;

  Component := FQuery;
  BaseName := 'Query';
  Bmp.LoadFromResourceName(hInstance, 'FR_DOAQUERY');
end;

destructor TfrDOAQuery.Destroy;
begin
  FParams.Free;
  inherited Destroy;
end;

procedure TfrDOAQuery.DefineProperties;

  function GetMasterSource: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(FQuery.Owner, TOracleDataset, sl, FQuery);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

begin
  inherited DefineProperties;
  AddEnumProperty('Master', GetMasterSource, [Null]);
  AddProperty('MasterField', [frdtString], nil);
  AddProperty('Params', [frdtHasEditor], ParamsEditor);
  AddProperty('SQL', [frdtHasEditor], SQLEditor);
  AddProperty('SQL.Count', [], nil);
  AddProperty('StringFieldsOnly', [frdtBoolean], nil);

end;

procedure TfrDOAQuery.SetPropValue(Index: String; Value: Variant);
var
  d: TOracleDataset;
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'NAME' then
  begin
    FDataSource.Name := 'S' + FDataSet.Name;
    FDBDataSet.Name := '_' + FDataSet.Name;
  end
  else
  if Index = 'MASTER' then
  begin

    d := frFindComponent(FQuery.Owner, Value) as TOracleDataset;
    FQuery.Master := d;

  end
  else if Index = 'SQL' then
    FQuery.SQL.Text := Value
  else if Index = 'MASTERFIELD' then
    FQuery.MasterFields := Value
  else if Index = 'STRINGFIELDSONLY' then
    FQuery.StringFieldsOnly:= Value


end;

function TfrDOAQuery.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'MASTER' then
    begin
      if FQuery.Master<>nil then
        Result:=FQuery.Master.Name
      else Result:='';
    end
  else if Index = 'SQL' then
    Result := FQuery.SQL.Text
  else if Index = 'SQL.Count' then
    Result := FQuery.SQL.Count
  else if Index = 'RECORDCOUNT' then
    Result := FDataSet.RecordCount
  else if Index = 'FIELDCOUNT' then
    Result := FDataSet.FieldCount
  else if Index = 'MASTERFIELD' then
    Result:=FQuery.MasterFields
  else if Index = 'STRINGFIELDSONLY' then
    Result:=FQuery.StringFieldsOnly


end;

function TfrDOAQuery.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
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

procedure TfrDOAQuery.LoadFromStream(Stream: TStream);
var
  s: String;
begin
  FFixupList.Clear;
  inherited LoadFromStream(Stream);

  FFixupList['Session'] := frReadString(Stream);
  Prop['Session'] := FFixupList['Session'];

  FQuery.Filter := frReadString(Stream);
  FQuery.Filtered := Trim(FQuery.Filter) <> '';
  s := frReadString(Stream);
  FFixupList['Master'] := s;
  Prop['Master'] := FFixupList['Master'];

  FQuery.MasterFields := frReadString(Stream);

  frReadMemo(Stream, FQuery.SQL);
  FFixupList['Active'] := frReadBoolean(Stream);

  FQuery.StringFieldsOnly:= frReadBoolean(Stream);

  ReadFields(Stream);
  ReadParams(Stream);
  try
    FQuery.Active := FFixupList['Active'];
  except;
  end;
end;

procedure TfrDOAQuery.SaveToStream(Stream: TStream);
begin
  LVersion := 1;
  inherited SaveToStream(Stream);

  frWriteString(Stream, Prop['Session']);

  frWriteString(Stream, FQuery.Filter);
  frWriteString(Stream, Prop['Master']);

  frWriteString(Stream, FQuery.MasterFields);

  frWriteMemo(Stream, FQuery.SQL);
  frWriteBoolean(Stream, FQuery.Active);

  frWriteBoolean(Stream, FQuery.StringFieldsOnly);

  WriteFields(Stream);
  WriteParams(Stream);
end;

procedure TfrDOAQuery.Loaded;
begin
  Prop['Master'] := FFixupList['Master'];
  inherited Loaded;
end;

procedure TfrDOAQuery.SQLEditor(Sender: TObject);

begin

  ExecuteSQLEditor(FQuery.InternalQuery);

end;

procedure TfrDOAQuery.ParamsEditor(Sender: TObject);

begin
  ExecuteVariablesEditor(TVariables(FQuery.Variables).Owner as TOracleQuery);
end;

function TfrDOAQuery.GetParamKind(Index: Integer): TfrParamKind;
begin
  Result := pkValue;
end;

procedure TfrDOAQuery.SetParamKind(Index: Integer; Value: TfrParamKind);
begin
end;

function TfrDOAQuery.GetParamText(Index: Integer): String;
begin
  Result := FQuery.GetVariable(Index);
end;

procedure TfrDOAQuery.SetParamText(Index: Integer; Value: String);
begin
    FQuery.SetVariable(Index,Value);
end;

procedure TfrDOAQuery.ReadParams(Stream: TStream);
var
  i: Integer;
   n, VType: Word;
  VName:string;


begin
  Stream.Read(n, 2);
  for i := 0 to n - 1 do
  with FQuery do
  begin
    Stream.Read(VType, 2);
    VName:=frReadString(Stream);
    DeclareVariable(VName,VType);
    // if compatible type (possible declare otCursor as result in pl/sql block for example)
    if not (VType in [otCLOB,otBLOB,otBFile,otReference,otObject,otCursor]) then
      ParamText[i] := frReadString(Stream);
  end;

end;

procedure TfrDOAQuery.WriteParams(Stream: TStream);
var
  i: Integer; w,VType: Word;
begin
  w := FQuery.VariableCount;
  Stream.Write(w, 2);
  for i := 0 to FQuery.VariableCount - 1 do
  with FQuery do
  begin
    VType:=VariableType(i);
    Stream.Write(VType, 2);

    frWriteString(Stream, VariableName(i));
    // if compatible type
    if not (VType in [otCLOB,otBLOB,otBFile,otReference,otObject,otCursor]) then
      frWriteString(Stream, ParamText[i]);
  end;
end;

procedure TfrDOAQuery.BeforeOpenQuery(DataSet: TDataSet);
var

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

  CurView := SaveView;
  CurPage := SavePage;
  CurBand := SaveBand;
end;

var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_DOAQUERY');
  frRegisterControl(TfrDOAQuery, Bmp, IntToStr(SInsertQuery));
finalization
  frUnregisterObject(TfrDOAQuery);
  Bmp.Free;

end.

