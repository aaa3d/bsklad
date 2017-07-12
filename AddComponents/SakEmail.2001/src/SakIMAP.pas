//===============================================================
//
//       SakIMAP unit, part of SakEmail
//
//       Contains: TSakIMAP
//
//---------------------------------------------------------------
//
//      Copyrigth (c) 1997, 1998, 1999, 2000 Sergio A. Kessler
//      and authors cited
//      http://sak.org.ar
//
//===============================================================


unit SakIMAP;

interface

uses SysUtils, Classes, scktcomp, sak_util, SakMsg;

type

  TOnBeforeRetrieve = procedure( sender: TObject; const Folder: string; MsgIndex: word) of object;
  TOnDeleteEvent = procedure( Sender: TObject; const Folder: string; MsgIndex: word) of object;
  TToFromSocketEvent = procedure( Sender: TObject; const s: string) of object;

// ================ SakPOP ================

  TSakIMAP = class(TComponent)
  private
    { Private declarations }
    FSocket: TClientSocket;

    FUserId: string;
    FUserPasswd: string;
    FPort: string;
    FHost: String;
    FIMAPError: boolean;
    FIMAPErrorString: string;
    FStrErrorInFormatOfMsg: string;
    FConnected: boolean;
    FReceivingMsg: boolean;
    FReplyCode: string;
    FReplyString: string;
    FCanceled: boolean;
//    FTimeOut: longword;

    imap_tag: string;
    FSelectedFolder: string;
    FDelim: char;
    FFolderList: TStringList;

    FMsgsCount: word;
    FNewMsgsCount: word;

    FOnConnect: TNotifyEvent;
    FOnDisconnect: TNotifyEvent;
    FOnError: TOnError;
    FOnBeforeRetrieve: TOnBeforeRetrieve;
    FOnAfterRetrieve: TNotifyEvent;
    FOnDelete: TOnDeleteEvent;
    FOnLookup: TSocketNotifyEvent;
    FOnConnecting: TSocketNotifyEvent;
    FOnSendTextToSocket: TToFromSocketEvent;
    FOnReceiveTextFromSocket: TToFromSocketEvent;

    procedure FDoConnect( Sender: TObject; Socket: TCustomWinSocket);
    procedure FDoDisconnect( Sender: TObject; Socket: TCustomWinSocket);
    procedure FDoErr;
    procedure FDoError( Sender: TObject; Socket: TCustomWinSocket;
                        ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure FDoDelete( const MsgIndex: word);
    procedure FDoBeforeRetrieve( const MsgIndex: word);
    procedure FDoAfterRetrieve;
    procedure FSendTextToSocket( const txt: string);
    procedure FDoLookup( Sender: TObject; Socket: TCustomWinSocket);
    procedure FDoConnecting( Sender: TObject; Socket: TCustomWinSocket);
    procedure FReceiveTextFromSocket;
    procedure FReceiveMailFromSocket( RawMail: TStringList);
    function  RetrieveMessageExt( const MsgIndex: word;
                                  const OnlyHeaders: boolean;
                                  var SakMsg: TSakMsg): boolean;
    function  RetrieveAllMessagesExt( var SakMsgList: TSakMsgList;
                                      const OnlyHeaders: boolean): integer;
    function  ImapGetNextTag(const s: string): string;
    function  GetHierarchyDelim: char;
    function  GetFolderList: TStringList;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    function  Connect: boolean;
    procedure Disconnect;
    function  Login: boolean;
    function  SelectFolder(const FolderName: string): boolean;
    function  CreateFolder(const FolderName: string): boolean;
    function  DeleteFolder(const FolderName: string): boolean;
    function  DeleteMessage( const MsgIndex: word): boolean;
    function  Expunge: boolean;
    function  AppendMessage( const Folder: string; const RawMail: TStringList): boolean;
    procedure Cancel;
    function  RetrieveMessage( const MsgIndex: word; var SakMsg: TSakMsg): boolean;
    function  RetrieveMessageOnlyHeaders( const MsgIndex: word; var SakMsg: TSakMsg): boolean;
    function  RetrieveAllMessages( var SakMsgList: TSakMsgList): integer;
    function  RetrieveAllMessagesOnlyHeaders( var SakMsgList: TSakMsgList): integer;
    property  IMAPError: boolean read FIMAPError;
    property  ErrorString: string read FIMAPErrorString;
    property  MsgsCount: word read FMsgsCount;
    property  NewMsgsCount: word read FNewMsgsCount;
    property  Connected: boolean read FConnected;
    property  ReplyCode: string read FReplyCode;
    property  ReplyString: string read FReplyString;
    property  Canceled: boolean read FCanceled;
    property  HierarchyDelim: char read GetHierarchyDelim;
    property  FolderList: TStringList read GetFolderList;

  published
    { Published declarations }
    property  UserId: string read FUserId write FUserId;
    property  UserPasswd: string read FUserPasswd write FUserPasswd;
    property  Port: string read FPort write FPort;
    property  Host: string read FHost write FHost;
    property  StrErrorInFormatOfMsg: string read FStrErrorInFormatOfMsg write FStrErrorInFormatOfMsg;
    property  SelectedFolder: string read FSelectedFolder;
    property  OnConnect: TNotifyEvent read FOnConnect write FOnConnect;
    property  OnDisconnect: TNotifyEvent read FOnDisconnect write FOnDisconnect;
    property  OnError: TOnError read FOnError write FOnError;
    property  OnBeforeRetrieve: TOnBeforeRetrieve read FOnBeforeRetrieve write FOnBeforeRetrieve;
    property  OnAfterRetrieve: TNotifyEvent read FOnAfterRetrieve write FOnAfterRetrieve;
    property  OnDelete: TOnDeleteEvent read FOnDelete write FOnDelete;
    property  OnLookup: TSocketNotifyEvent read FOnLookup write FOnLookup;
    property  OnConnecting: TSocketNotifyEvent read FOnConnecting write FOnConnecting;
    property  OnSendTextToSocket: TToFromSocketEvent read FOnSendTextToSocket write FOnSendTextToSocket;
    property  OnReceiveTextFromSocket: TToFromSocketEvent read FOnReceiveTextFromSocket write FOnReceiveTextFromSocket;
//    property  TimeOut: longword read FTimeOut write FTimeOut;
  end;


implementation

uses Forms, windows;

const
  crlf = #13#10;
  IMAP_BUFFER_SIZE = 2048;

{ ***************** TSakPOP ***************** }


constructor TSakIMAP.Create( AOwner: TComponent);
begin
  inherited create( AOwner);
  FConnected := False;
  FPort := '143';
  FReceivingMsg := False;
  imap_tag := '';
  FFolderList := TStringList.Create;
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

destructor TSakIMAP.Destroy;
begin
  if FSocket = nil then
    FreeAndNil(FSocket);
  FFolderList.Free;
  inherited Destroy;
end;

function TSakIMAP.Connect: boolean;
var
  buff: array[1..IMAP_BUFFER_SIZE] of char;
  x: integer;
begin
  Result := False;
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

  FIMAPError := false;
  try
    FSocket.Open;
  except
    FIMAPError := True;
    exit;
  end;

  if FConnected then
  begin
    Result := True;
    Application.ProcessMessages;
    x := FSocket.Socket.ReceiveBuf( buff, IMAP_BUFFER_SIZE);
    FReplyString := copy( buff, 1, x);
    //FReceiveTextFromSocket;
    FCanceled := False;
  end;
end;

procedure TSakIMAP.Disconnect;
var
  cmd: string;
begin
  if FConnected then
  begin
    imap_tag := ImapGetNextTag(imap_tag);
    cmd := imap_tag + ' LOGOUT' + crlf;
    FSendTextToSocket( cmd);
    FReceiveTextFromSocket;
    if FIMAPError then
    begin
      FDoErr;
    end else
    begin
      FSocket.close;
      FConnected := false;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TSakIMAP.Cancel;
begin
  FCanceled := True;
end;

function TSakIMAP.Login: boolean;
var
  cmd: string;
begin
  Result := false;
  if not FConnected then
  begin
    raise Exception.create( 'Invalid Op. Not connected.');
  end;

  imap_tag := ImapGetNextTag(imap_tag);
  cmd := imap_tag + ' LOGIN ' + UserId + ' ' + UserPasswd + crlf;
  FSendTextToSocket( cmd);
  FReceiveTextFromSocket;

  if FIMAPError then
  begin
    FDoErr;
    exit;
  end;

  Result := pos( imap_tag + ' OK', UpperCase( FReplyString)) > 0;
  // you can inspect ReplyString to see what happened in case
  // of returning False
end;

// GetHierarchyDelim gets the char, that is used by the IMAP server to separate
// folder names like \ in DOS path
// Peter Nagel
function TSakIMAP.GetHierarchyDelim: char;
var
  po: integer;
  cmd: string;
begin
  if not FConnected then
    raise Exception.create( sak_esNotConnected);
  if FDelim = #0 then
  begin   //only fetch if not already set
    imap_tag := ImapGetNextTag(imap_tag);
    cmd := imap_tag + ' LIST "" ""' + crlf;
    FSendTextToSocket(cmd);
    FReceiveTextFromSocket;
    po := Pos('"', FReplyString);
    if (length(FReplyString) > po) and not FIMAPError then
      FDelim := FReplyString[po+1]
    else
      FDelim := #0;
  end;
  result := FDelim;
end;

function TSakIMAP.SelectFolder(const FolderName: string): boolean;
var
  cmd: string;
begin
  imap_tag := ImapGetNextTag(imap_tag);
  cmd := imap_tag + ' SELECT ' + FolderName + crlf;

  FSendTextToSocket( cmd);
  FReceiveTextFromSocket;

  if FIMAPError then
  begin
    Result := False;
    FDoErr;
    exit;
  end;

  Result := pos( imap_tag + ' OK', UpperCase( FReplyString)) > 0;

  if not Result then
    exit;
  // you can inspect ReplyString to see what happened in case
  // of returning False

  FSelectedFolder := FolderName;

  // After a folder has been selected, we set the
  // MsgsCount and NewMsgsCount properties

  imap_tag := ImapGetNextTag(imap_tag);
  cmd := imap_tag + ' STATUS ' + FolderName + ' (MESSAGES)' + crlf;
  FSendTextToSocket( cmd);
  FReceiveTextFromSocket;
  FMsgsCount := sak_StrWord2Int( FReplyString, 5, 0);

  imap_tag := ImapGetNextTag(imap_tag);
  cmd := imap_tag + ' STATUS ' + FolderName + ' (UNSEEN)' + crlf;
  FSendTextToSocket( cmd);
  FReceiveTextFromSocket;
  FNewMsgsCount := sak_StrWord2Int( FReplyString, 5, 0);
end;

function TSakIMAP.CreateFolder(const FolderName: string): boolean;
var
  cmd: string;
begin
  imap_tag := ImapGetNextTag(imap_tag);
  cmd := imap_tag + ' CREATE ' + FolderName + crlf;

  FSendTextToSocket( cmd);
  FReceiveTextFromSocket;

  if FIMAPError then
  begin
    Result := False;
    FDoErr;
    exit;
  end;

  Result := pos( imap_tag + ' OK', UpperCase( FReplyString)) > 0;
  // you can inspect ReplyString to see what happened in case
  // of returning False
end;

function TSakIMAP.DeleteFolder(const FolderName: string): boolean;
var
  cmd: string;
begin
  imap_tag := ImapGetNextTag(imap_tag);
  cmd := imap_tag + ' DELETE ' + FolderName + crlf;

  FSendTextToSocket( cmd);
  FReceiveTextFromSocket;

  if FIMAPError then
  begin
    Result := False;
    FDoErr;
    exit;
  end;

  Result := pos( imap_tag + ' OK', UpperCase( FReplyString)) > 0;
  // you can inspect ReplyString to see what happened in case
  // of returning False
end;

// GetFolderList fills a string list with the folder tree that is
// residing on the IMAP server
// Peter Nagel
function TSakIMAP.GetFolderList: TStringList;
var
  i, po: integer;
begin
  if not FConnected then
    raise Exception.create( sak_esNotConnected);
  imap_tag := ImapGetNextTag(imap_tag);
  FSendTextToSocket(imap_tag + ' LIST "" *' + crlf);
  FReceiveTextFromSocket;
  FFolderList.Clear;
  if not FIMAPError then
  begin
    FFolderList.Text := FReplyString; //make lines
    FFolderlist.Delete(FFolderList.Count - 1); //delete line "imap_tag OK LIST completed"
    for i := 0 to FFolderlist.Count - 1 do
    begin
      po := Pos('"',FFolderList[i]);
      FFolderList[i] := Trim(copy(FFolderList[i], po + 3, MAXINT)); //remove stuff in front of folder name
      if Pos('"', FFolderList[i]) = 1 then  //folder name is quoted
        FFolderList[i] := copy(FFolderlist[i], 2, length(FFolderList[i]) - 2);
    end;
  end;
  result := FFolderList;
end;


function TSakIMAP.DeleteMessage( const MsgIndex: word): boolean;
// you must select a folder first
// and use the expunge method to remove this messages
var
  cmd: string;
begin
  Result := False;
  if not FConnected then
    raise Exception.create( sak_esNotConnected);

  imap_tag := ImapGetNextTag(imap_tag);
  cmd := imap_tag + ' STORE ' + IntToStr( MsgIndex) + ' +FLAGS (\Deleted)' + crlf;

  Application.ProcessMessages;
  if FCanceled then exit;

  FSendTextToSocket( cmd);
  FReceiveTextFromSocket;

  if FIMAPError then
  begin
    FDoErr;
    exit;
  end;

  Result := pos( imap_tag + ' OK', UpperCase( FReplyString)) > 0;
  if Result then
  begin
    dec( FMsgsCount);
    FDoDelete( MsgIndex);
  end;
end;

function TSakIMAP.Expunge: boolean;
// The EXPUNGE command permanently removes from the currently
// selected mailbox (folder) all messages that have the \Deleted flag set.
var
  cmd: string;
begin
  Result := False;
  if not FConnected then
    raise Exception.create( sak_esNotConnected);

  imap_tag := ImapGetNextTag(imap_tag);
  cmd := imap_tag + ' EXPUNGE' + crlf;

  Application.ProcessMessages;
  if FCanceled then exit;

  FSendTextToSocket( cmd);
  FReceiveTextFromSocket;
  if FIMAPError then
  begin
    FDoErr;
    exit;
  end;

  Result := pos( imap_tag + ' OK', UpperCase( FReplyString)) > 0;
end;

function TSakIMAP.AppendMessage( const Folder: string; const RawMail: TStringList): boolean;
var
  cmd: string;
  literal: string;
  x: integer;
  buff: array[1..IMAP_BUFFER_SIZE] of char;
begin
  Result := False;
  if not FConnected then
    raise Exception.create( sak_esNotConnected);

  Application.ProcessMessages;
  if FCanceled then exit;

  literal := IntToStr( length(RawMail.Text));

  imap_tag := ImapGetNextTag(imap_tag);
  cmd := imap_tag + ' APPEND ' + Folder + ' {' + literal + '}' + crlf;

  FSendTextToSocket( cmd);
  Application.ProcessMessages;
  x := FSocket.Socket.ReceiveBuf( buff, IMAP_BUFFER_SIZE);
  FReplyString := copy( buff, 1, x);
  if pos(imap_tag, FReplyString) > 0 then
  begin
    FIMAPError := True;
    FDoErr;
    exit;
  end;

  if pos( imap_tag + ' NO', UpperCase( FReplyString)) = 0 then
  begin
    FSendTextToSocket( RawMail.Text + crlf);
    FReceiveTextFromSocket;
    if pos( imap_tag + ' OK', UpperCase( FReplyString)) > 0 then
    begin
      Result := True;
    end;
  end;
end;


function TSakIMAP.RetrieveMessageExt( const MsgIndex : word;
                                      const OnlyHeaders: boolean;
                                      var SakMsg: TSakMsg): boolean;
var
  msgSize: integer;
  cmd: string;
begin
  Result := False;
  if not FConnected then
    raise Exception.create( sak_esNotConnected);

  FDoBeforeRetrieve( MsgIndex);

  imap_tag := ImapGetNextTag(imap_tag);
  cmd := imap_tag + ' FETCH ' + IntToStr( MsgIndex) + ' RFC822.SIZE' + crlf;

  FSendTextToSocket( cmd);
  FReceiveTextFromSocket;

  if FIMAPError then
  begin
    FDoErr;
    exit;
  end;

  msgSize := sak_StrWord2Int( FReplyString, 5, 100);

  imap_tag := ImapGetNextTag(imap_tag);

  if OnlyHeaders then
    cmd := imap_tag + ' FETCH ' + IntToStr( MsgIndex) + ' RFC822.HEADER' + crlf
  else
    cmd := imap_tag + ' FETCH ' + IntToStr( MsgIndex) + ' RFC822' + crlf;

  FSendTextToSocket( cmd);

  FReceiveMailFromSocket( SakMsg.RawMail);

  SakMsg.SizeInBytes := msgSize;
  SakMsg.ParseMsg;

  if pos( imap_tag + ' OK', UpperCase( FReplyString)) > 0 then
  begin
    Result := True;
  end;

  FDoAfterRetrieve;
end;

function TSakIMAP.RetrieveMessage( const MsgIndex: word;
                                   var SakMsg: TSakMsg): boolean;
begin
  result := RetrieveMessageExt( MsgIndex, False, SakMsg);
end;

function TSakIMAP.RetrieveMessageOnlyHeaders( const MsgIndex: word;
                                              var SakMsg: TSakMsg): boolean;
begin
  result := RetrieveMessageExt( MsgIndex, True, SakMsg);
end;


function TSakIMAP.RetrieveAllMessagesExt( var SakMsgList: TSakMsgList;
                                          const OnlyHeaders: boolean): integer;
var
  i, count: integer;
  aSakMsg: TSakMsg;
begin
  SakMsgList.clear;
  count := 0;
  for i := 1 to FMsgsCount do
  begin
     Application.ProcessMessages;
     if FCanceled then
       break;

     aSakMsg := TSakMsg.Create( self);
     if OnlyHeaders then
       RetrieveMessageOnlyHeaders( i, aSakMsg)
     else
       RetrieveMessage( i, aSakMsg);

     SakMsgList.add( aSakMsg);
     inc( count);
  end;
  result := count;
end;

function TSakIMAP.RetrieveAllMessages( var SakMsgList: TSakMsgList): integer;
begin
  result := RetrieveAllMessagesExt( SakMsgList, False);
end;

function TSakIMAP.RetrieveAllMessagesOnlyHeaders( var SakMsgList: TSakMsgList): integer;
begin
  result := RetrieveAllMessagesExt( SakMsgList, True);
end;

procedure TSakIMAP.FReceiveTextFromSocket;
var
  s, l: string;
  x, pos_tag: integer;
  buff: array[1..IMAP_BUFFER_SIZE] of char;
begin
  s := '';

  while True do
  begin
    Application.ProcessMessages;
    x := FSocket.Socket.ReceiveBuf( buff, IMAP_BUFFER_SIZE);
    s := s + copy( buff, 1, x);

    pos_tag := pos( imap_tag, s);
    // if we found "imap_tag * crlf" then we have finished
    if pos_tag > 0 then
    begin
      l := copy( s, pos_tag, length(s));
      if pos(crlf, l) > 0 then
        break;
    end;
  end;

  FIMAPError := (pos( imap_tag + ' BAD' , l) > 0);

  FReplyString := s;
  if assigned( FOnReceiveTextFromSocket) then
  begin
    FOnReceiveTextFromSocket( Self, s);
  end;
end;

procedure TSakIMAP.FReceiveMailFromSocket( RawMail: TStringList);
var
  buff_tail, l, tmpFileName: string;
  x, lbt, pos_tag: integer;
  buff: array[1..IMAP_BUFFER_SIZE] of char;
  tmpMsg: TFileStream;
begin
  tmpFileName := sak_getTempPath + 'sak_msg.$$$';
  tmpMsg := TFileStream.Create( tmpFileName, fmCreate or
                                             fmOpenReadWrite or
                                             fmShareExclusive);
  buff_tail := '';

  while True do
  begin
    Application.ProcessMessages;
    x := FSocket.Socket.ReceiveBuf( buff, IMAP_BUFFER_SIZE);
    tmpMsg.Write( buff, x);

    if x > 99 then
      buff_tail := copy( buff, x-99, 100)
    else
      buff_tail := buff_tail + copy( buff, 1, x);

    pos_tag := pos( imap_tag, buff_tail);
    // if we found "imap_tag * crlf" then we have finished
    if pos_tag > 0 then
    begin
      l := copy( buff_tail, pos_tag, length(buff_tail));
      if pos(crlf, l) > 0 then
        break;
    end;
    lbt := length(buff_tail);
    if lbt > 99 then
      buff_tail := copy(buff_tail, lbt-40, lbt);
  end;

  FIMAPError := (pos( imap_tag + ' BAD' , l) > 0);

  tmpMsg.Position := 0;
  RawMail.LoadFromStream( tmpMsg);
  tmpMsg.Free;
  sysutils.DeleteFile( tmpFileName);

  if RawMail.Count >= 3 then
  begin
    FReplyString := RawMail.Strings[RawMail.Count-1];
    RawMail.Delete(0);
    RawMail.Delete( RawMail.Count-1);
    RawMail.Delete( RawMail.Count-1);
  end;

  if assigned( FOnReceiveTextFromSocket) then
  begin
    FOnReceiveTextFromSocket( Self, FReplyString);
  end;
end;

procedure TSakIMAP.FSendTextToSocket( const txt: string);
begin
  Application.ProcessMessages;

  FSocket.Socket.SendBuf( pointer(txt)^, length( txt));

  if assigned( FOnSendTextToSocket) then
  begin
    FOnSendTextToSocket( self, txt);
  end;
end;

procedure TSakIMAP.FDoConnect( Sender: TObject; Socket: TCustomWinSocket);
begin
  FConnected := true;
  if assigned( FOnConnect) then
    FOnConnect( Sender);
end;

procedure TSakIMAP.FDoDisconnect( Sender: TObject; Socket: TCustomWinSocket);
begin
  FConnected := false;
  if assigned( FOnDisconnect) then
     FOnDisconnect( Sender);
end;

procedure TSakIMAP.FDoErr;
var
  ErrorCode: integer;
begin
  ErrorCode := 666;
  FDoError( self, FSocket.Socket, eeGeneral, ErrorCode);
end;

procedure TSakIMAP.FDoError( Sender: TObject; Socket: TCustomWinSocket;
                            ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  FIMAPError := true;
  FSocket.close;
  FConnected := false;
  if assigned( FOnError) then
  begin
    FOnError( Sender, ErrorCode, FReplyString);
  end;
end;

procedure TSakIMAP.FDoBeforeRetrieve( const MsgIndex: word);
begin
  if assigned( FOnBeforeRetrieve) then
     FOnBeforeRetrieve( self, SelectedFolder, MsgIndex);
end;

procedure TSakIMAP.FDoAfterRetrieve;
begin
  if assigned( FOnAfterRetrieve) then
     FOnAfterRetrieve( self);
end;

procedure TSakIMAP.FDoDelete( const MsgIndex: word);
begin
  if assigned( FOnDelete) then
     FOnDelete( self, SelectedFolder, MsgIndex);
end;

procedure TSakIMAP.FDoLookup( Sender: TObject; Socket: TCustomWinSocket);
begin
  if assigned( FOnLookup) then
     FOnLookup( Sender, Socket);
end;

procedure TSakIMAP.FDoConnecting( Sender: TObject; Socket: TCustomWinSocket);
begin
  if assigned( FOnConnecting) then
     FOnConnecting( Sender, Socket);
end;

function TSakIMAP.ImapGetNextTag(const s: string): string;
begin
  if s = '' then
  begin
    Result := 'SAK___1';
  end else
  begin
    result := 'SAK___' + IntToStr( StrToInt( Copy( s, 7, length(s))) +1 );
  end;
end;



end.
