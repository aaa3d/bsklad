{*******************************************************}
{                                                       }
{                       EhLib v1.5                      }
{                TMonthCalendar component               }
{                                                       }
{           Part of ComCtrls unit from Delphi 4         }
{                                                       }
{*******************************************************}

unit MonthCal;

interface

uses Messages, Windows, SysUtils, CommCtrl, Classes, Controls, Forms,
  Menus, Graphics, StdCtrls, RichEdit, ToolWin;

resourcestring
  sDateTimeMax = 'Date exceeds maximum of %s';
  sDateTimeMin = 'Date is less than minimum of %s';
  sNeedAllowNone = 'You must be in ShowCheckbox mode to set to this date';
  sFailSetCalDateTime = 'Failed to set calendar date or time';
  sFailSetCalMaxSelRange = 'Failed to set maximum selection range';
  sFailSetCalMinMaxRange = 'Failed to set calendar min/max range';
  sCalRangeNeedsMultiSelect = 'Date range can only be used in multiselect mode';
  sFailsetCalSelRange = 'Failed to set calendar selected range';
  sInvalidComCtl32 = 'This control requires version 4.70 or greater of COMCTL32.DLL';  

type
{ Calendar common control support }

  TCommonCalendar = class;

  ECommonCalendarError = class(Exception);

  TMonthCalColors = class(TPersistent)
  private
    Owner: TCommonCalendar;
    FBackColor: TColor;
    FTextColor: TColor;
    FTitleBackColor: TColor;
    FTitleTextColor: TColor;
    FMonthBackColor: TColor;
    FTrailingTextColor: TColor;
    procedure SetColor(Index: Integer; Value: TColor);
    procedure SetAllColors;
  public
    constructor Create(AOwner: TCommonCalendar);
    procedure Assign(Source: TPersistent); override;
  published
    property BackColor: TColor index 0 read FBackColor write SetColor default clWindow;
    property TextColor: TColor index 1 read FTextColor write SetColor default clWindowText;
    property TitleBackColor: TColor index 2 read FTitleBackColor write SetColor default clActiveCaption;
    property TitleTextColor: TColor index 3 read FTitleTextColor write SetColor default clWhite;
    property MonthBackColor: TColor index 4 read FMonthBackColor write SetColor default clWhite;
    property TrailingTextColor: TColor index 5 read FTrailingTextColor
      write SetColor default clInactiveCaptionText;
  end;

  TCalDayOfWeek = (dowMonday, dowTuesday, dowWednesday, dowThursday,
    dowFriday, dowSaturday, dowSunday, dowLocaleDefault);

  TOnGetMonthInfoEvent = procedure(Sender: TObject; Month: DWORD;
    var MonthBoldInfo: DWORD) of object;

  TDateTimeColors = TMonthCalColors;  // for backward compatibility

  TCommonCalendar = class(TWinControl)
  private
    FCalColors: TMonthCalColors;
    FCalExceptionClass: ExceptClass;
    FDateTime: TDateTime;
    FEndDate: TDate;
    FFirstDayOfWeek: TCalDayOfWeek;
    FMaxDate: TDate;
    FMaxSelectRange: Integer;
    FMinDate: TDate;
    FMonthDelta: Integer;
    FMultiSelect: Boolean;
    FShowToday: Boolean;
    FShowTodayCircle: Boolean;
    FWeekNumbers: Boolean;
    FOnGetMonthInfo: TOnGetMonthInfoEvent;
    function DoStoreEndDate: Boolean;
    function DoStoreMaxDate: Boolean;
    function DoStoreMinDate: Boolean;
    function GetDate: TDate;
    procedure SetCalColors(Value: TMonthCalColors);
    procedure SetDate(Value: TDate);
    procedure SetDateTime(Value: TDateTime);
    procedure SetEndDate(Value: TDate);
    procedure SetFirstDayOfWeek(Value: TCalDayOfWeek);
    procedure SetMaxDate(Value: TDate);
    procedure SetMaxSelectRange(Value: Integer);
    procedure SetMinDate(Value: TDate);
    procedure SetMonthDelta(Value: Integer);
    procedure SetMultiSelect(Value: Boolean);
    procedure SetRange(MinVal, MaxVal: TDate);
    procedure SetSelectedRange(Date, EndDate: TDate);
    procedure SetShowToday(Value: Boolean);
    procedure SetShowTodayCircle(Value: Boolean);
    procedure SetWeekNumbers(Value: Boolean);
  protected
    procedure CheckEmptyDate; virtual;
    procedure CheckValidDate(Value: TDate); virtual;
    procedure CreateWnd; override;
    function GetCalendarHandle: HWND; virtual; abstract;
    function GetCalStyles: DWORD; virtual;
    function MsgSetCalColors(ColorIndex: Integer; ColorValue: TColor): Boolean; virtual; abstract;
    function MsgSetDateTime(Value: TSystemTime): Boolean; virtual; abstract;
    function MsgSetRange(Flags: Integer; SysTime: PSystemTime): Boolean; virtual; abstract;
    property CalColors: TMonthCalColors read FCalColors write SetCalColors;
    property CalendarHandle: HWND read GetCalendarHandle;
    property CalExceptionClass: ExceptClass read FCalExceptionClass write FCalExceptionClass;
    property Date: TDate read GetDate write SetDate;
    property DateTime: TDateTime read FDateTime write SetDateTime;
    property EndDate: TDate read FEndDate write SetEndDate stored DoStoreEndDate;
    property FirstDayOfWeek: TCalDayOfWeek read FFirstDayOfWeek write SetFirstDayOfWeek
      default dowLocaleDefault;
    property MaxDate: TDate read FMaxDate write SetMaxDate stored DoStoreMaxDate;
    property MaxSelectRange: Integer read FMaxSelectRange write SetMaxSelectRange default 31;
    property MinDate: TDate read FMinDate write SetMinDate stored DoStoreMinDate;
    property MonthDelta: Integer read FMonthDelta write SetMonthDelta default 1;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    property ShowToday: Boolean read FShowToday write SetShowToday default True;
    property ShowTodayCircle: Boolean read FShowTodayCircle write
      SetShowTodayCircle default True;
    property WeekNumbers: Boolean read FWeekNumbers write SetWeekNumbers default False;
    property OnGetMonthInfo: TOnGetMonthInfoEvent read FOnGetMonthInfo write FOnGetMonthInfo;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BoldDays(Days: array of DWORD; var MonthBoldInfo: DWORD);
  end;

{ TMonthCalendar }

  EMonthCalError = class(ECommonCalendarError);

  TMonthCalendar = class(TCommonCalendar)
  private
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
  protected
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; 
    procedure ConstrainedResize(var MinWidth, MinHeight, MaxWidth,
      MaxHeight: Integer);
    procedure CreateParams(var Params: TCreateParams); override;
    function GetCalendarHandle: HWND; override;
    function MsgSetCalColors(ColorIndex: Integer; ColorValue: TColor): Boolean; override;
    function MsgSetDateTime(Value: TSystemTime): Boolean; override;
    function MsgSetRange(Flags: Integer; SysTime: PSystemTime): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align;
//    property Anchors;
//    property AutoSize;
//    property BorderWidth;
//    property BiDiMode;
    property CalColors;
//    property Constraints;
    property MultiSelect;  // must be before date stuff
    property Date;
    property DragCursor;
//    property DragKind;
    property DragMode;
    property Enabled;
    property EndDate;
    property FirstDayOfWeek;
    property Font;
    property ImeMode;
    property ImeName;
    property MaxDate;
    property MaxSelectRange;
    property MinDate;
//    property ParentBiDiMode;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property ShowToday;
    property ShowTodayCircle;
    property TabOrder;
    property TabStop;
    property Visible;
    property WeekNumbers;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
//    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetMonthInfo;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
//    property OnStartDock;
    property OnStartDrag;
  end;


implementation

{ TMonthCalColors }

const
  ColorIndex: array[0..5] of Integer = (MCSC_BACKGROUND, MCSC_TEXT,
    MCSC_TITLEBK, MCSC_TITLETEXT, MCSC_MONTHBK, MCSC_TRAILINGTEXT);

constructor TMonthCalColors.Create(AOwner: TCommonCalendar);
begin
  Owner := AOwner;
  FBackColor := clWindow;
  FTextColor := clWindowText;
  FTitleBackColor := clActiveCaption;
  FTitleTextColor := clWhite;
  FMonthBackColor := clWhite;
  FTrailingTextColor := clInactiveCaptionText;
end;

procedure TMonthCalColors.Assign(Source: TPersistent);
var
  SourceName: string;
begin
  if Source = nil then SourceName := 'nil'
  else SourceName := Source.ClassName;
  if (Source = nil) or not (Source is TMonthCalColors) then
    raise EConvertError.CreateFmt('Cannot assign a %s to a %s', [SourceName, ClassName]);
  FBackColor := TMonthCalColors(Source).BackColor;
  FTextColor := TMonthCalColors(Source).TextColor;
  FTitleBackColor := TMonthCalColors(Source).TitleBackColor;
  FTitleTextColor := TMonthCalColors(Source).TitleTextColor;
  FMonthBackColor := TMonthCalColors(Source).MonthBackColor;
  FTrailingTextColor := TMonthCalColors(Source).TrailingTextColor;
end;

procedure TMonthCalColors.SetColor(Index: Integer; Value: TColor);
begin
  case Index of
    0: FBackColor := Value;
    1: FTextColor := Value;
    2: FTitleBackColor := Value;
    3: FTitleTextColor := Value;
    4: FMonthBackColor := Value;
    5: FTrailingTextColor := Value;
  end;
  if Owner.HandleAllocated then
    Owner.MsgSetCalColors(ColorIndex[Index], ColorToRGB(Value));
end;

procedure TMonthCalColors.SetAllColors;
begin
  SetColor(0, FBackColor);
  SetColor(1, FTextColor);
  SetColor(2, FTitleBackColor);
  SetColor(3, FTitleTextColor);
  SetColor(4, FMonthBackColor);
  SetColor(5, FTrailingTextColor);
end;

{ TCommonCalendar }

function InitCommonControl(CC: Integer): Boolean;
var
  ICC: TInitCommonControlsEx;
begin
  ICC.dwSize := SizeOf(TInitCommonControlsEx);
  ICC.dwICC := CC;
  Result := InitCommonControlsEx(ICC);
  if not Result then InitCommonControls;
end;

procedure CheckCommonControl(CC: Integer);
begin
  if not InitCommonControl(CC) then
    raise EComponentError.Create(SInvalidComCtl32);
end;

constructor TCommonCalendar.Create(AOwner: TComponent);
begin
  CheckCommonControl(ICC_DATE_CLASSES);
  inherited Create(AOwner);
  FShowToday := True;
  FShowTodayCircle := True;
  ControlStyle := [csOpaque, csClickEvents, csDoubleClicks, csReflector];
  FCalColors := TDateTimeColors.Create(Self);
  FDateTime := Now;
  FFirstDayOfWeek := dowLocaleDefault;
  FMaxSelectRange := 31;
  FMonthDelta := 1;
end;

destructor TCommonCalendar.Destroy;
begin
  inherited Destroy;
  FCalColors.Free;
end;

procedure TCommonCalendar.BoldDays(Days: array of DWORD; var MonthBoldInfo: DWORD);
var
  I: DWORD;
begin
  MonthBoldInfo := 0;
  for I := Low(Days) to High(Days) do
    if (Days[I] > 0) and (Days[I] < 32) then
      MonthBoldInfo := MonthBoldInfo or ($00000001 shl (Days[I] - 1));
end;

procedure TCommonCalendar.CheckEmptyDate;
begin
  // do nothing
end;

procedure TCommonCalendar.CheckValidDate(Value: TDate);
begin
  if (FMaxDate <> 0.0) and (Value > FMaxDate) then
    raise CalExceptionClass.CreateFmt(sDateTimeMax, [DateToStr(FMaxDate)]);
  if (FMinDate <> 0.0) and (Value < FMinDate) then
    raise CalExceptionClass.CreateFmt(sDateTimeMin, [DateToStr(FMinDate)]);
end;

procedure TCommonCalendar.CreateWnd;
begin
  inherited CreateWnd;
  FCalColors.SetAllColors;
  SetRange(FMinDate, FMaxDate);
  SetMaxSelectRange(FMaxSelectRange);
  SetMonthDelta(FMonthDelta);
  SetFirstDayOfWeek(FFirstDayOfWeek);
  if FMultiSelect then
    SetSelectedRange(FDateTime, FEndDate)
  else
    SetDateTime(FDateTime);
end;

const
 MCS_NOTODAYCIRCLE     = $0008;

function TCommonCalendar.GetCalStyles: DWORD;
const
  ShowTodayFlags: array[Boolean] of DWORD = (MCS_NOTODAY, 0);
  ShowTodayCircleFlags: array[Boolean] of DWORD = (MCS_NOTODAYCIRCLE, 0);
  WeekNumFlags: array[Boolean] of DWORD = (0, MCS_WEEKNUMBERS);
  MultiSelFlags: array[Boolean] of DWORD = (0, MCS_MULTISELECT);
begin
  Result := MCS_DAYSTATE or ShowTodayFlags[FShowToday] or
    ShowTodayCircleFlags[FShowTodayCircle] or WeekNumFlags[FWeekNumbers] or
    MultiSelFlags[FMultiSelect];
end;

function TCommonCalendar.DoStoreEndDate: Boolean;
begin
  Result := FMultiSelect;
end;

function TCommonCalendar.DoStoreMaxDate: Boolean;
begin
  Result := FMaxDate <> 0.0;
end;

function TCommonCalendar.DoStoreMinDate: Boolean;
begin
  Result := FMinDate <> 0.0;
end;

function TCommonCalendar.GetDate: TDate;
begin
  Result := TDate(FDateTime);
end;

procedure TCommonCalendar.SetCalColors(Value: TDateTimeColors);
begin
  if FCalColors <> Value then FCalColors.Assign(Value);
end;

procedure TCommonCalendar.SetDate(Value: TDate);
var
  TruncValue: TDate;
begin
  TruncValue := Trunc(Value);
  Value := TruncValue + Frac(FDateTime);
  if Value = 0.0 then CheckEmptyDate;
  try
    CheckValidDate(TruncValue);
    SetDateTime(Value);
  except
    SetDateTime(FDateTime);
    raise;
  end;
end;

procedure TCommonCalendar.SetDateTime(Value: TDateTime);
var
  ST: TSystemTime;
begin
  DateTimeToSystemTime(Value, ST);
  if FMultiSelect then
    SetSelectedRange(Value, FEndDate)
  else begin
    if HandleAllocated then
      if not MsgSetDateTime(ST) then
        raise ECommonCalendarError.Create(sFailSetCalDateTime);
    FDateTime := Value;
  end;
end;

procedure TCommonCalendar.SetEndDate(Value: TDate);
var
  TruncValue: TDate;
begin
  TruncValue := Trunc(Value);
  if Trunc(FEndDate) <> TruncValue then
  begin
    Value := TruncValue + 0.0;
    if Value = 0.0 then CheckEmptyDate;
    CheckValidDate(TruncValue);
    SetSelectedRange(Date, TruncValue);
  end;
end;

procedure TCommonCalendar.SetFirstDayOfWeek(Value: TCalDayOfWeek);
var
  DOWFlag: Integer;
  A: array[0..1] of char;
begin
  if HandleAllocated then
  begin
    if Value = dowLocaleDefault then
    begin
      GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_IFIRSTDAYOFWEEK, A, SizeOf(A));
      DOWFlag := Ord(A[0]) - Ord('0');
    end
    else
      DOWFlag := Ord(Value);
    if CalendarHandle <> 0 then
      MonthCal_SetFirstDayOfWeek(CalendarHandle, DOWFlag);
  end;
  FFirstDayOfWeek := Value;
end;

procedure TCommonCalendar.SetMaxDate(Value: TDate);
begin
  if (FMinDate <> 0.0) and (Value < FMinDate) then
    raise CalExceptionClass.CreateFmt(sDateTimeMin, [DateToStr(FMinDate)]);
  if FMaxDate <> Value then
  begin
    SetRange(FMinDate, Value);
    FMaxDate := Value;
  end;
end;

procedure TCommonCalendar.SetMaxSelectRange(Value: Integer);
begin
  if FMultiSelect and HandleAllocated then
    if not MonthCal_SetMaxSelCount(CalendarHandle, Value) then
      raise ECommonCalendarError.Create(sFailSetCalMaxSelRange);
  FMaxSelectRange := Value;
end;

procedure TCommonCalendar.SetMinDate(Value: TDate);
begin
  if (FMaxDate <> 0.0) and (Value > FMaxDate) then
    raise CalExceptionClass.CreateFmt(SDateTimeMax, [DateToStr(FMaxDate)]);
  if FMinDate <> Value then
  begin
    SetRange(Value, FMaxDate);
    FMinDate := Value;
  end;
end;

procedure TCommonCalendar.SetMonthDelta(Value: Integer);
begin
  if HandleAllocated and (CalendarHandle <> 0) then
    MonthCal_SetMonthDelta(CalendarHandle, Value);
  FMonthDelta := Value;
end;

procedure TCommonCalendar.SetMultiSelect(Value: Boolean);
begin
  if FMultiSelect <> Value then
  begin
    FMultiSelect := Value;
    if Value then FEndDate := FDateTime
    else FEndDate := 0.0;
    RecreateWnd;
  end;
end;

procedure TCommonCalendar.SetRange(MinVal, MaxVal: TDate);
var
  STA: packed array[1..2] of TSystemTime;
  Flags: DWORD;
  TruncDate, TruncEnd, TruncMin, TruncMax: DWORD{Int64};
begin
  Flags := 0;
  TruncMin := Trunc(MinVal);
  TruncMax := Trunc(MaxVal);
  TruncDate := Trunc(FDateTime);
  TruncEnd := Trunc(FEndDate);
  if TruncMin <> 0 then
  begin
    if TruncDate < TruncMin then SetDate(MinVal);
    if TruncEnd < TruncMin then SetEndDate(MinVal);
    Flags := Flags or GDTR_MIN;
    DateTimeToSystemTime(TruncMin, STA[1]);
  end;
  if TruncMax <> 0 then
  begin
    if TruncDate > TruncMax then SetDate(MaxVal);
    if TruncEnd > TruncMax then SetEndDate(MaxVal);
    Flags := Flags or GDTR_MAX;
    DateTimeToSystemTime(TruncMax, STA[2]);
  end;
  if HandleAllocated then
    if not MsgSetRange(Flags, @STA[1]) then
      raise ECommonCalendarError.Create(sFailSetCalMinMaxRange);
end;

procedure TCommonCalendar.SetSelectedRange(Date, EndDate: TDate);
var
  DateArray: array[1..2] of TSystemTime;
begin
  if not FMultiSelect then
    SetDateTime(Date)
  else begin
    DateTimeToSystemTime(Date, DateArray[1]);
    DateTimeToSystemTime(EndDate, DateArray[2]);
    if HandleAllocated then
      if not MonthCal_SetSelRange(Handle, @DateArray[1]) then
        raise ECommonCalendarError.Create(sFailsetCalSelRange);
    FDateTime := Date;
    FEndDate := EndDate;
  end;
end;

procedure SetComCtlStyle(Ctl: TWinControl; Value: Integer; UseStyle: Boolean);
var
  Style: Integer;
begin
  if Ctl.HandleAllocated then
  begin
    Style := GetWindowLong(Ctl.Handle, GWL_STYLE);
    if not UseStyle then Style := Style and not Value
    else Style := Style or Value;
    SetWindowLong(Ctl.Handle, GWL_STYLE, Style);
  end;
end;

procedure TCommonCalendar.SetShowToday(Value: Boolean);
begin
  if FShowToday <> Value then
  begin
    FShowToday := Value;
    SetComCtlStyle(Self, MCS_NOTODAY, not Value);
  end;
end;

procedure TCommonCalendar.SetShowTodayCircle(Value: Boolean);
begin
  if FShowTodayCircle <> Value then
  begin
    FShowTodayCircle := Value;
    SetComCtlStyle(Self, MCS_NOTODAYCIRCLE, not Value);
  end;
end;

procedure TCommonCalendar.SetWeekNumbers(Value: Boolean);
begin
  if FWeekNumbers <> Value then
  begin
    FWeekNumbers := Value;
    SetComCtlStyle(Self, MCS_WEEKNUMBERS, Value);
  end;
end;

function IsBlankSysTime(const ST: TSystemTime): Boolean;
begin
  with ST do
    Result := (wYear = 0) and (wMonth = 0) and (wDayOfWeek = 0) and
      (wDay = 0) and (wHour = 0) and (wMinute = 0) and (wSecond = 0) and
      (wMilliseconds = 0);
end;

{ TMonthCalendar }

constructor TMonthCalendar.Create(AOwner: TComponent);
begin
  FCalExceptionClass := EMonthCalError;
  inherited Create(AOwner);
  Width := 176;
  Height := 153;
end;

procedure TMonthCalendar.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if HandleAllocated then Perform(WM_SIZE, 0, 0);
end;

procedure TMonthCalendar.CNNotify(var Message: TWMNotify);
var
  ST: PSystemTime;
  I, MonthNo: Integer;
  CurState: PMonthDayState;
begin
  with Message, NMHdr^ do
  begin
    case code of
      MCN_GETDAYSTATE:
        with PNmDayState(NMHdr)^ do
        begin
          FillChar(prgDayState^, cDayState * SizeOf(TMonthDayState), 0);
          if Assigned(FOnGetMonthInfo) then
          begin
            CurState := prgDayState;
            for I := 0 to cDayState - 1 do
            begin
              MonthNo := stStart.wMonth + I;
              if MonthNo > 12 then MonthNo := MonthNo - 12;
              FOnGetMonthInfo(Self, MonthNo, CurState^);
              Inc(CurState);
            end;
          end;
        end;
      MCN_SELECT, MCN_SELCHANGE:
        begin
          ST := @PNMSelChange(NMHdr).stSelStart;
          if not IsBlankSysTime(ST^) then
            FDateTime := SystemTimeToDateTime(ST^);
          if FMultiSelect then
          begin
            ST := @PNMSelChange(NMHdr).stSelEnd;
            if not IsBlankSysTime(ST^) then
              FEndDate := SystemTimeToDateTime(ST^);
          end;
        end;
    end;
  end;
  inherited;
end;

procedure TMonthCalendar.ConstrainedResize(var MinWidth, MinHeight, MaxWidth,
  MaxHeight: Integer);
var
  R: TRect;
  CtlMinWidth, CtlMinHeight: Integer;
begin
  if HandleAllocated then
  begin
    MonthCal_GetMinReqRect(Handle, R);
    with R do
    begin
      CtlMinHeight := Bottom - Top;
      CtlMinWidth := Right - Left;
    end;
    if MinHeight < CtlMinHeight then MinHeight := CtlMinHeight;
    if MinWidth < CtlMinWidth then MinWidth := CtlMinWidth;
  end;
  //inherited ConstrainedResize(MinWidth, MinHeight, MaxWidth, MaxHeight);
end;

procedure TMonthCalendar.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, MONTHCAL_CLASS);
  with Params do
  begin
    Style := Style or GetCalStyles;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW) or
      CS_DBLCLKS;
  end;
end;

function TMonthCalendar.GetCalendarHandle: HWND;
begin
  Result := Handle;
end;

function TMonthCalendar.MsgSetCalColors(ColorIndex: Integer; ColorValue: TColor): Boolean;
begin
  Result := True;
  if HandleAllocated then
    Result := MonthCal_SetColor(Handle, ColorIndex, ColorValue) <> True{DWORD($FFFFFFFF)};
end;

function TMonthCalendar.MsgSetDateTime(Value: TSystemTime): Boolean;
begin
  Result := True;
  if HandleAllocated then
    Result := MonthCal_SetCurSel(Handle, Value);
end;

function TMonthCalendar.MsgSetRange(Flags: Integer; SysTime: PSystemTime): Boolean;
begin
  Result := True;
  if HandleAllocated then
    if Flags <> 0 then Result := MonthCal_SetRange(Handle, Flags, SysTime);
end;

function TMonthCalendar.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
var
  R: TRect;
begin
  if HandleAllocated then
  begin
    Result := True;
    Perform(MCM_GETMINREQRECT, 0, Longint(@R));
    with R do
    begin
      NewWidth := Right - Left;
      NewHeight := Bottom - Top;
    end;
  end
  else Result := False;
end;


end.
