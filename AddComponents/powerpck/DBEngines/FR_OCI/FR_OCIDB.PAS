{******************************************}
{                                          }
{    FastReport v2.4 - OCI components      }
{           Database component             }
{                                          }
{        Copyright (c) 2000 by EMS         }
{ Copyright (c) 1998-2000 by Tzyganenko A. }
{ Copyright (c) 2001 by Andre Romashchenko }
{                                          }
{******************************************}

unit FR_OCIDB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, Db, NCOciDB;

type
  TfrOCIComponents = class(TComponent) // fake component
  end;

  TfrOCIDatabase = class(TfrNonVisualControl)
  private
    FDatabase: TOCIDatabase;
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
  end;


implementation

uses
  FR_Utils, FR_DBUtils, FR_Const, FR_LEdit, FR_DBLookupCtl, FR_OCIQuery;

{$R FR_OCI.RES}


{ TfrOCIDatabase }

constructor TfrOCIDatabase.Create;
begin
  inherited Create;
  FDatabase := TOCIDatabase.Create(frDialogForm);
  Component := FDatabase;
  BaseName := 'Database';
  Bmp.LoadFromResourceName(hInstance, 'FR_OCIDB');
  Flags := Flags or flDontUndo;
end;

destructor TfrOCIDatabase.Destroy;
begin
  FDatabase.Free;
  inherited Destroy;
end;

procedure TfrOCIDatabase.DefineProperties;

  function GetServerName: String;
  var
    List: TStringList;
    i: Integer;
    db: String;
  begin
    List := TStringList.Create;
    try
      //db := FDatabase.DatabaseName;
      db := '';
      TOCIDatabase.GetObjectsList(db, List, '', okService, True);
      for i := 0 to List.Count - 1 do
        Result := Result + List[i] + ';';
    finally
      List.Free;
    end;
  end;
begin
  inherited DefineProperties;
  AddProperty('Connected', [frdtBoolean], nil);
  AddProperty('DatabaseName', [frdtString], nil);
  AddProperty('LoginPrompt', [frdtBoolean], nil);
  AddEnumProperty('ServerName', GetServerName, [Null]);
  AddProperty('Password', [frdtString], nil);
  AddProperty('UserName', [frdtString], nil);
end;

procedure TfrOCIDatabase.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'DATABASENAME' then
    FDatabase.DatabaseName := Value
  else if Index = 'SERVERNAME' then
    FDatabase.ServerName := Value
  else if Index = 'LOGINPROMPT' then
    FDatabase.LoginPrompt := Value
  else if Index = 'CONNECTED' then
    FDatabase.Connected := Value
  else if Index = 'PASSWORD' then
    FDatabase.Password := Value
  else if Index = 'USERNAME' then
    FDatabase.UserName := Value
end;

function TfrOCIDatabase.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATABASENAME' then
    Result := FDatabase.DatabaseName
  else if Index = 'SERVERNAME' then
    Result := FDatabase.ServerName
  else if Index = 'LOGINPROMPT' then
    Result := FDatabase.LoginPrompt
  else if Index = 'CONNECTED' then
    Result := FDatabase.Connected
  else if Index = 'PASSWORD' then
    Result := FDatabase.Password
  else if Index = 'USERNAME' then
    Result := FDatabase.UserName
end;

function TfrOCIDataBase.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  //Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
 // if Result = Null then
  //  Result := LinesMethod(FDataBase.DBParams, MethodName, 'PARAMS', Par1, Par2, Par3);
end;

procedure TfrOCIDatabase.LoadFromStream(Stream: TStream);
var
  s: String;
begin
  inherited LoadFromStream(Stream);
  FDatabase.DatabaseName := frReadString(Stream);
  s := frReadString(Stream);
  if s <> '' then
    FDatabase.ServerName := s;
  FDatabase.UserName:= frReadString(Stream);
  s := frReadString(Stream);
  if s <> '' then
    FDatabase.Password := s;
  FDatabase.LoginPrompt := frReadBoolean(Stream);
  FDatabase.Connected := frReadBoolean(Stream);
end;

procedure TfrOCIDatabase.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, FDatabase.DatabaseName);
  frWriteString(Stream, FDatabase.ServerName);
  frWriteString(Stream, FDatabase.UserName);
  frWriteString(Stream, FDatabase.Password);
  frWriteBoolean(Stream, FDatabase.LoginPrompt);
  frWriteBoolean(Stream, FDatabase.Connected);
end;

var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_OCIDBCONTROL');
  frRegisterControl(TfrOCIDatabase, Bmp, LoadStr(SInsertDB));

finalization
  frUnregisterObject(TfrOCIDatabase);
  Bmp.Free;

end.
