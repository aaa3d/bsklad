{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppClass;

interface

{$I ppIfDef.pas}

uses
   Windows, Classes, Controls, Forms, ExtCtrls, Menus, Graphics, Dialogs,
   SysUtils, StdCtrls, ppCmpReg, ppComm, ppDevice, ppTypes, ppRuler, ppUtils,
   ppDB, ppTmplat, ppCache, ppPrnabl, ppForms, ppProd, ppDsgnCt, ppPrintr,
   ppRelatv, ppRTTI;

type
  {forward declarations}
  TppBand              = class;
  TppComponent         = class;
  TppGroup             = class;
  TppCustomReport      = class;

  TppCustomReportClass = class of TppCustomReport;
  TppBandClass         = class of TppBand;

  { TppCustomEngine }
  TppCustomEngine = class(TppCacheable)
    private
      FAbsolutePageNo: Longint;
      FAbsolutePageCount: Longint;
      FAdvanceRecord: Boolean;
      FAllDataTraversed: Boolean;
      FCalcsOutOfSync: Boolean;
      FCheckForGroupBreaks: Boolean;
      FControlGroup: TppGroup;
      FControlKeepTogether: TppGroup;
      FCurrentColumn: Integer;
      FDrawPage: Boolean;
      FEngineState: TppEngineStates;
      FFirstDetailBandPrinted: Boolean;
      FFirstPassCompleted: Boolean;
      FGenerateCompleted: Boolean;
      FGenerateStarted: Boolean;
      FLastBandGenerated: Boolean;
      FLastPageCached: Longint;
      FPage: TppPage;
      FPrintCondition: TppPrintConditions;
      FPrintDateTime: TDateTime;
      FPrinting: Boolean;
      FPrintPosRect: TppRect;
      FPageBandCount: Integer;
      FPageStarted: Boolean;
      FReport: TppCustomReport;
      FReportBandCount: Longint;
      FSilentExceptions: Boolean;
      FSpaceUsed: Longint;
      FStopPrinting: Boolean;

      {events}
      FAfterSendPage: TNotifyEvent;
      FBeforeSendPage: TNotifyEvent;
      FOnGetLastPageCached: TppGetLastPageCachedEvent;
      FOnPageEnd: TNotifyEvent;
      FOnPageSent: TNotifyEvent;
      FOnReadCache: TNotifyEvent;
      FOnResetCache: TNotifyEvent;
      FOnWriteCache: TNotifyEvent;

      function  GetPage: TppPage;
      procedure SetReport(aReport: TppCustomReport);
      procedure SetStopPrinting(Value: Boolean);

    protected
      function  GetCurrentBand: TppBand; virtual; abstract;
      function  GetCurrentBandListIndex: Integer; virtual; abstract;
      function  GetPageBottom: Longint; virtual; abstract;
      function  GetPageCount: Longint; virtual;
      function  GetPageNo: Longint; virtual;
      function  GetPageStarted: Boolean; virtual;

      procedure DoAfterSendPage;
      procedure DoBeforeSendPage;
      procedure DoOnGetLastPageCached;
      procedure DoOnPageEnd;
      procedure DoOnPageSent;
      procedure DoOnResetCache;
      procedure DoOnReadCache;
      procedure DoOnWriteCache;

    public
      constructor Create(aOwner: TComponent); override;
      destructor  Destroy; override;

      procedure CloseDataPipelines; virtual; abstract;
      procedure DataTraversalCompleted; virtual;
      procedure ESExclude(aEngineStateSet: TppEngineStates);
      procedure ESInclude(aEngineStateSet: TppEngineStates);
      procedure PCInclude(aPrintConditionSet: TppPrintConditions);
      procedure PCExclude(aPrintConditionSet: TppPrintConditions);
      procedure PageLimitReached; virtual;
      procedure Init; virtual; abstract;
      procedure Reset; virtual; abstract;
      procedure ResetFromPageNo(aAbsolutePageNo: Longint); virtual; abstract;
      procedure RequestPage(aPageRequest: TppPageRequest); virtual; abstract;
      procedure SetPageStarted(aValue: Boolean); virtual;
      procedure SetPrintPosition(Left, Top, Right, Bottom: Longint);
      procedure SyncData; virtual; abstract;
      procedure TraverseData; virtual; abstract;

      property AbsolutePageCount: Longint read FAbsolutePageCount write FAbsolutePageCount;
      property AbsolutePageNo: Longint read FAbsolutePageNo write FAbsolutePageNo;
      property AdvanceRecord: Boolean read FAdvanceRecord write FAdvanceRecord;
      property AllDataTraversed: Boolean read FAllDataTraversed write FAllDataTraversed;
      property CalcsOutOfSync: Boolean read FCalcsOutOfSync write FCalcsOutOfSync;
      property CheckForGroupBreaks: Boolean read FCheckForGroupBreaks write FCheckForGroupBreaks;
      property ControlGroup: TppGroup read FControlGroup write FControlGroup;
      property ControlKeepTogether: TppGroup read FControlKeepTogether write FControlKeepTogether;
      property CurrentBand: TppBand read GetCurrentBand;
      property CurrentBandListIndex: Integer read GetCurrentBandListIndex;
      property CurrentColumn: Integer read FCurrentColumn write FCurrentColumn;
      property DrawPage: Boolean read FDrawPage write FDrawPage;
      property FirstDetailBandPrinted: Boolean read FFirstDetailBandPrinted write FFirstDetailBandPrinted;
      property FirstPassCompleted: Boolean read FFirstPassCompleted write FFirstPassCompleted;
      property GenerateCompleted: Boolean read FGenerateCompleted write FGenerateCompleted;
      property GenerateStarted: Boolean read FGenerateStarted write FGenerateStarted;
      property LastBandGenerated: Boolean read FLastBandGenerated write FLastBandGenerated;
      property LastPageCached: Longint read FLastPageCached;
      property PrintPosRect: TppRect read FPrintPosRect;
      property Page: TppPage read GetPage;
      property PageBandCount: Integer read FPageBandCount write FPageBandCount;
      property PageBottom: Longint read GetPageBottom;
      property PageCount: Longint read GetPageCount;
      property PageNo: Longint read GetPageNo;
      property PageStarted: Boolean read GetPageStarted write SetPageStarted;
      property PrintCondition: TppPrintConditions read FPrintCondition write FPrintCondition;
      property Printing: Boolean read FPrinting write FPrinting;
      property PrintDateTime: TDateTime read FPrintDateTime write FPrintDateTime;
      property Report: TppCustomReport read FReport write SetReport;
      property ReportBandCount: Longint read FReportBandCount write FReportBandCount;
      property SilentExceptions: Boolean read FSilentExceptions write FSilentExceptions;
      property State: TppEngineStates read FEngineState write FEngineState;
      property StopPrinting: Boolean read FStopPrinting write SetStopPrinting;
      property SpaceUsed: Longint read FSpaceUsed write FSpaceUsed;                                      

      {events}
      property AfterSendPage: TNotifyEvent read FAfterSendPage write FAfterSendPage;
      property BeforeSendPage: TNotifyEvent read FBeforeSendPage write FBeforeSendPage;
      property OnGetLastPageCached: TppGetLastPageCachedEvent read FOnGetLastPageCached write FOnGetLastPageCached;
      property OnPageEnd: TNotifyEvent read FOnPageEnd write FOnPageEnd;
      property OnPageSent: TNotifyEvent read FOnPageSent write FOnPageSent;
      property OnResetCache: TNotifyEvent read FOnResetCache write FOnResetCache;
      property OnReadCache: TNotifyEvent read FOnReadCache write FOnReadCache;
      property OnWriteCache: TNotifyEvent read FOnWriteCache write FOnWriteCache;

  end; {class, TppCustomEngine}


  TppMenuCreate = procedure(aOwner: TComponent; var aPopupMenu: TppPopupMenu) of object;


  { TppCustomReport }
  TppCustomReport = class(TppProducer)
  private
    FAutoStop: Boolean;
    FBands: TList;                                                                                         
    FColumns: Integer;
    FColumnPositions: TStrings;
    FColumnWidth: Longint;
    FDataPipeline: TppDataPipeline;
    FDefaultBands: TppBandTypes;
    FEngine: TppCustomEngine;
    FmmColumnPositions: TStrings;
    FGroups: TList;
    FModified: Boolean;
    FOnEndColumn: TNotifyEvent;
    FOnEndFirstPass: TNotifyEvent;
    FOnEndPage: TNotifyEvent;
    FOnEndSecondPass: TNotifyEvent;
    FOnStartColumn: TNotifyEvent;
    FOnStartFirstPass: TNotifyEvent;
    FOnStartPage: TNotifyEvent;
    FOnStartSecondPass: TNotifyEvent;
    FPageLimit: Integer;
    FParentReport: TppCustomReport;
    FPassSetting: TppPassSettingType;
    FPrintingAsSubReport: Boolean;
    FReportDesigner: TForm;
    FSaveAsTemplate: Boolean;
    FTemplate: TppReportTemplate;
    FUnits: TppUnitType;

    {used for converstion to 3.0}
    FOldColumnWidth: Single;

    {design-time event stuff}
    FdcPopupMenus: TStringList;
    FdcPopupMenuClick: TNotifyEvent;

    FModules: TList;


    function  CheckComponentPositions(const aAction: String; aWidth: Longint): Boolean;
    procedure ColumnPositionsChange(Sender: TObject);
    function  GetAbsolutePageNo: Longint;
    function  GetAbsolutePageCount: Longint;
    function  GetBandCount: Integer;
    function  GetCodeModule: TComponent;
    function  GetColumnPositions: TStrings;
    function  GetColumnWidth: Single;
    function  GetCurrentColumn: Integer;
    function  GetDonePrinting: Boolean;
    function  GetFirstPass: Boolean;
    function  GetGroupCount: Integer;
    function  GetPageNo: Longint;
    function  GetPageCount: Longint;
    function  GetPageBandCount: Integer;
    function  GetPrintDateTime: TDateTime;
    function  GetReportBandCount: Integer;
    function  GetScreenPixelColumnWidth: Integer;
    function  GetSecondPass: Boolean;
    function  GetTheBand(Index: Integer): TppBand;
    function  GetTheGroup(Index: Integer): TppGroup;

    procedure SetBandOrder;
    procedure SetColumns(Value: Integer);
    procedure SetColumnPositions(Value: TStrings);
    procedure SetColumnWidth(Value: Single);
    procedure SetDataPipeline(aDataPipeline: TppDataPipeline);
    procedure SetDonePrinting(Value: Boolean);
    procedure SetPageLimit(Value: Integer);
    procedure SetPassSetting(Value: TppPassSettingType);
    procedure SetParentReport(aReport: TppCustomReport);
    procedure SetReportDesigner(aReportDesigner: TForm);
    procedure SetUnits(aUnits: TppUnitType);
    procedure SetTemplate(aTemplate: TppReportTemplate);
    procedure TranslatePopupMenus;

    {read/write private 'fake' properties}
    procedure ReadColumnWidth(Reader: TReader);
    procedure WriteColumnWidth(Writer: TWriter);

    {used for conversion to 3.0}
    procedure ReadRulerUnits(Reader: TReader);

  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure DoOnLoadTemplate(aReport: TppCustomReport); virtual;
    function  FireAfterPrint: Boolean; override;
    procedure SetModified(Value: Boolean); virtual;
    procedure SetName(const Value: TComponentName); override;
    procedure SetUserName(const aUserName: TComponentName); override;

    procedure LayoutChanged; virtual;
    procedure PageEnded(Sender: TObject); virtual;
    procedure PageSent(Sender: TObject); virtual;
    procedure PrinterSetupChanged; override;
    procedure PrinterSetupPageDefChangeEvent(Sender: TObject); override;
    procedure PrinterSetupChangeQueryEvent(Sender: TObject; aNewPageDef: TObject; var CanChange: Boolean); override;
    function  GetMainReport: TppCustomReport; virtual; abstract;
    function  GetUserName: TComponentName; override;


    {component streaming stuff}
    procedure ReadState(Reader: TReader); override;

    {component streaming stuff}
{$IFDEF WIN32}
  {$IFDEF Delphi3}
    procedure GetChildren(Proc: TGetChildProc;Root: TComponent); override;
  {$ELSE}
    procedure GetChildren(Proc: TGetChildProc); override;
  {$ENDIF}

{$ELSE}
    procedure WriteComponents(Writer: TWriter); override;
{$ENDIF }

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure Loaded; override;
    
    procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

    class function ClassDescription: String; virtual;
    class function ClassBitmap: Longint; virtual;
    class function IsTemplate: Boolean; virtual;

    procedure AddBand(aBand: TppBand);
    procedure AddGroup(aGroup: TppGroup);
    procedure AddModule(aModule: TppCommunicator);
    procedure BeginUpdate;
    procedure EndUpdate;
    function  ConfirmWidthChange(aWidth: Longint; aWarningMessage: String): Boolean;
    procedure Convert(aVersionNo: Integer); override;
    procedure ChangeOwner(aNewOwner: TComponent); override;
    procedure CreateDefaultBands;
    procedure DataTraversalCompleted;
    procedure DoOnEndColumn;
    procedure DoOnEndFirstPass;
    procedure DoOnEndPage;
    procedure DoOnEndSecondPass;
    procedure DoOnStartColumn;
    procedure DoOnStartFirstPass;
    procedure DoOnStartPage;
    procedure DoOnStartSecondPass;
    procedure DSExclude(aDesignStateSet: TppDesignStates); override;
    procedure DSInclude(aDesignStateSet: TppDesignStates); override;
    procedure EndOfMainReport; virtual;
    procedure ESExclude(aEngineStateSet: TppEngineStates); virtual; abstract;
    procedure ESInclude(aEngineStateSet: TppEngineStates); virtual; abstract;
    function  FindBand(aBand: TppBand): Integer;
    function  FindGroup(aGroup: TppGroup): Integer;
    procedure FreeBandsAndGroups;
    procedure FreeDesignControls;
    procedure FreeModules;
    function  FindUserObject(aUserName: String): TppCommunicator; override;
    function  GetBand(aBandType : TppBandType; aGroupIndex: Integer): TppBand;
    procedure GetFirstLevelSubReports(aReportList: TStrings);
    function  GetModuleForClass(aModuleClass: TClass): TppCommunicator;
    procedure GetReportKey(var aKey: String); virtual; abstract;
    function  GetPrintMessage: String; virtual; abstract;
    procedure GetSubReports(aReportList: TStrings);
    function  GetUniqueUserName(aComponent: TComponent): String; override;
    function  HasParentCodeModules: Boolean;
    procedure InstantiateDesignControls;
    procedure LanguageChanged; override;
    procedure MoveGroup(aCurrentPos, aNewPos: Integer);
    procedure NewNotify;
    procedure UpdateParentDataPipeline(aNewDataPipeline, aOldDataPipeline: TppDataPipeline);
    function  ObjectByName(var aBandIndex: Integer; var aComponentIndex: Integer; const aComponentName: String): Boolean;
    procedure PageLimitReached;
    procedure PostDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
    function  PrintingSection: Boolean;
    procedure RaiseException(aException: Exception); override;
    procedure RemoveBand(aBand: TppBand);
    procedure RemoveGroup(aGroup: TppGroup);
    procedure RemoveModule(aModule: TppCommunicator);
    procedure Reset; override;
    procedure SendDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
    procedure SetGroupPosition(aGroup: TppGroup; aPosition: Integer);
    procedure SetPrintMessage(const aMessage: String); virtual; abstract;
    procedure StartOfMainReport; virtual;
    procedure StartOfParentReport; virtual;
    procedure Stop;
    procedure TemplateChanged;
    procedure Transfer(aSource: TppCommunicator); override;
    procedure TriggerCodeModuleCreate; override;
    procedure TriggerCodeModuleDestroy; override;

    function  GetdcPopupMenu(Sender : TObject; CreateMenu: TppMenuCreate): TppPopupMenu;
    procedure SetdcPopupMenuClick(aMenuClickEvent: TNotifyEvent);
    procedure FreePopupMenus;

    property AbsolutePage: Longint read GetAbsolutePageNo;
    property AbsolutePageNo: Longint read GetAbsolutePageNo;
    property AbsolutePageCount: Longint read GetAbsolutePageCount;
    property Bands[Index: Integer]: TppBand read GetTheBand;
    property BandCount : Integer read GetBandCount;
    property CodeModule: TComponent read GetCodeModule;
    property CurrentColumn: Integer read GetCurrentColumn;
    property DefaultBands: TppBandTypes read FDefaultBands write FDefaultBands;
    property DonePrinting: Boolean read GetDonePrinting write SetDonePrinting;
    property Engine: TppCustomEngine read FEngine;
    property FirstPass: Boolean read GetFirstPass;
    property Groups[Index: Integer]: TppGroup read GetTheGroup;
    property GroupCount : Integer read GetGroupCount;
    property MainReport: TppCustomReport read GetMainReport;
    property mmColumnWidth: Longint read FColumnWidth;
    property Modified: Boolean read FModified write SetModified;
    property Page: Longint read GetPageNo;
    property PageNo: Longint read GetPageNo;
    property PageBandCount: Integer read GetPageBandCount;
    property PageCount: Longint read GetPageCount;
    property ParentReport: TppCustomReport read FParentReport write SetParentReport;
    property ReportDesigner: TForm read FReportDesigner write SetReportDesigner;
    property PrintDateTime: TDateTime read GetPrintDateTime;
    property PrintingAsSubReport: Boolean read FPrintingAsSubReport write FPrintingAsSubReport;
    property ReportBandCount: Integer read GetReportBandCount;
    property SecondPass: Boolean read GetSecondPass;
    property spColumnWidth: Integer read GetScreenPixelColumnWidth;

  published
    property AutoStop: Boolean read FAutoStop write FAutoStop default True;
    property Columns: Integer read FColumns write SetColumns default 1;
    property ColumnPositions: TStrings read GetColumnPositions write SetColumnPositions;
    property ColumnWidth: Single read GetColumnWidth write SetColumnWidth stored False;
    property DataPipeline: TppDataPipeline read FDataPipeline write SetDataPipeline;
    property OnEndColumn: TNotifyEvent read FOnEndColumn write FOnEndColumn;
    property OnEndFirstPass: TNotifyEvent read FOnEndFirstPass write FOnEndFirstPass;
    property OnEndPage: TNotifyEvent read FOnEndPage write FOnEndPage;
    property OnEndSecondPass: TNotifyEvent read FOnEndSecondPass write FOnEndSecondPass;
    property OnPrintingComplete;
    property OnSaveText;
    property OnStartColumn: TNotifyEvent read FOnStartColumn write FOnStartColumn;
    property OnStartFirstPass: TNotifyEvent read FOnStartFirstPass write FOnStartFirstPass;
    property OnStartPage: TNotifyEvent read FOnStartPage write FOnStartPage;
    property OnStartSecondPass: TNotifyEvent read FOnStartSecondPass write FOnStartSecondPass;
    property PageLimit: Integer read FPageLimit write SetPageLimit default 0;
    property PassSetting: TppPassSettingType read FPassSetting write SetPassSetting default psOnePass;
    property PrinterSetup;
    property SaveAsTemplate: Boolean read FSaveAsTemplate write FSaveAsTemplate default False;
    property Template: TppReportTemplate read FTemplate write SetTemplate;
    property Units: TppUnitType read FUnits write SetUnits default utInches;
    property UserName;

  end; {class, TppCustomReport}

  { TppBand }
  TppBand = class(TppCacheable)
  private
    FBottomOffset: Longint;
    FCaption: String;
    FCaptionIndex: Longint;
    FControlBottoms: TStringList;
    FDesignControl: TppDesignBand;
    FDrawPage: Boolean;
    FHeight: Longint;
    FLastBand: Boolean;
    FObjects: TList;
    FPrintCount: Integer;
    FPrintHeight: TppPrintHeightType;
    FPrintPosition: Longint;
    FPrintTimes: TppPrintTimesType;
    FReport: TppCustomReport;
    FRuler: TppRuler;
    FSave: Boolean;
    FSaveList: TList;
    FUnits: TppUnitType;
    FVariables: TList;
    FVisible: Boolean;

    {event handling variables}
    FAfterGenerate: TNotifyEvent;
    FAfterPrint: TNotifyEvent;
    FBeforeGenerate: TNotifyEvent;
    FBeforePrint: TNotifyEvent;
 
    {used for conversion to 3.0}
    FOnPrint: String;

    procedure ConvertCalcs(Sender: TObject);
    procedure FixCalcOrderList;
    procedure FixSaveOrderList;
    function  GetBottomOffset: Single;
    function  GetHeight: Single;
    function  GetIndex: Integer;
    function  GetPrintPosition: Single;
    function  GetSave(aIndex: TTabOrder): TppComponent;
    function  GetSaveCount: Integer;
    function  GetScreenPixelHeight: Integer;
    function  GetVariable(aIndex: TTabOrder): TppComponent;
    function  GetVariableCount: Integer;
    procedure SetBottomOffset(Value: Single);
    procedure SetHeight(Value: Single);
    procedure SetMMHeight(Value: LongInt);
    procedure SetPrintPosition(Value: Single);
    procedure SetVisible(Value: Boolean);

    {used by report designer}
    function  GetTop: Longint;
    function  GetScreenPixelTop: Integer;
    function  GetScreenPixelWidth: Integer;
    procedure SetScreenPixelTop(Value: Integer);
    procedure SetScreenPixelHeight(Value: Integer);

    {read/write private 'fake' properties}
    procedure ReadBottomOffset(Reader: TReader);
    procedure ReadHeight(Reader: TReader);
    procedure ReadPrintPosition(Reader: TReader);
    procedure WriteBottomOffset(Writer: TWriter);
    procedure WriteHeight(Writer: TWriter);
    procedure WritePrintPosition(Writer: TWriter);

    {used for conversion to 3.0}
    procedure ReadOnPrint(Reader: TReader);
    procedure ReadOnSaveLineEnd(Reader: TReader);
    procedure ReadOnSaveLineStart(Reader: TReader);
    procedure ReadTop(Reader: TReader);
    procedure ReadLeft(Reader: TReader);

  protected
    {overriden from TComponent}
    procedure DefineProperties(Filer: TFiler); override;

    procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); virtual;
    procedure DoAfterGenerate; virtual;
    procedure DoAfterPrint; virtual;
    procedure DoBeforeGenerate; virtual;
    procedure DoBeforePrint; virtual;
    procedure DynamicMenuClick(Sender: TObject);
    function  GetDefaultPrintTimes: TppPrintTimesType; virtual;
    function  GetLanguageIndex: Longint;
    function  GetObject(aIndex: Integer): TppComponent;
    function  GetObjectCount: Integer;
    function  GetRank: String; virtual; abstract;
    function  GetPrintCondition: TppPrintConditions; virtual; abstract;
    function  GetWidth: LongInt;
    function  IsColumnar: Boolean; virtual;
    procedure PositionMenuClick(Sender: TObject);
    procedure PositionChange(Sender: TObject);
    procedure PropertyChange; override;
    procedure SetCaption(aCaption: String); virtual;
    procedure SetPrintCount(Value: Integer);
    procedure SetPrintHeight(aPrintHeight: TppPrintHeightType); virtual;
    procedure SetReport(aReport: TppCustomReport); virtual;
    procedure SetSave(Value: Boolean);

    procedure CalcOrderMenuClick(Sender: TObject);
    procedure StaticMenuClick(Sender: TObject);

    {these are used by all bands}
    property BottomOffset: Single read GetBottomOffset write SetBottomOffset;
    property PrintCount: Integer read FPrintCount write SetPrintCount default 0;
    property PrintPosition: Single read GetPrintPosition write SetPrintPosition;
    property PrintTimes: TppPrintTimesType read FPrintTimes write FPrintTimes default ptOne;


    {component streaming stuff}
    procedure ReadState(Reader: TReader); override;

{$IFDEF WIN32}

  {$IFDEF Delphi3}
     procedure GetChildren(Proc: TGetChildProc;Root: TComponent); override;
  {$ELSE}
     procedure GetChildren(Proc: TGetChildProc); override;
  {$ENDIF}

{$ELSE}
    procedure WriteComponents(Writer: TWriter); override;
{$ENDIF}

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

    procedure AddObject(aObject: TObject);
    procedure AddSave(aComponent: TppComponent);
    procedure AddVariable(aComponent: TppComponent);
    procedure BringObjectToFront(aObject: TObject);
    procedure ChangeOwner(aNewOwner: TComponent); override;
    procedure ComputeCalcs(aMasterPipeline, aDetailPipeline: TppDataPipeline); virtual; abstract;
    procedure ControlMoved(aControl: TControl);
    procedure DSExclude(aDesignStateSet: TppDesignStates); override;
    procedure DSInclude(aDesignStateSet: TppDesignStates); override;
    procedure EndOfMainReport; virtual;
    function  FindObject(aComponent: TppComponent): Integer;
    function  FindSave(aComponent: TppComponent): Integer;
    function  FindVariable(aComponent: TppComponent): Integer;
    procedure FreeDesignControls;
    procedure Generate; virtual; abstract;
    function  GetADataPipeline: TppDataPipeline; virtual;
    function  GetBottomOfControls: Integer;
    function  GetDescription: String; virtual; abstract;
    function  GetParentComponent: TComponent; override;
    function  GetPrinter: TppPrinter;
    function  GetPrintMessage: String;
    function  HasParent: Boolean; override;
    function  IndexOfSave(aComponent: TppComponent): TTabOrder;
    function  IndexOfVariable(aComponent: TppComponent): TTabOrder;
    procedure Init; virtual;
    procedure InsertSave(aPosition: TTabOrder; aComponent: TppComponent);
    procedure InsertVariable(aPosition: TTabOrder; aComponent: TppComponent);
    procedure InstantiateDesignControls;
    function  IsDataAware: Boolean; virtual;
    function  IsValidUserName(aUserName: String): Boolean; override;
    procedure LanguageChanged; virtual;
    procedure MoveObject(aCurIndex, aNewIndex: Integer);
    function  ObjectByName(var aComponentIndex: Integer; const aComponentName: String): Boolean;
    procedure PageStart; virtual;
    procedure PopupMenuClick(Sender: TObject); virtual;
    function  Printing: Boolean;
    procedure RemoveObject(aObject: TObject);
    procedure RemoveSave(aComponent: TppComponent);
    procedure RemoveVariable(aComponent: TppComponent);
    procedure Reset;
    procedure Resize; virtual;
    procedure SendDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
    procedure PostDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
    procedure SendObjectToBack(aObject: TObject);
    procedure SetParentComponent(Value: TComponent); override;
    procedure SetPrintMessage(const aMessage: String);
    procedure SetUnits(aUnits: TppUnitType);
    procedure StartOfMainReport; virtual;
    procedure StartOfParentReport; virtual;

    property Caption: String read FCaption write SetCaption;
    property CaptionIndex: Longint read FCaptionIndex write FCaptionIndex;
    property DesignControl: TppDesignBand read FDesignControl write FDesignControl stored False;
    property DrawPage: Boolean read FDrawPage write FDrawPage;
    property Index: Integer read GetIndex;
    property LastBand: Boolean read FLastBand write FLastBand;
    property LanguageIndex: Longint read GetLanguageIndex;
    property mmBottomOffset: Longint read FBottomOffset;
    property mmHeight: Longint read FHeight;
    property mmPrintPosition: Longint read FPrintPosition;
    property mmTop: Longint read GetTop;
    property mmWidth: Longint read GetWidth;
    property ObjectCount: Integer read GetObjectCount;
    property Objects[Index: Integer]: TppComponent read GetObject;
    property PrintCondition: TppPrintConditions read GetPrintCondition;
    property PrintHeight: TppPrintHeightType read FPrintHeight write SetPrintHeight default phStatic;
    property SaveCount: Integer read GetSaveCount;
    property Saves[Index: TTabOrder]: TppComponent read GetSave;
    property spHeight: Integer read GetScreenPixelHeight write SetScreenPixelHeight;
    property spTop: Integer read GetScreenPixelTop write SetScreenPixelTop;
    property spWidth: Integer read GetScreenPixelWidth;
    property Report : TppCustomReport read FReport write SetReport;
    property Ruler: TppRuler read FRuler write FRuler;
    property Rank: String read GetRank;
    property Units: TppUnitType read FUnits write SetUnits;
    property VariableCount: Integer read GetVariableCount;
    property Variables[Index: TTabOrder]: TppComponent read GetVariable;

    {used for conversion to 3.0}
    procedure Convert(aVersionNo: Integer); virtual;
    property OnPrint: String read FOnPrint;

  published
    property AfterGenerate: TNotifyEvent read FAfterGenerate  write FAfterGenerate;
    property AfterPrint: TNotifyEvent read FAfterPrint  write FAfterPrint;
    property BeforePrint: TNotifyEvent read FBeforePrint  write FBeforePrint;
    property BeforeGenerate: TNotifyEvent read FBeforeGenerate  write FBeforeGenerate;
    property Height: Single read GetHeight write SetHeight stored False;
    property Save: Boolean read FSave write SetSave default False;
    property Visible: Boolean read FVisible write SetVisible default True;

  end; {class, TppBand}


  { TppGroup }
  TppGroup = class(TppCacheable)
  private
    FAfterGroupBreak: TNotifyEvent;
    FBeforeGroupBreak: TNotifyEvent;
    FBreakComponent: TppComponent;
    FBreaking: Boolean;
    FBreakNo: Integer;
    FBreakType: TppBreakType;
    FBreakName: String;
    FBreakValue: String;
    FCacheManager: TppCacheManager;
    FDataPipeline: TppDataPipeline;
    FFirstColumn: Integer;
    FFirstPageNo: Longint;
    FFooterBand: TppBand;
    FHeaderBand: TppBand;
    FHeaderForOrphanedFooter: Boolean;
    FKeepTogether: Boolean;
    FKeptTogether: Boolean;
    FLastPageNo: Longint;
    FNewColumn: Boolean;
    FNewPage: Boolean;
    FNewColumnThreshold: Longint;
    FNewPageThreshold: Longint;
    FOnGetBreakValue: TppGetBreakValueEvent;
    FPage: TppPage;
    FPosition: Integer;
    FPriorValue: String;
    FReport: TppCustomReport;
    FReprintOnSubsequentColumn: Boolean;
    FReprintOnSubsequentPage: Boolean;
    FResetPageNo: Boolean;
    FResettingCache: Boolean;
    FSetBreakComponent: Boolean;
    FTag: Integer;
    FUnits: TppUnitType;

    {used for conversion to 3.0}
    FFieldName: String;
    FOldThreshold: Single;
    FReprintOnSubsequent: Boolean;

    procedure DoAfterGroupBreak;
    procedure DoBeforeGroupBreak;
    function  GetBreakComponent: TppComponent;
    function  GetDescription: String;
    function  GetCurrentValue: String;
    function  GetGroupNo: Integer;
    function  GetIndex: Integer;
    function  GetNewColumnThreshold: Single;
    function  GetNewPageThreshold: Single;
    function  GetPageCount: Longint;
    function  GetPageNo: Longint;
    procedure SetBreakName(const aBreakName: String);
    procedure SetBreakType(aBreakType: TppBreakType);
    procedure SetDataPipeline(aDataPipeline: TppDataPipeline);
    procedure SetFooterBand(aGroupFooterBand: TppBand);
    procedure SetHeaderBand(aGroupHeaderBand: TppBand);
    procedure SetHeaderForOrphanedFooter(Value: Boolean);
    procedure SetKeepTogether(Value: Boolean);
    procedure SetNewColumn(Value: Boolean);
    procedure SetNewPage(Value: Boolean);
    procedure SetNewColumnThreshold(Value: Single);
    procedure SetNewPageThreshold(Value: Single);
    procedure SetReport(aReport: TppCustomReport);
    procedure SetReprintOnSubsequentColumn(Value: Boolean);
    procedure SetReprintOnSubsequentPage(Value: Boolean);
    procedure UpdateCache;

    procedure ReadNewColumnThreshold(Reader: TReader);
    procedure ReadNewPageThreshold(Reader: TReader);
    procedure WriteNewColumnThreshold(Writer: TWriter);
    procedure WriteNewPageThreshold(Writer: TWriter);

    {used for conversion to 3.0}
    procedure ReadFieldName(Reader: TReader);
    procedure ReadReprintOnSubsequent(Reader: TReader);
    procedure ReadTop(Reader: TReader);
    procedure ReadLeft(Reader: TReader);

  protected
    procedure DefineProperties(Filer: TFiler); override; {contains temporary conversion routine}

    {component streaming stuff}
    procedure Loaded; override;
    procedure ReadState(Reader: TReader); override;

{$IFDEF WIN32}
  {$IFDEF Delphi3}
     procedure GetChildren(Proc: TGetChildProc;Root: TComponent); override;
  {$ELSE}
     procedure GetChildren(Proc: TGetChildProc); override;
  {$ENDIF}
{$ELSE}
    procedure WriteComponents(Writer: TWriter); override;
{$ENDIF }

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

    procedure BeforeHeader;
    procedure BeforeFooter;
    procedure BreakComponentNameChanged(const aOldName, aNewName: String);
    procedure CheckForBreak;
    procedure Clear; virtual;
    procedure DetailOutOfSpace;
    procedure EndOfMainReport;
    function  FirstPage: Boolean;
    procedure ForceBreak;
    procedure FreeCache(aCachePageNo: Longint); override;
    function  GetParentComponent: TComponent; override;
    function  GetPrinter: TppPrinter;
    procedure GroupFooterAfterPrint;
    procedure GroupHeaderBeforeGenerate;
    procedure GroupHeaderBeforePrint;
    function  HasParent: Boolean; override;
    procedure Init;
    procedure BandOrderChanged;
    procedure PositionChanged; virtual;
    function  Printing: Boolean;
    procedure RefreshBreakValues;
    procedure Reset;
    procedure RestoreFromCache(aCachePageNo: Longint); override;
    procedure SaveToCache(aCachePageNo: Longint); override;
    procedure SetBreakComponent;
    procedure SetParentComponent(Value: TComponent); override;
    procedure StartOfMainReport;
    procedure StartOfParentReport; virtual;
    procedure UpdatePageCount;

    {used for conversion to 3.0}
    procedure Convert(aVersionNo: Integer); virtual;

    property BreakComponent: TppComponent read GetBreakComponent;
    property Breaking: Boolean read FBreaking write FBreaking;
    property BreakNo: Integer read FBreakNo write FBreakNo;
    property BreakValue: String read FBreakValue write FBreakValue;
    property CurrentValue: String read GetCurrentValue;
    property Description: String read GetDescription;
    property FirstColumn: Integer read FFirstColumn write FFirstColumn;
    property FirstPageNo: Longint read FFirstPageNo write FFirstPageNo;
    property FooterBand: TppBand read FFooterBand write SetFooterBand;
    property Index: Integer read GetIndex;
    property GroupNo: Integer read GetGroupNo stored False;
    property HeaderBand: TppBand read FHeaderBand write SetHeaderBand;
    property KeptTogether: Boolean read FKeptTogether write FKeptTogether default False;
    property LastPageNo: Longint read FLastPageNo write FLastPageNo;
    property mmNewColumnThreshold: Longint read FNewColumnThreshold;
    property mmNewPageThreshold: Longint read FNewPageThreshold;
    property Position: Integer read FPosition write FPosition;
    property PageNo: Longint read GetPageNo;
    property PageCount: Longint read GetPageCount;
    property PriorValue: String read FPriorValue write FPriorValue;
    property Report: TppCustomReport read FReport write SetReport;
    property Units: TppUnitType read FUnits write FUnits;

    {used for conversion to 3.0}
    property FieldName: String read FFieldName;
    property ReprintOnSubsequent: Boolean read FReprintOnSubsequent;

  published
    property AfterGroupBreak: TNotifyEvent read FAfterGroupBreak write FAfterGroupBreak;
    property BeforeGroupBreak: TNotifyEvent read FBeforeGroupBreak write FBeforeGroupBreak;
    property BreakName: String  read FBreakName write SetBreakName;
    property BreakType: TppBreakType read FBreakType write SetBreakType default btDataField;
    property DataPipeline: TppDataPipeline read FDataPipeline write SetDataPipeline;
    property HeaderForOrphanedFooter: Boolean read FHeaderForOrphanedFooter write SetHeaderForOrphanedFooter default True;
    property KeepTogether: Boolean read FKeepTogether write SetKeepTogether default False;
    property OnGetBreakValue: TppGetBreakValueEvent read FOnGetBreakValue write FOnGetBreakValue;
    property NewColumn: Boolean read FNewColumn write SetNewColumn default False;
    property NewPage: Boolean read FNewPage write SetNewPage default False;
    property NewColumnThreshold: Single read GetNewColumnThreshold write SetNewColumnThreshold stored False;
    property NewPageThreshold: Single read GetNewPageThreshold write SetNewPageThreshold stored False;
    property ResetPageNo: Boolean read FResetPageNo write FResetPageNo default False;
    property ReprintOnSubsequentColumn: Boolean read FReprintOnSubsequentColumn
                                                write SetReprintOnSubsequentColumn default True;
    property ReprintOnSubsequentPage: Boolean read FReprintOnSubsequentPage write SetReprintOnSubsequentPage default True;
    property Tag: Integer read FTag write FTag default 0;
    property UserName;

  end; {class, TppGroup}


  { TppComponent }
  TppComponent = class(TppPrintable)
  private
    FBand: TppBand;
    FBandType: TppBandType;
    FGroupNo: Integer;
    FParentDataPipeline: Boolean;
    FRegion: TppComponent;
    FResetGroup: TppGroup;

    function GetIndex: Integer;
    function GetParentIndex: Integer;

    {read/write private properties}
    procedure ReadBandType(Reader: TReader);
    procedure ReadGroupNo(Reader: TReader);
    procedure WriteBandType(Writer: TWriter);
    procedure WriteGroupNo(Writer: TWriter);


  protected
    {override from TComponent}
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadState(Reader: TReader); override;

    procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;

    {popup menu event handlers}
    procedure BringToFrontMenuClick(Sender: TObject);
    procedure PositionMenuClick(Sender: TObject);
    function  CreatePositionDialog: TppCustomPositionDialog; virtual;
    procedure PositionChange(Sender: TObject); virtual;
    procedure SendToBackMenuClick(Sender: TObject);

    function  CheckBounds: Boolean;
    function  GetDesigner: TForm; override;
    function  IsGroupBased: Boolean; virtual;
    function  GetLanguageIndex: LongInt; override;
    function  GetMainReport: TppCustomReport;
    function  GetNextSibling: TppComponent; virtual;
    function  GetParent: TComponent; virtual;
    function  GetPrinter: TppPrinter; override;
    function  GetReport: TppCustomReport;
    procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;

    procedure SetBand(aBand: TppBand); virtual;
    procedure SetDataPipeline(aDataPipeline: TppDataPipeline); override;
    procedure SetParentDataPipeline(Value: Boolean); virtual;
    procedure SetResetGroup(aGroup: TppGroup); virtual;

    procedure SetParentHeight(Value: Boolean); override;
    procedure SetParentWidth(Value: Boolean); override;
    procedure SetRegion(aRegion: TppComponent); virtual;
    procedure SetMMHeight(Value: Longint); override;
    procedure SetMMLeft(Value: Longint); override;
    procedure SetMMTop(Value: Longint); override;
    procedure SetMMWidth(Value: Longint); override;
    function  spGetClipRect: TRect; override;
    function  mmGetParentRect: TppRect; virtual;
    procedure UpdateDesignControlBounds; override;


  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure BringToFront; virtual;
    function  GetParentComponent: TComponent; override;
    function  GetPrintMessage: String;
    function  HasParent: Boolean; override;
    procedure InstantiateDesignControl; override;
    procedure mmSetBounds(aLeft, aTop, aWidth, aHeight: LongInt); override;
    procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
    procedure ParentBoundsChange;
    procedure PopupMenuClick(Sender: TObject); override;
    function  Printing: Boolean; override;
    procedure ProcessMessages;
    procedure Reset; override;
    procedure SendToBack; virtual;
    procedure SetParentComponent(Value: TComponent); override;
    procedure SetPrintMessage(const aMessage: String);

    property Band: TppBand read FBand write SetBand stored False;
    property BandType: TppBandType read FBandType;
    property Index: Integer read GetIndex;
    property NextSibling: TppComponent read GetNextSibling;
    property ParentIndex: Integer read GetParentIndex;
    property GroupNo: Integer read FGroupNo;
    property Parent: TComponent read GetParent;


    property ParentDataPipeline: Boolean read FParentDataPipeline write SetParentDataPipeline default True;
    property Region: TppComponent read FRegion write SetRegion;
    property ResetGroup: TppGroup read FResetGroup  write SetResetGroup;

  published
    property UserName;

  end; {class, TppComponent}


  { TdaDataView }
  TdaDataView = class(TppRelative)
    private
      FAutoSearchTabOrder: Integer;
      FDescription: String;
      FActive: Boolean;
      FEditMode: TppDataEditType;
      FEditOptions: TppDataEditTypes;
      FEnabledOptions: TppDataEditTypes;
      FLanguageIndex: Longint;
      FNew: Boolean;
      FNextAction: TppNextActionType;
      FOnEditOptionChange: TNotifyEvent;
      FOnValidateName: TppValidateNameEvent;
      FReport: TppCustomReport;
      FValid: Boolean;

    protected
      procedure ConnectReportToPipelines; virtual;
      procedure DoOnEditOptionChange;
      procedure DoOnValidateName(Sender: TObject; const aName: String; var aNameValid: Boolean);
      function  GetDataPipelineCount: Integer; virtual; abstract;
      function  GetDataPipelineForIndex(aIndex: Integer): TppDataPipeline; virtual; abstract;
      procedure SetActive(Value: Boolean); virtual;
      procedure SetAutoSearchTabOrder(aValue: Integer); virtual;
      procedure SetEditOptions(Value: TppDataEditTypes); virtual;
      procedure SetEnabledOptions(Value: TppDataEditTypes); virtual;
      procedure SetLanguageIndex(aLanguageIndex: Longint); virtual;
      procedure SetReport(aReport: TppCustomReport); virtual;

    public
      constructor Create(aOwner: TComponent); override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      class function ClassBitmap: Longint; virtual; abstract;
      class function ClassDescription: String; virtual; abstract;
      class function PreviewFormClass: TFormClass; virtual; abstract;
      class function SessionClass: TClass; virtual; abstract;
      class function IsTemplate: Boolean; virtual; abstract;

      procedure Design; virtual; abstract;
      procedure Preview; virtual; abstract;

      function AddDataPipeline(aDataPipeline: TppDataPipeline): Integer; virtual; abstract;
      function RemoveDataPipeline(aDataPipeline: TppDataPipeline): Integer; virtual; abstract;

      property Active: Boolean read FActive write SetActive;
      property AutoSearchTabOrder: Integer read FAutoSearchTabOrder write SetAutoSearchTabOrder;
      property Description: String read FDescription write FDescription;
      property DataPipelines[Index: Integer]: TppDataPipeline read GetDataPipelineForIndex;
      property DataPipelineCount: Integer read GetDataPipelineCount;
      property EditMode: TppDataEditType read FEditMode write FEditMode;
      property EditOptions: TppDataEditTypes read FEditOptions write SetEditOptions default cAllDataEditOptions;
      property EnabledOptions: TppDataEditTypes read FEnabledOptions write SetEnabledOptions default cAllDataEditOptions;
      property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;
      property New: Boolean read FNew write FNew;
      property NextAction: TppNextActionType read FNextAction write FNextAction default ppnaNone;
      property OnValidateName: TppValidateNameEvent read FOnValidateName write FOnValidateName;
      property Valid: Boolean read FValid write FValid;

    published
      property Report: TppCustomReport read FReport write SetReport;
      property UserName;

  end; {class TdaDataView}


{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppCustomReportRTTI }
  TraTppCustomReportRTTI = class(TraTppProducerRTTI)
    public
      class procedure GetEventList(aClass: TClass; aPropList: TraPropList); override;
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCustomReportRTTI}

  { TraTppBandRTTI }
  TraTppBandRTTI = class(TraTppCacheableRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppBandRTTI}

  { TraTppGroupRTTI }
  TraTppGroupRTTI = class(TraTppCacheableRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppGroupRTTI}

  { TraTppComponentRTTI }
  TraTppComponentRTTI = class(TraTppPrintableRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppComponentRTTI}




  { TppComponent class reference type }
  TppComponentClass = class of TppComponent;
  TdaDataViewClass = class of TdaDataView;


  procedure ppRegisterComponent(aComponentClass: TComponentClass;
                                const aToolBarName: String;
                                aToolBarPosition: Integer;
                                aHintIndex: Integer;
                                const aHint: String;
                                aHInstance: Longint);


  procedure ppUnRegisterComponent(aComponentClass: TComponentClass);

var
{$IFDEF WIN32}
  ppRegisterComponentProc: procedure (aComponentClass: TComponentClass;
                                      const aToolBarName: String;
                                      aToolBarPosition: Integer;
                                      aHintIndex: Integer;
                                      const aHint: String;
                                      aHInstance: Longint) = nil;

  ppUnRegisterComponentProc: procedure (aComponentClass: TComponentClass) = nil;


{$ELSE}


  ppRegisterComponentProc: procedure (aComponentClass: TppComponentClass;
                                      const aToolBarName: String;
                                      aToolBarPosition: Integer;
                                      aHintIndex: Integer;
                                      const aHint: String;
                                      aHInstance: Longint);

  ppUnRegisterComponentProc: procedure (aComponentClass: TppComponentClass);

{$ENDIF}

implementation

uses
{$IFDEF WIN32}
  ppRichTx,
{$ENDIF}

  ppClasUt, ppEngine, ppBands, ppSubRpt, ppDsIntf, ppReport, ppVar, ppCtrls,
  ppStrtch, ppRegion, ppBarCod, ppMemo, ppTmDlg, ppTmEDlg;


{******************************************************************************
 *
 ** D A T A  V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataView.Create }

constructor TdaDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAutoSearchTabOrder := 0;
  FEditMode := ppemAll;
  FEditOptions := cAllDataEditOptions;
  FEnabledOptions := cAllDataEditOptions;
  FLanguageIndex := 0;
  FNew := False;
  FOnEditOptionChange := nil;
  FReport := nil;
  FValid := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDataView.Notify }

procedure TdaDataView.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator = FReport) then
    SetReport(nil);

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TdaDataView.SetReport }

procedure TdaDataView.SetReport(aReport: TppCustomReport);
begin

  if (FReport <> nil) then
    FReport.RemoveEventNotify(Self);

  FReport := aReport;

  if (FReport <> nil) then
    FReport.AddEventNotify(Self);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (FReport <> nil) and (FReport.DataPipeline = nil) then
    ConnectReportToPipelines;

end; {procedure, SetReport}

{------------------------------------------------------------------------------}
{ TdaDataView.ConnectReportToPipelines }

procedure TdaDataView.ConnectReportToPipelines;
begin

  {descendants should add code here to set the initial datapipeline for the report.
  the end-user can modify this and save the results}
  if (Report <> nil) and (DataPipelineCount > 0) then
    Report.DataPipeline := DataPipelines[0];

end; {procedure, ConnectReportToPipelines}

{------------------------------------------------------------------------------}
{ TdaDataView.SetEditOptions }

procedure TdaDataView.SetEditOptions(Value: TppDataEditTypes);
begin
  FEditOptions := Value;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  DoOnEditOptionChange;

end; {procedure, SetEditOptions}

{------------------------------------------------------------------------------}
{ TdaDataView.SetEnabledOptions }

procedure TdaDataView.SetEnabledOptions(Value: TppDataEditTypes);
begin
  FEnabledOptions := Value;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

 { DoOnEnabledOptionChange;}

end; {procedure, SetEditOptions}

{------------------------------------------------------------------------------}
{ TdaDataView.DoOnEditOptionChange }

procedure TdaDataView.DoOnEditOptionChange;
begin
  if Assigned(FOnEditOptionChange) then FOnEditOptionChange(Self);
end; {procedure, DoOnEditOptionChange}

{------------------------------------------------------------------------------}
{ TdaDataView.SetActive }

procedure TdaDataView.SetActive(Value: Boolean);
begin
  FActive := Value;
end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaDataView.SetAutoSearchTabOrder }

procedure TdaDataView.SetAutoSearchTabOrder(aValue: Integer);
begin
  FAutoSearchTabOrder := aValue;
end; {procedure, SetAutoSearchTabOrder}

{------------------------------------------------------------------------------}
{ TdaDataView.SetLanguage }

procedure TdaDataView.SetLanguageIndex(aLanguageIndex: Integer);
begin
  FLanguageIndex := aLanguageIndex;
end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TdaDataView.DoOnValidateName }

procedure TdaDataView.DoOnValidateName(Sender: TObject; const aName: String; var aNameValid: Boolean);
begin
  if Assigned(FOnValidateName) then FOnValidateName(Sender, aName, aNameValid);
end; {procedure, DoOnValidateName}

{******************************************************************************
 *
 ** C U S T O M   R E P O R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomReport.Create }

constructor TppCustomReport.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAutoStop             := True;
  FBands                := TList.Create;
  FColumns              := 1;
  FColumnPositions      := TStringList.Create;
  TStringList(FColumnPositions).OnChange := ColumnPositionsChange;
  FColumnWidth          := 0;
  FDataPipeline         := nil;
  FDefaultBands         := cReportBands;
  FmmColumnPositions    := TStringList.Create;
  FGroups               := TList.Create;
  FModified             := False;
  FOnEndColumn          := nil;
  FOnEndFirstPass       := nil;
  FOnEndPage            := nil;
  FOnEndSecondPass      := nil;
  FOnStartColumn        := nil;
  FOnStartFirstPass     := nil;
  FOnStartPage          := nil;
  FOnStartSecondPass    := nil;
  FPageLimit            := 0;
  FParentReport         := nil;
  FPassSetting          := psOnePass;
  FPrintingAsSubReport  := False;
  FReportDesigner       := nil;
  FSaveAsTemplate       := False;
  FUnits                := utInches;

  FTemplate             := TppReportTemplate.Create(Self);

  FModules := nil;

  {list of pointers to popup-menus}
  FdcPopupMenus       := TStringList.Create;

  {designer event handlers}
  FdcPopupMenuClick   := nil;

  FEngine := TppEngine.Create(Self);
  FEngine.OnPageEnd := PageEnded;
  FEngine.OnPageSent := PageSent;

  PrinterSetup.DocumentName := UserName;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomReport.Destroy }

destructor TppCustomReport.Destroy;
begin
  {showMessage('TppCustomReport.Destroy - begin');}

  {showMessage('notify pipeline');}

  {tell data pipeline that we no longer exist}
  if (FDataPipeline <> nil) then
    FDataPipeline.RemoveNotify(Self);


 { showMessage('notify designer');}
 {notify Report Designer, this will set FReportDesigner to nil }
  SendDesignMessage(PM_REPORTDESTROY,ppWCustomMsg,LongInt(Self));


  {showMessage('free popup menus');}
  {free popup menus}
  FreePopupMenus;
  FdcPopupMenus.Free;

  {  showMessage('FEngine.StopPrinting := True');}
  {if engine is generating pages, tell it to stop}
  if FEngine.Printing then
    FEngine.StopPrinting := True;

  {  showMessage('FreeBandsAndGroups');}
  {free bands and groups}
  FreeBandsAndGroups;

  FreeModules;

 {    showMessage('free list objects');}
  {free list objects}
  FBands.Free;
  FGroups.Free;
  FColumnPositions.Free;
  FmmColumnPositions.Free;

    {  showMessage('FEngine.Free');}
 {free engine}
  FEngine.Free;
  FEngine := nil;

  { showMessage(' FTemplate.Free;');}

  {free TPersistent objects}
  FTemplate.Free;

  {inherited Destroy}
  inherited Destroy;

 {showMessage('TppCustomReport.Destroy - end');}

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomReport.StartOfMainReport }

procedure TppCustomReport.StartOfMainReport;
var
  liIndex: Integer;
  lPipelines: TppDataPipelineList;
begin

  for liIndex := 0 to (BandCount - 1) do
    Bands[liIndex].StartOfMainReport;

  for liIndex := 0 to (GroupCount - 1) do
    Groups[liIndex].StartOfMainReport;

  lPipelines := TppDataPipelineList.Create(Self);

  for liIndex := 0 to lPipelines.Count-1 do
    lPipelines.GetPipeline(liIndex).StartOfMainReport(lPipelines);

  lPipelines.Free;

end; {procedure, StartOfMainReport}

{------------------------------------------------------------------------------}
{ TppCustomReport.EndOfMainReport }

procedure TppCustomReport.EndOfMainReport;
var
  liIndex: Integer;
  lPipelines: TppDataPipelineList;
begin

  for liIndex := 0 to (BandCount - 1) do
    Bands[liIndex].EndOfMainReport;

  for liIndex := 0 to (GroupCount - 1) do
    Groups[liIndex].EndOfMainReport;

  lPipelines := TppDataPipelineList.Create(Self);

  for liIndex := 0 to lPipelines.Count-1 do
    lPipelines.GetPipeline(liIndex).EndOfMainReport(lPipelines);

  lPipelines.Free;

end; {procedure, EndOfMainReport}

{------------------------------------------------------------------------------}
{ TppCustomReport.StartOfParentReport }

procedure TppCustomReport.StartOfParentReport;
var
  liIndex: Integer;
begin

  for liIndex := 0 to (BandCount - 1) do
    Bands[liIndex].StartOfParentReport;

  for liIndex := 0 to (GroupCount - 1) do
    Groups[liIndex].StartOfParentReport;

end; {procedure, StartOfParentReport}

{------------------------------------------------------------------------------}
{ TppCustomReport.NewNotify }

procedure TppCustomReport.NewNotify;
begin
  SendNotify(Self, ppopNew);
end; {destructor, NewNotify}

{------------------------------------------------------------------------------}
{ TppCustomReport.ClassDescription }

class function TppCustomReport.ClassDescription: String;
begin
  Result := ClassName;
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TppCustomReport.ClassBitmap }

class function TppCustomReport.ClassBitmap: Longint;
begin
  Result := ppBitmapFromResource('PPNOREPORTBITMAP');
end; {class function, ClassBitmap}

{------------------------------------------------------------------------------}
{ TppCustomReport.IsTemplate }

class function TppCustomReport.IsTemplate: Boolean;
begin
  Result := False;
end; {function, IsTemplate}

{------------------------------------------------------------------------------}
{ TppCustomReport.ChangeOwner }

procedure TppCustomReport.ChangeOwner(aNewOwner: TComponent);
var
  liIndex:  Integer;

begin

  if (aNewOwner = Owner) then Exit;

  inherited ChangeOwner(aNewOwner);

  {assign new owner for groups}
  for liIndex := 0 to FGroups.Count-1 do
    Groups[liIndex].ChangeOwner(aNewOwner);

  {assign new owner for bands}
  for liIndex := 0 to (FBands.Count-1) do
    Bands[liIndex].ChangeOwner(aNewOwner);

  {assign new root for the template}
  FTemplate.Root := aNewOwner;


  if (FModules <> nil) then
    for liIndex := 0 to FModules.Count-1 do
      TppCommunicator(FModules[liIndex]).ChangeOwner(aNewOwner);

end; {procedure, ChangeOwner }

{------------------------------------------------------------------------------}
{ TppCustomReport.Transfer }

procedure TppCustomReport.Transfer(aSource: TppCommunicator);
var
  liBand,
  liGroup,
  liObject,
  liIndex: Integer;
  lBand: TppBand;
  lGroup: TppGroup;
  lComponent: TppComponent;
  lReportDesigner:  TForm;
  lGroupList: TList;
  lSourceReport: TppCustomReport;
  lModule: TppCommunicator;

begin

  inherited Transfer(aSource);

  if not(aSource is TppCustomReport) then Exit;


  lSourceReport := TppCustomReport(aSource);


  lGroupList := TList.Create;

  {detach report from designer }
  lReportDesigner := ReportDesigner;

  SetReportDesigner(nil);

  try
    {assign properties}
    FColumns          := lSourceReport.Columns;

    FmmColumnPositions.Assign(lSourceReport.FmmColumnPositions);
    FColumnWidth      := lSourceReport.mmColumnWidth;

    {use set prop routine here, need to fire notify logic}
    SetDataPipeline(lSourceReport.DataPipeline);

    FAutoStop        := lSourceReport.AutoStop;
    FModified        := lSourceReport.Modified;
    FPageLimit       := lSourceReport.PageLimit;
    FPassSetting     := lSourceReport.PassSetting;
    FSaveAsTemplate  := lSourceReport.SaveAsTemplate;
    FUnits           := lSourceReport.Units;

    FTemplate.Assign(lSourceReport.Template);

    {assign event handlers}
    FOnEndColumn         := lSourceReport.OnEndColumn;
    FOnEndFirstPass      := lSourceReport.OnEndFirstPass;
    FOnEndPage           := lSourceReport.OnEndPage;
    FOnEndSecondPass     := lSourceReport.OnEndSecondPass;
    FOnStartColumn       := lSourceReport.OnStartColumn;
    FOnStartFirstPass    := lSourceReport.OnStartFirstPass;
    FOnStartPage         := lSourceReport.OnStartPage;
    FOnStartSecondPass   := lSourceReport.OnStartSecondPass;

    {destroy current reports' bands and groups}
    FreeBandsAndGroups;

    FreeModules;

    {transfer non-group bands}
    for liBand := 0 to (lSourceReport.BandCount-1) do
      begin

        lBand := lSourceReport.Bands[lSourceReport.BandCount-1];

        if (lBand is TppGroupBand) then
          lSourceReport.RemoveBand(lBand)
        else
          (lBand as TppBasicBand).Report := Self;

        {change owner of band, this change the owner of the components}
        if (Owner <> lBand.Owner) then
          lBand.ChangeOwner(Owner);

        {set the report designer property for any subreports}
        for liObject := 0 to (lBand.ObjectCount-1) do
          begin

            lComponent := lBand.Objects[liObject];

            if (lComponent is TppSubReport) then
              TppSubReport(lComponent).Report.ParentReport   := Self;

          end;

        end;

        {transfer groups (groups will then transfer their associated bands)}
        for liGroup := 0 to (lSourceReport.GroupCount-1) do
          lGroupList.Add(lSourceReport.Groups[liGroup]);

        for liGroup := 0 to lGroupList.Count-1 do
          begin

            lGroup := lGroupList[liGroup];

            lGroup.Report := Self;

            if (Owner <> lGroup.Owner) then
              lGroup.ChangeOwner(Owner);

          end;


        if lSourceReport.FModules <> nil then
          for liIndex := lSourceReport.FModules.Count-1 downto 0 do
            begin
              lModule := lSourceReport.FModules[liIndex];
              lModule.SetParentComponent(Self);
              if (Owner <> lModule.Owner) then
               lModule.ChangeOwner(Owner);
            end;

      finally

        {re-attach designer}
        SetReportDesigner(lReportDesigner);

        Reset;

        lGroupList.Free;


      end; {try }

end; {procedure, Transfer}

{------------------------------------------------------------------------------}
{ TppCustomReport.SetPageLimit }

procedure TppCustomReport.SetPageLimit(Value: Integer);
begin
  FPageLimit := Value;

  Reset;
end; {procedure, SetPageLimit}

{------------------------------------------------------------------------------}
{ TppCustomReport.SetPassSetting }

procedure TppCustomReport.SetPassSetting(Value: TppPassSettingType);
begin
  FPassSetting := Value;
  
  {notify report designer}
  SetModified(True);

  Reset;
end; {procedure, SetPassSetting}

{------------------------------------------------------------------------------}
{ TppCustomReport.SendDesignMessage }

procedure TppCustomReport.SendDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
begin
  if Printing then Exit;

  if (FReportDesigner <> nil)  then
    FReportDesigner.Perform(aMsg, aWParam, aLParam);

end;  {procedure, SendDesignMessage}


{------------------------------------------------------------------------------}
{ TppCustomReport.PostDesignMessage }

procedure TppCustomReport.PostDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
begin
  if Printing then Exit;

  if (FReportDesigner <> nil) then
    PostMessage(FReportDesigner.Handle, aMsg, aWParam, aLParam);

end;  {procedure, PostDesignMessage}


{------------------------------------------------------------------------------}
{ TppCustomReport.BeginUpdate }

procedure TppCustomReport.BeginUpdate;
begin
  DSInclude([pppcUpdating]);
  SendDesignMessage(PM_REPORTUPDATEBEGIN, ppWCustomMsg,LongInt(Self));
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.EndUpdate }

procedure TppCustomReport.EndUpdate;
begin
  DSExclude([pppcUpdating]);
  SendDesignMessage(PM_REPORTUPDATEEND, ppWCustomMsg,LongInt(Self));
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetCurrentColumn }

function TppCustomReport.GetCurrentColumn: Integer;
begin
  if (FEngine = nil) then
    Result := 0
  else
    Result := FEngine.CurrentColumn;
end; {function, GetCurrentColumn}

{------------------------------------------------------------------------------}
{ TppCustomReport.DSInclude }

procedure TppCustomReport.DSInclude(aDesignStateSet: TppDesignStates);
var
  liIndex: Integer;
begin

  inherited DSInclude(aDesignStateSet);

  {notify bands}
  for liIndex := 0 to FBands.Count-1 do
    Bands[liIndex].DSInclude(aDesignStateSet);

  {notify groups}
  for liIndex := 0 to FGroups.Count-1 do
    Groups[liIndex].DSInclude(aDesignStateSet);

  {notify engine}
  if FEngine <> nil then
    FEngine.DSInclude(aDesignStateSet);

  {notify report modules}
  if (FModules <> nil) then
    for liIndex := 0 to FModules.Count-1 do
      TppCommunicator(FModules[liIndex]).DSInclude(aDesignStateSet);


end; {procedure, DSInclude}

{------------------------------------------------------------------------------}
{ TppCustomReport.DSExclude }

procedure TppCustomReport.DSExclude(aDesignStateSet: TppDesignStates);
var
  liIndex: Integer;
begin

  inherited DSExclude(aDesignStateSet);

  {notify bands}
  for liIndex := 0 to FBands.Count-1 do
    Bands[liIndex].DSExclude(aDesignStateSet);

  {notify groups}
  for liIndex := 0 to FGroups.Count-1 do
    Groups[liIndex].DSExclude(aDesignStateSet);

  {notify engine}
  if FEngine <> nil then
    FEngine.DSExclude(aDesignStateSet);

  {notify report modules}
  if (FModules <> nil) then
    for liIndex := 0 to FModules.Count-1 do
      TppCommunicator(FModules[liIndex]).DSExclude(aDesignStateSet);


end; {procedure, DSExclude}

{------------------------------------------------------------------------------}
{ TppCustomReport.InstantiateDesignControls }

procedure TppCustomReport.InstantiateDesignControls;
var
  liBand: Integer;

begin

  DSInclude([pppcDesigning, pppcLoading]);

  {notify bands}
  for liBand := 0 to FBands.Count-1 do
    Bands[liBand].InstantiateDesignControls;


  DSExclude([pppcLoading]);

end; {procedure, InstantiateDesignControls}

{------------------------------------------------------------------------------}
{ TppCustomReport.PrintingSection }

function TppCustomReport.PrintingSection: Boolean;
begin
  Result := (([esStartSection, esGenerateSection, esEndSection] * FEngine.State) <> []);
end; {function, PrintingSection}

{------------------------------------------------------------------------------}
{ TppCustomReport.FreeDesignControls }

procedure TppCustomReport.FreeDesignControls;
var
  liBand: Integer;

begin

  DSExclude([pppcDesigning, pppcDisplayData]);

  {notify bands}
  for liBand := 0 to FBands.Count-1 do
    Bands[liBand].FreeDesignControls;

  FreePopupMenus;


end; {procedure, FreeDesignControls}

{------------------------------------------------------------------------------}
{ TppCustomReport.LayoutChanged }

procedure TppCustomReport.LayoutChanged;
var
  liBand: Integer;

begin

  for liBand := 0 to FBands.Count-1 do
    Bands[liBand].Resize;

  {notify report designer}
  PostDesignMessage(PM_CalcWorkspaceWidth, ppWCustomMsg, 0);

  {notify report engine}
  Reset;

end; {procedure, LayoutChanged}


{------------------------------------------------------------------------------}
{ TppCustomReport.PrinterSetupChanged }

procedure TppCustomReport.PrinterSetupChanged;
var
  liBand: Integer;
  liObject: Integer;
  lBand: TppBand;
  lObject: TppComponent;

begin

  inherited PrinterSetupChanged;

  PrinterSetup.Units := FUnits;

  {update PrinterSetup for sub-reports with ParentPrinterSetup set to True}
  for liBand := 0 to (FBands.Count-1) do
    begin

      lBand := FBands[liBand];

      for liObject := 0 to (lBand.ObjectCount-1) do
        begin

          lObject := lBand.Objects[liObject];

          if (lObject is TppSubReport) and TppSubReport(lObject).ParentPrinterSetup then
            TppSubReport(lObject).Report.PrinterSetup := PrinterSetup;

        end;

    end;


end; {procedure, PrinterSetupChanged}

{------------------------------------------------------------------------------}
{ TppCustomReport.PrinterSetupChangeQueryEvent }

procedure TppCustomReport.PrinterSetupChangeQueryEvent(Sender: TObject; aNewPageDef: TObject; var CanChange: Boolean);
var
  lsWarningMsg: String;
begin

  inherited PrinterSetupChangeQueryEvent(Sender, aNewPageDef, CanChange);

  if (PrinterSetup.PageDef.mmPrintableWidth = TppPageDef(aNewPageDef).mmPrintableWidth) then Exit;

  lsWarningMsg := ppLoadStr(328);

  CanChange := ConfirmWidthChange(TppPageDef(aNewPageDef).mmPrintableWidth, lsWarningMsg);

end; {procedure, PrinterSetupChangeQueryEvent}

{------------------------------------------------------------------------------}
{ TppCustomReport.PrinterSetupPageDefChangeEvent }

procedure TppCustomReport.PrinterSetupPageDefChangeEvent(Sender: TObject);
begin

  inherited PrinterSetupPageDefChangeEvent(Sender);

  LayoutChanged;

end; {procedure, PrinterSetupPageDefChangeEvent}

{------------------------------------------------------------------------------}
{ TppCustomReport.LanguageChanged }

procedure TppCustomReport.LanguageChanged;
var
  liBands: Integer;
  liBand: Integer;

begin

  inherited LanguageChanged;

  {can only set this property when not printing}
  TranslatePopupMenus;

  liBands := BandCount;

  {notify bands}
  for liBand := 0 to liBands-1 do
    Bands[liBand].LanguageChanged;

  FTemplate.LanguageIndex := LanguageIndex;

  SendDesignMessage(PM_SETLANGUAGE,ppWCustomMsg,0);

  {notify other objects}
  SendNotify(Self, ppopLanguageChange);

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppCustomReport.TranslatePopupMenus }

procedure TppCustomReport.TranslatePopupMenus;
var
  liPopupMenu,
  liMenuItem: Integer;
  lPopupMenu : TPopupMenu;
  lMenuItem: TMenuItem;

begin

  {translate the design-time popup menus}
  for liPopupMenu := FdcPopupMenus.Count-1 downto 0 do
    begin
     lPopupMenu := TPopupMenu(FdcPopupMenus.Objects[liPopupMenu]);

     {translate each menu item}
     for liMenuItem := lPopupMenu.Items.Count - 1 downto 0 do
       begin
         lMenuItem := lPopupMenu.Items[liMenuItem];

         if (lMenuItem <> nil) and (lMenuItem.Tag <> 0) then
           lMenuItem.Caption := ppLoadStr(lMenuItem.Tag);

       end;
    end;

end; {procedure, TranslatePopupMenus}

{------------------------------------------------------------------------------}
{ TppCustomReport.DataTraversalCompleted }

procedure TppCustomReport.DataTraversalCompleted;
begin
  FEngine.DataTraversalCompleted;
end; {procedure, DataTraversalCompleted}


{------------------------------------------------------------------------------}
{ TppCustomReport.Stop }

procedure TppCustomReport.Stop;
begin
  DataTraversalCompleted;
end; {procedure, Stop}


{------------------------------------------------------------------------------}
{ TppCustomReport.PageLimitReached }

procedure TppCustomReport.PageLimitReached;
begin
  FEngine.PageLimitReached;
end; {procedure, PageLimitReached}

{------------------------------------------------------------------------------}
{ TppCustomReport.GetDonePrinting }

function TppCustomReport.GetDonePrinting: Boolean;
begin
  Result := FEngine.GenerateCompleted;
end; {function, GetDonePrinting}

{------------------------------------------------------------------------------}
{ TppCustomReport.SetDonePrinting }

procedure TppCustomReport.SetDonePrinting(Value: Boolean);
begin
  if Value then
    DataTraversalCompleted;
end; {procedure, SetDonePrinting}

{------------------------------------------------------------------------------}
{ TppCustomReport.PageEnded }

procedure TppCustomReport.PageEnded(Sender: TObject);
begin
  {fire OnEndPage event - do this before we evaluate whether the report is done and
   before we send the page to the devices}
  DoOnEndPage;

{$IFDEF Demo}
  {if this is demo copy, and we've generated to the demo page limit, stop here}
  if (AbsolutePage >= DemoPages) then
    FEngine.PageLimitReached
  else
{$ENDIF}

  {if no data available, and requested no data pages have been generated, stop here}
  if ( (FPageLimit > 0) and (AbsolutePage >= FPageLimit) ) then
    FEngine.PageLimitReached;

{     ( (esNoData in Generator.State) and
       (pppcDesigning in DesignState) and
       (FPageLimit = 0) and (AbsolutePage >= 1) ) then}

end;

{------------------------------------------------------------------------------}
{ TppCustomReport.PageSent }

procedure TppCustomReport.PageSent(Sender: TObject);
begin

end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetFirstLevelSubReports }

procedure TppCustomReport.GetFirstLevelSubReports(aReportList: TStrings);
var
  liBands: Integer;
  liBand: Integer;
  lBand: TppBand;
  liObjects: Integer;
  liObject: Integer;
  lObject: TppComponent;
begin

  liBands := BandCount;

  for liBand := 0 to liBands - 1 do
    begin
      lBand := Bands[liBand];

      liObjects := lBand.ObjectCount;

      for liObject := 0 to liObjects - 1 do
        begin
          lObject := lBand.Objects[liObject];

          if (lObject is TppSubReport) and (TppSubReport(lObject).Report <> nil) then
            aReportList.AddObject(lObject.Caption, TppSubReport(lObject).Report);

        end; {for, each component}

    end; {for, each band}

end; {procedure, GetFirstLevelSubReports}

{------------------------------------------------------------------------------}
{ TppCustomReport.GetSubReports }

procedure TppCustomReport.GetSubReports(aReportList: TStrings);
var
  liBands: Integer;
  liBand: Integer;
  lBand: TppBand;
  liObjects: Integer;
  liObject: Integer;
  lObject: TppComponent;
begin

  liBands := BandCount;

  for liBand := 0 to liBands - 1 do
    begin

      lBand := Bands[liBand];

      liObjects := lBand.ObjectCount;

      for liObject := 0 to liObjects - 1 do
        begin

          lObject := lBand.Objects[liObject];

          if (lObject is TppSubReport) and (TppSubReport(lObject).Report <> nil) then
            begin
              aReportList.AddObject(lObject.Caption, TppSubReport(lObject).Report);

              TppSubReport(lObject).Report.GetSubReports(aReportList);
            end;

        end; {for, each component}

    end; {for, each band}

end; {procedure, GetSubReports}

{------------------------------------------------------------------------------}
{ TppCustomReport.SetDataPipeline }

procedure TppCustomReport.SetDataPipeline(aDataPipeline: TppDataPipeline);
var
  lOldDataPipeline: TppDataPipeline;
  lNewDataPipeline: TppDataPipeline;
begin

  lOldDataPipeline := FDataPipeline;
  lNewDataPipeline := aDataPipeline;

  if FDataPipeline <> nil then
    FDataPipeline.RemoveNotify(Self);

  FDataPipeline := aDataPipeline;


  if FDataPipeline <> nil then
    FDataPipeline.AddNotify(Self);

  {this causes the caption to change}
  Notify(FDataPipeline, ppopDataChange);

  if (csReading in ComponentState) or (csLoading in ComponentState) or
     (pppcTemplateLoading in DesignState) then Exit;


  {do this AFTER FDataPipeline assigned}
  {any data-aware components with the same data pipeline need to be updated}
  UpdateParentDataPipeline(lNewDataPipeline, lOldDataPipeline);

  {set AutoStop to true, if datapipeline is nil}
  FAutoStop := (FDataPipeline = nil);

  Reset;

end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppCustomReport.Notify }

procedure TppCustomReport.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (FDataPipeline = aCommunicator) then

    case aOperation of
      ppopRemove:
        begin
          FDataPipeline := nil;
          FAutoStop := True;
          Reset;
        end;

      ppopDataChange:
        Reset;
    end
  else if aOperation = ppopRemove then

    if (FParentReport = aCommunicator) then
      FParentReport := nil

    else if (FTemplate.DatabaseSettings.DataPipeline = aCommunicator) then
      FTemplate.DatabaseSettings.DataPipeline := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppCustomReport.SetParentReport }

procedure TppCustomReport.SetParentReport(aReport: TppCustomReport);
begin

  if (FParentReport <> nil) then
    FParentReport.RemoveNotify(Self);

  FParentReport := aReport;

  if (FParentReport <> nil) then
    begin
      FParentReport.AddNotify(Self);
      SetReportDesigner(FParentReport.ReportDesigner);
    end;


end; {function, SetParentReport}

{------------------------------------------------------------------------------}
{ TppCustomReport.UpdateParentDataPipeline }

procedure TppCustomReport.UpdateParentDataPipeline(aNewDataPipeline, aOldDataPipeline: TppDataPipeline);
var
  liIndex: Integer;
  liObject: Integer;
  lBand: TppBand;
  lObject: TppComponent;
  lGroup: TppGroup;
begin

  {update datapipeline property of components}
  for liIndex := 0 to FBands.Count - 1 do
    begin
      lBand := TppBand(FBands[liIndex]);

      {skip to next band, detailband has datapipeline}
      if (lBand is TppDetailBand) and (TppDetailBand(lBand).DataPipeline <> nil) then Continue;

      for liObject := 0 to lBand.ObjectCount - 1 do
        begin
          lObject := lBand.Objects[liObject];

          if lObject.IsDataAware and lObject.ParentDataPipeline then
            begin
              if (lObject.DataPipeline <> nil) then
                begin
                  if (lObject.DataPipeline = aOldDataPipeline) then
                    lObject.DataPipeline := aNewDataPipeline;
                end

              else
                begin
                  if (aNewDataPipeline <> nil) and
                      ((lObject.DataField = '') or (aNewDataPipeline.FindField(lObject.DataField) <> -1)) then
                    lObject.DataPipeline := aNewDataPipeline;
                end;

            end; {if, object is databased}

        end; {for, each component}

    end; {for, each band}

  {update datapipeline property of groups}
  for liIndex := 0 to FGroups.Count - 1 do
    begin
      lGroup := TppGroup(FGroups[liIndex]);

      if lGroup.BreakType = btDataField then
        begin
          if (lGroup.DataPipeline <> nil) and (lGroup.DataPipeline = aOldDataPipeline) then
            lGroup.DataPipeline := aNewDataPipeline

          else if (aNewDataPipeline <> nil) and
                  ((lGroup.BreakName = '') or (aNewDataPipeline.FindField(lGroup.BreakName) <> -1)) then
            lGroup.DataPipeline := aNewDataPipeline;

        end; {if, group is databased}

    end; {for, each group}

end; {procedure, UpdateParentDataPipeline}

{------------------------------------------------------------------------------}
{ TppCustomReport.Loaded }

procedure TppCustomReport.Loaded;
begin

  {create header, detail, footer - if needed}
  CreateDefaultBands;

  {convert ColumnPositions to proper decimal separator}
  if (DecimalSeparator <> '.') then
    begin
      ppPeriodToDecimalSeparator(FmmColumnPositions);

      ppConvertMemoTabStops(Self);
    end;

  {this calls convert, if necessary}
  inherited Loaded;

  {load the template for this report}
  if FSaveAsTemplate and not (pppcTemplateLoading in DesignState) then
    begin
      if MainReport <> Self then
        MainReport.DoOnLoadTemplate(Self);
      try
        if (csDesigning in ComponentState) and (MainReport = Self) then
          {do nothing}
        else
          FTemplate.Load;
      except
      end;
    end;


end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TppCustomReport.Convert }

procedure TppCustomReport.Convert(aVersionNo: Integer);
var
  liIndex: Integer;
  lrColumnWidth: Single;
  llColumnWidth: Longint;
  liColumn: Integer;
begin

  inherited Convert(aVersionNo);

  {convert AutoStop property value}
  if (aVersionNo < 4100) then
    AutoStop := False;

  {convert column width}
  if (aVersionNo < 3000) then
    begin
      PrinterSetup.Units := FUnits;
      PrinterSetup.ConvertPrinterSetup;

      {convert column positions}
      for liColumn := 0 to FmmColumnPositions.Count - 1 do
        try
          if (FmmColumnPositions[liColumn] <> '') then
            FmmColumnPositions[liColumn] := IntToStr(ppToMMThousandths(StrToFloat(FmmColumnPositions[liColumn]),
                                                   FUnits, pprtHorizontal, nil));
        except on EConvertError do
          FmmColumnPositions[liColumn] := '';
        end;

      FColumnWidth := ppToMMThousandths(FOldColumnWidth, FUnits, pprtHorizontal, nil);

      {adjust column width if too wide}
      if (FmmColumnPositions.Count = 0) and (FColumns > 1) and
         ((FColumnWidth * FColumns) >  PrinterSetup.PageDef.mmPrintableWidth) then
        begin
          llColumnWidth := PrinterSetup.PageDef.mmPrintableWidth div FColumns;

          lrColumnWidth := ppFromMMThousandths(llColumnWidth, FUnits, pprtHorizontal, nil);

          SetColumnWidth(lrColumnWidth);
        end;

      FPassSetting := psTwoPass;
    end;

  {convert bands}
  for liIndex := 0 to BandCount - 1 do
    Bands[liIndex].Convert(VersionNo);

  {convert groups}
  for liIndex := 0 to GroupCount - 1 do
    Groups[liIndex].Convert(VersionNo);

  FModified := True;

  {indicate to form designer that this component has been modified}
  if (Owner is TForm) and (TForm(Owner).Designer <> nil) then
    TForm(Owner).Designer.Modified;

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TppCustomReport.RaiseException }

procedure TppCustomReport.RaiseException(aException: Exception);
begin
  inherited RaiseException(aException);

  if FEngine.Printing then
    FEngine.StopPrinting := True;

  {raise the exception for real}
  if not(FEngine.SilentExceptions) then
    raise EPrintError.Create(ppLoadStr(1023) + #13#10 + #13#10 + aException.Message); {'Cannot generate report.'}
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.FreeBandsAndGroups }

procedure TppCustomReport.FreeBandsAndGroups;
var
  liBand: Integer;
  lBand: TObject;
  liGroup: Integer;
  lGroup: TObject;
begin

  {destroy non-group bands}
  for liBand := BandCount-1 downto 0 do
    begin
      lBand := Bands[liBand];

     if (lBand is TppGroupBand) then
        RemoveBand((lBand as TppBand))
      else
        lBand.Free;

    end;

  FBands.Clear;

  {destroy groups (groups will then destroy their associated bands)}
  for liGroup := GroupCount-1 downto 0 do
    begin
      lGroup := Groups[liGroup];
      lGroup.Free;
    end;

  FGroups.Clear;

end;

{------------------------------------------------------------------------------}
{ TppCustomReport.FreeModules }

procedure TppCustomReport.FreeModules;
var
  liModule: Integer;
  liModuleCount: Integer;
begin

  if (FModules = nil) then Exit;

  liModuleCount := FModules.Count;

  for liModule := liModuleCount-1 downto 0 do
    TObject(FModules[liModule]).Free;

  FModules.Free;
  FModules := nil;

end; {procedure, FreeModules}



{------------------------------------------------------------------------------}
{ TppCustomReport.CreateDefaultBands - create Header, Detail, Footer bands}

procedure TppCustomReport.CreateDefaultBands;
var
  lBandType: TppBandType;
  lBandClass: TppBandClass;
  lBand: TppBand;

begin

  if FBands.Count > 0 then Exit;


  if FColumns > 1 then
    FDefaultBands := FDefaultBands + [btColumnHeader, btColumnFooter]
  else
    FDefaultBands := FDefaultBands - [btColumnHeader, btColumnFooter];

  for lBandType := Low(TppBandType) to High(TppBandType) do
    if (lBandType in FDefaultBands) and (GetBand(lBandType, 0) = nil) then
      begin

        {get band class }
        case lBandType of
          btHeader       : lBandClass := TppHeaderBand;
          btTitle        : lBandClass := TppTitleBand;
          btColumnHeader : lBandClass := TppColumnHeaderBand;
          btDetail       : lBandClass := TppDetailBand;
          btColumnFooter : lBandClass := TppColumnFooterBand;
          btSummary      : lBandClass := TppSummaryBand;
          btFooter       : lBandClass := TppFooterBand;
          btPageStyle    : lBandClass := TppPageStyle;

        else
          lBandClass := nil

        end; {case}

        if lBandClass <> nil then
          begin
            lBand := TppBand(ppComponentCreate(Self, lBandClass));
            lBand.Report := Self;
          end;

      end;

end; {procedure, CreateDefaultBands}

{------------------------------------------------------------------------------}
{ TppCustomReport.ObjectByName }

function TppCustomReport.ObjectByName(var aBandIndex: Integer; var aComponentIndex: Integer;
                                             const aComponentName: String): Boolean;
var
  liBand: Integer;
  lBand: TppBand;
  liComponent: Integer;
  lbComponentFound: Boolean;

begin
  lbComponentFound := False;
  liBand := 0;
  liComponent := 0;


  while not(lbComponentFound) and (liBand < BandCount) do
    begin
      lBand := Bands[liBand];

      if lBand.ObjectByName(liComponent, aComponentName) then
        lbComponentFound := True
      else
        Inc(liBand);

    end;

  if lbComponentFound then
    begin
      aBandIndex      := liBand;
      aComponentIndex := liComponent;
    end
  else
    begin
      aBandIndex      := 0;
      aComponentIndex := 0;
    end;

  Result := lbComponentFound;

end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetFirstPass }

function TppCustomReport.GetFirstPass: Boolean;
begin
  Result := (esFirstPass in FEngine.State);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetSecondPass }

function TppCustomReport.GetSecondPass: Boolean;
begin
  Result := (esSecondPass in FEngine.State);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.FireAfterPrint }

function TppCustomReport.FireAfterPrint: Boolean;
var
  lMainReport: TppCustomReport;
begin

  Result := False;

  lMainReport := GetMainReport;

  if (lMainReport.Publisher.OnlyScreenDevicesConnected) then Exit;

  {if (lMainReport.PreviewForm <> nil) and (lMainReport.PreviewForm.Visible) then Exit;}

  {if (pppcPreviewing in lMainReport.DesignState) then Exit;}

  Result := True;

end; {function, FireAfterPrint}

{------------------------------------------------------------------------------}
{ TppCustomReport.TriggerCodeModuleCreate }

procedure TppCustomReport.TriggerCodeModuleCreate;
var
  lSubReportList: TStringList;
  liIndex: Integer;
  lReport: TppCustomReport;
begin

  inherited TriggerCodeModuleCreate;

  TriggerCodeModuleBeforePrint;


  lSubReportList := TStringList.Create;

  GetFirstLevelSubReports(lSubReportList);

  for liIndex := 0 to lSubReportList.Count - 1 do
    begin
      lReport := TppCustomReport(lSubReportList.Objects[liIndex]);

      lReport.TriggerCodeModuleCreate;
      lReport.TriggerCodeModuleBeforePrint;
    end;

  lSubReportList.Free;

end; {procedure, TriggerCodeModuleCreate}

{------------------------------------------------------------------------------}
{ TppCustomReport.TriggerCodeModuleDestroy }

procedure TppCustomReport.TriggerCodeModuleDestroy;
var
  lSubReportList: TStringList;
  lReport: TppCustomReport;
  liIndex: Integer;
begin

  lSubReportList := TStringList.Create;

  GetFirstLevelSubReports(lSubReportList);

  for liIndex := 0 to lSubReportList.Count - 1 do
    begin
      lReport := TppCustomReport(lSubReportList.Objects[liIndex]);

      lReport.TriggerCodeModuleAfterPrint;
      lReport.TriggerCodeModuleDestroy;
    end;

  lSubReportList.Free;

  
  TriggerCodeModuleAfterPrint;

  inherited TriggerCodeModuleDestroy;

end; {procedure, TriggerCodeModuleDestroy}

{------------------------------------------------------------------------------}
{ TppCustomReport.DoOnEndFirstPass }

procedure TppCustomReport.DoOnEndFirstPass;
begin
  if Assigned(FOnEndFirstPass) then FOnEndFirstPass(Self);

  SendEventNotify(Self, ciEngineEndFirstPass, nil);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.DoOnEndSecondPass }

procedure TppCustomReport.DoOnEndSecondPass;
begin
  if Assigned(FOnEndSecondPass) then FOnEndSecondPass(Self);

  SendEventNotify(Self, ciEngineEndSecondPass, nil);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.DoOnStartFirstPass }

procedure TppCustomReport.DoOnStartFirstPass;
begin
  if Assigned(FOnStartFirstPass) then FOnStartFirstPass(Self);

  SendEventNotify(Self, ciEngineStartFirstPass, nil);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.DoOnStartSecondPass }

procedure TppCustomReport.DoOnStartSecondPass;
begin
  if Assigned(FOnStartSecondPass) then FOnStartSecondPass(Self);

  SendEventNotify(Self, ciEngineStartSecondPass, nil);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.DoOnStartColumn }

procedure TppCustomReport.DoOnStartColumn;
begin
  if Assigned(FOnStartColumn) then FOnStartColumn(Self);

  SendEventNotify(Self, ciEngineStartColumn, nil);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.DoOnStartPage }

procedure TppCustomReport.DoOnStartPage;
begin
  if Assigned(FOnStartPage) then FOnStartPage(Self);

  SendEventNotify(Self, ciEngineStartPage, nil);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.DoOnEndColumn }

procedure TppCustomReport.DoOnEndColumn;
begin
  if Assigned(FOnEndColumn) then FOnEndColumn(Self);

  SendEventNotify(Self, ciEngineEndColumn, nil);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.DoOnEndPage }

procedure TppCustomReport.DoOnEndPage;
begin
  if Assigned(FOnEndPage) then FOnEndPage(Self);

  SendEventNotify(Self, ciEngineEndPage, nil);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetReportBandCount }

function TppCustomReport.GetReportBandCount: Integer;
begin
  Result := Engine.ReportBandCount;
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetPageBandCount }

function TppCustomReport.GetPageBandCount: Integer;
begin
  Result := Engine.PageBandCount;
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetUserName }

function TppCustomReport.GetUserName: TComponentName;
begin
  Result := 'Report'; {do not localize}
end; {function, GetUserName}


{------------------------------------------------------------------------------}
{ TppCustomReport.SetUnits }

procedure TppCustomReport.SetUnits(aUnits: TppUnitType);
var
  liGroup: Integer;
  liBand: Integer;
begin

  FUnits := aUnits;

  {notify printer setup object}
  PrinterSetup.Units := FUnits;

  {notify bands}
  for liGroup := 0 to FGroups.Count-1 do
    Groups[liGroup].Units := FUnits;

  {notify bands}
  for liBand := 0 to FBands.Count-1 do
    Bands[liBand].Units := FUnits;

  if not (csReading in ComponentState) and not (csLoading in ComponentState) then
    {notify report designer}
    SendDesignMessage(PM_UNITSCHANGE, ppWCustomMsg, Ord(FUnits));

end; {procedure, SetUnits}

{------------------------------------------------------------------------------}
{ TppCustomReport.DefineProperties - read/write private 'fake' properties }

procedure TppCustomReport.DefineProperties(Filer: TFiler);
var
  lAncestor: TppCustomReport;

begin

  inherited DefineProperties(Filer);

{$IFDEF WIN32}

  if (Filer.Ancestor is TppCustomReport) then
    lAncestor := TppCustomReport(Filer.Ancestor)
  else
    lAncestor := nil;

{$ELSE}
    lAncestor := nil;
{$ENDIF}

  if (lAncestor <> nil) then
    Filer.DefineProperty('mmColumnWidth', ReadColumnWidth, WriteColumnWidth, FColumnWidth <> lAncestor.FColumnWidth)
  else
    Filer.DefineProperty('mmColumnWidth', ReadColumnWidth, WriteColumnWidth, True);


  {used for conversion to 3.0}
  Filer.DefineProperty('RulerUnits', ReadRulerUnits, nil, False);

end; {procedure, DefineProperties}

{------------------------------------------------------------------------------}
{ TppCustomReport.DoOnLoadTemplate }

procedure TppCustomReport.DoOnLoadTemplate(aReport: TppCustomReport);
begin

end; {procedure, DoOnLoadTemplate}


{------------------------------------------------------------------------------}
{ TppCustomReport.ReadColumnWidth }

procedure TppCustomReport.ReadColumnWidth(Reader: TReader);
begin
  FColumnWidth := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.WriteColumnWidth }

procedure TppCustomReport.WriteColumnWidth(Writer: TWriter);
begin
  Writer.WriteInteger(FColumnWidth);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.ReadRulerUnits }

procedure TppCustomReport.ReadRulerUnits(Reader: TReader);
var
  lsOldUnits: String;
begin
  lsOldUnits := Reader.ReadIdent;

  if lsOldUnits = 'utPixels' then
    FUnits := utScreenPixels

  else if lsOldUnits = 'utInches' then
    FUnits := utInches

  else if lsOldUnits = 'utMillimeters' then
    FUnits := utMillimeters


end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetTheBand }

function TppCustomReport.GetTheBand(Index: Integer): TppBand;
begin
  Result := FBands[Index];
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetGroupCount }

function TppCustomReport.GetGroupCount: Integer;
begin
  Result := FGroups.Count;
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetTheGroup }

function TppCustomReport.GetTheGroup(Index: Integer): TppGroup;
begin
  Result := FGroups[Index];
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.FindGroup }

function TppCustomReport.FindGroup(aGroup: TppGroup): Integer;
begin
  Result := FGroups.IndexOf(aGroup);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetBandCount }

function TppCustomReport.GetBandCount: Integer;
begin
  Result := FBands.Count;
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.FindBand }

function TppCustomReport.FindBand(aBand: TppBand): Integer;
begin
  Result := FBands.IndexOf(aBand);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetColumnPositions }

function TppCustomReport.GetColumnPositions: TStrings;
begin

  if (csWriting in ComponentState) or
     (csReading in ComponentState) or (csLoading in ComponentState) then

    Result := FmmColumnPositions

  else
    begin

      TStringList(FColumnPositions).OnChange := nil;
      FColumnPositions.Assign(FmmColumnPositions);

      ppStringsFromMMThousandths(FColumnPositions, Units, pprtHorizontal, Printer);

      TStringList(FColumnPositions).OnChange := ColumnPositionsChange;

      Result := FColumnPositions;

    end;


end; {procedure, GetColumnPositions}

{------------------------------------------------------------------------------}
{ TppCustomReport.SetColumnPositions }

procedure TppCustomReport.SetColumnPositions(Value: TStrings);
begin

  FColumnPositions.Assign(Value);

end; {procedure, SetColumnPositions}

{------------------------------------------------------------------------------}
{ TppCustomReport.ColumnPositionsChange }

procedure TppCustomReport.ColumnPositionsChange(Sender: TObject);
begin

  FmmColumnPositions.Assign(FColumnPositions);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  ppStringsToMMThousandths(FmmColumnPositions, Units, pprtHorizontal, Printer);

  {notify report engine}
  Reset;

end; {procedure, ColumnPositionsChange}

{------------------------------------------------------------------------------}
{ TppCustomReport.SetColumns }

procedure TppCustomReport.SetColumns(Value: Integer);
var
  liOldColumns: Integer;
  llOldColumnWidth: Longint;
  lsMessage: String;
  lbConfirmChange: Boolean;
  lColumnHeader: TppBand;
  lColumnFooter: TppBand;
begin

  liOldColumns     := FColumns;
  llOldColumnWidth := FColumnWidth;

  FColumns := Value;

  if (FColumns < 1) then
    FColumns := 1;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;


  lbConfirmChange := True;

  if (FColumns > 1) then
    begin

      {calc ColumnWidth as PageWidth/Columns}
      FColumnWidth := PrinterSetup.PageDef.mmPrintableWidth div FColumns;

      {confirm change to column based report - some ppComponents may be deleted }
      lsMessage := ppLoadStr(292);
      lbConfirmChange := ConfirmWidthChange(FColumnWidth, lsMessage);

      {at run-time create columns here}
      if lbConfirmChange and not(pppcDesigning in DesignState) and (liOldColumns = 1) and (FBands.Count > 0) then
        begin
          {create column header}
          lColumnHeader        := TppColumnHeaderBand.Create(nil);
          lColumnHeader.Name   := GetValidName(lColumnHeader);
          lColumnHeader.Report := Self;

          {create column footer}
          lColumnFooter        := TppColumnFooterBand.Create(nil);
          lColumnFooter.Name   := GetValidName(lColumnFooter);
          lColumnFooter.Report := Self;
        end;

    end

  {notify report designer to CalcWorkspaceSize - if switching from column style report  }
  else if (FColumns = 1) and (ReportDesigner <> nil) then
    begin

      lColumnHeader := GetBand(btColumnHeader,0);
      lColumnFooter := GetBand(btColumnFooter,0);

      {set column width to page width }
      FColumnWidth :=  PrinterSetup.PageDef.mmPrintableWidth;

      {warn user that controls in column header/footer will be deleted}
      if (liOldColumns > 1) then
        begin
          if  (lColumnHeader.ObjectCount > 0) or (lColumnFooter.ObjectCount > 0) then
            begin
              if (lColumnHeader.ObjectCount > 0) and (lColumnFooter.ObjectCount > 0) then
                lsMessage := ppLoadStr(293)

              else if (lColumnHeader.ObjectCount > 0)  then
                lsMessage := ppLoadStr(294)

              else if  (lColumnFooter.ObjectCount > 0) then
                lsMessage := ppLoadStr(295);

              lbConfirmChange := (mrOK = (MessageDlg(lsMessage, mtWarning, mbOKCancel, 0)));
            end;

          if lbConfirmChange and not (pppcDesigning in DesignState) then
            begin
              lColumnHeader.Free;
              lColumnFooter.Free;
            end;

        end {if, old columns exist}
      else
        lbConfirmChange := True;

   end;

  if lbConfirmChange then

     {notify affected objects }
     LayoutChanged

  else
    begin
      FColumns     := liOldColumns;
      FColumnWidth := llOldColumnWidth;
    end;

end; {procedure, SetColumns}

{------------------------------------------------------------------------------}
{ TppCustomReport.GetColumnWidth }

function TppCustomReport.GetColumnWidth: Single;
begin

  Result := ppFromMMThousandths(FColumnWidth, FUnits, pprtHorizontal, Printer);

end; {procedure, GetColumnWidth}

{------------------------------------------------------------------------------}
{ TppCustomReport.GetScreenPixelColumnWidth }

function TppCustomReport.GetScreenPixelColumnWidth: Integer;
begin

  Result := Trunc(ppFromMMThousandths(FColumnWidth, utScreenPixels, pprtHorizontal, nil));

end; {procedure, GetScreenPixelColumnWidth}


{------------------------------------------------------------------------------}
{ TppCustomReport.SetColumnWidth }

procedure TppCustomReport.SetColumnWidth(Value: Single);
var
  llOldColumnWidth: Longint;
  lsMessage: String;
  lbChangeConfirmed: Boolean;
begin

  {used for conversion to 3.0}
  if csReading in ComponentState then
    begin
      FOldColumnWidth := Value;
      Exit;
    end;

  llOldColumnWidth := FColumnWidth;

  FColumnWidth := ppToMMThousandths(Value, FUnits, pprtHorizontal, Printer);

  {note: Exit, if loading or reading - do not want to execute validation stuff }
  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;



  {make sure column width is not wider than the page}
  if (FColumnWidth > PrinterSetup.PageDef.mmPrintableWidth) then
    FColumnWidth := PrinterSetup.PageDef.mmPrintableWidth;


  {if column width <= 0, then change to non-column type report}
  if (FColumnWidth <= 0) and (FColumns > 1) then
    begin
      FColumnWidth := 0;

      {set columns to 1}
      SetColumns(1);

      {determine whether columns were actually changed to 1}
      lbChangeConfirmed := (FColumns = 1);
    end
  else
    lbChangeConfirmed := True;


  {confirm change - some ppComponents may be deleted}
  if (FColumns > 1) and lbChangeConfirmed then
    begin

      lsMessage := ppLoadStr(292);

      lbChangeConfirmed := ConfirmWidthChange(FColumnWidth, lsMessage);

      {make sure there is room for all columns}
      if lbChangeConfirmed and (FColumns > Trunc(PrinterSetup.PageDef.mmPrintableWidth / FColumnWidth)) then
        FColumns := Trunc(PrinterSetup.PageDef.mmPrintableWidth / FColumnWidth);

    end; {if, cols > 1}


  if lbChangeConfirmed then
     {notify affected objects }
     LayoutChanged
  else
    FColumnWidth := llOldColumnWidth;

end;

{------------------------------------------------------------------------------}
{ TppCustomReport.ConfirmWidthChange }

function TppCustomReport.ConfirmWidthChange(aWidth: Longint; aWarningMessage: String): Boolean;
var
  lbDelete: Boolean;
  lbChange: Boolean;
begin

  Result := True;

  if (FReportDesigner = nil) then Exit;

  {check for any controls that are beyond the column width}
  lbDelete := CheckComponentPositions('Check', aWidth);

  {warn user that controls will be deleted}
  if lbDelete then
    lbChange := (mrOK = MessageDlg(aWarningMessage, mtWarning, mbOKCancel, 0))
  else
    lbChange := True;

  if lbChange and lbDelete then
    CheckComponentPositions('Free', aWidth);

  Result := lbChange;

end; {procedure, ConfirmWidthChange}

{------------------------------------------------------------------------------}
{ TppCustomReport.CheckComponentPositions }

function TppCustomReport.CheckComponentPositions(const aAction: String; aWidth: Longint): Boolean;
var
  lbInvalidPositionFound: Boolean;
  liBand: Integer;
  liBands: Integer;
  liObject: Integer;
  lBand: TppBand;
  lComponent: TppComponent;
  llWidth: Longint;
  
begin
  lbInvalidPositionFound := False;

  liBand := 0;
  liBands := FBands.Count;

  while (liBand < liBands) and not(lbInvalidPositionFound) do
    begin
      lBand := TppBand(Bands[liBand]);

      if (lBand.IsColumnar) then
        llWidth := aWidth
      else
        llWidth := PrinterSetup.PageDef.mmPrintableWidth;

      liObject  := lBand.ObjectCount-1;

      while (liObject >= 0) and not(lbInvalidPositionFound) do
        begin

          lComponent := lBand.Objects[liObject];

          if (lComponent.mmLeft > llWidth) then

            if (aAction = 'Check') then
              lbInvalidPositionFound := True
              
            else if (aAction = 'Free') then
              lComponent.Free;

          Dec(liObject);

        end; {while, each object}

      Inc(liBand);

    end; {while, each band}

  Result := lbInvalidPositionFound;
  
end; {procedure, CheckComponentPositions}

{------------------------------------------------------------------------------}
{ TppCustomReport.SetModified}

procedure TppCustomReport.SetModified(Value: Boolean);
begin
  FModified := Value;
  
  {indicate to form designer that this component has been modified}
  if (FormDesigner <> nil) then
    FormDesigner.Modified;

end;

{------------------------------------------------------------------------------}
{ TppCustomReport.SetName }

procedure TppCustomReport.SetName(const Value: TComponentName);

var
  lppGroup     : TppGroup;
  lppBand      : TppBand;
  lppComponent : TppComponent;
  liBand,
  liGroup,
  liObject,
  liStartPos   : Integer;

  lsOldName : String;

begin

  {save value of old name}
  lsOldName := Name;

  inherited SetName(Value);

  {rename sub-components where needed}
  if (pppcDesigning in DesignState) then
    begin

      for liGroup := 0 to (GroupCount - 1) do
        begin

          lppGroup := TppGroup(Groups[liGroup]);

          {determine whether the first part of this sub-component's name is the
           old report writer name}
          liStartPos := Pos(lsOldName,lppGroup.Name);

          if liStartPos = 1 then
            begin
              {strip off old name and add new name}
              liStartPos := Length(lsOldName)+ 1;
              lppGroup.Name := Value + Copy(lppGroup.Name, liStartPos, Length(lppGroup.Name));
            end;

        end; {rename groups}


      for liBand := 0 to (BandCount - 1) do
        begin

          lppBand := TppBand(Bands[liBand]);

          {determine whether the first part of this sub-component's name is the
           old report writer name}
          liStartPos := Pos(lsOldName,lppBand.Name);
          if liStartPos = 1 then
            begin
              {strip off old name and add new name}
              liStartPos := Length(lsOldName)+ 1;
              lppBand.Name := Value + Copy(lppBand.Name,
                                               liStartPos,
                                               Length(lppBand.Name));
            end;

          {rename this bands objects, if needed}
          for liObject := 0 to (lppBand.ObjectCount - 1) do
            begin

              lppComponent := TppComponent(lppBand.Objects[liObject]);

              {determine whether the first part of this sub-component's name is the
               old report writer name}
              liStartPos := Pos(lsOldName,lppComponent.Name);
              if liStartPos = 1 then
                begin
                  {strip off old name and add new name}
                  liStartPos := Length(lsOldName)+ 1;
                  lppComponent.Name := Value + Copy(lppComponent.Name,
                                               liStartPos,
                                               Length(lppComponent.Name));
                end;

            end; {rename ppComponents}

          end; {rename bands}

      end; {report writer in designing state}

  {remove undelete state}
  SendDesignMessage(PM_COMPONENTNAMECHANGE,ppWCustomMsg,Longint(Self));


end; {procedure, SetName}


{------------------------------------------------------------------------------}
{ TppCustomReport.SetUserName }

procedure TppCustomReport.SetUserName(const aUserName: TComponentName);
var
 lsOldUserName: String;

begin

  lsOldUserName := UserName;

  inherited SetUserName(aUserName);

  {update document name if necessary}
  if (PrinterSetup.DocumentName = lsOldUserName) then
    PrinterSetup.DocumentName := UserName;


end; {procedure, SetUserName}


{------------------------------------------------------------------------------}
{ TppCustomReport.SetReportDesigner }


procedure TppCustomReport.SetReportDesigner(aReportDesigner: TForm);
var
  liBands: Integer;
  liBand: Integer;
  lBand: TppBand;
  liObjects: Integer;
  liObject: Integer;
  lObject: TppComponent;
  lbDesignTimeAndSaveAsTemplate: Boolean;

begin

  if (FReportDesigner = aReportDesigner) then Exit;

  lbDesignTimeAndSaveAsTemplate :=  (csDesigning in ComponentState) and FSaveAsTemplate and
                                    not (pppcTemplateLoading in DesignState) and (MainReport = Self);

  {notify designer window to set remove its reference to this report}
  SendDesignMessage(PM_REMOVEREPORT, ppWCustomMsg, LongInt(Self));

 { if lbDesignTimeAndSaveAsTemplate and (aReportDesigner = nil) then
    FreeBandsAndGroups;}


  FReportDesigner := aReportDesigner;

  if lbDesignTimeAndSaveAsTemplate and (aReportDesigner <> nil) then
    FTemplate.Load;


  {note: keep this property updated}
  ComponentDesigner := TppComponentDesigner(aReportDesigner);


  {notify designer to add a reference to this report}
  SendDesignMessage(PM_ADDREPORT, ppWCustomMsg, LongInt(Self));


  {notify sub-reports }
  liBands := BandCount;

  for liBand := 0 to liBands - 1 do
    begin

      lBand := Bands[liBand];

      liObjects := lBand.ObjectCount;

      for liObject := 0 to liObjects - 1 do
        begin

          lObject := lBand.Objects[liObject];

          if (lObject is TppSubReport) then
               TppSubReport(lObject).Report.ReportDesigner := FReportDesigner;

        end; {for, each component}

    end; {for, each band}



end; {procedure, SetReportDesigner}

{------------------------------------------------------------------------------}
{ TppCustomReport.GetdcPopupMenu }

function TppCustomReport.GetdcPopupMenu(Sender : TObject; CreateMenu: TppMenuCreate): TppPopupMenu;
var
  lPopupMenu: TppPopupMenu;
  liMenu: Integer;

begin
  lPopupMenu := nil;

  {determine whether popup menu already exists for this type of ppComponent}
  liMenu := FdcPopupMenus.IndexOf(Sender.ClassName);

  if liMenu = -1 then
    begin
      {call TppComponent's CreateMenu method}
      CreateMenu(Self, lPopupMenu);

      if (lPopupMenu <> nil) then
        begin
          {assign pass-thru event handler for all popup menu events }
          lPopupMenu.OnPopup := FdcPopupMenuClick;

          {add PopupMenu to list}
          FdcPopupMenus.AddObject(Sender.ClassName, lPopupMenu);
        end;

    end {create popup menu}

  else
    {get popup menu for this type of ppComponent}
    lPopupMenu := TppPopupMenu(FdcPopupMenus.Objects[liMenu]);

 
   Result := lPopupMenu;

end; {procedure, GetdcPopupMenu}

{------------------------------------------------------------------------------}
{ TppCustomReport.SetdcPopupMenuClick }

procedure TppCustomReport.SetdcPopupMenuClick(aMenuClickEvent: TNotifyEvent);
begin
  FdcPopupMenuClick := aMenuClickEvent;
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.SetTemplate }

procedure TppCustomReport.SetTemplate(aTemplate: TppReportTemplate);
begin
  FTemplate.Assign(aTemplate);
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.AddBand }

procedure TppCustomReport.AddBand(aBand: TppBand);
begin
  FBands.Add(aBand);

  if (aBand.Owner <> Owner) and (Owner <> nil) then
    Owner.InsertComponent(aBand);

  SetBandOrder;

  if (pppcDesigning in DesignState) and not (csLoading in ComponentState) and
     not (csReading in ComponentState) then

       PostDesignMessage(PM_BANDADDED,ppWCustomMsg,Longint(aBand));

 Reset;

end; {procedure, AddBand}


{------------------------------------------------------------------------------}
{ TppCustomReport.AddGroup }

procedure TppCustomReport.AddGroup(aGroup : TppGroup);
begin

  FGroups.Add(aGroup);


  if (aGroup.Owner <> Owner) and (Owner <> nil) then
    Owner.InsertComponent(aGroup);

  Reset;

 end; {procedure, AddGroup}

{------------------------------------------------------------------------------}
{ TppCustomReport.AddModule }

procedure TppCustomReport.AddModule(aModule: TppCommunicator);
begin

  if FModules = nil then
    FModules := TList.Create;

  FModules.Add(aModule);

  aModule.AddNotify(Self);


end; {procedure, AddModule}



{------------------------------------------------------------------------------}
{ TppCustomReport.GetBand }

function TppCustomReport.GetBand(aBandType : TppBandType; aGroupIndex: Integer): TppBand;
var
  liBand:  Integer;
  lbFound: Boolean;
  lBand  : TppBand;

begin

  Result := nil;

  if (aBandType = btGroupHeader) or (aBandType = btGroupFooter) then
    {return group band}
    begin

      if (aGroupIndex >= 0) and (aGroupIndex < GroupCount)  then
        with TppGroup(Groups[aGroupIndex]) do
          if (aBandType = btGroupHeader) then
            Result := HeaderBand
          else
            Result := FooterBand;
    end

  else
    {get basic band}
    begin

      liBand  := 0;
      lbFound := False;

      while (not lbFound) and (liBand < BandCount) do
        begin

          lBand := TppBand(Bands[liBand]);

          if (lBand is TppBasicBand) then
            begin

              case aBandType of

                btHeader       : if (lBand is TppHeaderBand)       then lbFound := True;
                btTitle        : if (lBand is TppTitleBand)        then lbFound := True;
                btColumnHeader : if (lBand is TppColumnHeaderBand) then lbFound := True;
                btDetail       : if (lBand is TppDetailBand)       then lbFound := True;
                btColumnFooter : if (lBand is TppColumnFooterBand) then lbFound := True;
                btSummary      : if (lBand is TppSummaryBand)      then lbFound := True;
                btFooter       : if (lBand is TppFooterBand)       then lbFound := True;
                btPageStyle    : if (lBand is TppPageStyle)        then lbFound := True;


              end;
            end;

          if lbFound then
            Result := (lBand as TppBasicBand)
          else
            Inc(liBand);

        end;

  end; {get basic band}


end; {function, GetBand}

{------------------------------------------------------------------------------}
{ TppCustomReport.SetBandOrder }

procedure TppCustomReport.SetBandOrder;

var
  liBand: Integer;
  lBand: TppBand;
  lBandList : TStringList;
  liBands: Integer;

begin

  {any time BandOrder changes, template changes (i.e. add/remove band, group) }
  Reset;

  lBandList := TStringList.Create;

  liBands := FBands.Count;

  {load bands into string list}
  for liBand := 0 to (liBands - 1) do
    begin
      lBand := Bands[liBand];
      lBandList.AddObject(lBand.Rank, lBand);
    end;

  {sort bands}
  lBandList.Sort;

  {rebuild band list}
  FBands.Clear;

  for liBand := 0 to (liBands - 1) do
    FBands.Add(lBandList.Objects[liBand]);

  lBandList.Free;

end; {procedure, SetBandOrder}

{------------------------------------------------------------------------------}
{ TppCustomReport.RemoveBand }

procedure TppCustomReport.RemoveBand(aBand: TppBand);
begin
  FBands.Remove(aBand);

  SetBandOrder;

  if (pppcDesigning in DesignState) and not (csLoading in ComponentState) and
     not (csReading in ComponentState) and not (csDestroying in ComponentState) then


       SendDesignMessage(PM_BANDREMOVED, ppWCustomMsg, Longint(aBand));

  Reset;

end; {procedure, RemoveBand}

{------------------------------------------------------------------------------}
{ TppCustomReport.MoveGroup }

procedure TppCustomReport.MoveGroup(aCurrentPos, aNewPos: Integer);
begin
  FGroups.Move(aCurrentPos, aNewPos);

end; {procedure, MoveGroup}

{------------------------------------------------------------------------------}
{ TppCustomReport.RemoveGroup }

procedure TppCustomReport.RemoveGroup(aGroup : TppGroup);
var
  liGroup : Integer;

begin

  FGroups.Remove(aGroup);

  for liGroup := 0 to GroupCount-1 do
    Groups[liGroup].PositionChanged;

  SetBandOrder;

  for liGroup := 0 to GroupCount-1 do
    Groups[liGroup].BandOrderChanged;

 
  Reset;
  
end; {procedure, RemoveGroup}

{------------------------------------------------------------------------------}
{ TppCustomReport.RemoveModule }

procedure TppCustomReport.RemoveModule(aModule: TppCommunicator);
begin

  if (FModules = nil) then Exit;

  {note: do not free FModules in this routine, event
         though it may now be empty}
  FModules.Remove(aModule);

  aModule.RemoveNotify(Self);

end; {procedure, RemoveModule}

{------------------------------------------------------------------------------}
{ TppCustomReport.GetModuleForClass }

function TppCustomReport.GetModuleForClass(aModuleClass: TClass): TppCommunicator;
var
  liIndex: Integer;
  lCommunicator: TppCommunicator;
begin

  Result := nil;

  if (FModules = nil) then Exit;

  liIndex := 0;

  while (Result = nil) and (liIndex < FModules.Count) do
    begin
      lCommunicator := TppCommunicator(FModules[liIndex]);

      if (lCommunicator is aModuleClass) then
        Result := lCommunicator
      else
        Inc(liIndex);
    end;

end; {function, GetModuleForClass}

{------------------------------------------------------------------------------}
{ TppCustomReport.HasParentCodeModules }

function TppCustomReport.HasParentCodeModules: Boolean;
begin

  if (ParentReport <> nil) then
    begin
      Result := (ParentReport.CodeModule <> nil);

      if not(Result) then
        Result := ParentReport.HasParentCodeModules;
    end

  else
    Result := False;

end; {function, HasParentCodeModules}

{------------------------------------------------------------------------------}
{ TppCustomReport.GetCodeModule }

function TppCustomReport.GetCodeModule: TComponent;
var
  liIndex: Integer;
  lComponent: TComponent;
begin

  Result := nil;

  if (FModules = nil) then Exit;

  liIndex := 0;

  while (Result = nil) and (liIndex < FModules.Count) do
    begin
      lComponent := TComponent(FModules[liIndex]);

      if (lComponent.ClassName = 'TraCodeModule') then
        Result := TComponent(FModules[liIndex])
      else
        Inc(liIndex);
    end;

end; {function, GetCodeModule}

{------------------------------------------------------------------------------}
{ TppCustomReport.GetAbsolutePageNo }

function TppCustomReport.GetAbsolutePageNo: Longint;
begin
   Result := Engine.AbsolutePageNo;
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetAbsolutePageCount }

function TppCustomReport.GetAbsolutePageCount: Longint;
begin
   Result := Engine.AbsolutePageCount;
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetPageNo }

function TppCustomReport.GetPageNo: Longint;
begin
   Result := Engine.PageNo;
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetPageCount }

function TppCustomReport.GetPageCount: Longint;
begin
   Result := Engine.PageCount;
end;

{------------------------------------------------------------------------------}
{ TppCustomReport.GetPrintDateTime }

function TppCustomReport.GetPrintDateTime: TDateTime;
begin
   Result := Engine.PrintDateTime;
end;


{------------------------------------------------------------------------------}
{ TppCustomReport.SetGroupPosition }

procedure TppCustomReport.SetGroupPosition(aGroup: TppGroup; aPosition: Integer );
var
  liGroup,
  liCurrentPosition : Integer;

begin

  liCurrentPosition := FindGroup(aGroup);

  if (liCurrentPosition <> aPosition) and (liCurrentPosition >= 0) then
    begin

      MoveGroup(liCurrentPosition, aPosition);

      for liGroup := 0 to GroupCount-1 do
        Groups[liGroup].PositionChanged;


      SetBandOrder;

      for liGroup := 0 to GroupCount-1 do
        Groups[liGroup].BandOrderChanged;

    end; {move group to new position}

end; { procedure, SetGroupPosition }

{------------------------------------------------------------------------------}
{ TppCustomReport.TemplateChanged }

procedure TppCustomReport.TemplateChanged;
begin
  Reset;
end; {procedure, TemplateChanged}

{------------------------------------------------------------------------------}
{ TppCustomReport.Reset }

procedure TppCustomReport.Reset;
begin

  inherited Reset;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (Producing) then Exit;

  {notify report engine that template has changed (this will cause repagination) }
  if (FEngine <> nil) then
    FEngine.Reset;

end; {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppCustomReport.ReadState }

procedure TppCustomReport.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
 { try
    inherited ReadState(Reader);
  except
    on EClassNotFound do
      if (Pos('TraCodeModule', Message) > 0) then
        ShowMessage('RAP is not installed');
  end;  }

end; {procedure, ReadState}


{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppCustomReport.GetChildren - write report bands as subcomponents to .DFM }

{$IFDEF Delphi3}
   procedure TppCustomReport.GetChildren(Proc: TGetChildProc;Root: TComponent);
{$ELSE}
   procedure TppCustomReport.GetChildren(Proc: TGetChildProc);
{$ENDIF}

var
  liBand,
  liGroup,
  liIndex : Integer;
  lBand   : TppBand;
  lGroup  : TppGroup;
  lModule : TppCommunicator;

begin

  {write non-group bands: Header, Title, Detail, Summary, Footer }
  for liBand := 0 to (BandCount - 1) do
    begin
      lBand := TppBand(Bands[liBand]);

      if not(lBand is TppGroupBand) then
        Proc(lBand);

    end; {for, each band}

  {write groups (groups then write their associated header & footer group bands) }
  for liGroup := 0 to GroupCount - 1 do
    begin
      lGroup := TppGroup(Groups[liGroup]);
      Proc(lGroup);
    end; {for, each group}


  if (FModules <> nil) then
    for liIndex := 0 to FModules.Count-1 do
      begin
        lModule := TppCommunicator(FModules[liIndex]);
        if not (pppcEmpty in lModule.DesignState) then
          Proc(lModule);
      end;

end;

{$ELSE}

{------------------------------------------------------------------------------}
{ TppCustomReport.WriteComponents - write report bands as subcomponents to .DFM }

procedure TppCustomReport.WriteComponents(Writer: TWriter);
var
  liBand,
  liGroup,
  liIndex : Integer;
  lBand   : TppBand;
  lGroup  : TppGroup;
  lModule : TppCommunicator;

begin

 { MessageDlg('TppCustomReport.WriteComponents, begin',mtInformation,[mbOK],0);}

  {write non-group bands: Header, Title, Detail, Summary, Footer }
  for liBand := 0 to BandCount - 1 do
    begin
      lBand := TppBand(Bands[liBand]);

      if (lBand.Owner = Writer.Root) and not(lBand is TppGroupBand) then
        Writer.WriteComponent(lBand);

    end; {for, each band}

  {write groups (groups then write their associated header & footer group bands) }
  for liGroup := 0 to GroupCount - 1 do
    begin
      lGroup := TppGroup(Groups[liGroup]);

      if lGroup.Owner = Writer.Root then
        Writer.WriteComponent(lGroup);

    end; {for, each group}

  {write modules}
 if (FModules <> nil) then
    for liIndex := 0 to FModules.Count-1 do
      begin
        lModule := TppCommunicator(FModules[liIndex]);
        if not pppcEmpty in lModule.DesignState then
          Writer.WriteComponent(lModule);
      end;


{  MessageDlg('TppCustomReport.WriteComponents, end',mtInformation,[mbOK],0); }

end; {procedure, WriteComponents}


{$ENDIF}



{------------------------------------------------------------------------------}
{ TppCustomReport.FreePopupMenus }

procedure TppCustomReport.FreePopupMenus;
var
  liPopupMenu,
  liMenuItem: Integer;
  lPopupMenu : TPopupMenu;

begin
  if FdcPopupMenus.Count = 0 then Exit;

  {destroy the design-time popup menus}
  for liPopupMenu := FdcPopupMenus.Count-1 downto 0 do
    begin
     lPopupMenu := TPopupMenu(FdcPopupMenus.Objects[liPopupMenu]);

     {free menu items}
     for liMenuItem := lPopupMenu.Items.Count - 1 downto 0 do
       if lPopupMenu.Items[liMenuItem] <> nil then
         lPopupMenu.Items[liMenuItem].Free;

     if lPopupMenu <> nil then
       lPopupMenu.Free;
    end;

  FdcPopupMenus.Clear;

end;



{------------------------------------------------------------------------------}
{ TppCustomReport.GetUniqueUserName }

function TppCustomReport.GetUniqueUserName(aComponent: TComponent): String;
var
  liNameNo: Integer;
  lNumberList: TStringList;
  liBands: Integer;
  liBand: Integer;
  lBand: TppBand;
  liObjects: Integer;
  liObject: Integer;
  lObject: TppComponent;
  lsNamingPrefix: String;
  lObjectList: TStrings;
  lSubReport: TppSubReport;

begin

  {the band username is assigned in its constructor}
  if aComponent is TppBand then
    begin
      Result := TppBand(aComponent).UserName;
      Exit;
    end;


  lNumberList := TStringList.Create;

  lsNamingPrefix := ppGetUserNamePrefix(aComponent);


   if (aComponent is TppSubReport) then
     begin
       lObjectList := TStringList.Create;
       GetSubReports(lObjectList);

       for liObject := 0 to lObjectList.Count-1 do
         begin
           lSubReport := TppSubReport(TppChildReport(lObjectList.Objects[liObject]).Parent);

           if ppExtractUserNamingNumber(lsNamingPrefix,  lSubReport, liNameNo) then
             lNumberList.Add(Format('%8d',[liNameNo]));
         end;

       lObjectList.Free;

     end
   else
     begin
  liBands := BandCount;

  {store currently used naming numbers to lNumberList}
  for liBand := 0 to liBands - 1 do
    begin

      lBand := Bands[liBand];

      liObjects := lBand.ObjectCount;

      for liObject := 0 to liObjects - 1 do
        begin

          lObject := lBand.Objects[liObject];

         {determine whether component is same class type}
         if (lObject is aComponent.ClassType) then
            if ppExtractUserNamingNumber(lsNamingPrefix,  lObject, liNameNo) then
              lNumberList.Add(Format('%8d',[liNameNo]));

        end; {for, each component}

    end; {for, each band}

  end;
  
  Result := lsNamingPrefix + IntToStr(ppGetUniqueNamingNumber(lNumberList));

  lNumberList.Free;

end; {function, GetUniqueUserName}


{------------------------------------------------------------------------------}
{ TppCustomReport.FindUserObject }

function TppCustomReport.FindUserObject(aUserName: String): TppCommunicator;
var
  lBand: TppBand;
  liBand: Integer;
  liBandCount: Integer;
  lObject: TppComponent;
  liObject: Integer;
  liObjectCount: Integer;
  lGroup: TppGroup;
  liGroup: Integer;
  liGroupCount: Integer;

begin

  Result := nil;

  liBand := 0;
  liBandCount := BandCount;

  if (CompareText(UserName, aUserName) = 0) then
    Result := Self;

  while (liBand < liBandCount) and (Result = nil) do
   begin
      lBand := Bands[liBand];

      if (CompareText(lBand.UserName, aUserName) = 0) then
        Result := lBand;

      liObject := 0;
      liObjectCount := lBand.ObjectCount;

      while (liObject < liObjectCount) and (Result = nil) do
        begin

          lObject := lBand.Objects[liObject];

          if (CompareText(lObject.UserName, aUserName) = 0) then
            Result := lObject;

          Inc(liObject);

        end; {for, check each component}

      Inc(liBand);

    end; {while, check each band}

  liGroup := 0;
  liGroupCount := GroupCount;

  while (liGroup < liGroupCount) and (Result = nil) do
   begin
      lGroup := Groups[liGroup];

      if (CompareText(lGroup.UserName, aUserName) = 0) then
        Result := lGroup;

     Inc(liGroup);

   end; {while, check each group}

end; {function, FindUserObject}



{******************************************************************************
 *
 ** B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppBand.Create }

constructor TppBand.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAfterGenerate   := nil;
  FAfterPrint      := nil;
  FBeforeGenerate  := nil;
  FBeforePrint     := nil;
  FBottomOffset    := 0;
  FCaption         := '';
  FControlBottoms  := TStringList.Create;
  FDesignControl   := nil;
  FDrawPage        := False;
  FHeight          := 13229; {default height to 1/2 inch}
  FLastBand        := False;
  FObjects         := TList.Create;
  FReport          := nil;
  FRuler           := nil;
  FSave            := False;
  FSaveList        := TList.Create;
  FUnits           := utInches;
  FVisible         := True;
  FVariables       := TList.Create;

  {print behavior related}
  FPrintHeight     := phStatic;
  FPrintPosition   := 0;
  FPrintCount      := 0;
  FPrintTimes      := GetDefaultPrintTimes;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppBand.Destroy }

destructor TppBand.Destroy;
var
  lObject  : TObject;
  liObject : Integer;

begin

  {notify report designer}
  SendDesignMessage(PM_BANDDESTROY, ppWCustomMsg, LongInt(Self));


  if (FDesignControl <> nil) then
    FreeDesignControls;

  {free each report component associated with this band}
  for liObject := 0 to FObjects.Count - 1 do
    begin
      if (FObjects.Count > 0) then
        begin
          lObject := FObjects.Last;
          lObject.Free;
        end;
    end;

  {free report components list}
  FObjects.Free;

  FControlBottoms.Free;

  FReport  := nil;

  FSaveList.Free;
  FVariables.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppBand.GetPrintMessage }

function TppBand.GetPrintMessage: String;
begin
  if (Report <> nil) then
    Result := Report.GetPrintMessage
  else
    Result := '';
end; {function, GetPrintMessage }

{------------------------------------------------------------------------------}
{ TppBand.SetPrintMessage }

procedure TppBand.SetPrintMessage(const aMessage: String);
begin
  if (Report <> nil) then
    Report.SetPrintMessage(aMessage);
end; {procedure, SetPrintMessage }

{------------------------------------------------------------------------------}
{ TppBand.Init }

procedure TppBand.Init;
var
  liIndex: Integer;
begin
  for liIndex := 0 to ObjectCount - 1 do
    Objects[liIndex].Init;
end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppBand.StartOfMainReport }

procedure TppBand.StartOfMainReport;
var
  liIndex: Integer;
begin
  for liIndex := 0 to ObjectCount - 1 do
    Objects[liIndex].StartOfMainReport;
end; {procedure, StartOfMainReport}

{------------------------------------------------------------------------------}
{ TppBand.StartOfParentReport }

procedure TppBand.StartOfParentReport;
var
  liIndex: Integer;
begin
  for liIndex := 0 to ObjectCount - 1 do
    Objects[liIndex].StartOfParentReport;
end; {procedure, StartOfParentReport}

{------------------------------------------------------------------------------}
{ TppBand.EndOfMainReport }

procedure TppBand.EndOfMainReport;
var
  liIndex: Integer;
begin
  for liIndex := 0 to ObjectCount - 1 do
    Objects[liIndex].EndOfMainReport;
end; {procedure, EndOfMainReport}

{------------------------------------------------------------------------------}
{ TppBand.Printing }

function TppBand.Printing: Boolean;
begin
  if (FReport <> nil) then
    Result := FReport.Printing
  else
    Result := False;
end;

{------------------------------------------------------------------------------}
{ TppBand.ChangeOwner }

procedure TppBand.ChangeOwner(aNewOwner: TComponent);
var
  liObject:  Integer;

begin

  if (aNewOwner = Owner) then Exit;

  inherited ChangeOwner(aNewOwner);

  {assign new owner for objects}
  for liObject := 0 to (FObjects.Count-1) do
    Objects[liObject].ChangeOwner(aNewOwner);

end; {procedure, ChangeOwner }

{------------------------------------------------------------------------------}
{ TppBand.Reset }

procedure TppBand.Reset;
begin
  if (FReport <> nil) then
    FReport.Reset;
end;  {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppBand.IsValidUserName }

function TppBand.IsValidUserName(aUserName: String): Boolean;
begin
  {username is assigned in the ancestor}
  Result := True;
end; {function, IsValidUserName}


{------------------------------------------------------------------------------}
{ TppBand.IsColumnar }

function TppBand.IsColumnar: Boolean;
begin
  Result := True;
end; {function, IsColumnar}

{------------------------------------------------------------------------------}
{ TppBand.IsDataAware }

function TppBand.IsDataAware: Boolean;
begin
  Result := False;
end; {function, IsDataAware}

{------------------------------------------------------------------------------}
{ TppBand.Notify }

procedure TppBand.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppBand.PageStart }

procedure TppBand.PageStart;
var
  liObject: Integer;
  liObjects: Integer;
begin

  liObjects := ObjectCount;

  {notify objects }
  for liObject := 0 to liObjects - 1 do
    Objects[liObject].PageStart;

end; {procedure, PageStart}

{------------------------------------------------------------------------------}
{ TppBand.LanguageChanged }

procedure TppBand.LanguageChanged;
var
  liObject: Integer;
  liObjects: Integer;
begin

  Caption  := GetDescription;

  liObjects := ObjectCount;

  {notify objects }
  for liObject := 0 to liObjects - 1 do
    Objects[liObject].LanguageChanged;

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppBand.GetLanguageIndex }

function TppBand.GetLanguageIndex: Longint;
begin
  if (FReport <> nil) then
    Result := FReport.LanguageIndex
  else
    Result := 0;
end;

{------------------------------------------------------------------------------}
{ TppBand.DSInclude }

procedure TppBand.DSInclude(aDesignStateSet: TppDesignStates);
var
  liObject: Integer;

begin

  inherited DSInclude(aDesignStateSet);

  {notify report components}
  for liObject := 0 to FObjects.Count-1 do
    Objects[liObject].DSInclude(aDesignStateSet);


end; {procedure, DSInclude}

{------------------------------------------------------------------------------}
{ TppBand.DSExclude }

procedure TppBand.DSExclude(aDesignStateSet: TppDesignStates);
var
  liObject: Integer;
begin

  {notify objects}
  for liObject := 0 to FObjects.Count-1 do
    Objects[liObject].DSExclude(aDesignStateSet);

  inherited DSExclude(aDesignStateSet);

end; {procedure, DSExclude}

{------------------------------------------------------------------------------}
{ TppBand.InstantiateDesignControls }

procedure TppBand.InstantiateDesignControls;

var
  liObject: Integer;
  lComponent: TppComponent;
  lDesignControl: TppDesignControl;

begin

  if (Freport = nil) or (FReport.ReportDesigner = nil) or (FDesignControl <> nil) then Exit;

  if not (pppcDesigning in DesignState) then
    DSInclude([pppcDesigning]);

  SendDesignMessage(PM_INSTANTIATEBANDDC, ppWCustomMsg, LongInt(Self));

  FDesignControl.PopupMenu   := FReport.GetdcPopupMenu(Self, CreatePopupMenu);

  {build control bottoms list - used to find the lowest control on a band}
  FControlBottoms.Clear;

  {instantiate component design controls }
  for liObject := 0 to (FObjects.Count - 1) do
    begin
      lComponent := Objects[liObject];
      lComponent.InstantiateDesignControl;

      if not lComponent.ParentHeight then
        begin
          lDesignControl := lComponent.DesignControl;
          FControlBottoms.AddObject(Format('%8d',[(lDesignControl.Top + lDesignControl.Height)]), lDesignControl);
        end;
    end;

end; {procedure, InstantiateDesignControls}



{------------------------------------------------------------------------------}
{ TppBand.FreeDesignControls }

procedure TppBand.FreeDesignControls;

var
  liObject: Integer;
  lComponent: TppComponent;

begin

  if pppcDesigning in DesignState then
    DSExclude([pppcDesigning]);

  {Free component design controls }
  for liObject := 0 to (FObjects.Count - 1) do
    begin
      lComponent := Objects[liObject];
      lComponent.FreeDesignControl;
    end;

  FDesignControl.Free;
  FDesignControl := nil;
  FRuler.Free;
  FRuler := nil;

  if (FControlBottoms <> nil) then
    FControlBottoms.Clear;

  if (Owner is TppCustomReport) then Owner.RemoveComponent(Self);

end; {procedure, FreeDesignControls}


{------------------------------------------------------------------------------}
{ TppBand.CreatePopupMenu }

procedure TppBand.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  aPopupMenu := TppBandPopupMenu.Create(nil);
  aPopupMenu.LanguageIndex := GetLanguageIndex;

  {parameteres: GroupIndex, Name, Caption, StringID}
  aPopupMenu.AddItem(10, 'DynamicHeight', '',232);
  aPopupMenu.AddItem(10, 'StaticHeight', '', 242);
  aPopupMenu.AddItem(20, 'mniLine1', '-', 0);

  aPopupMenu.AddItem(30, 'CalcOrder', '', 693); {'&Calc Order...'}
  aPopupMenu.AddItem(30, 'Position', '', 386);
  aPopupMenu.AddItem(30, 'Visible', '', 247);

end; {procedure, CreatePopupMenu}


{------------------------------------------------------------------------------}
{ TppBand.PopupMenuClick }

procedure TppBand.PopupMenuClick(Sender: TObject);
var
  lPopupMenu: TppPopupMenu;

begin

  lPopupMenu := TppPopupMenu(Sender);

  {this will set the Checked state for Boolean property menu items
   and assign event-handlers for the the Boolean item OnClick events}
  lPopupMenu.SetMenuItemState(Self);


  {set menu item.checked to reflect value of boolean properties}
  lPopupMenu.ItemByName('DynamicHeight').Checked := (PrintHeight = phDynamic);
  lPopupMenu.ItemByName('StaticHeight').Checked  := (PrintHeight = phStatic);

  {assign menu item event handlers}
  lPopupMenu.ItemByName('DynamicHeight').OnClick := DynamicMenuClick;
  lPopupMenu.ItemByName('StaticHeight').OnClick := StaticMenuClick;

  lPopupMenu.ItemByName('CalcOrder').OnClick := CalcOrderMenuClick;
  lPopupMenu.ItemByName('Position').OnClick := PositionMenuClick;

end; {procedure, PopupMenuClick}


{------------------------------------------------------------------------------}
{ TppBand.DynamicMenuClick }

procedure TppBand.DynamicMenuClick(Sender: TObject);
begin
  PrintHeight := phDynamic;
end; {procedure, DynamicMenuClick}

{------------------------------------------------------------------------------}
{ TppBand.StaticMenuClick }

procedure TppBand.StaticMenuClick(Sender: TObject);
begin
  PrintHeight := phStatic;
end; {procedure, StaticMenuClick}


{------------------------------------------------------------------------------}
{ TppBand.CalcOrderMenuClick }

procedure TppBand.CalcOrderMenuClick(Sender: TObject);
var
  lOrderDialog: TppCustomCalcOrderDialog;
  lFormClass: TFormClass;

begin

  lFormClass := ppGetFormClass(TppCustomCalcOrderDialog);

  lOrderDialog := TppCustomCalcOrderDialog(lFormClass.Create(Application));
  lOrderDialog.LanguageIndex     := LanguageIndex;
  lOrderDialog.Report            := FReport;
  lOrderDialog.CurrentBand       := Self;

  lOrderDialog.ShowModal;
  lOrderDialog.Free;


end;  {procedure, CalcOrderMenuClick}



{------------------------------------------------------------------------------}
{ TppBand.PositionMenuClick }

procedure TppBand.PositionMenuClick(Sender: TObject);
var
  lPosDialog: TppCustomBandPositionDialog;
  lFormClass: TFormClass;

begin

  lFormClass := ppGetFormClass(TppCustomBandPositionDialog);

  lPosDialog := TppCustomBandPositionDialog(lFormClass.Create(Application));
  lPosDialog.LanguageIndex     := LanguageIndex;
  lPosDialog.Report            := FReport;
  lPosDialog.Band              := Self;
  lPosDialog.Units             := FReport.Units;
  lPosDialog.OnPositionChange  := PositionChange;
  lPosDialog.PropHeight        := Height;
  lPosDialog.PropBottomOffset  := BottomOffset;
  lPosDialog.PropPrintPosition := PrintPosition;
  lPosDialog.PropPrintCount    := PrintCount;

  lPosDialog.ShowModal;
  lPosDialog.Free;


end;  {procedure, PositionMenuClick}

{------------------------------------------------------------------------------}
{ TppBand.PositionChange }

procedure TppBand.PositionChange(Sender: TObject);
var
  lPosDialog: TppCustomBandPositionDialog;

begin
  if Sender is TppCustomBandPositionDialog then
    begin
      lPosDialog := TppCustomBandPositionDialog(Sender);
      SetHeight(lPosDialog.PropHeight);
      SetBottomOffset(lPosDialog.PropBottomOffset);
      SetPrintPosition(lPosDialog.PropPrintPosition);
      SetPrintCount(lPosDialog.PropPrintCount);
    end;

end;  {procedure, PositionChange}


{------------------------------------------------------------------------------}
{ TppBand.SetReport }

procedure TppBand.SetReport(aReport: TppCustomReport);
begin

  if (FReport <> nil) then
    begin
      if (DesignControl <> nil) then
        FreeDesignControls;
      FReport.RemoveBand(Self);
    end;

  FReport := aReport;

  if FReport <> nil then
    begin
      FReport.AddBand(Self);

      Caption := GetDescription;

      FUnits  := FReport.Units;

      if pppcDesigning in FReport.DesignState then
        InstantiateDesignControls;

      if pppcDisplayData in FReport.DesignState then
        DSInclude([pppcDisplayData])
      else
        DSExclude([pppcDisplayData]);

    end;

end; {function, SetReport}

{------------------------------------------------------------------------------}
{ TppBand.GetIndex }

function TppBand.GetIndex: Integer;
begin
  if FReport <> nil then
    Result := FReport.FindBand(Self)
  else
    Result := -1;

end; {function, GetIndex}


{------------------------------------------------------------------------------}
{ TppBand.ObjectByName }

function TppBand.ObjectByName(var aComponentIndex: Integer; const aComponentName: String): Boolean;
var
  liObject: Integer;
  lbComponentFound: Boolean;
  
begin
  lbComponentFound := False;
  liObject := 0;

  while not(lbComponentFound) and (liObject < ObjectCount) do
    begin
      if (Objects[liObject].Name = aComponentName) then
        lbComponentFound := True
      else
        Inc(liObject);
    end;

  if lbComponentFound then
    aComponentIndex := liObject;

  Result := lbComponentFound;

end;

{------------------------------------------------------------------------------}
{ TppBand.HasParent - tells the form not to save this band to the .DFM
                       because this band is a sub-component of the Report object}

function TppBand.HasParent: Boolean;
begin
  Result := True;

end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppBand.GetADataPipeline }

function TppBand.GetADataPipeline: TppDataPipeline;
begin
  if (FReport <> nil) then
    Result := FReport.DataPipeline
  else
    Result := nil;
end;

{------------------------------------------------------------------------------}
{ TppBand.GetObject }
function  TppBand.GetObject(aIndex: Integer): TppComponent;
begin
  Result := FObjects[aIndex];

end; {function, GetObject}

{------------------------------------------------------------------------------}
{ TppBand.FindObject }

function  TppBand.FindObject(aComponent: TppComponent): Integer;
begin
  Result := FObjects.IndexOf(aComponent);
end; {function, FindObject}

{------------------------------------------------------------------------------}
{ TppBand.MoveObject }

procedure TppBand.MoveObject(aCurIndex, aNewIndex: Integer);
var
  liObject: Integer;
  lComponent: TppComponent;
  liStart: Integer;

begin

  if aNewIndex > FObjects.Count-1 then
    aNewIndex := FObjects.Count-1;

  FObjects.Move(aCurIndex, aNewIndex);

  if (pppcDesigning in DesignState) and not (Printing) then
    begin
      if aCurIndex < aNewIndex then
        liStart := aCurIndex
      else
        liStart := aNewIndex;

      for liObject := liStart to FObjects.Count-1 do
        begin
          lComponent := Objects[liObject];

          if (lComponent.DesignControl <> nil) then
             lComponent.DesignControl.BringToFront;

        end;

       PostDesignMessage(PM_COMPONENTUPDATED, ppWCustomMsg,  Longint(FObjects[aNewIndex]));

    end;

end; {function, MoveObject}

{------------------------------------------------------------------------------}
{ TppBand.GetObjectCount }

function  TppBand.GetObjectCount: Integer;
begin
  Result := FObjects.Count;
end; {function, GetObject}

{------------------------------------------------------------------------------}
{ TppBand.SetCaption }

procedure TppBand.SetCaption(aCaption: String);
begin

  FCaption := aCaption;

  if (pppcDesigning in DesignState) and (FDesignControl <> nil) then
    FDesignControl.Caption := '  ^  ' + aCaption;

end; {procedure, SetCaption }

{------------------------------------------------------------------------------}
{ TppBand.GetDefaultPrintTimes }

function TppBand.GetDefaultPrintTimes: TppPrintTimesType;
begin
  Result := ptOne;
end;

{------------------------------------------------------------------------------}
{ TppBand.SetPrintCount }

procedure TppBand.SetPrintCount(Value: Integer);
begin

  FPrintCount := Value;

  if (FPrintCount = 0) then
    FPrintTimes := GetDefaultPrintTimes
  else
    FPrintTimes := ptCount;

  if (csReading in ComponentState) then Exit;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetPrintCount}

{------------------------------------------------------------------------------}
{ TppBand.SetVisible }

procedure TppBand.SetVisible(Value: Boolean);
begin
  FVisible := Value;

  if (csReading in ComponentState) then Exit;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetVisible}

{------------------------------------------------------------------------------}
{ TppBand.SetPrintHeight }

procedure TppBand.SetPrintHeight(aPrintHeight: TppPrintHeightType);
begin

  if FPrintHeight <> aPrintHeight then
    begin
      FPrintHeight := aPrintHeight;

      {notify report designer}
      PropertyChange;

      {notify report engine}
      Reset;
      
    end;

end;

{------------------------------------------------------------------------------}
{ TppBand.BringObjectToFront }

procedure TppBand.BringObjectToFront(aObject: TObject);
var
  lComponent: TppComponent;

begin
  {reposition object to end of list}
  FObjects.Remove(aObject);
  FObjects.Add(aObject);

  lComponent := TppComponent(aObject);
  if (lComponent.DesignControl <> nil) and not (Printing) then
    lComponent.DesignControl.BringToFront;

  SendDesignMessage(PM_COMPONENTUPDATED, ppWCustomMsg, Longint(aObject));

  Reset;
  
end; {procedure, BringObjectToFront}

{------------------------------------------------------------------------------}
{ TppBand.SendObjectToBack }

procedure TppBand.SendObjectToBack(aObject: TObject);
var
  lComponent: TppComponent;

begin
  {reposition object to front of list}
  FObjects.Remove(aObject);
  FObjects.Insert(0, aObject);

  lComponent := TppComponent(aObject);
  if (lComponent.DesignControl <> nil) and not (Printing) then
    lComponent.DesignControl.SendToBack;

  SendDesignMessage(PM_COMPONENTUPDATED, ppWCustomMsg, Longint(aObject));

  Reset;

end; {procedure, SendObjectToBack}

{------------------------------------------------------------------------------}
{ TppBand.GetVariable }

function TppBand.GetVariable(aIndex: TTabOrder): TppComponent;
begin
  Result := TppComponent(FVariables[aIndex]);
end; {function, GetVariable}

{------------------------------------------------------------------------------}
{ TppBand.GetVariableCount }

function TppBand.GetVariableCount: Integer;
begin
  Result := FVariables.Count;
end; {function, GetVariableCount}

{------------------------------------------------------------------------------}
{ TppBand.FindVariable }

function TppBand.FindVariable(aComponent: TppComponent): Integer;
begin
  Result := IndexOfVariable(aComponent);
end; {function, FindVariable}

{------------------------------------------------------------------------------}
{ TppBand.IndexOfVariable }

function TppBand.IndexOfVariable(aComponent: TppComponent): TTabOrder;
begin
  Result := FVariables.IndexOf(aComponent);
end; {function, IndexOfVariable}

{------------------------------------------------------------------------------}
{ TppBand.AddVariable }

procedure TppBand.AddVariable(aComponent: TppComponent);
begin
  FVariables.Add(aComponent);
end; {function, AddVariable}

{------------------------------------------------------------------------------}
{ TppBand.InsertVariable }

procedure TppBand.InsertVariable(aPosition: TTabOrder; aComponent: TppComponent);
begin
  FVariables.Insert(aPosition, aComponent);
end; {function, InsertVariable}

{------------------------------------------------------------------------------}
{ TppBand.RemoveVariable }

procedure TppBand.RemoveVariable(aComponent: TppComponent);
var
  liIndex: Integer;
begin
  liIndex := FVariables.IndexOf(aComponent);

  if (liIndex >= 0) then
    FVariables.Delete(liIndex);
end; {function, RemoveVariable}

{------------------------------------------------------------------------------}
{ TppBand.FixCalcOrderList }

procedure TppBand.FixCalcOrderList;
var
  liVariables: Integer;
  liIndex: Integer;
  liCalcOrder: Integer;
  lList: TList;
  lVariable: TppVariable;
begin

  if (VariableCount = 0) then Exit;

  lList := TList.Create;

  try
    liVariables := VariableCount;

    lList.Count := liVariables;

    for liIndex := 0 to (liVariables - 1) do
      begin
        lVariable := TppVariable(Variables[liIndex]);

        liCalcOrder := lVariable.GetTheCalcOrder;

        if (liCalcOrder > -1) and (liCalcOrder < liVariables) then
          lList[liCalcOrder] := lVariable;
      end; {for, each variable}


      for liIndex := 0 to (liVariables - 1) do
        begin
          lVariable := TppVariable(lList[liIndex]);

          if (lVariable <> nil) then
            lVariable.UpdateCalcOrder(liIndex);
        end;

  finally
    lList.Free;
  end; {try, finally}

end; {procedure, FixCalcOrderList}

{------------------------------------------------------------------------------}
{ TppBand.SetSave }

procedure TppBand.SetSave(Value: Boolean);
begin
  FSave := Value;

  if (csReading in ComponentState) then Exit;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetSave}

{------------------------------------------------------------------------------}
{ TppBand.GetSave }

function TppBand.GetSave(aIndex: TTabOrder): TppComponent;
begin
  Result := TppComponent(FSaveList[aIndex]);
end; {function, GetSave}

{------------------------------------------------------------------------------}
{ TppBand.GetSaveCount }

function TppBand.GetSaveCount: Integer;
begin
  Result := FSaveList.Count;
end;

{------------------------------------------------------------------------------}
{ TppBand.FindSave }

function TppBand.FindSave(aComponent: TppComponent): Integer;
begin
  Result := IndexOfSave(aComponent);
end; {function, FindSave}

{------------------------------------------------------------------------------}
{ TppBand.IndexOfSave }

function TppBand.IndexOfSave(aComponent: TppComponent): TTabOrder;
begin
  Result := FSaveList.IndexOf(aComponent);
end;

{------------------------------------------------------------------------------}
{ TppBand.AddSave }

procedure TppBand.AddSave(aComponent: TppComponent);
begin
  FSaveList.Add(aComponent);
end;

{------------------------------------------------------------------------------}
{ TppBand.InsertSave }

procedure TppBand.InsertSave(aPosition: TTabOrder; aComponent: TppComponent);
begin
  FSaveList.Insert(aPosition, aComponent);
end;

{------------------------------------------------------------------------------}
{ TppBand.RemoveSave }

procedure TppBand.RemoveSave(aComponent: TppComponent);
var
  liIndex: Integer;
begin
  liIndex := FSaveList.IndexOf(aComponent);
  if (liIndex >= 0) then
    FSaveList.Delete(liIndex);
end;

{------------------------------------------------------------------------------}
{ TppBand.FixSaveOrderList }

procedure TppBand.FixSaveOrderList;
var
  liObjects: Integer;
  liObject: Integer;
  liSaveOrder: Integer;
  lList: TList;
  lObject: TObject;
  lComponent: TppCustomText;
begin
  if (FObjects.Count > 0) then
  begin
    lList := TList.Create;
    try
      liObjects := FObjects.Count - 1;
      lList.Count := liObjects + 1;

      for liObject := 0 to liObjects do
        begin
          lObject := FObjects[liObject];
          if (lObject is TppCustomText) then
            begin
              lComponent := TppCustomText(lObject);
              liSaveOrder := lComponent.GetTheSaveOrder;
              if (liSaveOrder >= 0) and (liSaveOrder <= liObjects) then
                begin
                  lList[liSaveOrder] := lComponent;
                  FSaveList.Add(lComponent);
                end;

            end; {if, object can be saved}
        end; {for, each object}


      for liObject := 0 to liObjects do
        begin
          lComponent := lList[liObject];
          if (lComponent <> nil) then
            TppCustomText(lComponent).UpdateSaveOrder(liObject);
        end;

    finally
      lList.Free;
    end; {try, finally}

  end; {if, objects exist}

end; {procedure, FixSaveOrderList}

{------------------------------------------------------------------------------}
{ TppBand.AddObject }

procedure TppBand.AddObject(aObject: TObject);
var
  lComponent: TppComponent;
  lDesignControl: TppDesignControl;
begin

  if not(aObject is TppComponent) then Exit;

  lComponent := TppComponent(aObject);

  FObjects.Add(lComponent);

  lDesignControl := lComponent.DesignControl;

  {add control to bottoms list (used to find the lowest control on a band)}
  if not (lComponent.ParentHeight) and (lDesignControl <> nil) then
    FControlBottoms.AddObject(Format('%8d',[(lDesignControl.Top + lDesignControl.Height)]), lDesignControl);

  if lComponent.Owner <> Owner then
    Owner.InsertComponent(lComponent);

  if (lComponent is TppCustomText) and TppCustomText(lComponent).Save then
    AddSave(lComponent);

  if (lComponent is TppVariable) then
    AddVariable(lComponent);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  {if object needs to stretch, set PrintHeight to dynamic
    note: call SetPrintHeight to allow descendants to determine what to do}
  if (lComponent is TppStretchable) and
     TppStretchable(lComponent).Stretch and (FPrintHeight = phStatic) then
    SetPrintHeight(phDynamic);

  {validate object UserName}
  if (lComponent.UserName = '') then
    lComponent.UserName := GetUniqueUserName(lComponent);

  Reset;

  {notify report designer}
  SendDesignMessage(PM_COMPONENTADDED, ppWCustomMsg, LongInt(aObject));


end; {procedure, AddObject}

{------------------------------------------------------------------------------}
{ TppBand.RemoveObject }

procedure TppBand.RemoveObject(aObject: TObject);
var
  liIndex: Integer;
  lComponent: TppComponent;
begin

  if not(aObject is TppComponent) then Exit;

  lComponent := TppComponent(aObject);

  {remove object from list}
  FObjects.Remove(lComponent);

  if (lComponent.DesignControl <> nil) then
    begin
      liIndex := FControlBottoms.IndexOfObject(lComponent.DesignControl);

      if (liIndex >= 0) then
        FControlBottoms.Delete(liIndex);
    end;

  if (lComponent is TppCustomText) and TppCustomText(lComponent).Save then
    RemoveSave(lComponent);

  if (lComponent is TppVariable) then
    RemoveVariable(lComponent);

  Reset;

  SendDesignMessage(PM_COMPONENTREMOVED, ppWCustomMsg, LongInt(aObject));

end; {procedure, RemoveObject}

{------------------------------------------------------------------------------}
{ TppBand.ControlMoved - update FControlBottoms entry for this control}

procedure TppBand.ControlMoved(aControl: TControl);
var
  liIndex: Integer;

begin

  {find control in bottoms list}
  liIndex := FControlBottoms.IndexOfObject(aControl);
  if (liIndex >= 0) then
    FControlBottoms.Strings[liIndex] := Format('%8d',[(aControl.Top + aControl.Height)]);

end; {procedure, ControlMoved}

{------------------------------------------------------------------------------}
{ TppBand.GetBottomOfControls - return bottom of lowest control in this band}

function TppBand.GetBottomOfControls: Integer;

begin

  if (pppcDesigning in DesignState) and (FControlBottoms.Count > 0) then
    begin
      FControlBottoms.Sort;
      Result := StrToInt(FControlBottoms.Strings[FControlBottoms.Count - 1]);
    end
  else
    Result := -1;

end; {function, GetBottomOfControls}

{------------------------------------------------------------------------------}
{ TppBand.DoAfterGenerate }

procedure TppBand.DoAfterGenerate;
begin
  if Assigned(FAfterGenerate) then FAfterGenerate(Self);

  SendEventNotify(Self, ciBandAfterGenerate, nil);
end; {procedure, DoAfterGenerate}

{------------------------------------------------------------------------------}
{ TppBand.DoBeforeGenerate }

procedure TppBand.DoBeforeGenerate;
begin
  if Assigned(FBeforeGenerate) then FBeforeGenerate(Self);

  SendEventNotify(Self, ciBandBeforeGenerate, nil);
end; {procedure, DoBeforeGenerate}

{------------------------------------------------------------------------------}
{ TppBand.DoAfterPrint }

procedure TppBand.DoAfterPrint;
begin
  if Assigned(FAfterPrint) then FAfterPrint(Self);

  SendEventNotify(Self, ciBandAfterPrint, nil);
end; {procedure, DoAfterPrint}

{------------------------------------------------------------------------------}
{ TppBand.DoBeforePrint }

procedure TppBand.DoBeforePrint;
begin
  if Assigned(FBeforePrint) then FBeforePrint(Self);

  SendEventNotify(Self, ciBandBeforePrint, nil);
end; {procedure, DoBeforePrint}

{------------------------------------------------------------------------------}
{ TppBand.ReadState }

procedure TppBand.ReadState(Reader: TReader);
begin

{$IFDEF WINDOWS}

  if Reader.Parent is TppCustomReport then
    SetReport(TppCustomReport(Reader.Parent));
    
{$ENDIF}

  inherited ReadState(Reader);

  {must call this after readstate}
  FixSaveOrderList;
  FixCalcOrderList;

end; {procedure, ReadState}

{------------------------------------------------------------------------------}
{ TppBand.GetWidth }

function TppBand.GetWidth: Longint;
begin

  if (FReport <> nil) then
    begin

      if (FReport.Columns > 1) and IsColumnar then
        Result := FReport.mmColumnWidth
      else
        Result := FReport.PrinterSetup.PageDef.mmPrintableWidth;
    end
  else
    Result := 0;

end;

{------------------------------------------------------------------------------}
{ TppBand.Resize }

procedure TppBand.Resize;
var
  liObject: Integer;

begin

  if (pppcDesigning in DesignState) and (DesignControl <> nil) and
     (Report <> nil) then

    if (FReport.Columns > 1) and IsColumnar then
      DesignControl.Width := FReport.spColumnWidth
    else
      DesignControl.Width := FReport.PrinterSetup.PageDef.spPrintableWidth + 1;

  for liObject := 0 to FObjects.Count-1 do
    Objects[liObject].ParentBoundsChange;

end; {procedure, Resize}


{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppBand.GetChildren - write report controls as subcomponents to .DFM }

{$IFDEF Delphi3}
   procedure TppBand.GetChildren(Proc: TGetChildProc;Root: TComponent);
{$ELSE}
   procedure TppBand.GetChildren(Proc: TGetChildProc);
{$ENDIF}

var
  liObject: Integer;
  lComponent: TppComponent;

begin

  for liObject := 0 to FObjects.Count - 1 do
    begin
      lComponent := FObjects.Items[liObject];
      if (lComponent.Parent = Self) then
        Proc(lComponent);
    end;

end;


{------------------------------------------------------------------------------}
{ TppBand.GetParentComponent - required method for Components with HasParent = True }

function TppBand.GetParentComponent: TComponent;
begin
  Result := FReport;

end;

{------------------------------------------------------------------------------}
{ TppBand.SetParentComponent - required method for Components with HasParent = True }

procedure TppBand.SetParentComponent(Value: TComponent);
begin

  if (Value is TppCustomReport) then
    SetReport((Value as TppCustomReport));

end;


{$ELSE}


{------------------------------------------------------------------------------}
{ TppBand.WriteComponents - write subcomponents to .DFM }

procedure TppBand.WriteComponents(Writer: TWriter);
var
  liObject: Integer;
  lComponent: TppComponent;

begin
 
  for liObject := 0 to FObjects.Count - 1 do
    begin

      lComponent := FObjects.Items[liObject];

      if (lComponent.Parent = Self) and (lComponent.Owner = Writer.Root) then
        Writer.WriteComponent(lComponent);

    end;

end; {procedure, WriteComponents}


{$ENDIF}

{------------------------------------------------------------------------------}
{ TppBand.PropertyChange }

procedure TppBand.PropertyChange;
begin

  if (FReport = nil) then Exit;

  if (FReport.Printing) then Exit;

  if not(pppcDesigning in DesignState) then Exit;

  {notify report designer }
  SendDesignMessage(PM_COMPONENTCHANGE, ppWCustomMsg, LongInt(Self));

end;

{------------------------------------------------------------------------------}
{ TppBand.Convert }

procedure TppBand.Convert(aVersionNo: Integer);
var
  liIndex: Integer;
  llMaxBottom: Longint;
  liObject: Longint;
  lObject: TppComponent;
  lTimer: TTimer;
begin

  if (FReport <> nil) and (FReport.Owner <> nil) and (aVersionNo < 1270) then
    @FBeforePrint := FReport.Owner.MethodAddress(FOnPrint);

  {convert from screen pixels to MMThousandths}
  if (FReport <> nil) and (aVersionNo < 2097) then
    FHeight := ppToMMThousandths(FHeight, utScreenPixels, pprtVertical, nil);

  {convert objects, do this before converting bottom offset}
  for liIndex := 0 to ObjectCount - 1 do
    Objects[liIndex].Convert(aVersionNo);

  {default bottom offset}
  if (FReport <> nil) and (aVersionNo < 3000) and (FPrintHeight = phDynamic) then
    begin

      llMaxBottom := 0;

      for liObject := 0 to FObjects.Count - 1 do
        begin
          lObject := Objects[liObject];

          if (lObject.mmTop + lObject.mmHeight) > llMaxBottom then
            llMaxBottom := lObject.mmTop + lObject.mmHeight;

        end;

      if (llMaxBottom <> 0) then
        FBottomOffset := mmHeight - llMaxBottom;

    end;

  {convert calcs to variables for Beta Build 6 or earlier}
  if (aVersionNo < 3999) then
    begin
      lTimer := TTimer.Create(Self);
      lTimer.OnTimer := ConvertCalcs;
      lTimer.Enabled := True;
    end;

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TppBand.ConvertCalcs }

procedure TppBand.ConvertCalcs(Sender: TObject);
var
  lCalcs: TList;
  liIndex: Integer;
  lSystemVariable: TppSystemVariable;
  lVariable: TppVariable;
  lsName: String;
  lCalc: TppCalc;
begin

  TTimer(Sender).Enabled := False;
  
  TTimer(Sender).Free;

  lCalcs := TList.Create;

  for liIndex := 0 to ObjectCount - 1 do
    if (Objects[liIndex] is TppCalc) then
      lCalcs.Add(Objects[liIndex]);

  for liIndex := 0 to lCalcs.Count - 1 do
    begin
      lCalc := TppCalc(lCalcs[liIndex]);

      if (lCalc.CalcType = ctCustom) then
        begin
          lVariable := TppVariable(ppComponentCreate(lCalc.Band.Report, TppVariable));

          lVariable.Band := lCalc.Band;
          lVariable.DataType := lCalc.CustomType;

          lVariable.Top := lCalc.Top;
          lVariable.Left := lCalc.Left;
          lVariable.Width := lCalc.Width;
          lVariable.Height := lCalc.Height;

          lVariable.Alignment := lCalc.Alignment;
          lVariable.AutoSize := lCalc.AutoSize;
          lVariable.Color := lCalc.Color;
          lVariable.DisplayFormat := lCalc.DisplayFormat;
          lVariable.Font := lCalc.Font;
          lVariable.Transparent := lCalc.Transparent;
          lVariable.UserName := lCalc.UserName;
          lVariable.Visible := lCalc.Visible;
          lVariable.WordWrap := lCalc.WordWrap;

          lVariable.OldOnCalc := lCalc.OnCalc;
          lVariable.OnDrawCommandClick := lCalc.OnDrawCommandClick;
          lVariable.OnDrawCommandCreate := lCalc.OnDrawCommandCreate;
          lVariable.OnFormat := lCalc.OnFormat;
          lVariable.OnGetText := lCalc.OnGetText;
          lVariable.OnPrint := lCalc.OnPrint;

          lsName := lCalc.Name;
          lCalc.Free;
          lVariable.Name := lsName;
        end
      else
        begin
          lSystemVariable := TppSystemVariable(ppComponentCreate(lCalc.Band.Report, TppSystemVariable));

          lSystemVariable.Band := lCalc.Band;
          lSystemVariable.VarType := ppCalcTypeToVarType(lCalc.CalcType);

          lSystemVariable.Top := lCalc.Top;
          lSystemVariable.Left := lCalc.Left;
          lSystemVariable.Width := lCalc.Width;
          lSystemVariable.Height := lCalc.Height;

          lSystemVariable.Alignment := lCalc.Alignment;
          lSystemVariable.AutoSize := lCalc.AutoSize;
          lSystemVariable.Color := lCalc.Color;
          lSystemVariable.DisplayFormat := lCalc.DisplayFormat;
          lSystemVariable.Font := lCalc.Font;
          lSystemVariable.Transparent := lCalc.Transparent;
          lSystemVariable.UserName := lCalc.UserName;
          lSystemVariable.Visible := lCalc.Visible;
          lSystemVariable.WordWrap := lCalc.WordWrap;

          lSystemVariable.OnDrawCommandClick:= lCalc.OnDrawCommandClick;
          lSystemVariable.OnDrawCommandCreate:= lCalc.OnDrawCommandCreate;
          lSystemVariable.OnGetText := lCalc.OnGetText;
          lSystemVariable.OnPrint := lCalc.OnPrint;

          lsName := lCalc.Name;
          lCalc.Free;
          lSystemVariable.Name := lsName;
        end;

    end;

  lCalcs.Free;

end; {procedure, ConvertCalcs}

{------------------------------------------------------------------------------}
{ TppBand.SetUnits }

procedure TppBand.SetUnits(aUnits: TppUnitType);
var
  liObject: Integer;
begin
  FUnits := aUnits;

  for liObject := 0 to FObjects.Count - 1 do
    Objects[liObject].Units := FUnits;

end; {procedure, SetUnits}

{------------------------------------------------------------------------------}
{ TppBand.GetBottomOffset }

function TppBand.GetBottomOffset: Single;
begin

  Result := ppFromMMThousandths(FBottomOffset, FUnits, pprtVertical, GetPrinter)

end; {procedure, GetBottomOffset}

{------------------------------------------------------------------------------}
{ TppBand.SetBottomOffset }

procedure TppBand.SetBottomOffset(Value: Single);
begin

  FBottomOffset := ppToMMThousandths(Value, FUnits, pprtVertical, GetPrinter);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetBottomOffset}


{------------------------------------------------------------------------------}
{ TppBand.GetPrinter }

function TppBand.GetPrinter: TppPrinter;
begin

  if FReport <> nil then
    Result := FReport.Printer
  else
    Result := ppPrinter;

end;

{------------------------------------------------------------------------------}
{ TppBand.GetPrintPosition }

function TppBand.GetPrintPosition: Single;

begin

  Result := ppFromMMThousandths(FPrintPosition, FUnits, pprtVertical, GetPrinter);

end; {procedure, GetPrintPosition}

{------------------------------------------------------------------------------}
{ TppBand.SetPrintPosition }

procedure TppBand.SetPrintPosition(Value: Single);

begin

  FPrintPosition := ppToMMThousandths(Value, FUnits, pprtVertical, GetPrinter);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetPrintPosition}

{------------------------------------------------------------------------------}
{ TppBand.GetHeight }

function TppBand.GetHeight: Single;
begin

  Result := ppFromMMThousandths(FHeight, FUnits, pprtVertical, GetPrinter)

end; {procedure, GetHeight}

{------------------------------------------------------------------------------}
{ TppBand.SetHeight }

procedure TppBand.SetHeight(Value: Single);
begin
  {used for converstion to 3.0}
  if (csReading in ComponentState) then
    FHeight := Trunc(Value)
  else
   SetMMHeight(ppToMMThousandths(Value, FUnits, pprtVertical, GetPrinter));

end;


{------------------------------------------------------------------------------}
{ TppBand.SetMMHeight }

procedure TppBand.SetMMHeight(Value: Longint);
var
  liObject: Integer;
  liObjects: Integer;
  lObject: TppComponent;
  llObjectTop: Longint;
  llObjectBottom: Longint;
  llChange: Longint;
  llspChange: Integer;
  llOldHeight: Longint;
  lPrinter: TObject;
begin

  {do not allow Height to be set to 0, if Band contains ppComponents}
  if (Value <= 0) and (FObjects.Count > 0) and (FReport <> nil) then
    begin
      if (pppcDesigning in DesignState) and (DesignControl <> nil) then
        MessageDlg(ppLoadStr(296), mtWarning, [mbOK], 0);

      Exit;
    end;


  if (FReport <> nil) and (FHeight <> Value) and (PrintHeight = phStatic) then

    {note: only validate when page height > 0, because page height may not yet
           be initialized - for instance when the component is first read up}
    if (Value > Report.PrinterSetup.PageDef.mmPrintableHeight) and (Report.PrinterSetup.PageDef.mmPrintableHeight > 0) then
      begin
        {do not allow Height to set to value > PageHeight}
        if (pppcDesigning in DesignState) and (DesignControl <> nil) then
          MessageDlg(ppLoadStr(297), mtWarning, [mbOK], 0);

        Exit;
      end;


  {set the value}
  llOldHeight := FHeight;

  FHeight := Value;

  if FHeight < 0 then
    FHeight := 0;

  {calc the change in height }
  llChange := FHeight - llOldHeight;

  {adjust design control top, based on change in height}
  if (pppcDesigning in DesignState) and (DesignControl <> nil) then
    begin
      llspChange := Trunc(ppFromMMThousandths(llChange, utScreenPixels, pprtVertical, nil));
      DesignControl.Top := DesignControl.Top + llspChange;
      FRuler.Height := spHeight;
    end;


  {move ppComponents if not still within the band height}
  lPrinter := GetPrinter;
  liObjects := FObjects.Count;

  for liObject := 0 to  liObjects - 1 do
    begin
      lObject := Objects[liObject];

      llObjectTop := lObject.mmTop;
      llObjectBottom := lObject.mmTop + lObject.mmHeight;

      if (llObjectBottom > FHeight) then
        if (llObjectTop + llChange) >= 0 then
          lObject.Top := ppFromMMThousandths(llObjectTop + llChange, FUnits, pprtVertical, lPrinter)
        else
          lObject.Top := 0;
    end;

  Resize;

  {notify report designer}
  SendDesignMessage(PM_BANDHEIGHTCHANGE, ppWCustomMsg, LongInt(Self));

  {notify report engine}
  Reset;

end; {procedure, SetMMHeight}

{------------------------------------------------------------------------------}
{ TppBand.SetScreenPixelTop }

procedure TppBand.SetScreenPixelTop(Value: Integer);
var
  liObject: Integer;
  lPoint: TPoint;

begin

  {Note: Top can only be set at Design-Time}

  if not (pppcDesigning in DesignState) or (DesignControl = nil) then Exit;

  {design control for a band is drawn at the bottom of the band}
  DesignControl.Top := Value + spHeight;

  lPoint.X := 0;
  lPoint.Y := Value;

  {convert from Workspace to VerticalRuler panel coords}
  {note: make sure ReportDesigner is visible or get a GPF }
  if (FRuler <> nil) and TForm(DesignControl.Owner).Visible then
    begin
      lPoint := DesignControl.Parent.ClientToScreen(lPoint);
      lPoint := FRuler.Parent.ScreenToClient(lPoint);
    end;

  FRuler.Top := lPoint.Y;

  {clear control bottoms list - gets rebuilt below}
  FControlBottoms.Clear;

  {move all design controls associated with this band}
  for liObject := 0 to (FObjects.Count - 1) do
    with TppComponent(FObjects.Items[liObject]) do
      if (DesignControl <> nil) then
        begin
          DesignControl.Top := spTop + Value;
          if (SelectionObject <> nil) then
             TppSelectionObject(SelectionObject).SetBoundsRectBounds;

          {control bottoms list - used to find the lowest control on a band}
          if not ParentHeight then
             FControlBottoms.AddObject(Format('%8d',[(DesignControl.Top + DesignControl.Height)]),
             DesignControl);
        end;


end; {procedure, SetScreenPixelTop}

{------------------------------------------------------------------------------}
{ TppBand.GetScreenPixelWidth }

function TppBand.GetScreenPixelWidth: Integer;
begin

  {width is used only by the report designer, is not saved down, and
   is not stored internally}

  Result := Trunc(ppFromMMthousandths(GetWidth, utScreenPixels, pprtHorizontal, nil));

end; {procedure, GetScreenPixelWidth}

{------------------------------------------------------------------------------}
{ TppBand.GetScreenPixelTop }

function TppBand.GetScreenPixelTop: Integer;
begin

  {top is used only by the report designer, is not saved down, and
   is stored internally in screen pixels}

  if (pppcDesigning in DesignState) and (DesignControl <> nil) then
    Result := DesignControl.Top - spHeight
  else
    Result := 0;

end; {procedure, GetScreenPixelTop}

{------------------------------------------------------------------------------}
{ TppBand.GetTop }

function TppBand.GetTop: Longint;
begin

 {top is used only by the report designer, is not saved down, and
   is stored internally in screen pixels}

 if (pppcDesigning in DesignState) and (DesignControl <> nil) then
   Result := ppToMMThousandths(DesignControl.Top, utScreenPixels, pprtVertical, nil) - mmHeight
 else
   Result := 0;


end;

{------------------------------------------------------------------------------}
{ TppBand.GetScreenPixelHeight }

function TppBand.GetScreenPixelHeight: Integer;
begin

  Result := Trunc(ppFromMMThousandths(FHeight, utScreenPixels, pprtVertical, nil));

end; {procedure, GetScreenPixelHeight}

{------------------------------------------------------------------------------}
{ TppBand.SetScreenPixelHeight }

procedure TppBand.SetScreenPixelHeight(Value: Integer);
begin

  SetMMHeight(Trunc(ppToMMThousandths(Value, utScreenPixels, pprtVertical, nil)));

end; {procedure, SetScreenPixelHeight}

{------------------------------------------------------------------------------}
{ TppBand.SendDesignMessage }

procedure TppBand.SendDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
begin
  if (FReport <> nil) then
    FReport.SendDesignMessage(aMsg, aWParam, aLParam);

end;  {procedure, SendDesignMessage}

{------------------------------------------------------------------------------}
{ TppBand.PostDesignMessage }

procedure TppBand.PostDesignMessage(aMsg: Cardinal; aWParam: Word; aLParam: Longint);
begin
  if (FReport <> nil)  then
    FReport.PostDesignMessage(aMsg, aWParam, aLParam);

end;  {procedure, PostDesignMessage}


{------------------------------------------------------------------------------}
{ TppBand.DefineProperties }

procedure TppBand.DefineProperties(Filer: TFiler);
{$IFDEF WIN32}
var
  lAncestor: TppBand;
{$ENDIF}

begin

  inherited DefineProperties(Filer);

{$IFDEF WIN32}
  if (Filer.Ancestor is TppBand) then
    lAncestor := TppBand(Filer.Ancestor)
  else
    lAncestor := nil;

  if (lAncestor <> nil) then
    begin
      Filer.DefineProperty('mmBottomOffset', ReadBottomOffset, WriteBottomOffset, FBottomOffset <> lAncestor.FBottomOffset);
      Filer.DefineProperty('mmHeight', ReadHeight, WriteHeight,  FHeight <> lAncestor.FHeight);
      Filer.DefineProperty('mmPrintPosition', ReadPrintPosition, WritePrintPosition,
                              FPrintPosition <> lAncestor.FPrintPosition);
    end
  else
    begin
      Filer.DefineProperty('mmBottomOffset', ReadBottomOffset, WriteBottomOffset, True);
      Filer.DefineProperty('mmHeight', ReadHeight, WriteHeight, True);
      Filer.DefineProperty('mmPrintPosition', ReadPrintPosition, WritePrintPosition, True);
    end;

{$ELSE}

  Filer.DefineProperty('mmBottomOffset', ReadBottomOffset, WriteBottomOffset, True);
  Filer.DefineProperty('mmHeight', ReadHeight, WriteHeight, True);
  Filer.DefineProperty('mmPrintPosition', ReadPrintPosition, WritePrintPosition, True);

{$ENDIF}

  {used for conversion to 3.0}
  Filer.DefineProperty('OnPrint', ReadOnPrint, nil, False);
  Filer.DefineProperty('OnSaveLineEnd', ReadOnSaveLineEnd, nil, False);
  Filer.DefineProperty('OnSaveLineStart', ReadOnSaveLineStart, nil, False);
  Filer.DefineProperty('Left', ReadLeft, nil, False);
  Filer.DefineProperty('Top', ReadTop, nil, False);
end;

{------------------------------------------------------------------------------}
{ TppBand.ReadLeft }

procedure TppBand.ReadLeft(Reader: TReader);
begin
  {eat the value}
  ppReadIntegerPropValue(Reader);
end; {procedure, ReadLeft}

{------------------------------------------------------------------------------}
{ TppBand.ReadTop }

procedure TppBand.ReadTop(Reader: TReader);
begin
  {eat the value}
  ppReadIntegerPropValue(Reader);
end; {procedure, ReadTop}

{------------------------------------------------------------------------------}
{ TppBand.ReadBottomOffset }

procedure TppBand.ReadBottomOffset(Reader: TReader);
begin
  FBottomOffset := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppBand.ReadHeight }

procedure TppBand.ReadHeight(Reader: TReader);
begin
  FHeight := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppBand.ReadPrintPosition }

procedure TppBand.ReadPrintPosition(Reader: TReader);
begin
  FPrintPosition := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppBand.ReadOnPrint }

procedure TppBand.ReadOnPrint(Reader: TReader);
begin
  FOnPrint := Reader.ReadIdent;
end; {procedure, ReadOnPrint}

{------------------------------------------------------------------------------}
{ TppBand.ReadOnSaveLineEnd }

procedure TppBand.ReadOnSaveLineEnd(Reader: TReader);
begin
  {read the prop, but don't do anything with it}
  Reader.ReadIdent;
end; {procedure, ReadOnSaveLineEnd}

{------------------------------------------------------------------------------}
{ TppBand.ReadOnSaveLineStart }

procedure TppBand.ReadOnSaveLineStart(Reader: TReader);
begin
  {read the prop, but don't do anything with it}
  Reader.ReadIdent;
end; {procedure, ReadOnSaveLineStart}

{------------------------------------------------------------------------------}
{ TppBand.WriteBottomOffset }

procedure TppBand.WriteBottomOffset(Writer: TWriter);
begin
  Writer.WriteInteger(FBottomOffset);
end;

{------------------------------------------------------------------------------}
{ TppBand.WriteHeight}

procedure TppBand.WriteHeight(Writer: TWriter);
begin
  Writer.WriteInteger(FHeight);
end;

{------------------------------------------------------------------------------}
{ TppBand.WritePrintPosition}

procedure TppBand.WritePrintPosition(Writer: TWriter);
begin
  Writer.WriteInteger(FPrintPosition);
end;


{******************************************************************************
 *
 ** G R O U P
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppGroup.Create }

constructor TppGroup.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  CacheRecordSize := SizeOf(TppGroupSaveRec);

  FAfterGroupBreak := nil;
  FBeforeGroupBreak := nil;
  FBreakComponent := nil;
  FBreaking := False;
  FBreakNo := 0;
  FBreakName := '';
  FBreakValue := '';
  FBreakType := btDataField;
  FCacheManager := nil;
  FDataPipeline := nil;
  FFirstColumn := 0;
  FFirstPageNo := 0;
  FFooterBand := nil;
  FHeaderBand := nil;
  FHeaderForOrphanedFooter := True;
  FKeepTogether := False;
  FKeptTogether := False;
  FLastPageNo := 0;
  FNewColumn := False;
  FNewPage := False;
  FNewColumnThreshold := 0;
  FNewPageThreshold := 0;
  FOnGetBreakValue := nil;
  FPage := nil;
  FPosition := 0;
  FPriorValue := '';
  FReport := nil;
  FReprintOnSubsequentColumn := True;
  FReprintOnSubsequentPage := True;
  FResetPageNo := False;
  FResettingCache := False;
  FSetBreakComponent := False;
  FTag := 0;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppGroup.Destroy }

destructor TppGroup.Destroy;
begin

  {used for KeepTogether}
  FCacheManager.Free;
  FPage.Free;

  {tell data pipeline that we no longer exist}
  if (FDataPipeline <> nil) then
    FDataPipeline.RemoveNotify(Self);

  {remove component's reference to this Group}
  if (FBreakType = btCustomField) and (GetBreakComponent <> nil) then
    TppCustomText(GetBreakComponent).RemoveBreakFieldForGroup(Self);

  SetReport(nil);

  if Assigned(FHeaderBand) then
    FHeaderBand.Free;

  if Assigned(FFooterBand) then
    FFooterBand.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppGroup.Printing }

function TppGroup.Printing: Boolean;
begin
  if (FReport <> nil) then
    Result := FReport.Printing
  else
    Result := False;
end;

{------------------------------------------------------------------------------}
{ TppGroup.Reset }

procedure TppGroup.Reset;
begin
  if (FReport <> nil) then
    FReport.Reset;
end; {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppGroup.Loaded }

procedure TppGroup.Loaded;
var
  lppCustomText: TppCustomText;

begin

  if (FBreakType = btCustomField) and (GetBreakComponent <> nil) then
    begin
      lppCustomText := TppCustomText(GetBreakComponent);
      lppCustomText.AddBreakFieldForGroup(Self);
    end;

  inherited Loaded;

end; {procedure, Loaded}


{------------------------------------------------------------------------------}
{ TppGroup.SetDataPipeline }

procedure TppGroup.SetDataPipeline(aDataPipeline: TppDataPipeline);
begin

  if FDataPipeline <> nil then
    FDataPipeline.RemoveNotify(Self);

  FDataPipeline := aDataPipeline;

  if FDataPipeline <> nil then
    FDataPipeline.AddNotify(Self);
    
  {this causes the caption to change}
  Notify(FDataPipeline, ppopDataChange);

  Reset;

end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppGroup.Notify }

procedure TppGroup.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation = ppopRemove) and (FDataPipeline = aCommunicator) then
    begin
      FDataPipeline := nil;

      Reset;
    end

  else if (aOperation = ppopRemove) and (FCacheManager = aCommunicator) then
    FCacheManager := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppGroup.GetCurrentValue }

function TppGroup.GetCurrentValue: String;
var
  lsBreakValue: String;
  lParams: TraParamList;
begin

  {get the current break value}
  lsBreakValue := FBreakValue;

  if (FBreakType = btDataField)  and (FDataPipeline <> nil) then
    lsBreakValue := FDataPipeline.GetFieldAsString(BreakName)

  else if (FBreakType = btCustomField)  and (GetBreakComponent <> nil) then
    lsBreakValue := GetBreakComponent.Text;


  if Assigned(FOnGetBreakValue) then FOnGetBreakValue(Self, lsBreakValue);


  lParams := TraTppGroupRTTI.GetParams('OnGetBreakValue');
  lParams.CreateValuePointer(0, lsBreakValue);

  SendEventNotify(Self, ciGroupGetBreakValue, lParams);

  lParams.Free;


  Result := lsBreakValue;

end; {procedure, GetCurrentValue}

{------------------------------------------------------------------------------}
{ TppGroup.CheckForBreak }

procedure TppGroup.CheckForBreak;
begin

  FPriorValue := FBreakValue;

  FBreakValue := GetCurrentValue;

  if (FBreakValue <> FPriorValue) or ((DataPipeline <> nil) and (ppdaNoRecords in DataPipeline.State)) then
    ForceBreak;

end; {procedure, CheckForBreak}

{------------------------------------------------------------------------------}
{ TppGroup.ForceBreak }

procedure TppGroup.ForceBreak;
begin
  FBreaking := True;

  TppGroupBand(FHeaderBand).Generation := True;
  TppGroupBand(FFooterBand).Generation := True;

  {notify DBText/DBCalc that group is breaking}
  SendEventNotify(Self, ciGroupBreak, nil);

end; {procedure, ForceBreak}

{------------------------------------------------------------------------------}
{ TppGroup.DoAfterGroupBreak }

procedure TppGroup.DoAfterGroupBreak;
begin
  if Assigned(FAfterGroupBreak) then FAfterGroupBreak(Self);

  SendEventNotify(Self, ciGroupAfterGroupBreak, nil);
end; {procedure, DoAfterGroupBreak}

{------------------------------------------------------------------------------}
{ TppGroup.DoBeforeGroupBreak }

procedure TppGroup.DoBeforeGroupBreak;
begin
  if Assigned(FBeforeGroupBreak) then FBeforeGroupBreak(Self);

  SendEventNotify(Self, ciGroupBeforeGroupBreak, nil);
end; {procedure, DoBeforeGroupBreak}

{------------------------------------------------------------------------------}
{ TppGroup.SetHeaderForOrphanedFooter  }

procedure TppGroup.SetHeaderForOrphanedFooter(Value: Boolean);
begin

  FHeaderForOrphanedFooter := Value;

  Reset;

end; {procedure, SetHeaderForOrphanedFooter}

{------------------------------------------------------------------------------}
{ TppGroup.SetKeepTogether  }

procedure TppGroup.SetKeepTogether(Value: Boolean);
begin

  FKeepTogether := Value;

  if FKeepTogether and FNewPage then
    SetNewPage(False);

  if FKeepTogether and FNewColumn then
    SetNewColumn(False);

  Reset;

end; {procedure, SetKeepTogether}

{------------------------------------------------------------------------------}
{ TppGroup.SetNewColumn  }

procedure TppGroup.SetNewColumn(Value: Boolean);
begin

  FNewColumn := Value;

  if FNewColumn and FKeepTogether then
    SetKeepTogether(False);

  Reset;

end; {procedure, SetNewColumn}

{------------------------------------------------------------------------------}
{ TppGroup.SetNewPage  }

procedure TppGroup.SetNewPage(Value: Boolean);
begin

  FNewPage := Value;

  if FNewPage and FKeepTogether then
    SetKeepTogether(False);

  Reset;

end; {procedure, SetNewPage}

{------------------------------------------------------------------------------}
{ TppGroup.SetReprintOnSubsequentColumn  }

procedure TppGroup.SetReprintOnSubsequentColumn(Value: Boolean);
begin

  FReprintOnSubsequentColumn := Value;

  Reset;

end; {procedure, SetReprintOnSubsequentColumn}

{------------------------------------------------------------------------------}
{ TppGroup.SetReprintOnSubsequentPage  }

procedure TppGroup.SetReprintOnSubsequentPage(Value: Boolean);
begin

  FReprintOnSubsequentPage := Value;

  Reset;

end; {procedure, SetReprintOnSubsequentPage}

{------------------------------------------------------------------------------}
{ TppGroup.SetReport }

procedure TppGroup.SetReport(aReport: TppCustomReport);
begin

  {remove group from old report}
  if (FReport <> nil) then
    begin

      if FHeaderBand <> nil then
        FHeaderBand.Report := nil;

      if FFooterBand <> nil then
        FFooterBand.Report := nil;

      FReport.RemoveGroup(Self);

    end;

  FReport := aReport;

  {add group to report }
  if (FReport <> nil) then
    begin
      FReport.AddGroup(Self);

      if FHeaderBand <> nil then
        FHeaderBand.Report := FReport;

      if FFooterBand <> nil then
        FFooterBand.Report := FReport;

      FUnits := FReport.Units;

      PositionChanged;
    end;

end; {procedure, SetReport}

{------------------------------------------------------------------------------}
{ TppGroup.SetBreakType }

procedure TppGroup.SetBreakType(aBreakType: TppBreakType);
begin
  if (Report = nil) then Exit;

  if Report.Printing then Exit;

  if (FBreakType <> aBreakType) then
    begin
      FBreakType := aBreakType;

      FSetBreakComponent := True;
    end;

end; {procedure, SetBreakType}

{------------------------------------------------------------------------------}
{ TppGroup.SetBreakName }

procedure TppGroup.SetBreakName(const aBreakName: String);
var
  lComponent: TppComponent;
begin

  if (FBreakName = aBreakName) then Exit;


  if (csReading in ComponentState) or (csLoading in ComponentState) then
    FBreakName := aBreakName

        {handle reference to custom text component}
  else if (FBreakType = btCustomField) then
    begin
      lComponent := GetBreakComponent;

      if (lComponent <> nil) and (lComponent is TppCustomText) then
        TppCustomText(lComponent).RemoveBreakFieldForGroup(Self);

      FBreakName := aBreakName;

      lComponent := GetBreakComponent;

      if (lComponent <> nil) and (lComponent is TppCustomText) then
        TppCustomText(GetBreakComponent).AddBreakFieldForGroup(Self)
      else
        FBreakName := '';
    end
    
  else
    FBreakName := aBreakName;

  FSetBreakComponent := True;

  Reset;

  {notify header, footer bands that group attributes changed}
  if (FHeaderBand <> nil) then
    TppGroupHeaderBand(FHeaderBand).GroupChanged;

  if (FFooterBand <> nil) then
    TppGroupFooterBand(FFooterBand).GroupChanged;

end; {procedure, SetBreakName}

{------------------------------------------------------------------------------}
{ TppGroup.GetBreakComponent }

function TppGroup.GetBreakComponent: TppComponent;
begin

  if (FBreakType <> btCustomField) then
    FBreakComponent := nil

  else if FSetBreakComponent or (FBreakComponent = nil) then
    SetBreakComponent;

  Result := FBreakComponent;

end; {function, GetBreakComponent}

{------------------------------------------------------------------------------}
{ TppGroup.BreakComponentNameChanged }

procedure TppGroup.BreakComponentNameChanged(const aOldName, aNewName: String);
begin


  if (FBreakType = btCustomField) and (FBreakName = aOldName) then
    begin

      FBreakName := aNewName;

      {notify header, footer bands that group attributes changed}
      if (FHeaderBand <> nil) then
        TppGroupHeaderBand(FHeaderBand).GroupChanged;

      if (FFooterBand <> nil) then
        TppGroupFooterBand(FFooterBand).GroupChanged;

    end;

end; {procedure, BreakComponentNameChanged}

{------------------------------------------------------------------------------}
{ TppGroup.SetBreakComponent }

procedure TppGroup.SetBreakComponent;
var
  liBand: Integer;
  liComponent: Integer;
begin

  FBreakComponent := nil;

  if (csReading in ComponentState) then Exit;

  if (FReport = nil) then Exit;

  if (FBreakType <> btCustomField) then Exit;

  if FReport.ObjectByName(liBand, liComponent, FBreakName) then
    FBreakComponent := FReport.Bands[liBand].Objects[liComponent];

end; {procedure, SetBreakComponent}

{------------------------------------------------------------------------------}
{ TppGroup.GetDescription }

function TppGroup.GetDescription: String;
var
  lsBreakDescription: String;

begin

  Result := '';

  
  if FBreakType = btDataField then
    begin

     if (FDataPipeline <> nil) then
       lsBreakDescription := FDataPipeline.FieldAliasForFieldName(FBreakName)
     else
       lsBreakDescription := ''
    end
  else
    begin

      if GetBreakComponent = nil then
        lsBreakDescription := ''
      else
        lsBreakDescription := TppCustomText(GetBreakComponent).Description;
    end;

  if (FReport <> nil) then
    Result := ppLoadStr(331) + ' [' + IntToStr(GroupNo) + ']: ' + lsBreakDescription;
    

end; {function, GetDescription}

{------------------------------------------------------------------------------}
{ TppGroup.FirstPage }

function  TppGroup.FirstPage: Boolean;
begin
  Result := (Report.AbsolutePageNo = FFirstPageNo);
end; {function, FirstPage}

{------------------------------------------------------------------------------}
{ TppGroup.GetPageNo }

function TppGroup.GetPageNo: Longint;
begin
  Result := (Report.AbsolutePageNo - FFirstPageNo) + 1;
end; {function, GetPageNo}

{------------------------------------------------------------------------------}
{ TppGroup.GetPageCount }

function  TppGroup.GetPageCount: Longint;
begin
  Result := (FLastPageNo - FFirstPageNo) + 1;
end; {function, GetPageCount}

{------------------------------------------------------------------------------}
{ TppGroup.UpdatePageCount }

procedure TppGroup.UpdatePageCount;
begin

  FLastPageNo := Report.Engine.AbsolutePageNo;

  UpdateCache;

end; {procedure, UpdatePageCount}

{------------------------------------------------------------------------------}
{ TppGroup.UpdateCache }

procedure TppGroup.UpdateCache;
var
  llAbsolutePage: Longint;
  lRec: TppGroupSaveRec;
begin

  if (CacheStream = nil) then Exit;

  {determine starting search page}
  if (CacheRecordSize > 0) and (CacheCount > 0) then
    llAbsolutePage := Round(Round(CacheStream.Size / CacheRecordSize) / CacheCount) - 1
  else
    llAbsolutePage := -1;

  {look at any prior breaks with same prior value, update page count}
  if (llAbsolutePage > -1) then
    begin

      repeat
        ReadRecordFromCache(llAbsolutePage, lRec);

        if (FBreakNo = lRec.FBreakNo) then
          begin
            lRec.FFirstPageNo := FFirstPageNo;
            lRec.FLastPageNo := FLastPageNo;

            WriteRecordToCache(llAbsolutePage, lRec);
          end;

        Dec(llAbsolutePage);

      until not(FBreakNo = lRec.FBreakNo) or (llAbsolutePage < 0);

    end; {if, their are any previous pages to search}

end; {procedure, UpdateCache}

{------------------------------------------------------------------------------}
{ TppGroup.RestoreFromCache }

procedure TppGroup.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppGroupSaveRec;
begin
  ReadRecordFromCache(aCachePageNo, lRec);

  FFirstPageNo       := lRec.FFirstPageNo;
  FLastPageNo        := lRec.FLastPageNo;
  FBreaking          := lRec.FBreaking;
  FBreakNo           := lRec.FBreakNo;
  FFirstColumn       := lRec.FFirstColumn;
  FKeptTogether      := lRec.FKeptTogether;

end; {procedure, RestoreFromCache }

{------------------------------------------------------------------------------}
{ TppGroup.SaveToCache }

procedure TppGroup.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppGroupSaveRec;
begin

  lRec.FFirstPageNo    := FFirstPageNo;
  lRec.FLastPageNo     := FLastPageNo;
  lRec.FBreaking       := FBreaking;
  lRec.FBreakNo        := FBreakNo;
  lRec.FFirstColumn    := FFirstColumn;
  lRec.FKeptTogether   := FKeptTogether;

  WriteRecordToCache(aCachePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppGroup.RefreshBreakValues }

procedure TppGroup.RefreshBreakValues;
begin
  FPriorValue        := GetCurrentValue;
  FBreakValue        := FPriorValue;
end; {procedure, RefreshBreakValues}

{------------------------------------------------------------------------------}
{ TppGroup.StartOfMainReport }

procedure TppGroup.StartOfMainReport;
begin

end; {procedure, StartOfMainReport}

{------------------------------------------------------------------------------}
{ TppGroup.StartOfParentReport }

procedure TppGroup.StartOfParentReport;
begin

end; {procedure, StartOfParentReport}

{------------------------------------------------------------------------------}
{ TppGroup.EndOfMainReport }

procedure TppGroup.EndOfMainReport;
begin

end; {procedure, EndOfMainReport}

{------------------------------------------------------------------------------}
{ TppGroup.Init }

procedure TppGroup.Init;
begin
  FBreakNo := 0;

  FFirstPageNo := 1;
  FLastPageNo := 1;
  FFirstColumn := 1;

  FBreakValue := GetCurrentValue;
  FPriorValue := FBreakValue;

  FBreaking := False;

  {this tells DBText/DBCalc to reset, forcing their OnGroupBreak event to fire for first group}
  SendEventNotify(Self, ciGroupBreak, nil);

  if FKeepTogether then
    begin
      FKeptTogether := False;

      if (FCacheManager = nil) then
        begin
          FCacheManager := TppCacheManager.Create(Report);

          FCacheManager.AddNotify(Self);
        end;

      FCacheManager.ResetCache;

      if (FPage <> nil) then
        FPage.Free;

      FPage := TppPage.Create(Self);
    end;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppGroup.FreeCache }

procedure TppGroup.FreeCache(aCachePageNo: Longint);
begin

  if (csDestroying in ComponentState) then Exit;
  if (FCacheManager <> nil) and (csDestroying in FCacheManager.ComponentState) then Exit;

  if not(FKeepTogether) then Exit;

  if (FResettingCache) then Exit;

  inherited FreeCache(aCachePageNo);

  if (FCacheManager = nil) then Exit;

  FResettingCache := True;

  FCacheManager.ResetCache;

  FKeptTogether := False;

  FResettingCache := False; 

end; {procedure, FreeCache}

{------------------------------------------------------------------------------}
{ TppGroup.DetailOutOfSpace }

procedure TppGroup.DetailOutOfSpace;
begin

  if (Report.Engine.ControlKeepTogether <> Self) then Exit;

  if FKeepTogether and not(FKeptTogether) then
    begin
      FCacheManager.ReadCache(0);

      FKeptTogether := True;

      Report.Engine.Page.Assign(FPage);
    end;

end; {procedure, DetailOutOfSpace}

{------------------------------------------------------------------------------}
{ TppGroup.BeforeHeader }

procedure TppGroup.BeforeHeader;
begin
  SendEventNotify(Self, ciGroupBeforeHeader, nil);
end; {procedure, BeforeHeader}

{------------------------------------------------------------------------------}
{ TppGroup.BeforeFooter }

procedure TppGroup.BeforeFooter;
begin
  SendEventNotify(Self, ciGroupBeforeFooter, nil);
end; {procedure, BeforeFooter}

{------------------------------------------------------------------------------}
{ TppGroup.GroupHeaderBeforeGenerate }

procedure TppGroup.GroupHeaderBeforeGenerate;
begin

  if (Report.Engine.ControlKeepTogether = Self) then
    begin

      {if not(Report.MainReport.Engine.PageStarted) then
        FKeptTogether := True;}

      if not(Report.Engine.PageStarted) then
        FKeptTogether := True;

      if FKeepTogether and not(FKeptTogether) then
        begin
          FCacheManager.WriteCache(0);

          FPage.Assign(Report.Engine.Page);
        end;
    end;

end; {procedure, GroupHeaderBeforeGenerate}

{------------------------------------------------------------------------------}
{ TppGroup.GroupHeaderBeforePrint }

procedure TppGroup.GroupHeaderBeforePrint;
var
  lHeader: TppGroupHeaderBand;
begin

  lHeader := TppGroupHeaderBand(HeaderBand);

  if lHeader.Generation and not(lHeader.OverFlow) and not(lHeader.PartialGeneration) then
    DoBeforeGroupBreak;

end; {procedure, GroupHeaderBeforePrint}

{------------------------------------------------------------------------------}
{ TppGroup.GroupFooterAfterPrint }

procedure TppGroup.GroupFooterAfterPrint;
begin

  DoAfterGroupBreak;

  if (Report.Engine.ControlKeepTogether = Self) then
    FKeptTogether := False;

  Inc(FBreakNo);

end; {procedure, GroupFooterAfterPrint}

{------------------------------------------------------------------------------}
{ TppGroup.Clear }

procedure TppGroup.Clear;
begin

  FFirstPageNo := 1;
  FLastPageNo := 1;
  FFirstColumn := 1;

  FBreakValue := '';
  FPriorValue := '';

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppGroup.GetGroupNo }

function TppGroup.GetGroupNo: Integer;
begin

  if (Report <> nil) then
    Result := Report.FindGroup(Self)
  else
    Result := -1;

end; {function, GetGroupNo}

{------------------------------------------------------------------------------}
{ TppGroup.SetHeaderBand }

procedure TppGroup.SetHeaderBand(aGroupHeaderBand: TppBand);
begin

  if (FReport <> nil) and (FHeaderBand <> nil) then
    FHeaderBand.Report := nil;

  FHeaderBand := aGroupHeaderBand;

  if (FReport <> nil) and (FHeaderBand <> nil) then
    FHeaderBand.Report := FReport;

end; {procedure, SetHeaderBand}

{------------------------------------------------------------------------------}
{ TppGroup.SetFooterBand }

procedure TppGroup.SetFooterBand(aGroupFooterBand: TppBand);
begin

  if (FReport <> nil) and (FFooterBand <> nil) then
    FFooterBand.Report := nil;

  FFooterBand := aGroupFooterBand;

  if (FReport <> nil) and (FFooterBand <> nil) then
    FFooterBand.Report := FReport;

end; {procedure, SetFooterBand}

{------------------------------------------------------------------------------}
{ TppGroup.BandOrderChanged }

procedure TppGroup.BandOrderChanged;
begin

 if (FReport <> nil) and (FHeaderBand <> nil) then
    FReport.SendDesignMessage(PM_COMPONENTUPDATED, ppWCustomMsg, Longint(FHeaderBand));

  if (FReport <> nil) and (FFooterBand <> nil) then
    FReport.SendDesignMessage(PM_COMPONENTUPDATED, ppWCustomMsg, Longint(FFooterBand));

end; {procedure, BandOrderChanged}

{------------------------------------------------------------------------------}
{ TppGroup.PositionChanged }

procedure TppGroup.PositionChanged;
begin

  if (FHeaderBand <> nil) then
    TppGroupHeaderBand(FHeaderBand).GroupChanged;

  if (FFooterBand <> nil) then
    TppGroupFooterBand(FFooterBand).GroupChanged;

end; {procedure, PositionChanged}

{------------------------------------------------------------------------------}
{ TppGroup.GetIndex }

function TppGroup.GetIndex: Integer;
begin
  if FReport <> nil then
    Result := FReport.FindGroup(Self)
  else
    Result := -1;

end; {function, GetIndex}




{------------------------------------------------------------------------------}
{ TppGroup.HasParent - tells the form not to save this band to the .DFM
                       because this band is a sub-component of the Report object}

function TppGroup.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppGroup.ReadState }

procedure TppGroup.ReadState(Reader: TReader);
begin


{$IFDEF WINDOWS}
  if Reader.Parent is TppCustomReport then
    SetReport(TppCustomReport(Reader.Parent));
{$ENDIF}

  inherited ReadState(Reader);

end; {procedure, ReadState}


{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppGroup.GetChildren }

{$IFDEF Delphi3}
   procedure TppGroup.GetChildren(Proc: TGetChildProc;Root: TComponent);
{$ELSE}
   procedure TppGroup.GetChildren(Proc: TGetChildProc);
{$ENDIF}

begin

  if (FHeaderBand <> nil) then
    Proc(FHeaderBand);

  if (FFooterBand <> nil) then
    Proc(FFooterBand);

end;


{------------------------------------------------------------------------------}
{ TppGroup.GetParentComponent - required method for Components with HasParent = True }

function TppGroup.GetParentComponent: TComponent;
begin
  Result := Report;

end;

{------------------------------------------------------------------------------}
{ TppGroup.SetParentComponent - required method for Components with HasParent = True }

procedure TppGroup.SetParentComponent(Value: TComponent);
begin

  if (Value is TppCustomReport) then
    Report := (Value as TppCustomReport);

end;

{$ELSE}

{------------------------------------------------------------------------------}
{ TppGroup.WriteComponents - write report bands as subcomponents to .DFM }

procedure TppGroup.WriteComponents(Writer: TWriter);
begin

  if Assigned(FHeaderBand) and (FHeaderBand.Owner = Writer.Root) then
    Writer.WriteComponent(FHeaderBand);

  if Assigned(FFooterBand) and (FFooterBand.Owner = Writer.Root) then
    Writer.WriteComponent(FFooterBand);

end; {procedure, WriteComponents}

{$ENDIF}

{------------------------------------------------------------------------------}
{ TppGroup.GetNewColumnThreshold }

function TppGroup.GetNewColumnThreshold: Single;
begin

  Result := ppFromMMThousandths(FNewColumnThreshold, FUnits, pprtVertical, GetPrinter)

end; {procedure, GetNewColumnThreshold}

{------------------------------------------------------------------------------}
{ TppGroup.GetPrinter }

function TppGroup.GetPrinter: TppPrinter;
begin

  if (FReport <> nil) then
    Result := FReport.Printer
  else
    Result := ppPrinter;

end;

{------------------------------------------------------------------------------}
{ TppGroup.SetNewColumnThreshold }

procedure TppGroup.SetNewColumnThreshold(Value: Single);
begin

  FNewColumnThreshold := ppToMMThousandths(Value, FUnits, pprtVertical, GetPrinter);

  {notify report engine}
  Reset;

end; {procedure, SetNewColumnThreshold}

{------------------------------------------------------------------------------}
{ TppGroup.GetNewPageThreshold }

function TppGroup.GetNewPageThreshold: Single;
begin

  Result := ppFromMMThousandths(FNewPageThreshold, FUnits, pprtVertical, GetPrinter);

end; {procedure, GetNewPageThreshold}

{------------------------------------------------------------------------------}
{ TppGroup.SetNewPageThreshold }

procedure TppGroup.SetNewPageThreshold(Value: Single);
begin

  {used for conversion to 3.0}
  if csReading in ComponentState then
    begin
      FOldThreshold := Value;
      Exit;
    end;

  FNewPageThreshold := ppToMMThousandths(Value, FUnits, pprtVertical, GetPrinter);

  {notify report engine}
  Reset;

end; {procedure, SetNewPageThreshold}

{------------------------------------------------------------------------------}
{ TppGroup.Convert }

procedure TppGroup.Convert(aVersionNo: Integer);
begin

  if (aVersionNo < 1270) then
    FBreakName := FFieldName;

  {convert from screen pixels to MMThousandths}
  if (FReport <> nil) and (aVersionNo < 2097) then
    begin
      FNewColumn := FNewPage;
      
      FReprintOnSubsequentPage   := FReprintOnSubsequent;
      FReprintOnSubsequentColumn := FReprintOnSubsequent;

      FNewPageThreshold   := ppToMMThousandths(FOldThreshold, FReport.Units, pprtVertical, nil);
      FNewColumnThreshold := FNewPageThreshold;
    end;

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TppGroup.DefineProperties }

procedure TppGroup.DefineProperties(Filer: TFiler);
var
  lAncestor: TppGroup;

begin

  inherited DefineProperties(Filer);

{$IFDEF WIN32}

  if (Filer.Ancestor is TppGroup) then
    lAncestor := TppGroup(Filer.Ancestor)
  else
    lAncestor := nil;

{$ELSE}
    lAncestor := nil;
{$ENDIF}

  if (lAncestor <> nil) then
    begin
      Filer.DefineProperty('mmNewColumnThreshold', ReadNewColumnThreshold,
                        WriteNewColumnThreshold, FNewColumnThreshold <> lAncestor.FNewColumnThreshold);
      Filer.DefineProperty('mmNewPageThreshold', ReadNewPageThreshold,
                        WriteNewPageThreshold, FNewPageThreshold <> lAncestor.FNewPageThreshold);
    end
  else
    begin
      Filer.DefineProperty('mmNewColumnThreshold', ReadNewColumnThreshold,
                        WriteNewColumnThreshold, True);
      Filer.DefineProperty('mmNewPageThreshold', ReadNewPageThreshold,
                        WriteNewPageThreshold, True);
    end;


  {used for conversion to 3.0}
  Filer.DefineProperty('FieldName', ReadFieldName, nil, False);
  Filer.DefineProperty('ReprintOnSubsequent', ReadReprintOnSubsequent, nil, False);
  Filer.DefineProperty('Left', ReadLeft, nil, False);
  Filer.DefineProperty('Top', ReadTop, nil, False);
  
end;

{------------------------------------------------------------------------------}
{ TppGroup.ReadLeft }

procedure TppGroup.ReadLeft(Reader: TReader);
begin
  {eat the value}
  ppReadIntegerPropValue(Reader);
end; {procedure, ReadLeft}

{------------------------------------------------------------------------------}
{ TppGroup.ReadTop }

procedure TppGroup.ReadTop(Reader: TReader);
begin
  {eat the value}
  ppReadIntegerPropValue(Reader);
end; {procedure, ReadTop}

{------------------------------------------------------------------------------}
{ TppGroup.ReadNewColumnThreshold }

procedure TppGroup.ReadNewColumnThreshold(Reader: TReader);
begin
  FNewColumnThreshold := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppGroup.WriteNewColumnThreshold }

procedure TppGroup.WriteNewColumnThreshold(Writer: TWriter);
begin
  Writer.WriteInteger(FNewColumnThreshold);
end;

{------------------------------------------------------------------------------}
{ TppGroup.ReadNewPageThreshold }

procedure TppGroup.ReadNewPageThreshold(Reader: TReader);
begin
  FNewPageThreshold := ppReadIntegerPropValue(Reader);
end;

{------------------------------------------------------------------------------}
{ TppGroup.WriteNewPageThreshold }

procedure TppGroup.WriteNewPageThreshold(Writer: TWriter);
begin
  Writer.WriteInteger(FNewPageThreshold);
end;

{------------------------------------------------------------------------------}
{ TppGroup.ReadFieldName }

procedure TppGroup.ReadFieldName(Reader: TReader);
begin
  FFieldName := Reader.ReadString;
end;

{------------------------------------------------------------------------------}
{ TppGroup.ReadReprintOnSubsequent }

procedure TppGroup.ReadReprintOnSubsequent(Reader: TReader);
begin
  FReprintOnSubsequent := True;
  
  FReprintOnSubsequent := Reader.ReadBoolean;
end;


{******************************************************************************
 *
 ** C O M P O N E N T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppComponent.Create }

constructor TppComponent.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FBand               := nil;
  FBandType           := btDetail;
  FResetGroup         := nil;
  FRegion             := nil;
  FParentDataPipeline := True;
  FGroupNo            := -1;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppComponent.Destroy }

destructor TppComponent.Destroy;
begin

  Destroying;

  {notify designer - need to send message prior to SetBand(nil) call below
                     because once band is set to nil, GetDesigner returns nil}
  SendDesignMessage(PM_COMPONENTDESTROY, ppWCustomMsg, LongInt(Self));

  {tell region that we no longer exist}
  if (FRegion <> nil) then
    TppRegion(FRegion).RemoveObject(Self);

  SetBand(nil);

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppComponent.Notify}

procedure TppComponent.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator = FRegion) then
    FRegion := nil
    
  else if(aCommunicator = FResetGroup) then
    FResetGroup := nil;


end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppComponent.ProcessMessages }

procedure TppComponent.ProcessMessages;
begin
  if GetReport <> nil then
    GetReport.ProcessMessages;

end; {procedure, ProcessMessages}

{------------------------------------------------------------------------------}
{ TppComponent.GetPrintMessage }

function TppComponent.GetPrintMessage: String;
begin
  if (Band <> nil) then
    Result := Band.GetPrintMessage
  else
    Result := '';
end; {function, GetPrintMessage }

{------------------------------------------------------------------------------}
{ TppComponent.SetPrintMessage }

procedure TppComponent.SetPrintMessage(const aMessage: String);
begin
  if (Band <> nil) then
    Band.SetPrintMessage(aMessage);
end; {function, SetPrintMessage }

{------------------------------------------------------------------------------}
{ TppComponent.Printing }

function TppComponent.Printing: Boolean;
begin
  if (FBand <> nil) and (FBand.Report <> nil) and (FBand.Report.MainReport <> nil) then
    Result := FBand.Report.MainReport.Printing
  else
    Result := False;
end;

{------------------------------------------------------------------------------}
{ TppComponent.GetDesigner }

function TppComponent.GetDesigner: TForm;
begin
  if (FBand <> nil) and (FBand.Report <> nil) then
    Result := FBand.Report.ReportDesigner
  else
    Result := nil;
end;

{------------------------------------------------------------------------------}
{ TppComponent.GetLanguageIndex }

function TppComponent.GetLanguageIndex: Longint;
begin

  if (FBand <> nil) then
    Result := FBand.LanguageIndex
  else
    Result := 0;

end; {function, GetLanguageIndex}

{------------------------------------------------------------------------------}
{ TppComponent.IsGroupBased }

function TppComponent.IsGroupBased: Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppComponent.SetResetGroup }

procedure TppComponent.SetResetGroup(aGroup: TppGroup);
begin

  if (FResetGroup <> nil) then
    FResetGroup.RemoveEventNotify(Self);

  FResetGroup := aGroup;

  if (FResetGroup <> nil) then
    FResetGroup.AddEventNotify(Self);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetResetGroup }


{------------------------------------------------------------------------------}
{ TppComponent.BringToFront }

procedure TppComponent.BringToFront;
begin

  if FRegion <> nil then
    TppRegion(FRegion).BringObjectToFront(Self)

  else if FBand <> nil then
    FBand.BringObjectToFront(Self);

end; {procedure, BringToFront }

{------------------------------------------------------------------------------}
{ TppComponent.SendToBack }

procedure TppComponent.SendToBack;
begin

  if FRegion <> nil then
    TppRegion(FRegion).SendObjectToBack(Self)

  else if FBand <> nil then
    FBand.SendObjectToBack(Self);

   PropertyChange;

end;

{------------------------------------------------------------------------------}
{ TppComponent.BringToFrontMenuClick }

procedure TppComponent.BringToFrontMenuClick(Sender: TObject);
begin
  BringToFront;
end; {procedure, BringToFrontMenuClick}


{------------------------------------------------------------------------------}
{ TppComponent.SendToBackMenuClick }

procedure TppComponent.SendToBackMenuClick(Sender: TObject);
begin
  SendToBack;
end; {procedure, SendToBackMenuClick}


{------------------------------------------------------------------------------}
{ TppComponent.PositionMenuClick }

procedure TppComponent.PositionMenuClick(Sender: TObject);
var
  lPosDialog: TppCustomPositionDialog;

begin

  lPosDialog := CreatePositionDialog;

  lPosDialog.ShowModal;
  lPosDialog.Free;


end;  {procedure, PositionMenuClick}

{------------------------------------------------------------------------------}
{ TppComponent.CreatePositionDialog }

function TppComponent.CreatePositionDialog: TppCustomPositionDialog;
var
  lPosDialog: TppCustomPositionDialog;
  lFormClass: TFormClass;

begin

  lFormClass := ppGetFormClass(TppCustomPositionDialog);

  lPosDialog := TppCustomPositionDialog(lFormClass.Create(Application));
  lPosDialog.LanguageIndex := LanguageIndex;
  lPosDialog.Report        := Band.Report;
  lPosDialog.Component     := Self;
  lPosDialog.Units         := Band.Report.Units;
  lPosDialog.OnPositionChange := PositionChange;
  lPosDialog.PropLeft      := Left;
  lPosDialog.PropTop       := Top;
  lPosDialog.PropWidth     := Width;
  lPosDialog.PropHeight    := Height;
  lPosDialog.ParentWidth   := ParentWidth;
  lPosDialog.ParentHeight  := ParentHeight;

  Result := lPosDialog;

end;


{------------------------------------------------------------------------------}
{ TppComponent.PositionChange }

procedure TppComponent.PositionChange(Sender: TObject);
var
  lPosDialog: TppCustomPositionDialog;

begin
  if Sender is TppCustomPositionDialog then
    begin
      lPosDialog := TppCustomPositionDialog(Sender);
      SetBounds(lPosDialog.PropLeft, lPosDialog.PropTop,
                lPosDialog.PropWidth, lPosDialog.PropHeight);
    end;

end;  {procedure, PositionChange}



{------------------------------------------------------------------------------}
{ TppComponent.InstantiateDesignControl }

procedure TppComponent.InstantiateDesignControl;
begin

  if (DesignControl <> nil) then Exit;

  inherited InstantiateDesignControl;

  if ParentWidth then
    DesignControl.BoundsLocks := [ppblLeft, ppblWidth];

  if ParentHeight then
    DesignControl.BoundsLocks := DesignControl.BoundsLocks + [ppblTop, ppblHeight];

  DesignControl.PopupMenu   := FBand.Report.GetdcPopupMenu(Self, CreatePopupMenu);

end; {procedure, InstantiateDesignControl}



{------------------------------------------------------------------------------}
{ TppComponent.CreatePopupMenu }

procedure TppComponent.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  aPopupMenu := TppPopupMenu.Create(nil);
  aPopupMenu.LanguageIndex := GetLanguageIndex;

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(10, 'BringToFront', '',  161);
  aPopupMenu.AddItem(10, 'SendToBack', '',  177);
  aPopupMenu.AddItem(20, 'mniLine1', '-',  0);

  aPopupMenu.AddItem(30, 'Position', '',  386);
  aPopupMenu.AddItem(30, 'Visible', '',  247);

end; {procedure, CreatePopupMenu}


{------------------------------------------------------------------------------}
{ TppComponent.PopupMenuClick }

procedure TppComponent.PopupMenuClick(Sender: TObject);
var
  lPopupMenu: TppPopupMenu;

begin

  lPopupMenu := TppPopupMenu(Sender);

  {this will set the Checked state for Boolean property menu items
   and assign event-handlers for the the Boolean item OnClick events}
  lPopupMenu.SetMenuItemState(Self);

  {assign menu item event handlers}
  lPopupMenu.ItemByName('BringToFront').OnClick := BringToFrontMenuClick;
  lPopupMenu.ItemByName('SendToBack').OnClick   := SendToBackMenuClick;
  lPopupMenu.ItemByName('Position').OnClick := PositionMenuClick;

end; {procedure, PopupMenuClick}



{------------------------------------------------------------------------------}
{ TppComponent.GetIndex }

function TppComponent.GetIndex: Integer;
begin
  if FBand <> nil then
    Result := FBand.FindObject(Self)
  else
    Result := -1;

end; {function, TppComponent}


{------------------------------------------------------------------------------}
{ TppComponent.GetParentIndex }

function TppComponent.GetParentIndex: Integer;
begin

  if (FRegion <> nil) then
    Result := TppCustomRegion(FRegion).FindObject(Self)

  else if (FBand <> nil) then
    Result := FBand.FindObject(Self)
    
  else
    Result := -1;

end; {function, GetRegionIndex}

{------------------------------------------------------------------------------}
{ TppComponent.HasParent - tells the form not to save this component to the .DFM
                       because this component is a sub-component of the Report object}

function TppComponent.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}



{------------------------------------------------------------------------------}
{ TppComponent.SetBand }

procedure TppComponent.SetBand(aBand: TppBand);
begin

  if FBand <> nil then
    FBand.RemoveObject(Self);

  FBand := aBand;


  if (FBand = nil) and (DesignControl <> nil) then

    FreeDesignControl

  else if (FBand <> nil) then
    begin

      if (pppcDesigning in FBand.DesignState) then
        InstantiateDesignControl;

      SetUnits(FBand.Units);

      FBand.AddObject(Self);

      if (FBand = GetParent) then
        ParentBoundsChange;

      if (pppcDisplayData in FBand.DesignState) then
        DSInclude([pppcDisplayData])
      else
        DSExclude([pppcDisplayData]);


      {note: band type and group no. are required to support cut & paste operations}

      if FBand is TppHeaderBand then
        FBandType := btHeader
      else if FBand is TppTitleBand then
        FBandType := btTitle
      else if FBand is TppDetailBand then
        FBandType := btDetail
      else if FBand is TppSummaryBand then
        FBandType := btSummary
      else if FBand is TppFooterBand then
        FBandType := btFooter
      else if FBand is TppGroupHeaderBand then
        FBandType := btGroupHeader
      else if FBand is TppGroupFooterBand then
        FBandType := btGroupFooter
      else if FBand is TppColumnHeaderBand then
        FBandType := btColumnHeader
      else if FBand is TppColumnFooterBand then
        FBandType := btColumnFooter
      else if FBand is TppPageStyle then
        FBandType := btPageStyle;

      if FBand is TppGroupBand then
        FGroupNo := (FBand as TppGroupBand).Group.GroupNo
      else
        FGroupNo := -1;

    end;

  PropertyChange;

  InvalidateDesignControl;

  Reset;


end; {procedure, SetBand}


{------------------------------------------------------------------------------}
{ TppComponent.SetRegion }

procedure TppComponent.SetRegion(aRegion: TppComponent);
begin

  if (aRegion <> nil) and not (aRegion is TppRegion) then Exit;

  if FRegion <> nil then
    TppRegion(FRegion).RemoveObject(Self);

  FRegion := aRegion;

  if FRegion <> nil then
    TppRegion(FRegion).AddObject(Self);

  {adjust bounds for new parent}
  if ParentWidth or ParentHeight then
    ParentBoundsChange
  else
    UpdateDesignControlBounds;
    

  PropertyChange;
  InvalidateDesignControl;
  Reset;

end;

{------------------------------------------------------------------------------}
{ TppComponent.spGetClipRect }

function TppComponent.spGetClipRect: TRect;
var
  lParentBounds,
  lBounds: TRect;

begin

  if FRegion = nil then
    Result := spClientRect
  else
    begin
      lParentBounds := Region.spBoundsRect;
      lBounds := spBoundsRect;

      if lBounds.Right > lParentBounds.Right then
        lBounds.Right := lParentBounds.Right;

      if lBounds.Bottom > lParentBounds.Bottom then
        lBounds.Bottom := lParentBounds.Bottom;

       Result := Rect(0, 0, (lBounds.Right - lBounds.Left), (lBounds.Bottom - lBounds.Top) );

    end;

end;

{------------------------------------------------------------------------------}
{ TppComponent.SetParentDataPipeline }

procedure TppComponent.SetParentDataPipeline(Value: Boolean);
begin
   FParentDataPipeline := Value;

  if FBand = nil then Exit;

  if ParentDataPipeline and (DataPipeline <> FBand.GetADataPipeline) then
    DataPipeline := FBand.GetADataPipeline;
    
end;

{------------------------------------------------------------------------------}
{ TppComponent.SetDataPipeline }

procedure TppComponent.SetDataPipeline(aDataPipeline: TppDataPipeline);
begin

  inherited SetDataPipeline(aDataPipeline);

  if (csReading in ComponentState) or (csLoading in ComponentState) or
     (pppcTemplateLoading in DesignState) then Exit;

  if (FBand = nil) then Exit;

  if ParentDataPipeline and (FBand <> nil) and (DataPipeline <> FBand.GetADataPipeline) then
    ParentDataPipeline := False;


end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppComponent.Reset }

procedure TppComponent.Reset;
begin
  if (FBand <> nil) then
    FBand.Reset;
end;  {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppComponent.GetNextSibling }

function TppComponent.GetNextSibling: TppComponent;
begin
  Result := nil;

  if (FBand = nil) or (GetIndex = FBand.ObjectCount-1) then Exit;

  Result := FBand.Objects[GetIndex+1];

  if Result.Parent <> GetParent then
    Result := nil;


end;  {procedure, GetNextSibling}


{------------------------------------------------------------------------------}
{ TppComponent.GetPrinter }

function TppComponent.GetPrinter: TppPrinter;
begin

  if (FBand <> nil) then
    Result := FBand.GetPrinter
  else
    Result := ppPrinter;

end; {function, GetPrinter}

{------------------------------------------------------------------------------}
{ TppComponent.PropertiesToDrawCommand}

procedure TppComponent.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  aDrawCommand.Band := FBand;
  
end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppComponent.GetMainReport }

function TppComponent.GetMainReport: TppCustomReport;
begin

  if (FBand <> nil) and (FBand.Report <> nil) then
    Result := Band.Report.MainReport
  else
    Result := nil;

end; {function, GetMainReport}

{------------------------------------------------------------------------------}
{ TppComponent.GetReport }

function TppComponent.GetReport: TppCustomReport;
begin

  if FBand <> nil then
    Result := FBand.Report
  else
    Result := nil;

end; {function, GetReport}

{------------------------------------------------------------------------------}
{ TppComponent.UpdateDesignControlBounds }

procedure TppComponent.UpdateDesignControlBounds;
var
  lClipRect: TRect;
  lClientRect: TRect;

begin
  if not (pppcDesigning in DesignState) or (Printing) then Exit;

  if (FBand = nil) or (DesignControl = nil) then Exit;

  {note: if reading or loading and not pasting}
  if ((csReading in ComponentState) or (csLoading in ComponentState)) and (DesignControl = nil) then Exit;

  
  {update design control bounds}
  lClipRect := spClipRect;
  DesignControl.Visible := (lClipRect.Right > 0) and (lClipRect.Bottom > 0);

  if DesignControl.Visible then
    begin

      lClientRect := spClientRect;

      if FRegion <> nil then
        begin

          if lClipRect.Right < lClientRect.Right then
            Dec(lClipRect.Right, 3);

          if lClipRect.Bottom < lClientRect.Bottom then
            Dec(lClipRect.Bottom, 3);

        end;

      DesignControl.SetBounds(spLeft, (spTop + FBand.spTop), lClipRect.Right, lClipRect.Bottom);

    end;

 { CheckBounds;}

  {notify band that design control has moved}
  FBand.ControlMoved(DesignControl);

end; {procedure, UpdateDesignControlBounds}


{------------------------------------------------------------------------------}
{ TppComponent.CheckBounds }

function TppComponent.CheckBounds: Boolean;
var
  liBottomOfControl: Integer;
  liBottomOfWorkspace: Integer;
  lbAdjustHeight: Boolean;
  liNewTop: Integer;
  liAdjust: Integer;

begin

  Result := True;
  
  if not (pppcDesigning in DesignState) or (Printing) or (pppcLoading in DesignState) then Exit;

  liBottomOfControl   := DesignControl.Top + DesignControl.Height;
  liBottomOfWorkspace := DesignControl.Parent.Height - 19;

  {check whether bottom of control extends below workspace}
  if (liBottomOfControl > liBottomOfWorkspace) and (DesignControl.Parent.Visible) then
    begin

      {calc amount control extends below bottom }
      lbAdjustHeight := False;
      liAdjust := liBottomOfControl - liBottomOfWorkspace;

      liNewTop := spTop - liAdjust;

      if liNewTop < 0 then
        begin
          lbAdjustHeight := True;

          liNewTop := 0;
          liAdjust := spTop;

          liBottomOfControl := liBottomOfControl - liAdjust;

          liAdjust := liBottomOfControl - liBottomOfWorkspace;

          {adjust height to fit within workspace}
          SetMMHeight(mmHeight - ppToMMThousandths(liAdjust, utScreenPixels, pprtVertical, nil));

        end;

      spTop := liNewTop;

      {update design control bounds}
      DesignControl.SetBounds(spLeft, (spTop + FBand.spTop), spWidth, spHeight);

      {turn autosize off}
      if AutoSize and lbAdjustHeight then
        AutoSize    := False;


      if (DesignControl.Parent.Visible) then
        begin
          DesignControl.Parent.Invalidate;
          MessageDlg(ppLoadStr(298) + #13 +
                     ppLoadStr(299), mtWarning, [mbOK], 0);
       end; {show message dlg }

    end;

end; {procedure, CheckBounds}


{------------------------------------------------------------------------------}
{ TppComponent.ParentBoundsChange }

procedure TppComponent.ParentBoundsChange;
var
  lParentRect: TppRect;

begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  lParentRect := mmGetParentRect;

  if ParentWidth and ParentHeight then
    mmSetBounds(lParentRect.Left, lParentRect.Top, lParentRect.Right-lParentRect.Left, lParentRect.Bottom-lParentRect.Top)

  else if ParentWidth then
    mmSetBounds(lParentRect.Left, mmTop, lParentRect.Right-lParentRect.Left, mmHeight)

  else if ParentHeight then
    mmSetBounds(mmLeft, lParentRect.Top, mmWidth, lParentRect.Bottom-lParentRect.Top);

end;


{------------------------------------------------------------------------------}
{ TppComponent.mmGetParentRect }

function TppComponent.mmGetParentRect: TppRect;
begin

  if (FRegion <> nil) then
    Result := ppRect(FRegion.mmLeft, FRegion.mmTop, FRegion.mmLeft+FRegion.mmWidth, FRegion.mmTop+FRegion.mmHeight)
  else if (FBand <> nil) then
    Result := ppRect(0, 0, FBand.mmWidth, FBand.mmHeight)
  else
    Result := ppRect(mmLeft, mmTop, mmLeft+mmWidth, mmTop+mmHeight);

end;



{------------------------------------------------------------------------------}
{ TppComponent.mmSetBounds }

procedure TppComponent.mmSetBounds(aLeft, aTop, aWidth, aHeight: LongInt);
begin

  if (pppcDesigning in DesignState)  and not (Printing) then
    begin

      {make sure component is within Band}
      if aTop < 0 then
        aTop := 0

      else if (FBand <> nil) and (aTop > FBand.mmHeight) then
        aTop := FBand.mmHeight;

      {make sure component is within Band}
      if aLeft < 0 then
        aLeft := 0

      else if (FBand <> nil) and (aLeft > FBand.mmWidth) then
        aLeft := FBand.mmWidth;

    end;
    
  inherited mmSetBounds(aLeft, aTop, aWidth, aHeight);


end; {procedure, SetBounds}


{------------------------------------------------------------------------------}
{ TppComponent.SetMMLeft }

procedure TppComponent.SetMMLeft(Value: LongInt);
begin
  if ParentWidth then Exit;

  {make sure component is within Band}
  if (Value < 0) then
    Value := 0

  else if (FBand <> nil) and (Value > FBand.mmWidth) then
    Value := FBand.mmWidth;

  if (Value <> mmLeft) then
    inherited SetMMLeft(Value);


end; {procedure, SetMMLeft}


{------------------------------------------------------------------------------}
{ TppComponent.SetMMTop }

procedure TppComponent.SetMMTop(Value: Longint);
begin
  if ParentHeight then Exit;

  if Value < 0 then
    Value := 0;

  {make sure component is within Band}
  if (pppcDesigning in DesignState) and not(Printing) and
     (FBand <> nil) and (Value > FBand.mmHeight) then
    Value := FBand.mmHeight;

  if (Value <> mmTop) then
    inherited SetMMTop(Value);

end; {procedure, SetMMTop}


{------------------------------------------------------------------------------}
{ TppComponent.SetMMWidth }

procedure TppComponent.SetMMWidth(Value: Longint);
begin

  if ParentWidth then Exit;

  {make sure component is within Band}
  if (Value < 0) then
    Value := 0;

  if  (Value <> mmWidth) then
    inherited SetMMWidth(Value);

end; {procedure, SetMMWidth}

{------------------------------------------------------------------------------}
{ TppComponent.SetParentWidth }

procedure TppComponent.SetParentWidth(Value: Boolean);
begin

  inherited SetParentWidth(Value);

  if ParentWidth then
    ParentBoundsChange;

  if DesignControl <> nil then
    begin
      if Value then
        DesignControl.BoundsLocks := DesignControl.BoundsLocks + [ppblLeft, ppblWidth]
      else
        DesignControl.BoundsLocks := DesignControl.BoundsLocks - [ppblLeft, ppblWidth];

      {notify report designer }
      SendDesignMessage(PM_BOUNDSLOCKCHANGE, ppWCustomMsg, LongInt(Self));
    end;

end;

{------------------------------------------------------------------------------}
{ TppComponent.SetParentHeight }

procedure TppComponent.SetParentHeight(Value: Boolean);
begin
  inherited SetParentHeight(Value);

  if ParentHeight then
    ParentBoundsChange;

  if DesignControl <> nil then
    begin
      if Value then
        DesignControl.BoundsLocks := DesignControl.BoundsLocks + [ppblTop, ppblHeight]
      else
        DesignControl.BoundsLocks := DesignControl.BoundsLocks - [ppblTop, ppblHeight];

      {notify report designer }
      SendDesignMessage(PM_BOUNDSLOCKCHANGE, ppWCustomMsg, LongInt(Self));

    end;

end;

{------------------------------------------------------------------------------}
{ TppComponent.SetMMHeight }

procedure TppComponent.SetMMHeight(Value: Longint);
begin

  if ParentHeight then Exit;

  {make sure component is within Band}
  if (Value < 0) then
    Value := 0;

  if Value <> mmHeight  then
    inherited SetMMHeight(Value);

end; {procedure, SetMMHeight}


{------------------------------------------------------------------------------}
{ TppComponent.DefineProperties - read/write private 'fake' properties}

procedure TppComponent.DefineProperties(Filer: TFiler);
var
  lAncestor: TppComponent;

begin
  inherited DefineProperties(Filer);

{$IFDEF WIN32}

  if (Filer.Ancestor is TppComponent) then
    lAncestor := TppComponent(Filer.Ancestor)
  else
    lAncestor := nil;

{$ELSE}
  lAncestor := nil;
{$ENDIF}

  if (lAncestor <> nil) then
    begin
      Filer.DefineProperty('BandType', ReadBandType, WriteBandType, FBandType <> lAncestor.FBandType);
      Filer.DefineProperty('GroupNo', ReadGroupNo, WriteGroupNo,
                                   (FGroupNo <> lAncestor.FGroupNo) and (FGroupNo >= 0) );
    end
  else
    begin
      Filer.DefineProperty('BandType', ReadBandType, WriteBandType, True);
      Filer.DefineProperty('GroupNo', ReadGroupNo, WriteGroupNo, FGroupNo >= 0);
    end;

end;

{------------------------------------------------------------------------------}
{ TppComponent.ReadBandType }

procedure TppComponent.ReadBandType(Reader: TReader);
var
  lBandType : TppBandType;

begin
  lBandType := TppBandType(Reader.ReadInteger);

  {if band is nil then we are pasting and need the band type that was saved}
  if (FBand = nil) then
    FBandType := lBandType;

end;

{------------------------------------------------------------------------------}
{ TppComponent.ReadGroupNo }

procedure TppComponent.ReadGroupNo(Reader: TReader);
begin
  FGroupNo := Reader.ReadInteger;
end;

{------------------------------------------------------------------------------}
{ TppComponent.WriteBandType}

procedure TppComponent.WriteBandType(Writer: TWriter);
begin
  Writer.WriteInteger(Ord(FBandType));
end;


{------------------------------------------------------------------------------}
{ TppComponent.WriteGroupNo }

procedure TppComponent.WriteGroupNo(Writer: TWriter);
begin
  Writer.WriteInteger(FGroupNo);
end;

{------------------------------------------------------------------------------}
{ TppComponent.ReadState }

procedure TppComponent.ReadState(Reader: TReader);
begin

  if (Reader.Parent is TppBand) then
     SetBand(TppBand(Reader.Parent))

  else if (Reader.Parent is TppRegion) then
    SetRegion(TppRegion(Reader.Parent));

  inherited ReadState(Reader);

end;


{------------------------------------------------------------------------------}
{ TppComponent.GetParent }

function TppComponent.GetParent: TComponent;
begin

  if FRegion = nil then
    Result := FBand
  else
    Result := FRegion;

end;


{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppComponent.GetParentComponent - required method for Components with HasParent = True }

function TppComponent.GetParentComponent: TComponent;
begin
  Result := GetParent;

end;

{------------------------------------------------------------------------------}
{ TppComponent.SetParentComponent - required method for Components with HasParent = True }

procedure TppComponent.SetParentComponent(Value: TComponent);
begin

 { if (Value is TppBand) then
    FBand := (Value as TppBand)

  else if (Value is TppRegion) then
    FRegion := (Value as TppRegion)   }

end;


{$ENDIF}


{******************************************************************************
 *
 ** C U S T O M   E N G I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomEngine.Create }

constructor TppCustomEngine.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAfterSendPage := nil;
  FBeforeSendPage := nil;
  FOnGetLastPageCached := nil;
  FOnPageEnd := nil;
  FOnPageSent := nil;
  FOnReadCache := nil;
  FOnResetCache := nil;
  FOnWriteCache := nil;
  FPage := TppPage.Create(nil);
  FReport := TppCustomReport(aOwner);
  FSilentExceptions := False;

  Reset;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomEngine.Destroy  }

destructor TppCustomEngine.Destroy;
begin

  FPage.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomEngine.SetPrintPosition }

procedure TppCustomEngine.SetPrintPosition(Left, Top, Right, Bottom: Longint);
begin
  FPrintPosRect.Left   := Left;
  FPrintPosRect.Top    := Top;
  FPrintPosRect.Right  := Right;
  FPrintPosRect.Bottom := Bottom;
end; {procedure, SetPrintPosition}

{------------------------------------------------------------------------------}
{ TppCustomEngine.DoAfterSendPage }

procedure TppCustomEngine.DoAfterSendPage;
begin
  if Assigned(FAfterSendPage) then FAfterSendPage(Self);
end; {procedure, DoAfterSendPage}

{------------------------------------------------------------------------------}
{ TppCustomEngine.DoBeforeSendPage }

procedure TppCustomEngine.DoBeforeSendPage;
begin
  if Assigned(FBeforeSendPage) then FBeforeSendPage(Self);
end; {procedure, DoBeforeSendPage}

{------------------------------------------------------------------------------}
{ TppCustomEngine.DoOnReadCache }

procedure TppCustomEngine.DoOnReadCache;
begin
  if Assigned(FOnReadCache) then FOnReadCache(Self);
end; {procedure, DoOnReadCache}

{------------------------------------------------------------------------------}
{ TppCustomEngine.DoOnWriteCache }

procedure TppCustomEngine.DoOnWriteCache;
begin
  if Assigned(FOnWriteCache) then FOnWriteCache(Self);
end; {procedure, DoOnWriteCache}

{------------------------------------------------------------------------------}
{ TppCustomEngine.DoOnResetCache }

procedure TppCustomEngine.DoOnResetCache;
begin
  if Assigned(FOnResetCache) then FOnResetCache(Self);
end; {procedure, DoOnResetCache}

{------------------------------------------------------------------------------}
{ TppCustomEngine.DoOnGetLastPageCached }

procedure TppCustomEngine.DoOnGetLastPageCached;
begin
  if Assigned(FOnGetLastPageCached) then FOnGetLastPageCached(Self, FLastPageCached);
end; {procedure, DoOnGetLastPageCached}

{------------------------------------------------------------------------------}
{ TppCustomEngine.DataTraversalCompleted }

procedure TppCustomEngine.DataTraversalCompleted;
begin


end; {procedure, DataTraversalCompleted}

{------------------------------------------------------------------------------}
{ TppCustomEngine.PageLimitReached }

procedure TppCustomEngine.PageLimitReached;
begin


end; {procedure, PageLimitReached}

{------------------------------------------------------------------------------}
{ TppCustomEngine.DoOnPageEnd }

procedure TppCustomEngine.DoOnPageEnd;
begin
  if Assigned(FOnPageEnd) then FOnPageEnd(Self);
end; {procedure, DoOnPageEnd}

{------------------------------------------------------------------------------}
{ TppCustomEngine.DoOnPageSent }

procedure TppCustomEngine.DoOnPageSent;
begin
  if Assigned(FOnPageSent) then FOnPageSent(Self);
end; {procedure, DoOnPageSent}

{------------------------------------------------------------------------------}
{ TppCustomEngine.SetStopPrinting }

procedure TppCustomEngine.SetStopPrinting(Value: Boolean);
begin
  FStopPrinting := Value;
end; {procedure, SetStopPrinting}

{------------------------------------------------------------------------------}
{ TppCustomEngine.GetPageStarted }

function TppCustomEngine.GetPageStarted: Boolean;
begin
  Result := FPageStarted;
end; {function, GetPageStarted}

{------------------------------------------------------------------------------}
{ TppCustomEngine.SetPageStarted }

procedure TppCustomEngine.SetPageStarted(aValue: Boolean);
begin
  FPageStarted := aValue;
end; {function, SetPageStarted}

{------------------------------------------------------------------------------}
{ TppCustomEngine.GetPageNo }

function TppCustomEngine.GetPageNo: Longint;
begin
  Result := FAbsolutePageNo;
end; {function, GetPageNo}

{------------------------------------------------------------------------------}
{ TppCustomEngine.GetPageCount }

function TppCustomEngine.GetPageCount: Longint;
begin
  Result := FAbsolutePageCount;
end; {function, GetPageCount}

{------------------------------------------------------------------------------}
{ TppCustomEngine.GetPage }

function TppCustomEngine.GetPage: TppPage;
begin
  Result := FPage;
end; {procedure, GetPage}

{------------------------------------------------------------------------------}
{ TppCustomEngine.SetReport }

procedure TppCustomEngine.SetReport(aReport: TppCustomReport);
begin
  FReport := aReport;
end; {procedure, SetReport}

{------------------------------------------------------------------------------}
{ TppCustomEngine.ESInclude }

procedure TppCustomEngine.ESInclude(aEngineStateSet: TppEngineStates);
begin
  FEngineState := FEngineState + aEngineStateSet;
end; {procedure, ESInclude}

{------------------------------------------------------------------------------}
{ TppCustomEngine.ESExclude }

procedure TppCustomEngine.ESExclude(aEngineStateSet: TppEngineStates);
begin
  FEngineState := FEngineState - aEngineStateSet;
end; {procedure, ESExclude}

{------------------------------------------------------------------------------}
{ TppCustomEngine.PCInclude }

procedure TppCustomEngine.PCInclude(aPrintConditionSet: TppPrintConditions);
begin
  FPrintCondition := FPrintCondition + aPrintConditionSet;
end; {procedure, PCInclude}

{------------------------------------------------------------------------------}
{ TppCustomEngine.PCExclude }

procedure TppCustomEngine.PCExclude(aPrintConditionSet: TppPrintConditions);
begin
  FPrintCondition := FPrintCondition - aPrintConditionSet;
end; {procedure, PCExclude}


{******************************************************************************
 *
 *
 *
 ** R T T I
 *
 *
 *
{******************************************************************************}

{******************************************************************************
 *
 ** C U S T O M   R E P O R T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomReportRTTI.RefClass }

class function TraTppCustomReportRTTI.RefClass: TClass;
begin
  Result := TppCustomReport;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomReportRTTI.GetPropList }

class procedure TraTppCustomReportRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('AbsolutePageNo');
  aPropList.AddProp('AbsolutePageCount');
  aPropList.AddProp('Bands');
  aPropList.AddProp('BandCount');
  aPropList.AddProp('CurrentColumn');
  aPropList.AddProp('FirstPass' );
  aPropList.AddProp('Groups' );
  aPropList.AddProp('GroupCount');
  aPropList.AddProp('MainReport');
  aPropList.AddProp('PageNo');
  aPropList.AddProp('PageBandCount');
  aPropList.AddProp('PageCount');
  aPropList.AddProp('PrintDateTime');
  aPropList.AddProp('ReportBandCount');
  aPropList.AddProp('SecondPass');

  {add methods}
  aPropList.AddMethod('Stop');
  aPropList.AddMethod('PageLimitReached');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCustomReportRTTI.GetEventList }

class procedure TraTppCustomReportRTTI.GetEventList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetEventList(aClass, aPropList);

  aPropList.RemoveProp('OnPrintingComplete');

end; {class procedure, GetEventList}

{------------------------------------------------------------------------------}
{ TraTppCustomReportRTTI.GetPropRec }

class function TraTppCustomReportRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {events}
  if ppEqual(aPropName, 'OnEndColumn') then
    EventToRec(aPropName, ciEngineEndColumn, False, aPropRec)

  else if ppEqual(aPropName, 'OnEndFirstPass') then
    EventToRec(aPropName, ciEngineEndFirstPass, False, aPropRec)

  else if ppEqual(aPropName, 'OnEndPage') then
    EventToRec(aPropName, ciEngineEndPage, False, aPropRec)

  else if ppEqual(aPropName, 'OnEndSecondPass') then
    EventToRec(aPropName, ciEngineEndSecondPass, False, aPropRec)

  else if ppEqual(aPropName, 'OnStartColumn') then
    EventToRec(aPropName, ciEngineStartColumn, False, aPropRec)

  else if ppEqual(aPropName, 'OnStartFirstPass') then
    EventToRec(aPropName, ciEngineStartFirstPass, False, aPropRec)

  else if ppEqual(aPropName, 'OnStartPage') then
    EventToRec(aPropName, ciEngineStartPage, False, aPropRec)

  else if ppEqual(aPropName, 'OnStartSecondPass') then
    EventToRec(aPropName, ciEngineStartSecondPass, False, aPropRec)


  {properties & methods}
  else if ppEqual(aPropName, 'AbsolutePage')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'AbsolutePageNo')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'AbsolutePageCount')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'BandCount')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'Bands')  then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if ppEqual(aPropName, 'CurrentColumn')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'Stop')  then
    PropToRec(aPropName, daMethod, True, aPropRec)

  else if ppEqual(aPropName, 'DonePrinting')  then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'Engine')  then
    ClassPropToRec(aPropName, TppCustomEngine, True, aPropRec)

  else if ppEqual(aPropName, 'FirstPass')  then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'GetBand')  then
    MethodToRec(aPropName, True, aPropRec)

  else if ppEqual(aPropName, 'GroupCount')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'Groups')  then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if ppEqual(aPropName, 'MainReport')  then
    ClassPropToRec(aPropName, TppCustomReport, True, aPropRec)

  else if ppEqual(aPropName, 'mmColumnWidth')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'Modified')  then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'Page')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'PageNo')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'PageBandCount')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'PageCount')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'PageLimitReached')  then
    PropToRec(aPropName, daMethod, True, aPropRec)

  else if ppEqual(aPropName, 'ParentReport')  then
    ClassPropToRec(aPropName, TppCustomReport, True, aPropRec)

  else if ppEqual(aPropName, 'ReportDesigner')  then
    ClassPropToRec(aPropName, TForm, True, aPropRec)

  else if ppEqual(aPropName, 'PrintDateTime')  then
    PropToRec(aPropName, daDateTime, True, aPropRec)

  else if ppEqual(aPropName, 'PrintingAsSubReport')  then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'ReportBandCount')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'SecondPass')  then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'spColumnWidth')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'AutoStop')  then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'Columns')  then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if ppEqual(aPropName, 'ColumnPositions')  then
    ClassPropToRec(aPropName, TStrings, False, aPropRec)

  else if ppEqual(aPropName, 'ColumnWidth')  then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if ppEqual(aPropName, 'DataPipeline')  then
    ClassPropToRec(aPropName, TppDataPipeline, False, aPropRec)

  else if ppEqual(aPropName, 'PageLimit')  then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if ppEqual(aPropName, 'PassSetting')  then
    EnumPropToRec(aPropName, 'TppPassSettingType', False, aPropRec)

  else if ppEqual(aPropName, 'SaveAsTemplate')  then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'Template')  then
    ClassPropToRec(aPropName, TppReportTemplate, False, aPropRec)

  else if ppEqual(aPropName, 'Units')  then
    EnumPropToRec(aPropName, 'TppUnitType', False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomReportRTTI.GetParams }

class function TraTppCustomReportRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if ppEqual(aMethodName, 'Bands')  then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppBand, '', False, False);
    end

  else if ppEqual(aMethodName, 'Groups')  then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppGroup, '', False, False);
    end

  else if ppEqual(aMethodName, 'GetBand')  then
    begin
      Result := TraParamList.Create;

      Result.AddParam('BandType', daEnum, nil, 'TppBandType', False, False);
      Result.AddParam('GroupIndex', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppBand, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppCustomReportRTTI.CallMethod }

class function TraTppCustomReportRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lReport: TppCustomReport;
  liIndex: Integer;
  lBandType: Integer;
  lBand: TppBand;
  lGroup: TppGroup;
begin

  Result := True;
  
  lReport := TppCustomReport(aObject);

  if ppEqual(aMethodName, 'Bands')  then
    begin
      aParams.GetParamValue(0, liIndex);

      lBand := lReport.Bands[liIndex];

      aParams.SetParamValue(1, Integer(lBand));
    end

  else if ppEqual(aMethodName, 'Groups')    then
    begin
      aParams.GetParamValue(0, liIndex);

      lGroup := lReport.Groups[liIndex];

      aParams.SetParamValue(1, Integer(lGroup));
    end

  else if ppEqual(aMethodName, 'Stop')  then
    lReport.Stop

  else if ppEqual(aMethodName, 'PageLimitReached')  then
    lReport.PageLimitReached

  else if ppEqual(aMethodName, 'GetBand')  then
    begin
      aParams.GetParamValue(0, lBandType);
      aParams.GetParamValue(1, liIndex);

      lBand := lReport.GetBand(TppBandType(lBandType), liIndex);

      aParams.SetParamValue(2, Integer(lBand));
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppCustomReportRTTI.GetPropValue }

class function TraTppCustomReportRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'AbsolutePage')  then
    Integer(aValue) := TppCustomReport(aObject).AbsolutePage

  else if ppEqual(aPropName, 'AbsolutePageNo')  then
    Integer(aValue) := TppCustomReport(aObject).AbsolutePageNo

  else if ppEqual(aPropName, 'AbsolutePageCount')  then
    Integer(aValue) := TppCustomReport(aObject).AbsolutePageCount

  else if ppEqual(aPropName, 'BandCount')  then
    Integer(aValue) := TppCustomReport(aObject).BandCount

  else if ppEqual(aPropName, 'CurrentColumn')  then
    Integer(aValue) := TppCustomReport(aObject).CurrentColumn

  else if ppEqual(aPropName, 'DonePrinting')  then
    Boolean(aValue) := TppCustomReport(aObject).DonePrinting

  else if ppEqual(aPropName, 'Engine')  then
    Integer(aValue) := Integer(TppCustomReport(aObject).Engine)

  else if ppEqual(aPropName, 'FirstPass')  then
    Boolean(aValue) := TppCustomReport(aObject).FirstPass

  else if ppEqual(aPropName, 'GroupCount')  then
    Integer(aValue) := TppCustomReport(aObject).GroupCount

  else if ppEqual(aPropName, 'MainReport')  then
    Integer(aValue) := Integer(TppCustomReport(aObject).MainReport)

  else if ppEqual(aPropName, 'mmColumnWidth')  then
    Integer(aValue) := TppCustomReport(aObject).mmColumnWidth

  else if ppEqual(aPropName, 'Modified')  then
    Boolean(aValue) := TppCustomReport(aObject).Modified

  else if ppEqual(aPropName, 'Page')  then
    Integer(aValue) := TppCustomReport(aObject).Page

  else if ppEqual(aPropName, 'PageNo')  then
    Integer(aValue) := TppCustomReport(aObject).PageNo

  else if ppEqual(aPropName, 'PageBandCount')  then
    Integer(aValue) := TppCustomReport(aObject).PageBandCount

  else if ppEqual(aPropName, 'PageCount')  then
    Integer(aValue) := TppCustomReport(aObject).PageCount

  else if ppEqual(aPropName, 'ParentReport')  then
    Integer(aValue) := Integer(TppCustomReport(aObject).ParentReport)

  else if ppEqual(aPropName, 'ReportDesigner')  then
    Integer(aValue) := Integer(TppCustomReport(aObject).ReportDesigner)

  else if ppEqual(aPropName, 'PrintDateTime')  then
    TDateTime(aValue) := TppCustomReport(aObject).PrintDateTime

  else if ppEqual(aPropName, 'PrintingAsSubReport')  then
    Boolean(aValue) := TppCustomReport(aObject).PrintingAsSubReport

  else if ppEqual(aPropName, 'ReportBandCount')  then
    Integer(aValue) := TppCustomReport(aObject).ReportBandCount

  else if ppEqual(aPropName, 'SecondPass')  then
    Boolean(aValue) := TppCustomReport(aObject).SecondPass

  else if ppEqual(aPropName, 'spColumnWidth')  then
    Integer(aValue) := TppCustomReport(aObject).spColumnWidth

  else if ppEqual(aPropName, 'AutoStop')  then
    Boolean(aValue) := TppCustomReport(aObject).AutoStop

  else if ppEqual(aPropName, 'Columns')  then
    Integer(aValue) := TppCustomReport(aObject).Columns

  else if ppEqual(aPropName, 'ColumnPositions')  then
    Integer(aValue) := Integer(TppCustomReport(aObject).ColumnPositions)

  else if ppEqual(aPropName, 'ColumnWidth')  then
    Single(aValue) := TppCustomReport(aObject).ColumnWidth

  else if ppEqual(aPropName, 'DataPipeline')  then
    Integer(aValue) := Integer(TppCustomReport(aObject).DataPipeline)

  else if ppEqual(aPropName, 'PageLimit')  then
    Integer(aValue) := TppCustomReport(aObject).PageLimit

  else if ppEqual(aPropName, 'PassSetting')  then
    Integer(aValue) := Ord(TppCustomReport(aObject).PassSetting)

  else if ppEqual(aPropName, 'SaveAsTemplate')  then
    Boolean(aValue) := TppCustomReport(aObject).SaveAsTemplate

  else if ppEqual(aPropName, 'Template')  then
    Integer(aValue) := Integer(TppCustomReport(aObject).Template)

  else if ppEqual(aPropName, 'Units')  then
    Integer(aValue) := Ord(TppCustomReport(aObject).Units)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCustomReportRTTI.SetPropValue }

class function TraTppCustomReportRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'AutoStop')  then
    TppCustomReport(aObject).AutoStop := Boolean(aValue)

  else if ppEqual(aPropName, 'Columns')  then
    TppCustomReport(aObject).Columns := Integer(aValue)

  else if ppEqual(aPropName, 'ColumnPositions')  then
    TppCustomReport(aObject).ColumnPositions := TStrings(aValue)

  else if ppEqual(aPropName, 'ColumnWidth')  then
    TppCustomReport(aObject).ColumnWidth := Single(aValue)

  else if ppEqual(aPropName, 'DataPipeline')  then
    TppCustomReport(aObject).DataPipeline := TppDataPipeline(aValue)

  else if ppEqual(aPropName, 'PageLimit')  then
    TppCustomReport(aObject).PageLimit := Integer(aValue)

  else if ppEqual(aPropName, 'PassSetting')  then
    TppCustomReport(aObject).PassSetting := TppPassSettingType(aValue)

  else if ppEqual(aPropName, 'SaveAsTemplate')  then
    TppCustomReport(aObject).SaveAsTemplate := Boolean(aValue)

  else if ppEqual(aPropName, 'Units')  then
    TppCustomReport(aObject).Units := TppUnitType(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** B A N D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppBandRTTI.RefClass }

class function TraTppBandRTTI.RefClass: TClass;
begin
  Result := TppBand;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppBandRTTI.GetPropList }

class procedure TraTppBandRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('Objects');
  aPropList.AddProp('ObjectCount');
  aPropList.AddProp('Report');
  aPropList.AddProp('Variables');
  aPropList.AddProp('VariableCount');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppBandRTTI.GetPropRec }

class function TraTppBandRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {events}
  if ppEqual(aPropName, 'AfterPrint') then
    EventToRec(aPropName, ciBandAfterPrint, False, aPropRec)

  else if ppEqual(aPropName, 'BeforePrint') then
    EventToRec(aPropName, ciBandBeforePrint, False, aPropRec)

  else if ppEqual(aPropName, 'AfterGenerate') then
    EventToRec(aPropName, ciBandAfterGenerate, False, aPropRec)

  else if ppEqual(aPropName, 'BeforeGenerate') then
    EventToRec(aPropName, ciBandBeforeGenerate, False, aPropRec)


  {properties & methods}
  else if ppEqual(aPropName, 'Caption') then
    PropToRec(aPropName, daString, False, aPropRec)

  else if ppEqual(aPropName, 'CaptionIndex') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'DrawPage') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'Height') then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if ppEqual(aPropName, 'Index') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'LastBand') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'mmBottomOffset') then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if ppEqual(aPropName, 'mmHeight') then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if ppEqual(aPropName, 'mmPrintPosition') then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if ppEqual(aPropName, 'mmTop') then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if ppEqual(aPropName, 'mmWidth') then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if ppEqual(aPropName, 'ObjectCount') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'Objects') then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if ppEqual(aPropName, 'PrintHeight') then
    EnumPropToRec(aPropName, 'TppPrintHeightType', False, aPropRec)

  else if ppEqual(aPropName, 'Report') then
    ClassPropToRec(aPropName, TppCustomReport, False, aPropRec)

  else if ppEqual(aPropName, 'Save') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'SaveCount') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'Saves') then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if ppEqual(aPropName, 'spHeight') then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if ppEqual(aPropName, 'spTop') then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if ppEqual(aPropName, 'spWidth') then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if ppEqual(aPropName, 'Rank') then
    PropToRec(aPropName, daString, True, aPropRec)

  else if ppEqual(aPropName, 'Units') then
    EnumPropToRec(aPropName, 'TppUnitType', False, aPropRec)

  else if ppEqual(aPropName, 'VariableCount') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'Variables') then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if ppEqual(aPropName, 'Visible') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppBandRTTI.GetParams }

class function TraTppBandRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if ppEqual(aMethodName, 'Objects')  or
     ppEqual(aMethodName, 'Saves')    or
     ppEqual(aMethodName, 'Variables')  then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppComponent, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppBandRTTI.CallMethod }

class function TraTppBandRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lBand: TppBand;
  liIndex: Integer;
  lComponent: TppComponent;
begin

  Result := True;
  
  lBand := TppBand(aObject);

  if ppEqual(aMethodName, 'Objects')  then
    begin
      aParams.GetParamValue(0, liIndex);

      lComponent := lBand.Objects[liIndex];

      aParams.SetParamValue(1, Integer(lComponent));
    end

  else if ppEqual(aMethodName, 'Saves')    then
    begin
      aParams.GetParamValue(0, liIndex);

      lComponent := lBand.Saves[liIndex];

      aParams.SetParamValue(1, Integer(lComponent));
    end

  else if ppEqual(aMethodName, 'Variables')  then
    begin
      aParams.GetParamValue(0, liIndex);

      lComponent := lBand.Variables[liIndex];

      aParams.SetParamValue(1, Integer(lComponent));
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppBandRTTI.GetPropValue }

class function TraTppBandRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Caption') then
    String(aValue) := TppBand(aObject).Caption

  else if ppEqual(aPropName, 'CaptionIndex') then
    Integer(aValue) := TppBand(aObject).CaptionIndex

  else if ppEqual(aPropName, 'DrawPage') then
    Boolean(aValue) := TppBand(aObject).DrawPage

  else if ppEqual(aPropName, 'Height') then
    Single(aValue) := TppBand(aObject).Height

  else if ppEqual(aPropName, 'Index') then
    Integer(aValue) := TppBand(aObject).Index

  else if ppEqual(aPropName, 'LastBand') then
    Boolean(aValue) := TppBand(aObject).LastBand

  else if ppEqual(aPropName, 'mmBottomOffset') then
    Integer(aValue) := TppBand(aObject).mmBottomOffset

  else if ppEqual(aPropName, 'mmHeight') then
    Integer(aValue) := TppBand(aObject).mmHeight

  else if ppEqual(aPropName, 'mmPrintPosition') then
    Integer(aValue) := TppBand(aObject).mmPrintPosition

  else if ppEqual(aPropName, 'mmTop') then
    Integer(aValue) := TppBand(aObject).mmTop

  else if ppEqual(aPropName, 'mmWidth') then
    Integer(aValue) := TppBand(aObject).mmWidth

  else if ppEqual(aPropName, 'ObjectCount') then
    Integer(aValue) := TppBand(aObject).ObjectCount

  else if ppEqual(aPropName, 'PrintHeight') then
    Integer(aValue) := Ord(TppBand(aObject).PrintHeight)

  else if ppEqual(aPropName, 'Report') then
    Integer(aValue) := Integer(TppBand(aObject).Report)

  else if ppEqual(aPropName, 'Save') then
    Boolean(aValue) := TppBand(aObject).Save

  else if ppEqual(aPropName, 'SaveCount') then
    Integer(aValue) := TppBand(aObject).SaveCount

  else if ppEqual(aPropName, 'spHeight') then
    Integer(aValue) := TppBand(aObject).spHeight

  else if ppEqual(aPropName, 'spTop') then
    Integer(aValue) := TppBand(aObject).spTop

  else if ppEqual(aPropName, 'spWidth') then
    Integer(aValue) := TppBand(aObject).spWidth

  else if ppEqual(aPropName, 'Rank') then
    String(aValue) := TppBand(aObject).Rank

  else if ppEqual(aPropName, 'Units') then
    Integer(aValue) := Ord(TppBand(aObject).Units)

  else if ppEqual(aPropName, 'VariableCount') then
    Integer(aValue) := TppBand(aObject).VariableCount

  else if ppEqual(aPropName, 'Visible') then
    Boolean(aValue) := TppBand(aObject).Visible

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppBandRTTI.SetPropValue }

class function TraTppBandRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Caption') then
    TppBand(aObject).Caption := String(aValue)

  else if ppEqual(aPropName, 'CaptionIndex') then
    TppBand(aObject).CaptionIndex := Integer(aValue)

  else if ppEqual(aPropName, 'DrawPage') then
    TppBand(aObject).DrawPage := Boolean(aValue)

  else if ppEqual(aPropName, 'Height') then
    TppBand(aObject).Height := Single(aValue)

  else if ppEqual(aPropName, 'PrintHeight') then
    TppBand(aObject).PrintHeight := TppPrintHeightType(aValue)

  else if ppEqual(aPropName, 'Report') then
    TppBand(aObject).Report := TppCustomReport(aValue)

  else if ppEqual(aPropName, 'Save') then
    TppBand(aObject).Save := Boolean(aValue)

  else if ppEqual(aPropName, 'spHeight') then
    TppBand(aObject).spHeight := Integer(aValue)

  else if ppEqual(aPropName, 'spTop') then
    TppBand(aObject).spTop := Integer(aValue)

  else if ppEqual(aPropName, 'Visible') then
    TppBand(aObject).Visible := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** G R O U P   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppGroupRTTI.RefClass }

class function TraTppGroupRTTI.RefClass: TClass;
begin
  Result := TppGroup;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppGroupRTTI.GetPropList }

class procedure TraTppGroupRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('BreakNo');
  aPropList.AddProp('FirstPage');
  aPropList.AddProp('FooterBand');
  aPropList.AddProp('HeaderBand');
  aPropList.AddProp('Report');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppGroupRTTI.GetPropRec }

class function TraTppGroupRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {events}
  if ppEqual(aPropName, 'AfterGroupBreak') then
    EventToRec(aPropName, ciGroupAfterGroupBreak, False, aPropRec)

  else if ppEqual(aPropName, 'BeforeGroupBreak') then
    EventToRec(aPropName, ciGroupBeforeGroupBreak, False, aPropRec)

  else if ppEqual(aPropName, 'BeforeHeader') then
    EventToRec(aPropName, ciGroupBeforeHeader, False, aPropRec)

  else if ppEqual(aPropName, 'BeforeFooter') then
    EventToRec(aPropName, ciGroupBeforeFooter, False, aPropRec)

  else if ppEqual(aPropName, 'OnGetBreakValue') then
    EventToRec(aPropName, ciGroupGetBreakValue, True, aPropRec)


  {properties & methods}
  else if ppEqual(aPropName, 'BreakComponent') then
    ClassPropToRec(aPropName, TppComponent, False, aPropRec)

  else if ppEqual(aPropName, 'Breaking') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'BreakName') then
    PropToRec(aPropName, daString, False, aPropRec)

  else if ppEqual(aPropName, 'BreakNo') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'BreakType') then
    begin
      PropToRec(aPropName, daEnum, False, aPropRec);

      aPropRec.EnumTypeName := 'TppBreakType';
    end

  else if ppEqual(aPropName, 'BreakValue') then
    PropToRec(aPropName, daString, True, aPropRec)

  else if ppEqual(aPropName, 'CurrentValue') then
    PropToRec(aPropName, daString, True, aPropRec)

  else if ppEqual(aPropName, 'DataPipeline') then
    ClassPropToRec(aPropName, TppDataPipeline, False, aPropRec)

  else if ppEqual(aPropName, 'Description') then
    PropToRec(aPropName, daString, True, aPropRec)

  else if ppEqual(aPropName, 'FirstColumn') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'FirstPage') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'FirstPageNo') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'FooterBand') then
    ClassPropToRec(aPropName, TppBand, True, aPropRec)

  else if ppEqual(aPropName, 'GroupNo') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'HeaderBand') then
    ClassPropToRec(aPropName, TppBand, True, aPropRec)

  else if ppEqual(aPropName, 'HeaderForOrphanedFooter') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'Index') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'KeepTogether') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'KeptTogether') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'LastPageNo') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'mmNewColumnThreshold') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'mmNewPageThreshold') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'NewColumn') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'NewColumnThreshold') then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if ppEqual(aPropName, 'NewPage') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'NewPageThreshold') then
    PropToRec(aPropName, daSingle, False, aPropRec)

  else if ppEqual(aPropName, 'Position') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'PageNo') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'PageCount') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'PriorValue') then
    PropToRec(aPropName, daString, True, aPropRec)

  else if ppEqual(aPropName, 'Report') then
    ClassPropToRec(aPropName, TppCustomReport, False, aPropRec)

  else if ppEqual(aPropName, 'ReprintOnSubsequentColumn') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'ReprintOnSubsequentPage') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'ResetPageNo') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'Units') then
    EnumPropToRec(aPropName, 'TppUnitType', False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppGroupRTTI.GetParams }

class function TraTppGroupRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if ppEqual(aMethodName, 'OnGetBreakValue')  then
    begin
      Result := TraParamList.Create;

      Result.AddParam('BreakValue', daString, nil, '', False, True);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppGroupRTTI.GetPropValue }

class function TraTppGroupRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'BreakComponent') then
    Integer(aValue) := Integer(TppGroup(aObject).BreakComponent)

  else if ppEqual(aPropName, 'Breaking') then
    Boolean(aValue) := TppGroup(aObject).Breaking

  else if ppEqual(aPropName, 'BreakName') then
    String(aValue) := TppGroup(aObject).BreakName

  else if ppEqual(aPropName, 'BreakNo') then
    Integer(aValue) := TppGroup(aObject).BreakNo

  else if ppEqual(aPropName, 'BreakType') then
    Integer(aValue) := Ord(TppGroup(aObject).BreakType)

  else if ppEqual(aPropName, 'BreakValue') then
    String(aValue) := TppGroup(aObject).BreakValue

  else if ppEqual(aPropName, 'CurrentValue') then
    String(aValue) := TppGroup(aObject).CurrentValue

  else if ppEqual(aPropName, 'DataPipeline') then
    Integer(aValue) := Integer(TppGroup(aObject).DataPipeline)

  else if ppEqual(aPropName, 'Description') then
    String(aValue) := TppGroup(aObject).Description

  else if ppEqual(aPropName, 'FirstColumn') then
    Integer(aValue) := TppGroup(aObject).FirstColumn

  else if ppEqual(aPropName, 'FirstPage') then
    Boolean(aValue) := TppGroup(aObject).FirstPage

  else if ppEqual(aPropName, 'FirstPageNo') then
    Integer(aValue) := TppGroup(aObject).FirstPageNo

  else if ppEqual(aPropName, 'FooterBand') then
    Integer(aValue) := Integer(TppGroup(aObject).FooterBand)

  else if ppEqual(aPropName, 'GroupNo') then
    Integer(aValue) := TppGroup(aObject).GroupNo

  else if ppEqual(aPropName, 'HeaderBand') then
    Integer(aValue) := Integer(TppGroup(aObject).HeaderBand)

  else if ppEqual(aPropName, 'HeaderForOrphanedFooter') then
    Boolean(aValue) := TppGroup(aObject).HeaderForOrphanedFooter

  else if ppEqual(aPropName, 'Index') then
    Integer(aValue) := TppGroup(aObject).Index

  else if ppEqual(aPropName, 'KeepTogether') then
    Boolean(aValue) := TppGroup(aObject).KeepTogether

  else if ppEqual(aPropName, 'KeptTogether') then
    Boolean(aValue) := TppGroup(aObject).KeptTogether

  else if ppEqual(aPropName, 'LastPageNo') then
    Integer(aValue) := TppGroup(aObject).LastPageNo

  else if ppEqual(aPropName, 'mmNewColumnThreshold') then
    Integer(aValue) := TppGroup(aObject).mmNewColumnThreshold

  else if ppEqual(aPropName, 'mmNewPageThreshold') then
    Integer(aValue) := TppGroup(aObject).mmNewPageThreshold

  else if ppEqual(aPropName, 'NewColumn') then
    Boolean(aValue) := TppGroup(aObject).NewColumn

  else if ppEqual(aPropName, 'NewPage') then
    Boolean(aValue) := TppGroup(aObject).NewPage

  else if ppEqual(aPropName, 'NewColumnThreshold') then
    Single(aValue) := TppGroup(aObject).NewColumnThreshold

  else if ppEqual(aPropName, 'NewPageThreshold') then
    Single(aValue) := TppGroup(aObject).NewPageThreshold

  else if ppEqual(aPropName, 'Position') then
    Single(aValue) := TppGroup(aObject).Position

  else if ppEqual(aPropName, 'PageNo') then
    Integer(aValue) := TppGroup(aObject).PageNo

  else if ppEqual(aPropName, 'PageCount') then
    Integer(aValue) := TppGroup(aObject).PageCount

  else if ppEqual(aPropName, 'PriorValue') then
    String(aValue) := TppGroup(aObject).PriorValue

  else if ppEqual(aPropName, 'Report') then
    Integer(aValue) := Integer(TppGroup(aObject).Report)

  else if ppEqual(aPropName, 'ReprintOnSubsequentColumn') then
    Boolean(aValue) := TppGroup(aObject).ReprintOnSubsequentColumn

  else if ppEqual(aPropName, 'ReprintOnSubsequentPage') then
    Boolean(aValue) := TppGroup(aObject).ReprintOnSubsequentPage

  else if ppEqual(aPropName, 'ResetPageNo') then
    Boolean(aValue) := TppGroup(aObject).ResetPageNo

  else if ppEqual(aPropName, 'Units') then
    Integer(aValue) := Ord(TppGroup(aObject).Units)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppGroupRTTI.SetPropValue }

class function TraTppGroupRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'BreakName') then
    TppGroup(aObject).BreakName := String(aValue)

  else if ppEqual(aPropName, 'BreakType') then
    TppGroup(aObject).BreakType := TppBreakType(aValue)

  else if ppEqual(aPropName, 'DataPipeline') then
    TppGroup(aObject).DataPipeline := TppDataPipeline(aValue)

  else if ppEqual(aPropName, 'HeaderForOrphanedFooter') then
    TppGroup(aObject).HeaderForOrphanedFooter := Boolean(aValue)

  else if ppEqual(aPropName, 'KeepTogether') then
    TppGroup(aObject).KeepTogether := Boolean(aValue)

  else if ppEqual(aPropName, 'NewColumn') then
    TppGroup(aObject).NewColumn := Boolean(aValue)

  else if ppEqual(aPropName, 'NewPage') then
    TppGroup(aObject).NewPage := Boolean(aValue)

  else if ppEqual(aPropName, 'NewColumnThreshold') then
    TppGroup(aObject).NewColumnThreshold := Single(aValue)

  else if ppEqual(aPropName, 'NewPageThreshold') then
    TppGroup(aObject).NewPageThreshold := Single(aValue)

  else if ppEqual(aPropName, 'Report') then
    TppGroup(aObject).Report := TppCustomReport(aValue)

  else if ppEqual(aPropName, 'ReprintOnSubsequentColumn') then
    TppGroup(aObject).ReprintOnSubsequentColumn := Boolean(aValue)

  else if ppEqual(aPropName, 'ReprintOnSubsequentPage') then
    TppGroup(aObject).ReprintOnSubsequentPage := Boolean(aValue)

  else if ppEqual(aPropName, 'ResetPageNo') then
    TppGroup(aObject).ResetPageNo := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** C O M P O N E N T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppComponentRTTI.RefClass }

class function TraTppComponentRTTI.RefClass: TClass;
begin
  Result := TppComponent;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppComponentRTTI.GetPropList }

class procedure TraTppComponentRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('Band');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppComponentRTTI.GetPropRec }

class function TraTppComponentRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Band')  then
    ClassPropToRec(aPropName, TppBand, False, aPropRec)

  else if ppEqual(aPropName, 'BandType')  then
    EnumPropToRec(aPropName, 'TppBandType', True, aPropRec)

  else if ppEqual(aPropName, 'Index')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'NextSibling')  then
    ClassPropToRec(aPropName, TppComponent, True, aPropRec)

  else if ppEqual(aPropName, 'ParentIndex')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'GroupNo')  then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'Parent')  then
    ClassPropToRec(aPropName, TComponent, True, aPropRec)

  else if ppEqual(aPropName, 'ParentDataPipeline')  then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if ppEqual(aPropName, 'Region')  then
    ClassPropToRec(aPropName, TppComponent, False, aPropRec)

  else if ppEqual(aPropName, 'ResetGroup')  then
    ClassPropToRec(aPropName, TppGroup, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppComponentRTTI.GetPropValue }

class function TraTppComponentRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Band')  then
    Integer(aValue) := Integer(TppComponent(aObject).Band)

  else if ppEqual(aPropName, 'BandType')  then
    Integer(aValue) := Ord(TppComponent(aObject).BandType)

  else if ppEqual(aPropName, 'Index')  then
    Integer(aValue) := TppComponent(aObject).Index

  else if ppEqual(aPropName, 'NextSibling')  then
    Integer(aValue) := Integer(TppComponent(aObject).NextSibling)

  else if ppEqual(aPropName, 'ParentIndex')  then
    Integer(aValue) := TppComponent(aObject).ParentIndex

  else if ppEqual(aPropName, 'GroupNo')  then
    Integer(aValue) := TppComponent(aObject).GroupNo

  else if ppEqual(aPropName, 'Parent')  then
    Integer(aValue) := Integer(TppComponent(aObject).Parent)

  else if ppEqual(aPropName, 'ParentDataPipeline')  then
    Integer(aValue) := Ord(TppComponent(aObject).ParentDataPipeline)

  else if ppEqual(aPropName, 'Region')  then
    Integer(aValue) := Integer(TppComponent(aObject).Region)

  else if ppEqual(aPropName, 'ResetGroup')  then
    Integer(aValue) := Integer(TppComponent(aObject).ResetGroup)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppComponentRTTI.SetPropValue }

class function TraTppComponentRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Band')  then
    TppComponent(aObject).Band := TppBand(aValue)

  else if ppEqual(aPropName, 'ParentDataPipeline')  then
    TppComponent(aObject).ParentDataPipeline := Boolean(aValue)

  else if ppEqual(aPropName, 'Region')  then
    TppComponent(aObject).Region := TppComponent(aValue)

  else if ppEqual(aPropName, 'ResetGroup')  then
    TppComponent(aObject).ResetGroup := TppGroup(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** R E G I S T E R   P R O C E D U R E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppRegisterComponent }

procedure ppRegisterComponent(aComponentClass: TComponentClass;
                              const aToolBarName: String;
                              aToolBarPosition: Integer;
                              aHintIndex: Integer;
                              const aHint: String;
                              aHInstance: Longint);
begin

  if Assigned(ppRegisterComponentProc) then
    ppRegisterComponentProc(aComponentClass, aToolBarName, aToolBarPosition, aHintIndex, aHint, aHInstance)

  else
    raise EComponentError.Create('Unable to register component classes.');

end; {procedure, ppRegisterComponent}

{------------------------------------------------------------------------------}
{ ppUnRegisterComponent }

procedure ppUnRegisterComponent(aComponentClass: TComponentClass);
begin

  if Assigned(ppUnRegisterComponentProc) then
    ppUnRegisterComponentProc(aComponentClass)

  else
    raise EComponentError.Create('Unable to unregister component classes.');

end; {procedure, ppUnRegisterComponent}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppGroup]);

  ppRegisterForm(TppCustomTemplateDialog, TppTemplateDialog);
  ppRegisterForm(TppCustomTemplateErrorDialog, TppTemplateErrorDialog);

  ppRegisterComponent(TppLabel, 'Standard Components', 0, 172, '', 0);
  ppRegisterComponent(TppMemo, 'Standard Components', 1, 175, '', 0);
  ppRegisterComponent(TppRichText, 'Standard Components', 2, 351, '', 0);
  ppRegisterComponent(TppSystemVariable, 'Standard Components', 3, 491, '', 0);
  ppRegisterComponent(TppVariable, 'Standard Components', 4, 492, '', 0);
  ppRegisterComponent(TppImage, 'Standard Components', 5, 170, '', 0);
  ppRegisterComponent(TppShape, 'Standard Components', 6, 178, '', 0);
  ppRegisterComponent(TppLine, 'Standard Components', 7, 174, '', 0);
  ppRegisterComponent(TppBarCode, 'Standard Components', 8, 460, '', 0);

  ppRegisterComponent(TppDBText, 'Data Components', 0, 167, '', 0);
  ppRegisterComponent(TppDBMemo, 'Data Components', 1, 166, '', 0);
  ppRegisterComponent(TppDBRichText, 'Data Components', 2, 352, '', 0);
  ppRegisterComponent(TppDBCalc, 'Data Components', 3, 164, '', 0);
  ppRegisterComponent(TppDBImage, 'Data Components', 4, 165, '', 0);
  ppRegisterComponent(TppDBBarCode, 'Data Components', 5, 461, '', 0);

  ppRegisterComponent(TppRegion, 'Advanced Components', 0, 368, '', 0);
  ppRegisterComponent(TppSubReport, 'Advanced Components', 1, 369, '', 0);

  {calc is replaced by variable and system variable, but is registered for
   backward compatibility}
  RegisterClass(TppCalc);


  raRegisterRTTI(TraTppCustomReportRTTI);
  raRegisterRTTI(TraTppBandRTTI);
  raRegisterRTTI(TraTppGroupRTTI);
  raRegisterRTTI(TraTppComponentRTTI);

finalization

  UnRegisterClasses([TppGroup]);

  ppUnRegisterForm(TppCustomTemplateDialog);
  ppUnRegisterForm(TppCustomTemplateErrorDialog);

  ppUnRegisterComponent(TppLabel);
  ppUnRegisterComponent(TppMemo);
  ppUnRegisterComponent(TppRichText);
  ppUnRegisterComponent(TppSystemVariable);
  ppUnRegisterComponent(TppVariable);
  ppUnRegisterComponent(TppImage);
  ppUnRegisterComponent(TppShape);
  ppUnRegisterComponent(TppLine);
  ppUnRegisterComponent(TppBarCode);

  ppUnRegisterComponent(TppDBText);
  ppUnRegisterComponent(TppDBMemo);
  ppUnRegisterComponent(TppDBRichText);
  ppUnRegisterComponent(TppDBCalc);
  ppUnRegisterComponent(TppDBImage);
  ppUnRegisterComponent(TppDBBarCode);

  ppUnRegisterComponent(TppRegion);
  ppUnRegisterComponent(TppSubReport);

  UnRegisterClass(TppCalc);

  raUnRegisterRTTI(TraTppCustomReportRTTI);
  raUnRegisterRTTI(TraTppBandRTTI);
  raUnRegisterRTTI(TraTppGroupRTTI);
  raUnRegisterRTTI(TraTppComponentRTTI);

end.
