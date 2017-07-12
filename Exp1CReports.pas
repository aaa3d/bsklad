unit Exp1CReports;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,B_Dbutils, Db, IBCustomDataSet, IBQuery, IBDatabase, Grids,
  DBGridEh, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup;

type
  TEXP_1C_REPORTS = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    RepTransaction: TIBTransaction;
    QueryRep: TIBQuery;
    DsRep: TDataSource;
    PnDicFrm: TIBQuery;
    PnDicFrmFRM_ID: TIntegerField;
    PnDicFrmFRM_FULL: TIBStringField;
    PnDicFrmFRM_REKW: TIBStringField;
    DsPnDicFrm: TDataSource;
    PnDicFrmTransaction: TIBTransaction;
    FRM: TRxDBLookupCombo;
    Label3: TLabel;
    Label1: TLabel;
    DT1: TDateEdit;
    Label2: TLabel;
    DT2: TDateEdit;
    Label4: TLabel;
    REP: TComboBox;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EXP_1C_REPORTS: TEXP_1C_REPORTS;

implementation

{$R *.DFM}

procedure TEXP_1C_REPORTS.Button2Click(Sender: TObject);
begin
    close;
end;

procedure TEXP_1C_REPORTS.FormShow(Sender: TObject);
begin
   dt1.date:=date();
   dt2.date:=date();
   Rep.itemindex:=0;
   PnDicFrmTransaction.Active:=False;
   PnDicFrm.close;
   PnDicFrm.Open;
   FRM.value:=PnDicFrm.fieldByname('FRM_ID').asstring;

end;

procedure TEXP_1C_REPORTS.Button1Click(Sender: TObject);
begin
     RepTransaction.Active:=False;
     case REP.itemindex of
       0: // Отчет - счета-фактуры белые по контрагенам
          ADD_SQL(QueryRep,'select sum(bg_fixedpoint(pns2$.pns2$_summ-pns2$.pns2$_nds_summ,2)) as SUMMA_BEZ_NDS, '+
                'sum(bg_fixedpoint(pns2$.pns2$_nds_summ,2)) as SUMMA_NDS, '+
                'bg_left(kln.kln_org,1000) as Klient '+
                'from pns2$,pn$,kln where pn$.pn$_id=pns2$.pn$_id and pns2$.kln_id=kln.kln_id '+
                ' and pn$.frm_id=:FRM_ID and pn$.pn$_date between :dt1 and :dt2 '+
                ' and pns2$.pns2$_met in (0,2) '+
                ' and bg_left(bg_toupper(pns2$.doc),5)="СЧ-Ф." '+
                ' group by kln_org,kln_id order by 3 ');
       1: // Счета-фактуры черные по контрагентам
          ADD_SQL(QueryRep,'select sum(bg_fixedpoint(pns2$.pns2$_summ-pns2$.pns2$_nds_summ,2)) as SUMMA_BEZ_NDS, '+
                'sum(bg_fixedpoint(pns2$.pns2$_nds_summ,2)) as SUMMA_NDS, '+
                'bg_left(kln.kln_org,1000) as Klient '+
                'from pns2$,pn$,kln where pn$.pn$_id=pns2$.pn$_id and pns2$.kln_id=kln.kln_id '+
                ' and pn$.frm_id=:FRM_ID and pn$.pn$_date between :dt1 and :dt2 '+
                ' and pns2$.pns2$_met in (1,2) '+
                ' and bg_left(bg_toupper(pns2$.doc),5)="СЧ-Ф." '+
                ' group by kln_org,kln_id order by 3 ');
       2: // Авансовые белые по сотрудникам
          ADD_SQL(QueryRep,'select sum(bg_fixedpoint(pns2$.pns2$_summ-pns2$.pns2$_nds_summ,2)) as SUMMA_BEZ_NDS, '+
                'sum(bg_fixedpoint(pns2$.pns2$_nds_summ,2)) as SUMMA_NDS, '+
                'bg_left(kln.kln_fam,1000) as Klient '+
                'from pns2$,pn$,kln where pn$.pn$_id=pns2$.pn$_id and pns2$.kln_id=kln.kln_id '+
                ' and pn$.frm_id=:FRM_ID and pn$.pn$_date between :dt1 and :dt2 '+
                ' and pns2$.pns2$_met in (0,2) '+
                ' and bg_left(bg_toupper(pns2$.doc),6)="АВ.ОТ." '+
                ' group by kln_fam,kln_id order by 3 ');
       3: // Авансовые черные по сотрудникам
          ADD_SQL(QueryRep,'select sum(bg_fixedpoint(pns2$.pns2$_summ-pns2$.pns2$_nds_summ,2)) as SUMMA_BEZ_NDS, '+
                'sum(bg_fixedpoint(pns2$.pns2$_nds_summ,2)) as SUMMA_NDS, '+
                'bg_left(kln.kln_fam,1000) as Klient '+
                'from pns2$,pn$,kln where pn$.pn$_id=pns2$.pn$_id and pns2$.kln_id=kln.kln_id '+
                ' and pn$.frm_id=:FRM_ID and pn$.pn$_date between :dt1 and :dt2 '+
                ' and pns2$.pns2$_met in (1,2) '+
                ' and bg_left(bg_toupper(pns2$.doc),6)="АВ.ОТ." '+
                ' group by kln_fam,kln_id order by 3 ');
       4: // Отчет - счета-фактуры белые по контрагенам в разрезе накладны[
             ADD_SQL(QueryRep,'select pntyp.pntyp_short, '+
                ' pn$.pn$_NUM,pn$.pn$_date, '+
                ' sum(bg_fixedpoint(pns2$.pns2$_summ-pns2$.pns2$_nds_summ,2)) as SUMMA_BEZ_NDS, '+
                ' sum(bg_fixedpoint(pns2$.pns2$_nds_summ,2)) as SUMMA_NDS, '+
                ' bg_left(kln.kln_org,1000) as Klient '+
                ' from pns2$,pn$,kln,pntyp '+
                ' where pn$.pn$_id=pns2$.pn$_id '+
                ' and pns2$.kln_id=kln.kln_id '+
                ' and (pn$.pntyp_id=pntyp.pntyp_id) '+
                ' and (pn$.frm_id=:FRM_ID) '+
                ' and pn$.pn$_date between :DT1 and :DT2 '+
                ' and (pns2$.pns2$_met in (0,2)) '+
                ' and bg_left(bg_toupper(pns2$.doc),5)="СЧ-Ф." '+
                ' group by kln_org,kln_id,pn$_num,pn$_date,pntyp_short '+
                ' order by kln_org,pn$_date ');
       5: // Отчет - счета-фактуры черные по контрагенам в разрезе накладны[
             ADD_SQL(QueryRep,'select pntyp.pntyp_short, '+
                ' pn$.pn$_NUM,pn$.pn$_date, '+
                ' sum(bg_fixedpoint(pns2$.pns2$_summ-pns2$.pns2$_nds_summ,2)) as SUMMA_BEZ_NDS, '+
                ' sum(bg_fixedpoint(pns2$.pns2$_nds_summ,2)) as SUMMA_NDS, '+
                ' bg_left(kln.kln_org,1000) as Klient '+
                ' from pns2$,pn$,kln,pntyp '+
                ' where pn$.pn$_id=pns2$.pn$_id '+
                ' and pns2$.kln_id=kln.kln_id '+
                ' and (pn$.pntyp_id=pntyp.pntyp_id) '+
                ' and (pn$.frm_id=:FRM_ID) '+
                ' and pn$.pn$_date between :DT1 and :DT2 '+
                ' and (pns2$.pns2$_met in (1,2)) '+
                ' and bg_left(bg_toupper(pns2$.doc),5)="СЧ-Ф." '+
                ' group by kln_org,kln_id,pn$_num,pn$_date,pntyp_short '+
                ' order by kln_org,pn$_date ');
       6: // Отчет - авнаосвые белые по контрагенам в разрезе накладны[
             ADD_SQL(QueryRep,'select pntyp.pntyp_short, '+
                ' pn$.pn$_NUM,pn$.pn$_date, '+
                ' sum(bg_fixedpoint(pns2$.pns2$_summ-pns2$.pns2$_nds_summ,2)) as SUMMA_BEZ_NDS, '+
                ' sum(bg_fixedpoint(pns2$.pns2$_nds_summ,2)) as SUMMA_NDS, '+
                ' bg_left(kln.kln_fam,1000) as Klient '+
                ' from pns2$,pn$,kln,pntyp '+
                ' where pn$.pn$_id=pns2$.pn$_id '+
                ' and pns2$.kln_id=kln.kln_id '+
                ' and (pn$.pntyp_id=pntyp.pntyp_id) '+
                ' and (pn$.frm_id=:FRM_ID) '+
                ' and pn$.pn$_date between :DT1 and :DT2 '+
                ' and (pns2$.pns2$_met in (0,2)) '+
                ' and bg_left(bg_toupper(pns2$.doc),6)="АВ.ОТ." '+
                ' group by kln_fam,kln_id,pn$_num,pn$_date,pntyp_short '+
                ' order by kln_fam,pn$_date ');
       7: // Отчет - авнаосвые ЧЕРНЫЕ по контрагенам в разрезе накладны[
             ADD_SQL(QueryRep,'select pntyp.pntyp_short, '+
                ' pn$.pn$_NUM,pn$.pn$_date, '+
                ' sum(bg_fixedpoint(pns2$.pns2$_summ-pns2$.pns2$_nds_summ,2)) as SUMMA_BEZ_NDS, '+
                ' sum(bg_fixedpoint(pns2$.pns2$_nds_summ,2)) as SUMMA_NDS, '+
                ' bg_left(kln.kln_fam,1000) as Klient '+
                ' from pns2$,pn$,kln,pntyp '+
                ' where pn$.pn$_id=pns2$.pn$_id '+
                ' and pns2$.kln_id=kln.kln_id '+
                ' and (pn$.pntyp_id=pntyp.pntyp_id) '+
                ' and (pn$.frm_id=:FRM_ID) '+
                ' and pn$.pn$_date between :DT1 and :DT2 '+
                ' and (pns2$.pns2$_met in (1,2)) '+
                ' and bg_left(bg_toupper(pns2$.doc),6)="АВ.ОТ." '+
                ' group by kln_fam,kln_id,pn$_num,pn$_date,pntyp_short '+
                ' order by kln_fam,pn$_date ');

     end;

     QueryRep.paramByname('FRM_ID').asinteger:=strtoint(FRM.value);
     QueryRep.paramByname('DT1').asdatetime:=dt1.date;
     QueryRep.paramByname('DT2').asdatetime:=dt2.date+1-sekond1;
     QueryRep.Open;
end;

end.

