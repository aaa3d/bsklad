unit Mainform;
{ ********************************************************************
  **** Copyright 1980-1999 Britvin Sergej,                        ****
  **** Beginner(C), Yaroslavl, Russia,                            ****
  **** E-mail:  Beginner@inbox.ru                                 ****
  ****------------------------------------------------------------****         Application.createForm(TEXP_1C,EXP_1C);
     EXP_1C.ShowModal;
     EXP_1C.Destroy;
end;

  ****  Главная форма программы BSKLAD                            ****
  ********************************************************************}

interface

uses
  RxCtrls,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus,B_DButils,B_Utils,
  JouSt,JouSpis,DicEMail,DicShop,JouPn,JouRn,DocST,SetMain,DocRN,
  JouPer,DocPer,DocSpis,DocEmail,KursRn,JouCard,AllPol,KursPn,
  DicDost,Data1, ExtCtrls, KKMINFO, SpeedBar,KKmAdd,KKMSUB,
  KkmStat,ActnList,DicKTG, DualList, Placemnt,Vclutils,
  Inifiles,Unit_AMC100F,Elves_unit,DocPn2,DicUsl,
  Buttons,Exp1C, ComCtrls,DEFAULTsHOP, StdCtrls, Db, IBCustomDataSet,
  IBQuery, IBDatabase,JouZP,ZpRun,ZpTabel,CardReg, Mask, ToolEdit,
  TeEngine, Series, TeeProcs, Chart, DBChart,DicRvid,DocPo,JouPO,SetKorr,DicKKM,
  ClosePeriodDir,DicNDS,  DocSale, JouSale, IBSQL, Async32, DicCardHolder, reportcardprod, diczone;
  
type
  TMAIN_FORM = class(TForm)
    MainMenu1: TMainMenu;
    MnDIC: TMenuItem;
    MnAdm: TMenuItem;
    MnAdmGlob: TMenuItem;
    MnAdmGlobValuta: TMenuItem;
    MnServis: TMenuItem;
    MnServisKursy: TMenuItem;
    MnServisKursMoney: TMenuItem;
    N2: TMenuItem;
    MnHelp: TMenuItem;
    MnHelpUsWork: TMenuItem;
    MnDocs: TMenuItem;
    MnDocsPerem: TMenuItem;
    MnDocsSpis: TMenuItem;
    MnJou: TMenuItem;
    MnJouSpis: TMenuItem;
    MnJouPerem: TMenuItem;
    MnServisKursRN: TMenuItem;
    MnMailing: TMenuItem;
    MnMailingMail: TMenuItem;
    MnDocST: TMenuItem;
    N7: TMenuItem;
    MnDocRemon: TMenuItem;
    MnJouST: TMenuItem;
    MnJouSTFAKT: TMenuItem;
    MnJouRemon: TMenuItem;
    N16: TMenuItem;
    MnReports: TMenuItem;
    MnReportOst: TMenuItem;
    MnReportsClients: TMenuItem;
    MnReportsClientsDiscont: TMenuItem;
    MnReportZakup: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N9: TMenuItem;
    MnDicSKL: TMenuItem;
    MnDicSHOP: TMenuItem;
    MnDicKLN: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N33: TMenuItem;
    MnServisCloseWork: TMenuItem;
    MnCard: TMenuItem;
    N36: TMenuItem;
    N14: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    MnJouRn: TMenuItem;
    MnDicTW: TMenuItem;
    MnDicTWKTG: TMenuItem;
    MnReportSkid: TMenuItem;
    MnReportOtg: TMenuItem;
    MnReportPol: TMenuItem;
    MnReportPolOtg: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    MnReportMarket: TMenuItem;
    MnReportMarketKonk: TMenuItem;
    MnReportMarketOld: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    MnDocRn: TMenuItem;
    MnServisKursPN: TMenuItem;
    MnDocEmail: TMenuItem;
    N56: TMenuItem;
    MnDocKKM: TMenuItem;
    N59: TMenuItem;
    MnJouKKM: TMenuItem;
    MnReportPost: TMenuItem;
    MnOtgrPol: TMenuItem;
    MnOtgr: TMenuItem;
    MnPol: TMenuItem;
    N5: TMenuItem;
    MnKKM: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnDicKLN: TSpeedItem;
    BtnDicTW: TSpeedItem;
    PopupMenu1: TPopupMenu;
    MnTOOLBOX: TMenuItem;
    SpeedbarSection2: TSpeedbarSection;
    SpeedItem3: TSpeedItem;
    FormStorage1: TFormStorage;
    SpeedbarSection3: TSpeedbarSection;
    BtnJouPl: TSpeedItem;
    BtnDocPL: TSpeedItem;
    BtnDocKKM: TSpeedItem;
    MnReportTorgPers: TMenuItem;
    SpeedbarSection4: TSpeedbarSection;
    BtnReportTorgPers: TSpeedItem;
    BtnJouKKM: TSpeedItem;
    SpeedbarSection5: TSpeedbarSection;
    BtnOtgr: TSpeedItem;
    BtnPol: TSpeedItem;
    SpeedItem11: TSpeedItem;
    SpeedItem13: TSpeedItem;
    BtnDocsSpis: TSpeedItem;
    SpeedItem15: TSpeedItem;
    SpeedItem16: TSpeedItem;
    SpeedItem17: TSpeedItem;
    SpeedItem18: TSpeedItem;
    DocRnDefault: TSpeedItem;
    N4: TMenuItem;
    BtnReportZakup: TSpeedItem;
    SpeedbarSection6: TSpeedbarSection;
    SpeedItem20: TSpeedItem;
    Timer1: TTimer;
    N6: TMenuItem;
    MnLock: TMenuItem;
    SpeedbarSection7: TSpeedbarSection;
    SpeedItem21: TSpeedItem;
    DocPNDefault: TSpeedItem;
    JouRnDefault: TSpeedItem;
    JouPnDefault: TSpeedItem;
    N10: TMenuItem;
    N11: TMenuItem;
    Mn100: TMenuItem;
    N49: TMenuItem;
    N60: TMenuItem;
    MnReportPribylWide: TMenuItem;
    Bsklad1: TMenuItem;
    N1: TMenuItem;
    MnLogin: TMenuItem;
    BtnLogin: TSpeedItem;
    N18: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N34: TMenuItem;
    N41: TMenuItem;
    N55: TMenuItem;
    N58: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    MnReportINN: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    MnReportMoney: TMenuItem;
    MnReportSert: TMenuItem;
    MnReportSertNo: TMenuItem;
    BtnPribylWide: TSpeedItem;
    MnCardSumm: TMenuItem;
    MnCardNum: TMenuItem;
    MnKlnMerge: TMenuItem;
    MnReportTwChange: TMenuItem;
    N35: TMenuItem;
    N22: TMenuItem;
    MnReportOstNul: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N39: TMenuItem;
    N45: TMenuItem;
    N50: TMenuItem;
    Timer2: TTimer;
    N51: TMenuItem;
    MnPrice: TMenuItem;
    MnLinkNotable: TMenuItem;
    MnLinkNofield: TMenuItem;
    ActionList1: TActionList;
    DicPropTwktg: TAction;
    N61: TMenuItem;
    SpeedItem1: TSpeedItem;
    StatusBar1: TStatusBar;
    N72: TMenuItem;
    N1001: TMenuItem;
    N73: TMenuItem;
    N78: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    N85: TMenuItem;
    N86: TMenuItem;
    Z2: TMenuItem;
    MnDocPn2: TMenuItem;
    MnJouPn2: TMenuItem;
    BtnDicUsl: TAction;
    N87: TMenuItem;
    Mn1CExp: TMenuItem;
    N111: TMenuItem;
    Mn1CExpRep: TMenuItem;
    MnWozwDefault: TMenuItem;
    N89: TMenuItem;
    MnPn: TMenuItem;
    MnRn: TMenuItem;
    MnWozw: TMenuItem;
    MnPnWozw: TMenuItem;
    N90: TMenuItem;
    MnPnWozwDefault: TMenuItem;
    N57: TMenuItem;
    N76: TMenuItem;
    N15: TMenuItem;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    DocPSort: TAction;
    JouPsort: TAction;
    N3: TMenuItem;
    N12: TMenuItem;
    ActReportPersPribyl: TAction;
    SpeedItem2: TSpeedItem;
    QueryWork2: TIBQuery;
    ActReportKorr: TAction;
    N17: TMenuItem;
    MnZP: TMenuItem;
    ActStat: TAction;
    N40: TMenuItem;
    ActHistoryStat: TAction;
    N44: TMenuItem;
    ActSetMinOst: TAction;
    N64: TMenuItem;
    ActZpRun: TAction;
    N21: TMenuItem;
    N65: TMenuItem;
    ActZpKomp: TAction;
    N66: TMenuItem;
    N67: TMenuItem;
    N68: TMenuItem;
    ActZpTabel: TAction;
    N69: TMenuItem;
    ActCardReg: TAction;
    N70: TMenuItem;
    ActCardZp: TAction;
    N71: TMenuItem;
    MnReportItog: TMenuItem;
    N79: TMenuItem;
    IBTransaction1: TIBTransaction;
    N80: TMenuItem;
    MnRefreshRe: TMenuItem;
    Bevel1: TBevel;
    Image1: TImage;
    N88: TMenuItem;
    ActRepStat: TAction;
    BtnStat: TSpeedItem;
    N91: TMenuItem;
    N92: TMenuItem;
    N93: TMenuItem;
    MnRepNalog: TMenuItem;
    N95: TMenuItem;
    N96: TMenuItem;
    N97: TMenuItem;
    N98: TMenuItem;
    cc1: TMenuItem;
    N94: TMenuItem;
    MnRvid: TMenuItem;
    BtnDicRvid: TAction;
    N99: TMenuItem;
    N100: TMenuItem;
    N101: TMenuItem;
    N29: TMenuItem;
    MnPo: TMenuItem;
    ActDocPO: TAction;
    ActJouPO: TAction;
    N77: TMenuItem;
    SpeedDocPO: TSpeedItem;
    SpeedJouPO: TSpeedItem;
    ActDocRemon: TAction;
    ActJouRemon: TAction;
    SpeedItem6: TSpeedItem;
    SpeedItem7: TSpeedItem;
    ActDocPoWozw: TAction;
    N8: TMenuItem;
    N13: TMenuItem;
    SpeedDocPoWozw: TSpeedItem;
    N102: TMenuItem;
    N103: TMenuItem;
    MnReportAnalitika: TMenuItem;
    N105: TMenuItem;
    N106: TMenuItem;
    ReportOneStfakt: TAction;
    N104: TMenuItem;
    MnDicKKM: TMenuItem;
    N107: TMenuItem;
    N108: TMenuItem;
    MnServisCloseDir: TMenuItem;
    N109: TMenuItem;
    MnJouZremon: TMenuItem;
    ActDocZremon: TAction;
    ActJouZremon: TAction;
    N110: TMenuItem;
    MnAdmPrice: TMenuItem;
    MnDicAdm: TMenuItem;
    MnDicNDS: TMenuItem;
    MnuKKMShtrih: TMenuItem;
    ActJouSale: TAction;
    SpeedItem4: TSpeedItem;
    SpeedItem5: TSpeedItem;
    Mn1CImp: TMenuItem;
    mnuDocSale: TMenuItem;
    DocSale: TAction;
    SpeedItem8: TSpeedItem;
    mnuJouSale: TMenuItem;
    JouSale: TSpeedItem;
    MnuCalcPNRN_OSN_Money: TMenuItem;
    SQL1: TMenuItem;
    mnuDicShopSkl: TMenuItem;
    MnuDynGroup: TMenuItem;
    BtnDicDynTWTree: TSpeedItem;
    actDicDynTWTree: TAction;
    N52: TMenuItem;
    N112: TMenuItem;
    N113: TMenuItem;
    N114: TMenuItem;
    N115: TMenuItem;
    N116: TMenuItem;
    N117: TMenuItem;
    N118: TMenuItem;
    workType: TMenuItem;
    sql_work: TIBSQL;
    read_transaction: TIBTransaction;
    N119: TMenuItem;
    mnuSetMOneyDopusk: TMenuItem;
    MnJouZtrindef: TMenuItem;
    N120: TMenuItem;
    N121: TMenuItem;
    N122: TMenuItem;
    N123: TMenuItem;
    Comm1: TComm;
    N124: TMenuItem;
    N125: TMenuItem;
    Comm2: TComm;
    Comm3: TComm;
    DISPLAY_TIMER: TTimer;
    makeComplexRN: TMenuItem;
    N126: TMenuItem;
    mnuReportNacTabel: TMenuItem;
    N127: TMenuItem;
    mnuWozwtoPost: TMenuItem;
    N129: TMenuItem;
    mnuMakeRealToKln: TMenuItem;
    N128: TMenuItem;
    mnuRemind: TMenuItem;
    REMIND_SHOW_TIMER: TTimer;
    mnuReportSkladWork: TMenuItem;
    N131: TMenuItem;
    mnu_list_informer: TMenuItem;
    N130: TMenuItem;
    N132: TMenuItem;
    N133: TMenuItem;
    mnuJouZonePer: TMenuItem;
    mnuDicZone: TMenuItem;
    mnuReportZoneOst: TMenuItem;
    mnuEditTwSkladParams: TMenuItem;
    procedure MnAdmGlobValutaClick(Sender: TObject);
    procedure MnHelpUsWorkClick(Sender: TObject);
    procedure MnServisKursMoneyClick(Sender: TObject);
    procedure MnDicKLNClick(Sender: TObject);
    procedure MnJouSTClick(Sender: TObject);
    procedure MnJouSpisClick(Sender: TObject);
    procedure MnMailingMailClick(Sender: TObject);
    procedure MnDicSKLClick(Sender: TObject);
    procedure MnDicSHOPClick(Sender: TObject);
    procedure MnReportOstClick(Sender: TObject);
    procedure MnJouRnClick(Sender: TObject);
    procedure MnDicTWClick(Sender: TObject);
    procedure MnDicTWKTGClick(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure MnDocSTClick(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure MnDocRnClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure MnDocsSpisClick(Sender: TObject);
    procedure MnDocsPeremClick(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure MnJouPeremClick(Sender: TObject);
    procedure MnJouSTFAKTClick(Sender: TObject);
    procedure MnReportsClientsDiscontClick(Sender: TObject);
    procedure MnReportZakupClick(Sender: TObject);
    procedure MnReportSkidClick(Sender: TObject);
    procedure MnReportPolClick(Sender: TObject);
    procedure MnReportMarketKonkClick(Sender: TObject);
    procedure MnReportOtgClick(Sender: TObject);
    procedure MnReportMarketOldClick(Sender: TObject);
    procedure MnServisKursRNClick(Sender: TObject);
    procedure MnServisCloseWorkClick(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure MnDocEmailClick(Sender: TObject);
    procedure MnOtgrClick(Sender: TObject);
    procedure MnPolClick(Sender: TObject);
    procedure MnReportPostClick(Sender: TObject);
    procedure MnServisKursPNClick(Sender: TObject);
    procedure N82Click(Sender: TObject);
    procedure MnTOOLBOXClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure MnReportTorgPersClick(Sender: TObject);
    procedure DocRnDefaultClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MnLockClick(Sender: TObject);
    procedure DocPNDefaultClick(Sender: TObject);
    procedure JouRnDefaultClick(Sender: TObject);
    procedure JouPnDefaultClick(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure MnReportPribylClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure MnLoginClick(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure MnReportINNClick(Sender: TObject);
    procedure MnReportMoneyClick(Sender: TObject);
    procedure MnCardSummClick(Sender: TObject);
    procedure MnCardNumClick(Sender: TObject);
    procedure MnKlnMergeClick(Sender: TObject);
    procedure MnReportTwChangeClick(Sender: TObject);
    procedure MnReportOstNulClick(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure MnPriceClick(Sender: TObject);
    procedure MnLinkNotableClick(Sender: TObject);
    procedure MnLinkNofieldClick(Sender: TObject);
    procedure DicPropTwktgExecute(Sender: TObject); {Процедура на нажатие журнала приходных}
    Procedure GetStatusKKM;
    procedure N72Click(Sender: TObject);
    procedure N83Click(Sender: TObject);
    procedure N84Click(Sender: TObject);
    procedure N85Click(Sender: TObject);
    procedure N86Click(Sender: TObject);
    procedure Z2Click(Sender: TObject);
    procedure MnDocPn2Click(Sender: TObject);
    procedure MnJouPn2Click(Sender: TObject);
    procedure BtnDicUslExecute(Sender: TObject);
    procedure Mn1CExpClick(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure Mn1CExpRepClick(Sender: TObject);
    procedure MnWozwDefaultClick(Sender: TObject);
    procedure MnPnWozwDefaultClick(Sender: TObject);
    procedure JouPsortExecute(Sender: TObject);
    procedure DocPSortExecute(Sender: TObject);
    procedure ActReportPersPribylExecute(Sender: TObject);
    procedure ActReportKorrExecute(Sender: TObject);
    procedure ActStatExecute(Sender: TObject);
    procedure ActHistoryStatExecute(Sender: TObject);
    procedure ActSetMinOstExecute(Sender: TObject);
    procedure ActZpRunExecute(Sender: TObject);
    procedure ActZpKompExecute(Sender: TObject);
    procedure ActZpTabelExecute(Sender: TObject);
    procedure ActCardRegExecute(Sender: TObject);
    procedure ActCardZpExecute(Sender: TObject);
    procedure N79Click(Sender: TObject);
    procedure MnRefreshReClick(Sender: TObject);
    procedure N80Click(Sender: TObject);
    procedure N88Click(Sender: TObject);
    procedure ActRepStatExecute(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N93Click(Sender: TObject);
    procedure N95Click(Sender: TObject);
    procedure N96Click(Sender: TObject);
    procedure N97Click(Sender: TObject);
    procedure N98Click(Sender: TObject);
    procedure BtnDicRvidExecute(Sender: TObject);
    procedure Bsklad1Click(Sender: TObject);
    procedure MnRvidClick(Sender: TObject);
    procedure N99Click(Sender: TObject);
    procedure N100Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure ActDocPOExecute(Sender: TObject);
    procedure ActJouPOExecute(Sender: TObject);
    procedure ActDocRemonExecute(Sender: TObject);
    procedure ActJouRemonExecute(Sender: TObject);
    procedure ActDocPoWozwExecute(Sender: TObject);
    procedure N102Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure N103Click(Sender: TObject);
    procedure N105Click(Sender: TObject);
    procedure ReportOneStfaktExecute(Sender: TObject);
    procedure MnDicKKMClick(Sender: TObject);
    procedure N107Click(Sender: TObject);
    procedure MnServisCloseDirClick(Sender: TObject);
    procedure ActJouZremonExecute(Sender: TObject);
    procedure ActDocZremonExecute(Sender: TObject);
    procedure MnDicNDSClick(Sender: TObject);
    procedure FRReportWithoutClick(Sender: TObject);
    procedure FRReportCleaningClick(Sender: TObject);
    procedure FRReportTaxClick(Sender: TObject);
    procedure FRStatusClick(Sender: TObject);
    procedure N119Click(Sender: TObject);
    procedure N120Click(Sender: TObject);
    procedure Mn1CImpClick(Sender: TObject);
    procedure DocSaleExecute(Sender: TObject);
    procedure ActJouSaleExecute(Sender: TObject);
    procedure MnuKKMShtrihClick(Sender: TObject);
    procedure MnuCalcPNRN_OSN_MoneyClick(Sender: TObject);
    procedure SQL1Click(Sender: TObject);
    procedure mnuDicShopSklClick(Sender: TObject);
    procedure actDicDynTWTreeExecute(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N113Click(Sender: TObject);
    procedure N114Click(Sender: TObject);
    procedure N112Click(Sender: TObject);
    procedure N116Click(Sender: TObject);
    procedure N117Click(Sender: TObject);
    procedure workTypeClick(Sender: TObject);
    procedure mnuSetMOneyDopuskClick(Sender: TObject);
    procedure MnJouZtrindefClick(Sender: TObject);
    procedure N121Click(Sender: TObject);
    procedure SpeedBar1Customize(Sender: TObject);
    procedure N122Click(Sender: TObject);
    procedure N123Click(Sender: TObject);
    procedure Comm1RxChar(Sender: TObject; Count: Integer);
    procedure N124Click(Sender: TObject);

    procedure DISPLAY_CLEAR;
    procedure DISPLAY_SHOW(s1, s2, s3, s4: string);
    procedure DISPLAY_TIMERTimer(Sender: TObject);
    procedure makeComplexRNClick(Sender: TObject);
    procedure mnuReportNacTabelClick(Sender: TObject);
    procedure N127Click(Sender: TObject);
    procedure mnuWozwtoPostClick(Sender: TObject);
    procedure N129Click(Sender: TObject);
    procedure mnuMakeRealToKlnClick(Sender: TObject);
    procedure MnJouKKMClick(Sender: TObject);
    procedure N128Click(Sender: TObject);
    procedure mnuRemindClick(Sender: TObject);
    procedure REMIND_SHOW_TIMERTimer(Sender: TObject);
    procedure mnuReportSkladWorkClick(Sender: TObject);
    procedure N130Click(Sender: TObject);
    procedure N131Click(Sender: TObject);
    procedure mnu_list_informerClick(Sender: TObject);
    procedure N132Click(Sender: TObject);
    procedure N133Click(Sender: TObject);
    procedure mnuJouZonePerClick(Sender: TObject);
    procedure mnuDicZoneClick(Sender: TObject);
    procedure mnuReportZoneOstClick(Sender: TObject);
    procedure N134Click(Sender: TObject);
    procedure mnuEditTwSkladParamsClick(Sender: TObject);
  private
    { Private declarations }
    COM_DATA: string; //Глобальная переменная. содержит только что считанные данные. очищается: при чтении данных из порта. 2. при получении данных формой
    DISPLAY_STRING21, DISPLAY_STRING22: string;
    shopname: string;
  public
    { Public declarations }
  end;


var
  MAIN_FORM: TMAIN_FORM;

implementation

uses DicValuta, UsWorkForm, DicTowar, KursMoney, DicKlient, DicSklad,
  DicTWKTG, DICRNTYP, DICPNTYP,
  DICPNVID, DICRNVID, DICSPISVID, JouRemont, EditRemont, JouSTFAKT,
  JouGARANT, AllOtgruz, ReportNeotgruz,
  ReportNePol, ReportMarketKonk, ReportMarketOld, EditGarant, ReportCard,
  ReportPOST, SetPeriod, ReportSKID, CalcPnOst,
  AboutForm, PersTorg, ReportMinOst, FormLock, JouRemon, DocRemon,
  SetDostup, PersPribyl2, ChangePassword,
  PrepareForm, DefaultShopPn, SetPocketNum, TestBase, FindDeleteDoc,
  LastDial, ReportOstNew, ReportInn, ReportMoney, CardSumm, CardSkid,
  KlnMerge, ReportTwChange, 
  ReportOstNul, DelOtgSpis, DelOtgRn, PrintPrice, LinkNotable,
  LinkNofield, SetExport1C, Exp1CReports,
  DocRnWozw, DocPnWozw, DocPsort, JouPsort,
  ReportPribylNew, ReportKorr, SetMinOst,ZpStat, ReportCardOneShop, DataQr,
  ReportNacItog, RefreshRe, ReportNacItogShop, ReportTDMItog, ReportStat,
  ReportTDMItogShop, ReportTdmDetal, ReportNalogAll, WhatsNew,
  ReportTDMItogShopDetal, DocPoWozw, AddReport, ReportPostFin, ReportStFakt,
  ListConstant, JouZREMON, DocZRemon, FR_Shtrih, FRStatus, 
   Import_1C, CalcRNPNOSNMoney,
  sqladmin, DicShopSkl, DicTwDynGroup, ReportTdmDetalNew, ReportTDMItogNew,
  ReportTDMItogShopNew, ReportTDMItogShopDetalNew, ReportTDMDetalAvg, ReportTDMItogShopAvg,
  DicKlnWorktype, EditMoneyDopusk, JouZTRINDEF, DicKlientDynGroup,
  ReportPostFinFirm, report_prodag, BarScanerEdit, BarCodeSetTW,
   ExpCas, MakeComplexRN, ReportNacTabel, ReportNacSpec, MakeTwWozwToPost,
  ReportTDMItogPostNew, MakeTwrealToKln, JouKKM, RepPn, ListRemind,
  ReportSkladWork, ReportNacSpecZp, dicZpUsers, ListDoc_Informer,
  ReportSkladWorkPalet, JouZonePer, ReportZoneOst, ReportCardInfo,
  EditTwSkladParams;

{$R *.DFM}

function ConvertAnsiToOem(const S : string) : string;
{ ConvertAnsiToOem translates a string into the OEM-defined character set }
{$IFNDEF WIN32}
var
  Source, Dest : array[0..255] of Char;
{$ENDIF}
begin
{$IFDEF WIN32}
  SetLength(Result, Length(S));
  if Length(Result) > 0 then
    AnsiToOem(PChar(S), PChar(Result));
{$ELSE}
  if Length(Result) > 0 then
  begin
    AnsiToOem(StrPCopy(Source, S), Dest);
    Result := StrPas(Dest);
  end;
{$ENDIF}
end; { ConvertAnsiToOem }

function ConvertOemToAnsi(const S : string) : string;
{ ConvertOemToAnsi translates a string from the OEM-defined
  character set into either an ANSI or a wide-character string }
{$IFNDEF WIN32}
var
  Source, Dest : array[0..255] of Char;
{$ENDIF}
begin
{$IFDEF WIN32}
  SetLength(Result, Length(S));
  if Length(Result) > 0 then
    OemToAnsi(PChar(S), PChar(Result));
{$ELSE}
  if Length(Result) > 0 then
  begin
    OemToAnsi(StrPCopy(Source, S), Dest);
    Result := StrPas(Dest);
  end;
{$ENDIF}
end; { ConvertOemToAnsi }

procedure TMAIN_FORM.DISPLAY_CLEAR;
var
  K: ARRAY [0..1] OF CHAR;
begin
k[0]:=char(12);
k[1]:=char(0);
   Comm3.Write(k, 2);
end;


procedure TMAIN_FORM.DISPLAY_TIMERTimer(Sender: TObject);
begin
//
end;


procedure TMAIN_FORM.DISPLAY_SHOW(s1, s2, s3, s4: string);
var
  K: ARRAY [0..19] OF CHAR;
  S: STRING;
  i: integer;
  price_str: string;
begin
  DISPLAY_CLEAR;


  S:=ansiuppercase(copy(s1, 1, 20));
  s:=ConvertAnsiToOem(s);
  for i:=0 to 19 do
  begin
    if i < length(s) then
      k[i]:=s[i+1]
    else
      k[i]:=' ';
  end;

  S:=copy(s2, 1, 20);
  s:=ConvertAnsiToOem(s);
  for i:=length(s)-1 downto 0 do
  begin
    k[20-length(s)+i]:=s[i+1];
  end;
  k[19-length(s) ]:=' ';


  Comm3.Write(k, 20);

//  DISPLAY_CLEAR;

  S:=ansiuppercase(copy(s3, 1, 20));
  s:=ConvertAnsiToOem(s);
  for i:=0 to 19 do
  begin
    if i < length(s) then
      k[i]:=s[i+1]
    else
      k[i]:=' ';
  end;

  S:=copy(s4, 1, 20);
  s:=ConvertAnsiToOem(s);
  for i:=length(s)-1 downto 0 do
  begin
    k[20-length(s)+i]:=s[i+1];
  end;
  k[19-length(s) ]:=' ';


  Comm3.Write(k, 20);


end;

procedure TMAIN_FORM.MnAdmGlobValutaClick(Sender: TObject);
begin
        Application.createform(TDIC_VALUTA,DIC_VALUTA);
        DIC_VALUTA.showmodal;
        DIC_VALUTA.destroy;
end;

procedure TMAIN_FORM.MnHelpUsWorkClick(Sender: TObject);
begin
     application.createform(TUSWORK_FORM,USWORK_FORM);
     USWORK_FORM.showmodal;
     USWORK_FORM.destroy;
end;

procedure TMAIN_FORM.MnServisKursMoneyClick(Sender: TObject);
begin
     Application.CreateForm(TKURS_money,Kurs_Money);
     Kurs_Money.showModal;
     Kurs_Money.destroy;
end;

procedure TMAIN_FORM.MnDicKLNClick(Sender: TObject);
begin
     Application.createform(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=1; {Работа с каталогом}
     DIC_KLIENT.tag:=-1;
     DIC_KLIENT.showModal;
     DIC_KLIENT.destroy;
end;

procedure TMAIN_FORM.MnJouSTClick(Sender: TObject);
begin
     Application.createForm(TJou_st,Jou_st);
     Jou_st.showmodal;
     Jou_st.destroy;
end;

procedure TMAIN_FORM.MnJouSpisClick(Sender: TObject);
begin
     Application.createForm(TJou_spis,Jou_spis);
     Jou_spis.showmodal;
     Jou_spis.destroy;
end;

procedure TMAIN_FORM.MnMailingMailClick(Sender: TObject);
begin
     Application.createForm(TDIC_EMAIL,DIC_EMAIL);
     DIC_EMAIL.showmodal;
     DIC_EMAIL.destroy;
end;

procedure TMAIN_FORM.MnDicSKLClick(Sender: TObject);
begin
     application.createForm(Tdic_sklad,dic_sklad);
     dic_sklad.showmodal;
     Dic_sklad.destroy;
end;

procedure TMAIN_FORM.MnDicSHOPClick(Sender: TObject);
begin
     application.createForm(Tdic_shop,dic_shop);
     dic_shop.showmodal;
     Dic_shop.destroy;
end;

procedure TMAIN_FORM.MnReportOstClick(Sender: TObject);
begin
     Application.createForm(TReport_ost_NEW,Report_ost_NEW);
     Report_Ost_NEW.showmodal;
     Report_Ost_NEW.destroy;
end;

procedure TMAIN_FORM.MnJouRnClick(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=-1;
     for a:=1 to Cntrntyp do if Sender=MySubJouRnMenu[a] then begin
         b:=RNTYP[a].ID;
         c:=a;
     end;
     if b>-1 then begin
        Application.CreateForm(TJou_RN,Jou_RN);
        Jou_RN.tag:=b;
        Jou_RN.Statusbar1.tag:=c;
        Jou_RN.showModal;
        Jou_RN.destroy;
     end;
end;

procedure TMAIN_FORM.MnDicTWClick(Sender: TObject);
begin
     DicTowarSet:=0; {Просмотр списка товаров}
     DIC_TOWAR.showmodal;
end;

procedure TMAIN_FORM.MnDicTWKTGClick(Sender: TObject);
begin
     Application.createForm(TDIC_TWKTG,DIC_TWKTG);
     DIC_TWKTG.showmodal;
     DIC_TWKTG.Destroy;
end;

procedure TMAIN_FORM.N26Click(Sender: TObject);
begin
     application.createForm(TDIC_RNTYP,DIC_RNTYP);
     DIC_RNTYP.showModal;
     DIC_RNTYP.destroy;
end;

procedure TMAIN_FORM.N27Click(Sender: TObject);
begin
     application.createForm(TDIC_PNTYP,DIC_PNTYP);
     DIC_PNTYP.showModal;
     DIC_PNTYP.destroy;
end;

procedure TMAIN_FORM.N14Click(Sender: TObject);
begin
     application.createForm(TDIC_PNVID,DIC_PNVID);
     DIC_PNVID.showModal;
     DIC_PNVID.destroy;
end;

procedure TMAIN_FORM.N37Click(Sender: TObject);
begin
     application.createForm(TDIC_RNVID,DIC_RNVID);
     DIC_RNVID.showModal;
     DIC_RNVID.destroy;
end;

procedure TMAIN_FORM.N38Click(Sender: TObject);
begin
     application.createForm(TDIC_SPISVID,DIC_SPISVID);
     DIC_SPISVID.showModal;
     DIC_SPISVID.destroy;
end;

procedure TMAIN_FORM.N21Click(Sender: TObject);
begin
     Application.createForm(TJOU_REMONT,JOU_REMONT);
     JOU_REMONT.showmodal;
     JOU_REMONT.Destroy;
end;

procedure TMAIN_FORM.N22Click(Sender: TObject);
begin
     Application.CreateForm(TEdit_remont,Edit_remont);
     Edit_Remont.showModal;
     Edit_Remont.destroy;
end;

procedure TMAIN_FORM.MnDocSTClick(Sender: TObject);
begin
        Application.CreateForm(TDoc_ST,Doc_ST);
        Doc_ST.tag:=-1;
        Doc_ST.showModal;
        Doc_ST.destroy;
end;

procedure TMAIN_FORM.N53Click(Sender: TObject);
begin
     Application.createForm(TSET_MAIN,SET_MAIN);
     SET_MAIN.showModal;
     SET_MAIN.destroy;
end;

procedure TMAIN_FORM.MnDocRnClick(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=-1;
     for a:=1 to Cntrntyp do if Sender=MySubDocsRnMenu[a] then begin
        b:=RNTYP[a].ID;
        c:=a;
     end;
     if b>-1 then begin
        if IS_EDIT_RN then Messbox('Вы уже просматриваете или редактируете расходную накладную!',MessSYstem,48) else begin
          Application.CreateForm(TDoc_RN,Doc_RN);
          Doc_RN.tag:=-1;
          Doc_RN.ToolBar1.Tag:=B;
          Doc_RN.StatusBar1.tag:=c;
          Doc_RN.showModal;
          Doc_RN.destroy;
        end;
     end;
end;

procedure TMAIN_FORM.N9Click(Sender: TObject);
begin
  Application.CreateForm(TEdit_GARANT,Edit_GARANT);
  Edit_GARANT.tag:=-1;
  Edit_GARANT.showModal;
  Edit_GARANT.destroy;
end;

procedure TMAIN_FORM.MnDocsSpisClick(Sender: TObject);
begin
    if IS_EDIT_SPIS then Messbox('Вы уже просматриваете или редактируете акт списания!',MessSYstem,48) else begin
        Application.CreateForm(TDoc_SPIS,Doc_SPIS);
        Doc_SPIS.tag:=-1;
        Doc_SPIS.showModal;
        Doc_SPIS.destroy;
    end;
end;

procedure TMAIN_FORM.MnDocsPeremClick(Sender: TObject);
begin
    if IS_EDIT_PER then Messbox('Вы уже просматриваете или редактируете накладную перемещения!',MessSYstem,48) else begin
        Application.CreateForm(TDoc_PER,Doc_PER);
        Doc_PER.tag:=-1;
        Doc_PER.showModal;
        Doc_PER.destroy;
    end;
end;

procedure TMAIN_FORM.N20Click(Sender: TObject);
begin
     Application.createForm(TJOU_GARANT,JOU_GARANT);
     JOU_GARANT.showModal;
     JOU_GARANT.destroy;
end;

procedure TMAIN_FORM.N19Click(Sender: TObject);
begin
     Application.createForm(TJOU_CARD,JOU_CARD);
     JOU_CARD.showModal;
     JOU_CARD.destroy;
end;

procedure TMAIN_FORM.MnJouPeremClick(Sender: TObject);
begin
     Application.createForm(TJOU_PER,JOU_PER);
     JOU_PER.showmodal;
     JOU_PER.Destroy;
end;

procedure TMAIN_FORM.MnJouSTFAKTClick(Sender: TObject);
begin
     Application.createForm(TJOU_STFAKT,JOU_STFAKT);
     JOU_STFAKT.showmodal;
     JOU_STFAKT.Destroy;
end;

procedure TMAIN_FORM.MnReportsClientsDiscontClick(Sender: TObject);
begin
     Application.createForm(TREPORT_CARD,REPORT_CARD);
     REPORT_CARD.showModal;
     REPORT_CARD.destroy;
end;

procedure TMAIN_FORM.MnReportZakupClick(Sender: TObject);
begin
     Application.createForm(TReport_Min_OSt,Report_Min_ost);
     Report_MIN_ost.showModal;
     Report_MIN_ost.Destroy;
end;

procedure TMAIN_FORM.MnReportSkidClick(Sender: TObject);
begin
     Application.createForm(TREPORT_SKID,REPORT_SKID);
     REPORT_SKID.showModal;
     REPORT_SKID.destroy;
end;

procedure TMAIN_FORM.MnReportPolClick(Sender: TObject);
begin
     Application.createForm(TREPORT_NEPOL,REPORT_NEPOL);
     REPORT_NEPOL.showModal;
     REPORT_NEPOL.destroy;
end;

procedure TMAIN_FORM.MnReportMarketKonkClick(Sender: TObject);
begin
     Application.createForm(TREPORT_MARKETKONK,REPORT_MARKETKONK);
     REPORT_MARKETKONK.showModal;
     REPORT_MARKETKONK.destroy;
end;

procedure TMAIN_FORM.MnReportOtgClick(Sender: TObject);
begin
     Application.createForm(TREPORT_NEOTGRUZ,REPORT_NEOTGRUZ);
     REPORT_NEOTGRUZ.showModal;
     REPORT_NEOTGRUZ.destroy;
end;

procedure TMAIN_FORM.MnReportMarketOldClick(Sender: TObject);
begin
     Application.createForm(TREPORT_MARKETOLD,REPORT_MARKETOLD);
     REPORT_MARKETOLD.showModal;
     REPORT_MARKETOLD.destroy;
end;

procedure TMAIN_FORM.MnServisKursRNClick(Sender: TObject);
begin
     Application.createForm(TKURS_RN,KURS_RN);
     KURS_RN.showModal;
     KURS_RN.Destroy;
end;

procedure TMAIN_FORM.MnServisCloseWorkClick(Sender: TObject);
begin
     Application.createForm(TSET_PERIOD,SET_PERIOD);
     SET_PERIOD.ShowModal;
     SET_PERIOD.destroy;
end;

procedure TMAIN_FORM.N28Click(Sender: TObject);
begin
     Application.createForm(TDIC_DOST,DIC_DOST);
     DIC_DOST.ShowModal;
     DIC_DOSt.destroy;
end;

procedure TMAIN_FORM.N46Click(Sender: TObject);
begin
     Application.createForm(TKKM_INFO,KKM_INFO);
     KKM_INFO.CFG_ID:=0;
     KKM_INFO.showModal;
     KKM_INFO.destroy;
end;

procedure TMAIN_FORM.N2Click(Sender: TObject);
begin
     Application.createForm(TAbout_Form,About_Form);
     About_Form.showModal;
     About_Form.destroy;
end;

procedure TMAIN_FORM.MnDocEmailClick(Sender: TObject);
begin
     Application.createForm(TDOC_EMAIL,DOC_EMAIL);
     DOC_EMAIL.tag:=-1;
     DOC_EMAIL.showModal;
     DOC_EMAIL.Destroy;
end;

procedure TMAIN_FORM.MnOtgrClick(Sender: TObject);
begin
     Application.createForm(TALL_OTGRUZ,ALL_OTGRUZ);
     ALL_OTGRUZ.showModal;
     ALL_OTGRUZ.destroy;
end;

procedure TMAIN_FORM.MnPolClick(Sender: TObject);
begin
     Application.createForm(TALL_POL,ALL_POL);
     ALL_POL.showModal;
     ALL_POL.destroy;
end;

procedure TMAIN_FORM.MnReportPostClick(Sender: TObject);
begin
     Application.createForm(TReport_POST,Report_POST);
     Report_POST.showModal;
     Report_POST.destroy;
end;

procedure TMAIN_FORM.MnServisKursPNClick(Sender: TObject);
begin
     Application.createForm(TKURS_PN,KURS_PN);
     KURS_PN.showModal;
     KURS_PN.Destroy;
end;

procedure TMAIN_FORM.N82Click(Sender: TObject);
begin
     Application.createform(TCALC_PNOST,CALC_PNOST);
     CALC_PNOST.showModal;
     CALC_PNOST.destroy;
end;

procedure TMAIN_FORM.MnTOOLBOXClick(Sender: TObject);
begin
     SpeedBar1.Customize(-1);
end;

procedure TMAIN_FORM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//    try
//    Main_Form.OnHide(Sender);
//    except
//    end;
//    Application.Terminate;
    halt;
end;

procedure TMAIN_FORM.MnReportTorgPersClick(Sender: TObject);
begin
     Application.createForm(TPERS_TORG,PERS_TORG);
     PERS_TORG.showModal;
     PERS_TORG.destroy;
end;

procedure TMAIN_FORM.N4Click(Sender: TObject);
begin
     Application.createForm(TDefault_SHOP,DEFAULT_SHOP);
     DEFAULT_SHOP.showModal;
     DEFAULT_SHOP.destroy;
end;

procedure TMAIN_FORM.Timer1Timer(Sender: TObject);
var
   s:ansistring;
   kredit: string;
begin
     Timer1.enabled:=False;

     Worktransaction.active:=false;
     QueryWork.SQL.Text:='SELECT * FROM US_GET_KREDIT(:US_ID)';
     QueryWork.ParamByName('US_ID').AsInteger:=USERID;
     QueryWork.Open;

     kredit:='. '+QueryWork.FieldByName('US_KREDIT').asString;
     QueryWork.Close;








     s:='Арм "Склад". Магазин: '+shopname+'.   '+BASE_NAME_GLOBAL+', день закрыт по '+date_sokr(Global_close_day)+' '+
    timetostr(Global_close_day)+' ,  BeginnerR Бритвин Сергей 1997-2002'+kredit;



//     MAIN_FORM.caption:='Проверка времени связи...';
     MAIN_FORM.caption:=s;
     Timer1.enabled:=True;
end;

procedure TMAIN_FORM.MnLockClick(Sender: TObject);
begin
     My_lock;
end;

procedure TMAIN_FORM.FormShow(Sender: TObject);
var
   a:integer;
   tt:tspeedItem;

   cntRemind: integer;

  LIST_REMIND: TLIST_REMIND;   
begin
    Print_dop_Elves:=False;
    WorkTransaction.Active:=False;
    OPEN_SQL(QueryWork,'select max(dt) as tm from re');
    Global_close_day:=QueryWork.fieldByname('tm').asdatetime;

    Get_Default;
    //подключение к COM порту сканера штрих кодов
    if  ((gl_COM_PORT<>'COM0') and (gl_COM_PORT<>'')) then
    try
      Comm1.DeviceName:=gl_COM_PORT;
      Comm1.Open;
    except
    end;

    if  ((gl_COM_PORT2<>'COM0') and (gl_COM_PORT2<>'')) then
    try
      Comm2.DeviceName:=gl_COM_PORT2;
      Comm2.Open;
    except
    end;


    if  ((gl_COM_PORT3<>'COM0') and (gl_COM_PORT3<>'')) then
    try
      Comm3.DeviceName:=gl_COM_PORT3;
      Comm3.Open;
    except
    end;



    QueryWork.Close;
    QueryWork.sql.text:='select SHOP.SHOP_NAME  from SHOP WHERE SHOP_ID=:SHOP_ID';
	QueryWork.pARAMbYnAME('SHOP_ID').AsInteger:=SHOPID;
    QueryWork.Open;
    if (not QueryWork.eof) then   shopname:=QueryWork.FieldByName('SHOP_NAME').asstring;
    MAIN_FORM.caption:='Арм "Склад". Магазин: '+shopname+'.   '+BASE_NAME_GLOBAL+', день закрыт по '+date_sokr(Global_close_day)+' '+
    timetostr(Global_close_day)+' ,  BeginnerR Бритвин Сергей 1997-2002';
    QueryWork.close;
    Worktransaction.active:=false;

    Timer1Timer(nil);

    Application.Title := MAIN_FORM.caption;
    Main_form.SpeedBar1.RemoveItem(DocRnDefault);
    Main_form.SpeedBar1.RemoveItem(DocPnDefault);
    Main_form.SpeedBar1.RemoveItem(JouRnDefault);
    Main_form.SpeedBar1.RemoveItem(JouPnDefault);
    for a:=1 to CntRNTYP do begin
        try
          MySubDocRnBtn[a].Destroy;
        except
        end;
        MySubDocsRnMenu[a].enabled:=Check_Dostup('$JOU.RN.NEW');
        MySubWozwRnMenu[a].enabled := Check_Dostup('$DOC.AKT_WOZW.NEW');
        MySubJouRnMenu[a].enabled := Check_Dostup('$JOU.RN.SHOW');

        if (RNTYP[a].IsTemp) then
          begin
          	MySubDocsRnMenu[a].enabled:=Check_Dostup('JOU.VIPISKA.CREATE');
            MySubJouRnMenu[a].enabled := Check_Dostup('JOU.VIPISKA.SHOW');
          end;

        MySubDocRnBtn[a]:=TSpeedItem.Create(Self);
        MySubDocRnBtn[a].Name:='RNTYP'+inttostr(RNTYP[a].ID);
        MySubDocRnBtn[a].Tag:=RNTYP[a].ID;
        MySubDocRnBtn[a].OnClick:=Main_Form.DocRnDefault.Onclick;
        MySubDocRnBtn[a].Caption:=RNTYP[a].FULL+' ('+'Alt+'+inttostr(a)+')';
        MySubDocRnBtn[a].ImageIndex:=RNTYP[a].DOC;
        MySubDocRnBtn[a].enabled:=Check_Dostup('$JOU.RN.NEW');
        Main_form.SpeedBar1.AddItem(1,MySubDocRnBtn[a]);
        try
          MySubJouRnBtn[a].Destroy;
        except
        end;
        MySubJouRnBtn[a]:=TSpeedItem.Create(Self);
        MySubJouRnBtn[a].Name:='JOURNTYP'+inttostr(RNTYP[a].ID);
        MySubJouRnBtn[a].Tag:=RNTYP[a].ID;
        MySubJouRnBtn[a].OnClick:=Main_Form.JouRnDefault.Onclick;
        MySubJouRnBtn[a].Caption:='Журнал. '+RNTYP[a].FULL+' ('+'Shift+Alt+'+inttostr(a)+')';
        MySubJouRnBtn[a].ImageIndex:=RNTYP[a].JOU;
        Main_form.SpeedBar1.AddItem(2,MySubJouRnBtn[a]);
   end;
    for a:=1 to CntPNTYP do begin
        MySubDocsPn2Menu[a].enabled:=Check_Dostup('$JOU.PN.NEW');
        MySubWozwPnMenu[a].enabled := Check_Dostup('$DOC.AKT_WOZW_POST.NEW');
        MySubJouPn2Menu[a].enabled := check_dostup('$JOU.PN.SHOW');
        try
           MySubDocPN2Btn[a].destroy;
        except
        end;
        MySubDocPN2Btn[a]:=TSpeedItem.Create(Self);
        MySubDocPN2Btn[a].Name:='PNTYP'+inttostr(PNTYP[a].ID);
        MySubDocPN2Btn[a].Tag:=PNTYP[a].ID;
        MySubDocPN2Btn[a].OnClick:=Main_Form.DocPNDefault.Onclick;
        MySubDocPN2Btn[a].Caption:=PNTYP[a].FULL+' ('+'Alt+'+inttostr(a)+')';
        MySubDocPN2Btn[a].ImageIndex:=PNTYP[a].DOC;
        MySubDocPn2Btn[a].enabled:=Check_Dostup('$JOU.PN.NEW');
        Main_form.SpeedBar1.AddItem(1,MySubDocPN2Btn[a]);
        try
           MySubJouPN2Btn[a].destroy;
        except
        end;
        MySubJouPN2Btn[a]:=TSpeedItem.Create(Self);
        MySubJouPN2Btn[a].Name:='JOUPNTYP'+inttostr(PNTYP[a].ID);
        MySubJouPN2Btn[a].Tag:=PNTYP[a].ID;
        MySubJouPN2Btn[a].OnClick:=Main_Form.JouPNDefault.Onclick;
        MySubJouPN2Btn[a].Caption:='Журнал. '+PNTYP[a].FULL+' ('+'Shift+Alt+'+inttostr(a)+')';
        MySubJouPN2Btn[a].ImageIndex:=PNTYP[a].JOU;
        Main_form.SpeedBar1.AddItem(2,MySubJouPN2Btn[a]);
   end;
   Main_Form.FormStorage1.IniFileName:=ExtractFilePath(Application.EXEName)+'Bsklad_'+inttostr(USERID)+'.cfg';
   Main_Form.FormStorage1.RestoreFormPlacement;
   try
     Image1.Picture.LoadFromFile(LOGO_NAME);
     Image1.visible:=true;
     Bevel1.visible:=true;
   Except
   End;
   Timer2.enabled:=true;




   if check_dostup('REMIND.NEW') then
   begin
    QueryWork.SQL.Text:='select count(*) cnt from remind '+
      ' where remind.remind_date < "now"+0.5 and remind_end = "0" and remind.remind_us_id = :us_id ';
      QueryWork.ParamByName('US_ID').asInteger:=USERID;

      QueryWork.Open;

      cntRemind := QueryWork.FieldbyName('cnt').asinteger;

      querywork.Close;


      if cntRemind > 0 then
      begin
       Remind_Show_timer.Enabled:=true;
     end



   end;


end;

procedure TMAIN_FORM.DocRnDefaultClick(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=TRxSpeedButton(Sender).tag;
     if IS_EDIT_RN then Messbox('Вы уже просматриваете или редактируете расходную накладную!',MessSYstem,48) else begin
       Application.CreateForm(TDoc_RN,Doc_RN);
       for a:=1 to CntRntyp do if RNTYP[a].ID=b then c:=a;
       Doc_RN.tag:=-1;
       Doc_RN.ToolBar1.Tag:=B;
       Doc_RN.Statusbar1.tag:=c;
       Doc_RN.showModal;
       Doc_RN.destroy;
     end;
end;



procedure TMAIN_FORM.DocPNDefaultClick(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=TRxSpeedButton(Sender).tag;
     for a:=1 to CntPntyp do if PNTYP[a].ID=b then c:=a;
     if IS_EDIT_PN then Messbox('Вы уже просматриваете или редактируете приходную накладную!',MessSYstem,48) else begin
       Application.CreateForm(TDoc_PN2,Doc_PN2);
       Doc_PN2.tag:=-1;
       Doc_PN2.Statusbar1.Tag:=B;
       Doc_PN2.showModal;
       Doc_PN2.destroy;
     end;
end;

procedure TMAIN_FORM.JouRnDefaultClick(Sender: TObject);
var
   a,b,c,d:integer;
begin
        b:=TRxSpeedButton(Sender).tag;
        for a:=1 to CntRntyp do if RNTYP[a].ID=b then c:=a;
        Application.CreateForm(TJou_RN,Jou_RN);
        Jou_RN.tag:=b;
        Jou_RN.Statusbar1.tag:=c;
        Jou_RN.showModal;
        Jou_RN.destroy;
end;

procedure TMAIN_FORM.JouPnDefaultClick(Sender: TObject);
var
   a,b,c:integer;
begin
        b:=TRxSpeedButton(Sender).tag;
        for a:=1 to CntPntyp do if PNTYP[a].ID=b then c:=a;
        Application.CreateForm(TJou_PN,Jou_PN);
        Jou_PN.tag:=b;
        Jou_PN.Statusbar1.tag:=c;
        Jou_PN.showModal;
        Jou_PN.destroy;
end;

procedure TMAIN_FORM.N10Click(Sender: TObject);
begin
     if Lock<>1 then OutKkmError
     else Messbox('Клавиатура ККМ заблокирована!',MessSystem,48);
end;

procedure TMAIN_FORM.N11Click(Sender: TObject);
begin
     if UNLock<>1 then OutKkmError
     else Messbox('Блокировка клавиатуры снята!',MessSystem,48);
end;

procedure TMAIN_FORM.N81Click(Sender: TObject);
begin
     if MODEL_KKM=1 then begin
        // Тест печати АМС-100Ф
        messbox(AMC100F_NOFUN,MessSystem,48);
     end;
     if MODEL_KKM=2 then begin
        // Тест печати Элвес ФР
        Auto_rezim(0,'');
        ELVES_test_print;
        MAIN_FORM.tag:=2;
        MAIN_FORM.close;
        Prepare_form.Timer1.enabled:=true;
        Prepare_form.show;
     end;
end;

procedure TMAIN_FORM.N49Click(Sender: TObject);
begin
     Application.createForm(TSET_DOSTUp,SET_DOSTUP);
     SET_DOSTUP.showModal;
     SET_DOSTUP.destroy;
     MainMenuSet;
end;

procedure TMAIN_FORM.MnReportPribylClick(Sender: TObject);
begin
     Application.createForm(TReport_Pribyl_new,Report_Pribyl_new);
     Report_Pribyl_new.showModal;
     Report_Pribyl_new.destroy;
end;

procedure TMAIN_FORM.N1Click(Sender: TObject);
begin
     Application.createForm(TChange_Password,Change_PAssword);
     Change_PAssword.showModal;
     Change_PAssword.destroy;
end;

procedure TMAIN_FORM.N47Click(Sender: TObject);
begin
        Application.createForm(TTEST_BASE,TEST_BASE);
        TEST_BASE.showmodal;
        TEST_BASE.destroy;
end;

procedure TMAIN_FORM.MnLoginClick(Sender: TObject);
begin
    MAIN_FORM.tag:=2;
    MAIN_FORM.Hide;
    Prepare_form.Timer1.enabled:=true;
    Prepare_form.show;
end;

procedure TMAIN_FORM.N18Click(Sender: TObject);
begin
     Application.createForm(TDefault_SHOPPN,DEFAULT_SHOPPN);
     DEFAULT_SHOPPN.showModal;
     DEFAULT_SHOPPN.destroy;
end;

procedure TMAIN_FORM.N23Click(Sender: TObject);
begin
{     if Astart=1 then begin
        LocKKm;
        Messbox('Можно приступать к работе','Сообщение',48)
     end else OutKkmError(GetKkmError);}
end;

procedure TMAIN_FORM.N74Click(Sender: TObject);
begin
     application.createform(TKKM_ADD,KKM_ADD);
     KKM_ADD.showmodal;
     if KKM_ADD.tag=2 then begin
        if MODEL_KKM=1 then begin
                messbox(AMC100F_NOFUN,MessSystem,48);
        end;
        if MODEL_KKM=2 then begin
          // Внесение суммы на Элвес ФР
          // Переходим в режим регистрации
          Auto_rezim(num_kassir,user_password);
          // Вызываем режим внесения суммы
          ELVES_ADD_SUMM(KKM_ADD.KKM_SUMM.value);
          main_form.GetStatusKKM;
        end;

        if MODEL_KKM=4 then begin
          // Внесение суммы на Штрих ФР-К
          // Переходим в режим регистрации
//          Auto_rezim(num_kassir,user_password);
          // Вызываем режим внесения суммы
          FRSHtrih.CashIncome(KKM_ADD.KKM_SUMM.value);
          main_form.GetStatusKKM;
        end;

     end;
     KKM_ADD.destroy;
end;

procedure TMAIN_FORM.N75Click(Sender: TObject);
begin
     application.createform(TKKM_SUB,KKM_SUB);
     KKM_SUB.showmodal;
     if KKM_SUB.tag=2 then begin
        if model_kkm=1 then begin
                messbox(AMC100F_NOFUN,MessSystem,48);
        end;
        if MODEL_KKM=2 then begin
          // Внесение суммы на Элвес ФР
          // Переходим в режим регистрации
          Auto_rezim(num_kassir,user_password);
          // Вызываем режим внесения суммы
          ELVES_DEC_SUMM(KKM_SUB.KKM_SUMM.value);
          main_form.GetStatusKKM;
        end;

        if MODEL_KKM=4 then
        begin
          // Внесение суммы на Элвес ФР
          // Переходим в режим регистрации
//          Auto_rezim(num_kassir,user_password);
          // Вызываем режим внесения суммы
          FRShtrih.CashOutCome(KKM_SUB.KKM_SUMM.value);
          main_form.GetStatusKKM;
        end;
     end;
     KKM_SUB.destroy;
end;

procedure TMAIN_FORM.N41Click(Sender: TObject);
var i:integer;
 tmpreal:double;
 TmpInt:integer;

begin
   Application.createform(TKKM_STAT,KKM_STAT);
   KKM_STAT.ListBox1.Clear;
   KKM_STAT.ListBox1.Visible:=True;
   // Запрашиваем заводской номер
   GetKKMNUM(TmpInt);
   KKM_STAT.ListBox1.Items.Add('Заводской номер ККМ: '+inttostr(TmpInt));
   // Запрашиваем версию ККМ
   KKM_STAT.ListBox1.Items.Add('Версия ПО ККМ: '+FloatToStr(GetKKMVers/10));
   KKM_STAT.ListBox1.Items.Add('');
   // Запрашиваем номер контрольной ленты
   GetKLNum(TmpInt);
   KKM_STAT.ListBox1.Items.Add('Номер контрольной ленты ='+Inttostr(TmpInt));
   KKM_STAT.ListBox1.Items.Add('Суммы по кассе');
   KKM_STAT.ListBox1.Items.Add('');
   KKM_STAT.ListBox1.Items.Add('Количество покупок:');
   for i:=1 to 7 do begin
       GetSaleCountOnSection(i,TmpInt);
       KKM_STAT.ListBox1.Items.Add('Oтдел '+IntToStr(i)+'='+IntToStr(TmpInt));
   end;
   KKM_STAT.ListBox1.Update;
   KKM_STAT.ListBox1.Items.Add('');

   for i:=1 to 7 do begin
       GetSalesSumOnSection(i,TmpReal);
       KKM_STAT.ListBox1.Items.Add('Сумма по отделу '+IntToStr(i)+'='+FloatToStr(TmpReal));
   end;
   KKM_STAT.ListBox1.Update;
   KKM_STAT.ListBox1.Items.Add('');
   for i:=1 to 7 do begin
       // Запрашиваем сумму возвратов по отделам
       GetReturnedSumOnSection(i,TmpReal);
       KKM_STAT.ListBox1.Items.Add('Возврат по отделу '+IntToStr(i)+'='+FloatToStr(TmpReal));
   end;
   KKM_STAT.ListBox1.Update;
   KKM_STAT.ListBox1.Items.Add('');
   // Запрашиваем Итоговую сумму продаж за смену
   GetSalesSumWithNDEC (TmpReal);
   KKM_STAT.ListBox1.Items.Add('Сумма продаж за смену='+FloatToStr(TmpReal));
   // Запрашиваем Итоговую сумму продаж за смену без учета скидок и возвратов
   GetSalesSumWithoutNDEC (TmpReal);
   KKM_STAT.ListBox1.Items.Add('Сумма продаж без возвратов за смену='+FloatToStr(TmpReal));
   // Запрашиваем внесенную сумму
   GetBroughtSum(TmpReal);
   KKM_STAT.ListBox1.Items.Add('Внесенная сумма='+FloatToStr(TmpReal));
   // Запрашиваем кол-во снятий
   GetRemovedQty(tmpInt);
   KKM_STAT.ListBox1.Items.Add('Количество снятий='+IntToStr(TmpInt));
   // Запрашиваем сумму снятой за смену выручки
   GetRemovedSum(TmpReal);
   KKM_STAT.ListBox1.Items.Add('Снятая сумма='+FloatToStr(TmpReal));
   // Запрашиваем наличные в кассе
   GetCashSum(TmpReal);
   KKM_STAT.ListBox1.Items.Add('Наличные в кассе='+FloatToStr(TmpReal));
   // Запрашиваем необнуляимый итог
   GetNI(TmpReal);
   KKM_STAT.ListBox1.Items.Add('Необнуляемый итог='+FloatToStr(TmpReal));
   KKM_STAT.ListBox1.Items.Add('');
   KKM_STAT.showmodal;
   KKM_STAT.destroy;
end;

procedure TMAIN_FORM.N55Click(Sender: TObject);
begin
  application.createForm(TSET_POCKET_NUM,SET_POCKET_NUM);
  SET_POCKET_NUM.showmodal;
  SET_POCKET_NUM.destroy;
end;

procedure TMAIN_FORM.N62Click(Sender: TObject);
begin
  Application.createForm(TFIND_DELETE_DOC,FIND_DELETE_DOC);
  FIND_DELETE_DOC.showModal;
  FIND_DELETE_DOC.destroy;
end;

procedure TMAIN_FORM.N63Click(Sender: TObject);
begin
     Application.createForm(TLAST_DIAL,LAST_DIAL);
     LAST_DIAL.showModal;
     LAST_DIAL.destroy;
end;

procedure TMAIN_FORM.MnReportINNClick(Sender: TObject);
begin
  Application.createForm(TREPORT_INN,REPORT_INN);
  REPORT_INN.showModal;
  REPORT_INN.destroy;
end;

procedure TMAIN_FORM.MnReportMoneyClick(Sender: TObject);
begin
   Application.createForm(TREPORT_MONEY,REPORT_MONEY);
   REPORT_MONEY.showModal;
   REPORT_MONEY.destroy;
end;

procedure TMAIN_FORM.MnCardSummClick(Sender: TObject);
begin
    Application.createForm(TCARD_SUMM,CARD_SUMM);
    CARD_SUMM.showModal;
    CARD_SUMM.destroy;
end;

procedure TMAIN_FORM.MnCardNumClick(Sender: TObject);
begin
    Application.createForm(TCARD_SKID,CARD_SKID);
    CARD_SKID.showModal;
    CARD_SKID.destroy;
end;

procedure TMAIN_FORM.MnKlnMergeClick(Sender: TObject);
begin
    Application.createForm(TKLN_MERGE,KLN_MERGE);
    KLN_MERGE.showModal;
    KLN_MERGE.destroy;
end;

procedure TMAIN_FORM.MnReportTwChangeClick(Sender: TObject);
begin
    Application.createForm(TREPORT_TW_CHANGE,REPORT_TW_CHANGE);
    REPORT_TW_CHANGE.showModal;
    REPORT_TW_CHANGE.destroy;
end;

procedure TMAIN_FORM.MnReportOstNulClick(Sender: TObject);
begin
    // Отчет об отрицательных остатках
    Application.createForm(TREPORT_OST_NUL,REPORT_OST_NUL);
    REPORT_OST_NUL.showModal;
    REPORT_OST_NUL.destroy;
end;

procedure TMAIN_FORM.N39Click(Sender: TObject);
begin
    Application.createForm(TDEL_OTG_SPIS,DEL_OTG_SPIS);
    DEL_OTG_SPIS.showModal;
    DEL_OTG_SPIS.destroy;
end;

procedure TMAIN_FORM.N32Click(Sender: TObject);
begin
    Application.createForm(TDEL_OTG_RN,DEL_OTG_RN);
    DEL_OTG_RN.showModal;
    DEL_OTG_RN.destroy;
end;

procedure TMAIN_FORM.Timer2Timer(Sender: TObject);
begin
    timer2.enabled:=False;
    Image1.Visible:=False;
    Bevel1.Visible:=False;
end;

procedure TMAIN_FORM.N51Click(Sender: TObject);
begin
   try
     Image1.Picture.LoadFromFile(LOGO_NAME);
     Image1.visible:=true;
     Bevel1.visible:=true;
   Except
   End;
   Timer2.enabled:=true;
end;

procedure TMAIN_FORM.MnPriceClick(Sender: TObject);
begin
   Application.CreateForm(TPrint_PRICE,PRINT_PRICE);
   PRINT_PRICE.showModal;
   PRINT_PRICE.destroy;
end;

procedure TMAIN_FORM.MnLinkNotableClick(Sender: TObject);
begin
   Application.createForm(TLINK_NOTABLE,LINK_NOTABLE);
   LINK_NOTABLE.showModal;
   LINK_NOTABLE.destroy;
end;

procedure TMAIN_FORM.MnLinkNofieldClick(Sender: TObject);
begin
   Application.createForm(TLINK_NOFIELD,LINK_NOFIELD);
   LINK_NOFIELD.showModal;
   LINK_NOFIELD.destroy;
end;

procedure TMAIN_FORM.DicPropTwktgExecute(Sender: TObject);
begin
   // Справочник категорий скидок
   GLOBAL_PROPTWKTG_SELECT:=1; // режим редактирование
   Application.CreateForm(TDic_KTG,DIC_KTG);
   DIC_KTG.showModal;
   DIC_KTG.destroy;
end;


Procedure TMain_Form.GetStatusKKM;
begin
   if (MODEL_KKM=2) and IS_KKM then begin
      Statusbar1.panels[0].text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
      Statusbar1.panels[1].text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
      Statusbar1.panels[2].text:=inttostr(NUM_KASSIR);
   end;
end;

procedure TMAIN_FORM.N72Click(Sender: TObject);
begin
   GetStatusKKM;
end;

procedure TMAIN_FORM.N83Click(Sender: TObject);
begin
   Elves_report_print(10);
   GetStatusKKM;
end;

procedure TMAIN_FORM.N84Click(Sender: TObject);
begin
   Elves_report_print(8);
   GetStatusKKM;
end;

procedure TMAIN_FORM.N85Click(Sender: TObject);
begin
   Elves_report_print(7);
   GetStatusKKM;

end;

procedure TMAIN_FORM.N86Click(Sender: TObject);
begin
   Elves_report_print(2);
   GetStatusKKM;
end;

procedure TMAIN_FORM.Z2Click(Sender: TObject);
begin
   Elves_report_print(1);
   GetStatusKKM;
end;

procedure TMAIN_FORM.MnDocPn2Click(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=-1;
     for a:=1 to CntPntyp do if Sender=MySubDocsPn2Menu[a] then begin
        b:=PNTYP[a].ID;
        c:=a;
     end;
     if b>-1 then begin
        // Новая приходная 2
        Application.createForm(TDOC_PN2,DOC_PN2);
        DOC_PN2.tag:=-1;
        DOC_PN2.Statusbar1.tag:=b; // Тип накладной
        DOC_PN2.showModal;
        DOC_PN2.close;
     end;

end;

procedure TMAIN_FORM.MnJouPn2Click(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=-1;
     for a:=1 to CntPntyp do if Sender=MySubJouPn2Menu[a] then begin
         b:=PNTYP[a].ID;
         c:=a;
     end;
     if b>-1 then begin
        Application.CreateForm(TJou_PN,Jou_PN);
        Jou_PN.tag:=b;
        Jou_PN.Statusbar1.tag:=c;
        Jou_PN.showModal;
        Jou_PN.destroy;
     end;
end;

procedure TMAIN_FORM.BtnDicUslExecute(Sender: TObject);
begin
    // Справочник Услуг
     Application.createForm(TDIC_USL,DIC_USL);
     DicUslSet:=1; {Правка}
     DIC_USL.ShowModal;
     DIC_USL.Destroy;

end;

procedure TMAIN_FORM.Mn1CExpClick(Sender: TObject);
begin
     Application.createForm(TEXP_1C,EXP_1C);
     EXP_1C.ShowModal;
     EXP_1C.Destroy;
end;

procedure TMAIN_FORM.N111Click(Sender: TObject);
begin
     Application.createForm(TSET_EXPORT_1C,SET_EXPORT_1C);
     SET_EXPORT_1C.ShowModal;
     SET_EXPORT_1C.Destroy;
end;

procedure TMAIN_FORM.Mn1CExpRepClick(Sender: TObject);
begin
     Application.createForm(TEXP_1C_REPORTS,EXP_1C_REPORTS);
     EXP_1C_REPORTS.ShowModal;
     EXP_1C_REPORTS.Destroy;
end;

procedure TMAIN_FORM.MnWozwDefaultClick(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=-1;
     for a:=1 to Cntrntyp do if Sender=MySubWozwRnMenu[a] then begin
         b:=RNTYP[a].ID;
         c:=a;
     end;
     if b>-1 then begin
        Application.createForm(TDOC_RN_WOZW,DOC_RN_WOZW);
        DOC_RN_WOZW.tag:=-1;
        DOC_RN_WOZW.Panel1.tag:=b; // Сам тип возврата
        DOC_RN_WOZW.Toolbar1.tag:=c; // По порядку - возврат
        DOC_RN_WOZW.showModal;
        DOC_RN_WOZW.destroy;
     end;
end;

procedure TMAIN_FORM.MnPnWozwDefaultClick(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=-1;
     for a:=1 to CntPntyp do if Sender=MySubWozwPnMenu[a] then begin
         b:=PNTYP[a].ID;
         c:=a;
     end;
     if b>-1 then begin
        Application.createForm(TDOC_PN_WOZW,DOC_PN_WOZW);
        DOC_PN_WOZW.tag:=-1;
        DOC_PN_WOZW.Panel1.tag:=b; // Сам тип возврата
        DOC_PN_WOZW.Toolbar1.tag:=c; // По порядку - возврат
        DOC_PN_WOZW.showModal;
        DOC_PN_WOZW.destroy;
     end;
end;

procedure TMAIN_FORM.JouPsortExecute(Sender: TObject);
begin
    // Журнал актов пересортицы
     Application.createForm(TJou_Psort,Jou_Psort);
     Jou_Psort.showmodal;
     Jou_psort.destroy;
end;

procedure TMAIN_FORM.DocPSortExecute(Sender: TObject);
begin
   // Документ. Акт пересортицы
   Application.CreateForm(TDoc_PSORT,Doc_PSORT);
   Doc_PSORT.tag:=-1;
   Doc_PSORT.showModal;
   Doc_PSORT.destroy;
end;

procedure TMAIN_FORM.ActReportPersPribylExecute(Sender: TObject);
begin
   // Персональный отчет о наценка
   Application.createForm(TPERS_PRIBYL2,PERS_PRIBYL2);
   PERS_PRIBYL2.showModal;
   PERS_PRIBYL2.destroy;
end;


procedure TMAIN_FORM.ActReportKorrExecute(Sender: TObject);
begin
   // Отчет-справка по коррекции НДС
   Application.CreateForm(Treport_korr,report_korr);
   report_korr.showmodal;
   report_korr.destroy;
   
end;

procedure TMAIN_FORM.ActStatExecute(Sender: TObject);
begin
   // Штатное расписание
   Application.CreateForm(TZP_STAT,ZP_STAT);
   ZP_STAT.showmodal;
   ZP_STAT.destroy;
end;

procedure TMAIN_FORM.ActHistoryStatExecute(Sender: TObject);
begin
   // Журнал изменений в штатном расписании
   Application.createForm(TJOU_ZP,JOU_ZP);
   JOU_ZP.showModal;
   JOU_ZP.destroy;
end;

procedure TMAIN_FORM.ActSetMinOstExecute(Sender: TObject);
begin
    Application.createform(TSET_MIN_OST,SET_MIN_OST);
    SET_MIN_OST.showmodal;
    SET_MIN_OST.destroy;
end;

procedure TMAIN_FORM.ActZpRunExecute(Sender: TObject);
begin
   // Собственно расчет зарплаты
   application.createForm(TZP_RUN,ZP_RUN);
   ZP_RUN.showModal;
   ZP_RUN.destroy;
end;

procedure TMAIN_FORM.ActZpKompExecute(Sender: TObject);
begin
   // Справочник компенсаций
end;

procedure TMAIN_FORM.ActZpTabelExecute(Sender: TObject);
begin
   // Ввод табеля
   Application.createForm(TZP_TABEL,ZP_TABEL);
   ZP_TABEL.showModal;
   ZP_TABEL.destroy;
end;

procedure TMAIN_FORM.ActCardRegExecute(Sender: TObject);
begin
   // Регистрация пластиковых карт
   Application.createForm(TCARD_REG,CARD_REG);
   CARD_REG.showModal;
   CARD_REG.destroy;
end;

procedure TMAIN_FORM.ActCardZpExecute(Sender: TObject);
begin
  // Отчет о злоупотреблениях пластиковыми картами
  Application.createform(TREPORT_CARD_ONE_SHOP,REPORT_CARD_ONE_SHOP);
  REPORT_CARD_ONE_SHOP.showModal;
  REPORT_CARD_ONE_SHOP.destroy;
end;

procedure TMAIN_FORM.N79Click(Sender: TObject);
begin
   application.createform(TREPORT_NAC_ITOG,REPORT_NAC_ITOG);
   REPORT_NAC_ITOG.showModal;
   REPORT_NAC_ITOG.Destroy;
end;

procedure TMAIN_FORM.MnRefreshReClick(Sender: TObject);
begin
  Application.createform(TREFRESH_RE,REFRESH_RE);
  REFRESH_RE.showModal;
  REFRESH_RE.destroy;
end;

procedure TMAIN_FORM.N80Click(Sender: TObject);
begin
   application.createform(TREPORT_NAC_ITOG_SHOP,REPORT_NAC_ITOG_SHOP);
   REPORT_NAC_ITOG_SHOP.showModal;
   REPORT_NAC_ITOG_SHOP.Destroy;
end;

procedure TMAIN_FORM.N88Click(Sender: TObject);
begin
   application.createform(TREPORT_TDM_ITOG,REPORT_TDM_ITOG);
   REPORT_TDM_ITOG.showModal;
   REPORT_TDM_ITOG.Destroy;
end;

procedure TMAIN_FORM.ActRepStatExecute(Sender: TObject);
begin
  Application.createForm(TREPORT_STAT,REPORT_STAT);
  REPORT_STAT.showmodal;
  REPORT_STAT.destroy;
end;

procedure TMAIN_FORM.N91Click(Sender: TObject);
begin
   application.createform(TREPORT_TDM_ITOG_SHOP,REPORT_TDM_ITOG_SHOP);
   REPORT_TDM_ITOG_SHOP.showModal;
   REPORT_TDM_ITOG_SHOP.Destroy;
end;

procedure TMAIN_FORM.N93Click(Sender: TObject);
begin
   application.createform(TREPORT_TDM_DETAL,REPORT_TDM_DETAL);
   REPORT_TDM_DETAL.showModal;
   REPORT_TDM_DETAL.Destroy;
end;

procedure TMAIN_FORM.N95Click(Sender: TObject);
begin
  Application.createForm(TReport_Nalog_all,Report_nalog_all);
  Report_Nalog_all.tag:=1;
  Report_nalog_all.showmodal;
  Report_nalog_all.destroy;
end;

procedure TMAIN_FORM.N96Click(Sender: TObject);
begin
  Application.createForm(TReport_Nalog_all,Report_nalog_all);
  Report_Nalog_all.tag:=2;
  Report_nalog_all.showmodal;
  Report_nalog_all.destroy;
end;

procedure TMAIN_FORM.N97Click(Sender: TObject);
begin
  Application.createForm(TReport_Nalog_all,Report_nalog_all);
  Report_Nalog_all.tag:=3;
  Report_nalog_all.showmodal;
  Report_nalog_all.destroy;
end;

procedure TMAIN_FORM.N98Click(Sender: TObject);
begin
  Application.createForm(TReport_Nalog_all,Report_nalog_all);
  Report_Nalog_all.tag:=4;
  Report_nalog_all.showmodal;
  Report_nalog_all.destroy;
end;

procedure TMAIN_FORM.BtnDicRvidExecute(Sender: TObject);
begin
   Application.createForm(TDIC_RVID,DIC_RVID);
   DIC_RVID.showModal;
   DIC_RVID.destroy;
end;

procedure TMAIN_FORM.Bsklad1Click(Sender: TObject);
begin
   Application.createForm(TWhats_new,Whats_new);
   Whats_new.showModal;
   Whats_new.destroy;
end;

procedure TMAIN_FORM.MnRvidClick(Sender: TObject);
begin
   Application.createForm(TDIC_RVID,DIC_RVID);
   DIC_RVID.showModal;
   DIC_RVID.destroy;
end;

procedure TMAIN_FORM.N99Click(Sender: TObject);
var
  cap:string;
  all,cnt:integer;
  cnt_err:integer;
  r:double;
begin
   if messbox('Начать перенос "истории документов" в архивную базу?',MessSubmit,4+48+256)=6 then begin
     cnt_err:=0;
     cap:=Main_form.caption;
     Main_form.caption:='Чистка "истории". Шаг 1 из 3. Синхронизация магазинов. ';
     delay(1);
     WorkTransaction.Active:=False;
     // Определяем число магазинов
     OPEN_SQL(QueryWork,'select count(*) as c from shop');
     all:=QueryWork.fieldByname('C').asinteger;
     cnt:=0;
     OPEN_SQL(QueryWork,'select * from shop');
     while not QueryWork.eof do begin
        inc(cnt);
        Main_form.caption:='Чистка "истории". Шаг 1 из 3. Синхронизация магазинов. ('+inttostr(cnt)+' из '+inttostr(all)+')';
        delay(1);
        datamodule1.IBDatabase2.Open;
        DataModule1.ArcTransaction.Active:=False;
        DataModule1.ArcTransaction.StartTransaction;
        ADD_SQL(DataModule1.QueryArc,'select shop_id from shop where shop_id=:shop_id');
        DataModule1.QueryArc.ParamByname('shop_id').asinteger:=QueryWork.fieldByname('shop_id').asinteger;
        DataModule1.QueryArc.Open;
        if DataModule1.QueryArc.eof then begin
              ADD_SQL(DataModule1.QueryArc,'insert into shop (shop_id,shop_name,shop_prefix,shop_postfix,shop_color) values (:shop_id,:shop_name,:shop_prefix,:shop_postfix,:shop_color)');
        end else begin
              ADD_SQL(DataModule1.QueryArc,'update shop set shop_name=:shop_name,shop_prefix=:shop_prefix,shop_postfix=:shop_postfix,shop_color=:shop_color where shop_id=:shop_id');
        end;
        DataModule1.QueryArc.ParamByname('SHOP_ID').asinteger:=QueryWork.fieldByname('SHOP_ID').asinteger;
        DataModule1.QueryArc.ParamByname('SHOP_NAME').asstring:=QueryWork.fieldByname('SHOP_NAME').asstring;
        DataModule1.QueryArc.ParamByname('SHOP_PREFIX').asstring:=QueryWork.fieldByname('SHOP_PREFIX').asstring;
        DataModule1.QueryArc.ParamByname('SHOP_POSTFIX').asstring:=QueryWork.fieldByname('SHOP_POSTFIX').asstring;
        DataModule1.QueryArc.ParamByname('SHOP_COLOR').asinteger:=QueryWork.fieldByname('SHOP_COLOR').asinteger;
        try
           DataModule1.QueryArc.ExecSql;
           DataModule1.ArcTransaction.Commit;
        except
              inc(cnt_err);
              DataModule1.ArcTransaction.Rollback;
        end;
        DataModule1.ArcTransaction.Active:=False;
        QueryWork.next;
     end;
     Main_form.caption:='Чистка "истории". Шаг 2 из 3. Синхронизация справочника клиентов. ';
     delay(1);
     // Определяем число магазинов
     OPEN_SQL(QueryWork,'select count(*) as c from kln');
     all:=QueryWork.fieldByname('C').asinteger;
     cnt:=0;
     OPEN_SQL(QueryWork,'select kln_id,(select kln_full from kln_data(kln.kln_id)) as kln_full from kln');
     while not QueryWork.eof  do begin
        inc(cnt);
        Main_form.caption:='Чистка "истории". Шаг 2 из 3. Синхронизация справочника клиентов. ('+inttostr(cnt)+' из '+inttostr(all)+')';
        Application.ProcessMessages;
        DataModule1.ArcTransaction.Active:=False;
        DataModule1.ArcTransaction.StartTransaction;
        ADD_SQL(DataModule1.QueryArc,'select kln_id from kln where kln_id=:kln_id');
        DataModule1.QueryArc.ParamByname('kln_id').asinteger:=QueryWork.fieldByname('kln_id').asinteger;
        DataModule1.QueryArc.Open;
        if DataModule1.QueryArc.eof then begin
              ADD_SQL(DataModule1.QueryArc,'insert into kln (kln_id,kln_full) values (:kln_id,:kln_full)');
        end else begin
              ADD_SQL(DataModule1.QueryArc,'update kln set kln_full=:kln_full where kln_id=:kln_id');
        end;
        DataModule1.QueryArc.ParamByname('KLN_ID').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
        DataModule1.QueryArc.ParamByname('KLN_FULL').asstring:=QueryWork.fieldByname('KLN_FULL').asstring;
        try
           DataModule1.QueryArc.ExecSql;
           DataModule1.ArcTransaction.Commit;
        except
              inc(cnt_err);
              DataModule1.ArcTransaction.Rollback;
        end;
        DataModule1.ArcTransaction.Active:=False;
        QueryWork.next;
     end;
     Main_form.caption:='Чистка "истории". Шаг 3 из 3. Перенос "истории документов". ';
     delay(1);
     // Определяем число магазинов
     sql_work.SQL.Text:='select count(*) as c from arcupdate';
     read_transaction.StartTransaction;
     sql_work.ExecQuery;
     all:=sql_work.fieldByname('C').asinteger;
     sql_work.Close;
     cnt:=0;

     sql_work.SQL.Text:='select * from arcupdate';
     sql_work.ExecQuery;
//     all:=sql_work.fieldByname('C').asinteger;

  //   OPEN_SQL(QueryWork,'select * from arcupdate');
     while not sql_work.eof do begin
           inc(cnt);
           if cnt mod 100 = 0 then
           begin
                Main_form.caption:='Чистка "истории". Шаг 2 из 3. Перенос "истории документов". ('+inttostr(cnt)+' из '+inttostr(all)+')';
                Application.ProcessMessages;
//                DataModule1.ArcTransaction.Active:=False;
//                DataModule1.ArcTransaction.StartTransaction;
           end;




//           ADD_SQL(DataModule1.QueryArc,'select arcupdate_id from arcupdate where arcupdate_id=:arcupdate_id');
//           DataModule1.QueryArc.ParamByname('Arcupdate_id').asinteger:=sql_work.fieldByname('arcupdate_id').asinteger;
//           DataModule1.QueryArc.Open;
//           if DataModule1.QueryArc.eof then begin
              // Записи нет - вставляем
  {            ADD_SQL(DataModule1.QueryArc,'insert into arcupdate (arcupdate_id,us_id,shop_id,mess, '+
              'dop1,dop2,doc,tm) values (:arcupdate_id,:us_id,:shop_id,:mess,:dop1,:dop2,:doc,:tm)');
}
              DataModule1.QueryArc.SQL.Text:='select res from insert_proc(:arcupdate_id,:us_id,:shop_id,:mess,:dop1,:dop2,:doc,:tm)';
              DataModule1.QueryArc.ParaMbyname('arcupdate_id').asinteger:=sql_work.fieldByname('arcupdate_id').asinteger;
              DataModule1.QueryArc.ParaMbyname('us_id').asinteger:=sql_work.fieldByname('us_id').asinteger;
              DataModule1.QueryArc.ParaMbyname('shop_id').asinteger:=sql_work.fieldByname('shop_id').asinteger;
              DataModule1.QueryArc.ParaMbyname('mess').asstring:=sql_work.fieldByname('mess').asstring;
              DataModule1.QueryArc.ParaMbyname('dop1').asinteger:=sql_work.fieldByname('dop1').asinteger;
              DataModule1.QueryArc.ParaMbyname('dop2').asinteger:=sql_work.fieldByname('dop2').asinteger;
              DataModule1.QueryArc.ParaMbyname('doc').asstring:=sql_work.fieldByname('doc').asstring;
              DataModule1.QueryArc.ParaMbyname('tm').asdatetime:=sql_work.fieldByname('tm').asdatetime;
              try
                DataModule1.QueryArc.Open;
                DataModule1.QueryArc.Close;

                if cnt mod 100 = 0 then
                        DataModule1.ArcTransaction.Commit;
              except

                on e: Exception do
                begin
                        messbox(e.message, 'sdsfgsdg', 0);

                inc(cnt_err);
                DataModule1.ArcTransaction.Rollback;
                end;
              end;
//              if cnt mod 10 = 0 then
//                DataModule1.ArcTransaction.Active:=False;
//           end;
           // Удаляем запись в текущей базе
           if cnt_err=0 then begin
              if cnt mod 100 = 0 then
              begin
//              Datamodule1.IBTransaction2.Active:=False;
//              Datamodule1.IBTransaction2.StartTransaction;
              end;
              TRY
                 if not ibdelete_doc('arcupdate',sql_work.fieldByname('arcupdate_id').asinteger) then r:=sqrt(-1);
                 if cnt mod 100 = 0 then
                        Datamodule1.IBTransaction2.Commit;
              except
                 inc(cnt_err);
                 Datamodule1.IBTransaction2.Rollback;
              end;
           end;
           sql_work.next;
     end;
     Main_form.caption:=cap;
     Messbox('Перенос "истории документов" в архив завершен!',MessSystem,48);
   end;

   datamodule1.IBDatabase2.Close;
end;

procedure TMAIN_FORM.N100Click(Sender: TObject);
begin
   application.createform(TREPORT_TDM_ITOG_SHOP_DETAL,REPORT_TDM_ITOG_SHOP_DETAL);
   REPORT_TDM_ITOG_SHOP_DETAL.showModal;
   REPORT_TDM_ITOG_SHOP_DETAL.Destroy;
end;

procedure TMAIN_FORM.N29Click(Sender: TObject);
begin
   // подробный отчет о движении товаров одного менеджера

end;

procedure TMAIN_FORM.ActDocPOExecute(Sender: TObject);
begin
    Application.createForm(TDOC_PO,DOC_PO);
    DOC_PO.tag:=-1;
    DOC_PO.ShowModal;
    DOC_PO.Destroy;
end;

procedure TMAIN_FORM.ActJouPOExecute(Sender: TObject);
begin
    // Журнал Предоплат
    Application.createForm(TJOU_PO,JOU_PO);
    JOU_PO.showModal;
    JOU_PO.destroy;
end;

procedure TMAIN_FORM.ActDocRemonExecute(Sender: TObject);
begin
   // Акт переоценки
     Application.createForm(TDOC_REMON,DOC_REMON);
     DOC_REMON.tag:=-1;
     DOC_REMON.showModal;
     DOC_REMON.destroy;
end;

procedure TMAIN_FORM.ActJouRemonExecute(Sender: TObject);
begin
     Application.createForm(TJOU_REMON,JOU_REMON);
     JOU_REMON.showModal;
     JOU_REMON.destroy;
end;

procedure TMAIN_FORM.ActDocPoWozwExecute(Sender: TObject);
begin
    // Возврат предоплаты
    Application.createForm(TDOC_PO_WOZW,DOC_PO_WOZW);
    DOC_PO_WOZW.tag:=-1;
    DOC_PO_WOZW.ShowModal;
    DOC_PO_WOZW.Destroy;

end;

procedure TMAIN_FORM.N102Click(Sender: TObject);
begin
   // настройки коррекции НДС
   application.createForm(TSET_KORR,SET_KORR);
   SET_KORR.showModal;
   SET_KORR.destroy;
end;

procedure TMAIN_FORM.FormHide(Sender: TObject);
var
   s,s2:ansistring;
   a:integer;
begin
     FormStorage1.SaveFormPlacement;
     {Сохраняем даннух конфигурацию в CFG}
     Assignfile(input,ExtractFilePath(Application.EXEName)+'Bsklad_'+inttostr(USERID)+'.cfg');
     if FileExists(ExtractFilePath(Application.EXEName)+'Bsklad_'+inttostr(USERID)+'.cfg') then begin
        Reset(input);
        s:='';
        while not eof(input) do begin
         readln(input,s2);
         s:=s+s2+#13+#10;
       end;
       closefile(input);
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       try
         IBSAVE_CLEAR;
         IBSAVE_ADD('CFG_NAME','MAIN_FORM_CFG');
         IBSAVE_ADD('CFG_SET1',USERID);
         IBSAVE_ADD('CFG_BIG',S);
         CFG_MAIN_FORM:=IBSAVE_DOC('CFG',CFG_MAIN_FORM);
         Datamodule1.IBTransaction2.Commit;
       Except
         Datamodule1.IBTransaction2.RollBack;
       end;
       Datamodule1.IBTransaction2.Active:=False;
       try
         Deletefile(ExtractFilePath(Application.EXEName)+'Bsklad_'+inttostr(USERID)+'.cfg');
       Except
       End;
     end
end;
procedure TMAIN_FORM.N103Click(Sender: TObject);
begin
   Application.createForm(TADD_REPORT,ADD_REPORT);
   ADD_REPORT.showModal;
   ADD_REPORT.destroy;
end;

procedure TMAIN_FORM.N105Click(Sender: TObject);
begin
   application.createForm(TReport_post_fin,Report_post_fin);
   Report_post_fin.showModal;
   Report_post_fin.destroy;

end;

procedure TMAIN_FORM.ReportOneStfaktExecute(Sender: TObject);
begin
   Application.createForm(TReport_StFakt,Report_Stfakt);
   Report_Stfakt.showModal;
   Report_Stfakt.Destroy;
end;

procedure TMAIN_FORM.MnDicKKMClick(Sender: TObject);
begin
   Application.CreateForm(TDIC_KKM,DIC_KKM);
   DIC_KKM.showModal;
   DIC_KKM.destroy;
end;

procedure TMAIN_FORM.N107Click(Sender: TObject);
begin
   Application.createForm(TList_Constant,List_Constant);
   List_Constant.showModal;
   List_Constant.Destroy;
end;

procedure TMAIN_FORM.MnServisCloseDirClick(Sender: TObject);
begin
   Application.createForm(TCLOSE_PERIOD_DIR,CLOSE_PERIOD_DIR);
   CLOSE_PERIOD_DIR.showModal;
   CLOSE_PERIOD_DIR.destroy;
end;

procedure TMAIN_FORM.ActJouZremonExecute(Sender: TObject);
begin
  Application.createForm(TJOU_ZREMON,JOU_ZREMON);
  JOU_ZREMON.showModal;
  JOU_ZREMON.destroy;
end;

procedure TMAIN_FORM.ActDocZremonExecute(Sender: TObject);
begin
  application.createForm(TDOC_ZREMON,DOC_ZREMON);
  DOC_ZREMON.tag:=-1;
  DOC_ZREMON.showModal;
  DOC_ZREMON.destroy;
end;

procedure TMAIN_FORM.MnDicNDSClick(Sender: TObject);
begin
    // Справочник ставок НДС
    Application.createForm(TDIC_NDS,DIC_NDS);
    DIC_NDS.showModal;
    DIC_NDS.destroy;
end;

procedure TMAIN_FORM.FRReportWithoutClick(Sender: TObject);
begin
  FRShtrih.ReportWithoutCleaning;
end;

procedure TMAIN_FORM.FRReportCleaningClick(Sender: TObject);
begin
	if (Messbox('Снять сменный отчет с гашением?',MessSubmit,4+48+256)=6) then begin
    	FRShtrih.ReportWithCleaning;
    end;
end;

procedure TMAIN_FORM.FRReportTaxClick(Sender: TObject);
begin
	FRShtrih.ReportTax;
end;

procedure TMAIN_FORM.FRStatusClick(Sender: TObject);
begin
  application.createForm(TFR_STATUS,FR_STATUS);
  FR_STATUS.showModal;
  FR_STATUS.destroy;
end;

procedure TMAIN_FORM.N119Click(Sender: TObject);
begin
	FRShtrih.ContinuePrint;
end;

procedure TMAIN_FORM.N120Click(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT_DYN_GROUP,DIC_KLIENT_DYN_GROUP);
     DIC_KLIENT_DYN_GROUP.showmodal;
     DIC_KLIENT_DYN_GROUP.Destroy;
end;

procedure TMAIN_FORM.Mn1CImpClick(Sender: TObject);
begin
     Application.createForm(TIMP_1C,IMP_1C);
     IMP_1C.ShowModal;
     IMP_1C.Destroy;
end;

procedure TMAIN_FORM.DocSaleExecute(Sender: TObject);
begin
{
  if SHOPID=14 then
  begin
    Application.createForm(TDOC_SALE_LITE,DOC_SALE_LITE);
    DOC_SALE_LITE.Tag:=-1;
    DOC_SALE_LITE.showmodal;
    DOC_SALE_LITE.destroy;
  end
  else
}  
  begin
    Application.createForm(TDOC_SALE,DOC_SALE);
    DOC_SALE.Tag:=-1;
    DOC_SALE.showmodal;
    DOC_SALE.destroy;
  end;
end;

procedure TMAIN_FORM.ActJouSaleExecute(Sender: TObject);
begin
  Application.createForm(TJou_sale,Jou_sale);
  Jou_sale.showmodal;
  Jou_sale.destroy;
end;

procedure TMAIN_FORM.MnuKKMShtrihClick(Sender: TObject);
begin
  FRSHTRIH.showmodal;
end;

procedure TMAIN_FORM.MnuCalcPNRN_OSN_MoneyClick(Sender: TObject);
begin
  Application.createform(TCalcRNPN_OSN_Money,CalcRNPN_OSN_Money);
  CalcRNPN_OSN_Money.showModal;
  CalcRNPN_OSN_Money.destroy;
end;

procedure TMAIN_FORM.SQL1Click(Sender: TObject);
begin
  Application.CreateForm(Tsql_admin, sql_admin);
  sql_admin.showmodal;
  sql_admin.destroy;

end;

procedure TMAIN_FORM.mnuDicShopSklClick(Sender: TObject);
begin
   Application.createForm(TDIC_SHOPSKL,DIC_SHOPSKL);
   DIC_SHOPSKL.showModal;
   DIC_SHOPSKL.destroy;
end;

procedure TMAIN_FORM.actDicDynTWTreeExecute(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.showmodal;
     DIC_TW_DYN_GROUP.Destroy;
end;

procedure TMAIN_FORM.N52Click(Sender: TObject);
begin
   application.createform(TREPORT_TDM_DETAL_NEW,REPORT_TDM_DETAL_NEW);
   REPORT_TDM_DETAL_NEW.showModal;
   REPORT_TDM_DETAL_NEW.Destroy;
end;

procedure TMAIN_FORM.N113Click(Sender: TObject);
begin
   application.createform(TREPORT_TDM_ITOG_NEW,REPORT_TDM_ITOG_NEW);
   REPORT_TDM_ITOG_NEW.showModal;
   REPORT_TDM_ITOG_NEW.Destroy;
end;

procedure TMAIN_FORM.N114Click(Sender: TObject);
begin
   application.createform(TREPORT_TDM_ITOG_SHOP_NEW,REPORT_TDM_ITOG_SHOP_NEW);
   REPORT_TDM_ITOG_SHOP_NEW.showModal;
   REPORT_TDM_ITOG_SHOP_NEW.Destroy;
end;

procedure TMAIN_FORM.N112Click(Sender: TObject);
begin
   application.createform(TREPORT_TDM_ITOG_SHOP_DETAL_NEW,REPORT_TDM_ITOG_SHOP_DETAL_NEW);
   REPORT_TDM_ITOG_SHOP_DETAL_NEW.showModal;
   REPORT_TDM_ITOG_SHOP_DETAL_NEW.Destroy;
end;

procedure TMAIN_FORM.N116Click(Sender: TObject);
begin
   application.createform(TREPORT_TDM_DETAL_AVG,REPORT_TDM_DETAL_AVG);
   REPORT_TDM_DETAL_AVG.showModal;
   REPORT_TDM_DETAL_AVG.Destroy;
end;

procedure TMAIN_FORM.N117Click(Sender: TObject);
begin
   application.createform(TREPORT_TDM_ITOG_SHOP_AVG,REPORT_TDM_ITOG_SHOP_AVG);
   REPORT_TDM_ITOG_SHOP_AVG.showModal;
   REPORT_TDM_ITOG_SHOP_AVG.Destroy;
end;

procedure TMAIN_FORM.workTypeClick(Sender: TObject);
begin
  application.createForm(TDIC_KLN_WORKTYPE,DIC_KLN_WORKTYPE);
  DIC_KLN_WORKTYPE.showModal;
  DIC_KLN_WORKTYPE.destroy;
end;

procedure TMAIN_FORM.mnuSetMOneyDopuskClick(Sender: TObject);
begin
  Application.CreateForm(TEDIT_MONEY_DOPUSK, EDIT_MONEY_DOPUSK);
  EDIT_MONEY_DOPUSK.showModal;
  EDIT_MONEY_DOPUSK.destroy;
  MainMenuSet;  
end;

procedure TMAIN_FORM.MnJouZtrindefClick(Sender: TObject);
begin
  Application.createForm(TJOU_ZTRINDEF,JOU_ZTRINDEF);
  JOU_ZTRINDEF.showModal;
  JOU_ZTRINDEF.destroy;
end;

procedure TMAIN_FORM.N121Click(Sender: TObject);
begin
   application.createForm(TReport_post_fin_firm,Report_post_fin_firm);
   Report_post_fin_firm.showModal;
   Report_post_fin_firm.destroy;
end;

procedure TMAIN_FORM.SpeedBar1Customize(Sender: TObject);
begin
  MainMenuSet;
end;

procedure TMAIN_FORM.N122Click(Sender: TObject);
begin
{отчет по реализации}
   application.createForm(Treport_prod,Report_prod);
   Report_prod.showModal;
   Report_prod.destroy;

end;

procedure TMAIN_FORM.N123Click(Sender: TObject);
begin
     Application.createForm(TBAR_SCANER_EDIT,BAR_SCANER_EDIT);
     BAR_SCANER_EDIT.showModal;
     BAR_SCANER_EDIT.destroy;
end;

procedure TMAIN_FORM.Comm1RxChar(Sender: TObject; Count: Integer);
var buf: array [0..4096] of char;
  i: integer;
  f: textfile;
  tw_id: integer;
  tw_art: integer;
  tw_kol: double;
  tw_kol_int: integer;
  brak: string;
  bar_code: string;
  tw_typ: integer;
  tmp: string;
begin
 if Count>0 then
 begin
 for i := 0 to 4095 do
  buf[i]:=chr(0);

  (sender as TComm).Read(buf, Count);

  COM_DATA:=COM_DATA+buf;

  //Определить tw_id, tw_kol

  if pos(chr(13)+chr(10), COM_DATA)>0 then
  begin
    bar_code:=stringreplace(com_data, chr(13)+chr(10), '', [rfReplaceAll]);

    gl_LAST_BAR_CODE:=bar_code;

{
Групповой тип:
20  - бракованый товар - на ценнике и на этикетке
21 - хороший товар, на ценнике и на этикетке, кол-во - 1 шт.
22 - товар с весов, количество - в штрих коде

000000 - 6 символов - АРТИКУЛ из склада
0000 4 символа - вес с весов,
Если ноль - выводится запрос на количество товара
вес вида 0.435 кг.
}

    COM_DATA:='';
    try
      tw_id:=0;
      tw_kol:=1;

      {получение TW_ID как своего артикула}

      if length(bar_code)=13 then
      begin
        try

          tw_typ:=strtoint(copy(bar_code, 0, 2));

          if tw_typ in [20,21,22] then
          begin


            tw_art:=strtoint(copy(bar_code, 3, 6));
            tmp:=copy(bar_code, 9, 4);
            tw_kol_int:=strtoint(tmp);
            if tw_kol_int=0 then
              tw_kol_int:=-1000;



            brak:='0';
            if tw_typ=20 then
              brak:='1';
            QueryWork.SQL.Text:='SELECT TW_ID FROM TW WHERE TW_ART=:TW_ART and tw_brak=:tw_brak';
            QueryWork.ParamByName('TW_ART').asinteger:=tw_art;
            QueryWork.ParamByName('TW_BRAK').asstring:=brak;
            QueryWork.Open;
            if not QueryWork.Eof then
             tw_id:=QueryWork.fieldbyname('TW_ID').asinteger;
            QueryWork.Close;
          end;


          if tw_typ in [23] then  //Расходная накладная
          begin

            tw_id := strtoint(copy(bar_code, 3, 10));
            tw_kol_int:=-1000;
          end;

          if tw_typ in [24] then  //Бэйдж сотрудника
          begin

            tw_id := strtoint(copy(bar_code, 3, 10));
            tw_kol_int:=-2000;
          end;

          if tw_typ in [25] then  //накладная перемещения
          begin

            tw_id := strtoint(copy(bar_code, 3, 10));
            tw_kol_int:=-3000;
          end;




        except
        end;
      end;

     {получение TW_ID как чужого артикула}
      if tW_id=0 then //свой артикул не найден, ищем по базе чужих артикулов.
      begin
        QueryWork.SQL.Text:='SELECT TW_ID FROM BAR_CODE WHERE BAR_CODE_VALUE=:BAR_CODE_VALUE';
        QueryWork.ParamByName('BAR_CODE_VALUE').asstring:=bar_code;
        QueryWork.Open;
        if not QueryWork.Eof then
         tw_id:=QueryWork.fieldbyname('TW_ID').asinteger;
        QueryWork.Close;
        tw_kol_int:=1000;
      end;

    except
    on e: Exception do
    messbox(e.message, e.message, 0);
    end;

//    assignfile(f, 'log.txt');
//    rewrite(f);
    if tw_id>0 then
     for i := 0 to Screen.FormCount - 1 do
     begin
      if Screen.Forms[i].Active then
        Screen.Forms[i].Perform(gl_READY_COM_DATA, tw_id, tw_kol_int);
//      writeln(f, Screen.Forms[i].Name);




     end
    else  //tw_id не поределен, надо сопоставить существующему товару.
    begin
     Application.createForm(TBAR_CODE_SET_TW,BAR_CODE_SET_TW);
     BAR_CODE_SET_TW.showModal;
     BAR_CODE_SET_TW.destroy;
    end;

//    closefile(f);
  end;
 end;



end;

procedure TMAIN_FORM.N124Click(Sender: TObject);
begin
     Application.createForm(TEXP_CAS,EXP_CAS);
     EXP_CAS.showModal;
     EXP_CAS.destroy;
end;



procedure TMAIN_FORM.makeComplexRNClick(Sender: TObject);
begin
     Application.createForm(TMAKE_COMPLEX_RN,MAKE_COMPLEX_RN);
     MAKE_COMPLEX_RN.ShowModal;
     MAKE_COMPLEX_RN.Destroy;
end;

procedure TMAIN_FORM.mnuReportNacTabelClick(Sender: TObject);
begin
   application.createform(TREPORT_NAC_TABEL,REPORT_NAC_TABEL);
   REPORT_NAC_TABEL.showModal;
   REPORT_NAC_TABEL.Destroy;
end;

procedure TMAIN_FORM.N127Click(Sender: TObject);
begin
   application.createform(TReport_nac_spec,Report_nac_spec);
   Report_nac_spec.showModal;
   Report_nac_spec.Destroy;
end;

procedure TMAIN_FORM.mnuWozwtoPostClick(Sender: TObject);
begin
     Application.createForm(TMAKE_TW_WOZW_TO_POST,MAKE_TW_WOZW_TO_POST);
     MAKE_TW_WOZW_TO_POST.ShowModal;
     MAKE_TW_WOZW_TO_POST.Destroy;
end;

procedure TMAIN_FORM.N129Click(Sender: TObject);
begin
   application.createform(TREPORT_TDM_ITOG_POST_NEW,REPORT_TDM_ITOG_POST_NEW);
   REPORT_TDM_ITOG_POST_NEW.showModal;
   REPORT_TDM_ITOG_POST_NEW.Destroy;
end;

procedure TMAIN_FORM.mnuMakeRealToKlnClick(Sender: TObject);
begin
     Application.createForm(TMAKE_TW_REAL_TO_KLN,MAKE_TW_REAL_TO_KLN);
     MAKE_TW_REAL_TO_KLN.ShowModal;
     MAKE_TW_REAL_TO_KLN.Destroy;
end;

procedure TMAIN_FORM.MnJouKKMClick(Sender: TObject);
begin
      Application.createForm(TJOU_KKM,JOU_KKM);
     JOU_KKM.ShowModal;
     JOU_KKM.Destroy;

end;

procedure TMAIN_FORM.N128Click(Sender: TObject);
begin
      Application.createForm(TREP_PN,REP_PN);
     REP_PN.ShowModal;
     REP_PN.Destroy;
end;

procedure TMAIN_FORM.mnuRemindClick(Sender: TObject);
var LIST_REMIND: TLIST_REMIND;
begin
     Application.createForm(TLIST_REMIND,LIST_REMIND);
     LIST_REMIND.Refresh_List;
     LIST_REMIND.ShowModal;
     LIST_REMIND.Destroy;
end;

procedure TMAIN_FORM.REMIND_SHOW_TIMERTimer(Sender: TObject);
var LIST_REMIND: TLIST_REMIND;
begin
REMIND_SHOW_TIMER.Enabled:=false;
     Application.createForm(TLIST_REMIND,LIST_REMIND);
     LIST_REMIND.Refresh_List;
     LIST_REMIND.ShowModal;
     LIST_REMIND.Destroy;
end;

procedure TMAIN_FORM.mnuReportSkladWorkClick(Sender: TObject);
begin
   application.createform(TReport_SKLAD_WORK,Report_SKLAD_WORK);
   Report_SKLAD_WORK.showModal;
   Report_SKLAD_WORK.Destroy;
end;

procedure TMAIN_FORM.N130Click(Sender: TObject);
begin
   application.createform(TREPORT_SKLAD_WORK_PALETT,REPORT_SKLAD_WORK_PALETT);
   REPORT_SKLAD_WORK_PALETT.showModal;
   REPORT_SKLAD_WORK_PALETT.Destroy;
end;

procedure TMAIN_FORM.N131Click(Sender: TObject);
begin
   application.createform(TDIC_ZP_USERS,DIC_ZP_USERS);
   DIC_ZP_USERS.showModal;
   DIC_ZP_USERS.Destroy;
end;

procedure TMAIN_FORM.mnu_list_informerClick(Sender: TObject);
var LIST_DOC_INFORMER: TLIST_DOC_INFORMER;
begin
     Application.createForm(TLIST_DOC_INFORMER,LIST_DOC_INFORMER);
     LIST_DOC_INFORMER.Refresh_List;
     LIST_DOC_INFORMER.ShowModal;
     LIST_DOC_INFORMER.Destroy;
end;

procedure TMAIN_FORM.N132Click(Sender: TObject);
begin
  application.createForm(TDIC_CARD_HOLDER,DIC_CARD_HOLDER);
  DIC_CARD_HOLDER.showModal;
  DIC_CARD_HOLDER.destroy;
end;

procedure TMAIN_FORM.N133Click(Sender: TObject);
begin
{отчет по реализации}
   application.createForm(Treport_card_prod,Report_card_prod);
   Report_card_prod.showModal;
   Report_card_prod.destroy;
end;

procedure TMAIN_FORM.mnuJouZonePerClick(Sender: TObject);
begin
  Application.createForm(TJOU_ZONE_PER,JOU_ZONE_PER);
  JOU_ZONE_PER.showModal;
  JOU_ZONE_PER.destroy;
end;

procedure TMAIN_FORM.mnuDicZoneClick(Sender: TObject);
begin
     application.createForm(Tdic_zone,dic_zone);
     dic_zone.showmodal;
     dic_zone.destroy;
end;

procedure TMAIN_FORM.mnuReportZoneOstClick(Sender: TObject);
begin
     Application.createForm(TReport_zone_ost,report_zone_ost);
     report_zone_ost.showmodal;
     report_zone_ost.destroy;
end;

procedure TMAIN_FORM.N134Click(Sender: TObject);
begin
   application.createform(Treport_card_info,report_card_info);
   report_card_info.showModal;
   report_card_info.Destroy;
end;

procedure TMAIN_FORM.mnuEditTwSkladParamsClick(Sender: TObject);
begin
   application.createform(Tedit_tw_sklad_params,edit_tw_sklad_params);
   edit_tw_sklad_params.showModal;
   edit_tw_sklad_params.Destroy;
end;

end.

