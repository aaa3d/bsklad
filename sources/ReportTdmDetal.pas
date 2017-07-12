unit ReportTdmDetal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, RxMemDS, Buttons, DualList, Grids, DBGrids,
  VclUtils, FR_DSet, FR_DBSet, FR_Class, RXSpin, excel2000, OleServer;

type
  TREPORT_TDM_DETAL = class(TForm)
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
    Label1: TLabel;
    DT: TDateEdit;
    Label2: TLabel;
    Mes: TComboBox;
    Mes1: TRxSpinEdit;
    Mes2: TRxSpinEdit;
    Label_Mes1: TLabel;
    Label_Mes2: TLabel;
    Label4: TLabel;
    KLN: TEdit;
    SpeedButton1: TSpeedButton;
    QueryRep1TW_ID: TIntegerField;
    QueryRep1TW_ART: TIntegerField;
    QueryRep1TW_NAM: TIBStringField;
    QueryRep1OST_KOL: TFloatField;
    QueryRep1SEB: TFloatField;
    QueryRep1SEB2: TFloatField;
    QueryRep1VALUTA_ID: TIntegerField;
    QueryRep1TWTREE_ID: TIntegerField;
    QueryRep1TWTREE_FULL: TIBStringField;
    Valuta0: TCheckBox;
    Valuta1: TCheckBox;
    DsRep1: TDataSource;
    QueryRep1valuta_full: TStringField;
    btnExcel: TButton;
    QueryRep1TW_KWM_ONE: TFloatField;
    QueryRep1_: TFloatField;
    CheckPN2: TCheckBox;
    CheckPN: TCheckBox;
    ShowPrih: TButton;
    BtnDynDic: TSpeedButton;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BtnPrintClick(Sender: TObject);
    procedure MesChange(Sender: TObject);
    procedure ChangeKLN;
    procedure SpeedButton1Click(Sender: TObject);
    procedure QueryRep1AfterOpen(DataSet: TDataSet);
    procedure QueryRep1CalcFields(DataSet: TDataSet);
    procedure btnExcelClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ShowPrihClick(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
  private
    { Private declarations }
      dt1,dt2:tdatetime;
    tw_group_id: integer;
    tW_group_typ:integer;      
  public
    { Public declarations }
  end;

var
  REPORT_TDM_DETAL: TREPORT_TDM_DETAL;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  REPORT_TITLE:string;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
implementation

uses DicTowar, WaitForm, DicKlient, TwShowOstPrih, DicTwDynGroup;

{$R *.DFM}

procedure TREPORT_TDM_DETAL.BtnOkClick(Sender: TObject);
var
  wh:string;
  pp_typs: string;
begin
   wh:='where valuta_id=-1';
   REPORT_TITLE:='ѕодробный отчет об остатках товаров менеджера '+kln.text+' на конец '+
   date_sokr(dt.date)+' по группе товаров: "'+tw.text+'"';
   if (valuta0.checked) and (not valuta1.checked) then begin
     REPORT_TITLE:=REPORT_TITLE+', только рублевые товары';
     wh:='where valuta_id=0';
   end;
   if (not valuta0.checked) and (valuta1.checked) then begin
      REPORT_TITLE:=REPORT_TITLE+', только доларовые товары';
      wh:='where valuta_id=1';
   end;
   if (valuta0.checked) and (valuta1.checked) then begin
      REPORT_TITLE:=REPORT_TITLE+', рублевые и долларовые товары';
      wh:='';
   end;
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
   ADD_SQL(QueryRep1,'select tw_id,tw_art,tw_nam,sum(ost_kol) as ost_kol, '+
   'sum(ost_kol*seb) as seb,sum(ost_kol*seb$) as seb$, '+
   'valuta_id,twtree_id,twtree_full, max(tw_kwm_one) tw_kwm_one '+
   'from REPORT_ITOG_TDM_DETAL(:dt1,:dt2,:dtrep,:twtree_id,:men_id, 1, :PP_TYPS, :twtree_typ) '+
   wh+
   ' group by tw_id,tw_art,tw_nam,valuta_id,twtree_id,twtree_full, tw_kwm_one'+
   ' order by twtree_full,tw_nam ');


   QueryRep1.ParamByname('twtree_id').asinteger:=tw_group_id;
   QueryRep1.ParamByname('twtree_typ').asinteger:=tw_group_typ;
   QueryRep1.ParamByname('dt1').asdatetime:=dt1;
   QueryRep1.ParamByname('dt2').asdatetime:=dt2;
   QueryRep1.ParamByname('men_id').asinteger:=kln.tag;
   QueryRep1.ParamByname('dtrep').asdatetime:=dt.date+1-sekond1;
   pp_typs:='';
   if checkPN.checked then pp_typs := '%11%';
   if checkPN2.checked then pp_typs := pp_typs+'%12%13%14%16%';
   QueryRep1.ParamByname('pp_typs').asstring:= pp_typs;




   QueryRep1.Open;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='¬се почти готово...';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
   BtnOk.enabled:=true;
   Wait_Form.Gauge1.Progress:=100;
   Wait_Form.StatusBar1.panels[0].text:='ќк!';
   Wait_Form.Show;
   delay(100);
   Wait_Form.Hide;
   if QueryRep1.eof then messbox('ќтчет пуст!',messSystem,48) else begin
   end;

end;

procedure TREPORT_TDM_DETAL.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
begin
   dt.date:=date();
   tw_group_id:=0;
   tw_group_typ:=3;  //просто все товары
   TW.text:='¬се товары';
   KLN.tag:=0;
   Mes.itemindex:=0;
   mes1.value:=3;
   mes2.value:=6;
   ChangeKLN;
   mesChange(sender);
end;

procedure TREPORT_TDM_DETAL.ChangeKLN;
begin
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork,'select kln_full from kln_data(:kln_id)');
  QueryWork.ParamByname('kln_id').asinteger:=KLN.tag;
  QueryWork.Open;
  KLN.text:=QueryWork.fieldByname('kln_full').asstring;
  QueryWork.Close;
end;


procedure TREPORT_TDM_DETAL.BtnDicClick(Sender: TObject);
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

procedure TREPORT_TDM_DETAL.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_TDM_DETAL.BtnPrintClick(Sender: TObject);
begin
     QueryRep1.DisableControls;
     FrReport1.ShowReport;
     QueryRep1.EnableControls;
end;

procedure TREPORT_TDM_DETAL.MesChange(Sender: TObject);
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

procedure TREPORT_TDM_DETAL.SpeedButton1Click(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=KLN.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN.tag then begin
        KLN.tag:=DIC_KLIENT.tag;
        ChangeKln;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TREPORT_TDM_DETAL.QueryRep1AfterOpen(DataSet: TDataSet);
begin
  BtnPrint.enabled:=not QueryRep1.eof;
end;

procedure TREPORT_TDM_DETAL.QueryRep1CalcFields(DataSet: TDataSet);
begin
   if QueryRep1.fieldByname('valuta_id').asinteger=0
     then QueryRep1.fieldByname('valuta_full').asstring:='–уб.';
   if QueryRep1.fieldByname('valuta_id').asinteger=1
     then QueryRep1.fieldByname('valuta_full').asstring:='USD';
    QueryRep1.fieldByname('tw_kwm').asfloat:=QueryRep1.fieldByname('tw_kwm_one').asfloat*QueryRep1.fieldByname('ost_kol').asfloat;
end;

procedure TREPORT_TDM_DETAL.btnExcelClick(Sender: TObject);
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

    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\подробный отчет об остатках одного менеджера.xlt', 0);
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
    r.Value := 'ѕодробный отчет об остатках одного менеджера на конец ' + dt.Text;
    r:= excel.Range['A2', 'A2'];
    r.Value := '√руппа товаров: '+ TW.Text;
    r:= excel.Range['A3', 'A3'];
    tmpstring := '«акуплены ' + mes.text +' '+ mes1.text +' '+ label_mes1.caption;
    if mes2.visible then tmpstring := tmpstring +' '+ mes2.text +' '+ label_mes2.caption;
    r.Value := tmpstring;
    r:= excel.Range['A4', 'A4'];
    r.Value := 'ћенеджер: '+ KLN.Text;

    tmpstring:= '“ип товаров: ';
    if Valuta0.checked then
      tmpstring:= tmpstring+valuta0.Caption;
    if valuta0.Checked and valuta1.Checked
      then tmpstring:= tmpstring + ', ';
    if valuta1.checked
      then tmpstring:= tmpstring+valuta1.caption;
    r:= excel.Range['A5', 'A5'];
    r.value := tmpstring;



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
    format := QueryRep1Seb.DisplayFormat;
    format := stringreplace(format, ' ', '', [rfReplaceAll]);
    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
    r.NumberFormat := format;

    r := excel.Range[excel.Cells.Item[emptyParam, 7],
    excel.Cells.Item[emptyParam, 7]].EntireColumn;
    format := QueryRep1Seb2.DisplayFormat;
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

procedure TREPORT_TDM_DETAL.DBGrid1DblClick(Sender: TObject);
begin
   SHOW_ANALIZ_TW(queryRep1.fieldbyname('TW_ID').asinteger);
end;

procedure TREPORT_TDM_DETAL.ShowPrihClick(Sender: TObject);
begin
  Application.createForm(TTW_SHOW_OST_PRIH,TW_SHOW_OST_PRIH);
  
  TW_SHOW_OST_PRIH.tw_id := queryRep1.fieldbyname('TW_ID').asinteger;
  TW_SHOW_OST_PRIH.dt1:= dt1;
  TW_SHOW_OST_PRIH.dt2:= dt2;
  TW_SHOW_OST_PRIH.dt_rep:= dt.date+1-sekond1;
  TW_SHOW_OST_PRIH.show;

end;

procedure TREPORT_TDM_DETAL.BtnDynDicClick(Sender: TObject);
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

