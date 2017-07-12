{******************************************}
{ }
{ FastReport v3.0 }
{ Print dialog }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxPrintDialog;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, frxCtrls, ExtCtrls, Buttons, ComCtrls
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxPrintDialog = class(TForm)
    OkB:TButton;
    CancelB:TButton;
    PrintPagesCB:TComboBox;
    PrinterImg:TImage;
    PrintL:TLabel;
    FileDlg:TSaveDialog;
    Label12:TGroupBox;
    TypeL:TLabel;
    WhereL:TLabel;
    TypeL1:TLabel;
    WhereL1:TLabel;
    PrintersCB:TComboBox;
    PropButton:TButton;
    FileCB:TCheckBox;
    ReverseCB:TCheckBox;
    Label1:TGroupBox;
    DescrL:TLabel;
    AllRB:TRadioButton;
    CurPageRB:TRadioButton;
    PageNumbersRB:TRadioButton;
    PageNumbersE:TEdit;
    Label2:TGroupBox;
    CopiesL:TLabel;
    CollateImg:TImage;
    NonCollateImg:TImage;
    CollateL:TLabel;
    CopiesPB:TPaintBox;
    CopiesE:TEdit;
    CollateCB:TCheckBox;
    UpDown1:TUpDown;
    procedure PrintersCBDrawItem(Control:TWinControl; Index:Integer;
      ARect:TRect; State:TOwnerDrawState);
    procedure FormCreate(Sender:TObject);
    procedure PropButtonClick(Sender:TObject);
    procedure PrintersCBClick(Sender:TObject);
    procedure PageNumbersRBClick(Sender:TObject);
    procedure CollateLClick(Sender:TObject);
    procedure CollateCBClick(Sender:TObject);
    procedure CopiesPBPaint(Sender:TObject);
    procedure PageNumbersEEnter(Sender:TObject);
    procedure FormHide(Sender:TObject);
    procedure FormShow(Sender:TObject);
  private
    { Private declarations }
    OldIndex:Integer;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses frxPrinter, Printers, frxUtils, frxGraphicUtils, frxRes;

procedure TfrxPrintDialog.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
  PrintPagesCB.Items.Clear;
  PrintPagesCB.Items.Add(frxResources.Get('ppAll'));
  PrintPagesCB.Items.Add(frxResources.Get('ppOdd'));
  PrintPagesCB.Items.Add(frxResources.Get('ppEven'));
  PrintPagesCB.ItemIndex:= 0;
end;

procedure TfrxPrintDialog.FormShow(Sender:TObject);
begin
  PrintersCB.Items.Assign(frxPrinters.Printers);
  PrintersCB.ItemIndex:= frxPrinters.PrinterIndex;
  PrintersCBClick(nil);
  OldIndex:= frxPrinters.PrinterIndex;
  CollateCBClick(nil);
  PrintPagesCB.Left:= PrintL.Left+PrintL.Width+11;
end;

procedure TfrxPrintDialog.FormHide(Sender:TObject);
begin
  if ModalResult<>mrOk then
    frxPrinters.PrinterIndex:= OldIndex
  else
  begin
    frxPrinters.Printer.FileName:= '';
    if FileCB.Checked then
      if FileDlg.Execute then
        frxPrinters.Printer.FileName:= ChangeFileExt(FileDlg.FileName, '.prn') else
        ModalResult:= mrCancel;
  end;
end;

procedure TfrxPrintDialog.PrintersCBDrawItem(Control:TWinControl; Index:Integer;
  ARect:TRect; State:TOwnerDrawState);
begin
  with PrintersCB.Canvas do
  begin
    FillRect(ARect);
    frxDrawTransparent(PrintersCB.Canvas, ARect.Left+2, ARect.Top,
      PrinterImg.Picture.Bitmap);
    TextOut(ARect.Left+24, ARect.Top+1, PrintersCB.Items[Index]);
  end;
end;

procedure TfrxPrintDialog.PropButtonClick(Sender:TObject);
begin
  frxPrinters.Printer.PropertiesDlg;
end;

procedure TfrxPrintDialog.PrintersCBClick(Sender:TObject);
begin
  frxPrinters.PrinterIndex:= PrintersCB.ItemIndex;
  TypeL1.Caption:= frxPrinters.Printer.Name;
  WhereL1.Caption:= frxPrinters.Printer.Port;
end;

procedure TfrxPrintDialog.PageNumbersEEnter(Sender:TObject);
begin
  PageNumbersRB.Checked:= True;
end;

procedure TfrxPrintDialog.PageNumbersRBClick(Sender:TObject);
begin
  PageNumbersE.SetFocus;
end;

procedure TfrxPrintDialog.CollateLClick(Sender:TObject);
begin
  CollateCB.Checked:= not CollateCB.Checked;
end;

procedure TfrxPrintDialog.CollateCBClick(Sender:TObject);
begin
  CopiesPBPaint(nil);
end;

procedure TfrxPrintDialog.CopiesPBPaint(Sender:TObject);
begin
  with CopiesPB.Canvas do
  begin
    Brush.Color:= Color;
    FillRect(Rect(0, 0, CopiesPB.Width, CopiesPB.Height));
    if CollateCB.Checked then
      frxDrawTransparent(CopiesPB.Canvas, 0, 0, CollateImg.Picture.Bitmap) else
      frxDrawTransparent(CopiesPB.Canvas, 0, 0, NonCollateImg.Picture.Bitmap);
  end;
end;

end.
