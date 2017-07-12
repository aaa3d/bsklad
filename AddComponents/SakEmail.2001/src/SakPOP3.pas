//===============================================================
//
//       SakPOP3 unit, part of SakEmail
//
//       Contains: TSakPOP
//
//---------------------------------------------------------------
//
//      Copyrigth (c) 1997, 1998, 1999, 2000 Sergio A. Kessler
//      and authors cited
//      http://sak.org.ar
//
//===============================================================


unit SakPOP3;

interface

uses SysUtils, Classes, scktcomp, sak_util, SakMsg;

type

  TSessionState = ( Authorization, Transaction);
  TOnBeforeRetrieve = procedure( sender: TObject; MsgIndex: word) of object;
  TOnDeleteEvent = procedure( Sender: TObject; MsgIndex: word) of object;
  TToFromSocketEvent = procedure( Sender: TObject; s: string) of object;

// ================ SakPOP ================

  TSakPOP = class(TComponent)
  private
    { Private declarations }
    FSocket: TClientSocket;

    FSessionState: TSessionState;
    FUserId: string;
    FUserPasswd: string;
    FPort: string;
    FHost: String;
    FPOPError: boolean;
    FPOPErrorString: string;
    FStrErrorInFormatOfMsg: string;
    FConnected: boolean;
    FReceivingMsg: boolean;
    FStep: word;
    FReplyCode: string;
    FReplyString: string;
    FCanceled: boolean;
    FServerSupportLastCmd: boolean;
    FGetUIDLsOnRetrieve: boolean;
//    FTimeOut: longword;

    FRetrieveProgress: word;
    FRetrieveProgressStep: word;
    FMessagesDeleted: TStringList;
    FMsgsCount: word;
    FNewMsgsCount: word;

    FOnConnect: TNotifyEvent;
    FOnDisconnect: TNotifyEvent;
    FOnError: TOnError;
    FOnBeforeRetrieve: TOnBeforeRetrieve;
    FOnAfterRetrieve: TNotifyEvent;
    FOnRetrieveProgress: TOnCodeProgressEvent;
    FOnDelete: TOnDeleteEvent;
    FOnLookup: TSocketNotifyEvent;
    FOnConnecting: TSocketNotifyEvent;
    FOnSendTextToSocket: TToFromSocketEvent;
    FOnReceiveTextFromSocket: TToFromSocketEvent;

    procedure FDoConnect( Sender: TObject; Socket: TCustomWinSocket);
    procedure FDoDisconnect( Sender: TObject; Socket: TCustomWinSocket);
    procedure FDoErr( err: integer);
    procedure FDoError( Sender: TObject; Socket: TCustomWinSocket;
                        ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure FDoRetrieveProgress( const Percent: word);
    procedure FDoDelete( const MsgIndex: word);
    procedure FDoBeforeRetrieve( const MsgIndex: word);
    procedure FDoAfterRetrieve;
    procedure FSendTextToSocket( const txt: string);
    procedure FDoLookup( Sender: TObject; Socket: TCustomWinSocket);
    procedure FDoConnecting( Sender: TObject; Socket: TCustomWinSocket);
    function  FReceiveTextFromSocket: string;
    function  RetrieveMessageExt( const MsgIndex: word;
                                  const OnlyHeaders: boolean;
                                  var SakMsg: TSakMsg): boolean;
    function  RetrieveAllMessagesExt( var SakMsgList: TSakMsgList;
                                      const OnlyHeaders: boolean): integer;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect;
    procedure Disconnect;
    procedure Init;
    function  Login: boolean;
    procedure Cancel;
    procedure DeleteMessage( MsgIndex : word);
    function  RetrieveMessage( const MsgIndex: word; var SakMsg: TSakMsg): boolean;
    function  RetrieveMessageOnlyHeaders( const MsgIndex: word; var SakMsg: TSakMsg): boolean;
    function  RetrieveAllMessages( var SakMsgList: TSakMsgList): integer;
    function  RetrieveAllMessagesOnlyHeaders( var SakMsgList: TSakMsgList): integer;
    function  RetrieveHeaders( MsgIndex: word): string;
    function  GetUIDL( MsgIndex: Integer): String;
    property  POPError: boolean read FPOPError;
    property  ErrorString: string read FPOPErrorString;
    property  MsgsCount: word read FMsgsCount;
    property  NewMsgsCount: word read FNewMsgsCount;
    property  SessionState: TSessionState read FSessionState;
    property  Connected: boolean read FConnected;
    property  ReplyCode: string read FReplyCode;
    property  ReplyString: string read FReplyString;
    property  ServerSupportLastCmd: boolean read FServerSupportLastCmd write FServerSupportLastCmd;
    property  Canceled: boolean read FCanceled;

  published
    { Published declarations }
    property  UserId: string read FUserId write FUserId;
    property  UserPasswd: string read FUserPasswd write FUserPasswd;
    property  Port: string read FPort write FPort;
    property  Host: string read FHost write FHost;
    property  StrErrorInFormatOfMsg: string read FStrErrorInFormatOfMsg write FStrErrorInFormatOfMsg;
    property  RetrieveProgressStep: word read FRetrieveProgressStep write FRetrieveProgressStep;
    property  GetUIDLsOnRetrieve: boolean read FGetUIDLsOnRetrieve write FGetUIDLsOnRetrieve default false;
    property  OnConnect: TNotifyEvent read FOnConnect write FOnConnect;
    property  OnDisconnect: TNotifyEvent read FOnDisconnect write FOnDisconnect;
    property  OnError: TOnError read FOnError write FOnError;
    property  OnBeforeRetrieve: TOnBeforeRetrieve read FOnBeforeRetrieve write FOnBeforeRetrieve;
    property  OnAfterRetrieve: TNotifyEvent read FOnAfterRetrieve write FOnAfterRetrieve;
    property  OnRetrieveProgress: TOnCodeProgressEvent read FOnRetrieveProgress write FOnRetrieveProgress;
    property  OnDelete: TOnDeleteEvent read FOnDelete write FOnDelete;
    property  OnLookup: TSocketNotifyEvent read FOnLookup write FOnLookup;
    property  OnConnecting: TSocketNotifyEvent read FOnConnecting write FOnConnecting;
    property  OnSendTextToSocket: TToFromSocketEvent read FOnSendTextToSocket write FOnSendTextToSocket;
    property  OnReceiveTextFromSocket: TToFromSocketEvent read FOnReceiveTextFromSocket write FOnReceiveTextFromSocket;
//    property  TimeOut: longword read FTimeOut write FTimeOut;
  end;


implementation

uses Forms, windows;

const crlf = #13#10;

{ ***************** TSakPOP ***************** }

constructor TSakPOP.Create( AOwner: TComponent);
begin
  inherited create( AOwner);
  FConnected := False;
  FPort := '110';
  FRetrieveProgressStep := 10;
  FReceivingMsg := False;
  FStrErrorInFormatOfMsg := 'Error en el formato del mensaje.';
//  FTimeOut := 60000;  // a minute
  FSocket := nil;
  if not ( csDesigning in ComponentState) then
  begin
    FSocket := TClientSocket.create( AOwner);
    FSocket.ClientType := ctBlocking;
//    FSocket.OnRead := FSocketDoRead;
    FSocket.OnLookup := FDoLookup;
    FSocket.OnConnecting := FDoConnecting;
    FSocket.OnConnect := FDoConnect;
    FSocket.OnDisconnect := FDoDisconnect;
    FSocket.OnError := FDoError;
  end;
end;

destructor TSakPOP.Destroy;
begin
//  FreeAndNil(FSocket);  it's giving nice access violations errors
  inherited Destroy;
end;

procedure TSakPOP.Connect;
begin
  FMessagesDeleted := TStringList.create;
  FMsgsCount := 0;
  FSocket.port := StrToIntDef( FPort, 110);
  if sak_IsIPAddress(FHost) then
  begin
    FSocket.Address := FHost;        // Roger
    FSocket.Host := '';              // Roger
  end else
  begin
    FSocket.Host := FHost;          // Sergio
    FSocket.Address := '';          // Sergio
  end;

  FPOPError := false;
  try
    FSocket.Open;
  except
    FPOPError := True;
    exit;
  end;

  if FConnected then
  begin
    FReceiveTextFromSocket;
    FSessionState := Authorization;
    FCanceled := False;
  end;
end;

procedure TSakPOP.Disconnect;
begin
  if FConnected then
  begin
    FSendTextToSocket( 'QUIT' +crlf);
{    FReceiveTextFromSocket;
    if FPOPError then
    begin
      FDoErr( 2002);
    end else
    begin}
      FMessagesDeleted.free;
      FSocket.close;
      FConnected := false;
      Application.ProcessMessages;
//      sleep(10);
//    end;
  end;
end;

function TSakPOP.Login: boolean;
begin
  result := false;
  if not FConnected then
  begin
    raise Exception.create( 'Invalid Op. Not connected.');
  end;

  FSendTextToSocket( 'USER ' + UserId +crlf);
  FReceiveTextFromSocket;
  if FPOPError then
  begin
    FDoErr( 2001);
    exit;
  end;

  FSendTextToSocket( 'PASS ' + UserPasswd +crlf);
  FReceiveTextFromSocket;
  if FPOPError then
  begin
    FDoErr( 2001);
    exit;
  end;

  result := true;
  FSessionState := Transaction;
end;

// the NewMsgsCount property must return the number of _new_ mails
// but it will _not_ work with servers that do not support the LAST comand.
// it seems that the last POP3 revision remove this command, very smart, ha ?
procedure TSakPOP.Init;
begin
  FSendTextToSocket( 'STAT' +crlf);
  FReceiveTextFromSocket;
  if FPOPError then
  begin
    FDoErr( 2006);
    exit;
  end;

  FMsgsCount := sak_StrWord2Int( FReplyString, 1, 0);

  FNewMsgsCount := 0;  // 0 new mails, anyone has a better idea ?
  FServerSupportLastCmd := true;
  FSendTextToSocket( 'LAST' + crlf);
  FReceiveTextFromSocket;
  if FPOPError then
  begin
    FServerSupportLastCmd := false;
    exit;
  end;

  FNewMsgsCount := FMsgsCount - sak_StrWord2Int( FReplyString, 1, 0);
end;

procedure TSakPOP.DeleteMessage( MsgIndex : word);
begin
  if not FConnected then
  begin
    raise Exception.create( sak_esNotConnected);
  end;

  Application.ProcessMessages;
  if FCanceled then exit;

  FSendTextToSocket( 'DELE ' + intToStr( MsgIndex) +crlf);
  FReceiveTextFromSocket;
  if FPOPError then
  begin
    FDoErr( 2003);
    exit;
  end;

  FMessagesDeleted.Add( intToStr( MsgIndex));
  dec( FMsgsCount);
  FDoDelete( MsgIndex);
end;

function TSakPOP.RetrieveMessageExt( const MsgIndex : word;
                                     const OnlyHeaders: boolean;
                                     var SakMsg: TSakMsg): boolean;
const
  EOM = crlf+'.'+crlf;
var
  i, x, SizeInBytes: integer;
  s, tmpFileName: string;
  AllMsg: TFileStream;
  StrlMsg: TStringList;
begin
  result := False;
  if not FConnected then
  begin
    raise Exception.create( sak_esNotConnected);
  end;

  FDoBeforeRetrieve( MsgIndex);

  tmpFileName := sak_getTempPath + 'sak_msg.$$$';

  AllMsg := TFileStream.Create( tmpFileName, fmCreate or fmOpenReadWrite or fmShareExclusive);
  // here we get SizeInBytes to honor the progress
  FSendTextToSocket( 'LIST ' + intToStr( MsgIndex) + crlf);
  s := FReceiveTextFromSocket;
  SizeInBytes := sak_StrWord2Int( FReplyString, 2, 100);
  if OnlyHeaders then
  begin
    FSendTextToSocket( 'TOP ' + intToStr( MsgIndex) + ' 0' + crlf);
  end else
  begin
    FSendTextToSocket( 'RETR ' + intToStr( MsgIndex) + crlf);
  end;
  s := FReceiveTextFromSocket;
  if FPOPError then
  begin
    AllMsg.Free;
    SysUtils.DeleteFile( tmpFileName);
    FDoErr( 2004);
    exit;
  end;

  FStep := FRetrieveProgressStep;

  AllMsg.Write( Pointer( s)^, length( s));
  while pos( EOM, s) = 0 do
  begin
    Application.ProcessMessages;
    if FCanceled then
    begin
      AllMsg.Free;
      SysUtils.DeleteFile( tmpFileName);
      exit;
    end;
    s := copy( s, length( s)-3, 4) + FReceiveTextFromSocket;
    AllMsg.Write( s[5], length( s)-4);
    FRetrieveProgress := round( 100*AllMsg.size/SizeInBytes);
    if ( FRetrieveProgress >= FStep) then
    begin
      FDoRetrieveProgress( FRetrieveProgress);
      inc( FStep, FRetrieveProgressStep);
    end;
  end;

  if FRetrieveProgress < 100 then
    FDoRetrieveProgress( 100);


  StrlMsg := TStringList.Create;
  AllMsg.Position := 0;
  StrlMsg.LoadFromStream( AllMsg);
  AllMsg.Free;
  SysUtils.DeleteFile( tmpFileName);

  StrlMsg.Delete( 0);
  StrlMsg.Delete( StrlMsg.Count-1);        // borro el EOM

  i := 0;
  while i < StrlMsg.Count-1 do
  begin
    x := Length( StrlMsg[ i]);
    if (x > 1) then
    begin
      if (StrlMsg[ i][1] = '.') then
      begin
        StrlMsg[ i] := copy( StrlMsg[ i], 2, x);
      end;                       // get out transparency
    end;
    inc( i);
  end;

  SakMsg.RawMail := StrlMsg;
  StrlMsg.Free;

  SakMsg.SizeInBytes := SizeInBytes;

  // this is somewhat broken...
  if GetUIDLsOnRetrieve then
  begin
    SakMsg.UIDL := GetUIDL( MsgIndex);
  end;

  result := True;
  FDoAfterRetrieve;
end;

function TSakPOP.RetrieveMessage( const MsgIndex: word;
                                  var SakMsg: TSakMsg): boolean;
begin
  result := RetrieveMessageExt( MsgIndex, False, SakMsg);
end;

function TSakPOP.RetrieveMessageOnlyHeaders( const MsgIndex: word;
                                             var SakMsg: TSakMsg): boolean;
begin
  result := RetrieveMessageExt( MsgIndex, True, SakMsg);
end;


function TSakPOP.RetrieveAllMessagesExt( var SakMsgList: TSakMsgList;
                                         const OnlyHeaders: boolean): integer;
var
  i, count: integer;
  aSakMsg: TSakMsg;
begin
  SakMsgList.clear;
  count := 0;
  for i := 1 to FMsgsCount do
  begin
     if FMessagesDeleted.IndexOf( intToStr( i)) = -1 then
     begin
       aSakMsg := TSakMsg.Create( self);

       if OnlyHeaders then
         RetrieveMessageOnlyHeaders( i, aSakMsg)
       else
         RetrieveMessage( i, aSakMsg);

       if FCanceled then
       begin
         aSakMsg.Free;
         break;
       end else
       begin
         SakMsgList.Add( aSakMsg);
         inc( count);
       end;
     end;
  end;
  result := count;
end;

function TSakPOP.RetrieveAllMessages( var SakMsgList: TSakMsgList): integer;
begin
  result := RetrieveAllMessagesExt( SakMsgList, False);
end;

function TSakPOP.RetrieveAllMessagesOnlyHeaders( var SakMsgList: TSakMsgList): integer;
begin
  result := RetrieveAllMessagesExt( SakMsgList, True);
end;

function TSakPOP.RetrieveHeaders( MsgIndex : word): string;
const
  EOM = crlf+'.'+crlf;
var
  s: string;
begin
  if not FConnected then
  begin
    raise Exception.create( sak_esNotConnected);
  end;

  result := '';
  FSendTextToSocket( 'TOP ' + intToStr( MsgIndex) + ' 0'+crlf);
  s := FReceiveTextFromSocket;
  if not FPOPError then
  begin
    delete( s, 1, pos( crlf, s)+1);    // remove the +OK
    while pos( EOM, s) = 0 do
    begin
      s := s + FReceiveTextFromSocket;
    end;
    result := s;
  end else
  begin
    FDoErr( 2005);
  end;
end;


function TSakPOP.GetUIDL( MsgIndex: Integer): string;
var
  nPos: Integer;
begin
  Result := '';

  FSendTextToSocket ('UIDL '+IntToStr (MsgIndex)+crlf);
  FReceiveTextFromSocket;

  if not FPOPError then
  begin
    result := fReplyString;                    // ex: "1 35eba5ad00002780"
    nPos   := Pos (' ', Result);
    if nPos > 0 then
    begin
      Delete( Result, 1, nPos); // ex: "35eba5ad00002780"
    end;
  end else
  begin
    FDoErr( 2006);
  end;
end;

procedure TSakPOP.Cancel;
begin
  FCanceled := True;
end;

function TSakPOP.FReceiveTextFromSocket: string;
var
  s: string;
  x: integer;
  buff: array[1..1024] of char;
begin
  Application.ProcessMessages;

  x := FSocket.Socket.ReceiveBuf( buff, 1024);

  s := copy( buff, 1, x);
  FReplyCode := trim( copy( s, 1, 4));
  FReplyString := trim( copy( s, 5, pos( crlf, s) -5));
  FPOPError := FReplyCode = '-ERR';
  result := s;

  if assigned( FOnReceiveTextFromSocket) then
  begin
    FOnReceiveTextFromSocket( self, s);
  end;
end;

procedure TSakPOP.FSendTextToSocket( const txt: string);
begin
  Application.ProcessMessages;

  FSocket.Socket.SendBuf( pointer(txt)^, length( txt));

  if assigned( FOnSendTextToSocket) then
  begin
    FOnSendTextToSocket( self, txt);
  end;
end;


procedure TSakPOP.FDoConnect( Sender: TObject; Socket: TCustomWinSocket);
begin
  FConnected := true;
  if assigned( FOnConnect) then
    FOnConnect( Sender);
end;

procedure TSakPOP.FDoDisconnect( Sender: TObject; Socket: TCustomWinSocket);
begin
  FConnected := false;
  if assigned( FOnDisconnect) then
     FOnDisconnect( Sender);
end;

procedure TSakPOP.FDoErr( err: integer);
begin
  FDoError( self, FSocket.Socket, eeGeneral, err);
end;

procedure TSakPOP.FDoError( Sender: TObject; Socket: TCustomWinSocket;
                            ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  FPOPError := true;
  FMessagesDeleted.Clear;
  FMessagesDeleted.free;
  FSocket.close;
  FConnected := false;
  if assigned( FOnError) then
  begin
    FOnError( Sender, ErrorCode, FReplyString);
  end;
end;

procedure TSakPOP.FDoBeforeRetrieve( const MsgIndex: word);
begin
  if assigned( FOnBeforeRetrieve) then
     FOnBeforeRetrieve( self, MsgIndex);
end;

procedure TSakPOP.FDoAfterRetrieve;
begin
  if assigned( FOnAfterRetrieve) then
     FOnAfterRetrieve( self);
end;

procedure TSakPOP.FDoRetrieveProgress( const Percent: word);
begin
  if assigned( FOnRetrieveProgress) then
     FOnRetrieveProgress( self, Percent);
end;

procedure TSakPOP.FDoDelete( const MsgIndex: word);
begin
  if assigned( FOnDelete) then
     FOnDelete( self, MsgIndex);
end;

procedure TSakPOP.FDoLookup( Sender: TObject; Socket: TCustomWinSocket);
begin
  if assigned( FOnLookup) then
     FOnLookup( Sender, Socket);
end;

procedure TSakPOP.FDoConnecting( Sender: TObject; Socket: TCustomWinSocket);
begin
  if assigned( FOnConnecting) then
     FOnConnecting( Sender, Socket);
end;


end.
