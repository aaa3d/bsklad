{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppBands;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, Menus, SysUtils, Forms, Dialogs, Controls,
  ppComm, ppClass, ppTypes, ppDevice, ppDB, ppStrtch, ppForms, ppDsgnCt,
  ppRTTI;

type

  TppDetailBand = class;

  { TppCustomBand }
  TppCustomBand = class(TppBand)
  private
    FAllObjectsPrinted: Boolean;
    FCalcList: TList;
    FCount: Integer;
    FCurrentPartialAdjustment: Longint;
    FCurrentPosition: Longint;
    FGenerating: Boolean;
    FGenerationComplete: Boolean;
    FMaxStretchable: TppStretchable;
    FObjectListIndex: Integer;
    FObjectLists: TStringList;
    FObjectListSaved: Boolean;
    FObjectIndex: Integer;
    FObjectOverFlow: Boolean;
    FObjectSaved: Boolean;
    FOverFlow: Boolean;
    FOutOfSpace: Boolean;
    FPageBottom: Longint;
    FPartialGeneration: Boolean;
    FPartialAdjustment: Longint;
    FPrintingSection: Boolean;
    FPrintPosRect: TppRect;
    FPrintPositionBreak: Boolean;
    FSpaceUsed: Longint;
    FStartingPosition: Longint;

    FCumulativeCurrentPosition: Longint;
    FMaxStretchablePosition: Longint;

    FStatics: TList;
    FStretchables: TList;
    FStretchers: TList;
    FShifters: TList;
    FPrintQueue: TStringList;

    {print routines}
    procedure BuildCalcList;
    function  GetCurrentObject: TppComponent;
    procedure CategorizeObjects;
    function  CheckForEndOfGeneration: Boolean;
    procedure FreeLists;
    procedure GenerateObjects(aListIndex, aObjectIndex: Integer);
    procedure ProcessQueue(aQueue: TList; aObjectIndex: Integer);
    procedure Print(aPage: TppPage);
    procedure ResetObjects;
    procedure UpdatePrintPosition;

    procedure IncrementCurrentPosition(aObject: TppComponent);
    procedure SaveOverFlowObject(aObject: TppComponent; aObjectIndex: Integer);
    procedure CompleteSection(aObject: TppComponent; aObjectIndex: Integer; aQueue: TList);

  protected
    procedure AdjustStartingPosition; virtual;
    procedure AfterGenerate; virtual;
    procedure AfterPrint; virtual;
    procedure AfterObjectGenerate; virtual;
    procedure BeforeGenerate; virtual;
    procedure BeforeObjectGenerate; virtual;
    procedure BeforePrint; virtual;
    procedure CreateDrawCommand(aPage: TppPage); virtual;
    function  CanAdvanceData: Boolean; virtual;
    function  GetUserName: TComponentName; override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure CalcPrintPosition; virtual;
    procedure ComputeCalcs(aMasterPipeline, aDetailPipeline: TppDataPipeline); override;
    procedure Generate; override;
    procedure Init; override;
    procedure RestoreFromCache(aAbsolutePageNo: Longint); override;
    procedure SaveToCache(aAbsolutePageNo: Longint); override;

    property AllObjectsPrinted: Boolean read FAllObjectsPrinted write FAllObjectsPrinted;
    property Count: Integer read FCount;
    property CurrentObject: TppComponent read GetCurrentObject;
    property CurrentPosition: Longint read FCurrentPosition write FCurrentPosition;
    property CumulativeCurrentPosition: Longint read FCumulativeCurrentPosition write FCumulativeCurrentPosition;
    property Generating: Boolean read FGenerating write FGenerating;
    property GenerationComplete: Boolean read FGenerationComplete write FGenerationComplete;
    property MaxStretchable: TppStretchable read FMaxStretchable;
    property OutOfSpace: Boolean read FOutOfSpace write FOutOfSpace;
    property OverFlow: Boolean read FOverFlow write FOverFlow;
    property PageBottom: Longint read FPageBottom write FPageBottom;
    property PartialGeneration: Boolean read FPartialGeneration write FPartialGeneration;
    property PartialAdjustment: Longint read FPartialAdjustment write FPartialAdjustment;
    property PrintingSection: Boolean read FPrintingSection write FPrintingSection;
    property PrintPositionBreak: Boolean read FPrintPositionBreak write FPrintPositionBreak;
    property PrintPosRect: TppRect read FPrintPosRect write FPrintPosRect;
    property SpaceUsed: Longint read FSpaceUsed write FSpaceUsed;
    property StartingPosition: Longint read FStartingPosition write FStartingPosition;

  end; {class, TppCustomBand}


  { TppBasicBand }
  TppBasicBand = class(TppCustomBand)
    private
    protected
    public
      destructor Destroy; override;

      function GetDescription: String; override;

  end; {class, TppBasicBand}

  
  { TppDetailBand }
  TppDetailBand = class(TppBasicBand)
  private
    FBandsPerRecord: Integer;
    FBandsPerRecordCount: Integer;
    FDataPipeline: TppDataPipeline;

    {used for conversion to 3.0}
    FDataSource: String;

    procedure UpdateParentDataPipeline(aNewDataPipeline, aOldDataPipeline: TppDataPipeline);

  protected
  
    {used for conversion to 3.0}
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadDataSource(Reader: TReader);
    procedure ReadNoRecordsAction(Reader: TReader);
    procedure ReadSkipWhenNoRecords(Reader: TReader);

    procedure AdjustStartingPosition; override;
    procedure AfterPrint; override;
    procedure AfterObjectGenerate; override;
    procedure BeforeObjectGenerate; override;
    procedure BeforePrint; override;
    function  CanAdvanceData: Boolean; override;
    function  GetDefaultPrintTimes: TppPrintTimesType; override;
    function  GetPrintCondition: TppPrintConditions; override;
    function  GetRank: String; override;
    function  GetUserName: TComponentName; override;
    procedure SetBandsPerRecord(aValue: Integer);
    procedure SetDataPipeline(aDataPipeline: TppDataPipeline);

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

    procedure RestoreFromCache(aAbsolutePageNo: Longint); override;
    procedure SaveToCache(aAbsolutePageNo: Longint); override;

    function  GetADataPipeline: TppDataPipeline; override;
    function  IsDataAware: Boolean; override;
    procedure Init; override;

    property BandsPerRecordCount: Integer read FBandsPerRecordCount;

    {used for conversion to 3.0}
    procedure Convert(aVersionNo: Integer); override;
    property DataSource: String read FDataSource;

  published
    property BandsPerRecord: Integer read FBandsPerRecord write SetBandsPerRecord default 1;
    property BottomOffset stored False;
    property DataPipeline: TppDataPipeline read FDataPipeline write SetDataPipeline;
    property PrintCount;
    property PrintHeight;
    property PrintPosition stored False;

  end; {class, TppDetailBand}

  { TppPageBand }
  TppPageBand = class(TppBasicBand)
  private
    FPrintOnFirstPage: Boolean;
    FPrintOnLastPage: Boolean;

    procedure SetPrintOnFirstPage(Value: Boolean);
    procedure SetPrintOnLastPage(Value: Boolean);

  protected
    procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
    procedure BeforeGenerate; override;
    function  IsColumnar: Boolean; override;

  public
    constructor Create(aOwner: TComponent); override;

    property PrintOnFirstPage: Boolean read FPrintOnFirstPage write SetPrintOnFirstPage default True;
    property PrintOnLastPage: Boolean read FPrintOnLastPage write SetPrintOnLastPage default True;

  end; {class, TppPageBand}


  { TppHeaderBand }
  TppHeaderBand = class(TppPageBand)
  protected
    function  GetPrintCondition: TppPrintConditions; override;

  protected
    function  CanAdvanceData: Boolean; override;
    function  GetRank: String; override;
    function  GetUserName: TComponentName; override;

  public
    constructor Create(aOwner: TComponent); override;

  published
     property BottomOffset stored False;
     property PrintHeight;
     property PrintOnFirstPage;
     property PrintOnLastPage;
     property PrintPosition stored False;

  end; {class, TppHeaderBand}


  { TppFooterBand }
  TppFooterBand = class(TppPageBand)
  private

  protected
    procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
    function  GetPrintCondition: TppPrintConditions; override;
    function  GetRank: String; override;
    function  GetUserName: TComponentName; override;
    procedure SetPrintHeight(aPrintHeight: TppPrintHeightType); override;

  public
    constructor Create(aOwner: TComponent); override;

    procedure CalcPrintPosition; override;

  published
     property PrintHeight default phStatic; {footers are always static}
     property PrintOnFirstPage;
     property PrintOnLastPage;

  end; {class, TppFooterBand}


  { TppReportBand }
  TppReportBand = class(TppBasicBand)
  private
    FAlreadyPageBreak: Boolean;
    FNewPage: Boolean;
    procedure SetNewPage(Value: Boolean);

  protected
    procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
    function  IsColumnar: Boolean; override;

    property AlreadyPageBreak: Boolean read FAlreadyPageBreak write FAlreadyPageBreak;

  public
    constructor Create(aOwner: TComponent); override;
                                  
    procedure Init; override;
    procedure RestoreFromCache(aAbsolutePageNo: Longint); override;
    procedure SaveToCache(aAbsolutePageNo: Longint); override;

  published
    property BottomOffset stored False;
    property NewPage: Boolean read FNewPage write SetNewPage default False;
    property PrintHeight;
    property PrintPosition stored False;

  end; {class, TppReportBand}


  { TppTitleBand }
  TppTitleBand = class(TppReportBand)
  private

  protected
    procedure AfterGenerate; override;
    procedure BeforeGenerate; override;
    function  CanAdvanceData: Boolean; override;
    function  GetPrintCondition: TppPrintConditions; override;
    function  GetRank: String; override;
    function  GetUserName: TComponentName; override;

  public
    constructor Create(aOwner: TComponent); override;

  end; {class, TppTitleBand}


  { TppSummaryBand }
  TppSummaryBand = class(TppReportBand)
  private

  protected
    procedure AfterGenerate; override;
    procedure BeforeGenerate; override;
    function  GetPrintCondition: TppPrintConditions; override;
    function  GetRank: String; override;
    function  GetUserName: TComponentName; override;

  public
    constructor Create(aOwner: TComponent); override;

    procedure CalcPrintPosition; override;

  end; {class, TppSummaryBand}


  { TppColumnHeaderBand }
  TppColumnHeaderBand = class(TppBasicBand)
  private

  protected
    function  CanAdvanceData: Boolean; override;
    function  GetPrintCondition: TppPrintConditions; override;
    function  GetRank: String; override;
    function  GetUserName: TComponentName; override;

  public
    constructor Create(aOwner: TComponent); override;

  published
    property BottomOffset stored False;
    property PrintPosition stored False;
    property PrintHeight;

  end; {class, TppColumnHeaderBand}


  { TppColumnFooterBand }
  TppColumnFooterBand = class(TppBasicBand)
  private

  protected
    procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
    function  GetPrintCondition: TppPrintConditions; override;
    function  GetRank: String; override;
    function  GetUserName: TComponentName; override;
    procedure SetPrintHeight(aPrintHeight: TppPrintHeightType); override;

  public
    constructor Create(aOwner: TComponent); override;

    procedure CalcPrintPosition; override;

  published
     property PrintHeight default phStatic; {footers are always static}

  end; {class, TppColumnFooterBand}


  { TppGroupBand }
  TppGroupBand = class(TppCustomBand)
  private
    FGeneration: Boolean;
    FSaveGeneration: Boolean;
    FGroup: TppGroup;

    procedure GroupMenuClick(Sender: TObject);

  protected
    procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
    procedure SetGroup(aGroup: TppGroup); virtual;

    procedure PropertyChange; override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

{$IFDEF WIN32}
    function  GetParentComponent: TComponent; override;
{$ENDIF }
    function  GetDescription: String; override;
    procedure GroupChanged; virtual;
    procedure Init; override;
    procedure PopupMenuClick(Sender: TObject); override;
    procedure RestoreFromCache(aAbsolutePageNo: Longint); override;
    procedure SaveToCache(aAbsolutePageNo: Longint); override;
{$IFDEF WIN32}
    procedure SetParentComponent(Value: TComponent); override;
{$ENDIF }

    property Description: String read GetDescription;
    property Generation: Boolean read FGeneration write FGeneration stored False;
    property Group: TppGroup read FGroup write SetGroup stored False;
    property SaveGeneration: Boolean read FSaveGeneration write FSaveGeneration;

  published
    property BottomOffset stored False;
    property PrintHeight;
    property PrintPosition stored False;

  end; {class, TppGroupBand}

  
  { TppGroupHeaderBand }
  TppGroupHeaderBand = class(TppGroupBand)
  private
    FAlreadyColumnBreak: Boolean;
    FAlreadyPageBreak: Boolean;

  protected
    procedure AfterPrint; override;
    procedure BeforePrint; override;
    procedure BeforeGenerate; override;
    procedure BeforeObjectGenerate; override;
    function  GetPrintCondition: TppPrintConditions; override;
    function  GetRank: String; override;
    procedure ReadState(Reader: TReader); override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    procedure Init; override;
    procedure RestoreFromCache(aAbsolutePageNo: Longint); override;
    procedure SaveToCache(aAbsolutePageNo: Longint); override;
    procedure SetGroup(aGroup: TppGroup); override;

    property AlreadyPageBreak: Boolean read FAlreadyPageBreak write FAlreadyPageBreak;

  end; {class, TppGroupHeaderBand}


  { TppGroupFooterBand }
  TppGroupFooterBand = class(TppGroupBand)
    private

    protected
      procedure AfterGenerate; override;
      procedure AfterPrint; override;
      procedure BeforeGenerate; override;
      procedure BeforeObjectGenerate; override;
      procedure BeforePrint; override;
      function  GetPrintCondition: TppPrintConditions; override;
      function  GetRank: String; override;
      procedure ReadState(Reader: TReader); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor  Destroy; override;

      procedure SetGroup(aGroup: TppGroup); override;

  end; {class, TppGroupFooterBand}


  { TppPageStyle }
  TppPageStyle = class(TppBasicBand)
  private
    FDataPipeline: TppDataPipeline;
    FEndPage: Longint;
    FPageList: TStrings;
    FPageSetting: TppPageSettingType;
    FSavePrintPos: TppRect;
    FSinglePage: Longint;
    FStartPage: Longint;
    FTraverseData: Boolean;
    FValidPages: String;

    function  GetPageList: TStrings;
    procedure SetEndPage(aPageNo: Longint);
    procedure SetPageList(aPageList: TStrings);
    procedure SetPageSetting(aPageSetting: TppPageSettingType);
    procedure SetSinglePage(aPageNo: Longint);
    procedure SetStartPage(aPageNo: Longint);
    procedure SetValidPages(Value: String);
    procedure UpdateParentDataPipeline(aNewDataPipeline, aOldDataPipeline: TppDataPipeline);

  protected
    procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
    procedure AdjustStartingPosition; override;
    procedure AfterPrint; override;
    procedure AfterObjectGenerate; override;
    procedure BeforeObjectGenerate; override;
    procedure BeforePrint; override;
    function  CanAdvanceData: Boolean; override;
    function  GetDefaultPrintTimes: TppPrintTimesType; override;
    function  GetPrintCondition: TppPrintConditions; override;
    function  GetRank: String; override;
    function  GetUserName: TComponentName; override;
    procedure PageSettingMenuClick(Sender: TObject);
    procedure SetDataPipeline(aDataPipeline: TppDataPipeline);

    property DataPipeline: TppDataPipeline read FDataPipeline write SetDataPipeline;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

    procedure CalcPrintPosition; override;
    function  GetADataPipeline: TppDataPipeline; override;
    procedure Init; override;
    function  IsColumnar: Boolean; override;
    function  IsDataAware: Boolean; override;

    function  IsActive: Boolean;
    
    procedure PopupMenuClick(Sender: TObject); override;

  published
    property EndPage: Longint read FEndPage write SetEndPage;
    property PageList: TStrings read GetPageList write SetPageList;
    property PageSetting: TppPageSettingType read FPageSetting write SetPageSetting default psAll;
    property SinglePage: Longint read FSinglePage write SetSinglePage;
    property StartPage: Longint read FStartPage write SetStartPage;
    property ValidPages: String read FValidPages write SetValidPages;

  end; {class, TppPageStyle}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppCustomBandRTTI }
  TraTppCustomBandRTTI = class(TraTppBandRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppCustomBandRTTI}

  { TraTppPageBandRTTI }
  TraTppPageBandRTTI = class(TraTppCustomBandRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppPageBandRTTI}

  { TraTppReportBandRTTI }
  TraTppReportBandRTTI = class(TraTppCustomBandRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppPageBandRTTI}

  { TraTppFooterBandRTTI }
  TraTppFooterBandRTTI = class(TraTppPageBandRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppFooterBandRTTI}

  { TraTppDetailBandRTTI }
  TraTppDetailBandRTTI = class(TraTppCustomBandRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppDetailBandRTTI}

  { TraTppColumnFooterBandRTTI }
  TraTppColumnFooterBandRTTI = class(TraTppCustomBandRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppColumnFooterBandRTTI}

  { TraTppGroupBandRTTI }
  TraTppGroupBandRTTI = class(TraTppCustomBandRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppGroupBandRTTI}

  { TraTppGroupHeaderBandRTTI }
  TraTppGroupHeaderBandRTTI = class(TraTppGroupBandRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppGroupHeaderBandRTTI}


implementation

uses
  ppCtrls, ppReport, ppSubRpt, ppUtils;


{******************************************************************************
 *
 **  B A S I C  B A N D
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppBasicBand.Destroy}

destructor TppBasicBand.Destroy;
begin

  {remove band from associated report}
  if (Report <> nil) then
    Report.RemoveBand(Self);

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppBasicBand.GetDescription }

function TppBasicBand.GetDescription: String;
begin

  Result := ppLoadStr(CaptionIndex);

end; {function, GetDescription}

{******************************************************************************
 *
 **  P A G E  B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPageBand.Create }

constructor TppPageBand.Create(aOwner : TComponent);
begin
  inherited Create(aOwner);

  FPrintOnFirstPage := True;
  FPrintOnLastPage := True;

end; {constructor, TppPageBand}

{------------------------------------------------------------------------------}
{ TppPageBand.IsColumnar }

function TppPageBand.IsColumnar: Boolean;
begin
  Result := False;
end; {function, IsColumnar}

{------------------------------------------------------------------------------}
{ TppPageBand.BeforeGenerate }

procedure TppPageBand.BeforeGenerate;
begin

  if (Report = nil) or (Report.Engine = nil) then
    GenerationComplete := True

  else if not(FPrintOnFirstPage) and (Report.Engine.AbsolutePageNo = 1) then
    GenerationComplete := True

  else if not(FPrintOnLastPage) and (esFirstPass in Report.Engine.State) and
         ((Report.Engine.LastBandGenerated) or (esPrintingSummary in Report.Engine.State)) then
    GenerationComplete := True

  else if not(FPrintOnLastPage) and (esSecondPass in Report.Engine.State) and
         (Report.Engine.AbsolutePageNo = Report.Engine.AbsolutePageCount) then
    GenerationComplete := True;

end; {procedure, BeforeGenerate}

{------------------------------------------------------------------------------}
{ TppPageBand.SetPrintOnFirstPage }

procedure TppPageBand.SetPrintOnFirstPage(Value: Boolean);
begin

  if (Report <> nil) and (FPrintOnFirstPage <> Value) then
    begin
      FPrintOnFirstPage := Value;
      Report.Reset;
      PropertyChange;
    end;

end; {procedure, SetPrintOnFirstPage}

{------------------------------------------------------------------------------}
{ TppPageBand.SetPrintOnLastPage }

procedure TppPageBand.SetPrintOnLastPage(Value: Boolean);
begin

  if (Report <> nil) and (FPrintOnLastPage <> Value) then
    begin
      FPrintOnLastPage := Value;
      Report.Reset;
      PropertyChange;
    end;

end; {procedure, SetPrintOnLastPage}



{------------------------------------------------------------------------------}
{ TppPageBand.CreatePopupMenu }

procedure TppPageBand.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {parameteres: GroupIndex, Name, Caption, StringID}
  aPopupMenu.AddItem(25, 'PrintOnFirstPage', '', 236);
  aPopupMenu.AddItem(25, 'PrintOnLastPage', '', 237);

  aPopupMenu.AddItem(26, 'Line2', '-', 0);

end; {procedure, CreatePopupMenu}


{******************************************************************************
 *
 **  H E A D E R   B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppHeaderBand.Create }

constructor TppHeaderBand.Create(aOwner : TComponent);
begin

  inherited Create(aOwner);

  CaptionIndex := 193;

end; {constructor, TppHeaderBand}

{------------------------------------------------------------------------------}
{ TppHeaderBand.GetUserName }

function TppHeaderBand.GetUserName: TComponentName;
begin
  Result := 'Header'; {do not localize}
end; {function, GetUserName}

{------------------------------------------------------------------------------}
{ TppHeaderBand.GetRank }

function TppHeaderBand.GetRank: String;
begin
  Result := Format('%8d',[1]);
end; {function, GetRank}

{------------------------------------------------------------------------------}
{ TppHeaderBand.GetPrintCondition }

function TppHeaderBand.GetPrintCondition: TppPrintConditions;
begin
  Result := [pppcStartOfPage];
end; {function, GetPrintCondition}

{------------------------------------------------------------------------------}
{ TppHeaderBand.CanAdvanceData }

function TppHeaderBand.CanAdvanceData: Boolean;
begin
  Result := True;
end; {function, CanAdvanceData}

{******************************************************************************
 *
 **  F O O T E R   B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFooterBand.Create}

constructor TppFooterBand.Create(aOwner : TComponent);
begin
  inherited Create(aOwner);

  CaptionIndex := 190;
  
  {footers are always static}
  PrintHeight := phStatic;

end; {constructor, TppFooterBand}

{------------------------------------------------------------------------------}
{ TppFooterBand.GetUserName }

function TppFooterBand.GetUserName: TComponentName;
begin
  Result := 'Footer'; {do not localize}
end; {function, GetUserName}

{------------------------------------------------------------------------------}
{ TppFooterBand.GetRank }

function TppFooterBand.GetRank: String;
begin
  Result := Format('%8d',[7]);
end; {function, GetRank}

{------------------------------------------------------------------------------}
{ TppFooterBand.CreatePopupMenu }

procedure TppFooterBand.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {disable PrintHeight option for footer band}
  aPopupMenu.ItemByName('DynamicHeight').Enabled := False;
  aPopupMenu.ItemByName('StaticHeight').Enabled  := False;

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppFooterBand.GetPrintCondition }

function TppFooterBand.GetPrintCondition: TppPrintConditions;
begin
  Result := [pppcEndOfPage];
end; {function, GetPrintCondition}

{------------------------------------------------------------------------------}
{ TppFooterBand.CalcPrintPosition }

procedure TppFooterBand.CalcPrintPosition;
var
  lRect: TppRect;
begin

  PageBottom :=  Report.Engine.Page.PageDef.mmHeight - Report.Engine.Page.PageDef.mmMarginBottom;
  StartingPosition := PageBottom - mmHeight;

  lRect.Left := Report.Engine.PrintPosRect.Left;
  lRect.Top := StartingPosition;
  lRect.Right := Report.Engine.PrintPosRect.Right;
  lRect.Bottom := StartingPosition + mmHeight;

  PrintPosRect := lRect;

end; {procedure, CalcPrintPosition}

{------------------------------------------------------------------------------}
{ TppFooterBand.SetPrintHeight}

procedure TppFooterBand.SetPrintHeight(aPrintHeight: TppPrintHeightType);
begin
 {do nothing, footer is always static}
end;

{******************************************************************************
 *
 **  R E P O R T   B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReportBand.Create}

constructor TppReportBand.Create(aOwner : TComponent);
begin
  inherited Create(aOwner);

  CacheRecordSize := SizeOf(TppReportBandSaveRec);

  FAlreadyPageBreak := False;
  FNewPage := False;

end; {constructor, TppReportBand}

{------------------------------------------------------------------------------}
{ TppReportBand.IsColumnar }

function TppReportBand.IsColumnar: Boolean;
begin
  Result := False;
end; {function, IsColumnar}

{------------------------------------------------------------------------------}
{ TppReportBand.RestoreFromCache }

procedure TppReportBand.RestoreFromCache(aAbsolutePageNo: Longint);
var
  lRec: TppReportBandSaveRec;
begin

  ReadRecordFromCache(aAbsolutePageNo, lRec);

  FObjectIndex       := lRec.FObjectIndex;
  FObjectListIndex   := lRec.FObjectListIndex;
  FOverFlow          := lRec.FOverFlow;
  FPartialGeneration := lRec.FPartialGeneration;
  FPartialAdjustment := lRec.FPartialAdjustment;

  FAlreadyPageBreak    := lRec.FAlreadyPageBreak;
  FPrintPositionBreak  := lRec.FPrintPositionBreak;
  FPrintingSection     := lRec.FPrintingSection;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppReportBand.SaveToCache }

procedure TppReportBand.SaveToCache(aAbsolutePageNo: Longint);
var
  lRec: TppReportBandSaveRec;
begin

  lRec.FObjectIndex       := FObjectIndex;
  lRec.FObjectListIndex   := FObjectListIndex;
  lRec.FOverFlow          := FOverFlow;
  lRec.FPartialGeneration := FPartialGeneration;
  lRec.FPartialAdjustment := FPartialAdjustment;

  lRec.FAlreadyPageBreak    := FAlreadyPageBreak;
  lRec.FPrintPositionBreak  := FPrintPositionBreak;
  lRec.FPrintingSection     := FPrintingSection;

  WriteRecordToCache(aAbsolutePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppReportBand.Init }

procedure TppReportBand.Init;
begin
  inherited Init;

  FAlreadyPageBreak := False;
end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppReportBand.CreatePopupMenu }

procedure TppReportBand.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {parameteres: GroupIndex, Name, Caption, StringID}
  aPopupMenu.AddItem(25, 'NewPage', '', 234);
  aPopupMenu.AddItem(26, 'Line2', '-', 0);

end; {procedure, CreatePopupMenu}


{------------------------------------------------------------------------------}
{ TppReportBand.SetNewPage }

procedure TppReportBand.SetNewPage(Value: Boolean);
begin

  if (Report <> nil) and (FNewPage <> Value) then
    begin
      FNewPage := Value;

      {notify report designer}
      PropertyChange;

      {notify report engine}
      Report.Reset;
    end;

end; {procedure, SetNewPage}


{******************************************************************************
 *
 **  T I T L E   B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTitleBand.Create}

constructor TppTitleBand.Create(aOwner : TComponent);
begin
  inherited Create(aOwner);

  CaptionIndex := 195;

end; {constructor, TppTitleBand}

{------------------------------------------------------------------------------}
{ TppTitleBand.GetUserName }

function TppTitleBand.GetUserName: TComponentName;
begin
  Result := 'Title'; {do not localize}
end; {function, GetUserName}

{------------------------------------------------------------------------------}
{ TppTitleBand.GetRank }

function TppTitleBand.GetRank: String;
begin
  Result := Format('%8d',[0]);
end; {function, GetRank}

{------------------------------------------------------------------------------}
{ TppTitleBand.GetPrintCondition }

function TppTitleBand.GetPrintCondition: TppPrintConditions;
begin
  Result := [pppcStartOfReport];
end; {function, GetPrintCondition}

{------------------------------------------------------------------------------}
{ TppTitleBand.CanAdvanceData }

function TppTitleBand.CanAdvanceData: Boolean;
begin
  Result := True;
end; {function, CanAdvanceData}

{------------------------------------------------------------------------------}
{ TppTitleBand.BeforeGenerate }

procedure TppTitleBand.BeforeGenerate;
begin

  if NewPage and AlreadyPageBreak then
    GenerationComplete := True
  else
    Report.Engine.ESInclude([esPrintingTitle]);

end; {procedure, BeforeGenerate}

{------------------------------------------------------------------------------}
{ TppTitleBand.AfterGenerate }

procedure TppTitleBand.AfterGenerate;
begin

  Report.Engine.ESExclude([esPrintingTitle]);

  if (NewPage) and not(AlreadyPageBreak) then
    begin
      AlreadyPageBreak := True;

      if Visible then
        OutOfSpace := True;
    end;

  inherited AfterGenerate;

end; {procedure, AfterGenerate}

{******************************************************************************
 *
 **  S U M M A R Y   B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSummaryBand.Create }

constructor TppSummaryBand.Create(aOwner : TComponent);
begin
  inherited Create(aOwner);

  CaptionIndex := 194;

end; {constructor, TppSummaryBand}

{------------------------------------------------------------------------------}
{ TppSummaryBand.GetUserName }

function TppSummaryBand.GetUserName: TComponentName;
begin
  Result := 'Summary'; {do not localize}
end; {function, GetUserName}

{------------------------------------------------------------------------------}
{ TppSummaryBand.GetRank }

function TppSummaryBand.GetRank: String;
begin
  Result := Format('%8d',[8]);
end; {function, GetRank}

{------------------------------------------------------------------------------}
{ TppSummaryBand.GetPrintCondition }

function TppSummaryBand.GetPrintCondition: TppPrintConditions;
begin
  Result := [pppcEndOfReport];
end; {function, GetPrintCondition}

{------------------------------------------------------------------------------}
{ TppSummaryBand.CalcPrintPosition }

procedure TppSummaryBand.CalcPrintPosition;
begin

  if (NewPage) and not(AlreadyPageBreak) then
    begin
      AlreadyPageBreak := True;

      if Visible then
        OutOfSpace := True;

    end
    
  else if (Report.Engine.PrintPosRect.Left <> Report.Engine.Page.PrinterSetup.PageDef.mmMarginLeft) then
    OutOfSpace := True

  else
    inherited CalcPrintPosition;


end; {procedure, CalcPrintPosition}

{------------------------------------------------------------------------------}
{ TppSummaryBand.BeforeGenerate }

procedure TppSummaryBand.BeforeGenerate;
var
  lbDecrement: Boolean;
begin

  Report.Engine.ESInclude([esPrintingSummary]);

  {reduce last group footers break no, so page numbers update properly}
  if (NewPage) and not(AlreadyPageBreak) then
    lbDecrement := True
  else if (NewPage) and (AlreadyPageBreak) then
    lbDecrement := False
  else
    lbDecrement := True;

  if lbDecrement and (Report.Engine.ControlGroup <> nil) and not(OverFlow) and not(PartialGeneration) then
    Report.Engine.ControlGroup.BreakNo := (Report.Engine.ControlGroup.BreakNo - 1);

end; {procedure, BeforeGenerate}

{------------------------------------------------------------------------------}
{ TppSummaryBand.AfterGenerate }

procedure TppSummaryBand.AfterGenerate;
begin

  Report.Engine.ESExclude([esPrintingSummary]);

  inherited AfterGenerate;

end; {procedure, AfterGenerate}



{******************************************************************************
 *
 **  C O L U M N   H E A D E R   B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppColumnHeaderBand.Create }

constructor TppColumnHeaderBand.Create(aOwner : TComponent);
begin
  inherited Create(aOwner);

  Height  := 0;
  CaptionIndex := 188;

end; {constructor, TppColumnHeaderBand}

{------------------------------------------------------------------------------}
{ TppColumnHeaderBand.GetRank }

function TppColumnHeaderBand.GetRank: String;
begin
  Result := Format('%8d',[2]);
end; {function, GetRank}

{------------------------------------------------------------------------------}
{ TppColumnHeaderBand.GetUserName }

function TppColumnHeaderBand.GetUserName: TComponentName;
begin
  Result := 'ColumnHeader'; {do not localize}
end; {function, GetUserName}

{------------------------------------------------------------------------------}
{ TppColumnHeaderBand.GetPrintCondition }

function TppColumnHeaderBand.GetPrintCondition: TppPrintConditions;
begin
  Result := [pppcStartOfColumn];
end; {function, GetPrintCondition}

{------------------------------------------------------------------------------}
{ TppColumnHeaderBand.CanAdvanceData }

function TppColumnHeaderBand.CanAdvanceData: Boolean;
begin
  Result := True;
end; {function, CanAdvanceData}

{******************************************************************************
 *
 **  C O L U M N   F O O T E R   B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppColumnFooterBand.Create }

constructor TppColumnFooterBand.Create(aOwner : TComponent);
begin
  inherited Create(aOwner);

  Height  := 0;
  CaptionIndex := 187;

  {footers are always static}
  PrintHeight := phStatic;

end; {constructor, TppColumnFooterBand}

{------------------------------------------------------------------------------}
{ TppColumnFooterBand.GetUserName }

function TppColumnFooterBand.GetUserName: TComponentName;
begin
  Result := 'ColumnFooter'; {do not localize}
end; {function, GetUserName}

{------------------------------------------------------------------------------}
{ TppColumnFooterBand.GetPrintCondition }

function TppColumnFooterBand.GetPrintCondition: TppPrintConditions;
begin
  Result := [pppcEndOfColumn];
end; {function, GetPrintCondition}

{------------------------------------------------------------------------------}
{ TppColumnFooterBand.GetRank }

function TppColumnFooterBand.GetRank: String;
begin
  Result := Format('%8d',[6]);
end; {function, GetRank}

{------------------------------------------------------------------------------}
{ TppColumnFooterBand.CalcPrintPosition }

procedure TppColumnFooterBand.CalcPrintPosition;
var
  lRect: TppRect;
begin

  {calc the actual page bottom}
  PageBottom :=  Report.Engine.Page.PageDef.mmHeight - Report.Engine.Page.PageDef.mmMarginBottom;

  {start at engine page bottom (actual page bottom - footer band height) - height}
  StartingPosition := Report.Engine.PageBottom;

  lRect.Left := Report.Engine.PrintPosRect.Left;
  lRect.Top := StartingPosition;
  lRect.Right := Report.Engine.PrintPosRect.Right;
  lRect.Bottom := StartingPosition + mmHeight;

  PrintPosRect := lRect;

end; {procedure, CalcPrintPosition}

{------------------------------------------------------------------------------}
{ TppColumnFooterBand.SetPrintHeight }

procedure TppColumnFooterBand.SetPrintHeight(aPrintHeight: TppPrintHeightType);
begin
 {do nothing, footer is always static}
end;

{------------------------------------------------------------------------------}
{ TppColumnFooterBand.CreatePopupMenu }

procedure TppColumnFooterBand.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {disable Static/Dynamic popup menu items}
  aPopupMenu.ItemByName('DynamicHeight').Enabled := False;
  aPopupMenu.ItemByName('StaticHeight').Enabled  := False;

end; {procedure, CreatePopupMenu}


{******************************************************************************
 *
 ** D E T A I L B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDetailBand.Create}

constructor TppDetailBand.Create(aOwner : TComponent);
begin
  inherited Create(aOwner);

  CacheRecordSize := SizeOf(TppDetailBandSaveRec);

  CaptionIndex := 189;

  FBandsPerRecord := 1;
  FBandsPerRecordCount := 1;
  FDataPipeline := nil;

end; {constructor, TppDetailBand}

{------------------------------------------------------------------------------}
{ TppDetailBand.Destroy }

destructor TppDetailBand.Destroy;
begin

  {tell data pipeline that we no longer exist}
  if (FDataPipeline <> nil) then
    FDataPipeline.RemoveNotify(Self);

  inherited Destroy;

end; {destructor, TppDetailBand}

{------------------------------------------------------------------------------}
{ TppDetailBand.GetUserName }

function TppDetailBand.GetUserName: TComponentName;
begin
  Result := 'Detail'; {do not localize}
end; {function, GetUserName}

{------------------------------------------------------------------------------}
{ TppDetailBand.GetPrintCondition }

function TppDetailBand.GetPrintCondition: TppPrintConditions;
begin
  Result := [pppcOnTraversal];
end; {function, GetPrintCondition}

{------------------------------------------------------------------------------}
{ TppDetailBand.GetRank }

function TppDetailBand.GetRank: String;
begin
  Result := Format('%8d',[4]);
end; {function, GetRank}

{------------------------------------------------------------------------------}
{ TppDetailBand.CanAdvanceData }

function TppDetailBand.CanAdvanceData: Boolean;
begin
  Result := True;
end; {function, CanAdvanceData}

{------------------------------------------------------------------------------}
{ TppDetailBand.Convert }

procedure TppDetailBand.Convert(aVersionNo: Integer);
begin
  inherited Convert(aVersionNo);

  if (Report <> nil) and (aVersionNo < 3000) and (TppReport(Report).RowSpacing <> 0) then
    BottomOffset := TppReport(Report).RowSpacing;

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TppDetailBand.RestoreFromCache }

procedure TppDetailBand.RestoreFromCache(aAbsolutePageNo: Longint);
var
  lRec: TppDetailBandSaveRec;
begin

  ReadRecordFromCache(aAbsolutePageNo, lRec);

  FObjectIndex := lRec.FObjectIndex;
  FObjectListIndex := lRec.FObjectListIndex;
  FOverFlow := lRec.FOverFlow;
  FPartialGeneration := lRec.FPartialGeneration;
  FPartialAdjustment := lRec.FPartialAdjustment;
  FPrintPositionBreak := lRec.FPrintPositionBreak;
  FPrintingSection := lRec.FPrintingSection;

  FBandsPerRecordCount := lRec.FBandsPerRecordCount;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppDetailBand.SaveToCache }

procedure TppDetailBand.SaveToCache(aAbsolutePageNo: Longint);
var
  lRec: TppDetailBandSaveRec;
begin

  lRec.FObjectIndex := FObjectIndex;
  lRec.FObjectListIndex := FObjectListIndex;
  lRec.FOverFlow := FOverFlow;
  lRec.FPartialGeneration := FPartialGeneration;
  lRec.FPartialAdjustment := FPartialAdjustment;
  lRec.FPrintPositionBreak := FPrintPositionBreak;
  lRec.FPrintingSection := FPrintingSection;

  lRec.FBandsPerRecordCount := FBandsPerRecordCount;

  WriteRecordToCache(aAbsolutePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppDetailBand.SetBandsPerRecord }

procedure TppDetailBand.SetBandsPerRecord(aValue: Integer);
begin

  if (aValue < 1) then
    FBandsPerRecord := 1
  else
    FBandsPerRecord := aValue;

  Reset;

end; {procedure, SetBandsPerRecord}

{------------------------------------------------------------------------------}
{ TppDetailBand.SetDataPipeline }

procedure TppDetailBand.SetDataPipeline(aDataPipeline: TppDataPipeline);
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

  Reset;

  {do this AFTER FDataPipeline assigned}
  {any data-aware components with the same datapipeline need to be updated}
  UpdateParentDataPipeline(lNewDataPipeline, lOldDataPipeline);

end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppDetailBand.UpdateParentDataPipeline }

procedure TppDetailBand.UpdateParentDataPipeline(aNewDataPipeline, aOldDataPipeline: TppDataPipeline);
var
  liObject: Integer;
  lObject: TppComponent;
begin

  {update datapipeline property of components}
  for liObject := 0 to ObjectCount - 1 do
    begin
      lObject := Objects[liObject];

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

end; {procedure, UpdateParentDataPipeline}

{------------------------------------------------------------------------------}
{ TppDetailBand.Notify }

procedure TppDetailBand.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (FDataPipeline = aCommunicator) then
    if (aOperation = ppopRemove) then
      begin
        FDataPipeline := nil;

        Reset;
      end
    else if (aOperation = ppopDataChange) then
      Reset;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDetailBand.IsDataAware }

function TppDetailBand.IsDataAware: Boolean;
begin
  Result := True;
end; {function, IsDataAware}

{------------------------------------------------------------------------------}
{ TppDetailBand.GetDefaultPrintTimes }

function TppDetailBand.GetDefaultPrintTimes: TppPrintTimesType;
begin
  Result := ptRepeat;
end; {function, GetDefaultPrintTimes}

{------------------------------------------------------------------------------}
{ TppDetailBand.AdjustStartingPosition }

procedure TppDetailBand.AdjustStartingPosition;
begin

  {set starting position to print position for first detail band only}
  if not(Report.Engine.FirstDetailBandPrinted) then
    inherited AdjustStartingPosition;

end; {procedure, AdjustStartingPosition}

{------------------------------------------------------------------------------}
{ TppDetailBand.GetADataPipeline }

function TppDetailBand.GetADataPipeline: TppDataPipeline;
begin
  {find the best DataPipeline}
  if (FDataPipeline <> nil) then
    Result := FDataPipeline
  else
    Result := Report.DataPipeline;
end; {function, GetADataPipeline}

{------------------------------------------------------------------------------}
{ TppDetailBand.Init }

procedure TppDetailBand.Init;
begin
  inherited Init;

  FBandsPerRecordCount := 1;
end; {function, Init}

{------------------------------------------------------------------------------}
{ TppDetailBand.BeforePrint }

procedure TppDetailBand.BeforePrint;
var
  liObject: Integer;
begin

  {fire event}
  DoBeforePrint;

  if not(Visible) then
    Report.Engine.SyncData;

  {notify objects}
  for liObject := 0 to ObjectCount - 1 do
    Objects[liObject].BeforePrint;

end; {procedure, BeforePrint}

{------------------------------------------------------------------------------}
{ TppDetailBand.BeforeObjectGenerate }

procedure TppDetailBand.BeforeObjectGenerate;
begin

  Report.Engine.SyncData;

  inherited BeforeObjectGenerate;

end; {procedure, BeforeObjectGenerate}

{------------------------------------------------------------------------------}
{ TppDetailBand.AfterPrint }

procedure TppDetailBand.AfterPrint;
begin
  inherited AfterPrint;

  if not(OverFlow) and not(OutOfSpace) then
    begin
      if (FBandsPerRecordCount >= FBandsPerRecord) then
        begin
          Report.Engine.TraverseData;

          FBandsPerRecordCount := 1;
        end
      else
        Inc(FBandsPerRecordCount);

      if Report.Engine.AllDataTraversed or (pppcEndOfGroup in Report.Engine.PrintCondition) then
        GenerationComplete := True;
    end;

  {if we've reached the count limit, we're done with this page}
  if not(GenerationComplete) then
    begin
      if not(OverFlow) and (Report.AutoStop) and (Count = 1) then
        begin
          GenerationComplete := True;

          Report.Stop;
        end
      else if ((PrintTimes = ptCount) and (Count = PrintCount)) then
        OutOfSpace := True;
    end;

end;{procedure, AfterPrint}

{------------------------------------------------------------------------------}
{ TppDetailBand.AfterObjectGenerate }

procedure TppDetailBand.AfterObjectGenerate;
begin

  {computes calcs for detail band only}
  if not(OverFlow) and Report.Engine.AllDataTraversed then
    GenerationComplete := True;

  if (PrintingSection) and not(esEndSection in Report.Engine.State) then
     OutOfSpace := True;

  if not(Report.Engine.FirstDetailBandPrinted) then
    Report.Engine.FirstDetailBandPrinted := True;

  inherited AfterObjectGenerate;

end; {procedure, AfterObjectGenerate}

{------------------------------------------------------------------------------}
{ TppDetailBand.DefineProperties }

procedure TppDetailBand.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);

  Filer.DefineProperty('DataSource', ReadDataSource, nil, False);
  Filer.DefineProperty('NoRecordsAction', ReadNoRecordsAction, nil, False);
  Filer.DefineProperty('SkipWhenNoRecords', ReadSkipWhenNoRecords, nil, False);

end; {procedure, DefineProperties}

{------------------------------------------------------------------------------}
{ TppDetailBand.ReadDataSource }

procedure TppDetailBand.ReadDataSource(Reader: TReader);
begin

  {read the value into a string}
  FDataSource := Reader.ReadIdent;

end; {procedure, ReadDataSource}

{------------------------------------------------------------------------------}
{ TppDetailBand.ReadSkipWhenNoRecords }

procedure TppDetailBand.ReadSkipWhenNoRecords(Reader: TReader);
begin

  {eat the value}
  Reader.ReadBoolean;

end; {procedure, ReadSkipWhenNoRecords}

{------------------------------------------------------------------------------}
{ TppDetailBand.ReadNoRecordsAction }

procedure TppDetailBand.ReadNoRecordsAction(Reader: TReader);
begin

  {eat the value}
  Reader.ReadIdent;

end; {procedure, ReadNoRecordsAction}

{******************************************************************************
 *
 **  G R O U P  B A N D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppGroupBand.Create }

constructor TppGroupBand.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  CacheRecordSize := SizeOf(TppGroupBandSaveRec);

  FGeneration := False;
  FGroup := nil;
  FSaveGeneration := False;

end; {constructor, Create

{------------------------------------------------------------------------------}
{ TppGroupBand.Destroy }

destructor TppGroupBand.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppGroupBand.RestoreFromCache }

procedure TppGroupBand.RestoreFromCache(aAbsolutePageNo: Longint);
var
  lRec: TppGroupBandSaveRec;
begin

  ReadRecordFromCache(aAbsolutePageNo, lRec);

  FObjectIndex         := lRec.FObjectIndex;
  FObjectListIndex     := lRec.FObjectListIndex;
  FOverFlow            := lRec.FOverFlow;
  FPartialGeneration   := lRec.FPartialGeneration;
  FPartialAdjustment   := lRec.FPartialAdjustment;
  FPrintPositionBreak  := lRec.FPrintPositionBreak;
  FPrintingSection     := lRec.FPrintingSection;

  FGeneration        := lRec.FGeneration;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppGroupBand.SaveToCache }

procedure TppGroupBand.SaveToCache(aAbsolutePageNo: Longint);
var
  lRec: TppGroupBandSaveRec;
begin

  lRec.FObjectIndex       := FObjectIndex;
  lRec.FObjectListIndex   := FObjectListIndex;
  lRec.FOverFlow          := FOverFlow;
  lRec.FPartialGeneration := FPartialGeneration;
  lRec.FPartialAdjustment := FPartialAdjustment;
  lRec.FPrintPositionBreak  := FPrintPositionBreak;
  lRec.FPrintingSection     := FPrintingSection;

  lRec.FGeneration  := FGeneration;

  WriteRecordToCache(aAbsolutePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppGroupBand.Init}

procedure TppGroupBand.Init;
begin
  inherited Init;

  FGeneration := False;
  FSaveGeneration := False;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppGroupBand.GetDescription }

function TppGroupBand.GetDescription: String;
var
  lsBreakName: String;
begin

  if (FGroup = nil) or (Report = nil) then Exit;

  if (FGroup.BreakName = '') then
    begin

      if FGroup.BreakType = btCustomField then
        lsBreakName := ppLoadStr(300)
      else
        lsBreakName := ppLoadStr(301);
    end

  else if (FGroup.DataPipeline <> nil) then
    lsBreakName := FGroup.DataPipeline.FieldAliasForFieldName(FGroup.BreakName)

  else
    lsBreakName := FGroup.BreakName;

  {example: GroupHeader[0]: CompanyName }
  Result := ppLoadStr(CaptionIndex) +
            '[' +  IntToStr(FGroup.GroupNo) + ']: ' + lsBreakName;

end; {procedure, GetDescription}



{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppGroupBand.GetParentComponent - required method for Components with HasParent = True }

function TppGroupBand.GetParentComponent: TComponent;
begin
  Result := Group;

end;

{------------------------------------------------------------------------------}
{ TppGroupBand.SetParentComponent - required method for Components with HasParent = True }

procedure TppGroupBand.SetParentComponent(Value: TComponent);
begin

  if (Value is TppGroup) then
    Group := (Value as TppGroup);

end;

{$ENDIF}

{------------------------------------------------------------------------------}
{ TppGroupBand.PropertyChange }

procedure TppGroupBand.PropertyChange;
begin
  if (FGroup = nil) or (Report = nil) then Exit;

  if (Report.Printing) then Exit;

  {notify report designer }
  SendDesignMessage(PM_COMPONENTCHANGE, ppWCustomMsg, LongInt(Self));

end; {procedure, PropertyChange}

{------------------------------------------------------------------------------}
{ TppGroupBand.SetGroup property routine }

procedure TppGroupBand.SetGroup(aGroup: TppGroup);
begin

  FGroup := aGroup;

   if (FGroup <> nil) then
    Caption := ppLoadStr(CaptionIndex);

  GroupChanged;

end; {procedure, SetGroup}

{------------------------------------------------------------------------------}
{ TppGroupBand.GroupChanged - called by Group to keep group band attributes in sync }

procedure TppGroupBand.GroupChanged;
begin

 if Assigned(FGroup) then
   begin

      Caption := GetDescription;

     if (DesignControl <> nil) then
         DesignControl.Caption := '  ^  ' + Caption;

   end;

end; {procedure, GroupChanged}

{------------------------------------------------------------------------------}
{ TppGroupBand.CreatePopupMenu }

procedure TppGroupBand.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {parameteres: GroupIndex, Name, Caption, StringID}
  aPopupMenu.AddItem(30, 'Groups', '', 146);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppGroupBand.PopupMenuClick }

procedure TppGroupBand.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  {assign menu item event handlers}
  TppPopupMenu(Sender).ItemByName('Groups').OnClick := GroupMenuClick;

end; {procedure, PopupMenuClick}


{------------------------------------------------------------------------------}
{ TppGroupBand.GroupMenuClick }

procedure TppGroupBand.GroupMenuClick(Sender: TObject);
begin

   {notify ppDesigner to show group dialog}
   SendDesignMessage(PM_GROUPMENUCLICK, ppWCustomMsg, 0);

end; {procedure, GroupMenuClick}


{******************************************************************************}
{*
{**  G R O U P   H E A D E R   B A N D
{*
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.Create }

constructor TppGroupHeaderBand.Create(aOwner : TComponent);
begin

  inherited Create(aOwner);

  CacheRecordSize := SizeOf(TppGroupHeaderBandSaveRec);

  CaptionIndex := 192; {default, gets changed later}

  Height  := 0;

  FAlreadyColumnBreak := False;
  FAlreadyPageBreak := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.Destroy }

destructor TppGroupHeaderBand.Destroy;
begin

  if (Group <> nil) then
    Group.HeaderBand := nil;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.GetPrintCondition }

procedure TppGroupHeaderBand.Init;
begin

  inherited Init;

  {default these to true, so group header does not force new page
   at beginning of report}
  FAlreadyPageBreak := True;
  FAlreadyColumnBreak := True;

  {default these to true, so group header prints at beginning of report}
  Generation := True;
  SaveGeneration := True;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.GetPrintCondition }

function TppGroupHeaderBand.GetPrintCondition: TppPrintConditions;
begin

  Result := [pppcStartOfGroup];

  if (Group <> nil) and (Group.ReprintOnSubsequentPage) then
    Include(Result, pppcStartOfPage);

  if (Group <> nil) and (Report.Columns > 1) and (Group.ReprintOnSubsequentColumn) then
    Include(Result, pppcStartOfColumn);

end; {function, GetPrintCondition}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.SetGroup }

procedure TppGroupHeaderBand.SetGroup(aGroup: TppGroup);
begin

  if (Group <> nil) then
    Group.HeaderBand := nil;

  inherited SetGroup(aGroup);

  if Assigned(aGroup) then
    aGroup.HeaderBand := Self;

end; {procedure, SetGroup}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.GetRank }

function TppGroupHeaderBand.GetRank: String;
begin

  if (Group <> nil) then
    Result := Format('%8d',[3]) + Format('%8d',[Group.GroupNo]);

end; {function, GetRank}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.RestoreFromCache }

procedure TppGroupHeaderBand.RestoreFromCache(aAbsolutePageNo: Longint);
var
  lRec: TppGroupHeaderBandSaveRec;
begin

  ReadRecordFromCache(aAbsolutePageNo, lRec);

  FObjectIndex        := lRec.FObjectIndex;
  FObjectListIndex    := lRec.FObjectListIndex;
  FOverFlow           := lRec.FOverFlow;
  FPartialGeneration  := lRec.FPartialGeneration;
  FPartialAdjustment  := lRec.FPartialAdjustment;
  FPrintPositionBreak := lRec.FPrintPositionBreak;
  FPrintingSection    := lRec.FPrintingSection;

  FGeneration        := lRec.FGeneration;

  FAlreadyPageBreak := lRec.FAlreadyPageBreak;
  FAlreadyColumnBreak := lRec.FAlreadyColumnBreak;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.SaveToCache }

procedure TppGroupHeaderBand.SaveToCache(aAbsolutePageNo: Longint);
var
  lRec: TppGroupHeaderBandSaveRec;
begin

  lRec.FObjectIndex        := FObjectIndex;
  lRec.FObjectListIndex    := FObjectListIndex;
  lRec.FOverFlow           := FOverFlow;
  lRec.FPartialGeneration  := FPartialGeneration;
  lRec.FPartialAdjustment  := FPartialAdjustment;
  lRec.FPrintPositionBreak := FPrintPositionBreak;
  lRec.FPrintingSection    := FPrintingSection;

  lRec.FGeneration  := FGeneration;

  lRec.FAlreadyPageBreak := FAlreadyPageBreak;
  lRec.FAlreadyColumnBreak := FAlreadyColumnBreak;

  WriteRecordToCache(aAbsolutePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.ReadState }

procedure TppGroupHeaderBand.ReadState(Reader: TReader);
begin

{$IFDEF WINDOWS}
  if Reader.Parent is TppGroup then
    SetGroup(TppGroup(Reader.Parent));
{$ENDIF}

  inherited ReadState(Reader);

end; {procedure, ReadState}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.BeforePrint }

procedure TppGroupHeaderBand.BeforePrint;
begin

  Group.GroupHeaderBeforePrint;

  inherited BeforePrint;

end; {procedure, BeforePrint}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.BeforeGenerate }

procedure TppGroupHeaderBand.BeforeGenerate;
var
  llSpaceAvailable: Longint;
begin

  {must take cache snapshot only if this band is supposed to generate}
  if Generation then
    Group.GroupHeaderBeforeGenerate;

  {subsequent page of same group?}
  if not(Generation) and
     (pppcStartOfPage in Report.Engine.PrintCondition) and
     (Group.ReprintOnSubsequentPage) and
     (Report.Engine.AbsolutePageNo >= Group.FirstPageNo) then
    GenerationComplete := False

  {subsequent column of same group?}
  else if not(Generation) and
     (pppcStartOfColumn in Report.Engine.PrintCondition) and
     (Group.ReprintOnSubsequentColumn) and
     ((Report.Engine.AbsolutePageNo > Group.FirstPageNo) or
      ((Report.Engine.AbsolutePageNo = Group.FirstPageNo) and
       (Report.Engine.CurrentColumn > Group.FirstColumn))) then
    GenerationComplete := False

  {printing the title or summary band?}
  else if (esPrintingTitle in Report.Engine.State) or
     (esPrintingSummary in Report.Engine.State) then
    GenerationComplete := True

  else if not(Generation) and not(OverFlow) then
    GenerationComplete := True;

  if (GenerationComplete) then Exit;

  inherited CalcPrintPosition;

  llSpaceAvailable := PageBottom - StartingPosition;

  if (FAlreadyPageBreak) or (FAlreadyColumnBreak) then
    {do nothing}

  else if (Report.Columns > 1) and Generation and Group.NewColumn then
    begin
      FAlreadyColumnBreak := True;
      OutOfSpace := True;
    end

  else if Generation and Group.NewPage then
    begin
      FAlreadyPageBreak := True;
      OutOfSpace := True;
    end

  else if (Report.Columns > 1) and (Group.mmNewColumnThreshold > llSpaceAvailable) then
    begin
      FAlreadyColumnBreak := True;
      OutOfSpace := True;
    end

  else if (Group.mmNewPageThreshold > llSpaceAvailable) then
    begin
      FAlreadyPageBreak := True;
      OutOfSpace := True;
    end;

  {save first page and column on which this group appears}
  if not(OutOfSpace) and
    ((Generation) or (pppcStartOfReport in Report.Engine.PrintCondition)) and not(OverFlow) then
    begin
      Group.FirstPageNo := Report.Engine.AbsolutePageNo;

      Group.FirstColumn := Report.Engine.CurrentColumn;

      Report.Engine.SyncData;
    end;


end; {procedure, BeforeGenerate}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.BeforeObjectGenerate }

procedure TppGroupHeaderBand.BeforeObjectGenerate;
begin

  {if Generation and not(OverFlow) and not(PartialGeneration) then}  {4.25}
  if not(OverFlow) and not(PartialGeneration) then
    Group.BeforeHeader;

  inherited BeforeObjectGenerate;

end; {procedure, BeforeObjectGenerate}

{------------------------------------------------------------------------------}
{ TppGroupHeaderBand.AfterPrint }

procedure TppGroupHeaderBand.AfterPrint;
begin

  inherited AfterPrint;

  {if group break occured, reset generation flags}
  if Generation and not(OverFlow) and not(OutOfSpace) then
    begin
      Generation := False;

      Group.Breaking := False;

      {clear page break indicator}
      if FAlreadyPageBreak then
        FAlreadyPageBreak := False;

      {clear column break indicator}
      if FAlreadyColumnBreak then
        FAlreadyColumnBreak := False;

    end;

end; {procedure, AfterPrint}

{******************************************************************************}
{*
{**  G R O U P   F O O T E R    B A N D
{*
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppGroupFooterBand.Create }

constructor TppGroupFooterBand.Create(aOwner : TComponent);
begin

  inherited Create(aOwner);

  CaptionIndex := 191; {default, gets changed later}
  Height  := 0;

end; {constructor, TppGroupFooterBand}

{------------------------------------------------------------------------------}
{ TppGroupFooterBand.Destroy }

destructor TppGroupFooterBand.Destroy;
begin

  if (Group <> nil) then
    Group.FooterBand := nil;

  inherited Destroy;

end; {destructor, TppGroupFooterBand}

{------------------------------------------------------------------------------}
{ TppGroupFooterBand.GetPrintCondition }

function TppGroupFooterBand.GetPrintCondition: TppPrintConditions;
begin
  Result := [pppcEndOfGroup];
end; {function, GetPrintCondition}

{------------------------------------------------------------------------------}
{ TppGroupFooterBand.SetGroup }

procedure TppGroupFooterBand.SetGroup(aGroup: TppGroup);
begin

  if (Group <> nil) then
    Group.FooterBand := nil;

  inherited SetGroup(aGroup);

  if Assigned(aGroup) then
    aGroup.FooterBand := Self;

end; {procedure, SetGroup}

{------------------------------------------------------------------------------}
{ TppGroupFooterBand.GetRank }

function TppGroupFooterBand.GetRank: String;
var
  llGroupNo: Longint;
begin

  {set footer sort id using 9's complement of group number}
  if (Group <> nil)  then
    begin
      llGroupNo := 99999999 - (Group.GroupNo + 1);

      Result := Format('%8d',[5]) + Format('%8d',[llGroupNo]);
    end;

end; {procedure, GetRank}

{------------------------------------------------------------------------------}
{ TppGroupFooterBand.ReadState }

procedure TppGroupFooterBand.ReadState(Reader: TReader);
begin

{$IFDEF WINDOWS}
  if Reader.Parent is TppGroup then
    SetGroup(TppGroup(Reader.Parent));
{$ENDIF}

  inherited ReadState(Reader);

end; {procedure, ReadState}

{------------------------------------------------------------------------------}
{ TppGroupFooterBand.BeforeObjectGenerate }

procedure TppGroupFooterBand.BeforeObjectGenerate;
begin

  {if Generation and not(OverFlow) and not(PartialGeneration) then} {4.24}
  if not(OverFlow) and not(PartialGeneration) then
    Group.BeforeFooter;

  inherited BeforeObjectGenerate;

end; {procedure, BeforeObjectGenerate}

{------------------------------------------------------------------------------}
{ TppGroupFooterBand.BeforePrint }

procedure TppGroupFooterBand.BeforePrint;
begin

  inherited BeforePrint;

end; {procedure, BeforePrint}

{------------------------------------------------------------------------------}
{ TppGroupFooterBand.BeforeGenerate }

procedure TppGroupFooterBand.BeforeGenerate;
begin

  if not(Generation) and
     (pppcEndOfReport in Report.Engine.PrintCondition) then
    GenerationComplete := False

  else if not(Generation) and not(OverFlow) then
    GenerationComplete := True;

end; {procedure, BeforeGenerate}

{------------------------------------------------------------------------------}
{ TppGroupFooterBand.AfterPrint }

procedure TppGroupFooterBand.AfterPrint;
begin

  inherited AfterPrint;

  {if group break occured, reset generation flags}
  if Generation and not(OverFlow) and not(OutOfSpace) then
    begin
      Generation := False;

      Group.GroupFooterAfterPrint;
    end;

end; {procedure, AfterPrint}

{------------------------------------------------------------------------------}
{ TppGroupFooterBand.AfterGenerate }

procedure TppGroupFooterBand.AfterGenerate;
begin

  {advance record to the appropriate position}
  if (Group <> nil) and (Group.GroupNo = 0) and not(OutOfSpace) and
     not(Report.Engine.AllDataTraversed) and (pppcEndOfGroup in Report.Engine.PrintCondition) then
    Report.Engine.AdvanceRecord := True;

  inherited AfterGenerate;

end; {procedure, AfterGenerate}


{******************************************************************************}
{*
{**  C U S T O M    B A N D
{*
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomBand.Create }

constructor TppCustomBand.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  CacheRecordSize := SizeOf(TppBandSaveRec);

  FAllObjectsPrinted := False;
  FCalcList := nil;
  FCumulativeCurrentPosition := 0;
  FCurrentPosition := 0;
  FGenerating := False;
  FGenerationComplete := False;
  FMaxStretchablePosition := 0;
  FObjectListIndex := 0;
  FObjectListSaved := False;
  FObjectIndex := 0;
  FObjectSaved := False;
  FOverFlow := False;
  FPrintingSection := False;
  FPrintPositionBreak := False;
  FPageBottom := 0;
  FSpaceUsed := 0;
  FStartingPosition := 0;

  FStretchables := nil;
  FShifters := nil;
  FStretchers := nil;
  FStatics := nil;
  FPrintQueue := TStringList.Create;

  {build list of object lists}
  FObjectLists := TStringList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomBand.Destroy }

destructor TppCustomBand.Destroy;
begin
  {free print processing lists}
  FreeLists;

  FCalcList.Free;
  FObjectLists.Free;
  FPrintQueue.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomBand.FreeLists }

procedure TppCustomBand.FreeLists;
var
  liList: Integer;
begin

  for liList := 0 to FObjectLists.Count - 1 do
    TList(FObjectLists.Objects[liList]).Free;

  FStretchables := nil;
  FStretchers := nil;
  FShifters := nil;
  FStatics := nil;

  FObjectLists.Clear;

end; {procedure, FreeLists}

{------------------------------------------------------------------------------}
{ TppCustomBand.RestoreFromCache }

procedure TppCustomBand.RestoreFromCache(aAbsolutePageNo: Longint);
var
  lRec: TppBandSaveRec;
begin

  ReadRecordFromCache(aAbsolutePageNo, lRec);

  FObjectIndex        := lRec.FObjectIndex;
  FObjectListIndex    := lRec.FObjectListIndex;
  FOverFlow           := lRec.FOverFlow;
  FPartialGeneration  := lRec.FPartialGeneration;
  FPartialAdjustment  := lRec.FPartialAdjustment;
  FPrintPositionBreak := lRec.FPrintPositionBreak;
  FPrintingSection    := lRec.FPrintingSection;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppCustomBand.SaveToCache }

procedure TppCustomBand.SaveToCache(aAbsolutePageNo: Longint);
var
  lRec: TppBandSaveRec;
begin

  lRec.FObjectIndex        := FObjectIndex;
  lRec.FObjectListIndex    := FObjectListIndex;
  lRec.FOverFlow           := FOverFlow;
  lRec.FPartialGeneration  := FPartialGeneration;
  lRec.FPartialAdjustment  := FPartialAdjustment;
  lRec.FPrintPositionBreak := FPrintPositionBreak;
  lRec.FPrintingSection    := FPrintingSection;

  WriteRecordToCache(aAbsolutePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppCustomBand.Init }

procedure TppCustomBand.Init;
begin

  inherited Init;

  FObjectIndex       := 0;
  FObjectListIndex   := 0;
  FOverFlow          := False;
  FPartialGeneration := False;
  FPartialAdjustment := mmHeight;

  FreeLists;

  CategorizeObjects;

  BuildCalcList;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppCustomBand.BuildCalcList }

procedure TppCustomBand.BuildCalcList;
var
  liObject: Integer;
  liObjects: Integer;
begin

  FCalcList.Free;
  FCalcList := nil;

  liObjects := ObjectCount;

  for liObject := 0 to liObjects - 1 do
    if Objects[liObject].IsCalc then
      begin
        if FCalcList = nil then
          FCalcList := TList.Create;

        FCalcList.Add(Objects[liObject]);
      end;

end; {procedure, BuildCalcList}

{------------------------------------------------------------------------------}
{ TppCustomBand.GetCurrentObject }

function TppCustomBand.GetCurrentObject: TppComponent;
var
  lList: TList;
begin

  Result := nil;

  if not(Printing) then Exit;

  if (FObjectLists.Count = 0) then Exit;

  if (FObjectListIndex < 0) or (FObjectListIndex >= FObjectLists.Count) then Exit;

  lList := TList(FObjectLists.Objects[FObjectListIndex]);

  if (FObjectIndex < 0) or (FObjectIndex >= lList.Count) then Exit;

  Result := TppComponent(lList[FObjectIndex]);

end; {procedure, function}

{------------------------------------------------------------------------------}
{ TppCustomBand.CategorizeObjects }

procedure TppCustomBand.CategorizeObjects;
var
  liObjects: Integer;
  liObject: Integer;
  lObject: TppComponent;

  procedure AddObjectToList(var aList: TList; aObject: TObject; aListRank: Integer);
  begin

    if (aList = nil) then
      begin
        aList := TList.Create;

        FObjectLists.AddObject(IntToStr(aListRank), aList);
      end;

    aList.Add(lObject);

  end; {procedure, AddObjectToList}

  
begin

  {get number of objects}
  liObjects := ObjectCount;

  {categorize objects}
  for liObject := 0 to liObjects - 1 do
    begin
      lObject := Objects[liObject];

      {save object's z-order}
      lObject.ZOrder := liObject;

      if (lObject is TppStretchable) then
        begin
          if (TppStretchable(lObject).ShiftRelativeTo = nil) and
             (TppStretchable(lObject).Region = nil) then
             begin
               if TppStretchable(lObject).Stretch then
                 AddObjectToList(FStretchables, lObject, 2)

               else if lObject.StretchWithParent then
                 AddObjectToList(FStretchers, lObject, 3)

               else if lObject.ShiftWithParent then
                 AddObjectToList(FShifters, lObject, 4)

               else
                 AddObjectToList(FStatics, lObject, 1);

             end;
        end

      else if (lObject.Region = nil) then
        begin

          if lObject.StretchWithParent then
            AddObjectToList(FStretchers, lObject, 3)

          else if lObject.ShiftWithParent then
            AddObjectToList(FShifters, lObject, 4)

          else
            AddObjectToList(FStatics, lObject, 1);

      end; {if, object is stretchable}
      
    end; {for, each object}

  FObjectLists.Sort;

end; {procedure, CategorizeObjects}

{------------------------------------------------------------------------------}
{ TppCustomBand.Generate }

procedure TppCustomBand.Generate;
begin

  FGenerating := True;
  FGenerationComplete := False;
  FOutOfSpace := False;
  FCount := 0;

  {allow descendant's to do something}
  BeforeGenerate;

  while not(CheckForEndOfGeneration) do

    begin
      {init printing properties}
      FAllObjectsPrinted := True;
      FMaxStretchable := nil;
      FObjectSaved := False;
      FObjectListSaved := False;
      FObjectOverFlow := False;
      FPrintQueue.Clear;
      FSpaceUsed := 0;

      ResetObjects;

      {fire BeforePrint event}
      BeforePrint;

      {calculate the height used by the band}
      CalcPrintPosition;

      if (Visible) then
        begin

          {allow objects to generate}
          if not(FOutOfSpace) then
            begin
              {increment band counters}
              if not(OverFlow) and not(PartialGeneration) then
                Report.Engine.ReportBandCount := Report.Engine.ReportBandCount + 1;
                
              Report.Engine.PageBandCount := Report.Engine.PageBandCount + 1;
              FCount := FCount + 1;

              {allow descendant's to do something}
              BeforeObjectGenerate;

              GenerateObjects(FObjectListIndex, FObjectIndex);

              {allow descendant's to do something}
              AfterObjectGenerate;

              {update print position}
              UpdatePrintPosition;
            end;

          {allow objects to create print commands}
          Print(Report.Engine.Page);

      end; {if, band is visible}

      {end generation if band not visible}
      GenerationComplete := not(Visible);

      {fire AfterPrint event}
      AfterPrint;

      {let the app catch up}
      Report.ProcessMessages;

    end; {while, not end of generation}

  {allow descendants to do something here}
  AfterGenerate;

  FGenerating := False;

end; {procedure, Generate}

{------------------------------------------------------------------------------}
{ TppCustomBand.ResetObjects }

procedure TppCustomBand.ResetObjects;
var
  liObject: Integer;
  liObjects: Integer;
begin
  if FOverFlow or FPartialGeneration then Exit;

  liObjects := ObjectCount;

  for liObject := 0 to liObjects - 1 do
    Objects[liObject].DrawComponent := True;

end; {procedure, ResetObjects}

{------------------------------------------------------------------------------}
{ TppCustomBand.CheckForEndofGeneration }

function TppCustomBand.CheckForEndofGeneration: Boolean;
begin

  Result := False;

  if GenerationComplete then
    Result := True

  else if Report.Engine.StopPrinting then
    Result := True

  else if FOutOfSpace then
    Result := True

  else if (PrintTimes = ptOne) and (FCount = 1) then
    Result := True

  else if (PrintTimes = ptCount) and (FCount = PrintCount) then
    Result := True

  else if ((PrintCondition * Report.Engine.PrintCondition) = []) then
    Result := True;

end; {function, CheckForEndofGeneration}

{------------------------------------------------------------------------------}
{ TppCustomBand.CalcPrintPosition }

procedure TppCustomBand.CalcPrintPosition;
var
  lRect: TppRect;
  llHeight: Longint;
begin

  {set page bottom}
  FPageBottom := Report.Engine.PageBottom - mmBottomOffset;

  {set starting position}
  FStartingPosition := Report.Engine.PrintPosRect.Top;

  {adjust starting position to support PrintPosition property}
  AdjustStartingPosition;

  {determine if band can fit on page}
  if (PrintHeight = phStatic) then
    llHeight := mmHeight
  else
    llHeight := 0;

  if Visible and ((FStartingPosition + llHeight) > FPageBottom) then
    begin
      FOutOfSpace := True;

      Exit;
    end;

  {set print position}
  lRect.Left   := Report.Engine.PrintPosRect.Left;
  lRect.Top    := FStartingPosition;
  lRect.Right  := Report.Engine.PrintPosRect.Right;

  if (PrintHeight = phStatic) then
    lRect.Bottom := lRect.Top + mmHeight
  else
    lRect.Bottom := FPageBottom;

  FPrintPosRect := lRect;

  FCurrentPosition := PrintPosRect.Top;

  FMaxStretchablePosition := 0;

  FCurrentPartialAdjustment := FPartialAdjustment;

end; {procedure, CalcPrintPosition}

{------------------------------------------------------------------------------}
{ TppCustomBand.AdjustStartingPosition }

procedure TppCustomBand.AdjustStartingPosition;
var
  lsMessage: String;
begin

  if (mmPrintPosition <> 0) then
    begin

      if (mmPrintPosition >= FPageBottom) then
        begin
          lsMessage := ppLoadStr(415);
          Report.RaiseException(EPrintError.Create(lsMessage + '.'));
        end

      else if (mmPrintPosition < FStartingPosition) or
              ((PrintHeight = phStatic) and ((mmPrintPosition + mmHeight) > FPageBottom) ) then
        begin
          if (FPrintPositionBreak) then
            FPrintPositionBreak := False
          else
            begin
              FOutOfSpace := True;

              FPrintPositionBreak := True;
            end;
        end
      else
        begin
          if (FPrintPositionBreak) then
            FPrintPositionBreak := False;

          FStartingPosition := mmPrintPosition;
        end;

    end;

end; {procedure, AdjustStartingPosition}

{------------------------------------------------------------------------------}
{ TppCustomBand.UpdatePrintPosition }

procedure TppCustomBand.UpdatePrintPosition;
var
  lRect: TppRect;
begin
  lRect := PrintPosRect;

  if (PrintHeight = phStatic) then
    FSpaceUsed := mmHeight
  else
    FSpaceUsed := FSpaceUsed;

  FSpaceUsed := FSpaceUsed + mmBottomOffset;

  lRect.Top := lRect.Top + FSpaceUsed;
  lRect.Bottom := lRect.Top;

  Report.Engine.SetPrintPosition(lRect.Left, lRect.Top, lRect.Right, lRect.Top);

  Report.Engine.SpaceUsed := Report.Engine.SpaceUsed + FSpaceUsed;

end;{procedure, UpdatePrintPosition}

{------------------------------------------------------------------------------}
{ TppCustomBand.Print }

procedure TppCustomBand.Print(aPage: TppPage);
var
  liComponent: Integer;
  liComponents: Integer;
  lComponent: TppComponent;
begin

  if not DrawPage then Exit;

  CreateDrawCommand(aPage);

  liComponents := FPrintQueue.Count;

  {sort objects by z-order}
  FPrintQueue.Sort;

  for liComponent := 0 to liComponents - 1 do
    begin
      lComponent := TppComponent(FPrintQueue.Objects[liComponent]);

      lComponent.Print(aPage);

      {let the app catch up}
      Report.ProcessMessages;
    end;

end; {procedure, Print}

{------------------------------------------------------------------------------}
{ TppCustomBand.GenerateObjects }

procedure TppCustomBand.GenerateObjects(aListIndex, aObjectIndex: Integer);
var
  liListIndex: Integer;
  liLists: Integer;
  lList: TList;
  liObjectIndex: Integer;
begin

  {generate any reprintonoverflow statics first}
  if OverFlow and (FStatics <> nil) and not(PrintingSection) and (aListIndex <> 0) and not(PartialGeneration) then
    ProcessQueue(FStatics, 0);

  {loop thru object lists, processing each one}
  liListIndex := aListIndex;
  liObjectIndex := aObjectIndex;

  liLists := FObjectLists.Count;

  while (liListIndex < liLists) do
    begin
      lList := TList(FObjectLists.Objects[liListIndex]);

      ProcessQueue(lList, liObjectIndex);

      if not(AllObjectsPrinted) and not(FObjectListSaved) then
        begin
          FObjectListSaved := True;
          FObjectListIndex := liListIndex;
        end;

      {go to next list}
      if not(FPrintingSection) then
        begin
          Inc(liListIndex);

          liObjectIndex := 0;

          {if stretchables don't fit, we're done}
          if (FStretchables <> nil) and (lList = FStretchables) and (SpaceUsed = 0) then
            liListIndex := liLists;
        end
      else
        liListIndex := liLists;

      {let the app catch up}
      Report.ProcessMessages;

    end; {while, each object list}

  {set overflow status}
  FOverFlow := FObjectOverFlow;

  if (FOverFlow) and (FPrintQueue.Count = 0) then
    FOverFlow := False;
    
  {set partial generation status}
  FPartialGeneration := not(FAllObjectsPrinted) and not(FOverFlow);

  FPartialAdjustment := FCurrentPartialAdjustment;

  if (FPartialGeneration) and (FPrintQueue.Count = 0) then
    FPartialAdjustment := 0

  else if not(FPartialGeneration) then
    FPartialAdjustment := mmHeight;

  {reset object indexes}
  if (FAllObjectsPrinted) then
    begin
      FObjectListIndex := 0;
      FObjectIndex := 0;
    end;

  {set out of space status}
  if (FPartialGeneration) or (FOverFlow) then
    FOutOfSpace := True;

end; {procedure, GenerateObjects}

{------------------------------------------------------------------------------}
{ TppCustomBand.ProcessQueue }

procedure TppCustomBand.ProcessQueue(aQueue: TList; aObjectIndex: Integer);
var
  liComponent: Integer;
  lComponent: TppComponent;
begin

  liComponent := aObjectIndex;

  FCumulativeCurrentPosition := FCurrentPosition;

  while (liComponent < aQueue.Count) and not(GenerationComplete) do
    begin
      lComponent := TppComponent(aQueue[liComponent]);

      lComponent.Generate;

      {add the object to the print queue}
      if (lComponent.SpaceUsed > 0) then
        FPrintQueue.AddObject(Format('%8d', [lComponent.ZOrder]), lComponent);

      {indicate that object did not print completely}
      SaveOverFlowObject(lComponent, liComponent);

      {add to current position}
      IncrementCurrentPosition(lComponent);

      {finish the section}
      if (FPrintingSection) then
        CompleteSection(lComponent, liComponent, aQueue);

      {goto next component}
      Inc(liComponent);

      {let the app catch up}
      Report.ProcessMessages;

    end; {while, each object}

  if (FCumulativeCurrentPosition <> FCurrentPosition) then
    begin
      FCurrentPosition := FCumulativeCurrentPosition;
      FSpaceUsed := FCurrentPosition - PrintPosRect.Top;
    end;

end; {procedure, ProcessQueue}

{------------------------------------------------------------------------------}
{ TppCustomBand.SaveOverFlowObject }

procedure TppCustomBand.SaveOverFlowObject(aObject: TppComponent; aObjectIndex: Integer);
begin

  if (aObject.GenerationComplete) then Exit;

  {if this component was the first not to print, save it's position in the list}
  if not(FObjectSaved) then
    begin
      FObjectSaved := True;
      FObjectIndex := aObjectIndex;

      if (aObject is TppStretchable) and TppStretchable(aObject).Stretch then
        FObjectOverFlow := True
      else
        FObjectOverFlow := False;

      FAllObjectsPrinted := False;
    end;

  {4.22, enables Stretchable.KeepTogether to work when ShiftWithParent is orphaned}
  {if (FPartialAdjustment = -1) then
    FPartialAdjustment := mmHeight;}

  if (FCurrentPartialAdjustment = 0) then
    FCurrentPartialAdjustment := mmHeight;

  if (aObject.mmTop < FCurrentPartialAdjustment) then
    FCurrentPartialAdjustment := aObject.mmTop;

end; {procedure, SaveOverFlowObject}

{------------------------------------------------------------------------------}
{ TppCustomBand.IncrementCurrentPosition }

procedure TppCustomBand.IncrementCurrentPosition(aObject: TppComponent);
var
  llCheckPosition: Longint;
begin

  if (PrintHeight = phStatic) or (FPrintingSection) then Exit;

  {default max stretchable, if possible}
  if (aObject is TppStretchable) and (FMaxStretchable = nil) then
    FMaxStretchable := TppStretchable(aObject);

  if (aObject.SpaceUsed = 0) then Exit;

  llCheckPosition := aObject.PrintPosRect.Top + aObject.SpaceUsed;

  if (llCheckPosition > FCumulativeCurrentPosition) then
    FCumulativeCurrentPosition := llCheckPosition;

  if (aObject is TppStretchable) and (llCheckPosition > FMaxStretchablePosition) then
    begin
      FMaxStretchablePosition := llCheckPosition;
      FMaxStretchable := TppStretchable(aObject);
    end;

end; {procedure, IncrementCurrentPosition}

{------------------------------------------------------------------------------}
{ TppCustomBand.CompleteSection }

procedure TppCustomBand.CompleteSection(aObject: TppComponent; aObjectIndex: Integer; aQueue: TList);
var
  lRect: TppRect;
  lNextObject: TppComponent;
begin

  if not(FPrintingSection) then Exit;

  if not(aObject.GenerationComplete) then
    begin
      GenerationComplete := True;

      Exit;
    end;

  if (aObjectIndex + 1 < aQueue.Count) then
    lNextObject := TppComponent(aQueue[aObjectIndex + 1])
  else
    lNextObject := nil;

  if (lNextObject <> nil) and (lNextObject is TppSubReport) and
     (TppSubReport(lNextObject).PrintBehavior = pbSection) then
    begin
      {indicate to next section that space has been used}
      if aObject.Visible then
        FSpaceUsed := aObject.SpaceUsed;
    end
  else
    begin
      {use up remaining space}
      FCurrentPosition := PageBottom;
      FCumulativeCurrentPosition := FCurrentPosition;
      FSpaceUsed := FCurrentPosition - PrintPosRect.Top;

      lRect := PrintPosRect;
      lRect.Top := PageBottom;
      lRect.Bottom := PageBottom;
      PrintPosRect := lRect;

      FPrintingSection := False;
      FPartialGeneration := False;
      
      if (PrintHeight = phDynamic) then
        FPartialAdjustment := -1;
        
    end;

end; {procedure, CompleteSection}

{------------------------------------------------------------------------------}
{ TppCustomBand.ComputeCalcs }

procedure TppCustomBand.ComputeCalcs(aMasterPipeline, aDetailPipeline: TppDataPipeline);
var
  liObject: Integer;
  lComponent: TppComponent;
begin

  if (FCalcList = nil) then Exit;

  for liObject := 0 to FCalcList.Count - 1 do
    begin
      lComponent := TppComponent(FCalcList[liObject]);

      if lComponent.IsDataAware then
        begin
          {compute only if no pipeline or pipeline has traversed}
          if (lComponent.DataPipeline = nil) or
             (lComponent.DataPipeline = aMasterPipeline) or
             (lComponent.DataPipeline = aDetailPipeline) or
             (lComponent.LookupPipeline) then
            lComponent.Compute;
        end

      else
        lComponent.Compute;

    end;

end; {procedure, ComputeCalcs}

{------------------------------------------------------------------------------}
{ TppCustomBand.AfterGenerate }

procedure TppCustomBand.AfterGenerate;
begin

end; {procedure, AfterGenerate}

{------------------------------------------------------------------------------}
{ TppCustomBand.BeforeObjectGenerate }

procedure TppCustomBand.BeforeObjectGenerate;
begin
  DoBeforeGenerate;
end; {procedure, BeforeObjectGenerate}

{------------------------------------------------------------------------------}
{ TppCustomBand.AfterObjectGenerate }

procedure TppCustomBand.AfterObjectGenerate;
begin
  DoAfterGenerate;
end; {procedure, AfterObjectGenerate}

{------------------------------------------------------------------------------}
{ TppCustomBand.AfterPrint }

procedure TppCustomBand.AfterPrint;
var
  liObject: Integer;
begin

  {notify objects}
  for liObject := 0 to ObjectCount - 1 do
    Objects[liObject].AfterPrint;

  {fire event}
  if not(OutOfSpace) or (OverFlow) then
    DoAfterPrint;

end; {procedure, AfterPrint}

{------------------------------------------------------------------------------}
{ TppCustomBand.BeforeGenerate }

procedure TppCustomBand.BeforeGenerate;
begin

end; {procedure, BeforeGenerate}

{------------------------------------------------------------------------------}
{ TppCustomBand.CanAdvanceData }

function TppCustomBand.CanAdvanceData: Boolean;
begin
  Result := False;
end; {function, IsFooterBand}

{------------------------------------------------------------------------------}
{ TppCustomBand.BeforePrint }

procedure TppCustomBand.BeforePrint;
var
  liObject: Integer;
begin

  if (CanAdvanceData) then
    Report.Engine.SyncData;

  {notify objects}
  for liObject := 0 to ObjectCount - 1 do
    Objects[liObject].BeforePrint;

  {fire event}
  DoBeforePrint;

end; {procedure, BeforePrint}

{------------------------------------------------------------------------------}
{ TppCustomBand.CreateDrawCommand }

procedure TppCustomBand.CreateDrawCommand(aPage: TppPage);
begin

end; {procedure, CreateDrawCommand}

{------------------------------------------------------------------------------}
{ TppCustomBand.GetUserName }

function TppCustomBand.GetUserName: TComponentName;
begin

  Result := inherited GetUserName;

  if Result = '' then
    Result := GetDefaultUserName

end; {function, GetUserName}


{******************************************************************************
 *
 **  P A G E   S T Y L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPageStyle.Create}

constructor TppPageStyle.Create(aOwner : TComponent);
begin
  inherited Create(aOwner);

  CaptionIndex := 691;

  FTraverseData := False;
  FDataPipeline := nil;
  FEndPage := 0;
  FPageList := nil;
  FPageSetting := psAll;
  FSinglePage := 0;
  FStartPage := 0;
  FValidPages := '';

end; {constructor, TppPageStyle}

{------------------------------------------------------------------------------}
{ TppPageStyle.Destroy }

destructor TppPageStyle.Destroy;
begin

  {tell data pipeline that we no longer exist}
  if (FDataPipeline <> nil) then
    FDataPipeline.RemoveNotify(Self);

  FPageList.Free;

  inherited Destroy;

end; {destructor, TppPageStyle}

{------------------------------------------------------------------------------}
{ TppPageStyle.GetUserName }

function TppPageStyle.GetUserName: TComponentName;
begin
  Result := 'PageStyle'; {do not localize}
end; {function, GetUserName}

{------------------------------------------------------------------------------}
{ TppPageStyle.GetDefaultPrintTimes }

function TppPageStyle.GetDefaultPrintTimes: TppPrintTimesType;
begin
  Result := ptOne;
end; {function, GetDefaultPrintTimes}

{------------------------------------------------------------------------------}
{ TppPageStyle.GetPrintCondition }

function TppPageStyle.GetPrintCondition: TppPrintConditions;
begin
  Result := [pppcStartOfPage];
end; {function, GetPrintCondition}

{------------------------------------------------------------------------------}
{ TppPageStyle.GetRank }

function TppPageStyle.GetRank: String;
begin
  {if designing, list page style last, if printing, put it before header}
  if Report.Printing then
    Result := Format('%8d',[0])
  else
    Result := Format('%8d',[9]);
end; {function, GetRank}

{------------------------------------------------------------------------------}
{ TppPageStyle.IsColumnar }

function TppPageStyle.IsColumnar: Boolean;
begin
  Result := False;
end; {function, IsColumnar}

{------------------------------------------------------------------------------}
{ TppPageStyle.IsDataAware }

function TppPageStyle.IsDataAware: Boolean;
begin
  Result := True;
end; {function, IsDataAware}

{------------------------------------------------------------------------------}
{ TppPageStyle.Init}

procedure TppPageStyle.Init;
begin

  inherited Init;

  FTraverseData := False;

  if (Report = nil) then Exit;

  FTraverseData := (FDataPipeline <> nil) and (Report.DataPipeline = nil);

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppPageStyle.CanAdvanceData }

function TppPageStyle.CanAdvanceData: Boolean;
begin
  Result := True;
end; {function, CanAdvanceData}

{------------------------------------------------------------------------------}
{ TppPageStyle.GetPageList }

function TppPageStyle.GetPageList: TStrings;
begin

  if (FPageList = nil) then
    FPageList := TStringList.Create;

  Result := FPageList;

end; {function, GetPageList}

{------------------------------------------------------------------------------}
{ TppPageStyle.SetEndPage }

procedure TppPageStyle.SetEndPage(aPageNo: Longint);
begin

  if (Report <> nil) and (Report.Printing) then Exit;

  if (FEndPage <> aPageNo) then
    begin
      FEndPage := aPageNo;

      {notify report designer}
      PropertyChange;

      Reset;
    end;

end; {procedure, SetEndPage}

{------------------------------------------------------------------------------}
{ TppPageStyle.SetPageList }

procedure TppPageStyle.SetPageList(aPageList: TStrings);
begin

  if (Report <> nil) and (Report.Printing) then Exit;

  GetPageList.Assign(aPageList);

  {notify report designer}
  PropertyChange;

  Reset;

end; {procedure, SetPageList}

{------------------------------------------------------------------------------}
{ TppPageStyle.SetPageSetting }

procedure TppPageStyle.SetPageSetting(aPageSetting: TppPageSettingType);
begin

  if (Report <> nil) and (Report.Printing) then Exit;

  if (FPageSetting <> aPageSetting) then
    begin
      FPageSetting := aPageSetting;

      {notify report designer}
      PropertyChange;

      Reset;
    end;

end; {procedure, SetPageSetting}

{------------------------------------------------------------------------------}
{ TppPageStyle.SetSinglePage }

procedure TppPageStyle.SetSinglePage(aPageNo: Longint);
begin

  if (Report <> nil) and (Report.Printing) then Exit;

  if (FSinglePage <> aPageNo) then
    begin
      FSinglePage := aPageNo;

      {notify report designer}
      PropertyChange;

      Reset;
    end;

end; {procedure, SetSinglePage}

{------------------------------------------------------------------------------}
{ TppPageStyle.SetStartPage }

procedure TppPageStyle.SetStartPage(aPageNo: Longint);
begin

  if (Report <> nil) and (Report.Printing) then Exit;

  if (FStartPage <> aPageNo) then
    begin
      FStartPage := aPageNo;

      {notify report designer}
      PropertyChange;

      Reset;
    end;

end; {procedure, SetStartPage}

{------------------------------------------------------------------------------}
{ TppPageStyle.SetValidPages }

procedure TppPageStyle.SetValidPages(Value: String);
begin

  if (Report <> nil) and (Report.Printing) then Exit;

  if (FValidPages <> Value) then
    begin
      FValidPages := Value;

      {parse pages}
      ppTextToPageList(FValidPages, PageList, False);

      SetPageSetting(psPageList);

      {notify report designer}
      PropertyChange;

      Reset;
    end;

end; {procedure, SetValidPages}

{------------------------------------------------------------------------------}
{ TppPageStyle.IsActive }

function TppPageStyle.IsActive: Boolean;
var
  llPageNo: Longint;
  lsPageNo: String;
begin

  llPageNo := Report.MainReport.AbsolutePageNo;

  case FPageSetting of

    psAll:
      Result := Visible;

    psPageList:
      begin
        lsPageNo := Format('%8d', [llPageNo]);

        Result := (PageList.IndexOf(lsPageNo) <> -1)
      end;

    psSinglePage:
      Result := (llPageNo = FSinglePage);

    psFirstPage:
      Result := (llPageNo = 1);

    psLastPage:
      Result := Report.MainReport.Engine.FirstPassCompleted and (llPageNo = Report.MainReport.AbsolutePageCount);

    psPageRange:
      Result := ((llPageNo >= FStartPage) and (llPageNo >= FEndPage));

    else
      Result := False;

  end; {case}

end; {function, IsActive}

{------------------------------------------------------------------------------}
{ TppPageStyle.SetDataPipeline }

procedure TppPageStyle.SetDataPipeline(aDataPipeline: TppDataPipeline);
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

  Reset;

  {do this AFTER FDataPipeline assigned}
  {any data-aware components with the same datapipeline need to be updated}
  UpdateParentDataPipeline(lNewDataPipeline, lOldDataPipeline);

end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppPageStyle.UpdateParentDataPipeline }

procedure TppPageStyle.UpdateParentDataPipeline(aNewDataPipeline, aOldDataPipeline: TppDataPipeline);
var
  liObject: Integer;
  lObject: TppComponent;
begin

  {update datapipeline property of components}
  for liObject := 0 to ObjectCount - 1 do
    begin
      lObject := Objects[liObject];

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

end; {procedure, UpdateParentDataPipeline}

{------------------------------------------------------------------------------}
{ TppPageStyle.Notify }

procedure TppPageStyle.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation = ppopRemove) and (aCommunicator = FDataPipeline) then
    begin
      FDataPipeline := nil;

      Report.Reset;
    end;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppPageStyle.AdjustStartingPosition }

procedure TppPageStyle.AdjustStartingPosition;
begin

  inherited AdjustStartingPosition;

end; {procedure, AdjustStartingPosition}

{------------------------------------------------------------------------------}
{ TppPageStyle.GetADataPipeline }

function TppPageStyle.GetADataPipeline: TppDataPipeline;
begin
  Result := FDataPipeline
end; {function, GetADataPipeline}

{------------------------------------------------------------------------------}
{ TppPageStyle.BeforePrint }

procedure TppPageStyle.BeforePrint;
begin

  {determine whether page style should print on this page}
  Visible := IsActive;

  inherited BeforePrint;
  
end; {procedure, BeforePrint}

{------------------------------------------------------------------------------}
{ TppPageStyle.BeforeObjectGenerate }

procedure TppPageStyle.BeforeObjectGenerate;
begin

  {Report.Engine.SyncData;}

  inherited BeforeObjectGenerate;

end; {procedure, BeforeObjectGenerate}

{------------------------------------------------------------------------------}
{ TppPageStyle.CalcPrintPosition }

procedure TppPageStyle.CalcPrintPosition;
var
  lRect: TppRect;
begin

  FSavePrintPos := Report.Engine.PrintPosRect;

  PageBottom :=  Report.Engine.Page.PageDef.mmHeight - Report.Engine.Page.PageDef.mmMarginBottom;
  StartingPosition := Report.Engine.Page.PageDef.mmMarginTop;

  lRect.Left := Report.Engine.PrintPosRect.Left;
  lRect.Top := StartingPosition;
  lRect.Right := Report.Engine.PrintPosRect.Right;
  lRect.Bottom := StartingPosition + mmHeight;

  PrintPosRect := lRect;

end; {procedure, CalcPrintPosition}

{------------------------------------------------------------------------------}
{ TppPageStyle.AfterPrint }

procedure TppPageStyle.AfterPrint;
begin

  inherited AfterPrint;

  if not(OverFlow) then
    begin
      GenerationComplete := True;

      if (FTraverseData) then
        begin
          FDataPipeline.Next;

          if FDataPipeline.EOF then
            Report.DataTraversalCompleted;
        end;
    end;

  {record space utilization, in case this is the only band}
  Report.Engine.SpaceUsed := PrintPosRect.Bottom;

  {undo any space utilization}
  Report.Engine.SetPrintPosition(FSavePrintPos.Left, FSavePrintPos.Top, FSavePrintPos.Right, FSavePrintPos.Top);

end;{procedure, AfterPrint}

{------------------------------------------------------------------------------}
{ TppPageStyle.AfterObjectGenerate }

procedure TppPageStyle.AfterObjectGenerate;
begin

  inherited AfterObjectGenerate;

end; {procedure, AfterObjectGenerate}

{------------------------------------------------------------------------------}
{ TppPageStyle.CreatePopupMenu }

procedure TppPageStyle.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {parameteres: GroupIndex, Name, Caption, StringID}
  aPopupMenu.AddItem(30, 'PageSetting', '', 1118);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppPageStyle.PopupMenuClick }

procedure TppPageStyle.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  {assign menu item event handlers}
  TppPopupMenu(Sender).ItemByName('PageSetting').OnClick := PageSettingMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppPageStyle.PageSettingMenuClick}

procedure TppPageStyle.PageSettingMenuClick(Sender: TObject);
var
  lDialog: TppCustomPageSettingDialog;
  lFormClass: TFormClass;
begin

  lFormClass := ppGetFormClass(TppCustomPageSettingDialog);

  lDialog := TppCustomPageSettingDialog(lFormClass.Create(Application));
  lDialog.LanguageIndex     := LanguageIndex;
  lDialog.Report            := Report;
  lDialog.PageSetting       := FPageSetting;
  lDialog.ValidPages        := FValidPages;

  if (lDialog.ShowModal = mrOK) then
    begin
      SetPageSetting(lDialog.PageSetting);

      if (FPageSetting = psPageList) then
        SetValidPages(lDialog.ValidPages)
      else
        begin
          PageList.Clear;

          FValidPages := '';
        end;

    end;

  lDialog.Free;

end; {procedure, PageSettingMenuClick}

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
 ** C U S T O M   B A N D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomBandRTTI.RefClass }

class function TraTppCustomBandRTTI.RefClass: TClass;
begin
  Result := TppCustomBand;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomBandRTTI.GetPropList }

class procedure TraTppCustomBandRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('Count');
  aPropList.AddProp('OverFlow');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCustomBandRTTI.GetPropRec }

class function TraTppCustomBandRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'AllObjectsPrinted') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'Count') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'CurrentObject') then
    ClassPropToRec(aPropName, TppComponent, True, aPropRec)

  else if ppEqual(aPropName, 'CurrentPosition') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'CumulativeCurrentPosition') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'Generating') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'GenerationComplete') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'MaxStretchable') then
    ClassPropToRec(aPropName, TppStretchable, True, aPropRec)

  else if ppEqual(aPropName, 'OutOfSpace') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'OverFlow') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'PageBottom') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'PartialGeneration') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'PartialAdjustment') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'PrintingSection') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'PrintPositionBreak') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'SpaceUsed') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'StartingPosition') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomBandRTTI.GetPropValue }

class function TraTppCustomBandRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'AllObjectsPrinted') then
    Boolean(aValue) := TppCustomBand(aObject).AllObjectsPrinted

  else if ppEqual(aPropName, 'Count') then
    Integer(aValue) := TppCustomBand(aObject).Count

  else if ppEqual(aPropName, 'CurrentObject') then
    Integer(aValue) := Integer(TppCustomBand(aObject).CurrentObject)

  else if ppEqual(aPropName, 'CurrentPosition') then
    Integer(aValue) := TppCustomBand(aObject).CurrentPosition

  else if ppEqual(aPropName, 'CumulativeCurrentPosition') then
    Integer(aValue) := TppCustomBand(aObject).CumulativeCurrentPosition

  else if ppEqual(aPropName, 'Generating') then
    Boolean(aValue) := TppCustomBand(aObject).Generating

  else if ppEqual(aPropName, 'GenerationComplete') then
    Boolean(aValue) := TppCustomBand(aObject).GenerationComplete

  else if ppEqual(aPropName, 'MaxStretchable') then
    Integer(aValue) := Integer(TppCustomBand(aObject).MaxStretchable)

  else if ppEqual(aPropName, 'OutOfSpace') then
    Boolean(aValue) := TppCustomBand(aObject).OutOfSpace

  else if ppEqual(aPropName, 'OverFlow') then
    Boolean(aValue) := TppCustomBand(aObject).OverFlow

  else if ppEqual(aPropName, 'PageBottom') then
    Integer(aValue) := TppCustomBand(aObject).PageBottom

  else if ppEqual(aPropName, 'PartialGeneration') then
    Boolean(aValue) := TppCustomBand(aObject).PartialGeneration

  else if ppEqual(aPropName, 'PartialAdjustment') then
    Integer(aValue) := TppCustomBand(aObject).PartialAdjustment

  else if ppEqual(aPropName, 'PrintingSection') then
    Boolean(aValue) := TppCustomBand(aObject).PrintingSection

  else if ppEqual(aPropName, 'PrintPositionBreak') then
    Boolean(aValue) := TppCustomBand(aObject).PrintPositionBreak

  else if ppEqual(aPropName, 'SpaceUsed') then
    Integer(aValue) := TppCustomBand(aObject).SpaceUsed

  else if ppEqual(aPropName, 'StartingPosition') then
    Integer(aValue) := TppCustomBand(aObject).StartingPosition

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{******************************************************************************
 *
 ** P A G E   B A N D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppPageBandRTTI.RefClass }

class function TraTppPageBandRTTI.RefClass: TClass;
begin
  Result := TppPageBand;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppPageBandRTTI.GetPropList }

class procedure TraTppPageBandRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppPageBandRTTI.GetPropRec }

class function TraTppPageBandRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'PrintHeight') then
    EnumPropToRec(aPropName, 'TppPrintHeightType', True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}


{******************************************************************************
 *
 ** R E P O R T   B A N D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppReportBandRTTI.RefClass }

class function TraTppReportBandRTTI.RefClass: TClass;
begin
  Result := TppReportBand;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppReportBandRTTI.GetPropList }

class procedure TraTppReportBandRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppReportBandRTTI.GetPropRec }

class function TraTppReportBandRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'NewPage') then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppReportBandRTTI.GetPropValue }

class function TraTppReportBandRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'NewPage') then
    Boolean(aValue) := TppReportBand(aObject).NewPage

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppReportBandRTTI.SetPropValue }

class function TraTppReportBandRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'NewPage') then
    TppReportBand(aObject).NewPage := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** F O O T E R   B A N D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppFooterBandRTTI.RefClass }

class function TraTppFooterBandRTTI.RefClass: TClass;
begin
  Result := TppFooterBand;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppFooterBandRTTI.GetPropList }

class procedure TraTppFooterBandRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppFooterBandRTTI.GetPropRec }

class function TraTppFooterBandRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'PrintHeight') then
    EnumPropToRec(aPropName, 'TppPrintHeightType', True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}


{******************************************************************************
 *
 ** D E T A I L   B A N D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppDetailBandRTTI.RefClass }

class function TraTppDetailBandRTTI.RefClass: TClass;
begin
  Result := TppDetailBand;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppDetailBandRTTI.GetPropList }

class procedure TraTppDetailBandRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  aPropList.AddProp('BandsPerRecordCount');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppDetailBandRTTI.GetPropRec }

class function TraTppDetailBandRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'BandsPerRecord') then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if ppEqual(aPropName, 'BandsPerRecordCount') then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if ppEqual(aPropName, 'DataPipeline') then
    ClassPropToRec(aPropName, TppDataPipeline, False, aPropRec)

  else if ppEqual(aPropName, 'PrintCount') then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppDetailBandRTTI.GetPropValue }

class function TraTppDetailBandRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'BandsPerRecord') then
    Integer(aValue) := TppDetailBand(aObject).BandsPerRecord

  else if ppEqual(aPropName, 'BandsPerRecordCount') then
    Integer(aValue) := TppDetailBand(aObject).BandsPerRecordCount

  else if ppEqual(aPropName, 'DataPipeline') then
    Integer(aValue) := Integer(TppDetailBand(aObject).DataPipeline)

  else if ppEqual(aPropName, 'PrintCount') then
    Integer(aValue) := TppDetailBand(aObject).PrintCount

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppDetailBandRTTI.SetPropValue }

class function TraTppDetailBandRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'BandsPerRecord') then
    TppDetailBand(aObject).BandsPerRecord := Integer(aValue)

  else if ppEqual(aPropName, 'DataPipeline') then
    TppDetailBand(aObject).DataPipeline := TppDataPipeline(aValue)

  else if ppEqual(aPropName, 'PrintCount') then
    TppDetailBand(aObject).PrintCount := Integer(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** C O L U M N   F O O T E R   B A N D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppColumnFooterBandRTTI.RefClass }

class function TraTppColumnFooterBandRTTI.RefClass: TClass;
begin
  Result := TppColumnFooterBand;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppColumnFooterBandRTTI.GetPropList }

class procedure TraTppColumnFooterBandRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppColumnFooterBandRTTI.GetPropRec }

class function TraTppColumnFooterBandRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'PrintHeight') then
    EnumPropToRec(aPropName, 'TppPrintHeightType', True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}


{******************************************************************************
 *
 ** G R O U P   B A N D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppGroupBandRTTI.RefClass }

class function TraTppGroupBandRTTI.RefClass: TClass;
begin
  Result := TppGroupBand;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppGroupBandRTTI.GetPropList }

class procedure TraTppGroupBandRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  aPropList.AddProp('Group');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppGroupBandRTTI.GetPropRec }

class function TraTppGroupBandRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Description') then
    PropToRec(aPropName, daString, True, aPropRec)

  else if ppEqual(aPropName, 'Generation') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if ppEqual(aPropName, 'Group') then
    ClassPropToRec(aPropName, TppGroup, False, aPropRec)

  else if ppEqual(aPropName, 'SaveGeneration') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppGroupBandRTTI.GetPropValue }

class function TraTppGroupBandRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Description') then
    String(aValue) := TppGroupBand(aObject).Description

  else if ppEqual(aPropName, 'Generation') then
    Boolean(aValue) := TppGroupBand(aObject).Generation

  else if ppEqual(aPropName, 'Group') then
    Integer(aValue) := Integer(TppGroupBand(aObject).Group)

  else if ppEqual(aPropName, 'SaveGeneration') then
    Boolean(aValue) := TppGroupBand(aObject).SaveGeneration

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppGroupBandRTTI.SetPropValue }

class function TraTppGroupBandRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'Group') then
    TppGroupBand(aObject).Group := TppGroup(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** G R O U P   H E A D E R   B A N D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppGroupHeaderBandRTTI.RefClass }

class function TraTppGroupHeaderBandRTTI.RefClass: TClass;
begin
  Result := TppGroupHeaderBand;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppGroupHeaderBandRTTI.GetPropList }

class procedure TraTppGroupHeaderBandRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  aPropList.AddProp('AlreadyPageBreak');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppGroupHeaderBandRTTI.GetPropRec }

class function TraTppGroupHeaderBandRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'AlreadyPageBreak') then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppGroupHeaderBandRTTI.GetPropValue }

class function TraTppGroupHeaderBandRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if ppEqual(aPropName, 'AlreadyPageBreak') then
    Boolean(aValue) := TppGroupHeaderBand(aObject).AlreadyPageBreak

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppHeaderBand, TppTitleBand, TppDetailBand, TppSummaryBand, TppFooterBand,
                   TppGroupHeaderBand, TppGroupFooterBand,
                   TppColumnHeaderBand, TppColumnFooterBand,
                   TppPageStyle]);

  raRegisterRTTI(TraTppCustomBandRTTI);
  raRegisterRTTI(TraTppPageBandRTTI);
  raRegisterRTTI(TraTppReportBandRTTI);
  raRegisterRTTI(TraTppFooterBandRTTI);
  raRegisterRTTI(TraTppDetailBandRTTI);
  raRegisterRTTI(TraTppColumnFooterBandRTTI);
  raRegisterRTTI(TraTppGroupBandRTTI);
  raRegisterRTTI(TraTppGroupHeaderBandRTTI);

finalization

  UnRegisterClasses([TppHeaderBand, TppTitleBand, TppDetailBand, TppSummaryBand, TppFooterBand,
                     TppGroupHeaderBand, TppGroupFooterBand,
                     TppColumnHeaderBand, TppColumnFooterBand,
                     TppPageStyle]);

  raUnRegisterRTTI(TraTppCustomBandRTTI);
  raUnRegisterRTTI(TraTppPageBandRTTI);
  raUnRegisterRTTI(TraTppReportBandRTTI);
  raUnRegisterRTTI(TraTppFooterBandRTTI);
  raUnRegisterRTTI(TraTppDetailBandRTTI);
  raUnRegisterRTTI(TraTppColumnFooterBandRTTI);
  raUnRegisterRTTI(TraTppGroupBandRTTI);
  raUnRegisterRTTI(TraTppGroupHeaderBandRTTI);

end.
