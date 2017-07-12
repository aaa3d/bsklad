unit ReportItogMoveDetal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, RxMemDS, Buttons, DualList, Grids, DBGrids,
  VclUtils, FR_DSet, FR_DBSet, FR_Class, RXSpin;

type
  TREPORT_ITOG_MOVE_DETAL = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_ITOG_MOVE_DETAL: TREPORT_ITOG_MOVE_DETAL;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  REPORT_TITLE:string;

implementation

uses DicTowar, WaitForm, DicKlient;

{$R *.DFM}

procedure TREPORT_ITOG_MOVE_DETAL.BtnOkClick(Sender: TObject);
var
  dt1,dt2:tdatetime;
  wh:string;
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
   'valuta_id,twtree_id,twtree_full '+
   'from REPORT_ITOG_TDM_DETAL(:dt1,:dt2,:dtrep,:twtree_id,:men_id) '+
   wh+
   'group by tw_id,tw_art,tw_nam,valuta_id,twtree_id,twtree_full '+
   'order by twtree_full,tw_nam ');

   QueryRep1.ParamByname('twtree_id').asinteger:=tw.tag;
   QueryRep1.ParamByname('dt1').asdatetime:=dt1;
   QueryRep1.ParamByname('dt2').asdatetime:=dt2;
   QueryRep1.ParamByname('men_id').asinteger:=kln.tag;
   QueryRep1.ParamByname('dtrep').asdatetime:=dt.date+1-sekond1;
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

procedure TREPORT_ITOG_MOVE_DETAL.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
begin
   dt.date:=date();
   TW.tag:=0; TW.text:='¬се товары';
   KLN.tag:=0;
   Mes.itemindex:=0;
   mes1.value:=3;
   mes2.value:=6;
   ChangeKLN;
   mesChange(sender);
end;

procedure TREPORT_ITOG_MOVE_DETAL.ChangeKLN;
begin
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork,'select kln_full from kln_data(:kln_id)');
  QueryWork.ParamByname('kln_id').asinteger:=KLN.tag;
  QueryWork.Open;
  KLN.text:=QueryWork.fieldByname('kln_full').asstring;
  QueryWork.Close;
end;


procedure TREPORT_ITOG_MOVE_DETAL.BtnDicClick(Sender: TObject);
begin
     DicTowarSet:=3; {¬вод одной группы товаров}
     DIC_TOWAR.tag:=TW.tag;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {ќтображаем название}
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

procedure TREPORT_ITOG_MOVE_DETAL.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:=REPORT_TITLE;
end;

procedure TREPORT_ITOG_MOVE_DETAL.BtnPrintClick(Sender: TObject);
begin
     QueryRep1.DisableControls;
     FrReport1.ShowReport;
     QueryRep1.EnableControls;
end;

procedure TREPORT_ITOG_MOVE_DETAL.MesChange(Sender: TObject);
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

procedure TREPORT_ITOG_MOVE_DETAL.SpeedButton1Click(Sender: TObject);
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

procedure TREPORT_ITOG_MOVE_DETAL.QueryRep1AfterOpen(DataSet: TDataSet);
begin
  BtnPrint.enabled:=not QueryRep1.eof;
end;

procedure TREPORT_ITOG_MOVE_DETAL.QueryRep1CalcFields(DataSet: TDataSet);
begin
   if QueryRep1.fieldByname('valuta_id').asinteger=0
     then QueryRep1.fieldByname('valuta_full').asstring:='–уб.';
   if QueryRep1.fieldByname('valuta_id').asinteger=1
     then QueryRep1.fieldByname('valuta_full').asstring:='USD';
end;

end.

