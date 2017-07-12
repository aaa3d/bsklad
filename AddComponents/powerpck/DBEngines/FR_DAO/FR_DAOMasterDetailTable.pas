
{******************************************}
{                                          }
{     FastReport v2.4 - Dao components     }
{       MasterDetail Table component       }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_DAOMasterDetailTable;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, DB, FR_DBSet, DAOMDTable, FR_DAOTable;

type
  TfrDAOMDTable = class(TfrDAODataSet)
  private
    FTableMD: TDAOMasterDetailTable;
    procedure JoinEditor(Sender: TObject);
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
  end;

implementation

uses FR_Utils, FR_Const, FR_DAOMd, FR_DBUtils;

{ TfrDAOMDTable }

constructor TfrDAOMDTable.Create;
begin
  inherited Create;
  FTableMD := TDAOMasterDetailTable.Create(frDialogForm);
  FDataSet := FTableMD;
  FDataSource.DataSet := FDataSet;

  Component := FTableMD;
  BaseName := 'MasterDetailTable';
  Bmp.LoadFromResourceName(hInstance, 'FR_DAOMDTABLE');
end;

destructor TfrDAOMDTable.Destroy;
begin
  FDataSet := nil;
  FTableMD.Free;
  inherited Destroy;
end;

procedure TfrDAOMDTable.DefineProperties;

  function GetIndexFieldNames: String;
  begin
    Result := '';
    try
      with FTableMD do
      if (TableName <> '') then
      begin
        Result := IndexFieldNames;
      end;
    except
    end;
  end;

  function GetMasterSource: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(FTableMD.Owner, TDataSet, sl, FTableMD);
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
    if FTableMD.Database <> nil then
    begin
      sl := TStringList.Create;
      FTableMD.DataBase.GetTableNames(sl);
      sl.Sort;
      for i := 0 to sl.Count - 1 do
        Result := Result + sl[i] + ';';
      sl.Free;
    end;
  end;

begin
  inherited DefineProperties;
  AddEnumProperty('IndexFieldNames', GetIndexFieldNames, [Null]);
  AddProperty('MasterFields', [frdtHasEditor, frdtOneObject], JoinEditor);
  AddEnumProperty('MasterSource', GetMasterSource, [Null]);
  AddProperty('Filter', [frdtString], nil);
  AddEnumProperty('TableName', GetTableNames, [Null]);
end;

procedure TfrDAOMDTable.SetPropValue(Index: String; Value: Variant);
var d: TDataset;
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'INDEXFIELDNAMES' then
   FTableMD.IndexFieldNames := Value
  else if Index = 'MASTERSOURCE' then
  begin
    d := frFindComponent(FTableMD.Owner, Value) as TDataSet;
    FTableMD.MasterSource := frGetDataSource(FTableMD.Owner, d);
  end
  else if Index = 'FILTER' then
  begin
    FTableMD.Filter := Value;
    FTableMD.Filtered := Trim(Value) <> '';
  end
  else if Index = 'TABLENAME' then
    FTableMD.TableName := Value
end;

function TfrDAOMDTable.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'INDEXFIELDNAMES' then
    Result := FTableMD.IndexFieldNames
  else if Index = 'MASTERSOURCE' then
    Result := frGetDataSetName(FTableMD.Owner, FTableMD.MasterSource)
  else if Index = 'FILTER' then
    Result := FTableMD.Filter
  else if Index = 'TABLENAME' then
    Result := FTableMD.TableName
end;

procedure TfrDAOMDTable.LoadFromStream(Stream: TStream);
begin
  FFixupList.Clear;
  inherited LoadFromStream(Stream);
  FFixupList['DataBase'] := frReadString(Stream);
  Prop['DataBase'] := FFixupList['DataBase'];
  FTableMD.TableName := frReadString(Stream);
  FTableMD.IndexFieldNames := frReadString(Stream);
  FTableMD.MasterFields := frReadString(Stream);
  FFixupList['MasterSource'] := frReadString(Stream);
  Prop['MasterSource'] := FFixupList['MasterSource'];
  FTableMD.Filter := frReadString(Stream);
  FTableMD.Filtered := Trim(FTableMD.Filter) <> '';

  FFixupList['Active'] := frReadBoolean(Stream);
  ReadFields(Stream);
  try
    FTableMD.Active := FFixupList['Active'];
  except;
  end;
end;

procedure TfrDAOMDTable.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, Prop['DataBase']);
  frWriteString(Stream, FTableMD.TableName);
  frWriteString(Stream, FTableMD.IndexFieldNames);
  frWriteString(Stream, FTableMD.MasterFields);
  frWriteString(Stream, Prop['MasterSource']);
  frWriteString(Stream, FTableMD.Filter);

  frWriteBoolean(Stream, FTableMD.Active);
  WriteFields(Stream);
end;

procedure TfrDAOMDTable.Loaded;
begin
  Prop['MasterSource'] := FFixupList['MasterSource'];
  inherited Loaded;
end;

procedure TfrDAOMDTable.JoinEditor(Sender: TObject);
begin
  with TfrDAOFieldsLinkForm.Create(nil) do
  begin
    MasterDS := frFindComponent(FTableMD.Owner, Prop['MasterSource']) as TDataSet;
    MasterDetailTable := FTableMD;
    if MasterDS <> nil then
    begin
      ShowModal;
      frDesigner.Modified := True;
    end;
    Free;
  end;
end;

var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_DAOMDTABLECONTROL');
  frRegisterControl(TfrDAOMDTable, Bmp, 'Insert MasterDetailTable');

finalization
  frUnRegisterObject(TfrDAOMDTable);
  Bmp.Free;

end.

