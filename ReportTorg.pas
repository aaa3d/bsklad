unit ReportTorg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,Data1,B_DButils,B_Utils, Db,
  IBCustomDataSet, IBQuery, Mask, ToolEdit, RxLookup,VclUtils, IBDatabase,
  ppCtrls, ppMemo, ppVar, ppStrtch, ppPrnabl, ppClass, ppBands, ppModule,
  daDatMod, ppDB, ppCache, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport;

type
  TReport_torg = class(TForm)
    Panel2: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    TW1: TRadioButton;
    TW2: TRadioButton;
    Edit1: TEdit;
    BtnDicTowar: TButton;
    TW3: TRadioButton;
    Edit2: TEdit;
    BtnTwFilter: TButton;
    Panel5: TPanel;
    RN1: TRadioButton;
    RN2: TRadioButton;
    RN3: TRadioButton;
    Edit4: TEdit;
    BtnRnFilter: TButton;
    RNTYP: TRxDBLookupCombo;
    Label3: TLabel;
    DT1: TDateEdit;
    Label4: TLabel;
    DT2: TDateEdit;
    BtnRun: TButton;
    BtnClose: TButton;
    Label1: TLabel;
    Label6: TLabel;
    QrRnTyp: TIBQuery;
    QrRnTypRNTYP_ID: TIntegerField;
    QrRnTypRNTYP_FULL: TIBStringField;
    DsRnTyp: TDataSource;
    CheckBox1: TCheckBox;
    WorkTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    Label2: TLabel;
    Panel4: TPanel;
    SHOP1: TRadioButton;
    SHOP2: TRadioButton;
    QrSHOP: TIBQuery;
    TorgTransaction: TIBTransaction;
    DsShop: TDataSource;
    SHOP: TRxDBLookupCombo;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    TORG1_TITLE1: TppMemo;
    TORG1_TITLE2: TppMemo;
    ppSystemVariable1: TppSystemVariable;
    ppLabel3: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel4: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppShape1: TppShape;
    ppDBCalc1: TppDBCalc;
    ppLabel15: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLine1: TppLine;
    ppLabel16: TppLabel;
    ppImage1: TppImage;
    ppLabel17: TppLabel;
    USER_FIO: TppLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnRnFilterClick(Sender: TObject);
    procedure BtnTwFilterClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure TW1Click(Sender: TObject);
    procedure RN3Click(Sender: TObject);
    procedure BtnRunClick(Sender: TObject);
    procedure BtnDicTowarClick(Sender: TObject);
    procedure SHOP1Click(Sender: TObject);
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Report_torg: TReport_torg;
  TWTREE_ID:integer=0;

implementation

uses FilterRn, FilterTW, AllPrint, DicTowar, WaitForm;

{$R *.DFM}

procedure TReport_torg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     QrRntyp.close;
     QrShop.close;
     TorgTransaction.Active:=False;
end;

procedure TReport_torg.FormShow(Sender: TObject);
begin
     Application.createForm(TFilter_TW,Filter_TW);
     Application.createForm(TFilter_RN,Filter_RN);
     TorgTransaction.Active:=False;
     QrRnTyp.close;
     QrRnTyp.Open;
     QrShop.close;
     QrShop.Open;
     RnTyp.value:=QrRnTyp.fieldbyname('RnTyp_ID').asstring;
     SHOP2.checked:=True;
     SHOP.enabled:=True;
     SHOP.value:=inttostr(Default_shop);
     Dt1.date:=date();
     Dt2.date:=date();
end;

procedure TReport_torg.BtnRnFilterClick(Sender: TObject);
begin
     Filter_RN.DT1.date:=DT1.date;
     Filter_RN.DT2.date:=DT2.date;
     if SHOP2.checked then begin
       Filter_RN.SET_SHOP.checked:=true;
       Filter_RN.SHOP.value:=SHOP.value;
     end else Filter_RN.SET_SHOP.checked:=false;
     Filter_RN.showModal;
     if Filter_RN.SET_SHOP.checked then begin
         SHOP2.checked:=true;
         SHOP.value:=Filter_RN.SHOP.value;
         SHOP.enabled:=true;
     end else begin
         SHOP1.checked:=true;
         SHOP.enabled:=False;
     end;
     DT1.date:=Filter_RN.DT1.date;
     DT2.date:=Filter_RN.DT2.date;
end;

procedure TReport_torg.BtnTwFilterClick(Sender: TObject);
begin

     Filter_TW.showModal;
end;

procedure TReport_torg.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TReport_torg.TW1Click(Sender: TObject);
begin
     BtnDicTowar.Enabled:=TW2.Checked;
     BtnTwFilter.Enabled:=TW3.Checked;
end;

procedure TReport_torg.RN3Click(Sender: TObject);
begin
     BtnRnFilter.Enabled:=RN3.Checked;
     RnTyp.enabled:=RN2.Checked;
end;

procedure TReport_torg.BtnRunClick(Sender: TObject);
var
   s3,s,s2:ansistring;
begin
     BtnRun.enabled:=false;
     BtnClose.enabled:=false;
     Wait_Form.StatusBar1.panels[0].text:='Отбор товаров для отчета...';
     Wait_Form.Gauge1.Progress:=2;
     Wait_Form.Show;
     delay(1);
     {Строим отчет}
     {Шаг 1 - отрабатываем фильтр товаров}
     Filter_RN.DT1.date:=DT1.date;
     Filter_RN.DT2.date:=DT2.date;
     if SHOP2.checked then begin
       Filter_RN.SET_SHOP.checked:=true;
       Filter_RN.SHOP.value:=SHOP.value;
     end else Filter_RN.SET_SHOP.checked:=false;
     DataModule1.FilterTransaction.Active:=False;
     DataModule1.FilterTransaction.StartTransaction;
     DataModule1.FilterTW.close;
     if TW1.Checked then begin
        Clear_FilterTW;
        SFILTERTW:='Все товары';
     end;
     if TW2.Checked then begin
       Clear_FilterTW;
       SFILTERTW:='Только товары из группы '+Edit1.text;
       DataModule1.FilterTW.PAramByname('SET_GROUP').asstring:='1';
       DataModule1.FilterTW.PAramByname('GROUP_ID').asinteger:=TWTREE_ID;
     end;
     DataModule1.FilterTW.open;
     if DataModule1.FilterTW.fieldByname('C').asinteger=0 then begin
        Wait_Form.Gauge1.Progress:=100;
        delay(100);
        Wait_Form.Hide;
        messbox('Отобрано 0 наименований товаров. Отчёт пуст!',MessSystem,48);
        DataModule1.FilterTransaction.Rollback;
     end else begin
        Wait_Form.StatusBar1.panels[0].text:='Товаров '+DataModule1.FilterTW.fieldByname('C').asstring+'. Отбор накладных...';
        Wait_Form.Gauge1.Progress:=30;
        delay(1);
         if RN1.Checked then begin
            Clear_FilterRN;
            DataModule1.FilterRN.PAramByname('SET_PERIOD').asstring:='1';
            DataModule1.FilterRN.PAramByname('DT1').asdatetime:=DT1.date;
            DataModule1.FilterRN.PAramByname('DT2').asdatetime:=DT2.date+1-SEKOND1;
            DataModule1.FilterRN.PAramByname('PERIOD_DAYS').asstring:=' 1  2 3 4 5 6 7 ';
            if FILTER_RN.SET_SHOP.checked then begin
               DataModule1.FilterRN.PAramByname('SET_SHOP').asstring:='1';
               DataModule1.FilterRN.PAramByname('SHOP').asinteger:=strtoint(FILTER_RN.SHOP.Value);
            end;
        end;
        if RN2.Checked then begin
            Clear_FilterRN;
            DataModule1.FilterRN.PAramByname('SET_RNTYP').asstring:='1';
            DataModule1.FilterRN.PAramByname('RNTYP').asstring:=' '+RNTYP.value+' ';
            DataModule1.FilterRN.PAramByname('SET_PERIOD').asstring:='1';
            DataModule1.FilterRN.PAramByname('DT1').asdatetime:=DT1.date;
            DataModule1.FilterRN.PAramByname('DT2').asdatetime:=DT2.date+1-SEKOND1;
            DataModule1.FilterRN.PAramByname('PERIOD_DAYS').asstring:=' 1  2 3 4 5 6 7 ';
            if FILTER_RN.SET_SHOP.checked then begin
               DataModule1.FilterRN.PAramByname('SET_SHOP').asstring:='1';
               DataModule1.FilterRN.PAramByname('SHOP').asinteger:=strtoint(FILTER_RN.SHOP.Value);
            end;
         end;
         DataModule1.FilterRN.open;
         if (DataModule1.FilterRN.fieldByname('RN_C').asinteger=0)
            and (DataModule1.FilterRN.fieldByname('SPIS_C').asinteger=0) then begin
            Wait_Form.Gauge1.Progress:=100;
            delay(100);
            Wait_Form.Hide;
            messbox('Отобрано 0 накладных. Отчёт пуст!',MessSystem,48);
           DataModule1.FilterTransaction.Rollback;
         end else begin
           Wait_Form.StatusBar1.panels[0].text:='Товаров '+DataModule1.FilterTW.fieldByname('C').asstring+'. Накладных '+inttostr(
            DataModule1.FilterRN.fieldByname('RN_C').asinteger+
            DataModule1.FilterRN.fieldByname('SPIS_C').asinteger)+'. Построение отчета...';
           Wait_Form.Gauge1.Progress:=66;
           delay(1);
           DataModule1.ReportTORG1.close;
           DataModule1.ReportTORG1.ParamByname('FILTERTW_ID').asinteger:=
             DataModule1.FilterTW.fieldByname('FILTERTW_ID').asinteger;
           DataModule1.ReportTORG1.ParamByname('FILTERRN_ID').asinteger:=
             DataModule1.FilterRN.fieldByname('FILTERRN_ID').asinteger;
           DataModule1.ReportTORG1.ParamByname('FILTERSPIS_ID').asinteger:=
             DataModule1.FilterRN.fieldByname('FILTERSPIS_ID').asinteger;
           DataModule1.ReportTORG1.ParamByname('DT1').asdateTIme:=Dt1.date;
           DataModule1.ReportTORG1.ParamByname('DT2').asdateTIme:=Dt2.date+1-SEKOND1;
           DataModule1.FilterTW.close;
           DataModule1.FilterRN.close;
           DataModule1.FilterTransaction.Commit;
           DataModule1.FilterTransaction.Active:=False;
           DataModule1.ReportTransaction.Active:=False;
           DataModule1.ReportTORG1.open;
           if DataModule1.ReportTORG1.eof then begin
               Wait_Form.Gauge1.Progress:=100;
               delay(100);
               Wait_Form.Hide;
                messbox('Отчёт пуст!',MessSystem,48)
              end else begin
               Wait_Form.StatusBar1.panels[0].text:='Подготовка к печати...';
               Wait_Form.Gauge1.Progress:=87;
               delay(1);
              {Выводим отчёт}
              SFILTERTW:=trim(SFILTERTW);
              if b_utils.left(SFILTERTW,2)=', ' then SFILTERTW:=B_utils.right(SFILTERTW,length(SFILTERTW)-2);
              s3:=SFILTERTW;
              if rn1.Checked then s3:=s3+', Все расходные накладные';
              if rn2.Checked then s3:=s3+', Расходные накладные: '+RNTYP.Text;
              if rn3.Checked then s3:=s3+', Расходные накладные по фильтру';
              s3:=s3+' за период с '+date_sokr(DT1.date)+' по '+date_sokr(DT2.date);
               Wait_Form.Gauge1.Progress:=100;
               delay(100);
               Wait_Form.Hide;
               TORG1_TITLE1.Lines.clear;
               TORG1_TITLE1.Lines.add(S3);
               TORG1_TITLE2.Lines.clear;
               TORG1_TITLE2.Lines.add(S3);
               USER_FIO.caption:=USERFIO;
               PpReport1.reset;
               PpReport1.Print;
           end;
           DataModule1.ReportTORG1.close;
           DataModule1.ReportTransaction.Active:=False;
         end;
       end;
     DataModule1.FilterTW.close;
     DataModule1.FilterRN.close;
     DataModule1.FilterTransaction.Active:=False;
     Wait_Form.Hide;
     BtnRun.enabled:=True;
     BtnClose.enabled:=True;
end;

procedure TReport_torg.BtnDicTowarClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     DIC_TOWAR.tag:=TWTREE_ID;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       TWTREE_ID:=DIC_TOWAR.tag;
       WorkTransaction.Active:=False;
       IbQuery1.close;
       IbQuery1.SQL.clear;
       IbQuery1.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       IbQuery1.ParamByname('TWTREE_ID').asinteger:=TWTREE_ID;
       IbQuery1.Open;
       Edit1.text:='';
       if not IbQuery1.eof then Edit1.text:=IbQuery1.fieldByname('TWTREE_FULL').asstring;
       WorkTransaction.Active:=False;
     end;
end;

procedure TReport_torg.SHOP1Click(Sender: TObject);
begin
     SHOP.enabled:=SHOP2.checked;
end;

procedure TReport_torg.ppReport1PreviewFormCreate(Sender: TObject);
begin
     ppReport1.PreviewForm.WindowState:=WsMaximized;
end;

procedure TReport_torg.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;

end;

end.