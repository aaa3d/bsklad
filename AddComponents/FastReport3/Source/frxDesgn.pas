{******************************************}
{ }
{ FastReport v3.0 }
{ Designer }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxDesgn;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, Menus, Buttons, StdCtrls, ToolWin, ExtCtrls, ActnList,
  CommCtrl, frxClass, frxDock, frxCtrls, frxDesgnCtrls, frxDesgnWorkspace,
  frxInsp, frxDialogForm, frxDataTree, frxReportTree, frxSynMemo,
  fs_iinterpreter
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxDesignerUnits = (duCM, duInches, duPixels, duChars);
  TfrxLoadReportEvent = function(Report:TfrxReport):Boolean of object;
  TfrxSaveReportEvent = function(Report:TfrxReport; SaveAs:Boolean):Boolean of object;
  TfrxDesignerRestriction =
    (drDontInsertObject, drDontDeletePage, drDontCreatePage, drDontChangePageOptions,
     drDontCreateReport, drDontLoadReport, drDontSaveReport,
     drDontPreviewReport, drDontEditVariables, drDontChangeReportOptions,
     drDontEditReportData);
  TfrxDesignerRestrictions = set of TfrxDesignerRestriction;
  TSampleFormat = class;

  TfrxDesigner = class(TComponent)
  private
    FCloseQuery:Boolean;
    FOpenDir:String;
    FSaveDir:String;
    FRestrictions:TfrxDesignerRestrictions;
    FOnLoadReport:TfrxLoadReportEvent;
    FOnSaveReport:TfrxSaveReportEvent;
    FOnShow:TNotifyEvent;
    FOnShowStartupScreen:TNotifyEvent;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  published
    property CloseQuery:Boolean read FCloseQuery write FCloseQuery default True;
    property OpenDir:String read FOpenDir write FOpenDir;
    property SaveDir:String read FSaveDir write FSaveDir;
    property Restrictions:TfrxDesignerRestrictions read FRestrictions write FRestrictions;
    property OnLoadReport:TfrxLoadReportEvent read FOnLoadReport write FOnLoadReport;
    property OnSaveReport:TfrxSaveReportEvent read FOnSaveReport write FOnSaveReport;
    property OnShow:TNotifyEvent read FOnShow write FOnShow;
    property OnShowStartupScreen:TNotifyEvent read FOnShowStartupScreen write FOnShowStartupScreen;
  end;

  TfrxDesignerForm = class(TfrxCustomDesigner)
    Bevel1:TBevel;
    StatusBar:TStatusBar;
    DockBottom:TfrxDock;
    Tab:TTabControl;
    DockRight:TfrxDock;
    DockTop:TfrxDock;
    TextTB:TfrxToolBar;
    TextTB1:TToolBar;
    PanelTB1:TfrxTBPanel;
    FontSizeCB:TfrxComboBox;
    FontNameCB:TfrxFontComboBox;
    BoldB:TToolButton;
    ItalicB:TToolButton;
    UnderlineB:TToolButton;
    SepTB8:TToolButton;
    FontColorB:TToolButton;
    HighlightB:TToolButton;
    SepTB9:TToolButton;
    TextAlignLeftB:TToolButton;
    TextAlignCenterB:TToolButton;
    TextAlignRightB:TToolButton;
    TextAlignBlockB:TToolButton;
    SepTB10:TToolButton;
    TextAlignTopB:TToolButton;
    TextAlignMiddleB:TToolButton;
    TextAlignBottomB:TToolButton;
    FrameTB:TfrxToolBar;
    FrameTB1:TToolBar;
    FrameTopB:TToolButton;
    FrameBottomB:TToolButton;
    FrameLeftB:TToolButton;
    FrameRightB:TToolButton;
    SepTB11:TToolButton;
    FrameAllB:TToolButton;
    FrameNoB:TToolButton;
    SepTB12:TToolButton;
    FillColorB:TToolButton;
    FrameColorB:TToolButton;
    FrameStyleB:TToolButton;
    PanelTB2:TfrxTBPanel;
    FrameWidthCB:TfrxComboBox;
    StandardTB:TfrxToolBar;
    StandardTB1:TToolBar;
    NewB:TToolButton;
    OpenB:TToolButton;
    SaveB:TToolButton;
    PreviewB:TToolButton;
    SepTB1:TToolButton;
    CutB:TToolButton;
    CopyB:TToolButton;
    PasteB:TToolButton;
    SepTB2:TToolButton;
    UndoB:TToolButton;
    RedoB:TToolButton;
    SepTB3:TToolButton;
    SepTB4:TToolButton;
    NewPageB:TToolButton;
    NewDialogB:TToolButton;
    DeletePageB:TToolButton;
    PageSettingsB:TToolButton;
    ShowGridB:TToolButton;
    AlignToGridB:TToolButton;
    ExtraToolsTB:TfrxToolBar;
    PagePopup:TPopupMenu;
    CutMI1:TMenuItem;
    CopyMI1:TMenuItem;
    PasteMI1:TMenuItem;
    DeleteMI1:TMenuItem;
    SelectAllMI1:TMenuItem;
    SepMI8:TMenuItem;
    EditMI1:TMenuItem;
    MainMenu:TMainMenu;
    FileMenu:TMenuItem;
    EditMenu:TMenuItem;
    ViewMenu:TMenuItem;
    ToolbarsMI:TMenuItem;
    StandardMI:TMenuItem;
    TextMI:TMenuItem;
    FrameMI:TMenuItem;
    AlignmentMI:TMenuItem;
    ToolsMI:TMenuItem;
    InspectorMI:TMenuItem;
    DataTreeMI:TMenuItem;
    OptionsMI:TMenuItem;
    HelpMenu:TMenuItem;
    HelpContentsMI:TMenuItem;
    SepMI7:TMenuItem;
    AboutMI:TMenuItem;
    OpenDialog:TOpenDialog;
    SaveDialog:TSaveDialog;
    TabPopup:TPopupMenu;
    NewPageMI1:TMenuItem;
    NewDialogMI1:TMenuItem;
    DeletePageMI1:TMenuItem;
    PageSettingsMI1:TMenuItem;
    ActionList:TActionList;
    ExitCmd:TAction;
    CutCmd:TAction;
    CopyCmd:TAction;
    PasteCmd:TAction;
    UndoCmd:TAction;
    RedoCmd:TAction;
    DeleteCmd:TAction;
    SelectAllCmd:TAction;
    EditCmd:TAction;
    BringToFrontCmd:TAction;
    SendToBackCmd:TAction;
    DeletePageCmd:TAction;
    NewItemCmd:TAction;
    NewPageCmd:TAction;
    NewDialogCmd:TAction;
    NewReportCmd:TAction;
    OpenCmd:TAction;
    SaveCmd:TAction;
    SaveAsCmd:TAction;
    VariablesCmd:TAction;
    PageSettingsCmd:TAction;
    PreviewCmd:TAction;
    NewMI:TMenuItem;
    NewReportMI:TMenuItem;
    NewPageMI:TMenuItem;
    NewDialogMI:TMenuItem;
    SepMI1:TMenuItem;
    OpenMI:TMenuItem;
    SaveMI:TMenuItem;
    SaveAsMI:TMenuItem;
    VariablesMI:TMenuItem;
    SepMI3:TMenuItem;
    PreviewMI:TMenuItem;
    SepMI4:TMenuItem;
    ExitMI:TMenuItem;
    UndoMI:TMenuItem;
    RedoMI:TMenuItem;
    SepMI5:TMenuItem;
    CutMI:TMenuItem;
    CopyMI:TMenuItem;
    PasteMI:TMenuItem;
    DeleteMI:TMenuItem;
    DeletePageMI:TMenuItem;
    SelectAllMI:TMenuItem;
    SepMI6:TMenuItem;
    BringtoFrontMI:TMenuItem;
    SendtoBackMI:TMenuItem;
    EditMI:TMenuItem;
    PanelTB3:TfrxTBPanel;
    ScaleCB:TfrxComboBox;
    ObjectsTB1:TToolBar;
    ObjectSelectB:TToolButton;
    ObjectBandB:TToolButton;
    BandsPopup:TPopupMenu;
    ReportTitleMI:TMenuItem;
    ReportSummaryMI:TMenuItem;
    PageHeaderMI:TMenuItem;
    PageFooterMI:TMenuItem;
    HeaderMI:TMenuItem;
    FooterMI:TMenuItem;
    MasterDataMI:TMenuItem;
    DetailDataMI:TMenuItem;
    SubdetailDataMI:TMenuItem;
    GroupHeaderMI:TMenuItem;
    GroupFooterMI:TMenuItem;
    ColumnHeaderMI:TMenuItem;
    ColumnFooterMI:TMenuItem;
    ChildMI:TMenuItem;
    LeftDockSite1:TfrxDockSite;
    LeftDockSite2:TfrxDockSite;
    RightDockSite:TfrxDockSite;
    VariablesB:TToolButton;
    SepTB13:TToolButton;
    ScrollBoxPanel:TPanel;
    ScrollBox:TfrxScrollBox;
    LeftRuler:TfrxRuler;
    TopRuler:TfrxRuler;
    PageSettingsMI:TMenuItem;
    Timer:TTimer;
    ReportSettingsMI:TMenuItem;
    Data4levelMI:TMenuItem;
    Data5levelMI:TMenuItem;
    Data6levelMI:TMenuItem;
    SepMI10:TMenuItem;
    SepMI9:TMenuItem;
    ShowGuidesMI:TMenuItem;
    ShowRulersMI:TMenuItem;
    DeleteGuidesMI:TMenuItem;
    SepMI11:TMenuItem;
    N1:TMenuItem;
    BringtoFrontMI1:TMenuItem;
    SendtoBackMI1:TMenuItem;
    SepMI12:TMenuItem;
    RotateB:TToolButton;
    RotationPopup:TPopupMenu;
    R0MI:TMenuItem;
    R45MI:TMenuItem;
    R90MI:TMenuItem;
    R180MI:TMenuItem;
    R270MI:TMenuItem;
    SampleFormatB:TToolButton;
    SetToGridB:TToolButton;
    ShadowB:TToolButton;
    HandToolB:TToolButton;
    ZoomToolB:TToolButton;
    TextToolB:TToolButton;
    FormatToolB:TToolButton;
    SepTB14:TToolButton;
    ReportMenu:TMenuItem;
    ReportDataMI:TMenuItem;
    CodePanel:TPanel;
    CodeTB:TToolBar;
    frTBPanel1:TfrxTBPanel;
    LangL:TLabel;
    LangCB:TfrxComboBox;
    OpenScriptDialog:TOpenDialog;
    SaveScriptDialog:TSaveDialog;
    OpenScriptB:TToolButton;
    SaveScriptB:TToolButton;
    ReportTreeMI:TMenuItem;
    ObjectsPopup:TPopupMenu;
    AlignTB:TfrxToolBar;
    AlignTB1:TToolBar;
    AlignLeftsB:TToolButton;
    AlignHorzCentersB:TToolButton;
    AlignRightsB:TToolButton;
    AlignTopsB:TToolButton;
    AlignVertCentersB:TToolButton;
    AlignBottomsB:TToolButton;
    SpaceHorzB:TToolButton;
    SpaceVertB:TToolButton;
    CenterHorzB:TToolButton;
    CenterVertB:TToolButton;
    SameWidthB:TToolButton;
    SameHeightB:TToolButton;
    SepTB15:TToolButton;
    SepTB16:TToolButton;
    SepTB18:TToolButton;
    SepTB17:TToolButton;
    OverlayMI:TMenuItem;
    StyleCB:TfrxComboBox;
    ReportStylesMI:TMenuItem;
    TabOrderMI:TMenuItem;
    ExtraToolsTB1:TToolBar;
    SepTB19:TToolButton;
    RunScriptB:TToolButton;
    StepScriptB:TToolButton;
    StopScriptB:TToolButton;
    EvaluateB:TToolButton;
    N2:TMenuItem;
    FindMI:TMenuItem;
    FindNextMI:TMenuItem;
    ReplaceMI:TMenuItem;
    DMPPopup:TPopupMenu;
    BoldMI:TMenuItem;
    ItalicMI:TMenuItem;
    UnderlineMI:TMenuItem;
    SuperScriptMI:TMenuItem;
    SubScriptMI:TMenuItem;
    CondensedMI:TMenuItem;
    WideMI:TMenuItem;
    N12cpiMI:TMenuItem;
    N15cpiMI:TMenuItem;
    FontB:TToolButton;
    VerticalbandsMI:TMenuItem;
    HeaderMI1:TMenuItem;
    FooterMI1:TMenuItem;
    MasterDataMI1:TMenuItem;
    DetailDataMI1:TMenuItem;
    SubdetailDataMI1:TMenuItem;
    GroupHeaderMI1:TMenuItem;
    GroupFooterMI1:TMenuItem;
    ChildMI1:TMenuItem;
    N3:TMenuItem;
    GroupB:TToolButton;
    UngroupB:TToolButton;
    SepTB20:TToolButton;
    GroupCmd:TAction;
    UngroupCmd:TAction;
    GroupMI:TMenuItem;
    UngroupMI:TMenuItem;
    DataLV:TListView;
    procedure FormCreate(Sender:TObject);
    procedure ExitCmdExecute(Sender:TObject);
    procedure ObjectsButtonClick(Sender:TObject);
    procedure StatusBarDrawPanel(StatusBar:TStatusBar;
      Panel:TStatusPanel; const ARect:TRect);
    procedure FormDestroy(Sender:TObject);
    procedure ScrollBoxMouseWheelUp(Sender:TObject; Shift:TShiftState;
      MousePos:TPoint; var Handled:Boolean);
    procedure ScrollBoxMouseWheelDown(Sender:TObject; Shift:TShiftState;
      MousePos:TPoint; var Handled:Boolean);
    procedure ScrollBoxResize(Sender:TObject);
    procedure ScaleCBClick(Sender:TObject);
    procedure ShowGridBClick(Sender:TObject);
    procedure AlignToGridBClick(Sender:TObject);
    procedure StatusBarDblClick(Sender:TObject);
    procedure StatusBarMouseDown(Sender:TObject; Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer);
    procedure InsertBandClick(Sender:TObject);
    procedure BandsPopupPopup(Sender:TObject);
    procedure ToolbarsMIOpen(Sender:TObject);
    procedure ToolbarsMIClick(Sender:TObject);
    procedure FormClose(Sender:TObject; var Action:TCloseAction);
    procedure NewReportCmdExecute(Sender:TObject);
    procedure ToolButtonClick(Sender:TObject);
    procedure FormKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure FontColorBClick(Sender:TObject);
    procedure FrameStyleBClick(Sender:TObject);
    procedure TabChange(Sender:TObject);
    procedure OptionsMIClick(Sender:TObject);
    procedure UndoCmdExecute(Sender:TObject);
    procedure RedoCmdExecute(Sender:TObject);
    procedure CutCmdExecute(Sender:TObject);
    procedure CopyCmdExecute(Sender:TObject);
    procedure PasteCmdExecute(Sender:TObject);
    procedure TimerTimer(Sender:TObject);
    procedure DeletePageCmdExecute(Sender:TObject);
    procedure NewDialogCmdExecute(Sender:TObject);
    procedure NewPageCmdExecute(Sender:TObject);
    procedure SaveCmdExecute(Sender:TObject);
    procedure SaveAsCmdExecute(Sender:TObject);
    procedure OpenCmdExecute(Sender:TObject);
    procedure FormCloseQuery(Sender:TObject; var CanClose:Boolean);
    procedure DeleteCmdExecute(Sender:TObject);
    procedure SelectAllCmdExecute(Sender:TObject);
    procedure EditCmdExecute(Sender:TObject);
    procedure TabChanging(Sender:TObject; var AllowChange:Boolean);
    procedure AboutMIClick(Sender:TObject);
    procedure ReportSettingsMIClick(Sender:TObject);
    procedure PageSettingsCmdExecute(Sender:TObject);
    procedure TopRulerDragOver(Sender, Source:TObject; X, Y:Integer;
      State:TDragState; var Accept:Boolean);
    procedure ShowRulersMIClick(Sender:TObject);
    procedure ShowGuidesMIClick(Sender:TObject);
    procedure DeleteGuidesMIClick(Sender:TObject);
    procedure AlignLeftsBClick(Sender:TObject);
    procedure AlignRightsBClick(Sender:TObject);
    procedure AlignTopsBClick(Sender:TObject);
    procedure AlignBottomsBClick(Sender:TObject);
    procedure AlignHorzCentersBClick(Sender:TObject);
    procedure AlignVertCentersBClick(Sender:TObject);
    procedure CenterHorzBClick(Sender:TObject);
    procedure CenterVertBClick(Sender:TObject);
    procedure SpaceHorzBClick(Sender:TObject);
    procedure SpaceVertBClick(Sender:TObject);
    procedure SelectToolBClick(Sender:TObject);
    procedure PagePopupPopup(Sender:TObject);
    procedure BringToFrontCmdExecute(Sender:TObject);
    procedure SendToBackCmdExecute(Sender:TObject);
    procedure SampleFormatBClick(Sender:TObject);
    procedure LangCBClick(Sender:TObject);
    procedure OpenScriptBClick(Sender:TObject);
    procedure SaveScriptBClick(Sender:TObject);
    procedure ReportDataMIClick(Sender:TObject);
    procedure CodeWindowDragOver(Sender, Source:TObject; X, Y:Integer;
      State:TDragState; var Accept:Boolean);
    procedure CodeWindowDragDrop(Sender, Source:TObject; X, Y:Integer);
    procedure VariablesCmdExecute(Sender:TObject);
    procedure ObjectBandBClick(Sender:TObject);
    procedure PreviewCmdExecute(Sender:TObject);
    procedure HighlightBClick(Sender:TObject);
    procedure TabMouseDown(Sender:TObject; Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer);
    procedure TabMouseMove(Sender:TObject; Shift:TShiftState; X,
      Y:Integer);
    procedure TabMouseUp(Sender:TObject; Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer);
    procedure TabDragDrop(Sender, Source:TObject; X, Y:Integer);
    procedure TabDragOver(Sender, Source:TObject; X, Y:Integer;
      State:TDragState; var Accept:Boolean);
    procedure SameWidthBClick(Sender:TObject);
    procedure SameHeightBClick(Sender:TObject);
    procedure ReportStylesMIClick(Sender:TObject);
    procedure NewItemCmdExecute(Sender:TObject);
    procedure TabOrderMIClick(Sender:TObject);
    procedure RunScriptBClick(Sender:TObject);
    procedure StopScriptBClick(Sender:TObject);
    procedure EvaluateBClick(Sender:TObject);
    procedure FindMIClick(Sender:TObject);
    procedure FindNextMIClick(Sender:TObject);
    procedure GroupCmdExecute(Sender:TObject);
    procedure UngroupCmdExecute(Sender:TObject);
    procedure DataLVClick(Sender:TObject);
    procedure DataLVDblClick(Sender:TObject);
    procedure DataLVKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure DataLVChange(Sender:TObject; Item:TListItem;
      Change:TItemChange);
  private
    { Private declarations }
    FClipboard:TfrxClipboard;
    FCodeWindow:TfrxSyntaxMemo;
    FColor:TColor;
    FCoord1:String;
    FCoord2:String;
    FCoord3:String;
    FDialogForm:TfrxDialogForm;
    FEditAfterInsert:Boolean;
    FDataTree:TfrxDataTreeForm;
    FDropFields:Boolean;
    FGridAlign:Boolean;
    FGridSize1:Extended;
    FGridSize2:Extended;
    FGridSize3:Extended;
    FGridSize4:Extended;
    FInspector:TfrxObjectInspector;
    FLineStyle:TfrxFrameStyle;
    FLocalizedOI:Boolean;
    FModifiedBy:TObject;
    FMouseDown:Boolean;
    FOldDesignerComp:TfrxDesigner;
    FOldUnits:TfrxDesignerUnits;
    FPagePositions:TStrings;
    FRecentFiles:TStringList;
    FRecentMenuIndex:Integer;
    FReportTree:TfrxReportTreeForm;
    FSampleFormat:TSampleFormat;
    FScale:Extended;
    FScriptFirstTime:Boolean;
    FScriptRunning:Boolean;
    FScriptStopped:Boolean;
    FSearchCase:Boolean;
    FSearchIndex:Integer;
    FSearchReplace:Boolean;
    FSearchReplaceText:String;
    FSearchText:String;
    FShowGrid:Boolean;
    FShowGuides:Boolean;
    FShowRulers:Boolean;
    FShowStartup:Boolean;
    FToolsColor:TColor;
    FUndoBuffer:TfrxUndoBuffer;
    FUnits:TfrxDesignerUnits;
    FUnitsDblClicked:Boolean;
    FUpdatingControls:Boolean;
    FWorkspace:TfrxDesignerWorkspace;
    FWorkspaceColor:TColor;

    procedure AttachDialogFormEvents(Attach:Boolean);
    procedure CreateColorSelector(Sender:TToolButton);
    procedure CreateExtraToolbar;
    procedure CreateToolWindows;
    procedure CreateObjectsToolbar;
    procedure CreateWorkspace;
    procedure DialogFormKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure DialogFormKeyPress(Sender:TObject; var Key:Char);
    procedure DialogFormKeyUp(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure DialogFormModify(Sender:TObject);
    procedure Done;
    procedure FindText;
    procedure Init;
    procedure OnCodeChanged(Sender:TObject);
    procedure OnColorChanged(Sender:TObject);
    procedure OnComponentMenuClick(Sender:TObject);
    procedure OnChangePosition(Sender:TObject);
    procedure OnDataTreeDblClick(Sender:TObject);
    procedure OnEditObject(Sender:TObject);
    procedure OnExtraToolClick(Sender:TObject);
    procedure OnInsertObject(Sender:TObject);
    procedure OnModify(Sender:TObject);
    procedure OnNotifyPosition(ARect:TfrxRect);
    procedure OnRunLine(Sender:TfsScript; const UnitName, SourcePos:String);
    procedure OnSelectionChanged(Sender:TObject);
    procedure OnStyleChanged(Sender:TObject);
    procedure OpenRecentFile(Sender:TObject);
    procedure ReadButtonImages;
    procedure ReloadObjects;
    procedure RestorePagePosition;
    procedure SavePagePosition;
    procedure SaveState;
    procedure SetScale(Value:Extended);
    procedure SetGridAlign(const Value:Boolean);
    procedure SetShowGrid(const Value:Boolean);
    procedure SetShowRulers(const Value:Boolean);
    procedure SetToolsColor(const Value:TColor);
    procedure SetUnits(const Value:TfrxDesignerUnits);
    procedure SetWorkspaceColor(const Value:TColor);
    procedure SwitchToolbar;
    procedure UpdateCaption;
    procedure UpdateControls;
    procedure UpdateDataControls;
    procedure UpdatePageDimensions;
    procedure UpdateRecentFiles(NewFile:String);
    procedure UpdateStyles;
    procedure UpdateSyntaxType;
    function AskSave:Word;
    function CheckOp(Op:TfrxDesignerRestriction):Boolean;
    function GetPageIndex:Integer;
    function GetReportName:String;
    procedure SetShowGuides(const Value:Boolean);
    procedure CMStartup(var Message:TMessage); message WM_USER+1;
  protected
    procedure SetModified(const Value:Boolean); override;
    procedure SetPage(const Value:TfrxPage); override;
    function GetCode:TStrings; override;
  public
    { Public declarations }
    function InsertExpression(const Expr:String):String; override;
    procedure LoadFile(FileName:String; UseOnLoadEvent:Boolean);
    procedure Lock; override;
    procedure ReloadPages(Index:Integer); override;
    procedure ReloadReport; override;
    procedure RestoreState(RestoreDefault:Boolean = False);
    procedure SaveFile(SaveAs:Boolean; UseOnSaveEvent:Boolean);
    procedure SwitchToCodeWindow;
    procedure UpdateDataTree; override;
    procedure UpdatePage; override;
    function GetDefaultObjectSize:TfrxPoint;
    function mmToUnits(mm:Extended; X:Boolean = True):Extended;
    function UnitsTomm(mm:Extended; X:Boolean = True):Extended;

    property CodeWindow:TfrxSyntaxMemo read FCodeWindow;
    property DataTree:TfrxDataTreeForm read FDataTree;
    property DropFields:Boolean read FDropFields write FDropFields;
    property EditAfterInsert:Boolean read FEditAfterInsert write FEditAfterInsert;
    property GridAlign:Boolean read FGridAlign write SetGridAlign;
    property GridSize1:Extended read FGridSize1 write FGridSize1;
    property GridSize2:Extended read FGridSize2 write FGridSize2;
    property GridSize3:Extended read FGridSize3 write FGridSize3;
    property GridSize4:Extended read FGridSize4 write FGridSize4;
    property SampleFormat:TSampleFormat read FSampleFormat;
    property Scale:Extended read FScale write SetScale;
    property ShowGrid:Boolean read FShowGrid write SetShowGrid;
    property ShowGuides:Boolean read FShowGuides write SetShowGuides;
    property ShowRulers:Boolean read FShowRulers write SetShowRulers;
    property ShowStartup:Boolean read FShowStartup write FShowStartup;
    property ToolsColor:TColor read FToolsColor write SetToolsColor;
    property Units:TfrxDesignerUnits read FUnits write SetUnits;
    property Workspace:TfrxDesignerWorkspace read FWorkspace;
    property WorkspaceColor:TColor read FWorkspaceColor write SetWorkspaceColor;
  end;

  TSampleFormat = class(TObject)
  private
    FMemo:TfrxCustomMemoView;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ApplySample(Memo:TfrxCustomMemoView);
    procedure SetAsSample(Memo:TfrxCustomMemoView);
    property Memo:TfrxCustomMemoView read FMemo;
  end;

var
  frxDesignerComp:TfrxDesigner;

implementation

{$R *.DFM}
{$R *.RES}

uses
  TypInfo, IniFiles, Registry,
  frxDsgnIntf, frxUtils, frxPopupForm, frxDesgnWorkspace1,
  frxDesgnEditors, frxEditOptions, frxEditReport, frxEditPage, frxAbout,
  fs_itools, frxXML, frxEditReportData, frxEditVar, frxEditExpr,
  frxEditHighlight, frxEditStyle, frxNewItem, frxStdWizard,
  frxEditTabOrder, frxCodeUtils, frxRes, frxrcDesgn, frxDMPClass,
  frxEvaluateForm, frxSearchDialog;

type
  THackControl = class(TWinControl);

{ TSampleFormat }

constructor TSampleFormat.Create;
begin
  FMemo:= TfrxMemoView.Create(nil);
end;

destructor TSampleFormat.Destroy;
begin
  FMemo.Free;
  inherited;
end;

procedure TSampleFormat.ApplySample(Memo:TfrxCustomMemoView);
begin
  Memo.Color:= FMemo.Color;
  Memo.Font:= FMemo.Font;
  Memo.Frame.Assign(FMemo.Frame);
  Memo.BrushStyle:= FMemo.BrushStyle;
  Memo.HAlign:= FMemo.HAlign;
  Memo.VAlign:= FMemo.VAlign;
  Memo.LineSpacing:= FMemo.LineSpacing;
  Memo.ParentFont:= FMemo.ParentFont;
end;

procedure TSampleFormat.SetAsSample(Memo:TfrxCustomMemoView);
begin
  FMemo.Assign(Memo);
  FMemo.FlowTo:= nil;
end;

{ TfrxDesigner }

constructor TfrxDesigner.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  FCloseQuery:= True;
  frxDesignerComp:= Self;
end;

destructor TfrxDesigner.Destroy;
begin
  frxDesignerComp:= nil;
  inherited Destroy;
end;

{ TfrxDesignerForm }

{ Form events }
{------------------------------------------------------------------------------}

procedure TfrxDesignerForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
  ReadButtonImages;
  CreateObjectsToolbar;
  CreateWorkspace;
  CreateToolWindows;
  Init;
  RestoreState;
  CreateExtraToolbar;
  ReloadPages(0);
  UpdateCaption;
  UpdateRecentFiles('');

  if (frxDesignerComp<>nil) and Assigned(frxDesignerComp.FOnShow) then
    frxDesignerComp.FOnShow(Self);
end;

procedure TfrxDesignerForm.FormDestroy(Sender:TObject);
begin
  SaveState;
  Done;
end;

procedure TfrxDesignerForm.FormClose(Sender:TObject; var Action:TCloseAction);
begin
  FModalFinished:= True;
end;

procedure TfrxDesignerForm.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
var
  w:Word;
begin
  if FScriptRunning then
  begin
    CanClose:= False;
    Exit;
  end;

  CanClose:= True;
  Report.ScriptText:= CodeWindow.Lines;

  if (frxDesignerComp<>nil) and not frxDesignerComp.CloseQuery then
    Exit;

  if Modified and not (csDesigning in Report.ComponentState) and CheckOp(drDontSaveReport) then
  begin
    w:= AskSave;

    if IsPreviewDesigner then
    begin
      if w = mrNo then
        Modified:= False
    end
    else if w = mrYes then
      SaveFile(False, True);

    if not IsPreviewDesigner then
    begin
      if w = mrNo then
        Modified:= False
      else
        Modified:= True;
    end;

    if w = mrCancel then
      CanClose:= False;
  end;
end;

procedure TfrxDesignerForm.FormKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if (FDialogForm<>nil) and (ActiveControl<>FInspector.Edit1) then
    THackControl(FWorkspace).KeyDown(Key, Shift);

  if Key = vk_Return then
    if ActiveControl = FontSizeCB then
      ToolButtonClick(FontSizeCB)
    else if ActiveControl = ScaleCB then
      ScaleCBClick(Self);

  if Page<>nil then
    if Key = vk_Insert then
      if Shift = [ssShift] then
        PasteCmdExecute(nil)
      else if Shift = [ssCtrl] then
        CopyCmdExecute(nil);

  if Key = vk_Delete then
    if Shift = [ssShift] then
      CutCmdExecute(nil);

  if (Key = Ord('E')) and (Shift = [ssCtrl]) then
    Page:= nil;

  { code window keys }
// if FPage = nil then
    if ((Key = vk_F4) or (Key = vk_F5)) and (Shift = []) then
    begin
      CodeWindow.BreakPoint:= CodeWindow.GetPos.Y;
      RunScriptBClick(StepScriptB);
    end
    else if (Key = vk_F2) and (Shift = [ssCtrl]) then
      StopScriptBClick(StopScriptB)
    else if (Key = vk_F7) and (Shift = [ssCtrl]) then
      EvaluateBClick(EvaluateB)
    else if Key = vk_F9 then
      RunScriptBClick(RunScriptB)
    else if (Key = vk_F7) or (Key = vk_F8) then
      RunScriptBClick(StepScriptB)
end;

procedure TfrxDesignerForm.CMStartup(var Message:TMessage);
begin
  if FShowStartup then
    if (frxDesignerComp<>nil) and Assigned(frxDesignerComp.FOnShowStartupScreen) then
      frxDesignerComp.FOnShowStartupScreen(Self);
end;

{ Get/Set methods }
{------------------------------------------------------------------------------}

function TfrxDesignerForm.GetDefaultObjectSize:TfrxPoint;
begin
  case FUnits of
    duCM:Result:= frxPoint(fr1cm * 2.5, fr1cm * 0.5);
    duInches:Result:= frxPoint(fr1in, fr1in * 0.2);
    duPixels:Result:= frxPoint(80, 16);
    duChars:Result:= frxPoint(fr1CharX * 10, fr1CharY);
  end;
end;

function TfrxDesignerForm.GetCode:TStrings;
begin
  Result:= CodeWindow.Lines;
end;

procedure TfrxDesignerForm.SetGridAlign(const Value:Boolean);
begin
  FGridAlign:= Value;
  AlignToGridB.Down:= FGridAlign;
  FWorkspace.GridAlign:= FGridAlign;
end;

procedure TfrxDesignerForm.SetModified(const Value:Boolean);
var
  i:Integer;
begin
  inherited;
  Report.ScriptText:= CodeWindow.Lines;
  FUndoBuffer.AddUndo(Report);
  FUndoBuffer.ClearRedo;
  SaveCmd.Enabled:= Modified;

  if FModifiedBy<>Self then
    UpdateControls;

  if FModifiedBy = FInspector then
    if (FSelectedObjects[0] = FPage) or
       (TObject(FSelectedObjects[0]) is TfrxSubreport) then
    begin
      i:= Report.Objects.IndexOf(FPage);
      if i >= 0 then
        ReloadPages(i);
    end;

  if FModifiedBy<>FWorkspace then
  begin
    FWorkspace.UpdateView;
    FWorkspace.AdjustBands;
  end;

  if FModifiedBy<>FInspector then
    FInspector.UpdateProperties;

  FReportTree.UpdateItems;
  FModifiedBy:= nil;
  UpdateDataControls;
end;

procedure TfrxDesignerForm.SetPage(const Value:TfrxPage);
begin
  inherited;

  Tab.TabIndex:= Report.Objects.IndexOf(FPage)+1;
  AttachDialogFormEvents(False);
  ScrollBoxPanel.Visible:= FPage<>nil;
  CodePanel.Visible:= FPage = nil;

  SwitchToolbar;
  UpdateControls;

  if FPage = nil then
  begin
    CodeWindow.SetFocus;
    Exit;
  end
  else if FPage is TfrxReportPage then
  begin
    with FWorkspace do
    begin
      Parent:= ScrollBox;
      Align:= alNone;
      Color:= FWorkspaceColor;
      Scale:= Self.Scale;
    end;

    if FPage is TfrxDMPPage then
      Units:= duChars else
      Units:= FOldUnits;
    UpdatePageDimensions;
    if Visible then
      ScrollBox.SetFocus;
  end
  else
  begin
    Units:= duPixels;
    FDialogForm:= TfrxDialogForm(TfrxDialogPage(FPage).DialogForm);

    with FWorkspace do
    begin
      Parent:= FDialogForm;
      Align:= alClient;
      GridType:= gtDialog;
      GridX:= FGridSize4;
      GridY:= FGridSize4;
      Color:= TfrxDialogPage(FPage).Color;
      Scale:= 1;
      SetPageDimensions(0, 0, Rect(0, 0, 0, 0));
    end;

    with FDialogForm do
    begin
      BorderStyle:= bsSizeable;
      AttachDialogFormEvents(True);
      Show;
// SetFocus;
    end;
  end;

  ReloadObjects;
  RestorePagePosition;
  UpdateDataControls;
end;

procedure TfrxDesignerForm.SetScale(Value:Extended);
begin
  ScrollBox.AutoScroll:= False;
  if Value = 0 then
    Value:= 1;
  if Value > 20 then
    Value:= 20;
  FScale:= Value;
  TopRuler.Scale:= Value;
  LeftRuler.Scale:= Value;
  FWorkspace.Scale:= Value;
  ScaleCB.Text:= IntToStr(Round(FScale * 100))+'%';
  UpdatePageDimensions;
  ScrollBox.AutoScroll:= True;
end;

procedure TfrxDesignerForm.SetShowGrid(const Value:Boolean);
begin
  FShowGrid:= Value;
  ShowGridB.Down:= FShowGrid;
  FWorkspace.ShowGrid:= FShowGrid;
end;

procedure TfrxDesignerForm.SetShowRulers(const Value:Boolean);
begin
  FShowRulers:= Value;
  TopRuler.Visible:= FShowRulers;
  LeftRuler.Visible:= FShowRulers;
  ShowRulersMI.Checked:= FShowRulers;
end;

procedure TfrxDesignerForm.SetShowGuides(const Value:Boolean);
begin
  FShowGuides:= Value;
  TDesignerWorkspace(FWorkspace).ShowGuides:= FShowGuides;
  ShowGuidesMI.Checked:= FShowGuides;
end;

procedure TfrxDesignerForm.SetUnits(const Value:TfrxDesignerUnits);
var
  s:String;
  gType:TfrxGridType;
  gSizeX, gSizeY:Extended;
begin
  FUnits:= Value;
  s:= '';
  if FUnits = duCM then
  begin
    s:= frxResources.Get('dsCm');
    gType:= gt1cm;
    gSizeX:= FGridSize1 * fr1cm;
    gSizeY:= gSizeX;
  end
  else if FUnits = duInches then
  begin
    s:= frxResources.Get('dsInch');
    gType:= gt1in;
    gSizeX:= FGridSize2 * fr1in;
    gSizeY:= gSizeX;
  end
  else if FUnits = duPixels then
  begin
    s:= frxResources.Get('dsPix');
    gType:= gt1pt;
    gSizeX:= FGridSize3;
    gSizeY:= gSizeX;
  end
  else {if FUnits = duChars then}
  begin
    s:= frxResources.Get('dsChars');
    gType:= gtChar;
    gSizeX:= fr1CharX;
    gSizeY:= fr1CharY;
  end;

  StatusBar.Panels[0].Text:= s;
  TopRuler.Units:= TfrxRulerUnits(FUnits);
  LeftRuler.Units:= TfrxRulerUnits(FUnits);

  with FWorkspace do
  begin
    GridType:= gType;
    GridX:= gSizeX;
    GridY:= gSizeY;
    AdjustBands;
  end;

  if FSelectedObjects.Count<>0 then
    OnSelectionChanged(Self);
end;

procedure TfrxDesignerForm.SetToolsColor(const Value:TColor);
begin
  FToolsColor:= Value;
  FInspector.SetColor(Value);
  FDataTree.SetColor(Value);
  FReportTree.SetColor(Value);
end;

procedure TfrxDesignerForm.SetWorkspaceColor(const Value:TColor);
begin
  FWorkspaceColor:= Value;
  if not (FPage is TfrxDialogPage) then
    FWorkspace.Color:= Value;
end;

{ Service methods }
{------------------------------------------------------------------------------}

procedure TfrxDesignerForm.Init;
var
  i:Integer;
begin
  FScale:= 1;
  ScrollBoxPanel.Align:= alClient;
  CodePanel.Align:= alClient;

  fsGetLanguageList(LangCB.Items);
  LangCB.ItemIndex:= LangCB.Items.IndexOf(Report.ScriptLanguage);

  UpdateSyntaxType;
  UpdateStyles;

  FUndoBuffer:= TfrxUndoBuffer.Create;
  FUndoBuffer.AddUndo(Report);

  FClipboard:= TfrxClipboard.Create(Self);
  Timer.Enabled:= True;

  FRecentFiles:= TStringList.Create;
  FRecentMenuIndex:= FileMenu.IndexOf(SepMI4);
{$IFDEF Delphi5}
  MainMenu.AutoHotKeys:= maManual;
{$ENDIF}

  FSampleFormat:= TSampleFormat.Create;
  FPagePositions:= TStringList.Create;
  for i:= 1 to 256 do
    FPagePositions.Add('');

  if IsPreviewDesigner then
  begin
    FOldDesignerComp:= frxDesignerComp;
    TfrxDesigner.Create(nil);
    frxDesignerComp.Restrictions:= [drDontDeletePage, drDontCreatePage,
      drDontCreateReport, drDontLoadReport, drDontPreviewReport,
      drDontEditVariables, drDontChangeReportOptions];
    ObjectBandB.Enabled:= False;
  end;

  Report.SelectPrinter;

{$IFDEF FR_VER_BASIC}
  NewDialogCmd.Enabled:= False;
{$ENDIF}

  NewReportCmd.Enabled:= CheckOp(drDontCreateReport);
  NewItemCmd.Enabled:= CheckOp(drDontCreateReport);
  NewPageCmd.Enabled:= CheckOp(drDontCreatePage);
  NewDialogCmd.Enabled:= NewDialogCmd.Enabled and CheckOp(drDontCreatePage);
  SaveAsCmd.Enabled:= CheckOp(drDontSaveReport);
  OpenCmd.Enabled:= CheckOp(drDontLoadReport);
  ReportSettingsMI.Enabled:= CheckOp(drDontChangeReportOptions);
  ReportStylesMI.Enabled:= CheckOp(drDontChangeReportOptions);
  ReportDataMI.Enabled:= CheckOp(drDontEditReportData);
  VariablesCmd.Enabled:= CheckOp(drDontEditVariables);
  PreviewCmd.Enabled:= CheckOp(drDontPreviewReport);
end;

procedure TfrxDesignerForm.Done;
begin
  AttachDialogFormEvents(False);
  if IsPreviewDesigner then
  begin
    frxDesignerComp.Free;
    frxDesignerComp:= FOldDesignerComp;
  end;

  FUndoBuffer.Free;
  FClipboard.Free;
  FRecentFiles.Free;
  FSampleFormat.Free;
  FPagePositions.Free;
end;

procedure TfrxDesignerForm.ReadButtonImages;
var
  MainImages, DisabledImages, ObjectImages:TImageList;
begin
  MainImages:= frxResources.MainButtonImages;
  DisabledImages:= frxResources.DisabledButtonImages;
  ObjectImages:= frxResources.ObjectImages;

  CodeTB.Images:= MainImages;
  CodeTB.DisabledImages:= DisabledImages;

  StandardTB1.Images:= MainImages;
  StandardTB1.DisabledImages:= DisabledImages;

  TextTB1.Images:= MainImages;
  TextTB1.DisabledImages:= DisabledImages;

  FrameTB1.Images:= MainImages;
  FrameTB1.DisabledImages:= DisabledImages;

  AlignTB1.Images:= MainImages;
  AlignTB1.DisabledImages:= DisabledImages;

  ExtraToolsTB1.Images:= MainImages;
  ExtraToolsTB1.DisabledImages:= DisabledImages;

  ObjectsTB1.Images:= ObjectImages;
  ObjectsPopup.Images:= ObjectImages;
  MainMenu.Images:= MainImages;
  PagePopup.Images:= MainImages;
  TabPopup.Images:= MainImages;
  ActionList.Images:= MainImages;
  BandsPopup.Images:= MainImages;

  DataLV.LargeImages:= ObjectImages;
end;

procedure TfrxDesignerForm.CreateToolWindows;
begin
  FInspector:= TfrxObjectInspector.Create(Self);
  with FInspector do
  begin
    OnModify:= Self.OnModify;
    OnSelectionChanged:= Self.OnSelectionChanged;
    SelectedObjects:= FSelectedObjects;
  end;

  FDataTree:= TfrxDataTreeForm.Create(Self);
  FDataTree.CBPanel.Visible:= True;
  FDataTree.OnDblClick:= OnDataTreeDblClick;
  UpdateDataTree;

  FReportTree:= TfrxReportTreeForm.Create(Self);
  FReportTree.OnSelectionChanged:= OnSelectionChanged;
end;

procedure TfrxDesignerForm.CreateWorkspace;
begin
  FWorkspace:= TDesignerWorkspace.Create(Self);
  with FWorkspace do
  begin
    Parent:= ScrollBox;
    OnNotifyPosition:= Self.OnNotifyPosition;
    OnInsert:= OnInsertObject;
    OnEdit:= OnEditObject;
    OnModify:= Self.OnModify;
    OnSelectionChanged:= Self.OnSelectionChanged;
    OnTopLeftChanged:= ScrollBoxResize;
    PopupMenu:= PagePopup;
    Objects:= FObjects;
    SelectedObjects:= FSelectedObjects;
  end;

  FCodeWindow:= TfrxSyntaxMemo.Create(Self);
  with FCodeWindow do
  begin
    Parent:= CodePanel;
    Align:= alClient;
    Lines:= Report.ScriptText;
    Color:= clWindow;
    OnChangeText:= OnCodeChanged;
    OnChangePos:= OnChangePosition;
    OnDragOver:= CodeWindowDragOver;
    OnDragDrop:= CodeWindowDragDrop;
  end;
end;

procedure TfrxDesignerForm.CreateObjectsToolbar;
var
  i:Integer;
  Item:TfrxObjectItem;

  function HasButtons(Item:TfrxObjectItem):Boolean;
  var
    i:Integer;
    Item1:TfrxObjectItem;
  begin
    Result:= False;
    for i:= 0 to frxObjects.Count-1 do
    begin
      Item1:= frxObjects[i];
      if (Item1.ClassRef<>nil) and (Item1.CategoryName = Item.CategoryName) then
        Result:= True;
    end;
  end;

  procedure CreateButton(Index:Integer; Item:TfrxObjectItem);
  var
    b:TToolButton;
    s:String;
  begin
    b:= TToolButton.Create(ObjectsTB1);
    b.Style:= tbsCheck;
    b.ImageIndex:= Item.ButtonImageIndex;
    b.Grouped:= True;
    s:= Item.ButtonHint;
    if s = '' then
    begin
      if Item.ClassRef<>nil then
        s:= Item.ClassRef.GetDescription;
    end
    else
      s:= frxResources.Get(s);
    b.Hint:= s;
    b.Tag:= Index;
    if Item.ClassRef = nil then { category }
      if not HasButtons(Item) then
      begin
        b.Free;
        Exit;
      end;
    b.OnClick:= ObjectsButtonClick;

    b.Top:= 1000;
    b.Left:= 1000;
    b.Parent:= ObjectsTB1;
  end;

begin
  { add object buttons }
  for i:= 0 to frxObjects.Count-1 do
  begin
    Item:= frxObjects[i];
    if (Item.ButtonBmp<>nil) and (Item.ButtonImageIndex =-1) then
    begin
      frxResources.SetObjectImages(Item.ButtonBmp);
      Item.ButtonImageIndex:= frxResources.ObjectImages.Count-1;
    end;

    if (Item.ClassRef<>nil) and (Item.CategoryName = '') then
      CreateButton(i, Item);
  end;

  { add category buttons }
  for i:= 0 to frxObjects.Count-1 do
  begin
    Item:= frxObjects[i];
    if Item.ClassRef = nil then
      CreateButton(i, Item);
  end;
end;

procedure TfrxDesignerForm.CreateExtraToolbar;
var
  i:Integer;
  Item:TfrxWizardItem;
  b:TToolButton;
begin
  for i:= 0 to frxWizards.Count-1 do
  begin
    Item:= frxWizards[i];
    if Item.IsToolbarWizard then
    begin
      b:= TToolButton.Create(Self);
      with b do
      begin
        Tag:= i;
        if (Item.ButtonBmp<>nil) and (Item.ButtonImageIndex =-1) then
        begin
          frxResources.SetButtonImages(Item.ButtonBmp);
          Item.ButtonImageIndex:= frxResources.MainButtonImages.Count-1;
        end;
        ImageIndex:= Item.ButtonImageIndex;
        Hint:= Item.ClassRef.GetDescription;
        SetBounds(1000, 0, 22, 22);
        Parent:= ExtraToolsTB1;
      end;
      b.OnClick:= OnExtraToolClick;
    end;
  end;

  ExtraToolsTB.Height:= 27;
  ExtraToolsTB.Width:= 27;
  ExtraToolsTB.AdjustBounds;
end;

procedure TfrxDesignerForm.AttachDialogFormEvents(Attach:Boolean);
begin
  if Attach then
  begin
    FDialogForm.Parent:= Self;
    FDialogForm.OnModify:= DialogFormModify;
    FDialogForm.OnKeyDown:= DialogFormKeyDown;
    FDialogForm.OnKeyUp:= DialogFormKeyUp;
    FDialogForm.OnKeyPress:= DialogFormKeyPress;
  end
  else
    if FDialogForm<>nil then
    begin
      FWorkspace.Parent:= nil;
      FDialogForm.Parent:= nil;
      FDialogForm.Hide;
      FDialogForm.OnModify:= nil;
      FDialogForm.OnKeyDown:= nil;
      FDialogForm.OnKeyUp:= nil;
      FDialogForm.OnKeyPress:= nil;
      FDialogForm:= nil;
    end;
end;

procedure TfrxDesignerForm.ReloadReport;

  procedure EmptyReport;
  var
    p:TfrxPage;
  begin
    Report.Clear;
    p:= TfrxReportPage.Create(Report);
    p.Name:= 'Page1';
  end;

begin
  if Report.PagesCount = 0 then
    EmptyReport;
  LangCB.ItemIndex:= LangCB.Items.IndexOf(Report.ScriptLanguage);
  CodeWindow.Lines:= Report.ScriptText;
  UpdateSyntaxType;
  ReloadPages(0);
  UpdateRecentFiles(Report.FileName);
  UpdateCaption;
  UpdateStyles;
  FUndoBuffer.ClearUndo;
  Modified:= False;
end;

procedure TfrxDesignerForm.ReloadPages(Index:Integer);
var
  i:Integer;
  c:TfrxPage;
  s:String;
begin
  FDialogForm:= nil;
  Tab.Tabs.BeginUpdate;
  Tab.Tabs.Clear;
  Tab.Tabs.Add(frxResources.Get('dsCode'));

  for i:= 0 to Report.PagesCount-1 do
  begin
    c:= Report.Pages[i];
    c.IsDesigning:= True;
    if (c is TfrxReportPage) and (TfrxReportPage(c).Subreport<>nil) then
      s:= TfrxReportPage(c).Subreport.Name
    else if c.Name = '' then
      s:= frxResources.Get('dsPage')+IntToStr(i+1) else
      s:= c.Name;
    Tab.Tabs.Add(s);
  end;

  Tab.Tabs.EndUpdate;

  if Index =-1 then
    Page:= nil
  else if Index < Report.PagesCount then
    Page:= Report.Pages[Index] else
    Page:= Report.Pages[0];
end;

procedure TfrxDesignerForm.ReloadObjects;
var
  i:Integer;
begin
  FObjects.Clear;
  FSelectedObjects.Clear;

  for i:= 0 to FPage.AllObjects.Count-1 do
    FObjects.Add(FPage.AllObjects[i]);

  FObjects.Add(Report);
  FObjects.Add(FPage);
  FSelectedObjects.Add(FPage);
  FWorkspace.Page:= FPage;
  FWorkspace.EnableUpdate;
  FWorkspace.AdjustBands;

  FInspector.EnableUpdate;

  UpdateDataTree;
  FReportTree.UpdateItems;
  OnSelectionChanged(Self);
end;

procedure TfrxDesignerForm.UpdatePageDimensions;
var
  h:Extended;
begin
  if FPage is TfrxReportPage then
    with FPage as TfrxReportPage do
    begin
      ScrollBox.HorzScrollBar.Position:= 0;
      ScrollBox.VertScrollBar.Position:= 0;

      FWorkspace.Origin:= Point(10, 10);
      h:= PaperHeight;
      if LargeDesignHeight then
        h:= h * 5;
      FWorkspace.SetPageDimensions(
        Round(PaperWidth * 96 / 25.4),
        Round(h * 96 / 25.4),
        Rect(Round(LeftMargin * 96 / 25.4), Round(TopMargin * 96 / 25.4),
             Round(RightMargin * 96 / 25.4), Round(BottomMargin * 96 / 25.4)));
    end;
end;

procedure TfrxDesignerForm.UpdateControls;
var
  c:TfrxComponent;
  p1, p2, p3:PPropInfo;
  Count:Integer;
  FontEnabled, AlignEnabled, IsReportPage:Boolean;
  Frame1Enabled, Frame2Enabled, Frame3Enabled, ObjSelected, DMPEnabled:Boolean;
  s:String;
  Frame:TfrxFrame;
  DMPFontStyle:TfrxDMPFontStyles;

  procedure SetEnabled(cAr:array of TControl; Enabled:Boolean);
  var
    i:Integer;
  begin
    for i:= 0 to High(cAr) do
    begin
      cAr[i].Enabled:= Enabled;
      if (cAr[i] is TToolButton) and not Enabled then
        TToolButton(cAr[i]).Down:= False;
    end;
  end;

  procedure ButtonUp(cAr:array of TToolButton);
  var
    i:Integer;
  begin
    for i:= 0 to High(cAr) do
      cAr[i].Down:= False;
  end;

begin
  FUpdatingControls:= True;

  Count:= FSelectedObjects.Count;
  if Count > 0 then
  begin
    c:= FSelectedObjects[0];
    p1:= GetPropInfo(PTypeInfo(c.ClassInfo), 'Font');
    p2:= GetPropInfo(PTypeInfo(c.ClassInfo), 'Frame');
    p3:= GetPropInfo(PTypeInfo(c.ClassInfo), 'Color');
  end
  else
  begin
    c:= nil;
    p1:= nil;
    p2:= nil;
    p3:= nil;
  end;

  if Count = 1 then
  begin
    FontNameCB.Text:= c.Font.Name;
    FontSizeCB.Text:= IntToStr(c.Font.Size);

    BoldB.Down:= fsBold in c.Font.Style;
    ItalicB.Down:= fsItalic in c.Font.Style;
    UnderlineB.Down:= fsUnderline in c.Font.Style;

    if c is TfrxCustomMemoView then
      with TfrxCustomMemoView(c) do
      begin
        TextAlignLeftB.Down:= HAlign = haLeft;
        TextAlignCenterB.Down:= HAlign = haCenter;
        TextAlignRightB.Down:= HAlign = haRight;
        TextAlignBlockB.Down:= HAlign = haBlock;

        TextAlignTopB.Down:= VAlign = vaTop;
        TextAlignMiddleB.Down:= VAlign = vaCenter;
        TextAlignBottomB.Down:= VAlign = vaBottom;
        if not (c is TfrxDMPMemoView) then
          if Style = '' then
            StyleCB.ItemIndex:= 0 else
            StyleCB.Text:= Style;
      end;

    Frame:= nil;
    if c is TfrxView then
      Frame:= TfrxView(c).Frame
    else if c is TfrxReportPage then
      Frame:= TfrxReportPage(c).Frame;

    if Frame<>nil then
      with Frame do
      begin
        FrameTopB.Down:= ftTop in Typ;
        FrameBottomB.Down:= ftBottom in Typ;
        FrameLeftB.Down:= ftLeft in Typ;
        FrameRightB.Down:= ftRight in Typ;
        ShadowB.Down:= DropShadow;

        FrameWidthCB.Text:= FloatToStr(Width);
      end;
  end
  else
  begin
    FontNameCB.Text:= '';
    FontSizeCB.Text:= '';
    FrameWidthCB.Text:= '';

    ButtonUp([BoldB, ItalicB, UnderlineB, TextAlignLeftB, TextAlignCenterB,
      TextAlignRightB, TextAlignBlockB, TextAlignTopB, TextAlignMiddleB,
      TextAlignBottomB, FrameTopB, FrameBottomB, FrameLeftB,
      FrameRightB, ShadowB]);
  end;

  FontEnabled:= (p1<>nil) and not (c is TfrxDMPPage) and (FPage<>nil);
  AlignEnabled:= (c is TfrxCustomMemoView) and (FPage<>nil);
  Frame1Enabled:= (p2<>nil) and not (c is TfrxLineView) and
    not (c is TfrxShapeView) and not (c is TfrxDMPPage) and (FPage<>nil);
  Frame2Enabled:= (p2<>nil) and not (c is TfrxDMPPage) and (FPage<>nil);
  Frame3Enabled:= (p3<>nil) and not (c is TfrxDMPPage) and (FPage<>nil);
  IsReportPage:= FPage is TfrxReportPage;
  ObjSelected:= (Count<>0) and (FPage<>nil) and (FSelectedObjects[0]<>FPage);
  DMPEnabled:= (c is TfrxDMPMemoView) or (c is TfrxDMPLineView) or
    (c is TfrxDMPCommand) or (c is TfrxDMPPage);

  SetEnabled([FontNameCB, FontSizeCB, BoldB, ItalicB, UnderlineB, FontColorB],
    (FontEnabled or (Count > 1)) and not (FPage is TfrxDMPPage));
  SetEnabled([FontB], (FontEnabled or DMPEnabled or (Count > 1)));
  SetEnabled([TextAlignLeftB, TextAlignCenterB, TextAlignRightB,
    TextAlignBlockB, TextAlignTopB, TextAlignMiddleB, TextAlignBottomB],
    AlignEnabled or (Count > 1));
  SetEnabled([StyleCB, HighlightB, RotateB],
    (AlignEnabled or (Count > 1)) and not (FPage is TfrxDMPPage));
  SetEnabled([FrameTopB, FrameBottomB, FrameLeftB, FrameRightB, FrameAllB,
    FrameNoB, ShadowB], Frame1Enabled or (Count > 1));
  SetEnabled([FrameColorB, FrameStyleB, FrameWidthCB],
    (Frame2Enabled or (Count > 1)) and not (FPage is TfrxDMPPage));
  SetEnabled([FillColorB], Frame3Enabled and not (FPage is TfrxDMPPage));
  SampleFormatB.Enabled:= (AlignEnabled and (Count = 1)) or (IsReportPage and not ObjSelected);
  if Report.DotMatrixReport then
  begin
    FontB.DropDownMenu:= DMPPopup;
    FontB.OnClick:= nil;
  end
  else
  begin
    FontB.DropDownMenu:= nil;
    FontB.OnClick:= ToolButtonClick;
  end;

  DMPFontStyle:= [];
  if c is TfrxDMPMemoView then
    DMPFontStyle:= TfrxDMPMemoView(c).FontStyle;
  if c is TfrxDMPLineView then
    DMPFontStyle:= TfrxDMPLineView(c).FontStyle;
  if c is TfrxDMPPage then
    DMPFontStyle:= TfrxDMPPage(c).FontStyle;

  BoldMI.Checked:= fsxBold in DMPFontStyle;
  ItalicMI.Checked:= fsxItalic in DMPFontStyle;
  UnderlineMI.Checked:= fsxUnderline in DMPFontStyle;
  SuperScriptMI.Checked:= fsxSuperScript in DMPFontStyle;
  SubScriptMI.Checked:= fsxSubScript in DMPFontStyle;
  CondensedMI.Checked:= fsxCondensed in DMPFontStyle;
  WideMI.Checked:= fsxWide in DMPFontStyle;
  N12cpiMI.Checked:= fsx12cpi in DMPFontStyle;
  N15cpiMI.Checked:= fsx15cpi in DMPFontStyle;

  UndoCmd.Enabled:= (FUndoBuffer.UndoCount > 1) or (FPage = nil);
  RedoCmd.Enabled:= (FUndoBuffer.RedoCount > 0) and (FPage<>nil);
  CutCmd.Enabled:= ((Count<>0) and (FSelectedObjects[0]<>FPage)) or (FPage = nil);
  CopyCmd.Enabled:= CutCmd.Enabled;
  TimerTimer(nil);

  PageSettingsCmd.Enabled:= IsReportPage and CheckOp(drDontChangePageOptions);
  DeletePageCmd.Enabled:= (Report.PagesCount > 1) and (FPage<>nil) and
    CheckOp(drDontDeletePage);
  SaveCmd.Enabled:= Modified and CheckOp(drDontSaveReport);
  DeleteCmd.Enabled:= ObjSelected;
  SelectAllCmd.Enabled:= (FObjects.Count > 2) and (FPage<>nil);
  EditCmd.Enabled:= (Count = 1) and (FPage<>nil);
  SetToGridB.Enabled:= ObjSelected;
  BringToFrontCmd.Enabled:= ObjSelected;
  SendToBackCmd.Enabled:= ObjSelected;
  GroupCmd.Enabled:= ObjSelected and (FSelectedObjects[0]<>Report);
  UngroupCmd.Enabled:= GroupCmd.Enabled;
  ScaleCB.Enabled:= IsReportPage;

  SetEnabled([HandToolB, ZoomToolB, TextToolB], IsReportPage);
  SetEnabled([FormatToolB], AlignEnabled and (Count = 1));
  TabOrderMI.Visible:= not IsReportPage;

  if Count<>1 then
    s:= ''
  else
  begin
    s:= c.Name;
    if c is TfrxView then
      if TfrxView(c).IsDataField then
        s:= s+':'+Report.GetAlias(TfrxView(c).DataSet)+'."'+TfrxView(c).DataField+'"'
      else if c is TfrxCustomMemoView then
        s:= s+':'+Copy(TfrxCustomMemoView(c).Text, 1, 128);
    if c is TfrxDataBand then
      if TfrxDataBand(c).DataSet<>nil then
        s:= s+':'+Report.GetAlias(TfrxDataBand(c).DataSet);
    if c is TfrxGroupHeader then
      s:= s+':'+TfrxGroupHeader(c).Condition
  end;

  StatusBar.Panels[2].Text:= s;

  FUpdatingControls:= False;
end;

procedure TfrxDesignerForm.UpdateDataControls;
var
  i, j:Integer;
  li:TListItem;
  oi:TfrxObjectItem;
begin
  FUpdatingControls:= True;
  try
    DataLV.Items.BeginUpdate;
    DataLV.Items.Clear;

    for i:= 0 to Objects.Count-1 do
      if TfrxComponent(Objects[i]) is TfrxDialogComponent then
      begin
        li:= DataLV.Items.Add;
        li.Caption:= TfrxComponent(Objects[i]).Name;
        li.Data:= Objects[i];

        for j:= 0 to frxObjects.Count-1 do
        begin
          oi:= frxObjects[j];
          if oi.ClassRef = TfrxComponent(Objects[i]).ClassType then
          begin
            li.ImageIndex:= oi.ButtonImageIndex;
            break;
          end;
        end;
      end;

    DataLV.Visible:= DataLV.Items.Count<>0;
    DataLV.Items.EndUpdate;
    DataLV.Arrange(arSnapToGrid);
  finally
    FUpdatingControls:= False;
  end;
end;

procedure TfrxDesignerForm.UpdateDataTree;
begin
  FDataTree.UpdateItems;
end;

procedure TfrxDesignerForm.UpdateStyles;
begin
  Report.Styles.GetList(StyleCB.Items);
  StyleCB.Items.Insert(0, frxResources.Get('dsNoStyle'));
end;

procedure TfrxDesignerForm.UpdateSyntaxType;
begin
  CodeWindow.Syntax:= Report.ScriptLanguage;
  if CompareText(Report.ScriptLanguage, 'PascalScript') = 0 then
  begin
    OpenScriptDialog.FilterIndex:= 1;
    OpenScriptDialog.DefaultExt:= 'pas';
    SaveScriptDialog.FilterIndex:= 1;
    SaveScriptDialog.DefaultExt:= 'pas';
  end
  else if CompareText(Report.ScriptLanguage, 'C++Script') = 0 then
  begin
    OpenScriptDialog.FilterIndex:= 2;
    OpenScriptDialog.DefaultExt:= 'cpp';
    SaveScriptDialog.FilterIndex:= 2;
    SaveScriptDialog.DefaultExt:= 'cpp';
  end
  else if CompareText(Report.ScriptLanguage, 'JScript') = 0 then
  begin
    OpenScriptDialog.FilterIndex:= 3;
    OpenScriptDialog.DefaultExt:= 'js';
    SaveScriptDialog.FilterIndex:= 3;
    SaveScriptDialog.DefaultExt:= 'js';
  end
  else if CompareText(Report.ScriptLanguage, 'BasicScript') = 0 then
  begin
    OpenScriptDialog.FilterIndex:= 4;
    OpenScriptDialog.DefaultExt:= 'vb';
    SaveScriptDialog.FilterIndex:= 4;
    SaveScriptDialog.DefaultExt:= 'vb';
  end
  else
  begin
    OpenScriptDialog.FilterIndex:= 5;
    OpenScriptDialog.DefaultExt:= '';
    SaveScriptDialog.FilterIndex:= 5;
    SaveScriptDialog.DefaultExt:= '';
  end
end;

procedure TfrxDesignerForm.Lock;
begin
  FObjects.Clear;
  FSelectedObjects.Clear;
  AttachDialogFormEvents(False);
  FWorkspace.DisableUpdate;
  FInspector.DisableUpdate;
end;

procedure TfrxDesignerForm.CreateColorSelector(Sender:TToolButton);
var
  AColor:TColor;
  i:Integer;
begin
  AColor:= clBlack;
  for i:= 0 to SelectedObjects.Count-1 do
    if TObject(SelectedObjects[i]) is TfrxView then
    begin
      if Sender = FontColorB then
        AColor:= TfrxView(SelectedObjects[i]).Font.Color else
        AColor:= TfrxView(SelectedObjects[i]).Color;
      break;
    end;

  with TfrxColorSelector.Create(Sender) do
  begin
    Color:= AColor;
    OnColorChanged:= Self.OnColorChanged;
  end;
end;

procedure TfrxDesignerForm.SwitchToCodeWindow;
begin
  Page:= nil;
end;

function TfrxDesignerForm.AskSave:Word;
begin
{ if csDesigning in Report.ComponentState then
  begin
    Result:= mrNo;
    Exit;
  end;}

  if IsPreviewDesigner then
    Result:= Application.MessageBox(PChar(frxResources.Get('dsSavePreviewChanges')),
      PChar(frxResources.Get('mbConfirm')), mb_IconQuestion+mb_YesNoCancel)
  else
    Result:= Application.MessageBox(PChar(frxResources.Get('dsSaveChangesTo')+
      GetReportName+'?'), PChar(frxResources.Get('mbConfirm')),
      mb_IconQuestion+mb_YesNoCancel);
end;

function TfrxDesignerForm.CheckOp(Op:TfrxDesignerRestriction):Boolean;
begin
  Result:= True;
  if (frxDesignerComp<>nil) and (Op in frxDesignerComp.Restrictions) then
    Result:= False;
end;

function TfrxDesignerForm.GetPageIndex:Integer;
begin
  Result:= Report.Objects.IndexOf(FPage);
end;

function TfrxDesignerForm.GetReportName:String;
begin
  if Report.FileName = '' then
    Result:= 'Untitled.fr3' else
    Result:= ExtractFileName(Report.FileName);
end;

procedure TfrxDesignerForm.LoadFile(FileName:String; UseOnLoadEvent:Boolean);
var
  SaveSilentMode:Boolean;

  procedure SaveCurrentFile;
  var
    w:Word;
  begin
    if Modified then
    begin
      w:= AskSave;
      if w = mrYes then
        SaveFile(False, UseOnLoadEvent)
      else if w = mrCancel then
        Exit;
    end;
  end;

  procedure EmptyReport;
  var
    p:TfrxPage;
  begin
    Report.Clear;
    p:= TfrxReportPage.Create(Report);
    p.Name:= 'Page1';
  end;

  procedure Error;
  begin
    frxErrorMsg(frxResources.Get('dsCantLoad'));
  end;

begin
  SaveSilentMode:= Report.EngineOptions.SilentMode;
  Report.EngineOptions.SilentMode:= False;

  if FileName<>'' then // call from recent filelist
  begin
    SaveCurrentFile;
    Lock;
    try
      if not Report.LoadFromFile(FileName) then
        Error;
    except
      EmptyReport;
    end;
    Report.EngineOptions.SilentMode:= SaveSilentMode;
    ReloadReport;
    Exit;
  end;

  if UseOnLoadEvent then
    if (frxDesignerComp<>nil) and Assigned(frxDesignerComp.FOnLoadReport) then
    begin
      Lock;
      if frxDesignerComp.FOnLoadReport(Report) then
        ReloadReport else
        ReloadPages(0);
      Report.EngineOptions.SilentMode:= SaveSilentMode;
      Exit;
    end;

  if frxDesignerComp<>nil then
    OpenDialog.InitialDir:= frxDesignerComp.OpenDir;
  if OpenDialog.Execute then
  begin
    SaveCurrentFile;
    Lock;
    try
      Report.LoadFromFile(OpenDialog.FileName);
    except
      Error;
      EmptyReport;
    end;
    Report.EngineOptions.SilentMode:= SaveSilentMode;
    ReloadReport;
  end;
end;

procedure TfrxDesignerForm.SaveFile(SaveAs:Boolean; UseOnSaveEvent:Boolean);
var
  Saved:Boolean;
begin
  Report.ScriptText:= CodeWindow.Lines;
  Report.ReportOptions.LastChange:= Now;

  if UseOnSaveEvent then
    if (frxDesignerComp<>nil) and Assigned(frxDesignerComp.FOnSaveReport) then
    begin
      if frxDesignerComp.FOnSaveReport(Report, SaveAs) then
      begin
        UpdateRecentFiles(Report.FileName);
        UpdateCaption;
        Modified:= False;
      end;
      Exit;
    end;

  Saved:= True;
  if SaveAs or (Report.FileName = '') then
  begin
    SaveDialog.Filter:= frxResources.Get('dsRepFilter');
    if frxCompressorClass<>nil then
      SaveDialog.Filter:= SaveDialog.Filter+'|'+frxResources.Get('dsComprRepFilter');
    if Report.ReportOptions.Compressed then
      SaveDialog.FilterIndex:= 2 else
      SaveDialog.FilterIndex:= 1;
    if frxDesignerComp<>nil then
      SaveDialog.InitialDir:= frxDesignerComp.SaveDir;
    Saved:= SaveDialog.Execute;
    if Saved then
    begin
      Report.ReportOptions.Compressed:= SaveDialog.FilterIndex = 2;
      Report.FileName:= ChangeFileExt(SaveDialog.FileName, '.fr3');
      Report.SaveToFile(Report.FileName);
    end
  end
  else
    Report.SaveToFile(Report.FileName);

  UpdateRecentFiles(Report.FileName);
  UpdateCaption;
  if Saved then
    Modified:= False;
end;

procedure TfrxDesignerForm.UpdateCaption;
begin
  Caption:= 'FastReport-'+GetReportName;
end;

procedure TfrxDesignerForm.UpdateRecentFiles(NewFile:String);
var
  i:Integer;
  m:TMenuItem;
begin
  if NewFile<>'' then
  begin
    if FRecentFiles.IndexOf(NewFile)<>-1 then
      FRecentFiles.Delete(FRecentFiles.IndexOf(NewFile));
    FRecentFiles.Add(NewFile);
    while FRecentFiles.Count > 8 do
      FRecentFiles.Delete(0);
  end;

    SepMI11.Visible:= FRecentFiles.Count<>0;

  for i:= FileMenu.Count-1 downto 0 do
  begin
    m:= FileMenu.Items[i];
    if FRecentFiles.IndexOf(m.Caption)<>-1 then
      m.Free;
  end;

  for i:= FRecentFiles.Count-1 downto 0 do
  begin
    m:= TMenuItem.Create(FileMenu);
    m.Caption:= FRecentFiles[i];
    m.OnClick:= OpenRecentFile;
    FileMenu.Insert(FileMenu.IndexOf(SepMI4), m);
  end;
end;

procedure TfrxDesignerForm.SwitchToolbar;
var
  i:Integer;
  Item:TfrxObjectItem;
  b:TToolButton;
  v:Boolean;

  function IsDialogCategory(Category:Integer):Boolean;
  var
    i:Integer;
    Item:TfrxObjectItem;
  begin
    Result:= False;
    for i:= 0 to frxObjects.Count-1 do
    begin
      Item:= frxObjects[i];
      if (Item.ClassRef<>nil) and
         (Item.CategoryName = frxObjects[Category].CategoryName) then
      begin
        Result:= Item.ClassRef.InheritsFrom(TfrxDialogControl);
        break;
      end;
    end;
  end;

  function IsDataCategory(Category:Integer):Boolean;
  var
    i:Integer;
    Item:TfrxObjectItem;
  begin
    Result:= False;
    if Category = 1000 then Exit;
    for i:= 0 to frxObjects.Count-1 do
    begin
      Item:= frxObjects[i];
      if (Item.ClassRef<>nil) and
         (Item.CategoryName = frxObjects[Category].CategoryName) then
      begin
        Result:= Item.ClassRef.InheritsFrom(TfrxDialogComponent);
        break;
      end;
    end;
  end;

begin
  ObjectSelectB.Down:= True;
  SelectToolBClick(nil);

  for i:= 0 to ObjectsTB1.ControlCount-1 do
  begin
    b:= TToolButton(ObjectsTB1.Controls[i]);

    if (b<>ObjectSelectB) and (b<>SepTB14) then
    begin
      Item:= nil;
      if b.Tag = 1000 then { tools and band }
        v:= False
      else { object or category }
      begin
        Item:= frxObjects[b.Tag];
        if Item.ClassRef<>nil then { object }
          v:= Item.ClassRef.InheritsFrom(TfrxDialogControl) else
          v:= IsDialogCategory(b.Tag);
      end;

      if FPage is TfrxDialogPage then
        b.Visible:= v or IsDataCategory(b.Tag)
      else
        b.Visible:= not v;

      if Item<>nil then
        if FPage is TfrxDMPPage then
        begin
          if (Item.ClassRef = TfrxMemoView) or
            (Item.ClassRef = TfrxSysMemoView) or
            (Item.ClassRef = TfrxLineView) or
            (Item.ClassRef = TfrxPictureView) or
            (Item.CategoryName = 'Draw') then
            b.Visible:= False;
        end
        else if (FPage is TfrxReportPage) or (FPage = nil) then
        begin
          if (Item.ClassRef = TfrxDMPMemoView) or
            (Item.ClassRef = TfrxDMPLineView) or
            (Item.ClassRef = TfrxDMPCommand) then
            b.Visible:= False;
        end;
    end;
  end;

  ObjectsTB1.Height:= ObjectsTB1.Height+1;
end;

function TfrxDesignerForm.mmToUnits(mm:Extended; X:Boolean = True):Extended;
begin
  Result:= 0;
  case FUnits of
    duCM:
      Result:= mm / 10;
    duInches:
      Result:= mm / 25.4;
    duPixels:
      Result:= mm * 96 / 25.4;
    duChars:
      if X then
        Result:= Round(mm * fr01cm / fr1CharX) else
        Result:= Round(mm * fr01cm / fr1CharY);
  end;
end;

function TfrxDesignerForm.UnitsTomm(mm:Extended; X:Boolean = True):Extended;
begin
  Result:= 0;
  case FUnits of
    duCM:
      Result:= mm * 10;
    duInches:
      Result:= mm * 25.4;
    duPixels:
      Result:= mm / 96 * 25.4;
    duChars:
      if X then
        Result:= Round(mm) * fr1CharX / fr01cm else
        Result:= Round(mm) * fr1CharY / fr01cm;
  end;
end;

function TfrxDesignerForm.InsertExpression(const Expr:String):String;
begin
  with TfrxExprEditorForm.Create(Self) do
  begin
    ExprMemo.Text:= Expr;
    if ShowModal = mrOk then
      Result:= ExprMemo.Text else
      Result:= '';
    Free;
  end
end;

procedure TfrxDesignerForm.UpdatePage;
begin
  FWorkspace.Repaint;
end;

procedure TfrxDesignerForm.FindText;
var
  i:Integer;
  c:TfrxComponent;
  s:String;
  Found, FoundOne:Boolean;
  Flags:TReplaceFlags;
  ReplaceAll:Boolean;

  function AskReplace:Boolean;
  var
    i:Integer;
  begin
    if not ReplaceAll then
      i:= MessageDlg(Format(frxResources.Get('dsReplace'), [FSearchText]),
        mtConfirmation, [mbYes, mbNo, mbCancel, mbAll], 0)
    else
      i:= mrAll;
    Result:= i in [mrYes, mrAll];
    ReplaceAll:= i = mrAll;

{ Result:= Application.MessageBox(
      PChar(Format(frxResources.Get('dsReplace'), [FSearchText])),
      PChar(frxResources.Get('mbConfirm')), mb_IconQuestion+mb_YesNo) = mrYes;}
  end;

begin
  ReplaceAll:= False;
  FoundOne:= False;

  repeat
    Found:= False;
    if FPage<>nil then
    begin
      c:= nil;
      for i:= FSearchIndex to Objects.Count-1 do
      begin
        c:= Objects[i];
        if c is TfrxCustomMemoView then
        begin
          s:= TfrxCustomMemoView(c).Text;
          if FSearchCase then
          begin
            if Pos(FSearchText, s)<>0 then
              Found:= True;
          end
          else if Pos(AnsiUpperCase(FSearchText), AnsiUpperCase(s))<>0 then
            Found:= True;
        end;
        if Found then break;
      end;

      if Found then
      begin
        FSearchIndex:= i+1;
        SelectedObjects.Clear;
        SelectedObjects.Add(c);
        OnSelectionChanged(Self);
        if FSearchReplace then
          if AskReplace then
          begin
            Flags:= [rfReplaceAll];
            if not FSearchCase then
              Flags:= Flags+[rfIgnoreCase];
            TfrxCustomMemoView(c).Text:= StringReplace(s, FSearchText,
              FSearchReplaceText, Flags);
            Modified:= True;
          end;
      end;
    end
    else
    begin
      Found:= CodeWindow.Find(FSearchText, FSearchCase, FSearchIndex);
      if FSearchReplace then
        if Found and AskReplace then
        begin
          CodeWindow.SelText:= FSearchReplaceText;
          Modified:= True;
        end;
    end;

    if Found then
      FoundOne:= True;
  until not ReplaceAll or not Found;

  if not FoundOne then
    Application.MessageBox(
      PChar(Format(frxResources.Get('dsTextNotFound'), [FSearchText])),
      PChar(frxResources.Get('mbInfo')), mb_IconInformation+mb_Ok);
end;

procedure TfrxDesignerForm.RestorePagePosition;
var
  pt:TPoint;
begin
  if (Tab.TabIndex > 0) and (Tab.TabIndex < 255) then
  begin
    pt:= fsPosToPoint(FPagePositions[Tab.TabIndex]);
    ScrollBox.VertScrollBar.Position:= pt.X;
    ScrollBox.HorzScrollBar.Position:= pt.Y;
  end;
end;

procedure TfrxDesignerForm.SavePagePosition;
begin
  if (Tab.TabIndex > 0) and (Tab.TabIndex < 255) then
    FPagePositions[Tab.TabIndex]:= IntToStr(ScrollBox.HorzScrollBar.Position)+
      ':'+IntToStr(ScrollBox.VertScrollBar.Position);
end;

{ Workspace/Inspector event handlers }
{------------------------------------------------------------------------------}

procedure TfrxDesignerForm.OnModify(Sender:TObject);
begin
  FModifiedBy:= Sender;
  Modified:= True;
end;

procedure TfrxDesignerForm.OnSelectionChanged(Sender:TObject);
var
  c:TfrxComponent;
begin
  if Sender = FReportTree then
  begin
    c:= SelectedObjects[0];
    if (c<>Report) and (Page<>nil) then
      if c.Page<>Page then
      begin
        Page:= c.Page;
        SelectedObjects[0]:= c;
        FReportTree.UpdateSelection;
      end;
  end
  else
    FReportTree.UpdateSelection;

  if Sender<>FWorkspace then
    FWorkspace.UpdateView;

  if Sender<>FInspector then
  begin
    FInspector.Objects:= FObjects;
    FInspector.UpdateProperties;
  end;

  UpdateControls;
end;

procedure TfrxDesignerForm.OnEditObject(Sender:TObject);
var
  ed:TfrxComponentEditor;
begin
  ed:= frxComponentEditors.GetComponentEditor(FSelectedObjects[0], Self, nil);
  if (ed<>nil) and ed.HasEditor then
    if ed.Edit then
    begin
      Modified:= True;
      if FSelectedObjects[0] = FPage then
        UpdatePageDimensions;
    end;
  ed.Free;
end;

procedure TfrxDesignerForm.OnInsertObject(Sender:TObject);
var
  c:TfrxComponent;
begin
  if not CheckOp(drDontInsertObject) or (FWorkspace.Insertion.Top < 0) then
  begin
    FWorkspace.SetInsertion(nil, 0, 0, 0);
    ObjectSelectB.Down:= True;
    Exit;
  end;

  with FWorkspace.Insertion do
  begin
    if (ComponentClass = nil) or ((Width = 0) and (Height = 0)) then Exit;

    c:= TfrxComponent(ComponentClass.NewInstance);
    c.DesignCreate(FPage, Flags);
    c.CreateUniqueName;
    c.SetBounds(Left, Top, Width, Height);
    if c is TfrxCustomLineView then
      FWorkspace.SetInsertion(ComponentClass, 0, 0, Flags)
    else
    begin
      FWorkspace.SetInsertion(nil, 0, 0, 0);
      if not TextToolB.Down then
        ObjectSelectB.Down:= True;
    end;

    if c is TfrxCustomMemoView then
      FSampleFormat.ApplySample(TfrxCustomMemoView(c));

    FObjects.Add(c);
    FSelectedObjects.Clear;
    FSelectedObjects.Add(c);

    if c is TfrxSubreport then
    begin
      NewPageCmdExecute(Self);
      TfrxSubreport(c).Page:= TfrxReportPage(Report.Pages[Report.PagesCount-1]);
      ReloadPages(Report.PagesCount-1);
    end
    else
    begin
      Modified:= True;
      if EditAfterInsert and not
        ((c is TfrxDialogControl) or (c is TfrxDialogComponent)) then
        OnEditObject(Self);
    end;

    FWorkspace.BringToFront;
  end;
end;

procedure TfrxDesignerForm.OnNotifyPosition(ARect:TfrxRect);
var
  dx, dy:Extended;
begin
  with ARect do
  begin
    if FUnits = duCM then
    begin
      dx:= 1 / 96 * 2.54;
      dy:= dx;
    end
    else if FUnits = duChars then
    begin
      dx:= 1 / fr1CharX;
      dy:= 1 / fr1CharY;
    end
    else if FUnits = duPixels then
    begin
      dx:= 1;
      dy:= dx;
    end
    else
    begin
      dx:= 1 / 96;
      dy:= dx;
    end;

    Left:= Left * dx;
    Top:= Top * dy;
    if FWorkspace.Mode<>dmScale then
    begin
      Right:= Right * dx;
      Bottom:= Bottom * dy;
    end;

    if FUnits = duChars then
    begin
      Left:= Trunc(Left);
      Top:= Trunc(Top);
      Right:= Trunc(Right);
      Bottom:= Trunc(Bottom);
    end;

    FCoord1:= '';
    FCoord2:= '';
    FCoord3:= '';
    if (not FWorkspace.IsMouseDown) and (FWorkspace.Mode<>dmInsertObject) then
      if (FSelectedObjects.Count > 0) and (FSelectedObjects[0] = FPage) then
        FCoord1:= Format('%f; %f', [Left, Top])
      else
      begin
        FCoord1:= Format('%f; %f', [Left, Top]);
        FCoord2:= Format('%f; %f', [Right, Bottom]);
      end
    else
    case FWorkspace.Mode of
      dmMove, dmSize, dmSizeBand, dmInsertObject, dmInsertLine:
        begin
          FCoord1:= Format('%f; %f', [Left, Top]);
          FCoord2:= Format('%f; %f', [Right, Bottom]);
        end;

      dmScale:
        begin
          FCoord1:= Format('%f; %f', [Left, Top]);
          FCoord3:= Format('%s%f; %s%f', ['%', Right * 100, '%', Bottom * 100]);
        end;
    end;
  end;

  LeftRuler.Position:= ARect.Top;
  TopRuler.Position:= ARect.Left;

  StatusBar.Repaint;
end;

{ Toolbar buttons' events }
{------------------------------------------------------------------------------}

procedure TfrxDesignerForm.SelectToolBClick(Sender:TObject);
var
  t:TfrxDesignTool;
begin
  t:= dtSelect;
  if HandToolB.Down then
    t:= dtHand
  else if ZoomToolB.Down then
    t:= dtZoom
  else if TextToolB.Down then
    t:= dtText
  else if FormatToolB.Down then
    t:= dtFormat;

  TDesignerWorkspace(FWorkspace).Tool:= t;
  FWorkspace.SetInsertion(nil, 0, 0, 0);
end;

procedure TfrxDesignerForm.ObjectBandBClick(Sender:TObject);
var
  pt:TPoint;
begin
  pt:= TControl(Sender).ClientToScreen(Point(TControl(Sender).Width, 0));
  BandsPopup.Popup(pt.X, pt.Y);
end;

procedure TfrxDesignerForm.ObjectsButtonClick(Sender:TObject);
var
  i:Integer;
  Obj, Item:TfrxObjectItem;
  c:TfrxComponent;
  dx, dy:Extended;
  m:TMenuItem;
  pt:TPoint;
  s:String;
begin
  SelectToolBClick(Sender);
  if Page = nil then Exit;
  Obj:= frxObjects[TComponent(Sender).Tag];

  if Obj.ClassRef = nil then { it's a category }
  begin
    while ObjectsPopup.Items.Count > 0 do
      ObjectsPopup.Items[0].Free;

    for i:= 0 to frxObjects.Count-1 do
    begin
      Item:= frxObjects[i];
      if (Item.ClassRef<>nil) and (Item.CategoryName = Obj.CategoryName) then
      begin
        if FPage is TfrxDMPPage then
          if not ((Item.ClassRef.ClassName = 'TfrxCrossView') or
            (Item.ClassRef.ClassName = 'TfrxDBCrossView')) then continue;

        m:= TMenuItem.Create(ObjectsPopup);
        m.ImageIndex:= Item.ButtonImageIndex;
        s:= Item.ButtonHint;
        if s = '' then
          s:= Item.ClassRef.GetDescription else
          s:= frxResources.Get(s);
        m.Caption:= s;
        m.OnClick:= ObjectsButtonClick;
        m.Tag:= i;
        ObjectsPopup.Items.Add(m);
      end;
    end;

    pt:= TControl(Sender).ClientToScreen(Point(TControl(Sender).Width, 0));
    ObjectsPopup.Popup(pt.X, pt.Y);
  end
  else { it's a simple object }
  begin
    if Obj.ClassRef.InheritsFrom(TfrxDialogComponent) then
    begin
      c:= TfrxComponent(Obj.ClassRef.NewInstance);
      c.DesignCreate(FPage, Obj.Flags);
      c.CreateUniqueName;
      FObjects.Add(c);
      FSelectedObjects.Clear;
      FSelectedObjects.Add(c);
      Modified:= True;

      ObjectSelectB.Down:= True;
      FWorkspace.SetInsertion(nil, 0, 0, 0);
      FWorkspace.BringToFront;
      Exit;
    end
    else
    begin
      c:= TfrxComponent(Obj.ClassRef.NewInstance);
      c.Create(FPage);
      dx:= c.Width;
      dy:= c.Height;
      c.Free;
    end;

    if (dx = 0) and (dy = 0) then
    begin
      dx:= GetDefaultObjectSize.X;
      dy:= GetDefaultObjectSize.Y;
    end;

    FWorkspace.SetInsertion(Obj.ClassRef, dx, dy, Obj.Flags);
  end;
end;

procedure TfrxDesignerForm.OnExtraToolClick(Sender:TObject);
var
  w:TfrxCustomWizard;
  Item:TfrxWizardItem;
begin
  Item:= frxWizards[TToolButton(Sender).Tag];
  w:= TfrxCustomWizard(Item.ClassRef.NewInstance);
  w.Create(Self);
  if w.Execute then
    Modified:= True;
  w.Free;
end;

procedure TfrxDesignerForm.InsertBandClick(Sender:TObject);
var
  i:Integer;
  Band:TfrxBand;
  Size:Extended;

  function FindFreeSpace:Extended;
  var
    i:Integer;
    b:TfrxComponent;
  begin
    Result:= 0;
    for i:= 0 to FPage.Objects.Count-1 do
    begin
      b:= FPage.Objects[i];
      if b is TfrxBand then
        if b.Top+b.Height > Result then
          Result:= b.Top+b.Height;
    end;

    Result:= Round((Result+Workspace.BandHeader+4) / Workspace.GridY) * Workspace.GridY;
    Result:= Round(Result * 100000000) / 100000000;
  end;

begin
  if Page = nil then Exit;

  i:= (Sender as TMenuItem).Tag;

  Band:= TfrxBand(frxBands[i mod 100].NewInstance);
  Band.Create(FPage);
  Band.CreateUniqueName;
  if i >= 100 then
    Band.Vertical:= True;

  if not Band.Vertical then
    if Workspace.FreeBandsPlacement then
      Band.Top:= FindFreeSpace else
      Band.Top:= 10000;

  Size:= 0;
  case FUnits of
    duCM:Size:= fr01cm * 6;
    duInches:Size:= fr01in * 3;
    duPixels:Size:= 20;
    duChars:Size:= fr1CharY;
  end;

  if not Band.Vertical then
    Band.Height:= Size
  else
  begin
    Band.Left:= Size;
    Band.Width:= Size;
  end;

  FObjects.Add(Band);
  FSelectedObjects.Clear;
  FSelectedObjects.Add(Band);
  Modified:= True;
  OnSelectionChanged(Self);

  ObjectSelectB.Down:= True;
  SelectToolBClick(Sender);

  if EditAfterInsert then
    OnEditObject(Self);
end;

procedure TfrxDesignerForm.ToolbarsMIClick(Sender:TObject);

  procedure SetShow(c:array of TWinControl; i:Integer; b:Boolean);
  begin
    if c[i] is TfrxToolBar then
    with c[i] as TfrxToolBar do
    begin
      if IsFloat then
        FloatWindow.Visible:= b
      else
      begin
        if b then
          AddToDock(Parent as TfrxDock);
        Visible:= b;
        (Parent as TfrxDock).AdjustBounds;
      end;
    end
    else
    begin
      c[i].ManualDock(nil);
      c[i].Visible:= b;
    end;
  end;

begin
  with Sender as TMenuItem do
  begin
    Checked:= not Checked;
    SetShow([StandardTB, TextTB, FrameTB, AlignTB, ExtraToolsTB, FInspector,
      FDataTree, FReportTree], Tag, Checked);
  end;
end;

procedure TfrxDesignerForm.ShowRulersMIClick(Sender:TObject);
begin
  ShowRulersMI.Checked:= not ShowRulersMI.Checked;
  ShowRulers:= ShowRulersMI.Checked;
end;

procedure TfrxDesignerForm.ShowGuidesMIClick(Sender:TObject);
begin
  ShowGuidesMI.Checked:= not ShowGuidesMI.Checked;
  ShowGuides:= ShowGuidesMI.Checked;
end;

procedure TfrxDesignerForm.DeleteGuidesMIClick(Sender:TObject);
begin
  if FPage is TfrxReportPage then
  begin
    TfrxReportPage(FPage).ClearGuides;
    FWorkspace.Invalidate;
    Modified:= True;
  end;
end;

procedure TfrxDesignerForm.ToolButtonClick(Sender:TObject);
var
  i:Integer;
  c:TfrxComponent;
  wasModified:Boolean;
  gx, gy:Extended;
  TheFont:TFont;

  procedure EditFont;
  begin
    with TFontDialog.Create(Application) do
    begin
      Font:= TfrxComponent(FSelectedObjects[0]).Font;
      Options:= Options+[fdForceFontExist];
      if Execute then
      begin
        TheFont:= TFont.Create;
        TheFont.Assign(Font);
      end;
      Free;
    end;
  end;

  procedure SetFontStyle(c:TfrxComponent; fStyle:TFontStyle; Include:Boolean);
  begin
    with c.Font do
      if Include then
        Style:= Style+[fStyle] else
        Style:= Style-[fStyle];
  end;

  procedure SetFrameType(c:TfrxComponent; fType:TfrxFrameType; Include:Boolean);
  var
    f:TfrxFrame;
  begin
    if c is TfrxView then
      f:= TfrxView(c).Frame
    else if c is TfrxReportPage then
      f:= TfrxReportPage(c).Frame else
      Exit;

     with f do
      if Include then
        Typ:= Typ+[fType] else
        Typ:= Typ-[fType];
  end;

  procedure SetDMPFontStyle(c:TfrxComponent; fStyle:TfrxDMPFontStyle;
    Include:Boolean);
  var
    Style:TfrxDMPFontStyles;
  begin
    Style:= [];
    if c is TfrxDMPMemoView then
      Style:= TfrxDMPMemoView(c).FontStyle;
    if c is TfrxDMPLineView then
      Style:= TfrxDMPLineView(c).FontStyle;
    if c is TfrxDMPPage then
      Style:= TfrxDMPPage(c).FontStyle;
    if not Include then
      Style:= Style+[fStyle] else
      Style:= Style-[fStyle];
    if c is TfrxDMPMemoView then
      TfrxDMPMemoView(c).FontStyle:= Style;
    if c is TfrxDMPLineView then
      TfrxDMPLineView(c).FontStyle:= Style;
    if c is TfrxDMPPage then
      TfrxDMPPage(c).FontStyle:= Style;
  end;

begin
  if FUpdatingControls then Exit;

  TheFont:= nil;
  wasModified:= False;
  if TComponent(Sender).Tag = 43 then
    EditFont;

  for i:= 0 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if rfDontModify in c.Restrictions then continue;

    case TComponent(Sender).Tag of

      0:c.Font.Name:= FontNameCB.Text;

      1:c.Font.Size:= StrToInt(FontSizeCB.Text);

      2:SetFontStyle(c, fsBold, BoldB.Down);

      3:SetFontStyle(c, fsItalic, ItalicB.Down);

      4:SetFontStyle(c, fsUnderline, UnderlineB.Down);

      5:c.Font.Color:= FColor;

      6:;

      7..10:
          if c is TfrxCustomMemoView then
            with TfrxCustomMemoView(c) do
              if TextAlignLeftB.Down then
                HAlign:= haLeft
              else if TextAlignCenterB.Down then
                HAlign:= haCenter
              else if TextAlignRightB.Down then
                HAlign:= haRight
              else
                HAlign:= haBlock;

      11..13:
          if c is TfrxCustomMemoView then
            with TfrxCustomMemoView(c) do
              if TextAlignTopB.Down then
                VAlign:= vaTop
              else if TextAlignMiddleB.Down then
                VAlign:= vaCenter
              else
                VAlign:= vaBottom;

      20:SetFrameType(c, ftTop, FrameTopB.Down);

      21:SetFrameType(c, ftBottom, FrameBottomB.Down);

      22:SetFrameType(c, ftLeft, FrameLeftB.Down);

      23:SetFrameType(c, ftRight, FrameRightB.Down);

      24:begin
            SetFrameType(c, ftTop, True);
            SetFrameType(c, ftBottom, True);
            SetFrameType(c, ftLeft, True);
            SetFrameType(c, ftRight, True);
          end;

      25:begin
            SetFrameType(c, ftTop, False);
            SetFrameType(c, ftBottom, False);
            SetFrameType(c, ftLeft, False);
            SetFrameType(c, ftRight, False);
          end;

      26:if c is TfrxView then
            TfrxView(c).Color:= FColor
          else if c is TfrxReportPage then
            TfrxReportPage(c).Color:= FColor;

      27:if c is TfrxView then
            TfrxView(c).Frame.Color:= FColor
          else if c is TfrxReportPage then
            TfrxReportPage(c).Frame.Color:= FColor;

      28:if c is TfrxView then
            TfrxView(c).Frame.Style:= FLineStyle
          else if c is TfrxReportPage then
            TfrxReportPage(c).Frame.Style:= FLineStyle;

      29:if c is TfrxView then
            TfrxView(c).Frame.Width:= frxStrToFloat(FrameWidthCB.Text)
          else if c is TfrxReportPage then
            TfrxReportPage(c).Frame.Width:= frxStrToFloat(FrameWidthCB.Text);

      30:if c is TfrxCustomMemoView then
            TfrxCustomMemoView(c).Rotation:= TMenuItem(Sender).HelpContext;

      31:
        begin
          gx:= FWorkspace.GridX;
          gy:= FWorkspace.GridY;
          c.Left:= Round(c.Left / gx) * gx;
          c.Top:= Round(c.Top / gy) * gy;
          c.Width:= Round(c.Width / gx) * gx;
          c.Height:= Round(c.Height / gy) * gy;
          if c.Width = 0 then
            c.Width:= gx;
          if c.Height = 0 then
            c.Height:= gy;
        end;

      32:if c is TfrxView then
            TfrxView(c).Frame.DropShadow:= ShadowB.Down
          else if c is TfrxReportPage then
            TfrxReportPage(c).Frame.DropShadow:= ShadowB.Down;

      33:if c is TfrxCustomMemoView then
            if StyleCB.ItemIndex = 0 then
              TfrxCustomMemoView(c).Style:= '' else
              TfrxCustomMemoView(c).Style:= StyleCB.Text;

      34:SetDMPFontStyle(c, fsxBold, BoldMI.Checked);

      35:SetDMPFontStyle(c, fsxItalic, ItalicMI.Checked);

      36:SetDMPFontStyle(c, fsxUnderline, UnderlineMI.Checked);

      37:SetDMPFontStyle(c, fsxSuperScript, SuperScriptMI.Checked);

      38:SetDMPFontStyle(c, fsxSubScript, SubScriptMI.Checked);

      39:SetDMPFontStyle(c, fsxCondensed, CondensedMI.Checked);

      40:SetDMPFontStyle(c, fsxWide, WideMI.Checked);

      41:SetDMPFontStyle(c, fsx12cpi, N12cpiMI.Checked);

      42:SetDMPFontStyle(c, fsx15cpi, N15cpiMI.Checked);

      43:if TheFont<>nil then
            c.Font:= TheFont;
    end;

    if TComponent(Sender).Tag in [0..5, 20..29, 32] then
      if c is TfrxCustomMemoView then
        TfrxCustomMemoView(c).Style:= '';

    wasModified:= True;
  end;

  if TheFont<>nil then
    TheFont.Free;

  ScrollBox.SetFocus;
  if wasModified then
  begin
    FModifiedBy:= Self;
    Modified:= True;

    if TComponent(Sender).Tag in [24, 25, 34..42] then
      UpdateControls;
  end;
end;

procedure TfrxDesignerForm.FontColorBClick(Sender:TObject);
begin
  CreateColorSelector(Sender as TToolButton);
end;

procedure TfrxDesignerForm.FrameStyleBClick(Sender:TObject);
begin
  with TfrxLineSelector.Create(TComponent(Sender)) do
    OnStyleChanged:= Self.OnStyleChanged;
end;

procedure TfrxDesignerForm.ScaleCBClick(Sender:TObject);
var
  s:String;
  dx, dy:Integer;
begin
  if ScaleCB.ItemIndex = 6 then
    s:= IntToStr(Round((ScrollBox.Width-40) / (TfrxReportPage(FPage).PaperWidth * 96 / 25.4) * 100))
  else if ScaleCB.ItemIndex = 7 then
  begin
    dx:= Round(TfrxReportPage(FPage).PaperWidth * 96 / 25.4);
    dy:= Round(TfrxReportPage(FPage).PaperHeight * 96 / 25.4);
    if (ScrollBox.Width-20) / dx < (ScrollBox.Height-20) / dy then
      s:= IntToStr(Round((ScrollBox.Width-20) / dx * 100)) else
      s:= IntToStr(Round((ScrollBox.Height-20) / dy * 100));
  end
  else
    s:= ScaleCB.Text;

  if Pos('%', s)<>0 then
    s[Pos('%', s)]:= ' ';
  while Pos(' ', s)<>0 do
    Delete(s, Pos(' ', s), 1);

  if s<>'' then
  begin
    Scale:= frxStrToFloat(s) / 100;
    ScaleCB.Text:= s+'%';
    ScrollBox.SetFocus;
  end;
end;

procedure TfrxDesignerForm.ShowGridBClick(Sender:TObject);
begin
  ShowGrid:= ShowGridB.Down;
end;

procedure TfrxDesignerForm.AlignToGridBClick(Sender:TObject);
begin
  GridAlign:= AlignToGridB.Down;
end;

procedure TfrxDesignerForm.SampleFormatBClick(Sender:TObject);
begin
  if FSelectedObjects[0] = FPage then
    FSampleFormat.SetAsSample(nil) else
    FSampleFormat.SetAsSample(TfrxCustomMemoView(FSelectedObjects[0]));
end;

procedure TfrxDesignerForm.LangCBClick(Sender:TObject);
begin
  if Application.MessageBox(PChar(frxResources.Get('dsClearScript')),
      PChar(frxResources.Get('mbConfirm')), mb_IconQuestion+mb_YesNo)<>mrYes then
  begin
    LangCB.ItemIndex:= LangCB.Items.IndexOf(Report.ScriptLanguage);
    Exit;
  end;

  Report.ScriptLanguage:= LangCB.Text;
  frxEmptyCode(CodeWindow.Lines, Report.ScriptLanguage);

  UpdateSyntaxType;
  Modified:= True;
  CodeWindow.SetFocus;
end;

procedure TfrxDesignerForm.OpenScriptBClick(Sender:TObject);
begin
  with OpenScriptDialog do
    if Execute then
    begin
      CodeWindow.Lines.LoadFromFile(FileName);
      Modified:= True;
    end;
end;

procedure TfrxDesignerForm.SaveScriptBClick(Sender:TObject);
begin
  with SaveScriptDialog do
    if Execute then
      CodeWindow.Lines.SaveToFile(FileName);
end;

procedure TfrxDesignerForm.HighlightBClick(Sender:TObject);
var
  i:Integer;
begin
  with TfrxHighlightEditorForm.Create(Self) do
  begin
    MemoView:= SelectedObjects[0];
    if ShowModal = mrOk then
    begin
      for i:= 1 to SelectedObjects.Count-1 do
        if TObject(SelectedObjects[i]) is TfrxMemoView then
          TfrxMemoView(SelectedObjects[i]).Highlight.Assign(MemoView.Highlight);

      Modified:= True;
    end;
    Free;
  end;
end;

{ Controls' event handlers }
{------------------------------------------------------------------------------}

procedure TfrxDesignerForm.OnCodeChanged(Sender:TObject);
begin
  if FPage = nil then
  begin
    FModified:= True;
    SaveCmd.Enabled:= True;
  end;
end;

procedure TfrxDesignerForm.OnChangePosition(Sender:TObject);
begin
  if FPage = nil then
  begin
    FCoord1:= Format('%d; %d', [CodeWindow.GetPos.Y, CodeWindow.GetPos.X]);
    FCoord2:= '';
    FCoord3:= '';
  end;
  StatusBar.Repaint;
end;

procedure TfrxDesignerForm.OnColorChanged(Sender:TObject);
begin
  with TfrxColorSelector(Sender) do
  begin
    FColor:= Color;
    ToolButtonClick(TfrxColorSelector(Sender));
  end;
end;

procedure TfrxDesignerForm.OnStyleChanged(Sender:TObject);
begin
  with TfrxLineSelector(Sender) do
  begin
    FLineStyle:= TfrxFrameStyle(Style);
    ToolButtonClick(TfrxLineSelector(Sender));
  end;
end;

procedure TfrxDesignerForm.ScrollBoxMouseWheelUp(Sender:TObject;
  Shift:TShiftState; MousePos:TPoint; var Handled:Boolean);
begin
  with ScrollBox.VertScrollBar do
    Position:= Position-16;
end;

procedure TfrxDesignerForm.ScrollBoxMouseWheelDown(Sender:TObject;
  Shift:TShiftState; MousePos:TPoint; var Handled:Boolean);
begin
  with ScrollBox.VertScrollBar do
    Position:= Position+16;
end;

procedure TfrxDesignerForm.ScrollBoxResize(Sender:TObject);
var
  ofs, st:Integer;
begin
  if FWorkspace = nil then Exit;
  if FWorkspace.Left < 0 then
  begin
    ofs:= ScrollBox.Left+2;
    st:=-FWorkspace.Left;
  end
  else
  begin
    ofs:= ScrollBox.Left+2+FWorkspace.Left;
    st:= 0;
  end;

  TopRuler.Offset:= ofs;
  TopRuler.Start:= st;

  if FWorkspace.Top < 0 then
  begin
    ofs:= 2;
    st:=-FWorkspace.Top;
  end
  else
  begin
    ofs:= FWorkspace.Top+2;
    st:= 0;
  end;

  LeftRuler.Offset:= ofs;
  LeftRuler.Start:= st;
end;

procedure TfrxDesignerForm.StatusBarMouseDown(Sender:TObject;
  Button:TMouseButton; Shift:TShiftState; X, Y:Integer);
begin
  FUnitsDblClicked:= X < StatusBar.Panels[0].Width;
end;

procedure TfrxDesignerForm.StatusBarDblClick(Sender:TObject);
var
  i:Integer;
begin
  if FUnitsDblClicked and not
    ((FWorkspace.GridType = gtDialog) or (FWorkspace.GridType = gtChar)) then
  begin
    i:= Integer(FUnits);
    Inc(i);
    if i > 2 then
      i:= 0;
    Units:= TfrxDesignerUnits(i);
    FOldUnits:= FUnits;
  end;
end;

procedure TfrxDesignerForm.StatusBarDrawPanel(StatusBar:TStatusBar;
  Panel:TStatusPanel; const ARect:TRect);
begin
  with StatusBar.Canvas do
  begin
    FillRect(ARect);

    if FCoord1<>'' then
    begin
      frxResources.MainButtonImages.Draw(StatusBar.Canvas, ARect.Left+2, ARect.Top-1, 62);
      TextOut(ARect.Left+20, ARect.Top+1, FCoord1);
    end;

    if FCoord2<>'' then
    begin
      frxResources.MainButtonImages.Draw(StatusBar.Canvas, ARect.Left+110, ARect.Top-1, 63);
      TextOut(ARect.Left+130, ARect.Top+1, FCoord2);
    end;

    if FCoord3<>'' then
      TextOut(ARect.Left+110, ARect.Top+1, FCoord3);
  end;
end;

procedure TfrxDesignerForm.TimerTimer(Sender:TObject);
begin
  PasteCmd.Enabled:= FClipboard.PasteAvailable or (FPage = nil);
end;

procedure TfrxDesignerForm.BandsPopupPopup(Sender:TObject);

  function FindBand(Band:TfrxComponentClass):TfrxBand;
  var
    i:Integer;
  begin
    Result:= nil;
    if FPage = nil then Exit;
    for i:= 0 to FPage.Objects.Count-1 do
      if TObject(FPage.Objects[i]) is Band then
        Result:= FPage.Objects[i];
  end;

begin
  ReportTitleMI.Enabled:= FindBand(TfrxReportTitle) = nil;
  ReportSummaryMI.Enabled:= FindBand(TfrxReportSummary) = nil;
  PageHeaderMI.Enabled:= FindBand(TfrxPageHeader) = nil;
  PageFooterMI.Enabled:= FindBand(TfrxPageFooter) = nil;
  ColumnHeaderMI.Enabled:= FindBand(TfrxColumnHeader) = nil;
  ColumnFooterMI.Enabled:= FindBand(TfrxColumnFooter) = nil;
end;

procedure TfrxDesignerForm.ToolbarsMIOpen(Sender:TObject);
begin
  StandardMI.Checked:= StandardTB.IsVisible;
  TextMI.Checked:= TextTB.IsVisible;
  FrameMI.Checked:= FrameTB.IsVisible;
  AlignmentMI.Checked:= AlignTB.IsVisible;
  ToolsMI.Checked:= ExtraToolsTB.IsVisible;
  InspectorMI.Checked:= FInspector.Visible;
  DataTreeMI.Checked:= FDataTree.Visible;
  ReportTreeMI.Checked:= FReportTree.Visible;
end;

procedure TfrxDesignerForm.TopRulerDragOver(Sender, Source:TObject; X,
  Y:Integer; State:TDragState; var Accept:Boolean);
begin
  Accept:= Source is TfrxDesignerWorkspace;
end;

procedure TfrxDesignerForm.PagePopupPopup(Sender:TObject);
var
  i:Integer;
  ed:TfrxComponentEditor;
  p:TPopupMenu;
  m:TMenuItem;
begin
  while PagePopup.Items[2]<>SepMI8 do
    PagePopup.Items[2].Free;

  p:= TPopupMenu.Create(nil);
  ed:= frxComponentEditors.GetComponentEditor(FSelectedObjects[0], Self, p);
  if ed<>nil then
  begin
    EditMI1.Enabled:= ed.HasEditor;
    EditMI1.Default:= EditMI1.Enabled;

    ed.GetMenuItems;

    SepMI12.Visible:= p.Items.Count > 0;

    for i:= p.Items.Count-1 downto 0 do
    begin
      m:= TMenuItem.Create(PagePopup);
      with p.Items[i] do
      begin
        m.Caption:= Caption;
        m.Tag:= Tag;
        m.Checked:= Checked;
        m.Bitmap:= Bitmap;
      end;
      m.OnClick:= OnComponentMenuClick;
      PagePopup.Items.Insert(2, m);
    end;

    ed.Free;
  end
  else
  begin
    EditMI1.Enabled:= False;
    SepMI12.Visible:= False;
  end;

  p.Free;
end;

procedure TfrxDesignerForm.CodeWindowDragOver(Sender, Source:TObject; X,
  Y:Integer; State:TDragState; var Accept:Boolean);
begin
  Accept:= (Source is TTreeView) and (TTreeView(Source).Owner = FDataTree) and
     (FDataTree.GetFieldName<>'');
end;

procedure TfrxDesignerForm.CodeWindowDragDrop(Sender, Source:TObject; X,
  Y:Integer);
begin
  CodeWindow.SelText:= FDataTree.GetFieldName;
  CodeWindow.SetFocus;
end;

procedure TfrxDesignerForm.OnDataTreeDblClick(Sender:TObject);
begin
  if Page = nil then
  begin
    CodeWindow.SelText:= FDataTree.GetFieldName;
    CodeWindow.SetFocus;
  end
  else if (FDataTree.Tabs.ActivePage = FDataTree.DataTS) and
    (Report.DataSets.Count = 0) then
    ReportDataMIClick(Self);
end;

procedure TfrxDesignerForm.TabChanging(Sender:TObject; var AllowChange:Boolean);
begin
  if IsPreviewDesigner or FScriptRunning then
    AllowChange:= False;

  if (Tab.TabIndex = 0) and CodeWindow.Modified then
  begin
    Modified:= True;
    CodeWindow.Modified:= False;
  end;

  SavePagePosition;
end;

procedure TfrxDesignerForm.TabChange(Sender:TObject);
begin
  if Tab.TabIndex = 0 then
{$IFDEF FR_VER_BASIC}
    Tab.TabIndex:= 1 else
{$ELSE}
    Page:= nil else
{$ENDIF}
    Page:= Report.Pages[Tab.TabIndex-1];
end;

procedure TfrxDesignerForm.TabMouseDown(Sender:TObject;
  Button:TMouseButton; Shift:TShiftState; X, Y:Integer);
var
  p:TPoint;
begin
  GetCursorPos(p);
  if Button = mbRight then
    TabPopup.Popup(p.X, p.Y) else
    FMouseDown:= True;
end;

procedure TfrxDesignerForm.TabMouseUp(Sender:TObject;
  Button:TMouseButton; Shift:TShiftState; X, Y:Integer);
var
  pt:TPoint;
begin
  FMouseDown:= False;
  if Button = mbRight then
  begin
    pt:= TControl(Sender).ClientToScreen(Point(X, Y));
    TabPopup.Popup(pt.X, pt.Y);
  end;
end;

procedure TfrxDesignerForm.TabMouseMove(Sender:TObject;
  Shift:TShiftState; X, Y:Integer);
begin
  if FMouseDown then
    Tab.BeginDrag(False);
end;

procedure TfrxDesignerForm.TabDragOver(Sender, Source:TObject; X,
  Y:Integer; State:TDragState; var Accept:Boolean);
begin
  Accept:= Source is TTabControl;
end;

procedure TfrxDesignerForm.TabDragDrop(Sender, Source:TObject; X,
  Y:Integer);
var
  HitPage, CurPage:Integer;
  HitTestInfo:TTCHitTestInfo;
begin
  HitTestInfo.pt:= Point(X, Y);
  HitPage:= SendMessage(Tab.Handle, TCM_HITTEST, 0, Longint(@HitTestInfo));
  CurPage:= Report.Objects.IndexOf(Page)+1;
  if (CurPage = 0) or (HitPage = 0) then Exit;

  Tab.Tabs.Move(CurPage, HitPage);
  Report.Objects.Move(CurPage-1, HitPage-1);
  Modified:= True;
end;

procedure TfrxDesignerForm.DataLVClick(Sender:TObject);
var
  i:Integer;
begin
  if DataLV.Selected = nil then Exit;
  FSelectedObjects.Clear;
  for i:= 0 to DataLV.Items.Count-1 do
    if DataLV.Items[i].Selected then
      FSelectedObjects.Add(DataLV.Items[i].Data);
  OnSelectionChanged(FWorkspace);
end;

procedure TfrxDesignerForm.DataLVDblClick(Sender:TObject);
begin
  OnEditObject(FWorkspace);
end;

procedure TfrxDesignerForm.DataLVKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  THackControl(FWorkspace).KeyDown(Key, Shift);
  FormKeyDown(Sender, Key, Shift);
end;

procedure TfrxDesignerForm.DataLVChange(Sender:TObject; Item:TListItem;
  Change:TItemChange);
begin
  if FUpdatingControls then Exit;
  DataLVClick(nil);
end;

{ Dialog form events }
{------------------------------------------------------------------------------}

procedure TfrxDesignerForm.DialogFormModify(Sender:TObject);
begin
  Page.Left:= FDialogForm.Left;
  Page.Top:= FDialogForm.Top;
  Page.Width:= FDialogForm.Width;
  Page.Height:= FDialogForm.Height;
  Modified:= True;
end;

procedure TfrxDesignerForm.DialogFormKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if Shift = [ssCtrl] then
    if Key = Ord('C') then
      CopyCmd.Execute
    else if Key = Ord('V') then
      PasteCmd.Execute
    else if Key = Ord('X') then
      CutCmd.Execute
    else if Key = Ord('Z') then
      UndoCmd.Execute
    else if Key = Ord('Y') then
      RedoCmd.Execute
    else if Key = Ord('A') then
      SelectAllCmd.Execute
    else if Key = Ord('S') then
      SaveCmd.Execute;

  THackControl(FWorkspace).KeyDown(Key, Shift);
end;

procedure TfrxDesignerForm.DialogFormKeyUp(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  THackControl(FWorkspace).KeyUp(Key, Shift);
end;

procedure TfrxDesignerForm.DialogFormKeyPress(Sender:TObject; var Key:Char);
begin
  THackControl(FWorkspace).KeyPress(Key);
end;

{ Menu commands }
{------------------------------------------------------------------------------}

procedure TfrxDesignerForm.ExitCmdExecute(Sender:TObject);
begin
  Close;
end;

procedure TfrxDesignerForm.OptionsMIClick(Sender:TObject);
var
  u:TfrxDesignerUnits;
begin
  u:= FUnits;

  with TfrxOptionsEditor.Create(Self) do
  begin
    ShowModal;
    Free;
  end;

  if u<>FUnits then
    FOldUnits:= FUnits;

  if FWorkspace.GridType = gtDialog then
  begin
    FWorkspace.GridX:= FGridSize4;
    FWorkspace.GridY:= FGridSize4;
  end;

  FWorkspace.UpdateView;
  CodeWindow.Invalidate;
end;

procedure TfrxDesignerForm.UndoCmdExecute(Sender:TObject);
var
  i:Integer;
begin
  if IsPreviewDesigner then Exit;

  if FPage = nil then
  begin
    CodeWindow.Undo;
    Exit;
  end;

  i:= GetPageIndex;
  Lock;

  Report.ScriptText:= CodeWindow.Lines;
  FUndoBuffer.AddRedo(Report);
  FUndoBuffer.GetUndo(Report);
  CodeWindow.Lines:= Report.ScriptText;

  ReloadPages(i);
end;

procedure TfrxDesignerForm.RedoCmdExecute(Sender:TObject);
var
  i:Integer;
begin
  if IsPreviewDesigner then Exit;

  i:= GetPageIndex;
  Lock;

  FUndoBuffer.GetRedo(Report);
  FUndoBuffer.AddUndo(Report);
  CodeWindow.Lines:= Report.ScriptText;

  ReloadPages(i);
end;

procedure TfrxDesignerForm.CutCmdExecute(Sender:TObject);
begin
  if FPage = nil then
  begin
    CodeWindow.CutToClipboard;
    Exit;
  end;

  FClipboard.Copy;
  FWorkspace.DeleteObjects;
  FInspector.Objects:= FObjects;

  Modified:= True;
end;

procedure TfrxDesignerForm.CopyCmdExecute(Sender:TObject);
begin
  if FPage = nil then
  begin
    CodeWindow.CopyToClipboard;
    Exit;
  end;

  FClipboard.Copy;
  TimerTimer(nil);
end;

procedure TfrxDesignerForm.PasteCmdExecute(Sender:TObject);
begin
  if FPage = nil then
  begin
    CodeWindow.PasteFromClipboard;
    Exit;
  end;

  FClipboard.Paste;
  FWorkspace.BringToFront;
  FInspector.Objects:= FObjects;
  FInspector.UpdateProperties;

  if TfrxComponent(FSelectedObjects[0]) is TfrxDialogComponent then
    Modified:= True
  else if FSelectedObjects[0]<>FPage then
    TDesignerWorkspace(FWorkspace).SimulateMove;
end;

procedure TfrxDesignerForm.GroupCmdExecute(Sender:TObject);
begin
  FWorkspace.GroupObjects;
end;

procedure TfrxDesignerForm.UngroupCmdExecute(Sender:TObject);
begin
  FWorkspace.UngroupObjects;
end;

procedure TfrxDesignerForm.DeletePageCmdExecute(Sender:TObject);
begin
  if not CheckOp(drDontDeletePage) then Exit;

  Lock;
  if (FPage is TfrxReportPage) and (TfrxReportPage(FPage).Subreport<>nil) then
    TfrxReportPage(FPage).Subreport.Free;

  FPage.Free;
  ReloadPages(0);
  Modified:= True;
end;

procedure TfrxDesignerForm.NewPageCmdExecute(Sender:TObject);
begin
  if not CheckOp(drDontCreatePage) then Exit;

  Lock;
  if Report.DotMatrixReport then
    FPage:= TfrxDMPPage.Create(Report) else
    FPage:= TfrxReportPage.Create(Report);
  FPage.CreateUniqueName;
  TfrxReportPage(FPage).SetDefaults;
  ReloadPages(Report.PagesCount-1);
  Modified:= True;
end;

procedure TfrxDesignerForm.NewDialogCmdExecute(Sender:TObject);
begin
  if not CheckOp(drDontCreatePage) then Exit;

  Lock;
  FPage:= TfrxDialogPage.Create(Report);
  FPage.CreateUniqueName;
  FPage.SetBounds(265, 150, 300, 200);
  ReloadPages(Report.PagesCount-1);
  Modified:= True;
end;

procedure TfrxDesignerForm.NewReportCmdExecute(Sender:TObject);
var
  p:TfrxReportPage;
  b:TfrxBand;
  m:TfrxMemoView;
  h, t:Extended;
  w:Word;
begin
  if not CheckOp(drDontCreateReport) then Exit;

  if Modified then
  begin
    w:= AskSave;
    if w = mrYes then
      SaveCmdExecute(Self)
    else if w = mrCancel then
      Exit;
  end;

  t:= FWorkspace.BandHeader;
  h:= 0;
  case FUnits of
    duCM:h:= fr01cm * 6;
    duInches:h:= fr01in * 3;
    duPixels:h:= 20;
    duChars:h:= fr1CharY;
  end;

  ObjectSelectB.Down:= True;
  SelectToolBClick(Self);

  Lock;
  Report.Clear;
  Report.FileName:= '';
  CodeWindow.Lines:= Report.ScriptText;

  p:= TfrxReportPage.Create(Report);
  p.Name:= 'Page1';
  p.SetDefaults;

  b:= TfrxReportTitle.Create(p);
  b.Name:= 'ReportTitle1';
  b.Top:= t;
  b.Height:= h;

  b:= TfrxMasterData.Create(p);
  b.Name:= 'MasterData1';
  b.Height:= h;
  b.Top:= t * 2+h * 2;

  b:= TfrxPageFooter.Create(p);
  b.Name:= 'PageFooter1';
  b.Height:= h;
  b.Top:= t * 3+h * 4;

  m:= TfrxMemoView.Create(b);
  m.Name:= 'Memo1';
  m.SetBounds((p.PaperWidth-p.LeftMargin-p.RightMargin-20) * fr01cm, 0,
    2 * fr1cm, 5 * fr01cm);
  m.HAlign:= haRight;
  m.Memo.Text:= '[Page#]';

  ReloadPages(0);
  UpdateCaption;
  Modified:= False;
end;

procedure TfrxDesignerForm.SaveCmdExecute(Sender:TObject);
begin
  if CheckOp(drDontSaveReport) then
    SaveFile(False, Sender = SaveCmd);
end;

procedure TfrxDesignerForm.SaveAsCmdExecute(Sender:TObject);
begin
  if CheckOp(drDontSaveReport) then
    SaveFile(True, Sender = SaveAsCmd);
end;

procedure TfrxDesignerForm.OpenCmdExecute(Sender:TObject);
begin
  if CheckOp(drDontLoadReport) then
    LoadFile('', Sender = OpenCmd);
end;

procedure TfrxDesignerForm.OpenRecentFile(Sender:TObject);
begin
  if CheckOp(drDontLoadReport) then
    LoadFile(TMenuItem(Sender).Caption, True);
end;

procedure TfrxDesignerForm.DeleteCmdExecute(Sender:TObject);
begin
  FWorkspace.DeleteObjects;
end;

procedure TfrxDesignerForm.SelectAllCmdExecute(Sender:TObject);
var
  i:Integer;
  Parent:TfrxComponent;
begin
  Parent:= FPage;
  if FSelectedObjects.Count = 1 then
    if TfrxComponent(FSelectedObjects[0]) is TfrxBand then
      Parent:= FSelectedObjects[0]
    else if TfrxComponent(FSelectedObjects[0]).Parent is TfrxBand then
      Parent:= TfrxComponent(FSelectedObjects[0]).Parent;

  if Parent.Objects.Count<>0 then
    FSelectedObjects.Clear;
  for i:= 0 to Parent.Objects.Count-1 do
    FSelectedObjects.Add(Parent.Objects[i]);
  OnSelectionChanged(Self);
end;

procedure TfrxDesignerForm.EditCmdExecute(Sender:TObject);
begin
  FWorkspace.EditObject;
end;

procedure TfrxDesignerForm.BringToFrontCmdExecute(Sender:TObject);
var
  i:Integer;
  c:TfrxComponent;
begin
  for i:= 0 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if (c is TfrxReportComponent) and not (rfDontMove in c.Restrictions) then
    begin
      c.Parent.Objects.Remove(c);
      c.Parent.Objects.Add(c);
    end;
  end;

  ReloadObjects;
  Modified:= True;
end;

procedure TfrxDesignerForm.SendToBackCmdExecute(Sender:TObject);
var
  i:Integer;
  c:TfrxComponent;
begin
  for i:= 0 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if (c is TfrxReportComponent) and not (rfDontMove in c.Restrictions) then
    begin
      c.Parent.Objects.Remove(c);
      c.Parent.Objects.Insert(0, c);
    end;
  end;

  ReloadObjects;
  Modified:= True;
end;

procedure TfrxDesignerForm.TabOrderMIClick(Sender:TObject);
begin
  with TfrxTabOrderEditorForm.Create(Self) do
  begin
    if ShowModal = mrOk then
      Modified:= True;
    ReloadObjects;
    Free;
  end;
end;

procedure TfrxDesignerForm.AboutMIClick(Sender:TObject);
begin
  with TfrxAboutForm.Create(Self) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrxDesignerForm.ReportSettingsMIClick(Sender:TObject);
begin
  if CheckOp(drDontChangeReportOptions) then
    with TfrxReportEditorForm.Create(Self) do
    begin
      if ShowModal = mrOk then
        Modified:= True;
      Free;
    end;
end;

procedure TfrxDesignerForm.PageSettingsCmdExecute(Sender:TObject);
begin
  if CheckOp(drDontChangePageOptions) then
    if (FPage is TfrxReportPage) and (TfrxReportPage(FPage).Subreport = nil) then
      with TfrxPageEditorForm.Create(Self) do
      begin
        if ShowModal = mrOk then
        begin
          Modified:= True;
          UpdatePageDimensions;
        end;
        Free;
      end;
end;

procedure TfrxDesignerForm.OnComponentMenuClick(Sender:TObject);
var
  ed:TfrxComponentEditor;
begin
  ed:= frxComponentEditors.GetComponentEditor(FSelectedObjects[0], Self, nil);
  if ed<>nil then
  begin
    if ed.Execute(TMenuItem(Sender).Tag, not TMenuItem(Sender).Checked) then
      Modified:= True;
    ed.Free;
  end;
end;

procedure TfrxDesignerForm.ReportDataMIClick(Sender:TObject);
begin
  if CheckOp(drDontEditReportData) then
    with TfrxReportDataForm.Create(Self) do
    begin
      Report:= Self.Report;
      if ShowModal = mrOk then
      begin
        Modified:= True;
        UpdateDataTree;
      end;
      Free;
    end;
end;

procedure TfrxDesignerForm.VariablesCmdExecute(Sender:TObject);
begin
  if CheckOp(drDontEditVariables) then
    with TfrxVarEditorForm.Create(Self) do
    begin
      if ShowModal = mrOk then
      begin
        Modified:= True;
        UpdateDataTree;
      end;
      Free;
    end;
end;

procedure TfrxDesignerForm.PreviewCmdExecute(Sender:TObject);
var
  Preview:TfrxCustomPreview;
  pt:TPoint;
  SavePageNo:Integer;
  SaveModalPreview:Boolean;
  SaveDestroyForms:Boolean;
begin
  if not CheckOp(drDontPreviewReport) then Exit;

  SavePagePosition;
  Report.ScriptText:= CodeWindow.Lines;
  if not Report.PrepareScript then
  begin
    pt:= fsPosToPoint(Report.Script.ErrorPos);
    SwitchToCodeWindow;
    FCodeWindow.SetPos(pt.X, pt.Y);
    FCodeWindow.ShowMessage(Report.Script.ErrorMsg);
    Exit;
  end;

  SavePageNo:= GetPageIndex;
  SaveModalPreview:= Report.PreviewOptions.Modal;
  SaveDestroyForms:= Report.EngineOptions.DestroyForms;
  Lock;
  Preview:= Report.Preview;
  try
    Report.Preview:= nil;
    Report.PreviewOptions.Modal:= True;
    Report.EngineOptions.DestroyForms:= True;
    Report.ShowReport;
  except
  end;

  Report.Script.ClearItems(Report);
  Report.Preview:= Preview;
  Report.PreviewOptions.Modal:= SaveModalPreview;
  Report.EngineOptions.DestroyForms:= SaveDestroyForms;

  if SavePageNo<>-1 then
    ReloadPages(SavePageNo)
  else
  begin
    ReloadPages(0);
    Page:= nil;
  end;
end;

procedure TfrxDesignerForm.ReportStylesMIClick(Sender:TObject);
begin
  if CheckOp(drDontChangeReportOptions) then
    with TfrxStyleEditorForm.Create(Self) do
    begin
      if ShowModal = mrOk then
      begin
        Modified:= True;
        UpdateStyles;
        Report.Styles.Apply;
      end;
      Free;
    end;
end;

procedure TfrxDesignerForm.NewItemCmdExecute(Sender:TObject);
begin
  if CheckOp(drDontCreateReport) then
    with TfrxNewItemForm.Create(Self) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TfrxDesignerForm.FindMIClick(Sender:TObject);
begin
  with TfrxSearchDialog.Create(Application) do
  begin
    FSearchReplace:= Sender = ReplaceMI;
    if FSearchReplace then
      ReplacePanel.Show;
    if Page<>nil then
      TopCB.Enabled:= False;
    if ShowModal = mrOk then
    begin
      FSearchText:= TextE.Text;
      FSearchReplaceText:= ReplaceE.Text;
      FSearchCase:= CaseCB.Checked;
      FSearchIndex:= 0;
      if (Page = nil) and not TopCB.Checked then
        FSearchIndex:= CodeWindow.GetPlainPos;
      FindNextMI.Enabled:= True;
      FindText;
    end;
    Free;
  end;
end;

procedure TfrxDesignerForm.FindNextMIClick(Sender:TObject);
begin
  FindText;
end;

{ Debugging }
{------------------------------------------------------------------------------}

procedure TfrxDesignerForm.RunScriptBClick(Sender:TObject);
begin
  if FScriptRunning then
  begin
    if Sender = RunScriptB then
      Report.Script.OnRunLine:= nil;
    FScriptStopped:= False;
    Exit;
  end;

  if Sender = RunScriptB then
    Report.Script.OnRunLine:= nil else
    Report.Script.OnRunLine:= OnRunLine;
  try
    FScriptRunning:= True;
    FScriptFirstTime:= True;
    PreviewCmdExecute(Self);
  finally
    FScriptRunning:= False;
    Report.Script.OnRunLine:= nil;
    CodeWindow.ActiveLine:=-1;
  end;
end;

procedure TfrxDesignerForm.StopScriptBClick(Sender:TObject);
begin
  Report.Script.OnRunLine:= nil;
  Report.Script.Terminate;
  Report.Terminated:= True;
  FScriptStopped:= False;
end;

procedure TfrxDesignerForm.EvaluateBClick(Sender:TObject);
begin
  with TfrxEvaluateForm.Create(Self) do
  begin
    Script:= Report.Script;
    if CodeWindow.SelText<>'' then
      ExpressionE.Text:= CodeWindow.SelText;
    ShowModal;
    Free;
  end;
end;

procedure TfrxDesignerForm.OnRunLine(Sender:TfsScript; const UnitName,
  SourcePos:String);
var
  p:TPoint;
  SaveActiveForm:TForm;

  procedure CreateLineMarks;
  var
    i:Integer;
  begin
    for i:= 0 to Report.Script.Lines.Count-1 do
      CodeWindow.RunLine[i+1]:= Report.Script.IsExecutableLine(i+1);
  end;

begin
  p:= fsPosToPoint(SourcePos);
  if CodeWindow.BreakPoint > 0 then
    if p.Y<>CodeWindow.BreakPoint then
      Exit;

  CodeWindow.BreakPoint:= 0;
  if FScriptFirstTime then
    CreateLineMarks;
  FScriptFirstTime:= False;

  SaveActiveForm:= Screen.ActiveForm;
  EnableWindow(Handle, True);
  SetFocus;

  CodeWindow.ActiveLine:= p.Y;
  CodeWindow.SetPos(p.X, p.Y);

  FScriptStopped:= True;
  while FScriptStopped do
    Application.ProcessMessages;

  if SaveActiveForm<>nil then
    SaveActiveForm.SetFocus;
end;

{ Alignment palette }
{------------------------------------------------------------------------------}

procedure TfrxDesignerForm.AlignLeftsBClick(Sender:TObject);
var
  i:Integer;
  c0, c:TfrxComponent;
begin
  if FSelectedObjects.Count < 2 then Exit;

  c0:= FSelectedObjects[0];
  for i:= 1 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if not (rfDontMove in c.Restrictions) then
      c.Left:= c0.Left;
  end;

  Modified:= True;
end;

procedure TfrxDesignerForm.AlignRightsBClick(Sender:TObject);
var
  i:Integer;
  c0, c:TfrxComponent;
begin
  if FSelectedObjects.Count < 2 then Exit;

  c0:= FSelectedObjects[0];
  for i:= 1 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if not (rfDontMove in c.Restrictions) then
      c.Left:= c0.Left+c0.Width-c.Width;
  end;

  Modified:= True;
end;

procedure TfrxDesignerForm.AlignTopsBClick(Sender:TObject);
var
  i:Integer;
  c0, c:TfrxComponent;
begin
  if FSelectedObjects.Count < 2 then Exit;

  c0:= FSelectedObjects[0];
  for i:= 1 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if not (rfDontMove in c.Restrictions) then
      if Abs(c.Top-c.AbsTop) < 1e-4 then
        c.Top:= c0.AbsTop
      else
        c.Top:= c0.AbsTop-c.AbsTop+c.Top;
  end;

  Modified:= True;
end;

procedure TfrxDesignerForm.AlignBottomsBClick(Sender:TObject);
var
  i:Integer;
  c0, c:TfrxComponent;
begin
  if FSelectedObjects.Count < 2 then Exit;

  c0:= FSelectedObjects[0];
  for i:= 1 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if not (rfDontMove in c.Restrictions) then
      if Abs(c.Top-c.AbsTop) < 1e-4 then
        c.Top:= c0.AbsTop+c0.Height-c.Height
      else
        c.Top:= c0.AbsTop-c.AbsTop+c.Top+c0.Height-c.Height;
  end;

  Modified:= True;
end;

procedure TfrxDesignerForm.AlignHorzCentersBClick(Sender:TObject);
var
  i:Integer;
  c0, c:TfrxComponent;
begin
  if FSelectedObjects.Count < 2 then Exit;

  c0:= FSelectedObjects[0];
  for i:= 1 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if not (rfDontMove in c.Restrictions) then
      c.Left:= c0.Left+c0.Width / 2-c.Width / 2;
  end;

  Modified:= True;
end;

procedure TfrxDesignerForm.AlignVertCentersBClick(Sender:TObject);
var
  i:Integer;
  c0, c:TfrxComponent;
begin
  if FSelectedObjects.Count < 2 then Exit;

  c0:= FSelectedObjects[0];
  for i:= 1 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if not (rfDontMove in c.Restrictions) then
      c.Top:= c0.Top+c0.Height / 2-c.Height / 2;
  end;

  Modified:= True;
end;

procedure TfrxDesignerForm.CenterHorzBClick(Sender:TObject);
var
  i:Integer;
  c:TfrxComponent;
begin
  if FSelectedObjects.Count < 1 then Exit;

  for i:= 0 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if not (rfDontMove in c.Restrictions) and (c is TfrxView) then
      if c.Parent is TfrxBand then
        c.Left:= (c.Parent.Width-c.Width) / 2 else
        c.Left:= (FWorkspace.Width / Scale-c.Width) / 2;
  end;

  Modified:= True;
end;

procedure TfrxDesignerForm.CenterVertBClick(Sender:TObject);
var
  i:Integer;
  c:TfrxComponent;
begin
  if FSelectedObjects.Count < 1 then Exit;

  for i:= 0 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if not (rfDontMove in c.Restrictions) and (c is TfrxView) then
      if c.Parent is TfrxBand then
        c.Top:= (c.Parent.Height-c.Height) / 2 else
        c.Top:= (FWorkspace.Height / Scale-c.Height) / 2;
  end;

  Modified:= True;
end;

procedure TfrxDesignerForm.SpaceHorzBClick(Sender:TObject);
var
  i:Integer;
  c:TfrxComponent;
  sl:TStringList;
  dx:Extended;
begin
  if FSelectedObjects.Count < 3 then Exit;

  sl:= TStringList.Create;
  sl.Sorted:= True;
  sl.Duplicates:= dupAccept;

  for i:= 0 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    sl.AddObject(Format('%4.4d', [Round(c.Left)]), c);
  end;

  dx:= (TfrxComponent(sl.Objects[sl.Count-1]).Left-
    TfrxComponent(sl.Objects[0]).Left) / (sl.Count-1);

  for i:= 1 to sl.Count-2 do
  begin
    c:= TfrxComponent(sl.Objects[i]);
    if not (rfDontMove in c.Restrictions) then
      c.Left:= TfrxComponent(sl.Objects[i-1]).Left+dx;
  end;

  sl.Free;
  Modified:= True;
end;

procedure TfrxDesignerForm.SpaceVertBClick(Sender:TObject);
var
  i:Integer;
  c:TfrxComponent;
  sl:TStringList;
  dy:Extended;
begin
  if FSelectedObjects.Count < 3 then Exit;

  sl:= TStringList.Create;
  sl.Sorted:= True;
  sl.Duplicates:= dupAccept;

  for i:= 0 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    sl.AddObject(Format('%4.4d', [Round(c.Top)]), c);
  end;

  dy:= (TfrxComponent(sl.Objects[sl.Count-1]).Top-
    TfrxComponent(sl.Objects[0]).Top) / (sl.Count-1);

  for i:= 1 to sl.Count-2 do
  begin
    c:= TfrxComponent(sl.Objects[i]);
    if not (rfDontMove in c.Restrictions) then
      c.Top:= TfrxComponent(sl.Objects[i-1]).Top+dy;
  end;

  sl.Free;
  Modified:= True;
end;

procedure TfrxDesignerForm.SameWidthBClick(Sender:TObject);
var
  i:Integer;
  c0, c:TfrxComponent;
begin
  if FSelectedObjects.Count < 2 then Exit;

  c0:= FSelectedObjects[0];
  for i:= 1 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if not (rfDontSize in c.Restrictions) then
      c.Width:= c0.Width;
  end;

  Modified:= True;
end;

procedure TfrxDesignerForm.SameHeightBClick(Sender:TObject);
var
  i:Integer;
  c0, c:TfrxComponent;
begin
  if FSelectedObjects.Count < 2 then Exit;

  c0:= FSelectedObjects[0];
  for i:= 1 to FSelectedObjects.Count-1 do
  begin
    c:= FSelectedObjects[i];
    if not (rfDontSize in c.Restrictions) then
      c.Height:= c0.Height;
  end;

  Modified:= True;
end;

{ Save/restore state }
{------------------------------------------------------------------------------}

procedure TfrxDesignerForm.SaveState;
var
  Ini:TCustomIniFile;
  Nm:String;

  procedure SaveToolbars(t:Array of TfrxToolBar);
  var
    i:Integer;
  begin
    for i:= Low(t) to High(t) do
      frxSaveToolbarPosition(Ini, t[i]);
  end;

  procedure SaveDocks(t:Array of TfrxDockSite);
  var
    i:Integer;
  begin
    for i:= Low(t) to High(t) do
      frxSaveDock(Ini, t[i]);
  end;

begin
  if IsPreviewDesigner then Exit;

  Ini:= Report.GetIniFile;
  Nm:= 'Form.TfrxDesignerForm';
  Ini.WriteInteger('Form.TfrxObjectInspector', 'SplitPos', FInspector.SplitterPos);
  Ini.WriteInteger('Form.TfrxObjectInspector', 'Split1Pos', FInspector.Splitter1Pos);
  Ini.WriteFloat(Nm, 'Scale', FScale);
  Ini.WriteBool(Nm, 'ShowGrid', FShowGrid);
  Ini.WriteBool(Nm, 'GridAlign', FGridAlign);
  Ini.WriteBool(Nm, 'ShowRulers', FShowRulers);
  Ini.WriteBool(Nm, 'ShowGuides', FShowGuides);
  Ini.WriteFloat(Nm, 'Grid1', FGridSize1);
  Ini.WriteFloat(Nm, 'Grid2', FGridSize2);
  Ini.WriteFloat(Nm, 'Grid3', FGridSize3);
  Ini.WriteFloat(Nm, 'Grid4', FGridSize4);
  FUnits:= FOldUnits;
  Ini.WriteInteger(Nm, 'Units', Integer(FUnits));
  Ini.WriteString(Nm, 'ScriptFontName', CodeWindow.Font.Name);
  Ini.WriteInteger(Nm, 'ScriptFontSize', CodeWindow.Font.Size);
  Ini.WriteString(Nm, 'MemoFontName', MemoFontName);
  Ini.WriteInteger(Nm, 'MemoFontSize', MemoFontSize);
  Ini.WriteBool(Nm, 'UseObjectFont', UseObjectFont);
  Ini.WriteInteger(Nm, 'WorkspaceColor', FWorkspaceColor);
  Ini.WriteInteger(Nm, 'ToolsColor', FToolsColor);
  Ini.WriteBool(Nm, 'GridLCD', FWorkspace.GridLCD);
  Ini.WriteBool(Nm, 'EditAfterInsert', FEditAfterInsert);
  Ini.WriteBool(Nm, 'LocalizedOI', FLocalizedOI);
  Ini.WriteString(Nm, 'RecentFiles', FRecentFiles.CommaText);
  Ini.WriteBool(Nm, 'FreeBands', FWorkspace.FreeBandsPlacement);
  Ini.WriteInteger(Nm, 'BandsGap', FWorkspace.GapBetweenBands);
  Ini.WriteBool(Nm, 'ShowBandCaptions', FWorkspace.ShowBandCaptions);
  Ini.WriteBool(Nm, 'DropFields', FDropFields);
  Ini.WriteBool(Nm, 'ShowStartup', FShowStartup);

  frxSaveFormPosition(Ini, Self);
  frxSaveFormPosition(Ini, FInspector);
  frxSaveFormPosition(Ini, FDataTree);
  frxSaveFormPosition(Ini, FReportTree);
  SaveToolbars([StandardTB, TextTB, FrameTB, AlignTB, ExtraToolsTB]);
  SaveDocks([LeftDockSite1, LeftDockSite2, RightDockSite]);

  Ini.Free;
end;

procedure TfrxDesignerForm.RestoreState(RestoreDefault:Boolean = False);
const
  DefIni =
'[Form.TfrxObjectInspector];'+
'Width=159;'+
'SplitPos=75;'+
'Split1Pos=65;'+
'Dock=LeftDockSite2;'+
'[Form.TfrxDesignerForm];'+
'EditAfterInsert=1;'+
'Maximized=1;'+
'[Form.TfrxDataTreeForm];'+
'Width=143;'+
'Dock=RightDockSite;'+
'[Form.TfrxReportTreeForm];'+
'Width=159;'+
'Dock=LeftDockSite2;'+
'[ToolBar.AlignTB];'+
'Visible=0;'+
'[ToolBar.ExtraToolsTB];'+
'Visible=0;'+
'[Dock.LeftDockSite2];'+
'Data=00000400000000004802000000000000019F00000000000000010000000073000000110000006672785265706F727454726565466F726D010000000048020000120000006672784F626A656374496E73706563746F72FFFFFFFF;'+
'[Dock.RightDockSite];'+
'Data=000004000000000000000000000000000000000000000000000100000000000000000F0000006672784461746154726565466F726DFFFFFFFF';

var
  Ini:TCustomIniFile;
  Nm:String;

  procedure RestoreToolbars(t:Array of TfrxToolBar);
  var
    i:Integer;
  begin
    for i:= Low(t) to High(t) do
      frxRestoreToolbarPosition(Ini, t[i]);
  end;

  procedure RestoreDocks(t:Array of TfrxDockSite);
  var
    i:Integer;
  begin
    for i:= Low(t) to High(t) do
      frxRestoreDock(Ini, t[i]);
  end;

  function Def(Value, DefValue:Extended):Extended;
  begin
    if Value = 0 then
      Result:= DefValue else
      Result:= Value;
  end;

  procedure DoRestore;
  begin
    FInspector.SplitterPos:= Ini.ReadInteger('Form.TfrxObjectInspector',
      'SplitPos', FInspector.Width div 2);
    FInspector.Splitter1Pos:= Ini.ReadInteger('Form.TfrxObjectInspector',
      'Split1Pos', 65);
    Scale:= Ini.ReadFloat(Nm, 'Scale', 0.75);
    ShowGrid:= Ini.ReadBool(Nm, 'ShowGrid', True);
    GridAlign:= Ini.ReadBool(Nm, 'GridAlign', True);
    ShowRulers:= Ini.ReadBool(Nm, 'ShowRulers', True);
    ShowGuides:= Ini.ReadBool(Nm, 'ShowGuides', True);
    FGridSize1:= Def(Ini.ReadFloat(Nm, 'Grid1', 0), 0.1);
    FGridSize2:= Def(Ini.ReadFloat(Nm, 'Grid2', 0), 0.1);
    FGridSize3:= Def(Ini.ReadFloat(Nm, 'Grid3', 0), 4);
    FGridSize4:= Def(Ini.ReadFloat(Nm, 'Grid4', 0), 4);
    Units:= TfrxDesignerUnits(Ini.ReadInteger(Nm, 'Units', 0));
    FOldUnits:= FUnits;
    CodeWindow.Font.Name:= Ini.ReadString(Nm, 'ScriptFontName', 'Courier New');
    CodeWindow.Font.Size:= Ini.ReadInteger(Nm, 'ScriptFontSize', 10);
    MemoFontName:= Ini.ReadString(Nm, 'MemoFontName', 'Arial');
    MemoFontSize:= Ini.ReadInteger(Nm, 'MemoFontSize', 10);
    UseObjectFont:= Ini.ReadBool(Nm, 'UseObjectFont', True);
    WorkspaceColor:= Ini.ReadInteger(Nm, 'WorkspaceColor', clWindow);
    ToolsColor:= Ini.ReadInteger(Nm, 'ToolsColor', clWindow);
    FWorkspace.GridLCD:= Ini.ReadBool(Nm, 'GridLCD', False);
    FEditAfterInsert:= Ini.ReadBool(Nm, 'EditAfterInsert', False);
    FRecentFiles.CommaText:= Ini.ReadString(Nm, 'RecentFiles', '');
    FWorkspace.FreeBandsPlacement:= Ini.ReadBool(Nm, 'FreeBands', False);
    FWorkspace.GapBetweenBands:= Ini.ReadInteger(Nm, 'BandsGap', 4);
    FWorkspace.ShowBandCaptions:= Ini.ReadBool(Nm, 'ShowBandCaptions', True);
    FDropFields:= Ini.ReadBool(Nm, 'DropFields', True);
    FShowStartup:= Ini.ReadBool(Nm, 'ShowStartup', True);

    if not RestoreDefault then
    begin
      Ini.WriteBool(Nm, 'Visible', False);
      frxRestoreFormPosition(Ini, Self);
      frxRestoreFormPosition(Ini, FInspector);
      if not IsPreviewDesigner then
      begin
        frxRestoreFormPosition(Ini, FDataTree);
        frxRestoreFormPosition(Ini, FReportTree);
      end;
      RestoreToolbars([StandardTB, TextTB, FrameTB, AlignTB, ExtraToolsTB]);
    end;
    if not IsPreviewDesigner then
      RestoreDocks([LeftDockSite1, LeftDockSite2, RightDockSite]);
    DockTop.AdjustBounds;
    DockRight.AdjustBounds;
    DockBottom.AdjustBounds;

    with FCodeWindow do
    begin
{$I frxDesgn.inc}
    end;
  end;

  procedure ReadDefIni;
  var
    MemIni:TMemIniFile;
    sl:TStringList;
  begin
    Ini.Free;
    MemIni:= TMemIniFile.Create('');

    sl:= TStringList.Create;
    frxSetCommaText(DefIni, sl);
    MemIni.SetStrings(sl);
    sl.Free;
    Ini:= MemIni;
  end;

begin
  Ini:= Report.GetIniFile;
  Nm:= 'Form.TfrxDesignerForm';
  if RestoreDefault or (Ini.ReadFloat(Nm, 'Scale', 0) = 0) then
    ReadDefIni;

  try
    try
      DoRestore;
    except
      ReadDefIni;
      DoRestore;
    end
  finally
    Ini.Free;
  end;
end;

initialization
  frxDesignerClass:= TfrxDesignerForm;

end.
