unit ReportMarketOld;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXSpin, StdCtrls, Buttons, ExtCtrls,B_utils,B_DButils,Data1, IBDatabase,
  Db, IBCustomDataSet, IBQuery,VclUtils, ppComm, ppRelatv, ppCache, ppDB,
  ppDBPipe, ppBands, ppClass, ppCtrls, ppMemo, ppStrtch, ppVar, ppPrnabl,
  ppProd, ppReport;

type
  TREPORT_MARKETOLD = class(TForm)
    Label1: TLabel;
    TW1: TRadioButton;
    TW2: TRadioButton;
    TWTREE_NAM: TEdit;
    Image3: TImage;
    BtnRun: TButton;
    BtnClose: TButton;
    BtnGroup: TSpeedButton;
    ARC: TCheckBox;
    Label2: TLabel;
    DAY: TRxSpinEdit;
    Label3: TLabel;
    IBQuery2: TIBQuery;
    WorkTransaction: TIBTransaction;
    PipOld: TppDBPipeline;
    PpOld: TppReport;
    ppTitleBand1: TppTitleBand;
    ppImage1: TppImage;
    ppLabel119: TppLabel;
    ppSystemVariable52: TppSystemVariable;
    ppSystemVariable53: TppSystemVariable;
    ppLabel620: TppLabel;
    ppSystemVariable54: TppSystemVariable;
    ppLabel621: TppLabel;
    ppLabel622: TppLabel;
    PpKonkUser: TppLabel;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    PpKonk_Title1: TppMemo;
    ppHeaderBand1: TppHeaderBand;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel15: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    PpKonkUser2: TppLabel;
    ppShape2: TppShape;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    PpKonk_Title2: TppMemo;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBText8: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppLine2: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppImage2: TppImage;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    PpKonkVers: TppLabel;
    ppLine1: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBMemo5: TppDBMemo;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel5: TppLabel;
    procedure FormShow(Sender: TObject);
    procedure TW1Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnGroupClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnRunClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure PpOldPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_MARKETOLD: TREPORT_MARKETOLD;
  TWTREE_ID:integer;

implementation

uses DicTowar, DataPrint;

{$R *.DFM}

procedure TREPORT_MARKETOLD.FormShow(Sender: TObject);
begin
     TW1.checked:=TRUE;
     TWTREE_NAM.text:='Все товары!';
     TWTREE_ID:=0;
end;

procedure TREPORT_MARKETOLD.TW1Click(Sender: TObject);
begin
     BtnGROUP.enabled:=TW2.checked;
end;

procedure TREPORT_MARKETOLD.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TREPORT_MARKETOLD.BtnGroupClick(Sender: TObject);
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

procedure TREPORT_MARKETOLD.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TREPORT_MARKETOLD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     IbQuery2.close;
     WorkTransaction.Active:=False;
     Datamodule2.MarketOld.close;
     Datamodule2.PrintTransaction.Active:=False;
end;

procedure TREPORT_MARKETOLD.BtnRunClick(Sender: TObject);
var
  s:ansistring;
begin
     BtnRun.enabled:=False;
     BtnClose.enabled:=False;
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.MarketOld.close;
     Datamodule2.MarketOld.SQL.clear;
     if ARC.checked then Datamodule2.MarketOld.SQL.add('select * from report_market_old(:twtree_id,:d) where last_date is not null order by twtree_full,tw_nam')
                    else Datamodule2.MarketOld.SQL.add('select * from report_market_old(:twtree_id,:d) order by twtree_full,tw_nam');
     Datamodule2.MarketOld.ParamByname('D').asinteger:=trunc(DAY.value);
     if TW1.checked then Datamodule2.MarketOld.ParamByname('TWTREE_ID').asinteger:=0
                    else Datamodule2.MarketOld.ParamByname('TWTREE_ID').asinteger:=TWTREE_ID;
     Datamodule2.MarketOld.Open;
     if Datamodule2.MarketOld.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
        s:='Отчет о товарах, имеющих устаревшие маркетинговые данные о ценах у конкурентов по состоянию на '+date_sokr(date())+' '+timetostr(time());
        if ARC.Checked then
        s:=s+', Только товары, у которых были маркетинговые данные о ценах у конкурентов, товары, у которых срок маркетинговых данных закончится через '+inttostr(trunc(DAY.value))+' дней'
        else s:=s+', Товары, у которых срок маркетинговых данных закончится через '+inttostr(trunc(DAY.value))+' дней';
        s:=s+', Группа товаров: '+TWTREE_NAM.text;
        PpKonk_Title1.lines.clear;
        PpKonk_Title1.lines.add(s);
        PpKonk_Title2.lines.clear;
        PpKonk_Title2.lines.add(s);
        PpOld.reset;
        PpOld.print;
     end;
     BtnRun.enabled:=True;
     BtnClose.enabled:=True;
end;

procedure TREPORT_MARKETOLD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=122 then begin
        key:=0;
        TW2.checked:=true;
        BtnGroup.enabled:=True;
        BtnGroup.click;
     end;
end;

procedure TREPORT_MARKETOLD.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpKonkUser.Caption:=USERFIO_SHORT;
     PpKonkUser2.Caption:=USERFIO_SHORT;
     PpKonkVers.caption:=PROG_VERSION;
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TREPORT_MARKETOLD.PpOldPreviewFormCreate(Sender: TObject);
begin
     PpOld.PreviewForm.WindowState:=WsMaximized;
end;

end.