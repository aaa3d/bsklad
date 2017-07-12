unit DocSpisWozw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ExtCtrls,Data1,b_utils,b_dbutils,
  StdCtrls, CurrEdit, Mask, ToolEdit, Db, RxMemDS, Menus, ActnList,
  IBCustomDataSet, IBQuery, IBDatabase, RxLookup, Buttons,DetalTW, PrintKKM;

type
  TDOC_SPIS_WOZW = class(TForm)
    StatusBar1: TStatusBar;
    IBQuery1: TIBQuery;
    SpisDocTransaction: TIBTransaction;
    Query1Transaction: TIBTransaction;
    IBQuery2: TIBQuery;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    SPIS_OSN: TMemo;
    SPIS_NUM: TEdit;
    SPIS_DATE: TDateEdit;
    SPIS_SUMM: TRxCalcEdit;
    Btn_RefreshSumm: TBitBtn;
    SPIS_SPISVID: TRxDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    QueryWork2: TIBQuery;
    DsWozw: TDataSource;
    MemWozw: TRxMemoryData;
    MemWozwTW_ID: TIntegerField;
    MemWozwRNS_ID: TIntegerField;
    MemWozwTW_ART: TIntegerField;
    MemWozwTW_NAME: TStringField;
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
    MemWozwSHOP_ID: TIntegerField;
    MemWozwSHOP_NAME: TStringField;
    MemWozwRNS_TABEL: TIntegerField;
    MemWozwTW_SHORT_NAM: TStringField;
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
    ActKKM: TAction;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton17: TToolButton;
    Label5: TLabel;
    SHOP: TRxDBLookupCombo;
    US2_Btn: TSpeedButton;
    US2_FULL: TEdit;
    US2_LABEL: TLabel;
    Label6: TLabel;
    FRM: TRxDBLookupCombo;
    Label1: TLabel;
    SKL: TRxDBLookupCombo;
    procedure refreshWozw;
    procedure Show_Sost;
    procedure FormShow(Sender: TObject);
    procedure MemWozwCalcFields(DataSet: TDataSet);
    procedure MnDicTwExecute(Sender: TObject);
    procedure MnDelExecute(Sender: TObject);
    procedure MnApplyExecute(Sender: TObject);
    procedure MemWozwWOZW_KOLChange(Sender: TField);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MnProwExecute(Sender: TObject);
    procedure MnUnprowExecute(Sender: TObject);
    procedure MnSaveExecute(Sender: TObject);
    procedure MnLockExecute(Sender: TObject);
    procedure MnPrintExecute(Sender: TObject);
//    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
//      Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);

    procedure Change_FrmUs2(ID:integer;N:integer);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure US2_BtnClick(Sender: TObject);
    procedure SPIS_SPISVIDChange(Sender: TObject);
    procedure FRMChange(Sender: TObject);
    procedure SKLChange(Sender: TObject);


  private
    { Private declarations }
    skl_frm: integer;
    FRM_ENABLED: boolean;    
  public
    { Public declarations }
  end;

var
  DOC_SPIS_WOZW: TDOC_SPIS_WOZW;
  Save, CanInsert:Boolean;
  SPIS_NUMS:integer;
  KLN_ID:integer;
  WOZW_PROW:boolean;
  SPISS_DEL:array[1..1000] of integer;
  SPISS_DEL_MESS:array[1..1000] of string;
  CNT_DEL:integer=0;
  SPIS_WOZW_PROW:boolean;
  US2_ID: longint;


implementation

uses SelectWozw, WaitForm, Mainform, DicKlient;

{$R *.DFM}

procedure TDOC_SPIS_WOZW.MnDicTwExecute(Sender: TObject);
VAR
  SPISS_ID:integer;
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
   Select_wozw.Label2.tag:=3; // Метка, что возврат по списаниям
   Select_wozw.tag:=MemWozw.fieldByname('TW_ID').asinteger;
   Select_wozw.Label4.caption:='Возврат по фирме: '+FRM.text +' на склад: '+SKL.Text;
   Select_wozw.Label4.Tag := strtoint(SKL.value);
   Select_wozw.SpeedButton3.Tag := strtoint(shop.value);
   Select_wozw.SpeedButton4.Tag := 0;
   if (US2_FULL.Visible=true)then Select_wozw.SpeedButton4.Tag := us2_id;

   Select_wozw.DT1.tag:=strtoint(FRM.value);
   Select_wozw.BtnOk.tag:=SPIS_SPISVID.KeyValue; //Сюда запишем вид
   Select_wozw.showModal;
   if Select_wozw.tag>0 then begin
     // Проверяем, не возвращают ли два раза по   одному и тому-же
     SPISS_ID:=Select_wozw.QueryRep.fieldByname('RNS_ID').asinteger;
     if MemWozw.recordcount>0 then begin
       old_pos:=MemWozw.Recno;
       MemWozw.disablecontrols;
       MemWozw.first;
       can:=true;
       while not MemWozw.eof do begin
          if MemWozw.fieldByname('WOZW_ID').asinteger=SPISS_ID then can:=False;
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
//       NDS.value:=Select_wozw.QueryRep.fieldByname('NDS').asfloat;
//       NP.value:=Select_wozw.QueryRep.fieldByname('NP').asfloat;
       CanInsert:=true;
       MemWozw.append;
       canrefresh:= false;
       MemWozw.fieldbyname('TW_ID').asinteger:=Select_wozw.RxDbGrid1.tag;
       MemWozw.fieldbyname('RNS_ID').asinteger:=-1;
       MemWozw.fieldbyname('TW_ART').asinteger:=Select_wozw.Panel1.tag;
       MemWozw.fieldbyname('TW_NAME').asstring:=Select_wozw.Edit2.text;
       MemWozw.fieldbyname('TW_SHORT_NAM').asstring:=Select_wozw.Edit3.text;
       MemWozw.fieldbyname('WOZW_ID').asinteger:=SPISS_ID;
       MemWozw.fieldbyname('DOC_NAME').asstring:=Select_wozw.QueryRep.fieldByname('RN_FULLNUM').asstring;
       MemWozw.fieldbyname('DOC_DATE').asdatetime:=Select_wozw.QueryRep.fieldByname('RN_DATE').asdatetime;
       MemWozw.fieldbyname('ED_SHORT').asstring:='шт';
       MemWozw.fieldbyname('RNS_MONEY').asfloat:=Select_wozw.QueryRep.fieldByname('RNS_MONEY').asfloat;
       MemWozw.fieldbyname('RNS_KOL').asfloat:=Select_wozw.QueryRep.fieldByname('RNS_KOL').asfloat;
       MemWozw.fieldbyname('RNS_OST').asfloat:=Select_wozw.QueryRep.fieldByname('RNS_OST').asfloat;
       MemWozw.fieldbyname('WOZW_KOL').asfloat:=1;
       // Определяем, в каком магазине был возврат!
       WorkTransaction.Active:=False;
       ADD_SQL(QueryWork,'select spis.shop_id,shop.shop_name from spis, spiss, shop where  '+
          'spis.spis_id = spiss.spis_id and spis.shop_id=shop.shop_id and spiss.spiss_id=:RNS_ID');
       QueryWork.ParamByname('RNS_ID').asinteger:=spiss_id;
       QueryWork.Open;
       if QueryWork.eof then Messbox('Не обнаружен магазин!',MessAdm,16) else begin
          MemWozw.fieldbyname('shop_id').asinteger:=QueryWork.fieldByname('SHOP_ID').asinteger;
          MemWozw.fieldbyname('shop_name').asstring:=QueryWork.fieldByname('SHOP_name').asstring;
       end;
       QueryWork.close;
       canrefresh:= true;
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

procedure TDOC_SPIS_WOZW.refreshWozw;
var sum: double;
        i: integer;
begin
  if canRefresh <> true then
  exit;
  
  sum := 0;

  memwozw.First;
  for i := 0 to memwozw.RecordCount -1  do
  begin
    sum := sum + memwozw.fieldbyname('WOZW_SUMM').asfloat;
    memwozw.Next;
  end;
    spis_summ.value := sum;


  if memwozw.RecordCount > 0 then begin
     SKL.Enabled := false;
     frm.enabled := false;
     shop.Enabled:=false;
     spis_spisvid.enabled := false;
     us2_full.Enabled:=false;
     us2_btn.Enabled:=false;
  end
  else
  begin
     SKL.Enabled:=true;
     frm.enabled := true;
     shop.Enabled:=true;
     spis_spisvid.enabled := true;
     us2_full.Enabled:=true;
     us2_btn.Enabled:=true;
  end;

end;

procedure TDOC_SPIS_WOZW.Show_Sost;
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
   SPIS_DATE.enabled:=not MnUnProw.enabled;
   ActKKM.enabled:=not Empty;
   FRM.enabled:=not MnUnProw.enabled and FRM_ENABLED;
   SKL.enabled:=not MnUnProw.enabled;
   spis_spisvid.enabled := not MnUnProw.enabled;
   SPIS_OSN.enabled:=not MnUnProw.enabled;
   MnDicTw.enabled:=not MnUnProw.enabled;
   RxDbgrid2.readonly:=WOZW_PROW;
   refresh;
end;

procedure TDOC_SPIS_WOZW.FormShow(Sender: TObject);
begin
  canRefresh := false;
   Show_Wait('Инициализация накладной. Склады...',2);


   IS_EDIT_WOZW:=true;

   Top:=Main_Form.Top+22;
   Left:=Screen.DesktopLeft;
   Width:=Screen.Width;
   Height:=Screen.Height-Main_Form.Top-22-29;
   MemWozw.EmptyTable;
   WOZW_PROW:=False;


   if DOC_SPIS_WOZW.tag<0 then begin
     DOC_SPIS_WOZW.caption:='Сторно акта списания: Новый!';
     SHOP.value:=inttostr(SHOPID);

     SPIS_DATE.date:=date();
     SPIS_NUM.text:='Новый';
     SPIS_NUMS:=-1;
     SPIS_OSN.lines.clear;
     Show_Wait('Инициализация накладной. Настройки по умолчанию...',40);

     SKL.value := inttostr(DEFAULT_SKLAD);


     SAVE:=False;
     SPIS_SPISVID.value:=DataModule1.MainDicSpisVid.fieldbyname('SPISVID_ID').asstring;
     US2_ID:=0;




   end else begin
     DOC_SPIS_WOZW.caption:='Сторно акта списания: Редактирование!';
     WorkTransaction.Active:=False;
     Show_Wait('Инициализация накладной. Заголовок...',20);
     ADD_SQL(QueryWork,'select * from SPIS where SPIS_ID=:SPIS_ID');
     QueryWork.ParamByname('SPIS_ID').asinteger:=DOC_SPIS_WOZW.tag;
     QueryWork.Open;
     if QueryWork.eof then Messbox('Ошибка при открытии акта возврата!',MessError,16)
     else begin
       SPIS_DATE.date:=QueryWork.fieldByname('SPIS_DATE').asdatetime;
       SPIS_NUMS:=QueryWork.fieldByname('SPIS_NUM').asinteger;
       SPIS_NUM.text:=inttostr(SPIS_NUMS);
       SPIS_OSN.lines.clear;
       SPIS_OSN.lines.add(QueryWork.fieldByname('SPIS_OSN').asstring);

       SKL.value := QueryWork.FieldByName('SKL_ID').asstring;
       FRM.value := QueryWork.FieldByName('FRM_ID').asstring;

       SHOP.value:=QueryWork.fieldByname('SHOP_ID').asstring;
       SPIS_SPISVID.value:=inttostr(QueryWork.fieldByname('SPISVID_ID').asinteger);
       US2_ID:=QueryWork.fieldbyname('US_ID2').asinteger;
       if QueryWork.fieldByname('SPIS_PROW').asinteger=1 then WOZW_PROW:=true else WOZW_PROW:=False;
       // Читаем содержимое
       Show_Wait('Инициализация накладной. Содержимое...',60);
       ADD_SQL(QueryWork,'select LIST_SPISS.*, TW.TW_SHORT_NAM from LIST_SPISS(:SPIS_ID) left join TW on TW.TW_ID = LIST_SPISS.TW_ID');
       QueryWork.ParamByname('SPIS_ID').asinteger:=DOC_SPIS_WOZW.tag;
       QueryWork.Open;
       while not QueryWork.eof do begin
          CanInsert:=true;
          MemWozw.append;
          ADD_SQL(QueryWork2,'select shop.shop_id,shop.shop_name from SPIS,SPISS,shop '+
          ' where SPIS.shop_id=shop.shop_id and SPIS.SPIS_ID=SPISS.SPIS_ID and SPISS_ID = :SPISS_ID');
          QueryWork2.paramByname('SPISS_ID').asinteger:=QueryWork.fieldByname('wozw_ID').asinteger;
          QueryWork2.Open;
          MemWozw.fieldbyname('TW_ID').asinteger:=QueryWork.fieldByname('TW_ID').asinteger;
          MemWozw.fieldbyname('RNS_ID').asinteger:=QueryWork.fieldByname('SPISS_ID').asinteger;
          MemWozw.fieldbyname('TW_ART').asinteger:=QueryWork.fieldByname('TW_ART').asinteger;
          MemWozw.fieldbyname('TW_NAME').asstring:=QueryWork.fieldByname('TW_NAM').asstring;
          MemWozw.fieldbyname('TW_SHORT_NAM').asstring:=QueryWork.fieldByname('TW_SHORT_NAM').asstring;
          MemWozw.fieldbyname('WOZW_ID').asinteger:=QueryWork.fieldByname('WOZW_ID').asinteger;
          MemWozw.fieldbyname('DOC_NAME').asstring:=QueryWork.fieldByname('DOC_NAME').asstring;
          MemWozw.fieldbyname('DOC_DATE').asdatetime:=QueryWork.fieldByname('DOC_DATE').asdatetime;
          MemWozw.fieldbyname('ED_SHORT').asstring:=QueryWork.fieldByname('ED_SHORT').asstring;
          MemWozw.fieldbyname('RNS_MONEY').asfloat:=QueryWork.fieldByname('TW_MONEY').asfloat;
          MemWozw.fieldbyname('RNS_KOL').asfloat:=QueryWork.fieldByname('SPISS_KOL').asfloat;
          MemWozw.fieldbyname('RNS_OST').asfloat:=QueryWork.fieldByname('SPISS_OST').asfloat;
          MemWozw.fieldbyname('WOZW_KOL').asfloat:=abs(QueryWork.fieldByname('TW_KOL').asfloat);
         if QueryWork2.eof then begin
            MemWozw.fieldbyname('SHOP_ID').asinteger:=0;
            MemWozw.fieldbyname('SHOP_NAME').asstring:='Не найден!';
          end else begin
            MemWozw.fieldbyname('SHOP_ID').asinteger:=QueryWork2.fieldByname('SHOP_ID').asinteger;
            MemWozw.fieldbyname('SHOP_NAME').asstring:=QueryWork2.fieldByname('SHOP_NAME').asstring;
          end;
          MemWozw.Post;
          CanInsert:=False;
          QueryWork.next;
       end;
       MemWozw.First;
       SAVE:=TRUE;
     end;
   end;
   Show_Wait('Инициализация накладной. Все почти готово...',99);
   Show_sost;
   CanInsert:=False;
   Wait_form.hide;
   canRefresh := true;
   Change_FRMUs2(Us2_ID,2);
   RefreshWozw;
end;

procedure TDOC_SPIS_WOZW.MemWozwCalcFields(DataSet: TDataSet);
begin
   MemWozw.fieldByname('RNS_SUMM').asfloat:=
     MemWozw.fieldByname('RNS_KOL').asfloat*MemWozw.fieldByname('RNS_MONEY').asfloat;
   MemWozw.fieldByname('WOZW_SUMM').asfloat:=
     MemWozw.fieldByname('WOZW_KOL').asfloat*MemWozw.fieldByname('RNS_MONEY').asfloat;
end;

procedure TDOC_SPIS_WOZW.MnDelExecute(Sender: TObject);
begin
  if MemWozw.RecordCount>0 then begin
    if Messbox('Удалить факт возврата товара ['+MemWozw.fieldByname('TW_ART').asstring+
    '] "'+MemWozw.fieldByname('TW_NAME').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        if MemWOZW.Fieldbyname('RNS_ID').asinteger>0 then begin
          inc(CNT_DEL);
          SPISS_DEL_MESS[CNT_DEL]:='Удален товар: '+Memwozw.Fieldbyname('TW_ART').asstring+' '+
          Memwozw.Fieldbyname('TW_NAME').asstring+' '+floattostrf(Memwozw.Fieldbyname('WOZW_KOL').asfloat,fffixed,19,4)+' '+
          Memwozw.Fieldbyname('ED_SHORT').asstring;
          SPISS_DEL[CNT_DEL]:=MemWozw.Fieldbyname('RNS_ID').asinteger;
        end;
       MemWozw.Delete;
       SAVE:=False;
       refreshWozw;
    end;
  end;
end;



procedure TDOC_SPIS_WOZW.MnApplyExecute(Sender: TObject);
var
  a,ID,ID2,OLDID:integer;
  r:double;
  shop1,shop2:integer;
begin
   // Сохраняем
   if (MemWOZW.State in [dsInsert,DsEdit]) then MemWOZW.Post;

   if (FRM.value='') then begin
     messbox('не указана фирма', messError, 0);
     Exit;
   end;

   if (SKL.value='') then begin
     messbox('не указан склад', messError, 0);
     Exit;
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
       if shop1 <> strtoint(shop.Value) then shop2:=1;
       MemWozw.next;
     end;
     if shop2<>0 then messbox('Все списания, возврат которых производится должны быть сделаны в одном магазине, выбранном в шапке документа!',MessSystem,48)
     else begin
        MemWozw.first;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           if SPIS_NUMS<0 then SPIS_NUMS:=NEW_SPIS_NUM(STRTOINT('0'+frm.vALUE),SPIS_DATE.date);
           SPIS_NUM.text:=inttostr(SPIS_NUMS);
           IBSAVE_CLEAR;
//           IBSAVE_ADD('RNTYP_ID',Panel1.tag); // Все возвраты - НАЛ (пока)
           IBSAVE_ADD('SPIS_NUM',SPIS_NUMS);
           IBSAVE_ADD('SPIS_DATE',strtodatetime(datetostr(SPIS_DATE.date)+' '+timetostr(time())));
           IBSAVE_ADD('SPISVID_ID',spis_spisvid.value); // Уточнить вид - должен быть возврат товара
           IBSAVE_ADD('SKL_ID',strtoint(SKL.value));
           IBSAVE_ADD('SHOP_ID',strtoint(SHOP.Value));
           IBSAVE_ADD('SPIS_PROW',0);
           IBSAVE_ADD('SPIS_OSN',trim(SPIS_OSN.text));
           IBSAVE_ADD('FRM_ID',strtoint(FRM.value));
           IBSAVE_ADD('US_ID',USERID);
           IBSAVE_ADD('US_ID2',Us2_ID);
           ID:=IBSAVE_DOC('SPIS',DOC_SPIS_WOZW.tag);
           if ID<0 then r:=sqrt(-1) else begin
              DOC_SPIS_WOZW.tag:=ID;

              // Фиксируем удаление товаров
             for A:=1 to CNT_DEL do begin
               IBSAVE_CLEAR;
               IBSAVE_ADD('DOC','SPIS');
               IBSAVE_ADD('US_ID',USERID);
               IBSAVE_ADD('SHOP_ID',strtoint(SHOP.Value));
               IBSAVE_ADD('MESS',SPISS_DEL_MESS[a]);
               IBSAVE_ADD('DOP1',4);
               IBSAVE_ADD('DOP2',ID);
               if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
             end;
             {Сохраняем содержимое}
           // Сохраняем содержимое
           // Стираем удаленное
             for A:=1 to CNT_DEL do begin
                 if SPISS_DEL[A]>0 then if not IBDELETE_DOC('SPISS',SPISS_DEL[A]) then R:=SQRT(-1);
             end;
           // Сохраняем содержимое
              MemWozw.first;
              while not MemWozw.eof do begin
                IBSAVE_CLEAR;
                IBSAVE_ADD('SPIS_ID',ID);
                IBSAVE_ADD('TW_ID',MemWozw.fieldByname('TW_ID').asinteger);
                IBSAVE_ADD('TW_KOL',-MemWozw.fieldByname('WOZW_KOL').asfloat);
                IBSAVE_ADD('TW_MONEY',MemWozw.fieldByname('RNS_MONEY').asfloat);
                IBSAVE_ADD('OTG_KOL',0);
                IBSAVE_ADD('OTG_DATE',my_now());
                IBSAVE_ADD('OTG_US',0);
                IBSAVE_ADD('WOZW_ID',MemWozw.fieldByname('WOZW_ID').asinteger);
                ID2:=IBSAVE_DOC('SPISS',MemWozw.fieldByname('RNS_ID').asinteger);
                if ID2<0 then r:=sqrt(-1) else begin
                   MemWozw.Edit;
                   MemWozw.fieldByname('RNS_ID').asinteger:=ID2;
                   MemWozw.post;
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

procedure TDOC_SPIS_WOZW.MemWozwWOZW_KOLChange(Sender: TField);
var
  val:double;
begin
   SAVE:=FALSE;
   val:=MemWozw.fieldByname('WOZW_KOL').asfloat;
   if val<=0 then begin
     MemWozw.fieldByname('WOZW_KOL').asfloat:=1;
     messbox('Количество товара не может быть нулевой или отрицательной величиной! '+CR+
     'Количеcтво с '+floattostrf(val,fffixed,19,4)+' изменено на 1.000!',MessError,16);
   end;


   refreshwozw;
end;

procedure TDOC_SPIS_WOZW.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (not Save) and (MnApply.enabled) then begin
        if Messbox('Документ был изменён! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDOC_SPIS_WOZW.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   IS_EDIT_WOZW:=false;
end;

procedure TDOC_SPIS_WOZW.MnProwExecute(Sender: TObject);
begin
     if Not Save and MnApply.enabled then MnApply.Execute;
     if (SAVE) then begin
        if NOT WOZW_PROW then begin
          if PROV_SPIS_WOZW(Doc_SPIS_WOZW.tag,'') then begin
                WOZW_PROW:=True;
                Show_Sost;
                refreshWozw;
                SAVE:=true;
          end;
        end;
     end;
end;

procedure TDOC_SPIS_WOZW.MnUnprowExecute(Sender: TObject);
begin
     if UNPROV_SPIS_WOZW(Doc_SPIS_WOZW.tag,'') then begin
                WOZW_PROW:=False;
                Show_Sost;
                refreshWozw;
                SAVE:=True;
     end;
end;

procedure TDOC_SPIS_WOZW.MnSaveExecute(Sender: TObject);
begin
     SAVE:=false;
     ToolButton5.Click;
     if SAVE then begin
        if not WOZW_PROW then ToolButton1.click;
        Close;
     end;
end;

procedure TDOC_SPIS_WOZW.MnLockExecute(Sender: TObject);
begin
 My_lock;
end;

procedure TDOC_SPIS_WOZW.MnPrintExecute(Sender: TObject);
begin
     if Not Save then
        if ToolButton5.enabled then if Messbox('Документ был изменен! Сохранить изменения?',MessSubmit,4+48)=6 then ToolButton5.click;
        {Печатаем}
        PRINT_SPIS(Doc_SPIS_WOZW.tag);
end;

procedure TDOC_SPIS_WOZW.RxDBGrid2GetCellParams(Sender: TObject;
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

procedure TDoc_SPIS_wozw.Change_FrmUs2(ID:integer;N:integer);
var
   s1,s2:ansistring;
begin
     {Отображаем название фирмы и банка}
     Query1Transaction.Active:=False;
     IbQuery1.Close;
     IbQuery1.SQL.clear;
     IbQuery1.SQL.add('select KLN_FAM,KLN_NAME,KLN_NAME2,KLN_ORG,KLN_BNK FROM KLN WHERE KLN_ID=:KLN_ID');
     IbQuery1.Parambyname('KLN_ID').asinteger:=ID;
     IbQuery1.Open;
     s1:='';
     S2:='';
     if IbQuery1.eof then begin
     end else begin
         if trim(IbQuery1.fieldbyname('KLN_FAM').asstring)='' then s1:=IbQuery1.fieldbyname('KLN_ORG').asstring else
         begin
              s1:=IbQuery1.fieldbyname('KLN_FAM').asstring+'. '+
               IbQuery1.fieldbyname('KLN_NAME').asstring+'. '+
               IbQuery1.fieldbyname('KLN_NAME2').asstring;
         end;
         s2:=IbQuery1.fieldbyname('KLN_BNK').asstring;
     end;

     if n=2 then US2_FULL.text:=s1;
     IbQuery1.Close;
end;

procedure TDOC_SPIS_WOZW.US2_BtnClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=US2_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>Us2_ID then begin
        SAVE:=False;
        US2_ID:=DIC_KLIENT.tag;
        Change_FRMUs2(Us2_ID,2);
     end;
     DIC_KLIENT.Destroy;
end;


procedure TDOC_SPIS_WOZW.SPIS_SPISVIDChange(Sender: TObject);
var
  vis:boolean;
begin
   SAVE:=False;
   if DataModule1.MainDicSpisVid.fieldByname('SPISVID_US').asinteger=1 then vis:=true else vis:=false;
   US2_Label.visible:=Vis;
   US2_FULL.visible:=Vis;
   US2_BTN.visible:=Vis;
end;



procedure TDOC_SPIS_WOZW.FRMChange(Sender: TObject);
begin
   	save:=false;

end;

procedure TDOC_SPIS_WOZW.SKLChange(Sender: TObject);
var prev_skl_frm: integer;
begin
  save:=false;
  prev_skl_frm:= skl_frm;
  if prev_skl_frm=0 then FRM_ENABLED:=true;
  
  skl_frm := dataModule1.MainDicSkl.fieldbyname('skl_frm').asinteger;

  if prev_skl_frm <> dataModule1.MainDicSkl.fieldbyname('skl_frm').asinteger then
  begin
    if dataModule1.MainDicSkl.fieldbyname('skl_frm').asinteger>0 then
    begin
      frm.LookupSource := DataModule1.MainDsOsnFrm;
      frm.Value := dataModule1.MainDicSkl.fieldbyname('skl_frm').asstring;
      FRM_ENABLED:=false;
    end
    else
    begin
      frm.LookupSource := DataModule1.MainDsDopFrm;
      frm.Value := DataModule1.MainDicDopFrm.fieldbyname('KLN_ID').asstring;
      FRM_ENABLED:=true;
    end;
  end;

//  if skl_frm=0 then
///      CheckTwSaler;

  show_sost;
end;

end.
