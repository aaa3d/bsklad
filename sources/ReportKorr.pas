unit ReportKorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls, Buttons,Data1,b_utils,b_Dbutils,
  RxLookup, Db, IBCustomDataSet, IBQuery, IBDatabase, FR_Class, FR_DSet,
  FR_DBSet;

type
  TREPORT_KORR = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TYP: TRadioGroup;
    DT1: TDateEdit;
    DT2: TDateEdit;
    KLN_NAME: TEdit;
    BTN_KLN: TBitBtn;
    Label7: TLabel;
    KLN_BNK: TEdit;
    Button1: TButton;
    Button2: TButton;
    RNTYP: TRxDBLookupCombo;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ReportTransaction: TIBTransaction;
    QueryReport: TIBQuery;
    DsReport: TDataSource;
    FrReport: TfrDBDataSet;
    RepKorr: TfrReport;
    QueryReport2: TIBQuery;
    FrReport2: TfrDBDataSet;
    DsReport2: TDataSource;
    RepKorr2: TfrReport;
    QueryReport2PP_VID: TIBStringField;
    QueryReport2PP_ID: TIntegerField;
    QueryReport2PP_TYP: TIntegerField;
    QueryReport2PP_FULL_NUM: TIBStringField;
    QueryReport2PP_DT: TDateTimeField;
    QueryReport2TW_KOL: TFloatField;
    QueryReport2SEB: TFloatField;
    QueryReport2NDS: TFloatField;
    QueryReport2PP_SHOP_COLOR: TIntegerField;
    QueryReport2TW_ID: TIntegerField;
    QueryReport2TW_ART: TIntegerField;
    QueryReport2TW_NAM: TIBStringField;
    Button3: TButton;
    Button4: TButton;
    WTransaction: TIBTransaction;
    QueryW: TIBQuery;
    SaveDialog1: TSaveDialog;
    procedure Button2Click(Sender: TObject);
    procedure TYPClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure refresh_post;
    procedure BTN_KLNClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RepKorrGetValue(const ParName: String;
      var ParValue: Variant);
    procedure RepKorr2GetValue(const ParName: String;
      var ParValue: Variant);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_KORR: TREPORT_KORR;
  POST_ID:integer;
  REPORT_TITLE:string;

implementation

uses DicKlient;

{$R *.DFM}

procedure TREPORT_KORR.Button2Click(Sender: TObject);
begin
   close;
end;

procedure TREPORT_KORR.TYPClick(Sender: TObject);
begin
    if TYP.itemindex=1 then RNTYP.enabled:=true else RNTYP.enabled:=false;
end;

procedure TREPORT_KORR.FormShow(Sender: TObject);
begin
    DataModule1.MainDicRnTyp.first;
    RNTYP.value:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_ID').asstring;
    DT1.date:=date();
    DT2.date:=date();
    TYP.itemindex:=0;
    TYP.OnClick(Sender);
    POST_ID:=userid;
    refresh_post;

end;

procedure TREPORT_KORR.refresh_post;
begin
    // Обновляем информацию о поставщиек
    WorkTransaction.Active:=False;
    ADD_SQL(QueryWork,'select kln_full,kln_rekw from kln_data(:kln_id)');
    QueryWork.ParamByname('kln_id').asinteger:=POST_ID;
    QueryWork.Open;
    KLN_NAME.text:=QueryWork.fieldByname('KLN_FULL').asstring;
    KLN_BNK.text:=QueryWork.fieldByname('KLN_REKW').asstring;
    KLN_NAME.Hint:=KLN_NAME.text;
    KLN_BNK.Hint:=KLN_BNK.text;
    QueryWork.close;
end;

procedure TREPORT_KORR.BTN_KLNClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=POST_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>POST_ID then begin
        POST_ID:=DIC_KLIENT.tag;
        refresh_post;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TREPORT_KORR.Button1Click(Sender: TObject);
begin
    ReportTransaction.Active:=False;
    QueryReport.paramByname('POST_ID').asinteger:=POST_ID;
    QueryReport.paramByname('DT1').asdatetime:=DT1.date;
    QueryReport.paramByname('DT2').asdatetime:=DT2.date+1-sekond1;
    if TYP.itemindex=0 then begin
        QueryReport.ParamByname('TYP').asinteger:=2;
        QueryReport.ParamByname('RNTYP_ID').asinteger:=0
    end else begin
        QueryReport.ParamByname('TYP').asinteger:=1;
        QueryReport.ParamByname('RNTYP_ID').asinteger:=strtoint(RNTYP.value);
    end;
    QueryReport.open;
    if QueryReport.eof then begin
       Messbox('Отчет пуст!',MessSystem,48);
    end else begin
       REPORT_TITLE:='Отчет-справка по коррекции НДС поставщика "'+KLN_NAME.text+'" за период с '+
       date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
       if TYP.itemindex=0 then REPORT_TITLE:=REPORT_TITLE+' по актам списания';
       if TYP.itemindex=1 then REPORT_TITLE:=REPORT_TITLE+' по расходным накладным '+RNTYP.Text;
       RepKorr.ShowReport;
    end;
    QueryReport.close;

end;

procedure TREPORT_KORR.RepKorrGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
  if ParName='REPORT_FOOTER' then
    ParValue:=FORM1_CAPTION+', Пользователь: '+USERFIO_SHORT+', Дата: '+date_sokr(date())+' '+timetostr(time());

end;

procedure TREPORT_KORR.RepKorr2GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
  if ParName='REPORT_FOOTER' then
    ParValue:=FORM1_CAPTION+', Пользователь: '+USERFIO_SHORT+', Дата: '+date_sokr(date())+' '+timetostr(time());
end;

procedure TREPORT_KORR.Button3Click(Sender: TObject);
begin
    ReportTransaction.Active:=False;
    QueryReport2.paramByname('KLN_ID').asinteger:=POST_ID;
    QueryReport2.paramByname('DT1').asdatetime:=DT1.date;
    QueryReport2.paramByname('DT2').asdatetime:=DT2.date+1-sekond1;
    if TYP.itemindex=0 then begin
        QueryReport2.ParamByname('TYP').asinteger:=2;
        QueryReport2.ParamByname('RNTYP_ID').asinteger:=0
    end else begin
        QueryReport2.ParamByname('TYP').asinteger:=1;
        QueryReport2.ParamByname('RNTYP_ID').asinteger:=strtoint(RNTYP.value);
    end;
    QueryReport2.open;
    if QueryReport2.eof then begin
       Messbox('Отчет пуст!',MessSystem,48);
    end else begin
       REPORT_TITLE:='Суммарный отчет-справка по коррекции НДС поставщика "'+KLN_NAME.text+'" за период с '+
       date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
       if TYP.itemindex=0 then REPORT_TITLE:=REPORT_TITLE+' по актам списания';
       if TYP.itemindex=1 then REPORT_TITLE:=REPORT_TITLE+' по расходным накладным '+RNTYP.Text;
       RepKorr2.ShowReport;
    end;
    QueryReport2.close;
end;

procedure TREPORT_KORR.Button4Click(Sender: TObject);
var
  f:textfile;
begin
   WTransaction.Active:=False;
   ADD_SQL(QueryW,'select * from korrtmp1(:dt1,:dt2) order by kln_full');
   QueryW.paramByname('dt1').asdatetime:=dt1.date;
   QueryW.paramByname('dt2').asdatetime:=dt2.date+1-sekond1;
   QueryW.open;
   if QueryW.eof then messbox('Отчет пуст!','',48) else begin
      if SaveDialog1.Execute then begin
         assignfile(f,SaveDialog1.FileName);
         rewrite(f);
         writeln(f,'Поставщик'+#9+'Себестоимость'+#9+'НДС');
         while not QueryW.eof do begin
            writeln(f,QueryW.fieldbyname('kln_full').asstring+#9+
            floattostrf(QueryW.fieldbyname('seb').asfloat,fffixed,19,2)+#9+
            floattostrf(QueryW.fieldbyname('nds').asfloat,fffixed,19,2));
            QueryW.next;
         end;
         messbox('Готово','',48);
         closefile(f);
      end;
   end;
   QueryW.close;
end;

end.
