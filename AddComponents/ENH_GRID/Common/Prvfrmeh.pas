{*******************************************************}
{                                                       }
{                       EhLib v1.5                      }
{                  TPreviewFormEh form                  }
{                                                       }
{   Copyright (c) 1998, 1999 by Dmitry V. Bolshakov     }
{                                                       }
{*******************************************************}

unit PrvFrmEh;

{$I EhLib.Inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
{$IFDEF EH_LIB_4} ImgList,{$ENDIF}
  PrViewEh, ComCtrls, Menus, ExtCtrls, ToolWin, StdCtrls;

type
  TPreviewFormEh = class(TForm)
    PreviewEh1: TPreviewBox;
    tbrMain: TToolBar;
    tbtPrint: TToolButton;
    tbtPrinterSetupDialog: TToolButton;
    tbtScale: TToolButton;
    tbtPrevPage: TToolButton;
    tbtNextPage: TToolButton;
    tbStop: TToolButton;
    tbClose: TToolButton;
    Splitter: TSplitter;
    pmnScale: TPopupMenu;
    mni500: TMenuItem;
    mni200: TMenuItem;
    mni150: TMenuItem;
    mni100: TMenuItem;
    mni75: TMenuItem;
    mni50: TMenuItem;
    mni25: TMenuItem;
    mni10: TMenuItem;
    mniWidth: TMenuItem;
    mniFull: TMenuItem;
    imlMain: TImageList;
    stbMain: TStatusBar;
    Timer1: TTimer;
    procedure tbtPrintClick(Sender: TObject);
    procedure tbtPrintDialogClick(Sender: TObject);
    procedure tbtPrinterSetupDialogClick(Sender: TObject);
    procedure tbtPrevPageClick(Sender: TObject);
    procedure tbtNextPageClick(Sender: TObject);
    procedure tbStopClick(Sender: TObject);
    procedure tbCloseClick(Sender: TObject);
    procedure mniScaleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SplitterCanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
    procedure tbtScaleClick(Sender: TObject);
    procedure PreviewEh1PrinterPreviewChanged(Sender: TObject);
    procedure PreviewEh1OpenPreviewer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tbtNextPageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbtNextPageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbtPrevPageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbtPrevPageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FPressedButton:TToolButton;
  public
    { Public declarations }
  end;

var
  PreviewFormEh: TPreviewFormEh;

implementation

{$R *.DFM}

const
  InitRepeatPause = 400;  { pause before repeat timer (ms) }
  RepeatPause     = 100;  { pause before hint window displays (ms)}

procedure TPreviewFormEh.tbtPrintClick(Sender: TObject);
begin
//  if Assigned(PreviewEh1.Printer) then PreviewEh1.Printer.Print;
  PreviewEh1.PrintDialog;
end;

procedure TPreviewFormEh.tbtPrintDialogClick(Sender: TObject);
begin
  PreviewEh1.PrintDialog;
end;

procedure TPreviewFormEh.tbtPrinterSetupDialogClick(Sender: TObject);
begin
  PreviewEh1.PrinterSetupDialog;  
end;

procedure TPreviewFormEh.tbtPrevPageClick(Sender: TObject);
begin
  if FPressedButton <> nil then
    PreviewEh1.PageIndex := Pred(PreviewEh1.PageIndex);
end;

procedure TPreviewFormEh.tbtNextPageClick(Sender: TObject);
begin
  if FPressedButton <> nil then
    PreviewEh1.PageIndex:=Succ(PreviewEh1.PageIndex);
end;

procedure TPreviewFormEh.tbStopClick(Sender: TObject);
begin
  PreviewEh1.Printer.Abort;
end;

procedure TPreviewFormEh.tbCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TPreviewFormEh.mniScaleClick(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    Checked := True;
    PreviewEh1.ViewMode:=TViewMode(Tag);
    PreviewEh1.UpdatePageSetup;
  end;
end;

procedure TPreviewFormEh.FormCreate(Sender: TObject);
begin
{$IFDEF EH_LIB_4} 
  Splitter.OnCanResize := SplitterCanResize;
  Splitter.ResizeStyle := rsUpdate;
{$ELSE} {Borland Delphi 3.0 }
  Splitter.Visible := False;
{$ENDIF}
end;

procedure TPreviewFormEh.SplitterCanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
begin
  if (NewSize >= 38 + 3) and (tbrMain.Images = nil) and tbrMain.ShowCaptions then begin
    tbrMain.ShowCaptions := False;
    tbrMain.Images := imlMain;
    tbrMain.ButtonHeight := 38;
    tbrMain.ButtonWidth := 39;
  end else
   if (NewSize >= 52 + 3) and not tbrMain.ShowCaptions and (tbrMain.Images <> nil) then
    tbrMain.ShowCaptions := True
  else if (NewSize <= 21 + 3) and not tbrMain.ShowCaptions and (tbrMain.Images <> nil) then begin
    tbrMain.Images := nil; tbrMain.ShowCaptions := True;
  end
  else if (NewSize <= 38 + 3) and tbrMain.ShowCaptions and (tbrMain.Images <> nil) then begin
    tbrMain.ShowCaptions := False;
    tbrMain.ButtonHeight := 38;
    tbrMain.ButtonWidth := 39;
  end
end;

procedure TPreviewFormEh.tbtScaleClick(Sender: TObject);
var p:TPoint;
begin
  p := tbtScale.ClientToScreen(Point(0,tbtScale.Height));
  tbtScale.DropdownMenu.Popup(p.x,p.y);
end;

procedure TPreviewFormEh.PreviewEh1PrinterPreviewChanged(Sender: TObject);
begin
  tbStop.Enabled := PreviewEh1.Printer.Printing;
  tbClose.Enabled := not PreviewEh1.Printer.Printing;
  tbtPrint.Enabled := not PreviewEh1.Printer.Printing and
    (PreviewEh1.Printer.Printer.Printers.Count > 0);
  tbtPrinterSetupDialog.Enabled := not PreviewEh1.Printer.Printing and
    (Assigned(PreviewEh1.OnPrinterSetupDialog) or Assigned(PreviewEh1.OnPrinterSetupChanged)) and
    Assigned(PreviewEh1.PrinterSetupOwner);
  tbtPrevPage.Enabled:=PreviewEh1.PageIndex>1;
  tbtNextPage.Enabled:=PreviewEh1.PageIndex<PreviewEh1.PageCount;
  stbMain.SimpleText:='Page '+IntToStr(PreviewEh1.PageIndex)+' of '+IntToStr(PreviewEh1.PageCount);
  case PreviewEh1.ViewMode of
      vm500: mni500.Checked:=True;
      vm200: mni200.Checked:=True;
      vm150: mni150.Checked:=True;
      vm100: mni100.Checked:=True;
      vm75: mni75.Checked:=True;
      vm50: mni50.Checked:=True;
      vm25: mni25.Checked:=True;
      vm10: mni10.Checked:=True;
      vmPageWidth: mniWidth.Checked:=True;
      vmFullPage: mniFull.Checked:=True;
   end;
  Caption := 'Preview - ' + PreviewEh1.Printer.Title;
end;

procedure TPreviewFormEh.PreviewEh1OpenPreviewer(Sender: TObject);
begin
  if IsIconic(Handle) then ShowWindow(Handle,sw_Restore);
  BringWindowToTop(Handle);
  if not Visible then Show;
end;

type
  TToolButtonCracker = class(TToolButton)
    property MouseCapture;
  end;

procedure TPreviewFormEh.Timer1Timer(Sender: TObject);
begin
  Timer1.Interval := RepeatPause;
  if FPressedButton <> nil then
    if {FPressedButton.Down and} TToolButtonCracker(FPressedButton).MouseCapture then
    begin
      try
        FPressedButton.Click;
      except
        Timer1.Enabled := False;
        raise;
      end;
    end;
end;

procedure TPreviewFormEh.tbtNextPageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Interval := InitRepeatPause;
   Timer1.Enabled  := True;
   FPressedButton := tbtNextPage;
end;

procedure TPreviewFormEh.tbtNextPageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if Timer1.Enabled and (Timer1.Interval = InitRepeatPause) and (FPressedButton <> nil) then
     FPressedButton.Click;
   Timer1.Enabled  := False;
   FPressedButton := nil;
end;

procedure TPreviewFormEh.tbtPrevPageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Interval := InitRepeatPause;
   Timer1.Enabled  := True;
   FPressedButton := tbtPrevPage;
end;

procedure TPreviewFormEh.tbtPrevPageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if Timer1.Enabled and (Timer1.Interval = InitRepeatPause) and (FPressedButton <> nil) then
     FPressedButton.Click;
   Timer1.Enabled  := False;
   FPressedButton := nil;
end;

end.
