unit PersTorg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, StdCtrls, Buttons, ExtCtrls,B_utils,B_DButils,Data1,
  RxLookup, Db, IBCustomDataSet, IBQuery, IBDatabase,DataQr,
  VclUtils, DualList, ppMemo, ppDB, ppDBPipe, ppCtrls, ppBands, ppVar,
  ppStrtch, ppRegion, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, CurrEdit, ppModule, daDatMod, AddReport, FR_Class, FR_DSet,
  FR_DBSet, RxMemDS, excel2000, OleServer, DBCtrls, ComObj;

type
  TPers_TORG = class(TForm)
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    SKL1: TRadioButton;
    SKL2: TRadioButton;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    DT1: TDateEdit;
    Label3: TLabel;
    DT2: TDateEdit;
    Button1: TButton;
    BtnPrint: TButton;
    Button3: TButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    DicTransaction: TIBTransaction;
    QrSHOP: TIBQuery;
    QrSHOPSHOP_ID: TIntegerField;
    QrSHOPSHOP_NAME: TIBStringField;
    QrSHOPSHOP_LAST: TDateTimeField;
    QrSHOPSHOP_OFFICE: TIBStringField;
    QrSHOPSHOP_PREFIX: TIBStringField;
    QrSHOPSHOP_POSTFIX: TIBStringField;
    QrSHOPSHOP_COLOR: TIntegerField;
    DsShop: TDataSource;
    DicSKL: TRxDBLookupCombo;
    QrSKLAD: TIBQuery;
    QrSKLADSKL_ID: TIntegerField;
    QrSKLADSKL_SHORT: TIBStringField;
    QrSKLADSKL_FULL: TIBStringField;
    QrSKLADSKL_ADR: TIBStringField;
    QrSKLADSKL_TEL: TIBStringField;
    QrSKLADSKL_TIME: TIBStringField;
    QrSKLADSKL_SPEED: TIntegerField;
    DsSKL: TDataSource;
    DualListDialog1: TDualListDialog;
    PpPers3: TppReport;
    ppTitleBand1: TppTitleBand;
    ppImage1: TppImage;
    ppRegion1: TppRegion;
    ppRegion10: TppRegion;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel5: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    PpPers3User: TppLabel;
    PpRnTitle: TppLabel;
    ppLabel18: TppLabel;
    PpPers3Vers: TppLabel;
    ppLabel20: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel8: TppLabel;
    ppDBCalc4: TppDBCalc;
    PipPers3: TppDBPipeline;
    ppLabel6: TppLabel;
    Pers3Title: TppMemo;
    PipPers2: TppDBPipeline;
    PpPers2: TppReport;
    ppTitleBand2: TppTitleBand;
    ppImage3: TppImage;
    ppRegion2: TppRegion;
    ppLabel7: TppLabel;
    Pers2Title: TppMemo;
    ppRegion3: TppRegion;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    ppLabel11: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel12: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel13: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    PpPers2User: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    PpPers2Vers: TppLabel;
    ppLabel24: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLine4: TppLine;
    ppLabel25: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel16: TppLabel;
    ppLabel23: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBCalc2: TppDBCalc;
    PpPers1: TppReport;
    ppTitleBand3: TppTitleBand;
    ppImage5: TppImage;
    ppRegion4: TppRegion;
    ppLabel26: TppLabel;
    Pers1Title: TppMemo;
    ppRegion5: TppRegion;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine5: TppLine;
    ppLabel31: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLabel32: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppLabel33: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    PpPers1User: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    PpPers1Vers: TppLabel;
    ppLabel40: TppLabel;
    ppSummaryBand3: TppSummaryBand;
    ppLine6: TppLine;
    ppLabel41: TppLabel;
    ppDBCalc5: TppDBCalc;
    PipPers1: TppDBPipeline;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppRegion6: TppRegion;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    PpPers4: TppReport;
    ppTitleBand4: TppTitleBand;
    ppImage7: TppImage;
    ppRegion7: TppRegion;
    ppLabel58: TppLabel;
    Pers4Title: TppMemo;
    ppRegion8: TppRegion;
    ppLabel59: TppLabel;
    ppLabel62: TppLabel;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppDBMemo4: TppDBMemo;
    ppFooterBand4: TppFooterBand;
    ppLine7: TppLine;
    ppLabel63: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLabel64: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppLabel65: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    PpPers4User: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    PpPers4Vers: TppLabel;
    ppLabel72: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppLine8: TppLine;
    ppLabel73: TppLabel;
    ppDBCalc6: TppDBCalc;
    PipPers4: TppDBPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc3: TppDBCalc;
    ppLine9: TppLine;
    GroupBox2: TGroupBox;
    TW1: TRadioButton;
    TW2: TRadioButton;
    TW: TEdit;
    BtnTW: TSpeedButton;
    BRAK1: TCheckBox;
    BRAK2: TCheckBox;
    QueryWork2: TIBQuery;
    Image1: TImage;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel68: TppLabel;
    ppLabel71: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    Label4: TLabel;
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    DualListDialog2: TDualListDialog;
    ppDBMemo5: TppDBMemo;
    ppLabel80: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel36: TppLabel;
    ppLabel39: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel81: TppLabel;
    PipPers5: TppDBPipeline;
    PPPers5: TppReport;
    ppTitleBand5: TppTitleBand;
    ppImage9: TppImage;
    ppRegion9: TppRegion;
    ppLabel82: TppLabel;
    Pers5Title: TppMemo;
    ppRegion11: TppRegion;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBMemo6: TppDBMemo;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine10: TppLine;
    ppLabel87: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppLabel88: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppLabel89: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    PpPers5User: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    PpPers5Vers: TppLabel;
    ppLabel96: TppLabel;
    ppSummaryBand5: TppSummaryBand;
    ppLine11: TppLine;
    ppLabel97: TppLabel;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppLabel92: TppLabel;
    VID: TComboBox;
    Label5: TLabel;
    PPPers6: TppReport;
    ppTitleBand6: TppTitleBand;
    ppImage2: TppImage;
    ppRegion12: TppRegion;
    ppLabel95: TppLabel;
    Pers6Title: TppMemo;
    ppRegion13: TppRegion;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppHeaderBand6: TppHeaderBand;
    ppDetailBand6: TppDetailBand;
    ppDBText24: TppDBText;
    ppDBMemo7: TppDBMemo;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine12: TppLine;
    ppLabel102: TppLabel;
    ppSystemVariable16: TppSystemVariable;
    ppLabel103: TppLabel;
    ppSystemVariable17: TppSystemVariable;
    ppLabel104: TppLabel;
    ppSystemVariable18: TppSystemVariable;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    PpPers6User: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    PpPers6Vers: TppLabel;
    ppLabel111: TppLabel;
    ppSummaryBand6: TppSummaryBand;
    ppLine13: TppLine;
    ppLabel112: TppLabel;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    PipPers6: TppDBPipeline;
    ppLabel107: TppLabel;
    ppDBMemo8: TppDBMemo;
    ppLabel110: TppLabel;
    ppDBText27: TppDBText;
    ppDBCalc23: TppDBCalc;
    ppPers7: TppReport;
    PipPers7: TppDBPipeline;
    ppTitleBand7: TppTitleBand;
    ppImage6: TppImage;
    ppRegion14: TppRegion;
    ppRegion15: TppRegion;
    ppRegion16: TppRegion;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppShape3: TppShape;
    ppLabel117: TppLabel;
    ppShape4: TppShape;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppDBText28: TppDBText;
    ppLabel153: TppLabel;
    ppSystemVariable20: TppSystemVariable;
    ppLabel154: TppLabel;
    ppSystemVariable21: TppSystemVariable;
    ppLabel155: TppLabel;
    ppLine54: TppLine;
    ppHeaderBand7: TppHeaderBand;
    ppLabel156: TppLabel;
    ppSystemVariable23: TppSystemVariable;
    ppLabel157: TppLabel;
    ppSystemVariable24: TppSystemVariable;
    ppLabel158: TppLabel;
    ppShape5: TppShape;
    ppLabel159: TppLabel;
    ppLine56: TppLine;
    ppLine58: TppLine;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    ppLabel166: TppLabel;
    ppLabel167: TppLabel;
    ppLabel168: TppLabel;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppLabel174: TppLabel;
    ppLabel175: TppLabel;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine64: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLine69: TppLine;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppLine70: TppLine;
    ppDetailBand7: TppDetailBand;
    ppDBCalc24: TppDBCalc;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText34: TppDBText;
    ppDBMemo11: TppDBMemo;
    ppLine71: TppLine;
    ppFooterBand7: TppFooterBand;
    ppSummaryBand7: TppSummaryBand;
    ppLine72: TppLine;
    ppLabel178: TppLabel;
    ppDBCalc25: TppDBCalc;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    ppLabel182: TppLabel;
    ppLabel183: TppLabel;
    ppLabel184: TppLabel;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLabel185: TppLabel;
    ppLine76: TppLine;
    ppLine89: TppLine;
    ppLabel186: TppLabel;
    ppLabel187: TppLabel;
    ppLine90: TppLine;
    ppLabel188: TppLabel;
    ppLabel189: TppLabel;
    ReportRN: TIBQuery;
    ReportRNRNTYP_ID: TIntegerField;
    ReportRNRNTYP_SHORT: TIBStringField;
    ReportRNOBOROT: TFloatField;
    ReportRNOB_NDS: TFloatField;
    ReportRNOB_NSP: TFloatField;
    ReportRNSEB: TFloatField;
    ReportRNNDS: TFloatField;
    ReportRNKORR: TFloatField;
    ReportRNKOL1: TFloatField;
    ReportRNKOL2: TFloatField;
    ReportRNSEBNDS: TFloatField;
    FrRN: TfrDBDataSet;
    RN: TfrReport;
    Label6: TLabel;
    DT3: TDateEdit;
    ppRNDate: TppLabel;
    QrSKLAD1: TIBQuery;
    dsSKL1: TDataSource;
    ppSKLADFULL: TppLabel;
    ppFIRMFULL: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    PPPers8: TppReport;
    ppTitleBand8: TppTitleBand;
    ppImage4: TppImage;
    ppRegion17: TppRegion;
    ppLabel190: TppLabel;
    Pers8Title: TppMemo;
    ppRegion18: TppRegion;
    ppLabel191: TppLabel;
    ppLabel192: TppLabel;
    ppLabel193: TppLabel;
    ppLabel194: TppLabel;
    ppLabel195: TppLabel;
    ppLabel196: TppLabel;
    ppHeaderBand8: TppHeaderBand;
    ppDetailBand8: TppDetailBand;
    ppDBText31: TppDBText;
    ppDBMemo9: TppDBMemo;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBMemo10: TppDBMemo;
    ppDBText35: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine14: TppLine;
    ppLabel197: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppLabel198: TppLabel;
    ppSystemVariable22: TppSystemVariable;
    ppLabel199: TppLabel;
    ppSystemVariable25: TppSystemVariable;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    ppPers8User: TppLabel;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppPers8Vers: TppLabel;
    ppLabel206: TppLabel;
    ppSummaryBand8: TppSummaryBand;
    ppLine15: TppLine;
    ppLabel207: TppLabel;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    PipPers8: TppDBPipeline;
    ppPers9: TppReport;
    ppTitleBand9: TppTitleBand;
    ppImage8: TppImage;
    ppRegion19: TppRegion;
    ppLabel208: TppLabel;
    Pers9Title: TppMemo;
    ppRegion20: TppRegion;
    ppLabel209: TppLabel;
    ppLabel210: TppLabel;
    ppLabel211: TppLabel;
    ppLabel212: TppLabel;
    ppLabel213: TppLabel;
    ppLabel214: TppLabel;
    ppHeaderBand9: TppHeaderBand;
    ppDetailBand9: TppDetailBand;
    ppDBText36: TppDBText;
    ppDBMemo12: TppDBMemo;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBMemo13: TppDBMemo;
    ppDBText39: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine16: TppLine;
    ppLabel215: TppLabel;
    ppSystemVariable26: TppSystemVariable;
    ppLabel216: TppLabel;
    ppSystemVariable27: TppSystemVariable;
    ppLabel217: TppLabel;
    ppSystemVariable28: TppSystemVariable;
    ppLabel218: TppLabel;
    ppLabel219: TppLabel;
    PpPers9User: TppLabel;
    ppLabel221: TppLabel;
    ppLabel222: TppLabel;
    PpPers9Vers: TppLabel;
    ppLabel224: TppLabel;
    ppSummaryBand9: TppSummaryBand;
    ppLine17: TppLine;
    ppLabel225: TppLabel;
    ppDBCalc30: TppDBCalc;
    ppDBCalc31: TppDBCalc;
    ppDBCalc32: TppDBCalc;
    ppDBCalc33: TppDBCalc;
    pipPers9: TppDBPipeline;
    gbKln: TGroupBox;
    KLN_NAME: TEdit;
    BTN_KLN: TBitBtn;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    Label7: TLabel;
    FRM: TRxDBLookupCombo;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    ppLabel202: TppLabel;
    ppDBText40: TppDBText;
    ppDBCalc34: TppDBCalc;
    GroupBox3: TGroupBox;
    useR_name: TEdit;
    BTN_USER: TBitBtn;
    cbUserAll: TCheckBox;
    BtnExcel: TButton;
    Label8: TLabel;
    twktg: TRxDBLookupCombo;
    BtnDynDic: TSpeedButton;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    DualListDialog3: TDualListDialog;
    kln1: TRadioButton;
    kln2: TRadioButton;
    DynKLN: TBitBtn;
    ppPers10: TppReport;
    ppTitleBand10: TppTitleBand;
    ppImage10: TppImage;
    ppRegion21: TppRegion;
    ppLabel205: TppLabel;
    pers10title: TppMemo;
    ppRegion22: TppRegion;
    ppLabel220: TppLabel;
    ppLabel223: TppLabel;
    ppLabel226: TppLabel;
    ppLabel227: TppLabel;
    ppLabel229: TppLabel;
    ppLabel230: TppLabel;
    ppHeaderBand10: TppHeaderBand;
    ppDetailBand10: TppDetailBand;
    ppDBMemo14: TppDBMemo;
    ppDBText43: TppDBText;
    ppDBCalc35: TppDBCalc;
    ppFooterBand10: TppFooterBand;
    ppLine18: TppLine;
    ppLabel231: TppLabel;
    ppSystemVariable29: TppSystemVariable;
    ppLabel232: TppLabel;
    ppSystemVariable30: TppSystemVariable;
    ppLabel233: TppLabel;
    ppSystemVariable31: TppSystemVariable;
    ppLabel234: TppLabel;
    ppLabel235: TppLabel;
    ppLabel236: TppLabel;
    ppLabel237: TppLabel;
    ppLabel238: TppLabel;
    ppLabel239: TppLabel;
    ppLabel240: TppLabel;
    ppSummaryBand10: TppSummaryBand;
    ppLine19: TppLine;
    ppLabel241: TppLabel;
    ppDBCalc36: TppDBCalc;
    ppDBCalc37: TppDBCalc;
    ppDBCalc38: TppDBCalc;
    ppLabel228: TppLabel;
    ppPageStyle1: TppPageStyle;
    ppLabel242: TppLabel;
    ppLabel243: TppLabel;
    ppLabel244: TppLabel;
    ppLabel245: TppLabel;
    ppLabel246: TppLabel;
    ppLabel247: TppLabel;
    ppLabel248: TppLabel;
    ppLabel249: TppLabel;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppPers11: TppReport;
    ppTitleBand11: TppTitleBand;
    ppImage11: TppImage;
    ppRegion23: TppRegion;
    ppLabel250: TppLabel;
    Pers11Title: TppMemo;
    ppRegion24: TppRegion;
    ppLabel251: TppLabel;
    ppLabel252: TppLabel;
    ppLabel253: TppLabel;
    ppLabel255: TppLabel;
    ppLabel256: TppLabel;
    ppHeaderBand11: TppHeaderBand;
    ppDetailBand11: TppDetailBand;
    ppDBText54: TppDBText;
    ppDBMemo15: TppDBMemo;
    ppDBText56: TppDBText;
    ppDBMemo16: TppDBMemo;
    ppDBText57: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLine20: TppLine;
    ppLabel257: TppLabel;
    ppSystemVariable32: TppSystemVariable;
    ppLabel258: TppLabel;
    ppSystemVariable33: TppSystemVariable;
    ppLabel259: TppLabel;
    ppSystemVariable34: TppSystemVariable;
    ppLabel260: TppLabel;
    ppLabel261: TppLabel;
    ppLabel262: TppLabel;
    ppLabel263: TppLabel;
    ppLabel264: TppLabel;
    ppLabel265: TppLabel;
    ppLabel266: TppLabel;
    ppSummaryBand11: TppSummaryBand;
    ppLine21: TppLine;
    ppLabel267: TppLabel;
    ppDBCalc39: TppDBCalc;
    ppDBCalc40: TppDBCalc;
    ppDBCalc42: TppDBCalc;
    ppLabel254: TppLabel;
    ppDBText55: TppDBText;
    ppDBCalc41: TppDBCalc;
    DualListDialog4: TDualListDialog;
    chkTabel: TCheckBox;
    RNS_TABEL: TRxCalcEdit;
    cbDirectPost: TCheckBox;
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SKL2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Openquery(Print: boolean = true);
    procedure BitBtn1Click(Sender: TObject);
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure PpPers3PreviewFormCreate(Sender: TObject);
    procedure ppTitleBand2BeforeGenerate(Sender: TObject);
    procedure PpPers2PreviewFormCreate(Sender: TObject);
    procedure PpPers1PreviewFormCreate(Sender: TObject);
    procedure ppTitleBand3BeforeGenerate(Sender: TObject);
    procedure PpPers4PreviewFormCreate(Sender: TObject);
    procedure ppTitleBand4BeforeGenerate(Sender: TObject);
    procedure BtnTWClick(Sender: TObject);
    procedure TW2Click(Sender: TObject);
    procedure BRAK1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PPPers5PreviewFormCreate(Sender: TObject);
    procedure ppTitleBand5BeforeGenerate(Sender: TObject);
    procedure VIDChange(Sender: TObject);
    procedure PPPers6PreviewFormCreate(Sender: TObject);
    procedure ppPers7PreviewFormCreate(Sender: TObject);
    procedure RNGetValue(const ParName: String; var ParValue: Variant);
    procedure ppTitleBand7BeforeGenerate(Sender: TObject);
    procedure PPPers8PreviewFormCreate(Sender: TObject);
    procedure ppPers9PreviewFormCreate(Sender: TObject);
    procedure ppTitleBand8BeforeGenerate(Sender: TObject);
    procedure ppTitleBand9BeforeGenerate(Sender: TObject);
    procedure BTN_KLNClick(Sender: TObject);
    procedure BTN_USERClick(Sender: TObject);
    procedure cbUserAllClick(Sender: TObject);
    procedure ExpExcel;
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ExpCalc;
    procedure BtnExcelClick(Sender: TObject);
    procedure kln1Click(Sender: TObject);
    procedure DynKLNClick(Sender: TObject);
    procedure ppPers10PreviewFormCreate(Sender: TObject);
    procedure ppTitleBand10BeforeGenerate(Sender: TObject);
    procedure ppPers11PreviewFormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure chkTabelClick(Sender: TObject);
  private
    { Private declarations }
    tw_group_id: integer;
    tW_group_typ:integer;
    kln_group_id: integer;
    kln_group_typ:integer;
    excel: TExcelApplication;
  public
    { Public declarations }
  end;

var
  Pers_TORG: TPers_TORG;
  PT_SHOPC,PT_SKLC,PT_SHOP,PT_SKL,PT_RNTYP,PT_PNTYP,PT_VID:integer;
  PT_RVID:integer;
  RNTYP_S:ansistring;
  PNTYP_S:ansistring;
  RVID_S:ansistring;
  SHOP_S:ansistring;
  s:ansistring;
const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
implementation

uses DicTowar, WaitForm, DicKlient, DicTwDynGroup, DicKlientDynGroup;

{$R *.DFM}

procedure TPers_TORG.Button3Click(Sender: TObject);
begin
     close;
end;

procedure TPers_TORG.FormShow(Sender: TObject);
var
   s3,s4,shop2:ansistring;
   a:integer;
begin
   tw_group_id:=0;
   tw_group_typ:=3;  //просто все товары
   kln_group_id:=0;
   kln_group_typ:=4;
   Datamodule3.QrTabel.close;
   Datamodule3.QrPers5.Close;
   Datamodule3.QrPers6.Close;
   Datamodule3.QrPers4.Close;
   Datamodule3.QrPers3.Close;
   Datamodule3.QrPers2.Close;
   Datamodule3.QrPersTorg.Close;
   Datamodule3.PersTorgTransaction.Active:=false;

     RNTYP_S:=' ';
     RVID_S:=' ';
     DicTransaction.Active:=False;
     QrSHOP.close;
     QrSHOP.Open;
     QrSklad.close;
     QrSklad.Open;
     SHOP_S:=' ';
     DicSKL.value:=inttostr(DEFAULT_SKLAD);
     DT1.date:=date();
     DT2.date:=date();
     DT3.date:=date();

     Edit1.text:='';
     Edit2.text:='';
     VID.itemindex:=0;
     SKL1.checked:=true;
     {Читаем предустановленные данные}
     PT_SHOP:=-1;
     PT_SKL:=1;
     PT_RNTYP:=-1;
     PT_PNTYP:=-1;
     PT_VID:=-1;
     PT_SKLC:=-1;
     PT_SHOPC:=-1;
     PT_RVID:=-1;


     twktg.emptyvalue:='0';
     twktg.DisplayEmpty:='<Все категории>';
     twktg.Value:='0';


     {Загрузка списка доступных фирм}
  MemFrm.EmptyTable;
  MemFrm.Append;
  MemFrm.fieldByname('FRM_ID').asinteger:=0;
  MemFrm.fieldByname('FRM_NAME').asstring:='<Все>';
  MemFrm.Post;
  ADD_SQL(QueryWork,'select frm_id,bg_left(frm_full,127) as frm_name from rn_dic_frm(:FRM_ID) order by 2');
  QueryWork.open;
  while not QueryWork.eof do begin
    MemFrm.Append;
    MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
    MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
    MemFrm.Post;
    QueryWork.next;
  end;
  FRM.value:='0';


     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select * from cfg where cfg_name="PERS_TORG" and CFG_SET2=:US_ID');
     QueryWork.ParamByname('US_ID').asinteger:=USERID;
     QueryWork.open;
     if not QueryWork.eof then begin
        if QueryWork.Locate('CFG_SET1',1,[]) then begin
          SHOP_S:=QueryWork.fieldByname('CFG_VALUE').asstring;
          PT_SHOP:=QueryWork.fieldByname('CFG_ID').asinteger;
        end;
        if QueryWork.Locate('CFG_SET1',2,[]) then begin
          DicSKL.value:=inttostr(strtoint(QueryWork.fieldByname('CFG_VALUE').asstring));
          PT_SKL:=QueryWork.fieldByname('CFG_ID').asinteger;
        end;
        if QueryWork.Locate('CFG_SET1',3,[]) then begin
           RNTYP_S:=QueryWork.fieldByname('CFG_VALUE').asstring;
           PT_RNTYP:=QueryWork.fieldByname('CFG_ID').asinteger;
        end;
        if QueryWork.Locate('CFG_SET1',31,[]) then begin
           PNTYP_S:=QueryWork.fieldByname('CFG_VALUE').asstring;
           PT_PNTYP:=QueryWork.fieldByname('CFG_ID').asinteger;
        end;
        if QueryWork.Locate('CFG_SET1',4,[]) then begin
           VID.itemindex:=QueryWork.fieldByname('CFG_VALUE').asinteger-1;
           PT_VID:=QueryWork.fieldByname('CFG_ID').asinteger;
        end;
        if QueryWork.Locate('CFG_SET1',5,[]) then begin
           if QueryWork.fieldByname('CFG_VALUE').asstring='1' then SKL1.checked:=true
                                                         else SKL2.checked:=true;
           PT_SKLC:=QueryWork.fieldByname('CFG_ID').asinteger;
        end;
   {     if QueryWork.Locate('CFG_SET1',6,[]) then begin
          if QueryWork.fieldByname('CFG_VALUE').asstring='1' then SHOP1.checked:=true
                                                         else SHOP2.checked:=true;
           PT_SHOPC:=QueryWork.fieldByname('CFG_ID').asinteger;
       end;     }
       if QueryWork.Locate('CFG_SET1',7,[]) then begin
           RVID_S:=QueryWork.fieldByname('CFG_VALUE').asstring;
           PT_RVID:=QueryWork.fieldByname('CFG_ID').asinteger;
        end;
     end;
     {Заполняем DualListDialog}
     s4:='';
     s3:=' '+RNTYP_S+' ';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     DualListDialog1.Title:='Список типов расходных накладных';
     DualListDialog1.List1.Clear;
     DualListDialog1.List2.Clear;
     while not QueryWork.eof do begin
           if pos(' '+QueryWork.fieldByname('RNTYP_ID').asstring+' ',s3)>0 then begin
              DualListDialog1.List2.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
              s4:=s4+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
           end else
           DualListDialog1.List1.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit1.text:=s4;
//***********

     {Заполняем DualListDialog}
     s4:='';
     s3:=' '+PNTYP_S+' ';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select PNTYP_SHORT,PNTYP_ID from PNTYP order by PNTYP_ID');
     DualListDialog4.Title:='Список типов приходных накладных';
     DualListDialog4.List1.Clear;
     DualListDialog4.List2.Clear;
     while not QueryWork.eof do begin
           if pos(' '+QueryWork.fieldByname('PNTYP_ID').asstring+' ',s3)>0 then begin
              DualListDialog4.List2.Add(QueryWork.fieldByname('PNTYP_SHORT').asstring);
              s4:=s4+QueryWork.fieldByname('PNTYP_SHORT').asstring+',';
           end else
           DualListDialog4.List1.Add(QueryWork.fieldByname('PNTYP_SHORT').asstring);
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);

//***********

     {Заполняем DualListDialog3, список магазинов}
     s4:='';
     s3:='';
     s3:=SHOP_S;
     //for a:=1 to length(s3) do if s3[a]='%' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     DualListDialog3.Title:='Список магазинов';
     DualListDialog3.List1.Clear;
     DualListDialog3.List2.Clear;
     if CHECK_DOSTUP('$REPORT.TORG.PERS.SHOP') then begin
       OPEN_SQL(QueryWork,'select SHOP_NAME,SHOP_ID,VISIBLE from SHOP where visible=1 order by SHOP_ID');
       while not QueryWork.eof do begin
//         if (QueryWork.fieldByname('VISIBLE').asinteger)=1 then
//         begin
           if pos('%'+QueryWork.fieldByname('SHOP_ID').asstring+'%',s3)>0 then begin
              DualListDialog3.List2.Add(QueryWork.fieldByname('SHOP_NAME').asstring);
              s4:=s4+QueryWork.fieldByname('SHOP_NAME').asstring+',';
              //s3:=s3+'%'+QueryWork.fieldByname('SHOP_ID').asstring+'%';
           end else
           DualListDialog3.List1.Add(QueryWork.fieldByname('SHOP_NAME').asstring);
//         end;
       QueryWork.next;
       end;
     end
     else begin
       ADD_SQL(QueryWork,'select SHOP_NAME,SHOP_ID from SHOP where SHOP_ID=:SH_ID order by SHOP_ID');
       QueryWork.ParamByName('SH_ID').AsInteger:=SHOPID;
       QueryWork.open;
//           if pos(' '+QueryWork.fieldByname('SHOP_ID').asstring+' ',s3)>0 then
//           begin
       if (QueryWork.FieldByName('SHOP_ID').AsInteger=10) or (QueryWork.FieldByName('SHOP_ID').AsInteger=14) then
       begin
         OPEN_SQL(QueryWork,'select SHOP_NAME,SHOP_ID from SHOP where SHOP_ID in (10,14,20) order by SHOP_ID');
         while not QueryWork.Eof do
         begin
             DualListDialog3.List2.Add(QueryWork.fieldByname('SHOP_NAME').asstring);
             s4:=s4+QueryWork.fieldByname('SHOP_NAME').asstring+',';
             //s3:=s3+'%'+QueryWork.fieldByname('SHOP_ID').asstring+'%';
             QueryWork.Next;
         end;
       end
       else
       begin
             DualListDialog3.List2.Add(QueryWork.fieldByname('SHOP_NAME').asstring);
             s4:=s4+QueryWork.fieldByname('SHOP_NAME').asstring+',';
             //s3:=s3+'%'+QueryWork.fieldByname('SHOP_ID').asstring+'%';
       end;
//           end
//           else
//             DualListDialog3.List1.Add(QueryWork.fieldByname('SHOP_NAME').asstring);
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit2.text:=s4;
     SHOP_S:=s3;

//***********
     {Заполняем DualListDialog2}
     s4:='';
     s3:=' '+RVID_S+' ';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RVID_NAME,RVID_ID from RVID order by RVID_ID');
     DualListDialog2.Title:='Список видов реализации';
     DualListDialog2.List1.Clear;
     DualListDialog2.List2.Clear;
     while not QueryWork.eof do begin
           if pos(' '+QueryWork.fieldByname('RVID_ID').asstring+' ',s3)>0 then begin
              DualListDialog2.List2.Add(QueryWork.fieldByname('RVID_NAME').asstring);
              s4:=s4+QueryWork.fieldByname('RVID_NAME').asstring+',';
           end else DualListDialog2.List1.Add(QueryWork.fieldByname('RVID_NAME').asstring);
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Memo1.text:=s4;

{     SHOP2Click(Sender);
     SKL2Click(Sender);
     Tw2Click(Sender);
     if not CHECK_DOSTUP('$REPORT.TORG.PERS.SHOP') then begin
         SHOP2.checked:=true;
         SHOP2Click(Sender);
         DICSHOP.Value:=inttostr(SHOPID);
         DICSHOP.enabled:=False;
         SHOP1.enabled:=False;
         SHOP2.enabled:=False;
     end;        }
     VIDChange(Sender);
end;

procedure TPers_TORG.SKL2Click(Sender: TObject);
begin
     DicSKL.visible:=SKL2.checked;
end;

procedure TPers_TORG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrSHOP.close;
     QrSklad.close;
     DicTransaction.Active:=False;
     QueryWork.close;
     WorkTransaction.Active:=False;


        Datamodule3.QrTabel.close;
   Datamodule3.QrPers5.Close;
   Datamodule3.QrPers6.Close;
   Datamodule3.QrPers4.Close;
   Datamodule3.QrPers3.Close;
   Datamodule3.QrPers2.Close;
   Datamodule3.QrPersTorg.Close;
   Datamodule3.PersTorgTransaction.Active:=false;

end;

procedure TPers_TORG.Button1Click(Sender: TObject);
begin
     {Сохраняем установки}
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','PERS_TORG');
        IBSAVE_ADD('CFG_SET2',USERID);
        IBSAVE_ADD('CFG_SET1',1);
        IBSAVE_ADD('CFG_VALUE',SHOP_S);
        IBSAVE_DOC('CFG',PT_SHOP);
        IBSAVE_ADD('CFG_SET1',2);
        IBSAVE_ADD('CFG_VALUE',strtoint(DICSKL.value));
        IBSAVE_DOC('CFG',PT_SKL);
        IBSAVE_ADD('CFG_SET1',3);
        IBSAVE_ADD('CFG_VALUE',RNTYP_S);
        IBSAVE_DOC('CFG',PT_RNTYP);

        IBSAVE_ADD('CFG_SET1',31);
        IBSAVE_ADD('CFG_VALUE',PNTYP_S);
        IBSAVE_DOC('CFG',PT_PNTYP);

        IBSAVE_ADD('CFG_SET1',4);
        IBSAVE_ADD('CFG_VALUE',VID.itemindex+1);
        IBSAVE_DOC('CFG',PT_VID);
        IBSAVE_ADD('CFG_SET1',5);
        if SKL1.checked then IBSAVE_ADD('CFG_VALUE',1) else IBSAVE_ADD('CFG_VALUE',2);
        IBSAVE_DOC('CFG',PT_SKLC);
//        IBSAVE_ADD('CFG_SET1',6);
//        if SHOP1.checked then IBSAVE_ADD('CFG_VALUE',1) else IBSAVE_ADD('CFG_VALUE',2);
  //      IBSAVE_DOC('CFG',PT_SHOPC);
        IBSAVE_ADD('CFG_SET1',7);
        IBSAVE_ADD('CFG_VALUE',RVID_S);
        IBSAVE_DOC('CFG',PT_RVID);
        Datamodule1.IBTransaction2.Commit;
     Except
           Datamodule1.IBTransaction2.RollBack;
     End;
     Datamodule1.IBTransaction2.Active:=False;
end;

procedure TPers_TORG.Openquery(Print: boolean);
var
   S_BRAK:ansistring;
   OutFile:textfile;
   tw_summ,all_summ:double;
   twtree_id:integer;
begin
   if Brak1.checked and Brak2.checked then S_BRAK:=' ';
   if Brak1.checked and not Brak2.checked then S_BRAK:=' and TW_BRAK="0" ';
   if not Brak1.checked and Brak2.checked then S_BRAK:=' and not TW_BRAK="0" ';
   Button1.enabled:=False;
   BtnPrint.enabled:=False;
   Button3.enabled:=False;
   RNTYP_S:=trim(RNTYP_S);
   RVID_S:=trim(RVID_S);
   SHOP_S:=trim(SHOP_S);
   if (length(RNTYP_S)=0)  then begin
      Messbox('Отчёт пуст!',MessSystem,48);
   end else begin
      s:=' за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
      if TW1.checked then s:=s+', Все группы товаров'
                     else s:=s+', Группа товаров: '+TW.text;
      if SKL1.Checked then s:='со всех складов '+s
      else s:='со склада '+DicSKL.text+' '+s;
      s:='Магазинами: '+Edit2.text+', '+s;
      s:='Накладные: '+Edit1.text+', '+s;
      s:=s+', Виды реализации: '+trim(Memo1.text);
      if brak1.checked and not Brak2.checked then s:=s+', только товар хорошего качества';
      if not brak1.checked and Brak2.checked then s:=s+', только бракованный товар';
      s:=s+', категория товара: '+twktg.Text;
      if VID.itemindex < 6 then
        	s:= s + ', Клиент: '+KLN_NAME.Text;
      s:=s+', Фирма: '+FRM.Text;

     if VID.itemindex=0 then begin
        {Подробный отчёт о продажах}
        Datamodule3.PersTorgTransaction.Active:=false;
        Datamodule3.QrPersTorg.close;
        Datamodule3.QrPersTorg.SQL.Clear;
        Datamodule3.QrPersTorg.SQL.add('select PERS_TORG0.*,tw_kol*tw_money as tw_summ,tw_kol*nsp as tw_nsp,tw_kol*nds as tw_nds '+
        ' from PERS_TORG0(:shop_id,:skl_id,:dt1,:dt2,:twtree_id, :KLN_ID, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP, :TYP_KLN, :RNS_TABEL, :DIRECT_POST) '+
        ' where rntyp_id in ('+RNTYP_S+') and rvid_id in ('+RVID_S+') '+S_BRAK+' order by rn_date,tw_art');

        Datamodule3.QrPersTorg.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
        Datamodule3.QrPersTorg.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;

        Datamodule3.QrPersTorg.ParamByname('DT1').asdatetime:=DT1.date;
        Datamodule3.QrPersTorg.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
        if SKL1.Checked then Datamodule3.QrPersTorg.ParamByname('SKL_ID').asinteger:=0
        else Datamodule3.QrPersTorg.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);
//        if SHOP1.Checked then Datamodule3.QrPersTorg.ParamByname('SHOP_ID').asinteger:=0
//        else Datamodule3.QrPersTorg.ParamByname('SHOP_ID').asinteger:=strtoint(DicShop.value);

        Datamodule3.QrPersTorg.ParamByname('SHOP_ID').asstring:=SHOP_S;

        Datamodule3.QrPersTorg.ParamByname('KLN_ID').asinteger:=kln_group_id;
        Datamodule3.QrPersTorg.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);
        Datamodule3.QrPersTorg.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPersTorg.ParamByname('twktg_ID').asstring:=twktg.value;
        Datamodule3.QrPersTorg.ParamByname('typ_kln').asinteger:=kln_group_typ;
         if not chkTabel.checked then Datamodule3.QrPersTorg.ParamByname('RNS_TABEL').asinteger:=-1
                              else Datamodule3.QrPersTorg.ParamByname('RNS_TABEL').asinteger:=round(RNS_TABEL.value);
         if cbDirectPost.Checked then
          Datamodule3.QrPersTorg.ParamByname('DIRECT_POST').asinteger:=1
         else
          Datamodule3.QrPersTorg.ParamByname('DIRECT_POST').asinteger:=-1;
        Datamodule3.QrPersTorg.Open;
        if Datamodule3.QrPersTorg.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
             if Print then begin
             Pers1Title.lines.clear;
             Pers1Title.lines.add(s);
             PpPers1.reset;
             PpPers1.Print;
             end;
        end;

     end;

      if VID.itemindex=10 then begin
       {Агентский отчёт о продажах}
        Datamodule3.PersTorgTransaction.Active:=false;
        Datamodule3.QrPersTorg.close;
        Datamodule3.QrPersTorg.SQL.Clear;
        Datamodule3.QrPersTorg.SQL.add('select PERS_TORG_A.*,tw_kol*tw_money as tw_summ,tw_kol*nsp as tw_nsp,tw_kol*nds as tw_nds '+
        ' from PERS_TORG_A(:shop_id,:skl_id,:dt1,:dt2,:twtree_id, :KLN_ID, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP, :TYP_KLN, :RNS_TABEL, :DIRECT_POST) '+
        ' where rntyp_id in ('+RNTYP_S+') and rvid_id in ('+RVID_S+') '+S_BRAK+' order by rn_date,tw_art');

        Datamodule3.QrPersTorg.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
        Datamodule3.QrPersTorg.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;

        Datamodule3.QrPersTorg.ParamByname('DT1').asdatetime:=DT1.date;
        Datamodule3.QrPersTorg.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
        if SKL1.Checked then Datamodule3.QrPersTorg.ParamByname('SKL_ID').asinteger:=0
        else Datamodule3.QrPersTorg.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);
//        if SHOP1.Checked then Datamodule3.QrPersTorg.ParamByname('SHOP_ID').asinteger:=0
//        else Datamodule3.QrPersTorg.ParamByname('SHOP_ID').asinteger:=strtoint(DicShop.value);

        Datamodule3.QrPersTorg.ParamByname('SHOP_ID').asstring:=SHOP_S;

        Datamodule3.QrPersTorg.ParamByname('KLN_ID').asinteger:=kln_group_id;
        Datamodule3.QrPersTorg.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);
        Datamodule3.QrPersTorg.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPersTorg.ParamByname('twktg_ID').asstring:=twktg.value;
        Datamodule3.QrPersTorg.ParamByname('typ_kln').asinteger:=kln_group_typ;
        if not chkTabel.checked then Datamodule3.QrPersTorg.ParamByname('RNS_TABEL').asinteger:=-1
                            else Datamodule3.QrPersTorg.ParamByname('RNS_TABEL').asinteger:=round(RNS_TABEL.value);
        if cbDirectPost.Checked then
         Datamodule3.QrPersTorg.ParamByname('DIRECT_POST').asinteger:=1
        else
         Datamodule3.QrPersTorg.ParamByname('DIRECT_POST').asinteger:=-1;

        Datamodule3.QrPersTorg.Open;
        if Datamodule3.QrPersTorg.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
             if Print then begin
             Pers10Title.lines.clear;
             Pers10Title.lines.add(s);
             PpPers10.reset;
             PpPers10.Print;
             end;
        end;

     end;

     if VID.itemindex=1 then begin
        {Суммарный отчёт о продажах}
        Datamodule3.PersTorgTransaction.Active:=false;
        Datamodule3.QrPers2.close;
        Datamodule3.QrPers2.SQL.Clear;
        Datamodule3.QrPers2.SQL.add('select tw_id,tw_art,tw_nam,sum(tw_kol) as tw_kol,sum(tw_kol*tw_weight) as tw_weight ,sum(tw_kol*tw_money) as tw_summ,sum(tw_kol*nsp) as tw_nsp,sum(tw_kol*nds) as tw_nds , avg(tw_seb) tw_seb, avg(tw_money) tW_money '+
        ' from PERS_TORG0(:shop_id,:skl_id,:dt1,:dt2,:twtree_id, :KLN_ID, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP, :TYP_KLN, :RNS_TABEL, :DIRECT_POST) where rntyp_id in ('+RNTYP_S+') '+
        ' and rvid_id in ('+RVID_S+') '+S_BRAK+
        ' group by tw_id,tw_art,tw_nam order by tw_nam ');
        Datamodule3.QrPers2.ParamByname('DT1').asdatetime:=DT1.date;
        Datamodule3.QrPers2.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
        Datamodule3.QrPers2.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
        Datamodule3.QrPers2.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;
        if SKL1.Checked then Datamodule3.QrPers2.ParamByname('SKL_ID').asinteger:=0
        else Datamodule3.QrPers2.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);
//        if SHOP1.Checked then Datamodule3.QrPers2.ParamByname('SHOP_ID').asinteger:=0
  //      else Datamodule3.QrPers2.ParamByname('SHOP_ID').asinteger:=strtoint(DicShop.value);
        Datamodule3.QrPers2.ParamByname('SHOP_ID').asstring:=SHOP_S;
        Datamodule3.QrPers2.ParamByname('KLN_ID').asinteger:=kln_group_id;
        Datamodule3.QrPers2.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);
        Datamodule3.QrPers2.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPers2.ParamByname('twktg_ID').asstring:=twktg.value;
        Datamodule3.QrPers2.ParamByname('typ_kln').asinteger:=kln_group_typ;
        if not chkTabel.checked then Datamodule3.QrPers2.ParamByname('RNS_TABEL').asinteger:=-1
                            else Datamodule3.QrPers2.ParamByname('RNS_TABEL').asinteger:=round(RNS_TABEL.value);
        if cbDirectPost.Checked then
         Datamodule3.QrPers2.ParamByname('DIRECT_POST').asinteger:=1
        else
         Datamodule3.QrPers2.ParamByname('DIRECT_POST').asinteger:=-1;

        Datamodule3.QrPers2.Open;
        if Datamodule3.QrPers2.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
            if Print then begin
              Pers2Title.lines.clear;
              Pers2Title.lines.add(s);
              PpPers2.reset;
              PpPers2.Print;
            end;
        end;
     end;
     if VID.itemindex=3 then begin
        {Итоговый отчёт о продажах}
        Datamodule3.PersTorgTransaction.Active:=false;
        Datamodule3.QrPers3.close;
        Datamodule3.QrPers3.SQL.Clear;
        Datamodule3.QrPers3.SQL.add('select sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as tw_nds,shop_name, sum(PO_SUMM) as PO_SUMM '+
        ' from PERS_TORG2(:shop_id,:skl_id,:dt1,:dt2,:twtree_id, :KLN_ID, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP, :TYP_KLN, :RNS_TABEL, :DIRECT_POST) where rntyp_id in ('+RNTYP_S+') and rvid_id in ('+RVID_S+') '+S_BRAK+
        ' group by shop_name order by shop_name ');
        Datamodule3.QrPers3.ParamByname('DT1').asdatetime:=DT1.date;
        Datamodule3.QrPers3.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
        Datamodule3.QrPers3.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
        Datamodule3.QrPers3.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;

        if SKL1.Checked then Datamodule3.QrPers3.ParamByname('SKL_ID').asinteger:=0
        else Datamodule3.QrPers3.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);
//        if SHOP1.Checked then Datamodule3.QrPers3.ParamByname('SHOP_ID').asinteger:=0
  //      else Datamodule3.QrPers3.ParamByname('SHOP_ID').asinteger:=strtoint(DicShop.value);
        Datamodule3.QrPers3.ParamByname('SHOP_ID').asstring:=SHOP_S;
        Datamodule3.QrPers3.ParamByname('KLN_ID').asinteger:=kln_group_id;
        Datamodule3.QrPers3.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);
        Datamodule3.QrPers3.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPers3.ParamByname('twktg_ID').asstring:=twktg.value;
        Datamodule3.QrPers3.ParamByname('typ_kln').asinteger:=kln_group_typ;
        if not chkTabel.checked then Datamodule3.QrPers3.ParamByname('RNS_TABEL').asinteger:=-1
                            else Datamodule3.QrPers3.ParamByname('RNS_TABEL').asinteger:=round(RNS_TABEL.value);
        if cbDirectPost.Checked then
         Datamodule3.QrPers3.ParamByname('DIRECT_POST').asinteger:=1
        else
         Datamodule3.QrPers3.ParamByname('DIRECT_POST').asinteger:=-1;

        Datamodule3.QrPers3.Open;
        if Datamodule3.QrPers3.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
           if Print then begin
             Pers3Title.lines.clear;
             Pers3Title.lines.add(s);
             PpPers3.reset;
             PpPers3.Print;
           end;
        end;
     end;
     if VID.itemindex=2 then begin
        {Групповой отчёт о продажах}
        Datamodule3.PersTorgTransaction.Active:=false;
        Datamodule3.QrPers4.close;
        Datamodule3.QrPers4.SQL.Clear;
        Datamodule3.QrPers4.SQL.add('select twtree_id,twtree_full,sum(tw_kol*tw_money) as tw_summ, sum(tw_kol*tw_weight) as tw_weight,sum(tw_kol*nds) as tw_nds,sum(tw_kol*nsp) as tw_nsp '+
        'from PERS_TORG1(:shop_id,:skl_id,:dt1,:dt2,:twtree_id, :KLN_ID, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP, :TYP_KLN, :RNS_TABEL, :DIRECT_POST) '+
        'where rntyp_id in ('+RNTYP_S+') and rvid_id in ('+RVID_S+') '+S_BRAK+
        ' group by twtree_id,twtree_full order by twtree_full ');
        Datamodule3.QrPers4.ParamByname('DT1').asdatetime:=DT1.date;
        Datamodule3.QrPers4.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
        Datamodule3.QrPers4.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
        Datamodule3.QrPers4.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;
        if SKL1.Checked then Datamodule3.QrPers4.ParamByname('SKL_ID').asinteger:=0
        else Datamodule3.QrPers4.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);
//        if SHOP1.Checked then Datamodule3.QrPers4.ParamByname('SHOP_ID').asinteger:=0
  //      else Datamodule3.QrPers4.ParamByname('SHOP_ID').asinteger:=strtoint(DicShop.value);
        Datamodule3.QrPers4.ParamByname('SHOP_ID').asstring:=SHOP_S;
        Datamodule3.QrPers4.ParamByname('KLN_ID').asinteger:=kln_group_id;
        Datamodule3.QrPers4.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);
        Datamodule3.QrPers4.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPers4.ParamByname('twktg_ID').asstring:=twktg.value;
        Datamodule3.QrPers4.ParamByname('typ_kln').asinteger:=kln_group_typ;
        if not chkTabel.checked then Datamodule3.QrPers4.ParamByname('RNS_TABEL').asinteger:=-1
                            else Datamodule3.QrPers4.ParamByname('RNS_TABEL').asinteger:=round(RNS_TABEL.value);
        if cbDirectPost.Checked then
         Datamodule3.QrPers4.ParamByname('DIRECT_POST').asinteger:=1
        else
         Datamodule3.QrPers4.ParamByname('DIRECT_POST').asinteger:=-1;

        Datamodule3.QrPers4.Open;
        if Datamodule3.QrPers4.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
            if Print then begin
             Pers4Title.lines.clear;
             Pers4Title.lines.add(s);
             PpPers4.reset;
             PpPers4.Print;
           end;
        end;
     end;
     if VID.itemindex=4 then begin
        {По видам реализации}
        Datamodule3.PersTorgTransaction.Active:=false;
        Datamodule3.QrPers5.close;
        Datamodule3.QrPers5.SQL.Clear;
        Datamodule3.QrPers5.SQL.add('select sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as tw_nds,rvid_name '+
        ' from PERS_TORG2(:shop_id,:skl_id,:dt1,:dt2,:twtree_id, :KLN_ID, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP, :TYP_KLN, :RNS_TABEL, :DIRECT_POST) where rntyp_id in ('+RNTYP_S+') and rvid_id in ('+RVID_S+') '+S_BRAK+
        ' group by rvid_id,rvid_name order by rvid_name ');
        Datamodule3.QrPers5.ParamByname('DT1').asdatetime:=DT1.date;
        Datamodule3.QrPers5.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
        Datamodule3.QrPers5.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
        Datamodule3.QrPers5.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;
        if SKL1.Checked then Datamodule3.QrPers5.ParamByname('SKL_ID').asinteger:=0
        else Datamodule3.QrPers5.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);
//        if SHOP1.Checked then Datamodule3.QrPers5.ParamByname('SHOP_ID').asinteger:=0
  //      else Datamodule3.QrPers5.ParamByname('SHOP_ID').asinteger:=strtoint(DicShop.value);
        Datamodule3.QrPers5.ParamByname('SHOP_ID').asstring:=SHOP_S;
        Datamodule3.QrPers5.ParamByname('KLN_ID').asinteger:=kln_group_id;
        Datamodule3.QrPers5.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);
        Datamodule3.QrPers5.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPers5.ParamByname('twktg_ID').asstring:=twktg.value;
        Datamodule3.QrPers5.ParamByname('typ_kln').asinteger:=kln_group_typ;
        if not chkTabel.checked then Datamodule3.QrPers5.ParamByname('RNS_TABEL').asinteger:=-1
                            else Datamodule3.QrPers5.ParamByname('RNS_TABEL').asinteger:=round(RNS_TABEL.value);
        if cbDirectPost.Checked then
         Datamodule3.QrPers5.ParamByname('DIRECT_POST').asinteger:=1
        else
         Datamodule3.QrPers5.ParamByname('DIRECT_POST').asinteger:=-1;
        Datamodule3.QrPers5.Open;
        if Datamodule3.QrPers5.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
           if Print then begin
             Pers5Title.lines.clear;
             Pers5Title.lines.add(s);
             PpPers5.reset;
             PpPers5.Print;
           end;
        end;
     end;
     if VID.itemindex=5 then begin
        {По табельным номерам}
        Datamodule3.PersTorgTransaction.Active:=false;
        Datamodule3.QrTabel.close;
        Datamodule3.QrTabel.open;
        Datamodule3.QrPers6.close;
        Datamodule3.QrPers6.SQL.Clear;
        Datamodule3.QrPers6.SQL.add('select count(*) as cnt,sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as tw_nds,rns_tabel , sum(nac) nac'+
        ' from PERS_TORG3(:shop_id,:skl_id,:dt1,:dt2,:twtree_id, :KLN_ID, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP, :TYP_KLN, :RNS_TABEL, :DIRECT_POST) where rntyp_id in ('+RNTYP_S+') and rvid_id in ('+RVID_S+') '+S_BRAK+
        ' group by rns_tabel order by rns_tabel ');
        Datamodule3.QrPers6.ParamByname('DT1').asdatetime:=DT1.date;
        Datamodule3.QrPers6.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
        Datamodule3.QrPers6.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
        Datamodule3.QrPers6.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;
        if SKL1.Checked then Datamodule3.QrPers6.ParamByname('SKL_ID').asinteger:=0
        else Datamodule3.QrPers6.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);
//        if SHOP1.Checked then Datamodule3.QrPers6.ParamByname('SHOP_ID').asinteger:=0
  //      else Datamodule3.QrPers6.ParamByname('SHOP_ID').asinteger:=strtoint(DicShop.value);
        Datamodule3.QrPers6.ParamByname('SHOP_ID').asstring:=SHOP_S;
        Datamodule3.QrPers6.ParamByname('KLN_ID').asinteger:=kln_group_id;
        Datamodule3.QrPers6.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);
        Datamodule3.QrPers6.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPers6.ParamByname('twktg_ID').asstring:=twktg.value;
        Datamodule3.QrPers6.ParamByname('typ_kln').asinteger:=kln_group_typ;
        if not chkTabel.checked then Datamodule3.QrPers6.ParamByname('RNS_TABEL').asinteger:=-1
                            else Datamodule3.QrPers6.ParamByname('RNS_TABEL').asinteger:=round(RNS_TABEL.value);
        if cbDirectPost.Checked then
         Datamodule3.QrPers6.ParamByname('DIRECT_POST').asinteger:=1
        else
         Datamodule3.QrPers6.ParamByname('DIRECT_POST').asinteger:=-1;
        Datamodule3.QrPers6.Open;
        if Datamodule3.QrPers6.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
             // Запрашиваем список табельных номеров
             if Print then begin
             Pers6Title.lines.clear;
             Pers6Title.lines.add(s);
             PpPers6.reset;
             PpPers6.Print;
             end;
        end;
     end;

     if VID.itemindex=11 then begin
        {По табельным номерам с наценкой}
        Datamodule3.PersTorgTransaction.Active:=false;
        Datamodule3.QrTabel.close;
        Datamodule3.QrTabel.open;
        Datamodule3.QrPers6.close;
        Datamodule3.QrPers6.SQL.Clear;
        Datamodule3.QrPers6.SQL.add('select count(*) as cnt,sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as tw_nds,rns_tabel, sum(nac) as nac '+
        ' from PERS_TORG3(:shop_id,:skl_id,:dt1,:dt2,:twtree_id, :KLN_ID, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP, :TYP_KLN, :RNS_TABEL, :DIRECT_POST) where rntyp_id in ('+RNTYP_S+') and rvid_id in ('+RVID_S+') '+S_BRAK+
        ' group by rns_tabel order by rns_tabel ');
        Datamodule3.QrPers6.ParamByname('DT1').asdatetime:=DT1.date;
        Datamodule3.QrPers6.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
        Datamodule3.QrPers6.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
        Datamodule3.QrPers6.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;
        if SKL1.Checked then Datamodule3.QrPers6.ParamByname('SKL_ID').asinteger:=0
        else Datamodule3.QrPers6.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);
//        if SHOP1.Checked then Datamodule3.QrPers6.ParamByname('SHOP_ID').asinteger:=0
  //      else Datamodule3.QrPers6.ParamByname('SHOP_ID').asinteger:=strtoint(DicShop.value);
        Datamodule3.QrPers6.ParamByname('SHOP_ID').asstring:=SHOP_S;
        Datamodule3.QrPers6.ParamByname('KLN_ID').asinteger:=kln_group_id;
        Datamodule3.QrPers6.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);
        Datamodule3.QrPers6.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPers6.ParamByname('twktg_ID').asstring:=twktg.value;
        Datamodule3.QrPers6.ParamByname('typ_kln').asinteger:=kln_group_typ;
        if not chkTabel.checked then Datamodule3.QrPers6.ParamByname('RNS_TABEL').asinteger:=-1
                            else Datamodule3.QrPers6.ParamByname('RNS_TABEL').asinteger:=round(RNS_TABEL.value);
        if cbDirectPost.Checked then
         Datamodule3.QrPers6.ParamByname('DIRECT_POST').asinteger:=1
        else
         Datamodule3.QrPers6.ParamByname('DIRECT_POST').asinteger:=-1;
        Datamodule3.QrPers6.Open;
        if Datamodule3.QrPers6.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
             // Запрашиваем список табельных номеров
             if Print then begin
             Pers11Title.lines.clear;
             Pers11Title.lines.add(s);
             PpPers11.reset;
             PpPers11.Print;
             end;
        end;
     end;

//Сторожев Игорь - для накладной внутреннего перемещения (28.04.2004)
     if VID.itemindex=6 then begin
        {накладная внутреннего перемещения}
        Datamodule3.PersTorgTransaction.Active:=false;
        Datamodule3.QrPers7.close;
        Datamodule3.QrPers7.SQL.Clear;
//        select TW_NAM, TW_ART, ED_SHORT, TW_KOL
//from PERS_TORG0(:shop_id,:skl_id,:dt1,:dt2,:twtree_id)
        Datamodule3.QrPers7.SQL.add('select tw_nam, min(tw_art) AS ART, min(ed_short) as ED, roundd(sum(bg_abs(tw_kol)), 3)  AS KOL  '+
        ' from PERS_TORG0(:shop_id,:skl_id,:dt1,:dt2,:twtree_id, :KLN_ID, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP, :TYP_KLN) '+
        ' where rntyp_id in ('+RNTYP_S+') and rvid_id in ('+RVID_S+') '+S_BRAK+' group by tw_nam order by tw_nam');
        Datamodule3.QrPers7.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
        Datamodule3.QrPers7.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;

        Datamodule3.QrPers7.ParamByname('DT1').asdatetime:=DT1.date;
        Datamodule3.QrPers7.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
        if SKL1.Checked then Datamodule3.QrPers7.ParamByname('SKL_ID').asinteger:=0
        else Datamodule3.QrPers7.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);
//        if SHOP1.Checked then Datamodule3.QrPers7.ParamByname('SHOP_ID').asinteger:=0
  //      else Datamodule3.QrPers7.ParamByname('SHOP_ID').asinteger:=strtoint(DicShop.value);
        Datamodule3.QrPers7.ParamByname('SHOP_ID').asstring:=SHOP_S;
        Datamodule3.QrPers7.ParamByname('KLN_ID').asinteger:=0;
        Datamodule3.QrPers7.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);
        Datamodule3.QrPers7.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPers7.ParamByname('twktg_ID').asstring:=twktg.value;
        Datamodule3.QrPers7.ParamByname('TYP').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPers7.ParamByname('TYP_KLN').asinteger:=4;
        Datamodule3.QrPers7.Open;

        if Datamodule3.QrPers7.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
//        Pers7Title.lines.clear;
//        Pers7Title.lines.add(s);
          if Print then begin
          PpPers7.reset;
          PpPers7.Print;
          end;
        end;
     end;
//Сторожев Игорь - для отчета коррекции НДС (28.04.2004)
     if VID.ItemIndex=7 then begin
     {Дополнительная отчетность по НДС}
     WorkTransaction.Active:=False;
     ReportRN.close;
     ReportRN.SQL.Clear;
     ReportRN.SQL.Add('select * from check_rn_1(:dt1,:dt2, :shop_id, :FRM_ID)  where rntyp_id in ('+RNTYP_S+')');
     ReportRN.paramByname('dt1').asdatetime:=dt1.date;
     ReportRN.paramByname('dt2').asdatetime:=dt2.date+1-sekond1;
//     if SHOP1.Checked then ReportRN.ParamByname('SHOP_ID').asinteger:=0
  //   else  ReportRN.paramByname('shop_id').asinteger:= strtoint(DicShop.Value);
     ReportRN.ParamByname('SHOP_ID').asstring:=SHOP_S;
     ReportRN.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);



        ReportRN.Open;
        if Print then begin
          RN.showReport;
        end;
     end;

     if VID.itemindex=8 then begin
        {По кассирам}
        Datamodule3.PersTorgTransaction.Active:=false;
        Datamodule3.QrTabel.close;
        Datamodule3.QrTabel.open;
        Datamodule3.QrPers8.close;
        Datamodule3.QrPers8.SQL.Clear;
        Datamodule3.QrPers8.SQL.add(' select count(*) as cnt,sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as tw_nds, kln.kln_id, kln.kln_kkm_password '+
'from PERS_TORG4(:shop_id, :skl_id, :dt1, :dt2, :twtree_id, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP) '+
'left join kln on kln.kln_id = PERS_TORG4.kassir_id '+
'where rntyp_id in ('+RNTYP_S+') and rvid_id in ('+RVID_S+') '+S_BRAK+
'group by kln.kln_id, kln.kln_kkm_password');
        Datamodule3.QrPers8.ParamByname('DT1').asdatetime:=DT1.date;
        Datamodule3.QrPers8.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
        Datamodule3.QrPers8.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
        Datamodule3.QrPers8.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;

        if SKL1.Checked then Datamodule3.QrPers8.ParamByname('SKL_ID').asinteger:=0
        else Datamodule3.QrPers8.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);
//        if SHOP1.Checked then Datamodule3.QrPers8.ParamByname('SHOP_ID').asinteger:=0
  //      else Datamodule3.QrPers8.ParamByname('SHOP_ID').asinteger:=strtoint(DicShop.value);
//        if SHOP_S='' then Datamodule3.QrPersTorg.ParamByname('SHOP_ID').asstring:='0'
        Datamodule3.QrPers8.ParamByname('SHOP_ID').asstring:=SHOP_S;
        Datamodule3.QrPers8.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);
        Datamodule3.QrPers8.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPers8.ParamByname('twktg_ID').asstring:=twktg.value;
        Datamodule3.QrPers8.Open;
        if Datamodule3.QrPers8.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
             // Запрашиваем список табельных номеров
            if Print then begin
             Pers8Title.lines.clear;
             Pers8Title.lines.add(s);
             PpPers8.reset;
             PpPers8.Print;
            end;
        end;
     end;


     if VID.itemindex=9 then begin
        {По кассирам}
        Datamodule3.PersTorgTransaction.Active:=false;
        Datamodule3.QrTabel.close;
        Datamodule3.QrTabel.open;
        Datamodule3.QrPers9.close;
        Datamodule3.QrPers9.SQL.Clear;
        Datamodule3.QrPers9.SQL.add('select count(*) as cnt,sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as tw_nds, pers_torg4.kassa_id, list_kkm.kkm_name '+
'from PERS_TORG4(:shop_id, :skl_id, :dt1, :dt2, :twtree_id, :FRM_ID, :USER_ID, :twktg_id, :TWTREE_TYP) '+
'left join list_kkm on (list_kkm.cfg_id = PERS_TORG4.kassa_id and not pers_torg4.kassa_id is null) '+
'where rntyp_id in ('+RNTYP_S+') and rvid_id in ('+RVID_S+') '+S_BRAK+
'group by pers_torg4.kassa_id, list_kkm.kkm_name');
        Datamodule3.QrPers9.ParamByname('DT1').asdatetime:=DT1.date;
        Datamodule3.QrPers9.ParamByname('DT2').asdatetime:=DT2.date+1-sekond1;
        Datamodule3.QrPers9.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
        Datamodule3.QrPers9.ParamByname('TWTREE_TYP').asinteger:=tw_group_typ;

        if SKL1.Checked then Datamodule3.QrPers9.ParamByname('SKL_ID').asinteger:=0
        else Datamodule3.QrPers9.ParamByname('SKL_ID').asinteger:=strtoint(DicSkl.value);
//        if SHOP1.Checked then Datamodule3.QrPers9.ParamByname('SHOP_ID').asinteger:=0
  //      else Datamodule3.QrPers9.ParamByname('SHOP_ID').asinteger:=strtoint(DicShop.value);
//        if SHOP_S='' then Datamodule3.QrPersTorg.ParamByname('SHOP_ID').asstring:='0'
        Datamodule3.QrPers9.ParamByname('SHOP_ID').asstring:=SHOP_S;
        Datamodule3.QrPers9.ParamByname('FRM_ID').asinteger:=strtoint(frm.value);
        Datamodule3.QrPers9.ParamByname('USER_ID').asinteger:=USER_NAME.Tag;
        Datamodule3.QrPers9.ParamByname('twktg_ID').asstring:=twktg.value;
        Datamodule3.QrPers9.Open;
        if Datamodule3.QrPers9.eof then Messbox('Отчёт пуст!',MessSystem,48) else begin
             // Запрашиваем список табельных номеров
            if Print then begin
             Pers9Title.lines.clear;
             Pers9Title.lines.add(s);
             PpPers9.reset;
             PpPers9.Print;
            end;
        end;
     end;






   end;
//   Datamodule3.QrTabel.close;
//   Datamodule3.QrPers5.Close;
//   Datamodule3.QrPers6.Close;
//   Datamodule3.QrPers4.Close;
//   Datamodule3.QrPers3.Close;
//   Datamodule3.QrPers2.Close;
//   Datamodule3.QrPersTorg.Close;
//   Datamodule3.PersTorgTransaction.Active:=false;
   Button1.enabled:=True;
   BtnPrint.enabled:=True;
   Button3.enabled:=True;
end;

procedure TPers_TORG.BitBtn1Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     s:='';
     s2:='';
     if DualListDialog1.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog1.list2.Count do begin
            if QueryWork.Locate('RNTYP_SHORT',DualListDialog1.List2.Strings[a-1],[])
            then begin
                 s:=s+' '+QueryWork.fieldByname('RNTYP_ID').asstring+',';
                 s2:=s2+' '+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
            end;
        end;
        if length(s)>0 then s:=B_utils.left(s,length(s)-1);
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        RNTYP_S:=s;
        Edit1.text:=s2;
     end;
end;

procedure TPers_TORG.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpPers3User.Caption:=USERFIO_SHORT;
     PpPers3Vers.caption:=PROG_VERSION;
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPers_TORG.PpPers3PreviewFormCreate(Sender: TObject);
begin
     ppPers3.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPers_TORG.ppTitleBand2BeforeGenerate(Sender: TObject);
begin
     PpPers2User.Caption:=USERFIO_SHORT;
     PpPers2Vers.caption:=PROG_VERSION;
     try
       Ppimage3.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPers_TORG.PpPers2PreviewFormCreate(Sender: TObject);
begin
     ppPers2.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPers_TORG.PpPers1PreviewFormCreate(Sender: TObject);
begin
     ppPers1.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPers_TORG.ppTitleBand3BeforeGenerate(Sender: TObject);
begin
     PpPers1User.Caption:=USERFIO_SHORT;
     PpPers1Vers.caption:=PROG_VERSION;
     try
       Ppimage5.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPers_TORG.PpPers4PreviewFormCreate(Sender: TObject);
begin
     ppPers4.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPers_TORG.ppTitleBand4BeforeGenerate(Sender: TObject);
begin
     PpPers4User.Caption:=USERFIO_SHORT;
     PpPers4Vers.caption:=PROG_VERSION;
     try
       Ppimage7.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPers_TORG.BtnTWClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     if tw_group_typ=3 then
       DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       tw2.Checked:=true;
       tw_group_id:=DIC_TOWAR.tag;
       tw_group_typ:=3;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
     end;
end;

procedure TPers_TORG.TW2Click(Sender: TObject);
begin
   if TW1.Checked=true
     then
     begin
          tw.Text:= 'Все товары';
          tw_group_id:=0;
          tw_group_typ:=3
     end;
end;

procedure TPers_TORG.BRAK1Click(Sender: TObject);
begin
  if (Not Brak1.checked) and (not Brak2.checked) then Brak1.checked:=true;
end;

procedure TPers_TORG.BitBtn2Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RVID_NAME,RVID_ID from RVID order by RVID_NAME');
     s:='';
     s2:='';
     if DualListDialog2.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog2.list2.Count do begin
            if QueryWork.Locate('RVID_NAME',DualListDialog2.List2.Strings[a-1],[])
            then begin
                 s:=s+' '+QueryWork.fieldByname('RVID_ID').asstring+',';
                 s2:=s2+' '+QueryWork.fieldByname('RVID_NAME').asstring+',';
            end;
        end;
        if length(s)>0 then s:=B_utils.left(s,length(s)-1);
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        RVID_S:=s;
        Memo1.text:=s2;
     end;
end;

procedure TPers_TORG.PPPers5PreviewFormCreate(Sender: TObject);
begin
     ppPers5.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPers_TORG.ppTitleBand5BeforeGenerate(Sender: TObject);
begin
     PpPers5User.Caption:=USERFIO_SHORT;
     PpPers5Vers.caption:=PROG_VERSION;
     try
       Ppimage9.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;



procedure TPers_TORG.VIDChange(Sender: TObject);
begin
   btnPrint.Enabled:=true;
   btnExcel.Enabled:=true;

   case vid.itemindex of
   0, 1, 2,3,4, 5, 10, 11:
    BtnExcel.enabled:=true;
   else
    BtnExcel.enabled:=false;
   end;


   if vid.itemindex=10 then
   begin



     if not CHECK_DOSTUP('$REPORT.TORG.PERS.DOGOVOR_AGENTA') then
     begin
       btnPrint.Enabled:=false;
       btnExcel.Enabled:=false;
     end;
   end;

   if vid.itemindex<>10 then
   begin

   end;

    if vid.itemindex=11 then
     if not CHECK_DOSTUP('$REPORT.TORG.PERS.TABEL_NACENKA') then
     begin
      btnPrint.Enabled:=false;
      btnExcel.Enabled:=false;
     end;






   if VID.itemindex<0 then VID.itemindex:=0;
   if ((VID.ItemIndex < 6) or (VID.ItemIndex >7) )  then
          gbKln.Visible:=true
      else
      begin
      	gbKln.Visible:=false;
        KLN_NAME.Tag:=0;
      end;

   if ((VID.ItemIndex > 5)  and (vid.ItemIndex < 8 ))then
   begin
     DT3.Visible:=true;
     label6.Visible:=true;

//     if vid.ItemIndex <> 7  then
  //     shop2.Checked:=true;

//     shop1.Enabled:=false;
     skl2.Checked:=true;
     skl1.Enabled:=false;
     if VID.ItemIndex> 6 then
     begin
//     shop1.Enabled:=true;

     skl1.Checked:=true;
     skl1.Enabled:=true;
     skl2.Enabled:=false;
     BRAK1.VISIBLE:=FALSE;
     BRAK2.Visible:=FALSE;
     TW2.Enabled:=FALSE;
     Label4.Visible:=FALSE;
     MEmo1.Visible:=false;
     BitBtn2.Visible:=false;


     end;

   end
   else
   begin
     DT3.Visible:=false; label6.Visible:=false;
//     shop1.Checked:=true;
//   shop1.Enabled:=true;


   if not CHECK_DOSTUP('$REPORT.TORG.PERS.SHOP') then begin
//         SHOP2.checked:=true;
  //       SHOP2Click(Sender);
//         DICSHOP.Value:=inttostr(SHOPID);
//         SHOP_S:=inttostr(SHOPID);
//         DICSHOP.enabled:=False;
  //       SHOP1.enabled:=False;
    //     SHOP2.enabled:=False;
     end ;
//     else shop1.Enabled := true;


     skl2.enabled:=true;
     skl1.Enabled:=true;
     BRAK1.Visible:=TRUE;
     BRAK2.visible:=TRUE;
     TW2.Enabled:=TRUE;

   end;
   if ((VID.ItemIndex <= 6) or (vid.itemindex >= 8)) then
     begin
     BRAK1.VISIBLE:=true;
     BRAK2.Visible:=true;
     Label4.Visible:=true;
     MEmo1.Visible:=true;
     BitBtn2.Visible:=true;
     skl2.Enabled:=true;
     TW2.enabled:=true;


     end;
end;

procedure TPers_TORG.PPPers6PreviewFormCreate(Sender: TObject);
begin
     ppPers6.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPers_TORG.ppPers7PreviewFormCreate(Sender: TObject);
begin
     ppPers7.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPers_TORG.RNGetValue(const ParName: String;
  var ParValue: Variant);
begin
    if ParName='REPTITLE' then
    ParValue:='Отчет коррекции НДС. Фирма '+FRM.Text +'. Составлен '+date_sokr(dt3.date)+' Период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);

end;

procedure TPers_TORG.ppTitleBand7BeforeGenerate(Sender: TObject);
var skl: integer;

begin
//сторожев Игорь  - для накладной внутреннего перемещения (28.04.2004)
     ppLabel180.Caption:='Накладную оформил '+ USERFIO_SHORT;
     ppRNDate.Caption :=  date_sokr(dt3.date);
     ppLabel113.Caption:= dt3.Text;
     ppLabel114.Caption:= dt3.Text;
//     ppSystemVariable19. := dt3.date;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_SKLAD" and CFG_SET1='+SHOP_S);
     DataModule1.IbGetDefault.Open;
     skl := DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;

     qrSKLAD1.Close;
     qrSKLAD1.ParamByName('sklid').asinteger := strtoint(DicSkl.Value);
     qrSKLAD1.Open;

     ppSKLADFULL.Caption := qrSKLAD1.fieldByName('SKL_FULL').asstring;


     if qrSKLAD1.fieldbyname('SKL_ADR').asstring <> '' then
        ppSKLADFULL.Caption := ppSKLADFULL.Caption + ', Адрес: ' + qrSKLAD1.fieldbyname('SKL_ADR').asstring;
     if qrSKLAD1.fieldbyname('SKL_TEL').asstring <> '' then
        ppSKLADFULL.Caption := ppSKLADFULL.Caption + ', Тел.: ' + qrSKLAD1.fieldbyname('SKL_TEL').asstring;
     if qrSKLAD1.fieldbyname('SKL_TIME').asstring <> '' then
        ppSKLADFULL.Caption := ppSKLADFULL.Caption + ', Время работы: ' + qrSKLAD1.fieldbyname('SKL_TIME').asstring;



//     qrFIRM.Close;
//     qrFIRM.ParamByName('kln_id').asinteger := SHOP_FRM_DEFAULT(strtoint(dicshop.value),2);
//     qrFIRM.Open;
//     ppFIRMFULL.Caption := qrFIRM.fieldByName('KLN_FULL').asstring;
     ppFIRMFULL.Caption:= QrShop.fieldbyname('SHOP_NAME').asstring;


     qrSKLAD1.Close;
//     PpPers7Vers.caption:=PROG_VERSION;
     try
       Ppimage6.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPers_TORG.PPPers8PreviewFormCreate(Sender: TObject);
begin
     ppPers8.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPers_TORG.ppPers9PreviewFormCreate(Sender: TObject);
begin
     ppPers9.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPers_TORG.ppTitleBand8BeforeGenerate(Sender: TObject);
begin
     PpPers8User.Caption:=USERFIO_SHORT;
     PpPers8Vers.caption:=PROG_VERSION;
     try
       ppImage4.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPers_TORG.ppTitleBand9BeforeGenerate(Sender: TObject);
begin
     PpPers9User.Caption:=USERFIO_SHORT;
     PpPers9Vers.caption:=PROG_VERSION;
     try
       ppImage8.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPers_TORG.BTN_KLNClick(Sender: TObject);
var fr: integer;
begin
//     DicKlnSet:=2; {Выбор клиента}
     DicKlnSet:=5;
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:= kln_group_id;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<> kln_group_id then
       begin
        kln2.checked:=true;       
//        KLN_NAME.tag:=DIC_KLIENT.tag;
        kln_group_id:=DIC_KLIENT.tag;
        if Activ=1 then
          fr:=1
        else
          fr:=strtoint(DIC_KLIENT.IbQrDicKLN.FieldByName('TREE').asstring);


         IbQuery1.Close;
    	 IbQuery1.SQL.clear;
         if fr=0 then
         begin
           IbQuery1.SQL.add('select KLN_FULL,KLN_REKW FROM KLN_DATA(:KLN_ID)');
           kln_group_typ:=4;
         end
         else
         begin
           IbQuery1.SQL.add('select klntree_full as KLN_FULL from klntree where klntree.klntree_id=:KLN_ID');
           kln_group_typ:=3;
         end;
    	 IbQuery1.Parambyname('KLN_ID').asinteger:=kln_group_id;
     	 IbQuery1.Open;

         if not IbQuery1.eof then
         KLN_NAME.text := IbQuery1.fieldbyname('KLN_FULL').asstring;

         IbQuery1.Close;
         ibtransaction1.Active:=false;

       end;

     DIC_KLIENT.Destroy;
end;

procedure TPers_TORG.BTN_USERClick(Sender: TObject);
begin
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:= USER_NAME.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<> USER_NAME.tag then
       begin
        USER_NAME.tag:=DIC_KLIENT.tag;
        cbUserAll.checked:=false;
        cbUserAll.Enabled:=true;

         IbQuery1.Close;
    	 IbQuery1.SQL.clear;
   	  	 IbQuery1.SQL.add('select KLN_FULL,KLN_REKW FROM KLN_DATA(:KLN_ID)');
    	 IbQuery1.Parambyname('KLN_ID').asinteger:=USER_NAME.tag;
     	 IbQuery1.Open;

         if not IbQuery1.eof then
         USER_NAME.text := IbQuery1.fieldbyname('KLN_FULL').asstring;

         IbQuery1.Close;
         ibtransaction1.Active:=false;

       end;

     DIC_KLIENT.Destroy;
end;

procedure TPers_TORG.cbUserAllClick(Sender: TObject);
begin
	if cbUserAll.Checked then
    begin
    USER_NAME.Tag:=0;
    USER_NAME.Text:='Все';
    end;

end;

procedure TPers_TORG.ExpExcel;
var
    r: Range;
    v : olevariant;
     _rng : Range;
    iRow, iCol: longint;
    addres: string;
    format: string;
    tmpstring: string;
    qry : ^TIBQuery;
    tw_summ: double;
    kop: integer;
begin
    {Узнать, чколько групп товара в отчете. добавить это количество}
    Openquery(false);

    if vid.ItemIndex=0 then
    begin
      qry :=  @Datamodule3.QrPersTorg;
    end
    else
    if vid.ItemIndex=10 then
    begin
      qry :=  @Datamodule3.QrPersTorg;
    end
    else
    if vid.ItemIndex=1 then
    begin
      qry :=  @Datamodule3.QrPers2;
    end
    else
    if vid.ItemIndex=2 then
    begin
      qry :=  @Datamodule3.QrPers4;
    end
    else
    if vid.ItemIndex=3 then
    begin
      qry :=  @Datamodule3.QrPers3;
    end
    else
    if vid.ItemIndex=4 then
    begin
      qry :=  @Datamodule3.QrPers5;
    end
    else
    if vid.ItemIndex=5 then
    begin
      qry :=  @Datamodule3.QrPers6;
    end
    else
    if vid.ItemIndex=11 then
    begin
      qry :=  @Datamodule3.QrPers6;
    end
    else
    exit;

    if not qry.Active then exit;





    qry.First;
    qry.Last;


    qry.First;
    if qry.eof then exit;


//    format := '# ##0.00';
//    format := stringreplace(format, '.', DECIMALSEPARATOR, [rfReplaceAll]);


    try
//    Excel := TExcelApplication.Create(nil);
//    Excel.ConnectKind := ckNewInstance;
//    Excel.Connect;

      case vid.ItemIndex of
      0:   begin
            excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\подробный отчет о продажах.xlt', 0);
            v := VarArrayCreate([0, qry.RecordCount, 0, 14], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[iRow, 0] := qry.fieldbyname('RN_NUM_FULL').asvariant;
                v[iRow, 1] := qry.fieldbyname('TW_ART').asvariant;
                v[iRow, 2] := qry.fieldbyname('TW_NAM').asvariant;
                v[iRow, 3] := qry.fieldbyname('TW_MONEY0').asvariant;
                v[iRow, 4] := qry.fieldbyname('TW_SKIDCARD').asvariant;
                v[iRow, 5] := qry.fieldbyname('TW_SKIDDOLL').asvariant;
                v[iRow, 6] := qry.fieldbyname('TW_SKID').asvariant;
                v[iRow, 7] := qry.fieldbyname('TW_MONEY').asvariant;
                v[iRow, 8] := qry.fieldbyname('ED_SHORT').asvariant;
                v[iRow, 9] := qry.fieldbyname('TW_KOL').asvariant;
                v[iRow, 10] := qry.fieldbyname('TW_SUMM').asvariant;
                v[iRow, 11] := qry.fieldbyname('tw_nsp').asvariant;
                v[iRow, 12] := qry.fieldbyname('tw_nds').asvariant;
                v[iRow, 13] := qry.fieldbyname('RVID_NAME').asvariant;
                qry.Next;
                inc(irow);
            end;
            r:= excel.Range['A1', 'A1'];
            r.Value := 'Подробный отчет о продажах:  ' + s;
            r := excel.Range[excel.Cells.Item[8, 1],
            excel.Cells.Item[qry.RecordCount +8 - 1,14]];
           end;

      10:   begin
            excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\агентский отчет о продажах.xlt', 0);
            v := VarArrayCreate([0, qry.RecordCount, 0, 14], varVariant);
            iRow := 0;
            tw_summ:=0;
            while  iRow < qry.RecordCount do
            begin
                v[iRow, 0] := qry.fieldbyname('TW_ART').asvariant;
                v[iRow, 1] := qry.fieldbyname('TW_NAM').asvariant;
                v[iRow, 2] := qry.fieldbyname('TW_KOL').asvariant;
                v[iRow, 3] := qry.fieldbyname('ED_SHORT').asvariant;
                v[iRow, 4] := qry.fieldbyname('TW_SEB').asvariant;
                v[iRow, 5] := qry.fieldbyname('TW_SEB_SUMM').asvariant;
                v[iRow, 6] := qry.fieldbyname('TW_MONEY0').asvariant;
                v[iRow, 7] := qry.fieldbyname('TW_SKIDCARD').asvariant;
                v[iRow, 8] := qry.fieldbyname('TW_SKID').asvariant;
                v[iRow, 9] := qry.fieldbyname('TW_MONEY').asvariant;
                v[iRow, 10] := qry.fieldbyname('TW_SUMM').asvariant;
                v[iRow, 11] := qry.fieldbyname('tw_nds').asvariant;
                v[iRow, 12] := qry.fieldbyname('TW_SUMM').asvariant;
                v[iRow, 13] := qry.fieldbyname('KLN_NAME').asvariant;
                tw_summ:=tw_summ+ qry.fieldbyname('TW_SUMM').asfloat;
                qry.Next;
                inc(irow);
            end;
//            r:= excel.Range['A1', 'A1'];
//            r.Value := 'Агентский отчет о продажах:  ' + s;
            r:= excel.Range['E4', 'E4'];
            r.Value := 'за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);

            r:= excel.Range['F9', 'F9'];
            kop:=round( (tw_summ-int(tw_summ))*100);
            r.Value := money_char(tW_summ, 1)+' руб. '+ inttostr( kop)+' коп.';

            {
            Запишем итого
            }
            r:= excel.Range['A'+inttostr(qry.RecordCount +14), 'A'+inttostr(qry.RecordCount +14)];
            r.FormulaLocal:='Итого:';

            r:= excel.Range['C'+inttostr(qry.RecordCount +14), 'C'+inttostr(qry.RecordCount +14)];
            r.FormulaLocal:='=СУММ(C14:C'+inttostr(qry.RecordCount +14-1)+')';

            r:= excel.Range['F'+inttostr(qry.RecordCount +14), 'F'+inttostr(qry.RecordCount +14)];
            r.FormulaLocal:='=СУММ(F14:F'+inttostr(qry.RecordCount +14-1)+')';

            r:= excel.Range['K'+inttostr(qry.RecordCount +14), 'K'+inttostr(qry.RecordCount +14)];
            r.FormulaLocal:='=СУММ(K14:K'+inttostr(qry.RecordCount +14-1)+')';

            r:= excel.Range['L'+inttostr(qry.RecordCount +14), 'L'+inttostr(qry.RecordCount +14)];
            r.FormulaLocal:='=СУММ(L14:L'+inttostr(qry.RecordCount +14-1)+')';

            r:= excel.Range['M'+inttostr(qry.RecordCount +14), 'M'+inttostr(qry.RecordCount +14)];
            r.FormulaLocal:='=СУММ(M14:M'+inttostr(qry.RecordCount +14-1)+')';

            r:= excel.Range['A'+inttostr(qry.RecordCount +15), 'A'+inttostr(qry.RecordCount +15)];
            r.FormulaLocal:='Общий размер агентского вознаграждения составил __________ руб., в том числе НДС ___________ руб.';







            r := excel.Range[excel.Cells.Item[14, 1],
            excel.Cells.Item[qry.RecordCount +14 - 1,14]];
           end;


      1:   begin
            excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\суммарный отчет о продажах.xlt', 0);
            v := VarArrayCreate([0, qry.RecordCount, 0, 5], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[iRow, 0] := qry.fieldbyname('tw_art').asvariant;
                v[iRow, 1] := qry.fieldbyname('tw_nam').asvariant;
                v[iRow, 2] := qry.fieldbyname('tw_kol').asvariant;
                v[iRow, 3] := qry.fieldbyname('tw_summ').asvariant;
                v[iRow, 4] := qry.fieldbyname('tw_nsp').asvariant;
                v[iRow, 5] := qry.fieldbyname('tw_nds').asvariant;
                qry.Next;
                inc(irow);
            end;
            r:= excel.Range['A1', 'A1'];
            r.Value := 'Суммарный отчет о продажах:  ' + s;
            r := excel.Range[excel.Cells.Item[8, 1],
            excel.Cells.Item[qry.RecordCount +8 - 1,6]];
           end;
      2:   begin
            excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\групповой отчет о продажах.xlt', 0);
            v := VarArrayCreate([0, qry.RecordCount, 0, 3], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[iRow, 0] := qry.fieldbyname('twtree_full').asvariant;
                v[iRow, 1] := qry.fieldbyname('tw_summ').asvariant;
                v[iRow, 2] := qry.fieldbyname('tw_nsp').asvariant;
                v[iRow, 3] := qry.fieldbyname('tw_nds').asvariant;
                qry.Next;
                inc(irow);
            end;
            r:= excel.Range['A1', 'A1'];
            r.Value := 'Групповой отчет о продажах:  ' + s;
            r := excel.Range[excel.Cells.Item[8, 1],
            excel.Cells.Item[qry.RecordCount +8 - 1,4]];
           end;
      3:  begin
            excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\Итоговый отчет о продажах.xlt', 0);
            v := VarArrayCreate([0, qry.RecordCount, 0, 4], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[iRow, 0] := qry.fieldbyname('shop_name').asvariant;
                v[iRow, 1] := qry.fieldbyname('summ').asvariant;
                v[iRow, 2] := qry.fieldbyname('tw_nsp').asvariant;
                v[iRow, 3] := qry.fieldbyname('tw_nds').asvariant;
                v[iRow, 4] := qry.fieldbyname('po_summ').asvariant;

                qry.Next;
                inc(irow);
            end;
            r:= excel.Range['A1', 'A1'];
            r.Value := 'Итоговый отчет о продажах:  ' + s;
            r := excel.Range[excel.Cells.Item[8, 1],
            excel.Cells.Item[qry.RecordCount +8 - 1,5]];
          end;

      4:   begin
            excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\по видам реализации отчет о продажах.xlt', 0);
            v := VarArrayCreate([0, qry.RecordCount, 0, 3], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[iRow, 0] := qry.fieldbyname('rvid_name').asvariant;
                v[iRow, 1] := qry.fieldbyname('summ').asvariant;
                v[iRow, 2] := qry.fieldbyname('tw_nsp').asvariant;
                v[iRow, 3] := qry.fieldbyname('tw_nds').asvariant;
                qry.Next;
                inc(irow);
            end;
            r:= excel.Range['A1', 'A1'];
            r.Value := 'Отчет о продажах по видам реализации:  ' + s;
            r := excel.Range[excel.Cells.Item[8, 1],
            excel.Cells.Item[qry.RecordCount +8 - 1,4]];
           end;


      5:  begin
            excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет о продажах по табелям.xlt', 0);
            v := VarArrayCreate([0, qry.RecordCount, 0, 5], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[iRow, 0] := qry.fieldbyname('rns_tabel').asvariant;
                v[iRow, 1] := qry.fieldbyname('us_fio').asvariant;
                v[iRow, 2] := qry.fieldbyname('cnt').asvariant;
                v[iRow, 3] := qry.fieldbyname('summ').asvariant;
                v[iRow, 4] := qry.fieldbyname('tw_nsp').asvariant;
                v[iRow, 5] := qry.fieldbyname('tw_nds').asvariant;
                 qry.Next;
                inc(irow);
            end;
            r:= excel.Range['A1', 'A1'];
            r.Value := 'Отчет о продажах по табелям:  ' + s;
            r := excel.Range[excel.Cells.Item[8, 1],
            excel.Cells.Item[qry.RecordCount +8 - 1,6]];

          end;



      11:  begin
            excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет о продажах по табелям с наценкой.xlt', 0);
            v := VarArrayCreate([0, qry.RecordCount, 0, 5], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[iRow, 0] := qry.fieldbyname('rns_tabel').asvariant;
                v[iRow, 1] := qry.fieldbyname('us_fio').asvariant;
                v[iRow, 2] := qry.fieldbyname('cnt').asvariant;
                v[iRow, 3] := qry.fieldbyname('summ').asvariant;
                v[iRow, 4] := qry.fieldbyname('tw_nds').asvariant;
                v[iRow, 5] := qry.fieldbyname('nac').asvariant;
                 qry.Next;
                inc(irow);
            end;
            r:= excel.Range['A1', 'A1'];
            r.Value := 'Отчет о продажах по табелям с наценкой:  ' + s;
            r := excel.Range[excel.Cells.Item[8, 1],
            excel.Cells.Item[qry.RecordCount +8 - 1,6]];

          end;
      end;

//      end;

      r.Value := v;


      r.Borders[xlEdgeTop].LineStyle := xlContinuous;
      r.Borders[xlEdgeTop].Weight := xlThin;
      r.Borders[xlEdgeTop].ColorIndex := xlAutomatic;


      r.Borders[xlEdgeBottom].LineStyle := xlContinuous;
      r.Borders[xlEdgeBottom].Weight := xlThin;
      r.Borders[xlEdgeBottom].ColorIndex := xlAutomatic;
      try
      r.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
      r.Borders[xlInsideHorizontal].Weight := xlThin;
      r.Borders[xlInsideHorizontal].ColorIndex := xlAutomatic;
      except
      end;


    finally
      excel.Visible[0]:=true;
      freeandnil(excel);
    end;
end;

procedure TPers_TORG.BtnPrintClick(Sender: TObject);
begin
  OpenQuery;
end;

procedure TPers_TORG.BtnDynDicClick(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;
     if tw_group_typ<3 then
      DIC_TW_DYN_GROUP.btnSelect.tag := tw_group_id;

     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      tw2.Checked:=true;
      tw.Text:='* '+ DIC_TW_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      tw_group_id:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      tw_group_typ:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

procedure TPers_TORG.BitBtn3Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select SHOP_NAME,SHOP_ID from SHOP order by SHOP_ID');
     s:='';
     s2:='';
     if DualListDialog3.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog3.list2.Count do begin
            if QueryWork.Locate('SHOP_NAME',DualListDialog3.List2.Strings[a-1],[])
            then begin
                 s:=s+'%'+QueryWork.fieldByname('SHOP_ID').asstring;
                 s2:=s2+' '+QueryWork.fieldByname('SHOP_NAME').asstring+',';
            end;
        end;
        s:=s+'%';
        if length(s)>0 then s:=B_utils.left(s,length(s));
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        SHOP_S:=s;
        Edit2.text:=s2;
     end;

end;

procedure TPers_TORG.ExpCalc;
var ServiceManager: Olevariant;
    Desktop: Olevariant;
    Document,Sheets, ooParams, ooValue, ooReflection, sheet, cell: OleVariant;
    FilePath: String;
    bounds: array[0..1] of integer;
    dataArrayBounds: array [0..1,0..1] of integer;
//    r: Range;
    v : olevariant;

    iRow, iCol: longint;
    add_col: integer;
    add_row: integer;
    old_tw_tree_id: integer;

    cel, cel1: variant;
    i,j: integer;
    qry : ^TIBQuery;
    tW_summ: double;
    kop: integer;
    summ_str: string;
begin
    Openquery(false);

    if vid.ItemIndex=0 then
    begin
      qry :=  @Datamodule3.QrPersTorg;
    end
    else
    if vid.ItemIndex=10 then
    begin
      qry :=  @Datamodule3.QrPersTorg;
    end
    else
    if vid.ItemIndex=1 then
    begin
      qry :=  @Datamodule3.QrPers2;
    end
    else
    if vid.ItemIndex=2 then
    begin
      qry :=  @Datamodule3.QrPers4;
    end
    else
    if vid.ItemIndex=3 then
    begin
      qry :=  @Datamodule3.QrPers3;
    end
    else
    if vid.ItemIndex=4 then
    begin
      qry :=  @Datamodule3.QrPers5;
    end
    else
    if vid.ItemIndex=5 then
    begin
      qry :=  @Datamodule3.QrPers6;
    end
    else
    if vid.ItemIndex=11 then
    begin
      qry :=  @Datamodule3.QrPers6;
    end
    else
    exit;

    if not qry.Active then exit;

    qry.First;
    qry.Last;

    qry.First;
    if qry.eof then exit;

   try
     ServiceManager := CreateOleObject('com.sun.star.ServiceManager');
   except
     exit;
   end;

   FilePath := 'private:factory/scalc';
//   filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\подробный отчет о продажах.xlt');
     if (VarType(ServiceManager) = varDispatch) then
       Desktop := ServiceManager.CreateInstance('com.sun.star.frame.Desktop');

  Bounds[0] := 0;
  Bounds[1] := 0;

  ooParams := VarArrayCreate([0, 0], varVariant);
  ooReflection := ServiceManager.createInstance('com.sun.star.reflection.CoreReflection');
  ooReflection.forName('com.sun.star.beans.PropertyValue').createObject(ooValue);
  ooValue.Name := 'AsTemplate';
  ooValue.Value := True;
  ooParams[0] := ooValue;


//Загрузка шаблона, пока работает криво

////////////////////////////////////////////


   try

//******************************
      case vid.ItemIndex of
      0:   begin
            filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\подробный отчет о продажах.xlt');
            dataArrayBounds[0,0]:=0;
            dataArrayBounds[1,0]:=14;
            dataArrayBounds[0,1]:=0;
            dataArrayBounds[1,1]:=qry.RecordCount+100;
            v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);
            for i := 0 to dataArrayBounds[1,0] do
              for j := 0 to  dataArrayBounds[1,1] do
                v[i,j]:='';
//            v := VarArrayCreate([0, qry.RecordCount, 0, 14], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
             begin
                v[0,iRow] := qry.fieldbyname('RN_NUM_FULL').asvariant;
                v[1,iRow] := qry.fieldbyname('TW_ART').asvariant;
                v[2,iRow] := qry.fieldbyname('TW_NAM').asvariant;
                v[3,iRow] := qry.fieldbyname('TW_MONEY0').asvariant;
                v[4,iRow] := qry.fieldbyname('TW_SKIDCARD').asvariant;
                v[5,iRow] := qry.fieldbyname('TW_SKIDDOLL').asvariant;
                v[6,iRow] := qry.fieldbyname('TW_SKID').asvariant;
                v[7,iRow] := qry.fieldbyname('TW_MONEY').asvariant;
                v[8,iRow] := qry.fieldbyname('ED_SHORT').asvariant;
                v[9,iRow] := qry.fieldbyname('TW_KOL').asvariant;
                v[10,iRow] := qry.fieldbyname('TW_SUMM').asvariant;
                v[11,iRow] := qry.fieldbyname('tw_nsp').asvariant;
                v[12,iRow] := qry.fieldbyname('tw_nds').asvariant;
                v[13,iRow] := qry.fieldbyname('RVID_NAME').asvariant;
                qry.Next;
                inc(irow);
             end;
            Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);
            Sheets := Document.GetSheets;
            Sheet := Sheets.GetByName('Лист1');
            cel := Sheet.GetCellByPosition(0,0);
            cel.setString('Подробный отчет о продажах:  ' + s);
            Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+7,dataArrayBounds[1,0], dataArrayBounds[1,1]+7);

//            r:= excel.Range['A1', 'A1'];
 //           r.Value := 'Подробный отчет о продажах:  ' + s;
  //          r := excel.Range[excel.Cells.Item[8, 1],
   //         excel.Cells.Item[qry.RecordCount +8 - 1,14]];
           end;

      10:   begin
            filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\агентский отчет о продажах.xlt');
            dataArrayBounds[0,0]:=0;
            dataArrayBounds[1,0]:=14;
            dataArrayBounds[0,1]:=0;
            dataArrayBounds[1,1]:=qry.RecordCount+100;
            v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);
            for i := 0 to dataArrayBounds[1,0] do
              for j := 0 to  dataArrayBounds[1,1] do
                v[i,j]:='';
//            v := VarArrayCreate([0, qry.RecordCount, 0, 14], varVariant);
            iRow := 0;
            tw_summ:=0;
            while  iRow < qry.RecordCount do
             begin
                v[0, iRow] := qry.fieldbyname('TW_ART').asvariant;
                v[1, iRow] := qry.fieldbyname('TW_NAM').asvariant;
                v[2, iRow] := qry.fieldbyname('TW_KOL').asvariant;
                v[3,iRow] := qry.fieldbyname('ED_SHORT').asvariant;
                v[4,iRow] := qry.fieldbyname('TW_SEB').asvariant;
                v[5,iRow] := qry.fieldbyname('TW_SEB_SUMM').asvariant;
                v[6,iRow] := qry.fieldbyname('TW_MONEY0').asvariant;
                v[7,iRow] := qry.fieldbyname('TW_SKIDCARD').asvariant;
                v[8,iRow] := qry.fieldbyname('TW_SKID').asvariant;
                v[9,iRow] := qry.fieldbyname('TW_MONEY').asvariant;
                v[10,iRow] := qry.fieldbyname('TW_SUMM').asvariant;
                v[11,iRow] := qry.fieldbyname('tw_nds').asvariant;
                v[12,iRow] := qry.fieldbyname('TW_SUMM').asvariant;
                v[13,iRow] := qry.fieldbyname('KLN_NAME').asvariant;
                tw_summ:=tw_summ+qry.fieldbyname('TW_SUMM').asfloat;
                qry.Next;
                inc(irow);
             end;
            Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);
            Sheets := Document.GetSheets;
            Sheet := Sheets.GetByName('Лист1');
//            cel := Sheet.GetCellByPosition(0,0);
//            cel.setString('Подробный отчет о продажах:  ' + s);

            cel := Sheet.GetCellByPosition(4,3);
            cel.setString('за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date));

            kop:=round( (tw_summ-int(tw_summ))*100);
            cel1 := Sheet.GetCellByPosition(5,8);

            summ_str:=money_char(tW_summ, 1)+' руб. '+ inttostr( kop)+' коп.';

            cel1.setString(summ_str);





            Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+13,dataArrayBounds[1,0], dataArrayBounds[1,1]+13);

//            r:= excel.Range['A1', 'A1'];
 //           r.Value := 'Подробный отчет о продажах:  ' + s;
  //          r := excel.Range[excel.Cells.Item[8, 1],
   //         excel.Cells.Item[qry.RecordCount +8 - 1,14]];
           end;



      1:   begin
            filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\суммарный отчет о продажах.xlt');
            dataArrayBounds[0,0]:=0;
            dataArrayBounds[1,0]:=5;
            dataArrayBounds[0,1]:=0;
            dataArrayBounds[1,1]:=qry.RecordCount+100;
            v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);
            for i := 0 to dataArrayBounds[1,0] do
              for j := 0 to  dataArrayBounds[1,1] do
                v[i,j]:='';
//            v := VarArrayCreate([0, qry.RecordCount, 0, 5], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[0,iRow] := qry.fieldbyname('tw_art').asvariant;
                v[1,iRow] := qry.fieldbyname('tw_nam').asvariant;
                v[2,iRow] := qry.fieldbyname('tw_kol').asvariant;
                v[3,iRow] := qry.fieldbyname('tw_summ').asvariant;
                v[4,iRow] := qry.fieldbyname('tw_nsp').asvariant;
                v[5,iRow] := qry.fieldbyname('tw_nds').asvariant;
                qry.Next;
                inc(irow);
            end;
            Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);
            Sheets := Document.GetSheets;
            Sheet := Sheets.GetByName('Лист1');
            cel := Sheet.GetCellByPosition(0,0);
            cel.setString('Суммарный отчет о продажах:  ' + s);
            Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+7,dataArrayBounds[1,0], dataArrayBounds[1,1]+7);

//            r:= excel.Range['A1', 'A1'];
  //          r.Value := 'Суммарный отчет о продажах:  ' + s;
    //        r := excel.Range[excel.Cells.Item[8, 1],
      //      excel.Cells.Item[qry.RecordCount +8 - 1,6]];
           end;
      2:   begin
            filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\групповой отчет о продажах.xlt');
            dataArrayBounds[0,0]:=0;
            dataArrayBounds[1,0]:=3;
            dataArrayBounds[0,1]:=0;
            dataArrayBounds[1,1]:=qry.RecordCount+100;
            v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);
            for i := 0 to dataArrayBounds[1,0] do
              for j := 0 to  dataArrayBounds[1,1] do
                v[i,j]:='';
      //            v := VarArrayCreate([0, qry.RecordCount, 0, 3], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[0,iRow] := qry.fieldbyname('twtree_full').asvariant;
                v[1,iRow] := qry.fieldbyname('tw_summ').asvariant;
                v[2,iRow] := qry.fieldbyname('tw_nsp').asvariant;
                v[3,iRow] := qry.fieldbyname('tw_nds').asvariant;
                qry.Next;
                inc(irow);
            end;
            Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);
            Sheets := Document.GetSheets;
            Sheet := Sheets.GetByName('Лист1');
            cel := Sheet.GetCellByPosition(0,0);
            cel.setString('Групповой отчет о продажах:  ' + s);
            Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+7,dataArrayBounds[1,0], dataArrayBounds[1,1]+7);

//            r:= excel.Range['A1', 'A1'];
 //           r.Value := 'Групповой отчет о продажах:  ' + s;
  //          r := excel.Range[excel.Cells.Item[8, 1],
   //         excel.Cells.Item[qry.RecordCount +8 - 1,4]];
           end;
      3:  begin
            filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\Итоговый отчет о продажах.xlt');
            dataArrayBounds[0,0]:=0;
            dataArrayBounds[1,0]:=4;
            dataArrayBounds[0,1]:=0;
            dataArrayBounds[1,1]:=qry.RecordCount+100;
            v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);
            for i := 0 to dataArrayBounds[1,0] do
              for j := 0 to  dataArrayBounds[1,1] do
                v[i,j]:='';
//            v := VarArrayCreate([0, qry.RecordCount, 0, 4], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[0,iRow] := qry.fieldbyname('shop_name').asvariant;
                v[1,iRow] := qry.fieldbyname('summ').asvariant;
                v[2,iRow] := qry.fieldbyname('tw_nsp').asvariant;
                v[3,iRow] := qry.fieldbyname('tw_nds').asvariant;
                v[4,iRow] := qry.fieldbyname('po_summ').asvariant;

                qry.Next;
                inc(irow);
            end;
            Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);
            Sheets := Document.GetSheets;
            Sheet := Sheets.GetByName('Лист1');
            cel := Sheet.GetCellByPosition(0,0);
            cel.setString('Итоговый отчет о продажах:  ' + s);
            Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+7,dataArrayBounds[1,0], dataArrayBounds[1,1]+7);

//            r:= excel.Range['A1', 'A1'];
 //           r.Value := 'Итоговый отчет о продажах:  ' + s;
  //          r := excel.Range[excel.Cells.Item[8, 1],
   //         excel.Cells.Item[qry.RecordCount +8 - 1,5]];
          end;

      4:   begin
            filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\по видам реализации отчет о продажах.xlt');
            dataArrayBounds[0,0]:=0;
            dataArrayBounds[1,0]:=3;
            dataArrayBounds[0,1]:=0;
            dataArrayBounds[1,1]:=qry.RecordCount+100;
            v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);
            for i := 0 to dataArrayBounds[1,0] do
              for j := 0 to  dataArrayBounds[1,1] do
                v[i,j]:='';
//            v := VarArrayCreate([0, qry.RecordCount, 0, 3], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[0,iRow] := qry.fieldbyname('rvid_name').asvariant;
                v[1,iRow] := qry.fieldbyname('summ').asvariant;
                v[2,iRow] := qry.fieldbyname('tw_nsp').asvariant;
                v[3,iRow] := qry.fieldbyname('tw_nds').asvariant;
                qry.Next;
                inc(irow);
            end;
            Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);
            Sheets := Document.GetSheets;
            Sheet := Sheets.GetByName('Лист1');
            cel := Sheet.GetCellByPosition(0,0);
            cel.setString('Отчет о продажах по видам реализации:  ' + s);
            Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+7,dataArrayBounds[1,0], dataArrayBounds[1,1]+7);

//            r:= excel.Range['A1', 'A1'];
 //           r.Value := 'Отчет о продажах по видам реализации:  ' + s;
  //          r := excel.Range[excel.Cells.Item[8, 1],
   //         excel.Cells.Item[qry.RecordCount +8 - 1,4]];
           end;


      5:  begin
            filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет о продажах по табелям.xlt');
            dataArrayBounds[0,0]:=0;
            dataArrayBounds[1,0]:=5;
            dataArrayBounds[0,1]:=0;
            dataArrayBounds[1,1]:=qry.RecordCount+100;
            v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);
            for i := 0 to dataArrayBounds[1,0] do
              for j := 0 to  dataArrayBounds[1,1] do
                v[i,j]:='';
//            v := VarArrayCreate([0, qry.RecordCount, 0, 5], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[0,iRow] := qry.fieldbyname('rns_tabel').asvariant;
                v[1,iRow] := qry.fieldbyname('us_fio').asvariant;
                v[2,iRow] := qry.fieldbyname('cnt').asvariant;
                v[3,iRow] := qry.fieldbyname('summ').asvariant;
                v[4,iRow] := qry.fieldbyname('tw_nsp').asvariant;
                v[5,iRow] := qry.fieldbyname('tw_nds').asvariant;
                 qry.Next;
                inc(irow);
            end;
            Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);
            Sheets := Document.GetSheets;
            Sheet := Sheets.GetByName('Лист1');
            cel := Sheet.GetCellByPosition(0,0);
            cel.setString('тчет о продажах по табелям:  ' + s);
            Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+7,dataArrayBounds[1,0], dataArrayBounds[1,1]+7);

//            r:= excel.Range['A1', 'A1'];
  //          r.Value := 'Отчет о продажах по табелям:  ' + s;
    //        r := excel.Range[excel.Cells.Item[8, 1],
      //      excel.Cells.Item[qry.RecordCount +8 - 1,6]];

          end;

        11:  begin
            filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\отчет о продажах по табелям с наценкой.xlt');
            dataArrayBounds[0,0]:=0;
            dataArrayBounds[1,0]:=5;
            dataArrayBounds[0,1]:=0;
            dataArrayBounds[1,1]:=qry.RecordCount+100;
            v := VarArrayCreate([dataArrayBounds[0,0], dataArrayBounds[1,0], dataArrayBounds[0,1], dataArrayBounds[1,1]], varVariant);
            for i := 0 to dataArrayBounds[1,0] do
              for j := 0 to  dataArrayBounds[1,1] do
                v[i,j]:='';
//            v := VarArrayCreate([0, qry.RecordCount, 0, 5], varVariant);
            iRow := 0;
            while  iRow < qry.RecordCount do
            begin
                v[0,iRow] := qry.fieldbyname('rns_tabel').asvariant;
                v[1,iRow] := qry.fieldbyname('us_fio').asvariant;
                v[2,iRow] := qry.fieldbyname('cnt').asvariant;
                v[3,iRow] := qry.fieldbyname('summ').asvariant;
                v[4,iRow] := qry.fieldbyname('tw_nds').asvariant;
                v[5,iRow] := qry.fieldbyname('nac').asvariant;
                 qry.Next;
                inc(irow);
            end;
            Document := Desktop.LoadComponentFromURL(
                  FilePath, '_blank', 0,
                  ooParams);
            Sheets := Document.GetSheets;
            Sheet := Sheets.GetByName('Лист1');
            cel := Sheet.GetCellByPosition(0,0);
            cel.setString('Отчет о продажах по табелям с наценкой:  ' + s);
            Cell := Sheet.GetCellRangeByPosition(dataArrayBounds[0,0], dataArrayBounds[0,1]+7,dataArrayBounds[1,0], dataArrayBounds[1,1]+7);

//            r:= excel.Range['A1', 'A1'];
  //          r.Value := 'Отчет о продажах по табелям:  ' + s;
    //        r := excel.Range[excel.Cells.Item[8, 1],
      //      excel.Cells.Item[qry.RecordCount +8 - 1,6]];

          end;
      end;
      Cell.SetDataArray(v);

//******************************
   except
     on e: Exception
     do begin
       messbox(e.message, 'Error', 0);
     end;
   end;


end;

procedure TPers_TORG.BtnExcelClick(Sender: TObject);
begin
  try
    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
    ExpExcel;
  except
    ExpCalc;
  end;

end;

procedure TPers_TORG.kln1Click(Sender: TObject);
begin
  KLN_NAME.text:= 'Все клиенты';
  kln_group_id:=0;
  kln_group_typ:=4;
end;

procedure TPers_TORG.ppPers10PreviewFormCreate(Sender: TObject);
begin
     ppPers10.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPers_TORG.ppTitleBand10BeforeGenerate(Sender: TObject);
begin
     ppLabel236.Caption:=USERFIO_SHORT;
     PpPers3Vers.caption:=PROG_VERSION;
     try
       ppImage10.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPers_TORG.ppPers11PreviewFormCreate(Sender: TObject);
begin
     ppPers11.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPers_TORG.DynKLNClick(Sender: TObject);
begin
     try
       Application.createForm(TDIC_KLIENT_DYN_GROUP,DIC_KLIENT_DYN_GROUP);
     except
       DIC_KLIENT_DYN_GROUP.Visible:=true;
     end;
     DIC_KLIENT_DYN_GROUP.btnSelect.visible:=true;
     if kln_group_typ<3 then
      DIC_KLIENT_DYN_GROUP.btnSelect.tag := kln_group_id;

     DIC_KLIENT_DYN_GROUP.showmodal;
     if DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      kln2.Checked:=true;
      kln_name.Text:='* '+ DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      kln_group_id:=DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_ID;
      kln_group_typ:=DIC_KLIENT_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_KLIENT_DYN_GROUP.Destroy;

end;

procedure TPers_TORG.BitBtn4Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select PNTYP_SHORT,PNTYP_ID from PNTYP order by PNTYP_ID');
     s:='';
     s2:='';
     if DualListDialog4.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog4.list2.Count do begin
            if QueryWork.Locate('PNTYP_SHORT',DualListDialog4.List2.Strings[a-1],[])
            then begin
                 s:=s+' '+QueryWork.fieldByname('PNTYP_ID').asstring+',';
                 s2:=s2+' '+QueryWork.fieldByname('PNTYP_SHORT').asstring+',';
            end;
        end;
        if length(s)>0 then s:=B_utils.left(s,length(s)-1);
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        PNTYP_S:=s;

     end;
end;

procedure TPers_TORG.chkTabelClick(Sender: TObject);
begin
  rns_tabel.Visible := chkTabel.Checked;
end;

end.
