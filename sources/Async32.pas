//******************************************************************************
//                      VARIAN ASYNC32 COMPONENT v1.25
//               (c) VARIAN SOFTWARE SERVICES NL 1996-1997
//                          ALL RIGHTS RESERVED
//******************************************************************************

//Written by Varian Software Services NL, The Netherlands
//Subject: Async32 Component
//Version: 1.26
//Platform: Delphi 3, Win95, NT
//Date: 2 June 1997
//Last update: 16st December 1997
//Release: Freeware, just let us know what you think of it....

//if you make any modifications to the source, please send us a copy.
//We will verify your changes and give you proper credit when included.

//Please send any questions, remarks or suggestions to our following
//address: Varian@worldaccess.nl

// THIS SOFTWARE IS PROVIDED 'AS-IS', WITHOUT ANY EXPRESS OR IMPLIED
//WARRANTY. IN NO EVENT WILL THE AUTHOR BE HELD LIABLE FOR ANY DAMAGES
//               ARISING FROM THE USE OF THIS SOFTWARE.

//****************************************************************************
//     Our thanks goes to all the people who helped creating and
//     testing this component for their support and suggestions.
//****************************************************************************
unit Async32;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

const
  DefaultDeviceName = 'Com2';

type
  ECommError = class(Exception)
    ErrorCode: Integer;
  end;

  TCommEvent = procedure(Sender: TObject; Status: dword) of object;
  TCommEventState = (evBreak, evCTS, evDSR, evError, evRing,
    evRlsd, evRxChar, evRxFlag, evTxEmpty);
  TCommEventType = set of TCommEventState;

  TCommEventThread = class(TThread)
  private
    FHandle: THandle;
    FStatus: dword;
    FOnSignal: TCommEvent;
    hCloseEvent: THandle;
  protected
    procedure Execute; override;
    procedure DoOnSignal;
  public
    constructor Create(Handle: THandle; Events: TCommEventType);
    destructor Destroy; override;
    procedure ReleaseThread;
    property OnSignal: TCommEvent read FOnSignal write FOnSignal;
  end;

  TCustomComm = class;

  TCommEventChars = class(TPersistent)
  private
    FOwner: TCustomComm;
    FXonChar: Char;
    FXoffChar: Char;
    procedure SetXonChar(Value: Char);
    procedure SetXoffChar(Value: Char);
  public
    constructor Create(Owner: TCustomComm);
  published
    property XonChar: Char read FXonChar write SetXonChar;
    property XoffChar: Char read FXoffChar write SetXoffChar;
  end;

  TBaudRate = (cbr110, cbr300, cbr600, cbr1200, cbr2400, cbr4800, cbr9600,
    cbr14400, cbr19200, cbr38400, cbr56000, cbr57600, cbr115200, cbr128000, cbr256000);
  TParity = (paNone, paOdd, paEven, paMark, paSpace);
  TStopbits = (sb10, sb15, sb20);
  TDatabits=(da4, da5, da6, da7, da8);
  TFlowControl = (fcNone, fcCTS, fcDTR, fcSoftware, fcDefault);

  TCommOption = (coParityCheck, coDsrSensitivity, coIgnoreXOff,
    coErrorChar, coNullStrip);
  TCommOptions = set of TCommOption;

  TCommRxCharEvent = procedure(Sender: TObject; Count: Integer) of object;
  TCommErrorEvent = procedure(Sender: TObject; Errors: Integer) of object;

  TCustomComm = class(TComponent)
  private
    FHandle: THandle;
    FDCB: TDCB;
    FComStat: TComStat;
    FReadOS: TOverlapped;
    FWriteOS: TOverlapped;
    FDeviceName: string;
    FCommConfig: TCommConfig;
    FCommEventThread: TCommEventThread;
    FMonitorEvents: TCommEventType;
    FErrors: dword;
    FBaudRate: TBaudRate;
    FParity: TParity;
    FStopbits: TStopbits;
    FDatabits: TDatabits;
    FReadBufSize: Integer;
    FWriteBufSize: Integer;
    FCharsTimeout: Integer;
    FOptions: TCommOptions;
    FEventChars: TCommEventChars;
    FFlowControl: TFlowControl;
    FOnBreak: TNotifyEvent;
    FOnCTS: TNotifyEvent;
    FOnDSR: TNotifyEvent;
    FOnError: TCommErrorEvent;
    FOnRing: TNotifyEvent;
    FOnRLSD: TNotifyEvent;
    FOnRxChar: TCommRxCharEvent;
    FOnRxFlag: TNotifyEvent;
    FOnTxEmpty: TNotifyEvent;
    procedure SetDeviceName(Value: string);
    procedure SetMonitorEvents(Value: TCommEventType);
    procedure SetBaudRate(Value: TBaudRate);
    procedure SetParity(Value: TParity);
    procedure SetStopbits(Value: TStopBits);
    procedure SetDatabits(Value: TDatabits);
    procedure SetReadBufSize(Value: Integer);
    procedure SetWriteBufSize(Value: Integer);
    procedure SetCharsTimeout(Value: Integer);
    procedure SetOptions(Value: TCommOptions);
    procedure SetFlowControl(Value: TFlowControl);
    procedure ConfigureHandshaking(var DCB: TDCB);
    procedure HandleCommEvent(Sender: TObject; Status: dword);
    function GetProviderSubtype: Integer;
    function GetModemState(Index: Integer): Boolean;
    procedure EscapeComm(Flag: Integer);
    procedure UpdateDataControlBlock;
  protected
    procedure CreateHandle; virtual;
    procedure DestroyHandle;
    procedure EventStateChange(Event: Integer); virtual;
    property DeviceName: string read FDeviceName write SetDeviceName;
    property MonitorEvents: TCommEventType read FMonitorEvents write SetMonitorEvents;
    property BaudRate: TBaudRate read FBaudRate write SetBaudRate default cbr9600;
    property Parity: TParity read FParity write SetParity default paNone;
    property Stopbits: TStopbits read FStopbits write SetStopbits default sb10;
    property Databits: TDatabits read FDatabits write SetDatabits default da8;
    property ReadBufSize: Integer read FReadBufSize write SetReadBufSize default 4096;
    property WriteBufSize: Integer read FWriteBufSize write SetWriteBufSize default 2048;
    property CharsTimeOut: Integer read FCharsTimeOut write SetCharsTimeOut default 250;
    property Options: TCommOptions read FOptions write SetOptions;
    property FlowControl: TFlowControl read FFlowControl write SetFlowControl default fcDefault;
    property EventChars: TCommEventChars read FEventChars;
    {Comm Signal Events}
    property OnBreak: TNotifyEvent read FOnBreak write FOnBreak;
    property OnCTS: TNotifyEvent read FOnCTS write FOnCTS;
    property OnDSR: TNotifyEvent read FOnDSR write FOnDSR;
    property OnRing: TNotifyEvent read FOnRing write FOnRing;
    property OnRLSD: TNotifyEvent read FOnRLSD write FOnRLSD;
    property OnError: TCommErrorEvent read FOnError write FOnError;
    property OnRxChar: TCommRxCharEvent read FOnRxChar write FOnRxChar;
    property OnRxFlag: TNotifyEvent read FOnRxFlag write FOnRxFlag;
    property OnTxEmpty: TNotifyEvent read FOnTxEmpty write FOnTxEmpty;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Enabled: Boolean;
    procedure Open;
    procedure Close;
    function Write(const Buf; Count: Integer): Integer;
    function Read(var Buf; Count: Integer): Integer;
    function InQueCount: Integer;
    function OutQueCount: Integer;
    procedure PurgeIn;
    procedure PurgeOut;
    {Comm escape functions}
    procedure SetDTRState(State: Boolean);
    procedure SetRTSState(State: Boolean);
    procedure SetBREAKState(State: Boolean);
    procedure SetXONState(State: Boolean);
    {Comm status flags}
    property CTS: Boolean index 1 read GetModemState;
    property DSR: Boolean index 2 read GetModemState;
    property RING: Boolean index 3 read GetModemState;
    property RLSD: Boolean index 4 read GetModemState;
    {DeviceHandle property}
    property Handle: THandle read FHandle;
    property ProviderSubtype: Integer read GetProviderSubtype;
  end;

  TComm = class(TCustomComm)
    property DeviceName;
    property MonitorEvents;
    property BaudRate;
    property Parity;
    property Stopbits;
    property Databits;
    property ReadBufSize;
    property WriteBufSize;
    property CharsTimeOut;
    property Options;
    property FlowControl;
    property EventChars;
    property OnBreak;
    property OnCTS;
    property OnDSR;
    property OnRing;
    property OnRLSD;
    property OnError;
    property OnRxChar;
    property OnRxFlag;
    property OnTxEmpty;
  end;


function GetProviderSubTypeName(Id: Integer): string;

procedure Register;

implementation

const
  SOpenError = 'Error accessing specified device';
  SInvalidHandle = 'Invalid device handle, access denied';
  SPortAssigned = 'Device already assigned (open)';
  SPortNotOpen = 'Port not open, unable to complete operation';
  SSetupCommErr = 'Error initializing Read/Write Buffers';
  SUpdateDCBErr = 'Error updating DataControlBlock';
  SCommTimeoutsErr = 'Error updating CommTimeouts';
  SEscFuncError = 'EscapeCommFunction failure';
  SMsgExt = ' (Error: %d) ';

  fBinary           = $00000001;
  fParity           = $00000002;
  fOutxCtsFlow      = $00000004;
  fOutxDsrFlow      = $00000008;
  fDtrControl       = $00000030;
  fDsrSensitivity   = $00000040;
  fTXContinueOnXoff = $00000080;
  fOutX             = $00000100;
  fInX              = $00000200;
  fErrorChar        = $00000400;
  fNull             = $00000800;
  fRtsControl       = $00003000;
  fAbortOnError     = $00004000;
  fDummy2           = $FFFF8000;

  CommEventList: array[TCommEventState] of dword =
   (EV_BREAK, EV_CTS, EV_DSR, EV_ERR, EV_RING, EV_RLSD, EV_RXCHAR, EV_RXFLAG, EV_TXEMPTY);

  CommBaudRates: array[TBaudRate] of Integer =
    (CBR_110, CBR_300, CBR_600, CBR_1200, CBR_2400, CBR_4800, CBR_9600,
     CBR_14400, CBR_19200, CBR_38400, CBR_56000, CBR_57600, CBR_115200,
     CBR_128000, CBR_256000);

  CommDataBits: array[TDatabits] of Integer = (4, 5, 6, 7, 8);

  CommParity: array[TParity] of Integer =
    (NOPARITY, ODDPARITY, EVENPARITY, MARKPARITY, SPACEPARITY);

  CommStopBits: array[TStopbits] of Integer = (ONESTOPBIT, ONE5STOPBITS, TWOSTOPBITS);

  CommOptions: array[TCommOption] of Integer =
    (fParity, fDsrSensitivity, fTXContinueOnXoff, fErrorChar, fNull);

{RaiseCommError}
procedure RaiseCommError(Msg: string; ErrCode: Integer);
var
  E: ECommError;
begin
  E := ECommError.Create(Msg + Format(SMsgExt, [ErrCode]));
  E.ErrorCode := ErrCode;
   raise E;
end; {RaiseCommError}

{GetProviderSubtypeName}
function GetProviderSubTypeName(Id: Integer): string;
begin
  case Id of
    PST_FAX: Result := 'FAX device';
    PST_LAT: Result := 'LAT protocol';
    PST_MODEM: Result := 'Modem device';
    PST_NETWORK_BRIDGE: Result := 'Unspecified network bridge';
    PST_PARALLELPORT: Result := 'Parallel port';
    PST_RS232: Result := 'RS-232 serial port';
    PST_RS422: Result := 'RS-422 port';
    PST_RS423: Result := 'RS-423 port';
    PST_RS449: Result := 'RS-449 port';
    PST_SCANNER: Result := 'Scanner device';
    PST_TCPIP_TELNET: Result := 'TCP/IP Telnet protocol';
    PST_UNSPECIFIED: Result := 'Unspecified';
    PST_X25: Result := 'X.25 standards';
    else
      Result := 'Unknown provider id';
  end;
end; {GetProviderSubtypeName}

{TCommEventThread}

constructor TCommEventThread.Create(Handle: THandle; Events: TCommEventType);
var
  EvIndex: TCommEventState;
  AttrWord: dword;
begin
  Inherited Create(true);
  Priority := tpHighest;
  FHandle := Handle;
  AttrWord := 0;
  for EvIndex := evBREAK to evTXEMPTY do
    if EvIndex in Events then
      AttrWord := AttrWord or CommEventList[EvIndex];
  SetCommMask(FHandle, AttrWord);
  Resume;
end;

destructor TCommEventThread.Destroy;
begin
  CloseHandle(hCloseEvent);
  Inherited Destroy;
end;

procedure TCommEventThread.Execute;
var
  HandlesToWaitFor: array[0..2] of THandle;
  dwHandleSignaled: DWORD;
  BytesTransferred: DWORD;
  OverlappedCommEvent: TOverlapped;
begin
  FillChar(OverlappedCommEvent, Sizeof(OverlappedCommEvent), 0);
  hCloseEvent := CreateEvent(nil, True, False, nil);
  OverlappedCommEvent.hEvent := CreateEvent(nil, True, True, nil);
  HandlesToWaitFor[0] := hCloseEvent;
  HandlesToWaitFor[1] := OverlappedCommEvent.hEvent;
  repeat
    WaitCommEvent(FHandle, FStatus, @OverlappedCommEvent);
    dwHandleSignaled := WaitForMultipleObjects(2, @HandlesToWaitFor, False, INFINITE);
    case dwHandleSignaled of
      WAIT_OBJECT_0    : Break;
      WAIT_OBJECT_0 + 1:
          if GetOverlappedResult(FHandle, OverlappedCommEvent,
             BytesTransferred, false) then Synchronize(DoOnSignal);
      else
        Break;
    end;
  until Terminated;
  PurgeComm(FHandle, PURGE_RXABORT + PURGE_RXCLEAR);
  CloseHandle(OverlappedCommEvent.hEvent);
end;

procedure TCommEventThread.ReleaseThread;
begin
  SetEvent(hCloseEvent);
  Terminate;
end;

procedure TCommEventThread.DoOnSignal;
begin
  if Assigned(FOnSignal) then
    FOnSignal(Self, FStatus);
end;


{TCommEventChars}

constructor TCommEventChars.Create(Owner: TCustomComm);
begin
  Inherited Create;
  FOwner := Owner;
  FXonChar := #17;
  FXoffChar := #19;
end;

procedure TCommEventChars.SetXonChar(Value: Char);
begin
  if FXonChar <> Value then
  begin
    FXonChar := Value;
    FOwner.UpdateDataControlBlock;
  end;
end;

procedure TCommEventChars.SetXoffChar(Value: Char);
begin
  if FXoffChar <> Value then
  begin
    FXoffChar := Value;
    FOwner.UpdateDataControlBlock;
  end;
end;

{TCustomComm}

constructor TCustomComm.Create(AOwner: TComponent);
begin
  Inherited Create(AOwner);
  FHandle := INVALID_HANDLE_VALUE;
  FDeviceName := DefaultDeviceName;
  FMonitorEvents := [evBreak, evCTS, evDSR, evError, evRing,
    evRlsd, evRxChar, evRxFlag, evTxEmpty];
  FOptions := [];
  FBaudRate := cbr9600;
  FParity := paNone;
  FStopbits := sb10;
  FDatabits := da8;
  FReadBufSize := 4096;
  FWriteBufSize := 2048;
  FCharsTimeout := 250;
  FFlowControl := fcDefault;
  FEventChars := TCommEventChars.Create(self);
end;

destructor TCustomComm.Destroy;
begin
  Close;
  FEventChars.Free;
  Inherited Destroy;
end;

function TCustomComm.Enabled: Boolean;
begin
  Result := FHandle <> INVALID_HANDLE_VALUE;
end;

procedure TCustomComm.CreateHandle;
begin
  FHandle := CreateFile(PCHAR(FDeviceName), GENERIC_READ or GENERIC_WRITE,
    0, nil, OPEN_EXISTING, FILE_FLAG_OVERLAPPED, 0);

  if FHandle = INVALID_HANDLE_VALUE then
    RaiseCommError(SOpenError, GetLastError);

  if GetFileType(FHandle) <> FILE_TYPE_CHAR then
  begin
    DestroyHandle;
    RaiseCommError(SInvalidHandle, -1);
  end;
end;

procedure TCustomComm.DestroyHandle;
begin
  CloseHandle(FHandle);
  FHandle := INVALID_HANDLE_VALUE;
end;

procedure TCustomComm.Open;
var
  Size: Integer;
begin
  Close;

  SetLastError(0);

  CreateHandle;

  if Enabled then
  begin
    FCommEventThread := TCommEventThread.Create(FHandle, FMonitorEvents);
    FCommEventThread.OnSignal := HandleCommEvent;

    Size := Sizeof(TCommConfig);
    GetCommConfig(FHandle, FCommConfig, Cardinal(Size));

    UpdateDataControlBlock;

    if not SetupComm(FHandle, FReadBufSize, FWriteBufSize) then
      RaiseCommError(SSetupCommErr, GetLastError);

    SetCharsTimeout(FCharsTimeout);
  end;
end;

procedure TCustomComm.Close;
begin
  if Enabled then
  begin
    if FCommEventThread <> nil then
    begin
      FCommEventThread.ReleaseThread;
      FCommEventThread.WaitFor;
      FCommEventThread.Free;
      FCommEventThread := nil;
    end;
    FCommConfig.dwProviderSubtype := Cardinal(-1);
    DestroyHandle;
  end;
end;

function TCustomComm.Write(const Buf; Count: Integer): Integer;
begin
  FillChar(FWriteOS, Sizeof(FWriteOS), 0);
  if not WriteFile(FHandle, Buf, Count, Cardinal(Result), @FWriteOS) then Result := -1;
end;

function TCustomComm.Read(var Buf; Count: Integer): Integer;
begin
  FillChar(FReadOS, Sizeof(FReadOS), 0);
  if not ReadFile(FHandle, Buf, Count, Cardinal(Result), @FReadOS) then Result := -1;
end;

procedure TCustomComm.EventStateChange(Event: Integer);
begin
  case Event of
    EV_BREAK:
      if assigned(FOnBreak) then FOnBreak(self);
    EV_CTS:
      if assigned(FOnCTS) then FOnCTS(self);
    EV_DSR:
      if assigned(FOnDSR) then FOnDSR(self);
    EV_ERR:
      if assigned(FOnError) then FOnError(self, FErrors);
    EV_RING:
      if assigned(FOnRing) then FOnRing(self);
    EV_RLSD:
      if assigned(FOnRLSD) then FOnRLSD(self);
    EV_RXCHAR:
      if assigned(FOnRxChar) then FOnRxChar(self, FComStat.cbInQue);
    EV_RXFLAG:
      if assigned(FOnRxFlag) then FOnRxFlag(self);
    EV_TXEMPTY:
      if assigned(FOnTxEmpty) then FOnTxEmpty(self);
  end;
end;

procedure TCustomComm.HandleCommEvent(Sender: TObject; Status: dword);
var
  EvIndex: TCommEventState;
begin
  ClearCommError(FHandle, FErrors, @FComStat);
  for EvIndex := evBREAK to evTXEMPTY do
    if Status and CommEventList[EvIndex] > 0 then
      EventStateChange(CommEventList[EvIndex]);
end;

procedure TCustomComm.UpdateDataControlBlock;
var
  OptIndex: TCommOption;
begin
  if Enabled then
  begin
    GetCommState(FHandle, FDCB);
    FDCB.BaudRate := CommBaudRates[FBaudRate];
    FDCB.Parity := CommParity[FParity];
    FDCB.Stopbits := CommStopbits[FStopbits];
    FDCB.Bytesize := CommDatabits[FDatabits];
    FDCB.XonChar := FEventChars.XonChar;
    FDCB.XoffChar := FEventChars.XOffChar;
    FDCB.XonLim := FReadBufSize div 4;
    FDCB.XoffLim := FReadBufSize div 4;

    ConfigureHandshaking(FDCB);

    for OptIndex := coParityCheck to coNullStrip do
      if OptIndex in FOptions then FDCB.Flags := FDCB.Flags or CommOptions[OptIndex]
        else FDCB.Flags := FDCB.Flags and not CommOptions[OptIndex];
    if not SetCommState(FHandle, FDCB) then
      RaiseCommError(SUpdateDCBErr, GetLastError);
  end;
end;

procedure TCustomComm.SetDeviceName(Value: string);
begin
  if Enabled then
    RaiseCommError(SPortAssigned, -1);
  FDeviceName := Value;
end;

procedure TCustomComm.SetMonitorEvents(Value: TCommEventType);
begin
  if Enabled then
    RaiseCommError(SPortAssigned, -1);
  FMonitorEvents := Value;
end;

procedure TCustomComm.SetBaudRate(Value: TBaudRate);
begin
  if FBaudRate <> Value then
  begin
    FBaudRate := Value;
    UpdateDataControlBlock;
  end;
end;

procedure TCustomComm.SetParity(Value: TParity);
begin
  if FParity <> Value then
  begin
    FParity := Value;
    UpdateDataControlBlock;
  end;
end;

procedure TCustomComm.SetStopbits(Value: TStopbits);
begin
  if FStopBits <> Value then
  begin
    FStopbits := Value;
    UpdateDataControlBlock;
  end;
end;

procedure TCustomComm.SetDataBits(Value: TDatabits);
begin
  if FDataBits <> Value then
  begin
    FDataBits:=Value;
    UpdateDataControlBlock;
  end;
end;

procedure TCustomComm.SetReadBufSize(Value: Integer);
begin
  if Enabled then
    RaiseCommError(SPortAssigned, -1);
  FReadBufSize := Value;
end;

procedure TCustomComm.SetWriteBufSize(Value: Integer);
begin
  if Enabled then
    RaiseCommError(SPortAssigned, -1);
  FWriteBufSize := Value;
end;

procedure TCustomComm.SetCharsTimeout(Value: Integer);
var
  CommTimeouts: TCommTimeouts;
begin
  FCharsTimeOut := Value;
  if Enabled then
  begin
    FillChar(CommTimeOuts, Sizeof(CommTimeOuts), 0);
    if (FCharsTimeOut = 0) then
      CommTimeouts.ReadIntervalTimeout := MAXDWORD
    else CommTimeouts.ReadIntervalTimeout := FCharsTimeOut;

   //If you notice some strange behaviour after writing to the
   //port, try different values below for WriteTimeOut values.
   CommTimeouts.WriteTotalTimeoutConstant := 1000;
   CommTimeouts.WriteTotalTimeoutConstant := 1500;

    if not SetCommTimeOuts(FHandle, CommTimeOuts) then
      RaiseCommError(SCommTimeoutsErr, GetLastError);
  end;
end;

procedure TCustomComm.SetOptions(Value: TCommOptions);
begin
  if FOptions <> Value then
  begin
    FOptions := Value;
    UpdateDataControlBlock;
  end;
end;

procedure TCustomComm.SetFlowControl(Value: TFlowControl);
begin
  if FFlowControl <> Value then
  begin
    FFlowControl := Value;
    UpdateDataControlBlock;
  end;
end;

function TCustomComm.InQueCount: Integer;
var
  ComStat: TComStat;
  Errors: dword;
begin
  if Enabled then
  begin
    ClearCommError(FHandle, Errors, @ComStat);
    Result := ComStat.cbInQue;
  end else Result := -1;
end;

function TCustomComm.OutQueCount: Integer;
var
  ComStat: TComStat;
  Errors: dword;
begin
  if Enabled then
  begin
    ClearCommError(FHandle, Errors, @ComStat);
    Result := ComStat.cbOutQue;
  end else Result := -1;
end;

procedure TCustomComm.PurgeIn;
begin
  if Enabled then
    PurgeComm(FHandle, PURGE_RXABORT or PURGE_RXCLEAR);
end;

procedure TCustomComm.PurgeOut;
begin
  if Enabled then
    PurgeComm(FHandle, PURGE_TXABORT or PURGE_TXCLEAR);
end;

function TCustomComm.GetModemState(Index: Integer): boolean;
var
  Flag, State: dword;
begin
  case Index of
    1: State := MS_CTS_ON;
    2: State := MS_DSR_ON;
    3: State := MS_RING_ON;
    4: State := MS_RLSD_ON;
    else
      State := 0;
  end;
  Result := false;
  if Enabled then
    if GetCommModemStatus(FHandle, Flag) then
      Result := (Flag and State > 0);
end;

procedure TCustomComm.EscapeComm(Flag: Integer);
var
  Escaped: Boolean;
begin
  if Enabled then
  begin
    Escaped := EscapeCommFunction(FHandle, Flag);
    if not Escaped then
      RaiseCommError(SEscFuncError, GetLastError);
  end else RaiseCommError(SPortNotOpen, -1);
end;

procedure TCustomComm.SetDTRState(State: boolean);
const
  DTR: array[boolean] of Integer = (CLRDTR, SETDTR);
begin
  EscapeComm(DTR[State]);
end;

procedure TCustomComm.SetRTSState(State: boolean);
const
  RTS: array[boolean] of Integer = (CLRRTS, SETRTS);
begin
  EscapeComm(RTS[State]);
end;

procedure TCustomComm.SetBREAKState(State: Boolean);
const
  BREAK: array[boolean] of Integer = (CLRBREAK, SETBREAK);
begin
  EscapeComm(BREAK[State]);
  if Enabled then
    PurgeComm(FHandle, PURGE_RXABORT + PURGE_RXCLEAR +
      PURGE_TXABORT + PURGE_TXCLEAR);
end;

procedure TCustomComm.SetXONState(State: Boolean);
const
  XON: array[boolean] of Integer = (SETXOFF, SETXON);
begin
  EscapeComm(XON[State]);
end;

procedure TCustomComm.ConfigureHandshaking(var DCB: TDCB);
begin
  if FFlowControl <> fcDefault then
  begin
    DCB.Flags := DCB.Flags and (not fOutxCtsFlow);
    DCB.Flags := DCB.Flags and (not fRtsControl) or (RTS_CONTROL_TOGGLE shl 12);
    DCB.Flags := DCB.Flags and (not fOutxDsrFlow);
    DCB.Flags := DCB.Flags and (not fDtrControl) or (DTR_CONTROL_ENABLE shl 4);
    DCB.Flags := DCB.Flags and (not fOutX) and (not fInX);
  end;

  case FFlowControl of
    fcCTS:
      DCB.Flags := DCB.Flags or fOutxCtsFlow;
    fcDTR:
      DCB.Flags := DCB.Flags or fOutxDsrFlow;
    fcSoftware:
      DCB.Flags := DCB.Flags or fOutX or fInX;
  end;
end;

function TCustomComm.GetProviderSubtype: Integer;
begin
  Result := FCommConfig.dwProviderSubType;
end;


procedure Register;
begin
  RegisterComponents('Varian Freeware', [TComm]);
end;

end.
