unit PrintPL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls,B_Utils,DataPrint,B_DButils, Qrctrls;

type
  TPRINT_PL = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape12: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape13: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape14: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape22: TQRShape;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText17: TQRDBText;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel27: TQRLabel;
    QRShape27: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText18: TQRDBText;
    PL_DATE1: TQRLabel;
    PL_DATE2: TQRLabel;
    QRDBText19: TQRDBText;
    PL_SUMM1: TQRLabel;
    PL_SUMM2: TQRLabel;
    procedure QRLabel26Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PRINT_PL: TPRINT_PL;

implementation

{$R *.DFM}

procedure TPRINT_PL.QRLabel26Print(sender: TObject; var Value: String);
var
   s,s2:ansistring;
   a:integer;
   sw1,sw:ansistring;
begin
     s:=datetostr(DataModule2.PrintPl.fieldByname('PL_DATE').asdatetime);
     s2:='';
     for a:=1 to length(s) do
     if (s[a]>#47) and (s[a]<#58) then s2:=s2+s[a] else s2:=s2+'.';
     PL_DATE1.caption:=s2;
     PL_DATE2.caption:=s2;
     sw:=VALUTA_CHAR(datamodule2.PrintPL.fieldbyname('PL_SUMM').asfloat,
     datamodule2.PrintPL.fieldbyname('AUTO1').asstring,
     datamodule2.PrintPL.fieldbyname('AUTO2').asstring,
     datamodule2.PrintPL.fieldbyname('AUTO3').asstring,
     datamodule2.PrintPL.fieldbyname('AUTO11').asstring,
     datamodule2.PrintPL.fieldbyname('AUTO12').asstring,
     datamodule2.PrintPL.fieldbyname('AUTO13').asstring);
     sw1:=sw[1];
     sw1:=Ansiuppercase(sw1);
     sw[1]:=sw1[1];
     PL_SUMM1.caption:=sw;
     if datamodule2.PrintPL.fieldbyname('PL_SUMM').asfloat-trunc(datamodule2.PrintPL.fieldbyname('PL_SUMM').asfloat)=0 then begin
        {Ñóììà ğîâíî â ğóáëÿõ}
        PL_SUMM2.caption:=inttostr(trunc(datamodule2.PrintPL.fieldbyname('PL_SUMM').asfloat))+'-00';
     end else begin
        {Ñóììà ñ êîïåéêàìè}
        sw:=trim(floattostrf(datamodule2.PrintPL.fieldbyname('PL_SUMM').asfloat,fffixed,19,2));
        sw[length(sw)-2]:='-';
        PL_SUMM2.caption:=sw;
     end;
end;

end.