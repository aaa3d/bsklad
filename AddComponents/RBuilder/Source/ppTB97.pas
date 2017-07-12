{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit ppTB97;

{

  Toolbar97 version 1.6
  by Jordan Russell

  e-mail:     jordanr@iname.com
  home page:  http://www.connect.net/jordanr/
              (alternate address: http://www.digicron.com/jordanr/)

  *PLEASE NOTE*  Before making any bug reports please first verify you are
                 using the latest version by checking my home page. And if
                 you do report a bug, please, if applicable, include a code
                 sample.

  You are free to use Toolbar97 in compiled form for any purpose. However,
  use in commercial or shareware applications requires registration. The
  Toolbar97 source code or DCU, in whole or in part, modified or unmodified,
  may not be redistributed for profit or as part of another commercial or
  shareware software package without express written permission from me.

  This code is distributed "as is" without any warranties, express or implied.

  Notes:
  - I cannot support modified versions of this code. So if you encounter a
    possible bug while using a modified version, always first revert back to
    the my original code before making an attempt to contact me.
  - While debugging the toolbar code you might want to enable the
    'TB97DisableLock' conditional define, as described several pages down.
  - In the WM_NCPAINT handlers, GetWindowRect is used to work around a possibly
    undocumented VCL problem. The Width, Height, and BoundsRect properties are
    sometimes wrong. So it avoids any use of these properties in the WM_NCPAINT
    handlers. If anyone knows of a reason why this is happening, let me know.
  - In case you are unsure of its meaning, NewStyleControls is a VCL variable
    set to True at application startup if the user is running Windows 95 or NT
    4.0 or later.
}

{$IFDEF WIN32}   {DIGIMETA}
{$ALIGN ON}
{$BOOLEVAL OFF}
{$LONGSTRINGS ON}
{$WRITEABLECONST ON}

{$ELSE}
  {$A+,B-}
{$ENDIF}



{x$DEFINE TB97DisableLock}
{ Remove the 'x' to enable the define. It will disable calls to
  LockWindowUpdate, which it calls to disable screen updates while dragging.
  You should temporarily enable that while debugging so you are able to see
  your code window if you have something like a breakpoint that's set inside
  the dragging routines }

{ Determine Delphi/C++Builder version }
{$IFNDEF VER80}
{$IFNDEF VER90}  { if it's not Delphi 2.0 }
  {$IFNDEF VER93}  { and it's not C++Builder 1.0 }
    {$DEFINE TB97Delphi3orHigher}  { then it must be Delphi 3 or higher
                                     (or a future version of C++Builder) }
  {$ENDIF}
{$ENDIF}
{$ENDIF}


interface

{$I ppIfDef.pas}

uses

{$IFDEF WIN32}     {DIGIMETA}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}

  Messages, Classes, Controls, Forms, Menus, Graphics, Buttons,
  StdCtrls, ExtCtrls, ppTB97ut, Dialogs;

type

  TppCustomToolWindow97 = class;

  TppInsertRemoveEvent = procedure (Sender: TObject; Inserting: Boolean;
    Bar: TppCustomToolWindow97) of object;

  TppDock97 = class(TCustomControl)
  private
    { Property values }
    FPosition: TppDockPosition;
    FAllowDrag: Boolean;
    FBoundLines: TppDockBoundLines;
    FBkg, FBkgCache: TBitmap;
    FBkgTransparent, FBkgOnToolbars: Boolean;
    FFixAlign: Boolean;
    FLimitToOneRow: Boolean;
    FOnInsertRemoveBar: TppInsertRemoveEvent;
    FOnResize: TNotifyEvent;

    { Internal }
    DisableArrangeToolbars: Integer; { Increment to disable ArrangeToolbars }
    DockList: TList;  { List of the visible toolbars docked. Items are casted in TppCustomToolWindow97's.
                        But, at design time, all docked toolbars are here regardless of visibility }
    RowSizes: TList;  { List of the width or height of each row, depending on what Position is set to.
                        Items are casted info Longint's }

    { Property access methods }
    procedure SetAllowDrag (Value: Boolean);
    procedure SetBackground (Value: TBitmap);
    procedure SetBackgroundOnToolbars (Value: Boolean);
    procedure SetBackgroundTransparent (Value: Boolean);
    procedure SetBoundLines (Value: TppDockBoundLines);
    procedure SetFixAlign (Value: Boolean);
    procedure SetPosition (Value: TppDockPosition);

    function GetToolbarCount: Integer;
    function GetToolbars (Index: Integer): TppCustomToolWindow97;

    { Internal }
    procedure FreeRowInfo;
    function GetRowOf (const XY: Integer; var Before: Boolean): Integer;
    function GetDesignModeRowOf (const XY: Integer): Integer;
    function GetHighestRow: Integer;
    procedure RemoveBlankRows;
    procedure InsertRowBefore (const BeforeRow: Integer);
    procedure BuildRowInfo;
    procedure ChangeDockList (const Insert: Boolean; const Bar: TppCustomToolWindow97;
      const IsVisible: Boolean);
    procedure ChangeWidthHeight (const IsClientWidthAndHeight: Boolean;
      NewWidth, NewHeight: Integer);

    procedure DrawBackground (const DC: HDC;
      const IntersectClippingRect: TRect; const ExcludeClippingRect: PRect;
      const DrawRect: TRect);

    procedure InvalidateBackgrounds;
    procedure BackgroundChanged (Sender: TObject);
    function UsingBackground: Boolean;

    { Messages }
    procedure CMColorChanged (var Message: TMessage); message CM_COLORCHANGED;
    procedure CMSysColorChange (var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure WMMove (var Message: TWMMove); message WM_MOVE;
    procedure WMSize (var Message: TWMSize); message WM_SIZE;
    procedure WMNCCalcSize (var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint (var Message: TMessage); message WM_NCPAINT;
  protected
    procedure ArrangeToolbars; virtual;
    procedure AlignControls (AControl: TControl; var Rect: TRect); override;
    function GetPalette: HPALETTE; override;
    procedure Loaded; override;
    procedure SetParent (AParent: TWinControl); override;
    procedure Paint; override;
    procedure VisibleChanging; override;
  public
    constructor Create (AOwner: TComponent); override;
    procedure CreateParams (var Params: TCreateParams); override;
    destructor Destroy; override;

    function GetRowSize (const Row: Integer;
      const DefaultToolbar: TppCustomToolWindow97): Integer;

    property ToolbarCount: Integer read GetToolbarCount;
    property Toolbars[Index: Integer]: TppCustomToolWindow97 read GetToolbars;
  published
    property AllowDrag: Boolean read FAllowDrag write SetAllowDrag default True;
    property Background: TBitmap read FBkg write SetBackground;
    property BackgroundOnToolbars: Boolean read FBkgOnToolbars write SetBackgroundOnToolbars default True;
    property BackgroundTransparent: Boolean read FBkgTransparent write SetBackgroundTransparent default False;
    property BoundLines: TppDockBoundLines read FBoundLines write SetBoundLines default [];
    property Color default clBtnFace;
    property FixAlign: Boolean read FFixAlign write SetFixAlign default False;
    property LimitToOneRow: Boolean read FLimitToOneRow write FLimitToOneRow default False;
    property PopupMenu;
    property Position: TppDockPosition read FPosition write SetPosition default ppdpTop;

    property OnInsertRemoveBar: TppInsertRemoveEvent read FOnInsertRemoveBar write FOnInsertRemoveBar;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  end;

  { TppCustomToolWindow97 }

  TppCustomToolWindow97 = class(TCustomControl)
  private
    { Property variables }
    FDockPos, FDockRow: Integer;
    FDocked: Boolean;
    FDockedTo, FDefaultDock: TppDock97;
    FOnRecreating, FOnRecreated, FOnDockChanging, FOnDockChanged,
    FOnVisibleChanged, FOnClose: TNotifyEvent;
    FActivateParent, FHideWhenInactive, FCloseButton, FResizable: Boolean;
    FDockableTo: TppDockableTo;

    { Misc. }
    FUpdatingBounds,           { Incremented while internally changing the bounds. This allows
                                 it to move the toolbar freely in design mode and prevents the
                                 SizeChanging protected method from begin called }
    FDisableArrangeControls,   { Incremented to disable ArrangeControls }
    FHidden: Integer;          { Incremented while the toolbar is temporarily hidden }
    FArrangeNeeded: Boolean;
    FInactiveCaption: Boolean; { True when the caption of the toolbar is currently the inactive color }
    FFloatingTopLeft: TPoint;

    { When floating. These are not used (and FloatParent isn't created) in design mode }
    FFloatParent: TWinControl; { The actual Parent of the toolbar when it is floating }
    MDIParentForm: TForm;     { Either the owner form, or the MDI parent if the owner form is an MDI child form }
    NotOnScreen: Boolean;     { True if the toolbar is currently hidden from view.
                                This is True while the toolbar is creating or when the application is deactivated }
    CloseButtonDown: Boolean; { True if Close button is currently depressed }

    { Property access methods }
    procedure SetCloseButton (Value: Boolean);
    procedure SetDefaultDock (Value: TppDock97);
    procedure SetDockedTo (Value: TppDock97);
    procedure SetDockPos (Value: Integer);
    procedure SetDockRow (Value: Integer);
    procedure SetResizable (Value: Boolean);

    { Internal }
    procedure MoveOnScreen (const OnlyIfFullyOffscreen: Boolean);
    procedure CustomArrangeControls (const ArrangeType: TppToolWindowArrangeType;
      const WasDockedTo, DockingTo: TppDock97; var NewClientSize: TPoint);
    procedure ArrangeControls;
    procedure DrawDraggingOutline (const DC: HDC; const NewRect, OldRect: PRect;
      const NewDocking, OldDocking: Boolean);
    class function NewMainWindowHook (var Message: TMessage): Boolean;
    procedure BeginMoving (const InitX, InitY: Integer);
    procedure BeginSizing (const HitTestValue: Integer; var Accept: Boolean;
      var NewRect: TRect);

    procedure DrawFloatingNCArea (const Clip: HRGN; const RedrawBorder, RedrawCaption, RedrawCloseButton: Boolean);

    procedure DrawDockedNCArea (const Clip: HRGN);
    procedure InvalidateDockedNCArea;
    procedure ValidateDockedNCArea;

    { Messages }
    procedure CMColorChanged (var Message: TMessage); message CM_COLORCHANGED;
    procedure CMTextChanged (var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMShowingChanged (var Message: TMessage); message CM_SHOWINGCHANGED;
    procedure CMVisibleChanged (var Message: TMessage); message CM_VISIBLECHANGED;
    procedure WMActivate (var Message: TWMActivate); message WM_ACTIVATE;
    procedure WMClose (var Message: TWMClose); message WM_CLOSE;
    procedure WMGetMinMaxInfo (var Message: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    procedure WMMove (var Message: TWMMove); message WM_MOVE;
    procedure WMMouseActivate (var Message: TWMMouseActivate); message WM_MOUSEACTIVATE;
    procedure WMNCCalcSize (var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCHitTest (var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCLButtonDown (var Message: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure WMNCPaint (var Message: TMessage); message WM_NCPAINT;
    procedure WMTB97PaintDockedNCArea (var Message: TMessage); message WM_ppTB97PaintDockedNCArea;
  protected
    property ActivateParent: Boolean read FActivateParent write FActivateParent default True;
    property Color default clBtnFace;
    property CloseButton: Boolean read FCloseButton write SetCloseButton default True;
    property DefaultDock: TppDock97 read FDefaultDock write SetDefaultDock;
    property DockableTo: TppDockableTo read FDockableTo write FDockableTo default [ppdpTop, ppdpBottom, ppdpLeft, ppdpRight];
    property HideWhenInactive: Boolean read FHideWhenInactive write FHideWhenInactive default True;
    property Resizable: Boolean read FResizable write SetResizable default True;

    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnRecreated: TNotifyEvent read FOnRecreated write FOnRecreated;
    property OnRecreating: TNotifyEvent read FOnRecreating write FOnRecreating;
    property OnDockChanged: TNotifyEvent read FOnDockChanged write FOnDockChanged;
    property OnDockChanging: TNotifyEvent read FOnDockChanging write FOnDockChanging;
    property OnVisibleChanged: TNotifyEvent read FOnVisibleChanged write FOnVisibleChanged;

    { Overridden methods }
    procedure AlignControls (AControl: TControl; var Rect: TRect); override;
    procedure CreateParams (var Params: TCreateParams); override;
    function GetPalette: HPALETTE; override;
    procedure Loaded; override;
    procedure MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Notification (AComponent: TComponent; Operation: TOperation); override;
    procedure Paint; override;
    function PaletteChanged (Foreground: Boolean): Boolean; override;
    procedure SetParent (AParent: TWinControl); override;

    { Methods accessible to descendants }
    procedure ReadPositionData (const ReadIntProc: TppPositionReadIntProc;
      const ReadStringProc: TppPositionReadStringProc; const ExtraData: Pointer); dynamic;
    procedure DoneReadingPositionData; dynamic;
    procedure WritePositionData (const WriteIntProc: TppPositionWriteIntProc;
      const WriteStringProc: TppPositionWriteStringProc; const ExtraData: Pointer); dynamic;
    procedure GetResizeCaps (var Caps: TppToolWindowResizeCaps); dynamic;
    procedure ResizeBegin (HitTestValue: Integer); dynamic;
    procedure ResizeTrack (var Rect: TRect; const OrigRect: TRect); dynamic;
    procedure ResizeEnd (Accept: Boolean); dynamic;
    procedure GetBarSize (var ASize: Integer; const DockType: TppDockType); virtual; abstract;
    procedure GetDockRowSize (var AHeightOrWidth: Integer);
    procedure GetMinimumSize (var AClientWidth, AClientHeight: Integer); virtual; abstract;
    procedure InitializeOrdering; dynamic;
    procedure OrderControls (const CanMoveControls: Boolean;
      const WasDockedTo, DockingTo: TppDock97; var NewClientSize: TPoint); virtual; abstract;
    procedure SizeChanging (const AWidth, AHeight: Integer); virtual;
    procedure DoOnDockChanging; virtual;
    procedure DoOnDockChanged; virtual;

  public


    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;

    procedure BeginUpdate;
    procedure EndUpdate;

    function  GetFloatParent: TWinControl; {DIGIMETA}
    procedure FreeFloatParent; {DIGIMETA}
    procedure SetInactiveCaption (const Value: Boolean); {DIGIMETA moved from private}
    procedure SetBounds (ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure SetNotOnScreen (const Value: Boolean);  {DIGIMETA moved from private}

    property Caption;
    property Docked: Boolean read FDocked;
    property DockedTo: TppDock97 read FDockedTo write SetDockedTo;
    property DockPos: Integer read FDockPos write SetDockPos default -1;
    property DockRow: Integer read FDockRow write SetDockRow default 0;

  published
    property Height stored False;
    property Width stored False;
    property ClientHeight stored True;
    property ClientWidth stored True;
  end;

  { TppToolbar97 }

  TppToolbar97 = class(TppCustomToolWindow97)
  private
    FFloatingRightX: Integer;
    SizeData: Pointer;

    { Lists }
    SlaveInfo,               { List of slave controls. Items are pointers to TSlaveInfo's }
    GroupInfo,               { List of the control "groups". List items are pointers to TppGroupInfo's }
    LineSeps,                { List of the Y locations of line separators. Items are casted in TppLineSep's }
    OrderList: TList;        { List of the child controls, arranged using the current "OrderIndex" values }

    { Property access methods }
    function GetOrderIndex (Control: TControl): Integer;
    procedure SetOrderIndex (Control: TControl; Value: Integer);

    { Internal }
    function ShouldBeVisible (const Control: TControl; const LeftOrRight: Boolean;
      const SetIt: Boolean): Boolean;
    procedure FreeGroupInfo (const List: TList);
    procedure BuildGroupInfo (const List: TList; const TranslateSlave: Boolean;
      const OldDockType, NewDockType: TppDockType);

    { Messages }
{$IFDEF WIN32}
    procedure CMControlListChange (var Message: TCMControlListChange); message CM_CONTROLLISTCHANGE;
{$ELSE}
    procedure CMControlListChange (var Message: TMessage); message CM_CONTROLLISTCHANGE;
{$ENDIF}


  protected
    procedure Paint; override;

    procedure ReadPositionData (const ReadIntProc: TppPositionReadIntProc;
      const ReadStringProc: TppPositionReadStringProc; const ExtraData: Pointer); override;
    procedure WritePositionData (const WriteIntProc: TppPositionWriteIntProc;
      const WriteStringProc: TppPositionWriteStringProc; const ExtraData: Pointer); override;
    procedure GetResizeCaps (var Caps: TppToolWindowResizeCaps); override;
    procedure ResizeBegin (HitTestValue: Integer); override;
    procedure ResizeTrack (var Rect: TRect; const OrigRect: TRect); override;
    procedure ResizeEnd (Accept: Boolean); override;

    procedure GetBarSize (var ASize: Integer; const DockType: TppDockType); override;
    procedure GetMinimumSize (var AClientWidth, AClientHeight: Integer); override;
    procedure InitializeOrdering; override;
    procedure OrderControls (const CanMoveControls: Boolean;
      const WasDockedTo, DockingTo: TppDock97; var NewClientSize: TPoint); override;
  public
    property OrderIndex[Control: TControl]: Integer read GetOrderIndex write SetOrderIndex;
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetSlaveControl (const ATopBottom, ALeftRight: TControl);

  published
    property ClientHeight stored False;
    property ClientWidth stored False;
    property ActivateParent;
    property Caption;
    property Color;
    property CloseButton;
    property DefaultDock;
    property DockableTo;
    property DockedTo;
    property DockPos;
    property DockRow;
    property HideWhenInactive;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property Visible;

    property OnClose;
    property OnDragDrop;
    property OnDragOver;
    property OnRecreated;
    property OnRecreating;
    property OnDockChanged;
    property OnDockChanging;
    property OnVisibleChanged;
  end;

  { TppToolWindow97 }
  TppToolWindow97 = class(TppCustomToolWindow97)
  private
    FMinClientWidth, FMinClientHeight: Integer;
    FBarHeight, FBarWidth: Integer;
  protected
    procedure CreateParams (var Params: TCreateParams); override;

    procedure ReadPositionData (const ReadIntProc: TppPositionReadIntProc;
      const ReadStringProc: TppPositionReadStringProc; const ExtraData: Pointer); override;
    procedure WritePositionData (const WriteIntProc: TppPositionWriteIntProc;
      const WriteStringProc: TppPositionWriteStringProc; const ExtraData: Pointer); override;
    procedure GetBarSize (var ASize: Integer; const DockType: TppDockType); override;
    procedure GetMinimumSize (var AClientWidth, AClientHeight: Integer); override;
    procedure OrderControls (const CanMoveControls: Boolean;
      const WasDockedTo, DockingTo: TppDock97; var NewClientSize: TPoint); override;
    procedure SizeChanging (const AWidth, AHeight: Integer); override;
  public
    constructor Create (AOwner: TComponent); override;
  published
    property ActivateParent;
    property Color;
    property CloseButton;
    property DefaultDock;
    property DockableTo;
    property DockedTo;
    property DockPos;
    property DockRow;
    property HideWhenInactive;
    property MinClientHeight: Integer read FMinClientHeight write FMinClientHeight default 32;
    property MinClientWidth: Integer read FMinClientWidth write FMinClientWidth default 32;
    property ParentShowHint;
    property PopupMenu;
    property Resizable;
    property ShowHint;
    property TabOrder;
    property Visible;

    property OnClose;
    property OnDragDrop;
    property OnDragOver;
    property OnRecreated;
    property OnRecreating;
    property OnDockChanged;
    property OnDockChanging;
    property OnVisibleChanged;
  end;

  { TToolbarSep97 }

  TppToolbarSepSize = 1..MaxInt;

  TppToolbarSep97 = class(TGraphicControl)
  private
    FBlank: Boolean;
    FSizeHorz, FSizeVert: TppToolbarSepSize;
    procedure SetBlank (Value: Boolean);
    procedure SetSizeHorz (Value: TppToolbarSepSize);
    procedure SetSizeVert (Value: TppToolbarSepSize);
  protected
    procedure MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    procedure SetParent (AParent: TWinControl); override;
  public
    constructor Create (AOwner: TComponent); override;
  published
    { These two properties don't need to be stored since it automatically gets
      resized based on the setting of SizeHorz and SizeVert }
    property Width stored False;
    property Height stored False;
    property Blank: Boolean read FBlank write SetBlank default False;
    property SizeHorz: TppToolbarSepSize read FSizeHorz write SetSizeHorz default 6;
    property SizeVert: TppToolbarSepSize read FSizeVert write SetSizeVert default 6;
  end;


  { TppToolbarButton97 }

  TppToolbarButton97 = class(TGraphicControl)
  private
    FAllowAllUp: Boolean;
    FDisplayMode: TppButtonDisplayMode;
    FDown: Boolean;
    FDropdownArrow: Boolean;
    FDropdownCombo: Boolean;
    FDropdownMenu: TPopupMenu;
    FFlat: Boolean;
    FGlyph: Pointer;
    FGroupIndex: Integer;
    FLayout: TButtonLayout;
    FMargin: Integer;
    FModalResult: TModalResult;
    FNoBorder: Boolean;
    FOldDisabledStyle: Boolean;
    FOpaque: Boolean;
    FShowBorderWhenInactive: Boolean;
    FSpacing: Integer;
    FWordWrap: Boolean;
    FOnMouseEnter, FOnMouseExit: TNotifyEvent;
    { Internal }
    FInClick: Boolean;
    FMouseInControl: Boolean;
    FMouseIsDown: Boolean;
    FMenuIsDown: Boolean;
    FHooked: Boolean;
    FUsesDropdown: Boolean;
    procedure GlyphChanged(Sender: TObject);
    procedure UpdateExclusive;
    procedure SetAllowAllUp (Value: Boolean);
    procedure SetDown (Value: Boolean);
    procedure SetDisplayMode (Value: TppButtonDisplayMode);
    procedure SetDropdownArrow (Value: Boolean);
    procedure SetDropdownCombo (Value: Boolean);
    procedure SetDropdownMenu (Value: TPopupMenu);
    procedure SetFlat (Value: Boolean);
    function GetGlyph: TBitmap;
    procedure SetGlyph (Value: TBitmap);
    function GetGlyphMask: TBitmap;
    procedure SetGlyphMask (Value: TBitmap);
    procedure SetGroupIndex (Value: Integer);
    procedure SetLayout (Value: TButtonLayout);
    procedure SetMargin (Value: Integer);
    procedure SetNoBorder (Value: Boolean);
    function GetNumGlyphs: TppNumGlyphs97;
    procedure SetNumGlyphs (Value: TppNumGlyphs97);
    procedure SetOldDisabledStyle (Value: Boolean);
    procedure SetOpaque (Value: Boolean);
    procedure SetSpacing (Value: Integer);
    procedure SetWordWrap (Value: Boolean);
    procedure UpdateTracking;
    procedure Redraw (const Erase: Boolean);
    procedure ButtonMouseTimerHandler (Sender: TObject);
    class function DeactivateHook (var Message: TMessage): Boolean;
    procedure WMLButtonDblClk (var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure CMEnabledChanged (var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMButtonPressed (var Message: TMessage); message CM_BUTTONPRESSED;
    procedure CMDialogChar (var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMFontChanged (var Message: TMessage); message CM_FONTCHANGED;
    procedure CMTextChanged (var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMSysColorChange (var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMMouseLeave (var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMCancelMode (var Message: TWMCancelMode); message WM_CANCELMODE;
  protected
    FState: TppButtonState97;
    property MenuIsDown: Boolean read FMenuIsDown write FMenuIsDown; {DIGITMETA}

    procedure MouseEntered; virtual; {DIGITMETA - TppToolbarButton overrides these}
    procedure MouseLeft; virtual;



    function GetPalette: HPALETTE; override;
    procedure Loaded; override;
    procedure Notification (AComponent: TComponent; Operation: TOperation); override;
    procedure MouseDown (Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove (Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp (Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Paint; override;
{$IFDEF WINDOWS}
    procedure SetParent(aParent: TWinControl); override;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;
  published
    property AllowAllUp: Boolean read FAllowAllUp write SetAllowAllUp default False;
    property GroupIndex: Integer read FGroupIndex write SetGroupIndex default 0;
    property DisplayMode: TppButtonDisplayMode read FDisplayMode write SetDisplayMode default ppdmBoth;
    property Down: Boolean read FDown write SetDown default False;
    property DragCursor;
    property DragMode;
    property DropdownArrow: Boolean read FDropdownArrow write SetDropdownArrow default True;
    property DropdownCombo: Boolean read FDropdownCombo write SetDropdownCombo default False;
    property DropdownMenu: TPopupMenu read FDropdownMenu write SetDropdownMenu;
    property Caption;
    property Enabled;
    property Flat: Boolean read FFlat write SetFlat default True;
    property Font;
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property GlyphMask: TBitmap read GetGlyphMask write SetGlyphMask;
    property Layout: TButtonLayout read FLayout write SetLayout default blGlyphLeft;
    property Margin: Integer read FMargin write SetMargin default -1;
    property ModalResult: TModalResult read FModalResult write FModalResult default 0;
    property NoBorder: Boolean read FNoBorder write SetNoBorder default False;
    property NumGlyphs: TppNumGlyphs97 read GetNumGlyphs write SetNumGlyphs default 1;
    property OldDisabledStyle: Boolean read FOldDisabledStyle write SetOldDisabledStyle default False;
    property Opaque: Boolean read FOpaque write SetOpaque default True;
    property ParentFont;
    property ParentShowHint;
    property ShowBorderWhenInactive: Boolean read FShowBorderWhenInactive write FShowBorderWhenInactive default False;
    property ShowHint;
    property Spacing: Integer read FSpacing write SetSpacing default 4;
    property Visible;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;

    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseExit: TNotifyEvent read FOnMouseExit write FOnMouseExit;
    property OnMouseMove;
    property OnMouseUp;
{$IFDEF WIN32}  {DIGIMETA}
    property OnStartDrag;
{$ENDIF}
  end;

  { TppEdit97 }

  TppEdit97 = class(TCustomEdit)
  private
    MouseInControl: Boolean;
    procedure RedrawBorder (const Clip: HRGN);
    procedure NewAdjustHeight;
    procedure CMEnabledChanged (var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMFontChanged (var Message: TMessage); message CM_FONTCHANGED;
    procedure CMMouseEnter (var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave (var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMSetFocus (var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus (var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize (var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint (var Message: TMessage); message WM_NCPAINT;
  protected
    procedure Loaded; override;
  public
    constructor Create (AOwner: TComponent); override;
  published
    property CharCase;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    {$IFDEF TB97Delphi3orHigher}
    property ImeMode;
    property ImeName;
    {$ENDIF}
    property MaxLength;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
{$IFDEF WIN32}  {DIGIMETA}
    property OnStartDrag;
{$ENDIF}
  end;

{$IFDEF WIN32}  {DIGIMETA}
procedure ppRegLoadToolbarPositions (const Form: TForm; const BaseRegistryKey: String);
procedure ppRegSaveToolbarPositions (const Form: TForm; const BaseRegistryKey: String);
{$ENDIF}
procedure ppIniLoadToolbarPositions (const Form: TForm; const Filename: String);
procedure ppIniSaveToolbarPositions (const Form: TForm; const Filename: String);

procedure ppCustomLoadToolbarPositions (const Form: TForm;
  const ReadIntProc: TppPositionReadIntProc;
  const ReadStringProc: TppPositionReadStringProc; const ExtraData: Pointer);
procedure ppCustomSaveToolbarPositions (const Form: TForm;
  const WriteIntProc: TppPositionWriteIntProc;
  const WriteStringProc: TppPositionWriteStringProc; const ExtraData: Pointer);

procedure ppAddFloatingNCAreaToRect (var R: TRect; const Resizable: Boolean);
function ppGetDockTypeOf (const Control: TppDock97): TppDockType;


implementation

uses
{$IFDEF WIN32}  {DIGIMETA}
  CommCtrl, Registry,
{$ENDIF}
  IniFiles, SysUtils, Consts, ppIDE;


const
  { Exception messages }
  STB97DockNotFormOwner = 'TppDock97 must be owned by a form';
  STB97DockParentNotAllowed = 'A TppDock97 control cannot be placed inside a TppToolbar97 or another TppDock97';
  STB97DockCannotHide = 'Cannot hide a TppDock97';
  STB97DockCannotChangePosition = 'Cannot change Position of a TppDock97 if it already contains controls';
  STB97ToolwinNotFormOwner = 'Tool windows must be owned by a form';
  STB97ToolwinNameNotSet = 'Cannot save tool window''s position because Name property is not set';
  STB97ToolwinDockedToNameNotSet = 'Cannot save tool window''s position because DockedTo''s Name property not set';
  STB97ToolwinParentNotAllowed = 'A tool window can only be placed on a TppDock97 or directly on the form';
  STB97ToolbarControlNotChildOfToolbar = 'Control is not a child of the toolbar';
  STB97SepParentNotAllowed = 'TppToolbarSep97 can only be placed on a TppToolbar97';

  { All spacing & margin values are here. It's recommended that you don't
    try changing any of this! }
  LineSpacing = 6;
  DropdownComboWidth = 11;
  TopMarginNotDocked = 2;
  TopMargin: array[Boolean] of Integer = (TopMarginNotDocked, 0);
  BottomMarginNotDocked = 1;
  BottomMargin: array[Boolean] of Integer = (BottomMarginNotDocked, 0);
  LeftMarginNotDocked = 4;
  LeftMargin: array[Boolean] of Integer = (LeftMarginNotDocked, 0);
  RightMarginNotDocked = 4;
  RightMargin: array[Boolean] of Integer = (RightMarginNotDocked, 0);
  DockedBorderSize = 2;
  DockedBorderSize2 = DockedBorderSize*2;
  DragHandleSize = 9;

  DefaultBarWidthHeight = 8;

  ForceDockAtTopRow = 0;
  ForceDockAtLeftPos = -8;

  PositionLeftOrRight = [ppdpLeft, ppdpRight];

  { Constants for TppCustomToolWindow97 registry values/data.
    Don't localize any of these names! }
  rvRev = 'Rev';
  rdCurrentRev = 2;
  rvVisible = 'Visible';
  rvDockedTo = 'DockedTo';
  rdDockedToFloating = '+';
  rvDockRow = 'DockRow';
  rvDockPos = 'DockPos';
  rvFloatLeft = 'FloatLeft';
  rvFloatTop = 'FloatTop';
  { TppToolbar97 specific }
  rvFloatRightX = 'FloatRightX';
  { TppToolWindow97 specific }
  rvClientWidth = 'ClientWidth';
  rvClientHeight = 'ClientHeight';

type

  { Use by CompareControls }
  PCompareExtra = ^TCompareExtra;
  TCompareExtra = record
    Toolbar: TppToolbar97;
    ComparePositions: Boolean;
    CurDockType: TppDockType;
  end;

  TFloatParent = class(TWinControl)
  protected
    procedure CreateParams (var Params: TCreateParams); override;

  end;


procedure InstallHooks (const AID: TppHookedFormID; const AForm: TForm;
  const InstallMainHook: Boolean); forward;
procedure UninstallHooks (const AID: TppHookedFormID; const AForm: TForm); forward;



var
  HookedForms, MainHookedForms, DoneCreatingList: TList;
  CWPHookHandle: HHOOK;

  ButtonMouseTimer: TTimer {$IFDEF WIN32} = nil {$ENDIF};
  ButtonMouseInControl: TppToolbarButton97 {$IFDEF WIN32} = nil {$ENDIF};

  ButtonHookRefCount: Longint{$IFDEF WIN32} = 0 {$ENDIF};


{ Misc. functions }

procedure ppAddFloatingNCAreaToRect (var R: TRect; const Resizable: Boolean);
begin
  with ppGetBorderSize(Resizable) do begin
    Dec (R.Left, X);
    Inc (R.Right, X);
    Inc (R.Bottom, ppGetSmallCaptionHeight + Y*2);
  end;
end;

procedure AddDockedNCAreaToSize (var S: TPoint; const LeftRight: Boolean);
begin
  if not LeftRight then begin
    Inc (S.X, DockedBorderSize2 + DragHandleSize);
    Inc (S.Y, DockedBorderSize2);
  end
  else begin
    Inc (S.X, DockedBorderSize2);
    Inc (S.Y, DockedBorderSize2 + DragHandleSize);
  end;

end;

(* not currently used
function GetDragFullWindows: Boolean;
var
  S: BOOL;
begin
  Result := False;
  if SystemParametersInfo(SPI_GETDRAGFULLWINDOWS, 0, @S, 0) then
    Result := S;
end;
*)




function ppGetDockTypeOf (const Control: TppDock97): TppDockType;
begin
  if Control = nil then
    Result := ppdtNotDocked
  else begin
    if not(Control.Position in PositionLeftOrRight) then
      Result := ppdtTopBottom
    else
      Result := ppdtLeftRight;
  end;
end;

procedure ShowHideFloatParents (const Form: TForm; const AppActive: Boolean);
var
  HideFloatingToolbars: Boolean;
  I: Integer;
  ParentForm: TForm;
begin
  { First call ShowHideFloatParent on child forms }
  for I := 0 to Form.MDIChildCount-1 do
    ShowHideFloatParents (Form.MDIChildren[I], AppActive);

  { Hide any child toolbars if: the application is not active or is
    minimized, or the form (or its MDI parent) is not visible or is minimized }
  HideFloatingToolbars := IsIconic(Application.Handle) or
    not IsWindowVisible(Form.Handle) or IsIconic(Form.Handle);
  ParentForm := ppGetMDIParent(Form);
  if ParentForm <> Form then
    HideFloatingToolbars := HideFloatingToolbars or
      not IsWindowVisible(ParentForm.Handle) or IsIconic(ParentForm.Handle);
  for I := 0 to Form.ComponentCount-1 do
    if Form.Components[I] is TppCustomToolWindow97 then
      with TppCustomToolWindow97(Form.Components[I]) do begin
        SetNotOnScreen (not Docked and (HideFloatingToolbars or (FHideWhenInactive and not AppActive)));
        SetInactiveCaption (not Docked and (not FHideWhenInactive and not AppActive));
      end;
end;


{$IFDEF WIN32} {DIGIMETA}
function FormCallWndProcHook (Code: Integer; WParam: WPARAM; LParam: LPARAM): LRESULT;
stdcall;
var
  I: Integer;
  Wnd: HWND;
{  Ctl: TWinControl;}
begin

  if Code = HC_ACTION then begin
    case PCWPStruct(LParam).Message of
      {WM_DESTROY, WM_SETFOCUS,} WM_WINDOWPOSCHANGED: begin
          for I := 0 to HookedForms.Count-1 do
            with PppHookedFormInfo(HookedForms.List[I])^ do begin  { uses List property for speed }
              Wnd := PCWPStruct(LParam).hwnd;
              case PCWPStruct(LParam).Message of
               { WM_DESTROY:
                  if Wnd = SaveActiveControl then
                    SaveActiveControl := 0;}
                {WM_SETFOCUS: begin
                    if Form.HandleAllocated and IsChild(Form.Handle, Wnd) then begin
                      SaveActiveControl := 0;
                      while True do begin
                        Ctl := FindControl(Wnd);
                        if Ctl <> nil then begin
                          if (Ctl <> Form) and Ctl.HandleAllocated and
                             (GetParentForm(Ctl) = Form) then
                            SaveActiveControl := Ctl.Handle;
                          Break;
                        end;
                        Wnd := GetParent(Wnd);
                        if Wnd = 0 then Break;
                      end;
                      Break;
                    end;
                  end;   }
                WM_WINDOWPOSCHANGED:
                  if Form.HandleAllocated and (Wnd = Form.Handle) and
                     not (csDestroying in Form.ComponentState) then
                    ShowHideFloatParents (Form, Application.Active);
              end;
            end;
        end;
    end;
  end;
  Result := CallNextHookEx(CWPHookHandle, Code, WParam, LParam);
end;


{$ELSE}

function FormCallWndProcHook (Code: Integer; WParam: WPARAM; LParam: LPARAM): LRESULT; export;
var
  I: Integer;
  Wnd: HWND;
{  Ctl: TWinControl;}
begin


  if (Code = HC_ACTION) then begin
   case PCWPStruct(LParam)^.Message of

      {WM_DESTROY, WM_SETFOCUS, }WM_WINDOWPOSCHANGED: begin
          for I := 0 to HookedForms.Count-1 do
            with PppHookedFormInfo(HookedForms[I])^ do begin  { uses List property for speed }
              Wnd := PCWPStruct(LParam)^.hwnd;
              case PCWPStruct(LParam)^.Message of
                {WM_DESTROY:
                  if Wnd = SaveActiveControl then
                    SaveActiveControl := 0;
                WM_SETFOCUS: begin
                    if Form.HandleAllocated and IsChild(Form.Handle, Wnd) then begin
                      SaveActiveControl := 0;
                      while True do begin
                        Ctl := FindControl(Wnd);
                        if Ctl <> nil then begin
                          if (Ctl <> Form) and Ctl.HandleAllocated and
                             (GetParentForm(Ctl) = Form) then
                            SaveActiveControl := Ctl.Handle;
                          Break;
                        end;
                        Wnd := GetParent(Wnd);
                        if Wnd = 0 then Break;
                      end;
                      Break;
                    end;
                  end;  }
                WM_WINDOWPOSCHANGED:
                  if Form.HandleAllocated and (Wnd = Form.Handle) then
                    ShowHideFloatParents (Form, Application.Active);
              end;
            end;
        end;
    end;
  end;

  Result := CallNextHookEx(CWPHookHandle, Code, WParam, LParam);
end;

{$ENDIF}





procedure InstallHooks (const AID: TppHookedFormID; const AForm: TForm;
  const InstallMainHook: Boolean);
var
  I: Integer;
  Info: PppHookedFormInfo;
  AlreadyExists: Boolean;
  MainInfo: PppMainHookedFormInfo;
begin

  for I := 0 to HookedForms.Count-1 do
    with PppHookedFormInfo(HookedForms[I])^ do
      { If AForm already exists in list with the same ID, only increment
        the reference count }
      if (ID = AID) and (Form = AForm) then begin
        Inc (RefCount);
        Exit;
      end;
  New (Info);
  try
    with Info^ do begin
      Form := AForm;
      ID := AID;
      InstalledMainHook := InstallMainHook;
      if InstallMainHook then begin
        AlreadyExists := False;
        for I := 0 to MainHookedForms.Count-1 do
          with PppMainHookedFormInfo(MainHookedForms[I])^ do
            if (Form = AForm) then begin
              Inc (RefCount);
              AlreadyExists := True;
              Break;
            end;
        if not AlreadyExists then begin
          New (MainInfo);
          with MainInfo^ do begin
            Form := AForm;
            RefCount := 1;
          end;
          MainHookedForms.Add (MainInfo);

          if MainHookedForms.Count = 1 then
            Application.HookMainWindow (TppCustomToolWindow97.NewMainWindowHook);
        end;
      end;
      SaveActiveControl := 0;
      RefCount := 1;
    end;

    HookedForms.Add (Info);



    if HookedForms.Count = 1 then
{$IFDEF WIN32}
      CWPHookHandle := SetWindowsHookEx(WH_CALLWNDPROC, FormCallWndProcHook, 0, GetCurrentThreadId);
{$ELSE}
      CWPHookHandle := SetWindowsHookEx(WH_CALLWNDPROC, FormCallWndProcHook, GetInstanceModule(HInstance),
                                         GetWindowTask(aForm.Handle));
{$ENDIF}


  except
    Dispose (Info);
    raise;
  end;


end;

procedure UninstallHooks (const AID: TppHookedFormID; const AForm: TForm);
var
  I, J: Integer;
begin

  for I := HookedForms.Count-1 downto 0 do
    with PppHookedFormInfo(HookedForms[I])^ do
      if (ID = AID) and (Form = AForm) then begin
        Dec (RefCount);
        if RefCount = 0 then begin
          if InstalledMainHook then begin
            for J := MainHookedForms.Count-1 downto 0 do
              with PppMainHookedFormInfo(MainHookedForms[J])^ do
                if (Form = AForm) then begin
                  Dec (RefCount);
                  if RefCount = 0 then begin
                    Dispose (PppMainHookedFormInfo(MainHookedForms[J]));
                    MainHookedForms.Delete (J);
                    if MainHookedForms.Count = 0 then
                      Application.UnhookMainWindow (TppCustomToolWindow97.NewMainWindowHook);
                  end;
                end;
          end;
          Dispose (PppHookedFormInfo(HookedForms[I]));
          HookedForms.Delete (I);


          if HookedForms.Count = 0 then begin
            UnhookWindowsHookEx (CWPHookHandle);
            CWPHookHandle := 0;
          end;

        end;
      end;

end;
type
  TListSortExCompare = function (const Item1, Item2, ExtraData: Pointer): Integer;
procedure ListSortEx (const List: TList; const Compare: TListSortExCompare;
  const ExtraData: Pointer);
{ Similar to TList.Sort, but lets you pass a user-defined ExtraData pointer }
  procedure QuickSortEx (L: Integer; const R: Integer);
  var
    I, J: Integer;
    P: Pointer;
  begin
    repeat
      I := L;
      J := R;
      P := List[(L + R) shr 1];
      repeat
        while Compare(List[I], P, ExtraData) < 0 do Inc(I);
        while Compare(List[J], P, ExtraData) > 0 do Dec(J);
        if I <= J then
        begin
          List.Exchange (I, J);
          Inc (I);
          Dec (J);
        end;
      until I > J;
      if L < J then QuickSortEx (L, J);
      L := I;
    until I >= R;
  end;
begin
  if List.Count > 1 then
    QuickSortEx (0, List.Count-1);
end;

procedure ProcessPaintMessages;
{ Dispatches all pending WM_PAINT messages. In effect, this is like an
  'UpdateWindow' on all visible windows }
var
  Msg: TMsg;
begin
  while PeekMessage(Msg, 0, WM_PAINT, WM_PAINT, PM_NOREMOVE) do begin
    case Integer(GetMessage(Msg, 0, WM_PAINT, WM_PAINT)) of
      -1: Break; { if GetMessage failed }
      0: begin
           { Repost WM_QUIT messages }
           PostQuitMessage (Msg.WParam);
           Break;
         end;
    end;
    DispatchMessage (Msg);
  end;
end;



{ TppDock97 - internal }

constructor TppDock97.Create (AOwner: TComponent);
begin
 inherited Create (AOwner); {DIGIMETA}

  if not(AOwner is TForm) then
    raise EInvalidOperation.Create(STB97DockNotFormOwner);
    { because TppCustomToolWindow97 depends on docks being in the form's component list }

  FAllowDrag := True;
  FBkgOnToolbars := True;
  DockList := TList.Create;
  RowSizes := TList.Create;

  Inc (DisableArrangeToolbars);
  try
  {$IFDEF WIN32}  {DIGIMETA}
    ControlStyle := ControlStyle +
      [csAcceptsControls, csNoStdEvents] -
      [csClickEvents, csCaptureMouse, csOpaque];
  {$ELSE}
      ControlStyle := ControlStyle +
      [csAcceptsControls] -
      [csClickEvents, csCaptureMouse, csOpaque];
  {$ENDIF}


    FBkg := TBitmap.Create;
    FBkg.OnChange := BackgroundChanged;
    Position := ppdpTop;
    Color := clBtnFace;
  finally
    Dec (DisableArrangeToolbars);
  end;
  { Rearranging was disabled, so manually rearrange it now }
  ArrangeToolbars;
end;

procedure TppDock97.CreateParams (var Params: TCreateParams);
begin
  inherited CreateParams(Params);  {DIGIMETA}

  { Disable complete redraws when size changes. CS_H/VREDRAW cause flicker
    and are not necessary for this control at run time }
  if not(csDesigning in ComponentState) then
    with Params.WindowClass do
      Style := Style and not(CS_HREDRAW or CS_VREDRAW);
end;

destructor TppDock97.Destroy;
begin
  FBkgCache.Free;
  FBkg.Free;
  FreeRowInfo;
  RowSizes.Free;
  DockList.Free;
  inherited Destroy  {DIGIMETA}
end;

procedure TppDock97.SetParent (AParent: TWinControl);
begin
  if (AParent is TppCustomToolWindow97) or (AParent is TppDock97) then
    raise EInvalidOperation.Create(STB97DockParentNotAllowed);

  inherited SetParent(aParent);   {DIGIMETA}

end;

procedure TppDock97.VisibleChanging;
begin
  if Visible then
    raise EInvalidOperation.Create(STB97DockCannotHide);
  inherited VisibleChanging;     {DIGIMETA}
end;

procedure TppDock97.FreeRowInfo;
begin
  if Assigned(RowSizes) then
    RowSizes.Clear;
end;

procedure TppDock97.BuildRowInfo;
var
  R, I, Size, HighestSize: Integer;
begin
  FreeRowInfo;
  for R := 0 to GetHighestRow do begin
    HighestSize := DefaultBarWidthHeight;
    for I := 0 to DockList.Count-1 do begin
      with TppCustomToolWindow97(DockList[I]) do begin
        if FDockRow <> R then Continue;
        GetBarSize (Size, ppGetDockTypeOf(Self));
        if Size > HighestSize then HighestSize := Size;
      end;
    end;
    RowSizes.Add (Pointer(HighestSize));
  end;
end;

function TppDock97.GetRowSize (const Row: Integer;
  const DefaultToolbar: TppCustomToolWindow97): Integer;
begin
  if Row < RowSizes.Count then
    Result := Longint(RowSizes[Row])
  else begin
    { If it's out of bounds }
    if DefaultToolbar = nil then
      Result := 0
    else
      DefaultToolbar.GetBarSize (Result, ppGetDockTypeOf(Self));
  end;
end;

function TppDock97.GetRowOf (const XY: Integer; var Before: Boolean): Integer;
{ Returns row number of the specified coordinate. Before is set to True if it
  was close to being in between two rows. }
var
  HighestRow, R, CurY, NextY: Integer;
begin
  Result := 0;  Before := False;
  HighestRow := GetHighestRow;
  CurY := 0;
  for R := 0 to HighestRow+1 do begin
    if R <= HighestRow then
      NextY := CurY + GetRowSize(R, nil) + DockedBorderSize2
    else
      NextY := High(NextY);
    if XY <= CurY+5 then begin
      Result := R;
      Before := True;
      Break;
    end;
    if (XY >= CurY+5) and (XY <= NextY-5) then begin
      Result := R;
      Break;
    end;
    CurY := NextY;
  end;
end;

function TppDock97.GetDesignModeRowOf (const XY: Integer): Integer;
{ Similar to GetRowOf, but is a little different to accomidate design mode
  better }
var
  HighestRowPlus1, R, CurY, NextY: Integer;
begin
  Result := 0;
  HighestRowPlus1 := GetHighestRow+1;
  CurY := 0;
  for R := 0 to HighestRowPlus1 do begin
    Result := R;
    if R = HighestRowPlus1 then Break;
    NextY := CurY + GetRowSize(R, nil) + DockedBorderSize2;
    if XY < NextY then
      Break;
    CurY := NextY;
  end;
end;

function TppDock97.GetHighestRow: Integer;
{ Returns highest used row number, or -1 if no rows are used }
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to DockList.Count-1 do
    with TppCustomToolWindow97(DockList[I]) do
      if FDockRow > Result then
        Result := FDockRow;
end;

procedure TppDock97.RemoveBlankRows;
{ Deletes any blank row numbers, adjusting the docked toolbars' FDockRow as
  needed }
var
  HighestRow, R, I: Integer;
  RowIsEmpty: Boolean;
begin
  HighestRow := GetHighestRow;
  R := 0;
  while R <= HighestRow do begin
    RowIsEmpty := True;
    for I := 0 to DockList.Count-1 do
      if TppCustomToolWindow97(DockList[I]).FDockRow = R then begin
        RowIsEmpty := False;
        Break;
      end;
    if RowIsEmpty then begin
      { Shift all ones higher than R back one }
      for I := 0 to DockList.Count-1 do
        with TppCustomToolWindow97(DockList[I]) do
          if FDockRow > R then
            Dec (FDockRow);
      Dec (HighestRow);
    end;
    Inc (R);
  end;
end;

procedure TppDock97.InsertRowBefore (const BeforeRow: Integer);
{ Inserts a blank row before BeforeRow, adjusting all the docked toolbars'
  FDockRow as needed }
var
  I: Integer;
begin
  for I := 0 to DockList.Count-1 do
    with TppCustomToolWindow97(DockList[I]) do
      if FDockRow >= BeforeRow then
        Inc (FDockRow);
end;

procedure TppDock97.ChangeWidthHeight (const IsClientWidthAndHeight: Boolean;
  NewWidth, NewHeight: Integer);
{ Same as setting Width/Height or ClientWidth/ClientHeight directly, but does
  not lose Align position. }
begin
  if IsClientWidthAndHeight then begin
    Inc (NewWidth, Width-ClientWidth);
    Inc (NewHeight, Height-ClientHeight);
  end;
  case Align of
    alTop, alLeft:
      SetBounds (Left, Top, NewWidth, NewHeight);
    alBottom:
      SetBounds (Left, Top-NewHeight+Height, NewWidth, NewHeight);
    alRight:
      SetBounds (Left-NewWidth+Width, Top, NewWidth, NewHeight);
  end;
end;

procedure TppDock97.AlignControls (AControl: TControl; var Rect: TRect);
begin
  ArrangeToolbars;
end;

function CompareDockRowPos (const Item1, Item2, ExtraData: Pointer): Integer; far;
begin
  if TppCustomToolWindow97(Item1).FDockRow <> TppCustomToolWindow97(Item2).FDockRow then
    Result := TppCustomToolWindow97(Item1).FDockRow - TppCustomToolWindow97(Item2).FDockRow
  else
    Result := TppCustomToolWindow97(Item1).FDockPos - TppCustomToolWindow97(Item2).FDockPos;
end;

procedure TppDock97.ArrangeToolbars;
{ The main procedure to arrange all the toolbars docked to it }
var
  LeftRight: Boolean;
  EmptySize: Integer;
  HighestRow, R, CurDockPos, CurRowPixel, I, J: Integer;
  HighestRowSize, CurRowSize: Integer;
begin
  if (DisableArrangeToolbars > 0) or (csLoading in ComponentState) then
    Exit;

  { Work around VCL alignment bug when docking toolbars taller or wider than
    the client height or width of the form. }
  if not(csDesigning in ComponentState) and HandleAllocated then
    SetWindowPos (Handle, HWND_TOP, 0, 0, 0, 0,
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

  LeftRight := Position in PositionLeftOrRight;

  if DockList.Count = 0 then begin
    EmptySize := Ord(FFixAlign);
    if csDesigning in ComponentState then
      EmptySize := 9;
    if not LeftRight then
      ChangeWidthHeight (False, Width, EmptySize)
    else
      ChangeWidthHeight (False, EmptySize, Height);
    Exit;
  end;

  { Ensure list is in correct ordering according to DockRow/DockPos }
  ListSortEx (DockList, CompareDockRowPos, nil);

  { If LimitToOneRow is True, only use the first row }
  if FLimitToOneRow then
    for I := 0 to DockList.Count-1 do
      with TppCustomToolWindow97(DockList[I]) do
        FDockRow := 0;
  { Remove any blank rows }
  RemoveBlankRows;
  { Rebuild the RowInfo, since rows numbers were probably shifted after
    RemoveBlankRows }
  BuildRowInfo;

  { Find highest row number }
  HighestRow := GetHighestRow;

  { Arrange, first without actually moving the toolbars onscreen }
  for R := 0 to HighestRow do begin
    CurDockPos := 0;
    for I := 0 to DockList.Count-1 do begin
      with TppCustomToolWindow97(DockList[I]) do begin
        if FDockRow <> R then Continue;
        if FDockPos <= CurDockPos then
          FDockPos := CurDockPos
        else
          CurDockPos := FDockPos;
        if not LeftRight then
          Inc (CurDockPos, Width)
        else
          Inc (CurDockPos, Height);
      end;
    end;
  end;
  { Try to move all the toolbars that are offscreen to a fully visible position }
  for R := 0 to HighestRow do begin
    for I := 0 to DockList.Count-1 do begin
      if TppCustomToolWindow97(DockList[I]).FDockRow <> R then Continue;
      for J := DockList.Count-1 downto I do begin
        with TppCustomToolWindow97(DockList[J]) do begin
          if FDockRow <> R then Continue;
          if not LeftRight then begin
            if FDockPos+Width > Self.ClientWidth then begin
              Dec (TppCustomToolWindow97(DockList[I]).FDockPos,
                ((FDockPos+Width) - Self.ClientWidth));
              Break;
            end;
          end
          else begin
            if FDockPos+Height > Self.ClientHeight then begin
              Dec (TppCustomToolWindow97(DockList[I]).FDockPos,
                ((FDockPos+Height) - Self.ClientHeight));
              Break;
            end;
          end;
        end;
      end;
    end;
  end;
  { Arrange again, this time actually moving the toolbars }
  CurRowPixel := 0;
  for R := 0 to HighestRow do begin
    CurDockPos := 0;
    HighestRowSize := DefaultBarWidthHeight;
    for I := 0 to DockList.Count-1 do begin
      with TppCustomToolWindow97(DockList[I]) do begin
        if FDockRow <> R then Continue;
        CurRowSize := DockedBorderSize2 + GetRowSize(FDockRow, TppCustomToolWindow97(DockList[I]));
        if CurRowSize > HighestRowSize then
          HighestRowSize := CurRowSize;
        if FDockPos <= CurDockPos then
          FDockPos := CurDockPos
        else
          CurDockPos := FDockPos;
        Inc (FUpdatingBounds);
        try
          if not LeftRight then
            SetBounds (CurDockPos, CurRowPixel, Width, CurRowSize)
          else
            SetBounds (CurRowPixel, CurDockPos, CurRowSize, Height);
        finally
          Dec (FUpdatingBounds);
        end;
        if not LeftRight then
          Inc (CurDockPos, Width)
        else
          Inc (CurDockPos, Height);
      end;
    end;
    Inc (CurRowPixel, HighestRowSize);
  end;

  { Set the size of the dock }
  if not LeftRight then
    ChangeWidthHeight (True, ClientWidth, CurRowPixel)
  else
    ChangeWidthHeight (True, CurRowPixel, ClientHeight);
end;

procedure TppDock97.ChangeDockList (const Insert: Boolean;
  const Bar: TppCustomToolWindow97; const IsVisible: Boolean);
{ Inserts or removes Bar. It inserts only if IsVisible is True, or is in
  design mode }
var
  Modified: Boolean;
begin
  Modified := False;

  if Insert then begin
    { Delete if already exists }
    if DockList.IndexOf(Bar) <> -1 then
      DockList.Remove (Bar);
    { Only add to dock list if visible }
    if (csDesigning in ComponentState) or IsVisible then begin
      DockList.Add (Bar);
      Modified := True;
    end;
  end
  else begin
    if DockList.IndexOf(Bar) <> -1 then begin
      DockList.Remove (Bar);
      Modified := True;
    end;
  end;

  if Modified then begin
    ArrangeToolbars;
    { This corrects a problem in past versions when toolbar is shown after it
      was initially hidden }
    Bar.ArrangeControls;

    if Assigned(FOnInsertRemoveBar) then
      FOnInsertRemoveBar (Self, Insert, Bar);
  end;
end;

procedure TppDock97.Loaded;
begin
  inherited Loaded;   {DIGIMETA}
  { Rearranging is disabled while the component is loading, so now that it's
    loaded, rearrange it. }
  ArrangeToolbars;
end;

function TppDock97.GetPalette: HPALETTE;
begin
  Result := FBkg.Palette;
end;

procedure TppDock97.DrawBackground (const DC: HDC;
  const IntersectClippingRect: TRect; const ExcludeClippingRect: PRect;
  const DrawRect: TRect);
var
  UseBmp: TBitmap;
  R2: TRect;
  SavePalette: HPALETTE;
  SaveClipRgn: HRGN;
{$IFDEF WINDOWS}
  lClipBox: TRect;
{$ENDIF}
begin
  UseBmp := FBkg;
  { When FBkgTransparent is True, it keeps a cached copy of the
    background that has the transparent color already translated. Without the
    cache, redraws can be very slow.
    Note: The cache is cleared in the OnChange event of FBkg }
  if FBkgTransparent then begin
    if FBkgCache = nil then begin
      FBkgCache := TBitmap.Create;
      with FBkgCache do begin
  {$IFDEF Delphi3}
        Palette := CopyPalette(FBkg.Palette);
  {$ELSE}
        Palette := ppCopyPalette(FBkg.Palette);
  {$ENDIF}
        Width := FBkg.Width;
        Height := FBkg.Height;
        Canvas.Brush.Color := Self.Color;
        Canvas.BrushCopy (Rect(0, 0, Width, Height), FBkg,
          Rect(0, 0, Width, Height), FBkg.Canvas.Pixels[0, Height-1] or $02000000);
      end;
    end;
    UseBmp := FBkgCache;
  end;

  SavePalette := 0;
  SaveClipRgn := 0;
{$IFDEF WIN32}
  GetClipRgn (DC, SaveClipRgn);
{$ELSE}
  GetClipBox(DC, lClipBox);
  SaveClipRgn := CreateRectRgnIndirect(lClipBox);
{$ENDIF}
  with IntersectClippingRect do
    IntersectClipRect (DC, Left, Top, Right, Bottom);
  if Assigned(ExcludeClippingRect) then
    with ExcludeClippingRect^ do
      ExcludeClipRect (DC, Left, Top, Right, Bottom);
  try
    if UseBmp.Palette <> 0 then begin
      SavePalette := SelectPalette(DC, UseBmp.Palette, True);
      RealizePalette (DC);
    end;
    R2 := DrawRect;
    while R2.Left < R2.Right do begin
      while R2.Top < R2.Bottom do begin
        BitBlt (DC, R2.Left, R2.Top, UseBmp.Width, UseBmp.Height,
          UseBmp.Canvas.Handle, 0, 0, SRCCOPY);

        Inc (R2.Top, UseBmp.Height);
      end;
      R2.Top := DrawRect.Top;
      Inc (R2.Left, UseBmp.Width);
    end;
  finally
    { Restore the previous clipping region and palette back }
    SelectClipRgn (DC, SaveClipRgn);
    if SaveClipRgn <> 0 then DeleteObject (SaveClipRgn);
    if SavePalette <> 0 then SelectPalette (DC, SavePalette, True);
  end;
end;




procedure TppDock97.Paint;
var
  R, R2: TRect;
  P1, P2: TPoint;
begin
  inherited Paint; {DIGIMETA}
  with Canvas do begin
    R := ClientRect;

    { Draw dotted border in design mode }
    if csDesigning in ComponentState then begin
      Pen.Style := psDot;
      Pen.Color := clBtnShadow;
      Brush.Style := bsClear;
      Rectangle (R.Left, R.Top, R.Right, R.Bottom);
      Pen.Style := psSolid;
      InflateRect (R, -1, -1);
    end;

    { Draw the Background }
    if UsingBackground then begin
      R2 := ClientRect;
      { Make up for nonclient area }
      P1 := ClientToScreen(Point(0, 0));
      P2 := Parent.ClientToScreen(BoundsRect.TopLeft);
      Dec (R2.Left, Left + (P1.X-P2.X));
      Dec (R2.Top, Top + (P1.Y-P2.Y));

      DrawBackground (Canvas.Handle, R, nil, R2);

    end;
  end;
end;

procedure TppDock97.WMMove (var Message: TWMMove);
begin
  inherited;
  if UsingBackground then
    InvalidateBackgrounds;
end;

procedure TppDock97.WMSize (var Message: TWMSize);
begin
  inherited;
  if Assigned(FOnResize) then
    FOnResize (Self);
end;

procedure TppDock97.WMNCCalcSize (var Message: TWMNCCalcSize);
begin
  inherited;
  with Message.CalcSize_Params^.rgrc[0] do begin
    { Don't add a border when width or height is zero (or one in case of
      FixAlign=True) }
    if ((Right-Left) <= 1) or ((Bottom-Top) <= 1) then
      Exit;
    if ppdbTop in BoundLines then Inc (Top);
    if ppdbBottom in BoundLines then Dec (Bottom);
    if ppdbLeft in BoundLines then Inc (Left);
    if ppdbRight in BoundLines then Dec (Right);
  end;
end;

procedure TppDock97.WMNCPaint (var Message: TMessage);
var
  R, R2: TRect;
  DC: HDC;
  NewClipRgn: HRGN;
  HighlightPen, ShadowPen, SavePen: HPEN;
begin
  { This works around WM_NCPAINT problem described at top of source code }
  {no!  R := Rect(0, 0, Width, Height);}
  GetWindowRect (Handle, R);  OffsetRect (R, -R.Left, -R.Top);

  { Don't draw border when width or height is zero (or one in case of
    FixAlign=True) }
  if ((R.Right-R.Left) <= 1) or ((R.Bottom-R.Top) <= 1) then
    Exit;

  DC := GetWindowDC(Handle);
  try
    { Use update region }
    if Message.WParam <> 0 then begin
      GetWindowRect (Handle, R2);
      { An invalid region is generally passed when the window is first created }
      if SelectClipRgn(DC, Message.WParam) = ERROR then begin
        NewClipRgn := CreateRectRgnIndirect(R2);
        SelectClipRgn (DC, NewClipRgn);
        DeleteObject (NewClipRgn);
      end;
      OffsetClipRgn (DC, -R2.Left, -R2.Top);
    end;

    { Draw BoundLines }
    HighlightPen := CreatePen(PS_SOLID, 1, GetSysColor(COLOR_BTNHIGHLIGHT));
    ShadowPen := CreatePen(PS_SOLID, 1, GetSysColor(COLOR_BTNSHADOW));
    if ppdbTop in BoundLines then begin
      SavePen := SelectObject(DC, ShadowPen);
      MoveToEx (DC, R.Left, R.Top, nil);  LineTo (DC, R.Right, R.Top);
      SelectObject (DC, SavePen);
    end;
    if ppdbLeft in BoundLines then begin
      SavePen := SelectObject(DC, ShadowPen);
      MoveToEx (DC, R.Left, R.Top, nil);  LineTo (DC, R.Left, R.Bottom);
      SelectObject (DC, SavePen);
    end;
    if ppdbBottom in BoundLines then begin
      SavePen := SelectObject(DC, HighlightPen);
      MoveToEx (DC, R.Left, R.Bottom-1, nil);  LineTo (DC, R.Right, R.Bottom-1);
      SelectObject (DC, SavePen);
    end;
    if ppdbRight in BoundLines then begin
      SavePen := SelectObject(DC, HighlightPen);
      MoveToEx (DC, R.Right-1, R.Top, nil);  LineTo (DC, R.Right-1, R.Bottom);
      SelectObject (DC, SavePen);
    end;
    DeleteObject (ShadowPen);
    DeleteObject (HighlightPen);
  finally
    ReleaseDC (Handle, DC);
  end;
end;

procedure TppDock97.CMColorChanged (var Message: TMessage);
begin
  if UsingBackground then
    { Erase the cache }
    BackgroundChanged (FBkg);
  inherited;
end;

procedure TppDock97.CMSysColorChange (var Message: TMessage);
begin
  inherited;
  if UsingBackground then
    { Erase the cache }
    BackgroundChanged (FBkg);
end;

{ TppDock97 - property access methods }

procedure TppDock97.SetAllowDrag (Value: Boolean);
var
  I: Integer;
begin
  if FAllowDrag <> Value then begin
    FAllowDrag := Value;
    for I := 0 to ControlCount-1 do
      if Controls[I] is TppCustomToolWindow97 then
        { Recalculate the non-client area }
        SetWindowPos (TppCustomToolWindow97(Controls[I]).Handle, 0, 0, 0, 0, 0,
          SWP_FRAMECHANGED or SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);
  end;
end;

procedure TppDock97.SetBackground (Value: TBitmap);
begin
  FBkg.Assign (Value);
end;

function TppDock97.UsingBackground: Boolean;
begin
  Result := (FBkg.Width <> 0) and (FBkg.Height <> 0);
end;

procedure TppDock97.InvalidateBackgrounds;
{ Called after background is changed }
var
  I: Integer;
begin
  Invalidate;
  { Synchronize child toolbars also }
  for I := 0 to DockList.Count-1 do
    with TppCustomToolWindow97(DockList[I]) do begin
      InvalidateDockedNCArea;
      Invalidate;
    end;
end;

procedure TppDock97.BackgroundChanged (Sender: TObject);
begin
  { Erase the cache }
  FBkgCache.Free;
  FBkgCache := nil;
  InvalidateBackgrounds;
end;

procedure TppDock97.SetBackgroundOnToolbars (Value: Boolean);
begin
  if FBkgOnToolbars <> Value then begin
    FBkgOnToolbars := Value;
    InvalidateBackgrounds;
  end;
end;

procedure TppDock97.SetBackgroundTransparent (Value: Boolean);
begin
  if FBkgTransparent <> Value then begin
    FBkgTransparent := Value;
    if UsingBackground then
      { Erase the cache }
      BackgroundChanged (FBkg);
  end;
end;

procedure TppDock97.SetBoundLines (Value: TppDockBoundLines);
begin
  if FBoundLines <> Value then begin
    FBoundLines := Value;

    { Recalculate the non-client area }
    SetWindowPos (Handle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED or
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);
  end;
end;

procedure TppDock97.SetFixAlign (Value: Boolean);
begin
  if FFixAlign <> Value then begin
    FFixAlign := Value;
    ArrangeToolbars;
  end;
end;

procedure TppDock97.SetPosition (Value: TppDockPosition);
begin
  if ControlCount <> 0 then
    raise EInvalidOperation.Create(STB97DockCannotChangePosition);
  FPosition := Value;
  case Position of
    ppdpTop: Align := alTop;
    ppdpBottom: Align := alBottom;
    ppdpLeft: Align := alLeft;
    ppdpRight: Align := alRight;
  end;
end;

function TppDock97.GetToolbarCount: Integer;
begin
  Result := DockList.Count;
end;

function TppDock97.GetToolbars (Index: Integer): TppCustomToolWindow97;
begin
  Result := TppCustomToolWindow97(DockList[Index]);
end;

{ TFloatParent - Internal }

procedure TFloatParent.CreateParams (var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  with Params do begin
{$IFDEF WIN32}
    Style := WS_CHILD;
{$ELSE}
    Style := WS_POPUP;
{$ENDIF}
    ExStyle := 0;

  end;
end;


{ Global procedures }

procedure ppCustomLoadToolbarPositions (const Form: TForm;
  const ReadIntProc: TppPositionReadIntProc;
  const ReadStringProc: TppPositionReadStringProc; const ExtraData: Pointer);

  function FindDock (AName: String): TppDock97;
  var
    I: Integer;
  begin
    Result := nil;
    for I := 0 to Form.ComponentCount-1 do
      if (Form.Components[I] is TppDock97) and (Form.Components[I].Name = AName) then begin
        Result := TppDock97(Form.Components[I]);
        Break;
      end;
  end;
  procedure ReadValues (const Toolbar: TppCustomToolWindow97; const NewDock: TppDock97);
  begin
    with Toolbar do begin
      FDockRow := ReadIntProc(Name, rvDockRow, FDockRow, ExtraData);
      FDockPos := ReadIntProc(Name, rvDockPos, FDockPos, ExtraData);
      FFloatingTopLeft.X := ReadIntProc(Name, rvFloatLeft, 0, ExtraData);
      FFloatingTopLeft.Y := ReadIntProc(Name, rvFloatTop, 0, ExtraData);
      ReadPositionData (ReadIntProc, ReadStringProc, ExtraData);
      DockedTo := NewDock;
      DoneReadingPositionData;
    end;
  end;
var
  DocksDisabled: TList;
  I: Integer;
  lDock: TppDock97;
  DockedToName: String;
begin
  DocksDisabled := TList.Create;
  try
    try
    with Form do
      for I := 0 to ComponentCount-1 do
        if Components[I] is TppDock97 then begin
          Inc (TppDock97(Components[I]).DisableArrangeToolbars);
          DocksDisabled.Add (Components[I]);
        end;

    for I := 0 to Form.ComponentCount-1 do
      {note: this is necessary because some objects may have been free'd}
      if I > Form.ComponentCount-1 then
        Break
      else
      if Form.Components[I] is TppCustomToolWindow97 then
        with TppCustomToolWindow97(Form.Components[I]) do begin
          if Name = '' then
            Continue; {DIGIMETA}
           { raise Exception.Create (STB97ToolWinNameNotSet);}
          if ReadIntProc(Name, rvRev, 0, ExtraData) = rdCurrentRev then begin
            Visible := ReadIntProc(Name, rvVisible, Ord(Visible), ExtraData) <> 0;
            DockedToName := ReadStringProc(Name, rvDockedTo, '', ExtraData);
            if DockedToName <> '' then begin
              if DockedToName <> rdDockedToFloating then begin
                lDock := FindDock(DockedToName);
                if (lDock <> nil) and (lDock.FAllowDrag) then
                  ReadValues (TppCustomToolWindow97(Form.Components[I]), lDock);
              end
              else begin
                ReadValues (TppCustomToolWindow97(Form.Components[I]), nil);
                MoveOnScreen (True);
              end;
            end;
          end;
        end;
  except
    
  end;
  finally
    for I := DocksDisabled.Count-1 downto 0 do begin
      Dec (TppDock97(DocksDisabled[I]).DisableArrangeToolbars);
      TppDock97(DocksDisabled[I]).ArrangeToolbars;
    end;
    DocksDisabled.Free;
  end;
end;

procedure ppCustomSaveToolbarPositions (const Form: TForm;
  const WriteIntProc: TppPositionWriteIntProc;
  const WriteStringProc: TppPositionWriteStringProc; const ExtraData: Pointer);
var
  I: Integer;
  N: String;
begin
  for I := 0 to Form.ComponentCount-1 do
    if Form.Components[I] is TppCustomToolWindow97 then
      with TppCustomToolWindow97(Form.Components[I]) do begin
        if Name = '' then
          Continue;   {DIGIMETA}
          {raise Exception.Create (STB97ToolwinNameNotSet);}
        if not Docked then
          N := rdDockedToFloating
        else begin
          if DockedTo.FAllowDrag then begin
            N := DockedTo.Name;
            if N = '' then
              raise Exception.Create (STB97ToolwinDockedToNameNotSet);
          end
          else
            N := '';
        end;
        WriteIntProc (Name, rvRev, rdCurrentRev, ExtraData);
        WriteIntProc (Name, rvVisible, Ord(Visible), ExtraData);
        with TppCustomToolWindow97(Form.Components[I]) do begin
          WriteStringProc (Name, rvDockedTo, N, ExtraData);
          WriteIntProc (Name, rvDockRow, FDockRow, ExtraData);
          WriteIntProc (Name, rvDockPos, FDockPos, ExtraData);
          WriteIntProc (Name, rvFloatLeft, FFloatingTopLeft.X, ExtraData);
          WriteIntProc (Name, rvFloatTop, FFloatingTopLeft.Y, ExtraData);
          WritePositionData (WriteIntProc, WriteStringProc, ExtraData);
        end;
      end;
end;

function IniReadInt (const ToolbarName, Value: String; const Default: Longint;
  const ExtraData: Pointer): Longint; far;
begin
  Result := TIniFile(ExtraData).ReadInteger(ToolbarName, Value, Default);
end;
function IniReadString (const ToolbarName, Value, Default: String;
  const ExtraData: Pointer): String; far;
begin
  Result := TIniFile(ExtraData).ReadString(ToolbarName, Value, Default);
end;
procedure IniWriteInt (const ToolbarName, Value: String; const Data: Longint;
  const ExtraData: Pointer); far;
begin
  TIniFile(ExtraData).WriteInteger (ToolbarName, Value, Data);
end;
procedure IniWriteString (const ToolbarName, Value, Data: String;
  const ExtraData: Pointer); far;
begin
  TIniFile(ExtraData).WriteString (ToolbarName, Value, Data);
end;

procedure ppIniLoadToolbarPositions (const Form: TForm; const Filename: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(Filename);
  try
    ppCustomLoadToolbarPositions (Form, IniReadInt, IniReadString, Ini);
  finally
    Ini.Free;
  end;
end;

procedure ppIniSaveToolbarPositions (const Form: TForm; const Filename: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(Filename);
  try
    ppCustomSaveToolbarPositions (Form, IniWriteInt, IniWriteString, Ini);
  finally
    Ini.Free;
  end;
end;

{$IFDEF WIN32}    {DIGIMETA}
function RegReadInt (const ToolbarName, Value: String; const Default: Longint;
  const ExtraData: Pointer): Longint; far;
begin
  Result := TRegIniFile(ExtraData).ReadInteger(ToolbarName, Value, Default);
end;
function RegReadString (const ToolbarName, Value, Default: String;
  const ExtraData: Pointer): String; far;
begin
  Result := TRegIniFile(ExtraData).ReadString(ToolbarName, Value, Default);
end;
procedure RegWriteInt (const ToolbarName, Value: String; const Data: Longint;
  const ExtraData: Pointer); far;
begin
  TRegIniFile(ExtraData).WriteInteger (ToolbarName, Value, Data);
end;
procedure RegWriteString (const ToolbarName, Value, Data: String;
  const ExtraData: Pointer); far;
begin
  TRegIniFile(ExtraData).WriteString (ToolbarName, Value, Data);
end;

procedure ppRegLoadToolbarPositions (const Form: TForm; const BaseRegistryKey: String);
var
  Reg: TRegIniFile;
begin
  Reg := TRegIniFile.Create(BaseRegistryKey);
  try
    ppCustomLoadToolbarPositions (Form, RegReadInt, RegReadString, Reg);
  finally
    Reg.Free;
  end;
end;

procedure ppRegSaveToolbarPositions (const Form: TForm; const BaseRegistryKey: String);
var
  Reg: TRegIniFile;
begin
  Reg := TRegIniFile.Create(BaseRegistryKey);
  try
    ppCustomSaveToolbarPositions (Form, RegWriteInt, RegWriteString, Reg);
  finally
    Reg.Free;
  end;
end;

{$ENDIF}


{ TppCustomToolWindow97 - Internal }

constructor TppCustomToolWindow97.Create (AOwner: TComponent);
begin
  inherited Create(aOwner);   

  if not(AOwner is TForm) then
    raise EInvalidOperation.Create(STB97ToolwinNotFormOwner);
    { because it frequently casts Owner into a TForm }
  MDIParentForm := ppGetMDIParent(TForm(AOwner));

  Inc (FDisableArrangeControls);
  try
    ControlStyle := ControlStyle +
      [csAcceptsControls, csClickEvents, csDoubleClicks, csSetCaption] -
      [csCaptureMouse{capturing is done manually}, csOpaque];


    if not (csDesigning in ComponentState) then begin
       { Set up the hooks for the parent form of the toolbar, and a main
        window hook }
      InstallHooks (hkParentForm, MDIParentForm, True);
      { Add a another hook if it's owner is an MDI child }
      if TForm(AOwner).FormStyle = fsMDIChild then
        InstallHooks (hkChildForm, TForm(AOwner), False);

{$IFDEF WIN32}

    {causes D1 to crash}
      { Need to move it offscreen while loading to prevent any flashing as it's
        updating }
       SetNotOnScreen (True);
{$ELSE}
      if TForm(AOwner).FormStyle = fsMDIChild then
         NotOnScreen := True
      else
         NotOnScreen := False;
{$ENDIF}
    end;

    FInactiveCaption := not Application.Active;

    FActivateParent := True;
    FDockableTo := [ppdpTop, ppdpBottom, ppdpLeft, ppdpRight];
    FCloseButton := True;
    FResizable := True;
    FHideWhenInactive := True;
    FDockPos := -1;
    Color := clBtnFace;
    DockedTo := nil;

{$IFDEF WIN32}       {causes D1 to crash}
    if not(csDesigning in ComponentState) then begin
      { Since SetNotOnScreen(True) was called, it needs to restore the toolbars
        back by posting a message which will be processed once it's done
        loading. }
      if DoneCreatingList.IndexOf(Self) = -1 then  { can't have duplicates }
        DoneCreatingList.Add (Self);

      PostMessage (Application.Handle, WM_ppTB97DoneCreating,
        WM_ppTB97DoneCreating_Magic, WM_ppTB97DoneCreating_Magic);
    end;
{$ENDIF}

  finally
    Dec (FDisableArrangeControls);
  end;
end;

destructor TppCustomToolWindow97.Destroy;
begin

  if not(csDesigning in ComponentState) then begin
    DoneCreatingList.Remove (Self);   { just in case }
    UninstallHooks (hkParentForm, MDIParentForm);
    if (Owner <> nil) and (TForm(Owner).FormStyle = fsMDIChild) then
      UninstallHooks (hkChildForm, TForm(Owner));
  end;

  inherited Destroy;  {DIGIMETA}

end;

function TppCustomToolWindow97.GetFloatParent: TWinControl; {DIGIMETA}
begin


  if (FFloatParent = nil) then

    if csDesigning in ComponentState then
      FFloatParent := TForm(Owner)
      
    else
      begin
        FFloatParent := TFloatParent.Create(TForm(Owner));
        FFloatParent.Parent := MDIParentForm;
      end;


  Result := FFloatParent;
end;


procedure TppCustomToolWindow97.FreeFloatParent; {DIGIMETA}
begin
  if not (csDesigning in ComponentState) then
    FFloatParent.Free;
  FFloatParent := nil;
end;



procedure TppCustomToolWindow97.SetNotOnScreen (const Value: Boolean);
begin
 if (csDestroying in ComponentState) then Exit;

  if NotOnScreen <> Value then begin
    NotOnScreen := Value;
    { Update the actual visibility of the toolbar by sending a
      CM_SHOWINGCHANGED message. CM_SHOWINGCHANGED cannot be sent if the
      handle has not been allocated yet, so check HandleAllocated first }
    if HandleAllocated then
      Perform (CM_SHOWINGCHANGED, 0, 0);
  end;
end;

procedure TppCustomToolWindow97.SetInactiveCaption (const Value: Boolean);
begin
  if (csDestroying in ComponentState) then Exit;

  if FInactiveCaption <> Value then begin
    FInactiveCaption := Value;

    DrawFloatingNCArea (0, False, True, False);

  end;

end;

procedure TppCustomToolWindow97.WMMove (var Message: TWMMove);
begin
  inherited;
  if Docked and DockedTo.UsingBackground then begin
    { Needs to redraw so that background is lined up with the dock at the
      new position }
    InvalidateDockedNCArea;
    { To minimize flicker, InvalidateRect is called with the Erase parameter
      set to False instead of calling the Invalidate method }
    if HandleAllocated then
      InvalidateRect (Handle, nil, False);
  end;
end;

procedure TppCustomToolWindow97.WMGetMinMaxInfo (var Message: TWMGetMinMaxInfo);
begin
  inherited;
  { Because the window uses the WS_THICKFRAME style (but not for the usual
    purpose), it must process the WM_GETMINMAXINFO message to remove the
    minimum and maximum size limits it imposes by default. }
  with Message.MinMaxInfo^ do begin
    with ptMinTrackSize do begin
      X := 1;
      Y := 1;
      { Note to self: Don't put GetMinimumSize code here, since
        ClientWidth/Height values are sometimes invalid during a RecreateWnd }
    end;
    with ptMaxTrackSize do begin
      { Because of the 16-bit (signed) size limitations of Windows 95,
        Smallints must be used instead of Integers or Longints }
      X := High(Smallint);
      Y := High(Smallint);
    end;
  end;
end;

procedure TppCustomToolWindow97.CMShowingChanged (var Message: TMessage);
const
  ShowFlags: array[Boolean] of UINT = (
    SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE or SWP_HIDEWINDOW,
    SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE or SWP_SHOWWINDOW);
begin
  { inherited isn't called since TppCustomToolWindow97 handles CM_SHOWINGCHANGED
    itself. For reference, the original TWinControl implementation is:
    const
      ShowFlags: array[Boolean] of Word = (
        SWP_NOSIZE + SWP_NOMOVE + SWP_NOZORDER + SWP_NOACTIVATE + SWP_HIDEWINDOW,
        SWP_NOSIZE + SWP_NOMOVE + SWP_NOZORDER + SWP_NOACTIVATE + SWP_SHOWWINDOW);
    begin
      SetWindowPos(FHandle, 0, 0, 0, 0, 0, ShowFlags[FShowing]);
    end;
  }
  SetWindowPos (Handle, 0, 0, 0, 0, 0, ShowFlags[Showing and not NotOnScreen]);
end;

procedure TppCustomToolWindow97.CreateParams (var Params: TCreateParams);
begin
 inherited CreateParams(Params);     {DIGIMETA}
  if Parent = FFloatParent then
    with Params do begin
      { Note: WS_THICKFRAME and WS_BORDER styles are included to ensure that
        sizing grips are displayed on child controls with scrollbars. The
        thick frame or border is not drawn by Windows; TppCustomToolWindow97
        handles all border drawing by itself. }
      if not(csDesigning in ComponentState) then
        Style := WS_POPUP or WS_THICKFRAME or WS_BORDER
      else
        Style := Style or WS_THICKFRAME or WS_BORDER;
      ExStyle := 0;
    end;
end;

procedure TppCustomToolWindow97.Notification (AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(aComponent, Operation); {DIGIMETA}
  if (Operation = opRemove) and (AComponent = FDefaultDock) then
    FDefaultDock := nil;
end;

procedure TppCustomToolWindow97.MoveOnScreen (const OnlyIfFullyOffscreen: Boolean);
{ Moves the (floating) toolbar so that it is fully (or at least mostly) in
  view on the screen }
var
  R, S, Test: TRect;
begin
  if (csDestroying in ComponentState) then Exit;

  if not Docked then begin
    R := BoundsRect;
    S := ppGetDesktopArea;

{$IFDEF WIN32}   {DIGIMETA}
    if OnlyIfFullyOffscreen and IntersectRect(Test, R, S) then
      Exit;
{$ELSE}
    if OnlyIfFullyOffscreen and (IntersectRect(Test, R, S) <> 0) then
      Exit;

{$ENDIF}

    if R.Right > S.Right then
      OffsetRect (R, S.Right - R.Right, 0);
    if R.Bottom > S.Bottom then
      OffsetRect (R, 0, S.Bottom - R.Bottom);
    if R.Left < S.Left then
      OffsetRect (R, S.Left - R.Left, 0);
    if R.Top < S.Top then
      OffsetRect (R, 0, S.Top - R.Top);
    BoundsRect := R;
  end;
end;

procedure TppCustomToolWindow97.ReadPositionData (const ReadIntProc: TppPositionReadIntProc;
  const ReadStringProc: TppPositionReadStringProc; const ExtraData: Pointer);
begin
end;

procedure TppCustomToolWindow97.DoneReadingPositionData;
begin
end;

procedure TppCustomToolWindow97.WritePositionData (const WriteIntProc: TppPositionWriteIntProc;
  const WriteStringProc: TppPositionWriteStringProc; const ExtraData: Pointer);
begin
end;

procedure TppCustomToolWindow97.InitializeOrdering;
begin
end;

procedure TppCustomToolWindow97.GetDockRowSize (var AHeightOrWidth: Integer);
begin
  GetBarSize (AHeightOrWidth, ppGetDockTypeOf(DockedTo));
  if Docked then
    with DockedTo do begin
      BuildRowInfo;
      AHeightOrWidth := DockedTo.GetRowSize(FDockRow, Self);
    end;
end;

procedure TppCustomToolWindow97.SizeChanging (const AWidth, AHeight: Integer);
begin
end;

procedure TppCustomToolWindow97.Loaded;
var
  R: TRect;
begin
  inherited Loaded;
  { Adjust coordinates if it was initially floating }
  if not(csDesigning in ComponentState) and not Docked then begin
    R := BoundsRect;
    MapWindowPoints (TForm(Owner).Handle, 0, R, 2);
    BoundsRect := R;
    MoveOnScreen (False);
  end;
  InitializeOrdering;
  { Arranging of controls is disabled while component was loading, so rearrange
    it now }
  ArrangeControls;
end;

procedure TppCustomToolWindow97.BeginUpdate;
begin
  Inc (FDisableArrangeControls);
end;

procedure TppCustomToolWindow97.EndUpdate;
begin
  Dec (FDisableArrangeControls);
  if FArrangeNeeded and (FDisableArrangeControls = 0) then
    ArrangeControls;
end;

procedure TppCustomToolWindow97.CustomArrangeControls (const ArrangeType: TppToolWindowArrangeType;
  const WasDockedTo, DockingTo: TppDock97; var NewClientSize: TPoint);
var
  WH: Integer;
begin
  if (csDestroying in ComponentState) then Exit;

  if (FDisableArrangeControls > 0) or
     { Prevent flicker while loading or destroying }
     (csLoading in ComponentState) or
     { Following line added in 1.53 to stop the access violations that 1.52 was
       causing while destroying. }
     (csDestroying in ComponentState) or
     (Parent = nil) or
     (Parent.HandleAllocated and (csDestroying in Parent.ComponentState)) then begin
    FArrangeNeeded := True;
    Exit;
  end;

  FArrangeNeeded := False;
  NewClientSize.X := 0;
  NewClientSize.Y := 0;

  Inc (FDisableArrangeControls);
  try
    OrderControls (ArrangeType <> ppatNone, WasDockedTo, DockingTo, NewClientSize);

    if ArrangeType = ppatMoveControlsAndResize then
      with NewClientSize do begin
        if Docked then begin
          GetDockRowSize (WH);
          if not(DockedTo.Position in PositionLeftOrRight) then begin
            if WH > Y then Y := WH;
          end
          else begin
            if WH > X then X := WH;
          end;
        end;
        if (ClientWidth <> X) or (ClientHeight <> Y) then begin
          Inc (FUpdatingBounds);
          try
            SetBounds (Left, Top, (Width-ClientWidth) + X, (Height-ClientHeight) + Y);
          finally
            Dec (FUpdatingBounds);
          end;
        end;
      end;
  finally
    Dec (FDisableArrangeControls);
  end;
end;

procedure TppCustomToolWindow97.ArrangeControls;
var
  TempSize: TPoint;
begin
  CustomArrangeControls (ppatMoveControlsAndResize, DockedTo, DockedTo, TempSize);
end;

procedure TppCustomToolWindow97.AlignControls (AControl: TControl; var Rect: TRect);
{ VCL calls this whenever any child controls in the toolbar are moved, sized,
  inserted, etc. It doesn't need to make use of the AControl and Rect
  parameters. }
begin
  inherited AlignControls(aControl, Rect);

  if (csDestroying in ComponentState) then Exit;

  ArrangeControls;
end;

procedure TppCustomToolWindow97.SetBounds (ALeft, ATop, AWidth, AHeight: Integer);
begin
  if (csDestroying in ComponentState) then Exit;


  if (FUpdatingBounds = 0) and ((AWidth <> Width) or (AHeight <> Height)) then
    SizeChanging (AWidth, AHeight);
  { This allows you to drag the toolbar around the dock at design time }
  if (csDesigning in ComponentState) and not(csLoading in ComponentState) and
     Docked and (FUpdatingBounds = 0) and ((ALeft <> Left) or (ATop <> Top)) then begin
    if not(DockedTo.Position in PositionLeftOrRight) then begin
      FDockRow := DockedTo.GetDesignModeRowOf(ATop+(Height div 2));
      FDockPos := ALeft;
    end
    else begin
      FDockRow := DockedTo.GetDesignModeRowOf(ALeft+(Width div 2));
      FDockPos := ATop;
    end;
    inherited SetBounds (Left, Top, AWidth, AHeight);  { only pass any size changes }
    DockedTo.ArrangeToolbars;  { let ArrangeToolbars take care of position changes }
  end
  else begin
    inherited SetBounds (aLeft, aTop, aWidth, aHeight);
    if not(csLoading in ComponentState) and not Docked and (FUpdatingBounds = 0) then
      FFloatingTopLeft := BoundsRect.TopLeft;
  end;
end;

procedure TppCustomToolWindow97.SetParent (AParent: TWinControl);
begin
  if not(csDesigning in ComponentState) and (AParent = TForm(Owner)) then
    AParent := GetFloatParent;

  if (AParent <> nil) and not(AParent is TppDock97) and
     not(AParent = Owner) and not(AParent is TFloatParent) then
    raise EInvalidOperation.Create(STB97ToolwinParentNotAllowed);

  if not(csDestroying in ComponentState) and Assigned(FOnRecreating) then
    FOnRecreating (Self);

  if Parent is TppDock97 then
    TppDock97(Parent).ChangeDockList (False, Self, Visible or (FHidden <> 0));

  { Ensure that the handle is destroyed now so that any messages in the queue
    get flushed. This is neccessary since existing messages may reference
    FDockedTo or FDocked, which is changed below. }
  inherited SetParent (nil);
  { ^ Note to self: SetParent is used instead of DestroyHandle because it does
    additional processing }
  if not(AParent is TppDock97) then
    FDockedTo := nil
  else
    FDockedTo := TppDock97(AParent);
  FDocked := FDockedTo <> nil;
  try
    inherited SetParent (aParent);
  except
    { Failure is rare, but just in case, restore FDockedTo and FDocked back. }
    if not(Parent is TppDock97) then
      FDockedTo := nil
    else
      FDockedTo := TppDock97(Parent);
    FDocked := FDockedTo <> nil;
    raise;
  end;

  if Parent is TppDock97 then
    TppDock97(Parent).ChangeDockList (True, Self, Visible or (FHidden <> 0));

  if not(csDestroying in ComponentState) and Assigned(FOnRecreated) then
    FOnRecreated (Self);
end;

function GetCaptionRect (const Control: TppCustomToolWindow97;
  const AdjustForBorder, MinusCloseButton: Boolean): TRect;
begin
  Result := Rect(0, 0, Control.ClientWidth, ppGetSmallCaptionHeight-1);
  if MinusCloseButton then
    Dec (Result.Right, ppGetSmallCaptionHeight-1);
  if AdjustForBorder then
    with ppGetBorderSize(Control.Resizable) do
      OffsetRect (Result, X, Y);
end;

function GetCloseButtonRect (const Control: TppCustomToolWindow97;
  const AdjustForBorder: Boolean): TRect;
begin
  Result := Rect(0, 0, Control.ClientWidth, ppGetSmallCaptionHeight-1);
  if AdjustForBorder then
    with ppGetBorderSize(Control.Resizable) do
      OffsetRect (Result, X, Y);
  Result.Left := Result.Right - (ppGetSmallCaptionHeight-1);
end;

procedure TppCustomToolWindow97.WMNCCalcSize (var Message: TWMNCCalcSize);
begin
  { Doesn't call inherited since it overrides the normal NC sizes }
  Message.Result := 0;
  with Message.CalcSize_Params^ do begin
    if not Docked then begin
      with ppGetBorderSize(Resizable) do
        InflateRect (rgrc[0], -X, -Y);
      Inc (rgrc[0].Top, ppGetSmallCaptionHeight);
    end
    else begin
      InflateRect (rgrc[0], -DockedBorderSize, -DockedBorderSize);
      if DockedTo.AllowDrag then begin
        if not(DockedTo.Position in PositionLeftOrRight) then
          Inc (rgrc[0].Left, DragHandleSize)
        else
          Inc (rgrc[0].Top, DragHandleSize);
      end;
    end;
  end;
end;




{$IFDEF WINDOWS} {DIGIMETA - from 1.47}

procedure DCFrame3D (const DC: HDC; var R: TRect;
  const TopLeftColor, BottomRightColor: TColor; const Adjust: Boolean);
{ Similar to VCL's Frame3D function, but accepts a DC rather than a Canvas,
  and is simpler and faster }
var
  Pen, SavePen: HPEN;
  P: array[0..2] of TPoint;
begin
  Pen := CreatePen(PS_SOLID, 1, ColorToRGB(TopLeftColor));
  SavePen := SelectObject(DC, Pen);
  P[0] := Point(R.Left, R.Bottom-2);
  P[1] := Point(R.Left, R.Top);
  P[2] := Point(R.Right-1, R.Top);
  Polyline (DC, P, 3);
  SelectObject (DC, SavePen);
  DeleteObject (Pen);

  Pen := CreatePen(PS_SOLID, 1, ColorToRGB(BottomRightColor));
  SavePen := SelectObject(DC, Pen);
  P[0] := Point(R.Left, R.Bottom-1);
  P[1] := Point(R.Right-1, R.Bottom-1);
  P[2] := Point(R.Right-1, R.Top-1);
  Polyline (DC, P, 3);
  SelectObject (DC, SavePen);
  DeleteObject (Pen);

  if Adjust then
    InflateRect (R, -1, -1);
end;


procedure DrawCloseButton (const DC: HDC; var R: TRect; const Pushed: Boolean);
  { Draws a Win95-style close button in Win16. Can't emulate Win95 exactly
    since Win95 uses a TrueType font to draw it }
  var
    I: Integer;
    Brush: HBRUSH;
    Pen, SavePen: HPEN;
  begin
    if not Pushed then begin
      DCFrame3D (DC, R, clBtnHighlight, clBlack, True);
      DCFrame3D (DC, R, clBtnFace, clBtnShadow, True);
    end
    else begin
      DCFrame3D (DC, R, clBlack, clBtnHighlight, True);
      DCFrame3D (DC, R, clBtnShadow, clBtnFace, True);
    end;
    Brush := CreateSolidBrush(GetSysColor(COLOR_BTNFACE));
    FillRect (DC, R, Brush);
    DeleteObject (Brush);
    InflateRect (R, -2, -2);  OffsetRect (R, -1, -1);
    if Pushed then
      OffsetRect (R, 1, 1);
    Pen := CreatePen(PS_SOLID, 1, GetSysColor(COLOR_BTNTEXT));
    SavePen := SelectObject(DC, Pen);
    for I := 0 to 1 do begin
      MoveToEx (DC, R.Left+I, R.Top, nil);
      LineTo (DC, R.Right+I, R.Bottom);
      LineTo (DC, R.Left+I, R.Top);
      MoveToEx (DC, R.Left+I, R.Bottom, nil);
      LineTo (DC, R.Right+I, R.Top);
      LineTo (DC, R.Left+I, R.Bottom);
    end;
    SelectObject (DC, SavePen);
    DeleteObject (Pen);
  end;


{$ENDIF}


procedure TppCustomToolWindow97.DrawFloatingNCArea (const Clip: HRGN;
  const RedrawBorder, RedrawCaption, RedrawCloseButton: Boolean);
{ Redraws all the non-client area (the border, title bar, and close button) of
  the toolbar when it is floating. }
const
  CaptionBkColors: array[Boolean] of Integer =
    (COLOR_ACTIVECAPTION, COLOR_INACTIVECAPTION);
  CaptionTextColors: array[Boolean] of Integer =
    (COLOR_CAPTIONTEXT, COLOR_INACTIVECAPTIONTEXT);

  procedure Win3DrawCaption (const DC: HDC; const R: TRect);
  { Emulates DrawCaption, which isn't supported in Win 3.x }
  const
    Ellipsis = '...';
  var
    R2: TRect;
    SaveTextColor, SaveBkColor: TColorRef;
    SaveFont: HFONT;
    Cap: String;
{$IFDEF WINDOWS}
    NewBrush: HBrush;
    lpCaption: array [0..255] of char;
{$ENDIF}

    function CaptionTextWidth: Integer;
    var
      Size: TSize;
    begin
    {$IFDEF WIN32} {DIGIMETA}
      GetTextExtentPoint32 (DC, PChar(Cap), Length(Cap), Size);
    {$ELSE}
      GetTextExtentPoint (DC, @Cap[1], Length(Cap), Size);
    {$ENDIF}

      Result := Size.cx;
    end;
  begin
    R2 := R;

    { Fill the rectangle }
{$IFDEF WIN32}
    FillRect (DC, R2, GetSysColorBrush(CaptionBkColors[FInactiveCaption]));
{$ELSE}
    NewBrush := CreateSolidBrush(GetSysColor(CaptionBkColors[FInactiveCaption]));
    FillRect (DC, R2, NewBrush);
    DeleteObject (NewBrush);
{$ENDIF}

    Inc (R2.Left);
    Dec (R2.Right);

    SaveFont := SelectObject(DC, CreateFont(-11, 0, 0, 0, FW_NORMAL, 0, 0, 0, 0, 0, 0, 0, 0, 'MS Sans Serif'));

    { Add ellipsis to caption if necessary }
    Cap := Caption;
    if CaptionTextWidth > R2.Right-R2.Left then begin
      Cap := Cap + Ellipsis;
      while (CaptionTextWidth > R2.Right-R2.Left) and (Length(Cap) > 4) do
        Delete (Cap, Length(Cap)-Length(Ellipsis), 1)
    end;

    { Draw the text }
    SaveBkColor := SetBkColor(DC, GetSysColor(CaptionBkColors[FInactiveCaption]));
    SaveTextColor := SetTextColor(DC, GetSysColor(CaptionTextColors[FInactiveCaption]));
{$IFDEF WIN32}
    DrawText (DC, PChar(Cap), Length(Cap), R2, DT_SINGLELINE or DT_NOPREFIX or DT_VCENTER);
{$ELSE}
    StrPCopy(lpCaption, Cap);
    DrawText (DC, lpCaption, Length(Cap), R2, DT_SINGLELINE or DT_NOPREFIX or DT_VCENTER);
{$ENDIF}
    SetTextColor (DC, SaveTextColor);
    SetBkColor (DC, SaveBkColor);

    DeleteObject (SelectObject(DC, SaveFont));
  end;
{$IFDEF WIN32}
const
  CloseButtonState: array[Boolean] of UINT = (0, DFCS_PUSHED);
  ActiveCaptionFlags: array[Boolean] of UINT = (DC_ACTIVE, 0);
{$ENDIF}
var
  DC: HDC;
  R: TRect;
  NewClipRgn: HRGN;
{$IFDEF WIN32}
  NewDrawCaption: function(p1: HWND; p2: HDC; const p3: TRect; p4: UINT): BOOL; stdcall;
{$ENDIF}
  SavePen: HPEN;
  SaveIndex: Integer;
  I: Integer;
{$IFDEF WINDOWS}
  NewBrush: HBRUSH;
{$ENDIF}

begin
  if Docked then Exit;

  DC := GetWindowDC(Handle);
  try
    { Use update region }
    if Clip <> 0 then begin
      GetWindowRect (Handle, R);
      { An invalid region is generally passed when the window is first created }
      if SelectClipRgn(DC, Clip) = ERROR then begin
        NewClipRgn := CreateRectRgnIndirect(R);
        SelectClipRgn (DC, NewClipRgn);
        DeleteObject (NewClipRgn);
      end;
      OffsetClipRgn (DC, -R.Left, -R.Top);
    end;

    { Border }
    if RedrawBorder then begin
      { This works around WM_NCPAINT problem described at top of source code }
      {no!  R := Rect(0, 0, Width, Height);}
      GetWindowRect (Handle, R);  OffsetRect (R, -R.Left, -R.Top);
      for I := 1 to ppGetBorderSize(Resizable).X do
        case I of
          1:
{$IFDEF WIN32}
               DrawEdge (DC, R, EDGE_RAISED, BF_RECT or BF_ADJUST);
{$ELSE}
               DCFrame3D (DC, R, clBtnFace, clBlack, True);
{$ENDIF}
          2: {$IFDEF WINDOWS}
             DCFrame3D (DC, R, clBtnHighlight, clBtnShadow, True)
             {$ENDIF};

        else
{$IFDEF WIN32}
          FrameRect (DC, R, GetSysColorBrush(COLOR_BTNFACE));
{$ELSE}
          begin
            NewBrush := CreateSolidBrush(GetSysColor(COLOR_BTNFACE));
            FrameRect (DC, R, NewBrush);
            DeleteObject (NewBrush);
          end;
{$ENDIF}

          InflateRect (R, -1, -1);
        end;
    end;

    if RedrawCaption and FCloseButton and RedrawCloseButton then
      SaveIndex := SaveDC(DC)
    else
      SaveIndex := 0;
    try
      if SaveIndex <> 0 then
        with GetCloseButtonRect(Self, True) do
          { Reduces flicker }
          ExcludeClipRect (DC, Left, Top, Right, Bottom);

      { Caption }
      if RedrawCaption then begin
        R := GetCaptionRect(Self, True, FCloseButton);
{$IFDEF WIN32}
        if NewStyleControls then begin
          { Use a dynamic import of DrawCaption since it's Win95/NT 4.0 only.
            Also note that Delphi's Win32 help for DrawCaption is totally wrong!
            I got updated info from www.microsoft.com/msdn/sdk/ }
          NewDrawCaption := GetProcAddress(GetModuleHandle(user32), 'DrawCaption');
          NewDrawCaption (Handle, DC, R, DC_TEXT or DC_SMALLCAP or
            ActiveCaptionFlags[FInactiveCaption]);
        end
        else
{$ENDIF}
          Win3DrawCaption (DC, R);

        { Line below caption }
        R := GetCaptionRect(Self, True, False);
        SavePen := SelectObject(DC, CreatePen(PS_SOLID, 1, GetSysColor(COLOR_BTNFACE)));
        MoveToEx (DC, R.Left, R.Bottom, nil);
        LineTo (DC, R.Right, R.Bottom);
        DeleteObject (SelectObject(DC, SavePen));
      end;
    finally
      if SaveIndex <> 0 then
        RestoreDC (DC, SaveIndex);
    end;

    { Close button }
    if FCloseButton then begin
      if RedrawCloseButton then begin
        R := GetCloseButtonRect(Self, True);
        InflateRect (R, -1, -1);
{$IFDEF WIN32}
        DrawFrameControl (DC, R, DFC_CAPTION, DFCS_CAPTIONCLOSE or
          CloseButtonState[CloseButtonDown]);
{$ELSE}
        DrawCloseButton (DC, R, CloseButtonDown);
{$ENDIF}
      end;
      if RedrawCaption then begin
        { Caption-colored frame around close button }
        R := GetCloseButtonRect(Self, True);
{$IFDEF WIN32}
        FrameRect (DC, R, GetSysColorBrush(CaptionBkColors[FInactiveCaption]));
{$ELSE}
        NewBrush := CreateSolidBrush(GetSysColor(CaptionBkColors[FInactiveCaption]));
        FrameRect (DC, R, NewBrush);
        DeleteObject (NewBrush);
{$ENDIF}
      end;
    end;
  finally
    ReleaseDC (Handle, DC);
  end;
end;



procedure TppCustomToolWindow97.ValidateDockedNCArea;
var
  Msg: TMsg;
begin
  if HandleAllocated then
    while PeekMessage(Msg, Handle, WM_ppTB97PaintDockedNCArea,
      WM_ppTB97PaintDockedNCArea, PM_REMOVE or PM_NOYIELD) do ;
end;

procedure TppCustomToolWindow97.InvalidateDockedNCArea;
begin
  if csDestroying in ComponentState then Exit;
  
  ValidateDockedNCArea;
  if HandleAllocated then
    PostMessage (Handle, WM_ppTB97PaintDockedNCArea, 0, 0);
end;

procedure TppCustomToolWindow97.WMTB97PaintDockedNCArea (var Message: TMessage);
begin
  DrawDockedNCArea (0);
end;


procedure TppCustomToolWindow97.DrawDockedNCArea (const Clip: HRGN);
{ Redraws all the non-client area of the toolbar when it is docked. }
var
  DC: HDC;
  R: TRect;
  NewClipRgn: HRGN;
  DockType: TppDockType;
  X, Y: Integer;
  R2, R3, R4: TRect;
  P1, P2: TPoint;
  Brush: HBRUSH;
  Clr: TColorRef;
  UsingBackground: Boolean;

  procedure DrawRaisedEdge (R: TRect; const FillInterior: Boolean);
  {$IFDEF WIN32}
  const
    FillMiddle: array[Boolean] of UINT = (0, BF_MIDDLE);
  begin
    DrawEdge (DC, R, BDR_RAISEDINNER, BF_RECT or FillMiddle[FillInterior]);
  end;

{$ELSE}     {DIGIMETA - from 1.47}
var
  lNewBrush: HBRUSH;
  begin
    DCFrame3D(DC, R, clBtnHighlight, clBtnShadow, FillInterior);
    if FillInterior then begin
      lNewBrush := CreateSolidBrush(ColorToRGB(clBtnFace));
      FillRect (DC, R, lNewBrush);
      DeleteObject(lNewBrush);
    end;
  end;
{$ENDIF}

begin
  ValidateDockedNCArea;
  if not Docked then Exit;

  DC := GetWindowDC(Handle);
  try
    { Use update region }
    if Clip <> 0 then begin
      GetWindowRect (Handle, R);
      { An invalid region is generally passed when the window is first created }
      if SelectClipRgn(DC, Clip) = ERROR then begin
        NewClipRgn := CreateRectRgnIndirect(R);
        SelectClipRgn (DC, NewClipRgn);
        DeleteObject (NewClipRgn);
      end;
      OffsetClipRgn (DC, -R.Left, -R.Top);
    end;

    { This works around WM_NCPAINT problem described at top of source code }
    {no!  R := Rect(0, 0, Width, Height);}
    GetWindowRect (Handle, R);  OffsetRect (R, -R.Left, -R.Top);

    if not(DockedTo.Position in PositionLeftOrRight) then
      DockType := ppdtTopBottom
    else
      DockType := ppdtLeftRight;

    Brush := CreateSolidBrush(ColorToRGB(Color));

    { Border }
    DrawRaisedEdge (R, False);
    R2 := R;
    InflateRect (R2, -1, -1);
    FrameRect (DC, R2, Brush);

    UsingBackground := DockedTo.UsingBackground and DockedTo.FBkgOnToolbars;

    { Draw the Background }
    if UsingBackground then begin
      R2 := R;
      P1 := DockedTo.ClientToScreen(Point(0, 0));
      P2 := DockedTo.Parent.ClientToScreen(DockedTo.BoundsRect.TopLeft);
      Dec (R2.Left, Left + DockedTo.Left + (P1.X-P2.X));
      Dec (R2.Top, Top + DockedTo.Top + (P1.Y-P2.Y));
      InflateRect (R, -1, -1);
      GetWindowRect (Handle, R4);
      R3 := ClientRect;
      with ClientToScreen(Point(0, 0)) do
        OffsetRect (R3, X-R4.Left, Y-R4.Top);
      DockedTo.DrawBackground (DC, R, @R3, R2);
    end;

    { The drag handle at the left, or top }
    if DockedTo.FAllowDrag then begin
      Clr := GetSysColor(COLOR_BTNHIGHLIGHT);
      if DockType <> ppdtLeftRight then begin
        Y := ClientHeight+2;
        if not UsingBackground then begin
          FillRect (DC, Rect(2, 2, 4, Y), Brush);
          FillRect (DC, Rect(10, 2, 11, Y), Brush);
        end;

        DrawRaisedEdge (Rect(4, 2, 7, Y), True);
{$IFDEF WIN32}
        SetPixelV (DC, 4, Y-1, Clr);
{$ELSE}
        SetPixel(DC,4, Y-1, Clr);
{$ENDIF}

        DrawRaisedEdge (Rect(7, 2, 10, Y), True);

{$IFDEF WIN32}
        SetPixelV (DC, 7, Y-1, Clr);
{$ELSE}
        SetPixel(DC,7, Y-1, Clr);
{$ENDIF}

      end
      else begin
        X := ClientWidth+2;
        if not UsingBackground then begin
          FillRect (DC, Rect(2, 2, X, 4), Brush);
          FillRect (DC, Rect(2, 10, X, 11), Brush);
        end;
        DrawRaisedEdge (Rect(2, 4, X, 7), True);
{$IFDEF WIN32}
        SetPixelV (DC, X-1, 4, Clr);
{$ELSE}
        SetPixel(DC,X-1, 4, Clr);
{$ENDIF}

        DrawRaisedEdge (Rect(2, 7, X, 10), True);
{$IFDEF WIN32}
        SetPixelV (DC, X-1, 7, Clr);
{$ELSE}
        SetPixel(DC,X-1, 7, Clr);
{$ENDIF}

      end;
    end;

    DeleteObject (Brush);
  finally
    ReleaseDC (Handle, DC);
  end;
end;



procedure TppCustomToolWindow97.WMNCPaint (var Message: TMessage);
begin

  { Don't call inherited because it overrides the default NC painting }
  if Docked then
    DrawDockedNCArea (Message.WParam)
  else
    DrawFloatingNCArea (Message.WParam, True, True, True);

end;

procedure TppCustomToolWindow97.Paint;
var
  R, R2, R3: TRect;
  P1, P2: TPoint;
begin
  inherited Paint;

  if Docked and DockedTo.UsingBackground and DockedTo.FBkgOnToolbars then begin
    R := ClientRect;
    R2 := R;
    P1 := DockedTo.ClientToScreen(Point(0, 0));
    P2 := DockedTo.Parent.ClientToScreen(DockedTo.BoundsRect.TopLeft);
    Dec (R2.Left, Left + DockedTo.Left + (P1.X-P2.X));
    Dec (R2.Top, Top + DockedTo.Top + (P1.Y-P2.Y));
    GetWindowRect (Handle, R3);
    with ClientToScreen(Point(0, 0)) do begin
      Inc (R2.Left, R3.Left-X);
      Inc (R2.Top, R3.Top-Y);
    end;
    DockedTo.DrawBackground (Canvas.Handle, R, nil, R2);

  end;
end;



function TppCustomToolWindow97.GetPalette: HPALETTE;
begin
  if Docked and DockedTo.UsingBackground then
    Result := DockedTo.FBkg.Palette
  else
    Result := 0;
end;

function TppCustomToolWindow97.PaletteChanged (Foreground: Boolean): Boolean;
begin
  Result := inherited PaletteChanged(Foreground);
  if Result and not Foreground then begin
    { There seems to be a bug in Delphi's palette handling. When the form is
      inactive and another window realizes a palette, docked TppToolbar97s
      weren't getting redrawn. So this workaround code was added. }
    InvalidateDockedNCArea;
    Invalidate;
  end;
end;

procedure DrawDragRect (const DC: HDC; const NewRect, OldRect: PRect;
  const NewSize, OldSize: TSize; const Brush: HBRUSH; BrushLast: HBRUSH);
{ Draws a dragging outline, hiding the old one if neccessary. This is
  completely flicker free, unlike the old DrawFocusRect method. In case
  you're wondering, I got a lot of ideas from the MFC sources.

  Either NewRect or OldRect can be nil or empty.

  NOTE: If the specific DC had a clipping region, it will be gone when this
  function exits. }
const
  BlankRect: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);
var
  rgnNew, rgnOutside, rgnInside, rgnLast, rgnUpdate: HRGN;
  R: TRect;
  SaveBrush: HBRUSH;
begin
  rgnLast := 0;
  rgnUpdate := 0;

  { First, determine the update region and select it }
  if NewRect = nil then begin
    R := BlankRect;
    rgnOutside := CreateRectRgnIndirect(R);
  end
  else begin
    R := NewRect^;
    rgnOutside := CreateRectRgnIndirect(R);
    InflateRect (R, -NewSize.cx, -NewSize.cy);
    IntersectRect (R, R, NewRect^);
  end;
  rgnInside := CreateRectRgnIndirect(R);
  rgnNew := CreateRectRgnIndirect(BlankRect);
  CombineRgn (rgnNew, rgnOutside, rgnInside, RGN_XOR);

  if BrushLast = 0 then
    BrushLast := Brush;

  if OldRect <> nil then begin
    { Find difference between new region and old region }
    rgnLast := CreateRectRgnIndirect(BlankRect);
    with OldRect^ do
      SetRectRgn (rgnOutside, Left, Top, Right, Bottom);
    R := OldRect^;
    InflateRect (R, -OldSize.cx, -OldSize.cy);
    IntersectRect (R, R, OldRect^);
    SetRectRgn (rgnInside, R.Left, R.Top, R.Right, R.Bottom);
    CombineRgn (rgnLast, rgnOutside, rgnInside, RGN_XOR);

    { Only diff them if brushes are the same}
    if Brush = BrushLast then begin
      rgnUpdate := CreateRectRgnIndirect(BlankRect);
      CombineRgn (rgnUpdate, rgnLast, rgnNew, RGN_XOR);
    end;
  end;
  if (Brush <> BrushLast) and (OldRect <> nil) then begin
    { Brushes are different -- erase old region first }
    SelectClipRgn (DC, rgnLast);
    GetClipBox (DC, R);
    SaveBrush := SelectObject(DC, BrushLast);
    PatBlt (DC, R.Left, R.Top, R.Right-R.Left, R.Bottom-R.Top, PATINVERT);
    SelectObject (DC, SaveBrush);
  end;

  { Draw into the update/new region }
  if rgnUpdate <> 0 then
    SelectClipRgn (DC, rgnUpdate)
  else
    SelectClipRgn (DC, rgnNew);
  GetClipBox (DC, R);
  SaveBrush := SelectObject(DC, Brush);
  PatBlt (DC, R.Left, R.Top, R.Right-R.Left, R.Bottom-R.Top, PATINVERT);
  SelectObject (DC, SaveBrush);

  { Free regions }
  if rgnNew <> 0 then DeleteObject (rgnNew);
  if rgnOutside <> 0 then DeleteObject (rgnOutside);
  if rgnInside <> 0 then DeleteObject (rgnInside);
  if rgnLast <> 0 then DeleteObject (rgnLast);
  if rgnUpdate <> 0 then DeleteObject (rgnUpdate);

  { Clean up DC }
  SelectClipRgn (DC, 0);
end;

procedure TppCustomToolWindow97.DrawDraggingOutline (const DC: HDC;
  const NewRect, OldRect: PRect; const NewDocking, OldDocking: Boolean);

  function CreateHalftoneBrush: HBRUSH;
  const
    Patterns: array[Boolean] of Word = ($5555, $AAAA);
  var
    I: Integer;
    GrayPattern: array[0..7] of Word;
    GrayBitmap: HBITMAP;
  begin
    for I := 0 to 7 do
      GrayPattern[I] := Patterns[Odd(I)];
    GrayBitmap := CreateBitmap(8, 8, 1, 1, @GrayPattern);
    Result := CreatePatternBrush(GrayBitmap);
    DeleteObject (GrayBitmap);
  end;
var
  NewSize, OldSize: TSize;
  Brush: HBRUSH;
begin
  Brush := CreateHalftoneBrush;
  try
    with ppGetBorderSize(Resizable) do begin
      if NewDocking then NewSize.cx := 1 else NewSize.cx := X;
      NewSize.cy := NewSize.cx;
      if OldDocking then OldSize.cx := 1 else OldSize.cx := X;
      OldSize.cy := OldSize.cx;
    end;
    DrawDragRect (DC, NewRect, OldRect, NewSize, OldSize, Brush, Brush);
  finally
    DeleteObject (Brush);
  end;
end;


procedure TppCustomToolWindow97.CMColorChanged (var Message: TMessage);
begin
  { Make sure non-client area is redrawn }
  InvalidateDockedNCArea;
  inherited;  { the inherited handler calls Invalidate }
end;

procedure TppCustomToolWindow97.CMTextChanged (var Message: TMessage);
begin
  inherited;
  if (csDestroying in ComponentState) then Exit;

  { Update the title bar to use the new Caption }
  DrawFloatingNCArea (0, False, True, False);
end;

procedure TppCustomToolWindow97.CMVisibleChanged (var Message: TMessage);
begin
  if (csDestroying in ComponentState) then
    begin
      inherited;
      Exit;
    end;

  if (FHidden = 0) and not(csDesigning in ComponentState) and Docked then
    DockedTo.ChangeDockList (Visible, Self, Visible);
  inherited;
  if (FHidden = 0) and Assigned(FOnVisibleChanged) then
    FOnVisibleChanged (Self);
end;

procedure TppCustomToolWindow97.WMActivate (var Message: TWMActivate);

  function GetParentToolWindow (Control: TControl): TppCustomToolWindow97;
  { Returns the parent toolbar (direct or indirect) of the control, or nil if it
    is not a child of a TppCustomToolWindow97 }
  begin
    Result := nil;
    while Control <> nil do begin
      if Control is TppCustomToolWindow97 then begin
        Result := TppCustomToolWindow97(Control);
        Break;
      end;
      Control := Control.Parent;
    end;
  end;

  function FindFirstFocusableNonToolWindowControl (const ParentControl: TWinControl): TWinControl;
  var
    List: TList;
    I: Integer;
    CurControl: TWinControl;
  begin
    Result := nil;
    List := TList.Create;
    try
      with ParentControl do begin
        GetTabOrderList (List);
        for I := 0 to List.Count-1 do begin
          CurControl := List[I];
          if CurControl.TabStop and CurControl.CanFocus and
             (GetParentToolWindow(CurControl) = nil) then begin
            Result := CurControl;
            Break;
          end;
        end;
      end;
    finally
      List.Free;
    end;
  end;
{var
  Ctl: TWinControl;}
 { I: Integer;}
begin

  {DIGIMETA  - added csDestroying condition}
  if Docked or (csDestroying in ComponentState)  then begin
    inherited;
    Exit;
  end;


   {DIGIMETA - the following line causes lock ups, when the owner form is hidden}
  {SendMessage (MDIParentForm.Handle, WM_NCACTIVATE, Ord(Message.Active <> WA_INACTIVE), 0);
   }
   
  inherited;

   {DIGIMETA - the code below this statment caused a lock up when hiding and showing the
                report designer. The Ctl that the logic below found was
                on the pnlPreviewBar which could not have focus because the
                preview page was not active. The end-result is that this
                routine fired infinitely.}

    if Message.Active = WA_INACTIVE then
      TForm(Owner).ActiveControl := GetFloatParent;


  {if Message.Active = WA_INACTIVE then begin
    Ctl := FindFirstFocusableNonToolWindowControl(TForm(Owner));
    for I := 0 to HookedForms.Count-1 do
      with PppHookedFormInfo(HookedForms[I])^ do
        if Form = TForm(Owner) then begin
          if SaveActiveControl <> 0 then
            Ctl := FindControl(SaveActiveControl);
          Break;
        end;
    if Ctl = nil then
      { Can't leave Ctl set to nil or the VCL will automatically pick a new
       ActiveControl (which we don't want, because it could be another tool
       window). So just set Ctl to FloatParent, which effectively leaves no
       currently focused control on the form. }
    {  Ctl := FloatParent;
    TForm(Owner).ActiveControl := Ctl;
   end;    }

end;

procedure TppCustomToolWindow97.WMMouseActivate (var Message: TWMMouseActivate);
begin
  if Docked or (csDesigning in ComponentState) then
    inherited
  else begin
    { When floating, prevent the toolbar from activating when clicked.
      This is so it doesn't take the focus away from the window that had it }
    Message.Result := MA_NOACTIVATE;

    { Similar to calling BringWindowToTop, but doesn't activate it }
    SetWindowPos (Handle, HWND_TOP, 0, 0, 0, 0,
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

    { Since it is returning MA_NOACTIVATE, activate the form instead. }
    if FActivateParent and
       (GetActiveWindow <> Handle) then begin
      { ^ Note to self: That must be in there so that double-clicks work
          properly on controls like Edits }
      SetActiveWindow (MDIParentForm.Handle);
      if MDIParentForm <> TForm(Owner) then   { if it's an MDI child form }
        BringWindowToTop (TForm(Owner).Handle);
    end;
  end;
end;

procedure TppCustomToolWindow97.BeginMoving (const InitX, InitY: Integer);
type
  PDockedSize = ^TDockedSize;
  TDockedSize = record
    Dock: TppDock97;
    Size: TPoint;
  end;
var
  NewDockedSizes: TList; {items are pointers to TDockedSizes}
  MouseOverDock: TppDock97;
  MoveRect: TRect;
  PreventDocking: Boolean;
  ScreenDC: HDC;
  NPoint, DPoint: TPoint;

  procedure Dropped;
  var
    NewDockRow: Integer;
    Before: Boolean;
    MoveRectClient: TRect;
    C: Integer;
  begin
    if MouseOverDock <> nil then begin
      MoveRectClient := MoveRect;
      MapWindowPoints (0, MouseOverDock.Handle, MoveRectClient, 2);
      if not(MouseOverDock.Position in PositionLeftOrRight) then
        C := (MoveRectClient.Top+MoveRectClient.Bottom) div 2
      else
        C := (MoveRectClient.Left+MoveRectClient.Right) div 2;
      NewDockRow := TppDock97(MouseOverDock).GetRowOf(C, Before);
      if Before then
        TppDock97(MouseOverDock).InsertRowBefore (NewDockRow);
      FDockRow := NewDockRow;
      if not(MouseOverDock.Position in PositionLeftOrRight) then
        FDockPos := MoveRectClient.Left
      else
        FDockPos := MoveRectClient.Top;
      DockedTo := MouseOverDock;
    end
    else begin
      FFloatingTopLeft := MoveRect.TopLeft;
      DockedTo := nil;
    end;

    { Make sure it doesn't go completely off the screen }
    MoveOnScreen (True);
  end;

  procedure MouseMoved;
  var
    OldMouseOverDock: TppDock97;
    OldMoveRect: TRect;
    Pos: TPoint;

    function CheckIfCanDockTo (Control: TppDock97): Boolean;
    const
      DockSensX = 32;
      DockSensY = 20;
    var
      R, S, Temp: TRect;
      I: Integer;
      Sens: Integer;
    begin
      with Control do begin
        Result := False;

        R := ClientRect;
        MapWindowPoints (Handle, 0, R, 2);
        for I := 0 to NewDockedSizes.Count-1 do
          with PDockedSize(NewDockedSizes[I])^ do begin
            if Dock <> Control then Continue;
            S := Bounds(Pos.X-MulDiv(Size.X-1, NPoint.X, DPoint.X),
              Pos.Y-MulDiv(Size.Y-1, NPoint.Y, DPoint.Y),
              Size.X, Size.Y);
            Break;
          end;
        if (R.Left = R.Right) or (R.Top = R.Bottom) then begin
          if not(Control.Position in PositionLeftOrRight) then
            InflateRect (R, 0, 1)
          else
            InflateRect (R, 1, 0);
        end;

        { Like Office 97, distribute ~32 pixels of extra dock detection area
          to the left side if the toolbar was grabbed at the left, both sides
          if the toolbar was grabbed at the middle, or the right side if
          toolbar was grabbed at the right. If outside, don't try to dock. }
        Sens := MulDiv(DockSensX, NPoint.X, DPoint.X);
        if (Pos.X < R.Left-(DockSensX-Sens)) or (Pos.X > R.Right-1+Sens) then
          Exit;

        { Don't try to dock to the left or right if pointer is above or below
          the boundaries of the dock }
        if (Control.Position in PositionLeftOrRight) and
           ((Pos.Y < R.Top) or (Pos.Y >= R.Bottom)) then
          Exit;

        { And also distribute ~20 pixels of extra dock detection area to
          the top or bottom side }
        Sens := MulDiv(DockSensY, NPoint.Y, DPoint.Y);
        if (Pos.Y < R.Top-(DockSensY-Sens)) or (Pos.Y > R.Bottom-1+Sens) then
          Exit;

{$IFDEF WIN32}           {DIGIMETA}
        Result := IntersectRect(Temp, R, S);
{$ELSE}
        Result := IntersectRect(Temp, R, S) <> 0;
{$ENDIF}
      end;
    end;
  var
    R: TRect;
    D: TppDockPosition;
    I: Integer;
  begin
    OldMouseOverDock := MouseOverDock;
    OldMoveRect := MoveRect;

    GetCursorPos (Pos);

    { Check if it can dock }
    MouseOverDock := nil;
    if not PreventDocking then begin
      { Search through the form's controls and see if it can find a
        Dock97. If it finds one, assign it to MouseOverDock. }
      with TForm(Owner) do
        for D := Low(D) to High(D) do
          if D in DockableTo then
            for I := 0 to ComponentCount-1 do
              if (Components[I] is TppDock97) and
                 (TppDock97(Components[I]).Position = D) and
                 TppDock97(Components[I]).FAllowDrag and
                 CheckIfCanDockTo(TppDock97(Components[I])) then begin
                MouseOverDock := TppDock97(Components[I]);
                Break;
              end;
    end;

    { If not docking, clip the point so it doesn't get dragged under the
      taskbar }
    if MouseOverDock = nil then begin
      R := ppGetDesktopArea;
      if Pos.X < R.Left then Pos.X := R.Left;
      if Pos.X > R.Right then Pos.X := R.Right;
      if Pos.Y < R.Top then Pos.Y := R.Top;
      if Pos.Y > R.Bottom then Pos.Y := R.Bottom;
    end;

    for I := 0 to NewDockedSizes.Count-1 do
      with PDockedSize(NewDockedSizes[I])^ do begin
        if Dock <> MouseOverDock then Continue;
        MoveRect := Bounds(Pos.X-MulDiv(Size.X-1, NPoint.X, DPoint.X),
          Pos.Y-MulDiv(Size.Y-1, NPoint.Y, DPoint.Y),
          Size.X, Size.Y);
        Break;
      end;

    { Make sure title bar (or at least part of the toolbar) is still accessible
      if it's dragged almost completely off the screen. This prevents the
      problem seen in Office 97 where you drag it offscreen so that only the
      border is visible, sometimes leaving you no way to move it back short of
      resetting the toolbar. }
    if MouseOverDock = nil then begin
      R := ppGetDesktopArea;
      with ppGetBorderSize(Resizable) do
        InflateRect (R, -(X+4), -(Y+4));
      if MoveRect.Bottom < R.Top then
        OffsetRect (MoveRect, 0, R.Top-MoveRect.Bottom);
      if MoveRect.Top > R.Bottom then
        OffsetRect (MoveRect, 0, R.Bottom-MoveRect.Top);
      if MoveRect.Right < R.Left then
        OffsetRect (MoveRect, R.Left-MoveRect.Right, 0);
      if MoveRect.Left > R.Right then
        OffsetRect (MoveRect, R.Right-MoveRect.Left, 0);
    end;

    { Update the dragging outline }
    DrawDraggingOutline (ScreenDC, @MoveRect, @OldMoveRect, MouseOverDock <> nil,
      OldMouseOverDock <> nil);
  end;
var
  Accept: Boolean;
  R: TRect;
  Msg: TMsg;
  NewDockedSize: PDockedSize;
  I: Integer;
begin
  Accept := False;

  if csDestroying in ComponentState then Exit;

  NPoint := Point(InitX, InitY);
  { Adjust for non-client area }
  GetWindowRect (Handle, R);
  R.BottomRight := ClientToScreen(Point(0, 0));
  Dec (NPoint.X, R.Left-R.Right);
  Dec (NPoint.Y, R.Top-R.Bottom);

  DPoint := Point(Width-1, Height-1);

  PreventDocking := GetKeyState(VK_CONTROL) < 0;

  { Set up potential sizes for each dock type }
  NewDockedSizes := TList.Create;
  try
    SetRectEmpty (R);
    CustomArrangeControls (ppatNone, DockedTo, nil, R.BottomRight);
    ppAddFloatingNCAreaToRect (R, Resizable);
    New (NewDockedSize);
    try
      with NewDockedSize^ do begin
        Dock := nil;
        Size := Point(R.Right-R.Left, R.Bottom-R.Top);
      end;
      NewDockedSizes.Add (NewDockedSize);
    except
      Dispose (NewDockedSize);
      raise;
    end;
    with TForm(Owner) do
      for I := 0 to ComponentCount-1 do begin
        if not(Components[I] is TppDock97) then Continue;
        New (NewDockedSize);
        try
          with NewDockedSize^ do begin
            Dock := TppDock97(Components[I]);
            if Components[I] <> DockedTo then
              CustomArrangeControls (ppatNone, DockedTo, TppDock97(Components[I]), Size)
            else
              Size := Self.ClientRect.BottomRight;
            AddDockedNCAreaToSize (Size, TppDock97(Components[I]).Position in PositionLeftOrRight);
          end;
          NewDockedSizes.Add (NewDockedSize);
        except
          Dispose (NewDockedSize);
          raise;
        end;
      end;

    { Before locking, make sure all pending paint messages are processed }
    ProcessPaintMessages;

    { This uses LockWindowUpdate to suppress all window updating so the
      dragging outlines doesn't sometimes get garbled. (This is safe, and in
      fact, is the main purpose of the LockWindowUpdate function)
      IMPORTANT! While debugging you might want to enable the 'TB97DisableLock'
      conditional define (see top of the source code). }
    {$IFNDEF TB97DisableLock}
    LockWindowUpdate (GetDesktopWindow);
    {$ENDIF}
    { Get a DC of the entire screen. Works around the window update lock
      by specifying DCX_LOCKWINDOWUPDATE. }
    ScreenDC := GetDCEx(GetDesktopWindow, 0,
      DCX_LOCKWINDOWUPDATE or DCX_CACHE or DCX_WINDOW);
    try
      SetCapture (Handle);

      { Initialize }
      MouseOverDock := nil;
      SetRectEmpty (MoveRect);
      MouseMoved;

      { Stay in message loop until capture is lost. Capture is removed either
        by this procedure manually doing it, or by an outside influence (like
        a message box or menu popping up) }
      while GetCapture = Handle do begin
        case Integer(GetMessage(Msg, 0, 0, 0)) of
{$IFDEF WIN32} {DIGIMETA - from 1.47}
          -1: Break; { if GetMessage failed }
{$ENDIF}
          0: begin
               { Repost WM_QUIT messages }
               PostQuitMessage (Msg.WParam);
               Break;
             end;
        end;

        case Msg.Message of
          WM_KEYDOWN, WM_KEYUP:
            { Ignore all keystrokes while dragging. But process Ctrl and Escape }
            case Msg.WParam of
              VK_CONTROL:
                if PreventDocking <> (Msg.Message = WM_KEYDOWN) then begin
                  PreventDocking := Msg.Message = WM_KEYDOWN;
                  MouseMoved;
                end;
              VK_ESCAPE:
                Break;
            end;
          WM_MOUSEMOVE:
            { Note to self: WM_MOUSEMOVE messages should never be dispatched
              here to ensure no hints get shown during the drag process }
            MouseMoved;
          WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
            { Make sure it doesn't begin another loop }
            Break;
          WM_LBUTTONUP: begin
              Accept := True;
              Break;
            end;
          WM_RBUTTONDOWN..WM_MBUTTONDBLCLK:
            { Ignore all other mouse up/down messages }
            ;
        else
          TranslateMessage (Msg);
          DispatchMessage (Msg);
        end;
      end;
    finally
      { Since it sometimes breaks out of the loop without capture being
        released }
      if GetCapture = Handle then
        ReleaseCapture;

      { Hide dragging outline and release the DC }
      DrawDraggingOutline (ScreenDC, nil, @MoveRect, False, MouseOverDock <> nil);
      ReleaseDC (GetDesktopWindow, ScreenDC);

      { Release window update lock }
      {$IFNDEF TB97DisableLock}
      LockWindowUpdate (0);
      {$ENDIF}
    end;

    { Move to new position }
    if Accept then
      Dropped;
  finally
    for I := NewDockedSizes.Count-1 downto 0 do
      Dispose (PDockedSize(NewDockedSizes[I]));
    NewDockedSizes.Free;
  end;
end;

procedure TppCustomToolWindow97.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  function ControlExistsAtPos (const P: TPoint): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to ControlCount-1 do
      if not(Controls[I] is TppToolbarSep97) and Controls[I].Visible and
         PtInRect(Controls[I].BoundsRect, P) then begin
        Result := True;
        Break;
      end;
  end;
begin
  inherited MouseDown(Button, Shift, X, Y);
  if (Button <> mbLeft) or
     { Ignore message if user clicked on a child control that was probably
       disabled }
     ControlExistsAtPos(Point(X, Y)) or
     (Docked and not DockedTo.FAllowDrag) then
    Exit;

  { Handle double click }
  if ssDouble in Shift then begin
    if Docked then
      DockedTo := nil
    else begin
      {DIGIMETA}
      {just let the toolwindow be docked at its last docked position}
    { FDockRow := ForceDockAtTopRow;
      FDockPos := ForceDockAtLeftPos;}
      DockedTo := DefaultDock;
    end;
    Exit;
  end;

  BeginMoving (X, Y);
end;

procedure TppCustomToolWindow97.WMNCHitTest (var Message: TWMNCHitTest);
var
  P: TPoint;
  BorderSize: TPoint;
  C: Integer;
  Caps: TppToolWindowResizeCaps;
begin
  inherited;
  with Message do
    if Docked then begin
      if Result = HTNOWHERE then
        Result := HTCLIENT;
    end
    else begin
      P := SmallPointToPoint(Pos);
      Dec (P.X, Left);  Dec (P.Y, Top);
      if Result <> HTCLIENT then begin
        if PtInRect(GetCaptionRect(Self, True, False), P) then begin
          if FCloseButton and PtInRect(GetCloseButtonRect(Self, True), P) then
            Result := HTCLOSE
          else
            Result := HTCLIENT;
        end
        else begin
          if Result in [HTLEFT..HTBOTTOMRIGHT] {set covers all resizing corners} then
            Result := HTNOWHERE;  { handles all resize hit-tests itself }

          if Resizable then begin
            GetResizeCaps (Caps);
            BorderSize := ppGetBorderSize(Resizable);
            C := BorderSize.X + (ppGetSmallCaptionHeight-1);
            if not Caps.EightCorner then begin
              if (P.Y >= 0) and (P.Y < BorderSize.Y) then Result := HTTOP else
              if (P.Y < Height) and (P.Y >= Height-BorderSize.Y-1) then Result := HTBOTTOM else
              if (P.X >= 0) and (P.X < BorderSize.X) then Result := HTLEFT else
              if (P.X < Width) and (P.X >= Width-BorderSize.X-1) then Result := HTRIGHT;
            end
            else begin
              if (P.X >= 0) and (P.X < BorderSize.X) then begin
                Result := HTLEFT;
                if (P.Y < C) then Result := HTTOPLEFT else
                if (P.Y >= Height-C) then Result := HTBOTTOMLEFT;
              end
              else
              if (P.X < Width) and (P.X >= Width-BorderSize.X-1) then begin
                Result := HTRIGHT;
                if (P.Y < C) then Result := HTTOPRIGHT else
                if (P.Y >= Height-C) then Result := HTBOTTOMRIGHT;
              end
              else
              if (P.Y >= 0) and (P.Y < BorderSize.Y) then begin
                Result := HTTOP;
                if (P.X < C) then Result := HTTOPLEFT else
                if (P.X >= Width-C) then Result := HTTOPRIGHT;
              end
              else
              if (P.Y < Height) and (P.Y >= Height-BorderSize.Y-1) then begin
                Result := HTBOTTOM;
                if (P.X < C) then Result := HTBOTTOMLEFT else
                if (P.X >= Width-C) then Result := HTBOTTOMRIGHT;
              end;
            end;
          end;
        end;
      end;
    end;
end;

procedure TppCustomToolWindow97.WMNCLButtonDown (var Message: TWMNCLButtonDown);
  procedure CloseButtonLoop;
  var
    Accept, NewCloseButtonDown: Boolean;
    P: TPoint;
    Msg: TMsg;
  begin
    Accept := False;

    CloseButtonDown := True;

    DrawFloatingNCArea (0, False, False, True);

    SetCapture (Handle);

    try
      while GetCapture = Handle do begin
        case Integer(GetMessage(Msg, 0, 0, 0)) of

{$IFDEF WIN32}    {DIGIMETA - from 1.47}
          -1: Break; { if GetMessage failed }
{$ENDIF}
          0: begin
               { Repost WM_QUIT messages }
               PostQuitMessage (Msg.WParam);
               Break;
             end;
        end;

        case Msg.Message of
          WM_KEYDOWN, WM_KEYUP:
            { Ignore all keystrokes while in a close button loop }
            ;
          WM_MOUSEMOVE: begin
              { Note to self: WM_MOUSEMOVE messages should never be dispatched
                here to ensure no hints get shown }
              GetCursorPos (P);
              Dec (P.X, Left);  Dec (P.Y, Top);

              NewCloseButtonDown := PtInRect(GetCloseButtonRect(Self, True), P);
              if CloseButtonDown <> NewCloseButtonDown then begin
                CloseButtonDown := NewCloseButtonDown;

                DrawFloatingNCArea (0, False, False, True);

              end;
            end;
          WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
            { Make sure it doesn't begin another loop }
            Break;
          WM_LBUTTONUP: begin
              if CloseButtonDown then
                Accept := True;
              Break;
            end;
          WM_RBUTTONDOWN..WM_MBUTTONDBLCLK:
            { Ignore all other mouse up/down messages }
            ;
        else
          TranslateMessage (Msg);
          DispatchMessage (Msg);
        end;
      end;
    finally
      if GetCapture = Handle then
        ReleaseCapture;
      if CloseButtonDown <> False then begin
        CloseButtonDown := False;
        DrawFloatingNCArea (0, False, False, True);
      end;
    end;
    if Accept then begin
      { Hide the window after close button is pushed }
      Hide;
      if Assigned(FOnClose) then
        FOnClose (Self);
    end;
  end;
var
  Accept: Boolean;
  NewRect: TRect;
begin
  case Message.HitTest of
    HTLEFT..HTBOTTOMRIGHT:
      if not Docked then begin
        Accept := False;
        SetRectEmpty (NewRect);
        BeginSizing (Message.HitTest, Accept, NewRect);
        if Accept then begin
          Inc (FDisableArrangeControls);
          try
            BoundsRect := NewRect;
          finally
            Dec (FDisableArrangeControls);
          end;
          ArrangeControls;

          { Make sure it doesn't go completely off the screen }
          MoveOnScreen (True);
        end;
      end;
    HTCLOSE:
      if not Docked then
        CloseButtonLoop;
  else
    inherited;
  end;
end;

procedure TppCustomToolWindow97.GetResizeCaps (var Caps: TppToolWindowResizeCaps);
begin
  Caps.EightCorner := True;
  Caps.ClipCursor := True;
end;

procedure TppCustomToolWindow97.ResizeBegin;
begin
end;

procedure TppCustomToolWindow97.ResizeTrack (var Rect: TRect; const OrigRect: TRect);
begin
end;

procedure TppCustomToolWindow97.ResizeEnd;
begin
end;

procedure TppCustomToolWindow97.BeginSizing (const HitTestValue: Integer;
  var Accept: Boolean; var NewRect: TRect);
var
  DragX, DragY, ReverseX, ReverseY: Boolean;
  MinWidth, MinHeight: Integer;
  DragRect, OrigDragRect: TRect;
  ScreenDC: HDC;
  OrigPos, OldPos: TPoint;

  procedure MouseMoved;
  var
    Pos: TPoint;
    OldDragRect: TRect;
  begin
    GetCursorPos (Pos);
    { It needs to check if the cursor actually moved since last time. This is
      because a call to LockWindowUpdate (apparently) generates a mouse move
      message even when mouse hasn't moved. }
    if (Pos.X = OldPos.X) and (Pos.Y = OldPos.Y) then Exit;
    OldPos := Pos;

    OldDragRect := DragRect;
    DragRect := OrigDragRect;
    if DragX then begin
      if not ReverseX then Inc (DragRect.Right, Pos.X-OrigPos.X)
      else Inc (DragRect.Left, Pos.X-OrigPos.X);
    end;
    if DragY then begin
      if not ReverseY then Inc (DragRect.Bottom, Pos.Y-OrigPos.Y)
      else Inc (DragRect.Top, Pos.Y-OrigPos.Y);
    end;
    if DragRect.Right-DragRect.Left < MinWidth then begin
      if not ReverseX then DragRect.Right := DragRect.Left + MinWidth
      else DragRect.Left := DragRect.Right - MinWidth;
    end;
    if DragRect.Bottom-DragRect.Top < MinHeight then begin
      if not ReverseY then DragRect.Bottom := DragRect.Top + MinHeight
      else DragRect.Top := DragRect.Bottom - MinHeight;
    end;

    ResizeTrack (DragRect, OrigDragRect);
    DrawDraggingOutline (ScreenDC, @DragRect, @OldDragRect, False, False);
  end;
var
  Caps: TppToolWindowResizeCaps;
  Msg: TMsg;
  R: TRect;
begin
  Accept := False;

  if csDestroying in ComponentState then Exit;

  GetResizeCaps (Caps);

  GetMinimumSize (MinWidth, MinHeight);
  Inc (MinWidth, Width-ClientWidth);
  Inc (MinHeight, Height-ClientHeight);

  DragX := HitTestValue in [HTLEFT, HTRIGHT, HTTOPLEFT, HTTOPRIGHT, HTBOTTOMLEFT, HTBOTTOMRIGHT];
  ReverseX := HitTestValue in [HTLEFT, HTTOPLEFT, HTBOTTOMLEFT];
  DragY := HitTestValue in [HTTOP, HTTOPLEFT, HTTOPRIGHT, HTBOTTOM, HTBOTTOMLEFT, HTBOTTOMRIGHT];
  ReverseY := HitTestValue in [HTTOP, HTTOPLEFT, HTTOPRIGHT];

  ResizeBegin (HitTestValue);
  try
    { Before locking, make sure all pending paint messages are processed }
    ProcessPaintMessages;

    { This uses LockWindowUpdate to suppress all window updating so the
      dragging outlines doesn't sometimes get garbled. (This is safe, and in
      fact, is the main purpose of the LockWindowUpdate function)
      IMPORTANT! While debugging you might want to enable the 'TB97DisableLock'
      conditional define (see top of the source code). }
    {$IFNDEF TB97DisableLock}
    LockWindowUpdate (GetDesktopWindow);
    {$ENDIF}
    { Get a DC of the entire screen. Works around the window update lock
      by specifying DCX_LOCKWINDOWUPDATE. }
    ScreenDC := GetDCEx(GetDesktopWindow, 0,
      DCX_LOCKWINDOWUPDATE or DCX_CACHE or DCX_WINDOW);
    try
      SetCapture (Handle);
      if Caps.ClipCursor then begin
        R := ppGetDesktopArea;
        ClipCursor (@R);
      end;

      { Initialize }
      OrigDragRect := BoundsRect;
      DragRect := OrigDragRect;
      DrawDraggingOutline (ScreenDC, @DragRect, nil, False, False);
      GetCursorPos (OrigPos);
      OldPos := OrigPos;

      { Stay in message loop until capture is lost. Capture is removed either
        by this procedure manually doing it, or by an outside influence (like
        a message box or menu popping up) }
      while GetCapture = Handle do begin
        case Integer(GetMessage(Msg, 0, 0, 0)) of
{$IFDEF WIN32}    {DIGIMETA - from 1.47}
          -1: Break; { if GetMessage failed }
{$ENDIF}
          0: begin
               { Repost WM_QUIT messages }
               PostQuitMessage (Msg.WParam);
               Break;
             end;
        end;

        case Msg.Message of
          WM_KEYDOWN, WM_KEYUP:
            { Ignore all keystrokes while sizing except for Escape }
            if Msg.WParam = VK_ESCAPE then
              Break;
          WM_MOUSEMOVE:
            { Note to self: WM_MOUSEMOVE messages should never be dispatched
              here to ensure no hints get shown during the drag process }
            MouseMoved;
          WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
            { Make sure it doesn't begin another loop }
            Break;
          WM_LBUTTONUP: begin
              Accept := True;
              Break;
            end;
          WM_RBUTTONDOWN..WM_MBUTTONDBLCLK:
            { Ignore all other mouse up/down messages }
            ;
        else
          TranslateMessage (Msg);
          DispatchMessage (Msg);
        end;
      end;
    finally
      { Since it sometimes breaks out of the loop without capture being
        released }
      if GetCapture = Handle then
        ReleaseCapture;
      ClipCursor (nil);

      { Hide dragging outline and release the DC }
      DrawDraggingOutline (ScreenDC, nil, @DragRect, False, False);
      ReleaseDC (GetDesktopWindow, ScreenDC);

      { Release window update lock }
      {$IFNDEF TB97DisableLock}
      LockWindowUpdate (0);
      {$ENDIF}
    end;
  finally
    ResizeEnd (Accept);
  end;

  if Accept then
    NewRect := DragRect;
end;

procedure TppCustomToolWindow97.WMClose (var Message: TWMClose);
begin
  { A floating toolbar does not use WM_CLOSE messages when its close button
    is clicked, but Windows still sends a WM_CLOSE message if the user
    presses Alt+F4 while one of the toolbar's controls is focused. Inherited
    is not called since we do not want Windows' default processing - which
    destroys the window. Instead, relay the message to the parent form. }
  if csDestroying in ComponentState then
    inherited
  else
    SendMessage (MDIParentForm.Handle, WM_CLOSE, 0, 0);
  { Note to self: MDIParentForm is used instead of TForm(Owner) since MDI
    childs don't process Alt+F4 as Close }
end;

class function TppCustomToolWindow97.NewMainWindowHook (var Message: TMessage): Boolean;
var
  I: Integer;
begin

  Result := False;


  case Message.Msg of

{$IFDEF WIN32}
    CM_ACTIVATE, CM_DEACTIVATE:
      for I := 0 to MainHookedForms.Count-1 do
        { Hide or restore toolbars when application is deactivated or activated }

{$IFDEF WIN32}    {DIGIMETA}
        ShowHideFloatParents (ppGetMDIParent(PppMainHookedFormInfo(MainHookedForms[I]).Form), Message.Msg = CM_ACTIVATE);
{$ELSE}
        ShowHideFloatParents (ppGetMDIParent(PppMainHookedFormInfo(MainHookedForms[I])^.Form), Message.Msg = CM_ACTIVATE);
{$ENDIF}

{$ENDIF}

    WM_ppTB97DoneCreating:
      if (Integer(Message.WParam) = Integer(WM_ppTB97DoneCreating_Magic)) and
         (Integer(Message.LParam) = Integer(WM_ppTB97DoneCreating_Magic)) then
        for I := DoneCreatingList.Count-1 downto 0 do begin
          ShowHideFloatParents (TppCustomToolWindow97(DoneCreatingList[I]).MDIParentForm, Application.Active);
          DoneCreatingList.Delete (I);
        end;
  end;


end;

{ TppCustomToolWindow97 - property access methods }

procedure TppCustomToolWindow97.SetCloseButton (Value: Boolean);
begin
  if FCloseButton <> Value then begin
    FCloseButton := Value;

    { Update the close button's visibility }
    DrawFloatingNCArea (0, False, True, True);
  end;
end;

procedure TppCustomToolWindow97.SetDefaultDock (Value: TppDock97);
begin
  if FDefaultDock <> Value then begin
    FDefaultDock := Value;
{$IFDEF WIN32}     {DIGIMETA}
    if Assigned(Value) then
      Value.FreeNotification (Self);
{$ENDIF}
  end;
end;

{DIGIMETA - added 2/13/1999}
procedure TppCustomToolWindow97.DoOnDockChanging;
begin
 if Assigned(FOnDockChanging) then FOnDockChanging (Self);
end;

{DIGIMETA - added 2/13/1999}
procedure TppCustomToolWindow97.DoOnDockChanged;
begin
  if Assigned(FOnDockChanged) then FOnDockChanged (Self);
end;


procedure TppCustomToolWindow97.SetDockedTo (Value: TppDock97);
var
  OldDockedTo: TppDock97;
  HiddenInced: Boolean;
  TempSize: TPoint;
  lFloatParent: TWinControl;
begin

  lFloatParent := GetFloatParent; {DIGIMETA}

  OldDockedTo := DockedTo;

  if (Value <> OldDockedTo) then DoOnDockChanging;

  Inc (FUpdatingBounds);
  try
    if Assigned(Value) then
      Inc (Value.DisableArrangeToolbars);
    try
      { Before changing between docked and floating state (and vice-versa)
        or between docks, hide the toolbar. This prevents any flashing while
        it's being moved }
      HiddenInced := False;
      if not(csDesigning in ComponentState) and (Value <> OldDockedTo) and (Visible) then begin
        Inc (FHidden);
        HiddenInced := True;
        if Assigned(OldDockedTo) then
          { Need to disable arranging of current dock so it doesn't lose it's
            FDockRow/FDockPos it's going to set later }
          Inc (OldDockedTo.DisableArrangeToolbars);
        try
          Hide; {must Hide AFTER incing Hidden}
        finally
          if Assigned(OldDockedTo) then
            Dec (OldDockedTo.DisableArrangeToolbars);
        end;
      end;
      try
        if Value <> nil then begin
          { Must pre-arrange controls in new dock orientation before changing
            the Parent }
          if Parent <> nil then
            CustomArrangeControls (ppatMoveControls, OldDockedTo, Value, TempSize);
          if Parent <> Value then begin
            Inc (FDisableArrangeControls);
            try
              Parent := Value;
            finally
              Dec (FDisableArrangeControls);
            end;
          end;
          ArrangeControls;
          { Temporarily put it off the edge of the parent window when changing
            parents so that no momentary "flicker" occurs when it shows the
            toolbar again before it gets positioned }
          if (Value <> OldDockedTo) then
            SetBounds (-Width, -Height, Width, Height);
        end
        else begin
          { Must pre-arrange controls in new dock orientation before changing
            the Parent }
          if Parent <> nil then
            CustomArrangeControls (ppatMoveControls, OldDockedTo, Value, TempSize);
          Inc (FDisableArrangeControls);
          try
            if Parent <> lFloatParent then
              Parent := lFloatParent;
            SetBounds (FFloatingTopLeft.X, FFloatingTopLeft.Y, Width, Height);
            MoveOnScreen (True);
          finally
            Dec (FDisableArrangeControls);
          end;
          ArrangeControls;
        end;
      finally
        if HiddenInced then begin
          Dec (FHidden);
          Show;
        end;
      end;
    finally
      if Assigned(Value) then
        Dec (Value.DisableArrangeToolbars);
    end;
  finally
    Dec (FUpdatingBounds);
  end;
  if Assigned(Value) then
    Value.ArrangeToolbars;

    
  if (Value <> OldDockedTo) then DoOnDockChanged;

  {DIGIMETA}
  if Assigned(Value) then
    begin
      FreeFloatParent;      {added for efficiency}
      DefaultDock := Value; {update DefaultDock}
    end;
end;

procedure TppCustomToolWindow97.SetDockPos (Value: Integer);
begin
  FDockPos := Value;
  if Docked then
    DockedTo.ArrangeToolbars;
end;

procedure TppCustomToolWindow97.SetDockRow (Value: Integer);
begin
  FDockRow := Value;
  if Docked then
    DockedTo.ArrangeToolbars;
end;

procedure TppCustomToolWindow97.SetResizable (Value: Boolean);
begin
  if FResizable <> Value then begin
    FResizable := Value;
    if not Docked then begin
      { Recalculate the non-client area }
      SetWindowPos (Handle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED or
        SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);
      { The VCL does not automatically realign child controls when the
        non-client size changes, so do it manually }
      Realign;
    end;
  end;
end;


{ TppToolbar97 }

constructor TppToolbar97.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  GroupInfo := TList.Create;
  SlaveInfo := TList.Create;
  LineSeps := TList.Create;
  OrderList := TList.Create;
  { There hasn't been any child controls added yet, but call ArrangeControls
    to initialize the toolbar's size }
  ArrangeControls;
end;

destructor TppToolbar97.Destroy;
var
  I: Integer;
begin
  OrderList.Free;
  LineSeps.Free;
  if Assigned(SlaveInfo) then begin
    for I := SlaveInfo.Count-1 downto 0 do

{$IFDEF WIN32}     {DIGIMETA}
      FreeMem (SlaveInfo.Items[I]);
{$ELSE}
      FreeMem (SlaveInfo.Items[I], SizeOf(TppSlaveInfo));
{$ENDIF}

    SlaveInfo.Free;
  end;
  FreeGroupInfo (GroupInfo);
  GroupInfo.Free;
  inherited Destroy;
end;

procedure TppToolbar97.ReadPositionData (const ReadIntProc: TppPositionReadIntProc;
  const ReadStringProc: TppPositionReadStringProc; const ExtraData: Pointer);
begin
  inherited ReadPositionData(ReadIntProc,  ReadStringProc, ExtraData);
  FFloatingRightX := ReadIntProc(Name, rvFloatRightX, 0, ExtraData);
end;

procedure TppToolbar97.WritePositionData (const WriteIntProc: TppPositionWriteIntProc;
  const WriteStringProc: TppPositionWriteStringProc; const ExtraData: Pointer);
begin
  inherited WritePositionData (WriteIntProc, WriteStringProc, ExtraData);
  WriteIntProc (Name, rvFloatRightX, FFloatingRightX, ExtraData);
end;

procedure TppToolbar97.GetMinimumSize (var AClientWidth, AClientHeight: Integer);
begin
  AClientWidth := 0;
  AClientHeight := 0;
end;

function CompareControls (const Item1, Item2, ExtraData: Pointer): Integer; far;
begin
  with PCompareExtra(ExtraData)^ do
    if ComparePositions then begin
      if CurDockType <> ppdtLeftRight then
        Result := TControl(Item1).Left - TControl(Item2).Left
      else
        Result := TControl(Item1).Top - TControl(Item2).Top;
    end
    else
      with Toolbar.OrderList do
        Result := IndexOf(Item1) - IndexOf(Item2);
end;

procedure TppToolbar97.InitializeOrdering;
var
  Extra: TCompareExtra;
begin
  inherited InitializeOrdering;
  { Initialize order of items in OrderList }
  if not(csDesigning in ComponentState) then begin
    with Extra do begin
      Toolbar := Self;
      ComparePositions := True;
      CurDockType := ppGetDockTypeOf(DockedTo);
    end;
    ListSortEx (OrderList, CompareControls, @Extra);
  end;
end;

procedure TppToolbar97.GetBarSize (var ASize: Integer; const DockType: TppDockType);
var
  I: Integer;
begin
  ASize := DefaultBarWidthHeight;
  for I := 0 to ControlCount-1 do 
    if not(Controls[I] is TppToolbarSep97) then
      with Controls[I] do begin
        if ShouldBeVisible(Controls[I], DockType = ppdtLeftRight, False) then begin
          if DockType = ppdtLeftRight then begin
            if Width > ASize then ASize := Width;
          end
          else begin
            if Height > ASize then ASize := Height;
          end;
        end;
      end;
end;

procedure TppToolbar97.GetResizeCaps (var Caps: TppToolWindowResizeCaps);
begin
  inherited GetResizeCaps(Caps);
  Caps.EightCorner := False;
  Caps.ClipCursor := False;
end;

procedure TppToolbar97.Paint;
var
  S: Integer;
begin
  inherited Paint;
  { Long separators when not docked }
  if not Docked then
    for S := 0 to LineSeps.Count-1 do begin
{$IFDEF WIN32}      {DIGIMETA}
      with TppLineSep(LineSeps[S]) do begin
{$ELSE}
      with TppLineSep(LineSeps[S]^) do begin
{$ENDIF}
        if Blank then Continue;
        Canvas.Pen.Color := clBtnShadow;
        Canvas.MoveTo (1, Y-4);  Canvas.LineTo (ClientWidth-1, Y-4);
        Canvas.Pen.Color := clBtnHighlight;
        Canvas.MoveTo (1, Y-3);  Canvas.LineTo (ClientWidth-1, Y-3);
      end;
    end;
end;

function TppToolbar97.ShouldBeVisible (const Control: TControl;
  const LeftOrRight: Boolean; const SetIt: Boolean): Boolean;
{ If Control is a master or slave control, it returns the appropriate visibility
  setting based on the value of LeftOrRight, otherwise it simply returns the
  current Visible setting. If SetIt is True, it automatically adjusts the
  Visible properties of both the master and slave control. }
var
  I: Integer;
begin
  for I := 0 to SlaveInfo.Count-1 do
    with PppSlaveInfo(SlaveInfo[I])^ do
      if TopBottom = Control then begin
        Result := not LeftOrRight;
        if SetIt then begin
          TopBottom.Visible := Result;
          LeftRight.Visible := not Result;
        end;
        Exit;
      end
      else
      if LeftRight = Control then begin
        Result := LeftOrRight;
        if SetIt then begin
          TopBottom.Visible := not Result;
          LeftRight.Visible := Result;
        end;
        Exit;
      end;
  Result := Control.Visible;
end;

procedure TppToolbar97.FreeGroupInfo (const List: TList);
var
  I: Integer;
  L: PppGroupInfo;
begin
  if List = nil then Exit;
  for I := List.Count-1 downto 0 do begin
    L := List.Items[I];
    if Assigned(L) then begin
      L^.Members.Free;
{$IFDEF WIN32}
      FreeMem (L);
{$ELSE}
      FreeMem(L, SizeOf(TppGroupInfo));
{$ENDIF}

    end;
    List.Delete (I);
  end;
end;

procedure TppToolbar97.BuildGroupInfo (const List: TList;
  const TranslateSlave: Boolean; const OldDockType, NewDockType: TppDockType);
var
  I: Integer;
  GI: PppGroupInfo;
  Children: TList; {items casted into TControls}
  NewGroup: Boolean;
  Extra: TCompareExtra;
begin
  FreeGroupInfo (List);
  if ControlCount = 0 then Exit;

  Children := TList.Create;
  try
    for I := 0 to ControlCount-1 do
      if (not TranslateSlave and Controls[I].Visible) or
         (TranslateSlave and ShouldBeVisible(Controls[I], NewDockType = ppdtLeftRight, False)) then
        Children.Add (Controls[I]);

    with Extra do begin
      Toolbar := Self;
      CurDockType := OldDockType;
    end;
    if csDesigning in ComponentState then begin
      Extra.ComparePositions := True;
      ListSortEx (OrderList, CompareControls, @Extra);
    end;
    Extra.ComparePositions := csDesigning in ComponentState;
    ListSortEx (Children, CompareControls, @Extra);

    GI := nil;
    NewGroup := True;         
    for I := 0 to Children.Count-1 do begin
      if NewGroup then begin
        NewGroup := False;
        List.Add (AllocMem(SizeOf(TppGroupInfo)));
        { Note: AllocMem initializes the newly allocated data to zero }
        GI := List.Last;
        GI^.Members := TList.Create;
      end;
      GI^.Members.Add (Children[I]);
      if TControl(Children[I]) is TppToolbarSep97 then
        NewGroup := True
      else begin
        with TControl(Children[I]) do begin
          Inc (GI^.GroupWidth, Width);
          Inc (GI^.GroupHeight, Height);
        end;
      end;
    end;
  finally
    Children.Free;
  end;
end;

procedure TppToolbar97.OrderControls (const CanMoveControls: Boolean;
  const WasDockedTo, DockingTo: TppDock97; var NewClientSize: TPoint);
{ This arranges the controls on the toolbar }
var
  OldDockType, NewDockType: TppDockType;
  NewDocked: Boolean;
  RightX, I: Integer;
  CurBarSize, DockRowSize: Integer;
  GInfo: TList;
  AllowWrap: Boolean;
  BarPosSize, MinPosPixels, MinRowPixels, CurPosPixel, CurLinePixel, G: Integer;
  NewLine, Prec1Line: Boolean;
  GI: PppGroupInfo;
  Member: TControl;
  MemberIsSep: Boolean;
  GroupPosSize, MemberPosSize: Integer;
  PreviousSep: TppToolbarSep97;  PrevMinPosPixels: Integer;
  NewLineSep: TppLineSep;
label 1;
begin
  OldDockType := ppGetDockTypeOf(WasDockedTo);
  NewDockType := ppGetDockTypeOf(DockingTo);
  NewDocked := Assigned(DockingTo);

  RightX := FFloatingRightX;
  if (NewDockType <> ppdtNotDocked) or (RightX = 0) then
    RightX := High(RightX)
  else begin
    { Make sure RightX isn't less than the smallest sized control + margins,
      in case one of the *LoadToolbarPositions functions happened to read
      a value too small. }
    for I := 0 to ControlCount-1 do
      if not(Controls[I] is TppToolbarSep97) then
        with Controls[I] do
          if Width + (LeftMarginNotDocked+RightMarginNotDocked) > RightX then
            RightX := Width + (LeftMarginNotDocked+RightMarginNotDocked);
  end;

  if CanMoveControls then
    for I := 0 to ControlCount-1 do
      if not(Controls[I] is TppToolbarSep97) then
        ShouldBeVisible (Controls[I], NewDockType = ppdtLeftRight, True);

  GetBarSize (CurBarSize, NewDockType);
  DockRowSize := CurBarSize;
  if (DockingTo <> nil) and (DockingTo = DockedTo) then
    GetDockRowSize (DockRowSize);

  if CanMoveControls then
    GInfo := GroupInfo
  else
    GInfo := TList.Create;
  try
    BuildGroupInfo (GInfo, not CanMoveControls, OldDockType, NewDockType);

    if CanMoveControls then
      LineSeps.Clear;

    AllowWrap := not NewDocked;
    if GInfo.Count <> 0 then begin
      BarPosSize := CurBarSize;
      MinPosPixels := 0;
      CurPosPixel := 0;
      CurLinePixel := TopMargin[NewDocked];
      Prec1Line := True;  NewLine := True;
      PreviousSep := nil;  PrevMinPosPixels := 0;
      for G := 0 to GInfo.Count-1 do begin
        GI := PppGroupInfo(GInfo[G]);

        if NewDockType <> ppdtLeftRight then
          GroupPosSize := GI^.GroupWidth
        else
          GroupPosSize := GI^.GroupHeight;
        if (not AllowWrap) or (Prec1Line) then begin
          if NewLine then begin
            NewLine := False;
            Inc (CurPosPixel, LeftMargin[NewDocked])
          end;
          if CurPosPixel+GroupPosSize+RightMargin[NewDocked] > RightX then
            goto 1;  { I know it's sloppy to use a goto. But it's fast }
          if CurPosPixel > MinPosPixels then MinPosPixels := CurPosPixel;
        end
        else begin
        1:CurPosPixel := LeftMargin[NewDocked];
          if CurPosPixel > MinPosPixels then MinPosPixels := CurPosPixel;
          if (G <> 0) and (PppGroupInfo(GInfo[G-1])^.Members.Count <> 0) then begin
            Inc (CurLinePixel, BarPosSize+LineSpacing);
            if Assigned(PreviousSep) then begin
              MinPosPixels := PrevMinPosPixels;
              if CanMoveControls then begin
                PreviousSep.Width := 0;

                LongInt(NewLineSep) := 0;
                NewLineSep.Y := CurLinePixel;
                NewLineSep.Blank := PreviousSep.Blank;
                LineSeps.Add (Pointer(NewLineSep));
              end;
            end;
          end;
        end;
        Prec1Line := True;
        for I := 0 to GI^.Members.Count-1 do begin
          Member := TControl(GI^.Members[I]);
          MemberIsSep := Member is TppToolbarSep97;
          with Member do begin
            if not MemberIsSep then begin
              if NewDockType <> ppdtLeftRight then
                MemberPosSize := Width
              else
                MemberPosSize := Height;
            end
            else begin
              if NewDockType <> ppdtLeftRight then
                MemberPosSize := TppToolbarSep97(Member).SizeHorz
              else
                MemberPosSize := TppToolbarSep97(Member).SizeVert;
            end;
            { If RightX is passed, proceed to next line }
            if not MemberIsSep and
               (CurPosPixel+MemberPosSize+RightMargin[NewDocked] > RightX) then begin
              CurPosPixel := LeftMargin[NewDocked];
              if CurPosPixel > MinPosPixels then MinPosPixels := CurPosPixel;
              Inc (CurLinePixel, CurBarSize);
              Prec1Line := False;
            end;
            if NewDockType <> ppdtLeftRight then begin
              if not MemberIsSep then begin
                if CanMoveControls then
                  SetBounds (CurPosPixel, CurLinePixel+((DockRowSize-Height) div 2), Width, Height);
                Inc (CurPosPixel, Width);
              end
              else begin
                if CanMoveControls then
                  SetBounds (CurPosPixel, CurLinePixel, TppToolbarSep97(Member).SizeHorz, DockRowSize);
                Inc (CurPosPixel, TppToolbarSep97(Member).SizeHorz);
              end;
            end
            else begin
              if not MemberIsSep then begin
                if CanMoveControls then
                  SetBounds (CurLinePixel+((DockRowSize-Width) div 2), CurPosPixel, Width, Height);
                Inc (CurPosPixel, Height);
              end
              else begin
                if CanMoveControls then
                  SetBounds (CurLinePixel, CurPosPixel, DockRowSize, TppToolbarSep97(Member).SizeVert);
                Inc (CurPosPixel, TppToolbarSep97(Member).SizeVert);
              end;
            end;
            PrevMinPosPixels := MinPosPixels;
            if not MemberIsSep then
              PreviousSep := nil
            else
              PreviousSep := TppToolbarSep97(Member);
            if CurPosPixel > MinPosPixels then MinPosPixels := CurPosPixel;
          end;
        end;
      end;
    end
    else begin
      if Docked then begin
        MinPosPixels := LeftMargin[NewDocked];
        CurLinePixel := TopMargin[NewDocked];
        Inc (MinPosPixels, DefaultBarWidthHeight);
        BarPosSize := DockedTo.GetRowSize(FDockRow, Self);
      end
      else begin
        MinPosPixels := LeftMargin[NewDocked] + DefaultBarWidthHeight;
        CurLinePixel := TopMargin[NewDocked];
        BarPosSize := DefaultBarWidthHeight;
      end;
    end;

    if csDesigning in ComponentState then
      Invalidate;
  finally
    if not CanMoveControls then begin
      FreeGroupInfo (GInfo);
      GInfo.Free;
    end;
  end;

  Inc (MinPosPixels, RightMargin[NewDocked]);
  MinRowPixels := CurLinePixel + BarPosSize + BottomMargin[NewDocked];
  if NewDockType <> ppdtLeftRight then begin
    NewClientSize.X := MinPosPixels;
    NewClientSize.Y := MinRowPixels;
  end
  else begin
    NewClientSize.X := MinRowPixels;
    NewClientSize.Y := MinPosPixels;
  end;
end;


{$IFDEF WIN32}
procedure TppToolbar97.CMControlListChange (var Message: TCMControlListChange);
{ The VCL sends this message is sent whenever a child control is inserted into
  or deleted from the toolbar }
var
  I: Integer;
begin
  inherited;
  with Message, OrderList do begin
    { Delete any previous occurances of Control in OrderList. There shouldn't
      be any if Inserting=True, but just to be safe, check anyway. }
    while True do begin
      I := IndexOf(Control);
      if I = -1 then Break;
      Delete (I);
    end;
    if Inserting then
      Add (Control);
  end;
end;

{$ELSE}   {note a Delphi 1 message, so we added it}


{note a Delphi 1 message}

procedure TppToolbar97.CMControlListChange (var Message: TMessage);
{DIGIMETA - for Delphi 1 this is called from the Child's SetParent}
var
  liControl: Integer;
  lControl: TControl;
  lbInserting: Boolean;

begin

  lbInserting := (Message.WParam > 0);
  lControl := TControl(Message.LParam);

  { Delete any previous occurances of Control in OrderList. There shouldn't
    be any if Inserting=True, but just to be safe, check anyway. }

  while True do begin
    liControl := OrderList.IndexOf(lControl);
    if liControl = -1 then Break;
    OrderList.Delete(liControl);
  end;

  if lbInserting then
    OrderList.Add(lControl);

  inherited;

end;


{$ENDIF}

function CompareNewSizes (const Item1, Item2, ExtraData: Pointer): Integer; far;
begin
  { Sorts in descending order }
  if ExtraData = nil then
    Result := TSmallPoint(Item2).X - TSmallPoint(Item1).X
  else
    Result := TSmallPoint(Item2).Y - TSmallPoint(Item1).Y;
end;

procedure TppToolbar97.ResizeBegin (HitTestValue: Integer);
var
  CurBarSize: Integer;

  procedure BuildNewSizes (const YOrdering: Boolean);
  { Adds items to the NewSizes list. The list must be empty when this is called }
    function AddNCAreaToSize (const P: TPoint): TPoint;
    var
      R: TRect;
    begin
      with R do begin
        Top := 0;  Left := 0;
        BottomRight := P;
      end;
      ppAddFloatingNCAreaToRect (R, Resizable);
      OffsetRect (R, -R.Left, -R.Top);
      Result := R.BottomRight;
    end;
  var
    SaveFloatingRightX: Integer;
    Max, X, LastY, SkipTo: Integer;
    S: TPoint;
    S2: TSmallPoint;
  begin
    with PppToolbar97SizeData(SizeData)^ do begin
      SaveFloatingRightX := FFloatingRightX;
      try
        FFloatingRightX := 0;
        CustomArrangeControls (ppatNone, nil, nil, S);

{$IFDEF WIN32} {DIGIMETA}
        S2 := PointToSmallPoint(AddNCAreaToSize(S));
{$ELSE}
        S2 := AddNCAreaToSize(S);
        S2 := PointToSmallPoint(S2);
{$ENDIF}

        NewSizes.Add (Pointer(S2));
        LastY := S.Y;
        Max := S.X;
        SkipTo := High(SkipTo);
        for X := Max-1 downto LeftMarginNotDocked+CurBarSize+RightMarginNotDocked do begin
          if X > SkipTo then Continue;
          FFloatingRightX := X;
          CustomArrangeControls (ppatNone, nil, nil, S);
          if X = S.X then begin
            if S.Y = LastY then
              NewSizes.Delete (NewSizes.Count-1);
{$IFDEF WIN32} {DIGIMETA}
            S2 := PointToSmallPoint(AddNCAreaToSize(S));
{$ELSE}
            S2 := AddNCAreaToSize(S);
            S2 := PointToSmallPoint(S2);
{$ENDIF}

            if NewSizes.IndexOf(Pointer(S2)) = -1 then
              NewSizes.Add (Pointer(S2));
            LastY := S.Y;
          end
          else
            SkipTo := S.X;
        end;
      finally
        FFloatingRightX := SaveFloatingRightX;
      end;
      ListSortEx (NewSizes, CompareNewSizes, Pointer(Longint(YOrdering)));
    end;
  end;
const
  MaxSizeSens = 12;
var
  I, NewSize: Integer;
  S, N: TSmallPoint;
begin
  inherited ResizeBegin(HitTestValue);

  SizeData := AllocMem(SizeOf(TppToolbar97SizeData));

  with PppToolbar97SizeData(SizeData)^ do begin
    HitTest := HitTestValue;
    CurRightX := FFloatingRightX;
    DisableSensCheck := False;
    OpSide := False;
    GetBarSize (CurBarSize, ppdtNotDocked);
    NewSizes := TList.Create;

    BuildNewSizes (HitTestValue in [HTTOP, HTBOTTOM]);

    SizeSens := MaxSizeSens;
    { Adjust sensitivity if it's too high }
    for I := 0 to NewSizes.Count-1 do begin
      Pointer(S) := NewSizes[I];
      if (S.X = Width) and (S.Y = Height) then begin
        if I > 0 then begin
          Pointer(N) := NewSizes[I-1];
          if HitTestValue in [HTLEFT, HTRIGHT] then
            NewSize := N.X - S.X - 1
          else
            NewSize := N.Y - S.Y - 1;
          if NewSize < SizeSens then SizeSens := NewSize;
        end;
        if I < NewSizes.Count-1 then begin
          Pointer(N) := NewSizes[I+1];
          if HitTestValue in [HTLEFT, HTRIGHT] then
            NewSize := S.X - N.X - 1
          else
            NewSize := S.Y - N.Y - 1;
          if NewSize < SizeSens then SizeSens := NewSize;
        end;
        Break;
      end;
    end;
    if SizeSens < 0 then SizeSens := 0;
  end;
end;

procedure TppToolbar97.ResizeTrack (var Rect: TRect; const OrigRect: TRect);
var
  Pos: TPoint;
  NCXDiff: Integer;
  NewOpSide: Boolean;
  Reverse: Boolean;
  I: Integer;
  P: TSmallPoint;
begin
  inherited ResizeTrack (Rect, OrigRect);

  with PppToolbar97SizeData(SizeData)^ do begin
    GetCursorPos (Pos);

    NCXDiff := ClientToScreen(Point(0, 0)).X - Left;
    Dec (Pos.X, Left);  Dec (Pos.Y, Top);
    if HitTest = HTLEFT then
      Pos.X := Width-Pos.X
    else
    if HitTest = HTTOP then
      Pos.Y := Height-Pos.Y;

    { Adjust Pos to make up for the "sizing sensitivity", as seen in Office 97 }
    if HitTest in [HTLEFT, HTRIGHT] then
      NewOpSide := Pos.X < Width
    else
      NewOpSide := Pos.Y < Height;
    if (not DisableSensCheck) or (OpSide <> NewOpSide) then begin
      DisableSensCheck := False;
      OpSide := NewOpSide;
      if HitTest in [HTLEFT, HTRIGHT] then begin
        if (Pos.X >= Width-SizeSens) and (Pos.X < Width+SizeSens) then
          Pos.X := Width;
      end
      else begin
        if (Pos.Y >= Height-SizeSens) and (Pos.Y < Height+SizeSens) then
          Pos.Y := Height;
      end;
    end;

    Rect := OrigRect;

    if HitTest in [HTLEFT, HTRIGHT] then
      Reverse := Pos.X > Width
    else
      Reverse := Pos.Y > Height;
    if not Reverse then
      I := NewSizes.Count-1
    else
      I := 0;
    while True do begin
      if (not Reverse and (I < 0)) or
         (Reverse and (I >= NewSizes.Count)) then
        Break;
      Pointer(P) := NewSizes[I];
      if HitTest in [HTLEFT, HTRIGHT] then begin
        if (not Reverse and ((I = NewSizes.Count-1) or (Pos.X >= P.X))) or
           (Reverse and ((I = 0) or (Pos.X < P.X))) then begin
          if I = 0 then
            CurRightX := 0
          else
            CurRightX := P.X - NCXDiff*2;
          if HitTest = HTRIGHT then
            Rect.Right := Rect.Left + P.X
          else
            Rect.Left := Rect.Right - P.X;
          Rect.Bottom := Rect.Top + P.Y;
          DisableSensCheck := not EqualRect(Rect, OrigRect);
        end;
      end
      else begin
        if (not Reverse and ((I = NewSizes.Count-1) or (Pos.Y >= P.Y))) or
           (Reverse and ((I = 0) or (Pos.Y < P.Y))) then begin
          if I = NewSizes.Count-1 then
            CurRightX := 0
          else
            CurRightX := P.X - NCXDiff*2;
          if HitTest = HTBOTTOM then
            Rect.Bottom := Rect.Top + P.Y
          else
            Rect.Top := Rect.Bottom - P.Y;
          Rect.Right := Rect.Left + P.X;
          DisableSensCheck := not EqualRect(Rect, OrigRect);
        end;
      end;
      if not Reverse then
        Dec (I)
      else
        Inc (I);
    end;
  end;
end;

procedure TppToolbar97.ResizeEnd (Accept: Boolean);
begin
  inherited ResizeEnd(Accept);

  if Assigned(SizeData) then begin
    with PppToolbar97SizeData(SizeData)^ do begin
      if Accept then
        FFloatingRightX := CurRightX;
      NewSizes.Free;
    end;
{$IFDEF WIN32}       {DIGIMETA}
    FreeMem (SizeData);
{$ELSE}
    FreeMem (SizeData, SizeOf(TppToolbar97SizeData));
{$ENDIF}
  end;
end;

function TppToolbar97.GetOrderIndex (Control: TControl): Integer;
begin
  Result := OrderList.IndexOf(Control);
  if Result = -1 then
    raise EInvalidOperation.Create(STB97ToolbarControlNotChildOfToolbar);
end;

procedure TppToolbar97.SetOrderIndex (Control: TControl; Value: Integer);
var
  OldIndex: Integer;
begin
  with OrderList do begin
    OldIndex := IndexOf(Control);
    if OldIndex = -1 then
      raise EInvalidOperation.Create(STB97ToolbarControlNotChildOfToolbar);
    if Value < 0 then Value := 0;
    if Value >= Count then Value := Count-1;
    if Value <> OldIndex then begin
      Delete (OldIndex);
      Insert (Value, Control);
      ArrangeControls;
    end;
  end;
end;

procedure TppToolbar97.SetSlaveControl (const ATopBottom, ALeftRight: TControl);
var
  NewVersion: PppSlaveInfo;
begin
  GetMem (NewVersion, SizeOf(TppSlaveInfo));
  with NewVersion^ do begin
    TopBottom := ATopBottom;
    LeftRight := ALeftRight;
  end;
  SlaveInfo.Add (NewVersion);
  ArrangeControls;
end;


{ TDockableWindow - internal }

constructor TppToolWindow97.Create (AOwner: TComponent);
var
  R: TRect;
begin
  inherited Create (AOwner);
  FMinClientWidth := 32;
  FMinClientHeight := 32;
  { Initialize the client size to 32x32 }
{$IFDEF WIN32}    {DIGIMETA - removed for D1 - causing tearaway palettes to flash}
  R := GetClientRect;
  SetBounds (Left, Top, Width - R.Right + 32, Height - R.Bottom + 32);
{$ENDIF}
end;

procedure TppToolWindow97.CreateParams (var Params: TCreateParams);
begin

  inherited CreateParams(Params);

  { Disable complete redraws when size changes. CS_H/VREDRAW cause flicker
    and are not necessary for this control at run time }
  if not(csDesigning in ComponentState) then
    with Params.WindowClass do
      Style := Style and not(CS_HREDRAW or CS_VREDRAW);
end;

procedure TppToolWindow97.ReadPositionData (const ReadIntProc: TppPositionReadIntProc;
  const ReadStringProc: TppPositionReadStringProc; const ExtraData: Pointer);
begin
  inherited ReadPositionData(ReadIntProc, ReadStringProc, ExtraData);
  { Restore FBarWidth/FBarHeight variables }
  if Resizable then begin
    FBarWidth := ReadIntProc(Name, rvClientWidth, FBarWidth, ExtraData);
    FBarHeight := ReadIntProc(Name, rvClientHeight, FBarHeight, ExtraData);
  end;
end;

procedure TppToolWindow97.WritePositionData (const WriteIntProc: TppPositionWriteIntProc;
  const WriteStringProc: TppPositionWriteStringProc; const ExtraData: Pointer);
begin

  inherited WritePositionData (WriteIntProc, WriteStringProc, ExtraData);

  { Write values of FBarWidth/FBarHeight }
  WriteIntProc (Name, rvClientWidth, FBarWidth, ExtraData);
  WriteIntProc (Name, rvClientHeight, FBarHeight, ExtraData);
end;

procedure TppToolWindow97.GetMinimumSize (var AClientWidth, AClientHeight: Integer);
begin
  AClientWidth := FMinClientWidth;
  AClientHeight := FMinClientHeight;
end;

procedure TppToolWindow97.SizeChanging (const AWidth, AHeight: Integer);
begin
  FBarWidth := AWidth - (Width-ClientWidth);
  FBarHeight := AHeight - (Height-ClientHeight);
end;

procedure TppToolWindow97.GetBarSize (var ASize: Integer; const DockType: TppDockType);
begin
  if DockType <> ppdtLeftRight then
    ASize := FBarHeight
  else
    ASize := FBarWidth;
end;

procedure TppToolWindow97.OrderControls (const CanMoveControls: Boolean;
  const WasDockedTo, DockingTo: TppDock97; var NewClientSize: TPoint);
begin

  NewClientSize.X := FBarWidth;
  NewClientSize.Y := FBarHeight;
end;


{ TppToolbarSep97 - internal }

constructor TppToolbarSep97.Create (AOwner: TComponent);
begin
  inherited Create (aOwner);
  FSizeHorz := 6;
  FSizeVert := 6;
  ControlStyle := ControlStyle - [csOpaque, csCaptureMouse];
end;

{$IFDEF WIN32}

procedure TppToolbarSep97.SetParent (AParent: TWinControl);
begin

  if (AParent <> nil) and not(AParent is TppToolbar97) then
    raise EInvalidOperation.Create(STB97SepParentNotAllowed);

  inherited SetParent(aParent);

end;

{$ELSE}

procedure TppToolbarSep97.SetParent (AParent: TWinControl);
var
  lOldParent: TWinControl;

begin

  lOldParent := Parent;

  if (AParent <> nil) and not(AParent is TppToolbar97) then
    raise EInvalidOperation.Create(STB97SepParentNotAllowed);

  inherited SetParent(aParent);

  if lOldParent <> nil then
    lOldParent.Perform(CM_CONTROLLISTCHANGE, 0, Longint(Self));

  if Parent <> nil then
    Parent.Perform(CM_CONTROLLISTCHANGE, 1, Longint(Self));

end;

{$ENDIF}

procedure TppToolbarSep97.SetBlank (Value: Boolean);
begin
  if FBlank <> Value then begin
    FBlank := Value;
    Invalidate;
  end;
end;

procedure TppToolbarSep97.SetSizeHorz (Value: TppToolbarSepSize);
begin
  if FSizeHorz <> Value then begin
    FSizeHorz := Value;
    if Parent is TppToolbar97 then
      TppToolbar97(Parent).ArrangeControls;
  end;
end;

procedure TppToolbarSep97.SetSizeVert (Value: TppToolbarSepSize);
begin
  if FSizeVert <> Value then begin
    FSizeVert := Value;
    if Parent is TppToolbar97 then
      TppToolbar97(Parent).ArrangeControls;
  end;
end;

procedure TppToolbarSep97.Paint;
var
  R: TRect;
  Z: Integer;
begin
  inherited Paint;
  if not(Parent is TppToolbar97) then Exit;

  with Canvas do begin
    { Draw dotted border in design mode }
    if csDesigning in ComponentState then begin
      Pen.Style := psDot;
      Pen.Color := clBtnShadow;
      Brush.Style := bsClear;
      R := ClientRect;
      Rectangle (R.Left, R.Top, R.Right, R.Bottom);
      Pen.Style := psSolid;
    end;

    if not FBlank then
      if ppGetDockTypeOf(TppToolbar97(Parent).DockedTo) <> ppdtLeftRight then begin
        Z := Width div 2;
        Pen.Color := clBtnShadow;
        MoveTo (Z-1, 0);  LineTo (Z-1, Height);
        Pen.Color := clBtnHighlight;
        MoveTo (Z, 0);  LineTo (Z, Height);
      end
      else begin
        Z := Height div 2;
        Pen.Color := clBtnShadow;
        MoveTo (0, Z-1);  LineTo (Width, Z-1);
        Pen.Color := clBtnHighlight;
        MoveTo (0, Z);  LineTo (Width, Z);
      end;
  end;
end;

procedure TppToolbarSep97.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin

  inherited MouseDown(Button, Shift, X, Y);

  if not(Parent is TppToolbar97) then Exit;

  { Relay the message to the parent toolbar }
  P := Parent.ScreenToClient(ClientToScreen(Point(X, Y)));
  TppToolbar97(Parent).MouseDown (Button, Shift, P.X, P.Y);
end;


{ TppToolbarButton97 - internal }

var
  Pattern: TBitmap {$IFDEF WIN32} = nil {$ENDIF};
  PatternBtnFace, PatternBtnHighlight: TColor;
  ButtonCount: Integer {$IFDEF WIN32} = 0 {$ENDIF};


procedure CreateBrushPattern;
var
  X, Y: Integer;
begin
  PatternBtnFace := GetSysColor(COLOR_BTNFACE);
  PatternBtnHighlight := GetSysColor(COLOR_BTNHIGHLIGHT);
  Pattern := TBitmap.Create;
  with Pattern do begin
    Width := 8;
    Height := 8;
    with Canvas do begin
      Brush.Style := bsSolid;
      Brush.Color := clBtnFace;
      FillRect (Rect(0, 0, Width, Height));
      for Y := 0 to 7 do
        for X := 0 to 7 do
          if Odd(Y) = Odd(X) then  { toggles between even/odd pixels }
            Pixels[X, Y] := clBtnHighlight;     { on even/odd rows }
    end;
  end;
end;




{ TDropdownList }

type
  TDropdownList = class(TComponent)
  private
    List: TList;
    Window: HWND;
    procedure WndProc (var Message: TMessage);
  protected
    procedure Notification (AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddMenu (Menu: TPopupMenu);
  end;
var
  DropdownList: TDropdownList;

constructor TDropdownList.Create (AOwner: TComponent);
begin
  inherited Create (aOwner);
  List := TList.Create;
end;

destructor TDropdownList.Destroy;
begin
  List.Free;
  inherited Destroy;
end;

procedure TDropdownList.WndProc (var Message: TMessage);
{ This procedure is based on code from TPopupList.WndProc (menus.pas) }
var
  I: Integer;
  MenuItem: TMenuItem;
  FindKind: TFindItemKind;
  ContextID: Integer;
begin
  try
    with List do
      case Message.Msg of
        WM_COMMAND:
          for I := 0 to Count-1 do
            if TPopupMenu(Items[I]).DispatchCommand(TWMCommand(Message).ItemID) then
              Exit;
        WM_INITMENUPOPUP:
          for I := 0 to Count-1 do
            if TPopupMenu(Items[I]).DispatchPopup(TWMInitMenuPopup(Message).MenuPopup) then
              Exit;
        WM_MENUSELECT:
          with TWMMenuSelect(Message) do begin
            FindKind := fkCommand;
            if MenuFlag and MF_POPUP <> 0 then
              FindKind := fkHandle;
            for I := 0 to Count-1 do begin
              MenuItem := TPopupMenu(Items[I]).FindItem(IDItem, FindKind);
              if MenuItem <> nil then begin
                Application.Hint := MenuItem.Hint;
                Exit;
              end;
            end;
            Application.Hint := '';
          end;
{$IFDEF WIN32}     {DIGIMETA}
        WM_HELP:
          with TWMHelp(Message).HelpInfo^ do begin
            for I := 0 to Count-1 do
              if TPopupMenu(Items[I]).Handle = hItemHandle then begin
                ContextID := TPopupMenu(Items[I]).GetHelpContext(iCtrlID, True);
                if ContextID = 0 then
                  ContextID := TPopupMenu(Items[I]).GetHelpContext(hItemHandle, False);
                if Screen.ActiveForm = nil then Exit;
                if (biHelp in Screen.ActiveForm.BorderIcons) then
                  Application.HelpCommand (HELP_CONTEXTPOPUP, ContextID)
                else
                  Application.HelpContext (ContextID);
                Exit;
              end;
          end;
{$ENDIF}
      end;
    with Message do
      Result := DefWindowProc(Window, Msg, wParam, lParam);
  except
    Application.HandleException (Self);
  end;
end;

procedure TDropdownList.AddMenu (Menu: TPopupMenu);
begin
  if List.IndexOf(Menu) = -1 then begin
    if List.Count = 0 then
      Window := AllocateHWnd(WndProc);
{$IFDEF WIN32}    {DIGIMETA}
    Menu.FreeNotification (DropdownList);
{$ENDIF}
    List.Add (Menu);
  end;
end;

procedure TDropdownList.Notification (AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(aComponent, Operation) ;
  if Operation = opRemove then begin
    List.Remove (AComponent);
    if List.Count = 0 then
      DeallocateHWnd (Window);
  end;
end;


{ TppToolbarButton97 }

constructor TppToolbarButton97.Create (AOwner: TComponent);
begin
  inherited Create (aOwner);

{$IFDEF WIN32}
  if not(csDesigning in ComponentState) then begin
    if ButtonHookRefCount = 0 then
      Application.HookMainWindow (TppToolbarButton97.DeactivateHook);
    Inc (ButtonHookRefCount);
    FHooked := True;
  end;
{$ENDIF}

  SetBounds (Left, Top, 23, 22);
  ControlStyle := [csCaptureMouse, csDoubleClicks, csOpaque];
  FGlyph := TppButtonGlyph.Create;
  TppButtonGlyph(FGlyph).OnChange := GlyphChanged;
  ParentFont := True;
  FFlat := True;
  FOpaque := True;
  FSpacing := 4;
  FMargin := -1;
  FLayout := blGlyphLeft;
  FDropdownArrow := True;
  Inc (ButtonCount);
end;

destructor TppToolbarButton97.Destroy;
begin
  if ButtonMouseInControl = Self then begin
    ButtonMouseTimer.Enabled := False;
    ButtonMouseInControl := nil;
  end;
  TppButtonGlyph(FGlyph).Free;
  Dec (ButtonCount);
  if ButtonCount = 0 then begin
    Pattern.Free;
    Pattern := nil;
  end;

{$IFDEF WIN32}
  if FHooked then begin
    Dec (ButtonHookRefCount);
    if ButtonHookRefCount = 0 then
      Application.UnhookMainWindow (TppToolbarButton97.DeactivateHook);
  end;
{$ENDIF}

  inherited Destroy;
end;

{$IFDEF WINDOWS}  {DIGIMETA}

procedure TppToolbarButton97.SetParent (AParent: TWinControl);
var
  lOldParent: TWinControl;
begin

  lOldParent := Parent;

  inherited SetParent(aParent);

  if (lOldParent <> nil) then
    lOldParent.Perform(CM_CONTROLLISTCHANGE, 0, Longint(Self));

  if Parent <> nil then
    Parent.Perform(CM_CONTROLLISTCHANGE, 1, Longint(Self));

end;

{$ENDIF}


procedure TppToolbarButton97.Paint;
const
{$IFDEF WIN32}     {DIGITMETA}
  EdgeStyles: array[Boolean, Boolean] of UINT = (
    (EDGE_RAISED, EDGE_SUNKEN),
    (BDR_RAISEDINNER, BDR_SUNKENOUTER));
  FlagStyles: array[Boolean] of UINT = (BF_RECT or BF_SOFT or BF_MIDDLE, BF_RECT);
{$ELSE}
  Color1Styles: array[Boolean] of TColor = (clBtnHighlight, clBtnShadow);
  Color2Styles: array[Boolean] of TColor = (clBtnShadow, clBtnHighlight);
{$ENDIF}

var
  Bmp: TBitmap;
  DrawCanvas: TCanvas;
  PaintRect, R: TRect;
  Offset: TPoint;
begin
  if FOpaque or not FFlat then
    Bmp := TBitmap.Create
  else
    Bmp := nil;
  try
    if FOpaque or not FFlat then begin
      Bmp.Width := Width;
      Bmp.Height := Height;
      DrawCanvas := Bmp.Canvas;
      with DrawCanvas do begin
        Brush.Color := Self.Color;
        FillRect (ClientRect);
      end;
    end
    else
      DrawCanvas := Canvas;
    if not Enabled then begin
      FState := ppbsDisabled;
      FMouseIsDown := False;
    end
    else
    if FState = ppbsDisabled then
      if FDown and (GroupIndex <> 0) then
        FState := ppbsExclusive
      else
        FState := ppbsUp;
    DrawCanvas.Font := Self.Font;
    PaintRect := Rect(0, 0, Width, Height);

    if ((not FNoBorder) and
        ((not FFlat) or (FState in [ppbsDown, ppbsExclusive]) or
        (FMouseInControl and (FState <> ppbsDisabled)))) or
       (csDesigning in ComponentState) then begin
      if DropdownCombo and FUsesDropdown then begin
        R := PaintRect;
        R.Left := R.Right - DropdownComboWidth;
        Dec (R.Right, 2);
{$IFDEF WIN32} {DIGIMETA}
        DrawEdge (DrawCanvas.Handle, R,
          EdgeStyles[FFlat, (FState in [ppbsDown, ppbsExclusive]) and FMenuIsDown],
          FlagStyles[FFlat]);
{$ELSE}
      DCFrame3D (DrawCanvas.Handle, R, Color1Styles[(FState in [ppbsDown, ppbsExclusive]) and FMenuIsDown],
        Color2Styles[(FState in [ppbsDown, ppbsExclusive]) and FMenuIsDown], False);

{$ENDIF}
        Dec (PaintRect.Right, DropdownComboWidth);
      end;
{$IFDEF WIN32} {DIGIMETA}
      DrawEdge (DrawCanvas.Handle, PaintRect,
        EdgeStyles[FFlat, (FState in [ppbsDown, ppbsExclusive]) and (not(DropdownCombo and FUsesDropdown) or not FMenuIsDown)],
        FlagStyles[FFlat]);
{$ELSE}
      DCFrame3D (DrawCanvas.Handle, PaintRect,
                 Color1Styles[(FState in [ppbsDown, ppbsExclusive]) and
                               (not(DropdownCombo and FUsesDropdown) or not FMenuIsDown)],
        Color2Styles[(FState in [ppbsDown, ppbsExclusive]) and
                     (not(DropdownCombo and FUsesDropdown) or not FMenuIsDown)], False);

{$ENDIF}
    end
    else
      if DropdownCombo and FUsesDropdown then
        Dec (PaintRect.Right, DropdownComboWidth);
    if not FNoBorder then begin
      if FFlat then
        InflateRect (PaintRect, -1, -1)
      else
        InflateRect (PaintRect, -2, -2);
    end;

    if (FState in [ppbsDown, ppbsExclusive]) and (not(DropdownCombo and FUsesDropdown) or not FMenuIsDown) then begin
      if (FState = ppbsExclusive) and (not FFlat or not FMouseInControl) then begin
        if Pattern = nil then CreateBrushPattern;
        DrawCanvas.Brush.Bitmap := Pattern;
        DrawCanvas.FillRect(PaintRect);
      end;
      Offset.X := 1;
      Offset.Y := 1;
    end
    else begin
      Offset.X := 0;
      Offset.Y := 0;
    end;

    TppButtonGlyph(FGlyph).Draw (DrawCanvas, PaintRect, Offset,
      FDisplayMode <> ppdmTextOnly, FDisplayMode <> ppdmGlyphOnly,
      Caption, FWordWrap, FLayout, FMargin, FSpacing,
      FDropdownArrow and not FDropdownCombo and FUsesDropdown, FState);
    if FDropdownCombo and FUsesDropdown then
      TppButtonGlyph(FGlyph).DrawButtonDropArrow (DrawCanvas, Width-DropdownComboWidth-2,
        Height div 2 - 1, FState);

    if FOpaque or not FFlat then
      Canvas.Draw (0, 0, Bmp);
  finally
    if FOpaque or not FFlat then
      Bmp.Free;
  end;
end;

procedure TppToolbarButton97.UpdateTracking;
var
  P: TPoint;
begin
  if Enabled then begin
    GetCursorPos (P);
    { Use FindDragTarget instead of PtInRect since we want to check based on
      the Z order }
    FMouseInControl := not (FindDragTarget(P, True) = Self);
    if FMouseInControl then
      MouseLeft
    else
      MouseEntered;
  end;
end;

procedure TppToolbarButton97.Loaded;
var
  State: TppButtonState97;
begin
  inherited Loaded;
  if Enabled then
    State := ppbsUp
  else
    State := ppbsDisabled;
  TppButtonGlyph(FGlyph).CreateButtonGlyph (State);
end;

procedure TppToolbarButton97.Notification (AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(aComponent, Operation);
  if (AComponent = FDropdownMenu) and (Operation = opRemove) then
    FDropdownMenu := nil;
end;

procedure TppToolbarButton97.MouseDown (Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if not Enabled then begin
    inherited MouseDown (Button, Shift, X, Y);
    Exit;
  end;
  if Button <> mbLeft then begin
    MouseEntered;
    inherited MouseDown (Button, Shift, X, Y);
  end
  else begin
    { We know mouse has to be over the control if the mouse went down. }
    if not FMouseInControl then begin
      { Doesn't call MouseEntered since the redrawing it does is unnecessary
        here }
      FMouseInControl := True;
      if Assigned(FOnMouseEnter) then
        FOnMouseEnter (Self);
    end;
    if not FDropdownCombo then
      FMenuIsDown := FUsesDropdown
    else
      FMenuIsDown := FUsesDropdown and (X >= Width-DropdownComboWidth);
    try
      if not FDown then begin
        FState := ppbsDown;
        Redraw (True);
      end
      else
        if FAllowAllUp then
          Redraw (True);
      if not FMenuIsDown then
        FMouseIsDown := True;
      inherited MouseDown (Button, Shift, X, Y);
      if FMenuIsDown then
        Click;
    finally
      FMenuIsDown := False;
    end;
  end;
end;

procedure TppToolbarButton97.MouseMove (Shift: TShiftState; X, Y: Integer);

  function GetActiveForm: {$IFDEF TB97Delphi3orHigher} TCustomForm {$ELSE} TForm {$ENDIF};
  { Returns the active top-level form }
  var
    Ctl: TWinControl;
  begin
    Result := nil;
    Ctl := FindControl(GetActiveWindow);
    if Assigned(Ctl) then begin
      Result := GetParentForm(Ctl);
      if Result is TForm then
        Result := ppGetMDIParent(TForm(Result));
    end;
  end;
var
  P: TPoint;
  NewState: TppButtonState97;
begin
  inherited MouseMove (Shift, X, Y);

  { Check if mouse just entered the control. It works better to check this
    in MouseMove rather than using CM_MOUSEENTER, since the VCL doesn't send
    a CM_MOUSEENTER in all cases
    Use FindDragTarget instead of PtInRect since we want to check based on
    the Z order }
  P := ClientToScreen(Point(X, Y));
  if (ButtonMouseInControl <> Self) and (FindDragTarget(P, True) = Self) then begin
    if Assigned(ButtonMouseInControl) then
      ButtonMouseInControl.MouseLeft;
    { Like Office 97, only draw the active borders when the application is active }
    if FShowBorderWhenInactive or Application.Active then begin
      ButtonMouseInControl := Self;
      ButtonMouseTimer.OnTimer := ButtonMouseTimerHandler;
      ButtonMouseTimer.Enabled := True;
      MouseEntered;
    end;
  end;

  if FMouseIsDown then begin
    if FDown then
      NewState := ppbsExclusive
    else begin
      if (X >= 0) and
         (X < ClientWidth-(DropdownComboWidth * Ord(FDropdownCombo and FUsesDropdown))) and
         (Y >= 0) and (Y < ClientHeight) then
        NewState := ppbsDown
      else
        NewState := ppbsUp;
    end;
    if NewState <> FState then begin
      FState := NewState;
      Redraw (True);
    end;
  end;
end;

procedure TppToolbarButton97.WMCancelMode (var Message: TWMCancelMode);
begin
  if FMouseIsDown then begin
    FMouseIsDown := False;
    if FGroupIndex <> 0 then begin
      if FDown then
        FState := ppbsExclusive;
    end;
    MouseLeft;
  end;
  { Delphi's default processing of WM_CANCELMODE sends a "fake" WM_LBUTTONUP
    message to the control, so inherited must only be called after setting
    FMouseIsDown to False }
  inherited;
end;

procedure TppToolbarButton97.MouseUp (Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  DoClick: Boolean;
begin
  { Remove active border when right button is clicked }
  if (Button = mbRight) and Enabled then begin
    FMouseIsDown := False;
    MouseLeft;
  end;

  inherited MouseUp(Button, Shift, X, Y);

  if (Button = mbLeft) and FMouseIsDown then begin
    FMouseIsDown := False;
    DoClick := (X >= 0) and
      (X < ClientWidth-(DropdownComboWidth * Ord(FDropdownCombo and FUsesDropdown))) and
      (Y >= 0) and (Y < ClientHeight);
    if FGroupIndex <> 0 then begin
      if DoClick then
        SetDown (not FDown)
      else begin
        if FDown then
          FState := ppbsExclusive;
      end;
    end;
    if DoClick then
      Click
    else
      UpdateTracking;
  end;
end;

procedure TppToolbarButton97.Click;
const
  { TPM_RIGHTBUTTON works better on Windows 3.x }
  ButtonFlags: array[Boolean] of UINT = (TPM_RIGHTBUTTON, TPM_LEFTBUTTON);
  AlignFlags: array[TPopupAlignment] of UINT = (TPM_LEFTALIGN, TPM_RIGHTALIGN,
    TPM_CENTERALIGN);
var
  SaveAlignment: TPopupAlignment;
  PopupPoint: TPoint;
  RepostList: TList; {pointers to TMsg's}
  Msg: TMsg;
  Repost: Boolean;
  I: Integer;
  P: TPoint;
  Form: {$IFDEF TB97Delphi3orHigher} TCustomForm {$ELSE} TForm {$ENDIF};
begin
  FInClick := True;
  try
    if FState in [ppbsUp, ppbsMouseIn] then begin
      FState := ppbsDown;
      Redraw (True);
    end;

    { Stop tracking }
    MouseLeft;
    if (not FUsesDropdown) or (FDropdownCombo and not FMenuIsDown) then begin
      Form := GetParentForm(Self);
      if Form <> nil then Form.ModalResult := ModalResult;
      inherited Click;
    end
    else begin
      { It must release its capture before displaying the popup menu since
        this control uses csCaptureMouse. If it doesn't, the VCL seems to
        get confused and think the mouse is still captured even after the
        popup menu is displayed, causing mouse problems after the menu is
        dismissed. }
      MouseCapture := False;
      try
        SaveAlignment := DropdownMenu.Alignment;
        try
          DropdownMenu.Alignment := paLeft;
          PopupPoint := Point(0, Height);
          if (Parent is TppCustomToolWindow97) and
             (ppGetDockTypeOf(TppCustomToolWindow97(Parent).DockedTo) = ppdtLeftRight) then begin
            { Drop out right or left side }
            if TppCustomToolWindow97(Parent).DockedTo.Position = ppdpLeft then
              PopupPoint := Point(Width, 0)
            else begin
              PopupPoint := Point(0, 0);
              DropdownMenu.Alignment := paRight;
            end;
          end;
          PopupPoint := ClientToScreen(PopupPoint);
          with DropdownMenu do begin
            PopupComponent := Self;
            { Starting with version 1.54, this avoids using the Popup method
              of TPopupMenu because it uses the "track right button" flag
              (which disallowed the "click and drag" selecting motion many
              people are accustomed to). }

{$IFDEF WIN32} {DIGIMETA}
            if Assigned(OnPopup) then
              OnPopup (DropdownMenu);
{$ELSE}
            try
              OnPopup (DropdownMenu);
            except
            end;
{$ENDIF}
            TrackPopupMenu (Handle, AlignFlags[Alignment] or ButtonFlags[NewStyleControls],
              PopupPoint.X, PopupPoint.Y, 0, DropdownList.Window, nil);
          end;
        finally
          DropdownMenu.Alignment := SaveAlignment;
        end;
      finally
        { To prevent a mouse click from redisplaying the menu, filter all
          mouse up/down messages, and repost the ones that don't need
          removing. This is sort of bulky, but it's the only way I could
          find that works perfectly and like Office 97. }
        RepostList := TList.Create;
        try
          while PeekMessage(Msg, 0, WM_LBUTTONDOWN, WM_MBUTTONDBLCLK,
             PM_REMOVE or PM_NOYIELD) do
             { ^ The WM_LBUTTONDOWN to WM_MBUTTONDBLCLK range encompasses all
               of the DOWN and DBLCLK messages for the three buttons }
            with Msg do begin
              Repost := True;
              case Message of
                WM_LBUTTONDOWN, WM_LBUTTONDBLCLK,
                WM_RBUTTONDOWN, WM_RBUTTONDBLCLK,
                WM_MBUTTONDOWN, WM_MBUTTONDBLCLK: begin
                    P := SmallPointToPoint(TSmallPoint(lParam));
{$IFDEF WIN32}   {DIGIMETA}
                    Windows.ClientToScreen (hwnd, P);
{$ELSE}
                    Winprocs.ClientToScreen (hwnd, P);
{$ENDIF}
                    if FindDragTarget(P, True) = Self then
                      Repost := False;
                  end;
              end;
              if Repost then begin
                RepostList.Add (AllocMem(SizeOf(TMsg)));
                PMsg(RepostList.Last)^ := Msg;
              end;
            end;
        finally
          for I := 0 to RepostList.Count-1 do begin
            with PMsg(RepostList[I])^ do
              PostMessage (hwnd, message, wParam, lParam);
{$IFDEF WIN32}     {DIGIMETA}
            FreeMem (RepostList[I]);
{$ELSE}
            FreeMem (RepostList[I], SizeOf(TMsg));
{$ENDIF}
          end;
          RepostList.Free;
        end;
      end;
    end;
  finally
    FInClick := False;
    if FState = ppbsDown then
      FState := ppbsUp;
    { Need to check if it's destroying in case the OnClick handler freed
      the button. If it doesn't check this here, it can sometimes cause an
      access violation }
    if not(csDestroying in ComponentState) then begin
      Redraw (True);
      UpdateTracking;
    end;
  end;
end;

function TppToolbarButton97.GetPalette: HPALETTE;
begin
  Result := Glyph.Palette;
end;

function TppToolbarButton97.GetGlyph: TBitmap;
begin
  Result := TppButtonGlyph(FGlyph).Glyph;
end;

procedure TppToolbarButton97.SetGlyph (Value: TBitmap);
begin
  TppButtonGlyph(FGlyph).Glyph := Value;
  Redraw (True);
end;

function TppToolbarButton97.GetGlyphMask: TBitmap;
begin
  Result := TppButtonGlyph(FGlyph).GlyphMask;
end;

procedure TppToolbarButton97.SetGlyphMask (Value: TBitmap);
begin
  TppButtonGlyph(FGlyph).GlyphMask := Value;
  Redraw (True);
end;

function TppToolbarButton97.GetNumGlyphs: TppNumGlyphs97;
begin
  Result := TppButtonGlyph(FGlyph).NumGlyphs;
end;

procedure TppToolbarButton97.SetNumGlyphs (Value: TppNumGlyphs97);
begin
  if Value < Low(TppNumGlyphs97) then
    Value := Low(TppNumGlyphs97)
  else
  if Value > High(TppNumGlyphs97) then
    Value := High(TppNumGlyphs97);
  if Value <> TppButtonGlyph(FGlyph).NumGlyphs then begin
    TppButtonGlyph(FGlyph).NumGlyphs := Value;
    Redraw (True);
  end;
end;

procedure TppToolbarButton97.GlyphChanged(Sender: TObject);
begin
  Redraw (True);
end;

procedure TppToolbarButton97.UpdateExclusive;
var
  Msg: TMessage;
begin
  if (FGroupIndex <> 0) and (Parent <> nil) then begin
    Msg.Msg := CM_BUTTONPRESSED;
    Msg.WParam := FGroupIndex;
    Msg.LParam := Longint(Self);
    Msg.Result := 0;
    Parent.Broadcast (Msg);
  end;
end;

procedure TppToolbarButton97.SetDown (Value: Boolean);
begin
  if FGroupIndex = 0 then
    Value := False;
  if Value <> FDown then begin
    if FDown and (not FAllowAllUp) then Exit;
    FDown := Value;
    if Value then
      FState := ppbsExclusive
    else
      FState := ppbsUp;
    Redraw (True);
    if Value then UpdateExclusive;
  end;
end;

procedure TppToolbarButton97.SetFlat (Value: Boolean);
begin
  if FFlat <> Value then begin
    FFlat := Value;
    if FOpaque or not FFlat then
      ControlStyle := ControlStyle + [csOpaque]
    else
      ControlStyle := ControlStyle - [csOpaque];
    Redraw (True);
  end;
end;

procedure TppToolbarButton97.SetGroupIndex (Value: Integer);
begin
  if FGroupIndex <> Value then begin
    FGroupIndex := Value;
    UpdateExclusive;
  end;
end;

procedure TppToolbarButton97.SetLayout (Value: TButtonLayout);
begin
  if FLayout <> Value then begin
    FLayout := Value;
    Redraw (True);
  end;
end;

procedure TppToolbarButton97.SetMargin (Value: Integer);
begin
  if (FMargin <> Value) and (Value >= -1) then begin
    FMargin := Value;
    Redraw (True);
  end;
end;

procedure TppToolbarButton97.SetNoBorder (Value: Boolean);
begin
  if FNoBorder <> Value then begin
    FNoBorder := Value;
    Invalidate;
  end;
end;

procedure TppToolbarButton97.SetOldDisabledStyle (Value: Boolean);
begin
  if FOldDisabledStyle <> Value then begin
    FOldDisabledStyle := Value;
    with TppButtonGlyph(FGlyph) do begin
      FOldDisabledStyle := Value;
      Invalidate;
    end;
    Redraw (True);
  end;
end;

procedure TppToolbarButton97.SetOpaque (Value: Boolean);
begin
  if FOpaque <> Value then begin
    FOpaque := Value;
    if FOpaque or not FFlat then
      ControlStyle := ControlStyle + [csOpaque]
    else
      ControlStyle := ControlStyle - [csOpaque];
    Invalidate;
  end;
end;

procedure TppToolbarButton97.Redraw (const Erase: Boolean);
var
  AddedOpaque: Boolean;
begin
  if FOpaque or not FFlat or not Erase then begin
    { Temporarily add csOpaque to the style. This prevents Invalidate from
      erasing, which isn't needed when Erase is false. }
    AddedOpaque := False;
    if not(csOpaque in ControlStyle) then begin
      AddedOpaque := True;
      ControlStyle := ControlStyle + [csOpaque];
    end;
    try
      Invalidate;
    finally
      if AddedOpaque then
        ControlStyle := ControlStyle - [csOpaque];
    end;
  end
  else
  if not(FOpaque or not FFlat) then
    Invalidate;
end;

procedure TppToolbarButton97.SetSpacing (Value: Integer);
begin
  if Value <> FSpacing then begin
    FSpacing := Value;
    Redraw (True);
  end;
end;

procedure TppToolbarButton97.SetAllowAllUp (Value: Boolean);
begin
  if FAllowAllUp <> Value then begin
    FAllowAllUp := Value;
    UpdateExclusive;
  end;
end;

procedure TppToolbarButton97.SetDropdownMenu (Value: TPopupMenu);
begin
  if FDropdownMenu <> Value then begin
    FDropdownMenu := Value;
    FUsesDropdown := Assigned(Value);

    if Assigned(Value) then begin
  {$IFDEF WIN32}
      Value.FreeNotification (Self);
  {$ENDIF}
      DropdownList.AddMenu (Value);
    end;
    if FDropdownArrow then
      Redraw (True);
  end;
end;

procedure TppToolbarButton97.SetWordWrap (Value: Boolean);
begin
  if FWordWrap <> Value then begin
    FWordWrap := Value;
    Redraw (True);
  end;
end;

procedure TppToolbarButton97.SetDropdownArrow (Value: Boolean);
begin
  if FDropdownArrow <> Value then begin
    FDropdownArrow := Value;
    Redraw (True);
  end;
end;

procedure TppToolbarButton97.SetDropdownCombo (Value: Boolean);
var
  W: Integer;
begin
  if FDropdownCombo <> Value then begin
    FDropdownCombo := Value;
    if not(csLoading in ComponentState) then begin
      if Value then
        Width := Width + DropdownComboWidth
      else begin
        W := Width - DropdownComboWidth;
        if W < 1 then W := 1;
        Width := W;
      end;
    end;
    Redraw (True);
  end;
end;

procedure TppToolbarButton97.SetDisplayMode (Value: TppButtonDisplayMode);
begin
  if FDisplayMode <> Value then begin
    FDisplayMode := Value;
    Redraw (True);
  end;
end;

procedure TppToolbarButton97.WMLButtonDblClk (var Message: TWMLButtonDblClk);
begin
  inherited;
  if FDown then DblClick;
end;

procedure TppToolbarButton97.CMEnabledChanged (var Message: TMessage);
const
  NewState: array[Boolean] of TppButtonState97 = (ppbsDisabled, ppbsUp);
begin
  TppButtonGlyph(FGlyph).CreateButtonGlyph (NewState[Enabled]);
  UpdateTracking;
  Redraw (True);
end;

procedure TppToolbarButton97.CMButtonPressed (var Message: TMessage);
var
  Sender: TppToolbarButton97;
begin
  { UpdateExclusive broadcasts these messages }
  if Message.WParam = FGroupIndex then begin
    Sender := TppToolbarButton97(Message.LParam);
    if Sender <> Self then begin
      if Sender.Down and FDown then begin
        FDown := False;
        FState := ppbsUp;
        Redraw (True);
      end;
      FAllowAllUp := Sender.AllowAllUp;
    end;
  end;
end;

procedure TppToolbarButton97.CMDialogChar (var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Caption) and Enabled and Visible then begin
      { NOTE: There is a bug in TSpeedButton where accelerator keys are still
        processed even when the button is not visible. The 'and Visible'
        corrects it, so TppToolbarButton97 doesn't have this problem. }
      Click;
      Result := 1;
    end
    else
      inherited;
end;

procedure TppToolbarButton97.CMFontChanged (var Message: TMessage);
begin
  Redraw (True);
end;

procedure TppToolbarButton97.CMTextChanged (var Message: TMessage);
begin
  Redraw (True);
end;

procedure TppToolbarButton97.CMSysColorChange (var Message: TMessage);
begin
  inherited;
  if Assigned(Pattern) and
     ((PatternBtnFace <> Integer(GetSysColor(COLOR_BTNFACE))) or
      (PatternBtnHighlight <> Integer(GetSysColor(COLOR_BTNHIGHLIGHT)))) then begin
    Pattern.Free;
    Pattern := nil;
  end;
  with TppButtonGlyph(FGlyph) do begin
    Invalidate;
    CreateButtonGlyph (FState);
  end;
end;

procedure TppToolbarButton97.MouseEntered;
begin
  if Enabled and not FMouseInControl then begin
    FMouseInControl := True;
    if FState = ppbsUp then
      FState := ppbsMouseIn;
    Redraw (FDown);
    if Assigned(FOnMouseEnter) then
      FOnMouseEnter (Self);
  end;
end;

procedure TppToolbarButton97.MouseLeft;
begin
  if Enabled and FMouseInControl and not FMouseIsDown then begin
    if (FState = ppbsMouseIn) or (not FInClick and (FState = ppbsDown)) then
      FState := ppbsUp;
    FMouseInControl := False;
    Redraw (True);
    if ButtonMouseInControl = Self then begin
      ButtonMouseTimer.Enabled := False;
      ButtonMouseInControl := nil;
    end;
    if Assigned(FOnMouseExit) then
      FOnMouseExit (Self);
  end;
end;

procedure TppToolbarButton97.CMMouseLeave (var Message: TMessage);
begin
  inherited;
  MouseLeft;
end;

procedure TppToolbarButton97.ButtonMouseTimerHandler (Sender: TObject);
var
  P: TPoint;
begin
  { The button mouse timer is used to periodically check if mouse has left.
    Normally it receives a CM_MOUSELEAVE, but the VCL does not send a
    CM_MOUSELEAVE if the mouse is moved quickly from the button to another
    application's window. For some reason, this problem doesn't seem to occur
    on Windows NT 4 -- only 95 and 3.x.

    The timer (which ticks 8 times a second) is only enabled when the
    application is active and the mouse is over a button, so it uses virtually
    no processing power.

    For something interesting to try: If you want to know just how often this
    is called, try putting a Beep call in here }

  GetCursorPos (P);
  if FindDragTarget(P, True) <> Self then
    MouseLeft;
end;

class function TppToolbarButton97.DeactivateHook (var Message: TMessage): Boolean;
begin
  Result := False;
  { Hide any active border when application is deactivated }
  if (Message.Msg = CM_DEACTIVATE) and Assigned(ButtonMouseInControl) and
     not ButtonMouseInControl.FShowBorderWhenInactive then
    ButtonMouseInControl.MouseLeft;
end;


{ TppEdit97 - internal }

constructor TppEdit97.Create (AOwner: TComponent);
begin
  inherited Create (aOwner);
  AutoSize := False;
  Ctl3D := False;
  BorderStyle := bsNone;
  ControlStyle := ControlStyle - [csFramed]; {fixes a VCL bug with Win 3.x}
  Height := 19;
end;

procedure TppEdit97.CMMouseEnter (var Message: TMessage);
begin
  inherited;
  MouseInControl := True;
  RedrawBorder (0);
end;

procedure TppEdit97.CMMouseLeave (var Message: TMessage);
begin
  inherited;
  MouseInControl := False;
  RedrawBorder (0);
end;

procedure TppEdit97.NewAdjustHeight;
var
  DC: HDC;
  SaveFont: HFONT;
  Metrics: TTextMetric;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics (DC, Metrics);
  SelectObject (DC, SaveFont);
  ReleaseDC (0, DC);

  Height := Metrics.tmHeight + 6;
end;

procedure TppEdit97.Loaded;
begin
  inherited Loaded;
  if not(csDesigning in ComponentState) then
    NewAdjustHeight;
end;

procedure TppEdit97.CMEnabledChanged (var Message: TMessage);
const
  EnableColors: array[Boolean] of TColor = (clBtnFace, clWindow);
begin
  inherited;
  Color := EnableColors[Enabled];
end;

procedure TppEdit97.CMFontChanged (var Message: TMessage);
begin
  inherited;
  if not((csDesigning in ComponentState) and (csLoading in ComponentState)) then
    NewAdjustHeight;
end;

procedure TppEdit97.WMSetFocus (var Message: TWMSetFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
    RedrawBorder (0);
end;

procedure TppEdit97.WMKillFocus (var Message: TWMKillFocus);
begin
  inherited;
  if not(csDesigning in ComponentState) then
    RedrawBorder (0);
end;

procedure TppEdit97.WMNCCalcSize (var Message: TWMNCCalcSize);
begin
  inherited;
  InflateRect (Message.CalcSize_Params^.rgrc[0], -3, -3);
end;

procedure TppEdit97.WMNCPaint (var Message: TMessage);
begin
  inherited;
  RedrawBorder (Message.WParam);
end;

procedure TppEdit97.RedrawBorder (const Clip: HRGN);
var
  DC: HDC;
  R: TRect;
  NewClipRgn: HRGN;
  BtnFaceBrush, WindowBrush: HBRUSH;
begin
  DC := GetWindowDC(Handle);
  try
    { Use update region }
    if Clip <> 0 then begin
      GetWindowRect (Handle, R);
      { An invalid region is generally passed when the window is first created }
      if SelectClipRgn(DC, Clip) = ERROR then begin
        NewClipRgn := CreateRectRgnIndirect(R);
        SelectClipRgn (DC, NewClipRgn);
        DeleteObject (NewClipRgn);
      end;
      OffsetClipRgn (DC, -R.Left, -R.Top);
    end;

    { This works around WM_NCPAINT problem described at top of source code }
    {no!  R := Rect(0, 0, Width, Height);}
    GetWindowRect (Handle, R);  OffsetRect (R, -R.Left, -R.Top);

{$IFDEF WIN32}  {DIGIMETA}
    BtnFaceBrush := GetSysColorBrush(COLOR_BTNFACE);
    WindowBrush := GetSysColorBrush(COLOR_WINDOW);
{$ELSE}
    BtnFaceBrush := CreateSolidBrush(GetSysColor(COLOR_BTNFACE));
    WindowBrush := CreateSolidBrush(GetSysColor(COLOR_WINDOW));
{$ENDIF}

    if ((csDesigning in ComponentState) and Enabled) or
       (not(csDesigning in ComponentState) and
        (Focused or (MouseInControl and not(Screen.ActiveControl is TppEdit97)))) then begin
{$IFDEF WIN32}  {DIGIMETA}
      DrawEdge (DC, R, BDR_SUNKENOUTER, BF_RECT or BF_ADJUST);
      with R do begin
        FillRect (DC, Rect(Left, Top, Left+1, Bottom-1), BtnFaceBrush);
        FillRect (DC, Rect(Left, Top, Right-1, Top+1), BtnFaceBrush);
      end;
      DrawEdge (DC, R, BDR_SUNKENINNER, BF_BOTTOMRIGHT);
{$ELSE}
      DCFrame3D (DC, R, clBtnShadow, clBtnHighlight, True);
 {$ENDIF}
      InflateRect (R, -1, -1);
      FrameRect (DC, R, WindowBrush);
    end
    else begin
      FrameRect (DC, R, BtnFaceBrush);
      InflateRect (R, -1, -1);
      FrameRect (DC, R, BtnFaceBrush);
      InflateRect (R, -1, -1);
      FrameRect (DC, R, WindowBrush);
    end;
  finally
    ReleaseDC (Handle, DC);
  end;
end;



{$IFDEF WINDOWS}   {DIGIMETA} {note: code from 1.47}
procedure ExitProcedure; far;
begin
  {old stuff from 1.47
   Application.UnhookMainWindow (TppToolbarButton97.DeactivateHook);
  if Assigned(ButtonMouseTimer) then ButtonMouseTimer.Free;
  if Assigned(UsedForms) then UsedForms.Free;}

  ButtonMouseTimer.Free;
  DropdownList.Free;
  DoneCreatingList.Free;
  MainHookedForms.Free;
  HookedForms.Free;

end;
{$ENDIF}



const
  Sig: PChar = '- Toolbar97 version ' + Toolbar97Version + ' by Jordan Russell -';

initialization
  Sig := Sig;

  RegisterClasses([TppDock97, TppToolWindow97, TppToolbar97, TppToolbarButton97, TppToolbarSep97]);

  HookedForms      := TList.Create;
  MainHookedForms  := TList.Create;
  DoneCreatingList := TList.Create;
  DropdownList     := TDropdownList.Create(nil);

  ButtonMouseTimer := TTimer.Create(nil);
  ButtonMouseTimer.Enabled := False;
  ButtonMouseTimer.Interval := 125;  { 8 times a second }


{$IFDEF WINDOWS}   {DIGIMETA} {note: code from 1.47}
  AddExitProc (ExitProcedure);
{$ENDIF}

{$IFDEF WIN32}
finalization
  ButtonMouseTimer.Free;
  DropdownList.Free;
  DoneCreatingList.Free;
  MainHookedForms.Free;
  HookedForms.Free;
{$ENDIF}

end.
