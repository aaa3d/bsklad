unit EditTw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,Data1, RxLookup, Db, IBCustomDataSet,
  IBQuery, RXSpin, Mask, ToolEdit, CurrEdit, ToolWin, Grids, DBGrids,
  RXDBCtrl, IBDatabase,B_utils,B_DButils, RxMemDS, Menus,VclUtils,EditEdk,DicKTG,
  DBTables;

  
type
  TEdit_TW = class(TForm)
    IbQrED: TIBQuery;
    DsQrEd: TDataSource;
    IbQrEDED_ID: TIntegerField;
    IbQrEDED_FULL: TIBStringField;
    IbQrValuta: TIBQuery;
    IbQrValutaVALUTA_ID: TIntegerField;
    IbQrValutaVALUTA_FULL: TIBStringField;
    DsQrValuta: TDataSource;
    IbQrValutaVALUTA_SHORT: TIBStringField;
    IbQrEDED_SHORT: TIBStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    ED_ID: TRxDBLookupCombo;
    Label6: TLabel;
    VALUTA_ID: TRxDBLookupCombo;
    Label7: TLabel;
    TW_MADE: TEdit;
    Label8: TLabel;
    TW_RAZM: TEdit;
    Label9: TLabel;
    TW_UP: TEdit;
    Label10: TLabel;
    TW_PRIM: TMemo;
    Label11: TLabel;
    TW_SEK: TRxSpinEdit;
    TW_RASPR: TCheckBox;
    Label12: TLabel;
    TW_MROZ: TRxCalcEdit;
    TW_MROZ2: TRxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    TW_ART: TEdit;
    Label3: TLabel;
    TW_NAME: TEdit;
    TabSheet3: TTabSheet;
    ToolBar1: TToolBar;
    TwMon_INS_BTN: TToolButton;
    TwMon_DEL_BTN: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolBar2: TToolBar;
    BtnNewEdk: TToolButton;
    BtnOpenEdk: TToolButton;
    BtnDelEdk: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    RxDBGrid2: TRxDBGrid;
    StatusBar1: TStatusBar;
    Label16: TLabel;
    EditTwTransaction: TIBTransaction;
    IbQrTwKtg: TIBQuery;
    DsQrTwKtg: TDataSource;
    IbQrTwKtgTWKTG_ID: TIntegerField;
    IbQrTwKtgTWKTG_NAM: TIBStringField;
    IbQrTwKtgTWKTG_PRIM: TIBStringField;
    IbQrTwKtgTWKTG_COLOR: TIntegerField;
    TWKTG: TRxDBLookupCombo;
    IBQuery1: TIBQuery;
    IbQrValutaKURS_KURS: TFloatField;
    IbQrValutaKURS_DATE: TDateTimeField;
    Label17: TLabel;
    TW_POST: TEdit;
    Label18: TLabel;
    TW_KASSA: TRxSpinEdit;
    Label19: TLabel;
    TW_MROZ_BRAK: TRxCalcEdit;
    TW_MROZ2_BRAK: TRxCalcEdit;
    WorkTransaction: TIBTransaction;
    TabSheet4: TTabSheet;
    Label21: TLabel;
    TW_LAND: TEdit;
    TW_TAM: TEdit;
    Edit: TLabel;
    TwSert: TRxMemoryData;
    TwSertSERT_ID: TIntegerField;
    TwSertSERT_NUM: TStringField;
    TwSertSERT_DATE: TDateField;
    TwSertSERT_WHO: TStringField;
    ToolBar3: TToolBar;
    TW_SERT_INS: TToolButton;
    TW_SERT_DEL: TToolButton;
    DsSert: TDataSource;
    RxDBGrid3: TRxDBGrid;
    TabSheet5: TTabSheet;
    RxDBGrid4: TRxDBGrid;
    PropTw: TRxMemoryData;
    PropTwPROPTWTYP_ID: TIntegerField;
    PropTwPROPTWTYP_NAME: TStringField;
    PropTwPROPTW_ID: TIntegerField;
    PropTwPROPTW_VALUE: TStringField;
    DsPropTw: TDataSource;
    QueryWork: TIBQuery;
    MemProperty: TRxMemoryData;
    DsProperty: TDataSource;
    MemPropertyID: TIntegerField;
    MemPropertyvalue: TStringField;
    PropTwPROPTWTYP_TYP: TIntegerField;
    PropTwPROPTW_VALUEINT: TIntegerField;
    PropTwPROPTW_VALUEDT: TDateField;
    PropTwPROPTW_VALUEDBL: TFloatField;
    QueryWork2: TIBQuery;
    QueryWork3: TIBQuery;
    TabSheet6: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel8: TPanel;
    PROPTWKTG_DEL: TButton;
    RxDBGrid6: TRxDBGrid;
    TabSheet7: TTabSheet;
    Panel9: TPanel;
    BtnApply: TButton;
    BtnSave: TButton;
    BtnClose: TButton;
    Panel10: TPanel;
    Label14: TLabel;
    MON1: TRxCalcEdit;
    MON2: TRxCalcEdit;
    Panel11: TPanel;
    Label15: TLabel;
    PROP_INTEGER: TRxSpinEdit;
    PROP_COMBO: TRxDBLookupCombo;
    PROP_STRING: TEdit;
    PROP_DOUBLE: TRxCalcEdit;
    PROP_DATE: TDateEdit;
    ToolBar4: TToolBar;
    RxDBGrid7: TRxDBGrid;
    BtnShopNew: TToolButton;
    BtnShopOpen: TToolButton;
    BtnShopDel: TToolButton;
    DsShop: TDataSource;
    ShopTransaction: TIBTransaction;
    QueryShop: TIBQuery;
    QueryShopTWMONSHOP_ID: TIntegerField;
    QueryShopSHOP_ID: TIntegerField;
    QueryShopSHOP_NAME: TIBStringField;
    MemEdk: TRxMemoryData;
    MemEdkEDK_ID: TIntegerField;
    MemEdkED_ID: TIntegerField;
    MemEdkED_SHORT: TStringField;
    MemEdkTW_MON: TFloatField;
    MemEdkTW_MON2: TFloatField;
    MemEdkTW_UP: TStringField;
    MemEdkED_RAZM: TStringField;
    DsEdk: TDataSource;
    MemEdkTW_KOL: TFloatField;
    ToolButton1: TToolButton;
    Label23: TLabel;
    EDK_MON: TRxCalcEdit;
    SHOP_MON: TRxCalcEdit;
    Label24: TLabel;
    ToolButton2: TToolButton;
    TabSheet8: TTabSheet;
    StatusBar2: TStatusBar;
    ToolBar5: TToolBar;
    BarCode_New: TToolButton;
    BarCode_Open: TToolButton;
    BarCode_DEL: TToolButton;
    ToolButton8: TToolButton;
    BarCodeTransaction: TIBTransaction;
    RxDBGrid8: TRxDBGrid;
    StatusBar3: TStatusBar;
    QueryShopTW_MONEY: TFloatField;
    QueryShopTW_MONEY2: TFloatField;
    QueryShopSKID_PERCENT: TFloatField;
    Label13: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    OPTV1: TRxCalcEdit;
    OPT1: TRxCalcEdit;
    OPTSKID1: TRxCalcEdit;
    OPTSKID2: TRxCalcEdit;
    OPT2: TRxCalcEdit;
    OPTV2: TRxCalcEdit;
    OPTSKID3: TRxCalcEdit;
    OPT3: TRxCalcEdit;
    OPTV3: TRxCalcEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    OPTKOL1: TRxCalcEdit;
    Label31: TLabel;
    Label32: TLabel;
    OPTKOL2: TRxCalcEdit;
    Label33: TLabel;
    OPTKOL3: TRxCalcEdit;
    Button1: TButton;
    PropTwKtgTransaction: TIBTransaction;
    QueryPROPTWKTG: TIBQuery;
    DsPropTwKtg: TDataSource;
    QueryPROPTWKTGPROPTWKTG_ID: TIntegerField;
    QueryPROPTWKTGPROPTWKTG_NAME: TIBStringField;
    QueryPROPTWKTGOPIS: TIBStringField;
    QueryPROPTWKTGVID: TIntegerField;
    QueryPROPTWKTGPROPTWKTGLINK_ID: TIntegerField;
    Timer1: TTimer;
    TW_NDS_SMALL: TCheckBox;
    Label20: TLabel;
    TW_SHORT_NAME: TEdit;
    Label22: TLabel;
    TW_WEIGHT: TRxCalcEdit;
    Label34: TLabel;
    TW_SALER: TRxDBLookupCombo;
    checkKWM_UCHET: TCheckBox;
    WarnLabel: TLabel;
    PRICE_GRID: TRxDBGrid;
    PRICE: TRxMemoryData;
    DS_PRICE: TDataSource;
    PRICEtwprice_oldmoney: TFloatField;
    PRICEtwpricetyp_desc: TStringField;
    PRICEtwprice_money: TFloatField;
    PRICEtwprice_typ: TIntegerField;
    PRICEtwprice_id: TIntegerField;
    TW_NOSKID: TCheckBox;
    TW_PRICE_PRINT: TCheckBox;
    PRICEtwprice_money_origin: TFloatField;
    PRICEtm1: TDateField;
    PRICETWPRICE_DATE: TDateTimeField;
    PRICEdt_origin: TDateTimeField;
    PRICEnac_percent: TFloatField;
    PRICEtw_zak: TFloatField;
    Q_BAR_CODE: TIBQuery;
    DS_BAR_CODE: TDataSource;
    Q_BAR_CODEBAR_CODE_ID: TIntegerField;
    Q_BAR_CODETW_ID: TIntegerField;
    Q_BAR_CODEBAR_CODE_VALUE: TIBStringField;
    Q_BAR_CODEBAR_CODE_TYP: TIntegerField;
    Q_BAR_CODEUS_ID: TIntegerField;
    Q_BAR_CODETM: TDateTimeField;
    Label25: TLabel;
    TW_NUMBER: TRxSpinEdit;
    Label37: TLabel;
    TW_MROZ_2: TRxCalcEdit;
    Label38: TLabel;
    TW_PRIM_2: TEdit;
    Label39: TLabel;
    TW_NAM_INT: TEdit;
    Label40: TLabel;
    STORE_PRICE: TRxCalcEdit;
    GroupBox1: TGroupBox;
    TW_PALET_KOL: TRxCalcEdit;
    TW_PALET_UCHET: TCheckBox;
    Button2: TButton;
    Label43: TLabel;
    TW_PALET_KUBATORA: TRxCalcEdit;
    Label44: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label42: TLabel;
    TW_LENGTH: TRxCalcEdit;
    TW_WIDTH: TRxCalcEdit;
    TW_HEIGHT: TRxCalcEdit;
    chk_stored_in_up: TCheckBox;
    tw_kol_in_up: TRxCalcEdit;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    up_length: TRxCalcEdit;
    Label48: TLabel;
    up_width: TRxCalcEdit;
    Label49: TLabel;
    up_height: TRxCalcEdit;
    chk_typical_palet: TCheckBox;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    palet_length: TRxCalcEdit;
    Label53: TLabel;
    palet_width: TRxCalcEdit;
    Label54: TLabel;
    palet_height: TRxCalcEdit;
    Label55: TLabel;
    up_kol_in_pal: TRxCalcEdit;
    checkNegabarit: TCheckBox;
    Label41: TLabel;
    up_kubatura: TRxCalcEdit;
    Label56: TLabel;
    ed_kubatura: TRxCalcEdit;
    Label57: TLabel;
    TW_MASTER_ART: TEdit;
    chk_TW_IS_OPT: TCheckBox;
    tw_report_ed: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCloseClick(Sender: TObject);
    procedure VALUTA_IDChange(Sender: TObject);
    procedure TW_MROZChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TW_NAMEChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure TW_MROZ_BRAKChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ED_IDChange(Sender: TObject);
    procedure TwMonTW_MONEYChange(Sender: TField);
    procedure TwMonTW_KOLChange(Sender: TField);
    procedure TW_LANDChange(Sender: TObject);
    procedure TW_TAMChange(Sender: TObject);
    procedure DsSertDataChange(Sender: TObject; Field: TField);
    procedure TW_SERT_INSClick(Sender: TObject);
    procedure TW_SERT_DELClick(Sender: TObject);
    procedure TWKTGChange(Sender: TObject);
    procedure PropTwAfterScroll(DataSet: TDataSet);
    procedure Apply2;
    procedure RxDBGrid6DblClick(Sender: TObject);
    procedure PROPTWKTG_DELClick(Sender: TObject);
    procedure QueryShopAfterOpen(DataSet: TDataSet);
    procedure BtnShopDelClick(Sender: TObject);
    procedure BtnShopNewClick(Sender: TObject);
    procedure BtnShopOpenClick(Sender: TObject);
    procedure RxDBGrid7DblClick(Sender: TObject);
    procedure PROP_INTEGERChange(Sender: TObject);
    procedure PROP_STRINGChange(Sender: TObject);
    procedure PROP_DOUBLEChange(Sender: TObject);
    procedure PROP_DATEChange(Sender: TObject);
    procedure PROP_COMBOChange(Sender: TObject);
    procedure MemEdkAfterPost(DataSet: TDataSet);
    procedure BtnNewEdkClick(Sender: TObject);
    procedure MemEdkCalcFields(DataSet: TDataSet);
    procedure BtnOpenEdkClick(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure BtnDelEdkClick(Sender: TObject);
    procedure BarCode_DELClick(Sender: TObject);
    procedure BarCode_NewClick(Sender: TObject);
    procedure BarCode_OpenClick(Sender: TObject);
    procedure RxDBGrid8DblClick(Sender: TObject);
    procedure OPTV1Change(Sender: TObject);
    procedure OPT1Change(Sender: TObject);
    procedure OPTSKID1Change(Sender: TObject);
    procedure OPTV2Change(Sender: TObject);
    procedure OPTV3Change(Sender: TObject);
    procedure OPT2Change(Sender: TObject);
    procedure OPT3Change(Sender: TObject);
    procedure OPTSKID2Change(Sender: TObject);
    procedure OPTSKID3Change(Sender: TObject);
    procedure OPTKOL1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure QueryPROPTWKTGAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid6DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure TW_SALERChange(Sender: TObject);
    procedure PRICECalcFields(DataSet: TDataSet);
    procedure PropTwAfterPost(DataSet: TDataSet);
    procedure TW_NOSKIDClick(Sender: TObject);
    procedure TW_PRICE_PRINTClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure chk_typical_paletClick(Sender: TObject);
    procedure doCalcSkladPaletParams();
    procedure palet_lengthChange(Sender: TObject);
    procedure chk_stored_in_upClick(Sender: TObject);
    procedure up_lengthChange(Sender: TObject);
    procedure TW_LENGTHChange(Sender: TObject);
    procedure TW_PALET_UCHETClick(Sender: TObject);
    procedure change_tw_up_text();
    procedure change_tw_razm_text();
    procedure up_lengthKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure palet_lengthKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TW_LENGTHKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TW_PALET_KUBATORAChange(Sender: TObject);
  private
    { Private declarations }
    form_loading: boolean;
  public
    { Public declarations }
  end;

var
  OPT1_ID,OPT2_ID,OPT3_ID:integer;
  CanChange:boolean;
  CAN_SELECT_PROP:boolean;
  TWMON_DEL:array[1..10000] of integer;
  CNT_DEL:integer=0;
  TWSERT_DEL:array[1..10000] of integer;
  CNTSERT_DEL:integer=0;
  PROPTWKTGLINK_DEL:array[1..10000] of integer;
  CNTPROPTWKTGLINK_DEL:integer=0;
  EDK_DEL:array[1..10000] of integer;
  CNTEDK_DEL:integer=0;
  Edit_TW: TEdit_TW;
  SAVE:boolean;
  IDBRAK:integer;
  CanInsert,CanInsertSert:boolean;
  MOn_KURS:double;

implementation

uses DicTowar, EditTwShopMon, WaitForm, EditTwSkladMon;

{$R *.DFM}

var
  napr:integer; // Направление движения заголовка

procedure TEdit_TW.FormShow(Sender: TObject);
var
  tmpa:integer;
  fq: FastQuery;
begin

     form_loading:=true;

     fq:=FastQuery.Create('SELECT * FROM TW_PRICE_LIST_FRM(:TW_ID, :FRM_ID)');
     fq.parambyname('tw_id').asinteger:=EDIT_TW.tag;

     fq.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;

     fq.Open;
     price.LoadFromDataSet(fq, 0, lmAppend);
     fq.Close;
     fq.Destroy;


     PRICE_GRID.ReadOnly:= not CHECK_DOSTUP('$DICTW.TWPRICE_CHANGE');
     tw_noskid.Enabled:=not PRICE_GRID.ReadOnly;
     tw_price_print.Enabled:=CHECK_DOSTUP('$DICTW.TWPRICE_PRINT_CHANGE');


     napr:=1;
     Wait_Form.StatusBar1.panels[0].text:='Формирование карточки товара...';
     Wait_Form.Gauge1.Progress:=2;
     Wait_Form.Show;
     Delay(1);
     OPT1_ID:=-1;
     OPT2_ID:=-1;
     OPT3_ID:=-1;
     MemEdk.EmptyTable;
     CAN_SELECT_PROP:=false;
     EditTwTransaction.Active:=False;
     IbQrTwKtg.Close;
     IbQrTwKtg.Open;
     Wait_Form.StatusBar1.panels[0].text:='Чтение справочника категорий товара...';
     Wait_Form.Gauge1.Progress:=10;
     Delay(1);
     IbQrEd.Close;
     IbQrEd.Open;
     Wait_Form.StatusBar1.panels[0].text:='Чтение справочника валют...';
     Wait_Form.Gauge1.Progress:=20;
     Delay(1);
     IbQrValuta.Close;
     IbQrValuta.Open;
     Wait_Form.Gauge1.Progress:=30;
     Delay(1);
     CNT_DEL:=0;
     CNTSERT_DEL:=0;
     IbQrEd.First;
     Wait_Form.Gauge1.Progress:=40;
     Delay(1);
     if EDIT_TW.tag>0 then begin
        ShopTransaction.Active:=False;
        Wait_Form.StatusBar1.panels[0].text:='Чтение цен в магазинах...';
        Wait_Form.Gauge1.Progress:=50;
        Delay(1);
        QueryShop.close;
        QueryShop.ParamByname('TW_ID').asinteger:=EDIT_TW.tag;
        QueryShop.Open;

        Wait_Form.StatusBar1.panels[0].text:='Чтение штрих кодов...';
        Wait_Form.Gauge1.Progress:=60;
        Delay(1);
        Q_BAR_CODE.close;
        Q_BAR_CODE.ParamByname('TW_ID').asinteger:=EDIT_TW.tag;
        Q_BAR_CODE.Open;
       // Загружаем категории, в которые входит товар
        Wait_Form.StatusBar1.panels[0].text:='Чтение принадлежности к категориям...';
        Wait_Form.Gauge1.Progress:=70;
        Delay(1);
        ADD_SQL(QueryWork,'Select * from proptwktglink where tw_id=:tw_id');
        QueryWork.ParamByname('TW_ID').asinteger:=EDIT_TW.tag;
        QueryWork.Open;
        while not QueryWork.eof do begin
            // Добавляем принадлежность
            QueryWork.next;
        end;
     end;
     if Edit_Tw.tag<0 then begin
        {Новый товар}
        TwSERT.EmptyTable;
        CanInsert:=False;
        CanInsertSert:=False;
        TW_MROZ.value:=1;
        TW_MROZ_2.value:=1;        
        TW_MROZ_BRAK.value:=1;
        TW_ART.Text:='Новый';
        TW_NAME.Text:='';
        TW_MASTER_ART.text:='';
        chk_TW_IS_OPT.checked:=false;
        TW_NAM_INT.Text:='';
        TW_MADE.text:='';
        TW_RAZM.text:='';
        TW_LAND.text:='';
        TW_TAM.text:='';
        TW_UP.text:='';
        TW_PRIM.Lines.clear;
        TW_PRIM_2.Text:='';
        TW_POST.text:='';
        TW_WEIGHT.Value:=0;
        ED_ID.Value:=inttostr(DEFAULT_TW_ED);
        checkNegabarit.Checked:=false;
        TW_PRICE_PRINT.Checked:=true;
        TW_PRICE_PRINT.Tag:=-1;
        TW_NOSKID.Tag:=-1;
        //VALUTA_ID.Value:=inttostr(DEFAULT_TW_VALUTA);
        TWKTG.Value:=inttostr(DEFAULT_TW_TWKTG);
        TW_NUMBER.Value:=0;

        tw_report_ed.itemindex:=0;
        IDBRAK:=-1;
     end else begin
        {Правим  Товар}
        PropTwktgTransaction.Active:=False;
        QueryPropTwktg.close;
        QueryPropTwktg.ParamByname('TW_ID').asinteger:=Edit_tw.tag;
        QueryPropTwktg.Open;
        CanInsert:=False;
        WorkTransaction.Active:=False;
        ADD_SQL(IbQuery1,'select * from last_zak_frm( :tw_id, :frm_id)');
        IbQuery1.paramByname('TW_ID').asinteger:=Edit_tw.tag;
        IbQuery1.paramByname('FRM_ID').asinteger:=GL_FRM_WORK_MODE;
        Wait_Form.StatusBar1.panels[0].text:='Чтение цен последней закупки...';
        Wait_Form.Gauge1.Progress:=80;
        Delay(1);
        IbQuery1.Open;
        Statusbar2.panels[2].text:='  Последняя cебест: '+floattostrf(IbQuery1.fieldByname('TW_MONEY2').asfloat,fffixed,19,3)+' руб.';
        Statusbar2.panels[3].text:=floattostrf(IbQuery1.fieldByname('TW_MONEY2D').asfloat,fffixed,19,3)+' USD';
        Statusbar3.panels[3].text:='Последняя закупка: '+floattostrf(IbQuery1.fieldByname('TW_MONEY').asfloat,fffixed,19,3)+' руб.';
        Statusbar3.panels[4].text:=floattostrf(IbQuery1.fieldByname('TW_MONEYD').asfloat,fffixed,19,3)+' USD';
        WorkTransaction.Active:=False;
        IbQuery1.close;
        IBQuery1.SQL.clear;
        IBQuery1.SQL.add('select tw.*, (select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
        '(select max(kurs_date) from kurs where '+
        'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz2 from tw where tw_id=:tw_id');
        IbQuery1.ParamByname('TW_ID').asinteger:=Edit_TW.tag;
        Wait_Form.StatusBar1.panels[0].text:='Чтение карточки...';
        Wait_Form.Gauge1.Progress:=90;
        Delay(1);
        IbQuery1.open;
        TW_ART.text:=IbQuery1.fieldByname('TW_ART').asstring;
        TW_NAME.text:=IbQuery1.fieldByname('TW_NAM').asstring;
        TW_MASTER_ART.text:=IbQuery1.fieldByname('TW_MASTER_ART').asstring;
        if (TW_MASTER_ART.text='0') then TW_MASTER_ART.text:='';
        chk_TW_IS_OPT.checked:=IbQuery1.fieldByname('TW_IS_OPT').asInteger=1;


        TW_NAM_INT.text:=IbQuery1.fieldByname('TW_NAM_INT').asstring;
        TW_SHORT_NAME.text:=IbQuery1.fieldByname('TW_SHORT_NAM').asstring;
        ED_ID.value:=IbQuery1.fieldByname('ED_ID').asstring;
        //VALUTA_ID.value:=IbQuery1.fieldByname('VALUTA_ID').asstring;
        TW_MADE.text:=IbQuery1.fieldByname('TW_MADE').asstring;
        TW_RAZM.text:=IbQuery1.fieldByname('TW_RAZM').asstring;
        TW_WEIGHT.Value:=IbQuery1.fieldByname('TW_WEIGHT').asfloat;
        TW_LAND.text:=IbQuery1.fieldByname('TW_LAND').asstring;
        TW_TAM.text:=IbQuery1.fieldByname('TW_TAM').asstring;
        TW_UP.text:=IbQuery1.fieldByname('TW_UP').asstring;
        TW_POST.text:=IbQuery1.fieldByname('TW_POST').asstring;
        TW_PRIM.lines.clear;
        TW_PRIM.lines.add(IbQuery1.fieldByname('TW_PRIM').asstring);
        TW_PRIM_2.Text:=IbQuery1.fieldByname('TW_PRIM_2').asstring;

        TW_SEK.value:=IbQuery1.fieldByname('TW_SEK').asinteger;
        TW_KASSA.value:=IbQuery1.fieldByname('TW_KASSA').asinteger;
        if IbQuery1.fieldByname('TW_RASPR').asstring='1'
        then TW_RASPR.checked:=true else TW_RASPR.checked:=false;
        TWKTG.value:=IbQuery1.fieldByname('TWKTG_ID').asstring;
        TW_SALER.value:=IbQuery1.fieldByname('TW_SALER_ID').asstring;
        TW_MROZ.value:=IbQuery1.fieldByname('TW_MROZ2').value;
        TW_MROZ_2.value:=IbQuery1.fieldByname('TW_MROZ_2').asfloat;
        TW_MROZ2.displayFormat:=',#0.0000 '+IbQrValuta.fieldByname('VALUTA_SHORT').asstring;
        TW_NUMBER.Value:=IbQuery1.fieldByname('TW_NUMBER').asinteger;

        STORE_PRICE.Value:=IbQuery1.fieldByname('STORE_PRICE').asFloat;


//Игорь Сторожев. 10.04.2004 для НДС=10%
        if IbQuery1.fieldByname('TW_NDS_SMALL').asstring='1'
        then TW_NDS_SMALL.checked:=true else TW_NDS_SMALL.checked:=false;
        if IbQuery1.fieldByname('TW_NEGABARIT').asstring='1' then
        checkNegabarit.Checked:=true
        	else checkNegabarit.Checked:=false;
        if IbQuery1.fieldByname('TW_KWM_UCHET').asstring='1' then
          checkKWM_UCHET.Checked:=true
        else
          checkKWM_UCHET.Checked:=false;

        TW_LENGTH.value:=IbQuery1.fieldByname('TW_LENGTH').asfloat;
        TW_WIDTH.value:=IbQuery1.fieldByname('TW_WIDTH').asfloat;
        TW_HEIGHT.value:=IbQuery1.fieldByname('TW_HEIGHT').asfloat;

//палеты
        if IbQuery1.fieldByname('TW_PALET_UCHET').asstring='1' then
          TW_PALET_UCHET.Checked:=true
        else
          TW_PALET_UCHET.Checked:=false;
        TW_PALET_KOL.value:=IbQuery1.fieldByname('TW_PALET_KOL').asfloat;
        TW_PALET_KUBATORA.value :=IbQuery1.fieldByname('TW_PALET_KUBATORA').asfloat;


        if IbQuery1.fieldByname('CHK_STORED_IN_UP').asstring='1' then
          CHK_STORED_IN_UP.Checked:=true
        else
          CHK_STORED_IN_UP.Checked:=false;
        if IbQuery1.fieldByname('CHK_TYPICAL_PALET').asstring='1' then
          CHK_TYPICAL_PALET.Checked:=true
        else
          CHK_TYPICAL_PALET.Checked:=false;


        UP_KOL_IN_PAL.value:=IbQuery1.fieldByname('UP_KOL_IN_PAL').asfloat;
        TW_KOL_IN_UP.value:=IbQuery1.fieldByname('TW_KOL_IN_UP').asfloat;
        UP_LENGTH.value:=IbQuery1.fieldByname('UP_LENGTH').asfloat;
        UP_WIDTH.value:=IbQuery1.fieldByname('UP_WIDTH').asfloat;
        UP_HEIGHT.value:=IbQuery1.fieldByname('UP_HEIGHT').asfloat;
        PALET_LENGTH.value:=IbQuery1.fieldByname('PALET_LENGTH').asfloat;
        PALET_WIDTH.value:=IbQuery1.fieldByname('PALET_WIDTH').asfloat;
        PALET_HEIGHT.value:=IbQuery1.fieldByname('PALET_HEIGHT').asfloat;
        ED_KUBATURA.value:=IbQuery1.fieldByname('TW_ED_KUBATURA').asfloat;
        UP_KUBATURA.value:=IbQuery1.fieldByname('TW_UP_KUBATURA').asfloat;
        tw_report_ed.itemindex:=IbQuery1.fieldByname('tw_report_ed').asinteger;














{
        if IbQuery1.fieldByname('TW_NOSKID').asinteger=1 then
          TW_NOSKID.Checked:=true
        else
          TW_NOSKID.Checked:=false;
        if IbQuery1.fieldByname('TW_PRICE_PRINT').asinteger=1 then
          TW_PRICE_PRINT.Checked:=true
        else
          TW_PRICE_PRINT.Checked:=false;
}

        {Определяем данные брака}
        WorkTransaction.Active:=False;
        Wait_Form.StatusBar1.panels[0].text:='Чтение данных брака...';
        Wait_Form.Gauge1.Progress:=93;
        Delay(1);
        IbQuery1.close;
        IBQuery1.SQL.clear;
        IBQuery1.SQL.add('select * from tw where tw_art=:tw_art and TW_BRAK="1"');
        IbQuery1.ParamByname('TW_ART').asstring:=TW_ART.text;
        IbQuery1.open;
        if IbQuery1.eof then begin
           IDBRAK:=-1;
           TW_MROZ_BRAK.value:=1;
        end else begin
           IDBRAK:=IbQuery1.fieldByname('TW_ID').asinteger;
           TW_MROZ_BRAK.value:=IbQuery1.fieldByname('TW_MROZ').asfloat*IbQrValuta.fieldByname('KURS_KURS').asfloat;
        end;
        IbQuery1.close;
        {Определяем цены}
        Wait_Form.StatusBar1.panels[0].text:='Чтение оптовых цен...';
        Wait_Form.Gauge1.Progress:=97;
        Delay(1);
        IbQuery1.close;
        IBQuery1.SQL.clear;
        IBQuery1.SQL.add('select * from TWMON where TW_ID=:TW_ID order by TW_KOL');
        IBQuery1.ParamByname('TW_ID').asinteger:=Edit_Tw.tag;
        IbQuery1.Open;
        tmpa:=0;
        while not IbQuery1.eof do begin
          inc(tmpa);
          case tmpa of
            1: begin // Мелкий опт
                 OPT1_ID:=IbQuery1.fieldByname('TWMON_ID').asinteger;
                 OPTSKID1.value:=IbQuery1.fieldByname('SKID_PERCENT').asfloat;
                 OPTKOL1.value:=IbQuery1.fieldByname('TW_KOL').asfloat;
               end;
            2: begin // Опт
                 OPT2_ID:=IbQuery1.fieldByname('TWMON_ID').asinteger;
                 OPTSKID2.value:=IbQuery1.fieldByname('SKID_PERCENT').asfloat;
                 OPTKOL2.value:=IbQuery1.fieldByname('TW_KOL').asfloat;
               end;
            3: begin // Крупный опт
                 OPT3_ID:=IbQuery1.fieldByname('TWMON_ID').asinteger;
                 OPTSKID3.value:=IbQuery1.fieldByname('SKID_PERCENT').asfloat;
                 OPTKOL3.value:=IbQuery1.fieldByname('TW_KOL').asfloat;
               end;
          end;
          IbQuery1.next;
        end;
        IbQuery1.close;
        {Определяем Сертификаты};
        Wait_Form.StatusBar1.panels[0].text:='Чтение сертификатов...';
        Wait_Form.Gauge1.Progress:=98;
        Delay(1);
        ADD_SQL(IBQuery1,'select * from sert where tw_id=:tw_id');
        IBQuery1.ParamByname('TW_ID').asinteger:=Edit_Tw.tag;
        IbQuery1.Open;
        while not IbQuery1.eof do begin
              CanInsertSert:=True;
              TwSert.Insert;
              TwSert.FieldByname('SERT_ID').asinteger:=IbQuery1.fieldByname('SERT_ID').asinteger;
              TwSert.FieldByname('SERT_NUM').asstring:=IbQuery1.fieldByname('SERT_NUM').asstring;
              TwSert.FieldByname('SERT_WHO').asstring:=IbQuery1.fieldByname('SERT_WHO').asstring;
              TwSert.FieldByname('SERT_DATE').asdatetime:=IbQuery1.fieldByname('SERT_DATE').asdatetime;
              TwSert.Post;
              CanInsertSert:=False;
              IbQuery1.next;
        end;
        IbQuery1.close;
        TwSert.First;
        Wait_Form.StatusBar1.panels[0].text:='Чтение других единиц измерения...';
        Wait_Form.Gauge1.Progress:=99;
        Delay(1);
        // Загружаем цены от единиц измерени
        ADD_SQL(IbQuery1,'select EDK.*,ED.ED_FULL from EDK,ED where EDK.ED_ID=ED.ED_ID and EDK.TW_ID=:TW_ID order by ED_SHORT');
        IbQuery1.ParamByname('TW_ID').asinteger:=EDIT_TW.tag;
        IbQuery1.Open;
        While not IbQuery1.eof do begin
           MemEDK.Append;
           MemEDK.FieldByname('EDK_ID').asinteger:=IbQuery1.fieldByname('EDK_ID').asinteger;
           MemEDK.FieldByname('ED_ID').asinteger:=IbQuery1.fieldByname('ED_ID').asinteger;
           MemEDK.FieldByname('ED_SHORT').asstring:=IbQuery1.fieldByname('ED_FULL').asstring;
           MemEDK.FieldByname('TW_MON').asfloat:=IbQuery1.fieldByname('TW_MONEY').asfloat;
           MemEDK.FieldByname('ED_UP').asstring:=IbQuery1.fieldByname('EDK_UP').asstring;
           MemEDK.FieldByname('ED_RAZM').asstring:=IbQuery1.fieldByname('EDK_RAZM').asstring;
           MemEDK.FieldByname('TW_KOL').asfloat:=IbQuery1.fieldByname('EDK_KOL').asfloat;
           MemEDK.Post;
           IbQuery1.next;
        end;
        MemEDK.First;
     end;
     // Наполняем справочник свойств
     Wait_Form.StatusBar1.panels[0].text:='Чтение свойств...';
     Wait_Form.Gauge1.Progress:=100;
     Delay(1);
     WorkTransaction.Active:=False;
     // Читаем значени
     ADD_SQL(QueryWork2,'select * from PROPTW where TW_ID=:TW_ID AND FRM_ID=:FRM_ID order by PROPTW_ID');
     QueryWork2.ParamByname('TW_ID').asinteger:=Edit_Tw.tag;
     QueryWork2.ParamByname('FRM_ID').asinteger:=GL_FRM_WORK_MODE;
     QueryWork2.Open;
     OPEN_SQL(QueryWork,'Select * from proptwtyp');
     PropTW.EmptyTable;
     while not QueryWork.eof do begin
       PropTW.append;
       PropTW.fieldbyname('PROPTWTYP_ID').asinteger:=
          QueryWork.fieldbyname('PROPTWTYP_ID').asinteger;
       PropTW.fieldbyname('PROPTWTYP_TYP').asinteger:=
          QueryWork.fieldbyname('PROPTWTYP_TYP').asinteger;
       PropTW.fieldbyname('PROPTWTYP_NAME').asstring:=
          QueryWork.fieldbyname('PROPTWTYP_NAME').asstring;
       if QueryWork2.Locate('PROPTWTYP_ID',QueryWork.fieldbyname('PROPTWTYP_ID').asinteger,[]) then begin
         // Значение найдено
{         if QueryWork2.fieldbyname('PROPTWTYP_ID').asinteger=6 then
         begin
          if QueryWork2.fieldbyname('VALUEINT').asinteger=1 then
            TW_NOSKID.Checked:=true
          else
            TW_NOSKID.Checked:=false;
          TW_NOSKID.Tag:=QueryWork2.fieldbyname('PROPTW_ID').asinteger;
         end;

         if QueryWork2.fieldbyname('PROPTWTYP_ID').asinteger=3 then
         begin
          if QueryWork2.fieldbyname('VALUEINT').asinteger=1 then
            TW_PRICE_PRINT.Checked:=true
          else
            TW_PRICE_PRINT.Checked:=false;
          TW_PRICE_PRINT.Tag:=QueryWork2.fieldbyname('PROPTW_ID').asinteger;
         end;
}

         case PropTw.fieldByname('PROPTWTYP_TYP').asinteger of
           1: //Список
              begin
                PropTw.fieldByname('PROPTW_VALUEINT').asinteger:=QueryWork2.fieldByname('VALUEINT').asinteger;
                // Читаем значение строки
                ADD_SQL(QueryWork3,'select VALUESTR from PROPTW where TW_ID=0 and VALUEINT=:ID and PROPTWTYP_ID=:PROPTWTYP_ID');
                QueryWork3.Parambyname('ID').asinteger:=QueryWork2.fieldbyname('VALUEINT').asinteger;
                QueryWork3.Parambyname('PROPTWTYP_ID').asinteger:=QueryWork.fieldbyname('PROPTWTYP_ID').asinteger;
                QueryWork3.Open;
                if QueryWork3.eof then PropTw.fieldByname('PROPTW_VALUE').asstring:='Значение не найдено!'
                else
                  PropTw.fieldByname('PROPTW_VALUE').asstring:=QueryWork3.fieldByname('VALUESTR').asstring;
           end;
           2: // Целое
              begin
                PropTw.fieldByname('PROPTW_VALUEINT').asinteger:=QueryWork2.fieldByname('VALUEINT').asinteger;
                PropTw.fieldByname('PROPTW_VALUE').asstring:=inttostr(QueryWork2.fieldByname('VALUEINT').asinteger);
              end;
           3: //Дробное
              begin
                PropTw.fieldByname('PROPTW_VALUE').asstring:=floattostrf(QueryWork2.fieldByname('VALUEDBL').asfloat,fffixed,19,4);
                PropTw.fieldByname('PROPTW_VALUEDBL').asfloat:=QueryWork2.fieldByname('VALUEDBL').asfloat;
              end;
           4: //Дата
              begin
                   PropTw.fieldByname('PROPTW_VALUE').asstring:=date_sokr(QueryWork2.fieldByname('VALUEDT').asdatetime);
                   PROP_DATE.date:=QueryWork2.fieldByname('VALUEDT').asdatetime;
              end;
           5: //Строка
              begin
                   PropTw.fieldByname('PROPTW_VALUE').asstring:=QueryWork2.fieldByname('VALUESTR').asstring;
              end;
         end;
         PropTW.fieldbyname('PROPTW_ID').asinteger:=QueryWork2.fieldByname('PROPTW_ID').asinteger;
       end else begin
          PropTW.fieldbyname('PROPTW_ID').asinteger:=-2; // Значение не найдено
          PropTW.fieldbyname('PROPTW_VALUE').asstring:='не определено';
       end;
       PropTW.Post;
       QueryWork.next;
     end;
     PropTW.first;
     SAVE:=true;
     CAN_SELECT_PROP:=true;
     PropTwAfterScroll(PropTw);
     if Edit_TW.tag>0 then begin
        Tabsheet2.TabVisible:=True;
        Tabsheet3.TabVisible:=True;
        Tabsheet4.TabVisible:=True;
        Tabsheet5.TabVisible:=True;
        Tabsheet6.TabVisible:=True;
        Tabsheet7.TabVisible:=True;
        Tabsheet8.TabVisible:=True;
     end else begin
        Tabsheet2.TabVisible:=False;
        Tabsheet3.TabVisible:=False;
        Tabsheet4.TabVisible:=False;
        Tabsheet5.TabVisible:=False;
        Tabsheet6.TabVisible:=False;
        Tabsheet7.TabVisible:=False;
        Tabsheet8.TabVisible:=False;
        TW_PRICE_PRINT.Checked:=true;
     end;
     Wait_Form.Gauge1.Progress:=100;
     TW_SALER.Enabled:= CHECK_DOSTUP('$DICTW.SALER_CHANGE');
     tabsheet7.Enabled:= CHECK_DOSTUP('$DICTW.TWMONSHOP_CHANGE');
     Delay(100);
     Wait_Form.Hide;

     form_loading:=false;
end;

procedure TEdit_TW.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IbQrEd.Close;
     IbQrValuta.Close;
     IbQrTwKtg.Close;
     EditTwTransaction.Active:=False;
end;

procedure TEdit_TW.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TEdit_TW.VALUTA_IDChange(Sender: TObject);
begin
     MemEdkTW_MON.displayFormat:=',#0.0000 '+trim(IbQrValuta.fieldbyname('VALUTA_SHORT').asstring);
     TW_MROZ2.DisplayFormat:=',#0.0000 '+trim(IbQrValuta.fieldbyname('VALUTA_SHORT').asstring);
     MON2.DisplayFormat:=',#0.0000 '+trim(IbQrValuta.fieldbyname('VALUTA_SHORT').asstring);
     OPTV1.DisplayFormat:=',#0.0000 '+trim(IbQrValuta.fieldbyname('VALUTA_SHORT').asstring);
     OPTV2.DisplayFormat:=',#0.0000 '+trim(IbQrValuta.fieldbyname('VALUTA_SHORT').asstring);
     OPTV3.DisplayFormat:=',#0.0000 '+trim(IbQrValuta.fieldbyname('VALUTA_SHORT').asstring);
     TW_MROZ2.value:=TW_MROZ.value/IbQrValuta.fieldByname('KURS_KURS').asfloat;
     Mon_kurs:=IbQrValuta.fieldByname('KURS_KURS').asfloat;
     TW_MROZ2_BRAK.DisplayFormat:=',#0.0000 '+trim(IbQrValuta.fieldbyname('VALUTA_SHORT').asstring);
     TW_MROZ2_BRAK.value:=TW_MROZ_BRAK.value/IbQrValuta.fieldByname('KURS_KURS').asfloat;
     Statusbar3.panels[2].text:='Розница: '+floattostrf(TW_MROZ2.value,fffixed,19,4)+' '+trim(IbQrValuta.fieldbyname('VALUTA_SHORT').asstring);
     MON1.value:=TW_MROZ.value;
     MON2.value:=TW_MROZ2.value;
     OPT2Change(Sender);
     OPT1Change(Sender);
     OPT3Change(Sender);
     SAVE:=False;
end;

procedure TEdit_TW.TW_MROZChange(Sender: TObject);
begin
     TW_MROZ2.value:=TW_MROZ.value/IbQrValuta.fieldByname('KURS_KURS').asfloat;
     Statusbar3.panels[1].text:='Розница: '+floattostrf(TW_MROZ.value,fffixed,19,2)+' руб';
     Statusbar3.panels[2].text:='Розница: '+floattostrf(TW_MROZ2.value,fffixed,19,4)+' '+trim(IbQrValuta.fieldbyname('VALUTA_SHORT').asstring);
     EDK_MON.value:=TW_MROZ.value;
     SHOP_MON.value:=TW_MROZ.value;

     MON1.value:=TW_MROZ.value;
     MON2.value:=TW_MROZ2.value;
     SAVE:=False;
     OPTSKID2Change(Sender);
     OPTSKID1Change(Sender);
     OPTSKID3Change(Sender);
end;

procedure TEdit_TW.FormActivate(Sender: TObject);
begin
     PageControl1.ActivePage:=Tabsheet1;
end;

procedure TEdit_TW.TW_NAMEChange(Sender: TObject);
begin
     SAVE:=False;
     Statusbar2.panels[0].text:=TW_ART.text;
     Statusbar2.panels[1].text:=TW_NAME.text;
end;

procedure TEdit_TW.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose:=True;
     if not SAVE then begin
        if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения изменений!',MessSubmit,4+48+256)<>6
        then CanClose:=False;
     end;
end;

procedure TEdit_TW.BtnSaveClick(Sender: TObject);
begin
     SAVE:=False;
     BtnApply.click;
     if SAVE then BtnClose.click;
end;

procedure TEdit_TW.BtnApplyClick(Sender: TObject);
var
   r:double;
   n,a,ID,ID2,ID_TMP:integer;
   tw_number_use_art: integer;

   i_value: integer;

begin
 CAN_SELECT_PROP:=False;
 if (OPTKOL1.VALUE>OPTKOL2.value) or (OPTKOL1.VALUE>OPTKOL3.value) or (OPTKOL2.VALUE>OPTKOL3.value)
 then Messbox('Некорректное количество в оптовых ценах. От мелкого опта к крупному опту количество товара должно увеличиваться!',MessSystem,48)
 else begin
  if TW_NAME.text='' then begin
      messbox('Название товара не может быть пустой строкой!',MessSystem,48);
      Save:=False;
  end else
  if TW_SHORT_NAME.text='' then begin
      messbox('Сокращенное название товара не может быть пустой строкой!',MessSystem,48);
      Save:=False;
  end else begin

    if TW_MROZ.Value=0 then begin
       Messbox('Цена на товар не можеть нулевой!',MessSystem,48);
       Save:=False;
    end else
    begin
       IBQuery1.SQL.clear;
       IBQuery1.SQL.add('select TW_art from TW where tw_id <> :TW_ID and TW_NUMBER=:TW_NUMBER and TW_NUMBER<>0 and not tw_brak=1');
       IBQuery1.ParamByname('TW_ID').asinteger:=Edit_TW.tag;
       IBQuery1.ParamByname('TW_NUMBER').asinteger:=round(TW_NUMBER.value);
       IbQuery1.Open;
       if IbQuery1.eof then tw_number_use_art:=0 else tw_number_use_art:=ibQuery1.Fieldbyname('tw_art').asinteger;
       ibquery1.Close;
       if tw_number_use_art>0 then Messbox('Такой номер товара уже используется товаром '+inttostr(tw_number_use_art),MessSystem,16)
       else
       begin

       {Сохраняем}
       Wait_Form.StatusBar1.panels[0].text:='Запись карточки товара';
       Wait_Form.Gauge1.Progress:=2;
       Wait_Form.Show;
       Delay(1);
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       try
         IBSAVE_CLEAR;
         IBSAVE_ADD('TW_MASTER_ART','0'+TW_MASTER_ART.Text);
         IBSAVE_ADD('TW_IS_OPT',chk_TW_IS_OPT.checked);
         IBSAVE_ADD('TW_NAM',TW_NAME.Text);
         IBSAVE_ADD('TW_NAM_int',TW_NAM_INT.Text);
         IBSAVE_ADD('TW_SHORT_NAM',TW_SHORT_NAME.Text);
         IBSAVE_ADD('ED_ID',strtoint(ED_ID.value));
         IBSAVE_ADD('VALUTA_ID',strtoint(VALUTA_ID.value));
         IBSAVE_ADD('TW_MADE',TW_MADE.Text);
         IBSAVE_ADD('TW_RAZM',TW_RAZM.Text);
         IBSAVE_ADD('TW_WEIGHT',TW_WEIGHT.value);
         IBSAVE_ADD('TW_UP',TW_UP.Text);
         IBSAVE_ADD('TW_POST',TW_POST.Text);
         IBSAVE_ADD('TW_LAND',TW_LAND.Text);
         IBSAVE_ADD('TW_TAM',TW_TAM.Text);
         IBSAVE_ADD('TW_PRIM',memotostr(TW_PRIM.lines));
         IBSAVE_ADD('TW_PRIM_2',TW_PRIM_2.Text);
         IBSAVE_ADD('TW_SEK',int(TW_SEK.value));
         IBSAVE_ADD('TW_KASSA',int(TW_KASSA.value));
         IBSAVE_ADD('TW_NUMBER',int(TW_NUMBER.value));
         IBSAVE_ADD('TW_RASPR',TW_RASPR.checked);
         IBSAVE_ADD('TW_MROZ',TW_MROZ2.value);
         IBSAVE_ADD('TW_MROZ_2',TW_MROZ_2.value);         
         IBSAVE_ADD('TWKTG_ID',strtoint(TWKTG.value));
         IBSAVE_ADD('TW_SALER_ID',strtoint(TW_SALER.value));

         if Edit_TW.tag<=0 then
         begin
         if Dic_Towar.Treeview1.selected.ImageIndex=212 then//создается в виртуальном каталоге, принудительно сохранить в группе НОВЫЕ
          IBSAVE_ADD('TWTREE_ID',1000);

         if Dic_Towar.Treeview1.selected.ImageIndex=27 then//создается в стат каталоге
          IBSAVE_ADD('TWTREE_ID',Dic_Towar.Treeview1.selected.stateindex);
         end;




         IBSAVE_ADD('TW_BRAK',false);
         IBSAVE_ADD('TW_KOMPL',false);
         IBSAVE_ADD('TW_KOMPL',false);
//Игорь Сторожев 10.04.1004 для НДС=10%
         IBSAVE_ADD('TW_NDS_SMALL',TW_NDS_SMALL.checked);
         IBSAVE_ADD('TW_NEGABARIT',checkNEGABARIT.checked);
         IBSAVE_ADD('TW_KWM_UCHET',checkKWM_UCHET.checked);
         IBSAVE_ADD('TW_LENGTH',TW_LENGTH.value);
         IBSAVE_ADD('TW_WIDTH',TW_WIDTH.value);
         IBSAVE_ADD('TW_HEIGHT',TW_HEIGHT.value);

         IBSAVE_ADD('TW_PALET_UCHET', TW_PALET_UCHET.checked);
         i_value:=round(TW_PALET_KOL.value+0.499999);
         IBSAVE_ADD('TW_PALET_KOL',i_value);
         IBSAVE_ADD('TW_PALET_KUBATORA',TW_PALET_KUBATORA.value);


         IBSAVE_ADD('CHK_STORED_IN_UP',CHK_STORED_IN_UP.checked);
         IBSAVE_ADD('CHK_TYPICAL_PALET',CHK_TYPICAL_PALET.checked);
         i_value:=round(0.49999+UP_KOL_IN_PAL.value);
         IBSAVE_ADD('UP_KOL_IN_PAL',i_value);
         i_value:=round(0.49999+TW_KOL_IN_UP.value);
         IBSAVE_ADD('TW_KOL_IN_UP',i_value);
         IBSAVE_ADD('UP_LENGTH',UP_LENGTH.value);
         IBSAVE_ADD('UP_WIDTH',UP_WIDTH.value);
         IBSAVE_ADD('UP_HEIGHT',UP_HEIGHT.value);

         IBSAVE_ADD('PALET_LENGTH',PALET_LENGTH.value);
         IBSAVE_ADD('PALET_WIDTH',PALET_WIDTH.value);
         IBSAVE_ADD('PALET_HEIGHT',PALET_HEIGHT.value);



         IBSAVE_ADD('TW_ED_KUBATURA',ed_kubatura.value);
         IBSAVE_ADD('TW_UP_KUBATURA',up_kubatura.value);
         IBSAVE_ADD('tw_report_ed',tw_report_ed.itemindex);







         //IBSAVE_ADD('TW_NOSKID',TW_NOSKID.checked);
//         IBSAVE_ADD('TW_PRICE_PRINT',TW_PRICE_PRINT.checked);




         N:=IBSAVE_DOC('TW',Edit_TW.tag);











         if n<0 then r:=sqrt(-1) else
         begin
            Datamodule1.IBTransaction2.Commit;
            Datamodule1.IBTransaction2.Active:=False;
            {Определяем артикул}
            Wait_Form.Gauge1.Progress:=20;
            Delay(1);
            IbQuery1.close;
            WorkTransaction.Active:=False;
            IBQuery1.SQL.clear;
            IBQuery1.SQL.add('select TW_ART from TW where TW_ID= :TW_ID');
            IBQuery1.ParamByname('TW_ID').asinteger:=N;
            IbQuery1.Open;
            if IbQuery1.eof then Messbox('Ошибка в чтении артикула!',MessSystem,16);
            TW_ART.Text:=IbQuery1.fieldByname('TW_ART').asstring;
            IbQuery1.close;
            Datamodule1.IBTransaction2.StartTransaction;
            IBSAVE_ADD('TW_ART',TW_ART.Text);
            IBSAVE_ADD('TW_MROZ',TW_MROZ2_BRAK.value);
            IBSAVE_ADD('TW_NAM',b_utils.left('(Б) '+TW_NAME.Text, 128));
            IBSAVE_ADD('TW_WEIGHT',TW_WEIGHT.value);

            IBSAVE_ADD('TW_SHORT_NAM', b_utils.left('(Б) '+TW_SHORT_NAME.Text, 28));
            IBSAVE_ADD('TW_BRAK',true);
            IDBRAK:=IBSAVE_DOC('TW',IDBRAK);


             //принудительно сделать ссылку если товар новый
             if N > 0 then
             if Edit_TW.tag<=0 then
             begin
               IBSAVE_CLEAR;
               if Dic_Towar.Treeview1.selected.ImageIndex=212 then//создается в виртуальном каталоге, принудительно сохранить в группе НОВЫЕ
                IBSAVE_ADD('PARENT_ID',Dic_Towar.Treeview1.selected.stateindex);

               if Dic_Towar.Treeview1.selected.ImageIndex=27 then//создается в стат каталоге
                IBSAVE_ADD('PARENT_ID',1001);

               IBSAVE_ADD('CHILD_ID', N);
               IBSAVE_ADD('RELATION_TYP', 4);
               IBSAVE_DOC('RELATION', -1);

               IBSAVE_CLEAR;
               if Dic_Towar.Treeview1.selected.ImageIndex=212 then//создается в виртуальном каталоге, принудительно сохранить в группе НОВЫЕ
                IBSAVE_ADD('PARENT_ID',Dic_Towar.Treeview1.selected.stateindex);

               if Dic_Towar.Treeview1.selected.ImageIndex=27 then//создается в стат каталоге
                IBSAVE_ADD('PARENT_ID',1001);

               IBSAVE_ADD('CHILD_ID', IDBRAK);
               IBSAVE_ADD('RELATION_TYP', 4);
               IBSAVE_DOC('RELATION', -1);

             end;


            IBSAVE_CLEAR;
            IBSAVE_ADD('US_ID',USERID);
            IBSAVE_ADD('SHOP_ID',SHOPID);
            if EDIT_TW.tag<0 then IBSAVE_ADD('MESS','Создан в группе "'+Dic_TOWAR.treeview1.selected.text+'"')
            else IBSAVE_ADD('MESS','Изменен');
            if EDIT_TW.tag<0 then IBSAVE_ADD('DOP1',1) // Метка вставки
                             else IBSAVE_ADD('DOP1',-1); // Метка изменени
            IBSAVE_ADD('DOP2',n);
            IBSAVE_ADD('DOC','TW'); // Название таблицы
            IBSAVE_DOC('ARCUPDATE',-1);
            edit_tw.tag:=n;
            IF IDBRAK<0 then r:=Sqrt(-1) else begin
               {Сохраняем комплектацию и цены и сертификаты}
               Wait_Form.Gauge1.Progress:=30;
               Delay(1);
               for a:=1 to CNTSERT_DEL do begin
                   if TWSERT_DEL[a]>0 then begin
                      if not IBDELETE_DOC('SERT',TWSERT_DEL[a])
                      then r:=Sqrt(-1);
                   end;
               end;
               Wait_Form.Gauge1.Progress:=40;
               Delay(1);
               // Сохраняем имеющееся оптовые цены
               IBSAVE_CLEAR;
               IBSAVE_ADD('TW_ID',Edit_tw.tag);
               IBSAVE_ADD('TW_KOL',OPTKOL1.value);
               if OPTKOL1.value=0 then OPTSKID1.value:=0;
               IBSAVE_ADD('SKID_PERCENT',OPTSKID1.value);
               ID_TMP:=IBSAVE_DOC('TWMON',OPT1_ID);
               if ID_TMP<0 then r:=sqrt(-1) else OPT1_ID:=ID_TMP;

               IBSAVE_ADD('TW_KOL',OPTKOL2.value);
               if OPTKOL2.value=0 then OPTSKID2.value:=0;
               IBSAVE_ADD('SKID_PERCENT',OPTSKID2.value);
               ID_TMP:=IBSAVE_DOC('TWMON',OPT2_ID);
               if ID_TMP<0 then r:=sqrt(-1) else OPT2_ID:=ID_TMP;


               IBSAVE_ADD('TW_KOL',OPTKOL3.value);
               if OPTKOL3.value=0 then OPTSKID3.value:=0;
               IBSAVE_ADD('SKID_PERCENT',OPTSKID3.value);
               ID_TMP:=IBSAVE_DOC('TWMON',OPT3_ID);
               if ID_TMP<0 then r:=sqrt(-1) else OPT3_ID:=ID_TMP;






               // Перевыводим значения
               OPTSKID2Change(OPTSKID2);
               OPTSKID1Change(OPTSKID1);
               OPTSKID3Change(OPTSKID3);
               // Скидки от количества
               Wait_Form.Gauge1.Progress:=50;
               Delay(1);
               CNT_DEL:=0;
               TwSert.Disablecontrols;
               TwSert.first;
               while not TwSert.eof do begin
                     IBSAVE_CLEAR;
                     IBSAVE_ADD('US_ID',USERID);
                     IBSAVE_ADD('TW_ID',Edit_TW.tag);
                     IBSAVE_ADD('SERT_NUM',TwSert.fieldByname('SERT_NUM').asstring);
                     IBSAVE_ADD('SERT_WHO',TwSert.fieldByname('SERT_WHO').asstring);
                     IBSAVE_ADD('SERT_DATE',strtodate(datetostr(TwSert.fieldByname('SERT_DATE').asdatetime)));
                     ID2:=Ibsave_Doc('SERT',TwSert.fieldByname('SERT_ID').asinteger);
                     if ID2<0 then r:=Sqrt(-1) else begin
                        TwSert.edit;
                        TwSert.fieldByname('SERT_ID').asinteger:=ID2;
                        TwSert.Post;
                     end;
                     TwSert.next;
               end;
               Wait_Form.Gauge1.Progress:=60;
               Delay(1);
               CNTSERT_DEL:=0;
               Wait_Form.Gauge1.Progress:=70;
               Delay(1);
               // СОхраняем свойства
               CAN_SELECT_PROP:=False;
               PropTW.Disablecontrols;
               PropTW.first;
               while not PropTW.eof do begin
                  if PropTW.fieldByname('PROPTW_ID').asinteger<>-2 then begin
                     IBSAVE_CLEAR;
                     IBSAVE_ADD('TW_ID',Edit_TW.tag);
                     IBSAVE_ADD('PROPTWTYP_ID',PropTW.fieldByname('PROPTWTYP_ID').asinteger);
                     case PropTw.fieldByname('PROPTWTYP_TYP').asinteger of
                        1,2: //Список, Целое
                           IBSAVE_ADD('VALUEINT',PropTw.fieldByname('PROPTW_VALUEINT').asinteger);
                        3: //Дробное
                           IBSAVE_ADD('VALUEDBL',PropTw.fieldByname('PROPTW_VALUEDBL').asfloat);
                        4: //Дата
                           IBSAVE_ADD('VALUEDT',PropTw.fieldByname('PROPTW_VALUEDT').asdatetime);
                        5: //Строка
                           IBSAVE_ADD('VALUESTR',PropTw.fieldByname('PROPTW_VALUE').asdatetime);
                     end;
                     IBSAVE_ADD('FRM_ID',GL_FRM_WORK_MODE);
                     IBSAVE_ADD('US_ID',USERID);
                     ID2:=Ibsave_Doc('PROPTW',PropTW.fieldByname('PROPTW_ID').asinteger);
                     if ID2<0 then r:=Sqrt(-1) else begin
                        PropTW.edit;
                        PropTW.fieldByname('PROPTW_ID').asinteger:=ID2;
                        PropTW.Post;
                     end;
                  end;
                  PropTW.next;
               end;
               Wait_Form.Gauge1.Progress:=80;
               Delay(1);
               PropTW.First;
               CAN_SELECT_PROP:=True;
               // Сохраняем единицы измерени
               // Удаляем удаленное
               for a:=1 to CNTEDK_DEL do begin
                 if not IBDELETE_DOC('EDK',EDK_DEL[a]) then r:=sqrt(-1);
               end;
               Wait_Form.Gauge1.Progress:=90;
               Delay(1);
               // Сохраняем имеющеес
               MemEdk.DisableControls;
               MemEdk.First;
               while not MemEdk.eof do begin
                  IBSAVE_CLEAR;
                  IBSAVE_ADD('ED_ID',MemEdk.fieldByname('ED_ID').asinteger);
                  IBSAVE_ADD('EDK_KOL',MemEdk.fieldByname('TW_KOL').asfloat);
                  IBSAVE_ADD('EDK_RAZM',MemEdk.fieldByname('ED_RAZM').asstring);
                  IBSAVE_ADD('EDK_UP',MemEdk.fieldByname('ED_UP').asstring);
                  IBSAVE_ADD('TW_ID',EDIT_TW.tag);
                  IBSAVE_ADD('TW_MONEY',MemEdk.fieldByname('TW_MON').asfloat);
                  ID:=IBSAVE_DOC('EDK',MemEdk.fieldByname('EDK_ID').asinteger);
                  if ID>0 then begin
                      MemEdk.edit;
                      MemEdk.FieldByname('EDK_ID').asinteger:=ID;
                      MemEdk.post;
                  end else r:=sqrt(-1);
                  MemEdk.next;
               end;

               price.DisableControls;
               price.First;
               while not price.Eof do
               begin
                if ((price.FieldByName('TWPRICE_TYP').asinteger<9) and (price.FieldByName('TWPRICE_TYP').asinteger<>5)) then
                if price.FieldByName('TWPRICE_TYP').asinteger>0 then
                if ((price.FieldByName('TWPRICE_MONEY').asfloat<>price.FieldByName('TWPRICE_ORIGIN_MONEY').asfloat) or
                ((price.FieldByName('TWPRICE_DATE').asdatetime<>price.FieldByName('TWPRICE_ORIGIN_DATE').asdatetime) and (price.FieldByName('TWPRICE_TYP').asinteger=4))   ) then
                  begin
                    IBSAVE_CLEAR;
                    IBSAVE_ADD('TWPRICE_MONEY' , price.FieldByName('TWPRICE_MONEY').asfloat);
                    IBSAVE_ADD('TWPRICE_OLDMONEY' , price.FieldByName('TWPRICE_OLDMONEY').asfloat);
                    IBSAVE_ADD('TWPRICE_DATE' , price.FieldByName('TWPRICE_DATE').asdatetime);
                    IBSAVE_ADD('TWPRICE_TYP' , price.FieldByName('TWPRICE_TYP').asinteger);
                    IBSAVE_ADD('FRM_ID' , GL_FRM_WORK_MODE);

                    IBSAVE_ADD('TW_ID', Edit_TW.tag);
                    id:= IBSAVE_DOC('TWPRICE', price.FieldByName('TWPRICE_ID').asinteger);

                    price.Edit;
                    price.FieldByName('TWPRICE_ID').asinteger:=ID;
                    price.post;

                  end;


                price.Next;
               end;
               price.EnableControls;

{               IBSAVE_CLEAR;
               if TW_NOSKID.Checked then
                IBSAVE_ADD('VALUEINT' , 1)
               else
                IBSAVE_ADD('VALUEINT' , 0);
               IBSAVE_ADD('PROPTWTYP_ID' , 6);
               IBSAVE_ADD('TW_ID' , Edit_TW.tag);
               IBSAVE_ADD('FRM_ID' , GL_FRM_WORK_MODE);
               IBSAVE_ADD('US_ID' , USERID);
               TW_NOSKID.tag:=IBSAVE_DOC('PROPTW', TW_NOSKID.tag);

               IBSAVE_CLEAR;
               if TW_PRICE_PRINT.Checked then
                IBSAVE_ADD('VALUEINT' , 1)
               else
                IBSAVE_ADD('VALUEINT' , 0);
               IBSAVE_ADD('PROPTWTYP_ID' , 3);
               IBSAVE_ADD('TW_ID' , Edit_TW.tag);
               IBSAVE_ADD('FRM_ID' , GL_FRM_WORK_MODE);
               IBSAVE_ADD('US_ID' , USERID);
               TW_PRICE_PRINT.tag:=IBSAVE_DOC('PROPTW', TW_PRICE_PRINT.tag);
}


               Wait_Form.Gauge1.Progress:=100;
               Delay(100);
               Datamodule1.IBTransaction2.Commit;
               CNTPROPTWKTGLINK_DEL:=0;
               CNTEDK_DEL:=0;
               Datamodule1.IBTransaction2.Active:=False;
               Save:=True;
            end;
         end;
       except
          Messbox('Ошибка при сохранении карточки на товар!',MessError,48);
          Datamodule1.IBTransaction2.RollBack;
       end;
       Datamodule1.IBTransaction2.Active:=False;
     end;
    end;
  end;
 end;
 Wait_Form.Hide;
 PropTW.EnableControls;
 TwSert.Enablecontrols;
 CAN_SELECT_PROP:=True;
 if Edit_TW.tag>0 then begin
     PropTwktgTransaction.Active:=False;
     QueryPropTwktg.close;
     QueryPropTwktg.ParamByname('TW_ID').asinteger:=Edit_tw.tag;
     QueryPropTwktg.Open;
     ShopTransaction.Active:=False;
     QueryShop.close;
     QueryShop.ParamByname('TW_ID').asinteger:=EDIT_TW.tag;
     QueryShop.Open;
     BarCodeTransaction.Active:=False;
     Q_BAR_CODE.close;
     Q_BAR_CODE.ParamByname('TW_ID').asinteger:=EDIT_TW.tag;
     Q_BAR_CODE.Open;
     Tabsheet2.TabVisible:=True;
     Tabsheet3.TabVisible:=True;
     Tabsheet4.TabVisible:=True;
     Tabsheet5.TabVisible:=True;
     Tabsheet6.TabVisible:=True;
     Tabsheet7.TabVisible:=True;
     Tabsheet8.TabVisible:=True;
  end else begin
     Tabsheet2.TabVisible:=False;
     Tabsheet3.TabVisible:=False;
     Tabsheet4.TabVisible:=False;
     Tabsheet5.TabVisible:=False;
     Tabsheet6.TabVisible:=False;
     Tabsheet7.TabVisible:=False;
     Tabsheet8.TabVisible:=False;
  end;
end;

procedure TEdit_TW.TW_MROZ_BRAKChange(Sender: TObject);
begin
     TW_MROZ2_BRAK.value:=TW_MROZ_BRAK.value/IbQrValuta.fieldByname('KURS_KURS').asfloat;
     SAVE:=False;

end;

procedure TEdit_TW.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#10 then begin
        key:=#0;
        TW_NAME.setfocus;
        TW_RAZM.setfocus;
        BtnSave.click;
     end;
     if key=#27 then begin
        key:=#0;
        BtnClose.click;
     end;
end;

procedure TEdit_TW.ED_IDChange(Sender: TObject);
begin
     MemEDKTW_KOL.DisplayFormat:='#0.0000 '+trim(IbQrEd.fieldbyname('ED_SHORT').asstring);
     Label31.caption:=trim(IbQrEd.fieldbyname('ED_SHORT').asstring);
     Label32.caption:=trim(IbQrEd.fieldbyname('ED_SHORT').asstring);
     Label33.caption:=trim(IbQrEd.fieldbyname('ED_SHORT').asstring);
end;

procedure TEdit_TW.TwMonTW_MONEYChange(Sender: TField);
begin
     SAVE:=False;
end;

procedure TEdit_TW.TwMonTW_KOLChange(Sender: TField);
begin
     SAVE:=False;
end;

procedure TEdit_TW.TW_LANDChange(Sender: TObject);
begin
     SAVE:=False;
end;

procedure TEdit_TW.TW_TAMChange(Sender: TObject);
begin
     SAVE:=False;
end;

procedure TEdit_TW.DsSertDataChange(Sender: TObject; Field: TField);
begin
     if (TWSert.State in [dsInsert]) and ( not CanInsertSert) then TWSERT.Cancel;

end;

procedure TEdit_TW.TW_SERT_INSClick(Sender: TObject);
begin
     SAVE:=False;
     CanInsertSert:=True;
     TwSert.First;
     TwSert.insert;
     TwSert.FieldByname('SERT_ID').asinteger:=-1;
     TwSert.FieldByname('SERT_DATE').asdatetime:=date();
     TwSert.FieldByname('SERT_NUM').asstring:='';
     TwSert.FieldByname('SERT_WHO').asstring:='';
     TwSert.Post;
     CanInsertSert:=False;
     RxDbgrid3.setfocus;
     if TWSert.recordcount=0 then TW_SERT_DEL.enabled:=False else TW_SERT_DEL.enabled:=True;
end;

procedure TEdit_TW.TW_SERT_DELClick(Sender: TObject);
begin
     if Messbox('Удалить Сертификат ?',MessSubmit,4+48+256)=6 then begin
        SAVE:=False;
        inc(CNTSERT_DEL);
        TWSERT_DEL[CNTSERT_DEL]:=TWSERT.Fieldbyname('SERT_ID').asinteger;
        TWSERT.delete;
     end;
     if TWSert.recordcount=0 then TW_SERT_DEL.enabled:=False else TW_SERT_DEL.enabled:=True;
end;

procedure TEdit_TW.TWKTGChange(Sender: TObject);
begin
     SAVE:=False;
     if strtoint(TWKTG.value) in [1,5] then VALUTA_ID.value:='1'
                                        else VALUTA_ID.value:='0';
end;

procedure TEdit_TW.PropTwAfterScroll(DataSet: TDataSet);
var
  a:integer;
begin
   if CAN_SELECT_PROP then begin
      PROP_STRING.visible:=False;
      PROP_COMBO.visible:=False;
      PROP_DATE.visible:=False;
      PROP_DOUBLE.visible:=False;
      PROP_INTEGER.visible:=False;
      case PropTw.fieldByname('PROPTWTYP_TYP').asinteger of
        1: //Список
           begin
                CanChange:=False;
                // Наполняем таблицу значений
                Worktransaction.Active:=False;
                MemProperty.EmptyTable;
                PROP_COMBO.LookupField:='';
                ADD_SQL(QueryWork,'SELECT VALUEINT,VALUESTR from PROPTW where TW_ID=0 and PROPTWTYP_ID=:PROPTWTYP_ID order by VALUEINT');
                QueryWork.PAramByname('PROPTWTYP_ID').asinteger:=PropTw.fieldByname('PROPTWTYP_ID').asinteger;
                QueryWork.Open;
                while not QueryWork.eof do begin
                  MemProperty.Insert;
                  MemProperty.fieldByname('ID').asinteger:=QueryWork.fieldByname('VALUEINT').Asinteger;
                  MemProperty.fieldByname('VALUE').asstring:=QueryWork.fieldByname('VALUESTR').asstring;
                  MemProperty.Post;
                  QueryWork.next;
                end;
                a:=PropTw.fieldByname('PROPTW_VALUEINT').asinteger;
                PROP_COMBO.LookupField:='ID';
                PROP_COMBO.value:=inttostr(a);
                PROP_COMBO.visible:=True;
                CanChange:=True;
           end;
        2: // Целое
           begin
              PROP_INTEGER.visible:=true;
              PROP_INTEGER.value:=PropTw.fieldByname('PROPTW_VALUEINT').asinteger;
           end;
        3: //Дробное
           begin
              PROP_DOUBLE.visible:=True;
              PROP_DOUBLE.value:=PropTw.fieldByname('PROPTW_VALUEDBL').asfloat;
           end;
        4: //Дата
           begin
                PROP_DATE.visible:=True;
                PROP_DATE.date:=PropTw.fieldByname('PROPTW_VALUEDT').asdatetime;
           end;
        5: //Строка
           begin
                PROP_STRING.visible:=True;
                PROP_STRING.text:=PropTw.fieldByname('PROPTW_VALUE').asstring;
           end;
      end;
   end;
end;

procedure TEdit_TW.Apply2;
var
  s:ansistring;
begin
  if CAN_SELECT_PROP then begin
      PropTw.edit;
      if PropTw.fieldByname('PROPTW_ID').asinteger=-2 then
          PropTw.fieldByname('PROPTW_ID').asinteger:=-1;
      case PropTw.fieldByname('PROPTWTYP_TYP').asinteger of
        1: //Список
           if CanChange then begin
                PropTw.fieldByname('PROPTW_VALUEINT').asstring:=PROP_COMBO.value;
                PropTw.fieldByname('PROPTW_VALUE').asstring:=PROP_COMBO.text;
           end;
        2: // Целое
           begin
                PropTw.fieldByname('PROPTW_VALUEINT').asinteger:=trunc(PROP_INTEGER.value);
                PropTw.fieldByname('PROPTW_VALUE').asstring:=inttostr(trunc(PROP_INTEGER.value));
           end;
        3: //Дробное
           begin
                PropTw.fieldByname('PROPTW_VALUE').asstring:=floattostrf(PROP_DOUBLE.value,fffixed,19,4);
                PropTw.fieldByname('PROPTW_VALUEDBL').asfloat:=PROP_DOUBLE.value;
           end;
        4: //Дата
           begin
                PropTw.fieldByname('PROPTW_VALUE').asstring:=date_sokr(PROP_DATE.date);
                PROP_DATE.date:=PropTw.fieldByname('PROPTW_VALUEDT').asdatetime;
           end;
        5: //Строка
           begin
                PropTw.fieldByname('PROPTW_VALUE').asstring:=PROP_STRING.text;
           end;
      end;
      PropTw.Post;
  end;
end;

procedure TEdit_TW.RxDBGrid6DblClick(Sender: TObject);
begin
    if PROPTWKTG_DEL.enabled then PROPTWKTG_DEL.click;
end;

procedure TEdit_TW.PROPTWKTG_DELClick(Sender: TObject);
begin
  if Messbox('Товар больше не должен входить в категорию "'+
    QueryPropTWKTG.fieldByname('PROPTWKTG_NAME').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then
    if QueryPropTWKTG.fieldByname('PROPTWKTGLINK_ID').asinteger>0 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           if IbDelete_doc('PROPTWKTGLINK',QueryPropTWKTG.fieldByname('PROPTWKTGLINK_ID').asinteger) then begin
              Datamodule1.IBTransaction2.Commit;
              Datamodule1.IBTransaction2.Active:=False;
              PropTwktgTransaction.Active:=False;
              QueryPropTwktg.close;
              QueryPropTwktg.ParamByname('TW_ID').asinteger:=Edit_tw.tag;
              QueryPropTwktg.Open;
           end else Datamodule1.IBTransaction2.Rollback;
           Datamodule1.IBTransaction2.Active:=False;

    end;
end;

procedure TEdit_TW.QueryShopAfterOpen(DataSet: TDataSet);
var
  EN:boolean;
begin
  EN:=not QueryShop.eof;
  TIMER1.enabled:=EN;
  BtnShopOpen.enabled:=EN;
  BtnShopDel.enabled:=EN;
end;

procedure TEdit_TW.BtnShopDelClick(Sender: TObject);
begin
   if Messbox('Удалить дополнительную цену в магазине "'+QueryShop.fieldByname('SHOP_NAME').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
      Datamodule1.IBTransaction2.Active:=False;
      Datamodule1.IBTransaction2.StartTransaction;
      IBDELETE_DOC('TWMONSHOP',QueryShop.fieldByname('TWMONSHOP_ID').asinteger);
      Datamodule1.IBTransaction2.Commit;
      Datamodule1.IBTransaction2.Active:=False;
      ShopTransaction.Active:=False;
      QueryShop.close;
      QueryShop.Open;
      SAVE:=False;
   end;
end;

procedure TEdit_TW.BtnShopNewClick(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   Application.CreateForm(TEDIT_TWSHOPMON,EDIT_TWSHOPMON);
   // Формируем список магазинов
   EDIT_TWSHOPMON.MemShop.EmptyTable;
   WorkTransaction.Active:=False;
   OPEN_SQL(QueryWork,'select shop_id,shop_name from shop order by shop_name');
   while not QueryWork.eof do begin
     QueryShop.First;
     if not QueryShop.locate('SHOP_ID',QueryWork.fieldByname('SHOP_ID').asinteger,[]) then begin
         EDIT_TWSHOPMON.MemShop.append;
         EDIT_TWSHOPMON.MemShop.fieldByname('SHOP_ID').asinteger:=QueryWork.fieldByname('SHOP_ID').asinteger;
         EDIT_TWSHOPMON.MemShop.fieldByname('SHOP_NAME').asstring:=QueryWork.fieldByname('SHOP_NAME').asstring;
         EDIT_TWSHOPMON.MemShop.Post;
     end;
     QueryWork.next;
   end;
   QueryWork.Close;
   WorkTransaction.Active:=False;
   if EDIT_TWSHOPMON.MemShop.recordcount=0 then begin
      Messbox('Цены для всех магазинов уже определены!',MessSystem,48);
   end else begin
     EDIT_TWSHOPMON.MemShop.first;
     EDIT_TWSHOPMON.SHOP_NAME.visible:=False;
     EDIT_TWSHOPMON.SHOP_COMBO.visible:=true;
     EDIT_TWSHOPMON.TW_MONEY.value:=TW_MROZ.value;
     EDIT_TWSHOPMON.SHOP_COMBO.value:=EDIT_TWSHOPMON.MemShop.fieldByname('SHOP_ID').asstring;
     EDIT_TWSHOPMON.ShowModal;
     if EDIT_TWSHOPMON.BtnClose.tag=2 then begin
       // Записать
       try
         Datamodule1.IBTransaction2.Active:=False;
         Datamodule1.IBTransaction2.StartTransaction;
         IBSAVE_CLEAR;
         IBSAVE_ADD('TW_ID',EDIT_TW.tag);
         IBSAVE_ADD('SHOP_ID',strtoint(EDIT_TWSHOPMON.SHOP_COMBO.value));
         if TW_MROZ.value=0 then IBSAVE_ADD('SKID_PERCENT',0)
         else IBSAVE_ADD('SKID_PERCENT', (TW_MROZ.value-EDIT_TWSHOPMON.TW_MONEY.value)/(TW_MROZ.value/100));
         ID:=IBSAVE_DOC('TWMONSHOP',-1);
         if ID<0 then r:=sqrt(-1);
         Datamodule1.IBTransaction2.Commit;
         Datamodule1.IBTransaction2.Active:=False;
         ShopTransaction.Active:=False;
         QueryShop.close;
         QueryShop.Open;
         QueryShop.locate('TWMONSHOP_ID',ID,[]);
         SAVE:=False;
       except
         Datamodule1.IBTransaction2.Rollback;
       end;
       Datamodule1.IBTransaction2.Active:=False;
     end;
   end;
   EDIT_TWSHOPMON.destroy;
end;

procedure TEdit_TW.BtnShopOpenClick(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   Application.CreateForm(TEDIT_TWSHOPMON,EDIT_TWSHOPMON);
     EDIT_TWSHOPMON.SHOP_NAME.visible:=True;
     EDIT_TWSHOPMON.SHOP_NAME.text:=QueryShop.fieldByname('SHOP_NAME').asstring;
     EDIT_TWSHOPMON.SHOP_COMBO.visible:=False;
     EDIT_TWSHOPMON.TW_MONEY.value:=QueryShop.fieldByname('TW_MONEY').asfloat;
     EDIT_TWSHOPMON.ShowModal;
     if EDIT_TWSHOPMON.BtnClose.tag=2 then begin
       // Записать
       try
         Datamodule1.IBTransaction2.Active:=False;
         Datamodule1.IBTransaction2.StartTransaction;
         IBSAVE_CLEAR;
         IBSAVE_ADD('TW_ID',EDIT_TW.tag);
         if TW_MROZ.value=0 then IBSAVE_ADD('SKID_PERCENT',0)
         else IBSAVE_ADD('SKID_PERCENT', (TW_MROZ.value-EDIT_TWSHOPMON.TW_MONEY.value)/(TW_MROZ.value/100));
         ID:=IBSAVE_DOC('TWMONSHOP',QueryShop.fieldByname('TWMONSHOP_ID').asinteger);
         if ID<0 then r:=sqrt(-1);
         Datamodule1.IBTransaction2.Commit;
         Datamodule1.IBTransaction2.Active:=False;
         ShopTransaction.Active:=False;
         SAVE:=False;
         QueryShop.close;
         QueryShop.Open;
         QueryShop.locate('TWMONSHOP_ID',ID,[]);
       except
         Datamodule1.IBTransaction2.Rollback;
       end;
       Datamodule1.IBTransaction2.Active:=False;
     end;
   EDIT_TWSHOPMON.destroy;
end;

procedure TEdit_TW.RxDBGrid7DblClick(Sender: TObject);
begin
   if BtnShopOpen.enabled then BtnShopOpen.click;
end;

procedure TEdit_TW.PROP_INTEGERChange(Sender: TObject);
begin
  Apply2;
end;

procedure TEdit_TW.PROP_STRINGChange(Sender: TObject);
begin
  Apply2;
end;

procedure TEdit_TW.PROP_DOUBLEChange(Sender: TObject);
begin
  Apply2;
end;

procedure TEdit_TW.PROP_DATEChange(Sender: TObject);
begin
  Apply2;
end;

procedure TEdit_TW.PROP_COMBOChange(Sender: TObject);
begin
  Apply2;
end;

procedure TEdit_TW.MemEdkAfterPost(DataSet: TDataSet);
var
  EN:boolean;
begin
   BtnNewEdk.enabled:=True;
   if MemEdk.recordcount>0 then EN:=true;
   BtnOpenEdk.enabled:=EN;
   BtnDelEdk.enabled:=EN;

end;

procedure TEdit_TW.BtnNewEdkClick(Sender: TObject);
begin
    Application.createForm(TEDIT_EDK,EDIT_EDK);
    EDIT_EDK.tag:=-1;
    EDIT_EDK.ED_ID.tag:=-1;
    EDIT_EDK.Edit1.text:=ED_ID.text;
    EDIT_EDK.SHowModal;
    if EDIT_EDK.tag=2 then begin
      // Вставка новой
      MemEdk.Append;
      MemEdk.fieldByname('EDK_ID').asinteger:=-1;
      MemEdk.fieldByname('ED_ID').asinteger:=strtoint(EDIT_EDK.ED_ID.Value);
      MemEdk.fieldByname('ED_SHORT').asstring:=EDIT_EDK.ED_ID.text;
      MemEdk.fieldByname('ED_UP').asstring:=EDIT_EDK.EDK_UP.text;
      MemEdk.fieldByname('ED_RAZM').asstring:=EDIT_EDK.EDK_RAZM.text;
      MemEdk.fieldByname('TW_KOL').Asfloat:=EDIT_EDK.EDK_KOL.Value;
      MemEdk.fieldByname('TW_MON').Asfloat:=EDIT_EDK.TW_MONEY.Value/IbQrValuta.fieldByname('KURS_KURS').asfloat;
      MemEdk.Post;
    end;
end;

procedure TEdit_TW.MemEdkCalcFields(DataSet: TDataSet);
begin
   MemEdk.fieldByname('TW_MON2').asfloat:=MemEdk.fieldByname('TW_MON').asfloat*IbQrValuta.fieldByname('KURS_KURS').asfloat;
end;

procedure TEdit_TW.BtnOpenEdkClick(Sender: TObject);
begin
    Application.createForm(TEDIT_EDK,EDIT_EDK);
    EDIT_EDK.tag:=MemEdk.fieldByname('EDK_ID').asinteger;
    EDIT_EDK.ED_ID.tag:=MemEdk.fieldByname('ED_ID').asinteger;
    EDIT_EDK.EDK_UP.text:=MemEdk.fieldByname('ED_UP').asstring;
    EDIT_EDK.EDK_RAZM.text:=MemEdk.fieldByname('ED_RAZM').asstring;
    EDIT_EDK.EDK_KOL.Value:=MemEdk.fieldByname('TW_KOL').Asfloat;
    EDIT_EDK.TW_MONEY.Value:=MemEdk.fieldByname('TW_MON2').Asfloat;
    EDIT_EDK.Edit1.text:=ED_ID.text;
    EDIT_EDK.SHowModal;
    if EDIT_EDK.tag=2 then begin
      // Вставка новой
      MemEdk.Edit;
      MemEdk.fieldByname('ED_ID').asinteger:=strtoint(EDIT_EDK.ED_ID.Value);
      MemEdk.fieldByname('ED_SHORT').asstring:=EDIT_EDK.ED_ID.text;
      MemEdk.fieldByname('ED_UP').asstring:=EDIT_EDK.EDK_UP.text;
      MemEdk.fieldByname('ED_RAZM').asstring:=EDIT_EDK.EDK_RAZM.text;
      MemEdk.fieldByname('TW_KOL').Asfloat:=EDIT_EDK.EDK_KOL.Value;
      MemEdk.fieldByname('TW_MON').Asfloat:=EDIT_EDK.TW_MONEY.Value/IbQrValuta.fieldByname('KURS_KURS').asfloat;
      MemEdk.Post;
    end;

end;

procedure TEdit_TW.RxDBGrid2DblClick(Sender: TObject);
begin
   If BtnOpenEdk.enabled then BtnOpenEdk.click;
end;

procedure TEdit_TW.RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
   if ((key=#13) and (BtnOpenEdk.enabled)) then BtnOpenEdk.click;
end;

procedure TEdit_TW.BtnDelEdkClick(Sender: TObject);
begin
    if Messbox('Удалить другие единицы измерения "'+MemEdk.fieldByname('ED_SHORT').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
       if MemEdk.fieldByname('EDK_ID').asinteger>0 then begin
          inc(CNTEDK_DEL);
          EDK_DEL[CNTEDK_DEL]:=MemEdk.fieldByname('EDK_ID').asinteger;
       end;
       MemEdk.delete;
    end;
end;

procedure TEdit_TW.BarCode_DELClick(Sender: TObject);
begin
   if Messbox('Удалить штрих-код?',MessSubmitDelete,4+48+256)=6 then begin
      Datamodule1.IBTransaction2.Active:=False;
      Datamodule1.IBTransaction2.StartTransaction;
      if IBDELETE_DOC('BAR_CODE',Q_BAR_CODE.fieldByname('BAR_CODE_ID').asinteger) then begin
         Datamodule1.IBTransaction2.Commit;
         Datamodule1.IBTransaction2.Active:=False;
         BarCodeTransaction.Active:=False;
         Q_BAR_CODE.close;
         Q_BAR_CODE.Open;
      end else Datamodule1.IBTransaction2.Rollback;
      Datamodule1.IBTransaction2.Active:=False;

   end;

end;

procedure TEdit_TW.BarCode_NewClick(Sender: TObject);
var
  ID:integer;
  r:double;
begin
{   Application.CreateForm(TEDIT_TWSKLADMON,EDIT_TWSKLADMON);
   EDIT_TWSKLADMON.tag:=-1;
   EDIT_TWSKLADMON.ShowModal;
   if EDIT_TWSKLADMON.tag=2 then begin
       if EDIT_TWSKLADMON.SHOP_ALL.Checked then begin
         // Всеми магазинами
         WorkTransaction.Active:=False;
         ADD_SQL(QueryWork,'select SHOP_ID from LIST_ALL_SHOPTWMONSKLAD( :TW_ID, :SKL_ID)');
         QueryWork.ParamByname('TW_ID').asinteger:=EDIT_TW.tag;
         QueryWork.ParamByname('SKL_ID').asinteger:=strtoint(EDIT_TWSKLADMON.SKL_ID.value);
         QueryWork.open;
         try
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           while not QueryWork.eof do begin
             IBSAVE_CLEAR;
             IBSAVE_ADD('TW_ID',EDIT_TW.tag);
             IBSAVE_ADD('SHOP_ID',QueryWork.fieldByname('SHOP_ID').asinteger);
             IBSAVE_ADD('SKL_ID',strtoint(EDIT_TWSKLADMON.SKL_ID.value));
             if TW_MROZ.value=0 then IBSAVE_ADD('SKID_PERCENT',0)
             else IBSAVE_ADD('SKID_PERCENT', (TW_MROZ.value-EDIT_TWSKLADMON.TW_MONEY.value)/(TW_MROZ.value/100));
             ID:=IBSAVE_DOC('TWMONSKLAD',-1);
             if ID<0 then r:=sqrt(-1);
             QueryWork.next;
           end;
           Datamodule1.IBTransaction2.Commit;
           Datamodule1.IBTransaction2.Active:=False;
           SklTransaction.Active:=False;
           QuerySklad.close;
           QuerySklad.Open;
           SAVE:=False;
         except
           Datamodule1.IBTransaction2.Rollback;
         end;
         Datamodule1.IBTransaction2.Active:=False;
       end else begin
         // Записать одним магазином
         try
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           IBSAVE_CLEAR;
           IBSAVE_ADD('TW_ID',EDIT_TW.tag);
           IBSAVE_ADD('SHOP_ID',strtoint(EDIT_TWSKLADMON.SHOP_ID.value));
           IBSAVE_ADD('SKL_ID',strtoint(EDIT_TWSKLADMON.SKL_ID.value));
           if TW_MROZ.value=0 then IBSAVE_ADD('SKID_PERCENT',0)
           else IBSAVE_ADD('SKID_PERCENT', (TW_MROZ.value-EDIT_TWSKLADMON.TW_MONEY.value)/(TW_MROZ.value/100));
           ID:=IBSAVE_DOC('TWMONSKLAD',-1);
           if ID<0 then r:=sqrt(-1);
           Datamodule1.IBTransaction2.Commit;
           Datamodule1.IBTransaction2.Active:=False;
           SklTransaction.Active:=False;
           QuerySklad.close;
           QuerySklad.Open;
           QuerySklad.locate('TWMONSKLAD_ID',ID,[]);
           SAVE:=False;
         except
           Datamodule1.IBTransaction2.Rollback;
         end;
         Datamodule1.IBTransaction2.Active:=False;
       end;
   end;
   EDIT_TWSKLADMON.destroy;
}
end;

procedure TEdit_TW.BarCode_OpenClick(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   {Application.CreateForm(TEDIT_TWSKLADMON,EDIT_TWSKLADMON);
   EDIT_TWSKLADMON.tag:=QuerySklad.fieldByname('TWMONSKLAD_ID').asinteger;
   EDIT_TWSKLADMON.TW_MONEY.value:=QuerySklad.fieldByname('TW_MONEY').asfloat;
   EDIT_TWSKLADMON.ShowModal;
   if EDIT_TWSKLADMON.tag=2 then begin
       // Записать
       try
         Datamodule1.IBTransaction2.Active:=False;
         Datamodule1.IBTransaction2.StartTransaction;
         IBSAVE_CLEAR;
         IBSAVE_ADD('TW_ID',EDIT_TW.tag);
         IBSAVE_ADD('SHOP_ID',strtoint(EDIT_TWSKLADMON.SHOP_ID.value));
         IBSAVE_ADD('SKL_ID',strtoint(EDIT_TWSKLADMON.SKL_ID.value));
         if TW_MROZ.value=0 then IBSAVE_ADD('SKID_PERCENT',0)
         else IBSAVE_ADD('SKID_PERCENT', (TW_MROZ.value-EDIT_TWSKLADMON.TW_MONEY.value)/(TW_MROZ.value/100));
         ID:=IBSAVE_DOC('TWMONSKLAD',QuerySklad.fieldByname('TWMONSKLAD_ID').asinteger);
         if ID<0 then r:=sqrt(-1);
         Datamodule1.IBTransaction2.Commit;
         Datamodule1.IBTransaction2.Active:=False;
         SklTransaction.Active:=False;
         QuerySklad.close;
         QuerySklad.Open;
         QuerySklad.locate('TWMONSKLAD_ID',ID,[]);
         SAVE:=False;
       except
         Datamodule1.IBTransaction2.Rollback;
       end;
       Datamodule1.IBTransaction2.Active:=False;
   end;
   EDIT_TWSKLADMON.destroy;
}
end;

procedure TEdit_TW.RxDBGrid8DblClick(Sender: TObject);
begin
//    if MonSklad_Open.enabled then MonSklad_Open.click;
end;

procedure TEdit_TW.OPTV1Change(Sender: TObject);
begin
   SAVE:=False;
   if not ((Sender=OPT1) or (Sender=OPTSKID1)) then begin
      if not OPTV1.Focused then OPT1.value:=OPTV1.value*IbQrValuta.fieldByname('KURS_KURS').asfloat;
      if not OPTSKID1.Focused then begin
         if TW_MROZ2.value=0 then OPTSKID1.value:=100
                          else OPTSKID1.value:=(TW_MROZ2.value-OPTV1.value)/(TW_MROZ2.value/100);
      end;
   end;
end;

procedure TEdit_TW.OPT1Change(Sender: TObject);
begin
   SAVE:=False;
   if not ((Sender=OPTV1) or (Sender=OPTSKID1)) then begin
      if not OPTV1.Focused then begin
        if IbQrValuta.fieldByname('KURS_KURS').asfloat=0 then OPTV1.value:=0
           else OPTV1.value:=OPT1.value/IbQrValuta.fieldByname('KURS_KURS').asfloat;
      end;
      if not OPTSKID1.Focused then begin
        if TW_MROZ2.value=0 then OPTSKID1.value:=100
                          else OPTSKID1.value:=(TW_MROZ2.value-OPTV1.value)/(TW_MROZ2.value/100);
      end;
   end;
end;

procedure TEdit_TW.OPTSKID1Change(Sender: TObject);
begin
   SAVE:=False;
   if not ((Sender=OPT1) or (Sender=OPTV1)) then begin
      if not OPT1.Focused then OPT1.value:=TW_MROZ.value*(1-OPTSKID1.value/100);
      if not OPTV1.Focused then OPTV1.value:=TW_MROZ2.value*(1-OPTSKID1.value/100);
   end;
end;

procedure TEdit_TW.OPTV2Change(Sender: TObject);
begin
   SAVE:=False;
   if not ((Sender=OPT2) or (Sender=OPTSKID2)) then begin
      if not OPTV2.Focused then OPT2.value:=OPTV2.value*IbQrValuta.fieldByname('KURS_KURS').asfloat;
      if not OPTSKID2.Focused then begin
         if TW_MROZ2.value=0 then OPTSKID2.value:=100
                          else OPTSKID2.value:=(TW_MROZ2.value-OPTV2.value)/(TW_MROZ2.value/100);
      end;
   end;
end;

procedure TEdit_TW.OPTV3Change(Sender: TObject);
begin
   SAVE:=False;
   if not ((Sender=OPT3) or (Sender=OPTSKID3)) then begin
      if not OPTV3.Focused then OPT3.value:=OPTV3.value*IbQrValuta.fieldByname('KURS_KURS').asfloat;
      if not OPTSKID3.Focused then begin
         if TW_MROZ2.value=0 then OPTSKID3.value:=100
                          else OPTSKID3.value:=(TW_MROZ2.value-OPTV3.value)/(TW_MROZ2.value/100);
      end;
   end;
end;

procedure TEdit_TW.OPT2Change(Sender: TObject);
begin
   SAVE:=False;
   if not ((Sender=OPTV2) or (Sender=OPTSKID2)) then begin
      if not OPTV2.Focused then begin
        if IbQrValuta.fieldByname('KURS_KURS').asfloat=0 then OPTV2.value:=0
           else OPTV2.value:=OPT2.value/IbQrValuta.fieldByname('KURS_KURS').asfloat;
      end;
      if not OPTSKID2.Focused then begin
        if TW_MROZ2.value=0 then OPTSKID2.value:=100
                          else OPTSKID2.value:=(TW_MROZ2.value-OPTV2.value)/(TW_MROZ2.value/100);
      end;
   end;
end;

procedure TEdit_TW.OPT3Change(Sender: TObject);
begin
   SAVE:=False;
   if not ((Sender=OPTV3) or (Sender=OPTSKID3)) then begin
      if not OPTV3.Focused then begin
        if IbQrValuta.fieldByname('KURS_KURS').asfloat=0 then OPTV3.value:=0
           else OPTV3.value:=OPT3.value/IbQrValuta.fieldByname('KURS_KURS').asfloat;
      end;
      if not OPTSKID3.Focused then begin
        if TW_MROZ2.value=0 then OPTSKID3.value:=100
                          else OPTSKID3.value:=(TW_MROZ2.value-OPTV3.value)/(TW_MROZ2.value/100);
      end;
   end;
end;

procedure TEdit_TW.OPTSKID2Change(Sender: TObject);
begin
   SAVE:=False;
   if not ((Sender=OPT2) or (Sender=OPTV2)) then begin
      if not OPT2.Focused then OPT2.value:=TW_MROZ.value*(1-OPTSKID2.value/100);
      if not OPTV2.Focused then OPTV2.value:=TW_MROZ2.value*(1-OPTSKID2.value/100);
   end;
end;

procedure TEdit_TW.OPTSKID3Change(Sender: TObject);
begin
   SAVE:=False;
   if not ((Sender=OPT1) or (Sender=OPTV3)) then begin
      if not OPT3.Focused then OPT3.value:=TW_MROZ.value*(1-OPTSKID3.value/100);
      if not OPTV3.Focused then OPTV3.value:=TW_MROZ2.value*(1-OPTSKID3.value/100);
   end;
end;

procedure TEdit_TW.OPTKOL1Change(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TEdit_TW.Button1Click(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   GLOBAL_PROPTWKTG_SELECT:=2; // режим выбора
   Application.CreateForm(TDic_KTG,DIC_KTG);
   DIC_KTG.showModal;
   if DIC_KTG.tag>0 then begin
      Datamodule1.IBTransaction2.Active:=False;
      Datamodule1.IBTransaction2.StartTransaction;
      try
        IBSAVE_CLEAR;
        IBSAVE_ADD('TW_ID',Edit_tw.tag);
        IBSAVE_ADD('PROPTWKTG_ID',DIC_KTG.tag);
        ID:=IBSAVE_DOC('PROPTWKTGLINK',-1);
        if ID<0 then r:=sqrt(-1);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        PropTwktgTransaction.Active:=False;
        QueryPropTwktg.close;
        QueryPropTwktg.ParamByname('TW_ID').asinteger:=Edit_tw.tag;
        QueryPropTwktg.Open;
        QueryPropTwktg.Locate('PROPTWKTGLINK_ID',ID,[]);
      Except
         Datamodule1.IBTransaction2.Rollback;
         Messbox('Ошибка записи скидки!',MessError,48);
      End;
      Datamodule1.IBTransaction2.Active:=False;
   end;
   DIC_KTG.destroy;
end;

procedure TEdit_TW.QueryPROPTWKTGAfterOpen(DataSet: TDataSet);
begin
  PROPTWKTG_DEL.enabled:=not QueryPROPTWKTG.eof;
end;

procedure TEdit_TW.RxDBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   RxDbGrid6.Canvas.Brush.color:=clWindow;
   RxDbGrid6.Canvas.Font.color:=clWindowText;
   if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PROPTWKTGLINK_ID').Asstring<>'' then begin
     if (GdSelected in State ) and (RxDbgrid6.focused) then begin
           RxDbGrid6.Canvas.Brush.color:=clHighlight;
           RxDbGrid6.Canvas.Font.color:=clHighlighttext;
     end;
     if Column.Index>0 then
        RxDbGrid6.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
        RxDbGrid6.Canvas.FillRect(Rect);
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('VID').Asinteger=0 then
           DataModule1.ImageList1.Draw(RxDbGrid6.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           141,True)
          else DataModule1.ImageList1.Draw(RxDbGrid6.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           140,True);
     end;
   end else RxDbGrid6.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TEdit_TW.RxDBGrid6DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid6.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TEdit_TW.Timer1Timer(Sender: TObject);
var
  n:integer;
begin
    n:=pos('Ц',Tabsheet7.caption);
    if napr=1 then begin
       // Слева направо
       if n>1 then begin
         Tabsheet7.caption:=copy(Tabsheet7.caption,2,length(Tabsheet7.caption)-1)+' ';
       end else napr:=2;
    end else begin
      if n<19 then begin
      Tabsheet7.caption:=' '+copy(Tabsheet7.caption,1,length(Tabsheet7.caption)-1);
      end else napr:=1;
    end;
end;

procedure TEdit_TW.TW_SALERChange(Sender: TObject);
begin
  if TW_SALER.Value='-1' then
     WarnLabel.Visible:=true
  else
    WarnLabel.Visible:=false;
end;

procedure TEdit_TW.PRICECalcFields(DataSet: TDataSet);
var percent: double;
begin
     if price.fieldByname('tw_zak').asfloat=0 then Percent:=100
     else Percent:=(price.fieldByname('twprice_money').asfloat-price.fieldByname('tw_zak').asfloat)/(price.fieldByname('tw_zak').asfloat/100);
     price.fieldByname('nac_percent').asfloat:=Percent;
end;

procedure TEdit_TW.PropTwAfterPost(DataSet: TDataSet);
begin

if DataSet.ControlsDisabled then
  exit;


  if DataSet.FieldByName('PROPTWTYP_ID').asinteger=3 then
  if TW_PRICE_PRINT.Checked<>(DataSet.FieldByName('PROPTW_valueint').asinteger=1) then
    TW_PRICE_PRINT.Checked:=(DataSet.FieldByName('PROPTW_valueint').asinteger=1);

  if DataSet.FieldByName('PROPTWTYP_ID').asinteger=6 then
    if TW_NOSKID.Checked<>(DataSet.FieldByName('PROPTW_valueint').asinteger=1) then
      TW_NOSKID.Checked:=(DataSet.FieldByName('PROPTW_valueint').asinteger=1);
end;

procedure TEdit_TW.TW_NOSKIDClick(Sender: TObject);
begin
  proptw.DisableControls;
  if proptw.Locate('PROPTWTYP_ID', '6', []) then
  begin
    proptw.Edit;
    if TW_NOSKID.Checked then
      PROP_COMBO.Value:='1'
    else
      PROP_COMBO.Value:='0';
  end;
  proptw.EnableControls;

end;

procedure TEdit_TW.TW_PRICE_PRINTClick(Sender: TObject);
begin
  proptw.DisableControls;
  if proptw.Locate('PROPTWTYP_ID', '3', []) then
  begin

    if TW_PRICE_PRINT.Checked then
      PROP_COMBO.Value:='1'
    else
      PROP_COMBO.Value:='0';
  end;
  proptw.EnableControls;
end;

procedure TEdit_TW.Button2Click(Sender: TObject);
begin
 if (    tw_width.Value * tw_length.Value * tw_height.Value = 0)   then
        messbox('Ошибка', 'Указаны не все размеры', 0)

 else
   tw_palet_kol.Value := 1.0 / (tw_width.Value * tw_length.Value * tw_height.Value);
end;


procedure TEdit_TW.doCalcSkladPaletParams();
begin

//28-07-2014
//расчет объема единицы по приоритетам начиная от палеты
//проверить, то не введено значение вручную или ноль





if ((tw_kol_in_up.Value>0) and (up_kubatura.Value > 0))then
        ed_kubatura.Value:= up_kubatura.Value / tw_kol_in_up.Value
else

if ((TW_PALET_KOL.Value> 0) and (TW_PALET_KUBATORA.Value>0)) then
        ed_kubatura.Value:= TW_PALET_KUBATORA.Value / TW_PALET_KOL.Value
else
        ed_kubatura.Value:= tw_width.Value * tw_length.Value * tw_height.Value;







//

if (chk_stored_in_up.Checked) and (chk_typical_palet.Checked) then
//типовая палета в упаковках (плитка)
//можно посчитать кол-во товара на палете, указав колво товара в упаковке и посчитав/указав количество упаковок на палете
begin


end;

if (chk_typical_palet.Checked) then
//типовая палета - можно посчитать количество товара/упаковок на такой палете
//в том случае если указываются габаритные размеры товара/упаковок
begin
end;




end;


procedure TEdit_TW.chk_typical_paletClick(Sender: TObject);
begin
if (form_loading) then
        exit;

if (chk_typical_palet.Checked) then
begin
        self.palet_width.Value:=1.0;
        self.palet_length.Value:=1.0;
        self.palet_height.Value:=1.0;
        self.TW_PALET_KUBATORA.Value:=1.0;
        self.palet_width.Enabled:=false;
        self.palet_length.Enabled:=false;
        self.palet_height.Enabled:=false;
        TW_PALET_KUBATORA.Enabled:=false;
end
else
begin
        self.palet_width.Enabled:=true;
        self.palet_length.Enabled:=true;
        self.palet_height.Enabled:=true;
        TW_PALET_KUBATORA.Enabled:=true;
end;

        doCalcSkladPaletParams();


end;

procedure TEdit_TW.palet_lengthChange(Sender: TObject);
begin
//    if (TW_PALET_KUBATORA.tag = 'calc_from_palet_razm') then

if (form_loading) then
        exit;


      if (TW_PALET_KUBATORA.Value = 0) then
      if (palet_width.Value*palet_length.Value*palet_height.Value > 1) then
      begin
            //  self.chk_typical_palet.Checked:=false;
              TW_PALET_KUBATORA.Value :=palet_width.Value*palet_length.Value*palet_height.Value;
      end
      else
              TW_PALET_KUBATORA.Value := 1;





//    doCalcSkladPaletParams();
end;





procedure TEdit_TW.change_tw_up_text();
begin
 //       if (form_loading) then
                exit;

                
        tw_up.Text := '';
        if (tw_kol_in_up.Value>0) then
        begin
              tw_up.Text :=  format('%d '+ed_id.text+' в упаковке', [round(tw_kol_in_up.value+0.4999999)]);
        end;

        if (tw_palet_uchet.checked) then
        begin
          if (tw_palet_kol.Value>0) then
          begin
                tw_up.Text :=  tw_up.Text + format(', %d '+ed_id.text+' в палете', [round(tw_palet_kol.value+0.4999999)]);
          end;

          if (up_kol_in_pal.Value>0) then
          begin
                tw_up.Text :=  tw_up.Text +  format(', %d упаковок в палете', [round(up_kol_in_pal.value+0.4999999)]);
          end;
        end;
end;

procedure TEdit_TW.change_tw_razm_text();
begin
//        if (form_loading) then
                exit;


 tw_razm.Text := '';

    if (tw_length.value > 0) then
    begin
        if (tw_razm.text <> '') then
            tw_razm.Text := tw_razm.Text + 'х';

        tw_razm.Text := tw_razm.Text + format('%f', [tw_length.value]);
    end;
    if (tw_width.value > 0) then
    begin
        if (tw_razm.text <> '') then
            tw_razm.Text := tw_razm.Text + 'х';

        tw_razm.Text := tw_razm.Text + format('%f', [tw_width.value]);
    end;
    if (tw_height.value > 0) then
    begin
        if (tw_razm.text <> '') then
            tw_razm.Text := tw_razm.Text + 'х';

        tw_razm.Text := tw_razm.Text + format('%f', [tw_height.value]);
    end;


    if (tw_razm.text <> '') then
            tw_razm.Text := tw_razm.Text + ' м';
end;



procedure TEdit_TW.chk_stored_in_upClick(Sender: TObject);
begin



up_length.Enabled := chk_stored_in_up.Checked;
up_width.Enabled := chk_stored_in_up.Checked;
up_height.Enabled := chk_stored_in_up.Checked;
tw_kol_in_up.Enabled := chk_stored_in_up.Checked;
up_kol_in_pal.Enabled := chk_stored_in_up.Checked;


end;

procedure TEdit_TW.up_lengthChange(Sender: TObject);
begin
    //изменился размер упаковки:
    //1. менять кубатуру палеты      ??????????
    //2. менять количество упаковок в палете   ???????????????

if (form_loading) then
        exit;


    //28-07-2014
    if (up_kubatura.value=0) then
            up_kubatura.Value:=up_width.Value*up_length.Value*up_height.Value;
    doCalcSkladPaletParams();


{
    if (chk_stored_in_up.Checked) then
    begin
      palet_length.Value:=0;
      palet_width.value:=0;
      palet_height.Value:=0;

      up_kubatura.Value:=up_width.Value*up_length.Value*up_height.Value;

      if (chk_typical_palet.Checked) then      //типовая палета, из размера товара рассчитать его количество на палете
      begin
        if (up_width.Value*up_length.Value*up_height.Value > 0) then
        begin
          up_kol_in_pal.Value := TW_PALET_KUBATORA.Value / (up_width.Value*up_length.Value*up_height.Value);
        end

      end
      else
      begin
        TW_PALET_KUBATORA.Value :=up_width.Value*up_length.Value*up_height.Value * up_kol_in_pal.Value;

      end;

      TW_PALET_KOL.Value := up_kol_in_pal.Value * tw_kol_in_up.Value;

    end;
}

   change_tw_up_text();
//    doCalcSkladPaletParams();
end;

procedure TEdit_TW.TW_LENGTHChange(Sender: TObject);
begin

if (form_loading) then
        exit;
    //изменился размер товара:
    //1. менять кубатуру палеты      ??????????
    //2. менять количество упаковок в палете   ???????????????
    //1. менять размер упаковки?
    //2. менять количество товаров в упаковке  ???????????????



    change_tw_razm_text();

    if (ed_kubatura.Value = 0) then
        ed_kubatura.Value:= tw_width.Value * tw_length.Value * tw_height.Value;


//28-07-2014
    doCalcSkladPaletParams();
    exit;

    ed_kubatura.Value := tw_width.Value*tw_length.value*tw_height.value;
    

    palet_length.Value:=0;
    palet_width.value:=0;
    palet_height.Value:=0;

    application.ProcessMessages;

    if (chk_typical_palet.Checked) then      //типовая палета, из размера товара рассчитать его количество на палете
    begin
      if (tw_width.Value*tw_length.Value*tw_height.Value > 0) then
        tw_palet_kol.Value := TW_PALET_KUBATORA.Value / (tw_width.Value*tw_length.Value*tw_height.Value);
    end
    else
    begin
           if (not chk_stored_in_up.checked) then
            TW_PALET_KUBATORA.Value := tw_width.Value*tw_length.Value*tw_height.Value * tw_palet_kol.Value;
    end;
//    doCalcSkladPaletParams();
end;

procedure TEdit_TW.TW_PALET_UCHETClick(Sender: TObject);
begin
if (form_loading) then
        exit;

        change_tw_up_text();

end;

procedure TEdit_TW.up_lengthKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        up_kubatura.Value:=0;
        application.ProcessMessages;
end;

procedure TEdit_TW.palet_lengthKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        TW_PALET_KUBATORA.Value := 0;
        application.ProcessMessages;
end;

procedure TEdit_TW.TW_LENGTHKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        ed_kubatura.Value:=0;
        application.ProcessMessages;
end;

procedure TEdit_TW.TW_PALET_KUBATORAChange(Sender: TObject);
begin
if (form_loading) then
        exit;
        doCalcSkladPaletParams();
end;

end.
