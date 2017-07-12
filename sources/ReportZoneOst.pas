unit ReportZoneOst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, RxMemDS, Buttons, DualList, Grids, DBGrids,
  VclUtils, FR_DSet, FR_DBSet, FR_Class, RXSpin, excel2000, OleServer, ComObj,
  ExtCtrls, RxLookup;

type
  TREPORT_ZONE_OST = class(TForm)
    ReportTransaction: TIBTransaction;
    QueryRep1: TIBQuery;
    BtnOk: TButton;
    Label3: TLabel;
    TW: TEdit;
    BtnDic: TSpeedButton;
    DualListDialog1: TDualListDialog;
    DualListDialog2: TDualListDialog;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    DBGrid1: TDBGrid;
    BtnPrint: TButton;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    DsRep1: TDataSource;
    btnExcel: TButton;
    BtnDynDic: TSpeedButton;
    Label5: TLabel;
    DualListDialog3: TDualListDialog;
    SKL: TRxDBLookupCombo;
    QueryRep1TWTREE_FULL: TIBStringField;
    QueryRep1TW_ID: TIntegerField;
    QueryRep1TW_ART: TIntegerField;
    QueryRep1TW_NAM: TIBStringField;
    QueryRep1ED_SHORT: TIBStringField;
    QueryRep1TW_MROZ: TFloatField;
    QueryRep1TW_OST: TFloatField;
    QueryRep1TW_SUMM: TFloatField;
    QueryRep1TW_BRAK: TIBStringField;
    QueryRep1ZONE_ID: TIntegerField;
    QueryRep1ZONE_NAME: TIBStringField;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    QueryRep1TW_KUBATURA: TFloatField;
    QueryRep1ZONE_KUBATURA: TFloatField;
    QueryRep1RAZ1_1: TFloatField;
    QueryRep1RAZ1_2: TFloatField;
    QueryRep1RAZ1_3: TFloatField;
    QueryRep1RAZ2_1: TFloatField;
    QueryRep1RAZ2_2: TFloatField;
    QueryRep1RAZ2_3: TFloatField;
    QueryRep1RAZ3_1: TFloatField;
    QueryRep1RAZ3_2: TFloatField;
    QueryRep1RAZ3_3: TFloatField;
    QueryRep1TW_UP_KOL: TFloatField;
    QueryRep1TW_PALL_KOL: TFloatField;
    QueryRep1TW_SROK: TIntegerField;
    QueryRep1TW_DATE_PROIZ: TIBStringField;
    QueryRep1TW_SROK_OST: TIntegerField;
    Label1: TLabel;
    zone_mask: TMaskEdit;
    Label2: TLabel;
    QueryRep1TW_DATE_PROIZV: TDateTimeField;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
    procedure QueryRep1AfterOpen(DataSet: TDataSet);
    procedure ExpExcel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
    procedure ExpCalc;
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }

    tw_group_id: integer;
    tW_group_typ:integer;
    SKL_S: string;

  public
    { Public declarations }
  end;

var
  REPORT_ZONE_OST: TREPORT_ZONE_OST;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  REPORT_TITLE:string;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
implementation

uses DicTowar, WaitForm, DicKlient, TwShowOstPrih, DicTwDynGroup,
  DicKlientDynGroup;

{$R *.DFM}

procedure TREPORT_ZONE_OST.BtnOkClick(Sender: TObject);

begin

   REPORT_TITLE:='Отчет об остатках по зонам';

   REPORT_TITLE:=REPORT_TITLE+ ', по группе товаров: "'+tw.text+'"';
   REPORT_TITLE:=REPORT_TITLE+ ', по складу: "'+SKL.text+'"';


   Wait_Form.Gauge1.Progress:=10;
   Wait_Form.StatusBar1.panels[0].text:='Запрос данных...';
   Wait_Form.Show;
   delay(100);
   BtnOk.enabled:=false;
   BtnPrint.enabled:=false;
{   ADD_SQL(QueryRep1,'select tw_id,tw_art,tw_nam,sum(ost_kol) as ost_kol, '+
   'sum(ost_kol*seb) as seb,'+
   'twtree_id,twtree_full, max(tw_kwm_one) tw_kwm_one '+
   'from REPORT_ITOG_TDM_DETAL_NEW(:dt1,:dt2,:dtrep,:twtree_id, 1, :PP_TYPS, :twtree_typ, :post_group_id, :post_group_typ, :frm_id) '+
   wh+
   ' group by tw_id,tw_art,tw_nam, twtree_id,twtree_full, tw_kwm_one'+
   ' order by twtree_full,tw_nam ');
}
      QueryRep1.Active:=false;
      ReportTransaction.Active:=false;


   QueryRep1.ParamByname('twtree_id').asinteger:=tw_group_id;
   QueryRep1.ParamByname('twtree_typ').asinteger:=tw_group_typ;
   QueryRep1.ParamByname('skl_id').asstring:=SKL.value;
   QueryRep1.ParamByname('SHOW_EMPTY_ZONES').asInteger:=0;
   if (checkbox2.checked) then
        QueryRep1.ParamByname('SHOW_EMPTY_ZONES').asInteger:=1;
   QueryRep1.ParamByname('SHOW_NOT_EMPTY_ZONES').asInteger:=0;
   if (checkbox1.checked) then
        QueryRep1.ParamByname('SHOW_NOT_EMPTY_ZONES').asInteger:=1;


   QueryRep1.ParamByname('zone_mask').asstring:=stringreplace( zone_mask.text, ' ', '_', [rfReplaceAll]);







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
   btnExcel.Enabled:=true;
   if QueryRep1.eof then messbox('Отчет пуст!',messSystem,48) else begin
   end;

end;

procedure TREPORT_ZONE_OST.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
  yy,mm,dd: word;
begin
   tw_group_id:=0;
   tw_group_typ:=3;  //просто все товары


   
   TW.text:='Все товары';







end;

procedure TREPORT_ZONE_OST.BtnDicClick(Sender: TObject);
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

procedure TREPORT_ZONE_OST.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
  if ParName='USER_NAME' then
    ParValue:=USERFIO;
end;

procedure TREPORT_ZONE_OST.BtnPrintClick(Sender: TObject);
begin
     QueryRep1.DisableControls;
     FrReport1.ShowReport;
     QueryRep1.EnableControls;
end;

procedure TREPORT_ZONE_OST.QueryRep1AfterOpen(DataSet: TDataSet);
begin
  BtnPrint.enabled:=not QueryRep1.eof;
end;

procedure TREPORT_ZONE_OST.ExpExcel;
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

    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет об остатках по зонам.xlt', 0);
    v := VarArrayCreate([0, QueryRep1.RecordCount, 0, QueryRep1.FieldCount], varVariant);

    for iRow:=0 to QueryRep1.RecordCount-1 do
    begin
        for iCol:=0 to dbgrid1.FieldCount - 1 do
        begin
        v[iRow, icol] := dbgrid1.Fields[iCol].AsVariant;
        end;
        QueryRep1.Next;
    end;
    QueryRep1.First;

    r:= excel.Range['A1', 'A1'];
    r.Value := REPORT_TITLE;
    r:= excel.Range['A2', 'A2'];
//    r.Value := 'Группа товаров: '+ TW.Text;
    r:= excel.Range['A3', 'A3'];
//    tmpstring := 'Закуплены более' + mes1.text +' '+ label_mes1.caption;
    r.Value := tmpstring;
    r:= excel.Range['A4', 'A4'];

    r:= excel.Range['A5', 'A5'];
    r.value := tmpstring;



    r := excel.Range[excel.Cells.Item[4, 1],
      excel.Cells.Item[QueryRep1.RecordCount +4 - 1,dbgrid1.fieldcount ]];

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



    r := excel.Range[excel.Cells.Item[emptyParam, 6],
    excel.Cells.Item[emptyParam, 6]].EntireColumn;

    r.NumberFormat := format;

    r := excel.Range[excel.Cells.Item[emptyParam, 7],
    excel.Cells.Item[emptyParam, 7]].EntireColumn;

    except
    end;


    except
    freeandnil(excel);
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);
end;

procedure TREPORT_ZONE_OST.DBGrid1DblClick(Sender: TObject);
begin
   SHOW_ANALIZ_TW(queryRep1.fieldbyname('TW_ID').asinteger);
end;

procedure TREPORT_ZONE_OST.BtnDynDicClick(Sender: TObject);
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

procedure TREPORT_ZONE_OST.ExpCalc;
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
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет о работе склада.xlt');
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
    cel.setString(REPORT_TITLE);
    cel := Sheet.GetCellByPosition(0,1);
//    cel.setString('Группа товаров: '+ TW.Text);
    cel := Sheet.GetCellByPosition(0,2);

//    tmpstring := 'Закуплены более ' + mes1.text +' '+ label_mes1.caption;


    cel.setString(tmpstring);
    cel := Sheet.GetCellByPosition(0,3);

    cel := Sheet.GetCellByPosition(0,4);
    cel.setString(tmpstring);

    Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+7,dataArrayBounds[1,0], dataArrayBounds[1,1]+7);
    Cell.SetDataArray(v);


    //**********
   except
     on e: Exception
     do begin
       messbox(e.message, 'Error', 0);
     end;
   end;
end;

procedure TREPORT_ZONE_OST.btnExcelClick(Sender: TObject);
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

