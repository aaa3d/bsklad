{******************************************}
{ }
{ FastReport v3.0 }
{ Report preview }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxPreview;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Menus, ComCtrls, ImgList, frxCtrls, frxDock,
  ToolWin, frxPreviewPages, frxClass
{$IFDEF Delphi6}
, Variants
{$ENDIF};

const
  WM_UPDATEZOOM = WM_USER+1;

type
  TfrxPreview = class;
  TfrxPreviewWorkspace = class;
  TfrxPageList = class;

  TfrxPreviewTool = (ptHand, ptZoom);
  TfrxPageChangedEvent = procedure(Sender:TfrxPreview; PageNo:Integer) of object;

  TfrxPreview = class(TfrxCustomPreview)
  private
    FAllowF3:Boolean;
    FCancelButton:TButton;
    FLocked:Boolean;
    FMessageLabel:TLabel;
    FMessagePanel:TPanel;
    FOnPageChanged:TfrxPageChangedEvent;
    FOutline:TTreeView;
    FPageNo:Integer;
    FRunning:Boolean;
    FScrollBars:TScrollStyle;
    FSplitter:TSplitter;
    FTick:Cardinal;
    FTool:TfrxPreviewTool;
    FWorkspace:TfrxPreviewWorkspace;
    FZoom:Extended;
    FZoomMode:TfrxZoomMode;
    function GetOutlineVisible:Boolean;
    function GetPageCount:Integer;
    procedure EditTemplate;
    procedure OnCancel(Sender:TObject);
    procedure SetOutlineVisible(const Value:Boolean);
    procedure SetPageNo(const Value:Integer);
    procedure SetTool(const Value:TfrxPreviewTool);
    procedure SetZoom(const Value:Extended);
    procedure SetZoomMode(const Value:TfrxZoomMode);
    procedure TreeClick(Sender:TObject);
    procedure UpdateZoom;
    procedure UpdateOutline;
    procedure UpdatePageNumbers;
    procedure UpdatePages;
    procedure WMEraseBackground(var Message:TMessage); message WM_ERASEBKGND;
    procedure WMGetDlgCode(var Message:TWMGetDlgCode); message WM_GETDLGCODE;
  protected
    procedure Resize; override;
    procedure Notification(AComponent:TComponent; Operation:TOperation); override;
    procedure KeyDown(var Key:Word; Shift:TShiftState); override;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure Init; override;
    procedure Lock; override;
    procedure Unlock; override;
    procedure InternalOnProgressStart(Sender:TfrxReport;
      ProgressType:TfrxProgressType; Progress:Integer); override;
    procedure InternalOnProgress(Sender:TfrxReport;
      ProgressType:TfrxProgressType; Progress:Integer); override;
    procedure InternalOnProgressStop(Sender:TfrxReport;
      ProgressType:TfrxProgressType; Progress:Integer); override;

    procedure AddPage;
    procedure DeletePage;
    procedure Print;
    procedure LoadFromFile; overload;
    procedure LoadFromFile(FileName:String); overload;
    procedure SaveToFile; overload;
    procedure SaveToFile(FileName:String); overload;
    procedure Edit;
    procedure Export(Filter:TfrxCustomExportFilter);
    procedure First;
    procedure Next;
    procedure Prior;
    procedure Last;
    procedure PageSetupDlg;
    procedure Find;
    procedure FindNext;
    procedure Cancel;
    procedure Clear;
    procedure SetPosition(PageN, Top:Integer);
    procedure ShowMessage(const s:String);
    procedure HideMessage;
    procedure MouseWheelScroll(Delta:Integer; Horz:Boolean = False;
      Zoom:Boolean = False);
    property PageCount:Integer read GetPageCount;
    property PageNo:Integer read FPageNo write SetPageNo;
    property Tool:TfrxPreviewTool read FTool write SetTool;
    property Zoom:Extended read FZoom write SetZoom;
    property ZoomMode:TfrxZoomMode read FZoomMode write SetZoomMode;
  published
    property Align;
    property OutlineVisible:Boolean read GetOutlineVisible write SetOutlineVisible;
    property PopupMenu;
    property OnClick;
    property OnPageChanged:TfrxPageChangedEvent read FOnPageChanged write FOnPageChanged;
  end;

  TfrxPreviewForm = class(TForm)
    ToolBar:TToolBar;
    MainImages:TImageList;
    OpenB:TToolButton;
    SaveB:TToolButton;
    PrintB:TToolButton;
    ExportB:TToolButton;
    FindB:TToolButton;
    PageSettingsB:TToolButton;
    Sep3:TfrxTBPanel;
    ZoomCB:TfrxComboBox;
    Sep1:TToolButton;
    Sep2:TToolButton;
    FirstB:TToolButton;
    PriorB:TToolButton;
    Sep4:TfrxTBPanel;
    PageE:TEdit;
    NextB:TToolButton;
    LastB:TToolButton;
    StatusBar:TStatusBar;
    ZoomWholePageB:TToolButton;
    ZoomPageWidthB:TToolButton;
    Zoom100B:TToolButton;
    Zoom50B:TToolButton;
    Sep5:TToolButton;
    HandToolB:TToolButton;
    ZoomToolB:TToolButton;
    Sep6:TToolButton;
    OutlineB:TToolButton;
    Image1:TImage;
    NewPageB:TToolButton;
    DelPageB:TToolButton;
    DesignerB:TToolButton;
    Sep7:TToolButton;
    frTBPanel1:TfrxTBPanel;
    CancelB:TSpeedButton;
    ExportPopup:TPopupMenu;
    HiddenMenu:TPopupMenu;
    Showtemplate1:TMenuItem;
    procedure FormCreate(Sender:TObject);
    procedure OutlineBClick(Sender:TObject);
    procedure ZoomWholePageBClick(Sender:TObject);
    procedure ZoomPageWidthBClick(Sender:TObject);
    procedure Zoom100BClick(Sender:TObject);
    procedure Zoom50BClick(Sender:TObject);
    procedure ZoomCBClick(Sender:TObject);
    procedure FormKeyPress(Sender:TObject; var Key:Char);
    procedure SelectToolBClick(Sender:TObject);
    procedure FirstBClick(Sender:TObject);
    procedure PriorBClick(Sender:TObject);
    procedure NextBClick(Sender:TObject);
    procedure LastBClick(Sender:TObject);
    procedure PageEClick(Sender:TObject);
    procedure PrintBClick(Sender:TObject);
    procedure OpenBClick(Sender:TObject);
    procedure SaveBClick(Sender:TObject);
    procedure FindBClick(Sender:TObject);
    procedure FormClose(Sender:TObject; var Action:TCloseAction);
    procedure DesignerBClick(Sender:TObject);
    procedure NewPageBClick(Sender:TObject);
    procedure DelPageBClick(Sender:TObject);
    procedure CancelBClick(Sender:TObject);
    procedure FormKeyDown(Sender:TObject; var Key:Word;
      Shift:TShiftState);
    procedure PageSettingsBClick(Sender:TObject);
    procedure FormMouseWheel(Sender:TObject; Shift:TShiftState;
      WheelDelta:Integer; MousePos:TPoint; var Handled:Boolean);
    procedure DesignerBMouseUp(Sender:TObject; Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer);
    procedure Showtemplate1Click(Sender:TObject);
    procedure FormCloseQuery(Sender:TObject; var CanClose:Boolean);
  private
    FFreeOnClose:Boolean;
    FPreview:TfrxPreview;
    procedure ExportMIClick(Sender:TObject);
    procedure OnPageChanged(Sender:TfrxPreview; PageNo:Integer);
    procedure UpdateControls;
    procedure UpdateZoom;
    procedure WMUpdateZoom(var Message:TMessage); message WM_UPDATEZOOM;
    function GetReport:TfrxReport;
  public
    procedure Init;
    procedure SetMessageText(const Value:String);
    property FreeOnClose:Boolean read FFreeOnClose write FFreeOnClose;
    property Preview:TfrxPreview read FPreview;
    property Report:TfrxReport read GetReport;
  end;

  TfrxPreviewWorkspace = class(TfrxScrollWin)
  private
    FDefaultCursor:TCursor;
    FDisableUpdate:Boolean;
    FDown:Boolean;
    FEMFImage:TMetafile;
    FEMFImagePage:Integer;
    FLastFoundPage:Integer;
    FLastPoint:TPoint;
    FOffset:TPoint;
    FPageList:TfrxPageList;
    FPreview:TfrxPreview;
    function PreviewPages:TfrxCustomPreviewPages;
    procedure FindText;
    procedure HandleKey(Key:Word; Shift:TShiftState);
    procedure SetToPageNo(PageNo:Integer);
    procedure UpdateScrollBars;
  protected
    procedure MouseDown(Button:TMouseButton;
      Shift:TShiftState; X, Y:Integer); override;
    procedure MouseMove(Shift:TShiftState; X, Y:Integer); override;
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState;
      X, Y:Integer); override;
    procedure OnHScrollChange(Sender:TObject); override;
    procedure Resize; override;
    procedure OnVScrollChange(Sender:TObject); override;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
  end;

  TfrxPageItem = class(TObject)
  public
    Column:Word;
    Height:Word;
    Width:Word;
    Offset:Integer;
  end;

  TfrxPageList = class(TObject)
  private
    FColumnCount:Integer;
    FList:TList;
    FMaxWidth:Integer;
    procedure SetColumnCount(Value:Integer);
    function GetCount:Integer;
    function GetItems(Index:Integer):TfrxPageItem;
    property Items[Index:Integer]:TfrxPageItem read GetItems;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure AddPage(AWidth, AHeight:Integer);
    function FindPage(Offset:Integer; Scale:Extended;
      Exact:Boolean = False):Integer;
    function GetPageBounds(Index, ClientWidth:Integer; Scale:Extended):TRect;
    function GetMaxBounds(ClientWidth:Integer; Scale:Extended):TPoint;
    property ColumnCount:Integer read FColumnCount write SetColumnCount;
    property Count:Integer read GetCount;
  end;

implementation

{$R *.DFM}

uses
  Printers, frxPrinter, frxSearchDialog, frxUtils, frxRes, frxDsgnIntf,
  frxPreviewPageSettings, frxDMPClass;

type
  THackControl = class(TWinControl);

{ search given string in a metafile }

var
  TextToFind:String;
  TextFound:Boolean;
  TextBounds:TRect;
  RecordNo:Integer;
  LastFoundRecord:Integer;
  CaseSensitive:Boolean;

function EnumEMFRecordsProc(DC:HDC; HandleTable:PHandleTable;
  EMFRecord:PEnhMetaRecord; nObj:Integer; OptData:Pointer):Bool; stdcall;
var
  Typ:Byte;
  s:String;
  t:TEMRExtTextOut;
  Found:Boolean;
begin
  Result:= True;
  Typ:= EMFRecord^.iType;
  if Typ in [83, 84] then
  begin
    t:= PEMRExtTextOut(EMFRecord)^;
    s:= WideCharLenToString(PWideChar(PChar(EMFRecord)+t.EMRText.offString),
      t.EMRText.nChars);
    if CaseSensitive then
      Found:= Pos(TextToFind, s)<>0 else
      Found:= Pos(AnsiUpperCase(TextToFind), AnsiUpperCase(s))<>0;
    if Found and (RecordNo > LastFoundRecord) then
    begin
      TextFound:= True;
      TextBounds:= t.rclBounds;
      LastFoundRecord:= RecordNo;
      Result:= False;
    end;
  end;
  Inc(RecordNo);
end;

{ TfrxPageList }

constructor TfrxPageList.Create;
begin
  FList:= TList.Create;
  FColumnCount:= 1;
end;

destructor TfrxPageList.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

procedure TfrxPageList.Clear;
var
  i:Integer;
begin
  for i:= 0 to FList.Count-1 do
    TObject(FList[i]).Free;
  FList.Clear;
  FMaxWidth:= 0;
end;

function TfrxPageList.GetCount:Integer;
begin
  Result:= FList.Count;
end;

function TfrxPageList.GetItems(Index:Integer):TfrxPageItem;
begin
  Result:= FList[Index];
end;

procedure TfrxPageList.SetColumnCount(Value:Integer);
begin
  FColumnCount:= Value;
  Clear;
end;

procedure TfrxPageList.AddPage(AWidth, AHeight:Integer);
var
  i, FirstColumnIndex, ColumnWidth, MaxHeight:Integer;
  Item, LastItem:TfrxPageItem;
begin
  Item:= TfrxPageItem.Create;
  Item.Width:= AWidth;
  Item.Height:= AHeight;

  if Count > 0 then
  begin
    LastItem:= Items[Count-1];

    if LastItem.Column >= ColumnCount-1 then
    begin
      FirstColumnIndex:= Count-1;
      while Items[FirstColumnIndex].Column > 0 do
        Dec(FirstColumnIndex);

      MaxHeight:= 0;
      for i:= FirstColumnIndex to Count-1 do
        if Items[i].Height > MaxHeight then
          MaxHeight:= Items[i].Height;

      Item.Column:= 0;
      Item.Offset:= LastItem.Offset+MaxHeight+10;
    end
    else
    begin
      Item.Column:= LastItem.Column+1;
      Item.Offset:= LastItem.Offset;
    end;
  end
  else
  begin
    Item.Column:= 0;
    Item.Offset:= 10;
  end;

  FList.Add(Item);

  FirstColumnIndex:= Count-1;
  while Items[FirstColumnIndex].Column > 0 do
    Dec(FirstColumnIndex);

  ColumnWidth:= 0;
  for i:= FirstColumnIndex to Count-1 do
    Inc(ColumnWidth, Items[i].Width+10);

  if FMaxWidth < ColumnWidth then
    FMaxWidth:= ColumnWidth;
end;

function TfrxPageList.FindPage(Offset:Integer; Scale:Extended;
  Exact:Boolean = False):Integer;
var
  i, i0, i1, c, add:Integer;
begin
  i0:= 0;
  i1:= Count-1;

  while i0 <= i1 do
  begin
    i:= (i0+i1) div 2;
    if Exact then
      add:= 0 else
      add:= Round(Scale * Items[i].Height / 5);
    if Items[i].Offset * Scale <= Offset+add then
      c:=-1 else
      c:= 1;

    if c < 0 then
      i0:= i+1 else
      i1:= i-1;
  end;

  Result:= i1;
end;

function TfrxPageList.GetPageBounds(Index, ClientWidth:Integer;
  Scale:Extended):TRect;
var
  i, FirstColumnIndex, ItemOffs, ColumnOffs, ColumnWidth:Integer;
  Item:TfrxPageItem;
begin
  if (Index >= Count) or (Index < 0) then
  begin
    if 794 * Scale > ClientWidth then
      ColumnOffs:= 10 else
      ColumnOffs:= Round((ClientWidth-794 * Scale) / 2);
    Result.Left:= ColumnOffs;
    Result.Top:= Round(10 * Scale);
    Result.Right:= Result.Left+Round(794 * Scale);
    Result.Bottom:= Result.Top+Round(1123 * Scale);
    Exit;
  end;

  Item:= Items[Index];
  if ColumnCount > 1 then
  begin
    ItemOffs:= 0;
    FirstColumnIndex:= Index;
    while Items[FirstColumnIndex].Column > 0 do
    begin
      Dec(FirstColumnIndex);
      Inc(ItemOffs, Items[FirstColumnIndex].Width+10);
    end;

    i:= FirstColumnIndex;
    ColumnWidth:= Items[i].Width;
    Inc(i);
    while (i < Count) and (Items[i].Column > 0) do
    begin
      Inc(ColumnWidth, Items[i].Width+10);
      Inc(i);
    end;
  end
  else
  begin
    ItemOffs:= 0;
    ColumnWidth:= Item.Width;
  end;

  if ColumnWidth * Scale > ClientWidth then
    ColumnOffs:= 10 else
    ColumnOffs:= Round((ClientWidth-ColumnWidth * Scale) / 2);
  Result.Left:= ColumnOffs+Round(ItemOffs * Scale);
  Result.Top:= Round(Item.Offset * Scale);
  Result.Right:= Result.Left+Round(Item.Width * Scale);
  Result.Bottom:= Result.Top+Round(Item.Height * Scale);
end;

function TfrxPageList.GetMaxBounds(ClientWidth:Integer;
  Scale:Extended):TPoint;
begin
  if Count = 0 then
  begin
    Result:= Point(0, 0);
    Exit;
  end;

  Result.X:= Round(FMaxWidth * Scale);
  Result.Y:= GetPageBounds(Count-1, ClientWidth, Scale).Bottom;
end;

{ TfrxPreviewWorkspace }

constructor TfrxPreviewWorkspace.Create(AOwner:TComponent);
begin
  inherited;
  FPreview:= TfrxPreview(AOwner);
  FPageList:= TfrxPageList.Create;
  Color:= clGray;
  LargeChange:= 300;
  SmallChange:= 8;
end;

destructor TfrxPreviewWorkspace.Destroy;
begin
  if FEMFImage<>nil then
    FEMFImage.Free;
  FPageList.Free;
  inherited;
end;

procedure TfrxPreviewWorkspace.OnHScrollChange(Sender:TObject);
var
  pp:Integer;
  r:TRect;
begin
  pp:= FOffset.X-HorzPosition;
  FOffset.X:= HorzPosition;
  r:= Rect(0, 0, ClientWidth, ClientHeight);
  ScrollWindowEx(Handle, pp, 0, @r, @r, 0, nil, SW_ERASE+SW_INVALIDATE);
end;

procedure TfrxPreviewWorkspace.OnVScrollChange(Sender:TObject);
var
  i, pp:Integer;
  r:TRect;
begin
  pp:= FOffset.Y-VertPosition;
  FOffset.Y:= VertPosition;
  r:= Rect(0, 0, ClientWidth, ClientHeight);
  ScrollWindowEx(Handle, 0, pp, @r, @r, 0, nil, SW_ERASE+SW_INVALIDATE);

  i:= FPageList.FindPage(FOffset.Y, FPreview.Zoom);
  FDisableUpdate:= True;
  FPreview.PageNo:= i+1;
  FDisableUpdate:= False;
end;

procedure TfrxPreviewWorkspace.Paint;
var
  i, n:Integer;
  PageBounds:TRect;
  h:HRGN;

  function PageVisible:Boolean;
  begin
    if (PageBounds.Top > ClientHeight) or (PageBounds.Bottom < 0) then
      Result:= False else
      Result:= RectVisible(Canvas.Handle, PageBounds);
  end;

  procedure DrawPage(Index:Integer);
  var
    i:Integer;
    TxtBounds:TRect;
  begin
    with Canvas, PageBounds do
    begin
      Pen.Color:= clBlack;
      Pen.Width:= 1;
      Pen.Mode:= pmCopy;
      Pen.Style:= psSolid;
      Brush.Color:= clWhite;
      Dec(Bottom);
      Rectangle(Left, Top, Right, Bottom);
      Polyline([Point(Left+1, Bottom),
                Point(Right, Bottom),
                Point(Right, Top+1)]);
    end;

    PreviewPages.DrawPage(Index, Canvas, FPreview.Zoom, FPreview.Zoom,
      PageBounds.Left, PageBounds.Top);

    { highlight text found }
    TxtBounds:= Rect(Round(TextBounds.Left * FPreview.Zoom),
      Round(TextBounds.Top * FPreview.Zoom),
      Round(TextBounds.Right * FPreview.Zoom),
      Round(TextBounds.Bottom * FPreview.Zoom));
    if TextFound and (Index = FLastFoundPage) then
      with Canvas, TxtBounds do
      begin
        Pen.Width:= 1;
        Pen.Mode:= pmXor;
        Pen.Color:= clWhite;
        for i:= 0 to Bottom-Top do
        begin
          MoveTo(PageBounds.Left+Left-1, PageBounds.Top+Top+i);
          LineTo(PageBounds.Left+Right+1, PageBounds.Top+Top+i);
        end;
        Pen.Mode:= pmCopy;
      end;
  end;

begin
  { draw an empty page area to prevent flickering }
  if FPreview.FLocked or (FPageList.Count = 0) then
  begin
    Canvas.Brush.Color:= clGray;
    Canvas.FillRect(Rect(0, 0, ClientWidth, ClientHeight));
    Exit;

    if FPageList.Count = 0 then
      n:=-1 else
      n:= 0;
    PageBounds:= FPageList.GetPageBounds(n, Width, FPreview.Zoom);
    OffsetRect(PageBounds,-FOffset.X,-FOffset.Y);
    h:= CreateRectRgn(0, 0, ClientWidth, ClientHeight);

    with Canvas, PageBounds do
    begin
      GetClipRgn(Handle, h);
      ExcludeClipRect(Handle, Left+1, Top+1, Right-1, Bottom-1);
      Brush.Color:= clGray;
      FillRect(Rect(0, 0, ClientWidth, ClientHeight));

      SelectClipRgn(Handle, h);
      Pen.Color:= clBlack;
      Pen.Width:= 1;
      Pen.Mode:= pmCopy;
      Pen.Style:= psSolid;
      Brush.Color:= clWhite;
      Rectangle(Left, Top, Right, Bottom);
      Polyline([Point(Left+1, Bottom),
                Point(Right, Bottom),
                Point(Right, Top+1)]);
    end;

    DeleteObject(h);
    Exit;
  end;

  h:= CreateRectRgn(0, 0, ClientWidth, ClientHeight);
  GetClipRgn(Canvas.Handle, h);

  { index of first visible page }
  n:= FPageList.FindPage(FOffset.Y, FPreview.Zoom);

  { exclude page areas to prevent flickering }
  for i:= n-20 to n+20 do
  begin
    if i < 0 then continue;
    if i >= FPageList.Count then break;

    PageBounds:= FPageList.GetPageBounds(i, Width, FPreview.Zoom);
    OffsetRect(PageBounds,-FOffset.X,-FOffset.Y);
    Inc(PageBounds.Bottom);
    if PageVisible then
      with PageBounds do
        ExcludeClipRect(Canvas.Handle, Left+1, Top+1, Right-1, Bottom-1);
  end;

  { now draw background on the non-clipped area}
  with Canvas do
  begin
    Brush.Color:= clGray;
    Brush.Style:= bsSolid;
    FillRect(Rect(0, 0, ClientWidth, ClientHeight));
  end;

  { restore clipregion }
  SelectClipRgn(Canvas.Handle, h);

  { draw visible pages }
  for i:= n-20 to n+20 do
  begin
    if i < 0 then continue;
    if i >= FPageList.Count then break;

    PageBounds:= FPageList.GetPageBounds(i, Width, FPreview.Zoom);
    OffsetRect(PageBounds,-FOffset.X,-FOffset.Y);
    Inc(PageBounds.Bottom);
    if PageVisible then
      DrawPage(i);
  end;

  DeleteObject(h);
end;

procedure TfrxPreviewWorkspace.MouseDown(Button:TMouseButton;
  Shift:TShiftState; X, Y:Integer);
begin
  if (FPageList.Count = 0) or FPreview.FLocked then Exit;

  if Button = mbLeft then
  begin
    FDown:= True;
    FLastPoint.X:= X;
    FLastPoint.Y:= Y;
  end;
end;

procedure TfrxPreviewWorkspace.MouseMove(Shift:TShiftState; X, Y:Integer);
var
  PageNo:Integer;
  PageBounds:TRect;
  Cur:TCursor;
begin
  if (FPageList.Count = 0) or FPreview.FLocked then Exit;

  if FDown then
  begin
    if FPreview.Tool = ptHand then
    begin
      HorzPosition:= HorzPosition-(X-FLastPoint.X);
      VertPosition:= VertPosition-(Y-FLastPoint.Y);
      FLastPoint.X:= X;
      FLastPoint.Y:= Y;
    end
  end
  else
  begin
    PageNo:= FPageList.FindPage(FOffset.Y+Y, FPreview.Zoom, True);
    PageBounds:= FPageList.GetPageBounds(PageNo, ClientWidth, FPreview.Zoom);
    Cur:= FDefaultCursor;
    PreviewPages.ObjectOver(PageNo, X, Y, mbLeft, [], FPreview.Zoom,
      PageBounds.Left-FOffset.X, PageBounds.Top-FOffset.Y, False, Cur);
    Cursor:= Cur;
  end;
end;

procedure TfrxPreviewWorkspace.MouseUp(Button:TMouseButton; Shift:TShiftState;
  X, Y:Integer);
var
  PageNo:Integer;
  PageBounds:TRect;
  Cur:TCursor;
begin
  if Assigned(FPreview.OnClick) then
    FPreview.OnClick(FPreview);
  if (FPageList.Count = 0) or FPreview.FLocked then Exit;

  FDown:= False;
  if FPreview.Tool = ptZoom then
  begin
    if Button = mbLeft then
      FPreview.Zoom:= FPreview.Zoom+0.25;
    if Button = mbRight then
      FPreview.Zoom:= FPreview.Zoom-0.25;
  end
  else
  begin
    PageNo:= FPageList.FindPage(FOffset.Y+Y, FPreview.Zoom, True);
    PageBounds:= FPageList.GetPageBounds(PageNo, ClientWidth, FPreview.Zoom);
    PreviewPages.ObjectOver(PageNo, X, Y, Button, Shift, FPreview.Zoom,
      PageBounds.Left-FOffset.X, PageBounds.Top-FOffset.Y, True, Cur);
  end;
end;

function TfrxPreviewWorkspace.PreviewPages:TfrxCustomPreviewPages;
begin
  Result:= FPreview.PreviewPages;
end;

procedure TfrxPreviewWorkspace.FindText;
var
  EMFCanvas:TMetafileCanvas;
  PageBounds, TxtBounds:TRect;
begin
  TextFound:= False;

  while FLastFoundPage < FPageList.Count do
  begin
    if (FEMFImage = nil) or (FEMFImagePage<>FLastFoundPage) then
    begin
      if FEMFImage<>nil then
        FEMFImage.Free;
      FEMFImage:= TMetafile.Create;
      EMFCanvas:= TMetafileCanvas.Create(FEMFImage, 0);
      PreviewPages.DrawPage(FLastFoundPage, EMFCanvas, 1, 1, 0, 0);
      EMFCanvas.Free;
    end;

    FEMFImagePage:= FLastFoundPage;
    RecordNo:= 0;
    EnumEnhMetafile(0, FEMFImage.Handle, @EnumEMFRecordsProc, nil, Rect(0, 0, 0, 0));

    if TextFound then
    begin
      PageBounds:= FPageList.GetPageBounds(FLastFoundPage, ClientWidth, FPreview.Zoom);
      TxtBounds:= Rect(Round(TextBounds.Left * FPreview.Zoom),
        Round(TextBounds.Top * FPreview.Zoom),
        Round(TextBounds.Right * FPreview.Zoom),
        Round(TextBounds.Bottom * FPreview.Zoom));

      if (PageBounds.Top+TxtBounds.Top < FOffset.Y) or
        (PageBounds.Top+TxtBounds.Bottom > FOffset.Y+ClientHeight) then
        VertPosition:= PageBounds.Top+TxtBounds.Bottom-ClientHeight+20;
      if (PageBounds.Left+TxtBounds.Left < FOffset.X) or
        (PageBounds.Left+TxtBounds.Right > FOffset.X+ClientWidth) then
        HorzPosition:= PageBounds.Left+TxtBounds.Right-ClientWidth+20;
      Repaint;
      break;
    end;

    LastFoundRecord:=-1;
    Inc(FLastFoundPage);
  end;
end;

procedure TfrxPreviewWorkspace.HandleKey(Key:Word; Shift:TShiftState);
begin
  if Key = vk_Up then
    VertPosition:= VertPosition-8
  else if Key = vk_Down then
    VertPosition:= VertPosition+8
  else if Key = vk_Left then
    HorzPosition:= HorzPosition-8
  else if Key = vk_Right then
    HorzPosition:= HorzPosition+8
  else if Key = vk_Prior then
    if ssCtrl in Shift then
      FPreview.PageNo:= FPreview.PageNo-1
    else
      VertPosition:= VertPosition-300
  else if Key = vk_Next then
    if ssCtrl in Shift then
      FPreview.PageNo:= FPreview.PageNo+1
    else
      VertPosition:= VertPosition+300
  else if Key = vk_Home then
    FPreview.PageNo:= 1
  else if Key = vk_End then
    FPreview.PageNo:= FPreview.PageCount
end;

procedure TfrxPreviewWorkspace.Resize;
begin
  inherited;
  HorzPage:= ClientWidth;
  VertPage:= ClientHeight;
end;

procedure TfrxPreviewWorkspace.SetToPageNo(PageNo:Integer);
begin
  if FDisableUpdate then Exit;
  VertPosition:=
    FPageList.GetPageBounds(PageNo-1, ClientWidth, FPreview.Zoom).Top-10;
end;

procedure TfrxPreviewWorkspace.UpdateScrollBars;
var
  MaxSize:TPoint;
begin
  MaxSize:= FPageList.GetMaxBounds(ClientWidth, FPreview.Zoom);
  HorzRange:= MaxSize.X+10;
  VertRange:= MaxSize.Y+10;
end;

{ TfrxPreview }

constructor TfrxPreview.Create(AOwner:TComponent);
begin
  inherited;

  FOutline:= TTreeView.Create(Self);
  FOutline.Parent:= Self;
  FOutline.Width:= 120;
  FOutline.Align:= alLeft;
  FOutline.ReadOnly:= True;
  FOutline.HideSelection:= False;
  FOutline.OnClick:= TreeClick;

  FSplitter:= TSplitter.Create(Self);
  FSplitter.Parent:= Self;
  FSplitter.SetBounds(1000, 0, 2, 0);
  FSplitter.MinSize:= 1;

  FWorkspace:= TfrxPreviewWorkspace.Create(Self);
  FWorkspace.Parent:= Self;
  FWorkspace.Align:= alClient;

  FMessagePanel:= TPanel.Create(Self);
  FMessagePanel.Parent:= Self;
  FMessagePanel.Visible:= False;
  FMessagePanel.SetBounds(0, 0, 0, 0);

  FMessageLabel:= TLabel.Create(FMessagePanel);
  FMessageLabel.Parent:= FMessagePanel;
  FMessageLabel.AutoSize:= False;
  FMessageLabel.Alignment:= taCenter;
  FMessageLabel.SetBounds(4, 20, 255, 20);

  FCancelButton:= TButton.Create(FMessagePanel);
  FCancelButton.Parent:= FMessagePanel;
  FCancelButton.SetBounds(92, 44, 75, 25);
  FCancelButton.Caption:= frxResources.Get('clCancel');
  FCancelButton.Visible:= False;
  FCancelButton.OnClick:= OnCancel;

  FPageNo:= 1;
  FScrollBars:= ssBoth;
  FZoom:= 1;
  FZoomMode:= zmDefault;

  Tool:= ptHand;

  Width:= 100;
  Height:= 100;
end;

destructor TfrxPreview.Destroy;
begin
  if Report<>nil then
    Report.Preview:= nil;
  inherited;
end;

procedure TfrxPreview.Notification(AComponent:TComponent; Operation:TOperation);
begin
  inherited Notification(AComponent, Operation);

  if Operation = opRemove then
    if AComponent = Report then
    begin
      Clear;
      Report:= nil;
      PreviewPages:= nil;
    end;
end;

procedure TfrxPreview.Init;
begin
  TextFound:= False;
  FWorkspace.FLastFoundPage:= 0;
  LastFoundRecord:=-1;
  FAllowF3:= False;

  FWorkspace.DoubleBuffered:= Report.PreviewOptions.DoubleBuffered;
  UpdatePages;
  UpdateZoom;
  UpdateOutline;
  First;
end;

procedure TfrxPreview.WMEraseBackground(var Message:TMessage);
begin
end;

procedure TfrxPreview.WMGetDlgCode(var Message:TWMGetDlgCode);
begin
  Message.Result:= DLGC_WANTARROWS;
end;

procedure TfrxPreview.KeyDown(var Key:Word; Shift:TShiftState);
begin
  inherited;
  FWorkspace.HandleKey(Key, Shift);
  if (Key = vk_F3) and (pbFind in Report.PreviewOptions.Buttons) then
    FindNext
  else if ssCtrl in Shift then
  begin
    if (Key = Ord('P')) and (pbPrint in Report.PreviewOptions.Buttons) then
      Print
    else if (Key = Ord('S')) and (pbSave in Report.PreviewOptions.Buttons) then
      SaveToFile
    else if (Key = Ord('F')) and (pbFind in Report.PreviewOptions.Buttons) then
      Find
  end;
end;

procedure TfrxPreview.Resize;
begin
  inherited;
  if PreviewPages<>nil then
    UpdateZoom;
end;

procedure TfrxPreview.SetZoom(const Value:Extended);
begin
  FZoom:= Value;
  if FZoom < 0.25 then
    FZoom:= 0.25;

  if FZoomMode = zmManyPages then
    ZoomMode:= zmDefault;

  FZoomMode:= zmDefault;
  UpdateZoom;
end;

procedure TfrxPreview.SetZoomMode(const Value:TfrxZoomMode);
begin
  FZoomMode:= Value;
  UpdatePages;
  UpdateZoom;
end;

function TfrxPreview.GetOutlineVisible:Boolean;
begin
  Result:= FOutline.Visible;
end;

procedure TfrxPreview.SetOutlineVisible(const Value:Boolean);
begin
  FOutline.Visible:= Value;
  FSplitter.Visible:= Value;
  FSplitter.SetBounds(1000, 0, 2, 0);
end;

procedure TfrxPreview.SetTool(const Value:TfrxPreviewTool);
var
  c:TCursor;
begin
  FTool:= Value;

  if FTool = ptHand then
    c:= crHand
  else if FTool = ptZoom then
    c:= crZoom else
    c:= crDefault;

  FWorkspace.FDefaultCursor:= c;
  FWorkspace.Cursor:= c;
end;

procedure TfrxPreview.SetPageNo(const Value:Integer);
begin
  FPageNo:= Value;
  if FPageNo < 1 then
    FPageNo:= 1;
  if FPageNo > PageCount then
    FPageNo:= PageCount;

  FWorkspace.SetToPageNo(FPageNo);
  UpdatePageNumbers;
end;

procedure TfrxPreview.UpdatePageNumbers;
begin
  if Assigned(FOnPageChanged) then
    FOnPageChanged(Self, FPageNo);
end;

function TfrxPreview.GetPageCount:Integer;
begin
  if PreviewPages<>nil then
    Result:= PreviewPages.Count else
    Result:= 0;
end;

procedure TfrxPreview.ShowMessage(const s:String);
begin
  FMessagePanel.SetBounds((Width-260) div 2, (Height-75) div 3, 260, 75);
  FMessageLabel.Caption:= s;
  FMessagePanel.Show;
  FMessagePanel.Update;
end;

procedure TfrxPreview.HideMessage;
begin
  FMessagePanel.Hide;
  FCancelButton.Hide;
end;

procedure TfrxPreview.First;
begin
  PageNo:= 1;
end;

procedure TfrxPreview.Next;
begin
  PageNo:= PageNo+1;
end;

procedure TfrxPreview.Prior;
begin
  PageNo:= PageNo-1;
end;

procedure TfrxPreview.Last;
begin
  PageNo:= PageCount;
end;

procedure TfrxPreview.Print;
begin
  if FRunning then Exit;
  try
    PreviewPages.CurPreviewPage:= PageNo;
    PreviewPages.Print;
  finally
    Unlock;
  end;
end;

procedure TfrxPreview.SaveToFile;
var
  SaveDlg:TSaveDialog;
begin
  if FRunning then Exit;
  SaveDlg:= TSaveDialog.Create(Application);
  try
    SaveDlg.Filter:= frxResources.Get('clFP3files')+' (*.fp3)|*.fp3';
    if SaveDlg.Execute then
    begin
      FWorkspace.Repaint;
      SaveToFile(ChangeFileExt(SaveDlg.FileName, '.fp3'));
    end;
  finally
    SaveDlg.Free;
  end;
end;

procedure TfrxPreview.SaveToFile(FileName:String);
begin
  if FRunning then Exit;
  try
    Lock;
    ShowMessage(frxResources.Get('clSaving'));
    PreviewPages.SaveToFile(FileName);
  finally
    Unlock;
  end;
end;

procedure TfrxPreview.LoadFromFile;
var
  OpenDlg:TOpenDialog;
begin
  if FRunning then Exit;
  OpenDlg:= TOpenDialog.Create(nil);
  try
    OpenDlg.Options:= [ofHideReadOnly];
    OpenDlg.Filter:= frxResources.Get('clFP3files')+' (*.fp3)|*.fp3';
    if OpenDlg.Execute then
    begin
      FWorkspace.Repaint;
      LoadFromFile(OpenDlg.FileName);
    end;
  finally
    OpenDlg.Free;
  end;
end;

procedure TfrxPreview.LoadFromFile(FileName:String);
begin
  if FRunning then Exit;
  try
    Lock;
    ShowMessage(frxResources.Get('clLoading'));
    PreviewPages.LoadFromFile(FileName);
    OutlineVisible:= Report.PreviewOptions.OutlineVisible;
  finally
    UpdateOutline;
    UpdatePages;
    Unlock;
    PageNo:= 1;
  end;
end;

procedure TfrxPreview.Export(Filter:TfrxCustomExportFilter);
begin
  if FRunning then Exit;
  try
    PreviewPages.CurPreviewPage:= PageNo;
    if Report.DotMatrixReport and (frxDotMatrixExport<>nil) and
      (Filter.ClassName = 'TfrxTextExport') then
      Filter:= frxDotMatrixExport;
    PreviewPages.Export(Filter);
  finally
    Unlock;
  end;
end;

procedure TfrxPreview.PageSetupDlg;
var
  APage:TfrxReportPage;

  procedure UpdateReport;
  var
    i:Integer;
  begin
    for i:= 0 to Report.PagesCount-1 do
      if Report.Pages[i] is TfrxReportPage then
        with TfrxReportPage(Report.Pages[i]) do
        begin
          Orientation:= APage.Orientation;
          PaperWidth:= APage.PaperWidth;
          PaperHeight:= APage.PaperHeight;
          PaperSize:= APage.PaperSize;

          LeftMargin:= APage.LeftMargin;
          RightMargin:= APage.RightMargin;
          TopMargin:= APage.TopMargin;
          BottomMargin:= APage.BottomMargin;
        end;
  end;

begin
  if FRunning then Exit;
  APage:= PreviewPages.Page[PageNo-1];

  with TfrxPageSettingsForm.Create(Application) do
  begin
    Page:= APage;
    Report:= Self.Report;
    if ShowModal = mrOk then
    begin
      if NeedRebuild then
      begin
        UpdateReport;
        Self.Report.PrepareReport;
      end
      else
      begin
        try
          Lock;
          PreviewPages.ModifyPage(PageNo-1, Page);
          UpdatePages;
        finally
          Unlock;
        end;
      end;
    end;
    Free;
  end;
end;

procedure TfrxPreview.Find;
begin
  with TfrxSearchDialog.Create(Application) do
  begin
    if ShowModal = mrOk then
    begin
      TextToFind:= TextE.Text;
      CaseSensitive:= CaseCB.Checked;
      if TopCB.Checked then
        FWorkspace.FLastFoundPage:= 0 else
        FWorkspace.FLastFoundPage:= PageNo-1;
      LastFoundRecord:=-1;
      FWorkspace.FindText;
    end;
    Free;
  end;

  FAllowF3:= True;
end;

procedure TfrxPreview.FindNext;
begin
  if FAllowF3 then
    FWorkspace.FindText;
end;

procedure TfrxPreview.Edit;
var
  r:TfrxReport;
  p:TfrxReportPage;
  SourcePage:TfrxPage;

  procedure RemoveBands;
  var
    i:Integer;
    l:TList;
    c:TfrxComponent;
  begin
    l:= p.AllObjects;

    for i:= 0 to l.Count-1 do
    begin
      c:= l[i];
      if c is TfrxView then
      begin
        TfrxView(c).DataField:= '';
        TfrxView(c).DataSet:= nil;
      end;

      if c.Parent<>p then
      begin
        c.Left:= c.AbsLeft;
        c.Top:= c.AbsTop;
        c.ParentFont:= False;
        c.Parent:= p;
      end;
    end;

    for i:= 0 to l.Count-1 do
    begin
      c:= l[i];
      if c is TfrxBand then
        c.Free;
    end;
  end;

begin
  SourcePage:= PreviewPages.Page[PageNo-1];
  if SourcePage is TfrxDMPPage then
    p:= TfrxDMPPage.Create(nil) else
    p:= TfrxReportPage.Create(nil);
  r:= nil;
  try
    p.AssignAll(SourcePage);
    RemoveBands;
    r:= TfrxReport.Create(nil);
    p.Parent:= r;
    if r.DesignPreviewPage then
      try
        Lock;
        PreviewPages.ModifyPage(PageNo-1, TfrxReportPage(r.Pages[0]));
        UpdatePages;
      finally
        Unlock;
      end;
  finally
    r.Free;
  end;
end;

procedure TfrxPreview.EditTemplate;
var
  r:TfrxReport;
  i:Integer;
begin
  r:= TfrxReport.Create(nil);
  try
    for i:= 0 to TfrxPreviewPages(PreviewPages).SourcePages.Count-1 do
      r.Objects.Add(TfrxPreviewPages(PreviewPages).SourcePages[i]);
    r.DesignReport;
  finally
    r.Objects.Clear;
    r.Free;
  end;
end;

procedure TfrxPreview.Clear;
begin
  if FRunning then Exit;
  Lock;
  try
    PreviewPages.Clear;
    UpdatePages;
  finally
    Unlock;
  end;

  UpdateOutline;
  PageNo:= 0;
  with FWorkspace do
  begin
    HorzRange:= 0;
    VertRange:= 0;
  end;
end;

procedure TfrxPreview.AddPage;
begin
  if FRunning then Exit;
  PreviewPages.AddEmptyPage(PageNo-1);
  UpdatePages;
  UpdateZoom;
  PageNo:= PageNo;
end;

procedure TfrxPreview.DeletePage;
begin
  if FRunning then Exit;
  PreviewPages.DeletePage(PageNo-1);
  if PageNo >= PageCount then
    PageNo:= PageNo-1;
  UpdatePages;
  UpdatePageNumbers;
  UpdateZoom;
end;

procedure TfrxPreview.Lock;
begin
  FLocked:= True;
end;

procedure TfrxPreview.Unlock;
begin
  HideMessage;
  FLocked:= False;
  FPageNo:= 1;
  UpdateZoom;
  FWorkspace.Repaint;
end;

procedure TfrxPreview.SetPosition(PageN, Top:Integer);
var
  Pos:Integer;
  Page:TfrxReportPage;
begin
  if PageN > PageCount then
    PageN:= PageCount;
  if PageN <= 0 then
    PageN:= 1;

  Page:= PreviewPages.Page[PageN-1];
  if Top = 0 then
    Pos:= 0 else
    Pos:= Round((Top+Page.TopMargin * fr01cm) * Zoom);

  FWorkspace.VertPosition:=
    FWorkspace.FPageList.GetPageBounds(PageN-1, FWorkspace.ClientWidth, FZoom).Top-10+Pos;
end;

procedure TfrxPreview.UpdateZoom;
var
  PageSize:TPoint;
begin
  if FLocked or (PageCount = 0) then Exit;
  PageSize:= PreviewPages.PageSize[PageNo-1];

  case FZoomMode of
    zmWholePage:
      FZoom:= (FWorkspace.ClientHeight-20) / PageSize.Y;
    zmPageWidth:
      FZoom:= (FWorkspace.ClientWidth-20) / PageSize.X;
    zmManyPages:
      FZoom:= (FWorkspace.ClientWidth-32) / (PageSize.X * 2);
  end;

  FWorkspace.UpdateScrollBars;
  FWorkspace.Repaint;
  if Owner is TfrxPreviewForm then
    TfrxPreviewForm(Owner).UpdateZoom;
end;

procedure TfrxPreview.UpdateOutline;
var
  Outline:TfrxCustomOutline;

  procedure DoUpdate(RootNode:TTreeNode);
  var
    i, n:Integer;
    Node:TTreeNode;
    Page, Top:Integer;
    Text:String;
  begin
    n:= Outline.Count;
    for i:= 0 to n-1 do
    begin
      Outline.GetItem(i, Text, Page, Top);
      Node:= FOutline.Items.AddChild(RootNode, Text);
      Node.Data:= Pointer(Page+1+Top div 2 * $100000);

      Outline.LevelDown(i);
      DoUpdate(Node);
      Outline.LevelUp;
    end;
  end;

begin
  FOutline.Items.BeginUpdate;
  FOutline.Items.Clear;
  Outline:= PreviewPages.Outline;
  Outline.LevelRoot;
  DoUpdate(nil);
  if Report.PreviewOptions.OutlineExpand then
    FOutline.FullExpand;
  if FOutline.Items.Count > 0 then
    FOutline.TopItem:= FOutline.Items[0];
  FOutline.Items.EndUpdate;
end;

procedure TfrxPreview.UpdatePages;
var
  i:Integer;
  PageSize:TPoint;
begin
  { clear find settings }
  FAllowF3:= False;
  FWorkspace.FEMFImagePage:=-1;

  FWorkspace.FPageList.Clear;
  if PreviewPages = nil then Exit;

  if FZoomMode = zmManyPages then
    FWorkspace.FPageList.ColumnCount:= 2 else
    FWorkspace.FPageList.ColumnCount:= 1;

  for i:= 0 to PageCount-1 do
  begin
    PageSize:= PreviewPages.PageSize[i];
    FWorkspace.FPageList.AddPage(PageSize.X, PageSize.Y);
  end;
end;

procedure TfrxPreview.TreeClick(Sender:TObject);
var
  Node:TTreeNode;
  PageN, Top:Integer;
begin
  Node:= FOutline.Selected;
  if Node = nil then Exit;

  PageN:= Integer(Node.Data) mod $100000;
  Top:= Integer(Node.Data) div $100000 * 2;
  SetPosition(PageN, Top);
  SetFocus;
end;

procedure TfrxPreview.InternalOnProgressStart(Sender:TfrxReport;
  ProgressType:TfrxProgressType; Progress:Integer);
begin
  Clear;
  FRunning:= True;
  if Owner is TfrxPreviewForm then
    TfrxPreviewForm(Owner).UpdateControls;
end;

procedure TfrxPreview.InternalOnProgress(Sender:TfrxReport;
  ProgressType:TfrxProgressType; Progress:Integer);
var
  PageSize:TPoint;
begin
  if Report.Engine.FinalPass then
  begin
    PageSize:= Report.PreviewPages.PageSize[Progress];
    FWorkspace.FPageList.AddPage(PageSize.X, PageSize.Y);
  end;

  if Progress = 0 then
  begin
    FOutline.Items.Clear;
    PageNo:= 1;
    UpdateZoom;
    if Owner is TfrxPreviewForm then
      TfrxPreviewForm(Owner).CancelB.Caption:= frxResources.Get('clCancel');
    FTick:= GetTickCount;
  end
  else if Progress = 1 then
  begin
    FTick:= GetTickCount-FTick;
    if FTick < 5 then
      FTick:= 50
    else if FTick < 10 then
      FTick:= 20
    else
      FTick:= 5;
    PageNo:= 1;
    UpdateZoom;
  end
  else if Progress mod Integer(FTick) = 0 then
  begin
    UpdatePageNumbers;
    FWorkspace.UpdateScrollBars;
  end;

  Application.ProcessMessages;
end;

procedure TfrxPreview.InternalOnProgressStop(Sender:TfrxReport;
  ProgressType:TfrxProgressType; Progress:Integer);
begin
  FRunning:= False;
  UpdatePageNumbers;
  FWorkspace.UpdateScrollBars;
  UpdateZoom;
  UpdateOutline;
  if Owner is TfrxPreviewForm then
  begin
    TfrxPreviewForm(Owner).CancelB.Caption:= frxResources.Get('clClose');
    TfrxPreviewForm(Owner).StatusBar.Panels[1].Text:= '';
    TfrxPreviewForm(Owner).UpdateControls;
  end;
end;

procedure TfrxPreview.OnCancel(Sender:TObject);
begin
  Report.Terminated:= True;
end;

procedure TfrxPreview.Cancel;
begin
  if FRunning then
    OnCancel(Self);
end;

procedure TfrxPreview.MouseWheelScroll(Delta:Integer; Horz:Boolean = False;
  Zoom:Boolean = False);
begin
  if Delta<>0 then
    if Zoom then
    begin
      FZoom:= FZoom+Round(Delta / Abs(Delta)) / 10;
      if FZoom < 0.3 then
        FZoom:= 0.3;
      SetZoom(FZoom);
    end
    else
    begin
      with FWorkspace do
      begin
        if Horz then
          HorzPosition:= HorzPosition+Round(-Delta / Abs(Delta)) * 20
        else
          VertPosition:= VertPosition+Round(-Delta / Abs(Delta)) * 20;
      end;
    end;
end;

{ TfrxPreviewForm }

procedure TfrxPreviewForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
  ZoomCB.Items.Clear;
  ZoomCB.Items.Add('25%');
  ZoomCB.Items.Add('50%');
  ZoomCB.Items.Add('75%');
  ZoomCB.Items.Add('100%');
  ZoomCB.Items.Add('150%');
  ZoomCB.Items.Add('200%');
  ZoomCB.Items.Add(frxResources.Get('zmPageWidth'));
  ZoomCB.Items.Add(frxResources.Get('zmWholePage'));
  frxAssignImages(Image1.Picture.Bitmap, 16, 16, MainImages);
  Image1.Free;

  FPreview:= TfrxPreview.Create(Self);
  FPreview.Parent:= Self;
  FPreview.Align:= alClient;
  FPreview.OnPageChanged:= OnPageChanged;
  ActiveControl:= FPreview;
end;

procedure TfrxPreviewForm.Init;
var
  i:Integer;
  m:TMenuItem;
begin
  with Report.PreviewOptions do
  begin
    if Maximized then
      WindowState:= wsMaximized;
    if MDIChild and not (csDesigning in Report.ComponentState) then
      FormStyle:= fsMDIChild;
    FPreview.OutlineVisible:= OutlineVisible;
    FPreview.FOutline.Width:= OutlineWidth;
    FPreview.Zoom:= Zoom;
    FPreview.ZoomMode:= ZoomMode;

    NewPageB.Enabled:= AllowEdit;
    DelPageB.Enabled:= AllowEdit;
    DesignerB.Enabled:= AllowEdit;

    PrintB.Visible:= pbPrint in Buttons;
    OpenB.Visible:= pbLoad in Buttons;
    SaveB.Visible:= pbSave in Buttons;
    ExportB.Visible:= pbExport in Buttons;
    FindB.Visible:= pbFind in Buttons;

    ZoomWholePageB.Visible:= pbZoom in Buttons;
    ZoomPageWidthB.Visible:= pbZoom in Buttons;
    Zoom100B.Visible:= pbZoom in Buttons;
    Zoom50B.Visible:= pbZoom in Buttons;
    Sep3.Visible:= pbZoom in Buttons;
    if not (pbZoom in Buttons) then
      Sep1.Free;

    OutlineB.Visible:= pbOutline in Buttons;
    OutlineB.Down:= OutlineVisible;
    PageSettingsB.Visible:= pbPageSetup in Buttons;
    if not (OutlineB.Visible or PageSettingsB.Visible) then
      Sep2.Free;

    HandToolB.Visible:= pbTools in Buttons;
    ZoomToolB.Visible:= pbTools in Buttons;
    if not (pbTools in Buttons) then
      Sep5.Free;

    NewPageB.Visible:= pbEdit in Buttons;
    DelPageB.Visible:= pbEdit in Buttons;
    DesignerB.Visible:= pbEdit in Buttons;
    if not (pbEdit in Buttons) then
      Sep7.Free;

    FirstB.Visible:= pbNavigator in Buttons;
    PriorB.Visible:= pbNavigator in Buttons;
    NextB.Visible:= pbNavigator in Buttons;
    LastB.Visible:= pbNavigator in Buttons;
    Sep4.Visible:= pbNavigator in Buttons;
    if not (pbNavigator in Buttons) then
      Sep6.Free;

    Toolbar.ShowCaptions:= ShowCaptions;
  end;

  for i:= 0 to frxExportFilters.Count-1 do
  begin
    if frxExportFilters[i].Filter = frxDotMatrixExport then
      continue;
    m:= TMenuItem.Create(ExportPopup);
    ExportPopup.Items.Add(m);
    m.Caption:= TfrxCustomExportFilter(frxExportFilters[i].Filter).GetDescription+'...';
    m.Tag:= i;
    m.OnClick:= ExportMIClick;
  end;

  if Report.ReportOptions.Name<>'' then
    Caption:= Report.ReportOptions.Name;
  FPreview.Init;
end;

procedure TfrxPreviewForm.UpdateControls;

  procedure EnableControls(cAr:array of TControl; Enabled:Boolean);
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
  EnableControls([PrintB, OpenB, SaveB, ExportB, FindB, PageSettingsB],
    (not FPreview.FRunning) and (FPreview.PageCount > 0));
  EnableControls([NewPageB, DelPageB, DesignerB],
    not FPreview.FRunning and Report.PreviewOptions.AllowEdit);
end;

procedure TfrxPreviewForm.PrintBClick(Sender:TObject);
begin
  if not frxPrinters.HasPhysicalPrinters then
    frxErrorMsg(frxResources.Get('clNoPrinters')) else
    FPreview.Print;
  Enabled:= True;
end;

procedure TfrxPreviewForm.OpenBClick(Sender:TObject);
begin
  FPreview.LoadFromFile;
end;

procedure TfrxPreviewForm.SaveBClick(Sender:TObject);
begin
  FPreview.SaveToFile;
end;

procedure TfrxPreviewForm.FindBClick(Sender:TObject);
begin
  FPreview.Find;
end;

procedure TfrxPreviewForm.ZoomWholePageBClick(Sender:TObject);
begin
  FPreview.ZoomMode:= zmWholePage;
  UpdateZoom;
end;

procedure TfrxPreviewForm.ZoomPageWidthBClick(Sender:TObject);
begin
  FPreview.ZoomMode:= zmPageWidth;
  UpdateZoom;
end;

procedure TfrxPreviewForm.Zoom100BClick(Sender:TObject);
begin
  FPreview.Zoom:= 1;
  UpdateZoom;
end;

procedure TfrxPreviewForm.Zoom50BClick(Sender:TObject);
begin
  FPreview.ZoomMode:= zmManyPages;
  UpdateZoom;
end;

function TfrxPreviewForm.GetReport:TfrxReport;
begin
  Result:= Preview.Report;
end;

procedure TfrxPreviewForm.UpdateZoom;
begin
  ZoomCB.Text:= IntToStr(Round(FPreview.Zoom * 100))+'%';
end;

procedure TfrxPreviewForm.ZoomCBClick(Sender:TObject);
var
  s:String;
begin
  FPreview.SetFocus;

  if ZoomCB.ItemIndex = 6 then
    ZoomPageWidthBClick(nil)
  else if ZoomCB.ItemIndex = 7 then
    ZoomWholePageBClick(nil)
  else
  begin
    s:= ZoomCB.Text;

    if Pos('%', s)<>0 then
      s[Pos('%', s)]:= ' ';
    while Pos(' ', s)<>0 do
      Delete(s, Pos(' ', s), 1);

    if s<>'' then
      FPreview.Zoom:= frxStrToFloat(s) / 100;
  end;

  PostMessage(Handle, WM_UPDATEZOOM, 0, 0);
end;

procedure TfrxPreviewForm.FormKeyDown(Sender:TObject; var Key:Word;
  Shift:TShiftState);
begin
  if Key = VK_ESCAPE then
    CancelBClick(Self);
end;

procedure TfrxPreviewForm.FormKeyPress(Sender:TObject; var Key:Char);
begin
  if Key = #13 then
  begin
    if ActiveControl = ZoomCB then
      ZoomCBClick(nil);
    if ActiveControl = PageE then
      PageEClick(nil);
  end;
end;

procedure TfrxPreviewForm.WMUpdateZoom(var Message:TMessage);
begin
  UpdateZoom;
end;

procedure TfrxPreviewForm.OutlineBClick(Sender:TObject);
begin
  FPreview.OutlineVisible:= OutlineB.Down;
  FPreview.UpdateZoom;
end;

procedure TfrxPreviewForm.PageSettingsBClick(Sender:TObject);
begin
  FPreview.PageSetupDlg;
end;

procedure TfrxPreviewForm.SelectToolBClick(Sender:TObject);
begin
  if HandToolB.Down then
    FPreview.Tool:= ptHand
  else if ZoomToolB.Down then
    FPreview.Tool:= ptZoom
end;

procedure TfrxPreviewForm.OnPageChanged(Sender:TfrxPreview; PageNo:Integer);
var
  FirstPass:Boolean;
begin
  FirstPass:= False;
  if FPreview.PreviewPages<>nil then
    FirstPass:= not FPreview.PreviewPages.Engine.FinalPass;

  if FirstPass then
    StatusBar.Panels[0].Text:= frxResources.Get('clFirstPass')+
      IntToStr(FPreview.PageCount)
  else
    StatusBar.Panels[0].Text:= Format(frxResources.Get('clPageOf'),
      [PageNo, FPreview.PageCount]);
  PageE.Text:= IntToStr(PageNo);
end;

procedure TfrxPreviewForm.PageEClick(Sender:TObject);
begin
  FPreview.PageNo:= StrToInt(PageE.Text);
  FPreview.SetFocus;
end;

procedure TfrxPreviewForm.FirstBClick(Sender:TObject);
begin
  FPreview.First;
end;

procedure TfrxPreviewForm.PriorBClick(Sender:TObject);
begin
  FPreview.Prior;
end;

procedure TfrxPreviewForm.NextBClick(Sender:TObject);
begin
  FPreview.Next;
end;

procedure TfrxPreviewForm.LastBClick(Sender:TObject);
begin
  FPreview.Last;
end;

procedure TfrxPreviewForm.FormMouseWheel(Sender:TObject;
  Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint;
  var Handled:Boolean);
begin
  FPreview.MouseWheelScroll(WheelDelta, False, ssCtrl in Shift);
end;

procedure TfrxPreviewForm.DesignerBClick(Sender:TObject);
begin
  FPreview.Edit;
end;

procedure TfrxPreviewForm.FormCloseQuery(Sender:TObject;
  var CanClose:Boolean);
begin
  CanClose:= not FPreview.FRunning;
end;

procedure TfrxPreviewForm.FormClose(Sender:TObject; var Action:TCloseAction);
begin
  if FFreeOnClose then
    Action:= caFree;
end;

procedure TfrxPreviewForm.NewPageBClick(Sender:TObject);
begin
  FPreview.AddPage;
end;

procedure TfrxPreviewForm.DelPageBClick(Sender:TObject);
begin
  FPreview.DeletePage;
end;

procedure TfrxPreviewForm.CancelBClick(Sender:TObject);
begin
  if FPreview.FRunning then
    FPreview.Cancel else
    Close;
end;

procedure TfrxPreviewForm.ExportMIClick(Sender:TObject);
begin
  FPreview.Export(TfrxCustomExportFilter(frxExportFilters[TMenuItem(Sender).Tag].Filter));
  Enabled:= True;
end;

procedure TfrxPreviewForm.DesignerBMouseUp(Sender:TObject;
  Button:TMouseButton; Shift:TShiftState; X, Y:Integer);
var
  pt:TPoint;
begin
  pt:= DesignerB.ClientToScreen(Point(0, 0));
  if Button = mbRight then
    HiddenMenu.Popup(pt.X, pt.Y);
end;

procedure TfrxPreviewForm.Showtemplate1Click(Sender:TObject);
begin
  FPreview.EditTemplate;
end;

procedure TfrxPreviewForm.SetMessageText(const Value:String);
begin
  StatusBar.Panels[1].Text:= Value;
  Application.ProcessMessages;
end;

end.
