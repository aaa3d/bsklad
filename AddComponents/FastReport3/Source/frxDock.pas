{******************************************}
{ }
{ FastReport v3.0 }
{ Tool controls }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxDock;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons, IniFiles
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxOrientation = (toAny, toVertOnly, toHorzOnly);

  TfrxFloatWindow = class;

  TfrxDock = class(TPanel)
  private
    FRowSize:Integer;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner:TComponent); override;
    procedure AdjustBounds;
    procedure Paint; override;
  published
    property RowSize:Integer read FRowSize write FRowSize default 26;
  end;

  TfrxDragBox = class(TGraphicControl)
  protected
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState;
      X, Y:Integer); override;
    procedure MouseMove(Shift:TShiftState; X, Y:Integer); override;
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState;
      X, Y:Integer); override;
  public
    constructor Create(AOwner:TComponent); override;
    procedure Paint; override;
  end;

  TfrxToolBar = class(TPanel)
  private
    FDragBox:TfrxDragBox;
    FWindow:TfrxFloatWindow;
    FIsFloat:Boolean;
    FDown:Boolean;
    FLastX, FLastY:Integer;
    FOrientation:TfrxOrientation;
    FCanFloat:Boolean;
    function ParentAlign:TAlign;
    function FindDock(AOwner:TWinControl; p:TPoint):Boolean;
    procedure MakeFloat;
    function MoveTo(X, Y:Integer):Boolean;
    function GetVisible:Boolean;
    procedure SetVisible(Value:Boolean);
    procedure DockTo(Dock:TfrxDock; X, Y:Integer);
    procedure FloatTo(X,Y:Integer);
    procedure DoMouseDown(Sender:TObject; Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer);
    procedure DoMouseMove(Sender:TObject; Shift:TShiftState; X,
      Y:Integer);
    procedure DoMouseUp(Sender:TObject; Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer);
    procedure DoResize(Sender:TObject);
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    function GetFloatWindow:TForm;
  protected
    procedure Loaded; override;
    procedure RealignControls;
    function GetClientRect:TRect; override;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
    procedure AdjustBounds;
    procedure AddToDock(Dock:TfrxDock);
    property IsFloat:Boolean read FIsFloat;
    property FloatWindow:TForm read GetFloatWindow;
    property IsVisible:Boolean read GetVisible write SetVisible;
  published
    property CanFloat:Boolean read FCanFloat write FCanFloat default True;
    property Orientation:TfrxOrientation read FOrientation write FOrientation;
  end;

  TfrxTBPanel = class(TPanel)
  protected
    procedure SetParent(AParent:TWinControl); override;
  public
    constructor Create(AOwner:TComponent); override;
    procedure Paint; override;
  end;

  TfrxFloatWindow = class(TForm)
    CloseBtn:TSpeedButton;
    procedure FormDestroy(Sender:TObject);
    procedure FormPaint(Sender:TObject);
    procedure CloseBtnClick(Sender:TObject);
    procedure FormShow(Sender:TObject);
  private
    FPoint:TPoint;
    FDown:Boolean;
  protected
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState;
      X, Y:Integer); override;
    procedure MouseMove(Shift:TShiftState; X, Y:Integer); override;
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState;
      X, Y:Integer); override;
  public
    ToolBar:TfrxToolBar;
    constructor Create(AOwner:TComponent); override;
    procedure CreateParams(var Params:TCreateParams); override;
    procedure Capture;
  end;

  TfrxDockSite = class(TPanel)
  private
    FDown:Boolean;
    FPanelWidth:Integer;
    FSplitter:TGraphicControl;
    procedure SMouseDown(Sender:TObject; Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer);
    procedure SMouseMove(Sender:TObject; Shift:TShiftState; X, Y:Integer);
    procedure SMouseUp(Sender:TObject; Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer);
  public
    constructor Create(AOwner:TComponent); override;
    procedure DockDrop(Source:TDragDockObject; X, Y:Integer); override;
    procedure DockOver(Source:TDragDockObject; X, Y:Integer;
      State:TDragState; var Accept:Boolean); override;
    function DoUnDock(NewTarget:TWinControl; Client:TControl):Boolean; override;
    procedure SetParent(AParent:TWinControl); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight:Integer); override;
    procedure ReloadDockedControl(const AControlName:string;
      var AControl:TControl); override;
  end;

procedure frxSaveToolbarPosition(Ini:TCustomIniFile; t:TfrxToolBar);
procedure frxRestoreToolbarPosition(Ini:TCustomIniFile; t:TfrxToolBar);
procedure frxSaveDock(Ini:TCustomIniFile; d:TfrxDockSite);
procedure frxRestoreDock(Ini:TCustomIniFile; d:TfrxDockSite);
procedure frxSaveFormPosition(Ini:TCustomIniFile; f:TForm);
procedure frxRestoreFormPosition(Ini:TCustomIniFile; f:TForm);

var
  frxRegRootKey:String;

implementation

{$R *.DFM}

uses frxUtils;

const
  rsToolBar = 'ToolBar';
  rsForm = 'Form';
  rsWidth = 'Width';
  rsHeight = 'Height';
  rsTop = 'Top';
  rsLeft = 'Left';
  rsFloat = 'Float';
  rsVisible = 'Visible';
  rsDock = 'Dock';
  rsMaximized = 'Maximized';
  rsData = 'Data';

var
  FloatingToolBars:TList;

procedure AddToToolbarList(t:TfrxToolBar);
begin
  if FloatingToolbars.IndexOf(t)<>-1 then
    FloatingToolbars.Add(t);
end;

procedure RemoveFromToolbarList(t:TfrxToolBar);
var
  i:Integer;
begin
  i:= FloatingToolbars.IndexOf(t);
  if i<>-1 then
    FloatingToolbars.Delete(i);
end;

procedure DestroyToolbarList;
var
  i:Integer;
begin
  for i:= 0 to FloatingToolBars.Count-1 do
    TfrxToolBar(FloatingToolBars[i]).Free;
end;

procedure frxSaveToolbarPosition(Ini:TCustomIniFile; t:TfrxToolBar);
var
  X, Y:integer;
  Name:String;
begin
  Name:= rsToolbar+'.'+t.Name;
  Ini.WriteBool(Name, rsFloat, t.isFloat);
  Ini.WriteBool(Name, rsVisible, t.IsVisible);
  X:= t.Left; Y:= t.Top;
  if t.IsFloat then
  begin
    X:= t.FloatWindow.Left;
    Y:= t.FloatWindow.Top;
  end;
  Ini.WriteInteger(Name, rsLeft, X);
  Ini.WriteInteger(Name, rsTop, Y);
  Ini.WriteInteger(Name, rsWidth, t.Width);
  Ini.WriteInteger(Name, rsHeight, t.Height);
  if t.Parent is TfrxDock then
    Ini.WriteString(Name, rsDock, t.Parent.Name);
end;

procedure frxRestoreToolbarPosition(Ini:TCustomIniFile; t:TfrxToolBar);
var
  X, Y:Integer;
  DN:string;
  NewDock:TfrxDock;
  Name:String;
begin
  Name:= rsToolbar+'.'+t.Name;
  t.IsVisible:= False;
  X:= Ini.ReadInteger(Name, rsLeft, t.Left);
  Y:= Ini.ReadInteger(Name, rsTop, t.Top);
  if Ini.ReadBool(Name, rsFloat, False) then
    t.FloatTo(X, Y)
  else
  begin
    t.Left:= X;
    t.Top:= Y;
    DN:= Ini.ReadString(Name, rsDock, t.Parent.Name);
    if (t.Owner<>nil) then
    begin
      NewDock:= t.Owner.FindComponent(DN) as TfrxDock;
      if (NewDock<>nil) and (NewDock<>t.Parent) then
        t.DockTo(NewDock, X, Y);
    end;
  end;
  t.Width:= Ini.ReadInteger(Name, rsWidth, t.Width);
  t.Height:= Ini.ReadInteger(Name, rsHeight, t.Height);
  t.AdjustBounds;
  t.IsVisible:= Ini.ReadBool(Name, rsVisible, True);
end;

procedure frxSaveDock(Ini:TCustomIniFile; d:TfrxDockSite);
var
  s:TMemoryStream;
begin
  s:= TMemoryStream.Create;
  d.DockManager.SaveToStream(s);
{$IFDEF Delphi9}
  Ini.WriteString(rsDock+'.'+d.Name, rsData+'2005', frxStreamToString(s));
{$ELSE}
  Ini.WriteString(rsDock+'.'+d.Name, rsData, frxStreamToString(s));
{$ENDIF}
  s.Free;
end;

procedure frxRestoreDock(Ini:TCustomIniFile; d:TfrxDockSite);
var
  s:TStream;
  sd:String;
begin
  s:= TMemoryStream.Create;
{$IFDEF Delphi9}
  sd:= Ini.ReadString(rsDock+'.'+d.Name, rsData+'2005', '');
{$ELSE}
  sd:= Ini.ReadString(rsDock+'.'+d.Name, rsData, '');
{$ENDIF}
  frxStringToStream(sd, s);
  s.Position:= 0;
  if s.Size > 0 then
    d.DockManager.LoadFromStream(s);
  s.Free;
end;

procedure frxSaveFormPosition(Ini:TCustomIniFile; f:TForm);
var
  Name:String;
begin
  Name:= rsForm+'.'+f.ClassName;
  Ini.WriteInteger(Name, rsLeft, f.Left);
  Ini.WriteInteger(Name, rsTop, f.Top);
  Ini.WriteInteger(Name, rsWidth, f.Width);
  Ini.WriteInteger(Name, rsHeight, f.Height);
  Ini.WriteBool(Name, rsMaximized, f.WindowState = wsMaximized);
  Ini.WriteBool(Name, rsVisible, f.Visible);
  if f.HostDockSite<>nil then
    Ini.WriteString(Name, rsDock, f.HostDockSite.Name) else
    Ini.WriteString(Name, rsDock, '');
end;

procedure frxRestoreFormPosition(Ini:TCustomIniFile; f:TForm);
var
  Name:String;
  Dock:String;
  cDock:TWinControl;
begin
  Name:= rsForm+'.'+f.ClassName;
  if Ini.ReadBool(Name, rsMaximized, False) then
    f.WindowState:= wsMaximized
  else
    f.SetBounds(Ini.ReadInteger(Name, rsLeft, f.Left),
                Ini.ReadInteger(Name, rsTop, f.Top),
                Ini.ReadInteger(Name, rsWidth, f.Width),
                Ini.ReadInteger(Name, rsHeight, f.Height));
  Dock:= Ini.ReadString(Name, rsDock, '');
  cDock:= frxFindComponent(f.Owner, Dock) as TWinControl;
  if cDock<>nil then
    f.ManualDock(cDock);
  f.Visible:= Ini.ReadBool(Name, rsVisible, True);
end;

{--------------------------------------------------------------------------}
constructor TfrxDock.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  RowSize:= 26;
  Align:= alTop;
end;

procedure TfrxDock.Loaded;
begin
  inherited Loaded;
  AdjustBounds;
end;

procedure TfrxDock.AdjustBounds;
var
  i, Line, LineCount, l, dl:Integer;
  CtlOnLine, NewSize:Integer;
  c:TControl;
  ShiftNeeded:Boolean;
begin
  if ControlCount = 0 then
  begin
    if Align in [alTop, alBottom] then
      Height:= 1 else
      Width:= 1;
    Exit;
  end;
  if Align in [alTop, alBottom] then
    L:= Height else
    L:= Width;
  LineCount:= L div RowSize;
  NewSize:= RowSize * LineCount+1;
  L:= 0;
  dL:= RowSize;
  if Align in [alRight, alBottom] then
  begin
    dL:=-RowSize;
    if Align = alRight then
      L:= Width else
      L:= Height;
  end;
  Line:= 0;
  while Line < LineCount do
  begin
    CtlOnLine:= 0;
    for i:= 0 to ControlCount-1 do
    begin
      c:= Controls[i];
      if c.Visible then
      case Align of
        alLeft:
          if (c.Left = L) or
            ((c.Left < L) and (c.Left+c.Width > L)) then Inc(CtlOnLine);
        alRight:
          if (c.Left+c.Width = L) or
            ((c.Left+c.Width > L) and (c.Left < L)) then Inc(CtlOnLine);
        alTop:
          if (c.Top = L) or
            ((c.Top < L) and (c.Top+c.Height > L)) then Inc(CtlOnLine);
        alBottom:
          if (c.Top+c.Height = L) or
            ((c.Top+c.Height > L) and (c.Top < L)) then Inc(CtlOnLine);
      end;
    end;
    if CtlOnLine = 0 then
    begin
      for i:= 0 to ControlCount-1 do
      begin
        c:= Controls[i];
        if c.Visible then
        begin
          if ((Align = alLeft) and (c.Left > L)) or
             ((Align = alRight) and (c.Left+c.Width > L)) then
            c.Left:= c.Left-RowSize;
          if ((Align = alTop) and (c.Top > L)) or
             ((Align = alBottom) and (c.Top+c.Height > L)) then
            c.Top:= c.Top-RowSize;
        end;
      end;
      Dec(NewSize, RowSize);
      Dec(LineCount);
      Dec(Line);
      if Align in [alTop, alLeft] then Dec(L, dL);
    end;
    Inc(Line);
    Inc(L, dL);
  end;

  ShiftNeeded:= False;
  for i:= 0 to ControlCount-1 do
  begin
    c:= Controls[i];
    if c.Visible then
    begin
      if (Align = alRight) and (c.Left < 0) then
      begin
        ShiftNeeded:= True;
        L:=-c.Left+1;
        Inc(NewSize, L);
        break;
      end;
      if (Align = alBottom) and (c.Top < 0) then
      begin
        ShiftNeeded:= True;
        L:=-c.Top+1;
        Inc(NewSize, L);
        break;
      end;
      if (Align = alTop) and (c.Top+c.Height > NewSize) then
      begin
        NewSize:= c.Top+c.Height+1;
        break;
      end;
      if (Align = alLeft) and (c.Left+c.Width > NewSize) then
      begin
        NewSize:= c.Left+c.Width+1;
        break;
      end;
    end;
  end;
  if ShiftNeeded then
    for i:= 0 to ControlCount-1 do
    begin
      c:= Controls[i];
      if c.Visible then
        if Align = alRight then
          c.Left:= c.Left+L
        else if Align = alBottom then
          c.Top:= c.Top+L;
    end;

  for i:= 0 to ControlCount-1 do
  begin
    c:= Controls[i];
    if c.Visible then
    begin
      if (Align = alRight) and (c.Left+c.Width > NewSize) then
        NewSize:= c.Left+c.Width;
      if (Align = alBottom) and (c.Top+c.Height > NewSize) then
        NewSize:= c.Top+c.Height;
    end;
  end;

  case Align of
    alTop:Height:= NewSize;
    alLeft:Width:= NewSize;
    alBottom:
      if Height < NewSize then
        SetBounds(0, Top-(NewSize-Height), Width, NewSize)
      else
        Height:= NewSize;
    alRight:
      if Width < NewSize then
        SetBounds(Left-(NewSize-Width), Top, NewSize, Height)
      else
        Width:= NewSize;
  end;
end;

procedure TfrxDock.Paint;
var
  R:TRect;
begin
  with Canvas do
  begin
    Brush.Color:= clBtnFace;
    R:= Rect(0, 0, Width, Height);
    FillRect(R);
    if csDesigning in ComponentState then
    begin
      Pen.Color:= clBtnShadow;
      Rectangle(0, 0, Width, Height);
    end;
  end;
end;

{--------------------------------------------------------------------------}
constructor TfrxDragBox.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  Width:= 8;
  Height:= 8;
end;

procedure TfrxDragBox.Paint;
var
  R:TRect;
  i:Integer;
begin
  with Canvas do
  begin
    Brush.Color:= clBtnFace;
    R:= Rect(0, 0, Width, Height);
    FillRect(R);
    Pen.Color:= clBtnShadow;
  end;
  if (Parent as TfrxToolBar).ParentAlign = alTop then
  begin
    for i:= 0 to Height-1 do
      if i mod 2 = 1 then
      begin
        Canvas.MoveTo(2, i);
        Canvas.LineTo(5, i);
      end;
  end
  else if (Parent as TfrxToolBar).ParentAlign = alLeft then
  begin
    for i:= 0 to Width-1 do
      if i mod 2 = 1 then
      begin
        Canvas.MoveTo(i, 2);
        Canvas.LineTo(i, 5);
      end;
  end;
end;

procedure TfrxDragBox.MouseDown(Button:TMouseButton; Shift:TShiftState;
  X, Y:Integer);
var
  p:TPoint;
begin
  p:= ClientToScreen(Point(X, Y));
  p:= Parent.ScreenToClient(p);
  (Parent as TfrxToolBar).DoMouseDown(Self, Button, Shift, P.X, P.Y);
end;

procedure TfrxDragBox.MouseMove(Shift:TShiftState; X, Y:Integer);
var
  p:TPoint;
begin
  p:= ClientToScreen(Point(X, Y));
  p:= Parent.ScreenToClient(p);
  (Parent as TfrxToolBar).DoMouseMove(Self, Shift, P.X, P.Y);
end;

procedure TfrxDragBox.MouseUp(Button:TMouseButton; Shift:TShiftState;
  X, Y:Integer);
var
  p:TPoint;
begin
  p:= ClientToScreen(Point(X, Y));
  p:= Parent.ScreenToClient(p);
  (Parent as TfrxToolBar).DoMouseUp(Self, Button, Shift, P.X, P.Y);
end;

{--------------------------------------------------------------------------}
constructor TfrxToolBar.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  Height:= 26;
  FDragBox:= TfrxDragBox.Create(Self);
  FDragBox.Parent:= Self;
  FDragBox.Align:= alLeft;
  FullRepaint:= False;
  OnMouseDown:= DoMouseDown;
  OnMouseMove:= DoMouseMove;
  OnMouseUp:= DoMouseUp;
  OnResize:= DoResize;
  FCanFloat:= True;
  FOrientation:= toAny;
end;

destructor TfrxToolBar.Destroy;
begin
  FDragBox.Free;
  if FWindow<>nil then
  begin
    Parent:= nil;
    FWindow.Hide;
    FWindow.Free;
  end;
  inherited Destroy;
end;

procedure TfrxToolBar.Loaded;
begin
  inherited Loaded;
  AdjustBounds;
end;

procedure TfrxToolBar.Paint;
var
  R:TRect;
begin
  with Canvas do
  begin
    Brush.Color:= clBtnFace;
    R:= Rect(0, 0, Width, Height);
    FillRect(R);
    if not IsFloat then
      Frame3D(Canvas, R, clBtnHighlight, clBtnShadow, 1);
  end;
end;

function TfrxToolBar.ParentAlign:TAlign;
begin
  Result:= Parent.Align;
  if Result = alBottom then Result:= alTop;
  if Result = alRight then Result:= alLeft;
end;

function TfrxToolBar.GetClientRect:TRect;
begin
  Result:= inherited GetClientRect;
  InflateRect(Result,-1,-1);
end;

function TfrxToolBar.GetVisible:Boolean;
begin
  if IsFloat then
    Result:= FWindow.Visible else
    Result:= Visible;
end;

procedure TfrxToolBar.SetVisible(Value:Boolean);
begin
  if IsFloat then
    FWindow.Visible:= Value else
    Visible:= Value;
end;

procedure TfrxToolBar.DockTo(Dock:TfrxDock; X, Y:Integer);
var
  oldParent:TfrxDock;
begin
  Hide;
  if FWindow<>nil then
  begin
    FWindow.Hide;
    FWindow.Release;
    Parent:= nil;
  end;
  FWindow:= nil;
  oldParent:= nil;
  if (Parent<>nil) and (Parent is TfrxDock) then
    oldParent:= Parent as TfrxDock;
  Parent:= Dock;
  if oldParent<>nil then
    oldParent.AdjustBounds;
  FIsFloat:= False;
  FDragBox.Show;
  RealignControls;
  Left:= X; Top:= Y;
  Show;
  AdjustBounds;
  Dock.AdjustBounds;
  RemoveFromToolbarList(Self);
end;

procedure TfrxToolBar.AddToDock(Dock:TfrxDock);
var
  X,Y:Integer;
begin
  X:= 0; Y:= 0;
  case Dock.Align of
    alTop:
      begin
        X:= 0; Y:= Dock.Height-1;
      end;
    alBottom:
      begin
        X:= 0; Y:=-Height+1;
      end;
    alLeft:
      begin
        X:= Dock.Width-1; Y:= 0;
      end;
    alRight:
      begin
        X:=-Width+1; Y:= 0;
      end;
  end;
  DockTo(Dock, X, Y);
end;

function TfrxToolBar.FindDock(AOwner:TWinControl; p:TPoint):Boolean;
var
  i:Integer;
  c:TControl;
  d:TfrxDock;
begin
  Result:= False;
  for i:= 0 to AOwner.ControlCount-1 do
  begin
    c:= AOwner.Controls[i];
    if c is TfrxDock then
      if (p.X >= c.Left) and (p.X <= c.Left+c.Width) and
         (p.Y >= c.Top) and (p.Y <= c.Top+c.Height) then
      begin
        with c as TfrxDock do
          if ((FOrientation = toHorzOnly) and (Align in [alLeft, alRight])) or
             ((FOrientation = toVertOnly) and (Align in [alTop, alBottom])) then
            break;
        d:= c as TfrxDock;
        if d.Align in [alTop,alBottom] then
        begin
          p:= Point(p.X-d.Left, d.Height-1);
          if p.X+Width > d.Width then
            p.X:= d.Width-Width;
          if p.X < 0 then p.X:= 0;
          if d.Align = alBottom then
            p.Y:=-Height+1;
        end
        else
        begin
          p:= Point(d.Width-1, p.Y-d.Top);
          if p.Y+Height > d.Height then
            p.Y:= d.Height-Height;
          if p.Y < 0 then p.Y:= 0;
          if d.Align = alRight then
            p.X:=-Height+1;
        end;
        DockTo(d, p.X, p.Y);
        SetCaptureControl(Self);
        DoMouseDown(Self, mbLeft, [], 0, 0);
        Result:= True;
        break;
      end;
  end;
end;

procedure TfrxToolBar.RealignControls;
var
  i, j, t:Integer;
  TempCtrl:TControl;
  Ctrls:Array[0..100] of TControl;
begin
  with FDragBox do
    SetBounds(0, 0, Width, Height);
  for i:= 0 to ControlCount-1 do
    Ctrls[i]:= Controls[i];
  for i:= 0 to ControlCount-1 do
    for j:= 0 to ControlCount-2 do
      if Ctrls[j].Visible then
        if Parent.Align in [alTop, alBottom, alNone] then
        begin
          if Ctrls[j].Left > Ctrls[j+1].Left then
          begin
            TempCtrl:= Ctrls[j+1];
            Ctrls[j+1]:= Ctrls[j];
            Ctrls[j]:= TempCtrl;
          end;
        end
        else
        begin
          if (Ctrls[j].Align in [alTop, alBottom]) and
             (Ctrls[j+1].Align in [alTop, alBottom]) and
             (Ctrls[j].Top > Ctrls[j+1].Top) then
          begin
            TempCtrl:= Ctrls[j];
            Ctrls[j]:= Ctrls[j+1];
            Ctrls[j+1]:= TempCtrl;
          end;
        end;
  case Parent.Align of
    alTop, alBottom, alNone:
    begin
      if Height > Width then
      begin
        t:= Width;
        Width:= Height;
        Height:= t;
      end;
      for t:= 0 to ControlCount-1 do
        if (Ctrls[t]<>nil) and Ctrls[t].Visible then
          if not (Ctrls[t].Align in [alLeft, alRight]) then
            if (Ctrls[t].Align = alBottom) then
              Ctrls[t].Align:= alRight
            else
            begin
              Ctrls[t].Left:= Ctrls[t].Top;
              Ctrls[t].Align:= alLeft;
            end;
    end;
    alLeft, alRight:
    begin
      if Width > Height then
      begin
        t:= Width;
        Width:= Height;
        Height:= t;
      end;
      for t:= 0 to ControlCount-1 do
        if (Ctrls[t]<>nil) and Ctrls[t].Visible then
          if not (Ctrls[t].Align in [alTop, alBottom]) then
            if (Ctrls[t].Align = alRight) then
              Ctrls[t].Align:= alBottom
            else
            begin
              Ctrls[t].Top:= Ctrls[t].Left;
              Ctrls[t].Align:= alTop;
            end;
    end;
  end;
end;

procedure TfrxToolBar.AdjustBounds;
var
  i, max:Integer;
  c:TControl;
begin
  RealignControls;
  max:= 0;
  for i:= 0 to ControlCount-1 do
  begin
    c:= Controls[i];
    if c.Visible then
      if Parent.Align in [alTop, alBottom, alNone] then
        Inc(max, c.Width)
      else
        Inc(max, c.Height);
  end;
  if Parent.Align in [alTop, alBottom, alNone] then
    Width:= max+4 else
    Height:= max+4;
end;

procedure TfrxToolBar.MakeFloat;
var
  p:TPoint;
begin
  FIsFloat:= True;
  GetCursorPos(p);
  FloatTo(p.X, p.Y);
  FWindow.Capture;
end;

procedure TfrxToolBar.FloatTo(X, Y:Integer);
var
  oldParent:TfrxDock;
begin
  FIsFloat:= True;
  if FWindow = nil then
  begin
    oldParent:= nil;
    if (Parent<>nil) and (Parent is TfrxDock) then
      oldParent:= Parent as TfrxDock;
    Hide;
    FDragBox.Hide;
    FWindow:= TfrxFloatWindow.Create(GetParentForm(Self));
    FWindow.BorderStyle:= bsNone;
    FWindow.Left:= X;
    FWindow.Top:= Y;
    FWindow.Caption:= Caption;
    Parent:= FWindow;
    RealignControls;
    AdjustBounds;
    if oldParent<>nil then
      oldParent.AdjustBounds;
    FWindow.ClientWidth:= Width+6;
    FWindow.ClientHeight:= Height+21;
    FWindow.ToolBar:= Self;
    Left:= 3; Top:= 18;
    Show;
    FWindow.Show;
    AddToToolbarList(Self);
  end
  else
    FWindow.SetBounds(X, Y, FWindow.Width, FWindow.Height);
end;

function TfrxToolBar.MoveTo(X, Y:Integer):Boolean;
var
  i, n, oldSize, ShiftCount:Integer;
  c:TControl;
  procedure Shift(ax,ay:Integer);
  begin
    x:= ax;
    y:= ay;
    Inc(ShiftCount);
  end;
begin
  Result:= True;
  if IsFloat then Exit;
  n:= 0;
  repeat
    ShiftCount:= 0;
    if ParentAlign = alTop then
    begin
      if x <-20 then FIsFloat:= True;
      if x < 0 then Shift(0, y);
      if x+Width > Parent.Width then Shift(Parent.Width-Width, y);
    end
    else // if ParentAlign = alLeft then
    begin
      if y <-20 then FIsFloat:= True;
      if y < 0 then Shift(x, 0);
      if y+Height > Parent.Height then Shift(x, Parent.Height-Height);
    end;
    if not IsFloat then
      for i:= 0 to Parent.ControlCount-1 do
      begin
        c:= Parent.Controls[i];
        if (c<>Self) and c.Visible then
          if ParentAlign = alTop then
          begin
            if ((y >= c.Top) and (y < c.Top+c.Height)) or
               ((y <= c.Top) and (y+Height > c.Top)) then
            begin
              if (x >= c.Left) and (x < c.Left+c.Width) then
                Shift(c.Left+c.Width, y);
              if (x < c.Left) and (x+Width > c.Left) then
                Shift(c.Left-Width, y);
            end;
          end
          else // if ParentAlign = alLeft then
          begin
            if ((x >= c.Left) and (x < c.Left+c.Width)) or
               ((x <= c.Left) and (x+Width > c.Left)) then
            begin
              if (y >= c.Top) and (y < c.Top+c.Height) then
                Shift(x, c.Top+c.Height);
              if (y < c.Top) and (y+Height > c.Top) then
                Shift(x, c.Top-Height);
            end;
          end;
      end;
    Inc(n);
  until (n > 3) or (ShiftCount = 0) or IsFloat;

  if not FCanFloat then FIsFloat:= False;
  if IsFloat then
    MakeFloat
  else
    if n < 3 then
    begin
      if ParentAlign = alTop then
        if (y+Height > Parent.Height) or (y < 0) then
          oldSize:= Parent.Height else
          oldSize:= 0
      else
        if (x+Width > Parent.Width) or (x < 0) then
          oldSize:= Parent.Width else
          oldSize:= 0;
      Left:= x;
      Top:= y;
      (Parent as TfrxDock).AdjustBounds;
      if FCanFloat then
        if ((ParentAlign = alTop) and (Parent.Height = oldSize)) or
           ((ParentAlign = alLeft) and (Parent.Width = oldSize)) then
          MakeFloat;
    end
    else Result:= False;
end;

procedure TfrxToolBar.DoMouseDown(Sender:TObject; Button:TMouseButton;
  Shift:TShiftState; X, Y:Integer);
var
  p:TPoint;
begin
  GetCursorPos(p);
  FLastX:= p.X; FLastY:= p.Y;
  FDown:= True;
end;

procedure TfrxToolBar.DoMouseMove(Sender:TObject; Shift:TShiftState; X,
  Y:Integer);
var
  p:TPoint;
  dx, dy:Integer;
  StepX, StepY:Integer;
  b:Boolean;
begin
  if IsFloat then
  begin
    Cursor:= crDefault;
    FDown:= False;
    Exit;
  end;
  if not FDown then Exit;
  GetCursorPos(p);
  if ParentAlign = alTop then
    StepY:= (Parent as TfrxDock).RowSize else
    StepY:= 1;
  if ParentAlign = alLeft then
    StepX:= (Parent as TfrxDock).RowSize else
    StepX:= 1;
  dx:= (p.X-FLastX) div StepX * StepX;
  dy:= (p.Y-FLastY) div StepY * StepY;
  b:= False;
  if (dx<>0) or (dy<>0) then b:= MoveTo(Left+dx, Top+dy);
  if b then
  begin
    if dx<>0 then FLastX:= p.X;
    if dy<>0 then FLastY:= p.Y;
  end;
end;

procedure TfrxToolBar.DoMouseUp(Sender:TObject; Button:TMouseButton;
  Shift:TShiftState; X, Y:Integer);
begin
  FDown:= False;
end;

procedure TfrxToolBar.DoResize(Sender:TObject);
begin
  if csDestroying in ComponentState then Exit;
  FDragBox.SetBounds(0, 0, 8, 8);
  if ParentAlign = alTop then
    FDragBox.Align:= alLeft else
    FDragBox.Align:= alTop;
end;

procedure TfrxToolBar.WMWindowPosChanged(var Message:TWMWindowPosChanged);
begin
  if csDesigning in ComponentState then
    inherited else
    DefaultHandler(Message);
end;

function TfrxToolBar.GetFloatWindow:TForm;
begin
  Result:= FWindow;
end;

{ TfrxTBPanel }

function GetAlign(al:TAlign):TAlign;
begin
  if al in [alLeft, alRight] then
    Result:= alTop else
    Result:= alLeft;
end;

constructor TfrxTBPanel.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  Align:= alLeft;
  Width:= 8;
  Height:= 8;
end;

procedure TfrxTBPanel.SetParent(AParent:TWinControl);
begin
  inherited;
  if not (csDestroying in ComponentState) and (AParent<>nil) and (Parent is TPanel) then
    Align:= GetAlign(AParent.Parent.Align);
end;

procedure TfrxTBPanel.Paint;
begin
  with Canvas do
  begin
    Brush.Color:= clBtnFace;
    FillRect(Rect(0, 0, Width, Height));
    if csDesigning in ComponentState then
    begin
      Brush.Style:= bsClear;
      Pen.Style:= psDot;
      Pen.Color:= clBtnShadow;
      Rectangle(0, 0, Width-1, Height-1);
    end;
  end;
end;

{ TfrxFloatWindow }

constructor TfrxFloatWindow.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrxFloatWindow.CreateParams(var Params:TCreateParams);
begin
  inherited;
  Params.WndParent:= TForm(Owner).Handle;
end;

procedure TfrxFloatWindow.Capture;
begin
  SetCaptureControl(Self);
  MouseDown(mbLeft, [], 0, 0);
end;

procedure TfrxFloatWindow.MouseDown(Button:TMouseButton; Shift:TShiftState;
  X, Y:Integer);
var
  p:TPoint;
begin
  GetCursorPos(p);
  FPoint:= p;
  Application.ProcessMessages;
  FDown:= True;
end;

procedure TfrxFloatWindow.MouseMove(Shift:TShiftState; X, Y:Integer);
var
  p:TPoint;
begin
  if not FDown or not (ssLeft in Shift) then Exit;
  GetCursorPos(p);
  SetBounds(Left+p.X-FPoint.X, Top+p.Y-FPoint.Y, Width, Height);

  FPoint:= p;
  if ToolBar.FindDock(Owner as TWinControl,
    (Owner as TWinControl).ScreenToClient(p)) then
    Exit;
end;

procedure TfrxFloatWindow.MouseUp(Button:TMouseButton; Shift:TShiftState;
  X, Y:Integer);
begin
  FDown:= False;
end;

procedure TfrxFloatWindow.FormDestroy(Sender:TObject);
begin
  if ToolBar<>nil then
    ToolBar.FWindow:= nil;
end;

procedure TfrxFloatWindow.FormPaint(Sender:TObject);
begin
  with Canvas do
  begin
    Pen.Color:= clGray;
    Pen.Width:= 3;
    Rectangle(1, 1, Width-1, Height-1);

    Brush.Color:= clGray;
    FillRect(Rect(3, 3, Width-3, 18));

    Pen.Width:= 1;
    Pen.Color:= clBtnFace;
    MoveTo(2, 3); LineTo(2, Height-3);
    MoveTo(3, 2); LineTo(Width-3, 2);
    MoveTo(Width-3, 3); LineTo(Width-3, Height-3);
    MoveTo(3, Height-3); LineTo(Width-3, Height-3);

    Font.Color:= clCaptionText;
    Font.Style:= [fsBold];
    TextOut(6, 3, Caption);
  end;
end;

procedure TfrxFloatWindow.CloseBtnClick(Sender:TObject);
begin
  Close;
end;

procedure TfrxFloatWindow.FormShow(Sender:TObject);
begin
  CloseBtn.SetBounds(Width-14, 4, 11, 11);
end;

{ TfrxDockSite }

type
  THackControl = class(TControl)
  end;

constructor TfrxDockSite.Create(AOwner:TComponent);
begin
  inherited;
  DockSite:= True;
  Align:= alLeft;
  Caption:= ' ';
  AutoSize:= True;
  BevelInner:= bvNone;
  BevelOuter:= bvNone;
  Width:= 10;

  FSplitter:= TGraphicControl.Create(Self);
  with FSplitter do
  begin
    Cursor:= crHSplit;
    Visible:= False;
    Width:= 3;
  end;
  THackControl(FSplitter).OnMouseDown:= SMouseDown;
  THackControl(FSplitter).OnMouseMove:= SMouseMove;
  THackControl(FSplitter).OnMouseUp:= SMouseUp;
end;

procedure TfrxDockSite.SetParent(AParent:TWinControl);
begin
  inherited;
  if Parent<>nil then
    FSplitter.Parent:= Parent;
end;

procedure TfrxDockSite.SetBounds(ALeft, ATop, AWidth, AHeight:Integer);
begin
  inherited;
  if FSplitter<>nil then
    if Align<>FSplitter.Align then
    begin
      if Align = alLeft then
        FSplitter.Left:= Left+Width+3 else
        FSplitter.Left:= Left-3;
      FSplitter.Align:= Align;
    end;
end;

procedure TfrxDockSite.DockDrop(Source:TDragDockObject; X, Y:Integer);
begin
  inherited;
  if Width < FPanelWidth then
    Source.Control.Width:= FPanelWidth;
  FSplitter.Show;
end;

procedure TfrxDockSite.DockOver(Source:TDragDockObject; X, Y:Integer;
  State:TDragState; var Accept:Boolean);
begin
  inherited;
  FPanelWidth:= Source.Control.Width;
end;

function TfrxDockSite.DoUnDock(NewTarget:TWinControl; Client:TControl):Boolean;
begin
  Result:= inherited DoUnDock(NewTarget, Client);
  if DockClientCount <= 1 then
    FSplitter.Hide;
end;

procedure TfrxDockSite.SMouseDown(Sender:TObject; Button:TMouseButton;
  Shift:TShiftState; X, Y:Integer);
begin
  FDown:= True;
end;

procedure TfrxDockSite.SMouseMove(Sender:TObject; Shift:TShiftState; X,
  Y:Integer);
begin
  if FDown then
  begin
    AutoSize:= False;
    if Align = alLeft then
      Width:= Width+X else
      Width:= Width-X;
    AutoSize:= True;
  end;
end;

procedure TfrxDockSite.SMouseUp(Sender:TObject; Button:TMouseButton;
  Shift:TShiftState; X, Y:Integer);
begin
  FDown:= False;
end;

procedure TfrxDockSite.ReloadDockedControl(const AControlName:string;
  var AControl:TControl);
begin
  AControl:= FindGlobalComponent(AControlName) as TControl;
end;

{----------------------------------------------------------------------------}

initialization
  FloatingToolBars:= TList.Create;
  frxRegRootKey:= 'Software\FastReport';

finalization
  DestroyToolbarList;
  FloatingToolBars.Free;

end.
