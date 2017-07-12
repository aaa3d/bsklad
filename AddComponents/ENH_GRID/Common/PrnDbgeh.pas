{*******************************************************}
{                                                       }
{                       EhLib v1.5                      }
{                TPrintDBGridEh component               }
{                                                       }
{   Copyright (c) 1998, 1999 by Dmitry V. Bolshakov     }
{                                                       }
{*******************************************************}

unit PrnDbgeh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, DBGridEh, PrntsEh,PrViewEh,
  Forms,DB, Grids, StdCtrls;

type
  TMeasureUnits = (MM,Inches);
  TPrintDBGridEhOption = (pghFitGridToPageWidth, pghColored, pghRowAutoStretch);
  TPrintDBGridEhOptions = set of TPrintDBGridEhOption;


  TPageParams = class(TPersistent)
  private
//    FColumns: Integer;
//    FColumnSpace: Currency;
    FBottomMargin: Currency;
    FRightMargin: Currency;
    FLeftMargin: Currency;
    FTopMargin: Currency;
    procedure SetBottomMargin(const Value: Currency);
//    procedure SetColumns(const Value: Integer);
//    procedure SetColumnSpace(const Value: Currency);
    procedure SetLeftMargin(const Value: Currency);
    procedure SetRightMargin(const Value: Currency);
    procedure SetTopMargin(const Value: Currency);
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
  published
    property BottomMargin:Currency read FBottomMargin write SetBottomMargin;
    property LeftMargin:Currency read FLeftMargin write SetLeftMargin;
    property RightMargin:Currency read FRightMargin write SetRightMargin;
    property TopMargin:Currency read FTopMargin write SetTopMargin;
//    property Columns:Integer read FColumns write SetColumns;
//    property ColumnSpace:Currency read FColumnSpace write SetColumnSpace;
  end;

  TPageColontitleLineType = (pcltNon,pcltSingleLine,pcltDoubleLine);

  TPageColontitle = class(TPersistent)
  private
    FCenterText: TStrings;
    FLeftText: TStrings;
    FRightText: TStrings;
    FFont: TFont;
    FLineType: TPageColontitleLineType;
    procedure SetCenterText(const Value: TStrings);
    procedure SetFont(const Value: TFont);
    procedure SetLeftText(const Value: TStrings);
    procedure SetRightText(const Value: TStrings);
    procedure SetLineType(const Value: TPageColontitleLineType);
  public
    procedure Assign(Source: TPersistent); override;
    constructor Create;
    destructor Destroy; override;
  published
    property LeftText:TStrings read FLeftText write SetLeftText;
    property CenterText:TStrings read FCenterText write SetCenterText;
    property RightText:TStrings read FRightText write SetRightText;
    property Font:TFont read FFont write SetFont;
    property LineType: TPageColontitleLineType read FLineType write SetLineType default pcltNon;
  end;

  TPrintDBGridEh = class(TComponent)
  private
    FDBGridEh: TDBGridEh;
    FUnits: TMeasureUnits;
    FTitle: TStrings;
    FPrintFontName: String;
    FOptions: TPrintDBGridEhOptions;
    FPage: TPageParams;
    FPageFooter: TPageColontitle;
    FPagEheader: TPageColontitle;
    FOnPrinterSetupDialog: TNotifyEvent;
    procedure SetDBGridEh(const Value: TDBGridEh);
    procedure SetUnits(const Value: TMeasureUnits);
    procedure SetTitle(const Value: TStrings);
    procedure SetPrintFontName(const Value: String);
    procedure SetOptions(const Value: TPrintDBGridEhOptions);
    procedure SetPage(const Value: TPageParams);
    procedure SetPageFooter(const Value: TPageColontitle);
    procedure SetPagEheader(const Value: TPageColontitle);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure PrinterSetupDialogPreview(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Preview;
    procedure Print;
    function PrinterSetupDialog:Boolean;
    procedure PrintTo(VPrinter:TVirtualPrinter);
  published
    property DBGridEh:TDBGridEh read FDBGridEh write SetDBGridEh;
    property Options:TPrintDBGridEhOptions read FOptions write SetOptions;
    property Page:TPageParams read FPage write SetPage;
    property PageFooter:TPageColontitle read FPageFooter write SetPageFooter;
    property PageHeader:TPageColontitle read FPageHeader write SetPageHeader;
    property PrintFontName:String read FPrintFontName write SetPrintFontName;
    property Title:TStrings read FTitle write SetTitle;
    property Units:TMeasureUnits read FUnits write SetUnits;
    property OnPrinterSetupDialog: TNotifyEvent read FOnPrinterSetupDialog write FOnPrinterSetupDialog;
  end;


implementation

uses PrnDGDlg;

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

function iif(Condition:Boolean;V1,V2:Integer):Integer;
begin
  if (Condition) then Result := V1 else Result := V2;
end;


{new WriteTextEh}{}
function WriteTextEh(ACanvas: TCanvas; ARect: TRect; FillRect:Boolean; DX, DY: Integer;
  const Text: string; Alignment: TAlignment; Layout: TTextLayout; MultyL:Boolean;
  EndEllipsis:Boolean; LeftMarg,RightMarg:Integer; CalcRect:Boolean):Integer;
var opt:Integer;
   tm: TTEXTMETRIC;
begin
 Result := 0;
 if CalcRect = False then begin
//   Dec(ARect.Top,(tm.tmExternalLeading + tm.tmInternalLeading) div 2); //Dec(ARect.Bottom,tm.tmExternalLeading);
   DBGridEh.WriteTextEh(ACanvas,ARect,FillRect,DX,DY,Text,Alignment,Layout,MultyL,EndEllipsis,LeftMarg,RightMarg)
 end else begin
    GetTextMetrics(ACanvas.Handle, tm);
    Inc(ARect.Left,DX);  Inc(ARect.Top,DY);
    Dec(ARect.Right,DX);  Dec(ARect.Bottom,DY);
    opt := DT_LEFT or DT_EXPANDTABS or DT_NOPREFIX or DT_CALCRECT;
    if MultyL then opt := opt or DT_WORDBREAK;
    Result := DrawTextEx(ACanvas.Handle, PChar(Text), Length(Text), ARect, opt, nil);
    Inc(Result,tm.tmExternalLeading);
    Inc(Result,DY*2);
 end;
end;

{$IFNDEF VER120} {Borland Delphi 3.0 }
type TReplaceFlags = set of (rfReplaceAll, rfIgnoreCase);
{$ENDIF}

function StringReplaceMacros(const S, OldPattern, NewPattern: string;
  Flags: TReplaceFlags; MacroChar: Char): string;
var
  SearchStr, Patt, NewStr: string;
  Offset: Integer;
begin
  if rfIgnoreCase in Flags then
  begin
    SearchStr := AnsiUpperCase(S);
    Patt := AnsiUpperCase(OldPattern);
  end else
  begin
    SearchStr := S;
    Patt := OldPattern;
  end;
  NewStr := S;
  Result := '';
  while SearchStr <> '' do
  begin
    Offset := AnsiPos(Patt, SearchStr);
    if Offset = 0 then
    begin
      Result := Result + NewStr;
      Break;
    end;
    if (Offset = 1) or (SearchStr[Offset-1] <> MacroChar) then
      Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern
    else
      Result := Result + Copy(NewStr, 1, Offset - 1) + OldPattern;
    NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
    if not (rfReplaceAll in Flags) then
    begin
      Result := Result + NewStr;
      Break;
    end;
    SearchStr := Copy(SearchStr, Offset + Length(Patt), MaxInt);
  end;
end;

function GetStingListText(sl:TStrings):String;
begin
  Result := Copy(sl.Text,1,Length(sl.Text)-2);
end;

{ TPrintDBGridEh }

constructor TPrintDBGridEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPage := TPageParams.Create;
  FPageFooter := TPageColontitle.Create;
  FPagEheader := TPageColontitle.Create;
  FTitle := TStringList.Create;
end;

destructor TPrintDBGridEh.Destroy;
begin
  Page.Free;
  PageFooter.Free;
  PagEheader.Free;
  FTitle.Free;
  inherited Destroy;
end;

{procedure TPrintDBGridEh.Print;
var ARepGrid:TReportGrid;
begin
    ARepGrid := TReportGrid.Create(Application);
  try
    ARepGrid.Visible := False;
    ARepGrid.Parent := Application.MainForm;

    ARepGrid.DefaultDrawing := False;
    ARepGrid.Align := alClient;
    if (PrintFontName <> '') then
      ARepGrid.Font.Name := PrintFontName;
    ARepGrid.AutoStretch := AutoStretch;
    ARepGrid.UseMultiTitle := DBGridEh.UseMultiTitle;
    ARepGrid.Title := Title;
    ARepGrid.CreateColumnsFromDBGridEh(DBGridEh);
    ARepGrid.Groups[0].AutoStretch := AutoStretch;
    ARepGrid.TopLeftPrintText := LeftTopText;
    ARepGrid.TopRightPrintText := RightTopText;
    ARepGrid.FillData;
    ARepGrid.FitWidthToPage :=  FitGridToPageWidth in Options;
    ARepGrid.Print;
  finally
    ARepGrid.Free;
  end;
end;}

procedure TPrintDBGridEh.Preview;
begin
  if Assigned(OnPrinterSetupDialog) then
    PrinterPreview.OnPrinterSetupDialog := OnPrinterSetupDialog
  else
    PrinterPreview.OnPrinterSetupDialog := PrinterSetupDialogPreview;
  PrinterPreview.PrinterSetupOwner := Self;
  PrintTo(PrinterPreview);
end;

procedure TPrintDBGridEh.PrintTo(VPrinter:TVirtualPrinter);
type
 TPolyBookmark = record
   bm:TBookmarkStr;
   InDS:Boolean;
   EOF:Boolean;
 end;

var
  ColsToPages, PrnRowHeights, PrnColWIdths: TList;
  GridWidth, RealRight,  RealLeft, MinRowHeight: Integer;
  {fPrnPhysWidth,fPrnPhysHeight,} fPrnPhysOffSetX, fPrnPhysOffSetY : Integer;
  fPrnHorsRes, fPrnVertRes, PrnTitlEh, PenW, PrnTitleTextH: Integer;
  PrintRec: TRect;
  fLogPelsX1, fLogPelsY1, fLogPelsX2, fLogPelsY2, fScaleX, fScaleY: Double;
  //TopFooterPos, TopHeaderPos:Integer;
  //FromRow, ToRow, NodeLevel, PageNo, GridRowCount: Integer;
  SavedBookMark:TBookmarkStr;
  PBm1,PBm2:TPolyBookmark;
  PSX1,PSY1,PSX2,PSY2:Integer;
  FirtsPage,AWordWrap:Boolean;
  PolyPolyPoints, PolyLengths:TList;
  TitleRect,FooterRect: TRect;

const Macros : array [0..4] of String = ( '&[Page]', '&[ShortDate]', '&[Date]', '&[LongDate]', '&[Time]');
      MacroValues : array [0..4] of String = ('','','','','');


  procedure InitMacroValues;
  begin
    MacroValues[1] := DateToStr(Now);
    MacroValues[2] := DateToStr(Now);
    MacroValues[3] := FormatDateTime(LongDateFormat,Now);
    MacroValues[4] := TimeToStr(Now);
  end;

  procedure InitPolyBookmark(var APBm:TPolyBookmark);
  begin
   if DBGridEh.DataSource.DataSet.Eof then begin
     APBm.InDS := False;
     APBm.bm := '';//nil;
     if (DBGridEh.FooterRowCount = 0) then APBm.EOF := True
     else begin
       APBm.bm := '0';//Pointer(0);
       APBm.EOF := False;
     end;
   end else begin
     APBm.InDS := True;
     APBm.bm := DBGridEh.DataSource.DataSet.Bookmark;
     APBm.EOF := False;
   end;
  end;

  procedure GotoPolyBookmark(var APBm:TPolyBookmark);
  begin
    if (APBm.InDS = True) then DBGridEh.DataSource.DataSet.GotoBookmark(TBookmark(APBm.bm));
  end;

  procedure SetNextPolyBookmark(var APBm:TPolyBookmark);
  begin
    if APBm.EOF then Exit;

    if (APBm.InDS = True) then begin
      DBGridEh.DataSource.DataSet.Next;
      if DBGridEh.DataSource.DataSet.Eof then begin
        APBm.InDS := False;
        APBm.bm := '';//nil;
        if (DBGridEh.FooterRowCount = 0) then APBm.EOF := True
        else begin
          APBm.bm := '0';//Pointer(0);
          APBm.EOF := False;
        end;
      end else begin
        APBm.bm := DBGridEh.DataSource.DataSet.Bookmark;
        APBm.EOF := False;
      end
    end
    else begin
      if (DBGridEh.FooterRowCount-1 <= Integer(APBm.bm)) then begin
        APBm.EOF := True;
        APBm.bm := '0';//Pointer(0);
        APBm.InDS := False;
      end
      else begin
        APBm.bm := IntToStr(StrToInt(APBm.bm) + 1);
      end;
    end;
  end;

  function ComparePolyBookmark(var APBm1,APBm2:TPolyBookmark):Boolean;
  begin
    if (APBm1.bm = APBm2.bm) and (APBm1.InDS = APBm2.InDS) then
      Result := True
    else Result := False;
  end;

  // Add Polyline
  procedure AddPolyline(const Args: array of const);
  var i: Integer;
  begin
    for i := 0 to High(Args) do
      PolyPolyPoints.Add(Pointer(Args[i].VInteger));
    PolyLengths.Add(Pointer((High(Args)+1) div 2));
  end;

  // -------CalcColsToPages
  procedure CalcColsToPages;
  var curX,w: Integer;
      i:Integer;
  begin
   curX := PrintRec.Left + PenW;
   PrnColWIdths.Clear;
   for i := 0 to DBGridEh.VisibleColumns.Count - 1 do begin
     w := Round((DBGridEh.VisibleColumns[i].Width + 1) * fScaleX);
     if ( w > PrintRec.Right - PrintRec.Left) then w := PrintRec.Right - PrintRec.Left;   
     PrnColWidths.Add(Pointer(w));
     curX := curX + w;
     if (curX > PrintRec.Right) and (i > 0) then begin
       ColsToPages.Add(Pointer(i-1));
       curX := PrintRec.Left + w + PenW;
     end;
   end;
   ColsToPages.Add(Pointer(DBGridEh.VisibleColumns.Count - 1));
  end;

  //------------------------
  function GetScaledRealGridWidth:Integer;
  var i: Integer;
  begin
   Result := PenW;
   for i := 0 to DBGridEh.VisibleColumns.Count - 1 do begin
     Result := Result + Round((DBGridEh.VisibleColumns[i].Width + 1) * fScaleX);
   end;
  end;

  //------------------------
  function GetPrintGridWidth:Integer;
  var i: Integer;
  begin
   Result := 0;
   for i := 0 to PrnColWidths.Count - 1 do begin
     Result := Result + Integer(PrnColWidths[i]);
   end;
  end;


  //--------------------------
  procedure SetIfNeedFitWidthMapMode;
  var dc :Integer;
  begin
     if GridWidth > (RealRight - RealLeft) then begin
       dc := SetMapMode(VPrinter.Canvas.Handle, MM_ISOTROPIC);
       if (dc = 0) then Raise Exception.Create(' function SetMapMode(Handle, MM_ISOTROPIC) has returned 0 ');
       SetWindowOrgEx(VPrinter.Canvas.Handle,0,0,nil);
       SetWindowExtEx(VPrinter.Canvas.Handle, GridWidth, GridWidth, nil);
       SetViewportExtEx(VPrinter.Canvas.Handle, RealRight - RealLeft, RealRight - RealLeft, nil);
     end;
  end;

  //------------------------
  procedure ResetPrinterCanvas;
  begin
    VPrinter.Canvas.Pen.Width := PenW;
    VPrinter.Canvas.BRUSH.Style := bsClear;
    VPrinter.Canvas.Brush.Color := clWhite;
    VPrinter.Canvas.Font := DBGridEh.Font;
    if (pghFitGridToPageWidth in Options) then SetIfNeedFitWidthMapMode;
  end;

  //--------------------------
  procedure CalcDeviceCaps;
  var Diver:Double;
  begin
(*     fPrnPhysWidth :=  GetDeviceCaps(VPrinter.Canvas.Handle,PHYSICALWIDTH);
     fPrnPhysHeight :=  GetDeviceCaps(VPrinter.Canvas.Handle,PHYSICALHEIGHT);
*)
//     fPrnPhysOffSetX := GetDeviceCaps(VPrinter.Canvas.Handle,PHYSICALOFFSETX);
     fPrnPhysOffSetX := (VPrinter.FullPageWidth - VPrinter.PageWidth) div 2;
//     fPrnPhysOffSetY := GetDeviceCaps(VPrinter.Canvas.Handle,PHYSICALOFFSETY);
     fPrnPhysOffSetY := (VPrinter.FullPagEheight - VPrinter.PagEheight) div 2;

     //fPrnHorsRes :=  GetDeviceCaps(VPrinter.Canvas.Handle,HORZRES);
     fPrnHorsRes := VPrinter.PageWidth;
     //fPrnVertRes :=  GetDeviceCaps(VPrinter.Canvas.Handle,VERTRES);
     fPrnVertRes := VPrinter.PagEheight;

     fLogPelsX1 := GetDeviceCaps(DBGridEh.Canvas.Handle, LOGPIXELSX);
     fLogPelsY1 := GetDeviceCaps(DBGridEh.Canvas.Handle, LOGPIXELSY);

     if VPrinter.Printers.Count > 0 then
     begin
       fLogPelsX2 :=  GetDeviceCaps(VPrinter.Handle, LOGPIXELSX);
       fLogPelsY2 :=  GetDeviceCaps(VPrinter.Handle, LOGPIXELSY);
     end else begin
       fLogPelsX2 :=  DefaultPrinterPixelsPerInchX;
       fLogPelsY2 :=  DefaultPrinterPixelsPerInchY;
     end;


     if (fLogPelsX1 > fLogPelsX2) then
         fScaleX := (fLogPelsX1 / fLogPelsX2)
     else
         fScaleX := (fLogPelsX2 / fLogPelsX1);

     if (fLogPelsY1 > fLogPelsY2) then
         fScaleY := (fLogPelsY1 / fLogPelsY2)
     else
         fScaleY := (fLogPelsY2 / fLogPelsY1);

     if Units = MM then Diver := 2.54 else Diver := 1;
     PrintRec.Left :=  Round(fLogPelsX2 * Page.LeftMargin / Diver ) - fPrnPhysOffSetX;
     PrintRec.Top :=  Round(fLogPelsY2 * Page.TopMargin / Diver ) - fPrnPhysOffSetY;
     PrintRec.Right :=  fPrnHorsRes - Round(fLogPelsX2 * Page.RightMargin / Diver ) + fPrnPhysOffSetX;
     PrintRec.Bottom := fPrnVertRes - Round(fLogPelsY2 * Page.BottomMargin / Diver ) + fPrnPhysOffSetY;

     PSX1 := Round(fScaleX); PSX2 := Round(fScaleX*2);
     PSY1 := Round(fScaleY); PSY2 := Round(fScaleY*2);
     PenW := Trunc((fLogPelsX2 + fLogPelsY2)/200); // PenWidth = 0.01 Inche
     //if (PenW mod 2 = 0) then Inc(PenW);           // Must be uneven

     if (pghFitGridToPageWidth in Options) then begin // On width of page
       GridWidth := GetScaledRealGridWidth;
       RealRight := PrintRec.Right; RealLeft := PrintRec.Left;
       SetIfNeedFitWidthMapMode;

       if GridWidth > (RealRight - RealLeft) then begin
         PrintRec.Right := MulDiv(PrintRec.Right,GridWidth,RealRight - RealLeft); // Оставить поле старого размера
         PrintRec.Left := MulDiv(PrintRec.Left,GridWidth,RealRight - RealLeft);
         PrintRec.Top := MulDiv(PrintRec.Top,GridWidth,RealRight - RealLeft);
         PrintRec.Bottom := MulDiv(PrintRec.Bottom,GridWidth,RealRight - RealLeft);
       end;
     end;


     {TopFooterPos := PrintRec.Bottom - Round(fLogPelsX2 / 4);  // 1/4 дюйма
     PrintRec.Bottom := TopFooterPos - 1;

     TopHeaderPos := PrintRec.Top;
     PrintRec.Top := PrintRec.Top + Round(fLogPelsX2 / 4) + 1; //  Header (TopHeaderPos, PrintRec.Top - 1)
     }
  end;

  // -------CalcPrnRowH
  function DrawCell(ACol:Integer; ARect:TRect; var APBmFrom:TPolyBookmark; CalcRect:Boolean):Integer;
  const
    CheckBoxFlags: array [TCheckBoxState] of Integer =
      ( DFCS_BUTTONCHECK,  DFCS_BUTTONCHECK or DFCS_CHECKED,  DFCS_BUTTON3STATE or DFCS_CHECKED );
  var CurColumn:TColumnEh;
      KeyIndex:Integer;
      NewBackgrnd:TColor;
      AState: TGridDrawState;
      AAlignment:TAlignment;
      Value:String;
      bm:TBitmap;
      dr,ARect1:TRect;
      oldColor:TColor;
      Stretch:Boolean;
//      tm: TTEXTMETRIC;
  begin
    Result := 0;
    CurColumn := DBGridEh.VisibleColumns[ACol];
    AState := [];
    NewBackgrnd := clWhite;
    ARect1 := ARect;
    Inc(ARect.Left,PSX2);  Inc(ARect.Top,PSY2);
    Dec(ARect.Right,PSX2);  Dec(ARect.Bottom,PSY2);
    if CalcRect then Stretch := pghRowAutoStretch in Options else Stretch := AWordWrap;

    if APBmFrom.InDS then begin
      if pghColored in Options then NewBackgrnd := CurColumn.Color;

      VPrinter.Canvas.Font := CurColumn.Font;
      if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;

      if Assigned(DBGridEh.OnGetCellParams) then
          DBGridEh.OnGetCellParams(Self, CurColumn, VPrinter.Canvas.Font, NewBackgrnd, AState);
      VPrinter.Canvas.Brush.Color := NewBackgrnd;

      if not CalcRect and (VPrinter.Canvas.Brush.Color <> clWhite) then
      begin
        oldColor := VPrinter.Canvas.Pen.Color;
        VPrinter.Canvas.Pen.Color := VPrinter.Canvas.Brush.Color;
        VPrinter.Canvas.Rectangle(ARect1.Left,ARect1.Top,ARect1.Right,ARect1.Bottom);
        VPrinter.Canvas.Pen.Color := oldColor;
      end;

      if (CurColumn.GetColumnType = ctCheckboxes) and not CalcRect then begin
        dr.Left := ARect.Left + iif(ARect.Right - ARect.Left < Trunc(FCheckBoxWidth * fScaleX),0,
              (ARect.Right - ARect.Left) shr 1 - Trunc(FCheckBoxWidth * fScaleX) shr 1);
        dr.Right :=  iif(ARect.Right - ARect.Left < Trunc(FCheckBoxWidth * fScaleX),ARect.Right,
               dr.Left + Trunc(FCheckBoxWidth * fScaleX));
        dr.Top := ARect.Top + iif(ARect.Bottom - ARect.Top < Trunc(FCheckBoxHeight * fScaleY),0,
              (ARect.Bottom - ARect.Top) shr 1 - Trunc(FCheckBoxHeight * fScaleY) shr 1);
        dr.Bottom := iif(ARect.Bottom - ARect.Top < Trunc(FCheckBoxHeight * fScaleY),ARect.Bottom,
              dr.Top + Trunc(FCheckBoxHeight * fScaleY));
        DrawFrameControl(VPrinter.Canvas.Handle,dr,DFC_BUTTON,CheckBoxFlags[CurColumn.CheckboxState]);
      end else
      if (CurColumn.GetColumnType = ctKeyImageList) and not CalcRect then begin
        KeyIndex := CurColumn.KeyList.IndexOf(CurColumn.Field.Text);
        if KeyIndex = -1 then KeyIndex := CurColumn.NotInKeyListIndex;
        bm := TBitmap.Create;
        oldColor := CurColumn.ImageList.BkColor;
        CurColumn.ImageList.BkColor := clWhite;
        try
          CurColumn.ImageList.GetBitmap(KeyIndex,bm);
        finally
          CurColumn.ImageList.BkColor := oldColor;
        end;
        dr := Rect(0,0,Trunc(CurColumn.ImageList.Height * fScaleY),Trunc(CurColumn.ImageList.Width * fScaleX));
        dr.Left := ARect.Left + (ARect.Right - ARect.Left) div 2 - dr.Right div 2;
        dr.Right := dr.Right + dr.Left;
        dr.Top := ARect.Top + (ARect.Bottom - ARect.Top) div 2 - dr.Bottom div 2;
        dr.Bottom := dr.Bottom + dr.Top;
        VPrinter.Canvas.StretchDraw(dr,bm);
        bm.Free;
      end else begin
        {if not CalcRect and (ACol mod 2 = 0)then begin
          //VPrinter.Canvas.Rectangle(ARect.Left,ARect.Top,ARect.Right,ARect.Bottom);
          GetTextMetrics(VPrinter.Canvas.Handle, tm);
          VPrinter.Canvas.TextOut(ARect.Left,ARect.Top,CurColumn.DisplayText);
          VPrinter.Canvas.TextOut(0,0-tm.tmExternalLeading,'WgWgWg');
          KeyIndex := VPrinter.Canvas.TextHeight('MgWgWgWg');
          VPrinter.Canvas.MoveTo(0,KeyIndex);
          VPrinter.Canvas.LineTo(500,KeyIndex);
        end else}
          Result := WriteTextEh(VPrinter.Canvas, ARect, False, 0, 0,  CurColumn.DisplayText,
             CurColumn.Alignment, tlTop, Stretch, CurColumn.EndEllipsis, 0, 0,CalcRect) + PSY2*2;
      end;
    end else begin
      AAlignment := CurColumn.Footer.Alignment;
      Value := DBGridEh.GetFooterValue(Integer(APBmFrom.bm),CurColumn);

      if pghColored in Options then NewBackgrnd := CurColumn.Footer.Color;
      VPrinter.Canvas.Font := CurColumn.Footer.Font;
      if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;

      if Assigned(DBGridEh.OnGetFooterParams) then
        DBGridEh.OnGetFooterParams(Self, 1, Integer(APBmFrom.bm), CurColumn, VPrinter.Canvas.Font,
             NewBackgrnd, AAlignment, AState,Value);
      VPrinter.Canvas.Brush.Color := NewBackgrnd;

      if not CalcRect and (VPrinter.Canvas.Brush.Color <> clWhite) then
      begin
        oldColor := VPrinter.Canvas.Pen.Color;
        VPrinter.Canvas.Pen.Color := VPrinter.Canvas.Brush.Color;
        VPrinter.Canvas.Rectangle(ARect1.Left,ARect1.Top,ARect1.Right,ARect1.Bottom);
        VPrinter.Canvas.Pen.Color := oldColor;
      end;

      Result := WriteTextEh(VPrinter.Canvas, ARect, False, 0, 0,  Value,
          AAlignment, tlTop, Stretch, CurColumn.Footer.EndEllipsis, 0, 0,CalcRect) + PSY2*2;
    end;
  end;

  //--------------------------
  function CalcPrintRows(APBmFrom:TPolyBookmark; PrnTop, PrnBottom:Integer):TPolyBookmark;
  var i,rh,ch,cPos,hLimit:Integer;
      r:TRect;
  begin
    PrnRowHeights.Clear;
    GotoPolyBookmark(APBmFrom);
    Result := APBmFrom;
    cPos := PrintRec.Top;
    hLimit := PrintRec.Bottom;
    while True do begin
      ch := 0;
      for i := 0 to DBGridEh.VisibleColumns.Count - 1 do begin
        SetRect(r,0,0,0,0);
        r.Right := Integer(PrnColWIdths[i]);
        rh := DrawCell(i,r,APBmFrom,True);
        if ch < rh then ch := rh;
      end;

      if ch < MinRowHeight then ch := MinRowHeight;  
      Inc(cPos,ch);
      if (cPos > hLimit) or APBmFrom.EOF then begin
        Result := APBmFrom;
        Exit;
      end;

      Result := APBmFrom;
      SetNextPolyBookmark(APBmFrom);
      PrnRowHeights.Add(Pointer(ch));
    end;
  end;

  //---------------------------
  procedure PrintGridTitleTextHeight(FromCol,ToCol:Integer);
  var r:TRect;
      i,lm,rm,tm:Integer;
  begin
    r := Rect(PrintRec.Left,PrintRec.Top-PrnTitlEh-PrnTitleTextH,PrintRec.Left,PrintRec.Top-PrnTitlEh);
    for i := FromCol to ToCol do Inc(r.Right,Integer(PrnColWidths[i]));

    if (Title.Text <> '') then begin
      VPrinter.Canvas.Font := DBGridEh.TitleFont;
      if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;
      r := Rect(PrintRec.Left,PrintRec.Top-PrnTitlEh-PrnTitleTextH,r.Right,PrintRec.Top-PrnTitlEh);
      lm := PSX2; // if FromCol = 0 then lm := PSX2 else lm := 0;
      rm := PSX2; //if ToCol = DBGridEh.VisibleColumns.Count-1 then rm := PSX2 else  rm := 0;
      for i := 0 to FromCol-1 do Dec(lm,Integer(PrnColWidths[i]));
      for i := ToCol+1 to DBGridEh.VisibleColumns.Count-1 do Dec(rm,Integer(PrnColWidths[i]));
      if DBGridEh.UseMultiTitle then tm := Round(DBGridEh.VTitleMargin*fScaleY/2) else tm := PSY2;
      if pghColored in Options then VPrinter.Canvas.Brush.Color := DBGridEh.FixedColor;
      WriteTextEh(VPrinter.Canvas, r, pghColored in Options, 0, tm,  GetStingListText(Title),
          taCenter, tlTop, True, False, lm, rm,False);
      AddPolyline([r.Left,r.Bottom, r.Left,r.Top, r.Right,r.Top, r.Right,r.Bottom]);
    end;
  end;

  // -------PrintSimpleTitle
  procedure PrintSimpleTitle(FromCol,ToCol:Integer);
  var r:TRect;
      i:Integer;
  begin
    r := Rect(PrintRec.Left,PrintRec.Top-PrnTitlEh,PrintRec.Left,PrintRec.Top);

    for i := FromCol to ToCol do begin
      Inc(r.Right,Integer(PrnColWidths[i]));
      VPrinter.Canvas.Font := DBGridEh.VisibleColumns[i].Title.Font;
      if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;
      if pghColored in Options then VPrinter.Canvas.Brush.Color := DBGridEh.FixedColor;
      WriteTextEh(VPrinter.Canvas, r, pghColored in Options, PSX2, PSY2,  DBGridEh.VisibleColumns[i].Title.Caption,
          DBGridEh.VisibleColumns[i].Title.Alignment, tlTop, False,
          DBGridEh.VisibleColumns[i].Title.EndEllipsis, 0, 0,False);
      AddPolyline([r.Left,r.Bottom, r.Right,r.Bottom, r.Right,r.Top]);
      r.Left := r.Right;
    end;
    r.Left := PrintRec.Left;
    AddPolyline([r.Left,r.Bottom, r.Left,r.Top, r.Right,r.Top]);
    PrintGridTitleTextHeight(FromCol,ToCol);
  end;

  // -------PrintTitle Печать заголовка
  procedure PrintMultyTitle(FromCol,ToCol:Integer);
  var  i, RightSide:Integer;
       r,r1:TRect;
       lpDTP :  TDrawTextParams;
       s:String;
       //PTNode,NextNode,ToColNode:THeadTreeNode;
       PLeftTop,PRightTop,PRightLow:TPoint;

    function GetColNumByVisColNum(AVisColNum:Integer):Integer;
    var i:Integer;
    begin
      Result := -1; i := 0;
      while not DBGridEh.Columns[i].Visible do
        Inc(i);
      for i := i to DBGridEh.Columns.Count-1 do
      begin
        if DBGridEh.Columns[i].Visible then
          Inc(Result);
        if Result = AVisColNum then
        begin
          Result := i;
          Break;
        end;
      end;
    end;

    procedure PrintTitleRecurs(ANode:THeadTreeNode; ARect:TRect);
    var r,r1:TRect;
        s:String;
        lx, rx, xx:Integer;
        an,nn:THeadTreeNode;
        lpDTP :  TDrawTextParams;
    begin
        if (ANode.Host.Host = nil) then Exit;
        s := ANode.Host.Text;
        lx := -(ARect.Left - PrintRec.Left );
        r.Bottom := ARect.Top;
        r.Top := r.Bottom - ANode.Host.HeightPrn;
        an := ANode; nn := ANode.Host.Child;
        while an <> nn do begin // двигаемся вперед до Child
          Inc(lx,nn.WidthPrn);
          nn := nn.Next;
        end;
        if (lx > 0) then begin
          r.Left := PrintRec.Left;
          xx := ANode.Host.WidthPrn - lx + PrintRec.Left;
        end else begin
          r.Left := ARect.Left;
          xx := ANode.Host.WidthPrn + ARect.Left;
          lx := 0;
        end;

        if (xx > RightSide) then  begin
          rx := xx - RightSide;
          xx := RightSide;
        end else begin
          rx := 0;
        end;
        r.Right := xx;


        AddPolyline([r.Left,r.Top, r.Left,r.Bottom, r.Right,r.Bottom]);

        if PRightTop.y > r.Top then begin
          PRightTop.y := r.Top;
          PLeftTop.y := PRightTop.y;
        end;
        r1 := r;
        r1.Top := r1.Top;

        lpDTP.cbSize := SizeOf(lpDTP);
        lpDTP.uiLengthDrawn := Length(s);
        lpDTP.iLeftMargin := 0;//lx;
        lpDTP.iRightMargin := 0;//rx;

        Dec(r.Left,lx); Inc(r.Right,rx);

        if pghColored in Options then VPrinter.Canvas.Brush.Color := DBGridEh.FixedColor;
        WriteTextEh( VPrinter.Canvas,r1,pghColored in Options,0,Round(fScaleY),s,
        taCenter,tlCenter,true,False,-lx+Round(fScaleX*2),-rx+Round(fScaleX*2),False);


        if (i = GetColNumByVisColNum(FromCol)) or (ANode.Host.Host.Child = ANode.Host) then
          PrintTitleRecurs(ANode.Host,r);
    end;

  begin
    PRightTop.y := PrintRec.Top;
    VPrinter.Canvas.Font := DBGridEh.TitleFont;
    if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;

    RightSide := PrintRec.Left;
    for i := GetColNumByVisColNum(FromCol) to GetColNumByVisColNum(ToCol) do begin
      Inc(RightSide,DBGridEh.LeafFieldArr[i].FLeaf.WidthPrn);
    end;

    r.Left := PrintRec.Left;
    for i := GetColNumByVisColNum(FromCol) to GetColNumByVisColNum(ToCol) do begin
      r.Bottom := PrintRec.Top;
      r.Top := r.Bottom - DBGridEh.LeafFieldArr[i].FLeaf.HeightPrn;
      r.Left := r.Left;
      r.Right := r.Left + DBGridEh.LeafFieldArr[i].FLeaf.WidthPrn; // Round(FLeafFieldArr[i].FLeaf.Width * fScaleX);
      s := DBGridEh.LeafFieldArr[i].FLeaf.Text;

      AddPolyline([r.Left,r.Top, r.Left,r.Bottom, r.Right,r.Bottom]);

      if i = GetColNumByVisColNum(ToCol) then begin
        PRightTop.x := r.Right;
        PRightLow.x := PRightTop.x;
      end;
      if PRightTop.y > r.Top then begin
        PRightTop.y := r.Top;
        PLeftTop.y := PRightTop.y;
      end;

      r1 := r;

      lpDTP.cbSize := SizeOf(lpDTP);
      lpDTP.uiLengthDrawn := Length(s);
      lpDTP.iLeftMargin := 0;//lx;
      lpDTP.iRightMargin := 0;//rx;

      if pghColored in Options then VPrinter.Canvas.Brush.Color := DBGridEh.FixedColor;
      WriteTextEh(VPrinter.Canvas,r1,pghColored in Options,0,Round(fScaleY),s,
       taCenter,tlCenter,true,False,Round(fScaleX*2),Round(fScaleX*2),False);

      if (i = GetColNumByVisColNum(FromCol)) or (DBGridEh.LeafFieldArr[i].FLeaf.Host.Child = DBGridEh.LeafFieldArr[i].FLeaf) then
         PrintTitleRecurs(DBGridEh.LeafFieldArr[i].FLeaf,r);

      r.Left := r.Right;
    end;

    // Рисуем вению линию заголовка и самую правую.
     PLeftTop.x := PrintRec.Left;
     PRightLow.y := PrintRec.Top;

     AddPolyline([PLeftTop.x,PLeftTop.y, PRightTop.x,PRightTop.y, PRightLow.x,PRightLow.y]);

     PrintGridTitleTextHeight(FromCol,ToCol);

    //\\
  end;

  //---------------------------
  function PrintPageColontitle(ARect:TRect; IsHeader,CalcHeight:Boolean):Integer;
  var pc:TPageColontitle;
      h,lm:Integer;
      Lay:TTextLayout;

      function ExtractMacro(s:STring):String;
      var i:Integer;
      begin
        Result := s;
        MacroValues[0] := IntToStr(VPrinter.PageNumber);
        for i := 0 to High(Macros) do
          Result := StringReplaceMacros(Result,Macros[i],MacroValues[i],[rfReplaceAll, rfIgnoreCase],'&');
      end;
  begin
    Result := 0; h := 0;
    //if not CalcHeight then VPrinter.Canvas.Rectangle(ARect.Left,ARect.Top,ARect.Right,ARect.Bottom);
    if IsHeader then begin pc := PagEheader; Lay := tlTop;
    end else begin pc := PageFooter; Lay := tlBottom; end;

    VPrinter.Canvas.Font := pc.Font;
    if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;
    if (pc.LeftText.Text <> '') then
      Result := WriteTextEh(VPrinter.Canvas,ARect,False,0,0,ExtractMacro(GetStingListText(pc.LeftText)),
          taLeftJustify,Lay,False,False,0,0,CalcHeight);
    if (pc.CenterText.Text <> '') then
      h := WriteTextEh(VPrinter.Canvas,ARect,False,0,0,ExtractMacro(GetStingListText(pc.CenterText)),
          taCenter,Lay,False,False,0,0,CalcHeight);
    if (Result < h) then Result := h;
    if (pc.RightText.Text <> '') then
      h := WriteTextEh(VPrinter.Canvas,ARect,False,0,0,ExtractMacro(GetStingListText(pc.RightText)),
          taRightJustify,Lay,False,False,0,0,CalcHeight);
    if (Result < h) then Result := h;

    if Result <> 0 then Inc(Result,Trunc(fLogPelsY2/20));

    if (pc.LineType <> pcltNon) then lm := Trunc(fLogPelsY2/20) else lm := 0;
    if (pc.LineType = pcltDoubleLine) then begin
      if not CalcHeight then
       if IsHeader then begin
         VPrinter.Canvas.MoveTo(ARect.Left, ARect.Bottom - Trunc(fLogPelsY2/20));
         VPrinter.Canvas.LineTo(ARect.Right, ARect.Bottom - Trunc(fLogPelsY2/20));
         VPrinter.Canvas.MoveTo(ARect.Left, ARect.Bottom - Trunc(fLogPelsY2/20) - Trunc(fLogPelsY2/30));
         VPrinter.Canvas.LineTo(ARect.Right, ARect.Bottom - Trunc(fLogPelsY2/20) - Trunc(fLogPelsY2/30));
       end else begin
         VPrinter.Canvas.MoveTo(ARect.Left, ARect.Top + Trunc(fLogPelsY2/20));
         VPrinter.Canvas.LineTo(ARect.Right, ARect.Top + Trunc(fLogPelsY2/20));
         VPrinter.Canvas.MoveTo(ARect.Left, ARect.Top + Trunc(fLogPelsY2/20) + Trunc(fLogPelsY2/30));
         VPrinter.Canvas.LineTo(ARect.Right, ARect.Top + Trunc(fLogPelsY2/20) + Trunc(fLogPelsY2/30));
       end;
      Inc(lm,Trunc(fLogPelsY2/30));
    end else if (pc.LineType = pcltSingleLine) then
      if not CalcHeight then
       if IsHeader then begin
         VPrinter.Canvas.MoveTo(ARect.Left, ARect.Bottom - Trunc(fLogPelsY2/20));
         VPrinter.Canvas.LineTo(ARect.Right, ARect.Bottom - Trunc(fLogPelsY2/20));
       end else begin
         VPrinter.Canvas.MoveTo(ARect.Left, ARect.Top + Trunc(fLogPelsY2/20));
         VPrinter.Canvas.LineTo(ARect.Right, ARect.Top + Trunc(fLogPelsY2/20));
       end;
    Inc(Result,lm);
  end;

  //--------------------------
  procedure DrawRowsRange(var APBmFrom, APBMTo:TPolyBookmark);
  var pgs, FromCol, ToCol, i, j: Integer;
      ARect:TRect;
      CurPBm:TPolyBookmark;
  begin
    FromCol := 0;
    for pgs := 0 to ColsToPages.Count - 1 do begin
      if VPrinter.Aborted then Abort;
      if FirtsPage then FirtsPage := False else VPrinter.NewPage;
      PolyPolyPoints.Clear; PolyLengths.Clear;
      ResetPrinterCanvas;
      ToCol := Integer(ColsToPages[pgs]);
      GotoPolyBookmark(APBmFrom);
      CurPBm := APBmFrom;
      ARect.Top := PrintRec.Top; ARect.Bottom := ARect.Top;
      j := 0;
      PrintPageColontitle(TitleRect,True,False);
      PrintPageColontitle(FooterRect,False,False);
      if DBGridEh.UseMultiTitle then
        PrintMultyTitle(FromCol,ToCol)
      else
        PrintSimpleTitle(FromCol,ToCol);
      while True do begin
        ARect.Left := PrintRec.Left; ARect.Right := ARect.Left;
        Inc(ARect.Bottom,Integer(PrnRowHeights[j]));
        for i := FromCol to ToCol do begin
         Inc(ARect.Right,Integer(PrnColWIdths[i]));
         DrawCell(i,ARect,CurPBm,False);
         if i = FromCol then
           AddPolyline([ARect.Left,ARect.Top, ARect.Left,ARect.Bottom, ARect.Right,ARect.Bottom, ARect.Right,ARect.Top])
         else
           AddPolyline([ARect.Left,ARect.Bottom, ARect.Right,ARect.Bottom, ARect.Right,ARect.Top]);
         ARect.Left := ARect.Right;
         Application.ProcessMessages;
        end;
        //if ComparePolyBookMark(CurPBm,APBMTo) then Break;
        if PrnRowHeights.Count - 1  = j then Break;

        SetNextPolyBookmark(CurPBm);
        Inc(j);
        ARect.Top := ARect.Bottom;
      end;
      PolyPolyline(VPrinter.Canvas.Handle,PolyPolyPoints.List^,PolyLengths.List^,PolyLengths.Count);
      FromCol := ToCol+1;
    end;
  end;

  //---------------------------
  function GetGridTitleTextHeight: Integer;
  var r:Trect;
      tm:Integer;
  begin
    if (Title.Text <> '') then begin
      VPrinter.Canvas.Font := DBGridEh.TitleFont;
      if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;
      r := Rect(0,0,GetPrintGridWidth,0);
      if DBGridEh.UseMultiTitle then tm := Round(DBGridEh.VTitleMargin*fScaleY/2) else tm := PSY2;
      Result := WriteTextEh(VPrinter.Canvas,r,False,PSX2,tm,
        GetStingListText(Title),taCenter,tlCenter,True,False,0,0,True);
    end else
      Result := 0;
  end;

  // ----------------------------
  function SetPrnChildTreEheight(ANode:THeadTreeNode):Integer;
  var htLast:THeadTreeNode;
      newh,maxh,th :Integer;
      rec:TRect;
      DefaultRowHeight : Integer;
  begin
    VPrinter.Canvas.Font := DBGridEh.TitleFont;
    if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;

    DefaultRowHeight := 0;
    Result := 0;

    if(ANode.Child  = nil) then Exit;
    htLast := ANode.Child;
    maxh := 0;
    if(htLast.Child <> nil) then
     maxh := SetPrnChildTreEheight(htLast);

    rec := Rect(0,0,Round(htLast.Width*fScaleX) - Round(fScaleX*4),DefaultRowHeight);
    th := DrawText(VPrinter.Canvas.Handle,PChar(htLast.Text),
           Length(htLast.Text), rec, DT_WORDBREAK or DT_CALCRECT or DT_EXPANDTABS or DT_NOPREFIX);
    if (th > DefaultRowHeight) then maxh := maxh + th + Round(DBGridEh.VTitleMargin*fScaleX)
       else maxh := maxh + DefaultRowHeight;

    while  True  do begin
       if(ANode.Child = htLast.Next) then begin break; end;
       htLast := htLast.Next;
       newh := 0;
       if(htLast.Child <> nil) then
         newh := SetPrnChildTreEheight(htLast);
       rec := Rect(0,0,Round(htLast.Width*fScaleX) - Round(fScaleX*4),DefaultRowHeight);
       th := DrawText(VPrinter.Canvas.Handle,PChar(htLast.Text),
           Length(htLast.Text), rec, DT_WORDBREAK or DT_CALCRECT or DT_EXPANDTABS or DT_NOPREFIX);
       if (th > DefaultRowHeight) then newh := newh + th  + Round(DBGridEh.VTitleMargin*fScaleY)
          else newh := newh + DefaultRowHeight;

       if(maxh < newh) then maxh := newh;
    end;

    htLast := ANode.Child;
    while ANode.Child <> htLast.Next do begin
      if(htLast.Child = nil) then htLast.HeightPrn := maxh
        else htLast.HeightPrn := maxh - htLast.HeightPrn;
      htLast := htLast.Next;
    end;
    if(htLast.Child = nil) then htLast.HeightPrn := maxh
        else htLast.HeightPrn := maxh - htLast.HeightPrn;

    ANode.HeightPrn := maxh; //сохраняем высоту ChildTree в Хосте
    Result := maxh;
  end;

  // -------SetPrnTreeWidth Ширина заголовка для принтера
  procedure SetPrnTreeWidth;
  var //an,nn:THeadTreeNode;
      i,j:Integer;

    function SetPrnTreeWidthRecurs(AHost:THeadTreeNode):Integer;
    var an,nn:THeadTreeNode;
         w:Integer;
    begin
      w := 0;
      Result := AHost.WidthPrn;
      if (AHost.Child = nil) then Exit;
      an := AHost.Child;
      nn := an;
      while True do begin
        Inc(w,SetPrnTreeWidthRecurs(nn));
        nn := nn.Next;
        if (nn = an) then Break;
      end;
      AHost.WidthPrn := w;
      Result := w;
    end;

  begin
    j := 0;
    for i := 0 to DBGridEh.Columns.Count - 1 do begin
      if DBGridEh.Columns[i].Visible then
      begin
        DBGridEh.LeafFieldArr[i].FLeaf.WidthPrn := Integer(PrnColWidths[j]);
        Inc(j);
      end
      else
        DBGridEh.LeafFieldArr[i].FLeaf.WidthPrn := 0;
    end;
    SetPrnTreeWidthRecurs(DBGridEh.HeadTree);
  end;

  //---------------------------
  function GetSimpleTitlEheight: Integer;
  var i,H:Integer;
  begin
    Result := 0;
    for i := 0 to DBGridEh.VisibleColumns.Count - 1 do begin
      VPrinter.Canvas.Font := DBGridEh.VisibleColumns[i].Title.Font;
      if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;
      H := VPrinter.Canvas.TextHeight('Wg') + Round(4*fScaleY);
      if H > Result then Result := H;
    end;
    if Result = 0 then
    begin
      VPrinter.Canvas.Font := DBGridEh.TitleFont;
      if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;
      Result := VPrinter.Canvas.TextHeight('Wg') + Round(4*fScaleY);
    end;
  end;

  //---------------------------
  function CalcMinRowHeight: Integer;
  var tm: TTEXTMETRIC;
  begin
    VPrinter.Canvas.Font := DBGridEh.Font;
    if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;
    GetTextMetrics(VPrinter.Canvas.Handle, tm);
    if (DBGridEh.RowHeight = 0) and (DBGridEh.RowLines = 0) then
      Result := VPrinter.Canvas.TextHeight('Wg') + Round(4*fScaleY)
    else
      Result := (tm.tmExternalLeading + tm.tmHeight)*DBGridEh.RowLines + Round(DBGridEh.RowHeight*fScaleY);
    AWordWrap := (Result > tm.tmExternalLeading + tm.tmHeight + Round(4*fScaleY)) or (pghRowAutoStretch in Options);
  end;

begin
  if not Assigned(DBGridEh) or
     not Assigned(DBGridEh.DataSource) or
     not Assigned(DBGridEh.DataSource.DataSet) or
     not DBGridEh.DataSource.DataSet.Active then  Exit;

  InitMacroValues;
  ColsToPages := nil; PrnRowHeights := nil; PrnColWIdths := nil;
  PolyPolyPoints := nil; PolyLengths := nil;

  VPrinter.BeginDoc;
  FirtsPage := True;
  SavedBookMark := DBGridEh.DataSource.DataSet.Bookmark;
  try
   DBGridEh.DataSource.DataSet.DisableControls;
   DBGridEh.DataSource.DataSet.First;

   ColsToPages := TList.Create;
   PrnRowHeights := TList.Create;
   PrnColWIdths := TList.Create;
   PolyPolyPoints := TList.Create;
   PolyLengths := TList.Create;

   VPrinter.Title := 'Tabular information';
   VPrinter.Canvas.Brush.Style := bsClear;
   VPrinter.Canvas.Brush.Color := clWhite;
   VPrinter.Canvas.Font := DBGridEh.Font;
   if (PrintFontName <> '') then VPrinter.Canvas.Font.Name := PrintFontName;

   CalcDeviceCaps;
   CalcColsToPages;

   TitleRect := Rect(PrintRec.Left, PrintRec.Top, PrintRec.Right, PrintRec.Top);
   Inc(TitleRect.Bottom,PrintPageColontitle(TitleRect,True,True));
   Inc(PrintRec.Top,TitleRect.Bottom - PrintRec.Top);

   FooterRect := Rect(PrintRec.Left, PrintRec.Bottom, PrintRec.Right, PrintRec.Bottom);
   Dec(FooterRect.Top,PrintPageColontitle(FooterRect,False,True));
   Dec(PrintRec.Bottom,FooterRect.Bottom - FooterRect.Top);

   MinRowHeight := CalcMinRowHeight;
   //FromRow := 0; PageNo := 1;
   if DBGridEh.UseMultiTitle then begin
     SetPrnTreeWidth;
     PrnTitlEh := SetPrnChildTreEheight(DBGridEh.HeadTree);
   end else
     PrnTitlEh := GetSimpleTitlEheight;
   PrnTitleTextH := GetGridTitleTextHeight;
   Inc(PrintRec.Top,PrnTitlEh + PrnTitleTextH);

   //GridRowCount := DBGridEh.DataSource.DataSet.RecordCount + DBGridEh.FooterRowCount;

   InitPolyBookmark(PBm1);
   while True do begin
     PBm2 := CalcPrintRows(PBm1, PrintRec.Top, PrintRec.Bottom);
     DrawRowsRange(PBm1,PBm2);
     if (PBm2.EOF = True) then Exit;
     PBm1 := PBm2;
   end;

  finally
   DBGridEh.DataSource.DataSet.GotoBookmark(TBookmark(SavedBookMark));
   DBGridEh.DataSource.DataSet.EnableControls;
   VPrinter.EndDoc;
   ColsToPages.Free;
   PrnRowHeights.Free;
   PrnColWIdths.Free;
   PolyPolyPoints.Free;
   PolyLengths.Free;
  end;
end;


procedure TPrintDBGridEh.Print;
begin
  PrintTo(VirtualPrinter);
end;

procedure TPrintDBGridEh.SetDBGridEh(const Value: TDBGridEh);
begin
  if Value <> FDBGridEh then
  begin
    FDBGridEh := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

procedure TPrintDBGridEh.SetOptions(const Value: TPrintDBGridEhOptions);
begin
  FOptions := Value;
end;

procedure TPrintDBGridEh.SetPage(const Value: TPageParams);
begin
  FPage := Value;
end;

procedure TPrintDBGridEh.SetPageFooter(const Value: TPageColontitle);
begin
  FPageFooter := Value;
end;

procedure TPrintDBGridEh.SetPagEheader(const Value: TPageColontitle);
begin
  FPagEheader := Value;
end;

procedure TPrintDBGridEh.SetPrintFontName(const Value: String);
begin
  FPrintFontName := Value;
end;

procedure TPrintDBGridEh.SetTitle(const Value: TStrings);
begin
  FTitle.Assign(Value);
end;

procedure TPrintDBGridEh.SetUnits(const Value: TMeasureUnits);
var AMul:Currency;
begin
  if Value <> FUnits then
  begin
    FUnits := Value;
    if csLoading in ComponentState then Exit;
    if Value = Inches then AMul := 1/2.54 else AMul := 2.54;
    with Page do begin
{      BottomMargin := Round(BottomMargin * AMul * 100) / 100;
      TopMargin := Round(TopMargin * AMul * 100) / 100;
      LeftMargin := Round(LeftMargin * AMul * 100) / 100;
      RightMargin := Round(RightMargin * AMul * 100) / 100;}
      BottomMargin := BottomMargin * AMul;
      TopMargin := TopMargin * AMul;
      LeftMargin := LeftMargin * AMul;
      RightMargin := RightMargin * AMul;
    end;
  end;
end;

function TPrintDBGridEh.PrinterSetupDialog:Boolean;
begin
  Result := False;
  if not Assigned(fPrnDBGridEhSetupDialog) then
    fPrnDBGridEhSetupDialog := TfPrnDBGridEhSetupDialog.Create(Application.MainForm);

  with fPrnDBGridEhSetupDialog do begin
    seUpMargin.Text := FloatToStr(Page.TopMargin);
    seLowMargin.Text := FloatToStr(Page.BottomMargin);
    seLeftMargin.Text := FloatToStr(Page.LeftMargin);
    seRightMargin.Text := FloatToStr(Page.RightMargin);
    cbFitWidthToPage.Checked := pghFitGridToPageWidth in Options;
    ePrintFont.Text := PrintFontName;
    cbAutoStretch.Checked := pghRowAutoStretch in Options;
    cbColored.Checked := pghColored in Options;

    if ShowModal = mrOk then begin
      Page.TopMargin := StrToFloat(seUpMargin.Text);
      Page.BottomMargin := StrToFloat(seLowMargin.Text);
      Page.LeftMargin := StrToFloat(seLeftMargin.Text);
      Page.RightMargin := StrToFloat(seRightMargin.Text);
      if cbFitWidthToPage.Checked then
        Options := Options + [pghFitGridToPageWidth]
      else
        Options := Options - [pghFitGridToPageWidth];
      PrintFontName := ePrintFont.Text;
      if cbAutoStretch.Checked then
        Options := Options + [pghRowAutoStretch]
      else
        Options := Options - [pghRowAutoStretch];
      if cbColored.Checked then
        Options := Options + [pghColored]
      else
        Options := Options - [pghColored];
      Result := True;
//      Preview;
    end;
  end;
end;

procedure TPrintDBGridEh.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = DBGridEh) then DBGridEh := nil;
end;

procedure TPrintDBGridEh.PrinterSetupDialogPreview(Sender: TObject);
begin
  if PrinterSetupDialog then
    Preview;
end;

{ TPageParams }

procedure TPageParams.Assign(Source: TPersistent);
begin
  if Source is TPageParams then begin
    BottomMargin := TPageParams(Source).BottomMargin;
    LeftMargin := TPageParams(Source).LeftMargin;
    RightMargin := TPageParams(Source).RightMargin;
    TopMargin := TPageParams(Source).TopMargin;
//    Columns := TPageParams(Source).Columns;
//    ColumnSpace := TPageParams(Source).ColumnSpace;
  end
  else inherited Assign(Source);
end;

constructor TPageParams.Create;
begin
  inherited Create;
  BottomMargin := 2;
  LeftMargin := 2;
  RightMargin := 2;
  TopMargin := 2;
end;

procedure TPageParams.SetBottomMargin(const Value: Currency);
begin
  FBottomMargin := Value;
end;

(*procedure TPageParams.SetColumns(const Value: Integer);
begin
  FColumns := Value;
end;

procedure TPageParams.SetColumnSpace(const Value: Currency);
begin
  FColumnSpace := Value;
end;*)

procedure TPageParams.SetLeftMargin(const Value: Currency);
begin
  FLeftMargin := Value;
end;

procedure TPageParams.SetRightMargin(const Value: Currency);
begin
  FRightMargin := Value;
end;

procedure TPageParams.SetTopMargin(const Value: Currency);
begin
  FTopMargin := Value;
end;

{ TPageColontitle }

procedure TPageColontitle.Assign(Source: TPersistent);
begin
  if Source is TPageColontitle then begin
    LeftText := TPageColontitle(Source).LeftText;
    CenterText := TPageColontitle(Source).CenterText;
    RightText := TPageColontitle(Source).RightText;
    Font := TPageColontitle(Source).Font;
  end
  else inherited Assign(Source);
end;

constructor TPageColontitle.Create;
begin
  inherited Create;
  FFont := TFont.Create;
  FCenterText := TStringList.Create;
  FLeftText := TStringList.Create;
  FRightText := TStringList.Create;
end;

destructor TPageColontitle.Destroy;
begin
  Font.Free;
  FCenterText.Free;
  FLeftText.Free;
  FRightText.Free;
  inherited Destroy;
end;

procedure TPageColontitle.SetCenterText(const Value: TStrings);
begin
  FCenterText.Assign(Value);
end;

procedure TPageColontitle.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TPageColontitle.SetLeftText(const Value: TStrings);
begin
  FLeftText.Assign(Value);
end;

procedure TPageColontitle.SetLineType(const Value: TPageColontitleLineType);
begin
  FLineType := Value;
end;

procedure TPageColontitle.SetRightText(const Value: TStrings);
begin
  FRightText.Assign(Value);
end;

initialization
 GetCheckSize;
end.
