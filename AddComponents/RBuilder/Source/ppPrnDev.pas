{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppPrnDev;

interface

{$I ppIfDef.pas}

uses
 Windows, Classes, ExtCtrls, Graphics, SysUtils,  Dialogs, Forms,
 ppDevice, ppTypes, ppUtils, ppPrintr, ppForms, ppDrwCmd;

type

  { TppPrinterDevice }
  TppPrinterDevice = class(TppRasterDevice)
    private
      FCanvas: TCanvas;
      FCollatedCopies: Integer;
      FFirstPage: Boolean;
      FEndPrintJob: Boolean;
      FOffsetX: Integer;
      FOffsetY: Integer;
      FOnEndPage: TppPageEvent;
      FOnStartPage: TppPageEvent;
      FPrinter: TppPrinter;
      FStartPrintJob: Boolean;
      FWaterMark: TppDrawCommand;

      procedure DisplayMessage(aPage: TppPage);
      procedure StartPage(aPage: TppPage);
      procedure EndPage(apage: TppPage);
      function  GetWaterMark(aPage: TppPage): TppDrawCommand;

    protected
      function  CheckEndJob: Boolean; virtual;

      procedure DrawShape(aDrawShape: TppDrawShape); virtual;
      procedure DrawLine(aDrawLine: TppDrawLine); virtual;
      procedure DrawImage(aDrawImage: TppDrawImage); virtual;
      procedure DrawText(aDrawText: TppDrawText); virtual;
      procedure DrawBMP(aDrawImage: TppDrawImage); virtual;
      procedure DrawGraphic(aDrawImage: TppDrawImage); virtual;
      procedure DirectDrawImage(aDrawImage: TppDrawImage); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function DeviceName: String; override;

      procedure CancelJob; override;
      function  Draw(aDrawCommand: TppDrawCommand): Boolean; override;
      procedure EndJob; override;
      procedure ReceivePage(aPage: TppPage); override;
      procedure StartJob; override;
      procedure CalcDrawPosition(aDrawCommand: TppDrawCommand);
      procedure ScaleRect(aRect: TRect);

      property Canvas: TCanvas read FCanvas;
      property EndPrintJob: Boolean read FEndPrintJob write FEndPrintJob;
      property OnEndPage: TppPageEvent read FOnEndPage write FOnEndPage;
      property OnStartPage: TppPageEvent read FOnStartPage write FOnStartPage;
      property Printer: TppPrinter read FPrinter;
      property StartPrintJob: Boolean read FStartPrintJob write FStartPrintJob;
      property WaterMark: TppDrawCommand read FWaterMark write FWaterMark;

    end; {class, TppPrinterDevice}


implementation

{******************************************************************************
 *
 ** P R I N T E R   D E V I C E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.Create }

constructor TppPrinterDevice.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FCanvas := nil;
  FCollatedCopies := 1;
  FEndPrintJob := True;
  FFirstPage := True;
  FOnEndPage := nil;
  FOnStartPage := nil;
  FPrinter := TppPrinter.Create;
  FStartPrintJob := True;
  FWaterMark := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.Destroy }

destructor TppPrinterDevice.Destroy;
begin

  FWaterMark.Free;
  FPrinter.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.DeviceName }

class function TppPrinterDevice.DeviceName: String;
begin
  Result := 'Printer';
end; {class function, DeviceName}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.StartJob }

procedure TppPrinterDevice.StartJob;
begin
  {if we're busy, a print job has already started}
  if (Busy) then Exit;

  inherited StartJob;

  DisplayMessage(nil);

  {start print job}
  if (FStartPrintJob) then
    Printer.BeginDoc;

  FCanvas := Printer.Canvas;

end; {procedure, StartJob}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.EndJob }

procedure TppPrinterDevice.EndJob;
begin

  {if we're not busy, there is no print job to end}
  if not(Busy) then Exit;

  if not CheckEndJob then Exit;

  {end print job }
  if (EndPrintJob) then
    Printer.EndDoc;

  FCanvas := nil;

  inherited EndJob;

end; {procedure, EndJob}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.CheckEndJob }

function TppPrinterDevice.CheckEndJob;
begin

  {check whether all copies have been printed}
  Result := (FCollatedCopies = 1);

  if Result then Exit;

  {print another copy}
  FCollatedCopies := FCollatedCopies - 1;

  MakePageRequest;

end; {procedure, CheckEndJob}


{------------------------------------------------------------------------------}
{ TppPrinterDevice.CancelJob }

procedure TppPrinterDevice.CancelJob;
begin

  Printer.EndDoc;

  FCanvas := nil;

  inherited CancelJob;

end; {procedure, CancelJob}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.ReceivePage }

procedure TppPrinterDevice.ReceivePage(aPage: TppPage);
var
  liPageCopies: Integer;
  liIndex: Integer;
begin

  {are we receiving a page we requested?}
  inherited ReceivePage(aPage);

  {have we started the print job?}
  if not(Busy) then Exit;

  if IsRequestedPage then
    begin

      DisplayMessage(aPage);

      if (IsMessagePage) then Exit;

      if Printer.PrinterSetup.Collation then
        liPageCopies := 1
      else
        liPageCopies := Printer.PrinterSetup.Copies;

      for liIndex := 1 to  liPageCopies do
        begin
          StartPage(aPage);

          DrawPage(aPage);

          EndPage(aPage);
        end;

    end;

end; {procedure, ReceivePage}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.DisplayMessage }

procedure TppPrinterDevice.DisplayMessage(aPage: TppPage);
var
  lsMessage: String;
begin

  if (aPage = nil) then
    begin
      {message: Accessing data...}
      lsMessage := ppLoadStr(2);
    end

  else if IsMessagePage and not(Publisher.ReportCompleted) then
    begin
      if (CancelDialog <> nil) then
        lsMessage := CancelDialog.PrintProgress
      else
        lsMessage := '';
    end
    
  else if not(Publisher.ReportCompleted) then
    begin
      {message: Printing page 1 for <documentname> on <printername>}
      lsMessage := ppLoadStr(27);
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [IntToStr(aPage.AbsolutePageNo), aPage.DocumentName, Printer.PrinterDescription]);
    end

  else 
    begin
      {message: Printing page 1 of 15 for <documentname> on <printername>}
      lsMessage := ppLoadStr(28);
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [IntToStr(aPage.AbsolutePageNo), IntToStr(aPage.AbsolutePageCount),
                          aPage.DocumentName, Printer.PrinterDescription]);

    end;


  if (CancelDialog <> nil) and (CancelDialog.PrintProgress <> lsMessage) then
    begin
      CancelDialog.PrintProgress := lsMessage;

      Application.ProcessMessages;
    end;

end; {procedure, DisplayMessage}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.StartPage }

procedure TppPrinterDevice.StartPage(aPage: TppPage);
var
  lWaterMark: TppDrawCommand;
begin

  {initialize collated copies counter}
  if FFirstPage then
    begin

      if Printer.PrinterSetup.Collation then
        FCollatedCopies := Printer.PrinterSetup.Copies;

      FFirstPage := False;

    end;

  {setup printer and start a new page}
  FPrinter.PrinterSetup := aPage.PrinterSetup;

  FPrinter.StartPage;

  {set object position offsets to accomodate page gutters}
  FOffSetX := -FPrinter.PageGutters.Left;
  FOffSetY := -FPrinter.PageGutters.Top;

  lWaterMark := GetWaterMark(aPage);

  if lWaterMark <> nil then
    aPage.AddDrawCommand(lWaterMark);

  if Assigned(FOnStartPage) then FOnStartPage(Self, aPage);

end; {procedure, StartPage}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.EndPage }

procedure TppPrinterDevice.EndPage(aPage: TppPage);
var
  lWaterMark: TppDrawCommand;

begin
  FPrinter.EndPage;

 lWaterMark := GetWaterMark(aPage);

  if lWaterMark <> nil then
    aPage.RemoveDrawCommand(lWaterMark);

  if Assigned(FOnEndPage) then FOnEndPage(Self, aPage);

end; {procedure, EndPage}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.GetWaterMark }

function TppPrinterDevice.GetWaterMark(aPage: TppPage): TppDrawCommand;
{$IFDEF Demo}
var
  lWaterMark: TppDrawText;
  llPageHeight: Longint;
  llPageWidth: Longint;
  liTextWidth: Integer;
  liTextHeight: Integer;
{$ENDIF}

begin

  Result := FWaterMark;

{$IFDEF Demo}

  if (FWaterMark <> nil) then  Exit;

  {for demo copy, print company info}
  lWaterMark := TppDrawText.Create(aPage);
  lWaterMark.WrappedText.Add('ReportBuilder ' + ppEdition + #153 + ' - Demo Copy');
  lWaterMark.WrappedText.Add('Version ' + ppVersion);
  lWaterMark.WrappedText.Add('Digital Metaphors Corporation');
  lWaterMark.WrappedText.Add('Telephone: 972.931.1941');
  lWaterMark.WrappedText.Add('E-Mail: sales@digital-metaphors.com');
  lWaterMark.Transparent := True;
  lWaterMark.IsMemo      := False;
  lWaterMark.WordWrap    := True;
  lWaterMark.Font.Name   := 'Arial';
  lWaterMark.Font.Size   := 18;
  lWaterMark.Font.Color  := clBlack;
  lWaterMark.Autosize    := True;

  liTextWidth  := 375;
  liTextHeight := 150;

  llPageHeight      := FPrinter.PrinterSetup.PageDef.mmPrintableHeight;
  llPageWidth       := FPrinter.PrinterSetup.PageDef.mmPrintableWidth;
  lWaterMark.Height := ppToMMThousandths(liTextHeight, utScreenPixels, pprtHorizontal, nil);
  lWaterMark.Width  := ppToMMThousandths(liTextWidth,  utScreenPixels, pprtHorizontal, nil);

  lWaterMark.Top  := (llPageHeight - lWaterMark.Height)  div 2;
  lWaterMark.Left := (llPageWidth -  lWaterMark.Width )  div 2;

  FWaterMark := lWaterMark;
  Result     := FWaterMark;

{$ENDIF}

end; {function, GetWatermark}


{------------------------------------------------------------------------------}
{ TppPrinterDevice.ScaleRect}

procedure TppPrinterDevice.ScaleRect(aRect: TRect);
begin
end;

{------------------------------------------------------------------------------}
{ TppPrinterDevice.CalcDrawPosition}

procedure TppPrinterDevice.CalcDrawPosition(aDrawCommand: TppDrawCommand);
begin

  {scale the bounding rectangle}
  aDrawCommand.DrawLeft   := FOffsetX + Trunc(ppFromMMThousandths(aDrawCommand.Left,
                                              utPrinterPixels, pprtHorizontal, FPrinter));
  aDrawCommand.DrawTop    := FOffsetY + Trunc(ppFromMMThousandths(aDrawCommand.Top, utPrinterPixels, pprtVertical, FPrinter));
  aDrawCommand.DrawRight  := FOffsetX + Trunc(ppFromMMThousandths((aDrawCommand.Left + aDrawCommand.Width),
                                               utPrinterPixels, pprtHorizontal, FPrinter));
  aDrawCommand.DrawBottom := FOffsetY + Trunc(ppFromMMThousandths((aDrawCommand.Top  + aDrawCommand.Height),
                                               utPrinterPixels, pprtVertical, FPrinter));


end;

{------------------------------------------------------------------------------}
{ TppPrinterDevice.Draw }

function TppPrinterDevice.Draw(aDrawCommand: TppDrawCommand): Boolean;
begin
  Result := True;

  CalcDrawPosition(aDrawCommand);

  if (aDrawCommand is TppDrawText) then
    DrawText(TppDrawText(aDrawCommand))

  else if (aDrawCommand is TppDrawShape) then
    DrawShape(TppDrawShape(aDrawCommand))

  else if (aDrawCommand is TppDrawLine) then
    DrawLine(TppDrawLine(aDrawCommand))

  else if (aDrawCommand is TppDrawImage) then
    DrawImage(TppDrawImage(aDrawCommand))

  else
    Result := False;

end; {function, Draw}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.DrawLine }

procedure TppPrinterDevice.DrawLine(aDrawLine: TppDrawLine);
var
  liOffset: Integer;
  liLines: Integer;
  liLine: Integer;
  llSize: Longint;
  lResolution: TppResolutionType;
  llPosition: Longint;

begin

  if (aDrawLine.LinePosition = lpLeft) or (aDrawLine.LinePosition = lpRight) then
    lResolution := pprtVertical
  else
    lResolution := pprtHorizontal;


  if (aDrawLine.LinePosition = lpLeft) or (aDrawLine.LinePosition = lpRight) then
    llSize := Round(aDrawLine.Weight * FPrinter.PixelsPerInch.X / 72)
  else
    llSize := Round(aDrawLine.Weight * FPrinter.PixelsPerInch.Y / 72);


  {if pen width is zero, print a hairline}
  if llSize = 0 then
    llSize := 1;

 {  if (aDrawLine.Pen.Width = 0) then
    llSize := 1
  else
    llSize := Trunc(ppFromScreenPixels(aDrawLine.Pen.Width, utPrinterPixels, lResolution, FPrinter));
 }

  {how many lines to draw?}
  if aDrawLine.LineStyle = lsSingle then
    liLines := 1
  else
    liLines := 2;

  {set actual pen width to one, to honor Pen.Style for wide lines}
  FCanvas.Pen := aDrawLine.Pen;
  FCanvas.Pen.Width := 1;

  for liLine := 1 to liLines do

    begin

      if (liLine = 1) then
        liOffset := 0

      else if (aDrawLine.Pen.Width = 0) then

        liOffset := Trunc(ppFromScreenPixels(2, utPrinterPixels, lResolution, FPrinter))

      else
        liOffset := llSize * 2;

      for llPosition := 0 to llSize - 1 do

      {set print object moveto/lineto positions}
      case aDrawLine.LinePosition of
        lpTop:
          begin
            FCanvas.MoveTo(aDrawLine.DrawLeft, aDrawLine.DrawTop + liOffset + llPosition);
            FCanvas.LineTo(aDrawLine.DrawRight, aDrawLine.DrawTop + liOffset + llPosition);
          end;

        lpBottom:
          begin
            FCanvas.MoveTo(aDrawLine.DrawLeft, aDrawLine.DrawBottom - liOffset - llPosition);
            FCanvas.LineTo(aDrawLine.DrawRight, aDrawLine.DrawBottom - liOffset - llPosition);
          end;

        lpLeft:
          begin
            FCanvas.MoveTo(aDrawLine.DrawLeft + liOffset + llPosition, aDrawLine.DrawTop);
            FCanvas.LineTo(aDrawLine.DrawLeft + liOffset + llPosition, aDrawLine.DrawBottom);
          end;

        lpRight:
          begin
            FCanvas.MoveTo(aDrawLine.DrawRight - liOffset - llPosition, aDrawLine.DrawTop);
            FCanvas.LineTo(aDrawLine.DrawRight - liOffset - llPosition, aDrawLine.DrawBottom);
          end;

      end; {case, line style}

   end; {for, each line}

end; {procedure, DrawLine}



{------------------------------------------------------------------------------}
{ TppPrinterDevice.DrawShape }

procedure TppPrinterDevice.DrawShape(aDrawShape: TppDrawShape);
var
  liXCornerRound: Integer;
  liYCornerRound: Integer;

begin

  {assign pen and brush}
  FCanvas.Pen   := aDrawShape.Pen;
  FCanvas.Brush := aDrawShape.Brush;

  {get pen width}
  if (aDrawShape.Pen.Width = 0) then
    {if pen width is zero, print a hairline}
    FCanvas.Pen.Width := 1
  else
    {convert pen width to printer pixels}
    FCanvas.Pen.Width := Trunc(ppFromScreenPixels(aDrawShape.Pen.Width, utPrinterPixels, pprtHorizontal, FPrinter));

  {draw shape}
  case aDrawShape.ShapeType of

    stRectangle:
      FCanvas.Rectangle(aDrawShape.DrawLeft, aDrawShape.DrawTop,
                        aDrawShape.DrawRight, aDrawShape.DrawBottom);

    stEllipse:
      FCanvas.Ellipse(aDrawShape.DrawLeft, aDrawShape.DrawTop,
                      aDrawShape.DrawRight, aDrawShape.DrawBottom);

    stRoundRect:
      begin
        liXCornerRound := Trunc(ppFromMMThousandths(aDrawShape.XCornerRound, utPrinterPixels, pprtHorizontal, FPrinter));
        liYCornerRound := Trunc(ppFromMMThousandths(aDrawShape.YCornerRound, utPrinterPixels, pprtVertical, FPrinter));

        FCanvas.RoundRect(aDrawShape.DrawLeft, aDrawShape.DrawTop,
                          aDrawShape.DrawRight, aDrawShape.DrawBottom,
                          liXCornerRound, liYCornerRound);

      end; {case, RoundRect}

  end; {case, ShapeType}

end; {procedure, DrawShape}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.DrawImage }

procedure TppPrinterDevice.DrawImage(aDrawImage: TppDrawImage);
begin

  if (aDrawImage = nil) or (aDrawImage.Picture = nil) or
     (aDrawImage.Picture.Graphic = nil) or (aDrawImage.Picture.Graphic.Empty) then Exit;

  if aDrawImage.Picture.Graphic is TBitmap then
    begin
      if aDrawImage.AsBitmap.Monochrome then
        DirectDrawImage(aDrawImage)
      else
        DrawBMP(aDrawImage);
    end

  else if aDrawImage.DirectDraw then
    DirectDrawImage(aDrawImage)

  else if (aDrawImage.AsBitmap <> nil) then
    DrawBMP(aDrawImage)

  else
    DrawGraphic(aDrawImage);

end; {procedure, DrawImage}

{$IFDEF new}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.CalcMetaBounds }
procedure TppPrinterDevice.CalcMetaBounds(var R:TRect;
                                          Const AChartRect:TRect;
                                          Var WinWidth,WinHeight,
                                          ViewWidth,ViewHeight:Longint);
Var tmpRectWidth,
    tmpRectHeight:Longint;
begin  { apply PrintResolution to the desired rectangle coordinates }
  RectSize(R,ViewWidth,ViewHeight);
  RectSize(AChartRect,tmpRectWidth,tmpRectHeight);
  WinWidth :=tmpRectWidth -MulDiv(tmpRectWidth, PrintResolution,100);
  WinHeight:=tmpRectHeight-MulDiv(tmpRectHeight,PrintResolution,100);
  With R do
  begin
    Left  :=MulDiv(Left  ,WinWidth,ViewWidth);
    Right :=MulDiv(Right ,WinWidth,ViewWidth);
    Top   :=MulDiv(Top   ,WinHeight,ViewHeight);
    Bottom:=MulDiv(Bottom,WinHeight,ViewHeight);
  end;
end;




  Procedure SetAnisotropic; { change canvas/windows metafile mode }
  Var lDC : HDC;
  begin

    lDC:=FCanvas.Handle;
    SetMapMode(lDC, MM_ANISOTROPIC);
    SetWindowOrgEx(  lDC, 0, 0, nil);
    SetWindowExtEx(  lDC, WinWidth, WinHeight, nil);
    SetViewportExtEx(lDC, ViewWidth,ViewHeight, nil);
    SetViewportOrgEx(lDC, 0, 0, nil);
  end;


{------------------------------------------------------------------------------}
{ TppPrinterDevice.DirectDrawImage }

procedure TppPrinterDevice.DirectDrawImage(aDrawImage: TppDrawImage);
var
  lSaveClipRgn: HRGN;
  lNewClipRgn: HRGN;
  lDrawRect: TRect;
  liImageWidth: Integer;
  liImageHeight: Integer;
  liControlWidth: Integer;
  liControlHeight: Integer;
  lfScale: Single;
  lDC: HDC;

  liScreenWidth: Integer;
  liScreenHeight: Integer;
  liScreenLeft: Integer;
  liScreenTop: Integer;


begin


  if aDrawImage.Transparent then
    FCanvas.CopyMode := cmSrcAnd
  else
    FCanvas.CopyMode := cmSrcCopy;


  {initialize}
  lDrawRect := aDrawImage.DrawRect;

  {compute control dimensions in printer pixels}
  liControlWidth  := lDrawRect.Right  - lDrawRect.Left;
  liControlHeight := lDrawRect.Bottom - lDrawRect.Top;


  {compute image dimensions in printer pixels}
  liImageWidth    := Trunc(ppFromScreenPixels(aDrawImage.Picture.Graphic.Width, utPrinterPixels, pprtHorizontal, FPrinter));
  liImageHeight   := Trunc(ppFromScreenPixels(aDrawImage.Picture.Graphic.Height, utPrinterPixels, pprtHorizontal, FPrinter));


  if aDrawImage.Stretch then
    begin

      {scale the draw rect to maintain aspect ration, if needed }
      if aDrawImage.MaintainAspectRatio then
        begin

          lfScale := ppCalcAspectRatio(liImageWidth, liImageHeight, liControlWidth, liControlHeight);

          lDrawRect.Right  := lDrawRect.Left + Trunc(liImageWidth  * lfScale);
          lDrawRect.Bottom := lDrawRect.Top  + Trunc(liImageHeight * lfScale);

        end;

      liControlWidth  := lDrawRect.Right  - lDrawRect.Left;
      liControlHeight := lDrawRect.Bottom - lDrawRect.Top;

      {compute control dimensions in screen pixels}
      liScreenWidth  := ppToMMThousandths(lDrawRect.Right - lDrawRect.Left, utPrinterPixels, pprtHorizontal, FPrinter) div 100;
      liScreenHeight := ppToMMThousandths(lDrawRect.Bottom - lDrawRect.Top, utPrinterPixels, pprtVertical, FPrinter) div 100;
      liScreenLeft   := ppToMMThousandths(lDrawRect.Left, utPrinterPixels, pprtHorizontal, FPrinter) div 100;
      liScreenTop    := ppToMMThousandths(lDrawRect.Top,  utPrinterPixels, pprtVertical, FPrinter) div 100;

      liImageWidth    := ppToMMThousandths(aDrawImage.Picture.Graphic.Width, utPrinterPixels, pprtHorizontal, FPrinter) div 100;
      liImageHeight   := ppToMMThousandths(aDrawImage.Picture.Graphic.Height, utPrinterPixels, pprtHorizontal, FPrinter) div 100;

     {lDrawRect := Rect(liScreenLeft, liScreenTop, liScreenWidth, liScreenHeight);}

      SetMapMode(FCanvas.Handle, MM_ANISOTROPIC);
      SetWindowOrgEx(  FCanvas.Handle, 0, 0, nil);
      SetWindowExtEx(  FCanvas.Handle, liImageWidth, liImageHeight, nil);
      SetViewportExtEx(FCanvas.Handle, liScreenWidth, liScreenHeight, nil);
      SetViewportOrgEx(FCanvas.Handle, 0, 0, nil);

      {draw image}
     {FCanvas.StretchDraw(lDrawRect, aDrawImage.Picture.Graphic)}

      FCanvas.Draw(lDrawRect.Left, lDrawRect.Top, aDrawImage.Picture.Graphic);

    end

  else
    begin

      lSaveClipRgn := 0;
      GetClipRgn (FCanvas.Handle, lSaveClipRgn);

      {set clipping region}
      lNewClipRgn  := CreateRectRgnIndirect(aDrawImage.DrawRect);
      SelectClipRgn (FCanvas.Handle, lNewClipRgn);


      if aDrawImage.Center then
        begin
          lDrawRect.Left := lDrawRect.Left + ((liControlWidth  - liImageWidth)  div 2);
          lDrawRect.Top  := lDrawRect.Top  + ((liControlHeight - liImageHeight) div 2);
        end;

      lDrawRect.Right  := lDrawRect.Left + liImageWidth;
      lDrawRect.Bottom := lDrawRect.Top  + liImageHeight;

      FCanvas.StretchDraw(lDrawRect, aDrawImage.Picture.Graphic);

      {restore clipping region}
      SelectClipRgn(FCanvas.Handle, lSaveClipRgn);
      DeleteObject(lNewClipRgn);


  end;

end; {procedure, DirectDrawImage}

{$ENDIF}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.DirectDrawImage }

procedure TppPrinterDevice.DirectDrawImage(aDrawImage: TppDrawImage);
var
  lSaveClipRgn: HRGN;
  lNewClipRgn: HRGN;
  lDrawRect: TRect;
  liImageWidth: Integer;
  liImageHeight: Integer;
  liControlWidth: Integer;
  liControlHeight: Integer;
  lfScale: Single;
  liScaledWidth: Integer;
  liScaledHeight: Integer;


begin


  if aDrawImage.Transparent then
    FCanvas.CopyMode := cmSrcAnd
  else
    FCanvas.CopyMode := cmSrcCopy;


  {initialize}
  lDrawRect := aDrawImage.DrawRect;

  {compute control dimensions in printer pixels}
  liControlWidth  := lDrawRect.Right  - lDrawRect.Left;
  liControlHeight := lDrawRect.Bottom - lDrawRect.Top;


  {compute image dimensions in printer pixels}
  liImageWidth    := Trunc(ppFromScreenPixels(aDrawImage.Picture.Graphic.Width, utPrinterPixels, pprtHorizontal, FPrinter));
  liImageHeight   := Trunc(ppFromScreenPixels(aDrawImage.Picture.Graphic.Height, utPrinterPixels, pprtHorizontal, FPrinter));


  if aDrawImage.Stretch then
    begin

      {scale the draw rect to maintain aspect ratio, if needed }
      if aDrawImage.MaintainAspectRatio then
        begin
          lfScale := ppCalcAspectRatio(liImageWidth, liImageHeight, liControlWidth, liControlHeight);

          liScaledWidth  := Trunc(liImageWidth  * lfScale);
          liScaledHeight := Trunc(liImageHeight * lfScale);

          if aDrawImage.Center then
            begin
              lDrawRect.Left := lDrawRect.Left + ((liControlWidth  - liScaledWidth)   div 2);
              lDrawRect.Top  := lDrawRect.Top  + ((liControlHeight - liScaledHeight)  div 2);
            end;

          lDrawRect.Right  := lDrawRect.Left + liScaledWidth;
          lDrawRect.Bottom := lDrawRect.Top  + liScaledHeight;

        end;

      {draw image}
      FCanvas.StretchDraw(lDrawRect, aDrawImage.Picture.Graphic);

    end

  else
    begin

      lSaveClipRgn := 0;
      GetClipRgn (FCanvas.Handle, lSaveClipRgn);

      {set clipping region}
      lNewClipRgn  := CreateRectRgnIndirect(aDrawImage.DrawRect);
      SelectClipRgn (FCanvas.Handle, lNewClipRgn);


      if aDrawImage.Center then
        begin
          lDrawRect.Left := lDrawRect.Left + ((liControlWidth  - liImageWidth)  div 2);
          lDrawRect.Top  := lDrawRect.Top  + ((liControlHeight - liImageHeight) div 2);
        end;

      lDrawRect.Right  := lDrawRect.Left + liImageWidth;
      lDrawRect.Bottom := lDrawRect.Top  + liImageHeight;

      FCanvas.StretchDraw(lDrawRect, aDrawImage.Picture.Graphic);

      {restore clipping region}
      SelectClipRgn(FCanvas.Handle, lSaveClipRgn);
      DeleteObject(lNewClipRgn);


  end;

end; {procedure, DirectDrawImage}
{------------------------------------------------------------------------------}
{ TppPrinterDevice.DrawBMP }

procedure TppPrinterDevice.DrawBMP(aDrawImage: TppDrawImage);
var
  lSaveClipRgn: HRGN;
  lNewClipRgn: HRGN;
  lDrawRect: TRect;
  liImageWidth: Integer;
  liImageHeight: Integer;
  liControlWidth: Integer;
  liControlHeight: Integer;
  lfScale: Single;
  liScaledWidth: Integer;
  liScaledHeight: Integer;


begin

  if aDrawImage.Transparent then
    FCanvas.CopyMode := cmSrcAnd
  else
    FCanvas.CopyMode := cmSrcCopy;


  {initialize}
  lDrawRect := aDrawImage.DrawRect;

  {compute control dimensions in printer pixels}
  liControlWidth  := lDrawRect.Right  - lDrawRect.Left;
  liControlHeight := lDrawRect.Bottom - lDrawRect.Top;

  {compute image dimensions in printer pixels}
  liImageWidth    := Trunc(ppFromScreenPixels(aDrawImage.Picture.Graphic.Width, utPrinterPixels, pprtHorizontal, FPrinter));
  liImageHeight   := Trunc(ppFromScreenPixels(aDrawImage.Picture.Graphic.Height, utPrinterPixels, pprtHorizontal, FPrinter));


  if aDrawImage.Stretch then
    begin

      {scale the draw rect to maintain aspect ration, if needed }
      if aDrawImage.MaintainAspectRatio then
        begin

          lfScale := ppCalcAspectRatio(liImageWidth, liImageHeight, liControlWidth, liControlHeight);

          liScaledWidth  := Trunc(liImageWidth  * lfScale);
          liScaledHeight := Trunc(liImageHeight * lfScale);

          if aDrawImage.Center then
            begin
              lDrawRect.Left := lDrawRect.Left + ((liControlWidth  - liScaledWidth)   div 2);
              lDrawRect.Top  := lDrawRect.Top  + ((liControlHeight - liScaledHeight)  div 2);
            end;

          lDrawRect.Right  := lDrawRect.Left + liScaledWidth;
          lDrawRect.Bottom := lDrawRect.Top  + liScaledHeight;

        end;

      {draw the bmp to the device}
      if aDrawImage.Transparent then
        ppDrawTransparentDIBitmap(FCanvas, lDrawRect, aDrawImage.AsBitmap, cmSrcCopy)
      else
        ppDrawDIBitmap(FCanvas, lDrawRect, aDrawImage.AsBitmap, cmSrcCopy);

    end

  else
    begin

      lSaveClipRgn := 0;
      GetClipRgn (FCanvas.Handle, lSaveClipRgn);

      {set clipping region}
      lNewClipRgn  := CreateRectRgnIndirect(aDrawImage.DrawRect);
      SelectClipRgn (FCanvas.Handle, lNewClipRgn);


      if aDrawImage.Center then
        begin
          lDrawRect.Left := lDrawRect.Left + ((liControlWidth  - liImageWidth)  div 2);
          lDrawRect.Top  := lDrawRect.Top  + ((liControlHeight - liImageHeight) div 2);
        end;

      lDrawRect.Right  := lDrawRect.Left + liImageWidth;
      lDrawRect.Bottom := lDrawRect.Top  + liImageHeight;

      {draw the clipped bmp to the device}
      if aDrawImage.Transparent then
        ppDrawTransparentDIBitmap(FCanvas, lDrawRect, aDrawImage.AsBitmap, cmSrcCopy)
      else
        ppDrawDIBitmap(FCanvas, lDrawRect, aDrawImage.AsBitmap, cmSrcCopy);

      {restore clipping region}
      SelectClipRgn(FCanvas.Handle, lSaveClipRgn);

      DeleteObject(lNewClipRgn);

  end;

end; {procedure, DrawBMP}


{------------------------------------------------------------------------------}
{ TppPrinterDevice.DrawGraphic }

procedure TppPrinterDevice.DrawGraphic(aDrawImage: TppDrawImage);
var
  lClipRect: TRect;
  lMemCanvas: TppDeviceCompatibleCanvas;
  lCopyMode: TCopyMode;
  liPictureWidth, liPictureHeight: Longint;
  liDrawWidth, liDrawHeight: Longint;
  lfScale: Single;
  liScaledWidth: Integer;
  liScaledHeight: Integer;
  

begin

  {calc size of image in PrinterPixels}
  liPictureWidth  := Trunc(ppFromScreenPixels(aDrawImage.Picture.Width, utPrinterPixels, pprtHorizontal, FPrinter));
  liPictureHeight := Trunc(ppFromScreenPixels(aDrawImage.Picture.Height, utPrinterPixels, pprtVertical, FPrinter));

  {calc size of draw command in PrinterPixels}
  liDrawWidth  := aDrawImage.DrawRight  - aDrawImage.DrawLeft;
  liDrawHeight := aDrawImage.DrawBottom - aDrawImage.DrawTop;

  {compute clipping rect based on control size & picture size }
  if aDrawImage.Stretch and aDrawImage.MaintainAspectRatio then
    begin

      lClipRect := Rect(0, 0, liDrawWidth, liDrawHeight);

      lfScale := ppCalcAspectRatio(liPictureWidth, liPictureHeight, liDrawWidth, liDrawHeight);

      liScaledWidth  := Trunc(liPictureWidth  * lfScale);
      liScaledHeight := Trunc(liPictureHeight * lfScale);

      if aDrawImage.Center then
        begin
          lClipRect.Left := lClipRect.Left + ((liDrawWidth  - liScaledWidth)   div 2);
          lClipRect.Top  := lClipRect.Top  + ((liDrawHeight - liScaledHeight)  div 2);
        end;

      lClipRect.Right  := lClipRect.Left + liScaledWidth;
      lClipRect.Bottom := lClipRect.Top  + liScaledHeight;


    end
  else if aDrawImage.Stretch then
    lClipRect := Rect(0, 0, liDrawWidth, liDrawHeight)

  else if aDrawImage.Center then
    lClipRect := Bounds((liDrawWidth - liPictureWidth) div 2, (liDrawHeight - liPictureHeight) div 2,
                 liPictureWidth, liPictureHeight)
  else
    lClipRect := Rect(0, 0, liPictureWidth, liPictureHeight);


   {create a device compatible canvas in memory - with the required dimensions}
  lMemCanvas := TppDeviceCompatibleCanvas.Create(FCanvas.Handle, liDrawWidth, liDrawHeight, aDrawImage.Picture.Graphic.Palette);

  {draw the graphic to the temp canvas and clip}
  if (aDrawImage.Picture.Graphic is TBitmap) then

    ppDrawDIBitmap(lMemCanvas, lClipRect, aDrawImage.Picture.Bitmap, cmSrcCopy)
  else
    lMemCanvas.StretchDraw(lClipRect, aDrawImage.Picture.Graphic);

  if aDrawImage.Transparent then
    lCopyMode := cmSrcAnd
  else
    lCopyMode := cmSrcCopy;

{$IFDEF Delphi3}

  {render the graphic to the device canvas}
  lMemCanvas.RenderToDevice(aDrawImage.DrawRect, aDrawImage.Picture.Graphic.Palette, lCopyMode);

{$ELSE}

  {render the graphic to the device canvas}
  if (aDrawImage.Picture.Graphic is TBitmap) then
     lMemCanvas.RenderToDevice(aDrawImage.DrawRect, aDrawImage.Picture.Bitmap.Palette, lCopyMode)
  else
    lMemCanvas.RenderToDevice(aDrawImage.DrawRect, 0, lCopyMode);

{$ENDIF}

  lMemCanvas.Free;

end; {procedure, DrawGraphic}

{------------------------------------------------------------------------------}
{ TppPrinterDevice.DrawText }

procedure TppPrinterDevice.DrawText(aDrawText: TppDrawText);
var
  liLineHeight: Integer;
  liLineSpaceUsed: Integer;
  liLines: Integer;
  liLine: Integer;
  lDrawRect: TRect;
  lRect: TRect;
  lCalcRect: TRect;
  liRectWidth: Integer;
  liTextWidth: Integer;
  lSourceText: TStringList;
  lsLine: String;
  liStart: Integer;
  liLeading: Integer;

  lLineBuf: PChar;
  lTextMetric: TTextMetric;

  llRectHeight: Longint;
  llCalcHeight: Longint;

  liTabStopCount : Integer;
  lTabStopArray : TppTabStopPos;
  liTop: Integer;
  liMaxWidth: Integer;

begin


  liTabStopCount := 0;

  {convert memo tab stop positions to printer units, if needed }
  if aDrawText.IsMemo and (aDrawText.TabStopPositions.Count > 0) then
    ppConvertTabStopPos(utPrinterPixels, aDrawText.TabStopPositions, lTabStopArray, liTabStopCount, FPrinter);

{$IFDEF Delphi3}

  if (FCanvas.Font.CharSet <> aDrawText.Font.CharSet) or
{$ELSE}
  if
{$ENDIF}
     (FCanvas.Font.Color   <> aDrawText.Font.Color)   or
     (FCanvas.Font.Pitch   <> aDrawText.Font.Pitch)   or
     (FCanvas.Font.Size    <> aDrawText.Font.Size)    or
     (FCanvas.Font.Style   <> aDrawText.Font.Style)   or
     (FCanvas.Font.Name    <> aDrawText.Font.Name) then

    FCanvas.Font := aDrawText.Font;


  {calc line height}
  GetTextMetrics(FCanvas.Handle, lTextMetric);

  {use default leading for this font}
  if not(aDrawText.IsMemo) then
    liLeading := lTextMetric.tmExternalLeading

  else
    {scale leading specified by user for printer }
    liLeading := Trunc(ppFromMMThousandths(aDrawText.Leading, utPrinterPixels, pprtVertical, FPrinter));


  liLineHeight := lTextMetric.tmHeight + liLeading;

  lDrawRect := Rect(aDrawText.DrawLeft, aDrawText.DrawTop, aDrawText.DrawRight, aDrawText.DrawBottom );

  {adjust bounding rect height}
  if aDrawText.AutoSize and not(aDrawText.WordWrap) and (Length(aDrawText.Text) > 0) then
    begin
      llRectHeight := lDrawRect.Bottom - lDrawRect.Top;
      llCalcHeight := liLineHeight;

      if (llCalcHeight > llRectHeight) then
        lDrawRect.Bottom := lDrawRect.Top + llCalcHeight;

    end;

  liLines := aDrawText.WrappedText.Count - 1;

  lSourceText := TStringList.Create;

  if aDrawText.WordWrap then
    lSourceText.Assign(aDrawText.WrappedText)

  else if (Length(aDrawText.Text) > 0) then
    begin
      lSourceText.Add(aDrawText.Text);

      liLines := 0;
    end;

  {set rectangle to original value}
  lCalcRect := lDrawRect;

  {calculate rectangle width based on longest text}
  if aDrawText.AutoSize then
    begin

      liMaxWidth := 0;

      {calc max line width}
      for liLine := 0 to liLines do
        begin
          lsLine := lSourceText[liLine];

          liTextWidth  := FCanvas.TextWidth(lsLine);
          if liTextWidth > liMaxWidth then
            liMaxWidth := liTextWidth;
        end;

      liRectWidth := (lCalcRect.Right - lCalcRect.Left);

      {if text wider than rectangle, adjust rectangle}
      if (liMaxWidth <> liRectWidth) then
        begin

          {adjust rectangle}
          if aDrawText.Alignment = taLeftJustify then
            lCalcRect.Right := lCalcRect.Left + liMaxWidth

          else if aDrawText.Alignment = taRightJustify then
            lCalcRect.Left := lCalcRect.Right - liMaxWidth

          else if aDrawText.Alignment = taCenter then
            begin
              lCalcRect.Left  := lCalcRect.Left + Round((liRectWidth - liMaxWidth) / 2);
              lCalcRect.Right := lCalcRect.Left + liMaxWidth;
            end;

        end; {text wider than rectangle}

    end; {if, AutoSize}

  {fill rectangle with background color}
  if not(aDrawText.Transparent) then
    begin
      FCanvas.Brush.Color := aDrawText.Color;
      FCanvas.Brush.Style := bsSolid;
      FCanvas.FillRect(lCalcRect);
    end;

  FCanvas.Brush.Style := bsClear;

{$IFDEF Delphi4}
  FCanvas.TextFlags := 0;
{$ENDIF}

  liLineSpaceUsed := 0;

  for liLine := 0 to liLines do
    begin
      lsLine := lSourceText[liLine];

      {calculate width of text}
      liTextWidth := FCanvas.TextWidth(lsLine);

      liRectWidth := (lCalcRect.Right - lCalcRect.Left);

      {reset rectangle to original value}
      lRect := lCalcRect;

      lRect.Top := lRect.Top + liLineSpaceUsed;

      liTop := lRect.Top;

      {justify text}
      if aDrawText.Alignment = taLeftJustify then
        liStart := lRect.Left

      else if aDrawText.Alignment = taRightJustify then
        liStart := lRect.Right - liTextWidth

      else if aDrawText.Alignment = taCenter then
        liStart := lRect.Left + Round( ( (liRectWidth - liTextWidth) / 2) - 0.5)

      else
        liStart := 0;

      {draw the text}
      if aDrawText.IsMemo then
        begin
          lLineBuf := StrAlloc(Length(lsLine) + 1);
          StrPCopy(lLineBuf, lsLine);
          TabbedTextOut(FCanvas.Handle, liStart, liTop, lLineBuf, StrLen(lLineBuf), liTabStopCount, lTabStopArray, liStart);
          StrDispose(lLineBuf);
        end

      else
        FCanvas.TextRect(lRect, liStart, liTop, lsLine);

      {goto next line}
      Inc(liLineSpaceUsed, liLineHeight);
    end; {for, each line of text}

  lSourceText.Free;

  {update size of draw rect}
  if aDrawText.AutoSize then
    begin
      aDrawText.DrawLeft   := lCalcRect.Left;
      aDrawText.DrawRight  := lCalcRect.Right;
      aDrawText.DrawBottom := aDrawText.DrawTop + liLineSpaceUsed;
    end;

end; {procedure, DrawText}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterDevice(TppPrinterDevice);

finalization

  ppUnRegisterDevice(TppPrinterDevice);

end.
