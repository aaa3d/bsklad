
{******************************************}
{                                          }
{     FastReport v2.4 - CTL components     }
{            Database component            }
{                                          }
{ Copyright (c) 1998-2001 by Chudinov A.   }
{                                          }
{******************************************}

unit FR_CTLDB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, DB, CTLibDatabase;

type
  TfrCTLComponents = class(TComponent) // fake component
  end;

  TfrCTLDatabase = class(TfrNonVisualControl)
  private
    FDatabase: TCTLibDatabase;
    procedure LinesEditor(Sender: TObject);
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
    property Database: TCTLibDatabase read FDatabase;
  end;


implementation

uses FR_Utils, FR_Const, FR_LEdit, FR_DBLookupCtl, FR_CTLTable, FR_CTLQuery;

{$R FR_CTL.RES}


{ TfrCTLDatabase }

constructor TfrCTLDatabase.Create;
begin
  inherited Create;
  FDatabase := TCTLibDatabase.Create(frDialogForm);
  Component := FDatabase;
  BaseName := 'Database';
  Bmp.LoadFromResourceName(hInstance, 'FR_CTLDB');
  Flags := Flags or flDontUndo;
end;

destructor TfrCTLDatabase.Destroy;
begin
  FDatabase.Free;
  inherited Destroy;
end;

procedure TfrCTLDatabase.DefineProperties;

  function GetDriverNames: String;
  var
    i, j: Integer;
    sl: TStringList;
    s: String;
  begin
    Result := '';
    sl := TStringList.Create;
//    Session.GetDriverNames(sl);
    sl.Sort;
    for i := 0 to sl.Count - 1 do
    begin
      s := sl[i];
      for j := 1 to Length(s) do
        if s[j] = ';' then
          s[j] := ',';
      Result := Result + s + ';';
    end;
    sl.Free;
  end;

begin
  inherited DefineProperties;
  AddProperty('Connected', [frdtBoolean], nil);
  AddProperty('CharSet', [frdtString], nil);
  AddProperty('DbName', [frdtString], nil);
  AddProperty('IniFile', [frdtString], nil);
  AddProperty('ServerName', [frdtString], nil);
  AddProperty('UserName', [frdtString], nil);
  AddProperty('Password', [frdtString], nil);
//  AddProperty('DatabaseName', [frdtString, frdtHasEditor], DBNameEditor);
//  AddEnumProperty('DriverName', GetDriverNames, [Null]);
  AddProperty('LoginPrompt', [frdtBoolean], nil);
  AddProperty('Params', [frdtHasEditor, frdtOneObject], LinesEditor);
  AddProperty('Params.Count', [], nil);
end;

procedure TfrCTLDatabase.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'DBNAME' then
    FDatabase.DbName := Value
  else if Index = 'SERVERNAME' then
    FDatabase.ServerName := Value
  else if Index = 'USERNAME' then
    FDatabase.UserName := Value
  else if Index = 'CHARSET' then
    FDatabase.CharSet := Value
  else if Index = 'INIFILE' then
    FDatabase.IniFile := Value
  else if Index = 'LOGINPROMPT' then
    FDatabase.LoginPrompt := Value
  else if Index = 'CONNECTED' then
    FDatabase.Connected := Value
  else if Index = 'PARAMS' then
    FDatabase.Params.Text := Value
  else if Index = 'PASSWORD' then
    FDatabase.Password := Value
end;

function TfrCTLDatabase.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DBNAME' then
    Result:= FDatabase.DbName
  else if Index = 'SERVERNAME' then
    Result:= FDatabase.ServerName
  else if Index = 'USERNAME' then
    Result:= FDatabase.UserName
  else if Index = 'CHARSET' then
    Result:= FDatabase.CharSet
  else if Index = 'INIFILE' then
    Result:= FDatabase.IniFile
  else if Index = 'LOGINPROMPT' then
    Result:= FDatabase.LoginPrompt
  else if Index = 'CONNECTED' then
    Result:= FDatabase.Connected
  else if Index = 'PARAMS' then
    Result:= FDatabase.Params.Text
  else if Index = 'PASSWORD' then
    Result:= FDatabase.Password
end;

function TfrCTLDataBase.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
  if Result = Null then
    Result := LinesMethod(FDataBase.Params, MethodName, 'PARAMS', Par1, Par2, Par3);
end;

procedure TfrCTLDatabase.LoadFromStream(Stream: TStream);
var
  s: String;
begin
  inherited LoadFromStream(Stream);
  FDatabase.DbName := frReadString(Stream);
  FDatabase.Password := frReadString(Stream);
  FDatabase.ServerName:=frReadString(Stream);
  FDatabase.UserName:=frReadString(Stream);
  FDatabase.Password:=frReadString(Stream);
  s := frReadString(Stream);
  FDatabase.LoginPrompt := frReadBoolean(Stream);
//Убран запрос имени пользователя и пароля
  FDatabase.LoginPrompt:=False;
//  FDatabase.Connected := frReadBoolean(Stream);
//  frReadMemo(Stream, FDatabase.Params);
  FDatabase.Connected := frReadBoolean(Stream);
end;

procedure TfrCTLDatabase.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteString(Stream, FDatabase.DbName);
  frWriteString(Stream, FDatabase.Password);
  frWriteString(Stream, FDatabase.ServerName);
  frWriteString(Stream, FDatabase.UserName);
  frWriteString(Stream, FDatabase.Password);
  frWriteBoolean(Stream, FDatabase.LoginPrompt);
  frWriteBoolean(Stream, FDatabase.Connected);
//  frWriteMemo(Stream, FDatabase.Params);
  frWriteBoolean(Stream, FDatabase.Connected);
end;

procedure TfrCTLDatabase.LinesEditor(Sender: TObject);
var
  sl: TStringList;
  SaveConnected: Boolean;
begin
  sl := TStringList.Create;
  try
//    Session.GetAliasParams(FDatabase.AliasName, sl);
  except;
  end;
  with TfrLinesEditorForm.Create(nil) do
  begin
    if FDatabase.Params.Text = '' then
      M1.Text := sl.Text else
      M1.Text := FDatabase.Params.Text;
    if (ShowModal = mrOk) and ((Restrictions and frrfDontModify) = 0) and
      M1.Modified then
    begin
      SaveConnected := FDatabase.Connected;
      FDatabase.Connected := False;
      FDatabase.Params.Text := M1.Text;
      FDatabase.Connected := SaveConnected;
      frDesigner.Modified := True;
    end;
    Free;
  end;
  sl.Free;
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_CTLDBCONTROL');
  frRegisterControl(TfrCTLDatabase, Bmp, IntToStr(SInsertDB));

finalization
  frUnRegisterObject(TfrCTLDatabase);
  Bmp.Free;

end.

