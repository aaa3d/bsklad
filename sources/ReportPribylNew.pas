unit ReportPribylNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, StdCtrls, Db, IBCustomDataSet, IBQuery,
  IBDatabase, RxLookup, Mask, ToolEdit, Buttons, ExtCtrls, DualList,
  ppMemo, ppCtrls, ppDB, ppDBPipe, ppDBBDE, RxMemDS, DBTables, MemTable,
  ppBands, ppClass, ppStrtch, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, ComCtrls,VclUtils, IBTable, CurrEdit, Grids, DBGrids,
  RXDBCtrl, DBCtrls, ImgList, FR_Class, FR_DSet, FR_DBSet,WaitForm, excel2000, OleServer, ComObj;

type
  TREPORT_PRIBYL_NEW = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    GroupBox2: TGroupBox;
    TW1: TRadioButton;
    TW2: TRadioButton;
    TW: TEdit;
    BtnDic: TSpeedButton;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    BtnPntyp: TSpeedButton;
    GroupBox4: TGroupBox;
    Edit2: TEdit;
    BtnRnTyp: TSpeedButton;
    BtnStart: TButton;
    BtnClose: TButton;
    DualListDialog1: TDualListDialog;
    DualListDialog2: TDualListDialog;
    DualListDialog3: TDualListDialog;
    StatusBar1: TStatusBar;
    BtnStop: TButton;
    CalcTransaction: TIBTransaction;
    QueryCalc1: TIBQuery;
    QueryCalc2: TIBQuery;
    QueryCalc3: TIBQuery;
    QueryCalc4: TIBQuery;
    QueryCalc5: TIBQuery;
    QueryCalc6: TIBQuery;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    DicTransaction: TIBTransaction;
    DicMen: TIBQuery;
    DsMen: TDataSource;
    DicMenOWNER_ID: TIntegerField;
    DicMenOWNER_FULL: TIBStringField;
    MemRep: TRxMemoryData;
    MemReptw_id: TIntegerField;
    MemReptw_art: TIntegerField;
    MemReptw_nam: TStringField;
    MemReptwtree_full: TStringField;
    MemReped_short: TStringField;
    DsRep: TDataSource;
    MemReppost_kol: TFloatField;
    MemReppost_seb: TFloatField;
    MemReppost_nds: TFloatField;
    MemReppost_seb2: TFloatField;
    MemReppost_nds2: TFloatField;
    MemReppost_wozw_kol: TFloatField;
    MemReppost_wozw_seb: TFloatField;
    MemReppost_wozw_nds: TFloatField;
    MemReppost_wozw_seb2: TFloatField;
    MemReppost_wozw_nds2: TFloatField;
    MemReprn_kol: TFloatField;
    MemReprn_sum: TFloatField;
    MemReprn_seb: TFloatField;
    MemReprn_nds: TFloatField;
    MemReprn_sum2: TFloatField;
    MemReprn_seb2: TFloatField;
    MemReprn_nds2: TFloatField;
    MemReprn_wozw_kol: TFloatField;
    MemReprn_wozw_sum: TFloatField;
    MemReprn_wozw_seb: TFloatField;
    MemReprn_wozw_nds: TFloatField;
    MemReprn_wozw_sum2: TFloatField;
    MemReprn_wozw_seb2: TFloatField;
    MemReprn_wozw_nds2: TFloatField;
    MemReprn_nac: TFloatField;
    MemReprn_nac2: TFloatField;
    MemReprn_ub: TFloatField;
    MemReprn_ub2: TFloatField;
    MemRepnac: TFloatField;
    MemRepnac2: TFloatField;
    MemRepub: TFloatField;
    MemRepub2: TFloatField;
    MemRepspis_kol: TFloatField;
    MemRepspis_seb: TFloatField;
    MemRepspis_nds: TFloatField;
    MemRepspis_seb2: TFloatField;
    MemRepspis_nds2: TFloatField;
    MemRepost1: TFloatField;
    MemRepost1_seb: TFloatField;
    MemRepost1_nds: TFloatField;
    MemRepost1_seb2: TFloatField;
    MemRepost1_nds2: TFloatField;
    MemRepost2: TFloatField;
    MemRepost2_seb: TFloatField;
    MemRepost2_nds: TFloatField;
    MemRepost2_seb2: TFloatField;
    MemRepost2_nds2: TFloatField;
    Check_Ost1: TCheckBox;
    Check_PN: TCheckBox;
    Check_RN: TCheckBox;
    Check_spis: TCheckBox;
    Check_ost2: TCheckBox;
    frRep: TfrDBDataSet;
    Rep1: TfrReport;
    MemReptwtree_id: TIntegerField;
    Rep2: TfrReport;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    MemReppost_kwm: TFloatField;
    frReport1: TfrReport;
    BtnDynDic: TSpeedButton;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    Label8: TLabel;
    FRM: TRxDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure TW2Click(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure BtnRnTypClick(Sender: TObject);
    procedure BtnPntypClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure Rep1GetValue(const ParName: String; var ParValue: Variant);
    procedure Rep2GetValue(const ParName: String; var ParValue: Variant);
    procedure ExpExcel1;
    procedure ExpExcel2;
    procedure BtnDynDicClick(Sender: TObject);
    procedure ExpCalc1;
    procedure Button1Click(Sender: TObject);
    procedure ExpCalc2;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    tw_group_id: integer;
    tW_group_typ:integer;
  public
    { Public declarations }
  end;


var
  REPORT_PRIBYL_NEW: TREPORT_PRIBYL_NEW;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов  

implementation

uses DicTowar, DicTwDynGroup;

{$R *.DFM}

type
  twtree=record
    ID:integer;
    NAME:ansistring;
  end;
  subrectw=record
    KOL:double; // Кол-во
    NSP:double; // Налог с продаж
    NSPD:double; // Налог с продаж $
    NDSR:double; // НДС с продажи
    NDSRD:double; // НДС с продажи в $
    NSP_R:double; // Налог с продаж
    NSPD_R:double; // Налог с продаж $
    NDSR_R:double; // НДС с продажи
    NDSRD_R:double; // НДС с продажи в $
    SUM:double;  // Сумма выручки
    SUMD:double;
    SUM_R:double;
    SUMD_R:double;
    SEB:double; //себестоимость
    NDS:double; //НДС
    SEBD:double; //себестоимостьв $
    NDSD:double; //НДС в $
    KOL_R:double; //Кол-во (исключение)
    SEB_R:double; //себестоимость (исключение)
    NDS_R:double; // НДС (исключение)
    SEBD_R:double; //себестоимость в $ (исключение)
    NDSD_R:double; // НДС в $ (исключение)
  end;
  rectw=record
    MEN:integer; //Менеджер
    SKL:integer; //Склад
    SHOP:integer; // Магазин
    OST1:subrectw; // Начальный остаток
    POST:subrectw; // Поступило явно по приходу
    POST_PSORT:subrectw; // Поступило по пересортице
    POST_STORNO:subrectw; // Поступило по сторно расхода
    RN:subrectw; // Явный расход
    RN_STORNO:subrectw; // Сторно расхода
    RN_PSORT:subrectw; // Расход по пересортице
    RN_PN_STORNO:subrectw; // Расход по сторно прихода
    SPIS:subrectw; // Расход по списанию
    OST2:subrectw; // Конечный остаток;
    PRIB:double; // Наценка
    PRIBD:double; // Наценка в $
    PRIB_R:double; // Наценка (исключение)
    PRIBD_R:double; // Наценка в $ (исключение)
    UBYT:double; // убытки
    UBYTD:double; // убытки в $
    UBYT_R:double; // убытки (исключение)
    UBYTD_R:double; // убытки в $ (исключение)
  end;

var
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  report_title_tmp:string;
  CAN_ALL_TWTREE:boolean;


procedure TREPORT_PRIBYL_NEW.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
begin
     CAN_ALL_TWTREE:=check_dostup('$REPORT.PRIBYL.WIDE.ALL_TWTREE');
     DicTransaction.Active:=False;
     DicMen.close;
     DicMen.open;

     RNTYP_S:=' ';
     PNTYP_S:=' ';
     if CAN_ALL_TWTREE then begin
        TW.tag:=0;
        TW.text:='Все товары';
        TW1.checked:=true;
     end else begin
        WorkTransaction.Active:=False;
        OPEN_SQL(QueryWork,'select twtree_id,twtree_full from twtree where parent_id=0 order by twtree_full');
        if QueryWork.eof then begin
        end else begin
                TW.tag:=QueryWork.fieldByname('twtree_id').asinteger;
                TW.text:=QueryWork.fieldByname('twtree_full').asstring;
                TW2.checked:=true;
                TW1.enabled:=False;
        end;
        QueryWork.close;
     end;
     DT1.date:=date()-1;
     DT2.date:=date();

     TW2Click(Sender);
     // Заполняем перечень расходных
     s4:='';
     s3:='';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP order by RNTYP_ID');
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
     s3 := s3+'%';
     RNTYP_S:=s3;

     // Заполняем перечень приходных
     s4:='';
     s3:='';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
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
     s3 := s3+'%';
     Edit1.text:=s4;
     PNTYP_S:=s3;
  tw_group_id:=0;
  tw_group_typ:=3;  //просто все товары


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

procedure TREPORT_PRIBYL_NEW.TW2Click(Sender: TObject);
begin
     if TW1.Checked=true
     then
     begin
          tw.Text:= 'Все товары';
          tw_group_id:=0;
          tw_group_typ:=3
     end;
end;

procedure TREPORT_PRIBYL_NEW.BtnDicClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     if tw_group_typ=3 then
       DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       tw2.Checked:=true;
       tw_group_id:=DIC_TOWAR.tag;
       tw_group_typ:=3;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
     end;
end;

procedure TREPORT_PRIBYL_NEW.BtnRnTypClick(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=false;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP order by RNTYP_ID');
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
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        s := s+'%';
        RNTYP_S:=s;
        Edit2.text:=s2;
     end;
end;

procedure TREPORT_PRIBYL_NEW.BtnPntypClick(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=false;
     OPEN_SQL(QueryWork,'select PNTYP_SHORT,PNTYP_ID from PNTYP order by PNTYP_ID');
     s:='';
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
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        s := s+'%';
        PNTYP_S:=s;
        Edit1.text:=s2;
     end;
end;

procedure TREPORT_PRIBYL_NEW.BtnCloseClick(Sender: TObject);
begin
        close;
end;

procedure TREPORT_PRIBYL_NEW.BtnStartClick(Sender: TObject);
var
  a:integer;
  DATE1,DATE2:tdatetime;
  s:string;
  all,cnt:integer;
  post_kol,post_seb,post_nds,Post_sebD,post_ndsD:double;
  post_wozw_kol,post_wozw_seb,post_wozw_nds,post_wozw_sebD,post_wozw_ndsD:double;
  rn_kol,rn_sum,rn_seb,rn_nds,rn_sumD,rn_sebD,rn_ndsD:double;
  rn_wozw_kol,rn_wozw_sum,rn_wozw_seb,rn_wozw_nds,rn_wozw_sumD,rn_wozw_sebD,rn_wozw_ndsD:double;
  rn_nac,rn_nacD,rn_ub,rn_ubD:double;
  nac,nacD,ub,ubD:double;
  spis_kol,spis_seb,spis_nds,spis_sebD,spis_ndsD:double;
  ost1,ost1_seb,ost1_nds,ost1_sebD,ost1_ndsD:double;
  ost2,ost2_seb,ost2_nds,ost2_sebD,ost2_ndsD:double;
  fil1,fil2,fil3,fil4:textfile;
  s1,s2,s3,s4:string;
begin
   BtnStop.Enabled:=true;
   BtnStop.tag:=0;
   button1.Enabled:=false;
   button2.Enabled:=false;

   MemRep.EmptyTable;

   report_title_tmp:='По фирме: '+FRM.Text+ ' за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
   if tw1.checked then report_title_tmp:=report_title_tmp+', все группы товаров, '
   else report_title_tmp:=report_title_tmp+', группа товаров: "'+tw.text+'", ';
   report_title_tmp:=report_title_tmp+'закупленные за все время работы, ';
   report_title_tmp:=report_title_tmp+'приходные накладные: '+edit1.text+', Расходные накладные: '+Edit2.text+', ';
   report_title_tmp:=report_title_tmp+'валюта товара: ';
   report_title_tmp:=trim(report_title_tmp);
   if b_utils.right(report_title_tmp,1)=',' then
   report_title_tmp:=b_utils.left(report_title_tmp,length(report_title_tmp)-1);
   PNTYP_S:=' '+PNTYP_S+' ';
   for a:=1 to length(PNTYP_S) do if PNTYP_S[a]=',' then PNTYP_S[a]:=' ';
   RNTYP_S:=' '+RNTYP_S+' ';
   for a:=1 to length(RNTYP_S) do if RNTYP_S[a]=',' then RNTYP_S[a]:=' ';
   DATE1:=DT1.date;
   DATE2:=DT2.date+1-sekond1;
   Wait_Form.StatusBar1.Panels[0].text:='Определяем число товаров для расчета....';
   Wait_Form.Gauge1.Progress:=2;
   Wait_Form.Show;
   delay(1);
   // Отбор товаров
   // Определяем кол-во
   CalcTransaction.Active:=False;
   s:='select count(tw.tw_id) as c from tw, LIST_TWDYNGROUP(:typ, :id) where tw.tw_id = LIST_TWDYNGROUP.tw_id ';
   ADD_SQL(QueryCalc1,s);
   QueryCalc1.ParamByname('ID').asinteger:=tw_group_id;
   QueryCalc1.ParamByname('TYP').asinteger:=tw_group_typ;
   QueryCalc1.open;
   if QueryCalc1.eof then all:=0 else all:=QueryCalc1.fieldByname('c').asinteger;
   MemRep.DisableControls;
   if all=0 then begin
      Wait_Form.Hide;
      messbox('Список товаров пуст!',MessSystem,48)
   end else begin
     Wait_Form.StatusBar1.Panels[0].text:='Подготовка к расчету ....';
     Wait_Form.Gauge1.Progress:=4;
     Wait_Form.SHow;
     delay(1);
     s:='select (select twtree_nam from TWTREE_FULL(LIST_TWDYNGROUP.twtree_id,"")) as twtree_full, '+
     ' tw.tw_nam,tw.tw_id,tw.tw_art,ed.ed_short,LIST_TWDYNGROUP.twtree_id, bg_abs(tw_length*tw_width) tw_kwm_one  '+
     ' from  tw,ed, LIST_TWDYNGROUP(:TYP, :ID) '+
     ' where tw.tw_id=LIST_TWDYNGROUP.tw_id '+
     ' and tw.ed_id=ed.ed_id  order by 1,2';
     ADD_SQL(QueryCalc1,s);

     QueryCalc1.ParamByname('ID').asinteger:=tw_group_id;
     QueryCalc1.ParamByname('TYP').asinteger:=tw_group_typ;




     cnt:=0;
     QueryCalc1.Open;
     Wait_Form.StatusBar1.Panels[0].text:='Идет расчет. 1 из '+inttostr(all)+' ...';
     Wait_Form.Show;
     delay(1);
     while (not QueryCalc1.eof) and (BtnStop.tag=0) do begin
        inc(cnt);
        if cnt mod 20=0 then begin
          Wait_Form.StatusBar1.Panels[0].text:='Идет расчет. '+inttostr(cnt)+' из '+inttostr(all)+' ...';
          Wait_Form.Gauge1.Progress:=5+trunc(95*(cnt/all));
          Wait_Form.Show;
          delay(1);
        end;

        post_kol:=0; post_seb:=0; post_nds:=0;  post_sebD:=0; post_ndsD:=0;
        post_wozw_kol:=0; post_wozw_seb:=0; post_wozw_nds:=0; post_wozw_sebD:=0; post_wozw_ndsD:=0;
        rn_kol:=0; rn_sum:=0; rn_seb:=0; rn_nds:=0; rn_sumD:=0; rn_sebD:=0; rn_ndsD:=0;
        rn_wozw_kol:=0; rn_wozw_sum:=0; rn_wozw_seb:=0; rn_wozw_nds:=0; rn_wozw_sumD:=0; rn_wozw_sebD:=0; rn_wozw_ndsD:=0;
        rn_nac:=0; rn_nacD:=0; rn_ub:=0; rn_ubD:=0;
        spis_kol:=0; spis_seb:=0; spis_nds:=0; spis_sebD:=0; spis_ndsD:=0;
        nac:=0; nacD:=0; ub:=0; ubD:=0;
        ost1:=0; ost1_seb:=0; ost1_nds:=0; ost1_sebD:=0; ost1_ndsD:=0;
        ost2:=0; ost2_seb:=0; ost2_nds:=0; ost2_sebD:=0; ost2_ndsD:=0;

        if check_ost1.checked then begin
          // начальный остаток
          ADD_SQL(QueryCalc2,'select * from reportwide_ost(:tw_id, :dt, :PNTYPS, :in_frm_id)');
          QueryCalc2.paramByname('tw_id').asinteger:=QueryCalc1.fieldbyname('tw_id').asinteger;
          QueryCalc2.paramByname('dt').asdatetime:=Date1;
          QueryCalc2.paramByname('PNTYPS').asstring:=PNTYP_S;
          QueryCalc2.ParamByname('IN_FRM_ID').asstring:=FRM.Value;
          QueryCalc2.Open;
          if not QueryCalc2.eof then
          begin
               ost1:=QueryCalc2.fieldByname('ost_kol').asfloat;
               ost1_seb:=QueryCalc2.fieldByname('seb_summ').asfloat;
          end;
        end;

        if check_ost2.checked then begin
          // конечный остаток
          ADD_SQL(QueryCalc2,'select * from reportwide_ost(:tw_id, :dt, :PNTYPS, :in_frm_id)');
          QueryCalc2.paramByname('tw_id').asinteger:=QueryCalc1.fieldbyname('tw_id').asinteger;
          QueryCalc2.paramByname('dt').asdatetime:=Date2;
          QueryCalc2.paramByname('PNTYPS').asstring:=PNTYP_S;
          QueryCalc2.ParamByname('IN_FRM_ID').asstring:=FRM.Value;
          QueryCalc2.Open;
          if not QueryCalc2.eof then
          begin
               ost2:=QueryCalc2.fieldByname('ost_kol').asfloat;
               ost2_seb:=QueryCalc2.fieldByname('seb_summ').asfloat;
          end;
        end;



        // Запрашиваем списания
        if check_spis.checked then begin
          ADD_SQL(QueryCalc2,'select * from reportwide_spis(:tw_id,:dt1,:dt2, :in_frm_id)');
          QueryCalc2.paramByname('tw_id').asinteger:=QueryCalc1.fieldbyname('tw_id').asinteger;
          QueryCalc2.paramByname('dt1').asdatetime:=Date1;
          QueryCalc2.paramByname('dt2').asdatetime:=Date2;
          QueryCalc2.ParamByname('IN_FRM_ID').asstring:=FRM.Value;
          QueryCalc2.Open;          
          if not QueryCalc2.eof then
          begin
               spis_kol:=QueryCalc2.fieldByname('spis_kol').asfloat;
               spis_seb:=QueryCalc2.fieldByname('spis_seb').asfloat;
               nac:=nac-QueryCalc2.fieldByname('spis_seb').asfloat;
               ub:=ub-QueryCalc2.fieldByname('spis_seb').asfloat;
          end;
        end;

        if check_rn.checked then begin
          // Запрашиваем продажи
          ADD_SQL(QueryCalc2,'select * from reportwide_rn(:tw_id,:dt1,:dt2, :RNTYPS, :IN_FRM_ID)');
          QueryCalc2.paramByname('tw_id').asinteger:=QueryCalc1.fieldbyname('tw_id').asinteger;
          QueryCalc2.paramByname('dt1').asdatetime:=Date1;
          QueryCalc2.paramByname('dt2').asdatetime:=Date2;
          QueryCalc2.paramByname('RNTYPS').asstring:=RNTYP_S;
          QueryCalc2.ParamByname('IN_FRM_ID').asstring:=FRM.Value;
          QueryCalc2.Open;
          if not QueryCalc2.eof then
          begin
            // проверяем соответствие с расходом
                  // явный расход
                  rn_kol:=QueryCalc2.fieldByname('rn_kol').asfloat;
                  rn_sum:=QueryCalc2.fieldByname('rn_summ').asfloat;
                  rn_seb:=QueryCalc2.fieldByname('rn_seb').asfloat;
                  nac:=nac+QueryCalc2.fieldByname('rn_nac').asfloat;

                  rn_nac:=QueryCalc2.fieldByname('rn_nac').asfloat;
                  rn_ub:=QueryCalc2.fieldByname('rn_ub').asfloat;
{
                  if QueryCalc2.fieldByname('rn_nac').asfloat<0
                    then rn_ub:=rn_ub+QueryCalc2.fieldByname('calc_kol').asfloat*QueryCalc2.fieldByname('nac').asfloat;
                  if QueryCalc2.fieldByname('nac$').asfloat<0 then rn_ubD:=rn_ubD+QueryCalc2.fieldByname('calc_kol').asfloat*QueryCalc2.fieldByname('nac$').asfloat;
}
{                  if QueryCalc2.fieldByname('nac').asfloat<0 then ub:=ub+QueryCalc2.fieldByname('calc_kol').asfloat*QueryCalc2.fieldByname('nac').asfloat;
                  if QueryCalc2.fieldByname('nac$').asfloat<0 then ubD:=ubD+QueryCalc2.fieldByname('calc_kol').asfloat*QueryCalc2.fieldByname('nac$').asfloat;
}
                  // сторно расхода
                  rn_wozw_kol:=QueryCalc2.fieldByname('wozw_kol').asfloat;
                  rn_wozw_sum:=QueryCalc2.fieldByname('wozw_summ').asfloat;
                  rn_wozw_seb:=QueryCalc2.fieldByname('wozw_seb').asfloat;
                  nac:=nac+QueryCalc2.fieldByname('wozw_nac').asfloat;
{                  if QueryCalc2.fieldByname('nac').asfloat<0 then ub:=ub+QueryCalc2.fieldByname('calc_kol').asfloat*QueryCalc2.fieldByname('nac').asfloat;
                  if QueryCalc2.fieldByname('nac$').asfloat<0 then ubD:=ubD+QueryCalc2.fieldByname('calc_kol').asfloat*QueryCalc2.fieldByname('nac$').asfloat;
}
          end;
          QueryCalc2.close;
        end;

        if check_pn.checked then begin
          // Запрашиваем поставки
          ADD_SQL(QueryCalc2,'select * from reportwide_post(:tw_id,:dt1,:dt2, :PNTYPS, :IN_FRM_ID)');
          QueryCalc2.paramByname('tw_id').asinteger:=QueryCalc1.fieldbyname('tw_id').asinteger;
          QueryCalc2.paramByname('dt1').asdatetime:=Date1;
          QueryCalc2.paramByname('dt2').asdatetime:=Date2;
          QueryCalc2.paramByname('PNTYPS').asstring:=PNTYP_S;
          QueryCalc2.ParamByname('IN_FRM_ID').asstring:=FRM.Value;
          QueryCalc2.Open;
          if not QueryCalc2.eof then
          begin

                    post_kol:=QueryCalc2.fieldByname('post_kol').asfloat;
                    post_seb:=QueryCalc2.fieldByname('post_seb').asfloat;
                    post_wozw_kol:=QueryCalc2.fieldByname('wozw_kol').asfloat;
                    post_wozw_seb:=QueryCalc2.fieldByname('wozw_seb').asfloat;
          
          end;
          QueryCalc2.close;
        end;
        // с приходом закончили
        if (post_kol<>0) or (post_wozw_kol<>0) or (rn_kol<>0) or (rn_wozw_kol<>0) or (rn_nac<>0) or (nac<>0) or (ub<>0) or (spis_kol<>0) or (ost1<>0) or (ost2<>0) then begin
           MemRep.append;
           MemRep.fieldByname('tw_id').asinteger:=QueryCalc1.fieldbyname('tw_id').asinteger;
           MemRep.fieldByname('twtree_id').asinteger:=QueryCalc1.fieldbyname('twtree_id').asinteger;
           MemRep.fieldByname('tw_art').asinteger:=QueryCalc1.fieldbyname('tw_art').asinteger;
           MemRep.fieldByname('tw_nam').asstring:=QueryCalc1.fieldbyname('tw_nam').asstring;
           MemRep.fieldByname('ed_short').asstring:=QueryCalc1.fieldbyname('ed_short').asstring;
           MemRep.fieldByname('twtree_full').asstring:=QueryCalc1.fieldbyname('twtree_full').asstring;
           MemRep.fieldByname('tw_kwm_one').asfloat:=QueryCalc1.fieldbyname('tw_kwm_one').asfloat;

           MemRep.fieldByname('ost1').asfloat:=ost1;
           MemRep.fieldByname('ost1_seb').asfloat:=ost1_seb;
           MemRep.fieldByname('ost1_nds').asfloat:=ost1_nds;
           MemRep.fieldByname('ost1_seb$').asfloat:=ost1_sebD;
           MemRep.fieldByname('ost1_nds$').asfloat:=ost1_ndsD;

           MemRep.fieldByname('ost2').asfloat:=ost2;
           MemRep.fieldByname('ost2_seb').asfloat:=ost2_seb;
           MemRep.fieldByname('ost2_nds').asfloat:=ost2_nds;
           MemRep.fieldByname('ost2_seb$').asfloat:=ost2_sebD;
           MemRep.fieldByname('ost2_nds$').asfloat:=ost2_ndsD;


           MemRep.fieldByname('spis_kol').asfloat:=spis_kol;
           MemRep.fieldByname('spis_seb').asfloat:=spis_seb;
           MemRep.fieldByname('spis_nds').asfloat:=spis_nds;
           MemRep.fieldByname('spis_seb$').asfloat:=spis_sebD;
           MemRep.fieldByname('spis_nds$').asfloat:=spis_ndsD;

           MemRep.fieldByname('rn_kol').asfloat:=rn_kol;
           MemRep.fieldByname('rn_sum').asfloat:=rn_sum;
           MemRep.fieldByname('rn_seb').asfloat:=rn_seb;
           MemRep.fieldByname('rn_nds').asfloat:=rn_nds;
           MemRep.fieldByname('rn_sum$').asfloat:=rn_sumD;
           MemRep.fieldByname('rn_seb$').asfloat:=rn_sebD;
           MemRep.fieldByname('rn_nds$').asfloat:=rn_ndsD;
           MemRep.fieldByname('rn_wozw_kol').asfloat:=rn_wozw_kol;
           MemRep.fieldByname('rn_wozw_sum').asfloat:=rn_wozw_sum;
           MemRep.fieldByname('rn_wozw_seb').asfloat:=rn_wozw_seb;
           MemRep.fieldByname('rn_wozw_nds').asfloat:=rn_wozw_nds;
           MemRep.fieldByname('rn_wozw_sum$').asfloat:=rn_wozw_sumD;
           MemRep.fieldByname('rn_wozw_seb$').asfloat:=rn_wozw_sebD;
           MemRep.fieldByname('rn_wozw_nds$').asfloat:=rn_wozw_ndsD;
           MemRep.fieldByname('rn_nac').asfloat:=rn_nac;
           MemRep.fieldByname('rn_nac$').asfloat:=rn_nacD;
           MemRep.fieldByname('rn_ub').asfloat:=rn_ub;
           MemRep.fieldByname('rn_ub$').asfloat:=rn_ubD;

           MemRep.fieldByname('nac').asfloat:=nac;
           MemRep.fieldByname('nac$').asfloat:=nacD;
           MemRep.fieldByname('ub').asfloat:=ub;
           MemRep.fieldByname('ub$').asfloat:=ubD;

           MemRep.fieldByname('post_kol').asfloat:=post_kol;
           MemRep.fieldByname('post_seb').asfloat:=post_seb;
           MemRep.fieldByname('post_nds').asfloat:=post_nds;
           MemRep.fieldByname('post_seb$').asfloat:=post_sebD;
           MemRep.fieldByname('post_nds$').asfloat:=post_ndsD;
           MemRep.fieldByname('post_wozw_kol').asfloat:=post_wozw_kol;
           MemRep.fieldByname('post_wozw_seb').asfloat:=post_wozw_seb;
           MemRep.fieldByname('post_wozw_nds').asfloat:=post_wozw_nds;
           MemRep.fieldByname('post_wozw_seb$').asfloat:=post_wozw_sebD;
           MemRep.fieldByname('post_wozw_nds$').asfloat:=post_wozw_ndsD;

           MemRep.Post;
        end;

        // Собственно сам расчет
        // Нужно запросить всю приходную часть
//        statusbar1.panels[1].text:='Код='+QueryCalc1.FieldByname('TW_ART').asstring+' '+
//        QueryCalc1.FieldByname('TW_NAM').asstring;
//        delay(1);
        QueryCalc1.Next;
     end;
   end;
{   assignfile(fil1,'d:\rep1.html');
   rewrite(fil1);
   // записываем  стандартный заголовок
   writeln(fil1,'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"');
   writeln(fil1,'"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">');
   writeln(fil1,'<html xmlns="http://www.w3.org/1999/xhtml" xm:lang="en" lang="en">');
   writeln(fil1,'<head>');
   writeln(fil1,'<title>Групповой расширенный отчет о движении в рублях</title>');
   writeln(fil1,'<meta name="autor" content="Бритвин Сергей"></meta>');
   writeln(fil1,'<meta name="Year" content="2003"></meta>');
   writeln(fil1,'</head>');
   // записываем название отчета
   writeln(fil1,'Групповой отчет о движении в рублях '+report_title_tmp);
   // формируем шапку
   writeln(fil1,'<table border="1">');
   writeln(fil1,'<tr align="center" valign="middle">');
   s1:='<tr align="center" valign="middle">';
   s2:='<tr align="center" valign="middle">';
   s3:='';
   if check_ost1.checked then begin
      s1:=s1+'<td colspan="2">Начальный остаток</td>';
      s2:=s2+'<td>Себестоимость</td>';
      s2:=s2+'<td>НДС</td>';
   end;
   if check_pn.checked then begin
      s1:=s1+'<td colspan="2">Приход</td>';
      s2:=s2+'<td>Себестоимость</td>';
      s2:=s2+'<td>НДС</td>';

      s1:=s1+'<td colspan="2">Сторно прихода</td>';
      s2:=s2+'<td>Себестоимость</td>';
      s2:=s2+'<td>НДС</td>';
   end;
   if check_rn.checked then begin
      s1:=s1+'<td colspan="5">Расход</td>';
      s2:=s2+'<td>Оборот</td>';
      s2:=s2+'<td>Себестоимость</td>';
      s2:=s2+'<td>НДС</td>';
      s2:=s2+'<td>Наценка</td>';
      s2:=s2+'<td>В т.ч. убыток</td>';

      s1:=s1+'<td colspan="3">Сторно расхода</td>';
      s2:=s2+'<td>Оборот</td>';
      s2:=s2+'<td>Себестоимость</td>';
      s2:=s2+'<td>НДС</td>';
   end;
   if check_spis.checked then begin
      s1:=s1+'<td colspan="2">Списано</td>';
      s2:=s2+'<td>Себестоимость</td>';
      s2:=s2+'<td>НДС</td>';
   end;
   if check_ost2.checked then begin
      s1:=s1+'<td colspan="2">Конечный остаток</td>';
      s2:=s2+'<td>Себестоимость</td>';
      s2:=s2+'<td>НДС</td>';
   end;
   s1:=s1+'</tr>';
   s2:=s2+'</tr>';
   writeln(fil1,s1);
   writeln(fil1,s2);
   MemRep.first;
   while not MemRep.eof do begin
      MemRep.next;
   end;

   // завершающие теги
   writeln(fil1,'</table>');
   writeln(fil1,'</html>');
   closefile(fil1);}
   MemRep.first;
   MemRep.EnableControls;
   Wait_Form.Hide;
   Rep1.ShowReport;
   Rep2.ShowReport;
   BtnStop.Enabled:=false;
   button1.Enabled:=not memrep.IsEmpty;
   button2.Enabled:=not memrep.IsEmpty;
   BtnStart.Enabled:=true;
   statusbar1.panels[1].text:='';
   statusbar1.panels[0].text:='';
end;

procedure TREPORT_PRIBYL_NEW.BtnStopClick(Sender: TObject);
begin
   BtnStop.tag:=1;
end;

procedure TREPORT_PRIBYL_NEW.Rep1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='TITLE' then
    ParValue:=report_title_tmp;
  if ParName='CLOSE_DAY' then
    ParValue:=date_sokr(Global_close_day);
  if ParName='USERFIO' then
    ParValue:=userfio;
  if ParName='PCNAME' then
    ParValue:=Computername;
end;

procedure TREPORT_PRIBYL_NEW.Rep2GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='TITLE' then
    ParValue:=report_title_tmp;
  if ParName='CLOSE_DAY' then
    ParValue:=date_sokr(Global_close_day);
  if ParName='USERFIO' then
    ParValue:=userfio;
  if ParName='PCNAME' then
    ParValue:=Computername;
end;

procedure TREPORT_PRIBYL_NEW.ExpExcel1;
var excel: TExcelApplication;
    r: Range;
    v : olevariant;
     _rng : Range;
    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
    twtree_id: integer;
    groupsCount: integer;
begin
    {Узнать, чколько групп товара в отчете. добавить это количество}
    memrep.First;
    groupsCount:=0;
    twtree_id := 0;
    for iRow:=0 to memrep.RecordCount-1 do
    begin
      if  memrep.fieldbyname('twtree_id').asinteger<> twtree_id then
      begin
        inc(groupsCount);
        twtree_id := memrep.fieldbyname('twtree_id').asinteger;
      end;
      memrep.Next;
    end;

    twtree_id:=0;
    memrep.First;

    try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;


    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\detal.xlt', 0);
    v := VarArrayCreate([0, memrep.RecordCount+groupsCount, 0, 25], varVariant);

    iRow := 0;
    while  iRow < memrep.RecordCount+groupsCount do
     begin
        if  memrep.fieldbyname('twtree_id').asinteger <> twtree_id then

        begin
          v[iRow, 0] := memrep.fieldbyname('twtree_full').asvariant;
          _rng := excel.Range[excel.Cells.Item[iRow + 8, 1],  excel.Cells.Item[iRow +8 , 25 ]];
          _rng.Font.Size := 12;
          _rng.Font.Bold := True;

          inc(irow);
          twtree_id := memrep.fieldbyname('twtree_id').asinteger;
        end ;
        
        begin
          v[iRow, 0] := memrep.fieldbyname('tw_art').asvariant;
          v[iRow, 1] := memrep.fieldbyname('tw_nam').asvariant;
          v[iRow, 2] := memrep.fieldbyname('ost1').asvariant;
          v[iRow, 3] := memrep.fieldbyname('ost1').asvariant*memrep.fieldbyname('tw_kwm_one').asvariant;
          v[iRow, 4] := memrep.fieldbyname('ost1_seb').asvariant;
          v[iRow, 5] := memrep.fieldbyname('post_kol').asvariant;
          v[iRow, 6] := memrep.fieldbyname('post_kol').asvariant*memrep.fieldbyname('tw_kwm_one').asvariant;;
          v[iRow, 7] := memrep.fieldbyname('post_seb').asvariant;
          v[iRow, 8] := memrep.fieldbyname('post_wozw_kol').asvariant;
          v[iRow, 9] := memrep.fieldbyname('post_wozw_seb').asvariant;
          v[iRow, 10] := memrep.fieldbyname('rn_kol').asvariant;
          v[iRow, 11] := memrep.fieldbyname('rn_kol').asvariant*memrep.fieldbyname('tw_kwm_one').asvariant;;
          v[iRow, 12] := memrep.fieldbyname('rn_sum').asvariant;
          v[iRow, 13] := memrep.fieldbyname('rn_seb').asvariant;
          v[iRow, 14] := memrep.fieldbyname('rn_nac').asvariant;
          v[iRow, 15] := memrep.fieldbyname('rn_ub').asvariant;
          v[iRow, 16] := memrep.fieldbyname('rn_wozw_kol').asvariant;
          v[iRow, 17] := memrep.fieldbyname('rn_wozw_sum').asvariant;
          v[iRow, 18] := memrep.fieldbyname('rn_wozw_seb').asvariant;
          v[iRow, 19] := memrep.fieldbyname('spis_kol').asvariant;
          v[iRow, 20] := memrep.fieldbyname('spis_seb').asvariant;
          v[iRow, 21] := memrep.fieldbyname('ost2').asvariant;
          v[iRow, 22] := memrep.fieldbyname('ost2').asvariant*memrep.fieldbyname('tw_kwm_one').asvariant;;
          v[iRow, 23] := memrep.fieldbyname('ost2_seb').asvariant;
          v[iRow, 24] := memrep.fieldbyname('nac').asvariant;
          v[iRow, 25] := memrep.fieldbyname('ub').asvariant;
        end;
        memrep.Next;
        inc(irow);
     end;
    memrep.First;

    r:= excel.Range['A1', 'A1'];
    r.Value := 'Подробный расширенный отчет в рублях:  ' + report_title_tmp;



    r := excel.Range[excel.Cells.Item[8, 1],
      excel.Cells.Item[memrep.RecordCount+groupsCount +8 - 1,26 ]];

    r.Value := v;






    r.Borders[xlEdgeTop].LineStyle := xlContinuous;
    r.Borders[xlEdgeTop].Weight := xlThin;
    r.Borders[xlEdgeTop].ColorIndex := xlAutomatic;


    r.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    r.Borders[xlEdgeBottom].Weight := xlThin;
    r.Borders[xlEdgeBottom].ColorIndex := xlAutomatic;

    r.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    r.Borders[xlInsideHorizontal].Weight := xlThin;
    r.Borders[xlInsideHorizontal].ColorIndex := xlAutomatic;

//    format := '# ##0.00';
//    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
//    r := excel.Range[excel.Cells.Item[emptyParam, 2],   excel.Cells.Item[emptyParam, 22]].EntireColumn;
//    r.NumberFormat := format;
    except
    freeandnil(excel);
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);
end;

procedure TREPORT_PRIBYL_NEW.ExpExcel2;
var excel: TExcelApplication;
    r: Range;
    v : olevariant;
     _rng : Range;
    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
    twtree_id: integer;
    groupsCount: integer;
    j: integer;

begin
    {Узнать, чколько групп товара в отчете. добавить это количество}
    memrep.First;
    groupsCount:=0;
    twtree_id := 0;
    for iRow:=0 to memrep.RecordCount-1 do
    begin
      if  memrep.fieldbyname('twtree_id').asinteger<> twtree_id then
      begin
        inc(groupsCount);
        twtree_id := memrep.fieldbyname('twtree_id').asinteger;
      end;
      memrep.Next;
    end;

    twtree_id:=0;
    memrep.First;

    try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;


    excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\group.xlt', 0);
    v := VarArrayCreate([0, groupsCount, 0, 25], varVariant);



    iRow := 0;
    while  not memrep.Eof do
    begin
          if  (memrep.fieldbyname('twtree_id').asinteger <> twtree_id) then
          begin
            if  twtree_id <> 0 then
            begin
              for j:= 1 to 24 do
                if v[iRow, j] = 0 then v[iRow, j]:=null;
              inc(irow);
            end;
            for j:= 1 to 24 do v[iRow, j] := 0;
            twtree_id := memrep.fieldbyname('twtree_id').asinteger;
          end;


          v[iRow, 0] := memrep.fieldbyname('twtree_full').asvariant;
          v[iRow, 1] := v[iRow, 1]+memrep.fieldbyname('ost1').asfloat;
          v[iRow, 2] := v[iRow, 2]+memrep.fieldbyname('ost1').asfloat*memrep.fieldbyname('tw_kwm_one').asfloat;
          v[iRow, 3] := v[iRow, 3]+memrep.fieldbyname('ost1_seb').asfloat;
          v[iRow, 4] := v[iRow, 4]+memrep.fieldbyname('post_kol').asfloat;
          v[iRow, 5] := v[iRow, 5]+memrep.fieldbyname('post_kol').asfloat*memrep.fieldbyname('tw_kwm_one').asfloat;
          v[iRow, 6] := v[iRow, 6]+memrep.fieldbyname('post_seb').asfloat;
          v[iRow, 7] := v[iRow, 7]+memrep.fieldbyname('post_wozw_kol').asfloat;
          v[iRow, 8] := v[iRow, 8]+memrep.fieldbyname('post_wozw_seb').asfloat;
          v[iRow, 9] := v[iRow, 9]+memrep.fieldbyname('rn_kol').asfloat;
          v[iRow, 10] := v[iRow, 10]+memrep.fieldbyname('rn_kol').asfloat*memrep.fieldbyname('tw_kwm_one').asfloat;
          v[iRow, 11] := v[iRow, 11]+memrep.fieldbyname('rn_sum').asfloat;
          v[iRow, 12] := v[iRow, 12]+memrep.fieldbyname('rn_seb').asfloat;
          v[iRow, 13] := v[iRow, 13]+memrep.fieldbyname('rn_nac').asfloat;
          v[iRow, 14] := v[iRow, 14]+memrep.fieldbyname('rn_ub').asfloat;
          v[iRow, 15] := v[iRow, 15]+memrep.fieldbyname('rn_wozw_kol').asfloat;
          v[iRow, 16] := v[iRow, 16]+memrep.fieldbyname('rn_wozw_sum').asfloat;
          v[iRow, 17] := v[iRow, 17]+memrep.fieldbyname('rn_wozw_seb').asfloat;
          v[iRow, 18] := v[iRow, 18]+memrep.fieldbyname('spis_kol').asfloat;
          v[iRow, 19] := v[iRow, 19]+memrep.fieldbyname('spis_seb').asfloat;
          v[iRow, 20] := v[iRow, 20]+memrep.fieldbyname('ost2').asfloat;
          v[iRow, 21] := v[iRow, 21]+memrep.fieldbyname('ost2').asfloat*memrep.fieldbyname('tw_kwm_one').asfloat;
          v[iRow, 22] := v[iRow, 22]+memrep.fieldbyname('ost2_seb').asfloat;
          v[iRow, 23] := v[iRow, 23]+memrep.fieldbyname('nac').asfloat;
          v[iRow, 24] := v[iRow, 24]+memrep.fieldbyname('ub').asfloat;
        memrep.Next;
    end;
    memrep.First;

    r:= excel.Range['A1', 'A1'];
    r.Value := 'Подробный расширенный отчет в рублях:  ' + report_title_tmp;



    r := excel.Range[excel.Cells.Item[8, 1],
      excel.Cells.Item[groupsCount +8 - 1,26 ]];

    r.Value := v;






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

//    format := '# ##0.00';
//    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);
//    r := excel.Range[excel.Cells.Item[emptyParam, 2],   excel.Cells.Item[emptyParam, 21]].EntireColumn;
//    r.NumberFormat := format;
    except
    freeandnil(excel);
    end;
    excel.Visible[0]:=true;
    freeandnil(excel);
end;

procedure TREPORT_PRIBYL_NEW.BtnDynDicClick(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;
     if tw_group_typ<3 then
      DIC_TW_DYN_GROUP.btnSelect.tag := tw_group_id;

     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      tw2.Checked:=true;
      tw.Text:='* '+ DIC_TW_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      tw_group_id:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      tw_group_typ:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

procedure TREPORT_PRIBYL_NEW.ExpCalc1;
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
    twtree_id: integer;
    groupsCount: integer;
begin
// Открытие CALC
    memrep.First;
    groupsCount:=0;
    twtree_id := 0;
    for iRow:=0 to memrep.RecordCount-1 do
    begin
      if  memrep.fieldbyname('twtree_id').asinteger<> twtree_id then
      begin
        inc(groupsCount);
        twtree_id := memrep.fieldbyname('twtree_id').asinteger;
      end;
      memrep.Next;
    end;

    twtree_id:=0;
    memrep.First;

   try
     ServiceManager := CreateOleObject('com.sun.star.ServiceManager');
   except
     exit;
   end;

   FilePath := 'private:factory/scalc';
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\detal.xlt');
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
    dataArrayBounds[1,0]:=25;
    dataArrayBounds[0,1]:=0;
    dataArrayBounds[1,1]:=memrep.RecordCount+groupsCount+100;




    v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);


    for i := 0 to dataArrayBounds[1,0] do
      for j := 0 to  dataArrayBounds[1,1] do
         v[i,j]:='';

    iRow := 0;
    while  iRow < memrep.RecordCount+groupsCount do
     begin
        if  memrep.fieldbyname('twtree_id').asinteger <> twtree_id then
        begin
          v[0,iRow] := memrep.fieldbyname('twtree_full').asvariant;
          //_rng := excel.Range[excel.Cells.Item[iRow + 8, 1],  excel.Cells.Item[iRow +8 , 25 ]];
          Sheets := Document.GetSheets;
          Sheet := Sheets.GetByName('Лист1');
          cel := Sheet.GetCellByPosition(0,iRow+7);
          cel.charWeight:=150;
          cel.charHeight:=10;

          inc(irow);
          twtree_id := memrep.fieldbyname('twtree_id').asinteger;
        end;

        begin
          v[0,iRow] := memrep.fieldbyname('tw_art').asvariant;
          v[1,iRow] := memrep.fieldbyname('tw_nam').asvariant;
          v[2,iRow] := memrep.fieldbyname('ost1').asvariant;
          v[3,iRow] := memrep.fieldbyname('ost1').asvariant*memrep.fieldbyname('tw_kwm_one').asvariant;
          v[4,iRow] := memrep.fieldbyname('ost1_seb').asvariant;
          v[5,iRow] := memrep.fieldbyname('post_kol').asvariant;
          v[6,iRow] := memrep.fieldbyname('post_kol').asvariant*memrep.fieldbyname('tw_kwm_one').asvariant;;
          v[7,iRow] := memrep.fieldbyname('post_seb').asvariant;
          v[8,iRow] := memrep.fieldbyname('post_wozw_kol').asvariant;
          v[9,iRow] := memrep.fieldbyname('post_wozw_seb').asvariant;
          v[10,iRow] := memrep.fieldbyname('rn_kol').asvariant;
          v[11,iRow] := memrep.fieldbyname('rn_kol').asvariant*memrep.fieldbyname('tw_kwm_one').asvariant;;
          v[12,iRow] := memrep.fieldbyname('rn_sum').asvariant;
          v[13,iRow] := memrep.fieldbyname('rn_seb').asvariant;
          v[14,iRow] := memrep.fieldbyname('rn_nac').asvariant;
          v[15,iRow] := memrep.fieldbyname('rn_ub').asvariant;
          v[16,iRow] := memrep.fieldbyname('rn_wozw_kol').asvariant;
          v[17,iRow] := memrep.fieldbyname('rn_wozw_sum').asvariant;
          v[18,iRow] := memrep.fieldbyname('rn_wozw_seb').asvariant;
          v[19,iRow] := memrep.fieldbyname('spis_kol').asvariant;
          v[20,iRow] := memrep.fieldbyname('spis_seb').asvariant;
          v[21,iRow] := memrep.fieldbyname('ost2').asvariant;
          v[22,iRow] := memrep.fieldbyname('ost2').asvariant*memrep.fieldbyname('tw_kwm_one').asvariant;;
          v[23,iRow] := memrep.fieldbyname('ost2_seb').asvariant;
          v[24,iRow] := memrep.fieldbyname('nac').asvariant;
          v[25,iRow] := memrep.fieldbyname('ub').asvariant;
        end;
        memrep.Next;
        inc(irow);
     end;
     memrep.First;

    Sheets := Document.GetSheets;
    Sheet := Sheets.GetByName('Лист1');
    cel := Sheet.GetCellByPosition(0,0);
    cel.setString('Подробный расширенный отчет в рублях:  ' + report_title_tmp);

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

procedure TREPORT_PRIBYL_NEW.Button1Click(Sender: TObject);
var excel: TExcelApplication;
begin
  try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
    ExpExcel1;
  except
    ExpCalc1;
  end;
end;

procedure TREPORT_PRIBYL_NEW.ExpCalc2;
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
    i,j,k: integer;
    twtree_id: integer;
    groupsCount: integer;
begin
// Открытие CALC
    memrep.First;
    groupsCount:=0;
    twtree_id := 0;
    for iRow:=0 to memrep.RecordCount-1 do
    begin
      if  memrep.fieldbyname('twtree_id').asinteger<> twtree_id then
      begin
        inc(groupsCount);
        twtree_id := memrep.fieldbyname('twtree_id').asinteger;
      end;
      memrep.Next;
    end;

    twtree_id:=0;
    memrep.First;

   try
     ServiceManager := CreateOleObject('com.sun.star.ServiceManager');
   except
     exit;
   end;

   FilePath := 'private:factory/scalc';
   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\group.xlt');
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
    dataArrayBounds[1,0]:=25;
    dataArrayBounds[0,1]:=0;
    dataArrayBounds[1,1]:=groupsCount+100;




    v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);


    for i := 0 to dataArrayBounds[1,0] do
      for j := 0 to  dataArrayBounds[1,1] do
         v[i,j]:='';

    iRow := 0;
    while  not memrep.Eof do
    begin
          if  (memrep.fieldbyname('twtree_id').asinteger <> twtree_id) then
          begin
            if  twtree_id <> 0 then
            begin
              for j:= 1 to 24 do
                if v[j,iRow] = 0 then v[j,iRow]:='';
              inc(irow);
            end;
            for j:= 1 to 24 do v[j,iRow] := 0;
            twtree_id := memrep.fieldbyname('twtree_id').asinteger;
          end;

          v[0,iRow] := memrep.fieldbyname('twtree_full').asvariant;
          v[1,iRow] := v[1,iRow]+memrep.fieldbyname('ost1').asfloat;
          v[2,iRow] := v[2,iRow]+memrep.fieldbyname('ost1').asfloat*memrep.fieldbyname('tw_kwm_one').asfloat;
          v[3,iRow] := v[3,iRow]+memrep.fieldbyname('ost1_seb').asfloat;
          v[4,iRow] := v[4,iRow]+memrep.fieldbyname('post_kol').asfloat;
          v[5,iRow] := v[5,iRow]+memrep.fieldbyname('post_kol').asfloat*memrep.fieldbyname('tw_kwm_one').asfloat;
          v[6,iRow] := v[6,iRow]+memrep.fieldbyname('post_seb').asfloat;
          v[7,iRow] := v[7,iRow]+memrep.fieldbyname('post_wozw_kol').asfloat;
          v[8,iRow] := v[8,iRow]+memrep.fieldbyname('post_wozw_seb').asfloat;
          v[9,iRow] := v[9,iRow]+memrep.fieldbyname('rn_kol').asfloat;
          v[10,iRow] := v[10,iRow]+memrep.fieldbyname('rn_kol').asfloat*memrep.fieldbyname('tw_kwm_one').asfloat;
          v[11,iRow] := v[11,iRow]+memrep.fieldbyname('rn_sum').asfloat;
          v[12,iRow] := v[12,iRow]+memrep.fieldbyname('rn_seb').asfloat;
          v[13,iRow] := v[13,iRow]+memrep.fieldbyname('rn_nac').asfloat;
          v[14,iRow] := v[14,iRow]+memrep.fieldbyname('rn_ub').asfloat;
          v[15,iRow] := v[15,iRow]+memrep.fieldbyname('rn_wozw_kol').asfloat;
          v[16,iRow] := v[16,iRow]+memrep.fieldbyname('rn_wozw_sum').asfloat;
          v[17,iRow] := v[17,iRow]+memrep.fieldbyname('rn_wozw_seb').asfloat;
          v[18,iRow] := v[18,iRow]+memrep.fieldbyname('spis_kol').asfloat;
          v[19,iRow] := v[19,iRow]+memrep.fieldbyname('spis_seb').asfloat;
          v[20,iRow] := v[20,iRow]+memrep.fieldbyname('ost2').asfloat;
          v[21,iRow] := v[21,iRow]+memrep.fieldbyname('ost2').asfloat*memrep.fieldbyname('tw_kwm_one').asfloat;
          v[22,iRow] := v[22,iRow]+memrep.fieldbyname('ost2_seb').asfloat;
          v[23,iRow] := v[23,iRow]+memrep.fieldbyname('nac').asfloat;
          v[24,iRow] := v[24,iRow]+memrep.fieldbyname('ub').asfloat;


        memrep.Next;

          if  memrep.Eof then
          begin
            if  twtree_id <> 0 then
            begin        
              for j:= 1 to 24 do
                if v[j,iRow] = 0 then v[j,iRow]:='';
              inc(irow);
            end;
          end;
    end;
    memrep.First;

    Sheets := Document.GetSheets;
    Sheet := Sheets.GetByName('Лист1');
    cel := Sheet.GetCellByPosition(0,0);
    cel.setString('Подробный расширенный отчет в рублях:  ' + report_title_tmp);

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

procedure TREPORT_PRIBYL_NEW.Button2Click(Sender: TObject);
var excel: TExcelApplication;
begin
  try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
    ExpExcel2;
  except
    ExpCalc2;
  end;
end;

end.
