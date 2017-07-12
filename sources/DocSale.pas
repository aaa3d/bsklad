unit DocSale;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, RxLookup, ComCtrls,
  ToolWin, CurrEdit, Grids, DBGrids, RXDBCtrl, ActnList, IBCustomDataSet,
  IBQuery, Db, RxMemDS, IBDatabase, b_dbutils, b_utils, DBFilter, DetalTW,
  SetSkid,DocPo, JouPO, PRINTKKM;



type
  TDOC_SALE = class(TForm)
    PopupMenu1: TPopupMenu;
    MnPROW: TMenuItem;
    MnUnprow: TMenuItem;
    N2: TMenuItem;
    MnSave: TMenuItem;
    MnApply: TMenuItem;
    N6: TMenuItem;
    MnKLN: TMenuItem;
    N4: TMenuItem;
    MnPrint: TMenuItem;
    MnPRINTKKM: TMenuItem;
    MnHistory: TMenuItem;
    N10: TMenuItem;
    MnTW: TMenuItem;
    MnDel: TMenuItem;
    N13: TMenuItem;
    MnDetal: TMenuItem;
    MnAnaliz: TMenuItem;
    MnMarketing: TMenuItem;
    N18: TMenuItem;
    MnCenn: TMenuItem;
    MnCennMore: TMenuItem;
    N3: TMenuItem;
    MnOst: TMenuItem;
    MnRefreshOst: TMenuItem;
    MnuFastInfo: TMenuItem;
    N1: TMenuItem;
    MnSet_Skid: TMenuItem;
    HAT_PAGE_CONTROL: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label9: TLabel;
    SKL: TRxDBLookupCombo;
    Image1: TImage;
    SALE_DOST: TCheckBox;
    DOST_DATE: TDateEdit;
    Label5: TLabel;
    KLN_NAME: TEdit;
    BTN_KLN: TBitBtn;
    Label7: TLabel;
    KLN_BNK: TEdit;
    Label11: TLabel;
    SALE_DATE: TDateEdit;
    DOC_PAGE_CONTROL: TPageControl;
    TW_TAB_SHEET: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    Label8: TLabel;
    SALE_OSN: TMemo;
    Label15: TLabel;
    SALE_WHO: TRxLookupEdit;
    Label19: TLabel;
    TABEL: TRxCalcEdit;
    Btn_Tabel: TButton;
    Image2: TImage;
    Label20: TLabel;
    NDS: TRxCalcEdit;
    ActionList1: TActionList;
    PrintTWCheck: TAction;
    PrintTwCheckFast: TAction;
    ActRnToPO: TAction;
    ActRnToStorno: TAction;
    ActShowPO: TAction;
    ActNewPo: TAction;
    ActOpenPo: TAction;
    ActDelPo: TAction;
    PrintRndRear: TAction;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    Btn_Prow: TToolButton;
    Btn_Unprow: TToolButton;
    ToolButton8: TToolButton;
    Btn_SAVE: TToolButton;
    Btn_Apply: TToolButton;
    ToolButton4: TToolButton;
    Btn_Print: TToolButton;
    ToolButton9: TToolButton;
    ToolButton21: TToolButton;
    Btn_PrintKKM: TToolButton;
    Btn_Propertis: TToolButton;
    Btn_Subdoc: TToolButton;
    ToolButton11: TToolButton;
    Btn_NODISCONT: TToolButton;
    ToolButton6: TToolButton;
    Btn_DicTow: TToolButton;
    Btn_DelTow: TToolButton;
    ToolButton14: TToolButton;
    Btn_Detal: TToolButton;
    Btn_Analiz: TToolButton;
    Btn_Marketing: TToolButton;
    ToolButton1: TToolButton;
    Btn_PrintCenn: TToolButton;
    Btn_PrintCennMore: TToolButton;
    ToolButton2: TToolButton;
    Btn_Ost: TToolButton;
    Btn_RefreshOst: TToolButton;
    ToolButton12: TToolButton;
    ToolButton15: TToolButton;
    SKID_TAB_SHEET: TTabSheet;
    Btn_ALLSKID: TButton;
    ONE_SKID: TEdit;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    SALE_DISKONT: TEdit;
    Label18: TLabel;
    SALE_SKID: TRxCalcEdit;
    Label21: TLabel;
    SALE_SKID_TXT: TEdit;
    MemRNS: TRxMemoryData;
    MemRNSTW_ID: TIntegerField;
    MemRNSTW_NAM: TStringField;
    MemRNSTW_MONEY: TFloatField;
    MemRNSTW_KOL: TFloatField;
    MemRNSTW_SUMM: TFloatField;
    MemRNSED_SHORT: TStringField;
    MemRNSSTS_ID: TIntegerField;
    MemRNSTW_ART: TIntegerField;
    MemRNSTW_SKID: TFloatField;
    MemRNSTW_OKMONEY: TFloatField;
    MemRNSOST: TFloatField;
    MemRNSTW_SKIDDOLL: TFloatField;
    MemRNSSKID_TXT: TStringField;
    MemRNSTW_COLOR: TIntegerField;
    MemRNSOTG_KOL: TFloatField;
    MemRNSMET_MONEY_SHOP: TStringField;
    MemRNSRNS_TABEL: TIntegerField;
    MemRNSTW_SHORT_NAM: TStringField;
    MemRNSTW_WEIGHT: TFloatField;
    MemRNSRNS_WEIGHT: TFloatField;
    MemRNSTW_NEGABARIT: TStringField;
    DsRNS: TDataSource;
    IBSkl: TIBQuery;
    DSSkl: TDataSource;
    DsShopRvid: TDataSource;
    DicShopRvid: TIBQuery;
    DicShopRvidRVID_ID: TIntegerField;
    DicShopRvidRVID_NAME: TIBStringField;
    DicShopRvidRVID_SUBKLN: TIntegerField;
    DicRvidKLN: TIBQuery;
    DicRvidKLNKLN_ID: TIntegerField;
    DicRvidKLNKLN_FULL: TIBStringField;
    DsRvidKln: TDataSource;
    RvidTransaction: TIBTransaction;
    SaleDocTransaction: TIBTransaction;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    MemRNSSALER_ID: TIntegerField;
    Label22: TLabel;
    NP: TRxCalcEdit;
    Timer1: TTimer;
    QrListPO: TIBQuery;
    QrListPOPO_ID: TIntegerField;
    QrListPOPO_DATE: TDateTimeField;
    QrListPOPO_FULL_NUM: TIBStringField;
    QrListPOPO_SUMM: TFloatField;
    QrListPOSTORNO_SUMM: TFloatField;
    QrListPOPO_OSN: TIBStringField;
    QrListPOKLN_FULL: TIBStringField;
    QrListPOUS_FULL: TIBStringField;
    QrListPOSHOP_COLOR: TIntegerField;
    QrListPOPORN_SUMM: TFloatField;
    QrListPOPORN_ID: TIntegerField;
    DsListPO: TDataSource;
    PoTransaction: TIBTransaction;
    Timer3: TTimer;
    Timer2: TTimer;
    IBQuery1: TIBQuery;
    Query1Transaction: TIBTransaction;
    IBQuery2: TIBQuery;
    NAKL_TAB_SHEET: TTabSheet;
    NAKL_TAB_CTRL: TTabControl;
    StatusBar1: TStatusBar;
    SALE_KURS: TRxCalcEdit;
    Label25: TLabel;
    Label26: TLabel;
    SALE_VALUTA: TRxDBLookupCombo;
    MemRNSRN_ID: TIntegerField;
    NAKL_PAGE_CONTROL: TPageControl;
    TW_SHEET: TTabSheet;
    RxDBGrid3: TRxDBGrid;
    ToolBar3: TToolBar;
    ToolButton18: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    Label12: TLabel;
    RN_NUM: TEdit;
    ToolButton28: TToolButton;
    Label16: TLabel;
    RN_SUMM: TRxCalcEdit;
    TabSheet4: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton19: TToolButton;
    RxDBGrid2: TRxDBGrid;
    Bevel1: TBevel;
    Image3: TImage;
    ToolBar5: TToolBar;
    IBQuery3: TIBQuery;
    cbSkidNoPrint: TCheckBox;
    Label4: TLabel;
    RVID: TRxDBLookupCombo;
    RVIDKLN: TRxDBLookupCombo;
    N5: TMenuItem;
    Panel1: TPanel;
    DOC_OSN: TEdit;
    Label24: TLabel;
    SALE_WEIGHT: TRxCalcEdit;
    Label23: TLabel;
    SALE_SUMM: TRxCalcEdit;
    Label14: TLabel;
    SALE_NUM: TEdit;
    Label10: TLabel;
    btnOpenDrawer: TToolButton;
    actOpenDrawer: TAction;
    IBSklSKL_ID: TIntegerField;
    IBSklSKL_SHORT: TIBStringField;
    IBSklSKL_FRM: TIntegerField;
    IBSklFRM_NAME: TIBStringField;
    KLN_KTG: TEdit;
    MemRNStw_noskid: TIntegerField;
    MemRNStw_skid_load: TFloatField;
    MemRNSnapr: TIntegerField;
    MemRNSktg: TIntegerField;
    QueryWork2: TIBQuery;
    chkShowOst: TCheckBox;
    ToolButton10: TToolButton;
    MemRNSFRM_OST: TFloatField;
    Label1: TLabel;
    rn_gp: TEdit;
    ToolButton13: TToolButton;
    actFastPrintRn: TAction;
    N7: TMenuItem;
    ToolButton16: TToolButton;
    print_mh3: TAction;
    N31: TMenuItem;
    comboDiscont: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RVIDChange(Sender: TObject);
    procedure Change_FrmKln(ID,N:integer);
    procedure Btn_ApplyClick(Sender: TObject);
    procedure SKLChange(Sender: TObject);
    procedure Show_sost;
    procedure Timer1Timer(Sender: TObject);
    function  SaleSumm: double;	//сумма без фильтрации по фирмам
    function  RnSumm(SALER_ID: integer): double;	//Сумма РН, с фильтрацией по указанной фирме
    Procedure Refresh_summ;
    procedure CalcDostCost();
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ADD_RNS(TW_ID:integer;KOL:double);
    procedure Btn_DicTowClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure Btn_SAVEClick(Sender: TObject);
    procedure Btn_NODISCONTClick(Sender: TObject);
    procedure Btn_DelTowClick(Sender: TObject);
    procedure NAKL_TAB_CTRLChange(Sender: TObject);
    procedure DOC_PAGE_CONTROLChange(Sender: TObject);
    procedure MemRNSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TABELChange(Sender: TObject);
    procedure Btn_TabelClick(Sender: TObject);
    procedure TABELKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure MemRNSCalcFields(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Btn_ProwClick(Sender: TObject);
    procedure Btn_UnprowClick(Sender: TObject);
    procedure SET_NDS_NP;
    procedure BTN_KLNClick(Sender: TObject);
    procedure Btn_ALLSKIDClick(Sender: TObject);
    procedure Btn_DetalClick(Sender: TObject);
    procedure Btn_AnalizClick(Sender: TObject);
    procedure Btn_MarketingClick(Sender: TObject);
    procedure Btn_PrintCennClick(Sender: TObject);
    procedure Btn_PrintCennMoreClick(Sender: TObject);
    procedure Btn_OstClick(Sender: TObject);
    procedure Btn_RefreshOstClick(Sender: TObject);
    procedure MnSet_SkidClick(Sender: TObject);
    procedure HAT_PAGE_CONTROLChange(Sender: TObject);
    procedure NAKL_PAGE_CONTROLChange(Sender: TObject);
    procedure ActNewPoExecute(Sender: TObject);
    procedure ActOpenPoExecute(Sender: TObject);
    procedure ActDelPoExecute(Sender: TObject);
    procedure CTRLDrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure PrintRndRearExecute(Sender: TObject);
    procedure BtnPrintNpzClick(Sender: TObject);
    procedure Btn_PrintClick(Sender: TObject);
    procedure PrintTWCheckExecute(Sender: TObject);
    procedure Btn_PropertisClick(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton22Click(Sender: TObject);
    procedure ToolButton23Click(Sender: TObject);
    procedure ToolButton25Click(Sender: TObject);
    procedure ToolButton26Click(Sender: TObject);
    procedure SALE_DISKONTChange(Sender: TObject);
    procedure SALE_SKIDChange(Sender: TObject);
    procedure SALE_SKID_TXTChange(Sender: TObject);
    procedure SALE_DOSTClick(Sender: TObject);
    procedure PrintCheck(RN_index: integer);
    procedure ToolButton24Click(Sender: TObject);
    procedure Btn_PrintKKMClick(Sender: TObject);
    function PO_POG_SUMM(): currency;
    function Get_napr_kln(TW_ID:integer): integer;
    procedure MemRNSAfterEdit(DataSet: TDataSet);
    procedure SALE_DOSTMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PrintTwCheckFastExecute(Sender: TObject);
    procedure MnPRINTKKMClick(Sender: TObject);
    procedure RxDBGrid1ColExit(Sender: TObject);
    procedure DsRNSDataChange(Sender: TObject; Field: TField);
    procedure SALE_OSNChange(Sender: TObject);
    procedure DOST_DATEChange(Sender: TObject);
    procedure SALE_DATEChange(Sender: TObject);
    procedure SALE_WHOChange(Sender: TObject);
    procedure RVIDKLNChange(Sender: TObject);
    procedure SAVE_RN_KASSIR(_RN_ID: integer);
    procedure actOpenDrawerExecute(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure actFastPrintRnExecute(Sender: TObject);
    procedure print_mh3Execute(Sender: TObject);
    procedure comboDiscontChange(Sender: TObject);
  private
    { Private declarations }
    SAVE: boolean;
    SALE_PROW: boolean;
    SHOP_ID: integer;
    DISKONT_NUM:ansistring;
    SALE_NUMS:integer;
    RN_NUMS: integer;
    CNT_DEL:integer;
    Sost:integer;
    STR:ansistring;
    NEW_DISKONT_NUM: ansistring;
    DISKONT_ID:integer;
    CanInsert:Boolean;
    REAL_TYP: integer;
    pers_skid: integer;

    RNS_DEL:array[1..1000] of integer;
    RNS_DEL_TW:array[1..1000] of integer;
    RNS_DEL_FRM: array[1..1000] of integer;
    RNS_DEL_RN: array[1..1000] of integer;
    RNS_DEL_OTG:array[1..1000] of double;
    RNS_DEL_MESS:array[1..1000] of string;
    RNS_DEL_MESS2:array[1..1000] of string;
    arrRN: array [0..100] of RN;
    JOU_PO2: TJOU_PO;

    DOST: Boolean;

    shop_frm, skl_frm: integer;
    SHOP_DEFAULT_SKLAD, SHOP_RNTYP_ID: integer;
    FormLoad: boolean;
    kln_ktg_id: integer;
    initComplete: boolean;

    procedure READY_COM_DATAMessage(var AMessage: TMessage); message
      gl_READY_COM_DATA;


  public
    { Public declarations }
  end;

var
  DOC_SALE: TDOC_SALE;
  otkr:integer=0;

implementation

uses Mainform, WaitForm, Data1, SelectPrint, SetKolvo, DicTowar, DicKlient,
  ANALIZTW, PrintDoc, FR_Shtrih;

{$R *.DFM}

procedure TDOC_SALE.READY_COM_DATAMessage(var AMessage: TMessage);
var tW_id: integer;
  tw_art: string;
  tw_art_int: integer;
  brak: string;
  tw_kol: double;

begin
  try
       tw_kol:=AMessage.LParam/1000;
       tw_id:=AMessage.WParam;

       if memRNS.Locate('TW_ID', tw_id, [])  then
       begin
         memrns.Edit;
         memRNS.FieldByName('TW_KOL').asfloat:=memRNS.FieldByName('TW_KOL').asfloat+tw_kol;
 //        memRNS.Post; не надо, т.к. POST делается в другом месте при пересчете цены при изменении количества.
       end
       else
         ADD_RNS(tw_id, tw_kol);


  except
   on e: Exception do
     messbox(e.message, e.message, 0);
  end;

  show_sost;

  statusBar1.Panels[0].Text:='Ввод со сканера штрих кода';
  statusBar1.Panels[1].Text:=gl_LAST_BAR_CODE;
end;

procedure TDOC_SALE.FormCreate(Sender: TObject);
begin
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;
     Timer1.Interval:=TIME_GET_DISCONT;
end;

procedure TDOC_SALE.FormShow(Sender: TObject);
var rvid_id, RVID_KLN,RVID_SUBKLN: integer;
	a: integer;

  fq: FastQuery;
  oldDateFormat: string;
  y,m,d: word;
  h,mm,s, mils: word;
begin
     if (userid=2646702) then
        timer1.Interval := 3000;

     FormLoad:=true;
     initComplete:=false;
     IS_EDIT_SALE:=true;
     real_typ:=2;

     skl.DropDownCount := DataModule1.MainDicSkl.RecordCount+1;

     HAT_PAGE_CONTROL.ActivePageIndex:=0;
     DOC_PAGE_CONTROL.ActivePageIndex:=0;
     NAKL_PAGE_CONTROL.ActivePageIndex:=0;
     NAKL_TAB_CTRL.TabIndex:=0;

     HAT_PAGE_CONTROL.OwnerDraw:=true;
     DOC_PAGE_CONTROL.OwnerDraw:=true;
     NAKL_PAGE_CONTROL.OwnerDraw:=true;
     NAKL_TAB_CTRL.OwnerDraw:=true;


     try
       memRNS.filtered:=false;
       RxDbGrid1.setfocus;
     Except
     End;
     if DOC_SALE.tag<0 then TABEL.setFocus;


    DataModule1.MainDicRnTyp.Locate('RNTYP_ID',DEFAULT_RNTYP_KKM,[]);
    shop_rntyp_id:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_ID').asinteger;

    sost:=0;
    str:='';
    CanInsert:=False;
    NEW_DISKONT_NUM:='';

    Show_wait('Инициализация накладной. Получение значаний по умолчанию...',1);
    Get_default;
    Show_Wait('Инициализация накладной. Виды реализации...',10);
    DicShopRvid.close;
    DicShopRvid.ParamByname('shop_id').asinteger:=SHOPID;
    DicShopRvid.ParamByname('rntyp_id').asinteger:=DEFAULT_RNTYP_KKM; //
    DicShopRvid.ParamByname('rn_id').asinteger:=0;
    DicShopRvid.open;







    {Определяем название}
     if Doc_Sale.tag<0 then
     begin
        if ((SHOPID=14) and (IS_KKM)) then
          chkShowOst.checked:=false;

        Show_wait('Инициализация накладной. Фирмы...',30);
        {продажа новая, определить какие в нем торгуют фирмы}

        fq := FastQuery.Create('select kln_id , kln_use_nds, kln_prefix, (select kln_data.kln_short from kln_data(kln.kln_id)) KLN_SHORT, shop.shop_id, shop.shop_frm, '+
        '(SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_SKLAD" AND CFG_SET1=shop.shop_id) DEFAULT_SKLAD '+
        'from shop, kln '+
        'where ((shop.shop_frm >0 and kln.kln_id = shop.shop_frm) '+
        'or ( bg_abs(shop.shop_frm)=0) and kln.kln_frm in (2,1)) '+
        'and shop.shop_id = :shop_id order by kln_prefix');
        fq.ParamByName('SHOP_id').asinteger:= SHOPID;
        fq.Open;
        {Заполняем массив РН, создаем шапки в NAKL_TAB_CTRL}
        while not fq.Eof do
        begin
            arrRN[NAKL_TAB_CTRL.Tabs.Count].PO_SUMM:=0;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].RN_ID:=-1;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].SALES_ID:=-1;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].RN_NUMS:=-1;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].KASSIR_ID:=-1;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].KASSA_ID:=-1;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].FRM_ID := fq.fieldbyname('KLN_ID').asinteger;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].FRM_SHORT:=fq.fieldbyname('KLN_SHORT').asstring;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].FRM_PREFIX:=fq.fieldbyname('KLN_PREFIX').asstring;
            if fq.fieldbyname('KLN_USE_NDS').asinteger>0 then
              arrRN[NAKL_TAB_CTRL.Tabs.Count].FRM_USE_NDS:=true
            else
              arrRN[NAKL_TAB_CTRL.Tabs.Count].FRM_USE_NDS:=false;
            NAKL_TAB_CTRL.Tabs.Add(fq.fieldbyname('KLN_PREFIX').asstring);
            fq.Next;
        end;

        fq.Close;
        freeandnil(fq);


        SHOP_DEFAULT_SKLAD := DEFAULT_SKLAD;
        Show_wait('Инициализация накладной. Склады...',20);
        ibskl.ParamByName('shop_id').asinteger := SHOPID;
        ibskl.Open;

       	SALE_PROW:=False;
       	Show_wait('Инициализация накладной. Настройки по умолчанию...',30);
        SKL.Value:= inttostr(DEFAULT_SKLAD);


        SHOP_RVID_DEFAULT(SHOPID,DEFAULT_RNTYP_KKM, RVID_ID,RVID_KLN,RVID_SUBKLN);
       	RVID.value:=inttostr(RVID_ID);

       	KLN_NAME.Tag:=SHOP_KLN_DEFAULT(SHOPID,DEFAULT_RNTYP_KKM);
        Change_FrmKln(KLN_NAME.tag,2);
        SALE_VALUTA.value:='0';




       	DISKONT_NUM:='';








       	SALE_OSN.lines.clear;
       	SALE_WHO.text:='';
       	SALE_NUM.text:='Новый';
       	SALE_NUMS:=-1;
        RN_NUMS:=-1;

       	SALE_DATE.date:=Date();
       	SALE_DOST.Checked:=False;

       	SALE_SKID_TXT.text:='';
       	NDS.Value:=0;
       	NP.value:=0;
       	SHOP_ID:=SHOPID;
        SHOP_FRM := gl_SHOP_FRM;
       	SALE_SKID.value:=0;
        SALE_KURS.value:=DEFAULT_KURS(DEFAULT_VALUTA_KURS,TYP_KKM);

        if DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger=2 then begin
         // НДС всегда не выделяется!
         NDS.value:=0;
         NDS.enabled:=False;
        end;


        decodeDate(date, y, m, d);
        decodetime(time, h, mm, s, mils);
        if (h=29) or (DayofWeek(Date()) = 1) or ((m = 3) and (d = 8)) or ((m = 2) and (d = 23)) or ((m = 5) and (d = 9)) or ((m = 6) and (d = 12)) or ((m = 1) and (d = 2)) or ((m = 1) and (d = 7)) then        //начало недели - воскресенье
        begin
           if (strtoint('0'+RVID.Value)<3) then
//           if (DISKONT_ID = 0) then
           begin
                DISKONT_NUM:='70045605';
                DISKONT_ID := 1283615;
                SALE_SKID.Value :=3;
           end
        end;


     end else

     begin
        //3 - шапки расходных накладных
        //1 - шапка продажи
        //2 - список товаров

        //1

        //3 - шапки расходных накладных

        fq := FastQuery.Create('SELECT SHOP_ID from SALE WHERE SALE_ID='+inttostr(Doc_Sale.Tag));
        fq.Open;
        SHOP_ID := fq.fieldbyname('SHOP_ID').asinteger;
        fq.close;
        freeandnil(fq);


        Show_wait('Инициализация накладной. Фирмы...',20);
        {продажа загружена, если данном магазине есть фирма, то должна быть только она, если в данном магазине нет фирмы, то берутся фирмы-продавцы}
        fq := FastQuery.Create('select kln_id , kln_use_nds, kln_prefix, (select kln_data.kln_short from kln_data(kln.kln_id)) KLN_SHORT, shop.shop_id, shop.shop_frm, '+
        '(SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_SKLAD" AND CFG_SET1=shop.shop_id) DEFAULT_SKLAD '+
        'from shop, kln '+
        'where ((shop.shop_frm >0 and kln.kln_id = shop.shop_frm) '+
        'or ( bg_abs(shop.shop_frm)=0) and kln.kln_frm in (1, 2)) '+
        'and shop.shop_id = :shop_id order by kln_prefix');
        fq.ParamByName('SHOP_id').asinteger:= SHOP_ID;
        fq.Open;

        SHOP_FRM := fq.fieldbyname('SHOP_FRM').asinteger;
        SHOP_DEFAULT_SKLAD := fq.fieldbyname('DEFAULT_SKLAD').asinteger;
        {Заполняем массив РН, создаем шапки в NAKL_TAB_CTRL}
        while not fq.Eof do
        begin
            arrRN[NAKL_TAB_CTRL.Tabs.Count].PO_SUMM:=0;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].RN_ID:=-1;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].SALES_ID:=-1;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].RN_NUMS:=-1;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].KASSIR_ID:=-1;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].KASSA_ID:=-1;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].FRM_ID := fq.fieldbyname('KLN_ID').asinteger;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].FRM_SHORT:=fq.fieldbyname('KLN_SHORT').asstring;
            arrRN[NAKL_TAB_CTRL.Tabs.Count].FRM_PREFIX:=fq.fieldbyname('KLN_PREFIX').asstring;
            if fq.fieldbyname('KLN_USE_NDS').asinteger>0 then
              arrRN[NAKL_TAB_CTRL.Tabs.Count].FRM_USE_NDS:=true
            else
              arrRN[NAKL_TAB_CTRL.Tabs.Count].FRM_USE_NDS:=false;
            NAKL_TAB_CTRL.Tabs.Add(fq.fieldbyname('KLN_PREFIX').asstring);
            fq.Next;
        end;

        fq.Close;
        freeandnil(fq);

        Show_wait('Инициализация накладной. Склады...',30);
        ibskl.ParamByName('shop_id').asinteger := SHOP_ID;
        ibskl.Open;


          Show_wait('Инициализация накладной. Чтение шапок расходных накладных...',40);
          WorkTransaction.Active:=false;
          QueryWork.SQL.Text:='select RN.*,  '+
            'SALES.SALES_ID,(select card.card_num from card where card_id=rn.card_id) card_num '+
            'from RN, SALES '+
            'where SALES.rn_id = rn.rn_id '+
            'and sales.sale_id = :sale_id';
          QueryWork.ParamByName('SALE_ID').asinteger:= Doc_Sale.Tag;
          QueryWork.Open;

          while not QueryWork.Eof do
          begin

            //Параметры, общие для продажи, берутся из шапок расходных накладных
            RN_NUMS := QueryWOrk.fieldbyname('RN_NUM').asinteger;
//          	SKL_ID := QueryWOrk.fieldbyname('SKL_ID').asinteger;
          	SALE_SKID.Value :=QueryWOrk.fieldbyname('RN_SKID').asfloat;
          	SALE_SKID_TXT.Text :=QueryWOrk.fieldbyname('RN_SKID_TXT').asstring;
          	SALE_KURS.Value :=QueryWOrk.fieldbyname('RN_KURS').asfloat;
          	SALE_OSN.Text :=QueryWOrk.fieldbyname('RN_OSN').asstring;

            rn_gp.Text:=QueryWOrk.fieldbyname('RN_GP').asstring;
          	SALE_WHO.Text :=QueryWOrk.fieldbyname('RN_WHO').asstring;
          	KLN_NAME.tag :=QueryWOrk.fieldbyname('KLN_ID').asinteger;	//указать имя клиента и банк
//          	NDS.Value :=QueryWOrk.fieldbyname('NDS').asfloat;
//          	NP.Value :=QueryWOrk.fieldbyname('NP').asfloat;

          	if QueryWOrk.fieldbyname('RN_DOST').asstring='1' then
          		SALE_DOST.Checked:=true
            	else  SALE_DOST.Checked:=false;

          	DOST_DATE.Date := queryWork.fieldbyname('DOST_DATE').asdatetime;
          	SALE_VALUTA.value := queryWork.fieldbyname('VALUTA_ID').asstring;
          	DISKONT_ID := queryWork.fieldbyname('CARD_ID').asinteger;
            if DISKONT_ID>0 then DISKONT_NUM:=queryWork.fieldbyname('CARD_NUM').asstring
                   else DISKONT_NUM:='';
            SHOP_RNTYP_ID := queryWork.fieldbyname('RNTYP_ID').asinteger;

            Show_Wait('Инициализация накладной. Виды реализации...',45);
            DicShopRvid.close;
            DicShopRvid.ParamByname('shop_id').asinteger:=SHOP_ID;


            DicShopRvid.ParamByname('rntyp_id').asinteger:=queryWork.fieldbyname('rntyp_id').asinteger; // +++++++++     Надо слелать чтобы тип был или НАЛ или НАЛКР.
                                                              //в зависимости от вида реализации. также учесть что в Олимп2 Гефест будет иметь другой вид реализации (
            DicShopRvid.ParamByname('rn_id').asinteger:=0;
            DicShopRvid.open;


            //чтобы в выборе были только розничные виды реализации а для ТК подставлялись с НДС 
            //
            case  queryWork.fieldbyname('RVID_ID').asInteger of
              21009: RVID.Value:='1';
              21010: RVID.Value:='2';
              21011: RVID.Value:='3';
              else RVID.Value:=queryWork.fieldbyname('RVID_ID').asString;
            end;



//          	RVID.Value := queryWork.fieldbyname('RVID_ID').asstring;
          	RVIDKLN.Value := queryWork.fieldbyname('RVID_KLN').asstring;

            //параметры, свои для каждой накладной. сопоставляются по фирмам
            for a := 0 to NAKL_TAB_CTRL.Tabs.Count-1 do
               if arrRN[a].FRM_ID=queryWork.fieldbyname('FRM_ID').asinteger then
               begin
                  arrRN[a].RN_ID := queryWork.fieldbyname('RN_ID').asinteger;
                  arrRN[a].SALES_ID := queryWork.fieldbyname('SALES_ID').asinteger;
                  arrRN[a].RN_NUMS := queryWork.fieldbyname('RN_NUM').asinteger;
               end;
        	querywork.Next;
          end;

          QueryWork.Close;

//**********
     Add_SQL(QueryWork,'select valuestr from propkln where kln_id=:kln_id and propkln.typ=:typ');
     QueryWork.ParamByName('kln_id').asinteger:=KLN_NAME.tag;
     case real_typ of
       1: QueryWork.ParamByName('typ').asinteger:=12;
       2: QueryWork.ParamByName('typ').asinteger:=7;
     end;
     QueryWork.Open;
     if not QueryWork.IsEmpty then
       pers_skid:=strtoint(QueryWork.fieldbyname('valuestr').asstring)
     else
       pers_skid:=0;
     QueryWork.Close;
//**********


        Show_wait('Инициализация накладной. Чтение шапки продажи...',55);

     	  WorkTransaction.Active:=false;
        QueryWork.SQL.Text:='SELECT * FROM SALE WHERE SALE_ID = :SALE_ID';
		    QueryWork.ParamByName('SALE_ID').asinteger:= Doc_Sale.Tag;
        QueryWork.Open;
        if QueryWork.fieldbyname('SALE_PROW').asstring='1' then SALE_PROW:=true else SALE_PROW:=false;
        SALE_NUMS := QueryWork.fieldbyname('SALE_NUM').asinteger;
        SALE_NUM.Text 	:= 	QueryWork.fieldbyname('SALE_NUM').asstring;
        SHOP_ID 		:=	QueryWork.fieldbyname('SHOP_ID').asinteger;
       	SALE_DATE.date	:=	QueryWork.fieldbyname('SALE_DATE').asdatetime;
        DOC_OSN.text	:=	QueryWork.fieldbyname('DOC_OSN').asstring;
        SKL.Value :=      QueryWork.fieldbyname('SKL_ID').asstring;
        QueryWork.Close;

        //2
        WorkTransaction.Active:=false;
        QueryWork.SQL.Text:='select * FROM LIST_SALES(:SALE_ID)';
        QueryWork.ParamByName('SALE_ID').asinteger:= Doc_Sale.Tag;


        Show_wait('Инициализация накладной. Чтение табличной части...',70);
        QueryWork.Open;

          while not QueryWork.eof do begin
                CanInsert:=True;
                MemRNS.Append;
                MemRNS.Fieldbyname('RN_ID').asinteger:=QueryWork.Fieldbyname('RN_ID').asinteger;
                if QueryWork.Fieldbyname('TW_SALER_ID').asinteger=-1 then //найти накладную, в которой был был сохранен товар и взять оттуда продавца
                begin
                  for a := 0 to NAKL_TAB_CTRL.Tabs.Count-1 do
                  if arrRN[a].RN_ID=QueryWork.Fieldbyname('RN_ID').asinteger then
                    MemRNS.Fieldbyname('SALER_ID').asinteger:= arrRN[a].FRM_ID;
                end
                else
                MemRNS.Fieldbyname('SALER_ID').asinteger:=QueryWork.Fieldbyname('TW_SALER_ID').asinteger;
                Get_napr_kln(QueryWork.Fieldbyname('TW_ID').asinteger);
                MemRNS.Fieldbyname('RNS_ID').asinteger:=QueryWork.Fieldbyname('RNS_ID').asinteger;
                MemRNS.Fieldbyname('TW_ID').asinteger:=QueryWork.Fieldbyname('TW_ID').asinteger;
                MemRNS.Fieldbyname('TW_COLOR').asinteger:=QueryWork.Fieldbyname('TW_COLOR').asinteger;
                MemRNS.Fieldbyname('TW_ART').asinteger:=QueryWork.Fieldbyname('TW_ART').asinteger;
                MemRNS.Fieldbyname('TW_NAM').asstring:=QueryWork.Fieldbyname('TW_NAM').asstring;
                MemRNS.Fieldbyname('TW_SHORT_NAM').asstring:=QueryWork.Fieldbyname('TW_SHORT_NAM').asstring;
                MemRNS.Fieldbyname('ED_SHORT').asstring:=QueryWork.Fieldbyname('ED_SHORT').asstring;
                MemRNS.Fieldbyname('TW_KOL').asfloat:=QueryWork.Fieldbyname('TW_KOL').asfloat;
                MemRNS.Fieldbyname('OTG_KOL').asfloat:=QueryWork.Fieldbyname('OTG_KOL').asfloat;
                MemRNS.Fieldbyname('TW_MONEY').asfloat:=QueryWork.Fieldbyname('TW_MONEY').asfloat;
                MemRNS.Fieldbyname('TW_WEIGHT').asfloat:=QueryWork.Fieldbyname('TW_WEIGHT').asfloat;
                MemRNS.Fieldbyname('TW_SKID').asfloat:=QueryWork.Fieldbyname('TW_SKID').asfloat;
                MemRNS.Fieldbyname('TW_SKID_LOAD').asfloat:=MemRNS.Fieldbyname('TW_SKID').asfloat;
                MemRNS.Fieldbyname('SKID_TXT').asstring:=QueryWork.Fieldbyname('SKID_TXT').asstring;
                MemRNS.Fieldbyname('TW_SKIDDOLL').asfloat:=QueryWork.Fieldbyname('TW_SKIDDOLL').asfloat;
                MemRNS.fieldByname('OST').asfloat:=QueryWork.Fieldbyname('OST').asfloat;
                MemRNS.fieldByname('FRM_OST').asfloat:=QueryWork.Fieldbyname('FRM_OST').asfloat;
                MemRNS.Fieldbyname('MET_MONEY_SHOP').asstring:=QueryWork.Fieldbyname('MET_MONEY_SHOP').asstring;
                MemRNS.Fieldbyname('RNS_TABEL').asstring:=QueryWork.Fieldbyname('RNS_TABEL').asstring;
                MemRNS.Fieldbyname('TW_NEGABARIT').asstring:=QueryWork.Fieldbyname('TW_NEGABARIT').asstring;

                MemRNS.Fieldbyname('TW_NOSKID').asfloat:=QueryWork.Fieldbyname('TW_NOSKID').asinteger;


                MemRNS.Post;
                CanInsert:=False;
                QueryWork.next;
          end;

     end;


    SALE_DISKONT.text:=DISKONT_NUM;
//*****
    otkr:=1;
    Change_FrmKln(KLN_NAME.Tag,2);
    otkr:=0;
//*****
    Wait_form.hide;

    Refresh_summ;
    Show_Sost;

    //Определить, есть ли предоплаты
    for a := 0 to NAKL_TAB_CTRL.Tabs.Count-1 do
    begin
    	PoTransaction.Active:=false;
	 	  QrListPO.Close;
     	QrListPO.ParamByName('RN_ID').asinteger:=arrRN[a].RN_ID;
     	QrListPO.Open;
        arrRN[a].PO_SUMM := PO_POG_SUMM;

    end;

    QrListPO.Close;




     Wait_form.hide;
     if Doc_SALE.tag<0 then begin
        Timer2.enabled:=true;
        Timer3.enabled:=true;
     end;

    SAVE:=TRUE;
    FormLoad:=false;

    initComplete:=true;
    MAIN_FORM.DISPLAY_SHOW('', '',
          ' добро пожаловатъ','' );

end;

procedure TDOC_SALE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
IS_EDIT_SALE:=FALSE;
end;

procedure TDOC_SALE.RVIDChange(Sender: TObject);
begin
 SAVE:=False;
    if DicShopRvid.FieldByName('RVID_SUBKLN').asinteger=1 then begin
           DicRvidKLN.close;
           DicRvidKLN.ParamByname('RVID_ID').asinteger:=strtoint('0'+RVID.value);
           DicRvidKLN.Open;
           RVIDKLN.Visible:=true;
           if (strtoint('0'+RVIDKLN.value)=0) and (not DicRvidKLN.eof) then begin
              DicRvidKLN.First;
              RVIDKLN.value:=DicRvidKLN.fieldByname('KLN_ID').asstring;
           end;
    end else begin
        RVIDKLN.Visible:=false;
    end;
end;


procedure TDOC_SALE.Change_FrmKln(ID,N:integer);
var
   s1,s2:ansistring;
   kateg:integer;
begin
     {Отображаем название фирмы и банка}
     QueryWork.Close;
     QueryWork.SQL.clear;
     QueryWork.SQL.add('select * FROM KLN_DATA_FRM(:KLN_ID, :FRM_ID)');
     QueryWork.Parambyname('KLN_ID').asinteger:=ID;
     QueryWork.Parambyname('FRM_ID').asinteger:=GL_FRM_WORK_MODE;
     QueryWork.Open;
     s1:='';
     S2:='';
     if not QueryWork.eof then begin
         s1:=QueryWork.fieldbyname('KLN_FULL').asstring;
         s2:=QueryWork.fieldbyname('KLN_REKW').asstring;
     end;
     if N=2 then begin
        KLN_NAME.text:=s1;
        KLN_BNK.text:=s2;
        kln_ktg.Text:=QueryWork.fieldByname('KLN_ktg').asstring;
        if kln_ktg_id<>QueryWork.fieldByname('KLN_ktg_id').asinteger then
        begin
          kln_ktg_id:=QueryWork.fieldByname('KLN_ktg_id').asinteger;
           if initComplete then
            SetKlnPrice(memRNS, kln_ktg_id);
          Refresh_summ;
        end;

        kln_ktg_id:=QueryWork.fieldByname('KLN_ktg_id').asinteger;
        if kln_ktg_id>0 then  //не розница, убрать дисконт
        begin
           btn_nodiscont.Click;
        end;

     end;
     QueryWork.Close;
//************
     if otkr<>1 then
     begin
     if not MemRNS.IsEmpty then
     begin
       memRNS.First;
       MemRNS.DisableControls;
       while not memRNS.Eof do
       begin
         MemRNS.Edit;
         kateg:=Get_napr_kln(MemRNS.Fieldbyname('TW_ID').asinteger);

         MemRNS.Fieldbyname('TW_SKID').asfloat:= (MemRNS.Fieldbyname('TW_MONEY').asfloat- GetTWKtgPrice(MemRNS.Fieldbyname('TW_ID').asinteger,kateg {kln_ktg_id}))*100/MemRNS.Fieldbyname('TW_MONEY').asfloat;
         if ((MemRNS.Fieldbyname('TW_SKID').asfloat < 1e-4) and (MemRNS.Fieldbyname('TW_SKID').asfloat> 0)) then
            MemRNS.Fieldbyname('TW_SKID').asfloat:=0;
         MemRNS.Post;
         MemRNS.Next;
       end;
       memRNS.First;
       MemRNS.EnableControls;
     end;

     Add_SQL(QueryWork,'select valuestr from propkln where kln_id=:kln_id and propkln.typ=:typ');
     QueryWork.ParamByName('kln_id').asinteger:=KLN_NAME.tag;
     case real_typ of
       1: QueryWork.ParamByName('typ').asinteger:=12;
       2: QueryWork.ParamByName('typ').asinteger:=7;
     end;
     QueryWork.Open;
     if not QueryWork.IsEmpty then
       pers_skid:=strtoint(QueryWork.fieldbyname('valuestr').asstring)
     else
       pers_skid:=0;
     QueryWork.Close;
     End;
//************

end;

procedure TDOC_SALE.Btn_ApplyClick(Sender: TObject);
var    	MET:boolean;
		oldid: integer;
        SALE_ID: integer;
        a,b: integer;
        IDR:double;
        oldFilter: boolean;
        rnEmpty: boolean;
        SALE_NUM_FULL: string;
        ID: integer;
        rntyp_short: string;
        shop_prefix: string;
        shop_postfix: string;
        _nds: double;
        _nds_summ: double;
        rns_saved: boolean;
        maxPercent: double;
        save_rvid: integer;
        oldDateFormat: string;

        rozn_money, zak_money: double;
        y,m,d: word;
        h, mm, s, mils: word;
begin
 oldFilter := memrns.filtered;

 if (MemRNS.State in [dsInsert,DsEdit]) then MemRNS.Post;

 if SALE_PROW then
 begin
  messbox('сохранение проведенного документа. Сообщите программисту.', messsystem, 48);
  exit;
 end;

 if RVID.value='' then
 begin
  messbox('Не указан вид реализации!!!', messsystem, 48);
  exit;
 end;
 maxPercent:=0;
if DicShopRvid.FieldByName('RVID_SUBKLN').asinteger=1 then maxPercent:=6; //по платежным картам банков максимальная скидка не более 6%. данную скидку не контролировать
if CheckTWPrice(memRNS, kln_ktg_id, maxPercent)<0 then
     exit;




 _nds := NDS_DATE(SALE_DATE.date);




 begin

  	begin
    	{  Проверяем обоснование скидок на товары}
    	OLDID:=MemRNS.recno;
    	MemRNS.DisableControls;
    	MET:=FALSE;
    	if not SALE_PROW then
    	begin
      		MemRNS.First;
      		while not MemRNS.eof do
      		begin
            	if (MemRNS.fieldByname('TW_SKID').asfloat>0) and (length(MemRNS.fieldByname('SKID_TXT').asstring)=0) then MET:=TRUE;
                if met=true then break;

            	MemRNS.next;
      		end;
    	end;

      if MET then
      begin
          HAT_PAGE_CONTROL.ActivePage:=SKID_TAB_SHEET;
          HAT_PAGE_CONTROL.OnChange(sender);
          Messbox('Все скидки на товары должны быть обоснованными!',MessSystem,48);
      end
      else
 	    begin
     	  	Datamodule1.IBTransaction2.Active:=False;
     	  	Datamodule1.IBTransaction2.StartTransaction;



        try
       		Statusbar1.panels[2].text:='Фаза 1...';

          SHOP_RNTYP_ID:=1;
          //21.06.2007 - создание продажи в кредит
          if strtoint('0'+RVID.value) in [1,2,3,5,6,7] then
            SHOP_RNTYP_ID:=1; //НАЛ
          if (strtoint('0'+RVID.value) = 8) then
            SHOP_RNTYP_ID:=22008; //НАЛКР
          if (strtoint('0'+RVID.value) = 20006) then
            SHOP_RNTYP_ID:=22008; //НАЛКР




          DataModule1.MainDicRnTyp.Locate('RNTYP_ID',SHOP_RNTYP_ID,[]);
     	  RNTYP_SHORT:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_SHORT').asstring;


//отключил авто дисконт 3% по выходным
          if (1 = 0) then
          if (DOC_SALE.tag < 0) then
          begin
            oldDateFormat := ShortDateFormat;
            ShortDateFormat:='dd'+DateSeparator+'mm'+dateseparator+'yyyy';
            decodeDate(date, y, m, d);
             decodetime(time, h, mm, s, mils);
            if (date() < strtodate('01'+DateSeparator+'01'+DateSeparator+'2014')) then
            begin
              if (h=29) or (DayofWeek(Date()) = 1) or ((m = 3) and (d = 8)) or ((m = 2) and (d = 23)) or ((m = 5) and (d = 9)) or ((m = 6) and (d = 12)) or ((m = 1) and (d = 2)) or ((m = 1) and (d = 7)) then        //начало недели - воскресенье
              begin
                 if (strtoint('0'+RVID.Value)<3) then
                 if (DISKONT_ID = 0) then
                 begin
                      DISKONT_NUM:='70045605';
                      DISKONT_ID := 1283615;
                      SALE_SKID.Value :=3;


                      begin
                      {Проставляем дисконт в накладной}
                      KLN_NAME.Tag:=SHOP_KLN_DEFAULT(SHOPID,DEFAULT_RNTYP_KKM);
                      Change_FrmKln(KLN_NAME.Tag,2);
                      SALE_DISKONT.Text:=NEW_DISKONT_NUM;
//                      DISKONT_ID:=NEW_DISKONT_ID;
//                      SALE_SKID.value:=DISKONT_PERCENT;


                      oldID:=memRNS.fieldbyname('tw_id').asinteger;
                      memRNS.DisableControls;
                      memRNS.First;
                      while not memrns.Eof do
                      begin
                        if MemRNS.fieldbyname('TW_SKID').asfloat>0 then
                        begin
                          memrns.Edit;
                          if(MemRNS.Fieldbyname('MET_MONEY_SHOP').asstring='1') then
                            MemRNS.fieldbyname('TW_SKID').asfloat:=0
                          else
                            MemRNS.fieldbyname('TW_SKID').asfloat:=MemRNS.Fieldbyname('TW_SKID_LOAD').asfloat;//0;
              //            MemRNS.fieldbyname('TW_SKID').asfloat:=0;
                          MemRNS.fieldbyname('SKID_TXT').asstring:='';
                          memrns.Post;
                        end;

                        if memRNS.FieldByName('tW_noskid').asinteger=1 then
                         begin
                          memrns.Edit;
                          MemRNS.fieldbyname('TW_SKID').asfloat:=-3;
                          MemRNS.fieldbyname('SKID_TXT').asstring:='На этот товар скидки не действуют';
                          memrns.Post;
                         end
                        else
                        begin

                          rozn_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 0);
                          {
                            06-03-2008
                            по указанию Подвального дисконт не скидывает цену ниже крупного опта
                            08-04-2008
                            по указанию Подвального дисконт не скидывает цену ниже спеццены
                          }
                          zak_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 3);



                          //Если итоговая цена ниже закупки, но при этом товар не распродажный, сделать цену закупочной
                          if zak_money<=rozn_money then
                          begin
                            if MemRNS.fieldbyname('TW_OKMONEY').asfloat<zak_money then
                            begin
                              memrns.Edit;
                              MemRNS.fieldbyname('TW_SKID').asfloat:=(MemRNS.Fieldbyname('TW_OKMONEY').asfloat- zak_money)*100/MemRNS.Fieldbyname('TW_MONEY').asfloat;;
                              MemRNS.fieldbyname('SKID_TXT').asstring:='Слишком большая скидка. Цена увеличена до спеццены';
                              memrns.Post;
                            end;
                          end
                          else  //товар распродажный, заместить скидку на минус
                          begin
                              memrns.Edit;
                              MemRNS.fieldbyname('TW_SKID').asfloat:=-3;
                              MemRNS.fieldbyname('SKID_TXT').asstring:='Скидки по дисконту не действуют на уцененный товар';
                              memrns.Post;
                          end;

                        end;





                         memrns.Next;
                      end;
                      memrns.locate('tw_id', oldID, []);
                      memRNS.EnableControls;

              //        SALE_SKID_TXT.text:='Дисконт по карте № '+NEW_DISKONT_NUM;
                   end;


                  end;

              end;
            end;
            ShortDateFormat:=oldDateFormat;

            Refresh_summ;
          end;





          //шапка продажи.

          IBSAVE_CLEAR;
          Statusbar1.panels[2].text:='Фаза 2...';
          if SALE_NUMS<0 then SALE_NUMS:=NEW_SALE_NUM(SHOP_RNTYP_ID,SALE_DATE.date);
          Statusbar1.panels[2].text:='Фаза 3...';
          IBSAVE_ADD('SALE_NUM',SALE_NUMS);
          IBSAVE_ADD('SALE_PROW',false);
          IBSAVE_ADD('SALE_DATE',strtodatetime(datetostr(SALE_DATE.date)+' '+timetostr(time())));
          IBSAVE_ADD('SHOP_ID',SHOP_ID);
          IBSAVE_ADD('SKL_ID',strtoint(SKL.value));
          IBSAVE_ADD('US_ID',USERID);
          Statusbar1.panels[2].text:='Фаза 4...';
          SALE_ID:=IBSAVE_DOC('SALE',DOC_SALE.tag);
          Statusbar1.panels[2].text:='Фаза 5...';

          if SALE_ID<=0 then IDR:=SQRT(-1);


          begin
            DOC_SALE.tag:=SALE_ID;


            WorkTransaction.Active:=False;
            ADD_SQL(QueryWork,'select SHOP.SHOP_PREFIX,SHOP.SHOP_POSTFIX '+
            'from SHOP where SHOP.SHOP_ID = :SHOP_ID');
            QueryWork.paramByname('SHOP_ID').asinteger:=SHOP_ID;
            QueryWork.open;
            if not QueryWork.eof then
            begin
              shop_prefix :=  QueryWork.fieldByname('SHOP_PREFIX').asstring;
              shop_postfix :=  QueryWork.fieldByname('SHOP_POSTFIX').asstring;
              SALE_NUM_FULL:= QueryWork.fieldByname('SHOP_PREFIX').asstring+
                b_utils.right('0000000000'+inttostr(SALE_NUMS),10)+QueryWork.fieldByname('SHOP_POSTFIX').asstring;
            end;
            Statusbar1.panels[2].text:='Фаза 61...';
            // Фиксируем удаление товаров
            for b:=1 to CNT_DEL do
            begin
              IBSAVE_CLEAR;
              IBSAVE_ADD('DOC','RN');
              IBSAVE_ADD('US_ID',USERID);
              IBSAVE_ADD('SHOP_ID',SHOPID);
              IBSAVE_ADD('MESS',RNS_DEL_MESS[b]);
              IBSAVE_ADD('DOP1',4);
              IBSAVE_ADD('DOP2',RNS_DEL_RN[b]);
              if IBSAVE_DOC('ARCUPDATE',-1)<0 then idr:=sqrt(-1);
              // Удаления отгрузки
              if RNS_DEL_OTG[b]>0 then
              begin
                      IBSAVE_CLEAR;
                      IBSAVE_ADD('DOC','TWRN');
                      IBSAVE_ADD('US_ID',USERID);
                      IBSAVE_ADD('SHOP_ID',SHOPID);
                      IBSAVE_ADD('MESS',RNS_DEL_MESS2[b]);
                      IBSAVE_ADD('DOP1',RNS_DEL_RN[b]);
                      IBSAVE_ADD('DOP2',-RNS_DEL_TW[b]);
                      if IBSAVE_DOC('ARCUPDATE',-1)<0 then idr:=sqrt(-1);
              end;
            end;

            Statusbar1.panels[2].text:='Фаза 6...';
            {Сохраняем содержимое}
            {Сначала удаляем удалённое}
            for b:=1 to CNT_DEL do
            begin
              if RNS_DEL[b]>0 then if not IBDELETE_DOC('RNS',RNS_DEL[b]) then
                  IDR:=SQRT(-1);
            end;
            {Сохраняем имеющееся}

            //сохраняем шапки расходных накладных по этой фирме (пропускаются товары с продавцом=-1)
            for a := 0 to NAKL_TAB_CTRL.Tabs.Count-1 do
            begin
              //Наложить фильтр на список товара. Если список пустой и ID накладной=-1, ее сохранять не надо
              //если в магазине есть фирма, то список не будет отфильтрован, (считается, что будет одна накладная)
              // соответственно, нижняя фильтрация не приведет ни к чему
              memrns.Filtered:=false;
              memrns.tag:=arrRN[a].FRM_ID;
              memrns.Filtered:=true;
              memrns.First;
              if memrns.Eof then 	rnEmpty:=true  else rnEmpty:=false;

              if ((rnEmpty) and (arrRN[a].RN_ID<=0)) then	//не надо ничего сохранять, новая пустая накладная
                continue;




              //Сохранение шапки РН
              IBSAVE_CLEAR;
              Statusbar1.panels[2].text:='Фаза 7...';
              //номер новой накладной должен быть одинаковым
              if RN_NUMS<0 then RN_NUMS:=NEW_RN_NUM(SHOP_RNTYP_ID, 0, SALE_DATE.date);

              Statusbar1.panels[2].text:='Фаза 8...';
              IBSAVE_ADD('RN_NUM',RN_NUMS);
              IBSAVE_ADD('RN_PROW',false);


//сделать проверку - какая фирма продает. если ТК - RNTYP_ID=НАЛНДС!!!
//но если вид реализации - КР - то надо чтобы накладная попала в Кредит

               //IBSAVE_ADD('RNTYP_ID',SHOP_RNTYP_ID);
//сделать проверку - какая фирма продает. если РОЗ - RNTYP_ID=НАЛНДС!!!
//но если вид реализации - КР - то надо чтобы накладная попала в Кредит
               if arrRN[a].FRM_ID=2702542 then
               begin
                if SHOP_RNTYP_ID=22008    //НАЛКР
                then
                  IBSAVE_ADD('RNTYP_ID',2007)
                else
                  IBSAVE_ADD('RNTYP_ID',5);
               end
              else
                IBSAVE_ADD('RNTYP_ID',SHOP_RNTYP_ID);



              IBSAVE_ADD('RNVID_ID',DEFAULT_RNVID);


              IBSAVE_ADD('SKL_ID',strtoint(SKL.value));


              IBSAVE_ADD('RN_DATE',strtodatetime(datetostr(SALE_DATE.date)+' '+timetostr(time())));
              IBSAVE_ADD('RN_SKID',SALE_SKID.value);
              IBSAVE_ADD('RN_SKID_TXT',SALE_SKID_TXT.text);
              IBSAVE_ADD('RN_KURS',SALE_KURS.value);
              IBSAVE_ADD('SHOP_ID',SHOP_ID);
              IBSAVE_ADD('RN_OSN',Memotostr(SALE_OSN.lines));
              IBSAVE_ADD('RN_SUB','Продажа №'+SALE_NUM_FULL);

              IBSAVE_ADD('RN_GP',RN_GP.text);
              IBSAVE_ADD('RN_WHO',SALE_WHO.text);
              IBSAVE_ADD('KLN_ID',KLN_NAME.Tag);
              IBSAVE_ADD('US_ID',USERID);
              IBSAVE_ADD('FRM_ID',arrRN[a].FRM_ID);
              if arrRN[a].FRM_ID=2702542 then
                IBSAVE_ADD('NDS',18)
                else
              IBSAVE_ADD('NDS',0);
              IBSAVE_ADD('NP',NP.value);
              IBSAVE_ADD('RN_DOST',SALE_DOST.checked);
              if SALE_DOST.checked then IBSAVE_ADD('DOST_DATE',DOST_DATE.date);
              IBSAVE_ADD('RN_KKM',0);
              IBSAVE_ADD('VALUTA_ID',SALE_VALUTA.value);
              IBSAVE_ADD('CARD_ID',DISKONT_ID);

              //отдельный вид реализации для Гефест в Олимп7, Олимп4 (УСН)
              save_rvid:=strtoint('0'+RVID.value);

{              if ((arrRN[a].FRM_ID=2669809) and (SHOP_ID in [5,14,10])) then
              begin
                case save_rvid of
                1: save_rvid:=21009;
                2: save_rvid:=21010;
                3: save_rvid:=21011;
                20006: save_rvid:=20006;
                end;
              end;
}
{              if ((arrRN[a].FRM_ID<>2669809) and (SHOP_RNTYP_ID=1))then
              begin
                case save_rvid of
                21009: save_rvid:=1;
                21010: save_rvid:=2;
                21011: save_rvid:=3;
                20006: save_rvid:=20006;
                end;
              end;

}






              IBSAVE_ADD('RVID_ID',save_rvid);
              if RVIDKLN.Visible then IBSAVE_ADD('RVID_KLN',strtoint('0'+rvidkln.value));
                                                                      Statusbar1.panels[2].text:='Фаза 9...';
              arrRN[a].RN_ID:=IBSAVE_DOC('RN',arrRN[a].RN_ID);
              if arrRN[a].RN_ID<=0 then IDR:=SQRT(-1);




              Statusbar1.panels[2].text:='Фаза 10...';

              // Шапка сохранена, записать ее в список SALES
              IBSAVE_CLEAR;
              IBSAVE_ADD('SALE_ID',DOC_SALE.tag);
              IBSAVE_ADD('RN_ID',arrRN[a].RN_ID);
              arrRN[a].SALES_ID:=IBSAVE_DOC('SALES',arrRN[a].SALES_ID);
              if arrRN[a].SALES_ID<0 then IDR:=SQRT(-1);
              //Фиксируем РН, основанные на этой продаже
              if (arrRN[a].RN_NUMS<0) then
              begin
                IBSAVE_CLEAR;
                IBSAVE_ADD('DOC','SALE');
                IBSAVE_ADD('US_ID',USERID);
                IBSAVE_ADD('SHOP_ID',SHOP_ID);
                IBSAVE_ADD('MESS','На основании продажи создана РН '+arrRN[a].FRM_PREFIX+' №'+RNTYP_SHORT + SHOP_PREFIX+inttostr(RN_NUMS)+SHOP_POSTFIX);
                IBSAVE_ADD('DOP1',2);
                IBSAVE_ADD('DOP2',DOC_SALE.tag);
                if IBSAVE_DOC('ARCUPDATE',-1)<0 then idr:=sqrt(-1);
              end;

              //Сохранить список товаров (удаление было выше)
              //Перед сохранением надо определить, в какую накладную попадут товары с продавцом=-1
              memrns.Filtered:=false;



              memrns.tag:=arrRN[a].FRM_ID;
              memrns.Filtered:=true;
              memrns.First;
              {Сохраняем имеющееся}
              MemRNS.First;
              while not MemRNS.eof do
              begin
               //Сохраняем в списке товаров ID накладной, к которой он приписан
               memRNS.Edit;
               memRNS.FieldByName('RN_ID').asinteger:=arrRN[a].RN_ID;
               memRNS.Post;
               //Сохранение в самой РН
               IBSAVE_CLEAR;
               IBSAVE_ADD('RN_ID',arrRN[a].RN_ID);

               IBSAVE_ADD('RNS_TABEL',MemRNS.fieldbyname('RNS_TABEL').asinteger);
               IBSAVE_ADD('TW_ID',MemRNS.fieldbyname('TW_ID').asinteger);
               IBSAVE_ADD('TW_KOL',MemRNS.fieldbyname('TW_KOL').asfloat);

               IBSAVE_ADD('TW_MONEY',OKRUG(MemRNS.fieldbyname('TW_MONEY').asfloat,2));
               IBSAVE_ADD('TW_SKID',MemRNS.fieldbyname('TW_SKID').asfloat);
               IBSAVE_ADD('TW_SKIDDOLL',MemRNS.fieldbyname('TW_SKIDDOLL').asfloat);
               IBSAVE_ADD('TW_MONEY2',OKRUG(MemRNS.fieldbyname('TW_MONEY').asfloat,2));
               IBSAVE_ADD('TYP_MONEY2',0);
               IBSAVE_ADD('SKID_TXT',MemRNS.fieldbyname('SKID_TXT').asstring);

               //Отгрузки. Если свой склад - все отгрузить, если чужой - сколько в memRNS
               //автоматическая отгрузка со стройдвор
               if MemRNS.fieldbyname('RNS_ID').asinteger<0 then //новая запись
                begin
                    if ((((strtoint(SKL.Value)=SHOP_DEFAULT_SKLAD) or ( ((SKL.Value = '1322017') or (SKL.value = '25')) and (SHOP_ID=14)))) and not (SALE_DOST.Checked))  then

                    begin
                      //сразу отгрузить
                        IBSAVE_ADD('OTG_KOL',MemRNS.fieldbyname('TW_KOL').asfloat);
                        IBSAVE_ADD('OTG_US',USERID);
                        IBSAVE_ADD('OTG_DATE',NOW());
                    end
                    else
                    begin
                      begin
                         IBSAVE_ADD('OTG_KOL',0);
                         IBSAVE_ADD('OTG_US',0);
                         IBSAVE_ADD('OTG_DATE',NOW());
                      end
                    end




                end
                else ;      //запись старая, ничего не менять
//                 IBSAVE_ADD('OTG_KOL',MemRNS.fieldbyname('OTG_KOL').asfloat);



               ID:=IBSAVE_DOC('RNS',MemRNS.fieldbyname('RNS_ID').asinteger); //удалили накладную, создается новая накладная - надо в memrns указать что rns_id=-1 !!!!!!!!!! иначе сохраняется в пустоту
               if ID<0 then IDR:=SQRT(-1);

               if (arrRN[a].RN_NUMS>0) and (MemRNS.fieldbyname('RNS_ID').asinteger<0) then
               begin
                  // Фиксируем факт добавления товара
                  IBSAVE_CLEAR;
                  IBSAVE_ADD('DOC','RN');
                  IBSAVE_ADD('US_ID',USERID);
                  IBSAVE_ADD('SHOP_ID',SHOPID);
                  IBSAVE_ADD('MESS','Добавлен товар: '+MemRNS.Fieldbyname('TW_ART').asstring+' '+
                  MemRNS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemRNS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
                  MemRNS.Fieldbyname('ED_SHORT').asstring+' по цене '+floattostrf(MemRNS.Fieldbyname('TW_OKMONEY').asfloat,fffixed,19,2));
                  IBSAVE_ADD('DOP1',2);
                  IBSAVE_ADD('DOP2',arrRN[a].RN_ID);
                  if IBSAVE_DOC('ARCUPDATE',-1)<0 then idr:=sqrt(-1);
               end;



                //вверх
                MemRNS.Edit;
                MemRNS.fieldbyname('RNS_ID').asinteger:=ID;
                MemRNS.Post;

                MemRNS.next;
              end;

                arrRN[a].RN_NUMS:=RN_NUMS;
            end;  //сохраняем шапки расходных накладных по этой фирме

            memrns.Filtered:=false;


          end;


          {Всё прошло нормально - изменяем временные данные}
          {Отображаем номер}
          Doc_SALE.tag:=SALE_ID;
          SALE_NUM.text:=inttostr(SALE_NUMS);
                      if arrRN[NAKL_TAB_CTRL.tabindex].RN_NUMS <0 then
                      RN_NUM.Text:='Новая'
          else RN_NUM.Text:= inttostr(arrRN[NAKL_TAB_CTRL.tabindex].RN_NUMS);



          MemRNS.First;

          while not MemRNS.eof do
          begin

            if MemRNS.fieldbyname('RNS_ID').asinteger<0 then begin
              MemRNS.Edit;
              MemRNS.fieldbyname('RNS_ID').asinteger:=-MemRNS.fieldbyname('RNS_ID').asinteger;
              MemRNS.Post;
            end;
            MemRNS.next;
          end;
          SAVE:=TRUE;
          CNT_DEL:=0;
          Datamodule1.IBTransaction2.Commit;
          Show_sost;
        except
          on e: Exception do
          begin
            Datamodule1.IBTransaction2.Rollback;
            Messbox('Ошибка при сохранении продажи. '+chr(10)+e.message,MessSystem,48);
          end;
    		end;
            Datamodule1.IBTransaction2.Active:=False;
      end;


        //Возвращаем к прежнему виду
  		memrns.tag:=arrRN[NAKL_TAB_CTRL.tabindex].FRM_ID;
  		memrns.filtered:=oldfilter;
      MemRNS.First;
    	for a:=1 to OLDID-1 do MemRNS.next;
 	end;


  MemRNS.EnableControls;
  Statusbar1.panels[2].text:='';
 end;
end;


procedure TDOC_SALE.SKLChange(Sender: TObject);
var prev_skl_from_frm: integer;
begin

  save:=false;
  skl_frm := IBSkl.fieldbyname('skl_frm').asinteger;
  Btn_RefreshOstClick(nil);
  show_sost;

  if ((doc_sale.tag>0) and (not FormLoad)) then
    messbox('Вы изменили склад у уже сохраненной продажи. '+chr(13)+'После проводки продажи проверьте отгрузку по расходным накладным, сделанным на основании данной продажи.', MessSystem, 0);



end;


procedure TDoc_Sale.Show_sost;
var
   s:ansistring;
   SaleEmpty:boolean;
   i: integer;
begin
     if Doc_SALE.Tag<0 then
       Doc_SALE.caption:='Продажа. Новая'
     else begin
          if SALE_PROW then
            Doc_SALE.caption:='Продажа. Просмотр'
          else
            Doc_SALE.caption:='Продажа. Редактирование';
     end;
     if MemRNS.RecordCount=0 then SaleEmpty:=true else SaleEmpty:=false;

     if Timer1.Enabled then s:='Ввод дисконта...' else begin
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
     end;
     StatusBar1.Panels[0].text:='Состояние: '+s;
     if not Timer1.enabled then
     	StatusBar1.Panels[1].text:=STR;
     Btn_NODISCONT.enabled:=(not SALE_PROW) and (not SaleEmpty);
     Btn_Prow.enabled:=(not SALE_PROW) and (not SaleEmpty);
     MnProw.enabled:=(not SALE_PROW) and (not SaleEmpty);
     Btn_UnProw.enabled:=(SALE_PROW) and (not SaleEmpty);
     MnUnProw.enabled:=(SALE_PROW) and (not SaleEmpty);
     Btn_SAVE.enabled:=(not SALE_PROW) and (not SaleEmpty);
     MnSAVE.enabled:=(not SALE_PROW) and (not SaleEmpty);
     ActRnToPo.enabled:=(not SaleEmpty) and (DOC_SALE.tag>0) and Can_create_PO;
     ActRnToStorno.enabled:=(not SaleEmpty) and (DOC_SALE.tag>0) and SALE_PROW;

     RxDbgrid1.ReadOnly:=SALE_PROW;

     Btn_ALLSKID.enabled:=(not SALE_PROW) and (not SaleEmpty);
     ONE_SKID.enabled:=(not SALE_PROW) and (not SaleEmpty);
     MnSEt_SKid.enabled:=(not SaleEmpty) and (not SALE_PROW);
     Btn_Apply.enabled:=(not SALE_PROW) and (not SaleEmpty);
     MnApply.enabled:=(not SALE_PROW) and (not SaleEmpty);
     Btn_Print.enabled:=not SaleEmpty;
     PrintTwCheckFast.enabled:=not SaleEmpty;
     PrintTwCheck.enabled:=not SaleEmpty;
     MnPrint.enabled:=not SaleEmpty;
     Btn_PrintKKM.enabled:=not SaleEmpty and GlCanKKM ;
     MnPrintKKM.enabled:=not SaleEmpty and GlCanKKM;
     Btn_Propertis.enabled:=true;
     MnHistory.enabled:=true;
     Btn_RefreshOst.enabled:=(not SaleEmpty) and (not SALE_PROW);
     MnRefreshOst.enabled:=(not SaleEmpty) and (not SALE_PROW);
     Btn_SubDoc.enabled:=not SaleEmpty;
     Btn_DicTow.enabled:=(not SALE_PROW);
     MnTw.enabled:= (not SALE_PROW);
     Btn_DelTow.enabled:=(not SaleEmpty) and (not SALE_PROW);
     MnDel.enabled:=(not SaleEmpty) and (not SALE_PROW);
     Btn_OST.enabled:=(not SaleEmpty) and (not SALE_PROW);
     MnOST.enabled:=(not SaleEmpty) and (not SALE_PROW);
     Btn_DETAL.enabled:=not SaleEmpty and CANTW_DETAL;
     MnDETAL.enabled:=not SaleEmpty and CANTW_DETAL;
     Btn_Analiz.enabled:=not SaleEmpty and CANTW_ANALIZ;
     MnAnaliz.enabled:=not SaleEmpty and CANTW_ANALIZ;
     Btn_Marketing.enabled:=not SaleEmpty and CANTW_MARKETING;
     MnMarketing.enabled:=not SaleEmpty and CANTW_MARKETING;
     Btn_PrintCenn.enabled:=not SaleEmpty;
     MnCenn.enabled:=not SaleEmpty;
     Btn_PrintCennMore.enabled:=not SaleEmpty;
     MnCennMore.enabled:=not SaleEmpty;



     BTN_KLN.enabled:= (not SALE_PROW);
     MnKLN.enabled:= (not SALE_PROW);
//     NP.enabled:= (not SALE_PROW);

 //    NDS.enabled:= (not SALE_PROW);

     SALE_DATE.enabled:= (not SALE_PROW);

     SALE_OSN.enabled:= (not SALE_PROW);
     RN_GP.enabled:= (not SALE_PROW);     
     SALE_WHO.enabled:= (not SALE_PROW);
     SKL.enabled:= (not SALE_PROW);// and not (self.tag > 0);



     SALE_DOST.enabled:= (not SALE_PROW);
     DOST_DATE.enabled:= (not SALE_PROW);
     RVID.enabled:= (not SALE_PROW);
     RVIDKLN.enabled:= (not SALE_PROW);
     Tabel.enabled:=(not SALE_PROW);
     Btn_tabel.enabled:=(not SALE_PROW) and (not SaleEmpty);
     ActNewPO.enabled:=not SALE_PROW;
     ActOpenPO.enabled:=not SALE_PROW;
     ActDelPo.enabled:=(not QrListPO.eof) AND (not SALE_PROW);
     PrintRndRear.Enabled:=not SaleEmpty;

     ToolButton22.Enabled:= not SaleEmpty ;
     ToolButton23.Enabled:= not SaleEmpty ;
     ToolButton24.Enabled:= not SaleEmpty ;
     ToolButton26.Enabled:= not SaleEmpty ;

end;


procedure TDOC_SALE.Timer1Timer(Sender: TObject);
var
   NEW_DISKONT_ID:integer;
   DISKONT_PERCENT:double;
   NEW_KLN_ID:integer;
   NEW_KLN_FULL:ansistring;
   summ: double;
   oldID: integer;
   rozn_money, zak_money: double;
begin
   Try
     Timer1.Enabled:=False;
     Statusbar1.panels[1].text:='';
     {Определяем ID дисконтной карты}

     summ := SaleSumm;
     NEW_DISKONT_ID:=GET_DISKONT(NEW_DISKONT_NUM,DISKONT_PERCENT,NEW_KLN_ID,NEW_KLN_FULL, false, true, summ);

        if (NEW_DISKONT_NUM='70048150') then
        self.cbSkidNoPrint.Checked:=true;

     if NEW_DISKONT_ID>0 then begin
        {Проставляем дисконт в накладной}
        KLN_NAME.Tag:=SHOP_KLN_DEFAULT(SHOPID,DEFAULT_RNTYP_KKM);
        Change_FrmKln(KLN_NAME.Tag,2);
        SALE_DISKONT.Text:=NEW_DISKONT_NUM;
        DISKONT_ID:=NEW_DISKONT_ID;
        SALE_SKID.value:=DISKONT_PERCENT;


        oldID:=memRNS.fieldbyname('tw_id').asinteger;
        memRNS.DisableControls;
        memRNS.First;
        while not memrns.Eof do
        begin
          if MemRNS.fieldbyname('TW_SKID').asfloat>0 then
          begin
            memrns.Edit;
            if(MemRNS.Fieldbyname('MET_MONEY_SHOP').asstring='1') then
              MemRNS.fieldbyname('TW_SKID').asfloat:=0
            else
              MemRNS.fieldbyname('TW_SKID').asfloat:=MemRNS.Fieldbyname('TW_SKID_LOAD').asfloat;//0;
//            MemRNS.fieldbyname('TW_SKID').asfloat:=0;
            MemRNS.fieldbyname('SKID_TXT').asstring:='';
            memrns.Post;
          end;

          if memRNS.FieldByName('tW_noskid').asinteger=1 then
           begin
            memrns.Edit;
            MemRNS.fieldbyname('TW_SKID').asfloat:=-DISKONT_PERCENT;
            MemRNS.fieldbyname('SKID_TXT').asstring:='На этот товар скидки не действуют';
            memrns.Post;
           end
          else
          begin

            rozn_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 0);
            {
              06-03-2008
              по указанию Подвального дисконт не скидывает цену ниже крупного опта
              08-04-2008
              по указанию Подвального дисконт не скидывает цену ниже спеццены
            }
            zak_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 3);



            //Если итоговая цена ниже закупки, но при этом товар не распродажный, сделать цену закупочной
            if zak_money<=rozn_money then
            begin
              if MemRNS.fieldbyname('TW_OKMONEY').asfloat<zak_money then
              begin
                memrns.Edit;
                MemRNS.fieldbyname('TW_SKID').asfloat:=(MemRNS.Fieldbyname('TW_OKMONEY').asfloat- zak_money)*100/MemRNS.Fieldbyname('TW_MONEY').asfloat;;
                MemRNS.fieldbyname('SKID_TXT').asstring:='Слишком большая скидка. Цена увеличена до спеццены';
                memrns.Post;
              end;
            end
            else  //товар распродажный, заместить скидку на минус
            begin
                memrns.Edit;
                MemRNS.fieldbyname('TW_SKID').asfloat:=-DISKONT_PERCENT;
                MemRNS.fieldbyname('SKID_TXT').asstring:='Скидки по дисконту не действуют на уцененный товар';
                memrns.Post;
            end;

          end;





           memrns.Next;
        end;
        memrns.locate('tw_id', oldID, []);
        memRNS.EnableControls;

//        SALE_SKID_TXT.text:='Дисконт по карте № '+NEW_DISKONT_NUM;
     end;
     NEW_DISKONT_NUM:='';
     Refresh_summ;
     Show_SOST;


   Except
   End;
end;


function tDoc_SALE.RNSumm(SALER_ID: integer): double;
var
   a,ID:integer;
   Summ:Double;
begin
     {
     Сумму считаем:
     1 - если SHOP_FRM > 0 - то по всем товарам (без учета продавца)
     }
	   result := 0;
     if MemRNS.RecordCount>0 then
     begin
         ID:=MemRNS.RecNo;
         MemRNS.DisableControls;
         MemRNS.First;
         Summ:=0;
         while not MemRNS.eof do begin
			    if (((MemRNS.fieldbyname('SALER_ID').asinteger = SALER_ID) or (shop_frm>0)) or (MemRNS.fieldbyname('SALER_ID').asinteger=-1)) then
               		SUMM:=SUMM+MemRNS.fieldbyname('TW_KOL').asfloat*MemRNS.fieldbyname('TW_OKMONEY').asfloat;

               MemRNS.next;
         end;
         MemRNS.First;
         for a:=1 to ID-1 do MemRNS.next;
         MemRNS.EnableControls;
         result := summ;
     end;
end;


function tDoc_SALE.SaleSumm: double;
var
   a,ID:integer;
   Summ:Double;
   oldFiltered : boolean;
begin
	 result := 0;
     oldFiltered := memrns.Filtered;

     memrns.Filtered:=false;

     if MemRNS.RecordCount>0 then
     begin
         ID:=MemRNS.RecNo;
         MemRNS.DisableControls;
         MemRNS.First;
         Summ:=0;
         while not MemRNS.eof do begin
               SUMM:=SUMM+MemRNS.fieldbyname('TW_KOL').asfloat*MemRNS.fieldbyname('TW_OKMONEY').asfloat;
               MemRNS.next;
         end;
         MemRNS.First;
         for a:=1 to ID-1 do MemRNS.next;
         MemRNS.EnableControls;
         result := summ;
     end;

     memrns.Filtered:=oldFiltered;
end;

Procedure TDoc_SALE.Refresh_summ;
var
   a,ID:integer;
   Summ:Double;
   Weight: double;
   oldfiltered: boolean;
begin
     oldFiltered := memrns.Filtered;

     memrns.Filtered:=false;
     if MemRNS.RecordCount=0 then
     begin
        SALE_SUMM.Value:=0;
        SALE_WEIGHT.Value:=0;
        NDS.ReadOnly:=false;

     end
     else begin
         CalcDostCost();


         ID:=MemRNS.RecNo;
         MemRNS.DisableControls;
         MemRNS.First;
         Summ:=0;
         Weight:=0;
         while not MemRNS.eof do begin
               SUMM:=SUMM+MemRNS.fieldbyname('TW_SUMM').asfloat;
               WEIGHT:=WEIGHT+MemRNS.fieldbyname('RNS_WEIGHT').asfloat;
               MemRNS.next;
         end;
         MemRNS.First;
         for a:=1 to ID-1 do MemRNS.next;
         MemRNS.EnableControls;
         SALE_SUMM.Value:=SUMM;
         SALE_WEIGHT.Value:=WEIGHT;
         NDS.ReadOnly:=true;

     end;
     memrns.Filtered:=oldFiltered;
     try
     RN_SUMM.Value := Rnsumm(arrRN[NAKL_TAB_CTRL.tabindex].FRM_ID);
     except
     end;

  MAIN_FORM.DISPLAY_SHOW(memrns.fieldbyname('TW_NAM').asstring,
          formatfloat('0.00', memrns.fieldbyname('TW_OKMONEY').asfloat)+'р',
          'ИТОГО: ', formatfloat('0.00', sale_summ.value) + 'р');
     



end;


procedure TDOC_SALE.CalcDostCost();
var weight1, weight2: double;
	s: string;
    ID, a: integer;
    found: boolean;
    baseprice1, baseprice2: double;
    price1, price2: double;
    id1, id2: integer;

begin
  exit;
	if SALE_PROW then
		exit;
  if DOC_SALE.Visible then begin
     s:=Doc_SALE.caption;
     Doc_SALE.caption:=Doc_SALE.caption+'. Чтение остатков товаров';
     if MemRNS.RecordCount>0 then begin
         ID:=MemRNS.RecNo;
         MemRNS.DisableControls;
         MemRNS.First;

         weight1:=0;
         weight2:=0;


         found := ((MemRNS.Locate('TW_ART',3,[])) or MemRNS.Locate('TW_ART',4,[]));	//негабаритный товар, габаритный товар
         if found then
         begin
          MemRNS.First;
          while not MemRNS.eof do begin
			   if ( MemRNS.fieldByname('TW_NEGABARIT').asstring)='1'
               	then
                	weight2:=weight2+MemRNS.fieldbyname('RNS_WEIGHT').asfloat
                else
                	weight1:=weight1+MemRNS.fieldbyname('RNS_WEIGHT').asfloat;
               MemRNS.next;
          end;

//          if weight1 > 0 then
          begin
           baseprice1:=1.0;

           if MemRNS.Locate('TW_ART',4,[]) then
             begin
              try

              datamodule1.IBTransaction1.Active:=true;
              datamodule1.IbSaveSQL.SQL.Text:='SELECT MONEY FROM TW_MROZ(:TW_ID, :SHOP_ID)';
              datamodule1.IbSaveSQL.parambyname('TW_ID').asinteger:=MemRNS.fieldByName('TW_ID').asinteger;
              datamodule1.IbSaveSQL.parambyname('SHOP_ID').asinteger:=SHOPID;
              datamodule1.IbSaveSQL.Open;
              baseprice1:=datamodule1.IbSaveSQL.Fieldbyname('MONEY').asfloat;
              datamodule1.IbSaveSQL.close;
              datamodule1.IBTransaction1.commit;
              except
              datamodule1.IBTransaction1.Rollback;
              end;
              datamodule1.IBTransaction1.Active:=false;

              price1 := baseprice1*weight1;
              MEMRNS.Edit;
              if MEMRNS.FieldByName('TW_MONEY').asfloat <> price1 then SAVE:=FALSE;

              MEMRNS.FieldByName('TW_MONEY').asfloat := price1;
              MEMRNS.Post;
             end;
          end;
//          if weight2 > 0 then
          begin
           baseprice2:=1.3;
           if MemRNS.Locate('TW_ART',3,[]) then
             begin
              try
              datamodule1.IBTransaction1.Active:=true;
              datamodule1.IbSaveSQL.SQL.Text:='SELECT MONEY FROM TW_MROZ(:TW_ID, :SHOP_ID)';
              datamodule1.IbSaveSQL.parambyname('TW_ID').asinteger:=MemRNS.fieldByName('TW_ID').asinteger;
              datamodule1.IbSaveSQL.parambyname('SHOP_ID').asinteger:=SHOPID;
              datamodule1.IbSaveSQL.Open;
              baseprice2:=datamodule1.IbSaveSQL.Fieldbyname('MONEY').asfloat;
              datamodule1.IbSaveSQL.close;
              datamodule1.IBTransaction1.commit;
              except
              datamodule1.IBTransaction1.Rollback;
              end;
              datamodule1.IBTransaction1.Active:=false;
              price2 := baseprice2*weight2;

              MEMRNS.Edit;
              if MEMRNS.FieldByName('TW_MONEY').asfloat <> price2 then SAVE:=FALSE;
              MEMRNS.FieldByName('TW_MONEY').asfloat := price2;
              MEMRNS.Post;
             end;
          end;
         end;



         MemRNS.First;
         for a:=1 to ID-1 do MemRNS.next;
         MemRNS.EnableControls;
     end;
     Doc_SALE.caption:=s;
  end;
end;

procedure TDOC_SALE.Timer2Timer(Sender: TObject);
begin
    Timer2.enabled:=False;
    Timer3.enabled:=False;
    TABEL.color:=clWindow;
    TABEL.Font.color:=clWindowText;
end;

procedure TDOC_SALE.Timer3Timer(Sender: TObject);
begin
   if Timer2.enabled then begin
     if TABEL.color=clWindow then begin
        TABEL.color:=clBlue;
        TABEL.Font.color:=clWhite;
     end else begin
        TABEL.color:=clWindow;
        TABEL.Font.color:=clWindowText;
     end;
   end else begin
      TABEL.color:=clWindow;
      TABEL.Font.color:=clWindowText;
   end;
end;

procedure TDOC_SALE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (sost=1) and (key=46) and Btn_DelTOW.enabled then Btn_DelTOW.click;
     if (key=113) and (Btn_DETAL.enabled) then Btn_DETAL.click; {F2}
     if (key=114) and (Btn_ANALIZ.enabled) then Btn_ANALIZ.click; {F3}
     if (key=115) and (Ssshift in Shift) and (Btn_MARKETING.enabled) then Btn_MARKETING.click; {F4}
     if (key=120) then begin {F9}
        key:=0;
        if Btn_Print.enabled then begin
          Application.createForm(TSelect_Print,Select_Print);
          Select_Print.Button1.caption:='Напечатать расходную накладную';
          Select_Print.Button2.caption:='Напечатать Ценник на выбранный товар';
          Select_Print.Button3.caption:='Напечатать Ценники на все товары в счёте';
          Select_Print.Button4.caption:='Напечатать Кассовый чек';
          Select_Print.showModal;
          if Select_Print.tag>0 then begin
             if (Btn_Print.Enabled) and (Select_Print.tag=1) then Btn_Print.click;
             if (Btn_PrintCenn.Enabled) and (Select_Print.tag=2) then Btn_PrintCenn.click;
             if (Btn_PrintCennMore.Enabled) and (Select_Print.tag=3) then Btn_PrintCennMore.click;
             if (Btn_PrintKKM.Enabled) and (Select_Print.tag=4) then Btn_PrintKKM.click;
          end;
          Select_Print.Destroy;
        end;
     end;
     if (key=123) and (Btn_Propertis.enabled) then Btn_Propertis.click; {F12}
     if (key=192) and (ssCtrl in Shift) and (Btn_refreshOst.enabled) then begin
        key:=0;
        Btn_RefreshOst.click;
     end;

     if (key=13) and (ssCtrl in Shift) and (Btn_Save.enabled) then begin
        key:=0;
        try
          KLN_NAME.setfocus;
        except
        end;
        if BTN_SAVE.enabled then Btn_SAVE.click;
     end;
end;

procedure TDOC_SALE.FormKeyPress(Sender: TObject; var Key: Char);
var
   ID:integer;
   N:integer;
begin
  if ((key='%') or (key=';') and (not SALE_PROW)) then begin
     NEW_DISKONT_NUM:='';
     Timer1.enabled:=True;
  end;

  if Timer1.enabled then begin
     if key=#13 then begin
        key:=#0;
        Timer1.Enabled:=False;
        Timer1.OnTimer(Sender);
     end;
     if key in ['0'..'9'] then begin
         NEW_DISKONT_NUM:=NEW_DISKONT_NUM+KEY;
         key:=#0;
     end;
     Statusbar1.panels[1].text:=NEW_DISKONT_NUM;

     key:=#0;
  end
  else
  begin
     if (key='*') and (sost=0) then begin
        sost:=1;
        key:=#0;
        STR:='';
     end else
     if (key='*') and (sost=1) then begin
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
              key:=#0;
              if length(STR)>0 then begin
                 {Добавляем строку}
                 Query1Transaction.Active:=False;
                 IBQuery1.close;
                 IBQuery1.SQL.clear;
                 IBQuery1.SQL.add('select TW_ID from TW where TW_ART=:TW_ART and TW_BRAK=:TW_BRAK');
                 if B_utils.left(STR,1)='Б' then begin
                    N:=strtoint(B_Utils.right(STR,length(STR)-1));
                    IBQuery1.ParamByname('TW_ART').asinteger:=N;
                    IBQuery1.ParamByname('TW_BRAK').asstring:='1';
                 end else begin
                    N:=strtoint(STR);
                    IBQuery1.ParamByname('TW_ART').asinteger:=N;
                    IBQuery1.ParamByname('TW_BRAK').asstring:='0';
                 end;
                 IBQuery1.Open;
                 if not IBQuery1.eof then begin
                    ID:=IBQuery1.fieldbyname('TW_ID').asinteger;
                    ADD_RNS(ID,-1);
                    Refresh_summ;
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
  end;
  Show_Sost;
end;

function TDoc_Sale.Get_napr_kln(TW_ID:integer): integer;
var kateg:integer;
begin
       Add_SQL(QueryWork2,'select kln_napr.twgroup_id, kln_napr.skid_kat as skid '+
                       'from kln_napr, tw, twtree '+
                       'where kln_napr.kln_id=:kln_id and tw.tw_id=:tw_id '+
                        'and tw.twtree_id=twtree.twtree_id '+
                        'and kln_napr.typ_kln in (:typ, 0) '+
                        'and twtree.parents_ids containing ''%''||kln_napr.twgroup_id||''%''');
       QueryWork2.ParamByName('kln_id').asinteger:=kln_name.tag;
       QueryWork2.ParamByName('typ').asinteger:=real_typ;
       QueryWork2.ParamByName('tw_id').asinteger:=TW_ID;
       QueryWork2.Open;
       if QueryWork2.IsEmpty then
       begin
         kateg:=kln_ktg_id;
         MemRNS.FieldByName('napr').asinteger:=0;
         MemRNS.FieldByName('ktg').asinteger:=kln_ktg_id;
       end
       else
       begin
         kateg:=0;
         while not QueryWork2.Eof do
         begin
           if kateg<QueryWork2.FieldByName('skid').asinteger then
           begin
             kateg:=QueryWork2.FieldByName('skid').asinteger;
             MemRNS.FieldByName('ktg').asinteger:=kateg;
           end;
           QueryWork2.Next;
         end;
         MemRNS.FieldByName('napr').asinteger:=1;
       end;
  result:=kateg;
  QueryWork2.Close;
end;

procedure TDoc_SALE.ADD_RNS(TW_ID:integer;KOL:double);
var
   TW_TEMP,kateg,pers:integer;
   TW_STR:ansistring;
   ISS:boolean;
   VALUTA_ID:integer;
   KURS1,KURS2:double;
   nds_error: boolean;
   SALE_EMPTY: boolean;
   first_tw_saler: INTEGER;
   fq: FastQuery;
   bNoSkid: boolean;
   klnKtgName: string;
   rozn_money, spez_money, zak_money: double;
   y,m,d: word;
   h,mm,s, mils: word;

begin
    begin


     DOC_PAGE_CONTROL.ActivePageIndex:=0;
     MemRNS.Filtered:=false;

     Application.ProcessMessages;

     nds_error := false;
     FIRST_TW_SALER:=-1;
     TW_TEMP:=0;

     if KOL > 1000 then
      KOL := 1000;



     decodeDate(date, y, m, d);
     decodetime(time, h, mm, s, mils);
     if chkShowOst.Checked then
     if sale_skid.Value > 0 then
     begin
        if  (h=29) or (DayofWeek(Date()) = 1) or ((m = 3) and (d = 8)) or ((m = 2) and (d = 23)) or ((m = 5) and (d = 9)) or ((m = 6) and (d = 12)) or ((m = 1) and (d = 2)) or ((m = 1) and (d = 7)) and (DISKONT_NUM='70045605') then        //начало недели - воскресенье
        begin
        end
        else
        begin
             	if not (Messbox('При изменении накладной дисконт будет аннулирован.'+#13+#10+'Продолжить?',MessSubmit,4+48+256)=6) then exit;
             	btn_nodiscont.Click;
        end;
     end;
     {Проверяем, нет ли в накладной уже такого товара. И еще проверяем что накладная не пустая и товар приписан к какому то продавцу}
     if MemRNS.RecordCount>0 then TW_TEMP:=MemRNS.fieldByname('TW_ID').asinteger;
     ISS:=false;
     MemRNS.Disablecontrols;
//to do disble filtering

     MemRNS.first;
     if memrns.Eof then
      SALE_EMPTY:=true
     else SALE_EMPTY:=false;




     while (not MemRNS.eof) and (not ISS) do begin
           if MemRNS.fieldByname('TW_ID').asinteger=TW_ID then begin
              ISS:=true;
              TW_STR:=MemRNS.fieldByname('TW_ART').asstring+'-'+MemRNS.fieldByname('TW_NAM').asstring;
           end;
           if FIRST_TW_SALER<0 then
            FIRST_TW_SALER:=MEMRNS.FIELDBYNAME('saler_id').ASinteger;

           MemRNS.next;
     end;
     MemRNS.EnableControls;
     if ISS  then Messbox('Накладная уже содержит товар '+TW_STR+' и он не может быть добавлен!',MessSystem,48)
     else
     begin
          SAVE:=False;


          fq:=FastQuery.Create('select count(*) cnt from twmonshop where tw_id=:tw_id and shop_id=:shop_id');
          fq.ParamByName('tw_id').asinteger:=tw_id;
          fq.ParamByName('shop_id').asinteger:=SHOPID;
          fq.Open;
          if fq.FieldByName('cnt').asinteger>0 then
              bNoSkid:=true
          else
              bNoSkid:=false;
          fq.Close;
          fq.Destroy;




          Query1Transaction.Active:=False;
          ADD_SQL(IbQuery2,'select * from tw_mroz(:tw_id,:SHOP_ID)');
          ADD_SQL(IbQuery1,'select tw.tw_negabarit, tw.tw_weight, twktg.twktg_color,tw.valuta_id,tw.tw_art,tw.tw_nam,tw.tw_short_nam, tw.ed_id,tw.tw_nds_small,ed.ed_short, (select frm_id from get_tw_saler(:tw_id, :shop_id, 0)) tw_saler_id '+
          ' from tw,ed,twktg '+
          'where tw.twktg_id=twktg.twktg_id and tw.ed_id=ed.ed_id and tw.tw_id= :TW_ID');
          IbQuery1.Parambyname('TW_ID').asinteger:=TW_ID;
          IbQuery1.Parambyname('SHOP_ID').asinteger:=SHOPID;          
          IbQuery2.Parambyname('TW_ID').asinteger:=TW_ID;
          IbQuery2.Parambyname('SHOP_ID').asinteger:=SHOPID;
//          IbQuery2.Parambyname('price_typ').asinteger:=kln_ktg_id;
          

          IbQuery1.Open;
          IbQuery2.Open;

          if ((ibquery1.FieldByName('TW_SALER_ID').asinteger=-1) and (SALE_EMPTY)) then
          begin
            Messbox('В пустую продажу нельзя добавлять товар, который может быть продан от лица любой фирмы!'+chr(13)+'сначала в накладную необходимо добавить обычный товар',MessSystem,48);
            exit;
          end;



//03.10.2007 убрана проверка НДС товара

          DataModule1.MainDicRnTyp.Locate('RNTYP_ID',SHOP_RNTYP_ID,[]);
          // НДС всегда выделяется!
//Игорь Сторожев 10.04.2004 для НДС=10%
{          if  (IbQuery1.Fieldbyname('TW_NDS_SMALL').asstring='1')
                and  (NDS.Value <> NDS_SMALL_DATE(SALE_DATE.Date))  then nds_error:=true;
          if  (IbQuery1.Fieldbyname('TW_NDS_SMALL').asstring<>'1')
                and  (NDS.Value <> NDS_DATE(SALE_DATE.Date))  then nds_error:=true;
          if (DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger=1)
          and (nds_error) then Messbox('НДС товара не соответствует НДС накладной и он не может быть добавлен!',MessSystem,48)
          }

//       else

       begin


         

          CanInsert:=True;
          MemRNS.Append;
//************
          Kateg:=Get_napr_kln(TW_ID);

//************
          MemRNS.Fieldbyname('RNS_ID').asinteger:=-1;
          MemRNS.Fieldbyname('TW_ID').asinteger:=TW_ID;
          if IbQuery1.Fieldbyname('TW_SALER_ID').asinteger=-1 then
             MemRNS.Fieldbyname('SALER_ID').asinteger:=FIRST_TW_SALER
          else
             MemRNS.Fieldbyname('SALER_ID').asinteger:=IbQuery1.Fieldbyname('TW_SALER_ID').asinteger;



          ADD_SQL(IBQuery3, 'select valueint from proptw where tw_id=:tw_id and proptwtyp_id=6 and frm_id = 0');
          IBQuery3.ParamByName('TW_ID').asinteger:=TW_ID;
          IBQuery3.Open;
          if ibquery3.Eof then
            MemRNS.Fieldbyname('TW_NOSKID').asinteger:=0
          else
            MemRNS.Fieldbyname('TW_NOSKID').asinteger:=IBQuery3.fieldByName('VALUEINT').asinteger;
          IBQuery3.Close;
          if bNoskid=true then
            MemRNS.Fieldbyname('TW_NOSKID').asinteger:=1;






          MemRNS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TWKTG_COLOR').asinteger;
          MemRNS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
          MemRNS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
          MemRNS.Fieldbyname('TW_SHORT_NAM').asstring:=IbQuery1.Fieldbyname('TW_SHORT_NAM').asstring;
          MemRNS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
          MemRNS.Fieldbyname('TW_MONEY').asfloat:=IbQuery2.Fieldbyname('MONEY').asfloat;
		      MemRNS.Fieldbyname('TW_WEIGHT').asfloat:=IbQuery1.Fieldbyname('TW_WEIGHT').asfloat;
          MemRNS.Fieldbyname('MET_MONEY_SHOP').asstring:=IbQuery2.Fieldbyname('MET_MONEY_SHOP').asstring;
          MemRNS.Fieldbyname('TW_NEGABARIT').asstring:=IbQuery1.Fieldbyname('TW_NEGABARIT').asstring;

          if ((MemRNS.Fieldbyname('napr').asfloat=1) or (MemRNS.FieldByName('tw_noskid').asinteger=1)) then
            pers:=0
          else
            pers:=pers_skid;       //strtoint(QueryWork.fieldbyname('valuestr').asstring);


          MemRNS.Fieldbyname('TW_SKID').asfloat:= ((IbQuery2.Fieldbyname('MONEY').asfloat- GetTWKtgPrice(TW_ID,kateg {kln_ktg_id}))*100/IbQuery2.Fieldbyname('MONEY').asfloat)+pers;
          if ((MemRNS.Fieldbyname('TW_SKID').asfloat < 1e-4) and (MemRNS.Fieldbyname('TW_SKID').asfloat> 0)) then
            MemRNS.Fieldbyname('TW_SKID').asfloat:=0;


          //проверка что цена получилась не ниже спеццены
          rozn_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 0);
            {
              02-02-2009
              по указанию Подвального скидка не скидывает цену ниже спеццены
            }
            spez_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 3);

            //Если итоговая цена ниже закупки, но при этом товар не распродажный, сделать цену закупочной
//            if spez_money+0.0001<=rozn_money then
            begin
              if MemRNS.fieldbyname('TW_OKMONEY').asfloat<spez_money then
              begin
//                memrns.Edit;
                MemRNS.fieldbyname('TW_SKID').asfloat:=(rozn_money- spez_money)*100/rozn_money;;
                MemRNS.fieldbyname('SKID_TXT').asstring:='Слишком большая скидка. Цена увеличена до спеццены';
//                memrns.Post;
              end;
            end;

{igor 06-03-2014- для работы 3% дисконта в выходные}
          if memRNS.FieldByName('tW_noskid').asinteger=1 then
           begin

            MemRNS.fieldbyname('TW_SKID').asfloat:=-sale_skid.Value;
            MemRNS.fieldbyname('SKID_TXT').asstring:='На этот товар скидки не действуют';

           end
          else
          begin

            rozn_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 0);
            {
              06-03-2008
              по указанию Подвального дисконт не скидывает цену ниже крупного опта
              08-04-2008
              по указанию Подвального дисконт не скидывает цену ниже спеццены
            }
            zak_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 3);



            //Если итоговая цена ниже закупки, но при этом товар не распродажный, сделать цену закупочной
            if zak_money<=rozn_money then
            begin
              if MemRNS.fieldbyname('TW_OKMONEY').asfloat<zak_money then
              begin

                MemRNS.fieldbyname('TW_SKID').asfloat:=(MemRNS.Fieldbyname('TW_OKMONEY').asfloat- zak_money)*100/MemRNS.Fieldbyname('TW_MONEY').asfloat;;
                MemRNS.fieldbyname('SKID_TXT').asstring:='Слишком большая скидка. Цена увеличена до спеццены';

              end;
            end
            else  //товар распродажный, заместить скидку на минус
            begin

                MemRNS.fieldbyname('TW_SKID').asfloat:=-sale_skid.Value;
                MemRNS.fieldbyname('SKID_TXT').asstring:='Скидки по дисконту не действуют на уцененный товар';

            end;

          end;
          {///igor 06-03-2014- для работы 3% дисконта в выходные}















          MemRNS.Fieldbyname('TW_SKID_LOAD').asfloat:=MemRNS.Fieldbyname('TW_SKID').asfloat;

    klnktgname:='';
    if kln_ktg_id=1 then klnKtgName:='Оптовый клиент';
    if kln_ktg_id=2 then klnKtgName:='Крупно-оптовый клиент';
    if kln_ktg_id=3 then klnKtgName:='Спец клиент';

    MemRNS.FieldByName('skid_txt').asstring:=MemRNS.Fieldbyname('SKID_TXT').asstring+' '+klnktgname;

    if (MemRNS.Fieldbyname('napr').asfloat=1) then
      MemRNS.Fieldbyname('SKID_TXT').asstring:='Направление клиента';
    if(pers<>0) and (MemRNS.Fieldbyname('napr').asfloat=0) then
      MemRNS.Fieldbyname('SKID_TXT').asstring:=MemRNS.Fieldbyname('SKID_TXT').asstring+' перс.скидка';
//***************

          //          MemRNS.Fieldbyname('TW_SKID').asfloat:=0;
          MemRNS.Fieldbyname('OTG_KOL').asfloat:=0;
          MemRNS.Fieldbyname('RNS_TABEL').asinteger:=trunc(TABEL.value);
          MemRNS.Fieldbyname('TW_SKIDDOLL').asfloat:=0;
          if IbQuery1.Fieldbyname('VALUTA_ID').asinteger=0 then
           MemRNS.Fieldbyname('TW_SKIDDOLL').asfloat:=0 else begin
           {Определяем скидку курса}

           VALUTA_ID:=IbQuery1.Fieldbyname('VALUTA_ID').asinteger;
           KURS1:=DEFAULT_KURS(VALUTA_ID,-SHOP_RNTYP_ID); {Курс расходной накладной}
           KURS2:=DEFAULT_KURS(VALUTA_ID,0); {Курс ценообразования}
           MemRNS.Fieldbyname('TW_SKIDDOLL').asfloat:=(Kurs2-kurs1)/(Kurs2/100);
          end;

{
там где устанавливаются остатки товара - надо определить кто будет товар продавать.
1. если хватает товара в рознице - ОК. saler_id = tw.saler_id
2. если товара в рознице не хватает но он есть в опте - закупить товар на розницу чтобы продать по первому варианту.
                                  saler_id=tw.saler_id и формировать куплю-продажу на разницу.
3. товара нет в рознице но есть в опте - продать от лица опта.
                                  saler_id = ТК Олимпия.



}

//          if chkShowOst.Checked then
//1. остаток ВСЕГО на складе
//2. Остаток в фирме, по которой товар выбивается
//3. надо проверить, совпадает ли фирма, по которой выбивается с фирмой, в которой есть остаток!!!!



          MemRNS.fieldByname('OST').asfloat:=GetOst(MemRNS.fieldByname('TW_ID').asinteger,strtoint('0'+SKL.value), -MemRNS.Fieldbyname('SALER_ID').asinteger);
          MemRNS.fieldByname('FRM_OST').asfloat:=GetOst(MemRNS.fieldByname('TW_ID').asinteger,strtoint('0'+SKL.value), MemRNS.Fieldbyname('SALER_ID').asinteger);  //остаток в магазине в фирме-продавце










          if KOL<0 then begin
             Application.createForm(TSET_KOLVO,SET_KOLVO);
             SET_KOLVO.NAME.text:=IbQuery1.fieldByname('TW_ART').asstring+
                            IbQuery1.fieldByname('TW_NAM').asstring;
             SET_KOLVO.showModal;
             if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
             MemRNS.Fieldbyname('TW_KOL').asfloat:=SET_KOLVO.KOL.value;
             SET_KOLVO.destroy;
          end else MemRNS.Fieldbyname('TW_KOL').asfloat:=KOL;


//          if ((not sale_prow) and (not (self.tag>0))) then //не проведен и не сохранен
        //применяется только если выбран склад олимп7М
//           then

          begin
//            if (MemRNS.fieldByname('OST').asfloat<=0.01) then//товара нет!!! отгрузить с опта без проверки остатков, т.к. считаем что он есть по определению!!
//            if ({(skl.value = '25') or 25.10.2008 - продажа товаров с 7 склада через ИП}(MemRNS.fieldByname('OST').asfloat<=0.01)) then//товара нет!!! отгрузить с опта без проверки остатков, т.к. считаем что он есть по определению!!
            begin
//              MemRNS.fieldByname('SALER_ID').asinteger:=2669809;  //ТК ОЛИМПИЯ!!!!!!!!!
            end
//            else MemRNS.Fieldbyname('SALER_ID').asinteger:=MemRNS.Fieldbyname('TRUE_SALER_ID').asinteger;
          end;



          MemRNS.Post;
          CanInsert:=False;
      end;  //nds_error check
     end;
     IbQuery1.Close;
     try
       RxDbGrid1.setfocus;
     Except
     End;
  end;
  Refresh_SUMM;




end;

procedure TDOC_SALE.Btn_DicTowClick(Sender: TObject);
var
   a:integer;
begin

     if strtoint(SKL.value)<>0 then SELECT_SKLAD:=strtoint(SKL.value);
     DicTowarSet:=1; {Ввод товаров из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.Treeview1.Tag:=strtoint(SKL.value);
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
        for a:=1 to CNT_TW do begin
            ADD_RNS(ARR_TW[a].ID,ARR_TW[a].KOL);
        end;
     end;
     Refresh_summ;
     Show_sost;
end;

procedure TDOC_SALE.ToolButton5Click(Sender: TObject);
begin
     My_lock;
end;

procedure TDOC_SALE.Btn_SAVEClick(Sender: TObject);
begin
     SAVE:=false;
     Btn_Apply.Click;
     if SAVE then begin
        if not SALE_PROW then if Btn_prow.enabled then
        begin
        //если сделать проводку подряд - может возникнуть сбой по синхронизации - не дойдет проведенный документ
        //надо разнести по времени сохранение и проводку.
        Sleep(1000);
        Btn_prow.click;
        end;
        Close;
     end;
end;

procedure TDOC_SALE.Btn_NODISCONTClick(Sender: TObject);
begin
     DISKONT_ID:=0;
     SALE_DISKONT.text:='';
     DISKONT_ID:=0;
     SALE_SKID.value:=0;
     SALE_SKID_TXT.text:='';
     Refresh_Summ;
     save:=False;
end;

procedure TDOC_SALE.Btn_DelTowClick(Sender: TObject);
 var
     SALE_NUM_FULL:ansistring;
begin
     if Messbox('Удалить из накладной товар "'+MemRNS.Fieldbyname('TW_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        if MemRNS.Fieldbyname('RNS_ID').asinteger>0 then begin
          WorkTransaction.Active:=False;
          ADD_SQL(QueryWork,'select SHOP.SHOP_PREFIX,SHOP.SHOP_POSTFIX, '+
          'SALE.SALE_NUM from SALE,SHOP where SALE.SALE_ID=:SALE_ID '+
          'and SALE.SHOP_ID=SHOP.SHOP_ID ');
          QueryWork.paramByname('SALE_ID').asinteger:=DOC_SALE.tag;
          QueryWork.open;
          if not QueryWork.eof then
            SALE_NUM_FULL:= QueryWork.fieldByname('SHOP_PREFIX').asstring+
            b_utils.right('0000000000'+inttostr(SALE_NUMS),10)+QueryWork.fieldByname('SHOP_POSTFIX').asstring;
          inc(CNT_DEL);
          RNS_DEL[CNT_DEL]:=MemRNS.Fieldbyname('RNS_ID').asinteger;
          RNS_DEL_OTG[CNT_DEL]:=MemRNS.Fieldbyname('OTG_KOL').asinteger;
          RNS_DEL_TW[CNT_DEL]:=MemRNS.Fieldbyname('TW_ID').asinteger;
          RNS_DEL_FRM[CNT_DEL]:=MemRNS.Fieldbyname('SALER_ID').asinteger;
          RNS_DEL_RN[CNT_DEL]:=MemRNS.Fieldbyname('RN_ID').asinteger;

          RNS_DEL_MESS[CNT_DEL]:=SALE_NUM_FULL+' Удален товар: '+MemRNS.Fieldbyname('TW_ART').asstring+' '+
          MemRNS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemRNS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
          MemRNS.Fieldbyname('ED_SHORT').asstring+' по цене '+floattostrf(MemRNS.Fieldbyname('TW_OKMONEY').asfloat,fffixed,19,2);
          RNS_DEL_MESS2[CNT_DEL]:=SALE_NUM_FULL+' Из накладной удален товар с отгрузкой '+floattostrf(MemRNS.Fieldbyname('OTG_KOL').asfloat,fffixed,19,3)+' '+
          MemRNS.Fieldbyname('ED_SHORT').asstring;
        end;
        SAVE:=False;
        MemRNS.delete;
        Refresh_summ;
        Show_Sost;
     end;
end;

procedure TDOC_SALE.NAKL_TAB_CTRLChange(Sender: TObject);
begin


    memrns.Filtered:=false;
    memrns.tag:=arrRN[NAKL_TAB_CTRL.tabindex].FRM_ID;

  	if DOC_PAGE_CONTROL.ActivePage.Name = 'NAKL_TAB_SHEET' then
    begin
     memrns.Filtered:=true;
     if arrRN[NAKL_TAB_CTRL.tabindex].RN_NUMS <0 then
	  	RN_NUM.Text:='Новая'
      else RN_NUM.Text:= inttostr(arrRN[NAKL_TAB_CTRL.tabindex].RN_NUMS);
     RN_SUMM.Value := RnSumm(arrRN[NAKL_TAB_CTRL.tabindex].FRM_ID);

     PoTransaction.Active:=false;
	   QrListPO.Close;
     QrListPO.ParamByName('RN_ID').asinteger:=arrRN[NAKL_TAB_CTRL.tabindex].RN_ID;
     QrListPO.Open;
     arrRN[NAKL_TAB_CTRL.tabindex].PO_SUMM := PO_POG_SUMM;

     ActDelPo.enabled:=(not QrListPO.eof) AND (not SALE_PROW);

    end
	 else
    memrns.Filtered:=false;






end;

procedure TDOC_SALE.DOC_PAGE_CONTROLChange(Sender: TObject);
var i: integer;
begin
	if DOC_PAGE_CONTROL.ActivePage.Name = 'NAKL_TAB_SHEET' then
    begin
        memrns.Filtered:=false;
        memrns.tag:=arrRN[NAKL_TAB_CTRL.tabindex].FRM_ID;
        memrns.Filtered:=true;

        if arrRN[NAKL_TAB_CTRL.tabindex].RN_NUMS <0 then
         RN_NUM.Text:='Новая'
        else RN_NUM.Text:= inttostr(arrRN[NAKL_TAB_CTRL.tabindex].RN_NUMS);


        RN_SUMM.Value := RnSumm(arrRN[NAKL_TAB_CTRL.tabindex].FRM_ID);

        PoTransaction.Active:=false;
        QrListPO.Close;
        QrListPO.ParamByName('RN_ID').asinteger:=arrRN[NAKL_TAB_CTRL.tabindex].RN_ID;
        QrListPO.Open;
        arrRN[NAKL_TAB_CTRL.tabindex].PO_SUMM := PO_POG_SUMM;
    end
    else
      memrns.Filtered:=false;



end;

procedure TDOC_SALE.MemRNSFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var a: integer;
  s: string;
begin
  accept:=false;

	if (((shop_frm > 0) or (DataSet.FieldByName('SALER_ID').asinteger=DataSet.Tag)) ) then
    	accept:=true;


end;

procedure TDOC_SALE.TABELChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDOC_SALE.Btn_TabelClick(Sender: TObject);
var
   a,ID:integer;
begin
     SAVE:=False;
     if (MemRNS.RecordCount>0) and (trunc(TABEL.value)<>0) then begin
         ID:=MemRNS.RecNo;
         MemRNS.DisableControls;
         MemRNS.First;
         while not MemRNS.eof do begin
               if MemRNS.fieldByname('RNS_TABEL').asinteger=0 then begin
                   MemRNS.Edit;
                   MemRNS.fieldByname('RNS_TABEL').asinteger:=trunc(TABEL.value);
                   MemRNS.Post;
               end;
               MemRNS.next;
         end;
         MemRNS.First;
         for a:=1 to ID-1 do MemRNS.next;
         MemRNS.EnableControls;
     end;
end;

procedure TDOC_SALE.TABELKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
     if (Sost=0) and (DOC_SALE.tag<0) then begin
        sost:=1;
        RxDbGrid1.setfocus;
     end;
     show_sost;
  end;
end;

procedure TDOC_SALE.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Column.Field.FullName='TW_NEGABARIT' then
	begin {Колонка негабаритного товара}
        RxDbgrid1.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_NEGABARIT').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           25,True);
        end;
    end;
end;

procedure TDOC_SALE.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
//     if Field <> nil then
     begin

       if (Field.FieldName='TW_ART')
          and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
          then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;

       if (Field.FieldName='TW_SKID')
           and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_NOSKID').asinteger>0)
           then BackGround:=$009F9FFF;

       if Field.Fieldname='OST' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR1>0) then Background:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR2>0) then Background:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<0)
           and (OST_COLOR3>0) then Background:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat=0)
           and (OST_COLOR4>0) then Background:=OST_COLOR4;
       end;



       Afont.Style:=[];
       if (((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1')
        and
       (Field.Fieldname='TW_MONEY')) then begin
          BackGround:=$009FFF9F;
          Afont.Style:=[FsBold];
          Afont.color:=ClGreen;
       end;
       if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if (Field.FieldName='TW_ART')
           and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
           then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;

       if (Field.FieldName='TW_SKID')
           and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_NOSKID').asinteger>0)
           then Afont.color:=$009F9FFF;

       if Field.Fieldname='OST' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR1>0) then Afont.color:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR2>0) then Afont.color:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<0)
           and (OST_COLOR3>0) then Afont.color:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat=0)
           and (OST_COLOR4>0) then Afont.color:=OST_COLOR4;
       end;


         Afont.Style:=[];
         if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1') and
         (Field.Fieldname='TW_MONEY') then begin
            BackGround:=ClGreen;
            Afont.Style:=[FsBold];
            Afont.color:=$009FFF9F;
         end;
       end;
     end;
end;

procedure TDOC_SALE.MemRNSCalcFields(DataSet: TDataSet);
begin




	 MemRNS.fieldbyname('TW_OKMONEY').asfloat:=OKRUG((MemRNS.fieldbyname('TW_MONEY').asfloat*
            (1-(MemRNS.fieldbyname('TW_SKIDDOLL').asfloat)/100))*
            (1-(MemRNS.fieldbyname('TW_SKID').asfloat+SALE_SKID.value)/100),2);

//     SALE_SUMM.Value := SALE_SUMM.Value - MemRNS.fieldbyname('TW_SUMM').asfloat;
     MemRNS.fieldbyname('RNS_WEIGHT').asfloat:=MemRNS.fieldbyname('TW_WEIGHT').asfloat*MemRNS.fieldbyname('TW_KOL').asfloat;
     MemRNS.fieldbyname('TW_SUMM').asfloat:=MemRNS.fieldbyname('TW_OKMONEY').asfloat*MemRNS.fieldbyname('TW_KOL').asfloat;
//     SALE_SUMM.Value := SALE_SUMM.Value + MemRNS.fieldbyname('TW_SUMM').asfloat;
//     SALE_WEIGHT.Value := SALE_WEIGHT.Value - MemRNS.fieldbyname('RNS_WEIGHT').asfloat;

//     SALE_WEIGHT.Value := SALE_WEIGHT.Value + MemRNS.fieldbyname('RNS_WEIGHT').asfloat;
//    Refresh_SUMM;
end;

procedure TDOC_SALE.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save) and (Btn_Apply.enabled) then begin
        if Messbox(MessChange,MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDOC_SALE.Btn_ProwClick(Sender: TObject);
begin
     if Not Save and Btn_Apply.enabled then Btn_Apply.click;
     if (SAVE) then begin
        if NOT SALE_PROW then begin
          if PROV_SALE(Doc_SALE.tag,'') then begin
                SALE_PROW:=True;
                Show_Sost;
                Btn_RefreshOst.click;
                SAVE:=true;
          end;
        end;
     end;
end;

procedure TDOC_SALE.Btn_UnprowClick(Sender: TObject);
begin

     if UNPROV_SALE(Doc_SALE.tag,'') then begin
                Btn_RefreshOst.click;
                SALE_PROW:=False;
                Show_Sost;
                SAVE:=True;
                SET_NDS_NP;
      end;
end;


procedure TDoc_SALE.SET_NDS_NP;
var nds_ok: boolean;
begin
{nds_ok := false;
     DataModule1.MainDicRnTyp.Locate('RNTYP_ID',SHOP_RNTYP_ID,[]);
     if DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger=2 then begin
        // НДС всегда не выделяется!
        if NDS.value<>0 then begin
           NDS.value:=0;
           SAVE:=False;
           Messbox('Ставка НДС выставлена в соответствии с текущей настройкой!',MessSystem,48);
        end;
        NDS.enabled:=False;
     end;
     if DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger=1 then begin
        // НДС всегда выделяется!

        if (not nds_ok) then

        if (NDS.value<>NDS_DATE(SALE_DATE.date))
           AND (NDS.Value <> NDS_SMALL_DATE(SALE_DATE.Date)) then
           begin
           NDS.value:=NDS_DATE(SALE_DATE.date);
           SAVE:=False;
           Messbox('Ставка НДС выставлена в соответствии с текущей настройкой!',MessSystem,48);
        end;
        NDS.enabled:=True;
     end;
     if NP.value<>NP_DATE(SHOP_RNTYP_ID,SALE_DATE.date) then begin
        NP.value:=NP_DATE(SHOP_RNTYP_ID,SALE_DATE.date);
        Messbox('Ставка НП выставлена в соответствии с текущей настройкой!',MessSystem,48);
        SAVE:=False;
     end;
}     
end;

procedure TDOC_SALE.BTN_KLNClick(Sender: TObject);
var pers:integer;
rozn_money, spez_money: double;
begin
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=KLN_NAME.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN_NAME.tag then begin
        KLN_NAME.tag:=DIC_KLIENT.tag;
        Change_FrmKln(KLN_NAME.tag,2);
//*******
      if not MemRNS.IsEmpty then
      begin
       memRNS.First;
       MemRNS.DisableControls;
       while not memRNS.Eof do
       begin
         if ((MemRNS.Fieldbyname('napr').asfloat=1) or (MemRNS.FieldByName('tw_noskid').asinteger=1)) then
           pers:=0
         else
           pers:=PERS_SKID;

         MemRNS.Edit;
         MemRNS.Fieldbyname('TW_SKID').asfloat:=MemRNS.Fieldbyname('TW_SKID').asfloat+pers;
         MemRNS.Fieldbyname('TW_SKID_LOAD').asfloat:=MemRNS.Fieldbyname('TW_SKID').asfloat;

         if (MemRNS.Fieldbyname('napr').asfloat=1) then
           MemRNS.Fieldbyname('SKID_TXT').asstring:='Направление клиента';
         if(pers<>0) and (MemRNS.Fieldbyname('napr').asfloat=0) then
           MemRNS.Fieldbyname('SKID_TXT').asstring:=MemRNS.Fieldbyname('SKID_TXT').asstring + ' + перс.скидка';


         //проверка что цена получилась не ниже спеццены
          rozn_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 0);
            {
              02-02-2009
              по указанию Подвального скидка не скидывает цену ниже спеццены
            }
            spez_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 3);

            //Если итоговая цена ниже закупки, но при этом товар не распродажный, сделать цену закупочной
//            if spez_money<=rozn_money then
            begin
              if MemRNS.fieldbyname('TW_OKMONEY').asfloat<spez_money then
              begin
//                memrns.Edit;
                MemRNS.fieldbyname('TW_SKID').asfloat:=(rozn_money- spez_money)*100/rozn_money;;
                MemRNS.fieldbyname('SKID_TXT').asstring:='Слишком большая скидка. Цена увеличена до спеццены';
//                memrns.Post;
              end;
            end;






         MemRNS.Post;
         MemRNS.Next;
       end;
       memRNS.First;
       MemRNS.EnableControls;
      end;
//*******
        SAVE:=False;
     end;
     DIC_KLIENT.Destroy;
     Try
       SALE_OSN.setfocus;
     Except
     End;
end;

procedure TDOC_SALE.Btn_ALLSKIDClick(Sender: TObject);
var
   a,OLDID:integer;
begin
     OLDID:=MemRNS.recno;
     MemRNS.Disablecontrols;
     MemRNS.First;
     while not MemRNS.eof do begin
           if MemRNS.fieldByname('TW_SKID').asfloat>0 then begin
              MemRNS.Edit;
              MemRNS.fieldByname('SKID_TXT').asstring:=ONE_SKID.text;
              MemRNS.Post;
           end;
           MemRNS.next;
     end;
     MemRNS.First;
     for a:=1 to OLDID-1 do MemRNS.next;
     MemRNS.EnableControls;
end;


procedure TDOC_SALE.Btn_DetalClick(Sender: TObject);
begin
       Application.createform(TDETAL_TW,DETAL_TW);
       DETAL_TW.tag:=MemRNS.fieldbyname('TW_ID').asinteger;
       DETAL_TW.showmodal;
       DETAL_TW.destroy;
end;

procedure TDOC_SALE.Btn_AnalizClick(Sender: TObject);
begin
     Application.createForm(TANALIZ_TW,ANALIZ_TW);
     ANALIZ_TW.tag:=MemRNS.fieldbyname('TW_ID').asinteger;
     ANALIZ_TW.ShowModal;
     ANALIZ_TW.Destroy;
end;

procedure TDOC_SALE.Btn_MarketingClick(Sender: TObject);
begin
     SHOW_MARKETING_TW(MemRNS.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_SALE.Btn_PrintCennClick(Sender: TObject);
var SKL_ID: Integer;
begin
    CLEAR_CENNIK;
    ADD_CENNIK(MemRNS.fieldbyname('TW_ID').asinteger,strtoint(SKL.value));
    PRINT_CENNIK;
end;

procedure TDOC_SALE.Btn_PrintCennMoreClick(Sender: TObject);
var
   a,ID:integer;
   SKL_ID: Integer;
begin
     CLEAR_CENNIK;
     if MemRNS.RecordCount>0 then begin
         ID:=MemRNS.RecNo;
         MemRNS.DisableControls;
         MemRNS.First;
         while not MemRNS.eof do begin
               ADD_CENNIK(MemRNS.fieldbyname('TW_ID').asinteger,strtoint(SKL.value));
               MemRNS.next;
         end;
         MemRNS.First;
         for a:=1 to ID-1 do MemRNS.next;
         MemRNS.EnableControls;
         PRINT_CENNIK;
     end;
end;

procedure TDOC_SALE.Btn_OstClick(Sender: TObject);
begin
    MemRns.edit;
    MemRns.FieldByName('TW_KOL').asfloat:=
      MemRNS.fieldByname('OST').asfloat;
    memrns.Post;  
end;

procedure TDOC_SALE.Btn_RefreshOstClick(Sender: TObject);
var
   a,ID:integer;
   Summ:Double;
   s:ansistring;
   oldFiltered : Boolean;

begin
  if DOC_SALE.Visible then begin
     Refresh_Summ;
     s:=Doc_SALE.caption;
     Doc_SALE.caption:=Doc_SALE.caption+'. Чтение остатков товаров';
     if MemRNS.RecordCount>0 then begin
         ID:=MemRNS.RecNo;
         MemRNS.DisableControls;
         oldFiltered := memRNS.Filtered;
         memRNS.Filtered:=False;
         MemRNS.First;
         Summ:=0;


         while not MemRNS.eof do begin
               MemRNS.Edit;

               MemRNS.fieldByname('OST').asfloat:=GetOst(MemRNS.fieldByname('TW_ID').asinteger,strtoint('0'+SKL.value), -MemRNS.Fieldbyname('SALER_ID').asinteger);  //Полный остаток - во всем магазине -- 30-06-09 в фирме и в безнале
               MemRNS.fieldByname('FRM_OST').asfloat:=GetOst(MemRNS.fieldByname('TW_ID').asinteger,strtoint('0'+SKL.value), MemRNS.Fieldbyname('SALER_ID').asinteger);  //остаток в магазине в фирме-продавце


//               if ((not sale_prow) and (not (self.tag>0))) then //не проведен и не сохранен
               begin
//                 if({(skl.value = '25') or 23.10.2008 - продажи с олимп7С через ИП}(MemRNS.fieldByname('OST').asfloat<=0.01)) then
//                 if MemRNS.fieldByname('OST').asfloat<=0.01 then//товара нет!!! отгрузить с опта без проверки остатков, т.к. считаем что он есть по определению!!
                 begin
//                  MemRNS.fieldByname('SALER_ID').asinteger:=2669809;  //ТК ОЛИМПИЯ!!!!!!!!!
                 end
//                 else MemRNS.Fieldbyname('SALER_ID').asinteger:=MemRNS.Fieldbyname('TRUE_SALER_ID').asinteger;
               end;

               MemRNS.Post;
               MemRNS.next;
         end;
         MemRNS.First;
         for a:=1 to ID-1 do MemRNS.next;
         memRNS.Filtered := oldFiltered;
         MemRNS.EnableControls;
     end;
     Doc_SALE.caption:=s;
  end;
end;

procedure TDOC_SALE.MnSet_SkidClick(Sender: TObject);
begin
     application.createForm(TSET_SKID,SET_SKID);
//     SET_SKID.MONEY1.value:=OKRUG((MemRNS.fieldbyname('TW_MONEY').asfloat*(1-(MemRNS.fieldbyname('TW_SKIDDOLL').asfloat)/100)),2);
     GLOBAL_MON1:=(MemRNS.fieldbyname('TW_MONEY').asfloat*(1-(MemRNS.fieldbyname('TW_SKIDDOLL').asfloat)/100));
     SET_SKID.MONEY1.value:=(MemRNS.fieldbyname('TW_MONEY').asfloat*(1-(MemRNS.fieldbyname('TW_SKIDDOLL').asfloat)/100));
     SET_SKID.MONEY2.value:=(MemRNS.fieldbyname('TW_MONEY').asfloat*(1-(MemRNS.fieldbyname('TW_SKIDDOLL').asfloat)/100))*(1-(MemRNS.fieldbyname('TW_SKID').asfloat+SALE_SKID.value)/100);
     SET_SKID.OSN.text:=MemRNS.fieldByname('SKID_TXT').asstring;
     SET_SKID.showModal;
     if SET_SKID.tag>0 then begin
        MemRNS.edit;
        MemRNS.fieldByname('SKID_TXT').asstring:=SET_SKID.OSN.Text;
        MemRNS.Edit;
        MemRNS.fieldByname('TW_SKID').asfloat:=GLOBAL_SKID-SALE_SKID.value;
        if memrns.State in [dsEdit	] then  MemRNS.Post;
     end;
     SET_SKID.Destroy;
//     Refresh_SUMM;
end;

procedure TDOC_SALE.HAT_PAGE_CONTROLChange(Sender: TObject);
var i: integer;
begin
	if HAT_PAGE_CONTROL.ActivePage.Name='SKID_TAB_SHEET' then
    begin
       RxDBGrid1.Columns[6].Visible:=true;   //SKID_TXT
    end
    else
       RxDBGrid1.Columns[6].Visible:=false;   //SKID_TXT


end;

procedure TDOC_SALE.NAKL_PAGE_CONTROLChange(Sender: TObject);
var i: integer;
begin
    PoTransaction.Active:=false;
	QrListPO.Close;
    QrListPO.ParamByName('RN_ID').asinteger:=arrRN[NAKL_TAB_CTRL.tabindex].RN_ID;
    QrListPO.Open;
    arrRN[NAKL_TAB_CTRL.tabindex].PO_SUMM := PO_POG_SUMM;

    ActDelPo.enabled:=(not QrListPO.eof) AND (not SALE_PROW);


    

end;

procedure TDOC_SALE.ActNewPoExecute(Sender: TObject);
var
  ID:integer;
  r:double;
  rntyp_short: string;
begin
   // Новая предоплата
   if arrRN[NAKL_TAB_CTRL.tabindex].RN_ID<0 then messbox('Накладная не сохранена!',MessSystem,48) else begin
     Application.createForm(TDOC_PO,DOC_PO);
     DOC_PO.tag:=-1;
     DOC_PO.FRM.Tag := arrRN[NAKL_TAB_CTRL.tabindex].FRM_ID;
     DOC_PO.ShowModal;
     if DOC_PO.tag>0 then begin
      	DataModule1.MainDicRnTyp.Locate('RNTYP_ID',SHOP_RNTYP_ID,[]);
     	RNTYP_SHORT:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_SHORT').asstring;
        // фиксируем предоплату на эту накладную
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       Try
         IBSAVE_CLEAR;
         IBSAVE_ADD('PO_ID',DOC_PO.tag);
         IBSAVE_ADD('RN_ID',arrRN[NAKL_TAB_CTRL.tabindex].RN_ID);
         IBSAVE_ADD('PORN_SUMM',DOC_PO.PO_SUMM.value);
         if IBSAVE_DOC('PORN',-1)<0 then r:=sqrt(-1);
         // фиксируем факт добавления
         IBSAVE_CLEAR;
         IBSAVE_ADD('DOC','PO');
         IBSAVE_ADD('US_ID',USERID);
         IBSAVE_ADD('SHOP_ID',SHOPID);
         IBSAVE_ADD('MESS','В накладную '+rntyp_short+RN_NUM.text+' добавлена предоплата № '+
         DOC_PO.PO_NUM.text+' на сумму '+floattostrf(DOC_PO.PO_SUMM.value,fffixed,19,2)+' руб.');
         IBSAVE_ADD('DOP1',2);
         IBSAVE_ADD('DOP2',DOC_PO.tag);
         if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
         // повторяем для расходной
         IBSAVE_CLEAR;
         IBSAVE_ADD('DOC','RN');
         IBSAVE_ADD('US_ID',USERID);
         IBSAVE_ADD('SHOP_ID',SHOPID);
         IBSAVE_ADD('MESS','В накладную '+rntyp_short+RN_NUM.text+' добавлена предоплата № '+
         DOC_PO.PO_NUM.text+' на сумму '+floattostrf(DOC_PO.PO_SUMM.value,fffixed,19,2)+' руб.');
         IBSAVE_ADD('DOP1',2);
         IBSAVE_ADD('DOP2',arrRN[NAKL_TAB_CTRL.tabindex].RN_ID);
         if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
         Datamodule1.IBTransaction2.Commit;
       except
         Datamodule1.IBTransaction2.RollBAck;
       end;
       Datamodule1.IBTransaction2.Active:=False;
       PoTransaction.Active:=False;
       QrListPO.close;
       QrListPO.paramByname('RN_ID').asinteger:=arrRN[NAKL_TAB_CTRL.tabindex].RN_ID;
       QrListPO.open;
       arrRN[NAKL_TAB_CTRL.tabindex].PO_SUMM := PO_POG_SUMM;
     end;
     DOC_PO.Destroy;
   end;
end;

procedure TDOC_SALE.ActOpenPoExecute(Sender: TObject);
var
  ID:integer;
  PO_SUMM:double;
  OST_SUMM:double;
  PORN_SUMM:double;
  SAVE_SUMM:double;
  USE_SUMM:double;
  r:double;
  PO_NUM:string;
  PO_MESS:string;
  PO_ID:integer;
  rntyp_short: string;
begin
 if arrRN[NAKL_TAB_CTRL.tabindex].RN_ID<0 then messbox('Накладная не сохранена!',MessSystem,48) else begin
   // Перед использованием, проверяем, а нужно ли еще использовать предоплату
   Refresh_Summ;
   DataModule1.MainDicRnTyp.Locate('RNTYP_ID',SHOP_RNTYP_ID,[]);
   RNTYP_SHORT:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_SHORT').asstring;
   if QrListPO.recordcount=0 then PO_SUMM:=0 else begin
     PoTransaction.Active:=False;
     QrListPO.close;
     QrListPO.paramByname('RN_ID').asinteger:=arrRN[NAKL_TAB_CTRL.tabindex].RN_ID;
     QrListPO.open;
     PO_SUMM:=0;
     while not QrListPO.eof do begin
       PO_SUMM:=PO_SUMM+QrListPO.fieldByname('PORN_SUMM').asfloat;
       QrListPO.next;
     end;
   end;
   if PO_SUMM>=RN_SUMM.value then messbox('Сумма накладной меньше суммы использованных предоплат для этой накладной!',MessSystem,48) else begin
     OST_SUMM:=RN_SUMM.value-PO_SUMM; // определили остаток, который можно оплатить предоплатой;
     // выбираем предоплату
     // выбрать предоплату для возврата
     application.createForm(TJou_PO,JOU_PO2);
     JOU_PO2.tag:=-1;
     JOU_PO2.FRM.Tag := arrRN[NAKL_TAB_CTRL.tabindex].FRM_ID;
     JOU_PO2.showModal;
     if JOU_PO2.tag>0 then begin
       PORN_SUMM:=JOU_PO2.QrPoList.fieldByname('PO_OST').asfloat;
       PO_NUM:=JOU_PO2.QrPoList.fieldByname('PO_NUM_FULL').asstring;
       if PORN_SUMM<=0 then messbox('Выбранная предоплата погашена полностью и не может быть использована! Выберите другую!',MessSystem,48) else begin
         if PORN_SUMM>=OST_SUMM then USE_SUMM:=OST_SUMM
                                else USE_SUMM:=PORN_SUMM;
          // фиксируем в журнале использования
         Datamodule1.IBTransaction2.Active:=False;
         Datamodule1.IBTransaction2.StartTransaction;
         Try
           IBSAVE_CLEAR;
           IBSAVE_ADD('PO_ID',JOU_PO2.tag);
           IBSAVE_ADD('RN_ID',arrRN[NAKL_TAB_CTRL.tabindex].RN_ID);
           IBSAVE_ADD('PORN_SUMM',USE_SUMM);
           if IBSAVE_DOC('PORN',-1)<0 then r:=sqrt(-1);
           // фиксируем факт добавления
           IBSAVE_CLEAR;
           IBSAVE_ADD('DOC','PO');
           IBSAVE_ADD('US_ID',USERID);
           IBSAVE_ADD('SHOP_ID',SHOPID);
           IBSAVE_ADD('MESS','В накладную '+RNTYP_SHORT+RN_NUM.text+' добавлена предоплата № '+
           PO_NUM+' на сумму '+floattostrf(USE_SUMM,fffixed,19,2)+' руб.');
           IBSAVE_ADD('DOP1',2);
           IBSAVE_ADD('DOP2',JOU_PO2.tag);
           if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
           // повторяем для расходной
           IBSAVE_CLEAR;
           IBSAVE_ADD('DOC','RN');
           IBSAVE_ADD('US_ID',USERID);
           IBSAVE_ADD('SHOP_ID',SHOPID);
           IBSAVE_ADD('MESS','В накладную '+RNTYP_SHORT+RN_NUM.text+' добавлена предоплата № '+
           PO_NUM+' на сумму '+floattostrf(USE_SUMM,fffixed,19,2)+' руб.');
           IBSAVE_ADD('DOP1',2);
           IBSAVE_ADD('DOP2',arrRN[NAKL_TAB_CTRL.tabindex].RN_ID);
           if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
           Datamodule1.IBTransaction2.Commit;
         except
           Datamodule1.IBTransaction2.RollBAck;
         end;
         Datamodule1.IBTransaction2.Active:=False;
         PoTransaction.Active:=False;
         QrListPO.close;
         QrListPO.paramByname('RN_ID').asinteger:=arrRN[NAKL_TAB_CTRL.tabindex].RN_ID;
         QrListPO.open;
         arrRN[NAKL_TAB_CTRL.tabindex].PO_SUMM := PO_POG_SUMM;
         QrListPO.locate('PO_ID',JOU_PO2.tag,[]);
       end;
     end;
     JOU_PO2.destroy;
   end;
 end;
end;

procedure TDOC_SALE.ActDelPoExecute(Sender: TObject);
var
  PO_ID:integer;
  PO_NUM:string;
  PO_MESS:string;
  rntyp_short: string;
begin
   // удаление предоплаты
   if Messbox('Удалить их текущей накладной использование предоплаты № '+QrListPo.fieldByname('PO_FULL_NUM').asstring
   +' на сумму '+floattostrf(QrListPo.fieldByname('PORN_SUMM').asfloat,fffixed,19,2)+'руб. ?',MessSubmitDelete,4+48+256)=6 then begin
   	  DataModule1.MainDicRnTyp.Locate('RNTYP_ID',SHOP_RNTYP_ID,[]);
      RNTYP_SHORT:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_SHORT').asstring;


      PO_ID:=QrListPo.fieldByname('PO_ID').asinteger;
      PO_NUM:=QrListPo.fieldByname('PO_FULL_NUM').asstring;
      PO_MESS:='Из накладной '+RNTYP_SHORT+RN_NUM.text+' удалена предоплата № '+PO_NUM+' на сумму '+floattostrf(QrListPo.fieldByname('PORN_SUMM').asfloat,fffixed,19,2)+'руб.';
      Datamodule1.IBTransaction2.Active:=False;
      Datamodule1.IBTransaction2.StartTransaction;
      IBDELETE_DOC('PORN',QrListPo.fieldByname('PORN_ID').asinteger);
      // фиксируем факт удаления
      IBSAVE_CLEAR;
      IBSAVE_ADD('DOC','PO');
      IBSAVE_ADD('US_ID',USERID);
      IBSAVE_ADD('SHOP_ID',SHOPID);
      IBSAVE_ADD('MESS',PO_MESS);
      IBSAVE_ADD('DOP1',4);
      IBSAVE_ADD('DOP2',PO_ID);
      IBSAVE_DOC('ARCUPDATE',-1);
      // повторяем для расходной
      IBSAVE_CLEAR;
      IBSAVE_ADD('DOC','RN');
      IBSAVE_ADD('US_ID',USERID);
      IBSAVE_ADD('SHOP_ID',SHOPID);
      IBSAVE_ADD('MESS',PO_MESS);
      IBSAVE_ADD('DOP1',1);
      IBSAVE_ADD('DOP2',arrRN[NAKL_TAB_CTRL.tabindex].RN_ID);
      IBSAVE_DOC('ARCUPDATE',-1);
      Datamodule1.IBTransaction2.commit;
      Datamodule1.IBTransaction2.Active:=False;
      PoTransaction.Active:=False;
      QrListPO.close;
      QrListPO.paramByname('RN_ID').asinteger:=arrRN[NAKL_TAB_CTRL.tabindex].RN_ID;
      QrListPO.open;
      arrRN[NAKL_TAB_CTRL.tabindex].PO_SUMM := PO_POG_SUMM;

   end;
end;




procedure TDOC_SALE.CTRLDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var t: TCustomTabControl;
var text: string;
begin
  if Control.ClassNameIs('TPageControl') then
  	text := (Control as TPageControl).Pages[TabIndex].Caption;

  if Control.ClassNameIs('TTabControl') then
  	text := (Control as TTabControl).tabs[TabIndex];


  Control.Canvas.FillRect(Rect);
  if Active then
  begin
    Control.Canvas.Font.Color := clHighlight;
    Control.Canvas.TextOut(Rect.left+2, Rect.Top+2,text);
    Control.Canvas.DrawFocusRect(Rect);
  end
  else
  Control.Canvas.TextOut(Rect.left+2, Rect.Top+2,text);
end;

procedure TDOC_SALE.PrintRndRearExecute(Sender: TObject);
begin
	Print_DOC.LoadXltAndPrint('rnd_rear.xlt')
end;

procedure TDOC_SALE.BtnPrintNpzClick(Sender: TObject);
var i: integer;
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        for i := 0 to  NAKL_TAB_CTRL.Tabs.Count-1 do
            if arrRN[i].RN_ID>0 then
            	PRINT_RNW(arrRN[i].RN_ID);
end;

procedure TDOC_SALE.Btn_PrintClick(Sender: TObject);
var i: integer;
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        PRINT_SALE(DOC_SALE.Tag, not cbSkidNoPrint.Checked);

end;

procedure TDOC_SALE.PrintTWCheckExecute(Sender: TObject);
var i: integer;
begin
    // Печать товарного чека
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        PRINT_SALE_CHECK1(DOC_SALE.Tag, Preview, not cbSkidNoPrint.Checked);

end;

procedure TDOC_SALE.Btn_PropertisClick(Sender: TObject);
begin
     {Отображаем "историю" приходной накладной}
     SHOW_HISTORY_DOC('Продажа № '+SALE_NUM.text,'SALE',DOC_SALE.tag);
end;

procedure TDOC_SALE.ToolButton20Click(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
       	PRINT_RNW(arrRN[NAKL_TAB_CTRL.TabIndex].RN_ID);
end;

procedure TDOC_SALE.ToolButton22Click(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
         PRINT_RN(arrRN[NAKL_TAB_CTRL.TabIndex].RN_ID, not cbSkidNoPrint.Checked);
end;

procedure TDOC_SALE.ToolButton23Click(Sender: TObject);
begin
    // Печать товарного чека
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
       	PRINT_CHECK1(arrRN[NAKL_TAB_CTRL.TabIndex].RN_ID, Preview, not cbSkidNoPrint.Checked);
end;

procedure TDOC_SALE.ToolButton25Click(Sender: TObject);
begin
     {Отображаем "историю" приходной накладной}
     SHOW_HISTORY_DOC('Расходная накладная №'+RN_NUM.text,'RN',arrRN[NAKL_TAB_CTRL.TabIndex].RN_ID);
end;

procedure TDOC_SALE.ToolButton26Click(Sender: TObject);
begin
     if Not Save and Btn_Apply.enabled then Btn_Apply.click;
     {Создаём документ на основании имеющегося...}
     SUBDOC(3,arrRN[NAKL_TAB_CTRL.TabIndex].RN_ID);
end;

procedure TDOC_SALE.SALE_DISKONTChange(Sender: TObject);
begin
     SAVE:=False;
end;

procedure TDOC_SALE.SALE_SKIDChange(Sender: TObject);
begin
    SAVE:=False;
end;

procedure TDOC_SALE.SALE_SKID_TXTChange(Sender: TObject);
begin
    SAVE:=False;
end;

procedure TDOC_SALE.SALE_DOSTClick(Sender: TObject);
begin
   SAVE:=False;
   DOST_DATE.visible:=SALE_DOST.checked;
//   if not autocheck then exit;

   if SALE_DOST.checked then
   begin
//   DOST := True;
   label15.Caption := 'Телефон :';
   ibquery3.Close;
   ibquery3.Open;
   while not ibquery3.Eof do
     begin
         if ibquery3.FieldByName('CFG_SET1').asinteger = 1 then
           begin
             SALE_WHO.Text := ibquery3.FieldByName('CFG_VALUE').asstring;
             ibquery3.First;
             break;
           end;
         ibquery3.Next;
     end;
   end
   else
   begin
   label15.Caption := 'Через кого:';
   ibquery3.Close;
   SALE_WHO.text := '';
//   dost := False;
   end;
end;

procedure TDOC_SALE.PrintCheck(RN_index: integer);
var
        a,i, J, index:integer;
        s:string;
        pog_summ:double;
        all_summ:double;
        cash_summ:double;
        oldFiltered: boolean;
        skid_money: double;        
//        check_file: textfile;
begin
   SAVE:= false;
   if (MemRNS.State in [dsInsert,DsEdit]) then MemRNS.Post;
   if Not Save and Btn_Apply.enabled then Btn_Apply.click;
   if not Save and Btn_Apply.enabled then Exit;

   if Model_KKM<>4 then exit;	//Штрих-ФР-К

   DataModule1.MainDicRnTyp.Locate('RNTYP_ID',SHOP_RNTYP_ID,[]);

   memRNs.Last;
   memrns.First;

   if memrns.RecordCount > 35 then
   begin
      Messbox('Покупок должно быть не более 35!',MessSYstem,48);
      exit;
   end;

    if not SALE_PROW then
   begin
      //посмотреть, хватает ли товара
      try
        memrns.DisableControls;
        MemRns.First;
        while not MemRns.eof do
        begin
          if memrns.FieldByName('OST').asfloat -  memrns.FieldByName('TW_KOL').asfloat < -0.0001 then
            break;

          MemRns.next;
        end;

        if not memRNS.Eof then  //не дошли до конча, есть минус
        begin
          Messbox('В накладной указано товара больше чем может быть отпущено!',MessSYstem,48);
        end;


      finally
        memrns.First;
        memrns.EnableControls;
      end;
   end;



 cash_summ:=0;
 clear_cash;

 MemRns.disablecontrols;
 oldFiltered := memrns.Filtered;
 memrns.Filtered:=false;

 i:=MemRns.Recno;
 MemRns.First;


 for J := 0 to  NAKL_TAB_CTRL.Tabs.Count-1 do
 begin
   //если печатается только один чек - остальные пропустить
   if rn_Index>-1 then
   	if J <> rn_Index then continue;

   if arrRN[J].KASSIR_ID > 0 then
   		if MessBox('Чек по расходной накладной № '+inttostr(arrRN[rn_index].RN_NUMS)+'уже печатался. Вы уверены, что хотите выбить чек снова?', MessSystem, MB_YESNO)=IDNO  then
    		continue;

//    cash_summ:=0;
   if arrRN[J].PO_SUMM>0 then
   begin

     // Чек с предоплатами

         	cash_summ:=cash_summ+RNSUMM(arrRN[J].FRM_ID)-arrRN[J].PO_SUMM;
            add_cash('Доплата за товар',RNSUMM(arrRN[J].FRM_ID)-arrRN[J].PO_SUMM,1,1, 'РН '+inttostr(arrRN[J].RN_NUMS)+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(arrRN[J].RN_ID)+']', arrRN[J].FRM_ID);
//      MemRns.First;
//   	  while not MemRns.eof do
//      begin
//
//        if MEMRNS.FieldbyName('SALER_ID').asinteger <> arrRN[J].FRM_ID then
//        begin
//        	 MemRns.next;
//             continue;
//        end;
//
//        s:=MemRns.fieldbyname('TW_ART').asstring;
//        s:=s+' '+MemRns.fieldbyname('TW_NAM').asstring ;
//     	if length(s)>252 then s:=b_utils.left(s,252);
//
//
//        add_cash(s,0,
//     		MemRns.fieldbyname('TW_KOL').asfloat,1,'РН '+inttostr(arrRN[J].RN_NUMS)+'/'+inttostr(SHOP_ID-1)+' ['+MemRns.fieldbyname('RN_ID').asstring+']', MemRns.fieldbyname('SALER_ID').asinteger);
//
//
//        MemRns.next;
//      end;


   end
   else	//нет предоплат

   begin
   	// Обычный чек


      MemRns.First;
   	  while not MemRns.eof do
      begin

        if MEMRNS.FieldbyName('SALER_ID').asinteger <> arrRN[J].FRM_ID then
        begin
        	 MemRns.next;
             continue;
        end;

        s:=MemRns.fieldbyname('TW_ART').asstring;

        if PRINT_KKM_TW_NAME=1 then
          s:=s+' '+MemRns.fieldbyname('TW_NAM').asstring;
        if PRINT_KKM_TW_NAME=2 then
          s:=s+' '+MemRns.fieldbyname('TW_SHORT_NAM').asstring;


     	  if length(s)>252 then s:=b_utils.left(s,252);

        cash_summ:=cash_summ+ MemRns.fieldbyname('TW_OKMONEY').asfloat * MemRns.fieldbyname('TW_KOL').asfloat;
     skid_money:=MemRns.fieldbyname('TW_MONEY').asfloat - MemRns.fieldbyname('TW_OKMONEY').asfloat;

     if (self.cbSkidNoPrint.Checked) then
        skid_money:=0;

     	add_cash(s,MemRns.fieldbyname('TW_OKMONEY').asfloat,
     		round(MemRns.fieldbyname('TW_KOL').asfloat*10000)/10000,1,'РН '+inttostr(arrRN[J].RN_NUMS)+'/'+inttostr(SHOP_ID-1)+' ['+MemRns.fieldbyname('RN_ID').asstring+']', MemRns.fieldbyname('SALER_ID').asinteger,
          skid_money, strtoint('0'+SALE_DISKONT.Text), MemRns.fieldbyname('ED_SHORT').asstring, 'СКЛАД: '+SKL.Text);
        FRShtrih.lastTW_Name := s;
     	MemRns.next;
      end;




   end;
 end;


   memrns.Filtered := oldFiltered;
   MemRns.First;
   for a:=1 to i-1 do MemRns.Next;
   MemRns.Enablecontrols;




 		Application.createForm(TPRINT_KKM,PRINT_KKM);
       	PRINT_KKM.MON1.value:=cash_summ;
    	PRINT_KKM.MON2.value:=PRINT_KKM.MON1.value;

    	DataModule1.MainDicRnTyp.Locate('RNTYP_ID',SHOP_RNTYP_ID,[]);
    	PRINT_KKM.label3.tag:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger;	//если = 2 - выделять НДС
    	PRINT_KKM.label2.tag :=DicShopRvid.fieldbyname('RVID_SUBKLN').asinteger;		//если=1 - безналичный расчет


    	PRINT_KKM.showModal;
    	PRINT_KKM.destroy;

  for J := 0 to  NAKL_TAB_CTRL.Tabs.Count-1 do
  begin
     if arrRN[J].RN_ID > 0 then
         SAVE_RN_KASSIR(arrRN[J].RN_ID);
  end;


end;


procedure TDOC_SALE.SAVE_RN_KASSIR(_RN_ID: integer);
begin

   try
	IBSAVE_CLEAR;
    IBSAVE_ADD('KASSA_ID',KKM_ID);
	IBSAVE_ADD('KASSIR_ID',USERID);

    IBSAVE_DOC('RN',_RN_ID);
    Datamodule1.IBTransaction2.Commit;
   except
    Datamodule1.IBTransaction2.Rollback;
   end;
    Datamodule1.IBTransaction2.Active:=false;
end;

procedure TDOC_SALE.ToolButton24Click(Sender: TObject);
begin
	PrintCheck(NAKL_TAB_CTRL.TabIndex);
end;

procedure TDOC_SALE.Btn_PrintKKMClick(Sender: TObject);
var a: integer;
begin

   PrintCheck(-1);

  MAIN_FORM.DISPLAY_SHOW('', '',
          'спасибо за покупку!','' );

   

end;

function TDOC_SALE.PO_POG_SUMM(): currency;
var pog_summ: currency;
begin
      pog_summ:=0;
      QrListPo.first;
      while not QrListPo.eof do begin
            pog_summ:=pog_summ+QrListPo.fieldByname('PORN_SUMM').asfloat;
            QrListPo.next;
      end;
      QrListPo.first;
      result := pog_summ;
end;

procedure TDOC_SALE.MemRNSAfterEdit(DataSet: TDataSet);
begin
    save := False;
end;

procedure TDOC_SALE.SALE_DOSTMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DOST := SALE_DOST.Checked;
end;

procedure TDOC_SALE.PrintTwCheckFastExecute(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        PRINT_SALE_CHECK1(DOC_SALE.Tag, NoPreview, not cbSkidNoPrint.Checked);
end;

procedure TDOC_SALE.MnPRINTKKMClick(Sender: TObject);
begin
  if     DOC_PAGE_CONTROL.ActivePageIndex =0 then
    Btn_PrintKKMClick(nil)
  else ToolButton24Click(nil);

end;

procedure TDOC_SALE.RxDBGrid1ColExit(Sender: TObject);
begin
 Refresh_SUMM;
end;

procedure TDOC_SALE.DsRNSDataChange(Sender: TObject; Field: TField);
begin
if ((memRNS.State in [dsEdit]) and (field<>nil))  and ((Field.FieldName = 'TW_KOL') ) then
     begin
     if CHECK_DOSTUP('$EDIT.SAVEDISCONT')=false then
     begin
      if (sale_skid.Value > 0) then
       begin
        if not (Messbox('При изменении продажи дисконт будет аннулирован.'+#13+#10+'Продолжить?',MessSubmit,4+48+256)=6)
        then
        begin
          memRNS.Cancel;
          exit;
        end;
//'      memRNS.post;
        btn_nodiscont.Click;
       end;

     end;
     Refresh_summ;
     end;

    if MemRNS.State in [dsInsert,dsEdit] then SAVE:=False;

end;

procedure TDOC_SALE.SALE_OSNChange(Sender: TObject);
begin
    save := False;
end;

procedure TDOC_SALE.DOST_DATEChange(Sender: TObject);
begin
save:=False;
end;

procedure TDOC_SALE.SALE_DATEChange(Sender: TObject);
begin
save:=False;
end;

procedure TDOC_SALE.SALE_WHOChange(Sender: TObject);
begin
save:=False;
end;

procedure TDOC_SALE.RVIDKLNChange(Sender: TObject);
begin
save:=False;
end;

procedure TDOC_SALE.actOpenDrawerExecute(Sender: TObject);
begin
    if MODEL_KKM<>4 then Exit;

    FRShtrih.OpenDrawer;

end;

procedure TDOC_SALE.ToolButton13Click(Sender: TObject);
var
  ID:integer;
  r:double;
  RNTYP_SHORT: string;
begin
   // Новая предоплата
   if arrRN[NAKL_TAB_CTRL.tabindex].RN_ID<0 then messbox('Накладная не сохранена!',MessSystem,48) else begin
     Application.createForm(TDOC_PO,DOC_PO);
     DOC_PO.tag:=-1;
     DOC_PO.FRM.Tag := arrRN[NAKL_TAB_CTRL.tabindex].FRM_ID;
     DOC_PO.ShowModal;
     if DOC_PO.tag>0 then begin
     	DataModule1.MainDicRnTyp.Locate('RNTYP_ID',self.ToolBar1.Tag,[]);
     	RNTYP_SHORT:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_SHORT').asstring;
        // фиксируем предоплату на эту накладную
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       Try
         IBSAVE_CLEAR;
         IBSAVE_ADD('PO_ID',DOC_PO.tag);
         IBSAVE_ADD('RN_ID',arrRN[NAKL_TAB_CTRL.tabindex].RN_ID);
         IBSAVE_ADD('PORN_SUMM',DOC_PO.PO_SUMM.value);
         if IBSAVE_DOC('PORN',-1)<0 then r:=sqrt(-1);
         // фиксируем факт добавления
         IBSAVE_CLEAR;
         IBSAVE_ADD('DOC','PO');
         IBSAVE_ADD('US_ID',USERID);
         IBSAVE_ADD('SHOP_ID',SHOPID);
         IBSAVE_ADD('MESS','В накладную '+RNTYP_SHORT+RN_NUM.text+' добавлена предоплата № '+
         DOC_PO.PO_NUM.text+' на сумму '+floattostrf(DOC_PO.PO_SUMM.value,fffixed,19,2)+' руб.');
         IBSAVE_ADD('DOP1',2);
         IBSAVE_ADD('DOP2',DOC_PO.tag);
         if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
         // повторяем для расходной
         IBSAVE_CLEAR;
         IBSAVE_ADD('DOC','RN');
         IBSAVE_ADD('US_ID',USERID);
         IBSAVE_ADD('SHOP_ID',SHOPID);
         IBSAVE_ADD('MESS','В накладную '+RNTYP_SHORT+RN_NUM.text+' добавлена предоплата № '+
         DOC_PO.PO_NUM.text+' на сумму '+floattostrf(DOC_PO.PO_SUMM.value,fffixed,19,2)+' руб.');
         IBSAVE_ADD('DOP1',2);
         IBSAVE_ADD('DOP2',arrRN[NAKL_TAB_CTRL.tabindex].RN_ID);
         if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
         Datamodule1.IBTransaction2.Commit;
       except
         Datamodule1.IBTransaction2.RollBAck;
       end;
       Datamodule1.IBTransaction2.Active:=False;
       PoTransaction.Active:=False;
       QrListPO.close;
       QrListPO.paramByname('RN_ID').asinteger:=arrRN[NAKL_TAB_CTRL.tabindex].RN_ID;;
       QrListPO.open;
     end;
     DOC_PO.Destroy;
    end;
end;


procedure TDOC_SALE.actFastPrintRnExecute(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        PRINT_SALE(DOC_SALE.Tag, not cbSkidNoPrint.Checked, true, true);
end;

procedure TDOC_SALE.print_mh3Execute(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        PRINT_SALE_MH3(DOC_SALE.Tag, 1);
end;

procedure TDOC_SALE.comboDiscontChange(Sender: TObject);
begin
 NEW_DISKONT_NUM:='';

 {
 ---
Праздничный день
Лифт
День рождения


 }

  if (self.comboDiscont.ItemIndex = 0) then
  begin
     DISKONT_ID:=0;
     SALE_DISKONT.text:='';
     DISKONT_ID:=0;
     SALE_SKID.value:=0;
     SALE_SKID_TXT.text:='';
     Refresh_Summ;
     save:=False;
     exit;
  end;

 if (self.comboDiscont.ItemIndex = 1) then
        NEW_DISKONT_NUM:='70045605';
 if (self.comboDiscont.ItemIndex = 2) then
        NEW_DISKONT_NUM:='70044751';
 if (self.comboDiscont.ItemIndex = 3) then
        NEW_DISKONT_NUM:='70039801';
 if (self.comboDiscont.ItemIndex = 4) then //сопутствующий товар
        NEW_DISKONT_NUM:='70045607';
 if (self.comboDiscont.ItemIndex = 5) then //поврежденный товар
        NEW_DISKONT_NUM:='70045554';
 if (self.comboDiscont.ItemIndex = 6) then //компенсация покупателю
        NEW_DISKONT_NUM:='70045591';
 if (self.comboDiscont.ItemIndex = 7) then //Дикон-Авто
        NEW_DISKONT_NUM:='202176';




 Timer1Timer(nil);
 
end;

end.
