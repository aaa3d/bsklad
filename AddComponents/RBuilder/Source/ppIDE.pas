{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppIDE;

interface

{$I ppIfDef.pas}

uses
  Windows, ComCtrls, SysUtils, Classes, Controls, ExtCtrls, Forms, Graphics, Dialogs, Menus, Messages, StdCtrls,
  ppCmpReg, ppUtils, ppTypes, ppPrintr, ppTB97, ppTB97x, ppClass, ppReport, ppSubRpt,
  ppToolWn;

type                                      

  { TppCustomPalette }
  TppCustomPalette = class(TppDropDownPanel)
  private
    FButtons: TList;
    FPaletteEnabled: Boolean;
    FOnButtonClick: TNotifyEvent;

    function  GetButton(aIndex: Integer): TppToolbarButton;
    function  GetButtonCount: Integer;

    procedure CMVisibleChanged (var Message: TMessage); message CM_VISIBLECHANGED;

  protected
    function AddButton(aButton: TppToolbarButton): Integer;

    procedure ButtonClickEvent(Sender: TObject); virtual;
    procedure DrawButtonGlyph(aButton: TppToolbarButton); virtual;
    procedure EnablePalette(aValue: Boolean); virtual;

    procedure SetPaletteEnabled(aValue: Boolean); virtual;

    procedure VisibleChanged; virtual;

    property Buttons[Index: Integer]: TppToolbarButton read GetButton;
    property ButtonCount: Integer read GetButtonCount;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property PaletteEnabled: Boolean read FPaletteEnabled write SetPaletteEnabled;
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;

  end; {class, TppCustomPalette}


   { TppCustomPaletteButton }
  TppCustomPaletteButton = class(TppToolbarButton)
  private
    FPalette: TppCustomPalette;
    FPaletteEnabled: Boolean;
    FOnPaletteButtonClick: TNotifyEvent;
    FInactiveTimer: TTimer;

    procedure SetPaletteEnabled(aValue: Boolean);
    procedure InactiveTimerEvent(Sender: TObject);

  protected
    function GetDropDownPanel: TppDropDownPanel; override;
    procedure DropDownPanelHideEvent(Sender: TObject); override;

    function CreatePalette: TppCustomPalette; virtual;  abstract;
    procedure FreePalette; virtual;
    procedure PaletteButtonClickEvent(Sender: TObject); virtual;

    property Palette: TppCustomPalette read FPalette write FPalette;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property OnPaletteButtonClick: TNotifyEvent read FOnPaletteButtonClick write FOnPaletteButtonClick;
    property PaletteEnabled: Boolean read FPaletteEnabled write SetPaletteEnabled;

  end; {class, TppCustomPaletteButton}


 
   { TppColorPalette }
  TppColorPalette = class(TppCustomPalette)
  private
    FAutoButton: TppToolbarButton;
    FAutoCaption: String;
    FAutoGlyph: TBitmap;
    FColorButtons: TList;
    FCurrentColor: TColor;
    FIsClear: Boolean;
    FLanguageIndex: Longint;
    FMoreColorsButton: TppToolbarButton;
    FMoreColorsCaption: String;
    FOnColorChange: TNotifyEvent;
    FPaletteType: TppColorPaletteType;
    FTWAutoButton: TppToolbarButton;
    FTWColorButtons: TList;
    FTWMoreColorsButton: TppToolbarButton;

    procedure CreateControls;
    procedure DrawAutoButtonGlyph(aColor: TColor);
    procedure DrawColorButtonGlyph(aGlyph: TBitmap; aColor: TColor);
    function  GetColorButton(aIndex: Integer): TppToolbarButton;
    procedure SetAutoCaption(aCaption: String);
    procedure SetCurrentColor(aColor: TColor);
    procedure SetIsClear(aValue: Boolean);
    procedure SetMoreColorsCaption(aCaption: String);
    procedure SetPaletteType(aPaletteType: TppColorPaletteType);
    procedure UpdateToolWindowState;

    {button event handlers}
    procedure ColorButtonClickEvent(Sender: TObject);
    procedure MoreColorsButtonClickEvent(Sender: TObject);
    procedure AutoButtonClickEvent(Sender: TObject);


  protected

    procedure EnablePalette(aValue: Boolean); override;
    function  ShowColorDialog(var aColor: TColor): Boolean;

    procedure SetLanguageIndex(aLanguageIndex: Longint); virtual;
    procedure SetPaletteEnabled(aValue: Boolean); override;
    procedure VisibleChanged; override;

    property ColorButtons[Index: Integer]: TppToolbarButton read GetColorButton;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure ActivateToolWindow; override;
    procedure CreateToolWindow; override;

    property AutoCaption: String read FAutoCaption write SetAutoCaption;
    property CurrentColor: TColor read FCurrentColor write SetCurrentColor;
    property IsClear: Boolean read FIsClear write SetIsClear;
    property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;
    property MoreColorsCaption: String read FMoreColorsCaption write SetMoreColorsCaption;
    property PaletteType: TppColorPaletteType read FPaletteType write SetPaletteType;

    property OnColorChange: TNotifyEvent read FOnColorChange write FOnColorChange;

  end; {class TppColorPalette}



  { TppColorButton }
  TppColorButton = class(TppCustomPaletteButton)
  private
    FColorPalette: TppColorPalette;
    FColorType: TppColorButtonType;
    FDefaultColor: TColor;
    FIsClear: Boolean;
    FLanguageIndex: Longint;
    FOnPaletteColorChange: TNotifyEvent;
    FPaletteColor: TColor;
    FPaletteIsClear: Boolean;
    FPopupMenu: TPopupMenu;

    procedure DrawButtonGlyph(aColor: TColor);
    procedure SetColorType(aColorType: TppColorButtonType);

    procedure PaletteColorChangeEvent(Sender: TObject);

  protected
    function CreatePalette: TppCustomPalette; override;
    procedure FreePalette; override;
    procedure SetLanguageIndex(aLanguageIndex: Longint); virtual;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure GetDefaultColor(var aColor: TColor; var aIsClear: Boolean);
    procedure GetPaletteColor(var aColor: TColor; var aIsClear: Boolean);

    procedure SetPaletteColor(aColor: TColor; aIsClear: Boolean);
    procedure SetDefaultColor(aColor: TColor; aIsClear: Boolean);

    property ColorType: TppColorButtonType read FColorType write SetColorType;
    property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;
    property OnPaletteColorChange: TNotifyEvent read FOnPaletteColorChange write FOnPaletteColorChange;
    property PaletteEnabled;

  end; {class, TppColorButton}



  { TppLineStylePalette }
  TppLineStylePalette = class(TppCustomPalette)
  private
    FCurrentLineStyle: TPenStyle;

    procedure CreateControls;
    procedure SetCurrentLineStyle(aLineStyle: TPenStyle);

  protected
   procedure ButtonClickEvent(Sender: TObject); override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property CurrentLineStyle: TPenStyle read FCurrentLineStyle write SetCurrentLineStyle;

    property PaletteEnabled;
    property OnButtonClick;

  end; {class, TppLineStylePalette}


  { TppLineStyleButton }
  TppLineStyleButton = class(TppCustomPaletteButton)
  private
    FLineStyle: TPenStyle;

    procedure SetLineStyle(aLineStyle: TPenStyle);

  protected
    function CreatePalette: TppCustomPalette; override;
    procedure PaletteButtonClickEvent(Sender: TObject); override;

  public
    constructor Create(aOwner: TComponent); override;

  published
    property LineStyle: TPenStyle read FLineStyle write SetLineStyle;
    property OnPaletteButtonClick;
    property PaletteEnabled;

  end; {class, TppLineStyleButton}


  { TppLineThicknessButton }
  TppLineThicknessButton = class(TppCustomPaletteButton)
  private
    FLineThickness: Single;
    FLineStyle: TppLineStyleType;

    procedure SetLineThickness(aLineThickness: Single);
    procedure SetLineStyle(aLineStyle: TppLineStyleType);

  protected
    function CreatePalette: TppCustomPalette; override;
    procedure PaletteButtonClickEvent(Sender: TObject); override;

  public
    constructor Create(aOwner: TComponent); override;

  published
    property LineStyle: TppLineStyleType read FLineStyle write SetLineStyle;
    property LineThickness: Single read FLineThickness write SetLineThickness;
    property OnPaletteButtonClick;
    property PaletteEnabled;

  end; {class, TppLineThicknessButton}


  { TppFontButton }
  TppFontButton = class(TppToolbarButton)
  private
    FCurrentFont: TFont;
    FFontAttributeType: TppFontAttributeType;


    procedure SetCurrentFont(aFont: TFont);
    procedure SetFontAttributeType(aValue: TppFontAttributeType);

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property FontAttributeType: TppFontAttributeType read FFontAttributeType write SetFontAttributeType;
    procedure Click; override;

    property CurrentFont: TFont read FCurrentFont write SetCurrentFont;

  end; {class, TppFontButton}

  {TppFontComboBox}
  TppFontComboBox = class(TComboBox)
  private
    FPrinterName: String;
    FPrinterGraphic: TBitmap;
    FSelPrinterGraphic: TBitmap;
    FSelTrueTypeGraphic: TBitmap;
    FTrueTypeGraphic: TBitmap;
    FOnGetPrinter: TppGetPrinterEvent;
    FCurrentFont: TFont;
    FFontList: TppFontList;

    procedure BuildFontList;
    function GetCurrentFont: TFont;

    function GetFontName: String;
    function GetPrinter: TppPrinter;
    procedure InitializeFontGraphics;
    procedure SetFontName(aFontName: String);
    procedure SetCurrentFont(aFont: TFont);

    {private event handlers}
    procedure DrawItemEvent(Control: TWinControl; Index: Integer;
                                      Rect: TRect; State: TOwnerDrawState);
    procedure DropDownEvent(Sender: TObject);
    procedure MeasureItemEvent(Control: TWinControl; Index: Integer; var Height: Integer);

  public

    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    property FontName: String read GetFontName write SetFontName;
    property CurrentFont: TFont read GetCurrentFont write SetCurrentFont;

    property OnGetPrinter: TppGetPrinterEvent read FOnGetPrinter write FOnGetPrinter;

  end; {class, TppFontComboBox }


  { TppLineThicknessPalette }
  TppLineThicknessPalette = class(TppCustomPalette)
  private
    FCurrentLineThickness: Single;
    FCurrentLineStyle: TppLineStyleType;

    procedure CreateControls;
    procedure SetCurrentLineThickness(aLineThickness: Single);
    procedure SetCurrentLineStyle(aLineStyle: TppLineStyleType);
    procedure UpdateButtonStates;

  protected
    procedure ButtonClickEvent(Sender: TObject); override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property CurrentLineThickness: Single read FCurrentLineThickness write SetCurrentLineThickness;
    property CurrentLineStyle: TppLineStyleType read FCurrentLineStyle write SetCurrentLineStyle;

    property PaletteEnabled;
    property OnButtonClick;

  end; {class, TppLineThicknessPalette}



  {TppAlignToolbar}
  TppAlignToolbar = class(TppToolbar)
  private
    FAlignType: TppAlignType;
    FOnButtonClick: TNotifyEvent;

    procedure ButtonClickEvent(Sender: TObject);
    procedure CreateControls;

  protected
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public
    constructor Create(aOwner: TComponent); override;

    property AligType: TppAlignType read FAlignType write FAlignType;
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;

  end; {class, TppAlignToolbar}



  {TppSizeToolbar}
  TppSizeToolbar = class(TppToolbar)
  private
    FSizeType: TppSizeType;
    FOnButtonClick: TNotifyEvent;

    procedure ButtonClickEvent(Sender: TObject);
    procedure CreateControls;

  protected
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public
    constructor Create(aOwner: TComponent); override;

    property SizeType: TppSizeType read FSizeType write FSizeType;
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;

  end; {class, TppSizeToolbar}


   {TppNudgeToolbar}
  TppNudgeToolbar = class(TppToolbar)
  private
    FNudgeType: TppNudgeType;
    FOnButtonClick: TNotifyEvent;

    procedure ButtonClickEvent(Sender: TObject);
    procedure CreateControls;

  protected
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public
    constructor Create(aOwner: TComponent); override;

    property NudgeType: TppNudgeType read FNudgeType write FNudgeType;
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;

  end; {class, TppNudgeToolbar}


  {TppDrawToolbar}
  TppDrawToolbar = class(TppToolbar)
  private
    FFillColorButton: TppColorButton;
    FLineColorButton: TppColorButton;
    FLineThicknessButton: TppLineThicknessButton;
    FLineStyleButton: TppLineStyleButton;

    procedure CreateControls;

  protected
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public

    constructor Create(aOwner: TComponent); override;

    property FillColorButton: TppColorButton read FFillColorButton;
    property LineColorButton: TppColorButton read FLineColorButton;
    property LineThicknessButton: TppLineThicknessButton read FLineThicknessButton;
    property LineStyleButton: TppLineStyleButton read FLineStyleButton;

  end; {class, TppDrawToolbar}



  {TppEditToolbar}
  TppEditToolbar = class(TppToolbar)
  private
    FEditBox: TEdit;
    FComboBox: TComboBox;
    FComboBox2: TComboBox;
    FPanel: TPanel;

    procedure CreateControls;

  protected
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public

    constructor Create(aOwner: TComponent); override;

    procedure EnableControl(aControl: TControl);

    property EditBox: TEdit read FEditBox;
    property ComboBox: TComboBox read FComboBox;
    property ComboBox2: TComboBox read FComboBox2;

  end; {class, TppEditToolbar}



  {TppCustomFormatToolbar }
  TppCustomFormatToolbar = class(TppToolbar)
  private
    FFont: TFont;
    FFontComboBox: TppFontComboBox;
    FFontNameButton: TppFontButton;
    FFontSizeButton: TppFontButton;
    FFontSizeComboBox: TComboBox;
    FBoldButton: TppToolbarButton;
    FItalicButton: TppToolbarButton;
    FUnderlineButton:  TppToolbarButton;
    FAlignLeftButton: TppToolbarButton;
    FCenterButton: TppToolbarButton;
    FAlignRightButton: TppToolbarButton;
    FFontColorButton: TppColorButton;
    FHighlightColorButton: TppColorButton;


    function GetAlignment: TAlignment;
    function GetFont: TFont;

    procedure SetAlignment(aAlignment: TAlignment);
    procedure SetFont(aFont: TFont);


  protected
    procedure CreateControls; virtual;
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;


  public

    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetHighlightColor(aColor: TColor; aIsClear: Boolean);

    property FontComboBox: TppFontComboBox read FFontComboBox;
    property FontSizeComboBox: TComboBox read FFontSizeComboBox;
    property FontNameButton: TppFontButton read FFontNameButton;
    property FontSizeButton: TppFontButton read FFontSizeButton;
    property BoldButton: TppToolbarButton read FBoldButton;
    property ItalicButton: TppToolbarButton read FItalicButton;
    property UnderlineButton:  TppToolbarButton read FUnderlineButton;

    property AlignLeftButton: TppToolbarButton read FAlignLeftButton;
    property CenterButton: TppToolbarButton read FCenterButton;
    property AlignRightButton: TppToolbarButton read FAlignRightButton;

    property FontColorButton: TppColorButton read FFontColorButton;
    property HighlightColorButton: TppColorButton read FHighlightColorButton;

    property Font: TFont read GetFont write SetFont;
    property Alignment: TAlignment read GetAlignment write SetAlignment;

  end; {class, TppCustomFormatToolbar}



  {TppFormatToolbar }
  TppFormatToolbar = class(TppCustomFormatToolbar)
  private
    FBringToFrontButton: TppToolbarButton;
    FSendToBackButton: TppToolbarButton;

  protected
    procedure CreateControls;  override;
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public

    constructor Create(aOwner: TComponent); override;

    property BringToFrontButton: TppToolbarButton read FBringToFrontButton;
    property SendToBackButton: TppToolbarButton read FSendToBackButton;

  end; {class, TppFormatToolbar}




  {TppStandardToolbar}
  TppStandardToolbar = class(TppToolbar)
  private
    FFileNewButton: TppToolbarButton;
    FFileOpenButton: TppToolbarButton;
    FFileSaveButton: TppToolbarButton;
    FPageSetupButton: TppToolbarButton;
    FPrintButton: TppToolbarButton;
    FPrintPreviewButton: TppToolbarButton;
    FCutButton: TppToolbarButton;
    FCopyButton: TppToolbarButton;
    FPasteButton: TppToolbarButton;

    procedure CreateControls;

  protected
    procedure SetLanguageIndex(aLanguageIndex: Longint); override;

  public

    constructor Create(aOwner: TComponent); override;

    property FileNewButton: TppToolbarButton read FFileNewButton;
    property FileOpenButton: TppToolbarButton read FFileOpenButton;
    property FileSaveButton: TppToolbarButton read FFileSaveButton;
    property PageSetupButton: TppToolbarButton read FPageSetupButton;
    property PrintButton: TppToolbarButton read FPrintButton;
    property PrintPreviewButton: TppToolbarButton read FPrintPreviewButton;
    property CutButton: TppToolbarButton read FCutButton;
    property CopyButton: TppToolbarButton read FCopyButton;
    property PasteButton: TppToolbarButton read FPasteButton;

  end; {class, TppStandardToolbar}



  { TppToolbarManager }
  TppToolbarManager = class(TppRegListSubscriber)
  private
    FComponentBars: TList;
    FComponentClasses: TStrings;
    FFloatingToolWindows: TList;
    FCaptionsList: TList;
    FForm: TForm;
    FPaletteButton: TppToolbarButton;
    FSelectObjectButton: TppToolbarButton;
    FStandardBars: TList;
    FToolbars: TStringList;
    FToolWindows: TList;
    FPaletteButtons: TList;
    FLeftDock: TppDock97;
    FTopDock: TppDock97;
    FBottomDock: TppDock97;
    FRightDock: TppDock97;
    FPopupMenu: TPopupMenu;
    FLanguageIndex: Longint;
    FIniFileName: String;

    procedure AddComponentClass(aClassName: String);
    procedure BuildComponentPalette;
    procedure BuildPopupMenu;
    procedure CreateStandardToolbars;
    procedure FreeMenuItems;
    procedure FreeToolbars(aList: TList);
    function  GetToolbar(aIndex: Integer): TppCustomToolWindow97;
    function  GetToolbarCount: Integer;
    procedure RemoveComponentClass(aClassName: String);
    procedure SetComponentClasses(aComponentClasses: TStrings);
    procedure SetLanguageIndex(aLanguageIndex: Longint);
    function  TranslateToolbarCaption(const aToolbarCaption: String): String;


  protected
    procedure ComponentPaletteButtonClickEvent(Sender: TObject);
    procedure MenuItemClickEvent(Sender: TObject);

  public
    constructor Create(aForm: TForm);
    destructor Destroy; override;

    procedure AddToolbar(aToolbarName: String; aToolbar: TppCustomToolWindow97);
    function  FindToolbar(aToolbarName: String): TppCustomToolWindow97;

    procedure HideFloatingToolWindows;
    procedure Initialize(aTopDock, aBottomDock, aLeftDock, aRightDock: TppDock97);
    procedure MenuPopupEvent(Sender: TObject);
    function  NewToolbar(aToolbarName: String): TppToolbar;
    procedure RemoveToolbar(aToolbarName: String);
    procedure ShowFloatingToolWindows;
    procedure SaveToolWindowPreferences;
    procedure LoadToolWindowPreferences;
    procedure EnableToolWindowCaptions(aValue: Boolean);
    procedure BuildFloatingToolWindowList(aList: TList);
    procedure RegisterListChanged; override;

    property ComponentClasses: TStrings read FComponentClasses write SetComponentClasses;
    property IniFileName: String read FIniFileName write FIniFileName;
    property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;
    property LeftDock: TppDock97 read FLeftDock write FLeftDock;
    property TopDock: TppDock97  read FTopDock write FTopDock;
    property BottomDock: TppDock97 read FBottomDock write FBottomDock;
    property RightDock: TppDock97 read FRightDock write FRightDock;

    property Toolbars[Index: Integer]: TppCustomToolWindow97 read GetToolbar;
    property ToolbarCount: Integer read GetToolbarCount;

    property PopupMenu: TPopupMenu read FPopupMenu;
    property PaletteButton: TppToolbarButton read FPaletteButton;
    property SelectObjectButton: TppToolbarButton read FSelectObjectButton;

  end; {class, TppToolbarManager}

  procedure ppSaveFontToIniFile(aIniFile: TObject; aSection, aIdent: String; aFont: TFont);
  procedure ppLoadFontFromIniFile(aIniFile: TObject; aSection, aIdent: String; aFont: TFont);



const
  cStdColors: array [0..15] of TColor =
                  (clBlack, clGray, clMaroon, clOlive, clGreen, clTeal, clNavy, clPurple,
                   clWhite, clLtGray, clRed, clYellow,  clLime, clAqua, clBlue, clFuchsia);

  cLineStyle: array [0..4] of TPenStyle =
                  (psSolid, psDot, psDash, psDashDot, psDashDotDot);

  cLineStyleResNames: array [0..4] of String =
                   ('PPSTYLESOLID', 'PPSTYLEDOT', 'PPSTYLEDASH', 'PPSTYLEDASHDOT', 'PPSTYLEDASHDOTDOT');

  cLineThickness: array [0..12] of Single =
                  (0.125, 0.25, 0.5, 0.75, 1.0, 1.5, 2.25, 3.0, 4.5, 6.0, 3.0, 4.5, 6.0);

  cLineThicknessStyle: array [0..12] of TppLineStyleType =
                  (lsSingle, lsSingle, lsSingle, lsSingle, lsSingle, lsSingle, lsSingle,
                   lsSingle, lsSingle, lsSingle, lsDouble, lsDouble, lsDouble);

  cLineThicknessResNames: array [0..12] of String =
                   ('PPLINE18','PPLINE14', 'PPLINE12', 'PPLINE34', 'PPLINE1', 'PPLINE112', 'PPLINE214',
                    'PPLINE3', 'PPLINE412', 'PPLINE6', 'PPDOUBLELINE3', 'PPDOUBLELINE412', 'PPDOUBLELINE6');


  cAlignResNames: array [0..9] of String =
                   ('PPALIGNLEFTEDGES', 'PPALIGNVERTICALCENTERS', 'PPALIGNRIGHTEDGES',
                    'PPALIGNTOPEDGES',  'PPALIGNHORIZONTALCENTERS',  'PPALIGNBOTTOMEDGES',
                    'PPSPACEHORIZONTALLY', 'PPSPACEVERTICALLY',
                    'PPCENTERHORIZONTALLY', 'PPCENTERVERTICALLY');

 { cAlignHints: array [0..9] of String =
                   ('Align Left', 'Align Middle', 'Align Right',
                    'Align Top',  'Align Center',  'Align Bottom',
                    'Space Horizontally', 'Space Vertically',
                     'Center Horizontally in Band', 'Center Vertically in Band'); }

  cAlignHints: array [0..9] of Integer =
                   (103, 106, 104,
                    105, 102, 101,
                    113, 114,
                    107, 108);

  cSizeResNames: array [0..3] of String =
                   ('PPSHRINKWIDTH', 'PPGROWWIDTH', 'PPSHRINKHEIGHT', 'PPGROWHEIGHT');


 { cSizeHints: array [0..3] of String =
                   ('Shrink Width to Smallest',  'Grow Width to Largest',
                    'Shrink Height to Smallest', 'Grow Height to Largest'); }


  cSizeHints: array [0..3] of Integer = (112, 110, 111, 109);


  cNudgeResNames: array [0..3] of String =
                   ('PPNUDGEUP', 'PPNUDGEDOWN', 'PPNUDGELEFT', 'PPNUDGERIGHT');


 { cNudgeHints: array [0..3] of String =
                   ('Nudge Up', 'Nudge Down', 'Nudge Left', 'Nudge Right');}

  cNudgeHints: array [0..3] of Integer = (467, 468, 469, 470);


  cFontSizes: array [0..15] of Integer =
                    (8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36, 48, 72);



implementation

{design-time bitmaps}
{$R ppIDEBmp.res}

{design-time strings}
{$IFDEF WIN32}
{$R rbIDE.res}
{$ENDIF}

uses
  IniFiles;


{------------------------------------------------------------------------------}
{ ppSaveFontToIniFile}

procedure ppSaveFontToIniFile(aIniFile: TObject; aSection, aIdent: String; aFont: TFont);
var
{$IFDEF Delphi4}
  lIniFile: TCustomIniFile;
{$ELSE}
  lIniFile: TIniFile;
{$ENDIF}

begin
{$IFDEF Delphi4}

  if not (aIniFile is TCustomIniFile) then Exit;
  lIniFile := TCustomIniFile(aIniFile);

{$ELSE}
  if not (aIniFile is TIniFile) then Exit;
  lIniFile := TIniFile(aIniFile);
{$ENDIF}

  lIniFile.WriteString(aSection, aIdent + 'Name', aFont.Name);
  lIniFile.WriteInteger(aSection, aIdent + 'Size', aFont.Size);
  lIniFile.WriteInteger(aSection, aIdent + 'Color', aFont.Color);
  lIniFile.WriteInteger(aSection, aIdent + 'Charset', aFont.Charset);
  lIniFile.WriteBool(aSection, aIdent + 'Bold', (fsBold in aFont.Style));
  lIniFile.WriteBool(aSection, aIdent + 'Italic', (fsItalic in aFont.Style));
  lIniFile.WriteBool(aSection, aIdent + 'Underline', (fsUnderline in aFont.Style));
  lIniFile.WriteBool(aSection, aIdent + 'StrikeOut', (fsStrikeOut in aFont.Style));


end; {procedure, ppSaveFontFromIniFile}

{------------------------------------------------------------------------------}
{ ppLoadFontFromIniFile}

procedure ppLoadFontFromIniFile(aIniFile: TObject; aSection, aIdent: String; aFont: TFont);
var
  lFontStyle: TFontStyles;
  
{$IFDEF Delphi4}
  lIniFile: TCustomIniFile;
{$ELSE}
  lIniFile: TIniFile;
{$ENDIF}

begin
{$IFDEF Delphi4}

  if not (aIniFile is TCustomIniFile) then Exit;
  lIniFile := TCustomIniFile(aIniFile);

{$ELSE}
  if not (aIniFile is TIniFile) then Exit;
  lIniFile := TIniFile(aIniFile);
{$ENDIF}


  aFont.Color := lIniFile.ReadInteger(aSection,aIdent + 'Color', clWindowText);
  aFont.Charset := lIniFile.ReadInteger(aSection, aIdent + 'Charset', DEFAULT_CHARSET);
  aFont.Name := lIniFile.ReadString(aSection, aIdent + 'Name', 'Arial');
  aFont.Size := lIniFile.ReadInteger(aSection, aIdent + 'Size', 12);

  lFontStyle := [];

  if lIniFile.ReadBool(aSection, aIdent + 'Bold', False) then
    Include(lFontStyle, fsBold);

  if lIniFile.ReadBool(aSection, aIdent + 'Italic', False) then
    Include(lFontStyle, fsItalic);

  if lIniFile.ReadBool(aSection, aIdent + 'Underline', False) then
    Include(lFontStyle, fsUnderline);

   if lIniFile.ReadBool(aSection, aIdent + 'StrikeOut', False) then
     Include(lFontStyle, fsStrikeOut);

   aFont.Style := lFontStyle;

end; {procedure, ppLoadFontFromIniFile}


{------------------------------------------------------------------------------}
{ ppRemoveSpacesFromString}

function ppRemoveSpacesFromString(aString: String): String;
begin

  Result := aString;

  while Pos(' ', Result) > 0 do
    Delete(Result, Pos(' ', Result), 1);

end; {function, ppRemoveSpacesFromString}

{******************************************************************************
 *
 **  C u s t o m P a l e t t e B u t t o n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.Create}

constructor TppCustomPaletteButton.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FPaletteEnabled  := True;

  FPalette := nil;
  FInactiveTimer := TTimer.Create(nil);
  FInactiveTimer.Enabled  := False;
  FInactiveTimer.Interval := 5000;
  FInactiveTimer.OnTimer  := InactiveTimerEvent;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.Destroy}

destructor TppCustomPaletteButton.Destroy;
begin

  FPalette.Free;
  FInactiveTimer.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.GetDropDownPanel}

function TppCustomPaletteButton.GetDropDownPanel: TppDropDownPanel;
begin

  Result := FPalette;

  FInactiveTimer.Enabled := False;

  if (csDesigning in ComponentState) or (FPalette <> nil) then Exit;

  FPalette := CreatePalette;
  FPalette.Visible := False;

  if (Owner is TForm) then
    FPalette.Parent  := TForm(Owner);

  FPalette.PaletteEnabled := FPaletteEnabled;

  FPalette.OnButtonClick := PaletteButtonClickEvent;

  DropDownPanel := FPalette;

  Result := FPalette;

end; {procedure, GetDropDownPanel}

{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.DropDownPanelHideEvent}

procedure TppCustomPaletteButton.DropDownPanelHideEvent(Sender: TObject);
begin

  inherited DropDownPanelHideEvent(Sender);

  FInactiveTimer.Enabled := True;


end; {procedure, DropDownPanelHideEvent}


{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.InactiveTimerEvent}

procedure TppCustomPaletteButton.InactiveTimerEvent(Sender: TObject);
begin

  if Active then Exit;

  FInactiveTimer.Enabled := False;

  FreePalette;

end; {procedure, InactiveTimerEvent}



{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.FreePalette}

procedure TppCustomPaletteButton.FreePalette;
begin
  {default behavior - but may be overridden by descendants}
  DropDownPanel := nil;
  FPalette.Free;
  FPalette := nil;

end; {procedure, FreePalette}

{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.SetPaletteEnabled}

procedure TppCustomPaletteButton.SetPaletteEnabled(aValue: Boolean);
begin

  if (FPaletteEnabled = aValue) then Exit;

  FPaletteEnabled := aValue;

  if FPalette <> nil then
    FPalette.PaletteEnabled := aValue

end; {procedure, SetPaletteEnabled}

{------------------------------------------------------------------------------}
{ TppCustomPaletteButton.PaletteButtonClickEvent}

procedure TppCustomPaletteButton.PaletteButtonClickEvent(Sender: TObject);
begin

  if Assigned(FOnPaletteButtonClick) then FOnPaletteButtonClick(Self);

end; {procedure, PaletteButtonClickEvent}


{******************************************************************************
 *
 ** L i n e S t y l e B u t t o n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppLineStyleButton.Create}

constructor TppLineStyleButton.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  SetLineStyle(psSolid);

  Glyph.Handle := ppBitmapFromResource('PPLINESTYLE');

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppLineStyleButton.CreatePalette}

function TppLineStyleButton.CreatePalette: TppCustomPalette;
begin
  Result := TppLineStylePalette.Create(Owner);
  TppLineStylePalette(Result).CurrentLineStyle := FLineStyle;

end; {procedure, CreatePalette}



{------------------------------------------------------------------------------}
{ TppLineStyleButton.PaletteButtonClickEvent}

procedure TppLineStyleButton.PaletteButtonClickEvent(Sender: TObject);
begin

  FLineStyle := TppLineStylePalette(FPalette).CurrentLineStyle;

  inherited PaletteButtonClickEvent(Self);

end; {procedure, PaletteButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppLineStyleButton.SetLineStyle}

procedure TppLineStyleButton.SetLineStyle(aLineStyle: TPenStyle);
begin
  FLineStyle := aLineStyle;

  if (FPalette <> nil) then
    TppLineStylePalette(FPalette).CurrentLineStyle := FLineStyle;

end; {procedure, SetCurrentLineStyle}



{******************************************************************************
 *
 ** L i n e T h i c k n e  s s B u t t o n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppLineThicknessButton.Create}

constructor TppLineThicknessButton.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  SetLineThickness(0.75);
  SetLineStyle(lsSingle);

  Glyph.Handle := ppBitmapFromResource('PPLINETHICKNESS');

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppLineThicknessButton.CreatePalette}

function TppLineThicknessButton.CreatePalette: TppCustomPalette;
begin
  Result := TppLineThicknessPalette.Create(Owner);
  TppLineThicknessPalette(Result).CurrentLineStyle := FLineStyle;
  TppLineThicknessPalette(Result).CurrentLineThickness := FLineThickness;


end; {procedure, CreatePalette}


{------------------------------------------------------------------------------}
{ TppLineThicknessButton.PaletteButtonClickEvent}

procedure TppLineThicknessButton.PaletteButtonClickEvent(Sender: TObject);
begin

  FLineStyle     := TppLineThicknessPalette(FPalette).CurrentLineStyle;
  FLineThickness := TppLineThicknessPalette(FPalette).CurrentLineThickness;

  inherited PaletteButtonClickEvent(Self);

end; {procedure, PaletteButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppLineThicknessButton.SetCurrentLineStyle}

procedure TppLineThicknessButton.SetLineStyle(aLineStyle: TppLineStyleType);
begin

  if (FLineStyle = aLineStyle) then Exit;

  FLineStyle := aLineStyle;

  if (FPalette <> nil) then
    TppLineThicknessPalette(FPalette).CurrentLineStyle := FLineStyle;

end; {procedure, SetLineStyle}


{------------------------------------------------------------------------------}
{ TppLineThicknessButton.SetLineThickness}

procedure TppLineThicknessButton.SetLineThickness(aLineThickness: Single);
begin

  if (FLineThickness = aLineThickness) then Exit;

  FLineThickness := aLineThickness;

  if (FPalette <> nil) then
    TppLineThicknessPalette(FPalette).CurrentLineThickness := FLineThickness;

end; {procedure, SetLineThickness}



{******************************************************************************
 *
 ** F o n t B u t t o n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFontButton.Create}

constructor TppFontButton.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FCurrentFont := TFont.Create;

  FFontAttributeType := faFontName;


end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppFontButton.Destroy}

destructor TppFontButton.Destroy;
begin

  FCurrentFont.Free;

  inherited Destroy;

end; {destructor, Destroy}



{------------------------------------------------------------------------------}
{ TppFontButton.Click}

procedure TppFontButton.Click;
var
  lFontDialog: TppPrinterFontDialog;

begin

  lFontDialog := TppPrinterFontDialog.Create(Self);
  lFontDialog.Font := FCurrentFont;
  lFontDialog.Printer := ppPrinter;
  
  if lFontDialog.Execute then
    SetCurrentFont(lFontDialog.Font);

  lFontDialog.Free;

  inherited Click;

end; {procedure, Click}


{------------------------------------------------------------------------------}
{ TppFontButton.SetCurrentFont}

procedure TppFontButton.SetCurrentFont(aFont: TFont);
begin
  FCurrentFont.Assign(aFont);

end; {procedure, SetFont}


{------------------------------------------------------------------------------}
{ TppFontButton.SetFontAttributeType}

procedure TppFontButton.SetFontAttributeType(aValue: TppFontAttributeType);
begin

  FFontAttributeType := aValue;

  if FFontAttributeType = faFontName then

    Glyph.Handle := ppBitmapFromResource('PPFONTNAME')
  else
    Glyph.Handle := ppBitmapFromResource('PPFONTSIZE');


end; {procedure, SetFontAttributeType}



{******************************************************************************
 *
 **  C o l o r B u t t o n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppColorButton.Create}

constructor TppColorButton.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDefaultColor   := clWindowText;
  FIsClear        := False;
  FPaletteColor   := FDefaultColor;
  FPaletteIsClear := FIsClear;

  FPaletteEnabled := True;
  FLanguageIndex  := 0;

  FColorPalette := nil;
  FPopupMenu := TPopupMenu.Create(Self);

  FOnPaletteColorChange := nil;

  DropDownCombo := True;
  DropDownArrow := True;
  DropDownMenu  := FPopupMenu;

  SetColorType(ctFont);

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppColorButton.Destroy}

destructor TppColorButton.Destroy;
begin

  FPopupMenu.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppColorButton.CreatePalette}

function TppColorButton.CreatePalette: TppCustomPalette;
begin
  FColorPalette := TppColorPalette.Create(Owner);

  FColorPalette.PaletteType   := TppColorPaletteType(FColorType);
  FColorPalette.CurrentColor  := FPaletteColor;
  FColorPalette.IsClear       := FPaletteIsClear;
  FColorPalette.OnColorChange := PaletteColorChangeEvent;
  FColorPalette.LanguageIndex := LanguageIndex;

  Result := FColorPalette;

end; {procedure, CreatePalette}

{------------------------------------------------------------------------------}
{ TppColorButton.FreePalette}

procedure TppColorButton.FreePalette;
begin

  {do not free palette if tool window exists}
  if (Palette.ToolWindow = nil) or not (Palette.ToolWindow.Visible) then
    begin
      FColorPalette := nil;
      inherited FreePalette;
    end;

end; {procedure, FreePalette}


{------------------------------------------------------------------------------}
{ TppColorButton.DrawButtonGlyph}

procedure TppColorButton.DrawButtonGlyph(aColor: TColor);
begin

  Glyph.Canvas.Brush.Style := bsSolid;

  if FIsClear then
    Glyph.Canvas.Brush.Color := clBtnFace
  else
    Glyph.Canvas.Brush.Color := aColor;

  Glyph.Canvas.FillRect(Rect(0, 12, 16, 16));

  Invalidate;

end; {procedure, DrawButtonGlyph}


{------------------------------------------------------------------------------}
{ TppColorButton.SetColorType}

procedure TppColorButton.SetColorType(aColorType: TppColorButtonType);
begin

  FColorType := aColorType;
  
  case aColorType of

    ctFont:
      begin
        Glyph.Handle     := ppBitmapFromResource('PPFONTCOLOR');
        GlyphMask.Handle := ppBitmapFromResource('PPFONTCOLORMASK');
      end;

    ctHighlight:
      begin
        Glyph.Handle     := ppBitmapFromResource('PPHIGHLIGHTCOLOR');
        GlyphMask.Handle := ppBitmapFromResource('PPHIGHLIGHTCOLORMASK');
      end;

    ctFill:
      begin
        Glyph.Handle     := ppBitmapFromResource('PPFILLCOLOR');
        GlyphMask.Handle := ppBitmapFromResource('PPFILLCOLORMASK');
      end;

    ctLine:
      begin
        Glyph.Handle     := ppBitmapFromResource('PPLINECOLOR');
        GlyphMask.Handle := ppBitmapFromResource('PPLINECOLORMASK');
      end;


  end;

  if (FColorPalette <> nil) then
    FColorPalette.PaletteType := TppColorPaletteType(Ord(aColorType));

  {load lang strings for hints}
  SetLanguageIndex(FLanguageIndex);

  DrawButtonGlyph(FDefaultColor);

end; {procedure, SetColorType}


{------------------------------------------------------------------------------}
{ TppColorButton.PaletteColorChangeEvent}

procedure TppColorButton.PaletteColorChangeEvent(Sender: TObject);
begin

  if FColorPalette = nil then Exit;

  FPaletteColor    := FColorPalette.CurrentColor;
  FPaletteIsClear  := FColorPalette.IsClear;
  FDefaultColor    := FColorPalette.CurrentColor;
  FIsClear         := FColorPalette.IsClear;

  DrawButtonGlyph(FDefaultColor);

  if Assigned(FOnPaletteColorChange) then FOnPaletteColorChange(Self);

end; {procedure, PaletteColorChangeEvent}


{------------------------------------------------------------------------------}
{ TppColorButton.GetDefaultColor}

procedure TppColorButton.GetDefaultColor(var aColor: TColor; var aIsClear: Boolean);
begin
  aColor   := FDefaultColor;
  aIsClear := FIsClear;

end; {procedure, GetDefaultColor}


{------------------------------------------------------------------------------}
{ TppColorButton.GetPaletteColor}

procedure TppColorButton.GetPaletteColor(var aColor: TColor; var aIsClear: Boolean);
begin

  aColor   := FPaletteColor;
  aIsClear := FPaletteIsClear;

end; {procedure, GetPaletteColor}

{------------------------------------------------------------------------------}
{ TppColorButton.SetDefaultColor}

procedure TppColorButton.SetDefaultColor(aColor: TColor; aIsClear: Boolean);
begin

  FDefaultColor := aColor;
  FIsClear      := aIsClear;

  DrawButtonGlyph(FDefaultColor);

end; {procedure, SetDefaultColor}

{------------------------------------------------------------------------------}
{ TppColorButton.SetPaletteColor}

procedure TppColorButton.SetPaletteColor(aColor: TColor; aIsClear: Boolean);
begin

  FPaletteColor   := aColor;
  FPaletteIsClear := aIsClear;

  if (FColorPalette = nil) then Exit;

  if (FColorPalette.CurrentColor <> aColor) then
    FColorPalette.CurrentColor := aColor;

  if (FColorPalette.IsClear <> aIsClear) then
    FColorPalette.IsClear := aIsClear;

end; {procedure, SetPaletteColor}


{------------------------------------------------------------------------------}
{ TppColorButton.SetLanguageIndex}

procedure TppColorButton.SetLanguageIndex(aLanguageIndex: Longint);
begin

  FLanguageIndex := aLanguageIndex;

  case FColorType of

    ctFont:
      Hint := ppLoadStr(480);  {Font Color}

    ctHighlight:
      Hint := ppLoadStr(481);  {Highlight Color}

    ctFill:
      Hint := ppLoadStr(482);  {Fill Color}

    ctLine:
      Hint := ppLoadStr(483);  {Line Color}

  end;

  if (FColorPalette <> nil) then
    FColorPalette.LanguageIndex :=  aLanguageIndex


end; {procedure, SetLanguageIndex}

{******************************************************************************
 *
 **  C u s t o m P a l e t t e
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomPalette.Create}

constructor TppCustomPalette.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FButtons        := TList.Create;
  FPaletteEnabled := True;

  FOnButtonClick  := nil;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppCustomPalette.Destroy}

destructor TppCustomPalette.Destroy;
begin

  FButtons.Free;

  inherited Destroy;

end; {destructor, Destroy}



{------------------------------------------------------------------------------}
{ TppCustomPalette.DrawButtonGlyph}

procedure TppCustomPalette.DrawButtonGlyph(aButton: TppToolbarButton);
begin

end; {procedure, DrawButtonGlyph}


{------------------------------------------------------------------------------}
{ TppCustomPalette.AddButton}

function TppCustomPalette.AddButton(aButton: TppToolbarButton): Integer;
begin
  aButton.OnClick := ButtonClickEvent;
  Result := FButtons.Add(aButton);

end; {function, AddButton}

{------------------------------------------------------------------------------}
{ TppCustomPalette.GetButton}

function TppCustomPalette.GetButton(aIndex: Integer): TppToolbarButton;
begin
  Result := TppToolbarButton(FButtons[aIndex]);

end; {function, GetColorButton}

{------------------------------------------------------------------------------}
{ TppCustomPalette.GetButtonCount}

function TppCustomPalette.GetButtonCount: Integer;
begin
  Result := FButtons.Count;

end; {function, GetButtonCount}


{------------------------------------------------------------------------------}
{ TppCustomPalette.SetPaletteEnabled}

procedure TppCustomPalette.SetPaletteEnabled(aValue: Boolean);
begin

  if  (FPaletteEnabled = aValue) then Exit;

  FPaletteEnabled := aValue;

  if Visible then
    EnablePalette(aValue);

end;{function, SetPaletteEnabled}


{------------------------------------------------------------------------------}
{ TppCustomPalette.EnablePalette}

procedure TppCustomPalette.EnablePalette(aValue: Boolean);
var
  liButton: Integer;

begin

{$IFDEF WIN32}  {note: D1 cannot properly draw disabled glyphs for Win3.1}
  if (FButtons.Count = 0) or Buttons[0].Enabled = aValue then Exit;

  for liButton := 0 to FButtons.Count-1 do
    Buttons[liButton].Enabled := aValue;

{$ENDIF}

end; {procedure, EnablePalette}



{------------------------------------------------------------------------------}
{ TppCustomPalette.ButtonClickEvent}

procedure TppCustomPalette.ButtonClickEvent(Sender: TObject);
begin

  if Assigned(FOnButtonClick) then FOnButtonClick(Sender);

  Visible := False;

end; {procedure, ButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppCustomPalette.CMVisibleChanged}

procedure TppCustomPalette.CMVisibleChanged (var Message: TMessage);
begin

  VisibleChanged;

  inherited;

end; {procedure, CMVisibleChanged}


{------------------------------------------------------------------------------}
{ TppCustomPalette.VisibleChanged}

procedure TppCustomPalette.VisibleChanged;
begin

  if Visible then
    EnablePalette(FPaletteEnabled);

end; {procedure, VisibleChanged}



{******************************************************************************
 *
 **  L i n e S t y l e P a l e t t e
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppLineStylePalette.Create}

constructor TppLineStylePalette.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FCurrentLineStyle := psSolid;

  Height := 77;
  Width  := 104;

  CreateControls;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppLineStylePalette.Destroy}

destructor TppLineStylePalette.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppLineStylePalette.CreateControls}

procedure TppLineStylePalette.CreateControls;
var
  liTop: Integer;
  liButton: Integer;
  lButton: TppToolbarButton;

begin


  {create the line style buttons: 1 col of 5 buttons}
  liTop  := 3;

  for liButton := 0 to 4 do
    begin

      {create button}
      lButton := TppToolbarButton.Create(nil);
      lButton.SetBounds(3, liTop, 98, 14);
      lButton.GroupIndex := 1;
      lButton.Tag := liButton;
      lButton.Parent := Self;

      {load button glyph}
      lButton.Glyph.Handle := ppBitmapFromResource(cLineStyleResNames[liButton]);

      AddButton(lButton);

      Inc(liTop, lButton.Height);

    end; {for each button}


end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppLineStylePalette.ButtonClickEvent}

procedure TppLineStylePalette.ButtonClickEvent(Sender: TObject);
begin

  FCurrentLineStyle := cLineStyle[TppToolbarButton(Sender).Tag];

  inherited ButtonClickEvent(Sender);

end;  {procedure, ButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppLineStylePalette.SetCurrentLineStyle}

procedure TppLineStylePalette.SetCurrentLineStyle(aLineStyle: TPenStyle);
var
  liButton: Integer;
  
begin

  if (FCurrentLineStyle = aLineStyle) then Exit;

  FCurrentLineStyle := aLineStyle;

  for liButton := 0 to ButtonCount-1 do
    if cLineStyle[liButton] = aLineStyle then
      Buttons[liButton].Down := True;

  Invalidate;
  
end;  {procedure, SetCurrentLineStyle}



{******************************************************************************
 *
 **  L i n e T h i c k n e s s P a l e t t e
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.Create}

constructor TppLineThicknessPalette.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  {0.75 is one screen pixel (if screen res is 96 ppi) }
  FCurrentLineThickness := 0.75;
  FCurrentLineStyle     := lsSingle;

  Height := 215;
  Width  := 134;

  CreateControls;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.Destroy}

destructor TppLineThicknessPalette.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.CreateControls}

procedure TppLineThicknessPalette.CreateControls;
var
  liTop: Integer;
  liButton: Integer;
  lButton: TppToolbarButton;

begin


  {create the line width buttons: 1 col of 12 buttons}
  liTop  := 3;

  for liButton := 0 to 12 do
    begin

      {create button}
      lButton := TppToolbarButton.Create(Self);
      lButton.SetBounds(3, liTop, 128, 16);
      lButton.GroupIndex := 1;
      lButton.Tag := liButton;
      lButton.Parent := Self;

      {load button glyph}
      lButton.Glyph.Handle := ppBitmapFromResource(cLineThicknessResNames[liButton]);

      AddButton(lButton);

      Inc(liTop, lButton.Height);

    end; {for each button}


end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.ButtonClickEvent}

procedure TppLineThicknessPalette.ButtonClickEvent(Sender: TObject);
begin

  FCurrentLineThickness := cLineThickness[TppToolbarButton(Sender).Tag];
  FCurrentLineStyle     := cLineThicknessStyle[TppToolbarButton(Sender).Tag];

  inherited ButtonClickEvent(Sender);

end;  {procedure, ButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.UpdateButtonStates}

procedure TppLineThicknessPalette.UpdateButtonStates;
var
  liButton: Integer;

begin

  for liButton := 0 to ButtonCount-1 do
    if (cLineThickness[liButton]      = FCurrentLineThickness) and
       (cLineThicknessStyle[liButton] = FCurrentLineStyle) then
      Buttons[liButton].Down := True
    else
      Buttons[liButton].Down := False;

  Invalidate;

end;  {procedure, UpdateButtonStates}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.SetCurrentLineThickness}

procedure TppLineThicknessPalette.SetCurrentLineThickness(aLineThickness: Single);
begin

  if (FCurrentLineThickness = aLineThickness) then Exit;

  FCurrentLineThickness := aLineThickness;

  UpdateButtonStates;

end;  {procedure, SetCurrentLineThickness}


{------------------------------------------------------------------------------}
{ TppLineThicknessPalette.SetCurrentLineStyle}

procedure TppLineThicknessPalette.SetCurrentLineStyle(aLineStyle: TppLineStyleType);
begin

  if (FCurrentLineStyle = aLineStyle) then Exit;

  FCurrentLineStyle := aLineStyle;

  UpdateButtonStates;

end;  {procedure, SetCurrentLineStyle}

{******************************************************************************
 *
 **  C o l o r P a l e t t e
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppColorPalette.Create}

constructor TppColorPalette.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FLanguageIndex := 0;

  FColorButtons   := TList.Create;
  FTWColorButtons := TList.Create;

  FPaletteEnabled := True;

  Width :=  150;
  Height := 103;
  CreateControls;

  FAutoButton.Down := True;

  TearAway := True;
 
end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppColorPalette.Destroy}

destructor TppColorPalette.Destroy;
begin

  FAutoGlyph.Free;
  FColorButtons.Free;
  FTWColorButtons.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppColorPalette.CreateControls}

procedure TppColorPalette.CreateControls;
var
  liLeft, liTop: Integer;
  liButton: Integer;
  lColorButton: TppToolbarButton;
  lBevel: TBevel;
  liDesignFontHeight: Integer;
  liCurrentFontHeight: Integer;
  lfScale: Single;
  liAutoHeight: Integer;
  liAutoBottom: Integer;
  lFont: TFont;

begin

  {check for large fonts anc scale accordingly}
  liDesignFontHeight := 11;

  if (Parent is TForm) then
    lFont := TForm(Parent).Font
  else if (Owner is TForm) then
    lFont := TForm(Owner).Font
  else
    lFont := Font;

  liCurrentFontHeight := Round(lFont.Size * Screen.PixelsPerInch / 72);

  if liDesignFontHeight = liCurrentFontHeight then
    lfScale := 1
  else
    lfScale := liCurrentFontHeight / liDesignFontHeight;


  liAutoHeight := Round(23 * lfScale);

  {create the auto button }
  FAutoButton := TppToolbarButton.Create(nil);
  FAutoButton.SetBounds(3, 2, 144, liAutoHeight);
  FAutoButton.GroupIndex := 1;
  FAutoButton.AllowAllUp := True;
  FAutoButton.OnClick := AutoButtonClickEvent;
  FAutoButton.Parent := Self;

  FAutoGlyph        := TBitmap.Create;
  FAutoGlyph.Width  := FAutoButton.Width-2;
  FAutoGlyph.Height := FAutoButton.Height-2;


  DrawAutoButtonGlyph(clWindowText);

  liAutoBottom := FAutoButton.Top + FAutoButton.Height;

  {create the more colors button}
  FMoreColorsButton := TppToolbarButton.Create(nil);
  FMoreColorsButton.SetBounds(3, liAutoBottom + 47, 142, liAutoHeight);
  FMoreColorsButton.OnClick := MoreColorsButtonClickEvent;
  FMoreColorsButton.Parent := Self;

  {create the color buttons: 2 rows of 8 buttons}
  liLeft := 3;
  liTop  := liAutoBottom + 4;

  for liButton := Low(cStdColors) to High(cStdColors) do
    begin

      {create color button}
      lColorButton := TppToolbarButton.Create(nil);
      lColorButton.SetBounds(liLeft, liTop, 18, 18);
      lColorButton.GroupIndex := 1;
      lColorButton.AllowAllUp := True;
      lColorButton.OnClick    := ColorButtonClickEvent;
      lColorButton.Tag        := cStdColors[liButton];
      lColorButton.Parent := Self;

      lColorButton.Glyph.Handle := ppBitmapFromResource('PPPALETTECOLORBOX');
      lColorButton.GlyphMask.Handle := ppBitmapFromResource('PPPALETTECOLORBOXMASK');
      lColorButton.NumGlyphs := 2;
      {draw color glyph}
      DrawColorButtonGlyph(lColorButton.Glyph, cStdColors[liButton]);


      FColorButtons.Add(lColorButton);

      Inc(liLeft, lColorButton.Width);

      {after the 8th button, start a new row}
      if (liButton = 7) then
        begin
          Inc(liTop, lColorButton.Height);
          liLeft := 3;
        end;

    end; {for each color button}

   lBevel := TBevel.Create(nil);
   lBevel.Shape  := bsTopLine;
   lBevel.SetBounds(3, liAutoBottom + 43, Width-6, 3);
   lBevel.Parent := Self;


  ClientHeight := FMoreColorsButton.Top + FMoreColorsButton.Height + 3;

  {load language strings}
  SetLanguageIndex(FLanguageIndex);


end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppColorPalette.DrawAutoButtonGlyph}

procedure TppColorPalette.DrawAutoButtonGlyph(aColor: TColor);

var
  liLeft: Integer;
  liTop: Integer;
  liSide: Integer;

begin

{$IFDEF Delphi3}
  FAutoGlyph.TransparentColor := clWhite;
{$ENDIF}

  {erase prior button caption etc.}
  FAutoGlyph.Canvas.Brush.Style := bsSolid;
  FAutoGlyph.Canvas.Brush.Color := clWhite;
  FAutoGlyph.Canvas.FillRect(Rect(0,0,FAutoGlyph.Width, FAutoGlyph.Height));


  {draw a gray frame to outline the button}
  FAutoGlyph.Canvas.Brush.Style := bsSolid;
  FAutoGlyph.Canvas.Brush.Color := clGray;
  FAutoGlyph.Canvas.FrameRect(Rect(2,2,FAutoGlyph.Width-3, FAutoGlyph.Height-2));

  if (FPaletteType = ptFont) then
    begin
      liSide := FAutoGlyph.Height-5;

      {draw a gray frame to outline the color}
      FAutoGlyph.Canvas.FrameRect(Rect(5,4,liSide, liSide));

      if not FPaletteEnabled then
        aColor := clWhite;

      Dec(liSide);

      {draw the windows text color}
      FAutoGlyph.Canvas.Brush.Color := aColor;
      FAutoGlyph.Canvas.FillRect(Rect(6,5,liSide, liSide));
    end;

  {draw the text}
  FAutoGlyph.Canvas.Brush.Style := bsClear;
  FAutoGlyph.Canvas.Font.Name  := 'MS Sans Serif';
  FAutoGlyph.Canvas.Font.Size  := 8;

  liLeft := (FAutoGlyph.Width  - Canvas.TextWidth(FAutoCaption)) div 2;
  liTop  := (FAutoGlyph.Height - Canvas.TextHeight(FAutoCaption)) div 2;

  FAutoGlyph.Canvas.TextOut(liLeft, liTop, FAutoCaption);

  FAutoButton.Glyph := FAutoGlyph;

end; {procedure, DrawAutoButtonGlyph}


{------------------------------------------------------------------------------}
{ TppColorPalette.DrawColorButtonGlyph}

procedure TppColorPalette.DrawColorButtonGlyph(aGlyph: TBitmap; aColor: TColor);
begin

  aGlyph.Canvas.Brush.Style := bsSolid;

  aGlyph.Canvas.Brush.Color := aColor;

  aGlyph.Canvas.FillRect(Rect(1,1,11, 11));

end; {procedure, DrawColorButtonGlyph}


{------------------------------------------------------------------------------}
{ TppColorPalette.GetColorButton}

function TppColorPalette.GetColorButton(aIndex: Integer): TppToolbarButton;
begin

  Result := TppToolbarButton(FColorButtons[aIndex]);

end; {function, GetColorButton}


{------------------------------------------------------------------------------}
{ TppColorPalette.SetPaletteEnabled}

procedure TppColorPalette.SetPaletteEnabled(aValue: Boolean);
begin

  if (FPaletteEnabled = aValue) then Exit;

  FPaletteEnabled := aValue;

  if Visible then
    EnablePalette(aValue);

  UpdateToolWindowState;


end;{function, SetPaletteEnabled}



{------------------------------------------------------------------------------}
{ TppColorPalette.EnablePalette}

procedure TppColorPalette.EnablePalette(aValue: Boolean);
var
  liButton: Integer;

begin

{$IFDEF WIN32}  {note: D1 cannot properly draw disabled glyphs for Win3.1}

  if (FMoreColorsButton.Enabled = aValue) then Exit;

  FMoreColorsButton.Enabled := aValue;

  DrawAutoButtonGlyph(clWindowText);
  FAutoButton.Enabled := aValue;


  for liButton := 0 to FColorButtons.Count-1 do
    ColorButtons[liButton].Enabled := aValue;

{$ENDIF}


end; {procedure, EnablePalette}



{------------------------------------------------------------------------------}
{ TppColorPalette.VisibleChanged}

procedure TppColorPalette.VisibleChanged;
var
  liButton: Integer;
  
begin

  if Visible then
    begin

      EnablePalette(FPaletteEnabled);

      {set button down}
      if (FPaletteType = ptFont) then
        FAutoButton.Down := (FCurrentColor = clWindowText)
      else
        FAutoButton.Down := FIsClear;


      for liButton := 0 to FColorButtons.Count-1 do
         ColorButtons[liButton].Down := (not (FAutoButton.Down)) and
                                        (ColorButtons[liButton].Tag = FCurrentColor);

    end;



end; {procedure, VisibleChanged}

{------------------------------------------------------------------------------}
{ TppColorPalette.SetCurrentColor}

procedure TppColorPalette.SetCurrentColor(aColor: TColor);
begin

  if (FCurrentColor = aColor) then Exit;

  FCurrentColor := aColor;

  UpdateToolWindowState;

end; {procedure, SetCurrentColor}


{------------------------------------------------------------------------------}
{ TppColorPalette.SetIsClear}

procedure TppColorPalette.SetIsClear(aValue: Boolean);
begin

  if (FIsClear = aValue) then Exit;

  FIsClear := aValue;

  UpdateToolWindowState;
  
end; {procedure, SetCurrentColor}

{------------------------------------------------------------------------------}
{ TppColorPalette.SetPaletteType}

procedure TppColorPalette.SetPaletteType(aPaletteType: TppColorPaletteType);
begin

  FPaletteType := aPaletteType;

  FIsClear      := (FPaletteType <> ptFont);
  FCurrentColor := clWindowText;

  {load button strings}
  SetLanguageIndex(LanguageIndex);

  if Assigned(FOnColorChange) then FOnColorChange(Self);


end; {procedure, SetPaletteType}

{------------------------------------------------------------------------------}
{ TppColorPalette.SetAutoCaption}

procedure  TppColorPalette.SetAutoCaption(aCaption: String);
begin

  if (FAutoCaption = aCaption) then Exit;

  FAutoCaption := aCaption;

  DrawAutoButtonGlyph(clWindowText);

end; {procedure, SetAutoCaption}

{------------------------------------------------------------------------------}
{ TppColorPalette.SetMoreColorsCaption}

procedure  TppColorPalette.SetMoreColorsCaption(aCaption: String);
begin

  if (FMoreColorsCaption = aCaption) then Exit;

  FMoreColorsCaption := aCaption;
  FMoreColorsButton.Caption := FMoreColorsCaption;

end; {procedure, SetMoreColorsCaption}


{------------------------------------------------------------------------------}
{ TppColorPalette.ColorButtonClickEvent}

procedure TppColorPalette.ColorButtonClickEvent(Sender: TObject);

begin

  FIsClear := False;

  FCurrentColor := TColor(TppColorButton(Sender).Tag);

  if Assigned(FOnColorChange) then FOnColorChange(Sender);

  if Visible then
    Visible := False;


  UpdateToolWindowState;

  
end; {procedure, ColorButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppColorPalette.MoreColorsButtonClickEvent}

procedure TppColorPalette.MoreColorsButtonClickEvent(Sender: TObject);
var
  lColor: TColor;

begin

  if ShowColorDialog(lColor) then
    begin
      FIsClear := False;

      SetCurrentColor(lColor);
    end;

  if Visible then
    Visible := False;


  if Assigned(FOnColorChange) then FOnColorChange(Sender);

end; {procedure, MoreColorsButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppColorPalette.AutoButtonClickEvent}

procedure TppColorPalette.AutoButtonClickEvent(Sender: TObject);
begin

  FIsClear := (FPaletteType <> ptFont);

  if (FPaletteType = ptFont) then
    FCurrentColor := clWindowText
  else
    FCurrentColor := clWindow;

  if Visible then
    begin
      UpdateToolWindowState;

      Visible := False;
    end;


  if Assigned(FOnColorChange) then FOnColorChange(Sender);


end; {procedure, AutoButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppColorPalette.ShowColorDialog}

function TppColorPalette.ShowColorDialog(var aColor: TColor): Boolean;
var
  ldlgColor: TColorDialog;

begin

  {create color dialog}
  ldlgColor := TColorDialog.Create(Self);

  Result := ldlgColor.Execute;

  if Result then
    {convert color to long int}
    aColor := ColorToRGB(ldlgColor.Color);

  ldlgColor.Free;

end;  {procedure, ShowColorDialog}


{------------------------------------------------------------------------------}
{ TppColorPalette.CreateToolWindow}

procedure TppColorPalette.CreateToolWindow;
var
  lButton: TppToolbarButton;
  liControl: Integer;

begin

  inherited CreateToolWindow;

  FTWAutoButton       :=  TppToolbarButton(ToolWindow.Controls[0]);
  FTWMoreColorsButton :=  TppToolbarButton(ToolWindow.Controls[1]);

  FTWAutoButton.OnClick := AutoButtonClickEvent;
  FTWMoreColorsButton.OnClick := MoreColorsButtonClickEvent;

  for liControl := 2 to ToolWindow.ControlCount-1 do
    if (ToolWindow.Controls[liControl] is TppToolbarButton) then
      begin
        lButton :=  TppToolbarButton(ToolWindow.Controls[liControl]);
        lButton.OnClick := ColorButtonClickEvent;
        FTWColorButtons.Add(lButton);
      end;


  {initialize tool window caption}
  SetLanguageIndex(FLanguageIndex);

end; {procedure, CreateToolWindow}


{------------------------------------------------------------------------------}
{ TppColorPalette.ActivateToolWindow}

procedure TppColorPalette.ActivateToolWindow;
begin

  inherited ActivateToolWindow;

  UpdateToolWindowState;


end; {procedure, ActivateToolWindow}


{------------------------------------------------------------------------------}
{ TppColorPalette.UpdateToolWindowState}

procedure TppColorPalette.UpdateToolWindowState;
var
  liButton: Integer;
  lButton: TppToolbarButton;

begin

  if (ToolWindow = nil) or not ToolWindow.Visible then Exit;

  {set button down}
  if (FPaletteType = ptFont) then
    FTWAutoButton.Down := (FCurrentColor = clWindowText)
  else
    FTWAutoButton.Down := FIsClear;

{$IFDEF WIN32}      {note: D1 cannot draw disabled glyphs on Win3.1}
  FTWAutoButton.Enabled       :=  FPaletteEnabled;
  FTWMoreColorsButton.Enabled :=  FPaletteEnabled;
{$ENDIF}

  FTWMoreColorsButton.Caption := FMoreColorsCaption;

  DrawAutoButtonGlyph(clWindowText);
  FTWAutoButton.Glyph.Canvas.Draw(0,0,FAutoButton.Glyph);

  for liButton := 0 to FTWColorButtons.Count-1 do
    begin
      lButton := TppToolbarButton(FTWColorButtons[liButton]);

      lButton.Down := (not FTWAutoButton.Down) and
                                        (lButton.Tag = FCurrentColor);
{$IFDEF WIN32}
      lButton.Enabled := FPaletteEnabled;
{$ENDIF}
    end;

end; {procedure, UpdateToolWindowState}


{------------------------------------------------------------------------------}
{ TppColorPalette.SetLanguageIndex}

procedure TppColorPalette.SetLanguageIndex(aLanguageIndex: Longint);
begin

  FLanguageIndex := aLanguageIndex;

  TitleBarHint := ppLoadStr(207);   {drag to make window float}

  case FPaletteType of
    ptFont:
      begin
        SetAutoCaption(ppLoadStr(472))       {Automatic};
        SetMoreColorsCaption(ppLoadStr(473)) {More Font Colors...}
      end;

    ptHighlight:
      begin
        SetAutoCaption(ppLoadStr(474));       {None}
        SetMoreColorsCaption(ppLoadStr(475)); {More Highlight Colors...}
      end;

   ptFill:
      begin
        SetAutoCaption(ppLoadStr(476));       {No Fill}
        SetMoreColorsCaption(ppLoadStr(477)); {More Fill Colors...}
      end;

   ptLine:
      begin
        SetAutoCaption(ppLoadStr(478));       {No Line}
        SetMoreColorsCaption(ppLoadStr(479)); {More Line Colors...}
      end
   else
     FMoreColorsButton.Caption := 'More Colors...'; {currently not used}



  end; {case, PaletteType}


  if ToolWindow <> nil then
    begin
      UpdateToolWindowState;

      case FPaletteType of

        ptFont     : ToolWindow.Caption := (ppLoadStr(480)); {Font Color}

        ptHighlight: ToolWindow.Caption := (ppLoadStr(481)); {Highlight Color}

        ptFill     : ToolWindow.Caption := (ppLoadStr(482)); {Fill Color}

        ptLine     : ToolWindow.Caption := (ppLoadStr(483)); {Line Color}

      end;

    end;

end;  {procedure, SetLanguageIndex}


{******************************************************************************
 *
 **  F o n t C o  m b o B o x
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFontComboBox.Create}

constructor TppFontComboBox.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FPrinterName := '';

  FCurrentFont := TFont.Create;
  FFontList := nil;

  FTrueTypeGraphic    := TBitmap.Create;
  FPrinterGraphic     := TBitmap.Create;
  FSelPrinterGraphic  := TBitmap.Create;
  FSelTrueTypeGraphic := TBitmap.Create;

  InitializeFontGraphics;

  Style := csOwnerDrawVariable;
  Sorted := True;

  {attache event handlers}
  OnDrawItem    := DrawItemEvent;
  OnDropDown    := DropDownEvent;
  OnMeasureItem := MeasureItemEvent;


end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppFontComboBox.Destroy}

destructor TppFontComboBox.Destroy;
begin

  FCurrentFont.Free;
  FFontList.Free;

  FTrueTypeGraphic.Free;
  FSelTrueTypeGraphic.Free;
  FPrinterGraphic.Free;
  FSelPrinterGraphic.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppFontComboBox.InitializeFontGraphics }

procedure TppFontComboBox.InitializeFontGraphics;
begin

  {create true type font graphics (normal and selected}
  FTrueTypeGraphic.Handle    := ppBitmapFromResource('PPTRUETYPEFONT');
  FSelTrueTypeGraphic.Handle := ppBitmapFromResource('PPTRUETYPEFONT');

  {fill white space in bitmap with the Window's Highlight color}
  FSelTrueTypeGraphic.Canvas.Brush.Color := clHighlight;
  FSelTrueTypeGraphic.Canvas.Brush.Style := bsSolid;
  FSelTrueTypeGraphic.Canvas.FloodFill(0,0,clWhite,fsSurface);
  FSelTrueTypeGraphic.Canvas.FloodFill(7,7,clWhite,fsSurface);
  FSelTrueTypeGraphic.Canvas.FloodFill(6,2,clWhite,fsSurface);


  {create printer font graphics (normal and selected) }
  FPrinterGraphic.Handle    := ppBitmapFromResource('PPPRINTERFONT');
  FSelPrinterGraphic.Handle := ppBitmapFromResource('PPPRINTERFONT');

  {fill white space in bitmap with the Window's Highlight color}
  FSelPrinterGraphic.Canvas.Brush.Color := clHighlight;
  FSelPrinterGraphic.Canvas.Brush.Style := bsSolid;
  FSelPrinterGraphic.Canvas.FloodFill(0,0,clWhite,fsSurface);

end; {procedure, InitializeFontGraphics}


{------------------------------------------------------------------------------}
{ TppFontComboBox.BuildFontList}

procedure TppFontComboBox.BuildFontList;
var
  lbValidPrinter: Boolean;
  lPrinter: TppPrinter;
  lDC: HDC;

begin

  lPrinter := GetPrinter;

  lbValidPrinter := (lPrinter <> nil) and (lPrinter.DC <> 0);

  if (lbValidPrinter) then
    begin
      if (FPrinterName = lPrinter.PrinterDescription) then Exit;
      FPrinterName := lPrinter.PrinterDescription;
      lDC := lPrinter.DC

    end
  else
    begin
      if Items.Count > 0 then Exit;
      lDC := 0;
    end;

  {free the old font list}
  if (FFontList <> nil) then
    FFontList.Free;

  {create new font list}
  FFontList := TppFontList.CreateList(lDC);

  Items.Assign(FFontList);

  ItemIndex := Items.IndexOf(Text);


end; {procedure, BuildFontList}


{------------------------------------------------------------------------------}
{ TppFontComboBox.GetPrinter}

function TppFontComboBox.GetPrinter: TppPrinter;
begin

  if Assigned(FOnGetPrinter) then
    FOnGetPrinter(Self, Result)
  else
    Result := nil;

end; {function, GetPrinter}


{------------------------------------------------------------------------------}
{ TppFontComboBox.GetFontName}

function TppFontComboBox.GetFontName: String;
begin
  if (Items.Count = 0) then
    BuildFontList;

  Result := Text

end; {function, GetFontName}

{------------------------------------------------------------------------------}
{ TppFontComboBox.SetFontName}

procedure TppFontComboBox.SetCurrentFont(aFont: TFont);
begin
  if (Items.Count = 0) then
    BuildFontList;

  FCurrentFont.Assign(aFont);

end; {procedure, SetCurrentFont}


{------------------------------------------------------------------------------}
{ TppFontComboBox.GetCurrentFont}

function TppFontComboBox.GetCurrentFont: TFont;
begin

  if (Items.Count = 0) then
    BuildFontList;

  if (ItemIndex >= 0) and (ItemIndex < FFontList.Count) then
    FCurrentFont.CharSet := FFontList.FontInfo[ItemIndex].CharSet;

  FCurrentFont.Name := Text;

  Result := FCurrentFont;

end; {function, GetFontName}



{------------------------------------------------------------------------------}
{ TppFontComboBox.SetFontName}

procedure TppFontComboBox.SetFontName(aFontName: String);
var
  liIndex: Integer;

begin

  if (Items.Count = 0) then
    BuildFontList;

  liIndex := Items.IndexOf(aFontName);

  if liIndex >= 0 then
   ItemIndex := liIndex;

  Text := aFontName;


end; {procedure, SetFontName}

{------------------------------------------------------------------------------}
{ TppFontComboBox.DrawItemEvent}

procedure TppFontComboBox.DrawItemEvent(Control: TWinControl; Index: Integer;
                                      Rect: TRect; State: TOwnerDrawState);
var
  liOffset: Byte;
  liFontType: Byte;
  llDeviceFont: Boolean;
  llTrueTypeFont: Boolean;
  lBitmap: TBitmap;

begin

  {clear drawing area}
  Canvas.FillRect(Rect);

  if (Index >= 0) and (Index < FFontList.Count) then
    liFontType := FFontList.FontInfo[Index].FontType
  else
    liFontType := 0;

  llDeviceFont   := (liFontType and TMPF_DEVICE)   > 0;
  llTrueTypeFont := (liFontType and TMPF_TRUETYPE) > 0;


  lBitmap := nil;

  {draw bitmap}
  if DroppedDown then
    begin

      if llTrueTypeFont and (odSelected in State) then
        lBitmap := FSelTrueTypeGraphic

      else if llTrueTypeFont and not (odSelected in State) then
        lBitmap := FTrueTypeGraphic

      else if llDeviceFont and (odSelected in State) then
        lBitmap := FSelPrinterGraphic

      else if llDeviceFont and not (odSelected in State) then
        lBitmap := FPrinterGraphic;

      if lBitmap <> nil  then
        Canvas.Draw(Rect.Left + 1, Rect.Top, lBitmap);

    end;

  {draw text}
  if DroppedDown then
    liOffset := FTrueTypeGraphic.Width + 3
  else
    liOffset := 1;

  Canvas.TextOut(Rect.Left + liOffset, Rect.Top, Items[Index]);

end; {procedure, DrawItemEvent}


{------------------------------------------------------------------------------}
{ TppFontComboBox.DropDownEvent}

procedure TppFontComboBox.DropDownEvent(Sender: TObject);
begin
  BuildFontList;

end; {procedure, DropDownEvent}


{------------------------------------------------------------------------------}
{ TppFontComboBox.MeasureItemEvent}

procedure TppFontComboBox.MeasureItemEvent(Control: TWinControl; Index: Integer; var Height: Integer);
begin
 {adjust height of list box for large fonts}
  Height := Trunc(Screen.PixelsPerInch * 0.15625);

end;


{******************************************************************************
 *
 **  A l i g n T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppAlignToolbar.Create}

constructor TppAlignToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FOnButtonClick := nil;


  CreateControls;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppAlignToolbar.CreateControls}

procedure TppAlignToolbar.CreateControls;
var
  liButton: Integer;
  lButton: TppToolbarButton;
  lSeparator: TppToolbarSep97;
  
begin

  BeginUpdate;

  Caption := ppLoadStr(484); {'Align or Space'}

  for liButton := 0 to 9 do
    begin

      lButton := TppToolbarButton.Create(nil);
      lButton.Tag        := liButton;
      lButton.OnClick    := ButtonClickEvent;
      lButton.Parent     := Self;

      {load button glyph}
      lButton.Glyph.Handle := ppBitmapFromResource(cAlignResNames[liButton]);

      lButton.Hint := ppLoadStr(cAlignHints[liButton]);

      if (liButton = 2) or (liButton = 5) or (liButton = 7) then
        begin
          lSeparator := TppToolbarSep97.Create(Owner);
          lSeparator.Parent := Self;
        end;


    end;

  EndUpdate;


end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TppAlignToolbar.ButtonClickEvent}

procedure TppAlignToolbar.ButtonClickEvent(Sender: TObject);
begin
  FAlignType := TppAlignType(TComponent(Sender).Tag);

  if Assigned(FOnButtonClick) then FOnButtonClick(Sender);

end; {procedure, ButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppAlignToolbar.SetLanguageIndex}

procedure TppAlignToolbar.SetLanguageIndex(aLanguageIndex: Longint);
var
  liControl: Integer;
  lButton: TppToolbarButton;

begin

  inherited SetLanguageIndex(aLanguageIndex);


  Caption := ppLoadStr(484); {'Align or Space'}

  for liControl := 0 to ControlCount-1 do

    if Controls[liControl] is TppToolbarButton then
      begin

        lButton := TppToolbarButton(Controls[liControl]);
        lButton.Hint := ppLoadStr(cAlignHints[lButton.Tag]);

      end;


end; {procedure, SetLanguageIndex}



{******************************************************************************
 *
 **  S i z e T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSizeToolbar.Create}

constructor TppSizeToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FOnButtonClick := nil;


  
  CreateControls;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppSizeToolbar.CreateControls}

procedure TppSizeToolbar.CreateControls;
var
  liButton: Integer;
  lButton: TppToolbarButton;
  lSeparator: TppToolbarSep97;
  
begin

  BeginUpdate;

  Caption := ppLoadStr(485); {'Size'}

  for liButton := 0 to High(cSizeResNames) do
    begin

      lButton := TppToolbarButton.Create(nil);
      lButton.Tag        := liButton;
      lButton.OnClick    := ButtonClickEvent;
      lButton.Parent     := Self;

      {load button glyph}
      lButton.Glyph.Handle := ppBitmapFromResource(cSizeResNames[liButton]);

      lButton.Hint := ppLoadStr(cSizeHints[liButton]);

      {add a separator after the second button}
      if (liButton = 1) then
        begin
          lSeparator := TppToolbarSep97.Create(Owner);
          lSeparator.Parent := Self;
        end;


    end;


  EndUpdate;


end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppSizeToolbar.ButtonClickEvent}

procedure TppSizeToolbar.ButtonClickEvent(Sender: TObject);
begin
  FSizeType := TppSizeType(TComponent(Sender).Tag);

  if Assigned(FOnButtonClick) then FOnButtonClick(Sender);

end; {procedure, ButtonClickEvent}

{------------------------------------------------------------------------------}
{ TppSizeToolbar.SetLanguageIndex}

procedure TppSizeToolbar.SetLanguageIndex(aLanguageIndex: Longint);
var
  liControl: Integer;
  lButton: TppToolbarButton;

begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption := ppLoadStr(485); {'Size'}

  for liControl := 0 to ControlCount-1 do
  
    if Controls[liControl] is TppToolbarButton then
      begin

        lButton := TppToolbarButton(Controls[liControl]);
        lButton.Hint := ppLoadStr(cSizeHints[lButton.Tag]);

      end;


end; {procedure, SetLanguageIndex}





{******************************************************************************
 *
 **  N u d g e T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppNudgeToolbar.Create}

constructor TppNudgeToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FOnButtonClick := nil;


  CreateControls;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppNudgeToolbar.CreateControls}

procedure TppNudgeToolbar.CreateControls;
var
  liButton: Integer;
  lButton: TppToolbarButton;
  lSeparator: TppToolbarSep97;
  
begin

  BeginUpdate;

  Caption := ppLoadStr(486); {'Nudge'}

  for liButton := 0 to High(cNudgeResNames) do
    begin

      lButton := TppToolbarButton.Create(nil);
      lButton.Tag        := liButton;
      lButton.OnClick    := ButtonClickEvent;
      lButton.Parent     := Self;

      {load button glyph}
      lButton.Glyph.Handle := ppBitmapFromResource(cNudgeResNames[liButton]);

      lButton.Hint := ppLoadStr(cNudgeHints[liButton]);

      {add a separator after the second button}
      if (liButton = 1) then
        begin
          lSeparator := TppToolbarSep97.Create(Owner);
          lSeparator.Parent := Self;
        end;


    end;


  EndUpdate;

end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppNudgeToolbar.ButtonClickEvent}

procedure TppNudgeToolbar.ButtonClickEvent(Sender: TObject);
begin
  FNudgeType := TppNudgeType(TComponent(Sender).Tag);

  if Assigned(FOnButtonClick) then FOnButtonClick(Sender);

end; {procedure, ButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppNudgeToolbar.SetLanguageIndex}

procedure TppNudgeToolbar.SetLanguageIndex(aLanguageIndex: Longint);
var
  liControl: Integer;
  lButton: TppToolbarButton;

begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption := ppLoadStr(486); {'Nudge'}

  for liControl := 0 to ControlCount-1 do
  
    if Controls[liControl] is TppToolbarButton then
      begin

        lButton := TppToolbarButton(Controls[liControl]);
        lButton.Hint := ppLoadStr(cNudgeHints[lButton.Tag]);

      end;

end; {procedure, SetLanguageIndex}




 {******************************************************************************
 *
 **  D r a w T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDrawToolbar.Create}

constructor TppDrawToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  CreateControls;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppDrawToolbar.CreateControls}

procedure TppDrawToolbar.CreateControls;
begin

  BeginUpdate;

  FFillColorButton := TppColorButton.Create(Owner);
  FFillColorButton.Parent    := Self;
  FFillColorButton.ColorType := ctFill;
  FFillColorButton.PaletteEnabled := False;

  FLineColorButton := TppColorButton.Create(Owner);
  FLineColorButton.Parent    := Self;
  FLineColorButton.ColorType := ctLine;
  FLineColorButton.PaletteEnabled := False;

  FLineThicknessButton := TppLineThicknessButton.Create(Owner);
  FLineThicknessButton.Parent := Self;
  FLineThicknessButton.PaletteEnabled := False;

{$IFDEF WINDOWS} {for D1 make a toggle button}
  FLineThicknessButton.GroupIndex := 1;
  FLineThicknessButton.AllowAllUp := True;
{$ENDIF}

  FLineStyleButton := TppLineStyleButton.Create(Owner);
  FLineStyleButton.Parent := Self;
  FLineStyleButton.PaletteEnabled := False;

{$IFDEF WINDOWS} {for D1 make a toggle button}
  FLineStyleButton.GroupIndex := 2;
  FLineStyleButton.AllowAllUp := True;
{$ENDIF}

  {this will load the hint strings}
  SetLanguageIndex(LanguageIndex);

  EndUpdate;

end; {procedure, CreateControls}



{------------------------------------------------------------------------------}
{ TppDrawToolbar.SetLanguageIndex}

procedure TppDrawToolbar.SetLanguageIndex(aLanguageIndex: Longint);
begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption :=  ppLoadStr(487); {'Draw'}

  FFillColorButton.LanguageIndex := aLanguageIndex;
  FLineColorButton.LanguageIndex := aLanguageIndex;
  FLineThicknessButton.Hint := ppLoadStr(488);  {Line Thickness}
  FLineStyleButton.Hint     := ppLoadStr(489);  {Line Style}

end; {procedure, SetLanguageIndex}



{******************************************************************************
 *
 **  E d i t T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppEditToolbar.Create}

constructor TppEditToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  CreateControls;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppEditToolbar.CreateControls}

procedure TppEditToolbar.CreateControls;
begin

  BeginUpdate;

  FPanel := TPanel.Create(Owner);
  FPanel.Width   := 200;
  FPanel.Visible := True;
  FPanel.BevelOuter := bvNone;
  FPanel.Parent  := Self;

  FEditBox := TEdit.Create(Owner);
  FEditBox.Width   := 200;
  FEditBox.Color   := clBtnFace;
  FEditBox.Visible := True;
  FEditBox.Parent  := FPanel;

  FPanel.Height  := FEditBox.Height;

  FComboBox2 := TComboBox.Create(Owner);
  FComboBox2.Left  := 0;
  FComboBox2.Width := 150;
  FComboBox2.DropDownCount := 10;
  FComboBox2.Style := csDropDownList;
  FComboBox2.Parent  := Self;

  FComboBox2.Visible := False;

  FComboBox := TComboBox.Create(Owner);
  FComboBox.Width   := 200;
  FComboBox.DropDownCount := 10;
  FComboBox.Style := csDropDownList;
  FComboBox.Parent  := FPanel;

  FComboBox.Visible := False;

  OrderIndex[FComboBox2] := 0;

  {this will load the hint strings}
  SetLanguageIndex(LanguageIndex);

  EndUpdate;


end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TppEditToolbar.EnableControl}

procedure TppEditToolbar.EnableControl(aControl: TControl);
begin

  BeginUpdate;

  if (aControl = nil) then
    begin
      FComboBox.Visible := False;
      FComboBox2.Visible := False;

      FEditBox.Clear;
      FEditBox.Enabled  := False;
      FEditBox.Color    := clBtnFace;
      FEditBox.Visible  := True;

    end
  else if (aControl = FEditBox) then
    begin
      FComboBox.Visible := False;
      FComboBox2.Visible := False;

      FEditBox.Enabled  := True;
      FEditBox.Color    := clWindow;
      FEditBox.Visible  := True;

    end
  else if (aControl = FComboBox) then
    begin
      FEditBox.Visible   := False;
      FComboBox.Visible  := True;
      FComboBox2.Visible := False;

    end
  else if (aControl = FComboBox2) then
    begin
      FEditBox.Visible   := False;
      FComboBox2.Visible := True;
      FComboBox.Visible  := True;

    end;


  EndUpdate;
    
end; {procedure, EnableControl}


{------------------------------------------------------------------------------}
{ TppEditToolbar.SetLanguageIndex}

procedure TppEditToolbar.SetLanguageIndex(aLanguageIndex: Longint);
begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption :=  ppLoadStr(264); {'Edit'}

end; {procedure, SetLanguageIndex}



{******************************************************************************
 *
 **  C u s t o m F o r m a t T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.Create}

constructor TppCustomFormatToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FFont := TFont.Create;

  CreateControls;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.Destroy}

destructor TppCustomFormatToolbar.Destroy;
begin

  FFont.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.CreateControls}

procedure TppCustomFormatToolbar.CreateControls;
var
  lSeparator: TppToolbarSep97;
  liFontSize: Integer;

begin

  BeginUpdate;

  FFontComboBox := TppFontComboBox.Create(Owner);
  FFontComboBox.Parent := Self;
  FFontComboBox.Width := 148;
  FFontComboBox.FontName := 'Arial';

  FFontSizeComboBox := TComboBox.Create(Owner);
  FFontSizeComboBox.Parent := Self;
  FFontSizeComboBox.Width  := 51;
  FFontSizeComboBox.Style := csDropDown;
  FFontSizeComboBox.Text := '10';


  for liFontSize := 0 to High(cFontSizes) do
    FFontSizeComboBox.Items.Add(IntToStr(cFontSizes[liFontSize]));


  FFontNameButton := TppFontButton.Create(Owner);
  FFontNameButton.Parent := Self;
  FFontNameButton.FontAttributeType := faFontName;

  FFontSizeButton := TppFontButton.Create(Owner);
  FFontSizeButton.Parent := Self;
  FFontSizeButton.FontAttributeType := faFontSize;

  SetSlaveControl(FFontComboBox, FFontNameButton);
  SetSlaveControl(FFontSizeComboBox, FFontSizeButton);


  lSeparator := TppToolbarSep97.Create(Owner);
  lSeparator.Parent := Self;

  FBoldButton := TppToolbarButton.Create(Owner);
  FBoldButton.GroupIndex := 1;
  FBoldButton.AllowAllUp := True;
  FBoldButton.Glyph.Handle := ppBitmapFromResource('PPBOLD');
  FBoldButton.Parent := Self;

  FItalicButton := TppToolbarButton.Create(Owner);
  FItalicButton.GroupIndex := 2;
  FItalicButton.AllowAllUp := True;
  FItalicButton.Glyph.Handle := ppBitmapFromResource('PPITALIC');
  FItalicButton.Parent     := Self;

  FUnderlineButton := TppToolbarButton.Create(Owner);
  FUnderlineButton.GroupIndex := 3;
  FUnderlineButton.AllowAllUp := True;
  FUnderlineButton.Glyph.Handle := ppBitmapFromResource('PPUNDERLINE');
  FUnderlineButton.Parent  := Self;

  lSeparator := TppToolbarSep97.Create(Owner);
  lSeparator.Parent := Self;

  FAlignLeftButton := TppToolbarButton.Create(Owner);
  FAlignLeftButton.GroupIndex := 4;
  FAlignLeftButton.Glyph.Handle := ppBitmapFromResource('PPALIGNLEFT');
  FAlignLeftButton.Parent := Self;

  FCenterButton := TppToolbarButton.Create(Owner);
  FCenterButton.GroupIndex := 4;
  FCenterButton.Glyph.Handle := ppBitmapFromResource('PPALIGNCENTER');
  FCenterButton.Parent := Self;

  FAlignRightButton := TppToolbarButton.Create(Owner);
  FAlignRightButton.GroupIndex := 4;
  FAlignRightButton.Glyph.Handle := ppBitmapFromResource('PPALIGNRIGHT');
  FAlignRightButton.Parent := Self;

  lSeparator := TppToolbarSep97.Create(Owner);
  lSeparator.Parent := Self;

  FFontColorButton := TppColorButton.Create(Owner);
  FFontColorButton.ColorType := ctFont;
  FFontColorButton.PaletteEnabled := False;
  FFontColorButton.Parent    := Self;

  FHighlightColorButton := TppColorButton.Create(Owner);
  FHighlightColorButton.ColorType := ctHighlight;
  FHighlightColorButton.PaletteEnabled := False;
  FHighlightColorButton.Parent    := Self;

  {this will load the hint strings}
  SetLanguageIndex(LanguageIndex);

  EndUpdate;

end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.GetAlignment}

function TppCustomFormatToolbar.GetAlignment: TAlignment;
begin

  if FAlignRightButton.Down then
    Result := taRightJustify

  else if FCenterButton.Down then
     Result := taCenter

  else
    Result := taLeftJustify;

end; {function, GetAlignment}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.GetFont}

function TppCustomFormatToolbar.GetFont: TFont;
var
  lbIsClear: Boolean;
  lColor: TColor;
  
begin

  {get name and size}
  FFont.Name := FFontComboBox.Text;
  FFont.Size := StrToInt(FFontSizeComboBox.Text);

  {get style}
  if FBoldButton.Down then
    FFont.Style := FFont.Style + [fsBold]
  else
    FFont.Style := FFont.Style - [fsBold];

  if FItalicButton.Down then
    FFont.Style := FFont.Style + [fsItalic]
  else
    FFont.Style := FFont.Style - [fsItalic];


  if FUnderlineButton.Down then
    FFont.Style := FFont.Style + [fsUnderline]
  else
    FFont.Style := FFont.Style - [fsUnderline];

  {get color}
  FFontColorButton.GetDefaultColor(lColor, lbIsClear);
  FFont.Color := lColor;

  Result := FFont;

end; {function, GetFont}




{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.SetAlignment}

procedure TppCustomFormatToolbar.SetAlignment(aAlignment: TAlignment);
begin

  FAlignLeftButton.Down  := (aAlignment = taLeftJustify);
  FAlignRightButton.Down := (aAlignment = taRightJustify);
  FCenterButton.Down     := (aAlignment = taCenter);

end; {procedure, SetAlignment}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.SetFont}

procedure TppCustomFormatToolbar.SetFont(aFont: TFont);
begin

  {set name and size}
  FFontComboBox.FontName := aFont.Name;


  FFontSizeComboBox.Text := IntToStr(aFont.Size);

  {set style}
  FBoldButton.Down      := (fsBold      in  aFont.Style);
  FItalicButton.Down    := (fsItalic    in  aFont.Style);
  FUnderlineButton.Down := (fsUnderline in  aFont.Style);

  {set color}
  FFontColorButton.SetPaletteColor(aFont.Color, False);


end; {procedure, SetFont}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.SetHighlightColor}

procedure TppCustomFormatToolbar.SetHighlightColor(aColor: TColor; aIsClear: Boolean);
begin

  {set color}
  FHighlightColorButton.SetPaletteColor(aColor, aIsClear);

end; {procedure, SetHighlightColor}


{------------------------------------------------------------------------------}
{ TppCustomFormatToolbar.SetLanguageIndex}

procedure TppCustomFormatToolbar.SetLanguageIndex(aLanguageIndex: Longint);
begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption :=  ppLoadStr(200); {'Format'}

  FFontComboBox.Hint     := ppLoadStr(168);  {Font}
  FFontSizeComboBox.Hint := ppLoadStr(169);  {Font Size}

  FFontNameButton.Hint   :=  ppLoadStr(168); {Font}
  FFontSizeButton.Hint   :=  ppLoadStr(169); {Font Size}

  FBoldButton.Hint       := ppLoadStr(160); {Bold}
  FItalicButton.Hint     := ppLoadStr(171); {Italic}
  FUnderlineButton.Hint  := ppLoadStr(179); {Underline}

  FAlignLeftButton.Hint  := ppLoadStr(173); {Left Justify}
  FCenterButton.Hint     := ppLoadStr(229); {Center}
  FAlignRightButton.Hint := ppLoadStr(176); {Right Justify}

  FFontColorButton.LanguageIndex      := aLanguageIndex;
  FHighlightColorButton.LanguageIndex := aLanguageIndex;


end; {procedure, SetLanguageIndex}




{******************************************************************************
 *
 **  F o r m a t T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFormatToolbar.Create}

constructor TppFormatToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);


end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppFormatToolbar.CreateControls}

procedure TppFormatToolbar.CreateControls;
var
  lSeparator: TppToolbarSep97;

begin

  BeginUpdate;

  inherited CreateControls;

  lSeparator := TppToolbarSep97.Create(Owner);
  lSeparator.Parent := Self;

  FBringToFrontButton := TppToolbarButton.Create(Owner);
  FBringToFrontButton.Parent := Self;
  FBringToFrontButton.Glyph.Handle := ppBitmapFromResource('PPBRINGTOFRONT');


  FSendToBackButton := TppToolbarButton.Create(Owner);
  FSendToBackButton.Parent := Self;
  FSendToBackButton.Glyph.Handle := ppBitmapFromResource('PPSENDTOBACK');


  {this will load the hint strings}
  SetLanguageIndex(LanguageIndex);

  EndUpdate;

end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TppFormatToolbar.SetLanguageIndex}

procedure TppFormatToolbar.SetLanguageIndex(aLanguageIndex: Longint);
begin
  if (FBringToFrontButton) = nil then Exit;

  inherited SetLanguageIndex(aLanguageIndex);

  FBringToFrontButton.Hint   := ppLoadStr(161); {BringToFront};
  FSendToBackButton.Hint     := ppLoadStr(177); {SendToBack};

end; {procedure, SetLanguageIndex}




{******************************************************************************
 *
 **  S t a n d a r d T o o l b a r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppStandardToolbar.Create}

constructor TppStandardToolbar.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  CreateControls;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppStandardToolbar.CreateControls}

procedure TppStandardToolbar.CreateControls;
var
  lSeparator: TppToolbarSep97;

begin

  BeginUpdate;

  FFileNewButton := TppToolbarButton.Create(Owner);
  FFileNewButton.Parent := Self;
  FFileNewButton.Glyph.Handle := ppBitmapFromResource('PPNEW');

  FFileOpenButton := TppToolbarButton.Create(Owner);
  FFileOpenButton.Parent := Self;
  FFileOpenButton.Glyph.Handle := ppBitmapFromResource('PPOPEN');

  FFileSaveButton := TppToolbarButton.Create(Owner);
  FFileSaveButton.Parent := Self;
  FFileSaveButton.Glyph.Handle := ppBitmapFromResource('PPSAVE');

  lSeparator := TppToolbarSep97.Create(Owner);
  lSeparator.Parent := Self;

  FPageSetupButton := TppToolbarButton.Create(Owner);
  FPageSetupButton.Parent := Self;
  FPageSetupButton.Glyph.Handle := ppBitmapFromResource('PPPAGESETUP');

  FPrintButton := TppToolbarButton.Create(Owner);
  FPrintButton.Parent := Self;
  FPrintButton.Glyph.Handle := ppBitmapFromResource('PPPRINT');

  FPrintPreviewButton := TppToolbarButton.Create(Owner);
  FPrintPreviewButton.Parent := Self;
  FPrintPreviewButton.Glyph.Handle := ppBitmapFromResource('PPPRINTPREVIEW');

  lSeparator := TppToolbarSep97.Create(Owner);
  lSeparator.Parent := Self;

  FCutButton := TppToolbarButton.Create(Owner);
  FCutButton.Parent := Self;
  FCutButton.Glyph.Handle := ppBitmapFromResource('PPCUT');

  FCopyButton := TppToolbarButton.Create(Owner);
  FCopyButton.Parent := Self;
  FCopyButton.Glyph.Handle := ppBitmapFromResource('PPCOPY');

  FPasteButton := TppToolbarButton.Create(Owner);
  FPasteButton.Parent := Self;
  FPasteButton.Glyph.Handle := ppBitmapFromResource('PPPASTE');

  {this will load the hint strings}
  SetLanguageIndex(LanguageIndex);

  EndUpdate;

end; {procedure, CreateControls}




{------------------------------------------------------------------------------}
{ TppStandardToolbar.SetLanguageIndex}

procedure TppStandardToolbar.SetLanguageIndex(aLanguageIndex: Longint);
begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption :=  ppLoadStr(490); {'Standard'}

  FFileNewButton.Hint      := ppLoadStr(156); {New}
  FFileOpenButton.Hint     := ppLoadStr(361); {Open}
  FFileSaveButton.Hint     := ppLoadStr(362); {Save}

  FPageSetupButton.Hint    := ppLoadStr(218); {Page Setup}
  FPrintButton.Hint        := ppLoadStr(022); {Print}
  FPrintPreviewButton.Hint := ppLoadStr(023); {Print Preview}

  FCutButton.Hint          := ppLoadStr(365); {Cut}
  FCopyButton.Hint         := ppLoadStr(366); {Copy}
  FPasteButton.Hint        := ppLoadStr(367); {Paste}

end; {procedure, SetLanguageIndex}




{******************************************************************************
 *
 **  T o o l b a r M a n a g e r
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppToolbarManager.Create}

constructor TppToolbarManager.Create(aForm: TForm);
begin

  inherited Create;


  FForm := aForm;

  FComponentClasses := TStringList.Create;
  FComponentClasses.Assign(ppComponentClassList);

  ppComponentClassList.AddNotify(Self);


  FPopupMenu := TPopupMenu.Create(nil);
  FPopupMenu.OnPopup := MenuPopupEvent;

  FToolbars := TStringList.Create;

  FComponentBars        := TList.Create;
  FStandardBars         := TList.Create;
  FToolWindows          := TList.Create;
  FPaletteButtons       := TList.Create;
  FFloatingToolWindows  := TList.Create;
  FCaptionsList         := TList.Create;


  FLanguageIndex := 0;

  FPaletteButton      := nil;
  FSelectObjectButton := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppToolbarManager.Destroy}

destructor TppToolbarManager.Destroy;
begin

  ppComponentClassList.RemoveNotify(Self);

  FComponentClasses.Free;

  FreeMenuItems;
  FreeToolbars(FStandardBars);
  FreeToolbars(FComponentBars);
  FreeToolbars(FToolWindows);

  FComponentBars.Free;
  FStandardBars.Free;
  FToolWindows.Free;
  FPaletteButtons.Free;
  FFloatingToolWindows.Free;
  FCaptionsList.Free;

  FPopupMenu.Free;
  FToolbars.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppToolbarManager.SaveToolWindowPreferences}

procedure TppToolbarManager.SaveToolWindowPreferences;
var
  lIniFile: TIniFile;
  lColor: TColor;
  lbIsClear: Boolean;
  lFormatBar: TppFormatToolbar;
  lDrawBar: TppDrawToolbar;
  liIndex: Integer;

begin

  if FIniFileName = '' then Exit;

  ppIniSaveToolbarPositions(FForm, FIniFileName);


  lIniFile := TIniFile.Create(FIniFileName);


  for liIndex := 0 to FToolWindows.Count-1 do
    TppToolWindow(FToolWindows[liIndex]).SavePreferences(lIniFile);


  {load default colors from ini file}
  lFormatBar := TppFormatToolbar(FindToolbar('Format'));

  if (lFormatBar <> nil) then
    begin

      lFormatBar.FontColorButton.GetDefaultColor(lColor, lbIsClear);

      lIniFile.WriteInteger('Format', 'FontColor', lColor);
      lIniFile.WriteBool('Format', 'FontIsClear', lbIsClear);

      lFormatBar.HighlightColorButton.GetDefaultColor(lColor, lbIsClear);

      lIniFile.WriteInteger('Format', 'HighlightColor', lColor);
      lIniFile.WriteBool('Format', 'HighlightIsClear', lbIsClear);

    end;

  lDrawBar := TppDrawToolbar(FindToolbar('Draw'));

  if lDrawBar <> nil then
    begin

      lDrawBar.LineColorButton.GetDefaultColor(lColor, lbIsClear);

      lIniFile.WriteInteger('Draw', 'LineColor', lColor);
      lIniFile.WriteBool('Draw', 'LineIsClear', lbIsClear);

      lDrawBar.FillColorButton.GetDefaultColor(lColor, lbIsClear);

      lIniFile.WriteInteger('Draw', 'FillColor', lColor);
      lIniFile.WriteBool('Draw', 'FillIsClear', lbIsClear);

    end;

  lIniFile.Free;


end;  {procedure, SaveToolWindowPreferences}

{------------------------------------------------------------------------------}
{ TppToolbarManager.LoadToolWindowPreferences}

procedure TppToolbarManager.LoadToolWindowPreferences;
var
  lIniFile: TIniFile;
  lColor: TColor;
  lbIsClear: Boolean;
  lFormatBar: TppFormatToolbar;
  lDrawBar: TppDrawToolbar;
  liIndex: Integer;

begin

  if FIniFileName = '' then Exit;

  ppIniLoadToolbarPositions(FForm, FIniFileName);
  
  BuildFloatingToolWindowList(FFloatingToolWindows);


  lIniFile := TIniFile.Create(FIniFileName);

  for liIndex := 0 to FToolWindows.Count-1 do
    TppToolWindow(FToolWindows[liIndex]).LoadPreferences(lIniFile);



  {load default colors from ini file}
  lFormatBar := TppFormatToolbar(FindToolbar('Format'));

  if (lFormatBar <> nil) then
    begin

      lColor    := lIniFile.ReadInteger('Format', 'FontColor', clWindowText);
      lbIsClear := lIniFile.ReadBool('Format', 'FontIsClear', False);

      lFormatBar.FontColorButton.SetDefaultColor(lColor, lbIsClear);

      lColor    := lIniFile.ReadInteger('Format', 'HighlightColor', clWhite);
      lbIsClear := lIniFile.ReadBool('Format', 'HighlightIsClear', True);

      lFormatBar.HighlightColorButton.SetDefaultColor(lColor, lbIsClear);

    end;

  lDrawBar := TppDrawToolbar(FindToolbar('Draw'));

  if lDrawBar <> nil then
    begin
      lColor := lIniFile.ReadInteger('Draw', 'LineColor', clWindowText);
      lbIsClear := lIniFile.ReadBool('Draw', 'LineIsClear', False);

      lDrawBar.LineColorButton.SetDefaultColor(lColor, lbIsClear);

      lColor := lIniFile.ReadInteger('Draw', 'FillColor', clWhite);
      lbIsClear := lIniFile.ReadBool('Draw', 'FillIsClear', True);

      lDrawBar.FillColorButton.SetDefaultColor(lColor, lbIsClear);

    end;

  lIniFile.Free;

end; {procedure, LoadToolWindowPreferences}

{------------------------------------------------------------------------------}
{ TppToolbarManager.FreeToolbars}

procedure TppToolbarManager.FreeToolbars(aList: TList);
var
  liToolbar: Integer;

begin

  for liToolbar := aList.Count-1 downto 0 do
    TObject(aList[liToolbar]).Free;

  aList.Clear;

end; {procedure, FreeToolbars}



{------------------------------------------------------------------------------}
{ TppToolbarManager.FreeMenuItems}

procedure TppToolbarManager.FreeMenuItems;
var
  liItem: Integer;

begin
  for liItem := FPopupMenu.Items.Count-1 downto 0 do
    TObject(FPopupMenu.Items[liItem]).Free;

end; {procedure, FreeMenuItems}


{------------------------------------------------------------------------------}
{ TppToolbarManager.Initialize}

procedure TppToolbarManager.Initialize(aTopDock, aBottomDock, aLeftDock, aRightDock: TppDock97);
begin

  FTopDock    := aTopDock;
  FBottomDock := aBottomDock;
  FLeftDock   := aLeftDock;
  FRightDock  := aRightDock;

  {assign the popup menu}
  FTopDock.PopupMenu     := FPopupMenu;
  FBottomDock.PopupMenu  := FPopupMenu;
  FLeftDock.PopupMenu    := FPopupMenu;
  FRightDock.PopupMenu   := FPopupMenu;

  {build the component palette}
  BuildComponentPalette;

  {create standard toolbars}
  CreateStandardToolbars;


  {build the popup menu}
  BuildPopupMenu;

end; {procedure, Initialize}


{------------------------------------------------------------------------------}
{ TppToolbarManager.CreateStandardToolbars}

procedure TppToolbarManager.CreateStandardToolbars;
var
  lToolbar: TppToolbar;
  lFormatBar: TppFormatToolbar;
  lDrawBar: TppDrawToolbar;
  lToolWindow: TppToolWindow97;

begin


  lToolWindow := TppReportTreeWindow.Create(FForm);
  lToolWindow.Name     := 'ReportOutline';
  lToolWindow.DockRow  := 2;
  lToolWindow.DockPos  := 0;
  lToolWindow.DockedTo := nil;
  lToolWindow.Visible  := False;

  FToolWindows.Add(lToolWindow);

  AddToolbar('ReportOutline', lToolWindow);

  lToolWindow := TppDataTreeWindow.Create(FForm);
  lToolWindow.Name     := 'DataTree';
  lToolWindow.DockRow  := 2;
  lToolWindow.DockPos  := 0;
  lToolWindow.DockedTo := nil;
  lToolWindow.Visible  := False;

  FToolWindows.Add(lToolWindow);

  AddToolbar('DataTree', lToolWindow);



  {create Standard toolbar}
  lToolbar := TppStandardToolbar.Create(FForm);

  lToolbar.Visible  := False;
  lToolbar.Name     := 'Standard';
  lToolbar.DockRow  := 2;
  lToolbar.DockPos  := 0;
  lToolbar.DockedTo := FTopDock;

  FStandardBars.Add(lToolbar);

  AddToolbar('Standard', lToolbar);


  {create Format toolbar}
  lFormatBar := TppFormatToolbar.Create(FForm);
  lFormatBar.Name     := 'Format';
  lFormatBar.DockRow  := 1;
  lFormatBar.DockPos  := 0;
  lFormatBar.DockedTo := FTopDock;

  FStandardBars.Add(lFormatBar);

  FPaletteButtons.Add(lFormatBar.FontColorButton);
  FPaletteButtons.Add(lFormatBar.HighlightColorButton);

  AddToolbar('Format', lFormatBar);


  {create Edit toolbar}
  lToolbar := TppEditToolbar.Create(FForm);
  lToolbar.Name     := 'Edit';
  lToolbar.DockRow  := 1;
  lToolbar.DockPos  := 0;
  lToolbar.DockedTo := FTopDock;

  FStandardBars.Add(lToolbar);

  AddToolbar('Edit', lToolbar);


  {create Draw toolbar}
  lDrawbar := TppDrawToolbar.Create(FForm);
  lDrawbar.Visible  := False;
  lDrawbar.Name     := 'Draw';
  lDrawbar.DockRow  := 2;
  lDrawbar.DockPos  := 0;
  lDrawbar.DockedTo := FTopDock;


  FStandardBars.Add(lDrawbar);
 
  FPaletteButtons.Add(lDrawbar.LineColorButton);
  FPaletteButtons.Add(lDrawbar.FillColorButton);

  AddToolbar('Draw', lDrawbar);


  {create Align toolbar}
  lToolbar := TppAlignToolbar.Create(FForm);
  lToolbar.Visible  := False;
  lToolbar.Name     := 'Align';
  lToolbar.DockRow  := 2;
  lToolbar.DockPos  := 0;
  lToolbar.DockedTo := FTopDock;

  FStandardBars.Add(lToolbar);

  AddToolbar('Align', lToolbar);

  {create Size toolbar}
  lToolbar := TppSizeToolbar.Create(FForm);
  lToolbar.Visible  := False;
  lToolbar.Name     := 'Size';
  lToolbar.DockRow  := 2;
  lToolbar.DockPos  := 0;
  lToolbar.DockedTo := FTopDock;
 

  FStandardBars.Add(lToolbar);

  AddToolbar('Size', lToolbar);


  {create Nudge toolbar}
  lToolbar := TppNudgeToolbar.Create(FForm);
  lToolbar.Visible  := False;
  lToolbar.Name     := 'Nudge';
  lToolbar.DockRow  := 2;
  lToolbar.DockPos  := 0;
  lToolbar.DockedTo := FTopDock;


  FStandardBars.Add(lToolbar);

  AddToolbar('Nudge', lToolbar);

end; {procedure, CreateStandardToolbars}



{------------------------------------------------------------------------------}
{ TppToolbarManager.BuildComponentPalette}

procedure TppToolbarManager.BuildComponentPalette;
var
  lButton:  TppToolbarButton;
  liComponent: Integer;
  liToolbar: Integer;
  liIndex: Integer;
  lFirstToolbar: TppToolbar;
  lSeparator: TppToolbarSep97;


begin

  {remove component bars from list of toolbars}
  for liToolbar := 0 to FComponentBars.Count-1 do
    begin
      liIndex := FToolbars.IndexOfObject(FComponentBars[liToolbar]);

      if liIndex >= 0 then
        FToolbars.Delete(liIndex);
    end;

  {free the component bars}
  FreeToolbars(FComponentBars);


  lFirstToolbar := nil;

  for liComponent := 0 to FComponentClasses.Count-1 do
    begin

      AddComponentClass(FComponentClasses[liComponent]);

      {save reference to first component bar
         note: also make sure dock pos is correct }
      if (liComponent = 0) then
        begin
          lFirstToolbar := FComponentBars[0];
          lFirstToolbar.DockPos := 0;
        end;

    end;

  {if no toolbars created, create a standard components toolbar}
  if (FComponentClasses.Count = 0) then
    lFirstToolbar := NewToolbar('Standard Components');


  {add selection arrow button to first component bar}
  if (lFirstToolbar <> nil) then
    begin
      lFirstToolbar.BeginUpdate;

      {create the arrow button}
      lButton :=  TppToolbarButton.Create(nil);
      lButton.GroupIndex := 1;
      lButton.AllowAllUp := True;
      lButton.Down := True;
      lButton.Parent := lFirstToolbar;

      lButton.OnClick := ComponentPaletteButtonClickEvent;
      lButton.Name := 'SelectObject';
      lButton.Glyph.Handle := ppBitmapFromResource('PPSELECTOBJECT');
      lButton.Hint := ppLoadStr(273);
      lButton.Tag  := 273;

      lFirstToolbar.OrderIndex[lButton] := 0;

      FSelectObjectButton := lButton;

      if (FComponentClasses.Count > 0) then
        begin
          {add a separator}
          lSeparator := TppToolbarSep97.Create(nil);
          lSeparator.Parent := lFirstToolbar;

          lFirstToolbar.OrderIndex[lSeparator] := 1;
        end;

     lFirstToolbar.EndUpdate;
     
   end;


end; {procedure, BuildComponentPalette}


{------------------------------------------------------------------------------}
{ TppToolbarManager.AddComponentClass }

procedure TppToolbarManager.AddComponentClass(aClassName: String);
var
  lsClassName: String;
  lButton:  TppToolbarButton;
  liClass: Integer;
  lToolbar: TppToolbar;
  lRegComponent: TppRegComponent;

begin

  liClass := FComponentClasses.IndexOf(aClassName);

  if liClass < 0 then Exit;

  lRegComponent := TppRegComponent(FComponentClasses.Objects[liClass]);

  if (lRegComponent = nil) then Exit;


  {try to find the toolbar}
  lToolbar := TppToolbar(FindToolbar(lRegComponent.ToolbarName));

  {create a new toolbar, if needed}
  if (lToolbar = nil) then
    begin
      lToolbar := NewToolbar(lRegComponent.ToolbarName);
      FComponentBars.Add(lToolbar);
    end;

  lToolbar.BeginUpdate;

  if lToolbar.DockRow <> 0 then
    lToolbar.DockRow := 0;

  {add a toolbar button }
  lButton :=  TppToolbarButton.Create(lToolbar);
  lButton.GroupIndex := 1;
  lButton.AllowAllUp := True;
  lButton.OnClick := ComponentPaletteButtonClickEvent;

  {assign parent after the seeting the above props}
  lButton.Parent := lToolbar;

  {assign button position
    note: add 2 to position if SelectObject present}
  if (FSelectObjectButton <> nil) and (FSelectObjectButton.Parent = lToolbar) then
    lToolbar.OrderIndex[lButton] := lRegComponent.ToolBarPosition + 2
  else
    lToolbar.OrderIndex[lButton] := lRegComponent.ToolBarPosition;

  lsClassName := lRegComponent.ComponentClass.ClassName;

  lButton.Name  := lsClassName;

  {assign button glyph}
  if lRegComponent.HInstance = 0 then
    lRegComponent.HInstance := HInstance;

  lButton.Glyph.Handle := ppBitmapFromResource(UpperCase(lsClassName));

  if lButton.Glyph.Handle = 0 then
    lButton.Glyph.Handle := ppBitmapFromResource('PPNOBITMAP');

  {assign button hint}
  if lRegComponent.HintIndex > 0 then
    begin
      lButton.Tag  := lRegComponent.HintIndex;
      lButton.Hint := ppLoadStr(lRegComponent.HintIndex)
    end
  else
    lButton.Hint := lRegComponent.Hint;

  if (lButton.Hint = '') then
    lButton.Hint := TppComponentClass(lRegComponent.ComponentClass).DefaultHint;

  lToolbar.EndUpdate;

end; {procedure, AddComponentClass}


{------------------------------------------------------------------------------}
{ TppToolbarManager.RemoveComponentClass }

procedure TppToolbarManager.RemoveComponentClass(aClassName: String);
var
  lButton:  TComponent;
  liToolbar: Integer;
  lToolbar: TppToolbar;

begin

  lButton   := nil;
  lToolbar  := nil;
  liToolbar := 0;

  {find component button}
  while (lButton = nil) and (liToolbar < FComponentBars.Count) do
    begin
      lToolbar := FComponentBars[liToolbar];

      lButton := lToolbar.FindComponent(aClassName);

      if lButton = nil then
        Inc(liToolbar);

    end;

  {destroy component button}
  lButton.Free;

  {if not more buttons then free the toolbar}
  if (lToolbar <> nil) and (lToolbar.ControlCount = 0) then
    begin
      FComponentBars.Delete(liToolbar);

      liToolbar := FToolbars.IndexOfObject(lToolbar);
      if liToolbar >= 0 then
         FToolbars.Delete(liToolbar);

      lToolbar.Free;


    end;

end; {procedure, RemoveComponentClass}



{------------------------------------------------------------------------------}
{ TppToolbarManager.BuildPopupMenu }

procedure TppToolbarManager.BuildPopupMenu;
var
  liToolbar: Integer;
  lMenuItem: TMenuItem;

begin

  FreeMenuItems;

  {add report outline option}
 { lMenuItem := TMenuItem.Create(FForm);
  lMenuItem.Caption := 'Report Outline';
  lMenuItem.Tag     := Longint(FReportTree);
  lMenuItem.OnClick := MenuItemClickEvent;
  FPopupMenu.Items.Add(lMenuItem); }


  {add one menu item for each toolbar}
  for liToolbar := 0 to FToolbars.Count-1 do
    begin
      lMenuItem := TMenuItem.Create(FForm);
      lMenuItem.Caption := Toolbars[liToolbar].Caption;
      lMenuItem.Tag     := Longint(Toolbars[liToolbar]);
      lMenuItem.OnClick := MenuItemClickEvent;
      FPopupMenu.Items.Add(lMenuItem);
    end;

  {add customize option}
 { lMenuItem := TMenuItem.Create(FForm);
  lMenuItem.Caption := '-';
  FPopupMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(FForm);
  lMenuItem.Caption := 'Customize...';
  FPopupMenu.Items.Add(lMenuItem); }

end; {procedure, BuildPopupMenu}


{------------------------------------------------------------------------------}
{ TppToolbarManager.MenuPopupEvent}


procedure TppToolbarManager.MenuPopupEvent(Sender: TObject);
var
  liItem: Integer;
  lMenuItem: TMenuItem;

begin

  {set menu items to checked for each toolbar that is visible}
  for liItem := 0 to FPopupMenu.Items.Count-1 do
    begin
      lMenuItem := FPopupMenu.Items[liItem];
      if lMenuItem.Tag > 0 then
        lMenuItem.Checked := TppToolWindow97(lMenuItem.Tag).Visible;
    end;

end; {procedure, MenuPopupEvent}

{------------------------------------------------------------------------------}
{ TppToolbarManager.MenuItemClickEvent}

procedure TppToolbarManager.MenuItemClickEvent(Sender: TObject);
var
  lToolbar: TppToolbar;

begin

  {toggle toolbar visibility}
  if Sender is TMenuItem then
    begin
      lToolbar := TppToolbar(TMenuItem(Sender).Tag);
      lToolbar.Visible := not lToolbar.Visible;
    end;

end; {procedure, MenuItemClickEvent}



{------------------------------------------------------------------------------}
{ TppToolbarManager.ComponentPaletteButtonClickEvent}

procedure TppToolbarManager.ComponentPaletteButtonClickEvent(Sender: TObject);
begin

  {make sure only palette button down at a time}
  if (FPaletteButton <> nil) and (Sender <> FPaletteButton) and FPaletteButton.Down then
    FPaletteButton.Down := False

  else if (FSelectObjectButton <> nil) and FSelectObjectButton.Down then
    FSelectObjectButton.Down := False;

  if (Sender = FSelectObjectButton) then
    FSelectObjectButton.Down := True
  else
    FPaletteButton := TppToolbarButton(Sender);

end; {procedure, ComponentPaletteButtonClickEvent}


{------------------------------------------------------------------------------}
{ TppToolbarManager.EnableToolWindowCaptions}

procedure TppToolbarManager.EnableToolWindowCaptions(aValue: Boolean);
var
  liToolbar: Integer;

begin

  BuildFloatingToolWindowList(FCaptionsList);

  for liToolbar := 0 to FCaptionsList.Count-1 do
    TppCustomToolWindow97(FCaptionsList[liToolbar]).SetInactiveCaption(not aValue);

end;  {procedure, EnableToolWindowCaptions}

{------------------------------------------------------------------------------}
{ TppToolbarManager.BuildFloatingToolWindowList}

procedure TppToolbarManager.BuildFloatingToolWindowList(aList: TList);
var
  liToolbar: Integer;
  liPaletteButton: Integer;
  lbVisible: Boolean;
  lToolbar: TppCustomToolWindow97;
  lToolWindow: TppCustomToolWindow97;
  lPaletteButton: TppCustomPaletteButton;

begin

  aList.Clear;

  {get visible floating toolbars}
  for liToolbar := 0 to FToolbars.Count-1 do
    begin
      lToolbar := Toolbars[liToolbar];

      lbVisible := (lToolbar.DockedTo = nil) and (lToolbar.Visible);

      if lbVisible then
        aList.Add(lToolbar);

    end;

  {get visible floating tool palettes}
  for liPaletteButton := 0 to FPaletteButtons.Count-1 do
    begin
      lPaletteButton := TppCustomPaletteButton(FPaletteButtons[liPaletteButton]);

      if (lPaletteButton.Palette <> nil) then
        lToolWindow := lPaletteButton.Palette.ToolWindow
      else
        lToolWindow := nil;

      if (lToolWindow <> nil) and lToolWindow.Visible then
          aList.Add(lToolWindow);

    end;

end;  {procedure, BuildFloatingToolWindowList}

{------------------------------------------------------------------------------}
{ TppToolbarManager.HideFloatingToolWindows}

procedure TppToolbarManager.HideFloatingToolWindows;
var
  liToolWindow: Integer;

begin

  BuildFloatingToolWindowList(FFloatingToolWindows);

  for liToolWindow := 0 to FFloatingToolWindows.Count-1 do
    TppCustomToolWindow97(FFloatingToolWindows[liToolWindow]).Hide;

end; {procedure, HideFloatingToolWindows}

{------------------------------------------------------------------------------}
{ TppToolbarManager.ShowFloatingToolWindows}

procedure TppToolbarManager.ShowFloatingToolWindows;
var
  liToolWindow: Integer;

begin
  for liToolWindow := 0 to FFloatingToolWindows.Count-1 do
    begin
       TppCustomToolWindow97(FFloatingToolWindows[liToolWindow]).SetNotOnScreen(False);
       TppCustomToolWindow97(FFloatingToolWindows[liToolWindow]).Show;
    end;


end; {procedure, ShowFloatingToolWindows}



{------------------------------------------------------------------------------}
{ TppToolbarManager.GetToolbar}

function TppToolbarManager.GetToolbar(aIndex: Integer): TppCustomToolWindow97;
begin
   Result := TppToolWindow97(FToolbars.Objects[aIndex]);
end; {function, GetToolbar}


{------------------------------------------------------------------------------}
{ TppToolbarManager.FindToolbar}

function TppToolbarManager.FindToolbar(aToolbarName: String): TppCustomToolWindow97;
var
  liIndex: Integer;

begin

  liIndex := FToolbars.IndexOf(aToolbarName);

  if liIndex >= 0 then
    Result := TppCustomToolWindow97(FToolbars.Objects[liIndex])
  else
    Result := nil;

end; {function, FindToolbar}

{------------------------------------------------------------------------------}
{ TppToolbarManager.GetToolbarCount}

function TppToolbarManager.GetToolbarCount: Integer;
begin
  Result := FToolbars.Count;
end; {function, GetToolbarCount}


{------------------------------------------------------------------------------}
{ TppToolbarManager.AddToolbar}

procedure TppToolbarManager.AddToolbar(aToolbarName: String; aToolbar: TppCustomToolWindow97);
begin
  if (FindToolbar(aToolbarName) <> nil) then Exit;

  FToolbars.AddObject(aToolbarName, aToolbar);

  BuildPopupMenu;

end; {procedure, AddToolbar}

{------------------------------------------------------------------------------}
{ TppToolbarManager.NewToolbar}

function TppToolbarManager.NewToolbar(aToolbarName: String): TppToolbar;
var
  liIndex: Integer;
begin

  Result := TppToolbar(FindToolbar(aToolbarName));

  if (Result <> nil) then Exit;

  Result := TppToolbar.Create(FForm);

  Result.BeginUpdate;

  Result.Name     := ppRemoveSpacesFromString(aToolbarName);

  Result.Caption  := TranslateToolbarCaption(aToolbarName);

  liIndex := FToolbars.AddObject(aToolbarName, Result);

  if liIndex = 0 then
    Result.DockPos := 0
  else
    begin
      Result.DockRow := Toolbars[liIndex-1].DockRow;
      Result.DockPos := Toolbars[liIndex-1].DockPos + Toolbars[liIndex-1].Width;
    end;

  Result.DockedTo := FTopDock;

  Result.EndUpdate;

end; {procedure, NewToolbar}


{------------------------------------------------------------------------------}
{ TppToolbarManager.RemoveToolbar}

procedure TppToolbarManager.RemoveToolbar(aToolbarName: String);
var
  liIndex: Integer;

begin

  liIndex := FToolbars.IndexOf(aToolbarName);

  if liIndex < 0 then Exit;

  FToolbars.Delete(liIndex);

  BuildPopupMenu;

end; {procedure, RemoveToolbar}

{------------------------------------------------------------------------------}
{ TppToolbarManager.RegisterListChanged}

procedure TppToolbarManager.RegisterListChanged;
begin
  SetComponentClasses(ppComponentClassList);

end; {procedure, RegisterListChanged}

{------------------------------------------------------------------------------}
{ TppToolbarManager.SetComponentClasses}

procedure TppToolbarManager.SetComponentClasses(aComponentClasses: TStrings);
var
  lsClassName: String;
  liClass: Integer;
  lOldClasses: TStringList;
  
begin

  lOldClasses := TStringList.Create;

  lOldClasses.Assign(FComponentClasses);

  FComponentClasses.Assign(aComponentClasses);

  for liClass := 0 to aComponentClasses.Count-1 do
    begin
      lsClassName := aComponentClasses[liClass];

      if lOldClasses.IndexOf(lsClassName) < 0 then
        AddComponentClass(lsClassName);

    end;

  for liClass := 0 to lOldClasses.Count-1 do
    begin
      lsClassName := lOldClasses[liClass];

      if aComponentClasses.IndexOf(lsClassName) < 0 then
        RemoveComponentClass(lsClassName);

    end;


  lOldClasses.Free;

  BuildPopupMenu;

end; {procedure, SetComponentClasses}


{------------------------------------------------------------------------------}
{ TppToolbarManager.TranslateToolbarCaption}

function TppToolbarManager.TranslateToolbarCaption(const aToolbarCaption: String): String;
begin
  if aToolbarCaption = 'Standard Components' then
    Result := ppLoadStr(464)

  else if aToolbarCaption = 'Data Components' then
    Result := ppLoadStr(465)

  else if aToolbarCaption = 'Advanced Components' then
     Result := ppLoadStr(466)
  else
    Result  := aToolbarCaption;

end; {function, TranslateToolbarCaption}


{------------------------------------------------------------------------------}
{ TppToolbarManager.SetLanguageIndex}

procedure TppToolbarManager.SetLanguageIndex(aLanguageIndex: Longint);
var
  liToolbar: Integer;
  liControl: Integer;
  lComponentBar: TppToolbar;
  lButton: TppToolbarButton;

begin
  FLanguageIndex := aLanguageIndex;

  {for standard toolbars, set the toolbar's LanguageIndex prop }
  for liToolbar := 0 to  FToolWindows.Count-1 do
    TppToolWindow(FToolWindows[liToolbar]).LanguageIndex := FLanguageIndex;


  {for standard toolbars, set the toolbar's LanguageIndex prop }
  for liToolbar := 0 to  FStandardBars.Count-1 do
    TppToolbar(FStandardBars[liToolbar]).LanguageIndex := FLanguageIndex;

  {for component toolbars, use HintIndex stored in Button.Tag prop }
  for liToolbar := 0 to  FComponentBars.Count-1 do
    begin
      lComponentBar := TppToolbar(FComponentBars[liToolbar]);

      {translate the toolbar name into a caption}
      lComponentBar.Caption := TranslateToolbarCaption(lComponentBar.Caption);


      for liControl := 0 to  lComponentBar.ControlCount-1 do
        if lComponentBar.Controls[liControl] is TppToolbarButton then
          begin
            lButton := TppToolbarButton(lComponentBar.Controls[liControl]);

            if lButton.Tag > 0 then
              lButton.Hint := ppLoadStr(lButton.Tag);
          end;

    end;

  {rebuild the popup menu}
  BuildPopupMenu;

end; {procedure, SetLanguageIndex}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppColorPalette, TppColorButton, TppLineStylePalette, TppLineStyleButton,
                   TppLineThicknessPalette, TppLineThicknessButton, TppFontButton]);

finalization

  UnRegisterClasses([TppColorPalette, TppColorButton, TppLineStylePalette, TppLineStyleButton,
                     TppLineThicknessPalette, TppLineThicknessButton, TppFontButton]);

end.
