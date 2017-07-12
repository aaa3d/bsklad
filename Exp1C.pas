unit Exp1C;
                                                                                                       
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, RxLookup, Mask, ToolEdit,Data1,b_utils,b_Dbutils,
  IBDatabase, Db, IBCustomDataSet, IBQuery, DBCtrls, DualList,VclUtils,
  ExtCtrls, RXCtrls, ComCtrls;

type
  TEXP_1C = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Check_CLEAR: TCheckBox;
    PnDicFrm: TIBQuery;
    PnDicFrmFRM_ID: TIntegerField;
    PnDicFrmFRM_FULL: TIBStringField;
    PnDicFrmFRM_REKW: TIBStringField;
    DsPnDicFrm: TDataSource;
    PnDicFrmTransaction: TIBTransaction;
    DualListDialog1: TDualListDialog;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    DualListDialog2: TDualListDialog;
    QueryWork3: TIBQuery;
    QueryWork4: TIBQuery;
    Timer1: TTimer;
    Timer2: TTimer;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    FRM: TRxDBLookupCombo;
    PathFile: TEdit;
    DBEdit1: TDBEdit;
    Panel2: TPanel;
    BtnPN: TSpeedButton;
    Check_PN: TCheckBox;
    CHECK_ADM: TCheckBox;
    CHECK_HOZ: TCheckBox;
    LIST_PN: TEdit;
    Panel3: TPanel;
    BtnRN: TSpeedButton;
    Check_RN: TCheckBox;
    Check_SPIS: TCheckBox;
    LIST_RN: TEdit;
    PO_CHECK: TCheckBox;
    Panel4: TPanel;
    Check_AN: TCheckBox;
    KorrTransaction: TIBTransaction;
    QueryKorr: TIBQuery;
    ClearFirms: TCheckBox;
    Check_PER: TCheckBox;
    chkZays: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnRNClick(Sender: TObject);
    procedure Check_RNClick(Sender: TObject);
    procedure Check_PNClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FRMChange(Sender: TObject);
    procedure BtnPNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EXP_1C: TEXP_1C;
  RNTYP_S:string;
  PNTYP_S:string;

  export_pn_stfact_fields: integer;

implementation

uses WaitForm, Mainform;

{$R *.DFM}

type
  TPOST=record
    post_id:integer;
    post_inn:string;
    post_name:string;
    post_summ:double;
  end;
var
  arrpost:array[1..20000] of TPOST;
  cntpost:integer;


procedure TEXP_1C.Button2Click(Sender: TObject);
begin
    close;
end;

procedure TEXP_1C.FormShow(Sender: TObject);
var
  s3,s4:string;
  a:integer;
begin
  RNTYP_S:='1,2';
  PNTYP_S:='1,2';

  DT1.date:=date();
  DT2.date:=date();

   // Загружаем справочник фирм
  PnDicFrm.Close;
  PnDicFrmTransaction.Active:=False;
  PnDicFrm.ParamByname('FRM_ID').asinteger:=-1;
  PnDicFrm.Open;
  FRM.value:=PnDicFrm.FieldByname('FRM_ID').asstring;
  Check_PN.checked:=true;

     {Заполняем DualListDialog}
     s4:='';
     s3:=' '+PNTYP_S+' ';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;

     export_pn_stfact_fields:=0;
     querywork.sql.Text:='select cfg_set1 from cfg where cfg_name = ''export_pn_stfact_fields''';
     querywork.Open;
     if not querywork.eof then
             export_pn_stfact_fields:=querywork.fieldbyname('cfg_set1').asinteger;
     querywork.close;


     OPEN_SQL(QueryWork,'select PNTYP_SHORT,PNTYP_ID from PNTYP order by PNTYP_ID');
     DualListDialog2.Title:='Список типов расходных накладных';
     DualListDialog2.List1.Clear;
     DualListDialog2.List2.Clear;
     while not QueryWork.eof do begin
           if pos(' '+QueryWork.fieldByname('PNTYP_ID').asstring+' ',s3)>0 then begin
              DualListDialog2.List2.Add(QueryWork.fieldByname('PNTYP_SHORT').asstring);
              s4:=s4+QueryWork.fieldByname('PNTYP_SHORT').asstring+',';
           end else
           DualListDialog2.List1.Add(QueryWork.fieldByname('PNTYP_SHORT').asstring);
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     LIST_PN.text:=s4;




     s4:='';
     s3:=' '+RNTYP_S+' ';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     DualListDialog1.Title:='Список типов расходных накладных';
     DualListDialog1.List1.Clear;
     DualListDialog1.List2.Clear;
     while not QueryWork.eof do begin
           if pos(' '+QueryWork.fieldByname('RNTYP_ID').asstring+' ',s3)>0 then begin
              DualListDialog1.List2.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
              s4:=s4+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
           end else
           DualListDialog1.List1.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     LIST_RN.text:=s4;
     Check_RN.OnClick(Sender);
     Check_PN.OnClick(Sender);
end;

procedure TEXP_1C.BtnRNClick(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1  order by RNTYP_ID');
     s:='';
     s2:='';
     if DualListDialog1.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog1.list2.Count do begin
            if QueryWork.Locate('RNTYP_SHORT',DualListDialog1.List2.Strings[a-1],[])
            then begin
                 s:=s+' '+QueryWork.fieldByname('RNTYP_ID').asstring+',';
                 s2:=s2+' '+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
            end;
        end;
        if length(s)>0 then s:=B_utils.left(s,length(s)-1);
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        RNTYP_S:=s;
        List_RN.text:=s2;
     end;
end;

procedure TEXP_1C.Check_RNClick(Sender: TObject);
begin
   BtnRn.enabled:=Check_RN.checked;

end;

procedure TEXP_1C.Check_PNClick(Sender: TObject);
begin
   BtnPn.enabled:=Check_PN.checked;
   Check_adm.enabled:=Check_PN.checked;
   Check_hoz.enabled:=Check_PN.checked;
end;

procedure TEXP_1C.Button1Click(Sender: TObject);

type
  recrn=record
    typ:char;
    id:integer;
    sum:double;
    seb:double;
    nds:double;
    nsp:double;
  end;
var
  arrrn:array[1..25000] of recrn;
  cntrn:integer;
  a,b,cnt,cntall:integer;
  cntpn:integer;
  fl:textfile;
  rn_nsp,rn_summa,rn_nds,rn_seb,rn_seb2:double;
  pn_summa,pn_nds:double;
  cnt_err_pn:integer;
  s,s2:ansistring;
  NEW_PN,OLD_PN:string;
  allrns,cntrns:integer;
  post_id:integer;
  calc_kol,rn_kol,pn_kol,rn_do,post_summ:double;
  alltw,cnttw:integer;
  tmpkorr_id:integer;
begin

   try

   tmpkorr_id:=0;
   if check_an.checked then begin
     // Будет выгружаться аналитика - запрашиваем генератор для временной таблицы
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select gen_id(gen_tmpkorr,1) as tmpkorr_id from main');
     tmpkorr_id:=QueryWork.fieldByname('tmpkorr_id').asinteger;
     QueryWork.close;
   end;
   cntpn:=0;
   cntrn:=0;
   assignfile(Fl,PathFile.text);
   if not Check_Clear.checked then begin
        if fileexists(PathFile.text) then append(Fl)
        else rewrite(Fl);
   end else rewrite(Fl);
   OPEN_SQL(QueryWork,'select * from list_rvid_kln');
   Wait_Form.StatusBar1.panels[0].text:='Выгрузка справочника кредитных карт...';
   Wait_Form.Gauge1.Progress:=0;
   Wait_Form.Show;
   delay(100);
   while not QueryWork.eof do begin
     writeln (Fl,'$6');
     writeln (Fl,QueryWork.fieldByname('KLN_ID').asinteger);
     Writeln (Fl,delCR(QueryWork.fieldByname('KLN_FULL').asstring));
     writeln (Fl,'$$6');
     QueryWork.next;
   end;
   if CHECK_PN.checked then begin
     Wait_Form.StatusBar1.panels[0].text:='Проверка приходных...';
     Wait_Form.Gauge1.Progress:=0;
     Wait_Form.Show;
     delay(100);
     cnt_err_pn:=0;
     WorkTransaction.Active:=False;
     // проверяем правильность
     ADD_SQL(QueryWork,'select pns2$.*,pn$.pn$_NUM,pn$.pn$_date,pntyp.pntyp_short,shop.shop_prefix,shop.shop_postfix '+
                        'from pn$,pns2$,pntyp,shop where pn$.pntyp_id in ('+PNTYP_S+') and pn$_date between :dt1 and :dt2 '+
                        ' and not bg_abs(doc_deleted)=1 and pn$.frm_id=:FRM_ID and pn$.pntyp_id=pntyp.pntyp_id and pn$.shop_id=shop.shop_id and pn$.pn$_id=pns2$.pn$_id');
     QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=Dt2.date+1-Sekond1;
     QueryWork.Open;
     s2:='';
     OLD_PN:='';
     while not QueryWork.eof do begin
        s:=trim(ansiuppercase(QueryWork.fieldByname('DOC').asstring));
           // транспортные расходы
           if (b_utils.left(s,length(const_sf))<>const_sf) and (b_utils.left(s,length(const_AV))<>COnst_AV) then begin
                NEW_PN:=QueryWork.fieldByname('PNTYP_SHORT').asstring+' '+QueryWork.fieldByname('SHOP_PREFIX').asstring+
                QueryWork.fieldByname('PN$_NUM').asstring+QueryWork.fieldByname('SHOP_POSTFIX').asstring;
                if NEW_PN<>OLD_PN then s2:=s2+NEW_PN+',';
                OLD_PN:=NEW_PN;
                inc(cnt_err_pn);
           end;
           QueryWork.next;
     end;
     if length(s2)>0 then s2:=b_utils.left(s2,length(s2)-1);
     if length(s2)>150 then s2:=b_utils.left(s2,140)+'...';
     if cnt_err_pn>0 then begin
        messbox('Неверное оформление накладных расходов приходных накладных: '+s2,MessError,16);
     end else begin
       // Определяем число накладных
       ADD_SQL(QueryWork,'select count(*) as cc from pn$ where pn$.pntyp_id in ('+PNTYP_S+') and pn$_date between :dt1 and :dt2 '+
       ' and pn$.frm_id=:FRM_ID');
       QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
       QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
       QueryWork.ParamByname('DT2').asdatetime:=Dt2.date+1-Sekond1;
       QueryWork.Open;
       if QueryWork.eof then cntall:=0 else cntall:=QueryWork.fieldByname('CC').asinteger;
       ADD_SQL(QueryWork,'select pntyp.pntyp_id,shop.shop_name,shop.shop_id,skl.skl_full,shop.shop_prefix,shop.shop_postfix,pntyp.Pntyp_short,pn$.*, '+
       ' (select sum(pns$.tw_summ) from pns$ where pns$.pn$_id=pn$.pn$_id) as pn_summ, '+
       ' (select sum(pns$.PNS$_NDS_summ) from pns$ where pns$.pn$_id=pn$.pn$_id) as nds_summ, '+
       ' (select sum(pns$.tw_kol*tw.store_price) from pns$, tw where pns$.pn$_id=pn$.pn$_id and tw.tw_id=pns$.tw_id) as store_summ '+
       ' from shop,pn$,Pntyp,skl where pn$.pntyp_id in ('+PNTYP_S+') and pn$_date between :dt1 and :dt2 '+
       ' and not bg_abs(doc_deleted)=1 and pn$.frm_id=:FRM_ID  and Pn$.pntyp_id=pntyp.pntyp_id and pn$.shop_id=shop.shop_id '+
       ' and pn$.skl_id=skl.skl_id');
       QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
       QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
       QueryWork.ParamByname('DT2').asdatetime:=Dt2.date+1-Sekond1;
       QueryWork.Open;
       cnt:=0;
       Wait_Form.StatusBar1.panels[0].text:='Выгрузка приходных...';
       Wait_Form.Gauge1.Progress:=0;
       Wait_Form.Show;
       delay(100);
       while not QueryWork.eof do begin
         inc(Cnt);
         Wait_Form.Gauge1.Progress:=trunc(90*(cnt/cntall));
         delay(2);
         writeln (Fl,'$1');
         Writeln (Fl,QueryWork.fieldByname('PN$_ID').asinteger);
         Writeln (Fl,QueryWork.fieldByname('PN$_PROW').asinteger);
         Writeln (Fl,formatdate(QueryWork.fieldByname('PN$_DATE').asdatetime,'/'));
         Writeln (Fl,QueryWork.fieldByname('PNTYP_SHORT').asstring);
         Writeln (Fl,QueryWork.fieldByname('SHOP_PREFIX').asstring+QueryWork.fieldByname('PN$_NUM').asstring+
             QueryWork.fieldByname('SHOP_POSTFIX').asstring);
         Writeln (Fl,QueryWork.fieldByname('SKL_ID').asinteger);
         Writeln (Fl,QueryWork.fieldByname('SKL_FULL').asstring);
         Writeln (Fl,QueryWork.fieldByname('KLN_ID').asinteger);
         ADD_SQL(QueryWork2,'select kln_inn from kln where kln_id=:kln_id');
         QueryWork2.ParamByName('KLN_ID').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
         QueryWork2.Open;
         if QueryWork2.eof then begin
            // Клиент не найден!!!!
         end else begin
           Writeln (Fl,QueryWork2.fieldByname('KLN_INN').asstring);
           ADD_SQL(QueryWork2,'select kln_full from kln_data(:kln_id)');
           QueryWork2.ParamByName('KLN_ID').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
           QueryWork2.Open;
           Writeln (Fl,QueryWork2.fieldByname('KLN_FULL').asstring);
         end;
         if QueryWork.fieldByname('Pn_summ').asfloat>0 then begin
           pn_summa:=QueryWork.fieldByname('Pn_summ').asfloat-QueryWork.fieldByname('nds_summ').asfloat;
           pn_nds:=QueryWork.fieldByname('nds_summ').asfloat;
         end else begin
            // Определяем, какая была сумма НДС на количество той накладной, с которой сделан возврат
            ADD_SQL(QueryWork4,'select * from NDS_WOZW_PN(:PN_ID)');
            QueryWork4.ParamByname('PN_ID').asinteger:=QueryWork.fieldByname('PN$_ID').asinteger;
            QueryWork4.Open;
            pn_summa:=QueryWork.fieldByname('Pn_summ').asfloat;
            if QueryWork4.eof then pn_nds:=0 else pn_nds:=-abs(QueryWork4.fieldByname('NDS_SUMM').asfloat);
            pn_summa:=pn_summa-pn_nds;
         end;
         Writeln (Fl,floattostrf(pn_summa,fffixed,19,2)); // Сумма
         Writeln (Fl,floattostrf(pn_nds,fffixed,19,2)); // НДС
         Writeln (Fl,b_utils.left(delCR(QueryWork.fieldByname('PN$_OSN').asstring),200));
         Writeln (Fl,QueryWork.fieldByname('SHOP_ID').asinteger); // Код магазина
         Writeln (Fl,b_utils.left(delCR(QueryWork.fieldByname('SHOP_NAME').asstring),64)); // Наименование магазина
         Writeln (Fl,QueryWork.fieldByname('PNTYP_ID').asinteger); // Код типа накладной
         Writeln (Fl,b_utils.left(delCR(QueryWork.fieldByname('PN$_STFAKT').asstring),50)); // Дата номер счет-фактуры
         Writeln (Fl,floattostrf(QueryWork.fieldByname('STORE_SUMM').asfloat,fffixed,19,2));


         if (export_pn_stfact_fields = 1) then  //с 01.11.2013 - выгружать дополнительные поля в 1С
         begin
                 Writeln (Fl,formatdate(QueryWork.fieldByname('PN$_STFAKT_DATE').asdatetime,'/'));
                 Writeln (Fl,b_utils.left(delCR(QueryWork.fieldByname('PN$_STFAKT_NUM').asstring),250)); // Дата номер счет-фактуры
         end;



         // Выгружаем накладные расходы (сначала, что касается транспортных расходов
         Add_SQL(QueryWork2,'select pns2$.*,usl.deb,usl.cred,usl.usl_name from pns2$,usl where pns2$.pn$_id=:pn_id '+
         ' and pns2$.usl_id=usl.usl_id');
         QueryWork2.ParamByname('PN_ID').asinteger:=QueryWork.FieldByname('PN$_ID').asinteger;
         QueryWork2.Open;
         while not QueryWork2.eof do begin
          if ((check_adm.checked) and (not check_hoz.checked) and (QueryWork2.fieldByname('PNS2$_MET').asinteger in [0,2]))
          or ((not check_adm.checked) and (check_hoz.checked) and (QueryWork2.fieldByname('PNS2$_MET').asinteger in [1,2]))
          or ((check_adm.checked) and (check_hoz.checked)) then begin
           s:=trim(ansiuppercase(QueryWork2.fieldByname('DOC').asstring));
           if b_utils.left(s,length(const_SF))=const_SF then begin // Выгружаем счет-фактуру
              Writeln (Fl,'$1-1');
              Writeln (Fl,QueryWork2.fieldByname('PNS2$_ID').asinteger);
              Writeln (Fl,datetostr(QueryWork2.fieldByname('DOC_DATE').asdatetime));
              Writeln (Fl,1); // флаг счета-фактуры
              Writeln (Fl,QueryWork2.fieldByname('DOC').asstring);
              Writeln (Fl,QueryWork2.fieldByname('KLN_ID').asinteger);
              ADD_SQL(QueryWork3,'select kln_inn from kln where kln_id=:kln_id');
              QueryWork3.ParamByName('KLN_ID').asinteger:=QueryWork2.fieldByname('KLN_ID').asinteger;
              QueryWork3.Open;
              if QueryWork3.eof then begin
                // Клиент не найден!!!!
              end else begin
                Writeln (Fl,QueryWork3.fieldByname('KLN_INN').asstring);
                ADD_SQL(QueryWork3,'select kln_full from kln_data(:kln_id)');
                QueryWork3.ParamByName('KLN_ID').asinteger:=QueryWork2.fieldByname('KLN_ID').asinteger;
                QueryWork3.Open;
                Writeln (Fl,QueryWork3.fieldByname('KLN_FULL').asstring);
              end;
              Writeln (Fl,floattostrf(QueryWork2.fieldByname('PNS2$_SUMM').asfloat-QueryWork2.fieldByname('PNS2$_NDS_SUMM').asfloat,fffixed,19,2));
              Writeln (Fl,floattostrf(QueryWork2.fieldByname('PNS2$_NDS_SUMM').asfloat,fffixed,19,2));
              Writeln (Fl,floattostrf(QueryWork2.fieldByname('PNS2$_NDS').asfloat,fffixed,19,2));
           end;
           if b_utils.left(s,length(const_AV))=const_AV then begin // Выгружаем счет-фактуру
              Writeln (Fl,'$1-1');
              Writeln (Fl,QueryWork2.fieldByname('PNS2$_ID').asinteger);
              Writeln (Fl,datetostr(QueryWork2.fieldByname('DOC_DATE').asdatetime));
              Writeln (Fl,2); // флаг авансового отчета
              Writeln (Fl,QueryWork2.fieldByname('CRED').asstring); // Счет
              Writeln (Fl,QueryWork2.fieldByname('USL_NAME').asstring+' '+QueryWork2.fieldByname('DOC').asstring);
              Writeln (Fl,QueryWork2.fieldByname('KLN_ID').asinteger);
              ADD_SQL(QueryWork3,'select kln_inn from kln where kln_id=:kln_id');
              QueryWork3.ParamByName('KLN_ID').asinteger:=QueryWork2.fieldByname('KLN_ID').asinteger;
              QueryWork3.Open;
              if QueryWork3.eof then begin
                // Клиент не найден!!!!
              end else begin
                ADD_SQL(QueryWork3,'select kln_full from kln_data(:kln_id)');
                QueryWork3.ParamByName('KLN_ID').asinteger:=QueryWork2.fieldByname('KLN_ID').asinteger;
                QueryWork3.Open;
                Writeln (Fl,QueryWork3.fieldByname('KLN_FULL').asstring);
              end;
              Writeln (Fl,floattostrf(QueryWork2.fieldByname('PNS2$_SUMM').asfloat-QueryWork2.fieldByname('PNS2$_NDS_SUMM').asfloat,fffixed,19,2));
              Writeln (Fl,floattostrf(QueryWork2.fieldByname('PNS2$_NDS_SUMM').asfloat,fffixed,19,2));
              Writeln (Fl,floattostrf(QueryWork2.fieldByname('PNS2$_NDS').asfloat,fffixed,19,2));
              //Writeln (Fl,QueryWork2.fieldByname('DEB').asstring);
           end;
          end;
          QueryWork2.next;
         end;
         Writeln (Fl,'$$1');
         QueryWork.next;
       end;

       if ClearFirms.Checked then
     begin
       // Выгружаем, как удаленные накладные не "этой фирмы"
       ADD_SQL(QueryWork,'select Pn$_id from pn$ where (not frm_id=:frm_id) and pn$_date between :DT1 and :DT2 and not bg_abs(doc_deleted)=1' );
       QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
       QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
       QueryWork.ParamByname('DT2').asdatetime:=my_now();
       QueryWork.Open;
       while not QueryWork.eof do begin
         writeln(Fl,'$1');
         writeln(Fl,QueryWork.fieldByname('PN$_ID').asinteger);
         writeln(Fl,-1);
         writeln(Fl,'$$1');
         QueryWork.next;
       end;
     end;

       // Выгружаем удаленные приходы
       ADD_SQL(QueryWork,'select TABNAME_ID from del where TM between :DT1 and :DT2 and TABNAME="PN$"' );
       QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
       QueryWork.ParamByname('DT2').asdatetime:=my_now();
       QueryWork.Open;
       while not QueryWork.eof do begin
         writeln(Fl,'$1');
         writeln(Fl,QueryWork.fieldByname('TABNAME_ID').asinteger);
         writeln(Fl,-1);
         writeln(Fl,'$$1');
         QueryWork.next;
       end;


       ADD_SQL(QueryWork,'select PN$_ID from PN$ where PN$_DATE between :DT1 and :DT2 and bg_abs(doc_deleted)=1' );
       QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
       QueryWork.ParamByname('DT2').asdatetime:=my_now();
       QueryWork.Open;
       while not QueryWork.eof do begin
         writeln(Fl,'$1');
         writeln(Fl,QueryWork.fieldByname('PN$_ID').asinteger);
         writeln(Fl,-1);
         writeln(Fl,'$$1');
         QueryWork.next;
       end;





       Wait_Form.Gauge1.Progress:=100;
       delay(100);
       Wait_Form.Hide;
       cntpn:=cnt;
     end;
   end;



   cntrn:=0;
   if CHECK_RN.checked then begin
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select count(*) as cc from rn where rn.rntyp_id in ('+RNTYP_S+') and rn_date between :dt1 and :dt2 and not bg_abs(doc_deleted)=1'+
     ' and rn.frm_id=:FRM_ID');
     QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=Dt2.date+1-Sekond1;
     QueryWork.Open;
     if QueryWork.eof then cntall:=0 else cntall:=QueryWork.fieldByname('CC').asinteger;
     ADD_SQL(QueryWork,'select rntyp.rntyp_id,shop.shop_name,shop.shop_id,skl.skl_full,shop.shop_prefix,shop.shop_postfix,rntyp.rntyp_short,rn.*, '+
     ' (select sum(rns.tw_kol* '+
     ' roundd((rns.tw_money*(1-rns.tw_skiddoll/100))*(1-(rns.tw_skid+rn.rn_skid)/100),2) '+
     ' ) from rns where rns.rn_id=rn.rn_id) as rn_summ '+
     ' from shop,rn,rntyp,skl where rn.rntyp_id in ('+RNTYP_S+') and rn_date between :dt1 and :dt2 '+
     ' and rn.frm_id=:FRM_ID  and rn.rntyp_id=rntyp.rntyp_id and rn.shop_id=shop.shop_id '+
     ' and rn.skl_id=skl.skl_id ' +
     ' and not bg_abs(doc_deleted)=1 ');
     QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=Dt2.date+1-Sekond1;
     QueryWork.Open;
     cnt:=0;
     Wait_Form.StatusBar1.panels[0].text:='Выгрузка расходных...';
     Wait_Form.Gauge1.Progress:=0;
     Wait_Form.Show;
     delay(100);
     while not QueryWork.eof do begin
       inc(Cnt);
       Wait_Form.StatusBar1.panels[0].text:='Запрос расходных. '+inttostr(cnt)+' из '+inttostr(cntall)+'...';
       Wait_Form.Gauge1.Progress:=trunc(90*(cnt/cntall));
       delay(1);
       rn_summa:=QueryWork.fieldByname('rn_summ').asfloat;
       inc(cntrn);
       if QueryWork.fieldByname('RN_PROW').asinteger=1 then arrrn[cntrn].typ:='R'
        else arrrn[cntrn].typ:='r';
       arrrn[cntrn].id:=QueryWork.fieldByname('RN_ID').asinteger;
       arrrn[cntrn].sum:=QueryWork.fieldByname('RN_SUMM').asfloat;
       if arrrn[cntrn].sum>0 then begin
         // Простой расход
         arrrn[cntrn].nsp:=QueryWork.fieldByname('RN_SUMM').asfloat/(100+QueryWork.fieldByname('NP').asfloat)*QueryWork.fieldByname('NP').asfloat;
         arrrn[cntrn].nds:=(arrrn[cntrn].sum-arrrn[cntrn].nsp)/(100+QueryWork.fieldByname('NDS').asfloat)*QueryWork.fieldByname('NDS').asfloat;
       end else begin
         // Сторно расхода -  определяем сумму, НДС и НСП
         add_sql(QueryWork2,'select * from nds_wozw_rn(:rn_id)');
         QueryWork2.paramByname('RN_ID').asinteger:=QueryWork.fieldByname('RN_ID').asinteger;
         QueryWork2.open;

         if QueryWork2.fieldByname('bad_storno').asinteger=1 then
         begin
          msgbox('Ошибка выгрузки данных','Ошибка выгрузки сторно РН. Документ-основание  удален. Сторно '+QueryWork.fieldbyName('RNTYP_SHORT').asstring+QueryWork.fieldbyName('RN_NUM').asstring+QueryWork.fieldbyName('SHOP_POSTFIx').asstring, 0);
          exit;
         end;

         if  abs ( -abs(QueryWork2.fieldByname('WOZW_SUMM').asfloat) - arrrn[cntrn].sum) > 0.5 then
         begin
           msgbox('Ошибка выгрузки данных','Ошибка выгрузки сторно РН. Цена товара в документе основании отличается от цены товара в сторно РН. Сторно '+QueryWork.fieldbyName('RNTYP_SHORT').asstring+QueryWork.fieldbyName('RN_NUM').asstring+QueryWork.fieldbyName('SHOP_POSTFIx').asstring+', код '+QueryWork.fieldByname('RN_ID').asString, 0);
          exit;
         end;


         arrrn[cntrn].sum:=-abs(QueryWork2.fieldByname('WOZW_SUMM').asfloat);
         arrrn[cntrn].nds:=-abs(QueryWork2.fieldByname('NDS_SUMM').asfloat);
         arrrn[cntrn].nsp:=-abs(QueryWork2.fieldByname('NSP_SUMM').asfloat);




       end;
       // Запрашиваем себестоимость
       if arrrn[cntrn].typ='R' then begin
          ADD_SQL(QueryWork2,'select sum(calc_kol*seb) as seb from re where id=:rn_id and typ+0=1 ');
          QueryWork2.paramByname('RN_ID').asinteger:=arrrn[cntrn].id;
          QueryWork2.Open;
          if QueryWork2.eof then arrrn[cntrn].seb:=0
           else arrrn[cntrn].seb:=QueryWork2.fieldByname('seb').asfloat;
       end else arrrn[cntrn].seb:=0; // как непроведенная

       // Запрашиваем себестоимость  сводных накладных. они определяются так: непроведенные, дата не содержит времени
       if arrrn[cntrn].typ='r'  then
          if  QueryWork.FieldByName('RN_DATE').asdatetime = round(QueryWork.FieldByName('RN_DATE').asdatetime) then
          begin

          ADD_SQL(QueryWork2,'select sum(calc_kol*seb) seb from rn, re '+
                    'where rn.rntyp_id=160010005 '+
                    'and not rn.rn_prow=0 '+
                    'and rn.frm_id=2696877 '+
                    'and rn.kln_id=:kln_id '+
                    'and rn.skl_id=:skl_id '+
                    'and rn.shop_id=:shop_id '+
                    'and rn.rn_date >  :dt '+
                    'and rn.rn_date <  :dtt '+
                    'and rn.rnvid_id=1 '+
                    'and re.id = rn.rn_id '+
                    'and re.typ+0=1');
          QueryWork2.paramByname('kln_id').asinteger:=QueryWork.fieldbyname('kln_id').asinteger;
          QueryWork2.paramByname('skl_id').asinteger:=QueryWork.fieldbyname('skl_id').asinteger;
          QueryWork2.paramByname('shop_id').asinteger:=QueryWork.fieldbyname('shop_id').asinteger;
          QueryWork2.paramByname('dt').asDateTime:=QueryWork.fieldbyname('RN_DATE').asdatetime;
          QueryWork2.paramByname('dtt').asDateTime:=QueryWork.fieldbyname('RN_DATE').asdatetime+1;

          QueryWork2.Open;
          if QueryWork2.eof then arrrn[cntrn].seb:=0
           else arrrn[cntrn].seb:=QueryWork2.fieldByname('seb').asfloat;
       end else arrrn[cntrn].seb:=0; // как непроведенная
       QueryWork.next;
     end;
     // Выгружаем документы не той фирмы

     if ClearFirms.Checked then
     begin

     ADD_SQL(QueryWork,'select rn_id from rn where (not frm_id=:frm_id) and rn_date between :DT1 and :DT2 and not bg_abs(doc_deleted)=1' );
     QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=my_now();
     QueryWork.Open;
     while not QueryWork.eof do begin
       writeln(Fl,'$2');
       writeln(Fl,QueryWork.fieldByname('RN_ID').asinteger);
       writeln(Fl,-1);
       writeln(Fl,'$$2');
       QueryWork.next;
     end;

     end;
     // выгруаем удаленные расходы
     ADD_SQL(QueryWork,'select TABNAME_ID from del where TM between :DT1 and :DT2 and TABNAME="RN"' );
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=my_now();
     QueryWork.Open;
     while not QueryWork.eof do begin
       writeln(Fl,'$2');
       writeln(Fl,QueryWork.fieldByname('TABNAME_ID').asinteger);
       writeln(Fl,-1);
       writeln(Fl,'$$2');
       QueryWork.next;
     end;

     ADD_SQL(QueryWork,'select RN_ID from RN where RN_DATE between :DT1 and :DT2 and bg_abs(doc_deleted)=1' );
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=my_now();
     QueryWork.Open;
     while not QueryWork.eof do begin
       writeln(Fl,'$2');
       writeln(Fl,QueryWork.fieldByname('RN_ID').asinteger);
       writeln(Fl,-1);
       writeln(Fl,'$$2');
       QueryWork.next;
     end;






     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     Wait_Form.Hide;
   end;

   if CHECK_SPIS.checked then begin
     WorkTransaction.Active:=False;
     // Определяем число Актов списания
     Wait_Form.StatusBar1.panels[0].text:='Запрос актов списания...';
     Wait_Form.Gauge1.Progress:=0;
     Wait_Form.Show;
     delay(100);
     ADD_SQL(QueryWork,'select count(*) as cc from spis where spis_date between :dt1 and :dt2 and spis.frm_id=:frm_id');
     QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=Dt2.date+1-Sekond1;
     QueryWork.Open;
     if QueryWork.eof then cntall:=0 else cntall:=QueryWork.fieldByname('CC').asinteger;
     ADD_SQL(QueryWork,'select shop.shop_name,shop.shop_id,skl.skl_full,shop.shop_prefix,shop.shop_postfix,spis.*,spisvid.spisvid_1c,spisvid.spisvid_us '+
       ' from shop,spis,skl,spisvid where spis_date between :dt1 and :dt2 '+
       ' and spis.frm_id=:FRM_ID  and spis.shop_id=shop.shop_id and spis.spisvid_id=spisvid.spisvid_id'+
       ' and spis.skl_id=skl.skl_id');
     QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=Dt2.date+1-Sekond1;
     QueryWork.Open;
     cnt:=0;
     while not QueryWork.eof do begin
       inc(Cnt);
       Wait_Form.Gauge1.Progress:=trunc(90*(cnt/cntall));
       delay(1);
       inc(cntrn);
       if QueryWork.fieldByname('SPIS_PROW').asinteger=1 then arrrn[cntrn].typ:='S'
        else arrrn[cntrn].typ:='s';
       arrrn[cntrn].id:=QueryWork.fieldByname('SPIS_ID').asinteger;
       arrrn[cntrn].sum:=0;
       arrrn[cntrn].seb:=0;
       arrrn[cntrn].nds:=0;
       arrrn[cntrn].nsp:=0;
       if arrrn[cntrn].typ='S' then begin
          ADD_SQL(QueryWork2,'select sum(calc_kol*seb) as seb,sum(calc_kol*nds) as nds from re where id=:id and typ=2 ');
          QueryWork2.paramByname('ID').asinteger:=arrrn[cntrn].id;
          QueryWork2.Open;
          if not QueryWork2.eof then begin
             arrrn[cntrn].seb:=QueryWork2.fieldByname('seb').asfloat;
             arrrn[cntrn].nds:=QueryWork2.fieldByname('nds').asfloat;
          end;
       end;
       QueryWork.next;
     end;
     if ClearFirms.Checked then
     begin
     // Выгружаем, как удаленные акты списания не "этой фирмы"
     ADD_SQL(QueryWork,'select spis_id from spis where (not frm_id=:frm_id) and spis_date between :DT1 and :DT2' );
     QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=my_now();
     QueryWork.Open;
     while not QueryWork.eof do begin
       writeln(Fl,'$3');
       writeln(Fl,QueryWork.fieldByname('SPIS_ID').asinteger);
       writeln(Fl,-1);
       writeln(Fl,'$$3');
       QueryWork.next;
     end;
    end;
     // Выгружаем удаленные акты списания
     ADD_SQL(QueryWork,'select TABNAME_ID from del where TM between :DT1 and :DT2 and TABNAME="SPIS"' );
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=my_now();
     QueryWork.Open;
     while not QueryWork.eof do begin
       writeln(Fl,'$3');
       writeln(Fl,QueryWork.fieldByname('TABNAME_ID').asinteger);
       writeln(Fl,-1);
       writeln(Fl,'$$3');
       QueryWork.next;
     end;
     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     Wait_Form.Hide;
   end;

   // Выгружаем расходные в файл
   Wait_Form.StatusBar1.panels[0].text:='Экспорт расходных и списания...';
   Wait_Form.Gauge1.Progress:=0;
   Wait_Form.Show;
   delay(100);
   for a:=1 to cntrn do begin
     // Списания
     Wait_Form.Gauge1.Progress:=trunc(100*(a/cntrn));
     Wait_Form.Show;
     delay(1);
     if (arrrn[a].typ in ['S','s']) and (check_spis.checked) then begin
        ADD_SQL(QueryWork,'select shop.shop_name,shop.shop_id,skl.skl_full,shop.shop_prefix,shop.shop_postfix,spis.*,spisvid.spisvid_1c,spisvid.spisvid_us '+
        ' from shop,spis,skl,spisvid where spis.spis_id=:spis_id '+
        ' and spis.shop_id=shop.shop_id and spis.spisvid_id=spisvid.spisvid_id'+
        ' and spis.skl_id=skl.skl_id');
        QueryWork.ParamByname('SPIS_ID').asinteger:=arrrn[a].id;
        QueryWork.Open;
        writeln (Fl,'$3');
        Writeln (Fl,arrrn[a].id);
        if arrrn[a].typ='S' then Writeln (Fl,1) else Writeln (Fl,0); // Метка проводки
        Writeln (Fl,formatdate(QueryWork.fieldByname('SPIS_DATE').asdatetime,'/'));
        Writeln (Fl,QueryWork.fieldByname('SHOP_PREFIX').asstring+QueryWork.fieldByname('SPIS_NUM').asstring+
            QueryWork.fieldByname('SHOP_POSTFIX').asstring);
        Writeln (Fl,QueryWork.fieldByname('SKL_ID').asinteger);
        Writeln (Fl,QueryWork.fieldByname('SKL_FULL').asstring);
        Writeln (Fl,b_utils.left(delCR(QueryWork.fieldByname('SPIS_OSN').asstring),200));
        Writeln (Fl,QueryWork.fieldByname('SHOP_ID').asinteger); // Код магазина
        Writeln (Fl,b_utils.left(delCR(QueryWork.fieldByname('SHOP_NAME').asstring),64)); // Наименование магазина
        Writeln (Fl,QueryWork.fieldByname('SPISVID_ID').asinteger);
        // Выгру;аем виновного
        if QueryWork.fieldByname('SPISVID_US').asinteger=1 then begin
           ADD_SQL(QueryWork2,'select kln_full from kln_data(:us_id)');
           QueryWork2.ParamByname('US_ID').asinteger:=QueryWork.fieldByname('US_ID2').asinteger;
           QueryWork2.Open;
           Writeln (Fl,QueryWork.fieldByname('US_ID2').asinteger);
           Writeln (Fl,QueryWork2.fieldByname('KLN_FULL').asstring);
        end else begin
           Writeln (Fl,0); // Пустой код виновного
           Writeln (Fl,'');
        end;
        if QueryWork.fieldByname('SPISVID_1C').asinteger=3 then
          Writeln(Fl,floattostrf(arrrn[a].seb,fffixed,19,2)) // Себестоимость
        else Writeln(Fl,floattostrf(arrrn[a].seb+arrrn[a].nds,fffixed,19,2)); // Себестоимость
        Writeln(Fl,floattostrf(arrrn[a].nds,fffixed,19,2)); // НДС
        if QueryWork.fieldByname('SPISVID_1C').asinteger=3 then begin
          // Выгружаем себестоимость по наименованиям
          ADD_SQL(QueryWork2,'select Spiss_id,spiss.tw_kol,tw.tw_art,tw.tw_nam,spiss.tw_id from spiss,tw where '+
          'spiss.spis_id=:spis_id and tw.tw_id=spiss.tw_id');
          QueryWork2.ParamByname('SPIS_ID').asinteger:=QueryWork.fieldByname('SPIS_ID').asinteger;
          QueryWork2.Open;
          while not QueryWork2.eof do begin
             rn_seb:=0;
             if QueryWork.fieldByname('SPIS_PROW').asinteger=1 then begin
                ADD_SQL(QueryWork3,'select sum(calc_kol*seb) seb from re where typ=2 and ids=:ids');
                QueryWork3.ParamByname('ids').asinteger:=QueryWork2.fieldByname('SPISS_ID').asinteger;
                QueryWork3.Open;
                if QueryWork3.eof then rn_seb:=0 else rn_seb:=abs(QueryWork3.fieldByname('seb').asfloat);
             end;
             writeln(Fl,'$3-1');
             writeln(Fl,QueryWork2.fieldByname('TW_ART').asstring);
             writeln(Fl,QueryWork2.fieldByname('TW_NAM').asstring+' ('+QueryWork2.fieldByname('TW_ART').asstring+')');
             Writeln (Fl,floattostrf(sign(QueryWork2.fieldByname('TW_KOL').asfloat)*rn_seb,fffixed,19,2)); // Себестоимость товара
             Writeln (Fl,floattostrf(QueryWork2.fieldByname('TW_KOL').asfloat,fffixed,19,2)); // Кол-во
             QueryWork2.next;
          end;
       end;
       Writeln (Fl,'$$3');
     end;
     // Расходные
     if (arrrn[a].typ in ['r','R'])  and (check_rn.checked) then begin
        add_sql(QueryWork,'select rn.rvid_id,rn.rvid_kln,rntyp.rntyp_id,rn.rn_date,rntyp.rntyp_short,shop.shop_prefix,shop.shop_postfix,rn.rn_num,skl.skl_id, '+
        'skl.skl_full,rn.kln_id,kln.kln_inn,(select kln_full from kln_data(rn.kln_id)) as kln_full,rn.rn_osn,shop.shop_id,shop.shop_name '+
        ', (select res from rn_stfakt(rn.rn_id)) as res, (select rn_stfakt_num from rn_stfakt(rn.rn_id)) as rn_stfakt_num, (select rn_stfakt_date from rn_stfakt(rn.rn_id)) as rn_stfakt_date, '+
        ' (select sum(porn_summ) from rn_list_po(rn.rn_id)) as porn_summ, (select sum(rns.tw_kol*tw.store_price) from rns, tw where rns.rn_id=rn.rn_id and tw.tw_id=rns.tw_id) as store_summ '+
        'from rn,rntyp,shop,skl,kln where rn.rntyp_id=rntyp.rntyp_id and rn.skl_id=skl.skl_id '+
        'and rn.shop_id=shop.shop_id and rn.kln_id=kln.kln_id and rn.rn_id=:rn_id');
        QueryWork.ParamByname('RN_ID').asinteger:=arrrn[a].id;
        QueryWork.Open;
        writeln (Fl,'$2');
        Writeln (Fl,arrrn[a].id);
        if arrrn[a].typ='R' then Writeln (Fl,1) else Writeln (Fl,0); // Меткар проводки
        Writeln (Fl,formatdate(QueryWork.fieldByname('RN_DATE').asdatetime,'/'));
        Writeln (Fl,QueryWork.fieldByname('RNTYP_SHORT').asstring);
        Writeln (Fl,QueryWork.fieldByname('SHOP_PREFIX').asstring+QueryWork.fieldByname('RN_NUM').asstring+
           QueryWork.fieldByname('SHOP_POSTFIX').asstring);
        Writeln (Fl,QueryWork.fieldByname('SKL_ID').asinteger);
        Writeln (Fl,QueryWork.fieldByname('SKL_FULL').asstring);

//  07/02/2008
//  Выгрузка в 1С клиента розница для наличных расходных накладных
        if QueryWork.fieldByname('RNTYP_ID').asinteger=1 then
          Writeln (Fl,6)
        else
          Writeln (Fl,QueryWork.fieldByname('KLN_ID').asinteger);
        Writeln (Fl,QueryWork.fieldByname('KLN_INN').asstring);
        Writeln (Fl,QueryWork.fieldByname('KLN_FULL').asstring);
        Writeln (Fl,floattostrf(arrrn[a].sum,fffixed,19,2)); // Сумма
        Writeln (Fl,floattostrf(arrrn[a].nds,fffixed,19,2)); // НДС
        Writeln (Fl,floattostrf(arrrn[a].seb,fffixed,19,2)); // Себестоимость
        Writeln (Fl,b_utils.left(delCR(QueryWork.fieldByname('RN_OSN').asstring),200));
        Writeln (Fl,QueryWork.fieldByname('SHOP_ID').asinteger); // Код магазина
        Writeln (Fl,b_utils.left(delCR(QueryWork.fieldByname('SHOP_NAME').asstring),64)); // Наименование магазина
        Writeln (Fl,QueryWork.fieldByname('RNTYP_ID').asinteger); // Код типа накладной
        Writeln (Fl,floattostrf(arrrn[a].nsp,fffixed,19,2)); // Налог с продаж
        Writeln (Fl,QueryWork.fieldByname('RVID_ID').asinteger); // вид реализации
        Writeln (Fl,QueryWork.fieldByname('RVID_KLN').asinteger); // клиент вида реализация
        Writeln (Fl,QueryWork.fieldByname('RES').asstring); // Счет-фактуры
        Writeln (Fl,floattostrf(QueryWork.fieldByname('PORN_SUMM').asfloat,fffixed,19,2)); // Сумма погашенной предоплаты
        Writeln (Fl,floattostrf(QueryWork.fieldByname('STORE_SUMM').asfloat,fffixed,19,2)); // Сумма хранения

         if (export_pn_stfact_fields = 1) then  //с 01.11.2013 - выгружать дополнительные поля в 1С
         begin
                 Writeln (Fl,formatdate(QueryWork.fieldByname('rn_stfakt_date').asdatetime,'/'));
                 Writeln (Fl,b_utils.left(delCR(QueryWork.fieldByname('rn_stfakt_num').asstring),250)); // Дата номер счет-фактуры
         end;


        Writeln (Fl,'$$2');
     end;
   end;
   if po_check.checked then begin
     Wait_Form.StatusBar1.panels[0].text:='Экспорт предоплат...';
     Wait_Form.Gauge1.Progress:=0;
     Wait_Form.Show;
     delay(100);
     ADD_SQL(QueryWork,'select count(*) as cc from po where po_date between :dt1 and :dt2 and po.frm_id=:frm_id ');
     QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=Dt2.date+1-Sekond1;
     QueryWork.Open;
     if QueryWork.eof then cntall:=0 else cntall:=QueryWork.fieldByname('CC').asinteger;
     ADD_SQL(QueryWork,'select shop.shop_name,shop.shop_prefix,shop.shop_postfix,po.* '+
     ' from shop,po where po_date between :dt1 and :dt2 '+
     ' and po.shop_id=shop.shop_id and po.frm_id=:frm_id');
     QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=Dt2.date+1-Sekond1;
     QueryWork.Open;
     cnt:=0;
     Wait_Form.StatusBar1.panels[0].text:='Выгрузка предоплат...';
     Wait_Form.Gauge1.Progress:=0;
     Wait_Form.Show;
     delay(100);
     while not QueryWork.eof do begin
       inc(Cnt);
       Wait_Form.Gauge1.Progress:=trunc(90*(cnt/cntall));
       delay(2);
       writeln (Fl,'$5');
       Writeln (Fl,QueryWork.fieldByname('PO_ID').asinteger);
       Writeln (Fl,QueryWork.fieldByname('SHOP_PREFIX').asstring+b_utils.right('0000000000'+QueryWork.fieldByname('PO_NUM').asstring,10)+
           QueryWork.fieldByname('SHOP_POSTFIX').asstring);
       Writeln (Fl,formatdate(QueryWork.fieldByname('PO_DATE').asdatetime,'/'));
       Writeln (Fl,QueryWork.fieldByname('KLN_ID').asinteger);
       ADD_SQL(QueryWork2,'select kln_inn from kln where kln_id=:kln_id');
        QueryWork2.ParamByName('KLN_ID').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
      QueryWork2.Open;
        if QueryWork2.eof then begin
          // Клиент не найден!!!!
       end else begin
         Writeln (Fl,QueryWork2.fieldByname('KLN_INN').asstring);
         ADD_SQL(QueryWork2,'select kln_full from kln_data(:kln_id)');
         QueryWork2.ParamByName('KLN_ID').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
         QueryWork2.Open;
          Writeln (Fl,QueryWork2.fieldByname('KLN_FULL').asstring);
      end;
       Writeln (Fl,floattostrf(QueryWork.fieldByname('PO_SUMM').asfloat,fffixed,19,2)); // Сумма
       Writeln (Fl,b_utils.left(delCR(QueryWork.fieldByname('PO_OSN').asstring),200));
       Writeln (Fl,QueryWork.fieldByname('SHOP_ID').asinteger); // Код магазина
       Writeln (Fl,b_utils.left(delCR(QueryWork.fieldByname('SHOP_NAME').asstring),64)); // Наименование магазина
       Writeln (Fl,'$$5');
       QueryWork.next;
     end;

      if ClearFirms.Checked then
     begin
     // Выгружаем, как удаленные предоплаты не "этой фирмы"
     ADD_SQL(QueryWork,'select po_id from po where (not frm_id=:frm_id) and po_date between :DT1 and :DT2' );
     QueryWork.ParamByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=my_now();
     QueryWork.Open;
     while not QueryWork.eof do begin
       writeln(Fl,'$5');
       writeln(Fl,QueryWork.fieldByname('PO_ID').asinteger);
       writeln(Fl,-1);
       writeln(Fl,'$$5');
       QueryWork.next;
     end;
    end;


     // Выгружаем удаленные предоплаты
     ADD_SQL(QueryWork,'select TABNAME_ID from del where TM between :DT1 and :DT2 and TABNAME="PO"' );
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=my_now();
     QueryWork.Open;
     while not QueryWork.eof do begin
       writeln(Fl,'$5');
       writeln(Fl,QueryWork.fieldByname('TABNAME_ID').asinteger);
       writeln(Fl,-1);
       writeln(Fl,'$$5');
       QueryWork.next;
     end;
     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     Wait_Form.Hide;
   end;

   // Выгружаем аналитику по поставщикам с выгрузкой НДС
   if check_an.checked then begin
          Wait_Form.StatusBar1.panels[0].text:='Запрос распределения аналитики ...';
          Wait_Form.Gauge1.Progress:=0;
          Wait_Form.Show;
          delay(1);
          QueryKorr.Close;
          KorrTransaction.Active:=fAlse;
          QueryKorr.paramByname('DT1').asdatetime:=Dt1.date;
          QueryKorr.paramByname('DT2').asdatetime:=Dt2.date+1-sekond1;
          QueryKorr.Open;
          Wait_Form.StatusBar1.panels[0].text:='Выгрузка аналитики ...';
          Wait_Form.Gauge1.Progress:=5;
          Wait_Form.Show;
          delay(1);
          ADD_SQL(QueryWork,'select * from list_korr(:dt1,:dt2)');
          QueryWork.paramByname('dt1').asdatetime:=Dt1.date;
          QueryWork.paramByname('dt2').asdatetime:=Dt2.date+1-sekond1;
          QueryWork.Open;
          while not QueryWork.eof do begin
                QueryKorr.first;
                while not QueryKorr.eof do begin
                  Writeln (Fl,'$4');
                  Writeln (Fl,QueryWork.fieldByname('TYP').asinteger);
                  Writeln (Fl,'с '+formatdate(Dt1.date,'/')+' по '+formatdate(Dt2.date,'/'));
                  Writeln (Fl,formatdate(Dt2.date,'/'));
                  Writeln (Fl,floattostrf(QueryWork.fieldByname('NDS').asfloat*QueryKorr.fieldByname('percent').asfloat,fffixed,19,2));
                  Writeln (Fl,QueryWork.fieldByname('KLN_ID').asinteger);
                  Writeln (Fl,QueryWork.fieldByname('KLN_INN').asstring);
                  Writeln (Fl,QueryWork.fieldByname('KLN_FULL').asstring);
                  Writeln (Fl,QueryKorr.fieldByname('SHOP_ID').asinteger);
                  Writeln (Fl,QueryKorr.fieldByname('SHOP_NAME').asstring);
                  Writeln (Fl,QueryKorr.fieldByname('SKL_ID').asinteger);
                  Writeln (Fl,QueryKorr.fieldByname('SKL_FULL').asstring);
                  Writeln (Fl,'$$4');
                  QueryKorr.next;
                end;
              QueryWork.next;
          end;
          QueryWork.close;
          Wait_Form.Gauge1.Progress:=100;
          Wait_Form.Show;
          delay(500);
   end;


    if Check_PER.Checked then
     begin
     // Выгружаем перемещения со склада или на склад логистики
     ADD_SQL(QueryWork,'select per_id, met, per_date, frm_id, summ, seb_summ, skl_id from LIST_PER_EXT_1S(:dt1, :dt2, :in_frm_id)');
     QueryWork.ParamByname('IN_FRM_ID').asinteger:=strtoint(FRM.value);
     QueryWork.ParamByname('DT1').asdatetime:=Dt1.date;
     QueryWork.ParamByname('DT2').asdatetime:=Dt2.date+1-sekond1;
     QueryWork.Open;
     while not QueryWork.eof do begin
       writeln(Fl,'$7');
       writeln(Fl,QueryWork.fieldByname('PER_ID').asinteger);
       writeln(Fl,QueryWork.fieldByname('MET').asString);
       Writeln(Fl,formatdate(QueryWork.fieldByname('PER_DATE').asdatetime,'/'));
       writeln(Fl,QueryWork.fieldByname('FRM_ID').asinteger);
       writeln(Fl,floattostrf(QueryWork.fieldByname('summ').asFloat,fffixed,19,2));
       writeln(Fl,floattostrf(QueryWork.fieldByname('seb_summ').asFloat,fffixed,19,2));
       writeln(Fl,QueryWork.fieldByname('SKL_ID').asinteger);
//       writeln(Fl,QueryWork.fieldByname('PO_ID').asinteger);
//       writeln(Fl,-1);
       writeln(Fl,'$$7');
       QueryWork.next;
     end;
    end;


    if chkZays.Checked then
     begin
     // Выгружаем перемещения со склада или на склад логистики
     ADD_SQL(QueryWork,'select out_str from EXP_ZAYS_TO_1S(:in_frm_id)');
     QueryWork.ParamByname('IN_FRM_ID').asinteger:=strtoint(FRM.value);     
     QueryWork.Open;
     while not QueryWork.eof do begin
       writeln(Fl,QueryWork.fieldByname('out_str').asString);
       QueryWork.next;
     end;
    end;










   Wait_Form.Hide;
   Messbox('Все документы выгружены!',MessSystem,48);
   finally
   closeFile(Fl);
   end;

end;

procedure TEXP_1C.FRMChange(Sender: TObject);
begin
   WorkTransaction.Active:=False;
   ADD_SQL(QueryWork,'select cfg_id,cfg_value from cfg where cfg_name="$1C_FRM_EXPORT_FILE" and cfg_set1=:cfg_set1');
   QueryWork.ParamByname('CFG_SET1').asinteger:=strtoint(FRM.value);
   QueryWork.Open;
   if QueryWork.eof then begin
        PathFile.text:='';
   end else begin
        PathFile.text:=QueryWork.fieldByname('CFG_VALUE').asstring
   end;
end;

procedure TEXP_1C.BtnPNClick(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select PNTYP_SHORT,PNTYP_ID from PNTYP order by PNTYP_ID');
     s:='';
     s2:='';
     if DualListDialog2.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog2.list2.Count do begin
            if QueryWork.Locate('PNTYP_SHORT',DualListDialog2.List2.Strings[a-1],[])
            then begin
                 s:=s+' '+QueryWork.fieldByname('PNTYP_ID').asstring+',';
                 s2:=s2+' '+QueryWork.fieldByname('PNTYP_SHORT').asstring+',';
            end;
        end;
        if length(s)>0 then s:=B_utils.left(s,length(s)-1);
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        PNTYP_S:=s;
        List_PN.text:=s2;
     end;
end;

end.



