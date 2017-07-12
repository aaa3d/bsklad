//===============================================================
//
//       SakSMTP unit, part of SakEmail
//
//       Contains: TSakSMTP
//
//---------------------------------------------------------------
//
//      Copyrigth (c) 1997, 1998, 1999, 2000 Sergio A. Kessler
//      and authors cited
//      http://sak.org.ar
//
//===============================================================


unit SakSMTP;

interface

uses SysUtils, Classes, scktcomp, sak_util, SakMsg;

{=============== SakSMTP ===============}

type

  TOnSendProgressEvent = procedure( Sender: TObject; Percent: word) of object;
  TToFromSocketEvent = procedure( Sender: TObject; s: string) of object;

  TSakSMTP = class(TComponent)
  private
    { Private declarations }
    FSocket: TClientSocket;

    FPort: string;
    FHost: String;
    FLocalizedDates: boolean;
    FSMTPError: boolean;
    FConnected: boolean;
    FReplyCode: string;
    FReplyString: string;
    FSendProgress: word;
    FSendProgressStep: word;
    FCanceled: boolean;
    FTimeOut: longword;
    SocketOkToRead: boolean;
    SocketOkToWrite: boolean;

    FOnConnect: TNotifyEvent;
    FOnDisconnect: TNotifyEvent;
    FOnBeforeSend: TNotifyEvent;
    FOnAfterSend: TNotifyEvent;
    FOnError: TOnError;
    FOnSendProgress: TOnSendProgressEvent;
    FOnLookup: TSocketNotifyEvent;
    FOnConnecting: TSocketNotifyEvent;
    FOnSendTextToSocket: TToFromSocketEvent;
    FOnReceiveTextFromSocket: TToFromSocketEvent;

    procedure FDoConnect( Sender: TObject; Socket: TCustomWinSocket);
    procedure FDoDisconnect( Sender: TObject; Socket: TCustomWinSocket);
    procedure FDoError( Sender: TObject; Socket: TCustomWinSocket;
                        ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure FDoErr( ErrorEvent: TErrorEvent);
    procedure FDoSendProgress( const Percent: word);
    procedure DoOnBeforeSend;
    procedure DoOnAfterSend;
    procedure FDoLookup( Sender: TObject; Socket: TCustomWinSocket);
    procedure FDoConnecting( Sender: TObject; Socket: TCustomWinSocket);
    procedure FSendTextToSocket( const txt: string);
    function  FReceiveTextFromSocket: string;
    function  FSendMail( const From: string; AddressList, data: TStringList): integer;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect;
    procedure Disconnect;
    procedure Cancel;
    function  SendTheMessage( var aMsg: TSakMsg): boolean;
    property  Connected: boolean read FConnected;
    property  ReplyCode: string read FReplyCode;
    property  ReplyString: string read FReplyString;
    property  SMTPError: boolean read FSMTPError;
    property  Canceled: boolean read FCanceled;
  published
    { Published declarations }
    property  Port: string read FPort write FPort;
    property  Host: string read FHost write FHost;
    property  LocalizedDates: boolean read FLocalizedDates write FLocalizedDates default false;
    property  SendProgressStep: word read FSendProgressStep write FSendProgressStep;
    property  OnConnect: TNotifyEvent read FOnConnect write FOnConnect;
    property  OnQuit: TNotifyEvent read FOnDisconnect write FOnDisconnect;
    property  OnError: TOnError read FOnError write FOnError;
    property  OnBeforeSend: TNotifyEvent read FOnBeforeSend write FOnBeforeSend;
    property  OnAfterSend: TNotifyEvent read FOnAfterSend write FOnAfterSend;
    property  OnSendProgress: TOnSendProgressEvent read FOnSendProgress write FOnSendProgress;
    property  OnLookup: TSocketNotifyEvent read FOnLookup write FOnLookup;
    property  OnConnecting: TSocketNotifyEvent read FOnConnecting write FOnConnecting;
    property  OnSendTextToSocket: TToFromSocketEvent read FOnSendTextToSocket write FOnSendTextToSocket;
    property  OnReceiveTextFromSocket: TToFromSocketEvent read FOnReceiveTextFromSocket write FOnReceiveTextFromSocket;
    property  TimeOut: longword read FTimeOut write FTimeOut;
  end;


implementation

uses Forms, SakMIME;

const crlf = #13#10;

{ ***************** TSakSMTP ***************** }

constructor TSakSMTP.Create( AOwner: TComponent);
begin
  inherited create( AOwner);
  FConnected := false;
  FPort := '25';
  FSendProgressStep := 10;
  SocketOkToRead := False;
  SocketOkToWrite := False;
  FTimeOut := 60000;  // a minute
  if not ( csDesigning in ComponentState) then
  begin
    FSocket := TClientSocket.create( AOwner);
    FSocket.ClientType := ctBlocking;
    FSocket.OnLookup := FDoLookup;
    FSocket.OnConnecting := FDoConnecting;
    FSocket.OnConnect := FDoConnect;
    FSocket.OnDisconnect := FDoDisconnect;
    FSocket.OnError := FDoError;
  end;
end;

destructor TSakSMTP.Destroy;
begin
//  FreeAndNil(FSocket);  it's giving nice access violations errors
  inherited Destroy;
end;

procedure TSakSMTP.Connect;
var
  localhost: string;
begin
  FSocket.Port := StrToIntDef( FPort, 25);
  if sak_IsIPAddress(FHost) then
  begin
    FSocket.Address := FHost;        // Roger
    FSocket.Host := '';              // Roger
  end else
  begin
    FSocket.Host := FHost;          // Sergio
    FSocket.Address := '';          // Sergio
  end;

  FSMTPError := false;
  try
    FSocket.Open;
  except
    FSMTPError := True;
    exit;
  end;

  repeat
    Application.ProcessMessages;
  until FConnected;

  FReceiveTextFromSocket;

  if not FSMTPError then
    FSMTPError := (FReplyCode <> '220');

  if FSMTPError then
  begin
    FDoErr( eeConnect);
    exit;
  end;

  localhost := FSocket.Socket.LocalHost;
  if sak_isIPAddress( localhost) then
  begin
    host := '[' + localhost + ']';
  end else
  begin
    if (pos('.', localhost) = 0) and not (sak_IsIPAddress(FHost)) then
    begin
      localhost := localhost + '.' + FHost;
    end;
  end;
  FSendTextToSocket( 'HELO ' + localhost + crlf);
  FReceiveTextFromSocket;
  if not FSMTPError then
    FSMTPError := FReplyCode <> '250';
  if FSMTPError then
    FDoErr( eeConnect);
  FCanceled := False;
end;

procedure TSakSMTP.Disconnect;
begin
  if FConnected then
  begin
    try
       if FCanceled then
         exit;
       FSendTextToSocket( 'QUIT' +crlf);
       FReceiveTextFromSocket;
       if not FSMTPError then
         FSMTPError := FReplyCode <> '221';
       if FSMTPError then
          FDoErr( eeDisconnect);
      finally
       FSocket.close;
       FConnected := false;
    end
  end;
end;

function TSakSMTP.SendTheMessage( var aMsg: TSakMsg): boolean;
var
  MsgTOs, MsgCCs, MsgBCCs: TStringList;
  FromAux: string;
  pos_lower: integer;
begin
  result := false;

  if not FConnected then
  begin
    raise Exception.create( sak_esNotConnected);
  end;
  if aMsg.From = '' then
  begin
    raise Exception.create( sak_esNotOrigin);
  end;
  if aMsg.SendTo = '' then
  begin
    raise Exception.create( sak_esNotDestination);
  end;

{  if aMsg.UserName = '' then
  begin
    FSendTextToSocket( 'VRFY ' + aMsg.From + crlf);
    FReceiveTextFromSocket;
    if FReplyCode = '250' then
    begin
      pos_lower := pos('<', FReplyString);
      if pos_lower > 2 then
        aMsg.UserName := copy( FReplyString, 1, pos_lower-2);
    end;
  end;}

  aMsg.Date := sak_GetInternetDate( Now);

  if aMsg.RawMail.Count = 0 then
    aMsg.FillRawMail;

  if FCanceled then
  begin
    // aMsg.RawMail.Clear;
    exit;
  end;

  DoOnBeforeSend;

  FromAux := sak_ExtractAddress( aMsg.From, False);

  MsgTOs  := sak_CleanUpAddresses( aMsg.SendTo);
  MsgCCs  := sak_CleanUpAddresses( aMsg.CC);
  MsgBCCs := sak_CleanUpAddresses( aMsg.BCC);

  try
    if FSendMail( FromAux, MsgTOs, aMsg.RawMail) < 1 then
       FDoErr( eeGeneral);
    if FSendMail( FromAux, MsgCCs, aMsg.RawMail) < 1 then
       FDoErr( eeGeneral);
    if FSendMail( FromAux, MsgBCCs, aMsg.RawMail) < 1 then
       FDoErr( eeGeneral);

    if FSendProgress < 100 then FDoSendProgress( 100);
    result := true;
    DoOnAfterSend;
  finally
    MsgTOs.Free;
    MsgCCs.Free;
    MsgBCCs.Free;
  end;
end;

function TSakSMTP.FSendMail( const From: string; AddressList, data: TStringList): integer;
var
  i: integer;
  step: word;
begin
  result := 1;

  if AddressList.Count = 0 then exit;

  FSendTextToSocket( 'MAIL FROM:' + '<' + From + '>' + crlf);
  FReceiveTextFromSocket;
  if not FSMTPError then
    FSMTPError := FReplyCode <> '250';
  if FSMTPError then
  begin
    result := -1;
    exit;
  end;

  for i := 0 to AddressList.Count-1 do
  begin
    FSendTextToSocket( 'RCPT TO:' + '<' + AddressList[ i] + '>' + crlf);

    FReceiveTextFromSocket;
    if not FSMTPError then
      FSMTPError := FReplyCode <> '250';
    if FSMTPError then
    begin
      result := -2;
      exit;
    end;
  end;

  FSendTextToSocket( 'DATA' +crlf);
  FReceiveTextFromSocket;
  if not FSMTPError then
    FSMTPError := (FReplyCode <> '354'); // and (FReplyCode <> '250');
  if FSMTPError then
  begin
    result := -3;
    exit;
  end;

  step := FSendProgressStep;

  for i := 0 to data.Count-1 do
  begin
    try
      FSendTextToSocket( data[ i] + crlf);
     except
      FSMTPError := true;
      result := -6;
      exit;
    end;
    FSendProgress := round( 100*(i+1)/data.Count);
    if ( FSendProgress >= step) then
    begin
      FDoSendProgress( FSendProgress);
      inc( step, FSendProgressStep);
    end;
    Application.ProcessMessages;
    if FCanceled then
    begin
      result := 0;
      exit;
    end;
  end;
  FSendTextToSocket( crlf + '.' + crlf);     // end of msg
  FReceiveTextFromSocket;
  if not FSMTPError then
    FSMTPError := FReplyCode <> '250';
  if FSMTPError then
  begin
    result := -4;
    exit;
  end;

  // In order for the server to accept another e-mail sent by SendTheMessage
  // without disconnecting and connecting again, RSET must be sent
  // in order for the server buffers to be cleared so that MAIL FROM:
  // will not return an error "503 Sender already specified".
  //
  //     Andy Charalambous - June 19, 1999.
  //
  FSendTextToSocket( 'RSET' + crlf);
  FReceiveTextFromSocket;
  if not FSMTPError then
    FSMTPError := FReplyCode <> '250';
  if FSMTPError then
  begin
    result := -5;
    exit;
  end;

  FDoSendProgress( 100);
end;

procedure TSakSMTP.Cancel;
begin
  FCanceled := True;
end;

function TSakSMTP.FReceiveTextFromSocket: string;
var
  s: string;
  i, x : integer;
  buff: array[1..1024] of char;
begin
  repeat
    Application.ProcessMessages;

    x := FSocket.Socket.ReceiveBuf( buff, 1024);

    s := copy( buff, 1, x);
    i := pos( crlf, s);
    while (i > 0) and (length( s) > i+2) do
    begin
      s := copy( s, i+2, length(s)-i-1);
      i := pos( crlf, s);
    end;
    FReplyCode := trim( copy( s, 1, 3));
    FReplyString := trim( copy( s, 4, 64));
    result := s;
    Application.ProcessMessages;
    if length( s) < 4 then s := '----';
  until s[4] = ' ';
  // because the replys that are like '250-OK' are not final,
  // replys like '250 OK' are finals, note the fourth char
  if assigned( FOnReceiveTextFromSocket) then
  begin
    FOnReceiveTextFromSocket( self, s);
  end;
end;

procedure TSakSMTP.FSendTextToSocket( const txt: string);
begin
  Application.ProcessMessages;
  FSocket.Socket.SendBuf( pointer(txt)^, length( txt));

  if assigned( FOnSendTextToSocket) then
  begin
    FOnSendTextToSocket( self, txt);
  end;
end;


procedure TSakSMTP.FDoConnect( Sender: TObject; Socket: TCustomWinSocket);
begin
  FConnected := true;
  if assigned( FOnConnect) then FOnConnect( Sender);
end;

procedure TSakSMTP.FDoDisconnect( Sender: TObject; Socket: TCustomWinSocket);
begin
  FConnected := false;
  if assigned( FOnDisconnect) then
    FOnDisconnect( Sender);
end;

procedure TSakSMTP.DoOnBeforeSend;
begin
  if assigned( FOnBeforeSend) then
    FOnBeforeSend( self);
end;

procedure TSakSMTP.DoOnAfterSend;
begin
  if assigned( FOnAfterSend) then
    FOnAfterSend( self);
end;

procedure TSakSMTP.FDoErr( ErrorEvent: TErrorEvent);
var
  x: integer;
begin
  x := 0;
  FDoError( self, FSocket.Socket, ErrorEvent, x);
end;

procedure TSakSMTP.FDoError( Sender: TObject; Socket: TCustomWinSocket;
                             ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  FSMTPError := true;
  FSocket.close;
  FConnected := false;
  if assigned( FOnError) then
    FOnError( Sender, StrToInt( FReplyCode), FReplyString);
end;

{
procedure TSakSMTP.FDoEncodeStart( const FileName: string; Size: longint);
begin
  if assigned( FOnEncodeStart) then
    FOnEncodeStart( self, FileName, Size);
end;

procedure TSakSMTP.FDoEncodeProgress( const Percent: word);
begin
  if assigned( FOnEncodeProgress) then
    FOnEncodeProgress( self, Percent);
end;

procedure TSakSMTP.FDoEncodeEnd;
begin
  if assigned( FOnEncodeEnd) then
    FOnEncodeEnd( self);
end;
}

procedure TSakSMTP.FDoSendProgress( const Percent: word);
begin
  if assigned( FOnSendProgress) then
    FOnSendProgress( self, Percent);
end;

procedure TSakSMTP.FDoLookup( Sender: TObject; Socket: TCustomWinSocket);
begin
  if assigned( FOnLookup) then
    FOnLookup( Sender, Socket);
end;

procedure TSakSMTP.FDoConnecting( Sender: TObject; Socket: TCustomWinSocket);
begin
  if assigned( FOnConnecting) then
    FOnConnecting( Sender, Socket);
end;


end.
