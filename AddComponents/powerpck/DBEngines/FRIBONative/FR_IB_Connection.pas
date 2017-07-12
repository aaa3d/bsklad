{******************************************}
{                                          }
{    FastReport v2.4 - IBO components      }
{           Connection component           }
{                                          }
{        Copyright (c) 2000 by EMS         }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_IB_Connection;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, DB, IB_Components;

type
  TfrIB_Components = class(TComponent) // fake component
  end;

  TfrIB_Connection = class(TfrNonVisualControl)
  private
    FConnection: TIB_Connection;
    FTransaction: TIB_Transaction;
    procedure LinesEditor(Sender: TObject);
    procedure SQLEditor(Sender: TObject);
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
    procedure ShowEditor; override;
    property Connection: TIB_Connection read FConnection;
  end;


implementation

uses
  FR_Utils, FR_DBUtils, FR_Const, FR_LEdit, FR_DBLookupCtl, FR_IB_Dataset, FR_IB_Query,
  Registry, IBF_SQL, IB_Constants, IB_Editors;

{$R FR_IBO.RES}

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

{ TfrIB_Connection }

constructor TfrIB_Connection.Create;
begin
  inherited Create;
  FConnection := TIB_Connection.Create(frDialogForm);
  FTransaction := TIB_Transaction.Create(frDialogForm);
//  FConnection.DefaultTransaction := FTransaction;
  Component := FConnection;
  BaseName := 'frConnection';
  Bmp.LoadFromResourceName(hInstance, 'FR_IB_CONNECTION');
  Flags := Flags or flDontUndo;
end;

destructor TfrIB_Connection.Destroy;
begin
  FTransaction.Free;
  FConnection.Free;
  inherited Destroy;
end;

procedure TfrIB_Connection.DefineProperties;
begin
  inherited DefineProperties;
  AddProperty('Connected', [frdtBoolean], nil);
  AddProperty('DatabaseName', [frdtString], SQLEditor);
  AddProperty('LoginPrompt', [frdtBoolean], nil);
  AddProperty('Password', [frdtString], nil);
  AddProperty('Params', [frdtHasEditor, frdtOneObject], LinesEditor);
  AddProperty('Params.Count', [], nil);
  AddProperty('SQLDialect', [frdtInteger], nil);
end;

procedure TfrIB_Connection.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'DATABASENAME' then
    FConnection.DatabaseName := Value
  else if Index = 'PASSWORD' then
    FConnection.Password := Value
  else if Index = 'LOGINPROMPT' then
    FConnection.LoginPrompt := Value
  else if Index = 'CONNECTED' then begin
    FConnection.Connected := Value;
    if Assigned(FConnection.DefaultTransaction) then
//      FConnection.DefaultTransaction.Active := Value;
  end
  else if Index = 'PARAMS' then
    FConnection.Params.Text := Value
  else if Index = 'SQLDIALECT' then
    FConnection.SQLDialect := Value
end;

function TfrIB_Connection.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATABASENAME' then
    Result := FConnection.DatabaseName
  else if Index = 'PASSWORD' then
    Result := FConnection.Password
  else if Index = 'LOGINPROMPT' then
    Result := FConnection.LoginPrompt
  else if Index = 'CONNECTED' then
    Result := FConnection.Connected
  else if Index = 'PARAMS.COUNT' then
    Result := FConnection.Params.Count
  else if Index = 'PARAMS' then
    Result := FConnection.Params.Text
  else if Index = 'SQLDIALECT' then
    Result := FConnection.SQLDialect
end;

function TfrIB_Connection.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
  if Result = Null then
    Result := LinesMethod(FConnection.Params, MethodName, 'PARAMS', Par1, Par2, Par3);
end;

procedure TfrIB_Connection.LoadFromStream(Stream: TStream);
begin
  inherited LoadFromStream(Stream);
  FConnection.DatabaseName := frReadString(Stream);
  FConnection.LoginPrompt := frReadBoolean(Stream);
  FConnection.Password := frReadString(Stream);
  if HVersion * 10 + LVersion > 20 then
    FConnection.SQLDialect := frReadInteger(Stream);
  frReadMemo(Stream, FConnection.Params);
  FConnection.Connected := frReadBoolean(Stream);
end;

procedure TfrIB_Connection.SaveToStream(Stream: TStream);
begin
  LVersion := 1;
  inherited SaveToStream(Stream);
  frWriteString(Stream, FConnection.DatabaseName);
  frWriteBoolean(Stream, FConnection.LoginPrompt);
  frWriteString(Stream, FConnection.Password);
  frWriteInteger(Stream, FConnection.SQLDialect);
  frWriteMemo(Stream, FConnection.Params);
  frWriteBoolean(Stream, FConnection.Connected);
end;

procedure TfrIB_Connection.LinesEditor(Sender: TObject);
var
  sl: TStringList;
  SaveConnected: Boolean;
begin
  sl := TStringList.Create;
  with TfrLinesEditorForm.Create(nil) do
  begin
    if FConnection.Params.Text = '' then
      M1.Text := sl.Text else
      M1.Text := FConnection.Params.Text;
    if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) and
      M1.Modified then
    begin
      SaveConnected := FConnection.Connected;
      FConnection.Connected := False;
      FConnection.Params.Text := M1.Text;
      FConnection.Connected := SaveConnected;
      frDesigner.Modified := True;
    end;
    Free;
  end;
  sl.Free;
end;

procedure TfrIB_Connection.ShowEditor;
begin
  SQLEditor(nil);
end;

procedure TfrIB_Connection.SQLEditor(Sender: TObject);
var
  SaveConnected: Bool;
begin
  SaveConnected := FConnection.Connected;
  FConnection.Connected := False;
  with TfrmSQL.Create( Application ) do
  try
    pnClose.Visible := true;
    tsLayouts.TabVisible := false;
    StatusBar.Visible := false;
    csForEdit.IB_Connection := Component as TIB_Connection;
    BaseKey := FixRegEntries( 'Software\IB Objects\Editor',
                              IB_BASEKEY + '\Editors\Connection' );
    ShowModal;
//    if SaveSettings or SettingsSaved then begin
//      Self.Designer.Modified;
//    end;
  finally
    Free;
  end;
  FConnection.Connected := SaveConnected;
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_IB_CONNECTIONCONTROL');
  frRegisterControl(TfrIB_Connection, Bmp, IntToStr(SInsertDB));

finalization
  frUnRegisterObject(TfrIB_Connection);
  Bmp.Free;

end.

