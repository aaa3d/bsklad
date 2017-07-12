
{******************************************}
{                                          }
{    FastReport v2.4 - Dao components      }
{           Database component             }
{                                          }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{                                          }
{******************************************}

unit FR_DAODB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, DB, DAOdatabase;

type
  TfrDAOComponents = class(TComponent) // fake component
  end;

  TfrDAODatabase = class(TfrNonVisualControl)
  private
    FDatabase: TDAODatabase;
    procedure DBNameEditor(Sender: TObject);
    procedure SDBNameEditor(Sender: TObject);
    function Encrypt(const S: String; Key: Word): String;
    function Decrypt(const S: String; Key: Word): String;
  protected
    procedure SetPropValue(Index: String; Value: Variant); override;
    function GetPropValue(Index: String): Variant; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    procedure DefineProperties; override;
    procedure ShowEditor; override;
    property Database: TDAODatabase read FDatabase;
  end;


implementation

{$R FRDAO5.RES}

uses
  FR_Utils, FR_Const, FR_LEdit, FR_DAOTable, FR_DAOQuery;


{ TfrDAODatabase }

const
 C1 = 75187;
 C2 = 34658;

constructor TfrDAODatabase.Create;
begin
  inherited Create;
  FDatabase := TDAODataBase.Create(frDialogForm);
  FDatabase.DAOVersion := Dao36;
  Component := FDatabase;
  BaseName := 'Database';
  Bmp.LoadFromResourceName(hInstance, 'FR_DAODB');
  Flags := Flags or flDontUndo;
end;

destructor TfrDAODatabase.Destroy;
begin
  FDatabase.Free;
  inherited Destroy;
end;

procedure TfrDAODatabase.DefineProperties;
begin
  inherited DefineProperties;
  AddProperty('Connected', [frdtBoolean], nil);
  AddEnumProperty('DAOVersion', 'Dao35;Dao36;', [Null]);
  AddProperty('Databasename', [frdtString], DBNameEditor);
  AddProperty('Password', [frdtString], nil);
  AddProperty('SystemDB', [frdtString], SDBNameEditor);

  AddProperty('CreateWorkspace', [frdtBoolean], nil);
  AddProperty('Ws_UserName', [frdtString], nil);
  AddProperty('Ws_Password', [frdtString], nil);
end;

procedure TfrDAODatabase.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'DATABASENAME' then
    FDatabase.Databasename := Value
  else if Index = 'SYSTEMDB' then
    FDatabase.SystemDB := Value
  else if Index = 'PASSWORD' then
    FDatabase.Password := Value
  else if Index = 'CONNECTED' then
    FDatabase.Connected := Value

  else if Index = 'CREATEWORKSPACE' then
    FDatabase.CreateWorkspace := Value
  else if Index = 'WS_USERNAME' then
    FDatabase.Workspace.UserName := Value
  else if Index = 'WS_PASSWORD' then
    FDatabase.Workspace.Password := Value

  else if Index = 'DAOVERSION' then
    if Value = 'Dao35' then
      FDatabase.DAOVersion := Dao35 else
      FDatabase.DAOVersion := Dao36
end;

function TfrDAODatabase.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATABASENAME' then
    Result := FDataBase.Databasename
  else if Index = 'SYSTEMDB' then
    Result := FDataBase.SystemDB
  else if Index = 'PASSWORD' then
    Result := FDataBase.Password
  else if Index = 'CONNECTED' then
    Result := FDataBase.Connected

  else if Index = 'CREATEWORKSPACE' then
    Result := FDataBase.CreateWorkspace
  else if Index = 'WS_USERNAME' then
    Result := FDataBase.Workspace.UserName
  else if Index = 'WS_PASSWORD' then
    Result := FDataBase.Workspace.Password

  else if Index = 'DAOVERSION' then
    if FDataBase.DAOVersion = Dao35 then
      Result := 'Dao35' else
      Result := 'Dao36'
end;

procedure TfrDAODatabase.LoadFromStream(Stream: TStream);
begin
  inherited LoadFromStream(Stream);
  FDatabase.Databasename := frReadString(Stream);
  FDatabase.SystemDB := frReadString(Stream);
  FDatabase.Password := Decrypt(frReadString(Stream), 19755);
  FDatabase.Connected := frReadBoolean(Stream);

  FDatabase.CreateWorkspace := frReadBoolean(Stream);
  FDatabase.Workspace.UserName := frReadString(Stream);
  FDatabase.Workspace.Password := frReadString(Stream);

  Prop['DAOVersion'] := frReadString(Stream);
end;

procedure TfrDAODatabase.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, FDatabase.Databasename);
  frWriteString(Stream, FDatabase.SystemDB);
  frWriteString(Stream, Encrypt(FDatabase.Password, 19755));
  frWriteBoolean(Stream, FDatabase.Connected);

  frWriteBoolean(Stream, FDatabase.CreateWorkspace);
  frWriteString(Stream, FDatabase.Workspace.UserName);
  frWriteString(Stream, FDatabase.Workspace.Password);

  frWriteString(Stream, Prop['DAOVersion']);
end;

procedure TfrDAODatabase.ShowEditor;
begin
  DBNameEditor(nil);
end;

procedure TfrDAODatabase.DBNameEditor(Sender: TObject);
var
  SaveConnected: Boolean;
begin
  SaveConnected := FDatabase.Connected;
  FDatabase.Connected := False;
  with TOpenDialog.Create(nil) do
  begin
    InitialDir := GetCurrentDir();
    Filter := 'Databases (*.mdb;*.mde)|*.mdb;*.mde|All files (*.*)|*.*';
    if Execute then
      FDatabase.Databasename := FileName;
    Free;
  end;
  FDatabase.Connected := SaveConnected;
end;

procedure TfrDAODatabase.SDBNameEditor(Sender: TObject);
var
  SaveConnected: Boolean;
begin
  SaveConnected := FDatabase.Connected;
  FDatabase.Connected := False;
  with TOpenDialog.Create(nil) do
  begin
    InitialDir := GetCurrentDir();
    Filter := 'System Database (*.mdw)|*.mdw|All files (*.*)|*.*';
    if Execute then
      FDatabase.SystemDB := FileName;
    Free;
  end;
  FDatabase.Connected := SaveConnected;
end;


function TfrDAODatabase.Encrypt(const S: String; Key: Word): String;
var
  I: Byte;
begin
  Result := S;
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(Result[I]) + Key) * C1 + C2;
  end;
end;

function TfrDAODatabase.Decrypt(const S: String; Key: Word): String;
var
  I: Byte;
begin
  Result := S;
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(S[I]) + Key) * C1 + C2;
  end;
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_DAODBCONTROL');
  frRegisterControl(TfrDAODatabase, Bmp, LoadStr(SInsertDB));

finalization
  frUnRegisterObject(TfrDAODatabase);
  Bmp.Free;

end.

