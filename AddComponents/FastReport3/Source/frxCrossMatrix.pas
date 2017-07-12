{******************************************}
{ }
{ FastReport v3.0 }
{ Cross classes }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxCrossMatrix;

interface

{$I frx.inc}

uses
  Windows, SysUtils, Classes, Controls, Graphics, frxClass, frxDMPClass
{$IFDEF Delphi6}
, Variants
{$ENDIF};

const
  CROSS_DIM_SIZE = 16;

type
  { the record represents one cell of cross matrix }
  PfrCrossCell = ^TfrxCrossCell;
  TfrxCrossCell = packed record
    Value:Variant;
    Count:Integer;
    Next:PfrCrossCell; { pointer to the next value in the same cell }
  end;

  TfrxCrossSortOrder = (soAscending, soDescending, soNone);
  TfrxCrossFunction = (cfNone, cfSum, cfMin, cfMax, cfAvg, cfCount);
  TfrxVariantArray = array of Variant;
  TfrxMemoArray = array[0..CROSS_DIM_SIZE-1] of TfrxCustomMemoView;
  TfrxSortArray = array[0..CROSS_DIM_SIZE-1] of TfrxCrossSortOrder;

  { the base class for column/row item. Contains Indexes array that
    identifies a column/row }
  TfrxIndexItem = class(TCollectionItem)
  private
    FIndexes:TfrxVariantArray;
  public
    destructor Destroy; override;
    property Indexes:TfrxVariantArray read FIndexes write FIndexes;
  end;

  { the base collection for column/row items. Contains methods for working
    with Indexes and sorting them }
  TfrxIndexCollection = class(TCollection)
  private
    FIndexesCount:Integer;
    FSortOrder:TfrxSortArray;
    function GetItems(Index:Integer):TfrxIndexItem;
  public
    function Find(const Indexes:array of Variant; var Index:Integer):Boolean;
    function InsertItem(Index:Integer; const Indexes:array of Variant):TfrxIndexItem; virtual;
    property Items[Index:Integer]:TfrxIndexItem read GetItems; default;
  end;

  { the class representing a single row item }
  TfrxCrossRow = class(TfrxIndexItem)
  private
    FCellLevels:Integer;
    FCells:TList;
    procedure CreateCell(Index:Integer);
  public
    constructor Create(Collection:TCollection); override;
    destructor Destroy; override;
    function GetCell(Index:Integer):PfrCrossCell;
    function GetCellValue(Index1, Index2:Integer):Variant;
    procedure SetCellValue(Index1, Index2:Integer; const Value:Variant);
  end;

  { the class representing row items }
  TfrxCrossRows = class(TfrxIndexCollection)
  private
    FCellLevels:Integer;
    function GetItems(Index:Integer):TfrxCrossRow;
  public
    constructor Create;
    function InsertItem(Index:Integer; const Indexes:array of Variant):TfrxIndexItem; override;
    function Row(const Indexes:array of Variant):TfrxCrossRow;
    property Items[Index:Integer]:TfrxCrossRow read GetItems; default;
  end;

  { the class representing a single column item }
  TfrxCrossColumn = class(TfrxIndexItem)
  private
    FCellIndex:Integer;
  public
    property CellIndex:Integer read FCellIndex write FCellIndex;
  end;

  { the class representing column items }
  TfrxCrossColumns = class(TfrxIndexCollection)
  private
    function GetItems(Index:Integer):TfrxCrossColumn;
  public
    constructor Create;
    function Column(const Indexes:array of Variant):TfrxCrossColumn;
    function InsertItem(Index:Integer; const Indexes:array of Variant):TfrxIndexItem; override;
    property Items[Index:Integer]:TfrxCrossColumn read GetItems; default;
  end;

  { TfrxCrossHeader represents one cell of a cross header. The cell has a value,
    position, size and list of subcells }
  TfrxCrossHeader = class(TObject)
  private
    FBounds:TfrxRect; { bounds of the cell }
    FMemos:TfrxMemoArray;
    FTotalMemos:TfrxMemoArray;
    FCounts:TfrxVariantArray;
    FCellLevels:Integer;
    FFuncValues:TfrxVariantArray;
    FIsTotal:Boolean; { is this cell a total cell }
    FItems:TList; { subcells }
    FLevelsCount:Integer; { number of header levels }
    FMemo:TfrxCustomMemoView; { memo for this cell }
    FParent:TfrxCrossHeader; { parent of the cell }
    FSize:TfrxPoint;
    FValue:Variant; { value (text) of the cell }
    FVisible:Boolean; { visibility of the cell }
    FCellSizes:array[0..CROSS_DIM_SIZE-1] of Extended;

    procedure AddFuncValues(const Values, Counts:array of Variant;
      const CellFunctions:array of TfrxCrossFunction);
    procedure AddValues(const Values:array of Variant);
    procedure Reset(const CellFunctions:array of TfrxCrossFunction);
    procedure CalcSizes(MaxWidth, MinWidth:Integer);
    procedure CalcBounds; virtual; abstract;

    function GetCount:Integer;
    function GetItems(Index:Integer):TfrxCrossHeader;
    function GetLevel:Integer;
    function GetHeight:Extended;
    function GetWidth:Extended;
    function GetCellSizes(Index:Integer):Extended;
    procedure SetCellSizes(Index:Integer; const Value:Extended);
  public
    constructor Create(CellLevels:Integer);
    destructor Destroy; override;

    function AllItems:TList;
    function Find(Value:Variant):Integer;
    function GetIndexes:Variant;
    function GetValues:Variant;
    function TerminalItems:TList;

    property Bounds:TfrxRect read FBounds write FBounds;
    property CellSizes[Index:Integer]:Extended read GetCellSizes write SetCellSizes;
    property Count:Integer read GetCount;
    property Height:Extended read GetHeight;
    property IsTotal:Boolean read FIsTotal;
    property Items[Index:Integer]:TfrxCrossHeader read GetItems; default;
    property Level:Integer read GetLevel;
    property Memo:TfrxCustomMemoView read FMemo;
    property Parent:TfrxCrossHeader read FParent;
    property Value:Variant read FValue write FValue;
    property Visible:Boolean read FVisible write FVisible;
    property Width:Extended read GetWidth;
  end;

  { the cross columns }
  TfrxCrossColumnHeader = class(TfrxCrossHeader)
  private
    procedure CalcBounds; override;
  end;

  { the cross rows }
  TfrxCrossRowHeader = class(TfrxCrossHeader)
  private
    procedure CalcBounds; override;
  end;

  TfrxCrossCalcSizeEvent = procedure (Index:Integer; var Size:Extended) of object;

  { the cross matrix. Contains cross body (matrix), row and column headers }
  TfrxCrossMatrix = class(TObject)
  private
    FCellFunctions:array[0..CROSS_DIM_SIZE-1] of TfrxCrossFunction;
    FCellLevels:Integer;
    FColumnHeader:TfrxCrossColumnHeader;
    FColumns:TfrxCrossColumns;
    FColumnSort:TfrxSortArray;
    FDefHeight:Integer;
    FGapX:Integer;
    FGapY:Integer;
    FMaxWidth:Integer;
    FMinWidth:Integer;
    FNoColumns:Boolean;
    FNoRows:Boolean;
    FPlainCells:Boolean;
    FRowHeader:TfrxCrossRowHeader;
    FRows:TfrxCrossRows;
    FRowSort:TfrxSortArray;

    FCellMemos:TfrxMemoArray;
    FColumnMemos:TfrxMemoArray;
    FColumnTotalMemos:TfrxMemoArray;
    FRowMemos:TfrxMemoArray;
    FRowTotalMemos:TfrxMemoArray;
    FOnCalcHeight:TfrxCrossCalcSizeEvent;
    FOnCalcWidth:TfrxCrossCalcSizeEvent;
    procedure CalcTotal(Header:TfrxCrossHeader; Source:TfrxIndexCollection);
    procedure CreateHeader(Header:TfrxCrossHeader; Source:TfrxIndexCollection;
      const Totals:TfrxMemoArray; TotalVisible:Boolean);
    procedure SetCellFunctions(Index:Integer; const Value:TfrxCrossFunction);
    procedure SetColumnSort(Index:Integer; Value:TfrxCrossSortOrder);
    procedure SetRowSort(Index:Integer; Value:TfrxCrossSortOrder);
    function GetCellFunctions(Index:Integer):TfrxCrossFunction;
    function GetCellMemos(Index:Integer):TfrxCustomMemoView;
    function GetColumnMemos(Index:Integer):TfrxCustomMemoView;
    function GetColumnSort(Index:Integer):TfrxCrossSortOrder;
    function GetColumnTotalMemos(Index:Integer):TfrxCustomMemoView;
    function GetRowMemos(Index:Integer):TfrxCustomMemoView;
    function GetRowSort(Index:Integer):TfrxCrossSortOrder;
    function GetRowTotalMemos(Index:Integer):TfrxCustomMemoView;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Init(RowLevels, ColumnLevels, CellLevels:Integer);
    procedure InitMemos(DotMatrix:Boolean);
    procedure Clear;
    procedure ClearMemos;

    procedure AddValue(const Rows, Columns, Cells:array of Variant);
    function GetValue(ARow, AColumn, ACell:Integer):Variant;
    function GetColumnIndexes(AColumn:Integer):Variant;
    function GetRowIndexes(ARow:Integer):Variant;

    procedure CreateHeaders;
    procedure CalcTotals;
    procedure CalcBounds;

    function ColCount:Integer;
    function RowCount:Integer;
    function IsGrandTotalColumn(Index:Integer):Boolean;
    function IsGrandTotalRow(Index:Integer):Boolean;
    function IsTotalColumn(Index:Integer):Boolean;
    function IsTotalRow(Index:Integer):Boolean;
    function GetDrawSize:TfrxPoint;

    property ColumnHeader:TfrxCrossColumnHeader read FColumnHeader;
    property RowHeader:TfrxCrossRowHeader read FRowHeader;
    property NoColumns:Boolean read FNoColumns;
    property NoRows:Boolean read FNoRows;

    property CellFunctions[Index:Integer]:TfrxCrossFunction read GetCellFunctions
      write SetCellFunctions;
    property CellMemos[Index:Integer]:TfrxCustomMemoView read GetCellMemos;
    property ColumnMemos[Index:Integer]:TfrxCustomMemoView read GetColumnMemos;
    property ColumnSort[Index:Integer]:TfrxCrossSortOrder read GetColumnSort
      write SetColumnSort;
    property ColumnTotalMemos[Index:Integer]:TfrxCustomMemoView read GetColumnTotalMemos;
    property DefHeight:Integer read FDefHeight write FDefHeight;
    property GapX:Integer read FGapX write FGapX;
    property GapY:Integer read FGapY write FGapY;
    property MaxWidth:Integer read FMaxWidth write FMaxWidth;
    property MinWidth:Integer read FMinWidth write FMinWidth;
    property PlainCells:Boolean read FPlainCells write FPlainCells;
    property RowMemos[Index:Integer]:TfrxCustomMemoView read GetRowMemos;
    property RowSort[Index:Integer]:TfrxCrossSortOrder read GetRowSort
      write SetRowSort;
    property RowTotalMemos[Index:Integer]:TfrxCustomMemoView read GetRowTotalMemos;
    property OnCalcHeight:TfrxCrossCalcSizeEvent read FOnCalcHeight write FOnCalcHeight;
    property OnCalcWidth:TfrxCrossCalcSizeEvent read FOnCalcWidth write FOnCalcWidth;
  end;

implementation

uses frxUtils;

function CalcSize(m:TfrxCustomMemoView):TfrxPoint;
var
  e:Extended;
begin
  m.Height:= 10000;

  Result.X:= m.CalcWidth;
  Result.Y:= m.CalcHeight;

  if m is TfrxDMPMemoView then
  begin
    Result.X:= Result.X+fr1CharX;
    Result.Y:= Result.Y+fr1CharY;
  end;

  if (m.Rotation = 90) or (m.Rotation = 270) then
  begin
    e:= Result.X;
    Result.X:= Result.Y;
    Result.Y:= e;
  end;
end;

{ TfrxIndexItem }

destructor TfrxIndexItem.Destroy;
begin
  FIndexes:= nil;
  inherited;
end;

{ TfrxIndexCollection }

function TfrxIndexCollection.GetItems(Index:Integer):TfrxIndexItem;
begin
  Result:= TfrxIndexItem(inherited Items[Index]);
end;

function TfrxIndexCollection.Find(const Indexes:array of Variant;
  var Index:Integer):Boolean;
var
  i, i0, i1, c:Integer;
  Item:TfrxIndexItem;

  function Compare:Integer;
  var
    i:Integer;
  begin
    Result:= 0;
    for i:= 0 to FIndexesCount-1 do
      if Item.Indexes[i] = Indexes[i] then
        Result:= 0
      else if Item.Indexes[i] > Indexes[i] then
      begin
        if FSortOrder[i] = soAscending then
          Result:= 1 else
          Result:=-1;
        break;
      end
      else if Item.Indexes[i] < Indexes[i] then
      begin
        if FSortOrder[i] = soAscending then
          Result:=-1 else
          Result:= 1;
        break;
      end;
  end;

begin
  Result:= False;

  if FSortOrder[0] = soNone then
  begin
    for i:= 0 to Count-1 do
    begin
      Item:= TfrxIndexItem(Items[i]);
      if Compare = 0 then
      begin
        Result:= True;
        Index:= i;
        Exit;
      end;
    end;

    Index:= Count;
    Exit;
  end;

  { quick find }
  i0:= 0;
  i1:= Count-1;

  while i0 <= i1 do
  begin
    i:= (i0+i1) div 2;
    Item:= TfrxIndexItem(Items[i]);
    c:= Compare;

    if c < 0 then
      i0:= i+1
    else
    begin
      i1:= i-1;
      if c = 0 then
      begin
        Result:= True;
        i0:= i;
      end;
    end;
  end;

  Index:= i0;
end;

function TfrxIndexCollection.InsertItem(Index:Integer;
  const Indexes:array of Variant):TfrxIndexItem;
var
  i:Integer;
begin
  if Index < Count then
    Result:= TfrxIndexItem(Insert(Index)) else
    Result:= TfrxIndexItem(Add);
  SetLength(Result.FIndexes, FIndexesCount);
  for i:= 0 to FIndexesCount-1 do
    Result.FIndexes[i]:= Indexes[i];
end;

{ TfrxCrossRow }

constructor TfrxCrossRow.Create;
begin
  inherited;
  FCells:= TList.Create;
end;

destructor TfrxCrossRow.Destroy;
var
  i:Integer;
  c, c1:PfrCrossCell;
begin
  for i:= 0 to FCells.Count-1 do
  begin
    c:= FCells[i];
    while c<>nil do
    begin
      c1:= c;
      c:= c.Next;
      VarClear(c1.Value);
      Dispose(c1);
    end;
  end;

  FCells.Free;
  inherited;
end;

procedure TfrxCrossRow.CreateCell(Index:Integer);
var
  i:Integer;
  c, c1:PfrCrossCell;
begin
  while Index >= FCells.Count do
  begin
    c1:= nil;
    for i:= 0 to FCellLevels-1 do
    begin
      New(c);
      c.Value:= Null;
      c.Count:= 1;
      c.Next:= nil;
      if c1<>nil then
        c1.Next:= c else
        FCells.Add(c);
      c1:= c;
    end;
  end;
end;

function TfrxCrossRow.GetCellValue(Index1, Index2:Integer):Variant;
var
  c:PfrCrossCell;
begin
  Result:= Null;
  if (Index1 < 0) or (Index1 >= FCells.Count) then Exit;

  c:= FCells[Index1];
  while (c<>nil) and (Index2 > 0) do
  begin
    c:= c.Next;
    Dec(Index2);
  end;

  if c<>nil then
    Result:= c.Value;
end;

procedure TfrxCrossRow.SetCellValue(Index1, Index2:Integer; const Value:Variant);
var
  c:PfrCrossCell;
begin
  if Index1 < 0 then Exit;
  if Index1 >= FCells.Count then
    CreateCell(Index1);

  c:= FCells[Index1];
  while (c<>nil) and (Index2 > 0) do
  begin
    c:= c.Next;
    Dec(Index2);
  end;
  if c<>nil then
    if c.Value = Null then
      c.Value:= Value else
      c.Value:= c.Value+Value;
end;

function TfrxCrossRow.GetCell(Index:Integer):PfrCrossCell;
begin
  Result:= nil;
  if Index < 0 then Exit;

  if Index >= FCells.Count then
    CreateCell(Index);

  Result:= FCells[Index];
end;

{ TfrxCrossRows }

constructor TfrxCrossRows.Create;
begin
  inherited Create(TfrxCrossRow);
end;

function TfrxCrossRows.GetItems(Index:Integer):TfrxCrossRow;
begin
  Result:= TfrxCrossRow(inherited Items[Index]);
end;

function TfrxCrossRows.InsertItem(Index:Integer;
  const Indexes:array of Variant):TfrxIndexItem;
begin
  Result:= inherited InsertItem(Index, Indexes);
  TfrxCrossRow(Result).FCellLevels:= FCellLevels;
end;

function TfrxCrossRows.Row(const Indexes:array of Variant):TfrxCrossRow;
var
  i:Integer;
begin
  if Find(Indexes, i) then
    Result:= Items[i] else
    Result:= TfrxCrossRow(InsertItem(i, Indexes));
end;

{ TfrxCrossColumns }

constructor TfrxCrossColumns.Create;
begin
  inherited Create(TfrxCrossColumn);
end;

function TfrxCrossColumns.GetItems(Index:Integer):TfrxCrossColumn;
begin
  Result:= TfrxCrossColumn(inherited Items[Index]);
end;

function TfrxCrossColumns.Column(const Indexes:array of Variant):TfrxCrossColumn;
var
  i:Integer;
begin
  if Find(Indexes, i) then
    Result:= Items[i] else
    Result:= TfrxCrossColumn(InsertItem(i, Indexes));
end;

function TfrxCrossColumns.InsertItem(Index:Integer;
  const Indexes:array of Variant):TfrxIndexItem;
begin
  Result:= inherited InsertItem(Index, Indexes);
  TfrxCrossColumn(Result).FCellIndex:= Count-1;
end;

{ TfrxCrossHeader }

constructor TfrxCrossHeader.Create(CellLevels:Integer);
begin
  FItems:= TList.Create;
  FCellLevels:= CellLevels;
  FValue:= Null;
  FVisible:= True;

  SetLength(FFuncValues, FCellLevels);
  SetLength(FCounts, FCellLevels);
end;

destructor TfrxCrossHeader.Destroy;
begin
  FFuncValues:= nil;
  FCounts:= nil;

  while FItems.Count > 0 do
  begin
    TfrxCrossHeader(FItems[0]).Free;
    FItems.Delete(0);
  end;

  FItems.Free;
  inherited;
end;

function TfrxCrossHeader.GetItems(Index:Integer):TfrxCrossHeader;
begin
  Result:= TfrxCrossHeader(FItems[Index]);
end;

function TfrxCrossHeader.GetCount:Integer;
begin
  Result:= FItems.Count;
end;

function TfrxCrossHeader.GetLevel:Integer;
var
  h:TfrxCrossHeader;
begin
  Result:=-2;
  h:= Self;

  while h<>nil do
  begin
    h:= h.Parent;
    Inc(Result);
  end;
end;

function TfrxCrossHeader.Find(Value:Variant):Integer;
var
  i:Integer;
begin
  { find the cell containing the given value }
  Result:=-1;
  for i:= 0 to Count-1 do
// if AnsiCompareText(VarToStr(Items[i].Value), VarToStr(Value)) = 0 then
    if VarToStr(Items[i].Value) = VarToStr(Value) then
    begin
      Result:= i;
      Exit;
    end;
end;

procedure TfrxCrossHeader.AddValues(const Values:array of Variant);
var
  i, j:Integer;
  Header, Header1:TfrxCrossHeader;
  v:Variant;
  s:String;
begin
  { create the header tree. For example, subsequent calls
      AddValues([1998,1]);
      AddValues([1998,2]);
      AddValues([1999,1]);
    will create the header
      1998 | 1999
     --+--+-----
      1 |2 | 1 }

  Header:= Self;

  for i:= Low(Values) to High(Values) do
  begin
    j:= Header.Find(Values[i]);
    if j<>-1 then
      Header:= Header.Items[j] { find existing item... }
    else
    begin
      { ...or create new one }
      Header1:= TfrxCrossHeader(NewInstance);
      Header1.Create(FCellLevels);
      { link it to the parent }
      Header.FItems.Add(Header1);
      Header1.FParent:= Header;

      v:= Values[i];
      s:= VarToStr(v);
      { this is subtotal item }
      if Pos('@@@', s) = 1 then
      begin
        { remove @@@ }
        s:= Copy(s, 4, Length(s)-5);
        v:= s;
        Header1.FIsTotal:= True;
        Header1.FMemo:= FTotalMemos[i];
      end
      else
        Header1.FMemo:= FMemos[i];

      Header1.FValue:= v;
      Header:= Header1;

      if Header.FIsTotal then break;
    end;
  end;
end;

procedure TfrxCrossHeader.Reset(const CellFunctions:array of TfrxCrossFunction);
var
  i:Integer;
  h:TfrxCrossHeader;
begin
  { reset aggregate values for this cell and all its parent cells }
  h:= Self;

  while h<>nil do
  begin
    for i:= 0 to FCellLevels-1 do
    begin
      case CellFunctions[i] of
        cfNone, cfMin, cfMax:
          h.FFuncValues[i]:= Null;

        cfSum, cfAvg, cfCount:
          h.FFuncValues[i]:= 0;
      end;

      h.FCounts[i]:= 0;
    end;

    h:= h.Parent;
  end;
end;

procedure TfrxCrossHeader.AddFuncValues(const Values, Counts:array of Variant;
  const CellFunctions:array of TfrxCrossFunction);
var
  i:Integer;
  h:TfrxCrossHeader;
begin
  { add aggregate values for this cell and all its parent cells }
  h:= Self;

  while h<>nil do
  begin
    for i:= 0 to FCellLevels-1 do
      if Values[i]<>Null then
        case CellFunctions[i] of
          cfNone:;

          cfSum:
            h.FFuncValues[i]:= h.FFuncValues[i]+Values[i];

          cfMin:
            if (h.FFuncValues[i] = Null) or (Values[i] < h.FFuncValues[i]) then
              h.FFuncValues[i]:= Values[i];

          cfMax:
            if (h.FFuncValues[i] = Null) or (Values[i] > h.FFuncValues[i]) then
              h.FFuncValues[i]:= Values[i];

          cfAvg:
            begin
              h.FFuncValues[i]:= h.FFuncValues[i]+Values[i];
              h.FCounts[i]:= h.FCounts[i]+Counts[i];
            end;

          cfCount:
            h.FFuncValues[i]:= h.FFuncValues[i]+Values[i];//+Counts[i];
        end;

    h:= h.Parent;
  end;
end;

function TfrxCrossHeader.AllItems:TList;

  procedure EnumItems(Item:TfrxCrossHeader);
  var
    i:Integer;
  begin
    if Item.Parent<>nil then
      Result.Add(Item);

    for i:= 0 to Item.Count-1 do
      EnumItems(Item[i]);
  end;

begin
  { list all items in the header }
  Result:= TList.Create;
  EnumItems(Self);
end;

function TfrxCrossHeader.TerminalItems:TList;
var
  i:Integer;
begin
  { list all terminal items in the header }
  Result:= AllItems;
  i:= 0;
  while i < Result.Count do
    if TfrxCrossHeader(Result[i]).Count<>0 then
      Result.Delete(i) else
      Inc(i);
end;

function TfrxCrossHeader.GetIndexes:Variant;
var
  ar:array[0..CROSS_DIM_SIZE-1] of Variant;
  i, n:Integer;
  h, h1:TfrxCrossHeader;
begin
  n:= 0;
  h:= Parent;
  h1:= Self;
  while h<>nil do
  begin
    ar[n]:= h.FItems.IndexOf(h1);
    Inc(n);
    h1:= h;
    h:= h.Parent;
  end;

  Result:= VarArrayCreate([0, CROSS_DIM_SIZE-1], varVariant);
  for i:= 0 to CROSS_DIM_SIZE-1 do
    if i < n then
      Result[i]:= ar[n-i-1] else
      Result[i]:= Null;
end;

function TfrxCrossHeader.GetValues:Variant;
var
  ar:array[0..CROSS_DIM_SIZE-1] of Variant;
  i, n:Integer;
  h:TfrxCrossHeader;
begin
  n:= 0;
  h:= Self;
  while h.Parent<>nil do
  begin
    ar[n]:= h.Value;
    Inc(n);
    h:= h.Parent;
  end;

  Result:= VarArrayCreate([0, CROSS_DIM_SIZE-1], varVariant);
  for i:= 0 to CROSS_DIM_SIZE-1 do
    if i < n then
      Result[i]:= ar[n-i-1] else
      Result[i]:= Null;
end;

procedure TfrxCrossHeader.CalcSizes(MaxWidth, MinWidth:Integer);
var
  i:Integer;
  Items:TList;
  Item:TfrxCrossHeader;
  s:String;
begin
  Items:= AllItems;

  for i:= 0 to Items.Count-1 do
  begin
    Item:= Items[i];
    Item.FMemo.Width:= MaxWidth;
    s:= Item.FMemo.Text;
    Item.FMemo.Text:= Item.FMemo.FormatData(Item.Value);
    Item.FSize:= CalcSize(Item.FMemo);
    Item.FMemo.Text:= s;

    if Item.FSize.X < MinWidth then
      Item.FSize.X:= MinWidth;
    if Item.FSize.X > MaxWidth then
      Item.FSize.X:= MaxWidth;
  end;

  Items.Free;
end;

function TfrxCrossHeader.GetHeight:Extended;
var
  Items:TList;
begin
  Items:= TerminalItems;

  if (Items.Count > 0) and FVisible then
    Result:= TfrxCrossHeader(Items[Items.Count-1]).Bounds.Top+
      TfrxCrossHeader(Items[Items.Count-1]).Bounds.Bottom else
    Result:= 0;

  Items.Free;
end;

function TfrxCrossHeader.GetWidth:Extended;
var
  Items:TList;
begin
  Items:= TerminalItems;

  if (Items.Count > 0) and FVisible then
    Result:= TfrxCrossHeader(Items[Items.Count-1]).Bounds.Left+
      TfrxCrossHeader(Items[Items.Count-1]).Bounds.Right else
    Result:= 0;

  Items.Free;
end;

function TfrxCrossHeader.GetCellSizes(Index:Integer):Extended;
begin
  Result:= FCellSizes[Index];
end;

procedure TfrxCrossHeader.SetCellSizes(Index:Integer;
  const Value:Extended);
begin
  FCellSizes[Index]:= Value;
end;

{ TfrxCrossColumnHeader }

procedure TfrxCrossColumnHeader.CalcBounds;
var
  i, j, l:Integer;
  h:Extended;
  Items:TList;
  Item:TfrxCrossHeader;
  LevelHeights:array of Extended;

  function DoAdjust(Item:TfrxCrossHeader):Extended;
  var
    i:Integer;
    Width:Extended;
  begin
    if Item.Count = 0 then
    begin
      Result:= Item.FSize.X;
      Exit;
    end;

    Width:= 0;
    for i:= 0 to Item.Count-1 do
      Width:= Width+DoAdjust(Item[i]);

    if Item.FSize.X < Width then
      Item.FSize.X:= Width else
      Item[Item.Count-1].FSize.X:= Item[Item.Count-1].FSize.X+Item.FSize.X-Width;

    Result:= Item.FSize.X;
  end;

  procedure FillBounds(Item:TfrxCrossHeader; Offset:TfrxPoint);
  var
    i, j, l:Integer;
    h:Extended;
  begin
    l:= Item.Level;
    if l<>-1 then
      h:= LevelHeights[l] else
      h:= 0;

    if Item.IsTotal then
      for j:= l+1 to FLevelsCount-1 do
        h:= h+LevelHeights[j];

    Item.FBounds:= frxRect(Offset.X, Offset.Y, Item.FSize.X, h);
    Offset.Y:= Offset.Y+h;

    for i:= 0 to Item.Count-1 do
    begin
      FillBounds(Item[i], Offset);
      Offset.X:= Offset.X+Item[i].FSize.X;
    end;
  end;

begin
  DoAdjust(Self);

  SetLength(LevelHeights, FLevelsCount);

  Items:= AllItems;

// calculate height of each row
  for i:= 0 to Items.Count-1 do
  begin
    Item:= Items[i];
    l:= Item.Level;

    if Item.IsTotal then
      if l<>FLevelsCount-1 then continue;

    if l >= 0 then
      if Item.FSize.Y > LevelHeights[l] then
        LevelHeights[l]:= Item.FSize.Y;
  end;

// adjust totals
  for i:= 0 to Items.Count-1 do
  begin
    Item:= Items[i];
    l:= Item.Level;

    if Item.IsTotal and (l < FLevelsCount-1) then
    begin
      h:= 0;
      for j:= l to FLevelsCount-1 do
        h:= h+LevelHeights[j];

      if Item.FSize.Y > h then
        LevelHeights[FLevelsCount-1]:= LevelHeights[FLevelsCount-1]+Item.FSize.Y-h;
    end;
  end;

  FillBounds(Self, frxPoint(0, 0));

  Items.Free;
  LevelHeights:= nil;
end;

{ TfrxCrossRowHeader }

procedure TfrxCrossRowHeader.CalcBounds;
var
  i, j, l:Integer;
  h:Extended;
  Items:TList;
  Item:TfrxCrossHeader;
  LevelHeights:array of Extended;

  function DoAdjust(Item:TfrxCrossHeader):Extended;
  var
    i:Integer;
    Width:Extended;
  begin
    if Item.Count = 0 then
    begin
      Result:= Item.FSize.Y;
      Exit;
    end;

    Width:= 0;
    for i:= 0 to Item.Count-1 do
      Width:= Width+DoAdjust(Item[i]);

    if Item.FSize.Y < Width then
      Item.FSize.Y:= Width else
      Item[Item.Count-1].FSize.Y:= Item[Item.Count-1].FSize.Y+Item.FSize.Y-Width;

    Result:= Item.FSize.Y;
  end;

  procedure FillBounds(Item:TfrxCrossHeader; Offset:TfrxPoint);
  var
    i, j, l:Integer;
    h:Extended;
  begin
    l:= Item.Level;
    if l<>-1 then
      h:= LevelHeights[l] else
      h:= 0;

    if Item.IsTotal then
      for j:= l+1 to FLevelsCount-1 do
        h:= h+LevelHeights[j];

    Item.FBounds:= frxRect(Offset.X, Offset.Y, h, Item.FSize.Y);
    Offset.X:= Offset.X+h;

    for i:= 0 to Item.Count-1 do
    begin
      FillBounds(Item[i], Offset);
      Offset.Y:= Offset.Y+Item[i].FSize.Y;
    end;
  end;

begin
  DoAdjust(Self);

  SetLength(LevelHeights, FLevelsCount);

  Items:= AllItems;

// calculate height of each row
  for i:= 0 to Items.Count-1 do
  begin
    Item:= Items[i];
    l:= Item.Level;

    if Item.IsTotal then
      if l<>FLevelsCount-1 then continue;

    if l >= 0 then
      if Item.FSize.X > LevelHeights[l] then
        LevelHeights[l]:= Item.FSize.X;
  end;

// adjust totals
  for i:= 0 to Items.Count-1 do
  begin
    Item:= Items[i];
    l:= Item.Level;

    if Item.IsTotal and (l < FLevelsCount-1) then
    begin
      h:= 0;
      for j:= l to FLevelsCount-1 do
        h:= h+LevelHeights[j];

      if Item.FSize.X > h then
        LevelHeights[FLevelsCount-1]:= LevelHeights[FLevelsCount-1]+Item.FSize.X-h;
    end;
  end;

  FillBounds(Self, frxPoint(0, 0));

  Items.Free;
  LevelHeights:= nil;
end;

{ TfrxCrossMatrix }

constructor TfrxCrossMatrix.Create;
begin
  FGapX:= 3;
  FGapY:= 3;
  InitMemos(False);
end;

destructor TfrxCrossMatrix.Destroy;
begin
  Clear;
  ClearMemos;
  inherited;
end;

procedure TfrxCrossMatrix.InitMemos(DotMatrix:Boolean);
var
  i:Integer;
  s:String;

  procedure SetDefProps(m:TfrxCustomMemoView);
  begin
    m.HAlign:= haCenter;
    m.VAlign:= vaCenter;
    m.Frame.Typ:= [ftLeft, ftRight, ftTop, ftBottom];
  end;

  function CreateMemo:TfrxCustomMemoView;
  begin
    if DotMatrix then
      Result:= TfrxDMPMemoView.Create(nil) else
      Result:= TfrxMemoView.Create(nil);
  end;

begin
  ClearMemos;
  for i:= 0 to CROSS_DIM_SIZE-1 do
  begin
    FCellMemos[i]:= CreateMemo;
    FColumnMemos[i]:= CreateMemo;
    FColumnTotalMemos[i]:= CreateMemo;
    FRowMemos[i]:= CreateMemo;
    FRowTotalMemos[i]:= CreateMemo;
    FCellFunctions[i]:= cfSum;
    FColumnSort[i]:= soAscending;
    FRowSort[i]:= soAscending;

    SetDefProps(FCellMemos[i]);
    FCellMemos[i].HAlign:= haRight;
    FCellMemos[i].Style:= 'cell';
    FCellMemos[i].Tag:= i;

    SetDefProps(FColumnMemos[i]);
    FColumnMemos[i].Style:= 'column';
    FColumnMemos[i].Tag:= 100+i;

    SetDefProps(FColumnTotalMemos[i]);
    if i = 0 then
    begin
      s:= 'Grand Total';
      FColumnTotalMemos[i].Style:= 'colgrand';
    end
    else
    begin
      s:= 'Total';
      FColumnTotalMemos[i].Style:= 'coltotal';
    end;
    FColumnTotalMemos[i].Text:= s;
    FColumnTotalMemos[i].Font.Style:= [fsBold];
    FColumnTotalMemos[i].Tag:= 300+i;

    SetDefProps(FRowMemos[i]);
    FRowMemos[i].Style:= 'row';
    FRowMemos[i].Tag:= 200+i;

    SetDefProps(FRowTotalMemos[i]);
    if i = 0 then
    begin
      s:= 'Grand Total';
      FRowTotalMemos[i].Style:= 'rowgrand';
    end
    else
    begin
      s:= 'Total';
      FRowTotalMemos[i].Style:= 'rowtotal';
    end;
    FRowTotalMemos[i].Text:= s;
    FRowTotalMemos[i].Font.Style:= [fsBold];
    FRowTotalMemos[i].Tag:= 400+i;
  end;
end;

procedure TfrxCrossMatrix.ClearMemos;
var
  i:Integer;
begin
  for i:= 0 to CROSS_DIM_SIZE-1 do
  begin
    FCellMemos[i].Free;
    FCellMemos[i]:= nil;
    FColumnMemos[i].Free;
    FColumnMemos[i]:= nil;
    FColumnTotalMemos[i].Free;
    FColumnTotalMemos[i]:= nil;
    FRowMemos[i].Free;
    FRowMemos[i]:= nil;
    FRowTotalMemos[i].Free;
    FRowTotalMemos[i]:= nil;
  end;
end;

procedure TfrxCrossMatrix.Init(RowLevels, ColumnLevels, CellLevels:Integer);
var
  i:Integer;
begin
  Clear;
  FNoRows:= RowLevels = 0;
  if RowLevels = 0 then
    RowLevels:= 1;
  FNoColumns:= ColumnLevels = 0;
  if ColumnLevels = 0 then
    ColumnLevels:= 1;

  FCellLevels:= CellLevels;

  FRows:= TfrxCrossRows.Create;
  FRows.FIndexesCount:= RowLevels;
  FRows.FSortOrder:= FRowSort;
  FRows.FCellLevels:= FCellLevels;

  FColumns:= TfrxCrossColumns.Create;
  FColumns.FIndexesCount:= ColumnLevels;
  FColumns.FSortOrder:= FColumnSort;

  FRowHeader:= TfrxCrossRowHeader.Create(FCellLevels);
  FRowHeader.FMemos:= FRowMemos;
  FRowHeader.FTotalMemos:= FRowTotalMemos;
  FRowHeader.FLevelsCount:= RowLevels;

  FColumnHeader:= TfrxCrossColumnHeader.Create(FCellLevels);
  FColumnHeader.FMemos:= FColumnMemos;
  FColumnHeader.FTotalMemos:= FColumnTotalMemos;
  FColumnHeader.FLevelsCount:= ColumnLevels;

  for i:= 0 to CROSS_DIM_SIZE-1 do
  begin
    FCellMemos[i].GapX:= FGapX;
    FCellMemos[i].GapY:= FGapY;
    FCellMemos[i].AllowExpressions:= False;
    FColumnMemos[i].GapX:= FGapX;
    FColumnMemos[i].GapY:= FGapY;
    FColumnMemos[i].AllowExpressions:= False;
    FColumnTotalMemos[i].GapX:= FGapX;
    FColumnTotalMemos[i].GapY:= FGapY;
    FColumnTotalMemos[i].AllowExpressions:= False;
    FRowMemos[i].GapX:= FGapX;
    FRowMemos[i].GapY:= FGapY;
    FRowMemos[i].AllowExpressions:= False;
    FRowTotalMemos[i].GapX:= FGapX;
    FRowTotalMemos[i].GapY:= FGapY;
    FRowTotalMemos[i].AllowExpressions:= False;
  end;
end;

procedure TfrxCrossMatrix.Clear;
begin
  if FRows = nil then Exit;

  FRows.Free;
  FRows:= nil;
  FColumns.Free;
  FColumns:= nil;
  FRowHeader.Free;
  FRowHeader:= nil;
  FColumnHeader.Free;
  FColumnHeader:= nil;
end;

procedure TfrxCrossMatrix.SetCellFunctions(Index:Integer;
  const Value:TfrxCrossFunction);
begin
  FCellFunctions[Index]:= Value;
end;

function TfrxCrossMatrix.GetCellFunctions(Index:Integer):TfrxCrossFunction;
begin
  Result:= FCellFunctions[Index];
end;

function TfrxCrossMatrix.GetCellMemos(Index:Integer):TfrxCustomMemoView;
begin
  Result:= FCellMemos[Index];
end;

function TfrxCrossMatrix.GetColumnMemos(Index:Integer):TfrxCustomMemoView;
begin
  Result:= FColumnMemos[Index];
end;

function TfrxCrossMatrix.GetColumnTotalMemos(Index:Integer):TfrxCustomMemoView;
begin
  Result:= FColumnTotalMemos[Index];
end;

function TfrxCrossMatrix.GetRowMemos(Index:Integer):TfrxCustomMemoView;
begin
  Result:= FRowMemos[Index];
end;

function TfrxCrossMatrix.GetRowTotalMemos(Index:Integer):TfrxCustomMemoView;
begin
  Result:= FRowTotalMemos[Index];
end;

function TfrxCrossMatrix.GetColumnSort(Index:Integer):TfrxCrossSortOrder;
begin
  Result:= FColumnSort[Index];
end;

function TfrxCrossMatrix.GetRowSort(Index:Integer):TfrxCrossSortOrder;
begin
  Result:= FRowSort[Index];
end;

procedure TfrxCrossMatrix.SetColumnSort(Index:Integer; Value:TfrxCrossSortOrder);
begin
  FColumnSort[Index]:= Value;
end;

procedure TfrxCrossMatrix.SetRowSort(Index:Integer; Value:TfrxCrossSortOrder);
begin
  FRowSort[Index]:= Value;
end;

function TfrxCrossMatrix.ColCount:Integer;
begin
  Result:= FColumns.Count;
end;

function TfrxCrossMatrix.RowCount:Integer;
begin
  Result:= FRows.Count;
end;

function TfrxCrossMatrix.IsGrandTotalColumn(Index:Integer):Boolean;
begin
  Result:= Index = FColumns.Count-1;
end;

function TfrxCrossMatrix.IsGrandTotalRow(Index:Integer):Boolean;
begin
  Result:= Index = FRows.Count-1;
end;

function TfrxCrossMatrix.IsTotalColumn(Index:Integer):Boolean;
var
  i:Integer;
begin
  Result:= False;

  for i:= 0 to FColumns.FIndexesCount-1 do
    if VarToStr(FColumns[Index].Indexes[i]) = '@@@' then
      Result:= True;
end;

function TfrxCrossMatrix.IsTotalRow(Index:Integer):Boolean;
var
  i:Integer;
begin
  Result:= False;

  for i:= 0 to FRows.FIndexesCount-1 do
    if VarToStr(FRows[Index].Indexes[i]) = '@@@' then
      Result:= True;
end;

function TfrxCrossMatrix.GetDrawSize:TfrxPoint;
var
  ColumnItems, RowItems:TList;
  ColumnItem, RowItem:TfrxCrossHeader;
begin
  ColumnItems:= ColumnHeader.TerminalItems;
  RowItems:= RowHeader.TerminalItems;

  ColumnItem:= ColumnItems[ColumnItems.Count-1];
  RowItem:= RowItems[RowItems.Count-1];

  Result.X:= ColumnItem.Bounds.Left+ColumnItem.Bounds.Right+RowHeader.Width;
  Result.Y:= RowItem.Bounds.Top+RowItem.Bounds.Bottom+ColumnHeader.Height;

  ColumnItems.Free;
  RowItems.Free;
end;

procedure TfrxCrossMatrix.AddValue(const Rows, Columns, Cells:array of Variant);
var
  i:Integer;
  Row:TfrxCrossRow;
  Column:TfrxCrossColumn;
  Cell:PfrCrossCell;
  Value, v:Variant;
begin
  if FRows = nil then Exit;

  if FNoColumns then
    Column:= FColumns.Column([Null]) else
    Column:= FColumns.Column(Columns);
  if FNoRows then
    Row:= FRows.Row([Null]) else
    Row:= FRows.Row(Rows);

  Cell:= Row.GetCell(Column.CellIndex);

  for i:= 0 to FCellLevels-1 do
  begin
    Value:= Cell.Value;
    v:= Cells[i];

    if FCellFunctions[i] = cfCount then
    begin
      v:= Cells[i];
      if v = Null then
        v:= 0
      else
        v:= 1;
    end;

    if Value = Null then
      Cell.Value:= v
    else if (TVarData(Value).VType = varString) or (TVarData(Value).VType = varOleStr) then
      Cell.Value:= Value+#13#10+v
    else
      Cell.Value:= Value+v;

    Cell:= Cell.Next;
  end;
end;

function TfrxCrossMatrix.GetValue(ARow, AColumn, ACell:Integer):Variant;
var
  Row:TfrxCrossRow;
  Column:TfrxCrossColumn;
  Cell:PfrCrossCell;
begin
  Result:= Null;
  Column:= FColumns[AColumn];
  Row:= FRows[ARow];
  Cell:= Row.GetCell(Column.CellIndex);

  while (Cell<>nil) and (ACell > 0) do
  begin
    Cell:= Cell.Next;
    Dec(ACell);
  end;

  if Cell<>nil then
    Result:= Cell.Value;
end;

function TfrxCrossMatrix.GetColumnIndexes(AColumn:Integer):Variant;
begin
  Result:= FColumns[AColumn].Indexes;
end;

function TfrxCrossMatrix.GetRowIndexes(ARow:Integer):Variant;
begin
  Result:= FRows[ARow].Indexes;
end;

procedure TfrxCrossMatrix.CreateHeader(Header:TfrxCrossHeader;
  Source:TfrxIndexCollection; const Totals:TfrxMemoArray; TotalVisible:Boolean);
var
  i, j, IndexesCount:Integer;
  LastValues, CurValues:TfrxVariantArray;

  function ExpandVariable(s:String; const Value:Variant):String;
  var
    i:Integer;
  begin
    { expand the [Value] macro if any (eg. if total memo contains
      the text:'Total of [Value]' }
    i:= Pos('[VALUE]', AnsiUppercase(s));
    if i<>0 then
    begin
      Delete(s, i, 7);
      Insert(VarToStr(Value), s, i);
    end;
    Result:= s;
  end;

  procedure AddTotals;
  var
    j, k:Integer;
  begin
    for j:= 0 to IndexesCount-1 do
      { if value changed... }
      if LastValues[j]<>CurValues[j] then
      begin
        { ...create subtotals for all down-level values }
        for k:= IndexesCount-1 downto j+1 do
          if Totals[k].Visible then
          begin
            { '@@@' means that this is subtotal cell }
            LastValues[k]:= '@@@'+ExpandVariable(Totals[k].Text, LastValues[k-1]);
            { create header cells... }
            Header.AddValues(LastValues);
            LastValues[k]:= '@@@';
            { ...and row/column item }
            Source.InsertItem(i, LastValues);
            Inc(i);
          end;
        break;
      end;
  end;

begin
  if Source.Count = 0 then Exit;
  IndexesCount:= Source.FIndexesCount;
  { copy first indexes to lastvalues }
  LastValues:= Copy(Source.Items[0].Indexes, 0, IndexesCount);
  i:= 0;

  while i < Source.Count do
  begin
    { copy current indexes to curvalues }
    CurValues:= Copy(Source.Items[i].Indexes, 0, IndexesCount);
    { if lastvalues<>curvalues, make a subtotal item }
    AddTotals;
    { add header cells }
    Header.AddValues(CurValues);

    LastValues:= CurValues;
    Inc(i);
  end;

  { create last subtotal item }
  CurValues:= Copy(Source.Items[0].Indexes, 0, IndexesCount);
  for j:= 0 to IndexesCount-1 do
    CurValues[j]:= Null;
  AddTotals;

  { create grand total }
  if Totals[0].Visible and TotalVisible then
  begin
    LastValues[0]:= '@@@'+Totals[0].Text;
    Header.AddValues(LastValues);
    LastValues[0]:= '@@@';
    Source.InsertItem(i, LastValues);
  end;
end;

procedure TfrxCrossMatrix.CreateHeaders;
begin
  CreateHeader(FColumnHeader, FColumns, FColumnTotalMemos, not FNoColumns);
  CreateHeader(FRowHeader, FRows, FRowTotalMemos, not FNoRows);
end;

procedure TfrxCrossMatrix.CalcTotal(Header:TfrxCrossHeader;
  Source:TfrxIndexCollection);
var
  i, j:Integer;
  Items:TList;
  Values, Counts:TfrxVariantArray;
  Item:TfrxCrossHeader;
  p:PfrCrossCell;
  FinalPass:Boolean;

  procedure CellToArrays(p:PfrCrossCell);
  var
    i:Integer;
  begin
    for i:= 0 to FCellLevels-1 do
    begin
      Values[i]:= p.Value;
      Counts[i]:= p.Count;

      if (FCellFunctions[i] = cfAvg) and FinalPass and (p.Count<>0) then
        p.Value:= p.Value / p.Count;

      p:= p.Next;
    end;
  end;

  procedure ArraysToCell(p:PfrCrossCell);
  var
    i:Integer;
  begin
    for i:= 0 to FCellLevels-1 do
    begin
      p.Value:= Item.FFuncValues[i];
      p.Count:= Item.FCounts[i];

      if (FCellFunctions[i] = cfAvg) and FinalPass then
        if p.Count<>0 then
          p.Value:= p.Value / p.Count else
          p.Value:= 0;

      if (FCellFunctions[i] = cfCount) and not FinalPass then
        p.Count:= p.Value;

      p:= p.Next;
    end;
  end;

begin
  Items:= Header.TerminalItems;
  SetLength(Values, FCellLevels);
  SetLength(Counts, FCellLevels);
  FinalPass:= Source = FColumns;

  { scan the matrix }
  for i:= 0 to Source.Count-1 do
  begin
    for j:= 0 to Items.Count-1 do
      TfrxCrossHeader(Items[j]).Reset(FCellFunctions);

    for j:= 0 to Items.Count-1 do
    begin
      Item:= Items[j];
      if Source = FRows then
        p:= FRows[i].GetCell(FColumns[j].CellIndex) else
        p:= FRows[j].GetCell(FColumns[i].CellIndex);

      if not Item.IsTotal then
      begin
        { convert cell values to Values and Counts arrays }
        CellToArrays(p);
        { accumulate values in the header items }
        Item.AddFuncValues(Values, Counts, FCellFunctions);
      end
      else
      begin
        { get the accumulated values from the item's parent }
        Item:= Item.Parent;
        { and convert it to the cell }
        ArraysToCell(p);
      end;
    end;
  end;

  Items.Free;
  Values:= nil;
  Counts:= nil;
end;

procedure TfrxCrossMatrix.CalcTotals;
begin
  { scan the matrix from left to right, then from top to bottom }
  CalcTotal(FColumnHeader, FRows);
  { final pass, scan the matrix from top to bottom, then from left to right }
  CalcTotal(FRowHeader, FColumns);
end;

procedure TfrxCrossMatrix.CalcBounds;
var
  i, j, k:Integer;
  ColumnItems, RowItems:TList;
  ColumnItem, RowItem:TfrxCrossHeader;
  Cell:PfrCrossCell;
  m:TfrxCustomMemoView;
  sz, totalSz, NewHeight:Extended;

  function DoCalc(const Value:Variant):Extended;
  var
    Size:TfrxPoint;
    r:Integer;
    s:String;
    Width, NewWidth:Extended;
    WidthChanged:Boolean;
  begin
    s:= m.Text;
    m.Text:= m.FormatData(Value, FCellMemos[k].DisplayFormat);
    r:= m.Rotation;
    m.Rotation:= 0;

    Width:= FMaxWidth;
    NewWidth:= Width;
    if Assigned(FOnCalcWidth) then
      FOnCalcWidth(j, NewWidth);
    m.Width:= NewWidth;
    WidthChanged:= NewWidth<>Width;

    Size:= CalcSize(m);
    if Size.X > FMaxWidth then
      Size.X:= FMaxWidth;
    if Size.X < FMinWidth then
      Size.X:= FMinWidth;
    if WidthChanged then
      Size.X:= NewWidth;
    if FDefHeight<>0 then
      Size.Y:= FDefHeight;
    if NewWidth = 0 then
      Size.Y:= 0;

    m.Rotation:= r;
    m.Text:= s;

    if (ColumnItem.FSize.X < Size.X) or WidthChanged then
      ColumnItem.FSize.X:= Size.X;

    if FPlainCells then
      Result:= Size.X
    else
      Result:= Size.Y;
  end;

begin
  ColumnItems:= FColumnHeader.TerminalItems;
  RowItems:= FRowHeader.TerminalItems;

  { calculate the widths of columns and the heights of rows }
  FColumnHeader.CalcSizes(FMaxWidth, FMinWidth);
  FRowHeader.CalcSizes(FMaxWidth, FMinWidth);

  { scanning the matrix cells and update calculated widths and heights }
  for i:= 0 to RowItems.Count-1 do
  begin
    RowItem:= RowItems[i];

    for j:= 0 to ColumnItems.Count-1 do
    begin
      ColumnItem:= ColumnItems[j];
      Cell:= FRows[i].GetCell(FColumns[j].CellIndex);
      totalSz:= 0;

      for k:= 0 to FCellLevels-1 do
      begin
        if ColumnItem.IsTotal then
          m:= ColumnItem.Memo
        else if RowItem.IsTotal then
          m:= RowItem.Memo else
          m:= FCellMemos[k];

        sz:= DoCalc(Cell.Value);
        totalSz:= totalSz+sz;
        if FPlainCells then
          ColumnItem.FCellSizes[k]:= sz;

        Cell:= Cell.Next;
      end;

      if FPlainCells then
      begin
        if ColumnItem.FSize.X < totalSz then
          ColumnItem.FSize.X:= totalSz
        else
          ColumnItem.FCellSizes[FCellLevels-1]:=
            ColumnItem.FCellSizes[FCellLevels-1]+(ColumnItem.FSize.X-totalSz);
      end
      else
      begin
        if RowItem.FSize.Y < totalSz then
          RowItem.FSize.Y:= totalSz;
      end;
    end;

    NewHeight:= RowItem.FSize.Y;
    if Assigned(FOnCalcHeight) then
      FOnCalcHeight(i, NewHeight);
    RowItem.FSize.Y:= NewHeight;
  end;

  { calculate the positions and sizes of the header cells }
  FColumnHeader.CalcBounds;
  FRowHeader.CalcBounds;

  ColumnItems.Free;
  RowItems.Free;
end;

end.
