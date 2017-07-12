{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppCTMain;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypInfo, ExtCtrls, Menus,
  ppComm, ppRelatv, ppClass, ppStrtch, ppDevice, ppDsgnCt, ppDB, ppTypes,
  ppUtils, ppCTCell, ppDrwCmd, ppPrintr, ppForms, ppEnum, ppRTTI;

const
  ciTextMargin = 1588;
  
type

  TppElement = class;
  TppDimension = class;
  TppColumnDef = class;
  TppRowDef = class;
  TppValueDef = class;
  TppValueCaptionDef = class;
  TppSubTotal = class;
  TppGrandTotal = class;

  TppCrossTabChildType = (ctctColumnDef, ctctRowDef, ctctValueDef, ctctTotalDef,
                          ctctTotalCaptionDef, ctctSubTotal, ctctColumnGrandTotal,
                          ctctRowGrandTotal, ctctValueCaptionDef);

  TppCrossTabPaginationType = (ctptAcrossThenDown, ctptDownThenAcross);

  TppTotalType = (ctttAll, ctttRow, ctttColumn);

  TppNullOrderType = (ctnoFirst, ctnoLast);

  TppOnCalcDimensionValue = procedure(Sender: TObject; aDimension: TppDimension; var aValue: Variant) of object;
  TppOnFormatCell = procedure(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer) of object;
  TppOnGetDimensionCaption = procedure(Sender: TObject; aDimension: TppDimension; var aCaption: String) of object;
  TppOnGetDimensionName = procedure(Sender: TObject; aDimension: TppDimension; var aName: String) of object;
  TppOnGetDimensionText = procedure(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String;
                                    aValue: Variant; var aText: String) of object;
  TppOnGetDimensionValue = procedure(Sender: TObject; aDimension: TppDimension; var aValue: Variant; var aSkip: Boolean) of object;
  TppOnGetTotalCaptionText = procedure(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer; var aText: String) of object;
  TppOnTraverseRecord = procedure(Sender: TObject; aDataPipeline: TppDataPipeline; var aSkipRecord: Boolean) of object;

  TppCrossTabSaveRec = record
    FDrawComponent: Boolean;
    FDrawShifter: Boolean;
    FObjectIndex: Integer;
    FOverFlow: Boolean;
    FPartialGeneration: Boolean;

    FCrossTabId: Integer;
    FStartColumn: Integer;
    FStartRow: Integer;
  end; {record, TppCrossTabSaveRec}

  { TppCrossTab }
  TppCrossTab = class(TppStretchable)
    private
      FAfterCalc: TNotifyEvent;
      FAssigning: Boolean;
      FAvailableDimensions: TStrings;
      FBeforeCalc: TNotifyEvent;
      FCalculating: Boolean;
      FClearing: Boolean;
      FColumnDefs: TList;
      FColumnGrandTotals: TList;
      FCrossTabId: Integer;
      FDraw: Boolean;
      FEngine: TObject;
      FGridLines: Boolean;
      FLastCalcId: Integer;
      FStatusTimer: TObject;
      FModified: Boolean;
      FOnCalcDimensionValue: TppOnCalcDimensionValue;
      FOnDimensionChange: TNotifyEvent;
      FOnDimensionChange2: TNotifyEvent;
      FOnFormatCell: TppOnFormatCell;
      FOnGetCaptionText: TppOnGetDimensionText;
      FOnGetDimensionName: TppOnGetDimensionName;
      FOnGetDimensionCaption: TppOnGetDimensionCaption;
      FOnGetDimensionValue: TppOnGetDimensionValue;
      FOnGetTotalCaptionText: TppOnGetTotalCaptionText;
      FOnGetTotalValueText: TppOnGetDimensionText;
      FOnGetValueText: TppOnGetDimensionText;
      FOnTraverseRecord: TppOnTraverseRecord;
      FPagination: TppCrossTabPaginationType;
      FRenderer: TObject;
      FRowDefs: TList;
      FRowGrandTotals: TList;
      FStartColumn: Integer;
      FStartRow: Integer;
      FStyle: String;
      FValueDefs: TList;

      procedure DimensionAdded(aDimension: TppDimension);
      procedure DimensionRemoved(aDimension: TppDimension);
      function  GetColumnDef(aIndex: Integer): TppColumnDef;
      function  GetColumnDefCount: Integer;
      function  GetColumnGrandTotal(aIndex: Integer): TppGrandTotal;
      function  GetColumnGrandTotalCount: Integer;
      function  GetMatrix: TppMatrix;
      function  GetRowDef(aIndex: Integer): TppRowDef;
      function  GetRowDefCount: Integer;
      function  GetRowGrandTotal(aIndex: Integer): TppGrandTotal;
      function  GetRowGrandTotalCount: Integer;
      function  GetValueDef(aIndex: Integer): TppValueDef;
      function  GetValueDefCount: Integer;
      function  RestoreFieldToAvailableDimension(aDimension: TppDimension): Integer;
      procedure SetDraw(aValue: Boolean);
      procedure SetGridLines(aValue: Boolean);
      procedure SetModified(aValue: Boolean);
      procedure SetPagination(aValue: TppCrossTabPaginationType);
      procedure SetStyle(aValue: String);
      procedure ShowColumnGrandTotals(aValue: Boolean);
      procedure ShowRowGrandTotals(aValue: Boolean);
      procedure ShowColumnSubTotals(aValue: Boolean);
      procedure ShowRowSubTotals(aValue: Boolean);
      procedure ValueDefAdded(aValueDef: TppValueDef);
      procedure ValueDefMoved(aOldIndex, aNewIndex: Integer);
      procedure ValueDefRemoved(aValueDef: TppValueDef);

    protected
      procedure SaveComponents(Proc: TGetChildProc); override;

      procedure CalcSpaceUsed; override;
      procedure CreateDrawCommand(aPage: TppPage); override;
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure DoOnDimensionChange;
      procedure SetBand(aBand: TppBand); override;
      procedure SetCaption(aCaption: String); override;
      procedure SetRegion(aComponent: TppComponent); override;
      procedure SetUnits(aUnits: TppUnitType); override;

      {popup menu event handlers}
      procedure AcrossThenDownMenuClick(Sender: TObject);
      procedure ConfigureMenuClick(Sender: TObject);
      procedure DownThenAcrossMenuClick(Sender: TObject);
      procedure RendererMenuClick(Sender: TObject);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      {overridden from relative}
      procedure AddChild(aChild: TppRelative); override;
      procedure InsertChild(aPosition: Integer; aChild: TppRelative); override;
      function  IndexOfChild(aChild: TppRelative): Integer; override;
      function  RemoveChild(aChild: TppRelative): Integer; override;

      procedure MoveChild(aChild: TppRelative; aNewIndex: Integer);

      procedure Clear; override;
      function  HasColor: Boolean; override;
      function  HasFont: Boolean; override;
      function  IsDataAware: Boolean; override;
      procedure LanguageChanged; override;
      procedure PopupMenuClick(Sender: TObject); override;
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;
      function  Status: String;

      procedure CopyAvailableDimensions(aList: TStrings);
      function  DeselectColumnDef(aIndex: Integer): Integer;
      function  DeselectRowDef(aIndex: Integer): Integer;
      function  DeselectValueDef(aIndex: Integer): Integer;
      function  GetElement(aIndex: Integer): TppElement;
      function  IndexOfAvailableDimension(const aFieldAlias: String): Integer;
      function  IndexOfColumnGrandTotal(aGrandTotal: TppGrandTotal): Integer;
      function  IndexOfRowGrandTotal(aGrandTotal: TppGrandTotal): Integer;
      procedure InitAvailableDimensions;
      function  SelectColumnDef(aIndex: Integer): TppColumnDef;
      function  SelectRowDef(aIndex: Integer): TppRowDef;
      function  SelectValueDef(aIndex: Integer): TppValueDef;
      procedure ShowGrandTotals(aTotalType: TppTotalType; aValue: Boolean);
      procedure ShowSubTotals(aTotalType: TppTotalType; aValue: Boolean);
      function  VisibleColumnGrandTotalCount: Integer;
      function  VisibleRowGrandTotalCount: Integer;

      {event triggers}
      procedure DoAfterCalc;
      procedure DoBeforeCalc;
      procedure DoOnCalcDimensionValue(aDimension: TppDimension; var aValue: Variant);
      procedure DoOnFormatCell(aElement: TppElement; aColumn, aRow: Integer);
      procedure DoOnGetCaptionText(aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
      procedure DoOnGetDimensionCaption(aDimension: TppDimension; var aCaption: String);
      procedure DoOnGetDimensionName(aDimension: TppDimension; var aName: String);
      procedure DoOnGetDimensionValue(aDimension: TppDimension; var aValue: Variant; var aSkip: Boolean);
      procedure DoOnGetTotalCaptionText(aElement: TppElement; aColumn, aRow: Integer; var aText: String);
      procedure DoOnGetTotalValueText(aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
      procedure DoOnGetValueText(aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
      procedure DoOnTraverseRecord(aDataPipeline: TppDataPipeline; var aSkipRecord: Boolean);

      property Calculating: Boolean read FCalculating;
      property ColumnDefCount: Integer read GetColumnDefCount;
      property ColumnDefs[Index: Integer]: TppColumnDef read GetColumnDef;
      property ColumnGrandTotalCount: Integer read GetColumnGrandTotalCount;
      property ColumnGrandTotals[Index: Integer]: TppGrandTotal read GetColumnGrandTotal;
      property DataField;
      property Matrix: TppMatrix read GetMatrix;
      property Modified: Boolean read FModified write SetModified;
      property OnDimensionChange: TNotifyEvent read FOnDimensionChange write FOnDimensionChange;
      property OnDimensionChange2: TNotifyEvent read FOnDimensionChange2 write FOnDimensionChange2;
      property RowDefCount: Integer read GetRowDefCount;
      property RowDefs[Index: Integer]: TppRowDef read GetRowDef;
      property RowGrandTotalCount: Integer read GetRowGrandTotalCount;
      property RowGrandTotals[Index: Integer]: TppGrandTotal read GetRowGrandTotal;
      property ValueDefCount: Integer read GetValueDefCount;
      property ValueDefs[Index: Integer]: TppValueDef read GetValueDef;

    published
      property AfterCalc: TNotifyEvent read FAfterCalc write FAfterCalc;
      property BeforeCalc: TNotifyEvent read FBeforeCalc write FBeforeCalc;
      property BottomOffset;
      property Caption;
      property DataPipeline;
      property Draw: Boolean read FDraw write SetDraw default True;
      property GridLines: Boolean read FGridLines write SetGridLines default True;
      property Height;
      property Left;
      property OnCalcDimensionValue: TppOnCalcDimensionValue read FOnCalcDimensionValue write FOnCalcDimensionValue;
      property OnFormatCell: TppOnFormatCell read FOnFormatCell write FOnFormatCell;
      property OnGetCaptionText: TppOnGetDimensionText read FOnGetCaptionText write FOnGetCaptionText;
      property OnGetDimensionName: TppOnGetDimensionName read FOnGetDimensionName write FOnGetDimensionName;
      property OnGetDimensionCaption: TppOnGetDimensionCaption read FOnGetDimensionCaption write FOnGetDimensionCaption;
      property OnGetDimensionValue: TppOnGetDimensionValue read FOnGetDimensionValue write FOnGetDimensionValue;
      property OnGetTotalCaptionText: TppOnGetTotalCaptionText read FOnGetTotalCaptionText write FOnGetTotalCaptionText;
      property OnGetTotalValueText: TppOnGetDimensionText read FOnGetTotalValueText write FOnGetTotalValueText;
      property OnGetValueText: TppOnGetDimensionText read FOnGetValueText write FOnGetValueText;
      property OnTraverseRecord: TppOnTraverseRecord read FOnTraverseRecord write FOnTraverseRecord;
      property OverFlowOffset;
      property ParentWidth default True;
      property Pagination: TppCrossTabPaginationType read FPagination write SetPagination default ctptDownThenAcross;
      property ShiftRelativeTo;
      property StopPosition;
      property Stretch;
      property Style: String read FStyle write SetStyle;
      property Top;
      property Visible;
      property Width;


  end; {class, TppCrossTab}

  { TppElement }
  TppElement = class(TppRelative)
    private
      FAlignment: TAlignment;
      FColor: TColor;
      FDataType: TppDataType;
      FDisplayFormat: String;
      FElementIndex: Integer;
      FFont: TFont;
      FName: String;
      FOnChange: TNotifyEvent;
      FVisible: Boolean;

      FLeft: Integer;
      FTop: Integer;
      FHeight: Integer;
      FWidth: Integer;
      FTextHeight: Integer;
      FTextWidth: Integer;

      procedure SetAlignment(aAlignment: TAlignment);
      procedure SetColor(aColor: TColor);
      procedure SetFont(aFont: TFont);
      procedure SetVisible(aValue: Boolean);

    protected
      procedure DoOnChange;

      procedure SetDisplayFormat(const aFormat: String); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      constructor CreateWithName(aOwner: TComponent; const aName: String);
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      function  CrossTab: TppCrossTab;

      function  GetName: String; virtual;
      function  GetDesignName: String; virtual;
      function  GetDataType: TppDataType; virtual;
      function  HasDisplayFormat: Boolean;

      procedure Modified;

      function DrawRect: TRect;

      property Left: Integer read FLeft write FLeft;
      property Top: Integer read FTop write FTop;
      property Width: Integer read FWidth write FWidth;
      property Height: Integer read FHeight write FHeight;
      property ElementIndex: Integer read FElementIndex write FElementIndex;
      property OnChange: TNotifyEvent read FOnChange write FOnChange;
      property TextWidth: Integer read FTextWidth write FTextWidth;
      property TextHeight: Integer read FTextHeight write FTextHeight;

      property Alignment: TAlignment read FAlignment write SetAlignment;
      property Color: TColor read FColor write SetColor;
      property DisplayFormat: String read FDisplayFormat write SetDisplayFormat;
      property Font: TFont read FFont write SetFont;
      property Visible: Boolean read FVisible write SetVisible default True;

    published
      property ChildType;

  end; {class, TppElement}

  { TppDimension }
  TppDimension = class(TppElement)
    private
      FFieldName: String;
      FFieldAlias: String;
      FNullOrder: TppNullOrderType;
      FSkip: Boolean;
      FSkipNulls: Boolean;
      FSortType: TppSortOrderType;
      FSubTotals: TList;

      function  GetSubTotal(aIndex: Integer): TppSubTotal;
      function  GetSubTotalCount: Integer;
      procedure SetNullOrder(aNullOrder: TppNullOrderType);
      procedure SetSortType(aSortType: TppSortOrderType);
      function  GetSkip: Boolean;

    protected
      procedure SaveComponents(Proc: TGetChildProc); override;

      procedure SetSkipNulls(aValue: Boolean); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure AddChild(aChild: TppRelative); override;
      function  IndexOfChild(aChild: TppRelative): Integer; override;
      function  RemoveChild(aChild: TppRelative): Integer; override;

      procedure MoveChild(aChild: TppRelative; aNewIndex: Integer);

      procedure Clear;
      function  GetIndex: Integer;
      procedure ShowSubTotals(aValue: Boolean);

      function  GetCaption: String; virtual;
      function  GetFieldDataType: TppDataType;
      function  GetDataType: TppDataType; override;
      function  GetName: String; override;
      function  GetValue: Variant; virtual;

      property NullOrder: TppNullOrderType read FNullOrder write SetNullOrder default ctnoLast;
      property SubTotalCount: Integer read GetSubTotalCount;
      property SubTotals[Index: Integer]: TppSubTotal read GetSubTotal;
      property Skip: Boolean read GetSkip;
      property SkipNulls: Boolean read FSkipNulls write SetSkipNulls default True;
      property SortType: TppSortOrderType read FSortType write SetSortType default soAscending;

    published
      property FieldAlias: String read FFieldAlias write FFieldAlias;
      property FieldName: String read FFieldName write FFieldName;

  end; {class, TppDimension}

  { TppColumnDef }
  TppColumnDef = class(TppDimension)
    public
      constructor Create(aOwner: TComponent); override;

    published
      property Alignment default taLeftJustify;
      property Color;
      property DisplayFormat;
      property FieldAlias;
      property FieldName;
      property Font;
      property NullOrder;
      property SkipNulls;
      property SortType;

  end; {class, TppColumnDef}

  { TppRowDef }
  TppRowDef = class(TppDimension)
    public
      constructor Create(aOwner: TComponent); override;

    published
      property Alignment default taLeftJustify;
      property Color;
      property DisplayFormat;
      property FieldAlias;
      property FieldName;
      property Font;
      property NullOrder;
      property SkipNulls;
      property SortType;

  end; {class, TppRowDef}

  { TppValueDef }
  TppValueDef = class(TppDimension)
    private
      FCaptionDef: TppValueCaptionDef;

      function  GetCalcType: TppDBCalcType;
      function  GetSkipNulls: Boolean;
      procedure SetCalcType(aCalcType: TppDBCalcType);

    protected
      procedure SetDisplayFormat(const aFormat: String); override;
      procedure SetSkipNulls(aValue: Boolean); override;
      
      {overridden from relative}
      procedure SaveComponents(Proc: TGetChildProc); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      {overridden from relative}
      procedure AddChild(aChild: TppRelative); override;
      function  RemoveChild(aChild: TppRelative): Integer; override;

      procedure DoOnCalcValue(var aValue: Variant);

      function  GetDesignName: String; override;
      function  GetName: String; override;
      function  GetDataType: TppDataType; override;

      property CalcType: TppDBCalcType read GetCalcType write SetCalcType;
      property CaptionDef: TppValueCaptionDef read FCaptionDef;
      property SkipNulls: Boolean read GetSkipNulls write SetSkipNulls;

    published
      property Alignment default taRightJustify;
      property Color;
      property DisplayFormat;
      property FieldAlias;
      property FieldName;
      property Font;
  end; {class, TppValueDef}

  { TppValueCaptionDef }
  TppValueCaptionDef = class(TppElement)
    private
      FCalcType: TppDBCalcType;
      FSkipNulls: Boolean;

      procedure SetCalcType(aCalcType: TppDBCalcType);
      procedure SetSkipNulls(aValue: Boolean);

    public
      constructor Create(aOwner: TComponent); override;

      procedure Assign(Source: TPersistent); override;

      function  GetDesignName: String; override;
      function  GetName: String; override;

    published
      property Alignment default taLeftJustify;
      property CalcType: TppDBCalcType read FCalcType write SetCalcType;
      property Color;
      property Font;
      property SkipNulls: Boolean read FSkipNulls write SetSkipNulls default True;
  end; {class, TppValueCaptionDef}

  { TppTotalDef }
  TppTotalDef = class(TppElement)
    public
      constructor Create(aOwner: TComponent); override;

      function  GetDesignName: String; override;
      function  GetName: String; override;
      function  GetDataType: TppDataType; override;

    published
      property Alignment default taRightJustify;
      property Color;
      property DisplayFormat;
      property Font;
      property Visible;
  end; {class, TppTotalDef}

  { TppTotalCaptionDef }
  TppTotalCaptionDef = class(TppElement)
    public
      constructor Create(aOwner: TComponent); override;

      function  GetName: String; override;

    published
      property Alignment default taLeftJustify;
      property Color;
      property Font;
      property Visible;
  end; {class, TppTotalCaptionDef}

  { TppTotal }
  TppTotal = class(TppRelative)
    private
      FCaptionDef: TppTotalCaptionDef;
      FTotalDef: TppTotalDef;

      function  GetValueDefIndex: Integer;
      function  GetVisible: Boolean;
      procedure SetVisible(aValue: Boolean);

    protected
      procedure SaveComponents(Proc: TGetChildProc); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      {overridden from relative}
      procedure AddChild(aChild: TppRelative); override;
      function  RemoveChild(aChild: TppRelative): Integer; override;

      function  CrossTab: TppCrossTab;
      function  GetValueDef: TppValueDef;

      property CaptionDef: TppTotalCaptionDef read FCaptionDef;
      property TotalDef: TppTotalDef read FTotalDef;
      property Visible: Boolean read GetVisible write SetVisible;

    published
      property ChildType;
      property ValueDefIndex: Integer read GetValueDefIndex;

  end; {class, TppTotal}

  { TppSubTotal }
  TppSubTotal = class(TppTotal)
    public
      constructor Create(aOwner: TComponent); override;

      function  GetDimension: TppDimension;
  end; {class, TppSubTotal}

  { TppGrandTotal }
  TppGrandTotal = class(TppTotal)
  end; {class, TppGrandTotal}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppCrossTabRTTI }
  TraTppCrossTabRTTI = class(TraTppStretchableRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCrossTabRTTI}

  { TraTppElementRTTI }
  TraTppElementRTTI = class(TraTppRelativeRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppElementRTTI}

  { TraTppDimensionRTTI }
  TraTppDimensionRTTI = class(TraTppElementRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppDimensionRTTI}

  { TraTppValueDefRTTI }
  TraTppValueDefRTTI = class(TraTppDimensionRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppValueDefRTTI}

  { TraTppTotalRTTI }
  TraTppTotalRTTI = class(TraTppRelativeRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppTotalRTTI}


implementation

uses
  ppCTEng, ppCTRend;
  
{------------------------------------------------------------------------------}
{ ctDataTypeToDisplayString }

function ctDataTypeToDisplayString(aDataType: TppDataType; const aDisplayFormat: String): String;
var
  lValue: Variant;
begin

  Result := '';
  
  if (aDisplayFormat = '') then
      case aDataType of
        dtInteger, dtLongint:  Result := '1000';
        dtSingle, dtDouble, dtExtended: Result := '1000.00';
        dtCurrency: Result := '1000';
        dtDate:     Result := DateToStr(EncodeDate(2000, 1, 1));
        dtTime:     Result := TimeToStr(EncodeTime(3, 30, 0, 0));
        dtDateTime: Result := DateToStr(EncodeDate(2000, 1, 1) + EncodeTime(3, 30, 0, 0));
      end
  else
    begin
      case aDataType of
        dtInteger, dtLongint:  lValue := 1000;
        dtSingle, dtDouble, dtExtended: lValue := 1000.00;
        dtCurrency: lValue := 1000;
        dtDate:     lValue := EncodeDate(2000, 1, 1);
        dtTime:     lValue := EncodeTime(3, 30, 0, 0);
        dtDateTime: lValue := EncodeDate(2000, 1, 1) + EncodeTime(3, 30, 0, 0);
      end;

      Result := ppFormat(aDisplayFormat, aDataType, lValue)
    end;

end; {function, ctDataTypeToDisplayString}

{------------------------------------------------------------------------------}
{ ctAssignChild }

procedure ctAssignChild(aChild: TppRelative; aOwner: TComponent; aParent: TppRelative);
var
  lNewChild: TppRelative;
  lClass: TppRelativeClass;
begin

  if (aChild = nil) then Exit;

  {get an instance of the class}
  lClass := TppRelativeClass(aChild.ClassType);

  {instantiate a data view of the selected type}
  if (lClass <> nil) then
    begin
      lNewChild := lClass.Create(aOwner);
      lNewChild.Assign(aChild);
      lNewChild.ChildType := aChild.ChildType;
      lNewChild.Parent := aParent;
    end;

end; {procedure, ctAssignChild}

{------------------------------------------------------------------------------}
{ ctAssignChildren }

procedure ctAssignChildren(aList: TList; aOwner: TComponent; aParent: TppRelative);
var
  liIndex: Integer;
  lChild: TppRelative;
begin

  for liIndex := 0 to aList.Count - 1 do
    begin
      lChild := TppRelative(aList[liIndex]);

      ctAssignChild(lChild, aOwner, aParent);
  end; {each, child}

end; {procedure, ctAssignChildren}

{------------------------------------------------------------------------------}
{ ctFreeChildren }

procedure ctFreeChildren(aList: TList);
var
  liIndex: Integer;
begin

  for liIndex := aList.Count - 1 downto 0 do
    TppRelative(aList[liIndex]).Free;

  aList.Clear;

end; {procedure, ctFreeChildren}

{******************************************************************************
 *
 **  S T A T U S   T I M E R
 *
{******************************************************************************}

type

  { TppCrossTabStatusTimer }
  TppCrossTabStatusTimer = class(TTimer)
    private
      FCrossTab: TppCrossTab;

      procedure TimerEvent(Sender: TObject);

    public
      constructor CreateTimer(aInterval: Integer; aCrossTab: TppCrossTab);

  end;

{------------------------------------------------------------------------------}
{ TppCrossTabStatusTimer.Create }

constructor TppCrossTabStatusTimer.CreateTimer(aInterval: Integer; aCrossTab: TppCrossTab);
begin

  inherited Create(aCrossTab);

  FCrossTab := aCrossTab;

  Interval := aInterval;

  OnTimer := TimerEvent;
  
end; {constructor, CreateTimer}

{------------------------------------------------------------------------------}
{ TppCrossTabStatusTimer.TimerEvent }

procedure TppCrossTabStatusTimer.TimerEvent(Sender: TObject);
begin
  FCrossTab.SetPrintMessage(FCrossTab.Status);
end; {procedure, TimerEvent}

{******************************************************************************
 *
 ** C R O S S T A B
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCrossTab.Create }

constructor TppCrossTab.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  {set inherited properties}
  CacheRecordSize := SizeOf(TppCrossTabSaveRec);
  ParentWidth := True;
  spHeight := 19;
  Stretch := True;

  FAssigning := False;
  FAvailableDimensions := TStringList.Create;
  FCalculating := False;
  FClearing := False;
  FColumnDefs := TList.Create;
  FColumnGrandTotals := TList.Create;
  FCrossTabId := 0;
  FDraw := True;
  FEngine := TppCrossTabEngine.Create(Self);
  FLastCalcId := -1;
  FStatusTimer := nil;
  FModified := False;
  FRowGrandTotals := TList.Create;
  FGridLines := True;
  FOnCalcDimensionValue := nil;
  FOnDimensionChange := nil;
  FOnDimensionChange2 := nil;
  FOnFormatCell := nil;
  FOnGetCaptionText := nil;
  FOnGetDimensionName := nil;
  FOnGetDimensionCaption := nil;
  FOnGetDimensionValue := nil;
  FOnGetValueText := nil;
  FOnGetTotalCaptionText := nil;
  FOnGetTotalValueText := nil;
  FOnTraverseRecord := nil;
  FPagination := ctptDownThenAcross;
  FRenderer := nil;
  FRowDefs := TList.Create;
  FStyle := TppCrossTabRenderer.Description;
  FValueDefs := TList.Create;

  {properties inherited from TppPrintable}
  DefaultPropName     := 'DataPipeline';
  DefaultPropEditType := etDataPipelineList;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCrossTab.Destroy }

destructor TppCrossTab.Destroy;
begin

  Clear;

  FAvailableDimensions.Free;
  FColumnDefs.Free;
  FColumnGrandTotals.Free;
  FEngine.Free;
  FRenderer.Free;
  FRowGrandTotals.Free;
  FRowDefs.Free;
  FValueDefs.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCrossTab.Assign }

procedure TppCrossTab.Assign(Source: TPersistent);
var
  lCrossTab: TppCrossTab;
begin

  if not(Source is TppCrossTab) then Exit;

  FAssigning := True;

  {free all child objects}
  Clear;

  lCrossTab := TppCrossTab(Source);

  SetDataPipeline(lCrossTab.DataPipeline);

  ctAssignChildren(lCrossTab.FColumnGrandTotals, Self, Self);
  ctAssignChildren(lCrossTab.FRowGrandTotals, Self, Self);
  ctAssignChildren(lCrossTab.FColumnDefs, Self, Self);
  ctAssignChildren(lCrossTab.FRowDefs, Self, Self);
  ctAssignChildren(lCrossTab.FValueDefs, Self, Self);

  FAfterCalc := lCrossTab.FAfterCalc;
  FBeforeCalc := lCrossTab.FBeforeCalc;
  FGridLines := lCrossTab.FGridLines;
  FOnCalcDimensionValue := lCrossTab.FOnCalcDimensionValue;;
  FOnGetDimensionName := lCrossTab.FOnGetDimensionName;;
  FOnGetDimensionCaption := lCrossTab.FOnGetDimensionCaption;;
  FOnGetDimensionValue := lCrossTab.FOnGetDimensionValue;;
  FOnTraverseRecord := lCrossTab.FOnTraverseRecord;

  FAssigning := False;

  FModified := False;
  
end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppCrossTab.Status }

function TppCrossTab.Status: String;
begin

  if (FEngine <> nil) and (FCalculating) then
    Result := TppCrossTabEngine(FEngine).Status

  else if (FRenderer <> nil) then
    Result := TppCustomCrossTabRenderer(FRenderer).Status

  else
    Result := '';

end; {function, MessageTimerEvent}

{------------------------------------------------------------------------------}
{ TppCrossTab.SaveComponents }

procedure TppCrossTab.SaveComponents(Proc: TGetChildProc);
var
  liIndex: Integer;
begin

  inherited SaveComponents(Proc);

  for liIndex := 0 to (FColumnGrandTotals.Count - 1) do
    Proc(FColumnGrandTotals[liIndex]);

  for liIndex := 0 to (FRowGrandTotals.Count - 1) do
    Proc(FRowGrandTotals[liIndex]);

  for liIndex := 0 to (FColumnDefs.Count - 1) do
    Proc(FColumnDefs[liIndex]);

  for liIndex := 0 to (FRowDefs.Count - 1) do
    Proc(FRowDefs[liIndex]);

  for liIndex := 0 to (FValueDefs.Count - 1) do
    Proc(FValueDefs[liIndex]);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TppCrossTab.Clear }

procedure TppCrossTab.Clear;
begin

  FClearing := True;

  FAvailableDimensions.Clear;

  ctFreeChildren(FColumnGrandTotals);
  ctFreeChildren(FRowGrandTotals);
  ctFreeChildren(FColumnDefs);
  ctFreeChildren(FRowDefs);
  ctFreeChildren(FValueDefs);

  TppCrossTabEngine(FEngine).Clear;
  
  FClearing := False;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppCrossTab.Notify }

procedure TppCrossTab.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoOnFormatCell }

procedure TppCrossTab.DoOnFormatCell(aElement: TppElement; aColumn, aRow: Integer);
var
  lParams: TraParamList;
begin

  if Assigned(FOnFormatCell) then FOnFormatCell(Self, aElement, aColumn, aRow);

  lParams := TraTppCrossTabRTTI.GetParams('OnFormatCell');
  lParams.CreateValuePointer(0, aElement);
  lParams.CreateValuePointer(1, aColumn);
  lParams.CreateValuePointer(2, aRow);

  SendEventNotify(Self, ciCrossTabFormatCell, lParams);

  lParams.Free;

end; {procedure, DoOnFormatCell}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoOnGetCaptionText }

procedure TppCrossTab.DoOnGetCaptionText(aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
var
  lParams: TraParamList;
  lsDisplayFormat: String;
begin

  if Assigned(FOnGetCaptionText) then FOnGetCaptionText(Self, aElement, aColumn, aRow, aDisplayFormat, aValue, aText);

  lsDisplayFormat := aDisplayFormat;

  lParams := TraTppCrossTabRTTI.GetParams('OnGetCaptionText');
  lParams.CreateValuePointer(0, aElement);
  lParams.CreateValuePointer(1, aColumn);
  lParams.CreateValuePointer(2, aRow);
  lParams.CreateValuePointer(3, lsDisplayFormat);
  lParams.CreateValuePointer(4, aValue);
  lParams.CreateValuePointer(5, aText);

  SendEventNotify(Self, ciCrossTabGetCaptionText, lParams);

  lParams.Free;

end; {procedure, DoOnGetCaptionText}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoOnGetTotalCaptionText }

procedure TppCrossTab.DoOnGetTotalCaptionText(aElement: TppElement; aColumn, aRow: Integer; var aText: String);
var
  lParams: TraParamList;
begin

  if Assigned(FOnGetTotalCaptionText) then FOnGetTotalCaptionText(Self, aElement, aColumn, aRow, aText);

  lParams := TraTppCrossTabRTTI.GetParams('OnGetTotalCaptionText');
  lParams.CreateValuePointer(0, aElement);
  lParams.CreateValuePointer(1, aColumn);
  lParams.CreateValuePointer(2, aRow);
  lParams.CreateValuePointer(3, aText);

  SendEventNotify(Self, ciCrossTabGetTotalCaptionText, lParams);

  lParams.Free;

end; {procedure, DoOnGetTotalCaptionText}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoOnGetTotalValueText }

procedure TppCrossTab.DoOnGetTotalValueText(aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
var
  lParams: TraParamList;
  lsDisplayFormat: String;
begin

  if Assigned(FOnGetTotalValueText) then FOnGetTotalValueText(Self, aElement, aColumn, aRow, aDisplayFormat, aValue, aText);

  lsDisplayFormat := aDisplayFormat;

  lParams := TraTppCrossTabRTTI.GetParams('OnGetTotalValueText');
  lParams.CreateValuePointer(0, aElement);
  lParams.CreateValuePointer(1, aColumn);
  lParams.CreateValuePointer(2, aRow);
  lParams.CreateValuePointer(3, lsDisplayFormat);
  lParams.CreateValuePointer(4, aValue);
  lParams.CreateValuePointer(5, aText);

  SendEventNotify(Self, ciCrossTabGetValueText, lParams);

  lParams.Free;

end; {procedure, DoOnGetTotalValueText}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoOnGetValueText }

procedure TppCrossTab.DoOnGetValueText(aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
var
  lParams: TraParamList;
  lsDisplayFormat: String;
begin

  if Assigned(FOnGetValueText) then FOnGetValueText(Self, aElement, aColumn, aRow, aDisplayFormat, aValue, aText);

  lsDisplayFormat := aDisplayFormat;

  lParams := TraTppCrossTabRTTI.GetParams('OnGetValueText');
  lParams.CreateValuePointer(0, aElement);
  lParams.CreateValuePointer(1, aColumn);
  lParams.CreateValuePointer(2, aRow);
  lParams.CreateValuePointer(3, lsDisplayFormat);
  lParams.CreateValuePointer(4, aValue);
  lParams.CreateValuePointer(5, aText);

  SendEventNotify(Self, ciCrossTabGetValueText, lParams);

  lParams.Free;

end; {procedure, DoOnGetValueText}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoOnCalcDimensionValue }

procedure TppCrossTab.DoOnCalcDimensionValue(aDimension: TppDimension; var aValue: Variant);
var
  lParams: TraParamList;
begin

  if Assigned(FOnCalcDimensionValue) then FOnCalcDimensionValue(Self, aDimension, aValue);

  lParams := TraTppCrossTabRTTI.GetParams('OnCalcDimensionValue');
  lParams.CreateValuePointer(0, aDimension);
  lParams.CreateValuePointer(1, aValue);

  SendEventNotify(Self, ciCrossTabCalcDimensionValue, lParams);

  lParams.Free;

end; {procedure, DoOnCalcDimensionValue}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoOnGetDimensionCaption }

procedure TppCrossTab.DoOnGetDimensionCaption(aDimension: TppDimension; var aCaption: String);
var
  lParams: TraParamList;
begin

  if Assigned(FOnGetDimensionCaption) then FOnGetDimensionCaption(Self, aDimension, aCaption);

  lParams := TraTppCrossTabRTTI.GetParams('OnGetDimensionCaption');
  lParams.CreateValuePointer(0, aDimension);
  lParams.CreateValuePointer(1, aCaption);

  SendEventNotify(Self, ciCrossTabGetDimensionCaption, lParams);

  lParams.Free;

end; {procedure, DoOnGetDimensionCaption}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoOnGetDimensionName }

procedure TppCrossTab.DoOnGetDimensionName(aDimension: TppDimension; var aName: String);
var
  lParams: TraParamList;
begin

  if Assigned(FOnGetDimensionName) then FOnGetDimensionName(Self, aDimension, aName);

  lParams := TraTppCrossTabRTTI.GetParams('OnGetDimensionName');
  lParams.CreateValuePointer(0, aDimension);
  lParams.CreateValuePointer(1, aName);

  SendEventNotify(Self, ciCrossTabGetDimensionName, lParams);

  lParams.Free;

end; {procedure, DoOnGetDimensionName}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoOnGetDimensionValue }

procedure TppCrossTab.DoOnGetDimensionValue(aDimension: TppDimension; var aValue: Variant; var aSkip: Boolean);
var
  lParams: TraParamList;
begin

  if Assigned(FOnGetDimensionValue) then FOnGetDimensionValue(Self, aDimension, aValue, aSkip);

  lParams := TraTppCrossTabRTTI.GetParams('OnGetDimensionValue');
  lParams.CreateValuePointer(0, aDimension);
  lParams.CreateValuePointer(1, aValue);
  lParams.CreateValuePointer(2, aSkip);

  SendEventNotify(Self, ciCrossTabGetDimensionValue, lParams);

  lParams.Free;

end; {procedure, DoOnGetDimensionValue}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoOnTraverseRecord }

procedure TppCrossTab.DoOnTraverseRecord(aDataPipeline: TppDataPipeline; var aSkipRecord: Boolean);
var
  lParams: TraParamList;
begin

  if Assigned(FOnTraverseRecord) then FOnTraverseRecord(Self, aDataPipeline, aSkipRecord);

  lParams := TraTppCrossTabRTTI.GetParams('OnTraverseRecord');
  lParams.CreateValuePointer(0, aDataPipeline);
  lParams.CreateValuePointer(1, aSkipRecord);

  SendEventNotify(Self, ciCrossTabTraverseRecord, lParams);

  lParams.Free;

end; {procedure, DoOnTraverseRecord}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoBeforeCalc }

procedure TppCrossTab.DoBeforeCalc;
begin

  if Assigned(FBeforeCalc) then FBeforeCalc(Self);

  SendEventNotify(Self, ciCrossTabBeforeCalc, nil);

end; {procedure, DoBeforeCalc}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoAfterCalc }

procedure TppCrossTab.DoAfterCalc;
begin

  if Assigned(FAfterCalc) then FAfterCalc(Self);

  SendEventNotify(Self, ciCrossTabAfterCalc, nil);

end; {procedure, DoAfterCalc}



{------------------------------------------------------------------------------}
{ TppCrossTab.SetStyle }

procedure TppCrossTab.SetStyle(aValue: String);
var
  lClass: TppCrossTabRendererClass;

begin

  if (FStyle = aValue) then Exit;

  lClass := ppRendererClassForDescription(aValue);

  {backward compatibility }
  if (lClass = nil) then
    lClass := ppRendererClassForName(aValue);

  if (lClass = nil) then Exit;

  FStyle := lClass.Description;

  FRenderer.Free;
  FRenderer := nil;

  SetModified(True);

end; {procedure, SetStyle}

{------------------------------------------------------------------------------}
{ TppCrossTab.SetGridLines }

procedure TppCrossTab.SetGridLines(aValue: Boolean);
begin

  FGridLines := aValue;

  SetModified(True);

end; {procedure, SetGridLines}

{------------------------------------------------------------------------------}
{ TppCrossTab.SetPagination }

procedure TppCrossTab.SetPagination(aValue: TppCrossTabPaginationType);
begin

  FPagination := aValue;

  SetModified(True);

end; {procedure, SetPagination}

{------------------------------------------------------------------------------}
{ TppCrossTab.SetDraw }

procedure TppCrossTab.SetDraw(aValue: Boolean);
begin

  FDraw := aValue;

  SetModified(True);

end; {procedure, SetDraw}

{------------------------------------------------------------------------------}
{ TppCrossTab.SetModified }

procedure TppCrossTab.SetModified(aValue: Boolean);
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  FModified := aValue;

  PropertyChange;

  Reset;

end; {procedure, SetModified}

{------------------------------------------------------------------------------}
{ TppCrossTab.AddChild }

procedure TppCrossTab.AddChild(aChild: TppRelative);
begin

  case TppCrossTabChildType(aChild.ChildType) of

    ctctColumnGrandTotal: FColumnGrandTotals.Add(aChild);

    ctctRowGrandTotal: FRowGrandTotals.Add(aChild);

    ctctRowDef:
      begin
        FRowDefs.Add(aChild);

        DimensionAdded(TppDimension(aChild));

        DoOnDimensionChange;
      end;

    ctctColumnDef:
      begin
        FColumnDefs.Add(aChild);

        DimensionAdded(TppDimension(aChild));

        DoOnDimensionChange;
      end;

    ctctValueDef:
      begin
        FValueDefs.Add(aChild);

        ValueDefAdded(TppValueDef(aChild));

        DoOnDimensionChange;
      end;

    else
      inherited AddChild(aChild);
  end;

  SetModified(True);

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TppCrossTab.MoveChild }

procedure TppCrossTab.MoveChild(aChild: TppRelative; aNewIndex: Integer);
var
  liCurrentIndex: Integer;
begin

  liCurrentIndex := IndexOfChild(aChild);

  case TppCrossTabChildType(aChild.ChildType) of

    ctctColumnGrandTotal: FColumnGrandTotals.Move(liCurrentIndex, aNewIndex);
    ctctRowGrandTotal: FRowGrandTotals.Move(liCurrentIndex, aNewIndex);

    ctctRowDef:
      begin
        FRowDefs.Move(liCurrentIndex, aNewIndex);

        DoOnDimensionChange;
      end;

    ctctColumnDef:
      begin
        FColumnDefs.Move(liCurrentIndex, aNewIndex);

        DoOnDimensionChange;
      end;

    ctctValueDef:
      begin
        FValueDefs.Move(liCurrentIndex, aNewIndex);

        ValueDefMoved(liCurrentIndex, aNewIndex);

        DoOnDimensionChange;
      end;

  end;

  SetModified(True);

end; {procedure, MoveChild}

{------------------------------------------------------------------------------}
{ TppCrossTab.InsertChild }

procedure TppCrossTab.InsertChild(aPosition: Integer; aChild: TppRelative);
begin

  case TppCrossTabChildType(aChild.ChildType) of

    ctctRowDef:
      begin
        FRowDefs.Insert(aPosition, aChild);

        DimensionAdded(TppDimension(aChild));
      end;

    ctctColumnDef:
      begin
        FColumnDefs.Insert(aPosition, aChild);

        DimensionAdded(TppDimension(aChild));
      end;

    ctctValueDef:
      begin
        FValueDefs.Insert(aPosition, aChild);

        ValueDefAdded(TppValueDef(aChild));
      end;

  end;

  SetModified(True);

end; {procedure, InsertChild}

{------------------------------------------------------------------------------}
{ TppCrossTab.IndexOfChild }

function TppCrossTab.IndexOfChild(aChild: TppRelative): Integer;
begin

  Result := -1;

  if (aChild = nil) then Exit;

  case TppCrossTabChildType(aChild.ChildType) of
    ctctColumnGrandTotal: Result := FColumnGrandTotals.IndexOf(aChild);
    ctctRowGrandTotal:    Result := FRowGrandTotals.IndexOf(aChild);
    ctctRowDef:           Result := FRowDefs.IndexOf(aChild);
    ctctColumnDef:        Result := FColumnDefs.IndexOf(aChild);
    ctctValueDef:         Result := FValueDefs.IndexOf(aChild);
  else
    Result := inherited IndexOfChild(aChild);
  end;

end; {procedure, IndexOfChild}

{------------------------------------------------------------------------------}
{ TppCrossTab.RemoveChild }

function TppCrossTab.RemoveChild(aChild: TppRelative): Integer;
var
  liIndex: Integer;
begin

  liIndex := IndexOfChild(aChild);

  Result := liIndex;

  if (liIndex = -1) then Exit;

  case TppCrossTabChildType(aChild.ChildType) of

    ctctColumnGrandTotal: FColumnGrandTotals.Delete(liIndex);

    ctctRowGrandTotal: FRowGrandTotals.Delete(liIndex);

    ctctRowDef:
      begin
        DimensionRemoved(TppDimension(aChild));

        FRowDefs.Delete(liIndex);
      end;

    ctctColumnDef:
      begin
        DimensionRemoved(TppDimension(aChild));

        FColumnDefs.Delete(liIndex);
      end;

    ctctValueDef:
      begin
        ValueDefRemoved(TppValueDef(aChild));

        FValueDefs.Delete(liIndex);
      end;
      
    else
      Result := inherited RemoveChild(aChild);
  end;

  SetModified(True);

end; {procedure, RemoveChild}

{------------------------------------------------------------------------------}
{ TppCrossTab.DimensionAdded }

procedure TppCrossTab.DimensionAdded(aDimension: TppDimension);
var
  lSubTotal: TppSubTotal;
  liIndex: Integer;
begin

  if (csReading in ComponentState) or
     (csWriting in ComponentState) or
     (csLoading in ComponentState) or
     FAssigning or FClearing then Exit;

  {create subtotal for each value def}
  for liIndex := 0 to ValueDefCount - 1 do
    begin
      lSubTotal := TppSubTotal.Create(aDimension);
      lSubTotal.Parent := aDimension;

      lSubTotal.TotalDef.DisplayFormat := ValueDefs[liIndex].DisplayFormat;
    end;

end; {procedure, DimensionAdded}

{------------------------------------------------------------------------------}
{ TppCrossTab.DimensionRemoved }

procedure TppCrossTab.DimensionRemoved(aDimension: TppDimension);
var
  liIndex: Integer;
begin

  if (csReading in ComponentState) or
     (csWriting in ComponentState) or
     (csLoading in ComponentState) or
     (csDestroying in ComponentState) or
     FAssigning or FClearing then Exit;

  {free subtotal for each value def}
  for liIndex := 0 to aDimension.SubTotalCount - 1 do
    aDimension.SubTotals[0].Free;

end; {procedure, DimensionRemoved}

{------------------------------------------------------------------------------}
{ TppCrossTab.DoOnDimensionChange }

procedure TppCrossTab.DoOnDimensionChange;
begin
  if Assigned(FOnDimensionChange) then FOnDimensionChange(Self);
  if Assigned(FOnDimensionChange2) then FOnDimensionChange2(Self);
end; {procedure, DoOnDimensionChange}

{------------------------------------------------------------------------------}
{ TppCrossTab.ValueDefAdded }

procedure TppCrossTab.ValueDefAdded(aValueDef: TppValueDef);
var
  lGrandTotal: TppGrandTotal;
  lSubTotal: TppSubTotal;
  liIndex: Integer;
  lDimension: TppDimension;
  lbVisible: Boolean;
begin

  if (csReading in ComponentState) or
     (csWriting in ComponentState) or
     (csLoading in ComponentState) or
     FAssigning or FClearing then Exit;

  {add column grand total}
  if (ColumnGrandTotalCount > 0) then
    lbVisible := ColumnGrandTotals[0].CaptionDef.Visible
  else
    lbVisible := True;

  lGrandTotal := TppGrandTotal.Create(Self);
  lGrandTotal.ChildType := Ord(ctctColumnGrandTotal);
  lGrandTotal.CaptionDef.Alignment := taRightJustify;
  lGrandTotal.Visible := lbVisible;
  lGrandTotal.Parent := Self;

  {add row grand total}
  lGrandTotal := TppGrandTotal.Create(Self);
  lGrandTotal.ChildType := Ord(ctctRowGrandTotal);
  lGrandTotal.Parent := Self;

  {add subtotal for each column def}
  for liIndex := 0 to ColumnDefCount - 1 do
    begin
      lDimension := ColumnDefs[liIndex];

      if (lDimension.SubTotalCount > 0) then
        lbVisible := lDimension.SubTotals[0].CaptionDef.Visible
      else
        lbVisible := True;

      lSubTotal := TppSubTotal.Create(lDimension);
      lSubTotal.Visible := lbVisible;
      lSubTotal.Parent := lDimension;
    end;

  {add subtotal for each row def}
  for liIndex := 0 to RowDefCount - 1 do
    begin
      lDimension := RowDefs[liIndex];

      lSubTotal := TppSubTotal.Create(lDimension);
      lSubTotal.Parent := lDimension;
    end;

end; {procedure, ValueDefAdded}

{------------------------------------------------------------------------------}
{ TppCrossTab.ValueDefRemoved }

procedure TppCrossTab.ValueDefRemoved(aValueDef: TppValueDef);
var
  liIndex: Integer;
  liValueDefIndex: Integer;
begin

  if (csReading in ComponentState) or
     (csWriting in ComponentState) or
     (csLoading in ComponentState) or
     (csDestroying in ComponentState) or
     FAssigning or FClearing then Exit;

  liValueDefIndex := aValueDef.GetIndex;

  {remove grand total}
  ColumnGrandTotals[liValueDefIndex].Free;
  RowGrandTotals[liValueDefIndex].Free;

  {remove subtotal for each column def}
  for liIndex := 0 to ColumnDefCount - 1 do
    ColumnDefs[liIndex].SubTotals[liValueDefIndex].Free;

  {remove subtotal for each row def}
  for liIndex := 0 to RowDefCount - 1 do
    RowDefs[liIndex].SubTotals[liValueDefIndex].Free;

end; {procedure, ValueDefRemoved}

{------------------------------------------------------------------------------}
{ TppCrossTab.ValueDefMoved }

procedure TppCrossTab.ValueDefMoved(aOldIndex, aNewIndex: Integer);
var
  liIndex: Integer;
  lDimension: TppDimension;
begin

  {move grand total}
  MoveChild(ColumnGrandTotals[aOldIndex], aNewIndex);

  MoveChild(RowGrandTotals[aOldIndex], aNewIndex);

  {remove subtotal for each column def}
  for liIndex := 0 to ColumnDefCount - 1 do
    begin
      lDimension := ColumnDefs[liIndex];

      lDimension.MoveChild(lDimension.SubTotals[aOldIndex], aNewIndex);
    end;

  {remove subtotal for each row def}
  for liIndex := 0 to RowDefCount - 1 do
    begin
      lDimension := RowDefs[liIndex];

      lDimension.MoveChild(lDimension.SubTotals[aOldIndex], aNewIndex);
    end;

end; {procedure, ValueDefMoved}

{------------------------------------------------------------------------------}
{ TppCrossTab.VisibleColumnGrandTotalCount }

function TppCrossTab.VisibleColumnGrandTotalCount: Integer;
begin

  Result := 0;

  if (ColumnDefCount = 0) then Exit;

  if ColumnGrandTotals[0].CaptionDef.Visible then
    Inc(Result);

end; {function, VisibleColumnGrandTotalCount}

{------------------------------------------------------------------------------}
{ TppCrossTab.IndexOfColumnGrandTotal }

function TppCrossTab.IndexOfColumnGrandTotal(aGrandTotal: TppGrandTotal): Integer;
begin
  Result := FColumnGrandTotals.IndexOf(aGrandTotal);
end; {function, IndexOfColumnGrandTotal}

{------------------------------------------------------------------------------}
{ TppCrossTab.VisibleRowGrandTotalCount }

function TppCrossTab.VisibleRowGrandTotalCount: Integer;
var
  liIndex: Integer;
begin

  Result := 0;

  if (RowDefCount = 0) then Exit;

  for liIndex := 0 to ValueDefCount - 1 do
    if RowGrandTotals[liIndex].CaptionDef.Visible then
      Inc(Result);

end; {function, VisibleRowGrandTotalCount}

{------------------------------------------------------------------------------}
{ TppCrossTab.IndexOfRowGrandTotal }

function TppCrossTab.IndexOfRowGrandTotal(aGrandTotal: TppGrandTotal): Integer;
begin
  Result := FRowGrandTotals.IndexOf(aGrandTotal);
end; {function, IndexOfRowGrandTotal}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetColumnGrandTotal }

function TppCrossTab.GetColumnGrandTotal(aIndex: Integer): TppGrandTotal;
begin
  Result := TppGrandTotal(FColumnGrandTotals[aIndex]);
end; {function, GetGrandTotal}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetColumnGrandTotalCount }

function TppCrossTab.GetColumnGrandTotalCount: Integer;
begin
  Result := FColumnGrandTotals.Count;
end; {function, GetColumnGrandTotalCount}

{------------------------------------------------------------------------------}
{ TppCrossTab.ShowGrandTotals }

procedure TppCrossTab.ShowGrandTotals(aTotalType: TppTotalType; aValue: Boolean);
begin

  case aTotalType of
    ctttAll:
      begin
        ShowColumnGrandTotals(aValue);
        ShowRowGrandTotals(aValue);
      end;

    ctttColumn: ShowColumnGrandTotals(aValue);

    ctttRow: ShowRowGrandTotals(aValue);
  end;

end; {procedure, ShowGrandTotals}

{------------------------------------------------------------------------------}
{ TppCrossTab.ShowSubTotals }

procedure TppCrossTab.ShowSubTotals(aTotalType: TppTotalType; aValue: Boolean);
begin

  case aTotalType of
    ctttAll:
      begin
        ShowColumnSubTotals(aValue);
        ShowRowSubTotals(aValue);
      end;

    ctttColumn: ShowColumnSubTotals(aValue);

    ctttRow: ShowRowSubTotals(aValue);
  end;

end; {procedure, ShowSubTotals}

{------------------------------------------------------------------------------}
{ TppCrossTab.ShowColumnGrandTotals }

procedure TppCrossTab.ShowColumnGrandTotals(aValue: Boolean);
var
  liIndex: Integer;
begin

  if (ValueDefCount = 0) then Exit;

  for liIndex := 0 to ColumnGrandTotalCount - 1 do
    ColumnGrandTotals[liIndex].Visible := aValue;

end; {procedure, ShowColumnGrandTotals}

{------------------------------------------------------------------------------}
{ TppCrossTab.ShowRowGrandTotals }

procedure TppCrossTab.ShowRowGrandTotals(aValue: Boolean);
var
  liIndex: Integer;
begin

  if (ValueDefCount = 0) then Exit;

  for liIndex := 0 to RowGrandTotalCount - 1 do
    RowGrandTotals[liIndex].Visible := aValue;

end; {procedure, ShowRowGrandTotals}

{------------------------------------------------------------------------------}
{ TppCrossTab.ShowColumnSubTotals }

procedure TppCrossTab.ShowColumnSubTotals(aValue: Boolean);
var
  liIndex: Integer;
  liIndex2: Integer;
  lDimension: TppDimension;
begin

  if (ValueDefCount = 0) then Exit;

  for liIndex := 0 to ColumnDefCount - 2 do
    begin
      lDimension := ColumnDefs[liIndex];

      for liIndex2 := 0 to lDimension.SubTotalCount - 1 do
        lDimension.SubTotals[liIndex2].Visible := aValue;

    end;

end; {procedure, ShowColumnSubTotals}

{------------------------------------------------------------------------------}
{ TppCrossTab.ShowRowSubTotals }

procedure TppCrossTab.ShowRowSubTotals(aValue: Boolean);
var
  liIndex: Integer;
  liIndex2: Integer;
  lDimension: TppDimension;
begin

  if (ValueDefCount = 0) then Exit;

  for liIndex := 0 to RowDefCount - 2 do
    begin
      lDimension := RowDefs[liIndex];

      for liIndex2 := 0 to lDimension.SubTotalCount - 1 do
        lDimension.SubTotals[liIndex2].Visible := aValue;

    end;

end; {procedure, ShowRowSubTotals}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetRowGrandTotal }

function TppCrossTab.GetRowGrandTotal(aIndex: Integer): TppGrandTotal;
begin
  Result := TppGrandTotal(FRowGrandTotals[aIndex]);
end; {function, GetGrandTotal}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetRowGrandTotalCount }

function TppCrossTab.GetRowGrandTotalCount: Integer;
begin
  Result := FRowGrandTotals.Count;
end; {function, GetRowGrandTotalCount}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetColumnDef }

function TppCrossTab.GetColumnDef(aIndex: Integer): TppColumnDef;
begin
  Result := TppColumnDef(FColumnDefs[aIndex]);
end; {function, GetColumnDef}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetColumnDefCount }

function TppCrossTab.GetColumnDefCount: Integer;
begin
  Result := FColumnDefs.Count;
end; {function, GetColumnDefCount}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetRowDef }

function TppCrossTab.GetRowDef(aIndex: Integer): TppRowDef;
begin
  Result := TppRowDef(FRowDefs[aIndex]);
end; {function, GetRowDef}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetRowDefCount }

function TppCrossTab.GetRowDefCount: Integer;
begin
  Result := FRowDefs.Count;
end; {function, GetRowDefCount}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetValueDef }

function TppCrossTab.GetValueDef(aIndex: Integer): TppValueDef;
begin
  Result := TppValueDef(FValueDefs[aIndex]);
end; {function, GetValueDef}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetValueDefCount }

function TppCrossTab.GetValueDefCount: Integer;
begin
  Result := FValueDefs.Count;
end; {function, GetValueDefCount}

{------------------------------------------------------------------------------}
{ TppCrossTab.IndexOfAvailableDimension }

function TppCrossTab.IndexOfAvailableDimension(const aFieldAlias: String): Integer;
begin
  Result := FAvailableDimensions.IndexOf(aFieldAlias);
end; {function, IndexOfAvailableDimension}

{------------------------------------------------------------------------------}
{ TppCrossTab.InitAvailableDimensions }

procedure TppCrossTab.InitAvailableDimensions;
var
  liIndex: Integer;
  lField: TppField;
  liPosition: Integer;
  lColumnDef: TppColumnDef;
  lRowDef: TppRowDef;
begin

  {future: exclude BLOB fields from list}

  FAvailableDimensions.Clear;

  if (DataPipeline = nil) then Exit;

  {get all aliases}
  for liIndex := 0 to DataPipeline.FieldCount - 1 do
    begin
      lField := DataPipeline.Fields[liIndex];

      FAvailableDimensions.AddObject(lField.FieldAlias, lField);
    end;

  {remove column defs}
  for liIndex := 0 to ColumnDefCount - 1 do
    begin
      lColumnDef := ColumnDefs[liIndex];

      liPosition := FAvailableDimensions.IndexOf(lColumnDef.FieldAlias);

      if (liPosition <> -1) then
        begin
          FAvailableDimensions.Delete(liPosition);

          lColumnDef.Tag := DataPipeline.IndexOfFieldName(lColumnDef.FieldName);
        end;
    end;

  {remove row defs}
  for liIndex := 0 to RowDefCount - 1 do
    begin
      lRowDef := RowDefs[liIndex];

      liPosition := FAvailableDimensions.IndexOf(lRowDef.FieldAlias);

      if (liPosition <> -1) then
        begin
          FAvailableDimensions.Delete(liPosition);

          lRowDef.Tag := DataPipeline.IndexOfFieldName(lRowDef.FieldName);
        end;
    end;

end; {procedure, InitAvailableDimensions}

{------------------------------------------------------------------------------}
{ TppCrossTab.CopyAvailableDimensions }

procedure TppCrossTab.CopyAvailableDimensions(aList: TStrings);
begin
  aList.Assign(FAvailableDimensions);
end; {procedure, CopyAvailableDimensions}

{------------------------------------------------------------------------------}
{ TppCrossTab.SelectColumnDef }

function TppCrossTab.SelectColumnDef(aIndex: Integer): TppColumnDef;
var
  lColumnDef: TppColumnDef;
  lField: TppField;
  lsFieldAlias: String;
begin

  lColumnDef := TppColumnDef.Create(Self);
  lColumnDef.Parent := Self;

  lsFieldAlias := FAvailableDimensions[aIndex];
  lField := DataPipeline.GetFieldForAlias(lsFieldAlias);

  lColumnDef.FieldAlias := lField.FieldAlias;
  lColumnDef.FieldName := lField.FieldName;
  lColumnDef.Tag := lField.Index;

  if (lField.DataType = dtBoolean) then
    lColumnDef.SortType := soDescending;

  FAvailableDimensions.Delete(aIndex);

  Result := lColumnDef;

  DoOnDimensionChange;

end; {function, SelectColumnDef}

{------------------------------------------------------------------------------}
{ TppCrossTab.SelectRowDef }

function TppCrossTab.SelectRowDef(aIndex: Integer): TppRowDef;
var
  lRowDef: TppRowDef;
  lField: TppField;
  lsFieldAlias: String;
begin

  lRowDef := TppRowDef.Create(Self);
  lRowDef.Parent := Self;

  lsFieldAlias := FAvailableDimensions[aIndex];
  lField := DataPipeline.GetFieldForAlias(lsFieldAlias);

  lRowDef.FieldAlias := lField.FieldAlias;
  lRowDef.FieldName := lField.FieldName;
  lRowDef.Tag := lField.Index;

  if (lField.DataType = dtBoolean) then
    lRowDef.SortType := soDescending;

  FAvailableDimensions.Delete(aIndex);

  Result := lRowDef;

  DoOnDimensionChange;

end; {function, SelectRowDef}

{------------------------------------------------------------------------------}
{ TppCrossTab.SelectValueDef }

function TppCrossTab.SelectValueDef(aIndex: Integer): TppValueDef;
var
  lValueDef: TppValueDef;
begin

  lValueDef := TppValueDef.Create(Self);
  lValueDef.Parent := Self;

  lValueDef.FieldAlias := FAvailableDimensions[aIndex];
  lValueDef.FieldName := DataPipeline.FieldNameForFieldAlias(lValueDef.FieldAlias);

  if not(lValueDef.GetDataType in ppNumerics) then
    lValueDef.CalcType := dcCount;

  Result := lValueDef;

  DoOnDimensionChange;

end; {function, SelectValueDef}

{------------------------------------------------------------------------------}
{ TppCrossTab.RestoreFieldToAvailableDimension }

function TppCrossTab.RestoreFieldToAvailableDimension(aDimension: TppDimension): Integer;
var
  lField: TppField;
  liIndex: Integer;
  liFieldIndex: Integer;
  lCurrentField: TppField;
  liCurrentIndex: Integer;
  lbFound: Boolean;
begin

  Result := -1;

  if (DataPipeline = nil) then Exit;

  lField := DataPipeline.GetFieldForAlias(aDimension.FieldAlias);

  liFieldIndex := DataPipeline.IndexOfField(lField);

  if (liFieldIndex = -1) then Exit;
  
  liIndex := 0;
  lbFound := False;

  while (liIndex < FAvailableDimensions.Count) and not(lbFound) do
    begin
      lCurrentField := TppField(FAvailableDimensions.Objects[liIndex]);
      liCurrentIndex := DataPipeline.IndexOfField(lCurrentField);

      if (liFieldIndex < liCurrentIndex) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  if (lbFound) then
    FAvailableDimensions.InsertObject(liIndex, lField.FieldAlias, lField)

  else if (liIndex = FAvailableDimensions.Count) then
    FAvailableDimensions.InsertObject(liIndex, lField.FieldAlias, lField);

  Result := liIndex;
  
end; {function, RestoreFieldToAvailableDimension}

{------------------------------------------------------------------------------}
{ TppCrossTab.DeselectColumnDef }

function TppCrossTab.DeselectColumnDef(aIndex: Integer): Integer;
var
  lColumnDef: TppDimension;
begin

  lColumnDef := ColumnDefs[aIndex];

  Result := RestoreFieldToAvailableDimension(lColumnDef);

  lColumnDef.Free;

  DoOnDimensionChange;

end; {function, DeselectColumnDef}

{------------------------------------------------------------------------------}
{ TppCrossTab.DeselectRowDef }

function TppCrossTab.DeselectRowDef(aIndex: Integer): Integer;
var
  lRowDef: TppDimension;
begin

  lRowDef := RowDefs[aIndex];

  Result := RestoreFieldToAvailableDimension(lRowDef);

  lRowDef.Free;

  DoOnDimensionChange;

end; {function, DeselectRowDef}

{------------------------------------------------------------------------------}
{ TppCrossTab.DeselectValueDef }

function TppCrossTab.DeselectValueDef(aIndex: Integer): Integer;
var
  lValueDef: TppDimension;
begin

  lValueDef := ValueDefs[aIndex];

  Result := FAvailableDimensions.IndexOf(lValueDef.FieldAlias);

  lValueDef.Free;

  DoOnDimensionChange;

end; {function, DeselectValueDef}

{------------------------------------------------------------------------------}
{ TppCrossTab.CreatePopupMenu }

procedure TppCrossTab.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
var
  lMenuItem: TMenuItem;
  lMenuSubItem: TMenuItem;
  lRenderers: TStringList;
  liIndex: Integer;
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(25, 'Configure', '',  443); {'Configure...'}
  aPopupMenu.AddItem(26, 'ConfigureLine', '-',  0);
  aPopupMenu.AddItem(27, 'Draw', '',  487); {'Draw'}
  aPopupMenu.AddItem(28, 'Pagination', '',  675); {'Pagination'}
  aPopupMenu.AddItem(30, 'ParentWidth', '',  371);

  lMenuItem := aPopupMenu.ItemByName('Pagination');

  lMenuSubItem := TMenuItem.Create(aOwner);
  lMenuSubItem.Caption := ppLoadStr(676); {'Across then Down'}
  lMenuSubItem.RadioItem := True;
  lMenuItem.Add(lMenuSubItem);

  lMenuSubItem := TMenuItem.Create(aOwner);
  lMenuSubItem.Caption := ppLoadStr(677); {'Down then Across'}
  lMenuSubItem.RadioItem := True;
  lMenuItem.Add(lMenuSubItem);

  if (ppRegisteredRendererCount > 1) then
    begin
      lMenuItem := aPopupMenu.AddItem(30, 'Style', '',  634); {'Style'}

      lRenderers := TStringList.Create;

      ppGetRendererClasses(lRenderers);

      for liIndex := 0 to lRenderers.Count - 1 do
        begin
          lMenuSubItem := TMenuItem.Create(lMenuItem);
          lMenuSubItem.Caption := TppCrossTabRendererClass(lRenderers.Objects[liIndex]).LocalizedDescription;
          lMenuSubItem.RadioItem := True;
          {store the class reference in the Tag}
          lMenuSubItem.Tag := Integer(lRenderers.Objects[liIndex]);

          lMenuItem.Add(lMenuSubItem);
        end;

      lRenderers.Free;
    end;


end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppCrossTab.PopupMenuClick }

procedure TppCrossTab.PopupMenuClick(Sender: TObject);
var
  lPopupMenu: TppPopupMenu;
  lMenuItem: TMenuItem;
  lRenderers: TStringList;
  liIndex: Integer;
begin

  inherited PopupMenuClick(Sender);

  lPopupMenu := TppPopupMenu(Sender);

  {assign menu item event handlers, hide configure menu option if no designer registered}
  if ppGetFormClass(TppCustomCrossTabDesignerForm) <> nil then
    lPopupMenu.ItemByName('Configure').OnClick := ConfigureMenuClick
  else
   lPopupMenu.ItemByName('Configure').Visible := False;

  lMenuItem := lPopupMenu.ItemByName('Pagination');

  lMenuItem.Checked := False;
  
  lMenuItem.Items[0].OnClick := AcrossThenDownMenuClick;
  lMenuItem.Items[1].OnClick := DownThenAcrossMenuClick;

  if (Pagination = ctptAcrossThenDown) then
    lMenuItem.Items[0].Checked := True
  else
    lMenuItem.Items[1].Checked := True;


  if (ppRegisteredRendererCount > 1) then
    begin
      lMenuItem := lPopupMenu.ItemByName('Style');

      lRenderers := TStringList.Create;

      ppGetRendererClasses(lRenderers);

      for liIndex := 0 to lRenderers.Count - 1 do
        begin
          lMenuItem.Items[liIndex].OnClick := RendererMenuClick;

          if (TppCrossTabRendererClass(lRenderers.Objects[liIndex]).Description = FStyle) then
            lMenuItem.Items[liIndex].Checked := True;

        end;

      lRenderers.Free;
    end;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppCrossTab.RendererMenuClick }

procedure TppCrossTab.RendererMenuClick(Sender: TObject);
var
  lClass: TppCrossTabRendererClass;

begin

  lClass :=  TppCrossTabRendererClass(TMenuItem(Sender).Tag);

  SetStyle(lClass.Description);


end; {procedure, RendererMenuClick}

{------------------------------------------------------------------------------}
{ TppCrossTab.ConfigureMenuClick }

procedure TppCrossTab.ConfigureMenuClick(Sender: TObject);
var
  lDialogClass: TFormClass;
  lDialog: TppCustomCrossTabDesignerForm;
begin

  lDialogClass := ppGetFormClass(TppCustomCrossTabDesignerForm);

  lDialog := TppCustomCrossTabDesignerForm(lDialogClass.Create(Application));

  lDialog.CrossTab := Self;
  lDialog.Report := Band.Report;
  lDialog.LanguageIndex := Band.Report.LanguageIndex;
  lDialog.Icon := Band.Report.MainReport.Icon;

  lDialog.ShowModal;

  lDialog.Free;

end; {procedure, ConfigureMenuClick}

{------------------------------------------------------------------------------}
{ TppCrossTab.AcrossThenDownMenuClick }

procedure TppCrossTab.AcrossThenDownMenuClick(Sender: TObject);
begin
  Pagination := ctptAcrossThenDown;
end; {procedure, AcrossThenDownMenuClick}

{------------------------------------------------------------------------------}
{ TppCrossTab.DownThenAcrossMenuClick }

procedure TppCrossTab.DownThenAcrossMenuClick(Sender: TObject);
begin
  Pagination := ctptDownThenAcross;
end; {procedure, DownThenAcrossMenuClick}

{------------------------------------------------------------------------------}
{ TppCrossTab.SetBand }

procedure TppCrossTab.SetBand(aBand: TppBand);
begin

  inherited SetBand(aBand);

end; {procedure, SetBand}

{------------------------------------------------------------------------------}
{ TppCrossTab.SetRegion }

procedure TppCrossTab.SetRegion(aComponent: TppComponent);
begin

  inherited SetRegion(aComponent);

end; {procedure, SetRegion}

{------------------------------------------------------------------------------}
{ TppCrossTab.SetCaption }

procedure TppCrossTab.SetCaption(aCaption: String);
begin

  inherited SetCaption(aCaption);

end; {procedure, SetCaption}

{------------------------------------------------------------------------------}
{ TppCrossTab.SetUnits }

procedure TppCrossTab.SetUnits(aUnits: TppUnitType);
begin

  inherited SetUnits(aUnits);

end; {procedure, SetUnits}

{------------------------------------------------------------------------------}
{ TppCrossTab.HasColor }

function  TppCrossTab.HasColor: Boolean;
begin
  Result := False;
end; {procedure, HasColor}

{------------------------------------------------------------------------------}
{ TppCrossTab.HasFont }

function  TppCrossTab.HasFont: Boolean;
begin
  Result := False;
end; {procedure, HasFont}

{------------------------------------------------------------------------------}
{ TppCrossTab.IsDataAware }

function  TppCrossTab.IsDataAware: Boolean;
begin
  Result := True;
end; {procedure, IsDataAware}

{------------------------------------------------------------------------------}
{ TppCrossTab.LanguageChanged }

procedure TppCrossTab.LanguageChanged;
begin

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppCrossTab.RestoreFromCache }

procedure TppCrossTab.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppCrossTabSaveRec;
begin

  ReadRecordFromCache(aCachePageNo, lRec);

  DrawComponent     := lRec.FDrawComponent;
  DrawShifter       := lRec.FDrawShifter;
  ObjectIndex       := lRec.FObjectIndex;
  OverFlow          := lRec.FOverFlow;
  PartialGeneration := lRec.FPartialGeneration;

  FCrossTabId := lRec.FCrossTabId;
  FStartColumn := lRec.FStartColumn;
  FStartRow := lRec.FStartRow;

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppCrossTab.SaveToCache }

procedure TppCrossTab.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppCrossTabSaveRec;
begin

  lRec.FDrawComponent     := DrawComponent;
  lRec.FDrawShifter       := DrawShifter;
  lRec.FObjectIndex       := ObjectIndex;
  lRec.FOverFlow          := OverFlow;
  lRec.FPartialGeneration := PartialGeneration;

  lRec.FCrossTabId := FCrossTabId;
  lRec.FStartColumn := FStartColumn;
  lRec.FStartRow := FStartRow;

  WriteRecordToCache(aCachePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetElement }

function TppCrossTab.GetElement(aIndex: Integer): TppElement;
begin
  Result := TppCrossTabEngine(FEngine).Elements[aIndex];
end; {procedure, GetElement}

{------------------------------------------------------------------------------}
{ TppCrossTab.GetMatrix }

function TppCrossTab.GetMatrix: TppMatrix;
begin
  Result := TppCrossTabEngine(FEngine).Matrix;
end; {procedure, GetMatrix}

{------------------------------------------------------------------------------}
{ TppCrossTab.CalcSpaceUsed }

procedure TppCrossTab.CalcSpaceUsed;
var
  llHeightAvailable: Longint;
  llWidthAvailable: Longint;
  lMatrix: TppMatrix;
  liEndRow: Integer;
  liEndColumn: Integer;
  lClass: TppCrossTabRendererClass;
  lsSaveMessage: String;
begin

  if (ValueDefCount = 0) then
    begin
      OverFlow := False;
      SpaceUsed := 0;

      Exit;
    end;

  if (Stretch) and (ParentStretch) then
    begin
      llHeightAvailable := (PrintPosRect.Bottom - PrintPosRect.Top) - ppToMMThousandths(Top, Units, pprtVertical, GetPrinter);
      llWidthAvailable := mmWidth;
    end
  else
    begin
      llHeightAvailable := mmHeight;
      llWidthAvailable := mmWidth;
    end;

  if not(OverFlow) then
    begin
      Inc(FCrossTabId);

      FStartColumn := 0;
      FStartRow := 0;

      if (FCrossTabId <> FLastCalcId) then
        begin
          FLastCalcId := FCrossTabId;

          FCalculating := True;

          lsSaveMessage := GetPrintMessage;

          FStatusTimer := TppCrossTabStatusTimer.CreateTimer(250, Self);

          try
            TppCrossTabEngine(FEngine).Calc;
          finally
            FCalculating := False;

            if not(Draw) then
              begin
                SetPrintMessage(lsSaveMessage);

                FStatusTimer.Free;
                FStatusTimer := nil;
              end;
          end;

          if (FRenderer = nil) then
            begin
              lClass := ppRendererClassForDescription(FStyle);

              if (lClass <> nil) then
                FRenderer := lClass.Create(Self)
              else
                FRenderer := TppCrossTabRenderer.Create(Self);
            end;

          TppCustomCrossTabRenderer(FRenderer).Format := Draw;
        end;
    end;

  lMatrix := GetMatrix;

  if (lMatrix = nil) then
    begin
      OverFlow := False;
      SpaceUsed := 0;

      Exit;
    end;

  if Draw then
    begin
      TppCustomCrossTabRenderer(FRenderer).StartColumn := FStartColumn;
      TppCustomCrossTabRenderer(FRenderer).StartRow := FStartRow;

      try
        SpaceUsed := TppCustomCrossTabRenderer(FRenderer).CalcSpaceUsed(lMatrix, llHeightAvailable, llWidthAvailable, GetPrinter);

      finally
        if (FStatusTimer <> nil) then
          begin
            SetPrintMessage(lsSaveMessage);

            FStatusTimer.Free;
            FStatusTimer := nil;
          end;
      end;

      liEndColumn := TppCustomCrossTabRenderer(FRenderer).EndColumn;
      liEndRow := TppCustomCrossTabRenderer(FRenderer).EndRow;
    end
  else
    begin
      liEndColumn := lMatrix.ColumnCount - 1;
      liEndRow := lMatrix.RowCount - 1;
    end;

  if (liEndColumn = lMatrix.ColumnCount - 1) and (liEndRow = lMatrix.RowCount - 1) then
    OverFlow := False
  else
    begin
      OverFlow := True;

      case FPagination of

        ctptAcrossThenDown:
          begin
            if (liEndColumn = lMatrix.ColumnCount - 1) then
              begin
                FStartColumn := 0;
                FStartRow := liEndRow + 1;
              end
            else
              FStartColumn := liEndColumn + 1;
          end;

        ctptDownThenAcross:
          begin
            if (liEndRow = lMatrix.RowCount - 1) then
              begin
                FStartRow := 0;
                FStartColumn := liEndColumn + 1;
              end
             else
               FStartRow := liEndRow + 1;
          end;

      end;

    end;

end; {procedure, CalcSpaceUsed}

{------------------------------------------------------------------------------}
{ TppCrossTab.CreateDrawCommand }

procedure TppCrossTab.CreateDrawCommand(aPage: TppPage);
var
  llStartLeft: Longint;
  llStartTop: Longint;
  lPrinter: TppPrinter;
  lMatrix: TppMatrix;
begin

  if (SpaceUsed = 0) or not(Draw) then Exit;

  lPrinter := GetPrinter;

  llStartLeft := PrintPosRect.Left + ppToMMThousandths(Left, Units, pprtHorizontal, lPrinter);
  llStartTop := PrintPosRect.Top + ppToMMThousandths(Top, Units, pprtVertical, lPrinter);

  lMatrix := TppCrossTabEngine(FEngine).Matrix;

  TppCustomCrossTabRenderer(FRenderer).CreateDrawCommands(aPage, lMatrix, llStartLeft, llStartTop);

end; {procedure, CreateDrawCommand}

{******************************************************************************
 *
 ** E L E M E N T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppElement.Create }

constructor TppElement.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FFont := TFont.Create;
  FFont.Name := 'Arial';
  FFont.Size := 10;

  FAlignment := taCenter;
  FColor := clWhite;
  FDataType := dtString;
  FDisplayFormat := '';
  FName := '';
  FVisible := True;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppElement.CreateWithName }

constructor TppElement.CreateWithName(aOwner: TComponent; const aName: String);
begin

  Create(aOwner);

  FName := aName;

end; {constructor, CreateWithName}

{------------------------------------------------------------------------------}
{ TppElement.Destroy }

destructor TppElement.Destroy;
begin

  FFont.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppElement.Modified }

procedure TppElement.Modified;
var
  lCrossTab: TppCrossTab;
begin

  lCrossTab := CrossTab;

  if (lCrossTab <> nil) then
    lCrossTab.Modified := True;

end; {procedure, Modified}

{------------------------------------------------------------------------------}
{ TppElement.GetName }

function TppElement.GetName: String;
begin
  Result := FName;
end; {destructor, GetName}

{------------------------------------------------------------------------------}
{ TppElement.GetDesignName }

function TppElement.GetDesignName: String;
begin
  Result := GetName;
end; {destructor, GetDesignName}

{------------------------------------------------------------------------------}
{ TppElement.GetDataType }

function TppElement.GetDataType: TppDataType;
begin
  Result := FDataType;
end; {destructor, GetDataType}

{------------------------------------------------------------------------------}
{ TppElement.DrawRect }

function TppElement.DrawRect: TRect;
begin
  Result := Rect(FLeft, FTop, FLeft + FWidth, FTop + FHeight);
end; {destructor, DrawRect}

{------------------------------------------------------------------------------}
{ TppElement.CrossTab }

function TppElement.CrossTab: TppCrossTab;
begin

  if Parent is TppCrossTab then
    Result := TppCrossTab(Parent)

  else if (Parent <> nil) and (Parent.Parent is TppCrossTab) then
    Result := TppCrossTab(Parent.Parent)

  else if (Parent <> nil) and (Parent.Parent <> nil) and (Parent.Parent.Parent is TppCrossTab) then
    Result := TppCrossTab(Parent.Parent.Parent)

  else
    Result := nil;

end; {function, CrossTab}

{------------------------------------------------------------------------------}
{ TppElement.HasDisplayFormat }

function TppElement.HasDisplayFormat: Boolean;
begin
  Result := (GetPropInfo(ClassInfo, 'DisplayFormat') <> nil);
end; {procedure, HasDisplayFormat}

{------------------------------------------------------------------------------}
{ TppElement.Assign }

procedure TppElement.Assign(Source: TPersistent);
var
  lElement: TppElement;
begin

  if (Source is TppElement) then
    begin
      lElement := TppElement(Source);

      FAlignment := lElement.Alignment;
      FColor := lElement.Color;
      FDisplayFormat := lElement.DisplayFormat;
      FFont.Assign(lElement.Font);
      FVisible := lElement.Visible;
    end
  else
    inherited Assign(Source);

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppElement.DoOnChange }

procedure TppElement.DoOnChange;
begin
  if (csReading in ComponentState) or (csLoading in ComponentState) or (csDestroying in ComponentState) then Exit;

  if Assigned(FOnChange) then FOnChange(Self);
end; {procedure, DoOnChange}

{------------------------------------------------------------------------------}
{ TppElement.SetVisible }

procedure TppElement.SetVisible(aValue: Boolean);
begin

  FVisible := aValue;

  DoOnChange;

  Modified;

end; {procedure, SetVisible}

{------------------------------------------------------------------------------}
{ TppElement.SetDisplayFormat }

procedure TppElement.SetDisplayFormat(const aFormat: String);
begin

  FDisplayFormat := aFormat;

  DoOnChange;

  Modified;

end; {function, SetDisplayFormat}

{------------------------------------------------------------------------------}
{ TppElement.SetFont }

procedure TppElement.SetFont(aFont: TFont);
begin

  FFont.Assign(aFont);

  DoOnChange;

  Modified;

end; {function, SetFont}

{------------------------------------------------------------------------------}
{ TppElement.SetAlignment }

procedure TppElement.SetAlignment(aAlignment: TAlignment);
begin

  FAlignment := aAlignment;

  DoOnChange;

  Modified;

end; {function, SetAlignment}

{------------------------------------------------------------------------------}
{ TppElement.SetColor }

procedure TppElement.SetColor(aColor: TColor);
begin

  FColor := aColor;

  DoOnChange;

  Modified;

end; {function, SetColor}

{******************************************************************************
 *
 ** D I M E N S I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDimension.Create }

constructor TppDimension.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FFieldAlias := '';
  FFieldName := '';
  FNullOrder := ctnoLast;
  FSkipNulls := True;
  FSortType := soAscending;
  FSubTotals := TList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDimension.Destroy }

destructor TppDimension.Destroy;
begin

  ctFreeChildren(FSubTotals);

  FSubTotals.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDimension.Assign }

procedure TppDimension.Assign(Source: TPersistent);
var
  lDimension: TppDimension;
begin

  inherited Assign(Source);
  
  if not(Source is TppDimension) then Exit;

  lDimension := TppDimension(Source);

  FFieldAlias := lDimension.FieldAlias;
  FFieldName := lDimension.FieldName;
  FNullOrder := lDimension.NullOrder;
  FSkipNulls := lDimension.SkipNulls;
  FSortType := lDimension.SortType;

  ctFreeChildren(FSubTotals);

  ctAssignChildren(lDimension.FSubTotals, Self, Self);

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppDimension.SaveComponents }

procedure TppDimension.SaveComponents(Proc: TGetChildProc);
var
  liIndex: Integer;
begin

  inherited SaveComponents(Proc);

  for liIndex := 0 to (FSubTotals.Count - 1) do
    Proc(SubTotals[liIndex]);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TppDimension.AddChild }

procedure TppDimension.AddChild(aChild: TppRelative);
begin

  case TppCrossTabChildType(aChild.ChildType) of
    ctctSubTotal: FSubTotals.Add(aChild);
    else
      inherited AddChild(aChild);
  end;

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TppDimension.IndexOfChild }

function TppDimension.IndexOfChild(aChild: TppRelative): Integer;
begin

  case TppCrossTabChildType(aChild.ChildType) of
    ctctSubTotal: Result := FSubTotals.IndexOf(aChild);
  else
    Result := inherited IndexOfChild(aChild);
  end;

end; {procedure, IndexOfChild}

{------------------------------------------------------------------------------}
{ TppDimension.RemoveChild }

function TppDimension.RemoveChild(aChild: TppRelative): Integer;
var
  liIndex: Integer;
begin

  liIndex := IndexOfChild(aChild);

  Result := liIndex;

  if (liIndex = -1) then Exit;

  case TppCrossTabChildType(aChild.ChildType) of
    ctctSubTotal: FSubTotals.Delete(liIndex);
    else
      Result := inherited RemoveChild(aChild);
  end;

end; {procedure, RemoveChild}

{------------------------------------------------------------------------------}
{ TppDimension.MoveChild }

procedure TppDimension.MoveChild(aChild: TppRelative; aNewIndex: Integer);
var
  liCurrentIndex: Integer;
begin

  liCurrentIndex := IndexOfChild(aChild);

  case TppCrossTabChildType(aChild.ChildType) of
    ctctSubTotal: FSubTotals.Move(liCurrentIndex, aNewIndex);
  end;

end; {procedure, MoveChild}

{------------------------------------------------------------------------------}
{ TppDimension.SetSortType }

procedure TppDimension.SetSortType(aSortType: TppSortOrderType);
begin

  FSortType := aSortType;

  DoOnChange;

  Modified;

end; {procedure, SetSortType}

{------------------------------------------------------------------------------}
{ TppDimension.SetNullOrder }

procedure TppDimension.SetNullOrder(aNullOrder: TppNullOrderType);
begin

  FNullOrder := aNullOrder;

  DoOnChange;

  Modified;

end; {procedure, SetNullOrder}

{------------------------------------------------------------------------------}
{ TppDimension.SetSkipNulls }

procedure TppDimension.SetSkipNulls(aValue: Boolean);
begin

  FSkipNulls := aValue;

  DoOnChange;

  Modified;

end; {procedure, SetSkipNulls}

{------------------------------------------------------------------------------}
{ TppDimension.GetSubTotal }

function TppDimension.GetSubTotal(aIndex: Integer): TppSubTotal;
begin
  Result := TppSubTotal(FSubTotals[aIndex]);
end; {function, GetSubTotal}

{------------------------------------------------------------------------------}
{ TppDimension.GetSubTotalCount }

function  TppDimension.GetSubTotalCount: Integer;
begin
  Result := FSubTotals.Count;
end; {function, GetSubTotalCount}

{------------------------------------------------------------------------------}
{ TppDimension.Clear }

procedure TppDimension.Clear;
begin

  FFieldAlias := '';
  FFieldName := '';

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppDimension.GetIndex }

function TppDimension.GetIndex: Integer;
begin
  Result := -1;

  if (Parent <> nil) then
    Result := Parent.IndexOfChild(Self);
end; {procedure, GetIndex}

{------------------------------------------------------------------------------}
{ TppDimension.GetFieldDataType }

function TppDimension.GetFieldDataType: TppDataType;
var
  lDataPipeline: TppDataPipeline;
begin

  Result := dtNotKnown;

  if (FFieldName = '') then Exit;

  lDataPipeline := CrossTab.DataPipeline;

  if (lDataPipeline = nil) then Exit;

  Result := lDataPipeline.GetFieldDataType(FFieldName);

end; {procedure, GetFieldDataType}

{------------------------------------------------------------------------------}
{ TppDimension.GetDataType }

function TppDimension.GetDataType: TppDataType;
begin
  Result := GetFieldDataType;
end; {procedure, GetDataType}

{------------------------------------------------------------------------------}
{ TppDimension.GetName }

function TppDimension.GetName: String;
begin

  Result := FFieldAlias;

  CrossTab.DoOnGetDimensionName(Self, Result);

end; {function, GetName}

{------------------------------------------------------------------------------}
{ TppDimension.GetCaption }

function TppDimension.GetCaption: String;
var
  lDataPipeline: TppDataPipeline;
begin

  Result := '';

  lDataPipeline := TppCrossTab(Parent).DataPipeline;

  if (lDataPipeline = nil) or not(lDataPipeline.Active) then Exit;

  if (DisplayFormat <> '') and not(Self is TppValueDef) then
    Result := ppFormat(DisplayFormat, GetDataType, lDataPipeline.GetFieldValue(FFieldName))
  else
    Result := lDataPipeline.GetFieldAsString(FFieldName);

  CrossTab.DoOnGetDimensionCaption(Self, Result);

end; {function, GetCaption}

{------------------------------------------------------------------------------}
{ TppDimension.GetSkip }

function TppDimension.GetSkip: Boolean;
begin

  GetValue;

  Result := FSkip;
  
end; {function, GetSkip}

{------------------------------------------------------------------------------}
{ TppDimension.GetValue }

function TppDimension.GetValue: Variant;
var
  lDataPipeline: TppDataPipeline;
begin

  Result := Null;

  lDataPipeline := TppCrossTab(Parent).DataPipeline;

  if (lDataPipeline <> nil) and (lDataPipeline.Active) then
    Result := lDataPipeline.GetFieldValue(FFieldName);

  FSkip := False;

  if FSkipNulls and (VarType(Result) = varNull) then
    FSkip := True;

  CrossTab.DoOnGetDimensionValue(Self, Result, FSkip);

end; {function, GetValue}

{------------------------------------------------------------------------------}
{ TppDimension.ShowSubTotals }

procedure TppDimension.ShowSubTotals(aValue: Boolean);
var
  liIndex: Integer;
begin
  for liIndex := 0 to SubTotalCount - 1 do
    SubTotals[liIndex].Visible := aValue;
end; {procedure, ShowSubTotals}

{******************************************************************************
 *
 ** C O L U M N   D E F
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppColumnDef.Create }

constructor TppColumnDef.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(ctctColumnDef);

  Alignment := taLeftJustify;

end; {constructor, Create}

{******************************************************************************
 *
 ** R O W   D E F
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppRowDef.Create }

constructor TppRowDef.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(ctctRowDef);

  Alignment := taLeftJustify;

end; {constructor, Create}

{******************************************************************************
 *
 ** V A L U E   D E F
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppValueDef.Create }

constructor TppValueDef.Create(aOwner: TComponent);
var
  lElement: TppElement;
begin

  inherited Create(aOwner);

  ChildType := Ord(ctctValueDef);

  Alignment := taRightJustify;

  lElement := TppValueCaptionDef.Create(Self);
  lElement.Parent := Self;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppValueDef.Destroy }

destructor TppValueDef.Destroy;
begin

  FCaptionDef.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppValueDef.SetDisplayFormat }

procedure TppValueDef.SetDisplayFormat(const aFormat: String);
var
  lCrossTab: TppCrossTab;
  liIndex: Integer;
  liIndex2: Integer;
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then
    begin
      inherited SetDisplayFormat(aFormat);

      Exit;
    end;

  lCrossTab := CrossTab;

  if (lCrossTab = nil) then Exit;

  liIndex := CrossTab.IndexOfChild(Self);

  lCrossTab.ColumnGrandTotals[liIndex].TotalDef.DisplayFormat := aFormat;
  lCrossTab.RowGrandTotals[liIndex].TotalDef.DisplayFormat := aFormat;

  for liIndex2 := 0 to lCrossTab.ColumnDefCount - 1 do
    lCrossTab.ColumnDefs[liIndex2].SubTotals[liIndex].TotalDef.DisplayFormat := aFormat;

  for liIndex2 := 0 to lCrossTab.RowDefCount - 1 do
    lCrossTab.RowDefs[liIndex2].SubTotals[liIndex].TotalDef.DisplayFormat := aFormat;
    
  inherited SetDisplayFormat(aFormat);

end; {procedure, SetDisplayFormat}

{------------------------------------------------------------------------------}
{ TppValueDef.GetSkipNulls }

function TppValueDef.GetSkipNulls: Boolean;
begin
  Result := FCaptionDef.SkipNulls;
end; {function, GetSkipNulls}

{------------------------------------------------------------------------------}
{ TppValueDef.SetSkipNulls }

procedure TppValueDef.SetSkipNulls(aValue: Boolean);
begin
  FCaptionDef.SkipNulls := aValue;
end; {procedure, SetSkipNulls}

{------------------------------------------------------------------------------}
{ TppValueDef.GetCalcType }

function TppValueDef.GetCalcType: TppDBCalcType;
begin
  Result := FCaptionDef.CalcType;
end; {function, GetCalcType}

{------------------------------------------------------------------------------}
{ TppValueDef.SetCalcType }

procedure TppValueDef.SetCalcType(aCalcType: TppDBCalcType);
begin
  FCaptionDef.CalcType := aCalcType;
end; {procedure, SetCalcType}

{------------------------------------------------------------------------------}
{ TppValueDef.Assign }

procedure TppValueDef.Assign(Source: TPersistent);
var
  lValueDef: TppValueDef;
begin

  inherited Assign(Source);

  if not(Source is TppValueDef) then Exit;

  lValueDef := TppValueDef(Source);

  FDisplayFormat := lValueDef.DisplayFormat;

  FCaptionDef.Assign(lValueDef.CaptionDef);

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppValueDef.SaveComponents }

procedure TppValueDef.SaveComponents(Proc: TGetChildProc);
begin

  inherited SaveComponents(Proc);

  Proc(FCaptionDef);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TppValueDef.AddChild }

procedure TppValueDef.AddChild(aChild: TppRelative);
begin

  if (aChild is TppValueCaptionDef) then
    FCaptionDef := TppValueCaptionDef(aChild)

  else
    inherited AddChild(aChild);

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TppValueDef.RemoveChild }

function TppValueDef.RemoveChild(aChild: TppRelative): Integer;
begin

  Result := 0;

  if (aChild is TppValueCaptionDef) then
    FCaptionDef := nil

  else
    Result := inherited RemoveChild(aChild);

end; {procedure, RemoveChild}

{------------------------------------------------------------------------------}
{ TppValueDef.GetDataType }

function TppValueDef.GetDataType: TppDataType;
begin

  if (CalcType = dcCount) then
    Result := dtInteger
  else
    Result := GetFieldDataType;

end; {function, GetDataType}

{------------------------------------------------------------------------------}
{ TppValueDef.GetName }

function TppValueDef.GetName: String;
begin

  Result := inherited GetName;

  {if event handler did not change default behavior, then continue}
  if (Result = FieldAlias) then
    begin
      case CalcType of
        dcCount:   Result := ppLoadStr(1028); {'Count'}
        dcSum:     Result := ppLoadStr(1029); {'Sum'}
        dcMinimum: Result := ppLoadStr(1030); {'Minimum'}
        dcMaximum: Result := ppLoadStr(1031); {'Maximum'}
        dcAverage: Result := ppLoadStr(1032); {'Average'}
      end;

      if (CalcType in [dcCount, dcSum]) then
        Result := Result + ' ' + ppLoadStr(16) + ' ' + FieldAlias {'of'}
      else
        Result := Result + ' ' + FieldAlias;

    end;

end; {function, GetName}

{------------------------------------------------------------------------------}
{ TppValueDef.GetDesignName }

function TppValueDef.GetDesignName: String;
begin
  Result := ctDataTypeToDisplayString(GetDataType, DisplayFormat);
end; {function, GetDesignName}

{------------------------------------------------------------------------------}
{ TppValueDef.DoOnCalcValue }

procedure TppValueDef.DoOnCalcValue(var aValue: Variant);
begin
  CrossTab.DoOnCalcDimensionValue(Self, aValue);
end; {procedure, DoOnCalcValue}

{******************************************************************************
 *
 ** T O T A L   D E F
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTotalDef.Create }

constructor TppTotalDef.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(ctctTotalDef);

  Alignment := taRightJustify;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppTotalDef.GetName }

function TppTotalDef.GetName: String;
var
  lValueDef: TppValueDef;
  lDataType: TppDataType;
begin

  if (Parent is TppSubTotal) then
    begin
      lValueDef := TppSubTotal(Parent).GetValueDef;

      lDataType := lValueDef.GetDataType;

      Result := ctDataTypeToDisplayString(lDataType, DisplayFormat);
    end
    
  else if (Parent is TppGrandTotal) then
    begin
      lValueDef := TppGrandTotal(Parent).GetValueDef;

      lDataType := lValueDef.GetDataType;

      Result := ctDataTypeToDisplayString(lDataType, DisplayFormat);
    end;

end; {function, GetName}

{------------------------------------------------------------------------------}
{ TppTotalDef.GetDesignName }

function TppTotalDef.GetDesignName: String;
begin

  Result := GetName;
  
  if (Parent is TppSubTotal) then
    begin
      if (Parent.Parent is TppColumnDef) then
        Result := '<newline>' + Result;
    end

  else if (Parent is TppGrandTotal) then
    begin
      if (CrossTab.IndexOfColumnGrandTotal(TppGrandTotal(Parent)) <> -1) then
        Result := '<newline>' + Result;
    end;

end; {function, GetDesignName}

{------------------------------------------------------------------------------}
{ TppTotalDef.GetDataType }

function TppTotalDef.GetDataType: TppDataType;
var
  lSubTotal: TppSubTotal;
  lGrandTotal: TppGrandTotal;
begin

  Result := dtNotKnown;
  
  if (Parent is TppSubTotal) then
    begin
      lSubTotal := TppSubTotal(Parent);

      Result := lSubTotal.GetValueDef.GetDataType;
    end
  else if (Parent is TppGrandTotal) then
    begin
      lGrandTotal := TppGrandTotal(Parent);

      Result := lGrandTotal.GetValueDef.GetDataType;
    end;

end; {function, GetDataType}

{******************************************************************************
 *
 ** V A L U E   C A P T I O N   D E F
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppValueCaptionDef.Create }

constructor TppValueCaptionDef.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(ctctValueCaptionDef);

  Alignment := taLeftJustify;

  FCalcType := dcSum;
  FSkipNulls := True;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppValueCaptionDef.Assign }

procedure TppValueCaptionDef.Assign(Source: TPersistent);
var
  lValueCaptionDef: TppValueCaptionDef;
begin

  inherited Assign(Source);

  if not(Source is TppValueCaptionDef) then Exit;

  lValueCaptionDef := TppValueCaptionDef(Source);

  FCalcType := lValueCaptionDef.CalcType;
  FSkipNulls := lValueCaptionDef.SkipNulls;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppValueCaptionDef.SetCalcType }

procedure TppValueCaptionDef.SetCalcType(aCalcType: TppDBCalcType);
begin

  FCalcType := aCalcType;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  {if the field is not numeric, then 'Count' is the only valid CalcType}
  if (FCalcType <> dcCount) and not(TppValueDef(Parent).GetFieldDataType in ppNumerics) then
    FCalcType := dcCount;

  DoOnChange;

  Modified;

end; {procedure, SetCalcType}

{------------------------------------------------------------------------------}
{ TppValueCaptionDef.SetSkipNulls }

procedure TppValueCaptionDef.SetSkipNulls(aValue: Boolean);
begin

  FSkipNulls := aValue;

  DoOnChange;

  Modified;

end; {procedure, SetSkipNulls}

{------------------------------------------------------------------------------}
{ TppValueCaptionDef.GetName }

function TppValueCaptionDef.GetName: String;
begin
  Result := TppValueDef(Parent).GetName;
end; {function, GetName}

{------------------------------------------------------------------------------}
{ TppValueCaptionDef.GetDesignName }

function TppValueCaptionDef.GetDesignName: String;
begin
  Result := TppValueDef(Parent).GetName;
end; {function, GetDesignName}

{******************************************************************************
 *
 ** T O T A L   C A P T I O N   D E F
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTotalCaptionDef.Create }

constructor TppTotalCaptionDef.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(ctctTotalCaptionDef);

  Alignment := taLeftJustify;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppTotalCaptionDef.GetName }

function TppTotalCaptionDef.GetName: String;
var
  lSubTotal: TppSubTotal;
  lGrandTotal: TppGrandTotal;
begin

  if (Parent is TppSubTotal) then
    begin
      lSubTotal := TppSubTotal(Parent);

      Result := lSubTotal.GetDimension.GetName + ' '+ ppLoadStr(75); {'Subtotal'}

      if (CrossTab.ValueDefCount > 1) and (lSubTotal.Parent is TppRowDef) then
        begin
          Result := Result + ' (' + lSubTotal.GetValueDef.GetName + ')';

          FAlignment := taLeftJustify;
        end;
    end
  else if (Parent is TppGrandTotal) then
    begin
      lGrandTotal := TppGrandTotal(Parent);

      Result := ppLoadStr(72); {'Grand Total'}

      if (CrossTab.ValueDefCount > 1) and (CrossTab.IndexOfRowGrandTotal(lGrandTotal) <> -1) then
        begin
          Result := Result + ' (' + lGrandTotal.GetValueDef.GetName + ')';

          FAlignment := taLeftJustify;
        end;
    end;

end; {function, GetName}

{******************************************************************************
 *
 ** T O T A L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTotal.Create }

constructor TppTotal.Create(aOwner: TComponent);
var
  lElement: TppElement;
begin

  inherited Create(aOwner);

  lElement := TppTotalCaptionDef.Create(Self);
  lElement.Parent := Self;

  lElement := TppTotalDef.Create(Self);
  lElement.Parent := Self;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppTotal.Destroy }

destructor TppTotal.Destroy;
begin

  FCaptionDef.Free;
  FTotalDef.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppTotal.GetVisible }

function TppTotal.GetVisible: Boolean;
begin
  Result := FCaptionDef.Visible;
end; {function, GetVisible}

{------------------------------------------------------------------------------}
{ TppTotal.SetVisible }

procedure TppTotal.SetVisible(aValue: Boolean);
begin
  FCaptionDef.Visible := aValue;
  FTotalDef.Visible := aValue;
end; {procedure, SetVisible}

{------------------------------------------------------------------------------}
{ TppTotal.Assign }

procedure TppTotal.Assign(Source: TPersistent);
var
  lTotal: TppTotal;
begin

  if not(Source is TppTotal) then
    inherited Assign(Source);

  lTotal := TppTotal(Source);

  FCaptionDef.Assign(lTotal.CaptionDef);
  FTotalDef.Assign(lTotal.TotalDef);

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppTotal.SaveComponents }

procedure TppTotal.SaveComponents(Proc: TGetChildProc);
begin

  inherited SaveComponents(Proc);

  Proc(FCaptionDef);
  Proc(FTotalDef);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TppTotal.AddChild }

procedure TppTotal.AddChild(aChild: TppRelative);
begin

  if (aChild is TppTotalCaptionDef) then
    FCaptionDef := TppTotalCaptionDef(aChild)

  else if (aChild is TppTotalDef) then
    FTotalDef := TppTotalDef(aChild)

  else
    inherited AddChild(aChild);

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TppTotal.RemoveChild }

function TppTotal.RemoveChild(aChild: TppRelative): Integer;
begin

  Result := 0;

  if (aChild is TppTotalCaptionDef) then
    FCaptionDef := nil

  else if (aChild is TppTotalDef) then
    FTotalDef := nil

  else
    Result := inherited RemoveChild(aChild);

end; {procedure, RemoveChild}

{------------------------------------------------------------------------------}
{ TppTotal.GetValueDefIndex }

function TppTotal.GetValueDefIndex: Integer;
begin
  Result := Parent.IndexOfChild(Self);
end; {procedure, GetValueDefIndex}

{------------------------------------------------------------------------------}
{ TppTotal.GetValueDef }

function TppTotal.GetValueDef: TppValueDef;
var
  liIndex: Integer;
begin

  liIndex := ValueDefIndex;

  if (liIndex <> -1) then
    Result := CrossTab.ValueDefs[ValueDefIndex]
  else
    Result := nil;

end; {function, GetValueDef}

{------------------------------------------------------------------------------}
{ TppTotal.CrossTab }

function TppTotal.CrossTab: TppCrossTab;
begin

  if Parent is TppCrossTab then
    Result := TppCrossTab(Parent)

  else if (Parent <> nil) and (Parent.Parent is TppCrossTab) then
    Result := TppCrossTab(Parent.Parent)

  else
    Result := nil;

end; {function, CrossTab}

{******************************************************************************
 *
 ** S U B T O T A L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppSubTotal.Create }

constructor TppSubTotal.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(ctctSubTotal);

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppSubTotal.GetDimension }

function TppSubTotal.GetDimension: TppDimension;
begin
  Result := TppDimension(Parent);
end; {function, GetDimension}

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
 ** C R O S S T A B   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCrossTabRTTI.RefClass }

class function TraTppCrossTabRTTI.RefClass: TClass;
begin
  Result := TppCrossTab;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCrossTabRTTI.GetPropList }

class procedure TraTppCrossTabRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCrossTabRTTI.GetPropRec }

class function TraTppCrossTabRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {events}
  if (CompareText(aPropName, 'OnCalcDimensionValue') = 0) then
    EventToRec(aPropName, ciCrossTabCalcDimensionValue, True, aPropRec)

  else if (CompareText(aPropName, 'OnFormatCell') = 0) then
    EventToRec(aPropName, ciCrossTabFormatCell, True, aPropRec)

  else if (CompareText(aPropName, 'OnGetCaptionText') = 0) then
    EventToRec(aPropName, ciCrossTabGetCaptionText, True, aPropRec)

  else if (CompareText(aPropName, 'OnGetDimensionName') = 0) then
    EventToRec(aPropName, ciCrossTabGetDimensionName, True, aPropRec)

  else if (CompareText(aPropName, 'OnGetDimensionCaption') = 0) then
    EventToRec(aPropName, ciCrossTabGetDimensionCaption, True, aPropRec)

  else if (CompareText(aPropName, 'OnGetDimensionValue') = 0) then
    EventToRec(aPropName, ciCrossTabGetDimensionValue, True, aPropRec)

  else if (CompareText(aPropName, 'OnGetTotalCaptionText') = 0) then
    EventToRec(aPropName, ciCrossTabGetTotalCaptionText, True, aPropRec)

  else if (CompareText(aPropName, 'OnGetTotalValueText') = 0) then
    EventToRec(aPropName, ciCrossTabGetTotalValueText, True, aPropRec)

  else if (CompareText(aPropName, 'OnGetValueText') = 0) then
    EventToRec(aPropName, ciCrossTabGetValueText, True, aPropRec)

  else if (CompareText(aPropName, 'OnTraverseRecord') = 0) then
    EventToRec(aPropName, ciCrossTabTraverseRecord, True, aPropRec)


  {properties}
  else if (CompareText(aPropName, 'Calculating') = 0) then
     PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'ColumnDefCount') = 0) then
     PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'ColumnDefs') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'ColumnGrandTotalCount') = 0) then
     PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'ColumnGrandTotals') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'Matrix') = 0) then
     ClassPropToRec(aPropName, TppMatrix, True, aPropRec)

  else if (CompareText(aPropName, 'Modified') = 0) then
     PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'RowDefCount') = 0) then
     PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'RowDefs') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'RowGrandTotalCount') = 0) then
     PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'RowGrandTotals') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'ValueDefCount') = 0) then
     PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'ValueDefs') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'Draw') = 0) then
     PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'GridLines') = 0) then
     PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'Pagination') = 0) then
    EnumPropToRec(aPropName, 'TppCrossTabPaginationType', False, aPropRec)

  else if (CompareText(aPropName, 'Style') = 0) then
     PropToRec(aPropName, daString, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCrossTabRTTI.GetParams }

class function TraTppCrossTabRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  {events}
  if (CompareText(aMethodName, 'OnCalcDimensionValue') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aDimension', daClass, TppDimension, '', False, False);
      Result.AddParam('aValue', daVariant, nil, '', False, True);
    end

  else if (CompareText(aMethodName, 'OnFormatCell') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aElement', daClass, TppElement, '', False, False);
      Result.AddParam('aColumn', daInteger, nil, '', False, False);
      Result.AddParam('aRow', daInteger, nil, '', False, False);
    end

  else if (CompareText(aMethodName, 'OnGetCaptionText') = 0) or
          (CompareText(aMethodName, 'OnGetTotalValueText') = 0) or
          (CompareText(aMethodName, 'OnGetValueText') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aElement', daClass, TppElement, '', False, False);
      Result.AddParam('aColumn', daInteger, nil, '', False, False);
      Result.AddParam('aRow', daInteger, nil, '', False, False);
      Result.AddParam('aDisplayFormat', daString, nil, '', True, False);
      Result.AddParam('aValue', daVariant, nil, '', False, False);
      Result.AddParam('aText', daString, nil, '', False, True);
    end

  else if (CompareText(aMethodName, 'OnGetDimensionName') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aDimension', daClass, TppDimension, '', False, False);
      Result.AddParam('aName', daString, nil, '', False, True);
    end

  else if (CompareText(aMethodName, 'OnGetDimensionCaption') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aDimension', daClass, TppDimension, '', False, False);
      Result.AddParam('aCaption', daString, nil, '', False, True);
    end

  else if (CompareText(aMethodName, 'OnGetDimensionValue') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aDimension', daClass, TppDimension, '', False, False);
      Result.AddParam('aValue', daVariant, nil, '', False, True);
      Result.AddParam('aSkip', daBoolean, nil, '', False, True);
    end

  else if (CompareText(aMethodName, 'OnGetTotalCaptionText') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aElement', daClass, TppElement, '', False, False);
      Result.AddParam('aColumn', daInteger, nil, '', False, False);
      Result.AddParam('aRow', daInteger, nil, '', False, False);
      Result.AddParam('aText', daString, nil, '', False, True);
    end

  else if (CompareText(aMethodName, 'OnTraverseRecord') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aDataPipeline', daClass, TppDataPipeline, '', False, False);
      Result.AddParam('aSkipRecord', daBoolean, nil, '', False, True);
    end


  {properties}
  else if (CompareText(aMethodName, 'ColumnDefs') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppColumnDef, '', False, False);
    end

  else if (CompareText(aMethodName, 'ColumnGrandTotals') = 0) or
          (CompareText(aMethodName, 'RowGrandTotals') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppGrandTotal, '', False, False);
    end

  else if (CompareText(aMethodName, 'RowDefs') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppRowDef, '', False, False);
    end

  else if (CompareText(aMethodName, 'ValueDefs') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppValueDef, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppCrossTabRTTI.CallMethod }

class function TraTppCrossTabRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lCrossTab: TppCrossTab;
  liIndex: Integer;
  lColumn: TppColumnDef;
  lRow: TppRowDef;
  lValue: TppValueDef;
  lTotal: TppGrandTotal;
begin

  Result := True;
  
  lCrossTab := TppCrossTab(aObject);

  if (CompareText(aMethodName, 'ColumnDefs') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lColumn := lCrossTab.ColumnDefs[liIndex];

      aParams.SetParamValue(1, Integer(lColumn));
    end

  else if (CompareText(aMethodName, 'RowDefs') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lRow := lCrossTab.RowDefs[liIndex];

      aParams.SetParamValue(1, Integer(lRow));
    end

  else if (CompareText(aMethodName, 'ValueDefs') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lValue := lCrossTab.ValueDefs[liIndex];

      aParams.SetParamValue(1, Integer(lValue));
    end

  else if (CompareText(aMethodName, 'RowGrandTotals') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lTotal := lCrossTab.RowGrandTotals[liIndex];

      aParams.SetParamValue(1, Integer(lTotal));
    end

  else if (CompareText(aMethodName, 'ColumnGrandTotals') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lTotal := lCrossTab.ColumnGrandTotals[liIndex];

      aParams.SetParamValue(1, Integer(lTotal));
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppCrossTabRTTI.GetPropValue }

class function TraTppCrossTabRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Calculating') = 0) then
    Boolean(aValue) := TppCrossTab(aObject).Calculating

  else if (CompareText(aPropName, 'ColumnDefCount') = 0) then
    Integer(aValue) := TppCrossTab(aObject).ColumnDefCount

  else if (CompareText(aPropName, 'ColumnGrandTotalCount') = 0) then
    Integer(aValue) := TppCrossTab(aObject).ColumnGrandTotalCount

  else if (CompareText(aPropName, 'Matrix') = 0) then
    Integer(aValue) := Integer(TppCrossTab(aObject).Matrix)

  else if (CompareText(aPropName, 'Modified') = 0) then
    Boolean(aValue) := TppCrossTab(aObject).Modified

  else if (CompareText(aPropName, 'RowDefCount') = 0) then
    Integer(aValue) := TppCrossTab(aObject).RowDefCount

  else if (CompareText(aPropName, 'RowGrandTotalCount') = 0) then
    Integer(aValue) := TppCrossTab(aObject).RowGrandTotalCount

  else if (CompareText(aPropName, 'ValueDefCount') = 0) then
    Integer(aValue) := TppCrossTab(aObject).ValueDefCount

  else if (CompareText(aPropName, 'Draw') = 0) then
    Boolean(aValue) := TppCrossTab(aObject).Draw

  else if (CompareText(aPropName, 'GridLines') = 0) then
    Boolean(aValue) := TppCrossTab(aObject).GridLines

  else if (CompareText(aPropName, 'Pagination') = 0) then
    Integer(aValue) := Ord(TppCrossTab(aObject).Pagination)

  else if (CompareText(aPropName, 'Style') = 0) then
    String(aValue) := TppCrossTab(aObject).Style

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCrossTabRTTI.SetPropValue }

class function TraTppCrossTabRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Draw') = 0) then
    TppCrossTab(aObject).Draw := Boolean(aValue)

  else if (CompareText(aPropName, 'GridLines') = 0) then
    TppCrossTab(aObject).GridLines := Boolean(aValue)

  else if (CompareText(aPropName, 'Pagination') = 0) then
    TppCrossTab(aObject).Pagination := TppCrossTabPaginationType(aValue)

  else if (CompareText(aPropName, 'Style') = 0) then
    TppCrossTab(aObject).Style := String(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** E L E M E N T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppElementRTTI.RefClass }

class function TraTppElementRTTI.RefClass: TClass;
begin
  Result := TppElement;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppElementRTTI.GetPropList }

class procedure TraTppElementRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {parameters: Name, DataType, Class, IsPublished, IsReadOnly}
  aPropList.AddProp('Alignment');
  aPropList.AddProp('Color');
  aPropList.AddProp('DisplayFormat');
  aPropList.AddProp('ElementIndex');
  aPropList.AddProp('Font');
  aPropList.AddProp('Height');
  aPropList.AddProp('Left');
  aPropList.AddProp('Top');
  aPropList.AddProp('Width');
  aPropList.AddProp('TextHeight');
  aPropList.AddProp('TextWidth');
  aPropList.AddProp('Visible');

  {add public methods}
  aPropList.AddMethod('GetName');
  aPropList.AddMethod('GetDataType');
  aPropList.AddMethod('GetDesignName');
  aPropList.AddMethod('HasDisplayFormat');
  aPropList.AddMethod('Modified');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppElementRTTI.GetPropRec }

class function TraTppElementRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;


  {methods}
  if (CompareText(aPropName, 'GetName') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'GetDataType') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'GetDesignName') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'HasDisplayFormat') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'Modified') = 0) then
    MethodToRec(aPropName, False, aPropRec)


  {properties}
  else if (CompareText(aPropName, 'Alignment') = 0) then
    EnumPropToRec(aPropName, 'TAlignment', False, aPropRec)

  else if (CompareText(aPropName, 'Color') = 0) then
    EnumPropToRec(aPropName, 'TColor', False, aPropRec)

  else if (CompareText(aPropName, 'DisplayFormat') = 0) then
     PropToRec(aPropName, daString, False, aPropRec)

  else if (CompareText(aPropName, 'ElementIndex') = 0) then
     PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'Font') = 0) then
    ClassPropToRec(aPropName, TFont, False, aPropRec)

  else if (CompareText(aPropName, 'Height') = 0) then
     PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'Left') = 0) then
     PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'Top') = 0) then
     PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'Width') = 0) then
     PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'TextHeight') = 0) then
     PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'TextWidth') = 0) then
     PropToRec(aPropName, daInteger, False, aPropRec)

  else if (CompareText(aPropName, 'Visible') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppElementRTTI.GetParams }

class function TraTppElementRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  {methods}
  if (CompareText(aMethodName, 'GetName') = 0) or
     (CompareText(aMethodName, 'GetDesignName') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Result', daString, nil, '', False, False);
    end

  else if (CompareText(aMethodName, 'GetDataType') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Result', daEnum, nil, 'TppDataType', False, False);
    end

  else if (CompareText(aMethodName, 'HasDisplayFormat') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Result', daBoolean, nil, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppElementRTTI.CallMethod }

class function TraTppElementRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lElement: TppElement;
  lString: String;
  lBoolean: Boolean;
  lDataType: TppDataType;
begin

  Result := True;

  lElement := TppElement(aObject);

  if (CompareText(aMethodName, 'GetName') = 0) then
    begin
      lString := lElement.GetName;

      aParams.SetParamValue(0, lString);
    end

  else if (CompareText(aMethodName, 'GetDataType') = 0) then
    begin
      lDataType := lElement.GetDataType;

      aParams.SetParamValue(0, lDataType);
    end

  else if (CompareText(aMethodName, 'GetDesignName') = 0) then
    begin
      lString := lElement.GetDesignName;

      aParams.SetParamValue(0, lString);
    end

  else if (CompareText(aMethodName, 'HasDisplayFormat') = 0) then
    begin
      lBoolean := lElement.HasDisplayFormat;

      aParams.SetParamValue(0, lBoolean);
    end

  else if (CompareText(aMethodName, 'Modified') = 0) then
    lElement.Modified

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppElementRTTI.GetPropValue }

class function TraTppElementRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Alignment') = 0) then
    Integer(aValue) := Ord(TppElement(aObject).Alignment)

  else if (CompareText(aPropName, 'Color') = 0) then
    Integer(aValue) := Ord(TppElement(aObject).Color)

  else if (CompareText(aPropName, 'DisplayFormat') = 0) then
    String(aValue) := TppElement(aObject).DisplayFormat

  else if (CompareText(aPropName, 'ElementIndex') = 0) then
    Integer(aValue) := TppElement(aObject).ElementIndex

  else if (CompareText(aPropName, 'Font') = 0) then
    Integer(aValue) := Integer(TppElement(aObject).Font)

  else if (CompareText(aPropName, 'Height') = 0) then
    Integer(aValue) := TppElement(aObject).Height

  else if (CompareText(aPropName, 'Left') = 0) then
    Integer(aValue) := TppElement(aObject).Left

  else if (CompareText(aPropName, 'Width') = 0) then
    Integer(aValue) := TppElement(aObject).Width

  else if (CompareText(aPropName, 'TextHeight') = 0) then
    Integer(aValue) := TppElement(aObject).TextHeight

  else if (CompareText(aPropName, 'TextWidth') = 0) then
    Integer(aValue) := TppElement(aObject).TextWidth

  else if (CompareText(aPropName, 'Visible') = 0) then
    Integer(aValue) := Ord(TppElement(aObject).Visible)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppElementRTTI.SetPropValue }

class function TraTppElementRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Alignment') = 0) then
    TppElement(aObject).Alignment := TAlignment(aValue)

  else if (CompareText(aPropName, 'Color') = 0) then
    TppElement(aObject).Color := TColor(aValue)

  else if (CompareText(aPropName, 'DisplayFormat') = 0) then
    TppElement(aObject).DisplayFormat := String(aValue)

  else if (CompareText(aPropName, 'ElementIndex') = 0) then
    TppElement(aObject).ElementIndex := Integer(aValue)

  else if (CompareText(aPropName, 'Font') = 0) then
    TppElement(aObject).Font := TFont(aValue)

  else if (CompareText(aPropName, 'Height') = 0) then
    TppElement(aObject).Height := Integer(aValue)

  else if (CompareText(aPropName, 'Left') = 0) then
    TppElement(aObject).Left := Integer(aValue)

  else if (CompareText(aPropName, 'Width') = 0) then
    TppElement(aObject).Width := Integer(aValue)

  else if (CompareText(aPropName, 'TextHeight') = 0) then
    TppElement(aObject).TextHeight := Integer(aValue)

  else if (CompareText(aPropName, 'TextWidth') = 0) then
    TppElement(aObject).TextWidth := Integer(aValue)

  else if (CompareText(aPropName, 'Visible') = 0) then
    TppElement(aObject).Visible := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** D I M E N S I O N   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppDimensionRTTI.RefClass }

class function TraTppDimensionRTTI.RefClass: TClass;
begin
  Result := TppDimension;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppDimensionRTTI.GetPropList }

class procedure TraTppDimensionRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('NullOrder');
  aPropList.AddProp('Skip');
  aPropList.AddProp('SkipNulls');
  aPropList.AddProp('SubTotalCount');
  aPropList.AddProp('SubTotals');
  aPropList.AddProp('SortType');

  {add public methods}
  aPropList.AddMethod('Clear');
  aPropList.AddMethod('GetCaption');
  aPropList.AddMethod('GetFieldDataType');
  aPropList.AddMethod('GetIndex');
  aPropList.AddMethod('GetValue');
  aPropList.AddMethod('ShowSubTotals');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppDimensionRTTI.GetPropRec }

class function TraTppDimensionRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {methods}
  if (CompareText(aPropName, 'Clear') = 0) then
    MethodToRec(aPropName, False, aPropRec)

  else if (CompareText(aPropName, 'GetCaption') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'GetFieldDataType') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'GetIndex') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'GetValue') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'ShowSubTotals') = 0) then
    MethodToRec(aPropName, True, aPropRec)


  {properties}
  else if (CompareText(aPropName, 'NullOrder') = 0) then
    EnumPropToRec(aPropName, 'TppNullOrderType', False, aPropRec)

  else if (CompareText(aPropName, 'Skip') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'SkipNulls') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'SubTotalCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'SubTotals') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'SortType') = 0) then
    EnumPropToRec(aPropName, 'TppSortOrderType', False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppDimensionRTTI.GetParams }

class function TraTppDimensionRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  {methods}
  if (CompareText(aMethodName, 'GetCaption') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Result', daString, nil, '', False, False);
    end

  else if (CompareText(aMethodName, 'GetFieldDataType') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Result', daEnum, nil, 'TppDataType', False, False);
    end

  else if (CompareText(aMethodName, 'GetIndex') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Result', daInteger, nil, '', False, False);
    end

  else if (CompareText(aMethodName, 'GetValue') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Result', daVariant, nil, '', False, False);
    end

  else if (CompareText(aMethodName, 'ShowSubTotals') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('aValue', daBoolean, nil, '', False, False);
    end

  else if (CompareText(aMethodName, 'SubTotals') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppSubTotal, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppDimensionRTTI.CallMethod }

class function TraTppDimensionRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lDimension: TppDimension;
  lString: String;
  lBoolean: Boolean;
  lDataType: TppDataType;
  lInteger: Integer;
  lObject: Integer;
  lVariant: Variant;
  liIndex: Integer;
begin

  Result := True;

  lDimension := TppDimension(aObject);

  if (CompareText(aMethodName, 'Clear') = 0) then
    lDimension.Clear

  else if (CompareText(aMethodName, 'GetCaption') = 0) then
    begin
      lString := lDimension.GetCaption;

      aParams.SetParamValue(0, lString);
    end

  else if (CompareText(aMethodName, 'GetFieldDataType') = 0) then
    begin
      lDataType := lDimension.GetFieldDataType;

      aParams.SetParamValue(0, lDataType);
    end

  else if (CompareText(aMethodName, 'GetIndex') = 0) then
    begin
      lInteger := lDimension.GetIndex;

      aParams.SetParamValue(0, lInteger);
    end

  else if (CompareText(aMethodName, 'GetValue') = 0) then
    begin
      lVariant := lDimension.GetValue;

      aParams.SetParamValue(0, lVariant);
    end

  else if (CompareText(aMethodName, 'ShowSubTotals') = 0) then
    begin
      aParams.GetParamValue(0, lBoolean);

      lDimension.ShowSubTotals(lBoolean);
    end

  else if (CompareText(aMethodName, 'SubTotals') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lObject := Integer(lDimension.SubTotals[liIndex]);

      aParams.SetParamValue(1, lObject);
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppDimensionRTTI.GetPropValue }

class function TraTppDimensionRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'NullOrder') = 0) then
    Integer(aValue) := Ord(TppDimension(aObject).NullOrder)

  else if (CompareText(aPropName, 'Skip') = 0) then
    Boolean(aValue) := TppDimension(aObject).Skip

  else if (CompareText(aPropName, 'SkipNulls') = 0) then
    Boolean(aValue) := TppDimension(aObject).SkipNulls

  else if (CompareText(aPropName, 'SubTotalCount') = 0) then
    Integer(aValue) := TppDimension(aObject).SubTotalCount

  else if (CompareText(aPropName, 'SortType') = 0) then
    Integer(aValue) := Ord(TppDimension(aObject).SortType)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppDimensionRTTI.SetPropValue }

class function TraTppDimensionRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'NullOrder') = 0) then
    TppDimension(aObject).NullOrder := TppNullOrderType(aValue)

  else if (CompareText(aPropName, 'SkipNulls') = 0) then
    TppDimension(aObject).SkipNulls := Boolean(aValue)

  else if (CompareText(aPropName, 'SortType') = 0) then
    TppDimension(aObject).SortType := TppSortOrderType(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** V A L U E  D E F   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppValueDefRTTI.RefClass }

class function TraTppValueDefRTTI.RefClass: TClass;
begin
  Result := TppValueDef;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppValueDefRTTI.GetPropList }

class procedure TraTppValueDefRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {parameters: Name, DataType, Class, IsPublished, IsReadOnly}
  aPropList.AddProp('CaptionDef');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppValueDefRTTI.GetPropRec }

class function TraTppValueDefRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {properties}
  if (CompareText(aPropName, 'CaptionDef') = 0) then
    ClassPropToRec(aPropName, TppValueCaptionDef, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppValueDefRTTI.GetPropValue }

class function TraTppValueDefRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'CaptionDef') = 0) then
    Integer(aValue) := Integer(TppValueDef(aObject).CaptionDef)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}


{******************************************************************************
 *
 ** T O T A L   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppTotalRTTI.RefClass }

class function TraTppTotalRTTI.RefClass: TClass;
begin
  Result := TppTotal;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppTotalRTTI.GetPropList }

class procedure TraTppTotalRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props }
  aPropList.AddProp('CaptionDef');
  aPropList.AddProp('TotalDef');

  {add public methods}
  aPropList.AddMethod('CrossTab');
  aPropList.AddMethod('GetValueDef');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppTotalRTTI.GetPropRec }

class function TraTppTotalRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;


  {methods}
  if (CompareText(aPropName, 'CrossTab') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'GetValueDef') = 0) then
    MethodToRec(aPropName, True, aPropRec)


  {properties}
  else if (CompareText(aPropName, 'CaptionDef') = 0) then
    ClassPropToRec(aPropName, TppTotalCaptionDef, True, aPropRec)

  else if (CompareText(aPropName, 'TotalDef') = 0) then
    ClassPropToRec(aPropName, TppTotalDef, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppTotalRTTI.GetParams }

class function TraTppTotalRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  {methods}
  if (CompareText(aMethodName, 'CrossTab') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Result', daClass, TppCrossTab, '', False, False);
    end

  else if (CompareText(aMethodName, 'GetValueDef') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Result', daClass, TppValueDef, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppTotalRTTI.CallMethod }

class function TraTppTotalRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lTotal: TppTotal;
  lCrossTab: Integer;
  lValueDef: Integer;
begin

  Result := True;

  lTotal := TppTotal(aObject);

  if (CompareText(aMethodName, 'CrossTab') = 0) then
    begin
      lCrossTab := Integer(lTotal.CrossTab);

      aParams.SetParamValue(0, lCrossTab);
    end

  else if (CompareText(aMethodName, 'GetValueDef') = 0) then
    begin
      lValueDef := Integer(lTotal.GetValueDef);

      aParams.SetParamValue(0, lValueDef);
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppTotalRTTI.GetPropValue }

class function TraTppTotalRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'CaptionDef') = 0) then
    Integer(aValue) := Integer(TppTotal(aObject).CaptionDef)

  else if (CompareText(aPropName, 'TotalDef') = 0) then
    Integer(aValue) := Integer(TppTotal(aObject).TotalDef)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppColumnDef, TppRowDef, TppValueDef, TppGrandTotal, TppSubTotal,
                   TppTotalDef, TppTotalCaptionDef, TppValueCaptionDef]);

  ppRegisterComponent(TppCrossTab, 'Advanced Components', 2, 695, '', 0);

  raRegisterEnum('TppCrossTabPaginationType', TypeInfo(TppCrossTabPaginationType));
  raRegisterEnum('TppCrossTabChildType', TypeInfo(TppCrossTabChildType));
  raRegisterEnum('TppCrossTabPaginationType', TypeInfo(TppCrossTabPaginationType));
  raRegisterEnum('TppTotalType', TypeInfo(TppTotalType));
  raRegisterEnum('TppNullOrderType', TypeInfo(TppNullOrderType));

  raRegisterRTTI(TraTppCrossTabRTTI);
  raRegisterRTTI(TraTppElementRTTI);
  raRegisterRTTI(TraTppDimensionRTTI);
  raRegisterRTTI(TraTppValueDefRTTI);
  raRegisterRTTI(TraTppTotalRTTI);

finalization

  ppUnRegisterComponent(TppCrossTab);

  UnRegisterClasses([TppColumnDef, TppRowDef, TppValueDef, TppGrandTotal, TppSubTotal,
                     TppTotalDef, TppTotalCaptionDef, TppValueCaptionDef]);

  raUnRegisterEnum('TppCrossTabPaginationType');
  raUnRegisterEnum('TppCrossTabChildType');
  raUnRegisterEnum('TppCrossTabPaginationType');
  raUnRegisterEnum('TppTotalType');
  raUnRegisterEnum('TppNullOrderType');

  raUnRegisterRTTI(TraTppCrossTabRTTI);
  raUnRegisterRTTI(TraTppElementRTTI);
  raUnRegisterRTTI(TraTppDimensionRTTI);
  raUnRegisterRTTI(TraTppValueDefRTTI);
  raUnRegisterRTTI(TraTppTotalRTTI);

end.
