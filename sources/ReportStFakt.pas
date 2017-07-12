unit ReportStFakt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, RxLookup, Mask, ToolEdit, StdCtrls, Buttons, Db,
  IBCustomDataSet, IBQuery, IBDatabase,WaitForm, FR_Class, FR_DSet,
  FR_DBSet,VclUtils;

type
  TREPORT_STFAKT = class(TForm)
    Label3: TLabel;
    FRM_NAME: TEdit;
    BTN_FRM: TBitBtn;
    Label6: TLabel;
    FRM_BNK: TEdit;
    KLN_BNK: TEdit;
    Label7: TLabel;
    BTN_KLN: TBitBtn;
    KLN_NAME: TEdit;
    Label5: TLabel;
    Label1: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    Label2: TLabel;
    Label4: TLabel;
    SHOP: TRxDBLookupCombo;
    Label8: TLabel;
    RNTYP: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    OSN: TEdit;
    Label9: TLabel;
    WorkTransaction: TIBTransaction;
    IBQuery1: TIBQuery;
    Label10: TLabel;
    DT: TDateEdit;
    Button1: TButton;
    Button2: TButton;
    ReportTransaction: TIBTransaction;
    QueryReport: TIBQuery;
    DsReport: TDataSource;
    QueryReportTW_ID: TIntegerField;
    QueryReportTW_ART: TIntegerField;
    QueryReportTW_NAM: TIBStringField;
    QueryReportED_SHORT: TIBStringField;
    QueryReportTW_KOL: TFloatField;
    QueryReportTW_MONEY: TFloatField;
    QueryReportTW_MONEY1: TFloatField;
    QueryReportTW_MONEY2: TFloatField;
    QueryReportNDS: TFloatField;
    QueryReportNSP: TFloatField;
    Label11: TLabel;
    NUM: TEdit;
    FrDb: TfrDBDataSet;
    frReport1: TfrReport;
    QueryReportTW_TAM: TIBStringField;
    QueryReportTW_LAND: TIBStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTN_FRMClick(Sender: TObject);
    Procedure Change_FRMKln(ID,N:integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure DT2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_ID:integer;
  KLN_ID:integer;
  REPORT_STFAKT: TREPORT_STFAKT;
  PROD,ADR1,REKW1,TEL1,POK,ADR2,REKW2,TEL2,SUMPROPIS:string;

implementation

uses DateInterval, DicKlient;

{$R *.DFM}

procedure TREPORT_STFAKT.BitBtn1Click(Sender: TObject);
begin
  Application.createForm(TDate_interval,Date_Interval);
  Date_interval.Dt1.date:=DT1.date;
  Date_interval.Dt2.date:=DT2.date;
  Date_interval.Showmodal;
  if Date_interval.tag=2 then begin
    DT1.date:=Date_interval.Dt1.date;
    DT2.date:=Date_interval.Dt2.date;
    OSN.text:='Накладные за период c '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
  end;
  Date_Interval.destroy;
end;

procedure TREPORT_STFAKT.FormShow(Sender: TObject);
begin
   // Выставляем начальные параметры;
   SHOP.value:=inttostr(shopid);
   dt1.date:=date();
   dt2.date:=date();
   DT.date:=date();
   DataModule1.MainDicRnTyp.first;
   RNTYP.value:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_ID').asstring;
   FRM_ID:=SHOP_FRM_DEFAULT(SHOPID,DataModule1.MainDicRnTyp.fieldByname('RNTYP_ID').asinteger);
   KLN_ID:=SHOP_KLN_DEFAULT(SHOPID,DataModule1.MainDicRnTyp.fieldByname('RNTYP_ID').asinteger);
   Change_FrmKln(FRM_ID,1);
   Change_FrmKln(KLN_ID,2);

end;

procedure TREPORT_STFAKT.BTN_FRMClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=FRM_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>FRM_ID then begin
        FRM_ID:=DIC_KLIENT.tag;
        Change_FrmKln(FRM_ID,1);
     end;
     DIC_KLIENT.Destroy;
     try
       OSN.setfocus;
     Except
     End;
end;


procedure TREPORT_STFAKT.Change_FrmKln(ID,N:integer);
var
   s1,s2:ansistring;
begin
     {Отображаем название фирмы и банка}
     WorkTransaction.Active:=False;
     IbQuery1.Close;
     IbQuery1.SQL.clear;
     IbQuery1.SQL.add('select KLN_FULL,KLN_REKW FROM KLN_DATA(:KLN_ID)');
     IbQuery1.Parambyname('KLN_ID').asinteger:=ID;
     IbQuery1.Open;
     s1:='';
     S2:='';
     if not IbQuery1.eof then begin
         s1:=IbQuery1.fieldbyname('KLN_FULL').asstring;
         s2:=IbQuery1.fieldbyname('KLN_REKW').asstring;
     end;
     if N=1 then begin
        FRM_NAME.text:=s1;
        FRM_BNK.text:=s2;
     end else begin
        KLN_NAME.text:=s1;
        KLN_BNK.text:=s2;
     end;
     IbQuery1.Close;
end;

procedure TREPORT_STFAKT.Button1Click(Sender: TObject);
begin
   close;
end;

procedure TREPORT_STFAKT.Button2Click(Sender: TObject);
var
  SUM:real;
  CNT:integer;
   t1,t2:tFrPictureView;
begin
   ReportTransaction.Active:=False;
   QueryReport.close;
   QueryReport.ParamByname('dt1').asdatetime:=dt1.date;
   QueryReport.ParamByname('dt2').asdatetime:=dt2.date+1-sekond1;
   QueryReport.ParamByname('shop_id').asinteger:=strtoint(shop.value);
   QueryReport.ParamByname('rntyp_id').asinteger:=strtoint(rntyp.value);
   Wait_FORM.Statusbar1.panels[0].text:='Запрос данных...';
   Wait_FORM.Gauge1.Progress:=0;
   Wait_FORM.Show;
   delay(100);
   QueryReport.open;
   if QueryReport.eof then begin
      Wait_FORM.Hide;
      Messbox('Отчет пуст!',MessSystem,48);
   end else begin
      Wait_FORM.Gauge1.Progress:=50;
      Wait_FORM.Show;
      delay(100);
      // Запрашиваем остальные данные для формирования титула
      WorkTransaction.Active:=False;
      ADD_SQL(IBQuery1,'select * from kln_data(:kln_id)');
      IBQuery1.ParamByname('kln_id').asinteger:=FRM_ID;
      IBQuery1.Open;
      PROD:=IBQuery1.fieldByname('KLN_FULL').asstring;
      ADR1:=IBQuery1.fieldByname('KLN_ADR').asstring;
      REKW1:=IBQuery1.fieldByname('KLN_REKW').asstring;
      TEL1:=IBQuery1.fieldByname('KLN_TEL').asstring;
      Wait_FORM.Gauge1.Progress:=70;
      Wait_FORM.Show;
      delay(100);
      ADD_SQL(IBQuery1,'select * from kln_data(:kln_id)');
      IBQuery1.ParamByname('kln_id').asinteger:=KLN_ID;
      IBQuery1.Open;
      POK:=IBQuery1.fieldByname('KLN_FULL').asstring;
      ADR2:=IBQuery1.fieldByname('KLN_ADR').asstring;
      REKW2:=IBQuery1.fieldByname('KLN_REKW').asstring;
      TEL2:=IBQuery1.fieldByname('KLN_TEL').asstring;
      IBQuery1.close;
      // определяем сумму прописью
      Wait_FORM.Gauge1.Progress:=80;
      Wait_FORM.Show;
      delay(100);
      SUM:=0;
      CNT:=0;
      while not QueryReport.eof do begin
         inc(CNT);
         SUM:=SUM+QueryReport.fieldByname('tw_kol').asfloat*QueryReport.fieldByname('tw_money2').asfloat;
         QueryReport.next;
      end;
      SUMPROPIS:='Итого '+inttostr(CNT)+okon_char(' наименование',' наименования',' наименований',CNT)+' на сумму: '+
      rub_char(SUM);
      QueryReport.first;
      Wait_FORM.Hide;
      t1:=tFrPictureView(FrReport1.FindObject('Picture1'));
      try
       t1.Picture.LoadFromFile(LOGO_NAME);
      Except
      End;
      FrReport1.ShowReport;
   end;

end;

procedure TREPORT_STFAKT.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
    if ParName='TITLE' then ParValue:=trim(NUM.text)+' от '+date_sokr(DT.date);
    if ParName='PROD' then ParValue:=PROD;
    if ParName='ADR1' then ParValue:=ADR1;
    if ParName='REKW1' then ParValue:=REKW1;
    if ParName='TEL1' then ParValue:=TEL1;
    if ParName='POK' then ParValue:=POK;
    if ParName='ADR2' then ParValue:=ADR2;
    if ParName='REKW2' then ParValue:=REKW2;
    if ParName='TEL2' then ParValue:=TEL2;
    if ParName='OSN' then ParValue:=OSN.text;
    if ParName='SUMPROPIS' then ParValue:=SUMPROPIS;
    if ParName='USERFIO' then ParValue:=USERFIO;
    if ParName='VERSION' then ParValue:=PROG_VERSION;
end;

procedure TREPORT_STFAKT.DT2Change(Sender: TObject);
begin
    OSN.text:='Накладные за период c '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
end;

end.
