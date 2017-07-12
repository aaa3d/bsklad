unit ReportKlientFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, StdCtrls, Mask, ToolEdit,Data1,b_utils,b_dbutils, Db,
  IBCustomDataSet, IBQuery, IBDatabase,WaitForm, FR_Class, FR_DSet,
  FR_DBSet,VclUtils;

type
  TReport_Post_fin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    USL1: TCheckBox;
    USL2: TCheckBox;
    US1: TComboBox;
    SEL1: TComboBox;
    VAL1: TRxCalcEdit;
    Lab1: TLabel;
    US2: TComboBox;
    SEL2: TComboBox;
    VAL2: TRxCalcEdit;
    Lab2: TLabel;
    Label5: TLabel;
    SEL3: TComboBox;
    Button1: TButton;
    Button2: TButton;
    ReportTransaction: TIBTransaction;
    QueryReport: TIBQuery;
    DsReport: TDataSource;
    QueryReportKLN_ID: TIntegerField;
    QueryReportKLN_FULL: TIBStringField;
    QueryReportOB_SUM: TFloatField;
    QueryReportOB_PERC: TFloatField;
    QueryReportOB_NDS: TFloatField;
    QueryReportOB_NSP: TFloatField;
    QueryReportSEB: TFloatField;
    QueryReportNDS: TFloatField;
    QueryReportNAC: TFloatField;
    QueryReportNAC_PERC: TFloatField;
    QueryReportSEB2: TFloatField;
    QueryReportNDS2: TFloatField;
    QueryReportNAC2: TFloatField;
    QueryReportNAC_PERC2: TFloatField;
    QueryReportRENT1: TFloatField;
    QueryReportRENT2: TFloatField;
    QueryReportNAC1: TFloatField;
    DbFr1: TfrDBDataSet;
    Rep: TfrReport;
    procedure SEL1Change(Sender: TObject);
    procedure SEL2Change(Sender: TObject);
    procedure SEL3Change(Sender: TObject);
    procedure USL1Click(Sender: TObject);
    procedure USL2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RepGetValue(const ParName: String; var ParValue: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Report_Post_fin: TReport_Post_fin;
  Title:string;

implementation

{$R *.DFM}

procedure TReport_Post_fin.SEL1Change(Sender: TObject);
begin
   if SEL1.itemindex<0 then SEL1.itemindex:=0;
   if SEL1.itemindex in [1,7,8,9,10] then lab1.Caption:='%'
                                     else lab1.Caption:='Руб.';
end;

procedure TReport_Post_fin.SEL2Change(Sender: TObject);
begin
   if SEL2.itemindex<0 then SEL2.itemindex:=0;
   if SEL2.itemindex in [1,7,8,9,10] then lab2.Caption:='%'
                                     else lab2.Caption:='Руб.';
end;

procedure TReport_Post_fin.SEL3Change(Sender: TObject);
begin
   if SEL3.itemindex<0 then SEL3.itemindex:=0;
end;

procedure TReport_Post_fin.USL1Click(Sender: TObject);
begin
    SEL1.enabled:=USL1.checked;
    US1.enabled:=USL1.checked;
    VAL1.enabled:=USL1.checked;
    LAB1.Enabled:=USL1.checked;
    if not USL1.checked then begin
       USL2.checked:=false;
       USL2.enabled:=false;
    end else USL2.enabled:=true;
    USL2.onClick(Sender);
end;

procedure TReport_Post_fin.USL2Click(Sender: TObject);
begin
    SEL2.enabled:=USL2.checked;
    US2.enabled:=USL2.checked;
    VAL2.enabled:=USL2.checked;
    LAB2.Enabled:=USL2.checked;
end;

procedure TReport_Post_fin.FormShow(Sender: TObject);
var
  dd,mm,yy:word;
begin
   decodedate(date(),yy,mm,dd);
   dt1.date:=encodedate(yy,mm,1);
   dt2.date:=incmonth(dt1.date,1)-1;
   USL1.checked:=False;
   USL2.checked:=False;
   SEL1.itemindex:=0;
   SEL2.itemindex:=1;
   SEL3.itemindex:=0;
   US1.itemindex:=0;
   US2.itemindex:=0;
   VAL1.value:=0;
   VAL2.value:=0;
   SEL1.onchange(Sender);
   SEL2.onchange(Sender);
   Usl2.onclick(Sender);
   Usl1.onclick(Sender);
end;

procedure TReport_Post_fin.Button2Click(Sender: TObject);
begin
    close;
end;

procedure TReport_Post_fin.Button1Click(Sender: TObject);
var
  SQL:string;
  s,s2:string;
begin
   // строим отчет
   SQL:='select * from report_new_post(:dt1,:dt2) ';
   Title:='Финансовые показатели продаж по поставщикам за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
   if USL1.checked then begin
      if US1.Itemindex=0 then s:='>' else s:='<';
      if US1.Itemindex=0 then s2:='более ' else s2:='менее ';
      case SEL1.ItemIndex of
         0: begin // Обороты продаж
               sql:=sql+' where ob_sum'+s+':val1';
               title:=title+' с оборотами '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         1: begin // Доля оборота
               sql:=sql+' where ob_perc'+s+':val1';
               title:=title+' с долей товарооборота в общей сумме  '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         2: begin // Сумма НДС продаж
               sql:=sql+' where ob_nds'+s+':val1';
               title:=title+' с суммой НДС продаж '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         3: begin // Сумма НП продаж
               sql:=sql+' where ob_nsp'+s+':val1';
               title:=title+' с суммой НП '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         4: begin // Себестоимость продаж
               sql:=sql+' where seb'+s+':val1';
               title:=title+' с себестоимостью проданного товара '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         5: begin // НДС закупки проданных товаров
               sql:=sql+' where nds'+s+':val1';
               title:=title+' с НДС закупки проданного товара '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         6: begin // Сумма наценки
               sql:=sql+' where nac'+s+':val1';
               title:=title+' с наценкой '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         7: begin // Доля наценки
               sql:=sql+' where nac_perc'+s+':val1';
               title:=title+' с долей наценки в общей сумме наценки '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         8: begin // Рентабельность продаж
               sql:=sql+' where rent1'+s+':val1';
               title:=title+' с рентабельностью продаж '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         9: begin // Рентабельность продукции
               sql:=sql+' where rent2'+s+':val1';
               title:=title+' с рентабельностью продукции '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         10: begin // Процент наценки
               sql:=sql+' where nac1'+s+':val1';
               title:=title+' с процентом наценки '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
      end;
   end;
   if USL2.checked then begin
      if US2.Itemindex=0 then s:='>' else s:='<';
      if US2.Itemindex=0 then s2:='более ' else s:='менее ';
      case SEL2.ItemIndex of
         0: begin // Обороты продаж
               sql:=sql+' and ob_sum'+s+':val1';
               title:=title+' с оборотами '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         1: begin // Доля оборота
               sql:=sql+' and ob_perc'+s+':val1';
               title:=title+' и долей товарооборота в общей сумме  '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         2: begin // Сумма НДС продаж
               sql:=sql+' and ob_nds'+s+':val1';
               title:=title+' и суммой НДС продаж '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         3: begin // Сумма НП продаж
               sql:=sql+' and ob_nsp'+s+':val1';
               title:=title+' и суммой НП '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         4: begin // Себестоимость продаж
               sql:=sql+' and seb'+s+':val1';
               title:=title+' и себестоимостью проданного товара '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         5: begin // НДС закупки проданных товаров
               sql:=sql+' and nds'+s+':val1';
               title:=title+' и НДС закупки проданного товара '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         6: begin // Сумма наценки
               sql:=sql+' and nac'+s+':val1';
               title:=title+' и наценкой '+s2+floattostrf(val1.value,fffixed,19,2)+' руб.';
            end;
         7: begin // Доля наценки
               sql:=sql+' and nac_perc'+s+':val1';
               title:=title+' и долей наценки в общей сумме наценки '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         8: begin // Рентабельность продаж
               sql:=sql+' and rent1'+s+':val1';
               title:=title+' и рентабельностью продаж '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         9: begin // Рентабельность продукции
               sql:=sql+' and rent2'+s+':val1';
               title:=title+' и рентабельностью продукции '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
         10: begin // Процент наценки
               sql:=sql+' and nac1'+s+':val1';
               title:=title+' и процентом наценки '+s2+floattostrf(val1.value,fffixed,19,2)+' %';
            end;
      end;
   end;
   sql:=sql+' order by ';
   case SEL3.ItemIndex of
         0: begin
                title:=title+', Отчет упорядочен по сумме оборотов'; // Обороты продаж
                sql:=sql+'ob_sum';
            end;
         1: begin
                title:=title+', Отчет упорядочен по доле оборотов';// Доля оборота
                sql:=sql+'ob_perc';
            end;
         2: begin
                title:=title+', Отчет упорядочен по сумме НДС продаж';// Сумма НДС продаж
                sql:=sql+'ob_nds';
            end;
         3: begin
                title:=title+', Отчет упорядочен по сумме НП продаж';// Сумма НП продаж
                sql:=sql+'ob_nsp';
            end;
         4: begin
                title:=title+', Отчет упорядочен по сумме себестоимости продаж';// Себестоимость продаж
                sql:=sql+'seb';
            end;
         5: begin
                title:=title+', Отчет упорядочен по НДС закупки проданного товара';// НДС закупки проданных товаров
                sql:=sql+'nds';
            end;
         6: begin
                title:=title+', Отчет упорядочен по сумме наценки в рублях';// Сумма наценки
                sql:=sql+'nac';
            end;
         7: begin
                title:=title+', Отчет упорядочен по доле наценки';// Доля наценки
                sql:=sql+'nac_perc';
            end;
         8: begin
                title:=title+', Отчет упорядочен по % рентабельности продаж';// Рентабельность продаж
                sql:=sql+'rent1';
            end;
         9: begin
                title:=title+', Отчет упорядочен по % рентабельности продукции';// Рентабельность продукции
                sql:=sql+'rent2';
            end;
         10: begin
                title:=title+', Отчет упорядочен по % наценки';// Процент наценки
                sql:=sql+'nac1';
            end;
         11: begin
                title:=title+', Отчет упорядочен по Наименованию поставщика '; //Процент наценки
                sql:=sql+'kln_full';
            end;
      end;
   sql:=sql+' desc';
   ADD_SQL(QueryReport,SQL);
   QueryReport.parambyname('dt1').asdatetime:=dt1.Date;
   QueryReport.parambyname('dt2').asdatetime:=dt2.Date+1-sekond1;
   if USL1.checked then QueryReport.parambyname('val1').asfloat:=val1.value;
   if USL2.checked then QueryReport.parambyname('val2').asfloat:=val2.value;
   Wait_form.StatusBar1.panels[0].text:='Запрос данных.Ждите...';
   Wait_form.Gauge1.Progress:=10;
   Wait_form.Show;
   delay(1);
   QueryReport.Open;
   Wait_form.Gauge1.Progress:=100;
   Wait_form.Show;
   delay(100);
   Wait_form.Hide;
   if QueryReport.eof then messbox('Отчет пуст!',MessSystem,48) else begin
      REP.showReport;
   end;
   QueryReport.close;
end;

procedure TReport_Post_fin.RepGetValue(const ParName: String;
  var ParValue: Variant);
begin
    if ParName='USERFIO' then ParValue:=USERFIO;
    if ParName='REPORT_TITLE' then ParValue:=TITLE;
end;

end.
