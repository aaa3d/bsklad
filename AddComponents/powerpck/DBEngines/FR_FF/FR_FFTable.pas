
{******************************************}
{                                          }
{     FastReport v2.4 - FF components      }
{             Table component              }
{                                          }
{ Unit created with FR NewEngin wizard.    }
{                                          }
{ All FlashFiler related changes are       }
{ Copyright (c) Eivind Bakkestuen.         }
{                                          }
{******************************************}

unit FR_FFTable;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, DB, DBTables, FFDB, FR_DBSet;

type
  TfrFFDataset = class(TfrNonVisualControl)
  protected
    FDataSet: TFFDataSet;
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

  TfrFFTable = class(TfrFFDataSet)
  private
    FTable: TFFTable;
    procedure JoinEditor(Sender: TObject);
  protected
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
  public
    constructor Create; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure DefineProperties; override;
    procedure Loaded; override;
    property Table: TFFTable read FTable;
  end;


function GetSessionNames: String;


implementation

uses
  {$IFDEF Delphi6}
  Variants,
  {$ENDIF}
  FR_DBUtils,
  FR_Utils,
  FR_Const,
  FR_LEdit,
  FR_DBFldEditor,
  FR_FFMd;


function GetSessionNames: String;
var
  i: Integer;
  sl: TStringList;
  ClientIdx : Integer;
begin
  Result := '';
  sl := TStringList.Create;
//    Assert(Assigned(Clients));
  Clients.BeginRead;                                                   {!!.02}
  try                                                                  {!!.02}
    for ClientIdx := 0 to Pred(Clients.Count) do
    begin
      WITH TffBaseClient(Clients[ClientIdx]) DO
      Begin
        FOR i := 0 TO SessionCount-1 DO
          sl.Add(Sessions[i].SessionName);
      End;
    end;
  finally                                                              {!!.02}
    Clients.EndRead;                                                   {!!.02}
  end;                                                                 {!!.02}

  sl.Sort;
  for i := 0 to sl.Count - 1 do
    Result := Result + sl[i] + ';';
  sl.Free;
end;



{ TfrFFDataSet }

constructor TfrFFDataSet.Create;
begin
  inherited Create;
  FDataSource := TDataSource.Create(frDialogForm);
  FDataSource.DataSet := nil;

  FDBDataSet := TfrDBDataSet.Create(frDialogForm);
  FDBDataSet.DataSource := FDataSource;

  Flags := Flags or flDontUndo;
end;

destructor TfrFFDataSet.Destroy;
begin
  FDBDataset.Free;
  FDataSource.Free;
  FDataSet.Free;
  inherited Destroy;
end;

procedure TfrFFDataSet.DefineProperties;

  function GetDatabaseNames: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    if Assigned(FDataset) and                               {!!.05}
       Assigned(FDataset.Session) then                      {!!.05}
      FDataset.Session.GetDatabaseNames(sl);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

begin
  inherited DefineProperties;
  AddProperty('Active', [frdtBoolean], nil);
  AddEnumProperty('DatabaseName', GetDatabaseNames, [Null]);
  AddProperty('Fields', [frdtHasEditor, frdtOneObject], FieldsEditor);
  AddProperty('FieldCount', [], nil);
  AddProperty('Filter', [frdtString], nil);
  AddProperty('EOF', [], nil);
  AddProperty('RecordCount', [], nil);
{$IFNDEF Delphi2}
  AddProperty('IsEmpty', [], nil);
{$ENDIF}
  AddEnumProperty('SessionName', GetSessionNames, [Null]);
end;

procedure TfrFFDataSet.SetPropValue(Index: String; Value: Variant);
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
  else if Index = 'DATABASENAME' then
  begin
    FDataSet.Close;
    FDataSet.DatabaseName := Value;
  end
  else if Index = 'FILTER' then
  begin
    FDataSet.Filter := Value;
    FDataSet.Filtered := Trim(Value) <> '';
  end
end;

function TfrFFDataSet.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'ACTIVE' then
    Result := FDataSet.Active
  else if Index = 'DATABASENAME' then
    Result := FDataSet.DatabaseName
  else if Index = 'FILTER' then
    Result := FDataSet.Filter
  else if Index = 'EOF' then
    Result := FDataSet.Eof
  else if Index = 'RECORDCOUNT' then
    Result := FDataSet.RecordCount
  else if Index = 'FIELDCOUNT' then
    Result := FDataSet.FieldCount
{$IFNDEF Delphi2}
  else if Index = 'ISEMPTY' then
    Result := FDataSet.IsEmpty
{$ENDIF}
end;

function TfrFFDataSet.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
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

procedure TfrFFDataSet.ReadFields(Stream: TStream);
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

procedure TfrFFDataSet.WriteFields(Stream: TStream);
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

procedure TfrFFDataSet.Loaded;
var
  i: Integer;
  s: String;
  ds: TDataSet;
  f: TField;
begin
// fixup component references
  try
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
    Prop['Active'] := FFixupList['Active'];
  except;
  end;
end;

procedure TfrFFDataSet.ShowEditor;
begin
  FieldsEditor(nil);
end;

procedure TfrFFDataSet.FieldsEditor(Sender: TObject);
var
  SaveActive: Boolean;
begin
  SaveActive := FDataSet.Active;
  FDataSet.Close;
  with TfrDBFieldsEditorForm.Create(nil) do
  begin
    DataSet := FDataSet;
    ShowModal;
    Free;
  end;
  frDesigner.BeforeChange;
  FDataSet.Active := SaveActive;
end;


{ TfrFFTable }

constructor TfrFFTable.Create;
begin
  inherited Create;
  FTable := TFFTable.Create(frDialogForm);
  FDataSet := TFFDataSet(FTable);
  FDataSource.DataSet := FDataSet;

  Component := FTable;
  BaseName := 'Table';
  Bmp.LoadFromResourceName(hInstance, 'FR_FFTABLE');
end;

procedure TfrFFTable.DefineProperties;

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

  function GetMasterSource: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(FTable.Owner, TDataSet, sl, FTable);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

  function GetTableNames: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    if FTable.DatabaseName <> '' then
    begin
      sl := TStringList.Create;
      if Assigned(FTable.Session) then
        FTable.Session.GetTableNames(FTable.DatabaseName, '', True, False, sl);
      sl.Sort;
      for i := 0 to sl.Count - 1 do
        Result := Result + sl[i] + ';';
      sl.Free;
    end;
  end;

begin
  inherited DefineProperties;
  AddEnumProperty('IndexName', GetIndexNames, [Null]);
  AddProperty('MasterFields', [frdtHasEditor, frdtOneObject], JoinEditor);
  AddEnumProperty('MasterSource', GetMasterSource, [Null]);
  AddEnumProperty('TableName', GetTableNames, [Null]);
  AddProperty('Timeout', [frdtInteger], nil);
end;

procedure TfrFFTable.SetPropValue(Index: String; Value: Variant);
var
  d: TDataset;
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'INDEXNAME' then
    FTable.IndexName := Value
  else if Index = 'MASTERSOURCE' then
  begin
    d := frFindComponent(FTable.Owner, Value) as TDataSet;
    FTable.MasterSource := frGetDataSource(FTable.Owner, d);
  end
  else if Index = 'TABLENAME' then
    FTable.TableName := Value
  else if Index = 'SESSIONNAME' then
    FTable.SessionName := Value
  else if Index = 'TIMEOUT' then
    FTable.Timeout := Value;
end;

function TfrFFTable.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'INDEXNAME' then
    Result := FTable.IndexName
  else if Index = 'MASTERSOURCE' then
    Result := frGetDataSetName(FTable.Owner, FTable.MasterSource)
  else if Index = 'TABLENAME' then
    Result := FTable.TableName
  else if Index = 'SESSIONNAME' then
    Result := FTable.SessionName
  else if Index = 'TIMEOUT' then
    Result := FTable.Timeout;
end;

procedure TfrFFTable.LoadFromStream(Stream: TStream);
begin
  FFixupList.Clear;
  inherited LoadFromStream(Stream);
  FTable.DatabaseName := frReadString(Stream);
  FTable.Filter := frReadString(Stream);
  FTable.Filtered := Trim(FTable.Filter) <> '';
  FTable.IndexName := frReadString(Stream);
  FTable.MasterFields := frReadString(Stream);
  FFixupList['MasterSource'] := frReadString(Stream);
  Prop['MasterSource'] := FFixupList['MasterSource'];
  FTable.TableName := frReadString(Stream);
  FFixupList['Active'] := frReadBoolean(Stream);
  ReadFields(Stream);
  FTable.SessionName := frReadString(Stream);
  FTable.Timeout := frReadInteger(Stream);
  try
    FTable.Active := FFixupList['Active'];
  except;
  end;
end;

procedure TfrFFTable.SaveToStream(Stream: TStream);
begin
  LVersion := 1;
  inherited SaveToStream(Stream);
  frWriteString(Stream, FTable.DatabaseName);
  frWriteString(Stream, FTable.Filter);
  frWriteString(Stream, FTable.IndexName);
  frWriteString(Stream, FTable.MasterFields);
  frWriteString(Stream, Prop['MasterSource']);
  frWriteString(Stream, FTable.TableName);
  frWriteBoolean(Stream, FTable.Active);
  WriteFields(Stream);
  frWriteString(Stream, FTable.SessionName);
  frWriteInteger(Stream, FTable.Timeout);
end;

procedure TfrFFTable.Loaded;
begin
  Prop['MasterSource'] := FFixupList['MasterSource'];
  inherited Loaded;
end;

procedure TfrFFTable.JoinEditor(Sender: TObject);
begin
  with TfrFFFieldsLinkForm.Create(nil) do
  begin
    MasterDS := frFindComponent(FTable.Owner, Prop['MasterSource']) as TDataSet;
    DetailDS := FTable;
    if MasterDS <> nil then
    begin
      ShowModal;
      frDesigner.BeforeChange;
    end;
    Free;
  end;
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_FFTABLECONTROL');
  frRegisterControl(TfrFFTable, Bmp, IntToStr(SInsertTable));

finalization
  frUnRegisterObject(TfrFFTable);
  Bmp.Free;

end.

