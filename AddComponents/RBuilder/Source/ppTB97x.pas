{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppTB97x;

interface

{$I ppIfDef.pas}

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}

   SysUtils, Classes, Controls, ExtCtrls, Graphics, Forms, Menus, Messages,
   IniFiles,
   ppClass, ppUtils, ppTypes, ppTB97, ppTB97ut;

type

  TppToolbar = class;
  TppDropDownPanel = class;
  TppToolbarButton = class;

  { TppDropDownPanel }
  TppDropDownPanel = class(TPanel)
  private
    FActiveCaption: Boolean;
    FDragging: Boolean;
    FOnHide: TNotifyEvent;
    FOnShow: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    FOnMouseEnter: TNotifyEvent;
    FToolWindow: TppToolWindow97;
    FTearAway: Boolean;
    FTitleBarHint: String;
    FOnToolWindowActivate: TNotifyEvent;
    FOnToolWindowCreate: TNotifyEvent;
    FOnToolWindowShow: TNotifyEvent;
    FOnToolWindowHide: TNotifyEvent;

    function  GetTitleBarRect: TRect;
    function IsActiveCaption(aPoint: TPoint): Boolean;
    procedure SetTearAway(aValue: Boolean);

    {message stuff}
    procedure CMVisibleChanged (var Message: TMessage); message CM_VISIBLECHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMMouseActivate (var Message: TWMMouseActivate); message WM_MOUSEACTIVATE;

    procedure PaintTitleBar;
    procedure ToolWindowVisibleChangedEvent(Sender: TObject);

  protected

    procedure Paint; override;
    procedure CreateParams (var Params: TCreateParams); override;
    procedure Loaded; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure ActivateToolWindow; virtual;
    procedure CreateToolWindow;   virtual;
    procedure FreeToolWindow;     virtual;

    procedure DoCancelHint;
    procedure DoShowHint;

    property OnShow: TNotifyEvent read FOnShow write FOnShow;
    property OnHide: TNotifyEvent read FOnHide write FOnHide;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;

    property ToolWindow: TppToolWindow97 read FToolWindow;

    property TearAway: Boolean read FTearAway write SetTearAway;
    property TitleBarHint: String read FTitleBarHint write FTitleBarHint;

    property OnToolWindowActivate: TNotifyEvent read FOnToolWindowActivate write FOnToolWindowActivate;
    property OnToolWindowCreate: TNotifyEvent read FOnToolWindowCreate  write FOnToolWindowCreate;
    property OnToolWindowShow: TNotifyEvent read FOnToolWindowShow write FOnToolWindowShow;
    property OnToolWindowHide: TNotifyEvent read FOnToolWindowHide write FOnToolWindowHide;

  end; {class, TppDropDownPanel}


  
  { TppToolbarButton }
  TppToolbarButton = class(TppToolbarButton97)
  private
    FActive: Boolean;
    FMouseDownPos: TPoint;
    FDropDownPanel: TppDropDownPanel;
    FOnActivate: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;


    function  GetToolbar: TppToolbar;
    procedure SetDropdownPanel(Value: TppDropDownPanel);
    procedure SetActive(aValue: Boolean);
    procedure ShowDropDownPanel;
    

    procedure DoMouseLeave;
    procedure DoMouseEnter;

    procedure DropDownPanelMouseLeaveEvent(Sender: TObject);
    procedure DropDownPanelMouseEnterEvent(Sender: TObject);

  protected
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;

    procedure MouseEntered; override;
    procedure MouseLeft; override;

    procedure SetParent(aParent: TWinControl); override;

    {can be overridden by descendants to create an on demand create/destroy of
    drop down panels for efficiency}
    procedure DropDownPanelShowEvent(Sender: TObject); virtual;
    procedure DropDownPanelHideEvent(Sender: TObject); virtual;
    function GetDropDownPanel: TppDropDownPanel; virtual;

    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;


  public

    constructor Create(AOwner: TComponent); override;
{$IFDEF WINDOWS}
    destructor Destroy; override;
{$ENDIF}

    procedure Click; override;

{$IFDEF WINDOWS}
    procedure DoCancelHint;
    procedure DoShowHint;
{$ENDIF}

    property Active: Boolean read FActive write SetActive;
    property ToolBar: TppToolbar read GetToolbar;

  published
    property DropDownPanel: TppDropDownPanel read GetDropDownPanel write SetDropdownPanel;

  end; {class, TppToolbarButton}


  { TppToolWindow }
  TppToolWindow = class(TppToolWindow97)
  private
    FLanguageIndex: Longint;
    
  protected
    procedure SetLanguageIndex(aLanguageIndex: Longint); virtual;

  public

    constructor Create(aOwner: TComponent); override;
{$IFDEF Delphi4}
    procedure LoadPreferences(aIniFile: TCustomIniFile); virtual;
    procedure SavePreferences(aIniFile: TCustomIniFile); virtual;
{$ELSE}
    procedure LoadPreferences(aIniFile: TIniFile); virtual;
    procedure SavePreferences(aIniFile: TIniFile); virtual;
{$ENDIF}

    property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;

  end; {class, TppToolWindow }


  { TppToolbar }
  TppToolbar = class(TppToolbar97)
  private
    FActiveButton: TppToolbarButton;
    FLanguageIndex: Longint;
    FTimer: TTimer;

    function GetActive: Boolean;
    procedure TimerEvent(Sender: TObject);

    procedure WMMove (var Message: TWMMove); message WM_MOVE;
  

  protected
    procedure SetLanguageIndex(aLanguageIndex: Longint); virtual;

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    procedure ButtonActivateEvent(Sender: TObject);
    procedure ButtonDeactivateEvent(Sender: TObject);
    procedure ButtonMouseLeaveEvent(Sender: TObject);
    procedure ButtonMouseEnterEvent(Sender: TObject);

    property ActiveButton: TppToolbarButton read FActiveButton;
    property Active: Boolean read GetActive;

    property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;


  end; {class, TppToolbar}


  { TppDock }
  TppDock = class(TppDock97)
  private
    FSplitter: TSplitter;
    FOldClientWidth: Integer;
    FLoaded: Boolean;

    function HasToolwindowsDocked: Boolean;

    procedure AddSplitter;
    procedure RemoveSplitter;

  protected
    procedure AlignControls (aControl: TControl; var Rect: TRect); override;
    procedure ArrangeToolbars; override;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure Loaded; override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    procedure Notification(aComponent: TComponent; Operation: TOperation); override;

  end; {class, TppDock}


  TppHintTimerType = (ttCancel, ttShow);

  {TppHintTimer }
  TppHintTimer = class(TTimer)
  private
    FTimerType: TppHintTimerType;

    procedure TimerEvent(Sender: TObject);

  public
    constructor Create(aOwner: TComponent); override;


    property TimerType: TppHintTimerType read FTimerType write FTimerType;

  end; {class, TppHintTimer}


  function ShowHintTimer: TppHintTimer;
  function CancelHintTimer: TppHintTimer;


implementation

const cDropdownComboWidth = 11;

var
  FShowHintTimer: TppHintTimer;
  FCancelHintTimer: TppHintTimer;
  FHintWindow: THintWindow;


{------------------------------------------------------------------------------}
{ TppDock.Notification}

constructor TppDock.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FSplitter := nil;
  FOldClientWidth := 0;
  FLoaded := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDock.Destroy}

destructor TppDock.Destroy;
begin

  RemoveSplitter;

  inherited Destroy;

end; {constructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDock.Notification}

procedure TppDock.Notification(AComponent: TComponent; Operation: TOperation);
begin

  inherited Notification(aComponent, Operation);

  if (aComponent = FSplitter) and (Operation = opRemove) then
    FSplitter := nil;

end; {procedure, Notification}

{------------------------------------------------------------------------------}
{ TppDock.Notification}

procedure TppDock.Loaded;
begin

  inherited Loaded;

  FLoaded := True;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TppDock.AlignControls}

procedure TppDock.AlignControls (AControl: TControl; var Rect: TRect);
var
  liIndex: Integer;

begin

  if not (aControl is TppToolbar) and not (csDestroying in ComponentState) and
     FLoaded then
    begin

      {resize toolwindows, if needed}
      for liIndex := 0 to ControlCount-1 do
        if Controls[liIndex] is TppToolWindow97 then
          if Position in [ppdpLeft, ppdpRight] then
            begin
              Controls[liIndex].Left := Left;
              Controls[liIndex].Width := Controls[liIndex].Width + (ClientWidth - FOldClientWidth);
            end;

    end;

  inherited AlignControls(aControl, Rect);

end;  {procedure, AlignControls}

{------------------------------------------------------------------------------}
{ TppDock.WMSize}
procedure TppDock.WMSize(var Message: TWMSize);
begin

  inherited;

  FOldClientWidth := ClientWidth;

end;  {procedure, WMSize}

{------------------------------------------------------------------------------}
{ TppDock.ArrangeToolbars}

procedure TppDock.ArrangeToolbars;
begin

  inherited ArrangeToolbars;

  if (csDestroying in ComponentState) or not FLoaded then Exit;

  if HasToolWindowsDocked then
    AddSplitter
  else
    RemoveSplitter;

end;  {procedure, ArrangeToolbars}

{------------------------------------------------------------------------------}
{ TppDock.HasToolWindowsDocked}

function TppDock.HasToolWindowsDocked: Boolean;
var
  liIndex: Integer;

begin
  Result := False;
  liIndex := 0;

  {check for a toolwindow }
  while not Result and (liIndex < ControlCount) do
    if Controls[liIndex] is TppToolWindow97 then
      Result := True
    else
      Inc(liIndex);


end; {function, HasToolWindowsDocked}


{------------------------------------------------------------------------------}
{ TppDock.AddSplitter}

procedure TppDock.AddSplitter;
begin

  if not (Position in [ppdpLeft, ppdpRight]) then Exit;

  if (FSplitter <> nil) then Exit;

  FSplitter := TSplitter.Create(Parent);
  FSplitter.FreeNotification(Self);

  FSplitter.Parent := Parent;
  FSplitter.Width  := 2;

  if (Position = ppdpLeft) then
    FSplitter.Left   := Left + Width
  else
    begin
      FSplitter.Left := Left - 1;
      FSplitter.Align := alRight;
    end;

end;  {procedure, AddSplitter}

{------------------------------------------------------------------------------}
{ TppDock.RemoveSplitter}

procedure TppDock.RemoveSplitter;
begin

  FSplitter.Free;
  FSplitter := nil;

end;  {procedure, RemoveSplitter}


{------------------------------------------------------------------------------}
{ TppHintTimer.Create}

constructor TppHintTimer.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  OnTimer := TimerEvent;

  Enabled := False;

end;  {constructor, Create}

{------------------------------------------------------------------------------}
{ TppHintTimer.Timer}

procedure TppHintTimer.TimerEvent(Sender: TObject);
var
  lControl: TControl;

begin

  if (Tag <= 0) then
    lControl := nil
  else
    lControl := TControl(Tag);

  if lControl = nil then
    Enabled := False

  else if (lControl <> nil) then

{$IFDEF WINDOWS}
    if (lControl is TppToolbarButton) then
      begin
        if FTimerType = ttCancel then
          TppToolbarButton(lControl).DoCancelHint
        else
          TppToolbarButton(lControl).DoShowHint;
      end
    else if (lControl is TppDropDownPanel) then
      begin
        if FTimerType = ttCancel then
          TppDropDownPanel(lControl).DoCancelHint
        else
          TppDropDownPanel(lControl).DoShowHint;
      end;
{$ELSE}
    if (lControl is TppDropDownPanel) then
      begin
        if FTimerType = ttCancel then
          TppDropDownPanel(lControl).DoCancelHint
        else
          TppDropDownPanel(lControl).DoShowHint;
      end;
{$ENDIF}


end;



{------------------------------------------------------------------------------}
{ CancelHintTimer}

function CancelHintTimer: TppHintTimer;
begin

  if (FCancelHintTimer = nil) then
    begin
      FCancelHintTimer := TppHintTimer.Create(nil);
      FCancelHintTimer.TimerType := ttCancel;
      FCancelHintTimer.Interval  := 100;
    end;

  Result := FCancelHintTimer;

end; {function, CancelHintTimer}


{------------------------------------------------------------------------------}
{ ShowHintTimer}

function ShowHintTimer: TppHintTimer;
begin

  if (FShowHintTimer = nil) then
    begin
      FShowHintTimer := TppHintTimer.Create(nil);
      FShowHintTimer.TimerType := ttShow;
    end;

  Result := FShowHintTimer;

end; {function, ShowHintTimer}


{------------------------------------------------------------------------------}
{ GetHintWindow}

function HintWindow: THintWindow;
begin

  if FHintWindow = nil then
    begin
      FHintWindow := THintWindow.Create(Application);
      FHintWindow.Color := Application.HintColor;
      FHintWindow.Visible := False;
    end;

  Result := FHintWindow;

end; {function, GetHintWindow}




{------------------------------------------------------------------------------}
{ GetUniqueGroupIndex}

function GetUniqueGroupIndex(aWinControl: TWinControl): Integer;
var
  liControl: Integer;
  lButton: TppToolbarButton97;

begin

  Result := 1;

  for liControl := 0 to aWinControl.ControlCount-1 do

    if aWinControl.Controls[liControl] is TppToolbarButton97 then
      begin
        lButton := TppToolbarButton97(aWinControl.Controls[liControl]);

        if Result <= lButton.GroupIndex then
          Result := lButton.GroupIndex + 1;

      end;

end; {function, GetUniqueGroupIndex}



{******************************************************************************
 *
 **  T o o l W i n d o w  Plus
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppToolWindow.Create}

constructor TppToolWindow.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  DockableTo := [ppdpLeft, ppdpRight];

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppToolWindow.SetLanguageIndex}

procedure TppToolWindow.SetLanguageIndex(aLanguageIndex: Longint);
begin
  FLanguageIndex := aLanguageIndex;
end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TppToolWindow.LoadPreferences}

{$IFDEF Delphi4}
procedure TppToolWindow.LoadPreferences(aIniFile: TCustomIniFile);
{$ELSE}
procedure TppToolWindow.LoadPreferences(aIniFile: TIniFile);
{$ENDIF}

begin

end; {procedure, LoadPreferences}

{------------------------------------------------------------------------------}
{ TppToolWindow.SavePreferences}

{$IFDEF Delphi4}
procedure TppToolWindow.SavePreferences(aIniFile: TCustomIniFile);
{$ELSE}
procedure TppToolWindow.SavePreferences(aIniFile: TIniFile);
{$ENDIF}
begin

end; {procedure, SavePreferences}


{******************************************************************************
 *
 **  T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppToolbar.Create}

constructor TppToolbar.Create(AOwner: TComponent);
begin

  inherited Create(aOwner);

  FTimer          := TTimer.Create(nil);
  FTimer.Enabled  := False;
  FTimer.Interval := 1000;
  FTimer.OnTimer  := TimerEvent;


  FLanguageIndex := 0;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppToolbar.Destroy}

destructor TppToolbar.Destroy;
begin

  FTimer.Free;
  inherited Destroy;

end;  {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppToolbar.GetActive}

function TppToolbar.GetActive: Boolean;
begin
  Result := (FActiveButton <> nil);

end; {function, GetActive}

{------------------------------------------------------------------------------}
{ TppToolbar.SetLanguageIndex}

procedure TppToolbar.SetLanguageIndex(aLanguageIndex: Longint);
begin
  FLanguageIndex := aLanguageIndex;
end; {procedure, SetLanguageIndex}


{------------------------------------------------------------------------------}
{ TppToolbar.ButtonActivateEvent}

procedure TppToolbar.ButtonActivateEvent(Sender: TObject);
begin

  if not (Sender is TppToolbarButton) then Exit;

  if (FActiveButton <> nil) then
    FActiveButton.Active := False;

{$IFDEF WIN32}   {Delphi cannot handle the auto-popup behavior}
  FActiveButton  := TppToolbarButton(Sender);
{$ENDIF}

end; {procedure, ButtonActivateEvent}

{------------------------------------------------------------------------------}
{ TppToolbar.ButtonDeactivateEvent}

procedure TppToolbar.ButtonDeactivateEvent(Sender: TObject);
begin
  if (FActiveButton = Sender) then
    FActiveButton := nil;

end; {procedure, ButtonDeactivateEvent}


{------------------------------------------------------------------------------}
{ TppToolbar.ButtonMouseEnterEvent}

procedure TppToolbar.ButtonMouseEnterEvent(Sender: TObject);
begin
  if (FActiveButton = Sender) then
    FTimer.Enabled := False;

end; {procedure, ButtonMouseEnterEvent}


{------------------------------------------------------------------------------}
{ TppToolbar.ButtonMouseLeaveEvent}

procedure TppToolbar.ButtonMouseLeaveEvent(Sender: TObject);
begin
  if (FActiveButton = Sender) then
    FTimer.Enabled := True;
    
end; {procedure, ButtonMouseLeaveEvent}

{------------------------------------------------------------------------------}
{ TppToolbar.TimerEvent}

procedure TppToolbar.TimerEvent(Sender: TObject);
begin

  {set the active button to inactive}
  if (FActiveButton <> nil) then
    begin
      FActiveButton.Active := False;
      FActiveButton := nil;
    end;

  FTimer.Enabled := False;

end; {procedure, TimerEvent}

{------------------------------------------------------------------------------}
{ TppToolbar.WMMove}

procedure TppToolbar.WMMove(var Message: TWMMove);
begin

  inherited;

  if FActiveButton <> nil then
    begin
      FActiveButton.Active := False;
      FActiveButton := nil;
    end;


end; {procedure, WMMove}


{******************************************************************************
 *
 **  T o o l b a r B u t t o n 9 7 Plus
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppToolbarButton.Create}

constructor TppToolbarButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FActive := False;
  FDropDownPanel := nil;

  FOnActivate   := nil;
  FOnDeactivate := nil;
  FOnMouseEnter := nil;
  FOnMouseLeave := nil;


{$IFDEF WINDOWS}
  ShowHint := False;
  ParentShowHint := False;

{$ENDIF}

end;  {constructor, Create}


{$IFDEF WINDOWS}
{------------------------------------------------------------------------------}
{ TppToolbarButton.Destroy}

destructor TppToolbarButton.Destroy;
begin

  if (CancelHintTimer.Tag = Longint(Self)) then
    CancelHintTimer.Tag := 0;

  if (ShowHintTimer.Tag = Longint(Self)) then
    ShowHintTimer.Tag := 0;


  inherited Destroy;

end; {destructor, Destroy}

{$ENDIF}



{------------------------------------------------------------------------------}
{ TppToolbarButton.Loaded}

procedure TppToolbarButton.Loaded;
begin
  inherited Loaded;
  if DropDownCombo then
    GroupIndex := 0;
end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TppToolbarButton.SetParent}

procedure TppToolbarButton.SetParent(aParent: TWinControl);
var
  lToolbar: TppToolbar;

begin

  inherited SetParent(aParent);

  lToolbar := GetToolbar;

  if (lToolbar = nil) then
    begin
      FOnActivate   := nil;
      FOnDeactivate := nil;
      FOnMouseEnter := nil;
      FOnMouseLeave := nil;
    end
  else
    begin
      FOnActivate   := lToolbar.ButtonActivateEvent;
      FOnDeactivate := lToolbar.ButtonDeactivateEvent;
      FOnMouseEnter := lToolbar.ButtonMouseEnterEvent;
      FOnMouseLeave := lToolbar.ButtonMouseLeaveEvent;
    end;

end;

{------------------------------------------------------------------------------}
{ TppToolbarButton.GetDropDownPanel}

function TppToolbarButton.GetDropDownPanel: TppDropDownPanel;
begin
  {note: descendants can override this behavior}
  Result := FDropDownPanel;

end; {function, GetDropDownPanel}

{------------------------------------------------------------------------------}
{ TppToolbarButton.SetDropdownPanel}

procedure TppToolbarButton.SetDropdownPanel(Value: TppDropDownPanel);
begin
  if (FDropdownPanel = Value) then Exit;

  FDropdownPanel := Value;

  if (FDropdownPanel <> nil) then
    begin
 
      if not DropDownCombo and (GroupIndex = 0) then
        begin
          if Parent <> nil then
            GroupIndex := GetUniqueGroupIndex(Parent);

          if not AllowAllUp then
            AllowAllUp := True;
        end;

    end;

end; {function, SetDropdownPanel}


{------------------------------------------------------------------------------}
{ TppToolbarButton.GetToolbar}

function TppToolbarButton.GetToolbar: TppToolbar;
begin
  Result := nil;

  if (Parent <> nil) and (Parent is TppToolbar) then
    Result := TppToolbar(Parent);

end; {function, GetToolbar}

{------------------------------------------------------------------------------}
{ TppToolbarButton.SetActive}

procedure TppToolbarButton.SetActive(aValue: Boolean);
begin

  if GetDropDownPanel = nil then Exit;

 FActive := aValue;

  if FActive then
    begin
      if DropDownCombo then
        begin
          Down := False;
          MenuIsDown := True;
          FState := ppbsDown;
          ShowDropDownPanel;
          Invalidate;
        end
      else
        begin
          Down := True;
          ShowDropDownPanel;
        end;

    end
  else
    begin
      if (FDropDownPanel <> nil) then
        FDropDownPanel.Visible := False;
      Down := False;
      FState := ppbsUp;
      MenuIsDown := False;
      Invalidate;
    end;


end; {procedure, SetActive}


{------------------------------------------------------------------------------}
{ TppToolbarButton.Click}

procedure TppToolbarButton.Click;
var
  lbTogglePanel: Boolean;

begin

  {determine whether we need to toggle panel (ie. show/hide}
  if Active then
    lbTogglePanel := True

  else if DropDownCombo then
    lbTogglePanel := (FMouseDownPos.X >= Width-cDropdownComboWidth) and (GetDropDownPanel <> nil)

  else
    lbTogglePanel := (GetDropDownPanel <> nil);

  if lbTogglePanel then
    SetActive(not FActive)
  else
    inherited Click;
    

end; {procedure, Click}


{------------------------------------------------------------------------------}
{ TppToolbarButton.ShowDropDownPanel}

procedure TppToolbarButton.ShowDropDownPanel;
var
  lPos: TPoint;
  lPopupPoint: TPoint;
  lToolbar: TppToolbar;

begin

  if (csDesigning in ComponentState) then Exit;

  MouseCapture := False;

  FDropdownPanel.Parent := Parent.Parent;

  {assign event-handlers}
  FDropDownPanel.OnShow := DropDownPanelShowEvent;
  FDropDownPanel.OnHide := DropDownPanelHideEvent;
  FDropDownPanel.OnMouseEnter := DropDownPanelMouseEnterEvent;
  FDropDownPanel.OnMouseLeave := DropDownPanelMouseLeaveEvent;

  {calc position of panel}

  lToolbar := GetToolbar;

  if (lToolbar <> nil) and (lToolbar.DockedTo <> nil) then

    case lToolbar.DockedTo.Position of
      ppdpLeft:   lPopupPoint := Point(Width+1, 0);
      ppdpRight:  lPopupPoint := Point(-(FDropDownPanel.Width+1), 0);
      ppdpTop:    lPopupPoint := Point(0, Height+1);
      ppdpBottom: lPopupPoint := Point(0, -(FDropDownPanel.Height+1));
    end {case, position}

  else
    lPopupPoint := Point(0, Height+1);


  lPos := ClientToScreen(lPopupPoint);

  if (lPos.Y + FDropDownPanel.Height + 10) > Screen.Height then
    lPopupPoint := Point(lPopupPoint.X, -(FDropDownPanel.Height+1));

  if (lPos.X + FDropDownPanel.Width + 10) > Screen.Width then
    lPopupPoint := Point(-(FDropDownPanel.Width+1), lPopupPoint.Y);


  lPos := ClientToScreen(lPopupPoint);


  FDropDownPanel.Left := lPos.X;
  FDropDownPanel.Top  := lPos.Y;

  {check whether panel fits on screen and adjust if necessary}
  if FDropDownPanel.Top + FDropDownPanel.Height > Screen.Height then
    FDropDownPanel.Top := Screen.Height - FDropDownPanel.Height;

  if FDropDownPanel.Left + FDropDownPanel.Width > Screen.Width then
    FDropDownPanel.Left := Screen.Width - FDropDownPanel.Width;

  if FDropDownPanel.Top < 0 then
    FDropDownPanel.Top := 0;

  if FDropDownPanel.Left < 0 then
    FDropDownPanel.Left := 0;


  FDropDownPanel.Visible := True;

  SetWindowPos(FDropDownPanel.Handle, HWND_TOP, 0, 0, 0, 0,
                SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

end; {procedure, ShowDropDownPanel}


{------------------------------------------------------------------------------}
{ TppToolbarButton.DropDownPanelShowEvent}

procedure TppToolbarButton.DropDownPanelShowEvent(Sender: TObject);
begin

  if DropDownCombo then
    begin
      MenuIsDown := True;
      FState     := ppbsDown;
    end
  else
    Down := True;

  FActive := True;
  
  if Assigned(FOnActivate) then FOnActivate(Self);

end; {procedure, DropDownPanelShowEvent}

{------------------------------------------------------------------------------}
{ TppToolbarButton.DropDownPanelHideEvent}

procedure TppToolbarButton.DropDownPanelHideEvent(Sender: TObject);
begin

  if DropDownCombo then
    begin
      MenuIsDown := False;
      FState     := ppbsUp;
    end
  else
    Down := False;

  FActive := False;

  if Assigned(FOnDeactivate) then FOnDeactivate(Self);


end; {procedure, DropDownPanelHideEvent}

{------------------------------------------------------------------------------}
{ TppToolbarButton.DropDownPanelMouseLeaveEvent}

procedure TppToolbarButton.DropDownPanelMouseLeaveEvent(Sender: TObject);
begin

  DoMouseLeave;

end; {procedure, DropDownPanelMouseLeaveEvent}

{------------------------------------------------------------------------------}
{ TppToolbarButton.DropDownPanelMouseEnterEvent}

procedure TppToolbarButton.DropDownPanelMouseEnterEvent(Sender: TObject);
begin

  DoMouseEnter;

end; {procedure, DropDownPanelMouseLeaveEvent}

{------------------------------------------------------------------------------}
{ TppToolbarButton.DoMouseLeave}

procedure TppToolbarButton.DoMouseLeave;
begin
  if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);

end; {procedure, DoMouseLeave}

{------------------------------------------------------------------------------}
{ TppToolbarButton.DoMouseEnter}

procedure TppToolbarButton.DoMouseEnter;
begin
  if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);

end; {procedure, DoMouseEnter}


{------------------------------------------------------------------------------}
{ TppToolbarButton.MouseEntered}

procedure TppToolbarButton.MouseEntered;
var
  lToolbar: TppToolbar;

begin
  inherited MouseEntered;

{$IFDEF WIN32}    {Delphi 1 cannot handle the auto-popup mode}
  lToolbar := GetToolbar;

  if (lToolbar <> nil) and lToolbar.Active then
   SetActive(True);

{$ELSE} {D1 hint support}

   if HintWindow.Visible then
     {already in hint mode, show hint for this control}
     DoShowHint
  else
    begin
     {turn on hint timer}
      ShowHintTimer.Enabled := True;
      CancelHintTimer.Enabled := False;
      ShowHintTimer.Tag := Longint(Self);
    end;

{$ENDIF}

  DoMouseEnter;


end; {procedure, MouseEntered}


{------------------------------------------------------------------------------}
{ TppToolbarButton.MouseLeft}

procedure TppToolbarButton.MouseLeft;
var
  lPoint: TPoint;
  lPointRect: TRect;
  lIntersectRect: TRect;
  lBoundsRect: TRect;

begin

{$IFDEF WINDOWS}

  if (ShowHintTimer.Tag = Longint(Self)) and HintWindow.Visible then
    begin
      ShowHintTimer.Tag := 0;
      CancelHintTimer.Enabled := True;
    end;

{$ENDIF}


  inherited MouseLeft;


  if not Active or (FDropDownPanel = nil) then Exit;

  {get cursor position and convert screen coordinates}
  GetCursorPos(lPoint);

  lBoundsRect := FDropdownPanel.BoundsRect;
  InflateRect(lBoundsRect, 2, 2);

  lPointRect.TopLeft     := lPoint;
  lPointRect.BottomRight := lPoint;
  InflateRect(lPointRect, 1, 1);

  IntersectRect(lIntersectRect, lPointRect, lBoundsRect);

  if (lIntersectRect.Top = 0) then
    DoMouseLeave;



end; {procedure, MouseLeft}


{------------------------------------------------------------------------------}
{ TppToolbarButton.MouseDown}

procedure TppToolbarButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  FMouseDownPos := Point(X, Y);

  inherited MouseDown(Button, Shift, X, Y);

  {inherited sets MenuIsDown, so need to override the value here}
  if DropDownCombo and Active then
    MenuIsDown := True;

end; {procedure, MouseDown}


{$IFDEF WINDOWS}


{------------------------------------------------------------------------------}
{ TppToolbarButton.DoShowHint}

procedure TppToolbarButton.DoShowHint;
var
  lPoint : TPoint;
  lHintRect: TRect;
  lHintWindow: THintWindow;


begin

  if (Hint = '') then Exit;

  {if cursor position NOT over this button then cancel hit and exit}
  GetCursorPos(lPoint);

  if (FindDragTarget(lPoint, True) <> Self) then
    begin
      DoCancelHint;
      Exit;
    end;

  ShowHintTimer.Tag   := Longint(Self);
  CancelHintTimer.Tag := Longint(Self);

  ShowHintTimer.Enabled   := False;
  CancelHintTimer.Enabled := True;


  lHintWindow := HintWindow;

  {display hint below bottom left corner of speed button}
  lPoint.X := 0;
  lPoint.Y := Height;

  {convert to scree corrdinates}
  lPoint := ClientToScreen(lPoint);

  {set hint window size & position}
  lHintRect.Left   := lPoint.X;
  lHintRect.Top    := lPoint.Y + 5 ;
  lHintRect.Right  := lHintRect.Left +  lHintWindow.Canvas.TextWidth(Hint)  + 6;
  lHintRect.Bottom := lHintRect.Top  +  lHintWindow.Canvas.TextHeight(Hint) + 2;

  lHintWindow.Visible := True;
  lHintWindow.ActivateHint(lHintRect, Hint);


end; {procedure, DoShowHint}

{------------------------------------------------------------------------------}
{ TppToolbarButton.DoCancelHint}

procedure TppToolbarButton.DoCancelHint;
var
  lHintWindow: THintWindow;
  lPoint: TPoint;

begin

  {if cursor position over this button then exit}
  GetCursorPos(lPoint);

  if (FindDragTarget(lPoint, True) = Self) then Exit;

  CancelHintTimer.Tag := 0;
  ShowHintTimer.Tag   := 0;

  CancelHintTimer.Enabled  := False;
  ShowHintTimer.Enabled    := False;

  lHintWindow := HintWindow;

  if (lHintWindow <> nil) and lHintWindow.Visible then
    begin

      lHintWindow.Visible := False;

      {hide hint window}
      if lHintWindow.HandleAllocated then
        ShowWindow(lHintWindow.Handle, SW_HIDE);

    end;

end; {procedure, DoCancelHint}



{$ENDIF}





{******************************************************************************
 *
 ** D r o p D o w n P a n e l 9 7
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDropDownPanel.Create}

constructor TppDropDownPanel.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FToolWindow    := nil;
  FTearAway      := False;
  FActiveCaption := False;
  FDragging :=  False;

  FOnToolWindowActivate := nil;
  FOnToolWindowCreate := nil;

  FOnMouseEnter := nil;
  FOnMouseLeave := nil;

  FOnShow       := nil;
  FOnHide       := nil;


end;  {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDropDownPanel.Destroy}

destructor TppDropDownPanel.Destroy;
begin

  FreeToolWindow;

 if (CancelHintTimer.Tag = Longint(Self)) then
    CancelHintTimer.Tag := 0;

  if (ShowHintTimer.Tag = Longint(Self)) then
    ShowHintTimer.Tag := 0;


  inherited Destroy;
end;

{------------------------------------------------------------------------------}
{ TppDropDownPanel.CreateParams}

procedure TppDropDownPanel.CreateParams (var Params: TCreateParams);
begin
  inherited CreateParams (Params);

  if csDesigning in ComponentState then Exit;

  Params.Style   := WS_POPUP;

{$IFDEF WIN32}
  Params.ExStyle := WS_EX_WINDOWEDGE;
{$ENDIF}

end; {procedure, CreateParams}

{------------------------------------------------------------------------------}
{ TppDropDownPanel.Loaded}

procedure TppDropDownPanel.Loaded;
begin
  Visible := False;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TppDropDownPanel.PaintTitleBar}

procedure TppDropDownPanel.PaintTitleBar;
begin

  Canvas.Brush.Style := bsSolid;

  if FActiveCaption then
    Canvas.Brush.Color := clActiveCaption
  else
    Canvas.Brush.Color := clInactiveCaption;

  Canvas.FillRect(GetTitleBarRect);


end;

{------------------------------------------------------------------------------}
{ TppDropDownPanel.Paint}

procedure TppDropDownPanel.Paint;
begin

  inherited Paint;

  if FTearAway then
    PaintTitleBar;

end; {procedure, Paint}

{------------------------------------------------------------------------------}
{ TppDropDownPanel.SetTearAway}

procedure TppDropDownPanel.SetTearAway(aValue: Boolean);
var
  liControl: Integer;
  liIncrement: Integer;

begin

  if FTearAway = aValue then Exit;

  FTearAway := aValue;

  if (csReading in ComponentState) and (csLoading in ComponentState) then Exit;

  if FTearAway then
    liIncrement := 10
  else
    liIncrement := -10;

  {shift controls}
  for liControl := 0 to ControlCount-1 do
    Controls[liControl].Top  := Controls[liControl].Top +  liIncrement;

  {resize window height}
  Height := Height + liIncrement;


  Invalidate;

end;  {procedure, SetTearAway}


{------------------------------------------------------------------------------}
{ TppDropDownPanel.GetTitleBarRect}

function TppDropDownPanel.GetTitleBarRect: TRect;
begin
  Result := Rect(3, 3, 3 + (Width-6), 3+5);
end;

{------------------------------------------------------------------------------}
{ TppDropDownPanel.WMMouseActivate}

procedure TppDropDownPanel.WMMouseActivate (var Message: TWMMouseActivate);
begin

  if (csDesigning in ComponentState) then
    inherited

  else
    begin
      { do not take focus away from the window that had it }
      Message.Result := MA_NOACTIVATE;

      { Similar to calling BringWindowToTop, but doesn't activate it }
      SetWindowPos (Handle, HWND_TOP, 0, 0, 0, 0,
                            SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
   end;

end;

{------------------------------------------------------------------------------}
{ TppDropDownPanel.CMVisibleChanged}

procedure TppDropDownPanel.CMVisibleChanged (var Message: TMessage);
begin
  inherited;

  if Visible and Assigned(FOnShow) then
    FOnShow(Self)

  else if not Visible and Assigned(FOnHide) then
    FOnHide(Self);

end;  {procedure, CMVisibleChanged}

{------------------------------------------------------------------------------}
{ TppDropDownPanel.CMMouseEnter}

procedure TppDropDownPanel.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);


  if HintWindow.Visible then
     {already in hint mode, show hint for this control}
     DoShowHint
  else
    begin
     {turn on hint timer}
      ShowHintTimer.Enabled := True;

      CancelHintTimer.Enabled := False;
      ShowHintTimer.Tag := Longint(Self);
    end;

end; {procedure, CMMouseEnter}


{------------------------------------------------------------------------------}
{ TppDropDownPanel.CMMouseLeave}

procedure TppDropDownPanel.CMMouseLeave(var Message: TMessage);
var
  lPoint: TPoint;

begin
  inherited;

  {get cursor position and convert screen coordinates}
  GetCursorPos(lPoint);

  lPoint := ScreenToClient(lPoint);

  {check whether cursor is over a control within the panel}
  if (ControlAtPos(lPoint, True) = nil) then
    if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);



  if (ShowHintTimer.Tag = Longint(Self)) and HintWindow.Visible then
    begin
      ShowHintTimer.Tag := 0;
      CancelHintTimer.Enabled := True;
    end;



end; {procedure, CMMouseLeave}


{------------------------------------------------------------------------------}
{ TppDropDownPanel.MouseMove}

procedure TppDropDownPanel.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  lbActiveCaption: Boolean;

begin

  inherited MouseMove(Shift, X, Y);

  if not FTearAway then Exit;

  lbActiveCaption := IsActiveCaption(Point(X,Y));

  {check for a transition}
  if FActiveCaption <> lbActiveCaption then
    begin

      FActiveCaption := lbActiveCaption;

      {repaint the TitleBar as active}
      if FActiveCaption then
        PaintTitleBar

      {activate the toolwindow - i.e. start dragging it}
      else if (ssLeft in Shift) and not FDragging and
           not (csDesigning in ComponentState) then
        ActivateToolWindow

      {repaint TitleBar as inactive}
      else if not FDragging then
        PaintTitleBar;

    end;  {if, FActiveCaption <> lbActiveCaption}

end; {procedure, MouseMove}


{------------------------------------------------------------------------------}
{ TppDropDownPanel.IsActiveCaption}

function TppDropDownPanel.IsActiveCaption(aPoint: TPoint): Boolean;
begin

  {determine whether mouse is over the TitleBar}
  Result := FTearAway and PtInRect(GetTitleBarRect, aPoint);

end; {function, IsActiveCaption}


{------------------------------------------------------------------------------}
{ TppDropDownPanel.ToolWindowVisibleChangedEvent}

procedure TppDropDownPanel.ToolWindowVisibleChangedEvent(Sender: TObject);
begin


  if Visible and  Assigned(FOnToolWindowShow) then
     FOnToolWindowShow(FToolWindow)

  else if not Visible and Assigned(FOnToolWindowHide) then
     FOnToolWindowHide(FToolWindow);

  if FDragging then
    begin

      {turn off dragging}
      FDragging := False;

      {move toolwindow offscreen}
      FToolWindow.SetBounds(-10000, -10000, FToolWindow.Width, FToolWindow.Height);

      {send LButtonDown message to ToolWindow - to start it's dragging}
      SendMessage(FToolWindow.Handle, WM_LButtonDown, 0, 0);

      {get out of the way}
      Hide;

    end;



end; {procedure, ToolWindowVisibleChangedEvent}


{------------------------------------------------------------------------------}
{ TppDropDownPanel.CreateToolWindow}

procedure TppDropDownPanel.CreateToolWindow;
var
  liControl: Integer;
  lControl: TControl;
  lsSaveName: String;
  lStream: TMemoryStream;
  lNewControl: TControl;

begin

  if (FToolWindow <> nil) then Exit;

  {create the ToolWindow and initialize}
  FToolWindow := TppToolWindow97.Create(Owner);
  FToolWindow.Visible := False;

  FToolWindow.SetBounds(-10000, -10000, FToolWindow.Width, FToolWindow.Height);

  {if Owner is TForm then
    FToolWindow.Parent := TForm(Owner);}

  FToolWindow.ClientWidth  := ClientWidth;
  FToolWindow.ClientHeight := ClientHeight-10;
  FToolWindow.Resizable    := False;
  FToolWindow.DockableTo   := [];

  FToolWindow.OnVisibleChanged := ToolWindowVisibleChangedEvent;


  lStream := TMemoryStream.Create;

  {copy of all the controls }
  for liControl := 0 to ControlCount-1 do
    begin

      lControl := Controls[liControl];

      {make sure class is registered}
      if GetClass(lControl.ClassName) = nil then
        RegisterClass(TPersistentClass(lControl.ClassType));

      lsSaveName := lControl.Name;

      {get a unique name}
      lControl.Name := ppGetUniqueName(FToolWindow,  lControl.ClassName, lControl);

      {write to stream}
      lStream.Clear;
      lStream.WriteComponent(lControl);

      lControl.Name := lsSaveName;

      {create new control and read properties from stream }
      lNewControl := TControlClass(lControl.ClassType).Create(FToolWindow);
      lNewControl.Parent := FToolWindow;

      lStream.Position := 0;
      lStream.ReadComponent(lNewControl);

      {adjust position}
      lNewControl.Left := lNewControl.Left;
      lNewControl.Top  := lNewControl.Top - 8;

    end;


   lStream.Free;

  if Assigned(FOnToolWindowCreate) then FOnToolWindowCreate(Self);


end; {procedure, CreateToolWindow}


{------------------------------------------------------------------------------}
{ TppDropDownPanel.FreeToolWindow}

procedure TppDropDownPanel.FreeToolWindow;
begin
  FToolWindow.Free;
  FToolWindow := nil;
end; {procedure, FreeToolWindow}



{------------------------------------------------------------------------------}
{ TppDropDownPanel.ActivateToolWindow}

procedure TppDropDownPanel.ActivateToolWindow;
begin

  if FToolWindow = nil then
    CreateToolWindow;

  if Assigned(FOnToolWindowActivate) then FOnToolWindowActivate(Self);

  if FToolWindow.Visible then
    FToolWindow.Visible := False;

  FDragging := True;

  FToolWindow.Visible := True;

end;


{------------------------------------------------------------------------------}
{ TppDropDownPanel.DoShowHint}

procedure TppDropDownPanel.DoShowHint;
var
  lPoint : TPoint;
  lHintRect: TRect;
  lHintWindow: THintWindow;


begin

  if (FTitleBarHint = '') then Exit;

  GetCursorPos(lPoint);
  lPoint := ScreenToClient(lPoint);

  {if cursor position NOT over this title bar then cancel hint and exit}
  if not IsActiveCaption(lPoint) then
    begin
      DoCancelHint;
      Exit;
    end;

  ShowHintTimer.Tag   := Longint(Self);
  CancelHintTimer.Tag := Longint(Self);

  ShowHintTimer.Enabled   := False;
  CancelHintTimer.Enabled := True;


  lHintWindow := HintWindow;

  {display hint directly below mouse pos}
  lPoint.Y := 12;

  {convert to screen corrdinates}
  lPoint := ClientToScreen(lPoint);

  {set hint window size & position}
  lHintRect.Left   := lPoint.X;
  lHintRect.Top    := lPoint.Y + 5 ;
  lHintRect.Right  := lHintRect.Left +  lHintWindow.Canvas.TextWidth(FTitleBarHint)  + 6;
  lHintRect.Bottom := lHintRect.Top  +  lHintWindow.Canvas.TextHeight(FTitleBarHint) + 2;

  lHintWindow.Visible := True;
  lHintWindow.ActivateHint(lHintRect, FTitleBarHint);


end; {procedure, DoShowHint}

{------------------------------------------------------------------------------}
{ TppDropDownPanel.DoCancelHint}

procedure TppDropDownPanel.DoCancelHint;
var
  lHintWindow: THintWindow;
  lPoint: TPoint;

begin

  GetCursorPos(lPoint);
  lPoint := ScreenToClient(lPoint);

  {if cursor position over this button then exit}
  if IsActiveCaption(lPoint) then Exit;

  CancelHintTimer.Tag := 0;
  ShowHintTimer.Tag   := 0;

  CancelHintTimer.Enabled  := False;
  ShowHintTimer.Enabled    := False;

  lHintWindow := HintWindow;

  if (lHintWindow <> nil) and lHintWindow.Visible then
    begin

      lHintWindow.Visible := False;

      {hide hint window}
      if lHintWindow.HandleAllocated then
        ShowWindow(lHintWindow.Handle, SW_HIDE);

    end;

end; {procedure, DoCancelHint}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppToolbar, TppToolbarButton, TppDropDownPanel]);

  {note: hint window is destroyed automatically by the Application otherwise get a gpf}
  FHintWindow := nil;
  FShowHintTimer := nil;
  FCancelHintTimer := nil;

finalization

  UnRegisterClasses([TppToolbar, TppToolbarButton, TppDropDownPanel]);

  FShowHintTimer.Free;
  FCancelHintTimer.Free;

  FHintWindow := nil;
  FShowHintTimer := nil;
  FCancelHintTimer := nil;

end.
