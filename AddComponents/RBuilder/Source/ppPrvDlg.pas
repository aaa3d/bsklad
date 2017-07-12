{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppPrvDlg;

interface

{$I ppIfDef.pas}

uses
  Windows, ComCtrls, SysUtils, Messages, Classes, Graphics, Controls, Forms, ExtCtrls, StdCtrls, Mask, Buttons,
  ppForms, ppTypes, ppProd, ppDevice, ppViewr, Dialogs, ppUtils;

type

  { TppPrintPreview }
  TppPrintPreview = class(TppCustomPreviewer)
    pnlPreviewBar: TPanel;
    spbPreviewPrint: TSpeedButton;
    Bevel1: TBevel;
    ppViewer1: TppViewer;
    spbAutoSearch: TSpeedButton;
    pnlStandardButtons: TPanel;
    spbPreviewWhole: TSpeedButton;
    spbPreviewFirst: TSpeedButton;
    spbPreviewPrior: TSpeedButton;
    spbPreviewNext: TSpeedButton;
    spbPreviewLast: TSpeedButton;
    spbPreviewWidth: TSpeedButton;
    spbPreview100Percent: TSpeedButton;
    spbPreviewClose: TSpeedButton;
    mskPreviewPage: TMaskEdit;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure spbAutoSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FStatusBar: TStatusBar;

  protected
    function  GetViewer: TObject; override;
    procedure LanguageChanged; override;

  public
    procedure Init; override;

  end; {class, TppPrintPreview}

var
  ppPrintPreview: TppPrintPreview;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TppPrintPreview.FormCreate }

procedure TppPrintPreview.FormCreate(Sender: TObject);
begin

  FStatusBar := TStatusBar.Create(Self);
  FStatusBar.Parent      := Self;
  FStatusBar.SimplePanel := True;
  FStatusBar.Align       := alBottom;

end; {procedure FormCreate}

{------------------------------------------------------------------------------}
{ TppPrintPreview.FormClose}

procedure TppPrintPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end; {procedure FormClose}

{------------------------------------------------------------------------------}
{ TppPrintPreview.Init }

procedure TppPrintPreview.Init;
begin

  if (Report is TppProducer) then
    ppViewer1.Report := TppProducer(Report);

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppPrintPreview.FormShow }

procedure TppPrintPreview.FormShow(Sender: TObject);
begin

  if (Report is TppProducer) then
    spbAutoSearch.Visible := TppProducer(Report).ShowAutoSearchDialog;

  if not(spbAutoSearch.Visible) then
    pnlStandardButtons.Left := spbAutoSearch.Left;

  spbPreviewWhole.Down      := (ppViewer1.ZoomSetting = zsWholePage);
  spbPreviewWidth.Down      := (ppViewer1.ZoomSetting = zsPageWidth);
  spbPreview100Percent.Down := (ppViewer1.ZoomSetting = zs100Percent);

end; {procedure, FormShow}

{------------------------------------------------------------------------------}
{ TppPrintPreview.LanguageChanged}

procedure TppPrintPreview.LanguageChanged;
var
  lBitMap: TBitMap;
begin

  spbAutoSearch.Hint := ppLoadStr(1021);
  spbPreviewPrint.Hint := ppLoadStr(22);
  spbPreviewWhole.Hint := ppLoadStr(30);
  spbPreviewWidth.Hint := ppLoadStr(31);
  spbPreview100Percent.Hint := ppLoadStr(1); {'100 %'}
  spbPreviewFirst.Hint := ppLoadStr(13);
  spbPreviewPrior.Hint := ppLoadStr(29);
  spbPreviewNext.Hint  := ppLoadStr(15);
  spbPreviewLast.Hint  := ppLoadStr(14);
  spbPreviewClose.Caption := ppLoadStr(6); {'Close'}

  lBitMap := TBitMap.Create;
  spbPreviewClose.Width := lBitMap.Canvas.TextWidth(spbPreviewClose.Caption) + 30;
  lBitMap.Free;

  Caption := ppLoadStr(23);

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppPrintPreview.GetViewer }

function TppPrintPreview.GetViewer: TObject;
begin
  Result := ppViewer1;
end; {function, GetViewer}

{------------------------------------------------------------------------------}
{ TppPrintPreview.ppViewer1PrintStateChange }

procedure TppPrintPreview.ppViewer1PrintStateChange(Sender: TObject);
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

      spbPreviewClose.Caption := ppLoadStr(6); {'Close'}
    end;

  {this code will force the cursor to update}
  GetCursorPos(lPosition);
  SetCursorPos(lPosition.X, lPosition.Y);

end; {procedure, ppViewer1PrintStateChange}

{------------------------------------------------------------------------------}
{ TppPrintPreview.FormKeyDown}

procedure TppPrintPreview.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
{ TppPrintPreview.spbCloseClick }

procedure TppPrintPreview.spbPreviewCloseClick(Sender: TObject);
begin
  if TppProducer(Report).Printing then
    ppViewer1.Cancel
  else
    Close;
end; {procedure, spbCloseClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.ppViewerStatusChange }

procedure TppPrintPreview.ppViewerStatusChange(Sender: TObject);
begin
  FStatusBar.SimpleText := ppViewer1.Status;
end; {procedure, ppViewerStatusChange}

{------------------------------------------------------------------------------}
{ TppPrintPreview.ppViewerPageChange }

procedure TppPrintPreview.ppViewerPageChange(Sender: TObject);
begin
  mskPreviewPage.Text := IntToStr(ppViewer1.AbsolutePageNo);
  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, ppViewerPageChange}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewPrintClick }

procedure TppPrintPreview.spbPreviewPrintClick(Sender: TObject);
begin
  ppViewer1.Print;
end; {procedure, spbPreviewPrintClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbAutoSearchClick}

procedure TppPrintPreview.spbAutoSearchClick(Sender: TObject);
begin
  ppViewer1.DisplayAutoSearchDialog;
end; {procedure, spbAutoSearchClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewFirstClick}

procedure TppPrintPreview.spbPreviewFirstClick(Sender: TObject);
begin
  ppViewer1.FirstPage;
end; {procedure, spbCloseClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewPriorClick}

procedure TppPrintPreview.spbPreviewPriorClick(Sender: TObject);
begin
  ppViewer1.PriorPage;
end; {procedure, spbPreviewFirstClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewNextClick}

procedure TppPrintPreview.spbPreviewNextClick(Sender: TObject);
begin
  ppViewer1.NextPage;
end; {procedure, spbPreviewNextClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewLastClick}

procedure TppPrintPreview.spbPreviewLastClick(Sender: TObject);
begin
  ppViewer1.LastPage;
end; {procedure, spbPreviewLastClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.mskPreviewPageKeyPress}

procedure TppPrintPreview.mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
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

procedure TppPrintPreview.spbPreviewWholeClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsWholePage;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, spbPreviewZoomClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreviewWidthClick}

procedure TppPrintPreview.spbPreviewWidthClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsPageWidth;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, spbPreviewWidthClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.spbPreview100PercentClick}

procedure TppPrintPreview.spbPreview100PercentClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zs100Percent;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, spbPreview100PercentClick}

{------------------------------------------------------------------------------}
{ TppPrintPreview.mskPreviewPercentageKeyPress}

procedure TppPrintPreview.mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
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

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}



initialization

  ppRegisterForm(TppCustomPreviewer, TppPrintPreview);

finalization

  ppUnRegisterForm(TppCustomPreviewer);

end.
