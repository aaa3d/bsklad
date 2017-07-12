unit AllPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, ComCtrls, Db, IBCustomDataSet, IBQuery, IBDatabase,DataPrint,
  Qrctrls, StdCtrls,B_utils, QRPrntr,Data1;

type
  TAll_Print = class(TForm)
    PageControl1: TPageControl;
    TabSheet5: TTabSheet;
    QuickRep5: TQuickRep;
    PageHeaderBand2: TQRBand;
    TitleBand2: TQRBand;
    ColumnHeaderBand2: TQRBand;
    DetailBand2: TQRBand;
    SummaryBand2: TQRBand;
    PageFooterBand2: TQRBand;
    QRLabel132: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand18: TQRBand;
    QRLabel135: TQRLabel;
    QRDBText75: TQRDBText;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRExpr17: TQRExpr;
    QRLabel144: TQRLabel;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRLabel145: TQRLabel;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    OST_FIO: TQRLabel;
    QRSysData6: TQRSysData;
    OST_TITLE: TQRLabel;
    OST_TITLE2: TQRLabel;
    TabSheet6: TTabSheet;
    QuickRep6: TQuickRep;
    QRBand19: TQRBand;
    QRLabel148: TQRLabel;
    QRSysData7: TQRSysData;
    QRLabel149: TQRLabel;
    QRSysData8: TQRSysData;
    OST2_TITLE2: TQRLabel;
    QRBand20: TQRBand;
    QRLabel151: TQRLabel;
    OST2_TITLE: TQRLabel;
    QRBand21: TQRBand;
    QRLabel153: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    QRBand22: TQRBand;
    QRDBText85: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    QRDBText89: TQRDBText;
    QRExpr22: TQRExpr;
    QRBand23: TQRBand;
    QRLabel162: TQRLabel;
    OST2_FIO: TQRLabel;
    QRBand24: TQRBand;
    QRLabel164: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel165: TQRLabel;
    QRDBText90: TQRDBText;
    QRBand25: TQRBand;
    QRLabel150: TQRLabel;
    procedure QRLabel145Print(sender: TObject; var Value: String);
    procedure QRLabel162Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  All_Print: TAll_Print;

implementation

uses B_DButils;

{$R *.DFM}

procedure TAll_Print.QRLabel145Print(sender: TObject; var Value: String);
begin
     OST_FIO.caption:=USERFIO_SHORT;
end;

procedure TAll_Print.QRLabel162Print(sender: TObject; var Value: String);
begin
     OST2_FIO.caption:=USERFIO_SHORT;
end;

end.
