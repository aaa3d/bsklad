{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDB;

interface

{$I ppIfDef.pas}

uses
  Classes, SysUtils, Graphics, Forms, TypInfo,
  ppTypes, ppCache, ppComm, Dialogs, ppDsIntf, ppRelatv, ppRTTI;

type


  TppField = class;
  TppMasterFieldLink = class;
  TppDataPipelineList = class;

  { TppDataPipeline }
  TppDataPipeline = class(TppCacheable)
    private
      FBookmarks: TList;
      FCurrentBookmark: Longint;
      FDataTraversed: Boolean;
      FDataView: TComponent;
      FMasterDataPipeline: TppDataPipeline;
      FMoveBy: Integer;
      FRangeEnd: TppRangeEndType;
      FRangeEndCount: Longint;
      FRangeBegin: TppRangeBeginType;
      FSkipWhenNoRecords: Boolean;
      FState: TppDataPipelineStates;
      FTraversalCount: Longint;
      FVisible: Boolean;

      FOnClose: TNotifyEvent;
      FOnDataChange: TNotifyEvent;
      FOnFirst: TNotifyEvent;
      FOnGotoBookmark: TNotifyEvent;
      FOnLast: TNotifyEvent;
      FOnMasterRecordPositionChange: TNotifyEvent;
      FOnNext: TNotifyEvent;
      FOnOpen: TNotifyEvent;
      FOnPrior: TNotifyEvent;
      FOnRecordPositionChange: TNotifyEvent;
      FOnTraversal: TNotifyEvent;

      function  GetBOF: Boolean;
      function  GetDataView: TComponent;
      function  GetEOF: Boolean;
      function  GetFieldValueForAlias(aFieldAlias: String): Variant;
      function  InChain(aDataPipeline: TppDataPipeline): Boolean;
      procedure SetDataView(aDataView: TComponent);
      procedure SetMasterDataPipeline(aDataPipeline: TppDataPipeline);
      procedure SetMoveBy(aValue: Integer);
      procedure SetRangeBegin(aValue: TppRangeBeginType);
      procedure SetRangeEnd(aValue: TppRangeEndType);
      procedure SetRangeEndCount(aValue: Longint);
      procedure SetSkipWhenNoRecords(aValue: Boolean);
      procedure UpdateMoveBy;
      function  CheckLinkedBOF: Boolean;
      function  CheckLinkedEOF: Boolean;

    protected
      class function AppearsOnDelphiPalette: Boolean; override;

      procedure ReadState(Reader: TReader); override;

      function  CheckBOF: Boolean; virtual; abstract;
      function  CheckEOF: Boolean; virtual; abstract;
      procedure CloseDataSet; virtual; abstract;
      procedure FreeCurrentBookmark;
      function  GetActive: Boolean; virtual; abstract;
      procedure DoOnActiveChange;
      procedure DoOnDataChange;
      procedure DoOnGotoBookmark;
      procedure GotoFirstRecord; virtual; abstract;
      procedure GotoLastRecord; virtual; abstract;
      procedure OpenDataSet; virtual; abstract;
      procedure TraverseBy(aIncrement: Integer); virtual; abstract;

      {field support}
      function  GetAutoCreateFields: Boolean; virtual; abstract;                             
      procedure SetAutoCreateFields(aValue: Boolean); virtual; abstract;
      function  GetCurrentField: TppField; virtual; abstract;
      function  GetCreatingDefaultFields: Boolean; virtual; abstract;
      function  GetFieldCount: Integer; virtual; abstract;
      function  GetFieldForIndex(aIndex: Integer): TppField; virtual; abstract;
      function  GetMasterFieldLinkCount: Integer; virtual; abstract;
      function  GetMasterFieldLinkForIndex(aIndex: Integer): TppMasterFieldLink; virtual; abstract;
      function  GetMasterFieldLinks: TStrings; virtual; abstract;
      procedure SetMasterFieldLinks(aMasterFieldLinks: TStrings); virtual; abstract;

      {field support}
      property AutoCreateFields: Boolean read GetAutoCreateFields write SetAutoCreateFields default True;
      property CreatingDefaultFields: Boolean read GetCreatingDefaultFields;

      property MoveBy: Integer read FMoveBy write SetMoveBy default 1;
      property RangeEnd: TppRangeEndType read FRangeEnd write SetRangeEnd default reLastRecord;
      property RangeEndCount: Longint read FRangeEndCount write SetRangeEndCount default 0;
      property RangeBegin: TppRangeBeginType read FRangeBegin write SetRangeBegin default rbFirstRecord;

      {events}
      property OnClose: TNotifyEvent read FOnClose write FOnClose;
      property OnDataChange: TNotifyEvent read FOnDataChange write FOnDataChange;
      property OnFirst: TNotifyEvent read FOnFirst write FOnFirst;
      property OnGotoBookmark: TNotifyEvent read FOnGotoBookmark write FOnGotoBookmark;
      property OnLast: TNotifyEvent read FOnLast write FOnLast;
      property OnMasterRecordPositionChange: TNotifyEvent read FOnMasterRecordPositionChange write FOnMasterRecordPositionChange;
      property OnNext: TNotifyEvent read FOnNext write FOnNext;
      property OnOpen: TNotifyEvent read FOnOpen write FOnOpen;
      property OnPrior: TNotifyEvent read FOnPrior write FOnPrior;
      property OnRecordPositionChange: TNotifyEvent read FOnRecordPositionChange write FOnRecordPositionChange;
      property OnTraversal: TNotifyEvent read FOnTraversal write FOnTraversal;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
      procedure EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList); override;

      function HasParent: Boolean; override;

      procedure ExcludeState(aStateSet: TppDataPipelineStates);
      procedure IncludeState(aStateSet: TppDataPipelineStates);

      procedure AddBookmark(aBookmark: Longint);
      procedure ClearBookmarkList;
      procedure Close;
      procedure DoOnTraversal;
      procedure First;
      procedure FreeBookmarks;
      function  FindField(aFieldName: String): Integer;
      procedure GetQualifiedFieldNames(aFieldNameList: TStrings);
      procedure Last;
      procedure Next;
      procedure Open;
      procedure Prior;
      procedure RemoveBookmark(aBookmark: Longint);
      procedure RestoreRecordPosition;
      procedure SetBookmark;
      procedure Skip;
      procedure SkipBack;
      procedure UpdateCurrentBookmark;
      procedure UpdateState;

      {new for 4.0}
      procedure RecordPositionChanged; virtual;
      procedure MasterRecordPositionChanged; virtual;
      procedure StartOfMainReport(aPipelines: TppDataPipelineList); virtual;
      procedure EndOfMainReport(aPipelines: TppDataPipelineList); virtual;

      {3.0}
      procedure FreeBookmark(aBookmark: Longint); virtual; abstract;
      function  GetBookmark: Longint; virtual; abstract;
      function  GetDataSetName: String; virtual; abstract;
      function  GetFieldNames(aFieldNameList: TStrings): Boolean; virtual; abstract;
      function  GetFieldAlignment(aFieldName: String): TAlignment; virtual; abstract;
      function  GetFieldAsDouble(aFieldName: String): Double; virtual; abstract;
      function  GetFieldAsPicture(aFieldName: String): TPicture; virtual; abstract;
      function  GetFieldAsString(aFieldName: String): String; virtual; abstract;
      function  GetFieldDataType(aFieldName: String): TppDataType; virtual; abstract;
      function  GetFieldDisplayWidth(aFieldName: String): Integer; virtual; abstract;
      function  GetFieldIsCalculated(aFieldName: String): Boolean; virtual; abstract;
      function  GetFieldSize(aFieldName: String): Integer; virtual; abstract;
      function  GetFieldValue(aFieldName: String): Variant; virtual; abstract;

      procedure GotoBookmark(aBookmark: Longint); virtual;

      {optional section

       These search/edit/insert routines are required if you want to load and
       save Report templates to database blob fields as in the End-User demo}

      procedure Edit;  virtual;
      procedure GetFieldAsStream(aFieldName: String; aStream: TStream); virtual;
      procedure Insert; virtual;
      procedure Delete; virtual;
      function  Locate(const aFieldName: String; aKeyValue: Variant; aOptions: TppLocateOptions): Boolean; virtual;

      procedure Post; virtual;
      procedure SetFieldFromStream(aFieldName: String; aStream: TStream); virtual;
      procedure SetFieldValue(aFieldName: String; aValue: Variant); virtual;

      {end of optional section}

      {field support}
      procedure AddField(aField: TppField); virtual; abstract;
      procedure CreateDefaultFields; virtual; abstract;
      function  DefineField(aFieldName: String; aDataType: TppDataType; aFieldLength: Integer): Integer; virtual; abstract;
      procedure FreeFields; virtual; abstract;
      function  RemoveField(aField: TppField): Integer; virtual; abstract;
      function  FieldAliasForFieldName(const aFieldName: String): String; virtual; abstract;
      function  FieldNameForFieldAlias(const aFieldAlias: String): String; virtual; abstract;
      function  GetFieldAliases(aFieldAliasList: TStrings): Boolean; virtual; abstract;
      function  GetFieldForName(const aFieldName: String): TppField; virtual; abstract;
      function  GetFieldForAlias(const aFieldAlias: String): TppField; virtual; abstract;
      function  IndexOfFieldName(const aFieldName: String): Integer; virtual; abstract;
      function  IndexOfField(aField: TppField): Integer; virtual; abstract;
      function  IsValidDataType(aDataType: TppDataType): Boolean; virtual; abstract;
      procedure InsertField(aPosition: Integer; aField: TppField); virtual; abstract;

      {new for 4.0}
      function  IsLinked: Boolean; virtual; abstract;
      procedure AddMasterFieldLink(aMasterFieldLink: TppMasterFieldLink); virtual; abstract;
      function  RemoveMasterFieldLink(aMasterFieldLink: TppMasterFieldLink): Integer; virtual; abstract;
      procedure FreeMasterFieldLinks; virtual; abstract;
      function  CheckLinkedData: Integer; virtual; abstract;
      procedure LocateLinkedDataFirst; virtual; abstract;
      procedure LocateLinkedDataLast; virtual; abstract;
      procedure TraverseLinkedData(aIncrement: Integer); virtual; abstract;

      property Active: Boolean read GetActive;
      property BOF: Boolean read GetBOF;
      property DataTraversed: Boolean read FDataTraversed write FDataTraversed;
      property DataView: TComponent read GetDataView write SetDataView;
      property EOF: Boolean read GetEOF;
      property State: TppDataPipelineStates read FState write FState;
      property SkipWhenNoRecords: Boolean read FSkipWhenNoRecords write SetSkipWhenNoRecords default True;
      property TraversalCount: Longint read FTraversalCount write FTraversalCount;
      property Visible: Boolean read FVisible write FVisible default True;

      {note: this enables you to code DataPipeline['myFieldAlias'] to get a value }
      property FieldValues[Index: String]: Variant read GetFieldValueForAlias; default;

      {field related}
      property CurrentField: TppField read GetCurrentField;
      property Fields[Index: Integer]: TppField read GetFieldForIndex;
      property FieldCount: Integer read GetFieldCount;
      property MasterDataPipeline: TppDataPipeline read FMasterDataPipeline write SetMasterDataPipeline;
      property MasterFieldLinkCount: Integer read GetMasterFieldLinkCount;
      property MasterFieldLinkItems[Index: Integer]: TppMasterFieldLink read GetMasterFieldLinkForIndex;
      property MasterFieldLinks: TStrings read GetMasterFieldLinks write SetMasterFieldLinks stored False;

  end; {class, TppDataPipeline}


  { TppCustomDataPipeline }
  TppCustomDataPipeline = class(TppDataPipeline)
    private
      FAbsolutePageCount: Longint;
      FAutoCreateFields: Boolean;
      FBookmarksExist: Boolean;
      FCreatingDefaultFields: Boolean;
      FCurrentField: TppField;
      FFieldsOutOfSync: Boolean;
      FMasterFieldLinks: TStringList;

      procedure FreePageBookmarks(aStartPageNo: Longint);

    protected
      function  SetFieldName(aFieldName: String): Boolean; virtual;
      procedure SyncFields;

      {field support}
      function  GetAutoCreateFields: Boolean; override;
      function  GetCurrentField: TppField; override;
      function  GetCreatingDefaultFields: Boolean; override;
      function  GetFieldCount: Integer; override;
      function  GetFieldForIndex(aIndex: Integer): TppField; override;

      function  GetMasterFieldLinkCount: Integer; override;
      function  GetMasterFieldLinkForIndex(aIndex: Integer): TppMasterFieldLink; override;
      function  GetMasterFieldLinks: TStrings; override;
      procedure SetMasterFieldLinks(aMasterFieldLinks: TStrings); override;

      procedure SetAutoCreateFields(aValue: Boolean); override;

      property FieldsOutOfSync: Boolean read FFieldsOutOfSync;

    protected
      {override from TppRelative}
      procedure SaveComponents(Proc: TGetChildProc); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  GetValidName(aComponent: TComponent): String;  override;
      procedure Loaded; override;

      {override from TppCommunicator}
      procedure PropertyChange; override;

      {override from TppCacheable}
      procedure FreeCache(aAbsolutePageCount: Longint); override;
      procedure SaveToCache(aAbsolutePageNo: Longint); override;

      {override from TppRelative}
      procedure AddChild(aChild: TppRelative); override;
      procedure InsertChild(aPosition: Integer; aChild: TppRelative); override;
      function  IndexOfChild(aChild: TppRelative): Integer; override;
      function  RemoveChild(aChild: TppRelative): Integer; override;

      {overriden from TppDataPipeline}
      function  GetFieldNames(aFieldNameList: TStrings): Boolean; override;
      function  GetFieldAlignment(aFieldName: String): TAlignment; override;
      function  GetFieldDataType(aFieldName: String): TppDataType; override;
      function  GetFieldDisplayWidth(aFieldName: String): Integer; override;
      function  GetFieldSize(aFieldName: String): Integer; override;

      {field support}
      procedure AddField(aField: TppField); override;
      procedure CreateDefaultFields; override;
      function  DefineField(aFieldName: String; aDataType: TppDataType; aFieldLength: Integer): Integer; override;
      function  RemoveField(aField: TppField): Integer; override;
      function  FieldAliasForFieldName(const aFieldName: String): String; override;
      function  FieldNameForFieldAlias(const aFieldAlias: String): String; override;
      procedure FreeFields; override;
      function  GetFieldAliases(aFieldAliasList: TStrings): Boolean; override;
      function  GetFieldForAlias(const aFieldAlias: String): TppField; override;
      function  GetFieldForName(const aFieldName: String): TppField; override;
      function  IndexOfFieldName(const aFieldName: String): Integer; override;
      function  IndexOfField(aField: TppField): Integer; override;
      function  IsValidDataType(aDataType: TppDataType): Boolean; override;
      procedure InsertField(aPosition: Integer; aField: TppField); override;

      function  IsLinked: Boolean; override;
      function  CheckLinkedData: Integer; override;
      procedure FreeMasterFieldLinks; override;
      procedure AddMasterFieldLink(aMasterFieldLink: TppMasterFieldLink); override;
      function  RemoveMasterFieldLink(aMasterFieldLink: TppMasterFieldLink): Integer; override;
      procedure MasterRecordPositionChanged; override;
      procedure LocateLinkedDataFirst; override;
      procedure LocateLinkedDataLast; override;
      procedure TraverseLinkedData(aIncrement: Integer); override;

  end; {class, TppCustomDataPipeline}


  { TppField }
  TppField = class(TppRelative)
    private
      FAlignment: TAlignment;
      FAutoSearch: Boolean;
      FColumnWidth: Integer;
      FDataType: TppDataType;
      FDisplayFormat: String;
      FDisplayWidth: Integer;
      FFieldLength: Integer;
      FFieldAlias: String;
      FFieldName: String;
      FFirstField: Boolean;
      FGroupOrder: Integer;
      FMandatory: Boolean;
      FReportComponent: TppCommunicator;
      FReportLabel: TppCommunicator;
      FSelectable: Boolean;
      FSelectOrder: Integer;
      FSearchable: Boolean;
      FSearch: Boolean;
      FSearchExpression: String;
      FSearchOrder: Integer;
      FSortable: Boolean;
      FSortOrder: Integer;
      FSortOrderType: TppSortOrderType;
      FSort: Boolean;
      FSortExpression: String;
      FSortType: TppSortOrderType;
      FTableAlias: String;
      FTableName: String;

      function  GetDataPipeline: TppDataPipeline;
      procedure SetDataPipeline(aDataPipeline: TppDataPipeline);
      procedure SetDataType(aDataType: TppDataType);

      function  GetFieldAsDouble: Double;
      function  GetFieldAsPicture: TPicture;
      function  GetFieldAsString: String;
      function  GetFieldValue: Variant;

    protected
      procedure SetFieldName(const aFieldName: String); virtual;
      procedure SetSearchExpression(const aExpression: String); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  HasParent: Boolean; override;

      property AsDouble: Double read GetFieldAsDouble;
      property AsPicture: TPicture read GetFieldAsPicture;
      property AsString: String read GetFieldAsString;
      property DataPipeline: TppDataPipeline read GetDataPipeline write SetDataPipeline;
      property Value: Variant read GetFieldValue;

      {these properties used by the report wizard only}
      property AutoSearch: Boolean read FAutoSearch write FAutoSearch default False;
      property ColumnWidth: Integer read FColumnWidth write FColumnWidth;
      property FirstField: Boolean read FFirstField write FFirstField default False;
      property ReportComponent: TppCommunicator read FReportComponent write FReportComponent;
      property ReportLabel: TppCommunicator read FReportLabel write FReportLabel;
      property Mandatory: Boolean read FMandatory write FMandatory default False;

    published
      property Alignment: TAlignment read FAlignment write FAlignment default taLeftJustify;
      property FieldAlias: String read FFieldAlias write FFieldAlias;
      property FieldName: String read FFieldName write SetFieldName;
      property FieldLength: Integer read FFieldLength write FFieldLength;
      property GroupOrder: Integer read FGroupOrder write FGroupOrder default -1;
      property DataType: TppDataType read FDataType write SetDataType default dtString;
      property DisplayFormat: String read FDisplayFormat write FDisplayFormat;
      property DisplayWidth: Integer read FDisplayWidth write FDisplayWidth;
      property Position;
      property Selectable: Boolean read FSelectable write FSelectable default True;
      property SelectOrder: Integer read FSelectOrder write FSelectOrder default -1;
      property Searchable: Boolean read FSearchable write FSearchable default True;
      property Search: Boolean read FSearch write FSearch default False;
      property SearchExpression: String read FSearchExpression write SetSearchExpression;
      property SearchOrder: Integer read FSearchOrder write FSearchOrder default -1;
      property Sortable: Boolean read FSortable write FSortable default True;
      property Sort: Boolean read FSort write FSort default False;
      property SortOrder: Integer read FSortOrder write FSortOrder default -1;
      property SortType: TppSortOrderType read FSortType write FSortType default soAscending;
      property SortExpression: String read FSortExpression write FSortExpression;
      property TableAlias: String read FTableAlias write FTableAlias;
      property TableName: String read FTableName write FTableName;

  end; {class, TppField}

  { TppAutoSearchField }
  TppAutoSearchField = class(TppField)
    private
      FAsFilter: Boolean;
      FAutoSearchPanel: TComponent;
      FCriteria: TComponent;
      FDataPipelineName: String;
      FDataView: TComponent;
      FDelimiter: String;
      FLastField: Boolean;
      FOnChange: TNotifyEvent;
      FParentControl: TComponent;
      FSearchOperator: TppSearchOperatorType;
      FShowAllValues: Boolean;
      FWildCard: String;

      function  ConvertValue(const aValue: String): Variant;
      procedure DoOnChange;
      function  GetValue: Variant;
      function  GetValues(aIndex: Integer): Variant;
      function  GetValueCount: Integer;
      procedure SetCriteria(aCriteria: TComponent);
      procedure SetDataPipelineName(const aName: String);
      procedure SetSearchOperator(aOperator: TppSearchOperatorType);
      procedure SetShowAllValues(aValue: Boolean);

    protected
      procedure SetFieldName(const aFieldName: String); override;
      procedure SetSearchExpression(const aExpression: String); override;

    public
      constructor Create(aOwner: TComponent); override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
      
      function Description: String;
      function FilterString: String;
      function FormattedExpression: String;
      function FormatValue(aValue: String): String;
      function OperatorAsString: String;
      function OperatorDesc: String;
      function SQLString: String;
      function Valid: Boolean;

      property AutoSearchPanel: TComponent read FAutoSearchPanel write FAutoSearchPanel;
      property Criteria: TComponent read FCriteria write SetCriteria;
      property DataPipelineName: String read FDataPipelineName write SetDataPipelineName;
      property DataView: TComponent read FDataView write FDataView;
      property LastField: Boolean read FLastField write FLastField;
      property ParentControl: TComponent read FParentControl write FParentControl;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;
      property Value: Variant read GetValue;
      property Values[Index: Integer]: Variant read GetValues;
      property ValueCount: Integer read GetValueCount;

    published
      property Delimiter: String read FDelimiter write FDelimiter;
      property SearchOperator: TppSearchOperatorType read FSearchOperator write SetSearchOperator default soEqual;
      property ShowAllValues: Boolean read FShowAllValues write SetShowAllValues;
      property WildCard: String read FWildCard write FWildCard;

  end; {class, TppAutoSearchField}

  { TppMasterFieldLink }
  TppMasterFieldLink = class(TppRelative)
    private
      FMasterFieldName: String;
      FDetailFieldName: String;

      function  GetDetailDataPipeline: TppDataPipeline;
      function  GetMasterDataPipeline: TppDataPipeline;
      procedure SetDetailDataPipeline(aDataPipeline: TppDataPipeline);

    public
      constructor Create(aOwner: TComponent); override;

      function  HasParent: Boolean; override;

      property MasterDataPipeline: TppDataPipeline read GetMasterDataPipeline;
      property DetailDataPipeline: TppDataPipeline read GetDetailDataPipeline write SetDetailDataPipeline;

    published
      property MasterFieldName: String read FMasterFieldName write FMasterFieldName;
      property DetailFieldName: String read FDetailFieldName write FDetailFieldName;

  end; {class, TppMasterFieldLink}


  { TppDataPipelineList }
  TppDataPipelineList = class(TStringList)
    private
      FReport: TComponent;
      FFormDesigner: TppFormDesigner;

      procedure AddDataPipeline(aDataPipeline: TComponent);

      procedure BuildList;

      procedure BuildDataListFromDataModule(aDataModule: TDataModule);
      procedure BuildDataListFromDesigner(aDesigner: TppFormDesigner);
      procedure BuildDataListFromOwner(aOwner: TComponent);

      procedure GetDataItemsCallback(const S: String);

      function  GetDataPipelineForName(aName: String): TppDataPipeline;

      procedure SetReport(aReport: TComponent);

    public
      constructor Create(aReport: TComponent); virtual;

      destructor Destroy; override;

      function GetPipeline(aIndex: Integer): TppDataPipeline;
      procedure Refresh;

      property Report: TComponent read FReport write SetReport;

      property Pipelines[aUserName: String]: TppDataPipeline read GetDataPipelineForName;

    end; {class, TppDataPipelineList}


{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppDataPipelineRTTI }
  TraTppDataPipelineRTTI = class(TraTppCacheableRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppDataPipelineRTTI}

  { TraTppAutoSearchFieldRTTI }
  TraTppAutoSearchFieldRTTI = class(TraTppRelativeRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppAutoSearchFieldRTTI}

implementation

uses
  ppClass, ppUtils;

{******************************************************************************
 *
 ** D A T A   P I P E L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Create }

constructor TppDataPipeline.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  CacheRecordSize := SizeOf(TppDataPipelineSaveRec);

  EventNotifies := [ciPipelineRecordPositionChange];

  FBookmarks := nil;
  FCurrentBookmark := 0;
  FDataView := nil;
  FDataTraversed := False;
  FMoveBy := 1;
  FRangeBegin := rbFirstRecord;
  FRangeEnd := reLastRecord;
  FRangeEndCount := 0;
  FSkipWhenNoRecords := True;
  FState := [];
  FTraversalCount := 0;
  FVisible := True;

  FOnClose := nil;
  FOnFirst := nil;
  FOnGotoBookmark := nil;
  FOnLast := nil;
  FOnNext := nil;
  FOnOpen := nil;
  FOnPrior := nil;
  FOnTraversal := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Destroy }

destructor TppDataPipeline.Destroy;
begin

  SetDataView(nil);
  FBookmarks.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Notify }

procedure TppDataPipeline.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation = ppopRemove) then
    begin

      if (aCommunicator = FMasterDataPipeline)  then
        FMasterDataPipeline := nil;

    end;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDataPipeline.AppearsOnDelphiPalette}

class function TppDataPipeline.AppearsOnDelphiPalette: Boolean;
begin

  {this class function enables TppRelative descendants to decide whether to use
   the TComponent fake Left, Top  properties required for non-visual components
   installed onto the Delphi component palette}
  Result := True;

end; {class function, AppearsOnDelphiPalette}



{------------------------------------------------------------------------------}
{ TppDataPipeline.HasParent }

function TppDataPipeline.HasParent: Boolean;
begin
  Result := False;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppDataPipeline.CheckLinkedBOF }

function TppDataPipeline.CheckLinkedBOF: Boolean;
begin

  if IsLinked then
    Result := CheckBOF or (CheckLinkedData <> 0)
  else
    Result := CheckBOF;

end;  {function, CheckLinkedBOF}

{------------------------------------------------------------------------------}
{ TppDataPipeline.CheckLinkedEOF }

function TppDataPipeline.CheckLinkedEOF: Boolean;
begin

  if IsLinked then
    Result := CheckEOF or (CheckLinkedData <> 0)
  else
    Result := CheckEOF;

end;  {function, CheckLinkedEOF}

{------------------------------------------------------------------------------}
{ TppDataPipeline.RecordPositionChanged }

procedure TppDataPipeline.RecordPositionChanged;
begin

  if Assigned(FOnRecordPositionChange) then FOnRecordPositionChange(Self);

  SendEventNotify(Self, ciPipelineRecordPositionChange, nil);

end; {procedure, RecordPositionChanged}

{------------------------------------------------------------------------------}
{ TppDataPipeline.MasterRecordPositionChanged }

procedure TppDataPipeline.MasterRecordPositionChanged;
begin

  if Assigned(FOnMasterRecordPositionChange) then FOnMasterRecordPositionChange(Self);

  SendEventNotify(Self, ciPipelineMasterRecordPositionChange, nil);

end; {procedure, MasterRecordPositionChanged}

{------------------------------------------------------------------------------}
{ TppDataPipeline.StartOfMainReport }

procedure TppDataPipeline.StartOfMainReport(aPipelines: TppDataPipelineList);
begin

end; {procedure, StartOfMainReport}

{------------------------------------------------------------------------------}
{ TppDataPipeline.EndOfMainReport }

procedure TppDataPipeline.EndOfMainReport(aPipelines: TppDataPipelineList);
begin

end; {procedure, EndOfMainReport}

{------------------------------------------------------------------------------}
{ TppDataPipeline.InChain }

function TppDataPipeline.InChain(aDataPipeline: TppDataPipeline): Boolean;
begin
  if (FMasterDataPipeline <> nil) then
    begin
      if (FMasterDataPipeline = aDataPipeline) then
        Result := True
      else
        Result := FMasterDataPipeline.InChain(aDataPipeline);
    end
  else
    Result := False;
end; {function, InChain}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetMasterDataPipeline }

procedure TppDataPipeline.SetMasterDataPipeline(aDataPipeline: TppDataPipeline);
begin

  if (aDataPipeline = Self) then Exit;

  if (aDataPipeline <> nil) and aDataPipeline.InChain(Self) then Exit;

  if (FMasterDataPipeline <> nil) then
    FMasterDataPipeline.RemoveEventNotify(Self);

  FMasterDataPipeline := aDataPipeline;

  if (FMasterDataPipeline <> nil) then
    FMasterDataPipeline.AddEventNotify(Self);

end; {procedure, SetMasterDataPipeline}

{------------------------------------------------------------------------------}
{ TppDataPipeline.EventNotify }

procedure TppDataPipeline.EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
begin

  inherited EventNotify(aCommunicator, aEventID, aParams);

  if (aCommunicator = FMasterDataPipeline) and (aEventID = ciPipelineRecordPositionChange) then
    MasterRecordPositionChanged;

end; {procedure, EventNotify}

{------------------------------------------------------------------------------}
{ TppDataPipeline.DoOnTraversal }

procedure TppDataPipeline.DoOnTraversal;
begin
  if Assigned(FOnTraversal) then FOnTraversal(Self);

  SendEventNotify(Self, ciPipelineTraversal, nil);
end; {procedure, DoOnTraversal}

{------------------------------------------------------------------------------}
{ TppDataPipeline.AddBookmark }

procedure TppDataPipeline.AddBookmark(aBookmark: Longint);
begin
  if (FBookmarks = nil) then
    FBookmarks := TList.Create;

  FBookmarks.Add(TObject(aBookmark));

end; {procedure, AddBookmark}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetBookmark }

procedure TppDataPipeline.SetBookmark;
begin
  AddBookmark(GetBookmark);
end; {procedure, SetBookmark}

{------------------------------------------------------------------------------}
{ TppDataPipeline.RemoveBookmark }

procedure TppDataPipeline.RemoveBookmark(aBookmark: Longint);
var
  liIndex: Integer;
begin
  if (FBookmarks = nil) then Exit;

  liIndex := FBookmarks.IndexOf(TObject(aBookmark));

  if (liIndex <> -1) then
    FBookmarks.Delete(liIndex);

  if (FBookmarks.Count = 0) then
    begin
      FBookmarks.Free;

      FBookmarks := nil;
    end;

end; {procedure, RemoveBookmark}

{------------------------------------------------------------------------------}
{ TppDataPipeline.GotoBookmark }

procedure TppDataPipeline.GotoBookmark(aBookmark: Longint);
begin
  DoOnGotoBookmark;

  RecordPositionChanged;
  
end; {procedure, GotoBookmark}

{------------------------------------------------------------------------------}
{ TppDataPipeline.DoOnGotoBookmark }

procedure TppDataPipeline.DoOnGotoBookmark;
begin
  if Assigned(FOnGotoBookmark) then FOnGotoBookmark(Self);

  SendEventNotify(Self, ciPipelineGotoBookmark, nil);
end; {procedure, DoOnGotoBookmark}

{------------------------------------------------------------------------------}
{ TppDataPipeline.FreeBookmarks }

procedure TppDataPipeline.FreeBookmarks;
var
  liBookmark: Integer;
  liBookmarks: Integer;
begin

  if (FBookmarks = nil) then Exit;

  {free the list of bookmarks}
  liBookmarks := FBookmarks.Count;

  for liBookmark := 0 to liBookmarks - 1 do
    FreeBookmark(Longint(FBookmarks[liBookmark]));

  ClearBookmarkList;

end; {procedure, FreeBookmarks}

{------------------------------------------------------------------------------}
{ TppDataPipeline.ClearBookmarkList }

procedure TppDataPipeline.ClearBookmarkList;
begin

  if (FBookmarks <> nil) then
    begin
      FBookmarks.Free;

      FBookmarks := nil;
    end;

end; {procedure, ClearBookmarkList}

{------------------------------------------------------------------------------}
{ TppDataPipeline.FindField }

function  TppDataPipeline.FindField(aFieldName: String): Integer;
var
  lFieldNames: TStringList;

begin
  Result := -1;

  lFieldNames := TStringList.Create;

  if GetFieldNames(lFieldNames) then
    Result := lFieldNames.IndexOf(aFieldName);

  lFieldNames.Free;

end; {function, FindField}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetMoveBy }

procedure TppDataPipeline.SetMoveBy(aValue: Integer);
begin
  FMoveBy := aValue;
  DoOnDataChange;

end; {procedure, SetMoveBy}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetSkipWhenNoRecords }

procedure TppDataPipeline.SetSkipWhenNoRecords(aValue: Boolean);
begin
  FSkipWhenNoRecords := aValue;
  DoOnDataChange;

end; {procedure, SetSkipWhenNoRecords}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetRangeBegin }

procedure TppDataPipeline.SetRangeBegin(aValue: TppRangeBeginType);
begin

  FRangeBegin := aValue;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  UpdateMoveBy;


end; {procedure, SetRangeBegin}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetRangeEnd }

procedure TppDataPipeline.SetRangeEnd(aValue: TppRangeEndType);
begin

  FRangeEnd := aValue;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  UpdateMoveBy;

end; {procedure, SetRangeEnd}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetRangeEndCount }

procedure TppDataPipeline.SetRangeEndCount(aValue: Longint);
begin
  FRangeEndCount:= aValue;
  DoOnDataChange;

end; {procedure, SetRangeEndCount}


{------------------------------------------------------------------------------}
{ TppDataPipeline.UpdateMoveBy }

procedure TppDataPipeline.UpdateMoveBy;
begin
  if (FRangeBegin = rbCurrentRecord) and (FRangeEnd = reFirstRecord) then
    FMoveBy := -1

  else if (FRangeBegin = rbLastRecord) and (FRangeEnd <> reLastRecord) then
    FMoveBy := -1

  else
    FMoveBy := 1;

  DoOnDataChange;

end; {procedure, UpdateMoveBy}

{------------------------------------------------------------------------------}
{ TppDataPipeline.IncludeState }

procedure TppDataPipeline.IncludeState(aStateSet: TppDataPipelineStates);
begin
  FState := FState + aStateSet;
end; {procedure, IncludeState}

{------------------------------------------------------------------------------}
{ TppDataPipeline.ExcludeState }

procedure TppDataPipeline.ExcludeState(aStateSet: TppDataPipelineStates);
begin
  FState := FState - aStateSet;
end; {procedure, ExcludeState}

{------------------------------------------------------------------------------}
{ TppDataPipeline.DoOnActiveChange }

procedure TppDataPipeline.DoOnActiveChange;
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) or (csDestroying in ComponentState) then Exit;

  if (FreeingChildren) or (CreatingDefaultFields) then Exit;

  SendNotify(Self, ppopActiveChange);

  SendEventNotify(Self, ciPipelineActiveChange, nil);

end; {procedure, DoOnActiveChange}

{------------------------------------------------------------------------------}
{ TppDataPipeline.DoOnDataChange }

procedure TppDataPipeline.DoOnDataChange;
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) or (csDestroying in ComponentState) then Exit;
  
  if (FreeingChildren) or (CreatingDefaultFields) then Exit;

  UpdateState;

  SendNotify(Self, ppopDataChange);

  SendEventNotify(Self, ciPipelineDataChange, nil);

  if Assigned(FOnDataChange) then FOnDataChange(Self);

end; {procedure, DoOnDataChange}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Open }

procedure TppDataPipeline.Open;
begin

  OpenDataSet;

  UpdateState;

  {free the current bookmark}
  if FCurrentBookmark > 0 then
    begin
      FreeBookmark(FCurrentBookmark);
      FCurrentBookmark := 0;
    end;

  if Assigned(FOnOpen) then FOnOpen(Self);

  SendEventNotify(Self, ciPipelineOpen, nil);

end; {procedure, Open}


{------------------------------------------------------------------------------}
{ TppDataPipeline.Close }

procedure TppDataPipeline.Close;
begin

  FreeCurrentBookmark;

  CloseDataSet;

  FState := [];

  DoOnDataChange;

  if Assigned(FOnClose) then FOnClose(Self);

  SendEventNotify(Self, ciPipelineClose, nil);

end; {procedure, Close}


{------------------------------------------------------------------------------}
{ TppDataPipeline.UpdateCurrentBookmark }

procedure TppDataPipeline.UpdateCurrentBookmark;
begin

  {free the current bookmark}
  if (FCurrentBookmark > 0) then
    begin
      FreeBookmark(FCurrentBookmark);
      FCurrentBookmark := 0;
    end;

  FCurrentBookmark := GetBookmark;

end; {procedure, UpdateCurrentBookmark}


{------------------------------------------------------------------------------}
{ TppDataPipeline.FreeCurrentBookmark }

procedure TppDataPipeline.FreeCurrentBookmark;
begin

  {free the current bookmark}
  if (FCurrentBookmark > 0) then
    begin
      FreeBookmark(FCurrentBookmark);

      FCurrentBookmark := 0;
    end;


end; {procedure, FreeCurrentBookmark}

{------------------------------------------------------------------------------}
{ TppDataPipeline.RestoreRecordPosition }

procedure TppDataPipeline.RestoreRecordPosition;
begin

  if (FCurrentBookmark > 0)  then
    GotoBookmark(FCurrentBookmark);

  UpdateState;

  RecordPositionChanged;

end; {procedure, RestoreRecordPosition}

{------------------------------------------------------------------------------}
{ TppDataPipeline.First }

procedure TppDataPipeline.First;
begin

  FDataTraversed := False;
  FTraversalCount := 0;

  if (FBookmarks <> nil) and (FBookmarks.Count > 0) then
    GotoBookmark(Longint(FBookmarks[0]))

  else
    case FRangeBegin of
      rbFirstRecord:
        if IsLinked then
          LocateLinkedDataFirst
        else
          GotoFirstRecord;

      rbLastRecord:
       if IsLinked then
          LocateLinkedDataLast
        else
          GotoLastRecord;

      rbCurrentRecord:
        if (FCurrentBookmark > 0) then
          GotoBookmark(FCurrentBookmark);

    end; {case, RangeBegin}

  UpdateState;

  if not(ppdaFirstRecord in State) then
    IncludeState([ppdaFirstRecord]);

  if Assigned(FOnFirst) then FOnFirst(Self);

  SendEventNotify(Self, ciPipelineFirst, nil);

  RecordPositionChanged;

end; {procedure, First}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Last }

procedure TppDataPipeline.Last;
begin

  if (FBookmarks <> nil) and (FBookmarks.Count > 0) then
    GotoBookmark(Longint(FBookmarks[FBookmarks.Count - 1]))

  else
    case FRangeEnd of
      reFirstRecord:
        if IsLinked then
          LocateLinkedDataFirst
        else
          GotoFirstRecord;

      reLastRecord:
        if IsLinked then
          LocateLinkedDataLast
        else
          GotoLastRecord;

      reCurrentRecord:
        if (FCurrentBookmark > 0) then
          GotoBookmark(FCurrentBookmark);

      reCount:
        begin
          First;

          while (FTraversalCount < RangeEndCount) do
            Next;

        end;

    end; {case, RangeEnd}

  UpdateState;

  if not(ppdaLastRecord in State) then
    IncludeState([ppdaLastRecord]);

  if Assigned(FOnLast) then FOnLast(Self);

  SendEventNotify(Self, ciPipelineLast, nil);

  RecordPositionChanged;

end; {procedure, Last}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Skip }

procedure TppDataPipeline.Skip;
begin
  {goto next record without incrementing traversal count}
  Next;

  if (FBookmarks = nil) and not(EOF) then
    Dec(FTraversalCount);

end; {procedure, Skip}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SkipBack }

procedure TppDataPipeline.SkipBack;
begin
  {goto next record without incrementing traversal count}
  Prior;

  if (FBookmarks = nil) and not(BOF) then
    Inc(FTraversalCount);

end; {procedure, Skip}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Next }

procedure TppDataPipeline.Next;
begin

  {goto next record}
  if (FBookmarks <> nil) and (FBookmarks.Count > 0) then
    begin
      Inc(FTraversalCount);

      if (FTraversalCount < FBookmarks.Count) then
        GotoBookmark(Longint(FBookmarks[FTraversalCount]));
    end

  else
    begin
      if (FRangeBegin = rbCurrentRecord) and (FRangeEnd = reCurrentRecord) then
        {do nothing}
      else if IsLinked then
        TraverseLinkedData(FMoveBy)
      else
        TraverseBy(FMoveBy);

      FDataTraversed := True;
      Inc(FTraversalCount);
    end; {if, not using bookmarklist}

  UpdateState;

  if Assigned(FOnNext) then FOnNext(Self);

  SendEventNotify(Self, ciPipelineNext, nil);

  RecordPositionChanged;

end; {procedure, Next}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Prior }

procedure TppDataPipeline.Prior;
begin

  if (FBookmarks <> nil) and (FBookmarks.Count > 0) then
    begin
      if (FTraversalCount > 0) then
        begin
          GotoBookmark(Longint(FBookmarks[FTraversalCount - 1]));

          Dec(FTraversalCount);
        end;

    end

  else
    begin
      if (FRangeBegin = rbCurrentRecord) and (FRangeEnd = reCurrentRecord) then
        {do nothing}
      else if IsLinked then
        TraverseLinkedData(FMoveBy * -1)
      else
        TraverseBy(FMoveBy * -1);

      Dec(FTraversalCount);
    end; {if, not using bookmarklist}

  UpdateState;

  if Assigned(FOnPrior) then FOnPrior(Self);

  SendEventNotify(Self, ciPipelinePrior, nil);

  RecordPositionChanged;

end; {procedure, Prior}

{------------------------------------------------------------------------------}
{ TppDataPipeline.GetBOF }

function TppDataPipeline.GetBOF: Boolean;
var
  lbBOF: Boolean;
  lbEOF: Boolean;

begin
  Result := False;

  if IsLinked then
    begin
     lbBOF := CheckLinkedBOF;
     lbEOF := CheckLinkedEOF;
    end
  else
    begin
     lbBOF := CheckBOF;
     lbEOF := CheckEOF;
    end;

  if (FBookmarks <> nil) then
    Result := (FBookmarks.Count = 0) or (FTraversalCount = 0)

  else
    begin

      case FRangeBegin of

        rbLastRecord:    Result := lbEOF;

        rbFirstRecord:   Result := lbBOF;

        rbCurrentRecord: Result := not(FDataTraversed);

      end;

   end;

end; {function, GetBOF}

{------------------------------------------------------------------------------}
{ TppDataPipeline.GetEOF }

function  TppDataPipeline.GetEOF: Boolean;
var
  lbBOF: Boolean;
  lbEOF: Boolean;
begin
  Result := False;

  if IsLinked then
    begin
     lbBOF := CheckLinkedBOF;
     lbEOF := CheckLinkedEOF;
    end
  else
    begin
     lbBOF := CheckBOF;
     lbEOF := CheckEOF;
    end;

  if (FBookmarks <> nil) then
    Result := (FBookmarks.Count = 0) or (FTraversalCount = FBookmarks.Count)

  else
    begin

      if (lbBOF and lbEOF) then
        begin
          Result := True;

          Exit;
        end;

      case FRangeEnd of

        reLastRecord:    Result := (FDataTraversed and lbEOF);

        reFirstRecord:   Result := (FDataTraversed and lbBOF);

        reCurrentRecord: Result := (FTraversalCount = 1);

        reCount:         Result := (FTraversalCount = FRangeEndCount) or
                                   (FDataTraversed and
                                    ( ((FMoveBy > 0) and lbEOF) or
                                      ((FMoveBy < 0) and lbBOF) ) );


      end;

   end;

end; {function, GetEOF}

{------------------------------------------------------------------------------}
{ TppDataPipeline.UpdateState }

procedure TppDataPipeline.UpdateState;
begin

  FState := [];

  if (csDestroying in ComponentState) or not Active then Exit;

  if GetBOF and GetEOF then
    FState := [ppdaNoRecords]

  else if GetBOF then
    FState := [ppdaFirstRecord]

  else if GetEOF then
    FState := [ppdaLastRecord];

end; {procedure, UpdateState}


{------------------------------------------------------------------------------}
{ TppDataPipeline.Edit }

procedure TppDataPipeline.Edit;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.GetFieldAsStream }

procedure TppDataPipeline.GetFieldAsStream(aFieldName: String; aStream: TStream);
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.GetFieldValueForAlias}

function TppDataPipeline.GetFieldValueForAlias(aFieldAlias: string): Variant;
var
  lsFieldName: String;
  
begin

  lsFieldName := FieldNameForFieldAlias(aFieldAlias);
  Result := GetFieldValue(lsFieldName);

end; {function, GetFieldValueForAlias}


{------------------------------------------------------------------------------}
{ TppDataPipeline.Insert }

procedure TppDataPipeline.Insert;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.Delete }

procedure TppDataPipeline.Delete;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.Locate }

function  TppDataPipeline.Locate(const aFieldName: String; aKeyValue: Variant; aOptions: TppLocateOptions): Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.Post }

procedure TppDataPipeline.Post;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetFieldFromStream }

procedure TppDataPipeline.SetFieldFromStream(aFieldName: String; aStream: TStream);
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetFieldValue }

procedure TppDataPipeline.SetFieldValue(aFieldName: String; aValue: Variant);
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.Create }

procedure TppDataPipeline.GetQualifiedFieldNames(aFieldNameList: TStrings);
var
  lList: TStringList;
  liIndex: Integer;
  lsDataSetName: String;
begin

  lList := TStringList.Create;

  lsDataSetName := GetDataSetName;

  GetFieldNames(lList);


  if (lsDataSetName <> '') then
    for liIndex := 0 to lList.Count - 1 do
      lList[liIndex] := lsDataSetName + '.' + lList[liIndex];

  aFieldNameList.AddStrings(lList);

  lList.Free;

end; {procedure, GetQualifiedFieldNames}


{------------------------------------------------------------------------------}
{ TppDataPipeline.ReadState }

procedure TppDataPipeline.ReadState(Reader: TReader);
begin

  if (Reader.Parent is TdaDataView) then
     SetDataView(Reader.Parent);

  inherited ReadState(Reader);

end; {procedure, ReadState}

{------------------------------------------------------------------------------}
{ TppDataPipeline.GetDataView }

function TppDataPipeline.GetDataView: TComponent;
begin
  if Parent is TdaDataView then
    Result := Parent
  else
    Result := nil;
end; {function, GetDataView}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetDataView }

procedure TppDataPipeline.SetDataView(aDataView: TComponent);
begin
  if aDataView is TdaDataView then
    SetParent(TppRelative(aDataView));
end; {procedure, SetDataView}



{******************************************************************************
 *
 ** C U S T O M   D A T A   P I P E L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.Create }

constructor TppCustomDataPipeline.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  OrderedChildren := True;

  FAbsolutePageCount := 0;
  FAutoCreateFields := True;
  FBookmarksExist := False;
  FCurrentField := nil;
  FCreatingDefaultFields := False;
  FFieldsOutOfSync := True;
  FMasterFieldLinks := TStringList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.Destroy }

destructor TppCustomDataPipeline.Destroy;
begin

  Destroying;

  FreeMasterFieldLinks;

  FMasterFieldLinks.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.Loaded }

procedure TppCustomDataPipeline.Loaded;
begin

  inherited Loaded;

  if FAutoCreateFields and (ChildCount > 0) then
    FFieldsOutOfSync := False;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.SaveToCache }

procedure TppCustomDataPipeline.SaveToCache(aAbsolutePageNo: Longint);
begin

  FBookmarksExist := True;
  FAbsolutePageCount := aAbsolutePageNo;

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.FreeCache }

procedure TppCustomDataPipeline.FreeCache(aAbsolutePageCount: Longint);
begin

  if (aAbsolutePageCount <> 0) then
    FreeCurrentBookmark;

  {free any bookmark resources before cache is cleared}
  FreePageBookmarks(aAbsolutePageCount);

end; {procedure, FreeCache}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.FreePageBookmarks }

procedure TppCustomDataPipeline.FreePageBookmarks(aStartPageNo: Longint);
var
  lRec: TppDataPipelineSaveRec;
  llPage: Longint;
  llPageCount: Longint;
begin

  if not FBookmarksExist then Exit;

  if (CacheStream = nil) then Exit;

  if (CacheRecordSize > 0) and (CacheCount > 0) then
    llPageCount := Round(Round(CacheStream.Size / CacheRecordSize) / CacheCount) - 1
  else
    llPageCount := -1;

  llPage := aStartPageNo;

  while (llPage < llPageCount) do
    begin
      ReadRecordFromCache(llPage, lRec);

      if lRec.FBookmarked then
        FreeBookmark(lRec.FBookmark);

      Inc(llPage);
    end;

  if (aStartPageNo = 0) then
    FBookmarksExist := False;

  FAbsolutePageCount := aStartPageNo;

end; {procedure, FreePageBookmarks}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.PropertyChange }

procedure TppCustomDataPipeline.PropertyChange;
begin
  if (ComponentDesigner <> nil) then
    ComponentDesigner.ComponentChanged;
end; {procedure, PropertyChange}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.SaveComponents }

procedure TppCustomDataPipeline.SaveComponents(Proc: TGetChildProc);
var
  liIndex: Integer;
begin

  {write fields}
  inherited SaveComponents(Proc);

  {write master field link items}
  for liIndex := 0 to MasterFieldLinkCount - 1  do
    Proc(MasterFieldLinkItems[liIndex]);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.AddChild }

procedure TppCustomDataPipeline.AddChild(aChild: TppRelative);
var
  lsName: String;
begin

  if (aChild.Owner <> Owner) and (Owner <> nil) then
    begin
      if (aChild.Owner <> nil) then
        aChild.Owner.RemoveComponent(aChild);

      Owner.InsertComponent(aChild);
    end;

  if (aChild is TppMasterFieldLink) then
    begin
      lsName := TppMasterFieldLink(aChild).MasterFieldName;

      FMasterFieldLinks.AddObject(lsName, aChild);
    end

  else
    inherited AddChild(aChild);

  DoOnDataChange;

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.InsertChild }

procedure TppCustomDataPipeline.InsertChild(aPosition: Integer; aChild: TppRelative);
var
  lsName: String;
begin

  if (aChild.Owner <> Owner) and (Owner <> nil) then
    Owner.InsertComponent(aChild);

  if (aChild is TppMasterFieldLink) then
    begin
      lsName := TppMasterFieldLink(aChild).MasterFieldName;

      FMasterFieldLinks.InsertObject(aPosition, lsName, aChild);
    end
  else
    inherited InsertChild(aPosition, aChild);

  DoOnDataChange;

end; {procedure, InsertChild}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.IndexOfChild }

function TppCustomDataPipeline.IndexOfChild(aChild: TppRelative): Integer;
begin

  if (aChild is TppMasterFieldLink) then
    Result := FMasterFieldLinks.IndexOfObject(aChild)
  else
    Result := inherited IndexOfChild(aChild);

end; {procedure, IndexOfChild}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.RemoveChild }

function TppCustomDataPipeline.RemoveChild(aChild: TppRelative): Integer;
var
  liIndex: Integer;
begin

  liIndex := IndexOfChild(aChild);

  Result := liIndex;

  if (liIndex = -1) then Exit;

  if (aChild is TppMasterFieldLink) then
    FMasterFieldLinks.Delete(liIndex)
  else
    Result := inherited RemoveChild(aChild);

  DoOnDataChange;

end; {procedure, RemoveChild}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.DefineField }

function TppCustomDataPipeline.DefineField(aFieldName: String; aDataType: TppDataType; aFieldLength: Integer): Integer;
var
  lField: TppField;
begin

  {allow descendant pipeline to determine which DataTypes are supported}
  if not IsValidDataType(aDataType) then
    raise EInvalidPropertyError.Create('DataType not supported by ' + ClassName);

  lField := TppField.Create(Owner);

  {add field to pipeline}
  lField.DataPipeline := Self;

  {assign props}
  lField.FieldName    := aFieldName;
  lField.DataType     := aDataType;
  lField.FieldLength  := aFieldLength;
  lField.DisplayWidth := aFieldLength;

  if lField.DataType in [dtInteger, dtLongint, dtDouble] then
    lField.Alignment := taRightJustify
  else
    lField.Alignment := taLeftJustify;

  Result := IndexOfChild(lField);

end; {function, DefineField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetAutoCreateFields }

function TppCustomDataPipeline.GetAutoCreateFields: Boolean;
begin
  Result := FAutoCreateFields;
end; {function, GetAutoCreateFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.SetAutoCreateFields }

procedure TppCustomDataPipeline.SetAutoCreateFields(aValue: Boolean);
begin
  FAutoCreateFields := aValue;

  SyncFields;
end; {function, SetAutoCreateFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetCreatingDefaultFields }

function TppCustomDataPipeline.GetCreatingDefaultFields: Boolean;
begin
  Result := FCreatingDefaultFields;
end; {function, GetCreatingDefaultFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.FreeFields }

procedure TppCustomDataPipeline.FreeFields;
begin
  FreeChildren;

  SyncFields;
end; {function, FreeFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.AddField }

procedure TppCustomDataPipeline.AddField(aField: TppField);
begin
  AddChild(aField);
end; {procedure, AddField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.InsertField }

procedure TppCustomDataPipeline.InsertField(aPosition: Integer; aField: TppField);
begin
  InsertChild(aPosition, aField);
end; {procedure, InsertField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.RemoveField }

function TppCustomDataPipeline.RemoveField(aField: TppField): Integer;
begin
  Result := RemoveChild(aField);
end; {function, RemoveField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldCount }

function TppCustomDataPipeline.GetFieldCount: Integer;
begin
  CreateDefaultFields;

  Result := ChildCount;
end; {function, GetFieldCount}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldForIndex }

function TppCustomDataPipeline.GetFieldForIndex(aIndex: Integer): TppField;
begin
  CreateDefaultFields;

  Result := TppField(Children[aIndex]);
end; {function, GetFieldForIndex}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldNames }

function TppCustomDataPipeline.GetFieldNames(aFieldNameList: TStrings): Boolean;
var
  liField: Integer;
begin
  CreateDefaultFields;

  aFieldNameList.Clear;

  for liField := 0 to FieldCount - 1 do
    aFieldNameList.Add(Fields[liField].FieldName);

  Result := (aFieldNameList.Count > 0);
end; {function, GetFieldNames}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldAliases }

function TppCustomDataPipeline.GetFieldAliases(aFieldAliasList: TStrings): Boolean;
var
  liField: Integer;
begin
  CreateDefaultFields;

  aFieldAliasList.Clear;

  for liField := 0 to FieldCount - 1 do
    aFieldAliasList.Add(Fields[liField].FieldAlias);

  Result := (aFieldAliasList.Count > 0);
end; {function, GetFieldAliases}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.FieldAliasForFieldName }

function  TppCustomDataPipeline.FieldAliasForFieldName(const aFieldName: String): String;
var
  lField: TppField;
begin

  {do not call CreateDefaultFields here, it is already called by GetFieldForName}

  Result := aFieldName;

  if not(Active) and GetAutoCreateFields then Exit;

  lField := GetFieldForName(aFieldName);

  if (lField <> nil) then
    Result := lField.FieldAlias;

end; {function, FieldAliasForFieldName}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.FieldNameForFieldAlias }

function  TppCustomDataPipeline.FieldNameForFieldAlias(const aFieldAlias: String): String;
var
  lField: TppField;
begin

  {do not call CreateDefaultFields here, it is already called by GetFieldForAlias}

  lField := GetFieldForAlias(aFieldAlias);

  if (lField <> nil) then
    Result := lField.FieldName
  else
    Result := '';

end; {function, FieldNameForFieldAlias}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetCurrentField }

function TppCustomDataPipeline.GetCurrentField: TppField;
begin
  Result := FCurrentField;
end; {function, GetCurrentField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldForName }

function TppCustomDataPipeline.GetFieldForName(const aFieldName: String): TppField;
var
  liIndex: Integer;
begin

  CreateDefaultFields;

  Result  := nil;

  liIndex := 0;

  while (Result = nil) and (liIndex < FieldCount) do

    if CompareText(Fields[liIndex].FieldName, aFieldName) = 0 then
      Result := Fields[liIndex]
    else
      Inc(liIndex);

end; {function, GetFieldForName}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldForAlias }

function TppCustomDataPipeline.GetFieldForAlias(const aFieldAlias: String): TppField;
var
  liIndex: Integer;
begin

  CreateDefaultFields;

  Result  := nil;

  liIndex := 0;

  while (Result = nil) and (liIndex < FieldCount) do

    if CompareText(Fields[liIndex].FieldAlias, aFieldAlias) = 0 then
      Result := Fields[liIndex]
    else
      Inc(liIndex);

end; {function, GetFieldForAlias}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.IndexofField }

function TppCustomDataPipeline.IndexOfField(aField: TppField): Integer;
begin
  CreateDefaultFields;

  Result := IndexOfChild(aField);
end; {procedure, IndexOfField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.IndexOfFieldName }

function TppCustomDataPipeline.IndexOfFieldName(const aFieldName: String): Integer;
var
  lField: TppField;
begin

  {do not call CreateDefaultFields here, it is already called by GetFieldForAlias}

  lField := GetFieldForName(aFieldName);

  if (lField <> nil) then
    Result := IndexOfChild(lField)
  else
    Result := -1;

end; {function, IndexOfFieldName}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.IsValidDataType }

function  TppCustomDataPipeline.IsValidDataType(aDataType: TppDataType): Boolean;
begin
  {descendants can add code here to determine which DataType's to support}
  Result := True;
end; {function, IsValidDataType}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.SetFieldName }

function TppCustomDataPipeline.SetFieldName(aFieldName: String): Boolean;
begin
  FCurrentField := GetFieldForName(aFieldName);

  Result := (FCurrentField <> nil);
end; {function, SetFieldName}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldAlignment }

function TppCustomDataPipeline.GetFieldAlignment(aFieldName: String): TAlignment;
begin

  Result := taLeftJustify;

  if SetFieldName(aFieldName) then
    Result := FCurrentField.Alignment;

end; {function, GetFieldAlignment}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldDataType }

function TppCustomDataPipeline.GetFieldDataType(aFieldName: String): TppDataType;
begin

  Result := dtNotKnown;

  if SetFieldName(aFieldName) then
    Result := FCurrentField.DataType;

end; {function, GetFieldDataType}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldDisplayWidth }

function  TppCustomDataPipeline.GetFieldDisplayWidth(aFieldName: String): Integer;
begin

  Result := 0;

  if SetFieldName(aFieldName) then
    Result := FCurrentField.DisplayWidth;

end; {function, GetFieldDisplayWidth}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldAlignment }

function  TppCustomDataPipeline.GetFieldSize(aFieldName: String): Integer;
begin

  Result := 0;

  if SetFieldName(aFieldName) then
    Result := FCurrentField.FieldLength;

end; {function, GetFieldSize}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.SyncFields }

procedure TppCustomDataPipeline.SyncFields;
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) or (csDestroying in ComponentState) then Exit;

  FFieldsOutOfSync := True;

end; {function, SyncFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetValidName }

function TppCustomDataPipeline.GetValidName(aComponent: TComponent): String;
var
  lsNamingPrefix: String;
begin

  lsNamingPrefix := Name + ppGetStdNamingPrefix(aComponent);

  if (Owner <> nil) then
   Result := ppGetUniqueName(Owner, lsNamingPrefix, aComponent)

  else  {run-time designing }
    Result := ppGetUniqueName(Self, lsNamingPrefix, aComponent);

end; {function, GetValidName}


{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.CreateDefaultFields }

procedure TppCustomDataPipeline.CreateDefaultFields;
var
  liField: Integer;
  liFields: Integer;
  lsFieldName: String;
  lFields: TStrings;
  lField: TppField;
  
begin

  if (FCreatingDefaultFields) then Exit;

  if not(FAutoCreateFields) then Exit;

  if not(FFieldsOutOfSync) then Exit;

  if (csReading in ComponentState) or (csLoading in ComponentState) or (csDestroying in ComponentState) then Exit;


  FCreatingDefaultFields := True;

  FreeFields;

  lFields := TStringList.Create;

  if not(GetFieldNames(lFields)) then
    begin
      FCreatingDefaultFields := False;

      lFields.Free;

      Exit;
    end;

  liFields := lFields.Count;

  for liField := 0 to liFields - 1 do
    begin
      lField := TppField.Create(nil);

      lsFieldName := lFields[liField];

      {assign props}
      lField.Name := GetValidName(lField);

      lField.FieldName    := lsFieldName;
      lField.FieldLength  := GetFieldSize(lsFieldName);
      lField.DisplayWidth := GetFieldDisplayWidth(lsFieldName);
      lField.DataType     := GetFieldDataType(lsFieldName);
      lField.Position     := liField;
      
      if lField.DataType in [dtInteger, dtLongint, dtDouble] then
        lField.Alignment := taRightJustify;

      {allow descendant pipeline to determine which data types are supported}
      if not(IsValidDataType(lField.DataType)) then
        raise EInvalidPropertyError.Create('DataType not supported by ' + ClassName);

      {add field to pipeline}
      lField.DataPipeline := Self;

      lField.FieldAlias   := lsFieldName;
      lField.Searchable   := not(lField.DataType in [dtNotKnown, dtMemo, dtBLOB, dtGraphic]);
      lField.Sortable     := not(lField.DataType in [dtNotKnown, dtMemo, dtBLOB, dtGraphic]);

    end;

  lFields.Free;

  FFieldsOutOfSync := False;

  FCreatingDefaultFields := False;

  DoOnDataChange;

end; {procedure, CreateDefaultFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetMasterFieldLinks }

function TppCustomDataPipeline.GetMasterFieldLinks: TStrings;
begin

  Result := FMasterFieldLinks;

end; {function, GetMasterFieldLinks}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.SetMasterFieldLinks }

procedure TppCustomDataPipeline.SetMasterFieldLinks(aMasterFieldLinks: TStrings);
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  FMasterFieldLinks.Assign(aMasterFieldLinks);

end;  {procedure, SetMasterFieldLinks}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.AddMasterFieldLink }

procedure TppCustomDataPipeline.AddMasterFieldLink(aMasterFieldLink: TppMasterFieldLink);
begin
  AddChild(aMasterFieldLink);
end; {procedure, AddMasterFieldLink}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.RemoveMasterFieldLink }

function TppCustomDataPipeline.RemoveMasterFieldLink(aMasterFieldLink: TppMasterFieldLink): Integer;
begin
  Result := RemoveChild(aMasterFieldLink);
end; {function, RemoveMasterFieldLink}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetMasterFieldLinkCount }

function TppCustomDataPipeline.GetMasterFieldLinkCount: Integer;
begin
  Result := FMasterFieldLinks.Count;
end; {function, GetMasterFieldLinkCount}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.IsLinked }

function TppCustomDataPipeline.IsLinked: Boolean;
begin
  Result := (MasterDataPipeline <> nil) and (FMasterFieldLinks.Count > 0);
end; {function, IsLinked}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetMasterFieldLinkForIndex }

function TppCustomDataPipeline.GetMasterFieldLinkForIndex(aIndex: Integer): TppMasterFieldLink;
begin
  Result := TppMasterFieldLink(FMasterFieldLinks.Objects[aIndex]);
end; {function, GetMasterFieldLinkForIndex}


{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.CheckLinkedData }

function TppCustomDataPipeline.CheckLinkedData: Integer;
var
  lMasterFieldValue: Variant;
  lDetailFieldValue: Variant;
  liIndex: Integer;
begin

  Result := 0;

  if not Active or not MasterDataPipeline.Active then Exit;

  for liIndex := 0 to MasterFieldLinkCount - 1 do
    begin
      lMasterFieldValue := MasterDataPipeline.GetFieldValue(MasterFieldLinkItems[liIndex].MasterFieldName);
      lDetailFieldValue := GetFieldValue(MasterFieldLinkItems[liIndex].DetailFieldName);

      if ((VarType(lMasterFieldValue) = varString) and (VarType(lDetailFieldValue) = varString)) then
        begin

          if (CompareText(String(lDetailFieldValue), String(lMasterFieldValue)) <> 0) then
            begin
              if (Uppercase(lDetailFieldValue) > Uppercase(lMasterFieldValue)) then
                Result := 1
              else
                Result := -1;

              Exit;
            end;

        end

      else
        begin

          if (lDetailFieldValue <> lMasterFieldValue) then
            begin
              if (lDetailFieldValue > lMasterFieldValue) then
                Result := 1
              else
                Result := -1;

              Exit;
            end;

        end;

    end;

end; {procedure, CheckLinkedData}


{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.MasterRecordPositionChanged }

procedure TppCustomDataPipeline.MasterRecordPositionChanged;
begin

  inherited MasterRecordPositionChanged;

  if IsLinked and Active then
    begin
      FState := [];
      LocateLinkedDataFirst;
    end;

end; {procedure, MasterRecordPositionChanged}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.TraverseLinkedData }

procedure TppCustomDataPipeline.TraverseLinkedData(aIncrement: Integer);
var
  liMove: Integer;

begin

  for liMove := 1 to Abs(aIncrement) do
    begin

      if (aIncrement > 0) and not CheckLinkedEOF then
        TraverseBy(1)

      else if (aIncrement < 0) and not CheckLinkedBOF then
        TraverseBy(-1);

    end;

end; {function, TraverseLinkedData}


{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.LocateLinkedDataFirst }

procedure TppCustomDataPipeline.LocateLinkedDataFirst;
begin


  if CheckLinkedData < 0 then

    while not CheckEOF and (CheckLinkedData < 0) do
      TraverseBy(1)

  else
    begin
      while not CheckBOF and (CheckLinkedData >= 0) do
        TraverseBy(-1);

      TraverseBy(1);

      {if not on a matching record, then go back to prev record}
      if (CheckLinkedData > 0) then
        TraverseBy(-1);

    end;


end; {procedure, LocateLinkedDataFirst}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.LocateLinkedDataLast }

procedure TppCustomDataPipeline.LocateLinkedDataLast;
begin


  if (CheckLinkedData <= 0) then
    begin
      while not CheckEOF and (CheckLinkedData <= 0) do
        TraverseBy(1);

      TraverseBy(-1);

      {if not on a matching record, then go back to prev record}
      if (CheckLinkedData > 0) then
        TraverseBy(1);

    end
  else
    while not CheckBOF and (CheckLinkedData > 0) do
      TraverseBy(-1);

end; {procedure, LocateLinkedDataLast}


{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.FreeMasterFieldLinks }

procedure TppCustomDataPipeline.FreeMasterFieldLinks;
var
  liIndex: Integer;
begin

  for liIndex := (FMasterFieldLinks.Count - 1) downto 0 do
    TObject(FMasterFieldLinks.Objects[liIndex]).Free;

  FMasterFieldLinks.Clear;

end; {procedure, FreeMasterFieldLinks}

{******************************************************************************
 *
 ** A U T O   S E A R C H   F I E L D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.Create }

constructor TppAutoSearchField.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAsFilter := False;
  FAutoSearchPanel  := nil;
  FCriteria := nil;
  FDataView := nil;
  FDelimiter := '';
  FFirstField := False;
  FOnChange := nil;
  FParentControl := nil;
  FSearchOperator := soEqual;
  FWildCard := '';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.Notify }

procedure TppAutoSearchField.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator = FCriteria) then
    FCriteria := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.DoOnChange }

procedure TppAutoSearchField.DoOnChange;
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if Assigned(FOnChange) then FOnChange(Self);

end; {procedure, DoOnChange}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetFieldName }

procedure TppAutoSearchField.SetFieldName(const aFieldName: String);
begin

  inherited SetFieldName(aFieldName);

  DoOnChange;

end; {procedure, SetFieldName}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetSearchExpression }

procedure TppAutoSearchField.SetSearchExpression(const aExpression: String);
begin

  inherited SetSearchExpression(aExpression);

  DoOnChange;

end; {procedure, SetSearchExpression}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetCriteria }

procedure TppAutoSearchField.SetCriteria(aCriteria: TComponent);
begin

  if (FCriteria <> nil) then
    TppCommunicator(FCriteria).RemoveNotify(Self);

  FCriteria := aCriteria;

  if (FCriteria <> nil) then
    TppCommunicator(FCriteria).AddNotify(Self)

end; {procedure, SetCriteria}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetDataPipelineName }

procedure TppAutoSearchField.SetDataPipelineName(const aName: String);
begin

  FDataPipelineName := aName;

  DoOnChange;

end; {procedure, SetDataPipelineName}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetSearchOperator }

procedure TppAutoSearchField.SetSearchOperator(aOperator: TppSearchOperatorType);
begin

  FSearchOperator := aOperator;

  DoOnChange;

end; {procedure, SetSearchOperator}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetShowAllValues }

procedure TppAutoSearchField.SetShowAllValues(aValue: Boolean);
begin

  FShowAllValues := aValue;

  DoOnChange;

end; {procedure, SetShowAllValues}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.ConvertValue }

function TppAutoSearchField.ConvertValue(const aValue: String): Variant;
begin

  Result := '';

  case DataType of
    dtString, dtChar, dtMemo:
      begin
        if (Length(FWildCard) > 0) and (Pos(FWildCard, aValue) = 0) then
          Result := aValue + FWildCard
        else
          Result := aValue;
      end;

    dtDate, dtTime, dtDateTime: Result := ppStrToDateTime(aValue);
    dtInteger, dtLongint: Result := StrToInt(aValue);
    dtCurrency: Result := StrToCurr(aValue);
    dtSingle, dtDouble, dtExtended: Result := StrToFloat(aValue);
  end;

end; {function, ConvertValue}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.GetValue }

function TppAutoSearchField.GetValue: Variant;
var
  lValues: TStrings;
begin

  Result := '';

  lValues := TStringList.Create;

  ppParseString(FSearchExpression, lValues);

  if (lValues.Count > 0) then
    Result := ConvertValue(lValues[0]);

  lValues.Free;

end; {function, GetValue}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.GetValues }

function TppAutoSearchField.GetValues(aIndex: Integer): Variant;
var
  lValues: TStrings;
begin

  Result := '';

  lValues := TStringList.Create;

  ppParseString(FSearchExpression, lValues);

  if (lValues.Count > aIndex) then
    Result := ConvertValue(lValues[aIndex]);

  lValues.Free;

end; {function, GetValues}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.GetValueCount }

function TppAutoSearchField.GetValueCount: Integer;
var
  lValues: TStrings;
begin

  lValues := TStringList.Create;

  ppParseString(FSearchExpression, lValues);

  Result := lValues.Count;

  lValues.Free;

end; {function, GetValueCount}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.FormatValue }

function TppAutoSearchField.FormatValue(aValue: String): String;
begin

  Result := aValue;

  if (FDataType in [dtDate, dtDateTime]) and (Length(DisplayFormat) > 0) then
    Result := FormatDateTime(DisplayFormat, ppStrToDateTime(Result))

  else if (FDataType in [dtInteger, dtLongint, dtSingle, dtDouble, dtExtended, dtCurrency]) then
    Result := ppFixUpFloatString(aValue, DisplayFormat)

  else if (FDataType = dtBoolean) then
    begin
      if (Length(aValue) = 0) then
        Result := 'FALSE'

       else if (UpperCase(aValue[1])[1] in ['T', 'Y']) then
         Result := 'TRUE'

       else if (aValue[1] = '1') then
         Result := '1'

       else if (aValue[1] = '0') then
         Result := '0'

       else 
         Result := 'FALSE';
    end;

  if (Length(FDelimiter) > 0) then
    Result := FDelimiter + Result + FDelimiter;

end; {function, FormatValue}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.FormattedExpression }

function TppAutoSearchField.FormattedExpression: String;
var
  liIndex: Integer;
  lValues: TStrings;
begin

  Result := '';

  case FSearchOperator of

    soInList, soNotInList:
      begin
        lValues := TStringList.Create;

        ppParseString(FSearchExpression, lValues);

        if FAsFilter then
          begin
            for liIndex := 0 to lValues.Count - 1 do
              begin
                if (FSearchOperator = soInList) then
                  begin
                    Result := Result + '(' + FieldName + '=' + FormatValue(lValues[liIndex]) + ')';

                    if (liIndex < lValues.Count - 1) then
                      Result := Result + ' OR ';
                  end
                else
                  begin
                    Result := Result + '(' + FieldName + '<>' + FormatValue(lValues[liIndex]) + ')';

                    if (liIndex < lValues.Count - 1) then
                      Result := Result + ' AND ';
                  end;
              end;
          end

        else
          begin
            for liIndex := 0 to lValues.Count - 1 do
              begin
                Result := Result + FormatValue(lValues[liIndex]);

                if (liIndex < lValues.Count - 1) then
                  Result := Result + ',';
              end;

            Result := '(' + Result + ')';
          end;

      end;

    soBetween, soNotBetween:
      begin
        lValues := TStringList.Create;

        ppParseString(FSearchExpression, lValues);

        if (lValues.Count = 2) then
          begin

            if FAsFilter then
              begin
                if (FSearchOperator = soBetween) then
                  Result := '(' + FieldName + ' >= ' + FormatValue(lValues[0]) + ')' + ' AND ' + '(' + FieldName + ' <= ' + FormatValue(lValues[1]) + ')'
                else
                  Result := '(' + FieldName + ' < ' + FormatValue(lValues[0]) + ')' + ' OR ' + '(' + FieldName + ' > ' + FormatValue(lValues[1]) + ')'
              end

            else
              Result := FormatValue(lValues[0]) + ' AND ' + FormatValue(lValues[1]);
              
          end;

        lValues.Free;
      end;

    soLike, soNotLike:
      begin
        if (Length(FWildCard) > 0) and (Pos(FWildCard, FSearchExpression) = 0) then
          Result := FSearchExpression + FWildCard;

        Result := FormatValue(Result);
      end;

    else
      begin
        Result := FormatValue(FSearchExpression);
      end;
  end;


end; {function, FormattedExpression}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.Description }

function TppAutoSearchField.Description: String;
begin

  if (FFirstField) then
    Result := ppLoadStr(54) {Show all data where the}
  else
    Result := ppLoadStr(55); {and the}

  if (FShowAllValues) then
    Result := Result + ' ' + FieldAlias + ' has any value'
  else
    Result := Result + ' ' + FieldAlias + ' ' + OperatorDesc + ' ' + SearchExpression;

end; {function, Description}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.FilterString }

function TppAutoSearchField.FilterString: String;
begin
  FAsFilter := True;

  if (FSearchOperator in [soInList, soNotInList, soBetween, soNotBetween]) then
    Result := '(' + FormattedExpression + ')'
  else
    Result := '(' + FieldName + ' ' + OperatorAsString + ' ' + FormattedExpression + ')';

  FAsFilter := False;
end; {function, FilterString}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SQLString }

function TppAutoSearchField.SQLString: String;
begin
  Result := TableName + '.' + FieldName + ' ' + OperatorAsString + ' ' + FormattedExpression;
end; {function, SQLString}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.Valid }

function TppAutoSearchField.Valid: Boolean;
begin
  Result := not(FShowAllValues) and (Length(FSearchExpression) > 0);
end; {function, Valid}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.OperatorAsString }

function TppAutoSearchField.OperatorAsString: String;
begin

  if (FAsFilter) then
    case FSearchOperator of
      soEqual:                Result := '=';
      soNotEqual:             Result := '<>';
      soLessThan:             Result := '<';
      soLessThanOrEqualTo:    Result := '<=';
      soGreaterThan:          Result := '>';
      soGreaterThanOrEqualTo: Result := '>=';
      soLike:                 Result := '=';
      soNotLike:              Result := '<>';
      soBetween:              Result := '';
      soNotBetween:           Result := '';
      soInList:               Result := '';
      soNotInList:            Result := '';
      soBlank:                Result := '';
      soNotBlank:             Result := '';
    else
      Result := '=';
    end

  else
    case FSearchOperator of
      soEqual:                Result := '=';
      soNotEqual:             Result := '<>';
      soLessThan:             Result := '<';
      soLessThanOrEqualTo:    Result := '<=';
      soGreaterThan:          Result := '>';
      soGreaterThanOrEqualTo: Result := '>=';
      soLike:                 Result := 'LIKE';
      soNotLike:              Result := 'NOT LIKE';
      soBetween:              Result := 'BETWEEN';
      soNotBetween:           Result := 'NOT BETWEEN';
      soInList:               Result := 'IN';
      soNotInList:            Result := 'NOT IN';
      soBlank:                Result := 'IS NULL';
      soNotBlank:             Result := 'IS NOT NULL';
    else
      Result := '=';
    end;

end; {procedure, OperatorAsString}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.OperatorDesc }

function TppAutoSearchField.OperatorDesc: String;
begin

  case FSearchOperator of
    soEqual:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(92) {'is'}
        else
          Result := ppLoadStr(93) {'is equal to'}
      end;

    soNotEqual:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(94) {'is not'}
        else
          Result := ppLoadStr(95) {'is not equal to'}
      end;

    soLessThan:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(96) {'is before'}
        else
          Result := ppLoadStr(97); {'is less than'}
      end;

    soLessThanOrEqualTo:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(98) {'is on or before'}
        else
          Result := ppLoadStr(99) {'is less than or equal to'}
      end;

    soGreaterThan:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(100) {'is after'}
        else
          Result := ppLoadStr(1000); {'is greater than'}
      end;

    soGreaterThanOrEqualTo:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(1001) {'is on or after'}
        else
          Result := ppLoadStr(1002); {'is greater than or equal to'}
      end;

    soLike: Result := ppLoadStr(1003); {'begins with'}
    soNotLike: Result := ppLoadStr(1004); {'does not begin with'}
    soBetween: Result := ppLoadStr(1005); {'is between'}
    soNotBetween: Result := ppLoadStr(1006); {'is not between'}
    soInList: Result := ppLoadStr(1007); {'matches one of the values in this list'}
    soNotInList: Result := ppLoadStr(1027); {'does not match any of the values in this list'}
    soBlank: Result := ppLoadStr(1008); {'is blank'}
    soNotBlank: Result := ppLoadStr(1009); {'is not blank'}

  else
    Result := ppLoadStr(93); {'is equal to'}
  end;

end; {procedure, OperatorDesc}

{******************************************************************************
 *
 ** F I E L D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppField.Create }

constructor TppField.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAlignment        := taLeftJustify;
  FAutoSearch       := False;
  FColumnWidth      := 0;
  FDataType         := dtString;
  FDisplayFormat    := '';
  FDisplayWidth     := 10;
  FFieldAlias       := '';
  FFieldName        := '';
  FFieldLength      := 10;
  FGroupOrder       := -1;
  FMandatory        := False;
  FReportComponent  := nil;
  FReportLabel      := nil;
  FSelectable       := True;
  FSelectOrder      := -1;
  FSearchable       := True;
  FSearch           := False;
  FSearchOrder      := -1;
  FSearchExpression := '';
  FSortable         := True;
  FSort             := False;
  FSortExpression   := '';
  FSortOrder        := -1;
  FSortOrderType    := soAscending;
  FTableAlias       := '';
  FTableName        := '';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppField.Destroy }

destructor TppField.Destroy;
begin

  Destroying;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppField.HasParent }

function TppField.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppField.GetDataPipeline }

function TppField.GetDataPipeline: TppDataPipeline;
begin
  if (Parent is TppDataPipeline) then
    Result := TppDataPipeline(Parent)
  else
    Result := nil;
end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppField.SetDataPipeline }

procedure TppField.SetDataPipeline(aDataPipeline: TppDataPipeline);
begin
  SetParent(aDataPipeline);
end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppField.SetDataType }

procedure TppField.SetDataType(aDataType: TppDataType);
begin

  if (DataPipeline <> nil) and not DataPipeline.IsValidDataType(aDataType) then
    raise EInvalidPropertyError.Create('DataType not supported by ' + DataPipeline.ClassName);

  FDataType := aDataType;

end; {procedure, SetDataType}

{------------------------------------------------------------------------------}
{ TppField.SetFieldName }

procedure TppField.SetFieldName(const aFieldName: String);
begin

  {also set FieldAlias, if needed}
  if (FFieldName = FFieldAlias) then
    FFieldAlias := aFieldName;

  FFieldName:= aFieldName;

  PropertyChange;

end; {procedure, SetFieldName}

{------------------------------------------------------------------------------}
{ TppField.SetSearchExpression }

procedure TppField.SetSearchExpression(const aExpression: String);
begin

  FSearchExpression:= aExpression;

  PropertyChange;

end; {procedure, SetSearchExpression}

{------------------------------------------------------------------------------}
{ TppField.GetFieldAsDouble }

function  TppField.GetFieldAsDouble: Double;
begin

  if DataPipeline = nil then
    Result := 0
  else
    Result := DataPipeline.GetFieldAsDouble(FFieldName);

end; {procedure, GetFieldAsDouble}

{------------------------------------------------------------------------------}
{ TppField.GetFieldAsPicture }

function  TppField.GetFieldAsPicture: TPicture;
begin

  if DataPipeline = nil then
    Result := nil
  else
    Result := DataPipeline.GetFieldAsPicture(FFieldName);

end; {procedure, GetFieldAsDouble}

{------------------------------------------------------------------------------}
{ TppField.GetFieldAsString }

function  TppField.GetFieldAsString: String;
begin

  if DataPipeline = nil then
    Result := ''
  else
    Result := DataPipeline.GetFieldAsString(FFieldName);

end; {procedure, GetFieldAsString}

{------------------------------------------------------------------------------}
{ TppField.GetFieldValue }

function TppField.GetFieldValue: Variant;
begin


  if DataPipeline = nil then
    Result := null
  else
    Result := DataPipeline.GetFieldValue(FFieldName);

end; {procedure, GetFieldValue}


{******************************************************************************
 *
 ** F I E L D  L I N K
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.Create }

constructor TppMasterFieldLink.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FMasterFieldName  := '';
  FDetailFieldName  := '';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.HasParent }

function TppMasterFieldLink.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.GetDetailDataPipeline }

function TppMasterFieldLink.GetDetailDataPipeline: TppDataPipeline;
begin
  if (Parent <> nil) and (Parent is TppDataPipeline) then
    Result := TppDataPipeline(Parent)
  else
    Result := nil;
end; {function, GetDetailDataPipeline}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.SetDetailDataPipeline }

procedure TppMasterFieldLink.SetDetailDataPipeline(aDataPipeline: TppDataPipeline);
begin
  SetParent(aDataPipeline);
end; {procedure, SetDetailDataPipeline}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.GetMasterDataPipeline }

function TppMasterFieldLink.GetMasterDataPipeline: TppDataPipeline;
begin
  if (Parent <> nil) and (Parent is TppDataPipeline) then
    Result := TppDataPipeline(Parent).MasterDataPipeline
  else
    Result := nil;
end; {procedure, GetMasterDataPipeline}


{******************************************************************************
*
*  D A T A   P I P E L I N E   L I S T
*
******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.Create }

constructor TppDataPipelineList.Create(aReport: TComponent);
begin

  inherited  Create;

  SetReport(aReport);

end;  {constructor, Create}


{------------------------------------------------------------------------------}
{ TppDataPipelineList.Destroy }


destructor TppDataPipelineList.Destroy;
begin

  inherited Destroy;

end; {constructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.AddDataPipeline }

procedure TppDataPipelineList.AddDataPipeline(aDataPipeline: TComponent);
begin
  {only add to list, if pipeline's Visible property set to true}
  if TppDataPipeline(aDataPipeline).Visible then
    AddObject(TppDataPipeline(aDataPipeline).UserName, aDataPipeline);

end; {procedure, AddDataPipeline}


{------------------------------------------------------------------------------}
{ TppDataPipelineList.BuildList }

procedure TppDataPipelineList.BuildList;
begin

  Clear;

  if (FReport = nil) then Exit;

  {build list of data pipeline names}
  if (FFormDesigner = nil) or (FFormDesigner.Designer = nil) then
    BuildDataListFromOwner(FReport.Owner)
  else
    BuildDataListFromDesigner(FFormDesigner);

end; {procedure, BuildList}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.Refresh }

procedure TppDataPipelineList.Refresh;
begin

  BuildList;

end; {procedure, Refresh}


{------------------------------------------------------------------------------}
{ TppDataPipelineList.SetReport }

procedure TppDataPipelineList.SetReport(aReport: TComponent);
begin

  FReport := aReport;

  {get the form designer}
  if FReport <> nil then
    FFormDesigner := TppCustomReport(FReport).FormDesigner
  else
    FFormDesigner := nil;

  BuildList;

end; {procedure, SetReport}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.BuildDataListFromDesigner }

procedure TppDataPipelineList.BuildDataListFromDesigner(aDesigner: TppFormDesigner);
begin
  aDesigner.GetComponentNames(GetTypeData(TppDataPipeline.ClassInfo), GetDataItemsCallback);
end; {procedure, BuildDataListFromDesigner}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.GetDataItemsCallback }

procedure TppDataPipelineList.GetDataItemsCallback(const S: string);
begin
  AddDataPipeline(TppDataPipeline(FFormDesigner.GetComponent(S)));

end; {procedure, GetDataItemsCallback}


{------------------------------------------------------------------------------}
{ TppDataPipelineList.GetDataPipelineForName }

function TppDataPipelineList.GetDataPipelineForName(aName: String): TppDataPipeline;
var
  liPipeline: Integer;

begin
  liPipeline := IndexOf(aName);

  if liPipeline < 0 then
    Result := nil
  else
    Result := TppDataPipeline(Objects[liPipeline]);

end; {procedure, GetDataPipelineForName}


{------------------------------------------------------------------------------}
{ TppDataPipelineList.GetPipeline }

function TppDataPipelineList.GetPipeline(aIndex: Integer): TppDataPipeline;
begin
  Result := TppDataPipeline(Objects[aIndex]);

end; {procedure, GetPipeline}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.BuildDataListFromOwner }

procedure TppDataPipelineList.BuildDataListFromOwner(aOwner: TComponent);
var
  liComponent: Integer;
  liComponents: Integer;
  liDataModule: Integer;

begin

  liComponents := aOwner.ComponentCount;

  {add data pipeline residing in owner}
  for liComponent := 0 to liComponents-1 do
    if aOwner.Components[liComponent] is TppDataPipeline then
      AddDataPipeline(TppDataPipeline(aOwner.Components[liComponent]));

  {add data pipelines residing in data modules }
  if not (aOwner is TDataModule) then
    for liDataModule := 0 to Screen.DataModuleCount-1 do
      BuildDataListFromDataModule(Screen.DataModules[liDataModule]);

end; {procedure, BuildDataListFromOwner}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.BuildDataListFromDataModule }

procedure TppDataPipelineList.BuildDataListFromDataModule(aDataModule: TDataModule);
var
  liComponent: Integer;

begin

  for liComponent := 0 to aDataModule.ComponentCount-1 do

    if aDataModule.Components[liComponent] is TppDataPipeline then
      AddDataPipeline(TppDataPipeline(aDataModule.Components[liComponent]));

end; {procedure, BuildDataListFromDataModules}

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
 ** D A T A   P I P E L I N E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.RefClass }

class function TraTppDataPipelineRTTI.RefClass: TClass;
begin
  Result := TppDataPipeline;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.GetPropList }

class procedure TraTppDataPipelineRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  aPropList.AddProp('FieldValues');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.GetPropRec }

class function TraTppDataPipelineRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {events}
  if CompareText(aPropName, 'OnRecordPositionChange') = 0 then
    EventToRec(aPropName, ciPipelineRecordPositionChange, False, aPropRec)

  else if CompareText(aPropName, 'OnMasterRecordPositionChange') = 0 then
    EventToRec(aPropName, ciPipelineMasterRecordPositionChange, False, aPropRec)

  else if CompareText(aPropName, 'OnTraversal') = 0 then
    EventToRec(aPropName, ciPipelineTraversal, False, aPropRec)

  else if CompareText(aPropName, 'OnGotoBookmark') = 0 then
    EventToRec(aPropName, ciPipelineGotoBookmark, False, aPropRec)

  else if CompareText(aPropName, 'OnDataChange') = 0 then
    EventToRec(aPropName, ciPipelineDataChange, False, aPropRec)

  else if CompareText(aPropName, 'OnFirst') = 0 then
    EventToRec(aPropName, ciPipelineFirst, False, aPropRec)

  else if CompareText(aPropName, 'OnNext') = 0 then
    EventToRec(aPropName, ciPipelineNext, False, aPropRec)

  else if CompareText(aPropName, 'OnPrior') = 0 then
    EventToRec(aPropName, ciPipelinePrior, False, aPropRec)

  else if CompareText(aPropName, 'OnLast') = 0 then
    EventToRec(aPropName, ciPipelineLast, False, aPropRec)

  else if CompareText(aPropName, 'OnOpen') = 0 then
    EventToRec(aPropName, ciPipelineOpen, False, aPropRec)

  else if CompareText(aPropName, 'OnClose') = 0 then
    EventToRec(aPropName, ciPipelineClose, False, aPropRec)


  {properties & methods}
  else if (CompareText(aPropName, '') = 0)  or (CompareText(aPropName, 'FieldValues') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'Fields') = 0)  then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if(CompareText(aPropName, 'MasterFieldLinkItems') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'Active') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'BOF') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'DataTraversed') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'DataView') = 0) then
    ClassPropToRec(aPropName, TComponent, True, aPropRec)

  else if (CompareText(aPropName, 'EOF') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'SkipWhenNoRecords') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'TraversalCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'Visible') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'CurrentField') = 0) then
    ClassPropToRec(aPropName, TppField, True, aPropRec)

  else if (CompareText(aPropName, 'FieldCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'MasterDataPipeline') = 0) then
    ClassPropToRec(aPropName, TppDataPipeline, False, aPropRec)

  else if (CompareText(aPropName, 'MasterFieldLinkCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'MasterFieldLinks') = 0) then
    ClassPropToRec(aPropName, TStrings, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.GetParams }

class function TraTppDataPipelineRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (CompareText(aMethodName, '') = 0) or (CompareText(aMethodName, 'FieldValues') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('FieldName', daString, nil, '', False, False);
      Result.AddParam('Result', daVariant, nil, '', False, False);
    end

  else if (CompareText(aMethodName, 'Fields') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppField, '', False, False);
    end

  else if (CompareText(aMethodName, 'MasterFieldLinkItems') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppMasterFieldLink, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.CallMethod }

class function TraTppDataPipelineRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lPipeline: TppDataPipeline;
  liIndex: Integer;
  lsField: String;
  lvValue: Variant;
  lField: TppField;
  lLink: TppMasterFieldLink;
begin

  Result := True;
  
  lPipeline := TppDataPipeline(aObject);

  if (CompareText(aMethodName, '') = 0) or (CompareText(aMethodName, 'FieldValues') = 0) then
    begin
      aParams.GetParamValue(0, lsField);

      lvValue := lPipeline.FieldValues[lsField];

      aParams.SetParamValue(1, lvValue);
    end

  else if (CompareText(aMethodName, 'Fields') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lField := lPipeline.Fields[liIndex];

      aParams.SetParamValue(1, Integer(lField));
    end

  else if (CompareText(aMethodName, 'MasterFieldLinkItems') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lLink := lPipeline.MasterFieldLinkItems[liIndex];

      aParams.SetParamValue(1, Integer(lLink));
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.GetPropValue }

class function TraTppDataPipelineRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Active') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).Active

  else if (CompareText(aPropName, 'BOF') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).BOF

  else if (CompareText(aPropName, 'DataTraversed') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).DataTraversed

  else if (CompareText(aPropName, 'DataView') = 0) then
     Integer(aValue) := Integer(TppDataPipeline(aObject).DataView)

  else if (CompareText(aPropName, 'EOF') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).EOF

  else if (CompareText(aPropName, 'SkipWhenNoRecords') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).SkipWhenNoRecords

  else if (CompareText(aPropName, 'TraversalCount') = 0) then
    Integer(aValue) := TppDataPipeline(aObject).TraversalCount

  else if (CompareText(aPropName, 'Visible') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).Visible

  else if (CompareText(aPropName, 'CurrentField') = 0) then
     Integer(aValue) := Integer(TppDataPipeline(aObject).CurrentField)

  else if (CompareText(aPropName, 'FieldCount') = 0) then
    Integer(aValue) := TppDataPipeline(aObject).FieldCount

  else if (CompareText(aPropName, 'MasterDataPipeline') = 0) then
     Integer(aValue) := Integer(TppDataPipeline(aObject).MasterDataPipeline)

  else if (CompareText(aPropName, 'MasterFieldLinkCount') = 0) then
    Integer(aValue) := TppDataPipeline(aObject).MasterFieldLinkCount

  else if (CompareText(aPropName, 'MasterFieldLinks') = 0) then
     Integer(aValue) := Integer(TppDataPipeline(aObject).MasterFieldLinks)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.SetPropValue }

class function TraTppDataPipelineRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'SkipWhenNoRecords') = 0) then
    TppDataPipeline(aObject).SkipWhenNoRecords := Boolean(aValue)

  else if (CompareText(aPropName, 'Visible') = 0) then
    TppDataPipeline(aObject).Visible := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}

{******************************************************************************
 *
 ** A U T O S E A R C H   F I E L D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.RefClass }

class function TraTppAutoSearchFieldRTTI.RefClass: TClass;
begin
  Result := TppAutoSearchField;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetPropList }

class procedure TraTppAutoSearchFieldRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('Value');
  aPropList.AddProp('Values');
  aPropList.AddProp('ValueCount');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetPropRec }

class function TraTppAutoSearchFieldRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {properties & methods}
  if (CompareText(aPropName, 'Value') = 0) then
    PropToRec(aPropName, daVariant, True, aPropRec)

  else if (CompareText(aPropName, 'Values') = 0)  then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if(CompareText(aPropName, 'ValueCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetParams }

class function TraTppAutoSearchFieldRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (CompareText(aMethodName, 'Values') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daVariant, nil, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.CallMethod }

class function TraTppAutoSearchFieldRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lField: TppAutoSearchField;
  liIndex: Integer;
  lvValue: Variant;
begin

  Result := True;
  
  lField := TppAutoSearchField(aObject);

  if (CompareText(aMethodName, 'Values') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lvValue := lField.Values[liIndex];

      aParams.SetParamValue(1, lvValue);
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetPropValue }

class function TraTppAutoSearchFieldRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Value') = 0) then
    Variant(aValue) := TppAutoSearchField(aObject).Value

  else if (CompareText(aPropName, 'ValueCount') = 0) then
    Integer(aValue) := TppAutoSearchField(aObject).ValueCount

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppField, TppAutoSearchField, TppMasterFieldLink]);

  raRegisterRTTI(TraTppDataPipelineRTTI);
  raRegisterRTTI(TraTppAutoSearchFieldRTTI);

finalization

  UnRegisterClasses([TppField, TppAutoSearchField, TppMasterFieldLink]);

  raUnRegisterRTTI(TraTppDataPipelineRTTI);
  raUnRegisterRTTI(TraTppAutoSearchFieldRTTI);

end.
