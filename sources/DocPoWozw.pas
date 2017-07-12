unit DocPoWozw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, ActnList, ComCtrls, ToolWin, StdCtrls, Buttons,
  CurrEdit, Mask, ToolEdit, Grids, DBGrids, RXDBCtrl, ExtCtrls, IBDatabase,
  Db, IBCustomDataSet, IBTable, IBQuery;

type
  TDOC_PO_WOZW = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Label1: TLabel;
    PO_NUM: TEdit;
    Label2: TLabel;
    PO_DATE: TDateEdit;
    Label3: TLabel;
    PO_SUMM: TRxCalcEdit;
    Label4: TLabel;
    PO_OSN: TEdit;
    Label5: TLabel;
    KLN_NAME: TEdit;
    Label6: TLabel;
    PO_OST: TRxCalcEdit;
    WorkTransaction: TIBTransaction;
    ActSave: TAction;
    ActApply: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    QueryWork: TIBQuery;
    ActKKM: TAction;
    ActHistory: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ActSelect: TAction;
    ToolButton8: TToolButton;
    PO: TEdit;
    Label7: TLabel;
    QueryWork2: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure PO_NUMChange(Sender: TObject);
    procedure ActApplyExecute(Sender: TObject);
    procedure Change_KLN;
    procedure ActSaveExecute(Sender: TObject);
    procedure ActKKMExecute(Sender: TObject);
    procedure ActHistoryExecute(Sender: TObject);
    procedure PO_DATEAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure ActSelectExecute(Sender: TObject);
    procedure RefreshWozw;
    procedure SAVE_RN_KASSIR();
  private
    { Private declarations }
    RN_KASSIR_ID: integer;
    RN_KASSA_ID: integer;
    FRM_ID: integer;
  public
    { Public declarations }
  end;

const
  PO_CAP_new='Документ "Предоплата". Новый';
  PO_CAP_edit='Документ "Предоплата". Изменение';
var
  DOC_PO_WOZW: TDOC_PO_WOZW;
  SAVE:boolean;
  PO_NUMS:integer;
  KLN_ID:integer;
  SHOP_ID:integer;
  close_date:tdatetime;
  WOZWID:integer;
  PAYMENT_TYPE: integer;
  NDS_TYPE: integer;

implementation

uses DicKlient,JouPO, FR_Shtrih, DocPo;

var
  JOU_PO2: TJOU_PO;


{$R *.DFM}

procedure TDOC_PO_WOZW.SAVE_RN_KASSIR();
begin
   RN_KASSA_ID:=KKM_ID;
   RN_KASSIR_ID := USERID;

   try
	IBSAVE_CLEAR;
    IBSAVE_ADD('KASSA_ID',RN_KASSA_ID);
	IBSAVE_ADD('KASSIR_ID',RN_KASSIR_ID);

    IBSAVE_DOC('PO',DOC_PO_WOZW.tag);
    Datamodule1.IBTransaction2.Commit;
   except
    Datamodule1.IBTransaction2.Rollback;
   end;
    Datamodule1.IBTransaction2.Active:=false;
end;

procedure TDOC_PO_WOZW.FormShow(Sender: TObject);
var
  EN:boolean;
  OS:double;
begin
  // проверяем, чтобы дата не была меньше закрытого периода
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork,' select cast((select period2.period_close from period period2 where '+
  'period2.usgroup_id=usgroup.usgroup_id and period2.period_change=(select max(period.period_change) from '+
  'period where period.usgroup_id=usgroup.usgroup_id)) as date) as dt '+
  'from kln,usgroup where kln.usgroup_id=usgroup.usgroup_id and (kln.kln_id=:kln_id) ');
  QueryWork.PAramByname('kln_id').asinteger:=userid;
  QueryWork.Open;
  if QueryWork.eof then close_date:=date()
  else close_date:=QueryWork.fieldByname('dt').asdatetime;
  Statusbar1.panels[0].text:='Период закрыт по '+date_sokr(close_date);
  if Doc_PO_WOZW.tag<0 then begin
     Doc_PO_WOZW.caption:=PO_CAP_new;
     //  Новая предоплата
     PO_NUMS:=-1;
     PO_NUM.text:='Новый';
     PO_DATE.date:=date();
     PO_SUMM.value:=0;
     KLN_ID:=Default_klient;
     PO_OSN.text:='';
     PO_OST.value:=0;
     SHOP_ID:=SHOPID;
     WOZWID:=-1;
     RN_KASSA_ID:=0;
     RN_KASSIR_ID:=0;
     ActSave.enabled:=(wozwID>0);
     ActApply.enabled:=(wozwID>0);
     ActKKM.enabled:=(wozwID>0);
     ActHistory.enabled:=(wozwID>0);
  end else begin
     Doc_PO_WOZW.caption:=PO_CAP_edit;
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select * from po where po_id=:po_id');
     QueryWork.ParamByname('PO_ID').asinteger:=Doc_PO_WOZW.tag;
     QueryWork.Open;
     PAYMENT_TYPE:=QueryWork.fieldByname('PAYMENT_TYPE').asinteger;
     NDS_TYPE:=QueryWork.fieldByname('NDS_TYPE').asinteger;

     PO_NUMS:=QueryWork.fieldByname('PO_NUM').asinteger;
     PO_NUM.text:=QueryWork.fieldByname('PO_NUM').asstring;
     PO_DATE.date:=QueryWork.fieldByname('PO_DATE').asdatetime;
     PO_SUMM.value:=-QueryWork.fieldByname('PO_SUMM').asfloat;
     KLN_ID:=QueryWork.fieldByname('KLN_ID').asinteger;
     PO_OSN.text:=QueryWork.fieldByname('PO_OSN').asstring;
     PO_OST.value:=0;
     WOZWID:=QueryWork.fieldByname('WOZW_ID').asinteger;
     SHOP_ID:=QueryWork.fieldByname('SHOP_ID').asinteger;
     RN_KASSA_ID:=QueryWork.fieldbyname('KASSA_ID').asinteger;
     RN_KASSIR_ID:=QueryWork.fieldbyname('KASSIR_ID').asinteger;
     RefreshWozw;
     if PO_DATE.date<close_date then begin
        EN:=false;
        Doc_PO_WOZW.caption:=Doc_PO_WOZW.caption+'. Только просмотр!';
     end else EN:=true;
     // закрываем правку
     PO_DATE.enabled:=EN;
     PO_SUMM.enabled:=EN;
     PO_OSN.enabled:=EN;
     ActSave.enabled:=EN;
     ActApply.enabled:=EN;
     ActSelect.enabled:=EN;
  end;
  Change_KLN;
  SAVE:=true;
end;

procedure TDOC_PO_WOZW.RefreshWozw;

begin

     ADD_SQL(QueryWork2,'select shop_prefix,shop_postfix,po.* from po,shop '+
     ' where po.shop_id=shop.shop_id and po.po_id=:po_id');
     QueryWork2.paramByname('po_id').asinteger:=WOZWID;
     QueryWork2.open;
     if QueryWork2.eof then begin
        PO.Color:=clred;
        PO.font.Color:=clYellow;
        PO.text:='Исходная предоплата была удалена! Код удаленной предоплаты: '+QueryWork.paramByname('wozw_id').asstring;
     end else begin
        PO.text:='№ '+QueryWork2.fieldByname('SHOP_PREFIX').asstring+b_utils.right('000000000'+QueryWork2.fieldByname('PO_NUM').asstring,10)+
        QueryWork2.fieldByname('SHOP_POSTFIX').asstring+' от '+date_sokr(QueryWork2.fieldByname('PO_DATE').asdatetime)+' на сумму '+floattostrf(QueryWork2.fieldByname('PO_SUMM').asfloat,fffixed,19,2)+' руб.';
        NDS_TYPE:=QueryWork2.fieldByname('NDS_TYPE').asinteger;
        PAYMENT_TYPE:=QueryWork2.fieldByname('PAYMENT_TYPE').asinteger;
        FRM_ID := QueryWork2.fieldByname('FRM_ID').asinteger;

     end;
end;

procedure TDOC_PO_WOZW.PO_NUMChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDOC_PO_WOZW.ActApplyExecute(Sender: TObject);
var
  ID:integer;
  OS,r:double;
begin
   // Применяем
   if PO_NUMS<0 then PO_NUMS:=NEW_PO_NUM(FRM_ID, PO_DATE.date);
   PO_NUM.text:=inttostr(PO_NUMS);
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
     ibsave_clear;
     ibsave_add('SHOP_ID',SHOP_ID);
     ibsave_add('PO_DATE',strtodatetime(datetostr(PO_DATE.date)+' '+timetostr(time())));
     ibsave_add('PO_NUM',PO_NUMS);
     ibsave_add('US_ID',USERID);
     ibsave_add('PO_OSN',trim(po_osn.text));
     ibsave_add('PO_SUMM',-okrug(PO_SUMM.value,2));
     ibsave_add('KLN_ID',KLN_ID);
     ibsave_add('WOZW_ID',WOZWID); // это не возврат
     ibsave_add('PAYMENT_TYPE',PAYMENT_TYPE);
     ibsave_add('NDS_TYPE',NDS_TYPE);
     ibsave_add('FRM_ID',FRM_ID);


     ID:=ibsave_doc('PO',DOC_PO_WOZW.tag);
     if ID<0 then r:=sqrt(-1);
     DOC_PO_WOZW.tag:=ID;
     SAVE:=true;
     Doc_PO_WOZW.caption:=PO_CAP_edit;
     Datamodule1.IBTransaction2.Commit;
     Datamodule1.IBTransaction2.Active:=False;
   except
     Datamodule1.IBTransaction2.Rollback;
   end;
   Datamodule1.IBTransaction2.Active:=False;
end;

procedure TDOC_PO_WOZW.Change_KLN;
begin
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork,'select kln_full from kln_data(:kln_id)');
  QueryWork.ParamByname('KLN_ID').asinteger:=KLN_ID;
  QueryWork.Open;
  KLN_NAME.text:=QueryWork.fieldByname('KLN_FULL').asstring;
end;

procedure TDOC_PO_WOZW.ActSaveExecute(Sender: TObject);
begin
   ActApply.Execute;
   if SAVE then close;
end;

procedure TDOC_PO_WOZW.ActKKMExecute(Sender: TObject);
var
        a,i:integer;
        s:string;
        KkmNum:integer;
        KlNum:integer;
        t1, t2: integer;
begin
   if Not Save and ActApply.enabled then ActApply.Execute;
   if not SAVE then messbox('Документ не записан!',MessSystem,48) else begin
    if rn_kassir_id <> 0 then
    begin
   	if MessBox('Чек по этой предоплате уже печатался. Вы уверены что хотите выбить чек снова?', MessSystem, MB_YESNO)=IDNO  then
    	exit;
    end;

     if messbox('Напечатать чек возврата?',MessSubmit,4+48+256)=6 then begin
       clear_cash;
       if Model_KKM=1 then begin
          s:='*****ВОЗВРАТ*****'+
          b_utils.left('№ ПО'+PO_NUM.text+space(24),17);
       end;
       if Model_KKM=3 then begin
          s:='ПО '+
          b_utils.left(PO_NUM.text+space(24),17);
       end;
       if Model_KKM=4 then
         begin
          s:='Возврат предоплаты №'+PO_NUM.text;
         end;

       if Model_KKM=2 then begin
         // ЭЛВЕС ФР
          s:=b_utils.left('ВОЗВРАТ № ПО'+PO_NUM.text+space(24),24);
       end;
       if length(s)>252 then s:=b_utils.left(s,252);
       add_cash(s,PO_SUMM.value,1,1, 'ВПО '+PO_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(doc_po_wozw.tag)+']', FRM_ID);
       // печатаем
     if NDS_TYPE = 0 then
     	t1:=0;
     if NDS_TYPE = 1 then
     	t1:=1;
     if NDS_TYPE = 2 then
     	t1:=-1;
       wozw_cash(t1, PAYMENT_TYPE);

       SAVE_RN_KASSIR();
     end;
   end;
end;

procedure TDOC_PO_WOZW.ActHistoryExecute(Sender: TObject);
begin
     {Отображаем "историю" документа}
     SHOW_HISTORY_DOC('Возврат предоплаты № '+PO_NUM.text,'PO',DOC_PO_WOZW.tag);
end;

procedure TDOC_PO_WOZW.PO_DATEAcceptDate(Sender: TObject; var ADate: TDateTime;
  var Action: Boolean);
begin
   if ADate<close_date then begin
      messbox('Указанная дата меньше даты закрытия периода!',MessSystem,48);
      ADate:=close_date;
      Action:=true;
      PO_DATE.date:=close_date;
   end else Action:=true;
end;

procedure TDOC_PO_WOZW.ActSelectExecute(Sender: TObject);
begin
   // выбрать предоплату для возврата
   application.createForm(TJou_PO,JOU_PO2);
   JOU_PO2.tag:=-1;
   JOU_PO2.showModal;
   if JOU_PO2.tag>0 then begin
      WOZWID:=JOU_PO2.tag;
      SAVE:=False;
      RefreshWozw;
   end;
   ActSave.enabled:=(wozwID>0);
   ActApply.enabled:=(wozwID>0);
   ActKKM.enabled:=(wozwID>0);
   ActHistory.enabled:=(wozwID>0);
   JOU_PO2.destroy;
end;

end.
