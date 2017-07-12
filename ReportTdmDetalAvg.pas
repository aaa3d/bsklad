unit ReportTdmDetalAvg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, RxMemDS, Buttons, DualList, Grids, DBGrids,
  VclUtils, FR_DSet, FR_DBSet, FR_Class, RXSpin, excel2000, OleServer, ComObj,
  RxLookup;

type
  TREPORT_TDM_DETAL_AVG = class(TForm)
    ReportTransaction: TIBTransaction;
    QueryRep1: TIBQuery;
    BtnOk: TButton;
    Label3: TLabel;
    TW: TEdit;
    BtnDic: TSpeedButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    DBGrid1: TDBGrid;
    BtnPrint: TButton;
    frDBDataSet1: TfrDBDataSet;
    Label1: TLabel;
    DT1: TDateEdit;
    DsRep1: TDataSource;
    btnExcel: TButton;
    BtnDynDic: TSpeedButton;
    Label2: TLabel;
    Label4: TLabel;
    dt2: TDateEdit;
    frReport1: TfrReport;
    QueryRep1TW_ID: TIntegerField;
    QueryRep1TW_ART: TIntegerField;
    QueryRep1TW_NAM: TIBStringField;
    QueryRep1TWTREE_ID: TIntegerField;
    QueryRep1TWTREE_FULL: TIBStringField;
    QueryRep1OST_KOL: TFloatField;
    QueryRep1SEB: TFloatField;
    QueryRep1SEB2: TFloatField;
    Label8: TLabel;
    FRM: TRxDBLookupCombo;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
    procedure QueryRep1AfterOpen(DataSet: TDataSet);
    procedure QueryRep1CalcFields(DataSet: TDataSet);
    procedure ExpExcel;
    procedure DBGrid1DblClick(Sender: TObject);
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
  REPORT_TDM_DETAL_AVG: TREPORT_TDM_DETAL_AVG;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  REPORT_TITLE:string;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
implementation

uses DicTowar, WaitForm, DicKlient, TwShowOstPrih, DicTwDynGroup;

{$R *.DFM}

procedure TREPORT_TDM_DETAL_AVG.BtnOkClick(Sender: TObject);
var
  wh:string;
  pp_typs: string;
begin

   REPORT_TITLE:='Усредненый подробный отчет об остатках товаров за период с '+
   date_sokr(dt1.date)+' по '+date_sokr(dt2.date)+'  по группе товаров: "'+tw.text+'"';

//   REPORT_TITLE:=REPORT_TITLE+' ('+date_sokr(dt1)+' - '+date_sokr(dt2)+')';
   Wait_Form.Gauge1.Progress:=10;
   Wait_Form.StatusBar1.panels[0].text:='Запрос данных...';
   Wait_Form.Show;
   delay(100);
   BtnOk.enabled:=false;
   BtnPrint.enabled:=false;


   QueryRep1.Close;
   QueryRep1.ParamByname('start_twtree_id').asinteger:=tw_group_id;
   QueryRep1.ParamByname('start_twtree_typ').asinteger:=tw_group_typ;
   QueryRep1.ParamByname('dt1').asdatetime:=dt1.Date;
   QueryRep1.ParamByname('dt2').asdatetime:=dt2.Date+1;
   QueryRep1.ParamByname('FRM_ID').asinteger:=strtoint(FRM.Value);
   QueryRep1.Open;

   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='Все почти готово...';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
   BtnOk.enabled:=true;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='Ок!';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
   if QueryRep1.eof then messbox('Отчет пуст!',messSystem,48) else begin
   end;
   QueryRep1.Last;

end;

procedure TREPORT_TDM_DETAL_AVG.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
  dd,mm,yy:word;
begin
   decodedate(date(),yy,mm,dd);
//   dt1.date:=encodedate(yy,mm-1,1);
//   dt2.date:=incmonth(dt1.date,1)-1;

//  decodedate(date(),yy,mm,dd);
  dt1.date:=incmonth(encodedate(yy,mm,1),-1);
  dt2.date:=incmonth(dt1.date,1)-1;


   tw_group_id:=0;
   tw_group_typ:=3;  //просто все товары
   TW.text:='Все товары';
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

procedure TREPORT_TDM_DETAL_AVG.BtnDicClick(Sender: TObject);
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

procedure TREPORT_TDM_DETAL_AVG.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_TDM_DETAL_AVG.BtnPrintClick(Sender: TObject);
begin
     QueryRep1.DisableControls;
     FrReport1.ShowReport;
     QueryRep1.EnableControls;
end;

procedure TREPORT_TDM_DETAL_AVG.QueryRep1AfterOpen(DataSet: TDataSet);
begin
  BtnPrint.enabled:=not QueryRep1.eof;
end;

procedure TREPORT_TDM_DETAL_AVG.QueryRep1CalcFields(DataSet: TDataSet);
begin
   if QueryRep1.fieldByname('valuta_id').asinteger=0
     then QueryRep1.fieldByname('valuta_full').asstring:='Руб.';
   if QueryRep1.fieldByname('valuta_id').asinteger=1
     then QueryRep1.fieldByname('valuta_full').asstring:='USD';
    QueryRep1.fieldByname('tw_kwm').asfloat:=QueryRep1.fieldByname('tw_kwm_one').asfloat*QueryRep1.fieldByname('ost_kol').asfloat;
end;

procedure TREPORT_TDM_DETAL_AVG.ExpExcel;
var excel: TExcelApplication;
    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
begin


    QueryRep1.First;


    try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
//    excel.Visible[0]:=true;
    queryrep1.Last;
    QueryRep1.First;

    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\усредненый подробный отчет об остатках за период.XLT', 0);
    v := VarArrayCreate([0, QueryRep1.RecordCount, 0, QueryRep1.FieldCount], varVariant);

    for iRow:=0 to QueryRep1.RecordCount-1 do
    begin
        for iCol:=0 to dbgrid1.FieldCount - 1 do
        begin
        v[iRow, icol] :=  QueryRep1.FieldValues[  dbgrid1.Fields[iCol].FieldName];
        end;
        QueryRep1.Next;
    end;
    QueryRep1.First;

    r:= excel.Range['A1', 'A1'];



    r.Value := 'Усредненый подробный отчет об остатках товаров за период с '+ date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
    r:= excel.Range['A2', 'A2'];
    r.Value := 'Группа товаров: '+ TW.Text;
    r:= excel.Range['A3', 'A3'];





    r := excel.Range[excel.Cells.Item[6, 1],
      excel.Cells.Item[QueryRep1.RecordCount +6 - 1,dbgrid1.fieldcount ]];

    r.Value := v;




    try

    r.Borders[xlEdgeTop].LineStyle := xlContinuous;
    r.Borders[xlEdgeTop].Weight := xlThin;
    r.Borders[xlEdgeTop].ColorIndex := xlAutomatic;


    r.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    r.Borders[xlEdgeBottom].Weight := xlThin;
    r.Borders[xlEdgeBottom].ColorIndex := xlAutomatic;

    r.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    r.Borders[xlInsideHorizontal].Weight := xlThin;
    r.Borders[xlInsideHorizontal].ColorIndex := xlAutomatic;



//    r := excel.Range[excel.Cells.Item[emptyParam, 6],
//    excel.Cells.Item[emptyParam, 6]].EntireColumn;
//    format := QueryRep1Seb.DisplayFormat;
//    format := stringreplace(format, ' ', '', [rfReplaceAll]);
//    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
//    r.NumberFormat := format;
//
//    r := excel.Range[excel.Cells.Item[emptyParam, 7],
//    excel.Cells.Item[emptyParam, 7]].EntireColumn;
//    format := QueryRep1Seb2.DisplayFormat;
//    format := stringreplace(format, ' ', '', [rfReplaceAll]);
//    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
//    r.NumberFormat := format;

    except
    end;


    except
    freeandnil(excel);
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);
end;

procedure TREPORT_TDM_DETAL_AVG.DBGrid1DblClick(Sender: TObject);
begin
   SHOW_ANALIZ_TW(queryRep1.fieldbyname('TW_ID').asinteger);
end;

procedure TREPORT_TDM_DETAL_AVG.BtnDynDicClick(Sender: TObject);
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

procedure TREPORT_TDM_DETAL_AVG.ExpCalc;
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
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\усредненый подробный отчет об остатках за период.xlt');
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
    queryrep1.Last;
    QueryRep1.First;

    dataArrayBounds[0,0]:=0;
    dataArrayBounds[1,0]:=dbgrid1.FieldCount;
    dataArrayBounds[0,1]:=0;
    dataArrayBounds[1,1]:=QueryRep1.RecordCount+100;




    v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);


    for i := 0 to dataArrayBounds[1,0] do
      for j := 0 to  dataArrayBounds[1,1] do
         v[i,j]:='';

    QueryRep1.First;
    for iRow:=0 to QueryRep1.RecordCount-1 do
    begin
      for iCol:=0 to dbgrid1.FieldCount - 1 do
        v[iCol, iRow] := dbgrid1.Fields[iCol].AsVariant;
      QueryRep1.Next;
    end;
    QueryRep1.First;

    Sheets := Document.GetSheets;
    Sheet := Sheets.GetByName('Лист1');
    cel := Sheet.GetCellByPosition(0,0);
    cel.setString('Усредненый подробный отчет об остатках товаров за период с '+ date_sokr(dt1.date)+' по '+date_sokr(dt2.date));
    cel := Sheet.GetCellByPosition(0,1);
    cel.setString('Группа товаров: '+ TW.Text);

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

procedure TREPORT_TDM_DETAL_AVG.btnExcelClick(Sender: TObject);
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

