{******************************************}
{ }
{ FastReport v3.0 }
{ Cross editor }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxCrossEditor;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ToolWin, ComCtrls, ExtCtrls, frxDock, frxCross, frxCrossMatrix,
  frxCustomEditors, frxClass, frxDMPClass, frxCtrls, ImgList, Menus, Buttons
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxCrossEditor = class(TfrxViewEditor)
  public
    function Edit:Boolean; override;
    function Execute(Tag:Integer; Checked:Boolean):Boolean; override;
    function HasEditor:Boolean; override;
    procedure GetMenuItems; override;
  end;

  TfrxCrossEditorForm = class(TForm)
    ScrollBox1:TScrollBox;
    ToolBar:TToolBar;
    FontB:TToolButton;
    PaintBox:TPaintBox;
    AlignLeftB:TToolButton;
    AlignCenterB:TToolButton;
    AlignRightB:TToolButton;
    RotationB:TToolButton;
    FillColorB:TToolButton;
    FrameB:TToolButton;
    CancelB:TToolButton;
    OkB:TToolButton;
    Sep1:TToolButton;
    Sep2:TToolButton;
    HighlightB:TToolButton;
    FormatB:TToolButton;
    Sep3:TToolButton;
    frTBPanel1:TfrxTBPanel;
    StyleCB:TfrxComboBox;
    RotationPopup:TPopupMenu;
    R0MI:TMenuItem;
    R90MI:TMenuItem;
    R180MI:TMenuItem;
    R270MI:TMenuItem;
    FuncPopup:TPopupMenu;
    Func1MI:TMenuItem;
    Func2MI:TMenuItem;
    Func3MI:TMenuItem;
    Func4MI:TMenuItem;
    Func5MI:TMenuItem;
    Func6MI:TMenuItem;
    SortPopup:TPopupMenu;
    Sort1MI:TMenuItem;
    Sort2MI:TMenuItem;
    Sort3MI:TMenuItem;
    DatasetL:TGroupBox;
    DatasetCB:TComboBox;
    FieldsLB:TListBox;
    DimensionsL:TGroupBox;
    RowsL:TLabel;
    RowsE:TEdit;
    ColumnsL:TLabel;
    ColumnsE:TEdit;
    CellsL:TLabel;
    CellsE:TEdit;
    UpDown1:TUpDown;
    UpDown2:TUpDown;
    UpDown3:TUpDown;
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
    StructureL:TGroupBox;
    Shape1:TShape;
    Shape2:TShape;
    SwapB:TSpeedButton;
    RowsLB:TListBox;
    ColumnsLB:TListBox;
    CellsLB:TListBox;
    RowHeaderCB:TCheckBox;
    ColumnHeaderCB:TCheckBox;
    RowTotalCB:TCheckBox;
    ColumnTotalCB:TCheckBox;
    procedure FormCreate(Sender:TObject);
    procedure CancelBClick(Sender:TObject);
    procedure OkBClick(Sender:TObject);
    procedure PaintBoxPaint(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure FormHide(Sender:TObject);
    procedure DatasetCBClick(Sender:TObject);
    procedure DatasetCBDrawItem(Control:TWinControl; Index:Integer;
      ARect:TRect; State:TOwnerDrawState);
    procedure FieldsLBDrawItem(Control:TWinControl; Index:Integer;
      ARect:TRect; State:TOwnerDrawState);
    procedure LBDrawItem(Control:TWinControl; Index:Integer;
      ARect:TRect; State:TOwnerDrawState);
    procedure CellsLBDrawItem(Control:TWinControl; Index:Integer;
      ARect:TRect; State:TOwnerDrawState);
    procedure LBDragOver(Sender, Source:TObject; X, Y:Integer;
      State:TDragState; var Accept:Boolean);
    procedure LBDragDrop(Sender, Source:TObject; X, Y:Integer);
    procedure LBMouseDown(Sender:TObject; Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer);
    procedure PaintBoxMouseDown(Sender:TObject; Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer);
    procedure ToolButtonClick(Sender:TObject);
    procedure PaintBoxDblClick(Sender:TObject);
    procedure LBClick(Sender:TObject);
    procedure CBClick(Sender:TObject);
    procedure FuncMIClick(Sender:TObject);
    procedure CellsLBMouseUp(Sender:TObject; Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer);
    procedure StyleCBClick(Sender:TObject);
    procedure SortMIClick(Sender:TObject);
    procedure SwapBClick(Sender:TObject);
    procedure DimesionsChange(Sender:TObject);
    procedure LBDblClick(Sender:TObject);
  private
    FCross:TfrxCustomCrossView;
    FCurList:TListBox;
    FFuncNames:array[TfrxCrossFunction] of String;
    FImageList:TImageList;
    FSelectedObject:TfrxCustomMemoView;
    FSelectedPoint:TPoint;
    FSortNames:array[TfrxCrossSortOrder] of String;
    FStyleSheet:TfrxStyleSheet;
    FTempCross:TfrxDBCrossView;
    FUpdating:Boolean;
    procedure DrawCross;
    procedure ReflectChanges;
    procedure UpdateControls;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    property Cross:TfrxCustomCrossView read FCross write FCross;
  end;

implementation

{$R *.DFM}

uses
  frxDsgnIntf, frxEditFormat, frxEditHighlight, frxEditMemo,
  frxEditFrame, frxDesgnCtrls, frxRes, frxUtils;

const
  CrossStyles =
'<?xml version="1.0" encoding="utf-8"?>'+
'<stylesheet>'+
'<style Name="Standard">'+
'<item Name="cell" Color="536870911" Frame.Typ="15"/>'+
'<item Name="column" Color="536870911" Frame.Typ="15"/>'+
'<item Name="row" Color="536870911" Frame.Typ="15"/>'+
'<item Name="coltotal" Color="536870911" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowtotal" Color="536870911" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="colgrand" Color="536870911" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowgrand" Color="536870911" Font.Style="1" Frame.Typ="15"/>'+
'</style>'+
'<style Name="Corporate">'+
'<item Name="cell" Color="536870911" Frame.Typ="12"/>'+
'<item Name="column" Color="8421504" Font.Color="16777215" Frame.Typ="15"/>'+
'<item Name="row" Color="8421504" Font.Color="16777215" Frame.Typ="15"/>'+
'<item Name="coltotal" Color="52479" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowtotal" Color="52479" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="colgrand" Color="52479" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowgrand" Color="52479" Font.Style="1" Frame.Typ="15"/>'+
'</style>'+
'<style Name="Grayed">'+
'<item Name="cell" Color="536870911" Frame.Typ="15"/>'+
'<item Name="column" Color="536870911" Frame.Typ="15"/>'+
'<item Name="row" Color="536870911" Frame.Typ="15"/>'+
'<item Name="coltotal" Color="15790320" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowtotal" Color="15790320" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="colgrand" Color="15000804" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowgrand" Color="15000804" Font.Style="1" Frame.Typ="15"/>'+
'</style>'+
'<style Name="Yellow">'+
'<item Name="cell" Color="536870911" Frame.Typ="12"/>'+
'<item Name="column" Color="13434879" Frame.Color="16777215" Frame.Typ="15"/>'+
'<item Name="row" Color="13434879" Frame.Color="16777215" Frame.Typ="15"/>'+
'<item Name="coltotal" Color="10027007" Frame.Color="16777215" Frame.Typ="15"/>'+
'<item Name="rowtotal" Color="10027007" Frame.Color="16777215" Frame.Typ="15"/>'+
'<item Name="colgrand" Color="10027007" Font.Style="1" Frame.Color="16777215" Frame.Typ="15"/>'+
'<item Name="rowgrand" Color="10027007" Font.Style="1" Frame.Color="16777215" Frame.Typ="15"/>'+
'</style>'+
'<style Name="Green">'+
'<item Name="cell" Color="536870911" Frame.Typ="15"/>'+
'<item Name="column" Color="13434828" Frame.Typ="15"/>'+
'<item Name="row" Color="13434828" Frame.Typ="15"/>'+
'<item Name="coltotal" Color="8833409" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowtotal" Color="8833409" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="colgrand" Color="8833409" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowgrand" Color="8833409" Font.Style="1" Frame.Typ="15"/>'+
'</style>'+
'<style Name="Blue">'+
'<item Name="cell" Color="536870911" Frame.Typ="15"/>'+
'<item Name="column" Color="16774348" Frame.Typ="15"/>'+
'<item Name="row" Color="16774348" Frame.Typ="15"/>'+
'<item Name="coltotal" Color="16763904" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowtotal" Color="16763904" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="colgrand" Color="16763904" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowgrand" Color="16763904" Font.Style="1" Frame.Typ="15"/>'+
'</style>'+
'<style Name="Red">'+
'<item Name="cell" Color="536870911" Frame.Typ="15"/>'+
'<item Name="column" Color="9934847" Frame.Typ="15"/>'+
'<item Name="row" Color="9934847" Frame.Typ="15"/>'+
'<item Name="coltotal" Color="7434751" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowtotal" Color="7434751" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="colgrand" Color="7434751" Font.Style="1" Frame.Typ="15"/>'+
'<item Name="rowgrand" Color="7434751" Font.Style="1" Frame.Typ="15"/>'+
'</style>'+
'</stylesheet>';

{ TfrxCrossEditor }

function TfrxCrossEditor.Edit:Boolean;
begin
  with TfrxCrossEditorForm.Create(Designer) do
  begin
    Cross:= TfrxCustomCrossView(Component);
    Result:= ShowModal = mrOk;
    Free;
  end;
end;

function TfrxCrossEditor.Execute(Tag:Integer; Checked:Boolean):Boolean;
var
  i:Integer;
  c:TfrxComponent;
  v:TfrxCustomCrossView;
begin
  Result:= False;
  for i:= 0 to Designer.SelectedObjects.Count-1 do
  begin
    c:= Designer.SelectedObjects[i];
    if (c is TfrxCustomCrossView) and not (rfDontModify in c.Restrictions) then
    begin
      v:= TfrxCustomCrossView(c);
      case Tag of
        1:v.RepeatHeaders:= Checked;
        2:v.Border:= Checked;
        3:v.DownThenAcross:= Checked;
      end;

      Result:= True;
    end;
  end;
end;

procedure TfrxCrossEditor.GetMenuItems;
var
  v:TfrxCustomCrossView;
begin
  v:= TfrxCustomCrossView(Component);

  AddItem(frxResources.Get('crRepHdrs'), 1, v.RepeatHeaders);
  AddItem(frxResources.Get('crBorder'), 2, v.Border);
  AddItem(frxResources.Get('crDown'), 3, v.DownThenAcross);
end;

function TfrxCrossEditor.HasEditor:Boolean;
begin
  Result:= True;
end;

{ TfrxCrossEditorForm }

constructor TfrxCrossEditorForm.Create(AOwner:TComponent);
var
  TempStream:TStringStream;
begin
  FUpdating:= True;
  inherited;
  FTempCross:= TfrxDBCrossView.Create(nil);
  FFuncNames[cfNone]:= frxResources.Get('crNone');
  FFuncNames[cfSum]:= frxResources.Get('crSum');
  FFuncNames[cfMin]:= frxResources.Get('crMin');
  FFuncNames[cfMax]:= frxResources.Get('crMax');
  FFuncNames[cfAvg]:= frxResources.Get('crAvg');
  FFuncNames[cfCount]:= frxResources.Get('crCount');
  FSortNames[soAscending]:= frxResources.Get('crAsc');
  FSortNames[soDescending]:= frxResources.Get('crDesc');
  FSortNames[soNone]:= frxResources.Get('crNone');

  FStyleSheet:= TfrxStyleSheet.Create;
  TempStream:= TStringStream.Create(CrossStyles);
  FStyleSheet.LoadFromStream(TempStream);
  TempStream.Free;
end;

destructor TfrxCrossEditorForm.Destroy;
begin
  FStyleSheet.Free;
  FTempCross.Free;
  inherited;
end;

procedure TfrxCrossEditorForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
  FImageList:= frxResources.MainButtonImages;
  ToolBar.Images:= FImageList;
end;

procedure TfrxCrossEditorForm.FormShow(Sender:TObject);

  procedure SelectDataset;
  begin
    DatasetCB.ItemIndex:= DatasetCB.Items.IndexOfObject(FCross.DataSet);
    if DatasetCB.ItemIndex =-1 then
      DatasetCB.ItemIndex:= 0;
    DatasetCBClick(nil);
  end;

  procedure SelectFields;
  var
    i, j:Integer;
  begin
    for i:= 0 to FCross.RowFields.Count-1 do
    begin
      j:= FieldsLB.Items.IndexOf(FCross.RowFields[i]);
// if (j<>-1) or (FCross is TfrxCrossView) then
      begin
        RowsLB.Items.Add(FCross.RowFields[i]);
        FieldsLB.Items.Delete(j);
      end;
    end;

    for i:= 0 to FCross.ColumnFields.Count-1 do
    begin
      j:= FieldsLB.Items.IndexOf(FCross.ColumnFields[i]);
// if (j<>-1) or (FCross is TfrxCrossView) then
      begin
        ColumnsLB.Items.Add(FCross.ColumnFields[i]);
        FieldsLB.Items.Delete(j);
      end;
    end;

    CellsLB.Items:= FCross.CellFields;
  end;

begin
  FTempCross.Assign(FCross);
  FCross.Report.GetDataSetList(DatasetCB.Items);
  FStyleSheet.GetList(StyleCB.Items);
  StyleCB.ItemIndex:= 0;
  UpdateControls;
  SelectDataset;
  SelectFields;

  FUpdating:= True;

  if FCross is TfrxCrossView then
  begin
    ColumnsLB.DragMode:= dmManual;
    RowsLB.DragMode:= dmManual;
    CellsLB.DragMode:= dmManual;
    SwapB.Visible:= False;
    DimensionsL.Visible:= True;
    RowsE.Text:= IntToStr(FCross.RowLevels);
    ColumnsE.Text:= IntToStr(FCross.ColumnLevels);
    CellsE.Text:= IntToStr(FCross.CellLevels);
  end
  else
    DatasetL.Visible:= True;

  if FCross.DotMatrix then
  begin
    FontB.DropDownMenu:= DMPPopup;
    FontB.OnClick:= nil;
  end;

  ColumnHeaderCB.Checked:= FCross.ShowColumnHeader;
  RowHeaderCB.Checked:= FCross.ShowRowHeader;
  ColumnTotalCB.Checked:= FCross.ShowColumnTotal;
  RowTotalCB.Checked:= FCross.ShowRowTotal;

  FUpdating:= False;
end;

procedure TfrxCrossEditorForm.FormHide(Sender:TObject);
begin
  if ModalResult = mrCancel then
    FCross.Assign(FTempCross);
end;

procedure TfrxCrossEditorForm.DrawCross;

  procedure FillMatrix;
  var
    i:Integer;
    RowValues, ColumnValues, CellValues:array of Variant;
  begin
    FCross.BeginMatrix;
    SetLength(RowValues, FCross.RowLevels);
    SetLength(ColumnValues, FCross.ColumnLevels);
    SetLength(CellValues, FCross.CellLevels);

    for i:= 0 to FCross.RowLevels-1 do
      RowValues[i]:= FCross.RowFields[i];
    for i:= 0 to FCross.ColumnLevels-1 do
      ColumnValues[i]:= FCross.ColumnFields[i];
    for i:= 0 to FCross.CellLevels-1 do
      CellValues[i]:= 0;
    FCross.AddValue(RowValues, ColumnValues, CellValues);

    RowValues:= nil;
    ColumnValues:= nil;
    CellValues:= nil;
    FCross.EndMatrix;
  end;

  procedure DrawSelection(Canvas:TCanvas; m:TfrxCustomMemoView);
  begin
    if m<>nil then
    with Canvas do
    begin
      Brush.Style:= bsClear;
      Pen.Color:= $00A9F9;
      Pen.Width:= 2;
      Rectangle(Round(m.Left+2), Round(m.Top+2),
        Round(m.Left+m.Width-0), Round(m.Top+m.Height-0));
    end;
  end;

  procedure CorrectDMPBounds(Memo:TfrxCustomMemoView);
  begin
    if Memo is TfrxDMPMemoView then
    begin
      Memo.Left:= Memo.Left+fr1CharX;
      Memo.Top:= Memo.Top+fr1CharY;
      Memo.Width:= Memo.Width-fr1CharX;
      Memo.Height:= Memo.Height-fr1CharY;
    end;
  end;

  procedure DrawHeader(Canvas:TCanvas; Header:TfrxCrossHeader; p:TfrxPoint);
  var
    i:Integer;
    Items:TList;
    Item:TfrxCrossHeader;
    r:TfrxRect;
    m:TfrxCustomMemoView;
    s:String;
    fr:TfrxFrame;
  begin
    if not Header.Visible then Exit;
    Items:= Header.AllItems;
    fr:= TfrxFrame.Create;

    for i:= 0 to Items.Count-1 do
    begin
      Item:= Items[i];
      m:= Item.Memo;
      r:= Item.Bounds;
      s:= m.Text;
      m.Text:= VarToStr(Item.Value);
      fr.Assign(m.Frame);
      if m.Frame.Typ = [] then
      begin
        m.Frame.Typ:= [ftLeft, ftRight, ftTop, ftBottom];
        m.Frame.Color:= $E8E8E8;
      end;

      m.SetBounds(r.Left+p.X, r.Top+p.Y, r.Right, r.Bottom);
      CorrectDMPBounds(m);
      if m.Visible then
      begin
        m.Draw(Canvas, 1, 1, 0, 0);
        if PtInRect(Rect(Round(r.Left+p.X), Round(r.Top+p.Y),
          Round(r.Left+p.X+r.Right), Round(r.Top+p.Y+r.Bottom)), FSelectedPoint) then
        begin
          FSelectedObject:= m;
          FSelectedPoint:= Point(0, 0);
          DrawSelection(Canvas, m);
        end;
      end;

      m.Text:= s;
      m.Frame:= fr;
    end;

    fr.Free;
    Items.Free;
  end;

  procedure DrawCell(Canvas:TCanvas; p:TfrxPoint);
  var
    i:Integer;
    h, CellOffs, CellWidth:Extended;
    Cell:Variant;
    ColumnItems, RowItems:TList;
    ColumnItem, RowItem:TfrxCrossHeader;
    m:TfrxCustomMemoView;
    CellRect:TRect;
  begin
    ColumnItems:= FCross.Matrix.ColumnHeader.TerminalItems;
    RowItems:= FCross.Matrix.RowHeader.TerminalItems;

    RowItem:= RowItems[0];
    ColumnItem:= ColumnItems[0];
    h:= RowItem.Bounds.Bottom / FCross.CellLevels;
    CellOffs:= 0;

    for i:= 0 to FCross.CellLevels-1 do
    begin
      Cell:= FCross.Matrix.GetValue(0, 0, i);
      m:= FCross.CellMemos[i];
      m.Text:= m.FormatData(Cell);
      if FCross.PlainCells then
      begin
        CellWidth:= ColumnItem.CellSizes[i];
        m.SetBounds(p.X+CellOffs, p.Y, CellWidth, RowItem.Bounds.Bottom);
        CellRect:= Rect(Round(p.X+CellOffs), Round(p.Y),
          Round(p.X+CellOffs+CellWidth), Round(p.Y+RowItem.Bounds.Bottom));
        CellOffs:= CellOffs+CellWidth;
      end
      else
      begin
        m.SetBounds(p.X, p.Y+i * h, ColumnItem.Bounds.Right, h);
        CellRect:= Rect(Round(p.X), Round(p.Y+i * h),
          Round(p.X+ColumnItem.Bounds.Right), Round(p.Y+i * h+h));
      end;
      CorrectDMPBounds(m);
      m.Draw(Canvas, 1, 1, 0, 0);

      if PtInRect(CellRect, FSelectedPoint) then
      begin
        FSelectedObject:= m;
        FSelectedPoint:= Point(0, 0);
        DrawSelection(Canvas, m);
      end;
    end;

    ColumnItems.Free;
    RowItems.Free;
  end;

begin
  with PaintBox.Canvas do
  begin
    Brush.Color:= clWindow;
    FillRect(Rect(0, 0, PaintBox.Width, PaintBox.Height));
  end;

  if FCross.IsCrossValid then
  begin
    FillMatrix;
    if not FCross.Matrix.NoColumns then
      DrawHeader(PaintBox.Canvas, FCross.Matrix.ColumnHeader,
        frxPoint(FCross.RowHeaderWidth+10, 10));
    if not FCross.Matrix.NoRows then
      DrawHeader(PaintBox.Canvas, FCross.Matrix.RowHeader,
        frxPoint(10, FCross.ColumnHeaderHeight+10));
    DrawCell(PaintBox.Canvas, frxPoint(FCross.RowHeaderWidth+10,
      FCross.ColumnHeaderHeight+10));
    DrawSelection(PaintBox.Canvas, FSelectedObject);
  end;
end;

procedure TfrxCrossEditorForm.PaintBoxPaint(Sender:TObject);
begin
  DrawCross;
end;

procedure TfrxCrossEditorForm.DatasetCBDrawItem(Control:TWinControl;
  Index:Integer; ARect:TRect; State:TOwnerDrawState);
begin
  DatasetCB.Canvas.FillRect(ARect);
  FImageList.Draw(DatasetCB.Canvas, ARect.Left, ARect.Top, 53);
  DatasetCB.Canvas.TextOut(ARect.Left+20, ARect.Top+1, DatasetCB.Items[Index]);
end;

procedure TfrxCrossEditorForm.DatasetCBClick(Sender:TObject);
var
  ds:TfrxCustomDBDataSet;
begin
  if DatasetCB.ItemIndex =-1 then Exit;
  ds:= TfrxCustomDBDataSet(DatasetCB.Items.Objects[DatasetCB.ItemIndex]);
  ds.GetFieldList(FieldsLB.Items);
  RowsLB.Clear;
  ColumnsLB.Clear;
  CellsLB.Clear;
  if Sender<>nil then
    ReflectChanges;
end;

procedure TfrxCrossEditorForm.FieldsLBDrawItem(Control:TWinControl;
  Index:Integer; ARect:TRect; State:TOwnerDrawState);
begin
  FieldsLB.Canvas.FillRect(ARect);
  FImageList.Draw(FieldsLB.Canvas, ARect.Left, ARect.Top, 54);
  FieldsLB.Canvas.TextOut(ARect.Left+20, ARect.Top+1, FieldsLB.Items[Index]);
end;

procedure TfrxCrossEditorForm.ReflectChanges;
begin
  if DatasetCB.ItemIndex =-1 then
    FCross.DataSet:= nil else
    FCross.DataSet:= TfrxCustomDBDataSet(DatasetCB.Items.Objects[DatasetCB.ItemIndex]);
  if FCross is TfrxDBCrossView then
  begin
    FCross.RowFields:= RowsLB.Items;
    FCross.ColumnFields:= ColumnsLB.Items;
    FCross.CellFields:= CellsLB.Items;
  end;
  FCross.RowLevels:= FCross.RowFields.Count;
  FCross.ColumnLevels:= FCross.ColumnFields.Count;
  FCross.CellLevels:= FCross.CellFields.Count;
  FSelectedObject:= nil;
  DrawCross;
  UpdateControls;
end;

procedure TfrxCrossEditorForm.LBDragOver(Sender, Source:TObject; X,
  Y:Integer; State:TDragState; var Accept:Boolean);
begin
  Accept:= (Source is TListBox) and (TListBox(Source).Items.Count > 0);
end;

procedure TfrxCrossEditorForm.LBDragDrop(Sender, Source:TObject; X,
  Y:Integer);
var
  s:String;
  i:Integer;
  CellExist:Boolean;
  SourceLB, SenderLB:TListBox;
begin
  SourceLB:= TListBox(Source);
  SenderLB:= TListBox(Sender);
  if (Source = Sender) and (Source<>FieldsLB) then
  begin
    i:= SourceLB.ItemAtPos(Point(X, Y), True);
    if i =-1 then
      i:= SourceLB.Items.Count-1;
    SourceLB.Items.Exchange(SourceLB.ItemIndex, i);
  end
  else if Source<>Sender then
  begin
    if SourceLB.ItemIndex =-1 then Exit;
    s:= SourceLB.Items[SourceLB.ItemIndex];

    CellExist:= CellsLB.Items.IndexOf(s) >= 0;

    if not (((Source = CellsLB) and (Sender = FieldsLB)) or
      ((Source = FieldsLB) and (Sender<>CellsLB) and CellExist)) then
      SenderLB.Items.Add(s);
    i:= FieldsLB.Items.IndexOf(s);
    if (Source = CellsLB) and (Sender<>FieldsLB) and (i<>-1) then
    begin
      FieldsLB.Items.Delete(i);
      repeat
        i:= CellsLB.Items.IndexOf(s);
        if i<>-1 then
          CellsLB.Items.Delete(i);
      until i =-1;
    end;
    if (Source<>FieldsLB) and (Sender = CellsLB) then
      FieldsLB.Items.Add(s);

    if not (((Source = FieldsLB) and (Sender = CellsLB)) or
      ((Source = FieldsLB) and CellExist)) then
    begin
      i:= SourceLB.ItemIndex;
      if (i<>-1) and (SourceLB.Items[i] = s) then
        SourceLB.Items.Delete(i);
    end;
  end;

  ReflectChanges;
end;

procedure TfrxCrossEditorForm.LBDrawItem(Control:TWinControl;
  Index:Integer; ARect:TRect; State:TOwnerDrawState);
var
  HasSubtotal:Boolean;
  sort:String;
begin
  with TListBox(Control), TListBox(Control).Canvas do
  begin
    FillRect(ARect);
    TextOut(ARect.Left+2, ARect.Top+1, Items[Index]);

    if Control = RowsLB then
      sort:= FSortNames[FCross.RowSort[Index]] else
      sort:= FSortNames[FCross.ColumnSort[Index]];
    TextOut(ARect.Left+200, ARect.Top+1, sort);

    if Index<>Items.Count-1 then
    begin
      TextOut(ARect.Left+135, ARect.Top+1, frxResources.Get('crSubtotal'));
      Pen.Color:= clGray;
      Brush.Color:= clWindow;
      Rectangle(ARect.Left+120, ARect.Top+3, ARect.Left+131, ARect.Top+14);

      if Control = RowsLB then
        HasSubtotal:= FCross.RowTotalMemos[Index+1].Visible else
        HasSubtotal:= FCross.ColumnTotalMemos[Index+1].Visible;

      if HasSubtotal then
      begin
        Pen.Color:= clBlack;
        with ARect do
        begin
          PolyLine([Point(Left+122, Top+7), Point(Left+124, Top+9), Point(Left+129, Top+4)]);
          PolyLine([Point(Left+122, Top+8), Point(Left+124, Top+10), Point(Left+129, Top+5)]);
          PolyLine([Point(Left+122, Top+9), Point(Left+124, Top+11), Point(Left+129, Top+6)]);
        end;
      end;
    end;

    Pen.Color:= clGray;
    Brush.Color:= clWindow;
    Rectangle(ARect.Left+185, ARect.Top+3, ARect.Left+196, ARect.Top+14);

    Pen.Color:= clBlack;
    with ARect do
    begin
      MoveTo(Left+187, Top+7); LineTo(Left+194, Top+7);
      MoveTo(Left+188, Top+8); LineTo(Left+193, Top+8);
      MoveTo(Left+189, Top+9); LineTo(Left+192, Top+9);
      MoveTo(Left+190, Top+10); LineTo(Left+191, Top+10);
    end;
  end;
end;

procedure TfrxCrossEditorForm.LBClick(Sender:TObject);
begin
  if Sender<>FieldsLB then
    FieldsLB.ItemIndex:=-1;
  if Sender<>RowsLB then
    RowsLB.ItemIndex:=-1;
  if Sender<>ColumnsLB then
    ColumnsLB.ItemIndex:=-1;
  if Sender<>CellsLB then
    CellsLB.ItemIndex:=-1;
end;

procedure TfrxCrossEditorForm.LBDblClick(Sender:TObject);
var
  lb:TListBox;
  s:String;
begin
  lb:= TListBox(Sender);

  s:= Cross.Report.Designer.InsertExpression(lb.Items[lb.ItemIndex]);
  if s<>'' then
  begin
    lb.Items[lb.ItemIndex]:= s;
    ReflectChanges;
  end;
end;

procedure TfrxCrossEditorForm.CancelBClick(Sender:TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrxCrossEditorForm.OkBClick(Sender:TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrxCrossEditorForm.LBMouseDown(Sender:TObject;
  Button:TMouseButton; Shift:TShiftState; X, Y:Integer);
var
  Memo:TfrxCustomMemoView;
  sort:TfrxCrossSortOrder;
  i:Integer;
  pt:TPoint;
begin
  FCurList:= TListBox(Sender);
  if (X > 118) and (X < 133) then
  begin
    if FCurList = RowsLB then
      Memo:= FCross.RowTotalMemos[FCurList.ItemIndex+1] else
      Memo:= FCross.ColumnTotalMemos[FCurList.ItemIndex+1];
    Memo.Visible:= not Memo.Visible;
  end;

  if (X > 183) and (X < 198) then
  begin
    if FCurList = RowsLB then
      sort:= FCross.RowSort[FCurList.ItemIndex] else
      sort:= FCross.ColumnSort[FCurList.ItemIndex];

    for i:= 0 to SortPopup.Items.Count-1 do
      if SortPopup.Items[i].Tag = Integer(sort) then
         SortPopup.Items[i].Checked:= True;
    pt:= FCurList.ClientToScreen(Point(X, Y));
    SortPopup.Popup(pt.X, pt.Y);
  end;

  FCurList.Invalidate;
  ReflectChanges;
end;

procedure TfrxCrossEditorForm.PaintBoxMouseDown(Sender:TObject;
  Button:TMouseButton; Shift:TShiftState; X, Y:Integer);
begin
  FSelectedPoint:= Point(X, Y);
  FSelectedObject:= nil;
  DrawCross;
  UpdateControls;
end;

procedure TfrxCrossEditorForm.UpdateControls;
var
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

begin
  SetEnabled([AlignLeftB, AlignCenterB, AlignRightB, RotationB, HighlightB,
    FormatB], FSelectedObject<>nil);

  if FSelectedObject<>nil then
  begin
    AlignLeftB.Down:= FSelectedObject.HAlign = haLeft;
    AlignCenterB.Down:= FSelectedObject.HAlign = haCenter;
    AlignRightB.Down:= FSelectedObject.HAlign = haRight;
    RotationB.Enabled:= FSelectedObject.Tag >= 100;
  end;

  DMPFontStyle:= [];
  if FSelectedObject is TfrxDMPMemoView then
    DMPFontStyle:= TfrxDMPMemoView(FSelectedObject).FontStyle;

  BoldMI.Checked:= fsxBold in DMPFontStyle;
  ItalicMI.Checked:= fsxItalic in DMPFontStyle;
  UnderlineMI.Checked:= fsxUnderline in DMPFontStyle;
  SuperScriptMI.Checked:= fsxSuperScript in DMPFontStyle;
  SubScriptMI.Checked:= fsxSubScript in DMPFontStyle;
  CondensedMI.Checked:= fsxCondensed in DMPFontStyle;
  WideMI.Checked:= fsxWide in DMPFontStyle;
  N12cpiMI.Checked:= fsx12cpi in DMPFontStyle;
  N15cpiMI.Checked:= fsx15cpi in DMPFontStyle;
end;

procedure TfrxCrossEditorForm.ToolButtonClick(Sender:TObject);
var
  i:Integer;
  AllMemos:TList;

  procedure EditFont;
  var
    i:Integer;
    m:TfrxCustomMemoView;
  begin
    with TFontDialog.Create(Application) do
    begin
      if FSelectedObject<>nil then
        Font:= FSelectedObject.Font;
      Options:= Options+[fdForceFontExist];
      if Execute then
        if FSelectedObject<>nil then
          FSelectedObject.Font:= Font
        else
          for i:= 0 to AllMemos.Count-1 do
          begin
            m:= AllMemos[i];
            m.Font.Name:= Font.Name;
            m.Font.Size:= Font.Size;
            m.Font.Color:= Font.Color;
            m.Font.Charset:= Font.Charset;
          end;
      Free;
    end;
  end;

  procedure EditFormat;
  begin
    with TfrxFormatEditorForm.Create(Owner) do
    begin
      Format.Assign(FSelectedObject.DisplayFormat);
      if ShowModal = mrOk then
        FSelectedObject.DisplayFormat:= Format;
      Free;
    end;
  end;

  procedure EditHighlight;
  begin
    with TfrxHighlightEditorForm.Create(Owner) do
    begin
      MemoView:= FSelectedObject;
      if ShowModal = mrOk then
        FSelectedObject.Highlight:= MemoView.Highlight;
      Free;
    end;
  end;

  procedure EditFrame;
  var
    i:Integer;
    m:TfrxCustomMemoView;
  begin
    with TfrxFrameEditorForm.Create(Owner) do
    begin
      if FSelectedObject<>nil then
        Frame.Assign(FSelectedObject.Frame);
      if ShowModal = mrOk then
        if FSelectedObject<>nil then
          FSelectedObject.Frame:= Frame
        else
          for i:= 0 to AllMemos.Count-1 do
          begin
            m:= AllMemos[i];
            m.Frame:= Frame;
          end;
      Free;
    end;
  end;

  procedure SetFillColor(c:TColor);
  var
    i:Integer;
    m:TfrxCustomMemoView;
  begin
    if FSelectedObject<>nil then
      FSelectedObject.Color:= c
    else
      for i:= 0 to AllMemos.Count-1 do
      begin
        m:= AllMemos[i];
        m.Color:= c;
      end;
  end;

  procedure SetDMPFontStyle(fStyle:TfrxDMPFontStyle; Include:Boolean);
  var
    i:Integer;
    m:TfrxCustomMemoView;

    procedure DoSetStyle(m:TfrxCustomMemoView);
    var
      Style:TfrxDMPFontStyles;
    begin
      Style:= TfrxDMPMemoView(m).FontStyle;
      if not Include then
        Style:= Style+[fStyle] else
        Style:= Style-[fStyle];
      TfrxDMPMemoView(m).FontStyle:= Style;
    end;

  begin
    if FSelectedObject<>nil then
      DoSetStyle(FSelectedObject)
    else
      for i:= 0 to AllMemos.Count-1 do
      begin
        m:= AllMemos[i];
        DoSetStyle(m);
      end;
  end;

begin
  AllMemos:= TList.Create;
  for i:= 0 to CROSS_DIM_SIZE-1 do
  begin
    AllMemos.Add(FCross.CellMemos[i]);
    AllMemos.Add(FCross.ColumnMemos[i]);
    AllMemos.Add(FCross.ColumnTotalMemos[i]);
    AllMemos.Add(FCross.RowMemos[i]);
    AllMemos.Add(FCross.RowTotalMemos[i]);
  end;

  case TComponent(Sender).Tag of
    1:{ Font }
      EditFont;

    2, 3, 4:{ Align }
      FSelectedObject.HAlign:= TfrxHAlign(TControl(Sender).Tag-2);

    5:{ Rotation }
      FSelectedObject.Rotation:= TMenuItem(Sender).HelpContext;

    6:{ Highlight }
      EditHighlight;

    7:{ Format }
      EditFormat;

    8:{ Frame }
      EditFrame;

    9:{ Fill Color setup }
      with TfrxColorSelector.Create(TComponent(Sender)) do
      begin
        OnColorChanged:= ToolButtonClick;
        Tag:= 90;
      end;

    34:SetDMPFontStyle(fsxBold, BoldMI.Checked);

    35:SetDMPFontStyle(fsxItalic, ItalicMI.Checked);

    36:SetDMPFontStyle(fsxUnderline, UnderlineMI.Checked);

    37:SetDMPFontStyle(fsxSuperScript, SuperScriptMI.Checked);

    38:SetDMPFontStyle(fsxSubScript, SubScriptMI.Checked);

    39:SetDMPFontStyle(fsxCondensed, CondensedMI.Checked);

    40:SetDMPFontStyle(fsxWide, WideMI.Checked);

    41:SetDMPFontStyle(fsx12cpi, N12cpiMI.Checked);

    42:SetDMPFontStyle(fsx15cpi, N15cpiMI.Checked);

    90:{ Fill Color }
      SetFillColor(TfrxColorSelector(Sender).Color);
  end;

  AllMemos.Free;
  UpdateControls;
  DrawCross;
end;

procedure TfrxCrossEditorForm.PaintBoxDblClick(Sender:TObject);
begin
  { edit only total memos }
  if (FSelectedObject<>nil) and (FSelectedObject.Tag >= 300) then
    with TfrxMemoEditorForm.Create(Owner) do
    begin
      MemoView:= FSelectedObject;
      if ShowModal = mrOk then
        FSelectedObject.Text:= Memo.Text;
      Free;
    end;
end;

procedure TfrxCrossEditorForm.CBClick(Sender:TObject);
begin
  if FUpdating then Exit;

  case TControl(Sender).Tag of
    0:FCross.ShowRowHeader:= RowHeaderCB.Checked;
    1:FCross.ShowColumnHeader:= ColumnHeaderCB.Checked;
    2:FCross.ShowRowTotal:= RowTotalCB.Checked;
    3:FCross.ShowColumnTotal:= ColumnTotalCB.Checked;
  end;

  ReflectChanges;
end;

procedure TfrxCrossEditorForm.DimesionsChange(Sender:TObject);
begin
  if FUpdating then Exit;

  case TControl(Sender).Tag of
    0:FCross.RowLevels:= StrToInt(RowsE.Text);
    1:FCross.ColumnLevels:= StrToInt(ColumnsE.Text);
    2:FCross.CellLevels:= StrToInt(CellsE.Text);
  end;

  RowsLB.Items:= FCross.RowFields;
  ColumnsLB.Items:= FCross.ColumnFields;
  CellsLB.Items:= FCross.CellFields;

  ReflectChanges;
end;

procedure TfrxCrossEditorForm.CellsLBDrawItem(Control:TWinControl;
  Index:Integer; ARect:TRect; State:TOwnerDrawState);
begin
  with TListBox(Control), TListBox(Control).Canvas do
  begin
    FillRect(ARect);
    TextOut(ARect.Left+2, ARect.Top+1, Items[Index]);
    TextOut(ARect.Left+200, ARect.Top+1, FFuncNames[FCross.CellFunctions[Index]]);
    Pen.Color:= clGray;
    Brush.Color:= clWindow;
    Rectangle(ARect.Left+185, ARect.Top+3, ARect.Left+196, ARect.Top+14);

    Pen.Color:= clBlack;
    with ARect do
    begin
      MoveTo(Left+187, Top+7); LineTo(Left+194, Top+7);
      MoveTo(Left+188, Top+8); LineTo(Left+193, Top+8);
      MoveTo(Left+189, Top+9); LineTo(Left+192, Top+9);
      MoveTo(Left+190, Top+10); LineTo(Left+191, Top+10);
    end;
  end;
end;

procedure TfrxCrossEditorForm.FuncMIClick(Sender:TObject);
begin
  if CellsLB.ItemIndex =-1 then Exit;
  FCross.CellFunctions[CellsLB.ItemIndex]:= TfrxCrossFunction(TControl(Sender).Tag);
  CellsLB.Invalidate;
  CellsLB.EndDrag(False);
end;

procedure TfrxCrossEditorForm.CellsLBMouseUp(Sender:TObject;
  Button:TMouseButton; Shift:TShiftState; X, Y:Integer);
var
  i:Integer;
  f:TfrxCrossFunction;
  pt:TPoint;
begin
  if CellsLB.ItemIndex =-1 then Exit;
  if (X > 183) and (X < 198) then
  begin
    f:= FCross.CellFunctions[CellsLB.ItemIndex];
    for i:= 0 to FuncPopup.Items.Count-1 do
      if FuncPopup.Items[i].Tag = Integer(f) then
         FuncPopup.Items[i].Checked:= True;
    pt:= CellsLB.ClientToScreen(Point(X, Y));
    FuncPopup.Popup(pt.X, pt.Y);
  end;
end;

procedure TfrxCrossEditorForm.StyleCBClick(Sender:TObject);
var
  i:Integer;
  Style:TfrxStyles;
  AllMemos:TList;
begin
  Style:= FStyleSheet.Find(StyleCB.Text);
  if Style = nil then Exit;

  AllMemos:= TList.Create;
  for i:= 0 to CROSS_DIM_SIZE-1 do
  begin
    AllMemos.Add(FCross.CellMemos[i]);
    AllMemos.Add(FCross.ColumnMemos[i]);
    AllMemos.Add(FCross.ColumnTotalMemos[i]);
    AllMemos.Add(FCross.RowMemos[i]);
    AllMemos.Add(FCross.RowTotalMemos[i]);
  end;

  for i:= 0 to AllMemos.Count-1 do
    TfrxCustomMemoView(AllMemos[i]).ApplyStyle(
      Style.Find(TfrxCustomMemoView(AllMemos[i]).Style));

  AllMemos.Free;
  ScrollBox1.SetFocus;
  DrawCross;
end;

procedure TfrxCrossEditorForm.SortMIClick(Sender:TObject);
begin
  if FCurList.ItemIndex =-1 then Exit;
  if FCurList = ColumnsLB then
    FCross.ColumnSort[FCurList.ItemIndex]:= TfrxCrossSortOrder(TControl(Sender).Tag) else
    FCross.RowSort[FCurList.ItemIndex]:= TfrxCrossSortOrder(TControl(Sender).Tag);
  FCurList.Invalidate;
  FCurList.EndDrag(False);
end;

procedure TfrxCrossEditorForm.SwapBClick(Sender:TObject);
var
  sl:TStrings;
begin
  sl:= TStringList.Create;
  sl.Assign(RowsLB.Items);
  RowsLB.Items:= ColumnsLB.Items;
  ColumnsLB.Items:= sl;
  sl.Free;

  ReflectChanges;
end;

initialization
  frxComponentEditors.Register(TfrxCrossView, TfrxCrossEditor);
  frxComponentEditors.Register(TfrxDBCrossView, TfrxCrossEditor);

end.
