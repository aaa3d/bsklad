unit ReportNalogAll;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_Utils,b_Dbutils, Buttons, StdCtrls, Mask, ToolEdit, Db,
  IBCustomDataSet, IBQuery, IBDatabase, FR_Class, FR_DSet, FR_DBSet,VclUtils,
  RxLookup,Excel97, OleServer, ComObj, FR_Desgn;

type
  TREPORT_NALOG_ALL = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    TW: TEdit;
    BtnDic: TSpeedButton;
    Label3: TLabel;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ReportTransaction: TIBTransaction;
    QueryRep1: TIBQuery;
    QueryRep1TW_ID: TIntegerField;
    QueryRep1TW_ART: TIntegerField;
    QueryRep1TW_NAM: TIBStringField;
    QueryRep1ED_SHORT: TIBStringField;
    QueryRep1OST1: TFloatField;
    QueryRep1OST1_SEB: TFloatField;
    QueryRep1POST: TFloatField;
    QueryRep1POST_SEB: TFloatField;
    QueryRep1POST_NDS: TFloatField;
    QueryRep1REAL_KOL: TFloatField;
    QueryRep1REAL_SEB: TFloatField;
    QueryRep1REAL_NDS: TFloatField;
    QueryRep1OST2: TFloatField;
    QueryRep1OST2_SEB: TFloatField;
    DsRep1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    FrRep1: TfrDBDataSet;
    Rep1: TfrReport;
    QueryRep2: TIBQuery;
    FrRep2: TfrDBDataSet;
    DsRep2: TDataSource;
    Rep2: TfrReport;
    QueryRep2POST_ID: TIntegerField;
    QueryRep2POST_FULL: TIBStringField;
    QueryRep2OST1_SEB: TFloatField;
    QueryRep2OST1_NDS: TFloatField;
    QueryRep2POST_SEB: TFloatField;
    QueryRep2POST_NDS: TFloatField;
    QueryRep2REAL_SEB: TFloatField;
    QueryRep2REAL_NDS: TFloatField;
    QueryRep2OST2_SEB: TFloatField;
    QueryRep2OST2_NDS: TFloatField;
    FrRep3: TfrDBDataSet;
    DsRep3: TDataSource;
    QueryRep3: TIBQuery;
    QueryRep3TW_ID: TIntegerField;
    QueryRep3TW_ART: TIntegerField;
    QueryRep3TW_NAM: TIBStringField;
    QueryRep3ED_SHORT: TIBStringField;
    QueryRep3POST_ID: TIntegerField;
    QueryRep3POST_FULL: TIBStringField;
    QueryRep3OST1: TFloatField;
    QueryRep3OST1_SEB: TFloatField;
    QueryRep3OST1_NDS: TFloatField;
    QueryRep3POST: TFloatField;
    QueryRep3POST_SEB: TFloatField;
    QueryRep3POST_NDS: TFloatField;
    QueryRep3REAL_KOL: TFloatField;
    QueryRep3REAL_SEB: TFloatField;
    QueryRep3REAL_NDS: TFloatField;
    QueryRep3OST2: TFloatField;
    QueryRep3OST2_SEB: TFloatField;
    QueryRep3OST2_NDS: TFloatField;
    Rep3: TfrReport;
    Rep4: TfrReport;
    Export: TCheckBox;
    SaveDialog1: TSaveDialog;
    QueryRep1TWTREE_ID: TIntegerField;
    QueryRep1TWTREE_FULL: TIBStringField;
    Label10: TLabel;
    FRM: TRxDBLookupCombo;
    QueryRep1REPORT_FIELD_NAME: TIBStringField;
    QueryRep1REPORT_GROUP_NAME: TIBStringField;
    QueryRep2REPORT_FIELD_NAME: TIBStringField;
    QueryRep2REPORT_GROUP_NAME: TIBStringField;
    QueryRep2OST1: TFloatField;
    QueryRep2OST2: TFloatField;
    QueryRep2POST: TFloatField;
    QueryRep2REAL_KOL: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Rep1GetValue(const ParName: String; var ParValue: Variant);
    procedure Rep2GetValue(const ParName: String; var ParValue: Variant);
    procedure Rep3GetValue(const ParName: String; var ParValue: Variant);
    procedure Rep4GetValue(const ParName: String; var ParValue: Variant);
    procedure ExpExcel(_q: TIbQUery; _filename: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_NALOG_ALL: TREPORT_NALOG_ALL;
  REPORT_TITLE:string;
  Title:string;
  Title2:string;

const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов

implementation

uses DicTowar, WaitForm;

{$R *.DFM}

procedure TREPORT_NALOG_ALL.FormShow(Sender: TObject);
begin
   case tag of
    1: CAPTION:='Ведомость движения товаров по себестоимости. По наименованиям товаров';
    2: CAPTION:='Ведомость движения товаров по себестоимости. По поставщикам';
    3: CAPTION:='Ведомость движения товаров по себестоимости. По товарам в детализации поставщиков';
    4: CAPTION:='Ведомость движения товаров по себестоимости. По поставщикам в детализации товаров';
   end;
   TW.tag:=0; TW.text:='Все товары';
   dt1.date:=date();
   dt2.date:=date();
end;

procedure TREPORT_NALOG_ALL.BtnDicClick(Sender: TObject);
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
     end;
end;

procedure TREPORT_NALOG_ALL.Button2Click(Sender: TObject);
begin
   close;
end;

procedure TREPORT_NALOG_ALL.ExpExcel(_q: TIbQuery;_filename: String);
var excel: TExcelApplication;
    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
    izoneIndex: integer;
    zoneCnt: integer;
    ost: double;
    ostLong: longint;
    i: integer;
    s: string;

begin


//    OpenQuery;
    if not (_q.State in [dsBrowse]) then
      exit;





    try

    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;

    _q.last;
    _q.First;



    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\Ведомость движения товаров.XLT', 0);


    v := VarArrayCreate([0, _q.RecordCount+1, 0, 11], varVariant);

    for iRow:=0 to _q.RecordCount-1 do
    begin


        begin
            v[iRow, 0] := _q.fieldbyname('report_field_name').asVariant;
            v[iRow, 1] := _q.fieldbyname('OST1').asVariant;
            v[iRow, 2] := _q.fieldbyname('OST1_SEB').asVariant;
            v[iRow, 3] := _q.fieldbyname('POST').asVariant;
            v[iRow, 4] := _q.fieldbyname('POST_SEB').asVariant;
            v[iRow, 5] := _q.fieldbyname('POST_NDS').asVariant;
            v[iRow, 6] := _q.fieldbyname('REAL_KOL').asVariant;
            v[iRow, 7] := _q.fieldbyname('REAL_SEB').asVariant;
            v[iRow, 8] := _q.fieldbyname('REAL_NDS').asVariant;
            v[iRow, 9] := _q.fieldbyname('OST2').asVariant;
            v[iRow, 10] := _q.fieldbyname('OST2_SEB').asVariant;
        end;
        _q.Next;
    end;



    r:= excel.Range['A1', 'A1'];
    r.Value := Title;
    r:= excel.Range['A2', 'A2'];
    r.Value := 'Дата построения: '+ datetimetostr(now);
    r:= excel.Range['A4', 'A4'];
    r.Value := Title2;



//    v[QueryReport.RecordCount, 0] := 'Итого: ';


    r := excel.Range[excel.Cells.Item[6, 1],
        excel.Cells.Item[_q.RecordCount + 6- 1,11 ]];
    r.Value := v;

    r.FormatConditions.Delete;
    r.FormatConditions.Add(xlCellValue, xlEqual, '0', '');
    r.FormatConditions.Item(1).Font.ColorIndex := 2;

    R.numberFormat:='# ##0.00';

    r.Borders[xlEdgeTop].LineStyle := xlContinuous;
    r.Borders[xlEdgeTop].Weight := xlThin;
    r.Borders[xlEdgeTop].ColorIndex := xlAutomatic;


    r.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    r.Borders[xlEdgeBottom].Weight := xlThin;
    r.Borders[xlEdgeBottom].ColorIndex := xlAutomatic;
    try
    r.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    r.Borders[xlInsideHorizontal].Weight := xlThin;
    r.Borders[xlInsideHorizontal].ColorIndex := xlAutomatic;
    except
    end;


    except
    on e: Exception do
      begin
        MsgBox('Ошибка выгрузки в Excel', e.message, MB_OK);
        freeandnil(excel);
      end;
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);
    //_q.Close;
end;


procedure TREPORT_NALOG_ALL.Button1Click(Sender: TObject);
var
  s1,s2,s3,s4,s5:double;
  old_twtree_id,twtree_id:integer;
  twtree_full:string;
  f:textfile;
begin
   REPORT_TITLE:=REPORT_NALOG_ALL.caption+' за период с '+date_sokr(dt1.date)+' по '+
   date_sokr(dt2.date)+' по группе товаров: '+tw.text;
   case tag of
     1: begin
           Title:='Ведомость движения товаров по товарам'+chr(13)+chr(10)+'Фирма '+FRM.Text+chr(13)+chr(10)
           +'Период с '+dt1.text+' по '+dt2.Text+chr(13)+chr(10)+'Группа товаров: '+TW.Text;
           Title2:='Товар';
           Wait_Form.Gauge1.Progress:=10;
           Wait_Form.StatusBar1.panels[0].text:='Запрос данных. Ждите...';
           Wait_Form.Show;
           delay(100);
           ReportTransaction.Active:=False;
           QueryRep1.close;
           QueryRep1.ParamByname('twtree_id').asinteger:=tw.tag;
           QueryRep1.ParamByname('frm_id').asinteger:=strtoint(frm.value);
           QueryRep1.ParamByname('dt1').asdatetime:=dt1.date;
           QueryRep1.ParamByname('dt2').asdatetime:=dt2.date+1-sekond1;
           QueryRep1.open;
           Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
           Wait_Form.Gauge1.Progress:=100;
           Wait_Form.Show;
           delay(500);
           Wait_Form.Hide;
           old_twtree_id:=-1;
           if QueryRep1.eof then messbox('Отчет пуст!',MessSystem,48) else begin
//              if Export.checked then begin
                 // Экспортируем отчет
{                 if SaveDialog1.Execute then begin
                   assignfile(f,SaveDialog1.FileName);
                   rewrite(f);
                   while not QueryRep1.eof do begin
                      twtree_id:=QueryRep1.fieldByname('twtree_id').asinteger;
                      twtree_full:=QueryRep1.fieldByname('twtree_full').asstring;
                      if (twtree_id<>old_twtree_id) then begin
                         if old_twtree_id<>-1 then begin
                            // выгоняем
                            writeln(f,twtree_full+#9,floattostrf(s1,fffixed,19,2)+#9+
                            floattostrf(s2,fffixed,19,2)+#9+
                            floattostrf(s3,fffixed,19,2)+#9+
                            floattostrf(s4,fffixed,19,2)+#9+
                            floattostrf(s5,fffixed,19,2));
                         end;
                         // обнуляем
                         s1:=0; s2:=0; s3:=0; s4:=0; s5:=0;
                         old_twtree_id:=twtree_id;
                      end;
                      s1:=s1+QueryRep1.fieldByname('ost1_seb').asfloat;
                      s2:=s2+QueryRep1.fieldByname('post_seb').asfloat;
                      s3:=s3+QueryRep1.fieldByname('post_nds').asfloat;
                      s4:=s4+QueryRep1.fieldByname('real_seb').asfloat;
                      s5:=s5+QueryRep1.fieldByname('ost2_seb').asfloat;
                      QueryRep1.next;
                   end;
                   writeln(f,twtree_full+#9,floattostrf(s1,fffixed,19,2)+#9+
                   floattostrf(s2,fffixed,19,2)+#9+
                   floattostrf(s3,fffixed,19,2)+#9+
                   floattostrf(s4,fffixed,19,2)+#9+
                   floattostrf(s5,fffixed,19,2));
                   closefile(f);
}
                   if Export.checked then ExpExcel(queryRep1, SaveDialog1.FileName);
                   //QueryRep2.First;


//                 end;
//              end;
              Rep1.title:=REPORT_TITLE;
              Rep1.ShowReport;
           end;
        end;
     2: begin
           Title:='Ведомость движения товаров по поставщикам'+chr(13)+chr(10)+'Фирма '+FRM.Text+chr(13)+chr(10)
           +'Период с '+dt1.text+' по '+dt2.Text+chr(13)+chr(10)+'Группа товаров: '+TW.Text;
           Title2:='Поставщик';

           Wait_Form.Gauge1.Progress:=10;
           Wait_Form.StatusBar1.panels[0].text:='Запрос данных. Ждите...';
           Wait_Form.Show;
           delay(100);
           ReportTransaction.Active:=False;
           QueryRep2.close;
           QueryRep2.ParamByname('twtree_id').asinteger:=tw.tag;
           QueryRep2.ParamByname('frm_id').asinteger:=strtoint(FRM.Value);
           QueryRep2.ParamByname('dt1').asdatetime:=dt1.date;
           QueryRep2.ParamByname('dt2').asdatetime:=dt2.date+1-sekond1;
           QueryRep2.open;
           Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
           Wait_Form.Gauge1.Progress:=100;
           Wait_Form.Show;
           delay(500);
           Wait_Form.Hide;



           if QueryRep2.eof then messbox('Отчет пуст!',MessSystem,48) else begin
              if Export.checked then ExpExcel(queryRep2, '');
              Rep2.title:=REPORT_TITLE;
              Rep2.ShowReport;
           end;
        end;
     3: begin
           Title:='Ведомость движения товаров по товарам'+chr(13)+chr(10)+'Фирма '+FRM.Text+chr(13)+chr(10)
           +'Период с '+dt1.text+' по '+dt2.Text+chr(13)+chr(10)+'Группа товаров: '+TW.Text;
           Title2:='Товар';
           Wait_Form.Gauge1.Progress:=10;
           Wait_Form.StatusBar1.panels[0].text:='Запрос данных. Ждите...';
           Wait_Form.Show;
           delay(100);
           ReportTransaction.Active:=False;
           ADD_SQL(QueryRep3,'select * from report_nalog_post_tw(:twtree_id,:dt1,:dt2) order by tw_nam,post_full');
           QueryRep3.close;
           QueryRep3.ParamByname('twtree_id').asinteger:=tw.tag;
           QueryRep3.ParamByname('frm_id').asinteger:=strtoint(FRM.Value);
           QueryRep3.ParamByname('dt1').asdatetime:=dt1.date;
           QueryRep3.ParamByname('dt2').asdatetime:=dt2.date+1-sekond1;
           QueryRep3.open;
           Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
           Wait_Form.Gauge1.Progress:=100;
           Wait_Form.Show;
           delay(500);

           Wait_Form.Hide;
           if QueryRep3.eof then messbox('Отчет пуст!',MessSystem,48) else begin
              if Export.checked then ExpExcel(queryRep3, '');
              Rep3.title:=REPORT_TITLE;
              Rep3.ShowReport;
           end;
        end;
     4: begin
           Title:='Ведомость движения товаров по товарам'+chr(13)+chr(10)+'Фирма '+FRM.Text+chr(13)+chr(10)
           +'Период с '+dt1.text+' по '+dt2.Text+chr(13)+chr(10)+'Группа товаров: '+TW.Text;
           Title2:='Товар';

           Wait_Form.Gauge1.Progress:=10;
           Wait_Form.StatusBar1.panels[0].text:='Запрос данных. Ждите...';
           Wait_Form.Show;
           delay(100);
           ReportTransaction.Active:=False;
           ADD_SQL(QueryRep3,'select * from report_nalog_post_tw(:twtree_id,:dt1,:dt2) order by post_full,tw_nam');
           QueryRep3.close;
           QueryRep3.ParamByname('twtree_id').asinteger:=tw.tag;
           QueryRep3.ParamByname('frm_id').asinteger:=strtoint(FRM.Value);
           QueryRep3.ParamByname('dt1').asdatetime:=dt1.date;
           QueryRep3.ParamByname('dt2').asdatetime:=dt2.date+1-sekond1;
           QueryRep3.open;
           Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
           Wait_Form.Gauge1.Progress:=100;
           Wait_Form.Show;
           delay(500);

           Wait_Form.Hide;
           if QueryRep3.eof then messbox('Отчет пуст!',MessSystem,48) else begin
              if Export.checked then ExpExcel(queryRep3, '');
              Rep4.title:=REPORT_TITLE;
              Rep4.ShowReport;
           end;
        end;
   end;
end;

procedure TREPORT_NALOG_ALL.Rep1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_NALOG_ALL.Rep2GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_NALOG_ALL.Rep3GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_NALOG_ALL.Rep4GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

end.
