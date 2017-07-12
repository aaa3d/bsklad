{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDsgner;

interface

{$I ppIfDef.pas}

uses

{$IFDEF Delphi3}
  ToolWin,
{$ENDIF}

  Windows, ComCtrls, SysUtils,  Messages, Graphics,
  Dialogs,  Printers, Clipbrd,  Mask, Classes, Controls, Forms,
  StdCtrls, ExtCtrls, Buttons, Menus, IniFiles, Tabs,
  ppDsIntf, ppWizard, ppClass,  ppReport, ppDB, ppDsgnCt, ppTypes, ppUtils,
  ppBands, ppCtrls, ppSubRpt, ppRuler, ppViewr, ppRegion, ppForms, ppPrintr,
  ppTmplat, ppTB97, ppTB97x, ppIDE, ppToolWn, ppComm;

var
  {clipboard format for report}
  CF_PPDATA : Word;


type

  TppDesignModuleActionType = (ppdmBeforePreview, ppdmAfterPreview, ppdmClose, ppdmCloseQuery,
                               ppdmSaveState, ppdmLoadState);

  { TppDesignerWindow }

  TppDesignerWindow = class(TppComponentDesigner)
    mnuMain: TMainMenu;
    mniFile: TMenuItem;
    mniFilePrint: TMenuItem;
    mniFileClose: TMenuItem;
    mniEdit: TMenuItem;
    mniEditLine1: TMenuItem;
    mniEditCut: TMenuItem;
    mniEditCopy: TMenuItem;
    mniView: TMenuItem;
    mniViewRulers: TMenuItem;
    mniHelp: TMenuItem;
    mniHelpContents: TMenuItem;
    mniMHelpLine1: TMenuItem;
    mniHelpAbout: TMenuItem;
    mniEditPaste: TMenuItem;
    mniEditDelete: TMenuItem;
    mniEditSelectAll: TMenuItem;
    mniEditLine2: TMenuItem;
    mniEditBringToFront: TMenuItem;
    mniEditSendToBack: TMenuItem;
    mniReport: TMenuItem;
    mniReportTitle: TMenuItem;
    mniReportSummary: TMenuItem;
    mniReportGroups: TMenuItem;
    mniReportLine2: TMenuItem;
    mniReportPortrait: TMenuItem;
    mniReportLandscape: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    mniFileSaveForm: TMenuItem;
    mniFileLine4: TMenuItem;
    mniFileOpen: TMenuItem;
    mniFileSave: TMenuItem;
    mniFileLine1: TMenuItem;
    mniFileNewReport: TMenuItem;
    mniFilePageSetup: TMenuItem;
    mniReportLine4: TMenuItem;
    mniReportUnits: TMenuItem;
    mniReportUnitsInches: TMenuItem;
    mniReportUnitsMillimeters: TMenuItem;
    mniReportUnitsMMThousandths: TMenuItem;
    mniReportLine3: TMenuItem;
    mniFilePrintToFileSetup: TMenuItem;
    mniFileLine5: TMenuItem;
    mniFileSaveAs: TMenuItem;
    mniFileLine2: TMenuItem;
    mniViewObjectInspector: TMenuItem;
    mniViewLine3: TMenuItem;
    mniViewShowData: TMenuItem;
    mniViewLine1: TMenuItem;
    mniViewGridOptions: TMenuItem;
    mniReportHeader: TMenuItem;
    mniReportLine1: TMenuItem;
    mniReportFooter: TMenuItem;
    mniReportUnitsScreenPixels: TMenuItem;
    mniReportUnitsPrinterPixels: TMenuItem;
    mniReportData: TMenuItem;
    N1: TMenuItem;
    mniEditUndo: TMenuItem;
    mniEditRedo: TMenuItem;
    pnlDesign: TPanel;
    pnlHorizontalRuler: TPanel;
    pnlVerticalRuler: TPanel;
    sbxWorkspace: TScrollBox;
    pbxBackground: TPaintBox;
    pnlPreviewBar: TPanel;
    tbsReport: TTabSet;
    pgcDesigner: TPageControl;
    stbStatusBar: TStatusBar;
    tshDesign: TTabSheet;
    tshPreview: TTabSheet;
    mniFileNew: TMenuItem;
    mniReportLine5: TMenuItem;
    mniReportPageStyle: TMenuItem;
    mniFileLine3: TMenuItem;
    mniFileLoadFromFile: TMenuItem;
    mniFileSaveToFile: TMenuItem;
    pnlStandardButtons: TPanel;
    mskPreviewPercentage: TMaskEdit;
    mskPreviewPage: TMaskEdit;
    spbPreviewCancel: TButton;
    mniFileLineSubReport: TMenuItem;
    mniFileLoadSubreport: TMenuItem;
    mniFileSaveSubreport: TMenuItem;
    mniFileLoadSubreportFromFile: TMenuItem;
    mniFileSaveSubReportToFile: TMenuItem;
    mniReportPassSetting: TMenuItem;
    mniPassSettingOnePass: TMenuItem;
    mniPassSettingTwoPass: TMenuItem;
    mniReportCachePages: TMenuItem;
    mniReportLine6: TMenuItem;
    mniFileLineLoadSubreportFromFile: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WorkspaceMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure WorkspaceResize(Sender: TObject);
    procedure WorkspaceMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure WorkspaceMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure mniViewClick(Sender: TObject);
    procedure pbxBackgroundDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure EditCutClick(Sender: TObject);
    procedure EditCopyClick(Sender: TObject);
    procedure EditPasteClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure EditUndoClick(Sender: TObject);
    procedure EditDeleteClick(Sender: TObject);
    procedure EditSelectAllClick(Sender: TObject);
    procedure EditBringToFrontClick(Sender: TObject);
    procedure EditSendToBackClick(Sender: TObject);
    procedure mniReportTitleClick(Sender: TObject);
    procedure mniReportClick(Sender: TObject);
    procedure mniReportSummaryClick(Sender: TObject);
    procedure mniReportGroupsClick(Sender: TObject);
    procedure FileCloseClick(Sender: TObject);
    procedure mniViewRulersClick(Sender: TObject);
    procedure mniHelpAboutClick(Sender: TObject);
    procedure mniReportPortraitClick(Sender: TObject);
    procedure mniReportLandscapeClick(Sender: TObject);
    procedure mniHelpTopicsClick(Sender: TObject);
    procedure ViewerStatusChangeEvent(Sender: TObject);
    procedure FilePrintClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewAutoSearchClick(Sender: TObject);
    procedure spbPreviewFirstClick(Sender: TObject);
    procedure spbPreviewPriorClick(Sender: TObject);
    procedure spbPreviewNextClick(Sender: TObject);
    procedure spbPreviewLastClick(Sender: TObject);
    procedure mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
    procedure ViewerPageChangeEvent(Sender: TObject);
    procedure FileSaveFormClick(Sender: TObject);
    procedure spbSelectReportClick(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100Click(Sender: TObject);
    procedure FileOpenClick(Sender: TObject);
    procedure FileSaveClick(Sender: TObject);
    procedure FileNewReportClick(Sender: TObject);
    procedure FilePageSetupClick(Sender: TObject);
    procedure mniReportUnitsClick(Sender: TObject);
    procedure mniReportUnitsInchesClick(Sender: TObject);
    procedure mniReportUnitsMillimetersClick(Sender: TObject);
    procedure mniReportUnitsPixelsClick(Sender: TObject);
    procedure FilePrintToFileSetupClick(Sender: TObject);
    procedure FileSaveAsClick(Sender: TObject);
    procedure mniViewObjectInspectorClick(Sender: TObject);
    procedure mniViewShowDataClick(Sender: TObject);
    procedure mniViewGridOptionsClick(Sender: TObject);
    procedure tbsReportChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
    procedure mniReportHeaderClick(Sender: TObject);
    procedure mniReportFooterClick(Sender: TObject);
    procedure mniReportPageStyleClick(Sender: TObject);
    procedure mniReportUnitsScreenPixelsClick(Sender: TObject);
    procedure mniReportUnitsMMThousandthsClick(Sender: TObject);
    procedure mniReportUnitsPrinterPixelsClick(Sender: TObject);
    procedure ViewerPrintStateChangeEvent(Sender: TObject);
    procedure spbPreviewCancelClick(Sender: TObject);
    procedure mniReportDataClick(Sender: TObject);
    procedure mniFileClick(Sender: TObject);
    procedure pbxBackgroundPaint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FileNewClick(Sender: TObject);
    procedure mniFileLoadFromFileClick(Sender: TObject);
    procedure mniFileSaveToFileClick(Sender: TObject);
    procedure stbStatusBarResize(Sender: TObject);
    procedure pgcDesignerChange(Sender: TObject);
    procedure pgcDesignerChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FileLoadSubreportClick(Sender: TObject);
    procedure FileSaveSubreportClick(Sender: TObject);
    procedure mniFileLoadSubreportFromFileClick(Sender: TObject);
    procedure mniFileSaveSubReportToFileClick(Sender: TObject);
    procedure mniPassSettingClick(Sender: TObject);
    procedure mniReportCachePagesClick(Sender: TObject);
 private
    FBeginDragPt     : TPoint;
    FClipMemStream   : TMemoryStream;
    FComponentList   : TppDesignerSelectionList;

    FDelMemStream    : TMemoryStream;
    FDesignerState   : TppDesignerStates;
    FDesignTime      : Boolean;
    FFreeOnClose     : Boolean;
    FFieldAliases    : TStrings;
    FKeyCatcher      : TEdit;  {TEdit used to capture arrow keys,... }
    FLastLeft        : Integer;
    FLastTop         : Integer;
    FDocHistory      : TppDocHistory;
    FPopupComponent  : TppComponent;
    FReport          : TppReport;
    FSaveText        : String;
    FReportStateFileName: String;
    FReportStateModified: Boolean;
    FReportStateSaved: Boolean;
    FUndoText        : String;
    FWorkspaceRuler  : TppRuler;
    FViewer          : TppViewer;

    FSelectReportBtn: TppToolbarButton;
    FPreviewPrintBtn: TppToolbarButton;
    FPreviewWholeBtn: TppToolbarButton;
    FPreviewWidthBtn: TppToolbarButton;
    FPreview100Btn:   TppToolbarButton;
    FPreviewFirstBtn: TppToolbarButton;
    FPreviewPriorBtn: TppToolbarButton;
    FPreviewNextBtn:  TppToolbarButton;
    FPreviewLastBtn:  TppToolbarButton;
    FPreviewAutoSearchBtn: TppToolbarButton;

    {3.0 }
    FCurrentReport   : TppCustomReport;
    FUntitled        : String;

    FDisplayGrid     : Boolean;
    FSnapToGrid      : Boolean;
    FXGridSpace      : Integer;
    FYGridSpace      : Integer;

    FCopyPoint,
    FOffset,
    FPastePoint      : TPoint;
    FPrinterName     : String;

    FRubberBand     : TRect;

    FDragXOffset    : Integer;
    FDragYOffset    : Integer;
    FBottomOfWorkSpace : Integer;

    FBandBounds     : TppBoundsRect;
    FCurrentSH      : TppSizingHandleType;

    FCurrentObject      : TppComponent;
    FCurrentBand        : TppBand;
    FCurrentBoundsRect  : TppBoundsRect;

    FppSelections      : Integer;
    FppSelection       : TList;
    FppSelectionBounds : TppBoundsRect;
    FSizingHandles     : TppSizingHandles;

    FDefaultCaption    : String;
    FDesignFont        : TFont;
    FDesignJustifyText : TAlignment;

    FWorkSpace         : TppWorkspace;

    FClipboard         : TClipboard;
    FToolbarManager    : TppToolbarManager;


    {events for TppDesigner}
    FOnAssignField       : TNotifyEvent;
    FOnCreateComponent   : TppComponentEvent;
    FOnCreateReport      : TppCreateReportEvent;
    FOnCustomOpenDoc     : TNotifyEvent;
    FOnCustomSaveDoc     : TNotifyEvent;
    FOnDestroyComponent  : TppComponentEvent;
    FOnFormDestroy       : TNotifyEvent;
    FOnGetAliasForField  : TppGetAliasForFieldEvent;
    FOnGetDataNames      : TppGetDataNamesEvent;
    FOnGetDisplayFormats : TppGetDisplayFormatsEvent;
    FOnGetFieldForAlias  : TppGetFieldForAliasEvent;
    FOnGetFields         : TppGetFieldsEvent;
    FOnReportDestroy     : TNotifyEvent;
    FOnReportSelected    : TNotifyEvent;
    FOnTabChange         : TppTabChangeEvent;
    FOnValidateComponent : TppValidateComponentEvent;
    FOnRapInterfaceChange: TNotifyEvent;

    {strings for language support}
    FMsgReady: String;
    FMsgObject: String;
    FMsgObjects: String;
    FMsgLeft: String;
    FMsgTop: String;
    FMsgWidth: String;
    FMsgHeight: String;
    FMsgUndo: String;
    FMsgUndelete: String;
    FWindowHook: TWindowHook;

    FAlignBar: TppAlignToolbar;
    FEditBar: TppEditToolbar;
    FFormatBar: TppFormatToolbar;
    FDrawBar: TppDrawToolbar;
    FSizeBar: TppSizeToolbar;
    FNudgeBar: TppNudgeToolbar;
    FStandardBar: TppStandardToolbar;
    FPropEditBox: TEdit;
    FPropComboBox: TComboBox;
    FPropComboBox2: TComboBox;

    FReportTree: TppReportTreeWindow;
    FDataTree: TppDataTreeWindow;

    FDesignModules: TStringList;
    FLastActivePage: TTabSheet;
    FPipelineList: TppDataPipelineList;
    FDisableUpdates: Integer;
    FAllowDataSettingsChange: Boolean;
    FAllowSaveToFile: Boolean;
    FDataSettings: TPersistent;

    FRAPInterface: TppRAPInterfaceOptions;
    FRAPOptions: TppRAPOptions;

    procedure SetSelectionToReport;
    procedure CreateDesignModules;
    procedure FreeDesignModules;
    function  GetDesignModuleForPage(aPageIndex: Integer): TppDesignModule;
    procedure SetPageActive(aPage: TTabSheet; aActive: Boolean; var aAllowChange: Boolean);
    procedure SetDesignPageActive(aActive: Boolean; var aAllowChange: Boolean);
    procedure SetPreviewPageActive(aActive: Boolean; var aAllowChange: Boolean);
    procedure WorkspaceDragDropEvent(Sender, Source: TObject; X, Y: Integer);
    procedure InitializeStatusBar;
    procedure InternalClose;
    function  InternalCloseQuery: Boolean;
    procedure LoadReportFromTemplateFile(aReport: TppCustomReport);
    procedure SaveReportToTemplateFile(aReport: TppCustomReport);
    function NotifyDesignModules(aAction: TppDesignModuleActionType): Boolean;

    procedure CreateToolbars;
    procedure FreeToolbars;
    procedure CreatePreviewButtons;          
    procedure ToolbarAlignEvent(Sender: TObject);
    procedure ToolbarSizeEvent(Sender: TObject);
    procedure ToolbarNudgeEvent(Sender: TObject);

    procedure FilePrintPreviewClick(Sender: TObject);
    procedure TextAlignRightClick(Sender: TObject);
    procedure TextCenterClick(Sender: TObject);
    procedure TextAlignLeftClick(Sender: TObject);
    procedure FontBoldClick(Sender: TObject);
    procedure FontItalicClick(Sender: TObject);
    procedure FontUnderlineClick(Sender: TObject);
    procedure FontNameChangeEvent(Sender: TObject);
    procedure FontSizeChangeEvent(Sender: TObject);

    procedure EditBoxKeyPress(Sender: TObject; var Key: Char);
    procedure EditBoxEnter(Sender: TObject);
    procedure EditBoxExit(Sender: TObject);
    procedure EditBoxChange(Sender: TObject);

    procedure EditComboBoxChange(Sender: TObject);
    procedure EditComboBox2Change(Sender: TObject);

    procedure ColorToSelection(aColor: TColor; aIsClear, aIsForeGround, aIsFont: Boolean);

    procedure FillColorClick(Sender: TObject);
    procedure FillColorPaletteClick(Sender: TObject);
    procedure LineColorClick(Sender: TObject);
    procedure LineColorPaletteClick(Sender: TObject);
    procedure LineThicknessClick(Sender: TObject);
    procedure LineStyleClick(Sender: TObject);

    procedure FontNameClick(Sender: TObject);
    procedure FontSizeClick(Sender: TObject);
    procedure FontColorClick(Sender: TObject);
    procedure FontColorPaletteClick(Sender: TObject);
    procedure FontHighlightClick(Sender: TObject);
    procedure FontHighlightPaletteClick(Sender: TObject);

    function Hooker (var Message: TMessage): Boolean;

    procedure dcCreateNew(X,Y :Integer);
    procedure dcMove(Sender: TObject; X, Y: Integer);
    procedure dcMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dcMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure brResize(X, Y:Integer);
    procedure brEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure brMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure shMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shEndDrag(Sender, Target: TObject; X, Y: Integer);

    procedure bndAdd(aBandClass: TComponentClass);
    procedure bndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
    procedure bndMove(Sender: TObject; X, Y: Integer);
    procedure bndRemove(aBandType: TppBandType);

    procedure DesignJustifyTextChange(Sender: TObject);

    procedure SelectionToMemStream(aMemoryStream: TMemoryStream);
    procedure SelectionFromMemStream(aMemoryStream: TMemoryStream);
    procedure MemStreamToClipboard(aMemoryStream: TMemoryStream);
    procedure MemStreamFromClipboard(aMemoryStream: TMemoryStream);

    procedure ComponentReadCallback(Component: TComponent);
    procedure ReaderOnSetName(Reader: TReader; Component: TComponent; var Name: string);
    procedure ReaderOnFindMethod(Reader: TReader; const MethodName: string;
                                var Address: Pointer; var Error: Boolean); virtual;

    procedure HideToolWindows;
    procedure RestoreToolWindows;
    
    procedure SetLanguageOfRulers;
    procedure GetPrinterEvent(Sender: TObject; var aPrinter: TppPrinter);

    procedure SetReport(aReport: TppReport);

    {3.0}
    procedure SetCurrentReport(aCustomReport: TppCustomReport);
    procedure AddSubReport(aCustomReport: TppCustomReport);
    procedure RemoveSubReport(aCustomReport: TppCustomReport);
    procedure SelectReport(aCustomReport: TppCustomReport);
    function  SaveQuery(aReport: TppCustomReport): Boolean;
    procedure SetDesignViewer(aReport: TppReport);

    function  GetComponentClasses: TStrings;
    procedure SetComponentClasses(aComponentClasses: TStrings);

    {2.0}
    procedure DocHistoryItemClick(Sender: TObject);
    procedure SetFieldAliases(aFieldAliases: TStrings);
    procedure SetLanguage;
    procedure SetSnapToGrid(Value: Boolean);
    procedure SetDisplayGrid(Value: Boolean);
    procedure SetXGridSpace(Value: Integer);
    procedure SetYGridSpace(Value: Integer);

    procedure InternalSelectionChanged;
    procedure ReportComponentAdded(aComponent: TComponent);
    procedure ReportComponentRemoved(aComponent: TComponent);
    procedure ReportComponentUpdated(aComponent: TComponent);

    procedure TreeComponentSelectedEvent(Sender: TObject);
    procedure TreeReportSelectedEvent(Sender: TObject);
    procedure SetRAPInterface(aInterfaceOptions: TppRAPInterfaceOptions);
    procedure SetRAPOptions(aRAPOptions: TppRAPOptions);

    procedure GetFieldsForPipeline(aDataPipeline: TppDataPipeline; aFields: TStrings);
    procedure WizardGetDataNamesEvent(Sender: TObject; aDataNameList: TStrings);
    procedure WizardGetFieldsEvent(Sender: TObject; const aDataName: String; aFieldList: TStrings);
    procedure WizardCreateReportEvent(Sender: TObject; const aDataName: String; var aReport: TObject);
    function  GetCurrentReport: TppCustomReport;

    procedure RestoreReportState;
    procedure SaveReportState;
    
  protected

    {inherited from TppComponentDesigner}
    procedure DesignModuleClassListChanged(Sender: TObject); override;
    procedure SetComponent(aComponent: TComponent); override;
    function  GetCurrentComponent: TComponent; override;
    procedure SetCurrentComponent(aComponent: TComponent); override;

    function GetStatusBar: TStatusBar; override;


    {standard windows messages}
    procedure WMActivate(var Message: TMessage); message WM_ACTIVATE;
    procedure WMClose(var Message: TMessage); message WM_CLOSE;
    procedure WMShowWindow(var Message: TMessage); message WM_SHOWWINDOW;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;

    {ReportBuilder custom messages}
    procedure PMComponentNameChange(var Message: TMessage);       message PM_COMPONENTNAMECHANGE;
    procedure PMComponentDestroy(var Message: TMessage);          message PM_COMPONENTDESTROY;
    procedure PMBandHeightChange(var Message: TMessage);          message PM_BANDHEIGHTCHANGE;
    procedure PMReportDestroy(var Message: TMessage);             message PM_REPORTDESTROY;
    procedure PMCalcWorkspaceWidth(var Message: TMessage);        message PM_CALCWORKSPACEWIDTH;
    procedure PMUnitsChange(var Message: TMessage);               message PM_UNITSCHANGE;
    procedure PMGroupMenuClick(var Message: TMessage);            message PM_GROUPMENUCLICK;
    procedure PMComponentChange(var Message: TMessage);           message PM_COMPONENTCHANGE;
    procedure PMComponentDataPipelineChange(var Message: TMessage); message PM_COMPONENTDATAPIPELINECHANGE;
    procedure PMSetLanguage(var Message: TMessage);               message PM_SETLANGUAGE;
    procedure PMSetReport(var Message: TMessage);                 message PM_SETREPORT;
    procedure PMGetDisplayFormats(var Message: TMessage);         message PM_GETDISPLAYFORMATS;
    procedure PMInstantiateComponentDC(var Message: TMessage);    message PM_INSTANTIATECOMPONENTDC;
    procedure PMInstantiateBandDC(var Message: TMessage);         message PM_INSTANTIATEBANDDC;
    procedure PMBandAdded(var Message: TMessage);                 message PM_BANDADDED;
    procedure PMBandRemoved(var Message: TMessage);               message PM_BANDREMOVED;
    procedure PMBandDestroy(var Message: TMessage);               message PM_BANDDESTROY;
    procedure PMReportPrinting(var Message: TMessage);            message PM_REPORTPRINTING;
    procedure PMBoundsLockChange(var Message: TMessage);          message PM_BOUNDSLOCKCHANGE;

    {3.0}
    procedure PMAddReport(var Message: TMessage);              message PM_ADDREPORT;
    procedure PMRemoveReport(var Message: TMessage);           message PM_REMOVEREPORT;
    procedure PMCaptionChange(var Message: TMessage);          message PM_CAPTIONCHANGE;
    procedure PMReportLoadStart(var Message: TMessage);        message PM_REPORTLOADSTART;
    procedure PMReportLoadEnd(var Message: TMessage);          message PM_REPORTLOADEND;
    procedure PMReportUpdateBegin(var Message: TMessage);      message PM_REPORTUPDATEBEGIN;
    procedure PMReportUpdateEnd(var Message: TMessage);        message PM_REPORTUPDATEEND;
    procedure PMComponentAdded(var Message: TMessage);         message PM_COMPONENTADDED;
    procedure PMComponentRemoved(var Message: TMessage);       message PM_COMPONENTREMOVED;
    procedure PMComponentUpdated(var Message: TMessage);       message PM_COMPONENTUPDATED;

  public

    constructor Create(aOwner: TComponent); override;

    function CheckComponentDelete: Boolean;
    function CheckComponentAdd: Boolean;
    function CheckReportDelete: Boolean;

    procedure ChangeFormStyle(aFormStyle: TFormStyle);


    procedure BeginUpdate;
    procedure EndUpdate;
    procedure ComponentModified; override;
    procedure CallViewRulersClick(Sender: TObject);
    procedure RemoveUndeleteState;
    procedure CalcWorkspaceWidth;
    procedure SetUnits(aUnits: TppUnitType);
    procedure SyncUnits(Sender: TObject);
    procedure ClearWorkspaceState;
    procedure ArrangeWorkspace;
    procedure WorkspaceDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure WorkspacePaint(Sender: TObject);
    procedure WorkspaceBoundingBegin(X, Y: Integer; aAdditive: Boolean);
    procedure WorkspaceBoundingEnd;

    function  GetBandForDesignControl(aControl:TControl): TppBand;
    function  GetBandForWorkspaceY(WorkspaceY: Integer): TppBand;

    function GetRegionForWorkspacePt(aBand: TppBand; aWorkspacePt: TPoint): TppCustomRegion;
    function GetRegionForDesignControl(aBand: TppBand; aControl:TControl): TppCustomRegion;

    {called by TppDesignWindow}
    procedure SelectionChanged(aSelection: TppDesignerSelectionList); override;
    function  EqualsSelection(aComponentList: TppDesignerSelectionList): Boolean;


    procedure AddSelection(aComponent: TppComponent);
    procedure ClearSelection(aUpdate: Boolean);
    procedure DeleteSelection;
    procedure UnDeleteSelection;
    procedure RemoveSelection(aComponent: TppComponent);
    procedure ShowSelection(Value: Boolean);
    function  InSelection(aComponent: TppComponent): Boolean;
    procedure AlignSelection(aAction: TppAlignType);
    procedure SpaceSelection(aAction: TppAlignType);
    procedure SizeSelection(aAction: TppSizeType);
    procedure NudgeSelection(aAction: TppNudgeType);
    procedure RectToSelection(aRect: TRect);
    procedure ClipBoardToSelection;
    procedure SelectionToClipBoard;
    procedure AddFontStyleToSelection(aFontStyle: TFontStyle);
    procedure RemoveFontStyleFromSelection(aFontStyle: TFontStyle);

    procedure SetObjectInspectorToSelection;
    procedure SetToolbarToSelection;
    procedure SetStatusbarToSelection;
    procedure SetTreeViewToSelection;

    procedure ShowBoundsRects(Value: Boolean);
    procedure AddSelectionBounds(aSelectionObject: TppSelectionObject);
    procedure CalcSelectionBounds;

    procedure ClearRulerGuides;
    procedure SetRulerDualGuides(Value: Boolean);
    procedure SetRulerGuidePositions(aLeft, aTop, aWidth, aHeight: Integer);

    procedure PopupMenuClick(Sender: TObject);



    procedure DoOnAssignField(Sender: TObject);
    procedure DoCreateComponent(Sender: TObject; aComponent: TComponent);
    procedure DoDestroyComponent(Sender: TObject; aComponent: TComponent);
    procedure DoOnGetAliasForField(Sender: TObject; aDataPipeline: TObject;
                               const aDataField: String; var aFieldAlias: String);
    procedure DoOnGetFieldForAlias(Sender: TObject; const FieldAlias: String;
                               var aDataPipeline: TObject; var aDataField: String);
    procedure DoValidateComponent(Sender: TObject; aComponent: TComponent; var Valid: Boolean);

    property AllowDataSettingsChange: Boolean read FAllowDataSettingsChange write FAllowDataSettingsChange default False;
    property AllowSaveToFile: Boolean read FAllowSaveToFile write FAllowSaveToFile default True;
    property ComponentClasses: TStrings read GetComponentClasses write SetComponentClasses;
    property Report: TppReport read FReport write SetReport;
    property VerticalRuler: TPanel read pnlVerticalRuler;
    property Workspace: TppWorkspace read FWorkSpace;
    property SnapToGrid: Boolean read FSnapToGrid write SetSnapToGrid;
    property DataSettings: TPersistent read FDataSettings write FDataSettings;

    procedure NewReport;
    procedure NewReportFromWiz(aReportWizardClass: TppReportWizardClass);
    procedure LoadTemplate(aReport: TppCustomReport);
    procedure LoadStateInfo;
    procedure SaveStateInfo;
    procedure SaveTemplate(aReport: TppCustomReport);
    function  SaveReport(aReport: TppCustomReport): Boolean;
    function  SaveReportAs(aReport: TppCustomReport): Boolean;

    procedure SetDefaultCaption(aCaption: String);
    procedure UpdateTabCaption(aSubReport: TppSubReport);
    procedure UpdateDocHistory(aTemplate: TppTemplate);
    procedure SetTabsVisible(aValue: Boolean);
    procedure SetWindowCaption;

    property DesignerState: TppDesignerStates read FDesignerState write FDesignerState;
    property CurrentReport: TppCustomReport read GetCurrentReport;
    property DefaultCaption: String read FDefaultCaption write SetDefaultCaption;
    property FieldAliases: TStrings read FFieldAliases write SetFieldAliases;
    property MainMenu: TMainMenu read mnuMain;
    property ReportTabs: TTabSet read tbsReport;
    property PopupComponent: TppComponent read FPopupComponent;

    property Notebook: TPageControl read pgcDesigner;
    property RAPInterface: TppRAPInterfaceOptions read FRAPInterface write SetRAPInterface
                                               default cAllRAPInterfaceOptions;
    property RAPOptions: TppRAPOptions read FRAPOptions write SetRAPOptions
                                               default cAllRAPOptions;
    property OnRapInterfaceChange: TNotifyEvent read FOnRapInterfaceChange write FOnRapInterfaceChange;

    property Viewer: TppViewer read FViewer;

    {events for TppDesignWindow}
    property OnAssignField: TNotifyEvent read FOnAssignField write FOnAssignField;
    property OnCreateComponent: TppComponentEvent read FOnCreateComponent write FOnCreateComponent;
    property OnCreateReport: TppCreateReportEvent read FOnCreateReport write FOnCreateReport;
    property OnCustomOpenDoc: TNotifyEvent read FOnCustomOpenDoc write FOnCustomOpenDoc;
    property OnCustomSaveDoc: TNotifyEvent read FOnCustomSaveDoc write FOnCustomSaveDoc;
    property OnDestroyComponent: TppComponentEvent read FOnDestroyComponent write FOnDestroyComponent;
    property OnFormDestroy: TNotifyEvent read FOnFormDestroy write FOnFormDestroy;
    property OnGetAliasForField: TppGetAliasForFieldEvent read FOnGetAliasForField write FOnGetAliasForField;
    property OnGetDataNames: TppGetDataNamesEvent read FOnGetDataNames write FOnGetDataNames;
    property OnGetDisplayFormats: TppGetDisplayFormatsEvent read FOnGetDisplayFormats write FOnGetDisplayFormats;
    property OnGetFieldForAlias: TppGetFieldForAliasEvent read FOnGetFieldForAlias write FOnGetFieldForAlias;
    property OnGetFields: TppGetFieldsEvent read FOnGetFields write FOnGetFields;
    property OnReportDestroy: TNotifyEvent read FOnReportDestroy write FOnReportDestroy;
    property OnReportSelected: TNotifyEvent read FOnReportSelected write FOnReportSelected;
    property OnTabChange: TppTabChangeEvent read FOnTabChange write FOnTabChange;
    property OnValidateComponent: TppValidateComponentEvent read FOnValidateComponent write FOnValidateComponent;

  end; {class, TppDesignerWindow}



var
  ppDesignerWindow: TppDesignerWindow;

implementation

uses



  TypInfo, ppRichEd,
  ppPgSDlg, ppTxtDlg, ppGrpDlg, ppFmtDlg, ppGrdDlg, ppAbout,
  ppMemDlg, ppClcDlg, ppRstDlg, ppShfDlg, ppDemo, ppTmDlg, ppPosDlg,
  ppDatDlg, ppBPsDlg, ppTmEDlg, ppClasUt, ppBarDlg, ppDrlDlg,
  ppTB97Ut, ppVarDlg, ppMMDlg,  ppNewDlg, ppRptWiz, ppLabWiz, ppCOrDlg,
  ppPgNDlg;


{$R *.DFM}


type

  {used by ppDesigner to send key strokes to Delphi}
  TppKeyData = record
    RepeatCount: Word;
    ScanCode: Byte;
    Flags: Byte;
  end;




{******************************************************************************
 *
 ** M E S S A G E   S T U F F
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ WMActivate}

procedure TppDesignerWindow.WMActivate(var Message: TMessage);
begin

  if (Message.wParam = WA_ACTIVE) or (Message.wParam = WA_CLICKACTIVE) then

    begin
      {enable paste option}
      if Assigned(mniEditPaste) then
        if Assigned(FPropEditBox) and (ActiveControl = FPropEditBox) then
          mniEditPaste.Enabled := FClipBoard.HasFormat(CF_TEXT)
        else
          mniEditPaste.Enabled := FClipBoard.HasFormat(CF_PPDATA);

      if Assigned(mniEditUndo) then
       mniEditUndo.Enabled := True;

      if Assigned(FWorkspace) then
        if  (FReport <> nil) and not FWorkspace.Visible then
          FWorkspace.Visible := True
        else if  (FReport = nil) and FWorkspace.Visible then
          FWorkspace.Visible := False;

      {note: D1 was locking up without this}
      if (FKeyCatcher <> nil) and (FKeyCatcher.CanFocus) then
        ActiveControl := FKeyCatcher
      else if (mskPreviewPage <> nil) and mskPreviewPage.CanFocus then
        ActiveControl := mskPreviewPage;

      if (FToolbarManager <> nil) then
        FToolbarManager.EnableToolWindowCaptions(True);


      {if Assigned(FWorkspace) and not FWorkspace.Visible and (FReport <> nil) then
        FWorkspace.Visible := True;}

      if (FCurrentReport <> nil) and (pgcDesigner.ActivePage = tshPreview) then
        FCurrentReport.DSInclude([pppcDesignPreviewing]);


    end

  else if (Message.wParam = WA_INACTIVE) and (FReport <> nil) then

    begin

       ClearRulerGuides;

      if not (dsPrinting in FDesignerState) and (FReport <> nil) and
         (pppcDesignPreviewing in FReport.DesignState) then

        FReport.DSExclude([pppcDesignPreviewing]);

      if (FToolbarManager <> nil) then
        FToolbarManager.EnableToolWindowCaptions(False);


    end;


  inherited;

end;

{------------------------------------------------------------------------------}
{ WMClose}

procedure TppDesignerWindow.WMClose(var Message: TMessage);
begin

  if not InternalCloseQuery then Exit;
 
  inherited;

end;


{------------------------------------------------------------------------------}
{ WMShowWindow}
procedure TppDesignerWindow.WMShowWindow(var Message: TMessage);
begin

  {if destroying without closing first, this will clean things up}
  if (csDestroying in ComponentState) then
    begin
       ClearWorkspaceState;
       SaveStateInfo;
       inherited;
    end;


  inherited;

end;

{------------------------------------------------------------------------------}
{ CMVisibleChanged}

procedure TppDesignerWindow.CMVisibleChanged(var Message: TMessage);
begin

  {note: this fires in cases where ShowWindow does not (like MDIChild) }
  if Visible then
    RestoreToolWindows
  else
    HideToolWindows;
    
  inherited;
end;


{------------------------------------------------------------------------------}
{ PMBandHeightChange}

procedure TppDesignerWindow.PMBandHeightChange(var Message: TMessage);
begin

  if FCurrentReport = nil then Exit;

  if (Message.WParam = ppWCustomMsg) then
    begin

      if (dsUndelete in FDesignerState) then
        Exclude(FDesignerState, dsUndelete);

      ArrangeWorkspace;


      ComponentModified;
    end;


  inherited;

end;

{------------------------------------------------------------------------------}
{ PMBandAdded}

procedure TppDesignerWindow.PMBandAdded(var Message: TMessage);
begin

  if FCurrentReport = nil then Exit;

  if (Message.WParam = ppWCustomMsg) then
    begin

      FCurrentBand := nil;
      ArrangeWorkspace;

      if Self.Visible then
        ShowSelection(True);

      ComponentModified;

      ReportComponentAdded(TComponent(Message.LParam));
    end;


  inherited;

end;


{------------------------------------------------------------------------------}
{ PMBandRemoved}

procedure TppDesignerWindow.PMBandRemoved(var Message: TMessage);
begin

  if (FCurrentReport = nil) then Exit;
  
  if (dsPreviewing in FDesignerState) then Exit;

  if (Message.WParam = ppWCustomMsg) and not (dsDestroying in FDesignerState) then
    begin

      FCurrentBand := nil;

      ClearSelection(True);
 
      if (dsUndelete in FDesignerState) then
        Exclude(FDesignerState, dsUndelete);

      ArrangeWorkspace;

      ComponentModified;

      ReportComponentRemoved(TComponent(Message.LParam));

    end;

  inherited;

end;


{------------------------------------------------------------------------------}
{ PMCalcWorkspaceWidth}

procedure TppDesignerWindow.PMCalcWorkspaceWidth(var Message: TMessage);
begin

  if FCurrentReport = nil then Exit;

  if (Message.WParam = ppWCustomMsg) then
    begin
      CalcWorkspaceWidth;
      ComponentModified;;
    end;

  inherited;

end;


{------------------------------------------------------------------------------}
{ PMComponentChange}

procedure TppDesignerWindow.PMComponentChange(var Message: TMessage);
begin

 {exit if form being created or form not visible}
 if not (csReading in ComponentState) and not (csLoading in ComponentState) and
     (Self.Visible) then

   if  (Message.WParam = ppWCustomMsg) and not (dsPreviewing in FDesignerState) then
      begin

         ComponentModified;

        {used for debugging only now, but may need in future }
        {lppComponent := TppComponent(Message.lParam); }

        {update toolbar and statusbar to reflect any changes}
        CalcSelectionBounds;
        SetToolBarToSelection;
        SetStatusBarToSelection;

      end;

  inherited;

end;

{------------------------------------------------------------------------------}
{ PMComponentDestroy}

procedure TppDesignerWindow.PMComponentDestroy(var Message: TMessage);
var
  lComponent: TppComponent;


begin
  if (Message.WParam = ppWCustomMsg) then
    begin

      lComponent := TppComponent(Message.lParam);

      {remove component from selection, if needed }
      if  not (dsDestroying in FDesignerState) then
        begin
          if InSelection(lComponent) then
            RemoveSelection(lComponent);

           {fire event}
           DoDestroyComponent(Self, lComponent);

        end;


     end;


  inherited;

end;


{------------------------------------------------------------------------------}
{ PPComponentNameChange}

procedure TppDesignerWindow.PMComponentNameChange(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) then
    begin

      if (dsUndelete in FDesignerState) then
        Exclude(FDesignerState, dsUndelete);

      SetWindowCaption;

      SetStatusbarToSelection;

      ReportComponentUpdated(TComponent(Message.LParam));

    end;

  inherited;

end;

{------------------------------------------------------------------------------}
{ PMCaptionChange}

procedure TppDesignerWindow.PMCaptionChange(var Message: TMessage);
var
  lComponent: TComponent;
  lSubReport: TppSubReport;

begin

  if (Message.WParam = ppWCustomMsg) then
    begin

      lComponent := TComponent(Message.LParam);

      if (lComponent is TppSubReport) then
        begin
          lSubReport := TppSubReport(lComponent);
          
          {update tabs}
          UpdateTabCaption(lSubReport);

        end;

    end;

  inherited;

end;

{------------------------------------------------------------------------------}
{ PMComponentDataPipelineChange}

procedure TppDesignerWindow.PMComponentDataPipelineChange(var Message: TMessage);
begin

  {update cxbFields with new DataPipeline}
  if (FCurrentReport <> nil) and (csDesigning in FCurrentReport.ComponentState) and (Self.Visible) then
    SetToolBarToSelection;
end;

{------------------------------------------------------------------------------}
{ PMGetDisplayFormats}

procedure TppDesignerWindow.PMGetDisplayFormats(var Message: TMessage);
var
  lFormats: TStrings;

begin
  if (FCurrentReport = nil) then Exit;

  lFormats := TStrings(Message.LParam);

  {fire OnGetDisplayFormats event}
  if (FPopupComponent <> nil) and Assigned(FOnGetDisplayFormats) then
    FOnGetDisplayFormats(FPopupComponent, lFormats);

end;
  
{------------------------------------------------------------------------------}
{ PMGroupMenuClick}

procedure TppDesignerWindow.PMGroupMenuClick(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) then
    mniReportGroupsClick(Self);

  inherited;

end;

{------------------------------------------------------------------------------}
{ PMInstantiateBandDC }

procedure TppDesignerWindow.PMInstantiateBandDC(var Message: TMessage);
var
  lBand: TppBand;

begin

  {check for valid custom message}
  if (Message.WParam = ppWCustomMsg) then
    lBand := TppBand(Message.lParam)
  else
    lBand := nil;


  if (lBand <> nil) and (lBand.DesignControl = nil)then
    begin


      {create band design control: gray band bar (user drags this to change Workspace height}
      lBand.DesignControl := TppDesignBand.Create(Self);

      lBand.DesignControl.Name         := lBand.Name;
      lBand.DesignControl.Font.Name    := 'MS SANS SERIF';
      lBand.DesignControl.Font.Size    := 8;
      lBand.DesignControl.Caption      := '  ^  ' + lBand.Caption;
      lBand.DesignControl.Tag          := LongInt(lBand);
      lBand.DesignControl.Top          := lBand.spHeight; {must initialize to FHeight, gets reset later}
      lBand.Resize;                      {this will set the width}
      lBand.DesignControl.Visible      := True;

      lBand.DesignControl.OnMouseMove := WorkspaceMouseMove;
      lBand.DesignControl.OnMouseDown := bndMouseDown;
      lBand.DesignControl.OnDragOver  := WorkspaceDragOver;
      lBand.DesignControl.OnPaint     := WorkspacePaint;  {needed to trigger ruler scrolling}

      {add control to workspace }
      FWorkspace.InsertControl(lBand.DesignControl);

      {create vertical ruler for band }
      lBand.Ruler := TppRuler.Create(Self);

      lBand.Ruler.Orientation := roVertical;
      lBand.Ruler.Top         := 0;
      lBand.Ruler.Left        := 0;
      lBand.Ruler.Width       := pnlHorizontalRuler.Height - 1;
      lBand.Ruler.Height      := lBand.spHeight;

       {note: order of these statements is important}
      lBand.Ruler.OnGetPrinter := GetPrinterEvent;
      lBand.Ruler.Units       := FCurrentReport.Units;

      lBand.Ruler.OnSetUnits   := SyncUnits;
      lBand.Ruler.OnHide       := CallViewRulersClick;

      {add band's ruler to vertical ruler panel }
      if (lBand.Ruler <> nil) then
        pnlVerticalRuler.InsertControl(lBand.Ruler);

    end;

  inherited;

end; {procedure, PMInstantiateBandDC}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.GetPrinterEvent}

procedure TppDesignerWindow.GetPrinterEvent(Sender: TObject; var aPrinter: TppPrinter);
begin
  if (FCurrentReport = nil) then Exit;

  aPrinter := FCurrentReport.Printer;

end; {procedure, GetPrinterEvent}

{------------------------------------------------------------------------------}
{ PMInstantiateComponentDC}

procedure TppDesignerWindow.PMInstantiateComponentDC(var Message: TMessage);
var
  lppComponent: TppComponent;

begin

  {check for valid custom message}
  if (Message.WParam = ppWCustomMsg) then
    lppComponent := TppComponent(Message.lParam)
  else
    lppComponent := nil;

    
  if (lppComponent <> nil) then

    with lppComponent do
      begin

        {create design control for this component }
        DesignControl := TppDesignControl.Create(Self);
        DesignControl.OnDragOver  := WorkspaceDragOver;
        DesignControl.OnDragDrop  := WorkspaceDragDropEvent;
        DesignControl.OnMouseMove := WorkspaceMouseMove;
        DesignControl.OnMouseDown := dcMouseDown;
        DesignControl.OnMouseUp   := dcMouseUp;


        {add control to workspace }
        FWorkspace.InsertControl(DesignControl);

      end;

  inherited;

end;

{------------------------------------------------------------------------------}
{ PMBandDestroy}

procedure TppDesignerWindow.PMBandDestroy(var Message: TMessage);
var
  lBand: TppBand;
begin

  if FCurrentReport = nil then Exit;

  if (Message.WParam = ppWCustomMsg) then
    begin

      lBand := TppBand(Message.lParam);

      if lBand.Report = FCurrentReport then
        begin
          lBand.Ruler.ClearGuides;

          if lBand = FCurrentBand then
            FCurrentBand := nil;
          ClearSelection(True);
        end;

    end;

  inherited;

end;

{------------------------------------------------------------------------------}
{ PMReportPrinting}

procedure TppDesignerWindow.PMReportPrinting(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) then
    begin

      if Message.lParam = 1 then
        Include(FDesignerState, dsPrinting)
      else
        Exclude(FDesignerState, dsPrinting);

    end;

  inherited;

end;

{------------------------------------------------------------------------------}
{ PMReportDestroy}

procedure TppDesignerWindow.PMReportDestroy(var Message: TMessage);
var
  lReport: TppCustomReport;

begin

  if (Message.WParam = ppWCustomMsg) then
    begin

      lReport := TppCustomReport(Message.LParam);

      if lReport is TppReport then
        begin
          {notify TppDesigner }
          if Assigned(FOnReportDestroy) then FOnReportDestroy(Self);
          SetReport(nil);
          {ppViewer.Perform(PM_REPORTDESTROY,ppWCustomMsg,0);}
        end

      else
        RemoveSubReport(lReport);


    end;


  inherited;

end;

{------------------------------------------------------------------------------}
{ PMUnitsChange}

procedure TppDesignerWindow.PMUnitsChange(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) then
    SetUnits(TppUnitType(Message.lParam));

  inherited;

end;


{------------------------------------------------------------------------------}
{ PMSetReport}

procedure TppDesignerWindow.PMSetReport(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) and not (dsDestroying in FDesignerState) then
    begin

      if Message.LParam = 0 then
        SetReport(nil)
      else if FReport <> TppReport(Message.LParam) then
        SetReport(TppReport(Message.LParam));

    end;


  inherited;

end;

{------------------------------------------------------------------------------}
{ PMAddReport}

procedure TppDesignerWindow.PMAddReport(var Message: TMessage);
var
  lReport: TppCustomReport;

begin

  if (Message.WParam = ppWCustomMsg) and not (dsDestroying in FDesignerState) then
    begin
      lReport := TppCustomReport(Message.LParam);

      if (lReport is TppReport) then

        SetReport(TppReport(lReport))

      else if (FReport <> nil) then

        AddSubReport(lReport);

    end;

  inherited;

end;

{------------------------------------------------------------------------------}
{ PMRemoveReport}

procedure TppDesignerWindow.PMRemoveReport(var Message: TMessage);
var
  lReport: TppCustomReport;

begin

  if (Message.WParam = ppWCustomMsg) and not (dsDestroying in FDesignerState) then
    begin

      lReport := TppCustomReport(Message.LParam);

      if (lReport is TppReport) then
        SetReport(nil)
      else
        RemoveSubReport(lReport);

    end;

  inherited;

end;

{------------------------------------------------------------------------------}
{ PMBoundsLockChange }

procedure TppDesignerWindow.PMBoundsLockChange(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) then
    CalcSelectionBounds;

  inherited;

end;

{------------------------------------------------------------------------------}
{ PMSetLanguage }

procedure TppDesignerWindow.PMSetLanguage(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) and not (dsDestroying in FDesignerState) then
    SetLanguage;

  inherited;

end;


{------------------------------------------------------------------------------}
{ TppDesignerWindow.PMReportLoadStart }

procedure TppDesignerWindow.PMReportLoadStart(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) and not (dsUpdating in FDesignerState) then
    SetCurrentReport(nil);

  inherited;

end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.PMReportLoadEnd }

procedure TppDesignerWindow.PMReportLoadEnd(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) and not (dsUpdating in FDesignerState) then
    begin
      SetCurrentReport(TppCustomReport(Message.LParam));
      SelectReport(TppCustomReport(Message.LParam));
    end;

  inherited;

end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.PMReportUpdateBegin }

procedure TppDesignerWindow.PMReportUpdateBegin(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) then
    begin
      SetCurrentReport(nil);
      Include(FDesignerState, dsUpdating);
    end;

  inherited;

end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.PMReportUpdateEnd }

procedure TppDesignerWindow.PMReportUpdateEnd(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) and not (dsDestroying in FDesignerState)  then
    begin
      Exclude(FDesignerState, dsUpdating);
      SetCurrentReport(TppCustomReport(Message.LParam));
      SelectReport(TppCustomReport(Message.LParam));
    end;

  inherited;

end;


{------------------------------------------------------------------------------}
{ TppDesignerWindow.PMComponentAdded }

procedure TppDesignerWindow.PMComponentAdded(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) and not (dsDestroying in FDesignerState)  then
    ReportComponentAdded(TComponent(Message.LParam));

  inherited;

end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.PMComponentRemoved }

procedure TppDesignerWindow.PMComponentRemoved(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) and not (dsDestroying in FDesignerState)  then
    ReportComponentRemoved(TComponent(Message.LParam));


  inherited;

end;


{------------------------------------------------------------------------------}
{ TppDesignerWindow.PMComponentUpdated }

procedure TppDesignerWindow.PMComponentUpdated(var Message: TMessage);
begin

  if (Message.WParam = ppWCustomMsg) and not (dsDestroying in FDesignerState)  then
    ReportComponentUpdated(TComponent(Message.LParam));


  inherited;

end;



{******************************************************************************
 *
 ** R E P O R T    D E S I G N E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ Create }

constructor TppDesignerWindow.Create(aOwner: TComponent);
var
  liPanel: Integer;

begin

  inherited Create(aOwner);

  FDesignTime := (aOwner is TForm);

  FWindowHook := Hooker;

  Application.HookMainWindow(FWindowHook);


  FReport        := nil;
  FCurrentReport := nil;
  FPrinterName   := '';
  FReportStateFileName := '';
  FReportStateSaved := False;

  {2.0}
  FDefaultCaption := 'ReportBuilder';
  FFieldAliases   := TStringList.Create;
  FComponentList  := nil;

  FClipboard := Clipboard;

  FOnAssignField       := nil;
  FOnCreateComponent   := nil;
  FOnCreateReport      := nil;
  FOnCustomOpenDoc     := nil;
  FOnCustomSaveDoc     := nil;
  FOnDestroyComponent  := nil;
  FOnFormDestroy       := nil;
  FOnGetAliasForField  := nil;
  FOnGetDataNames      := nil;
  FOnGetDisplayFormats := nil;
  FOnGetFieldForAlias  := nil;
  FOnGetFields         := nil;
  FOnReportDestroy     := nil;
  FOnReportSelected    := nil;
  FOnTabChange         := nil;
  FOnRapInterfaceChange := nil;

  FClipMemStream := TMemoryStream.Create;
  FDelMemStream  := TMemoryStream.Create;
  FCopyPoint.X   := 0;
  FCopyPoint.Y   := 0;
  FPastePoint.X  := 0;
  FPastePoint.Y  := 0;

  FLastActivePage := tshDesign;

  pgcDesigner.ActivePage := tshDesign;


  {create report viewer}
  FViewer := TppViewer.Create(Self);
  FViewer.Parent  := tshPreview;


  FViewer.Align   := alClient;
  FViewer.Initialize;
  FViewer.ScreenDevice.Active := False;
  FViewer.DesignViewer        := True;
  FViewer.OnPageChange        :=  ViewerPageChangeEvent;
  FViewer.OnPrintStateChange  :=  ViewerPrintStateChangeEvent;
  FViewer.OnStatusChange      :=  ViewerStatusChangeEvent;

  tbsReport.Visible := False;

  {create workspace panel}
  FWorkSpace   := TppWorkspace.Create(Self);
  sbxWorkspace.InsertControl(FWorkSpace);
  with FWorkSpace do
    begin
      Color       := clWindow;
      BevelOuter  := bvNone;
      Caption     := '';
      Ctl3D       := False;
      Left        := 0;
      Top         := 0;

      DisplayGrid := FDisplayGrid;
      XGridSpace := FXGridSpace;
      YGridSpace := FYGridSpace;
      
      {this procedure fires every time the user scrolls,
       ruler scrolling is handled by this routine}
      OnPaint     := WorkspacePaint;

      Visible     := True;
      OnMouseDown := WorkspaceMouseDown;
      OnMouseMove := WorkspaceMouseMove;
      OnMouseUp   := WorkspaceMouseUp;
      OnDragOver  := WorkspaceDragOver;
      OnDragDrop  := WorkspaceDragDropEvent;
      OnResize    := WorkspaceResize;

    end;


  {create edit box used to trap keyboard events}
  FKeyCatcher := TEdit.Create(Self);
  FWorkSpace.InsertControl(FKeyCatcher);
  with FKeyCatcher do
    begin
      Top    := 0;
      Left   := 0;
      Width  := 0;
      Height := 0;
      OnKeyDown := FormKeyDown;
    end;


  FppSelections := 0;
  FppSelection  := TList.Create;

  {bounds rect for entire selection}
  FppSelectionBounds := TppBoundsRect.Create(Self);
  FppSelectionBounds.Parent := FWorkspace;

  {bounds rect for dragging bands}
  FBandBounds        := TppBoundsRect.Create(Self);
  with FBandBounds do
    begin
      Parent := FWorkspace;
      OnDragOver := WorkspaceDragOver;
      OnEndDrag  := brEndDrag;
    end;

  {sizing handles for single selection}
  FSizingHandles   := TppSizingHandles.Create(Self);
  with FSizingHandles do
    begin
     Parent      := FWorkspace;
     OnDragOver  := WorkspaceDragOver;
     OnMouseDown := shMouseDown;
     OnEndDrag   := shEndDrag;

    end;


  {create workspace ruler}
  FWorkspaceRuler := TppRuler.Create(Self);
  FWorkspaceRuler.Parent := pnlHorizontalRuler;

  FWorkspaceRuler.Orientation  := roHorizontal;
  FLastLeft                    := 0;
  FLastTop                     := 0;
  FWorkspaceRuler.Top          := 0;
  FWorkspaceRuler.Left         := pnlVerticalRuler.Width;
  FWorkspaceRuler.Height       := pnlHorizontalRuler.Height;
  FWorkspaceRuler.Width        := Width;
  FWorkspaceRuler.OnSetUnits   := SyncUnits;
  FWorkspaceRuler.OnHide       := mniViewRulersClick;


  FCurrentObject      := nil;
  FCurrentBand        := nil;
  FCurrentBoundsRect  := nil;

  FDragXOffset   := 0;
  FDragYOffset   := 0;
  FBottomOfWorkspace := 0;

  {intialize design font}
  FDesignFont := TFont.Create;
  FDesignFont.Name     := 'Arial';
  FDesignFont.Size     := 10;
  FDesignFont.Style    := [];
  FDesignFont.Color    := clBlack;


  {intialize design text justification setting}
  FDesignJustifyText := taLeftJustify;

  pgcDesigner.TabStop := False;
  tshDesign.TabStop   := False;
  tshPreview.TabStop  := False;


 {create toolbar97 controls
         Note: for D1 this must happen in VisibleChanging support MDI apps}

  CreateToolbars;

  CreatePreviewButtons;


  {adjust status bar panels for large fonts}
  for liPanel := 1 to 4 do
    stbStatusBar.Panels[liPanel].Width := Canvas.TextWidth(stbStatusBar.Panels[liPanel].Text + 'XXXXXXXX');



  {create the doc history object}
  FDocHistory := TppDocHistory.Create(Self, mnuMain.Items[0], 'RBuilder.ini' );
  FDocHistory.OnMenuItemClick := DocHistoryItemClick;

  {remove irrelevant menu options}
  if not FDesignTime then
    begin
      mniFile.Remove(mniFileLine2);
      mniFile.Remove(mniFileSaveForm);
      mniView.Remove(mniViewObjectInspector);
      mniView.Remove(mniViewLine3);
      mniFileSave.ShortCut := ShortCut(Word('S'), [ssCtrl]);
    end;

{$IFDEF Delphi4}
  {this menu option does not work in D4}
  if FDesignTime then
    begin
      mniFile.Remove(mniFileLine2);
      mniFile.Remove(mniFileSaveForm);
    end;


{$ENDIF}

  FAllowDataSettingsChange := False;
  FAllowSaveToFile := True;
  FDataSettings := nil;

  CreateDesignModules;

  LoadStateInfo;

  InitializeStatusBar;

  FRAPInterface := cAllRAPInterfaceOptions;
  FRAPOptions   := cAllRAPOptions;

end; {constructor}


{------------------------------------------------------------------------------}
{ Destroy }

procedure TppDesignerWindow.FormDestroy(Sender: TObject);
begin


  Application.UnHookMainWindow(FWindowHook);

  {used to notify TppDesigner}
  if Assigned(FOnFormDestroy) then FOnFormDestroy(Self);

  Include(FDesignerState, dsDestroying);


  FWorkspaceRuler.Free;


  {remove Report's reference to this form}
  if (FReport <> nil) then
    SetReport(nil);

  FreeDesignModules;

  FViewer.Free;

  FDesignFont.Free;
  FFieldAliases.Free;
  FDocHistory.Free;

  if (FComponentList <> nil) then
    FComponentList.Free;

  FppSelection.Free;
  FppSelectionBounds.Free;
  FBandBounds.Free;
  FSizingHandles.Free;

  FClipMemStream.Free;
  FDelMemStream.Free;


  if not (FormStyle = fsMDIChild) then
    begin
      FKeyCatcher.Free;
      FWorkSpace.Free;
    end;

  FToolbarManager.Free;
  FToolbarManager := nil;

end; {procedure, FormDestroy}

{------------------------------------------------------------------------------}
{ CreateDesignModules }

procedure TppDesignerWindow.CreateDesignModules;
var
  lClassList: TList;
  lTabOrder: TStringList;
  lTabSheet : TTabSheet;
  lDesignModule: TppDesignModule;
  liIndex: Integer;

begin

  FDesignModules := TStringList.Create;

  lClassList := TList.Create;
  lTabOrder := TStringList.Create;
  lTabOrder.Sorted := True;

  ppGetDesignModuleClasses(TppDesignerWindow, lClassList);

  for liIndex := 0 to lClassList.Count-1 do
    begin

      lTabSheet := TTabSheet.Create(Self);
      lTabSheet.Parent  := pgcDesigner;
      lTabSheet.PageControl := pgcDesigner;
      lTabSheet.Height := pgcDesigner.Height;
      lTabSheet.Width  := pgcDesigner.Width;

      lDesignModule := TppDesignModuleClass(lClassList[liIndex]).CreateModule(lTabSheet, Self);
      lDesignModule.Component := FReport;

      lTabSheet.Caption   := lDesignModule.Caption;
      lTabSheet.Tag := LongInt(lDesignModule);

      FDesignModules.AddObject(lTabSheet.Caption, lDesignModule);

      lTabOrder.AddObject(IntToStr(lDesignModule.OrderIndex), lTabSheet);

    end;

   {reposition tabs based upon order}
   for liIndex := lTabOrder.Count-1 downto 0  do
     TTabSheet(lTabOrder.Objects[liIndex]).PageIndex := 0;

  lClassList.Free;
  lTabOrder.Free;



end; {procedure, CreateDesignModules}

{------------------------------------------------------------------------------}
{ GetDesignModuleForPage }

function TppDesignerWindow.GetDesignModuleForPage(aPageIndex: Integer): TppDesignModule;
begin
  if pgcDesigner.Pages[aPageIndex].Tag = 0 then
    Result := nil
  else
    Result := TppDesignModule(pgcDesigner.Pages[aPageIndex].Tag);

end; {function, GetDesignModuleForPage}


{------------------------------------------------------------------------------}
{ FreeDesignModules }

procedure TppDesignerWindow.FreeDesignModules;
var
  {iDesignModule: Integer;}
  liPage: Integer;
  lDesignModule: TppDesignModule;

begin

  for liPage := pgcDesigner.PageCount-1 downto 0  do
   begin
     lDesignModule := GetDesignModuleForPage(liPage);

     if (lDesignModule <> nil) then
       begin
         pgcDesigner.Pages[liPage].Free;
         lDesignModule.Free;
       end;



   end;


  FDesignModules.Free;
  FDesignModules := nil;

end; {procedure, FreeDesignModules}


{------------------------------------------------------------------------------}
{ HideToolWindows }

procedure TppDesignerWindow.HideToolWindows;
begin

  if (FToolbarManager <> nil) then
    FToolbarManager.HideFloatingToolWindows;

end;

{------------------------------------------------------------------------------}
{ RestoreToolWindows }
procedure TppDesignerWindow.RestoreToolWindows;
begin

  if (FToolbarManager <> nil) then
    FToolbarManager.ShowFloatingToolWindows;
  
end;


{------------------------------------------------------------------------------}
{ Hooker - capture application window messages}

function TppDesignerWindow.Hooker(var Message: TMessage): Boolean;
begin

  {when alt key pressed, inform application that report designer menu will handle this  }
  if Active and (FormStyle <> fsMDIChild) and
     ((Message.Msg = CM_APPKEYDOWN) or (Message.Msg = CM_APPSYSCOMMAND)) then

    Result := True
  else
    Result := False;


end;


{------------------------------------------------------------------------------}
{ GetBandForWorkspaceY - return a band for a given Workspace Y value}

function TppDesignerWindow.GetBandForWorkspaceY(WorkspaceY: Integer): TppBand;
var
  liBand: Integer;
  liBands: Integer;
  liZeroHeightBand: Integer;
  lBand: TppBand;
  lbBandFound: Boolean;

begin
 Result := nil;

 if (FCurrentReport = nil) then Exit;


 liBand  := 0;
 liBands := FCurrentReport.BandCount;
 lbBandFound:= False;
 lBand := nil;

  while (not lbBandFound) and (liBand < liBands) do
    begin
      lBand := FCurrentReport.Bands[liBand];

      if (lBand.DesignControl <> nil) and
         (WorkspaceY >= (lBand.spTop - lBand.DesignControl.Height)) and
         (WorkspaceY < (lBand.DesignControl.Top)) then
        lbBandFound := True
      else
        Inc(liBand);

    end;


  if lbBandFound then
    begin

      if (lBand.spHeight = 0) then
        begin
          {first, try to find a prior band with height > 0}
          liZeroHeightBand := FCurrentReport.FindBand(lBand);
          liBand := liZeroHeightBand;

          while (Result = nil) and (liBand >= 0) do
            begin
              lBand := FCurrentReport.Bands[liBand];
              if lBand.spHeight > 0 then
                Result := lBand
              else
                Dec(liBand);
            end;

          {next, try to find a next band with height > 0}
          if (Result = nil) then
            begin
              liBand := liZeroHeightBand;
              while (Result = nil) and (liBand < liBands) do
                begin
                  lBand := FCurrentReport.Bands[liBand];
                  if lBand.spHeight > 0 then
                    Result := lBand
                  else
                    Inc(liBand);
                end;

             end;

          {if no bands > 0, return the header}
          if Result = nil then
            lBand := FCurrentReport.Bands[0];

        end;

      Result := lBand;

    end;

end; {function, GetBandForWorkspaceY}


{------------------------------------------------------------------------------}
{ GetBandForDesignControl - determine in which band a given control is currently located}

function TppDesignerWindow.GetBandForDesignControl(aControl: TControl): TppBand;
begin

  Result := GetBandForWorkspaceY(aControl.Top);

  if Result = nil then
    GetBandForWorkspaceY(aControl.Top + aControl.Height);

end; {function, GetBandForDesignControl}



{------------------------------------------------------------------------------}
{ GetRegionForWorkspaceY - return a region for a given Workspace Y value}

function TppDesignerWindow.GetRegionForWorkspacePt(aBand: TppBand; aWorkspacePt: TPoint): TppCustomRegion;
var
  liObject: Integer;
  lRegion: TppCustomRegion;
  lBoundsRect : TRect;

begin
  Result := nil;

  if (FCurrentReport = nil) or (aBand = nil) then Exit;

  liObject := aBand.ObjectCount-1;

  while (liObject >= 0) do
    begin

      if (aBand.Objects[liObject] is TppCustomRegion) then
        begin
          lRegion := TppCustomRegion(aBand.Objects[liObject]);
          lBoundsRect := lRegion.DesignControl.BoundsRect;

          if not ( (aWorkspacePt.X  > lBoundsRect.Right)  or (aWorkspacePt.X  < lBoundsRect.Left) )  and
             not ( (aWorkspacePt.Y  > lBoundsRect.Bottom) or (aWorkspacePt.Y  < lBoundsRect.Top) ) then

            Result := lRegion;

        end; {if, Region}

      if Result = nil then
        Dec(liObject)
      else
        Break;

    end; {while not end of Objects}

end; {procedure,  GetRegionForWorkspacePt }



{------------------------------------------------------------------------------}
{ GetRegionForDesignControl - determine in which region given control is currently located}

function TppDesignerWindow.GetRegionForDesignControl(aBand: TppBand; aControl: TControl): TppCustomRegion;
begin

  Result := GetRegionForWorkspacePt(aBand, Point(aControl.Left, aControl.Top));

end; {function, GetRegionForDesignControl}



{------------------------------------------------------------------------------}
{ ClearWorkspaceState}

procedure TppDesignerWindow.ClearWorkspaceState;
var
  {lPos: TPoint;}
  lSmallPos: TSmallPoint;
  
begin

  {note: for modal designer, do not execute the code below - it causes
         lock ups}
  if (dsModal in FDesignerState) then Exit;

  FCurrentBand := nil;

  {send MouseUp/MouseDown combo to Workspace to clear the selection
   and to clear any 'states' that caused intermittent Acess Violations}
  if FppSelection.Count > 0 then
    begin
    {  lPos.X  := -10;
      lPos.Y  := -10;
      lPos := FWorkspace.ScreenToClient(sbxWorkspace.ClientToScreen(lPos));}

      lSmallPos.X := -10;
      lSmallPos.Y := -10;


      FWorkspace.Perform(WM_LBUTTONDOWN, MK_LBUTTON, Longint(lSmallPos));
      FWorkspace.Perform(WM_LBUTTONUp,   MK_LBUTTON, Longint(lSmallPos));
     { FWorkspace.Invalidate;}
    end;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.ArrangeWorkspace - recomputes workspace tops for a given band
                                     & all bands below}

procedure TppDesignerWindow.ArrangeWorkspace;
var
  liTop: Integer;
  lCurrentBand: TppBand;
  liBand, liBands: Integer;
begin

  if (FCurrentReport = nil) then Exit;

  {initialize}
  liTop := 0;
  liBands := FCurrentReport.BandCount;
  lCurrentBand := nil;

  {set new band tops}
  for liBand := 0 to liBands-1 do
    begin
      lCurrentBand := FCurrentReport.Bands[liBand];
      lCurrentBand.spTop := liTop;
      liTop := liTop + lCurrentBand.spHeight + lCurrentBand.DesignControl.Height
    end;

  if (lCurrentBand <> nil) then
    begin
      {set workspace height, if footer band
        note: workspace resize will adjust scroll box range}
      FBottomOfWorkspace := lCurrentBand.DesignControl.Top;

      FWorkSpace.Height := FBottomOfWorkspace + lCurrentBand.DesignControl.Height;
    end;

end; {procedure, ArrangeWorkspace}


{------------------------------------------------------------------------------}
{ TppDesignerWindow.GetStatusBar }


function TppDesignerWindow.GetStatusBar: TStatusBar;
begin
  Result := stbStatusBar;
end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.DesignModuleClassListChanged }

procedure TppDesignerWindow.DesignModuleClassListChanged(Sender: TObject);
begin

  FreeDesignModules;
  CreateDesignModules;

end; {procedure, DesignModuleClassListChanged}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.SetComponent }

procedure TppDesignerWindow.SetComponent(aComponent: TComponent);
var
  lReport: TppReport;

begin

  inherited SetComponent(aComponent);

  if (aComponent <> nil) and not(aComponent is TppReport) then Exit;

  lReport := TppReport(aComponent);

  SetReport(lReport);

end; {procedure, SetComponent}

{------------------------------------------------------------------------------}
{ GetCurrentComponent}

function TppDesignerWindow.GetCurrentComponent: TComponent;
begin

  Result := FCurrentReport;

end; {function, GetCurrentComponent}

{------------------------------------------------------------------------------}
{ GetCurrentComponent}

procedure TppDesignerWindow.SetCurrentComponent(aComponent: TComponent);
begin

  if aComponent is TppCustomReport then
    SelectReport(TppCustomReport(aComponent));

end; {procedure, GetCurrentComponent}


{------------------------------------------------------------------------------}
{ SetReport - set property routine}

procedure TppDesignerWindow.SetReport(aReport: TppReport);
var
  lSaveReport: TppCustomReport;
  liModule: Integer;

begin

  if FReport <> aReport then
    begin

      if not (dsDestroying in FDesignerState) then
        begin

          if Self.Visible then
            FWorkspace.Visible := False;

          {clear tab list}
          tbsReport.Tabs.Clear;
          tbsReport.Visible := False;

        end;


      {save current report and assign new one
        note: this prevents a stack fault when the report tries to notify the designer }
      lSaveReport := FReport;

      FReport := aReport;

     {assign report to viewer }
      SetDesignViewer(FReport);

      {remove references to current report }
      if (lSaveReport <> nil) then
        begin
          lSaveReport.ReportDesigner := nil;
          SetCurrentReport(nil);
        end;


      if (FReport <> nil) then
        begin

          {initialize 'main' tab}
          tbsReport.Tabs.AddObject(ppLoadStr(374), FReport);

           {attach designer to report}
          FReport.ReportDesigner := Self;
 
          {note: this causes tab change event to fire which sets the current report}
          tbsReport.TabIndex := 0;

          {set designer window caption}
          SetWindowCaption;

          {set all strings to appropriate language}
          SetLanguage;

        end;


      for liModule := 0 to FDesignModules.Count-1 do
        TppDesignModule(FDesignModules.Objects[liModule]).Component := aReport;

    end;

end; {procedure, SetReport}


{------------------------------------------------------------------------------}
{ SetCurrentReport}

procedure TppDesignerWindow.SetCurrentReport(aCustomReport: TppCustomReport);
var
  lbChange: Boolean;
begin


  if FCurrentReport =  aCustomReport then Exit;


  if Self.Visible and not (dsDestroying in FDesignerState) then
    FWorkspace.Visible := False;

  {clear selection - make ppReport the selected object}
  FSizingHandles.Hide;
  FCurrentBand := nil;

  {Since nothing is selected, the Report component will be selected by default}
  ClearSelection(False);

  {free report's design controls }
  if FCurrentReport <> nil then
    FCurrentReport.FreeDesignControls;


  if (aCustomReport = nil) then

    FCurrentReport := nil

  else
    begin
      {assign Report property}
      FCurrentReport := aCustomReport;

      {create header, detail, footer bands, if needed }
      FCurrentReport.CreateDefaultBands;

      {set design time event properties}
      FCurrentReport.SetdcPopupMenuClick(PopupMenuClick);

      {initialize template props of master report}
      if (FCurrentReport <> FReport) then
        FCurrentReport.Template.InitializeSettings(FReport.Template);


      {instantiate design controls for report }
      FCurrentReport.InstantiateDesignControls;

      {set pppcDisplayData DesignState}
      if not(pppcDisplayData in FCurrentReport.DesignState) then
        FCurrentReport.DSInclude([pppcDisplayData]);

      {arrange workspace for bands }
      ArrangeWorkspace;

      {set ActivePage to design }

      if (pgcDesigner.ActivePage <> tshDesign) and not (dsRestoringReportState in FDesignerState) then
        begin
          lbChange := True;
          pgcDesignerChanging(Self, lbChange);

          if lbChange then
            begin
              pgcDesigner.ActivePage := tshDesign;
              pgcDesignerChange(Self);
            end;
        end;


      {assign get printer to support utPrinterPixels setting}
      FWorkspaceRuler.OnGetPrinter := GetPrinterEvent;

      {set designer ruler units}
      FWorkspaceRuler.Units := FCurrentReport.Units;


      FWorkspace.ColumnBackground := (FCurrentReport.Columns > 1);

      CalcWorkspaceWidth;

      {call workspace resize to set scrollrange for this report}
      WorkspaceResize(Self);

      if Self.Visible and not (dsDestroying in FDesignerState) then
        FWorkspace.Visible := True;

      SetObjectInspectorToSelection;

    end; {if, aCustomReport <> nil}


  if FReportTree <> nil then
    FReportTree.Report := FCurrentReport;

  if FDataTree <> nil then
    FDataTree.Report := FCurrentReport;

  {fire event for TppDesigner}
  if (aCustomReport <> nil) then
    if Assigned(FOnReportSelected) then FOnReportSelected(Self);


end; {procedure, SetCurrentReport}

{------------------------------------------------------------------------------}
{ GetCurrentReport}

function TppDesignerWindow.GetCurrentReport: TppCustomReport;
begin
  {note: do not use FCurrentReport, it gets set to nil when a report is loading or
         Report.BeginUpdate is called}
  if  tbsReport.TabIndex < 0 then
    Result := nil
  else
    Result := TppCustomReport(tbsReport.Tabs.Objects[tbsReport.TabIndex]);

end;  {function, GetCurrentReport}


{------------------------------------------------------------------------------}
{ AddSubReport}

procedure TppDesignerWindow.AddSubReport(aCustomReport: TppCustomReport);
var
  lSubReports: TStringList;
  liIndex: Integer;

begin

  {get list of all subReports related to the main report }
  lSubReports := TStringList.Create;
  FReport.GetSubReports(lSubReports);

  tbsReport.Tabs.Assign(lSubReports);

  {insert 'main' tab}
  tbsReport.Tabs.InsertObject(0, ppLoadStr(374), FReport);

  {set tab visibility based upon number of tabs}
  tbsReport.Visible := (tbsReport.Tabs.Count > 1);

  SelectReport(FCurrentReport);


  if FReportTree <> nil then
    begin
      liIndex := lSubReports.IndexOfObject(aCustomReport);
      FReportTree.AddChildReport(lSubReports[liIndex], aCustomReport);
    end;
    
  lSubReports.Free;

end;

{------------------------------------------------------------------------------}
{ RemoveSubReport}

procedure TppDesignerWindow.RemoveSubReport(aCustomReport: TppCustomReport);
var
  liIndex: Integer;
  lReport: TppCustomReport;

begin

  liIndex := tbsReport.Tabs.IndexOfObject(aCustomReport);

  if liIndex < 0 then Exit;

  lReport := TppCustomReport(tbsReport.Tabs.Objects[liIndex]);

  {note: Normally the subreport is deleted by the user when its
         parent report is the CurrentReport. This should only happen
         when report and subreport are being destroyed.  }
  if (FCurrentReport = lReport) then
    SetCurrentReport(nil);

  {remove the tab }
  tbsReport.Tabs.Delete(liIndex);

  {set tab visibility based upon number of tabs}
  tbsReport.Visible := (tbsReport.Tabs.Count > 1);

  if FToolbarManager <> nil then
    FReportTree.RemoveChildReport(aCustomReport);

end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.SelectReport}

procedure TppDesignerWindow.SelectReport(aCustomReport: TppCustomReport);
var
  liIndex: Integer;

begin

  liIndex := tbsReport.Tabs.IndexOfObject(aCustomReport);

  if liIndex < 0 then Exit;

  tbsReport.TabIndex := liIndex

end; {procedure, SelectReport}

{------------------------------------------------------------------------------}
{ tbsReportChange }

procedure TppDesignerWindow.tbsReportChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
var
  lNewReport: TppCustomReport;
  lSaveReport: TppCustomReport;

begin

  if (FReport = nil) then Exit;

  lSaveReport := FCurrentReport;

  try

    lNewReport := TppCustomReport(tbsReport.Tabs.Objects[NewTab]);

    SetCurrentReport(lNewReport);

  except

    SetCurrentReport(lSaveReport);

    AllowChange := False;

  end;


end;

{------------------------------------------------------------------------------}
{ UpdateTabCaption }

procedure TppDesignerWindow.UpdateTabCaption(aSubReport: TppSubReport);
var
  liIndex: Integer;

begin

  if (FReport = nil) then Exit;

  liIndex := tbsReport.Tabs.IndexOfObject(aSubReport.Report);

  {update tab caption }
  if liIndex >= 0 then
    tbsReport.Tabs[liIndex] := aSubReport.Caption;


end;

{------------------------------------------------------------------------------}
{ SetDefaultCaption }

procedure TppDesignerWindow.SetDefaultCaption(aCaption: String);
begin
  FDefaultCaption := aCaption;
  SetWindowCaption;
end;

{------------------------------------------------------------------------------}
{ SetWindowCaption }

procedure TppDesignerWindow.SetWindowCaption;
var
  lsCaption: String;

begin

  if (FReport <> GetCurrentReport) then Exit;

  if (dsSavingReportState in FDesignerState) or (dsRestoringReportState in FDesignerState) then Exit;

  {update window caption, if report name changed}
  if (FReport = nil) then
    Caption := FDefaultCaption
  else
    begin

      lsCaption := FDefaultCaption;

      if (csDesigning in FReport.ComponentState) then
        lsCaption := lsCaption + ' - ' + FReport.Name;

 {     if (FReport.Template.Description <> '') then}
      if FReport.SaveAsTemplate then
        begin
          lsCaption := lsCaption + ': ' + FReport.Template.Description;

          if (FReport.Template.SaveTo = stFile) and (FReport.Template.ReadOnly) then
            lsCaption := lsCaption + ' ' + ppLoadStr(685); {'[Read Only]'}

        end;

     end;

  if lsCaption <> Caption then
    Caption := lsCaption;

end;


{------------------------------------------------------------------------------}
{ SetFieldAliases }

procedure TppDesignerWindow.SetFieldAliases(aFieldAliases: TStrings);
begin
  if (aFieldAliases <> nil) then
    FFieldAliases.Assign(aFieldAliases);
end;


{------------------------------------------------------------------------------}
{ DoOnAssignField }

procedure TppDesignerWindow.DoOnAssignField(Sender: TObject);
begin
  if Assigned(FOnAssignField) then FOnAssignField(Sender);
end;

{------------------------------------------------------------------------------}
{ DoCreateComponent }

procedure TppDesignerWindow.DoCreateComponent(Sender: TObject; aComponent: TComponent);
begin
  if Assigned(FOnCreateComponent) then FOnCreateComponent(Sender, aComponent);
end;

{------------------------------------------------------------------------------}
{ DoDestroyComponent }

procedure TppDesignerWindow.DoDestroyComponent(Sender: TObject; aComponent: TComponent);
begin
  if Assigned(FOnDestroyComponent) then FOnDestroyComponent(Sender, aComponent);
end;


{------------------------------------------------------------------------------}
{ DoValidateComponent }

procedure TppDesignerWindow.DoValidateComponent(Sender: TObject; aComponent: TComponent; var Valid: Boolean);
begin
  if Assigned(FOnValidateComponent) then FOnValidateComponent(Sender, aComponent, Valid);
end;

{------------------------------------------------------------------------------}
{ DoOnGetFieldForAlias }

procedure TppDesignerWindow.DoOnGetFieldForAlias(Sender: TObject; const FieldAlias: String;
                                             var aDataPipeline: TObject; var aDataField: String);
begin
  if Assigned(FOnGetFieldForAlias) then FOnGetFieldForAlias(Sender, FieldAlias, aDataPipeline, aDataField);
end;

{------------------------------------------------------------------------------}
{ DoOnGetAliasForField }

procedure TppDesignerWindow.DoOnGetAliasForField(Sender: TObject; aDataPipeline: TObject;
                                             const aDataField: String; var aFieldAlias: String);
begin
  if Assigned(FOnGetAliasForField) then FOnGetAliasForField(Sender, aDataPipeline, aDataField, aFieldAlias);
end;


{------------------------------------------------------------------------------}
{ SetTabsVisible }

procedure TppDesignerWindow.SetTabsVisible(aValue: Boolean);
var
  liPage: Integer;
  lActivePage: TTabSheet;


begin

  {save and restore ActivePage, for some reason in D4 this changes}
  lActivePage := pgcDesigner.ActivePage;

  for liPage := 0 to pgcDesigner.PageCount-1 do
    pgcDesigner.Pages[liPage].TabVisible := aValue;

  pgcDesigner.ActivePage := lActivePage;


  SetDesignViewer(FReport);

end;

{------------------------------------------------------------------------------}
{ SetDesignViewer }

procedure TppDesignerWindow.SetDesignViewer(aReport: TppReport);
var
  lbTabsVisible: Boolean;
  lbViewerActive: Boolean;

begin

  lbTabsVisible  := (tshDesign.TabVisible);
  lbViewerActive := (pgcDesigner.ActivePage = tshPreview);


  if lbTabsVisible or lbViewerActive then
    FViewer.Report := aReport
  else
    FViewer.Report := nil;

end;


{------------------------------------------------------------------------------}
{ ComponentModified}

procedure TppDesignerWindow.ComponentModified;
begin
  {notify Form Designer that component changed - this updates Object Inspector, and
   ensures Form Designer asks user, 'save changes?' when form is closed}
  if (FCurrentReport = nil) then Exit;

  if (csDestroying in FCurrentReport.ComponentState) or  (dsDestroying in FDesignerState) then Exit;

  {Note: setting Report.Modified will cause the FormDesigner to be notified}
  FCurrentReport.Modified := True;

end;

{------------------------------------------------------------------------------}
{ FormKeyDown }

procedure TppDesignerWindow.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  liSelection      : Integer;
  lppComponent     : TppComponent;
  lsDelphiHelpFile : String;
  lsHelpContext    : String;

begin

  if (ssAlt in Shift) and FDesignTime then
    mnuMain.DispatchCommand(Key);

  if (Key = VK_F1) and FDesignTime then
    begin

      if FppSelection.Count = 0 then
        {show ReportBuilder help contents}
        lsHelpContext := ''
      else
        begin
         {show ReportBuilder help for component topic}
         lppComponent  := FppSelection.Items[0];

         lsHelpContext := Copy(lppComponent.ClassName,4,Length(lppComponent.ClassName))
                                     + '_Component';
        end;

      {save name of Delphi's help file}
      lsDelphiHelpFile := Application.HelpFile;

      {show ReportBuilder help topic}
      Application.Helpfile := ppGetDelphiPath + '\Help\RBuilder.HLP';

      if lsHelpContext = '' then
        Application.HelpCommand(HELP_FINDER, 0)
      else
        Application.HelpJump(lsHelpContext);

      {restore Delphi's help file}
      Application.Helpfile := lsDelphiHelpFile;

    end  {F1 key pressed}

  else if (Key = VK_Delete)then
    DeleteSelection

  else

    for liSelection := 0 to (FppSelection.Count - 1) do
      begin

        lppComponent := FppSelection.Items[liSelection];

        {resize object by one}
        if ssShift in Shift then

          case Key of

            VK_UP: if (lppComponent.spHeight > 1) then
                     lppComponent.spHeight := lppComponent.spHeight - 1;

            VK_DOWN: lppComponent.spHeight := lppComponent.spHeight + 1;

            VK_LEFT: if (lppComponent.spWidth > 1) then
                       lppComponent.spWidth := lppComponent.spWidth - 1;

            VK_RIGHT: lppComponent.spWidth := lppComponent.spWidth + 1;

          end


        else if ssCtrl in Shift then

          {move object by one}
          case Key of

            VK_UP:    lppComponent.spTop := lppComponent.spTop - 1;

            VK_DOWN:  lppComponent.spTop := lppComponent.spTop + 1;

            VK_LEFT:  lppComponent.spLeft := lppComponent.spLeft - 1;

            VK_RIGHT: lppComponent.spLeft := lppComponent.spLeft + 1;

          end;

    end; {for, liSelection}


end; {procedure, FormKeyDown}

{------------------------------------------------------------------------------}
{ DesignJustifyTextChange }

procedure TppDesignerWindow.DesignJustifyTextChange(Sender: TObject);
var
  liSelection  : Integer;
  lppComponent : TppComponent;

begin

  for liSelection := 0 to (FppSelection.Count - 1) do
    begin
      lppComponent := FppSelection.Items[liSelection];
      if lppComponent.HasFont then
        lppComponent.Alignment := FDesignJustifyText;
    end;


end;  {procedure, DesignJustifyTextChange }

{------------------------------------------------------------------------------}
{ RemoveUndeleteState }

procedure TppDesignerWindow.RemoveUndeleteState;
begin


  if (dsUndelete in FDesignerState) then
    Exclude(FDesignerState, dsUndelete);

end; {procedure, RemoveUndeleteState }

{------------------------------------------------------------------------------}
{ SetUnits }

procedure TppDesignerWindow.SetUnits(aUnits: TppUnitType);
begin

  if FWorkspaceRuler.Units <> aUnits then
    FWorkspaceRuler.Units := aUnits;

  SetStatusBarToSelection;  
end; {procedure, SetUnits }

{------------------------------------------------------------------------------}
{ CalcWorkspaceWidth }

procedure TppDesignerWindow.CalcWorkspaceWidth;
var
  lppColHeaderBand,
  lppColFooterBand: TppBand;
  lRect: TRect;

begin

  if (FCurrentReport = nil) then Exit;


  {resize WorkspaceWidth based on PageWidth and ColumnWidth settings }
  if (FWorkSpace.Width <> FCurrentReport.PrinterSetup.PageDef.spPrintableWidth + 1) then

    {set workspace width - WorkspaceResize will resize bands}
    FWorkSpace.Width := FCurrentReport.PrinterSetup.PageDef.spPrintableWidth + 1;

  if (FCurrentReport.Columns = 1) then
    begin

      {delete column header, footer, if switching from column style report}
      if FWorkspace.ColumnBackground then
        begin

          FWorkspace.ColumnBackground := False;
          bndRemove(btColumnFooter);
          bndRemove(btColumnHeader);


       end;
    end {if, Columns = 1}
  else
    begin

      {calc column background width}
      lRect.Left  := FCurrentReport.spColumnWidth;
      lRect.Right := FWorkSpace.Width;

      {calc column background height}
      lppColHeaderBand := FCurrentReport.GetBand(btColumnHeader,0);
      lppColFooterBand := FCurrentReport.GetBand(btColumnFooter,0);
      if (lppColHeaderBand <> nil) and (lppColFooterBand <> nil) and
         (lppColFooterBand.DesignControl <> nil) then
        begin

          lRect.Top    := lppColHeaderBand.spTop;
          lRect.Bottom := lppColFooterBand.DesignControl.Top + lppColFooterBand.DesignControl.Height - 1;

        end;

      FWorkspace.ColumnBackgroundRect := lRect;
      FWorkspace.ColumnBackground     := True;
      FWorkspace.FooterBackground     := (FCurrentReport.GetBand(btFooter,0) <> nil);

      if (lppColHeaderBand = nil) then
        bndAdd(TppColumnHeaderBand);

      if (lppColFooterBand = nil) then
        bndAdd(TppColumnFooterBand);


    end; {if, Columns > 1}

    FWorkspace.Invalidate;

end; {procedure, CalcWorkspaceWidth }





{------------------------------------------------------------------------------}
{ pgcDesignerChanging }

procedure TppDesignerWindow.pgcDesignerChanging(Sender: TObject; var AllowChange: Boolean);
begin

  if (FReport = nil) or (dsRestoringReportState in FDesignerState) then Exit;

  {notify current page that it is about to become inactive}
  SetPageActive(pgcDesigner.ActivePage, False, AllowChange);

  if AllowChange then
    FLastActivePage := pgcDesigner.ActivePage;

end; {procedure, pgcDesignerChanging }


{------------------------------------------------------------------------------}
{ TppDesignerWindow.pgcDesignerChange }

procedure TppDesignerWindow.pgcDesignerChange(Sender: TObject);
var
  lbAllowChange: Boolean;


begin

  if (FReport = nil) then Exit;

  lbAllowChange := True;

  {notify page that is has just become active}
  SetPageActive(pgcDesigner.ActivePage, True, lbAllowChange);

  if not lbAllowChange then
    begin
    
      {notify page that it is becoming inactive}
      SetPageActive(pgcDesigner.ActivePage, False, lbAllowChange);

      {restore prior page}
      pgcDesigner.ActivePage := FLastActivePage;
      SetPageActive(pgcDesigner.ActivePage, True, lbAllowChange);

    end;



end; {procedure, pgcDesignerChange}


{------------------------------------------------------------------------------}
{ SetPageActive }

procedure TppDesignerWindow.SetPageActive(aPage: TTabSheet; aActive: Boolean; var aAllowChange: Boolean);
var
  lDesignModule: TppDesignModule;

begin

  if (dsRestoringReportState in FDesignerState) then Exit;

  {fire event }
  if aActive and Assigned(FOnTabChange) then
     FOnTabChange(pgcDesigner, aPage.Caption, aAllowChange);

  if not aAllowChange then Exit;

  {notify the active design module of the change}
  lDesignModule := GetDesignModuleForPage(pgcDesigner.ActivePage.PageIndex);

  if (lDesignModule <> nil) then
    begin
      lDesignModule.ActiveChanging(aAllowChange);

      if aAllowChange then
        lDesignModule.Active := aActive;

    end
  else if (aPage = tshDesign) then

    SetDesignPageActive(aActive, aAllowChange)

  else if (aPage = tshPreview) then

    SetPreviewPageActive(aActive, aAllowChange);


end; {procedure, SetPageActive}


{------------------------------------------------------------------------------}
{ SetDesignPageActive }

procedure TppDesignerWindow.SetDesignPageActive(aActive: Boolean; var aAllowChange: Boolean);
begin

  if aActive then
    begin

      {update designer status bar}

      {restore menu}
      Menu := mnuMain;


      stbStatusbar.SimplePanel := False;
      InitializeStatusBar;

      SetToolbarToSelection;
      SetStatusBarToSelection;

      RestoreToolWindows;

      if FReportTree <> nil then
        FReportTree.Rebuild;

      Application.ProcessMessages;

    end
  else
    begin

      HideToolWindows;

    end;


end;  {procedure, SetDesignPageActive}

{------------------------------------------------------------------------------}
{ SetPreviewPageActive }

procedure TppDesignerWindow.SetPreviewPageActive(aActive: Boolean; var aAllowChange: Boolean);
var
  lbAllowChange: Boolean;

  procedure HandleException(aMessage: String);
  begin
    MessageDlg(aMessage, mtError, [mbOK], 0);
    aAllowChange := False;

    {call SetPreviewPageActive to properly deactivate the  preview tab}
    lbAllowChange := True;


    {restore the last active page}
    SetPreviewPageActive(False, lbAllowChange);
    pgcDesigner.ActivePage := FLastActivePage;
    SetPageActive(FLastActivePage, True, lbAllowChange);


  end;

begin

  if aActive then
    begin
      SaveReportState;

      {restore menu}
      Menu := mnuMain;

      FReport.DSInclude([pppcDesignPreviewing]);
      Include(FDesignerState, dsPreviewing);

      {disable menus}
      mnuMain.Items[1].Enabled          := False;   {edit menu}
      mnuMain.Items[3].Enabled          := False;   {report menu}
      mnuMain.Items[0].Items[0].Enabled := False;   {new file}
      mnuMain.Items[0].Items[1].Enabled := False;   {load from file}
      mnuMain.Items[0].Items[2].Enabled := False;   {save to file}

      if FReport <> nil then

        {if print fails, return to design page}
        try

            NotifyDesignModules(ppdmBeforePreview);

            FPreviewAutoSearchBtn.Visible := FReport.ShowAutoSearchDialog;

            stbStatusBar.SimplePanel := True;

            if not(FPreviewAutoSearchBtn.Visible) then
              pnlStandardButtons.Left := FPreviewAutoSearchBtn.Left
            else
              pnlStandardButtons.Left := 80;


            ViewerStatusChangeEvent(Self);

            FViewer.ScreenDevice.Active := True;
            FViewer.Reset;
            FReport.PrintToDevices;

          except on E:EPrintError do
            HandleException(E.Message);

               on E:EDataError do
            HandleException(E.Message);

               on E:ECodeError do
            HandleException(E.Message);

        end; {try, except}

    end

  else
    begin

      if Viewer.Busy then
        begin
          Viewer.Cancel;

          Application.ProcessMessages;
        end;

      Exclude(FDesignerState, dsPreviewing);
      FReport.DSExclude([pppcDesignPreviewing]);

      {turn off viewer}
      FViewer.ScreenDevice.Active := False;

      NotifyDesignModules(ppdmAfterPreview);

      mnuMain.Items[1].Enabled          := True;   {edit menu}
      mnuMain.Items[3].Enabled          := True;   {report menu}
      mnuMain.Items[0].Items[0].Enabled := True;   {new file}
      mnuMain.Items[0].Items[1].Enabled := True;   {load from file}
      mnuMain.Items[0].Items[2].Enabled := True;   {save to file}

      RestoreReportState;

    end


end;  {procedure, SetPreviewPageActive}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.NotifyDesignModules }

function TppDesignerWindow.NotifyDesignModules(aAction: TppDesignModuleActionType): Boolean;
var
  liModule: Integer;
  lDesignModule: TppDesignModule;

begin

  Result := True;

  if (FDesignModules = nil) then Exit;

  for liModule := 0 to FDesignModules.Count-1 do
    begin

      lDesignModule := TppDesignModule(FDesignModules.Objects[liModule]);

      if (lDesignModule = nil) then Continue;

      case aAction of
        ppdmBeforePreview: lDesignModule.BeforePreview;

        ppdmAfterPreview:  lDesignModule.AfterPreview;

        ppdmClose: lDesignModule.Close;

        ppdmCloseQuery: lDesignModule.CloseQuery(Result);

        ppdmLoadState: lDesignModule.LoadStateInfo;

        ppdmSaveState: lDesignModule.SaveStateInfo;

      end;

      if not Result then Exit;

    end;

end; {procedure, NotifyDesignModules}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.SaveReportState }

procedure TppDesignerWindow.SaveReportState;
var
  lSaveTo: TppSaveToType;
  lsFileName: String;
  lModuleClass: TClass;
begin

  lModuleClass := GetClass('TraCodeModule');

  if (lModuleClass = nil) or (FReport.GetModuleForClass(lModuleClass) = nil) then Exit;

  if (FReport = nil) then Exit;


  lSaveTo := FReport.Template.SaveTo;
  lsFileName := FReport.Template.FileName;

  Include(FDesignerState, dsSavingReportState);

  try
    FReportStateModified := FReport.Modified;

    FReportStateFileName := ppGetTempFileName(ppGetTempPath, '~');

    FReport.Template.SaveTo := stFile;
    FReport.Template.FileName := FReportStateFileName;

    FReport.Template.SaveToFile;

    FReport.Modified := False;

    FReportStateSaved := True;

  finally
    FReport.Template.SaveTo := lSaveTo;
    FReport.Template.FileName := lsFileName;
    Exclude(FDesignerState, dsSavingReportState);
{    Application.ProcessMessages;}

  end;

end; {procedure, SaveReportState}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.RestoreReportState }

procedure TppDesignerWindow.RestoreReportState;
var
  lSaveTo: TppSaveToType;
  lsFileName: String;
  lModuleClass: TClass;
begin

  if (dsRestoringReportState in FDesignerState) then Exit;

  if (FReport = nil) then Exit;

  lModuleClass := GetClass('TraCodeModule');

  if (lModuleClass = nil) or (FReport.GetModuleForClass(lModuleClass) = nil) then Exit;

  if not(FileExists(FReportStateFileName)) then Exit;

  BeginUpdate;

  Include(FDesignerState, dsRestoringReportState);

  lSaveTo := FReport.Template.SaveTo;
  lsFileName := FReport.Template.FileName;

  try
    FReport.Template.SaveTo := stFile;
    FReport.Template.FileName := FReportStateFileName;

    FReport.Template.LoadFromFile;

    DeleteFile(FReportStateFileName);

    FReportStateFileName := '';

  finally
    FReportStateSaved := False;

    FReport.Template.SaveTo := lSaveTo;
    FReport.Template.FileName := lsFileName;

    FReport.Modified := FReportStateModified;

    Exclude(FDesignerState, dsRestoringReportState);

    EndUpdate;

    {Application.ProcessMessages;}
  end;

end; {procedure, RestoreReportState}


{*******************************************************************************
 *
 ** W O R K S P A C E   S T U F F
 *
 *******************************************************************************}

{------------------------------------------------------------------------------}
{ WorkspaceMouseMove }

procedure TppDesignerWindow.WorkspaceMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  lPoint,
  lScreenPoint,
  lWorkspacePoint,
  lRulerPoint: TPoint;
  lBand: TppBand;

begin

  if (FCurrentReport = nil) then Exit;
  
  if (dsBounding in FDesignerState) then
    begin
      {convert X,Y to coordinates}
      lPoint.X := X;
      lPoint.Y := Y;
      lWorkspacePoint := FWorkspace.ScreenToClient((Sender as TControl).ClientToScreen(lPoint));

      with FWorkSpace.Canvas do
        begin
          {erase old rectangle}
          Rectangle(FRubberBand.Left,  FRubberBand.Top,
                    FRubberBand.Right, FRubberBand.Bottom);
          FRubberBand.Right  := lWorkspacePoint.X;
          FRubberBand.Bottom := lWorkspacePoint.Y;
          {draw new rectangle}
          Rectangle(FRubberBand.Left,  FRubberBand.Top,
                    FRubberBand.Right, FRubberBand.Bottom);
        end;

    end;

  if not (dsDraggingControl in FDesignerState) then
    {show ruler guides}
    begin


      lPoint.X := X;
      lPoint.Y := Y;

      lScreenPoint := (Sender as TControl).ClientToScreen(lPoint);

      {set workspace ruler guides}
      lRulerPoint   := FWorkspaceRuler.ScreenToClient(lScreenPoint);
      FWorkspaceRuler.SetGuides(lRulerPoint.X, 0);

      {get band at Y coord}
      lWorkspacePoint := FWorkspace.ScreenToClient(lScreenPoint);
      lBand := GetBandForWorkSpaceY(lWorkspacePoint.Y);

      {set band ruler guides}
      if Assigned(FCurrentBand) and (FCurrentBand <> lBand) then
        FCurrentBand.Ruler.ClearGuides;

      if Assigned(lBand) then
        begin
          lRulerPoint := lBand.Ruler.ScreenToClient(lScreenPoint);
          lBand.Ruler.SetGuides(lRulerPoint.Y, 0);
        end;

      {update current band}
      FCurrentBand := lBand;
      

    end;

end; {procedure, WorkspaceMouseMove}

{------------------------------------------------------------------------------}
{ WorkspaceMouseDown }

procedure TppDesignerWindow.WorkspaceMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  lBand: TppBand;
  lPoint: TPoint;
begin

  if Button = mbRight then
   {display popup menu for band}
    begin
      {get band at mouse position}
      lBand := GetBandForWorkspaceY(Y);

      {display the band's popup menu}
      lPoint.X := X;
      lPoint.Y := Y;
      lPoint := FWorkspace.ClientToScreen(lPoint);
      if (lBand.DesignControl <> nil) then
        (lBand.DesignControl as TPanel).PopupMenu.Popup(lPoint.X, lPoint.Y);

    end

  else if Button = mbLeft then

    if FToolbarManager.SelectObjectButton.Down then
       WorkspaceBoundingBegin(X, Y, (ssShift in Shift));

end; {procedure, WorkspaceMouseDown}

{------------------------------------------------------------------------------}
{ WorkspaceMouseUp }

procedure TppDesignerWindow.WorkspaceMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if Button = mbLeft then
    if FToolbarManager.SelectObjectButton.Down then

      begin
        if (dsBounding in FDesignerState) then
          WorkspaceBoundingEnd

        else
          begin
            ClearSelection(True);
            FKeyCatcher.SetFocus;
          end;
      end

    else
      {create a new design control}
      dcCreateNew(X,Y);


end; {procedure, WorkspaceMouseUp}


{------------------------------------------------------------------------------}
{ WorkspaceDragOver }

procedure TppDesignerWindow.WorkspaceDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  lPoint : TPoint;

begin

  {convert X,Y coordinates from Sender to Workspace}
  lPoint := FWorkSpace.ScreenToClient( (Sender as TControl).ClientToScreen(Point(X,Y)));

  {resizing object: expand sizing rectangle}
  if (dsSizingControl in FDesignerState) then
    brResize(lPoint.X,lPoint.Y)

  {dragging object: move sizing rect to reflect new location}
  else if (dsDraggingControl in FDesignerState) then
    dcMove(Source,lPoint.X,lPoint.Y)

  {dragging band: move sizing rect to reflect new location}
  else if (dsDraggingBand in FDesignerState) then
    bndMove(Source,lPoint.X,lPoint.Y);


end;  {procedure, WorkspaceDragOver}


{------------------------------------------------------------------------------}
{ TppDesignerWindow.WorkspaceDragDropEvent }

procedure TppDesignerWindow.WorkspaceDragDropEvent(Sender, Source: TObject; X, Y: Integer);
var
  lDataTree: TppDataTreeWindow;
  lBand: TppBand;
  lComponents: TList;
  liIndex: Integer;
  lPoint : TPoint;
  lComponent: TppComponent;

begin

  if (Source is TppDataTreeWindow) then
    begin

      if not CheckComponentAdd then Exit;

      lDataTree := TppDataTreeWindow(Source);

      {convert X,Y coordinates from Sender to Workspace}
      lPoint := FWorkSpace.ScreenToClient( (Sender as TControl).ClientToScreen(Point(X,Y)));

      lBand := GetBandForWorkspaceY(lPoint.Y);

      {adjust value of Y for the band.top}
      lPoint.Y := lPoint.Y - lBand.spTop;

      BeginUpdate;
      
      lComponents := TList.Create;
      lDataTree.CreateComponentsForFields(lBand, lPoint.X, lPoint.Y, lComponents);

      {select the newly created components }
      ClearSelection(False);
      
      for liIndex := 0 to lComponents.Count-1 do
        begin
          lComponent := TppComponent(lComponents[liIndex]);
          lComponent.Region := GetRegionForDesignControl(lBand, lComponent.DesignControl);

          {fire event}
          DoCreateComponent(Self, lComponent);

          AddSelection(lComponent);
        end;


      lComponents.Free;

      EndUpdate;

    end;

end;  {procedure, WorkspaceDragDropEvent}




{------------------------------------------------------------------------------}
{ WorkspaceResize }

procedure TppDesignerWindow.WorkspaceResize(Sender: TObject);
var
  lppColHeaderBand,
  lppColFooterBand: TppBand;
  lRect: TRect;
  liBands: Integer;
  liBand: Integer;

begin

  if (FCurrentReport = nil) then Exit;

  if (FCurrentReport <> nil) and (FCurrentReport.Columns > 1) then
    begin
      lRect := FWorkspace.ColumnBackgroundRect;

      {calc column background top, height}
      lppColHeaderBand  := FCurrentReport.GetBand(btColumnHeader,0);
      lppColFooterBand := FCurrentReport.GetBand(btColumnFooter,0);

      if (lppColHeaderBand <> nil) and (lppColFooterBand <> nil) and
         (lppColFooterBand.DesignControl <> nil) then
        begin
          lRect.Top    := lppColHeaderBand.spTop;
          lRect.Bottom := lppColFooterBand.DesignControl.Top + lppColFooterBand.DesignControl.Height - 1;

          FWorkspace.ColumnBackgroundRect := lRect;
        end;
    end;

  {arrange workspace for bands }
  FWorkSpace.BandHeights.Clear;
  liBands := FCurrentReport.BandCount;

  for liBand := 0 to liBands-1 do
    FWorkSpace.BandHeights.Add(IntToStr(FCurrentReport.Bands[liBand].spHeight));

  {set scrollbox & background width to 1 inch larger than workspace width}
  sbxWorkspace.HorzScrollbar.Range := FWorkSpace.Width  + Screen.PixelsPerInch;
  sbxWorkspace.VertScrollbar.Range := FWorkSpace.Height + Screen.PixelsPerInch;

  {note: sixteen is width of scrollbar}
  {pbxBackground.Width    := sbxWorkspace.HorzScrollbar.Range - 16;}
  FWorkspaceRuler.Width  := sbxWorkspace.HorzScrollbar.Range - 16;

  {pbxBackground.Height   := sbxWorkspace.VertScrollbar.Range - 16;}

end;  {procedure, WorkspaceResize}


{------------------------------------------------------------------------------}
{ WorkspaceBoundingBegin }

procedure TppDesignerWindow.WorkspaceBoundingBegin(X, Y: Integer; aAdditive: Boolean);
begin

  Include(FDesignerState, dsBounding);

  if aAdditive then
    Include(FDesignerState, dsAdditiveBounding);


  FRubberBand.Left   := X;
  FRubberBand.Top    := Y;
  FRubberBand.Right  := X;
  FRubberBand.Bottom := Y;

  {initialize pen, brush for bounding}
  with FWorkSpace.Canvas do
    begin
      Pen.Mode := pmNotXor;
      Pen.Width := 1;
      Pen.Style := psDot;
      Brush.Style := bsClear;
   end;

end; {procedure, WorkspaceBoundingBegin}

{------------------------------------------------------------------------------}
{ WorkspaceBoundingEnd }

procedure TppDesignerWindow.WorkspaceBoundingEnd;
begin

  if (dsBounding in FDesignerState) then
    begin

      Exclude(FDesignerState, dsBounding);

      if not (dsAdditiveBounding in FDesignerState) then
        ClearSelection(False)
      else
        Exclude(FDesignerState, dsAdditiveBounding);

      RectToSelection(FRubberBand);

      {if no selections then update selection}
      if FppSelections = 0 then
        ClearSelection(True);

      with FWorkSpace.Canvas do
        Rectangle(FRubberBand.Left, FRubberBand.Top, FRubberBand.Right, FRubberBand.Bottom);

    end

end; {procedure, WorkspaceBoundingEnd}

{*******************************************************************************
 *
 ** W O R K S P A C E   B A C K G R O U N D   S T U F F
 *
 *******************************************************************************}

{------------------------------------------------------------------------------}
{ pbxBackgroundDragOver }

procedure TppDesignerWindow.pbxBackgroundDragOver(Sender, Source: TObject; X,Y: Integer;
                                                         State: TDragState; var Accept: Boolean);
var
  lPoint : TPoint;
begin

  {convert X,Y coordinates from Sender to Workspace}
  lPoint.X := X;
  lPoint.Y := Y;

  lPoint   := FWorkSpace.ScreenToClient( (Sender as TControl).ClientToScreen(lPoint));

  {dragging band: move sizing rect to reflect new location}
  if (dsDraggingBand in FDesignerState) then
    bndMove(Source,lPoint.X,lPoint.Y);

end;

{------------------------------------------------------------------------------}
{ pbxBackgroundPaint }

procedure TppDesignerWindow.pbxBackgroundPaint(Sender: TObject);
begin

  {apparently the pnlWorkspace stops painting whenever
   any part of the background is visible,
   this fixes ruler scrolling for this situation}
  if (pbxBackground.Left < 0) then
    WorkspacePaint(Self)
  else if (pbxBackground.Top < 0) then
    WorkspacePaint(Self);

end; {procedure, pbxBackgroundPaint}


{------------------------------------------------------------------------------}
{ WorkspacePaint }

procedure TppDesignerWindow.WorkspacePaint(Sender: TObject);
var
  liScrollBy : Integer;
  lBand : TppBand;
  liBand  : Integer;
  lRect   : TRect;

begin

  if (FCurrentReport = nil) then Exit;

  {adjust rulers for any scrolling}
  if (FWorkSpace.Left = 0) then
    begin
      if (FLastLeft <> FWorkSpace.Left) then
        FWorkspaceRuler.ResetScroll;

    end

  else if FWorkSpace.Left < 0 then
    begin
      liScrollBy := FLastLeft - (FWorkSpace.Left);
      FWorkspaceRuler.Scroll(liScrollBy);
    end;

  FLastLeft := FWorkSpace.Left;


  liScrollby := FLastTop - FWorkSpace.Top;

  if (liScrollBy <> 0) then

    begin

      {reset ruler tops for each band}
      with FCurrentReport do

        for liBand := 0 to (BandCount - 1) do
          begin
            lBand := TppBand(Bands[liBand]);
            lBand.Ruler.ClearGuides;
            lBand.Ruler.Top := lBand.Ruler.Top - liScrollBy;
           end; {for, each band}

    end; {if, scrollby is non-zero}

  FLastTop := FWorkSpace.Top;

  {move the KeyCatcher so that it is within the visible scroll area of the workspace}
  {note: this prevents the scrollbox from inadvertently scrolling on its own.
         the scrollbox will do this because the KeyCatcher is receiving focus
         but is not in the visible area of the workspace.}

  lRect.TopLeft := FWorkspace.ScreenToClient(sbxWorkspace.ClientToScreen(sbxWorkspace.ClientRect.TopLeft));
  FKeyCatcher.Left := lRect.Left;
  FKeyCatcher.Top  := lRect.Top;


end; {procedure, WorkspacePaint}



{*******************************************************************************
 *
 ** R U L E R   S T U F F
 *
 *******************************************************************************}


{------------------------------------------------------------------------------}
{ TppDesigner.ClearRulerGuides}

procedure TppDesignerWindow.ClearRulerGuides;
var
  liBand   : Integer;

begin
  if (FCurrentReport = nil) then Exit;

  {set workspace ruler }
  FWorkspaceRuler.ClearGuides;

  {set band rulers }

  with FCurrentReport do
    for liBand := 0 to (BandCount-1) do
      Bands[liBand].Ruler.ClearGuides;

end; {procedure, ClearRulerGuides}

{------------------------------------------------------------------------------}
{ TppDesigner.SyncUnits}

procedure TppDesignerWindow.SyncUnits(Sender: TObject);
var
  lUnits: TppUnitType;
  lRuler: TppRuler;
  liBand: Integer;
  lBand: TppBand;

begin

  if (FCurrentReport = nil) then Exit;

  lRuler := (Sender as TppRuler);

  lUnits := lRuler.Units;

  {set workspace ruler  }
  if (lRuler <> FWorkspaceRuler) and (FWorkspaceRuler.Units <> lUnits) then
    FWorkspaceRuler.ChangeUnits(lUnits);

  {set band rulers  }
  with FCurrentReport do
    for liBand := 0 to (BandCount - 1) do
      begin
        lBand := TppBand(Bands[liBand]);
        if (lRuler <> lBand.Ruler) and (lBand.Ruler.Units <> lUnits) then
          lBand.Ruler.ChangeUnits(lUnits);
      end;

   {update ppReport }
   if FCurrentReport.Units <> lUnits then
     FCurrentReport.Units := lUnits;

   ComponentModified;

end; {procedure, SyncUnits}

{------------------------------------------------------------------------------}
{ TppDesigner.SetRulerDualGuides}

procedure TppDesignerWindow.SetRulerDualGuides(Value: Boolean);
var
  liBand   : Integer;
  lBand  : TppBand;

begin

  if (FCurrentReport = nil) then Exit;

  {set workspace ruler }
   FWorkspaceRuler.DualGuides := Value;

  {set band rulers }

  with FCurrentReport do
    for liBand := 0 to (BandCount - 1) do
      begin
        lBand := TppBand(Bands[liBand]);
        lBand.Ruler.DualGuides := Value;
      end;

end; {procedure, SetRulerDualGuides}

{------------------------------------------------------------------------------}
{ TppDesigner.SetRulerGuidePositions}

procedure TppDesignerWindow.SetRulerGuidePositions(aLeft, aTop, aWidth, aHeight: Integer);
var
  liBand    : Integer;
  lBand1,
  lBand2  : TppBand;
  lPoint1,
  lPoint2   : TPoint;

begin
 
  if (FCurrentReport = nil) then Exit;

  {convert to workspace ruler coordinates }
  lPoint1.X := aLeft;
  lPoint1.Y := 0;
  lPoint1   := FWorkspaceRuler.ScreenToClient(FWorkSpace.ClientToScreen(lPoint1));

  lPoint2.X := aLeft + aWidth;
  lPoint2.Y := 0;
  lPoint2   := FWorkspaceRuler.ScreenToClient(FWorkSpace.ClientToScreen(lPoint2));

  {show workspace ruler guides at selection bounds Left and Right}
  FWorkspaceRuler.SetGuides(lPoint1.X, lPoint2.X);


  {clear band guides }
  with FCurrentReport do
    for liBand := 0 to (BandCount - 1) do
      begin
        lBand1 := TppBand(Bands[liBand]);
        lBand1.Ruler.ClearGuides;
      end;

  {set X coordinates to 0 (not used)}
  lPoint1.X := 0;
  lPoint2.X := 0;

  {get band for top and bottom of selection}
  lBand1 := GetBandForWorkSpaceY(aTop);
  lBand2 := GetBandForWorkSpaceY(aTop + aHeight);

  {convert to ruler coordinates}
  if Assigned(lBand1) then
    begin
      lPoint1.Y := aTop;
      lPoint1  := lBand1.Ruler.ScreenToClient(FWorkSpace.ClientToScreen(lPoint1));
    end;

  if Assigned(lBand2) then
    begin
      lPoint2.Y := aTop  + aHeight;
      lPoint2   := lBand2.Ruler.ScreenToClient(FWorkSpace.ClientToScreen(lPoint2));
    end;

  {set ruler guides}
  if Assigned(lBand1) and Assigned(lBand2) then

    if (lBand1 = lBand2) then
      {set dual guides for the band ruler}
      begin
        lBand1.Ruler.DualGuides := True;
        lBand1.Ruler.SetGuides(lPoint1.Y,lPoint2.Y);
      end
    else
      {set single guides for each band ruler}
      begin
        lBand1.Ruler.DualGuides := False;
        lBand2.Ruler.DualGuides := False;
        lBand1.Ruler.SetGuides(lPoint1.Y,0);
        lBand2.Ruler.SetGuides(lPoint2.Y,0);
      end;

end; {procedure, SetRulerGuidePositions}



{*******************************************************************************
 *
 ** S E L E C T I O N   S T U F F
 *
 *******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDesigner.ClearSelection}

procedure TppDesignerWindow.ClearSelection(aUpdate: Boolean);
var
  liSelection: Integer;

begin

  {EventStatus('ClearSelection');}

  FCurrentObject     := nil;
  FCurrentBoundsRect := nil;

  {deselect all objects in selection - this destroys the selection object}
  for liSelection := 0 to (FppSelection.Count - 1) do
    with TppComponent(FppSelection.Items[liSelection]) do
      begin
        SelectionObject.Free;
        SelectionObject := nil;
      end;

  {clear selection list}
  FppSelection.Clear;

  FppSelections := 0;
  FppSelectionBounds.SetObjectBounds(0,0,0,0);

  if aUpdate then
    InternalSelectionChanged;

end;   {procedure, ClearSelection}


{------------------------------------------------------------------------------}
{ TppDesigner.AddSelection}

procedure TppDesignerWindow.AddSelection(aComponent: TppComponent);
var
  lSelectionObject : TppSelectionObject;

begin
  {EventStatus('AddSelection');}
  if (FCurrentReport = nil) then Exit;

  if Assigned(aComponent) and not InSelection(aComponent) and aComponent.DesignControl.Visible then
    begin

      FCurrentObject     := nil;
      FCurrentBoundsRect := nil;

      {add component to selection list}
      FppSelection.Add(aComponent);
      Inc(FppSelections);

      {notify component of the selection - this creates the selection object}
      lSelectionObject        := TppSelectionObject.Create(Self);
      lSelectionObject.Parent := FWorkspace;
      lSelectionObject.brDragOver := WorkspaceDragOver;
      lSelectionObject.brMouseUp  := brMouseUp;
      lSelectionObject.brEndDrag  := brEndDrag;

      lSelectionObject.ppComponent := aComponent;

      aComponent.SelectionObject := lSelectionObject;


      {calc selection bounds}
      if FppSelections = 1 then
        CalcSelectionBounds
      else
        AddSelectionBounds(lSelectionObject);


      if FppSelections = 1 then
        {single selection mode}
        begin
          {show sizing handles}
         { with aComponent do}
            lSelectionObject.SizingHandles := FSizingHandles;
            lSelectionObject.ShowSelection(True);
          end

      else if FppSelections = 2 then
        {change from single to multi-selection}
        with TppComponent(FppSelection.Items[0]) do
          begin
            {hide sizing handles/show selection handles}
            (SelectionObject as TppSelectionObject).SizingHandles := nil;
             lSelectionObject.ShowSelection(True);
          end

      else
        {multi-selection already in effect}
          lSelectionObject.ShowSelection(True);

      FCurrentObject     := aComponent;

      FCurrentBoundsRect := lSelectionObject.BoundsRect;

      {update status bar, object inspector}
      InternalSelectionChanged;
 
      if Self.Visible then
        FKeyCatcher.SetFocus;

    end; {if, not in selection}


end; {procedure, AddSelection}


{------------------------------------------------------------------------------}
{ TppDesigner.RemoveSelection}

procedure TppDesignerWindow.RemoveSelection(aComponent: TppComponent);
var
  liSelection : Integer;
begin

  {EventStatus('RemoveSelection');}

  if (FCurrentReport = nil) then Exit;

  {get index number for this component}
  liSelection := FppSelection.IndexOf(aComponent);

  if liSelection >= 0 then
    begin

      FCurrentObject     := nil;
      FCurrentBoundsRect := nil;


      {deselect this component's selection object}
      with TppComponent(FppSelection.Items[liSelection]) do
        begin
          SelectionObject.Free;
          SelectionObject := nil;
        end;


      {remove component from selection list}
      FppSelection.Remove(aComponent);
      Dec(FppSelections);


      CalcSelectionBounds;


      if FppSelections = 1 then
        {switch from multi-selection to single-selection}
        with TppComponent(FppSelection.Items[0]) do
          begin
            {show sizing handles}
            (SelectionObject as TppSelectionObject).SizingHandles := FSizingHandles;

            FCurrentObject     := TppComponent(FppSelection.Items[0]);
            FCurrentBoundsRect := (SelectionObject as TppSelectionObject).BoundsRect;

          end;

    {update status bar, object inspector}
    InternalSelectionChanged;

    if Self.Visible then
       FKeyCatcher.SetFocus;

  end; {if in selection}


end;  {procedure, RemoveSelection}



{$IFDEF Delphi5}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.CheckComponentAdd }

function TppDesignerWindow.CheckComponentAdd: Boolean;
var
  lsMessage: String;
begin

  Result := False;

  if (FReport = nil) or (FReport.Owner = nil) then Exit;

  {check whether this component resides in a nested frame}
  Result := not (csInline in FReport.Owner.ComponentState);

  if not Result then
    begin
      lsMessage := ppLoadStr(686); {'New components cannot be added to frame instances.'}

      MessageDlg(lsMessage, mtWarning, [mbOK], 0);
    end;


end; {function, CheckComponentAdd}

{$ELSE}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.CheckComponentAdd }

function TppDesignerWindow.CheckComponentAdd: Boolean;
begin

  Result := True;

end; {function, CheckComponentAdd}

{$ENDIF}


{------------------------------------------------------------------------------}
{ TppDesigner.CheckReportDelete}

function TppDesignerWindow.CheckReportDelete: Boolean;
var
  lsMessage: String;
begin


  Result := True;

  if (FCurrentReport = nil) then Exit;

  Result := not (csAncestor in FCurrentReport.ComponentState);

  if not Result then
    begin
      lsMessage := ppLoadStr(687); {'Selection contains a component introduced in an ancestor and cannot be deleted.'}

      MessageDlg(lsMessage, mtWarning, [mbOK], 0);
    end;


end; {procedure, CheckComponentDelete}


{------------------------------------------------------------------------------}
{ TppDesigner.CheckComponentDelete}

function TppDesignerWindow.CheckComponentDelete: Boolean;
var
  liIndex: Integer;
  lComponent: TppComponent;
  lsMessage: String;
begin

  Result := True;
  liIndex := 0;

  while Result and (liIndex < FppSelection.Count) do
    begin
      lComponent := FppSelection[liIndex];

      Result := not (csAncestor in lComponent.ComponentState);

      Inc(liIndex);

    end;

  if not Result then
    begin
      lsMessage := ppLoadStr(687); {'Selection contains a component introduced in an ancestor and cannot be deleted.'}

      MessageDlg(lsMessage, mtWarning, [mbOK], 0);
    end;

end; {procedure, CheckComponentDelete}

{------------------------------------------------------------------------------}
{ TppDesigner.DeleteSelection}

procedure TppDesignerWindow.DeleteSelection;
var
  liSelection: Integer;
  liSelections: Integer;
  lComponent: TppComponent;

begin

  if not CheckComponentDelete then Exit;

  if (FCurrentReport = nil) then Exit;

 { EventStatus('DeleteSelection');}
  Include(FDesignerState, dsDeleting);

 { BeginUpdate;}

  SelectionToMemStream(FDelMemStream);

  liSelections := FppSelection.Count;

  {for liSelection := 0 to (liSelections-1) do
    begin
      lComponent := FppSelection[liSelection];
      if (csAncestor in lComponent.ComponentState) then
        ShowMessage('Component is inherited from ancestor');
    end;}


  {delete all objects in selection}
  for liSelection := 0 to (liSelections-1) do
    begin
      lComponent := FppSelection.Last;
      lComponent.Free;
    end;

   {clear selection list}
   ClearSelection(False);

   Exclude(FDesignerState, dsDeleting);
   Include(FDesignerState, dsUndelete);

 { EndUpdate;}

   ComponentModified;
   
end;   {procedure, DeleteSelection}

{------------------------------------------------------------------------------}
{ TppDesigner.UnDeleteSelection}

procedure TppDesignerWindow.UnDeleteSelection;
begin
  Include(FDesignerState, dsUnDeleting);

  SelectionFromMemStream(FDelMemStream);

  FDelMemStream.Clear;

  Exclude(FDesignerState, dsUnDeleting);
  Exclude(FDesignerState, dsUndelete);

end; {procedure, UnDeleteSelection}

{------------------------------------------------------------------------------}
{ TppDesigner.ShowSelection}

procedure TppDesignerWindow.ShowSelection(Value: Boolean);
var
  liSelection : Integer;

begin

  if (FCurrentReport = nil) then Exit;

{ EventStatus('ShowSelection');}

  {show selection handles for each object in selection}
  for liSelection := 0 to (FppSelection.Count - 1) do
    with TppComponent(FppSelection.Items[liSelection]) do
      (SelectionObject as TppSelectionObject).ShowSelection(Value);

{ FKeyCatcher.SetFocus;}

end; {procedure, ShowSelection}



{------------------------------------------------------------------------------}
{ TppDesigner.ShowBoundsRects}

procedure TppDesignerWindow.ShowBoundsRects(Value: Boolean);
var
  liSelection : Integer;

begin
 { EventStatus('ShowBoundsRects');}

  {show bounds rect for each object in selection}
  for liSelection := 0 to (FppSelection.Count - 1) do
    with TppComponent(FppSelection.Items[liSelection]) do
      (SelectionObject as TppSelectionObject).ShowBoundsRect(Value);


end; {procedure, ShowBoundsRects}


{------------------------------------------------------------------------------}
{ TppDesigner.InSelection}

function TppDesignerWindow.InSelection(aComponent: TppComponent): Boolean;
var
  liSelection : Integer;

begin

  {get index number for this component}
  liSelection := FppSelection.IndexOf(aComponent);

  Result := (liSelection >= 0);


end; {function, InSelection}


{------------------------------------------------------------------------------}
{ TppDesigner.AddSelectionBounds}

procedure TppDesignerWindow.AddSelectionBounds(aSelectionObject: TppSelectionObject);

var
  llLeft: Longint;
  llTop: Longint;
  llRight: Longint;
  llBottom: Longint;
  llComponentTop: Longint;
  lComponent: TppComponent;

begin

  if (aSelectionObject = nil) or (FCurrentReport = nil) then Exit;

  llLeft   := FppSelectionBounds.ObjectLeft;
  llTop    := FppSelectionBounds.ObjectTop;
  llRight  := FppSelectionBounds.ObjectLeft + FppSelectionBounds.ObjectWidth;
  llBottom := FppSelectionBounds.ObjectTop  + FppSelectionBounds.ObjectHeight;

  lComponent := TppComponent(aSelectionObject.ppComponent);

  llComponentTop :=  lComponent.Band.mmTop + lComponent.mmTop;

  {compute bounds in native units}
  if llComponentTop < FppSelectionBounds.ObjectTop then
    llTop := llComponentTop;

  if (lComponent.mmLeft < FppSelectionBounds.ObjectLeft) then
    llLeft := lComponent.mmLeft;

  if (lComponent.mmLeft + lComponent.mmWidth) > (FppSelectionBounds.ObjectLeft + FppSelectionBounds.ObjectWidth) then
    llRight := (lComponent.mmLeft + lComponent.mmWidth);

  if (llComponentTop + lComponent.mmHeight) > (FppSelectionBounds.ObjectTop + FppSelectionBounds.ObjectHeight) then
    llBottom := (llComponentTop + lComponent.mmHeight);


  {set bounds }
  FppSelectionBounds.SetObjectBounds(llLeft, llTop, llRight-llLeft, llBottom-llTop);

  {compute bounds locks }
  FppSelectionBounds.BoundsLocks :=  FppSelectionBounds.BoundsLocks + aSelectionObject.BoundsLocks;


end; {procedure, AddSelectionBounds}


{------------------------------------------------------------------------------}
{ TppDesigner.CalcSelectionBounds}

procedure TppDesignerWindow.CalcSelectionBounds;
var
  liSelection: Integer;
  lSelection: TppSelectionObject;
  lComponent: TppComponent;

begin
  FppSelectionBounds.BoundsLocks := [];

  if FppSelections = 0 then Exit;

  lComponent := TppComponent(FppSelection.Items[0]);

  {initialize selection bounds to the first object}
  FppSelectionBounds.SetObjectBounds(lComponent.mmLeft, (lComponent.Band.mmTop + lComponent.mmTop),
                                                        lComponent.mmWidth, lComponent.mmHeight);
  FppSelectionBounds.BoundsLocks := FppSelectionBounds.BoundsLocks +
                                            TppSelectionObject(lComponent.SelectionObject).BoundsLocks;

  {incrementally compute the rest}
  for liSelection := 1 to (FppSelection.Count - 1) do
    begin
      lSelection := TppSelectionObject(TppComponent(FppSelection.Items[liSelection]).SelectionObject);
      AddSelectionBounds(lSelection);
    end;

end; {procedure, CalcSelectionBounds}

{------------------------------------------------------------------------------}
{ TppDesigner.AlignSelection}

procedure TppDesignerWindow.AlignSelection(aAction: TppAlignType);
var
  liLeft,
  liTop,
  liRight,
  liBottom,
  liCenter,
  liStart,
  liSelection,
  liNewLeft,
  liMoveLeft,
  liNewTop,
  liMoveTop,
  liBandWidth,
  liBandHeight: Integer;
  lppNewBand: TppBand;
  lppComponent: TppComponent;

begin
  liLeft := 0;
  liTop := 0;
  liRight := 0;
  liBottom := 0;
  liCenter := 0;
  liMoveLeft := 0;
  liMoveTop := 0;


  if FppSelections > 0 then


    if (aAction = asSpaceHorizontally) or (aAction = asSpaceVertically) then
      SpaceSelection(aAction)

    else
      begin

        lppComponent := TppComponent(FppSelection.Items[0]);

        if (lppComponent.DesignControl <> nil) then

        {use first object as basis for positioning other objects}
        with lppComponent.DesignControl do
          case aAction of

            asAlignLeftEdges         : liLeft   := lppComponent.DesignControl.Left;
            asAlignHorizontalCenters : liCenter := Top + (Height div 2);
            asCenterHorizontally     : begin
                                          liBandWidth      := lppComponent.Band.spWidth;
                                          liNewLeft        := ((liBandWidth - FppSelectionBounds.Width) div 2);
                                          liMoveLeft       := liNewLeft - FppSelectionBounds.Left;
                                        end;
            asAlignRightEdges        : liRight  := Left + Width;
            asAlignTopEdges          : liTop    := Top;
            asAlignVerticalCenters   : liCenter := Left + (Width div 2);

            asCenterVertically       : begin
                                          liBandHeight    := lppComponent.Band.spHeight;
                                          liNewTop        := ((liBandHeight - FppSelectionBounds.Height) div 2);
                                          liMoveTop       := liNewTop - (FppSelectionBounds.Top - lppComponent.Band.spTop);
                                        end;
            asAlignBottomEdges      : liBottom := Top + Height;

          end; {case, Action}

        {determine how many objects in list should be re-positioned}
        if (aAction = asCenterHorizontally) or (aAction = asCenterVertically) then
          liStart := 0
        else
          liStart := 1;

        {process each object in the selection}
        for liSelection := liStart to (FppSelection.Count - 1) do
          begin

            with TppComponent(FppSelection.Items[liSelection]) do
              with (SelectionObject as TppSelectionObject) do
              begin

                {move bounds rect as required by Action}
                with BoundsRect do
                  case aAction of
                    asAlignLeftEdges     : SetBounds(liLeft,Top, Width, Height);
                    asAlignHorizontalCenters: SetBounds(Left,liCenter - (Height div 2), Width, Height);
                    asCenterHorizontally : SetBounds(Left + liMoveLeft,Top, Width, Height);
                    asAlignRightEdges    : SetBounds(liRight - Width,Top, Width, Height);

                    asAlignTopEdges      : SetBounds(Left,liTop, Width, Height);
                    asAlignVerticalCenters : SetBounds(liCenter - (Width div 2),Top, Width, Height);
                    asCenterVertically   : SetBounds(Left,Top + liMoveTop, Width, Height);
                    asAlignBottomEdges   : SetBounds(Left,liBottom - Height, Width, Height);

                  end; {case, Action}

              {when moving objects vertically, may need to assign a new band}
              if (aAction = asAlignTopEdges) or (aAction = asAlignBottomEdges) or
                 (aAction = asAlignHorizontalCenters) then
                begin
                 {assign new band, if needed}
                  lppNewBand :=  GetBandForDesignControl(BoundsRect);

                 if Band <> lppNewBand then
                    Band := lppNewBand;
                end;

             {move the component}
              SetComponentBounds;

            end; {with, SelectionObject}


          end; {for each object in selection}

      CalcSelectionBounds;

    end; {if, SpaceSelection}

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SpaceSelection}

procedure TppDesignerWindow.SpaceSelection(aAction: TppAlignType);
var
  liLeft,
  liTop,
  liMin,
  liMax,
  liIncrement,
  liSelection      : Integer;

  lSelectionObject : TppSelectionObject;
  lSortedSelection : TStringList;
  lppNewBand: TppBand;

begin
  liLeft := 0;
  liTop := 0;
  liIncrement := 0;

  if (FppSelections > 2) and
     ((aAction = asSpaceHorizontally) or (aAction = asSpaceVertically)) then

    begin

      lSortedSelection := TStringList.Create;

      if aAction = asSpaceHorizontally then
        begin

          {add objects to sort list}
          for liSelection := 0 to (FppSelection.Count - 1) do
            with TppComponent(FppSelection.Items[liSelection]) do
              if DesignControl <> nil then
                lSortedSelection.AddObject(Format('%8d',[DesignControl.Left]),SelectionObject);

          {sort list}
          lSortedSelection.Sort;

          {compute Min, Max, Increment}
          liMin := StrToInt( lSortedSelection.Strings[0]);
          liMax := StrToInt( lSortedSelection.Strings[FppSelections-1]);

          liLeft      := liMin;
          liIncrement := (liMax - liMin) div (FppSelections - 1);
         {   ShowMessage('liMinLeft, liMaxLeft, liIncrement:' + IntToStr(liMinLeft) + ', ' +
                                    IntToStr(liMaxLeft) + ', ' + IntToStr(liIncrement));  }

        end {if, Action = asSpaceHorizontally}

      else if aAction = asSpaceVertically then
        begin

          {add objects to sortlist}
          for liSelection := 0 to (FppSelection.Count - 1) do
            with TppComponent(FppSelection.Items[liSelection]) do
              if DesignControl <> nil then
                lSortedSelection.AddObject(Format('%8d',[DesignControl.Top]),SelectionObject);

          {sort list}
          lSortedSelection.Sort;

          {compute Min, Max, Increment}
          liMin := StrToInt( lSortedSelection.Strings[0]);
          liMax := StrToInt( lSortedSelection.Strings[FppSelections-1]);

          liTop       := liMin;
          liIncrement := (liMax - liMin) div (FppSelections - 1);

        end; {if, Action = asSpaceVertically}

      {space objects in selection}
      for liSelection := 1 to (FppSelection.Count - 2) do
        begin
          lSelectionObject := TppSelectionObject(lSortedSelection.Objects[liSelection]);

          with lSelectionObject do
            begin

             {move bounds rect as required by the Action}
              with BoundsRect do

                if aAction = asSpaceHorizontally then
                  begin
                    liLeft := liLeft + liIncrement;
                    SetBounds(liLeft,Top, Width, Height);
                  end

                else if aAction = asSpaceVertically then
                  begin
                    liTop := liTop + liIncrement;
                    SetBounds(Left, liTop, Width, Height);
                  end;

              if aAction = asSpaceVertically then
                begin
                  {assign new band, if needed}
                  lppNewBand :=  GetBandForDesignControl(BoundsRect);

                  if TppComponent(ppComponent).Band <> lppNewBand then
                    TppComponent(ppComponent).Band := lppNewBand;

                end;

              {move the component}
              SetComponentBounds;

            end;

      end; {for, each object in selection}

      lSortedSelection.Free;

      CalcSelectionBounds;

    end; {FppSelections > 2}

end; {procedure, SpaceSelection}



{------------------------------------------------------------------------------}
{ TppDesigner.SizeSelection}

procedure TppDesignerWindow.SizeSelection(aAction: TppSizeType);
var
  liMaxWidth,
  liMinWidth,
  liMaxHeight,
  liMinHeight,
  liSelection      : Integer;
begin

  liMinHeight := 0;
  liMaxHeight := 0;
  liMinWidth  := 0;
  liMaxWidth  := 0;

  if (FppSelections > 1) then
    begin

      {initialize}
      for liSelection := 0 to (FppSelection.Count - 1) do
        with TppComponent(FppSelection.Items[liSelection]) do
          if liSelection = 0 then
            case aAction of

              asGrowWidth    : liMaxWidth  := spWidth;
              asGrowHeight   : liMaxHeight := spHeight;
              asShrinkWidth  : liMinWidth  := spWidth;
              asShrinkHeight : liMinHeight := spHeight;

            end {case, Action}

          else
            case aAction of

              asGrowWidth    : if spWidth  > liMaxWidth  then liMaxWidth  := spWidth;
              asGrowHeight   : if spHeight > liMaxHeight then liMaxHeight := spHeight;
              asShrinkWidth  : if spWidth  < liMinWidth  then liMinWidth  := spWidth;
              asShrinkHeight : if spHeight < liMinHeight then liMinHeight := spHeight;

            end; {case, Action}



      {process each object in the selection}
      for liSelection := 0 to (FppSelection.Count - 1) do
        begin

          with TppComponent(FppSelection.Items[liSelection]) do
            with (SelectionObject as TppSelectionObject) do
              begin
                {resize bounds rect as required by Action}
                with BoundsRect do
                  case aAction of
                    asGrowWidth    : SetBounds(Left,Top, liMaxWidth, Height);
                    asGrowHeight   : SetBounds(Left,Top, Width, liMaxHeight);
                    asShrinkWidth  : SetBounds(Left,Top, liMinWidth, Height);
                    asShrinkHeight : SetBounds(Left,Top, Width, liMinHeight);
                  end; {case action}

                {resizethe component}
                SetComponentBounds;

              end; {with, SelectionObject}

        end; {for each object in selection}

      CalcSelectionBounds;

    end; {FppSelections > 2}

end; {procedure, SizeSelection}



{------------------------------------------------------------------------------}
{ NudgeSelection }

procedure TppDesignerWindow.NudgeSelection(aAction: TppNudgeType);
var
  liSelection      : Integer;
  lppComponent     : TppComponent;

begin

  for liSelection := 0 to (FppSelection.Count - 1) do
    begin

      lppComponent := FppSelection.Items[liSelection];

      {move object by one}
      case aAction of

        nuNudgeUp:    lppComponent.spTop := lppComponent.spTop - 1;

        nuNudgeDown:  lppComponent.spTop := lppComponent.spTop + 1;

        nuNudgeLeft:  lppComponent.spLeft := lppComponent.spLeft - 1;

        nuNudgeRight: lppComponent.spLeft := lppComponent.spLeft + 1;

      end;

    end; {for, liSelection}


end; {procedure, NudgeSelection}



{------------------------------------------------------------------------------}
{ AddFontStyleToSelection }

procedure TppDesignerWindow.AddFontStyleToSelection(aFontStyle: TFontStyle);
var
  liSelection: Integer;

begin

  for liSelection := 0 to (FppSelection.Count - 1) do
    with TppComponent(FppSelection[liSelection]) do
      if HasFont then
        Font.Style := Font.Style + [aFontStyle];

end;

{------------------------------------------------------------------------------}
{ RemoveFontStyleFromSelection }

procedure TppDesignerWindow.RemoveFontStyleFromSelection(aFontStyle: TFontStyle);
var
  liSelection: Integer;

begin

  for liSelection := 0 to (FppSelection.Count - 1) do
    with TppComponent(FppSelection[liSelection]) do
      if HasFont then
        Font.Style := Font.Style - [aFontStyle];

end;


{------------------------------------------------------------------------------}
{ TreeComponentSelectedEvent }

procedure TppDesignerWindow.TreeComponentSelectedEvent(Sender: TObject);
var
  lComponent: TComponent;
begin

  if (FReportTree = nil) then Exit;

  lComponent := FReportTree.SelectedComponent;

  if (lComponent is TppComponent) then
    begin

      ClearSelection(False);

      AddSelection(TppComponent(lComponent));
    end

  else if (lComponent is TppBand) then
    begin
      FCurrentBand := TppBand(lComponent);
      ClearSelection(True);
    end;

end; {procedure, TreeComponentSelectedEvent}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.TreeReportSelectedEvent }

procedure TppDesignerWindow.TreeReportSelectedEvent(Sender: TObject);
begin

  SelectReport(TppCustomReport(FReportTree.SelectedReport));

end; {procedure, TreeReportSelectedEvent}

{------------------------------------------------------------------------------}
{ ReportComponentAdded }

procedure TppDesignerWindow.ReportComponentAdded(aComponent: TComponent);
begin

  if (FReportTree = nil) then Exit;

  FReportTree.AddComponent(aComponent);

  SetTreeViewToSelection;

  ComponentModified;

end; {procedure, ReportComponentAdded}

{------------------------------------------------------------------------------}
{ ReportComponentRemoved }

procedure TppDesignerWindow.ReportComponentRemoved(aComponent: TComponent);
begin

  if (FReportTree = nil) then Exit;

   FReportTree.RemoveComponent(aComponent);

  SetTreeViewToSelection;

  ComponentModified;


end; {procedure, ReportComponentRemoved}

{------------------------------------------------------------------------------}
{ ReportComponentUpdated }

procedure TppDesignerWindow.ReportComponentUpdated(aComponent: TComponent);
begin

  if (FReportTree = nil) then Exit;

  if not (pgcDesigner.ActivePage = tshDesign) then Exit;

  FReportTree.UpdateComponent(aComponent);

  ComponentModified;

end; {procedure, ReportComponentUpdated}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.BeginUpdate }

procedure TppDesignerWindow.BeginUpdate;
begin
  Inc(FDisableUpdates,1);

end; {procedure, BeginUpdate}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.EndUpdate }

procedure TppDesignerWindow.EndUpdate;
begin

  if (FDisableUpdates = 0) then Exit;

  Dec(FDisableUpdates, 1);

  if (FDisableUpdates = 0) then
    InternalSelectionChanged;

end; {procedure, EndUpdate}

{------------------------------------------------------------------------------}
{ InternalSelectionChanged }

procedure TppDesignerWindow.InternalSelectionChanged;
begin

  if (FDisableUpdates > 0) then Exit;

  SetToolbarToSelection;
  SetStatusbarToSelection;
  SetObjectInspectorToSelection;
  SetTreeViewToSelection;

end; {procedure, InternalSelectionChanged}


{------------------------------------------------------------------------------}
{ SelectionChanged }



procedure TppDesignerWindow.SelectionChanged(aSelection: TppDesignerSelectionList);
var
  liSelection : Integer;
  lppComponent: TppComponent;

begin


  if (dsDestroying in FDesignerState) or (FCurrentReport = nil) then Exit;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if not(Self.Visible) then Exit;

  if (FDisableUpdates > 0) then Exit;

  if (dsDeleting in FDesignerState) then Exit;


  if not EqualsSelection(aSelection) then
    begin
      Include(FDesignerState, dsSelectionChanged);


      if FppSelection.Count > 0 then
        ClearSelection(False);

      {filter the selection}
      for liSelection := 0 to aSelection.Count-1 do

        if (aSelection[liSelection] is TppComponent) then
          begin
            lppComponent := TppComponent(aSelection[liSelection]);

            {make sure TppComponent is in this report!}
            if (lppComponent.Band <> nil) and (lppComponent.Band.Report = FCurrentReport) then
              AddSelection(lppComponent)

          end;
          
      Exclude(FDesignerState, dsSelectionChanged);

    end;


end;

{------------------------------------------------------------------------------}
{ EqualsSelection }

function TppDesignerWindow.EqualsSelection(aComponentList: TppDesignerSelectionList): Boolean;
var
  liSelection :Integer;
begin

  Result := False;

  {compare length of ComponentList to length of Selection list}
  if aComponentList.Count <> FppSelection.Count then Exit;

  {compare each item in ComponentList to each item in Selection list}
  for liSelection := 0 to aComponentList.Count-1 do
    if aComponentList[liSelection] <> TppComponent(FppSelection[liSelection]) then
        Exit;

  Result := True;

end;


{------------------------------------------------------------------------------}
{ SetObjectInspectorToSelection }

procedure TppDesignerWindow.SetObjectInspectorToSelection;
var
  liSelection : Integer;
begin

  if (FDisableUpdates > 0) then Exit;

  if (dsDestroying in FDesignerState) or (FCurrentReport = nil) or (FReport = nil) then Exit;

  {note: if dsSelectionChanged then no need to notify Object Inspector,
         because the Object Inspector initiated the change (prevents a stack fault)}

  if not (dsSelectionChanged in FDesignerState) then
    begin

      if (FComponentList <> nil) then
        FComponentList.Free;

      FComponentList := TppDesignerSelectionList.Create;


      {build component list}
      if FppSelection.Count > 0 then

       {set ComponentList to selection}
        for liSelection := 0 to FppSelection.Count-1 do
          FComponentList.Add(TppComponent(FppSelection[liSelection]))

      else
       {set ComponentList to band corresponding to workspace mouse position}
        if FCurrentBand <> nil then
          FComponentList.Add(FCurrentBand)
        else
          FComponentList.Add(FCurrentReport);

      {call TDesignWindow.SetSelection method to notify Object Inspector}
      DoOnSetSelection(FComponentList);


      {object inspector will free the ComponentList}
     { if (csDesigning in FReport.ComponentState) then
        FComponentList := nil;}

    end;

end;



{------------------------------------------------------------------------------}
{ SetStatusbarToSelection }

procedure TppDesignerWindow.SetStatusbarToSelection;
var
 lPrinter: TppPrinter;
 lfLeft: Single;
 lfTop: Single;
 lfWidth: Single;
 lfHeight: Single;
 llTop: Longint;
 lBand: TppBand;

begin

  if FCurrentReport = nil then Exit;
  if (FDisableUpdates > 0) then Exit;

  {set status Caption based on number of objects in selection}
  if (FppSelections = 0) then
    stbStatusBar.Panels[0].Text := FMsgReady

  else if (FppSelections = 1) then
    stbStatusBar.Panels[0].Text := FMsgObject + ': ' + TppComponent(FppSelection[0]).UserName

  else if (FppSelections >= 1) then
    stbStatusBar.Panels[0].Text := FMsgObjects + ': ' + IntToStr(FppSelections);


 if FppSelections = 0 then
    llTop := 0
  else
    begin
      {calc top of selection relative to the band it is in}
      lBand := GetBandForWorkspaceY(FppSelectionBounds.Top);

      if (lBand <> nil) then
        llTop := FppSelectionBounds.ObjectTop - lBand.mmTop
      else
        llTop := 0;
    end;

  {convert selection bounds to report units}
  lPrinter := FCurrentReport.Printer;
  lfLeft   := ppFromMMThousandths(FppSelectionBounds.ObjectLeft,   FCurrentReport.Units, pprtHorizontal, lPrinter);
  lfTop    := ppFromMMThousandths(llTop,                           FCurrentReport.Units, pprtVertical,   lPrinter);
  lfWidth  := ppFromMMThousandths(FppSelectionBounds.ObjectWidth,  FCurrentReport.Units, pprtHorizontal, lPrinter);
  lfHeight := ppFromMMThousandths(FppSelectionBounds.ObjectHeight, FCurrentReport.Units, pprtVertical,   lPrinter);

  {set status selection bounds}

  if (stbStatusBar = nil) or (stbStatusBar.Panels.Count < 5) then Exit;

  stbStatusBar.Panels[1].Text  := FMsgLeft   + ': ' + FloatToStrF(lfLeft,   ffGeneral, 7, 0);
  stbStatusBar.Panels[2].Text  := FMsgTop    + ': ' + FloatToStrF(lfTop,    ffGeneral, 7, 0);
  stbStatusBar.Panels[3].Text  := FMsgWidth  + ': ' + FloatToStrF(lfWidth,  ffGeneral, 7, 0);
  stbStatusBar.Panels[4].Text  := FMsgHeight + ': ' + FloatToStrF(lfHeight, ffGeneral, 7, 0);



end;  {procedure, SetStatusbarToSelection}

{------------------------------------------------------------------------------}
{ SetTreeViewToSelection }

procedure TppDesignerWindow.SetTreeViewToSelection;
begin

  if (FReportTree = nil) then Exit;

  if (FDisableUpdates > 0) then Exit;


  if (FppSelection.Count > 0) then

    FReportTree.SelectComponent(TComponent(FppSelection[0]))
  else if FCurrentBand <> nil then
    FReportTree.SelectComponent(TComponent(FCurrentBand))
  else
    FReportTree.SelectComponent(nil);

end;



{------------------------------------------------------------------------------}
{ SetToolbarToSelection }

procedure TppDesignerWindow.SetToolbarToSelection;
var
  lComponent: TppComponent;
  lLine: TppLine;
  lCustomGraphic: TppCustomGraphic;
  lFontComponent: TppComponent;
  lColorComponent: TppComponent;
  liSelection: Integer;
  lsFieldAlias: String;
  lsPropName: String;
  lPropEditType: TppPropEditType;
  lsPropHint: String;
  lColor: TColor;
  lbIsClear: Boolean;
  lDataPipelines: TppDataPipelineList;
  lsName: String;
  
begin
  if (dsDestroying in FDesignerState) or (FCurrentReport = nil) or (FReport = nil) then Exit;

  if (FToolbarManager = nil) then Exit;

  if (FDisableUpdates > 0) then Exit;

  FEditBar.BeginUpdate;

  lComponent      := nil;
  lLine           := nil;
  lCustomGraphic  := nil;
  lFontComponent  := nil;
  lColorComponent := nil;

  {initialize lComponent}
  if (FppSelection.Count = 1) then
    begin
      lComponent := TppComponent(FppSelection.Items[0]);

      if lComponent.HasFont then
        lFontComponent  := lComponent
      else if lComponent.HasColor then
        lColorComponent := lComponent;

      if lComponent is TppLine then
        lLine := TppLine(lComponent);

      if lComponent is TppCustomGraphic then
        lCustomGraphic := TppCustomGraphic(lComponent);

     end

  else if (FppSelection.Count > 1) then

    for liSelection := 0 to FppSelection.Count-1 do
      begin
        if (lFontComponent = nil) and TppComponent(FppSelection[liSelection]).HasFont then
          lFontComponent := TppComponent(FppSelection[liSelection]);

        if (lColorComponent = nil) and not TppComponent(FppSelection[liSelection]).HasFont then
          lColorComponent := TppComponent(FppSelection[liSelection]);

        if (lLine = nil) and (TppComponent(FppSelection[liSelection]) is TppLine) then
          lLine := TppLine(FppSelection[liSelection]);

        if (lCustomGraphic = nil) and (TppComponent(FppSelection[liSelection]) is TppCustomGraphic) then
          lCustomGraphic := TppCustomGraphic(FppSelection[liSelection]);

      end;


  FDrawBar.LineThicknessButton.PaletteEnabled := (lLine <> nil);
  FDrawBar.LineStyleButton.PaletteEnabled     := (lCustomGraphic <> nil);

  FFormatBar.FontColorButton.PaletteEnabled      := (lFontComponent <> nil);
  FFormatBar.HighlightColorButton.PaletteEnabled := (lFontComponent <> nil);

  FDrawBar.FillColorButton.PaletteEnabled := (lColorComponent <> nil);
  FDrawBar.LineColorButton.PaletteEnabled := (lColorComponent <> nil) or (lLine <> nil);

  {set FormatBar's font related attributes}
  if (lFontComponent <> nil) then
    begin

      FDesignFont.Assign(lFontComponent.Font);

      {set text alignment}
      FFormatBar.Alignment := lFontComponent.Alignment;

      {set font}
      FFormatBar.Font := lFontComponent.Font;

      {set font highlight color}
      lFontComponent.GetBackGroundColor(lColor, lbIsClear);
      FFormatBar.SetHighlightColor(lColor, lbIsClear);

    end; {if, font applicable}


  {update line thickness button}
  if (lLine <> nil) then
    begin
      FDrawBar.LineThicknessButton.LineThickness := lLine.Weight;
      FDrawBar.LineThicknessButton.LineStyle     := lLine.Style;
      lLine.GetForeGroundColor(lColor, lbIsClear);
      FDrawBar.LineColorButton.SetPaletteColor(lColor, lbIsClear);
   end;

  {update line style button}
  if (lCustomGraphic <> nil) then
    FDrawBar.LineStyleButton.LineStyle := lCustomGraphic.Pen.Style;

  if lColorComponent <> nil then
    begin
      lColorComponent.GetBackGroundColor(lColor, lbIsClear);
      FDrawBar.FillColorButton.SetPaletteColor(lColor, lbIsClear);

      lColorComponent.GetForeGroundColor(lColor, lbIsClear);
      FDrawBar.LineColorButton.SetPaletteColor(lColor, lbIsClear);

    end;



  if (FppSelections = 0) or (FppSelections > 1) then
    FEditBar.EnableControl(nil)

  else if (FppSelections = 1) then

      begin

        lsPropName    := lComponent.DefaultPropName;
        lPropEditType := lComponent.DefaultPropEditType;
        lsPropHint    := lComponent.DefaultPropHint;


        {determine whether edit box is needed}
        if ((lPropEditType = etEdit) or (lPropEditType = etAutoEdit)) then
          FEditBar.EnableControl(FPropEditBox)

        {determine whether combo box is needed}
        else if (lPropEditType = etFieldList) then
          begin
            if (FFieldAliases.Count > 0) then
              FEditBar.EnableControl(FPropComboBox)
            else
              FEditBar.EnableControl(FPropComboBox2);
          end

        {determine whether combo box is needed}
        else if (lPropEditType = etDataPipelineList) then
          FEditBar.EnableControl(FPropComboBox)

         else if (lPropEditType = etValueList) then
          FEditBar.EnableControl(FPropComboBox);


        if lsPropName = '' then
          FEditBar.EnableControl(nil)

        else if (lPropEditType = etEdit) or (lPropEditType = etAutoEdit) then
          begin
            FPropEditBox.Text := ppGetStringPropValue(lComponent, lsPropName);
            FPropEditBox.Hint := lsPropHint;

          end

        else if (lPropEditType = etValueList) then
          begin
             FPropComboBox.Sorted := False;
             lComponent.GetDefaultPropEnumNames(FPropComboBox.Items);
             FPropComboBox.ItemIndex := ppGetOrdPropValue(lComponent, lsPropName);
             FPropComboBox.Hint := lsPropHint;
          end

        else if (lPropEditType = etDataPipelineList) then
          begin
            {populate data pipelines drop-down}
            lDataPipelines := TppDataPipelineList.Create(Report);
            FPropComboBox.Items.Assign(lDataPipelines);
            FPropComboBox.ItemIndex := FPropComboBox.Items.IndexOfObject(lComponent.DataPipeline);
            lDataPipelines.Free;
          end

        else if (lPropEditType = etFieldList) then

        {set field box}
        if (lComponent.IsDataAware) then
          begin
            {FPropComboBox.Items.Clear;
            FPropComboBox2.Items.Clear;}

            FPropComboBox.Hint := lsPropHint;
            FPropComboBox2.Hint := ppLoadStr(606); {DataPipeline Name}

            {get fields for display}
            if (FFieldAliases.Count > 0) and not (csDesigning in FCurrentReport.ComponentState) then
              begin
                FPropComboBox.Sorted := False;
                FPropComboBox.Items := FFieldAliases;
                DoOnGetAliasForField(lComponent, lComponent.DataPipeline, lComponent.DataField, lsFieldAlias);
                FPropComboBox.ItemIndex := FPropComboBox.Items.IndexOf(lsFieldAlias);
              end

            else
              begin

                {populate data pipelines drop-down}
                lDataPipelines := TppDataPipelineList.Create(Report);
                FPropComboBox2.Items.Assign(lDataPipelines);
                lDataPipelines.Free;

                if (lComponent.DataPipeline <> nil) then
                  lsName := lComponent.DataPipeline.UserName
                else
                  lsName := '';

                FPropComboBox2.ItemIndex := FPropComboBox2.Items.IndexOf(lsName);

                if (FPropComboBox2.ItemIndex <> -1) then
                  begin
                    {populate fields drop-down}
                    if not FPropComboBox.Sorted then
                      FPropComboBox.Sorted := True;

                    GetFieldsForPipeline(lComponent.DataPipeline, FPropComboBox.Items);

                  end;

                if (lComponent.DataPipeline <> nil) then
                  lsName := lComponent.DataPipeline.FieldAliasForFieldName(lComponent.DataField)
                else
                  lsName := '';

                FPropComboBox.ItemIndex := FPropComboBox.Items.IndexOf(lsName);
              end;


          end

        else if FPropComboBox.Visible then
          FEditBar.EnableControl(nil)

      end; {if, Selections = 1}

  FEditBar.EndUpdate;

end;


{------------------------------------------------------------------------------}
{ GetFieldsForPipeline }

procedure TppDesignerWindow.GetFieldsForPipeline(aDataPipeline: TppDataPipeline; aFields: TStrings);
var
 liField: Integer;
 lField: TppField;

begin

  if (aDataPipeline = nil) then Exit;
  
  aFields.Clear;

  for liField := 0 to aDataPipeline.FieldCount - 1 do
    begin
      lField := aDataPipeline.Fields[liField];
      if lField.Selectable then
        aFields.AddObject(lField.FieldAlias, lField);
    end;


end; {procedure, GetFieldsForPipeline}


{------------------------------------------------------------------------------}
{ RectToSelection }

procedure TppDesignerWindow.RectToSelection(aRect: TRect);
var
  liBand,
  liObject,
  liTemp     : Integer;
  lBand      : TppBand;
  lppComponent : TppComponent;

begin
  if (FCurrentReport = nil) then Exit;

  if aRect.Left > aRect.Right then
    begin
      liTemp      := aRect.Left;
      aRect.Left  := aRect.Right;
      aRect.Right := liTemp;
    end;

  if aRect.Top > aRect.Bottom then
    begin
      liTemp       := aRect.Top;
      aRect.Top    := aRect.Bottom;
      aRect.Bottom := liTemp;
    end;

  with FCurrentReport do
    for liBand := 0 to (BandCount - 1) do
      begin
        lBand := TppBand(Bands[liBand]);
        with lBand do
          for liObject := 0 to (ObjectCount - 1) do
            begin
              lppComponent := Objects[liObject];

              if (lppComponent.DesignControl <> nil) then
                with lppComponent.DesignControl do
                  if not ( (Left > aRect.Right)  or ((Left + Width) < aRect.Left) )  and
                     not ( (Top  > aRect.Bottom) or ((Top + Height) < aRect.Top) ) then

                       if InSelection(lppComponent) then
                         RemoveSelection(lppComponent)
                       else
                         AddSelection(lppComponent);

           end {for each object}

      end; {for each band}



end; {procedure, RectToSelection}

{------------------------------------------------------------------------------}
{ SelectionToMemStream }

procedure TppDesignerWindow.SelectionToMemStream(aMemoryStream: TMemoryStream);

var
  liSelection  : Integer;
  lppComponent : TppComponent;
  lWriter      : TWriter;


begin

  if (FCurrentReport = nil) then Exit;

  aMemoryStream.Clear;

  lWriter := TWriter.Create(aMemoryStream, 1024);

  try
    lWriter.Root := FCurrentReport.Owner;

    {copy each object in selection to aMemoryStream}

    for liSelection := 0 to (FppSelection.Count - 1) do
      begin
        lppComponent  := FppSelection[liSelection];

        if (lppComponent.Region = nil) or not InSelection(lppComponent.Region) then
          begin

            lppComponent.DSInclude([pppcCopying]);

            {save copy coords and set paste coords of first component in selection}
            if (liSelection = 0) then
              begin
                if not (dsDeleting in FDesignerState) then
                  begin
                    FCopyPoint.X  := lppComponent.spLeft;
                    FCopyPoint.Y  := lppComponent.spTop;
                  end;

                FPastePoint.X := FCopyPoint.X;
                FPastePoint.Y := FCopyPoint.Y;

              end;

            lWriter.WriteSignature;
            lWriter.WriteComponent(lppComponent);

            lppComponent.DSExclude([pppcCopying]);

          end;

    end; {for, each component in selection}


    lWriter.WriteListEnd;
  finally
    lWriter.Free;
  end;

end;  {procedure SelectionToMemStream }

{------------------------------------------------------------------------------}
{ SelectionFromMemStream }

procedure TppDesignerWindow.SelectionFromMemStream(aMemoryStream: TMemoryStream);
var
  lReader: TReader;

begin

  if (FCurrentReport = nil) then Exit;

  BeginUpdate;

  ClearSelection(False);
  aMemoryStream.Seek(0,0);

  lReader := TReader.Create(aMemoryStream, 1024);

  try
    lReader.OnSetName    := ReaderOnSetName;
    lReader.OnFindMethod := ReaderOnFindMethod;

    lReader.ReadComponents(FCurrentReport.Owner, nil, ComponentReadCallback);
  finally
    lReader.Free;
  end;

  EndUpdate;
  ComponentModified;

end;

{------------------------------------------------------------------------------}
{ ReaderSetName - event handler for TReader.OnSetName}

procedure TppDesignerWindow.ReaderOnSetName(Reader: TReader; Component: TComponent; var Name: string);
begin

  if (Reader.Root = FCurrentReport.Owner) and (FCurrentReport.Owner.FindComponent(Name) <> nil) then
    begin
       if (Component is TppCommunicator) then
         TppCommunicator(Component).DSInclude([pppcPasting]);

       Name := FCurrentReport.GetValidName(Component);
    end;

end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.ReaderOnFindMethod }

procedure TppDesignerWindow.ReaderOnFindMethod(Reader: TReader; const MethodName: string;
                                var Address: Pointer; var Error: Boolean);
begin
  {if method not found, don't raise an exception}
  Error := False;

end;

{------------------------------------------------------------------------------}
{ ComponentReadCallback - callback procedure for TReader.ReadComponents }

procedure TppDesignerWindow.ComponentReadCallback(Component: TComponent);
var
  lComponent : TppComponent;
  liNewLeft,
  liNewTop : Integer;

begin

  if (FCurrentReport = nil) then Exit;

  lComponent := TppComponent(Component);

  with lComponent do
    begin

     {set caption to user name if std naming prefix is part of caption}
      if Pos(ppGetUserNamePrefix(lComponent), Caption) > 0 then
        Caption := UserName;


      Band := TppBand(FCurrentReport.GetBand(BandType, GroupNo));

      if (Band = nil) and (FCurrentReport.BandCount > 0) then
        Band := FCurrentReport.Bands[0];


      {set paste offset based on coords of first component in selection}
      if FppSelection.Count = 0 then
        begin

          if (FCopyPoint.X = lComponent.spLeft) and (FCopyPoint.Y = lComponent.spTop) and
             not (dsUndeleting in FDesignerState) then
            begin
              FOffset.X := (FPastePoint.X - FCopyPoint.X) + 8;
              FOffset.Y := (FPastePoint.Y - FCopyPoint.Y) + 8;
            end
          else
            begin
              FOffset.X := 0;
              FOffset.Y := 0;
            end;

        end; {if, FirstComponent in selection}


    end;  {with lComponent}


  {compute new Left, adjust if going off page}
  liNewLeft := lComponent.spLeft + FOffset.X;

  if (liNewLeft + lComponent.spWidth) > FWorkSpace.Width then
    liNewLeft :=  FWorkSpace.Width - lComponent.spWidth;

  {compute new Top, adjust going below band}
  liNewTop := lComponent.spTop + FOffset.Y;

  if (liNewTop + lComponent.spHeight) > lComponent.Band.spHeight then
    liNewTop :=  lComponent.Band.spHeight - lComponent.spHeight;

  lComponent.spLeft := liNewLeft;
  lComponent.spTop  := liNewTop;

  lComponent.Region := GetRegionForDesignControl(lComponent.Band, lComponent.DesignControl);

 
  AddSelection(lComponent);

  {adjust paste point}
  FPastePoint.X := FPastePoint.X + 8;
  FPastePoint.Y := FPastePoint.Y + 8;


end;



{------------------------------------------------------------------------------}
{ MemStreamToClipboard }

procedure TppDesignerWindow.MemStreamToClipboard(aMemoryStream: TMemoryStream);
var
  lhData       : THandle;   {generic handle type (word) }
  lpDataPtr    : Pointer;   {generic pointer type}

begin

    {allocate memory from global heap - note: pilfered from DDG page 354}
    lhData := GlobalAlloc(GMEM_MOVEABLE, aMemoryStream.Size);

    try
      lpDataPtr := GlobalLock(lhData); {get a pointer to the lock memory area}

      try
        {copy memory stream to global data variable}
        Move(aMemoryStream.Memory^, lpDataPtr^, aMemoryStream.Size );
        {put data in clipboard}
        FClipBoard.Open;
        FClipBoard.SetAsHandle(CF_PPDATA, lhData);
        FClipBoard.AsText := IntToStr(aMemoryStream.Size);
        FClipBoard.Close;

      finally
         {unlock this global memory block}
         GlobalUnlock(lhData);

      end;

    except
      {free only if exception, this memory is managed by the clipboard}
      GlobalFree(lhData);
      raise;

    end;


end;

{------------------------------------------------------------------------------}
{ MemStreamFromClipboard }

procedure TppDesignerWindow.MemStreamFromClipboard(aMemoryStream: TMemoryStream);

var
  lhData       : THandle;   {generic handle type (word) }
  lpDataPtr    : Pointer;   {generic pointer type}
  llSize       : LongInt;

begin

  aMemoryStream.Clear;

  FClipboard.Open;

  {copy data from clipboard into memory stream}
  lhData  := FClipboard.GetAsHandle(CF_PPDATA);

  try
    if lhData = 0 then
      Exit;

    lpDataPtr := GlobalLock(lhData);
    llSize    := StrToInt(FClipBoard.AsText);

    try
      {copy global data variable to memory stream}
      aMemoryStream.Write(lpDataPtr^,llSize);

    finally
      {unlock this global memory block}
      GlobalUnlock(lhData);
      FClipboard.Close;

    end;

  except
      {free only if exception, this memory is managed by the clipboard}
    GlobalFree(lhData);
    raise;

  end;

end;


{------------------------------------------------------------------------------}
{ SelectionToClipboard }

procedure TppDesignerWindow.SelectionToClipboard;

begin

  if (dsUndelete in FDesignerState) then
    Exclude(FDesignerState, dsUndelete);

  SelectionToMemStream(FClipMemStream);
  MemStreamToClipBoard(FClipMemStream);

  FClipMemStream.Clear;


end; {procedure, SelectionToClipboard}

{------------------------------------------------------------------------------}
{ ClipboardToSelection }

procedure TppDesignerWindow.ClipboardToSelection;

begin

  if not CheckComponentAdd then Exit;

  if (dsUndelete in FDesignerState) then
    Exclude(FDesignerState, dsUndelete);

  MemStreamFromClipBoard(FClipMemStream);
  SelectionFromMemStream(FClipMemStream);

end; {procedure, ClipboardToSelection}

{*******************************************************************************
 *
 ** S I Z I N G  H A N D L E  S T U F F
 *
 *******************************************************************************}

{------------------------------------------------------------------------------}
{ shMouseDown - prepare design control to be resized}

procedure TppDesignerWindow.shMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

 { EventStatus('shMouseDown');}

  if (Button = mbLeft) then
    begin

      Include(FDesignerState, dsSizingControl);

      FCurrentSH := TppSizingHandleType((Sender as TShape).Tag);

      {hide sizing handles}
      FSizingHandles.Hide;

      {show bounds rect}
      ShowBoundsRects(True);

      {set indicator to warn MouseUp when it is called by BeginDrag}
      Include(FDesignerState, dsBeginDrag);

      (Sender as TShape).BeginDrag(True);

      SetRulerDualGuides(True);

    end;

end; {procedure, shMouseDown}

{------------------------------------------------------------------------------}
{ shEndDrag - end design control resizing event}

procedure TppDesignerWindow.shEndDrag(Sender, Target: TObject; X, Y: Integer);
begin

  (Sender as TShape).EndDrag(False);

  SetRulerDualGuides(False);

  Exclude(FDesignerState, dsSizingControl);

  {hide bounds rect}
  ShowBoundsRects(False);

  FCurrentObject.spSetBounds(FCurrentBoundsRect.Left,
                              (FCurrentBoundsRect.Top - FCurrentObject.Band.spTop),
                               FCurrentBoundsRect.Width, FCurrentBoundsRect.Height);

  Exclude(FDesignerState, dsDraggingControl);

end;


{*******************************************************************************
 *
 ** B O U N D S   R E C T A N G L E   S T U F F
 *
 *******************************************************************************}

{------------------------------------------------------------------------------}
{ brResize - compute new size of bounds rectangle (bigger or smaller)}

procedure TppDesignerWindow.brResize(X, Y:Integer);

var
  liLeft,
  liTop,
  liWidth,
  liHeight : Integer;

begin

 { EventStatus('brResize');}

  liLeft  := FCurrentObject.spLeft;
  liTop   := FCurrentObject.spTop + FCurrentObject.Band.spTop;
  liWidth := FCurrentObject.spWidth;
  liHeight:= FCurrentObject.spHeight;

  {calc new vertical position}
  case FCurrentSH of

    shTopLeft, shTopMiddle, shTopRight:
      if Y <= (liTop + liHeight) then
        begin
          liHeight := liHeight + (liTop - Y);
          liTop    := Y;
         end
      else
        begin
          liTop    := liTop + liHeight - 1;
          liHeight := Y - liTop + 1;
        end;

    shBottomLeft, shBottomMiddle, shBottomRight:
      if Y >= liTop then
        begin
          liHeight  := Y - liTop;
        end
      else
        begin
          liHeight := liTop - Y + 1;
          liTop    := Y;
         end;


  end;

  {calc new horizontal position}
  case FCurrentSH of

    shTopLeft, shLeftMiddle, shBottomLeft:
      if X <= (liLeft +  liWidth) then
        begin
          liLeft   := X;
          liWidth  := liWidth + (FCurrentObject.spLeft - X) ;
        end
      else
        begin
          liLeft   := liLeft +  liWidth - 1;
          liWidth  := X - liLeft;
        end;


    shTopRight, shRightMiddle, shBottomRight:
      if X >= liLeft then
        begin
          liWidth  := X - liLeft;
        end
      else
        begin
          liLeft   := X;
          liWidth  := FCurrentObject.spLeft - X + 1;
        end;

  end;

  {check bounds locks }
  if ppblWidth in FCurrentObject.DesignControl.BoundsLocks then
    begin
      liLeft  := FCurrentBoundsRect.Left;
      liWidth := FCurrentBoundsRect.Width;
    end;

  if ppblHeight in FCurrentObject.DesignControl.BoundsLocks then
    begin
      liTop    := FCurrentBoundsRect.Top;
      liHeight := FCurrentBoundsRect.Height;
    end;


  if (liWidth <= 0) then
    liWidth := 1;

  if (liHeight <= 0) then
    liHeight := 1;


  FCurrentBoundsRect.SetBounds(liLeft,liTop,liWidth,liHeight);

  SetRulerGuidePositions(FCurrentBoundsRect.Left, FCurrentBoundsRect.Top,
                         FCurrentBoundsRect.Width, FCurrentBoundsRect.Height);


end; {procedure, brResize}



{------------------------------------------------------------------------------}
{ brEndDrag - end dragging event and redraw dragged object at new location}

procedure TppDesignerWindow.brEndDrag(Sender, Target: TObject; X, Y: Integer);
var
  lOldParent: TComponent;
  lNewBand: TppBand;
  lNewRegion: TppCustomRegion;
  liSelection: Integer;
  lSelectionObject: TppSelectionObject;
  lComponent: TppComponent;

begin
 {EventStatus('brEndDrag');  }


  if (dsDraggingBand in FDesignerState) then

    {end dragging band: re-draw band at new location}
    begin
      Exclude(FDesignerState, dsDraggingBand);

      FBandBounds.EndDrag(False);
      FBandBounds.Visible := False;

      {set new band height}
      FCurrentBand.spHeight := FBandBounds.Top - FCurrentBand.spTop;

      ShowSelection(True);

    end

  else if (dsDraggingControl in FDesignerState) and Assigned(FCurrentObject) then

    {end dragging object: re-draw object at new location}
    begin

      Exclude(FDesignerState, dsDraggingControl);

      FCurrentBoundsRect.EndDrag(False);
      SetRulerDualGuides(False);



      for liSelection := 0 to (FppSelection.Count - 1) do
        begin
          lComponent := TppComponent(FppSelection.Items[liSelection]);

          lSelectionObject := TppSelectionObject(lComponent.SelectionObject);

          if (FBeginDragPt.X <> FCurrentBoundsRect.Left) or (FBeginDragPt.Y <> FCurrentBoundsRect.Top) then
            begin

              lSelectionObject.Active := False;

              lOldParent := lComponent.Parent;

              {assign new band, if needed}
              lNewBand   := GetBandForDesignControl(lSelectionObject.BoundsRect);

              {showMessage('NewBand : ' + lNewBand.Name);}
              if lComponent.Band <> lNewBand then
                lComponent.Band := lNewBand;

              {assign new region, if needed}
              lNewRegion := GetRegionForDesignControl(lNewBand, lSelectionObject.BoundsRect);

              if lComponent.Region <> lNewRegion then
                lComponent.Region := lNewRegion;

              {set component bounds to new location specified by bounds rect}
              lSelectionObject.Active := True;

              if lComponent.Parent <> lOldParent then
                begin
                  if lComponent.ParentWidth then
                    lSelectionObject.BoundsRect.Left := lComponent.spLeft;

                  if lComponent.ParentHeight then
                    lSelectionObject.BoundsRect.Top := lComponent.spTop;
                end;

              lSelectionObject.BoundsRect.Width := lComponent.spWidth;
              lSelectionObject.BoundsRect.Height:= lComponent.spHeight;
              lSelectionObject.SetComponentBounds;

            end;

           lSelectionObject.ShowSelection(True);

        end;

    end;

end; {procedure, brEndDrag}

{------------------------------------------------------------------------------}
{ brMouseUp - end dragging event and redraw dragged object at new location}

procedure TppDesignerWindow.brMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  
  brEndDrag(Sender, FWorkspace, X, Y);

end; {procedure, brMouseUp}

{*******************************************************************************
*
** D E S I G N    C O N T R O L
*
*******************************************************************************}

{------------------------------------------------------------------------------}
{ dcCreateNew }

procedure TppDesignerWindow.dcCreateNew(X,Y :Integer);
var
  lBand : TppBand;
  lPersistentClass: TPersistentClass;
  lComponentClass: TComponentClass;
  lComponent: TppComponent;
  lsClassName: String;
  lbValid: Boolean;
 { lbIsClear: Boolean;
  lColor: TColor;}

begin

  if not CheckComponentAdd then Exit;

  if (FCurrentReport = nil) then Exit;

  if (dsUndelete in FDesignerState) then
    Exclude(FDesignerState, dsUndelete);



  {clear selection}
  ClearSelection(False);

  {get the band}
  lBand := GetBandForWorkspaceY(Y);

  if lBand = nil then Exit;

  lsClassName := FToolbarManager.PaletteButton.Name;

  {get the class and check it's ancestry }
  lPersistentClass := GetClass(lsClassName);

  if (lPersistentClass = nil) or  not lPersistentClass.InheritsFrom(TppComponent) then exit;

  BeginUpdate;

  {create the component }
  lComponentClass := TComponentClass(lPersistentClass);
  lComponent      := TppComponent(ppComponentCreate(FCurrentReport, lComponentClass));

  {assign component position props }
  lComponent.Band   := lBand;
  lComponent.spLeft := X;
  lComponent.spTop  := Y - lBand.spTop;

  lComponent.DSInclude([pppcCreating]);

  {assign font props }
  if lComponent.HasFont then
    begin
      lComponent.Font := FDesignFont;
      lComponent.Alignment  := FDesignJustifyText;
      lComponent.SetBackgroundColor(clWhite,True);
    {  FFormatBar.FontColorButton.GetDefaultColor(lColor,  lbIsClear);
      lComponent.SetForeGroundColor(lColor, lbIsClear);
      FFormatBar.HighlightColorButton.GetDefaultColor(lColor,  lbIsClear);
      lComponent.SetBackGroundColor(lColor, lbIsClear);}

    end;


  if lComponent.IsDataAware then
    lComponent.DataPipeline := lBand.GetADataPipeline;


  {assign region}
  lComponent.Region := GetRegionForWorkspacePt(lBand, Point(X,Y));

  {allow component to perform any design time intitializations}
  lComponent.AfterDesignerCreate;

  {fire event}
  DoCreateComponent(Self, lComponent);

  {fire event}
  lbValid := True;

  DoValidateComponent(Self, lComponent, lbValid);

  if (lbValid) then
    begin
      ComponentModified;

      {add component to selection}
      if Assigned(lComponent) then
        AddSelection(lComponent);

      lComponent.DSExclude([pppcCreating]);

      {set Arrow speed button}
       FToolbarManager.SelectObjectButton.Click;
    end
  else
    begin
      lComponent.DSExclude([pppcCreating]);

      lComponent.Free;
    end;

  EndUpdate;

end; {procedure, dcCreateNew}

{------------------------------------------------------------------------------}
{ dcMouseUp - create a new design control - if needed }

procedure TppDesignerWindow.dcMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  lPoint : TPoint;

begin
 { EventStatus('dcMouseUp');}
  if (FCurrentReport = nil) then Exit;

  if (Button = mbLeft) then

    if (FToolbarManager.SelectObjectButton.Down) then
      begin
        if (dsBounding in FDesignerState) then
          WorkspaceBoundingEnd;

      end

    else
      {create design control mode}
      begin

        {convert click position to workspace coordinates}
        lPoint.X := X;
        lPoint.Y := Y;
        lPoint   := FWorkSpace.ScreenToClient( (Sender as TControl).ClientToScreen(lPoint));

        {create new design control}
        dcCreateNew(lPoint.X, lPoint.Y);

      end;


end; {procedure, dcMouseUp}

{------------------------------------------------------------------------------}
{ dcMouseDown - select/de-select a design control }

procedure TppDesignerWindow.dcMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

var
  lppComponent : TppComponent;
  lPoint       : TPoint;
begin

{  EventStatus('dcMouseDown');}

  if FToolbarManager.SelectObjectButton.Down and (Button = mbLeft) then

    begin

      {get ppComponent associated with this design control}
      lppComponent := TppComponent((Sender as TControl).Tag);

      if (ssCtrl in Shift)  then
        {start bounding}
        begin
          lPoint.X := X;
          lPoint.Y := Y;
          lPoint := FWorkspace.ScreenToClient((Sender as TControl).ClientToScreen(lPoint));
          WorkspaceBoundingBegin(lPoint.X, lPoint.Y, ssShift in Shift);
        end

      else if (ssShift in Shift) then

        {shift key down - remove from/add to selection as appropriate}
        begin

          if InSelection(lppComponent) then
            RemoveSelection(lppComponent)
          else
            AddSelection(lppComponent);

        end

      else {shift key not down}

        {make this DesignControl the current object in selection (used for dragging)}
        if (FppSelections > 1) and (InSelection(lppComponent)) then
          begin
            FCurrentObject := lppComponent;
            with lppComponent do
              FCurrentBoundsRect := (SelectionObject as TppSelectionObject).BoundsRect;
          end
        else if not InSelection(lppComponent) then
          {make this DesignControl the only selection}
          begin
           ClearSelection(False);
           AddSelection(lppComponent);
          end
        else
          {make sure workspace has focus}
          FKeyCatcher.SetFocus;



      if not(dsSizingControl in FDesignerState) and
         not(dsBounding in FDesignerState) and Assigned(FCurrentObject) then
        {prepare design control for dragging}
        begin

          FBeginDragPt := Point(FCurrentBoundsRect.Left,FCurrentBoundsRect.Top);

          {show bounds rect, if necessary}
          if not(ssShift in Shift) and (FppSelections = 1) then
            ShowBoundsRects(True);

          FCurrentBoundsRect.BeginDrag(False);

          {set drag x,y offset used to position cursor within sizing rect}
          Include(FDesignerState, dsDraggingControl);
          FDragXOffset    :=  X;
          FDragYOffset    :=  Y;

          SetRulerDualGuides(True);

        end; {if, not sizing}

    end; {if, spbCursor.Down}

end; {procedure, dcMouseDown}


{------------------------------------------------------------------------------}
{ dcMove - determine whether move is valid & redraw size rect in new position}

procedure TppDesignerWindow.dcMove(Sender: TObject; X, Y: Integer);
var
  liOldX,
  liOldY,
  liXDelta,
  liYDelta,     { new variables }

  liMoveLeft,
  liMoveTop,
  liSelection,
  liBandHeights,
  liBandAdjust,
  liBand,
  liBottomOfSelection: Integer;
  llLeft: Longint;
  llTop: Longint;

  { function to calculate the new 'snapped' position }
  function CalcPos(aDestPos, aSpacing: Integer; YAxis: Boolean): Integer;
  var
    liMod: Integer;
    liHalfway: Integer;

  begin

    liHalfway := Round(aSpacing / 2);
    liBandAdjust := aDestPos;

    {determine adjustment for previous band heights}
    if (YAxis) then
      begin
        liBand := 0;
        liBandHeights := 0;

        while (aDestPos > liBandHeights) and (liBand < FWorkSpace.BandHeights.Count) do
          begin
            liBandHeights := liBandHeights + StrToInt(FWorkSpace.BandHeights[liBand]) + 19;

            Inc(liBand);
          end;

        if (liBand > 0) then
          begin
            {reduce for last calculated band height, since we've gone one too far}
            liBandHeights := liBandHeights - (StrToInt(FWorkSpace.BandHeights[liBand - 1]) + 19);

            {determine amount by which the control is off the grid}
            liBandAdjust := aDestPos - liBandHeights;
          end;

      end;

    {determine destination}
    liMod := (liBandAdjust mod aSpacing);

    if (liMod <= liHalfway) then
      Result := (aDestPos - liMod)
    else
      Result := ((aDestPos - liMod) + aSpacing);
      
  end;

begin

 { EventStatus('dcMove');}

  if Assigned(FCurrentObject) then
    begin

      if ppblLeft in FppSelectionBounds.BoundsLocks then
        liMoveLeft := 0
      else
        liMoveLeft := (X - FDragXOffset) - FCurrentBoundsRect.Left;

      if ppblTop in FppSelectionBounds.BoundsLocks then
        liMoveTop := 0
      else
        liMoveTop  := (Y - FDragYOffset) - FCurrentBoundsRect.Top;


      {do not allow selection to move left of workspace}
      if (FppSelectionBounds.Left + liMoveLeft) < 0  then
        liMoveLeft := - (FppSelectionBounds.Left);

      {do not allow selection to move below bottom of workspace}
      liBottomOfSelection := FppSelectionBounds.Top + FppSelectionBounds.Height;

      if (liBottomOfSelection + liMoveTop) > FBottomOfWorkspace  then
        liMoveTop := FBottomOfWorkspace - liBottomOfSelection;

      {do not allow selection to move above top of workspace}
      if (FppSelectionBounds.Top + liMoveTop) < 0  then
        liMoveTop := - (FppSelectionBounds.Top);

     { first move the current selection only }
      with TppSelectionObject(FCurrentObject.SelectionObject).BoundsRect do
      begin
        liOldX := Left;
        liOldY := Top;
        if FSnapToGrid then
          SetBounds(CalcPos(FCurrentBoundsRect.Left + liMoveLeft, FXGridSpace, False),
                    CalcPos(FCurrentBoundsRect.Top + liMoveTop, FYGridSpace, True), Width, Height)
        else
          SetBounds(Left + liMoveLeft, Top + liMoveTop, Width, Height);

        liXDelta := Left - liOldX;
        liYDelta := Top  - liOldY;
      end;


      { now move all other selections by liXDelta and liYDelta }
      for liSelection := 0 to (FppSelection.Count - 1) do
        if liSelection <> FppSelection.IndexOf(FCurrentObject) then
        with TppComponent(FppSelection.Items[liSelection]) do
          with (SelectionObject as TppSelectionObject) do
            with BoundsRect do

                SetBounds(Left + liXDelta,  Top + liYDelta, Width, Height);

      {move selection bounds}
      with FppSelectionBounds do
        begin
          {set bounds in mm thousandths }
          llLeft := ppToMMThousandths( (FppSelectionBounds.Left + liXDelta), utScreenPixels, pprtHorizontal, nil);
          llTop  := ppToMMThousandths((FppSelectionBounds.Top + liYDelta), utScreenPixels, pprtVertical, nil);
          FppSelectionBounds.SetObjectBounds(llLeft, llTop, FppSelectionBounds.ObjectWidth,FppSelectionBounds.ObjectHeight );
        end;


      {show bounds rectangles}
      if not FCurrentBoundsRect.Visible then
          ShowBoundsRects(True);


      SetRulerGuidePositions(FppSelectionBounds.Left,  FppSelectionBounds.Top,
                             FppSelectionBounds.Width, FppSelectionBounds.Height);

    end;

end;



{*******************************************************************************
 *
 ** B A N D  S T U F F
 *
 *******************************************************************************}

{------------------------------------------------------------------------------}
{ bndMouseDown - prepare band for dragging}

procedure TppDesignerWindow.bndMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 { EventStatus('bndMouseDown');}

  if (FCurrentReport = nil) then Exit;

  if (Button = mbLeft) then
    begin

      FCurrentBand := TppBand((Sender as TppDesignBand).Tag);

      {show bounds rectangle}
      FBandBounds.SetBounds((Sender as TControl).Left, (Sender as TControl).Top,
                            (Sender as TControl).Width,(Sender as TControl).Height);

      FBandBounds.DragCursor := (Sender as TPanel).DragCursor;

      FBandBounds.Visible := True;
      FBandBounds.BringToFront;

      FBandBounds.BeginDrag(False);

      {set drag x,y offset used to position cursor within sizing rect}
      Include(FDesignerState, dsDraggingBand);
      FDragXOffset  :=  X;
      FDragYOffset  :=  Y;

    end;

end;


{------------------------------------------------------------------------------}
{ bndMove - determine whether move is valid & redraw bounds rect in new position}

procedure TppDesignerWindow.bndMove(Sender: TObject; X, Y: Integer);

var
  liNewTop,
  liBottomOfControls: Integer;
  lPriorBandPanel: TPanel;
  liBand: Integer;

begin
 { EventStatus('bndMove');}

  if (FCurrentReport = nil) then Exit;

  liNewTop    := Y - FDragYOffset;

  liBottomOfControls := FCurrentBand.GetBottomOfControls;
  liBand := FCurrentReport.FindBand(FCurrentBand);

  if liBottomOfControls >= 0 then
    {do not allow band to move above bottom of lowest control}
    begin
      if liNewTop < liBottomOfControls then
        liNewTop := liBottomOfControls
    end

  else if (liBand = 0) then
    {do not allow band to move above top of workspace}
    begin
      if (liNewTop < 0) then
        liNewTop := 0;

    end

  else if (liBand > 0) then
    {do not allow band to move above bottom of prior band}
    begin

      lPriorBandPanel := FCurrentReport.Bands[liBand-1].DesignControl;

      if (lPriorBandPanel <> nil) and
         (liNewTop < (lPriorBandPanel.Top + lPriorBandPanel.Height)) then
         liNewTop := lPriorBandPanel.Top + lPriorBandPanel.Height;

    end;

  {move bounds rect}
  FBandBounds.Top := liNewTop;

  SetRulerGuidePositions(FBandBounds.Left,  FBandBounds.Top,
                         FBandBounds.Width, FBandBounds.Height);

end;


{------------------------------------------------------------------------------}
{ bndAdd }

procedure TppDesignerWindow.bndAdd(aBandClass: TComponentClass);
var
  lBasicBand: TppBasicBand;

begin
  if (FCurrentReport = nil) then Exit;

  lBasicBand := TppBasicBand(ppComponentCreate(FCurrentReport,aBandClass));

  lBasicBand.Report := FCurrentReport;

end; {procedure, bndAdd }


{------------------------------------------------------------------------------}
{ bndRemove }

procedure TppDesignerWindow.bndRemove(aBandType: TppBandType);
var
  lBand: TppBand;

begin

  {get appropriate band}
  lBand := FCurrentReport.GetBand(aBandType, 0);

  {destroy band and re-arrange workspace}
  if Assigned(lBand) then
    lBand.Free;

end;

{*******************************************************************************
 *
 ** M E N U  &  T O O L B A R   S T U F F
 *
 *******************************************************************************}

procedure TppDesignerWindow.SetSelectionToReport;
begin
 if (FCurrentBand <> nil) then
    begin
      FCurrentBand.Ruler.ClearGuides;
      FCurrentBand := nil;
    end;

  {Clear all selected objects}
  ClearSelection(True);

end;


{------------------------------------------------------------------------------}
{ spbSelectReportClick }
procedure TppDesignerWindow.spbSelectReportClick(Sender: TObject);
begin

  SetSelectionToReport;

end;


{------------------------------------------------------------------------------}
{ EditBoxEnter }

procedure TppDesignerWindow.EditBoxEnter(Sender: TObject);
begin
  FSaveText := TEdit(Sender).Text;
  FUndoText := '';
  mniEditPaste.Enabled := Clipboard.HasFormat(CF_Text);
end;

{------------------------------------------------------------------------------}
{ EditBoxExit }

procedure TppDesignerWindow.EditBoxExit(Sender: TObject);
begin
   FSaveText := '';
   FUndoText := '';
   mniEditPaste.Enabled := Clipboard.HasFormat(CF_PPDATA);

  if Assigned(FCurrentObject) and (FppSelections = 1)  then
    if (FCurrentObject.DefaultPropEditType = etEdit) then
      begin
        ppSetStringPropValue(FCurrentObject, FCurrentObject.DefaultPropName,  TEdit(Sender).Text);
        FSizingHandles.Show(FCurrentBoundsRect);
      end;

end;

{------------------------------------------------------------------------------}
{ EditBoxKeyPress }

procedure TppDesignerWindow.EditBoxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chEnterKey then
    begin
      EditBoxExit(Sender);
      TEdit(Sender).Text := ppGetStringPropValue(FCurrentObject, FCurrentObject.DefaultPropName);
    end;
    
end;

{------------------------------------------------------------------------------}
{ EditBoxChange }

procedure TppDesignerWindow.EditBoxChange(Sender: TObject);
begin
 { EventStatus('edtValueChange');}

  if Assigned(FCurrentObject) and (FppSelections = 1)  then
    begin
      FUndoText    := FSaveText;
      FSaveText    := tEdit(Sender).Text;

      if (FCurrentObject.DefaultPropEditType = etAutoEdit) then
        begin
          ppSetStringPropValue(FCurrentObject, FCurrentObject.DefaultPropName, TEdit(Sender).Text);
          TEdit(Sender).Text := ppGetStringPropValue(FCurrentObject, FCurrentObject.DefaultPropName);
          FSizingHandles.Show(FCurrentBoundsRect);
        end;
        
    end;

end;

{------------------------------------------------------------------------------}
{ EditComboBoxChange}

procedure TppDesignerWindow.EditComboBoxChange(Sender: TObject);
var
  lDataPipeline: TObject;
  lsFieldName: String;
  lsFieldAlias: String;
begin

  if (FCurrentObject = nil) then Exit;

  case FCurrentObject.DefaultPropEditType of

    etValueList:
        ppSetOrdPropValue(FCurrentObject, FCurrentObject.DefaultPropName, TComboBox(Sender).ItemIndex);

    etDataPipelineList:
      begin
        lDataPipeline := TppDataPipeline(FPropComboBox.Items.Objects[FPropComboBox.ItemIndex]);
        FCurrentObject.DataPipeline := TppDataPipeline(lDataPipeline);

      end;
    etFieldList:
      begin

        if not(FCurrentObject.IsDataAware) then Exit;

        {must get FieldAlias here, otherwise blanking out datafield may
         cause cbxField.ItemIndex to be set to -1 via AutoSize}
        lsFieldAlias := TComboBox(Sender).Text;

        if (FFieldAliases.Count = 0) then
          begin
            if (FCurrentObject.DataPipeline = nil) then
              FPropComboBox.ItemIndex := -1
            else
              begin
                lsFieldName := FCurrentObject.DataPipeline.FieldNameForFieldAlias(lsFieldAlias);

                FCurrentObject.DataField := lsFieldName;
                DoOnAssignField(FCurrentObject);
              end;

          end

        else
          begin
            {TppComponent(FCurrentObject).DataPipeline := nil;}
            TppComponent(FCurrentObject).DataField := '';

            DoOnGetFieldForAlias(FCurrentObject, lsFieldAlias, lDataPipeline, lsFieldName);

            FCurrentObject.DataPipeline := TppDataPipeline(lDataPipeline);
            FCurrentObject.DataField := lsFieldName;

            DoOnAssignField(FCurrentObject);
          end;

      end;

  end;

end; {procedure, EditComboBoxChange}

{------------------------------------------------------------------------------}
{ EditComboBox2Change}

procedure TppDesignerWindow.EditComboBox2Change(Sender: TObject);
var
  lDataPipeline: TppDataPipeline;
  lsFieldAlias: String;
begin

  if (FCurrentObject = nil) then Exit;

  if not(FCurrentObject.IsDataAware) or (FPropComboBox2.ItemIndex = -1) then Exit;


  lDataPipeline := TppDataPipeline(FPropComboBox2.Items.Objects[FPropComboBox2.ItemIndex]);

  FCurrentObject.DataPipeline := lDataPipeline;

  GetFieldsForPipeline(lDataPipeline,  FPropComboBox.Items);

  lsFieldAlias := lDataPipeline.FieldAliasForFieldName(FCurrentObject.DataField);

  FPropComboBox.ItemIndex := FPropComboBox.Items.IndexOf(lsFieldAlias);

end; {procedure, EditComboBox2Change}

{------------------------------------------------------------------------------}
{ InternalClose}

procedure TppDesignerWindow.InternalClose;
begin

  ClearWorkspaceState;

  SaveStateInfo;

  NotifyDesignModules(ppdmClose);

  if (FReport <> nil) then
    FReport.CloseDataPipelines;

  if FDesignTime and FFreeOnClose then
    Release;


end; {procedure, InternalClose}

{------------------------------------------------------------------------------}
{ InternalCloseQuery}

function TppDesignerWindow.InternalCloseQuery: Boolean;
var
  liReport: Integer;
  lReports: TStringList;
  lReport: TppCustomReport;

begin

  Result := True;

  if (FReport = nil) then Exit;

  if (FReportStateSaved) then
    begin
      NotifyDesignModules(ppdmAfterPreview);

      RestoreReportState;
    end;

  if not Result then Exit;

  Result := NotifyDesignModules(ppdmCloseQuery);

  lReports := TStringList.Create;

  {get list of all sub-reports - order is important here }
  FReport.GetSubReports(lReports);

  lReports.InsertObject(0,'Main', FReport);

  liReport := lReports.Count-1;

  while Result and (liReport >= 0) do
    begin
      lReport := TppCustomReport(lReports.Objects[liReport]);
      Result := SaveQuery(lReport);
      Dec(liReport);
    end;

  lReports.Free;

  if Result then
    InternalClose;


end; {function, InternalCloseQuery}

{------------------------------------------------------------------------------}
{ mniFileClick}

procedure TppDesignerWindow.mniFileClick(Sender: TObject);
var
  lbTemplateEnabled: Boolean;
  lBlankWizardClass: TppReportWizardClass;
  lbSubReportOptions: Boolean;

begin

  if (FCurrentReport = nil) then Exit;

  lbTemplateEnabled := (FCurrentReport.Template.SaveTo = stFile) or
                         (FCurrentReport.Template.CheckDatabaseSettings);

  mniFileOpen.Enabled   := lbTemplateEnabled;
  mniFileSave.Enabled   := lbTemplateEnabled;
  mniFileSaveAs.Enabled := lbTemplateEnabled;

  {set visibility of explicit file load & save options}
  mniFileLoadFromFile.Visible := FAllowSaveToFile and (FCurrentReport.Template.SaveTo = stDataBase);
  mniFileSaveToFile.Visible   := mniFileLoadFromFile.Visible;
  mniFileLine3.Visible        := mniFileLoadFromFile.Visible;

  {set visibility of load/save subreport options}
  lbSubReportOptions := (tbsReport.Visible) and (tbsReport.TabIndex > 0);

  mniFileLineSubreport.Visible := lbSubReportOptions;
  mniFileLoadSubreport.Visible := lbSubReportOptions;
  mniFileSaveSubreport.Visible := lbSubReportOptions;

  mniFileLineLoadSubreportFromFile.Visible := mniFileLoadFromFile.Visible and lbSubReportOptions;
  mniFileLoadSubreportFromFile.Visible := mniFileLoadFromFile.Visible and lbSubReportOptions;
  mniFileSaveSubreportToFile.Visible   := mniFileLoadFromFile.Visible and lbSubReportOptions;


  {set file new caption based on default wizard}
  lBlankWizardClass := ppDefaultBlankReportWizard;

  if (lBlankWizardClass <> nil) and (lBlankWizardClass.DisplaysDialog) then
    mniFileNewReport.Caption := ppLoadStr(572) + '...'
  else
    mniFileNewReport.Caption := ppLoadStr(572);

end;


{------------------------------------------------------------------------------}
{ FileNewClick}

procedure TppDesignerWindow.FileNewClick(Sender: TObject);
var
  lNewDialog: TppCustomNewDialog;
  lFormClass: TFormClass;

begin
  if (FCurrentReport = nil) then Exit;

  {get the registered dialog class}
  lFormClass := ppGetFormClass(TppCustomNewDialog);

  {create the dialog}
  lNewDialog := TppCustomNewDialog(lFormClass.Create(Self));
  lNewDialog.Report := FCurrentReport;
  lNewDialog.LanguageIndex := FCurrentReport.LanguageIndex;
  ppGetReportWizardClasses(lNewDialog.WizardClasses);

  {show dialog, should return a valid wizard class}
  if lNewDialog.ShowModal = mrOK then
    NewReportFromWiz(TppReportWizardClass(lNewDialog.CreateClass));

  lNewDialog.Free;

end;


{------------------------------------------------------------------------------}
{ NewReportFromWiz }

procedure TppDesignerWindow.NewReportFromWiz(aReportWizardClass: TppReportWizardClass);
var
  lWizard: TppCustomReportWizard;
  lbPreview: Boolean;

begin
  if (aReportWizardClass = nil) then Exit;


  {clear selection}
  SetSelectionToReport;

  FPipelineList := TppDataPipelineList.Create(FCurrentReport);

  lWizard := aReportWizardClass.Create(Self);
  lWizard.AskForName := False;

  if (FCurrentReport.DataPipeline <> nil) then
    lWizard.DataName := FCurrentReport.DataPipeline.UserName;

  lWizard.OnGetDataNames := WizardGetDataNamesEvent;
  lWizard.OnGetFields := WizardGetFieldsEvent;
  lWizard.OnCreateReport := WizardCreateReportEvent;
  lWizard.Language := FCurrentReport.Language;

  GetCurrentReport.BeginUpdate;

  try
    lbPreview := lWizard.Execute and (lWizard.NextAction = ppnaPreview);

  finally
     GetCurrentReport.EndUpdate;

  end;

  if lbPreview then
    FilePrintPreviewClick(Self);

 lWizard.Free;

  FPipelineList.Free;
  FPipelineList := nil;

end;


{------------------------------------------------------------------------------}
{ WizardGetDataNamesEvent}

procedure TppDesignerWindow.WizardGetDataNamesEvent(Sender: TObject; aDataNameList: TStrings);
begin

  if Assigned(FOnGetDataNames) then
    FOnGetDataNames(Sender, aDataNameList)
  else
    aDataNameList.Assign(FPipelineList);

end; {procedure, WizardGetDataNamesEvent}


{------------------------------------------------------------------------------}
{ WizardGetFieldsEvent}

procedure TppDesignerWindow.WizardGetFieldsEvent(Sender: TObject; const aDataName: String; aFieldList: TStrings);
begin

  if Assigned(FOnGetFields) then
    FOnGetFields(Sender, aDataName, aFieldList)
  else
    GetFieldsForPipeline(FPipelineList.Pipelines[aDataName], aFieldList);

end; {procedure, WizardGetFieldsEvent}


{------------------------------------------------------------------------------}
{ WizardCreateReportEvent}

procedure TppDesignerWindow.WizardCreateReportEvent(Sender: TObject; const aDataName: String; var aReport: TObject);
var
  lReport: TppBandedReport;

begin

  if Assigned(FOnCreateReport) then
    FOnCreateReport(Sender, aDataName, aReport)

  else
    begin
      {note: cannot use FCurrentReport here, for optimization the report has been
             temporarily disconnected}
      lReport := TppBandedReport(GetCurrentReport);

      if (lReport <> nil) then
        lReport.Template.New;

      if (aDataName <> '') then
        lReport.DataPipeline := FPipelineList.Pipelines[aDataName];

      aReport := lReport;


    end;

end; {procedure, WizardCreateReportEvent}


{------------------------------------------------------------------------------}
{ FileNewClick}

procedure TppDesignerWindow.FileNewReportClick(Sender: TObject);
begin

  NewReport;

end;

{------------------------------------------------------------------------------}
{ NewReport}

procedure TppDesignerWindow.NewReport;
begin

  if not CheckReportDelete or not CheckComponentAdd then Exit;


  if (FCurrentReport = nil) then Exit;

  {ask user whether to save changes for current template}
  if not SaveQuery(FCurrentReport) then Exit;

  NewReportFromWiz(ppDefaultBlankReportWizard);

  if not FCurrentReport.SaveAsTemplate then
    ComponentModified;

end;

{------------------------------------------------------------------------------}
{ FileOpenTemplateClick}

procedure TppDesignerWindow.FileOpenClick(Sender: TObject);
var
  lsSaveTemplateName: String;

begin

  if not CheckReportDelete or not CheckComponentAdd then Exit;

  if (FReport = nil) then Exit;

  {ask user whether to save changes for current template}
  if not SaveQuery(FReport) then Exit;

  lsSaveTemplateName := FReport.Template.Description;

  if FReport.Template.ShowOpenDialog then
    try
      LoadTemplate(FReport);
    except
      FReport.Template.Description := lsSaveTemplateName;

      raise;

    end; {try except, load template }

end;

{------------------------------------------------------------------------------}
{ FileOpenTemplateClick}

procedure TppDesignerWindow.FileLoadSubreportClick(Sender: TObject);
var
  lsSaveTemplateName: String;

begin

  if not CheckReportDelete or not CheckComponentAdd then Exit;

  if (FCurrentReport = nil) then Exit;

  {ask user whether to save changes for current template}
  if not SaveQuery(FCurrentReport) then Exit;

  lsSaveTemplateName := FCurrentReport.Template.Description;

  if FCurrentReport.Template.ShowOpenDialog then
    try
      LoadTemplate(FCurrentReport);
    except
      FCurrentReport.Template.Description := lsSaveTemplateName;

      raise;

    end; {try except, load template }


end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.LoadTemplate}

procedure TppDesignerWindow.LoadTemplate(aReport: TppCustomReport);
begin

  if not CheckReportDelete or not CheckComponentAdd then Exit;

  if (aReport = nil) then Exit;

  try
  
    if Assigned(FOnCustomOpenDoc) then
      FOnCustomOpenDoc(Self)
    else
      aReport.Template.Load;

    if (aReport = FReport) then
      UpdateDocHistory(aReport.Template);

  finally

    if (csDesigning in aReport.ComponentState) and not aReport.SaveAsTemplate then
      ComponentModified;

  end;

end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.UpdateDocHistory}

procedure TppDesignerWindow.UpdateDocHistory(aTemplate: TppTemplate);
var
  lItemData: TStringList;

begin

  if (aTemplate = nil) or (FDocHistory = nil) then Exit;

  lItemData := TStringList.Create;

  try

    {build item data: template Name, SaveTo, Offset}
    lItemData.Add(aTemplate.Description);
    lItemData.Add(IntToStr(Ord(aTemplate.SaveTo)));
    lItemData.Add(IntToStr(aTemplate.Offset));

    FDocHistory.UpdateItem(aTemplate.Description, lItemData);


  finally
    lItemData.Free;

  end;

end;

{------------------------------------------------------------------------------}
{ FileCloseClick}

procedure TppDesignerWindow.FileCloseClick(Sender: TObject);
begin
  if not InternalCloseQuery then Exit;
  Close;
end;


{------------------------------------------------------------------------------}
{ TppDesignerWindow.SaveQuery }

function TppDesignerWindow.SaveQuery(aReport: TppCustomReport): Boolean;
var
  lsMessage: String;
  liTabIndex: Integer;
  lsName: String;
begin

  {default result is true}
  Result := True;

  if (aReport = nil) or not (aReport.SaveAsTemplate) or
     not (aReport.Modified) then Exit;

  {ask user whether to save changes }
  lsMessage := ppLoadStr(357); {'Save changes to <filename>?'}
  lsMessage := ppSetMessageParameters(lsMessage);

  lsName := '';

  if tbsReport.Visible then
    begin
      liTabIndex := tbsReport.Tabs.IndexOfObject(aReport);

      if (liTabIndex > 0) then
        lsName := tbsReport.Tabs[tbsReport.Tabs.IndexOfObject(aReport)] + ': ';
    end;

  if aReport.Template.Description = '' then
    aReport.Template.Description := FUntitled;

  lsName := lsName + aReport.Template.Description;

  lsMessage := Format(lsMessage, [lsName]);

  case MessageDlg(lsMessage, mtConfirmation,[mbYes, mbNo, mbCancel],0) of

     mrYes:     Result := SaveReport(aReport);

     mrCancel:  Result :=  False;

  end;

end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.SaveReport }

function TppDesignerWindow.SaveReport(aReport: TppCustomReport): Boolean;
begin

  {default result is true}
  Result := True;

  if aReport = nil then Exit;

  if (aReport.Template.Description = '') or
     (Pos(FUntitled, aReport.Template.Description) > 0) then
     
     Result := SaveReportAs(aReport)

  else if (aReport.Template.SaveTo = stFile) and
          (aReport.Template.ReadOnly) then
    begin
      MessageDlg(ppLoadStr(51), mtWarning,[mbOK], 0); {'File is read-only.'}

      Result := SaveReportAs(aReport);
    end

  else
    SaveTemplate(aReport);

end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.SaveReportAs }

function TppDesignerWindow.SaveReportAs(aReport: TppCustomReport): Boolean;
begin

  Result := False;

  if aReport = nil then Exit;

  if aReport.Template.ShowSaveDialog then
    begin
      SaveTemplate(aReport);
      if (aReport = FReport) then
        UpdateDocHistory(aReport.Template);
      Result := True;
    end;

end;

{------------------------------------------------------------------------------}
{ SaveTemplate}

procedure TppDesignerWindow.SaveTemplate(aReport: TppCustomReport);
begin

  if aReport = nil then Exit;

  if Assigned(FOnCustomSaveDoc) then
    FOnCustomSaveDoc(Self)
  else
    aReport.Template.Save;

end;


{------------------------------------------------------------------------------}
{ FileSaveTemplateClick}

procedure TppDesignerWindow.FileSaveClick(Sender: TObject);
begin

 if (FReport = nil) then Exit;

 SaveReport(FReport);

end;


{------------------------------------------------------------------------------}
{ FileSaveTemplateAsClick }

procedure TppDesignerWindow.FileSaveAsClick(Sender: TObject);
begin

 if (FReport = nil) then Exit;

 SaveReportAs(FReport);

end;

{------------------------------------------------------------------------------}
{ FileSaveSubreportClick }

procedure TppDesignerWindow.FileSaveSubreportClick(Sender: TObject);
begin

  if (FCurrentReport = nil) then Exit;

  SaveReportAs(FCurrentReport);

end;

{------------------------------------------------------------------------------}
{ LoadReportFromTemplateFile}

procedure TppDesignerWindow.LoadReportFromTemplateFile(aReport: TppCustomReport);
var
  lsSaveTemplateName: String;
  liOffset: Integer;
  lSaveTo: TppSaveToType;

begin

  if not CheckReportDelete or not CheckComponentAdd then Exit;

  if (aReport = nil) then Exit;

  {ask user whether to save changes for current template}
  if not SaveQuery(aReport) then Exit;

  {save current settings}
  lsSaveTemplateName := aReport.Template.Description;
  lSaveTo  := aReport.Template.SaveTo;
  liOffset := aReport.Template.Offset;

  if not aReport.Template.ShowFileOpenDialog then Exit;

  {modify settings}
  aReport.Template.SaveTo := stFile;

  {load template}
  try
    LoadTemplate(aReport);
  finally
    aReport.Template.SaveTo := lSaveTo;
    aReport.Template.OffSet := liOffset;
    aReport.Template.Description := lsSaveTemplateName;
    SetWindowCaption;
  end;


end;

{------------------------------------------------------------------------------}
{ mniFileLoadFromFileClick}

procedure TppDesignerWindow.mniFileLoadFromFileClick(Sender: TObject);
begin

  LoadReportFromTemplateFile(FReport);

end;

{------------------------------------------------------------------------------}
{ mniFileLoadSubreportFromFileClick}

procedure TppDesignerWindow.mniFileLoadSubreportFromFileClick(Sender: TObject);
begin
  LoadReportFromTemplateFile(FCurrentReport);

end;


{------------------------------------------------------------------------------}
{ SaveReportToTemplateFile}

procedure TppDesignerWindow.SaveReportToTemplateFile(aReport: TppCustomReport);
var
  lSaveTo: TppSaveToType;
  lsSaveTemplateName: String;

begin
  if (aReport = nil) then Exit;

  lSaveTo  := aReport.Template.SaveTo;
  lsSaveTemplateName := aReport.Template.Description;

  {modify settings}
  aReport.Template.SaveTo := stFile;

  try
    if aReport.Template.ShowFileSaveDialog then
      SaveTemplate(aReport);
   finally
    aReport.Template.SaveTo := lSaveTo;
    aReport.Template.Description := lsSaveTemplateName;
    SetWindowCaption;

  end;

end;


{------------------------------------------------------------------------------}
{ mniFileSaveToFileClick}

procedure TppDesignerWindow.mniFileSaveToFileClick(Sender: TObject);
begin
  SaveReportToTemplateFile(FReport);
end;


{------------------------------------------------------------------------------}
{ SaveSubReportToFile1Click}

procedure TppDesignerWindow.mniFileSaveSubReportToFileClick(Sender: TObject);
begin
  SaveReportToTemplateFile(FCurrentReport);

end;



{------------------------------------------------------------------------------}
{ FileSaveFormClick}


procedure TppDesignerWindow.FileSaveFormClick(Sender: TObject);
var
  lHandle  : THandle;
  lCtrlKey : TppKeyData;
  lSKey    : TppKeyData;


begin


  {build control key data rec}
  lCtrlKey.RepeatCount := 20;
  lCtrlKey.ScanCode    := MapVirtualKey(VK_CONTROL, 0);
  lCtrlKey.Flags       := 0;

  {build 'S' key data rec}
  lSKey.RepeatCount := 1;
  lSKey.ScanCode    := MapVirtualKey(Ord('S'), 0);
  lSKey.Flags       := 0;

 {send Ctrl + S key stroke combo to delphi }
 lHandle := FindWindow('TAppBuilder', nil);

 if (lHandle > 0) then
   begin
     PostMessage(lHandle, WM_SYSCOMMAND, SC_KEYMENU, 0);
     PostMessage(lHandle, WM_KEYDOWN, VK_CONTROL, LongInt(lCtrlKey));
     PostMessage(lHandle, WM_KEYDOWN, Ord('S'), LongInt(lSKey));
   end;

end;

{------------------------------------------------------------------------------}
{ FilePageSetupClick }

procedure TppDesignerWindow.FilePageSetupClick(Sender: TObject);
var
  lPageSetupDlg: TppCustomPageSetupDialog;
  lFormClass: TFormClass;

begin
  if (FCurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPageSetupDialog);
  
  lPageSetupDlg := TppCustomPageSetupDialog(lFormClass.Create(Self));
  lPageSetupDlg.Report := FCurrentReport;
  lPageSetupDlg.LanguageIndex := FCurrentReport.LanguageIndex;
  lPageSetupDlg.ShowModal;

  lPageSetupDlg.Release;

end;


{------------------------------------------------------------------------------}
{ FilePrintToFileSetupClick }

procedure TppDesignerWindow.FilePrintToFileSetupClick(Sender: TObject);
var
  lPrintToFileDlg: TppCustomPrintToFileSetupDialog;
  lFormClass: TFormClass;

begin
  if (FCurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPrintToFileSetupDialog);

  {call group dialog}
  lPrintToFileDlg := TppCustomPrintToFileSetupDialog(lFormClass.Create(Self));
  lPrintToFileDlg.Report        := FReport;
  lPrintToFileDlg.CurrentReport := FCurrentReport;
  lPrintToFileDlg.LanguageIndex := FCurrentReport.LanguageIndex;

  lPrintToFileDlg.ShowModal;

  lPrintToFileDlg.Release;

end; {procedure, mniFilePrintToFileSetupClick }

{------------------------------------------------------------------------------}
{ TppDesignerWindow.DocHistoryItemClick }

procedure TppDesignerWindow.DocHistoryItemClick(Sender: TObject);
var
  lsTemplateName: String;
  lsSaveTemplateName: String;
  lItemData: TStrings;
  liOffset: Integer;
  lSaveTo: TppSaveToType;

begin

  if not (Sender is TMenuItem) or (FReport = nil) then Exit;

  {get item data}
  lItemData := FDocHistory.GetItemData(TMenuItem(Sender));

  lsTemplateName := lItemData[0];

  {check whether this template is already loaded}
  if (lsTemplateName = FReport.Template.Description) then Exit;

  {ask user whether to save changes for current template}
  if not SaveQuery(FReport) then Exit;


  {save current template props}
  lsSaveTemplateName := FReport.Template.Description;
  lSaveTo  := FReport.Template.SaveTo;
  liOffset := FReport.Template.Offset;

  {set new template props}
  if lItemData.Count > 1 then
   FReport.Template.SaveTo := TppSaveToType(StrToInt(lItemData[1]));

  if lItemData.Count > 2 then
   FReport.Template.OffSet := StrToInt(lItemData[2]);

  FReport.Template.Description := lsTemplateName;

  {load template}
  try
    try
      LoadTemplate(FReport);
    finally
      {restore SaveTo and Description, if needed}
      if FReport.Template.SaveTo <> lSaveTo then
        begin
          FReport.Template.SaveTo := lSaveTo;
          FReport.Template.Description := lsSaveTemplateName;
        end;

      FReport.Template.OffSet := liOffset;

    end;

  except
    FReport.Template.Description := lsSaveTemplateName;
    raise;
  end;


end;

{-------------------------------------------------------------------------}
{ mniEditClick }

procedure TppDesignerWindow.mniEditClick(Sender: TObject);
var
  lbUndoEnabled : Boolean;

begin

  if ActiveControl = FPropEditBox then
    mniEditPaste.Enabled := FClipBoard.HasFormat(CF_TEXT)
  else
    mniEditPaste.Enabled := FClipBoard.HasFormat(CF_PPDATA);

  if ActiveControl = FPropEditBox then
    lbUndoEnabled := (FUndoText <> '')
  else
    lbUndoEnabled := (dsUndelete in FDesignerState);

  mniEditUndo.Enabled := True;

  {set menu caption}
  if lbUndoEnabled and (ActiveControl = FPropEditBox) then
    mniEditUndo.Caption := FMsgUndo
  else
    mniEditUndo.Caption := FMsgUndelete;

  mniEditUndo.Enabled := lbUndoEnabled;

end;



{------------------------------------------------------------------------------}
{ EditBringToFrontClick}

procedure TppDesignerWindow.EditBringToFrontClick(Sender: TObject);
var
  liSelection : Integer;
  lSelection: TList;

begin
  if (FCurrentObject = nil) then Exit;

  lSelection := TList.Create;

  {copy the selection}
  for liSelection := 0 to (FppSelection.Count - 1) do
    lSelection.Add(FppSelection.Items[liSelection]);

  {bring each item to front}
  for liSelection := 0 to (lSelection.Count - 1) do
    TppComponent(lSelection.Items[liSelection]).BringToFront;

  {restore the selection}
  for liSelection := 0 to (lSelection.Count - 1) do
    AddSelection(lSelection[liSelection]);

  ShowSelection(True);

  lSelection.Free;


end;

{------------------------------------------------------------------------------}
{ EditSendToBackClick }

procedure TppDesignerWindow.EditSendToBackClick(Sender: TObject);
var
  liSelection : Integer;
  lSelection: TList;

begin
  if (FCurrentObject = nil) then Exit;

  lSelection := TList.Create;

  {copy the selection}
  for liSelection := 0 to (FppSelection.Count - 1) do
    lSelection.Add(FppSelection.Items[liSelection]);

  {send each item to back}
  for liSelection := 0 to (lSelection.Count - 1) do
    TppComponent(lSelection.Items[liSelection]).SendToBack;

  {restore the selection}
  for liSelection := 0 to (lSelection.Count - 1) do
    AddSelection(lSelection[liSelection]);

  ShowSelection(True);

  lSelection.Free;


end;


{------------------------------------------------------------------------------}
{ EditUndoClick }

procedure TppDesignerWindow.EditUndoClick(Sender: TObject);
begin

  if (ActiveControl = FPropEditBox) and (FUndoText <> '') then
    begin
      FPropEditBox.Text := FUndoText;
      FUndoText := '';
    end
  else if (ActiveControl <> FPropEditBox) then
    UnDeleteSelection;

end;

{------------------------------------------------------------------------------}
{ EditCutClick }

procedure TppDesignerWindow.EditCutClick(Sender: TObject);
begin

  if ActiveControl = FPropEditBox then
    begin
      FUndoText := FPropEditBox.Text;
      FPropEditBox.CutToClipboard;
      mniEditPaste.Enabled := FClipBoard.HasFormat(CF_TEXT);
    end
  else
    begin
      SelectionToClipboard;
      DeleteSelection;
      Exclude(FDesignerState, dsUndelete);
      {enable paste option}
      mniEditPaste.Enabled := FClipBoard.HasFormat(CF_PPDATA);
    end;


end;

{------------------------------------------------------------------------------}
{ EditCopyClick }

procedure TppDesignerWindow.EditCopyClick(Sender: TObject);
begin

  if ActiveControl = FPropEditBox then
    begin
      FUndoText := '';
      FPropEditBox.CopyToClipboard;
      mniEditPaste.Enabled := FClipBoard.HasFormat(CF_TEXT);
    end
  else
    begin
     SelectionToClipboard;

     {enable paste option}
     mniEditPaste.Enabled := FClipBoard.HasFormat(CF_PPDATA);

    end;

end;

{------------------------------------------------------------------------------}
{ EditPasteClick }

procedure TppDesignerWindow.EditPasteClick(Sender: TObject);
begin
  if ActiveControl = FPropEditBox then
    FPropEditBox.PasteFromClipboard
  else
    ClipboardToSelection;

end;

{------------------------------------------------------------------------------}
{ EditDeleteClick }

procedure TppDesignerWindow.EditDeleteClick(Sender: TObject);
begin

  if ActiveControl = FPropEditBox then
    begin
      FUndoText := FPropEditBox.Text;
      FPropEditBox.ClearSelection;
    end
  else
    DeleteSelection;

end;


{------------------------------------------------------------------------------}
{ EditSelectAllClick }

procedure TppDesignerWindow.EditSelectAllClick(Sender: TObject);
var
  liBand,
  liObject : Integer;
  lBand  : TppBand;

begin

  if (FCurrentReport = nil) then Exit;

  if ActiveControl = FPropEditBox then
    FPropEditBox.SelectAll

  else

    begin
      ClearSelection(False);

      with FCurrentReport do
        for liBand := 0 to (BandCount - 1) do
          begin
            lBand := TppBand(Bands[liBand]);
            with lBand do
            for liObject := 0 to (ObjectCount - 1) do
              AddSelection(Objects[liObject]);
          end;
    end;
end;


{------------------------------------------------------------------------------}
{ FontNameChangeEvent }

procedure TppDesignerWindow.FontNameChangeEvent(Sender: TObject);
var
  liSelection: Integer;
  lComponent: TppComponent;
  lFont: TFont;

begin
  FDesignFont.CharSet :=  TppFontComboBox(Sender).CurrentFont.CharSet;
  FDesignFont.Name    := TppFontComboBox(Sender).CurrentFont.Name;

  lFont := TFont.Create;

  for liSelection := 0 to (FppSelection.Count - 1) do
    begin
      lComponent := TppComponent(FppSelection[liSelection]);

      if not lComponent.HasFont then Continue;

      lFont.Assign(lComponent.Font);
      lFont.CharSet := FDesignFont.CharSet;
      lFont.Name    := FDesignFont.Name;

      lComponent.Font := lFont;
      
    end;

  lFont.Free;

end;

{------------------------------------------------------------------------------}
{ FontSizeChangeEvent }

procedure TppDesignerWindow.FontSizeChangeEvent(Sender: TObject);
var
  liSelection: Integer;

begin

  try
    FDesignFont.Size := StrToInt(TComboBox(Sender).Text);

  except
    on E: EConvertError do
      FPropEditBox.Text := IntToStr(FDesignFont.Size);

  end;

  for liSelection := 0 to (FppSelection.Count - 1) do
    with TppComponent(FppSelection[liSelection]) do
      if HasFont then
        Font.Size := FDesignFont.Size;


end;

{------------------------------------------------------------------------------}
{ TextAlignLeftClick }

procedure TppDesignerWindow.TextAlignLeftClick(Sender: TObject);
begin
  FDesignJustifyText := taLeftJustify;
  DesignJustifyTextChange(Self);
end;

{------------------------------------------------------------------------------}
{ TextCenterClick}

procedure TppDesignerWindow.TextCenterClick(Sender: TObject);
begin
  FDesignJustifyText := taCenter;
  DesignJustifyTextChange(Self);
end;

{------------------------------------------------------------------------------}
{ TextAlignRightClick}

procedure TppDesignerWindow.TextAlignRightClick(Sender: TObject);
begin
  FDesignJustifyText := taRightJustify;
  DesignJustifyTextChange(Self);
end;

{------------------------------------------------------------------------------}
{ FontBoldClick}

procedure TppDesignerWindow.FontBoldClick(Sender: TObject);
begin

  if TppToolbarButton97(Sender).Down and not(fsBold in FDesignFont.Style) then
    begin
      FDesignFont.Style := FDesignFont.Style + [fsBold];
      AddFontStyleToSelection(fsBold);
    end
  else
    begin
      FDesignFont.Style := FDesignFont.Style - [fsBold];
      RemoveFontStyleFromSelection(fsBold);
    end;


end;

{------------------------------------------------------------------------------}
{FontItalicClick }

procedure TppDesignerWindow.FontItalicClick(Sender: TObject);
begin

  if TppToolbarButton97(Sender).Down and not(fsItalic in FDesignFont.Style) then
    begin
      FDesignFont.Style := FDesignFont.Style + [fsItalic];
      AddFontStyleToSelection(fsItalic);
    end
  else
    begin
      FDesignFont.Style := FDesignFont.Style - [fsItalic];
      RemoveFontStyleFromSelection(fsItalic);
    end;

end;

{------------------------------------------------------------------------------}
{ FontUnderlineClick }

procedure TppDesignerWindow.FontUnderlineClick(Sender: TObject);
begin

  if TppToolbarButton97(Sender).Down and not(fsUnderLine in FDesignFont.Style) then
    begin
      FDesignFont.Style := FDesignFont.Style + [fsUnderLine];
      AddFontStyleToSelection(fsUnderLine);
    end
  else
    begin
      FDesignFont.Style := FDesignFont.Style - [fsUnderLine];
      RemoveFontStyleFromSelection(fsUnderLine);
    end;

end;


{------------------------------------------------------------------------------}
{ mniViewClick }

procedure TppDesignerWindow.mniViewClick(Sender: TObject);
begin
  {set rulers check - based on whether rulers currently visible}
  mniViewRulers.Checked     := pnlHorizontalRuler.Visible;

  if FCurrentReport = nil then
     mniViewShowData.Enabled := False
  else
     mniViewShowData.Checked   := (pppcDisplayData in FCurrentReport.DesignState);

end;

{------------------------------------------------------------------------------}
{ mniViewShowDataClick }

procedure TppDesignerWindow.mniViewShowDataClick(Sender: TObject);
begin
  if (pppcDisplayData in FCurrentReport.DesignState) then
    FCurrentReport.DSExclude([pppcDisplayData])
  else
    FCurrentReport.DSInclude([pppcDisplayData]);
end;

{------------------------------------------------------------------------------}
{ CallViewRulersClick }

procedure TppDesignerWindow.CallViewRulersClick(Sender: TObject);
begin
  mniViewRulersClick(Sender);
end;

{------------------------------------------------------------------------------}
{ mniViewRulersClick }

procedure TppDesignerWindow.mniViewRulersClick(Sender: TObject);
begin
  mniViewRulers.Checked   := not mniViewRulers.Checked;

  {show/hide ruler panels}
  pnlHorizontalRuler.Visible :=  mniViewRulers.Checked;
  pnlVerticalRuler.Visible   :=  mniViewRulers.Checked;

end;


{------------------------------------------------------------------------------}
{ TppDesignerWindow.mniViewObjectInspectorClick }

procedure TppDesignerWindow.mniViewObjectInspectorClick(Sender: TObject);
var
  lHandle: THandle;
  lSKey: TppKeyData;

begin
  {build 'F11' key data rec}
  lSKey.RepeatCount := 1;
  lSKey.ScanCode    := MapVirtualKey(VK_F11, 0);
  lSKey.Flags       := 0;

  {send F11 key stroke to delphi }
  lHandle := FindWindow('TAppBuilder', nil);

  if (lHandle > 0) then
    PostMessage(lHandle, WM_KEYDOWN, VK_F11, LongInt(lSKey));

end;

{------------------------------------------------------------------------------}
{ mniReportClick }

procedure TppDesignerWindow.mniReportClick(Sender: TObject);
var
  lBand : TppBand;

begin
  {determine which band options should be checked}

  if (FCurrentReport = nil) then Exit;

  lBand := FCurrentReport.GetBand(btTitle, 0);
  mniReportTitle.Checked := (lBand <> nil);

  lBand := FCurrentReport.GetBand(btSummary, 0);
  mniReportSummary.Checked := (lBand <> nil);

  lBand := FCurrentReport.GetBand(btHeader, 0);
  mniReportHeader.Checked := (lBand <> nil);

  lBand := FCurrentReport.GetBand(btFooter, 0);
  mniReportFooter.Checked := (lBand <> nil);

  lBand := FCurrentReport.GetBand(btPageStyle, 0);
  mniReportPageStyle.Checked := (lBand <> nil);

  mniReportCachePages.Enabled := (FReport = FCurrentReport);
  mniReportCachePages.Checked := FReport.CachePages;

  mniReportPassSetting.Enabled  := (FReport = FCurrentReport);
  mniPassSettingOnePass.Checked := (FReport.PassSetting = psOnePass);
  mniPassSettingTwoPass.Checked := (FReport.PassSetting = psTwoPass);

  mniReportPortrait.Checked  := (FCurrentReport.PrinterSetup.Orientation = poPortrait);
  mniReportLandscape.Checked := (FCurrentReport.PrinterSetup.Orientation = poLandscape);

end;


{------------------------------------------------------------------------------}
{ mniReportPageStyleClick }

procedure TppDesignerWindow.mniReportPageStyleClick(Sender: TObject);
begin
  mniReportPageStyle.Checked := not mniReportPageStyle.Checked;

  if mniReportPageStyle.Checked then
    bndAdd(TppPageStyle)
  else
    bndRemove(btPageStyle);

end; {procedure, mniReportPageStyleClick}

{------------------------------------------------------------------------------}
{ mniReportTitleClick }

procedure TppDesignerWindow.mniReportTitleClick(Sender: TObject);

begin
  mniReportTitle.Checked   := not mniReportTitle.Checked;

  if mniReportTitle.Checked then
    bndAdd(TppTitleBand)
  else
    bndRemove(btTitle);

end; {procedure, mniReportTitleClick}

{------------------------------------------------------------------------------}
{ mniReportSummaryClick }

procedure TppDesignerWindow.mniReportSummaryClick(Sender: TObject);

begin
  mniReportSummary.Checked   := not mniReportSummary.Checked;

  if mniReportSummary.Checked then
    bndAdd(TppSummaryBand)
  else
    bndRemove(btSummary);

end; {procedure, mniReportSummaryClick}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.mniReportHeaderClick }

procedure TppDesignerWindow.mniReportHeaderClick(Sender: TObject);
begin

 mniReportHeader.Checked   := not mniReportHeader.Checked;

  if mniReportHeader.Checked then
    bndAdd(TppHeaderBand)
  else
    bndRemove(btHeader);

end; {procedure, mniReportHeaderClick}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.mniReportFooterClick }

procedure TppDesignerWindow.mniReportFooterClick(Sender: TObject);
begin
  mniReportFooter.Checked   := not mniReportFooter.Checked;

  if mniReportFooter.Checked then
    bndAdd(TppFooterBand)
  else
    bndRemove(btFooter);

  FWorkspace.FooterBackground := mniReportFooter.Checked;
  
end; {procedure, mniReportFooterClick}

{------------------------------------------------------------------------------}
{ mniReportDataClick }

procedure TppDesignerWindow.mniReportDataClick(Sender: TObject);
var
  lFormClass : TFormClass;
  lDataDialog: TppCustomDataDialog;
  lDetailBand: TppDetailBand;

begin
  if (FCurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomDataDialog);

  {create data dialog}
  lDataDialog := TppCustomDataDialog(lFormClass.Create(Self));
  lDataDialog.Report := FCurrentReport;
  lDataDialog.LanguageIndex := FCurrentReport.LanguageIndex;

  {initialize data pipeline props}
  lDataDialog.MasterDataPipeline := FCurrentReport.DataPipeline;

  lDetailBand := TppDetailBand(FCurrentReport.GetBand(btDetail, 0));
  lDataDialog.DetailDataPipeline := lDetailBand.DataPipeline;

  {show pipeline}
  if (lDataDialog.ShowModal = mrOK) then
    begin

      {assign data pipeline props}
      if (lDataDialog.MasterDataPipeline = nil) or
         (lDataDialog.MasterDataPipeline is TppDataPipeline) then
        FCurrentReport.DataPipeline := TppDataPipeline(lDataDialog.MasterDataPipeline);

      if (lDataDialog.DetailDataPipeline = nil) or
         (lDataDialog.DetailDataPipeline is TppDataPipeline) then
        lDetailBand.DataPipeline :=  TppDataPipeline(lDataDialog.DetailDataPipeline);

      ComponentModified;

    end; {mrOK}

 lDataDialog.Free;


end; {procedure, mniReportDataClick }


{------------------------------------------------------------------------------}
{ mniReportGroupsClick }

procedure TppDesignerWindow.mniReportGroupsClick(Sender: TObject);
var
  lFormClass : TFormClass;
  lGroupDialog: TppCustomGroupDialog;

begin
  if (FCurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomGroupDialog);

  {call group dialog}
  lGroupDialog := TppCustomGroupDialog(lFormClass.Create(Self));
  lGroupDialog.Report := FCurrentReport;
  lGroupDialog.LanguageIndex := FCurrentReport.LanguageIndex;

  if (FFieldAliases.Count > 0) then
    begin
      lGroupDialog.FieldAliases := FFieldAliases;
      lGroupDialog.OnGetFieldForAlias := FOnGetFieldForAlias;
    end;

  if (lGroupDialog.ShowModal = mrOK) then
    begin
      ArrangeWorkspace;
      ShowSelection(True);
      ComponentModified;;

    end; {mrOK}

 lGroupDialog.Free;


end; {procedure, mniReportGroupsClick }

{------------------------------------------------------------------------------}
{ mniReportPortraitClick}

procedure TppDesignerWindow.mniReportPortraitClick(Sender: TObject);
begin

  if (FCurrentReport = nil) then Exit;

  if FCurrentReport.PrinterSetup.Orientation <> poPortrait then
    FCurrentReport.PrinterSetup.Orientation := poPortrait;

end;

{------------------------------------------------------------------------------}
{ mniReportLandscapeClick}

procedure TppDesignerWindow.mniReportLandscapeClick(Sender: TObject);
begin

  if (FCurrentReport = nil) then Exit;

  if FCurrentReport.PrinterSetup.Orientation <> poLandscape then
    FCurrentReport.PrinterSetup.Orientation := poLandscape;

end;
{------------------------------------------------------------------------------}
{ mniPassSettingOnePassClick}

procedure TppDesignerWindow.mniPassSettingClick(Sender: TObject);
begin
  if (FReport = nil) then Exit;
  FReport.PassSetting := TppPassSettingType(TComponent(Sender).Tag);
end;

{------------------------------------------------------------------------------}
{ mniReportCachePagesClick}

procedure TppDesignerWindow.mniReportCachePagesClick(Sender: TObject);
begin
  if (FReport = nil) then Exit;
  FReport.CachePages := not FReport.CachePages;
end;

{------------------------------------------------------------------------------}
{ mniReportUnitsClick}

procedure TppDesignerWindow.mniReportUnitsClick(Sender: TObject);
begin

  if (FCurrentReport = nil) then Exit;

  mniReportUnitsScreenPixels.Checked  := (FCurrentReport.Units = utScreenPixels);
  mniReportUnitsPrinterPixels.Checked := (FCurrentReport.Units = utPrinterPixels);
  mniReportUnitsInches.Checked        := (FCurrentReport.Units = utInches);
  mniReportUnitsMillimeters.Checked   := (FCurrentReport.Units = utMillimeters);
  mniReportUnitsMMThousandths.Checked := (FCurrentReport.Units = utMMThousandths);

end;

{------------------------------------------------------------------------------}
{ mniReportUnitsScreenPixelsClick}

procedure TppDesignerWindow.mniReportUnitsScreenPixelsClick(Sender: TObject);
begin
  if (FCurrentReport <> nil) then
    FCurrentReport.Units := utScreenPixels;
end; {procedure, mniReportUnitsScreenPixelsClick}

{------------------------------------------------------------------------------}
{ mniReportUnitsThousandthsOfMMClick}

procedure TppDesignerWindow.mniReportUnitsMMThousandthsClick(
  Sender: TObject);
begin
  if (FCurrentReport <> nil) then
    FCurrentReport.Units := utMMThousandths;
end; {procedure, mniReportUnitsThousandthsOfMMClick}

{------------------------------------------------------------------------------}
{ mniReportUnitsPrinterPixelsClick}

procedure TppDesignerWindow.mniReportUnitsPrinterPixelsClick(
  Sender: TObject);
begin
  if (FCurrentReport <> nil) then
    FCurrentReport.Units := utPrinterPixels;
end; {procedure, mniReportUnitsPrinterPixelsClick}

{------------------------------------------------------------------------------}
{ mniReportUnitsInchesClick}

procedure TppDesignerWindow.mniReportUnitsInchesClick(Sender: TObject);
begin
  if (FCurrentReport <> nil) then
    FCurrentReport.Units := utInches;
end;

{------------------------------------------------------------------------------}
{ mniReportUnitsMillimetersClick}

procedure TppDesignerWindow.mniReportUnitsMillimetersClick(Sender: TObject);
begin
  if (FCurrentReport <> nil) then
    FCurrentReport.Units := utMillimeters;
end;

{------------------------------------------------------------------------------}
{ mniReportUnitsPixelsClick}

procedure TppDesignerWindow.mniReportUnitsPixelsClick(Sender: TObject);
begin
  if (FCurrentReport <> nil) then
    FCurrentReport.Units := utScreenPixels;
end;

{------------------------------------------------------------------------------}
{ mniHelpAboutClick}

procedure TppDesignerWindow.mniHelpAboutClick(Sender: TObject);
var
  lAboutDlg : TppCustomAboutDialog;
  lFormClass: TFormClass;

begin

  lFormClass := ppGetFormClass(TppCustomAboutDialog);

  lAboutDlg := TppCustomAboutDialog(lFormClass.Create(Self));
  lAboutDlg.ShowModal;
  lAboutDlg.Free;

end;


{------------------------------------------------------------------------------}
{ mniHelpReportBuilderTopicsClick}

procedure TppDesignerWindow.mniHelpTopicsClick(Sender: TObject);
var
  lsDelphiHelpFile : String;
  lsDelphiPath: String;

begin
  lsDelphiPath := ppGetDelphiPath;

  if (lsDelphiPath = '') then Exit;

  lsDelphiHelpFile := Application.HelpFile;
  Application.HelpFile := lsDelphiPath + 'Help\RBuilder.HLP';

  Application.HelpCommand(HELP_FINDER, 0);
  Application.HelpFile := lsDelphiHelpFile;

end;

{******************************************************************************
 *
 ** P O P U P M E N U  S T U F F
 *
 ******************************************************************************}


{------------------------------------------------------------------------------}
{ TppDesigner.PopupMenuClick}

procedure TppDesignerWindow.PopupMenuClick(Sender: TObject);
var
  lCursorPos,
  lPoint: TPoint;
  lbFound: Boolean;
  lControl: TControl;
  lBand: TppBand;
  liBand: Integer;
  liBands: Integer;

begin
  if (FCurrentReport = nil) then Exit;

  FPopUpComponent := nil;

  {get popup menu's screen coordinates}
  GetCursorPos(lCursorPos);
  lPoint    := FWorkSpace.ScreenToClient(lCursorPos);

  {get design control at those coordinates}
  lControl  := FWorkSpace.ControlAtPos(lPoint, True);

  if (Sender is TppBandPopupMenu) then
    begin

      lbFound := False;
      liBand  := 0;
      liBands := FCurrentReport.BandCount;
      lBand   := nil;

      while not lbFound and (liBand < liBands) do
        begin
          lBand := FCurrentReport.Bands[liBand];
          if ( (lBand.DesignControl.Top - lBand.spHeight) <= lPoint.Y ) and
             ( (lBand.DesignControl.Top + lBand.DesignControl.Height) >= lPoint.Y ) then
            lbFound := True
          else
            Inc(liBand);

        end;


      if lbFound then
        lBand.PopupMenuClick(Sender);
    end
  else if (lControl <> nil) and (lControl.Tag <> 0) then
    begin

      {call ppComponent's PopupMenuClick method}
      FPopUpComponent := TppComponent(lControl.Tag);
      FPopUpComponent.PopupMenuClick(Sender);

    end;


end; {procedure, PopupMenuClick}



{------------------------------------------------------------------------------}
{ TppDesigner.stbStatusBarResize}

procedure TppDesignerWindow.stbStatusBarResize(Sender: TObject);
begin

  if pgcDesigner.ActivePage <> tshDesign then Exit;

  stbStatusBar.Panels[0].Width := stbStatusBar.Width -
                                  (stbStatusBar.Panels[1].Width + stbStatusBar.Panels[2].Width +
                                  stbStatusBar.Panels[3].Width + stbStatusBar.Panels[4].Width) - 20;

end;


{------------------------------------------------------------------------------}
{ TppDesigner.InitializeStatusBar}

procedure TppDesignerWindow.InitializeStatusBar;
var
  liPanel: Integer;
  lStatusPanel: TStatusPanel;

begin

  stbStatusBar.Panels.BeginUpdate;
  stbStatusBar.Panels.Clear;

  for liPanel := 0 to 4 do
    begin
      lStatusPanel := stbStatusBar.Panels.Add;
      lStatusPanel.Width := 90;
    end;

  stbStatusBarResize(Self);

  stbStatusBar.Panels.EndUpdate;

end;


{******************************************************************************
 *
 ** V I E W E R  S T U F F
 *
 ******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.ViewerPrintStateChangeEvent}

procedure TppDesignerWindow.ViewerPrintStateChangeEvent(Sender: TObject);
var
  lPosition: TPoint;
begin

  if FViewer.Busy then
    begin
      mskPreviewPercentage.Enabled := False;
      mskPreviewPage.Enabled := False;

      pnlPreviewBar.Cursor := crHourGlass;

      FViewer.Cursor := crHourGlass;

      stbStatusBar.Cursor := crHourGlass;

      spbPreviewCancel.Cursor := crArrow;

      spbPreviewCancel.Enabled := True;
    end
  else
    begin
      mskPreviewPercentage.Enabled := True;
      mskPreviewPage.Enabled := True;

      pnlPreviewBar.Cursor := crDefault;

      FViewer.Cursor := crDefault;

      stbStatusBar.Cursor := crDefault;

      spbPreviewCancel.Cursor := crDefault;

      spbPreviewCancel.Enabled := False;
    end;

  {this code will force the cursor to update}
  GetCursorPos(lPosition);
  SetCursorPos(lPosition.X, lPosition.Y);

end;


{------------------------------------------------------------------------------}
{ TppDesignerWindow.ViewerStatusChangeEvent}

procedure TppDesignerWindow.ViewerStatusChangeEvent(Sender: TObject);
begin
  if not Viewer.Busy then Exit;

  stbStatusBar.SimpleText := FViewer.Status;

end;


{------------------------------------------------------------------------------}
{ TppDesigner.ViewerPageChangeEvent}

procedure TppDesignerWindow.ViewerPageChangeEvent(Sender: TObject);
begin
  mskPreviewPage.Text := IntToStr(FViewer.AbsolutePageNo);
  mskPreviewPercentage.Text := IntToStr(FViewer.CalculatedZoom);
end;

{------------------------------------------------------------------------------}
{ TppDesigner.spbPreviewPrintClick}

procedure TppDesignerWindow.FilePrintClick(Sender: TObject);
begin

  if FReport = nil then Exit;

  FReport.DSInclude([pppcDesignPrinting]);
  try
    FViewer.Print;
  except
    FReport.DSExclude([pppcDesignPrinting]);
  end;

end; {procedure, FReport}

{------------------------------------------------------------------------------}
{ TppDesigner.spbPreviewWholeClick}

procedure TppDesignerWindow.spbPreviewWholeClick(Sender: TObject);
begin
  FViewer.ZoomSetting := zsWholePage;

  mskPreviewPercentage.Text := IntToStr(FViewer.CalculatedZoom);

  stbStatusBar.SetFocus;

end; {procedure, spbPreviewWholeClick}

{------------------------------------------------------------------------------}
{ TppDesigner.spbPreviewAutoSearchClick}

procedure TppDesignerWindow.spbPreviewAutoSearchClick(Sender: TObject);
begin

  FViewer.DisplayAutoSearchDialog;

end; {procedure, spbPreviewAutoSearchClick}


{------------------------------------------------------------------------------}
{ TppDesigner.spbPreviewWidthClick}
procedure TppDesignerWindow.spbPreviewWidthClick(Sender: TObject);
begin
  FViewer.ZoomSetting := zsPageWidth;
  
  mskPreviewPercentage.Text := IntToStr(FViewer.CalculatedZoom);

  stbStatusBar.SetFocus;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.spbPreview100Click}

procedure TppDesignerWindow.spbPreview100Click(Sender: TObject);
begin
  FViewer.ZoomSetting := zs100Percent;
  mskPreviewPercentage.Text := IntToStr(FViewer.CalculatedZoom);

  stbStatusBar.SetFocus;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.spbPreviewFirstClick}

procedure TppDesignerWindow.spbPreviewFirstClick(Sender: TObject);
begin
 FViewer.FirstPage;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.spbPreviewPriorClick}

procedure TppDesignerWindow.spbPreviewPriorClick(Sender: TObject);
begin
  FViewer.PriorPage;
end;
{------------------------------------------------------------------------------}
{ TppDesigner.spbPreviewZoomClick}

procedure TppDesignerWindow.spbPreviewNextClick(Sender: TObject);
begin
  FViewer.NextPage;
end;

{------------------------------------------------------------------------------}
{ TppDesigner.spbPreviewZoomClick}

procedure TppDesignerWindow.spbPreviewLastClick(Sender: TObject);
begin
  FViewer.LastPage;
end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.mskPreviewPageKeyPress}

procedure TppDesignerWindow.mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
var
  liPage: Longint;
begin

  if (Key = #13) then
    begin
      liPage := StrToInt(mskPreviewPage.Text);

      FViewer.GotoPage(liPage);
    end; {if, carriage return pressed}


end;



{------------------------------------------------------------------------------}
{ TppDesignerWindow.mskPreviewPercentageKeyPress}

procedure TppDesignerWindow.mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
var
  liPercentage: Integer;
begin
  if (Key = #13) then
    begin
      liPercentage := StrToIntDef(mskPreviewPercentage.Text, 100);

      FViewer.ZoomPercentage := liPercentage;

      FPreviewWholeBtn.Down := False;
      FPreviewWidthBtn.Down := False;
      FPreview100Btn.Down := False;

      mskPreviewPercentage.Text := IntToStr(FViewer.CalculatedZoom);
    end; {if, carriage return pressed}

end; {procedure, mskPreviewPercentageKeyPress}

           
{------------------------------------------------------------------------------}
{ TppDesignerWindow.spbPreviewCancelClick }

procedure TppDesignerWindow.spbPreviewCancelClick(Sender: TObject);
begin
  if (FReport <> nil) and FReport.Printing then
    FViewer.Cancel;
end; {procedure, spbPreviewCancelClick}


{------------------------------------------------------------------------------}
{ TppDesignerWindow.SetLanguage }

procedure TppDesignerWindow.SetLanguage;
var
  llIndex: Longint;
  lBitMap: TBitmap;
  liPage: Integer;
  lDesignModule: TppDesignModule;

begin

  if (FReport = nil) or  (FToolbarManager = nil) then Exit;

  if (dsRestoringReportState in FDesignerState) then Exit;

  {update resource manager's lang setting}
  if (FReport.Language <> ppResourceManager.Language) then
     ppResourceManager.SetLanguage(FReport.Language);


  llIndex := FReport.LanguageIndex;



  {if (FToolbarManager.LanguageIndex = llIndex) then Exit;}
  FToolbarManager.LanguageIndex := llIndex;

  FUntitled   := ppLoadStr(571); {'New Report'}
  FMsgReady   := ppLoadStr(180);
  FMsgObject  := ppLoadStr(269);
  FMsgObjects := ppLoadStr(270);
  FMsgLeft    := ppLoadStr(181);
  FMsgTop     := ppLoadStr(182);
  FMsgWidth   := ppLoadStr(183);
  FMsgHeight  := ppLoadStr(184);

  FMsgUndo       := ppLoadStr(130);
  FMsgUndelete   := ppLoadStr(129);

  if (stbStatusBar <> nil) and (stbStatusBar.Panels.Count = 5) then
    begin
      stbStatusBar.Panels[0].Text  := FMsgReady;
      stbStatusBar.Panels[1].Text  := FMsgLeft + ': ';
      stbStatusBar.Panels[2].Text  := FMsgTop + ': ';
      stbStatusBar.Panels[3].Text  := FMsgWidth + ': ';
      stbStatusBar.Panels[4].Text  := FMsgHeight + ': ';
    end;

  tshDesign.Caption    := ppLoadStr(185);
  tshPreview.Caption   := ppLoadStr(186);


  mniFile.Caption          := ppLoadStr(131);
  mniFileNew.Caption       := ppLoadStr(133) + '...';
  mniFileNewReport.Caption := ppLoadStr(572);
  mniFileOpen.Caption      := ppLoadStr(134);
  mniFileClose.Caption     := ppLoadStr(132);
  mniFileSave.Caption      := ppLoadStr(138);
  mniFileSaveAs.Caption    := ppLoadStr(139);

  mniFileLoadSubReport.Caption := ppLoadStr(696); {'&Load SubReport...'}
  mniFileSaveSubReport.Caption := ppLoadStr(697); {'S&ave SubReport...'}

  mniFileSaveForm.Caption  := ppLoadStr(140);

  mniFileLoadFromFile.Caption := ppLoadStr(698); {'Loa&d From File...'}
  mniFileSaveToFile.Caption := ppLoadStr(699); {'Sa&ve to File...'}

  mniFileLoadSubReportFromFile.Caption := ppLoadStr(700); {'Load SubReport From File...'}
  mniFileSaveSubReportToFile.Caption   := ppLoadStr(1101); {'Save SubReport To File...'}

  mniFilePageSetup.Caption := ppLoadStr(135);
  mniFilePrint.Caption     := ppLoadStr(136);
  mniFilePrintToFileSetup.Caption  := ppLoadStr(137);

  mniEdit.Caption             := ppLoadStr(120);
  mniEditUndo.Caption         := FMsgUndo;
  mniEditRedo.Caption         := ppLoadStr(126);
  mniEditCut.Caption          := ppLoadStr(123);
  mniEditCopy.Caption         := ppLoadStr(122);
  mniEditPaste.Caption        := ppLoadStr(125);
  mniEditDelete.Caption       := ppLoadStr(124);
  mniEditSelectAll.Caption    := ppLoadStr(127);
  mniEditBringToFront.Caption := ppLoadStr(121);
  mniEditSendToBack.Caption   := ppLoadStr(128);

  mniView.Caption             := ppLoadStr(155);
  mniView.Items[0].Caption    := ppLoadStr(499);  {Toolbars}

  mniViewRulers.Caption           := ppLoadStr(158);
  mniViewRulers.Caption           := ppLoadStr(158);
  mniViewGridOptions.Caption      := ppLoadStr(344) + '...';
  mniViewShowData.Caption         := ppLoadStr(159);
 { mniViewObjectInspector          := '&Object Inspector';}

  mniReport.Caption                 := ppLoadStr(145);
  mniReportData.Caption             := ppLoadStr(394);
  mniReportGroups.Caption           := ppLoadStr(146);
  mniReportLandscape.Caption        := ppLoadStr(147);
  mniReportPortrait.Caption         := ppLoadStr(148);
  mniReportSummary.Caption          := ppLoadStr(149);
  mniReportTitle.Caption            := ppLoadStr(150);
  mniReportHeader.Caption           := ppLoadStr(193);
  mniReportFooter.Caption           := ppLoadStr(190);
  mniReportPageStyle.Caption        := ppLoadStr(691);
  mniReportUnits.Caption            := ppLoadStr(151);
  mniReportUnitsInches.Caption        := ppLoadStr(152);
  mniReportUnitsMillimeters.Caption   := ppLoadStr(153);
  mniReportUnitsScreenPixels.Caption  := ppLoadStr(387);
  mniReportUnitsPrinterPixels.Caption := ppLoadStr(388);
  mniReportUnitsMMThousandths.Caption := ppLoadStr(389);
  mniReportCachePages.Caption         := ppLoadStr(1113); {'&Cache Pages'}
  mniReportPassSetting.Caption        := ppLoadStr(1114); {'P&ass Setting'}
  mniPassSettingOnePass.Caption       := ppLoadStr(1115); {'&One Pass'}
  mniPassSettingTwoPass.Caption       := ppLoadStr(1116); {'&Two Pass'}

  mniHelp.Caption         := ppLoadStr(142);
  mniHelpAbout.Caption    := ppLoadStr(143);
  mniHelpContents.Caption := ppLoadStr(144);

  {note: this button is only created at design-time}
  if (FSelectReportBtn <> nil) then
    FSelectReportBtn.Hint      := ppLoadStr(392);

  spbPreviewCancel.Hint      := ppLoadStr(ppMsgCancel);
  FPreviewPrintBtn.Hint      := ppLoadStr(22);
  FPreviewWholeBtn.Hint      := ppLoadStr(30);
  FPreviewWidthBtn.Hint      := ppLoadStr(31);
  FPreview100Btn.Hint        := ppLoadStr(1); {'100 %'}
  FPreviewFirstBtn.Hint      := ppLoadStr(13);
  FPreviewPriorBtn.Hint      := ppLoadStr(29);
  FPreviewNextBtn.Hint       := ppLoadStr(15);
  FPreviewLastBtn.Hint       := ppLoadStr(14);
  FPreviewAutoSearchBtn.Hint := ppLoadStr(1021);

  spbPreviewCancel.Caption   := ppLoadStr(ppMsgCancel);

  lBitMap := TBitMap.Create;
  spbPreviewCancel.Width := lBitMap.Canvas.TextWidth(spbPreviewCancel.Caption) + 30;
  lBitMap.Free;


  {set caption of 'main' tab}
  if (tbsReport.Tabs.Count > 0) then
    tbsReport.Tabs[0] := ppLoadStr(374);


  {update page captions}
  for liPage := pgcDesigner.PageCount-1 downto 0  do
   begin
     lDesignModule := GetDesignModuleForPage(liPage);

     if (lDesignModule <> nil) then
       begin
         lDesignModule.LanguageIndex := llIndex;
         pgcDesigner.Pages[liPage].Caption := lDesignModule.Caption;

       end;

   end;


  SetLanguageOfRulers;

end; {procedure, SetLanguage}

{------------------------------------------------------------------------------}
{ TppDesignerWindow.SetLanguageOfRulers }

procedure TppDesignerWindow.SetLanguageOfRulers;
var
  liBands:Integer;
  liBand: Integer;

begin
  if (FWorkSpaceRuler <> nil) then
    FWorkspaceRuler.Language := FReport.Language;

  if (FCurrentReport = nil) then Exit;

  liBands := FCurrentReport.BandCount;

  for liBand := 0 to liBands-1 do
    FCurrentReport.Bands[liBand].Ruler.Language := FReport.Language;

end; {procedure, SetLanguageOfRulers}



{------------------------------------------------------------------------------}
{ LoadStateInfo }

procedure TppDesignerWindow.LoadStateInfo;
var
  lIniFile: TIniFile;
  lScreenRes: TPoint;
  liLeft: Integer;
  liTop: Integer;
  liWidth: Integer;
  liHeight: Integer;
  liWindowState: Integer;

begin

  lIniFile := TIniFile.Create('RBuilder.ini');

  {set initial size based on screen res}
  lScreenRes := ppGetScreenRes;

  {calc default screen size }

  {set size based on 1024 x 768 }
  liWidth  := 790;
  liHeight := 600;

  if lScreenRes.X <> 1024 then
    begin
      liWidth  := (liWidth  * lScreenRes.X)  div 1024;
      liHeight := (Height * lScreenRes.Y) div 768;
    end;


  {default to center of screen}
  liLeft := (Screen.Width  - liWidth)  div 2;
  liTop  := (Screen.Height - liHeight) div 2;


 if FDesignTime then
   FFreeOnClose := lIniFile.ReadBool('Designer Preferences', 'FreeOnClose', True);

  liWindowState := lIniFile.ReadInteger('Designer Position', 'WindowState', Ord(wsNormal));

  if TWindowState(liWindowState) = wsNormal then
    begin

      {load positions from ini file}
      liLeft   := lIniFile.ReadInteger('Designer Position', 'Left',   liLeft);
      liTop    := lIniFile.ReadInteger('Designer Position', 'Top',    liTop);
      liWidth  := lIniFile.ReadInteger('Designer Position', 'Width',  liWidth);
      liHeight := lIniFile.ReadInteger('Designer Position', 'Height', liHeight);

    end;

  SetBounds(liLeft, liTop, liWidth, liHeight);

  if TWindowState(liWindowState) <> wsMinimized then
    WindowState :=  TWindowState(liWindowState);

  {read grid options from ini file {default grid to off and gridspace to 8 by 8) }
  FSnapToGrid  := lIniFile.ReadBool('Grid Options',    'SnapToGrid',  False);
  FDisplayGrid := lIniFile.ReadBool('Grid Options',    'DisplayGrid', False);
  FXGridSpace  := lIniFile.ReadInteger('Grid Options', 'XGridSpace',  8);
  FYGridSpace  := lIniFile.ReadInteger('Grid Options', 'YGridSpace',  8);

  if FXGridSpace = 0 then
   FXGridSpace := 8;

  if FYGridSpace = 0 then
   FYGridSpace := 8;

  lIniFile.Free;

  NotifyDesignModules(ppdmLoadState);


end;

{------------------------------------------------------------------------------}
{ SaveStateInfo }

procedure TppDesignerWindow.SaveStateInfo;
var
  lIniFile: TIniFile;

begin
  lIniFile := TIniFile.Create('RBuilder.ini');

  if FDesignTime then
    lIniFile.WriteBool('Designer Preferences', 'FreeOnClose', FFreeOnClose);

  lIniFile.WriteInteger('Designer Position', 'WindowState', Ord(WindowState));

  lIniFile.WriteInteger('Designer Position', 'Left',   Left);
  lIniFile.WriteInteger('Designer Position', 'Top',    Top);
  lIniFile.WriteInteger('Designer Position', 'Width',  Width);
  lIniFile.WriteInteger('Designer Position', 'Height', Height);

  {save grid options to ini file }
  lIniFile.EraseSection('Grid Options');
  lIniFile.WriteBool('Grid Options',    'SnapToGrid',  FSnapToGrid);
  lIniFile.WriteBool('Grid Options',    'DisplayGrid', FDisplayGrid);
  lIniFile.WriteInteger('Grid Options', 'XGridSpace',  FXGridSpace);
  lIniFile.WriteInteger('Grid Options', 'YGridSpace',  FYGridSpace);

  lIniFile.Free;

  NotifyDesignModules(ppdmSaveState);


  if (FToolbarManager <> nil) then
    FToolbarManager.SaveToolWindowPreferences;


end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.SetSnapToGrid }

procedure TppDesignerWindow.SetSnapToGrid(Value: Boolean);
begin
  FSnapToGrid := Value;
end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.SetDisplayGrid }

procedure TppDesignerWindow.SetDisplayGrid(Value: Boolean);
begin
  {disabled due to problems with screen flashing}
  {FDisplayGrid := Value;

  FWorkSpace.DisplayGrid := FDisplayGrid;}
end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.SetXGridSpace }

procedure TppDesignerWindow.SetXGridSpace(Value: Integer);
begin
  FXGridSpace := Value;

  FWorkSpace.XGridSpace := FXGridSpace;
end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.SetYGridSpace }

procedure TppDesignerWindow.SetYGridSpace(Value: Integer);
begin
  FYGridSpace := Value;

  FWorkSpace.YGridSpace := FYGridSpace;
end;

{------------------------------------------------------------------------------}
{ TppDesignerWindow.mniGridOptionsClick }

procedure TppDesignerWindow.mniViewGridOptionsClick(Sender: TObject);
var
  lGridDlg : TppCustomGridDialog;
  lFormClass: TFormClass;
  
begin

  if (FReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomGridDialog);

  lGridDlg := TppCustomGridDialog(lFormClass.Create(Self));
  lGridDlg.LanguageIndex := FReport.LanguageIndex;

  lGridDlg.SnapToGrid  := FSnapToGrid;
  lGridDlg.DisplayGrid := FDisplayGrid;
  lGridDlg.XGridSpace  := FXGridSpace;
  lGridDlg.YGridSpace  := FYGridSpace;

  if (lGridDlg.ShowModal = mrOK) then
    begin
      SetSnapToGrid(lGridDlg.SnapToGrid);
      SetDisplayGrid(lGridDlg.DisplayGrid);
      SetXGridSpace(lGridDlg.XGridSpace);
      SetYGridSpace(lGridDlg.YGridSpace);
    end;

  lGridDlg.Free;

end;


{------------------------------------------------------------------------------}
{ GetComponentClasses }

function TppDesignerWindow.GetComponentClasses: TStrings;
begin
  Result := FToolbarManager.ComponentClasses;
end; {function, GetComponentClasses}

{------------------------------------------------------------------------------}
{ SetComponentClasses }

procedure TppDesignerWindow.SetComponentClasses(aComponentClasses: TStrings);
begin
  FToolbarManager.ComponentClasses := aComponentClasses;
end; {function, SetComponentClasses}




{------------------------------------------------------------------------------}
{ TppDesignerWindow.SetRAPInterface }

procedure TppDesignerWindow.SetRAPInterface(aInterfaceOptions: TppRAPInterfaceOptions);
begin

  FRAPInterface := aInterfaceOptions;
  
  if Assigned(FOnRapInterfaceChange) then FOnRapInterfaceChange(Self);

end; {procedure, SetRAPInterface}


{------------------------------------------------------------------------------}
{ TppDesignerWindow.SetRAPOptions }

procedure TppDesignerWindow.SetRAPOptions(aRAPOptions: TppRAPOptions);
begin
  FRAPOptions := aRAPOptions;

  if Assigned(FOnRapInterfaceChange) then FOnRapInterfaceChange(Self);

end; {procedure, SetRAPInterface}



{------------------------------------------------------------------------------}
{ CreateToolbars }

procedure TppDesignerWindow.CreateToolbars;
const
  cDockNames: array [0..3] of String = ('dckDesignTop','dckDesignBottom',  'dckDesignLeft', 'dckDesignRight');

var
  liDock: Integer;
  laDocks: array [0..3] of TppDock;

begin

  if FDesignTime then
    begin
      FSelectReportBtn := TppToolbarButton.Create(Self);
      FSelectReportBtn.Parent := pnlHorizontalRuler;
      FSelectReportBtn.Width  := 23;
      FSelectReportBtn.Height := 23;
      FSelectReportBtn.Glyph.Handle := ppBitmapFromResource('PPSELECTREPORT');
      FSelectReportBtn.OnClick := spbSelectReportClick;
    end;


  {create docks for toolbars}
  for liDock := 0 to 3  do
    begin
      laDocks[liDock] := TppDock.Create(Self);
      laDocks[liDock].Parent   := tshDesign;
      laDocks[liDock].Name     := cDockNames[liDock];
      laDocks[liDock].Position := TppDockPosition(liDock);
      laDocks[liDock].FixAlign := True;
   end;


  {create toolbars}
  FToolbarManager := TppToolbarManager.Create(Self);
  FToolbarManager.Initialize(laDocks[0], laDocks[1], laDocks[2], laDocks[3]);
  FToolbarManager.IniFileName := 'RBuilder.ini';

  FReportTree := TppReportTreeWindow(FToolbarManager.FindToolbar('ReportOutline'));
  FReportTree.OnComponentSelected := TreeComponentSelectedEvent;
  FReportTree.OnReportSelected    := TreeReportSelectedEvent;

  FDataTree := TppDataTreeWindow(FToolbarManager.FindToolbar('DataTree'));

  {assign event-handlers to toolbars}

  FAlignBar := TppAlignToolbar(FToolbarManager.FindToolbar('Align'));

  FAlignBar.OnButtonClick := ToolbarAlignEvent;

  FSizeBar := TppSizeToolbar(FToolbarManager.FindToolbar('Size'));
  FSizeBar.OnButtonClick := ToolbarSizeEvent;

  FNudgeBar := TppNudgeToolbar(FToolbarManager.FindToolbar('Nudge'));
  FNudgeBar.OnButtonClick := ToolbarNudgeEvent;

  FDrawBar := TppDrawToolbar(FToolbarManager.FindToolbar('Draw'));

  FDrawBar.FillColorButton.OnClick              := FillColorClick;
  FDrawBar.FillColorButton.OnPaletteColorChange := FillColorPaletteClick;

  FDrawBar.LineColorButton.OnClick              := LineColorClick;
  FDrawBar.LineColorButton.OnPaletteColorChange := LineColorPaletteClick;

  FDrawBar.LineThicknessButton.OnPaletteButtonClick := LineThicknessClick;
  FDrawBar.LineStyleButton.OnPaletteButtonClick     := LineStyleClick;


  FStandardBar := TppStandardToolbar(FToolbarManager.FindToolbar('Standard'));

  FStandardBar.FileNewButton.OnClick      := FileNewClick;
  FStandardBar.FileOpenButton.OnClick     := FileOpenClick;
  FStandardBar.FileSaveButton.OnClick     := FileSaveClick;
  FStandardBar.PageSetupButton.OnClick    := FilePageSetupClick;
  FStandardBar.PrintButton.OnClick        := FilePrintClick;
  FStandardBar.PrintPreviewButton.OnClick := FilePrintPreviewClick;
  FStandardBar.CutButton.OnClick          := EditCutClick;
  FStandardBar.CopyButton.OnClick         := EditCopyClick;
  FStandardBar.PasteButton.OnClick        := EditPasteClick;


  FFormatBar := TppFormatToolbar(FToolbarManager.FindToolbar('Format'));

  FFormatBar.FontComboBox.OnChange        := FontNameChangeEvent;
  FFormatBar.FontComboBox.OnGetPrinter    := GetPrinterEvent;

  FFormatBar.FontSizeComboBox.OnChange    := FontSizeChangeEvent;


  FFormatBar.FontNameButton.OnClick       := FontNameClick;
  FFormatBar.FontSizeButton.OnClick       := FontSizeClick;
  FFormatBar.BoldButton.OnClick           := FontBoldClick;
  FFormatBar.ItalicButton.OnClick         := FontItalicClick;
  FFormatBar.UnderlineButton.OnClick      := FontUnderlineClick;
  FFormatBar.AlignLeftButton.OnClick      := TextAlignLeftClick;
  FFormatBar.CenterButton.OnClick         := TextCenterClick;
  FFormatBar.AlignRightButton.OnClick     := TextAlignRightClick;

  FFormatBar.FontColorButton.OnClick              := FontColorClick;
  FFormatBar.FontColorButton.OnPaletteColorChange := FontColorPaletteClick;

  FFormatBar.HighlightColorButton.OnClick              := FontHighlightClick;
  FFormatBar.HighlightColorButton.OnPaletteColorChange := FontHighlightPaletteClick;

  FFormatBar.BringToFrontButton.OnClick  := EditBringToFrontClick;
  FFormatBar.SendToBackButton.OnClick    := EditSendToBackClick;


  FEditBar := TppEditToolbar(FToolbarManager.FindToolbar('Edit'));

  FPropEditBox   := FEditBar.EditBox;
  FPropComboBox  := FEditBar.ComboBox;
  FPropComboBox2 := FEditBar.ComboBox2;

  FPropEditBox.OnChange    := EditBoxChange;
  FPropEditBox.OnKeyPress  := EditBoxKeyPress;
  FPropEditBox.OnEnter     := EditBoxEnter;
  FPropEditBox.OnExit      := EditBoxExit;

  FPropComboBox.OnChange   := EditComboBoxChange;
  FPropComboBox2.OnChange  := EditComboBox2Change;


  {note: do this after creating the toolbars }
  pnlDesign.Align := alClient;

  {add the View |Toolbars option }
  if FToolbarManager <> nil then
    begin
      mniView.Insert(0, FToolbarManager.PopupMenu.Items);
      mniView.Items[0].Name    := 'mniViewToolbars';
      mniView.Items[0].Caption := ppLoadStr(499); {'Toolbars'}
      mniView.Items[0].OnClick :=  FToolbarManager.MenuPopupEvent;
    end;

  FToolbarManager.LoadToolWindowPreferences;

end;  {procedure, CreateToolbars}




{------------------------------------------------------------------------------}
{ FreeToolbars }

procedure TppDesignerWindow.FreeToolbars;
const
  cDockNames: array [0..3] of String = ('dckDesignTop','dckDesignBottom',  'dckDesignLeft', 'dckDesignRight');

var
  liIndex: Integer;

begin

  FToolbarManager.SaveToolWindowPreferences;


  FToolbarManager.Free;
  FToolbarManager := nil;

  for liIndex := ComponentCount-1 downto 0 do
    if Components[liIndex] is TppDock then
      Components[liIndex].Free;


end;  {procedure, FreeToolbars}

{------------------------------------------------------------------------------}
{ ChangeFormStyle}

procedure TppDesignerWindow.ChangeFormStyle(aFormStyle: TFormStyle);
begin

  FormStyle := aFormStyle;

  if (aFormStyle = fsMDIChild) then
    begin

     FreeToolbars;
     CreateToolbars;

     if FReport <> nil then
        FToolbarManager.LanguageIndex := FReport.LanguageIndex;

     if FReportTree <> nil then
       FReportTree.Report := FCurrentReport;

     if FDataTree <> nil then
       FDataTree.Report := FCurrentReport;


    end;

end; {procedure, ChangeFormStyle}


{------------------------------------------------------------------------------}
{ CreatePreviewButtons }

procedure TppDesignerWindow.CreatePreviewButtons;
begin

  {preview panel buttons}

  {create print button}
  FPreviewPrintBtn := TppToolbarButton.Create(Self);
  FPreviewPrintBtn.Parent := pnlPreviewBar;
  FPreviewPrintBtn.Left := 2;
  FPreviewPrintBtn.Top  := 1;
  FPreviewPrintBtn.Glyph.Handle := ppBitmapFromResource('PPPRINT');
  FPreviewPrintBtn.OnClick := FilePrintClick;

  {create auto search button}
  FPreviewAutoSearchBtn := TppToolbarButton.Create(Self);
  FPreviewAutoSearchBtn.Parent := pnlPreviewBar;
  FPreviewAutoSearchBtn.Left := 41;
  FPreviewAutoSearchBtn.Top  := 1;
  FPreviewAutoSearchBtn.Glyph.Handle := ppBitmapFromResource('PPSEARCH');
  FPreviewAutoSearchBtn.OnClick := spbPreviewAutoSearchClick;


  {standard panel buttons}

  {create preview page whole button}
  FPreviewWholeBtn := TppToolbarButton.Create(Self);
  FPreviewWholeBtn.Parent := pnlStandardButtons;
  FPreviewWholeBtn.Left := 0;
  FPreviewWholeBtn.Top  := 1;
  FPreviewWholeBtn.Glyph.Handle := ppBitmapFromResource('PPZOOMWHOLEPAGE');
  FPreviewWholeBtn.NumGlyphs := 4;
  FPreviewWholeBtn.OnClick := spbPreviewWholeClick;
  FPreviewWholeBtn.AllowAllUp := True;
  FPreviewWholeBtn.GroupIndex := 1;
  FPreviewWholeBtn.Down := True;

  {create preview page width button}
  FPreviewWidthBtn := TppToolbarButton.Create(Self);
  FPreviewWidthBtn.Parent := pnlStandardButtons;
  FPreviewWidthBtn.Left := 23;
  FPreviewWidthBtn.Top  := 1;
  FPreviewWidthBtn.Glyph.Handle := ppBitmapFromResource('PPZOOMPAGEWIDTH');
  FPreviewWidthBtn.NumGlyphs := 4;
  FPreviewWidthBtn.OnClick := spbPreviewWidthClick;
  FPreviewWidthBtn.AllowAllUp := True;
  FPreviewWidthBtn.GroupIndex := 1;

  {create preview page 100% button}
  FPreview100Btn := TppToolbarButton.Create(Self);
  FPreview100Btn.Parent := pnlStandardButtons;
  FPreview100Btn.Left := 46;
  FPreview100Btn.Top  := 1;
  FPreview100Btn.Glyph.Handle := ppBitmapFromResource('PPZOOM100PERCENT');
  FPreview100Btn.NumGlyphs := 4;
  FPreview100Btn.OnClick := spbPreview100Click;
  FPreview100Btn.AllowAllUp := True;
  FPreview100Btn.GroupIndex := 1;

  mskPreviewPercentage.Left :=  FPreview100Btn.Left + (FPreview100Btn.Width * 2);

  {create preview page first button}
  FPreviewFirstBtn := TppToolbarButton.Create(Self);
  FPreviewFirstBtn.Parent := pnlStandardButtons;
 { FPreviewFirstBtn.Left := mskPreviewPage.Left - ((FPreviewFirstBtn.Width * 2) + 8);}
  FPreviewFirstBtn.Left := mskPreviewPercentage.Left + mskPreviewPercentage.Width + (FPreviewFirstBtn.Width);

  FPreviewFirstBtn.Top  := 1;
  FPreviewFirstBtn.Glyph.Handle := ppBitmapFromResource('PPFIRSTPAGE');
  FPreviewFirstBtn.OnClick := spbPreviewFirstClick;

   {create preview page prior button}
  FPreviewPriorBtn := TppToolbarButton.Create(Self);
  FPreviewPriorBtn.Parent := pnlStandardButtons;
{  FPreviewPriorBtn.Left := mskPreviewPage.Left - (FPreviewPriorBtn.Width + 8);}
  FPreviewPriorBtn.Left := FPreviewFirstBtn.Left + FPreviewFirstBtn.Width;
  FPreviewPriorBtn.Top  := 1;
  FPreviewPriorBtn.Glyph.Handle := ppBitmapFromResource('PPPRIORPAGE');
  FPreviewPriorBtn.OnClick := spbPreviewPriorClick;

  mskPreviewPage.Left := FPreviewPriorBtn.Left + FPreviewPriorBtn.Width + 8;

  {create preview page next button}
  FPreviewNextBtn := TppToolbarButton.Create(Self);
  FPreviewNextBtn.Parent := pnlStandardButtons;
  FPreviewNextBtn.Left := mskPreviewPage.Left + mskPreviewPage.Width + 8;
  FPreviewNextBtn.Top  := 1;
  FPreviewNextBtn.Glyph.Handle := ppBitmapFromResource('PPNEXTPAGE');
  FPreviewNextBtn.OnClick := spbPreviewNextClick;

  {create preview page last button}
  FPreviewLastBtn := TppToolbarButton.Create(Self);
  FPreviewLastBtn.Parent := pnlStandardButtons;
{  FPreviewLastBtn.Left := (mskPreviewPage.Left + mskPreviewPage.Width + 8) + FPreviewNextBtn.Width;}
  FPreviewLastBtn.Left := FPreviewNextBtn.Left + FPreviewNextBtn.Width;
  FPreviewLastBtn.Top  := 1;
  FPreviewLastBtn.Glyph.Handle := ppBitmapFromResource('PPLASTPAGE');
  FPreviewLastBtn.OnClick := spbPreviewLastClick;

  spbPreviewCancel.Left := FPreviewLastBtn.Left +  (FPreviewLastBtn.Width * 3);


end; {procedure, CreatePreviewButtons}

{------------------------------------------------------------------------------}
{ ToolbarAlignEvent }

procedure TppDesignerWindow.ToolbarAlignEvent(Sender: TObject);
begin
  AlignSelection(TppAlignType(TComponent(Sender).Tag));
end;

{------------------------------------------------------------------------------}
{ ToolbarSizeEvent }

procedure TppDesignerWindow.ToolbarSizeEvent(Sender: TObject);
begin
   SizeSelection(TppSizeType(TComponent(Sender).Tag));
end;


{------------------------------------------------------------------------------}
{ ToolbarNudgeEvent }

procedure TppDesignerWindow.ToolbarNudgeEvent(Sender: TObject);
begin
   NudgeSelection(TppNudgeType(TComponent(Sender).Tag));
end;


{------------------------------------------------------------------------------}
{ FilePrintPreviewClick }

procedure TppDesignerWindow.FilePrintPreviewClick(Sender: TObject);
begin
  pgcDesigner.SelectNextPage(True);

end;


{------------------------------------------------------------------------------}
{ FillColorClick }

procedure TppDesignerWindow.FillColorClick(Sender: TObject);
var
  lColor: TColor;
  lbIsClear: Boolean;

begin
  TppColorButton(Sender).GetDefaultColor(lColor, lbIsClear);

  {note: ColorToSelection(aColor, aIsClear, aIsForeGround, aIsFont) }
  ColorToSelection(lColor, lbIsClear, False, False);

end; {procedure, FillColorClick}

{------------------------------------------------------------------------------}
{ FillColorPaletteClick }

procedure TppDesignerWindow.FillColorPaletteClick(Sender: TObject);
var
  lColor: TColor;
  lbIsClear: Boolean;

begin
  TppColorButton(Sender).GetPaletteColor(lColor, lbIsClear);

  {note: ColorToSelection(aColor, aIsClear, aIsForeGround, aIsFont) }
  ColorToSelection(lColor, lbIsClear, False, False)

end; {procedure, FillColorPaletteClick}


{------------------------------------------------------------------------------}
{ LineColorClick }

procedure TppDesignerWindow.LineColorClick(Sender: TObject);
var
  lColor: TColor;
  lbIsClear: Boolean;

begin
  TppColorButton(Sender).GetDefaultColor(lColor, lbIsClear);

  {note: ColorToSelection(aColor, aIsClear, aIsForeGround, aIsFont) }
  ColorToSelection(lColor, lbIsClear, True, False)

end; {procedure, LineColorClick}


{------------------------------------------------------------------------------}
{ LineColorPaletteClick }

procedure TppDesignerWindow.LineColorPaletteClick(Sender: TObject);
var
  lColor: TColor;
  lbIsClear: Boolean;

begin
  TppColorButton(Sender).GetPaletteColor(lColor, lbIsClear);

  {note: ColorToSelection(aColor, aIsClear, aIsForeGround, aIsFont) }
  ColorToSelection(lColor, lbIsClear, True, False)

end; {procedure, LineColorPaletteClick}


{------------------------------------------------------------------------------}
{ LineThicknessClick }

procedure TppDesignerWindow.LineThicknessClick(Sender: TObject);
var
  liSelection : Integer;
  lLine: TppLine;

begin

  BeginUpdate;

  for liSelection := 0 to (FppSelection.Count - 1) do
    if TppComponent(FppSelection.Items[liSelection]) is TppLine then
      begin
        lLine :=  TppLine(FppSelection.Items[liSelection]);

        lLine.Weight := TppLineThicknessButton(Sender).LineThickness;
        lLine.Style  := TppLineThicknessButton(Sender).LineStyle;
      end;

  EndUpdate;

end; {procedure, LineThicknessClick}

{------------------------------------------------------------------------------}
{ LineStyleClick }

procedure TppDesignerWindow.LineStyleClick(Sender: TObject);
var
  liSelection : Integer;
  lComponent: TppComponent;

begin

  BeginUpdate;


  for liSelection := 0 to (FppSelection.Count - 1) do
    begin
      lComponent := TppComponent(FppSelection.Items[liSelection]);

      if lComponent is TppCustomGraphic then
        TppCustomGraphic(lComponent).Pen.Style := TppLineStyleButton(Sender).LineStyle;
    end;


  EndUpdate;
  
end; {procedure, LineStyleClick}


{------------------------------------------------------------------------------}
{ FontColorClick }

procedure TppDesignerWindow.FontColorClick(Sender: TObject);
var
  lColor: TColor;
  lbIsClear: Boolean;

begin
  TppColorButton(Sender).GetDefaultColor(lColor, lbIsClear);

  {note: ColorToSelection(aColor, aIsClear, aIsForeGround, aIsFont) }
  ColorToSelection(lColor, lbIsClear, True, True)

end; {procedure, FontColorClick}


{------------------------------------------------------------------------------}
{ FontColorPaletteClick }

procedure TppDesignerWindow.FontColorPaletteClick(Sender: TObject);
var
  lColor: TColor;
  lbIsClear: Boolean;

begin
  TppColorButton(Sender).GetPaletteColor(lColor, lbIsClear);

  {note: ColorToSelection(aColor, aIsClear, aIsForeGround, aIsFont) }
  ColorToSelection(lColor, lbIsClear, True, True)

end; {procedure, FontColorPaletteClick}


{------------------------------------------------------------------------------}
{ FontHighlightClick }

procedure TppDesignerWindow.FontHighlightClick(Sender: TObject);
var
  lColor: TColor;
  lbIsClear: Boolean;

begin
  TppColorButton(Sender).GetDefaultColor(lColor, lbIsClear);

  {note: ColorToSelection(aColor, aIsClear, aIsForeGround, aIsFont) }
  ColorToSelection(lColor, lbIsClear, False, True)

end; {procedure, FontHighlightClick}

{------------------------------------------------------------------------------}
{ FontHighlightPaletteClick }

procedure TppDesignerWindow.FontHighlightPaletteClick(Sender: TObject);
var
  lColor: TColor;
  lbIsClear: Boolean;
begin
  TppColorButton(Sender).GetPaletteColor(lColor, lbIsClear);

  {note: ColorToSelection(aColor, aIsClear, aIsForeGround, aIsFont) }
  ColorToSelection(lColor, lbIsClear, False, True)

end; {procedure, FontHighlightPaletteClick}


{------------------------------------------------------------------------------}
{ ColorToSelection }

procedure TppDesignerWindow.ColorToSelection(aColor: TColor; aIsClear, aIsForeGround, aIsFont: Boolean);
var
  liSelection : Integer;

begin

  for liSelection := 0 to (FppSelection.Count - 1) do

    if (TppComponent(FppSelection.Items[liSelection]).HasFont = aIsFont) then
      if  aIsForeGround then
        TppComponent(FppSelection.Items[liSelection]).SetForeGroundColor(aColor, aIsClear)
      else
        TppComponent(FppSelection.Items[liSelection]).SetBackgroundColor(aColor, aIsClear);

end; {procedure, ColorToSelection}

{------------------------------------------------------------------------------}
{ FontNameClick }

procedure TppDesignerWindow.FontNameClick(Sender: TObject);
var
  liSelection : Integer;
  lComponent: TppComponent;
  lFont: TFont;

begin

  FDesignFont.CharSet := TppFontButton(Sender).CurrentFont.CharSet;
  FDesignFont.Name := TppFontButton(Sender).CurrentFont.Name;

  lFont := TFont.Create;

  for liSelection := 0 to (FppSelection.Count - 1) do
    begin
      lComponent := TppComponent(FppSelection.Items[liSelection]);

      if not lComponent.HasFont then Continue;

      lFont.Assign(lComponent.Font);

      lFont.CharSet := FDesignFont.CharSet;
      lFont.Name := FDesignFont.Name;

      lComponent.Font := lFont;

    end;

  lFont.Free;

end; {procedure, FontNameClick}

{------------------------------------------------------------------------------}
{ FontSizeClick }

procedure TppDesignerWindow.FontSizeClick(Sender: TObject);
var
  liSelection : Integer;

begin

  FDesignFont.Size := TppFontButton(Sender).CurrentFont.Size;

  for liSelection := 0 to (FppSelection.Count - 1) do
    if TppComponent(FppSelection.Items[liSelection]).HasFont then
      TppComponent(FppSelection.Items[liSelection]).Font.Name := FDesignFont.Name;


end; {procedure, FontSizeClick}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}




initialization

  ppResourceManager.AddResFileName('rbIDE');

  CF_PPDATA := RegisterClipboardFormat('CF_PPDATA');

  RegisterClass(TppDesignerWindow);

finalization

  ppResourceManager.RemoveResFileName('rbIDE');

  UnRegisterClass(TppDesignerWindow);

end.
