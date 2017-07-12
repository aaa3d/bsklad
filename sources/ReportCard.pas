unit ReportCard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit,DataPrint,B_DButils,VclUtils, ExtCtrls,B_utils,
  ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass, ppBands, ppDB, ppProd,
  ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, ppVar;

type
  TReport_card = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    SORT: TComboBox;
    BtnRUN: TButton;
    BtnClose: TButton;
    Image3: TImage;
    PipCard: TppDBPipeline;
    PpCard: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBText2: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
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
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine1: TppLine;
    ppLabel14: TppLabel;
    ppShape2: TppShape;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppImage1: TppImage;
    ppDBText185: TppDBText;
    ppLabel119: TppLabel;
    ppSystemVariable52: TppSystemVariable;
    ppSystemVariable53: TppSystemVariable;
    ppLabel620: TppLabel;
    ppSystemVariable54: TppSystemVariable;
    ppLabel621: TppLabel;
    ppLabel622: TppLabel;
    PpCardUser: TppLabel;
    ppImage2: TppImage;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    PpCardVers: TppLabel;
    ppLabel30: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel31: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    PpCardUser2: TppLabel;
    PpCard_Title1: TppMemo;
    PpCard_Title2: TppMemo;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnRUNClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure PpCardPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Report_card: TReport_card;

implementation


{$R *.DFM}

procedure TReport_card.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TReport_card.BtnRUNClick(Sender: TObject);
var
   tm1,tm2:Tdatetime;
   s:ansistring;
begin
     BtnRun.enabled:=False;
     BtnClose.enabled:=False;
     Tm1:=time();
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.ReportCard.close;
     Datamodule2.ReportCard.SQL.clear;
     s:='FIRST_SUMM';
     case SORT.itemindex of
       0: s:='FIRST_SUMM DESC';
       1: s:='PERIOD_SUMM DESC';
       2: s:='PERIOD_COUNT DESC';
       3: s:='PERIOD_SKID DESC';
       4: s:='CURRENT_SUMM DESC';
       5: s:='CURRENT_SKID DESC';
       6: s:='CARD_NUM';
       7: s:='CARD_DATE DESC';
     end;
     Datamodule2.ReportCard.SQL.add('select * from report_card(:DT1,:DT2) order by '+S);
     Datamodule2.ReportCard.ParamByname('DT1').asdatetime:=DT1.date;
     Datamodule2.ReportCard.ParamByname('DT2').asdatetime:=DT2.date+1-Sekond1;
     Datamodule2.ReportCard.open;
     Tm2:=time();
     if Datamodule2.ReportCard.eof then Messbox('Отчет пуст!',MessSystem,48) else begin
       PPCard_Title1.lines.clear;
       PPCard_Title1.lines.add('Отчет об использовании пластиковых карт за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date)+', Время построения: '+timetostr(tm2-tm1)+', отчет упорядочен по '+SORT.text);
       PPCard_Title2.lines.clear;
       PPCard_Title2.lines.add('Отчет об использовании пластиковых карт за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date)+', Время построения: '+timetostr(tm2-tm1)+', отчет упорядочен по '+SORT.text);
       PpCard.reset;
       PpCard.Print;
     end;
     BtnRun.enabled:=True;
     BtnClose.enabled:=True;
end;

procedure TReport_card.FormShow(Sender: TObject);
begin
     DT1.date:=date();
     DT2.date:=date();
     SORT.itemindex:=1;
     DT1.setfocus;
end;

procedure TReport_card.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
     if key=#10 then begin
        key:=#0;
        DT1.SetFocus;
        DT2.SetFocus;
        BtnRun.click;
     end;
end;

procedure TReport_card.FormDestroy(Sender: TObject);
begin
     Datamodule2.ReportCard.close;
     Datamodule2.PrintTransaction.Active:=False;

end;

procedure TReport_card.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpCardUser.Caption:=USERFIO_SHORT;
     PpCardUser2.Caption:=USERFIO_SHORT;
     PpCardVers.caption:=PROG_VERSION;
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TReport_card.PpCardPreviewFormCreate(Sender: TObject);
begin
     PpCard.PreviewForm.WindowState:=WsMaximized;
end;

end.