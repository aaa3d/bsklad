{******************************************}
{ }
{ FastReport v3.0 }
{ Report options }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxEditReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frxCtrls, ComCtrls
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxReportEditorForm = class(TForm)
    OkB:TButton;
    CancelB:TButton;
    PageControl:TPageControl;
    GeneralTS:TTabSheet;
    DescriptionTS:TTabSheet;
    PrinterImg:TImage;
    ReportSettingsL:TGroupBox;
    PrintersLB:TListBox;
    CopiesL:TLabel;
    CopiesE:TEdit;
    CollateCB:TCheckBox;
    GeneralL:TGroupBox;
    PasswordL:TLabel;
    DoublePassCB:TCheckBox;
    PrintIfEmptyCB:TCheckBox;
    PasswordE:TEdit;
    DescriptionL:TGroupBox;
    Bevel3:TBevel;
    NameL:TLabel;
    PictureImg:TImage;
    Description1L:TLabel;
    PictureL:TLabel;
    AuthorL:TLabel;
    NameE:TEdit;
    DescriptionE:TMemo;
    PictureB:TButton;
    AuthorE:TEdit;
    VersionL:TGroupBox;
    MajorL:TLabel;
    MinorL:TLabel;
    ReleaseL:TLabel;
    BuildL:TLabel;
    CreatedL:TLabel;
    Created1L:TLabel;
    ModifiedL:TLabel;
    Modified1L:TLabel;
    MajorE:TEdit;
    MinorE:TEdit;
    ReleaseE:TEdit;
    BuildE:TEdit;
    procedure FormCreate(Sender:TObject);
    procedure PictureBClick(Sender:TObject);
    procedure PrintersLBDrawItem(Control:TWinControl; Index:Integer;
      ARect:TRect; State:TOwnerDrawState);
    procedure FormShow(Sender:TObject);
    procedure FormHide(Sender:TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses frxDesgn, frxEditPicture, frxPrinter, frxUtils, frxRes;

procedure TfrxReportEditorForm.FormShow(Sender:TObject);
begin
  with TfrxDesignerForm(Owner).Report do
  begin
    PrintersLB.Items:= frxPrinters.Printers;
    PrintersLB.Items.Insert(0, frxResources.Get('prDefault'));
    PrintersLB.ItemIndex:= PrintersLB.Items.IndexOf(PrintOptions.Printer);
    CollateCB.Checked:= PrintOptions.Collate;
    CopiesE.Text:= IntToStr(PrintOptions.Copies);
    DoublePassCB.Checked:= EngineOptions.DoublePass;
    PrintIfEmptyCB.Checked:= EngineOptions.PrintIfEmpty;
    PasswordE.Text:= ReportOptions.Password;

    NameE.Text:= ReportOptions.Name;
    AuthorE.Text:= ReportOptions.Author;
    DescriptionE.Lines.Text:= ReportOptions.Description.Text;
    PictureImg.Picture.Assign(ReportOptions.Picture);
    PictureImg.Stretch:= (PictureImg.Picture.Width > PictureImg.Width) or
      (PictureImg.Picture.Height > PictureImg.Height);

    MajorE.Text:= ReportOptions.VersionMajor;
    MinorE.Text:= ReportOptions.VersionMinor;
    ReleaseE.Text:= ReportOptions.VersionRelease;
    BuildE.Text:= ReportOptions.VersionBuild;
    Created1L.Caption:= DateTimeToStr(ReportOptions.CreateDate);
    Modified1L.Caption:= DateTimeToStr(ReportOptions.LastChange);
  end;
end;

procedure TfrxReportEditorForm.FormHide(Sender:TObject);
begin
  if ModalResult = mrOk then
    with TfrxDesignerForm(Owner).Report do
    begin
      if PrintersLB.ItemIndex<>-1 then
      begin
        PrintOptions.Printer:= PrintersLB.Items[PrintersLB.ItemIndex];
        SelectPrinter;
      end;
      PrintOptions.Collate:= CollateCB.Checked;
      PrintOptions.Copies:= StrToInt(CopiesE.Text);
      EngineOptions.DoublePass:= DoublePassCB.Checked;
      EngineOptions.PrintIfEmpty:= PrintIfEmptyCB.Checked;
      ReportOptions.Password:= PasswordE.Text;

      ReportOptions.Name:= NameE.Text;
      ReportOptions.Author:= AuthorE.Text;
      ReportOptions.Description.Text:= DescriptionE.Lines.Text;
      ReportOptions.Picture.Assign(PictureImg.Picture);
      ReportOptions.VersionMajor:= MajorE.Text;
      ReportOptions.VersionMinor:= MinorE.Text;
      ReportOptions.VersionRelease:= ReleaseE.Text;
      ReportOptions.VersionBuild:= BuildE.Text;
    end;
end;

procedure TfrxReportEditorForm.PictureBClick(Sender:TObject);
begin
  with TfrxPictureEditorForm.Create(Owner) do
  begin
    Image.Picture.Assign(PictureImg.Picture);
    if ShowModal = mrOk then
    begin
      PictureImg.Picture.Assign(Image.Picture);
      PictureImg.Stretch:= (PictureImg.Picture.Width > PictureImg.Width) or
        (PictureImg.Picture.Height > PictureImg.Height);
    end;
    Free;
  end;
end;

procedure TfrxReportEditorForm.PrintersLBDrawItem(Control:TWinControl;
  Index:Integer; ARect:TRect; State:TOwnerDrawState);
var
  s:String;
begin
  with PrintersLB.Canvas do
  begin
    FillRect(ARect);
    frxDrawTransparent(PrintersLB.Canvas, ARect.Left+2, ARect.Top,
      PrinterImg.Picture.Bitmap);
    s:= PrintersLB.Items[Index];
    if (Index<>0) and (frxPrinters[Index-1].Port<>'') then
      s:= s+' '+frxResources.Get('rePrnOnPort')+' '+frxPrinters[Index-1].Port;
    TextOut(ARect.Left+24, ARect.Top+1, s);
  end;
end;

procedure TfrxReportEditorForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

end.
