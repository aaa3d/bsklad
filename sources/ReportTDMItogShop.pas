unit ReportTDMItogShop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, RxMemDS, Buttons, DualList, Grids, DBGrids,
  VclUtils, FR_DSet, FR_DBSet, FR_Class, RXSpin, excel2000, OleServer;

type
  TREPORT_TDM_ITOG_SHOP = class(TForm)
    ReportTransaction: TIBTransaction;
    QueryRep1: TIBQuery;
    BtnOk: TButton;
    MemReport: TRxMemoryData;
    DsReport: TDataSource;
    QueryRep2: TIBQuery;
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
    Label1: TLabel;
    DT: TDateEdit;
    Label2: TLabel;
    Mes: TComboBox;
    Mes1: TRxSpinEdit;
    Mes2: TRxSpinEdit;
    Label_Mes1: TLabel;
    Label_Mes2: TLabel;
    MemReportost: TFloatField;
    MemReportost2: TFloatField;
    MemReportvaluta_id: TIntegerField;
    MemReportvaluta_full: TStringField;
    MemReportSKL_ID: TIntegerField;
    MemReportSKL_FULL: TStringField;
    btnExcel: TButton;
    CheckPN: TCheckBox;
    CheckPN2: TCheckBox;
    BtnDynDic: TSpeedButton;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
    procedure MesChange(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
  private
    { Private declarations }
    tw_group_id: integer;
    tW_group_typ:integer;
  public
    { Public declarations }
  end;

var
  REPORT_TDM_ITOG_SHOP: TREPORT_TDM_ITOG_SHOP;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  REPORT_TITLE:string;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
implementation

uses WaitForm, DicTowar, DicTwDynGroup;



{$R *.DFM}

procedure TREPORT_TDM_ITOG_SHOP.BtnOkClick(Sender: TObject);
var
  dt1,dt2:tdatetime;
  pp_typs: string;
begin
   REPORT_TITLE:='»тоговый отчет об остатках товаров по складам на конец '+
   date_sokr(dt.date)+' по группе товаров: "'+tw.text+'"';
   case MES.itemindex of
     0: begin
           REPORT_TITLE:=REPORT_TITLE+', закупленные за '+
           OKON_CHAR('последний ',' посление ','последние ',trunc(MES1.value))
           +inttostr(trunc(MES1.value))+
           OKON_CHAR(' мес€ц ',' мес€ца ',' мес€цев ',trunc(MES1.value));
           DT1:=incmonth(dt.date,-trunc(Mes1.value))+1;
           DT2:=dt.date+1-sekond1;
        end;
     1: begin
            REPORT_TITLE:=REPORT_TITLE+', закупленные более '+
            floattostrf(MES1.value,fffixed,12,0)+
            OKON_CHAR(' мес€ца ',' мес€цев ',' мес€цев ',trunc(MES1.value))+' назад ';
            DT2:=incmonth(dt.date+1-sekond1,-trunc(mes1.value))-sekond1;
            DT1:=encodedate(1900,1,1);
        end;
     2: begin
            REPORT_TITLE:=REPORT_TITLE+', закупленные от '
            +inttostr(trunc(MES1.value))+' до '+inttostr(trunc(MES2.value))+
            OKON_CHAR(' мес€ца ',' мес€цев ',' мес€цев ',trunc(MES2.value))+' назад';
            DT1:=incmonth(dt.date,-trunc(Mes2.value))+1;
            DT2:=incmonth(dt.date+1-sekond1,-trunc(Mes1.value))-sekond1;
        end;
   end;
   REPORT_TITLE:=REPORT_TITLE+' ('+date_sokr(dt1)+' - '+date_sokr(dt2)+')';
   Wait_Form.Gauge1.Progress:=10;
   Wait_Form.StatusBar1.panels[0].text:='«апрос данных...';
   Wait_Form.Show;
   delay(100);
   BtnOk.enabled:=false;
   BtnPrint.enabled:=false;
   ReportTransaction.Active:=False;
   ADD_SQL(QueryRep1,'select skl_id,sum(ost) as ost,sum(ost$) as ost$,valuta_id '+
   'from report_itog_tdm_shop(:dt1,:dt2,:dtrep,:Twtree_id, :pp_typs, :Twtree_typ) '+
   'group by skl_id,valuta_id order by skl_id,valuta_id');
   QueryRep1.ParamByname('twtree_id').asinteger:=tw_group_id;
   QueryRep1.ParamByname('twtree_typ').asinteger:=tw_group_typ;
   QueryRep1.ParamByname('dt1').asdatetime:=dt1;
   QueryRep1.ParamByname('dt2').asdatetime:=dt2;
   QueryRep1.ParamByname('dtrep').asdatetime:=dt.date+1-sekond1;
   pp_typs:='';
   if checkPN.checked then pp_typs := '%11%';
   if checkPN2.checked then pp_typs := pp_typs+'%12%13%14%16%';
   QueryRep1.ParamByname('pp_typs').asstring:= pp_typs;

   QueryRep1.Open;
   MemReport.EmptyTable;
   Wait_Form.Gauge1.Progress:=90;
   Wait_Form.StatusBar1.panels[0].text:='¬се почти готово...';
   Wait_Form.Show;
   delay(100);
   while not QueryRep1.eof do begin
     MemReport.Append;
     MemReport.fieldByname('SKL_ID').asinteger:=QueryRep1.fieldByname('skl_id').asinteger;
     ADD_SQL(QueryRep2,'select skl_full from skl where skl_id=:skl_id');
     QueryRep2.ParamByname('skl_id').asinteger:=QueryRep1.fieldByname('skl_id').asinteger;
     QueryRep2.Open;
     MemReport.fieldByname('skl_full').asstring:=QueryRep2.fieldByname('skl_full').asstring;
     MemReport.FieldByname('ost').asfloat:=QueryRep1.fieldByname('ost').asfloat;
     MemReport.FieldByname('ost$').asfloat:=QueryRep1.fieldByname('ost$').asfloat;
     MemReport.fieldByname('valuta_id').asinteger:=QueryRep1.fieldByname('valuta_id').asinteger;
     case QueryRep1.fieldByname('valuta_id').asinteger of
       0: MemReport.fieldByname('valuta_full').asstring:='–убли';
       1: MemReport.fieldByname('valuta_full').asstring:='ƒоллары —Ўј';
     end;
     MemReport.Post;
     QueryRep1.next;
   end;
   MemReport.first;
   BtnOk.enabled:=true;
   if MemReport.recordcount>0 then BtnPrint.enabled:=true;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='ќк!';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
end;

procedure TREPORT_TDM_ITOG_SHOP.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
begin
   dt.date:=date();
   tw_group_id:=0;
   tw_group_typ:=3;  //просто все товары
   TW.text:='¬се товары';
   Mes.itemindex:=1;
   mes1.value:=6;
   mes2.value:=6;
   mesChange(sender);
   mes.enabled:=false;
end;

procedure TREPORT_TDM_ITOG_SHOP.BtnDicClick(Sender: TObject);
begin
     DicTowarSet:=3; {¬вод одной группы товаров}
     if tw_group_typ=3 then
       DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {ќтображаем название}
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

procedure TREPORT_TDM_ITOG_SHOP.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_TDM_ITOG_SHOP.BtnPrintClick(Sender: TObject);
begin
     FrReport1.ShowReport;
end;

procedure TREPORT_TDM_ITOG_SHOP.MesChange(Sender: TObject);
begin
     if mes.itemindex<0 then mes.itemindex:=0;
     case  mes.itemindex of
       0: begin // «а последние
             label_mes2.visible:=false;
             mes2.visible:=false;
             label_mes1.caption:='мес€ц/мес€ца/мес€цев';
          end;
       1: begin // более
             label_mes2.visible:=false;
             mes2.visible:=false;
             label_mes1.caption:='мес€ц/мес€ца/мес€цев назад';
          end;
       2: begin // c по
             label_mes2.visible:=true;
             label_mes2.caption:='мес€ц/мес€ца/мес€цев';
             mes2.visible:=true;
             label_mes1.caption:='до';
          end;
     end;
end;

procedure TREPORT_TDM_ITOG_SHOP.btnExcelClick(Sender: TObject);
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

    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет об остатках по складам.xlt', 0);
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
    r.Value := '»тоговый отчет об остатках по складам на конец ' + dt.Text;
    r:= excel.Range['A2', 'A2'];
    r.Value := '√руппа товаров: '+ TW.Text;
    r:= excel.Range['A3', 'A3'];
    tmpstring := '«акуплены ' + mes.text +' '+ mes1.text +' '+ label_mes1.caption;
    if mes2.visible then tmpstring := tmpstring +' '+ mes2.text +' '+ label_mes2.caption;

    r.Value := tmpstring;


    r := excel.Range[excel.Cells.Item[5, 1],
      excel.Cells.Item[memreport.RecordCount +5 - 1,dbgrid1.fieldcount ]];

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



    r := excel.Range[excel.Cells.Item[emptyParam, 3],
    excel.Cells.Item[emptyParam, 3]].EntireColumn;
    format := MemReportost.DisplayFormat;
    format := stringreplace(format, ' ', '', [rfReplaceAll]);
    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
    r.NumberFormat := format;

    r := excel.Range[excel.Cells.Item[emptyParam, 4],
    excel.Cells.Item[emptyParam, 4]].EntireColumn;
    format := MemReportost2.DisplayFormat;
    format := stringreplace(format, ' ', '', [rfReplaceAll]);
    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
    r.NumberFormat := format;

     except
     end;



    except
    freeandnil(excel);
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);
end;

procedure TREPORT_TDM_ITOG_SHOP.BtnDynDicClick(Sender: TObject);
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

end.

