unit DetalTW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_DBUtils,B_UTILS, Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin,
  StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls, Db, IBCustomDataSet,
  IBQuery, IBDatabase, RxLookup,VclUtils,DataPrint, RxMemDS, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppStrtch,
  ppMemo, ppPrnabl, ppCtrls, ppBands, ppVar, Menus,CHANGEDATE;

type
  TDetal_TW = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    BtnPrint: TToolButton;
    ToolButton2: TToolButton;
    Btn_INTERVAL: TToolButton;
    IBQuery1: TIBQuery;
    ToolButton4: TToolButton;
    Btn_BRAK: TToolButton;
    TW_NAM2: TEdit;
    ToolButton3: TToolButton;
    SKL1: TRadioButton;
    SKL2: TRadioButton;
    SKL: TRxDBLookupCombo;
    QrSKL: TIBQuery;
    DsSKL: TDataSource;
    ToolButton5: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    TWTREE_FULL: TEdit;
    TW_ART: TEdit;
    TW_NAM: TEdit;
    ED_FULL: TEdit;
    VALUTA_FULL: TEdit;
    TW_MADE: TEdit;
    TW_RAZM: TEdit;
    TW_UP: TEdit;
    TW_PRIM: TMemo;
    TW_SEK: TEdit;
    TW_MROZ: TRxCalcEdit;
    TW_MROZ_CENN: TRxCalcEdit;
    TWKTG_NAM: TEdit;
    TW_MROZ2: TRxCalcEdit;
    TW_MROZ2_CENN: TRxCalcEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    RxDBGrid8: TRxDBGrid;
    TabSheet4: TTabSheet;
    Panel2: TPanel;
    Panel4: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    OST1: TRxCalcEdit;
    OST2: TRxCalcEdit;
    OST3: TRxCalcEdit;
    RxDBGrid4: TRxDBGrid;
    Panel3: TPanel;
    Panel5: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Sert_NUM: TEdit;
    SERT_DATE: TDateEdit;
    SERT_WHO: TEdit;
    RxDBGrid5: TRxDBGrid;
    TabSheet5: TTabSheet;
    Status_POST: TStatusBar;
    PostGrid: TRxDBGrid;
    TabSheet6: TTabSheet;
    Status_REAL: TStatusBar;
    RealGrid: TRxDBGrid;
    TabSheet7: TTabSheet;
    Status_MOVE: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    N_OST: TRxCalcEdit;
    K_OST: TRxCalcEdit;
    N_OST_R: TRxCalcEdit;
    K_OST_R: TRxCalcEdit;
    MoveGrid: TRxDBGrid;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    StatusBar2: TStatusBar;
    REMONGrid: TRxDBGrid;
    TabSheet10: TTabSheet;
    Splitter1: TSplitter;
    Panel6: TPanel;
    Splitter2: TSplitter;
    Panel9: TPanel;
    Panel11: TPanel;
    Label33: TLabel;
    RxDBGrid2: TRxDBGrid;
    Panel10: TPanel;
    Panel12: TPanel;
    Label34: TLabel;
    RxDBGrid3: TRxDBGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    Label35: TLabel;
    RxDBGrid1: TRxDBGrid;
    Label4: TLabel;
    Label3: TLabel;
    TwMon: TRxMemoryData;
    TwMonTWMON_ID: TIntegerField;
    TwMonTW_KOL: TFloatField;
    TwMonTW_MONEY: TFloatField;
    TwMonTW_MONEY2: TFloatField;
    DsTwMon: TDataSource;
    TW_LAND: TEdit;
    TW_TAM: TEdit;
    Label7: TLabel;
    Label9: TLabel;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    TwMonSKID_PERCENT: TFloatField;
    PipRemon: TppDBPipeline;
    PpRemon: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    Remon_title1: TppMemo;
    ppLabel2: TppLabel;
    Remon_title2: TppMemo;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppShape2: TppShape;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel119: TppLabel;
    ppSystemVariable52: TppSystemVariable;
    ppLabel621: TppLabel;
    ppSystemVariable54: TppSystemVariable;
    ppLabel620: TppLabel;
    ppSystemVariable53: TppSystemVariable;
    PpRemonUser: TppLabel;
    ppLabel622: TppLabel;
    ppImage1: TppImage;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel23: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    PpRemonUser2: TppLabel;
    ppLabel25: TppLabel;
    ppImage2: TppImage;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    PpRemonVers: TppLabel;
    PipPost: TppDBPipeline;
    PpPost: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel27: TppLabel;
    Post_Title1: TppMemo;
    ppShape3: TppShape;
    ppLabel37: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel38: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel39: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    PpPostUser: TppLabel;
    ppLabel41: TppLabel;
    ppImage3: TppImage;
    ppHeaderBand2: TppHeaderBand;
    ppShape4: TppShape;
    ppLabel42: TppLabel;
    Post_Title2: TppMemo;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel54: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    PpPostUser2: TppLabel;
    ppLabel56: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    PpKLN_ORG: TppDBMemo;
    ppDBMemo6: TppDBMemo;
    ppSummaryBand2: TppSummaryBand;
    ppLine2: TppLine;
    ppImage4: TppImage;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    PpPostVers: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    PpMon1: TppDBText;
    PpMon2: TppDBText;
    PpSumm1: TppDBText;
    PpSumm2: TppDBText;
    ppDBMemo5: TppDBMemo;
    ppDBText16: TppDBText;
    ppDBMemo7: TppDBMemo;
    ppLabel40: TppLabel;
    ppLabel55: TppLabel;
    ppLabel59: TppLabel;
    ppLabel45: TppLabel;
    ppLabel50: TppLabel;
    ppLabel60: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    PpSumm3: TppDBCalc;
    PpSumm4: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    PpRealiz: TppReport;
    ppTitleBand3: TppTitleBand;
    ppLabel66: TppLabel;
    Realiz_title1: TppMemo;
    ppShape5: TppShape;
    ppLabel67: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLabel68: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppLabel69: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    PpRealizUser: TppLabel;
    ppLabel71: TppLabel;
    ppImage5: TppImage;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppHeaderBand3: TppHeaderBand;
    ppShape6: TppShape;
    ppLabel85: TppLabel;
    Realiz_title2: TppMemo;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppLabel95: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    PpRealizUser2: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBMemo8: TppDBMemo;
    ppDBMemo9: TppDBMemo;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBMemo10: TppDBMemo;
    ppDBText26: TppDBText;
    ppDBMemo11: TppDBMemo;
    ppSummaryBand3: TppSummaryBand;
    ppLine3: TppLine;
    ppImage6: TppImage;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    PpRealizVers: TppLabel;
    ppLabel107: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    PipRealiz: TppDBPipeline;
    ppLabel70: TppLabel;
    ppLabel75: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    PipMove: TppDBPipeline;
    PpMoveShort: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppTitleBand4: TppTitleBand;
    ppSummaryBand4: TppSummaryBand;
    ppDBText20: TppDBText;
    ppDBMemo12: TppDBMemo;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBMemo13: TppDBMemo;
    ppDBMemo14: TppDBMemo;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLine6: TppLine;
    ppImage7: TppImage;
    ppLabel89: TppLabel;
    ppLabel96: TppLabel;
    PpMoveShortVers: TppLabel;
    ppLabel106: TppLabel;
    ppSystemVariable16: TppSystemVariable;
    ppLabel108: TppLabel;
    ppSystemVariable17: TppSystemVariable;
    ppLabel109: TppLabel;
    ppSystemVariable18: TppSystemVariable;
    PpMoveShortUser: TppLabel;
    ppLabel111: TppLabel;
    ppImage8: TppImage;
    ppLabel110: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppLabel112: TppLabel;
    ppSystemVariable20: TppSystemVariable;
    ppLabel113: TppLabel;
    ppSystemVariable21: TppSystemVariable;
    PpMoveShortUser2: TppLabel;
    ppLabel115: TppLabel;
    ppShape9: TppShape;
    ppLabel103: TppLabel;
    ppLabel114: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppShape10: TppShape;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    MoveShortTitle1: TppMemo;
    MoveShortTitle2: TppMemo;
    ppLine7: TppLine;
    PpMoveFull: TppReport;
    ppTitleBand5: TppTitleBand;
    ppLabel80: TppLabel;
    ppSystemVariable22: TppSystemVariable;
    ppLabel129: TppLabel;
    ppSystemVariable23: TppSystemVariable;
    ppLabel130: TppLabel;
    ppSystemVariable24: TppSystemVariable;
    PpMoveFullUser: TppLabel;
    ppLabel132: TppLabel;
    ppImage9: TppImage;
    ppShape11: TppShape;
    MoveFullTitle1: TppMemo;
    ppHeaderBand5: TppHeaderBand;
    ppLabel140: TppLabel;
    ppSystemVariable25: TppSystemVariable;
    ppLabel141: TppLabel;
    ppSystemVariable26: TppSystemVariable;
    ppLabel142: TppLabel;
    ppSystemVariable27: TppSystemVariable;
    PpMoveFullUser2: TppLabel;
    ppLabel144: TppLabel;
    ppShape12: TppShape;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    MoveFullTitle2: TppMemo;
    ppDetailBand5: TppDetailBand;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppDBText30: TppDBText;
    ppDBMemo15: TppDBMemo;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBMemo16: TppDBMemo;
    ppDBMemo17: TppDBMemo;
    ppLine8: TppLine;
    ppSummaryBand5: TppSummaryBand;
    ppLine9: TppLine;
    ppImage10: TppImage;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    PpMoveFullVers: TppLabel;
    ppDBMemo18: TppDBMemo;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBMemo19: TppDBMemo;
    ppDBText38: TppDBText;
    ppLabel131: TppLabel;
    ppLabel143: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel159: TppLabel;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    HTransaction: TIBTransaction;
    QueryH: TIBQuery;
    QueryHSHOP_NAME: TIBStringField;
    QueryHUS_FULL: TIBStringField;
    QueryHTM: TDateTimeField;
    QueryHMESS: TIBStringField;
    DsH: TDataSource;
    Panel13: TPanel;
    Panel15: TPanel;
    Splitter3: TSplitter;
    Panel14: TPanel;
    RxDBGrid7: TRxDBGrid;
    QueryH2: TIBQuery;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    DateTimeField1: TDateTimeField;
    IBStringField3: TIBStringField;
    DsH2: TDataSource;
    Panel16: TPanel;
    RxDBGrid9: TRxDBGrid;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    QueryShop: TIBQuery;
    QueryShopTWMONSHOP_ID: TIntegerField;
    QueryShopSHOP_ID: TIntegerField;
    QueryShopSHOP_NAME: TIBStringField;
    QueryShopTW_MONEY: TFloatField;
    QueryShopTW_MONEY2: TFloatField;
    QueryShopSKID_PERCENT: TFloatField;
    DsShop: TDataSource;
    RxDBGrid6: TRxDBGrid;
    Label5: TLabel;
    MON1: TRxCalcEdit;
    Label6: TLabel;
    MON2: TRxCalcEdit;
    Panel20: TPanel;
    ShopTransaction: TIBTransaction;
    MemMove: TRxMemoryData;
    MemMoveMOVE_NUM_FULL: TStringField;
    MemMoveKLN_ORG: TStringField;
    MemMoveSKL_SHORT: TStringField;
    MemMovePOST_KOL: TFloatField;
    MemMoveREAL_KOL: TFloatField;
    MemMoveTW_MONEY: TFloatField;
    MemMoveTW_MONEYD: TFloatField;
    MemMoveTW_SUMM: TFloatField;
    MemMoveTW_SUMMD: TFloatField;
    MemMoveMOVE_KURS: TFloatField;
    MemMoveMOVEVID_NAM: TStringField;
    MemMoveMOVE_OSN: TStringField;
    MemMoveUS_FULL: TStringField;
    MemMoveSALDO: TFloatField;
    DsMove2: TDataSource;
    MemMovemove_color: TIntegerField;
    MemMovedoc_typ: TIntegerField;
    MemMovemove_id: TIntegerField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnDate: TMenuItem;
    MemMoveMOVE_DATE: TDateTimeField;
    MnRe: TMenuItem;
    DS_PRICE: TDataSource;
    PRICE: TRxMemoryData;
    PRICEtwprice_oldmoney: TFloatField;
    PRICEtwpricetyp_desc: TStringField;
    PRICEtwprice_money: TFloatField;
    PRICEtwprice_typ: TIntegerField;
    PRICEtwprice_id: TIntegerField;
    PRICEtwprice_money_origin: TFloatField;
    PRICEtm1: TDateField;
    PRICETWPRICE_DATE: TDateTimeField;
    PRICEdt_origin: TDateTimeField;
    PRICEnac_percent: TFloatField;
    PRICEtw_zak: TFloatField;
    PRICE_GRID: TRxDBGrid;
    RxDBGrid10: TRxDBGrid;
    Label37: TLabel;
    Label36: TLabel;
    tw_zone_distrib: TTabSheet;
    RxDBGrid11: TRxDBGrid;
    ds_tw_zone_distrib: TDataSource;
    q_tw_zone_distrib: TIBQuery;
    q_tw_zone_distribZONE_ID: TIntegerField;
    q_tw_zone_distribZONE_NAME: TIBStringField;
    q_tw_zone_distribTW_OST: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_BRAKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_INTERVALClick(Sender: TObject);
    procedure RealGridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure PostGridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure MoveGridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SKL2Click(Sender: TObject);
    procedure SKLChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TwMonCalcFields(DataSet: TDataSet);
    procedure ToolButton1Click(Sender: TObject);
    procedure MoveGridDblClick(Sender: TObject);
    procedure MoveGridKeyPress(Sender: TObject; var Key: Char);
    procedure RealGridDblClick(Sender: TObject);
    procedure RealGridKeyPress(Sender: TObject; var Key: Char);
    procedure PostGridDblClick(Sender: TObject);
    procedure PostGridKeyPress(Sender: TObject; var Key: Char);
    procedure PpRemonPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure PpPostPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand2BeforeGenerate(Sender: TObject);
    procedure ppTitleBand3BeforeGenerate(Sender: TObject);
    procedure PpRealizPreviewFormCreate(Sender: TObject);
    procedure ppDetailBand4BeforeGenerate(Sender: TObject);
    procedure ppTitleBand4BeforeGenerate(Sender: TObject);
    procedure PpMoveShortPreviewFormCreate(Sender: TObject);
    procedure ppDetailBand5BeforeGenerate(Sender: TObject);
    procedure ppTitleBand5BeforeGenerate(Sender: TObject);
    procedure PpMoveFullPreviewFormCreate(Sender: TObject);
    procedure MnDateClick(Sender: TObject);
    procedure Refresh_re_tw(DT:tdatetime;TW_ID2:integer);
    procedure MnReClick(Sender: TObject);
    procedure PRICECalcFields(DataSet: TDataSet);
    procedure tw_zone_distribShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MON_KURS:double;
  ED_SOKR:ansistring;
  Detal_TW: TDetal_TW;
  IDBRAK:integer=0;
  BRAK:integer=0;
  POST_DT1,POST_DT2,REAL_DT1,REAL_DT2:Tdatetime;
  MOVE_DT1,MOVE_DT2,REMON_DT1,REMON_DT2:Tdatetime;
  Post_refresh:boolean=True;
  Real_refresh:boolean=True;
  Move_refresh:boolean=True;
  Remon_refresh:boolean=True;
  Unprov_refresh:boolean=True;
  History_refresh:boolean=True;

implementation

uses DateInterval,WaitForm, Mainform, DataQr;

{$R *.DFM}

procedure TDetal_TW.FormShow(Sender: TObject);
var
  fq: FastQuery;
begin
    Top:=Main_Form.Top+22;
    Left:=Screen.DesktopLeft;
    Width:=Screen.DesktopWidth;
    Height:=Screen.DesktopHeight-Main_Form.Top-22-29;
    Post_refresh:=True;
    Real_refresh:=True;
    Move_refresh:=True;
    Remon_refresh:=True;
    Unprov_refresh:=True;
    History_refresh:=True;

//Цены прайс листа
     fq:=FastQuery.Create('SELECT * FROM TW_PRICE_LIST_FRM(:TW_ID, :FRM_ID)');

     fq.parambyname('tw_id').asinteger:=Detal_TW.tag;
     fq.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;

     fq.Open;
     price.LoadFromDataSet(fq, 0, lmAppend);
     price.DisableControls;
     price.first;
     while not price.Eof do
     begin
       case price.FieldByName('twprice_typ').AsInteger of
         1: if CHECK_USER_DOSTUP('PRICE_LIST_MONEY1')=-1 then
              price.Delete
            else price.next;
         2: if CHECK_USER_DOSTUP('PRICE_LIST_MONEY2')=-1 then
              price.Delete
            else price.next;
         3: if CHECK_USER_DOSTUP('PRICE_LIST_MONEY3')=-1 then
              price.Delete
            else price.next;
         4: if CHECK_USER_DOSTUP('PRICE_LIST_MONEY4')=-1 then
              price.Delete
            else price.next;
         5: if CHECK_USER_DOSTUP('PRICE_LIST_MONEY5')=-1 then
              price.Delete
            else price.next;
       else
         price.next;
       end;
     end;
     price.EnableControls;
     fq.Close;
     fq.Destroy;
     PRICE_GRID.ReadOnly:=true;
//****************
     if not SHOW_ZAKUP then begin
        // Запрещаем просмотр закупочных цен
        // В движении
        MoveGrid.Columns[1].visible:=False;
        MoveGrid.Columns[6].visible:=False;
        MoveGrid.Columns[7].visible:=False;
        MoveGrid.Columns[8].visible:=False;
        MoveGrid.Columns[9].visible:=False;
        MoveGrid.Columns[10].visible:=False;
        MoveGrid.Columns[12].visible:=False;
        Label3.visible:=False;
        Label4.visible:=False;
        N_OST_R.visible:=False;
        K_OST_R.visible:=False;

        // В поставках
        PostGrid.Columns[6].visible:=False;
        PostGrid.Columns[7].visible:=False;
        PostGrid.Columns[8].visible:=False;
        PostGrid.Columns[9].visible:=False;
        PostGrid.Columns[10].visible:=False;
        PostGrid.Columns[11].visible:=False;
        PostGrid.Columns[14].visible:=False;

     end;
     if not SHOW_POST then begin
        // Запрещаем просмотр наименование поставщика
        PostGrid.Columns[2].visible:=False;
     end;
     Wait_Form.Gauge1.Progress:=12;
     delay(1);
     BRAK:=0;
     GET_DEFAULT;
     POST_DT1:=date()-7;
     POST_DT2:=date();
     REAL_DT1:=date()-7;
     REAL_DT2:=date();
     MOVE_DT1:=date()-7;
     MOVE_DT2:=date();
     REMON_DT1:=date()-7;
     REMON_DT2:=date();
     PageControl1.ActivePage:=Tabsheet1;
     Wait_Form.Gauge1.Progress:=20;
     delay(1);
     {Читаем информацию}
     DataModule2.TransactionTwDetal.Active:=False;
     DataModule2.TransactionTwMove.Active:=False;
     QrSKL.Close;
     QrSKL.Open;
     Wait_Form.Gauge1.Progress:=25;
     delay(1);
     SKL.value:=inttostr(DEFAULT_SKLAD);
     if SHOPID=1 then SKL1.checked:=true else SKL2.checked:=true;
     SKL2Click(Sender);
     IbQuery1.Close;
     IbQuery1.SQL.clear;
     IbQuery1.SQL.add('select twtree.twtree_full,tw.tw_art,tw.tw_nam,ed.ed_short,ed_full,valuta.valuta_full,valuta.valuta_short, '+
      'tw.tw_made,tw.tw_razm,tw.tw_up,tw.tw_prim,tw.tw_sek,tw.tw_land,tw.tw_tam, '+
      'tw.tw_mroz,(select money from price_okrug((select kurs.kurs_kurs from kurs where kurs.valuta_id=tw.valuta_id '+
      'and kurs_date=(select max(kurs_date) from kurs where valuta_id=tw.valuta_id '+
      'and kurs.kurs_typ=0))*tw.tw_mroz)) as tw_mroz_cenn, '+
      '(select kurs.kurs_kurs from kurs where kurs.valuta_id=tw.valuta_id '+
      'and kurs_date=(select max(kurs_date) from kurs where valuta_id=tw.valuta_id '+
      'and kurs.kurs_typ=0)) as MON_KURS, '+
      'twktg.twktg_nam, '+
      '(select money from price_okrug((select kurs.kurs_kurs from kurs where kurs.valuta_id=tw.valuta_id '+
      'and kurs_date=(select max(kurs_date) from kurs where valuta_id=tw.valuta_id '+
      'and kurs.kurs_typ=0))*(select tw2.tw_mroz from tw tw2 where tw2.tw_art=tw1.tw_art and tw2.tw_brak="1"))) as tw_mroz2_cenn, '+
      '(select tw2.tw_mroz from tw tw2 where tw2.tw_art=tw1.tw_art and tw2.tw_brak="1") as tw_mroz2 '+
      'from tw tw1,twtree,ed,valuta,twktg '+
      'where tw1.twtree_id=twtree.twtree_id and tw1.ed_id=ed.ed_id '+
      'and tw1.valuta_id=valuta.valuta_id and tw1.twktg_id=twktg.twktg_id '+
      'and tw1.tw_id=:TW_ID');
     IbQuery1.Parambyname('TW_ID').asinteger:=Detal_TW.tag;
     IbQuery1.Open;
     Wait_Form.Gauge1.Progress:=40;
     delay(1);
     ED_SOKR:=IbQuery1.fieldbyname('ED_SHORT').asstring;
     TWTREE_FULL.text:=IbQuery1.fieldbyname('TWTREE_FULL').asstring;
     MON_KURS:=IbQuery1.fieldbyname('MON_KURS').asfloat;
     TW_ART.text:=IbQuery1.fieldbyname('TW_ART').asstring;
     TW_NAM.text:=IbQuery1.fieldbyname('TW_NAM').asstring;
     TW_NAM2.text:=IbQuery1.fieldbyname('TW_ART').asstring+': '+IbQuery1.fieldbyname('TW_NAM').asstring;
     ED_FULL.text:=IbQuery1.fieldbyname('ED_FULL').asstring;
     VALUTA_FULL.text:=IbQuery1.fieldbyname('VALUTA_FULL').asstring;
     TW_MADE.text:=IbQuery1.fieldbyname('TW_MADE').asstring;
     TW_RAZM.text:=IbQuery1.fieldbyname('TW_RAZM').asstring;
     TW_UP.text:=IbQuery1.fieldbyname('TW_UP').asstring;
     TW_LAND.text:=IbQuery1.fieldbyname('TW_LAND').asstring;
     TW_TAM.text:=IbQuery1.fieldbyname('TW_TAM').asstring;
     TW_PRIM.lines.clear;
     TW_PRIM.lines.add(IbQuery1.fieldbyname('TW_PRIM').asstring);
     TW_SEK.text:=IbQuery1.fieldbyname('TW_SEK').asstring;
     TW_MROZ.value:=IbQuery1.fieldbyname('TW_MROZ').asfloat;
     TW_MROZ2.value:=IbQuery1.fieldbyname('tw_mroz_cenn').asfloat;
     TW_MROZ.DisplayFormat:=',#0.0000 '+IbQuery1.fieldbyname('VALUTA_SHORT').asstring;
     TW_MROZ2.DisplayFormat:=',#0.0000 '+IbQuery1.fieldbyname('VALUTA_SHORT').asstring;
     MON1.value:=IbQuery1.fieldbyname('TW_MROZ').asfloat;
     MON2.value:=IbQuery1.fieldbyname('tw_mroz_cenn').asfloat;
     MON1.DisplayFormat:=',#0.0000 '+IbQuery1.fieldbyname('VALUTA_SHORT').asstring;
     MON2.DisplayFormat:=',#0.0000 '+IbQuery1.fieldbyname('VALUTA_SHORT').asstring;
     TW_MROZ_CENN.value:=IbQuery1.fieldbyname('TW_MROZ_CENN').asfloat;
     TW_MROZ2_CENN.value:=IbQuery1.fieldbyname('TW_MROZ2_CENN').asfloat;
     TWKTG_NAM.text:=IbQuery1.fieldbyname('TWKTG_NAM').asstring;
     OST1.DisplayFormat:='#0.0000 '+IbQuery1.fieldbyname('ED_SHORT').asstring;
     OST2.DisplayFormat:='#0.0000 '+IbQuery1.fieldbyname('ED_SHORT').asstring;
     OST3.DisplayFormat:='#0.0000 '+IbQuery1.fieldbyname('ED_SHORT').asstring;
     TwMonTW_MONEY.DisplayFormat:=',#0.0000 '+IbQuery1.fieldbyname('VALUTA_SHORT').asstring;
     TwMonTW_KOL.DisplayFormat:='#0.0000 '+ED_SOKR;
     {Определяем ID брака}
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     IbQuery1.Close;
     IbQuery1.SQL.clear;
     IbQuery1.SQL.add('select TW_ID FROM TW WHERE TW_BRAK="1" AND TW_ART=:TW_ART');
     IbQuery1.Parambyname('TW_ART').asinteger:=strtoint(TW_ART.text);
     IbQuery1.Open;
     Wait_Form.Gauge1.Progress:=70;
     delay(1);
     if not IbQuery1.eof then IDBRAK:=IbQuery1.Fieldbyname('TW_ID').asinteger;
     IbQuery1.Close;
     {Определяем цены}
     IBQuery1.SQL.clear;
     IBQuery1.SQL.add('select * from TWMON where TW_ID=:TW_ID order by TW_KOL desc');
     IBQuery1.ParamByname('TW_ID').asinteger:=Detal_TW.tag;
     IbQuery1.Open;
     Wait_Form.Gauge1.Progress:=80;
     delay(1);
     TwMon.emptyTable;
     while not IbQuery1.eof do begin
              TwMon.Insert;
              TwMon.FieldByname('TWMON_ID').asinteger:=IbQuery1.fieldByname('TWMON_ID').asinteger;
              TwMon.FieldByname('TW_KOL').asfloat:=IbQuery1.fieldByname('TW_KOL').asfloat;
              TwMon.FieldByname('TW_MONEY').asfloat:=TW_MROZ.value-(TW_MROZ.value/100)*IbQuery1.fieldByname('SKID_PERCENT').asfloat;
              TwMon.Post;
              IbQuery1.next;
     end;
     ShopTransaction.Active:=False;
     QueryShop.close;
     QueryShop.paramByname('TW_ID').asinteger:=DETAL_TW.tag;
     QueryShop.open;

     IbQuery1.close;
     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     Wait_Form.hide;

end;

procedure TDetal_TW.PageControl1Change(Sender: TObject);
var
  SAlDO:real;
begin
     BtnPrint.Enabled:=False;
     if PageControl1.ActivePage=Tabsheet4 then
     begin {Остатки и сертификация}
           DataModule2.Query_ost.disablecontrols;
           DataModule2.Query_ost.Close;
           DataModule2.Query_ost.Parambyname('TW_ID').asinteger:=Detal_TW.tag;
           DataModule2.Query_ost.Parambyname('TW_IDBRAK').asinteger:=IDBRAK;
           DataModule2.Query_ost.Open;
           OST1.value:=0;
           OST2.value:=0;
           OST3.value:=0;
           {Определяем общее количество}
           while not DataModule2.Query_ost.eof do begin
                 OST1.value:=OST1.value+DataModule2.Query_ost.FieldByname('OST1').asfloat;
                 OST3.value:=OST3.value+DataModule2.Query_ost.FieldByname('OST2').asfloat;
                 DataModule2.Query_ost.next;
           end;
           OST2.value:=OST1.value-OST3.value;
           DataModule2.Query_ost.First;
           DataModule2.Query_Sert.Close;
           DataModule2.Query_Sert.Parambyname('TW_ID').asinteger:=Detal_TW.tag;
           DataModule2.Query_Sert.Open;
           if not DataModule2.Query_Sert.eof then begin
              SERT_NUM.Text:=DataModule2.Query_Sert.fieldbyname('SERT_NUM').asstring;
              SERT_WHO.Text:=DataModule2.Query_Sert.fieldbyname('SERT_WHO').asstring;
              SERT_DATE.date:=DataModule2.Query_Sert.fieldbyname('SERT_DATE').asdatetime;
           end;
           DataModule2.Query_ost.Enablecontrols;
     end;
     if PageControl1.ActivePage=Tabsheet5 then
     begin {Поставки товара}
           BtnPrint.Enabled:=True;
           if (POST_DT1=POST_DT2) and (POST_DT1=date())
           then STATUS_POST.Panels[0].text:='Поставки товара за СЕГОДНЯ!'
           else STATUS_POST.Panels[0].text:='Поставки товара c '+
           date_sokr(POST_DT1)+' по '+date_sokr(POST_DT2);
           if (not DataModule2.Query_POST.Active) or (Post_refresh) then begin
             DataModule2.Query_POST.Close;
             DataModule2.Query_POST.Parambyname('TW_ID').asinteger:=Detal_TW.tag;
             DataModule2.Query_POST.Parambyname('DT1').asdatetime:=POST_DT1;
             DataModule2.Query_POST.Parambyname('DT2').asdatetime:=POST_DT2+1-SEKOND1;
             DataModule2.Query_POST.Parambyname('BRAK').asinteger:=BRAK;
             if SKL1.checked then DataModule2.Query_POST.Parambyname('SKL_ID').asinteger:=0
             else DataModule2.Query_POST.Parambyname('SKL_ID').asinteger:=strtoint(SKL.value);
             DataModule2.Query_POST.Open;
             Post_refresh:=False;
           end;
           PostGRID.setfocus;
     end;
     if PageControl1.ActivePage=Tabsheet6 then
     begin {Реализация товара}
           BtnPrint.Enabled:=True;
           if (REAL_DT1=REAL_DT2) and (REAL_DT1=date())
           then STATUS_REAL.Panels[0].text:='Реализация товара за СЕГОДНЯ!'
           else STATUS_REAL.Panels[0].text:='Реализация товара c '+
           date_sokr(REAL_DT1)+' по '+date_sokr(REAL_DT2);
           if (not DataModule2.Query_Realiz.Active) or (Real_refresh) then begin
             DataModule2.Query_REALiz.Close;
             DataModule2.Query_REALiz.Parambyname('TW_ID').asinteger:=Detal_TW.tag;
             DataModule2.Query_REALiz.Parambyname('DT1').asdatetime:=REAL_DT1;
             DataModule2.Query_REALiz.Parambyname('DT2').asdatetime:=REAL_DT2+1-SEKOND1;
             DataModule2.Query_REALiz.Parambyname('BRAK').asinteger:=BRAK;
             if SKL1.checked then DataModule2.Query_REALIZ.Parambyname('SKL_ID').asinteger:=0
             else DataModule2.Query_REALIZ.Parambyname('SKL_ID').asinteger:=strtoint(SKL.value);
             DataModule2.Query_REALiz.Open;
             Real_refresh:=false;
           end;
           RealGRID.setfocus;
     end;
     if PageControl1.ActivePage=Tabsheet8 then
     if History_refresh then
     begin {История изменений}
       HTransaction.Active:=False;
       QueryH.close;
       if BRAK=0 then
          QueryH.parambyname('TW_ID').asinteger:=Detal_TW.tag
       else
           QueryH.parambyname('TW_ID').asinteger:=IDBRAK;
       QueryH.Open;

       QueryH2.close;
       if BRAK=0 then
          QueryH2.parambyname('TW_ID').asinteger:=Detal_TW.tag
       else
           QueryH2.parambyname('TW_ID').asinteger:=IDBRAK;
       QueryH2.Open;

       History_refresh:=False;
     end;
     if PageControl1.ActivePage=Tabsheet9 then
     begin {Переоценки товара}
           BtnPrint.Enabled:=True;
           if (not DataModule2.Query_REMON.Active) or (REMON_refresh) then begin
             DataModule2.Query_REMON.Close;
             if BRAK=0 then
               DataModule2.Query_REMON.Parambyname('TW_ID').asinteger:=Detal_TW.tag
             else
               DataModule2.Query_REMON.Parambyname('TW_ID').asinteger:=IDBRAK;
             DataModule2.Query_REMON.Open;
             Remon_refresh:=False;
           end;
           RemonGRID.setfocus;
     end;
     if PageControl1.ActivePage=Tabsheet10 then
     begin {Товар в непроведённых накладных}
           if (not DataModule2.Query_Unprov_PN.Active) or (Unprov_refresh) then begin
             DataModule2.Query_Unprov_PN.Close;
             DataModule2.Query_Unprov_PN.Parambyname('TW_ID').asinteger:=Detal_TW.tag;
             DataModule2.Query_Unprov_PN.Parambyname('BRAK').asinteger:=BRAK;
             DataModule2.Query_Unprov_PN.Open;
           end;
           if (not DataModule2.Query_Unprov_RN.Active) or (Unprov_refresh) then begin
             DataModule2.Query_Unprov_RN.Close;
             DataModule2.Query_Unprov_RN.Parambyname('TW_ID').asinteger:=Detal_TW.tag;
             DataModule2.Query_Unprov_RN.Parambyname('BRAK').asinteger:=BRAK;
             DataModule2.Query_Unprov_RN.Open;
           end;
           if (not DataModule2.Query_Unprov_PER.Active) or (Unprov_refresh) then begin
             DataModule2.Query_Unprov_PER.Close;
             DataModule2.Query_Unprov_PER.Parambyname('TW_ID').asinteger:=Detal_TW.tag;
             DataModule2.Query_Unprov_PER.Parambyname('BRAK').asinteger:=BRAK;
             DataModule2.Query_Unprov_PER.Open;
           end;
           Unprov_refresh:=False;
     end;
     if PageControl1.ActivePage=Tabsheet7 then
     begin {Движение товара}
           BtnPrint.Enabled:=True;
           {Определяем начальный и конечный остатки}
           IbQuery1.close;
           IbQuery1.SQL.clear;
           if SKL1.Checked then begin
              IbQuery1.SQL.add('select sum(post+rash) as ost from tmp_post_rash_date(:tw_id,:DT)');
           end else begin
              IbQuery1.SQL.add('select sum(post+rash) as ost from tmp_post_rash_date(:tw_id,:DT) where SKL_ID= :SKL_ID');
              IbQuery1.ParamByname('SKL_ID').asinteger:=strtoint(SKL.value);
           end;
           if Btn_BRAK.Down then IbQuery1.ParamByname('TW_ID').asinteger:=IDBRAK
                            else IbQuery1.ParamByname('TW_ID').asinteger:=Detal_TW.tag;
           IbQuery1.ParamByname('DT').asdatetime:=MOVE_DT1;
           IbQuery1.open;
           if IbQuery1.eof then N_OST.value:=0 else N_OST.value:=IbQuery1.fieldByname('OST').asfloat;
           IbQuery1.close;
           IbQuery1.ParamByname('DT').asdatetime:=MOVE_DT2+1-Sekond1;
           IbQuery1.open;
           if IbQuery1.eof then K_OST.value:=0 else K_OST.value:=IbQuery1.fieldByname('OST').asfloat;
           IbQuery1.close;
           if Btn_BRAK.Down then  N_OST_R.value:=N_OST.value*TW_MROZ2_CENN.value
                            else N_OST_R.value:=N_OST.value*TW_MROZ_CENN.value;
           if Btn_BRAK.Down then  K_OST_R.value:=K_OST.value*TW_MROZ2_CENN.value
                            else K_OST_R.value:=K_OST.value*TW_MROZ_CENN.value;
           IbQuery1.close;
           // Запрос самого движения
           if (MOVE_DT1=MOVE_DT2) and (MOVE_DT1=date())
           then STATUS_MOVE.Panels[0].text:='Движение товара за СЕГОДНЯ!'
           else STATUS_MOVE.Panels[0].text:='Движение товара c '+
           date_sokr(MOVE_DT1)+' по '+date_sokr(MOVE_DT2);
           if (not DataModule2.Query_Move.Active) or (Move_refresh) then begin
             DataModule2.Query_MOVE.Close;
             DataModule2.Query_MOVE.Parambyname('TW_ID').asinteger:=Detal_TW.tag;
             DataModule2.Query_MOVE.Parambyname('DT1').asdatetime:=MOVE_DT1;
             DataModule2.Query_MOVE.Parambyname('DT2').asdatetime:=MOVE_DT2+1-SEKOND1;
             DataModule2.Query_MOVE.Parambyname('BRAK').asinteger:=BRAK;
             if SKL1.checked then DataModule2.Query_MOVE.Parambyname('SKL_ID').asinteger:=0
             else DataModule2.Query_MOVE.Parambyname('SKL_ID').asinteger:=strtoint(SKL.value);
             DataModule2.Query_MOVE.Open;
             Move_refresh:=False;
           end;
           MemMove.Disablecontrols;
           MemMove.EmptyTable;
           SALDO:=N_OST.value;
           while not DataModule2.Query_MOVE.eof do begin
              MemMove.Append;
              MemMove.fieldByname('MOVE_NUM_FULL').asstring:=DataModule2.Query_MOVE.fieldByname('MOVE_NUM_FULL').asstring;
              MemMove.fieldByname('KLN_ORG').asstring:=DataModule2.Query_MOVE.fieldByname('KLN_ORG').asstring;
              MemMove.fieldByname('SKL_SHORT').asstring:=DataModule2.Query_MOVE.fieldByname('SKL_SHORT').asstring;
              MemMove.fieldByname('MOVE_ID').asinteger:=DataModule2.Query_MOVE.fieldByname('MOVE_ID').asinteger;
              MemMove.fieldByname('MOVE_DATE').asdatetime:=DataModule2.Query_MOVE.fieldByname('MOVE_DATE').asdatetime;
              MemMove.fieldByname('POST_KOL').asfloat:=DataModule2.Query_MOVE.fieldByname('POST_KOL').asfloat;
              MemMove.fieldByname('REAL_KOL').asfloat:=DataModule2.Query_MOVE.fieldByname('REAL_KOL').asfloat;
              MemMove.fieldByname('TW_MONEY').asfloat:=DataModule2.Query_MOVE.fieldByname('TW_MONEY').asfloat;
              MemMove.fieldByname('TW_MONEYD').asfloat:=DataModule2.Query_MOVE.fieldByname('TW_MONEYD').asfloat;
              MemMove.fieldByname('TW_SUMM').asfloat:=DataModule2.Query_MOVE.fieldByname('TW_SUMM').asfloat;
              MemMove.fieldByname('TW_SUMMD').asfloat:=DataModule2.Query_MOVE.fieldByname('TW_SUMMD').asfloat;
              MemMove.fieldByname('MOVE_KURS').asfloat:=DataModule2.Query_MOVE.fieldByname('MOVE_KURS').asfloat;
              MemMove.fieldByname('MOVE_color').asinteger:=DataModule2.Query_MOVE.fieldByname('MOVE_COLOR').asinteger;
              MemMove.fieldByname('DOC_TYP').asinteger:=DataModule2.Query_MOVE.fieldByname('DOC_TYP').asinteger;
              MemMove.fieldByname('MOVEVID_NAM').asstring:=DataModule2.Query_MOVE.fieldByname('MOVEVID_NAM').asstring;
              MemMove.fieldByname('MOVE_OSN').asstring:=DataModule2.Query_MOVE.fieldByname('MOVE_OSN').asstring;
              MemMove.fieldByname('US_FULL').asstring:=DataModule2.Query_MOVE.fieldByname('US_FULL').asstring;
              if ((SKL1.checked) and (DataModule2.Query_MOVE.fieldByname('DOC_TYP').asinteger<4))
              or SKL2.checked then SALDO:=SALDO+DataModule2.Query_MOVE.fieldByname('POST_KOL').asfloat-DataModule2.Query_MOVE.fieldByname('REAL_KOL').asfloat;
              MemMove.fieldByname('SALDO').asfloat:=SALDO;
              MemMove.Post;
              DataModule2.Query_MOVE.next;
           end;
           MemMove.First;
           MemMove.EnableControls;
           MoveGRID.setfocus;
     end;
     if ((MemMove.RecordCount>0) and (ADM_TIME)) then MnDate.enabled:=true else MnDate.enabled:=false;
     MnRe.Enabled:=MnDate.enabled;
end;

procedure TDetal_TW.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QueryH.close;
     HTransaction.Active:=False;
     DataModule2.Query_Unprov_RN.Close;
     DataModule2.Query_Unprov_PN.Close;
     DataModule2.Query_Unprov_PER.Close;
     DataModule2.Query_REMON.Close;
     DataModule2.Query_Move.Close;
     DataModule2.Query_ost.Close;
     DataModule2.Query_sert.Close;
     DataModule2.Query_post.Close;
     ibquery1.Close;
     QrSKL.Close;
     DataModule2.TransactionTwDetal.Active:=False;
     DataModule2.TransactionTWMove.Active := false;
     DataModule1.IBTransaction1.Active:=false;

end;

procedure TDetal_TW.Btn_BRAKClick(Sender: TObject);
begin
     if Brak=0 then Brak:=1  else Brak:=0;
     if Brak=1 then Btn_BRAK.down:=true else Btn_BRAK.down:=false;
     if PageControl1.ActivePage=Tabsheet5 then Post_Refresh:=True;
     if PageControl1.ActivePage=Tabsheet6 then Real_Refresh:=True;
     if PageControl1.ActivePage=Tabsheet7 then Move_Refresh:=True;
     History_Refresh:=True;
     if PageControl1.ActivePage=Tabsheet9 then Remon_Refresh:=True;
     if PageControl1.ActivePage=Tabsheet10 then Unprov_Refresh:=True;
     if Brak=1 then TW_NAM2.text:=TW_ART.text+': (Б) '+TW_NAM.text
               else TW_NAM2.text:=TW_ART.text+': '+TW_NAM.text;
     PageControl1Change(Sender);
end;

procedure TDetal_TW.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        Key:=#0;
        close;
     end;
     if key='+' then begin
       key:=#0;
       if PageControl1.ActivePage=Tabsheet5 then begin
         POST_DT1:=POST_DT1+1;
         POST_DT2:=POST_DT2+1;
         Post_refresh:=true;
         PageControl1Change(Sender);
       end;
       if PageControl1.ActivePage=Tabsheet6 then begin
         REAL_DT1:=REAL_DT1+1;
         REAL_DT2:=REAL_DT2+1;
         Real_refresh:=true;
         PageControl1Change(Sender);
       end;
       if PageControl1.ActivePage=Tabsheet7 then begin
         MOVE_DT1:=MOVE_DT1+1;
         MOVE_DT2:=MOVE_DT2+1;
         Move_refresh:=true;
         PageControl1Change(Sender);
       end;
     end;
     if key='-' then begin
       key:=#0;
       if PageControl1.ActivePage=Tabsheet5 then begin
         POST_DT1:=POST_DT1-1;
         POST_DT2:=POST_DT2-1;
         Post_refresh:=true;
         PageControl1Change(Sender);
       end;
       if PageControl1.ActivePage=Tabsheet6 then begin
         REAL_DT1:=REAL_DT1-1;
         REAL_DT2:=REAL_DT2-1;
         Real_refresh:=true;
         PageControl1Change(Sender);
       end;
       if PageControl1.ActivePage=Tabsheet7 then begin
         MOVE_DT1:=MOVE_DT1-1;
         MOVE_DT2:=MOVE_DT2-1;
         Move_refresh:=true;
         PageControl1Change(Sender);
       end;
     end;
     if key in ['c','C','с','С'] then begin
       key:=#0;
       if PageControl1.ActivePage=Tabsheet5 then begin
         POST_DT1:=Date;
         POST_DT2:=Date;
         Post_refresh:=True;
         PageControl1Change(Sender);
       end;
       if PageControl1.ActivePage=Tabsheet6 then begin
         REAL_DT1:=Date;
         REAL_DT2:=Date;
         Real_refresh:=true;
         PageControl1Change(Sender);
       end;
       if PageControl1.ActivePage=Tabsheet7 then begin
         MOVE_DT1:=Date;
         MOVE_DT2:=Date;
         Move_refresh:=true;
         PageControl1Change(Sender);
       end;
     end;
     if key in ['i','I','ш','Ш'] then begin
       key:=#0;
       Btn_Interval.click;
     end;
     if key in ['1','2','3','4','5','6','7','8','9','0'] then begin
        case key of
             '1':PageControl1.ActivePage:=Tabsheet1;
             '2':PageControl1.ActivePage:=Tabsheet2;
             '3':PageControl1.ActivePage:=Tabsheet3;
             '4':PageControl1.ActivePage:=Tabsheet4;
             '5':PageControl1.ActivePage:=Tabsheet5;
             '6':PageControl1.ActivePage:=Tabsheet6;
             '7':PageControl1.ActivePage:=Tabsheet7;
             '8':PageControl1.ActivePage:=Tabsheet8;
             '9':PageControl1.ActivePage:=Tabsheet9;
             '0':PageControl1.ActivePage:=Tabsheet10;
        end;
        key:=#0;
        PageControl1Change(Sender);
     end;
     if key=#32 then begin
        key:=#0;
        Btn_BRAK.click;
     end;
end;

procedure TDetal_TW.Btn_INTERVALClick(Sender: TObject);
begin
  Application.createForm(TDate_interval,Date_Interval);
  Date_interval.tag:=-1;
  if PageControl1.ActivePage=Tabsheet5 then begin
    Date_interval.Dt1.date:=POST_DT1;
    Date_interval.Dt2.date:=POST_DT2;
    Date_interval.Showmodal;
  end;
  if PageControl1.ActivePage=Tabsheet6 then begin
    Date_interval.Dt1.date:=REAL_DT1;
    Date_interval.Dt2.date:=REAL_DT2;
    Date_interval.Showmodal;
  end;
  if PageControl1.ActivePage=Tabsheet7 then begin
    Date_interval.Dt1.date:=MOVE_DT1;
    Date_interval.Dt2.date:=MOVE_DT2;
    Date_interval.Showmodal;
  end;
  if Date_interval.tag=2 then begin
    if PageControl1.ActivePage=Tabsheet5 then begin
      POST_DT1:=Date_interval.Dt1.date;
      POST_DT2:=Date_interval.Dt2.date;
      Post_refresh:=true;
    end;
    if PageControl1.ActivePage=Tabsheet6 then begin
      REAL_DT1:=Date_interval.Dt1.date;
      REAL_DT2:=Date_interval.Dt2.date;
      Real_refresh:=true;
    end;
    if PageControl1.ActivePage=Tabsheet7 then begin
      MOVE_DT1:=Date_interval.Dt1.date;
      MOVE_DT2:=Date_interval.Dt2.date;
      Move_refresh:=true;
    end;
    PageControl1Change(Sender);
  end;
  Date_interval.destroy;
end;

procedure TDetal_TW.RealGridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  COLOR:integer;
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     COLOR:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REAL_COLOR').Asinteger;
     if Field.Fieldname='REAL_NUM_FULL' then begin
        if COLOR>0 then BackGround:=Color;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='REAL_NUM_FULL' then begin
           if COLOR>0 then Afont.color:=Color;
        end;
     end;
end;

procedure TDetal_TW.PostGridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  COLOR:integer;
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     COLOR:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN_COLOR').Asinteger;
     if Field.Fieldname='PN_NUM_FULL' then begin
        if COLOR>0 then BackGround:=Color;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='PN_NUM_FULL' then begin
           if COLOR>0 then Afont.color:=Color;
        end;
     end;
end;

procedure TDetal_TW.MoveGridGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  COLOR:integer;
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     COLOR:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MOVE_COLOR').Asinteger;
     if Field.Fieldname='MOVE_NUM_FULL' then begin
        if COLOR>0 then BackGround:=Color;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='MOVE_NUM_FULL' then begin
           if COLOR>0 then Afont.color:=Color;
        end;
     end;
     if Field.Fieldname='POST_KOL' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POST_KOL').Asfloat>0
        then begin
          Afont.color:=clHighlighttext;
          Background:=clHighlight;
        end;
     end;
     if Field.Fieldname='REAL_KOL' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REAL_KOL').Asfloat>0
        then begin
          Afont.color:=clHighlighttext;
          Background:=clHighlight;
        end;
     end;
     if Field.Fieldname='SALDO' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SALDO').Asfloat<0
        then begin
          Afont.color:=clYellow;
          Background:=clRed;
        end;
     end;


end;

procedure TDetal_TW.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  COLOR:integer;
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     COLOR:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PN_COLOR').Asinteger;
     if Field.Fieldname='PN_NUM_FULL' then begin
        if COLOR>0 then BackGround:=Color;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='PN_NUM_FULL' then begin
           if COLOR>0 then Afont.color:=Color;
        end;
     end;
end;

procedure TDetal_TW.RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  COLOR:integer;
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     COLOR:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('REAL_COLOR').Asinteger;
     if Field.Fieldname='REAL_NUM_FULL' then begin
        if COLOR>0 then BackGround:=Color;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='REAL_NUM_FULL' then begin
           if COLOR>0 then Afont.color:=Color;
        end;
     end;
end;

procedure TDetal_TW.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  COLOR:integer;
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     COLOR:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PER_COLOR').Asinteger;
     if Field.Fieldname='PER_NUM_FULL' then begin
        if COLOR>0 then BackGround:=Color;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='PER_NUM_FULL' then begin
           if COLOR>0 then Afont.color:=Color;
        end;
     end;
end;

procedure TDetal_TW.SKL2Click(Sender: TObject);
begin
     SKL.enabled:=SKL2.checked;
     Real_refresh:=True;
     Post_refresh:=True;
     Move_refresh:=True;
     if DETAL_TW.visible then PageControl1Change(Sender);
end;

procedure TDetal_TW.SKLChange(Sender: TObject);
begin
     Real_refresh:=True;
     Post_refresh:=True;
     Move_refresh:=True;
     if DETAL_TW.visible then PageControl1Change(Sender);
end;

procedure TDetal_TW.FormCreate(Sender: TObject);
begin
     Wait_Form.StatusBar1.panels[0].text:='Запрос информации...';
     Wait_Form.Gauge1.Progress:=5;
     delay(1);
     Wait_Form.Show;
     Wait_Form.Gauge1.Progress:=7;
     delay(1);
end;

procedure TDetal_TW.BtnPrintClick(Sender: TObject);
var
   s:ansistring;
begin
     if (Pagecontrol1.ActivePage=Tabsheet1) or
     (Pagecontrol1.ActivePage=Tabsheet2) or
     (Pagecontrol1.ActivePage=Tabsheet3) or
     (Pagecontrol1.ActivePage=Tabsheet4) or
     (Pagecontrol1.ActivePage=Tabsheet8) or
     (Pagecontrol1.ActivePage=Tabsheet10)
      then
     Messbox('Данная информация не может быть распечатана!'+CR+
     'Печатаются закладки: Поставки, Реализация и Движение.',MessSystem,48);

     if Pagecontrol1.ActivePage=Tabsheet5 then begin
        {Поставки товара}
        s:='"'+TW_NAM2.text+'". Список поставок за период с '+date_sokr(POST_DT1)+' по '+date_sokr(POST_DT2);
        if SKL1.checked then s:=s+', по всем складам'
                        else s:=s+', по складу: '+SKL.text;
        if not CHECK_DOSTUP('$SHOW.ZAKUP') then begin  // Ограничение на просмотр цен
             PpSumm1.Visible:=False;
             PpSumm2.Visible:=False;
             PpSumm3.Visible:=False;
             PpSumm4.Visible:=False;
        end;
        if not CHECK_DOSTUP('$FIND.PN') then begin  // Ограничение на просмотр информации о поставщике
           PpKln_Org.Visible:=False;
        end;

        Post_title1.lines.clear;
        Post_title1.lines.add(s);
        Post_title2.lines.clear;
        Post_title2.lines.add(s);
        PpPost.reset;
        PpPost.print;
     end;
     if Pagecontrol1.ActivePage=Tabsheet6 then begin
        {Реализация товара}
        s:='"'+TW_NAM2.text+'". Список реализации за период с '+date_sokr(POST_DT1)+' по '+date_sokr(POST_DT2);
        if SKL1.checked then s:=s+', по всем складам'
                        else s:=s+', по складу: '+SKL.text;
        Realiz_title1.lines.clear;
        Realiz_title1.lines.add(s);
        Realiz_title2.lines.clear;
        Realiz_title2.lines.add(s);
        PpRealiz.reset;
        PpRealiz.print;
     end;
     if Pagecontrol1.ActivePage=Tabsheet7 then begin
        {Движение товара}
        s:='"'+TW_NAM2.text+'". Движение за период с '+date_sokr(MOVE_DT1)+' по '+date_sokr(MOVE_DT2);
        if SKL1.checked then s:=s+', по всем складам'
                        else s:=s+', по складу: '+SKL.text;
        if not Show_ZAKUP then s:=s+', Начальный остаток: '+floattostrf(N_OST.value,fffixed,19,4)
        else s:=s+', Начальный остаток: '+floattostrf(N_OST.value,fffixed,19,4)+' на сумму в рознице: '+
           floattostrf(N_OST_R.value,fffixed,19,2)+' руб.';
        if not Show_ZAKUP then s:=s+', Конечный остаток: '+floattostrf(K_OST.value,fffixed,19,4)
        else s:=s+', Конечный остаток: '+floattostrf(K_OST.value,fffixed,19,4)+' на сумму в рознице: '+
           floattostrf(K_OST_R.value,fffixed,19,2)+' руб.';
        if not Show_Zakup then begin
           MoveShortTitle1.lines.clear;
           MoveShortTitle2.lines.clear;
           MoveShortTitle1.lines.add(s);
           MoveShortTitle2.lines.add(s);
           PpMoveShort.reset;
           PpMoveShort.Print;
        end else begin
           MoveFullTitle1.lines.clear;
           MoveFullTitle2.lines.clear;
           MoveFullTitle1.lines.add(s);
           MoveFullTitle2.lines.add(s);
           PpMoveFull.reset;
           PpMoveFull.Print;
        end;
     end;
     if Pagecontrol1.ActivePage=Tabsheet9 then begin
        {Переоценки товара}
        Remon_title1.lines.clear;
        Remon_title1.lines.add('"'+TW_NAM2.text+'". Список переоценок товара');
        Remon_title2.lines.clear;
        Remon_title2.lines.add('"'+TW_NAM2.text+'". Список переоценок товара');
        PpRemon.reset;
        PpRemon.print;
     end;
end;

procedure TDetal_TW.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=120 then begin
        key:=0;
        BtnPrint.click;
     end;
end;

procedure TDetal_TW.TwMonCalcFields(DataSet: TDataSet);
begin
     TwMon.fieldByname('TW_MONEY2').asfloat:=
     TwMon.fieldByname('TW_MONEY').asfloat*MON_KURS;
     TwMon.fieldByname('SKID_PERCENT').asfloat:=(tw_mroz.value-TwMon.fieldByname('TW_MONEY').asfloat)/(tw_mroz.value/100);
end;

procedure TDetal_TW.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TDetal_TW.MoveGridDblClick(Sender: TObject);
begin
     // -1 -PN
     // 1-RN
     // 2-SPIS
     //3 PER - приход
     //4 PER- расход
   if MemMove.recordcount>0 then begin
     if MemMove.fieldbyname('DOC_TYP').asinteger=1 then EDIT_RN(MemMove.fieldbyname('MOVE_ID').asinteger);
     if MemMove.fieldbyname('DOC_TYP').asinteger=-1 then EDIT_PN(MemMove.fieldbyname('MOVE_ID').asinteger);
     if MemMove.fieldbyname('DOC_TYP').asinteger=2 then EDIT_SPIS(MemMove.fieldbyname('MOVE_ID').asinteger);
     if MemMove.fieldbyname('DOC_TYP').asinteger in [5,4] then EDIT_PER(MemMove.fieldbyname('MOVE_ID').asinteger);
     if MemMove.fieldbyname('DOC_TYP').asinteger=-2 then EDIT_PSORT(MemMove.fieldbyname('MOVE_ID').asinteger); // пересортица
     if MemMove.fieldbyname('DOC_TYP').asinteger=3 then EDIT_PSORT(MemMove.fieldbyname('MOVE_ID').asinteger); // пересортица
   end;
end;

procedure TDetal_TW.MoveGridKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then begin
       key:=#0;
       MoveGridDblClick(Sender);
     end;
end;

procedure TDetal_TW.RealGridDblClick(Sender: TObject);
begin
     // 1-RN
     // 2-SPIS
   if not Datamodule2.Query_REALIZ.eof then begin
     if Datamodule2.Query_REALIZ.fieldbyname('DOC_TYP').asinteger=1 then EDIT_RN(Datamodule2.Query_REALIZ.fieldbyname('REAL_ID').asinteger);
     if Datamodule2.Query_REALIZ.fieldbyname('DOC_TYP').asinteger=2 then EDIT_SPIS(Datamodule2.Query_REALIZ.fieldbyname('REAL_ID').asinteger);
   end;

end;

procedure TDetal_TW.RealGridKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then begin
       key:=#0;
       REalGridDblClick(Sender);
     end;
end;

procedure TDetal_TW.PostGridDblClick(Sender: TObject);
begin
     // 0 -PN
     // 1-RN
     // 2-SPIS
     //3 PER - приход
     //4 PER- расход
   if not Datamodule2.Query_Post.eof then begin
     EDIT_PN(Datamodule2.Query_Post.fieldbyname('PN_ID').asinteger);
   end;

end;

procedure TDetal_TW.PostGridKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then begin
       key:=#0;
       PostGridDblClick(Sender);
     end;
end;

procedure TDetal_TW.PpRemonPreviewFormCreate(Sender: TObject);
begin
     PpRemon.PreviewForm.WindowState:=WsMaximized;
end;

procedure TDetal_TW.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpRemonUser.Caption:=USERFIO_SHORT;
     PpRemonUser2.Caption:=USERFIO_SHORT;
     PpRemonVers.caption:=PROG_VERSION;
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TDetal_TW.PpPostPreviewFormCreate(Sender: TObject);
begin
     PpPost.PreviewForm.WindowState:=WsMaximized;
end;

procedure TDetal_TW.ppTitleBand2BeforeGenerate(Sender: TObject);
begin
     PpPostUser.Caption:=USERFIO_SHORT;
     PpPostUser2.Caption:=USERFIO_SHORT;
     PpPostVers.caption:=PROG_VERSION;
     try
       Ppimage3.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TDetal_TW.ppTitleBand3BeforeGenerate(Sender: TObject);
begin
     PpRealizUser.Caption:=USERFIO_SHORT;
     PpRealizUser2.Caption:=USERFIO_SHORT;
     PpRealizVers.caption:=PROG_VERSION;
     try
       Ppimage5.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TDetal_TW.PpRealizPreviewFormCreate(Sender: TObject);
begin
     PpRealiz.PreviewForm.WindowState:=WsMaximized;
end;

procedure TDetal_TW.ppDetailBand4BeforeGenerate(Sender: TObject);
begin
  if DataModule2.Query_Move.fieldbyname('POST_KOL').asfloat<>0
  then PpShape7.visible:=true else PpShape7.visible:=False;
  if DataModule2.Query_Move.fieldbyname('REAL_KOL').asfloat<>0
  then PpShape8.visible:=true else PpShape8.visible:=False;
end;

procedure TDetal_TW.ppTitleBand4BeforeGenerate(Sender: TObject);
begin
     PpMoveShortUser.Caption:=USERFIO_SHORT;
     PpMoveShortUser2.Caption:=USERFIO_SHORT;
     PpMoveShortVers.caption:=PROG_VERSION;
     try
       Ppimage8.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TDetal_TW.PpMoveShortPreviewFormCreate(Sender: TObject);
begin
     PpMoveShort.PreviewForm.WindowState:=WsMaximized;
end;

procedure TDetal_TW.ppDetailBand5BeforeGenerate(Sender: TObject);
begin
  if DataModule2.Query_Move.fieldbyname('POST_KOL').asfloat<>0
  then PpShape14.visible:=true else PpShape14.visible:=False;
  if DataModule2.Query_Move.fieldbyname('REAL_KOL').asfloat<>0
  then PpShape13.visible:=true else PpShape13.visible:=False;
end;

procedure TDetal_TW.ppTitleBand5BeforeGenerate(Sender: TObject);
begin
     PpMoveFullUser.Caption:=USERFIO_SHORT;
     PpMoveFullUser2.Caption:=USERFIO_SHORT;
     PpMoveFullVers.caption:=PROG_VERSION;
     try
       Ppimage9.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TDetal_TW.PpMoveFullPreviewFormCreate(Sender: TObject);
begin
     PpMoveFull.PreviewForm.WindowState:=WsMaximized;
end;

procedure TDetal_TW.MnDateClick(Sender: TObject);
var
  hh,mm,ss,s100:word;
  tm,tm_old:tdatetime;
  ID:integer;
  SALDO,r:double;
begin
   // Изменяем время документа
   Application.createForm(TCHANGE_DATE,CHANGE_DATE);
   tm_old:=striptime(MemMove.fieldByname('MOVE_DATE').asdatetime);
   CHANGE_DATE.DT.date:=striptime(MemMove.fieldByname('MOVE_DATE').asdatetime);
   decodetime(MemMove.fieldByname('MOVE_DATE').asdatetime,hh,mm,ss,s100);
   CHANGE_DATE.TM.Text:=b_utils.right('00'+inttostr(hh),2)+':'+b_utils.right('00'+inttostr(mm),2)+':'+b_utils.right('00'+inttostr(ss),2);
   CHANGE_DATE.ShowModal;
   if CHANGE_DATE.tag>0 then begin
     if Messbox('Изменение даты и времени документа повлияет на определение себестоимости и наценки. Вы уверены?',MessSubmit,4+48+256)=6
     then begin
       hh:=strtoint(copy(CHANGE_DATE.TM.Text,1,2));
       mm:=strtoint(copy(CHANGE_DATE.TM.Text,4,2));
       ss:=strtoint(copy(CHANGE_DATE.TM.Text,7,2));
       if hh>23 then hh:=23;
       if mm>59 then mm:=59;
       if ss>59 then ss:=59;
       tm:=striptime(CHANGE_DATE.DT.date)+encodetime(hh,mm,ss,0);
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       IBSAVE_CLEAR;
       try
        case MemMove.fieldByname('DOC_TYP').asinteger of
          1: // расход
            begin
               IBSAVE_ADD('RN_DATE',tm);
               IF IBSAVE_DOC('RN',MemMove.fieldbyname('MOVE_ID').asinteger)<0 then r:=sqrt(-1);
            end;
          2: // Списание
            begin
               IBSAVE_ADD('SPIS_DATE',tm);
               IF IBSAVE_DOC('SPIS',MemMove.fieldbyname('MOVE_ID').asinteger)<0 then r:=sqrt(-1);
            end;
          3,-2: // пересортица
            begin
               IBSAVE_ADD('PSORT_DATE',tm);
               IF IBSAVE_DOC('PSORT',MemMove.fieldbyname('MOVE_ID').asinteger)<0 then r:=sqrt(-1);
            end;
          4,5: // перемещение
            begin
               IBSAVE_ADD('PER_DATE',tm);
               IF IBSAVE_DOC('PER',MemMove.fieldbyname('MOVE_ID').asinteger)<0 then r:=sqrt(-1);
            end;
          -1: // приход
            begin
               IBSAVE_ADD('PN$_DATE',tm);
               IF IBSAVE_DOC('PN$',MemMove.fieldbyname('MOVE_ID').asinteger)<0 then r:=sqrt(-1);
            end;
        end;
        Datamodule1.IBTransaction2.Commit;
       except
         Datamodule1.IBTransaction2.RollBack;
       end;
       Datamodule1.IBTransaction2.Active:=False;
       // нужно перезапросить журнал
       Show_Wait('Перезапрос данных. Начальный остаток...',10);
       // Перезапрашиваем остаток
       WorkTransaction.Active:=False;
       {Определяем начальный и конечный остатки}
       QueryWork.close;
       QueryWork.SQL.clear;
       if SKL1.Checked then begin
          QueryWork.SQL.add('select sum(post+rash) as ost from tmp_post_rash_date(:tw_id,:DT)');
       end else begin
          QueryWork.SQL.add('select sum(post+rash) as ost from tmp_post_rash_date(:tw_id,:DT) where SKL_ID= :SKL_ID');
          QueryWork.ParamByname('SKL_ID').asinteger:=strtoint(SKL.value);
       end;
       if Btn_BRAK.Down then QueryWork.ParamByname('TW_ID').asinteger:=IDBRAK
                        else QueryWork.ParamByname('TW_ID').asinteger:=Detal_TW.tag;
       QueryWork.ParamByname('DT').asdatetime:=MOVE_DT1;
       QueryWork.open;
       if QueryWork.eof then N_OST.value:=0 else N_OST.value:=QueryWork.fieldByname('OST').asfloat;
       QueryWork.close;
       Show_Wait('Перезапрос данных. Конечный остаток...',30);
       QueryWork.ParamByname('DT').asdatetime:=MOVE_DT2+1-Sekond1;
       QueryWork.open;
       if QueryWork.eof then K_OST.value:=0 else K_OST.value:=QueryWork.fieldByname('OST').asfloat;
       QueryWork.close;
       if Btn_BRAK.Down then  N_OST_R.value:=N_OST.value*TW_MROZ2_CENN.value
                        else N_OST_R.value:=N_OST.value*TW_MROZ_CENN.value;
       if Btn_BRAK.Down then  K_OST_R.value:=K_OST.value*TW_MROZ2_CENN.value
                        else K_OST_R.value:=K_OST.value*TW_MROZ_CENN.value;
       // Перезапрашиваем таблицу памяти
       Show_Wait('Перезапрос данных. Движение...',60);
       DataModule2.TransactionTwMove.Active:=False;
       DataModule2.Query_MOVE.Close;
       DataModule2.Query_MOVE.Open;
       MemMove.Disablecontrols;
       MemMove.EmptyTable;
       SALDO:=N_OST.value;
       Show_Wait('Перезапрос данных. Все почти готово...',90);
       while not DataModule2.Query_MOVE.eof do begin
              MemMove.Append;
              MemMove.fieldByname('MOVE_NUM_FULL').asstring:=DataModule2.Query_MOVE.fieldByname('MOVE_NUM_FULL').asstring;
              MemMove.fieldByname('KLN_ORG').asstring:=DataModule2.Query_MOVE.fieldByname('KLN_ORG').asstring;
              MemMove.fieldByname('SKL_SHORT').asstring:=DataModule2.Query_MOVE.fieldByname('SKL_SHORT').asstring;
              MemMove.fieldByname('MOVE_ID').asinteger:=DataModule2.Query_MOVE.fieldByname('MOVE_ID').asinteger;
              MemMove.fieldByname('MOVE_DATE').asdatetime:=DataModule2.Query_MOVE.fieldByname('MOVE_DATE').asdatetime;
              MemMove.fieldByname('POST_KOL').asfloat:=DataModule2.Query_MOVE.fieldByname('POST_KOL').asfloat;
              MemMove.fieldByname('REAL_KOL').asfloat:=DataModule2.Query_MOVE.fieldByname('REAL_KOL').asfloat;
              MemMove.fieldByname('TW_MONEY').asfloat:=DataModule2.Query_MOVE.fieldByname('TW_MONEY').asfloat;
              MemMove.fieldByname('TW_MONEYD').asfloat:=DataModule2.Query_MOVE.fieldByname('TW_MONEYD').asfloat;
              MemMove.fieldByname('TW_SUMM').asfloat:=DataModule2.Query_MOVE.fieldByname('TW_SUMM').asfloat;
              MemMove.fieldByname('TW_SUMMD').asfloat:=DataModule2.Query_MOVE.fieldByname('TW_SUMMD').asfloat;
              MemMove.fieldByname('MOVE_KURS').asfloat:=DataModule2.Query_MOVE.fieldByname('MOVE_KURS').asfloat;
              MemMove.fieldByname('MOVE_color').asinteger:=DataModule2.Query_MOVE.fieldByname('MOVE_COLOR').asinteger;
              MemMove.fieldByname('DOC_TYP').asinteger:=DataModule2.Query_MOVE.fieldByname('DOC_TYP').asinteger;
              MemMove.fieldByname('MOVEVID_NAM').asstring:=DataModule2.Query_MOVE.fieldByname('MOVEVID_NAM').asstring;
              MemMove.fieldByname('MOVE_OSN').asstring:=DataModule2.Query_MOVE.fieldByname('MOVE_OSN').asstring;
              MemMove.fieldByname('US_FULL').asstring:=DataModule2.Query_MOVE.fieldByname('US_FULL').asstring;
              if ((SKL1.checked) and (DataModule2.Query_MOVE.fieldByname('DOC_TYP').asinteger<4))
              or SKL2.checked then SALDO:=SALDO+DataModule2.Query_MOVE.fieldByname('POST_KOL').asfloat-DataModule2.Query_MOVE.fieldByname('REAL_KOL').asfloat;
              MemMove.fieldByname('SALDO').asfloat:=SALDO;
              MemMove.Post;
              DataModule2.Query_MOVE.next;
       end;
       MemMove.First;
       MemMove.EnableControls;
       MoveGRID.setfocus;
       tm:=striptime(tm);
       wait_form.hide;
       if Messbox('Выполнить перезакрытие периода по текущему товару?',MessSubmit,4+48+256)=6 then begin
           if (tm_old<tm) then tm:=tm_old;
           if Btn_BRAK.Down then Refresh_re_tw(tm,IDBRAK)
                        else Refresh_re_tw(tm,Detal_TW.tag);
       end;
     end;
   end;
   wait_form.hide;
   CHANGE_DATE.destroy;


end;

procedure TDetal_TW.Refresh_re_tw(DT:tdatetime;TW_ID2:integer);
var
  Rdt1,Rdt2:tdatetime;
  c:integer;
  count, N: integer;
begin
  n:= 0;
  // сначала запрашиваем, были ли пересортицы по товару
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork,'select count(*) as cc from psort,psorts where psort.psort_id=psorts.psort_id '+
  'and psort.psort_prow=1 and ((psorts.tw_id=:tw_id) or (psorts.tw_id2=:tw_id2)) and psort.psort_date > :dt');
  QueryWork.paramByname('tw_id').asinteger:=tw_id2;
  QueryWork.paramByname('tw_id2').asinteger:=tw_id2;
  QueryWork.paramByname('dt').asdatetime:=dt;
  QueryWork.Open;
  if QueryWork.eof then c:=0 else c:=QueryWork.fieldByname('cc').asinteger;
  if c>0 then messbox('Внимание! данный товар участвовал в пересортицах. Перезакрыть день по одному товару невозможно! Вам неоходимо полностью перезакрыть день по всем товара, начиная с '+date_sokr(dt)+' !',MessSystem,48)
  else begin
   Rdt1:=DT;
   repeat
      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select * from A0_REFRESH_LIST_PREP2(:dt1,:dt2,:TW_ID2) order by dt,typ,ids');
      QueryWork.ParamByname('tw_id2').asinteger:=TW_ID2;
      QueryWork.ParamByname('dt1').asdatetime:=Rdt1;
      QueryWork.ParamByname('dt2').asdatetime:=Rdt1+1-sekond1;
      main_form.caption:='Расчет '+date_sokr(rdt1);
      Application.Title:=main_form.caption;
      QueryWork.Open;
      QueryWork.Last;
      count := Querywork.RecordCount;
      QUeryWork.First;
      while not QueryWork.eof do begin
         delay(1);
         inc(N);
         main_form.caption:='Расчет одного товара с '+date_sokr(rdt1)+' '+timetostr(QueryWork.fieldByname('DT').asdatetime)+' TYP='+QueryWork.fieldByname('typ').asstring+
         ' IDS='+QueryWork.fieldByname('ids').asstring + ' '+inttostr(N) +'/'+inttostr(count);
         Application.Title:=main_form.caption;
         DataModule3.ReTransaction.Active:=False;
         try
           ADD_SQL(DataModule3.QueryRe1,'select * from a0_analiz_rashod_TW(:typ,:ids)');
           DataModule3.QueryRe1.ParamByname('typ').asinteger:=QueryWork.fieldByname('typ').asinteger;
           DataModule3.QueryRe1.ParamByname('ids').asinteger:=QueryWork.fieldByname('ids').asinteger;
           DataModule3.QueryRe1.Open;
           DataModule3.ReTransaction.Commit;
         except
           DataModule3.ReTransaction.Rollback;
         end;
         DataModule3.ReTransaction.Active:=False;
         QueryWork.next;
      end;
      Rdt1:=Rdt1+1;
   until Rdt1>date();
   messbox('Закрытие периода по данному товару завершено!',MessSystem,48);
  end;

end;

procedure TDetal_TW.MnReClick(Sender: TObject);
var
 tm:tdatetime;
begin
   if Messbox('Выполнить перезакрытие периода по текущему товару, начиная с выбранного документа?',MessSubmit,4+48+256)=6 then begin
      tm:=striptime(MemMove.fieldByname('MOVE_DATE').asdatetime);
      if Btn_BRAK.Down then Refresh_re_tw(tm,IDBRAK)
                    else Refresh_re_tw(tm,Detal_TW.tag);
   end;

end;

procedure TDetal_TW.PRICECalcFields(DataSet: TDataSet);
var percent: double;
begin
     if price.fieldByname('tw_zak').asfloat=0 then Percent:=100
     else Percent:=(price.fieldByname('twprice_money').asfloat-price.fieldByname('tw_zak').asfloat)/(price.fieldByname('tw_zak').asfloat/100);
     price.fieldByname('nac_percent').asfloat:=Percent;

end;

procedure TDetal_TW.tw_zone_distribShow(Sender: TObject);
begin
  q_tw_zone_distrib.Close;
  q_tw_zone_distrib.ParamByName('tw_id').asInteger:= Detal_TW.tag;
  q_tw_zone_distrib.open;
end;

end.
