unit ReportMarketKonk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit, Buttons,Data1,B_Utils,B_DButils, Db,
  IBCustomDataSet, IBQuery, IBDatabase,VclUtils, ExtCtrls,DataPrint,
  ppMemo, ppCtrls, ppVar, ppBands, ppClass, ppStrtch, ppPrnabl, ppDB,
  ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, RxLookup;

type
  TREPORT_MARKETKONK = class(TForm)
    Label1: TLabel;
    TW1: TRadioButton;
    TW2: TRadioButton;
    TWTREE_NAM: TEdit;
    BtnGroup: TSpeedButton;
    Label2: TLabel;
    PERCENT: TRxCalcEdit;
    BtnRun: TButton;
    BtnClose: TButton;
    WorkTransaction: TIBTransaction;
    Image3: TImage;
    IBQuery2: TIBQuery;
    PipMarketKonk: TppDBPipeline;
    PpKonk: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppDBText2: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBText8: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBMemo5: TppDBMemo;
    ppImage1: TppImage;
    ppLabel119: TppLabel;
    ppSystemVariable52: TppSystemVariable;
    ppSystemVariable53: TppSystemVariable;
    ppLabel620: TppLabel;
    ppSystemVariable54: TppSystemVariable;
    ppLabel621: TppLabel;
    ppLabel622: TppLabel;
    PpKonkUser: TppLabel;
    ppImage2: TppImage;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    PpKonkVers: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel15: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    PpKonkUser2: TppLabel;
    ppShape2: TppShape;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    PpKonk_Title1: TppMemo;
    PpKonk_Title2: TppMemo;
    Label3: TLabel;
    RnTypTransaction: TIBTransaction;
    QrRntyp: TIBQuery;
    QrRntypRNTYP_FULL: TIBStringField;
    QrRntypRNTYP_ID: TIntegerField;
    DsRntyp: TDataSource;
    RNTYP: TRxDBLookupCombo;
    QrRntypPERCENT: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure TW2Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnGroupClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnRunClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure PpKonkPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_MARKETKONK: TREPORT_MARKETKONK;
  TWTREE_ID:integer;

implementation

uses DicTowar;

{$R *.DFM}

procedure TREPORT_MARKETKONK.FormShow(Sender: TObject);
begin
     TW1.checked:=TRUE;
     TWTREE_NAM.text:='Все товары!';
     TWTREE_ID:=0;
     RnTyptransaction.Active:=False;
     QrRntyp.close;
     QrRntyp.Open;
     RNTYP.value:=QrRntyp.fieldbyname('RNTYP_ID').asstring;
end;

procedure TREPORT_MARKETKONK.TW2Click(Sender: TObject);
begin
     BtnGROUP.enabled:=TW2.checked;
end;

procedure TREPORT_MARKETKONK.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TREPORT_MARKETKONK.BtnGroupClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     DIC_TOWAR.tag:=TWTREE_ID;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       TWTREE_ID:=DIC_TOWAR.tag;
       WorkTransaction.Active:=False;
       IbQuery2.close;
       IbQuery2.SQL.clear;
       IbQuery2.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       IbQuery2.ParamByname('TWTREE_ID').asinteger:=TWTREE_ID;
       IbQuery2.Open;
       TwTREE_NAM.text:='';
       if not IbQuery2.eof then TwTREE_NAM.text:=IbQuery2.fieldByname('TWTREE_FULL').asstring;
       WorkTransaction.Active:=False;
     end;
     TW2.checked:=True;
end;

procedure TREPORT_MARKETKONK.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
     if key=#10 then begin
        key:=#0;
        try
          BtnClose.setfocus;
          BtnRun.setfocus;
        except
        end;
        BtnRun.click;
     end;
end;

procedure TREPORT_MARKETKONK.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     IbQuery2.close;
     WorkTransaction.Active:=False;
     Datamodule2.MarketKonk.close;
     Datamodule2.PrintTransaction.Active:=False;
end;

procedure TREPORT_MARKETKONK.BtnRunClick(Sender: TObject);
var
  s:ansistring;
begin
     BtnRun.enabled:=False;
     BtnClose.enabled:=False;
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.MarketKonk.close;
     Datamodule2.MarketKonk.SQL.clear;
     Datamodule2.MarketKonk.SQL.add('select * from report_market_konk(:twtree_id,:percent,:skid) order by twtree_full,tw_nam');
     Datamodule2.MarketKonk.ParamByname('PERCENT').asfloat:=Percent.value;
     Datamodule2.MarketKonk.ParamByname('SKID').asfloat:=QrRntyp.fieldbyname('PERCENT').asfloat;
     if TW1.checked then Datamodule2.MarketKonk.ParamByname('TWTREE_ID').asinteger:=0
                    else Datamodule2.MarketKonk.ParamByname('TWTREE_ID').asinteger:=TWTREE_ID;
        Datamodule2.MarketKonk.Open;
     if Datamodule2.MarketKonk.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
        s:='Отчет о товарах, имеющих ценовых конкурентов по состоянию на '+date_sokr(date())+' '+timetostr(time())+
        ', Группа товаров: '+TWTREE_NAM.text+', Цены конкурентов ниже наших более, чем на '+floattostrf(PERCENT.value,fffixed,19,4)+'%'+
        '. Наши цены с учетом скидки по: '+RNTYP.text+', что составляет '+floattostrf(QrRntyp.fieldbyname('PERCENT').asfloat,fffixed,19,4)+'%';
        PpKonk_Title1.lines.clear;
        PpKonk_Title1.lines.add(s);
        PpKonk_Title2.lines.clear;
        PpKonk_Title2.lines.add(s);
        PpKonk.reset;
        PpKonk.print;
     end;
     BtnRun.enabled:=True;
     BtnClose.enabled:=True;
end;

procedure TREPORT_MARKETKONK.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=122 then begin
        key:=0;
        TW2.checked:=true;
        BtnGroup.enabled:=True;
        BtnGroup.click;
     end;
end;

procedure TREPORT_MARKETKONK.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpKonkUser.Caption:=USERFIO_SHORT;
     PpKonkUser2.Caption:=USERFIO_SHORT;
     PpKonkVers.caption:=PROG_VERSION;
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TREPORT_MARKETKONK.PpKonkPreviewFormCreate(Sender: TObject);
begin
     PpKonk.PreviewForm.WindowState:=WsMaximized;
end;

end.