{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppCtrls;

interface

{$I ppIfDef.pas}                            

uses
  Windows, SysUtils, Classes, Graphics, Controls, ExtDlgs, Dialogs,
  Forms, StdCtrls, ExtCtrls, Menus, ppComm, ppDB,
  ppClass, ppTypes, ppUtils, ppDevice, ppDsgnCt, ppPrnabl, ppStrtch, ppDrwCmd,
  ppRTTI;

type

  { TppCustomComponent }
  TppCustomComponent = class(TppComponent)
    private
      procedure CalcPrintPosition;

    protected
      {used for conversion to 3.0}
      procedure ReadShiftWithBand(Reader: TReader);
      procedure ReadStretchWithBand(Reader: TReader);
      procedure DefineProperties(Filer: TFiler); override;

      procedure CalcSpaceUsed; virtual;
      procedure PaintDesignControl(aCanvas: TCanvas); override;
      function  ParentOverFlow: Boolean;
      function  ParentStretch: Boolean;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Generate; override;
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;

  end; {class, TppCustomComponent }

{******************************************************************************
 *
 ** C U S T O M    C L A S S E S
 *
{******************************************************************************}

  { TppCustomText }
  TppCustomText  = class(TppCustomComponent)
    private
      FBreakFieldForGroups: TList;
      FCharWrap: Boolean;
      FDisplayFormat: String;
      FSaveOrder: Integer;
      FSave: Boolean;
      FSaveLength: Integer;
      FOnGetText: TppGetTextEvent;
      FOnFormat: TppFormatEvent;

      {used for conversion to 3.1}
      FOnSave: String;

      function  GetDisplayFormat: String;
      function  GetSaveOrder: TTabOrder;
      procedure SetSaveOrder(Value: TTabOrder);
      procedure SetCharWrap(Value: Boolean);
      procedure SetSave(Value: Boolean);
      procedure SetSaveLength(Value: Integer);

      {used for conversion to 3.0}
      procedure ReadOnSave(Reader: TReader);

    protected
      {used for conversion to 3.1}
      procedure DefineProperties(Filer: TFiler); override;

      procedure AdjustBounds; override;
      function  CanOptimizeDesignPainting: Boolean; override;
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      function  GetDescription: String; override;
      function  GetTheText: String; virtual;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;
      procedure SetBand(aBand: TppBand); override;
      procedure SetDisplayFormat(const aFormat: String); virtual;
      procedure SetFont(Value: TFont); override;
      procedure SetName(const Value: TComponentName); override;

      {protected so TppLabel doesn't have to implement it}
      property DisplayFormat: String read GetDisplayFormat write SetDisplayFormat;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      procedure AddBreakFieldForGroup(aGroup: TppGroup);
      procedure Convert(aVersionNo: Integer); override;
      procedure RemoveBreakFieldForGroup(aGroup: TppGroup);
      function  GetText: String; override;
      function  GetTextBuf: PChar;
      function  GetTheSaveOrder: TTabOrder;
      procedure UpdateSaveOrder(Value: TTabOrder);

      property AutoSize default True;
      property Color; {needs to be at least public for ppDesigner}
      property Description: String read GetDescription;
      property OnFormat: TppFormatEvent read FOnFormat write FOnFormat;
      property Transparent;

      {used for conversion to 3.1}
      property OnSave: String read FOnSave;

    published
      property CharWrap: Boolean read FCharWrap write SetCharWrap default False;
      property OnGetText: TppGetTextEvent read FOnGetText write FOnGetText;
      property ReprintOnOverFlow;
      property SaveOrder: TTabOrder read GetSaveOrder write SetSaveOrder default -1;
      property Save: Boolean read FSave write SetSave default False;
      property SaveLength: Integer read FSaveLength write SetSaveLength default 0;
      property ShiftWithParent;
      property UserName;

  end; {class, TppCustomText }


  { TppCustomImage }
  TppCustomImage = class(TppCustomComponent)
    private
      FCenter  : Boolean;
      FMaintainAspectRatio: Boolean;
      FPicture : TPicture;
      FStretch : Boolean;
      FDirectDraw: Boolean;

      procedure SetCenter(Value: Boolean);
      procedure SetDirectDraw(Value: Boolean);
      procedure SetMaintainAspectRatio(Value: Boolean);
      procedure SetStretch(Value: Boolean);

    protected

      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;
      procedure PaintDesignControl(aCanvas: TCanvas); override;
      procedure PictureChanged(Sender: TObject); virtual;
      function  GetCaption: String; override;
      function  GetPicture: TPicture; virtual;
      procedure SetPicture(aPicture: TPicture); virtual;
      procedure SetTransparent(Value: Boolean); override;


    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Convert(aVersionNo: Integer); override;

      function  HasColor: Boolean; override;
      function  HasFont: Boolean; override;

      property  Picture: TPicture read GetPicture write SetPicture;

    published
      property Center: Boolean read FCenter write SetCenter default True;
      property DirectDraw: Boolean read FDirectDraw write SetDirectDraw default False;
      property Font stored False;
      property MaintainAspectRatio: Boolean read FMaintainAspectRatio write SetMaintainAspectRatio;
      property ReprintOnOverFlow;
      property ShiftWithParent;
      property Stretch: Boolean read FStretch write SetStretch default False;
      property Transparent default False;
      property Visible;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;

  end; {class, TppCustomImage}


  { TppCustomGraphic }
  TppCustomGraphic  = class(TppCustomComponent)
    private
      FBrush: TBrush;
      FPen: TPen;

    protected
      procedure SetBrush(aBrush: TBrush); virtual;
      procedure SetPen(aPen: TPen); virtual;

      {notify object when style changed}
      procedure StyleChanged(Sender: TObject); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure GetBackGroundColor(var aColor: TColor; var aIsClear: Boolean); override;
      procedure GetForeGroundColor(var aColor: TColor; var aIsClear: Boolean); override;
      function  HasFont: Boolean; override;
      procedure SetBackgroundColor(aColor: TColor; aIsClear: Boolean); override;
      procedure SetForegroundColor(aColor: TColor; aIsClear: Boolean); override;
      procedure SetPenWidth(aWidth: Integer); override;

      property Brush: TBrush read FBrush write SetBrush;
      property Pen: TPen read FPen write SetPen;

  end; {class, TppCustomGraphic }



{******************************************************************************
 *
 ** C U S T O M    T E X T    C L A S S E S
 *
{******************************************************************************}

  { TppLabel }
  TppLabel = class(TppCustomText)
    private

    protected
      function  GetDefaultPropHint: String; override;
      procedure SetUserName(const Value: TComponentName); override;

    public
     constructor Create(aOwner: TComponent); override;

    published
      property Alignment;
      property AutoSize;
      property Caption;
      property Color;
      property Font;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property Transparent;
      property UserName;
      property Visible;
      property WordWrap;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;

  end; {class, TppLabel}


  { TppDBText }
  TppDBText = class(TppCustomText)
    private
      FAlreadyPrinted: Boolean;
      FBlankWhenZero: Boolean;
      FFieldValue: String;
      FFirstPage: Integer;
      FJustRestored: Boolean;
      FPriorValue: String;
      FPriorValueSame: Boolean;
      FReprintOnSubsequent: Boolean;
      FSuppressRepeatedValues: Boolean;

      function  GetFieldValue: Variant;
      procedure SetBlankWhenZero(Value: Boolean);
      procedure SetReprintOnSubsequent(Value: Boolean);
      procedure SetSuppressRepeatedValues(Value: Boolean);
      procedure UpdateValues;

    protected
      procedure CalcSpaceUsed; override;
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      function  GetDescription: String; override;
      function  GetTheText: String; override;
      procedure SetDataField(const Value: String); override;
      procedure SetDisplayFormat(const aFormat: String); override;
      procedure SetUserName(const Value: TComponentName); override;

      {menu handling routines}
      procedure FormatMenuClick(Sender: TObject);
      procedure ResetGroupMenuClick(Sender: TObject);

   public
      constructor Create(aOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
      procedure EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList); override;

      procedure Clear; override;
      procedure Compute; override;
      function  IsCalc: Boolean; override;
      function  IsDataAware: Boolean; override;
      procedure Init; override;
      procedure PageStart; override;
      procedure PopupMenuClick(Sender: TObject); override;
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;

      property AlreadyPrinted: Boolean read FAlreadyPrinted write FAlreadyPrinted;
      property FieldValue: Variant read GetFieldValue;
      property FirstPage: Integer read FFirstPage write FFirstPage;
      property PriorValue: String read FPriorValue write FPriorValue;
      property PriorValueSame: Boolean read FPriorValueSame write FPriorValueSame;

    published
      property Alignment;
      property AutoSize default False;
      property BlankWhenZero: Boolean read FBlankWhenZero write SetBlankWhenZero default False;
      property Color;
      property DataField;
      property DataPipeline;
      property DisplayFormat;
      property Font;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property ParentDataPipeline;
      property ReprintOnSubsequent: Boolean  read FReprintOnSubsequent write SetReprintOnSubsequent default False;
      property ResetGroup;
      property SuppressRepeatedValues: Boolean read FSuppressRepeatedValues write SetSuppressRepeatedValues default False;
      property Transparent;
      property UserName;
      property Visible;
      property WordWrap;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;

      {events}
      property OnFormat;

  end; {class, TppDBText}


  TppLookAheadList = class;

  { TppDBCalc }
  TppDBCalc = class(TppDBText)
    private
      FDBCalcType: TppDBCalcType;
      FDivisor: Double;
      FFirstCount: Longint;
      FLookAhead: Boolean;
      FLookAheadList: TppLookAheadList;
      FOnCalc: TNotifyEvent;
      FOnGroupBreak: TNotifyEvent;
      FValue: Double;

      function  CanCalcLookAheads: Boolean;
      function  GetLookAheadKey: String;
      function  GetIDNo1: Integer;
      function  GetIDNo2: Integer;
      function  GetReportKey: String;
      function  GetTraversalCount: Integer;
      function  GetValue: Variant;
      procedure InitLookAhead;
      procedure SetDBCalcType(aDBCalcType: TppDBCalcType);
      procedure SetValue(aValue: Variant);
      procedure SetLookAhead(aValue: Boolean);

   protected
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      function  GetDescription: String; override;
      function  GetTheText: String; override;
      function  IsGroupBased: Boolean; override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;
      procedure SetBand(aBand: TppBand); override;

      {popup menu event handlers}
      procedure CalculationsMenuClick(Sender: TObject);
      procedure LookAheadMenuClick(Sender: TObject);

   public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Clear; override;
      procedure Compute; override;
      procedure EndOfMainReport; override;
      procedure Init; override;
      procedure PopupMenuClick(Sender: TObject); override;
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;
      procedure StartOfMainReport; override;

      property Divisor: Double read FDivisor write FDivisor;
      property Value: Variant read GetValue write SetValue;

    published
      property DBCalcType: TppDBCalcType read FDBCalcType write SetDBCalcType default dcSum;
      property LookAhead: Boolean read FLookAhead write SetLookAhead default False;
      property OnCalc: TNotifyEvent read FOnCalc  write FOnCalc;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property OnGroupBreak: TNotifyEvent read FOnGroupBreak  write FOnGroupBreak;

  end; {class, TppDBCalc}


  { TppLookAheadList }
  TppLookAheadList = class(TList)
    private
      FOwner: TppCommunicator;

      function  AddTotal(const aLookAheadKey: String; aTraversalCount: Integer; const aText: String): TppDrawVariable;
      function  FindTotal(const aLookAheadKey: String): TppDrawVariable;
      procedure FreeTotals;
      procedure SendCalcNotify(const aLookAheadKey: String; aTraversalCount: Integer; const aText: String);

    public
      constructor CreateList(aOwner: TppCommunicator);
      destructor Destroy; override;

      procedure Clear; override;

      function  RetrieveTotal(const aLookAheadKey: String; aTraversalCount: Integer; const aText: String): String;
      procedure UpdateTotal(const aLookAheadKey: String; aTraversalCount: Integer; const aText: String);
      procedure SignOffTotals;
      
  end; {class, TppLookAheadList}

{******************************************************************************
 *
 ** C U S T O M    G R A P H I C    C L A S S E S
 *
{******************************************************************************}

  { TppShape }
  TppShape = class(TppCustomGraphic)
    private
      FShapeType: TShapeType;

      procedure CalcDimensions(var aLeft, aTop, aRight, aBottom, aXCornerRound, aYCornerRound: Longint);
      procedure SetShape(aShapeType: TShapeType);

    protected
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;

      function  GetDefaultPropHint: String; override;
      procedure PaintDesignControl(aCanvas: TCanvas); override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;

      procedure StyleChanged(Sender: TObject); override;

    public
      constructor Create(aOwner: TComponent); override;

      procedure GetDefaultPropEnumNames(aList: TStrings); override;

    published
      property Brush;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property ParentHeight;
      property ParentWidth;
      property Pen;
      property ReprintOnOverFlow;
      property Shape: TShapeType read FShapeType write SetShape default stRectangle;
      property ShiftWithParent;
      property StretchWithParent;
      property UserName;
      property Visible;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;

  end; {class, TppShape}


  { TppLine }
  TppLine = class(TppCustomGraphic)
    private
      FOldPenWidth: Integer;
      FPosition: TppLinePositionType;
      FSettingWeight: Boolean;
      FStyle: TppLineStyleType;
      FWeight: Single;

      procedure SetPosition(aLinePosition: TppLinePositionType);
      procedure SetStyle(aLineStyle: TppLineStyleType);
      procedure SetWeight(aWeight: Single);

    protected
      function  CanOptimizeDesignPainting: Boolean; override;
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      function  GetDefaultPropHint: String; override;
      procedure PaintDesignControl(aCanvas: TCanvas); override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;

      procedure StyleChanged(Sender: TObject); override;

      {popup menu event handlers}
      procedure DoubleMenuClick(Sender: TObject);
      procedure SingleMenuClick(Sender: TObject);

    public
      constructor Create(aOwner: TComponent); override;

      procedure Convert(aVersionNo: Integer); override;
      procedure GetDefaultPropEnumNames(aList: TStrings); override;
      function  HasColor: Boolean; override;
      procedure PopupMenuClick(Sender: TObject); override;

    published
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property Pen;
      property ParentHeight;
      property ParentWidth;
      property Position: TppLinePositionType read FPosition write SetPosition default lpTop;
      property ReprintOnOverFlow;
      property ShiftWithParent;
      property StretchWithParent;
      property Style: TppLineStyleType read FStyle write SetStyle default lsSingle;
      property UserName;
      property Visible;
      property Weight: Single read FWeight write SetWeight;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;

  end; {class, TppLine}


{******************************************************************************
 *
 ** C U S T O M    I M A G E    C L A S S E S
 *
{******************************************************************************}


 { TppImage }
  TppImage = class(TppCustomImage)
    protected
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure PictureMenuClick(Sender: TObject);
      procedure SetAutoSize(Value: Boolean); override;

    public
      procedure InstantiateDesignControl; override;
      procedure PopupMenuClick(Sender: TObject); override;

    published
      property AutoSize;
      property DirectDraw;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property Picture;

  end; {class, TppImage}




  { TppDBImage }
  TppDBImage = class(TppCustomImage)
    private
      FAutoDisplay: Boolean;
      FGraphicType: String;
      FOnGetPicture: TppPictureEvent;

      function  GetGraphicClass: TGraphicClass;
      procedure GraphicTypeSubMenuClick(Sender: TObject);

    protected
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      function  GetDescription: String; override;
      function  GetPicture: TPicture; override;
      procedure PaintDesignControl(aCanvas: TCanvas); override;
      procedure PictureChanged(Sender: TObject); override;
      procedure SetAutoDisplay(Value: Boolean);
      procedure SetDataField(const Value: String); override;

      procedure SetGraphicType(aGraphicType: String);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      function  IsDataAware: Boolean; override;
      procedure LoadPicture;

      procedure PopupMenuClick(Sender: TObject); override;

      property GraphicClass: TGraphicClass read GetGraphicClass;

    published
      property AutoDisplay: Boolean read FAutoDisplay write SetAutoDisplay default True;
      property DataField;
      property DataPipeline;
      property DirectDraw;
      property GraphicType: String read FGraphicType write SetGraphicType;
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property OnGetPicture: TppPictureEvent read FOnGetPicture write FOnGetPicture;
      property ParentDataPipeline;

  end; {class, TppDBImage}


{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppCustomTextRTTI }
  TraTppCustomTextRTTI = class(TraTppComponentRTTI)
    public
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCustomTextRTTI}

  { TraTppCustomImageRTTI }
  TraTppCustomImageRTTI = class(TraTppComponentRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCustomImageRTTI}

  { TraTppDBImageRTTI }
  TraTppDBImageRTTI = class(TraTppCustomImageRTTI)
    public
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppDBImageRTTI}

  { TraTppCustomGraphicRTTI }
  TraTppCustomGraphicRTTI = class(TraTppComponentRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCustomGraphicRTTI}

  { TraTppLineRTTI }
  TraTppLineRTTI = class(TraTppCustomGraphicRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppLineRTTI}

  { TraTppShapeRTTI }
  TraTppShapeRTTI = class(TraTppCustomGraphicRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppShapeRTTI}

  { TraTppDBTextRTTI }
  TraTppDBTextRTTI = class(TraTppCustomTextRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppDBTextRTTI}

  { TraTppDBCalcRTTI }
  TraTppDBCalcRTTI = class(TraTppDBTextRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppDBCalcRTTI}



  procedure ppRegisterGraphicClass(aName: String; aGraphicClass: TGraphicClass);
  procedure ppUnRegisterGraphicClass(aGraphicClass: TGraphicClass);
  function  ppGetGraphicClassForName(aName: String): TGraphicClass;

  function ppGraphicClasses: TStringList;

var
  ppShape: TppShape;
  ppLine:  TppLine;

implementation

uses
  ppEngine, ppBands, ppRegion, ppForms;

var
  FGraphicClasses: TStringList = nil;

{******************************************************************************
 *
 ** C U S T O M   C O M P O N E N T
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppCustomComponent.Create }

constructor TppCustomComponent.Create(aOwner: TComponent);
begin

  inherited Create(AOwner);

  CacheRecordSize  := SizeOf(TppCustomComponentSaveRec);

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomComponent.Destroy }

destructor TppCustomComponent.Destroy;
begin

   inherited Destroy;

end; {destructor, Destroy}




{------------------------------------------------------------------------------}
{ TppCustomComponent.PaintDesignControl }

procedure TppCustomComponent.PaintDesignControl(aCanvas: TCanvas);
const
  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
  WordWraps:  array[Boolean] of Word = (0, DT_WORDBREAK);

 var
  lClientRect : TRect;
  lSaveColor : TColor;
  lFlags: Word;
  lBuffer: PChar;
  liSize: Integer;
  lCanvas: TCanvas;

begin

  if not (pppcDesigning in DesignState) or (Printing) then Exit;

  lClientRect := spClientRect;

  lCanvas := aCanvas;

  {draw background}
  if not Transparent then
    begin
      lCanvas.Brush.Color := Self.Color;
      lCanvas.Brush.Style := bsSolid;
      lCanvas.FillRect(lClientRect);
    end;

  lCanvas.Brush.Style := bsClear;
  lCanvas.Font := Font;

  {draw text}
  lFlags := DT_EXPANDTABS or Alignments[Alignment] or WordWraps[WordWrap] or DT_NOPREFIX;

  liSize := Length(Caption) + 1;
  GetMem(lBuffer, liSize);
  StrPCopy(lBuffer, Caption);

  DrawText(lCanvas.Handle, lBuffer, StrLen(lBuffer), lClientRect, lFlags);

  FreeMem(lBuffer, liSize);

  {draw a framerect}
  lSaveColor := lCanvas.Brush.Color;
  lCanvas.Brush.Color := clBlack;
  lCanvas.FrameRect(lClientRect);
  lCanvas.Brush.Color := lSaveColor;

end; {procedure, InvalidateDesignControl}

{------------------------------------------------------------------------------}
{ TppCustomComponent.ParentOverFlow }

function TppCustomComponent.ParentOverFlow: Boolean;
begin
  if (Parent is TppBand) then
    Result := TppCustomBand(Parent).OverFlow
  else
    Result := TppCustomRegion(Parent).OverFlow;
end; {function, ParentOverFlow}

{------------------------------------------------------------------------------}
{ TppCustomComponent.ParentStretch }

function TppCustomComponent.ParentStretch: Boolean;
begin
  if (Parent is TppBand) then
    Result := (Band.PrintHeight = phDynamic)
  else
    Result := TppCustomRegion(Parent).Stretch and (Band.PrintHeight = phDynamic);
end; {function, ParentStretch}

{------------------------------------------------------------------------------}
{ TppCustomComponent.Generate }

procedure TppCustomComponent.Generate;
begin

  {reset draw component, for reprintonoverflow}
  if ReprintOnOverFlow and (ParentOverFlow) then
    RedrawOnOverFlow;

  {fire OnPrint event}
  if not(Visible) and not(DrawComponent) then
    begin
      DoOnPrint;

      if Visible then
        DrawComponent := True;
    end
  else
    DoOnPrint;

  {allow component to draw, or indicate generation is complete}
  if DrawComponent and Visible then
    begin
      CalcPrintPosition;

      if not(OutOfSpace) then
        GenerationComplete := True;
    end
  else
    GenerationComplete := True;

end; {procedure, Generate}

{------------------------------------------------------------------------------}
{ TppCustomComponent.CalcPrintPosition }

procedure TppCustomComponent.CalcPrintPosition;
var
  lBand: TppCustomBand;
  lRegion: TppCustomRegion;
  llNewLeft: Longint;
  llNewTop: Longint;
  llNewHeight: Longint;
  lRect: TppRect;
  llRelativeTop: Longint;
  lMaxStretchable: TppStretchable;
  llChange: Longint;
  lbPartialGeneration: Boolean;
  llPartialAdjustment: Longint;
  llPageBottom: Longint;
  llCurrentPosition: Longint;
begin

  lBand := TppCustomBand(Band);

  llNewLeft := lBand.PrintPosRect.Left + mmLeft;
  llNewHeight := mmHeight;

  {calc max stretchable and change in parent height}
  llChange := 0;
  lMaxStretchable := nil;

  {determine parent's position and state}
  if Parent is TppBand then
    begin
      llCurrentPosition := lBand.CurrentPosition;
      llPageBottom := lBand.PageBottom;
      lbPartialGeneration := lBand.PartialGeneration;
      llPartialAdjustment := lBand.PartialAdjustment;

      llNewTop := lBand.PrintPosRect.Top + mmTop;

      if (lBand.SpaceUsed > 0) then
        begin
          lMaxStretchable := lBand.MaxStretchable;
          llChange := lBand.SpaceUsed - lBand.mmHeight;
        end;

    end

  else
    begin
      lRegion := TppCustomRegion(Parent);

      llCurrentPosition := lRegion.CurrentPosition;
      llPageBottom := lRegion.PageBottom;
      lbPartialGeneration := lRegion.PartialGeneration;
      llPartialAdjustment := lRegion.PartialAdjustment;

      llNewTop := lRegion.PrintPosRect.Top + (mmTop - lRegion.mmTop);

      if (lRegion.SpaceUsed > 0) then
        begin
          lMaxStretchable := TppCustomRegion(Parent).MaxStretchable;
          llChange := lRegion.SpaceUsed - lRegion.mmHeight;
        end;

    end;


  {adjust top and change for partial generation}
  if lbPartialGeneration then
    llNewTop := llNewTop - llPartialAdjustment;


  {adjust top if shifting with parent}
  if (ShiftWithParent) then
    begin

      if (lMaxStretchable <> nil) then
        begin
          llRelativeTop := mmTop - (lMaxStretchable.mmTop + lMaxStretchable.mmHeight);

          llNewTop := lMaxStretchable.PrintPosRect.Top + lMaxStretchable.SpaceUsed + llRelativeTop;
        end

      else
        llNewTop := llNewTop + llChange;

    end;

  {adjust height if stretching with parent}
  if (StretchWithParent) then
    begin

      if (llNewTop < llCurrentPosition) then
        llNewHeight := llCurrentPosition - llNewTop;

      {if stretched beyond page, adjust stretch}
      if (llNewTop < llPageBottom) and ((llNewTop + llNewHeight) > llPageBottom) then
        llNewHeight := llPageBottom - llNewTop;
    end;

  {if we're out of space, exit}
  if ParentStretch and ((llNewTop + llNewHeight) > (llPageBottom + 1)) then
    begin
      OutOfSpace := True;

      Exit;
    end;

  {set print position}
  lRect.Left   := llNewLeft;
  lRect.Top    := llNewTop;
  lRect.Right  := lRect.Left + mmWidth;
  lRect.Bottom := lRect.Top + llNewHeight;

  PrintPosRect := lRect;

  {calc default space used}
  SpaceUsed := llNewHeight;

  {allow descendent to calculate space used}
  CalcSpaceUsed;

  {update print position}
  lRect.Left   := PrintPosRect.Left;
  lRect.Top    := PrintPosRect.Top;
  lRect.Right  := PrintPosRect.Right;
  lRect.Bottom := lRect.Top + SpaceUsed;

  PrintPosRect := lRect;

end; {procedure, CalcPrintPosition}

{------------------------------------------------------------------------------}
{ TppCustomComponent.CalcSpaceUsed}

procedure TppCustomComponent.CalcSpaceUsed;
begin

end; {procedure, CalcSpaceUsed}

{------------------------------------------------------------------------------}
{ TppCustomComponent.RestoreFromCache }

procedure TppCustomComponent.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppCustomComponentSaveRec;
begin

  ReadRecordFromCache(aCachePageNo, lRec);

  DrawComponent := lRec.FDrawComponent;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppCustomComponent.SaveToCache }

procedure TppCustomComponent.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppCustomComponentSaveRec;
begin

  lRec.FDrawComponent := DrawComponent;

  WriteRecordToCache(aCachePageNo, lRec);

end; {procedure, SaveToCache}



{------------------------------------------------------------------------------}
{ TppCustomComponent.DefineProperties }

procedure TppCustomComponent.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);

  Filer.DefineProperty('ShiftWithBand', ReadShiftWithBand, nil, False);
  Filer.DefineProperty('StretchWithBand', ReadStretchWithBand, nil, False);

end; {procedure, DefineProperties}

{------------------------------------------------------------------------------}
{ TppCustomComponent.ReadShiftWithBand }

procedure TppCustomComponent.ReadShiftWithBand(Reader: TReader);
begin
  ShiftWithParent := Reader.ReadBoolean;
end; {procedure, ReadShiftWithBand}

{------------------------------------------------------------------------------}
{ TppCustomComponent.ReadStretchWithBand }

procedure TppCustomComponent.ReadStretchWithBand(Reader: TReader);
begin
  StretchWithParent := Reader.ReadBoolean;
end; {procedure, ReadStretchWithBand}



{******************************************************************************
 *
 ** C U S T O M  T E X T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomText.Create }

constructor TppCustomText.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  AutoSize         := True;
  Color            := clWhite;
  DrawCommandClass := TppDrawText;

  FCharWrap      := False;
  FDisplayFormat := '';
  FOnGetText     := nil;
  FSaveLength    := 0;
  FSaveOrder     := -1;

  FBreakFieldForGroups := TList.Create;

  {used for conversion to 3.1}
  FOnSave := '';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomText.Destroy }

destructor TppCustomText.Destroy;
var
  liGroup: Integer;
  lGroup: TppGroup;

begin

  {notify groups that their BreakField is history, if needed}
  for liGroup := (FBreakFieldForGroups.Count-1) downto 0 do
    begin
      lGroup := FBreakFieldForGroups[liGroup];
      lGroup.BreakName := '';
    end;

  FBreakFieldForGroups.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomText.SetCharWrap }

procedure TppCustomText.SetCharWrap(Value: Boolean);
begin

  if Printing then Exit;

  FCharWrap := Value;

  {repaint design control}
  InvalidateDesignControl;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetCharWrap}

{------------------------------------------------------------------------------}
{ TppCustomText.DefineProperties }

procedure TppCustomText.DefineProperties(Filer: TFiler);
begin

  inherited DefineProperties(Filer);

  {used for conversion to 3.1}
  Filer.DefineProperty('OnSave', ReadOnSave, nil, False);

end; {procedure, DefineProperties}

{------------------------------------------------------------------------------}
{ TppCustomText.ReadOnSave }

procedure TppCustomText.ReadOnSave(Reader: TReader);
begin
  FOnSave := Reader.ReadIdent;
end; {procedure, ReadOnSave}

{------------------------------------------------------------------------------}
{ TppCustomText.Convert }

procedure TppCustomText.Convert(aVersionNo: Integer);
begin
  inherited Convert(aVersionNo);

  if (aVersionNo < 3100) and (Band <> nil) and (Band.Report <> nil) and (FOnSave <> '') then
    Band.Report.AssignOnSave(FOnSave);

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TppCustomText.AdjustBounds }

procedure TppCustomText.AdjustBounds;
const
  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
  WordWraps:  array[Boolean] of Word = (0, DT_WORDBREAK);

var
  liLeft: Integer;
  lClientRect: TRect;
  lBitmap: TBitmap;
  liWidthChange: Integer;
  lFlags: Word;
  liSize: Integer;
  lBuffer: PChar;

begin

  if (csReading in ComponentState) then Exit;

  if not Autosize then
    if WordWrap then Exit;

  if Printing then Exit;

  lBitmap := TBitmap.Create;

  lBitmap.Canvas.Font := Font;

  lClientRect := spClientRect;

  {calc draw text}
  lFlags := DT_CALCRECT or DT_EXPANDTABS or Alignments[Alignment] or WordWraps[WordWrap] or DT_NOPREFIX;

  liSize := Length(Caption) + 1;
  GetMem(lBuffer, liSize);
  StrPCopy(lBuffer, Caption);

  DrawText(lBitmap.Canvas.Handle, lBuffer, StrLen(lBuffer), lClientRect, lFlags);

  FreeMem(lBuffer, liSize);
  lBitmap.Free;

  if AutoSize then
    begin

      liWidthChange := spWidth  - lClientRect.Right;

      {calc new left based on alignment }
      case Alignment of
        taLeftJustify:
          liLeft  := spLeft;

        taRightJustify:
          liLeft := spLeft + liWidthChange;

      else {taCenter }
          liLeft  := spLeft + (liWidthChange div 2);

      end; {case, Alignment}

      spSetBounds(liLeft, spTop, lClientRect.Right, lClientRect.Bottom);

    end

  else

    spSetBounds(spLeft, spTop, spWidth, lClientRect.Bottom);



end;

{------------------------------------------------------------------------------}
{ TppCustomText.CanOptimizeDesignPainting}

function TppCustomText.CanOptimizeDesignPainting: Boolean;
begin
  {when transparent and font color is white, cannot optimize design control painting}
  Result := not (Transparent and (Font.Color = clWhite));
end;


{------------------------------------------------------------------------------}
{ TppCustomText.AddBreakFieldForGroup }

procedure TppCustomText.AddBreakFieldForGroup(aGroup: TppGroup);
begin
  FBreakFieldForGroups.Add(aGroup);
end;

{------------------------------------------------------------------------------}
{ TppCustomText.RemoveBreakFieldForGroup }

procedure TppCustomText.RemoveBreakFieldForGroup(aGroup: TppGroup);
begin
  FBreakFieldForGroups.Remove(aGroup);
end;

{------------------------------------------------------------------------------}
{ TppCustomText.GetDescription }

function TppCustomText.GetDescription: String;
begin
  Result := UserName + ': ' + Caption;
end;

{------------------------------------------------------------------------------}
{ TppCustomText.GetText }

function TppCustomText.GetText: String;
var
  lsText: String;
  lParams: TraParamList;

begin

  lsText := GetTheText;

  Result := lsText;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  {allow user to override Text value}
  if Assigned(FOnGetText) then FOnGetText(Self, lsText);

  lParams := TraTppCustomTextRTTI.GetParams('OnGetText');
  lParams.CreateValuePointer(0, lsText);

  SendEventNotify(Self, ciComponentGetText, lParams);

  lParams.Free;

  Result := lsText;

end; {function, GetText}

{------------------------------------------------------------------------------}
{ TppCustomText.GetTheText }

function TppCustomText.GetTheText: String;
begin
  Result := inherited GetText;
end;

{------------------------------------------------------------------------------}
{ TppCustomText.GetTheSaveOrder }

function TppCustomText.GetTheSaveOrder: TTabOrder;
begin
  Result := FSaveOrder;
end;

{------------------------------------------------------------------------------}
{ TppCustomText.GetSaveOrder }

function TppCustomText.GetSaveOrder: TTabOrder;
begin
  if Band <> nil then
    Result := Band.IndexOfSave(Self)
  else
    Result := -1;
end;

{------------------------------------------------------------------------------}
{ TppCustomText.SetSaveLength }

procedure TppCustomText.SetSaveLength(Value: Integer);
begin
  if FSaveLength <> Value then
    begin
      FSaveLength := Value;
      Reset;
    end;
end;

{------------------------------------------------------------------------------}
{ TppCustomText.SetSaveOrder }

procedure TppCustomText.SetSaveOrder(Value: TTabOrder);
begin
  if csReading in ComponentState then
    FSaveOrder := Value
  else
    begin
      UpdateSaveOrder(Value);
      Reset;
    end;
end;

{------------------------------------------------------------------------------}
{ TppCustomText.SetSave }

procedure TppCustomText.SetSave(Value: Boolean);
begin
  if FSave <> Value then
    begin
      FSave := Value;

      if (csReading in ComponentState) then Exit;

      if FSave then
        Band.AddSave(Self)
      else
        Band.RemoveSave(Self);

      if (pppcDesigning in DesignState) then
        PropertyChange;

      Reset;

    end;
end;

{------------------------------------------------------------------------------}
{ TppCustomText.UpdateSaveOrder }

procedure TppCustomText.UpdateSaveOrder(Value: TTabOrder);
var
  liSaveIndex: Integer;
  liSaveCount: Integer;
begin

  {if save is not turned on, we're outta here}
  if not(FSave) then Exit;

  liSaveIndex := GetSaveOrder;
  liSaveCount := Band.SaveCount;

  {doctor value until it is valid}
  if Value < 0 then Value := 0;
  if (liSaveCount > 0) and (Value >= liSaveCount) then Value := liSaveCount - 1;

  if (Value <> liSaveIndex) then
    begin
      {remove from old position}
      if (liSaveIndex >= 0) then
        Band.RemoveSave(Self);

      {insert into new position}
      Band.InsertSave(Value, Self);
    end;

end;


{------------------------------------------------------------------------------}
{ TppCustomText.SetBand }

procedure TppCustomText.SetBand(aBand: TppBand);
begin

  inherited SetBand(aBand);

end; {procedure, SetBand}


{------------------------------------------------------------------------------}
{ TppCustomText.GetDisplayFormat }

function TppCustomText.GetDisplayFormat: String;
begin
  Result := FDisplayFormat;

end; {function, GetDisplayFormat}

{------------------------------------------------------------------------------}
{ TppCustomText.SetDisplayFormat }

procedure TppCustomText.SetDisplayFormat(const aFormat: String);
begin
  if FDisplayFormat <> aFormat then
    begin
      FDisplayFormat := aFormat;
      PropertyChange;
    end;

end; {function, SetDisplayFormat}


{------------------------------------------------------------------------------}
{ TppCustomText.SetName }

procedure TppCustomText.SetName(const Value: TComponentName);
var
  lsOldName: String;
  liGroup: Integer;
  lGroup: TppGroup;

begin

  lsOldName := Name;

  inherited SetName(Value);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if FBreakFieldForGroups.Count > 0 then

    {notify groups that their BreakField's name has changed }
    for liGroup := 0 to (FBreakFieldForGroups.Count-1) do
      begin
        lGroup := FBreakFieldForGroups[liGroup];
        lGroup.BreakComponentNameChanged(lsOldName, Value);
      end;

end;

{------------------------------------------------------------------------------}
{ TppCustomText.SetFont }

procedure TppCustomText.SetFont(Value: TFont);
begin
  inherited SetFont(Value);

  AdjustBounds;

end;

{------------------------------------------------------------------------------}
{ TppCustomText.PropertiesToDrawCommand }

procedure TppCustomText.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lWrappedText: TStrings;
  lTextBuf: PChar;
  lPrinter: TObject;
  lDrawText: TppDrawText;
  llCharPos: Longint;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawText) then Exit;

  lDrawText := TppDrawText(aDrawCommand);

  {create print object}
  lDrawText.Alignment    := Alignment;
  lDrawText.AutoSize     := AutoSize;
  lDrawText.Color        := Color;
  lDrawText.Left         := PrintPosRect.Left;
  lDrawText.Top          := PrintPosRect.Top;
  lDrawText.Height       := PrintPosRect.Bottom - PrintPosRect.Top;
  lDrawText.Width        := PrintPosRect.Right - PrintPosRect.Left;
  lDrawText.Text         := Text;
  lDrawText.Transparent  := Transparent;
  lDrawText.WordWrap     := WordWrap;
  lDrawText.Font         := Font;

  if WordWrap then
    begin
      lWrappedText := TStringList.Create;

      lTextBuf     := GetTextBuf;

      if (Band <> nil) and (Band.Report <> nil) then
        lPrinter := Band.Report.Printer
      else
        lPrinter := nil;

      llCharPos := 0;

      ppWordWrap(lTextBuf, PrintPosRect, Font, 0, True, lWrappedText, nil,
                 Band.Report.Units, False, lPrinter, llCharPos, FCharWrap);

      lDrawText.WrappedText := lWrappedText;

      lWrappedText.Free;
      StrDispose(lTextBuf);
    end;

  {assign print to file properties}
  lDrawText.BandSave        := Band.Save;
  lDrawText.BandSaveNo      := Band.Report.ReportBandCount;
  lDrawText.Component       := Self;
  lDrawText.ComponentSave   := Save;
  lDrawText.ComponentSaveNo := SaveOrder;
  lDrawText.SaveLength      := SaveLength;

end;

{------------------------------------------------------------------------------}
{ TppCustomText.GetTextBuf }

function TppCustomText.GetTextBuf: PChar;
begin
  Result := StrAlloc(Length(Text) + 1);
  StrPCopy(Result, Text);
end;


{------------------------------------------------------------------------------}
{ TppCustomText.CreatePopupMenu }

procedure TppCustomText.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'AutoSize', '',  226); {'AutoSize'}
  aPopupMenu.AddItem(30, 'ReprintOnOverFlow', '',  238);
  aPopupMenu.AddItem(30, 'ShiftWithParent', '',  240);
  aPopupMenu.AddItem(30, 'Transparent', '',  246);
  aPopupMenu.AddItem(30, 'WordWrap', '',  248);

end; {procedure, TppCustomText}


{******************************************************************************
 *
 ** L A B E L
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TppLabel.Create }

constructor TppLabel.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  DefaultPropName     := 'Caption';
  DefaultPropEditType := etAutoEdit;

end; {constructor, Create}



{------------------------------------------------------------------------------}
{ TppLabel.GetDefaultPropHint }

function TppLabel.GetDefaultPropHint: String;
begin

  Result := ppLoadStr(119);

end; {function, GetDefaultPropHint}


{------------------------------------------------------------------------------}
{ TppLabel.SetUserName }

procedure TppLabel.SetUserName(const Value: TComponentName);
var
  lsOldName : String;

begin

  lsOldName := UserName;

  inherited SetUserName(Value);

  {check whether set name was successful (i.e. user name is valid) }
  if (UserName = lsOldName) then Exit;

  if (csReading in ComponentState) or (csLoading in ComponentState) and
      not (pppcPasting in DesignState) then Exit;

  {on name change, also change caption if it is the same as the user name}
  if (Caption = lsOldName) then
    Caption := Value;

end; {procedure, SetUserName}




{******************************************************************************
 *
 ** D B T E X T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDBText.Create }

constructor TppDBText.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  AutoSize := False;
  CacheRecordSize := SizeOf(TppDBTextSaveRec);
  EventNotifies := EventNotifies + [ciGroupBreak];

  FAlreadyPrinted         := False;
  FBlankWhenZero          := False;
  FFieldValue             := '';
  FFirstPage              := -1;
  FJustRestored           := False;
  FPriorValue             := '';
  FPriorValueSame         := False;
  FReprintOnSubsequent    := False;
  FSuppressRepeatedValues := False;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDBText.Destroy }

destructor TppDBText.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDBText.GetFieldValue }

function TppDBText.GetFieldValue: Variant;
begin

  Result := 0;

  if (DataPipeline = nil) then Exit;

  if (DataField = '') then Exit;

  try
    Result := DataPipeline.GetFieldValue(DataField);

  except
    on E:EDataError do
      if Band.Report.Engine.Printing then
        Band.Report.RaiseException(E);

    on E:EConvertError do
      if Band.Report.Engine.Printing then
        Band.Report.RaiseException(E);

  end; {try, except}

end; {function, GetFieldValue}

{------------------------------------------------------------------------------}
{ TppDBText.GetDescription }

function TppDBText.GetDescription: String;
begin
  if (DataField <> '') then
    Result := UserName + ': ' + DataField
  else
    Result := UserName;
end;

{------------------------------------------------------------------------------}
{ TppDBText.PageStart }

procedure TppDBText.PageStart;
begin
  if (FFirstPage <> -1) then
    FAlreadyPrinted := not(FReprintOnSubsequent);
end; {procedure, PageStart}

{------------------------------------------------------------------------------}
{ TppDBText.IsCalc }

function TppDBText.IsCalc: Boolean;
begin
  Result := True;
end; {function, IsCalc}

{------------------------------------------------------------------------------}
{ TppDBText.Init }

procedure TppDBText.Init;
begin
  inherited Init;
  
  FAlreadyPrinted := False;
  FFirstPage := -1;
  FPriorValue := '';
  FPriorValueSame := False;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppDBText.Compute }

procedure TppDBText.Compute;
begin

  UpdateValues;

  if ResetOnCompute then
    ResetOnCompute := False;

end; {procedure, Compute}

{------------------------------------------------------------------------------}
{ TppDBText.UpdateValues }

procedure TppDBText.UpdateValues;
begin

  FFieldValue := Text;

  if ResetOnCompute or (FPriorValue <> FFieldValue) or ((DataPipeline <> nil) and (ppdaFirstRecord in DataPipeline.State)) then
    begin
      FPriorValue := FFieldValue;
      FPriorValueSame := False;
      FFirstPage := Band.Report.AbsolutePage;
    end
  else
    FPriorValueSame := True;

end; {procedure, UpdateValues}

{------------------------------------------------------------------------------}
{ TppDBText.CalcSpaceUsed }

procedure TppDBText.CalcSpaceUsed;
var
  lbPrintIt: Boolean;
  lBand: TppCustomBand;
begin

  lBand := TppCustomBand(Band);

  lbPrintIt := False;

  if not(FPriorValueSame) or ((DataPipeline <> nil) and
                              (ppdaFirstRecord in DataPipeline.State) and not(FAlreadyPrinted)) then

    begin

      FAlreadyPrinted := False;

      lbPrintIt := True;

    end

  else

    begin

      if (FSuppressRepeatedValues) then

        begin
          if (FReprintOnSubsequent) and (FFirstPage < lBand.Report.Engine.AbsolutePageNo) and not(FAlreadyPrinted) then
            lbPrintIt := True;
        end

      else if lBand.OverFlow and not(ReprintOnOverFlow) and not(DrawComponent) then
        lbPrintIt := False

      else if (DrawComponent) then
        lbPrintIt := True;

    end;

  if lbPrintIt then
    FAlreadyPrinted := True
  else
    begin
      SpaceUsed := 0;

      DrawComponent := False;
    end;

  {must update values here, because DBText may print more
  several times before compute is called again}
  UpdateValues;

end; {procedure, CalcSpaceUsed}

{------------------------------------------------------------------------------}
{ TppDBText.Clear }

procedure TppDBText.Clear;
begin
  inherited Clear;
  
  FAlreadyPrinted := False;
  FFirstPage := -1;
  FPriorValue := '';
  FPriorValueSame := False;

end;

{------------------------------------------------------------------------------}
{ TppDBText.RestoreFromCache }

procedure TppDBText.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppDBTextSaveRec;
begin
  ReadRecordFromCache(aCachePageNo, lRec);

  DrawComponent   := lRec.FDrawComponent;
  FFirstPage      := lRec.FFirstPage;
  FPriorValueSame := lRec.FPriorValueSame;
  FAlreadyPrinted := lRec.FAlreadyPrinted;
  ResetOnCompute  := lRec.FResetOnCompute;

  FPriorValue := Text;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppDBText.SaveToCache }

procedure TppDBText.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppDBTextSaveRec;
begin
  lRec.FDrawComponent   := DrawComponent;
  lRec.FPriorValueSame  := FPriorValueSame;
  lRec.FFirstPage       := FFirstPage;
  lRec.FAlreadyPrinted  := FAlreadyPrinted;
  lRec.FResetOnCompute  := ResetOnCompute;

  WriteRecordToCache(aCachePageNo, lRec);
  
end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppDBText.SetDisplayFormat }

procedure TppDBText.SetDisplayFormat(const aFormat: String);
begin
  inherited SetDisplayFormat(aFormat);

  Caption := GetText;
end;

{------------------------------------------------------------------------------}
{ TppDBText.SetUserName }

procedure TppDBText.SetUserName(const Value: TComponentName);
begin
  inherited SetUserName(Value);

  if (csReading in ComponentState) or (csLoading in ComponentState) and
     not (pppcPasting in DesignState) then Exit;

  Caption := GetText;

end; {procedure, SetUserName}


{------------------------------------------------------------------------------}
{ TppDBText.GetTheText }

function TppDBText.GetTheText: String;
var
  lsText: String;
  lDataType: TppDataType;
  lsFormat: String;
  lValue: Variant;
begin

  if CheckForPipelineData then
    begin

      try
        lDataType := DataPipeline.GetFieldDataType(DataField);
      except
        lDataType := dtString;
      end;

      if Assigned(FOnFormat) then
        lsFormat := ''
      else
        lsFormat := DisplayFormat;

      try
       lValue := DataPipeline.GetFieldValue(DataField);

      except on EDataError    do
        lsText := '';
             on EConvertError do
        lsText := '';
             on EVariantError do
        lsText := '';

      end; {try, except }

      if (FBlankWhenZero and (lValue <> Null)) and
         (VarType(lValue) in [varSmallInt..varCurrency, varDate]) and (lValue = 0) then
            lsText := ''
      else if (VarType(lValue) = varString) and (lValue = '') then
        lsText := ''
      else if (VarType(lValue) = varDate) and (VarIsNull(lValue)) then
        lsText := ''
      else
        begin
          lsText := ppFormat(lsFormat, lDataType, lValue);

          if Assigned(FOnFormat) then
            FOnFormat(Self, DisplayFormat, lDataType, lValue, lsText);
        end;

    end {get data }

  else if (Printing) then
    lsText := ''

  else {must be designing}

    begin

      {display db field name}
      if (DataField <> '') then
        begin
          if (DataPipeline <> nil) then
            lsText := DataPipeline.FieldAliasForFieldName(DataField)
          else
            lsText := DataField;
        end

      else {display component name}
        lsText := UserName;

    end;

  Result := lsText;

end; {function, GetTheText}

{------------------------------------------------------------------------------}
{ TppDBText.SetBlankWhenZero }

procedure TppDBText.SetBlankWhenZero(Value: Boolean);
begin
  if  FBlankWhenZero <> Value then
    begin
      FBlankWhenZero := Value;
      PropertyChange;
    end;

end; {procedure, SetBlankWhenZero}

{------------------------------------------------------------------------------}
{ TppDBText.SetReprintOnSubsequent }

procedure TppDBText.SetReprintOnSubsequent(Value: Boolean);
begin
  if  FReprintOnSubsequent <> Value then
    begin
      FReprintOnSubsequent := Value;
      Reset;
      PropertyChange;
    end;

end;

{------------------------------------------------------------------------------}
{ TppDBText.SetSuppressRepeatedValues }

procedure TppDBText.SetSuppressRepeatedValues(Value: Boolean);
begin
  if  FSuppressRepeatedValues <> Value then
    begin
      FSuppressRepeatedValues := Value;
      Reset;
      PropertyChange;
    end;

end;

{------------------------------------------------------------------------------}
{ TppDBText.CreatePopupMenu }

procedure TppDBText.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'BlankWhenZero', '', 227); {'BlankWhenZero'}
  aPopupMenu.AddItem(30, 'DisplayFormat', '', 230);
  aPopupMenu.AddItem(30, 'ReprintOnSubsequent', '', 239);
  aPopupMenu.AddItem(30, 'ResetGroup', '', 1132); {'ResetGroup...'}
  aPopupMenu.AddItem(30, 'SuppressRepeatedValues', '', 245);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppDBText.PopupMenuClick }

procedure TppDBText.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  TppPopupMenu(Sender).ItemByName('DisplayFormat').OnClick := FormatMenuClick;
  TppPopupMenu(Sender).ItemByName('ResetGroup').OnClick := ResetGroupMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppDBText.FormatMenuClick }

procedure TppDBText.FormatMenuClick(Sender: TObject);
var
  lFormatDlg: TppCustomFormatDialog;
  lFormClass: TFormClass;
  lFormats: TStrings;

begin
  if (Band = nil) or (Band.Report = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomFormatDialog);

  lFormatDlg := TppCustomFormatDialog(lFormClass.Create(Application));
  lFormatDlg.LanguageIndex := Band.LanguageIndex;
  lFormatDlg.DisplayFormat := DisplayFormat;
  lFormats := lFormatDlg.DisplayFormats;
  lFormats.Clear;

  {give report designer the opportunity to get display format list}
  SendDesignMessage(PM_GETDISPLAYFORMATS, ppWCustomMsg, Longint(lFormats));

  {get standard display formats}
  if (lFormats.Count = 0) then
    begin
      if (DataPipeline = nil) then
        ppGetDisplayFormats(dtNotknown, lFormats)
      else
        ppGetDisplayFormats(DataPipeline.GetFieldDataType(DataField), lFormats);
    end;


  {set format property}
  if (lFormatDlg.ShowModal = mrOK) then
    DisplayFormat := lFormatDlg.DisplayFormat;

  lFormatDlg.Release;

end; {procedure, FormatMenuClick}

{------------------------------------------------------------------------------}
{ TppDBText.ResetGroupMenuClick }

procedure TppDBText.ResetGroupMenuClick(Sender: TObject);
var
  lDBTextDlg: TppCustomDBTextDialog;
  lFormClass: TFormClass;
  liGroup, liGroups: Integer;
  lDescriptions: TStrings;
  lReport: TppCustomReport;
begin

  if (Band = nil) or (Band.Report = nil) then Exit;

  lReport := Band.Report;

  {create the db calc dialog and initialize}
  lFormClass := ppGetFormClass(TppCustomDBTextDialog);
  lDBTextDlg := TppCustomDBTextDialog(lFormClass.Create(Application));

  lDBTextDlg.LanguageIndex := lReport.LanguageIndex;
  lDBTextDlg.ResetGroupIndex := lReport.FindGroup(ResetGroup);

  {add list of group descriptions }
  lDescriptions := lDBTextDlg.GroupDescriptions;
  liGroups := lReport.GroupCount-1;

  for liGroup := 0 to liGroups do
    lDescriptions.Add(lReport.Groups[liGroup].Description);

  {display the dialog}
  if (lDBTextDlg.ShowModal = mrOK) then
    begin
      if (lDBTextDlg.ResetGroupIndex >= 0) and (lDBTextDlg.ResetGroupIndex < lReport.GroupCount) then
        ResetGroup := lReport.Groups[lDBTextDlg.ResetGroupIndex]
      else
        ResetGroup := nil;
    end;

  lDBTextDlg.Release;

end; {procedure, ResetGroupMenuClick}

{------------------------------------------------------------------------------}
{ TppDBText.IsDataAware }

function TppDBText.IsDataAware: Boolean;
begin
  Result := True;
end;

{------------------------------------------------------------------------------}
{ TppDBText.SetDataField }

procedure TppDBText.SetDataField(const Value: string);
{var
  liCharWidth: Integer;}
 { lsOldName: String;}

begin

  {lsOldName := DataField;}

  inherited SetDataField(Value);

 { if (pppcDesigning in DesignState) and (DesignControl <> nil) and
     not (Printing)  then
    begin

      {default width to field display width}
    {  if not(AutoSize) and CheckForPipelineData then
        try
          liCharWidth := DesignControl.Canvas.TextWidth('0');

          if (lsOldName = '') then
            spWidth := liCharWidth * DataPipeline.GetFieldDisplayWidth(DataField);
        except
        end; {if, set default width}
     
   { end; {if, in designing state}


  {this will set caption}
  Notify(DataPipeline, ppopDataChange);

end; {procedure, SetDataField}

{------------------------------------------------------------------------------}
{ TppDBText.Notify }

procedure TppDBText.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (csDestroying in ComponentState) then Exit;

  if (aCommunicator <> nil) and (aCommunicator.Owner <> nil) and (aCommunicator.Owner is TppDrawVariable) then Exit;

  if (aOperation in [ppopDataChange, ppopRemove]) and (pppcDesigning in DesignState) and not(Printing) then
    Caption := GetText;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDBText.EventNotify }

procedure TppDBText.EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
begin

  inherited EventNotify(aCommunicator, aEventID, aParams);

  if (aCommunicator = ResetGroup) and (aEventID = ciGroupBreak) then
    ResetOnCompute := True;

end; {procedure, EventNotify}

{******************************************************************************
 *
 ** L O O K A H E A D   L I S T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppLookAheadList.CreateList }

constructor TppLookAheadList.CreateList(aOwner: TppCommunicator);
begin

  inherited Create;

  FOwner := aOwner;

end; {constructor, CreateList}

{------------------------------------------------------------------------------}
{ TppLookAheadList.Destroy }

destructor TppLookAheadList.Destroy;
begin

  FreeTotals;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppLookAheadList.FreeTotals }

procedure TppLookAheadList.FreeTotals;
var
  liIndex: Integer;
  lDrawVariable: TppCommunicator;
begin

  for liIndex := 0 to Count - 1 do
    begin
      lDrawVariable := TppCommunicator(Items[0]);

      FOwner.RemoveEventNotify(lDrawVariable);

      lDrawVariable.Free;

      Delete(0);
    end;

end; {procedure, FreeTotals}

{------------------------------------------------------------------------------}
{ TppLookAheadList.Clear }

procedure TppLookAheadList.Clear;
begin

  FreeTotals;

  inherited Clear;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppLookAheadList.UpdateTotal }

procedure TppLookAheadList.UpdateTotal(const aLookAheadKey: String; aTraversalCount: Integer; const aText: String);
var
  lDrawVariable: TppDrawVariable;
begin

  lDrawVariable := FindTotal(aLookAheadKey);

  {if total cannot be found, add new total}
  if (lDrawVariable = nil) then
    AddTotal(aLookAheadKey, aTraversalCount, aText)
  else
    SendCalcNotify(aLookAheadKey, aTraversalCount, aText);

end; {procedure, UpdateTotal}

{------------------------------------------------------------------------------}
{ TppLookAheadList.RetrieveTotal }

function TppLookAheadList.RetrieveTotal(const aLookAheadKey: String; aTraversalCount: Integer; const aText: String): String;
var
  lDrawVariable: TppDrawVariable;
begin

  lDrawVariable := FindTotal(aLookAheadKey);

  if (lDrawVariable <> nil) then
    Result := lDrawVariable.Text
  else
    Result := aText;

end; {function, RetrieveTotal}

{------------------------------------------------------------------------------}
{ TppLookAheadList.SignOffTotals }

procedure TppLookAheadList.SignOffTotals;
var
  liIndex: Integer;
begin

  {most of these have already been disconnected, except the last one}
  for liIndex := 0 to Count - 1 do
    FOwner.RemoveEventNotify(TppDrawVariable(Items[liIndex]).WalkieTalkie);

end; {procedure, SignOffTotals}

{------------------------------------------------------------------------------}
{ TppLookAheadList.AddTotal }

function TppLookAheadList.AddTotal(const aLookAheadKey: String; aTraversalCount: Integer; const aText: String): TppDrawVariable;
var
  lDrawVariable: TppDrawVariable;
begin

  lDrawVariable := TppDrawVariable.Create(FOwner);

  lDrawVariable.Text := aText;
  lDrawVariable.LookAhead := True;
  lDrawVariable.LookAheadKey := aLookAheadKey;
  lDrawVariable.TraversalCount := aTraversalCount;

  {notify draw command when calculation is made}
  FOwner.AddEventNotify(lDrawVariable.WalkieTalkie);

  Result := lDrawVariable;

  Add(Result);
  
end; {procedure, AddTotal}

{------------------------------------------------------------------------------}
{ TppLookAheadList.FindTotal }

function TppLookAheadList.FindTotal(const aLookAheadKey: String): TppDrawVariable;
var
  lDrawVariable: TppDrawVariable;
  liIndex: Integer;
begin

  Result := nil;

  liIndex := 0;

  while (liIndex < Count) and (Result = nil) do
    begin
      lDrawVariable := TppDrawVariable(Items[liIndex]);

      if (lDrawVariable.LookAheadKey = aLookAheadKey) then
        Result := lDrawVariable
      else {if the id nos don't match, we don't need to notify the draw command any longer}
        FOwner.RemoveEventNotify(lDrawVariable.WalkieTalkie);

        Inc(liIndex);
    end;

end; {function, FindTotal}

{------------------------------------------------------------------------------}
{ TppLookAheadList.SendCalcNotify }

procedure TppLookAheadList.SendCalcNotify(const aLookAheadKey: String; aTraversalCount: Integer; const aText: String);
var
  lParams: TraParamList;
  lsLookAheadKey: String;
  liTraversalCount: Integer;
  lsText: String;
begin

  {notify all currently connect draw commands}
  lParams := TraParamList.Create;

  lParams.AddParam('aLookAheadKey', daString, nil, '', False, False);
  lParams.AddParam('aTraversalCount', daInteger, nil, '', False, False);
  lParams.AddParam('aText', daString, nil, '', False, False);

  lsLookAheadKey := aLookAheadKey;
  liTraversalCount := aTraversalCount;
  lsText := aText;

  lParams.CreateValuePointer(0, lsLookAheadKey);
  lParams.CreateValuePointer(1, liTraversalCount);
  lParams.CreateValuePointer(2, lsText);

  FOwner.SendEventNotify(FOwner, ciComponentCalcLookAhead, lParams);

  lParams.Free;
  
end; {procedure, SendCalcNotify}


{******************************************************************************
 *
 ** D B C A L C
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDBCalc.Create }

constructor TppDBCalc.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  CacheRecordSize := SizeOf(TppDBCalcSaveRec);
  DrawCommandClass := TppDrawVariable;

  FDBCalcType := dcSum;
  FDivisor := 0;
  FFirstCount := 0;
  FLookAhead := False;
  FLookAheadList := nil;
  FOnCalc := nil;
  FOnGroupBreak := nil;
  FValue := 0;

end; {procedure, Create}

{------------------------------------------------------------------------------}
{ TppDBCalc.Destroy }

destructor TppDBCalc.Destroy;
begin

  FLookAheadList.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDBCalc.Init }

procedure TppDBCalc.Init;
begin

  inherited Init;

  {new for 4.06, fixes min and max dbcalcs}
  ResetOnCompute := True;

  FDivisor := 0;
  FFirstCount := 0;
  FValue := 0;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppDBCalc.SetValue }

procedure TppDBCalc.SetValue(aValue: Variant);
begin

  FValue := Double(aValue);

end; {procedure, SetValue}

{------------------------------------------------------------------------------}
{ TppDBCalc.GetValue }

function TppDBCalc.GetValue: Variant;
begin

  Result := FValue;

end; {function, GetValue}

{------------------------------------------------------------------------------}
{ TppDBCalc.GetDescription }

function TppDBCalc.GetDescription: String;
var
  lsCaption: String;
begin
  {format design time caption}
  case FDBCalcType of

    dcCount  : lsCaption := ppLoadStr(1028) + '('; {'Count'}
    dcSum    : lsCaption := ppLoadStr(1029) + '('; {'Sum'}
    dcMinimum: lsCaption := ppLoadStr(1030) + '('; {'Minimum'}
    dcMaximum: lsCaption := ppLoadStr(1031) + '('; {'Maximum'}
    dcAverage: lsCaption := ppLoadStr(1032) + '('; {'Average'}

  end; {case, DBCalcType}

  if (DataField <> '') then
    Result := UserName + ': ' + lsCaption + DataField + ')'
  else
    if (FDBCalcType = dcCount) then
      Result := UserName + ': ' + lsCaption + '*)'
    else
      Result := UserName + ': ' + lsCaption + '?)';

end; {procedure, GetDescription}

{------------------------------------------------------------------------------}
{ TppDBCalc.GetTheText }

function TppDBCalc.GetTheText: String;
var
  ldValue: Double;
  lsText: String;
  lDataType: TppDataType;
begin

  if (pppcDesigning in DesignState) and not(Printing) then

    begin

      {format design time caption}
      case FDBCalcType of

        dcCount  : lsText := ppLoadStr(1028) + '('; {'Count'}
        dcSum    : lsText := ppLoadStr(1029) + '('; {'Sum'}
        dcMinimum: lsText := ppLoadStr(1030) + '('; {'Minimum'}
        dcMaximum: lsText := ppLoadStr(1031) + '('; {'Maximum'}
        dcAverage: lsText := ppLoadStr(1032) + '('; {'Average'}

      end; {case, DBCalcType}

      {display db field name}
      if (DataField <> '') then
        begin
          if (DataPipeline <> nil) then
            lsText := lsText + DataPipeline.FieldAliasForFieldName(DataField) + ')'
          else
            lsText := lsText + DataField + ')';
        end
      else
        if (FDBCalcType = dcCount) then
          lsText := lsText + '*)'
        else
          lsText := lsText + '?)';

    end

  else

    begin
      ldValue := FValue;

      if FDBCalcType = dcAverage then
        begin
          if FDivisor = 0 then
            ldValue := 0
          else
            ldValue := ldValue / FDivisor;
        end;

      if (FBlankWhenZero) and (ldValue = 0) then
        lsText := ''

      else
        begin
          if (DataPipeline <> nil) and (DataPipeline.GetFieldDataType(DataField) in [dtDate, dtTime, dtDateTime]) then
            lDataType := dtDateTime
          else
            lDataType := dtDouble;

          lsText := ppFormat(DisplayFormat, lDataType, ldValue);

          if Assigned(FOnFormat) then
            FOnFormat(Self, DisplayFormat, lDataType, ldValue, lsText);
        end;

    end;

  Result := lsText;

end; {function, GetTheText}

{------------------------------------------------------------------------------}
{ TppDBCalc.SetDBCalcType }

procedure TppDBCalc.SetDBCalcType(aDBCalcType: TppDBCalcType);
begin

  FDBCalcType := aDBCalcType;

  {call data change to set caption}
  if (pppcDesigning in DesignState) and not (Printing) then
    begin
      Notify(DataPipeline, ppopDataChange);
      PropertyChange;
    end;

  Reset;

end; {procedure, SetDBCalcType}

{------------------------------------------------------------------------------}
{ TppDBCalc.RestoreFromCache }

procedure TppDBCalc.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppDBCalcSaveRec;
begin

  ReadRecordFromCache(aCachePageNo, lRec);

  AlreadyPrinted  := lRec.FAlreadyPrinted;
  DrawComponent   := lRec.FDrawComponent;
  FirstPage       := lRec.FFirstPage;
  PriorValueSame  := lRec.FPriorValueSame;
  ResetOnCompute  := lRec.FResetOnCompute;

  FValue          := lRec.FValue;
  FDivisor        := lRec.FDivisor;
  FFirstCount     := lRec.FFirstCount;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppDBCalc.SaveToCache }

procedure TppDBCalc.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppDBCalcSaveRec;
begin

  lRec.FAlreadyPrinted  := AlreadyPrinted;
  lRec.FFirstPage       := FirstPage;
  lRec.FPriorValueSame  := PriorValueSame;
  lRec.FResetOnCompute  := ResetOnCompute;
  lRec.FDrawComponent   := DrawComponent;

  lRec.FValue           := FValue;
  lRec.FDivisor         := FDivisor;
  lRec.FFirstCount      := FFirstCount;

  WriteRecordToCache(aCachePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppDBCalc.IsGroupBased }

function TppDBCalc.IsGroupBased: Boolean;
begin
  Result := True;
end; {function, IsGroupBased}

{------------------------------------------------------------------------------}
{ TppDBCalc.Clear }

procedure TppDBCalc.Clear;
begin
  inherited Clear;

  {reset values}
  FValue := 0;
  FDivisor := 0;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppDBCalc.Compute }

procedure TppDBCalc.Compute;
var
  lValue: Variant;
  ldValue: Double;
  lbSetMinMax: Boolean;
begin

  {if no field assigned, no calc can be performed}
  {if ((DataPipeline <> nil) and (ppdaNoRecords in DataPipeline.State)) then
    begin
      FValue := 0;
      FDivisor  := 0;

      Exit;
    end;}

  lbSetMinMax := ResetOnCompute;

  {if group is breaking, reset values}
  if ResetOnCompute then
    begin

      if (DataPipeline <> nil) then
        FFirstCount := DataPipeline.TraversalCount
      else
        FFirstCount := 0;

      Clear;

      if Assigned(FOnGroupBreak) then FOnGroupBreak(Self);
    end;


  if (DataPipeline <> nil) and (DataField <> '') then
    lValue := GetFieldValue
  else
    lValue := 0;

  if (VarIsNull(lValue)) then
    ldValue := 0

  else if (VarType(lValue) in [varSmallInt..varCurrency]) then
    ldValue := lValue

  else if (VarType(lValue) = varDate) then
    ldValue := VarAsType(lValue, varDouble)

  else
    ldValue := 0;

  {if calc is not based on same pipeline as reset group, don't base calc on DataPipeline.TraversalCount}
  if (DataPipeline = nil) or
     ((DataPipeline <> nil) and (ResetGroup <> nil) and (DataPipeline <> ResetGroup.DataPipeline)) then
    FDivisor := FDivisor + FFirstCount + 1
  else
    FDivisor := (DataPipeline.TraversalCount - FFirstCount) + 1;


  case FDBCalcType of
    dcCount:
      FValue := FDivisor;

    dcSum, dcAverage:
      FValue := FValue + ldValue;

    dcMinimum:
      begin
        if (lbSetMinMax) then
          FValue := ldValue
        else
          begin
            if ldValue < FValue then
              FValue := ldValue;
          end;
      end;

    dcMaximum:
      begin
        if (lbSetMinMax) then
          FValue := ldValue
        else
          begin
            if ldValue > FValue then
              FValue := ldValue;
          end;
      end;

  end; {case, calc type}

  {call inherited here, otherwise resetoncompute is reset too early}
  inherited Compute;

  if Assigned(FOnCalc) then FOnCalc(Self);

  {update lookahead totals}
  if (FLookAheadList <> nil) and (GetMainReport.FirstPass) then
    FLookAheadList.UpdateTotal(GetLookAheadKey, GetTraversalCount, Text);

end; {procedure, Compute}

{------------------------------------------------------------------------------}
{ TppDBCalc.SetLookAhead }

procedure TppDBCalc.SetLookAhead(aValue: Boolean);
var
  lMainReport: TppCustomReport;
begin

  if Printing then Exit;
  
  FLookAhead := aValue;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (FLookAhead) then
    begin
      lMainReport := GetMainReport;

      if (lMainReport <> nil) then
        lMainReport.PassSetting := psTwoPass;
    end;

  PropertyChange;

  Reset;

end; {procedure, SetLookAhead}

{------------------------------------------------------------------------------}
{ TppDBCalc.CanCalcLookAheads }

function TppDBCalc.CanCalcLookAheads: Boolean;
var
  lMainReport: TppCustomReport;
begin

  lMainReport := GetMainReport;

  Result := (lMainReport <> nil) and (lMainReport.PassSetting = psTwoPass) and FLookAhead;

end; {procedure, CanCalcLookAheads}

{------------------------------------------------------------------------------}
{ TppDBCalc.StartOfMainReport }

procedure TppDBCalc.StartOfMainReport;
begin
  InitLookAhead;
end; {procedure, StartOfMainReport}

{------------------------------------------------------------------------------}
{ TppDBCalc.EndOfMainReport }

procedure TppDBCalc.EndOfMainReport;
begin
  FLookAheadList.SignOffTotals;
end; {procedure, EndOfMainReport}

{------------------------------------------------------------------------------}
{ TppDBCalc.InitLookAhead }

procedure TppDBCalc.InitLookAhead;
begin

  if (FLookAheadList <> nil) then
    begin
      FLookAheadList.Free;

      FLookAheadList := nil;
    end;

  if not(CanCalcLookAheads) then Exit;

  FLookAheadList := TppLookAheadList.CreateList(Self);

end; {procedure, InitLookAhead}

{------------------------------------------------------------------------------}
{ TppDBCalc.GetTraversalCount }

function TppDBCalc.GetTraversalCount: Integer;
begin

  if (ResetGroup <> nil) and (ResetGroup.DataPipeline <> nil) then
    Result := ResetGroup.DataPipeline.TraversalCount

  else if (Band is TppDetailBand) and (TppDetailBand(Band).DataPipeline <> nil) then
    Result := TppDetailBand(Band).DataPipeline.TraversalCount

  else if (Band.Report.DataPipeline <> nil) then
    Result := Band.Report.DataPipeline.TraversalCount

  else
    Result := 0;

end; {function, GetTraversalCount}

{------------------------------------------------------------------------------}
{ TppDBCalc.GetReportKey }

function TppDBCalc.GetReportKey: String;
var
  lsKey: String;
begin

  if (CanCalcLookAheads) and (Band.Report <> Band.Report.MainReport) then
    begin
      lsKey := '';

      Band.Report.GetReportKey(lsKey);

      Result := lsKey;
    end
  else
    Result := '';

end; {procedure, GetReportKey}

{------------------------------------------------------------------------------}
{ TppDBCalc.GetLookAheadKey }

function TppDBCalc.GetLookAheadKey: String;
begin
  Result := GetReportKey + Format('%8d', [GetIDNo1]) + '|' + Format('%8d', [GetIDNo2]);
end; {function, GetLookAheadKey}

{------------------------------------------------------------------------------}
{ TppDBCalc.GetIDNo1 }

function TppDBCalc.GetIDNo1: Integer;
begin

  if (ResetGroup is TppGroup) then
    Result := TppGroup(ResetGroup).BreakNo

  else if (BandType in [btHeader, btFooter, btColumnHeader, btColumnFooter]) then
    Result := Band.Report.AbsolutePageNo

  else
    Result := 0;

end; {function, GetIDNo1}

{------------------------------------------------------------------------------}
{ TppDBCalc.GetIDNo2 }

function TppDBCalc.GetIDNo2: Integer;
begin

  if (ResetGroup is TppGroup) then
    Result := 0

  else if (BandType in [btColumnHeader, btColumnFooter]) then
    Result := Band.Report.CurrentColumn

  else
    Result := 0;

end; {function, GetIDNo2}

{------------------------------------------------------------------------------}
{ TppDBCalc.PropertiesToDrawCommand }

procedure TppDBCalc.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawVariable: TppDrawVariable;
  lsLookAheadKey: String;
  lMainReport: TppCustomReport;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  lDrawVariable := TppDrawVariable(aDrawCommand);

  if (FLookAheadList <> nil) then
    begin
      lsLookAheadKey := GetLookAheadKey;

      lDrawVariable.Text := FLookAheadList.RetrieveTotal(lsLookAheadKey, GetTraversalCount, lDrawVariable.Text);

      {make draw command update on-the-fly}
      lMainReport := GetMainReport;

      if (lMainReport <> nil) and (lMainReport.FirstPass) then
        begin
          lDrawVariable.LookAhead := True;
          lDrawVariable.LookAheadKey := lsLookAheadKey;

          AddEventNotify(lDrawVariable.WalkieTalkie);
        end;
    end;

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppDBCalc.LookAheadMenuClick }

procedure TppDBCalc.LookAheadMenuClick(Sender: TObject);
begin
  LookAhead := not(FLookAhead);
end; {procedure, LookAheadMenuClick}

{------------------------------------------------------------------------------}
{ TppDBCalc.SetBand }

procedure TppDBCalc.SetBand(aBand: TppBand);
begin


  inherited SetBand(aBand);


  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;


  if (pppcDesigning in DesignState) then
    begin

      {set group,  if no group currenly assigned and the band being assigned is a group band}
      if ( (Band <> nil) and (Band is TppGroupBand) ) then
        ResetGroup := (Band as TppGroupBand).Group
      else
        ResetGroup := nil;

    end;

end; {procedure, SetBand}

{------------------------------------------------------------------------------}
{ TppDBCalc.CreatePopupMenu }

procedure TppDBCalc.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  aPopupMenu.AddItem(30, 'Calculations', '', 228); {'Calculations...'}
  aPopupMenu.AddItem(30, 'LookAhead', '', 1131); {'LookAhead'}

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppDBCalc.PopupMenuClick }

procedure TppDBCalc.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  TppPopupMenu(Sender).ItemByName('Calculations').OnClick := CalculationsMenuClick;


end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppDBCalc.CalculationsMenuClick }

procedure TppDBCalc.CalculationsMenuClick(Sender: TObject);
var
  lDBCalcDlg: TppCustomDBCalcDialog;
  lFormClass: TFormClass;
  liGroup, liGroups: Integer;
  lDescriptions: TStrings;
  lReport: TppCustomReport;

begin
  if (Band = nil) or (Band.Report = nil) then Exit;

  lReport := Band.Report;

  {create the db calc dialog and initialize}
  lFormClass := ppGetFormClass(TppCustomDBCalcDialog);
  lDBCalcDlg := TppCustomDBCalcDialog(lFormClass.Create(Application));

  lDBCalcDlg.LanguageIndex   := lReport.LanguageIndex;
  lDBCalcDlg.ResetGroupIndex := lReport.FindGroup(ResetGroup);
  lDBCalcDlg.DBCalcType      := Ord(DBCalcType);

  {add list of group descriptions }
  lDescriptions := lDBCalcDlg.GroupDescriptions;
  liGroups := lReport.GroupCount-1;

  for liGroup := 0 to liGroups do
    lDescriptions.Add(lReport.Groups[liGroup].Description);

  {display the db calc dialog}
  if (lDBCalcDlg.ShowModal = mrOK) then
    begin
      if (lDBCalcDlg.ResetGroupIndex >= 0) and (lDBCalcDlg.ResetGroupIndex < lReport.GroupCount) then
        ResetGroup := lReport.Groups[lDBCalcDlg.ResetGroupIndex]
      else
        ResetGroup := nil;
      DBCalcType := TppDBCalcType(lDBCalcDlg.DBCalcType);

    end;

  lDBCalcDlg.Release;

end; {procedure, CalculationsMenuClick}


{******************************************************************************
 *
 ** C U S T O M   G R A P H I C
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomGraphic.Create }

constructor TppCustomGraphic.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  spWidth   := 50;
  spHeight  := 50;

  FBrush := TBrush.Create;
  FPen   := TPen.Create;

  {if pen or brush changed - notify design control}
  FPen.OnChange   := StyleChanged;
  FBrush.OnChange := StyleChanged;
end;

{------------------------------------------------------------------------------}
{ TppCustomGraphic.Destroy }

destructor TppCustomGraphic.Destroy;
begin
  FBrush.Free;
  FPen.Free;

  inherited Destroy;
end;

{------------------------------------------------------------------------------}
{ TppCustomGraphic.SetPen }

procedure TppCustomGraphic.SetPen(aPen: TPen);
begin
  FPen.Assign(aPen);
  StyleChanged(Self);
end;

{------------------------------------------------------------------------------}
{ TppCustomGraphic.SetBrush }

procedure TppCustomGraphic.SetBrush(aBrush: TBrush);
begin
  FBrush.Assign(aBrush);
  StyleChanged(Self);
end;

{------------------------------------------------------------------------------}
{ TppCustomGraphic.GetBackGroundColor }

procedure TppCustomGraphic.GetBackGroundColor(var aColor: TColor; var aIsClear: Boolean);
begin

  aColor   := FBrush.Color;
  aIsClear := (FBrush.Style = bsClear);

end;

{------------------------------------------------------------------------------}
{ TppCustomGraphic.GetForeGroundColor }

procedure TppCustomGraphic.GetForeGroundColor(var aColor: TColor; var aIsClear: Boolean);
begin

  aColor   := FPen.Color;
  aIsClear := (FPen.Style = psClear);

end;

{------------------------------------------------------------------------------}
{ TppCustomGraphic.SetBackgroundColor }

procedure TppCustomGraphic.SetBackgroundColor(aColor: TColor; aIsClear: Boolean);
begin
  if aIsClear then
    FBrush.Style := bsClear
  else
    begin
      FBrush.Color := aColor;
      if FBrush.Style = bsClear then
        FBrush.Style := bsSolid;
    end;

end;

{------------------------------------------------------------------------------}
{ TppCustomGraphic.SetForegroundColor }

procedure TppCustomGraphic.SetForegroundColor(aColor: TColor; aIsClear: Boolean);
begin

  if aIsClear then
    FPen.Style := psClear
  else
    begin
      FPen.Color := aColor;
      if FPen.Style = psClear then
        FPen.Style := psSolid;
    end;

end;

{------------------------------------------------------------------------------}
{ TppCustomGraphic.SetPenWidth }

procedure TppCustomGraphic.SetPenWidth(aWidth: Integer);
begin
  FPen.Width := aWidth;
end;

{------------------------------------------------------------------------------}
{ TppCustomGraphic.StyleChanged }

procedure TppCustomGraphic.StyleChanged(Sender: TObject);
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  InvalidateDesignControl;
  
  PropertyChange;

end;

{------------------------------------------------------------------------------}
{ TppCustomGraphic.HasFont }

function TppCustomGraphic.HasFont: Boolean;
begin
  Result := False;
end;


{******************************************************************************
 *
 ** S H A P E
 *
{******************************************************************************}
{------------------------------------------------------------------------------}
{ TppShape.Create }

constructor TppShape.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  DrawCommandClass := TppDrawShape;

  FShapeType := stRectangle;

  DefaultPropName     := 'Shape';
  DefaultPropEditType := etValueList;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppShape.SetShape}

procedure TppShape.SetShape(aShapeType: TShapeType);
begin
  FShapeType := aShapeType;

  StyleChanged(Self);

end; {procedure, SetShape}

{------------------------------------------------------------------------------}
{ TppShape.CalcDimensions }

procedure TppShape.CalcDimensions(var aLeft, aTop, aRight, aBottom, aXCornerRound, aYCornerRound: Longint);
var
  liWidth: Integer;
  liHeight: Integer;
  liSide: Integer;
begin

  aLeft   := FPen.Width div 2;
  aTop    := aLeft;

  if Printing then
    begin
      liWidth  := ppToScreenPixels(PrintPosRect.Right - PrintPosRect.Left, utMMThousandths, pprtHorizontal, nil);
      liHeight := ppToScreenPixels(PrintPosRect.Bottom - PrintPosRect.Top, utMMThousandths, pprtVertical, nil);
    end

  else
    begin
      liWidth  := spWidth;
      liHeight := spHeight;
    end;

  aRight  := (aLeft + liWidth)  - ((FPen.Width div 2) * 2);
  aBottom := (aTop  + liHeight) - ((FPen.Width div 2) * 2);

  {determine length of the shortest side, use for circles, squares and corner rounding}
  if (liWidth < liHeight) then
    liSide := liWidth
  else
    liSide := liHeight;

  {if shape is square or circle, make 'sides' of shape equal}
  if FShapeType in [stSquare, stRoundSquare, stCircle] then
    begin
      {recalc top & left drawing positions based on centered side}
      Inc(aLeft, (liWidth  - liSide) div 2);
      Inc(aTop,  (liHeight - liSide) div 2);

      {set width and height to side}
      Dec(aRight, (liWidth  - liSide) div 2);
      Dec(aBottom,  (liHeight - liSide) div 2);
    end; {if shape has equal 'sides'}

  aXCornerRound := liSide div 4;
  aYCornerRound := liSide div 4;

end; {procedrue, CalcDimensions}


{------------------------------------------------------------------------------}
{ TppShape.GetDefaultPropHint }

function TppShape.GetDefaultPropHint: String;
begin
  Result := ppLoadStr(118);
end; {function, GetDefaultPropHint}

{------------------------------------------------------------------------------}
{ TppShape.PaintDesignControl }

procedure TppShape.PaintDesignControl(aCanvas: TCanvas);
var
  lClientRect: TRect;
  llXCornerRound: Longint;
  llYCornerRound: Longint;
  llLeft: Longint;
  llTop: Longint;
  llRight: Longint;
  llBottom: Longint;

begin

  lClientRect := spClientRect;

  {assign pen and brush}
  aCanvas.Pen   := FPen;
  aCanvas.Brush := FBrush;

  CalcDimensions(llLeft, llTop, llRight, llBottom, llXCornerRound, llYCornerRound);

  {draw shape}
  case FShapeType of

    stRectangle, stSquare:
      aCanvas.Rectangle(llLeft, llTop, llRight, llBottom);

    stCircle, stEllipse:
      aCanvas.Ellipse(llLeft, llTop, llRight, llBottom);

    stRoundRect, stRoundSquare:
      aCanvas.RoundRect(llLeft, llTop, llRight, llBottom, llXCornerRound, llYCornerRound);

  end; {case, ShapeType}


end; {procedure, PaintDesignControl}

{------------------------------------------------------------------------------}
{ TppShape.PropertiesToDrawCommand }

procedure TppShape.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawCommand: TppDrawShape;
  llXCornerRound: Longint;
  llYCornerRound: Longint;
  llLeft: Longint;
  llTop: Longint;
  llRight: Longint;
  llBottom: Longint;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawShape) then Exit;

  CalcDimensions(llLeft, llTop, llRight, llBottom, llXCornerRound, llYCornerRound);

  llLeft := PrintPosRect.Left + ppToMMThousandths(llLeft, utScreenPixels, pprtVertical, nil);
  llTop := PrintPosRect.Top + ppToMMThousandths(llTop, utScreenPixels, pprtVertical, nil);
  llRight := PrintPosRect.Left + ppToMMThousandths(llRight, utScreenPixels, pprtVertical, nil);
  llBottom := PrintPosRect.Top + ppToMMThousandths(llBottom, utScreenPixels, pprtVertical, nil);
  llXCornerRound := ppToMMThousandths(llXCornerRound, utScreenPixels, pprtVertical, nil);
  llYCornerRound := ppToMMThousandths(llYCornerRound, utScreenPixels, pprtVertical, nil);

  lDrawCommand := TppDrawShape(aDrawCommand);

  {transfer properties to draw command}
  lDrawCommand.Brush        := FBrush;
  lDrawCommand.Pen          := FPen;
  lDrawCommand.Left         := llLeft;
  lDrawCommand.Top          := llTop;
  lDrawCommand.Height       := llBottom - llTop;
  lDrawCommand.Width        := llRight - llLeft;
  lDrawCommand.ShapeType    := FShapeType;
  lDrawCommand.XCornerRound := llXCornerRound;
  lDrawCommand.YCornerRound := llYCornerRound;

  {set draw command type}
  if (FShapeType = stSquare) then
    lDrawCommand.ShapeType := stRectangle

  else if (FShapeType = stCircle) then
    lDrawCommand.ShapeType := stEllipse

  else if (FShapeType = stRoundSquare) then
    lDrawCommand.ShapeType := stRoundRect;

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppShape.CreatePopupMenu }

procedure TppShape.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  aPopupMenu.AddItem(30, 'ParentHeight', '', 370);
  aPopupMenu.AddItem(30, 'ParentWidth', '', 371);
  aPopupMenu.AddItem(30, 'ReprintOnOverFlow', '', 238);
  aPopupMenu.AddItem(30, 'ShiftWithParent', '', 240);
  aPopupMenu.AddItem(30, 'StretchWithParent', '', 244);

end; {procedure, CreatePopupMenu}


{------------------------------------------------------------------------------}
{ TppShape.GetDefaultPropEnumNames }

procedure TppShape.GetDefaultPropEnumNames(aList: TStrings);
begin

  aList.Clear;

  aList.Add(ppLoadStr(318));
  aList.Add(ppLoadStr(319));
  aList.Add(ppLoadStr(320));
  aList.Add(ppLoadStr(321));
  aList.Add(ppLoadStr(322));
  aList.Add(ppLoadStr(323));

end; {procedure, GetDefaultPropEnumNames}



{------------------------------------------------------------------------------}
{ TppShape.StyleChanged }

procedure TppShape.StyleChanged(Sender: TObject);
begin

  inherited StyleChanged(Sender);

 {set transparent based upon the value of brush style}
  if (Transparent <> (FBrush.Style = bsClear)) then
    Transparent := (FBrush.Style = bsClear);

end; {procedure, StyleChanged}



{******************************************************************************
 *
 ** L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppLine.Create }

constructor TppLine.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FOldPenWidth := 0;
  FPosition := lpTop;
  FSettingWeight := False;
  FStyle := lsSingle;
  FWeight := 0.75;

  DrawCommandClass := TppDrawLine;
  spWidth     := 50;
  spHeight    := 15;
  Transparent := True;

  DefaultPropName     := 'Position';
  DefaultPropEditType := etValueList;


end; {constructor TppLine}

{------------------------------------------------------------------------------}
{ TppLine.Convert }

procedure TppLine.Convert(aVersionNo: Integer);
begin
  inherited Convert(aVersionNo);

  if (aVersionNo < 3000) then
    FWeight := ((Pen.Width / Screen.PixelsPerInch) * 72);

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TppLine.GetDefaultPropHint }

function TppLine.GetDefaultPropHint: String;
begin
  Result := ppLoadStr(117);
end; {function, GetDefaultPropHint}

{------------------------------------------------------------------------------}
{ TppLine.HasColor }

function  TppLine.HasColor: Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppLine.CanOptimizeDesignPainting}

function TppLine.CanOptimizeDesignPainting: Boolean;
begin
  {when pen color is white, cannot optimize design control painting}
  Result := not (FPen.Color = clWhite);
end; {function, CanOptimizeDesignPainting}

{------------------------------------------------------------------------------}
{ TppLine.PaintDesignControl }

procedure TppLine.PaintDesignControl(aCanvas: TCanvas);
var
  liLine: Integer;
  liLines: Integer;
  liOffset: Integer;
  liSize: Integer;
  liPosition: Integer;
  liPenWidth: Integer;
  liWidth: Integer;
  liHeight: Integer;
begin

  liPenWidth := Round(FWeight * Screen.PixelsPerInch / 72);
  
  {get pen width}
  if (liPenWidth = 0) then
    liSize := 1
  else
    liSize := liPenWidth;

  liHeight := spHeight;
  liWidth  := spWidth;

  {when draiwing bottom line, decrease the height by one pixel, otherwise
   the line is drawn outside the bounds of the control}
  if FPosition = lpBottom then
    Dec(liHeight);

  {when draiwing right line, decrease the width by one pixel, otherwise
  the line is drawn outside the bounds of the control}
  if FPosition = lpRight then
    Dec(liWidth);

  {how many lines to draw?}
  if FStyle = lsSingle then
    liLines := 1
  else
    liLines := 2;

  {setting brush to cross causes LineTo to honor the penstyle}
  aCanvas.Brush.Style := bsCross;

  {set pen width to 1 for drawing - need to honor the penstyle}
  aCanvas.Pen := FPen;
  aCanvas.Pen.Width := 1;

  for liLine := 1 to liLines do

    begin

      if (liLine = 1) then
        liOffset := 0
      else
        liOffset := liSize * 2;

      for liPosition := 0 to liSize - 1 do

      {set print object moveto/lineto positions}
      case FPosition of
        lpTop:
          begin
            aCanvas.MoveTo(0, 0 + liOffset + liPosition);
            aCanvas.LineTo(liWidth, 0 + liOffset + liPosition);
          end;

        lpBottom:
          begin
            aCanvas.MoveTo(0, liHeight - liOffset - liPosition);
            aCanvas.LineTo(liWidth, liHeight - liOffset - liPosition);
          end;

        lpLeft:
          begin
            aCanvas.MoveTo(0 + liOffset + liPosition, 0);
            aCanvas.LineTo(0 + liOffset + liPosition, liHeight);
          end;

        lpRight:
          begin
            aCanvas.MoveTo(liWidth - liOffset - liPosition, 0);
            aCanvas.LineTo(liWidth - liOffset - liPosition, liHeight);
          end;

      end; {case, line style}

   end; {for, each line}

end;  {procedure, PaintDesignControl}

{------------------------------------------------------------------------------}
{ TppLine.SetStyle }

procedure TppLine.SetStyle(aLineStyle: TppLineStyleType);
begin
  FStyle := aLineStyle;
  StyleChanged(Self);
end;

{------------------------------------------------------------------------------}
{ TppLine.SetPosition }

procedure TppLine.SetPosition(aLinePosition: TppLinePositionType);
begin
  FPosition := aLinePosition;
  StyleChanged(Self);
end;

{------------------------------------------------------------------------------}
{ TppLine.StyleChanged }

procedure TppLine.StyleChanged(Sender: TObject);
begin

  inherited StyleChanged(Sender);

  if (FSettingWeight) then Exit;

  if (FOldPenWidth <> Pen.Width) then
    begin
      FOldPenWidth := Pen.Width;

      FWeight := ((Pen.Width / Screen.PixelsPerInch) * 72);
    end;

end;

{------------------------------------------------------------------------------}
{ TppLine.SetWeight }

procedure TppLine.SetWeight(aWeight: Single);
begin

  FSettingWeight := True;

  FWeight := aWeight;

  Pen.Width := Round(aWeight * Screen.PixelsPerInch / 72);

  FOldPenWidth := Pen.Width;

  FSettingWeight := False;

end; {procedure, SetWeight}


{------------------------------------------------------------------------------}
{ TppLine.PropertiesToDrawCommand }

procedure TppLine.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawCommand: TppDrawLine;
  llWidth: Longint;
  llHeight: Longint;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawLine) then Exit;

  lDrawCommand := TppDrawLine(aDrawCommand);

  llWidth := (PrintPosRect.Right - PrintPosRect.Left);
  llHeight := (PrintPosRect.Bottom - PrintPosRect.Top);

  {transfer properties to draw command}
  lDrawCommand.LineStyle    := FStyle;
  lDrawCommand.LinePosition := FPosition;
  lDrawCommand.Left         := PrintPosRect.Left;
  lDrawCommand.Top          := PrintPosRect.Top;
  lDrawCommand.Height       := llHeight;
  lDrawCommand.Width        := llWidth;
  lDrawCommand.Pen          := FPen;
  lDrawCommand.Weight       := FWeight;

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppLine.CreatePopupMenu }

procedure TppLine.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  aPopupMenu.AddItem(25, 'StyleSingle', '', 241);
  aPopupMenu.AddItem(25, 'StyleDouble', '', 231);
  aPopupMenu.AddItem(26, 'StyleLine1', '-',  0);

  aPopupMenu.AddItem(30, 'ParentHeight', '', 370);
  aPopupMenu.AddItem(30, 'ParentWidth', '', 371);
  aPopupMenu.AddItem(30, 'ReprintOnOverFlow', '', 238);
  aPopupMenu.AddItem(30, 'ShiftWithParent', '', 240);
  aPopupMenu.AddItem(30, 'StretchWithParent', '', 244);

end; {procedure, CreatePopupMenu}


{------------------------------------------------------------------------------}
{ TppLine.PopupMenuClick }

procedure TppLine.PopupMenuClick(Sender: TObject);
var
  lPopupMenu: TppPopupMenu;

begin

  inherited PopupMenuClick(Sender);

  lPopupMenu := TppPopupMenu(Sender);

  lPopupMenu.ItemByName('StyleSingle').Checked := (Style = lsSingle);
  lPopupMenu.ItemByName('StyleDouble').Checked := (Style = lsDouble);

  lPopupMenu.ItemByName('StyleSingle').OnClick := SingleMenuClick;
  lPopupMenu.ItemByName('StyleDouble').OnClick := DoubleMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppLine.SingleMenuClick }

procedure TppLine.SingleMenuClick(Sender: TObject);
begin
  Style := lsSingle;

end; {procedure, SingleMenuClick}

{------------------------------------------------------------------------------}
{ TppLine.DoubleMenuClick }

procedure TppLine.DoubleMenuClick(Sender: TObject);
begin
  Style := lsDouble;

end; {procedure, DoubleMenuClick}

{------------------------------------------------------------------------------}
{ TppLine.GetDefaultPropEnumNames }

procedure TppLine.GetDefaultPropEnumNames(aList: TStrings);
begin

  aList.Clear;
  
  aList.Add(ppLoadStr(182)); {top}
  aList.Add(ppLoadStr(325)); {bottom}
  aList.Add(ppLoadStr(181)); {left}
  aList.Add(ppLoadStr(327)); {right}

end; {procedure, GetDefaultPropEnumNames}


{******************************************************************************
 *
 ** C U S T O M   I M A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomImage.Create }

constructor TppCustomImage.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  {init inherited properties}
  DrawCommandClass := TppDrawImage;

  spHeight   := 50;
  spWidth    := 50;

  FCenter              := True;
  FDirectDraw          := False;
  FMaintainAspectRatio := False;
  FPicture             := TPicture.Create;
  FStretch             := False;
  Transparent          := False;

  {assign event handler for picture}
  FPicture.OnChange := PictureChanged;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomImage.Destroy }

destructor TppCustomImage.Destroy;
begin
  FPicture.Free;

  inherited Destroy;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomImage.Convert }

procedure TppCustomImage.Convert(aVersionNo: Integer);
begin
  inherited Convert(aVersionNo);

  {convert DirectDraw to False, except for MetaFiles}
  if (aVersionNo <= 4200) then
    if (FPicture.Graphic <> nil) and not(FPicture.Graphic.Empty) then
      FDirectDraw := (FPicture.Graphic is TMetaFile);

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomImage.HasColor }

function  TppCustomImage.HasColor: Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppCustomImage.HasFont }

function  TppCustomImage.HasFont: Boolean;
begin
  Result := False;
end;


{------------------------------------------------------------------------------}
{ TppCustomImage.GetCaption }

function TppCustomImage.GetCaption: String;
begin

  if IsDataAware and (DataField <> '') then
    Result := DataField
  else
    Result := UserName;

end; {procedure, GetCaption}

{------------------------------------------------------------------------------}
{ TppCustomImage.PaintDesignControl}

procedure TppCustomImage.PaintDesignControl(aCanvas: TCanvas);
var
  lRect: TRect;
  lCaption : String;
  liX,
  liY,
  liHeight,
  liWidth : Integer;
  lWorkspace: TBitMap;
  lCopyMode: TCopyMode;
  lClientRect: TRect;
  lfScale: Single;
  liScaledWidth: Integer;
  liScaledHeight: Integer;


begin

  lClientRect := spClientRect;

  if (FPicture.Graphic = nil) or (FPicture.Graphic.Empty) then

    begin

      {draw the background}
      if not Transparent then
        begin
          aCanvas.Brush.Color := Self.Color;
          aCanvas.Brush.Style := bsSolid;
          aCanvas.FillRect(lClientRect);
        end;

      {draw frame rect}
      if DesignControl.FrameStyle = fsDashed then
        aCanvas.Pen.Style := psDash
      else
        aCanvas.Pen.Style := psSolid;

      aCanvas.Pen.Color   := clBlack;
      aCanvas.Brush.Style := bsClear;
      aCanvas.Rectangle(0, 0, spWidth, spHeight);

      {center caption within frame}
      aCanvas.Font := Self.Font;
      lCaption := '(' + Caption + ')';
      liWidth  := aCanvas.TextWidth(lCaption);
      liHeight := aCanvas.TextHeight(lCaption);
      lRect    := spClientRect;
      liX      := (lRect.Right - liWidth) div 2;
      liY      := (lRect.Bottom - liHeight) div 2;
      aCanvas.TextRect(lRect, liX, liY, lCaption);

    end
  else

    begin

      {create workspace}
      lWorkSpace := TBitMap.Create;
      lWorkSpace.Width  := spWidth;
      lWorkSpace.Height := spHeight;

      {draw image}

      if Stretch and MaintainAspectRatio then
        begin
          lRect := spClientRect;

          lfScale := ppCalcAspectRatio(FPicture.Width, FPicture.Height, spWidth, spHeight);

          { Calc scaled width and scaled height }
          liScaledWidth  := Trunc(FPicture.Width  * lfScale);
          liScaledHeight := Trunc(FPicture.Height * lfScale);

          if Center then
            begin
              lRect.Left := lRect.Left + ((spWidth  - liScaledWidth)  div 2);
              lRect.Top  := lRect.Top  + ((spHeight - liScaledHeight) div 2);
            end;

          lRect.Right   := lRect.Left   + liScaledWidth;
          lRect.Bottom  := lRect.Top    + liScaledHeight;

        end
      else if Stretch then
        lRect := spClientRect
      else if Center then
        lRect := Bounds((spWidth - FPicture.Width) div 2, (spHeight - FPicture.Height) div 2,
                FPicture.Width, FPicture.Height)
      else
        lRect := Rect(0, 0, FPicture.Width, FPicture.Height);


      if Transparent then
        lCopyMode := cmSrcAnd

      else
        begin
          {repaint background}
          lWorkSpace.Canvas.Brush.Color := (DesignControl.Parent as TPanel).Color;
          lWorkSpace.Canvas.FillRect(lClientRect);

          lCopyMode := cmSrcCopy;

        end;

      {draw the graphic}
      lWorkSpace.Canvas.StretchDraw(lRect, FPicture.Graphic);

      aCanvas.CopyMode := lCopyMode;

      aCanvas.CopyRect(lClientRect, lWorkSpace.Canvas, lClientRect);

      lWorkSpace.Free;
  end;

end; {procedure, PaintDesignControl}


{------------------------------------------------------------------------------}
{ TppCustomImage.SetCenter }

procedure TppCustomImage.SetCenter(Value: Boolean);
begin
  if FCenter = Value then Exit;

  FCenter := Value;

  PictureChanged(Self);

  PropertyChange;

end; {procedure, SetCenter}

{------------------------------------------------------------------------------}
{ TppCustomImage.SetDirectDraw }

procedure TppCustomImage.SetDirectDraw(Value: Boolean);
begin

  FDirectDraw := Value;

  PictureChanged(Self);

  PropertyChange;

end; {procedure, SetDirectDraw}


{------------------------------------------------------------------------------}
{ TppCustomImage.SetMaintainAspectRatio }

procedure TppCustomImage.SetMaintainAspectRatio(Value: Boolean);
begin
  if FMaintainAspectRatio = Value then Exit;

  FMaintainAspectRatio := Value;

  PictureChanged(Self);

  PropertyChange;

end; {procedure, SetMaintainAspectRatio}


{------------------------------------------------------------------------------}
{ TppCustomImage.GetPicture }

function TppCustomImage.GetPicture: TPicture;
begin
  Result := FPicture;
end; {procedure, GetPicture}

{------------------------------------------------------------------------------}
{ TppCustomImage.SetPicture }

procedure TppCustomImage.SetPicture(aPicture: TPicture);
begin

  FPicture.Assign(aPicture);

  PictureChanged(Self);

end; {procedure, SetPicture}

{------------------------------------------------------------------------------}
{ TppCustomImage.SetStretch }

procedure TppCustomImage.SetStretch(Value: Boolean);
begin
  FStretch := Value;

  PictureChanged(Self);

  PropertyChange;

end; {procedure, SetStretch}

{------------------------------------------------------------------------------}
{ TppCustomImage.SetTransparent }

procedure TppCustomImage.SetTransparent(Value: Boolean);
begin

  inherited SetTransparent(Value);

  PictureChanged(Self);

  PropertyChange;

end; {procedure, SetTransparent}

{------------------------------------------------------------------------------}
{ TppCustomImage.PictureChanged }

procedure TppCustomImage.PictureChanged(Sender: TObject);
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if AutoSize and (Picture.Width > 0) and (Picture.Height > 0) then
    spSetBounds(spLeft, spTop, Picture.Width, Picture.Height);

 InvalidateDesignControl;
 PropertyChange;

end; {procedure, PictureChanged}

{------------------------------------------------------------------------------}
{ TppCustomImage.PropertiesToDrawCommand }

procedure TppCustomImage.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawCommand: TppDrawImage;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawImage) then Exit;


  lDrawCommand := TppDrawImage(aDrawCommand);

  {transfer properties to draw command}
  lDrawCommand.Left         := PrintPosRect.Left;
  lDrawCommand.Top          := PrintPosRect.Top;
  lDrawCommand.Height       := PrintPosRect.Bottom - PrintPosRect.Top;
  lDrawCommand.Width        := PrintPosRect.Right - PrintPosRect.Left;
  lDrawCommand.Stretch      := FStretch;
  lDrawCommand.Center       := FCenter;
  lDrawCommand.MaintainAspectRatio := FMaintainAspectRatio;
  lDrawCommand.DirectDraw   := FDirectDraw;


  {must access Picture property here, in order to get latest data}
  lDrawCommand.Picture := Picture;
  lDrawCommand.Transparent := Transparent;

end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppCustomImage.CreatePopupMenu }

procedure TppCustomImage.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'Center', '', 229); {'Center'}
  aPopupMenu.AddItem(30, 'DirectDraw', '', 681);
  aPopupMenu.AddItem(30, 'MaintainAspectRatio', '', 412);
  aPopupMenu.AddItem(30, 'ReprintOnOverFlow', '',  238);
  aPopupMenu.AddItem(30, 'ShiftWithParent', '', 240);
  aPopupMenu.AddItem(30, 'Stretch', '',  243);
  aPopupMenu.AddItem(30, 'Transparent', '',  246);

end; {procedure, CreatePopupMenu}


{******************************************************************************
 *
 ** I M A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppImage.SetAutoSize }

procedure TppImage.SetAutoSize(Value: Boolean);
begin

  inherited SetAutoSize(Value);

  PictureChanged(Self);

end; {procedure, SetAutoSize}


{------------------------------------------------------------------------------}
{ TppImage.InstantiateDesignControl }

procedure TppImage.InstantiateDesignControl;

begin
  inherited InstantiateDesignControl;

  {call data change to set picture}
  DesignControl.FrameStyle := fsDashed;

end; {procedure, InstantiateDesignControl}


{------------------------------------------------------------------------------}
{ TppImage.CreatePopupMenu }

procedure TppImage.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner,aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(30, 'AutoSize', '',  226); {'AutoSize'}
  aPopupMenu.AddItem(30, 'Picture', '',  235);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppImage.PopupMenuClick }

procedure TppImage.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  TppPopupMenu(Sender).ItemByName('Picture').OnClick := PictureMenuClick;

end; {procedure, PopupMenuClick}


{------------------------------------------------------------------------------}
{ TppImage.PictureMenuClick }

procedure TppImage.PictureMenuClick(Sender: TObject);
var
  lPictureDlg: TOpenPictureDialog;
begin

  if (Band = nil) or (Band.Report = nil) then Exit;

  {display picture property dialog}
  lPictureDlg := TOpenPictureDialog.Create(Application);

  try
    if lPictureDlg.Execute then
      begin
        Picture.LoadFromFile(lPictureDlg.FileName);

        PropertyChange;   {ok to call this here}
      end;
  finally
    lPictureDlg.Free;
  end; {try, finally}

end; {procedure, PictureMenuClick}


{******************************************************************************
 *
 ** D B I M A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDBImage.Create }

constructor TppDBImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FAutoDisplay  := True;
  FOnGetPicture := nil;

  FGraphicType := 'Bitmap';


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDBImage.Destroy }

destructor TppDBImage.Destroy;
begin
  inherited Destroy;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDBImage.GetDescription }

function TppDBImage.GetDescription: String;
begin
  if (DataField <> '') then
    Result := UserName + ': ' + DataField
  else
    Result := UserName;

end; {function, GetDescription}

{------------------------------------------------------------------------------}
{ TppDBImage.Notify }

procedure TppDBImage.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (csDestroying in ComponentState) then Exit;

  if (aOperation in [ppopDataChange, ppopRemove]) and (pppcDesigning in DesignState) and not(Printing) then
    LoadPicture;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDBImage.PaintDesignControl }

procedure TppDBImage.PaintDesignControl(aCanvas: TCanvas);
begin
  LoadPicture;
  inherited PaintDesignControl(aCanvas);

end;

{------------------------------------------------------------------------------}
{ TppDBImage.SetAutoDisplay }

procedure TppDBImage.SetAutoDisplay(Value: Boolean);
begin

  if FAutoDisplay <> Value then
    begin
      FAutoDisplay := Value;

      if Value then LoadPicture;
    end;

end;

{------------------------------------------------------------------------------}
{ TppDBImage.SetGraphicType }

procedure TppDBImage.SetGraphicType(aGraphicType: String);
begin

  if (ppGetGraphicClassForName(aGraphicType) = nil) then Exit;

  FGraphicType := aGraphicType;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  {default DirectDraw to False, except for MetaFiles}
  FDirectDraw := (FGraphicType = 'MetaFile');

  PropertyChange;

  Reset;

end; {procedure, SetGraphicType}

{------------------------------------------------------------------------------}
{ TppDBImage.GetGraphicClass }

function TppDBImage.GetGraphicClass: TGraphicClass;
begin

  Result := ppGetGraphicClassForName(FGraphicType);

end; {function, GetGraphicClass}

{------------------------------------------------------------------------------}
{ TppDBImage.GetPicture }

function TppDBImage.GetPicture: TPicture;
begin
  LoadPicture;

  Result := inherited GetPicture;
end;

{------------------------------------------------------------------------------}
{ TppDBImage.LoadPicture }

procedure TppDBImage.LoadPicture;
var
  lDataType: TppDataType;
  lImageStream: TMemoryStream;
  lGraphic: TGraphic;

begin

  FPicture.Graphic := nil;

  if not(FAutoDisplay) then Exit;

  if Assigned(FOnGetPicture) then

    FOnGetPicture(Self, FPicture)

  else if (CheckForPipelineData) then
    begin

      lDataType := dtNotKnown;

      try
        lDataType := DataPipeline.GetFieldDataType(DataField);
      except

      end;

      if (lDataType = dtBLOB) or (lDataType = dtGraphic) then
        try
          if GraphicClass = TBitmap then
            FPicture.Assign(DataPipeline.GetFieldAsPicture(DataField))
          else
            begin
              lImageStream := TMemoryStream.Create;

              try
                DataPipeline.GetFieldAsStream(DataField, lImageStream);
                
                {if JPEG is null, stream size will be 0}
                if lImageStream.Size > 0 then
                  begin
                    lImageStream.Position := 0;
                    lGraphic := GraphicClass.Create;
                    lGraphic.LoadFromStream(lImageStream);
                    FPicture.Graphic := lGraphic;
                    lGraphic.Free;
                  end;

              finally
                lImageStream.Free;
              end; {try, finally}

            end;
            
        except
          if Band.Report.Engine.Printing then
            Band.Report.RaiseException(EPrintError.Create(ppLoadStr(290)))
          else
            FPicture.Graphic :=  nil;
        end; {try, except}

    end;


  InvalidateDesignControl;

end; {procedure, LoadPicture}

{------------------------------------------------------------------------------}
{ TppDBImage.PictureChanged }

procedure TppDBImage.PictureChanged(Sender: TObject);
begin

  InvalidateDesignControl;

end;

{------------------------------------------------------------------------------}
{ TppDBImage.IsDataAware }

function TppDBImage.IsDataAware: Boolean;
begin
  Result := True;
end;

{------------------------------------------------------------------------------}
{ TppDBImage.SetDataField }

procedure TppDBImage.SetDataField(const Value: string);
begin

  inherited SetDataField(Value);

  {display the picture}
  LoadPicture;

end; {procedure, SetDataField}


{------------------------------------------------------------------------------}
{ TppDBImage.CreatePopupMenu }

procedure TppDBImage.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
var
  lMenuItem: TMenuItem;
  liIndex: Integer;
  lGraphicClasses: TStrings;
  lSubItem: TMenuItem;

begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  lMenuItem := aPopupMenu.AddItem(30, 'GraphicType', '', 162); {'GraphicType'}

  lGraphicClasses := ppGraphicClasses;

  for liIndex := 0 to lGraphicClasses.Count-1 do
    begin
      lSubItem := TMenuItem.Create(aPopupMenu);
      lSubItem.Name    := lGraphicClasses[liIndex];
      lSubItem.Caption := lGraphicClasses[liIndex];
      lMenuItem.Add(lSubItem);
    end;


end; {procedure, CreatePopupMenu}


{------------------------------------------------------------------------------}
{ TppDBImage.PopupMenuClick }

procedure TppDBImage.PopupMenuClick(Sender: TObject);
var
  liIndex: Integer;
  liGraphicType: Integer;
  lGraphicMenu: TMenuItem;
begin

  inherited PopupMenuClick(Sender);

  liGraphicType := ppGraphicClasses.IndexOf(FGraphicType);

  lGraphicMenu := TppPopupMenu(Sender).ItemByName('GraphicType');

  for liIndex := 0 to lGraphicMenu.Count-1 do
    begin
      lGraphicMenu.Items[liIndex].OnClick := GraphicTypeSubMenuClick;
      lGraphicMenu.Items[liIndex].Checked := (liIndex = liGraphicType);
    end;

end; {procedure, PopupMenuClick}


{------------------------------------------------------------------------------}
{ TppImage.GraphicTypeSubMenuClick }

procedure TppDBImage.GraphicTypeSubMenuClick(Sender: TObject);
begin

  SetGraphicType(ppGraphicClasses[TMenuItem(Sender).MenuIndex]);

end; {procedure, GraphicTypeSubMenuClick}


{******************************************************************************
 *
 ** R E G I S T E R   R O U T I N E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppGraphicClasses }

function ppGraphicClasses: TStringList;
var
  lGraphicClass: TClass;
  
begin

  if FGraphicClasses = nil then
    begin
      FGraphicClasses := TStringList.Create;

      {register default graphic classes}
      ppRegisterGraphicClass('Bitmap',   TBitmap);
      ppRegisterGraphicClass('MetaFile', TMetaFile);
      ppRegisterGraphicClass('Icon',     TIcon);

      {look for the TGIFImage class}
      lGraphicClass := GetClass('TGIFImage');

      if (lGraphicClass <> nil) and (lGraphicClass.InheritsFrom(TGraphic)) then
        ppRegisterGraphicClass('GIF', TGraphicClass(lGraphicClass));

      {look for the TJPEGImage class}
      lGraphicClass := GetClass('TJPEGImage');

      if (lGraphicClass <> nil) and (lGraphicClass.InheritsFrom(TGraphic)) then
        ppRegisterGraphicClass('JPEG', TGraphicClass(lGraphicClass));

      FGraphicClasses.Sorted := True;
    end;

  Result := FGraphicClasses;

end; {function,  ppGraphicClasses}


{------------------------------------------------------------------------------}
{ ppRegisterGraphicClass }

procedure ppRegisterGraphicClass(aName: String; aGraphicClass: TGraphicClass);
var
  liIndex: Integer;
begin

  if ppGraphicClasses.Find(aName, liIndex) then
    ppGraphicClasses.Objects[liIndex] := TObject(aGraphicClass)
  else
    ppGraphicClasses.AddObject(aName, TObject(aGraphicClass));

end; {procedure, ppRegisterGraphicClass}


{------------------------------------------------------------------------------}
{ ppUnRegisterGraphicClass }

procedure ppUnRegisterGraphicClass(aGraphicClass: TGraphicClass);
var
  liIndex: Integer;
begin

  if (FGraphicClasses = nil) then Exit;

  liIndex := ppGraphicClasses.IndexOfObject(TObject(aGraphicClass));

  if  liIndex >= 0 then
    ppGraphicClasses.Delete(liIndex);

end; {procedure, ppRegisterGraphicClass}


{------------------------------------------------------------------------------}
{ ppGetGraphicClassForName }

function ppGetGraphicClassForName(aName: String): TGraphicClass;
var
  liIndex: Integer;
begin

  if ppGraphicClasses.Find(aName, liIndex) then
    Result := TGraphicClass(ppGraphicClasses.Objects[liIndex])
  else
    Result := nil

end; {procedure, ppRegisterGraphicClass}


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
 ** C U S T O M   T E X T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomTextRTTI.RefClass }

class function TraTppCustomTextRTTI.RefClass: TClass;
begin
  Result := TppCustomText;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomTextRTTI.GetParams }

class function TraTppCustomTextRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (CompareText(aMethodName, 'OnGetText') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Text', daString, nil, '', False, True);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppCustomTextRTTI.GetPropRec }

class function TraTppCustomTextRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'OnGetText') = 0) then
    EventToRec(aPropName, ciComponentGetText, True, aPropRec)

  else if (CompareText(aPropName, 'AutoSize') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'CharWrap') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Color') = 0) then
    EnumPropToRec(aPropName, 'TColor', False, aPropRec)

  else if (CompareText(aPropName, 'Description') = 0) then
    PropToRec(aPropName, daString, True, aPropRec)

  else if (CompareText(aPropName, 'SaveOrder') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'Save') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'SaveLength') = 0) then
    PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'Text') = 0) then
    PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'Transparent') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomTextRTTI.GetPropValue }

class function TraTppCustomTextRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'AutoSize') = 0) then
    Integer(aValue) := Ord(TppCustomText(aObject).AutoSize)

  else if (CompareText(aPropName, 'Description') = 0) then
    String(aValue) := TppCustomText(aObject).Description

  else if (CompareText(aPropName, 'CharWrap') = 0) then
    Integer(aValue) := Ord(TppCustomText(aObject).CharWrap)

  else if (CompareText(aPropName, 'Color') = 0) then
    Integer(aValue) := Ord(TppCustomText(aObject).Color)

  else if (CompareText(aPropName, 'SaveOrder') = 0) then
    Integer(aValue) := TppCustomText(aObject).SaveOrder

  else if (CompareText(aPropName, 'Save') = 0) then
    Integer(aValue) := Ord(TppCustomText(aObject).Save)

  else if (CompareText(aPropName, 'SaveLength') = 0) then
    Integer(aValue) := TppCustomText(aObject).SaveLength

  else if (CompareText(aPropName, 'Text') = 0) then
    String(aValue) := TppCustomText(aObject).Text

  else if (CompareText(aPropName, 'Transparent') = 0) then
    Integer(aValue) := Ord(TppCustomText(aObject).Transparent)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCustomTextRTTI.SetPropValue }

class function TraTppCustomTextRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'AutoSize') = 0) then
    TppCustomText(aObject).AutoSize := Boolean(aValue)

  else if (CompareText(aPropName, 'CharWrap') = 0) then
    TppCustomText(aObject).CharWrap := Boolean(aValue)

  else if (CompareText(aPropName, 'Color') = 0) then
    TppCustomText(aObject).Color := TColor(aValue)

  else if (CompareText(aPropName, 'SaveOrder') = 0) then
    TppCustomText(aObject).SaveOrder := Integer(aValue)

  else if (CompareText(aPropName, 'Save') = 0) then
    TppCustomText(aObject).Save := Boolean(aValue)

  else if (CompareText(aPropName, 'SaveLength') = 0) then
    TppCustomText(aObject).SaveLength := Integer(aValue)

  else if (CompareText(aPropName, 'Text') = 0) then
    TppCustomText(aObject).Text := String(aValue)

  else if (CompareText(aPropName, 'Transparent') = 0) then
    TppCustomText(aObject).Transparent := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}

{******************************************************************************
 *
 ** C U S T O M   I M A G E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomImageRTTI.RefClass }

class function TraTppCustomImageRTTI.RefClass: TClass;
begin
  Result := TppCustomImage;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomImageRTTI.GetPropList }

class procedure TraTppCustomImageRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCustomImageRTTI.GetPropRec }

class function TraTppCustomImageRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Center') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'DirectDraw') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'MaintainAspectRatio') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Stretch') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Transparent') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomImageRTTI.GetPropValue }

class function TraTppCustomImageRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Center') = 0) then
    Boolean(aValue) := TppCustomImage(aObject).Center

  else if (CompareText(aPropName, 'DirectDraw') = 0) then
    Boolean(aValue) := TppCustomImage(aObject).DirectDraw

  else if (CompareText(aPropName, 'MaintainAspectRatio') = 0) then
    Boolean(aValue) := TppCustomImage(aObject).MaintainAspectRatio

  else if (CompareText(aPropName, 'Stretch') = 0) then
    Boolean(aValue) := TppCustomImage(aObject).Stretch

  else if (CompareText(aPropName, 'Transparent') = 0) then
    Boolean(aValue) := TppCustomImage(aObject).Transparent

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCustomImageRTTI.SetPropValue }

class function TraTppCustomImageRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Center') = 0) then
    TppCustomImage(aObject).Center := Boolean(aValue)

  else if (CompareText(aPropName, 'DirectDraw') = 0) then
    TppCustomImage(aObject).DirectDraw := Boolean(aValue)

  else if (CompareText(aPropName, 'MaintainAspectRatio') = 0) then
    TppCustomImage(aObject).MaintainAspectRatio := Boolean(aValue)

  else if (CompareText(aPropName, 'Stretch') = 0) then
    TppCustomImage(aObject).Stretch := Boolean(aValue)

  else if (CompareText(aPropName, 'Transparent') = 0) then
    TppCustomImage(aObject).Transparent := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}

{******************************************************************************
 *
 ** T P P D B I M A G E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppDBImageRTTI.GetParams }

class function TraTppDBImageRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (CompareText(aMethodName, 'OnGetPicture') = 0)  then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aPicture', daClass, TPicture, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppDBImageRTTI.GetPropRec }

class function TraTppDBImageRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {events}
  if (CompareText(aPropName, 'OnGetPicture') = 0) then
    EventToRec(aPropName, ciComponentGetPicture, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end;  {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppDBImageRTTI.RefClass }

class function TraTppDBImageRTTI.RefClass: TClass;
begin
  Result := TppDBImage;
end; {class function, RefClass}



{******************************************************************************
 *
 ** C U S T O M   G R A P H I C   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomGraphicRTTI.RefClass }

class function TraTppCustomGraphicRTTI.RefClass: TClass;
begin
  Result := TppCustomGraphic;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomGraphicRTTI.GetPropList }

class procedure TraTppCustomGraphicRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCustomGraphicRTTI.GetPropRec }

class function TraTppCustomGraphicRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Brush') = 0) then
    ClassPropToRec(aPropName, TBrush, False, aPropRec)

  else if (CompareText(aPropName, 'Pen') = 0) then
    ClassPropToRec(aPropName, TPen, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomGraphicRTTI.GetPropValue }

class function TraTppCustomGraphicRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Brush') = 0) then
    Integer(aValue) := Integer(TppCustomGraphic(aObject).Brush)

  else if (CompareText(aPropName, 'Pen') = 0) then
    Integer(aValue) := Integer(TppCustomGraphic(aObject).Pen)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCustomGraphicRTTI.SetPropValue }

class function TraTppCustomGraphicRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Brush') = 0) then
    TppCustomGraphic(aObject).Brush := TBrush(aValue)

  else if (CompareText(aPropName, 'Pen') = 0) then
    TppCustomGraphic(aObject).Pen := TPen(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** L I N E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppLineRTTI.RefClass }

class function TraTppLineRTTI.RefClass: TClass;
begin
  Result := TppLine;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppLineRTTI.GetPropList }

class procedure TraTppLineRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppLineRTTI.GetPropRec }

class function TraTppLineRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Position') = 0) then
    EnumPropToRec(aPropName, 'TppLinePositionType', False, aPropRec)

  else if (CompareText(aPropName, 'Style') = 0) then
    EnumPropToRec(aPropName, 'TppLineStyleType', False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppLineRTTI.GetPropValue }

class function TraTppLineRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Position') = 0) then
    Integer(aValue) := Ord(TppLine(aObject).Position)

  else if (CompareText(aPropName, 'Style') = 0) then
    Integer(aValue) := Ord(TppLine(aObject).Style)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppLineRTTI.SetPropValue }

class function TraTppLineRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Position') = 0) then
    TppLine(aObject).Position := TppLinePositionType(aValue)

  else if (CompareText(aPropName, 'Style') = 0) then
    TppLine(aObject).Style := TppLineStyleType(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** S H A P E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppShapeRTTI.RefClass }

class function TraTppShapeRTTI.RefClass: TClass;
begin
  Result := TppShape;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppShapeRTTI.GetPropList }

class procedure TraTppShapeRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppShapeRTTI.GetPropRec }

class function TraTppShapeRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Shape') = 0) then
    EnumPropToRec(aPropName, 'TShapeType', False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppShapeRTTI.GetPropValue }

class function TraTppShapeRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Shape') = 0) then
    Integer(aValue) := Ord(TppShape(aObject).Shape)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppShapeRTTI.SetPropValue }

class function TraTppShapeRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Shape') = 0) then
    TppShape(aObject).Shape := TShapeType(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** D B T E X T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppDBTextRTTI.RefClass }

class function TraTppDBTextRTTI.RefClass: TClass;
begin
  Result := TppDBText;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppDBTextRTTI.GetPropList }

class procedure TraTppDBTextRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('FieldValue');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppDBTextRTTI.GetPropRec }

class function TraTppDBTextRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'AlreadyPrinted') = 0) then
     PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'BlankWhenZero') = 0) then
     PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'FieldValue') = 0) then
     PropToRec(aPropName, daVariant, True, aPropRec)

  else if (CompareText(aPropName, 'FirstPage') = 0) then
     PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'PriorValue') = 0) then
     PropToRec(aPropName, daString, True, aPropRec)

  else if (CompareText(aPropName, 'PriorValueSame') = 0) then
     PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'ReprintOnSubsequent') = 0) then
     PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'SuppressRepeatedValues') = 0) then
     PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppDBTextRTTI.GetPropValue }

class function TraTppDBTextRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'AlreadyPrinted') = 0) then
    Boolean(aValue) := TppDBText(aObject).AlreadyPrinted

  else if (CompareText(aPropName, 'BlankWhenZero') = 0) then
    Boolean(aValue) := TppDBText(aObject).BlankWhenZero

  else if (CompareText(aPropName, 'FieldValue') = 0) then
    Variant(aValue) := TppDBText(aObject).FieldValue

  else if (CompareText(aPropName, 'FirstPage') = 0) then
    Integer(aValue) := TppDBText(aObject).FirstPage

  else if (CompareText(aPropName, 'PriorValue') = 0) then
    String(aValue) := TppDBText(aObject).PriorValue

  else if (CompareText(aPropName, 'PriorValueSame') = 0) then
    Boolean(aValue) := TppDBText(aObject).PriorValueSame

  else if (CompareText(aPropName, 'ReprintOnSubsequent') = 0) then
    Boolean(aValue) := TppDBText(aObject).ReprintOnSubsequent

  else if (CompareText(aPropName, 'SuppressRepeatedValues') = 0) then
    Boolean(aValue) := TppDBText(aObject).SuppressRepeatedValues

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppDBTextRTTI.SetPropValue }

class function TraTppDBTextRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'BlankWhenZero') = 0) then
    TppDBText(aObject).BlankWhenZero := Boolean(aValue)

  else if (CompareText(aPropName, 'ReprintOnSubsequent') = 0) then
    TppDBText(aObject).ReprintOnSubsequent := Boolean(aValue)

  else if (CompareText(aPropName, 'SuppressRepeatedValues') = 0) then
    TppDBText(aObject).SuppressRepeatedValues := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** D B C A L C   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppDBCalcRTTI.RefClass }

class function TraTppDBCalcRTTI.RefClass: TClass;
begin
  Result := TppDBCalc;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppDBCalcRTTI.GetPropList }

class procedure TraTppDBCalcRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('Clear');
  aPropList.AddProp('Value');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppDBCalcRTTI.GetPropRec }

class function TraTppDBCalcRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Clear') = 0) then
    MethodToRec(aPropName, False, aPropRec)

  else if (CompareText(aPropName, 'Divisor') = 0) then
    PropToRec(aPropName, daDouble, False, aPropRec)

  else if (CompareText(aPropName, 'Value') = 0) then
    PropToRec(aPropName, daVariant, True, aPropRec)

  else if (CompareText(aPropName, 'DBCalcType') = 0) then
    EnumPropToRec(aPropName, 'TppDBCalcType', False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppDBCalcRTTI.CallMethod }

class function TraTppDBCalcRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lDBCalc: TppDBCalc;
begin

  Result := True;
  
  lDBCalc := TppDBCalc(aObject);

  if ppEqual(aMethodName, 'Clear')  then
    lDBCalc.Clear
  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppDBCalcRTTI.GetPropValue }

class function TraTppDBCalcRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Divisor') = 0) then
    Double(aValue) := TppDBCalc(aObject).Divisor

  else if (CompareText(aPropName, 'Value') = 0) then
    Variant(aValue) := TppDBCalc(aObject).Value

  else if (CompareText(aPropName, 'DBCalcType') = 0) then
    Integer(aValue) := Ord(TppDBCalc(aObject).DBCalcType)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppDBCalcRTTI.SetPropValue }

class function TraTppDBCalcRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Divisor') = 0) then
    TppDBCalc(aObject).Divisor := Double(aValue)

  else if (CompareText(aPropName, 'Value') = 0) then
    TppDBCalc(aObject).Value := Variant(aValue)

  else if (CompareText(aPropName, 'DBCalcType') = 0) then
    TppDBCalc(aObject).DBCalcType := TppDBCalcType(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}


initialization

  raRegisterRTTI(TraTppCustomTextRTTI);
  raRegisterRTTI(TraTppCustomImageRTTI);
  raRegisterRTTI(TraTppDBImageRTTI);
  raRegisterRTTI(TraTppCustomGraphicRTTI);
  raRegisterRTTI(TraTppLineRTTI);
  raRegisterRTTI(TraTppShapeRTTI);
  raRegisterRTTI(TraTppDBTextRTTI);
  raRegisterRTTI(TraTppDBCalcRTTI);

finalization

  FGraphicClasses.Free;
  FGraphicClasses := nil;

  raUnRegisterRTTI(TraTppCustomTextRTTI);
  raUnRegisterRTTI(TraTppCustomImageRTTI);
  raUnRegisterRTTI(TraTppDBImageRTTI);
  raUnRegisterRTTI(TraTppCustomGraphicRTTI);
  raUnRegisterRTTI(TraTppLineRTTI);
  raUnRegisterRTTI(TraTppShapeRTTI);
  raUnRegisterRTTI(TraTppDBTextRTTI);
  raUnRegisterRTTI(TraTppDBCalcRTTI);

end.
