{******************************************}
{ }
{ FastReport v3.0 }
{ Cross object }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxCross;

interface

{$I frx.inc}

uses
  Windows, SysUtils, Classes, Controls, Graphics, Forms, frxCrossMatrix,
  frxClass
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxCrossObject = class(TComponent); // fake component

  TfrxPrintCellEvent = type String;
  TfrxPrintHeaderEvent = type String;
  TfrxCalcWidthEvent = type String;
  TfrxCalcHeightEvent = type String;
  TfrxOnPrintCellEvent = procedure (Memo:TfrxCustomMemoView;
    RowIndex, ColumnIndex, CellIndex:Integer;
    const RowValues, ColumnValues, Value:Variant) of object;
  TfrxOnPrintHeaderEvent = procedure (Memo:TfrxCustomMemoView;
    const HeaderIndexes, HeaderValues, Value:Variant) of object;
  TfrxOnCalcWidthEvent = procedure (ColumnIndex:Integer;
    const ColumnValues:Variant; var Width:Extended) of object;
  TfrxOnCalcHeightEvent = procedure (RowIndex:Integer;
    const RowValues:Variant; var Height:Extended) of object;

  TfrxCustomCrossView = class(TfrxView)
  private
    FMatrix:TfrxCrossMatrix;
    FBorder:Boolean;
    FCellFields:TStrings;
    FCellLevels:Integer;
    FColumnBands:TList;
    FColumnFields:TStrings;
    FColumnLevels:Integer;
    FDefHeight:Integer;
    FDotMatrix:Boolean;
    FDownThenAcross:Boolean;
    FGapX:Integer;
    FGapY:Integer;
    FMaxWidth:Integer;
    FMinWidth:Integer;
    FOnCalcHeight:TfrxCalcHeightEvent; { script event }
    FOnCalcWidth:TfrxCalcWidthEvent; { script event }
    FOnPrintCell:TfrxPrintCellEvent; { script event }
    FOnPrintColumnHeader:TfrxPrintHeaderEvent; { script event }
    FOnPrintRowHeader:TfrxPrintHeaderEvent; { script event }
    FOnBeforeCalcHeight:TfrxOnCalcHeightEvent; { Delphi event }
    FOnBeforeCalcWidth:TfrxOnCalcWidthEvent; { Delphi event }
    FOnBeforePrintCell:TfrxOnPrintCellEvent; { Delphi event }
    FOnBeforePrintColumnHeader:TfrxOnPrintHeaderEvent; { Delphi event }
    FOnBeforePrintRowHeader:TfrxOnPrintHeaderEvent; { Delphi event }
    FPlainCells:Boolean;
    FRowBands:TList;
    FRowFields:TStrings;
    FRowLevels:Integer;
    FRepeatHeaders:Boolean;
    FShowColumnHeader:Boolean;
    FShowRowHeader:Boolean;
    procedure AddSourceObjects;
    procedure BuildColumnBands;
    procedure BuildRowBands;
    procedure ClearColumnBands;
    procedure ClearRowBands;
    procedure CorrectDMPBounds(Memo:TfrxCustomMemoView);
    procedure DoCalcHeight(Row:Integer; var Height:Extended);
    procedure DoCalcWidth(Column:Integer; var Width:Extended);
    procedure DoOnCell(Memo:TfrxCustomMemoView; Row, Column, Cell:Integer;
      const Value:Variant);
    procedure DoOnColumnHeader(Memo:TfrxCustomMemoView; Header:TfrxCrossHeader);
    procedure DoOnRowHeader(Memo:TfrxCustomMemoView; Header:TfrxCrossHeader);
    procedure ReadMemos(Stream:TStream);
    procedure RenderMatrix;
    procedure SetCellFields(const Value:TStrings);
    procedure SetCellFunctions(Index:Integer; const Value:TfrxCrossFunction);
    procedure SetColumnFields(const Value:TStrings);
    procedure SetColumnSort(Index:Integer; Value:TfrxCrossSortOrder);
    procedure SetRowFields(const Value:TStrings);
    procedure SetRowSort(Index:Integer; Value:TfrxCrossSortOrder);
    procedure SetShowColumnTotal(const Value:Boolean);
    procedure SetShowRowTotal(const Value:Boolean);
    procedure SetupOriginalComponent(Obj1, Obj2:TfrxComponent);
    procedure WriteMemos(Stream:TStream);
    function CreateMemo(Parent:TfrxComponent):TfrxCustomMemoView;
    function GetCellFunctions(Index:Integer):TfrxCrossFunction;
    function GetCellMemos(Index:Integer):TfrxCustomMemoView;
    function GetColumnMemos(Index:Integer):TfrxCustomMemoView;
    function GetColumnSort(Index:Integer):TfrxCrossSortOrder;
    function GetColumnTotalMemos(Index:Integer):TfrxCustomMemoView;
    function GetRowMemos(Index:Integer):TfrxCustomMemoView;
    function GetRowSort(Index:Integer):TfrxCrossSortOrder;
    function GetRowTotalMemos(Index:Integer):TfrxCustomMemoView;
    function GetShowColumnTotal:Boolean;
    function GetShowRowTotal:Boolean;
    procedure SetDotMatrix(const Value:Boolean);
    procedure SetPlainCells(const Value:Boolean);
  protected
    procedure DefineProperties(Filer:TFiler); override;
    procedure SetCellLevels(const Value:Integer); virtual;
    procedure SetColumnLevels(const Value:Integer); virtual;
    procedure SetRowLevels(const Value:Integer); virtual;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure Draw(Canvas:TCanvas; ScaleX, ScaleY, OffsetX, OffsetY:Extended); override;
    procedure BeforePrint; override;
    procedure GetData; override;
    procedure BeginMatrix;
    procedure EndMatrix;
    procedure FillMatrix; virtual;
    procedure AddValue(const Rows, Columns, Cells:array of Variant);

    function ColCount:Integer;
    function RowCount:Integer;
    function IsCrossValid:Boolean; virtual;
    function IsGrandTotalColumn(Index:Integer):Boolean;
    function IsGrandTotalRow(Index:Integer):Boolean;
    function IsTotalColumn(Index:Integer):Boolean;
    function IsTotalRow(Index:Integer):Boolean;
    function RowHeaderWidth:Extended;
    function ColumnHeaderHeight:Extended;

    property Matrix:TfrxCrossMatrix read FMatrix;
    property CellFields:TStrings read FCellFields write SetCellFields;
    property CellFunctions[Index:Integer]:TfrxCrossFunction read GetCellFunctions
      write SetCellFunctions;
    property CellMemos[Index:Integer]:TfrxCustomMemoView read GetCellMemos;
    property ColumnFields:TStrings read FColumnFields write SetColumnFields;
    property ColumnMemos[Index:Integer]:TfrxCustomMemoView read GetColumnMemos;
    property ColumnSort[Index:Integer]:TfrxCrossSortOrder read GetColumnSort
      write SetColumnSort;
    property ColumnTotalMemos[Index:Integer]:TfrxCustomMemoView read GetColumnTotalMemos;
    property DotMatrix:Boolean read FDotMatrix;
    property RowFields:TStrings read FRowFields write SetRowFields;
    property RowMemos[Index:Integer]:TfrxCustomMemoView read GetRowMemos;
    property RowSort[Index:Integer]:TfrxCrossSortOrder read GetRowSort
      write SetRowSort;
    property RowTotalMemos[Index:Integer]:TfrxCustomMemoView read GetRowTotalMemos;
    property OnBeforeCalcHeight:TfrxOnCalcHeightEvent
      read FOnBeforeCalcHeight write FOnBeforeCalcHeight;
    property OnBeforeCalcWidth:TfrxOnCalcWidthEvent
      read FOnBeforeCalcWidth write FOnBeforeCalcWidth;
    property OnBeforePrintCell:TfrxOnPrintCellEvent
      read FOnBeforePrintCell write FOnBeforePrintCell;
    property OnBeforePrintColumnHeader:TfrxOnPrintHeaderEvent
      read FOnBeforePrintColumnHeader write FOnBeforePrintColumnHeader;
    property OnBeforePrintRowHeader:TfrxOnPrintHeaderEvent
      read FOnBeforePrintRowHeader write FOnBeforePrintRowHeader;
  published
    property Border:Boolean read FBorder write FBorder default True;
    property CellLevels:Integer read FCellLevels write SetCellLevels default 1;
    property ColumnLevels:Integer read FColumnLevels write SetColumnLevels default 1;
    property DefHeight:Integer read FDefHeight write FDefHeight default 0;
    property DownThenAcross:Boolean read FDownThenAcross write FDownThenAcross;
    property GapX:Integer read FGapX write FGapX default 3;
    property GapY:Integer read FGapY write FGapY default 3;
    property MaxWidth:Integer read FMaxWidth write FMaxWidth default 200;
    property MinWidth:Integer read FMinWidth write FMinWidth default 0;
    property PlainCells:Boolean read FPlainCells write SetPlainCells default False;
    property RepeatHeaders:Boolean read FRepeatHeaders write FRepeatHeaders default True;
    property RowLevels:Integer read FRowLevels write SetRowLevels default 1;
    property ShowColumnHeader:Boolean read FShowColumnHeader write FShowColumnHeader
      default True;
    property ShowColumnTotal:Boolean read GetShowColumnTotal write SetShowColumnTotal
      default True;
    property ShowRowHeader:Boolean read FShowRowHeader write FShowRowHeader
      default True;
    property ShowRowTotal:Boolean read GetShowRowTotal write SetShowRowTotal
      default True;
    property OnCalcHeight:TfrxCalcHeightEvent read FOnCalcHeight write FOnCalcHeight;
    property OnCalcWidth:TfrxCalcWidthEvent read FOnCalcWidth write FOnCalcWidth;
    property OnPrintCell:TfrxPrintCellEvent read FOnPrintCell write FOnPrintCell;
    property OnPrintColumnHeader:TfrxPrintHeaderEvent
      read FOnPrintColumnHeader write FOnPrintColumnHeader;
    property OnPrintRowHeader:TfrxPrintHeaderEvent
      read FOnPrintRowHeader write FOnPrintRowHeader;
  end;

  TfrxCrossView = class(TfrxCustomCrossView)
  protected
    procedure SetCellLevels(const Value:Integer); override;
    procedure SetColumnLevels(const Value:Integer); override;
    procedure SetRowLevels(const Value:Integer); override;
  public
    class function GetDescription:String; override;
    function IsCrossValid:Boolean; override;
  published
  end;

  TfrxDBCrossView = class(TfrxCustomCrossView)
  private
  public
    class function GetDescription:String; override;
    function IsCrossValid:Boolean; override;
    procedure FillMatrix; override;
  published
    property CellFields;
    property ColumnFields;
    property DataSet;
    property DataSetName;
    property RowFields;
  end;

implementation

uses
{$IFNDEF NO_EDITORS}
  frxCrossEditor,
{$ENDIF}
  frxCrossRTTI, frxDsgnIntf, frxXML, frxUtils, frxXMLSerializer, frxRes,
  frxDMPClass;

type
  THackComponent = class(TfrxComponent);
  THackMemoView = class(TfrxCustomMemoView);

{ TfrxCustomCrossView }

constructor TfrxCustomCrossView.Create(AOwner:TComponent);
begin
  inherited;
  Frame.Typ:= [ftLeft, ftRight, ftTop, ftBottom];
  Font.Name:= 'Tahoma';
  Font.Size:= 8;
  Color:= clSilver;

  FMatrix:= TfrxCrossMatrix.Create;
  FCellFields:= TStringList.Create;
  FColumnFields:= TStringList.Create;
  FRowFields:= TStringList.Create;
  FColumnBands:= TList.Create;
  FRowBands:= TList.Create;
  FBorder:= True;
  FGapX:= 3;
  FGapY:= 3;
  FMaxWidth:= 200;
  CellLevels:= 1;
  ColumnLevels:= 1;
  RowLevels:= 1;
  FRepeatHeaders:= True;
  FShowColumnHeader:= True;
  FShowRowHeader:= True;
  FMatrix.OnCalcHeight:= DoCalcHeight;
  FMatrix.OnCalcWidth:= DoCalcWidth;
  if Page is TfrxDMPPage then
    SetDotMatrix(True);
end;

destructor TfrxCustomCrossView.Destroy;
begin
  FMatrix.Free;
  FCellFields.Free;
  FColumnFields.Free;
  FRowFields.Free;
  ClearColumnBands;
  ClearRowBands;
  FColumnBands.Free;
  FRowBands.Free;
  inherited;
end;

procedure TfrxCustomCrossView.DefineProperties(Filer:TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('Memos', ReadMemos, WriteMemos, True);
end;

procedure TfrxCustomCrossView.ReadMemos(Stream:TStream);
var
  x:TfrxXMLDocument;
  i:Integer;

  procedure GetItem(m:TfrxCustomMemoView; const Name:String; Index:Integer);
  var
    xs:TfrxXMLSerializer;
    Item:TfrxXMLItem;
  begin
    Item:= x.Root.FindItem(Name);
    if Index >= Item.Count then Exit;
    Item:= Item[Index];

    xs:= TfrxXMLSerializer.Create(nil);
    m.Frame.Typ:= [];
    m.Font.Style:= [];
    m.HAlign:= haLeft;
    m.VAlign:= vaTop;
    xs.ReadRootComponent(m, Item);
    xs.Free;
  end;

  function GetItem1(const Name:String; Index:Integer):TfrxCrossFunction;
  var
    Item:TfrxXMLItem;
  begin
    Result:= cfNone;
    Item:= x.Root.FindItem(Name);
    if Index >= Item.Count then Exit;
    Item:= Item[Index];
    Result:= TfrxCrossFunction(StrToInt(Item.Text));
  end;

  function GetItem2(const Name:String; Index:Integer):TfrxCrossSortOrder;
  var
    Item:TfrxXMLItem;
  begin
    Result:= soAscending;
    Item:= x.Root.FindItem(Name);
    if Index >= Item.Count then Exit;
    Item:= Item[Index];
    Result:= TfrxCrossSortOrder(StrToInt(Item.Text));
  end;

begin
  x:= TfrxXMLDocument.Create;
  try
    x.LoadFromStream(Stream);

    for i:= 0 to CROSS_DIM_SIZE-1 do
    begin
      GetItem(CellMemos[i], 'cellmemos', i);
      GetItem(ColumnMemos[i], 'columnmemos', i);
      GetItem(ColumnTotalMemos[i], 'columntotalmemos', i);
      GetItem(RowMemos[i], 'rowmemos', i);
      GetItem(RowTotalMemos[i], 'rowtotalmemos', i);
      CellFunctions[i]:= GetItem1('cellfunctions', i);
      ColumnSort[i]:= GetItem2('columnsort', i);
      RowSort[i]:= GetItem2('rowsort', i);
    end;

  finally
    x.Free;
  end;
end;

procedure TfrxCustomCrossView.WriteMemos(Stream:TStream);
var
  x:TfrxXMLDocument;
  i:Integer;

  procedure AddItem(m:TfrxCustomMemoView; const Name:String);
  var
    xs:TfrxXMLSerializer;
  begin
    xs:= TfrxXMLSerializer.Create(nil);
    xs.WriteRootComponent(m, False, x.Root.FindItem(Name).Add);
    xs.Free;
  end;

  procedure AddItem1(f:TfrxCrossFunction; const Name:String);
  var
    Item:TfrxXMLItem;
  begin
    Item:= x.Root.FindItem(Name);
    Item:= Item.Add;
    Item.Name:= 'item';
    Item.Text:= IntToStr(Integer(f));
  end;

  procedure AddItem2(f:TfrxCrossSortOrder; const Name:String);
  var
    Item:TfrxXMLItem;
  begin
    Item:= x.Root.FindItem(Name);
    Item:= Item.Add;
    Item.Name:= 'item';
    Item.Text:= IntToStr(Integer(f));
  end;

begin
  x:= TfrxXMLDocument.Create;
  x.Root.Name:= 'cross';

  try
    x.Root.Add.Name:= 'cellmemos';
    x.Root.Add.Name:= 'columnmemos';
    x.Root.Add.Name:= 'columntotalmemos';
    x.Root.Add.Name:= 'rowmemos';
    x.Root.Add.Name:= 'rowtotalmemos';
    x.Root.Add.Name:= 'cellfunctions';
    x.Root.Add.Name:= 'columnsort';
    x.Root.Add.Name:= 'rowsort';

    for i:= 0 to CellLevels-1 do
    begin
      AddItem(CellMemos[i], 'cellmemos');
      AddItem1(CellFunctions[i], 'cellfunctions');
    end;
    for i:= 0 to ColumnLevels-1 do
    begin
      AddItem(ColumnMemos[i], 'columnmemos');
      AddItem(ColumnTotalMemos[i], 'columntotalmemos');
      AddItem2(ColumnSort[i], 'columnsort');
    end;
    for i:= 0 to RowLevels-1 do
    begin
      AddItem(RowMemos[i], 'rowmemos');
      AddItem(RowTotalMemos[i], 'rowtotalmemos');
      AddItem2(RowSort[i], 'rowsort');
    end;

    x.SaveToStream(Stream);
  finally
    x.Free;
  end;
end;

function TfrxCustomCrossView.CreateMemo(Parent:TfrxComponent):TfrxCustomMemoView;
begin
  if FDotMatrix then
    Result:= TfrxDMPMemoView.Create(Parent) else
    Result:= TfrxMemoView.Create(Parent);
end;

procedure TfrxCustomCrossView.CorrectDMPBounds(Memo:TfrxCustomMemoView);
begin
  if Memo is TfrxDMPMemoView then
  begin
    Memo.Left:= Memo.Left+fr1CharX;
    Memo.Top:= Memo.Top+fr1CharY;
    Memo.Width:= Memo.Width-fr1CharX;
    Memo.Height:= Memo.Height-fr1CharY;
  end;
end;

function TfrxCustomCrossView.GetCellFunctions(Index:Integer):TfrxCrossFunction;
begin
  Result:= FMatrix.CellFunctions[Index];
end;

function TfrxCustomCrossView.GetCellMemos(Index:Integer):TfrxCustomMemoView;
begin
  Result:= FMatrix.CellMemos[Index];
end;

function TfrxCustomCrossView.GetColumnMemos(Index:Integer):TfrxCustomMemoView;
begin
  Result:= FMatrix.ColumnMemos[Index];
end;

function TfrxCustomCrossView.GetColumnTotalMemos(Index:Integer):TfrxCustomMemoView;
begin
  Result:= FMatrix.ColumnTotalMemos[Index];
end;

function TfrxCustomCrossView.GetRowMemos(Index:Integer):TfrxCustomMemoView;
begin
  Result:= FMatrix.RowMemos[Index];
end;

function TfrxCustomCrossView.GetRowTotalMemos(Index:Integer):TfrxCustomMemoView;
begin
  Result:= FMatrix.RowTotalMemos[Index];
end;

procedure TfrxCustomCrossView.SetCellFunctions(Index:Integer; const Value:TfrxCrossFunction);
begin
  FMatrix.CellFunctions[Index]:= Value;
end;

procedure TfrxCustomCrossView.SetCellFields(const Value:TStrings);
begin
  FCellFields.Assign(Value);
end;

procedure TfrxCustomCrossView.SetColumnFields(const Value:TStrings);
begin
  FColumnFields.Assign(Value);
end;

procedure TfrxCustomCrossView.SetPlainCells(const Value:Boolean);
begin
  FPlainCells:= Value;
  FMatrix.PlainCells:= Value;
end;

procedure TfrxCustomCrossView.SetRowFields(const Value:TStrings);
begin
  FRowFields.Assign(Value);
end;

function TfrxCustomCrossView.GetColumnSort(Index:Integer):TfrxCrossSortOrder;
begin
  Result:= FMatrix.ColumnSort[Index];
end;

function TfrxCustomCrossView.GetRowSort(Index:Integer):TfrxCrossSortOrder;
begin
  Result:= FMatrix.RowSort[Index];
end;

procedure TfrxCustomCrossView.SetColumnSort(Index:Integer; Value:TfrxCrossSortOrder);
begin
  FMatrix.ColumnSort[Index]:= Value;
end;

procedure TfrxCustomCrossView.SetRowSort(Index:Integer; Value:TfrxCrossSortOrder);
begin
  FMatrix.RowSort[Index]:= Value;
end;

function TfrxCustomCrossView.GetShowColumnTotal:Boolean;
begin
  Result:= ColumnTotalMemos[0].Visible;
end;

function TfrxCustomCrossView.GetShowRowTotal:Boolean;
begin
  Result:= RowTotalMemos[0].Visible;
end;

procedure TfrxCustomCrossView.SetShowColumnTotal(const Value:Boolean);
begin
  ColumnTotalMemos[0].Visible:= Value;
end;

procedure TfrxCustomCrossView.SetShowRowTotal(const Value:Boolean);
begin
  RowTotalMemos[0].Visible:= Value;
end;

procedure TfrxCustomCrossView.SetCellLevels(const Value:Integer);
begin
  FCellLevels:= Value;
end;

procedure TfrxCustomCrossView.SetColumnLevels(const Value:Integer);
begin
  FColumnLevels:= Value;
end;

procedure TfrxCustomCrossView.SetRowLevels(const Value:Integer);
begin
  FRowLevels:= Value;
end;

procedure TfrxCustomCrossView.SetDotMatrix(const Value:Boolean);
begin
  FDotMatrix:= Value;
  FMatrix.InitMemos(Value);
  if FDotMatrix then
  begin
    FGapX:= 0;
    FGapY:= 0;
  end;
end;

procedure TfrxCustomCrossView.Draw(Canvas:TCanvas; ScaleX, ScaleY,
  OffsetX, OffsetY:Extended);
begin
  inherited;
  with Canvas do
  begin
    Font.Assign(Self.Font);
    TextOut(FX+2, FY+2, Name);
  end;
end;

procedure TfrxCustomCrossView.BeginMatrix;
begin
  FMatrix.MaxWidth:= FMaxWidth;
  FMatrix.MinWidth:= FMinWidth;
  FMatrix.DefHeight:= FDefHeight;
  FMatrix.GapX:= FGapX;
  FMatrix.GapY:= FGapY;
  FMatrix.Init(FRowLevels, FColumnLevels, FCellLevels);
  FMatrix.ColumnHeader.Visible:= FShowColumnHeader;
  FMatrix.RowHeader.Visible:= FShowRowHeader;
end;

procedure TfrxCustomCrossView.AddValue(const Rows, Columns, Cells:array of Variant);
begin
  FMatrix.AddValue(Rows, Columns, Cells);
end;

procedure TfrxCustomCrossView.EndMatrix;
begin
  FMatrix.CreateHeaders;
  FMatrix.CalcTotals;
  FMatrix.CalcBounds;
end;

procedure TfrxCustomCrossView.FillMatrix;
begin
end;

function TfrxCustomCrossView.ColCount:Integer;
begin
  Result:= FMatrix.ColCount;
end;

function TfrxCustomCrossView.RowCount:Integer;
begin
  Result:= FMatrix.RowCount;
end;

function TfrxCustomCrossView.IsCrossValid:Boolean;
begin
  Result:= True;
end;

function TfrxCustomCrossView.IsGrandTotalColumn(Index:Integer):Boolean;
begin
  Result:= FMatrix.IsGrandTotalColumn(Index);
end;

function TfrxCustomCrossView.IsGrandTotalRow(Index:Integer):Boolean;
begin
  Result:= FMatrix.IsGrandTotalRow(Index);
end;

function TfrxCustomCrossView.IsTotalColumn(Index:Integer):Boolean;
begin
  Result:= FMatrix.IsTotalColumn(Index);
end;

function TfrxCustomCrossView.IsTotalRow(Index:Integer):Boolean;
begin
  Result:= FMatrix.IsTotalRow(Index);
end;

function TfrxCustomCrossView.ColumnHeaderHeight:Extended;
begin
  Result:= FMatrix.ColumnHeader.Height;
  if FMatrix.NoColumns then
    Result:= 0;
end;

function TfrxCustomCrossView.RowHeaderWidth:Extended;
begin
  Result:= FMatrix.RowHeader.Width;
  if FMatrix.NoRows then
    Result:= 0;
end;

procedure TfrxCustomCrossView.DoCalcHeight(Row:Integer; var Height:Extended);
var
  v:Variant;
begin
  if FOnCalcHeight<>'' then
  begin
    v:= VarArrayOf([Row, FMatrix.GetRowIndexes(Row), Height]);
    if Report<>nil then
      Report.DoParamEvent(FOnCalcHeight, v);
    Height:= v[2];
  end;
  if Assigned(FOnBeforeCalcHeight) then
    FOnBeforeCalcHeight(Row, FMatrix.GetRowIndexes(Row), Height);
end;

procedure TfrxCustomCrossView.DoCalcWidth(Column:Integer; var Width:Extended);
var
  v:Variant;
begin
  if FOnCalcWidth<>'' then
  begin
    v:= VarArrayOf([Column, FMatrix.GetColumnIndexes(Column), Width]);
    if Report<>nil then
      Report.DoParamEvent(FOnCalcWidth, v);
    Width:= v[2];
  end;
  if Assigned(FOnBeforeCalcWidth) then
    FOnBeforeCalcWidth(Column, FMatrix.GetColumnIndexes(Column), Width);
end;

procedure TfrxCustomCrossView.DoOnCell(Memo:TfrxCustomMemoView;
  Row, Column, Cell:Integer; const Value:Variant);
var
  v:Variant;
begin
  if FOnPrintCell<>'' then
  begin
    v:= VarArrayOf([Integer(Memo), Row, Column, Cell, FMatrix.GetRowIndexes(Row),
      FMatrix.GetColumnIndexes(Column), Value]);
    if Report<>nil then
      Report.DoParamEvent(FOnPrintCell, v);
  end;
  if Assigned(FOnBeforePrintCell) then
    FOnBeforePrintCell(Memo, Row, Column, Cell, FMatrix.GetRowIndexes(Row),
      FMatrix.GetColumnIndexes(Column), Value);
end;

procedure TfrxCustomCrossView.DoOnColumnHeader(Memo:TfrxCustomMemoView;
  Header:TfrxCrossHeader);
var
  v:Variant;
begin
  if FOnPrintColumnHeader<>'' then
  begin
    v:= VarArrayOf([Integer(Memo), Header.GetIndexes, Header.GetValues, Header.Value]);
    if Report<>nil then
      Report.DoParamEvent(FOnPrintColumnHeader, v);
  end;
  if Assigned(FOnBeforePrintColumnHeader) then
    FOnBeforePrintColumnHeader(Memo, Header.GetIndexes, Header.GetValues, Header.Value);
end;

procedure TfrxCustomCrossView.DoOnRowHeader(Memo:TfrxCustomMemoView;
  Header:TfrxCrossHeader);
var
  v:Variant;
begin
  if FOnPrintRowHeader<>'' then
  begin
    v:= VarArrayOf([Integer(Memo), Header.GetIndexes, Header.GetValues, Header.Value]);
    if Report<>nil then
      Report.DoParamEvent(FOnPrintRowHeader, v);
  end;
  if Assigned(FOnBeforePrintRowHeader) then
    FOnBeforePrintRowHeader(Memo, Header.GetIndexes, Header.GetValues, Header.Value);
end;

procedure TfrxCustomCrossView.BeforePrint;
begin
  inherited;
  BeginMatrix;
end;

procedure TfrxCustomCrossView.GetData;
begin
  inherited;
  Report.SetProgressMessage(frxResources.Get('crFillMx'));
  if IsCrossValid then
    FillMatrix;
  Report.SetProgressMessage(frxResources.Get('crBuildMx'));
  EndMatrix;
  RenderMatrix;
end;

procedure TfrxCustomCrossView.RenderMatrix;
var
  i, j, Page:Integer;
  CurY, AddWidth:Extended;
  Band:TfrxBand;
  ColumnItems:TList;

  function GetCellBand(RowIndex, ColumnIndex:Integer):TfrxBand;
  var
    i, j, iFrom, iTo:Integer;
    Cell:Variant;
    RowItems:TList;
    ColumnItem, RowItem:TfrxCrossHeader;
    m, Memo:TfrxCustomMemoView;
    RowSize, CellSize, CellOffs, LeftMargin, TopMargin:Extended;
  begin
    RowItems:= FMatrix.RowHeader.TerminalItems;
    RowItem:= RowItems[RowIndex];
    RowSize:= RowItem.Bounds.Bottom / CellLevels;

    Result:= TfrxNullBand.Create(Report);
    Result.Height:= RowItem.Bounds.Bottom;

    iFrom:= TfrxBand(FColumnBands[ColumnIndex]).Tag mod 65536;
    iTo:= TfrxBand(FColumnBands[ColumnIndex]).Tag div 65536;
    LeftMargin:= TfrxCrossHeader(ColumnItems[iFrom]).Bounds.Left;
    TopMargin:= RowItem.Bounds.Top;

    for i:= iFrom to iTo do
    begin
      ColumnItem:= ColumnItems[i];

      CellOffs:= 0;
      for j:= 0 to CellLevels-1 do
      begin
        Cell:= FMatrix.GetValue(RowIndex, i, j);

        { which memo to use? }
        if RowItem.IsTotal then
          m:= RowItem.Memo
        else if ColumnItem.IsTotal then
          m:= ColumnItem.Memo
        else
          m:= CellMemos[j];

        Memo:= CreateMemo(Result);
        Memo.Assign(m);
        SetupOriginalComponent(Memo, m);
        if Cell<>Null then
          THackMemoView(Memo).Value:= Cell else
          THackMemoView(Memo).Value:= 0;

        Memo.Text:= Memo.FormatData(Cell, CellMemos[j].DisplayFormat);
        Memo.Rotation:= 0;
        Memo.HAlign:= CellMemos[j].HAlign;
        Memo.Frame:= CellMemos[j].Frame;
        DoOnCell(Memo, RowIndex, i, j, Cell);

        if FBorder then
        begin
          if FMatrix.PlainCells then
          begin
            if RowIndex = 0 then
              Memo.Frame.Typ:= Memo.Frame.Typ+[ftTop];
            if (i = 0) and (j = 0) then
              Memo.Frame.Typ:= Memo.Frame.Typ+[ftLeft];
            if (i = ColumnItems.Count-1) and (j = CellLevels-1) then
              Memo.Frame.Typ:= Memo.Frame.Typ+[ftRight];
            if RowIndex = RowItems.Count-1 then
              Memo.Frame.Typ:= Memo.Frame.Typ+[ftBottom];
          end
          else
          begin
            if (RowIndex = 0) and (j = 0) then
              Memo.Frame.Typ:= Memo.Frame.Typ+[ftTop];
            if i = 0 then
              Memo.Frame.Typ:= Memo.Frame.Typ+[ftLeft];
            if i = ColumnItems.Count-1 then
              Memo.Frame.Typ:= Memo.Frame.Typ+[ftRight];
            if (RowIndex = RowItems.Count-1) and (j = CellLevels-1) then
              Memo.Frame.Typ:= Memo.Frame.Typ+[ftBottom];
          end;
        end;

        if FMatrix.PlainCells then
        begin
          CellSize:= ColumnItem.CellSizes[j];
          Memo.SetBounds(ColumnItem.Bounds.Left-LeftMargin+AddWidth+CellOffs,
            RowItem.Bounds.Top-TopMargin,
            CellSize, RowItem.Bounds.Bottom);
          CellOffs:= CellOffs+CellSize;
        end
        else
          Memo.SetBounds(ColumnItem.Bounds.Left-LeftMargin+AddWidth,
            RowItem.Bounds.Top+j * RowSize-TopMargin,
            ColumnItem.Bounds.Right, RowSize);
        CorrectDMPBounds(Memo);
        Memo.Visible:= (Memo.Width<>0) and (Memo.Height<>0);
      end;
    end;

    RowItems.Free;
  end;

  procedure DoPagination(i, j:Integer);
  var
    k, kFrom, kTo:Integer;
  begin
    if ShowColumnHeader and (FRepeatHeaders or (i = 0)) and not FMatrix.NoColumns then
    begin
      Band:= TfrxBand(FColumnBands[j]);
      Band.Top:= CurY;
      Report.Engine.ShowBand(Band);
    end;

    if ShowRowHeader and (FRepeatHeaders or (j = 0)) and not FMatrix.NoRows then
    begin
      Band:= TfrxBand(FRowBands[i]);
      if j = 0 then
        Band.Left:= Left
      else
        Band.Left:= 0;
      Band.Top:= Band.Top+CurY;
      Report.Engine.ShowBand(Band);
      Band.Top:= Band.Top-CurY;
    end;

    if FRepeatHeaders or (i = 0) then
      Report.Engine.CurY:= CurY+ColumnHeaderHeight else
      Report.Engine.CurY:= CurY;
    if FRepeatHeaders or (j = 0) then
    begin
      AddWidth:= RowHeaderWidth;
      if j = 0 then
        AddWidth:= AddWidth+Left;
    end
    else
      AddWidth:= 0;

    kFrom:= TfrxBand(FRowBands[i]).Tag mod 65536;
    kTo:= TfrxBand(FRowBands[i]).Tag div 65536;

    for k:= kFrom to kTo do
    begin
      Band:= GetCellBand(k, j);
      Band.Top:= Report.Engine.CurY;
      Report.Engine.ShowBand(Band);
      Band.Free;
    end;
  end;

begin
  AddSourceObjects;
  BuildColumnBands;
  BuildRowBands;
  ColumnItems:= FMatrix.ColumnHeader.TerminalItems;
  Page:= Report.PreviewPages.CurPage;
  CurY:= Report.Engine.CurY;

  if FDownThenAcross then
    for i:= 0 to FColumnBands.Count-1 do
    begin
      for j:= 0 to FRowBands.Count-1 do
      begin
        Report.PreviewPages.CurPage:= Page+j;
        DoPagination(j, i);
        if j<>FRowBands.Count-1 then
          Report.Engine.NewPage;
      end;

      if i<>FColumnBands.Count-1 then
        Report.Engine.NewPage;
      CurY:= Report.Engine.CurY;
      Inc(Page, FRowBands.Count);

      Application.ProcessMessages;
      if Report.Terminated then break;
    end
  else
    for i:= 0 to FRowBands.Count-1 do
    begin
      for j:= 0 to FColumnBands.Count-1 do
      begin
        Report.PreviewPages.CurPage:= Page+j;
        DoPagination(i, j);
        if j<>FColumnBands.Count-1 then
        begin
          Report.PreviewPages.AddPageAction:= apWriteOver;
          Report.Engine.NewPage;
        end;
      end;

      if i<>FRowBands.Count-1 then
      begin
        Report.PreviewPages.AddPageAction:= apAdd;
        Report.Engine.NewPage;
        Page:= Report.PreviewPages.CurPage;
      end
      else
        Inc(Page, FColumnBands.Count);
      CurY:= Report.Engine.CurY;

      Application.ProcessMessages;
      if Report.Terminated then break;
    end;

  if Parent is TfrxBand then
    CurY:= CurY-Height;
  { print last page footers }
  if FColumnBands.Count > 1 then
    Report.Engine.EndPage;
  { position to last row, first column page }
  Report.PreviewPages.CurPage:= Page-FColumnBands.Count;
  Report.PreviewPages.AddPageAction:= apAdd;
  Report.Engine.CurY:= CurY;

  ColumnItems.Free;
  ClearColumnBands;
  ClearRowBands;
end;

procedure TfrxCustomCrossView.ClearColumnBands;
var
  i:Integer;
begin
  for i:= 0 to FColumnBands.Count-1 do
    TObject(FColumnBands[i]).Free;
  FColumnBands.Clear;
end;

procedure TfrxCustomCrossView.ClearRowBands;
var
  i:Integer;
begin
  for i:= 0 to FRowBands.Count-1 do
    TObject(FRowBands[i]).Free;
  FRowBands.Clear;
end;

procedure TfrxCustomCrossView.AddSourceObjects;
var
  i:Integer;
begin
  for i:= 0 to CellLevels-1 do
    Report.PreviewPages.AddToSourcePage(CellMemos[i]);
  for i:= 0 to ColumnLevels-1 do
  begin
    Report.PreviewPages.AddToSourcePage(ColumnMemos[i]);
    Report.PreviewPages.AddToSourcePage(ColumnTotalMemos[i]);
  end;
  for i:= 0 to RowLevels-1 do
  begin
    Report.PreviewPages.AddToSourcePage(RowMemos[i]);
    Report.PreviewPages.AddToSourcePage(RowTotalMemos[i]);
  end;
end;

procedure TfrxCustomCrossView.SetupOriginalComponent(Obj1, Obj2:TfrxComponent);
begin
  THackComponent(Obj1).FOriginalComponent:= THackComponent(Obj2).FOriginalComponent;
  THackComponent(Obj1).FAliasName:= THackComponent(Obj2).FAliasName;
end;

procedure TfrxCustomCrossView.BuildColumnBands;
var
  i, LeftIndex, RightIndex:Integer;
  Items:TList;
  Item:TfrxCrossHeader;
  Memo:TfrxCustomMemoView;
  LargeBand:TfrxNullBand;
  CurWidth, AddWidth, LeftMargin, RightMargin:Extended;

  procedure CreateBand;
  var
    i:Integer;
    Band:TfrxNullBand;
    Memo, CutMemo:TfrxCustomMemoView;
    CutSize:Extended;
  begin
    Band:= TfrxNullBand.Create(Report);
    Band.Left:= AddWidth;
    Band.Tag:= LeftIndex+RightIndex * 65536;

    { move in-bounds memos to the new band }
    i:= 0;
    while i < LargeBand.Objects.Count do
    begin
      Memo:= LargeBand.Objects[i];
      if Memo.Left < RightMargin then
      begin
        if Memo.Left+Memo.Width <= RightMargin+5 then
        begin
          Memo.Parent:= Band;
          Memo.Visible:= Memo.Width > 0;
          Dec(i);
        end
        else { cut off the memo }
        begin
          CutSize:= RightMargin-Memo.Left;
          CutMemo:= CreateMemo(Band);
          CutMemo.Assign(Memo);
          CutMemo.Width:= CutSize;
          SetupOriginalComponent(CutMemo, Memo);
          Memo.Width:= Memo.Width-CutSize;
          Memo.Left:= Memo.Left+CutSize;
          if Memo is TfrxDMPMemoView then
          begin
            Memo.Left:= Memo.Left+fr1CharX;
            Memo.Width:= Memo.Width-fr1CharX;
          end;
          CutMemo.Frame.Typ:= CutMemo.Frame.Typ-[ftRight];
          Memo.Frame.Typ:= Memo.Frame.Typ-[ftLeft];
          Memo:= CutMemo;
        end;

        Memo.Left:= Memo.Left-LeftMargin;
      end;
      Inc(i);
    end;

    FColumnBands.Add(Band);
  end;

begin
  ClearColumnBands;
  LargeBand:= TfrxNullBand.Create(nil);
  Items:= FMatrix.ColumnHeader.AllItems;

  { create one large band }
  for i:= 0 to Items.Count-1 do
  begin
    Item:= Items[i];
    Memo:= CreateMemo(LargeBand);
    Memo.Assign(Item.Memo);
    SetupOriginalComponent(Memo, Item.Memo);
    Memo.Text:= Memo.FormatData(Item.Value);
    Memo.Highlight.Condition:= '';
    with Item.Bounds do
      Memo.SetBounds(Left, Top, Right, Bottom);
    CorrectDMPBounds(Memo);
    Memo.Visible:= (Memo.Width<>0) and (Memo.Height<>0);
    DoOnColumnHeader(Memo, Item);
  end;

  Items.Free;

  { cut it to small bands for each page }
  Items:= FMatrix.ColumnHeader.TerminalItems;
  AddWidth:= RowHeaderWidth;
  CurWidth:= Report.Engine.PageWidth-AddWidth;
  LeftMargin:=-Left;
  RightMargin:= LeftMargin+CurWidth;
  LeftIndex:= 0;
  RightIndex:= Items.Count-1;

  for i:= 0 to Items.Count-1 do
  begin
    Item:= Items[i];
    { find right terminal item }
    if Item.Bounds.Left+Item.Bounds.Right-LeftMargin > CurWidth then
    begin
      RightMargin:= Item.Bounds.Left;
      RightIndex:= i-1;
      CreateBand;
      LeftMargin:= RightMargin;
      if FRepeatHeaders then
        AddWidth:= RowHeaderWidth else
        AddWidth:= 0;
      CurWidth:= Report.Engine.PageWidth-AddWidth;
      RightMargin:= LeftMargin+CurWidth;
      LeftIndex:= RightIndex+1;
      RightIndex:= Items.Count-1;
    end;
  end;
  { add last band }
  CreateBand;

  LargeBand.Free;
  Items.Free;
end;

procedure TfrxCustomCrossView.BuildRowBands;
var
  i, TopIndex, BottomIndex:Integer;
  Items:TList;
  Item:TfrxCrossHeader;
  Memo:TfrxCustomMemoView;
  LargeBand:TfrxNullBand;
  CurHeight, AddHeight, TopMargin, BottomMargin:Extended;

  procedure CreateBand;
  var
    i:Integer;
    Band:TfrxNullBand;
    Memo, CutMemo:TfrxCustomMemoView;
    CutSize:Extended;
  begin
    Band:= TfrxNullBand.Create(Report);
    Band.Top:= AddHeight;
    Band.Tag:= TopIndex+BottomIndex * 65536;

    { move in-bounds memos to the new band }
    i:= 0;
    while i < LargeBand.Objects.Count do
    begin
      Memo:= LargeBand.Objects[i];
      if Memo.Top < BottomMargin then
      begin
        if Memo.Top+Memo.Height <= BottomMargin+5 then
        begin
          Memo.Parent:= Band;
          Dec(i);
        end
        else { cut off the memo }
        begin
          CutSize:= BottomMargin-Memo.Top;
          CutMemo:= CreateMemo(Band);
          CutMemo.Assign(Memo);
          CutMemo.Height:= CutSize;
          SetupOriginalComponent(CutMemo, Memo);
          Memo.Height:= Memo.Height-CutSize;
          Memo.Top:= Memo.Top+CutSize;
          if Memo is TfrxDMPMemoView then
          begin
            Memo.Top:= Memo.Top+fr1CharY;
            Memo.Height:= Memo.Height-fr1CharY;
          end;
          CutMemo.Frame.Typ:= CutMemo.Frame.Typ-[ftBottom];
          Memo.Frame.Typ:= Memo.Frame.Typ-[ftTop];
          Memo:= CutMemo;
        end;

        Memo.Top:= Memo.Top-TopMargin;
      end;
      Inc(i);
    end;

    FRowBands.Add(Band);
  end;

begin
  ClearRowBands;
  LargeBand:= TfrxNullBand.Create(nil);
  Items:= FMatrix.RowHeader.AllItems;

  { create one large band }
  for i:= 0 to Items.Count-1 do
  begin
    Item:= Items[i];
    Memo:= CreateMemo(LargeBand);
    Memo.Assign(Item.Memo);
    SetupOriginalComponent(Memo, Item.Memo);
    Memo.Text:= Memo.FormatData(Item.Value);
    Memo.Highlight.Condition:= '';
    with Item.Bounds do
      Memo.SetBounds(Left, Top, Right, Bottom);
    CorrectDMPBounds(Memo);
    Memo.Visible:= (Memo.Width<>0) and (Memo.Height<>0);
    DoOnRowHeader(Memo, Item);
  end;

  Items.Free;

  { cut it to small bands for each page }
  Items:= FMatrix.RowHeader.TerminalItems;
  AddHeight:= ColumnHeaderHeight;
  CurHeight:= Report.Engine.FreeSpace-AddHeight;
  TopMargin:= 0;
  BottomMargin:= TopMargin+CurHeight;
  TopIndex:= 0;
  BottomIndex:= Items.Count-1;

  for i:= 0 to Items.Count-1 do
  begin
    Item:= Items[i];
    { find right terminal item }
    if Item.Bounds.Top+Item.Bounds.Bottom-TopMargin > CurHeight then
    begin
      BottomMargin:= Item.Bounds.Top;
      BottomIndex:= i-1;
      CreateBand;
      TopMargin:= BottomMargin;
      if FRepeatHeaders then
        AddHeight:= ColumnHeaderHeight else
        AddHeight:= 0;
      CurHeight:= Report.Engine.PageHeight-Report.Engine.HeaderHeight-
        Report.Engine.FooterHeight-AddHeight;
      BottomMargin:= TopMargin+CurHeight;
      TopIndex:= BottomIndex+1;
      BottomIndex:= Items.Count-1;
    end;
  end;

  CreateBand;

  LargeBand.Free;
  Items.Free;
end;

{ TfrxCrossView }

class function TfrxCrossView.GetDescription:String;
begin
  Result:= frxResources.Get('obCross');
end;

function TfrxCrossView.IsCrossValid:Boolean;
begin
  Result:= (FCellLevels > 0) and (FRowLevels >= 0) and (FColumnLevels >= 0);
end;

procedure TfrxCrossView.SetCellLevels(const Value:Integer);
var
  i:Integer;
begin
  inherited;
  FCellFields.Clear;
  for i:= 0 to Value-1 do
    FCellFields.Add('Cell');
end;

procedure TfrxCrossView.SetColumnLevels(const Value:Integer);
var
  i:Integer;
begin
  inherited;
  FColumnFields.Clear;
  for i:= 0 to Value-1 do
    FColumnFields.Add('Column');
end;

procedure TfrxCrossView.SetRowLevels(const Value:Integer);
var
  i:Integer;
begin
  inherited;
  FRowFields.Clear;
  for i:= 0 to Value-1 do
    FRowFields.Add('Row');
end;

{ TfrxDBCrossView }

class function TfrxDBCrossView.GetDescription:String;
begin
  Result:= frxResources.Get('obDBCross');
end;

function TfrxDBCrossView.IsCrossValid:Boolean;
begin
  Result:= (DataSet<>nil) and (FCellLevels > 0) and
    (FRowFields.Count = FRowLevels) and (FColumnFields.Count = FColumnLevels) and
    (FCellFields.Count = FCellLevels);
end;

procedure TfrxDBCrossView.FillMatrix;
var
  i:Integer;
  RowValues, ColumnValues, CellValues:array of Variant;
  sl:TStringList;
begin
  SetLength(RowValues, FRowLevels);
  SetLength(ColumnValues, FColumnLevels);
  SetLength(CellValues, FCellLevels);
  sl:= TStringList.Create;
  DataSet.GetFieldList(sl);
  sl.Sorted:= True;

  DataSet.First;
  while not DataSet.Eof do
  begin
    for i:= 0 to FRowLevels-1 do
    begin
      if sl.IndexOf(FRowFields[i])<>-1 then
        RowValues[i]:= DataSet.Value[FRowFields[i]]
      else
        RowValues[i]:= Report.Calc(FRowFields[i])
    end;
    for i:= 0 to FColumnLevels-1 do
    begin
      if sl.IndexOf(FColumnFields[i])<>-1 then
        ColumnValues[i]:= DataSet.Value[FColumnFields[i]]
      else
        ColumnValues[i]:= Report.Calc(FColumnFields[i])
    end;
    for i:= 0 to FCellLevels-1 do
    begin
      if sl.IndexOf(FCellFields[i])<>-1 then
        CellValues[i]:= DataSet.Value[FCellFields[i]]
      else
        CellValues[i]:= Report.Calc(FCellFields[i])
    end;
    AddValue(RowValues, ColumnValues, CellValues);
    DataSet.Next;
  end;

  sl.Free;
  RowValues:= nil;
  ColumnValues:= nil;
  CellValues:= nil;
end;

initialization
  frxObjects.RegisterObject1(TfrxCrossView, nil, '', 'Other', 0, 42);
  frxObjects.RegisterObject1(TfrxDBCrossView, nil, '', 'Other', 0, 49);
  frxResources.Add('TfrxPrintCellEvent',
    'PascalScript=(Memo:TfrxMemoView; RowIndex, ColumnIndex, CellIndex:Integer; RowValues, ColumnValues, Value:Variant);'+#13#10+
    'C++Script=(TfrxMemoView Memo, int RowIndex, int ColumnIndex, int CellIndex, variant RowValues, variant ColumnValues, variant Value)'+#13#10+
    'BasicScript=(Memo, RowIndex, ColumnIndex, CellIndex, RowValues, ColumnValues, Value)'+#13#10+
    'JScript=(Memo, RowIndex, ColumnIndex, CellIndex, RowValues, ColumnValues, Value)');
  frxResources.Add('TfrxPrintHeaderEvent',
    'PascalScript=(Memo:TfrxMemoView; HeaderIndexes, HeaderValues, Value:Variant);'+#13#10+
    'C++Script=(TfrxMemoView Memo, variant HeaderIndexes, variant HeaderValues, variant Value)'+#13#10+
    'BasicScript=(Memo, HeaderIndexes, HeaderValues, Value)'+#13#10+
    'JScript=(Memo, HeaderIndexes, HeaderValues, Value)');
  frxResources.Add('TfrxCalcWidthEvent',
    'PascalScript=(ColumnIndex:Integer; ColumnValues:Variant; var Width:Extended);'+#13#10+
    'C++Script=(int ColumnIndex, variant ColumnValues, float &Width)'+#13#10+
    'BasicScript=(ColumnIndex, ColumnValues, byref Width)'+#13#10+
    'JScript=(ColumnIndex, ColumnValues, &Width)');
  frxResources.Add('TfrxCalcHeightEvent',
    'PascalScript=(RowIndex:Integer; RowValues:Variant; var Height:Extended);'+#13#10+
    'C++Script=(int RowIndex, variant RowValues, float &Height)'+#13#10+
    'BasicScript=(RowIndex, RowValues, byref Height)'+#13#10+
    'JScript=(RowIndex, RowValues, &Height)');

end.
