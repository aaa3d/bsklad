
{******************************************}
{                                          }
{     FastReport v2.4 - IBO components     }
{             Table component              }
{                                          }
{        Copyright (c) 2000 by EMS         }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_IB_Dataset;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, DB, FR_DBSet, IB_Components, IB_Schema;

type
  TfrIB_Dataset = class(TfrNonVisualControl)
  protected
    FDataSet: TIB_BDataSet;
    FDataSource: TIB_DataSource;
    FDBDataSet: TfrDBDataset;
    procedure SQLEditor(Sender: TObject);
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

  TfrIB_BDataset = class(TfrIB_Dataset)
  private
    FBDataset: TIB_BDataset;
  protected
    procedure QueryEditor(Sender: TObject);
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure ShowEditor; override;
    property BDataset: TIB_BDataset read FBDataset;
  end;


implementation

uses FR_DBUtils, FR_Utils, FR_Const, FR_LEdit,
     Registry, IBF_SQL, IBF_Query, IB_Constants, IB_Editors;

function FixRegEntries( OldKey, NewKey: string ): string;
begin
  with TRegistry.Create do try
    MoveKey( OldKey, NewKey, False );
    DeleteKey( OldKey );
  finally
    Free;
  end;
  Result := NewKey;
end;

{ TfrIB_Dataset }

constructor TfrIB_Dataset.Create;
begin
  inherited Create;
  FDataSource := TIB_DataSource.Create(frDialogForm);
  FDataSource.DataSet := nil;

  FDBDataSet := TfrDBDataSet.Create(frDialogForm);
  FDBDataSet.DataSource := FDataSource;

  Flags := Flags or flDontUndo;
end;

destructor TfrIB_Dataset.Destroy;
begin
  FDBDataset.Free;
  FDataSource.Free;
  FDataSet.Free;
  inherited Destroy;
end;

procedure TfrIB_Dataset.DefineProperties;

  function GetConnections: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    frGetComponents(frDialogForm, TIB_Connection, sl, nil);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

begin
  inherited DefineProperties;
  AddProperty('Active', [frdtBoolean], nil);
  AddEnumProperty('IB_Connection', GetConnections, [Null]);
  AddProperty('Filter', [frdtString], nil);
  AddProperty('EOF', [], nil);
  AddProperty('RecordCount', [], nil);
  AddProperty('IsEmpty', [], nil);
end;

procedure TfrIB_Dataset.SetPropValue(Index: String; Value: Variant);
var
  d : TIB_Connection;
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
  else if Index = 'IB_RCONNECTION' then
  begin
    d := frFindComponent(FDataSet.Owner, Value) as TIB_Connection;
    FDataSet.IB_Connection := d;
  end
  else if Index = 'FILTER' then
  begin
    FDataSet.Filter := Value;
    FDataSet.Filtered := Trim(Value) <> '';
  end;
end;

function TfrIB_Dataset.GetPropValue(Index: String): Variant;

  function frGetConnectionName(Owner: TComponent; d: TIB_Connection): String;
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
  else if Index = 'IB_CONNECTION' then
    Result := frGetConnectionName(FDataSet.Owner, FDataSet.IB_Connection)
  else if Index = 'FILTER' then
    Result := FDataSet.Filter
  else if Index = 'EOF' then
    Result := FDataSet.Eof
  else if Index = 'RECORDCOUNT' then
    Result := FDataSet.RecordCount
  else if Index = 'ISEMPTY' then
    Result := FDataSet.IsEmpty
end;

function TfrIB_Dataset.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
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

procedure TfrIB_Dataset.Loaded;
var
  i: Integer;
  s: String;
//  ds: TIB_DataSet;
  f: TIB_Column;
begin
// fixup component references
  try
    Prop['DataBase'] := FFixupList['DataBase'];
    for i := 0 to FFixupList.Count - 1 do
    begin
      s := FFixupList.Name[i];
      if s[1] = '.' then // lookup field
      begin
        f := FDataSet.FindField(Copy(s, 2, 255));
//        ds := frFindComponent(FDataSet.Owner, FFixupList.Value[i]) as TIB_DataSet;
//        f.LookupDataset := ds;
      end
    end;
//    Prop['Active'] := FFixupList['Active'];
  except;
  end;
end;

procedure TfrIB_Dataset.ShowEditor;
begin
  SQLEditor(nil);
end;

procedure TfrIB_Dataset.SQLEditor(Sender: TObject);
var
  SaveActive: Boolean;
begin
  SaveActive := FDataSet.Active;
  FDataSet.Close;
  with TfrmSQL.Create( Application ) do try
    pnClose.Visible := true;
    StatusBar.Visible := false;
    tsLayouts.TabVisible := false;
    dsForEdit.Dataset := Component as TIB_Dataset;
    with Component as TIB_Statement do begin
      csForEdit.IB_Connection := IB_Connection;
      tsForEdit.IB_Transaction := IB_Transaction;
    end;
    BaseKey := FixRegEntries( 'Software\IB Objects\Editor',
                              IB_BASEKEY + '\Editors\Dataset' );
    ShowModal;
//    if SaveSettings or SettingsSaved then begin
//      Self.Designer.Modified;
//    end;
  finally
    Free;
  end;
  FDataSet.Active := SaveActive;
end;


{ TfrIB_BDataset }

constructor TfrIB_BDataset.Create;
begin
  inherited Create;
  FBDataset := TIB_BDataset.Create(frDialogForm);
end;

destructor TfrIB_BDataset.Destroy;
begin
  FBDataSet.Free;
  inherited Destroy;
end;

procedure TfrIB_BDataset.QueryEditor(Sender: TObject);
var
  SaveActive: Boolean;
begin
  SaveActive := FDataSet.Active;
  FDataSet.Close;
  with TfrmQuery.Create( Application ) do try
    Caption := Component.Owner.Name + '.' +
               Component.Name       + ' - ' +
               Caption;
    pnClose.Visible := true;
    StatusBar.Visible := false;
    dsQuerySource.Dataset := Component as TIB_BDataset;
    with Component as TIB_BDataset do begin
      if Assigned( MasterSource ) then begin
        dsMasterSource.Dataset := MasterSource.Dataset;
      end;
      BaseConnection := IB_Connection;
      BaseTransaction := IB_Transaction;
    end;
    BaseKey := FixRegEntries( 'Software\IB Objects\BDataset Editor',
                              IB_BASEKEY + '\Editors\BDataset' );
    btOk.Default := false;
    ShowModal;
//    if ( SaveSettings or SettingsSaved ) and
//       Assigned( Self.Designer ) then begin
//      Self.Designer.Modified;
//    end;
  finally
    Free;
  end;
  FDataSet.Active := SaveActive;
end;

procedure TfrIB_BDataset.ShowEditor;
begin
  QueryEditor(nil);
end;

end.

