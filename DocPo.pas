unit DocPo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, ActnList, ComCtrls, ToolWin, StdCtrls, Buttons,
  CurrEdit, Mask, ToolEdit, Grids, DBGrids, RXDBCtrl, ExtCtrls, IBDatabase,
  Db, IBCustomDataSet, IBTable, IBQuery,Unit_AMC100F,PrintKKM, RxLookup;

type
  TDOC_PO = class(TForm)
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
    BTN_KLN: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
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
    UseTransaction: TIBTransaction;
    QueryUse: TIBQuery;
    QueryUseDOC_TYP: TIntegerField;
    QueryUseDOC_ID: TIntegerField;
    QueryUseDOC_DATE: TDateTimeField;
    QueryUseDOC_FULL_NUM: TIBStringField;
    QueryUseDOC_SUMM: TFloatField;
    QueryUseDOC_OSN: TIBStringField;
    QueryUseKLN_FULL: TIBStringField;
    QueryUseUS_FULL: TIBStringField;
    DsUse: TDataSource;
    QueryUseDOC_COLOR: TIntegerField;
    QueryUsePO_SUMM: TFloatField;
    CBPaymentType: TCheckBox;
    NDSType: TComboBox;
    Label8: TLabel;
    FRM: TRxDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure PO_NUMChange(Sender: TObject);
    procedure ActApplyExecute(Sender: TObject);
    procedure BTN_KLNClick(Sender: TObject);
    procedure Change_KLN;
    procedure ActSaveExecute(Sender: TObject);
    procedure ActKKMExecute(Sender: TObject);
    procedure ActHistoryExecute(Sender: TObject);
    procedure PO_DATEAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure SAVE_RN_KASSIR();
    procedure FRMChange(Sender: TObject);

  private
    { Private declarations }
    RN_KASSIR_ID: integer;
    RN_KASSA_ID: integer;
  public
    { Public declarations }
  end;

const
  PO_CAP_new='Документ "Предоплата". Новый';
  PO_CAP_edit='Документ "Предоплата". Изменение';
var
  DOC_PO: TDOC_PO;
  SAVE:boolean;
  PO_NUMS:integer;
  SHOP_ID:integer;
  close_date:tdatetime;

implementation

uses DicKlient, FR_Shtrih;

{$R *.DFM}

procedure TDOC_PO.SAVE_RN_KASSIR();
begin
   RN_KASSA_ID:=KKM_ID;
   RN_KASSIR_ID := USERID;

   try
	IBSAVE_CLEAR;
    IBSAVE_ADD('KASSA_ID',RN_KASSA_ID);
	IBSAVE_ADD('KASSIR_ID',RN_KASSIR_ID);

    IBSAVE_DOC('PO',DOC_PO.tag);
    Datamodule1.IBTransaction2.Commit;
   except
    Datamodule1.IBTransaction2.Rollback;
   end;
    Datamodule1.IBTransaction2.Active:=false;
end;


procedure TDOC_PO.FormShow(Sender: TObject);
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









  if Doc_PO.tag<0 then begin
     Doc_PO.caption:=PO_CAP_new;
     PO_NUMS:=-1;
     PO_NUM.text:='Новый';
     PO_DATE.date:=date();
     PO_OST.value:=0;
     SHOP_ID:=SHOPID;
     NDSTYPE.ItemIndex:=0;
     RN_KASSA_ID:=0;
     RN_KASSIR_ID:=0;
     SAVE:=FALSE;

    //Определяем НДС по умолчанию
    DataModule1.MainDicRnTyp.Locate('RNTYP_ID',DEFAULT_RNTYP_KKM,[]);
    if DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger=1 then
        NDSType.itemindex:=1
    else
        NDSType.itemindex:=0;


     {доступны ВСЕ фирмы}
     if FRM.tag>0 then
     begin
     	FRM.Value := inttostR(FRM.tag);
      FRM.Enabled:=false;
     end
     else
     begin
 //     if gl_SHOP_FRM > 0 then
//      begin
//        frm.LookupSource := DataModule1.MainDsOsnFrm;
//        frm.Value := inttostr(gl_SHOP_FRM);
////        FRM.ENABLED:=false;
//      end
//      else
//      begin
//        frm.LookupSource := DataModule1.MainDsDopFrm;
//        frm.Value := DataModule1.MainDicDopFrm.fieldbyname('KLN_ID').asstring;
//        FRM.ENABLED:=true;
//        NDSType.Enabled:=false;
//      end



     end;


     //  Новая предоплата
     if DOC_PO.tag=-2 then begin
       // предоплата формируется на основании документа
     end else begin
       PO_SUMM.value:=0;
       KLN_NAME.tag:=Default_klient;
       PO_OSN.text:='';
     end;
  end else begin
     Doc_PO.caption:=PO_CAP_edit;
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select * from po where po_id=:po_id');
     QueryWork.ParamByname('PO_ID').asinteger:=Doc_PO.tag;
     QueryWork.Open;
     PO_NUMS:=QueryWork.fieldByname('PO_NUM').asinteger;
     PO_NUM.text:=QueryWork.fieldByname('PO_NUM').asstring;
     PO_DATE.date:=QueryWork.fieldByname('PO_DATE').asdatetime;
     PO_SUMM.value:=QueryWork.fieldByname('PO_SUMM').asfloat;
     KLN_NAME.tag:=QueryWork.fieldByname('KLN_ID').asinteger;
     PO_OSN.text:=QueryWork.fieldByname('PO_OSN').asstring;
     RN_KASSA_ID:=QueryWork.fieldbyname('KASSA_ID').asinteger;
     RN_KASSIR_ID:=QueryWork.fieldbyname('KASSIR_ID').asinteger;
     if ( QueryWork.fieldByname('PAYMENT_TYPE').asinteger = 1) then CBPaymentType.checked := true;
     NDSTYPE.ItemIndex:=QueryWork.fieldByname('NDS_TYPE').asinteger;


     //Установка фирмы
     FRM.Value := inttostr(QueryWork.fieldByname('FRM_ID').asinteger);
     FRM.Enabled:=false;
     NDSType.Enabled:=false;

//     if FRM.Value='' then
//     begin
//        Datamodule1.IbSaveSQL.Transaction.Active:=false;
//        Datamodule1.IbSaveSQL.SQL.Text:='SELECT KLN_FULL FROM KLN_DATA(:KLN_ID)';
//        Datamodule1.IbSaveSQL.parambyname('KLN_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
//		Datamodule1.IbSaveSQL.Open;
//        if not Datamodule1.IbSaveSQL.Eof then
//        begin
//       		FRM.displayempty:=Datamodule1.IbSaveSQL.Fieldbyname('KLN_FULL').asstring;
//            FRM.emptyvalue:=inttostR(QueryWork.fieldByname('FRM_ID').asinteger);
//        end;
//        Datamodule1.IbSaveSQL.Close;
//     end;


     NDSType.Enabled:=false;
     PO_OST.value:=0;
     SHOP_ID:=QueryWork.fieldByname('SHOP_ID').asinteger;
     if PO_DATE.date<close_date then begin
        EN:=false;
        Doc_PO.caption:=Doc_PO.caption+'. Только просмотр!';
     end else EN:=true;
     // закрываем правку
     PO_DATE.enabled:=EN;
     PO_SUMM.enabled:=EN;
     PO_OSN.enabled:=EN;
     BTN_KLN.enabled:=EN;
     ActSave.enabled:=EN;
     ActApply.enabled:=EN;
     QueryUse.close;
     UseTransaction.Active:=False;
     OS:=QueryWork.fieldByname('PO_SUMM').asfloat;
     QueryUse.paramByname('PO_ID').asinteger:=DOC_PO.tag;
     QueryUse.Open;
     while not QueryUse.eof do begin
        OS:=OS-QueryUse.fieldByname('PO_SUMM').asfloat;
        QueryUse.next;
     end;
     PO_OST.value:=OS;
     QueryUse.first;
  end;
  Change_KLN;
  SAVE:=true;
end;

procedure TDOC_PO.PO_NUMChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDOC_PO.ActApplyExecute(Sender: TObject);
var
  ID:integer;
  OS,r:double;
begin
   // Применяем
   if PO_NUMS<0 then PO_NUMS:=NEW_PO_NUM(strtoint('0'+frm.Value), PO_DATE.date);
   PO_NUM.text:=inttostr(PO_NUMS);

   if FRM.value='' then
   begin
     Messbox('Не указана фирма!',  MessError, MB_OK);
     exit;
   end;

   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
     ibsave_clear;
     ibsave_add('SHOP_ID',SHOP_ID);
     ibsave_add('PO_DATE',strtodatetime(datetostr(PO_DATE.date)+' '+timetostr(time())));
     ibsave_add('PO_NUM',PO_NUMS);
     ibsave_add('US_ID',USERID);
     ibsave_add('PO_OSN',trim(po_osn.text));
     ibsave_add('PO_SUMM',okrug(PO_SUMM.value,2));
     ibsave_add('KLN_ID',KLN_NAME.tag);
     if CBPaymentType.checked then ibsave_add('PAYMENT_TYPE',1)
     	else ibsave_add('PAYMENT_TYPE',0);
     ibsave_add('NDS_TYPE',NDSTYPE.itemindex);
     IBSAVE_ADD('FRM_ID', strtoint(FRM.value));
     


     ibsave_add('WOZW_ID',0); // это не возврат
     ID:=ibsave_doc('PO',DOC_PO.tag);
     if ID<0 then r:=sqrt(-1);
     DOC_PO.tag:=ID;
     SAVE:=true;
     Doc_PO.caption:=PO_CAP_edit;
     Datamodule1.IBTransaction2.Commit;
     Datamodule1.IBTransaction2.Active:=False;
     QueryUse.close;
     UseTransaction.Active:=False;
     OS:=PO_SUMM.value;
     QueryUse.paramByname('PO_ID').asinteger:=DOC_PO.tag;
     QueryUse.Open;
     while not QueryUse.eof do begin
        OS:=OS-QueryUse.fieldByname('DOC_SUMM').asfloat;
        QueryUse.next;
     end;
     PO_OST.value:=OS;
     QueryUse.first;
   except
     Datamodule1.IBTransaction2.Rollback;
   end;
   Datamodule1.IBTransaction2.Active:=False;
end;

procedure TDOC_PO.BTN_KLNClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=KLN_NAME.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN_NAME.tag then begin
        KLN_NAME.tag:=DIC_KLIENT.tag;
        Change_Kln;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TDOC_PO.Change_KLN;
begin
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork,'select kln_full from kln_data(:kln_id)');
  QueryWork.ParamByname('KLN_ID').asinteger:=KLN_NAME.tag;
  QueryWork.Open;
  KLN_NAME.text:=QueryWork.fieldByname('KLN_FULL').asstring;
end;

procedure TDOC_PO.ActSaveExecute(Sender: TObject);
begin
   ActApply.Execute;
   if SAVE then close;
end;

procedure TDOC_PO.ActKKMExecute(Sender: TObject);
var
        a,i:integer;
        s:string;
        KkmNum:integer;
        KlNum:integer;
begin
   if Not Save and ActApply.enabled then ActApply.Execute;
   if not SAVE then messbox('Документ не записан!',MessSystem,48) else begin
     clear_cash;

   if rn_kassir_id <> 0 then
    begin
   	if MessBox('Чек по этой предоплате уже печатался. Вы уверены что хотите выбить чек снова?', MessSystem, MB_YESNO)=IDNO  then
    	exit;
    end;



     if Model_KKM=1 then begin
        s:='***ПРЕДОПЛАТА****'+
        b_utils.left('№ ПО'+PO_NUM.text+space(24),17);
     end;
     if Model_KKM=3 then begin
        s:='ПО '+
        b_utils.left(PO_NUM.text+space(24),17);
     end;
     if Model_KKM=4 then
     begin
        s:='Предоплата №'+PO_NUM.text;
     end;

     if Model_KKM=2 then begin
       // ЭЛВЕС ФР
        s:=b_utils.left('ПРЕДОПЛАТА ПО'+PO_NUM.text+space(24),24);
     end;
     if length(s)>252 then s:=b_utils.left(s,252);

     add_cash(s,PO_SUMM.value,1,1, 'ПО '+PO_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(doc_po.tag)+']', strtoint(FRM.value));

     Application.createForm(TPRINT_KKM,PRINT_KKM);
     PRINT_KKM.MON1.value:=PO_SUMM.value;
     PRINT_KKM.MON2.value:=PO_SUMM.value;



     if NDStype.itemIndex = 0 then
     	PRINT_KKM.label3.tag:=0;
     if NDStype.itemIndex = 1 then
     	PRINT_KKM.label3.tag:=1;
     if NDStype.itemIndex = 2 then
     	PRINT_KKM.label3.tag:=-1;

     if CBPaymentType.checked then PRINT_KKM.label2.tag:=1;		//если=1 - безналичный расчет

     PRINT_KKM.showModal;
     if PRINT_KKM.tag>0 then begin // фиксируем факт печати чека
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        try
            GetKkmNum(KkmNum);
            GetKlNum(KlNum);
            ibsave_clear;
            IBSAVE_CLEAR;
            IBSAVE_ADD('US_ID',USERID);
            IBSAVE_ADD('SHOP_ID',SHOPID);
            IBSAVE_ADD('MESS','Чек. КЛ № '+inttostr(KlNum)+', ККМ № '+inttostr(KKMnum));
            IBSAVE_ADD('DOP1',6); // Метка вставки
            IBSAVE_ADD('DOP2',DOC_PO.tag);
            IBSAVE_ADD('DOC','PO'); // Название таблицы
            IBSAVE_DOC('ARCUPDATE',-1);
            Datamodule1.IBTransaction2.Commit;
            Datamodule1.IBTransaction2.Active:=False;
        except
           Datamodule1.IBTransaction2.Rollback;
        end;
        Datamodule1.IBTransaction2.Active:=False;
     end;
     PRINT_KKM.destroy;
     SAVE_RN_KASSIR();
   end;
end;

procedure TDOC_PO.ActHistoryExecute(Sender: TObject);
begin
     {Отображаем "историю" документа}
     SHOW_HISTORY_DOC('Предоплата № '+PO_NUM.text,'PO',DOC_PO.tag);
end;

procedure TDOC_PO.PO_DATEAcceptDate(Sender: TObject; var ADate: TDateTime;
  var Action: Boolean);
begin
   if ADate<close_date then begin
      messbox('Указанная дата меньше даты закрытия периода!',MessSystem,48);
      ADate:=close_date;
      Action:=true;
      PO_DATE.date:=close_date;
   end else Action:=true;

end;

procedure TDOC_PO.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('DOC_COLOR').Asinteger>=0 then begin
           if ansiuppercase(Column.Field.FullName)='DOC_FULL_NUM' then Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('DOC_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('DOC_COLOR').Asinteger>=0 then begin
              if ansiuppercase(Column.Field.FullName)='DOC_FULL_NUM' then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('DOC_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
end;

procedure TDOC_PO.RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TDOC_PO.FRMChange(Sender: TObject);
begin
	save:=false;
end;

end.
