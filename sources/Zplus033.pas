unit Zplus033;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls,ZData1,b_utils,zb_Dbutils, ActnList, ExtCtrls,
  Mask, ToolEdit, CurrEdit, Db, IBCustomDataSet, IBQuery, IBDatabase,
  RxLookup, RXSpin;

type
  TZPLUS_033 = class(TForm)
    Tabel: TCheckBox;
    ToolBar1: TToolBar;
    KTU: TCheckBox;
    ActionList1: TActionList;
    ActApply: TAction;
    ActSave: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    VALUTA: TRadioGroup;
    StatusBar1: TStatusBar;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    KOEFF: TRadioGroup;
    OSN: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    DicTransaction: TIBTransaction;
    DicOwner: TIBQuery;
    DsOwner: TDataSource;
    SET1: TRxDBLookupCombo;
    SET2: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    SET3: TRxCalcEdit;
    Label5: TLabel;
    Mes: TComboBox;
    Mes1: TRxSpinEdit;
    Label_Mes1: TLabel;
    Mes2: TRxSpinEdit;
    Label_Mes2: TLabel;
    procedure ActApplyExecute(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure VALUTAClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TabelClick(Sender: TObject);
    procedure KTUClick(Sender: TObject);
    procedure SUM1Change(Sender: TObject);
    procedure KOEFFClick(Sender: TObject);
    procedure OSNChange(Sender: TObject);
    procedure SET2Click(Sender: TObject);
    procedure SET1Change(Sender: TObject);
    procedure MesChange(Sender: TObject);
    procedure Mes1Change(Sender: TObject);
    procedure Mes2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZPLUS_033: TZPLUS_033;
  Save:boolean;

implementation

{$R *.DFM}

procedure TZPLUS_033.ActApplyExecute(Sender: TObject);
var
  a,ID:integer;
  r:double;
  s,s2,s3:string;
begin
     // формируем строку с описанием
     if valuta.itemindex=0 then s2:=' руб.' else s2:=' USD';
     // применить
     SAVE:=false;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        if KOEFF.itemindex=0 then IBSAVE_ADD('ZCALC_KOEFF',1) else IBSAVE_ADD('ZCALC_KOEFF',-1);
        IBSAVE_ADD('ZSTAT_ID',ZGlStat);
        IBSAVE_ADD('ZPLUS_CODE',ZGlCode);
        IBSAVE_ADD('VALUTA_ID',VALUTA.itemindex);
        IBSAVE_ADD('Y',ZGlYear);
        IBSAVE_ADD('M',ZGlMes);
        s:=floattostrf(set3.value,fffixed,19,2)+'% от остатка ';
        if SET2.itemindex=0 then s:=s+'рублевого' else s:=s+'долларового';
        s:=s+' товара, менеджера '+SET1.text;
        // формируем даты
        case MES.itemindex of
          0: begin
             s:=s+', закупленные за '+
             OKON_CHAR('последний ',' посление ','последние ',trunc(MES1.value))
             +inttostr(trunc(MES1.value))+
             OKON_CHAR(' мес€ц ',' мес€ца ',' мес€цев ',trunc(MES1.value));
          end;
          1: begin
              s:=s+', закупленные более '+
              floattostrf(MES1.value,fffixed,12,0)+
              OKON_CHAR(' мес€ца ',' мес€цев ',' мес€цев ',trunc(MES1.value))+' назад ';
          end;
          2: begin
              s:=s+', закупленные от '
              +inttostr(trunc(MES1.value))+' до '+inttostr(trunc(MES2.value))+
              OKON_CHAR(' мес€ца ',' мес€цев ',' мес€цев ',trunc(MES2.value))+' назад';
          end;
        end;
        IBSAVE_ADD('ZCALC_OPIS',S);
        IBSAVE_ADD('ZCALC_TABEL',TABEL.checked);
        IBSAVE_ADD('ZCALC_KTU',KTU.checked);
        IBSAVE_ADD('ZCALC_SUM',0); // обнул€ем сумму
        IBSAVE_ADD('ZCALC_MET',0); // обнул€ем метку расчета
        for a:=1 to 10 do IBSAVE_ADD('ZCALC_SET'+inttostr(a),'');
        IBSAVE_ADD('ZCALC_SET1',trim(set1.value));
        IBSAVE_ADD('ZCALC_SET2',inttostr(set2.itemindex));
        IBSAVE_ADD('ZCALC_SET3',doubletofixedstring(set3.value));
        IBSAVE_ADD('ZCALC_SET4',mes.itemindex);
        IBSAVE_ADD('ZCALC_SET5',inttostr(round(mes1.value)));
        if mes.itemindex=2 then IBSAVE_ADD('ZCALC_SET6',inttostr(round(mes2.value)));
        IBSAVE_ADD('ZCALC_SET10',trim(OSN.text));
        ID:=IBSAVE_DOC('ZCALC',tag);
        if ID<0 then r:=Sqrt(-1);
        tag:=ID;
        Datamodule1.IBTransaction2.Commit;
        Save:=True;
     Except
        Datamodule1.IBTransaction2.Rollback;
        Messbox('ќшибка при сохранении !',MessError,16);
     End;
     Datamodule1.IBTransaction2.Active:=False;
end;

procedure TZPLUS_033.ActSaveExecute(Sender: TObject);
begin
   if ActApply.enabled then begin
      ActApply.Execute;
      if SAVE then close;
   end;
end;

procedure TZPLUS_033.VALUTAClick(Sender: TObject);
var
 s:string;
begin
    save:=false;
    if valuta.itemindex=0 then s:=',#0.00 руб';
    if valuta.itemindex=1 then s:=',#0.00 USD';
end;

procedure TZPLUS_033.FormShow(Sender: TObject);
begin
   DicTransaction.Active:=False;
   DicOwner.close;
   DicOwner.open;
   if tag<=0 then begin
      SET1.value:='0';
      SET2.itemindex:=0;
      SET3.value:=1;
      OSN.text:='';
      mes.itemindex:=0;
      mes1.value:=6;
      mes2.value:=9;
   end else begin
      WorkTransaction.Active:=False;
      ADD_SQL(Querywork,'select * from zcalc where zcalc_id=:zcalc_id');
      QueryWork.ParamByname('zcalc_id').asinteger:=tag;
      QueryWork.open;
      OSN.text:=QueryWork.fieldByname('ZCALC_SET10').asstring;
      VALUTA.ItemIndex:=QueryWork.fieldByname('VALUTA_ID').asinteger;
      if QueryWork.fieldByname('ZCALC_KOEFF').asinteger=1 then KOEFF.itemindex:=0 else KOEFF.itemindex:=1;
      SET1.value:=trim(QueryWork.fieldByname('ZCALC_SET1').asstring);
      SET2.itemindex:=QueryWork.fieldByname('ZCALC_SET2').asinteger;
      SET3.value:=FixedStringToDouble(QueryWork.fieldByname('ZCALC_SET3').asstring);
      mes.itemindex:=QueryWork.fieldByname('ZCALC_SET4').asinteger;
      if mes.itemindex<2 then mes1.value:=QueryWork.fieldByname('ZCALC_SET5').asinteger
      else begin
         mes1.value:=QueryWork.fieldByname('ZCALC_SET5').asinteger;
         mes2.value:=QueryWork.fieldByname('ZCALC_SET6').asinteger;
      end;
   end;
   Mes.OnChange(Sender);
   Valuta.OnClick(Sender);
   save:=true;
end;

procedure TZPLUS_033.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose:=False;
     if not SAVE then begin
        if Messbox('ƒанные были изменены! ¬ы подтверждаете выход без сохранени€ изменений!',MessSubmit,4+48+256)=6
        then CanClose:=True;
     end else CanClose:=True;
end;

procedure TZPLUS_033.TabelClick(Sender: TObject);
begin
   save:=false;
end;

procedure TZPLUS_033.KTUClick(Sender: TObject);
begin
    save:=false;
end;

procedure TZPLUS_033.SUM1Change(Sender: TObject);
begin
    save:=false;
end;

procedure TZPLUS_033.KOEFFClick(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TZPLUS_033.OSNChange(Sender: TObject);
begin
   SAVE:=false;
end;

procedure TZPLUS_033.SET2Click(Sender: TObject);
begin
    save:=false;
end;

procedure TZPLUS_033.SET1Change(Sender: TObject);
begin
    save:=false;
end;

procedure TZPLUS_033.MesChange(Sender: TObject);
begin
     save:=false;
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

procedure TZPLUS_033.Mes1Change(Sender: TObject);
begin
     save:=false;
end;

procedure TZPLUS_033.Mes2Change(Sender: TObject);
begin
     save:=false;
end;

end.

