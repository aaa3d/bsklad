unit DocPnWozw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ExtCtrls,Data1,b_utils,b_dbutils,
  StdCtrls, CurrEdit, Mask, ToolEdit, Db, RxMemDS, Menus, ActnList,
  IBCustomDataSet, IBQuery, IBDatabase, RxLookup, Buttons,DetalTW;

type
  TDOC_PN_WOZW = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label2: TLabel;
    PN_OSN: TMemo;
    Label3: TLabel;
    PN_DATE: TDateEdit;
    Label4: TLabel;
    PN_NUM: TEdit;
    Label5: TLabel;
    RxCalcEdit1: TRxCalcEdit;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    MemWozw: TRxMemoryData;
    MemWozwTW_ID: TIntegerField;
    MemWozwPNS_ID: TIntegerField;
    MemWozwTW_ART: TIntegerField;
    MemWozwTW_NAM: TStringField;
    MemWozwWOZW_ID: TIntegerField;
    MemWozwDOC_NAME: TStringField;
    MemWozwDOC_DATE: TDateField;
    MemWozwED_SHORT: TStringField;
    MemWozwPNS_MONEY: TFloatField;
    MemWozwPNS_KOL: TFloatField;
    MemWozwPNS_OST: TFloatField;
    MemWozwPNS_SUMM: TFloatField;
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
    MemWozwPNS_NDS: TFloatField;
    MemWozwPNS_NDS_SUMM: TFloatField;
    MemWozwPOL_ID: TIntegerField;
    Label6: TLabel;
    FRM: TRxDBLookupCombo;
    Label1: TLabel;
    SKL: TRxDBLookupCombo;
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
    procedure PN_DATEChange(Sender: TObject);
    procedure FRMChange(Sender: TObject);
    procedure PN_OSNChange(Sender: TObject);
    procedure BtnKlnClick(Sender: TObject);
    procedure SKLChange(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DOC_PN_WOZW: TDOC_PN_WOZW;
  PN_NUMS:integer;
  Save,CanInsert:Boolean;
  SHOP_ID:integer;
  SKL_ID: integer;
  KLN_ID:integer;
  WOZW_PROW:boolean;
  PNS_DEL:array[1..1000] of integer;
  CNT_DEL:integer=0;

implementation

uses SelectWozw, DicKlient, ANALIZTW;

{$R *.DFM}

procedure TDOC_PN_WOZW.FormShow(Sender: TObject);
begin
   IS_EDIT_WOZW_PN:=true;
   MemWozw.EmptyTable;
   if DOC_PN_WOZW.tag<0 then begin
     PN_DATE.date:=date();
     PN_NUM.text:='Новый';
     PN_NUMS:=-1;
     PN_OSN.lines.clear;
     skl.value := inttostr(DEFAULT_SKLAD);

     SAVE:=False;
     SHOP_ID:=SHOPID;
     KLN_ID:=SHOP_KLN_DEFAULTPN(SHOPID,PNTYP[Toolbar1.tag].ID);
     WOZW_PROW:=False;
     Change_kln;


   end else begin
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select * from pn$ where pn$_id=:pn_id');
     QueryWork.ParamByname('PN_ID').asinteger:=DOC_PN_WOZW.tag;
     QueryWork.Open;
     if QueryWork.eof then Messbox('Ошибка при открытии акта возврата!',MessError,16)
     else begin
       PN_DATE.date:=QueryWork.fieldByname('PN$_DATE').asdatetime;
       PN_NUMS:=QueryWork.fieldByname('PN$_NUM').asinteger;
       PN_NUM.text:=inttostr(PN_NUMS);
       PN_OSN.lines.clear;
       PN_OSN.lines.add(QueryWork.fieldByname('PN$_OSN').asstring);

       SHOP_ID:=QueryWork.fieldByname('SHOP_ID').asinteger;
       skl.VALUE := QueryWork.fieldByname('SKL_ID').asstring;
       frm.Value := QueryWork.fieldbyname('frm_id').asstring;



       KLN_ID:=QueryWork.fieldByname('KLN_ID').asinteger;
       if QueryWork.fieldByname('PN$_PROW').asinteger=1 then WOZW_PROW:=true else WOZW_PROW:=False;
       // Читаем содержимое
       ADD_SQL(QueryWork,'select * from LIST_PNS$(:PN_ID)');
       QueryWork.ParamByname('PN_ID').asinteger:=DOC_PN_WOZW.tag;
       QueryWork.Open;
       while not QueryWork.eof do begin
          CanInsert:=true;
          MemWozw.append;
          MemWozw.fieldbyname('TW_ID').asinteger:=QueryWork.fieldByname('TW_ID').asinteger;
          MemWozw.fieldbyname('PNS_ID').asinteger:=QueryWork.fieldByname('PNS$_ID').asinteger;
          MemWozw.fieldbyname('TW_ART').asinteger:=QueryWork.fieldByname('TW_ART').asinteger;
          MemWozw.fieldbyname('TW_NAM').asstring:=QueryWork.fieldByname('TW_NAM').asstring;
          MemWozw.fieldbyname('WOZW_ID').asinteger:=QueryWork.fieldByname('WOZW_ID').asinteger;
          MemWozw.fieldbyname('DOC_NAME').asstring:=QueryWork.fieldByname('DOC_NAME').asstring;
          MemWozw.fieldbyname('DOC_DATE').asdatetime:=QueryWork.fieldByname('DOC_DATE').asdatetime;
          MemWozw.fieldbyname('ED_SHORT').asstring:=QueryWork.fieldByname('ED_SHORT').asstring;
          MemWozw.fieldbyname('PNS_MONEY').asfloat:=abs(QueryWork.fieldByname('PNS_MONEY_OK').asfloat);
          MemWozw.fieldbyname('PNS_KOL').asfloat:=abs(QueryWork.fieldByname('PNS_KOL').asfloat);
          MemWozw.fieldbyname('PNS_OST').asfloat:=QueryWork.fieldByname('PNS_OST').asfloat;
          MemWozw.fieldbyname('WOZW_KOL').asfloat:=abs(QueryWork.fieldByname('TW_KOL').asfloat);
          MemWozw.fieldbyname('PNS_NDS').asfloat:=abs(QueryWork.fieldByname('PNS$_NDS').asfloat);
          MemWozw.fieldByname('POL_ID').asinteger:=QueryWork.fieldByname('POL_ID').asinteger;
          MemWozw.Post;
          CanInsert:=False;
          QueryWork.next;
       end;
       MemWozw.First;
       Change_kln;
       SAVE:=TRUE;
     end;
   end;
   Show_sost;
   CanInsert:=False;
end;

procedure TDOC_PN_WOZW.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   IS_EDIT_WOZW_PN:=false;
end;

procedure TDOC_PN_WOZW.MnDicTwExecute(Sender: TObject);
VAR
  PNS_ID:integer;
  old_pos,a,b,c:integer;
  can:boolean;
begin
  if FRM.value='' then
  begin
   Messbox('Не указана фирма!',  MessError, MB_OK);
   exit;
  end;


   Application.createForm(TSelect_wozw,Select_wozw);
   Select_wozw.Label2.tag:=2; // Метка, что возврат по приходным
   Select_wozw.tag:=MemWozw.fieldByname('TW_ID').asinteger;
   Select_wozw.Label4.caption:='Возврат по фирме: '+FRM.text;
   Select_wozw.DT1.tag:=strtoint(FRM.value);
   Select_wozw.BtnOk.tag:=Panel1.tag;
   Select_wozw.showModal;
   if Select_wozw.tag>0 then begin
     // Проверяем, не возвращают ли два раза по одному и тому-же
     PNS_ID:=Select_wozw.QueryRep.fieldByname('RNS_ID').asinteger;
     if MemWozw.recordcount>0 then begin
       old_pos:=MemWozw.Recno;
       MemWozw.disablecontrols;
       MemWozw.first;
       can:=true;
       while not MemWozw.eof do begin
          if MemWozw.fieldByname('WOZW_ID').asinteger=PNS_ID then can:=False;
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
       CanInsert:=true;
       MemWozw.append;
       MemWozw.fieldbyname('TW_ID').asinteger:=Select_wozw.RxDbGrid1.tag;
       MemWozw.fieldbyname('PNS_ID').asinteger:=-1;
       MemWozw.fieldbyname('TW_ART').asinteger:=Select_wozw.Panel1.tag;
       MemWozw.fieldbyname('TW_NAM').asstring:=Select_wozw.Edit2.text;
       MemWozw.fieldbyname('WOZW_ID').asinteger:=PNS_ID;
       MemWozw.fieldbyname('DOC_NAME').asstring:=Select_wozw.QueryRep.fieldByname('RN_FULLNUM').asstring;
       MemWozw.fieldbyname('DOC_DATE').asdatetime:=Select_wozw.QueryRep.fieldByname('RN_DATE').asdatetime;
       MemWozw.fieldbyname('ED_SHORT').asstring:='шт';
       MemWozw.fieldbyname('PNS_MONEY').asfloat:=Select_wozw.QueryRep.fieldByname('RNS_MONEY').asfloat;
       MemWozw.fieldbyname('PNS_KOL').asfloat:=Select_wozw.QueryRep.fieldByname('RNS_KOL').asfloat;
       MemWozw.fieldbyname('PNS_NDS').asfloat:=Select_wozw.QueryRep.fieldByname('PNS$_NDS').asfloat;
       MemWozw.fieldbyname('PNS_OST').asfloat:=Select_wozw.QueryRep.fieldByname('RNS_OST').asfloat;
       MemWozw.fieldbyname('WOZW_KOL').asfloat:=1;
       MemWozw.fieldbyname('POL_ID').asinteger:=-1;
       MemWozw.Post;
       CanInsert:=False;
       SAVE:=False;
     end;
   end;
   SHOW_SOST;
   Select_wozw.destroy;
end;

procedure TDOC_PN_WOZW.MnDelExecute(Sender: TObject);
begin
  if MemWozw.RecordCount>0 then begin
    if Messbox('Удалить факт возврата товара ['+MemWozw.fieldByname('TW_ART').asstring+
    '] "'+MemWozw.fieldByname('TW_NAM').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        if MemWOZW.Fieldbyname('PNS_ID').asinteger>0 then begin
          inc(CNT_DEL);
          PNS_DEL[CNT_DEL]:=MemWozw.Fieldbyname('PNS_ID').asinteger;
        end;
       MemWozw.Delete;
       SAVE:=False;
    end;
  end;
end;

procedure TDOC_PN_WOZW.MemWozwAfterDelete(DataSet: TDataSet);
begin
  Show_Sost;
end;

Procedure TDOC_PN_WOZW.SHow_sost;
var
  Empty:boolean;
begin
   IF WOZW_PROW then DOC_PN_WOZW.caption:='Акт возврата поставщику по: '+PNTYP[Toolbar1.tag].FULL+'. Редактирование!'
   else DOC_PN_WOZW.caption:='Акт возврата поставщику по: '+PNTYP[Toolbar1.tag].FULL+'. Новый!';
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
   PN_DATE.enabled:=not MnUnProw.enabled;
   FRM.enabled:=not MnUnProw.enabled and empty;
   SKL.enabled:=not MnUnProw.enabled;
   BtnKln.enabled:=not MnUnProw.enabled and empty;
   PN_OSN.enabled:=not MnUnProw.enabled;
   MnDicTw.enabled:=not MnUnProw.enabled;
   RxDbgrid1.readonly:=WOZW_PROW;
end;

procedure TDOC_PN_WOZW.DsWozwDataChange(Sender: TObject; Field: TField);
begin
     if MemWozw.State in [dsInsert,dsEdit] then SAVE:=False;
     if (MemWozw.State in [dsInsert]) and ( not CanInsert) then MemWozw.Cancel;
end;

procedure TDOC_PN_WOZW.MemWozwCalcFields(DataSet: TDataSet);
begin
   MemWozw.fieldByname('PNS_SUMM').asfloat:=
     MemWozw.fieldByname('PNS_KOL').asfloat*MemWozw.fieldByname('PNS_MONEY').asfloat;
   MemWozw.fieldByname('WOZW_SUMM').asfloat:=
     MemWozw.fieldByname('WOZW_KOL').asfloat*MemWozw.fieldByname('PNS_MONEY').asfloat;
   MemWozw.fieldByname('PNS_NDS_SUMM').asfloat:=((MemWozw.fieldByname('WOZW_KOL').asfloat*MemWozw.fieldByname('PNS_MONEY').asfloat)/
     (100+MemWozw.fieldByname('PNS_NDS').asfloat))*MemWozw.fieldByname('PNS_NDS').asfloat;

end;

procedure TDOC_PN_WOZW.MemWozwAfterScroll(DataSet: TDataSet);
begin
   Statusbar1.panels[0].text:=MemWozw.fieldbyname('TW_ART').asstring;
   Statusbar1.panels[1].text:=MemWozw.fieldbyname('TW_NAM').asstring;
end;

procedure TDOC_PN_WOZW.MnApplyExecute(Sender: TObject);
var
  a,ID,ID2,OLDID,IDPOL:integer;
  r:double;
begin
   // Сохраняем
   if (MemWOZW.State in [dsInsert,DsEdit]) then MemWOZW.Post;


  if SKL.value='' then Messbox('Не указан склад !',MessSystem,48) else
   if MemWozw.recordcount=0 then Messbox('Необходимо указать хотя-бы один товар!',MessSystem,48) else begin
        OLDID:=MemWOZW.recno;
        MemWOZW.DisableControls;
        MemWOZW.First;
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           if PN_NUMS<0 then PN_NUMS:=NEW_PN_NUM(Panel1.tag, strtoint('0'+FRM.Value), PN_DATE.date);
           PN_NUM.text:=inttostr(PN_NUMS);
           IBSAVE_CLEAR;
           IBSAVE_ADD('PNTYP_ID',Panel1.tag); // Все возвраты - НАЛ (пока)
           IBSAVE_ADD('PN$_NUM',PN_NUMS);
           IBSAVE_ADD('PN$_DATE',strtodatetime(datetostr(PN_DATE.date)+' '+timetostr(time())));
           IBSAVE_ADD('PN$_OWNER',0);
           IBSAVE_ADD('PNVID_ID',DEFAULT_PNVID_WOZW); // Уточнить вид - должен быть возврат товара
           IBSAVE_ADD('SKL_ID',strtoint(SKL.value));
           IBSAVE_ADD('SHOP_ID',SHOP_ID);
           IBSAVE_ADD('PN$_PROW',0);
           IBSAVE_ADD('PN$_OSN',trim(PN_OSN.text));
           IBSAVE_ADD('PN$_WHO','');
           IBSAVE_ADD('KLN_ID',KLN_ID);
           IBSAVE_ADD('PN$_KURS',1);
           IBSAVE_ADD('FRM_ID',strtoint(FRM.value));
           IBSAVE_ADD('PN$_OST',100);
           IBSAVE_ADD('US_ID',USERID);
           ID:=IBSAVE_DOC('PN$',DOC_PN_WOZW.tag);
           if ID<0 then r:=sqrt(-1) else begin
              DOC_PN_WOZW.tag:=ID;
           // Сохраняем содержимое
           // Стираем удаленное
             for A:=1 to CNT_DEL do begin
                 if PNS_DEL[A]>0 then if not IBDELETE_DOC('PNS$',PNS_DEL[A]) then R:=SQRT(-1);
             end;
           // Сохраняем содержимое
              MemWozw.first;
              while not MemWozw.eof do begin
                IBSAVE_CLEAR;
                IBSAVE_ADD('PN$_ID',ID);
                IBSAVE_ADD('TW_ID',MemWozw.fieldByname('TW_ID').asinteger);
                IBSAVE_ADD('TW_KOL',-abs(MemWozw.fieldByname('WOZW_KOL').asfloat));
                IBSAVE_ADD('TW_SUMM',-abs(MemWozw.fieldByname('WOZW_SUMM').asfloat));
                IBSAVE_ADD('PNS$_NDS',MemWozw.fieldByname('PNS_NDS').asfloat);
                IBSAVE_ADD('PNS$_NDS_SUMM',-abs(MemWozw.fieldByname('PNS_NDS_SUMM').asfloat));
                IBSAVE_ADD('WOZW_ID',MemWozw.fieldByname('WOZW_ID').asinteger);
                ID2:=IBSAVE_DOC('PNS$',MemWozw.fieldByname('PNS_ID').asinteger);
                if MemWozw.fieldbyname('POL_ID').asinteger<0 then begin
                        IBSAVE_CLEAR;
                        IBSAVE_ADD('DOC_TYP',1); // Метка приходной накладной
                        IBSAVE_ADD('DOC_ID',ID2);
                        IBSAVE_ADD('POL_KOL',0);
                        IBSAVE_ADD('POL_DATE',My_NOW);
                        IBSAVE_ADD('POL_US',0);
                        IDPOL:=IBSAVE_DOC('POL',-1);
                        if IDPOL<0 then r:=SQRT(-1);
                end;
                if ((ID2<0) or (IDPOL<0)) then r:=sqrt(-1) else begin
                   MemWozw.Edit;
                   MemWozw.fieldByname('PNS_ID').asinteger:=ID2;
                   MemWozw.fieldByname('POL_ID').asinteger:=IDPOL;
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
end;

procedure TDOC_PN_WOZW.MnSaveExecute(Sender: TObject);
begin
   Save:=False;
   if MnApply.enabled then MnApply.Execute;
   if SAVE then begin
        if not WOZW_PROW then if MnProw.enabled then MnProw.Execute;
        Close;
   end;
end;

procedure TDOC_PN_WOZW.PN_DATEChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDOC_PN_WOZW.FRMChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDOC_PN_WOZW.PN_OSNChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDOC_PN_WOZW.BtnKlnClick(Sender: TObject);
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
       PN_OSN.setfocus;
     Except
     End;

end;

Procedure TDOC_PN_WOZW.Change_KLN;
var
   s1,s2:ansistring;
begin
     {Отображаем название фирмы и банка}
     WorkTransaction.Active:=False;
     QueryWork.Close;
     QueryWork.SQL.clear;
     QueryWork.SQL.add('select KLN_FULL,KLN_REKW FROM KLN_DATA(:KLN_ID)');
     QueryWork.Parambyname('KLN_ID').asinteger:=KLN_ID;
     QueryWork.Open;
     s1:='';
     S2:='';
     if not QueryWork.eof then begin
         s1:=QueryWork.fieldbyname('KLN_FULL').asstring;
         s2:=QueryWork.fieldbyname('KLN_REKW').asstring;
     end;
     KLN_NAME.text:=s1;
     // KLN_BNK.text:=s2;
     QueryWork.Close;
end;

procedure TDOC_PN_WOZW.SKLChange(Sender: TObject);
begin
  save:=false;
  show_sost;
end;

procedure TDOC_PN_WOZW.MemWozwBeforePost(DataSet: TDataSet);
begin
    Show_sost;
end;

procedure TDOC_PN_WOZW.MnProwExecute(Sender: TObject);
begin
     if Not Save and MnApply.enabled then MnApply.Execute;
     if (SAVE) then begin
        if NOT WOZW_PROW then begin
          if PROV_WOZW_PN(Doc_PN_WOZW.tag,'') then begin
                WOZW_PROW:=True;
                Show_Sost;
                SAVE:=true;
          end;
        end;
     end;
end;

procedure TDOC_PN_WOZW.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='WOZW_KOL' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PNS_OST').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_KOL').Asfloat)
           and (OST_COLOR1>0) then Background:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PNS_OST').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_KOL').Asfloat)
           and (OST_COLOR2>0) then Background:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PNS_OST').Asfloat<0)
           and (OST_COLOR3>0) then Background:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PNS_OST').Asfloat=0)
           and (OST_COLOR4>0) then Background:=OST_COLOR4;
     end;
     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
      if Field.Fieldname='WOZW_KOL' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PNS_OST').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_KOL').Asfloat)
           and (OST_COLOR1>0) then Afont.color:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PNS_OST').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_KOL').Asfloat)
           and (OST_COLOR2>0) then Afont.color:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PNS_OST').Asfloat<0)
           and (OST_COLOR3>0) then Afont.color:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PNS_OST').Asfloat=0)
           and (OST_COLOR4>0) then Afont.color:=OST_COLOR4;
       end;
     end;

end;

procedure TDOC_PN_WOZW.MnUnprowExecute(Sender: TObject);
begin
     if UNPROV_WOZW_PN(Doc_PN_WOZW.tag,'') then begin
                WOZW_PROW:=False;
                Show_Sost;
                SAVE:=True;
     end;
end;

procedure TDOC_PN_WOZW.MnDetalExecute(Sender: TObject);
begin
   show_detal_tw(MemWozw.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_PN_WOZW.MnAnalizExecute(Sender: TObject);
begin
  show_analiz_tw(MemWozw.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_PN_WOZW.MnMarketExecute(Sender: TObject);
begin
     SHOW_MARKETING_TW(MemWozw.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_PN_WOZW.MnLockExecute(Sender: TObject);
begin
     My_lock;
end;

procedure TDOC_PN_WOZW.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (not Save) and (MnApply.enabled) then begin
        if Messbox('Акт был изменён! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDOC_PN_WOZW.MemWozwWOZW_KOLChange(Sender: TField);
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
end;

end.
