{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 1999 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit rbPrvDlg;

interface

uses

{$IFDEF WIN32}
  Windows, ComCtrls,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}


  SysUtils, Messages, Classes, Graphics, Controls, Forms, ExtCtrls, StdCtrls, Mask, Buttons,
  ppForms, ppTypes, ppProd, ppDevice, ppViewr, Dialogs, ppUtils;

type
  TrbPrintPreview = class(TppCustomPreviewer)
    pnlPreviewBar: TPanel;
    spbPreviewPrint: TSpeedButton;
    spbPreviewWhole: TSpeedButton;
    spbPreviewFirst: TSpeedButton;
    spbPreviewPrior: TSpeedButton;
    spbPreviewNext: TSpeedButton;
    spbPreviewLast: TSpeedButton;
    mskPreviewPage: TMaskEdit;
    spbPreviewWidth: TSpeedButton;
    spbPreview100Percent: TSpeedButton;
    spbPreviewClose: TSpeedButton;
    Bevel1: TBevel;
    ppViewer1: TppViewer;
    mskPreviewPercentage: TMaskEdit;
    procedure spbPreviewPrintClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewFirstClick(Sender: TObject);
    procedure spbPreviewPriorClick(Sender: TObject);
    procedure spbPreviewNextClick(Sender: TObject);
    procedure spbPreviewLastClick(Sender: TObject);
    procedure mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
    procedure ppViewerPageChange(Sender: TObject);
    procedure ppViewerStatusChange(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure spbPreviewCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
    procedure ppViewer1PrintStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

{$IFDEF WIN32}
    FStatusBar: TStatusBar;
{$ELSE}
    FStatusBar: TPanel;
{$ENDIF}


  protected
    {overriden from TppForm}
    procedure Activate; override;
    procedure LanguageChanged; override;
    procedure ReportAssigned; override;
    function  GetViewer: TObject; override;

  public

  end;



var
  rbPrintPreview: TrbPrintPreview;

implementation

{$R *.DFM}



{------------------------------------------------------------------------------}
{ TppPrintPreview.FormCreate }

procedure TrbPrintPreview.FormCreate(Sender: TObject);
begin

{$IFDEF WIN32}
    FStatusBar := TStatusBar.Create(Self);
    FStatusBar.Parent := Self;
    FStatusBar.SimplePanel := True;
    FStatusBar.Align  := alBottom;
{$ELSE}
    FStatusBar := TPanel.Create(Self);
    FStatusBar.Parent := Self;
    FStatusBar.Height := Round(0.1979 * Screen.PixelsPerInch);
    FStatusBar.Alignment := taLeftJustify;
    FStatusBar.BevelOuter := bvLowered;
    FStatusBar.Align  := alBottom;
{$ENDIF}


end; {procedure FormCreate}

{------------------------------------------------------------------------------}
{ TppPrintPreview.FormClose}

procedure TrbPrintPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{------------------------------------------------------------------------------}
{ TppPrintPreview.FormKeyDown}

procedure TrbPrintPreview.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  lScrollBar: TControlScrollBar;
begin

  if (ssCtrl in Shift) then
    begin

      case Key of
       VK_PRIOR: ppViewer1.PriorPage;
       VK_NEXT:  ppViewer1.NextPage;
       VK_HOME:  ppViewer1.FirstPage;
       VK_END:   ppViewer1.LastPage;
      end;

    end
  else
    begin

      case Key of
       VK_PRIOR, VK_UP:
         begin
           lScrollBar := ppViewer1.ScrollBox.VertScrollBar;
           lScrollBar.Position := lScrollBar.Position - ppViewer1.ScrollBox.Height;
         end;

       VK_NEXT, VK_DOWN:
         begin
           lScrollBar := ppViewer1.ScrollBox.VertScrollBar;
           lScrollBar.Position := lScrollBar.Position + ppViewer1.ScrollBox.Height;
         end;

       VK_LEFT:
         begin
           lScrollBar := ppViewer1.ScrollBox.HorzScrollBar;
           lScrollBar.Position := lScrollBar.Position - ppViewer1.ScrollBox.Width;
         end;

       VK_RIGHT:
         begin
           lScrollBar := ppViewer1.ScrollBox.HorzScrollBar;
           lScrollBar.Position := lScrollBar.Position + ppViewer1.ScrollBox.Width;
         end;

      end;

    end;

end; {procedure, FormKeyDown}

{------------------------------------------------------------------------------}
{ TppPrintPreview.ReportAssigned }

procedure TrbPrintPreview.ReportAssigned;
begin
  if Report is TppProducer then
    ppViewer1.Report := TppProducer(Report);
end; {procedure, ReportAssigned}

{------------------------------------------------------------------------------}
{ TppPrintPreview.Activate }

procedure TrbPrintPreview.Activate;
begin
  inherited Activate;

  spbPreviewWhole.Down := (ppViewer1.ZoomSetting = zsWholePage);
  spbPreviewWidth.Down := (ppViewer1.ZoomSetting = zsPageWidth);
  spbPreview100Percent.Down := (ppViewer1.ZoomSetting = zs100Percent);
  
end; {procedure, ReportAssigned}

{------------------------------------------------------------------------------}
{ TppPrintPreview.LanguageChanged}

procedure TrbPrintPreview.LanguageChanged;
var
  lBitMap: TBitMap;
begin

  {call ppLoadStr defined in ppProd.pas to load string from resource module}
  spbPreviewPrint.Hint := ppLoadStr(ppMsgPrint);
  spbPreviewWhole.Hint := ppLoadStr(ppMsgWhole);
  spbPreviewWidth.Hint := ppLoadStr(ppMsgPageWidth);
  spbPreview100Percent.Hint := ppLoadStr(ppMsg100Percent);
  spbPreviewFirst.Hint := ppLoadStr(ppMsgFirst);
  spbPreviewPrior.Hint := ppLoadStr(ppMsgPrior);
  spbPreviewNext.Hint  := ppLoadStr(ppMsgNext);
  spbPreviewLast.Hint  := ppLoadStr(ppMsgLast);
  spbPreviewClose.Caption := ppLoadStr(ppMsgClose);

  lBitMap := TBitMap.Create;
  spbPreviewClose.Width := lBitMap.Canvas.TextWidth(spbPreviewClose.Caption) + 30;
  lBitMap.Free;

  Caption := ppLoadStr(ppMsgPrintPreview);

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppPrintPreview.GetViewer }

function TrbPrintPreview.GetViewer: TObject;
begin
  Result := ppViewer1;
end; {function, GetViewer}

{------------------------------------------------------------------------------}
{ TppPrintPreview.ppViewer1PrintStateChange }

procedure TrbPrintPreview.ppViewer1PrintStateChange(Sender: TObject);
var
  lPosition: TPoint;
begin

  if ppViewer1.Busy then
    begin
      mskPreviewPercentage.Enabled := False;
      mskPreviewPage.Enabled := False;

      pnlPreviewBar.Cursor := crHourGlass;

      ppViewer1.PaintBox.Cursor := crHourGlass;

      FStatusbar.Cursor := crHourGlass;

      spbPreviewClose.Cursor := crArrow;

      spbPreviewClose.Caption := ppLoadStr(ppMsgCancel);
    end
  else
    begin
      mskPreviewPercentage.Enabled := True;
      mskPreviewPage.Enabled := True;

      pnlPreviewBar.Cursor := crDefault;

      ppViewer1.PaintBox.Cursor := crDefault;

      FStatusbar.Cursor := crDefault;

      spbPreviewClose.Cursor := crDefault;

      spbPreviewClose.Caption := ppLoadStr(ppMsgClose);
    end;

  {this code will force the cursor to update}
  GetCursorPos(lPosition);
  SetCursorPos(lPosition.X, lPosition.Y);

end;

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbCloseClick }

procedure TrbPrintPreview.spbPreviewCloseClick(Sender: TObject);
begin
  if TppProducer(Report).Printing then
    ppViewer1.Cancel
  else
    Close;
end; {procedure, spbCloseClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.ppViewerStatusChange }

procedure TrbPrintPreview.ppViewerStatusChange(Sender: TObject);
begin
{$IFDEF WIN32}
  FStatusbar.SimpleText := ppViewer1.Status;
{$ELSE}
  FStatusbar.Caption := ppViewer1.Status;
{$ENDIF}
end; {procedure, ppViewerStatusChange}

{------------------------------------------------------------------------------}
{ TppPrintPreview.ppViewerPageChange }

procedure TrbPrintPreview.ppViewerPageChange(Sender: TObject);
begin
  mskPreviewPage.Text := IntToStr(ppViewer1.AbsolutePageNo);
  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, ppViewerPageChange}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewPrintClick }

procedure TrbPrintPreview.spbPreviewPrintClick(Sender: TObject);
begin
  ppViewer1.Print;
end; {procedure, spbPreviewPrintClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewFirstClick}

procedure TrbPrintPreview.spbPreviewFirstClick(Sender: TObject);
begin
  ppViewer1.FirstPage;
end; {procedure, spbCloseClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewPriorClick}

procedure TrbPrintPreview.spbPreviewPriorClick(Sender: TObject);
begin
  ppViewer1.PriorPage;
end; {procedure, spbPreviewFirstClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewNextClick}

procedure TrbPrintPreview.spbPreviewNextClick(Sender: TObject);
begin
  ppViewer1.NextPage;
end; {procedure, spbPreviewNextClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewLastClick}

procedure TrbPrintPreview.spbPreviewLastClick(Sender: TObject);
begin
  ppViewer1.LastPage;
end; {procedure, spbPreviewLastClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.mskPreviewPageKeyPress}

procedure TrbPrintPreview.mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
var
  liPage: Longint;
begin

  if (Key = #13) then
    begin
      liPage := StrToInt(mskPreviewPage.Text);

      ppViewer1.GotoPage(liPage);
    end; {if, carriage return pressed}

end; {procedure, mskPreviewPageKeyPress}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewZoomClick }

procedure TrbPrintPreview.spbPreviewWholeClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsWholePage;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, spbPreviewZoomClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewWidthClick}

procedure TrbPrintPreview.spbPreviewWidthClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsPageWidth;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, spbPreviewWidthClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreview100PercentClick}

procedure TrbPrintPreview.spbPreview100PercentClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zs100Percent;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, spbPreview100PercentClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.mskPreviewPercentageKeyPress}

procedure TrbPrintPreview.mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
var
  liPercentage: Integer;
begin
  if (Key = #13) then
    begin
      liPercentage := StrToIntDef(mskPreviewPercentage.Text, 100);

      ppViewer1.ZoomPercentage := liPercentage;

      spbPreviewWhole.Down := False;
      spbPreviewWidth.Down := False;
      spbPreview100Percent.Down := False;

      mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
    end; {if, carriage return pressed}

end; {procedure, mskPreviewPercentageKeyPress}


initialization

  ppRegisterForm(TppCustomPreviewer, TrbPrintPreview);

finalization
  ppUnRegisterForm(TrbPrintPreview);

end.
