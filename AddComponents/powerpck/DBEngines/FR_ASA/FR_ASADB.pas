
{*********************************************}
{                                             }
{ FastReport v2.4 - NativeDB components       }
{            Database component               }    
{                                             }
{ Copyright (c) 1998-2001 by Tzyganenko A.    }
{ Copyright (c) 2000-2001 by Stalker SoftWare }
{                                             }  
{*********************************************}

unit FR_ASADB;

interface

{$I FR.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, FR_Class, StdCtrls,
  Controls, Forms, Menus, Dialogs, NdbBase, NdbAsa;

type
  TfrASAComponents = class(TComponent) // fake component
  end;

  TfrASASession = class(TfrNonVisualControl)
  private
    FAsaSession: TAsaSession;
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
    property AsaSession :TAsaSession read FAsaSession;
  end;


implementation

uses
  FR_Utils, FR_Const, FR_ASATable, FR_ASAQuery, FR_ASA_SP
{$IFDEF Delphi6}
, Variants
{$ENDIF};

{$R FR_ASA.RES}


{ TfrASASession }

constructor TfrASASession.Create;
begin

 inherited Create;

 FAsaSession := TAsaSession.Create(frDialogForm);
 FAsaSession.LibraryFile := 'dbl50t.dll';
 Component := FAsaSession;
 BaseName := 'AsaSession';
 Bmp.LoadFromResourceName(hInstance, 'FR_ASADB');
 Flags := Flags or flDontUndo;

 frConsts['stClient'] := stClient;
 frConsts['stServer'] := stServer;
 frConsts['stWorkgroup'] := stWorkgroup;
 frConsts['atReadCommitted'] := atReadCommitted;
 frConsts['atReadUncommitted'] := atReadUncommitted;
 frConsts['atReapeatableRead'] := atReapeatableRead;
 frConsts['atUnchanged'] := atUnchanged;
 frConsts['atSerializable'] := atSerializable;

end; { Create }

destructor TfrASASession.Destroy;
begin
 FAsaSession.Free;
 inherited Destroy;
end; { Destroy }

procedure TfrASASession.DefineProperties;
begin

 inherited DefineProperties;


 AddProperty('AutoCommit', [frdtBoolean], nil);
 AddProperty('CommitOnDisconnect', [frdtBoolean], nil);
 AddProperty('ClientParams', [frdtString], nil);
 AddProperty('Connected', [frdtBoolean], nil);
 AddProperty('LibraryFile', [frdtString], nil);
 AddProperty('LibraryPath', [frdtString], nil);
 AddProperty('LoginDataBase', [frdtString], nil);
 AddProperty('LoginEngineName', [frdtString], nil);
 AddProperty('LoginUser', [frdtString], nil);
 AddProperty('LoginPassword', [frdtString], nil);
 AddProperty('OEMConvert', [frdtBoolean], nil);
 AddProperty('ServerParams', [frdtString], nil);
 AddEnumProperty('ServerType','stClient;stServer;stWorkgroup',[stClient,stServer,stWorkgroup]);
 AddEnumProperty('TransIsolation','atReadCommitted;atReadUncommitted;atReapeatableRead;atUnchanged;atSerializable',
  [atReadCommitted,atReadUncommitted,atReapeatableRead,atUnchanged,atSerializable]);
 AddProperty('WantExceptions', [frdtBoolean], nil);
 AddProperty('WantRowCounts', [frdtBoolean], nil);
 AddProperty('TrimBlanks', [frdtBoolean], nil);
 AddProperty('KeepConnection', [frdtBoolean], nil);

end; { DefineProperties }

procedure TfrASASession.SetPropValue(Index: String; Value: Variant);
begin

 inherited SetPropValue(Index, Value);
 Index := AnsiUpperCase(Index);

 if Index = 'AUTOCOMMIT' then
   FAsaSession.AutoCommit := Value
 else
 if Index = 'COMMITONDISCONNECT' then
   FAsaSession.CommitOnDisconnect := Value
 else
 if Index = 'CLIENTPARAMS' then
   FAsaSession.ClientParams := Value
 else
 if Index = 'CONNECTED' then
   FAsaSession.Connected := Value
 else
 if Index = 'LIBRARYFILE' then
   FAsaSession.LibraryFile := Value
 else
 if Index = 'LIBRARYPATH' then
   FAsaSession.LibraryPath := Value
 else
 if Index = 'LOGINDATABASE' then
   FAsaSession.LoginDataBase := Value
 else
 if Index = 'LOGINENGINENAME' then
   FAsaSession.LoginEngineName := Value
 else
 if Index = 'LOGINPASSWORD' then
   FAsaSession.LoginPassword := Value
 else
 if Index = 'LOGINUSER' then
   FAsaSession.LoginUser := Value
 else
 if Index = 'OEMCONVERT' then
   FAsaSession.OEMConvert := Value
 else
 if Index = 'SERVERPARAMS' then
   FAsaSession.ServerParams := Value
 else
 if Index = 'SERVERTYPE' then
   FAsaSession.ServerType := Value
 else
 if Index = 'TRANSISOLATION' then
   FAsaSession.TransIsolation := Value
 else
 if Index = 'WANTEXCEPTIONS' then
   FAsaSession.WantExceptions := Value
 else
 if Index = 'WANTROWCOUNTS' then
   FAsaSession.WantRowCounts := Value
 else
 if Index = 'TRIMBLANKS' then
   FAsaSession.TrimBlanks := Value
 else
 if Index = 'KEEPCONNECTION' then
   FAsaSession.KeepConnection := Value

end; { SetPropValue }

function TfrASASession.GetPropValue(Index: String): Variant;
begin

 Index := AnsiUpperCase(Index);
 Result := inherited GetPropValue(Index);
 if Result <> Null then Exit;

 if Index = 'AUTOCOMMIT' then
   Result := FAsaSession.AutoCommit
 else
 if Index = 'COMMITONDISCONNECT' then
   Result := FAsaSession.CommitOnDisconnect
 else
 if Index = 'CLIENTPARAMS' then
   Result := FAsaSession.ClientParams
 else
 if Index = 'CONNECTED' then
    Result := FAsaSession.Connected
 else
 if Index = 'LIBRARYFILE' then
    Result := FAsaSession.LibraryFile
 else
 if Index = 'LIBRARYPATH' then
    Result := FAsaSession.LibraryPath
 else
 if Index = 'LOGINDATABASE' then
    Result := FAsaSession.LoginDataBase
 else
 if Index = 'LOGINENGINENAME' then
   Result := FAsaSession.LoginEngineName
 else
 if Index = 'LOGINPASSWORD' then
   Result := FAsaSession.LoginPassword
 else
 if Index = 'LOGINUSER' then
   Result := FAsaSession.LoginUser
 else
 if Index = 'OEMCONVERT' then
   Result := FAsaSession.OEMConvert
 else
 if Index = 'SERVERPARAMS' then
   Result := FAsaSession.ServerParams
 else
 if Index = 'SERVERTYPE' then
   Result := FAsaSession.ServerType
 else
 if Index = 'TRANSISOLATION' then
   Result := FAsaSession.TransIsolation
 else
 if Index = 'WANTEXCEPTIONS' then
   Result := FAsaSession.WantExceptions
 else
 if Index = 'WANTROWCOUNTS' then
   Result := FAsaSession.WantRowCounts
 else
 if Index = 'TRIMBLANKS' then
   Result := FAsaSession.TrimBlanks
 else
 if Index = 'KEEPCONNECTION' then
   Result := FAsaSession.KeepConnection

end; { GetPropValue }

function TfrASASession.DoMethod(MethodName: String; Par1, Par2, Par3: Variant): Variant;
begin
 Result := inherited DoMethod(MethodName, Par1, Par2, Par3);
end; { DoMethod }

procedure TfrASASession.LoadFromStream(Stream: TStream);
begin

 inherited LoadFromStream(Stream);

 FAsaSession.AutoCommit := frReadBoolean(Stream);
 FAsaSession.CommitOnDisconnect := frReadBoolean(Stream);
 FAsaSession.ClientParams := frReadString(Stream);
 FAsaSession.Connected := frReadBoolean(Stream);
 FAsaSession.LibraryFile := frReadString(Stream);
 FAsaSession.LibraryPath := frReadString(Stream);
 FAsaSession.LoginDataBase := frReadString(Stream);
 FAsaSession.LoginEngineName := frReadString(Stream);
 FAsaSession.LoginUser := frReadString(Stream);
 FAsaSession.LoginPassword := frReadString(Stream);
 FAsaSession.OEMConvert := frReadBoolean(Stream);
 FAsaSession.ServerParams := frReadString(Stream);
 FAsaSession.ServerType := TAsaServerType(frReadByte(Stream));
 FAsaSession.TransIsolation := TAsaTransIsolation(frReadByte(Stream));
 FAsaSession.WantExceptions := frReadBoolean(Stream);
 FAsaSession.WantRowCounts := frReadBoolean(Stream);

 if HVersion * 10 + LVersion > 10 then begin
   FAsaSession.TrimBlanks := frReadBoolean(Stream);
   FAsaSession.KeepConnection := frReadBoolean(Stream);
 end; { if }

end; { LoadFromStream }

procedure TfrASASession.SaveToStream(Stream: TStream);
begin

 LVersion := 1;
 
 inherited SaveToStream(Stream);

 frWriteBoolean(Stream,FAsaSession.AutoCommit);
 frWriteBoolean(Stream,FAsaSession.CommitOnDisconnect);
 frWriteString(Stream,FAsaSession.ClientParams);
 frWriteBoolean(Stream,FAsaSession.Connected);
 frWriteString(Stream,FAsaSession.LibraryFile);
 frWriteString(Stream,FAsaSession.LibraryPath);
 frWriteString(Stream,FAsaSession.LoginDataBase);
 frWriteString(Stream,FAsaSession.LoginEngineName);
 frWriteString(Stream,FAsaSession.LoginUser);
 frWriteString(Stream,FAsaSession.LoginPassword);
 frWriteBoolean(Stream,FAsaSession.OEMConvert);
 frWriteString(Stream,FAsaSession.ServerParams);
 frWriteByte(Stream,Byte(FAsaSession.ServerType));
 frWriteByte(Stream,Byte(FAsaSession.TransIsolation));
 frWriteBoolean(Stream,FAsaSession.WantExceptions);
 frWriteBoolean(Stream,FAsaSession.WantRowCounts);
 frWriteBoolean(Stream,FAsaSession.TrimBlanks);
 frWriteBoolean(Stream,FAsaSession.KeepConnection);

end; { SaveToStream }

var
  Bmp: TBitmap;

initialization
  Bmp := TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'FR_ASADBCONTROL');
  frRegisterControl(TfrASASession, Bmp, IntToStr(SInsertDB));

finalization
  frUnRegisterObject(TfrASASession);
  Bmp.Free;

end.

