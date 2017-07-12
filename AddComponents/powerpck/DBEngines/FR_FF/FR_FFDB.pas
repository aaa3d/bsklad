
{******************************************}
{                                          }
{     FastReport v2.4 - FF components      }
{            Database component            }
{                                          }
{ Unit created with FR NewEngin wizard.    }
{                                          }
{ All FlashFiler related changes are       }
{ Copyright (c) Eivind Bakkestuen.         }
{                                          }
{******************************************}

unit FR_FFDB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, DB, FFDB;

type
  TfrFFComponents = class(TComponent) // fake component
  end;

  TfrFFDatabase = class(TfrNonVisualControl)
  private
    FDatabase: TFFDatabase;
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
    property Database: TFFDatabase read FDatabase;
  end;


implementation

uses
{$IFDEF Delphi6}
  Variants,
{$ENDIF}
  FR_Utils,
  FR_Const,
  FR_LEdit,
  FR_DBLookupCtl,
  FR_FFTable,
  FR_FFQuery,
  FFClrEng,
  FFLLLgcy,
  FFLLProt;

{$R FR_FF.RES}


{ TfrFFDatabase }

constructor TfrFFDatabase.Create;
begin
  inherited Create;
  FDatabase := TFFDatabase.Create(frDialogForm);
  FDatabase.Timeout := 2000;
  Component := FDatabase;
  BaseName := 'Database';
  Bmp.LoadFromResourceName(hInstance, 'FR_FFDB');
  Flags := Flags or flDontUndo;
end;

destructor TfrFFDatabase.Destroy;
begin
  FDatabase.Free;
  inherited Destroy;
end;

procedure TfrFFDatabase.DefineProperties;

  function GetAliasNames: String;
  var
    i: Integer;
    sl: TStringList;
  begin
    Result := '';
    sl := TStringList.Create;
    try
      Session.GetAliasNames(sl);
    except
    end;
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      Result := Result + sl[i] + ';';
    sl.Free;
  end;

  function GetTransportNames: String;
  begin
    Result := 'Registry;Single User;TCP/IP;IPX/SPX;';
  end;

begin
  inherited DefineProperties;
  AddProperty('Connected', [frdtBoolean], nil);
  AddEnumProperty('TransportName', GetTransportNames, [Null]);
  AddProperty('ServerName', [frdtString], nil);
  AddEnumProperty('AliasName', GetAliasNames, [Null]);
  AddProperty('DatabaseName', [frdtString], nil);
  AddProperty('Timeout', [frdtInteger], nil);
end;

procedure TfrFFDatabase.SetPropValue(Index: String; Value: Variant);
begin
  inherited SetPropValue(Index, Value);
  Index := AnsiUpperCase(Index);
  if Index = 'CONNECTED' then
    FDatabase.Connected := Value
  else if (Index = 'TRANSPORTNAME') AND (FDatabase.ServerEngine IS TFFRemoteServerEngine) then
  Begin
    TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Enabled := False;
    IF (Value='Registry') OR (Value='') THEN
      TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Protocol := ptRegistry
    Else
    IF Value='Single User' THEN
      TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Protocol := ptSingleUser
    Else
    IF Value='TCP/IP' THEN
      TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Protocol := ptTCPIP
    Else
    IF Value='IPX/SPX' THEN
      TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Protocol := ptIPXSPX;
    TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Enabled := True;
  End
  else if (Index = 'SERVERNAME') AND (FDatabase.ServerEngine IS TFFRemoteServerEngine) then
    TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).ServerName := Value
  else if Index = 'ALIASNAME' then
    FDatabase.AliasName := Value
  else if Index = 'DATABASENAME' then
    FDatabase.DatabaseName := Value
  else if Index = 'TIMEOUT' then
    FDatabase.Timeout := Value;
end;

function TfrFFDatabase.GetPropValue(Index: String): Variant;
begin
  Index := AnsiUpperCase(Index);
  Result := inherited GetPropValue(Index);
  if Result <> Null then Exit;
  if Index = 'DATABASENAME' then
    Result := FDatabase.DatabaseName
  else if (Index = 'TRANSPORTNAME') AND (FDatabase.ServerEngine IS TFFRemoteServerEngine) then
  Begin
    CASE TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Protocol OF
      ptRegistry   : Result := 'Registry';
      ptSingleUser : Result := 'Single User';
      ptTCPIP      : Result := 'TCP/IP';
      ptIPXSPX     : Result := 'IPX/SPX';
    End;
  End
  else if (Index = 'SERVERNAME') AND (FDatabase.ServerEngine IS TFFRemoteServerEngine) then
    Result := TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).ServerName
  else if Index = 'CONNECTED' then
    Result := FDatabase.Connected
  else if Index = 'ALIASNAME' then
    Result := FDatabase.AliasName
  else if Index = 'TIMEOUT' then
    Result := FDatabase.Timeout;
end;

function TfrFFDataBase.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
  Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
{ params not supported
  if Result = Null then
    Result := LinesMethod(FDataBase.Params, MethodName, 'PARAMS', Par1, Par2, Par3);}
end;

procedure TfrFFDatabase.LoadFromStream(Stream: TStream);
var
  s: String;
begin
  inherited LoadFromStream(Stream);
  FDatabase.Connected := frReadBoolean(Stream);
  s := frReadString(Stream);
  { transportname }
  if {(s <> '') AND} (FDatabase.ServerEngine IS TFFRemoteServerEngine) then
  Begin
    TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Enabled := False;
    IF (s='Registry') OR (s='') THEN
      TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Protocol := ptSingleUser
    Else
    IF s='Single User' THEN
      TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Protocol := ptSingleUser
    Else
    IF s='TCP/IP' THEN
      TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Protocol := ptTCPIP
    Else
    IF s='IPX/SPX' THEN
      TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Protocol := ptIPXSPX;
    TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Enabled := True;
  End;
  s := frReadString(Stream);
  { servername }
  if (s <> '') AND (FDatabase.ServerEngine IS TFFRemoteServerEngine) then
    TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).ServerName := s;
  FDatabase.DatabaseName := frReadString(Stream);
  s := frReadString(Stream);
  if s <> '' then
    FDatabase.AliasName := s;
  FDatabase.Timeout := frReadInteger(Stream);
end;

procedure TfrFFDatabase.SaveToStream(Stream: TStream);
begin
  inherited SaveToStream(Stream);
  frWriteBoolean(Stream, FDatabase.Connected);
  IF (FDatabase.ServerEngine IS TFFRemoteServerEngine) then
  Begin
    CASE TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).Protocol OF
      ptSingleUser : frWriteString(Stream, 'Single User');
      ptTCPIP      : frWriteString(Stream, 'TCP/IP');
      ptIPXSPX     : frWriteString(Stream, 'IPX/SPX');
    End;
  End
  Else
    frWriteString(Stream, '');
  IF (FDatabase.ServerEngine IS TFFRemoteServerEngine) then
    frWriteString(Stream, TffLegacyTransport(TFFRemoteServerEngine(FDatabase.ServerEngine).Transport).ServerName)
  Else
    frWriteString(Stream, '');
  frWriteString(Stream, FDatabase.DatabaseName);
  frWriteString(Stream, FDatabase.AliasName);
  frWriteInteger(Stream, FDatabase.Timeout);
end;

procedure TfrFFDatabase.LinesEditor(Sender: TObject);
begin
  MessageDlg('FF does not use a Params property.', mtInformation, [mbOK], 0);
end;


var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_FFDBCONTROL');
  frRegisterControl(TfrFFDatabase, Bmp, IntToStr(SInsertDB));

finalization
  frUnRegisterObject(TfrFFDatabase);
  Bmp.Free;

end.

