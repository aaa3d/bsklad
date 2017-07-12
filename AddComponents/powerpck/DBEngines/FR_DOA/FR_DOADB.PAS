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

unit FR_DOADB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, Db, Oracle,OracleCI;

type
  TfrDOAComponents = class(TComponent) 
  end;

  TfrDOADatabase = class(TfrNonVisualControl)
  private
    FDatabase: TOracleSession;
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
  FR_Utils, FR_DBUtils, FR_Const, FR_LEdit, FR_DBLookupCtl, FR_DOAQuery;

{$R FR_DOA.RES}


{ TfrDOADatabase }

constructor TfrDOADatabase.Create;
begin
  inherited Create;
  FDatabase := TOracleSession.Create(frDialogForm);
  Component := FDatabase;
  BaseName := 'Database';
  Bmp.LoadFromResourceName(hInstance, 'FR_DOASESSION');
  Flags := Flags or flDontUndo;
end;

destructor TfrDOADatabase.Destroy;
begin
  FDatabase.Free;
  inherited Destroy;
end;

procedure TfrDOADatabase.DefineProperties;

  function GetServerNames: String;
  var List:TStringList;
      i:integer;  
  begin
    BuildOracleAliasList;
    try
      List:=OracleAliasList;
      for i := 0 to List.Count - 1 do
        Result := Result + List[i] + ';';
    finally
//      List.Free;
    end;

  end;

begin
  inherited DefineProperties;
  AddProperty('Connected', [frdtBoolean], nil);
  AddEnumProperty('LogonDatabase', GetServerNames, [Null]);
  AddProperty('LogonPassword', [frdtString], nil);
  AddProperty('LogonUsername', [frdtString], nil);
end;

procedure TfrDOADatabase.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'LOGONDATABASE' then
    FDatabase.LogonDatabase := Value
  else if Index = 'CONNECTED' then
    FDatabase.Connected := Value
  else if Index = 'LOGONPASSWORD' then
    FDatabase.LogonPassword := Value
  else if Index = 'LOGONUSERNAME' then
    FDatabase.LogonUsername := Value
end;

function TfrDOADatabase.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
   if Index = 'LOGONDATABASE' then
    Result := FDatabase.LogonDatabase
  else if Index = 'CONNECTED' then
    Result := FDatabase.Connected
  else if Index = 'LOGONPASSWORD' then
    Result := FDatabase.LogonPassword
  else if Index = 'LOGONUSERNAME' then
    Result := FDatabase.LogonUsername
end;

function TfrDOADatabase.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  //Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
 // if Result = Null then
  //  Result := LinesMethod(FDataBase.DBParams, MethodName, 'PARAMS', Par1, Par2, Par3);
end;

procedure TfrDOADatabase.LoadFromStream(Stream: TStream);
var
  s: String;
begin
  inherited LoadFromStream(Stream);

  s := frReadString(Stream);
  if s <> '' then
    FDatabase.LogonDatabase := s;

  FDatabase.LogonUsername:= frReadString(Stream);

  s := frReadString(Stream);
  if s <> '' then
    FDatabase.LogonPassword := s;

  FDatabase.Connected := frReadBoolean(Stream);
end;

procedure TfrDOADatabase.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);

  frWriteString(Stream, FDatabase.LogonDatabase);
  frWriteString(Stream, FDatabase.LogonUsername);
  frWriteString(Stream, FDatabase.LogonPassword);

  frWriteBoolean(Stream, FDatabase.Connected);
end;

var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_DOASESSION');
  frRegisterControl(TfrDOADatabase, Bmp, IntToStr(SInsertDB));
finalization
  frUnregisterObject(TfrDOADatabase);
  Bmp.Free;

end.
