unit JouRn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DEFAULTJOURNAL, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,
  Db, IBCustomDataSet, IBQuery,Data1,B_DBUtils,B_Utils, IBDatabase,DocRn,
  AdminRn,VclUtils, Menus, ppDB, ppCtrls, ppBands, ppMemo, ppVar, ppStrtch,
  ppRegion, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppCache,
  ppDBPipe, StdCtrls, RxLookup, RxMemDS, Mask, ToolEdit, ActnList, FR_DSet,
  FR_DBSet, FR_Class, FR_E_TXT, FR_E_RTF, Buttons, formDostavka;

type
  TJou_RN = class(TDefault_Journal)
    IBQuery1: TIBQuery;
    QrRnList: TIBQuery;
    DsRnList: TDataSource;
    QrRnListRN_ID: TIntegerField;
    QrRnListRN_PROW: TIBStringField;
    QrRnListRN_NUM_FULL: TIBStringField;
    QrRnListRN_DATE: TDateTimeField;
    QrRnListSKL_SHORT: TIBStringField;
    QrRnListRN_SUMM: TFloatField;
    QrRnListRN_OTG: TSmallintField;
    QrRnListRN_COLOR: TIntegerField;
    QrRnListUS_FULL: TIBStringField;
    QrRnListRNVID_NAM: TIBStringField;
    QrRnListKLN_ORG: TIBStringField;
    QrRnListRN_KURS: TFloatField;
    QrRnListKLN_PREFIX: TIBStringField;
    RnListTransaction: TIBTransaction;
    QrRnListVALUTA_SHORT: TIBStringField;
    QrRnListRN_DOST: TIBStringField;
    QrRnListRN_KKM: TIBStringField;
    QrRnListRN_CARD: TIBStringField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnProw: TMenuItem;
    MnUnprow: TMenuItem;
    N3: TMenuItem;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnCopy: TMenuItem;
    MnDel: TMenuItem;
    N8: TMenuItem;
    MnPrint: TMenuItem;
    MnHistory: TMenuItem;
    MnFind: TMenuItem;
    N12: TMenuItem;
    MnAnaliz: TMenuItem;
    MnSubdoc: TMenuItem;
    N15: TMenuItem;
    MnInterval: TMenuItem;
    N17: TMenuItem;
    MnAdm: TMenuItem;
    QrRnListRN_NUM: TIntegerField;
    BtnFaktClear: TToolButton;
    BtnFaktAdd: TToolButton;
    BtnFaktInfo: TToolButton;
    QrRnListRN_OSN: TIBStringField;
    PipRnList: TppDBPipeline;
    PpRNLIST: TppReport;
    ppTitleBand12: TppTitleBand;
    ppImage23: TppImage;
    ppRegion66: TppRegion;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel12: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel14: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel13: TppLabel;
    ppRegion79: TppRegion;
    ppHeaderBand15: TppHeaderBand;
    ppShape21: TppShape;
    ppLabel446: TppLabel;
    ppLabel447: TppLabel;
    ppLabel448: TppLabel;
    ppLabel449: TppLabel;
    ppLabel450: TppLabel;
    ppLabel465: TppLabel;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppLabel453: TppLabel;
    ppSystemVariable34: TppSystemVariable;
    ppLabel454: TppLabel;
    ppSystemVariable35: TppSystemVariable;
    ppLabel455: TppLabel;
    ppSystemVariable36: TppSystemVariable;
    ppLabel456: TppLabel;
    ppLabel457: TppLabel;
    PpRnListUser: TppLabel;
    RnListTitle2: TppLabel;
    ppImage24: TppImage;
    ppLabel460: TppLabel;
    PpRnListVers: TppLabel;
    ppLabel462: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText145: TppDBText;
    ppDBText148: TppDBText;
    ppDBMemo91: TppDBMemo;
    ppDBMemo92: TppDBMemo;
    ppDBMemo93: TppDBMemo;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppImage1: TppImage;
    ppLine1: TppLine;
    ppDBMemo3: TppDBMemo;
    ppFooterBand14: TppFooterBand;
    ppSummaryBand12: TppSummaryBand;
    ppLine60: TppLine;
    ppLabel463: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppLabel464: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppImage2: TppImage;
    ppImage3: TppImage;
    ppImage4: TppImage;
    RnListTitle1: TppMemo;
    ppLabel439: TppLabel;
    ppLabel440: TppLabel;
    ppLabel443: TppLabel;
    ppLabel483: TppLabel;
    ppLabel442: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel441: TppLabel;
    ToolButton6: TToolButton;
    AutoRefresh: TCheckBox;
    Timer_refresh: TTimer;
    QrRnListWOZW_MET: TIntegerField;
    ToolButton7: TToolButton;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    MemSkl: TRxMemoryData;
    MemSklSKL_ID: TIntegerField;
    MemSklSKL_SHORT: TStringField;
    DsSKL: TDataSource;
    MemRnVid: TRxMemoryData;
    MemRnVidRNVID_ID: TIntegerField;
    MemRnVidRNVID_NAME: TStringField;
    DsRnVid: TDataSource;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    Label1: TLabel;
    ToolButton4: TToolButton;
    Label5: TLabel;
    RNVID: TRxDBLookupCombo;
    ToolButton9: TToolButton;
    Label6: TLabel;
    SHOP: TRxDBLookupCombo;
    DsShop: TDataSource;
    QrRnListDOST_DATE: TDateTimeField;
    MemShop: TRxMemoryData;
    MemShopSHOP_ID: TIntegerField;
    MemShopSHOP_NAME: TStringField;
    QrRnListNDS_SUMM: TFloatField;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBCalc2: TppDBCalc;
    ToolBar4: TToolBar;
    Label3: TLabel;
    SKL: TRxDBLookupCombo;
    ToolButton11: TToolButton;
    DOST: TCheckBox;
    DOST_DATE_CHECK: TCheckBox;
    DOST_DATE: TDateEdit;
    ToolButton13: TToolButton;
    MemRVID: TRxMemoryData;
    MemRVIDKLN: TRxMemoryData;
    MemRVIDRVID_ID: TIntegerField;
    MemRVIDRVID_NAME: TStringField;
    MemRVIDKLNKLN_ID: TIntegerField;
    MemRVIDKLNKLN_FULL: TStringField;
    DsRVID: TDataSource;
    DsRVIDKLN: TDataSource;
    QrRnListRVID_NAME: TIBStringField;
    QrRnListRVID_KLN_FULL: TIBStringField;
    MemRVIDRVID_SUBKLN: TIntegerField;
    ActionList1: TActionList;
    ActCopyToPO: TAction;
    ActCopyToStorno: TAction;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ActShowPO: TAction;
    ToolButton17: TToolButton;
    QrRnListRES: TIBStringField;
    QrRnListNDS: TFloatField;
    QrRnListNP: TFloatField;
    QrRnListRN_WEIGHT: TFloatField;
    ppLabel17: TppLabel;
    ppDBCalc3: TppDBCalc;
    actOpenDrawer: TAction;
    ToolButton18: TToolButton;
    QrRnListKASSIR_FIO: TIBStringField;
    QrRnListKASSA_NAME: TIBStringField;
    Label8: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    cmbKassa: TComboBox;
    ToolBar5: TToolBar;
    Label11: TLabel;
    RVID: TRxDBLookupCombo;
    Label12: TLabel;
    RVIDKLN: TRxDBLookupCombo;
    Label7: TLabel;
    cmbKassir: TComboBox;
    FRM: TRxDBLookupCombo;
    ToolButton15: TToolButton;
    ToolButton19: TToolButton;
    QrRnListKASSIR_ID: TIntegerField;
    QrRnListKASSA_ID: TIntegerField;
    QrRnListSALE_ID: TIntegerField;
    QrRnListout_rvid_id: TIntegerField;
    ppDBMemo4: TppDBMemo;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    chkShowDeleted: TCheckBox;
    mnu_RN_DOCS: TMenuItem;
    mnuSFAKT: TMenuItem;
    mnuTTN: TMenuItem;
    mnuDOV: TMenuItem;
    N6: TMenuItem;
    QrRnListRN_DOCS: TIBStringField;
    QrRnListRN_PRIM: TIBStringField;
    N1: TMenuItem;
    N2: TMenuItem;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    QrRnList2: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    DateTimeField1: TDateTimeField;
    IBStringField3: TIBStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    SmallintField1: TSmallintField;
    IntegerField2: TIntegerField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    FloatField3: TFloatField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IBStringField11: TIBStringField;
    IntegerField3: TIntegerField;
    IBStringField12: TIBStringField;
    IntegerField4: TIntegerField;
    DateTimeField2: TDateTimeField;
    IBStringField13: TIBStringField;
    IBStringField14: TIBStringField;
    IBStringField15: TIBStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    frRTFExport1: TfrRTFExport;
    chkShowPayments: TCheckBox;
    ToolButton20: TToolButton;
    QrRnListRN_SEB: TFloatField;
    ToolBar6: TToolBar;
    KLN_NAME: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    OFORM_NAME: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    QrRnListDOST_NUMBER: TIntegerField;
    QrRnListdost_number_and_date: TStringField;
    btnDostavka: TButton;
//    btnOpenSale: TToolButton;

    Procedure refresh_list;
    Procedure Refresh_Btn;
    procedure FormShow(Sender: TObject);
    procedure QrRnListAfterScroll(DataSet: TDataSet);
    procedure QrRnListAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnProwClick(Sender: TObject);
    procedure BtnUnProwClick(Sender: TObject);
    procedure BtnIntervalClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnSubDocClick(Sender: TObject);
    procedure BtnPropertisClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure BtnAdmClick(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure BtnAnalizClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnFaktClearClick(Sender: TObject);
    procedure BtnFaktAddClick(Sender: TObject);
    procedure BtnFaktInfoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppTitleBand12BeforeGenerate(Sender: TObject);
    procedure PpRNLISTPreviewFormCreate(Sender: TObject);
    procedure ppDetailBand15BeforeGenerate(Sender: TObject);
    procedure AutoRefreshClick(Sender: TObject);
    procedure Timer_refreshTimer(Sender: TObject);
    procedure FRMChange(Sender: TObject);
    procedure RNVIDChange(Sender: TObject);
    procedure SHOPChange(Sender: TObject);
    procedure SKLChange(Sender: TObject);
    procedure DOSTClick(Sender: TObject);
    procedure DOST_DATE_CHECKClick(Sender: TObject);
    procedure DOST_DATEChange(Sender: TObject);
    procedure RVIDChange(Sender: TObject);
    procedure refresh_rvidkln;
    procedure FormCreate(Sender: TObject);
    procedure ActCopyToPOExecute(Sender: TObject);
    procedure ActCopyToStornoExecute(Sender: TObject);
    procedure ActShowPOExecute(Sender: TObject);
    procedure cmbKassaChange(Sender: TObject);
    procedure cmbKassirChange(Sender: TObject);
    procedure actOpenDrawerExecute(Sender: TObject);
    procedure btnOpenSaleClick(Sender: TObject);
    procedure chkShowDeletedClick(Sender: TObject);
    procedure RxDBGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure mnuSFAKTClick(Sender: TObject);
    procedure mnuTTNClick(Sender: TObject);
    procedure mnuDOVClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnDostavkaClick(Sender: TObject);
    procedure QrRnListCalcFields(DataSet: TDataSet);

  private
    { Private declarations }
    arr_kassir: array [0..1000] of integer;
    arr_kassa: array [0..1000] of integer;
  public
    { Public declarations }
  end;

var
  CAN_NEW_WOZW,CAN_NEW,CAN_ANALIZ,CAN_ADM:boolean;
  Can_refresh:boolean;
  Jou_RN: TJou_RN;
  DT1,DT2:Tdatetime;
  EnEof:Boolean;
  G_KEY:char;
  kln_group_id, oform_group_id: integer;

implementation

uses DateInterval, SetJouDate, FindDocNum, SelectPrint,
  StfaktFast, WaitForm, DocRnWozw, SelectNew, Mainform, PrintDoc, FR_Shtrih, DOCSALE, EditText,
  DicKlient;

{$R *.DFM}

procedure TJou_RN.Refresh_RVIDKLN;
var
  OLDID:integer;
begin
  OLDID:=strtoint('0'+RVIDKLN.value);
  MemRVidKLN.disablecontrols;
  MemRVidKLN.EmptyTable;
  MemRVidKLN.Append;
  MemRVidKLN.fieldByname('KLN_ID').asinteger:=0;
  MemRVidKLN.fieldByname('KLN_FULL').asstring:='<Все>';
  MemRVidKLN.Post;
  WorkTransaction.Active:=False;
  add_SQL(QueryWork,'select cfg_set1 as kln_id,(select kln_full from kln_data(cfg.cfg_set1)) as kln_full '+
  'from cfg where cfg_name="RVID_KLN_LIST" order by 2');
  QueryWork.Open;
  while not QueryWork.eof do begin
    MemRVidKLN.Append;
    MemRVidKLN.fieldByname('KLN_ID').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
    MemRVidKLN.fieldByname('KLN_FULL').asstring:=QueryWork.fieldByname('KLN_FULL').asstring;
    MemRVidKLN.Post;
    QueryWork.next;
  end;
  MemRVidKLN.EnableControls;
  RVIDKLN.value:=inttostr(OLDID);
end;

procedure TJou_RN.FormShow(Sender: TObject);
begin
 // inherited;
  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Магазины...';
  Wait_Form.Gauge1.Progress:=2;
  Wait_Form.Show;
  delay(1);
  Can_refresh:=False;
  TIMER_REFRESH.Enabled:=False;
  WorkTransaction.Active:=False;


  arr_kassir[0] := 0;
  cmbKassir.Items.Add('Все');
  arr_kassa[0] := 0;
  cmbKassa.Items.Add('Все');

  OPEN_SQL(QueryWork,'select kln_id, kln_kkm_password from kln '+
			'where bg_length(kln.kln_kkm_password) > 0 '+
			'order by kln_kkm_password');
  while not QueryWork.eof do begin
    arr_kassir[cmbKassir.Items.Count]:=QueryWork.FieldByName('KLN_ID').asinteger;
    cmbKassir.Items.Add(QueryWork.FieldByName('KLN_KKM_PASSWORD').asstring);
    QueryWork.next;
  end;


  OPEN_SQL(QueryWork,'select CFG_ID, KKM_NAME from LIST_KKM ORDER BY SHOP_NAME');
  while not QueryWork.eof do begin
    arr_kassa[cmbKassa.Items.Count]:=QueryWork.FieldByName('CFG_ID').asinteger;
    cmbKassa.Items.Add(QueryWork.FieldByName('KKM_NAME').asstring);
    QueryWork.next;
  end;




  cmbKassir.ItemIndex:=0;
  cmbKassa.ItemIndex:=0;


  MemSHOP.EmptyTable;
  MemSHOP.Append;
  MemSHOP.fieldByname('SHOP_ID').asinteger:=0;
  MemSHOP.fieldByname('SHOP_NAME').asstring:='<Все>';
  MemSHOP.Post;
  OPEN_SQL(QueryWork,'select shop_id,shop_name from shop order by shop_name');
  while not QueryWork.eof do begin
    MemShop.Append;
    MemShop.fieldByname('SHOP_ID').asinteger:=QueryWork.fieldByname('SHOP_ID').asinteger;
    MemShop.fieldByname('SHOP_NAME').asstring:=QueryWork.fieldByname('SHOP_NAME').asstring;
    MemShop.Post;
    QueryWork.next;
  end;
  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Склады...';
  Wait_Form.Gauge1.Progress:=20;
  Wait_Form.Show;
  delay(1);
  MemSKL.EmptyTable;
  MemSkl.Append;
  MemSkl.fieldByname('SKL_ID').asinteger:=0;
  MemSkl.fieldByname('SKL_SHORT').asstring:='<Все>';
  MemSkl.Post;
  OPEN_SQL(QueryWork,'select skl_id,skl_short from SKL where SKL_SPEED > 0 order by SKL_SPEED');
  while not QueryWork.eof do begin
    MemSkl.Append;
    MemSkl.fieldByname('SKL_ID').asinteger:=QueryWork.fieldByname('SKL_ID').asinteger;
    MemSkl.fieldByname('SKL_SHORT').asstring:=QueryWork.fieldByname('SKL_short').asstring;
    MemSkl.Post;
    QueryWork.next;
  end;

  skl.DropDownCount := memskl.RecordCount+1;
  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Фирмы...';
  Wait_Form.Gauge1.Progress:=40;
  Wait_Form.Show;
  delay(1);
  MemFrm.EmptyTable;
  MemFrm.Append;
  MemFrm.fieldByname('FRM_ID').asinteger:=0;
  MemFrm.fieldByname('FRM_NAME').asstring:='<Все>';
  MemFrm.Post;
  ADD_SQL(QueryWork,'select frm_id,bg_left(frm_full,127) as frm_name from rn_dic_frm(:FRM_ID) order by 2');
  QueryWork.ParamByname('FRM_ID').asinteger:=DEFAULT_FIRMA;
  QueryWork.open;
  while not QueryWork.eof do begin
    MemFrm.Append;
    MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
    MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
    MemFrm.Post;
    QueryWork.next;
  end;
  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Виды...';
  Wait_Form.Gauge1.Progress:=60;
  Wait_Form.Show;
  delay(1);
  MemRnVid.EmptyTable;
  MemRnVid.Append;
  MemRnVid.fieldByname('RNVID_ID').asinteger:=0;
  MemRnVid.fieldByname('RNVID_NAME').asstring:='<Все>';
  MemRnVid.Post;
  DataModule1.MainDicRnVid.First;
  while not DataModule1.MainDicRnVid.eof do begin
    MemRnVid.Append;
    MemRnVid.fieldByname('RNVID_ID').asinteger:=DataModule1.MainDicRnVid.fieldByname('RNVID_ID').asinteger;
    MemRnVid.fieldByname('RNVID_NAME').asstring:=DataModule1.MainDicRnVid.fieldByname('RNVID_NAM').asstring;
    MemRnVid.Post;
    DataModule1.MainDicRnVid.next;
  end;
  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Виды реализации...';
  Wait_Form.Gauge1.Progress:=80;
  Wait_Form.Show;
  delay(1);
  MemRVid.EmptyTable;
  MemRVid.Append;
  MemRVid.fieldByname('RVID_ID').asinteger:=0;
  MemRVid.fieldByname('RVID_NAME').asstring:='<Все>';
  MemRVid.Post;
  DataModule1.MainDicRVid.First;
  while not DataModule1.MainDicRVid.eof do begin
    MemRVid.Append;
    MemRVid.fieldByname('RVID_ID').asinteger:=DataModule1.MainDicRVid.fieldByname('RVID_ID').asinteger;
    MemRVid.fieldByname('RVID_NAME').asstring:=DataModule1.MainDicRVid.fieldByname('RVID_NAME').asstring;
    MemRVid.fieldByname('RVID_SUBKLN').asinteger:=DataModule1.MainDicRVid.fieldByname('RVID_SUBKLN').asinteger;
    MemRVid.Post;
    DataModule1.MainDicRVid.next;
  end;
  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Виды реализации. Банки...';
  Wait_Form.Gauge1.Progress:=90;
  Wait_Form.Show;
  delay(1);
  RVIDKLN.value:='0';
  Refresh_RVIDKLN;
  SHOP.value:='0';
  SKL.value:='0';

  FRM.Value:=inttostr(GL_FRM_WORK_MODE);
    
  RNVID.value:='0';
  RVID.value:='0';
  AutoRefresh.Checked:=JOU_REFRESH_CAN;
  TIMER_REFRESH.Interval:=JOU_REFRESH_TIME*1000;
  CAN_NEW:=Check_Dostup('$JOU.RN.NEW');
  CAN_NEW_WOZW:=Check_Dostup('$JOU.RN.NEW_WOZW');

  mnu_RN_DOCS.Enabled:=Check_Dostup('JOU$.RN.ADMIN_DOC_RN');

  if RNTYP[Statusbar1.Tag].istemp then
  begin
	  CAN_NEW:=Check_Dostup('JOU.VIPISKA.CREATE');
      CAN_NEW_WOZW:=false;
  end;

  if RNTYP[Statusbar1.Tag].ID = 6 then
  begin
      CAN_NEW:=CAN_NEW or Check_Dostup('$JOU.RN.REZ.NEW');
      CAN_NEW_WOZW:=false;
  end;



  CAN_ANALIZ:=Check_dostup('$JOU.RN.ANALIZ');
  CAN_ADM:=CHECK_DOSTUP('$ADM');
  DOST_DATE.date:=date();
  DOST_DATE.visible:=DOST_DATE_CHECK.Checked;
  Wait_Form.StatusBar1.panels[0].text:='Инициализация. Уточнение значений по умолчанию...';
  Wait_Form.Gauge1.Progress:=95;
  Wait_Form.Show;
  delay(1);
  GET_DEFAULT;
 // Wait_Form.Hide;
  delay(1);
  {Определяем название}
  DT1:=date();
  DT2:=date();
  Jou_RN.caption:='Журнал. '+RNTYP[Statusbar1.Tag].FULL;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
  can_refresh:=true;
  BtnFaktClear.Click();
  Refresh_list;

//  if ((USERID = 2646704) or (USERID = 1423387)) then
    chkShowDeleted.Visible:=check_dostup('$JOU.DOSTUP.SHOW_DELETED');



end;

Procedure TJou_RN.refresh_Btn;
var
   EN:boolean;
begin
     BtnNew.enabled:=CAN_NEW;
     MnNew.enabled:=CAN_NEW;
     BtnFaktClear.Enabled:=StFakt_FAST.MemStFakt.RecordCount>0;
     BtnFaktAdd.Enabled:=EnEof;
     ActShowPO.enabled:=EnEof;
     BtnFaktInfo.Enabled:=StFakt_FAST.MemStFakt.RecordCount>0;
     if QrRnList.fieldbyname('RN_PROW').asstring='1' then EN:=false else EN:=true;
     BtnProw.Enabled:=EN and EnEof;
     MnProw.Enabled:=EN and EnEof;
     BtnDel.Enabled:=EN and EnEof and CHECK_DOSTUP('$JOU.RN.DELETE');
     try
     if RNTYP[Statusbar1.Tag].IsTemp then
     	BtnDel.Enabled:= EN and EnEof and CHECK_DOSTUP('JOU.VIPISKA.DELETE');
     except
     end;



     MnDel.Enabled:=BtnDel.Enabled;
     BtnUnProw.Enabled:=(not EN) and EnEof;
     MnUnProw.Enabled:=(not EN) and EnEof;
     BtnAnaliz.Enabled:=(not En) and EnEof and CAN_ANALIZ;
     MnAnaliz.Enabled:=(not En) and EnEof and CAN_ANALIZ;
     BtnAdm.Enabled:=EnEof and CAN_ADM_JOU;
     MnAdm.Enabled:=EnEof and CAN_ADM_JOU;
     ActCopyToStorno.enabled:=(QrRnList.FieldByName('WOZW_MET').asstring<>'1') and (QrRnList.FieldByName('RN_PROW').asstring='1') and CAN_NEW;
     ActCopyToPo.enabled:=(QrRnList.FieldByName('WOZW_MET').asstring<>'1') and Can_create_PO;


     btnOpenSale.Enabled := (QrRnList.FieldByName('SALE_ID').asinteger<>0);

     rxDBGrid1.Columns[9].Visible:=CAN_ANALIZ;


end;

Procedure TJou_RN.refresh_list;
var summ, nds_summ, seb_summ: double;
begin
  if can_refresh then begin
     Wait_Form.StatusBar1.panels[0].text:='Запрос видов рализации по банкам ..';
     Wait_Form.Gauge1.Progress:=2;
     Wait_Form.Show;
     delay(1);
//     Refresh_RVIDKLN;
     Wait_Form.StatusBar1.panels[0].text:='Запрос журнала..';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     RnListTransaction.Active:=False;
     QrRnList.close;
     QrRnList.ParamByname('DT1').asdatetime:=DT1;
     QrRnList.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrRnList.ParamByname('RNTYP_ID').asinteger:=Jou_RN.tag;
     QrRnList.ParamByname('SHOP_ID').asinteger:=strtoint('0'+SHOP.value);
     QrRnList.ParamByname('RNVID_ID').asinteger:=strtoint('0'+RNVID.value);
     QrRnList.ParamByname('SKL_ID').asinteger:=strtoint('0'+SKL.value);
     QrRnList.ParamByname('FRM_ID').asinteger:=strtoint('0'+FRM.value);
     QrRnList.ParamByname('RVID_ID').asinteger:=strtoint('0'+RVID.value);
     QrRnList.ParamByname('KASSIR_ID').asinteger:=arr_kassir[cmbKassir.ItemIndex];
     QrRnList.ParamByname('KASSA_ID').asinteger:=arr_kassa[cmbKassa.ItemIndex];
     if strtoint('0'+RVID.value)=0 then QrRnList.ParamByname('RVID_SUBKLN').asinteger:=0
                                   else QrRnList.ParamByname('RVID_SUBKLN').asinteger:=strtoint('0'+RVIDKLN.value);
     if DOST.checked then QrRnList.ParamByname('DOST').asinteger:=1
       else QrRnList.ParamByname('DOST').asinteger:=0;
     if DOST_DATE_CHECK.checked then QrRnList.ParamByname('CHECK_DOST_DATE').asinteger:=1
       else QrRnList.ParamByname('CHECK_DOST_DATE').asinteger:=0;
     QrRnList.ParamByname('DOST_DATE2').asdatetime:=DOST_DATE.date;

     if chkShowDeleted.checked then QrRnList.ParamByname('SHOW_DELETED').asinteger:=1
       else QrRnList.ParamByname('SHOW_DELETED').asinteger:=0;

     if chkShowPayments.checked then QrRnList.ParamByname('SHOW_PAYMENTS').asinteger:=1
       else QrRnList.ParamByname('SHOW_PAYMENTS').asinteger:=0;

     QrRnList.ParamByname('KLN_ID').asinteger:=kln_group_id;
     QrRnList.ParamByname('OFORM_ID').asinteger:=oform_group_id;





     QrRnList2.ParamByname('DT1').asdatetime:=DT1;
     QrRnList2.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     QrRnList2.ParamByname('RNTYP_ID').asinteger:=Jou_RN.tag;
     QrRnList2.ParamByname('SHOP_ID').asinteger:=strtoint('0'+SHOP.value);
     QrRnList2.ParamByname('RNVID_ID').asinteger:=strtoint('0'+RNVID.value);
     QrRnList2.ParamByname('SKL_ID').asinteger:=strtoint('0'+SKL.value);
     QrRnList2.ParamByname('FRM_ID').asinteger:=strtoint('0'+FRM.value);
     QrRnList2.ParamByname('RVID_ID').asinteger:=strtoint('0'+RVID.value);
     QrRnList2.ParamByname('KASSIR_ID').asinteger:=arr_kassir[cmbKassir.ItemIndex];
     QrRnList2.ParamByname('KASSA_ID').asinteger:=arr_kassa[cmbKassa.ItemIndex];
     if strtoint('0'+RVID.value)=0 then QrRnList2.ParamByname('RVID_SUBKLN').asinteger:=0
                                   else QrRnList2.ParamByname('RVID_SUBKLN').asinteger:=strtoint('0'+RVIDKLN.value);
     if DOST.checked then QrRnList2.ParamByname('DOST').asinteger:=1
       else QrRnList2.ParamByname('DOST').asinteger:=0;
     if DOST_DATE_CHECK.checked then QrRnList2.ParamByname('CHECK_DOST_DATE').asinteger:=1
       else QrRnList2.ParamByname('CHECK_DOST_DATE').asinteger:=0;
     QrRnList2.ParamByname('DOST_DATE2').asdatetime:=DOST_DATE.date;

     if chkShowDeleted.checked then QrRnList2.ParamByname('SHOW_DELETED').asinteger:=1
       else QrRnList2.ParamByname('SHOW_DELETED').asinteger:=0;
     if chkShowPayments.checked then QrRnList2.ParamByname('SHOW_PAYMENTS').asinteger:=1
       else QrRnList2.ParamByname('SHOW_PAYMENTS').asinteger:=0;













     QrRnList.Open;

     if CAN_ANALIZ then
     begin
       QrRnList.DisableControls;
       summ:=0;
       nds_summ:=0;
       seb_summ:=0;
       while not QrRnList.Eof do
       begin

          summ:=summ + QrRnList.FieldByName('RN_SUMM').asFloat;
          nds_summ:=nds_summ + QrRnList.FieldByName('NDS_SUMM').asFloat;
          seb_summ:=seb_summ + QrRnList.FieldByName('RN_SEB').asFloat;
          QrRnList.Next;
       end;
       StatusBar2.Panels[1].Text:='Сумма: '+floattostrf(summ, ffCurrency,10, 2 );
       StatusBar2.Panels[2].Text:='НДС: '+floattostrf(nds_summ, ffCurrency,8, 2 );
       StatusBar2.Panels[3].Text:='Себ: '+floattostrf(seb_summ, ffCurrency,8, 2 );



       QrRnList.First;
       QrRnList.EnableControls;
     end;



     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     Wait_Form.Hide;
  end;
end;

procedure TJou_RN.QrRnListAfterScroll(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Вид: '+QrRnList.fieldbyname('RNVID_NAM').asstring;
  Statusbar1.Panels[1].text:='Оформил: '+QrRnList.fieldbyname('US_FULL').asstring;
  Statusbar1.Panels[2].text:='Вид реализации: '+QrRnList.fieldbyname('RVID_NAME').asstring;
  Statusbar1.Panels[3].text:='По банку: '+QrRnList.fieldbyname('RVID_KLN_FULL').asstring;
  Refresh_Btn;
end;

procedure TJou_RN.QrRnListAfterOpen(DataSet: TDataSet);
begin
  Statusbar1.Panels[0].text:='Вид: '+QrRnList.fieldbyname('RNVID_NAM').asstring;
  Statusbar1.Panels[1].text:='Оформил: '+QrRnList.fieldbyname('US_FULL').asstring;
  Statusbar1.Panels[2].text:='Вид реализации: '+QrRnList.fieldbyname('RVID_NAME').asstring;
  Statusbar1.Panels[3].text:='По банку: '+QrRnList.fieldbyname('RVID_KLN_FULL').asstring;
  if QrRnList.eof then begin
     EnEof:=false
  end else begin
     EnEof:=true;
  end;
  ActShowPO.enabled:=EnEof;
  BtnOpen.enabled:=EnEof;
  MnOpen.enabled:=EnEof;
  BtnCopy.enabled:=EnEof and CAN_NEW;
  MnCopy.enabled:=EnEof and CAN_NEW;
  BtnPrint.enabled:=EnEof;
  MnPrint.enabled:=EnEof;
  BtnPropertis.enabled:=EnEof;
  MnHistory.enabled:=EnEof;
  BtnSubDoc.Enabled:=EnEof;
  MnSubDoc.Enabled:=EnEof;
  Refresh_Btn;
end;

procedure TJou_RN.RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TJou_RN.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     RxDbgrid1.Canvas.Font.color:=clWindowtext;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_MET').Asinteger=1 then
        RxDbgrid1.Canvas.Font.color:=clRed else RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('WOZW_MET').Asinteger=1 then
                RxDbgrid1.Canvas.Brush.color:=clRed;
     end;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_COLOR').Asinteger>=0 then begin
        if Column.Field.FullName='RN_NUM_FULL' then begin
                RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_COLOR').Asinteger;
                RxDbgrid1.Canvas.Font.color:=clWindowtext;
        end;
     end;
     if Column.Field.FullName='RN_PROW' then begin
     {Колонка проводки}
           RxDbgrid1.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_PROW').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           22,True);
        end else          DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           -1,True);
     end else if Column.Field.FullName='RN_DOST' then begin {Колонка доставки}
           RxDbgrid1.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_DOST').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           47,True);
        end;
     end else if Column.Field.FullName='RN_KKM' then begin  {Колонка ККМ}
           RxDbgrid1.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_KKM').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           45,True);
        end;
     end else if Column.Field.FullName='RN_CARD' then begin {Колонка карточки}
           RxDbgrid1.Canvas.FillRect(Rect);
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('RN_CARD').Asstring='1'
        then begin
           DataModule1.ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - DataModule1.ImageList1.Width) div 2),
           ((Rect.Top + Rect.Bottom - DataModule1.ImageList1.Height) div 2),
           48,True);
        end;
    end else RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
end;

procedure TJou_RN.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY='-' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1-1;
     DT2:=DT2-1;
     Refresh_list;
     Key:=#0;
  end;
  if KEY='+' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1+1;
     DT2:=DT2+1;
     Refresh_list;
     Key:=#0;
  end;
  if KEY in ['c','C','С','c'] then begin
     {Дата сегодня}
     DT1:=date();
     DT2:=date();
     Refresh_list;
  end;
  if (KEY in ['i','I','ш','Ш']) and (BtnInterval.enabled) then begin
     Key:=#0;
     BtnInterval.click;
  end;
  if key  in ['0'..'9'] then begin
     G_KEY:=Key;
     Key:=#0;
     BtnFind.click;
  end;
  if key=#27 then Close;
  if key='/' then begin
     key:=#0;
     Application.createForm(TSET_JOUDATE,SET_JOUDATE);
     SET_JOUDATE.showModal;
     if SET_JOUDATE.tag>0 then begin
        DT1:=SET_JOUDATE.DateEdit1.date;
        DT2:=SET_JOUDATE.DateEdit1.date;
        Refresh_list;
     end;
     SET_JOUDATE.Destroy;
  end;
end;

procedure TJou_RN.BtnProwClick(Sender: TObject);
var
   ID:integer;
   can:boolean;
begin
  TIMER_REFRESH.Enabled:=False;
  ID:=QrRnList.fieldByname('RN_ID').asinteger;
  if QrRnList.FieldByName('WOZW_MET').Asinteger=1 then
    CAN:=PROV_WOZW(ID,' '+RNTYP[Jou_RN.StatusBar1.tag].SHORT+QrRnList.fieldbyname('RN_NUM_FULL').asstring+
    ' от '+date_sokr(QrRnList.fieldbyname('RN_DATE').asdatetime)+' ')
  else CAN:=PROV_RN(ID,' '+RNTYP[Jou_RN.StatusBar1.tag].SHORT+QrRnList.fieldbyname('RN_NUM_FULL').asstring+
    ' от '+date_sokr(QrRnList.fieldbyname('RN_DATE').asdatetime)+' ');
  if CAN then begin
       QrRnList.DisableControls;
       QrRnList.close;
       RnListTransaction.Active:=False;
       QrRnList.Open;
       QrRnList.Locate('RN_ID',ID,[]);
       QrRnList.EnableControls;
  end;
  RxDbgrid1.setfocus;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnUnProwClick(Sender: TObject);
var
   ID:integer;
   CAN:boolean;
begin
  TIMER_REFRESH.Enabled:=False;
  ID:=QrRnList.fieldByname('RN_ID').asinteger;
  if QrRnList.FieldByName('WOZW_MET').Asinteger=1 then
  CAN:=UNPROV_WOZW(ID,' '+RNTYP[Jou_RN.StatusBar1.tag].SHORT+QrRnList.fieldbyname('RN_NUM_FULL').asstring+
    ' от '+date_sokr(QrRnList.fieldbyname('RN_DATE').asdatetime)+' ')
  ELSE CAN:=UNPROV_RN(ID,' '+RNTYP[Jou_RN.StatusBar1.tag].SHORT+QrRnList.fieldbyname('RN_NUM_FULL').asstring+
    ' от '+date_sokr(QrRnList.fieldbyname('RN_DATE').asdatetime)+' ');
  if CAN then begin
       QrRnList.DisableControls;
       QrRnList.close;
       RnListTransaction.Active:=False;
       QrRnList.Open;
       QrRnList.Locate('RN_ID',ID,[]);
       QrRnList.EnableControls;
  end;
  RxDbgrid1.setfocus;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnIntervalClick(Sender: TObject);
begin
  TIMER_REFRESH.Enabled:=False;
  Application.createForm(TDate_interval,Date_Interval);
  Date_interval.Dt1.date:=DT1;
  Date_interval.Dt2.date:=DT2;
  Date_interval.Showmodal;
  if Date_interval.tag=2 then begin
    DT1:=Date_interval.Dt1.date;
    DT2:=Date_interval.Dt2.date;
    Refresh_list;
  end;
  Date_interval.destroy;
  RxDbgrid1.setfocus;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
  TIMER_REFRESH.Enabled:=False;
  if QrRnList.FieldByName('WOZW_MET').Asinteger=1 then begin
    if IS_EDIT_WOZW then Messbox('Вы уже просматриваете или редактируете Акт возврата!',MessSYstem,48) else begin
      Application.CreateForm(TDoc_RN_WOZW,Doc_RN_WOZW);
      ID:=QrRnList.fieldbyname('RN_ID').asinteger;
      Doc_RN_WOZW.tag:=ID;
      Doc_RN_WOZW.Panel1.tag:=Jou_RN.tag;
      Doc_RN_WOZW.Toolbar1.tag:=Jou_RN.StatusBar1.tag;
      Doc_RN_WOZW.showModal;
      Doc_RN_WOZW.destroy;
      QrRnList.Close;
      RnListTransaction.Active:=False;
      QrRnList.Open;
      QrRnList.locate('RN_ID',ID,[]);
    end;
  end else begin
    if IS_EDIT_RN then Messbox('Вы уже просматриваете или редактируете расходную накладную!',MessSYstem,48) else begin
      Application.CreateForm(TDoc_RN,Doc_RN);
      ID:=QrRnList.fieldbyname('RN_ID').asinteger;
      Doc_RN.tag:=ID;
      Doc_RN.ToolBar1.Tag:=Jou_RN.tag;
      Doc_RN.StatusBar1.Tag:=Jou_RN.StatusBar1.tag;
      Doc_RN.showModal;
      Refresh_RVIDKLN;
      Doc_RN.destroy;
      QrRnList.Close;
      RnListTransaction.Active:=False;
      QrRnList.Open;
      QrRnList.locate('RN_ID',ID,[]);
    end;
  end;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.Enabled then BtnOpen.click;
end;

procedure TJou_RN.BtnNewClick(Sender: TObject);
begin
  TIMER_REFRESH.Enabled:=False;
  Application.createForm(TSelect_NEW,Select_NEW);
  Select_NEW.Position:=PoDesigned;
  Select_NEW.top:=Jou_RN.top+BtnNew.top+4+BtnNew.Height;
  Select_NEW.left:=Jou_RN.left+BtnNew.left+4+BtnNew.Width;
  Select_NEW.Button1.caption:='Новая Расходная накладная';
  Select_NEW.Button2.caption:='Новый Акт возврата товара от покупателя';
  Select_NEW.showModal;
  if Select_NEW.tag>0 then begin
     if (Select_NEW.tag=1) and CAN_NEW then begin
       if IS_EDIT_RN then Messbox('Вы уже просматриваете или редактируете расходную накладную!',MessSYstem,48) else begin
         Application.CreateForm(TDoc_RN,Doc_RN);
         Doc_RN.tag:=-1;
         Doc_RN.ToolBar1.Tag:=Jou_RN.tag;
         Doc_RN.StatusBar1.Tag:=Jou_RN.StatusBar1.tag;
         Doc_RN.showModal;
         if Doc_RN.tag>0 then begin
           DT1:=Doc_RN.RN_DATE.date;
           DT2:=Doc_RN.RN_DATE.date;
           refresh_list;
           Refresh_RVIDKLN;
           QrRnList.locate('RN_ID',Doc_RN.tag,[]);
         end;
         Doc_RN.destroy;
         RxDbgrid1.setfocus;
       end;
     end;
     if (Select_NEW.tag=2) and (CAN_NEW_WOZW) then begin
       if IS_EDIT_WOZW then Messbox('Вы уже просматриваете или редактируете Акт возврата!',MessSYstem,48) else begin
         Application.CreateForm(TDoc_RN_WOZW,Doc_RN_WOZW);
         Doc_RN_WOZW.tag:=-1;
         Doc_RN_WOZW.Panel1.tag:=Jou_RN.tag;
         Doc_RN_WOZW.Toolbar1.tag:=Jou_RN.StatusBar1.tag;
         Doc_RN_WOZW.showModal;
         if Doc_RN_WOZW.tag>0 then begin
           DT1:=Doc_RN_WOZW.RN_DATE.date;
           DT2:=Doc_RN_WOZW.RN_DATE.date;
           refresh_list;
           QrRnList.locate('RN_ID',Doc_RN_WOZW.tag,[]);
         end;
         Doc_RN_WOZW.destroy;
         RxDbgrid1.setfocus;
       end;
     end;
  end;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnDelClick(Sender: TObject);
var
   ID:integer;
begin
  TIMER_REFRESH.Enabled:=False;
  {Проверяем, можно ли удалить}
  ID:=QrRnList.fieldByname('RN_ID').asinteger;
  if Messbox('Удалить расходную накладную '+QrRnList.fieldByname('RN_NUM_FULL').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     ADD_SQL(DataModule1.IbSaveSQL,'execute procedure DEL_RN(:RN_ID,:US_ID, 0)');
     DataModule1.IbSaveSQL.Parambyname('RN_ID').asinteger:=ID;
     DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
     try
        DataModule1.IbSaveSQL.ExecSQL;
        Datamodule1.IBTransaction2.Commit;
     Except
     on e: Exception do
       begin
         messbox(e.message, messError, 0);
         Datamodule1.IBTransaction2.RollBAck;
       end;
     End;

     Datamodule1.IBTransaction2.Active:=False;
     Refresh_List;
     QrRnList.locate('RN_ID',ID,[]);
  end;
  RxDbGrid1.Setfocus;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnPrintClick(Sender: TObject);
var
  s:ansistring;
begin
  TIMER_REFRESH.Enabled:=False;
  {Печатаем}
  Application.createForm(TSelect_Print,Select_Print);
  Select_Print.Position:=PoDesigned;
  Select_Print.top:=Jou_RN.top+BtnPrint.top+4+BtnPrint.Height;
  Select_Print.left:=Jou_RN.left+BtnPrint.left+4+BtnPrint.Width;
  
  if RNTYP[Statusbar1.Tag].istemp then
  begin
    Select_Print.Button1.caption:='1. Напечатать выписку';
  end
  else
  begin
  Select_Print.Button1.caption:='1. Напечатать Расходную накладную';
  Select_Print.Button2.caption:='2. Напечатать Товарный чек на основе расходной накладной';
  Select_Print.Button3.caption:='3. Напечатать Счёт-фактуру на основе выбранной накладной';
  Select_Print.Button4.caption:='4. Напечатать журнал в текущем отображении';
  Select_Print.Button5.caption:='5. Напечатать накладную внутреннего перемещения';
  Select_Print.Button6.caption:='6. Напечатать оборот накладной с доставкой';
  Select_Print.Button7.caption:='7. Напечатать накладную ТОРГ-12';
  Select_Print.Button9.caption:='9. Напечатать товарно-транспортную накладную';
  if Check_Dostup('$JOU.RN.PRINT_OLD_RND') and (QrRnList.fieldbyname('RN_DOST').asstring='1') then
  	Select_Print.Button8.caption:='8. Напечатать расходную накладную для клиента';
  end;

  Select_Print.Button10.caption:='10. Напечатать журнал с комментариями';
  Select_Print.Button11.caption:='11. Напечатать спецификацию';
  Select_Print.Button12.caption:='12. Напечатать форму MX-3';
  Select_Print.Button13.caption:='13. Напечатать Счёт-фактуру 2011';
  Select_Print.showModal;

  if Select_Print.tag>0 then begin
     if (Select_Print.tag=6) then   Print_DOC.LoadXltAndPrint('rnd_rear.xlt');
     if (Select_Print.tag=1) then PRINT_RN(QrRnList.fieldbyname('RN_ID').asinteger);
     if (Select_Print.tag=11) then PRINT_RN(QrRnList.fieldbyname('RN_ID').asinteger, true, true);
     if (Select_Print.tag=12) then PRINT_MH1_MH3(2,QrRnList.fieldbyname('RN_ID').asinteger,2);
     if (Select_Print.tag=9) then PRINT_RN_TTN(QrRnList.fieldbyname('RN_ID').asinteger);

     if (Select_Print.tag=10) then
     begin
      QrRnList2.Open;
      FrReport1.ShowReport;
      QrRnList2.Close;
     end;


{     begin
       if (QrRnList.fieldbyname('RN_DOST').asinteger=1) then
         PRINT_RN(QrRnList.fieldbyname('RN_ID').asinteger)
       else
       begin
        if RNTYP[Statusbar1.Tag].istemp then
         PRINT_RN(QrRnList.fieldbyname('RN_ID').asinteger)
        else
        begin
         if(QrRnList.fieldbyname('RN_summ').asinteger>0) then
          PRINT_RN_T12(QrRnList.fieldbyname('RN_ID').asinteger,1)
         else
          PRINT_RN_T12(QrRnList.fieldbyname('RN_ID').asinteger,2);
        end;
       end;
     end;
}
     if (Select_Print.tag=7) then
     begin
         if(QrRnList.fieldbyname('RN_summ').asFloat>0) then
          PRINT_RN_T12(QrRnList.fieldbyname('RN_ID').asinteger,1)
         else
          PRINT_RN_T12(QrRnList.fieldbyname('RN_ID').asinteger,2);
     end;


     if (Select_Print.tag=8) then   PRINT_RN_OLD(QrRnList.fieldbyname('RN_ID').asinteger);
     if (Select_Print.tag=5) then   PRINT_RNW(QrRnList.fieldbyname('RN_ID').asinteger);

     if (Select_Print.tag=2) then   PRINT_CHECK1(QrRnList.fieldbyname('RN_ID').asinteger,Preview);
     if (Select_Print.tag=4) then begin
             PpRnList.reset;
             RnListTitle1.lines.clear;
             s:=', Фирма: '+FRM.text+', Вид: '+RNVID.text+', Магазином: '+shop.text+', Со склада: '+SKL.text;
             if DOST.checked then s:=s+', только накладные с доставкой ';
             if dost_date_check.checked then s:=s+'на '+date_sokr(dost_date.date);
             s:=s+', вид реализации: '+RVID.text+' по банку: '+RVIDKLN.text;
             RnListTitle1.lines.add(RNTYP[Jou_RN.StatusBar1.tag].FULL+' за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2)+s);
             RnListTitle2.Caption:='Журнал. '+RNTYP[Jou_RN.StatusBar1.tag].FULL+' за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2)+s;
             PpRnList.Print;
     end;
     if (Select_Print.tag=13) then begin

        if QrRNList.FieldByName('RN_SUMM').asFloat<0 then
        begin
            PRINT_RN_WOZW_ST_FAKT(QrRnList.fieldbyname('RN_ID').asinteger)
//          PRINT_STFAKTDOC_NEW(QueryWork.fieldbyname('STFAKT_ID').asinteger);
        end
        else
        begin
        {Определяем, есть ли расходная накладная в каком либо из счетов-фактур}
        WorkTransaction.Active:=False;
        QueryWork.close;
        QueryWork.SQL.clear;
        QueryWork.SQL.add('select STFAKT.STFAKT_ID FROM STFAKT,STFAKTS WHERE STFAKTS.RN_ID= :RN_ID AND STFAKT.STFAKT_ID=STFAKTS.STFAKT_ID');
        QueryWork.PAramByname('RN_ID').asinteger:=QrRnList.fieldByname('RN_ID').asinteger;
        QueryWork.Open;
        if not QueryWork.eof then PRINT_STFAKTDOC_NEW(QueryWork.fieldbyname('STFAKT_ID').asinteger)
          else begin
             QueryWork.close;
             QueryWork.SQL.clear;
             QueryWork.SQL.add('select STFAKT.STFAKT_ID FROM STFAKT,STFAKTS WHERE STFAKTS.RN_ID= :RN_ID AND STFAKT.STFAKT_ID=STFAKTS.STFAKT_ID');
             QueryWork.PAramByname('RN_ID').asinteger:=QrRnList.fieldByname('RN_ID').asinteger;
             QueryWork.Open;
             Messbox('Счёт-фактура на выбранную накладную не оформлен!',MessSystem,48);
          end;
        QueryWork.close;
        WorkTransaction.Active:=False;
        end;
     end;

     if (Select_Print.tag=3) then begin

        if QrRNList.FieldByName('RN_SUMM').asFloat<0 then
        begin
            PRINT_STFAKTDOC_2012(QrRnList.fieldByname('RN_ID').asinteger, 1)
            //PRINT_RN_WOZW_ST_FAKT(QrRnList.fieldbyname('RN_ID').asinteger)
//          PRINT_STFAKTDOC_NEW(QueryWork.fieldbyname('STFAKT_ID').asinteger);
        end
        else
        begin
        {Определяем, есть ли расходная накладная в каком либо из счетов-фактур}
        WorkTransaction.Active:=False;
        QueryWork.close;
        QueryWork.SQL.clear;
        QueryWork.SQL.add('select STFAKT.STFAKT_ID FROM STFAKT,STFAKTS WHERE STFAKTS.RN_ID= :RN_ID AND STFAKT.STFAKT_ID=STFAKTS.STFAKT_ID');
        QueryWork.PAramByname('RN_ID').asinteger:=QrRnList.fieldByname('RN_ID').asinteger;
        QueryWork.Open;
        if not QueryWork.eof then PRINT_STFAKTDOC_2012(QueryWork.fieldbyname('STFAKT_ID').asinteger, 0)
          else begin
             QueryWork.close;
             QueryWork.SQL.clear;
             QueryWork.SQL.add('select STFAKT.STFAKT_ID FROM STFAKT,STFAKTS WHERE STFAKTS.RN_ID= :RN_ID AND STFAKT.STFAKT_ID=STFAKTS.STFAKT_ID');
             QueryWork.PAramByname('RN_ID').asinteger:=QrRnList.fieldByname('RN_ID').asinteger;
             QueryWork.Open;
             Messbox('Счёт-фактура на выбранную накладную не оформлен!',MessSystem,48);
          end;
        QueryWork.close;
        WorkTransaction.Active:=False;
        end;
     end;


  end;
  Select_Print.Destroy;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnSubDocClick(Sender: TObject);
var
   ID:integer;
begin
  TIMER_REFRESH.Enabled:=False;
  ID:=QrRnList.fieldbyname('RN_ID').asinteger;
  SUBDOC(3,ID);
  Refresh_List;
  QrRnList.Locate('RN_ID',ID,[]);
  RxDbgrid1.setfocus;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnPropertisClick(Sender: TObject);
begin
  TIMER_REFRESH.Enabled:=False;
  SHOW_HISTORY_DOC(RNTYP[Statusbar1.Tag].FULL+'№ '+QrRnList.fieldbyname('RN_NUM_FULL').asstring,'RN',QrRnList.fieldbyname('RN_ID').asinteger);
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnFindClick(Sender: TObject);
begin
  TIMER_REFRESH.Enabled:=False;
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=3; {Метка, что искать в расходных}
  FIND_DOCNUM.Edit1.tag:=Jou_RN.tag; {Тип расходной накладной}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     FIND_DOCNUM.FindNumTransaction.Active:=False;
     ADD_SQL(FIND_DOCNUM.IbQuery1,'SELECT bg_STRIPTIME(RN_DATE) AS RN_DATE FROM RN WHERE RN_ID=:RN_ID');
     FIND_DOCNUM.IbQuery1.ParamByname('RN_ID').asinteger:=FIND_DOCNUM.tag;
     FIND_DOCNUM.IbQuery1.Open;
     DT1:=FIND_DOCNUM.IbQuery1.fieldByname('RN_DATE').asdatetIme;;
     FIND_DOCNUM.IbQuery1.close;
     DT2:=DT1;
     Refresh_list;
     QrRnList.locate('RN_ID',FIND_DOCNUM.tag,[]);
  end;
  FIND_DOCNUM.destroy;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnAdmClick(Sender: TObject);
var
   a,ID:integer;
   r:double;
begin
  TIMER_REFRESH.Enabled:=False;
  Application.createForm(TADMIN_RN,ADMIN_RN);
  {Наполняем типы накладных}
  ADMIN_RN.TYP.items.Clear;
  for a:=1 to CNTRNTYP do ADMIN_RN.TYP.items.add(RNTYP[a].SHORT);
  ADMIN_RN.TYP.itemIndex:=Jou_RN.StatusBar1.tag-1;
  ADMIN_RN.NUM.value:=QrRnList.fieldbyname('RN_NUM').asinteger;
  ADMIN_RN.RVID.Value:=QrRnList.fieldbyname('out_RVID_ID').asstring;
  ADMIN_RN.RN_DOST.Checked:=(QrRnList.fieldbyname('RN_DOST').AsInteger=1);
  ADMIN_RN.DOST_DATE.date:=QrRnList.fieldbyname('DOST_DATE').asDateTime;
  ADMIN_RN.showModal;
  if ADMIN_RN.tag>0 then begin
   {Изменяем данные накладной}
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
     IBSAVE_CLEAR;
     IBSAVE_ADD('DOC','RN');
     IBSAVE_ADD('US_ID',USERID);
     IBSAVE_ADD('SHOP_ID',SHOPID);
     IBSAVE_ADD('MESS','Администрирование документа!');
     IBSAVE_ADD('DOP1',2);
     IBSAVE_ADD('DOP2',QrRnList.fieldbyname('RN_ID').asinteger);
     if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
     if ADMIN_RN.checkBox1.checked then begin
        ADD_SQL(DataModule1.IbSaveSQL,'select * from fix_twmon_to_rns(:rn_id)');
        DataModule1.IbSaveSQL.parambyname('RN_ID').asinteger:=QrRnList.fieldbyname('RN_ID').asinteger;
        DataModule1.IbSaveSQL.Open;
        IBSAVE_CLEAR;
        IBSAVE_ADD('DOC','RN');
        IBSAVE_ADD('US_ID',USERID);
        IBSAVE_ADD('SHOP_ID',SHOPID);
        IBSAVE_ADD('MESS','Накладная проведена административно!');
        IBSAVE_ADD('DOP1',2);
        IBSAVE_ADD('DOP2',QrRnList.fieldbyname('RN_ID').asinteger);
        if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
     end;
     IBSAVE_CLEAR;
     IBSAVE_ADD('RN_NUM',int(ADMIN_RN.NUM.value));
     IBSAVE_ADD('RNTYP_ID',RNTYP[ADMIN_RN.TYP.itemIndex+1].ID);
     IBSAVE_ADD('RVID_ID',strtoint(ADMIN_RN.RVID.Value));
     if (ADMIN_RN.RN_DOST.checked) then
          IBSAVE_ADD('RN_DOST',1)
     else
          IBSAVE_ADD('RN_DOST',0);
     IBSAVE_ADD('DOST_DATE',ADMIN_RN.DOST_DATE.Date);
     
     if ADMIN_RN.checkBox1.checked then IBSAVE_ADD('RN_PROW','1');
     ID:=QrRnList.fieldbyname('RN_ID').asinteger;
     IF IBSAVE_DOC('RN',ID)<0 then r:=sqrt(-1);
     Datamodule1.IBTransaction2.Commit;
     Datamodule1.IBTransaction2.Active:=False;
     Refresh_List;
     QrRnList.locate('RN_ID',ID,[]);
   except
      Datamodule1.IBTransaction2.Rollback;
      Messbox('Ошибка при административной проводке!',MessSystem,48);
   end;
   Datamodule1.IBTransaction2.Active:=False;
  end;
  ADMIN_RN.destroy;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnCopyClick(Sender: TObject);
var
   NEWID:integer;
begin
  TIMER_REFRESH.Enabled:=False;
  if Messbox('Создать копию расходной накладной № '+QrRnList.fieldbyname('RN_NUM_FULL').asstring+'?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from copy_RN( :RN_ID, :US_ID, :SHOP_ID )');
           DataModule1.IbSaveSQL.ParamByname('RN_ID').asinteger:=QrRnList.fieldbyname('RN_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_RN_ID').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              Refresh_List;
              QrRnList.locate('RN_ID',NEWID,[]);
              RxDbgrid1.setfocus;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
  end;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnAnalizClick(Sender: TObject);
begin
  TIMER_REFRESH.Enabled:=False;
  SHOW_ANALIZ_RN(QrRnList.fieldbyname('RN_ID').asinteger);
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (BtnOpen.enabled) then BtnOpen.click;
end;

procedure TJou_RN.BtnFaktClearClick(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  Stfakt_FAST.GP1.checked:=true;
  Stfakt_FAST.GP1.Onclick(Sender);
  Stfakt_FAST.STFAKT_GP.tag:=0;
  Stfakt_FAST.MemStFakt.EmptyTable;
  Stfakt_FAST.STFAKT_DOW.text:='';
  Refresh_Btn;
  Stfakt_FAST.show;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnFaktAddClick(Sender: TObject);
var
   a,b,c,d:integer;
   s:ansistring;
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  //
  a:=0;
  b:=0;
  c:=0;
  s:='';
  if Stfakt_FAST.MemStFakt.RecordCount>0 then b:=Stfakt_FAST.MemStFakt.Recno;
  Stfakt_FAST.MemStFakt.Disablecontrols;
  Stfakt_FAST.MemStFakt.First;
  while not Stfakt_FAST.MemStFakt.eof do begin
     if Stfakt_FAST.MemStFakt.fieldByname('RN_ID').asinteger=QrRNLIST.fieldByname('RN_ID').asinteger then inc(c);
     Stfakt_FAST.MemStFakt.Next;
  end;
  Stfakt_FAST.MemStFakt.First;
  for a:=1 to c-1 do Stfakt_FAST.MemStFakt.Next;
  if c=0 then begin
    // Определяем, существует ли счет-фактура
    WorkTransaction.Active:=False;
    ADD_SQL(QueryWork,'select stfakt_num,stfakt_date,shop_prefix,shop_postfix '+
    'from stfakt,stfakts,shop where stfakt.stfakt_id=stfakts.stfakt_id '+
    'and stfakts.rn_id=:rn_id and shop.shop_id=stfakt.shop_id ');
    QueryWork.ParamByname('RN_ID').asinteger:=QrRNLIST.fieldByname('RN_ID').asinteger;
    QueryWork.Open;
    if not QueryWork.eof then s:='ФАКТ '+QueryWork.fieldByname('SHOP_PREFIX').asstring+
     inttostr(date_year(QueryWork.fieldByname('STFAKT_DATE').asdatetime))+b_utils.right('00000000'+QueryWork.fieldByname('STFAKT_NUM').asstring,6)+
     QueryWork.fieldByname('SHOP_POSTFIX').asstring;
    QueryWork.Close;

    // Добавляем накладную
    Stfakt_FAST.MemStFakt.Append;
    Stfakt_FAST.MemStFakt.FieldByname('RN_ID').asinteger:=QrRNLIST.fieldByname('RN_ID').asinteger;
    Stfakt_FAST.MemStFakt.FieldByname('RN_DATE').asdatetime:=QrRNLIST.fieldByname('RN_DATE').asdatetime;
    Stfakt_FAST.MemStFakt.FieldByname('SUMM').asfloat:=QrRNLIST.fieldByname('RN_SUMM').asfloat;
    Stfakt_FAST.MemStFakt.FieldByname('STFAKT').asstring:=s;
    Stfakt_FAST.MemStFakt.FieldByname('RN_FULL').asstring:=
//      QrRNLIST.fieldByname('KLN_PREFIX').asstring+' '+RNTYP[Jou_RN.tag].SHORT+
//      QrRNLIST.fieldByname('RN_NUM_FULL').asstring+' от '+date_sokr(QrRNLIST.fieldByname('RN_DATE').asdatetime)+' для '+
//      QrRNLIST.fieldByname('KLN_ORG').asstring;
      QrRNLIST.fieldByname('KLN_PREFIX').asstring+' '+RNTYP[Jou_RN.StatusBar1.tag].SHORT+
      QrRNLIST.fieldByname('RN_NUM_FULL').asstring+' от '+date_sokr(QrRNLIST.fieldByname('RN_DATE').asdatetime)+' для '+
      QrRNLIST.fieldByname('KLN_ORG').asstring;
    Stfakt_FAST.MemStFakt.Post;
  end;
  Stfakt_FAST.MemStFakt.Enablecontrols;
  Refresh_Btn;
  Stfakt_FAST.show;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.BtnFaktInfoClick(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  Refresh_Btn;
  Stfakt_FAST.show;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Stfakt_FAST.Hide;
end;

procedure TJou_RN.ppTitleBand12BeforeGenerate(Sender: TObject);
begin
  inherited;
     PpRnListUser.Caption:=USERFIO_SHORT;
     PpRnListVers.caption:=PROG_VERSION;
     try
       Ppimage23.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;

end;

procedure TJou_RN.PpRNLISTPreviewFormCreate(Sender: TObject);
begin
  inherited;
   PpRnLIST.PreviewForm.WindowState:=WsMaximized;

end;

procedure TJou_RN.ppDetailBand15BeforeGenerate(Sender: TObject);
begin
  inherited;
  if QrRnList.fieldbyname('RN_PROW').asinteger=1
  then PpImage1.Visible:=true else PpImage1.Visible:=False;
  if QrRnList.fieldbyname('RN_DOST').asinteger=1
  then PpImage2.Visible:=true else PpImage2.Visible:=False;
  if QrRnList.fieldbyname('RN_KKM').asinteger=1
  then PpImage3.Visible:=true else PpImage3.Visible:=False;
  if QrRnList.fieldbyname('RN_CARD').asinteger=1
  then PpImage4.Visible:=true else PpImage4.Visible:=False;

end;

procedure TJou_RN.AutoRefreshClick(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  JOU_REFRESH_CAN:=AutoRefresh.Checked;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.Timer_refreshTimer(Sender: TObject);
var
   ID:integer;
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  if DT2-dt1<=7 then begin
    // Обновляем журнал
    QrRnList.DisableControls;
    if QrRnList.eof then ID:=-1 else ID:=QrRnList.fieldByname('RN_ID').asinteger;
    Refresh_list;
    if ID>0 then QrRnList.Locate('RN_ID',ID,[]);
    QrRnList.EnableControls;
  end;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.FRMChange(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  Refresh_list;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.RNVIDChange(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  Refresh_list;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;

end;

procedure TJou_RN.SHOPChange(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  Refresh_list;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;

end;

procedure TJou_RN.SKLChange(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  Refresh_list;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;

end;

procedure TJou_RN.DOSTClick(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  if not Dost.checked then DOST_DATE_CHECK.checked:=False;
  DOST_DATE_CHECK.visible:=Dost.checked;
  DOST_DATE.visible:=DOST_DATE_CHECK.Checked;

//    rxDBGrid1.MultiSelect := Dost.Checked;

  Refresh_list;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;





end;

procedure TJou_RN.DOST_DATE_CHECKClick(Sender: TObject);
begin
  inherited;
  DOST_DATE.visible:=DOST_DATE_CHECK.Checked;
  TIMER_REFRESH.Enabled:=False;
  Refresh_list;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.DOST_DATEChange(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  Refresh_list;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.RVIDChange(Sender: TObject);
begin
  inherited;
  if MemRvid.fieldByname('rvid_subkln').asinteger=0 then RVIDKLN.enabled:=false
                    else RVIDKLN.enabled:=true;
  TIMER_REFRESH.Enabled:=False;
  Refresh_list;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.FormCreate(Sender: TObject);
begin
  inherited;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;

     form_Dostavka:=tform_dostavka.Create(self);
  end;

procedure TJou_RN.ActCopyToPOExecute(Sender: TObject);
begin
  inherited;
  // отнести на предоплату
  // Формируем предоплату на основании этой накладной
  RN_TO_PO(QrRnList.fieldByname('RN_ID').asinteger);
end;

procedure TJou_RN.ActCopyToStornoExecute(Sender: TObject);
var
   OLDID:integer;
   NEWID:integer;
   CODE:integer;
   OLDNUM,NEWNUM:string;
begin
  TIMER_REFRESH.Enabled:=False;
  if Messbox('Сторнировать полностью накладную № '+QrRnList.fieldbyname('RN_NUM_FULL').asstring+'?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from rn_storno_all( :RN_ID, :US_ID, :SHOP_ID )');
           DataModule1.IbSaveSQL.ParamByname('RN_ID').asinteger:=QrRnList.fieldbyname('RN_ID').asinteger;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           OLDID:=QrRnList.fieldbyname('RN_ID').asinteger;
           OLDNUM:=QrRnList.fieldbyname('RN_NUM_FULL').asstring;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_RN_ID').asinteger;
              code:=DataModule1.IbSaveSQL.fieldByname('CODE').asinteger;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              if code<0 then messbox('Накладная № '+QrRnList.fieldbyname('RN_NUM_FULL').asstring+' не может быть еще раз сторнирована! Весь товар уже сторнирован!',MessSystem,48) else begin
                DT1:=date();
                DT2:=date();
                Refresh_List;
                QrRnList.locate('RN_ID',NEWID,[]);
                NewNUM:=QrRnList.fieldbyname('RN_NUM_FULL').asstring;
              end;
              Datamodule1.IBTransaction2.Active:=False;
              RxDbgrid1.setfocus;
              if Messbox('Провести полную отгрузку-получение по исходной накладной и сторно?',MessSubmit,4+48+256)=6 then begin
                 Datamodule1.IBTransaction2.Active:=False;
                 Datamodule1.IBTransaction2.StartTransaction;
                 DataModule1.IbSaveSQL.close;
                 DataModule1.IbSaveSQL.SQL.clear;
                 DataModule1.IbSaveSQL.SQL.add('select * from OTG_POL_RN_STORNO(:rn_id,:storno_id,:us_id)');
                 DataModule1.IbSaveSQL.ParamByname('rn_id').asinteger:=OLDID;
                 DataModule1.IbSaveSQL.ParamByname('storno_id').asinteger:=NEWID;
                 DataModule1.IbSaveSQL.ParamByname('us_id').asinteger:=USERID;
                 DataModule1.IbSaveSQL.Open;
                 if not DataModule1.IbSaveSQL.eof then begin
                    if DataModule1.IbSaveSQL.fieldByname('stat').asinteger=1 then begin
                       Datamodule1.IBTransaction2.Commit;
                       Datamodule1.IBTransaction2.Active:=False;
                       Messbox('Выполнена полная отгрузка накладной '+OLDNUM+' и получение накладной '+NEWNUM+'!',MessSystem,48);
                    end else Datamodule1.IBTransaction2.Rollback;
                 end else Datamodule1.IBTransaction2.Rollback;
              end;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
  end;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.ActShowPOExecute(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  RN_SHOWPO(QrRnList.fieldbyname('RN_ID').asinteger);
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.cmbKassaChange(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  Refresh_list;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.cmbKassirChange(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  Refresh_list;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.actOpenDrawerExecute(Sender: TObject);
begin
  inherited;
    if MODEL_KKM<>4 then Exit;

    FRShtrih.OpenDrawer;
end;

procedure TJou_RN.btnOpenSaleClick(Sender: TObject);
var
   ID:integer;
begin
  if IS_EDIT_SALE then Messbox('Вы уже просматриваете или редактируете продажу!',MessSYstem,48) else begin
    Application.CreateForm(TDoc_SALE,Doc_SALE);
    ID:=QrRnList.fieldbyname('SALE_ID').asinteger;
    Doc_SALE.tag:=ID;
    Doc_SALE.showModal;
    Doc_SALE.destroy;
    QrRnList.Close;
    RNListTransaction.Active:=False;
    QrRnList.Open;
    QrRnList.locate('SALE_ID',ID,[]);
  end;
end;

procedure TJou_RN.chkShowDeletedClick(Sender: TObject);
begin
  inherited;
  TIMER_REFRESH.Enabled:=False;
  Refresh_list;
  TIMER_REFRESH.Enabled:=JOU_REFRESH_CAN;
end;

procedure TJou_RN.RxDBGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  inherited;
  mnuSFAKT.Checked:= (pos('Сч.фактура', QrRnList.FieldByName('RN_DOCS').asString)>0);
  mnuTTN.Checked:= (pos('ТТН', QrRnList.FieldByName('RN_DOCS').asString)>0);
  mnuDOV.Checked:= (pos('Доверенность', QrRnList.FieldByName('RN_DOCS').asString)>0);
end;

procedure TJou_RN.mnuSFAKTClick(Sender: TObject);
var str: string;
id: integer;
begin
  inherited;
  id:=QrRnList.FieldByName('RN_ID').asInteger;
  if not id>0 then
    exit;

  mnuSFAKT.Checked:=not  mnuSFAKT.Checked;
  str:='';

  if mnuTTN.Checked then
    str:='ТТН';

  if mnuSFAKT.Checked then
    str := str + ' Сч.фактура';

  if mnuDov.Checked then
    str:=str + ' Доверенность ';


  IBSAVE_CLEAR;
  IBSAVE_ADD('RN_DOCS', str);
  IBSAVE_DOC('RN', id);
  Datamodule1.IBTransaction2.Commit;

  refresh_list;
  QrRnList.Locate('RN_ID',  id, []);
end;

procedure TJou_RN.mnuTTNClick(Sender: TObject);
var str: string;
id: integer;
begin
  inherited;
  id:=QrRnList.FieldByName('RN_ID').asInteger;
  if not id>0 then
    exit;

  mnuTTN.Checked:=not  mnuTTN.Checked;
  str:='';

  if mnuTTN.Checked then
    str:='ТТН';

  if mnuSFAKT.Checked then
    str := str + ' Сч.фактура';

  if mnuDov.Checked then
    str:=str + ' Доверенность ';


  IBSAVE_CLEAR;
  IBSAVE_ADD('RN_DOCS', str);
  IBSAVE_DOC('RN', id);
  Datamodule1.IBTransaction2.Commit;

  refresh_list;
  QrRnList.Locate('RN_ID',  id, []);
end;

procedure TJou_RN.mnuDOVClick(Sender: TObject);
var str: string;
id: integer;
begin
  inherited;
  id:=QrRnList.FieldByName('RN_ID').asInteger;
  if not id>0 then
    exit;

  mnuDOV.Checked:=not  mnuDOV.Checked;
  str:='';

  if mnuTTN.Checked then
    str:='ТТН';

  if mnuSFAKT.Checked then
    str := str + ' Сч.фактура';

  if mnuDov.Checked then
    str:=str + ' Доверенность ';


  IBSAVE_CLEAR;
  IBSAVE_ADD('RN_DOCS', str);
  IBSAVE_DOC('RN', id);
  Datamodule1.IBTransaction2.Commit;

  refresh_list;
  QrRnList.Locate('RN_ID',  id, []);
end;

procedure TJou_RN.N6Click(Sender: TObject);
var form: TEDIT_TEXT;
  id: integer;
begin
  inherited;
  id:=QrRnList.FieldByName('RN_ID').asInteger;
  if not id>0 then
    exit;


  form := TEDIT_TEXT.Create(self);
  form.Caption:='Редактирование примечания к расходной накладной';
  form.Memo1.Text:=QrRnList.FieldByName('RN_PRIM').asString;
  if (form.ShowModal = mrOK) then
  begin
    IBSAVE_CLEAR;
    IBSAVE_ADD('RN_PRIM', form.Memo1.Text);

    IBSAVE_DOC('RN', id);
    Datamodule1.IBTransaction2.Commit;

    refresh_list;

    QrRnList.Locate('RN_ID',  id, []);


  end;

  form.Destroy;
end;

procedure TJou_RN.N1Click(Sender: TObject);
var str: string;
id: integer;
begin
  inherited;
  id:=QrRnList.FieldByName('RN_ID').asInteger;
  if not id>0 then
    exit;

  str:='ТТН Сч.фактура Доверенность';


  IBSAVE_CLEAR;
  IBSAVE_ADD('RN_DOCS', str);
  IBSAVE_DOC('RN', id);
  Datamodule1.IBTransaction2.Commit;

  refresh_list;
  QrRnList.Locate('RN_ID',  id, []);
end;



procedure TJou_RN.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
var   s: ansistring;
begin
  inherited;

s:=', Фирма: '+FRM.text+', Вид: '+RNVID.text+', Магазином: '+shop.text+', Со склада: '+SKL.text;
             if DOST.checked then s:=s+', только накладные с доставкой ';
             if dost_date_check.checked then s:=s+'на '+date_sokr(dost_date.date);
             s:=s+', вид реализации: '+RVID.text+' по банку: '+RVIDKLN.text;


    if ParName='REPORT_TITLE' then ParValue:=RNTYP[Jou_RN.StatusBar1.tag].FULL+' за период с '+date_sokr(DT1)+' по '+date_Sokr(DT2)+s;
    if ParName='USERFIO' then ParValue:=USERFIO;
end;

procedure TJou_RN.BitBtn2Click(Sender: TObject);
begin
  inherited;
   kln_group_id:=0;
   KLN_NAME.text := 'Все клиенты';
     refresh_list;
end;

procedure TJou_RN.BitBtn3Click(Sender: TObject);
begin
  inherited;
   oform_group_id:=0;
   OFORM_NAME.text := 'Все оформители';
     refresh_list;
end;

procedure TJou_RN.BitBtn1Click(Sender: TObject);
var fr: integer;
begin
//     DicKlnSet:=2; {Выбор клиента}
     DicKlnSet:=5;
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:= kln_group_id;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<> kln_group_id then
       begin

//        KLN_NAME.tag:=DIC_KLIENT.tag;
        kln_group_id:=DIC_KLIENT.tag;
//        fr:=strtoint(DIC_KLIENT.IbQrDicKLN.FieldByName('TREE').asstring);


       IbQuery1.Close;
    	 IbQuery1.SQL.clear;
       IbQuery1.SQL.add('select klntree_full as KLN_FULL from klntree where klntree.klntree_id=:KLN_ID');
//       kln_group_typ:=3;


    	 IbQuery1.Parambyname('KLN_ID').asinteger:=kln_group_id;
     	 IbQuery1.Open;

         if not IbQuery1.eof then
         KLN_NAME.text := IbQuery1.fieldbyname('KLN_FULL').asstring;

         IbQuery1.Close;
//         ibtransaction1.Active:=false;

       end;

     DIC_KLIENT.Destroy;

     refresh_list;
end;

procedure TJou_RN.BitBtn4Click(Sender: TObject);
var fr: integer;
begin
//     DicKlnSet:=2; {Выбор клиента}
     DicKlnSet:=5;
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:= oform_group_id;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<> oform_group_id then
       begin

//        KLN_NAME.tag:=DIC_KLIENT.tag;
        oform_group_id:=DIC_KLIENT.tag;
//        fr:=strtoint(DIC_KLIENT.IbQrDicKLN.FieldByName('TREE').asstring);


       IbQuery1.Close;
    	 IbQuery1.SQL.clear;
       IbQuery1.SQL.add('select klntree_full as KLN_FULL from klntree where klntree.klntree_id=:KLN_ID');
//       kln_group_typ:=3;


    	 IbQuery1.Parambyname('KLN_ID').asinteger:=oform_group_id;
     	 IbQuery1.Open;

         if not IbQuery1.eof then
         OFORM_NAME.text := IbQuery1.fieldbyname('KLN_FULL').asstring;

         IbQuery1.Close;
//         ibtransaction1.Active:=false;

       end;

     DIC_KLIENT.Destroy;

     refresh_list;
end;

procedure TJou_RN.btnDostavkaClick(Sender: TObject);
var form: Tform_Dostavka;
begin
  inherited;

  Application.NormalizeTopMosts;
SetWindowPos(form_Dostavka.Handle, HWND_TOPMOST, 0, 0, 0, 0,
             SWP_NOACTIVATE + SWP_NOMOVE + SWP_NOSIZE);
form_Dostavka.Show;


form_Dostavka.add_rn(QrRnList.fieldByName('rn_id').asInteger, QrRnList.fieldByName('rn_num_full').asString,
QrRnList.fieldByName('rn_summ').asFloat,QrRnList.fieldByName('rn_date').asDateTime);


end;

procedure TJou_RN.QrRnListCalcFields(DataSet: TDataSet);
begin
  inherited;
  QrRnList.FieldByName('dost_number_and_date').asString := QrRnList.fieldByName('dost_number').asString + ' ' + QrRnList.fieldByName('dost_date').asString
end;

end.


