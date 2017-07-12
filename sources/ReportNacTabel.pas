unit ReportNacTabel;

interface

uses
  Windows,  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, RxMemDS, Buttons, DualList, Grids, DBGrids,
  VclUtils, FR_DSet, FR_DBSet, FR_Class, Parent_Excel_Report, excel2000, OleServer, ComObj,
  RxLookup;

type
  TREPORT_NAC_TABEL = class(TForm)
    ReportTransaction: TIBTransaction;
    QueryRep1: TIBQuery;
    BtnOK: TButton;
    MemReport: TRxMemoryData;
    MemReportTABEL_TW_GROUP: TStringField;
    MemReportnac: TFloatField;
    DsReport: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    TW: TEdit;
    BtnDic: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    DualListDialog2: TDualListDialog;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    DBGrid1: TDBGrid;
    BtnPrint: TButton;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    MemReportoborot: TFloatField;
    btnExcel: TButton;
    BtnDynDic: TSpeedButton;
    Label8: TLabel;
    FRM: TRxDBLookupCombo;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Label6: TLabel;
    ComboBox2: TComboBox;
    Label7: TLabel;
    MemReportproc: TFloatField;
    RadioButton3: TRadioButton;
    chkNotUseRozn: TCheckBox;
    Button1: TButton;
    QueryRep2: TIBQuery;
    QueryRep2TW_ART: TIntegerField;
    QueryRep2TW_NAM: TIBStringField;
    QueryRep2RNS_TABEL: TIntegerField;
    QueryRep2RN_DATE: TDateTimeField;
    QueryRep2SHOP_NAME: TIBStringField;
    QueryRep2FRM_PREFIX: TIBStringField;
    QueryRep2POST_NAME: TIBStringField;
    QueryRep2MONEY_ZAK: TFloatField;
    QueryRep2MONEY_SPEC: TFloatField;
    QueryRep2MONEY_FACT_NALOG: TFloatField;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
    procedure ExpExcel;
    procedure ExpExcel1;
    procedure BtnDynDicClick(Sender: TObject);
    procedure ExpCalc;
    procedure ExpCalc1;    
    procedure btnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    tw_group_id: integer;
    tW_group_typ:integer;
  public
    { Public declarations }
  end;

var
  REPORT_NAC_TABEL: TREPORT_NAC_TABEL;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  REPORT_TITLE:string;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
implementation

uses DicTowar, WaitForm, DicTwDynGroup;

{$R *.DFM}

procedure TREPORT_NAC_TABEL.BtnOKClick(Sender: TObject);
var
  PTYP,rntypS,pntypS: string;

  low_money_field, hi_money_field: string;
  tabel_tw_group_field: string;


begin

    if RadioButton1.Checked then
      REPORT_TITLE := 'Итоговый отчет о наценке по табелям за период с ' + dt1.Text +' по ' + dt2.Text+chr(13);
    if RadioButton3.Checked then
      REPORT_TITLE := 'Итоговый отчет о наценке по магазинам за период с ' + dt1.Text +' по ' + dt2.Text+chr(13);
    if RadioButton2.Checked then
      REPORT_TITLE := 'Итоговый отчет о наценке по группам за период с ' + dt1.Text +' по ' + dt2.Text+chr(13);
    REPORT_TITLE := REPORT_TITLE + 'Фирма: '+ frm.Text+  ', группа товаров: '+ TW.Text+chr(13);
    REPORT_TITLE := REPORT_TITLE + 'Расходные накладные: ' + Edit2.Text+chr(13);
    REPORT_TITLE:=REPORT_TITLE+'Диапазон измерения наценки: от '+Combobox1.Text + ' до ' +ComboBox2.Text+chr(13);
    if chkNotUseRozn.Checked then
      REPORT_TITLE:=REPORT_TITLE+'Закупки с розницы не учитываются';




{             Оптовой цены
Крупнооптовой цены
Спеццены
Цены перепродажи
Закупки (примерно)
}
   case combobox1.ItemIndex of
   0: low_money_field:='money_opt';
   1: low_money_field:='money_kropt';
   2: low_money_field:='money_spec';
   3: low_money_field:='money_pp';
   4: low_money_field:='money_zak';
   end;
{
Фактической цены продажи
Оптовой цены
Крупный опт
Спеццены
Цены перепродажи
if ((low_money_field='money_zak') or (low_money_field='money_pp')) then
            hi_money_field:='money_fact_nalog'
      else
        hi_money_field:='money_fact_prod';
        }
   case combobox2.ItemIndex of
   0: hi_money_field:='money_fact_nalog';
   1: hi_money_field:='money_opt';
   2: hi_money_field:='money_kropt';
   3: hi_money_field:='money_spec';
   4: hi_money_field:='money_pp';
   end;


   if Radiobutton1.Checked then
    tabel_tw_group_field:='rns_tabel';
   if Radiobutton3.Checked then
    tabel_tw_group_field:='shop_name';
   if Radiobutton2.Checked then
    tabel_tw_group_field:='twtree_top';








   Wait_Form.Gauge1.Progress:=10;
   Wait_Form.StatusBar1.panels[0].text:='Запрос данных...';
   Wait_Form.Show;
   delay(100);
   BtnOk.enabled:=false;
   BtnPrint.enabled:=false;
   ReportTransaction.Active:=False;
   rntypS:=RNTYP_S;
   pntypS:=PNTYP_S;
   ADD_SQL(QueryRep1, 'select '+tabel_tw_group_field+' tabel_tw_group, sum( money_fact_prod * tw_kol) oborot, sum(('+hi_money_field+' - '+ low_money_field + ') * tw_kol) nac, '+
   ' 100*(sum(('+hi_money_field+' - '+ low_money_field + ') * tw_kol) )/sum( money_fact_prod * tw_kol) proc'+
   ' from REPORT_NAC_TABEL(:dt1, :dt2, :frm_id, :start_twtree_id, :start_twtree_typ, :rntyps, :not_use_rozn) '+
   ' group by 1 ');

//   ADD_SQL(QueryRep1, 'select men, typ, sum(seb*tw_kol) seb,  sum(seb$) seb$, sum(nac) nac, sum(nac$) nac$, valuta_id '+
//    'from report_pers_prib(-1, :dt1, :dt2, :start_twtree_id, :RNTYPS, :PNTYPS, :USE_STORNO_RN, :USE_PSORT, :SHOW_SPIS, :SHOW_PSORT, :start_twtree_typ, :IN_FRM_ID) '+
//    'group by men, typ, valuta_id ');


{   ADD_SQL(QueryRep1,'select pp_men,re.typ,sum(seb*calc_kol) as seb,sum(seb$*calc_kol) as seb$, '+
    'sum(nac*calc_kol) as nac,sum(nac$*calc_kol) as nac$,tw.valuta_id '+
    'from re,tw,list_twtree(:twtree_id,0) '+
    'where tw.twtree_id=list_twtree.twtree_id '+
    'and re.dt between :dt1 and :dt2 '+
    'and (re.rntyp_id in ('+RNTYPS+SSpis+')) '+
    'and (re.pp_pntyp_id in (0,'+PntypS+')) '+
    'and (re.pp_typ in (11'+PTYP+')) '+
    'and (re.typ in (1,2)) and re.tw_id=tw.tw_id '+
    'group by pp_men,typ,valuta_id order by pp_men');
}
{
select pp_men,typ,sum(seb*calc_kol) as seb,sum(seb$*calc_kol) as seb$,
    sum(nac*calc_kol) as nac,sum(nac$*calc_kol) as nac$,
    sum(dop_nac*calc_kol) as dop_nac,sum(dop_nac$*calc_kol) as dop_nac$,
    valuta_id
    FROM REPORt_ITOG_NAC(0, :DT1, :DT2)
    group by pp_men,typ,valuta_id order by pp_men
}
{    ADD_SQL(QueryRep1, 'select pp_men,typ, sum(seb*bg_abs(calc_kol)) as seb, sum(seb$*bg_abs(calc_kol)) as seb$, sum(nac*calc_kol) as nac, sum(nac$*calc_kol) as nac$, valuta_id '+
  ' FROM REPORt_ITOG_NAC(:twtree_id, :DT1, :DT2, :RNTYPS, :PNTYPS, :PTYPS)  group by pp_men,typ,valuta_id order by pp_men');
}

   QueryRep1.ParamByname('start_twtree_id').asinteger:=tw_group_id;
   QueryRep1.ParamByname('start_twtree_TYP').asinteger:=tw_group_typ;
   QueryRep1.ParamByname('dt1').asdatetime:=dt1.date;
   QueryRep1.ParamByname('dt2').asdatetime:=dt2.date+1-sekond1;
   QueryRep1.ParamByname('RNTYPS').asstring:=rntyps;

   QueryRep1.ParamByname('FRM_ID').asstring:=FRM.Value;
   if chkNotUseRozn.Checked then
      QueryRep1.ParamByname('not_use_rozn').asInteger:=1
   else
      QueryRep1.ParamByname('not_use_rozn').asInteger:=0;



   QueryRep1.Open;
   MemReport.EmptyTable;
   Wait_Form.Gauge1.Progress:=90;
   Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
   Wait_Form.Show;
   delay(100);

   memreport.LoadFromDataSet(QueryRep1, 0, lmAppend);
   {

   while not QueryRep1.eof do begin
     MemReport.Append;
     MemReport.fieldByname('men_full').asstring:=QueryRep1.fieldByname('men').asstring;
     MemReport.fieldByname('typ').asinteger:=QueryRep1.fieldByname('typ').asinteger;
     case QueryRep1.fieldByname('typ').asinteger of
       1: MemReport.fieldByname('typ_full').asstring:='Расходные накладные';
       2: MemReport.fieldByname('typ_full').asstring:='Акты списания';
       3: MemReport.fieldByname('typ_full').asstring:='Пересортицы';
     end;
     MemReport.FieldByname('nac').asfloat:=QueryRep1.fieldByname('nac').asfloat;
     MemReport.FieldByname('nac$').asfloat:=QueryRep1.fieldByname('nac$').asfloat;
     MemReport.FieldByname('seb').asfloat:=QueryRep1.fieldByname('seb').asfloat;
     MemReport.FieldByname('seb$').asfloat:=QueryRep1.fieldByname('seb$').asfloat;
     MemReport.fieldByname('valuta_id').asinteger:=QueryRep1.fieldByname('valuta_id').asinteger;
     case QueryRep1.fieldByname('valuta_id').asinteger of
       0: MemReport.fieldByname('valuta_full').asstring:='Рубли';
       1: MemReport.fieldByname('valuta_full').asstring:='Доллары США';
     end;
     MemReport.Post;
     QueryRep1.next;
   end;
   MemReport.first;
   }
   BtnOk.enabled:=true;
   if MemReport.recordcount>0 then BtnPrint.enabled:=true;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='Ок!';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
   btnExcel.Enabled:=true;
end;

procedure TREPORT_NAC_TABEL.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
begin
   dt1.date:=date();
   dt2.date:=date();
   tw_group_id:=0;
   tw_group_typ:=3;  //просто все товары

   TW.text:='Все товары';
   RNTYP_S:='';
   PNTYP_S:='';
     // Заполняем перечень расходных
     s4:='';
     s3:=' '+RNTYP_S+' ';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     DualListDialog2.List1.Clear;
     DualListDialog2.List2.Clear;
     while not QueryWork.eof do begin
           DualListDialog2.List2.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
           s4:=s4+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
           s3:=s3+'%'+QueryWork.fieldByname('RNTYP_ID').asstring;
           QueryWork.next;
     end;
//     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit2.text:=s4;
     s3:=trim(s3);
//     if b_utils.left(s3,1)=',' then s3:=b_utils.right(s3,length(s3)-1);
     s3:=s3+'%';
     RNTYP_S:=s3;



      MemFrm.EmptyTable;
      MemFrm.Append;
      MemFrm.fieldByname('FRM_ID').asinteger:=-1;
      MemFrm.fieldByname('FRM_NAME').asstring:='<Все фирмы>';
      MemFrm.Post;

      MemFrm.Append;
      MemFrm.fieldByname('FRM_ID').asinteger:=0;
      MemFrm.fieldByname('FRM_NAME').asstring:='<Розница>';
      MemFrm.Post;
      
      ADD_SQL(QueryWork,'select frm_id,bg_left(frm_full,127) as frm_name from pn_dic_frm(-1) order by 2');
      QueryWork.open;
      while not QueryWork.eof do begin
        MemFrm.Append;
        MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
        MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
        MemFrm.Post;
        QueryWork.next;
      end;


     FRM.Value:=inttostr(GL_FRM_WORK_MODE);


end;

procedure TREPORT_NAC_TABEL.BtnDicClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     if tw_group_typ=3 then
       DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       tw_group_id:=DIC_TOWAR.tag;
       tw_group_typ:=3;
       WorkTransaction.Active:=False;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
     end;
end;

procedure TREPORT_NAC_TABEL.SpeedButton2Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=false;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     s:='';
     s2:='';
     if DualListDialog2.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog2.list2.Count do begin
            if QueryWork.Locate('RNTYP_SHORT',DualListDialog2.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+QueryWork.fieldByname('RNTYP_ID').asstring;
                 s2:=s2+' '+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
            end;
        end;
//        if b_utils.left(s,1)=',' then s:=b_utils.right(s,length(s)-1);
        s := s+'%';
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        RNTYP_S:=s;
        Edit2.text:=s2;
     end;
end;

procedure TREPORT_NAC_TABEL.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_NAC_TABEL.BtnPrintClick(Sender: TObject);
begin
     FrReport1.ShowReport;
end;

procedure TREPORT_NAC_TABEL.ExpExcel;
var excel: TExcelApplication;
    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
begin


    memreport.First;


    try

    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;


    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет по наценке по табелям-группам.xlt', 0);
    v := VarArrayCreate([0, memreport.RecordCount, 0, memreport.FieldCount], varVariant);
    memreport.First;
    for iRow:=0 to memreport.RecordCount-1 do
    begin
        for iCol:=0 to dbgrid1.FieldCount - 1 do
        begin
        v[iRow, icol] := dbgrid1.Fields[iCol].AsVariant;
        end;
        memreport.Next;
    end;
    memreport.First;

    r:= excel.Range['A1', 'A1'];
    if RadioButton1.Checked then
      r.Value := 'Итоговый отчет о наценке по табелям за период с ' + dt1.Text +' по ' + dt2.Text;
    if RadioButton3.Checked then
      r.Value := 'Итоговый отчет о наценке по магазинам за период с ' + dt1.Text +' по ' + dt2.Text;
    if RadioButton2.Checked then
      r.Value := 'Итоговый отчет о наценке по группам за период с ' + dt1.Text +' по ' + dt2.Text;

      
    r:= excel.Range['A2', 'A2'];
    r.Value := 'Фирма: '+ frm.Text+  ', группа товаров: '+ TW.Text;
    r:= excel.Range['A3', 'A3'];
    r.Value := 'Расходные накладные: ' + Edit2.Text;
    r:= excel.Range['A4', 'A4'];
    r.Value:='Диапазон измерения наценки: от '+Combobox1.Text + ' до ' +ComboBox2.Text;



    r := excel.Range[excel.Cells.Item[6, 1],
      excel.Cells.Item[memreport.RecordCount +6 - 1,dbgrid1.fieldcount ]];
//    addres := chr(65 + dbgrid1.FieldCount -1);
//    addres := addres +inttostr(memreport.RecordCount);
//    r:= excel.Range['A1', addres];
    r.Value := v;

//   r := excel.Range[excel.Cells.Item[emptyParam, 1],
//    excel.Cells.Item[emptyParam, 7]].EntireColumn;
//    r.AutoFit;




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



    r := excel.Range[excel.Cells.Item[emptyParam, 4],
    excel.Cells.Item[emptyParam, 4]].EntireColumn;
    format := MemReportnac.DisplayFormat;
    format := stringreplace(format, ' ', '', [rfReplaceAll]);
    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
    r.NumberFormat := format;







    except
    freeandnil(excel);
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);
end;

procedure TREPORT_NAC_TABEL.BtnDynDicClick(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;
     if tw_group_typ<3 then
      DIC_TW_DYN_GROUP.btnSelect.tag := tw_group_id;

     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      tw.Text:='* '+ DIC_TW_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      tw_group_id:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      tw_group_typ:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

procedure TREPORT_NAC_TABEL.ExpCalc;
var ServiceManager: Olevariant;
    Desktop: Olevariant;
    Document,Sheets, ooParams, ooValue, ooReflection, sheet, cell: OleVariant;
    FilePath: String;
    bounds: array[0..1] of integer;
    dataArrayBounds: array [0..1,0..1] of integer;
//    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    add_col: integer;
    add_row: integer;
    old_tw_tree_id: integer;

    tmpstring: string;
    format: string;
    cel: variant;
    i,j: integer;
begin
// Открытие CALC

   try
     ServiceManager := CreateOleObject('com.sun.star.ServiceManager');
   except
     exit;
   end;

   FilePath := 'private:factory/scalc';
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет по наценке по табелям-группам.xlt');
     if (VarType(ServiceManager) = varDispatch) then
       Desktop := ServiceManager.CreateInstance('com.sun.star.frame.Desktop');

  Bounds[0] := 0;
  Bounds[1] := 0;

  ooParams := VarArrayCreate([0, 0], varVariant);
  ooReflection := ServiceManager.createInstance('com.sun.star.reflection.CoreReflection');
  ooReflection.forName('com.sun.star.beans.PropertyValue').createObject(ooValue);
  ooValue.Name := 'AsTemplate';
  ooValue.Value := True;
  ooParams[0] := ooValue;


//Загрузка шаблона, пока работает криво
  Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);

////////////////////////////////////////////


   try

    dataArrayBounds[0,0]:=0;
    dataArrayBounds[1,0]:=dbgrid1.FieldCount;
    dataArrayBounds[0,1]:=0;
    dataArrayBounds[1,1]:=memreport.RecordCount+100;




    v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);


    for i := 0 to dataArrayBounds[1,0] do
      for j := 0 to  dataArrayBounds[1,1] do
         v[i,j]:='';

    memreport.First;
    for iRow:=0 to memreport.RecordCount-1 do
    begin
      for iCol:=0 to dbgrid1.FieldCount - 1 do
        v[iCol, iRow] := dbgrid1.Fields[iCol].AsVariant;
      memreport.Next;
    end;
    memreport.First;

    Sheets := Document.GetSheets;
    Sheet := Sheets.GetByName('Лист1');
    cel := Sheet.GetCellByPosition(0,0);
    if RadioButton1.Checked then
      cel.setString('Итоговый отчет о наценке по табелям за период с ' + dt1.Text +' по ' + dt2.Text);
    if RadioButton3.Checked then
      cel.setString('Итоговый отчет о наценке по магазинам за период с ' + dt1.Text +' по ' + dt2.Text);
    if RadioButton2.Checked then
      cel.setString('Итоговый отчет о наценке по группам за период с ' + dt1.Text +' по ' + dt2.Text);
    cel := Sheet.GetCellByPosition(0,1);
    cel.setString('Фирма: '+ frm.Text+  ', группа товаров: '+ TW.Text);
    cel := Sheet.GetCellByPosition(0,2);
    cel.setString('Расходные накладные: ' + Edit2.Text);
    cel := Sheet.GetCellByPosition(0,3);
    cel.setString('Диапазон измерения наценки: от '+Combobox1.Text + ' до ' +ComboBox2.Text);

//    cel.setString(tmpstring);

    Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+5,dataArrayBounds[1,0], dataArrayBounds[1,1]+5);
    Cell.SetDataArray(v);


    //**********
   except
     on e: Exception
     do begin
       messbox(e.message, 'Error', 0);
     end;
   end;
end;

procedure TREPORT_NAC_TABEL.btnExcelClick(Sender: TObject);
//var excel: TExcelApplication;
begin
  try
//    Excel := TExcelApplication.Create(nil);
//    Excel.ConnectKind := ckNewInstance;
//    Excel.Connect;
    ExpExcel;
  except
    ExpCalc;
  end;
end;


procedure TREPORT_NAC_TABEL.ExpExcel1;
var excel: TExcelApplication;
    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
begin


//    memreport.First;


    try

    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;

       QueryRep2.ParamByname('start_twtree_id').asinteger:=tw_group_id;
   QueryRep2.ParamByname('start_twtree_TYP').asinteger:=tw_group_typ;
   QueryRep2.ParamByname('dt1').asdatetime:=dt1.date;
   QueryRep2.ParamByname('dt2').asdatetime:=dt2.date+1-sekond1;
   QueryRep2.ParamByname('RNTYPS').asstring:=RNTYP_S;

   QueryRep2.ParamByname('FRM_ID').asstring:=FRM.Value;
   if chkNotUseRozn.Checked then
      QueryRep2.ParamByname('not_use_rozn').asInteger:=1
   else
      QueryRep2.ParamByname('not_use_rozn').asInteger:=0;


    QueryRep2.Open;
    QueryRep2.Last;
    QueryRep2.First;


    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\подробный отчет о наценке по табелям.xlt', 0);
    v := VarArrayCreate([0, QueryRep2.RecordCount, 0, 10], varVariant);
    iRow:=0;

    while not QueryRep2.Eof do

    //for iRow:=0 to QueryRep2.RecordCount-1 do
    begin
          v[iRow, 0] := QueryRep2.fieldbyname('TW_ART').asVariant;
          v[iRow, 1] := QueryRep2.fieldbyname('TW_NAM').asVariant;
          v[iRow, 2] := QueryRep2.fieldbyname('RNS_TABEL').asVariant;
          v[iRow, 3] := QueryRep2.fieldbyname('SHOP_NAME').asVariant;
          v[iRow, 4] := '';//QueryReport.fieldbyname('RNTYP_NAME').asVariant;
          v[iRow, 5] := QueryRep2.fieldbyname('RN_DATE').asVariant;
          v[iRow, 6] := QueryRep2.fieldbyname('FRM_PREFIX').asVariant;
          v[iRow, 7] := '';//QueryRep2.fieldbyname('FRM_PREFIX').asVariant;
          v[iRow, 8] := QueryRep2.fieldbyname('MONEY_ZAK').asVariant;
          v[iRow, 9] := QueryRep2.fieldbyname('MONEY_SPEC').asVariant;
          v[iRow, 10] := QueryRep2.fieldbyname('MONEY_FACT_NALOG').asVariant;
//          v[iRow, 10] := QueryReport.fieldbyname('RENT1').asVariant;

{        for iCol:=0 to QueryRep2.FieldCount - 1 do
        begin
        v[iRow, icol] := QueryRep2.Fields[iCol].AsVariant;
        end;
}
        iRow:=iRow+1;
        QueryRep2.Next;
    end;
    //memreport.First;

    r:= excel.Range['A1', 'A1'];
    if RadioButton1.Checked then
      r.Value := 'Подробный отчет о наценке по табелям за период с ' + dt1.Text +' по ' + dt2.Text;
    if RadioButton3.Checked then
      r.Value := 'Подробный отчет о наценке по магазинам за период с ' + dt1.Text +' по ' + dt2.Text;
    if RadioButton2.Checked then
      r.Value := 'Подробный отчет о наценке по группам за период с ' + dt1.Text +' по ' + dt2.Text;

      
    r:= excel.Range['A2', 'A2'];
    r.Value := 'Фирма: '+ frm.Text+  ', группа товаров: '+ TW.Text;
    r:= excel.Range['A3', 'A3'];
    r.Value := 'Расходные накладные: ' + Edit2.Text;
    r:= excel.Range['A4', 'A4'];
    r.Value:='Диапазон измерения наценки: от '+Combobox1.Text + ' до ' +ComboBox2.Text;



    r := excel.Range[excel.Cells.Item[6, 1],
      excel.Cells.Item[QueryRep2.RecordCount +6 - 1,11 ]];
//    addres := chr(65 + dbgrid1.FieldCount -1);
//    addres := addres +inttostr(memreport.RecordCount);
//    r:= excel.Range['A1', addres];
    r.Value := v;

//   r := excel.Range[excel.Cells.Item[emptyParam, 1],
//    excel.Cells.Item[emptyParam, 7]].EntireColumn;
//    r.AutoFit;




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



    r := excel.Range[excel.Cells.Item[emptyParam, 9],
    excel.Cells.Item[emptyParam, 11]].EntireColumn;
    format := MemReportnac.DisplayFormat;
    format := stringreplace(format, ' ', '', [rfReplaceAll]);
    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
    r.NumberFormat := format;







    except
    freeandnil(excel);
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);
end;


procedure TREPORT_NAC_TABEL.ExpCalc1;
var ServiceManager: Olevariant;
    Desktop: Olevariant;
    Document,Sheets, ooParams, ooValue, ooReflection, sheet, cell: OleVariant;
    FilePath: String;
    bounds: array[0..1] of integer;
    dataArrayBounds: array [0..1,0..1] of integer;
//    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    add_col: integer;
    add_row: integer;
    old_tw_tree_id: integer;

    tmpstring: string;
    format: string;
    cel: variant;
    i,j: integer;
begin
// Открытие CALC

   try
     ServiceManager := CreateOleObject('com.sun.star.ServiceManager');
   except
     exit;
   end;

   FilePath := 'private:factory/scalc';
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет по наценке по табелям-группам.xlt');
     if (VarType(ServiceManager) = varDispatch) then
       Desktop := ServiceManager.CreateInstance('com.sun.star.frame.Desktop');

  Bounds[0] := 0;
  Bounds[1] := 0;

  ooParams := VarArrayCreate([0, 0], varVariant);
  ooReflection := ServiceManager.createInstance('com.sun.star.reflection.CoreReflection');
  ooReflection.forName('com.sun.star.beans.PropertyValue').createObject(ooValue);
  ooValue.Name := 'AsTemplate';
  ooValue.Value := True;
  ooParams[0] := ooValue;


//Загрузка шаблона, пока работает криво
  Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);

////////////////////////////////////////////


   try

    dataArrayBounds[0,0]:=0;
    dataArrayBounds[1,0]:=dbgrid1.FieldCount;
    dataArrayBounds[0,1]:=0;
    dataArrayBounds[1,1]:=memreport.RecordCount+100;




    v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);


    for i := 0 to dataArrayBounds[1,0] do
      for j := 0 to  dataArrayBounds[1,1] do
         v[i,j]:='';

    memreport.First;
    for iRow:=0 to memreport.RecordCount-1 do
    begin
      for iCol:=0 to dbgrid1.FieldCount - 1 do
        v[iCol, iRow] := dbgrid1.Fields[iCol].AsVariant;
      memreport.Next;
    end;
    memreport.First;

    Sheets := Document.GetSheets;
    Sheet := Sheets.GetByName('Лист1');
    cel := Sheet.GetCellByPosition(0,0);
    if RadioButton1.Checked then
      cel.setString('Итоговый отчет о наценке по табелям за период с ' + dt1.Text +' по ' + dt2.Text);
    if RadioButton3.Checked then
      cel.setString('Итоговый отчет о наценке по магазинам за период с ' + dt1.Text +' по ' + dt2.Text);
    if RadioButton2.Checked then
      cel.setString('Итоговый отчет о наценке по группам за период с ' + dt1.Text +' по ' + dt2.Text);
    cel := Sheet.GetCellByPosition(0,1);
    cel.setString('Фирма: '+ frm.Text+  ', группа товаров: '+ TW.Text);
    cel := Sheet.GetCellByPosition(0,2);
    cel.setString('Расходные накладные: ' + Edit2.Text);
    cel := Sheet.GetCellByPosition(0,3);
    cel.setString('Диапазон измерения наценки: от '+Combobox1.Text + ' до ' +ComboBox2.Text);

//    cel.setString(tmpstring);

    Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+5,dataArrayBounds[1,0], dataArrayBounds[1,1]+5);
    Cell.SetDataArray(v);


    //**********
   except
     on e: Exception
     do begin
       messbox(e.message, 'Error', 0);
     end;
   end;
end;

procedure TREPORT_NAC_TABEL.FormCreate(Sender: TObject);
begin
  ComboBox1.ItemIndex:=4;
  ComboBox2.ItemIndex:=0;
end;

procedure TREPORT_NAC_TABEL.Button1Click(Sender: TObject);

begin
//  try
//    Excel := TExcelApplication.Create(nil);
//    Excel.ConnectKind := ckNewInstance;
//    Excel.Connect;
    ExpExcel1;
//  except
//    ExpCalc;
//  end;
end;

end.
