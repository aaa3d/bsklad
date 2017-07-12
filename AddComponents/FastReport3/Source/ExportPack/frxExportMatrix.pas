
{******************************************}
{                                          }
{             FastReport v3.0              }
{        Intermediate Export Matrix        }
{                                          }
{         Copyright (c) 1998-2005          }
{          by Alexander Fediachov,         }
{             Fast Reports Inc.            }
{                                          }
{******************************************}

unit frxExportMatrix;

{$I frx.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, graphics, frxClass, frxPreviewPages,
  frxProgress, Printers;

type
  TfrxIEMObject = class;
  TfrxIEMObjectList = class;
  TfrxIEMStyle = class;

  TfrxIEMatrix = class(TObject)
  private
    FIEMObjectList: TList;
    FIEMStyleList:  TList;
    FXPos: TList;
    FYPos: TList;
    FPages: TList;
    FWidth:     Integer;
    FHeight:    Integer;
    FMaxWidth:  Extended;
    FMaxHeight: Extended;
    FMinLeft:  Extended;
    FMinTop: Extended;
    FMatrix:    array of integer;
    FDeltaY: Extended;
    FShowProgress: Boolean;
    FMaxCellHeight: Extended;
    FMaxCellWidth: Extended;
    FInaccuracy: Extended;
    FProgress: TfrxProgress;
    FRotatedImage: Boolean;
    FPlainRich: Boolean;
    FRichText: Boolean;
    FCropFillArea: Boolean;
    FFillArea: Boolean;
    FOptFrames: Boolean;
    FLeft: Extended;
    FTop: Extended;
    FDeleteHTMLTags: Boolean;
    FBackImage: Boolean;
    FBackground: Boolean;
    FReport: TfrxReport;
    FPrintable: Boolean;
    function AddStyleInternal(Style: TfrxIEMStyle): integer;
    function AddStyle(Obj: TfrxView): integer;
    function AddInternalObject(Obj: TfrxIEMObject; x, y, dx, dy: integer): integer;
    function IsMemo(Obj: TfrxView): boolean;
    function IsLine(Obj: TfrxView): boolean;
    function IsRect(Obj: TfrxView): boolean;
    function QuickFind(aList: TList; aPosition: Extended; var Index: Integer): Boolean;
    procedure SetCell(x, y: integer; Value: integer);
    procedure FillArea(x, y, dx, dy: integer; Value: integer);
    procedure ReplaceArea(ObjIndex:integer; x, y, dx, dy: integer; Value: integer);
    procedure FindRectArea(x, y: integer; var dx, dy: integer);
    procedure CutObject(ObjIndex: Integer; x, y, dx, dy: integer);
    procedure CloneFrames(Obj1, Obj2: Integer);
    procedure AddPos(List: TList; Value: Extended);
    procedure OrderPosArray(List: TList; Vert: boolean);
    procedure OrderByCells;
    procedure Render;
    procedure Analyse;
    procedure OptimizeFrames;
  public
    constructor Create;
    destructor Destroy; override;
    function GetCell(x, y: integer): integer;
    function GetObjectById(ObjIndex: integer): TfrxIEMObject;
    function GetStyleById(StyleIndex: integer): TfrxIEMStyle;
    function GetXPosById(PosIndex: integer): Extended;
    function GetYPosById(PosIndex: integer): Extended;
    function GetObject(x, y: integer): TfrxIEMObject;
    function GetStyle(x, y: integer): TfrxIEMStyle;
    function GetCellXPos(x: integer): Extended;
    function GetCellYPos(y: integer): Extended;
    function GetStylesCount: Integer;
    function GetPagesCount: Integer;
    function GetObjectsCount: Integer;
    procedure Clear;
    procedure AddObject(Obj: TfrxView);
    procedure AddDialogObject(Obj: TfrxReportComponent);
    procedure AddPage(Orientation: TPrinterOrientation; Width: Extended;
              Height: Extended; LeftMargin: Extended; TopMargin: Extended;
              RightMargin: Extended; BottomMargin: Extended);
    procedure Prepare;
    procedure GetObjectPos(ObjIndex: integer; var x, y, dx, dy: integer);
    function GetPageBreak(Page: integer): Extended;
    function GetPageWidth(Page: integer): Extended;
    function GetPageHeight(Page: integer): Extended;
    function GetPageLMargin(Page: integer): Extended;
    function GetPageTMargin(Page: integer): Extended;
    function GetPageRMargin(Page: integer): Extended;
    function GetPageBMargin(Page: integer): Extended;
    function GetPageOrientation(Page: integer): TPrinterOrientation;
  published
    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
    property MaxWidth: Extended read FMaxWidth;
    property MaxHeight: Extended read FMaxHeight;
    property MinLeft: Extended read FMinLeft;
    property MinTop: Extended read FMinTop;
    property ShowProgress: Boolean read FShowProgress write FShowProgress;
    property MaxCellHeight: Extended read FMaxCellHeight write FMaxCellHeight;
    property MaxCellWidth: Extended read FMaxCellWidth write FMaxCellWidth;
    property PagesCount: Integer read GetPagesCount;
    property StylesCount: Integer read GetStylesCount;
    property ObjectsCount: Integer read GetObjectsCount;
    property Inaccuracy: Extended read FInaccuracy write FInaccuracy;
    property RotatedAsImage: boolean read FRotatedImage write FRotatedImage;
    property RichText: boolean read FRichText write FRichText;
    property PlainRich: boolean read FPlainRich write FPlainRich;
    property AreaFill: boolean read FFillArea write FFillArea;
    property CropAreaFill: boolean read FCropFillArea write FCropFillArea;
    property FramesOptimization: boolean read FOptFrames write FOptFrames;
    property DeleteHTMLTags: Boolean read FDeleteHTMLTags write FDeleteHTMLTags;
    property Left: Extended read FLeft;
    property Top: Extended read FTop;
    property BackgroundImage: Boolean read FBackImage write FBackImage;
    property Background: Boolean read FBackground write FBackground;
    property Report: TfrxReport read FReport write FReport;
    property Printable: Boolean read FPrintable write FPrintable;
  end;

  TfrxIEMObject = class(TObject)
  private
    FMemo: TStrings;
    FURL: String;
    FStyleIndex: Integer;
    FStyle: TfrxIEMStyle;
    FIsText: Boolean;
    FIsRichText: Boolean;
    FIsDialogObject: Boolean;
    FLeft: Extended;
    FTop: Extended;
    FWidth: Extended;
    FHeight: Extended;
    FImage: TBitmap;
    FParent: TfrxIEMObject;
    FCounter: Integer;
    FLink: TObject;
    FDisplayFormat: TfrxFormat;
    FRTL: Boolean;
    FAnchor: String;
    procedure SetMemo(const Value: TStrings);
    procedure SetDisplayFormat(const Value: TfrxFormat);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Memo: TStrings read FMemo write SetMemo;
    property URL: String read FURL write FURL;
    property StyleIndex: Integer read FStyleIndex write FStyleIndex;
    property IsText: Boolean read FIsText write FIsText;
    property IsRichText: Boolean read FIsRichText write FIsRichText;
    property IsDialogObject: Boolean read FIsDialogObject write FIsDialogObject;
    property Left: Extended read FLeft write FLeft;
    property Top: Extended read FTop write FTop;
    property Width: Extended read FWidth write FWidth;
    property Height: Extended read FHeight write FHeight;
    property Image: TBitmap read FImage write FImage;
    property Parent: TfrxIEMObject read FParent write FParent;
    property Style: TfrxIEMStyle read FStyle write FStyle;
    property Counter: Integer read FCounter write FCounter;
    property Link: TObject read FLink write FLink;
    property DisplayFormat: TfrxFormat read FDisplayFormat write SetDisplayFormat;
    property RTL: Boolean read FRTL write FRTL;
    property Anchor: String read FAnchor write FAnchor;
  end;

  TfrxIEMObjectList = class(TObject)
  public
    Obj: TfrxIEMObject;
    x, y, dx, dy : Integer;
    Exist: Boolean;
    constructor Create;
    destructor Destroy; override;
  end;

  TfrxIEMPos = class(TObject)
  public
    Value: Extended;
  end;

  TfrxIEMPage = class(TObject)
  public
    Value: Extended;
    Orientation: TPrinterOrientation;
    Width: Extended;
    Height: Extended;
    LeftMargin: Extended;
    TopMargin:Extended;
    BottomMargin: Extended;
    RightMargin:Extended;
  end;

  TfrxIEMStyle = class(TObject)
  public
    Font:        TFont;
    LineSpacing: Extended;
    VAlign:      TfrxVAlign;
    HAlign:      TfrxHAlign;
    FrameTyp:    TfrxFrameTypes;
    FrameWidth:  Single;
    FrameColor:  TColor;
    FrameStyle:  TfrxFrameStyle;
    Color:       TColor;
    Rotation:    Integer;
    BrushStyle:  TBrushStyle;
    GapX: Extended;
    GapY: Extended;
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Style: TfrxIEMStyle);
  end;

implementation

uses frxres, frxrcExports;

{ TfrxIEMatrix }

const
  MAX_POS_SEARCH_DEPTH = 100;

constructor TfrxIEMatrix.Create;
begin
  FIEMObjectList := TList.Create;
  FIEMStyleList := TList.Create;
  FXPos := TList.Create;
  FYPos := TList.Create;
  FPages := TList.Create;
  FMaxWidth := 0;
  FMaxHeight := 0;
  FMinLeft := 99999;
  FMinTop := 99999;
  FDeltaY := 0;
  FMaxCellHeight := 0;
  FShowProgress := true;
  FInaccuracy := 0;
  FRotatedImage := false;
  FPlainRich := true;
  FRichText := false;
  FFillArea := false;
  FCropFillArea := false;
  FOptFrames := false;
  FTop := 0;
  FLeft := 0;
  FBackImage := False;
  FBackground := False;
  FReport := nil;
  FPrintable := True;
end;

destructor TfrxIEMatrix.Destroy;
begin
  Clear;
  FXPos.Free;
  FYPos.Free;
  FIEMObjectList.Free;
  FIEMStyleList.Free;
  FPages.Free;
  inherited;
end;

function TfrxIEMatrix.AddInternalObject(Obj: TfrxIEMObject; x, y, dx, dy: integer): integer;
var
  FObjItem: TfrxIEMObjectList;
begin
  FObjItem := TfrxIEMObjectList.Create;
  FObjItem.x := x;
  FObjItem.y := y;
  FObjItem.dx := dx;
  FObjItem.dy := dy;
  FObjItem.Obj := Obj;
  FIEMObjectList.Add(FObjItem);
  Result := FIEMObjectList.Count - 1;
end;

procedure TfrxIEMatrix.AddObject(Obj: TfrxView);
var
  dx, dy: Extended;
  FObj: TfrxIEMObject;
  DrawPosX, DrawPosY: Extended;
  Memo: TfrxCustomMemoView;
  Line: TfrxCustomLineView;
  OldFrameWidth: Extended;
begin
  if ((Obj.Name = '_pagebackground') {or (Obj.Name = '')}) and
     (not FBackground) and (FPrintable or Obj.Printable)
  then
    Exit;
  OldFrameWidth := 0;

  if Obj.Frame.DropShadow and (Obj is TfrxCustomMemoView) then
  begin
    Obj.Width := Obj.Width - Obj.Frame.ShadowWidth;
    Obj.Height := Obj.Height - Obj.Frame.ShadowWidth;
    Obj.Frame.DropShadow := False;
    AddObject(Obj);
    Obj.Width := Obj.Width + Obj.Frame.ShadowWidth;
    Obj.Height := Obj.Height + Obj.Frame.ShadowWidth;
    Obj.Frame.DropShadow := True;

    Memo := TfrxCustomMemoView.Create(nil);
    Memo.Name := 'Shadow';
    Memo.Font.Size := 1;
    Memo.Color := Obj.Frame.ShadowColor;
    Memo.Left := Obj.AbsLeft + Obj.Width - Obj.Frame.ShadowWidth;
    Memo.Top := Obj.AbsTop + Obj.Frame.ShadowWidth;
    Memo.Width := Obj.Frame.ShadowWidth;
    Memo.Height := Obj.Height - Obj.Frame.ShadowWidth;
    AddObject(Memo);
    Memo.Left := Obj.AbsLeft + Obj.Frame.ShadowWidth;
    Memo.Top := Obj.AbsTop +  Obj.Height - Obj.Frame.ShadowWidth;
    Memo.Width := Obj.Width - Obj.Frame.ShadowWidth;
    Memo.Height := Obj.Frame.ShadowWidth;
    AddObject(Memo);
    Memo.Free;
    exit;
  end;

  FObj := TfrxIEMObject.Create;
  FObj.StyleIndex := AddStyle(Obj);
  if FObj.StyleIndex <> -1 then
    FObj.Style := TfrxIEMStyle(FIEMStyleList[FObj.StyleIndex]);
  FObj.URL :=Obj.URL;
  if Assigned(FReport) and (FObj.URL <> '') and (FObj.URL[1] = '#') then
    FObj.URL := '@' + IntToStr(TfrxPreviewPages(FReport.PreviewPages).GetAnchorPage(StringReplace(FObj.URL, '#', '', [])));

  if Obj.AbsLeft >= 0 then
    FObj.Left := Obj.AbsLeft
  else FObj.Left := 0;
  if Obj.AbsTop >= 0 then
    FObj.Top := FDeltaY + Obj.AbsTop
  else FObj.Top := FDeltaY;
  FObj.Width := Obj.Width;
  FObj.Height := Obj.Height;
  if IsMemo(Obj) then
  begin
    // Memo
    if FDeleteHTMLTags and TfrxCustomMemoView(Obj).AllowHTMLTags then
      FObj.Memo.Text := TfrxCustomMemoView(Obj).WrapText(False)
    else
      FObj.Memo := TfrxCustomMemoView(Obj).Memo;
    FObj.IsText := True;
    FObj.IsRichText := False;
    FObj.RTL := TfrxCustomMemoView(Obj).RTLReading;
    FObj.DisplayFormat := TfrxCustomMemoView(Obj).DisplayFormat;
  end
  else if (Obj.ClassName = 'TfrxRichView') and (FRichText) then
  begin
    // Rich
    FObj.IsText := True;
    FObj.IsRichText := True;
    FObj.Memo.Text := Obj.GetComponentText;
  end
  else if IsLine(Obj) then
  begin
    // Line
    FObj.IsText := True;
    FObj.IsRichText := False;
    if FObj.Left > (FObj.Left + FObj.Width) then
    begin
      FObj.Left := FObj.Left + FObj.Width;
      FObj.Width := -FObj.Width;
    end;
    if FObj.Top > (FObj.Top + Obj.Height) then
    begin
      FObj.Top := FObj.Top + FObj.Height;
      FObj.Height := -FObj.Height;
    end;
    if FObj.Width = 0 then
      if FInaccuracy < 1 then FObj.Width := 1
      else FObj.Width := FInaccuracy;
    if FObj.Height = 0 then
      if FInaccuracy < 1 then FObj.Height := 1
      else FObj.Height := FInaccuracy;
  end
  else if IsRect(Obj) then
  begin
    if Obj.Color = clNone then
    begin
      // Rect as lines
      Line := TfrxCustomLineView.Create(nil);
      Line.Name := 'Line';
      Line.Frame.Assign(Obj.Frame);
      Line.Left := Obj.AbsLeft;
      Line.Top := Obj.AbsTop;
      Line.Width := Obj.Width;
      Line.Height := 0;
      AddObject(Line);
      Line.Left := Obj.AbsLeft;
      Line.Top := Obj.AbsTop;
      Line.Width := 0;
      Line.Height := Obj.Height;
      AddObject(Line);
      Line.Left := Obj.AbsLeft;
      Line.Top := Obj.AbsTop + Obj.Height;
      Line.Width := Obj.Width;
      Line.Height := 0;
      AddObject(Line);
      Line.Left := Obj.AbsLeft + Obj.Width;
      Line.Top := Obj.AbsTop;
      Line.Width := 0;
      Line.Height := Obj.Height;
      AddObject(Line);
      Line.Free;
    end else
    begin
      // Rect as memo
      Memo := TfrxCustomMemoView.Create(nil);
      Memo.Frame.Assign(Obj.Frame);
      Memo.Name := 'Rect';
      Memo.Color := Obj.Color;
      Memo.Left := Obj.AbsLeft;
      Memo.Top := Obj.AbsTop;
      Memo.Width := Obj.Width;
      Memo.Height := Obj.Height;
      Memo.Frame.Typ := [ftLeft, ftTop, ftRight, ftBottom];
      Memo.Font.Size := 1;
      AddObject(Memo);
      Memo.Free;
    end;
    FObj.Free;
    Exit;
  end
  else begin
    // Bitmap
    if not ((Obj.Name = '_pagebackground') and (not FBackImage)) then
    begin
      if (Obj.Frame.Typ <> []) and (Obj.Frame.Width > 0) then
      begin
        OldFrameWidth := Obj.Frame.Width;
        Obj.Frame.Width := 0;
      end;
      FObj.IsText := False;
      FObj.IsRichText := False;
      dx := Obj.Width;
      dy := Obj.Height;
      DrawPosX := Obj.AbsLeft;
      DrawPosY := Obj.AbsTop;
      if Round(dx) = 0 then
        dx := 1;
      if dx < 0 then
      begin
        dx := -dx;
        FObj.Left := FObj.Left - dx;
        DrawPosX := DrawPosX - dx;
      end;
      if Round(dy) = 0 then
        dy := 1;
      if dy < 0 then
      begin
        dy := -dy;
        FObj.Top := FObj.Top - dy;
        DrawPosY := DrawPosY - dy;
      end;
      FObj.Width := dx;
      FObj.Height := dy;
      FObj.Image := TBitmap.Create;
      FObj.Image.PixelFormat := pf24bit;
      FObj.Image.Height := Round(dy) + 1;
      FObj.Image.Width := Round(dx) + 1;
      TfrxView(Obj).Draw(FObj.Image.Canvas, 1, 1, -DrawPosX, -DrawPosY);
      if OldFrameWidth > 0 then
        Obj.Frame.Width := OldFrameWidth;
    end
  end;
  if FObj.Top + FObj.Height > FMaxHeight then
    FMaxHeight := FObj.Top + FObj.Height;
  if FObj.Left + FObj.Width > FMaxWidth then
    FMaxWidth := FObj.Left + FObj.Width;
  if FObj.Left < FMinLeft then
    FMinLeft := FObj.Left;
  if FObj.Top < FMinTop then
    FMinTop := FObj.Top;
  if (FObj.Left < FLeft) or (FLeft = 0) then
    FLeft := FObj.Left;
  if (FObj.Top < FTop) or (FTop = 0) then
    FTop := FObj.Top;
  AddPos(FXPos, FObj.Left);
  AddPos(FXPos, FObj.Left + FObj.Width);
  AddPos(FYPos, FObj.Top);
  AddPos(FYPos, FObj.Top + FObj.Height);
  AddInternalObject(FObj, 0, 0, 1, 1);
end;

procedure TfrxIEMatrix.AddDialogObject(Obj: TfrxReportComponent);
var
  FObj: TfrxIEMObject;
begin
  if Obj is TfrxDialogControl then
  begin
    FObj := TfrxIEMObject.Create;
    FObj.StyleIndex := 0;
    FObj.Style := nil;
    FObj.URL := '';
    FObj.Left := Obj.AbsLeft;
    FObj.Top := Obj.AbsTop;
    FObj.Width := Obj.Width;
    FObj.Height := Obj.Height;
    FObj.IsText := False;
    FObj.IsRichText := False;
    FObj.Link := Obj;
    if FObj.Top + FObj.Height > FMaxHeight then
      FMaxHeight := FObj.Top + FObj.Height;
    if FObj.Left + FObj.Width > FMaxWidth then
      FMaxWidth := FObj.Left + FObj.Width;
    if FObj.Left < FMinLeft then
      FMinLeft := FObj.Left;
    if FObj.Top < FMinTop then
      FMinTop := FObj.Top;
    AddPos(FXPos, FObj.Left);
    AddPos(FXPos, FObj.Left + FObj.Width);
    AddPos(FYPos, FObj.Top);
    AddPos(FYPos, FObj.Top + FObj.Height);
    AddInternalObject(FObj, 0, 0, 1, 1);
  end;
end;

procedure TfrxIEMatrix.AddPage(Orientation: TPrinterOrientation;
Width: Extended; Height: Extended; LeftMargin: Extended; TopMargin: Extended;
RightMargin: Extended; BottomMargin: Extended);
var
  Page: TfrxIEMPage;
begin
  FDeltaY := FMaxHeight;
  Page := TfrxIEMPage.Create;
  Page.Value := FMaxHeight;
  Page.Orientation := Orientation;
  Page.Width := Width;
  Page.Height := Height;
  Page.LeftMargin := LeftMargin;
  page.TopMargin := TopMargin;
  Page.RightMargin := LeftMargin;
  page.BottomMargin := TopMargin;
  FPages.Add(Page);
end;

procedure TfrxIEMatrix.AddPos(List: TList; Value: Extended);
var
  Pos: TfrxIEMPos;
  i, cnt: integer;
  Exist: Boolean;
begin
  Exist := False;
  if List.Count > MAX_POS_SEARCH_DEPTH then
    cnt := List.Count - MAX_POS_SEARCH_DEPTH
  else
    cnt := 0;
  for i := List.Count - 1 downto cnt do
    if TfrxIEMPos(List[i]).Value = Value then
    begin
      Exist := True;
      break;
    end;
  if not Exist then
  begin
    Pos := TfrxIEMPos.Create;
    Pos.Value := Value;
    List.Add(Pos);
  end;
end;

function TfrxIEMatrix.AddStyle(Obj: TfrxView): integer;
var
  Style: TfrxIEMStyle;
begin
  Style := TfrxIEMStyle.Create;
  if IsMemo(Obj) then
  begin
    if TfrxCustomMemoView(Obj).Highlight.Active and
       Assigned(TfrxCustomMemoView(Obj).Highlight.Font) then
    begin
      Style.Font.Assign(TfrxCustomMemoView(Obj).Highlight.Font);
      Style.Color := TfrxCustomMemoView(Obj).Highlight.Color;
    end else
    begin
      Style.Font.Assign(TfrxCustomMemoView(Obj).Font);
      Style.Color := TfrxCustomMemoView(Obj).Color;
    end;
    Style.HAlign := TfrxCustomMemoView(Obj).HAlign;
    Style.VAlign := TfrxCustomMemoView(Obj).VAlign;
    Style.LineSpacing := TfrxCustomMemoView(Obj).LineSpacing;
    Style.GapX := TfrxCustomMemoView(Obj).GapX;
    Style.GapY := TfrxCustomMemoView(Obj).GapY;
    Style.FrameTyp := TfrxCustomMemoView(Obj).Frame.Typ;
    Style.FrameWidth := TfrxCustomMemoView(Obj).Frame.Width;
    Style.FrameColor := TfrxCustomMemoView(Obj).Frame.Color;
    Style.FrameStyle := TfrxCustomMemoView(Obj).Frame.Style;
    Style.Rotation := TfrxCustomMemoView(Obj).Rotation;
  end
  else if IsLine(Obj) then
  begin
    Style.Color := Obj.Color;
    if Obj.Width = 0 then
      Style.FrameTyp := [ftLeft]
    else if Obj.Height = 0 then
      Style.FrameTyp := [ftTop]
    else  Style.FrameTyp := [];
    Style.FrameWidth := Obj.Frame.Width;
    Style.FrameColor := Obj.Frame.Color;
    Style.FrameStyle := Obj.Frame.Style;
    Style.Font.Name := 'Arial';
    Style.Font.Size := 1;
  end
  else if IsRect(Obj) then
  begin
    Style.Free;
    Result := -1;
    Exit;
  end
  else begin
    Style.Font.Assign(Obj.Font);
    Style.FrameTyp := [];
    Style.Color := Obj.Color;
    Style.FrameWidth := Obj.Frame.Width;
    Style.FrameColor := Obj.Frame.Color;
    Style.FrameStyle := Obj.Frame.Style;
    Style.FrameTyp := Obj.Frame.Typ;
  end;
  Result := AddStyleInternal(Style);
end;

function TfrxIEMatrix.AddStyleInternal(Style: TfrxIEMStyle): integer;
var
  i: integer;
  Style2: TfrxIEMStyle;
begin
  Result := -1;
  for i := 0 to FIEMStyleList.Count - 1 do
  begin
    Style2 := TfrxIEMStyle(FIEMStyleList[i]);
    if (Style.Font.Color = Style2.Font.Color) and
       (Style.Font.Name = Style2.Font.Name) and
       (Style.Font.Size = Style2.Font.Size) and
       (Style.Font.Style = Style2.Font.Style) and
       (Style.LineSpacing = Style2.LineSpacing) and
       (Style.GapX = Style2.GapX) and
       (Style.GapY = Style2.GapY) and
       (Style.HAlign = Style2.HAlign) and
       (Style.VAlign = Style2.VAlign) and
       (Style.FrameTyp = Style2.FrameTyp) and
       (Style.FrameWidth = Style2.FrameWidth) and
       (Style.FrameColor = Style2.FrameColor) and
       (Style.FrameStyle = Style2.FrameStyle) and
       (Style.Rotation = Style2.Rotation) and
       (Style.Color = Style2.Color) then
    begin
      Result := i;
      break;
    end;
  end;
  if Result = -1 then
  begin
    FIEMStyleList.Add(Style);
    Result := FIEMStyleList.Count - 1;
  end else
    Style.Free;
end;

procedure TfrxIEMatrix.Analyse;
var
  i, j, k: integer;
  dx, dy: integer;
  obj: TfrxIEMObjectList;
begin
  for i := 0 to FHeight - 1 do
    for j := 0 to FWidth - 1 do
    begin
      k := GetCell(j, i);
      if k <> -1 then
      begin
        obj := TfrxIEMObjectList(FIEMObjectList[k]);
        if not obj.Exist then
        begin
          FindRectArea(j, i, dx, dy);
          if (obj.x <> j) or (obj.y <> i) or
             (obj.dx <> dx) or (obj.dy <> dy) then
          begin
            if not Obj.Exist then
              CutObject(k, j, i, dx, dy)
          end else
            Obj.Exist := true;
        end;
      end;
    end;
  if FShowProgress then
    FProgress.Tick;
end;

procedure TfrxIEMatrix.Clear;
var
  i : Integer;
begin
  for i := 0 to FIEMObjectList.Count - 1 do
    TfrxIEMObjectList(FIEMObjectList[i]).Free;
  FIEMObjectList.Clear;
  for i := 0 to FIEMStyleList.Count - 1 do
    TfrxIEMStyle(FIEMStyleList[i]).Free;
  FIEMStyleList.Clear;
  for i := 0 to FXPos.Count - 1 do
    TfrxIEMPos(FXPos[i]).Free;
  FXPos.Clear;
  for i := 0 to FYPos.Count - 1 do
    TfrxIEMPos(FYPos[i]).Free;
  FYPos.Clear;
  for i := 0 to FPages.Count - 1 do
    TfrxIEMPage(FPages[i]).Free;
  FPages.Clear;
  SetLength(FMatrix, 0);
  FDeltaY := 0;
end;

procedure TfrxIEMatrix.CloneFrames(Obj1, Obj2: Integer);
var
  FOld, FNew: TfrxIEMObject;
  FrameTyp: TfrxFrameTypes;
  NewStyle: TfrxIEMStyle;
begin
  FOld := TfrxIEMObjectList(FIEMObjectList[Obj1]).Obj;
  FNew := TfrxIEMObjectList(FIEMObjectList[Obj2]).Obj;
  if (FOld.Style <> nil) and (FNew.Style <> nil) then
  begin
  FrameTyp := [];
  if (ftTop in FOld.Style.FrameTyp) and (FOld.Top = FNew.Top) then
    FrameTyp := FrameTyp + [ftTop];
  if (ftLeft in FOld.Style.FrameTyp) and (FOld.Left = FNew.Left) then
    FrameTyp := FrameTyp + [ftLeft];
  if (ftBottom in FOld.Style.FrameTyp) and
     ((FOld.Top + FOld.Height) = (FNew.Top + FNew.Height)) then
    FrameTyp := FrameTyp + [ftBottom];
  if (ftRight in FOld.Style.FrameTyp) and
     ((FOld.Left + FOld.Width) = (FNew.Left + FNew.Width)) then
    FrameTyp := FrameTyp + [ftRight];
  if FrameTyp <> FNew.Style.FrameTyp then
  begin
    NewStyle := TfrxIEMStyle.Create;
    NewStyle.FrameTyp := FrameTyp;
    NewStyle.FrameWidth := FOld.Style.FrameWidth;
    NewStyle.FrameColor := FOld.Style.FrameColor;
    NewStyle.FrameStyle := FOld.Style.FrameStyle;
    NewStyle.Font.Assign(FOld.Style.Font);
    NewStyle.LineSpacing := FOld.Style.LineSpacing;
    NewStyle.GapX := FOld.Style.GapX;
    NewStyle.GapY := FOld.Style.GapY;
    NewStyle.VAlign := FOld.Style.VAlign;
    NewStyle.HAlign := FOld.Style.HAlign;
    NewStyle.Color := FOld.Style.Color;
    NewStyle.Rotation := FOld.Style.Rotation;
    NewStyle.BrushStyle := FOld.Style.BrushStyle;
    FNew.StyleIndex := AddStyleInternal(NewStyle);
    FNew.Style := TfrxIEMStyle(FIEMStyleList[FNew.StyleIndex]);
  end;
end;
end;

procedure TfrxIEMatrix.CutObject(ObjIndex, x, y, dx, dy: integer);
var
  Obj: TfrxIEMObject;
  NewObject: TfrxIEMObject;
  NewIndex: Integer;
  fdx, fdy: Extended;
begin
  Obj := TfrxIEMObjectList(FIEMObjectList[ObjIndex]).Obj;
  NewObject := TfrxIEMObject.Create;
  NewObject.StyleIndex := Obj.StyleIndex;
  NewObject.Style := Obj.Style;
  NewObject.Left := TfrxIEMPos(FXPos[x]).Value;
  NewObject.Top := TfrxIEMPos(FYPos[y]).Value;
  NewObject.Width := TfrxIEMPos(FXPos[x + dx]).Value - TfrxIEMPos(FXPos[x]).Value;
  NewObject.Height := TfrxIEMPos(FYPos[y + dy]).Value - TfrxIEMPos(FYPos[y]).Value;
  NewObject.Parent := Obj;
  fdy := Obj.Top + Obj.Height - NewObject.Top;
  fdx := Obj.Left + Obj.Width - NewObject.Left;
  if (fdy > Obj.Height / 3) and (fdx > Obj.Width / 3) then
  begin
    NewObject.Image := Obj.Image;
    NewObject.Link := Obj.Link;
    NewObject.IsText := Obj.IsText;
    NewObject.Memo := Obj.Memo;
    Obj.Memo.Clear;
    Obj.IsText := True;
    Obj.Link := nil;
    Obj.Image := nil;
  end;
  NewIndex := AddInternalObject(NewObject, x, y, dx, dy);
  ReplaceArea(ObjIndex, x, y, dx, dy, NewIndex);
  CloneFrames(ObjIndex, NewIndex);
  TfrxIEMObjectList(FIEMObjectList[NewIndex]).Exist := True;
end;

procedure TfrxIEMatrix.FillArea(x, y, dx, dy, Value: integer);
var
  i, j: integer;
begin
  for i := y to y + dy - 1 do
    for j := x to x + dx - 1 do
      SetCell(j, i, Value);
end;

procedure TfrxIEMatrix.FindRectArea(x, y: integer; var dx, dy: integer);
var
  px, py: integer;
  Obj: integer;
begin
  Obj := GetCell(x, y);
  px := x;
  py := y;
  dx := 0;
  while GetCell(px, py) = Obj do
  begin
    while GetCell(px, py) = Obj do
      Inc(px);
    if dx = 0 then
      dx := px - x
    else if px - x < dx then
        break;
    Inc(py);
    px := x;
  end;
  dy := py - y;
end;

function TfrxIEMatrix.GetCell(x, y: integer): integer;
begin
  if (x < FWidth) and (y < FHeight) and (x >= 0) and (y >= 0) then
    Result := FMatrix[FWidth * y + x]
  else Result := -1;
end;

function TfrxIEMatrix.GetCellXPos(x: integer): Extended;
begin
  Result := TfrxIEMPos(FXPos[x]).Value;
end;

function TfrxIEMatrix.GetCellYPos(y: integer): Extended;
begin
  Result := TfrxIEMPos(FYPos[y]).Value;
end;

function TfrxIEMatrix.GetObject(x, y: integer): TfrxIEMObject;
var
  i: integer;
begin
  i := GetCell(x, y);
  if i = -1 then
    Result := nil
  else
    Result := TfrxIEMObjectList(FIEMObjectList[i]).Obj;
end;

function TfrxIEMatrix.GetObjectById(ObjIndex: integer): TfrxIEMObject;
begin
  if ObjIndex < FIEMObjectList.Count then
    Result := TfrxIEMObjectList(FIEMObjectList[ObjIndex]).Obj
  else Result := nil;
end;

procedure TfrxIEMatrix.GetObjectPos(ObjIndex: integer; var x, y, dx,
  dy: integer);
begin
  x := TfrxIEMObjectList(FIEMObjectList[ObjIndex]).x;
  y := TfrxIEMObjectList(FIEMObjectList[ObjIndex]).y;
  dx := TfrxIEMObjectList(FIEMObjectList[ObjIndex]).dx;
  dy := TfrxIEMObjectList(FIEMObjectList[ObjIndex]).dy;
end;

function TfrxIEMatrix.GetObjectsCount: Integer;
begin
  Result := FIEMObjectList.Count;
end;

function TfrxIEMatrix.GetPageBreak(Page: integer): Extended;
begin
  if Page < FPages.Count then
    Result := TfrxIEMPage(FPages[Page]).Value
  else
    Result := 0;
end;

function TfrxIEMatrix.GetPageHeight(Page: integer): Extended;
begin
  if Page < FPages.Count then
    Result := TfrxIEMPage(FPages[Page]).Height
  else
    Result := 0;
end;

function TfrxIEMatrix.GetPageLMargin(Page: integer): Extended;
begin
  if Page < FPages.Count then
    Result := TfrxIEMPage(FPages[Page]).LeftMargin
  else
    Result := 0;
end;

function TfrxIEMatrix.GetPageTMargin(Page: integer): Extended;
begin
  if Page < FPages.Count then
    Result := TfrxIEMPage(FPages[Page]).TopMargin
  else
    Result := 0;
end;

function TfrxIEMatrix.GetPageWidth(Page: integer): Extended;
begin
  if Page < FPages.Count then
    Result := TfrxIEMPage(FPages[Page]).Width
  else
    Result := 0;
end;

function TfrxIEMatrix.GetPageBMargin(Page: integer): Extended;
begin
  if Page < FPages.Count then
    Result := TfrxIEMPage(FPages[Page]).BottomMargin
  else
    Result := 0;
end;

function TfrxIEMatrix.GetPageRMargin(Page: integer): Extended;
begin
  if Page < FPages.Count then
    Result := TfrxIEMPage(FPages[Page]).RightMargin
  else
    Result := 0;
end;

function TfrxIEMatrix.GetPageOrientation(Page: integer): TPrinterOrientation;
begin
  if Page < FPages.Count then
    Result := TfrxIEMPage(FPages[Page]).Orientation
  else
    Result := poPortrait;
end;

function TfrxIEMatrix.GetPagesCount: Integer;
begin
  Result := FPages.Count;
end;

function TfrxIEMatrix.GetStyle(x, y: integer): TfrxIEMStyle;
var
  Obj: TfrxIEMObject;
begin
  Obj := GetObject(x, y);
  if Obj <> nil then
    Result := TfrxIEMStyle(FIEMStyleList[Obj.StyleIndex])
  else
    Result := nil;
end;

function TfrxIEMatrix.GetStyleById(StyleIndex: integer): TfrxIEMStyle;
begin
  Result := TfrxIEMStyle(FIEMStyleList[StyleIndex]);
end;

function TfrxIEMatrix.GetStylesCount: Integer;
begin
  Result := FIEMStyleList.Count;
end;

function TfrxIEMatrix.GetXPosById(PosIndex: integer): Extended;
begin
  Result := TfrxIEMPos(FXPos[PosIndex]).Value;
end;

function TfrxIEMatrix.GetYPosById(PosIndex: integer): Extended;
begin
  Result := TfrxIEMPos(FYPos[PosIndex]).Value;
end;

function TfrxIEMatrix.IsMemo(Obj: TfrxView): boolean;
begin
  Result := (Obj is TfrxCustomMemoView) and
            (Obj.BrushStyle in [bsSolid, bsClear]) and
            ((TfrxCustomMemoView(Obj).Rotation = 0) or (not FRotatedImage));
end;

function TfrxIEMatrix.IsLine(Obj: TfrxView): boolean;
begin
  Result := (Obj is TfrxCustomLineView) and ((Obj.Width = 0) or (Obj.Height = 0));
end;

function TfrxIEMatrix.IsRect(Obj: TfrxView): boolean;
begin
  Result := (Obj is TfrxShapeView) and (TfrxShapeView(Obj).Shape = skRectangle);
end;

procedure TfrxIEMatrix.OptimizeFrames;
var
  x, y: Integer;
  Obj, PrevObj: TfrxIEMObject;
  FrameTyp: TfrxFrameTypes;
  Style: TfrxIEMStyle;
begin
  for y := 0 to Height - 1 do
    for x := 0 to Width - 1 do
    begin
      Obj := GetObject(x, y);
      if Obj = nil then continue;
      FrameTyp := Obj.Style.FrameTyp;

      if (ftTop in FrameTyp) and (y > 0) then
      begin
        PrevObj := GetObject(x, y - 1);
        if (PrevObj <> nil) and (PrevObj <> Obj) then
          if (ftBottom in PrevObj.Style.FrameTyp) and
            (PrevObj.Style.FrameWidth = Obj.Style.FrameWidth) and
            (PrevObj.Style.FrameColor = Obj.Style.FrameColor) then
            FrameTyp := FrameTyp - [ftTop];
      end;
      if (ftLeft in FrameTyp) and (x > 0) then
      begin
        PrevObj := GetObject(x - 1, y);
        if (PrevObj <> nil) and (PrevObj <> Obj) then
          if (ftRight in PrevObj.Style.FrameTyp) and
            (PrevObj.Style.FrameWidth = Obj.Style.FrameWidth) and
            (PrevObj.Style.FrameColor = Obj.Style.FrameColor) then
            FrameTyp := FrameTyp - [ftLeft];
      end;

      if FrameTyp <> Obj.Style.FrameTyp then
      begin
        Style := TfrxIEMStyle.Create;
        Style.Assign(Obj.Style);
        Style.FrameTyp := FrameTyp;
        Obj.StyleIndex := AddStyleInternal(Style);
        Obj.Style := TfrxIEMStyle(FIEMStyleList[Obj.StyleIndex]);
      end;
    end;
end;

function TfrxIEMatrix.QuickFind(aList: TList; aPosition: Extended; var Index: Integer): Boolean;
var
  L, H, I: Integer;
  C: Extended;
begin
  Result := False;
  L := 0;
  H := aList.Count - 1;
  while L <= H do begin
    I := (L + H) shr 1;
    C := TfrxIEMPos(aList[I]).Value - aPosition;
    if C < 0 then
      L := I + 1
    else begin
      H := I - 1;
      if C = 0 then begin
        Result := True;
        L := I
      end
    end
  end;
  Index := L
end;

procedure TfrxIEMatrix.OrderByCells;
var
  i, j, k, dx, dy: integer;
  curx, cury: Extended;
  obj: TfrxIEMObject;
begin
  OrderPosArray(FXPos, false);
  OrderPosArray(FYPos, true);
  for i := 0 to FIEMObjectList.Count - 1 do
  begin
    dx := 0; dy := 0;
    obj := TfrxIEMObjectList(FIEMObjectList[i]).Obj;
    QuickFind(FXPos, Obj.Left, j);
    if j < FXPos.Count then
    begin
      TfrxIEMObjectList(FIEMObjectList[i]).x := j;
      curx := Obj.Left;
      k := j;
      while (Obj.Left + Obj.Width > curx) and (k < FXPos.Count - 1) do
      begin
        Inc(k);
        curx := TfrxIEMPos(FXPos[k]).Value;
        Inc(dx);
      end;
      TfrxIEMObjectList(FIEMObjectList[i]).dx := dx;
    end;
    QuickFind(FYPos, Obj.Top, j);
    if j < FYPos.Count then
    begin
      TfrxIEMObjectList(FIEMObjectList[i]).y := j;
      cury := Obj.Top;
      k := j;
      while (Obj.Top + Obj.Height > cury) and (k < FYPos.Count - 1) do
      begin
        Inc(k);
        cury := TfrxIEMPos(FYPos[k]).Value;
        Inc(dy);
      end;
      TfrxIEMObjectList(FIEMObjectList[i]).dy := dy;
    end;
  end;
  if FShowProgress then
    FProgress.Tick;
end;

function SortPosCompare(Item1, Item2: Pointer): Integer;
begin
  if TfrxIEMPos(Item1).Value < TfrxIEMPos(Item2).Value then
    Result := -1
  else if TfrxIEMPos(Item1).Value > TfrxIEMPos(Item2).Value then
    Result := 1
  else
    Result := 0;
end;

procedure TfrxIEMatrix.OrderPosArray(List: TList; Vert: boolean);
var
  i, j, Cnt: integer;
  pos1, pos2: Extended;
  Reorder: Boolean;
begin
  List.Sort(SortPosCompare);
  if FShowProgress then
    FProgress.Tick;
  i := 0;
  while i <= List.Count - 2 do
  begin
    pos1 := TfrxIEMPos(List[i]).Value;
    pos2 := TfrxIEMPos(List[i + 1]).Value;
    if pos2 - pos1 < FInaccuracy then
    begin
      TfrxIEMPos(List[i]).Free;
      List.Delete(i);
    end else Inc(i);
  end;
  if FShowProgress then
    FProgress.Tick;
  Reorder := False;
  if Vert and (FMaxCellHeight > 0) then
    for i := 0 to List.Count - 2 do
    begin
      pos1 := TfrxIEMPos(List[i]).Value;
      pos2 := TfrxIEMPos(List[i + 1]).Value;
      if pos2 - pos1 > FMaxCellHeight then
      begin
        Cnt := Round(Int((pos2 - pos1) / FMaxCellHeight));
        for j := 1 to Cnt do
          AddPos(List, pos1 + FMaxCellHeight * j);
        Reorder := True;
      end;
    end;
  if FShowProgress then
    FProgress.Tick;
  if (not Vert) and (FMaxCellWidth > 0) then
    for i := 0 to List.Count - 2 do
    begin
      pos1 := TfrxIEMPos(List[i]).Value;
      pos2 := TfrxIEMPos(List[i + 1]).Value;
      if pos2 - pos1 > FMaxCellWidth then
      begin
        Cnt := Round(Int((pos2 - pos1) / FMaxCellWidth));
        for j := 1 to Cnt do
          AddPos(List, pos1 + FMaxCellWidth * j);
        Reorder := True;
      end;
    end;
  if Reorder then
    List.Sort(SortPosCompare);
  if FShowProgress then
    FProgress.Tick;
end;

procedure TfrxIEMatrix.Prepare;
var
  Style: TfrxIEMStyle;
  FObj: TfrxIEMObject;
  FObjItem: TfrxIEMObjectList;

begin
  if FShowProgress then
  begin
    FProgress := TfrxProgress.Create(nil);
    FProgress.Execute(11, frxResources.Get('ProgressWait'), false, true);
  end;
  if FFillArea then
  begin
    Style := TfrxIEMStyle.Create;
    Style.FrameTyp := [];
    Style.Color := clWhite;
    FObj := TfrxIEMObject.Create;
    FObj.StyleIndex := AddStyleInternal(Style);
    FObj.Style := Style;
    if FCropFillArea then
    begin
      FObj.Left := FMinLeft;
      FObj.Top := FMinTop;
    end
    else
    begin
      FObj.Left := 0;
      FObj.Top := 0;
    end;
    FObj.Width := MaxWidth;
    FObj.Height := MaxHeight;
    FObj.IsText := True;
    AddPos(FXPos, 0);
    AddPos(FYPos, 0);
    FObjItem := TfrxIEMObjectList.Create;
    FObjItem.x := 0;
    FObjItem.y := 0;
    FObjItem.dx := 1;
    FObjItem.dy := 1;
    FObjItem.Obj := FObj;
    FIEMObjectList.Insert(0, FObjItem);
  end;
  OrderByCells;
  FWidth := FXPos.Count;
  FHeight := FYPos.Count;
  Render;
  Analyse;
  if FOptFrames then
    OptimizeFrames;
  if FShowProgress then
    FProgress.Free;
end;

procedure TfrxIEMatrix.Render;
var
  i, old: integer;
  obj: TfrxIEMObjectList;
  Style: TfrxIEMStyle;
  OldColor: TColor;
begin
  SetLength(FMatrix, FWidth * FHeight);
  FillArea(0, 0, FWidth, FHeight, -1);
  for i := 0 to FIEMObjectList.Count - 1 do
  begin
    obj := TfrxIEMObjectList(FIEMObjectList[i]);
    if (Obj.Obj.Style <> nil) and (Obj.Obj.Style.Color = clNone) then
    begin
      old := GetCell(obj.x, obj.y);
      if old <> -1 then
      begin
        OldColor := TfrxIEMObjectList(FIEMObjectList[Old]).Obj.Style.Color;
        if (OldColor <> Obj.Obj.Style.Color) and (OldColor <> Obj.Obj.Style.Font.Color) then
        begin
          Style := TfrxIEMStyle.Create;
          Style.Assign(Obj.Obj.Style);
          Style.Color := OldColor;
          Obj.Obj.StyleIndex := AddStyleInternal(Style);
          Obj.Obj.Style := TfrxIEMStyle(FIEMStyleList[Obj.Obj.StyleIndex]);
        end;
      end;
    end;
    FillArea(obj.x, obj.y, obj.dx, obj.dy, i);
  end;
  if FShowProgress then
    FProgress.Tick;
end;

procedure TfrxIEMatrix.ReplaceArea(ObjIndex, x, y, dx, dy, Value: integer);
var
  i, j: integer;
begin
  for i := y to y + dy - 1 do
    for j := x to x + dx - 1 do
      if GetCell(j, i) = ObjIndex then
        SetCell(j, i, Value);
end;

procedure TfrxIEMatrix.SetCell(x, y, Value: integer);
begin
  if (x < FWidth) and (y < FHeight) and (x >= 0) and (y >= 0) then
    FMatrix[FWidth * y + x] := Value;
end;


{ TfrxIEMObjectList }

constructor TfrxIEMObjectList.Create;
begin
  Exist := False;
end;

destructor TfrxIEMObjectList.Destroy;
begin
  Obj.Free;
  inherited;
end;

{ TfrxIEMStyle }

procedure TfrxIEMStyle.Assign(Style: TfrxIEMStyle);
begin
  Font.Assign(Style.Font);
  LineSpacing := Style.LineSpacing;
  GapX := Style.GapX;
  GapY := Style.GapY;
  VAlign := Style.VAlign;
  HAlign := Style.HAlign;
  FrameTyp := Style.FrameTyp;
  FrameWidth := Style.FrameWidth;
  FrameColor := Style.FrameColor;
  FrameStyle := Style.FrameStyle;
  Color := Style.Color;
  Rotation := Style.Rotation;
  BrushStyle := Style.BrushStyle;
end;

constructor TfrxIEMStyle.Create;
begin
  Font := TFont.Create;
end;

destructor TfrxIEMStyle.Destroy;
begin
  Font.Free;
  inherited;
end;

{ TfrxIEMObject }

constructor TfrxIEMObject.Create;
begin
  FMemo := TStringList.Create;
  FDisplayFormat := TfrxFormat.Create;
  FDisplayFormat.DecimalSeparator := '';
  FDisplayFormat.FormatStr := '';
  FDisplayFormat.Kind := fkText;
  Left := 0;
  Top := 0;
  Image := nil;
  FParent := nil;
  FCounter := 0;
  FIsText := true;
  FIsRichText := false;
  FIsDialogObject := False;
  FLink := nil;
end;

destructor TfrxIEMObject.Destroy;
begin
  FMemo.Free;
  FDisplayFormat.Free;
  if Assigned(FImage) then
    FImage.Free;
  inherited;
end;

procedure TfrxIEMObject.SetDisplayFormat(const Value: TfrxFormat);
begin
  FDisplayFormat.Assign(Value);
end;

procedure TfrxIEMObject.SetMemo(const Value: TStrings);
begin
  FMemo.Assign(Value);
end;

end.
