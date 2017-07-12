unit ReportNacItogShop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, RxMemDS, Buttons, DualList, Grids, DBGrids,
  VclUtils, FR_DSet, FR_DBSet, FR_Class, excel2000, OleServer, ComObj,
  RxLookup;

type
  TREPORT_NAC_ITOG_SHOP = class(TForm)
    ReportTransaction: TIBTransaction;
    QueryRep1: TIBQuery;
    MemReport: TRxMemoryData;
    MemReporttyp: TIntegerField;
    MemReporttyp_full: TStringField;
    MemReportnac: TFloatField;
    MemReportvaluta_id: TIntegerField;
    MemReportvaluta_full: TStringField;
    DsReport: TDataSource;
    QueryRep2: TIBQuery;
    DualListDialog1: TDualListDialog;
    DualListDialog2: TDualListDialog;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    DBGrid1: TDBGrid;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    MemReportSHOP_ID: TIntegerField;
    MemReportSHOP_FULL: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BtnDic: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BtnOk: TButton;
    DT1: TDateEdit;
    DT2: TDateEdit;
    TW: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    BtnPrint: TButton;
    Check_spis: TCheckBox;
    PSORT: TCheckBox;
    STORNO: TCheckBox;
    btnExcel: TButton;
    BtnDynDic: TSpeedButton;
    MemReportseb: TFloatField;
    Label8: TLabel;
    FRM: TRxDBLookupCombo;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
    procedure ExpExcel;
    procedure BtnDynDicClick(Sender: TObject);
    procedure ExpCalc;
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    tw_group_id: integer;
    tW_group_typ:integer;
  public
    { Public declarations }
  end;

var
  REPORT_NAC_ITOG_SHOP: TREPORT_NAC_ITOG_SHOP;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  REPORT_TITLE:string;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
implementation

uses DicTowar, WaitForm, DicTwDynGroup;

{$R *.DFM}

procedure TREPORT_NAC_ITOG_SHOP.BtnOkClick(Sender: TObject);
var
  PTYP,rntypS,pntypS:string;
begin
   REPORT_TITLE:='Итоговый отчет о наценке по магазинам за период с '+
   date_sokr(dt1.date)+' по '+date_sokr(dt2.date)+' по группе товаров: "'+tw.text+'", '+
   'приходные накладные: '+Edit1.text+', расходные накладные: '+Edit2.text;
   if Check_spis.checked then REPORT_TITLE:=REPORT_TITLE+', акты списания учтены'
   else REPORT_TITLE:=REPORT_TITLE+', без учета актов списания';

   // проверяем установки переключателей поставок по пересортице и сторно расхода
   if (PSORT.checked) and (STORNO.checked) then begin

      REPORT_TITLE:=REPORT_TITLE+', с учетом поставок по пересортице и сторно расхода';
   end;
   if (PSORT.checked) and (not STORNO.checked) then begin

      REPORT_TITLE:=REPORT_TITLE+', с учетом поставок по пересортице';
   end;
   if (not PSORT.checked) and (STORNO.checked) then begin

      REPORT_TITLE:=REPORT_TITLE+', с учетом поставок по сторно расхода';
   end;
   if (not PSORT.checked) and (not STORNO.checked) then begin

      REPORT_TITLE:=REPORT_TITLE+', без учета поставок по пересортице и сторно расхода';
   end;
   Wait_Form.Gauge1.Progress:=10;
   Wait_Form.StatusBar1.panels[0].text:='Запрос данных...';
   Wait_Form.Show;
   delay(100);
   BtnOk.enabled:=false;
   BtnPrint.enabled:=false;
   ReportTransaction.Active:=False;
   rntypS:=RNTYP_S;
   pntypS:=PNTYP_S;
{   ADD_SQL(QueryRep1,'select shop_id,re.typ,sum(nac*calc_kol) as nac,sum(nac$*calc_kol) as nac$,tw.valuta_id '+
    'from re,tw,list_twtree(:twtree_id,0) '+
    'where tw.twtree_id=list_twtree.twtree_id '+
    'and re.dt between :dt1 and :dt2 '+
    'and (re.rntyp_id in ('+RNTYPS+SSpis+')) '+
    'and (re.pp_pntyp_id in (0,'+PntypS+')) '+
    'and (re.pp_typ in (11'+PTYP+')) '+
    'and (re.typ in (1,2)) and re.tw_id=tw.tw_id '+
    'group by shop_id,typ,valuta_id order by shop_id');
}
   //ADD_SQL(QueryRep1,'select shop_id,re1.typ,sum(seb*calc_kol) as seb,sum(seb$*calc_kol) as seb$, '+
//    'sum(nac*calc_kol) as nac,sum(nac$*calc_kol) as nac$,tw.valuta_id '+
//    'from alt_re(:dt1, :dt2 , :RNTYPS, :PNTYPS,:PTYPS) re1,  tw, twtree '+
//    'where tw.twtree_id=twtree.twtree_id '+
//    'and twtree.parents_ids containing "%"||'+inttostr(tw.tag)+'||"%" '+
//    'and (re1.typ in (1,2)) and re1.tw_id=tw.tw_id '+
//    'group by shop_id,typ,valuta_id order by shop_id');
{
   ADD_SQL(QueryRep1, 'select shop_id,typ, sum(seb*bg_abs(calc_kol)) as seb, sum(seb$*bg_abs(calc_kol)) as seb$, sum(nac*calc_kol) as nac, sum(nac$*calc_kol) as nac$, valuta_id '+
    'FROM REPORt_ITOG_NAC(:twtree_id, :DT1, :DT2, :RNTYPS, :PNTYPS, :PTYPS)  group by shop_id,typ,valuta_id order by shop_id');
}

    ADD_SQL(QueryRep1, 'select shop, typ, sum(seb*tw_kol) seb,   sum(nac) nac '+
    'from report_pers_prib(-1, :dt1, :dt2, :start_twtree_id, :RNTYPS, :PNTYPS, :USE_STORNO_RN, :USE_PSORT, :SHOW_SPIS, :SHOW_PSORT,:start_twtree_typ, :IN_FRM_ID) '+
    'group by shop, typ ');

   QueryRep1.ParamByname('start_twtree_id').asinteger:=tw_group_id;
   QueryRep1.ParamByname('start_twtree_typ').asinteger:=tw_group_typ;
   QueryRep1.ParamByname('dt1').asdatetime:=dt1.date;
   QueryRep1.ParamByname('dt2').asdatetime:=dt2.date+1-sekond1;
   QueryRep1.ParamByname('RNTYPS').asstring:=rntyps;
   QueryRep1.ParamByname('PNTYPS').asstring:=Pntyps;
   QueryRep1.ParamByname('IN_FRM_ID').asstring:=FRM.Value;

   if PSORT.Checked then QueryRep1.ParamByname('USE_PSORT').asinteger:=1
      else QueryRep1.ParamByname('USE_PSORT').asinteger:=0;
   if STORNO.Checked then QueryRep1.ParamByname('USE_STORNO_RN').asinteger:=1
      else QueryRep1.ParamByname('USE_STORNO_RN').asinteger:=0;
   if Check_spis.Checked then QueryRep1.ParamByname('SHOW_SPIS').asinteger:=1
      else QueryRep1.ParamByname('SHOW_SPIS').asinteger:=0;


   QueryRep1.Open;
   MemReport.EmptyTable;
   Wait_Form.Gauge1.Progress:=90;
   Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
   Wait_Form.Show;
   delay(100);
   while not QueryRep1.eof do begin
     MemReport.Append;
     MemReport.fieldByname('shop_full').asstring:=QueryRep1.fieldByname('shop').asstring;
     MemReport.fieldByname('typ').asinteger:=QueryRep1.fieldByname('typ').asinteger;
     case QueryRep1.fieldByname('typ').asinteger of
       1: MemReport.fieldByname('typ_full').asstring:='Расходные накладные';
       2: MemReport.fieldByname('typ_full').asstring:='Акты списания';
       3: MemReport.fieldByname('typ_full').asstring:='Пересортицы';
     end;
     MemReport.FieldByname('nac').asfloat:=QueryRep1.fieldByname('nac').asfloat;


     MemReport.FieldByname('seb').asfloat:=QueryRep1.fieldByname('seb').asfloat;


     MemReport.Post;
     QueryRep1.next;
   end;
   MemReport.first;
   BtnOk.enabled:=true;
   if MemReport.recordcount>0 then BtnPrint.enabled:=true;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='Ок!';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
end;

procedure TREPORT_NAC_ITOG_SHOP.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
begin
   dt1.date:=date();
   dt2.date:=date();
   TW.tag:=0;
   tw_group_id:=0;
   tW_group_typ:=3;
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
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit2.text:=s4;
     s3:=trim(s3);
     s3 := s3+'%';
//     if b_utils.left(s3,1)=',' then s3:=b_utils.right(s3,length(s3)-1);
     RNTYP_S:=s3;

     // Заполняем перечень приходных
     s4:='';
     s3:='%0';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     OPEN_SQL(QueryWork,'select PNTYP_SHORT,PNTYP_ID from PNTYP order by PNTYP_ID');
     DualListDialog1.List1.Clear;
     DualListDialog1.List2.Clear;
     while not QueryWork.eof do begin
           DualListDialog1.List2.Add(QueryWork.fieldByname('PNTYP_SHORT').asstring);
           s4:=s4+QueryWork.fieldByname('PNTYP_SHORT').asstring+',';
           s3:=s3+'%'+QueryWork.fieldByname('PNTYP_ID').asstring;
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit1.text:=s4;
     s3:=trim(s3);
     s3 := s3+'%';
//     if b_utils.left(s3,1)=',' then s3:=b_utils.right(s3,length(s3)-1);
     PNTYP_S:=s3;


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

procedure TREPORT_NAC_ITOG_SHOP.BtnDicClick(Sender: TObject);
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

procedure TREPORT_NAC_ITOG_SHOP.SpeedButton1Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=false;
     OPEN_SQL(QueryWork,'select PNTYP_SHORT,PNTYP_ID from PNTYP order by PNTYP_ID');
     s:='%0';
     s2:='';
     if DualListDialog1.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog1.list2.Count do begin
            if QueryWork.Locate('PNTYP_SHORT',DualListDialog1.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+QueryWork.fieldByname('PNTYP_ID').asstring;
                 s2:=s2+' '+QueryWork.fieldByname('PNTYP_SHORT').asstring+',';
            end;
        end;
        s := s+'%';
        // if length(s)>0 then s:=B_utils.left(s,length(s)-1);
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
//        if b_utils.left(s,1)=',' then s:=b_utils.right(s,length(s)-1);
        PNTYP_S:=s;
        Edit1.text:=s2;
     end;
end;

procedure TREPORT_NAC_ITOG_SHOP.SpeedButton2Click(Sender: TObject);
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
        s := s+'%';
//        if b_utils.left(s,1)=',' then s:=b_utils.right(s,length(s)-1);
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        RNTYP_S:=s;
        Edit2.text:=s2;
     end;
end;

procedure TREPORT_NAC_ITOG_SHOP.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_NAC_ITOG_SHOP.BtnPrintClick(Sender: TObject);
begin
     FrReport1.ShowReport;
end;

procedure TREPORT_NAC_ITOG_SHOP.ExpExcel;
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
//    excel.Visible[0]:=true;

    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет по наценке по магазинам.xlt', 0);
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
    r.Value := 'Итоговый отчет о наценке по магазинам за период с ' + dt1.Text +' по ' + dt2.Text;
    r:= excel.Range['A2', 'A2'];
    r.Value := 'Группа товаров: '+ TW.Text;
    r:= excel.Range['A3', 'A3'];
    r.Value := 'Приходные накладные: ' + Edit1.Text;
    r:= excel.Range['A4', 'A4'];
    r.Value := 'Расходные накладные: ' + Edit2.Text;
    r:= excel.Range['A5', 'A5'];
    r.Value:='';

    if psort.Checked then
        tmpstring:=  'Поставка по пересортице; ';
    if storno.Checked then
        tmpstring := tmpstring + 'Поставка по сторно расхода; ';
    if psort.Checked then
        tmpstring := tmpstring + 'Учитывая акты списания; ';
    r.value :=tmpstring;


    r := excel.Range[excel.Cells.Item[7, 1],
      excel.Cells.Item[memreport.RecordCount +7 - 1,dbgrid1.fieldcount ]];
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

    r.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    r.Borders[xlInsideHorizontal].Weight := xlThin;
    r.Borders[xlInsideHorizontal].ColorIndex := xlAutomatic;



    r := excel.Range[excel.Cells.Item[emptyParam, 4],
    excel.Cells.Item[emptyParam, 4]].EntireColumn;
    format := MemReportnac.DisplayFormat;
    format := stringreplace(format, ' ', '', [rfReplaceAll]);
    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
    r.NumberFormat := format;

    r := excel.Range[excel.Cells.Item[emptyParam, 5],
    excel.Cells.Item[emptyParam, 5]].EntireColumn;
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

procedure TREPORT_NAC_ITOG_SHOP.BtnDynDicClick(Sender: TObject);
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

procedure TREPORT_NAC_ITOG_SHOP.ExpCalc;
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
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет по наценке по менеджерам.xlt');
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
    cel.setString('Итоговый отчет о наценке по менеджерам за период с ' + dt1.Text +' по ' + dt2.Text);
    cel := Sheet.GetCellByPosition(0,1);
    cel.setString('Группа товаров: '+ TW.Text);
    cel := Sheet.GetCellByPosition(0,2);
    cel.setString('Приходные накладные: ' + Edit1.Text);
    cel := Sheet.GetCellByPosition(0,3);
    cel.setString('Расходные накладные: ' + Edit2.Text);
    cel := Sheet.GetCellByPosition(0,4);
    cel.setString('');

    tmpstring:='';
    if psort.Checked then
        tmpstring:=  'Поставка по пересортице; ';
    if storno.Checked then
        tmpstring := tmpstring + 'Поставка по сторно расхода; ';
    if psort.Checked then
        tmpstring := tmpstring + 'Учитывая акты списания; ';

    cel.setString(tmpstring);

    Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+6,dataArrayBounds[1,0], dataArrayBounds[1,1]+6);
    Cell.SetDataArray(v);


    //**********
   except
     on e: Exception
     do begin
       messbox(e.message, 'Error', 0);
     end;
   end;
end;

procedure TREPORT_NAC_ITOG_SHOP.btnExcelClick(Sender: TObject);
var excel: TExcelApplication;
begin
  try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
    ExpExcel;
  except
    ExpCalc;
  end;
end;

end.
