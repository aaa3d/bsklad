
{******************************************}
{                                          }
{     FastReport v2.4 - Dao components     }
{             Table component              }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_DAOTable;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, DB, FR_DBSet, DAODatabase, DAOTable, DAODataset;

type
  TfrDAODataset = class(TfrNonVisualControl)
  protected
    FDataSet: TDAODataSet;
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

  TfrDAOTable = class(TfrDAODataSet)
  private
    FTable: TDAOTable;
//    procedure JoinEditor(Sender: TObject);
  protected
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure DefineProperties; override;
    procedure Loaded; override;
    property Table: TDAOTable read FTable;
  end;


implementation

uses FR_DBUtils, FR_Utils, FR_Const, FR_LEdit, FR_DAOMd, FR_DBFldEditor;


{ TfrDAODataSet }

constructor TfrDAODataSet.Create;
begin
  inherited Create;
  FDataSource := TDataSource.Create(frDialogForm);
  FDataSource.DataSet := nil;

  FDBDataSet := TfrDBDataSet.Create(frDialogForm);
  FDBDataSet.DataSource := FDataSource;

  Flags := Flags or flDontUndo;
end;

destructor TfrDAODataSet.Destroy;
begin
  FDBDataset.Free;
  FDataSource.Free;
  FDataSet.Free;
  inherited Destroy;
end;

procedure TfrDAODataSet.DefineProperties;

  function GetDatabases: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(frDialogForm, TDAODatabase, sl, nil);
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
  AddProperty('EOF', [], nil);
  AddProperty('FieldCount', [], nil);
  AddProperty('RecordCount', [], nil);
end;

procedure TfrDAODataSet.SetPropValue(Index: String; Value: Variant);
var d : TDAODatabase;
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
    d := frFindComponent(FDataSet.Owner, Value) as TDAODatabase;
    FDataSet.Database := d;
  end;
end;

function TfrDAODataSet.GetPropValue(Index: String): Variant;

  function frGetDataBaseName(Owner: TComponent; d: TDAODatabase): String;
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
  else if Index = 'EOF' then
    Result := FDataSet.Eof
  else if Index = 'RECORDCOUNT' then
    Result := FDataSet.RecordCount
  else if Index = 'FIELDCOUNT' then
    Result := FDataSet.FieldCount
end;

function TfrDAODataSet.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
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
end;

procedure TfrDAODataSet.ReadFields(Stream: TStream);
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

procedure TfrDAODataSet.WriteFields(Stream: TStream);
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

procedure TfrDAODataSet.Loaded;
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

procedure TfrDAODataSet.ShowEditor;
begin
  FieldsEditor(nil);
end;

procedure TfrDAODataSet.FieldsEditor(Sender: TObject);
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


{ TfrDAOTable }

constructor TfrDAOTable.Create;
begin
  inherited Create;
  FTable := TDAOTable.Create(frDialogForm);
  FDataSet := FTable;
  FDataSource.DataSet := FDataSet;

  Component := FTable;
  BaseName := 'Table';
  Bmp.LoadFromResourceName(hInstance, 'FR_DAOTABLE');
end;

destructor TfrDAOTable.Destroy;
begin
  FDataSet := nil;
  FTable.Free;
  inherited Destroy;
end;

procedure TfrDAOTable.DefineProperties;

  function GetIndexNames: String;
  var
    i: Integer;
  begin
    Result := '';
    try
      with FTable do
      if (TableName <> '') and (IndexDefs <> nil) then
      begin
        IndexDefs.Update;
        for i := 0 to IndexDefs.Count - 1 do
          if IndexDefs[i].Name <> '' then
            Result := Result + IndexDefs[i].Name + ';';
      end;
    except;
    end;
  end;

  function GetIndexFieldNames: String;
  begin
    Result := '';
    try
      with FTable do
      if (TableName <> '') then
      begin
        Result := IndexFieldNames;
      end;
    except
    end;
  end;

  function GetTableNames: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    if FTable.Database <> nil then
    begin
      sl := TStringList.Create;
      FTable.DataBase.GetTableNames(sl);
      sl.Sort;
      for i := 0 to sl.Count - 1 do
        Result := Result + sl[i] + ';';
      sl.Free;
    end;
  end;

begin
  inherited DefineProperties;
  AddEnumProperty('IndexName', GetIndexNames, [Null]);
  AddEnumProperty('IndexFieldNames', GetIndexFieldNames, [Null]);
  AddEnumProperty('TableName', GetTableNames, [Null]);
end;

procedure TfrDAOTable.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'INDEXNAME' then
    FTable.IndexName := Value
  else if Index = 'INDEXFIELDNAMES' then
    FTable.IndexFieldNames := Value
  else if Index = 'TABLENAME' then
    FTable.TableName := Value
end;

function TfrDAOTable.GetPropValue(Index: String): Variant;
begin
 Index := AnsiUpperCase(Index);
 Result := inherited GetPropValue(Index);
 if Result <> Null then Exit;
 if Index = 'INDEXNAME' then
  Result := FTable.IndexName
 else if Index = 'INDEXFIELDNAMES' then
  Result := FTable.IndexFieldNames
 else if Index = 'TABLENAME' then
  Result := FTable.TableName
end;

procedure TfrDAOTable.LoadFromStream(Stream: TStream);
begin
  FFixupList.Clear;
  inherited LoadFromStream(Stream);
  FFixupList['DataBase'] := frReadString(Stream);
  Prop['DataBase'] := FFixupList['DataBase'];
  FTable.TableName := frReadString(Stream);
  FTable.IndexName := frReadString(Stream);
  FTable.IndexFieldNames := frReadString(Stream);
  FFixupList['Active'] := frReadBoolean(Stream);
  ReadFields(Stream);
  try
    FTable.Active := FFixupList['Active'];
  except;
  end;
end;

procedure TfrDAOTable.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, Prop['DataBase']);
  frWriteString(Stream, FTable.TableName);
  frWriteString(Stream, FTable.IndexName);
  frWriteString(Stream, FTable.IndexFieldNames);
  frWriteBoolean(Stream, FTable.Active);
  WriteFields(Stream);
end;

procedure TfrDAOTable.Loaded;
begin
  inherited Loaded;
end;

{procedure TfrDAOTable.JoinEditor(Sender: TObject);
begin
  with TfrDAOFieldsLinkForm.Create(nil) do
  begin
    MasterDS := frFindComponent(FTable.Owner, Prop['MasterSource']) as TDataSet;
    DetailDS := FTable;
    if MasterDS <> nil then
    begin
      ShowModal;
      frDesigner.Modified := True;
    end;
    Free;
  end;
end;}


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_DAOTABLECONTROL');
  frRegisterControl(TfrDAOTable, Bmp, LoadStr(SInsertTable));

finalization
  frUnRegisterObject(TfrDAOTable);
  Bmp.Free;

end.

