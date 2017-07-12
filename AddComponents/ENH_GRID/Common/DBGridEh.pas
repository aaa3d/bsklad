{*******************************************************}
{                                                       }
{                       EhLib v1.5                      }
{                   TDBGridEh component                 }
{                                                       }
{   Copyright (c) 1998, 1999 by Dmitry V. Bolshakov     }
{                                                       }
{*******************************************************}


//{$define eval}

unit DBGridEh;

{$R-}
{$I EhLib.Inc}

interface

uses Windows, SysUtils, Messages, Classes, Controls, Forms, StdCtrls,
  Graphics, Grids, DBCtrls, Db, Menus, DBGrids, Registry, DBSumLst
{$IFNDEF Eh_LIB_4} {Borland Delphi 3.0 or C++ Builder 3.0}
,MonthCal
{$ENDIF}
  {,dbugintf};

type
  TColumnEhValue = (cvColor, cvWidth, cvFont, cvAlignment, cvReadOnly, cvTitleColor,
    cvTitleCaption, cvTitleAlignment, cvTitleFont, cvImeMode, cvImeName, cvWordWrap,
    cvLookupDisplayFields, cvFooterAlignment, cvFooterFont, cvFooterColor, cvCheckboxes);
  TColumnEhValues = set of TColumnEhValue;

  TColumnEhRestoreParam = (crpColIndexEh,crpColWidthsEh,crpSortMarkerEh,crpColVisibleEh);
  TColumnEhRestoreParams = set of TColumnEhRestoreParam;

  TDBGridEhRestoreParam = (grpColIndexEh,grpColWidthsEh,grpSortMarkerEh,grpColVisibleEh,grpRowHeightEh);
  TDBGridEhRestoreParams = set of TDBGridEhRestoreParam;


const
  ColumnEhTitleValues = [cvTitleColor..cvTitleFont];
  ColumnEhFooterValues = [cvFooterAlignment..cvFooterColor];
(*  cm_DeferLayout = WM_USER + 100; *)

{ TColumnEh defines internal storage for column attributes.  Values assigned
  to properties are stored in this object, the grid- or field-based default
  sources are not modified.  Values read from properties are the previously
  assigned value, if any, or the grid- or field-based default values if
  nothing has been assigned to that property. This class also publishes the
  column attribute properties for persistent storage.  }

type
  TColumnEh = class;
  TCustomDBGridEh = class;

  TSortMarkerEh = (smNoneEh, smDownEh, smUpEh);

  TColumnTitleEh = class(TPersistent)
  private
    FColumn: TColumnEh;
    FCaption: string;
    FFont: TFont;
    FColor: TColor;
    FAlignment: TAlignment;
    //ddd
    FEndEllipsis: Boolean;
    FSortIndex: Integer;
    //\\\
    procedure FontChanged(Sender: TObject);
    function GetAlignment: TAlignment;
    function GetColor: TColor;
    function GetCaption: string;
    function GetFont: TFont;
    function IsAlignmentStored: Boolean;
    function IsColorStored: Boolean;
    function IsFontStored: Boolean;
    function IsCaptionStored: Boolean;
    procedure SetAlignment(Value: TAlignment);
    procedure SetColor(Value: TColor);
    procedure SetFont(Value: TFont);
    procedure SetCaption(const Value: string); virtual;
    procedure SetEndEllipsis(const Value: Boolean);
    procedure SetSortIndex(Value: Integer);
  protected
    //ddd
    FTitleButton: Boolean;
    FSortMarker: TSortMarkerEh;
    procedure SetTitleButton(Value: Boolean);
    procedure SetSortMarker(Value: TSortMarkerEh);
    //\\\
    procedure RefreshDefaultFont;
  public
    constructor Create(Column: TColumnEh);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function DefaultAlignment: TAlignment;
    function DefaultColor: TColor;
    function DefaultFont: TFont;
    function DefaultCaption: string;
    procedure RestoreDefaults; virtual;
    procedure SetNextSortMarkerValue(KeepMulti:Boolean);
  published
    property Alignment: TAlignment read GetAlignment write SetAlignment stored IsAlignmentStored;
    property Caption: string read GetCaption write SetCaption stored IsCaptionStored;
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property Font: TFont read GetFont write SetFont stored IsFontStored;
    //ddd
    property TitleButton: Boolean read FTitleButton write SetTitleButton default False;
    property SortMarker: TSortMarkerEh read FSortMarker write SetSortMarker default smNoneEh;
    property EndEllipsis: Boolean read FEndEllipsis write SetEndEllipsis default False;
    property SortIndex: Integer read FSortIndex write SetSortIndex default 0;
    //\\\
  end;


  //ddd
  TFooterValueType = (fvtNon,fvtSum,fvtCount,fvtFieldValue,fvtStaticText);

  TColumnFooterEh = class(TPersistent)
  private
    FColumn: TColumnEh;
    FFont: TFont;
    FColor: TColor;
    FAlignment: TAlignment;
    FEndEllipsis: Boolean;
    FValue:String;
    FFieldName: string;
    FValueType: TFooterValueType;
    FWordWrap: Boolean;
    procedure FontChanged(Sender: TObject);
    function GetAlignment: TAlignment;
    function GetColor: TColor;
    function GetFont: TFont;
    function IsAlignmentStored: Boolean;
    function IsColorStored: Boolean;
    function IsFontStored: Boolean;
    procedure SetAlignment(Value: TAlignment);
    procedure SetColor(Value: TColor);
    procedure SetFont(Value: TFont);
    procedure SetEndEllipsis(const Value: Boolean);
    procedure SetFieldName(const Value: String);
    procedure SetValueType(const Value: TFooterValueType);
    procedure SetValue(const Value: String);
    procedure SetWordWrap(const Value: Boolean);
  protected
    procedure RefreshDefaultFont;
  public
    constructor Create(Column: TColumnEh);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function DefaultAlignment: TAlignment;
    function DefaultColor: TColor;
    function DefaultFont: TFont;
    procedure RestoreDefaults; virtual;
    property Column: TColumnEh read FColumn;
  published
    property Alignment: TAlignment read GetAlignment write SetAlignment stored IsAlignmentStored;
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property Font: TFont read GetFont write SetFont stored IsFontStored;
    property EndEllipsis: Boolean read FEndEllipsis write SetEndEllipsis default False;
    property ValueType: TFooterValueType read FValueType write SetValueType default fvtNon;
    property FieldName: String read FFieldName write SetFieldName;
    property Value: String read FValue write SetValue;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
  end;
  //\\\

  //ddd
  TColumnEhType = (ctCommon, ctPickList, ctLookupField, ctKeyPickList, ctKeyImageList, ctCheckboxes);
  TColumnButtonStyleEh = (cbsAuto, cbsEllipsis, cbsNone, cbsUpDown);
  //\\\

  TColumnEh = class(TCollectionItem)
  private
    FField: TField;
    FFieldName: string;
    FColor: TColor;
    FWidth: Integer;
    FTitle: TColumnTitleEh;
    FFont: TFont;
    FImeMode: TImeMode;
    FImeName: TImeName;
    FPickList: TStrings;
    FPopupMenu: TPopupMenu;
    FDropDownRows: Cardinal;
    FButtonStyle: TColumnButtonStyleEh;
    FAlignment: TAlignment;
    FReadonly: Boolean;
    FAssignedValues: TColumnEhValues;
    FFooter: TColumnFooterEh;
    FVisible: Boolean;
    //ddd
    FKeyList: TStrings;
    FImageList: TImageList;
    FNotInKeyListIndex: Integer;
    FMinWidth: Integer;
    FMaxWidth: Integer;
    FNotInWidthRange:Boolean;
    FDblClickNextVal: Boolean;
    FCheckboxes: Boolean;
    FIncrement: Extended;
    //\\\
    procedure FontChanged(Sender: TObject);
    function  GetAlignment: TAlignment;
    function  GetColor: TColor;
    function  GetField: TField;
    function  GetFont: TFont;
    function  GetImeMode: TImeMode;
    function  GetImeName: TImeName;
    function  GetPickList: TStrings;
    function  GetReadOnly: Boolean;
    function  GetWidth: Integer;
    function  IsAlignmentStored: Boolean;
    function  IsColorStored: Boolean;
    function  IsFontStored: Boolean;
    function  IsImeModeStored: Boolean;
    function  IsImeNameStored: Boolean;
    function  IsReadOnlyStored: Boolean;
    function  IsWidthStored: Boolean;
    procedure SetAlignment(Value: TAlignment); virtual;
    procedure SetButtonStyle(Value: TColumnButtonStyleEh);
    procedure SetColor(Value: TColor);
    procedure SetField(Value: TField); virtual;
    procedure SetFieldName(const Value: String);
    procedure SetFont(Value: TFont);
    procedure SetImeMode(Value: TImeMode); virtual;
    procedure SetImeName(Value: TImeName); virtual;
    procedure SetPickList(Value: TStrings);
    procedure SetPopupMenu(Value: TPopupMenu);
    procedure SetReadOnly(Value: Boolean); virtual;
    procedure SetTitle(Value: TColumnTitleEh);
    procedure SetWidth(Value: Integer); virtual;
    //ddd
    procedure SetFooter(const Value: TColumnFooterEh);
    procedure SetVisible(const Value: Boolean);
    function GetKeykList: TStrings;
    procedure SetKeykList(const Value: TStrings);
    procedure SetNotInKeyListIndex(const Value: Integer);
    procedure SetImageList(const Value: TImageList);
    procedure SetMaxWidth(const Value: Integer);
    procedure SetMinWidth(const Value: Integer);
    function GetCheckboxes: Boolean;
    procedure SetCheckboxes(const Value: Boolean);
    function DefaultCheckboxes: Boolean;
    function GetCheckboxState: TCheckBoxState;
    procedure SetCheckboxState(const Value: TCheckBoxState);
    function  IsCheckboxesStored: Boolean;
    function IsIncrementStored: Boolean;
    //\\\
  protected
//ddd
    FInitWidth:Integer;
    FAutoFitColWidth:Boolean;
    FWordWrap:Boolean;
    FEndEllipsis: Boolean;
    FDropDownWidth: Integer;
    FLookupDisplayFields:String;
    FAlwaysShowEditButton: Boolean;
    FAutoDropDown: Boolean;
    FDBSum:TDBSum;
    function  GetAutoFitColWidth: Boolean;
    function  GetLookupDisplayFields: String;
    function  GetWordWrap: Boolean;
    function  IsWordWrapStored: Boolean;
    function  IsLookupDisplayFieldsStored: Boolean;
    function  DefaultLookupDisplayFields: String;
    function  DefaultWordWrap: Boolean;
    procedure SetAlwaysShowEditButton(Value: Boolean);
    procedure SetAutoDropDown(Value: Boolean);
    procedure SetAutoFitColWidth(Value: Boolean); virtual;
    procedure SetWordWrap(Value: Boolean); virtual;
    procedure SetLookupDisplayFields(Value:String); virtual;
    procedure SetDropDownWidth(Value: Integer);
    procedure SetEndEllipsis(const Value: Boolean);
    function  CreateFooter: TColumnFooterEh; virtual;
    procedure SetNextFieldValue(Increment: Extended);
    function  CanModify(TryEdit:Boolean):Boolean;
    function  AllowableWidth(TryWidth:Integer):Integer;
    procedure EnsureSumValue;
//\\\
    function  CreateTitle: TColumnTitleEh; virtual;
    function  GetGrid: TCustomDBGridEh;
    function GetDisplayName: string; override;
    procedure RefreshDefaultFont;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function  DefaultAlignment: TAlignment;
    function  DefaultColor: TColor;
    function  DefaultFont: TFont;
    function  DefaultImeMode: TImeMode;
    function  DefaultImeName: TImeName;
    function  DefaultReadOnly: Boolean;
    function  DefaultWidth: Integer;
    procedure RestoreDefaults; virtual;
    //ddd
    function  DisplayText: String;
    function  GetColumnType: TColumnEhType;
    //\\\
    property  Grid: TCustomDBGridEh read GetGrid;
    property  AssignedValues: TColumnEhValues read FAssignedValues;
    property  Field: TField read GetField write SetField;
    property  CheckboxState: TCheckBoxState read GetCheckboxState write SetCheckboxState;
  published
    property  Alignment: TAlignment read GetAlignment write SetAlignment stored IsAlignmentStored;
    property  ButtonStyle: TColumnButtonStyleEh read FButtonStyle write SetButtonStyle default cbsAuto;
    property  Color: TColor read GetColor write SetColor stored IsColorStored;
    property  DropDownRows: Cardinal read FDropDownRows write FDropDownRows default 7;
    property  FieldName: String read FFieldName write SetFieldName;
    property  Font: TFont read GetFont write SetFont stored IsFontStored;
    property  ImeMode: TImeMode read GetImeMode write SetImeMode stored IsImeModeStored;
    property  ImeName: TImeName read GetImeName write SetImeName stored IsImeNameStored;
    property  PickList: TStrings read GetPickList write SetPickList;
    property  PopupMenu: TPopupMenu read FPopupMenu write SetPopupMenu;
    property  ReadOnly: Boolean read GetReadOnly write SetReadOnly stored IsReadOnlyStored;
    property  Title: TColumnTitleEh read FTitle write SetTitle;
    property  Width: Integer read GetWidth write SetWidth stored IsWidthStored;
    //ddd
    property  AlwaysShowEditButton: Boolean read FAlwaysShowEditButton write SetAlwaysShowEditButton default False;
    property  AutoFitColWidth: Boolean read GetAutoFitColWidth write SetAutoFitColWidth default True;
    property  WordWrap: Boolean read GetWordWrap write SetWordWrap stored IsWordWrapStored;
    property  EndEllipsis: Boolean read FEndEllipsis write SetEndEllipsis default False;
    property  DropDownWidth: Integer read FDropDownWidth write SetDropDownWidth  default 0;
    property  LookupDisplayFields: String read GetLookupDisplayFields write SetLookupDisplayFields stored IsLookupDisplayFieldsStored;
    property  AutoDropDown: Boolean read FAutoDropDown write SetAutoDropDown  default False;
    property  Footer: TColumnFooterEh read FFooter write SetFooter;
    property  Visible: Boolean read FVisible write SetVisible default True;
    property  KeyList: TStrings read GetKeykList write SetKeykList;
    property  ImageList: TImageList read FImageList write SetImageList;
    property  NotInKeyListIndex: Integer read FNotInKeyListIndex write SetNotInKeyListIndex default -1;
    property  MinWidth: Integer read FMinWidth write SetMinWidth default 0;
    property  MaxWidth: Integer read FMaxWidth write SetMaxWidth default 0;
    property  DblClickNextVal: Boolean read FDblClickNextVal write FDblClickNextVal  default False;
    property  Checkboxes: Boolean read GetCheckboxes write SetCheckboxes stored IsCheckboxesStored;
    property  Increment: Extended read FIncrement write FIncrement stored IsIncrementStored;
    //\\\
  end;

  TColumnEhClass = class of TColumnEh;


  TDBGridColumnsEh = class(TCollection)
  private
    FGrid: TCustomDBGridEh;
    function GetColumn(Index: Integer): TColumnEh;
    function GetState: TDBGridColumnsState;
    procedure SetColumn(Index: Integer; Value: TColumnEh);
    procedure SetState(NewState: TDBGridColumnsState);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(Grid: TCustomDBGridEh; ColumnClass: TColumnEhClass);
    function  Add: TColumnEh;
    procedure LoadFromFile(const Filename: string);
    procedure LoadFromStream(S: TStream);
    procedure RestoreDefaults;
    procedure RebuildColumns;
    procedure SaveToFile(const Filename: string);
    procedure SaveToStream(S: TStream);
    property State: TDBGridColumnsState read GetState write SetState;
    property Grid: TCustomDBGridEh read FGrid;
    property Items[Index: Integer]: TColumnEh read GetColumn write SetColumn; default;
    //ddd
    function  ExistFooterValueType(AFooterValueType:TFooterValueType):Boolean;
    //\\\
  end;

  //ddd
  TColumnsEhList = class(TList)
  private
    function GetColumn(Index: Integer): TColumnEh;
    procedure SetColumn(Index: Integer; const Value: TColumnEh);
  public
    property Items[Index: Integer]: TColumnEh read GetColumn write SetColumn; default;
  end;
  //\\\

  TGridDataLinkEh = class(TDataLink)
  private
    FGrid: TCustomDBGridEh;
    FFieldCount: Integer;
    FFieldMapSize: Integer;
    FFieldMap: Pointer;
    FModified: Boolean;
    FInUpdateData: Boolean;
    FSparseMap: Boolean;
    function GetDefaultFields: Boolean;
    function GetFields(I: Integer): TField;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure DataSetScrolled(Distance: Integer); override;
    procedure FocusControl(Field: TFieldRef); override;
    procedure EditingChanged; override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
    function  GetMappedIndex(ColIndex: Integer): Integer;
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    function AddMapping(const FieldName: string): Boolean;
    procedure ClearMapping;
    procedure Modified;
    procedure Reset;
    property DefaultFields: Boolean read GetDefaultFields;
    property FieldCount: Integer read FFieldCount;
    property Fields[I: Integer]: TField read GetFields;
    property SparseMap: Boolean read FSparseMap write FSparseMap;
  end;

  TBookmarkListEh = class
  private
    FList: TStringList;
    FGrid: TCustomDBGridEh;
    FCache: TBookmarkStr;
    FCacheIndex: Integer;
    FCacheFind: Boolean;
    FLinkActive: Boolean;
    function GetCount: Integer;
    function GetCurrentRowSelected: Boolean;
    function GetItem(Index: Integer): TBookmarkStr;
    procedure SetCurrentRowSelected(Value: Boolean);
    procedure StringsChanged(Sender: TObject);
  protected
    function CurrentRow: TBookmarkStr;
    function Compare(const Item1, Item2: TBookmarkStr): Integer;
    procedure LinkActive(Value: Boolean);
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    procedure Clear;           // free all bookmarks
    procedure Delete;          // delete all selected rows from dataset
    function  Find(const Item: TBookmarkStr; var Index: Integer): Boolean;
    function  IndexOf(const Item: TBookmarkStr): Integer;
    function  Refresh: Boolean;// drop orphaned bookmarks; True = orphans found
    //d
    procedure SelectAll;
    //d\
    property Count: Integer read GetCount;
    property CurrentRowSelected: Boolean read GetCurrentRowSelected
      write SetCurrentRowSelected;
    property Items[Index: Integer]: TBookmarkStr read GetItem; default;
  end;


// For MultiTitle

  THeadTreeNode = class;
  TDBGridEh = class;

  LeafCol = record
    FLeaf:THeadTreeNode;
    FColumn:TColumnEh;
  end;

  PLeafCol = ^LeafCol;
  TLeafCol = array[0..MaxListSize - 1] of LeafCol;
  PTLeafCol = ^TLeafCol;


{  THeadTreeNode }

  THeadTreeProc = procedure (node:THeadTreeNode) of object;
  THeadTreeNode = class(TObject) // new
  public
    Host:THeadTreeNode;
    Child:THeadTreeNode;
    Next:THeadTreeNode;
    Text:String;
    Height:Integer;
    Width:Integer;
    WIndent:Integer;
    VLineWidth:Integer;
    Drawed:Boolean;
    HeightPrn:Integer;
    WidthPrn:Integer;
    constructor Create;
    constructor CreateText(AText:String;AHeight,AWidth:Integer);
    destructor Destroy; override;
    function Add(AAfter:THeadTreeNode;AText:String;AHeight,AWidth:Integer):THeadTreeNode ;
    function AddChild(ANode:THeadTreeNode;AText:String;AHeight,AWidth:Integer):THeadTreeNode ;
    function Find(ANode:THeadTreeNode):Boolean;
    procedure Union(AFrom,ATo :THeadTreeNode; AText:String;AHeight:Integer);
    procedure FreeAllChild;
    procedure CreateFieldTree(AGrid:TCustomDBGridEh);
    procedure DoForAllNode(proc:THeadTreeProc);
  end;

  TDBGridEhSumList = class(TDBSumListProducer)
  private
    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean);
  public
    constructor Create(AOwner:TComponent);
  published
    property Active: Boolean read GetActive write SetActive default False;
    property ExternalRecalc default False;
    property VirtualRecords default False;
    property SumListChanged;
    property OnRecalcAll;
  end;

  TDBGridEhScrollBar = class(TPersistent)
  private
    FDBGridEh: TCustomDBGridEh;
    FKind: TScrollBarKind;
    FVisible: Boolean;
    FTracking: Boolean;
    procedure SetVisible(Value: Boolean);
  public
    constructor Create(AGrid: TCustomDBGridEh; AKind: TScrollBarKind);
    procedure Assign(Source: TPersistent); override;
    property Kind: TScrollBarKind read FKind;
    function IsScrollBarVisible: Boolean;
  published
    property Tracking: Boolean read FTracking write FTracking default False;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;


// For TCustomDBGridEh

  TDBGridEhOption = (dghFixed3D, dghFrozen3D, dghFooter3D, dghData3D, dghResizeWholeRightPart,
                     dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking,
                     dghMultiSortMarking);
  TDBGridEhOptions = set of TDBGridEhOption;

  { The DBGrid's DrawDataCell virtual method and OnDrawDataCell event are only
    called when the grid's Columns.State is csDefault.  This is for compatibility
    with existing code. These routines don't provide sufficient information to
    determine which column is being drawn, so the column attributes aren't
    easily accessible in these routines.  Column attributes also introduce the
    possibility that a column's field may be nil, which would break existing
    DrawDataCell code.   DrawDataCell, OnDrawDataCell, and DefaultDrawDataCell
    are obsolete, retained for compatibility purposes. }
(*  TDrawDataCellEvent = procedure (Sender: TObject; const Rect: TRect; Field: TField;
    State: TGridDrawState) of object; *)

  { The DBGrid's DrawColumnCell virtual method and OnDrawColumnCell event are
    always called, when the grid has defined column attributes as well as when
    it is in default mode.  These new routines provide the additional
    information needed to access the column attributes for the cell being
    drawn, and must support nil fields.  }


  TDrawColumnEhCellEvent = procedure (Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumnEh; State: TGridDrawState) of object;
  TDBGridEhClickEvent = procedure (Column: TColumnEh) of object;
  TDrawFooterCellEvent = procedure (Sender: TObject; DataCol, Row: Longint;
    Column: TColumnEh; Rect: TRect; State: TGridDrawState) of object;
  TGetFooterParamsEvent = procedure (Sender: TObject; DataCol, Row: Longint;
    Column: TColumnEh; AFont: TFont; var Background: TColor;
    var Alignment : TAlignment; State: TGridDrawState; var Text:String) of object;

  TTitleEhClickEvent = procedure (Sender: TObject; ACol: Longint;
    Column: TColumnEh) of object;
  TCheckTitleEhBtnEvent = procedure (Sender: TObject; ACol: Longint;
    Column: TColumnEh; var Enabled: Boolean) of object;
  TGetBtnEhParamsEvent = procedure (Sender: TObject; Column: TColumnEh;
    AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
    IsDown: Boolean) of object;
  TGetCellEhParamsEvent = procedure (Sender: TObject; Column: TColumnEh;
    AFont: TFont; var Background: TColor; State: TGridDrawState) of object;

  TCustomDBGridEh = class(TCustomGrid)
  private
    FIndicators: TImageList;
    FTitleFont: TFont;
    FReadOnly: Boolean;
    FOriginalImeName: TImeName;
    FOriginalImeMode: TImeMode;
    FUserChange: Boolean;
    FLayoutFromDataset: Boolean;
    FOptions: TDBGridOptions;
    FTitleOffset, FIndicatorOffset: Byte;
    FUpdateLock: Byte;
    FLayoutLock: Byte;
    FInColExit: Boolean;
    FDefaultDrawing: Boolean;
    FSelfChangingTitleFont: Boolean;
    FSelecting: Boolean;
    FSelRow: Integer;
    FDataLink: TGridDataLinkEh;
    FOnColEnter: TNotifyEvent;
    FOnColExit: TNotifyEvent;
    FOnDrawDataCell: TDrawDataCellEvent;
    FOnDrawColumnCell: TDrawColumnEhCellEvent;
    FEditText: string;
    FColumns: TDBGridColumnsEh;
    FOnEditButtonClick: TNotifyEvent;
    FOnColumnMoved: TMovedEvent;
    FBookmarks: TBookmarkListEh;
    FSelectionAnchor: TBookmarkStr;
    FOnCellClick: TDBGridEhClickEvent;
    FOnTitleClick:TDBGridEhClickEvent;
    //ddd
    FOnGetCellParams: TGetCellEhParamsEvent;
    FOnGetFooterParams: TGetFooterParamsEvent;
    FOnSumListRecalcAll: TNotifyEvent;
    FHorzScrollBar: TDBGridEhScrollBar;
    FVertScrollBar: TDBGridEhScrollBar;
    FOptionsEh: TDBGridEhOptions;
    FEditKeyValue: Variant; // For lookup fields and KeyList based column
    ThumbTracked:Boolean;
    FOnSortMarkingChanged: TNotifyEvent;
    FSortMarking:Boolean;
    FUpDownBitmap:TBitmap;
    //\\\

    function AcquireFocus: Boolean;
    procedure DataChanged;
    procedure EditingChanged;
    function GetDataSource: TDataSource;
    function GetFieldCount: Integer;
    function GetFields(FieldIndex: Integer): TField;
    function GetSelectedField: TField;
    function GetSelectedIndex: Integer;
    procedure InternalLayout;
    procedure MoveCol(RawCol, Direction: Integer);
    procedure ReadColumns(Reader: TReader);
    procedure RecordChanged(Field: TField);
    procedure SetIme;
    procedure SetColumns(Value: TDBGridColumnsEh);
    procedure SetDataSource(Value: TDataSource);
    procedure SetOptions(Value: TDBGridOptions);
    procedure SetSelectedField(Value: TField);
    procedure SetSelectedIndex(Value: Integer);
    procedure SetTitleFont(Value: TFont);
    procedure TitleFontChanged(Sender: TObject);
    procedure UpdateData;
    procedure UpdateActive;
    procedure UpdateIme;
    procedure UpdateScrollBar;
    procedure UpdateRowCount;
    procedure WriteColumns(Writer: TWriter);
    procedure CMExit(var Message: TMessage); message CM_EXIT;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMParentFontChanged(var Message: TMessage); message CM_PARENTFONTCHANGED;
    procedure CMDeferLayout(var Message); message cm_DeferLayout;
    procedure CMDesignHitTest(var Msg: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    procedure WMHScroll(var Message: TWMHScroll); message WM_HSCROLL;
    procedure WMIMEStartComp(var Message: TMessage); message WM_IME_STARTCOMPOSITION;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SetFOCUS;
    procedure WMKillFocus(var Message: TMessage); message WM_KillFocus;
    procedure SetDrawMemoText(const Value: Boolean);
    procedure SetSumList(const Value: TDBGridEhSumList);
    procedure SetHorzScrollBar(const Value: TDBGridEhScrollBar);
    procedure SetVertScrollBar(const Value: TDBGridEhScrollBar);
    procedure SetOptionsEh(const Value: TDBGridEhOptions);
    //ddd
    procedure WMChar(var Message: TWMChar); message WM_CHAR;
    procedure WMTimer(var Message: TMessage); message WM_TIMER;
    procedure ClearSelection;
    procedure DoSelection(Select: Boolean; Direction: Integer; MaxDirection: Boolean);
    function  UpDownBitmap: TBitmap;
    //\\\
  protected

    FUpdateFields: Boolean;
    FAcquireFocus: Boolean;
    FUpdatingEditor: Boolean;


    //ddd
    FTitlEheight: Integer;
    FTitleLines: Integer;
    FTitlEheightFull: Integer;

    FMarginText:Boolean;
    FVTitleMargin: Integer;
    FHTitleMargin: Integer;
    FUseMultiTitle: Boolean;

    FAutoFitColWidths:Boolean;
    FMinAutoFitWidth:Integer;
    FInitColWidth:TList;

    FFooterRowCount: Integer;
    FOnDrawFooterCell:TDrawFooterCellEvent;

    FHeadTree:THeadTreeNode;
    FLeafFieldArr:PTLeafCol;
    FNewRowHeight: Integer;
    FRowLines: Integer;
    FRowSizingAllowed : Boolean;
    FDefaultRowChanged: Boolean;
    FAllowWordWrap: Boolean; // True if RowHeight + 3 > TextHeight
    FDrawMemoText: Boolean;
    FSortMarkerImages:TImageList;
    FPressedCol: Longint;
    FPressed: Boolean;
    FTracking: Boolean;
    FSwapButtons: Boolean;
    FOnCheckButton: TCheckTitleEhBtnEvent;
    FOnGetBtnParams: TGetBtnEhParamsEvent;
    FOnTitleBtnClick: TTitleEhClickEvent;
    FInplaceEditorButtonWidth: Integer;
    FFrozenCols: Integer;
    FSumList:TDBGridEhSumList;
    FVisibleColumns:TColumnsEhList;
    FPressedCell:TGridCoord;
    FIndicatorPressed:Boolean;
    FMousePos: TPoint;
    FMouseShift:TShiftState;
    FTimerActive:Boolean;
    FPresedRecord:TBookMarkStr;
    FSelectionAnchorSelected:Boolean;
    FAntiSelection:Boolean;
    FDataTracking:Boolean;
    FSortMarkedColumns:TColumnsEhList;
    //

    procedure Paint;override; //


    function  GetFooterRowCount: Integer;
    procedure SetFooterRowCount(Value: Integer);

    procedure ClearPainted(node:THeadTreeNode);
    function SetChildTreEheight(ANode:THeadTreeNode):Integer;

    function  ReadTitlEheight: Integer;
    procedure WriteTitlEheight(th: Integer);
    function  ReadTitleLines: Integer;
    procedure WriteTitleLines(tl: Integer);

    procedure WriteMarginText(IsMargin:Boolean);
    procedure WriteVTitleMargin(Value: Integer);
    procedure WritEhTitleMargin(Value: Integer);
    procedure WriteUseMultiTitle(Value:Boolean);

    procedure WriteAutoFitColWidths(Value:Boolean);
    procedure WriteMinAutoFitWidth(Value:Integer);

    function GetColWidths(Index: Longint): Integer;
    procedure SetColWidths(Index: Longint; Value: Integer);

    procedure SetRowSizingAllowed(Value:Boolean);

    function  GetRowHeight: Integer;
    procedure SetRowHeight(Value: Integer);

    function  GetRowLines: Integer;
    procedure SetRowLines(Value: Integer);

    procedure RowHeightsChanged; override;
    function  StdDefaultRowHeight: Integer;

    procedure StopTracking;
    procedure TrackButton(X, Y: Integer);
    procedure WMCancelMode(var Message: TMessage); message WM_CANCELMODE;
    procedure DoTitleClick(ACol: Longint; AColumn: TColumnEh); dynamic;
    procedure CheckTitleButton(ACol: Longint; var Enabled: Boolean); dynamic;
    procedure GetCellParams(Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState ); dynamic;
    procedure SetFrozenCols(Value: Integer);
    procedure EnsureFooterValueType(AFooterValueType:TFooterValueType; AFieldName:String);
    procedure SumListChanged(Sender: TObject);
    procedure SumListRecalcAll(Sender: TObject);
    procedure GetFooterParams(DataCol, Row: Longint; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment : TAlignment; State: TGridDrawState; var Text:String); dynamic;
    function  CanEditModifyText: Boolean;
    function  VisibleDataRowCount: Integer;
    procedure TimerScroll;
    procedure StopTimer;
    function  DataRect:TRect;
    procedure DoSortMarkingChanged; dynamic;
//\\\
    function  RawToDataColumn(ACol: Integer): Integer;
    function  DataToRawColumn(ACol: Integer): Integer;
    function  AcquireLayoutLock: Boolean;
    procedure BeginLayout;
    procedure BeginUpdate;
    procedure CancelLayout;
    function  CanEditAcceptKey(Key: Char): Boolean; override;
    function  CanEditModify: Boolean; override;
    function  CanEditShow: Boolean; override;
    procedure CellClick(Column: TColumnEh); dynamic;
    procedure ColumnMoved(FromIndex, ToIndex: Longint); override;
    procedure ColEnter; dynamic;
    procedure ColExit; dynamic;
    procedure ColWidthsChanged; override;
    function  CreateColumns: TDBGridColumnsEh; dynamic;
    function  CreateEditor: TInplaceEdit; override;
    procedure CreateWnd; override;
    procedure DeferLayout;
    //dddprocedure DefaultHandler(var Msg); override;
    procedure DefineFieldMap; virtual;
    procedure DefineProperties(Filer: TFiler); override;
    //ddd
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
    //\\\
    procedure DrawDataCell(const Rect: TRect; Field: TField;
      State: TGridDrawState); dynamic; { obsolete }
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer;
      Column: TColumnEh; State: TGridDrawState); dynamic;
    procedure EditButtonClick; dynamic;
    procedure EndLayout;
    procedure EndUpdate;
    function  GetColField(DataCol: Integer): TField;
    function  GetEditLimit: Integer; override;
    function  GetEditMask(ACol, ARow: Longint): string; override;
    function  GetEditText(ACol, ARow: Longint): string; override;
    function  GetFieldValue(ACol: Integer): string;
    function  HighlightCell(DataCol, DataRow: Integer; const Value: string;
      AState: TGridDrawState): Boolean; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure LayoutChanged; virtual;
    procedure LinkActive(Value: Boolean); virtual;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    //ddd
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    //\\\
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Scroll(Distance: Integer); virtual;
    procedure SetColumnAttributes; virtual;
    procedure SetEditText(ACol, ARow: Longint; const Value: string); override;
    function  StoreColumns: Boolean;
    procedure TimedScroll(Direction: TGridScrollDirection); override;
    procedure TitleClick(Column: TColumnEh); dynamic;
    property Columns: TDBGridColumnsEh read FColumns write SetColumns;
    property DefaultDrawing: Boolean read FDefaultDrawing write FDefaultDrawing default True;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataLink: TGridDataLinkEh read FDataLink;
//ddd    property IndicatorOffset: Byte read FIndicatorOffset;
    property LayoutLock: Byte read FLayoutLock;
    property Options: TDBGridOptions read FOptions write SetOptions
      default [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines,
      dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit];
    property ParentColor default False;
    property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
    property SelectedRows: TBookmarkListEh read FBookmarks;
    property TitleFont: TFont read FTitleFont write SetTitleFont;
    property UpdateLock: Byte read FUpdateLock;
    property OnColEnter: TNotifyEvent read FOnColEnter write FOnColEnter;
    property OnColExit: TNotifyEvent read FOnColExit write FOnColExit;
    property OnDrawDataCell: TDrawDataCellEvent read FOnDrawDataCell
      write FOnDrawDataCell; { obsolete }
    property OnDrawColumnCell: TDrawColumnEhCellEvent read FOnDrawColumnCell
      write FOnDrawColumnCell;
    property OnEditButtonClick: TNotifyEvent read FOnEditButtonClick
      write FOnEditButtonClick;
    property OnColumnMoved: TMovedEvent read FOnColumnMoved write FOnColumnMoved;
    property OnCellClick: TDBGridEhClickEvent read FOnCellClick write FOnCellClick;
    property OnTitleClick: TDBGridEhClickEvent read FOnTitleClick write FOnTitleClick;
    //ddd
    procedure SaveColumnsLayoutProducer(ARegIni: TObject; Section: String; DeleteSection: Boolean);
    procedure RestoreColumnsLayoutProducer(ARegIni: TObject; Section: String; RestoreParams:TColumnEhRestoreParams);
    procedure SaveGridLayoutProducer(ARegIni: TObject; Section: String; DeleteSection: Boolean);
    procedure RestoreGridLayoutProducer(ARegIni: TObject; Section: String; RestoreParams:TDBGridEhRestoreParams);
    //\\\
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DefaultDrawDataCell(const Rect: TRect; Field: TField;
      State: TGridDrawState); { obsolete }
    procedure DefaultDrawColumnCell(const Rect: TRect; DataCol: Integer;
      Column: TColumnEh; State: TGridDrawState);
    function ValidFieldIndex(FieldIndex: Integer): Boolean;
    property HeadTree: THeadTreeNode read FHeadTree;
    property LeafFieldArr: PTLeafCol read FLeafFieldArr;
    property EditorMode;
    property FieldCount: Integer read GetFieldCount;
    property Fields[FieldIndex: Integer]: TField read GetFields;
    property SelectedField: TField read GetSelectedField write SetSelectedField;
    property SelectedIndex: Integer read GetSelectedIndex write SetSelectedIndex;

    //ddd

{$IFDEF Eh_LIB_4} {Borland Delphi 4.0 or C++ Builder 4.0}
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
{$ENDIF}

    procedure DefaultHandler(var Msg); override;
    procedure InvalidateFooter;

    procedure SaveColumnsLayout(ARegIni: TRegIniFile);
    procedure RestoreColumnsLayout(ARegIni: TRegIniFile; RestoreParams:TColumnEhRestoreParams);
    procedure SaveColumnsLayoutIni(IniFileName: String; Section: String; DeleteSection: Boolean);
    procedure RestoreColumnsLayoutIni(IniFileName: String; Section: String; RestoreParams:TColumnEhRestoreParams);

    procedure SaveGridLayout(ARegIni: TRegIniFile);
    procedure RestoreGridLayout(ARegIni: TRegIniFile; RestoreParams:TDBGridEhRestoreParams);
    procedure SaveGridLayoutIni(IniFileName: String; Section: String; DeleteSection: Boolean);
    procedure RestoreGridLayoutIni(IniFileName: String; Section: String; RestoreParams:TDBGridEhRestoreParams);

    function CellRect(ACol, ARow: Longint): TRect;
    procedure DefaultDrawFooterCell(const Rect: TRect; DataCol, Row: Integer;
      Column: TColumnEh; State: TGridDrawState);
    function GetFooterValue(Row: Integer; Column: TColumnEh): String; virtual;
    procedure SetSortMarkedColumns;

    property Canvas;
    property Col;
    property InplaceEditor;
    property LeftCol;
    property Row;
    property VisibleRowCount;
    property VisibleColCount;
    property IndicatorOffset: Byte read FIndicatorOffset;
    property TitleOffset: Byte read FTitleOffset;

    property FooterRowCount: Integer read GetFooterRowCount write SetFooterRowCount default 0;
    property FrozenCols: Integer read FFrozenCols write SetFrozenCols default 0;
    property OnDrawFooterCell:TDrawFooterCellEvent read FOnDrawFooterCell write FOnDrawFooterCell;

    property TitlEheight: Integer read ReadTitlEheight write WriteTitlEheight default 0;
    property TitleLines: Integer read ReadTitleLines write WriteTitleLines default 0;
    property VTitleMargin: Integer read FVTitleMargin write WriteVTitleMargin default 10;
//    property HTitleMargin: Integer read FHTitleMargin write WritEhTitleMargin default 0;
    property UseMultiTitle: Boolean read FUseMultiTitle write WriteUseMultiTitle default False;
    property AutoFitColWidths: Boolean read FAutoFitColWidths write WriteAutoFitColWidths default False;
    property MinAutoFitWidth: Integer read FMinAutoFitWidth write WriteMinAutoFitWidth default 0;
    property RowHeight: Integer read GetRowHeight write SetRowHeight default 0;
    property RowLines: Integer read GetRowLines write SetRowLines default 0;
    property RowSizingAllowed:Boolean read FRowSizingAllowed write SetRowSizingAllowed default False;
    property DrawMemoText:Boolean read FDrawMemoText write SetDrawMemoText default false;
    property OnCheckButton: TCheckTitleEhBtnEvent read FOnCheckButton write FOnCheckButton;
    property OnGetBtnParams: TGetBtnEhParamsEvent read FOnGetBtnParams write FOnGetBtnParams;
    property OnTitleBtnClick: TTitleEhClickEvent read FOnTitleBtnClick write FOnTitleBtnClick;
    property OnGetCellParams: TGetCellEhParamsEvent read FOnGetCellParams write FOnGetCellParams;
    property OnGetFooterParams: TGetFooterParamsEvent read FOnGetFooterParams write FOnGetFooterParams;
    property SumList:TDBGridEhSumList read FSumList write SetSumList;
    property OnSumListRecalcAll: TNotifyEvent read FOnSumListRecalcAll write FOnSumListRecalcAll;
    property VisibleColumns: TColumnsEhList read FVisibleColumns write FVisibleColumns;
    property HorzScrollBar: TDBGridEhScrollBar read FHorzScrollBar write SetHorzScrollBar;
    property VertScrollBar: TDBGridEhScrollBar read FVertScrollBar write SetVertScrollBar;
    property OptionsEh: TDBGridEhOptions read FOptionsEh write SetOptionsEh
                                  default [dghFixed3D,dghHighlightFocus,dghClearSelection];
    property OnSortMarkingChanged: TNotifyEvent read FOnSortMarkingChanged write FOnSortMarkingChanged;
    property SortMarkedColumns: TColumnsEhList read FSortMarkedColumns write FSortMarkedColumns;
    //\\\

  end;

  TDBGridEh = class(TCustomDBGridEh)
  public
    //ddd
    property GridHeight;
    property RowCount;
    //\\\
    property Canvas;
    property SelectedRows;
  published
    property Align;
    property BorderStyle;
    property Color;
    property Columns stored False; //StoreColumns;
    property Ctl3D;
    property DataSource;
    property DefaultDrawing;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FixedColor;
    property Font;
    property ImeMode;
    property ImeName;
    property Options;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property TitleFont;
    property Visible;
    property OnCellClick;
    property OnColEnter;
    property OnColExit;
    property OnColumnMoved;
    property OnDrawDataCell;  { obsolete }
    property OnDrawColumnCell;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditButtonClick;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDrag;
    property OnTitleClick;

{$IFDEF Eh_LIB_4} {Borland Delphi 4.0 or C++ Builder 4.0}
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
{$ENDIF}

    //ddd
    property FooterRowCount;
    property FrozenCols;
    property TitlEheight;
    property TitleLines;
    property VTitleMargin;
//    property HTitleMargin;
    property UseMultiTitle;
    property AutoFitColWidths;
    property MinAutoFitWidth;
    property RowHeight;
    property RowSizingAllowed;
    property RowLines;
    property DrawMemoText;
    property SumList;
    property HorzScrollBar;
    property VertScrollBar;
    property OptionsEh;

    property OnDrawFooterCell;
    property OnGetFooterParams;
    property OnCheckButton;
    property OnGetBtnParams;
    property OnTitleBtnClick;
    property OnGetCellParams;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnSumListRecalcAll;
    property OnSortMarkingChanged;
    //\\\

  end;

{const
  IndicatorWidth = 11;}
var
  SortMarkerFont :TFont;

procedure WriteTextEh(ACanvas: TCanvas;      // Canvas
                      ARect: TRect;          // Draw rect and ClippingRect
                      FillRect:Boolean;      // Fill rect Canvas.Brash.Color
                      DX, DY: Integer;       // InflateRect(Rect, -DX, -DY) for text
                      const Text: string;    // Draw text
                      Alignment: TAlignment; // Text alignment
                      Layout: TTextLayout;   // Text layout
                      MultyL:Boolean;        // Word break
                      EndEllipsis:Boolean;   // Truncate long text by ellipsis
                      LeftMarg,              // Left margin
                      RightMarg:Integer);    // Right margin

implementation

uses DBConsts, Dialogs, IniFiles, Comctrls, CommCtrl;

{$R DBGRIDEH.RES}


const
  bmArrow = 'DBGARROWEH';
  bmEdit = 'DBEDITEH';
  bmInsert = 'DBINSERTEH';
  bmMultiDot = 'DBMULTIDOTEH';
  bmMultiArrow = 'DBMULTIARROWEH';
//ddd
  bmSmDown = 'DBSMDOWNEH';
  bmSmUp = 'DBSMUPEH';
//\\\

  MaxMapSize = (MaxInt div 2) div SizeOf(Integer);  { 250 million }


var
  FCheckBoxWidth, FCheckBoxHeight: Integer;

procedure GetCheckSize;
begin
  with TBitmap.Create do
    try
      Handle := LoadBitmap(0, PChar(32759));
      FCheckBoxWidth := Width div 4;
      FCheckBoxHeight := Height div 3;
    finally
      Free;
    end;
end;

{ Error reporting }


procedure RaiseGridError(const S: string);
begin
  raise EInvalidGridOperation.Create(S);
end;

procedure KillMessage(Wnd: HWnd; Msg: Integer);
// Delete the requested message from the queue, but throw back
// any WM_QUIT msgs that PeekMessage may also return
var
  M: TMsg;
begin
  M.Message := 0;
  if PeekMessage(M, Wnd, Msg, Msg, pm_Remove) and (M.Message = WM_QUIT) then
    PostQuitMessage(M.wparam);
end;

//ddd

//Pure RX
type
  //ddd
  TCharSet = Set of Char;
  //\\\

function ExtractWord(N: Integer; const S: string; WordDelims: TCharSet): string; forward;

function GetDefaultSection(Component: TComponent): string;
var
  F: TCustomForm;
  Owner: TComponent;
begin
  if Component <> nil then begin
    if Component is TCustomForm then Result := Component.ClassName
    else begin
      Result := Component.Name;
      if Component is TControl then begin
        F := GetParentForm(TControl(Component));
        if F <> nil then Result := F.ClassName + Result
        else begin
          if TControl(Component).Parent <> nil then
            Result := TControl(Component).Parent.Name + Result;
        end;
      end
      else begin
        Owner := Component.Owner;
        if Owner is TForm then
          Result := Format('%s.%s', [Owner.ClassName, Result]);
      end;
    end;
  end
  else Result := '';
end;

function Max(A, B: Longint): Longint;
begin
  if A > B then Result := A
  else Result := B;
end;

function Min(A, B: Longint): Longint;
begin
  if A < B then Result := A
  else Result := B;
end;

function iif(Condition:Boolean;V1,V2:Integer):Integer;
begin
  if (Condition) then Result := V1 else Result := V2;
end;

//\\\

procedure GridInvalidateRow(Grid: TCustomDBGridEh; Row: Longint);
var
  I: Longint;
begin
  for I := 0 to Grid.ColCount - 1 do Grid.InvalidateCell(I, Row);
end;

{ TDBGridInplaceEdit }

{ TDBGridInplaceEdit adds support for a button on the in-place editor,
  which can be used to drop down a table-based lookup list, a stringlist-based
  pick list, or (if button style is esEllipsis) fire the grid event
  OnEditButtonClick.  }

type
  TEditStyle = (esSimple, esEllipsis, esPickList, esDataList, esDateCalendar ,esUpDown);
  TPopupListbox = class;
  TPopupMonthCalendar = class;

  TDBGridInplaceEdit = class(TInplaceEdit)
  private
    FButtonWidth: Integer;
    FDataList: TDBLookupListBox;
    FPickList: TPopupListbox;
    FActiveList: TWinControl;
    FLookupSource: TDatasource;
    FEditStyle: TEditStyle;
    FListVisible: Boolean;
    FTracking: Boolean;
    FPressed: Boolean;
    //ddd
    FPopupMonthCalendar: TPopupMonthCalendar;
    FWordWrap: Boolean;
    FUpDown:TUpDown;
    procedure ListMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UpDownChanging (Sender: TObject; var AllowChange: Boolean);
    procedure UpDownClick(Sender: TObject; Button: TUDBtnType);
    //\\\
    procedure ListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SetEditStyle(Value: TEditStyle);
    procedure StopTracking;
    procedure TrackButton(X,Y: Integer);
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CancelMode;
    procedure WMCancelMode(var Message: TMessage); message WM_CancelMode;
    procedure WMKillFocus(var Message: TMessage); message WM_KillFocus;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message wm_LButtonDblClk;
    procedure WMPaint(var Message: TWMPaint); message wm_Paint;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SetCursor;
    procedure SetWordWrap(const Value: Boolean);
  protected
    procedure BoundsChanged; override;
    procedure CloseUp(Accept: Boolean);
    //ddd
    procedure CreateParams(var Params: TCreateParams); override;
    //\\\
    procedure DoDropDownKeys(var Key: Word; Shift: TShiftState);
    procedure DropDown;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure PaintWindow(DC: HDC); override;
    procedure UpdateContents; override;
    procedure WndProc(var Message: TMessage); override;
    //ddd
    procedure KeyPress(var Key: Char); override;
    property WordWrap: Boolean read FWordWrap write SetWordWrap;
    //\\\
    property  EditStyle: TEditStyle read FEditStyle write SetEditStyle;
    property  ActiveList: TWinControl read FActiveList write FActiveList;
    property  DataList: TDBLookupListBox read FDataList;
    property  PickList: TPopupListbox read FPickList;
  public
    constructor Create(Owner: TComponent); override;
  end;

{ TPopupListbox }

  TPopupListbox = class(TCustomListbox)
  private
    FSearchText: String;
    FSearchTickCount: Longint;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  end;

//ddd
{ TPopupMonthCalendar }
  TPopupMonthCalendar = class(TMonthCalendar)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  end;
//\\\

procedure TPopupListBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TPopupListbox.CreateWnd;
begin
  inherited CreateWnd;
  Windows.SetParent(Handle, 0);
  CallWindowProc(DefWndProc, Handle, wm_SetFocus, 0, 0);
end;

procedure TPopupListbox.Keypress(var Key: Char);
var
  TickCount: Integer;
begin
  case Key of
    #8, #27: FSearchText := '';
    #32..#255:
      begin
        TickCount := GetTickCount;
        if TickCount - FSearchTickCount > 2000 then FSearchText := '';
        FSearchTickCount := TickCount;
        if Length(FSearchText) < 32 then FSearchText := FSearchText + Key;
        SendMessage(Handle, LB_SelectString, WORD(-1), Longint(PChar(FSearchText)));
        Key := #0;
      end;
  end;
  inherited Keypress(Key);
end;

procedure TPopupListbox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  TDBGridInPlaceEdit(Owner).CloseUp((X >= 0) and (Y >= 0) and
      (X < Width) and (Y < Height));
end;

//ddd

procedure TPopupMonthCalendar.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TPopupMonthCalendar.CreateWnd;
begin
  inherited CreateWnd;
  Windows.SetParent(Handle, 0);
  CallWindowProc(DefWndProc, Handle, wm_SetFocus, 0, 0);
end;

procedure TPopupMonthCalendar.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var MCHInfo:TMCHitTestInfo;
begin
  inherited MouseUp(Button, Shift, X, Y);
  MCHInfo.cbSize := SizeOf(TMCHitTestInfo);
  MCHInfo.pt.x := X;
  MCHInfo.pt.y := Y;
  MonthCal_HitTest(Handle,MCHInfo);
  if ((MCHInfo.uHit and MCHT_CALENDARDATE) > 0) and  (MCHInfo.uHit <> MCHT_CALENDARDAY) and
   (MCHInfo.uHit <> MCHT_TITLEBTNNEXT) and (MCHInfo.uHit <> MCHT_TITLEBTNPREV) then
    TDBGridInPlaceEdit(Owner).CloseUp(True)
  else if (MCHInfo.uHit and MCHT_NOWHERE > 0) then
    TDBGridInPlaceEdit(Owner).CloseUp(False)
  else if not ((X >= 0) and (Y >= 0) and
      (X < Width) and (Y < Height)) then
    TDBGridInPlaceEdit(Owner).CloseUp(False);
end;

//\\\

constructor TDBGridInplaceEdit.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FLookupSource := TDataSource.Create(Self);
  FButtonWidth := GetSystemMetrics(SM_CXVSCROLL);
  FEditStyle := esSimple;
end;

procedure TDBGridInplaceEdit.BoundsChanged;
var
  R: TRect;
begin
  SetRect(R, 2, 2, Width - 2, Height);
  if FEditStyle <> esSimple then Dec(R.Right, FButtonWidth);
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@R));
  SendMessage(Handle, EM_SCROLLCARET, 0, 0);
  if SysLocale.FarEast then
    SetImeCompositionWindow(Font, R.Left, R.Top);
  //ddd
  if FEditStyle = esUpDown then
  begin
    FUpDown.Visible := True;
    FUpDown.SetBounds(Width - FButtonWidth, 0, FButtonWidth, Height);
  end;
  //\\\
end;

procedure TDBGridInplaceEdit.CloseUp(Accept: Boolean);
var
  MasterField: TField;
  ListValue: Variant;
  //ddd
  CurColumn:TColumnEh;
  idx:Integer;
  //\\\
begin
  //ddd
  CurColumn := TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex];
  //\\\
  if FListVisible then
  begin
    if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
    if FActiveList = FDataList then
      ListValue := FDataList.KeyValue
    else
    //ddd
    if FActiveList = FPopupMonthCalendar then begin
    end
    else
    //\\\
      if FPickList.ItemIndex <> -1 then begin
        //ddd
        if Assigned(CurColumn.KeyList)  and (CurColumn.KeyList.Count > 0) then
           ListValue := CurColumn.KeyList.Strings[FPicklist.ItemIndex]
        else
        //\\
         ListValue := FPickList.Items[FPicklist.ItemIndex];
      end;
    SetWindowPos(FActiveList.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
    FListVisible := False;
    if Assigned(FDataList) then
      FDataList.ListSource := nil;
    FLookupSource.Dataset := nil;
    Invalidate;
    if Accept then begin
      if FActiveList = FDataList then
        with TCustomDBGridEh(Grid), Columns[SelectedIndex].Field do
        begin
          MasterField := DataSet.FieldByName(KeyFields);
          if MasterField.CanModify then
          begin
            DataSet.Edit;
            try
              MasterField.Value := ListValue;
            //ddd
            except
               on Exception do begin
                 Text := TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].Field.Text + ' '; //May be delphi bag. But without ' ' don't assign
                 raise;
               end;
            end;
            Text := FDataList.SelectedItem;
            //\\\
          end;
        end
      else
      //ddd
      if FActiveList = FPopupMonthCalendar then begin
        with TCustomDBGridEh(Grid), Columns[SelectedIndex].Field do begin
         DataSet.Edit;
         AsDateTime := FPopupMonthCalendar.Date;
        end;
      end
      else
      //\\\
        if (not VarIsNull(ListValue)) and {dddEditCanModify}TCustomDBGridEh(Grid).CanEditModifyText  then
          with TCustomDBGridEh(Grid), Columns[SelectedIndex].Field do
            //ddd
            if Assigned(CurColumn) and Assigned(CurColumn.KeyList)  and (CurColumn.KeyList.Count > 0) then begin
              Self.Text := FPickList.Items[FPicklist.ItemIndex];
              Text := ListValue;
            end
            else
            //\\\
              Text := ListValue
    end
    //ddd
    else if FActiveList = FDataList then
      Text := TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].Field.Text
    else if FActiveList = FPickList then
      if CurColumn.GetColumnType = ctKeyPickList then begin
        idx := CurColumn.KeyList.IndexOf(CurColumn.Field.Text);
        if (idx <> -1) then
          Text := CurColumn.PickList.Strings[idx]
        else
          Text := '';
      end else
        Text := TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].Field.Text;
    //\\\
  end;
end;

//ddd
procedure TDBGridInplaceEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if WordWrap then
    Params.Style:=Params.Style and (not ES_AUTOHSCROLL)  or ES_MULTILINE  or ES_LEFT; 
end;
//\\\

procedure TDBGridInplaceEdit.DoDropDownKeys(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP, VK_DOWN:
      if ssAlt in Shift then
      begin
        if FListVisible then CloseUp(True) else DropDown;
        Key := 0;
      end;
    VK_RETURN, VK_ESCAPE:
      if FListVisible and not (ssAlt in Shift) then
      begin
        CloseUp(Key = VK_RETURN);
        Key := 0;
      end;
  end;
end;

procedure TDBGridInplaceEdit.DropDown;
var
  P: TPoint;
  I,J,Y: Integer;
  Column: TColumnEh;
  //ddd
  TM: TTextMetric;
  RestoreCanvas: Boolean;
  fList:TList;
  dlcw:Integer;
  WorkArea,R: TRect;
  //\\\
begin
  if not FListVisible and Assigned(FActiveList) then
  begin
    FActiveList.Width := Width;
    with TCustomDBGridEh(Grid) do
      Column := Columns[SelectedIndex];
    if FActiveList = FDataList then
    with Column.Field do
    begin
      FDataList.Color := Color;
      FDataList.Font := Font;
      FDataList.RowCount := Column.DropDownRows;
      FLookupSource.DataSet := LookupDataSet;
      FDataList.KeyField := LookupKeyFields;
//ddd      FDataList.ListField := {ddd LookupResultField}Column.LookupDisplayFields;
      //ddd
      FDataList.ListFieldIndex := 0;
      if (Column.DropDownWidth = -1) then begin
        RestoreCanvas := not HandleAllocated;
        if RestoreCanvas then
          TCustomDBGridEh(Grid).Canvas.Handle := GetDC(0);
        try
          fList := TList.Create;
          LookupDataSet.GetFieldList(fList,Column.LookupDisplayFields);
          TCustomDBGridEh(Grid).Canvas.Font := Self.Font;
          GetTextMetrics(TCustomDBGridEh(Grid).Canvas.Handle, TM);
          dlcw := 0;
          for i := 0 to fList.Count - 1 do begin
            Inc(dlcw,TField(fList[i]).DisplayWidth * (TCustomDBGridEh(Grid).Canvas.TextWidth('0') - TM.tmOverhang)
                                        + TM.tmOverhang + 4);
            if (TField(fList[i]).FieldName = LookupResultField) then FDataList.ListFieldIndex := i;
          end;
          FDataList.ClientWidth := dlcw;
          if (FDataList.Width < Self.Width) then FDataList.Width := Self.Width;
          fList.Free;
        finally
          if RestoreCanvas then
          begin
            ReleaseDC(0,TCustomDBGridEh(Grid).Canvas.Handle);
            TCustomDBGridEh(Grid).Canvas.Handle := 0;
          end;
        end
      end
      else if (Column.DropDownWidth > 0) then
        FDataList.ClientWidth := Column.DropDownWidth;
      FDataList.ListField := Column.LookupDisplayFields;  // Assignment ListField must be after ListFieldIndex
      FDataList.ListSource := FLookupSource;
      FDataList.KeyValue := TCustomDBGridEh(Grid).FEditKeyValue {DataSet.FieldByName(KeyFields).Value ddd};
      //\\\
{      J := Column.DefaultWidth;
      if J > FDataList.ClientWidth then
        FDataList.ClientWidth := J;
}    end
    else
    //ddd
    if (FActiveList = FPopupMonthCalendar) then begin
      FPopupMonthCalendar.Color := Color;
      FPopupMonthCalendar.Font := Font;
      {try
        FPopupMonthCalendar.Date := StrToDate(Text);
      except
        FPopupMonthCalendar.Date := TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].Field.AsDateTime;
      end;}
      try
        if Text = '' then
          FPopupMonthCalendar.Date := Date
        else
         FPopupMonthCalendar.Date := StrToDate(Text);
      except
        if TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].Field.AsDateTime = 0 then
          FPopupMonthCalendar.Date := Date
        else
          FPopupMonthCalendar.Date := TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].Field.AsDateTime;
      end;
      MonthCal_GetMinReqRect(FPopupMonthCalendar.Handle, R);
      FPopupMonthCalendar.Width := R.Right - R.Left;
    end
    else
    //\\\
    begin
      FPickList.Color := Color;
      FPickList.Font := Font;
      //ddd
        if Assigned(Column.KeyList)  and (Column.KeyList.Count > 0) then begin
          FPickList.Items.BeginUpdate;
          FPickList.Items.Clear;
          for i := 0 to Min(Column.KeyList.Count,Column.Picklist.Count) - 1 do
             FPickList.Items.AddObject(Column.Picklist.Strings[i], Column.Picklist.Objects[i]);
          FPickList.Items.EndUpdate;
        end
        else
      //\\\
        FPickList.Items := Column.Picklist;
      if FPickList.Items.Count >= Integer(Column.DropDownRows) then
        FPickList.Height := Integer(Column.DropDownRows) * FPickList.ItemHeight + 4
      else
        FPickList.Height := FPickList.Items.Count * FPickList.ItemHeight + 4;
      if Column.Field.IsNull then
        FPickList.ItemIndex := -1
      else
      // ddd
        if Assigned(Column.KeyList)  and (Column.KeyList.Count > 0) then
          FPickList.ItemIndex := Column.KeyList.IndexOf(Text)
        else
      //\\\
        FPickList.ItemIndex := FPickList.Items.IndexOf({dddColumn.Field.Value}Text);
      J := FPickList.ClientWidth;
      for I := 0 to FPickList.Items.Count - 1 do
      begin
        Y := FPickList.Canvas.TextWidth(FPickList.Items[I]);
        if Y > J then J := Y;
      end;
      FPickList.ClientWidth := J;
    end;
    P := Parent.ClientToScreen(Point(Left, Top));
    Y := P.Y + Height;
    SystemParametersInfo(SPI_GETWORKAREA,0,Pointer(@WorkArea),0);
    if Y + FActiveList.Height > WorkArea.Bottom then Y := P.Y - FActiveList.Height;
    //ddd Drop Down Width
    if (FActiveList.Width > WorkArea.Right - WorkArea.Left) then
      FActiveList.Width := WorkArea.Right - WorkArea.Left;
    if (P.X + FActiveList.Width > WorkArea.Right)  then
      P.X := WorkArea.Right - FActiveList.Width ;
    //\\
    SetWindowPos(FActiveList.Handle, HWND_TOP, P.X, Y, 0, 0,
      SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
    FListVisible := True;
    Invalidate;
    Windows.SetFocus(Handle);
  end;
end;

type
  TWinControlCracker = class(TWinControl) end;

procedure TDBGridInplaceEdit.KeyDown(var Key: Word; Shift: TShiftState);
//ddd
var MasterField,Field: TField;
    Y:Integer;
//\\\
begin
  if (EditStyle = esEllipsis) and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
  begin
    TCustomDBGridEh(Grid).EditButtonClick;
    KillMessage(Handle, WM_CHAR);
  end
  else
  //ddd
  if (Key = VK_DELETE) and (Shift = []) and (SelStart = 0) and (SelLength = Length(Text))
     and TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].CanModify(True) then
  begin
    if EditStyle = esDataList then
    begin
      Field := TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].Field;
      MasterField := Field.DataSet.FieldByName(Field.KeyFields);
      if MasterField.CanModify then
      begin
        MasterField.DataSet.Edit;
        MasterField.Clear;
        Text := '';
        Field.Clear;
        //\\\
      end
    end
    else if (EditStyle = esPickList) and
           (TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].GetColumnType = ctKeyPickList) then
    begin
      Text := '';
      TCustomDBGridEh(Grid).FEditText := Text;
    end
  end
  else if (Key = VK_BACK) and
     (TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].GetColumnType in [ctLookupField, ctKeyPickList]) then
  begin
    Key := VK_LEFT;
    inherited KeyDown(Key, Shift);
  end
  else if WordWrap and (Key in [VK_UP, VK_DOWN]) then begin
    if not (dgAlwaysShowEditor in TCustomDBGridEh(Grid).Options) then Exit;
    Y := Perform(EM_LINEFROMCHAR, SelStart, 0);
    if (Y = 0) and (Key = VK_UP) then inherited KeyDown(Key, Shift)
    else if (Y+1 = Perform(EM_GETLINECOUNT, 0, 0)) and (Key = VK_DOWN) then inherited KeyDown(Key, Shift)
    else if SelLength = Length(Text) then inherited KeyDown(Key, Shift);
  end
  else
//\\\
    inherited KeyDown(Key, Shift);
end;

procedure TDBGridInplaceEdit.ListMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    CloseUp(PtInRect(FActiveList.ClientRect, Point(X, Y)));
end;

//ddd
procedure TDBGridInplaceEdit.ListMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if (FEditStyle = esDataList) and (FDataList <> nil) and (ssLeft in Shift) then
    Text := FDataList.SelectedItem;
end;

procedure TDBGridInplaceEdit.ListMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (FEditStyle = esDataList) and (FDataList <> nil) and (ssLeft in Shift) then
    Text := FDataList.SelectedItem;
end;

procedure TDBGridInplaceEdit.UpDownChanging(Sender: TObject; var AllowChange: Boolean);
begin
//  AllowChange := False;
end;

procedure TDBGridInplaceEdit.UpDownClick(Sender: TObject; Button: TUDBtnType);
var Col:TColumnEh;
    Znak:Integer;
begin
  Col := TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex];
  if not Col.CanModify(True) then Exit;
  Znak := 1;
  if (Col.Grid.GetEditText(Col.Grid.Col,0) <> Text) then
  begin
    Col.Grid.SetEditText(Col.Grid.Col,0,Text);
    Col.Grid.UpdateData;
  end;
  if Button = btNext then
  begin
    if Col.GetColumnType <> ctCommon then Znak := -1;
    Col.SetNextFieldValue(Col.Increment * Znak);
  end
  else
  begin
    if Col.GetColumnType <> ctCommon then Znak := -1;
    Col.SetNextFieldValue(-Col.Increment * Znak);
  end;
end;

//\\\

procedure TDBGridInplaceEdit.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if (Button = mbLeft) and (FEditStyle in [esEllipsis..esDateCalendar]) and
    PtInRect(Rect(Width - FButtonWidth, 0, Width, Height), Point(X,Y)) then
  begin
    if FListVisible then
      CloseUp(False)
    else
    begin
      MouseCapture := True;
      FTracking := True;
      TrackButton(X, Y);
      if Assigned(FActiveList) then
        DropDown;
    end;
  end;
  inherited MouseDown(Button, Shift, X, Y);
  //ddd
  if TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].DblClickNextVal and (ssDouble in Shift) then
    if (ssShift in Shift) then
      TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].SetNextFieldValue(-1)
    else
      TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].SetNextFieldValue(1);
  //\\\
end;

procedure TDBGridInplaceEdit.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  ListPos: TPoint;
  MousePos: TSmallPoint;
begin
  if FTracking then
  begin
    TrackButton(X, Y);
    if FListVisible then
    begin
      ListPos := FActiveList.ScreenToClient(ClientToScreen(Point(X, Y)));
      if PtInRect(FActiveList.ClientRect, ListPos) then
      begin
        StopTracking;
        MousePos := PointToSmallPoint(ListPos);
        SendMessage(FActiveList.Handle, WM_LBUTTONDOWN, 0, Integer(MousePos));
        Exit;
      end;
    end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TDBGridInplaceEdit.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  WasPressed: Boolean;
begin
  WasPressed := FPressed;
  StopTracking;
  if (Button = mbLeft) and (FEditStyle = esEllipsis) and WasPressed then
    TCustomDBGridEh(Grid).EditButtonClick;
  inherited MouseUp(Button, Shift, X, Y);
end;

//ddd
procedure PaintInplaceButton(DC:HDC; EditStyle:TEditStyle; Rect:TRect; Pressed, Active: Boolean);
var W,H,Flags,VFlags: Integer;
begin
  Flags := 0;
  if EditStyle <> esSimple then
    if EditStyle in [esDataList, esPickList, esDateCalendar] then { esDropDown }
    begin
      if Active = False then
        Flags := DFCS_INACTIVE
      else if Pressed then
        Flags := DFCS_FLAT or DFCS_PUSHED;
      DrawFrameControl(DC, Rect, DFC_SCROLL, Flags or DFCS_SCROLLCOMBOBOX);
    end
    else   { esEllipsis }
    begin
      if Pressed then
        Flags := BF_FLAT;
      DrawEdge(DC, Rect, EDGE_RAISED, BF_RECT or BF_MIDDLE or Flags);
      Flags := ((Rect.Right - Rect.Left) shr 1) - 1 + Ord(Pressed);
      VFlags := ((Rect.Bottom - Rect.Top) shr 1) - 1 + Ord(Pressed);
      W := (Rect.Right - Rect.Left) shr 3;   H := (Rect.Bottom - Rect.Top) shr 3;
      if W = 0 then W := 1;                  if H = 0 then H := 1;
      if W > 2 then W := 2;                  if H > 2 then H := 2;
      PatBlt(DC, Rect.Left + Flags, Rect.Top + VFlags, W, H, BLACKNESS);
      PatBlt(DC, Rect.Left + Flags - (W * 2), Rect.Top + VFlags, W, H, BLACKNESS);
      PatBlt(DC, Rect.Left + Flags + (W * 2), Rect.Top + VFlags, W, H, BLACKNESS);
    end;
end;
//\\\

procedure TDBGridInplaceEdit.PaintWindow(DC: HDC);
var
  R: TRect;
//ddd  Flags: Integer;
//ddd  W: Integer;
begin
  if (FEditStyle <> esSimple) and (FEditStyle <> esUpDown) then
  begin
    SetRect(R, Width - FButtonWidth, 0, Width, Height);
//ddd    Flags := 0;
    //ddd
    PaintInplaceButton(DC, FEditStyle, R, FPressed, True);
    (*if FEditStyle in [esDataList, esPickList] then
    begin
      ddd
      if FActiveList = nil then
        Flags := DFCS_INACTIVE
      else if FPressed then
        Flags := DFCS_FLAT or DFCS_PUSHED;
      DrawFrameControl(DC, R, DFC_SCROLL, Flags or DFCS_SCROLLCOMBOBOX);
    end
    else   { esEllipsis }
    begin
      if FPressed then
        Flags := BF_FLAT;
      DrawEdge(DC, R, EDGE_RAISED, BF_RECT or BF_MIDDLE or Flags);
      Flags := ((R.Right - R.Left) shr 1) - 1 + Ord(FPressed);
      W := Height shr 3;
      if W = 0 then W := 1;
      PatBlt(DC, R.Left + Flags, R.Top + Flags, W, W, BLACKNESS);
      PatBlt(DC, R.Left + Flags - (W * 2), R.Top + Flags, W, W, BLACKNESS);
      PatBlt(DC, R.Left + Flags + (W * 2), R.Top + Flags, W, W, BLACKNESS);
    end;*)
    //\\\
    ExcludeClipRect(DC, R.Left, R.Top, R.Right, R.Bottom);
  end;
  inherited PaintWindow(DC);
end;

procedure TDBGridInplaceEdit.SetEditStyle(Value: TEditStyle);
begin
  if Value = FEditStyle then Exit;
  FEditStyle := Value;
  case Value of
    esPickList:
      begin
        if FPickList = nil then
        begin
          FPickList := TPopupListbox.Create(Self);
          FPickList.Visible := False;
          FPickList.Parent := Self;
          FPickList.OnMouseUp := ListMouseUp;
          FPickList.IntegralHeight := True;
          FPickList.ItemHeight := 11;
        end;
        FActiveList := FPickList;
      end;
    esDataList:
      begin
        if FDataList = nil then
        begin
          FDataList := TPopupDataList.Create(Self);
          FDataList.Visible := False;
          FDataList.Parent := Self;
          FDataList.OnMouseUp := ListMouseUp;
          //ddd
          FDataList.OnMouseMove := ListMouseMove;
          FDataList.OnMouseDown := ListMouseDown;
          //\\\
        end;
        FActiveList := FDataList;
      end;
     //ddd
    esDateCalendar:
      begin
        if FPopupMonthCalendar = nil then
        begin
          FPopupMonthCalendar := TPopupMonthCalendar.Create(Self);
          FPopupMonthCalendar.Visible := False;
          FPopupMonthCalendar.Parent := Self;
//          FPopupMonthCalendar.OnMouseUp := ListMouseUp;
        end;
        FActiveList := FPopupMonthCalendar;
      end;
    esUpDown:
      begin
        if FUpDown = nil then
        begin
          FUpDown := TUpDown.Create(Self);
          FUpDown.Visible := False;
          FUpDown.Parent := Self;
          FUpDown.OnChanging := UpDownChanging;
          FUpDown.OnClick := UpDownClick;
          FUpDown.Wrap := True;
        end;
      end;
     //\\\
  else  { cbsNone, cbsEllipsis, or read only field }
    FActiveList := nil;
  end;
  if FUpDown <> nil then FUpDown.Visible := False; {//ddd}
  with TCustomDBGridEh(Grid) do
    Self.ReadOnly := Columns[SelectedIndex].ReadOnly;
  Repaint;
end;

procedure TDBGridInplaceEdit.StopTracking;
begin
  if FTracking then
  begin
    TrackButton(-1, -1);
    FTracking := False;
    MouseCapture := False;
  end;
end;

procedure TDBGridInplaceEdit.TrackButton(X,Y: Integer);
var
  NewState: Boolean;
  R: TRect;
begin
  SetRect(R, ClientWidth - FButtonWidth, 0, ClientWidth, ClientHeight);
  NewState := PtInRect(R, Point(X, Y));
  if FPressed <> NewState then
  begin
    FPressed := NewState;
    InvalidateRect(Handle, @R, False);
  end;
end;

function GetColumnEditStile(Column: TColumnEh):TEditStyle;
var  MasterField: TField;
     ACanModify: Boolean;
begin
  Result := esSimple;
  case Column.ButtonStyle of
   cbsEllipsis: Result := esEllipsis;
   cbsUpDown: Result := esUpDown;
   cbsAuto:
     if Assigned(Column.Field) then
     with Column.Field do
     begin
       { Show the dropdown button only if the field is editable }
       if FieldKind = fkLookup then
       begin
         MasterField := Dataset.FieldByName(KeyFields);
         { Column.DefaultReadonly will always be True for a lookup field.
           Test if Column.ReadOnly has been assigned a value of True }
         //ddd
         ACanModify := MasterField.CanModify or (Assigned(Column.Grid) and (csDesigning in Column.Grid.ComponentState));
         //\\\
         if Assigned(MasterField) and {ddd MasterField.CanModify} ACanModify and
           not ((cvReadOnly in Column.AssignedValues) and Column.ReadOnly) then
           with Column.Grid do
             if not ReadOnly and DataLink.Active and not Datalink.ReadOnly then
               Result := esDataList
       end
       else
       if Assigned(Column.Picklist) and (Column.PickList.Count > 0) and
         not Column.Readonly then
         Result := esPickList
       //ddd
       else if (DataType in [ftDate,ftDateTime]) and not Column.Readonly then
         Result := esDateCalendar;
       //\\\
     end;
  end;
end;

procedure TDBGridInplaceEdit.UpdateContents;
var
  Column: TColumnEh;
  NewStyle: TEditStyle;
  MasterField: TField;
  //ddd
  NewBackgrnd:TColor;
  //\\\
begin
  with TCustomDBGridEh(Grid) do
    Column := Columns[SelectedIndex];
  NewStyle := esSimple;
  case Column.ButtonStyle of
   cbsEllipsis: NewStyle := esEllipsis;
   cbsAuto:
     if Assigned(Column.Field) then
     with Column.Field do
     begin
       { Show the dropdown button only if the field is editable }
       if FieldKind = fkLookup then
       begin
         MasterField := Dataset.FieldByName(KeyFields);
         { Column.DefaultReadonly will always be True for a lookup field.
           Test if Column.ReadOnly has been assigned a value of True }
         if Assigned(MasterField) and MasterField.CanModify and
           not ((cvReadOnly in Column.AssignedValues) and Column.ReadOnly) then
           with TCustomDBGridEh(Grid) do
             if not ReadOnly and DataLink.Active and not Datalink.ReadOnly then
               NewStyle := esDataList
       end
       else
       if Assigned(Column.Picklist) and (Column.PickList.Count > 0) and
         not Column.Readonly then
         NewStyle := esPickList
       //ddd
       else if (DataType in [ftDate,ftDateTime]) and not Column.Readonly then
         NewStyle := esDateCalendar;
       //\\\
     end;
   cbsUpDown: NewStyle := esUpDown;
  end;
  EditStyle := NewStyle;
  //ddd Backgrnd And Color of Inplace Editor
  NewBackgrnd := Column.Color;
  Font.Assign(Column.Font);
  TCustomDBGridEh(Grid).GetCellParams(Column,Font,NewBackgrnd,[gdFocused]);
  Color := NewBackgrnd;
  WordWrap := Column.WordWrap and TCustomDBGridEh(Grid).FAllowWordWrap;
  //\\\
  inherited UpdateContents;
end;

procedure TDBGridInplaceEdit.CMCancelMode(var Message: TCMCancelMode);
begin
  if (Message.Sender <> Self) and (Message.Sender <> FActiveList) then
    CloseUp(False);
end;

procedure TDBGridInplaceEdit.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TDBGridInplaceEdit.WMKillFocus(var Message: TMessage);
begin
  if not SysLocale.FarEast then inherited
  else
  begin
    ImeName := Screen.DefaultIme;
    ImeMode := imDontCare;
    inherited;
    if HWND(Message.WParam) <> TCustomDBGridEh(Grid).Handle then
      ActivateKeyboardLayout(Screen.DefaultKbLayout, KLF_ACTIVATE);
  end;
  CloseUp(False);
end;

procedure TDBGridInplaceEdit.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  with Message do
  if (FEditStyle <> esSimple) and
    PtInRect(Rect(Width - FButtonWidth, 0, Width, Height), Point(XPos, YPos)) then
    Exit;
  inherited;
end;

procedure TDBGridInplaceEdit.WMPaint(var Message: TWMPaint);
begin
  PaintHandler(Message);
end;

procedure TDBGridInplaceEdit.WMSetCursor(var Message: TWMSetCursor);
var
  P: TPoint;
begin
  GetCursorPos(P);
  if (FEditStyle <> esSimple) and
    PtInRect(Rect(Width - FButtonWidth, 0, Width, Height), ScreenToClient(P)) then
    Windows.SetCursor(LoadCursor(0, idc_Arrow))
  else
    inherited;
end;

procedure TDBGridInplaceEdit.WndProc(var Message: TMessage);
var AColumn: TColumnEh;
begin
  case Message.Msg of
    wm_KeyDown, wm_SysKeyDown, wm_Char:
      if EditStyle in [esPickList, esDataList, esDateCalendar] then
      with TWMKey(Message) do
      begin
        DoDropDownKeys(CharCode, KeyDataToShiftState(KeyData));
        //ddd
        AColumn := TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex];
        if (CharCode <> 0) and (Message.Msg = wm_Char) and (Char(CharCode) in [#32..#255]) and not FListVisible
              and AColumn.AutoDropDown then
          DropDown;
        //\\\
        if (CharCode <> 0) and FListVisible then
        begin
          with TMessage(Message) do begin
             if (CharCode in [VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT]) or
               ((CharCode in [VK_HOME,VK_END]) and (ssCtrl in KeyDataToShiftState(KeyData))) or
               ((CharCode in [VK_LEFT, VK_RIGHT]) and (EditStyle = esDateCalendar)) then begin
               SendMessage(FActiveList.Handle, Msg, WParam, LParam);
               //ddd
               if (FEditStyle = esDataList) and (FDataList <> nil) then
                 Text := FDataList.SelectedItem
               else if (FEditStyle = esPickList) then
                 if (FPickList.ItemIndex <> -1) and (Text <> FPickList.Items[FPickList.ItemIndex]) then
                     Text := FPickList.Items[FPickList.ItemIndex];
               //\\\
               Exit;
             end;
          end;
        end;
      end
  end;
  inherited;
end;

function StringsIndexOfPartialStr(StrList:TStrings; PartStr: String):Integer;
var i:Integer;
begin
  Result :=  -1;
  for i := 0 to StrList.Count - 1 do
    if  CompareText(Copy(StrList.Strings[i],1,Length(PartStr)),PartStr) = 0 then begin
      Result := i;
      Break;
    end;
end;

procedure TDBGridInplaceEdit.KeyPress(var Key: Char);
var AColumn: TColumnEh;
    CurPosition,Idx:Integer;
    FSearchText: String;
    CanChange:Boolean;
begin
  if (EditStyle = esDataList) and (Key in [#32..#255]) then begin
    with TCustomDBGridEh(Grid) do AColumn := Columns[SelectedIndex];
    CurPosition := SelStart;
    FSearchText := Copy(Text,1,CurPosition) + Key;
    if AColumn.Field.LookupDataSet.Locate(AColumn.Field.LookupResultField, FSearchText,
      [loCaseInsensitive, loPartialKey]) then
    begin
      Key := #0;
      Text := AColumn.Field.LookupDataSet.FieldByName(AColumn.Field.LookupResultField).Text;
      SelStart := Length(Text);
      SelLength := Length(FSearchText) - SelStart;

      TCustomDBGridEh(Grid).DataLink.Edit;
      CanChange := TCustomDBGridEh(Grid).Datalink.Editing;
      if CanChange then TCustomDBGridEh(Grid).Datalink.Modified;

      TCustomDBGridEh(Grid).FEditKeyValue := AColumn.Field.LookupDataSet.FieldByName(AColumn.Field.LookupKeyFields).Value;
      TCustomDBGridEh(Grid).FEditText := Text;
      if Assigned(FDataList) then FDataList.KeyValue := TCustomDBGridEh(Grid).FEditKeyValue;
    end;
  end else if ((TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex].GetColumnType = ctKeyPickList) or
     (EditStyle = esPickList)) and (Key in [#32..#255]) and TCustomDBGridEh(Grid).CanEditModifyText then begin
    CurPosition := SelStart;
    FSearchText := Copy(Text,1,CurPosition) + Key;
    AColumn := TCustomDBGridEh(Grid).Columns[TCustomDBGridEh(Grid).SelectedIndex];
    Idx := StringsIndexOfPartialStr(AColumn.PickList,FSearchText);
    if (Idx <> -1) then begin
      Key := #0;
      Text := AColumn.PickList[Idx];
      SelStart := Length(Text);
      SelLength := Length(FSearchText) - SelStart;

      TCustomDBGridEh(Grid).DataLink.Edit;
      CanChange := TCustomDBGridEh(Grid).Datalink.Editing;
      if CanChange then TCustomDBGridEh(Grid).Datalink.Modified;

      TCustomDBGridEh(Grid).FEditText := Text;
      if Assigned(FPickList) then FPickList.ItemIndex := Idx;
    end;
  end;
  inherited;
end;

procedure TDBGridInplaceEdit.SetWordWrap(const Value: Boolean);
begin
  if Value <> FWordWrap then
  begin
    FWordWrap := Value;
    RecreateWnd;
  end;
end;

//\\\

{ TGridDataLinkEh }

type
  TIntArray = array[0..MaxMapSize] of Integer;
  PIntArray = ^TIntArray;

constructor TGridDataLinkEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
end;

destructor TGridDataLinkEh.Destroy;
begin
  ClearMapping;
  inherited Destroy;
end;

function TGridDataLinkEh.GetDefaultFields: Boolean;
var
  I: Integer;
begin
  Result := True;
  if DataSet <> nil then Result := DataSet.DefaultFields;
  if Result and SparseMap then
  for I := 0 to FFieldCount-1 do
    if PIntArray(FFieldMap)^[I] < 0 then
    begin
      Result := False;
      Exit;
    end;
end;

function TGridDataLinkEh.GetFields(I: Integer): TField;
begin
  if (0 <= I) and (I < FFieldCount) and (PIntArray(FFieldMap)^[I] >= 0) then
    Result := DataSet.Fields[PIntArray(FFieldMap)^[I]]
  else
    Result := nil;
end;

function TGridDataLinkEh.AddMapping(const FieldName: string): Boolean;
var
  Field: TField;
  NewSize: Integer;
begin
  Result := True;
  if FFieldCount >= MaxMapSize then RaiseGridError(STooManyColumns);
  if SparseMap then
    Field := DataSet.FindField(FieldName)
  else
    Field := DataSet.FieldByName(FieldName);

  if FFieldCount = FFieldMapSize then
  begin
    NewSize := FFieldMapSize;
    if NewSize = 0 then
      NewSize := 8
    else
      Inc(NewSize, NewSize);
    if (NewSize < FFieldCount) then
      NewSize := FFieldCount + 1;
    if (NewSize > MaxMapSize) then
      NewSize := MaxMapSize;
    ReallocMem(FFieldMap, NewSize * SizeOf(Integer));
    FFieldMapSize := NewSize;
  end;
  if Assigned(Field) then
  begin
    PIntArray(FFieldMap)^[FFieldCount] := Field.Index;
    Field.FreeNotification(FGrid);
  end
  else
    PIntArray(FFieldMap)^[FFieldCount] := -1;
  Inc(FFieldCount);
end;

procedure TGridDataLinkEh.ActiveChanged;
begin
  FGrid.LinkActive(Active);
end;

procedure TGridDataLinkEh.ClearMapping;
begin
  if FFieldMap <> nil then
  begin
    FreeMem(FFieldMap, FFieldMapSize * SizeOf(Integer));
    FFieldMap := nil;
    FFieldMapSize := 0;
    FFieldCount := 0;
  end;
end;

procedure TGridDataLinkEh.Modified;
begin
  FModified := True;
end;

procedure TGridDataLinkEh.DataSetChanged;
begin
  FGrid.DataChanged;
  FModified := False;
end;

procedure TGridDataLinkEh.DataSetScrolled(Distance: Integer);
begin
  FGrid.Scroll(Distance);
end;

procedure TGridDataLinkEh.LayoutChanged;
var
  SaveState: Boolean;
begin
  { FLayoutFromDataset determines whether default column width is forced to
    be at least wide enough for the column title.  }
  SaveState := FGrid.FLayoutFromDataset;
  FGrid.FLayoutFromDataset := True;
  try
    FGrid.LayoutChanged;
  finally
    FGrid.FLayoutFromDataset := SaveState;
  end;
  inherited LayoutChanged;
end;

procedure TGridDataLinkEh.FocusControl(Field: TFieldRef);
begin
  if Assigned(Field) and Assigned(Field^) then
  begin
    FGrid.SelectedField := Field^;
    if (FGrid.SelectedField = Field^) and FGrid.AcquireFocus then
    begin
      Field^ := nil;
      FGrid.ShowEditor;
    end;
  end;
end;

procedure TGridDataLinkEh.EditingChanged;
begin
  FGrid.EditingChanged;
end;

procedure TGridDataLinkEh.RecordChanged(Field: TField);
begin
  FGrid.RecordChanged(Field);
  FModified := False;
end;

procedure TGridDataLinkEh.UpdateData;
begin
  FInUpdateData := True;
  try
    if FModified then FGrid.UpdateData;
    FModified := False;
  finally
    FInUpdateData := False;
  end;
end;

function TGridDataLinkEh.GetMappedIndex(ColIndex: Integer): Integer;
begin
  if (0 <= ColIndex) and (ColIndex < FFieldCount) then
    Result := PIntArray(FFieldMap)^[ColIndex]
  else
    Result := -1;
end;

procedure TGridDataLinkEh.Reset;
begin
  if FModified then RecordChanged(nil) else Dataset.Cancel;
end;


{ TColumnTitleEh }
constructor TColumnTitleEh.Create(Column: TColumnEh);
begin
  inherited Create;
  FColumn := Column;
  FFont := TFont.Create;
  FFont.Assign(DefaultFont);
  FFont.OnChange := FontChanged;
  //ddd
  FTitleButton := False;
  SortMarker := smNoneEh;
  //\\\
end;

destructor TColumnTitleEh.Destroy;
begin
  FFont.Free;
  inherited Destroy;
end;

procedure TColumnTitleEh.Assign(Source: TPersistent);
begin
  if Source is TColumnTitleEh then
  begin
    if cvTitleAlignment in TColumnTitleEh(Source).FColumn.FAssignedValues then
      Alignment := TColumnTitleEh(Source).Alignment;
    if cvTitleColor in TColumnTitleEh(Source).FColumn.FAssignedValues then
      Color := TColumnTitleEh(Source).Color;
    if cvTitleCaption in TColumnTitleEh(Source).FColumn.FAssignedValues then
      Caption := TColumnTitleEh(Source).Caption;
    if cvTitleFont in TColumnTitleEh(Source).FColumn.FAssignedValues then
      Font := TColumnTitleEh(Source).Font;
    //ddd
    TitleButton := TColumnTitleEh(Source).TitleButton;
    SortMarker := TColumnTitleEh(Source).SortMarker;
    EndEllipsis := TColumnTitleEh(Source).EndEllipsis;
    //\\\
  end
  else
    inherited Assign(Source);
end;

function TColumnTitleEh.DefaultAlignment: TAlignment;
begin
  Result := taLeftJustify;
end;

function TColumnTitleEh.DefaultColor: TColor;
var
  Grid: TCustomDBGridEh;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) then
    Result := Grid.FixedColor
  else
    Result := clBtnFace;
end;

function TColumnTitleEh.DefaultFont: TFont;
var
  Grid: TCustomDBGridEh;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) then
    Result := Grid.TitleFont
  else
    Result := FColumn.Font;
end;

function TColumnTitleEh.DefaultCaption: string;
var
  Field: TField;
begin
  Field := FColumn.Field;
  if Assigned(Field) then
    Result := Field.DisplayName
  else
    Result := FColumn.FieldName;
end;

procedure TColumnTitleEh.FontChanged(Sender: TObject);
begin
  Include(FColumn.FAssignedValues, cvTitleFont);
  FColumn.Changed(True);
end;

function TColumnTitleEh.GetAlignment: TAlignment;
begin
  if cvTitleAlignment in FColumn.FAssignedValues then
    Result := FAlignment
  else
    Result := DefaultAlignment;
end;

function TColumnTitleEh.GetColor: TColor;
begin
  if cvTitleColor in FColumn.FAssignedValues then
    Result := FColor
  else
    Result := DefaultColor;
end;

function TColumnTitleEh.GetCaption: string;
begin
  if cvTitleCaption in FColumn.FAssignedValues then
    Result := FCaption
  else
    Result := DefaultCaption;
end;

function TColumnTitleEh.GetFont: TFont;
var
  Save: TNotifyEvent;
  Def: TFont;
begin
  if not (cvTitleFont in FColumn.FAssignedValues) then
  begin
    Def := DefaultFont;
    if (FFont.Handle <> Def.Handle) or (FFont.Color <> Def.Color) then
    begin
      Save := FFont.OnChange;
      FFont.OnChange := nil;
      FFont.Assign(DefaultFont);
      FFont.OnChange := Save;
    end;
  end;
  Result := FFont;
end;

function TColumnTitleEh.IsAlignmentStored: Boolean;
begin
  Result := (cvTitleAlignment in FColumn.FAssignedValues) and
    (FAlignment <> DefaultAlignment);
end;

function TColumnTitleEh.IsColorStored: Boolean;
begin
  Result := (cvTitleColor in FColumn.FAssignedValues) and
    (FColor <> DefaultColor);
end;

function TColumnTitleEh.IsFontStored: Boolean;
begin
  Result := (cvTitleFont in FColumn.FAssignedValues);
end;

function TColumnTitleEh.IsCaptionStored: Boolean;
begin
  Result := (cvTitleCaption in FColumn.FAssignedValues) and
    (FCaption <> DefaultCaption);
end;

procedure TColumnTitleEh.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if (cvTitleFont in FColumn.FAssignedValues) then Exit;
  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
  finally
    FFont.OnChange := Save;
  end;
end;

procedure TColumnTitleEh.RestoreDefaults;
var
  FontAssigned: Boolean;
begin
  FontAssigned := cvTitleFont in FColumn.FAssignedValues;
  FColumn.FAssignedValues := FColumn.FAssignedValues - ColumnEhTitleValues;
  FCaption := '';
  RefreshDefaultFont;
  { If font was assigned, changing it back to default may affect grid title
    height, and title height changes require layout and redraw of the grid. }
  FColumn.Changed(FontAssigned);
end;

procedure TColumnTitleEh.SetAlignment(Value: TAlignment);
begin
  if (cvTitleAlignment in FColumn.FAssignedValues) and (Value = FAlignment) then Exit;
  FAlignment := Value;
  Include(FColumn.FAssignedValues, cvTitleAlignment);
  FColumn.Changed(False);
end;

procedure TColumnTitleEh.SetColor(Value: TColor);
begin
  if (cvTitleColor in FColumn.FAssignedValues) and (Value = FColor) then Exit;
  FColor := Value;
  Include(FColumn.FAssignedValues, cvTitleColor);
  FColumn.Changed(False);
end;

procedure TColumnTitleEh.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TColumnTitleEh.SetCaption(const Value: string);
begin
  if (cvTitleCaption in FColumn.FAssignedValues) and (Value = FCaption) then Exit;
  FCaption := Value;
  Include(FColumn.FAssignedValues, cvTitleCaption);
  FColumn.Changed(False);
end;


procedure TColumnTitleEh.SetTitleButton(Value: Boolean);
begin
  if (Value = FTitleButton) then Exit;
  FTitleButton := Value;
  FColumn.Changed(False);
end;

procedure TColumnTitleEh.SetEndEllipsis(const Value: Boolean);
begin
  FEndEllipsis := Value;
  FColumn.Changed(False);
end;

procedure TColumnTitleEh.SetSortMarker(Value: TSortMarkerEh);
var AColumns: TDBGridColumnsEh;
    i, ASortIndex: Integer;
    Grid: TCustomDBGridEh;
begin
  if (Value = FSortMarker) then Exit;
  FSortMarker := Value;
  Grid := FColumn.GetGrid;
  if Assigned(Grid) and (csLoading in Grid.ComponentState) then Exit;
  AColumns := TDBGridColumnsEh(FColumn.Collection);
  if not (dghMultiSortMarking in Grid.OptionsEh) then begin
    if FSortMarker = smNoneEh then begin
      FSortIndex := 0;
      Grid.FSortMarkedColumns.Clear;
    end
    else begin
      for i := 0 to AColumns.Count-1 do
        if (AColumns[i].Title.SortMarker <> smNoneEh) and (AColumns[i] <> FColumn) then
         AColumns[i].Title.SortMarker := smNoneEh;
      FSortIndex := 1;
      Grid.FSortMarkedColumns.Clear;
      Grid.FSortMarkedColumns.Add(FColumn);
    end;
  end else
  if (FSortMarker <> smNoneEh) and (SortIndex = 0) then begin
    ASortIndex := 1;
    for i := 0 to AColumns.Count-1 do
      if AColumns[i].Title.SortIndex <> 0 then Inc(ASortIndex);
    FSortIndex := ASortIndex;
    Grid.FSortMarkedColumns.Add(FColumn);
  end else
  if (FSortMarker = smNoneEh) and (SortIndex <> 0) then begin
    for i := 0 to AColumns.Count-1 do
      if AColumns[i].Title.SortIndex > SortIndex then Dec(AColumns[i].Title.FSortIndex);
    Grid.FSortMarkedColumns.Remove(FColumn);
    FSortIndex := 0;
  end;
  FColumn.Changed(False);
end;

procedure TColumnTitleEh.SetSortIndex(Value: Integer);
var AColumns: TDBGridColumnsEh;
    i: Integer;
begin
  if (Value < 0) then Value := 0;
  if (Value = FSortIndex) or (SortMarker = smNoneEh) then Exit;
  if (FColumn.GetGrid <> nil) and (csLoading in FColumn.GetGrid.ComponentState) then
  begin
    FSortIndex := Value;
    Exit;
  end;
  AColumns := TDBGridColumnsEh(FColumn.Collection);
  for i := 0 to AColumns.Count-1 do begin
    if (AColumns[i].Title.SortIndex <> 0) and
       (AColumns[i].Title.SortIndex = Value) and (AColumns[i] <> FColumn) then
    begin
      AColumns[i].Title.FSortIndex := FSortIndex;
      FSortIndex := Value;
      with  FColumn.GetGrid.FSortMarkedColumns do
       Exchange(IndexOf(AColumns[i]),IndexOf(FColumn));
      FColumn.Changed(False);
      Exit;
    end;
  end;
end;

procedure TColumnTitleEh.SetNextSortMarkerValue(KeepMulti:Boolean);
var
  Grid: TCustomDBGridEh;
  i: Integer;
begin
  if not KeepMulti then begin
    Grid := FColumn.GetGrid;
    for i := 0 to Grid.Columns.Count-1 do
      if (Grid.Columns[i].Title.SortMarker <> smNoneEh) and (Grid.Columns[i] <>FColumn) then
        Grid.Columns[i].Title.SortMarker := smNoneEh;
  end;
  case SortMarker of
    smNoneEh: SortMarker := smDownEh;
    smDownEh: SortMarker := smUpEh;
    smUpEh: SortMarker := smNoneEh;
  end;
end;

{ TColumnEh }

constructor TColumnEh.Create(Collection: TCollection);
var
  Grid: TCustomDBGridEh;
begin
  Grid := nil;
  if Assigned(Collection) and (Collection is TDBGridColumnsEh) then
    Grid := TDBGridColumnsEh(Collection).Grid;
  if Assigned(Grid) then
    Grid.BeginLayout;
  try
    inherited Create(Collection);
    FDropDownRows := 7;
    FButtonStyle := cbsAuto;
    FFont := TFont.Create;
    FFont.Assign(DefaultFont);
    FFont.OnChange := FontChanged;
    FImeMode := imDontCare;
    FImeName := Screen.DefaultIme;
    FTitle := CreateTitle;
    //ddd
    FFooter := CreateFooter;
    FAutoFitColWidth := True;
    FInitWidth := Width;
    FVisible := True;
    FNotInKeyListIndex := -1;
    FIncrement := 1.0;
    //\\\
  finally
    if Assigned(Grid) then
      Grid.EndLayout;
  end;
end;

destructor TColumnEh.Destroy;
begin
  FTitle.Free;
  FFont.Free;
  FPickList.Free;
  //ddd
  FFooter.Free;
  FKeyList.Free;
  if FDBSum <> nil then FDBSum.Free;
  //\\\
  inherited Destroy;
end;

procedure TColumnEh.Assign(Source: TPersistent);
begin
  if Source is TColumnEh then
  begin
    if Assigned(Collection) then Collection.BeginUpdate;
    try
      RestoreDefaults;
      FieldName := TColumnEh(Source).FieldName;
      if cvColor in TColumnEh(Source).AssignedValues then
        Color := TColumnEh(Source).Color;
      if cvWidth in TColumnEh(Source).AssignedValues then
        Width := TColumnEh(Source).Width;
      if cvFont in TColumnEh(Source).AssignedValues then
        Font := TColumnEh(Source).Font;
      if cvImeMode in TColumnEh(Source).AssignedValues then
        ImeMode := TColumnEh(Source).ImeMode;
      if cvImeName in TColumnEh(Source).AssignedValues then
        ImeName := TColumnEh(Source).ImeName;
      if cvAlignment in TColumnEh(Source).AssignedValues then
        Alignment := TColumnEh(Source).Alignment;
      if cvReadOnly in TColumnEh(Source).AssignedValues then
        ReadOnly := TColumnEh(Source).ReadOnly;
      Title := TColumnEh(Source).Title;
      DropDownRows := TColumnEh(Source).DropDownRows;
      ButtonStyle := TColumnEh(Source).ButtonStyle;
      PickList := TColumnEh(Source).PickList;
      PopupMenu := TColumnEh(Source).PopupMenu;
      //ddd
      FInitWidth := TColumnEh(Source).FInitWidth;
      AutoFitColWidth := TColumnEh(Source).AutoFitColWidth;
      if cvWordWrap in TColumnEh(Source).AssignedValues then
        WordWrap := TColumnEh(Source).WordWrap;
      EndEllipsis := TColumnEh(Source).EndEllipsis;
      DropDownWidth := TColumnEh(Source).DropDownWidth;
      if cvLookupDisplayFields in TColumnEh(Source).AssignedValues then
        LookupDisplayFields := TColumnEh(Source).LookupDisplayFields;
      AutoDropDown := TColumnEh(Source).AutoDropDown;
      AlwaysShowEditButton := TColumnEh(Source).AlwaysShowEditButton;
      WordWrap := TColumnEh(Source).WordWrap;
      Footer := TColumnEh(Source).Footer;
      KeyList := TColumnEh(Source).KeyList;
      if cvCheckboxes in TColumnEh(Source).AssignedValues then
        Checkboxes := TColumnEh(Source).Checkboxes;
      Increment := TColumnEh(Source).Increment;
      //\\\
    finally
      if Assigned(Collection) then Collection.EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

function TColumnEh.CreateTitle: TColumnTitleEh;
begin
  Result := TColumnTitleEh.Create(Self);
end;

function TColumnEh.DefaultAlignment: TAlignment;
begin
  if Assigned(Field) then
    Result := FField.Alignment
  else
    Result := taLeftJustify;
end;

function TColumnEh.DefaultColor: TColor;
var
  Grid: TCustomDBGridEh;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.Color
  else
    Result := clWindow;
end;

function TColumnEh.DefaultFont: TFont;
var
  Grid: TCustomDBGridEh;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.Font
  else
    Result := FFont;
end;

function TColumnEh.DefaultImeMode: TImeMode;
var
  Grid: TCustomDBGridEh;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.ImeMode
  else
    Result := FImeMode;
end;

function TColumnEh.DefaultImeName: TImeName;
var
  Grid: TCustomDBGridEh;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.ImeName
  else
    Result := FImeName;
end;

function TColumnEh.DefaultReadOnly: Boolean;
var
  Grid: TCustomDBGridEh;
begin
  Grid := GetGrid;
  Result := (Assigned(Grid) and Grid.ReadOnly) or (Assigned(Field) and FField.ReadOnly);
end;

function TColumnEh.DefaultWidth: Integer;
var
//  W: Integer;
  RestoreCanvas: Boolean;
  TM: TTextMetric;
begin
  if GetGrid = nil then
  begin
    Result := 64;
    Exit;
  end;
  with GetGrid do
  begin
    if Assigned(Field) then
    begin
      RestoreCanvas := not HandleAllocated;
      if RestoreCanvas then
        Canvas.Handle := GetDC(0);
      try
        Canvas.Font := Self.Font;
        GetTextMetrics(Canvas.Handle, TM);
        Result := Field.DisplayWidth * (Canvas.TextWidth('0') - TM.tmOverhang)
          + TM.tmOverhang + 4;
        {if dgTitles in Options then  //ddd
        begin
          Canvas.Font := Title.Font;
          W := Canvas.TextWidth(Title.Caption) + 4;
          if Result < W then
            Result := W;
        end;}                       //\\\
      finally
        if RestoreCanvas then
        begin
          ReleaseDC(0,Canvas.Handle);
          Canvas.Handle := 0;
        end;
      end;
    end
    else
      Result := DefaultColWidth;
  end;
end;

procedure TColumnEh.FontChanged;
begin
  Include(FAssignedValues, cvFont);
  Title.RefreshDefaultFont;
  Changed(False);
end;

function TColumnEh.GetAlignment: TAlignment;
begin
  if cvAlignment in FAssignedValues then
    Result := FAlignment
  else
    Result := DefaultAlignment;
end;

function TColumnEh.GetColor: TColor;
begin
  if cvColor in FAssignedValues then
    Result := FColor
  else
    Result := DefaultColor;
end;

function TColumnEh.GetField: TField;
var
  Grid: TCustomDBGridEh;
begin    { Returns Nil if FieldName can't be found in dataset }
  Grid := GetGrid;
  if (FField = nil) and (Length(FFieldName) > 0) and Assigned(Grid) and
    Assigned(Grid.DataLink.DataSet) then
  with Grid.Datalink.Dataset do
    if Active or (not DefaultFields) then begin //ddd
      // SetField(FindField(FieldName));
      if FField <> FindField(FieldName) then begin
        FField := FindField(FieldName);
        if Assigned(FindField(FieldName)) then
          FFieldName := FindField(FieldName).FieldName;
        EnsureSumValue;
      end;
      //\\ ddd
    end;
  Result := FField;
end;

function TColumnEh.GetFont: TFont;
var
  Save: TNotifyEvent;
begin
  if not (cvFont in FAssignedValues) and (FFont.Handle <> DefaultFont.Handle) then
  begin
    Save := FFont.OnChange;
    FFont.OnChange := nil;
    FFont.Assign(DefaultFont);
    FFont.OnChange := Save;
  end;
  Result := FFont;
end;

function TColumnEh.GetGrid: TCustomDBGridEh;
begin
  if Assigned(Collection) and (Collection is TDBGridColumnsEh) then
    Result := TDBGridColumnsEh(Collection).Grid
  else
    Result := nil;
end;

function TColumnEh.GetDisplayName: string;
begin
  Result := FFieldName;
  if Result = '' then Result := inherited GetDisplayName;
end;

function TColumnEh.GetImeMode: TImeMode;
begin
  if cvImeMode in FAssignedValues then
    Result := FImeMode
  else
    Result := DefaultImeMode;
end;

function TColumnEh.GetImeName: TImeName;
begin
  if cvImeName in FAssignedValues then
    Result := FImeName
  else
    Result := DefaultImeName;
end;

function TColumnEh.GetPickList: TStrings;
begin
  if FPickList = nil then
    FPickList := TStringList.Create;
  Result := FPickList;
end;

function TColumnEh.GetReadOnly: Boolean;
begin
  if cvReadOnly in FAssignedValues then
    Result := FReadOnly
  else
    Result := DefaultReadOnly;
end;

function TColumnEh.GetWidth: Integer;
begin
  {//ddd
  if not Visible then
    Result := -1
  else
  //}
  if cvWidth in FAssignedValues then
    Result := FWidth
  else
    Result := DefaultWidth;
(*  //ddd
  if Assigned(Grid) and (Grid.AutoFitColWidths = True) and
    (csWriting in Grid.ComponentState) {and (AutoFitColWidth = True)} then begin
    // Подсуним реальный Width
    Result := FInitWidth;
   //\\\

  end;*)
end;

function TColumnEh.IsAlignmentStored: Boolean;
begin
  Result := (cvAlignment in FAssignedValues) and (FAlignment <> DefaultAlignment);
end;

function TColumnEh.IsColorStored: Boolean;
begin
  Result := (cvColor in FAssignedValues) and (FColor <> DefaultColor);
end;

function TColumnEh.IsFontStored: Boolean;
begin
  Result := (cvFont in FAssignedValues);
end;

function TColumnEh.IsImeModeStored: Boolean;
begin
  Result := (cvImeMode in FAssignedValues) and (FImeMode <> DefaultImeMode);
end;

function TColumnEh.IsImeNameStored: Boolean;
begin
  Result := (cvImeName in FAssignedValues) and (FImeName <> DefaultImeName);
end;

function TColumnEh.IsReadOnlyStored: Boolean;
begin
  Result := (cvReadOnly in FAssignedValues) and (FReadOnly <> DefaultReadOnly);
end;

function TColumnEh.IsWidthStored: Boolean;
begin
  Result := (cvWidth in FAssignedValues) and (FWidth <> DefaultWidth);
end;

procedure TColumnEh.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if cvFont in FAssignedValues then Exit;
  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
  finally
    FFont.OnChange := Save;
  end;
end;

procedure TColumnEh.RestoreDefaults;
var
  FontAssigned: Boolean;
begin
  FontAssigned := cvFont in FAssignedValues;
  FTitle.RestoreDefaults;
  FAssignedValues := [];
  RefreshDefaultFont;
  FPickList.Free;
  FPickList := nil;
  ButtonStyle := cbsAuto;
  Changed(FontAssigned);
  //ddd
//  FInitWidth := Width;
  FKeyList.Free;
  FKeyList := nil;
  //\\\
end;

procedure TColumnEh.SetAlignment(Value: TAlignment);
begin
  if (cvAlignment in FAssignedValues) and (Value = FAlignment) then Exit;
  FAlignment := Value;
  Include(FAssignedValues, cvAlignment);
  Changed(False);
end;

procedure TColumnEh.SetButtonStyle(Value: TColumnButtonStyleEh);
begin
  if Value = FButtonStyle then Exit;
  FButtonStyle := Value;
  Changed(False);
end;

procedure TColumnEh.SetColor(Value: TColor);
begin
  if (cvColor in FAssignedValues) and (Value = FColor) then Exit;
  FColor := Value;
  Include(FAssignedValues, cvColor);
  Changed(False);
end;

procedure TColumnEh.SetField(Value: TField);
begin
  if FField = Value then Exit;
  FField := Value;
  if Assigned(Value) then
    FFieldName := Value.FieldName;
  {ddd} EnsureSumValue;
  Changed(False);
end;

procedure TColumnEh.SetFieldName(const Value: String);
var
  AField: TField;
  Grid: TCustomDBGridEh;
begin
  AField := nil;
  Grid := GetGrid;
  if Assigned(Grid) and Assigned(Grid.DataLink.DataSet) and
    not (csLoading in Grid.ComponentState) and (Length(Value) > 0) then
      AField := Grid.DataLink.DataSet.FindField(Value); { no exceptions }
  FFieldName := Value;
  SetField(AField);
  //ddd
  FInitWidth := Width;
  //\\\
  Changed(False);
end;

procedure TColumnEh.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
  Include(FAssignedValues, cvFont);
  Changed(False);
end;

procedure TColumnEh.SetImeMode(Value: TImeMode);
begin
  if (cvImeMode in FAssignedValues) or (Value <> DefaultImeMode) then
  begin
    FImeMode := Value;
    Include(FAssignedValues, cvImeMode);
  end;
  Changed(False);
end;

procedure TColumnEh.SetImeName(Value: TImeName);
begin
  if (cvImeName in FAssignedValues) or (Value <> DefaultImeName) then
  begin
    FImeName := Value;
    Include(FAssignedValues, cvImeName);
  end;
  Changed(False);
end;

procedure TColumnEh.SetPickList(Value: TStrings);
begin
  if Value = nil then
  begin
    FPickList.Free;
    FPickList := nil;
    Exit;
  end;
  PickList.Assign(Value);
end;

procedure TColumnEh.SetPopupMenu(Value: TPopupMenu);
begin
  FPopupMenu := Value;
  if Value <> nil then Value.FreeNotification(GetGrid);
end;

procedure TColumnEh.SetReadOnly(Value: Boolean);
begin
  if (cvReadOnly in FAssignedValues) and (Value = FReadOnly) then Exit;
  FReadOnly := Value;
  Include(FAssignedValues, cvReadOnly);
  Changed(False);
end;

procedure TColumnEh.SetTitle(Value: TColumnTitleEh);
begin
  FTitle.Assign(Value);
end;

procedure TColumnEh.SetWidth(Value: Integer);
begin
  if (cvWidth in FAssignedValues) or (Value <> DefaultWidth) then
  begin
    FWidth := Value;
    Include(FAssignedValues, cvWidth);
    if (MaxWidth > 0) and (FWidth > MaxWidth) then FWidth := MaxWidth;
    if (FWidth < MinWidth) then FWidth := MinWidth;
  end;
  //ddd
//  if (AutoFitColWidth = False) then FInitWidth := Width;
  //\\\
  Changed(False);
end;

//ddd

function TColumnEh.GetAutoFitColWidth: Boolean;
begin
  Result := FAutoFitColWidth;
end;

procedure TColumnEh.SetAutoFitColWidth(Value: Boolean);
begin
  FAutoFitColWidth := Value;
  if Assigned(Grid) and (Grid.AutoFitColWidths = True) and
    not (csLoading in Grid.ComponentState) and not (csDesigning	in Grid.ComponentState) then Width := FInitWidth;
  Changed(False);
end;

procedure TColumnEh.SetAlwaysShowEditButton(Value: Boolean);
begin
  if (FAlwaysShowEditButton = Value) then Exit;
  FAlwaysShowEditButton := Value;
  Changed(False);
end;

//---- WordWrap
procedure TColumnEh.SetWordWrap(Value: Boolean);
begin
  if (cvWordWrap in FAssignedValues) or (Value <> DefaultWordWrap) or
       (Assigned(Grid) and (csLoading in Grid.ComponentState)) then
  begin
    FWordWrap := Value;
    Include(FAssignedValues, cvWordWrap);
  end;
  Changed(False);
end;

function  TColumnEh.GetWordWrap: Boolean;
begin
  if cvWordWrap in FAssignedValues then
    Result := FWordWrap
  else
    Result := DefaultWordWrap;
end;

function  TColumnEh.IsWordWrapStored: Boolean;
begin
  Result := (cvWordWrap in FAssignedValues) and (FWordWrap <> DefaultWordWrap);
end;

function TColumnEh.DefaultWordWrap: Boolean;
begin
  if GetGrid = nil then
  begin
    Result := False;
    Exit;
  end;
  with GetGrid do
  begin
    if Assigned(Field) then
    begin
      case Field.DataType of
        ftString,ftMemo,ftFmtMemo: Result := True;
      else
        Result := False;
      end;
    end
    else Result := False;
  end;
end;

procedure TColumnEh.SetEndEllipsis(const Value: Boolean);
begin
  FEndEllipsis := Value;
  Changed(False);
end;

procedure TColumnEh.SetDropDownWidth(Value: Integer);
begin
  if (Value = FDropDownWidth) then Exit;
  FDropDownWidth := Value;
  Changed(False);
end;

function TColumnEh.DefaultLookupDisplayFields: String;
begin
  if Assigned(Field) then
    Result := FField.LookupResultField
  else
    Result := '';
end;

function TColumnEh.GetLookupDisplayFields: String;
begin
  if cvLookupDisplayFields in FAssignedValues then
    Result := FLookupDisplayFields
  else
    Result := DefaultLookupDisplayFields;
end;

procedure TColumnEh.SetLookupDisplayFields(Value: String);
begin
  if (cvLookupDisplayFields in FAssignedValues) or (Value <> DefaultLookupDisplayFields) then
  begin
    FLookupDisplayFields := Value;
    Include(FAssignedValues, cvLookupDisplayFields);
  end;
  Changed(False);
end;

function TColumnEh.IsLookupDisplayFieldsStored: Boolean;
begin
  Result := (cvLookupDisplayFields in FAssignedValues) and (FLookupDisplayFields <> DefaultLookupDisplayFields);
end;

procedure TColumnEh.SetAutoDropDown(Value: Boolean);
begin
  if (Value = FAutoDropDown) then Exit;
  FAutoDropDown := Value;
  Changed(False);
end;

function TColumnEh.CreateFooter: TColumnFooterEh;
begin
  Result := TColumnFooterEh.Create(Self);
end;

//\\\

{ TPassthroughColumn }

type
  TPassthroughColumnTitle = class(TColumnTitleEh)
  private
    procedure SetCaption(const Value: string); override;
  end;

  TPassthroughColumn = class(TColumnEh)
  private
    procedure SetAlignment(Value: TAlignment); override;
    procedure SetField(Value: TField); override;
    procedure SetIndex(Value: Integer); override;
    procedure SetReadOnly(Value: Boolean); override;
    procedure SetWidth(Value: Integer); override;
    //ddd
//    procedure SetInitWidth(Value: Integer); override;
    //\\\
  protected
    function CreateTitle: TColumnTitleEh; override;
  end;


procedure TColumnEh.SetFooter(const Value: TColumnFooterEh);
begin
  FFooter.Assign(Value);
end;

procedure TColumnEh.SetVisible(const Value: Boolean);
begin
  if (Value = FVisible) then Exit;
  FVisible := Value;
  Changed(True);
end;

function TColumnEh.GetKeykList: TStrings;
begin
  if FKeyList = nil then
    FKeyList := TStringList.Create;
  Result := FKeyList;
end;

procedure TColumnEh.SetKeykList(const Value: TStrings);
begin
  if Value = nil then
  begin
    FKeyList.Free;
    FKeyList := nil;
    Exit;
  end;
  KeyList.Assign(Value);
  if GetGrid <> nil then GetGrid.Invalidate;
end;

function TColumnEh.GetColumnType: TColumnEhType;
begin
// ctCommon, ctPickList, ctLookupField, ctKeyPickList, ctKeyImageList
  Result := ctCommon;
  if Checkboxes
    then Result := ctCheckboxes
  else if Assigned(Field) and (Field.FieldKind = fkLookup)
    then Result := ctLookupField
  else if Assigned(FPickList) and (FPickList.Count > 0) and not (Assigned(FKeyList) and (FKeyList.Count > 0))
    then Result := ctPickList
  else if Assigned(FKeyList) and (FKeyList.Count > 0)
    then
      if Assigned(ImageList) then
        Result := ctKeyImageList
      else if Assigned(FPickList) then
        Result := ctKeyPickList;
end;

procedure TColumnEh.SetNotInKeyListIndex(const Value: Integer);
begin
  if (FNotInKeyListIndex = Value) then Exit;
  FNotInKeyListIndex := Value;
  if GetGrid <> nil then
    GetGrid.Invalidate;
end;

procedure TColumnEh.SetImageList(const Value: TImageList);
begin
  FImageList := Value;
  if GetGrid <> nil then
    GetGrid.Invalidate;
end;

procedure TColumnEh.SetNextFieldValue(Increment: Extended);
var CanEdit:Boolean;
    ki:Integer;
    AColType:TColumnEhType;
    AField:TField;
    AValue:Variant;
begin
  CanEdit := True;
  AField := nil;
  if Assigned(Grid) then
    CanEdit := CanEdit and  not Grid.ReadOnly
       and  Grid.FDatalink.Active and not Grid.FDatalink.ReadOnly;
  CanEdit := CanEdit and not ReadOnly;
  if Assigned(Field) then
   if (Field.FieldKind = fkLookUp) then begin
     CanEdit := CanEdit and (Field.KeyFields <> '');
     AField := Field.DataSet.FieldByName(Field.KeyFields);
   end else AField := Field
  else CanEdit := False;

  if CanEdit then
   CanEdit := CanEdit and AField.CanModify
    and (not AField.IsBlob or Assigned(AField.OnSetText));

  if CanEdit and Assigned(Grid) then begin
    Grid.FDatalink.Edit;
    CanEdit := Grid.FDatalink.Editing;
    if CanEdit then Grid.FDatalink.Modified;
  end;

  if not CanEdit then Exit;

  AColType := GetColumnType;
  if (AColType = ctCheckboxes) then
    if CheckboxState = cbChecked then CheckboxState := cbUnchecked
    else CheckboxState := cbChecked
  else if (AColType in [ctKeyPickList, ctKeyImageList]) then begin
    ki := KeyList.IndexOf(Field.Text);
    if ((ki = -1) or (ki = KeyList.Count-1)) and (Increment = 1) then
      Field.Text := KeyList.Strings[0]
    else if ((ki = -1) or (ki = 0)) and not (Increment = 1) then
      Field.Text := KeyList.Strings[KeyList.Count-1]
    else if (Increment = 1) then
      Field.Text := KeyList.Strings[ki+1]
    else
     Field.Text := KeyList.Strings[ki-1];
  end else if AColType = ctPickList then begin
    ki := PickList.IndexOf(Field.Text);
    if ((ki = -1) or (ki = PickList.Count-1)) and (Increment = 1) then Field.Text := PickList.Strings[0]
    else if ((ki = -1) or (ki = 0)) and not (Increment = 1) then Field.Text := PickList.Strings[PickList.Count-1]
    else if (Increment = 1) then
      Field.Text := PickList.Strings[ki+1]
    else
      Field.Text := PickList.Strings[ki-1];
  end else if AColType = ctLookupField then begin
    if AField.IsNull or
        not Field.LookupDataSet.Locate(Field.LookUpKeyFields, AField.AsString, []) then
      Field.LookupDataSet.First
    else if (Increment = 1) then
    begin //Go Forward
      if not Field.LookupDataSet.EOF then begin
        Field.LookupDataSet.Next;
        if Field.LookupDataSet.EOF then Field.LookupDataSet.First;
      end else
        Field.LookupDataSet.First;
    end else
    begin //Go Backward
      if not Field.LookupDataSet.BOF then begin
        Field.LookupDataSet.Prior;
        if Field.LookupDataSet.BOF then Field.LookupDataSet.Last;
      end else
        Field.LookupDataSet.Last;
    end;
    Field.DataSet.FieldByName(Field.KeyFields).Text := Field.LookupDataSet.FieldByName(Field.LookUpKeyFields).AsString;
    Field.Text := Field.LookupDataSet.FieldByName(Field.LookUpResultField).Text;
  end else if Field.DataType in [ftSmallint,ftInteger,ftWord,ftFloat,ftCurrency] then
  begin
    if Field.IsNull
      then AValue := -Increment
      else AValue := Field.Value;
    try
      Field.Value := AValue + Increment;
    except
      on EDatabaseError do ; //Noshow RangeError
      else
       raise;
    end;
  end;
{    if Field.IsNull
     then Field.Value := 0
     else Field.Value := Field.Value + Increment;}
{     else if (Increment = 1) then Field.Value := Field.Value + 1
     else Field.Value := Field.Value - 1;}
//  if Assigned(Grid) and Assigned(Grid.InplaceEditor) and  Grid.InplaceEditor.Visible then
//   GetGrid.InplaceEditor.SelectAll;
end;

procedure TColumnEh.SetMaxWidth(const Value: Integer);
begin
  FMaxWidth := Value;
  if (FMaxWidth > 0) and (Width > FMaxWidth) then
    Width := FMaxWidth;
end;

procedure TColumnEh.SetMinWidth(const Value: Integer);
begin
  FMinWidth := Value;
  if (FMinWidth > 0) and (Width < FMinWidth) then
    Width := FMinWidth;
end;

function TColumnEh.CanModify(TryEdit: Boolean): Boolean;
var AField:TField;
begin
  Result := True;
  AField := nil;
  if Assigned(Grid) then
    Result := Result and  not Grid.ReadOnly
       and  Grid.FDatalink.Active and not Grid.FDatalink.ReadOnly;
  Result := Result and not ReadOnly;
  if Assigned(Field) then
   if (Field.FieldKind = fkLookUp) then begin
     Result := Result and (Field.KeyFields <> '');
     AField := Field.DataSet.FieldByName(Field.KeyFields);
   end else AField := Field
  else Result := False;

  if Result then
   Result := Result and AField.CanModify
    and (not AField.IsBlob or Assigned(AField.OnSetText));

  if TryEdit and Result and Assigned(Grid) then begin
    Grid.FDatalink.Edit;
    Result := Grid.FDatalink.Editing;
    if Result then Grid.FDatalink.Modified;
  end;
end;

function TColumnEh.AllowableWidth(TryWidth: Integer): Integer;
begin
  Result := TryWidth;
  if (MaxWidth > 0) and (TryWidth > MaxWidth) then Result := MaxWidth;
  if (MinWidth > 0) and (TryWidth < MinWidth) then Result := MinWidth;
end;

function TColumnEh.DisplayText: String;
var KeyIndex:Integer;
begin
  Result := '';
  if not Assigned(Field) then Exit;
  if Assigned(KeyList)  and (KeyList.Count > 0) then begin
    KeyIndex := KeyList.IndexOf(Field.Text);
    if (KeyIndex > -1) and (KeyIndex < PickList.Count) then
      Result := PickList.Strings[KeyIndex]
    else if (NotInKeylistIndex >= 0) and (NotInKeylistIndex < PickList.Count) then
      Result := PickList.Strings[NotInKeylistIndex];
  end
  else if Assigned(Grid) and (Grid.DrawMemoText = True) and (Field.DataType = ftMemo) then
    Result := Field.AsString
  else
    Result := Field.DisplayText;
end;

procedure TColumnEh.EnsureSumValue;
begin
  if FDBSum = nil then begin
    if Footer.ValueType in [fvtSum..fvtCount] then begin
      Grid.FSumList.SumCollection.BeginUpdate;
      FDBSum := (Grid.FSumList.SumCollection.Add as TDBSum);
      case Footer.ValueType of
        fvtSum: begin
                  FDBSum.GroupOperation := goSum;
                  FDBSum.FieldName := FieldName;
                end;
        fvtCount: FDBSum.GroupOperation := goCount;
      end;
      Grid.FSumList.SumCollection.EndUpdate;
    end;
  end else begin
    case Footer.ValueType of
      fvtSum: begin
                FDBSum.GroupOperation := goSum;
                FDBSum.FieldName := FieldName;
              end;
      fvtCount: begin
                 FDBSum.GroupOperation := goCount;
                 FDBSum.FieldName := '';
                end;
    end;
  end;
end;

function TColumnEh.GetCheckboxes: Boolean;
begin
  if cvCheckboxes in FAssignedValues then
    Result := FCheckboxes
  else
    Result := DefaultCheckboxes;
end;

procedure TColumnEh.SetCheckboxes(const Value: Boolean);
begin
  if (cvCheckboxes in FAssignedValues) and (Value = FCheckboxes) then Exit;
  FCheckboxes := Value;
  Include(FAssignedValues, cvCheckboxes);
  Changed(False);
end;

function TColumnEh.DefaultCheckboxes: Boolean;
begin
  if Assigned(Field) and (Field.DataType = ftBoolean) then
    Result := True
  else Result := False;
end;

function TColumnEh.GetCheckboxState: TCheckBoxState;
var
  Text: string;

  function ValueMatch(const ValueList, Value: string): Boolean;
  var
    Pos: Integer;
  begin
    Result := False;
    Pos := 1;
    while Pos <= Length(ValueList) do
      if AnsiCompareText(ExtractFieldName(ValueList, Pos), Value) = 0 then
      begin
        Result := True;
        Break;
      end;
  end;
begin
  if Field <> nil then
    if Field.IsNull then
      Result := cbGrayed
    else if Field.DataType = ftBoolean then
      if Field.AsBoolean then
        Result := cbChecked
      else
        Result := cbUnchecked
    else
    begin
      Result := cbGrayed;
      Text := Field.Text;
      if (KeyList.Count > 0) and ValueMatch(KeyList[0], Text) then Result := cbChecked
      else if (KeyList.Count > 1) and ValueMatch(KeyList[1], Text) then Result := cbUnchecked;
    end
  else
    Result := cbUnchecked;
end;

procedure TColumnEh.SetCheckboxState(const Value: TCheckBoxState);
var S:String;
    Pos:Integer;
begin
  if not Assigned(Field) then Exit;
  if Value = cbGrayed then
    Field.Clear
  else
    if (Field.DataType = ftBoolean) then
      if Value = cbChecked then Field.AsBoolean := True else Field.AsBoolean := False
    else
    begin
      if Value = cbChecked then
        if KeyList.Count > 0 then S := KeyList[0] else S := ''
      else
        if KeyList.Count > 1 then S := KeyList[1] else S := '';
      Pos := 1;
      Field.Text := ExtractFieldName(S, Pos);
    end;
end;

function TColumnEh.IsCheckboxesStored: Boolean;
begin
  Result := (cvCheckboxes in FAssignedValues);
end;

function TColumnEh.IsIncrementStored: Boolean;
begin
  Result := FIncrement <> 1.0;
end;

{ TPassthroughColumnTitle }

procedure TPassthroughColumnTitle.SetCaption(const Value: string);
var
  Grid: TCustomDBGridEh;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) and (Grid.Datalink.Active) and Assigned(FColumn.Field) then
    FColumn.Field.DisplayLabel := Value
  else
    inherited SetCaption(Value);
end;


{ TPassthroughColumn }

function TPassthroughColumn.CreateTitle: TColumnTitleEh;
begin
  Result := TPassthroughColumnTitle.Create(Self);
end;

procedure TPassthroughColumn.SetAlignment(Value: TAlignment);
var
  Grid: TCustomDBGridEh;
begin
  Grid := GetGrid;
  if Assigned(Grid) and (Grid.Datalink.Active) and Assigned(Field) then
    Field.Alignment := Value
  else
    inherited SetAlignment(Value);
end;

procedure TPassthroughColumn.SetField(Value: TField);
begin
  inherited SetField(Value);
  if Value = nil then
    FFieldName := '';
  RestoreDefaults;
  //ddd
  FInitWidth := Width;
  //\\\

end;

procedure TPassthroughColumn.SetIndex(Value: Integer);
var
  Grid: TCustomDBGridEh;
  Fld: TField;
begin
  Grid := GetGrid;
  if Assigned(Grid) and Grid.Datalink.Active then
  begin
    Fld := Grid.Datalink.Fields[Value];
    if Assigned(Fld) then
      Field.Index := Fld.Index;
  end;
  inherited SetIndex(Value);
end;

procedure TPassthroughColumn.SetReadOnly(Value: Boolean);
var
  Grid: TCustomDBGridEh;
begin
  Grid := GetGrid;
  if Assigned(Grid) and Grid.Datalink.Active and Assigned(Field) then
    Field.ReadOnly := Value
  else
    inherited SetReadOnly(Value);
end;

procedure TPassthroughColumn.SetWidth(Value: Integer);
var
  Grid: TCustomDBGridEh;
  TM: TTextMetric;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
  begin
    if Grid.HandleAllocated and Assigned(Field) and Grid.FUpdateFields then
    with Grid do
    begin
      Canvas.Font := Self.Font;
      GetTextMetrics(Canvas.Handle, TM);
      Field.DisplayWidth := (Value + (TM.tmAveCharWidth div 2) - TM.tmOverhang - 3)
        div {VCL BUG TM.tmAveCharWidth} Canvas.TextWidth('0');
    end;
    if (not Grid.FLayoutFromDataset) or (cvWidth in FAssignedValues) then
      inherited SetWidth(Value);
  end
  else
    inherited SetWidth(Value);
end;

{ TDBGridColumnsEh }

constructor TDBGridColumnsEh.Create(Grid: TCustomDBGridEh; ColumnClass: TColumnEhClass);
begin
  inherited Create(ColumnClass);
  FGrid := Grid;
end;

function TDBGridColumnsEh.Add: TColumnEh;
begin
  Result := TColumnEh(inherited Add);
end;

function TDBGridColumnsEh.GetColumn(Index: Integer): TColumnEh;
begin
  Result := TColumnEh(inherited Items[Index]);
end;

function TDBGridColumnsEh.GetOwner: TPersistent;
begin
  Result := FGrid;
end;

function TDBGridColumnsEh.GetState: TDBGridColumnsState;
begin
  Result := TDBGridColumnsState((Count > 0) and not (Items[0] is TPassthroughColumn));
end;

procedure TDBGridColumnsEh.LoadFromFile(const Filename: string);
var
  S: TFileStream;
begin
  S := TFileStream.Create(Filename, fmOpenRead);
  try
    LoadFromStream(S);
  finally
    S.Free;
  end;
end;

type
  TColumnsWrapper = class(TComponent)
  private
    FColumns: TDBGridColumnsEh;
  published
    property Columns: TDBGridColumnsEh read FColumns write FColumns;
  end;

procedure TDBGridColumnsEh.LoadFromStream(S: TStream);
var
  Wrapper: TColumnsWrapper;
begin
  Wrapper := TColumnsWrapper.Create(nil);
  try
    Wrapper.Columns := FGrid.CreateColumns;
    S.ReadComponent(Wrapper);
    Assign(Wrapper.Columns);
  finally
    Wrapper.Columns.Free;
    Wrapper.Free;
  end;
end;

procedure TDBGridColumnsEh.RestoreDefaults;
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to Count-1 do
      Items[I].RestoreDefaults;
  finally
    EndUpdate;
  end;
end;

procedure TDBGridColumnsEh.RebuildColumns;
var
  I: Integer;
begin
  if Assigned(FGrid) and Assigned(FGrid.DataSource) and
    Assigned(FGrid.Datasource.Dataset) then
  begin
    FGrid.BeginLayout;
    try
      Clear;
      with FGrid.Datasource.Dataset do
        for I := 0 to FieldCount-1 do
          Add.FieldName := Fields[I].FieldName
    finally
      FGrid.EndLayout;
    end
  end
  else
    Clear;
end;

procedure TDBGridColumnsEh.SaveToFile(const Filename: string);
var
  S: TStream;
begin
  S := TFileStream.Create(Filename, fmCreate);
  try
    SaveToStream(S);
  finally
    S.Free;
  end;
end;

procedure TDBGridColumnsEh.SaveToStream(S: TStream);
var
  Wrapper: TColumnsWrapper;
begin
  Wrapper := TColumnsWrapper.Create(nil);
  try
    Wrapper.Columns := Self;
    S.WriteComponent(Wrapper);
  finally
    Wrapper.Free;
  end;
end;

procedure TDBGridColumnsEh.SetColumn(Index: Integer; Value: TColumnEh);
begin
  Items[Index].Assign(Value);
end;

procedure TDBGridColumnsEh.SetState(NewState: TDBGridColumnsState);
begin
  if NewState = State then Exit;
  if NewState = csDefault then
    Clear
  else
    RebuildColumns;
end;

procedure TDBGridColumnsEh.Update(Item: TCollectionItem);
var
  Raw: Integer;
  //ddd
  OldWidth: Integer;
  //\\\
begin
  if (FGrid = nil) or (csLoading in FGrid.ComponentState) then Exit;
  if (Item = nil) then
  begin
    FGrid.LayoutChanged;
  end
  else
  begin
    Raw := FGrid.DataToRawColumn(Item.Index);
    FGrid.InvalidateCol(Raw);
    //ddd
    //FGrid.ColWidths[Raw] := TColumnEh(Item).Width;
    if (FGrid.AutoFitColWidths = False) or (csDesigning in FGrid.ComponentState) then begin
       //dddFGrid.ColWidths[Raw] := TColumnEh(Item).Width;
       if (FGrid.ColWidths[Raw] <> TColumnEh(Item).Width) then
         FGrid.ColWidths[Raw] := iif(TColumnEh(Item).Visible,TColumnEh(Item).Width,iif(dgColLines in FGrid.Options,-1,0))
       else if (FGrid.UseMultiTitle = True) {and not (csDesigning in FGrid.ComponentState)} then
          FGrid.LayoutChanged; // If Title.Caption was changed
    end else if FGrid.ColWidths[Raw] <> -1 then begin
      OldWidth := TColumnEh(Item).FInitWidth;
      TColumnEh(Item).FInitWidth :=
          MulDiv(TColumnEh(Item).FInitWidth,TColumnEh(Item).Width,FGrid.ColWidths[Raw]);
       if (Raw <> FGrid.ColCount - 1) then begin
           Inc(FGrid.Columns[Raw - FGrid.FIndicatorOffset + 1].FInitWidth,OldWIdth - FGrid.FColumns[Raw - FGrid.FIndicatorOffset].FInitWidth);
           if (FGrid.Columns[Raw - FGrid.FIndicatorOffset + 1].FInitWidth < 0) then FGrid.Columns[Raw - FGrid.FIndicatorOffset + 1].FInitWidth := 0;
       end;
       FGrid.LayoutChanged;
    end;
    //\\\
  end;
  //ddd
  if (Items[FGrid.SelectedIndex].Visible = False) and (FGrid.VisibleColumns.Count > 0) then
    FGrid.SelectedIndex := FGrid.VisibleColumns[0].Index;
  //\\\
end;

function TDBGridColumnsEh.ExistFooterValueType(AFooterValueType: TFooterValueType): Boolean;
var i:Integer;
begin
  Result := False;
  for i:=0 to Count-1 do begin
    if (Items[i].Footer.ValueType = AFooterValueType) then begin
      Result := True;
      Exit;
    end;
  end;
end;

{ TBookmarkListEh }

constructor TBookmarkListEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FList := TStringList.Create;
  FList.OnChange := StringsChanged;
  FGrid := AGrid;
end;

destructor TBookmarkListEh.Destroy;
begin
  Clear;
  FList.Free;
  inherited Destroy;
end;

procedure TBookmarkListEh.Clear;
begin
  if FList.Count = 0 then Exit;
  FList.Clear;
  FGrid.Invalidate;
end;

function TBookmarkListEh.Compare(const Item1, Item2: TBookmarkStr): Integer;
begin
  with FGrid.Datalink.Datasource.Dataset do
    Result := CompareBookmarks(TBookmark(Item1), TBookmark(Item2));
end;

function TBookmarkListEh.CurrentRow: TBookmarkStr;
begin
  if not FLinkActive then RaiseGridError(sDataSetClosed);
  Result := FGrid.Datalink.Datasource.Dataset.Bookmark;
end;

function TBookmarkListEh.GetCurrentRowSelected: Boolean;
var
  Index: Integer;
begin
  Result := Find(CurrentRow, Index);
end;

function TBookmarkListEh.Find(const Item: TBookmarkStr; var Index: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  if (Item = FCache) and (FCacheIndex >= 0) then
  begin
    Index := FCacheIndex;
    Result := FCacheFind;
    Exit;
  end;
  Result := False;
  L := 0;
  H := FList.Count - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := Compare(FList[I], Item);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := L;
  FCache := Item;
  FCacheIndex := Index;
  FCacheFind := Result;
end;

function TBookmarkListEh.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TBookmarkListEh.GetItem(Index: Integer): TBookmarkStr;
begin
  Result := FList[Index];
end;

function TBookmarkListEh.IndexOf(const Item: TBookmarkStr): Integer;
begin
  if not Find(Item, Result) then
    Result := -1;
end;

procedure TBookmarkListEh.LinkActive(Value: Boolean);
begin
  Clear;
  FLinkActive := Value;
end;

procedure TBookmarkListEh.Delete;
var
  I: Integer;
begin
  with FGrid.Datalink.Datasource.Dataset do
  begin
    DisableControls;
    try
      for I := FList.Count-1 downto 0 do
      begin
        Bookmark := FList[I];
        Delete;
        FList.Delete(I);
      end;
    finally
      EnableControls;
    end;
  end;
end;

function TBookmarkListEh.Refresh: Boolean;
var
  I: Integer;
begin
  Result := False;
  with FGrid.DataLink.Datasource.Dataset do
  try
    CheckBrowseMode;
    for I := FList.Count - 1 downto 0 do
      if not BookmarkValid(TBookmark(FList[I])) then
      begin
        Result := True;
        FList.Delete(I);
      end;
  finally
    UpdateCursorPos;
    if Result then FGrid.Invalidate;
  end;
end;

procedure TBookmarkListEh.SetCurrentRowSelected(Value: Boolean);
var
  Index: Integer;
  Current: TBookmarkStr;
begin
  Current := CurrentRow;
  if (Length(Current) = 0) or (Find(Current, Index) = Value) then Exit;
  if Value then
    FList.Insert(Index, Current)
  else
    FList.Delete(Index);
  FGrid.InvalidateRow(FGrid.Row);
end;

procedure TBookmarkListEh.StringsChanged(Sender: TObject);
begin
  FCache := '';
  FCacheIndex := -1;
end;


procedure TBookmarkListEh.SelectAll;
var bm:TBookMarkStr;
begin
  with FGrid.Datalink.Datasource.Dataset do
  begin
    DisableControls;
    try
      bm := Bookmark;
      First;
      while EOF = False do begin
        SetCurrentRowSelected(True);
        Next;
      end;
      Bookmark := bm;
    finally
      EnableControls;
    end;
  end;
end;

{ TCustomDBGridEh }

var
  DrawBitmap: TBitmap;
  UserCount: Integer;

procedure UsesBitmap;
begin
  if UserCount = 0 then
    DrawBitmap := TBitmap.Create;
  Inc(UserCount);
end;

procedure ReleaseBitmap;
begin
  Dec(UserCount);
  if UserCount = 0 then DrawBitmap.Free;
end;

procedure WriteText(ACanvas: TCanvas; ARect: TRect; DX, DY: Integer;
  const Text: string; Alignment: TAlignment);
const
  AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX );
var
  B, R: TRect;
  Left: Integer;
  I: TColorRef;
begin
  I := ColorToRGB(ACanvas.Brush.Color);
  if GetNearestColor(ACanvas.Handle, I) = I then
  begin                       { Use ExtTextOut for solid colors }
    case Alignment of
      taLeftJustify:
        Left := ARect.Left + DX;
      taRightJustify:
        Left := ARect.Right - ACanvas.TextWidth(Text) - 3;
    else { taCenter }
      Left := ARect.Left + (ARect.Right - ARect.Left) shr 1
        - (ACanvas.TextWidth(Text) shr 1);
    end;
    ExtTextOut(ACanvas.Handle, Left, ARect.Top + DY, ETO_OPAQUE or
      ETO_CLIPPED, @ARect, PChar(Text), Length(Text), nil);
  end
  else begin                  { Use FillRect and Drawtext for dithered colors }
    DrawBitmap.Canvas.Lock;
    try
      with DrawBitmap, ARect do { Use offscreen bitmap to eliminate flicker and }
      begin                     { brush origin tics in painting / scrolling.    }
        Width := Max(Width, Right - Left);
        Height := Max(Height, Bottom - Top);
        R := Rect(DX, DY, Right - Left - 1, Bottom - Top - 1);
        B := Rect(0, 0, Right - Left, Bottom - Top);
      end;
      with DrawBitmap.Canvas do
      begin
        Font := ACanvas.Font;
        Font.Color := ACanvas.Font.Color;
        Brush := ACanvas.Brush;
        Brush.Style := bsSolid;
        FillRect(B);
        SetBkMode(Handle, TRANSPARENT);
        DrawText(Handle, PChar(Text), Length(Text), R, AlignFlags[Alignment]);
      end;
      ACanvas.CopyRect(ARect, DrawBitmap.Canvas, B);
    finally
      DrawBitmap.Canvas.Unlock;
    end;
  end;
end;


{new WriteTextEh}{}
procedure WriteTextEh(ACanvas: TCanvas; ARect: TRect; FillRect:Boolean; DX, DY: Integer;
  const Text: string; Alignment: TAlignment; Layout: TTextLayout; MultyL:Boolean; EndEllipsis:Boolean; LeftMarg,RightMarg:Integer);
const
  AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_EXPANDTABS or DT_NOPREFIX );
var
  rect1: TRect;
  {I, Left,} txth, DrawFlag: Integer;
  lpDTP :  TDrawTextParams;
begin
//  I := ColorToRGB(ACanvas.Brush.Color);
//  if GetNearestColor(ACanvas.Handle, I) = I then
//  begin                       { Use ExtTextOut for solid colors }
(*    if (MultyL = False) and (EndEllipsis = False) then begin
      case Alignment of
        taLeftJustify:
          Left := ARect.Left + DX;
        taRightJustify:
          Left := ARect.Right - ACanvas.TextWidth(Text) - 3;
      else { taCenter }
        Left := ARect.Left + (ARect.Right - ARect.Left) shr 1
          - (ACanvas.TextWidth(Text) shr 1);
      end;
      if (FillRect = True) then
        DrawFlag := ETO_OPAQUE or ETO_CLIPPED
      else
        DrawFlag := ETO_OPAQUE or ETO_CLIPPED;
      ExtTextOut(ACanvas.Handle, Left, ARect.Top + DY, DrawFlag,
            @ARect, PChar(Text), Length(Text), nil)

    end
    else begin {}{/////////// MultyL}*)

       if (FillRect = True) then ACanvas.FillRect(ARect);

       DrawFlag := 0;
       if (MultyL = True) then DrawFlag := DrawFlag or DT_WORDBREAK;
       if (EndEllipsis = True) then DrawFlag := DrawFlag or DT_END_ELLIPSIS;
       DrawFlag := DrawFlag or AlignFlags[Alignment];

        {}
       rect1.Left := 0; rect1.Top := 0; rect1.Right := 0; rect1.Bottom := 0;
       rect1 := ARect;  {}

       lpDTP.cbSize := SizeOf(lpDTP);
       lpDTP.uiLengthDrawn := Length(Text);
       lpDTP.iLeftMargin := LeftMarg;
       lpDTP.iRightMargin := RightMarg;

       InflateRect(rect1, -DX, -DY);

       if (Layout <> tlTop) {and (MultyL = True)} then
         txth := DrawTextEx(ACanvas.Handle,PChar(Text), Length(Text),    {}
            rect1, DrawFlag or DT_CALCRECT,@lpDTP) // Получить квадрат.
       else txth := 0;
       rect1 := ARect;  {}
       InflateRect(rect1, -DX, -DY);

       case Layout of
        tlTop: ;
        tlBottom: rect1.top := rect1.Bottom - txth;
        tlCenter: rect1.top := rect1.top + ((rect1.Bottom-rect1.top) div 2) - (txth div 2);
       end;

       DrawTextEx(ACanvas.Handle,PChar(Text), Length(Text),    {}
          rect1, DrawFlag,@lpDTP); {}

//    end;      {}{\\\\\\\\\\\\\}
//  end
//  else begin                  { Use FillRect and Drawtext for dithered colors }
//  end;
end;

constructor TCustomDBGridEh.Create(AOwner: TComponent);
var
  Bmp: TBitmap;
begin
{$ifdef eval}
  {$INCLUDE eval}
{$endif}

  inherited Create(AOwner);
  inherited DefaultDrawing := False;
  FAcquireFocus := True;
  Bmp := TBitmap.Create;
  try
    Bmp.LoadFromResourceName(HInstance, bmArrow);
    FIndicators := TImageList.CreateSize(Bmp.Width, Bmp.Height);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmEdit);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmInsert);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmMultiDot);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmMultiArrow);
    FIndicators.AddMasked(Bmp, clWhite);
//ddd
    Bmp.LoadFromResourceName(HInstance, bmSmDown);
    FSortMarkerImages := TImageList.CreateSize(Bmp.Width, Bmp.Height);
    FSortMarkerImages.AddMasked(Bmp, clFuchsia);
    Bmp.LoadFromResourceName(HInstance, bmSmUp);
    FSortMarkerImages.AddMasked(Bmp, clFuchsia);
//\\\
  finally
    Bmp.Free;
  end;
  FTitleOffset := 1;
  FIndicatorOffset := 1;
  FUpdateFields := True;
  FOptions := [dgEditing, dgTitles, dgIndicator, dgColumnResize,
    dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit];
  DesignOptionsBoost := [goColSizing];
  VirtualView := True;
  UsesBitmap;
  ScrollBars := ssHorizontal;
  inherited Options := [goFixedHorzLine, goFixedVertLine, goHorzLine,
    goVertLine, goColSizing, goColMoving, goTabs, goEditing];
  FColumns := CreateColumns;
  {ddd} FVisibleColumns := TColumnsEhList.Create;
  inherited RowCount := 2;
  inherited ColCount := 2;
  FDataLink := TGridDataLinkEh.Create(Self);
  Color := clWindow;
  ParentColor := False;
  FTitleFont := TFont.Create;
  FTitleFont.OnChange := TitleFontChanged;
  FSaveCellExtents := False;
  FUserChange := True;
  FDefaultDrawing := True;
  FUpdatingEditor := False;
  FBookmarks := TBookmarkListEh.Create(Self);
  HideEditor;

  //ddd

  FTitlEheight := 0;
  FTitlEheightFull := 0;
  FTitleLines := 0;
  FLeafFieldArr := nil;
  FHeadTree := THeadTreeNode.CreateText('Root',10,0);
  FVTitleMargin := 10;
  FHTitleMargin := 0;
  FUseMultiTitle := False;
  FInitColWidth := TList.Create;
  FRowSizingAllowed := False;
  FDefaultRowChanged := False;
  FInplaceEditorButtonWidth := GetSystemMetrics(SM_CXVSCROLL);
  FSumList := TDBGridEhSumList.Create(Self);
  FSumList.SumListChanged := SumListChanged;
  FSumList.OnRecalcAll := SumListRecalcAll;
  FHorzScrollBar := TDBGridEhScrollBar.Create(Self,sbHorizontal);
  FVertScrollBar := TDBGridEhScrollBar.Create(Self,sbVertical);
  FOptionsEh := [dghFixed3D,dghHighlightFocus,dghClearSelection];
  FSortMarkedColumns := TColumnsEhList.Create;
  FPressedCol := -1;
end;

destructor TCustomDBGridEh.Destroy;
begin
  FColumns.Free; FColumns := nil;
  //ddd
  FVisibleColumns.Free; FVisibleColumns := nil;
  FSortMarkedColumns.Free; FSortMarkedColumns := nil;
  FHorzScrollBar.Free; FHorzScrollBar := nil;
  FVertScrollBar.Free; FVertScrollBar := nil;
  //\\\
  FDataLink.Free; FDataLink := nil;
  FIndicators.Free; FIndicators := nil;
  FTitleFont.Free; FTitleFont := nil;
  FBookmarks.Free; FBookmarks := nil;
  inherited Destroy;
  ReleaseBitmap;

//ddd
  FSortMarkerImages.Free;
  if FLeafFieldArr <> nil then FreeMem(FLeafFieldArr);
  FUpDownBitmap.Free;
  FHeadTree.Free;
  FInitColWidth.Free;
  FSumList.Free;
//\\\
end;

function TCustomDBGridEh.AcquireFocus: Boolean;
begin
  Result := True;
  if FAcquireFocus and CanFocus and not (csDesigning in ComponentState) then
  begin
        //VCL Bug    SetFocus;
    Windows.SetFocus(Handle); // VCL Bug is fixed
    Result := Focused or (InplaceEditor <> nil) and InplaceEditor.Focused;
  end;
end;

function TCustomDBGridEh.RawToDataColumn(ACol: Integer): Integer;
begin
  Result := ACol - FIndicatorOffset;
end;

function TCustomDBGridEh.DataToRawColumn(ACol: Integer): Integer;
begin
  Result := ACol + FIndicatorOffset;
end;

function TCustomDBGridEh.AcquireLayoutLock: Boolean;
begin
  Result := (FUpdateLock = 0) and (FLayoutLock = 0);
  if Result then BeginLayout;
end;

procedure TCustomDBGridEh.BeginLayout;
begin
  BeginUpdate;
  if FLayoutLock = 0 then Columns.BeginUpdate;
  Inc(FLayoutLock);
end;

procedure TCustomDBGridEh.BeginUpdate;
begin
  Inc(FUpdateLock);
end;

procedure TCustomDBGridEh.CancelLayout;
begin
  if FLayoutLock > 0 then
  begin
    if FLayoutLock = 1 then
      Columns.EndUpdate;
    Dec(FLayoutLock);
    EndUpdate;
  end;
end;

function TCustomDBGridEh.CanEditAcceptKey(Key: Char): Boolean;
begin
  with Columns[SelectedIndex] do
    //ddd
    if Assigned(KeyList) and (KeyList.Count > 0) then
      Result := True
    else
    //\\\
      Result := FDatalink.Active and Assigned(Field) and Field.IsValidChar(Key);
end;

function TCustomDBGridEh.CanEditModifyText: Boolean;
begin
  Result := False;
  if not ReadOnly and FDatalink.Active and not FDatalink.Readonly then
  with Columns[SelectedIndex] do
    if (not ReadOnly) and Assigned(Field) and Field.CanModify
      and (not Field.IsBlob or Assigned(Field.OnSetText)
            {d/}or ((DrawMemoText = True) and (Field.DataType = ftMemo)) {d\}) then
    begin
      FDatalink.Edit;
      Result := FDatalink.Editing;
      if Result then FDatalink.Modified;
    end;
end;

function TCustomDBGridEh.CanEditModify: Boolean;
begin
  //ddd
  {Result := False;
  if not ReadOnly and FDatalink.Active and not FDatalink.Readonly then
  with Columns[SelectedIndex] do
    if (not ReadOnly) and Assigned(Field) and Field.CanModify
      and (not Field.IsBlob or Assigned(Field.OnSetText)) then
    begin
      FDatalink.Edit;
      Result := FDatalink.Editing;
      if Result then FDatalink.Modified;
    end;}
  Result := CanEditModifyText and (Columns[SelectedIndex].GetColumnType <> ctKeyPickList);
  //\\\
end;

function TCustomDBGridEh.CanEditShow: Boolean;
begin
  Result := (LayoutLock = 0) and inherited CanEditShow;
  //ddd
  Result := Result and not (Columns[SelectedIndex].GetColumnType in [ctKeyImageList..ctCheckboxes]);
  if not Result then HideEditor;
  //\\\
end;

procedure TCustomDBGridEh.CellClick(Column: TColumnEh);
begin
  if Assigned(FOnCellClick) then FOnCellClick(Column);
end;

procedure TCustomDBGridEh.ColEnter;
begin
  UpdateIme;
  if Assigned(FOnColEnter) then FOnColEnter(Self);
end;

procedure TCustomDBGridEh.ColExit;
begin
  if Assigned(FOnColExit) then FOnColExit(Self);
end;

procedure TCustomDBGridEh.ColumnMoved(FromIndex, ToIndex: Longint);
begin
  FromIndex := RawToDataColumn(FromIndex);
  ToIndex := RawToDataColumn(ToIndex);
  Columns[FromIndex].Index := ToIndex;
  if Assigned(FOnColumnMoved) then FOnColumnMoved(Self, FromIndex, ToIndex);
end;

procedure TCustomDBGridEh.ColWidthsChanged;
var
  I,J, vi: Integer;
  OldWidth:Integer;

  procedure RecalcAutoFitRightCols(ForColumn:Integer);
  var i,RightWidth,Delta:Integer;
  begin
    (*RightWidth := 0; RightInitWidth := 0;
    for i := ForColumn to Columns.Count - 1 do begin
      if FColumns[i].Visible and FColumns[i].AutoFitColWidth then begin
        Inc(RightWidth,FColumns[i].Width);
        if (i <> ForColumn) then Inc(RightInitWidth,FColumns[i].FInitWidth);
      end;
    end;
    Dec(RightWidth,ColWidths[ForColumn + FIndicatorOffset]);
    if (RightWidth <= 0) then RightWidth := 1;

    FColumns[ForColumn].FInitWidth := MulDiv(RightInitWidth,ColWidths[ForColumn + FIndicatorOffset],RightWidth);*)


    RightWidth := 0;
    Delta := ColWidths[ForColumn + FIndicatorOffset] - FColumns[ForColumn].Width;
    if (FColumns[ForColumn].AutoFitColWidth) then
      FColumns[ForColumn].FInitWidth :=
        MulDiv(ColWidths[ForColumn+FIndicatorOffset],FColumns[ForColumn].FInitWidth,FColumns[ForColumn].Width)
    else
      FColumns[ForColumn].Width := ColWidths[ForColumn+FIndicatorOffset];
    for i := ForColumn + 1 to Columns.Count - 1 do
     if FColumns[i].Visible and FColumns[i].AutoFitColWidth then Inc(RightWidth,FColumns[i].Width);

    for i := ForColumn + 1 to Columns.Count - 1 do
     if FColumns[i].Visible and FColumns[i].AutoFitColWidth then begin
       FColumns[i].FInitWidth :=
          MulDiv(RightWidth-Delta,FColumns[i].FInitWidth,RightWidth);
       if (FColumns[i].FInitWidth <= 0) then FColumns[i].FInitWidth := 1;
     end;
  end;
begin
  inherited ColWidthsChanged;
  if (FDatalink.Active or (FColumns.State = csCustomized)) and
    AcquireLayoutLock then
  try
    for I := FIndicatorOffset to ColCount - 1 do ColWidths[I] := Columns[I - FIndicatorOffset].AllowableWidth(ColWidths[I]);
    for I := FIndicatorOffset to ColCount - 1 do begin

     //ddd
     // FColumns[I - FIndicatorOffset].Width := ColWidths[I];
     if not FColumns[I - FIndicatorOffset].Visible then Continue;
     if (AutoFitColWidths = False) or (csDesigning in ComponentState) then
       FColumns[I - FIndicatorOffset].Width := ColWidths[I]
     else
       if (FColumns[I - FIndicatorOffset].Width <> ColWidths[I]) then begin
         if (dghResizeWholeRightPart in OptionsEh) then begin
           RecalcAutoFitRightCols(I-FIndicatorOffset);
         end else begin
           vi := -1;
           for j := 0 to VisibleColumns.Count-1 do
             if (VisibleColumns[j] =  FColumns[I - FIndicatorOffset]) then begin
                vi := j; Break;
             end;
           if vi <> -1 then begin
             if VisibleColumns[vi].AutoFitColWidth then begin
               OldWidth := VisibleColumns[vi].FInitWidth;
               VisibleColumns[vi].FInitWidth :=
                 MulDiv(VisibleColumns[vi].FInitWidth,ColWidths[I],VisibleColumns[vi].Width);
               if (vi <> VisibleColumns.Count - 1) then begin
                 Inc(VisibleColumns[vi + 1].FInitWidth,OldWIdth - VisibleColumns[vi].FInitWidth);
                 if (VisibleColumns[vi + 1].FInitWidth < 0) then VisibleColumns[vi + 1].FInitWidth := 0;
               end;
             end
             else FColumns[I - FIndicatorOffset].Width := ColWidths[I];
           end;
         end;
       end;
    end;
    //\\\
  finally
    EndLayout;
  end;
end;

function TCustomDBGridEh.CreateColumns: TDBGridColumnsEh;
begin
  Result := TDBGridColumnsEh.Create(Self,TColumnEh);
end;

function TCustomDBGridEh.CreateEditor: TInplaceEdit;
begin
  Result := TDBGridInplaceEdit.Create(Self);
end;

procedure TCustomDBGridEh.CreateWnd;
begin
  BeginUpdate;   { prevent updates in WMSize message that follows WMCreate }
  try
    inherited CreateWnd;
  finally
    EndUpdate;
  end;
  UpdateRowCount;
  UpdateActive;
  UpdateScrollBar;
  FOriginalImeName := ImeName;
  FOriginalImeMode := ImeMode;
end;

procedure TCustomDBGridEh.DataChanged;
var VertSBVis:Boolean;
begin
  if not HandleAllocated then Exit;
  UpdateRowCount;
  VertSBVis := VertScrollBar.IsScrollBarVisible;
  UpdateScrollBar;
  if (VertSBVis <> VertScrollBar.IsScrollBarVisible) then begin
    if (FAutoFitColWidths = True) {and (UpdateLock = 0)} and not (csDesigning in ComponentState) then DeferLayout;
    //Update;
    //LayoutChanged;
  end;
  UpdateActive;
  InvalidateEditor;
  ValidateRect(Handle, nil);
  Invalidate;
end;

procedure TCustomDBGridEh.DefaultHandler(var Msg);
var
  P: TPopupMenu;
  Cell: TGridCoord;
begin                
  inherited DefaultHandler(Msg);
  if TMessage(Msg).Msg = wm_RButtonUp then
    with TWMRButtonUp(Msg) do
    begin
      Cell := MouseCoord(XPos, YPos);
      if (Cell.X < FIndicatorOffset) or (Cell.Y < 0) then Exit;
      P := Columns[RawToDataColumn(Cell.X)].PopupMenu;
      if (P <> nil) and P.AutoPopup then
      begin
        SendCancelMode(nil);
        P.PopupComponent := Self;
        with ClientToScreen(SmallPointToPoint(Pos)) do
          P.Popup(X, Y);
        Result := 1;
      end;
    end;
end;

procedure TCustomDBGridEh.DeferLayout;
var
  M: TMsg;
begin
  if HandleAllocated and
    not PeekMessage(M, Handle, cm_DeferLayout, cm_DeferLayout, pm_NoRemove) then
    PostMessage(Handle, cm_DeferLayout, 0, 0);
  CancelLayout;
end;

procedure TCustomDBGridEh.DefineFieldMap;
var
  I: Integer;
begin
  if FColumns.State = csCustomized then
  begin   { Build the column/field map from the column attributes }
    DataLink.SparseMap := True;
    for I := 0 to FColumns.Count-1 do
      FDataLink.AddMapping(FColumns[I].FieldName);
  end
  else   { Build the column/field map from the field list order }
  begin
    FDataLink.SparseMap := False;
    with Datalink.Dataset do
      for I := 0 to FieldCount - 1 do
        with Fields[I] do if Visible then Datalink.AddMapping(FieldName);
  end;
end;

procedure TCustomDBGridEh.DefaultDrawDataCell(const Rect: TRect; Field: TField;
  State: TGridDrawState);
var
  Alignment: TAlignment;
  Value: string;
begin
  Alignment := taLeftJustify;
  Value := '';
  if Assigned(Field) then
  begin
    Alignment := Field.Alignment;
    Value := Field.DisplayText;
  end;
  WriteText(Canvas, Rect, 2, 2, Value, Alignment);
end;

procedure TCustomDBGridEh.DefaultDrawColumnCell(const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
  Value: string;
  ARect:TRect;
  FrameOffs:Integer;
begin
  ARect := Rect;
  if (dghFooter3D in OptionsEh) then begin
    FrameOffs := 1;
    InflateRect(ARect, -1, -1);
  end
  else FrameOffs := 2;
  Value := '';
  if Assigned(Column.Field) then
    Value := Column.Field.DisplayText;
  //ddd
  //WriteText(Canvas, Rect, 2, 2, Value, Column.Alignment);
  if Assigned(Column.Field) then
    if (DrawMemoText = True) and (Column.Field.DataType = ftMemo) then
      Value := Column.Field.AsString
    else
      Value := Column.Field.DisplayText;
  WriteTextEh(Canvas, ARect, True, FrameOffs, FrameOffs, Value, Column.Alignment,tlTop,Column.WordWrap and FAllowWordWrap, Column.EndEllipsis,0,0);
  //\\\
end;

procedure TCustomDBGridEh.ReadColumns(Reader: TReader);
begin
  Columns.Clear;
  Reader.ReadValue;
  Reader.ReadCollection(Columns);
end;

procedure TCustomDBGridEh.WriteColumns(Writer: TWriter);
begin
  Writer.WriteCollection(Columns);
end;

procedure TCustomDBGridEh.DefineProperties(Filer: TFiler);
begin
  Filer.DefineProperty('Columns', ReadColumns, WriteColumns,
    ((Columns.State = csCustomized) and (Filer.Ancestor = nil)) or
    ((Filer.Ancestor <> nil) and
     ((Columns.State <> TCustomDBGridEh(Filer.Ancestor).Columns.State) or
      (not CollectionsEqual(Columns, TCustomDBGridEh(Filer.Ancestor).Columns)) )));
end;

{ ddd new DrawCell}
procedure TCustomDBGridEh.DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
const
  CheckBoxFlags: array [TCheckBoxState] of Integer =
    ( DFCS_BUTTONCHECK,  DFCS_BUTTONCHECK or DFCS_CHECKED,  DFCS_BUTTON3STATE or DFCS_CHECKED );
var
  OldActive, KeyIndex{, SorCol, SorRow}: Integer;
  Highlight: Boolean;
  Value: string;
  DrawColumn: TColumnEh;
  FrameOffs: Byte;
  ARect1{,SorRect}:TRect;
  Down: Boolean;
  MultiSelected, SMImageFit: Boolean;
  Indicator,LeftMarg,RightMarg: Integer;
  BackColor: TColor;
  ASortMarker: TSortMarkerEh;
  SortMarkerIdx,SMTMarg:Integer;
  NewBackgrnd:TColor;
  AEditStyle:TEditStyle;
  NewAlignment:TAlignment;
  The3DRect:Boolean;


  function RowIsMultiSelected: Boolean;
  var
    Index: Integer;
  begin
    Result := (dgMultiSelect in Options) and Datalink.Active and
      FBookmarks.Find(Datalink.Datasource.Dataset.Bookmark, Index);
  end;

  procedure DrawHost(ALeaf:THeadTreeNode; DHRect:TRect; AEndEllipsis: Boolean);
  var curLeaf: THeadTreeNode;
     curW:Integer;
     leftM:Integer;
     drawRec, FrozenRectCell:TRect;
     OldColor:TColor;
  begin
    DHRect.Bottom := DHRect.Top;
    if dgRowLines in Options then Dec(DHRect.Bottom);

    Dec(DHRect.Top,ALeaf.Host.Height);

    curLeaf := ALeaf.Host.Child;
    curW := 0;
    while curLeaf <> ALeaf do begin
             Inc(curW,curLeaf.Width);
             if dgColLines in Options then Inc(curW,1);
             curLeaf := curLeaf.Next;
    end;
    Dec(DHRect.Left,curW); DHRect.Right := DHRect.Left + ALeaf.Host.Width;

    leftM := 0;
    drawRec := DHRect;
    if (DHRect.Left < ColWidths[0]) and (dgIndicator in Options) then begin
      leftM := DHRect.Left - ColWidths[0]{-1};   drawRec.Left := ColWidths[0]{+1};
      if not (dgColLines in Options) then begin
        Inc(leftM); Dec(drawRec.Left);
      end;
    end;


    if (FrozenCols > 0) then begin
      FrozenRectCell := CellRect(FixedCols-1,0);
      if (FrozenRectCell.Right > drawRec.Left) and (FrozenRectCell.Right < drawRec.Right) then begin
        Dec(leftM,FrozenRectCell.Right - drawRec.Left);
        drawRec.Left := FrozenRectCell.Right + 1;
      end;
      if (leftM < 0) then Dec(drawRec.Left,iif(dgColLines in Options,1,2));
    end;

    //{tmp} if not Fixed3D then begin
    //         drawRec.Top := drawRec.Top - 1;
    //         DHRect.Top := DHRect.Top;
    //      end;

    if (gdFixed in AState) and {([dgRowLines, dgColLines] * Options =
      [dgRowLines, dgColLines])} (dghFixed3D in OptionsEh) then begin
      InflateRect(DHRect, 1, 1);
      InflateRect(drawRec, -1, -1);
    end;
    {else
      InflateRect(DHRect, 0, 1)};

    if(leftM  <> 0) then
      WriteTextEh(Canvas, drawRec, True, FrameOffs-1, FrameOffs, ALeaf.Host.Text, taCenter,tlCenter,True,AEndEllipsis,leftM,0)
    else
      WriteTextEh(Canvas, drawRec, True, FrameOffs, FrameOffs, ALeaf.Host.Text, taCenter,tlCenter,True,AEndEllipsis,leftM,0);

    ALeaf.Host.Drawed := True;

    if (gdFixed in AState) and {([dgRowLines, dgColLines] * Options =
      [dgRowLines, dgColLines])} (dghFixed3D in OptionsEh) then
    begin
      InflateRect(drawRec, 1, 1);
      if(leftM  <> 0) then
        DrawEdge(Canvas.Handle, drawRec, BDR_RAISEDINNER, BF_TOP)
      else
        DrawEdge(Canvas.Handle, drawRec, BDR_RAISEDINNER, BF_TOPLEFT);
      DrawEdge(Canvas.Handle, drawRec, BDR_RAISEDINNER, BF_BOTTOMRIGHT);
      InflateRect(DHRect, -1, -1);
    end {else
      InflateRect(DHRect, 0, -1)};
    if ( dgRowLines in Options) then begin
      OldColor := Canvas.Pen.Color;
      Canvas.Pen.Color := clBlack;
      Canvas.MoveTo(drawRec.Left,drawRec.Bottom);
      Canvas.LineTo(drawRec.Right,drawRec.Bottom);
      Canvas.Pen.Color := OldColor;
    end;

    if(ALeaf.Host.Host <> nil) and (ALeaf.Host.Host.Drawed = False) then begin
      DrawHost(ALeaf.Host,DHRect,AEndEllipsis);
      ALeaf.Host.Host.Drawed := True;
    end;
  end;


begin
//ddd  SorRect := ARect; SorCol := ACol; SorRow := ARow;
  if (ARect.Left >= ARect.Right) then Exit;
  DrawColumn := nil;
  Down := False;
  if csLoading in ComponentState then
  begin
    Canvas.Brush.Color := Color;
    Canvas.FillRect(ARect);
    Exit;
  end;

  Dec(ARow, FTitleOffset);
  Dec(ACol, IndicatorOffset);

  The3DRect := (gdFixed in AState) and (dghFixed3D in OptionsEh) and
    ((FFooterRowCount = 0) or ((FFooterRowCount > 0) and (ARow <> RowCount - FFooterRowCount - 1 - FTitleOffset)) )
    and ((ACol < 0) or (ARow < 0));
  if not The3DRect then
    The3DRect := The3DRect or ((dghFooter3D in OptionsEh) and (FFooterRowCount > 0) and (ARow > RowCount - FFooterRowCount - 1 - FTitleOffset));
  if not The3DRect then
    The3DRect := The3DRect or ((dghData3D in OptionsEh) and not (gdFixed in AState)
                  and not ((FFooterRowCount > 0) and (ARow > RowCount - FFooterRowCount - 1 - FTitleOffset)));
  if not The3DRect then
    The3DRect := The3DRect or ( (dghFixed3D in OptionsEh) and ((dghData3D in OptionsEh) or (dghFrozen3D in OptionsEh)) and ((FFooterRowCount > 0) and (ARow = RowCount - FFooterRowCount - 1 - FTitleOffset) and (ACol < 0)));
  if not The3DRect then
    The3DRect := The3DRect or ((dghFrozen3D in OptionsEh) and (gdFixed in AState) and (ACol >= 0) and (ARow >= 0));
  if (*(gdFixed in AState) and {ddd([dgRowLines, dgColLines] * Options =
    [dgRowLines, dgColLines])} (dghFixed3D in OptionsEh) and
    //ddd
    ((FFooterRowCount = 0) or ((FFooterRowCount > 0) and (ARow <> RowCount - FFooterRowCount - 1 - FTitleOffset)) )
    and ((ACol < 0) or (ARow < 0)) then
    //\\\
    *)
    The3DRect then
  begin
    InflateRect(ARect, -1, -1);
    FrameOffs := 1;
  end
  else
    FrameOffs := 2;

  if (gdFixed in AState) and (ACol < 0) then // Столбец индикатора
  begin    //ddd
    if ((FFooterRowCount = 0) or ((FFooterRowCount > 0) and (ARow <> RowCount - FFooterRowCount - 1 - FTitleOffset))) or (dghFrozen3D in OptionsEh) then
      Canvas.Brush.Color := FixedColor
     else
      Canvas.Brush.Color := Color;
    //ddd
    Canvas.FillRect(ARect);
    if Assigned(DataLink) and DataLink.Active  then
    begin
      MultiSelected := False;
//ddd
      if (ARow >= 0)   and ( (ARow < FDatalink.RecordCount) or (FFooterRowCount = 0) ) then // Рисуем индикатор
//\\\
      begin
        OldActive := FDataLink.ActiveRecord;
        try
          FDatalink.ActiveRecord := ARow;
          MultiSelected := RowIsMultiselected;
        finally
          FDatalink.ActiveRecord := OldActive;
        end;
      end;
      if (ARow = FDataLink.ActiveRecord) or MultiSelected then
      begin
        Indicator := 0;
        if FDataLink.DataSet <> nil then
          case FDataLink.DataSet.State of
            dsEdit: Indicator := 1;
            dsInsert: Indicator := 2;
            dsBrowse:
              if MultiSelected then
                if (ARow <> FDatalink.ActiveRecord) then
                  Indicator := 3
                else
                  Indicator := 4;  // multiselected and current row
          end;
        FIndicators.BkColor := FixedColor;
        FIndicators.Draw(Canvas, ARect.Right - FIndicators.Width - FrameOffs,
          (ARect.Top + ARect.Bottom - FIndicators.Height) shr 1, Indicator);
        if ARow = FDatalink.ActiveRecord then
          FSelRow := ARow + FTitleOffset;
      end;
    end;
  end
  else with Canvas do
  begin
    DrawColumn := Columns[ACol];
    if (gdFixed in AState) and ((ACol < 0) or (ARow < 0)) then
    begin
      Font := DrawColumn.Title.Font;
      Brush.Color := DrawColumn.Title.Color;
    end
    else
    begin
      Font := DrawColumn.Font;
      Brush.Color := DrawColumn.Color;
    end;
    if ARow < 0 then with DrawColumn.Title do begin // draw headline
// new --
         Down := (FPressedCol-IndicatorOffset  = ACol) and FPressed;
         if (FUseMultiTitle = True) then ARect.Top := ARect.Bottom - FLeafFieldArr[ACol].FLeaf.Height + 3;
         ARect1 := ARect;
         ASortMarker := DrawColumn.Title.SortMarker;
         if (DrawColumn.Field <> nil) and Assigned(FOnGetBtnParams) then begin
           BackColor := Canvas.Brush.Color;
           FOnGetBtnParams(Self, DrawColumn, Canvas.Font, BackColor, ASortMarker, Down);
           Canvas.Brush.Color := BackColor;
         end;
         if Down then begin
           if (FUseMultiTitle = True) or (TitlEheight <> 0) or (TitleLines <> 0) then begin
             LeftMarg := 2; RightMarg := -2; Inc(ARect1.Top,2);
           end else begin
             LeftMarg := 1; RightMarg := -1; Inc(ARect1.Top,1);
           end;
         end else begin
           LeftMarg := 0;
           RightMarg := 0;
         end;
         case ASortMarker of
           smDownEh: SortMarkerIdx := 0;
           smUpEh: SortMarkerIdx := 1;
           else SortMarkerIdx := -1;
         end;
         SMTMarg := 0; SMImageFit := True;
         if SortMarkerIdx <> -1 then begin
           Dec(ARect1.Right,16);
           if (SortMarkedColumns.Count > 1) then begin
             Canvas.Font := SortMarkerFont;
             SMTMarg := Canvas.TextWidth(IntToStr(SortIndex));
           end else SMTMarg := 0;
           if ARect1.Right < ARect1.Left then begin
             ARect1.Right := ARect1.Right + 14 - SMTMarg;
             SMImageFit := False;
           end;
           if ARect1.Right < ARect1.Left then begin
             ARect1.Right := ARect1.Right + 2 + SMTMarg;
             SMTMarg := 0;
           end;
         end;
         Canvas.FillRect(ARect);
         if FUseMultiTitle = true then Canvas.Font := TitleFont else Canvas.Font := Font;
         if (FUseMultiTitle = True) then begin
           //Canvas.Font := TitleFont;
           WriteTextEh(Canvas, ARect1, False, FrameOffs, FrameOffs, FLeafFieldArr[ACol].FLeaf.Text, taCenter,tlCenter,True,EndEllipsis,LeftMarg,RightMarg);
           //Canvas.Pen.Color := clWindowFrame;
         end
         else if (TitlEheight <> 0) or (TitleLines <> 0) then
           WriteTextEh(Canvas, ARect1, False, FrameOffs, FrameOffs, Caption, Alignment,tlCenter,True,EndEllipsis,LeftMarg,RightMarg)
         else begin
           ARect1.Left := ARect1.Left + LeftMarg;
           ARect1.Right := ARect1.Right - RightMarg;
           WriteTextEh(Canvas, ARect1, False, FrameOffs, FrameOffs, Caption, Alignment,tlTop,False,EndEllipsis,LeftMarg,RightMarg);
         end;

         if SortMarkerIdx <> -1 then begin
           if SMImageFit <> False then begin
             FSortMarkerImages.BkColor := Canvas.Brush.Color;
             FSortMarkerImages.Draw(Canvas, ARect.Right - FSortMarkerImages.Width - 2 - SMTMarg + LeftMarg,
             (ARect.Bottom + ARect.Top - FSortMarkerImages.Height) div 2 + LeftMarg, SortMarkerIdx);
           end;
           if SMTMarg <> 0 then begin
             Canvas.Font := SortMarkerFont;
             Canvas.TextOut(ARect.Right - SMTMarg - 2 + LeftMarg,
                (ARect.Bottom + ARect.Top - FSortMarkerImages.Height) div 2 + LeftMarg - 1,IntToStr(SortIndex));
             Canvas.Font := TitleFont;
           end;
         end;

    end
//\\
    else if (DataLink = nil) or not DataLink.Active then
      FillRect(ARect)
    else
    begin  // Draw contents
      Value := '';
      OldActive := DataLink.ActiveRecord;
      try
        if ((ARow >= 0) and (ARow < FDatalink.RecordCount)) or (FFooterRowCount = 0) then
        begin
          DataLink.ActiveRecord := ARow;
          if (DrawColumn.AlwaysShowEditButton) then begin
            AEditStyle := GetColumnEditStile(DrawColumn);
            if (AEditStyle <> esSimple) then begin
              SetRect(ARect1,ARect.Right - FInplaceEditorButtonWidth,ARect.Top,ARect.Right,ARect.Bottom);
              if AEditStyle = esUpDown then
                Canvas.Draw(ARect1.Left,ARect1.Top,UpDownBitmap)
              else
                PaintInplaceButton(Canvas.Handle,AEditStyle,ARect1,False,DataLink.Active);
              ARect.Right := ARect.Right - FInplaceEditorButtonWidth;
            end;
          end;
          if Assigned(DrawColumn.Field) then
          //ddd
            if Assigned(DrawColumn.KeyList)  and (DrawColumn.KeyList.Count > 0) then begin
              KeyIndex := DrawColumn.KeyList.IndexOf(DrawColumn.Field.Text);
              if (KeyIndex > -1) and (KeyIndex < DrawColumn.PickList.Count) then
                Value := DrawColumn.PickList.Strings[KeyIndex]
              else if (DrawColumn.NotInKeylistIndex >= 0) and (DrawColumn.NotInKeylistIndex < DrawColumn.PickList.Count) then
                Value := DrawColumn.PickList.Strings[DrawColumn.NotInKeylistIndex];
            end
            else if (DrawMemoText = True) and (DrawColumn.Field.DataType = ftMemo) then
              Value := DrawColumn.Field.AsString
            else
          //\\\
              Value := DrawColumn.Field.DisplayText;
          Highlight := HighlightCell(ACol, ARow, Value, AState);
          if Highlight then
          begin
            Brush.Color := clHighlight;
            Font.Color := clHighlightText;
          end;
          NewBackgrnd := Canvas.Brush.Color;
          GetCellParams(DrawColumn,Font,NewBackgrnd,AState);
          Canvas.Brush.Color := NewBackgrnd;
          if DefaultDrawing then
            if DrawColumn.GetColumnType in [ctCommon..ctKeyPickList] then
              WriteTextEh(Canvas, ARect, True, FrameOffs, FrameOffs, Value, DrawColumn.Alignment,tlTop,DrawColumn.WordWrap and FAllowWordWrap, DrawColumn.EndEllipsis,0,0)
            else if DrawColumn.GetColumnType = ctKeyImageList then begin
              FillRect(ARect);
              DrawColumn.ImageList.BkColor := Canvas.Brush.Color;
              KeyIndex := DrawColumn.KeyList.IndexOf(DrawColumn.Field.Text);
              if KeyIndex = -1 then KeyIndex := DrawColumn.NotInKeyListIndex;
              DrawColumn.ImageList.Draw(Canvas, ARect.Left + (ARect.Right - ARect.Left) shr 1 - DrawColumn.ImageList.Width shr 1 ,
                ARect.Top + (ARect.Bottom - ARect.Top) shr 1 - DrawColumn.ImageList.Height shr 1,
                 KeyIndex);
            end else if DrawColumn.GetColumnType = ctCheckboxes then begin
              FillRect(ARect);
              ARect1.Left := ARect.Left + iif(ARect.Right - ARect.Left < FCheckBoxWidth,0,
                    (ARect.Right - ARect.Left) shr 1 - FCheckBoxWidth shr 1);
              ARect1.Right :=  iif(ARect.Right - ARect.Left < FCheckBoxWidth,ARect.Right,
                     ARect1.Left + FCheckBoxWidth);
              ARect1.Top := ARect.Top + iif(ARect.Bottom - ARect.Top < FCheckBoxHeight,0,
                    (ARect.Bottom - ARect.Top) shr 1 - FCheckBoxHeight shr 1);
              ARect1.Bottom := iif(ARect.Bottom - ARect.Top < FCheckBoxHeight,ARect.Bottom,
                    ARect1.Top + FCheckBoxHeight);
              DrawFrameControl(Canvas.Handle,ARect1,DFC_BUTTON,CheckBoxFlags[DrawColumn.CheckboxState]);
            end;

          if Columns.State = csDefault then
            DrawDataCell(ARect, DrawColumn.Field, AState);
          DrawColumnCell(ARect, ACol, DrawColumn, AState);
        end
        else
        //ddd                                         Draw Footer Cells
        if {Assigned(OnDrawFooterCell) and}
           (FFooterRowCount > 0) and
           (ARow > RowCount - FFooterRowCount - 1 - FTitleOffset) then begin
             Font := DrawColumn.Footer.Font;
             Brush.Color := DrawColumn.Footer.Color;

             if FDefaultDrawing then begin
               NewBackgrnd := Brush.Color;
               NewAlignment := DrawColumn.Footer.Alignment;
               Value := GetFooterValue(FFooterRowCount - RowCount + ARow + FTitleOffset, DrawColumn);

               GetFooterParams(ACol,  FFooterRowCount - RowCount + ARow + FTitleOffset, DrawColumn, Font,
                               NewBackgrnd, NewAlignment, AState, Value);

               Canvas.Brush.Color := NewBackgrnd;

               WriteTextEh(Canvas, ARect, True, FrameOffs, FrameOffs, Value, NewAlignment,tlTop,
                 DrawColumn.Footer.WordWrap and FAllowWordWrap, DrawColumn.Footer.EndEllipsis,0,0);
             end;

             if Assigned(OnDrawFooterCell) then
               OnDrawFooterCell(Self,ACol,FFooterRowCount - RowCount + ARow + FTitleOffset,DrawColumn,ARect,AState);
        end
        else FillRect(ARect);
        //\\\
      finally
        DataLink.ActiveRecord := OldActive;
      end;
      if DefaultDrawing and (gdSelected in AState)
        and ((dgAlwaysShowSelection in Options) or Focused)
        and not (csDesigning in ComponentState)
        and not (dgRowSelect in Options)
        and (UpdateLock = 0)
        and (ValidParentForm(Self).ActiveControl = Self) then
        Windows.DrawFocusRect(Handle, ARect);
    end;
  end;

  if (* (gdFixed in AState) and {ddd([dgRowLines, dgColLines] * Options =
    [dgRowLines, dgColLines])} (dghFixed3D in OptionsEh) and
    //ddd
    ((FFooterRowCount = 0) or ((FFooterRowCount > 0) and (ARow <> RowCount - FFooterRowCount - 1 - FTitleOffset)) )
    and ((ACol < 0) or (ARow < 0)) then
    //\\\
    *)
    The3DRect then  
  begin
    InflateRect(ARect, 1, 1);
    if Down then begin
      DrawEdge(Canvas.Handle, ARect, BDR_SUNKENINNER, BF_BOTTOMRIGHT);
      DrawEdge(Canvas.Handle, ARect, BDR_SUNKENINNER, BF_TOPLEFT);
    end else begin
      DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_BOTTOMRIGHT);
      DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_TOPLEFT);
    end;
  end;

  if (ARow < 0) and (ACol >= 0) and (FUseMultiTitle = True) then
  with DrawColumn.Title do begin // Draw mastertitle
    Canvas.Brush.Color := FixedColor;
    if(FLeafFieldArr[ACol].FLeaf.Host <> nil) and (FLeafFieldArr[ACol].FLeaf.Host.Drawed = False) then begin
       DrawHost(FLeafFieldArr[ACol].FLeaf,ARect,EndEllipsis);
    end;
  end;
end;


procedure TCustomDBGridEh.DrawDataCell(const Rect: TRect; Field: TField;
  State: TGridDrawState);
begin
  if Assigned(FOnDrawDataCell) then FOnDrawDataCell(Self, Rect, Field, State);
end;

procedure TCustomDBGridEh.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TColumnEh; State: TGridDrawState);
begin
  if Assigned(OnDrawColumnCell) then
    OnDrawColumnCell(Self, Rect, DataCol, Column, State);
end;

procedure TCustomDBGridEh.EditButtonClick;
begin
  if Assigned(FOnEditButtonClick) then FOnEditButtonClick(Self);
end;

procedure TCustomDBGridEh.EditingChanged;
begin
  if dgIndicator in Options then InvalidateCell(0, FSelRow);
end;

procedure TCustomDBGridEh.EndLayout;
begin
  if FLayoutLock > 0 then
  begin
    try
      try
        if FLayoutLock = 1 then
          InternalLayout;
      finally
        if FLayoutLock = 1 then
          FColumns.EndUpdate;
      end;
    finally
      Dec(FLayoutLock);
      EndUpdate;
    end;
  end;
end;

procedure TCustomDBGridEh.EndUpdate;
begin
  if FUpdateLock > 0 then
    Dec(FUpdateLock);
end;

function TCustomDBGridEh.GetColField(DataCol: Integer): TField;
begin
  Result := nil;
  if (DataCol >= 0) and FDatalink.Active and (DataCol < Columns.Count) then
    Result := Columns[DataCol].Field;
end;

function TCustomDBGridEh.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TCustomDBGridEh.GetEditLimit: Integer;
begin
  Result := 0;

  //ddd
   if {not} (Assigned(Columns[SelectedIndex].KeyList) and (Columns[SelectedIndex].KeyList.Count > 0)) {ddd\\\} then

   else
  //\\\
   if Assigned(SelectedField) and (SelectedField.DataType = ftString) then
     Result := SelectedField.Size;
end;

function TCustomDBGridEh.GetEditMask(ACol, ARow: Longint): string;
begin
  Result := '';
  if FDatalink.Active then
  with Columns[RawToDataColumn(ACol)] do
    if Assigned(Field) {ddd//} and not (Assigned(KeyList) and (KeyList.Count > 0)) {ddd\\\} then
      Result := Field.EditMask;
end;

function TCustomDBGridEh.GetEditText(ACol, ARow: Longint): string;
//ddd
var KeyIndex: Integer;
//\\\
begin
  Result := '';
  if FDatalink.Active then
  with Columns[RawToDataColumn(ACol)] do
    if Assigned(Field) then begin
      //ddd
        if Assigned(KeyList)  and (KeyList.Count > 0) then begin
          KeyIndex := KeyList.IndexOf(Field.Text);
          if (KeyIndex > -1) and (KeyIndex < PickList.Count) then
            Result := PickList.Strings[KeyIndex];
        end
        else if (DrawMemoText = True) and (Field.DataType = ftMemo) then
              Result := AdjustLineBreaks(Field.AsString)
        else
      //\\\
        Result := Field.Text;
      if (Field.FieldKind = fkLookup) and (Field.KeyFields <> '') then begin
        FEditKeyValue := Field.DataSet.FieldByName(Field.KeyFields).Value;
      end
      else FEditKeyValue := NULL;
    end;
  FEditText := Result;
end;

function TCustomDBGridEh.GetFieldCount: Integer;
begin
  Result := FDatalink.FieldCount;
end;

function TCustomDBGridEh.GetFields(FieldIndex: Integer): TField;
begin
  Result := FDatalink.Fields[FieldIndex];
end;

function TCustomDBGridEh.GetFieldValue(ACol: Integer): string;
var
  Field: TField;
begin
  Result := '';
  Field := GetColField(ACol);
  if Field <> nil then Result := Field.DisplayText;
end;

function TCustomDBGridEh.GetSelectedField: TField;
var
  Index: Integer;
begin
  Index := SelectedIndex;
  if Index <> -1 then
    Result := Columns[Index].Field
  else
    Result := nil;
end;

function TCustomDBGridEh.GetSelectedIndex: Integer;
begin
  Result := RawToDataColumn(Col);
end;

function TCustomDBGridEh.HighlightCell(DataCol, DataRow: Integer;
  const Value: string; AState: TGridDrawState): Boolean;
var
  Index: Integer;
begin
  Result := False;
  if (dgMultiSelect in Options) and Datalink.Active then
    Result := FBookmarks.Find(Datalink.Datasource.Dataset.Bookmark, Index);
  if not Result then
    Result := ((gdSelected in AState) {ddd//}or ((DataRow + FTitleOffset) = Row ) and (dgRowSelect in Options))
      and ((dgAlwaysShowSelection in Options) or (Focused {ddd//}and (dghHighlightFocus in OptionsEh)))
        { updatelock eliminates flicker when tabbing between rows }
      and ((UpdateLock = 0) or (dgRowSelect in Options));
end;


procedure TCustomDBGridEh.ClearSelection;
begin
  if (dgMultiSelect in Options) {ddd//}and (dghClearSelection in OptionsEh) {ddd\\} then
  begin
    FBookmarks.Clear;
    FSelecting := False;
  end
  {ddd//}
  else FSelecting := False;
  {ddd\\};
end;

procedure TCustomDBGridEh.DoSelection(Select: Boolean; Direction: Integer; MaxDirection: Boolean);
var
  AddAfter: Boolean;
  DisabledControls: Boolean;
begin
  AddAfter := False;
  DisabledControls := False;
  BeginUpdate;
  try
    if ((Abs(Direction) >= FDataLink.RecordCount) or MaxDirection) and
       (((Direction > 0) and not DataSource.DataSet.EOF) or
        ((Direction < 0) and not DataSource.DataSet.BOF)) then begin
      DisabledControls := True;
      DataSource.DataSet.DisableControls;
    end;
    try
      while (Direction <> 0) {or (MaxDirection and not FDatalink.EOF and not FDatalink.BOF)} do begin
        if (dgMultiSelect in Options) and FDatalink.Active then
          if Select {ddd and (ssShift in Shift)} then
          begin
            if not FSelecting then
            begin
              FSelectionAnchor := FBookmarks.CurrentRow;
              {ddd//}
              FSelectionAnchorSelected := FBookmarks.CurrentRowSelected;
              if FAntiSelection then
                 FBookmarks.CurrentRowSelected := not FSelectionAnchorSelected
              else
              {ddd\\\}
                FBookmarks.CurrentRowSelected := True;
              FSelecting := True;
              AddAfter := True;
            end
            else
            with FBookmarks do
            begin
              AddAfter := Compare(CurrentRow, FSelectionAnchor) <> -(Direction div Abs(Direction));
              if not AddAfter then
              //ddd
                if FAntiSelection then
                 CurrentRowSelected := FSelectionAnchorSelected else
              //\\\
                CurrentRowSelected := False;
            end
          end
          else
            ClearSelection;
        if FDatalink.Dataset.MoveBy(Direction div Abs(Direction)) = 0 then Exit;
//ddd      if AddAfter then FBookmarks.CurrentRowSelected := True;
        if AddAfter then
          if FAntiSelection then
            FBookmarks.CurrentRowSelected := not FSelectionAnchorSelected
          else
            FBookmarks.CurrentRowSelected := True;
        if not MaxDirection then
          if (Direction > 0) then Dec(Direction) else Inc(Direction);
      end;
//ddd\\\
    finally
      if DisabledControls then DataSource.DataSet.EnableControls;
    end;
  finally
    EndUpdate;
  end;
end;


procedure TCustomDBGridEh.KeyDown(var Key: Word; Shift: TShiftState);
var
  KeyDownEvent: TKeyEvent;

(*  procedure ClearSelection;
  begin
    if (dgMultiSelect in Options) {ddd//}and (dghClearSelection in OptionsEh) {ddd\\} then
    begin
      FBookmarks.Clear;
      FSelecting := False;
    end
    {ddd//}
    else FSelecting := False;
    {ddd\\};
  end;

  procedure DoSelection(Select: Boolean; Direction: Integer);
  var
    AddAfter: Boolean;
  begin
    AddAfter := False;
    BeginUpdate;
    try
      if (dgMultiSelect in Options) and FDatalink.Active then
        if Select {ddd and (ssShift in Shift)} then
        begin
          if not FSelecting then
          begin
            FSelectionAnchor := FBookmarks.CurrentRow;
            {ddd//}
            FSelectionAnchorSelected := FBookmarks.CurrentRowSelected;
            if not (dghClearSelection in OptionsEh) then
               FBookmarks.CurrentRowSelected := not FSelectionAnchorSelected
            else
            {ddd\\\}
              FBookmarks.CurrentRowSelected := True;
            FSelecting := True;
            AddAfter := True;
          end
          else
          with FBookmarks do
          begin
            AddAfter := Compare(CurrentRow, FSelectionAnchor) <> -Direction;
            if not AddAfter then
            //ddd
              if not (dghClearSelection in OptionsEh) then
               CurrentRowSelected := FSelectionAnchorSelected else
            //\\\
              CurrentRowSelected := False;
          end
        end
        else
          ClearSelection;
//ddd
      while Direction <> 0 do begin
         FDatalink.Dataset.MoveBy(Direction);
         if Direction > 0 then Dec(Direction) else Inc(Direction);
      end;
     //ddd  FDatalink.Dataset.MoveBy(Direction);
//ddd      if AddAfter then FBookmarks.CurrentRowSelected := True;
      if AddAfter then
       if not (dghClearSelection in OptionsEh) then
         FBookmarks.CurrentRowSelected := not FSelectionAnchorSelected
       else
         FBookmarks.CurrentRowSelected := True;
//ddd\\\

    finally
      EndUpdate;
    end;
  end;
*)
  procedure NextRow(Select: Boolean);
  begin
    with FDatalink.Dataset do
    begin
      if (State = dsInsert) and not Modified and not FDatalink.FModified then
        if EOF then Exit else Cancel
      else {ddd//} if ssShift in Shift then
        DoSelection(Select, 1,False)
      {ddd//} else begin DoSelection(False, 1,False) end;
      if EOF and CanModify and (not ReadOnly) and (dgEditing in Options) then
        Append;
    end;
  end;

  procedure PriorRow(Select: Boolean);
  begin
    with FDatalink.Dataset do
      if (State = dsInsert) and not Modified and EOF and
        not FDatalink.FModified then
        Cancel
      else {ddd//} if ssShift in Shift then
        DoSelection(Select, -1,False)
      {ddd//} else begin DoSelection(False, -1,False) end;
  end;

  procedure Tab(GoForward: Boolean);
  var
    ACol, Original: Integer;
  begin
    ACol := Col;
    Original := ACol;
    BeginUpdate;    { Prevent highlight flicker on tab to next/prior row }
    try
      while True do
      begin
        if GoForward then
          Inc(ACol) else
          Dec(ACol);
        if ACol >= ColCount then
        begin
          NextRow(False);
          ACol := {//dddFIndicatorOffset} FixedCols {\\\};
        end
        else if ACol < {//dddFIndicatorOffset} FixedCols {\\\} then
        begin
          PriorRow(False);
          ACol := ColCount {d/}-FIndicatorOffset{\};
        end;
        if ACol = Original then Exit;
        if TabStops[ACol] then
        begin
          MoveCol(ACol,0);
          Exit;
        end;
      end;
    finally
      EndUpdate;
    end;
  end;

  function DeletePrompt: Boolean;
  var
    Msg: string;
  begin
    if (FBookmarks.Count > 1) then
      Msg := SDeleteMultipleRecordsQuestion
    else
      Msg := SDeleteRecordQuestion;
    Result := not (dgConfirmDelete in Options) or
      (MessageDlg(Msg, mtConfirmation, mbOKCancel, 0) <> idCancel);
  end;

const
  RowMovementKeys = [VK_UP, VK_PRIOR, VK_DOWN, VK_NEXT, VK_HOME, VK_END];

begin
  KeyDownEvent := OnKeyDown;
  {ddd//} FAntiSelection := (ssCtrl in Shift) or not (dghClearSelection in OptionsEh);
  if Assigned(KeyDownEvent) then KeyDownEvent(Self, Key, Shift);
  if not FDatalink.Active or not CanGridAcceptKey(Key, Shift) then Exit;
  with FDatalink.DataSet do
    if ssCtrl in Shift then
    begin
      if (Key in RowMovementKeys) and not (ssShift in Shift) then ClearSelection;
      case Key of
        VK_UP, VK_PRIOR: {d/} if (ssShift in Shift) and (dgMultiSelect in Options) then
                                 DoSelection(True,-FDatalink.ActiveRecord,False)
                               else {d\} MoveBy(-FDatalink.ActiveRecord);
        VK_DOWN, VK_NEXT: {d/} if (ssShift in Shift) and (dgMultiSelect in Options) then
                                 DoSelection(True,FDatalink.BufferCount - FDatalink.ActiveRecord - 1,False)
                               else {d\} MoveBy(FDatalink.BufferCount - FDatalink.ActiveRecord - 1);
//ddd        VK_LEFT: MoveCol(FIndicatorOffset);
        VK_LEFT: MoveCol({//dddFIndicatorOffset} FixedCols {\\\},1);
        VK_RIGHT: MoveCol(ColCount - 1,-1);
        VK_HOME: {d/} if (ssShift in Shift) and (dgMultiSelect in Options) then
                        DoSelection(True,-1,True)
                      else {d\} First;
        VK_END:  {d/} if (ssShift in Shift) and (dgMultiSelect in Options) then
                        DoSelection(True,1,True)
                      else {d\} Last;
        VK_DELETE:
          if (not ReadOnly) and not IsEmpty
            and CanModify and DeletePrompt then
          if FBookmarks.Count > 0 then
            FBookmarks.Delete
          else
            Delete;
      end
    end
    else
      case Key of
        VK_UP: PriorRow(True);
        VK_DOWN: NextRow(True);
        VK_LEFT:
          if dgRowSelect in Options then begin
            // ddd
             if(LeftCol > {//dddIndicatorOffset} FixedCols {\\\}) then LeftCol := LeftCol - 1
          end
            // ddd
            {PriorRow(False)} else
            MoveCol(Col - 1,-1);
        VK_RIGHT:
          if dgRowSelect in Options then begin
            // ddd
                if(VisibleColCount + LeftCol < ColCount ) then
                    LeftCol := LeftCol + 1;  {new}

           { NextRow(False) }
            //\\\
           end else
            MoveCol(Col + 1,1);
        VK_HOME:
          if (ColCount = FIndicatorOffset+1)
            or (dgRowSelect in Options) then
          begin
            //ddd
            if (ssShift in Shift) and (dgMultiSelect in Options) then
              DoSelection(True,-1,True)
            else begin
              ClearSelection;
              First;
            end;
            //\\\
            //ddd ClearSelection;
            //ddd First;
          end
          else
            MoveCol(FIndicatorOffset,1);
        VK_END:
          if (ColCount = FIndicatorOffset+1)
            or (dgRowSelect in Options) then
          begin
            //ddd
            if (ssShift in Shift) and (dgMultiSelect in Options) then
              DoSelection(True,1,True)
            else begin
              ClearSelection;
              Last;
            end;
            //\\\
            //ddd ClearSelection;
            //ddd Last;
          end
          else
            MoveCol(ColCount - 1,-1);
        VK_NEXT:
          begin
            //ddd
            if (ssShift in Shift) and (dgMultiSelect in Options) then
              DoSelection(True,VisibleDataRowCount,False)
            else begin
              ClearSelection;
              MoveBy({ddd//VisibleRowCount} VisibleDataRowCount {ddd\\});
            end;
            //\\\
          end;
        VK_PRIOR:
          begin
            //ddd
            if (ssShift in Shift) and (dgMultiSelect in Options) then
              DoSelection(True,-VisibleDataRowCount,False)
            else begin
              ClearSelection;
              MoveBy({ddd//VisibleRowCount} -VisibleDataRowCount {ddd\\});
            end;
            //\\\
          end;
        VK_INSERT:
          if CanModify and (not ReadOnly) and (dgEditing in Options) then
          begin
            ClearSelection;
            Insert;
          end;
        VK_TAB: if not (ssAlt in Shift) then Tab(not (ssShift in Shift));
        VK_ESCAPE:
          begin
            FDatalink.Reset;
            ClearSelection;
            if not (dgAlwaysShowEditor in Options) then HideEditor;
          end;
        VK_F2: EditorMode := True;
      end;
  //ddd
  if (Columns[SelectedIndex].GetColumnType in [ctKeyImageList..ctCheckboxes]) and (Key = VK_DELETE) and not (dgRowSelect in Options) then
    if Assigned(Columns[SelectedIndex].Field) and  not Columns[SelectedIndex].Field.Required and Columns[SelectedIndex].CanModify(True) then
         Columns[SelectedIndex].Field.Clear;
  //\\\
end;

procedure TCustomDBGridEh.KeyPress(var Key: Char);
begin
  if not (dgAlwaysShowEditor in Options) and (Key = #13) then
    FDatalink.UpdateData;
  inherited KeyPress(Key);
end;

procedure TCustomDBGridEh.WMChar(var Message: TWMChar);
begin
  {Don't use KeyPress because KeyPress is invoked only after
  first showing of inplace editor}
  if (Columns[SelectedIndex].GetColumnType in [ctKeyImageList..ctCheckboxes]) and
                  ((Char(Message.CharCode) = ' ') and not (dgRowSelect in Options)) then begin
    DoKeyPress(Message);
    if (Char(Message.CharCode) = ' ') then
      if ssShift in KeyDataToShiftState(Message.KeyData) then
        Columns[SelectedIndex].SetNextFieldValue(-1)
      else
        Columns[SelectedIndex].SetNextFieldValue(1);
    Exit;
  end;
  inherited;
end;


{ InternalLayout is called with layout locks and column locks in effect }
procedure TCustomDBGridEh.InternalLayout;
var
  I, J, K: Integer;
  Fld: TField;
  Column: TColumnEh;
  SeenPassthrough: Boolean;
  RestoreCanvas: Boolean;

  tm: TTEXTMETRIC;
  CW, {LineW, OldRow0,} CountedWidth, FirstInvisibleColumns, ColWidth: Integer;
  AFont:TFont;
  NotInWidthRange:Boolean;

  function FieldIsMapped(F: TField): Boolean;
  var
    X: Integer;
  begin
    Result := False;
    if F = nil then Exit;
    for X := 0 to FDatalink.FieldCount-1 do
      if FDatalink.Fields[X] = F then
      begin
        Result := True;
        Exit;
      end;
  end;

begin
  if (csLoading in ComponentState) then Exit;        

  if HandleAllocated then KillMessage(Handle, cm_DeferLayout);

  { Check for Columns.State flip-flop }
  SeenPassthrough := False;
  for I := 0 to FColumns.Count-1 do
  begin
    if (FColumns[I] is TPassthroughColumn) then
      SeenPassthrough := True
    else
      if SeenPassthrough then
      begin   { We have both custom and passthrough columns. Kill the latter }
        for J := FColumns.Count-1 downto 0 do
        begin
          Column := FColumns[J];
          if Column is TPassthroughColumn then
            Column.Free;
        end;
        Break;
      end;
  end;

  FIndicatorOffset := 0;
  if dgIndicator in Options then
    Inc(FIndicatorOffset);
  FDatalink.ClearMapping;
  if FDatalink.Active then DefineFieldMap;
  if FColumns.State = csDefault then
  begin
     { Destroy columns whose fields have been destroyed or are no longer
       in field map }
    if (not FDataLink.Active) and (FDatalink.DefaultFields) then
      FColumns.Clear
    else
      for J := FColumns.Count-1 downto 0 do
        with FColumns[J] do
        if not Assigned(Field)
          or not FieldIsMapped(Field) then Free;
    I := FDataLink.FieldCount;
    if (I = 0) and (FColumns.Count = 0) then Inc(I);
    for J := 0 to I-1 do
    begin
      Fld := FDatalink.Fields[J];
      if Assigned(Fld) then
      begin
        K := J;
         { Pointer compare is valid here because the grid sets matching
           column.field properties to nil in response to field object
           free notifications.  Closing a dataset that has only default
           field objects will destroy all the fields and set associated
           column.field props to nil. }
        while (K < FColumns.Count) and (FColumns[K].Field <> Fld) do
          Inc(K);
        if K < FColumns.Count then
          Column := FColumns[K]
        else
        begin
          Column := TPassthroughColumn.Create(FColumns);
          Column.Field := Fld;
        end;
      end
      else
        Column := TPassthroughColumn.Create(FColumns);
      Column.Index := J;
    end;
  end
  else
  begin
    { Force columns to reaquire fields (in case dataset has changed) }
    for I := 0 to FColumns.Count-1 do
      FColumns[I].Field := nil;
  end;
  //ddd VisbleColumns
  FVisibleColumns.Clear;

  FirstInvisibleColumns := 0;
  for I := 0 to FColumns.Count-1 do
    if FColumns[I].Visible = True then begin
      FVisibleColumns.Add(FColumns[I]);
    end
    else if (FrozenCols + FirstInvisibleColumns> I) then Inc(FirstInvisibleColumns);

  for I := FrozenCols + FirstInvisibleColumns to FColumns.Count-1 do
   if (FColumns[I].Visible = False) then
     Inc(FirstInvisibleColumns)
    else Break;

  if VisibleColumns.Count = 0 then Dec(FirstInvisibleColumns);
  //\\\
  ColCount := FColumns.Count + FIndicatorOffset;
  inherited FixedCols := FIndicatorOffset + FrozenCols + FirstInvisibleColumns;
  FTitleOffset := 0;
  if dgTitles in Options then FTitleOffset := 1;
  RestoreCanvas := not HandleAllocated;
  if RestoreCanvas then
    Canvas.Handle := GetDC(0);
  try
    Canvas.Font := Font;
    J := 3;
    if dgRowLines in Options then
      Inc(J, GridLineWidth);
    K := Canvas.TextHeight('Wg');
    //ddd
    // DefaultRowHeight := K;
    GetTextMetrics(Canvas.Handle, tm);
    if (FNewRowHeight > 0) or (FRowLines > 0) then
      DefaultRowHeight := FNewRowHeight + (tm.tmExternalLeading + tm.tmHeight)*FRowLines
    else
      DefaultRowHeight := K + J;

    if (dghFitRowHeightToText in OptionsEh) then begin
      I := (DefaultRowHeight - J) mod K;
      if (I > K div 2) or ((DefaultRowHeight - J) div K = 0) then
        DefaultRowHeight := ((DefaultRowHeight - J) div K + 1) * K + J
      else
        DefaultRowHeight := (DefaultRowHeight - J) div K * K + J;
      FRowLines := (DefaultRowHeight - J) div K;
      FNewRowHeight := J;
    end;

    if (tm.tmExternalLeading + tm.tmHeight + tm.tmInternalLeading + 4 < DefaultRowHeight) then
      FAllowWordWrap := True
    else
      FAllowWordWrap := False;

    //\\\
    if dgTitles in Options then
    begin
      K := 0;
      for I := 0 to FColumns.Count-1 do
      begin
        Canvas.Font := FColumns[I].Title.Font;
        J := Canvas.TextHeight('Wg') + 4;
        if J > K then K := J;
      end;
      if K = 0 then
      begin
        Canvas.Font := FTitleFont;
        K := Canvas.TextHeight('Wg') + 4;
      end;
      RowHeights[0] := K;
    end;
  finally
    if RestoreCanvas then
    begin
      ReleaseDC(0,Canvas.Handle);
      Canvas.Handle := 0;
    end;
  end;

   // ScrollBars
   if (not AutoFitColWidths or (csDesigning in ComponentState)) and HorzScrollBar.Visible then
      ScrollBars := ssHorizontal
   else ScrollBars := ssNone;

  // AutoFitColWidths
//  LineW := iif(dgColLines in Options,1,0);
  SetColumnAttributes;
  if (FAutoFitColWidths = True) and not (csDesigning in ComponentState) then begin
  
    for i := 0 to VisibleColumns.Count - 1 do VisibleColumns[i].FNotInWidthRange := False;

    CountedWidth := 0;
    CW := 0;

    for j := 0 to VisibleColumns.Count - 1 do begin
      CW := 0;
      K := 0;

      UpdateScrollBar;
      
      for i := 0 to VisibleColumns.Count - 1 do begin
        if (VisibleColumns[i].AutoFitColWidth = False) or (VisibleColumns[i].FNotInWidthRange = True) then
          Inc(CW,VisibleColumns[i].Width)
        else
          Inc(K, VisibleColumns[i].FInitWidth);
      end;


      if (ClientWidth > FMinAutoFitWidth) then CW := ClientWidth - CW else CW := FMinAutoFitWidth - CW;
      if (CW < 0) then CW := 0;
      if (dgIndicator in Options) then Dec(CW,ColWidths[0]);
      if (dgColLines in Options) then Dec(CW,VisibleColumns.Count);
      if (dgIndicator in Options) and (dgColLines in Options) then Dec(CW,1);

      CountedWidth := 0;
      NotInWidthRange := False;

      for i := 0 to VisibleColumns.Count - 1 do begin
       if (VisibleColumns[i].AutoFitColWidth = True) and (VisibleColumns[i].FNotInWidthRange = False) then begin
         ColWidth := MulDiv(VisibleColumns[i].FInitWidth,CW,K);
         VisibleColumns[i].Width := ColWidth;
         if (ColWidth <> VisibleColumns[i].Width) then begin
           NotInWidthRange := True;
           VisibleColumns[i].FNotInWidthRange := True;
         end;
//         if (VisibleColumns[i].Width < 0) then VisibleColumns[i].Width := 0;
         Inc(CountedWidth,VisibleColumns[i].Width);
       end;
      end;

      if (NotInWidthRange = False) then Break;
    end;

    if (CountedWidth <> CW) then begin // Correct last AutoFitColWidth column
      for i := VisibleColumns.Count - 1 downto 0 do
       if (VisibleColumns[i].AutoFitColWidth = True) and (VisibleColumns[i].FNotInWidthRange = False) then begin
         VisibleColumns[i].Width := VisibleColumns[i].Width + CW - CountedWidth;
         if (VisibleColumns[i].Width < 0) then VisibleColumns[i].Width := 0;
         Break;
       end;
    end;
  end;

  // Title and MultyTitle
  if  (dgTitles in Options) then begin
    if (TitlEheight <> 0) or (TitleLines <> 0) then begin
      K := 0;
      for I := 0 to Columns.Count-1 do
      begin
        Canvas.Font := Columns[I].Title.Font;
        J := Canvas.TextHeight('Wg') + 4;
        if J > K then begin K := J; GetTextMetrics(Canvas.Handle, tm); end;
      end;
      if K = 0 then
      begin
       Canvas.Font := TitleFont;
       GetTextMetrics(Canvas.Handle, tm);
      end;

      FTitlEheightFull :=  tm.tmExternalLeading + tm.tmHeight*FTitleLines+2 +
                                FTitlEheight;

      if dgRowLines in Options then
          FTitlEheightFull := FTitlEheightFull + 1;


//      OldRow0 := RowHeights[0];
      RowHeights[0] := FTitlEheightFull;
    end;

    if(UseMultiTitle = True) then begin
      ReallocMem(FLeafFieldArr,SizeOf(LeafCol)*Columns.Count);
      AFont := Canvas.Font;
      Canvas.Font := TitleFont;
      for i := 0 to Columns.Count - 1 do
         FLeafFieldArr[i].FColumn := Columns[i];
      FHeadTree.CreateFieldTree(Self);
      RowHeights[0] := SetChildTreEheight(FHeadTree) - iif(dghFixed3D in OptionsEh,1,3); // +2;
      Canvas.Font := AFont;
    end;
  end;


  //tmp UpdateRowCount;
  SetColumnAttributes;
  UpdateRowCount;
  UpdateActive;
  Invalidate;
end;

procedure TCustomDBGridEh.LayoutChanged;
begin
  if AcquireLayoutLock then
    EndLayout;
end;

procedure TCustomDBGridEh.LinkActive(Value: Boolean);
begin
  if not Value then HideEditor;
  FBookmarks.LinkActive(Value);
  LayoutChanged;
  //dddUpdateScrollBar;
  if Value and (dgAlwaysShowEditor in Options) then ShowEditor;
  //ddd
  if (Assigned(DataSource)) then
    SumList.DataSet := DataSource.DataSet
  else
    SumList.DataSet := nil;
  UpdateScrollBar;  
  //\\\
end;

procedure TCustomDBGridEh.Loaded;
var i:Integer;
begin
  inherited Loaded;
  if FColumns.Count > 0 then begin
    ColCount := FColumns.Count;
  //ddd
    if (FAutoFitColWidths = True) and not (csDesigning in ComponentState) then  begin
      Columns.BeginUpdate;
      for i := 0  to Columns.Count - 1 do begin
          Columns[i].FInitWidth := Columns[i].Width;
      end;
      Columns.EndUpdate;

      ScrollBars := ssNone;
    end;
    SetSortMarkedColumns;
    if SortMarkedColumns.Count > 0 then DoSortMarkingChanged; 
  //\\\
  end;
  //ddd
  if Assigned(DataSource) then
//    FSumList.DataSet := DataSource.DataSet;
    FSumList.Loaded;
  //\\\
  LayoutChanged;
  DeferLayout;
end;

//ddd
function PointInRect(const P: TPoint; const R: TRect): Boolean;
begin
  with R do
    Result := (Left <= P.X) and (Top <= P.Y) and
      (Right >= P.X) and (Bottom >= P.Y);
end;
//\\\

procedure TCustomDBGridEh.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  Cell: TGridCoord;
  OldCol,OldRow, Xm,Ym: Integer;
  EnableClick: Boolean;
  ARect:TRect;
  Flag: Boolean;
  MouseDownEvent: TMouseEvent;
//ddd  MCoor:TPoint;
  //ddd
  AEditStyle:TEditStyle;
  APointInRect:Boolean;
  TargetWC:TWinControl;
  //\\\
begin
  //ddd
  Xm := X; Ym := Y;
  FPressedCell.X := -1; FPressedCell.Y := -1;
  FMousePos := Point(X, Y);
  //\\\
  if not AcquireFocus then Exit;
  if (ssDouble in Shift) and (Button = mbLeft) then
  begin
    DblClick;
    //ddd
    Cell := MouseCoord(X, Y);
    if (Cell.X > IndicatorOffset-1) and (Cell.Y > FTitleOffset-1) and (Cell.Y < iif(FooterRowCount > 0,RowCount-FooterRowCount-1,MaxInt)) and
       (Columns[Cell.X - IndicatorOffset].GetColumnType in [ctKeyImageList..ctCheckboxes]) then begin
      if Columns[Cell.X - IndicatorOffset].DblClickNextVal and (ssDouble in Shift)
      then
       if (ssShift in Shift) then
         Columns[Cell.X - IndicatorOffset].SetNextFieldValue(-1)
       else
         Columns[Cell.X - IndicatorOffset].SetNextFieldValue(1);
    end;

    MouseDownEvent := OnMouseDown;
    if Assigned(MouseDownEvent) then MouseDownEvent(Self, Button, Shift, X, Y);
    //\\\
    Exit;
  end;
  if Sizing(X, Y) then
  begin
    FDatalink.UpdateData;
    inherited MouseDown(Button, Shift, X, Y)
  end
  else
  begin
    Cell := MouseCoord(X, Y);
    ARect := CellRect(Cell.X,Cell.Y);

    //ddd
    if (FUseMultiTitle =  True) and (dgTitles in Options) then begin
      if (Cell.X > IndicatorOffset-1) and
        (PtInRect(Rect(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom - FLeafFieldArr[Cell.X-IndicatorOffset].FLeaf.Height + 1),
                  Point(X, Y))) then
       Flag := False
      else
       Flag := True;
    end else Flag := True;
    if {tmp(Datalink <> nil) and Datalink.Active and}
      (Cell.Y < TitleOffset) and (Cell.X >= IndicatorOffset) and
      not (csDesigning in ComponentState) and Flag
    then
    begin
      if (dgColumnResize in Options) and (Button = mbRight) then begin
        Button := mbLeft;
        FSwapButtons := True;
        MouseCapture := True;
      end
      else if Button = mbLeft then begin
        EnableClick := Columns[Cell.X - IndicatorOffset].Title.TitleButton;
        CheckTitleButton(Cell.X - IndicatorOffset, EnableClick);
        if EnableClick then begin
          MouseCapture := True;
          FTracking := True;
          FPressedCol := Cell.X;
          TrackButton(X, Y);
          Exit;
        end;
      end;
    end;
    //\\\

    if ((csDesigning in ComponentState) or (dgColumnResize in Options)) and
      (Cell.Y < FTitleOffset) then
    begin
      //d
      if (Cell.X < FIndicatorOffset) and (dgMultiSelect in Options) and (Cell.Y <> -1) then
        if FBookmarks.Count > 0 then begin
          FBookmarks.Clear;
          FSelecting := False;
        end else
          FBookmarks.SelectAll;
      //d\
      FDataLink.UpdateData;
      inherited MouseDown(Button, Shift, X, Y)
    end
    else
    //ddd
    if Cell.Y < iif(FooterRowCount > 0,RowCount-FooterRowCount-1,MaxInt) then
    //\\\
    begin
      if FDatalink.Active then
        with Cell do
        begin
          BeginUpdate;   { eliminates highlight flicker when selection moves }
          try
            HideEditor;
            OldCol := Col;
            OldRow := Row;
            if (Y >= FTitleOffset) and (Y - Row <> 0) then
              if not ((ssAlt in Shift) and (ssShift in Shift) and (dgMultiSelect in Options)) then
                FDatalink.Dataset.MoveBy(Y - Row);
            if X >= FIndicatorOffset then
              MoveCol(X,0);
            //ddd
            if PtInRect(DataRect,Point(Xm,Ym)) and
                (not (dgMultiSelect in Options) or
                  ((dgMultiSelect in Options) and not (dgRowSelect in Options))) then
            begin
              MouseCapture := True;
              FTracking := True;
              FDataTracking := True;
              if not (ssCtrl in Shift) and (dghClearSelection in OptionsEh) and (Button = mbLeft) then FBookmarks.Clear;
             end;
            //\\\
            if (dgMultiSelect in Options) and FDatalink.Active {ddd//}
                 and ((dgRowSelect in Options) or (X < FIndicatorOffset)) then
              with FBookmarks do
              begin
                FSelecting := False;
                if (ssAlt in Shift) and (ssShift in Shift) and (Y - Row <> 0) then begin
                  FSelecting := True;
                  FAntiSelection := True;
                  DoSelection(True, Y-Row,False);
                end
                else
                if ((ssCtrl in Shift) or not (dghClearSelection in OptionsEh)) and (Button = mbLeft) then
                  CurrentRowSelected := not CurrentRowSelected
                else
                begin
                  //ddd
                  if (Button = mbLeft) {not ((Button = mbRight) and (CurrentRowSelected = True))} then begin
                  //\\\
                    if dghClearSelection in OptionsEh then Clear;
                    CurrentRowSelected := True;
                  end;
                end;
                //ddd
                if (dgRowSelect in Options) or
                   ((X < FIndicatorOffset) and not (dgRowSelect in Options)) then begin
                  FIndicatorPressed := True;
                  MouseCapture := True;
                  FTracking := True;
                  FPresedRecord := DataSource.DataSet.Bookmark;
                  FSelecting := True;
                  FSelectionAnchorSelected := not CurrentRowSelected;
                  FSelectionAnchor := FBookmarks.CurrentRow;
                  FAntiSelection := (ssCtrl in Shift) or not (dghClearSelection in OptionsEh);
                end;
                //\\\
              end;
// ddd
(*            if (Button = mbLeft) and
              (((X = OldCol) and (Y = OldRow)) or (dgAlwaysShowEditor in Options)) then begin
                ShowEditor;         { put grid in edit mode }*)
            if (Button = mbLeft) then begin
               if (Cell.X > IndicatorOffset-1) and (Columns[Cell.X - IndicatorOffset].AlwaysShowEditButton) then
                 AEditStyle := GetColumnEditStile(Columns[Cell.X - IndicatorOffset])
               else AEditStyle := esSimple;

               APointInRect := PointInRect(Point(Xm,Ym),Rect(ARect.Right - FInplaceEditorButtonWidth ,ARect.Top,ARect.Right,ARect.Bottom));
               if (dgAlwaysShowEditor in Options) or ((AEditStyle <> esSimple) and APointInRect) or ((X = OldCol) and (Y = OldRow)) then
                 ShowEditor;

               if (InplaceEditor <> nil) and InplaceEditor.Visible and
                   APointInRect and (Y >= FTitleOffset) and (X >= FIndicatorOffset) then
               begin
                 StopTracking;
                 TargetWC := FindVCLWindow(ClientToScreen(Point(Xm,Ym)));
                 if (TargetWC <> nil) and (TargetWC <> Self) then
                   TargetWC.Perform(WM_LBUTTONDOWN,MK_LBUTTON,
                       Longint(PointToSmallPoint(TargetWC.ScreenToClient(ClientToScreen(Point(Xm,Ym))))));
               end;


               if (Cell.X > IndicatorOffset-1) and
                  (Columns[Cell.X - IndicatorOffset].GetColumnType in [ctKeyImageList..ctCheckboxes]) then
                 FPressedCell := Cell;

{                if ((dgAlwaysShowEditor in Options) and (InplaceEditor <> nil) and (InplaceEditor.Visible)) then
                   InplaceEditor.Perform(WM_LBUTTONDOWN,MK_LBUTTON,
                     Longint(PointToSmallPoint(InplaceEditor.ScreenToClient(ClientToScreen(Point(Xm,Ym))))));}
//\\\
              end
            else
              InvalidateEditor;  { draw editor, if needed }
          finally
            EndUpdate;
          end;
        end;
      //ddd
      MouseDownEvent := OnMouseDown;
      if Assigned(MouseDownEvent) then MouseDownEvent(Self, Button, Shift, X, Y);
      //\\\
    end else begin
      //ddd
      MouseDownEvent := OnMouseDown;
      if Assigned(MouseDownEvent) then MouseDownEvent(Self, Button, Shift, X, Y);
      //\\\
    end;
  end;
end;

//ddd
procedure TCustomDBGridEh.MouseMove(Shift: TShiftState; X, Y: Integer);
var Cell:TGridCoord;
    X1,Y1:Integer;
    WithSeleting:Boolean;
begin
  if (FTracking) and (FPressedCol <> -1) then begin
    TrackButton(X, Y);
    if (Abs(FMousePos.X - X) > 3) and (dgColumnResize in Options) then begin
      StopTracking;
 //     Perform(WM_LBUTTONDOWN,MK_LBUTTON,MakeWord(FMousePos.X,FMousePos.Y));
      if csCaptureMouse in ControlStyle then MouseCapture := True;
//      if csClickEvents in ControlStyle then Include(ControlState, csClicked);
      inherited MouseDown(mbLeft, Shift, FMousePos.X, FMousePos.Y);
    end;
  end;
  if FIndicatorPressed or FDataTracking then begin
    X1 := X; Y1 := Y;
    if X1 < 0 then X1 := 0;
    if X1 >= GridWidth then X1 := GridWidth-1;
    if Y1 < 0 then Y1 := 0;
    if Y1 >= GridHeight then Y1 := GridHeight-1;
    Cell := MouseCoord(X1, Y1);
    if (Y > DataRect.Top) and (Y < DataRect.Bottom) then begin
      WithSeleting := ssLeft in Shift;
      if (Cell.Y < Row) then
         DoSelection(WithSeleting, Cell.Y-Row,False)
      else if (Cell.Y > Row) then
        DoSelection(WithSeleting, Cell.Y-Row,False);
    end;
    if FDataTracking and (X > DataRect.Left) and (X < DataRect.Right) and (Cell.X <> Col) then begin
      MoveCol(Cell.X,0);
    end;
    FMousePos := Point(X, Y);
    FMouseShift := Shift;
    TimerScroll;
  end;
  {if FDataTracking then begin
    Cell := MouseCoord(X, Y);
    if PtInRect(DataRect,Point(Cell.X,Cell.Y));
    TimerScroll;
  end;}
  inherited MouseMove(Shift, X, Y);
end;
//

procedure TCustomDBGridEh.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  Cell: TGridCoord;
  SaveState: TGridState;

  DoClick: Boolean;
  ACol: Longint;
  ARect:TRect;

begin
  SaveState := FGridState;
  //FIndicatorPressed := False;
  FSelecting := False;
//ddd
  if (GetCursor = Screen.Cursors[crVSplit]) then FDefaultRowChanged := True;  // Отпустил после ресайза строки

  ///rx
  if FTracking and (FPressedCol >= 0) then begin
    Cell := MouseCoord(X, Y);
    DoClick := PtInRect(Rect(0, 0, ClientWidth, ClientHeight), Point(X, Y))
      and (Cell.Y = 0) and (Cell.X = FPressedCol);
    if (FUseMultiTitle = True) and DoClick then begin
      ARect := CellRect(Cell.X,Cell.Y);
      DoClick := not (PtInRect(Rect(ARect.Left, ARect.Top,
                      ARect.Right, ARect.Bottom - FLeafFieldArr[Cell.X-IndicatorOffset].FLeaf.Height + 1),
                        Point(X, Y)));
    end;
    StopTracking;
    if DoClick then begin
      ACol := Cell.X;
      if (dgIndicator in Options) then Dec(ACol);
      if {tmp(DataLink <> nil) and DataLink.Active and} (ACol >= 0) and
        (ACol < Columns.Count) then
      begin
        DoTitleClick(ACol, Columns[ACol]);
        FSortMarking := ssCtrl in Shift;
        if (dghAutoSortMarking in OptionsEh) then Columns[ACol].Title.SetNextSortMarkerValue(FSortMarking);
        if not FSortMarking then DoSortMarkingChanged;
      end;
    end;
  end
  else if FSwapButtons then begin
    FSwapButtons := False;
    MouseCapture := False;
    if Button = mbRight then Button := mbLeft;
  end;
  //\rx

  if FIndicatorPressed or FDataTracking then StopTracking;
//\\\

  inherited MouseUp(Button, Shift, X, Y);
  if (SaveState = gsRowSizing) or (SaveState = gsColSizing) or
    ((InplaceEditor <> nil) and (InplaceEditor.Visible) and
     (PtInRect(InplaceEditor.BoundsRect, Point(X,Y)))) then Exit;
  Cell := MouseCoord(X,Y);
  if (Button = mbLeft) and (Cell.X >= FIndicatorOffset) and (Cell.Y >= 0) then
    if Cell.Y < FTitleOffset then
      TitleClick(Columns[RawToDataColumn(Cell.X)])
    else
      CellClick(Columns[SelectedIndex]);
//ddd
  FDefaultRowChanged := False;
  if (FPressedCell.X = Cell.X) and (FPressedCell.Y = Cell.Y) and
    (Cell.X > IndicatorOffset-1) and (Columns[Cell.X - IndicatorOffset].GetColumnType in [ctKeyImageList..ctCheckboxes]) then
    if not Columns[Cell.X - IndicatorOffset].DblClickNextVal and not (ssDouble in Shift)
    then
      if (ssShift in Shift) then
        Columns[Cell.X - IndicatorOffset].SetNextFieldValue(-1)
      else
        Columns[Cell.X - IndicatorOffset].SetNextFieldValue(1);
//\\\
end;

procedure TCustomDBGridEh.MoveCol(RawCol, Direction: Integer);
var
  OldCol: Integer;
begin
(*  FDatalink.UpdateData;
  if RawCol >= ColCount then
    RawCol := ColCount - 1;
  if RawCol < FIndicatorOffset + {ddd}FrozenCols then RawCol := FIndicatorOffset + {ddd}FrozenCols;
  OldCol := Col;
  if RawCol <> OldCol then
  begin
    if not FInColExit then
    begin
      FInColExit := True;
      try
        ColExit;
      finally
        FInColExit := False;
      end;
      if Col <> OldCol then Exit;
    end;
    if not (dgAlwaysShowEditor in Options) then HideEditor;
    {tmp}//Col := RawCol;
    {tmp}if not (dgRowSelect in Options) then Col := RawCol;
    ColEnter;
  end;
*)
  FDatalink.UpdateData;
  if RawCol >= ColCount then
    RawCol := ColCount - 1;
  if RawCol < {//dddFIndicatorOffset} FixedCols {\\\} then RawCol := {//dddFIndicatorOffset} FixedCols {\\\};
  if Direction <> 0 then
  begin
    while (RawCol < ColCount) and (RawCol >= {//dddFIndicatorOffset} FixedCols) and
      (ColWidths[RawCol] <= 0) do
      Inc(RawCol, Direction);
    if (RawCol >= ColCount) or (RawCol < {//dddFIndicatorOffset} FixedCols) then Exit;
  end;
  OldCol := Col;
  if RawCol <> OldCol then
  begin
    if not FInColExit then
    begin
      FInColExit := True;
      try
        ColExit;
      finally
        FInColExit := False;
      end;
      if Col <> OldCol then Exit;
    end;
    if not (dgAlwaysShowEditor in Options) then HideEditor;
    {tmp}//Col := RawCol;
    {tmp}if not (dgRowSelect in Options) then Col := RawCol;
    if not (Columns[SelectedIndex].GetColumnType in [ctKeyImageList..ctCheckboxes])
         and (dgAlwaysShowEditor in Options) then ShowEditor;
    ColEnter;
  end;
end;

procedure TCustomDBGridEh.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  I: Integer;
  NeedLayout: Boolean;
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
  begin
    if (AComponent is TPopupMenu) then
    begin
      for I := 0 to Columns.Count-1 do
        if Columns[I].PopupMenu = AComponent then
          Columns[I].PopupMenu := nil;
    end
    else if (FDataLink <> nil) then
      if (AComponent = DataSource)  then
        DataSource := nil
      else if (AComponent is TField) then
      begin
        NeedLayout := False;
        BeginLayout;
        try
          for I := 0 to Columns.Count-1 do
            with Columns[I] do
              if Field = AComponent then
              begin
                Field := nil;
                NeedLayout := True;
              end;
        finally
          if NeedLayout and Assigned(FDatalink.Dataset)
            and not FDatalink.Dataset.ControlsDisabled then
            EndLayout
          else
            DeferLayout;
        end;
      end;
  end;
end;

procedure TCustomDBGridEh.RecordChanged(Field: TField);
var
  I: Integer;
  CField: TField;
begin
  if not HandleAllocated then Exit;
  if Field = nil then
    Invalidate
  else
  begin
    for I := 0 to Columns.Count - 1 do
      if Columns[I].Field = Field then
      //ddd
        //InvalidateCol(DataToRawColumn(I));
      begin
      //tmp  InvalidateCol(DataToRawColumn(I));
        InvalidateRow(Row);
      end;
      //\\\
  end;
  CField := SelectedField;
  if ((Field = nil) or (CField = Field)) and
    (Assigned(CField) and (CField.Text <> FEditText)) then
  begin
    InvalidateEditor;
    if InplaceEditor <> nil then InplaceEditor.Deselect;
  end;
end;

//ddd
procedure TCustomDBGridEh.Scroll(Distance: Integer);
var
  OldRect, NewRect, ClipRegion: TRect;
  RowHeight: Integer;
  //ddd
  VertSBVis:Boolean;
  //\\\
begin
  if not HandleAllocated then Exit;
  OldRect := BoxRect(0, Row, ColCount - 1, Row);
  if (FDataLink.ActiveRecord >= RowCount - FTitleOffset) then UpdateRowCount;
  //ddd
  VertSBVis := VertScrollBar.IsScrollBarVisible;
  UpdateScrollBar;
  if (VertSBVis <> VertScrollBar.IsScrollBarVisible) then begin
    if (FAutoFitColWidths = True) {and (UpdateLock = 0)} and not (csDesigning in ComponentState) then DeferLayout;
  end;
  //UpdateScrollBar;
  //\\\
  UpdateActive;
  NewRect := BoxRect(0, Row, ColCount - 1, Row);
  ValidateRect(Handle, @OldRect);
  InvalidateRect(Handle, @OldRect, False);
  InvalidateRect(Handle, @NewRect, False);
  if Distance <> 0 then
  begin
    HideEditor;
    try
      if Abs(Distance) > {dddVisibleRowCount}VisibleDataRowCount then
      begin
        Invalidate;
        Exit;
      end
      else
      begin
        RowHeight := DefaultRowHeight;
        if dgRowLines in Options then Inc(RowHeight, GridLineWidth);
        if dgIndicator in Options then
        begin
          OldRect := BoxRect(0, FSelRow, ColCount - 1, FSelRow);
          InvalidateRect(Handle, @OldRect, False);
        end;
        NewRect := BoxRect(0, FTitleOffset, ColCount - 1, 1000);
        //ddd
        if (FFooterRowCount > 0) then begin
          ClipRegion := BoxRect(0, FTitleOffset, ColCount - 1, RowCount-FFooterRowCount-2);
          ScrollWindowEx(Handle, 0, -RowHeight * Distance, @NewRect, @ClipRegion,
          0, nil, SW_Invalidate);
        end else
          ScrollWindowEx(Handle, 0, -RowHeight * Distance, @NewRect, @NewRect,
          0, nil, SW_Invalidate);
        //\\\ddd
        if dgIndicator in Options then
        begin
          NewRect := BoxRect(0, Row, ColCount - 1, Row);
          InvalidateRect(Handle, @NewRect, False);
        end;
      end;
    finally
      if dgAlwaysShowEditor in Options then ShowEditor;
    end;
  end;
  //ddd
  if Columns.ExistFooterValueType(fvtFieldValue) then InvalidateFooter;
  //\\\
  if UpdateLock = 0 then Update;
end;

procedure TCustomDBGridEh.SetColumns(Value: TDBGridColumnsEh);
begin
  Columns.Assign(Value);
end;

function ReadOnlyField(Field: TField): Boolean;
var
  MasterField: TField;
begin
  Result := Field.ReadOnly;
  if not Result and (Field.FieldKind = fkLookup) then
  begin
    Result := True;
    if Field.DataSet = nil then Exit;
    MasterField := Field.Dataset.FindField(Field.KeyFields);
    if MasterField = nil then Exit;
    Result := MasterField.ReadOnly;
  end;
end;

procedure TCustomDBGridEh.SetColumnAttributes;
var
  I: Integer;
begin
  for I := 0 to FColumns.Count-1 do
  with FColumns[I] do
  begin
    TabStops[I + FIndicatorOffset] := {d/}Visible{\} and not ReadOnly and DataLink.Active and
      Assigned(Field) and not (Field.FieldKind = fkCalculated) and not ReadOnlyField(Field);
    //tmp
    //ColWidths[I + FIndicatorOffset] := Width;
      ColWidths[I + FIndicatorOffset] := iif(Visible,Width,iif(dgColLines in Options,-1,0));
    //\\
  end;
  if (dgIndicator in Options) then
    ColWidths[0] := IndicatorWidth;
end;

procedure TCustomDBGridEh.SetDataSource(Value: TDataSource);
begin
  if Value = FDatalink.Datasource then Exit;
  FBookmarks.Clear;
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
  LinkActive(FDataLink.Active);

  //ddd
  if (Assigned(DataSource)) then
    SumList.DataSet := DataSource.DataSet
  else
    SumList.DataSet := nil;
  //\\\
end;

procedure TCustomDBGridEh.SetEditText(ACol, ARow: Longint; const Value: string);
begin
  FEditText := Value;
end;

procedure TCustomDBGridEh.SetOptions(Value: TDBGridOptions);
const
  LayoutOptions = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator,
    dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection];
var
  NewGridOptions: TGridOptions;
  ChangedOptions: TDBGridOptions;
begin
  if FOptions <> Value then
  begin
    NewGridOptions := [];
//ddd
    if (RowSizingAllowed = True) then
      NewGridOptions := NewGridOptions + [goRowSizing];
//\\\
    if dgColLines in Value then begin
//ddd
      NewGridOptions := NewGridOptions + [goFixedVertLine, goVertLine];
//      NewGridOptions := NewGridOptions + [goVertLine];
//      if (FUseMultiTitle = False) then
//        NewGridOptions := NewGridOptions + [goFixedVertLine];
    end;
//\\\
    if dgRowLines in Value then
      NewGridOptions := NewGridOptions + [goFixedHorzLine, goHorzLine];
    if dgColumnResize in Value then
      NewGridOptions := NewGridOptions + [goColSizing, goColMoving];
    if dgTabs in Value then Include(NewGridOptions, goTabs);
    if dgRowSelect in Value then
    begin
      Include(NewGridOptions, goRowSelect);
      Exclude(Value, dgAlwaysShowEditor);
      Exclude(Value, dgEditing);
    end;
    if dgEditing in Value then Include(NewGridOptions, goEditing);
    if dgAlwaysShowEditor in Value then Include(NewGridOptions, goAlwaysShowEditor);
    inherited Options := NewGridOptions;
    if dgMultiSelect in (FOptions - Value) then FBookmarks.Clear;
    ChangedOptions := (FOptions + Value) - (FOptions * Value);
    FOptions := Value;
    if ChangedOptions * LayoutOptions <> [] then LayoutChanged;
  end;
end;

procedure TCustomDBGridEh.SetSelectedField(Value: TField);
var
  I: Integer;
begin
  if Value = nil then Exit;
  for I := 0 to Columns.Count - 1 do
    if Columns[I].Field = Value then
      MoveCol(DataToRawColumn(I),0);
end;

procedure TCustomDBGridEh.SetSelectedIndex(Value: Integer);
begin
  MoveCol(DataToRawColumn(Value),0);
end;

procedure TCustomDBGridEh.SetTitleFont(Value: TFont);
begin
  FTitleFont.Assign(Value);
  if dgTitles in Options then LayoutChanged;
end;

function TCustomDBGridEh.StoreColumns: Boolean;
begin
  Result := Columns.State = csCustomized;
end;

procedure TCustomDBGridEh.TimedScroll(Direction: TGridScrollDirection);
begin
  if FDatalink.Active then
  begin
    with FDatalink do
    begin
      if sdUp in Direction then
      begin
        DataSet.MoveBy(-ActiveRecord - 1);
        Exclude(Direction, sdUp);
      end;
      if sdDown in Direction then
      begin
        DataSet.MoveBy(RecordCount - ActiveRecord);
        Exclude(Direction, sdDown);
      end;
    end;
    if Direction <> [] then inherited TimedScroll(Direction);
  end;
end;

procedure TCustomDBGridEh.TitleClick(Column: TColumnEh);
begin
  if Assigned(FOnTitleClick) then FOnTitleClick(Column);
end;

procedure TCustomDBGridEh.TitleFontChanged(Sender: TObject);
begin
  if (not FSelfChangingTitleFont) and not (csLoading in ComponentState) then
    ParentFont := False;
  if dgTitles in Options then LayoutChanged;
end;

procedure TCustomDBGridEh.UpdateActive;
var
  NewRow: Integer;
  Field: TField;
begin
  if FDatalink.Active and HandleAllocated and not (csLoading in ComponentState) then
  begin
    NewRow := FDatalink.ActiveRecord + FTitleOffset;
    if Row <> NewRow then
    begin
      if not (dgAlwaysShowEditor in Options) then HideEditor;
      MoveColRow(Col, NewRow, False, False);
      InvalidateEditor;
    end;
    Field := SelectedField;
    if Assigned(Field) and (Field.Text <> FEditText) then
      InvalidateEditor;
  end;
end;

procedure TCustomDBGridEh.UpdateData;
var
  Field: TField;
  //ddd
  KeyIndex: Integer;
  MasterField: TField;
  //\\\
begin
  Field := SelectedField;
  if Assigned(Field) then
   //ddd
    if Assigned(Columns[SelectedIndex].KeyList)  and (Columns[SelectedIndex].KeyList.Count > 0) then begin
      KeyIndex := Columns[SelectedIndex].PickList.IndexOf(FEditText);
      if (KeyIndex > -1) and (KeyIndex < Columns[SelectedIndex].KeyList.Count) then
        Field.Text  := Columns[SelectedIndex].KeyList.Strings[KeyIndex]
      else if (KeyIndex = -1) and (FEditText = '') then
        Field.Clear;
    end
    else if (Field.FieldKind = fkLookup) and
              (Field.KeyFields <> '') then
    begin
      MasterField := Field.DataSet.FieldByName(Field.KeyFields);
      if MasterField.CanModify then
      begin
        Field.DataSet.Edit;
        MasterField.Value := FEditKeyValue;
      end;

      if (DrawMemoText = True) and (Field.DataType = ftMemo) then
        Field.AsString := FEditText
      else
        Field.Text := FEditText;
    end
    else if (DrawMemoText = True) and (Field.DataType = ftMemo) then
        Field.AsString := FEditText
    else
   //\\\
      Field.Text := FEditText;
end;


procedure TCustomDBGridEh.UpdateRowCount;
var BetweenRowHeight,FooterHeight, Delta,t:Integer;
    WinClientRect:TRect;
begin
  if RowCount <= FTitleOffset then RowCount := FTitleOffset + 1;
  FixedRows := FTitleOffset;
  with FDataLink do
    if not Active or (RecordCount = 0) {or not HandleAllocated} then begin
      RowCount := 1 + FTitleOffset;
      if (HandleAllocated) then begin
        t := RowHeights[0];
        DefaultRowHeight := DefaultRowHeight;
        RowHeights[0] := t;
        if (FFooterRowCount > 0) then begin
          BetweenRowHeight := ClientHeight - GridHeight;
          RowCount := RowCount + FooterRowCount + 1;
          FooterHeight := (DefaultRowHeight + iif(dgRowLines in Options,GridLineWidth,0)) * FFooterRowCount;
          RowHeights[iif(dgTitles in Options,2,1)] :=
             iif(FooterHeight + 1 < BetweenRowHeight,BetweenRowHeight - FooterHeight - 1,0);
        end;
      end;
    end
    else
    begin
      RowCount := 1000;
      t := RowHeights[0];
      DefaultRowHeight := DefaultRowHeight;
      RowHeights[0] := t;

      FDataLink.BufferCount := VisibleRowCount;
      RowCount := RecordCount + FTitleOffset;
      if dgRowSelect in Options then TopRow := FixedRows;

      //ddd

      Windows.GetClientRect(Handle, WinClientRect);
      if (FFooterRowCount > 0) then begin
        FooterHeight := (DefaultRowHeight + iif(dgRowLines in Options,GridLineWidth,0)) * FFooterRowCount;
        BetweenRowHeight := ClientHeight - GridHeight;
        if (FooterHeight < (ClientHeight - GridHeight)) then begin
          RowCount := RowCount + FooterRowCount + 1;
          RowHeights[RowCount - FooterRowCount - 1] := BetweenRowHeight - FooterHeight - 1;
        end else
        if ((ClientHeight - GridHeight) <= DefaultRowHeight) then begin
          if (BetweenRowHeight = 0) or (BetweenRowHeight = -1) then begin
            FDataLink.BufferCount := FDataLink.BufferCount - FFooterRowCount - 1;
            if (FDataLink.BufferCount <= 0) then begin
                FDataLink.BufferCount := 1;
                RowCount := 2 + iif(dgTitles in Options,1,0) + FFooterRowCount;
                RowHeights[iif(dgTitles in Options,2,1)] := 0;
            end else
            if (BetweenRowHeight = 0) then
              RowHeights[RowCount - FooterRowCount - 1] := DefaultRowHeight
            else
              RowHeights[RowCount - FooterRowCount - 1] := DefaultRowHeight-1;
          end else begin
            RowCount := RowCount + 1;
            FDataLink.BufferCount := FDataLink.BufferCount - FFooterRowCount;
            if (FDataLink.BufferCount <= 1) then begin
                FDataLink.BufferCount := 1;
                RowCount := 2 + iif(dgTitles in Options,1,0) + FFooterRowCount;
                t := ClientHeight - ( iif(dgTitles in Options,RowHeights[0],0) + RowHeights[1] +
                    iif(dgRowLines in Options,GridLineWidth,0)*(2+iif(dgTitles in Options,1,0)) +
                    FooterHeight);
                RowHeights[iif(dgTitles in Options,2,1)] := iif( t > 0,t,0);
            end else begin
              if (BetweenRowHeight = DefaultRowHeight) then FDataLink.BufferCount := FDataLink.BufferCount - 1;
              RowHeights[RowCount - FooterRowCount - 1] := BetweenRowHeight - 1;
            end;
          end;
        end else
        if (FooterHeight - (ClientHeight - GridHeight) < (DefaultRowHeight + iif(dgRowLines in Options,GridLineWidth,0))*RecordCount) then begin
          Delta := (FooterHeight - (ClientHeight - GridHeight)) div (DefaultRowHeight + iif(dgRowLines in Options,GridLineWidth,0)) + 1;
          BetweenRowHeight := (ClientHeight - GridHeight + 1) mod (DefaultRowHeight + iif(dgRowLines in Options,GridLineWidth,0));
          RowCount := RowCount + (FFooterRowCount - Delta) + 1;
          FDataLink.BufferCount := FDataLink.RecordCount - Delta;
          if (FDataLink.BufferCount <= 0) then begin
                FDataLink.BufferCount := 1;
                RowCount := 2 + iif(dgTitles in Options,1,0) + FFooterRowCount;
                RowHeights[iif(dgTitles in Options,2,1)] := 0;
          end else
          if (BetweenRowHeight = 1) or (BetweenRowHeight = 0) then begin
            RowHeights[RowCount - FooterRowCount - 1] := DefaultRowHeight - (1 - BetweenRowHeight);
          end
          else
            RowHeights[RowCount - FooterRowCount - 1] := BetweenRowHeight - 2;
        end else begin
          FDataLink.BufferCount := 1;
          RowCount := 2 + iif(dgTitles in Options,1,0) + FFooterRowCount;
          RowHeights[iif(dgTitles in Options,2,1)] := 0;
        end;
      end;
      //\\\

//ddd      if dgRowSelect in Options then TopRow := FixedRows;
      UpdateActive;
    end;

end;

procedure TCustomDBGridEh.UpdateScrollBar;
var
  SIOld, SINew: TScrollInfo;
begin
  if FDatalink.Active and HandleAllocated then
    with FDatalink.DataSet do
    begin
      SIOld.cbSize := sizeof(SIOld);
      SIOld.fMask := SIF_ALL;
      GetScrollInfo(Self.Handle, SB_VERT, SIOld);
      SINew := SIOld;
      if {dddIsSequenced}SumList.IsSequenced then
      begin
        SINew.nMin := 1;
        SINew.nPage := {//dddSelf.VisibleRowCount} VisibleDataRowCount ;
        SINew.nMax := Integer(DWORD({dddRecordCount}SumList.RecordCount) + SINew.nPage -1);
        if State in [dsInactive, dsBrowse, dsEdit] then
          SINew.nPos := {dddRecNo}SumList.RecNo;  // else keep old pos
      end
      else
      begin
        SINew.nMin := 0;
        SINew.nPage := 0;
        SINew.nMax := 4;
        if BOF then SINew.nPos := 0
        else if EOF then SINew.nPos := 4
        else SINew.nPos := 2;
      end;
{ddd} if not VertScrollBar.Visible then SINew.nMax := SINew.nMin;
      if (SINew.nMin <> SIOld.nMin) or (SINew.nMax <> SIOld.nMax) or
        (SINew.nPage <> SIOld.nPage) or (SINew.nPos <> SIOld.nPos) then
        SetScrollInfo(Self.Handle, SB_VERT, SINew, True);
    end;
end;

function TCustomDBGridEh.ValidFieldIndex(FieldIndex: Integer): Boolean;
begin
  Result := DataLink.GetMappedIndex(FieldIndex) >= 0;
end;

procedure TCustomDBGridEh.CMParentFontChanged(var Message: TMessage);
begin
  inherited;
  if ParentFont then
  begin
    FSelfChangingTitleFont := True;
    try
      TitleFont := Font;
    finally
      FSelfChangingTitleFont := False;
    end;
    LayoutChanged;
  end;
end;

procedure TCustomDBGridEh.CMExit(var Message: TMessage);
begin
  try
    if FDatalink.Active then
      with FDatalink.Dataset do
        if (dgCancelOnExit in Options) and (State = dsInsert) and
          not Modified and not FDatalink.FModified then
          Cancel else
          FDataLink.UpdateData;
  except
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TCustomDBGridEh.CMFontChanged(var Message: TMessage);
var
  I: Integer;
begin
  inherited;
  BeginLayout;
  try
    for I := 0 to Columns.Count-1 do
      Columns[I].RefreshDefaultFont;
  finally
    EndLayout;
  end;
end;

procedure TCustomDBGridEh.CMDeferLayout(var Message);
begin
  if AcquireLayoutLock then
    EndLayout
  else
    DeferLayout;
end;

procedure TCustomDBGridEh.CMDesignHitTest(var Msg: TCMDesignHitTest);
begin
  inherited;
  if (Msg.Result = 1) and ((FDataLink = nil) or
    ((Columns.State = csDefault) and
     (FDataLink.DefaultFields or (not FDataLink.Active)))) then
    Msg.Result := 0;
end;

procedure TCustomDBGridEh.WMSetCursor(var Msg: TWMSetCursor);
begin
  if (csDesigning in ComponentState) and ((FDataLink = nil) or
     ((Columns.State = csDefault) and       
      (FDataLink.DefaultFields or (not FDataLink.Active)))) then
    Windows.SetCursor(LoadCursor(0, IDC_ARROW))
  else inherited;
end;

procedure TCustomDBGridEh.WMSize(var Message: TWMSize);
begin
  inherited;

//ddd
  if (FAutoFitColWidths = True) and (UpdateLock = 0) and not (csDesigning in ComponentState) then LayoutChanged;
  if UpdateLock = 0 then begin UpdateRowCount; UpdateScrollBar; end;

////  if UpdateLock = 0 then UpdateRowCount;
//\\\
end;

procedure TCustomDBGridEh.WMVScroll(var Message: TWMVScroll);
var
  SI: TScrollInfo;
begin
  if not AcquireFocus then Exit;
  if FDatalink.Active then
    with Message, FDataLink.DataSet do
      case ScrollCode of
        SB_LINEUP: MoveBy(-FDatalink.ActiveRecord - 1);
        SB_LINEDOWN: MoveBy(FDatalink.RecordCount - FDatalink.ActiveRecord);
        SB_PAGEUP: MoveBy({ddd//-VisibleRowCount} -VisibleDataRowCount {ddd\\});
        SB_PAGEDOWN: MoveBy({ddd//VisibleRowCount} VisibleDataRowCount {ddd\\});
        SB_THUMBTRACK:
           if VertScrollBar.Tracking then
           begin
              MoveBy(Pos-SumList.RecNo);
              ThumbTracked := True;
              Exit;
           end;
        SB_THUMBPOSITION{,SB_THUMBTRACK}:
          begin
            //ddd
            if ThumbTracked then begin
              ThumbTracked := False;
              Exit;
            end;
            if ScrollCode = SB_THUMBTRACK then
              if not VertScrollBar.Tracking then Exit;
            //\\\
            if {dddIsSequenced}SumList.IsSequenced then
            begin
              SI.cbSize := sizeof(SI);
              SI.fMask := SIF_ALL;
              GetScrollInfo(Self.Handle, SB_VERT, SI);
              if SI.nTrackPos <= 1 then First
              else if SI.nTrackPos >= {dddRecordCount}SumList.RecordCount then Last
              else {dddRecNo}SumList.RecNo := SI.nTrackPos;
            end
            else
              case Pos of
                0: First;
                1: MoveBy({ddd//-VisibleRowCount} -VisibleDataRowCount {ddd\\});
                2: Exit;
                3: MoveBy({ddd//-VisibleRowCount} VisibleDataRowCount {ddd\\});
                4: Last;
              end;
          end;
        SB_BOTTOM: Last;
        SB_TOP: First;
      end;
end;

//dddtmp
procedure TCustomDBGridEh.WMHScroll(var Message: TWMHScroll);
begin
  if HorzScrollBar.Tracking and (Message.ScrollCode = SB_THUMBTRACK) then
    Perform(Message.Msg,MakeLong(SB_THUMBPOSITION,Message.Pos),Message.ScrollBar)
  else
   inherited;
end;
//\\\

procedure TCustomDBGridEh.SetIme;
var
  Column: TColumnEh;
begin
  if not SysLocale.FarEast then Exit;

  ImeName := FOriginalImeName;
  ImeMode := FOriginalImeMode;
  Column := Columns[SelectedIndex];
  if Column.IsImeNameStored then ImeName := Column.ImeName;
  if Column.IsImeModeStored then ImeMode := Column.ImeMode;

  if InplaceEditor <> nil then
  begin
    TDBGridInplaceEdit(Self).ImeName := ImeName;
    TDBGridInplaceEdit(Self).ImeMode := ImeMode;
  end;
end;

procedure TCustomDBGridEh.UpdateIme;
begin
  if not SysLocale.FarEast then Exit;
  SetIme;
  SetImeName(ImeName);
  SetImeMode(Handle, ImeMode);
end;

procedure TCustomDBGridEh.WMIMEStartComp(var Message: TMessage);
begin
  inherited;
  ShowEditor;
end;

procedure TCustomDBGridEh.WMSetFocus(var Message: TWMSetFocus);
var
  InvalidRect: TRect;
begin
  if not ((InplaceEditor <> nil) and
    (Message.FocusedWnd = InplaceEditor.Handle)) then SetIme;
  //ddd
  if HandleAllocated and (dgRowSelect in Options) then
  begin
    with Selection do
      InvalidRect := BoxRect(Left-FrozenCols, Top, Right, Bottom);
    InvalidateRect(Handle, @InvalidRect, False);
  end;
  //\\\
  inherited;
end;

procedure TCustomDBGridEh.WMKillFocus(var Message: TMessage);
var
  InvalidRect: TRect;
begin
  //ddd
  if HandleAllocated and (dgRowSelect in Options) then
  begin
    with Selection do
      InvalidRect := BoxRect(Left-FrozenCols, Top, Right, Bottom);
    InvalidateRect(Handle, @InvalidRect, False);
  end;
  //\\\
  if not SysLocale.FarEast then inherited
  else
  begin
    ImeName := Screen.DefaultIme;
    ImeMode := imDontCare;
    inherited;
    if not ((InplaceEditor <> nil) and
      (HWND(Message.WParam) = InplaceEditor.Handle)) then
      ActivateKeyboardLayout(Screen.DefaultKbLayout, KLF_ACTIVATE);
  end;
end;

// Dima changing

function  TCustomDBGridEh.GetFooterRowCount: Integer;
begin
 Result := FFooterRowCount;
end;

procedure TCustomDBGridEh.SetFooterRowCount(Value: Integer);
begin
  if (Value <> FFooterRowCount) and (Value >= 0) then begin
    FFooterRowCount := Value;
    LayoutChanged;
  end;
end;


                          {ReadTitlEheight}
function  TCustomDBGridEh.ReadTitlEheight: Integer;
begin
  Result :=  FTitlEheight;
end;

procedure TCustomDBGridEh.WriteTitlEheight(th: Integer); {WriteTitlEheight}
begin
 FTitlEheight :=  th;
 LayoutChanged;
end;
                          {ReadTitleLines}
function  TCustomDBGridEh.ReadTitleLines: Integer;
begin
  Result :=  FTitleLines;
end;

procedure TCustomDBGridEh.WriteTitleLines(tl: Integer); {WriteTitleLines}
begin
  FTitleLines := tl;
  LayoutChanged;
end;


procedure TCustomDBGridEh.Paint; //
begin
  inherited Paint;
  if (dgTitles in Options) and UseMultiTitle then
   FHeadTree.DoForAllNode(ClearPainted);
  if not (csDesigning in ComponentState) and
    (dgRowSelect in Options) and DefaultDrawing and Focused then
  begin
    Canvas.Font.Color := clWindowText;
    Canvas.Brush.Color := clWindow;
    with Selection do
      DrawFocusRect(Canvas.Handle, BoxRect(Left-FrozenCols, Top, Right, Bottom));
  end;
end;

procedure TCustomDBGridEh.ClearPainted(node:THeadTreeNode); //new
begin
 node.Drawed := false;
end;


procedure TCustomDBGridEh.WriteMarginText(IsMargin:Boolean);
begin
  if(IsMargin <> FMarginText) then begin
    FMarginText := IsMargin;
    LayoutChanged;
  end;
end;


procedure TCustomDBGridEh.WriteVTitleMargin(Value: Integer);
begin
  FVTitleMargin := Value;
  LayoutChanged;
end;

procedure TCustomDBGridEh.WritEhTitleMargin(Value: Integer);
begin
  FHTitleMargin := Value;
  LayoutChanged;
end;

procedure TCustomDBGridEh.WriteUseMultiTitle(Value:Boolean);
begin
 if (FUseMultiTitle <> Value) then
   FUseMultiTitle := Value;
 LayoutChanged;
end;

procedure TCustomDBGridEh.SetRowSizingAllowed(Value:Boolean);
begin
  if Value <> FRowSizingAllowed then begin
    FRowSizingAllowed := Value;
    if FRowSizingAllowed then
      inherited Options := inherited Options + [goRowSizing]
    else
      inherited Options := inherited Options - [goRowSizing];
  end;
end;

function TCustomDBGridEh.GetRowHeight:Integer;
begin
  Result := FNewRowHeight;
end;

procedure TCustomDBGridEh.SetRowHeight(Value: Integer);
begin
  if Value <> FNewRowHeight then begin
    FNewRowHeight := iif(Value < 0,0,Value);
    LayoutChanged;
  end;
end;

function  TCustomDBGridEh.GetRowLines: Integer;
begin
  Result := FRowLines;
end;

procedure TCustomDBGridEh.SetRowLines(Value: Integer);
begin
  if Value <> FRowLines then begin
    FRowLines := iif(Value < 0,0,Value);
    LayoutChanged;
  end;
end;


procedure TCustomDBGridEh.RowHeightsChanged;
var
  I, ThisHasChanged, Def: Integer;
begin
  if (FDefaultRowChanged = True) then begin
    FDefaultRowChanged := False;
    ThisHasChanged := -1;
    Def := DefaultRowHeight;
    for I := Ord(dgTitles in Options) to RowCount - iif(FooterRowCount > 0,FooterRowCount + 1,0) do
      if RowHeights[I] <> Def then
      begin
        ThisHasChanged := I;
        Break;
      end;
    if ThisHasChanged <> -1 then
    begin
      FRowLines := 0;
      SetRowHeight(RowHeights[ThisHasChanged]);
      UpdateScrollBar;
    end;
  end;
  inherited;
end;

function TCustomDBGridEh.StdDefaultRowHeight: Integer;
var K:Integer;
begin
  if not HandleAllocated then
    Canvas.Handle := GetDC(0);
  try
    Canvas.Font := Font;
    K := Canvas.TextHeight('Wg') + 3;
    if dgRowLines in Options then
      Inc(K, GridLineWidth);
    Result := K;
  finally
    if not HandleAllocated then
    begin
      ReleaseDC(0,Canvas.Handle);
      Canvas.Handle := 0;
    end;
  end;

end;

procedure TCustomDBGridEh.StopTracking;
begin
  if FTracking then begin
    StopTimer;
    FIndicatorPressed := False;
    TrackButton(-1, -1);
    FTracking := False;
    MouseCapture := False;
    FPressedCol := -1;
    FDataTracking := False;
  end;
end;

procedure TCustomDBGridEh.TrackButton(X, Y: Integer);
var
  Cell: TGridCoord;
  NewPressed: Boolean;
  ARect:TRect;
begin
  Cell := MouseCoord(X, Y);
  NewPressed := PtInRect(Rect(0, 0, ClientWidth, ClientHeight), Point(X, Y))
    and (FPressedCol = Cell.X) and (Cell.Y = 0);
  if (FUseMultiTitle = True) and NewPressed then begin
    ARect := CellRect(Cell.X,Cell.Y);
    NewPressed := not (PtInRect(Rect(ARect.Left, ARect.Top,
                    ARect.Right, ARect.Bottom - FLeafFieldArr[Cell.X-IndicatorOffset].FLeaf.Height + 1),
                      Point(X, Y)));
  end;
  if FPressed <> NewPressed then begin
      FPressed := NewPressed;
      GridInvalidateRow(Self,0);
  end;
end;

procedure TCustomDBGridEh.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TCustomDBGridEh.DoTitleClick(ACol: Longint; AColumn: TColumnEh);
begin
  if Assigned(FOnTitleBtnClick) then FOnTitleBtnClick(Self, ACol, AColumn);
end;

procedure TCustomDBGridEh.CheckTitleButton(ACol: Longint; var Enabled: Boolean);
begin
  if (ACol >= 0) and (ACol < Columns.Count) then
  begin
    if Assigned(FOnCheckButton) then FOnCheckButton(Self, ACol, Columns[ACol], Enabled);
  end
  else Enabled := False;
end;

//new                    SetChildTreEheight

function TCustomDBGridEh.SetChildTreEheight(ANode:THeadTreeNode):Integer;
var htLast:THeadTreeNode;
    newh,maxh,th :Integer;
    rec:TRect;
    DefaultRowHeight : Integer;
begin
  DefaultRowHeight := 0;
  Result := 0;
  if(ANode.Child  = nil) then Exit;
  htLast := ANode.Child;
  maxh := 0;
  Canvas.Font := TitleFont;
  if(htLast.Child <> nil) then
   maxh := SetChildTreEheight(htLast);

  rec := Rect(0,0,htLast.Width-4-htLast.WIndent,DefaultRowHeight);
  if (rec.Left >= rec.Right) then rec.Right := rec.Left + 1;//?????
  th := iif(htLast.Width<>-1,
         DrawText(Canvas.Handle,PChar(htLast.Text),
         Length(htLast.Text), rec, DT_WORDBREAK or DT_CALCRECT), 0);

  if (th > DefaultRowHeight) then maxh := maxh + th + FVTitleMargin
     else maxh := maxh + DefaultRowHeight;

  while  true  do begin
     if(ANode.Child = htLast.Next) then begin break; end;
     htLast := htLast.Next;
     newh := 0;
     if(htLast.Child <> nil) then
       newh := SetChildTreEheight(htLast);
     rec := Rect(0,0,htLast.Width-4-htLast.WIndent,DefaultRowHeight);
     if (rec.Left >= rec.Right) then rec.Right := rec.Left + 1;//?????
     th := iif(htLast.Width<>-1,
             DrawText(Canvas.Handle,PChar(htLast.Text),
             Length(htLast.Text), rec, DT_WORDBREAK or DT_CALCRECT), 0);
     if (th > DefaultRowHeight) then newh := newh + th  + FVTitleMargin
        else newh := newh + DefaultRowHeight;

     if(maxh < newh) then maxh := newh;
  end;

  htLast := ANode.Child;
  while ANode.Child <> htLast.Next do begin
    if(htLast.Child = nil) then htLast.Height := maxh
      else htLast.Height := maxh - htLast.Height;
    htLast := htLast.Next;
  end;
  if(htLast.Child = nil) then htLast.Height := maxh
      else htLast.Height := maxh - htLast.Height;

  ANode.Height := maxh; //сохраняем высоту ChildTree в Хосте
  Result := maxh;
end;


function TCustomDBGridEh.GetColWidths(Index: Longint): Integer;
begin
 Result := inherited ColWidths[Index];
end;

procedure TCustomDBGridEh.SetColWidths(Index: Longint; Value: Integer);
begin
  inherited ColWidths[Index] := Value;
  LayoutChanged;
end;


procedure TCustomDBGridEh.WriteAutoFitColWidths(Value:Boolean);
var i:Integer;
begin
  if (FAutoFitColWidths = Value) then Exit;
  FAutoFitColWidths := Value;
  if (csDesigning in ComponentState) then Exit;
  if (FAutoFitColWidths = True) then  begin
    if not (csLoading in ComponentState) then
      for i := 0  to Columns.Count - 1 do Columns[i].FInitWidth := Columns[i].Width;
    ScrollBars := ssNone;
  end
  else begin
    for i := 0  to Columns.Count - 1 do Columns[i].Width := Columns[i].FInitWidth;
    ScrollBars := ssHorizontal;
  end;
  LayoutChanged;
end;


//------------------------------------------------------------------------------
procedure TCustomDBGridEh.WriteMinAutoFitWidth(Value:Integer);
begin
  FMinAutoFitWidth := Value;
  LayoutChanged;
end;

//from RX

procedure TCustomDBGridEh.SaveColumnsLayoutProducer(ARegIni: TObject; Section: String; DeleteSection: Boolean);
var
  I:Integer;
  S:String;
begin
  if (ARegIni is TRegIniFile) then
    TRegIniFile(ARegIni).EraseSection(Section)
  else if DeleteSection then
    TIniFile(ARegIni).EraseSection(Section);

  with Columns do begin
    for I := 0 to Count - 1 do begin
      if ARegIni is TRegIniFile then
        TRegIniFile(ARegIni).WriteString(Section, Format('%s.%s', [Name, Items[I].FieldName]),
         Format('%d,%d,%d,%d,%d', [Items[I].Index, Items[I].Width, Integer(Items[I].Title.SortMarker),Integer(Items[I].Visible),Items[I].Title.SortIndex]))
      else begin
        S := Format('%d,%d,%d,%d,%d', [Items[I].Index, Items[I].Width, Integer(Items[I].Title.SortMarker),Integer(Items[I].Visible),Items[I].Title.SortIndex]);
        if S <> '' then begin
          if ((S[1] = '"') and (S[Length(S)] = '"')) or
            ((S[1] = '''') and (S[Length(S)] = '''')) then
            S := '"' + S + '"';
        end;
      end;
      if ARegIni is TIniFile then
        TIniFile(ARegIni).WriteString(Section, Format('%s.%s', [Name, Items[I].FieldName]), S);
    end;
  end;
end;

procedure TCustomDBGridEh.RestoreColumnsLayoutProducer(ARegIni: TObject; Section: String; RestoreParams:TColumnEhRestoreParams);
type
  TColumnInfo = record
    Column: TColumnEh;
    EndIndex: Integer;
    SortMarker:TSortMarkerEh;
    SortIndex: Integer;
  end;
  PColumnArray = ^TColumnArray;
  TColumnArray = array[0..0] of TColumnInfo;
const
  Delims = [' ',','];
var
  I, J: Integer;
  S: string;
  ColumnArray: PColumnArray;
  AAutoFitColWidth: Boolean;
begin
  AAutoFitColWidth := False;
  BeginUpdate;
  try
    if (AutoFitColWidths) then begin
      AutoFitColWidths := False;
      AAutoFitColWidth := True;
    end;
    with Columns do begin
      ColumnArray := AllocMem(Count * SizeOf(TColumnInfo));
      try
        for I := 0 to Count - 1 do begin
          if (ARegIni is TRegIniFile) then
            S := TRegIniFile(ARegIni).ReadString(Section, Format('%s.%s', [Name, Items[I].FieldName]), '')
          else
            S := TIniFile(ARegIni).ReadString(Section, Format('%s.%s', [Name, Items[I].FieldName]), '');
          ColumnArray^[I].Column := Items[I];
          ColumnArray^[I].EndIndex := Items[I].Index;
          if S <> '' then begin
            ColumnArray^[I].EndIndex := StrToIntDef(ExtractWord(1, S, Delims),
              ColumnArray^[I].EndIndex);
            if (crpColWidthsEh in RestoreParams) then
              Items[I].Width := StrToIntDef(ExtractWord(2, S, Delims),
                Items[I].Width);
            if (crpSortMarkerEh in RestoreParams) then
              Items[I].Title.SortMarker := TSortMarkerEh(StrToIntDef(ExtractWord(3, S, Delims),
                Integer(Items[I].Title.SortMarker)));
            if (crpColVisibleEh in RestoreParams) then
              Items[I].Visible := Boolean(StrToIntDef(ExtractWord(4, S, Delims),
                Integer(Items[I].Visible)));
            if (crpSortMarkerEh in RestoreParams) then
              ColumnArray^[I].SortIndex := StrToIntDef(ExtractWord(5, S, Delims),
                0);
          end;
        end;
        if (crpSortMarkerEh in RestoreParams) then
          for I := 0 to Count - 1 do
           Items[I].Title.SortIndex := ColumnArray^[I].SortIndex;
        if (crpColIndexEh in RestoreParams) then
          for I := 0 to Count - 1 do begin
            for J := 0 to Count - 1 do begin
              if ColumnArray^[J].EndIndex = I then begin
                ColumnArray^[J].Column.Index := ColumnArray^[J].EndIndex;
                Break;
              end;
            end;
          end;

      finally
        FreeMem(Pointer(ColumnArray));
      end;
    end;
  finally
    EndUpdate;
    if (AAutoFitColWidth = True) then AutoFitColWidths := True
    else LayoutChanged;
  end;
end;

procedure TCustomDBGridEh.SaveColumnsLayoutIni(IniFileName: String; Section: String; DeleteSection: Boolean);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(IniFileName);
  try
    SaveColumnsLayoutProducer(IniFile,Section,DeleteSection);
  finally
   IniFile.Free;
  end;
end;

procedure TCustomDBGridEh.RestoreColumnsLayoutIni(IniFileName: String; Section: String; RestoreParams:TColumnEhRestoreParams);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(IniFileName);
  try
    RestoreColumnsLayoutProducer(IniFile,Section,RestoreParams);
  finally
   IniFile.Free;
  end;
end;

procedure TCustomDBGridEh.SaveColumnsLayout(ARegIni: TRegIniFile);
var
  Section: String;
begin
  Section := GetDefaultSection(Self);
  SaveColumnsLayoutProducer(ARegIni,Section,True);
end;

procedure TCustomDBGridEh.RestoreColumnsLayout(ARegIni: TRegIniFile; RestoreParams:TColumnEhRestoreParams);
var
  Section: String;
begin
  Section := GetDefaultSection(Self);
  RestoreColumnsLayoutProducer(ARegIni,Section,RestoreParams);
end;

//\\\from RX

procedure TCustomDBGridEh.SaveGridLayoutProducer(ARegIni: TObject; Section: String; DeleteSection: Boolean);
begin
  SaveColumnsLayoutProducer(ARegIni,Section,DeleteSection);
  if ARegIni is TRegIniFile then
    TRegIniFile(ARegIni).WriteString(Section, '', Format('%d,%d', [RowHeight,RowLines]))
  else if ARegIni is TIniFile then
    TIniFile(ARegIni).WriteString(Section, '(Default)', Format('%d,%d', [RowHeight,RowLines]));
end;

procedure TCustomDBGridEh.RestoreGridLayoutProducer(ARegIni: TObject; Section: String; RestoreParams:TDBGridEhRestoreParams);
const
  Delims = [' ',','];
var ColRestParams:TColumnEhRestoreParams;
    S:String;
begin
  ColRestParams := [];
  if grpColIndexEh in RestoreParams then Include(ColRestParams,crpColIndexEh);
  if grpColWidthsEh in RestoreParams then Include(ColRestParams,crpColWidthsEh);
  if grpSortMarkerEh in RestoreParams then Include(ColRestParams,crpSortMarkerEh);
  if grpColVisibleEh in RestoreParams then Include(ColRestParams,crpColVisibleEh);
  RestoreColumnsLayoutProducer(ARegIni,Section,ColRestParams);

  if (ARegIni is TRegIniFile) then
    S := TRegIniFile(ARegIni).ReadString(Section, '', '')
  else
    S := TIniFile(ARegIni).ReadString(Section, '(Default)', '');

  if (grpRowHeightEh in RestoreParams) then begin
    RowHeight := StrToIntDef(ExtractWord(1, S, Delims),0);
    RowLines := StrToIntDef(ExtractWord(2, S, Delims),0);
  end;
end;

procedure TCustomDBGridEh.SaveGridLayout(ARegIni: TRegIniFile);
var
  Section: String;
begin
  Section := GetDefaultSection(Self);
  SaveGridLayoutProducer(ARegIni,Section,True);
end;

procedure TCustomDBGridEh.RestoreGridLayout(ARegIni: TRegIniFile; RestoreParams:TDBGridEhRestoreParams);
var
  Section: String;
begin
  Section := GetDefaultSection(Self);
  RestoreGridLayoutProducer(ARegIni,Section,RestoreParams);
end;

procedure TCustomDBGridEh.SaveGridLayoutIni(IniFileName: String; Section: String; DeleteSection: Boolean);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(IniFileName);
  try
    SaveGridLayoutProducer(IniFile,Section,DeleteSection);
  finally
   IniFile.Free;
  end;
end;

procedure TCustomDBGridEh.RestoreGridLayoutIni(IniFileName: String; Section: String; RestoreParams:TDBGridEhRestoreParams);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(IniFileName);
  try
    RestoreGridLayoutProducer(IniFile,Section,RestoreParams);
  finally
   IniFile.Free;
  end;
end;


procedure TCustomDBGridEh.SetFrozenCols(Value: Integer);
begin
  if (Value = FFrozenCols) and (Value < 0) then Exit;
  FFrozenCols := Value;
  LayoutChanged;
end;

{---------------------------------------------------------------------------}
{------------ THeadTreeNode ------------------------------------------------}
{---------------------------------------------------------------------------}
//ddd

function ExtractWordPos(N: Integer; const S: string; WordDelims: TCharSet;
  var Pos: Integer): string; forward;

//\\\


constructor THeadTreeNode.Create;
begin
   Child := Nil; Next := Self; Host := nil; WIndent := 0;
end;

constructor THeadTreeNode.CreateText(AText:String;AHeight,AWidth:Integer);
begin
  Create;
  Text := AText; Height := AHeight; Width := AWidth;
end;

destructor THeadTreeNode.Destroy;
begin
 inherited;
 if (Host = nil) then begin
   FreeAllChild;
 end;
end;

function THeadTreeNode.Add(AAfter:THeadTreeNode;AText:String;AHeight,AWidth:Integer):THeadTreeNode ;
var htLast,{htSelf,}th:THeadTreeNode;
begin
    if(Find(AAfter) = false) then raise Exception.Create('Node not in Tree');
    htLast := AAfter.Next;
//    while AAfter <> htLast.Next do htLast := htLast.Next; // Ишим последний
    th := THeadTreeNode.CreateText(AText,AHeight,AWidth);
    th.Host := AAfter.Host;
    AAfter.Next := th;
    th.Next := htLast;
    Result := th;
end;

function THeadTreeNode.AddChild(ANode:THeadTreeNode;AText:String;AHeight,AWidth:Integer):THeadTreeNode ;
var htLast,th:THeadTreeNode;
begin
  if(Find(ANode) = false) then raise Exception.Create('Node not in Tree');

  if(ANode.Child = nil) then begin
   th := THeadTreeNode.CreateText(AText,AHeight,AWidth);
   th.Host := ANode;
   ANode.Child := th;
  end else begin
   htLast := ANode.Child;
   while ANode.Child <> htLast.Next do htLast := htLast.Next;
   th := THeadTreeNode.CreateText(AText,AHeight,AWidth);
   th.Host := ANode;
   htLast.Next := th;
   th.Next := ANode.Child;
  end;
  Result := th;
end;

procedure THeadTreeNode.FreeAllChild;
var htLast,htm:THeadTreeNode;
begin
  if(Child  = nil) then Exit;
  htLast := Child;

  while  true  do begin
     htLast.FreeAllChild;
     if(Child = htLast.Next) then begin htLast.Free; break; end;
     htm := htLast;
     htLast := htLast.Next;
     htm.Free;
  end;
  Child := nil;
end;



function THeadTreeNode.Find(ANode:THeadTreeNode):Boolean;
var htLast:THeadTreeNode;
begin
  Result := false;
//  if(Child  = nil) then Exit;

  htLast := Self;

  while  true  do begin
     if(htLast = ANode) then begin Result := true; break; end;
     if(htLast.Child <> nil) and (htLast.Child.Find(ANode) = true) then begin Result := true; break; end;
     if(Self = htLast.Next) then begin Result := false; break; end;
     htLast := htLast.Next;
  end;
end;


procedure THeadTreeNode.Union(AFrom,ATo :THeadTreeNode; AText:String;AHeight:Integer);
var th, tUn, TBeforFrom:THeadTreeNode;
    toFinded :Boolean;
     wid:Integer;
begin
  if(Find(AFrom) = false) then raise Exception.Create('Node not in Tree');
  toFinded := True;
  if (AFrom <> ATo)  then  begin   //new
    th := AFrom; toFinded := false;
    while AFrom.HOst.Child <> th.Next do begin
      if(th.Next = ATo) then begin toFinded := true; break; end;
       th := th.Next;
    end;
  end;

  if(toFinded = false) then raise Exception.Create('ATo not in level');

  tUn := ATo.Add(ATo,AText,AHeight,0);
  tUn.VLineWidth := ATo.VLineWidth;
  TBeforFrom := AFrom.Host.Child;
  while TBeforFrom.Next <> AFrom do TBeforFrom := TBeforFrom.Next;

  TBeforFrom.Next := tUn;

  th := AFrom; tUn.Child := AFrom;
  if(th = AFrom.Host.Child) then AFrom.Host.Child := tUn;
  Wid := 0;
  while th <> ATo.Next do begin
    Inc(Wid,th.Width);
    Inc(Wid,tUn.VLineWidth);
    Dec(th.Height,AHeight);
    th.Host := TUn;
    th := th.Next;
  end;
  if (tUn.VLineWidth > 0) then Dec(Wid,tUn.VLineWidth);
  ATo.Next := AFrom;
  tUn.Width := Wid;
end;



//--------------------- CreateFieldTree ---------------------------------------
procedure THeadTreeNode.CreateFieldTree(AGrid:TCustomDBGridEh);
var i,pos,j:Integer;
    node,nodeFrom,nodeTo:THeadTreeNode;
    ss,ss1:String;
    sameWord,GroupDid :Boolean;
begin

  FreeAllChild;


  for i := 0 to AGrid.Columns.Count - 1 do begin
   node := AddChild(Self,AGrid.Columns[i].Title.Caption,
                 AGrid.RowHeights[0],
                 iif(AGrid.Columns[i].Visible,AGrid.Columns[i].Width,iif(dgColLines in AGrid.Options,-1,0)));
   if (AGrid.Columns[i].Title.SortMarker <> smNoneEh) then node.WIndent := 16;
   if (dgColLines in AGrid.Options) then node.VLineWidth := 1 else node.VLineWidth := 0;
   AGrid.FLeafFieldArr[i].FLeaf := node;
  end;

  nodeTo := nil;
  // Группируем.
  while True do  begin //for k := 0 to ListNodeField.Count - 1 do begin
   GroupDid := false;
   for i := 0 to AGrid.Columns.Count - 1 do begin
    ss1 := ExtractWordPos(2,AGrid.FLeafFieldArr[i].FLeaf.Text,['|'],pos);
    if( ss1 <> '' ) then begin
      ss1 := ExtractWord(1,AGrid.FLeafFieldArr[i].FLeaf.Text,['|']);
      nodeFrom := AGrid.FLeafFieldArr[i].FLeaf;
                          //      sameWord := false;
      sameWord := True;
      for j := i to AGrid.Columns.Count - 1 do begin
        if (AGrid.Columns.Count - 1 > j) and
           (ExtractWord(1,AGrid.FLeafFieldArr[j+1].FLeaf.Text,['|']) = ss1) then begin
          ss :=  AGrid.FLeafFieldArr[j].FLeaf.Text;
          Delete(ss,1,pos-1);
          AGrid.FLeafFieldArr[j].FLeaf.Text := ss;
          sameWord := true;
          GroupDid := true;
        end else begin
          if(sameWord = true) then begin
            ss := AGrid.FLeafFieldArr[j].FLeaf.Text;
            Delete(ss,1,pos-1);
//            TLeafField(ListNodeField.Items[j]).Field.DisplayLabel := ss;
            AGrid.FLeafFieldArr[j].FLeaf.Text := ss;
            nodeTo := AGrid.FLeafFieldArr[j].FLeaf;
            GroupDid := true;
          end;
          break;
        end;
      end;
      if(sameWord = true) then begin
        Union(nodeFrom,nodeTo,ss1,20);
        break;
      end;
    end; //if
   end; //i
   if(GroupDid = false) then break;
  end; //k

end;


procedure THeadTreeNode.DoForAllNode(proc:THeadTreeProc);
var htLast:THeadTreeNode;
begin
  if(Child  = nil) then Exit;
  htLast := Child;
  while  true  do begin
     proc(htLast);
     if(htLast.Child <> nil ) then htLast.DoForAllNode(proc);
     if(Child = htLast.Next) then begin break; end;
     htLast := htLast.Next;
  end;
end;


////////
///{strUtils}
////////

function WordPosition(const N: Integer; const S: string; WordDelims: TCharSet): Integer;
var
  Count, I: Integer;
begin
  Count := 0;
  I := 1;
  Result := 0;
  while (I <= Length(S)) and (Count <> N) do begin
    { skip over delimiters }
    while (I <= Length(S)) and (S[I] in WordDelims) do Inc(I);
    { if we're not beyond end of S, we're at the start of a word }
    if I <= Length(S) then Inc(Count);
    { if not finished, find the end of the current word }
    if Count <> N then
      while (I <= Length(S)) and not (S[I] in WordDelims) do Inc(I)
    else Result := I;
  end;
end;

function ExtractWord(N: Integer; const S: string; WordDelims: TCharSet): string;
var
  I: Word;
  Len: Integer;
begin
  Len := 0;
  I := WordPosition(N, S, WordDelims);
  if I <> 0 then
    { find the end of the current word }
    while (I <= Length(S)) and not(S[I] in WordDelims) do begin
      { add the I'th character to result }
      Inc(Len);
      SetLength(Result, Len);
      Result[Len] := S[I];
      Inc(I);
    end;
  SetLength(Result, Len);
end;

function ExtractWordPos(N: Integer; const S: string; WordDelims: TCharSet;
  var Pos: Integer): string;
var
  I, Len: Integer;
begin
  Len := 0;
  I := WordPosition(N, S, WordDelims);
  Pos := I;
  if I <> 0 then
    { find the end of the current word }
    while (I <= Length(S)) and not(S[I] in WordDelims) do begin
      { add the I'th character to result }
      Inc(Len);
      SetLength(Result, Len);
      Result[Len] := S[I];
      Inc(I);
    end;
  SetLength(Result, Len);
end;


procedure TCustomDBGridEh.SetDrawMemoText(const Value: Boolean);
begin
  FDrawMemoText := Value;
  Invalidate;
end;

procedure TCustomDBGridEh.GetCellParams(Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if Assigned(FOnGetCellParams) then
    FOnGetCellParams(Self, Column, AFont, Background, State);
end;


procedure TCustomDBGridEh.EnsureFooterValueType(
  AFooterValueType: TFooterValueType; AFieldName: String);
var i,j:Integer;
    PresentGO:Boolean;
    ASum:TDBSum;
begin
  PresentGO := False;
  FSumList.SumCollection.BeginUpdate;
  if (AFooterValueType in [fvtSum..fvtCount]) then begin
    for i := 0 to FSumList.SumCollection.Count-1 do begin
      if ((FSumList.SumCollection[i].GroupOperation = goSum) and
         (AFooterValueType = fvtSum) and
         (FSumList.SumCollection[i].FieldName = AFieldName)) or
         ((FSumList.SumCollection[i].GroupOperation = goCount) and
         (AFooterValueType = fvtCount)) then
           PresentGO := True;
    end;
    if (PresentGO = False) then begin
      ASum := (FSumList.SumCollection.Add as TDBSum);
      case AFooterValueType of
        fvtSum: begin
                  ASum.GroupOperation := goSum;
                  ASum.FieldName := AFieldName;
                end;
        fvtCount: ASum.GroupOperation := goCount;
      end;
    end;
  end;

  for i := FSumList.SumCollection.Count-1 downto 0 do begin
    PresentGO := False;
    for j := 0 to Columns.Count - 1 do begin
      case Columns[j].Footer.ValueType of
        fvtSum: if (FSumList.SumCollection[i].GroupOperation = goSum) and
                   (FSumList.SumCollection[i].FieldName = Columns[j].FieldName) then begin
                     PresentGO := True;
                     Break;
                 end;
        fvtCount: if (FSumList.SumCollection[i].GroupOperation = goCount) then begin
                     PresentGO := True;
                     Break;
                 end;
      else
        PresentGO := True;
        Break;
      end;
    end;
    if (PresentGO = False) then FSumList.SumCollection[i].Free;
  end;
  FSumList.SumCollection.EndUpdate;
end;

procedure TCustomDBGridEh.InvalidateFooter;
var i:Integer;
begin
  for i := 0 to FooterRowCount-1 do begin
    GridInvalidateRow(Self,RowCount-i-1);
  end;
end;

procedure TCustomDBGridEh.SetSumList(const Value: TDBGridEhSumList);
begin
  FSumList.Assign(Value);
end;

procedure TCustomDBGridEh.SumListChanged(Sender: TObject);
begin
  InvalidateFooter;
end;

function TCustomDBGridEh.CellRect(ACol, ARow: Integer): TRect;
begin
  Result := inherited CellRect(ACol, ARow);
end;

procedure TCustomDBGridEh.GetFooterParams(DataCol, Row: Integer;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  var Alignment: TAlignment; State: TGridDrawState; var Text: String);
begin
  if Assigned(FOnGetFooterParams) then
    FOnGetFooterParams(Self, DataCol, Row, Column, AFont, Background, Alignment, State, Text);
end;

procedure TCustomDBGridEh.DefaultDrawFooterCell(const Rect: TRect; DataCol,
  Row: Integer; Column: TColumnEh; State: TGridDrawState);
var
  Value: string;
  NewBackgrnd: TColor;
  NewAlignment: TAlignment;
  FrameOffs:Integer;
  ARect:TRect;
begin
  ARect := Rect;
  if (dghFooter3D in OptionsEh) then begin
    FrameOffs := 1;
    InflateRect(ARect, -1, -1);
  end
  else FrameOffs := 2;

  Value := GetFooterValue(Row,Column);
  NewBackgrnd := Canvas.Brush.Color;
  NewAlignment := Column.Footer.Alignment;
  Value := GetFooterValue(Row, Column);

  GetFooterParams(DataCol,  Row, Column, Font,
                  NewBackgrnd, NewAlignment, State, Value);

  Canvas.Brush.Color := NewBackgrnd;

  WriteTextEh(Canvas, ARect, True, FrameOffs, FrameOffs, Value, Column.Footer.Alignment,tlTop, Column.Footer.WordWrap and FAllowWordWrap, Column.Footer.EndEllipsis,0,0);
end;

function TCustomDBGridEh.GetFooterValue(Row: Integer; Column: TColumnEh): String;
var
  FmtStr: string;
  Format: TFloatFormat;
  Digits: Integer;
  v:Variant;
begin
  Result := '';
  //\\\
  case Column.Footer.ValueType of
    //fgoNon: FillRect(ARect);
    fvtSum:
      with Column.Field do begin
        v := SumList.SumCollection.GetSumByOpAndFName(goSum,Column.FieldName).SumValue;
        case DataType of
          ftSmallint, ftInteger, ftAutoInc, ftWord :
             with Column.Field as TIntegerField do
             begin
               FmtStr := DisplayFormat;
               if FmtStr = '' then Str(Integer(v), Result) else Result := FormatFloat(FmtStr, v);
             end;
          ftFloat,ftCurrency:
            with Column.Field as TFloatField do
            begin
             if EditFormat = '' then FmtStr := DisplayFormat else FmtStr := EditFormat;
             if FmtStr = '' then
             begin
                if Currency then
                begin
                  Format := ffCurrency;
                  Digits := CurrencyDecimals;
                end
                else begin
                  Format := ffGeneral;
                 Digits := 0;
                end;
                 Result := FloatToStrF(v, Format, Precision, Digits);
              end else
                Result := FormatFloat(FmtStr, v);
            end;
          end;
        end;
        {Result := FloatToStr(SumList.SumCollection.GetSumByOpAndFName(goSum,Column.FieldName).SumValue);}
    fvtCount: Result := FloatToStr(SumList.SumCollection.GetSumByOpAndFName(goCount,'').SumValue);
    fvtFieldValue: if Assigned(DataSource) and Assigned(DataSource.DataSet) and
                        DataSource.DataSet.Active and (Column.Footer.FieldName <> '') then
                      Result := DataSource.DataSet.FieldByName(Column.Footer.FieldName).DisplayText;
    fvtStaticText: Result := Column.Footer.Value;
  end;
end;

procedure TCustomDBGridEh.SumListRecalcAll(Sender: TObject);
begin
  if Assigned(FOnSumListRecalcAll) then
    FOnSumListRecalcAll(SumList);
end;

procedure TCustomDBGridEh.SetHorzScrollBar(
  const Value: TDBGridEhScrollBar);
begin
 FHorzScrollBar.Assign(Value);
end;

procedure TCustomDBGridEh.SetVertScrollBar(
  const Value: TDBGridEhScrollBar);
begin
  FVertScrollBar.Assign(Value);
end;

procedure TCustomDBGridEh.SetOptionsEh(const Value: TDBGridEhOptions);
var I: Integer;
begin
  if (OptionsEh = Value) then Exit;
  if ( dghMultiSortMarking in (FOptionsEh - Value)) then
    for i := FSortMarkedColumns.Count - 1 downto 1 do
      FSortMarkedColumns[i].Title.SortMarker := smNoneEh;
  FOptionsEh := Value;
  LayoutChanged;
end;

function TCustomDBGridEh.VisibleDataRowCount: Integer;
//var i,nvc:Integer;
begin
  Result := VisibleRowCount;
  if FooterRowCount <= 0 then Exit;

  {for i := FooterRowCount+1 downto 0 do begin
    if CellRect(0,RowCount-TitleOffSet-i).Top < ClientHeight then begin
      nvc := i;
      Break;
    end;
  end;}

  Result := Result - FooterRowCount-1;
  if Result < 1 then Result := 1;
end;


{$IFDEF Eh_LIB_4} {Borland Delphi 4.0 or C++ Builder 4.0}
function TCustomDBGridEh.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := (DataLink <> nil) and DataLink.ExecuteAction(Action);
end;

function TCustomDBGridEh.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := (DataLink <> nil) and DataLink.UpdateAction(Action);
end;
{$ENDIF}

procedure TCustomDBGridEh.TimerScroll;
var
  Delta, Distance, Interval, DeltaX, DistanceX: Integer;
  ADataRect:Trect;
  WithSeleting:Boolean;
begin
  Delta := 0;
  Distance := 0;
  ADataRect := DataRect;
  if FMousePos.Y < ADataRect.Top then
  begin
    Delta := -1;
    Distance := ADataRect.Top - FMousePos.Y;
  end;
  if FMousePos.Y >= ADataRect.Bottom then
  begin
    Delta := 1;
    Distance := FMousePos.Y - ADataRect.Bottom + 1;
  end;

  DeltaX := 0;
  DistanceX := 0;
  if FMousePos.X < ADataRect.Left then begin
    DeltaX := -1;
    DistanceX := ADataRect.Left - FMousePos.X;
  end;
  if FMousePos.X >= ADataRect.Right then begin
    DeltaX := 1;
    DistanceX := FMousePos.X - ADataRect.Right;
  end;
  Distance := Max(Distance,DistanceX);
  WithSeleting := ssLeft in FMouseShift;

  if (Delta = 0) and (DeltaX = 0) then StopTimer
  else begin
    if Delta <> 0 then
    begin
       {if (dgMultiSelect in Options) then}
           DoSelection(WithSeleting,iif(Distance div 6 > 8,8,Distance div 6)*Delta,False);
    end;
    if (DeltaX <> 0) and FDataTracking then
      if dgRowSelect in Options then begin
       if (DeltaX < 0) and (LeftCol > FixedCols ) then
          LeftCol := LeftCol + DeltaX
       else if (DeltaX > 0) and (VisibleColCount + LeftCol < ColCount ) then
          LeftCol := LeftCol + DeltaX;
      end else
        MoveCol(Col+DeltaX,0);
    Interval := 200 - Distance * 15;
    if Interval < 0 then Interval := 0;
    KillTimer(Handle, 1);//??????tmp
    SetTimer(Handle, 1, Interval, nil);
    FTimerActive := True;
  end;
end;

procedure TCustomDBGridEh.StopTimer;
begin
  if FTimerActive then
  begin
    KillTimer(Handle, 1);
    FTimerActive := False;
  end;
end;

procedure TCustomDBGridEh.WMTimer(var Message: TMessage);
begin
  inherited ;
  if FIndicatorPressed or FDataTracking then TimerScroll;
end;

function TCustomDBGridEh.DataRect: TRect;
begin
  Result := BoxRect(IndicatorOffset, TitleOffset, ColCount-1, iif(FooterRowCount>0,RowCount-FooterRowCount-2,RowCount));
end;

procedure TCustomDBGridEh.DoSortMarkingChanged;
begin
  if (dghAutoSortMarking in OptionsEh) and Assigned(FOnSortMarkingChanged) then FOnSortMarkingChanged(Self);
end;

procedure TCustomDBGridEh.SetSortMarkedColumns;
var i: Integer;
begin
  SortMarkedColumns.Clear;
  for i := 0 to Columns.Count-1 do
    if Columns[i].Title.SortIndex > 0 then
    begin
      if SortMarkedColumns.Count < Columns[i].Title.SortIndex then
        SortMarkedColumns.Count := Columns[i].Title.SortIndex;
      SortMarkedColumns[Columns[i].Title.SortIndex-1] := Columns[i];
    end;
end;

procedure TCustomDBGridEh.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if FSortMarking and (Key = 17) then begin
    FSortMarking := False;
    DoSortMarkingChanged;
  end;
  inherited KeyUp(Key,Shift);
end;

function TCustomDBGridEh.UpDownBitmap: TBitmap;
var tmpUpDown:TUpDown;
begin
  if FUpDownBitmap = nil then
  begin
    FUpDownBitmap := TBitmap.Create;
    FUpDownBitmap.Height := DefaultRowHeight;
    FUpDownBitmap.Width := FInplaceEditorButtonWidth;
    tmpUpDown := TUpDown.Create(Self);
    try
      tmpUpDown.Visible := False;
      tmpUpDown.Parent := Self;
      tmpUpDown.SetBounds(Width,0,FInplaceEditorButtonWidth,DefaultRowHeight);
      tmpUpDown.Visible := True;
      tmpUpDown.PaintTo(FUpDownBitmap.Canvas.Handle,0,0);
    finally
      tmpUpDown.Free;
    end;
  end
  else if FUpDownBitmap.Height <> DefaultRowHeight then
  begin
    FUpDownBitmap.Free;
    FUpDownBitmap := nil;
    UpDownBitmap;
  end;
  Result := FUpDownBitmap;
end;

{ TColumnFooterEh }

constructor TColumnFooterEh.Create(Column: TColumnEh);
begin
  inherited Create;
  FColumn := Column;
  FFont := TFont.Create;
  FFont.Assign(DefaultFont);
  FFont.OnChange := FontChanged;
end;

destructor TColumnFooterEh.Destroy;
begin
  FFont.Free;
  inherited Destroy;
end;


procedure TColumnFooterEh.Assign(Source: TPersistent);
begin
  if Source is TColumnFooterEh then
  begin
    if cvFooterAlignment in TColumnFooterEh(Source).FColumn.FAssignedValues then
      Alignment := TColumnFooterEh(Source).Alignment;
    if cvFooterColor in TColumnFooterEh(Source).FColumn.FAssignedValues then
      Color := TColumnFooterEh(Source).Color;
    if cvFooterFont in TColumnFooterEh(Source).FColumn.FAssignedValues then
      Font := TColumnFooterEh(Source).Font;
    EndEllipsis := TColumnFooterEh(Source).EndEllipsis;
    ValueType := TColumnFooterEh(Source).ValueType;
    FieldName := TColumnFooterEh(Source).FieldName;
    Value := TColumnFooterEh(Source).Value;
    WordWrap := TColumnFooterEh(Source).WordWrap;
  end
  else
    inherited Assign(Source);
end; 

function TColumnFooterEh.DefaultAlignment: TAlignment;
var
  Field: TField;
begin
  Field := FColumn.Field;
  if Assigned(Field) then
    Result := Field.Alignment
  else
    Result := taLeftJustify;
end;

function TColumnFooterEh.DefaultColor: TColor;
var
  Grid: TCustomDBGridEh;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) then
    Result := Grid.Color
  else
    Result := clWindow;
end;

function TColumnFooterEh.DefaultFont: TFont;
var
  Grid: TCustomDBGridEh;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) then
    Result := Grid.TitleFont
  else
    Result := FColumn.Font;
end;

procedure TColumnFooterEh.FontChanged(Sender: TObject);
begin
  Include(FColumn.FAssignedValues, cvFooterFont);
  FColumn.Changed(True);
end;

function TColumnFooterEh.GetAlignment: TAlignment;
begin
  if cvFooterAlignment in FColumn.FAssignedValues then
    Result := FAlignment
  else
    Result := DefaultAlignment;
end;

function TColumnFooterEh.GetColor: TColor;
begin
  if cvFooterColor in FColumn.FAssignedValues then
    Result := FColor
  else
    Result := DefaultColor;
end;

function TColumnFooterEh.GetFont: TFont;
var
  Save: TNotifyEvent;
  Def: TFont;
begin
  if not (cvFooterFont in FColumn.FAssignedValues) then
  begin
    Def := DefaultFont;
    if (FFont.Handle <> Def.Handle) or (FFont.Color <> Def.Color) then
    begin
      Save := FFont.OnChange;
      FFont.OnChange := nil;
      FFont.Assign(DefaultFont);
      FFont.OnChange := Save;
    end;
  end;
  Result := FFont;
end;

function TColumnFooterEh.IsAlignmentStored: Boolean;
begin
  Result := (cvFooterAlignment in FColumn.FAssignedValues) and
    (FAlignment <> DefaultAlignment);
end;

function TColumnFooterEh.IsColorStored: Boolean;
begin
  Result := (cvFooterColor in FColumn.FAssignedValues) and
    (FColor <> DefaultColor);
end;

function TColumnFooterEh.IsFontStored: Boolean;
begin
  Result := (cvFooterFont in FColumn.FAssignedValues);
end;

procedure TColumnFooterEh.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if (cvFooterFont in FColumn.FAssignedValues) then Exit;
  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
  finally
    FFont.OnChange := Save;
  end;
end;

procedure TColumnFooterEh.RestoreDefaults;
var
  FontAssigned: Boolean;
begin
  FontAssigned := cvFooterFont in FColumn.FAssignedValues;
  FColumn.FAssignedValues := FColumn.FAssignedValues - ColumnEhFooterValues;
  RefreshDefaultFont;
  { If font was assigned, changing it back to default may affect grid title
    height, and title height changes require layout and redraw of the grid. }
  FColumn.Changed(FontAssigned);
end;

procedure TColumnFooterEh.SetAlignment(Value: TAlignment);
begin
  if (cvFooterAlignment in FColumn.FAssignedValues) and (Value = FAlignment) then Exit;
  FAlignment := Value;
  Include(FColumn.FAssignedValues, cvFooterAlignment);
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetColor(Value: TColor);
begin
  if (cvFooterColor in FColumn.FAssignedValues) and (Value = FColor) then Exit;
  FColor := Value;
  Include(FColumn.FAssignedValues, cvFooterColor);
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetEndEllipsis(const Value: Boolean);
begin
  FEndEllipsis := Value;
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetFieldName(const Value: String);
begin
  FFieldName := Value;
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TColumnFooterEh.SetValueType(const Value: TFooterValueType);
//var
//  Grid: TCustomDBGridEh;
begin
  if (ValueType = Value) then Exit;
  FValueType := Value;
  FColumn.EnsureSumValue;
///  Grid := FColumn.GetGrid;
//ddd  if Assigned(Grid) then
//ddd    Grid.EnsureFooterValueType(ValueType,FColumn.FieldName);
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetValue(const Value: String);
begin
  FValue := Value;
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetWordWrap(const Value: Boolean);
begin
  FWordWrap := Value;
  FColumn.Changed(False);
end;

{ TDBGridEhSumList }

constructor TDBGridEhSumList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDesignTimeWork := True;
  Active := False;
end;

function TDBGridEhSumList.GetActive: Boolean;
begin
 Result := inherited Active;
end;

procedure TDBGridEhSumList.SetActive(const Value: Boolean);
begin
  inherited Active := Value;
end;

{ TColumnsEhList }

function TColumnsEhList.GetColumn(Index: Integer): TColumnEh;
begin
  Result := Get(Index);
end;

procedure TColumnsEhList.SetColumn(Index: Integer;
  const Value: TColumnEh);
begin
  Put(Index,Value);
end;


{ TControlScrollBarEh }

constructor TDBGridEhScrollBar.Create(AGrid: TCustomDBGridEh;
  AKind: TScrollBarKind);
begin
  FDBGridEh := AGrid;
  FKind := AKind;
  FVisible := True;
end;

procedure TDBGridEhScrollBar.Assign(Source: TPersistent);
begin
  if Source is TDBGridEhScrollBar then
  begin
    Visible := TControlScrollBar(Source).Visible;
    Tracking := TControlScrollBar(Source).Tracking;
  end
  else inherited Assign(Source);
end;

procedure TDBGridEhScrollBar.SetVisible(Value: Boolean);
begin
  if (FVisible = Value) then Exit;
  FVisible := Value;
  if Assigned(FDBGridEh) and (Kind = sbVertical) then FDBGridEh.UpdateScrollBar;
  if Assigned(FDBGridEh)then FDBGridEh.LayoutChanged;
end;

function TDBGridEhScrollBar.IsScrollBarVisible: Boolean;
var
  Style: Longint;
begin
  Style := WS_HSCROLL;
  if Kind = sbVertical then Style := WS_VSCROLL;
  Result := (Visible) and
            ((GetWindowLong(FDBGridEh.Handle, GWL_STYLE) and Style) <> 0);
end;

var Bmp:TBitmap;

initialization
 SortMarkerFont := TFont.Create;
 Bmp := TBitmap.Create;
 try
   Bmp.LoadFromResourceName(HInstance, bmSmDown);
   SortMarkerFont.Height := -Bmp.Height+1;
   SortMarkerFont.Name := 'Arial';
 finally
   Bmp.Free;
 end;
 GetCheckSize;
finalization
 SortMarkerFont.Free;
end.
