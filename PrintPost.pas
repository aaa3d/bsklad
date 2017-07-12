unit PrintPost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls,B_DButils,DataPrint,B_utils, Qrctrls, QuickRpt, ExtCtrls;

type
  TPrint_POST = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel344: TQRLabel;
    QRLabel7: TQRLabel;
    QRSysData1: TQRSysData;
    TITLE2: TQRLabel;
    TITLE1: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    USER_FIO: TQRLabel;
    QRImage1: TQRImage;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QuickRep2: TQuickRep;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRSysData2: TQRSysData;
    TITLE4: TQRLabel;
    QRBand2: TQRBand;
    TITLE3: TQRLabel;
    QRImage2: TQRImage;
    QRBand3: TQRBand;
    QRLabel11: TQRLabel;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    USER_FIO2: TQRLabel;
    QRBand6: TQRBand;
    QRLabel16: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel19: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QuickRep3: TQuickRep;
    PageHeaderBand2: TQRBand;
    TitleBand2: TQRBand;
    ColumnHeaderBand2: TQRBand;
    DetailBand2: TQRBand;
    SummaryBand2: TQRBand;
    PageFooterBand2: TQRBand;
    TITLE2_2: TQRLabel;
    TITLE2_1: TQRLabel;
    QRLabel22: TQRLabel;
    QRSysData3: TQRSysData;
    QRImage3: TQRImage;
    QRGroup1: TQRGroup;
    QRBand7: TQRBand;
    QRDBText13: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    USER2: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel25: TQRLabel;
    QRExpr8: TQRExpr;
    TabSheet4: TTabSheet;
    QuickRep4: TQuickRep;
    QRBand8: TQRBand;
    TITLE3_2: TQRLabel;
    QRLabel27: TQRLabel;
    QRSysData4: TQRSysData;
    QRBand9: TQRBand;
    TITLE3_1: TQRLabel;
    QRImage4: TQRImage;
    QRBand10: TQRBand;
    QRBand11: TQRBand;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRBand12: TQRBand;
    QRLabel30: TQRLabel;
    USER3: TQRLabel;
    QRLabel32: TQRLabel;
    QRExpr10: TQRExpr;
    QRBand13: TQRBand;
    QRGroup2: TQRGroup;
    QRDBText36: TQRDBText;
    QRBand14: TQRBand;
    QRLabel33: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    ITOG2: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr9: TQRExpr;
    ITOG3: TQRLabel;
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TitleBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr8Print(sender: TObject; var Value: String);
    procedure QRExpr10Print(sender: TObject; var Value: String);
    procedure QRBand9BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel33Print(sender: TObject; var Value: String);
    procedure QRLabel23Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Print_POST: TPrint_POST;

implementation

{$R *.DFM}

procedure TPrint_POST.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Try
       QrImage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     end;
end;

procedure TPrint_POST.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Try
       QrImage2.Picture.LoadFromFile(LOGO_NAME);
     Except
     end;
end;

procedure TPrint_POST.TitleBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Try
       QrImage3.Picture.LoadFromFile(LOGO_NAME);
     Except
     end;
end;

procedure TPrint_POST.QRExpr8Print(sender: TObject; var Value: String);
begin
     ITOG2.caption:=RUB_CHAR(strtofloat(value));
end;

procedure TPrint_POST.QRExpr10Print(sender: TObject; var Value: String);
begin
     ITOG3.caption:=RUB_CHAR(strtofloat(value));
end;

procedure TPrint_POST.QRBand9BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Try
       QrImage4.Picture.LoadFromFile(LOGO_NAME);
     Except
     end;
end;

procedure TPrint_POST.QRLabel33Print(sender: TObject; var Value: String);
begin
     QrExpr9.Reset;
end;

procedure TPrint_POST.QRLabel23Print(sender: TObject; var Value: String);
begin
     QrExpr5.Reset;
end;

end.
