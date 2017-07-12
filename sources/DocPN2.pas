unit DocPN2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, RXDBCtrl, CurrEdit, Mask, ToolEdit, StdCtrls,
  Buttons, RxLookup, ExtCtrls, ToolWin,b_utils,b_DButils,Data1, ActnList,
  Db, IBCustomDataSet, IBQuery, IBDatabase, RxMemDS, Placemnt,vclUtils,
  DBCtrls, Menus,DetalTW;

type
  TDOC_PN2 = class(TForm)
    ToolBar1: TToolBar;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    PN_POST: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    PN_POST_REKW: TEdit;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    PN_OWNER: TRxDBLookupCombo;
    Label7: TLabel;
    Label8: TLabel;
    PN_OSN: TMemo;
    PN_WHO: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    PN_VID: TRxDBLookupCombo;
    PN_NUM: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    PN_DATE: TDateEdit;
    PN_DATE_OPL: TDateEdit;
    Btn_Date_Opl: TSpeedButton;
    Label13: TLabel;
    PN_KURS: TRxCalcEdit;
    RxDBGrid1: TRxDBGrid;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    BtnPrint2: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ActionList1: TActionList;
    BtnLock: TAction;
    BtnProv: TAction;
    BtnUnprov: TAction;
    BtnSave: TAction;
    BtnApply: TAction;
    BtnPrint: TAction;
    BtnHistory: TAction;
    BtnSub: TAction;
    BtnDicTw: TAction;
    BtnDel: TAction;
    BtnDetal: TAction;
    BtnAnaliz: TAction;
    BtnMarketing: TAction;
    BtnSert: TAction;
    BtnPrintCennik: TAction;
    BtnPrintCennikAll: TAction;
    WorkTransaction: TIBTransaction;
    QueryWork1: TIBQuery;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    MemFrmFRM_BANK: TStringField;
    FRM: TRxDBLookupCombo;
    BtnDicFrm: TAction;
    PopupMenu1: TPopupMenu;
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
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    BtnDicKln: TAction;
    N25: TMenuItem;
    MemPns: TRxMemoryData;
    MemPnsPNS_ID: TIntegerField;
    MemPnsTW_ID: TIntegerField;
    MemPnsTW_ART: TIntegerField;
    MemPnsTW_NAM: TStringField;
    MemPnsED_SHORT: TStringField;
    MemPnsTW_KOL: TFloatField;
    MemPnsTW_SUMM: TFloatField;
    MemPnsPNS_NDS: TFloatField;
    MemPnsPNS_NDS_SUMM: TFloatField;
    MemPnsTW_MONEY: TFloatField;
    DsPns: TDataSource;
    MemPnsTW_COLOR: TIntegerField;
    MemPnsSERT_NUM: TStringField;
    MemPnsSERT_DATE: TDateField;
    MemPnsSERT_WHO: TStringField;
    MemPnsSERT_ID: TIntegerField;
    QueryWork2: TIBQuery;
    MemPns2: TRxMemoryData;
    MemPns2PNS2_ID: TIntegerField;
    MemPns2DOC: TStringField;
    MemPns2DOC_DATE: TDateField;
    MemPns2KLN_ID: TIntegerField;
    MemPns2KLN_FULL: TStringField;
    MemPns2USL_ID: TIntegerField;
    MemPns2USL_FULL: TStringField;
    MemPns2NDS: TFloatField;
    MemPns2NDS_SUMM: TFloatField;
    MemPns2SUMM: TFloatField;
    MemPns2MET: TIntegerField;
    MemPns2MET_FULL: TStringField;
    DsPns2: TDataSource;
    RxDBGrid2: TRxDBGrid;
    MemPns2SUMM2: TFloatField;
    BtnRefresh: TAction;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    MemPnsTW_SUMM_SEB: TFloatField;
    MemPnsTW_SUMM_SEB2: TFloatField;
    MemPnsTW_SUMM_SEB_ALL: TFloatField;
    MemPnsTW_MONEY_SEB: TFloatField;
    MemPnsTW_MONEY_SEB2: TFloatField;
    MemPnsTW_MONEY_SEB_ALL: TFloatField;
    TabSheet3: TTabSheet;
    Label19: TLabel;
    Label14: TLabel;
    Bevel2: TBevel;
    Label15: TLabel;
    Bevel1: TBevel;
    Label16: TLabel;
    Bevel3: TBevel;
    Bevel6: TBevel;
    Bevel4: TBevel;
    Label17: TLabel;
    Label18: TLabel;
    Bevel5: TBevel;
    Label20: TLabel;
    Bevel7: TBevel;
    SUMM_ALL1: TRxCalcEdit;
    SUMM_NO_NDS1: TRxCalcEdit;
    SUMM_NDS1: TRxCalcEdit;
    SUMM_NDS2: TRxCalcEdit;
    SUMM_NO_NDS2: TRxCalcEdit;
    SUMM_ALL2: TRxCalcEdit;
    SUMM_ALL3: TRxCalcEdit;
    SUMM_NO_NDS3: TRxCalcEdit;
    SUMM_NDS3: TRxCalcEdit;
    Bevel8: TBevel;
    Label21: TLabel;
    TW_SUMM_NO_NDS: TRxCalcEdit;
    TW_SUMM_NDS: TRxCalcEdit;
    TW_SUMM_ALL: TRxCalcEdit;
    Label22: TLabel;
    VID: TComboBox;
    MemPnsTW_MONEY_MEN: TFloatField;
    MemPnsTW_SUMM_MEN: TFloatField;
    MemPnsPNS_SUB: TStringField;
    MemPnsPOL_ID: TIntegerField;
    MemPns2PNS2_SUB: TStringField;
    SUMM_ITOGO2: TRxCalcEdit;
    Bevel9: TBevel;
    Label23: TLabel;
    SUMM_ITOGO1: TRxCalcEdit;
    Label24: TLabel;
    Panel2: TPanel;
    Check_nakl: TCheckBox;
    NAKL_EDIT: TEdit;
    Btn_Nakl: TButton;
    Label25: TLabel;
    NAKL_SUMM: TRxCalcEdit;
    QueryWork: TIBQuery;
    MemPnsTW_KOL2: TFloatField;
    MemPnsTW_SUMM2: TFloatField;
    BtnPoluProv: TAction;
    ToolButton9: TToolButton;
    Label26: TLabel;
    PN_STFAKT: TEdit;
    PnDocTransaction: TIBTransaction;
    Label6: TLabel;
    SKL: TRxDBLookupCombo;
    FRM_BNK: TEdit;
    Label27: TLabel;
    PN_STFAKT_DATE: TDateEdit;
    PN_STFAKT_NUM: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    procedure BtnLockExecute(Sender: TObject);
    procedure BtnProvExecute(Sender: TObject);
    procedure BtnUnprovExecute(Sender: TObject);
    procedure BtnSaveExecute(Sender: TObject);
    procedure BtnApplyExecute(Sender: TObject);
    procedure BtnPrintExecute(Sender: TObject);
    procedure BtnHistoryExecute(Sender: TObject);
    procedure BtnSubExecute(Sender: TObject);
    procedure BtnDicTwExecute(Sender: TObject);
    procedure BtnDelExecute(Sender: TObject);
    procedure BtnDetalExecute(Sender: TObject);
    procedure BtnAnalizExecute(Sender: TObject);
    procedure BtnMarketingExecute(Sender: TObject);
    procedure BtnSertExecute(Sender: TObject);
    procedure BtnPrintCennikExecute(Sender: TObject);
    procedure BtnPrintCennikAllExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Change_FrmKln(ID,N:integer);
    Procedure SHOW_STATUS(s:string;N:integer);
    Procedure CLEAR_STATUS(N:integer);
    procedure BtnDicKlnExecute(Sender: TObject);
    procedure Btn_Date_OplClick(Sender: TObject);
    procedure DsPnsDataChange(Sender: TObject; Field: TField);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Show_sost;
    procedure ADD_PNS(TW_ID:integer;KOL:double);
    procedure MemPnsCalcFields(DataSet: TDataSet);
    procedure MemPns2CalcFields(DataSet: TDataSet);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DsPns2DataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnRefreshExecute(Sender: TObject);
    procedure MemPns2BeforePost(DataSet: TDataSet);
    procedure VIDChange(Sender: TObject);
    procedure MemPnsBeforePost(DataSet: TDataSet);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FRMChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Btn_NaklClick(Sender: TObject);
    procedure Check_naklClick(Sender: TObject);
    procedure MemPnsTW_KOLChange(Sender: TField);
    procedure PN_KURSChange(Sender: TObject);
    procedure BtnPoluProvExecute(Sender: TObject);
    procedure MemPnsPNS_IDChange(Sender: TField);
    procedure SKLChange(Sender: TObject);
    procedure PN_OWNERChange(Sender: TObject);
    procedure PN_VIDChange(Sender: TObject);
    procedure PN_OSNChange(Sender: TObject);
    procedure PN_WHOChange(Sender: TObject);
    procedure PN_DATEChange(Sender: TObject);
    procedure PN_DATE_OPLChange(Sender: TObject);
    procedure PN_STFAKTChange(Sender: TObject);
  private
    IS_SALE: Boolean;
    skl_frm: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CanKorr:boolean;
  PNS_DEL:array[1..1000] of integer;
  PNS2_DEL:array[1..1000] of integer;
  PNS_DEL_TW:array[1..1000] of integer;
  PNS_DEL_POL:array[1..1000] of double;
  PNS_DEL_MESS:array[1..1000] of string;
  PNS_DEL_MESS2:array[1..1000] of string;
  PNS_DEL_MESS22:array[1..1000] of string;
  CNT_DEL:integer=0;
  CNT_DEL2:integer=0;



  tmShift:integer;
  DOC_PN2: TDOC_PN2;
  SKL_ID, SHOP_ID,PN2_KLN,PN_NUMS:integer;
  PN2_SUB:string;
  PN2_NAKL:integer;
  CanInsert:Boolean=False;
  CanInsert2:Boolean=False;
  PN_PROW:boolean;
  PN_KORR:boolean;
  Sost:integer=0;
  STR:string;
  SAVE:boolean;
 VID0:array[1..10] of string=('TW_ART','TW_NAM','ED_SHORT','PNS_NDS_SUMM','PNS_NDS','TW_KOL',
     'TW_SUMM','SERT_NUM','SERT_WHO','SERT_DATE');
 VID1:array[1..11] of string=('TW_ART','TW_NAM','ED_SHORT','TW_MONEY','TW_MONEY_MEN','TW_KOL',
     'TW_SUMM','TW_SUMM_MEN','SERT_NUM','SERT_WHO','SERT_DATE');
//Добавлено 07.04.2004 для ндс 10%
 PN_NDS: double;

implementation

uses DicKlient, SetKolvo, EditNakl, ANALIZTW, DicTowar, FindDocNum;

{$R *.DFM}

procedure TDoc_Pn2.Show_sost;
var
   a:integer;
   s:ansistring;
   PnEmpty:boolean;
   oldProv: Boolean;
   i: integer;
begin
     oldProv := PN_PROW;
     if is_sale then
        PN_PROW:=True;

     DataModule1.MainDicPnTyp.locate('PNTYP_ID',Doc_PN2.Statusbar1.Tag,[]);
     if Doc_Pn2.Tag<0 then
       Doc_PN2.caption:=DataModule1.MainDicPnTyp.fieldByname('PNTYP_FULL').asstring+'. Новая'
     else begin
          if PN_PROW then
            Doc_PN2.caption:=DataModule1.MainDicPnTyp.fieldByname('PNTYP_FULL').asstring+'. Просмотр'
          else
            Doc_PN2.caption:=DataModule1.MainDicPnTyp.fieldByname('PNTYP_FULL').asstring+'. Редактирование';
          if PN_KORR then Doc_PN2.caption:=DataModule1.MainDicPnTyp.fieldByname('PNTYP_FULL').asstring+'. Коррекция';
     end;
     if MemPNS.RecordCount=0 then PnEmpty:=true else PnEmpty:=false;
     case Sost of
             0: begin
                   s:='Ожидание...';
                   Panel1.Color:=clBtnFace;
                   Panel1.Font.color:=ClWindowText;
                end;
             1: begin
                   s:='Ввод товаров...';
                   if TW_FON>=0 then Panel1.Color:=TW_FON;
                   if TW_COLOR>=0 then Panel1.Font.color:=TW_COLOR;
                end;
     end;
     BtnPoluProv.enabled:=PN_PROW and (not pn_korr) and CanKorr;
     StatusBar1.Panels[0].text:='Состояние: '+s;
     StatusBar1.Panels[1].text:=STR;
     BtnProV.enabled:=(not PN_PROW) and (not PnEmpty) and (not Pn_Korr);
     Btn_Date_Opl.enabled:=(not PN_PROW) or (Pn_Korr);;
     BtnUnProv.enabled:=(PN_PROW) and (not PnEmpty) and (not Pn_Korr) and (not is_sale);;
     BtnSAVE.enabled:=((not PN_PROW) or (pn_korr)) and (not PnEmpty);
     BtnApply.enabled:=((not PN_PROW) or (pn_korr)) and (not PnEmpty);
     BtnSert.enabled:=((not PN_PROW) or (Pn_Korr)) and (not PnEmpty);
     BtnPrint.enabled:=not PnEmpty;
     BtnHistory.enabled:=true;
     BtnSub.enabled:=not PnEmpty;
     BtnDicTw.enabled:=not PN_PROW and (not Pn_Korr);
     BtnDel.enabled:=(not PN_PROW) and (not PnEmpty) and (not Pn_Korr);
     BtnDETAL.enabled:=not PnEmpty and CANTW_DETAL;
     BtnAnaliz.enabled:=not PnEmpty and CANTW_ANALIZ;
     BtnMarketing.enabled:=not PnEmpty and CANTW_MARKETING;
     BtnPrintCennik.enabled:=not PnEmpty;
     BtnPrintCennikAll.enabled:=not PnEmpty;
     for a:=3 to RxDbGrid1.Columns.Count-1 do RxDbGrid1.columns[a].ReadOnly:=false;
     // разреашаем правку прихода
     if not pn_korr then RxDbgrid1.ReadOnly:=Pn_PROW
     else begin
        RxDbgrid1.ReadOnly:=False;
        // коррекция - запретить правку колонки кол-во
        for a:=3 to RxDbGrid1.Columns.Count-1 do
        if a in [9,10,11,16,17,18] then RxDbGrid1.columns[a].ReadOnly:=false
        else RxDbGrid1.columns[a].ReadOnly:=true;
     end;
     RxDbgrid2.ReadOnly:=Pn_PROW or (pn_korr);
     BTNDicFrm.enabled:=not PN_PROW or Pn_korr;
     FRM.enabled:=(not PN_PROW or Pn_korr);
     BtnDicKln.enabled:=not PN_PROW or Pn_korr;
     PN_OWNER.enabled:=not PN_PROW or Pn_korr;
     SKL.enabled:=not PN_PROW and (not Pn_korr);
     PN_STFAKT.enabled:=not PN_PROW or (pn_korr);
     PN_STFAKT_NUM.enabled:=PN_STFAKT.enabled;
     PN_STFAKT_DATE.enabled:=PN_STFAKT.enabled;
     PN_VID.enabled:=not PN_PROW or (pn_korr);
     PN_DATE.enabled:=not PN_PROW and (not Pn_korr);
     PN_DATE_OPL.enabled:=not PN_PROW or (pn_korr);
//     PN_KURS.enabled:=not PN_PROW or (pn_korr);
     PN_OSN.enabled:=not PN_PROW or (pn_korr);
     PN_WHO.enabled:=not PN_PROW or (pn_korr);


     if not CHECK_DOSTUP('$SHOW.ZAKUP') then
     for i := 0 to rxDBGrid1.Columns.Count - 1 do
     begin
      if ((rxDBGrid1.Columns[i].Field.FullName = 'PNS_SUMM')
      or
      (rxDBGrid1.Columns[i].Field.FullName = 'TW_MONEY')
      or
      (rxDBGrid1.Columns[i].Field.FullName = 'TW_MONEY_SEB')
      or
      (rxDBGrid1.Columns[i].Field.FullName = 'TW_MONEY_SEB2')
      or
      (rxDBGrid1.Columns[i].Field.FullName = 'PNS_SUMM')
      or
      (rxDBGrid1.Columns[i].Field.FullName = 'PNS_NDS_SUMM')
      or
      (rxDBGrid1.Columns[i].Field.FullName = 'TW_SUMM_SEB')
      or
      (rxDBGrid1.Columns[i].Field.FullName = 'TW_MONEY_SEB_ALL')
      or
      (rxDBGrid1.Columns[i].Field.FullName = 'TW_MONEY_MEN')
      or
      (rxDBGrid1.Columns[i].Field.FullName = 'TW_SUMM_MEN')      
      or
      (rxDBGrid1.Columns[i].Field.FullName = 'TW_SUMM')
      )

        then

      rxDBGrid1.Columns[i].Visible:=false;


     end;




     PN_PROW:=oldProv;
end;



procedure TDOC_PN2.SHOW_STATUS(s:string;N:integer);
// Процедура выводит строку в строке состояния
begin
  Statusbar1.Panels[N].text:=s;
  delay(1);
end;

procedure TDOC_PN2.CLEAR_STATUS(N:integer);
// Очищает строку состояний
begin
  Statusbar1.Panels[N].text:='';
  delay(1);
end;

procedure TDOC_PN2.Change_FrmKln(ID,N:integer);
var
   s1,s2:ansistring;
begin
  ADD_SQL(QueryWork2,'select KLN_FULL,KLN_REKW from KLN_DATA(:KLN_ID)');
  QueryWork2.ParamByname('KLN_ID').asinteger:=ID;
  QueryWork2.Open;
  if not QueryWork2.Eof then
  begin
  	 s1:=QueryWork2.fieldbyname('KLN_FULL').asstring;
     s2:=QueryWork2.fieldbyname('KLN_REKW').asstring;
  end;

  if N=1 then
  begin
        FRM_BNK.text:=s2;
  end
  	else    begin
        	PN_POST.text:=s1;
        	PN_POST_REKW.text:=s2;
     		end;

  QueryWork2.Close;
  CLEAR_STATUS(2);
end;

procedure TDOC_PN2.BtnLockExecute(Sender: TObject);
begin
   // Заблокировать систему
   My_lock;
end;

procedure TDOC_PN2.BtnProvExecute(Sender: TObject);
begin
   // Провести
     if not SAVE and BtnApply.enabled then BtnApply.Execute;
     if (SAVE) then begin
        if PROV_PN(Doc_Pn2.tag,'') then begin
                PN_KORR:=false;
                PN_PROW:=True;
                SAVE:=True;
                Show_Sost;
        end;
     end;
end;

procedure TDOC_PN2.BtnUnprovExecute(Sender: TObject);
begin
  // Снять с проводки
     if UNPROV_PN(Doc_Pn2.tag,'') then begin
                PN_KORR:=False;
                PN_PROW:=False;
                Show_Sost;
                SAVE:=True;
     end;
end;

procedure TDOC_PN2.BtnSaveExecute(Sender: TObject);
begin
  // Сохранить
  SAVE:=false;
  BtnApply.Execute;
  // Спросить проводку
  if SAVE then begin
        if not PN_PROW then BtnProv.Execute;
        Close;
  end;
end;

procedure TDOC_PN2.BtnApplyExecute(Sender: TObject);
var
   A,PN_ID,ID,IDPOL,OLDID,OLDID2:integer;
   r,IDR:double;
   errpns2:integer;
   s,s2:ansistring;
begin
  // Проверка на корректность
  // проверяем, на правильность оформления накладных расходов
  errpns2:=0;
  MemPns2.First;
  s:='';
  s2:='';
  while not MemPns2.eof do begin
    s:=ansiuppercase(trim(MemPns2.fieldByname('DOC').asstring));
       if (b_utils.left(s,length(const_SF))<>const_SF) and (b_utils.left(s,length(const_AV))<>const_AV)then begin
                s2:=s2+MemPns2.fieldByname('DOC').asstring+',';
                inc(errpns2);
       end;
    MemPns2.next;
  end;
  if length(s2)>0 then s2:=b_utils.left(s2,length(s2)-1);
  if errpns2>0 then messbox('Неправильное оформление накладных расходов. Авансовый отчет должен обозначаться: "'+COnst_AV+'",'+
    'а транспортные расходы: "'+const_SF+'" Накладная не будет выгружена в 1С! Неверные строки: '+s2,MessError,16);
  if Strtoint('0'+trim(FRM.value))=0 then messbox('Не указана фирма накладной!',MessSystem,48) else
  if Strtoint('0'+trim(PN_OWNER.value))=0 then messbox('Не указан владелец товара!',MessSystem,48) else



  if SKL.value='' then Messbox('Не указан склад !',MessSystem,48) else
  if strtoint('0'+trim(PN_VID.value))=0 then Messbox('Не указан вид приходной накладной!',MessSystem,48)
  else
    //проверить, что выбранная фирма является фирмой-владельцем на складе
  //ПРОВЕРИТЬ ПРОДАВЦА ТОВАРОВ (только если продажи производятся со складов, где нет фирмы-владельца)
  if MemPNS.RecordCount=0 then Messbox('Список товаров пуст!',MessSystem,48)
  else
  begin
     {Сохраняем накладную (Apply)}
     SAVE:=False;
     if (MemPns.State in [dsInsert,DsEdit]) then MemPns.Post;
     if (MemPns2.State in [dsInsert,DsEdit]) then MemPns2.Post;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     OLDID:=MemPNS.recno;
     OLDID2:=MemPNS2.recno;
     Try
      if (not PN_PROW) or (pn_korr) then begin
        IBSAVE_CLEAR;
        IBSAVE_ADD('PNTYP_ID',Doc_PN2.Statusbar1.Tag);
        if PN_NUMS<0 then PN_NUMS:=NEW_PN_NUM(Doc_PN2.Statusbar1.Tag, strtoint('0'+FRM.Value),PN_DATE.date);
        IBSAVE_ADD('PN$_NUM',PN_NUMS);
        if (not pn_korr) then IBSAVE_ADD('PN$_DATE',strtodatetime(datetostr(PN_DATE.date)+' '+timetostr(time())));
        IBSAVE_ADD('PN$_DATE_OPL',strtodate(datetostr(PN_DATE_OPL.date)));
        IBSAVE_ADD('PN$_OWNER',strtoint('0'+trim(PN_OWNER.value)));
        IBSAVE_ADD('PNVID_ID',strtoint('0'+trim(PN_VID.value)));
        IBSAVE_ADD('SKL_ID',strtoint(SKL.value));
        IBSAVE_ADD('SHOP_ID',SHOP_ID);
        if (not pn_korr) then IBSAVE_ADD('PN$_PROW','0');
        IBSAVE_ADD('PN$_OSN',Memotostr(PN_OSN.lines));
        IBSAVE_ADD('PN$_WHO',PN_WHO.text);
        IBSAVE_ADD('PN$_STFAKT',PN_STFAKT.text);
        IBSAVE_ADD('PN$_STFAKT_NUM',PN_STFAKT_NUM.text);
        IBSAVE_ADD('PN$_STFAKT_DATE',PN_STFAKT_DATE.Date);
        IBSAVE_ADD('KLN_ID',PN2_KLN);
        IBSAVE_ADD('PN$_KURS',PN_KURS.value);
        IBSAVE_ADD('FRM_ID',strtoint(trim(FRM.value)));
        // PN$_OST не сохраняем
        if Check_nakl.checked then IBSAVE_ADD('PN$_NAKL',PN2_NAKL) else IBSAVE_ADD('PN$_NAKL',0);
        IBSAVE_ADD('US_ID',USERID);
        IBSAVE_ADD('PN$_SUB',PN2_SUB);
        PN_ID:=IBSAVE_DOC('PN$',DOC_PN2.tag);
        if PN_ID<=0 then IDR:=SQRT(-1);
      end else PN_ID:=DOC_PN2.tag;
        begin
             if Check_nakl.checked then begin
                // Есть ссылка на другую накладную - удаляем накладные расходы
                MemPns2.First;
                while not MemPns2.eof do begin
                  if MemPns2.FieldByName('PNS2_ID').asinteger>0 then begin
                   inc(CNT_DEL2);
                   PNS2_DEL[CNT_DEL2]:=MemPns2.FieldByName('PNS2_ID').asinteger;
                  end;
                  MemPns2.next;
                end;
                MemPns2.EmptyTable;
             end;
             // Фиксируем удаление товаров в истории
             for A:=1 to CNT_DEL do begin
               IBSAVE_CLEAR;
               IBSAVE_ADD('DOC','PN$');
               IBSAVE_ADD('US_ID',USERID);
               IBSAVE_ADD('SHOP_ID',SHOPID);
               IBSAVE_ADD('MESS',PNS_DEL_MESS[a]);
               IBSAVE_ADD('DOP1',4); // Метка удаления содержимого
               IBSAVE_ADD('DOP2',PN_ID);
               if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
               // Удаление получения
               if PNS_DEL_POL[a]>0 then begin
                 IBSAVE_CLEAR;
                 IBSAVE_ADD('DOC','TWPN');
                 IBSAVE_ADD('US_ID',USERID);
                 IBSAVE_ADD('SHOP_ID',SHOPID);
                 IBSAVE_ADD('MESS',PNS_DEL_MESS2[a]);
                 IBSAVE_ADD('DOP1',DOC_PN2.tag);
                 IBSAVE_ADD('DOP2',-PNS_DEL_TW[a]);
                 if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
               end;
             end;
             // фиксируем удаление накладных расходов
             for A:=1 to CNT_DEL2 do begin
               IBSAVE_CLEAR;
               IBSAVE_ADD('DOC','PN$');
               IBSAVE_ADD('US_ID',USERID);
               IBSAVE_ADD('SHOP_ID',SHOPID);
               IBSAVE_ADD('MESS',PNS_DEL_MESS22[a]);
               IBSAVE_ADD('DOP1',5); // Метка удаления накладных расходов
               IBSAVE_ADD('DOP2',PN_ID);
               if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
             end;
             {Сохраняем содержимое}
             {Сначала удаляем удалённое}
             for A:=1 to CNT_DEL do begin
                 if PNS_DEL[A]>0 then if not IBDELETE_DOC('PNS$',PNS_DEL[A]) then IDR:=SQRT(-1);
             end;
             for A:=1 to CNT_DEL2 do begin
                 if PNS2_DEL[A]>0 then if not IBDELETE_DOC('PNS2$',PNS2_DEL[A]) then IDR:=SQRT(-1);
             end;
             {Сохраняем имеющееся}
             MemPNS.DisableControls;
             MemPNS.First;
             while not MemPNS.eof do begin
                   IBSAVE_CLEAR;
                   IBSAVE_ADD('PN$_ID',PN_ID);
                   IBSAVE_ADD('TW_ID',MemPNS.fieldbyname('TW_ID').asinteger);
                   IBSAVE_ADD('TW_KOL',MemPNS.fieldbyname('TW_KOL').asfloat);
                   IBSAVE_ADD('TW_SUMM',OKRUG(MemPNS.fieldbyname('TW_SUMM').asfloat,2));
                   IBSAVE_ADD('PNS$_NDS',MemPNS.fieldbyname('PNS_NDS').asfloat);
                   IBSAVE_ADD('PNS$_NDS_SUMM',MemPNS.fieldbyname('PNS_NDS_SUMM').asfloat);
                   IBSAVE_ADD('PNS$_SUB',MemPNS.fieldbyname('PNS_SUB').asstring);
                   if MemPNS.fieldbyname('PNS_ID').asinteger<0 then begin
                     MemPNS.Edit;
                     MemPNS.fieldbyname('TW_KOL2').asfloat:=MemPNS.fieldbyname('TW_KOL').asfloat;
                     MemPNS.fieldbyname('TW_SUMM2').asfloat:=MemPNS.fieldbyname('TW_SUMM').asfloat;
                     MemPNS.Post;
                   end;
                   IBSAVE_ADD('TW_KOL2',MemPNS.fieldbyname('TW_KOL2').asfloat);
                   IBSAVE_ADD('TW_SUMM2',OKRUG(MemPNS.fieldbyname('TW_SUMM2').asfloat,2));
                   ID:=IBSAVE_DOC('PNS$',MemPNS.fieldbyname('PNS_ID').asinteger);
                   if ID<0 then IDR:=SQRT(-1);
                   // Добавляем получение
                   if MemPNS.fieldbyname('POL_ID').asinteger<0 then begin
                        IBSAVE_CLEAR;
                        IBSAVE_ADD('DOC_TYP',1); // Метка приходной накладной
                        IBSAVE_ADD('DOC_ID',ID);
                        IBSAVE_ADD('POL_KOL',0);
                        IBSAVE_ADD('POL_DATE',My_NOW);
                        IBSAVE_ADD('POL_US',0);
                        IDPOL:=IBSAVE_DOC('POL',MemPNS.fieldbyname('POL_ID').asinteger);
                        if IDPOL<0 then IDR:=SQRT(-1);
                   end;
                   if (DOC_PN2.tag>0) and (MemPNS.fieldbyname('PNS_ID').asinteger<0) then begin
                          // Фиксируем факт добавления товара
                          IBSAVE_CLEAR;
                          IBSAVE_ADD('DOC','PN$');
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          // Шифруем сообщение "истории"
                          // Первый знак 1 - добавление, 2 - правка, 3 - удаление
                          // второй знак - TW_ID
                          // третий знак - кол-во
                          // четвертый знак - сумма
                          s:='Добавлен товар '+MemPNS.Fieldbyname('TW_ART').asstring+' '+
                          MemPNS.Fieldbyname('TW_NAM').asstring+' в кол-ве '+
                          floattostrf(MemPNS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
                          MemPNS.Fieldbyname('ed_short').asstring+' на сумму '+
                          floattostrf(MemPNS.Fieldbyname('TW_SUMM').asfloat,fffixed,19,2)+
                          ' руб, ставка НДС: '+floattostrf(MemPNS.Fieldbyname('PNS_NDS').asfloat,fffixed,19,1)+'%, сума НДС: '+
                          floattostrf(MemPNS.Fieldbyname('PNS_NDS_SUMM').asfloat,fffixed,19,2)+'руб.';
                          if length(s)>252 then s:=b_utils.left(s,252);
                          IBSAVE_ADD('MESS',s);
                          IBSAVE_ADD('DOP1',2); // Метка добавления товара в накладную
                          IBSAVE_ADD('DOP2',PN_ID);
                          if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                   end;
                   MemPNS.Edit;
                   MemPNS.fieldbyname('PNS_ID').asinteger:=ID;
                   MemPNS.fieldbyname('POL_ID').asinteger:=IDPOL;
                   MemPNS.Post;
                   {Сохраняем сертификат}
                   if MemPNS.fieldbyname('SERT_ID').asinteger<0 then begin
                     if (trim(MemPNS.fieldbyname('SERT_NUM').asstring)<>'')
                     or (trim(MemPNS.fieldbyname('SERT_WHO').asstring)<>'') then begin
                       IBSAVE_CLEAR;
                       IBSAVE_ADD('TW_ID',MemPNS.fieldbyname('TW_ID').asinteger);
                       IBSAVE_ADD('US_ID',USERID);
                       IBSAVE_ADD('SERT_NUM',MemPNS.fieldbyname('SERT_NUM').asstring);
                       IBSAVE_ADD('SERT_WHO',MemPNS.fieldbyname('SERT_WHO').asstring);
                       IBSAVE_ADD('SERT_DATE',MemPNS.fieldbyname('SERT_DATE').asdatetime);
                       ID:=IBSAVE_DOC('SERT',-1);
                       if ID<0 then IDR:=SQRT(-1) else begin
                          MemPNS.Edit;
                          MemPNS.fieldbyname('SERT_ID').asinteger:=ID;
                          MemPNS.Post;
                       end;
                     end;
                   end;
                   MemPNS.next;
             end;
             {Сохраняем имеющееся накладные расходы}
             MemPNS2.DisableControls;
             MemPNS2.First;
             while not MemPNS2.eof do begin
                   IBSAVE_CLEAR;
                   IBSAVE_ADD('PN$_ID',PN_ID);
                   IBSAVE_ADD('DOC',MemPNS2.fieldbyname('DOC').asstring);
                   IBSAVE_ADD('DOC_DATE',MemPNS2.fieldbyname('DOC_DATE').asdatetime);
                   IBSAVE_ADD('KLN_ID',MemPNS2.fieldbyname('KLN_ID').asinteger);
                   IBSAVE_ADD('USL_ID',MemPNS2.fieldbyname('USL_ID').asinteger);
                   IBSAVE_ADD('PNS2$_NDS',MemPNS2.fieldbyname('NDS').asfloat);
                   IBSAVE_ADD('PNS2$_NDS_SUMM',MemPNS2.fieldbyname('NDS_SUMM').asfloat);
                   IBSAVE_ADD('PNS2$_SUMM',MemPNS2.fieldbyname('SUMM').asfloat);
                   IBSAVE_ADD('PNS2$_MET',MemPNS2.fieldbyname('MET').asinteger);
                   IBSAVE_ADD('PNS2$_SUB',MemPNS2.fieldbyname('PNS2_SUB').asstring);
                   ID:=IBSAVE_DOC('PNS2$',MemPNS2.fieldbyname('PNS2_ID').asinteger);
                   if ID<0 then IDR:=SQRT(-1);
                   if (DOC_PN2.tag>0) and (MemPNS2.fieldbyname('PNS2_ID').asinteger<0) then begin
                          // Фиксируем факт добавления накладных расходов
                          IBSAVE_CLEAR;
                          IBSAVE_ADD('DOC','PN');
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          // Шифруем сообщение "истории"
                          // Первый знак 1 - добавление, 2 - правка, 3 - удаление
                          // второй знак - KLN_ID
                          // третий знак - USL_ID
                          // четвертый - сумма
                          // пятый - дата
                          // шестой - документ
                          IBSAVE_ADD('MESS','1$'+MemPNS2.Fieldbyname('KLN_ID').asstring+'$'+
                          MemPNS2.Fieldbyname('USL_ID').asstring+'$'+
                          doubletofixedstring(MemPNS2.Fieldbyname('SUMM').asfloat)+'$'+
                          DateToFixedString(MemPNS2.Fieldbyname('DOC_DATE').asdatetime)+'$'+
                          MemPNS2.Fieldbyname('DOC').asstring);
                          IBSAVE_ADD('DOP1',6); // Метка добавления накладных расходов
                          IBSAVE_ADD('DOP2',PN_ID);
                          if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                   end;
                   MemPNS2.Edit;
                   MemPNS2.fieldbyname('PNS2_ID').asinteger:=ID;
                   MemPNS2.Post;
                   MemPNS2.next;
             end;
        end;
        {Всё прошло нормально - изменяем временные данные}
        {Отображаем номер}
        Doc_PN2.tag:=PN_ID;
        PN_NUM.text:=inttostr(PN_NUMS);
//        MemPNS.First;
//       while not MemPNS.eof do begin
//              if MemPNS.fieldbyname('PNS_ID').asinteger<0 then begin
//                 MemPNS.Edit;
//                 MemPNS.fieldbyname('PNS_ID').asinteger:=-MemPNS.fieldbyname('PNS_ID').asinteger;
//                 MemPNS.Post;
//              end;
//              MemPNS.next;
//        end;
        MemPNS2.First;
        for a:=1 to OLDID2-1 do MemPNS2.next;
        MemPNS.First;
        for a:=1 to OLDID-1 do MemPNS.next;
        SAVE:=TRUE;
        CNT_DEL:=0;
        MemPNS.EnableControls;
        MemPNS2.EnableControls;
        Datamodule1.IBTransaction2.Commit;
     Except
        Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
  end;

end;

procedure TDOC_PN2.BtnPrintExecute(Sender: TObject);
begin
   // Печать
     if not check_dostup('$JOU.PN.PRINT') then
      exit;


     if Not Save and BtnApply.enabled then BtnApply.Execute;
     if (SAVE) then begin
//       PRINT_PN(DOC_PN2.tag,DOC_PN2.top+BtnPrint2.top+4+BtnPrint2.Height,DOC_PN2.left+BtnPrint2.left+4+BtnPrint2.Width);
       if(SUMM_ITOGO1.Value>0) then
         PRINT_PN_T12(DOC_PN2.tag,3)
       else
         PRINT_PN_T12(DOC_PN2.tag,4);
     end;
end;

procedure TDOC_PN2.BtnHistoryExecute(Sender: TObject);
begin
  // История изменений
     {Отображаем "историю" приходной накладной}
     SHOW_HISTORY_DOC(PNTYP[Doc_PN2.Statusbar1.Tag].FULL+' № '+PN_NUM.text,'PN$',DOC_PN2.tag);
end;

procedure TDOC_PN2.BtnSubExecute(Sender: TObject);
begin
   // Создать на основании..
end;

procedure TDOC_PN2.BtnDicTwExecute(Sender: TObject);
var
   a:integer;
begin
     if SKL_ID<>0 then SELECT_SKLAD:=SKL_ID;
     DicTowarSet:=1; {Ввод товаров из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
        for a:=1 to CNT_TW do begin
            ADD_PNS(ARR_TW[a].ID,ARR_TW[a].KOL);
        end;
     end;
     BtnRefresh.Execute;
     Show_sost;
end;

procedure TDOC_PN2.BtnDelExecute(Sender: TObject);
var
   PN_NUM_FULL:ansistring;
   s:ansistring;
begin
   if (PageControl1.ActivePage=TabSheet1) and (BtnDel.enabled) then begin
     if Messbox('Удалить из накладной товар "'+MemPNS.Fieldbyname('TW_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        SAVE:=False;
        if MemPNS.Fieldbyname('PNS_ID').asinteger>0 then begin
          inc(CNT_DEL);
          WorkTransaction.Active:=False;
          ADD_SQL(QueryWork1,'select KLN.KLN_PREFIX,SHOP.SHOP_PREFIX,SHOP.SHOP_POSTFIX,PNTYP.PNTYP_SHORT, '+
          'PN$.PN$_NUM from PN$,SHOP,KLN,PNTYP where PN$.PN$_ID=:PN_ID '+
          'and PN$.FRM_ID=KLN.KLN_ID and PN$.PNTYP_ID=PNTYP.PNTYP_ID '+
          'and PN$.SHOP_ID=SHOP.SHOP_ID ');
          QueryWork1.paramByname('PN_ID').asinteger:=DOC_PN2.tag;
          QueryWork1.open;
          if not QueryWork1.eof then begin
            PN_NUM_FULL:=QueryWork1.fieldByname('KLN_PREFIX').asstring+' '+
            QueryWork1.fieldByname('SHOP_PREFIX').asstring+QueryWork1.fieldByname('PNTYP_SHORT').asstring+
            b_utils.right('0000000000'+inttostr(PN_NUMS),10)+QueryWork1.fieldByname('SHOP_POSTFIX').asstring;
            PNS_DEL[CNT_DEL]:=MemPNS.Fieldbyname('PNS_ID').asinteger;
            PNS_DEL_POL[CNT_DEL]:=0;
            PNS_DEL_TW[CNT_DEL]:=MemPNS.Fieldbyname('TW_ID').asinteger;
            s:='Удален товар: '+MemPNS.Fieldbyname('TW_ART').asstring+' '+
            MemPNS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemPNS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
            MemPNS.Fieldbyname('ED_SHORT').asstring+' на сумму '+floattostrf(MemPNS.Fieldbyname('TW_SUMM').asfloat,fffixed,19,2)+' руб., ставка НДС: '+
            floattostrf(MemPNS.Fieldbyname('PNS_NDS').asfloat,fffixed,19,1)+'%, сумма НДС: '+
            floattostrf(MemPNS.Fieldbyname('PNS_NDS_SUMM').asfloat,fffixed,19,2)+' руб.';
            if length(s)>252 then s:=b_utils.left(s,252);
            PNS_DEL_MESS[CNT_DEL]:=s;
            PNS_DEL_MESS2[CNT_DEL]:='';
            //PNS_DEL_MESS2[CNT_DEL]:=PN_NUM_FULL+' Из накладной удален товар с получением '+floattostrf(MemPNS.Fieldbyname('POL_KOL').asfloat,fffixed,19,3)+' '+
            //MemPNS.Fieldbyname('ED_SHORT').asstring;
          end;
        end;
        SAVE:=False;
        MemPNS.delete;
        BtnRefresh.Execute;
        Show_Sost;
     end;
   end;
   if (PageControl1.ActivePage=TabSheet2) and (BtnDel.enabled) then begin
     // Удалить накладные расходы
      if MemPns2.RecordCount>0 then begin
        if Messbox('Удалить строку накладных расходов?',MessSubmitDelete,4+48+256)=6 then begin
           if MemPns2.FieldByName('PNS2_ID').asinteger>0 then begin
             inc(CNT_DEL2);
             PNS2_DEL[CNT_DEL2]:=MemPns2.FieldByName('PNS2_ID').asinteger;
           end;
           MemPns2.delete;
           SAVE:=False;
           BtnRefresh.Execute;
           ShoW_sost;
        end;
      end;
   end;
end;

procedure TDOC_PN2.BtnDetalExecute(Sender: TObject);
begin
  // Подробно о товаре
  show_detal_tw(MemPNS.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_PN2.BtnAnalizExecute(Sender: TObject);
begin
   // Анализ товара
   show_analiz_tw(MemPNS.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_PN2.BtnMarketingExecute(Sender: TObject);
begin
  // Маркетинговые данные
     SHOW_MARKETING_TW(MemPNS.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_PN2.BtnSertExecute(Sender: TObject);
var
   SERT_NUM,SERT_WHO:ansistring;
   SERT_DATE:TdateTime;
   a,OLDID:integer;
begin
     if Messbox('Выставить у всех товаров одинаковый сертификат?',MessSubmit,4+48+256)=6 then begin
        Save:=False;
        SERT_NUM:=MemPNS.fieldByname('SERT_NUM').asstring;
        SERT_WHO:=MemPNS.fieldByname('SERT_WHO').asstring;
        SERT_DATE:=MemPNS.fieldByname('SERT_DATE').asdatetime;
        OLDID:=MemPNS.recno;
        MemPNS.DisableControls;
        MemPNS.first;
        while not MemPNS.eof do begin
              if MemPNS.recno<>OLDID then begin
                 MemPNS.Edit;
                 MemPNS.fieldByname('SERT_NUM').asstring:=SERT_NUM;
                 MemPNS.fieldByname('SERT_WHO').asstring:=SERT_WHO;
                 MemPNS.fieldByname('SERT_DATE').asdatetime:=SERT_DATE;
                 MemPNS.Post;
              end;
              MemPNS.next;
        end;
        MemPNS.First;
        for a:=1 to OLDID-1 do MemPNS.next;
        SAVE:=False;
        MemPNS.EnableControls;
     end;
end;

procedure TDOC_PN2.BtnPrintCennikExecute(Sender: TObject);
begin
   // Печать одного ценника
     CLEAR_CENNIK;
     ADD_CENNIK(MemPNS.fieldbyname('TW_ID').asinteger,SKL_ID);
     PRINT_CENNIK;
end;

procedure TDOC_PN2.BtnPrintCennikAllExecute(Sender: TObject);
var
   a,ID:integer;
begin
     // Печать всех ценников
     CLEAR_CENNIK;
     if MemPNS.RecordCount>0 then begin
         ID:=MemPNS.RecNo;
         MemPNS.DisableControls;
         MemPNS.First;
         while not MemPNS.eof do begin
               ADD_CENNIK(MemPNS.fieldbyname('TW_ID').asinteger,SKL_ID);
               MemPNS.next;
         end;
         MemPNS.First;
         for a:=1 to ID-1 do MemPNS.next;
         MemPNS.EnableControls;
         PRINT_CENNIK;
     end;
end;

procedure TDOC_PN2.FormShow(Sender: TObject);
var
  cap:string;
  a,b,c:integer;
begin
    // смотрим доступ на проводку
    WorkTransaction.Active:=False;
    ADD_SQL(QueryWork,'select count(USDOSTUP.USDOSTUP_ID) as cc FROM KLN,USDOSTUP WHERE USDOSTUP.USGROUP_ID=KLN.USGROUP_ID '+
    'AND USDOSTUP.USDOSTUP_NAME="PROVODKA_PN" and kln.kln_id=:us_id');
    QueryWork.paramByname('US_ID').asinteger:=USERID;
    QueryWork.open;

    skl.DropDownCount:= DataModule1.MainDicSkl.RecordCount+1;
    skl_frm:=-1;


    CanKorr:=false;
    if QueryWork.eof then CanKorr:=false else begin
      if QueryWork.fieldByname('CC').asinteger>0 then CanKorr:=true;
    end;
    PN_KORR:=False;
    IS_EDIT_PN:=True;
    PageControl1.ActivePage:=Tabsheet1;
    tmShift:=0;
    STR:='';
    CanInsert:=False;
    DataModule1.MainDicPnTyp.locate('PNTYP_ID',Doc_PN2.Statusbar1.Tag,[]);
    cap:='Арм Склад. '+DataModule1.MainDicPnTyp.fieldByname('PNTYP_FULL').asstring;
    // DOC_PN2.tag - ID документа
    // DOC_PN2.statusbar1.tag - тип документа
    if DOC_PN2.tag<0 then begin
       // Новый приход
       PN2_NAKL:=0;
       NAKL_SUMM.value:=0;
       NAKL_EDIT.text:='';
       Check_Nakl.Checked:=False;
       Check_Nakl.Onclick(Sender);
       PN2_SUB:='';
       SHOP_ID:=SHOPID;
       PN_PROW:=False;
       cap:=cap+'. Новая. ';
       PN_STFAKT.text:='';
       // Поставщик
       PN2_KLN:=SHOP_KLN_DEFAULTPN(SHOPID,Doc_PN2.Statusbar1.Tag);
       change_frmkln(PN2_KLN, 2);
       // Владелец
       PN_OWNER.value:=inttostr(DEFAULT_OWNER_PN);
       // Склад

       SKL.Value := inttostr(DEFAULT_SKLAD);


       // Вид накладной
       PN_VID.value:=inttostr(DEFAULT_PNVID);
       // Основание
       PN_OSN.text:='';
       // Через кого
       PN_WHO.text:='';
       // Номер
       PN_NUMS:=-1;
       PN_NUM.text:='Новая';
       // Курс
       PN_KURS.Value:=DEFAULT_KURS(1,Doc_PN2.Statusbar1.Tag);
       // Дата
       PN_DATE.date:=date();
       // Дата оплаты
       Sost:=1;
    end else begin
       sost:=0;
       // Правим приход
       cap:=cap+'. Правка';
       // Загружаем накладную
       WorkTransaction.Active:=False;
       ADD_SQL(QueryWork1,'select pn$.*, (select kln_full from kln_data(pn$.frm_id)) FRM_FULL from PN$ where PN$_ID=:PN_ID');
       QueryWork1.ParamByname('PN_ID').asinteger:=DOC_PN2.tag;
       QueryWork1.Open;
       PN2_NAKL:=QueryWork1.fieldbyname('PN$_NAKL').asinteger;
       PN2_SUB:=QueryWork1.fieldByname('PN$_SUB').asstring;
       SHOP_ID:=QueryWork1.fieldByname('SHOP_ID').asinteger;
       if QueryWork1.fieldByname('PN$_PROW').asinteger=1 then PN_PROW:=True else PN_PROW:=False;

       skl.value := QueryWork1.FieldbyName('SKL_ID').asstring;
       frm.Value := QueryWork1.fieldbyname('frm_id').asstring;
       if FRM.value='' then
       begin
          FRM.DisplayEmpty := QueryWork1.fieldbyName('FRM_FULL').asstring;
          FRM.EmptyValue := QueryWork1.fieldbyName('FRM_ID').asstring;
       end;

       // Поставщик
       PN2_KLN:=QueryWork1.fieldByname('KLN_ID').asinteger;
       // Владелец
       PN_OWNER.value:=inttostr(QueryWork1.fieldByname('PN$_OWNER').asinteger);
       // Вид накладной
       PN_VID.value:=inttostr(QueryWork1.fieldByname('PNVID_ID').asinteger);
       // Основание
       PN_OSN.text:=QueryWork1.fieldByname('PN$_OSN').asstring;
       // Через кого
       PN_WHO.text:=QueryWork1.fieldByname('PN$_WHO').asstring;
       // Номер
       PN_NUMS:=QueryWork1.fieldByname('PN$_NUM').asinteger;
       PN_NUM.text:=QueryWork1.fieldByname('PN$_NUM').asstring;
       // Курс
       PN_KURS.Value:=QueryWork1.fieldByname('PN$_KURS').asfloat;
       // Дата
       PN_DATE.date:=QueryWork1.fieldByname('PN$_DATE').asdatetime;
       // Дата оплаты
       PN_DATE_OPL.date:=QueryWork1.fieldbyname('PN$_DATE_OPL').asdatetime;
       PN_STFAKT.text:=QueryWork1.fieldByname('PN$_STFAKT').asstring;
       PN_STFAKT_DATE.date:=QueryWork1.fieldByname('PN$_STFAKT_DATE').asdatetime;
       PN_STFAKT_NUM.text:=QueryWork1.fieldByname('PN$_STFAKT_NUM').asstring;
       QueryWork1.close;

       ADD_SQL(QueryWork1,'select rn_id from rn where pn$_id=:PN_ID');
       QueryWork1.ParamByname('PN_ID').asinteger:=DOC_PN2.tag;
       QueryWork1.Open;
       if not QueryWork1.Eof then
       begin
             messbox('Накладная сделана автоматически на основании '+PN_OSN.Text+' и может быть изменена только изменением документа-основания', messSystem, 0);
             IS_SALE:=true;

       end;


       QueryWork1.close;


       ADD_SQL(QueryWork1,'select * from LIST_PNS$(:PN_ID), tw where tw.tw_id = list_pns$.tw_id');
       QueryWork1.ParamByname('PN_ID').asinteger:=DOC_PN2.tag;
       QueryWork1.Open;
       CanInsert:=True;
       CanInsert2:=True;
       MemPns.EmptyTable;
       MemPns2.EmptyTable;
       MemPns.DisableControls;
       While not QueryWork1.eof Do begin
         MemPns.Append;
         MemPns.fieldByname('PNS_ID').asinteger:=QueryWork1.fieldByname('PNS$_ID').asinteger;
         MemPns.fieldByname('TW_ID').asinteger:=QueryWork1.fieldByname('TW_ID').asinteger;
         MemPns.fieldByname('TW_COLOR').asinteger:=QueryWork1.fieldByname('TW_COLOR').asinteger;
         MemPns.fieldByname('TW_ART').asinteger:=QueryWork1.fieldByname('TW_ART').asinteger;
         MemPns.fieldByname('TW_NAM').asstring:=QueryWork1.fieldByname('TW_NAM').asstring;
         MemPns.fieldByname('ED_SHORT').asstring:=QueryWork1.fieldByname('ED_SHORT').asstring;
         MemPns.fieldByname('TW_KOL').asfloat:=QueryWork1.fieldByname('TW_KOL').asfloat;
         MemPns.fieldByname('TW_SUMM').asfloat:=QueryWork1.fieldByname('TW_SUMM').asfloat;
         MemPns.fieldByname('PNS_NDS').asfloat:=QueryWork1.fieldByname('PNS$_NDS').asfloat;
         MemPns.fieldByname('PNS_NDS_SUMM').asfloat:=QueryWork1.fieldByname('PNS$_NDS_SUMM').asfloat;
         MemPns.fieldByname('SERT_NUM').asstring:=QueryWork1.fieldByname('SERT_NUM').asstring;
         MemPns.fieldByname('SERT_DATE').asdatetime:=QueryWork1.fieldByname('SERT_DATE').asdatetime;
         MemPns.fieldByname('SERT_WHO').asstring:=QueryWork1.fieldByname('SERT_WHO').asstring;
         MemPns.fieldByname('SERT_ID').asinteger:=QueryWork1.fieldByname('SERT_ID').asinteger;
         MemPns.fieldByname('PNS_SUB').asstring:=QueryWork1.fieldByname('PNS$_SUB').asstring;
         MemPns.fieldByname('POL_ID').asinteger:=QueryWork1.fieldByname('POL_ID').asinteger;
         MemPns.Post;
         QueryWork1.next;
       end;
       ADD_SQL(QueryWork1,'select * from LIST_PNS2$(:PN_ID)');
       QueryWork1.ParamByname('PN_ID').asinteger:=DOC_PN2.tag;
       QueryWork1.Open;
       While not QueryWork1.eof Do begin
         MemPns2.Append;
         MemPns2.fieldByname('PNS2_ID').asinteger:=QueryWork1.fieldByname('PNS2$_ID').asinteger;
         MemPns2.fieldByname('DOC').asstring:=QueryWork1.fieldByname('DOC').asstring;
         MemPns2.fieldByname('DOC_DATE').asdatetime:=QueryWork1.fieldByname('DOC_DATE').asdatetime;
         MemPns2.fieldByname('KLN_ID').asinteger:=QueryWork1.fieldByname('kln_id').asinteger;
         MemPns2.fieldByname('KLN_FULL').asstring:=QueryWork1.fieldByname('kln_full').asstring;
         MemPns2.fieldByname('USL_ID').asinteger:=QueryWork1.fieldByname('usl_id').asinteger;
         MemPns2.fieldByname('USL_FULL').asstring:=QueryWork1.fieldByname('usl_full').asstring;
         MemPns2.fieldByname('NDS').asfloat:=QueryWork1.fieldByname('pns2$_nds').asfloat;
         MemPns2.fieldByname('NDS_SUMM').asfloat:=QueryWork1.fieldByname('pns2$_nds_summ').asfloat;
         MemPns2.fieldByname('SUMM').asfloat:=QueryWork1.fieldByname('pns2$_summ').asfloat;
         MemPns2.fieldByname('MET').asinteger:=QueryWork1.fieldByname('pns2$_met').asinteger;
         MemPns2.fieldByname('MET_FULL').asstring:=QueryWork1.fieldByname('met_full').asstring;
         MemPns2.Post;
         QueryWork1.next;
       end;
       MemPns.First;
       MemPns2.First;
       BtnRefresh.Execute;
       MemPns.EnableControls;
       MemPns2.EnableControls;
       CanInsert:=False;
       CanInsert2:=False;
       if PN2_NAKL=0 then begin
         NAKL_SUMM.value:=0;
         NAKL_EDIT.text:='';
         Check_Nakl.Checked:=False;
       end else begin
         ADD_SQL(QueryWork,'select shop_prefix,shop_postfix,pntyp_short,pn$_num,pn$_date from pn$,pntyp,shop '+
          ' where pn$.pntyp_id=pntyp.pntyp_id and pn$.pn$_id=:pn_id and pn$.shop_id=shop.shop_id');
          QueryWork.ParamByname('PN_ID').asinteger:=PN2_NAKL;
          QueryWork.Open;
          if QueryWork.eof then begin
             NAKL_EDIT.text:='Накладная удалена!!!';
          end else NAKL_EDIT.text:=QueryWork.fieldByname('PNTYP_SHORT').asstring+' '+
                     QueryWork.fieldByname('SHOP_PREFIX').asstring+b_utils.right('0000000000'+QueryWork.fieldByname('PN$_NUM').asstring,10)+
                     QueryWork.fieldByname('SHOP_POSTFIX').asstring;
         Check_Nakl.Checked:=True;
       end ;
       Check_Nakl.Onclick(Sender);
    end;

    change_frmkln(PN2_KLN, 2);
    Save:=True;
    DOC_PN2.Caption:=cap;
    Show_Sost;
    VID.itemindex:=0;
    VIDChange(Sender);
end;

procedure TDOC_PN2.BtnDicKlnExecute(Sender: TObject);
begin
   // Выбор поставщика
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=PN2_KLN;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>PN2_KLN then begin
        PN2_KLN:=DIC_KLIENT.tag;
        change_frmkln(PN2_KLN, 2);
        save:=False;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TDOC_PN2.Btn_Date_OplClick(Sender: TObject);
var
   S:ansistring;
   c:char;
   a:integer;
begin
     S:=datetostr(date);
     for a:=1 to length(S) do begin
         c:=s[a];
         if c in ['0'..'9'] then c:=' ';
         s[a]:=c;
     end;
     PN_DATE_OPL.Text:=S;
     save:=False;
end;

procedure TDOC_PN2.DsPnsDataChange(Sender: TObject; Field: TField);
begin
     if MemPNS.State in [dsInsert,dsEdit] then SAVE:=False;
     if (MemPNS.State in [dsInsert]) and ( not CanInsert) then MemPNS.Cancel;
end;

procedure TDOC_PN2.FormKeyPress(Sender: TObject; var Key: Char);
var
   ID:integer;
   N:integer;
begin
     if (key='*') and (sost=0) and ((Doc_Pn2.Tag<0) or ((Doc_Pn2.Tag>0) and (not PN_PROW))) then begin
        sost:=1;
        key:=#0;
        STR:='';
     end else
     if (key='*') and (sost=1) and ((Doc_Pn2.Tag<0) or ((Doc_Pn2.Tag>0) and (not PN_PROW))) then begin
        sost:=0;
        key:=#0;
        STR:='';
     end;
     if (sost=1) and (key in ['0','1','2','3','4','5','6','7','8','9',#8,#13,#27]) then begin
       case key of
         #8: begin
             if length(STR)>0 then begin
                if length(STR)=1 then STR:=''
                else begin
                  if (length(STR)=2) and (B_Utils.left(STR,1)='Б') then STR:='' else
                  STR:=B_utils.left(STR,length(STR)-1);
                end;
             end;
         end;
         #13: begin
              {Ввод закончен}
              if length(STR)>0 then begin
                 key:=#0;
                 {Добавляем строку}
                 WorkTransaction.Active:=False;
                 ADD_SQL(QueryWork1,'select TW_ID from TW where TW_ART=:TW_ART and TW_BRAK=:TW_BRAK');
                 if B_utils.left(STR,1)='Б' then begin
                    N:=strtoint(B_Utils.right(STR,length(STR)-1));
                    QueryWork1.ParamByname('TW_ART').asinteger:=N;
                    QueryWork1.ParamByname('TW_BRAK').asstring:='1';
                 end else begin
                    N:=strtoint(STR);
                    QueryWork1.ParamByname('TW_ART').asinteger:=N;
                    QueryWork1.ParamByname('TW_BRAK').asstring:='0';
                 end;
                 QueryWork1.Open;
                 if not QueryWork1.eof then begin
                    ID:=QueryWork1.fieldbyname('TW_ID').asinteger;
                    ADD_PNS(ID,-1);
                 end else messbox('Не существует товара с кодом: '+inttostr(N)+' !',MessSystem,48);
                 key:=#0;
                 STR:='';
              end;
         end;
         #27: begin
              sost:=0;
              key:=#0;
              STR:='';
         end;
         else begin
           if length(STR)<10 then begin
             if (key='0') and (STR='') then key:='Б';
             STR:=STR+key;
           end;
         end;
       end;
       key:=#0;
     end;
     Show_Sost;
end;

procedure TDoc_Pn2.ADD_PNS(TW_ID:integer;KOL:double);
var
   TW_TEMP:integer;
   TW_STR:ansistring;
   ISS:boolean;
   nds_error: boolean;
begin
   nds_error:=false;
   begin
     TW_TEMP:=0;

     if FRM.value='' then
     begin
      Messbox('Не указана фирма!',  MessError, MB_OK);
      exit;
     end;




     {Проверяем, нет ли в накладной уже такого товара}
     if MemPNS.RecordCount>0 then TW_TEMP:=MemPNS.fieldByname('TW_ID').asinteger;
     ISS:=false;
     MemPNS.Disablecontrols;
     MemPNS.first;
     PN_NDS:=0;
     while (not MemPNS.eof) and (not ISS)  do begin
           PN_NDS:=MemPNS.fieldByname('PNS_NDS').asfloat;
           if MemPNS.fieldByname('TW_ID').asinteger=TW_ID then begin
              ISS:=true;
              TW_STR:=MemPNS.fieldByname('TW_ART').asstring+'-'+MemPNS.fieldByname('TW_NAM').asstring;
           end;

           MemPNS.next;
     end;
     MemPNS.EnableControls;
     if ISS then Messbox('Накладная уже содержит товар '+TW_STR+' и он не может быть добавлен!',MessSystem,48) else
     begin
          WorkTransaction.Active:=False;
          ADD_SQL(QueryWork1,'select twktg.twktg_color,tw.tw_art,tw.tw_nam,tw.ed_id,tw.tw_nds_small, ed.ed_short '+
          'from tw,ed,twktg '+
          'where tw.twktg_id=twktg.twktg_id and tw.ed_id=ed.ed_id and tw.tw_id=:TW_ID');
          QueryWork1.Parambyname('TW_ID').asinteger:=TW_ID;
          QueryWork1.Open;


          ADD_SQL(QueryWork2,'select sert.sert_id,sert.sert_num,sert.sert_date,sert.sert_who '+
          ' from sert where sert.tw_id=:tw_id order by sert_date desc');
          QueryWork2.ParamByname('TW_ID').asinteger:=TW_ID;
          QueryWork2.Open;




          CanInsert:=True;
          MemPNS.Append;
          MemPNS.Fieldbyname('PNS_ID').asinteger:=-1;
          MemPNS.Fieldbyname('TW_ID').asinteger:=TW_ID;
          MemPNS.Fieldbyname('TW_ART').asinteger:=QueryWork1.Fieldbyname('TW_ART').asinteger;
          MemPNS.Fieldbyname('TW_COLOR').asinteger:=QueryWork1.Fieldbyname('TWKTG_COLOR').asinteger;
          MemPNS.Fieldbyname('TW_NAM').asstring:=QueryWork1.Fieldbyname('TW_NAM').asstring;
          MemPNS.Fieldbyname('ED_SHORT').asstring:=QueryWork1.Fieldbyname('ED_SHORT').asstring;
          MemPNS.Fieldbyname('TW_SUMM').asfloat:=0;
          MemPNS.Fieldbyname('POL_ID').asinteger:=-1;


//Изменено 07.04.2004 для НДС 10%
          if QueryWork1.Fieldbyname('TW_NDS_SMALL').asstring='1' then
              MemPNS.Fieldbyname('PNS_NDS').asfloat:=NDS_SMALL_DATE(PN_DATE.date)
            else
              MemPNS.Fieldbyname('PNS_NDS').asfloat:=NDS_DATE(PN_DATE.date);

          PN_NDS:=MemPNS.Fieldbyname('PNS_NDS').asfloat;
          if QueryWork2.eof then begin
            MemPNS.Fieldbyname('SERT_NUM').asstring:='';
            MemPNS.Fieldbyname('SERT_DATE').asdatetime:=date();
            MemPNS.Fieldbyname('SERT_WHO').asstring:='';
            MemPNS.Fieldbyname('SERT_ID').asinteger:=-1;
          end else begin
            MemPNS.Fieldbyname('SERT_NUM').asstring:=QueryWork2.fieldByname('SERT_NUM').asstring;
            MemPNS.Fieldbyname('SERT_DATE').asdatetime:=QueryWork2.fieldByname('SERT_DATE').asdatetime;
            MemPNS.Fieldbyname('SERT_WHO').asstring:=QueryWork2.fieldByname('SERT_WHO').asstring;
            MemPNS.Fieldbyname('SERT_ID').asinteger:=QueryWork2.fieldByname('SERT_ID').asinteger;
          end;
          if KOL<0 then begin
             Application.createForm(TSET_KOLVO,SET_KOLVO);
             SET_KOLVO.NAME.text:=QueryWork1.fieldByname('TW_ART').asstring+
                            QueryWork1.fieldByname('TW_NAM').asstring;
             SET_KOLVO.showModal;
             if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
             MemPNS.Fieldbyname('TW_KOL').asfloat:=SET_KOLVO.KOL.value;
             SET_KOLVO.destroy;
          end else MemPNS.Fieldbyname('TW_KOL').asfloat:=KOL;
          MemPNS.Post;
          Save:=False;
          CanInsert:=False;

     end;       //ware dublicate check
     QueryWork1.close;
     QueryWork2.Close;
     RxDbGrid1.setfocus;
  end;
end;

procedure TDOC_PN2.MemPnsCalcFields(DataSet: TDataSet);
begin
   if MemPns.fieldByname('TW_KOL').asfloat<0.00001 then begin
     MemPns.fieldByname('TW_MONEY').asfloat:=0;
     MemPns.fieldByname('TW_MONEY_SEB').asfloat:=0;
     MemPns.fieldByname('TW_MONEY_SEB2').asfloat:=0;
     MemPns.fieldByname('TW_MONEY_SEB_ALL').asfloat:=0;
   end else begin
       MemPns.fieldByname('TW_MONEY').asfloat:=
       MemPns.fieldByname('TW_SUMM').asfloat/MemPns.fieldByname('TW_KOL').asfloat;
       MemPns.fieldByname('TW_MONEY_SEB').asfloat:=
       MemPns.fieldByname('TW_SUMM_SEB').asfloat/MemPns.fieldByname('TW_KOL').asfloat;
       MemPns.fieldByname('TW_MONEY_SEB2').asfloat:=
       MemPns.fieldByname('TW_SUMM_SEB2').asfloat/MemPns.fieldByname('TW_KOL').asfloat;
       MemPns.fieldByname('TW_MONEY_SEB_ALL').asfloat:=
       MemPns.fieldByname('TW_SUMM_SEB_ALL').asfloat/MemPns.fieldByname('TW_KOL').asfloat;
   end;
   MemPns.fieldByname('TW_MONEY_MEN').asfloat:=
     MemPns.fieldByname('TW_MONEY').asfloat+
     MemPns.fieldByname('TW_MONEY_SEB_ALL').asfloat;
   MemPns.fieldByname('TW_SUMM_MEN').asfloat:=
     MemPns.fieldByname('TW_SUMM').asfloat+
     MemPns.fieldByname('TW_SUMM_SEB_ALL').asfloat;
end;

procedure TDOC_PN2.MemPns2CalcFields(DataSet: TDataSet);
begin
   // Считаем Сумму Без НДС
   MemPNS2.fieldByname('SUMM2').asfloat:=
   MemPNS2.fieldByname('SUMM').asfloat-MemPNS2.fieldByname('NDS_SUMM').asfloat;
end;

procedure TDOC_PN2.RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
   if (key=#13) and (DsPns2.State in [DsEdit,DsInsert]) then MemPns2.post;
end;

procedure TDOC_PN2.RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key=46) and (not (DsPns2.State in [DsEdit,DsInsert])) and (BtnDel.enabled)then begin
      BtnDel.Execute;
   end;
   if (key=45) and (not (DsPns2.State in [DsEdit,DsInsert])) and (RxDbgrid2.readOnly=False) then begin
         // Добавляем строку
         CanInsert2:=True;
         MemPns2.Append;
         MemPns2.fieldByname('PNS2_ID').asinteger:=-1;
         MemPns2.fieldByname('DOC_DATE').asdatetime:=date();
         MemPns2.fieldByname('KLN_ID').asinteger:=DEFAULT_NAKL_KLN;
         MemPns2.fieldByname('USL_ID').asinteger:=DEFAULT_NAKL_USL;
         MemPns2.fieldByname('MET').asinteger:=DEFAULT_NAKL_MET;
         Application.CreateForm(TEDIT_NAKL,EDIT_NAKL);
         EDIT_NAKL.KLN.tag:=MemPns2.fieldByname('KLN_ID').asinteger;
         EDIT_NAKL.USL.tag:=MemPns2.fieldByname('USL_ID').asinteger;
         EDIT_NAKL.MET.itemindex:=MemPns2.fieldByname('MET').asinteger;
         EDIT_NAKL.showModal;
         if EDIT_NAKL.tag>0 then begin
           MemPns2.fieldByname('KLN_ID').asinteger:=EDIT_NAKL.KLN.tag;
           MemPns2.fieldByname('KLN_FULL').asstring:=EDIT_NAKL.KLN.text;
           MemPns2.fieldByname('USL_ID').asinteger:=EDIT_NAKL.USL.tag;
           MemPns2.fieldByname('USL_FULL').asstring:=EDIT_NAKL.USL.text;
           MemPns2.fieldByname('MET').asinteger:=EDIT_NAKL.MET.itemindex;
           MemPns2.fieldByname('MET_FULL').asstring:=EDIT_NAKL.MET.text;
         end;
         MemPns2.fieldByname('NDS').asfloat:=NDS_DATE(PN_DATE.date);
         MemPns2.fieldByname('NDS_SUMM').asfloat:=0;
         MemPns2.fieldByname('SUMM').asfloat:=0;
         MemPns2.post;
         CanInsert2:=False;
         EDIT_NAKL.destroy;
   end;
end;

procedure TDOC_PN2.DsPns2DataChange(Sender: TObject; Field: TField);
begin
     if MemPNS2.State in [dsInsert,dsEdit] then SAVE:=False;
     if (MemPNS2.State in [dsInsert]) and ( not CanInsert2) then MemPNS2.Cancel;
end;

procedure TDOC_PN2.RxDBGrid2DblClick(Sender: TObject);
begin
   if not MemPns2.Eof then begin
         Application.CreateForm(TEDIT_NAKL,EDIT_NAKL);
         EDIT_NAKL.KLN.tag:=MemPns2.fieldByname('KLN_ID').asinteger;
         EDIT_NAKL.USL.tag:=MemPns2.fieldByname('USL_ID').asinteger;
         EDIT_NAKL.MET.itemindex:=MemPns2.fieldByname('MET').asinteger;
         EDIT_NAKL.showModal;
         if EDIT_NAKL.tag>0 then begin
           MemPns2.Edit;
           MemPns2.fieldByname('KLN_ID').asinteger:=EDIT_NAKL.KLN.tag;
           MemPns2.fieldByname('KLN_FULL').asstring:=EDIT_NAKL.KLN.text;
           MemPns2.fieldByname('USL_ID').asinteger:=EDIT_NAKL.USL.tag;
           MemPns2.fieldByname('USL_FULL').asstring:=EDIT_NAKL.USL.text;
           MemPns2.fieldByname('MET').asinteger:=EDIT_NAKL.MET.itemindex;
           MemPns2.fieldByname('MET_FULL').asstring:=EDIT_NAKL.MET.text;
         MemPns2.post;
         end;
         EDIT_NAKL.destroy;
   end;
end;

procedure TDOC_PN2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  hh,mm,ss,s1000:word;
  tm2:integer;
begin
    if (key=16) then begin
       decodetime(time(),hh,mm,ss,s1000);
       tm2:=s1000+ss*1000+mm*60*1000+hh*60*60*1000;
       if (tm2-TmShift)<400 then begin
          if PageControl1.ActivePage=Tabsheet1 then  begin
             PageControl1.ActivePage:=Tabsheet2;
             RxDbgrid2.setfocus;
          end else
          if PageControl1.ActivePage=Tabsheet2 then  begin
             PageControl1.ActivePage:=Tabsheet3;
          end else
          if PageControl1.ActivePage=Tabsheet3 then  begin
                PageControl1.ActivePage:=Tabsheet1;
                RxDbgrid1.setfocus;
          end;
       end;
       TmShift:=tm2;
    end;

end;

procedure TDOC_PN2.BtnRefreshExecute(Sender: TObject);
var
  ALL1,ALL2,ALL3:double;
  NDS1,NDS2,NDS3:double;
  NO_NDS1,NO_NDS2,NO_NDS3:double;
  SUMM_TW:double;
  SUMM_TW_NDS,SUMM_TW_NO_NDS:double;

  ID,ID2:integer;
begin
    // Обновляем суммы
    Show_status('Пересчет сумм...',2);
    NO_NDS1:=0; NO_NDS2:=0; NO_NDS3:=0;
    NDS1:=0; NDS2:=0; NDS3:=0;
    ALL1:=0; ALL2:=0; ALL3:=0;
    if MemPns2.RecordCount>0 then ID:=MemPns2.Recno else ID:=-1;
    if MemPns.RecordCount>0 then ID2:=MemPns.Recno else ID2:=-1;
    MemPns2.DisableControls;
    MemPns2.First;
    While not MemPns2.eof do begin
       if MemPns2.fieldByname('Met').asinteger in [0,2] then begin  // Административный учет
          // подтвержденная сумма без НДС
          NO_NDS1:=NO_NDS1+(MemPns2.fieldByname('SUMM').asfloat-MemPns2.fieldByname('NDS_SUMM').asfloat);
          NDS1:=NDS1+MemPns2.fieldByname('NDS_SUMM').asfloat;
          ALL1:=ALL1+MemPns2.fieldByname('SUMM').asfloat;
       end;
       if MemPns2.fieldByname('Met').asinteger  in [1,2] then begin  // Хозяйственный учет
          NO_NDS2:=NO_NDS2+(MemPns2.fieldByname('SUMM').asfloat-MemPns2.fieldByname('NDS_SUMM').asfloat);
          NDS2:=NDS1+MemPns2.fieldByname('NDS_SUMM').asfloat;
          ALL2:=ALL2+MemPns2.fieldByname('SUMM').asfloat;
       end;
       NO_NDS3:=NO_NDS3+(MemPns2.fieldByname('SUMM').asfloat-MemPns2.fieldByname('NDS_SUMM').asfloat);
       NDS3:=NDS3+MemPns2.fieldByname('NDS_SUMM').asfloat;
       ALL3:=ALL3+MemPns2.fieldByname('SUMM').asfloat;
       SUMM_NO_NDS1.value:=NO_NDS1;
       SUMM_NO_NDS2.value:=NO_NDS2;
       SUMM_NO_NDS3.value:=NO_NDS3;
       SUMM_NDS1.value:=NDS1;
       SUMM_NDS2.value:=NDS1;
       SUMM_NDS3.value:=NDS1;
       SUMM_ALL1.value:=ALL1;
       SUMM_ALL2.value:=ALL2;
       SUMM_ALL3.value:=ALL3;
       MemPns2.next;
    end;
    // Считаем общую сумму товара
    SUMM_TW:=0; SUMM_TW_NDS:=0; SUMM_TW_NO_NDS:=0;
    MemPns.DisableControls;
    MemPns.first;
    while not MemPns.eof do begin
      SUMM_TW:=SUMM_TW+MemPns.fieldByname('TW_SUMM').asfloat;
      SUMM_TW_NDS:=SUMM_TW_NDS+MemPns.fieldByname('PNS_NDS_SUMM').asfloat;
      SUMM_TW_NO_NDS:=SUMM_TW_NO_NDS+(MemPns.fieldByname('TW_SUMM').asfloat-MemPns.fieldByname('PNS_NDS_SUMM').asfloat);
      MemPns.next;
    end;
    TW_SUMM_NDS.value:=SUMM_TW_NDS;
    TW_SUMM_NO_NDS.value:=SUMM_TW_NO_NDS;
    TW_SUMM_ALL.value:=SUMM_TW;
    // Распределяем себестоимость
    MemPns.first;
    while not MemPns.eof do begin
      MemPns.Edit;
      if SUMM_TW=0 then begin
        MemPns.FieldByname('TW_SUMM_SEB').asfloat:=0;
        MemPns.FieldByname('TW_SUMM_SEB2').asfloat:=0;
        MemPns.FieldByname('TW_SUMM_SEB_ALL').asfloat:=0; // Себесьтоимость итого
      end else begin
        // Себестоимость итого
        MemPns.FieldByname('TW_SUMM_SEB_ALL').asfloat:=
        (MemPns.FieldByname('TW_SUMM').asfloat*ALL3)/SUMM_TW;
        // Себестоимость всех накладных расходов
        MemPns.FieldByname('TW_SUMM_SEB2').asfloat:=
        (MemPns.FieldByname('TW_SUMM').asfloat*NO_NDS3)/SUMM_TW;
        // Себестоимость белая
        MemPns.FieldByname('TW_SUMM_SEB').asfloat:=
        (MemPns.FieldByname('TW_SUMM').asfloat*NO_NDS1)/SUMM_TW;
      end;
      MemPns.Post;
      MemPns.next;
    end;
    if ID>=0 then MemPns2.Recno:=ID;
    MemPns2.EnableControls;
    if ID2>=0 then MemPns.Recno:=ID2;
    MemPns.EnableControls;
    // Итоговые суммы
    SUMM_ITOGO1.value:=ALL3+SUMM_TW;
    SUMM_ITOGO2.value:=ALL3+SUMM_TW;
end;

procedure TDOC_PN2.MemPns2BeforePost(DataSet: TDataSet);
begin
    if MemPns2.fieldByname('MET').asinteger=1 then begin
       // Только хоз учет
       MemPns2.fieldByname('NDS').asfloat:=0;
       MemPns2.fieldByname('NDS_SUMM').asfloat:=0;
    end;
   if (MemPns2.fieldByname('NDS').asfloat>0)
     and (MemPns2.fieldByname('NDS_SUMM').asfloat=0) then
     MemPns2.fieldByname('NDS_SUMM').asfloat:=(MemPns2.fieldByname('SUMM').asfloat/(100+MemPns2.fieldByname('NDS').asfloat))*MemPns2.fieldByname('NDS').asfloat;
end;

procedure TDOC_PN2.VIDChange(Sender: TObject);
var
 a,b,c:integer;

begin
    if VID.ItemIndex=0 then begin
      // Бухгалтерское отображение
      for a:=1 to RxDbgrid1.Columns.Count do begin
         c:=0;
         for b:=1 to 10 do if Ansiuppercase(RxDbgrid1.Columns[a-1].FieldName)=ansiuppercase(VID0[b]) then c:=1;
         if c=1 then RxDbgrid1.Columns[a-1].visible:=True
                else RxDbgrid1.Columns[a-1].visible:=False;
      end;
    end;
    if VID.ItemIndex=1 then begin
      // Отображение для менеджера
      for a:=1 to RxDbgrid1.Columns.Count do begin
         c:=0;
         for b:=1 to 11 do if Ansiuppercase(RxDbgrid1.Columns[a-1].FieldName)=ansiuppercase(VID1[b]) then c:=1;
         if c=1 then RxDbgrid1.Columns[a-1].visible:=True
                else RxDbgrid1.Columns[a-1].visible:=False;
      end;
    end;
    if VID.ItemIndex=2 then begin
      for a:=1 to RxDbgrid1.Columns.Count do RxDbgrid1.Columns[a-1].visible:=True;
    end;

    Show_sost;
end;

procedure TDOC_PN2.MemPnsBeforePost(DataSet: TDataSet);
begin
   if (MemPns.fieldByname('PNS_NDS').asfloat>0)
     and (MemPns.fieldByname('PNS_NDS_SUMM').asfloat=0) then
     MemPns.fieldByname('PNS_NDS_SUMM').asfloat:=(MemPns.fieldByname('TW_SUMM').asfloat/(100+MemPns.fieldByname('PNS_NDS').asfloat))*MemPns.fieldByname('PNS_NDS').asfloat;
end;

procedure TDOC_PN2.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
   if (key=#13) and (DsPns.state in [dsEdit,DsInsert]) then MemPns.post
end;

procedure TDOC_PN2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       IS_EDIT_PN:=false;
end;

procedure TDOC_PN2.FRMChange(Sender: TObject);
begin
	 save:=false;
     if FRM.value <> ''
        then frm_bnk.Text := Frm.LookupSource.DataSet.fieldbyname('KLN_REKW').asstring;

  show_sost;

end;

procedure TDOC_PN2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save) and (BtnApply.enabled) then begin
        if Messbox('Накладная была изменена! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDOC_PN2.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if (Field.FieldName='TW_ART')
        and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
        then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
      if (Field.FieldName='TW_ART')
         and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
         then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
     end;
end;

procedure TDOC_PN2.Btn_NaklClick(Sender: TObject);
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=-1; {Метка, что искать во всех приходных}
  FIND_DOCNUM.Edit1.tag:=0;
  FIND_DOCNUM.Edit1.text:='';
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
    save:=False;
    if FIND_DOCNUM.tag=DOC_PN2.tag then Messbox('Нельзя дать ссылку на саму накладную!',MessError,16) else begin
      PN2_NAKL:=FIND_DOCNUM.tag;
      NAKL_EDIT.text:=GlDocNum+' от '+date_sokr(GlDocDate);
      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select sum(PNS2$_SUMM) as ss from PNS2$ where pn$_id=:pn_id');
      QueryWork.ParamByname('pn_id').asinteger:=PN2_NAKL;
      QueryWork.Open;
      if QueryWork.eof then NAKL_SUMM.value:=0
      else NAKL_SUMM.value:=QueryWork.fieldByname('SS').asfloat;
      QueryWork.Close;
    end;
  end;
  FIND_DOCNUM.destroy;

end;

procedure TDOC_PN2.Check_naklClick(Sender: TObject);
begin
   if check_nakl.checked then begin
      Btn_Nakl.enabled:=True;
      // Перезапросить сумму
      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select sum(PNS2$_SUMM) as ss from PNS2$ where pn$_id=:pn_id');
      QueryWork.ParamByname('pn_id').asinteger:=PN2_NAKL;
      QueryWork.Open;
      if QueryWork.eof then begin
        NAKL_SUMM.value:=0;
        NAKL_EDIT.text:='Накладная не найдена!';
      end else NAKL_SUMM.value:=QueryWork.fieldByname('SS').asfloat;
      QueryWork.Close;
   end else begin
     Btn_Nakl.enabled:=False;
     NAKL_SUMM.value:=0;
   end;
   Save:=False;
end;

procedure TDOC_PN2.MemPnsTW_KOLChange(Sender: TField);
var
  val:double;
begin
   SAVE:=FALSE;
   val:=MemPNS.fieldByname('TW_KOL').asfloat;
   if val<=0 then begin
     MemPNS.fieldByname('TW_KOL').asfloat:=1;
     messbox('Количество товара не может быть нулевой или отрицательной величиной! '+CR+
     'Количеcтво с '+floattostrf(val,fffixed,19,4)+' изменено на 1.000!',MessError,16);
   end;
end;

procedure TDOC_PN2.PN_KURSChange(Sender: TObject);
var
  val:double;
begin
   SAVE:=FALSE;
   val:=PN_KURS.value;
   if PN_KURS.value<=0 then begin
     PN_KURS.value:=1;
     messbox('Курс не может быть нулевой или отрицательной величиной! '+CR+
     'Курс с '+floattostrf(val,fffixed,19,2)+' изменен на 1.0!',MessError,16);
   end;
end;

procedure TDOC_PN2.BtnPoluProvExecute(Sender: TObject);
var
  close_date:tdatetime;
begin
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork,' select cast((select period2.period_close from period period2 where '+
  'period2.usgroup_id=usgroup.usgroup_id and period2.period_change=(select max(period.period_change) from '+
  'period where period.usgroup_id=usgroup.usgroup_id)) as date) as dt '+
  'from kln,usgroup where kln.usgroup_id=usgroup.usgroup_id and (kln.kln_id=:kln_id) ');
  QueryWork.PAramByname('kln_id').asinteger:=userid;
  QueryWork.Open;
  if QueryWork.eof then close_date:=date()
  else close_date:=QueryWork.fieldByname('dt').asdatetime;
    // Коррекция
  if PN_DATE.date<close_date then messbox('Дата документа меньше даты закрытия периода!',MessSystem,48) else begin
    if not PN_KORR then begin
      if messbox('Открыть накладную для коррекции?',MessSubmit,4+48+256)=6 then begin
         // фиксируем акт коррекции
         Datamodule1.IBTransaction2.Active:=False;
         Datamodule1.IBTransaction2.StartTransaction;
         try
           IBSAVE_CLEAR;
           IBSAVE_ADD('US_ID',USERID);
           IBSAVE_ADD('SHOP_ID',SHOPID);
           IBSAVE_ADD('MESS','$6');
           IBSAVE_ADD('DOC','PN$');
           IBSAVE_ADD('DOP1',2);
           IBSAVE_ADD('DOP2',DOC_PN2.tag);
           IBSAVE_DOC('ARCUPDATE',-1);
           Datamodule1.IBTransaction2.Commit;
         except
           Datamodule1.IBTransaction2.Rollback;
         end;
         Datamodule1.IBTransaction2.Active:=False;
         PN_KORR:=true;
         Show_sost;
      end;
    end;
  end;
end;

procedure TDOC_PN2.MemPnsPNS_IDChange(Sender: TField);
begin
    save:=False;
end;

procedure TDOC_PN2.SKLChange(Sender: TObject);
var prev_skl_frm: integer;
begin
  save:=false;
  show_sost;
end;

procedure TDOC_PN2.PN_OWNERChange(Sender: TObject);
begin
 save:=False;
end;

procedure TDOC_PN2.PN_VIDChange(Sender: TObject);
begin
 save:=False;
end;

procedure TDOC_PN2.PN_OSNChange(Sender: TObject);
begin
 save:=False;
end;

procedure TDOC_PN2.PN_WHOChange(Sender: TObject);
begin
 save:=False;
end;

procedure TDOC_PN2.PN_DATEChange(Sender: TObject);
begin
 save:=False;
end;

procedure TDOC_PN2.PN_DATE_OPLChange(Sender: TObject);
begin
   save:=False;
end;

procedure TDOC_PN2.PN_STFAKTChange(Sender: TObject);
begin
 save:=False;
end;

end.

