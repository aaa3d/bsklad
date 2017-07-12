unit DocRnWozw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ExtCtrls,Data1,b_utils,b_dbutils,
  StdCtrls, CurrEdit, Mask, ToolEdit, Db, RxMemDS, Menus, ActnList,
  IBCustomDataSet, IBQuery, IBDatabase, RxLookup, Buttons,DetalTW, PrintKKM;

type
  TDOC_RN_WOZW = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label2: TLabel;
    RN_OSN: TMemo;
    Label3: TLabel;
    RN_DATE: TDateEdit;
    Label4: TLabel;
    RN_NUM: TEdit;
    Label5: TLabel;
    RxCalcEdit1: TRxCalcEdit;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    MemWozw: TRxMemoryData;
    MemWozwTW_ID: TIntegerField;
    MemWozwRNS_ID: TIntegerField;
    MemWozwTW_ART: TIntegerField;
    MemWozwTW_NAM: TStringField;
    MemWozwWOZW_ID: TIntegerField;
    MemWozwDOC_NAME: TStringField;
    MemWozwDOC_DATE: TDateField;
    MemWozwED_SHORT: TStringField;
    MemWozwRNS_MONEY: TFloatField;
    MemWozwRNS_KOL: TFloatField;
    MemWozwRNS_OST: TFloatField;
    MemWozwRNS_SUMM: TFloatField;
    MemWozwWOZW_KOL: TFloatField;
    MemWozwWOZW_SUMM: TFloatField;
    DsWozw: TDataSource;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ActionList1: TActionList;
    MnLock: TAction;
    MnProw: TAction;
    MnUnprow: TAction;
    MnSave: TAction;
    MnApply: TAction;
    MnPrint: TAction;
    MnDicTw: TAction;
    MnDel: TAction;
    MnDetal: TAction;
    MnAnaliz: TAction;
    MnMarket: TAction;
    PopupMenu1: TPopupMenu;
    MnLock1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    ToolButton17: TToolButton;
    Label7: TLabel;
    KLN_NAME: TEdit;
    BtnKln: TSpeedButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Image1: TImage;
    MemWozwSHOP_ID: TIntegerField;
    MemWozwSHOP_NAME: TStringField;
    QueryWork2: TIBQuery;
    ActKKM: TAction;
    ToolButton18: TToolButton;
    MemWozwRNS_TABEL: TIntegerField;
    Label8: TLabel;
    Label9: TLabel;
    NDS: TRxCalcEdit;
    NP: TRxCalcEdit;
    N16: TMenuItem;
    MemWozwTW_SHORT_NAM: TStringField;
    Label1: TLabel;
    SKL: TRxDBLookupCombo;
    Label6: TLabel;
    FRM: TRxDBLookupCombo;
    IBSkl: TIBQuery;
    IBSklSKL_ID: TIntegerField;
    IBSklSKL_SHORT: TIBStringField;
    IBSklSKL_FRM: TIntegerField;
    IBSklFRM_NAME: TIBStringField;
    DSSkl: TDataSource;
    IBTransaction1: TIBTransaction;
    MemWozwTW_SALER_ID: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MnDicTwExecute(Sender: TObject);
    procedure MnDelExecute(Sender: TObject);
    procedure MemWozwAfterDelete(DataSet: TDataSet);
    procedure DsWozwDataChange(Sender: TObject; Field: TField);
    procedure MemWozwCalcFields(DataSet: TDataSet);
    procedure MemWozwAfterScroll(DataSet: TDataSet);
    procedure MnApplyExecute(Sender: TObject);
    procedure MnSaveExecute(Sender: TObject);
    procedure RN_DATEChange(Sender: TObject);
    procedure FRMChange(Sender: TObject);
    procedure RN_OSNChange(Sender: TObject);
    procedure BtnKlnClick(Sender: TObject);
    Procedure Change_KLN;
    Procedure SHow_sost;
    procedure MemWozwBeforePost(DataSet: TDataSet);
    procedure MnProwExecute(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure MnUnprowExecute(Sender: TObject);
    procedure MnDetalExecute(Sender: TObject);
    procedure MnAnalizExecute(Sender: TObject);
    procedure MnMarketExecute(Sender: TObject);
    procedure MnLockExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MemWozwWOZW_KOLChange(Sender: TField);
    procedure ActKKMExecute(Sender: TObject);
    procedure refreshWozw;
    procedure SAVE_RN_KASSIR();
    procedure SKLChange(Sender: TObject);
  private
    { Private declarations }
    RN_KASSA_ID: integer;
    RN_KASSIR_ID: integer;
  public
    { Public declarations }
  end;

var
  DOC_RN_WOZW: TDOC_RN_WOZW;
  RN_NUMS:integer;
  Save,CanInsert:Boolean;
  RVID_ID,RVID_KLN,RVID_SUBKLN:integer;
  SHOP_ID:integer;

  SKL_ID: integer;
  KLN_ID:integer;

  WOZW_PROW:boolean;
  RNS_DEL:array[1..1000] of integer;
  CNT_DEL:integer=0;
  canRefresh: boolean;

implementation

uses SelectWozw, DicKlient, ANALIZTW, WaitForm, SelectPrint, FR_Shtrih;

{$R *.DFM}


procedure TDOC_RN_WOZW.SAVE_RN_KASSIR();
begin
   RN_KASSA_ID:=KKM_ID;
   RN_KASSIR_ID := USERID;

   try
	IBSAVE_CLEAR;
    IBSAVE_ADD('KASSA_ID',RN_KASSA_ID);
	IBSAVE_ADD('KASSIR_ID',RN_KASSIR_ID);

    IBSAVE_DOC('RN',DOC_RN_WOZW.tag);
    Datamodule1.IBTransaction2.Commit;
   except
    Datamodule1.IBTransaction2.Rollback;
   end;
    Datamodule1.IBTransaction2.Active:=false;
end;


procedure TDOC_RN_WOZW.FormShow(Sender: TObject);
begin
   canRefresh := false;


   Show_Wait('Инициализация накладной. Склады...',2);



   IS_EDIT_WOZW:=true;
   MemWozw.EmptyTable;

   if DOC_RN_WOZW.tag<0 then begin
     DOC_RN_WOZW.caption:='Акт возврата от покупателя по: '+RNTYP[Toolbar1.tag].FULL+'. Новый!';
     RN_DATE.date:=date();
     RN_NUM.text:='Новый';
     RN_NUMS:=-1;


     RN_OSN.lines.clear;

     Show_Wait('Инициализация накладной. Настройки по умолчанию...',40);

     IbSkl.ParamByName('SHOP_ID').asinteger := SHOPID;
     IbSkl.Open;

//27-03-2015 - по запросу головиной - чтобы вручную заказывали склад      skl.Value := inttostR(DEFAULT_SKLAD);

     SAVE:=False;
     SHOP_ID:=SHOPID;


     KLN_ID:=SHOP_KLN_DEFAULT(SHOPID,panel1.tag);
     WOZW_PROW:=False;
     Show_Wait('Инициализация накладной. Клиенты...',60);
     Change_kln;
     Show_Wait('Инициализация накладной. НДС...',80);
     DataModule1.MainDicRnTyp.Locate('RNTYP_ID',RNTYP[Toolbar1.tag].ID,[]);
     NDS.Value:=NDS_DATE(RN_DATE.date);
     NP.value:=NP_DATE(Panel1.tag,RN_DATE.date);

     RN_KASSA_ID:=0;
     RN_KASSIR_ID:=0;

     if DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger=2 then begin
         // НДС всегда не выделяется!
         NDS.value:=0;
     end;
   end else begin
     DOC_RN_WOZW.caption:='Акт возврата от покупателя по: '+RNTYP[Toolbar1.tag].FULL+'. Редактирование!';
     WorkTransaction.Active:=False;
     Show_Wait('Инициализация накладной. Заголовок...',20);



     ADD_SQL(QueryWork,'select rn.*, rvid.*, (select skl.skl_short from skl where skl.skl_id = rn.skl_id) SKL_SHORT from rn, rvid where rvid.rvid_id = rn.rvid_id and rn_id=:rn_id');
     QueryWork.ParamByname('RN_ID').asinteger:=DOC_RN_WOZW.tag;
     QueryWork.Open;
     if QueryWork.eof then Messbox('Ошибка при открытии акта возврата!',MessError,16)
     else begin
       NDS.value:=QueryWork.fieldByname('NDS').asfloat;
       NP.value:=QueryWork.fieldByname('NP').asfloat;
       RN_DATE.date:=QueryWork.fieldByname('RN_DATE').asdatetime;
       RN_NUMS:=QueryWork.fieldByname('RN_NUM').asinteger;
       RN_NUM.text:=inttostr(RN_NUMS);
       RN_OSN.lines.clear;
       RN_OSN.lines.add(QueryWork.fieldByname('RN_OSN').asstring);
       Show_Wait('Инициализация накладной. Фирмы...',40);

       FRM.value := QueryWork.fieldbyname('FRM_ID').asstring;

       IbSkl.ParamByName('SHOP_ID').asinteger := QueryWork.fieldbyname('SHOP_ID').asinteger;
       IbSkl.Open;

       SKL.value := QueryWork.fieldbyname('SKL_ID').asstring;

        if SKL.value='' then
          begin
            SKL.DisplayEmpty := QueryWork.fieldbyName('SKL_SHORT').asstring;
            SKL.EmptyValue := QueryWork.fieldbyName('SKL_ID').asstring;
          end;

       SHOP_ID:=QueryWork.fieldByname('SHOP_ID').asinteger;


       KLN_ID:=QueryWork.fieldByname('KLN_ID').asinteger;
       RVID_SUBKLN:=QueryWork.fieldByname('RVID_SUBKLN').asinteger;
       RN_KASSA_ID:=QueryWork.fieldbyname('KASSA_ID').asinteger;
       RN_KASSIR_ID:=QueryWork.fieldbyname('KASSIR_ID').asinteger;

       if QueryWork.fieldByname('RN_PROW').asinteger=1 then WOZW_PROW:=true else WOZW_PROW:=False;
       // Читаем содержимое
       Show_Wait('Инициализация накладной. Содержимое...',60);
       ADD_SQL(QueryWork,'select LIST_RNS.*, TW.TW_SHORT_NAM from LIST_RNS(:rn_id,1) left join TW on TW.TW_ID = LIST_RNS.TW_ID');
       QueryWork.ParamByname('RN_ID').asinteger:=DOC_RN_WOZW.tag;
       QueryWork.Open;
       while not QueryWork.eof do begin
          CanInsert:=true;
          MemWozw.append;
          ADD_SQL(QueryWork2,'select shop.shop_id,shop.shop_name from rn,rns,shop '+
          ' where rn.shop_id=shop.shop_id and rn.rn_id=rns.rn_id and rns.rns_id=:rns_id');
          QueryWork2.paramByname('rns_id').asinteger:=QueryWork.fieldByname('wozw_ID').asinteger;
          QueryWork2.Open;

          MemWozw.fieldbyname('TW_ID').asinteger:=QueryWork.fieldByname('TW_ID').asinteger;
          MemWozw.fieldbyname('RNS_ID').asinteger:=QueryWork.fieldByname('RNS_ID').asinteger;
          MemWozw.fieldbyname('TW_ART').asinteger:=QueryWork.fieldByname('TW_ART').asinteger;
          MemWozw.fieldbyname('TW_NAM').asstring:=QueryWork.fieldByname('TW_NAM').asstring;
          MemWozw.fieldbyname('TW_SHORT_NAM').asstring:=QueryWork.fieldByname('TW_SHORT_NAM').asstring;
          MemWozw.fieldbyname('WOZW_ID').asinteger:=QueryWork.fieldByname('WOZW_ID').asinteger;
          MemWozw.fieldbyname('DOC_NAME').asstring:=QueryWork.fieldByname('DOC_NAME').asstring;
          MemWozw.fieldbyname('DOC_DATE').asdatetime:=QueryWork.fieldByname('DOC_DATE').asdatetime;
          MemWozw.fieldbyname('ED_SHORT').asstring:=QueryWork.fieldByname('ED_SHORT').asstring;
          MemWozw.fieldbyname('RNS_MONEY').asfloat:=QueryWork.fieldByname('RNS_MONEY_OK').asfloat;
          MemWozw.fieldbyname('RNS_KOL').asfloat:=QueryWork.fieldByname('RNS_KOL').asfloat;
          MemWozw.fieldbyname('RNS_OST').asfloat:=QueryWork.fieldByname('RNS_OST').asfloat;
          MemWozw.fieldbyname('TW_SALER_ID').asinteger:=QueryWork.fieldByname('TW_SALER_ID').asinteger;
          MemWozw.fieldbyname('WOZW_KOL').asfloat:=abs(QueryWork.fieldByname('TW_KOL').asfloat);
          if QueryWork2.eof then begin
            MemWozw.fieldbyname('SHOP_ID').asinteger:=0;
            MemWozw.fieldbyname('SHOP_NAME').asstring:='Не найден!';
          end else begin
            MemWozw.fieldbyname('SHOP_ID').asinteger:=QueryWork2.fieldByname('SHOP_ID').asinteger;
            MemWozw.fieldbyname('SHOP_NAME').asstring:=QueryWork2.fieldByname('SHOP_NAME').asstring;
          end;
          MemWozw.fieldbyname('RNS_TABEL').asinteger:=QueryWork.fieldByname('RNS_TABEL').asinteger;
          MemWozw.Post;
          CanInsert:=False;
          QueryWork.next;
       end;
       MemWozw.First;
       Change_kln;
       SAVE:=TRUE;
     end;
   end;
   Show_Wait('Инициализация накладной. Все почти готово...',99);


   Show_sost;
   CanInsert:=False;
   Wait_form.hide;
   canRefresh := true;
   RefreshWozw;
end;

procedure TDOC_RN_WOZW.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   IS_EDIT_WOZW:=false;
   DataModule1.IBTransaction1.active:=false;
end;

procedure TDOC_RN_WOZW.MnDicTwExecute(Sender: TObject);
VAR
  RNS_ID:integer;
  old_pos,a,b,c:integer;
  can:boolean;
begin
  if FRM.value='' then
  begin
   Messbox('Не указана фирма!',  MessError, MB_OK);
   exit;
  end;
   canRefresh := false;
   Application.createForm(TSelect_wozw,Select_wozw);
   Select_wozw.Label2.tag:=1; // Метка, что возврат по расходным
   Select_wozw.tag:=MemWozw.fieldByname('TW_ID').asinteger;
   Select_wozw.Label4.caption:='Возврат по фирме: '+FRM.text +' от клиента '+KLN_NAME.Text;
   Select_wozw.DT1.tag:=strtoint(FRM.value);
   Select_wozw.DT2.tag:=KLN_ID;
   Select_wozw.BtnOk.tag:=Panel1.tag;
   Select_wozw.showModal;
   if Select_wozw.tag>0 then begin
     // Проверяем, не возвращают ли два раза по одному и тому-же
     RNS_ID:=Select_wozw.QueryRep.fieldByname('RNS_ID').asinteger;
     if MemWozw.recordcount>0 then begin
       old_pos:=MemWozw.Recno;
       MemWozw.disablecontrols;
       MemWozw.first;
       can:=true;
       while not MemWozw.eof do begin
          if MemWozw.fieldByname('WOZW_ID').asinteger=RNS_ID then can:=False;
          MemWozw.next;
       end;
       MemWozw.first;
       for a:=1 to old_pos-1 do MemWozw.next;
       MemWozw.enablecontrols;
       if not CAN then begin
          messbox('Добавить невозможно! В акте возврата уже присутствует указанная позиция!',MessSystem,48);
       end;
     end else can:=true;
     if can then begin
       // Добавляем
       NDS.value:=Select_wozw.QueryRep.fieldByname('NDS').asfloat;
       NP.value:=Select_wozw.QueryRep.fieldByname('NP').asfloat;
       CanInsert:=true;
       MemWozw.append;
       MemWozw.fieldbyname('TW_ID').asinteger:=Select_wozw.RxDbGrid1.tag;
       MemWozw.fieldbyname('RNS_ID').asinteger:=-1;
       MemWozw.fieldbyname('TW_ART').asinteger:=Select_wozw.Panel1.tag;
       MemWozw.fieldbyname('TW_NAM').asstring:=Select_wozw.Edit2.text;
       MemWozw.fieldbyname('TW_SHORT_NAM').asstring:=Select_wozw.Edit3.text;
       MemWozw.fieldbyname('WOZW_ID').asinteger:=RNS_ID;
       MemWozw.fieldbyname('DOC_NAME').asstring:=Select_wozw.QueryRep.fieldByname('RN_FULLNUM').asstring;
       MemWozw.fieldbyname('DOC_DATE').asdatetime:=Select_wozw.QueryRep.fieldByname('RN_DATE').asdatetime;
       MemWozw.fieldbyname('ED_SHORT').asstring:='шт';
       MemWozw.fieldbyname('RNS_MONEY').asfloat:=Select_wozw.QueryRep.fieldByname('RNS_MONEY').asfloat;
       MemWozw.fieldbyname('RNS_KOL').asfloat:=Select_wozw.QueryRep.fieldByname('RNS_KOL').asfloat;
       MemWozw.fieldbyname('RNS_OST').asfloat:=Select_wozw.QueryRep.fieldByname('RNS_OST').asfloat;
       MemWozw.fieldbyname('TW_SALER_ID').asinteger:=strtoint(FRM.value);
       MemWozw.fieldbyname('WOZW_KOL').asfloat:=1;





       // Определяем, в каком магазине был возврат!
       WorkTransaction.Active:=False;
       ADD_SQL(QueryWork,'select rn.shop_id,shop.shop_name,rns.rns_tabel, rvid.rvid_subkln from rn,rns,shop, rvid where rvid.rvid_id = rn.rvid_id and rn.rn_id=rns.rn_id '+
          'and rn.shop_id=shop.shop_id and rns.rns_id=:rns_id');
       QueryWork.ParamByname('RNS_ID').asinteger:=RNS_ID;
       QueryWork.Open;
       if QueryWork.eof then Messbox('Не обнаружен магазин!',MessAdm,16) else begin
          MemWozw.fieldbyname('rns_tabel').asinteger:=QueryWork.fieldByname('RNS_TABEL').asinteger;
          MemWozw.fieldbyname('shop_id').asinteger:=QueryWork.fieldByname('SHOP_ID').asinteger;
          MemWozw.fieldbyname('shop_name').asstring:=QueryWork.fieldByname('SHOP_name').asstring;
          RVID_SUBKLN:=QueryWork.fieldByname('RVID_SUBKLN').asinteger;
       end;
       QueryWork.close;
       MemWozw.Post;
       CanInsert:=False;
       SAVE:=False;
     end;
   end;
   SHOW_SOST;
   Select_wozw.destroy;
   canRefresh:= true;
   RefreshWozw;
end;

procedure TDOC_RN_WOZW.MnDelExecute(Sender: TObject);
begin
  if MemWozw.RecordCount>0 then begin
    if Messbox('Удалить факт возврата товара ['+MemWozw.fieldByname('TW_ART').asstring+
    '] "'+MemWozw.fieldByname('TW_NAM').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        if MemWOZW.Fieldbyname('RNS_ID').asinteger>0 then begin
          inc(CNT_DEL);
          RNS_DEL[CNT_DEL]:=MemWozw.Fieldbyname('RNS_ID').asinteger;
        end;
       MemWozw.Delete;
       SAVE:=False;
    end;
  end;
end;

procedure TDOC_RN_WOZW.MemWozwAfterDelete(DataSet: TDataSet);
begin
  Show_Sost;
  refreshwozw;
end;

Procedure TDOC_RN_WOZW.SHow_sost;
var
  Empty:boolean;
begin
   Empty:=False;
   if MemWozw.recordcount=0 then begin
        Empty:=True;
        MnDel.enabled:=false
   end else MnDel.enabled:=not WOZW_PROW;
   MnDetal.enabled:=not Empty;
   MnAnaliz.enabled:=not Empty;
   MnMarket.enabled:=not Empty;
   MnProw.enabled:=Not WOZW_PROW and not Empty;
   MnUnProw.enabled:=WOZW_PROW and not Empty;
   MnSave.enabled:=Not WOZW_PROW and not Empty;
   MnApply.enabled:=Not WOZW_PROW and not Empty;
   RN_DATE.enabled:=not MnUnProw.enabled;
   ActKKM.enabled:=not Empty;
   FRM.enabled:=not MnUnProw.enabled and Empty;

   SKL.enabled:=not MnUnProw.enabled;
   BtnKln.enabled:=not MnUnProw.enabled and Empty;
   NDS.enabled:=not MnUnProw.enabled;
   NP.enabled:=not MnUnProw.enabled;
   RN_OSN.enabled:=not MnUnProw.enabled;
   MnDicTw.enabled:=not MnUnProw.enabled;
   RxDbgrid1.readonly:=WOZW_PROW;
   refresh;
end;

procedure TDOC_RN_WOZW.DsWozwDataChange(Sender: TObject; Field: TField);
begin
     if MemWozw.State in [dsInsert,dsEdit] then SAVE:=False;
     if (MemWozw.State in [dsInsert]) and ( not CanInsert) then MemWozw.Cancel;

    if ((memWozw.State in [dsEdit]) and (field<>nil))  and (Field.FieldName = 'WOZW_KOL') then
       refreshWozw;
end;

procedure TDOC_RN_WOZW.MemWozwCalcFields(DataSet: TDataSet);
begin
   MemWozw.fieldByname('RNS_SUMM').asfloat:=
     MemWozw.fieldByname('RNS_KOL').asfloat*MemWozw.fieldByname('RNS_MONEY').asfloat;
   MemWozw.fieldByname('WOZW_SUMM').asfloat:=
     MemWozw.fieldByname('WOZW_KOL').asfloat*MemWozw.fieldByname('RNS_MONEY').asfloat;
end;

procedure TDOC_RN_WOZW.MemWozwAfterScroll(DataSet: TDataSet);
begin
   Statusbar1.panels[0].text:=MemWozw.fieldbyname('TW_ART').asstring;
   Statusbar1.panels[1].text:=MemWozw.fieldbyname('TW_NAM').asstring;
end;

procedure TDOC_RN_WOZW.MnApplyExecute(Sender: TObject);
var
  a,ID,ID2,OLDID:integer;
  r:double;
  shop1,shop2:integer;
  _nds, _nds_summ: double;
begin
   // Сохраняем
   if (MemWOZW.State in [dsInsert,DsEdit]) then MemWOZW.Post;


   if SKL.value='' then
   begin
      Messbox('Не указан склад!',MessSystem,48);
      exit;
   end;




   if MemWozw.recordcount=0 then Messbox('Необходимо указать хотя-бы один товар!',MessSystem,48) else begin
     OLDID:=MemWOZW.recno;
     MemWOZW.DisableControls;
     MemWOZW.First;
     // Проверяем, чтобы магазин был один и тот-же
     shop2:=0;
     shop1:=MemWozw.fieldByname('SHOP_ID').asinteger;
     while not MemWozw.eof do begin
       if MemWozw.fieldByname('SHOP_ID').asinteger<>shop1 then shop2:=1;
       MemWozw.next;
     end;
     if shop2<>0 then messbox('Все продажи, возврат которых производится должны быть сделаны в одном магазине!',MessSystem,48)
     else begin
        MemWozw.first;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           if RN_NUMS<0 then RN_NUMS:=NEW_RN_NUM(Panel1.tag,strtoint('0'+frm.value), RN_DATE.date);

           RN_NUM.text:=inttostr(RN_NUMS);
           IBSAVE_CLEAR;
           IBSAVE_ADD('RNTYP_ID',Panel1.tag); // Все возвраты - НАЛ (пока)
//           IBSAVE_ADD('RNTYP_ID',RNTYP[Doc_RN_WOZW.Panel1.Tag].ID);
//           IBSAVE_ADD('RVID_ID',strtoint('0'+RVID.value));
//           if RVIDKLN.Visible then IBSAVE_ADD('RVID_KLN',strtoint('0'+rvidkln.value));

           IBSAVE_ADD('RN_NUM',RN_NUMS);
           IBSAVE_ADD('RN_DATE',strtodatetime(datetostr(RN_DATE.date)+' '+timetostr(time())));
           IBSAVE_ADD('RNVID_ID',DEFAULT_RNVID_WOZW); // Уточнить вид - должен быть возврат товара
           IBSAVE_ADD('SKL_ID',STRTOINT(skl.VALUE));
           IBSAVE_ADD('SHOP_ID',SHOP1);
           IBSAVE_ADD('RN_PROW',0);
           IBSAVE_ADD('RN_OSN',trim(RN_OSN.text));
           IBSAVE_ADD('RN_WHO','');
           IBSAVE_ADD('KLN_ID',KLN_ID);
           IBSAVE_ADD('FRM_ID',strtoint(FRM.value));
           IBSAVE_ADD('RN_KURS',1);
           IBSAVE_ADD('US_ID',USERID);
           IBSAVE_ADD('NDS',NDS.value);
           IBSAVE_ADD('NP',NP.value);
           IBSAVE_ADD('RN_DOST',0);
           IBSAVE_ADD('VaLUTA_ID',0);
           IBSAVE_ADD('RN_SKID',0);
           IBSAVE_ADD('CARD_ID',0);
           IBSAVE_ADD('RN_KKM',0);
           IBSAVE_ADD('RN_SKID_TXT','');
           ID:=IBSAVE_DOC('RN',DOC_RN_WOZW.tag);
           if ID<0 then r:=sqrt(-1) else
           begin
              DOC_RN_WOZW.tag:=ID;





           // Сохраняем содержимое
           // Стираем удаленное
             for A:=1 to CNT_DEL do begin
                 if RNS_DEL[A]>0 then if not IBDELETE_DOC('RNS',RNS_DEL[A]) then R:=SQRT(-1);
             end;
           // Сохраняем содержимое
              MemWozw.first;
              while not MemWozw.eof do begin


                    begin
                      IBSAVE_CLEAR;
                      IBSAVE_ADD('RN_ID',ID);
                      IBSAVE_ADD('TW_ID',MemWozw.fieldByname('TW_ID').asinteger);
                      IBSAVE_ADD('TW_KOL',-MemWozw.fieldByname('WOZW_KOL').asfloat);
                      IBSAVE_ADD('TW_MONEY',MemWozw.fieldByname('RNS_MONEY').asfloat);
                      IBSAVE_ADD('RNS_TABEL',MemWozw.fieldByname('RNS_TABEL').asinteger);
                      IBSAVE_ADD('TW_SKID',0);
                      IBSAVE_ADD('TW_SKIDDOLL',0);
                      IBSAVE_ADD('TW_MONEY2',0);
                      IBSAVE_ADD('TYP_MONEY2',0);
                      IBSAVE_ADD('OTG_KOL',0);
                      IBSAVE_ADD('OTG_DATE',my_now());
                      IBSAVE_ADD('OTG_US',0);
                      IBSAVE_ADD('SKID_TXT','');
                      IBSAVE_ADD('WOZW_ID',MemWozw.fieldByname('WOZW_ID').asinteger);
                      ID2:=IBSAVE_DOC('RNS',MemWozw.fieldByname('RNS_ID').asinteger);
                      if ID2<0 then r:=sqrt(-1) else begin
                         MemWozw.Edit;
                         MemWozw.fieldByname('RNS_ID').asinteger:=ID2;
                         MemWozw.post;
                      end;
                    end;
                MemWozw.next;
              end;



           end;
           Datamodule1.IBTransaction2.Commit;
           Datamodule1.IBTransaction2.Active:=False;
           SAVE:=True;
           CNT_DEL:=0;
        except
           Datamodule1.IBTransaction2.Rollback;
           Messbox('Ошибка при записи акта возврата!',MessError,16);
           SAVE:=False;
        end;
        Datamodule1.IBTransaction2.Active:=False;
     end;
     MemWOZW.first;
     for a:=1 to OLDID-1 do MemWOZW.next;
     MemWOZW.EnableControls;
   end;
end;

procedure TDOC_RN_WOZW.MnSaveExecute(Sender: TObject);
begin
   Save:=False;
   if MnApply.enabled then MnApply.Execute;
   if SAVE then begin
        if not WOZW_PROW then if MnProw.enabled then MnProw.Execute;
        Close;
   end;
end;

procedure TDOC_RN_WOZW.RN_DATEChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDOC_RN_WOZW.FRMChange(Sender: TObject);
begin
   SAVE:=False;

end;

procedure TDOC_RN_WOZW.RN_OSNChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDOC_RN_WOZW.BtnKlnClick(Sender: TObject);
begin
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=KLN_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN_ID then begin
        KLN_ID:=DIC_KLIENT.tag;
        Change_Kln;
        SAVE:=False;
     end;
     DIC_KLIENT.Destroy;
     Try
       RN_OSN.setfocus;
     Except
     End;

end;

Procedure TDOC_RN_WOZW.Change_KLN;
var
   s1,s2:ansistring;
begin
     {Отображаем название фирмы и банка}
     WorkTransaction.Active:=False;
     QueryWork.Close;
     QueryWork.SQL.clear;
     QueryWork.SQL.add('select kln.kln_frm, KLN_FULL,KLN_REKW FROM kln, KLN_DATA(:KLN_ID) where kln.kln_id = :kln_id');
     QueryWork.Parambyname('KLN_ID').asinteger:=KLN_ID;
     QueryWork.Open;
     s1:='';
     S2:='';
     if not QueryWork.eof then begin
         s1:=QueryWork.fieldbyname('KLN_FULL').asstring;
         s2:=QueryWork.fieldbyname('KLN_REKW').asstring;
         KLN_NAME.Tag := QueryWork.fieldbyname('KLN_FRM').asinteger;
     end;
     KLN_NAME.text:=s1;
     // KLN_BNK.text:=s2;
     QueryWork.Close;



end;

procedure TDOC_RN_WOZW.MemWozwBeforePost(DataSet: TDataSet);
begin
    Show_sost;
end;

procedure TDOC_RN_WOZW.MnProwExecute(Sender: TObject);
begin
     if Not Save and MnApply.enabled then MnApply.Execute;
     if (SAVE) then begin
        if NOT WOZW_PROW then begin
          if PROV_WOZW(Doc_RN_WOZW.tag,'') then begin
                WOZW_PROW:=True;
                Show_Sost;
                SAVE:=true;
          end;
        end;
     end;
end;

procedure TDOC_RN_WOZW.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='WOZW_KOL' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RNS_OST').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_KOL').Asfloat)
           and (OST_COLOR1>0) then Background:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RNS_OST').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_KOL').Asfloat)
           and (OST_COLOR2>0) then Background:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RNS_OST').Asfloat<0)
           and (OST_COLOR3>0) then Background:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RNS_OST').Asfloat=0)
           and (OST_COLOR4>0) then Background:=OST_COLOR4;
     end;
     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
      if Field.Fieldname='WOZW_KOL' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RNS_OST').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_KOL').Asfloat)
           and (OST_COLOR1>0) then Afont.color:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RNS_OST').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_KOL').Asfloat)
           and (OST_COLOR2>0) then Afont.color:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RNS_OST').Asfloat<0)
           and (OST_COLOR3>0) then Afont.color:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RNS_OST').Asfloat=0)
           and (OST_COLOR4>0) then Afont.color:=OST_COLOR4;
       end;
     end;

end;

procedure TDOC_RN_WOZW.MnUnprowExecute(Sender: TObject);
begin
     if UNPROV_WOZW(Doc_RN_WOZW.tag,'') then begin
                WOZW_PROW:=False;
                Show_Sost;
                SAVE:=True;
     end;
end;

procedure TDOC_RN_WOZW.MnDetalExecute(Sender: TObject);
begin
  show_detal_tw(MemWozw.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_RN_WOZW.MnAnalizExecute(Sender: TObject);
begin
  show_analiz_tw(MemWozw.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_RN_WOZW.MnMarketExecute(Sender: TObject);
begin
     SHOW_MARKETING_TW(MemWozw.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_RN_WOZW.MnLockExecute(Sender: TObject);
begin
     My_lock;
end;

procedure TDOC_RN_WOZW.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (not Save) and (MnApply.enabled) then begin
        if Messbox('Акт был изменён! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDOC_RN_WOZW.MemWozwWOZW_KOLChange(Sender: TField);
var
  val:double;
begin
   SAVE:=FALSE;
   val:=MemWozw.fieldByname('Wozw_KOL').asfloat;
   if val<=0 then begin
     MemWozw.fieldByname('WOZW_KOL').asfloat:=1;
     messbox('Количество товара не может быть нулевой или отрицательной величиной! '+CR+
     'Количеcтво с '+floattostrf(val,fffixed,19,4)+' изменено на 1.000!',MessError,16);
   end;

//    refreshwozw;
end;

procedure TDOC_RN_WOZW.ActKKMExecute(Sender: TObject);
var        a,i:integer;
        s:string;
        pog_summ:double;
        all_summ:double;
        cash_summ:double;
//        check_file: textfile;
begin
   // печать чека возврата
   // Обычный чек
//   assignfile(check_file, 'print_check.txt');
//   rewrite(check_file);
//   writeln(check_file, 'Печатаем чек возврата');
if messbox('Напечатать чек возврата?',MessSubmit,4+48+256)=6 then
begin
   if (MemWozw.State in [dsInsert,DsEdit]) then MemWozw.Post;
   if Not Save and ToolButton5.enabled then ToolButton5.click;

   if rn_kassir_id <> 0 then
   begin
   	if MessBox('Чек по этой расходной накладной уже печатался. Вы уверены что хотите выбить чек снова?', MessSystem, MB_YESNO)=IDNO  then
    	exit;
   end;

   //   Btn_RefreshOst.click;

   MemWozw.disablecontrols;
   i:=MemWozw.Recno;
   MemWozw.First;
   clear_cash;
//   writeln(check_file, 'Модель аппарата '+ inttostr(MODEL_KKM));
   while not MemWozw.eof do begin

     if Model_KKM=1 then begin
        s:=MemWozw.fieldbyname('TW_ART').asstring;
        if PRINT_KKM_TW_NAME>0 then begin
          s:=b_utils.left(s+' ',17)+MemWozw.fieldbyname('TW_SHORT_NAM').asstring;
        end;
     end;
     if Model_KKM=3 then begin
        s:=MemWozw.fieldbyname('TW_ART').asstring;
        if PRINT_KKM_TW_NAME>0 then begin
          s:=b_utils.left(s+' ',17)+MemWozw.fieldbyname('TW_SHORT_NAM').asstring;
        end;
     end;
     if Model_KKM=4 then begin
        s:=MemWozw.fieldbyname('TW_ART').asstring;
        if PRINT_KKM_TW_NAME=1 then
          s:=s+' '+memwozw.fieldbyname('TW_NAM').asstring;
        if PRINT_KKM_TW_NAME=2 then
          s:=s+' '+memwozw.fieldbyname('TW_SHORT_NAM').asstring;

        FRShtrih.DocName:='ВРН '+RN_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(doc_rn_wozw.tag)+']';
     end;
     if Model_KKM=2 then begin
       // ЭЛВЕС ФР
       s:='КОД:'+MemWozw.fieldbyname('TW_ART').asstring;
       if PRINT_KKM_TW_NAME>0 then begin
         s:=b_utils.left(s+space(24),24)+MemWozw.fieldbyname('TW_SHORT_NAM').asstring;
       end;
     end;
     if length(s)>252 then s:=b_utils.left(s,252);
     add_cash(s,MemWozw.fieldbyname('RNS_MONEY').asfloat,  MemWozw.fieldbyname('WOZW_KOL').asfloat,1, 'ВРН '+RN_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(doc_rn_wozw.tag)+']', strtoint(FRM.value), 0, 0, memwozw.FieldByName('ED_SHORT').asstring);

//     writeln(check_file, 'Строка вывода '+ s);
//     writeln(check_file, 'Сумма/кол-во: '+MemWozw.fieldbyname('WOZW_SUMM').asstring+'/'+MemWozw.fieldbyname('WOZW_KOL').asstring);

     MemWozw.next;
   end;
//   writeln(check_file, 'Общая сумма: '+ floattostr(RxCalcEdit1.Value));

//   closefile(check_file);
   DataModule1.MainDicRnTyp.Locate('RNTYP_ID',RNTYP[Toolbar1.tag].ID,[]);
   memwozw.First;
   //Печатаем
   wozw_cash(DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger, RVID_SUBKLN);

   SAVE_RN_KASSIR;
end;

end;

procedure TDOC_RN_WOZW.refreshWozw;
var sum: double;
        i: integer;
begin
  if canRefresh <> true then
  exit;
  
  sum := 0;

  canRefresh:=false;

  memwozw.First;
  for i := 0 to memwozw.RecordCount -1  do
  begin
    sum := sum + memwozw.fieldbyname('WOZW_SUMM').asfloat;
    memwozw.Next;
  end;
    RxCalcEdit1.value := sum;

  canRefresh:=true;
end;

procedure TDOC_RN_WOZW.SKLChange(Sender: TObject);
begin
  save:=false;
  show_sost;
end;

end.
