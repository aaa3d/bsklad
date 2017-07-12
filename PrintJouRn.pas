unit PrintJouRn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls,JouRN,B_utils,B_DButils;

type
  TPrint_JOURN = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    JOU_TITLE1: TQRLabel;
    Jou_TITLE2: TQRLabel;
    QRBand1: TQRBand;
    ImDost: TQRImage;
    ImProw: TQRImage;
    ImCard: TQRImage;
    ImKKM: TQRImage;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    USER_FIO: TQRLabel;
    QRLabel344: TQRLabel;
    QRImage4: TQRImage;
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Print_JOURN: TPrint_JOURN;

implementation

{$R *.DFM}

procedure TPrint_JOURN.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Try
       QrImage4.Picture.LoadFromFile(LOGO_NAME);
     Except
     end;
end;

procedure TPrint_JOURN.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        if Jou_RN.QrRnList.fieldByname('RN_PROW').asinteger=1
        then ImPROW.enabled:=true else ImPROW.enabled:=False;
        if Jou_RN.QrRnList.fieldByname('RN_DOST').asinteger=1
        then ImDOST.enabled:=true else ImDOST.enabled:=False;
        if Jou_RN.QrRnList.fieldByname('RN_KKM').asinteger=1
        then ImKKM.enabled:=true else ImKKM.enabled:=False;
        if Jou_RN.QrRnList.fieldByname('RN_CARD').asinteger=1
        then ImCARD.enabled:=true else ImCARD.enabled:=False;
end;

end.
