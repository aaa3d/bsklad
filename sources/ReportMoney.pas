unit ReportMoney;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, CurrEdit, StdCtrls, Buttons, Animate, GIFCtrl,
  Data1,b_utils,b_Dbutils, Db, IBCustomDataSet, IBQuery, IBDatabase, ppDB,
  ppDBPipe, ppBands, ppClass, ppCtrls, ppMemo, ppStrtch, ppVar, ppPrnabl,
  ppCache, ppComm, ppRelatv, ppProd, ppReport,VclUtils;

type
  TREPORT_MONEY = class(TForm)
    RxGIFAnimator1: TRxGIFAnimator;
    Label1: TLabel;
    TW: TEdit;
    BtnDic: TSpeedButton;
    Label2: TLabel;
    USL: TComboBox;
    VALUE: TRxCalcEdit;
    Button1: TButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    BRAK1: TCheckBox;
    BRAK2: TCheckBox;
    PpMoney: TppReport;
    ppTitleBand3: TppTitleBand;
    ppShape5: TppShape;
    ppImage5: TppImage;
    ppLabel28: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppLabel29: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppLabel30: TppLabel;
    ppLabel35: TppLabel;
    PpOstNew1ShortWideUser: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel49: TppLabel;
    MONEYTITLE1: TppMemo;
    ppLabel92: TppLabel;
    ppHeaderBand3: TppHeaderBand;
    ppShape6: TppShape;
    PpOstNew1ShortWideUser2: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppLabel55: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppLabel56: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    MONEYTITLE2: TppMemo;
    ppLabel60: TppLabel;
    ppLabel89: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBMemo5: TppDBMemo;
    ppLine5: TppLine;
    ppDBCalc6: TppDBCalc;
    ppDBText9: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppImage6: TppImage;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    PpOstNew1ShortWideVers: TppLabel;
    ppLabel64: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppLabel65: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBMemo6: TppDBMemo;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine6: TppLine;
    ReportTransaction: TIBTransaction;
    Report_New1: TIBQuery;
    Report_New1TWTREE_ID: TIntegerField;
    Report_New1TWTREE_FULL: TIBStringField;
    Report_New1TW_ID: TIntegerField;
    Report_New1TW_ART: TIntegerField;
    Report_New1TW_NAM: TIBStringField;
    Report_New1ED_SHORT: TIBStringField;
    Report_New1TW_MROZ: TFloatField;
    Report_New1TW_OST: TFloatField;
    Report_New1TW_SUMM: TFloatField;
    Report_New1TW_BRAK: TIBStringField;
    DsNew1: TDataSource;
    PipNew: TppDBPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    Label3: TLabel;
    procedure BtnDicClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BRAK1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ppTitleBand3BeforeGenerate(Sender: TObject);
    procedure PpMoneyPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_MONEY: TREPORT_MONEY;

implementation

uses DicTowar, WaitForm;

{$R *.DFM}

procedure TREPORT_MONEY.BtnDicClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     DIC_TOWAR.tag:=TW.tag;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       TW.tag:=DIC_TOWAR.tag;
       WorkTransaction.Active:=False;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=TW.tag;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
       WorkTransaction.Active:=False;
     end;
end;

procedure TREPORT_MONEY.FormShow(Sender: TObject);
begin
  TW.tag:=0;
  TW.text:='Все товары';
  USL.itemindex:=0;
  VALUE.value:=0;
end;

procedure TREPORT_MONEY.BRAK1Click(Sender: TObject);
begin
   if not Brak1.checked and not Brak2.checked then BRAK1.checked:=true;
end;

procedure TREPORT_MONEY.Button1Click(Sender: TObject);
var
  s_BRAK,s:ansistring;
  c:integer;
begin
     if Brak1.checked and Brak2.checked then S_BRAK:=' ';
     if Brak1.checked and not Brak2.checked then S_BRAK:=' and TW_BRAK="0" ';
     if not Brak1.checked and Brak2.checked then S_BRAK:=' and not TW_BRAK="0" ';
     Wait_Form.StatusBar1.panels[0].text:='Построение отчета...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Button1.enabled:=False;

    ReportTransaction.Active:=False;
    Report_NEW1.Close;
    Report_NEW1.sql.CLEAR;
    Report_NEW1.sql.add('select * from report_money(:par_id,:usl,:usl_value) '+S_BRAK+
    ' order by twtree_full,tw_nam ');
    Report_NEW1.Parambyname('USL').asinteger:=USL.itemindex+1;
    Report_NEW1.Parambyname('USL_VALUE').asfloat:=VALUE.value;
    Report_NEW1.Parambyname('PAR_ID').asinteger:=TW.tag;
    s:='Отчет о ценах на товары группы : '+TW.text;
    case USL.itemindex of
      0: s:=s+', цена товара больше ';
      1: s:=s+', цена товара меньше ';
      2: s:=s+', цена товара равен ';
    end;
    s:=s+floattostrf(value.value,fffixed,19,2)+' руб.';
    if brak1.checked and not Brak2.checked then s:=s+', только товар хорошего качества';
    if not brak1.checked and Brak2.checked then s:=s+', только бракованный товар';

    Report_NEW1.Parambyname('USL').asinteger:=USL.itemindex+1;
    Report_NEW1.Parambyname('USL_VALUE').asfloat:=VALUE.value;
    Report_NEW1.Open;
    Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
    Wait_Form.Gauge1.Progress:=90;
    delay(100);
    if Report_NEW1.eof then begin
       Wait_Form.Gauge1.Progress:=100;
       delay(100);
       Wait_Form.Hide;
       Messbox('Отчет пуст!',MessSystem,48)
    end else begin
       // Полный
       MoneyTitle1.lines.clear;
       MoneyTitle1.lines.add(s);
       MoneyTitle2.lines.clear;
       MoneyTitle2.lines.add(s);
       Wait_Form.Gauge1.Progress:=100;
       delay(100);
       PpMoney.reset;
       Wait_Form.Hide;
       PpMoney.Print;
    end;
    Button1.enabled:=True;
end;

procedure TREPORT_MONEY.ppTitleBand3BeforeGenerate(Sender: TObject);
begin
     PpOstNew1ShortWideUser.caption:=USERFIO_SHORT;
     PpOstNew1ShortWideUser2.caption:=USERFIO_SHORT;
     PpOstNew1ShortWideVers.caption:=PROG_VERSION;
     try
       Ppimage5.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TREPORT_MONEY.PpMoneyPreviewFormCreate(Sender: TObject);
begin
     PpMoney.PreviewForm.WindowState:=WsMaximized;
end;

end.