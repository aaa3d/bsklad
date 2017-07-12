unit ReportTDMItogShopDetal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, RxMemDS, Buttons, DualList, Grids, DBGrids,
  VclUtils, FR_DSet, FR_DBSet, FR_Class, RXSpin, RxLookup, ComCtrls, excel2000, OleServer;

type
  TREPORT_TDM_ITOG_SHOP_DETAL = class(TForm)
    ReportTransaction: TIBTransaction;
    QueryRep1: TIBQuery;
    BtnOk: TButton;
    Label3: TLabel;
    TW: TEdit;
    BtnDic: TSpeedButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    BtnPrint: TButton;
    frReport2: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    Label1: TLabel;
    DT: TDateEdit;
    Label2: TLabel;
    Mes: TComboBox;
    Mes1: TRxSpinEdit;
    Mes2: TRxSpinEdit;
    Label_Mes1: TLabel;
    Label_Mes2: TLabel;
    Label4: TLabel;
    SKL: TRxDBLookupCombo;
    DicTransaction: TIBTransaction;
    DicSKL: TIBQuery;
    DsSKL: TDataSource;
    DicSKLSKL_ID: TIntegerField;
    DicSKLSKL_FULL: TIBStringField;
    VALUTA: TComboBox;
    Label5: TLabel;
    QueryRep1TW_ID: TIntegerField;
    QueryRep1SKL_ID: TIntegerField;
    QueryRep1OST: TFloatField;
    QueryRep1OST2: TFloatField;
    QueryRep1VALUTA_ID: TIntegerField;
    QueryRep1TW_ART: TIntegerField;
    QueryRep1TW_NAM: TIBStringField;
    QueryRep1TREE_ID: TIntegerField;
    QueryRep1TWTREE_FULL: TIBStringField;
    DsReport: TDataSource;
    StatusBar1: TStatusBar;
    QueryRep1TW_KOL: TFloatField;
    QueryRep1valuta_short: TStringField;
    btnExcel: TButton;
    DBGrid1: TDBGrid;
    QueryRep1TW_KWM_ONE: TFloatField;
    frReport1: TfrReport;
    QueryRep1TW_KWM: TFloatField;
    CheckPN: TCheckBox;
    CheckPN2: TCheckBox;
    BtnDynDic: TSpeedButton;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure frReport2GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
    procedure MesChange(Sender: TObject);
    procedure VALUTAChange(Sender: TObject);
    procedure QueryRep1AfterOpen(DataSet: TDataSet);
    procedure QueryRep1CalcFields(DataSet: TDataSet);
    procedure QueryRep1AfterScroll(DataSet: TDataSet);
    procedure btnExcelClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
  private
    { Private declarations }
    tw_group_id: integer;
    tW_group_typ:integer;
  public
    { Public declarations }
  end;

var
  REPORT_TDM_ITOG_SHOP_DETAL: TREPORT_TDM_ITOG_SHOP_DETAL;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  REPORT_TITLE:string;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
implementation

uses DicTowar, WaitForm, DicTwDynGroup;

{$R *.DFM}

procedure TREPORT_TDM_ITOG_SHOP_DETAL.BtnOkClick(Sender: TObject);
var
  dt1,dt2:tdatetime;
  pp_typs: string;
begin
   REPORT_TITLE:='ѕодробный отчет об остатках товаров на складе "'+skl.text+'", на конец '+
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
   if valuta.itemindex=0 then REPORT_TITLE:=REPORT_TITLE+', только рублевый товар';
   if valuta.itemindex=1 then REPORT_TITLE:=REPORT_TITLE+', только долларовый товар';
   Wait_Form.Gauge1.Progress:=10;
   Wait_Form.StatusBar1.panels[0].text:='«апрос данных...';
   Wait_Form.Show;
   delay(100);
   BtnOk.enabled:=false;
   BtnPrint.enabled:=false;
   ReportTransaction.Active:=False;

   ADD_SQL(QueryRep1,'select * from REPORT_ITOG_TDM_SHOP_DETAL_NEW '+
   '(:DT1,:DT2,:DTREP,:TWTREE_ID,:SKL_ID2, :pp_typs, :TWTREE_TYP) ');
   if valuta.itemindex=0 then QueryRep1.SQL.Add('  where valuta_id=0 ');
   if valuta.itemindex=1 then QueryRep1.SQL.Add('  where valuta_id=1 ');
   QueryRep1.SQL.Add(' order by twtree_full,tw_nam');
   QueryRep1.ParamByname('twtree_id').asinteger:=tw_group_id;
   QueryRep1.ParamByname('twtree_typ').asinteger:=tw_group_typ;
   QueryRep1.ParamByname('dt1').asdatetime:=dt1;
   QueryRep1.ParamByname('dt2').asdatetime:=dt2;
   QueryRep1.ParamByname('dtrep').asdatetime:=dt.date+1-sekond1;
   QueryRep1.ParamByname('skl_id2').asinteger:=strtoint('0'+skl.value);
   pp_typs:='';
   if checkPN.checked then pp_typs := '%11%';
   if checkPN2.checked then pp_typs := pp_typs+'%12%13%14%16%';
   QueryRep1.ParamByname('pp_typs').asstring:= pp_typs;


   QueryRep1.Open;
   Wait_Form.Gauge1.Progress:=90;
   Wait_Form.StatusBar1.panels[0].text:='¬се почти готово...';
   Wait_Form.Show;
   delay(100);
   BtnOk.enabled:=true;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='ќк!';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
begin
   VALUTA.itemindex:=2;
   DicTransaction.Active:=False;
   DicSKL.close;
   DicSKL.open;
   SKL.value:=inttostr(default_sklad);
   dt.date:=date();
   tw_group_id:=0;
   tw_group_typ:=3;  //просто все товары
   TW.text:='¬се товары';
   Mes.itemindex:=1;
   mes1.value:=6;
   mes2.value:=6;
   mesChange(sender);
   mes.Enabled:=false;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL.BtnDicClick(Sender: TObject);
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

procedure TREPORT_TDM_ITOG_SHOP_DETAL.frReport2GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL.BtnPrintClick(Sender: TObject);
begin
     FrReport1.ShowReport;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL.MesChange(Sender: TObject);
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

procedure TREPORT_TDM_ITOG_SHOP_DETAL.VALUTAChange(Sender: TObject);
begin
   if VALUTA.itemindex<0 then VALUTA.itemindex:=0;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL.QueryRep1AfterOpen(
  DataSet: TDataSet);
begin
   Statusbar1.panels[0].text:='√руппа товаров: '+QueryRep1.fieldByname('twtree_full').asstring;
   BtnPrint.enabled:=not QueryRep1.eof;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL.QueryRep1CalcFields(
  DataSet: TDataSet);
begin
   if QueryRep1.fieldByname('valuta_id').asinteger=0
   then QueryRep1.fieldByname('valuta_short').asstring:='руб.';
   if QueryRep1.fieldByname('valuta_id').asinteger=1
   then QueryRep1.fieldByname('valuta_short').asstring:='USD';
   QueryRep1.fieldByname('tw_kwm').asfloat:=QueryRep1.fieldByname('tw_kwm_one').asfloat*QueryRep1.fieldByname('tw_kol').asfloat;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL.QueryRep1AfterScroll(
  DataSet: TDataSet);
begin
   Statusbar1.panels[0].text:='√руппа товаров: '+QueryRep1.fieldByname('twtree_full').asstring;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL.btnExcelClick(Sender: TObject);
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
    QueryRep1.last;
    queryrep1.First;

    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\подробный отчет об остатках одного склада.xlt', 0);
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
    r.Value := 'ѕодробный отчет об остатках товаров на одном складе на конец ' + dt.Text;
    r:= excel.Range['A2', 'A2'];
    r.Value := '√руппа товаров: '+ TW.Text;
    r:= excel.Range['A3', 'A3'];
    tmpstring := '«акуплены ' + mes.text +' '+ mes1.text +' '+ label_mes1.caption;
    if mes2.visible then tmpstring := tmpstring +' '+ mes2.text +' '+ label_mes2.caption;
    r.Value := tmpstring;
    r:= excel.Range['A4', 'A4'];
    r.Value := 'ѕо складу: '+ skl.Text;

    r:= excel.Range['A5', 'A5'];
    r.Value := '¬алюта товара: '+ valuta.Text;




    r := excel.Range[excel.Cells.Item[8, 1],
      excel.Cells.Item[QueryRep1.RecordCount +8 - 1,dbgrid1.fieldcount ]];

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
    format := QueryRep1Ost.DisplayFormat;
    format := stringreplace(format, ' ', '', [rfReplaceAll]);
    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
    r.NumberFormat := format;

    r := excel.Range[excel.Cells.Item[emptyParam, 7],
    excel.Cells.Item[emptyParam, 7]].EntireColumn;
    format := QueryRep1Ost2.DisplayFormat;
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

procedure TREPORT_TDM_ITOG_SHOP_DETAL.frReport1GetValue(
  const ParName: String; var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL.DBGrid1DblClick(Sender: TObject);
begin
   SHOW_ANALIZ_TW(queryRep1.fieldbyname('TW_ID').asinteger);
end;

procedure TREPORT_TDM_ITOG_SHOP_DETAL.BtnDynDicClick(Sender: TObject);
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

