unit PrintDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,DataPrint,B_Utils,
  B_DButils,Data1,
  ppCtrls, ppVar, ppPrnabl, ppClass, ppBands, ppDB, ppDBPipe, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo, ppModule, daDatMod,
  ppSubRpt, ppRegion, FR_Class, FR_DSet, FR_DBSet, excel2000, OleServer,VclUtils,
  ppRichTx, raCodMod, FR_Desgn, ppBarCod,ComObj, FR_BarC;

type
  TPrint_DOC = class(TForm)
    PpRN: TppReport;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    PipRN: TppDBPipeline;
    PipRNS: TppDBPipeline;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    PpRnTitle: TppLabel;
    ppLine1: TppLine;
    PpRnUser: TppLabel;
    ppLabel5: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBCalc1: TppDBCalc;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppLabel8: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel9: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel10: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLabel11: TppLabel;
    RN_NDS: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppImage1: TppImage;
    RN_SUMM: TppMemo;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    RN_VERS: TppLabel;
    ppLabel20: TppLabel;
    ppShape2: TppShape;
    ppHeaderBand1: TppHeaderBand;
    ppShape3: TppShape;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDBText8: TppDBText;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppDBMemo5: TppDBMemo;
    PP_CENNIK_BIG: TppReport;
    PP_CENNIK_BIGHeaderBand1: TppHeaderBand;
    PP_CENNIK_BIGColumnHeaderBand1: TppColumnHeaderBand;
    PP_CENNIK_BIGDetailBand1: TppDetailBand;
    PP_CENNIK_BIGShape1: TppShape;
    PP_CENNIK_BIGDBText2: TppDBText;
    PP_CENNIK_BIGLabel2: TppLabel;
    PP_CENNIK_BIGDBText3: TppDBText;
    PP_CENNIK_BIGLabel1: TppLabel;
    PP_CENNIK_BIGColumnFooterBand1: TppColumnFooterBand;
    PP_CENNIK_BIGFooterBand1: TppFooterBand;
    PP_CENNIK_BIGGroup1: TppGroup;
    PP_CENNIK_BIGGroupHeaderBand1: TppGroupHeaderBand;
    PP_CENNIK_BIGShape2: TppShape;
    PP_CENNIK_BIGDBText1: TppDBText;
    PP_CENNIK_BIGDBText4: TppDBText;
    PP_CENNIK_BIGGroupFooterBand1: TppGroupFooterBand;
    PP_CENNIK_BIGGroup2: TppGroup;
    PP_CENNIK_BIGGroupHeaderBand2: TppGroupHeaderBand;
    PP_CENNIK_BIGDBMemo1: TppDBMemo;
    PP_CENNIK_BIGLine8: TppLine;
    PP_CENNIK_BIGGroupFooterBand2: TppGroupFooterBand;
    PP_CENNIK_BIGGroup3: TppGroup;
    PP_CENNIK_BIGGroupHeaderBand3: TppGroupHeaderBand;
    PP_CENNIK_BIGLabel3: TppLabel;
    PP_CENNIK_BIGDBMemo2: TppDBMemo;
    PP_CENNIK_BIGGroupFooterBand3: TppGroupFooterBand;
    PP_CENNIK_BIGGroup4: TppGroup;
    PP_CENNIK_BIGGroupHeaderBand4: TppGroupHeaderBand;
    PP_CENNIK_BIGLabel4: TppLabel;
    PP_CENNIK_BIGDBMemo3: TppDBMemo;
    PP_CENNIK_BIGGroupFooterBand4: TppGroupFooterBand;
    PP_CENNIK_BIGGroup5: TppGroup;
    PP_CENNIK_BIGGroupHeaderBand5: TppGroupHeaderBand;
    PP_CENNIK_BIGLabel5: TppLabel;
    PP_CENNIK_BIGDBMemo4: TppDBMemo;
    PP_CENNIK_BIGGroupFooterBand5: TppGroupFooterBand;
    PP_CENNIK_BIGGroup6: TppGroup;
    PP_CENNIK_BIGGroupHeaderBand6: TppGroupHeaderBand;
    PP_CENNIK_BIGLabel6: TppLabel;
    PP_CENNIK_BIGDBMemo5: TppDBMemo;
    PP_CENNIK_BIGGroupFooterBand6: TppGroupFooterBand;
    PipCennik: TppDBPipeline;
    PP_CENNIK_SMALL: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppShape4: TppShape;
    ppDBText9: TppDBText;
    ppLabel41: TppLabel;
    ppDBText10: TppDBText;
    ppLabel42: TppLabel;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand2: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText11: TppDBText;
    ppDBText72: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBMemo6: TppDBMemo;
    ppLine7: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel44: TppLabel;
    ppDBMemo7: TppDBMemo;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppLabel45: TppLabel;
    ppDBMemo8: TppDBMemo;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLabel46: TppLabel;
    ppDBMemo9: TppDBMemo;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLabel47: TppLabel;
    ppDBMemo10: TppDBMemo;
    ppGroupFooterBand6: TppGroupFooterBand;
    PP_CENNIK_MEDIUM: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppShape5: TppShape;
    ppDBText17: TppDBText;
    ppLabel48: TppLabel;
    ppDBText18: TppDBText;
    ppLabel49: TppLabel;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand3: TppFooterBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppDBText19: TppDBText;
    ppDBText80: TppDBText;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppDBMemo11: TppDBMemo;
    ppLine8: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppLabel51: TppLabel;
    ppDBMemo12: TppDBMemo;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppLabel52: TppLabel;
    ppDBMemo13: TppDBMemo;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppLabel53: TppLabel;
    ppDBMemo14: TppDBMemo;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppLabel232: TppLabel;
    ppDBMemo15: TppDBMemo;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppDBMemo4: TppDBMemo;
    ppLabel29: TppLabel;
    ppLabel28: TppLabel;
    ppDBMemo3: TppDBMemo;
    PpRND: TppReport;
    ppTitleBand2: TppTitleBand;
    ppImage4: TppImage;
    ppHeaderBand5: TppHeaderBand;
    ppShape9: TppShape;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBCalc5: TppDBCalc;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBMemo24: TppDBMemo;
    ppFooterBand5: TppFooterBand;
    ppLine29: TppLine;
    ppLabel114: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLabel115: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppLabel116: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    PpRNDUser: TppLabel;
    ppLabel120: TppLabel;
    ppDBText49: TppDBText;
    ppLabel121: TppLabel;
    PpRNDVers: TppLabel;
    ppLabel123: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLine30: TppLine;
    ppLabel124: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppLabel125: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppLabel126: TppLabel;
    ppDBCalc8: TppDBCalc;
    ppLabel127: TppLabel;
    RND_NDS: TppLabel;
    ppLabel129: TppLabel;
    RND_SUMM: TppMemo;
    ppLabel130: TppLabel;
    ppDBText50: TppDBText;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppRegion1: TppRegion;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppDBText20: TppDBText;
    ppShape1: TppShape;
    ppRegion2: TppRegion;
    ppRegion3: TppRegion;
    ppRegion4: TppRegion;
    ppRegion5: TppRegion;
    ppDBMemo26: TppDBMemo;
    ppRegion6: TppRegion;
    ppRegion7: TppRegion;
    ppRegion8: TppRegion;
    ppRegion9: TppRegion;
    ppDBMemo27: TppDBMemo;
    ppDBMemo28: TppDBMemo;
    ppRegion10: TppRegion;
    ppDBMemo29: TppDBMemo;
    ppDBMemo30: TppDBMemo;
    ppLabel19: TppLabel;
    ppDBMemo20: TppDBMemo;
    ppRegion11: TppRegion;
    ppShape8: TppShape;
    ppLabel88: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppRegion12: TppRegion;
    ppDBMemo21: TppDBMemo;
    ppLabel99: TppLabel;
    ppRegion13: TppRegion;
    ppLabel100: TppLabel;
    ppDBMemo22: TppDBMemo;
    ppRegion14: TppRegion;
    ppLabel101: TppLabel;
    ppDBMemo23: TppDBMemo;
    ppRegion15: TppRegion;
    ppLabel102: TppLabel;
    ppDBMemo25: TppDBMemo;
    ppRegion16: TppRegion;
    ppLabel103: TppLabel;
    ppDBMemo31: TppDBMemo;
    ppRegion17: TppRegion;
    ppLabel104: TppLabel;
    ppDBMemo32: TppDBMemo;
    ppRegion18: TppRegion;
    ppLabel105: TppLabel;
    ppDBMemo33: TppDBMemo;
    ppRegion19: TppRegion;
    ppLabel106: TppLabel;
    ppDBMemo34: TppDBMemo;
    ppRegion20: TppRegion;
    ppShape10: TppShape;
    ppLabel128: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppRegion21: TppRegion;
    PP_RSNAKLDShape3: TppShape;
    PP_RSNAKLDShape1: TppShape;
    PP_RSNAKLDShape2: TppShape;
    PP_RSNAKLDLabel1: TppLabel;
    PP_RSNAKLDMemo1: TppMemo;
    PP_RSNAKLDLabel2: TppLabel;
    PP_RSNAKLDLabel3: TppLabel;
    PP_RSNAKLDLabel4: TppLabel;
    PP_RSNAKLDLabel5: TppLabel;
    PP_RSNAKLDLabel6: TppLabel;
    PP_RSNAKLDLabel7: TppLabel;
    PP_RSNAKLDLabel8: TppLabel;
    PP_RSNAKLDLine1: TppLine;
    PP_RSNAKLDLine2: TppLine;
    PP_RSNAKLDLine3: TppLine;
    PP_RSNAKLDLine4: TppLine;
    PP_RSNAKLDLine5: TppLine;
    PP_RSNAKLDLine6: TppLine;
    PP_RSNAKLDLabel9: TppLabel;
    PP_RSNAKLDLine7: TppLine;
    PP_RSNAKLDLine8: TppLine;
    PP_RSNAKLDMemo2: TppMemo;
    ppLabel91: TppLabel;
    PipMail: TppDBPipeline;
    PipMails: TppDBPipeline;
    PpMAIL: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppDetailBand6: TppDetailBand;
    ppFooterBand6: TppFooterBand;
    ppTitleBand3: TppTitleBand;
    ppSummaryBand3: TppSummaryBand;
    ppLine31: TppLine;
    ppLabel93: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLabel94: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppLabel95: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    PpMailUser: TppLabel;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    PpMailVers: TppLabel;
    ppLabel144: TppLabel;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText15: TppDBText;
    ppShape7: TppShape;
    MailsTitle1: TppLabel;
    MailsTitle2: TppLabel;
    ppDBMemo35: TppDBMemo;
    ppImage7: TppImage;
    ppRegion22: TppRegion;
    ppLabel143: TppLabel;
    ppDBText14: TppDBText;
    ppLabel145: TppLabel;
    ppDBText16: TppDBText;
    ppLine32: TppLine;
    ppRegion23: TppRegion;
    ppDBMemo36: TppDBMemo;
    ppRegion24: TppRegion;
    ppLabel146: TppLabel;
    ppDBMemo37: TppDBMemo;
    ppDBCalc9: TppDBCalc;
    ppLine34: TppLine;
    ppDBMemo38: TppDBMemo;
    ppDBText37: TppDBText;
    ppDBText40: TppDBText;
    PipMail2: TppDBPipeline;
    PipMails2: TppDBPipeline;
    PpZAY: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppDetailBand7: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppTitleBand4: TppTitleBand;
    ppSummaryBand4: TppSummaryBand;
    ppImage8: TppImage;
    ppLine33: TppLine;
    ppLabel98: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppLabel147: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppLabel148: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    PpZayUser: TppLabel;
    ppLabel152: TppLabel;
    ppDBText41: TppDBText;
    ppLabel153: TppLabel;
    PpZayVers: TppLabel;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    ppDBText51: TppDBText;
    ppRegion25: TppRegion;
    ppRegion26: TppRegion;
    ppRegion27: TppRegion;
    ppRegion28: TppRegion;
    ppLabel157: TppLabel;
    ppDBMemo39: TppDBMemo;
    ppDBMemo40: TppDBMemo;
    ppRegion29: TppRegion;
    ppLabel158: TppLabel;
    ppDBMemo41: TppDBMemo;
    ppLabel159: TppLabel;
    ppDBMemo42: TppDBMemo;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppDBText52: TppDBText;
    ppDBMemo43: TppDBMemo;
    ppDBMemo44: TppDBMemo;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText81: TppDBText;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    ppLabel166: TppLabel;
    ppLabel167: TppLabel;
    ppLabel168: TppLabel;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppRegion30: TppRegion;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppLabel174: TppLabel;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppLabel178: TppLabel;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    ppLabel182: TppLabel;
    ppLabel183: TppLabel;
    ppLabel184: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppShape12: TppShape;
    ppLabel151: TppLabel;
    ppDBText42: TppDBText;
    ppLabel154: TppLabel;
    ppDBText43: TppDBText;
    PpZayFAX: TppReport;
    ppTitleBand5: TppTitleBand;
    ppImage10: TppImage;
    ppRegion31: TppRegion;
    ppLabel186: TppLabel;
    ppDBMemo45: TppDBMemo;
    ppRegion32: TppRegion;
    ppDBMemo46: TppDBMemo;
    ppRegion33: TppRegion;
    ppLabel187: TppLabel;
    ppDBMemo47: TppDBMemo;
    ppRegion35: TppRegion;
    ppLabel189: TppLabel;
    ppLabel191: TppLabel;
    ppLabel193: TppLabel;
    ppLabel195: TppLabel;
    ppLabel201: TppLabel;
    ppDBText95: TppDBText;
    ppLabel202: TppLabel;
    ppDBText96: TppDBText;
    ppHeaderBand8: TppHeaderBand;
    ppDetailBand8: TppDetailBand;
    ppDBCalc14: TppDBCalc;
    ppDBMemo50: TppDBMemo;
    ppDBText114: TppDBText;
    ppDBText116: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppLine39: TppLine;
    ppLabel225: TppLabel;
    ppLabel185: TppLabel;
    ppDBText86: TppDBText;
    PpZayExp: TppReport;
    ppTitleBand6: TppTitleBand;
    ppImage11: TppImage;
    ppRegion34: TppRegion;
    ppRegion36: TppRegion;
    ppDBMemo49: TppDBMemo;
    ppRegion37: TppRegion;
    ppLabel192: TppLabel;
    ppDBMemo51: TppDBMemo;
    ppRegion38: TppRegion;
    ppRegion39: TppRegion;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel198: TppLabel;
    ppLabel200: TppLabel;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppLabel205: TppLabel;
    ppHeaderBand9: TppHeaderBand;
    ppDetailBand9: TppDetailBand;
    ppDBCalc15: TppDBCalc;
    ppDBText108: TppDBText;
    ppDBMemo54: TppDBMemo;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppLine37: TppLine;
    ppFooterBand8: TppFooterBand;
    ppLine38: TppLine;
    ppLabel224: TppLabel;
    ppSystemVariable16: TppSystemVariable;
    ppLabel226: TppLabel;
    ppSystemVariable17: TppSystemVariable;
    ppLabel227: TppLabel;
    ppSystemVariable18: TppSystemVariable;
    ppLabel228: TppLabel;
    ppLabel229: TppLabel;
    PpZayExpUser: TppLabel;
    ppLabel231: TppLabel;
    ppDBText126: TppDBText;
    ppLabel233: TppLabel;
    PpZayExpVers: TppLabel;
    ppLabel235: TppLabel;
    ppSummaryBand6: TppSummaryBand;
    ppLine40: TppLine;
    ppLabel236: TppLabel;
    ppDBCalc16: TppDBCalc;
    ppRegion41: TppRegion;
    ppLabel188: TppLabel;
    ppDBMemo55: TppDBMemo;
    ppLabel210: TppLabel;
    ppDBMemo56: TppDBMemo;
    ppLabel190: TppLabel;
    ppDBText87: TppDBText;
    ppLabel211: TppLabel;
    ppDBText98: TppDBText;
    ppLabel237: TppLabel;
    ppDBMemo48: TppDBMemo;
    ppRegion42: TppRegion;
    ppLabel238: TppLabel;
    ppDBMemo57: TppDBMemo;
    ppDBText88: TppDBText;
    ppRegion40: TppRegion;
    ppLabel194: TppLabel;
    ppLabel199: TppLabel;
    ppLabel206: TppLabel;
    ppLabel207: TppLabel;
    ppLabel208: TppLabel;
    ppLabel209: TppLabel;
    ppLabel212: TppLabel;
    ppLabel213: TppLabel;
    ppLabel214: TppLabel;
    ppLabel215: TppLabel;
    ppLabel216: TppLabel;
    ppLabel217: TppLabel;
    ppLabel218: TppLabel;
    PipSpis: TppDBPipeline;
    PipSpiss: TppDBPipeline;
    PpSpis: TppReport;
    ppTitleBand7: TppTitleBand;
    ppImage13: TppImage;
    ppRegion43: TppRegion;
    ppLabel220: TppLabel;
    ppDBText89: TppDBText;
    ppRegion44: TppRegion;
    ppDBMemo53: TppDBMemo;
    ppLabel221: TppLabel;
    ppRegion45: TppRegion;
    ppLabel222: TppLabel;
    ppDBMemo58: TppDBMemo;
    ppRegion46: TppRegion;
    ppLabel223: TppLabel;
    ppDBMemo59: TppDBMemo;
    ppRegion47: TppRegion;
    ppLabel230: TppLabel;
    ppDBMemo60: TppDBMemo;
    ppRegion52: TppRegion;
    ppLabel242: TppLabel;
    ppLabel243: TppLabel;
    ppLabel244: TppLabel;
    ppLabel245: TppLabel;
    ppLabel246: TppLabel;
    ppLabel247: TppLabel;
    ppHeaderBand10: TppHeaderBand;
    ppShape16: TppShape;
    ppLabel249: TppLabel;
    ppLabel250: TppLabel;
    ppLabel251: TppLabel;
    ppLabel252: TppLabel;
    ppLabel253: TppLabel;
    ppLabel254: TppLabel;
    ppLabel255: TppLabel;
    ppDetailBand10: TppDetailBand;
    ppDBCalc17: TppDBCalc;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText97: TppDBText;
    ppDBMemo65: TppDBMemo;
    ppFooterBand9: TppFooterBand;
    ppLine41: TppLine;
    ppLabel256: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppLabel257: TppLabel;
    ppSystemVariable20: TppSystemVariable;
    ppLabel258: TppLabel;
    ppSystemVariable21: TppSystemVariable;
    ppLabel259: TppLabel;
    ppLabel260: TppLabel;
    PpSpisUser: TppLabel;
    ppLabel262: TppLabel;
    ppDBText99: TppDBText;
    ppLabel263: TppLabel;
    PpSpisVers: TppLabel;
    ppLabel265: TppLabel;
    ppSummaryBand7: TppSummaryBand;
    ppLine42: TppLine;
    ppLabel266: TppLabel;
    ppDBCalc18: TppDBCalc;
    ppLabel267: TppLabel;
    ppDBCalc19: TppDBCalc;
    ppLabel268: TppLabel;
    ppDBCalc20: TppDBCalc;
    ppLabel271: TppLabel;
    SPIS_SUMM: TppMemo;
    ppLabel272: TppLabel;
    ppDBText100: TppDBText;
    ppLabel273: TppLabel;
    ppLabel274: TppLabel;
    ppLabel275: TppLabel;
    ppLabel219: TppLabel;
    ppLabel234: TppLabel;
    PipPer: TppDBPipeline;
    PipPers: TppDBPipeline;
    PpPER: TppReport;
    ppTitleBand8: TppTitleBand;
    ppImage15: TppImage;
    ppRegion48: TppRegion;
    ppLabel240: TppLabel;
    ppDBText90: TppDBText;
    ppRegion49: TppRegion;
    ppDBMemo61: TppDBMemo;
    ppRegion50: TppRegion;
    ppLabel248: TppLabel;
    ppDBMemo62: TppDBMemo;
    ppRegion51: TppRegion;
    ppLabel261: TppLabel;
    ppDBMemo63: TppDBMemo;
    ppRegion55: TppRegion;
    ppLabel270: TppLabel;
    ppDBMemo67: TppDBMemo;
    ppRegion57: TppRegion;
    ppLabel277: TppLabel;
    ppDBMemo69: TppDBMemo;
    ppRegion58: TppRegion;
    ppLabel278: TppLabel;
    ppLabel279: TppLabel;
    ppLabel280: TppLabel;
    ppLabel281: TppLabel;
    ppLabel282: TppLabel;
    ppLabel283: TppLabel;
    ppLabel284: TppLabel;
    ppHeaderBand11: TppHeaderBand;
    ppShape17: TppShape;
    ppLabel285: TppLabel;
    ppLabel286: TppLabel;
    ppLabel287: TppLabel;
    ppLabel288: TppLabel;
    ppLabel289: TppLabel;
    ppLabel290: TppLabel;
    ppLabel291: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppDBCalc21: TppDBCalc;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBMemo70: TppDBMemo;
    ppFooterBand10: TppFooterBand;
    ppLine43: TppLine;
    ppLabel292: TppLabel;
    ppSystemVariable22: TppSystemVariable;
    ppLabel293: TppLabel;
    ppSystemVariable23: TppSystemVariable;
    ppLabel294: TppLabel;
    ppSystemVariable24: TppSystemVariable;
    ppLabel295: TppLabel;
    ppLabel296: TppLabel;
    PpPerUser: TppLabel;
    ppLabel298: TppLabel;
    ppDBText107: TppDBText;
    ppLabel299: TppLabel;
    PpPerVers: TppLabel;
    ppLabel301: TppLabel;
    ppSummaryBand8: TppSummaryBand;
    ppLine44: TppLine;
    ppLabel302: TppLabel;
    ppDBCalc22: TppDBCalc;
    ppLabel303: TppLabel;
    ppDBCalc23: TppDBCalc;
    ppLabel304: TppLabel;
    ppDBCalc24: TppDBCalc;
    ppLabel307: TppLabel;
    PER_SUMM: TppMemo;
    ppLabel308: TppLabel;
    ppDBText109: TppDBText;
    ppLabel310: TppLabel;
    ppLabel239: TppLabel;
    ppLabel241: TppLabel;
    ppLabel297: TppLabel;
    ppLabel300: TppLabel;
    ppLabel264: TppLabel;
    ppLabel269: TppLabel;
    ppLabel313: TppLabel;
    ppLabel314: TppLabel;
    ppLabel276: TppLabel;
    ppLabel315: TppLabel;
    ppLabel316: TppLabel;
    ppDBMemo52: TppDBMemo;
    ppDBMemo64: TppDBMemo;
    ppDBText101: TppDBText;
    ppLabel317: TppLabel;
    ppLabel318: TppLabel;
    ppLabel319: TppLabel;
    ppLabel305: TppLabel;
    ppLabel306: TppLabel;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLabel309: TppLabel;
    ppLabel311: TppLabel;
    ppLabel312: TppLabel;
    ppLabel320: TppLabel;
    ppLabel321: TppLabel;
    PipPN: TppDBPipeline;
    PipPNS: TppDBPipeline;
    PpPnRozn: TppReport;
    ppTitleBand9: TppTitleBand;
    ppImage17: TppImage;
    ppRegion53: TppRegion;
    ppLabel323: TppLabel;
    ppDBText110: TppDBText;
    ppRegion54: TppRegion;
    ppDBMemo68: TppDBMemo;
    ppLabel324: TppLabel;
    ppRegion56: TppRegion;
    ppLabel325: TppLabel;
    ppDBMemo71: TppDBMemo;
    ppRegion59: TppRegion;
    ppLabel326: TppLabel;
    ppDBMemo72: TppDBMemo;
    ppRegion60: TppRegion;
    ppLabel327: TppLabel;
    ppDBMemo73: TppDBMemo;
    ppRegion61: TppRegion;
    ppLabel328: TppLabel;
    ppDBMemo74: TppDBMemo;
    ppRegion65: TppRegion;
    ppLabel332: TppLabel;
    ppLabel333: TppLabel;
    ppLabel334: TppLabel;
    ppLabel335: TppLabel;
    ppLabel336: TppLabel;
    ppLabel337: TppLabel;
    ppLabel338: TppLabel;
    ppHeaderBand12: TppHeaderBand;
    ppShape18: TppShape;
    ppLabel339: TppLabel;
    ppLabel340: TppLabel;
    ppLabel341: TppLabel;
    ppLabel342: TppLabel;
    ppLabel343: TppLabel;
    ppLabel344: TppLabel;
    ppLabel345: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBCalc25: TppDBCalc;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText115: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBMemo78: TppDBMemo;
    ppFooterBand11: TppFooterBand;
    ppLine53: TppLine;
    ppLabel346: TppLabel;
    ppSystemVariable25: TppSystemVariable;
    ppLabel347: TppLabel;
    ppSystemVariable26: TppSystemVariable;
    ppLabel348: TppLabel;
    ppSystemVariable27: TppSystemVariable;
    ppLabel349: TppLabel;
    ppLabel350: TppLabel;
    PpPnRoznUser: TppLabel;
    ppLabel352: TppLabel;
    ppDBText123: TppDBText;
    ppLabel353: TppLabel;
    PpPnRoznVers: TppLabel;
    ppLabel355: TppLabel;
    ppSummaryBand9: TppSummaryBand;
    ppLine54: TppLine;
    ppLabel356: TppLabel;
    ppDBCalc26: TppDBCalc;
    ppLabel357: TppLabel;
    ppDBCalc27: TppDBCalc;
    ppLabel358: TppLabel;
    ppDBCalc28: TppDBCalc;
    ppLabel359: TppLabel;
    ppLabel361: TppLabel;
    PNROZN_SUMM: TppMemo;
    ppLabel362: TppLabel;
    ppDBText124: TppDBText;
    ppLabel363: TppLabel;
    ppLabel364: TppLabel;
    ppLabel365: TppLabel;
    ppLabel366: TppLabel;
    ppLabel322: TppLabel;
    ppDBMemo66: TppDBMemo;
    ppDBMemo75: TppDBMemo;
    ppDBText111: TppDBText;
    ppLabel329: TppLabel;
    ppLabel330: TppLabel;
    ppLabel331: TppLabel;
    ppLabel351: TppLabel;
    ppLabel354: TppLabel;
    ppLabel367: TppLabel;
    PpCheckRN: TppReport;
    ppTitleBand10: TppTitleBand;
    ppImage19: TppImage;
    ppRegion62: TppRegion;
    ppLabel368: TppLabel;
    ppDBText125: TppDBText;
    ppDBText127: TppDBText;
    ppRegion63: TppRegion;
    ppDBMemo77: TppDBMemo;
    ppLabel369: TppLabel;
    ppRegion69: TppRegion;
    ppLabel374: TppLabel;
    ppDBMemo83: TppDBMemo;
    ppRegion70: TppRegion;
    ppLabel375: TppLabel;
    ppDBMemo84: TppDBMemo;
    ppRegion72: TppRegion;
    ppLabel377: TppLabel;
    ppLabel378: TppLabel;
    ppLabel379: TppLabel;
    ppLabel380: TppLabel;
    ppLabel381: TppLabel;
    ppLabel382: TppLabel;
    ppLabel383: TppLabel;
    ppHeaderBand13: TppHeaderBand;
    ppShape19: TppShape;
    ppLabel384: TppLabel;
    ppLabel385: TppLabel;
    ppLabel386: TppLabel;
    ppLabel387: TppLabel;
    ppLabel388: TppLabel;
    ppLabel389: TppLabel;
    ppLabel390: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppDBCalc29: TppDBCalc;
    ppDBText128: TppDBText;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBMemo86: TppDBMemo;
    ppFooterBand12: TppFooterBand;
    ppSummaryBand10: TppSummaryBand;
    ppLine56: TppLine;
    ppLabel401: TppLabel;
    ppDBCalc30: TppDBCalc;
    ppLabel402: TppLabel;
    ppDBCalc31: TppDBCalc;
    ppLabel403: TppLabel;
    ppDBCalc32: TppDBCalc;
    ppLabel406: TppLabel;
    CHECKRN_SUMM: TppMemo;
    ppLabel407: TppLabel;
    ppDBText134: TppDBText;
    ppLabel408: TppLabel;
    PipKKM: TppDBPipeline;
    PipKKMS: TppDBPipeline;
    PpCheckKKM: TppReport;
    ppTitleBand11: TppTitleBand;
    ppImage21: TppImage;
    ppRegion64: TppRegion;
    ppLabel360: TppLabel;
    ppDBText135: TppDBText;
    ppRegion71: TppRegion;
    ppLabel373: TppLabel;
    ppLabel376: TppLabel;
    ppLabel396: TppLabel;
    ppLabel399: TppLabel;
    ppLabel404: TppLabel;
    ppLabel405: TppLabel;
    ppLabel409: TppLabel;
    ppHeaderBand14: TppHeaderBand;
    ppShape11: TppShape;
    ppLabel410: TppLabel;
    ppLabel411: TppLabel;
    ppLabel412: TppLabel;
    ppLabel413: TppLabel;
    ppLabel414: TppLabel;
    ppLabel415: TppLabel;
    ppLabel416: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppDBCalc33: TppDBCalc;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppDBMemo81: TppDBMemo;
    ppFooterBand13: TppFooterBand;
    ppSummaryBand11: TppSummaryBand;
    ppLine58: TppLine;
    ppLabel427: TppLabel;
    ppDBCalc34: TppDBCalc;
    ppLabel428: TppLabel;
    ppDBCalc35: TppDBCalc;
    ppLabel429: TppLabel;
    ppDBCalc36: TppDBCalc;
    ppLabel430: TppLabel;
    CHECKKKM_SUMM: TppMemo;
    ppLabel431: TppLabel;
    ppDBText143: TppDBText;
    ppLabel432: TppLabel;
    ppLabel422: TppLabel;
    PipSTFAKT: TppDBPipeline;
    PipSTFAKTS: TppDBPipeline;
    PipST: TppDBPipeline;
    PipSTS: TppDBPipeline;
    PpST: TppReport;
    ppTitleBand13: TppTitleBand;
    ppDBMemo94: TppDBMemo;
    ppImage25: TppImage;
    ppRegion81: TppRegion;
    ppShape15: TppShape;
    ppLabel472: TppLabel;
    ppDBText154: TppDBText;
    ppDBText155: TppDBText;
    ppRegion82: TppRegion;
    ppDBMemo95: TppDBMemo;
    ppLabel473: TppLabel;
    ppRegion83: TppRegion;
    ppLabel494: TppLabel;
    ppDBMemo96: TppDBMemo;
    ppRegion84: TppRegion;
    ppLabel495: TppLabel;
    ppDBMemo97: TppDBMemo;
    ppRegion85: TppRegion;
    ppLabel496: TppLabel;
    ppDBMemo98: TppDBMemo;
    ppRegion86: TppRegion;
    ppLabel497: TppLabel;
    ppDBMemo99: TppDBMemo;
    ppRegion87: TppRegion;
    ppLabel498: TppLabel;
    ppDBMemo100: TppDBMemo;
    ppRegion88: TppRegion;
    ppLabel499: TppLabel;
    ppDBMemo101: TppDBMemo;
    ppRegion89: TppRegion;
    ppLabel500: TppLabel;
    ppDBMemo102: TppDBMemo;
    ppRegion90: TppRegion;
    ppHeaderBand16: TppHeaderBand;
    ppShape22: TppShape;
    ppLabel508: TppLabel;
    ppLabel509: TppLabel;
    ppLabel510: TppLabel;
    ppLabel511: TppLabel;
    ppLabel512: TppLabel;
    ppLabel513: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppDBCalc43: TppDBCalc;
    ppDBText156: TppDBText;
    ppDBText157: TppDBText;
    ppDBText158: TppDBText;
    ppDBText159: TppDBText;
    ppDBText160: TppDBText;
    ppDBMemo103: TppDBMemo;
    ppFooterBand15: TppFooterBand;
    ppLabel515: TppLabel;
    ppSystemVariable37: TppSystemVariable;
    ppLabel516: TppLabel;
    ppSystemVariable38: TppSystemVariable;
    ppLabel517: TppLabel;
    ppSystemVariable39: TppSystemVariable;
    ppLabel519: TppLabel;
    PpStUser: TppLabel;
    ppLabel521: TppLabel;
    ppDBText161: TppDBText;
    ppLabel522: TppLabel;
    PpStVers: TppLabel;
    ppLabel524: TppLabel;
    ppSummaryBand13: TppSummaryBand;
    ppLine62: TppLine;
    ppLabel525: TppLabel;
    ppDBCalc44: TppDBCalc;
    ppLabel526: TppLabel;
    ppDBCalc45: TppDBCalc;
    ppLabel527: TppLabel;
    ppDBCalc46: TppDBCalc;
    ppLabel528: TppLabel;
    ST_NDS: TppLabel;
    ppDBText162: TppDBText;
    ppLabel532: TppLabel;
    ppLabel533: TppLabel;
    ppLabel534: TppLabel;
    ppSystemVariable40: TppSystemVariable;
    ppLabel122: TppLabel;
    ppLabel471: TppLabel;
    ppSystemVariable41: TppSystemVariable;
    ppLabel520: TppLabel;
    ppSystemVariable42: TppSystemVariable;
    ppLabel523: TppLabel;
    PpStUser2: TppLabel;
    ppLabel536: TppLabel;
    ppLabel537: TppLabel;
    PpStVers2: TppLabel;
    ppDBText163: TppDBText;
    ppDBText164: TppDBText;
    ppLabel529: TppLabel;
    ppLabel530: TppLabel;
    ST_SUMM: TppMemo;
    ppLine61: TppLine;
    ppLabel507: TppLabel;
    ppLabel501: TppLabel;
    ppLabel502: TppLabel;
    ppLabel503: TppLabel;
    ppLabel504: TppLabel;
    ppLabel505: TppLabel;
    ppLabel506: TppLabel;
    PipRemon: TppDBPipeline;
    PipRemons: TppDBPipeline;
    PpREMON: TppReport;
    ppTitleBand14: TppTitleBand;
    ppImage28: TppImage;
    ppRegion91: TppRegion;
    ppShape20: TppShape;
    ppLabel514: TppLabel;
    ppDBText165: TppDBText;
    ppRegion92: TppRegion;
    ppDBMemo105: TppDBMemo;
    ppRegion93: TppRegion;
    ppLabel535: TppLabel;
    ppDBMemo106: TppDBMemo;
    ppRegion94: TppRegion;
    ppLabel538: TppLabel;
    ppDBMemo107: TppDBMemo;
    ppRegion100: TppRegion;
    ppLabel544: TppLabel;
    ppLabel545: TppLabel;
    ppLabel546: TppLabel;
    ppLabel547: TppLabel;
    ppLabel548: TppLabel;
    ppLabel549: TppLabel;
    ppLabel550: TppLabel;
    ppLabel551: TppLabel;
    ppSystemVariable43: TppSystemVariable;
    ppSystemVariable44: TppSystemVariable;
    ppLabel552: TppLabel;
    ppSystemVariable45: TppSystemVariable;
    ppLabel553: TppLabel;
    ppLabel554: TppLabel;
    PpRemonUser: TppLabel;
    ppImage29: TppImage;
    ppLabel556: TppLabel;
    ppLabel557: TppLabel;
    PpRemonVers: TppLabel;
    ppHeaderBand17: TppHeaderBand;
    ppShape23: TppShape;
    ppLabel559: TppLabel;
    ppLabel560: TppLabel;
    ppLabel561: TppLabel;
    ppLabel562: TppLabel;
    ppLabel563: TppLabel;
    ppLabel564: TppLabel;
    ppLabel565: TppLabel;
    ppLabel566: TppLabel;
    ppDBText167: TppDBText;
    ppLabel567: TppLabel;
    PpRemonVers2: TppLabel;
    ppLabel569: TppLabel;
    ppSystemVariable46: TppSystemVariable;
    ppLabel570: TppLabel;
    ppLabel571: TppLabel;
    ppSystemVariable47: TppSystemVariable;
    ppLabel572: TppLabel;
    ppSystemVariable48: TppSystemVariable;
    ppLabel573: TppLabel;
    PpRemonUser2: TppLabel;
    ppDetailBand17: TppDetailBand;
    ppDBCalc47: TppDBCalc;
    ppDBText168: TppDBText;
    ppDBText170: TppDBText;
    ppDBText171: TppDBText;
    ppDBText172: TppDBText;
    ppDBMemo113: TppDBMemo;
    ppFooterBand16: TppFooterBand;
    ppSummaryBand14: TppSummaryBand;
    ppLine64: TppLine;
    ppLabel575: TppLabel;
    ppDBCalc48: TppDBCalc;
    ppLabel576: TppLabel;
    ppDBText173: TppDBText;
    ppLabel584: TppLabel;
    ppDBText166: TppDBText;
    ppDBMemo104: TppDBMemo;
    ppLabel531: TppLabel;
    ppLabel539: TppLabel;
    ppLabel585: TppLabel;
    ppSystemVariable49: TppSystemVariable;
    ppLabel586: TppLabel;
    ppSystemVariable50: TppSystemVariable;
    ppLabel605: TppLabel;
    ppSystemVariable51: TppSystemVariable;
    ppLabel606: TppLabel;
    PpMailUser2: TppLabel;
    ppLabel619: TppLabel;
    ppDBText184: TppDBText;
    ppDBText185: TppDBText;
    ppLabel119: TppLabel;
    ppSystemVariable52: TppSystemVariable;
    ppSystemVariable53: TppSystemVariable;
    ppLabel620: TppLabel;
    ppSystemVariable54: TppSystemVariable;
    ppLabel621: TppLabel;
    ppLabel622: TppLabel;
    PpRnUser2: TppLabel;
    ppDBText186: TppDBText;
    ppDBText187: TppDBText;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppLabel623: TppLabel;
    ppSystemVariable55: TppSystemVariable;
    ppSystemVariable56: TppSystemVariable;
    ppLabel624: TppLabel;
    ppSystemVariable57: TppSystemVariable;
    ppLabel625: TppLabel;
    ppLabel626: TppLabel;
    PpPnRoznUser2: TppLabel;
    PpPnZak: TppReport;
    ppTitleBand16: TppTitleBand;
    ppImage32: TppImage;
    ppRegion107: TppRegion;
    ppLabel627: TppLabel;
    ppDBText190: TppDBText;
    ppLabel628: TppLabel;
    ppRegion108: TppRegion;
    ppDBMemo119: TppDBMemo;
    ppLabel632: TppLabel;
    ppLabel633: TppLabel;
    ppRegion109: TppRegion;
    ppLabel639: TppLabel;
    ppDBMemo120: TppDBMemo;
    ppRegion110: TppRegion;
    ppRegion113: TppRegion;
    ppLabel643: TppLabel;
    ppLabel644: TppLabel;
    ppLabel645: TppLabel;
    ppLabel646: TppLabel;
    ppLabel647: TppLabel;
    ppLabel648: TppLabel;
    ppLabel649: TppLabel;
    ppLabel650: TppLabel;
    ppLabel651: TppLabel;
    ppLabel652: TppLabel;
    ppDBText191: TppDBText;
    ppSystemVariable58: TppSystemVariable;
    ppSystemVariable59: TppSystemVariable;
    ppLabel653: TppLabel;
    ppSystemVariable60: TppSystemVariable;
    ppLabel654: TppLabel;
    ppLabel655: TppLabel;
    ppHeaderBand19: TppHeaderBand;
    ppShape25: TppShape;
    ppLabel657: TppLabel;
    ppLabel658: TppLabel;
    ppLabel659: TppLabel;
    ppLabel660: TppLabel;
    ppLabel661: TppLabel;
    ppLabel662: TppLabel;
    ppLabel663: TppLabel;
    ppLabel664: TppLabel;
    ppLabel665: TppLabel;
    ppLabel666: TppLabel;
    ppLine67: TppLine;
    ppLabel667: TppLabel;
    ppSystemVariable61: TppSystemVariable;
    ppLabel668: TppLabel;
    ppSystemVariable62: TppSystemVariable;
    ppLabel669: TppLabel;
    ppSystemVariable63: TppSystemVariable;
    ppLabel670: TppLabel;
    ppLabel671: TppLabel;
    ppLabel673: TppLabel;
    ppDBText192: TppDBText;
    ppLabel674: TppLabel;
    ppLabel675: TppLabel;
    ppDetailBand19: TppDetailBand;
    ppDBCalc55: TppDBCalc;
    ppDBText193: TppDBText;
    ppDBText194: TppDBText;
    ppDBText195: TppDBText;
    ppDBText196: TppDBText;
    ppDBText197: TppDBText;
    ppDBMemo124: TppDBMemo;
    ppDBMemo125: TppDBMemo;
    ppDBMemo126: TppDBMemo;
    ppDBText198: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppSummaryBand16: TppSummaryBand;
    ppLine68: TppLine;
    ppLabel677: TppLabel;
    ppDBCalc56: TppDBCalc;
    ppLabel678: TppLabel;
    ppDBCalc57: TppDBCalc;
    ppLabel679: TppLabel;
    ppDBCalc58: TppDBCalc;
    ppLabel680: TppLabel;
    ppLabel682: TppLabel;
    PNZAK_SUMM: TppMemo;
    ppLabel683: TppLabel;
    ppDBText199: TppDBText;
    ppLabel684: TppLabel;
    ppLabel685: TppLabel;
    ppLabel686: TppLabel;
    ppLabel687: TppLabel;
    PpPnZakUser: TppLabel;
    PpPnZakUser2: TppLabel;
    PpPnZakVers: TppLabel;
    PipGarant: TppDBPipeline;
    PpGarant: TppReport;
    ppDetailBand20: TppDetailBand;
    ppLabel641: TppLabel;
    ppDBText200: TppDBText;
    ppLabel642: TppLabel;
    ppLabel656: TppLabel;
    ppDBText201: TppDBText;
    ppDBText202: TppDBText;
    ppLine69: TppLine;
    ppLabel672: TppLabel;
    ppDBText203: TppDBText;
    ppLabel676: TppLabel;
    ppLabel681: TppLabel;
    ppLabel688: TppLabel;
    ppLabel689: TppLabel;
    ppLabel690: TppLabel;
    ppLabel691: TppLabel;
    ppLabel692: TppLabel;
    ppDBText204: TppDBText;
    ppDBText205: TppDBText;
    ppDBText206: TppDBText;
    ppDBText207: TppDBText;
    GARANT_MONEY: TppMemo;
    ppRegion111: TppRegion;
    ppDBMemo122: TppDBMemo;
    ppRegion112: TppRegion;
    ppLabel693: TppLabel;
    ppDBText208: TppDBText;
    ppLabel694: TppLabel;
    ppLine70: TppLine;
    ppLine71: TppLine;
    ppLabel695: TppLabel;
    ppLabel696: TppLabel;
    ppLabel697: TppLabel;
    ppLabel698: TppLabel;
    ppLabel699: TppLabel;
    ppDBText209: TppDBText;
    ppLine72: TppLine;
    ppLabel700: TppLabel;
    ppLabel701: TppLabel;
    ppDBText210: TppDBText;
    ppLabel702: TppLabel;
    ppDBText211: TppDBText;
    ppDBText212: TppDBText;
    ppLabel703: TppLabel;
    ppLabel704: TppLabel;
    ppDBText213: TppDBText;
    ppLabel705: TppLabel;
    ppLabel706: TppLabel;
    ppDBText214: TppDBText;
    ppLabel707: TppLabel;
    ppLabel708: TppLabel;
    GARANT_MONEY2: TppMemo;
    ppLabel709: TppLabel;
    ppLine73: TppLine;
    ppLabel710: TppLabel;
    ppLabel711: TppLabel;
    ppLabel712: TppLabel;
    ppLabel713: TppLabel;
    ppLine74: TppLine;
    ppImage34: TppImage;
    ppDBText215: TppDBText;
    ppDBText216: TppDBText;
    PipDetalKLN: TppDBPipeline;
    PpDetalKLN: TppReport;
    ppDetailBand21: TppDetailBand;
    ppTitleBand17: TppTitleBand;
    ppLabel714: TppLabel;
    ppLine75: TppLine;
    ppLabel715: TppLabel;
    ppDBMemo123: TppDBMemo;
    ppLabel716: TppLabel;
    ppLabel717: TppLabel;
    ppDBText217: TppDBText;
    ppLabel718: TppLabel;
    ppLabel719: TppLabel;
    ppLabel720: TppLabel;
    ppDBText218: TppDBText;
    ppDBText219: TppDBText;
    ppDBText220: TppDBText;
    ppRegion116: TppRegion;
    ppLabel721: TppLabel;
    ppDBMemo127: TppDBMemo;
    ppLabel722: TppLabel;
    ppLabel723: TppLabel;
    ppLabel724: TppLabel;
    ppLabel725: TppLabel;
    ppLabel726: TppLabel;
    ppLabel727: TppLabel;
    ppLabel728: TppLabel;
    ppLabel729: TppLabel;
    ppLabel730: TppLabel;
    ppDBText221: TppDBText;
    ppDBText222: TppDBText;
    ppDBText223: TppDBText;
    ppDBText224: TppDBText;
    ppDBText225: TppDBText;
    ppDBText226: TppDBText;
    ppDBText227: TppDBText;
    ppDBText228: TppDBText;
    ppDBText229: TppDBText;
    ppLabel731: TppLabel;
    ppDBText230: TppDBText;
    ppLabel732: TppLabel;
    ppDBText231: TppDBText;
    ppLabel733: TppLabel;
    ppDBText232: TppDBText;
    ppLabel734: TppLabel;
    ppDBText233: TppDBText;
    ppLabel735: TppLabel;
    ppDBText234: TppDBText;
    ppLabel736: TppLabel;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppLabel737: TppLabel;
    ppLabel738: TppLabel;
    ppDBText235: TppDBText;
    ppDBText236: TppDBText;
    ppLabel739: TppLabel;
    ppDBText237: TppDBText;
    ppLabel740: TppLabel;
    ppDBText238: TppDBText;
    ppDBText239: TppDBText;
    ppLabel741: TppLabel;
    ppLabel742: TppLabel;
    ppDBMemo128: TppDBMemo;
    ppRegion117: TppRegion;
    ppLabel743: TppLabel;
    ppDBText240: TppDBText;
    ppLabel744: TppLabel;
    ppDBText241: TppDBText;
    ppDBText242: TppDBText;
    ppLabel745: TppLabel;
    ppLabel746: TppLabel;
    ppDBText243: TppDBText;
    ppLabel747: TppLabel;
    ppDBText244: TppDBText;
    ppLabel748: TppLabel;
    ppDBText245: TppDBText;
    ppLabel749: TppLabel;
    ppShape28: TppShape;
    ppLabel750: TppLabel;
    ppLabel751: TppLabel;
    ppDBText246: TppDBText;
    ppDBMemo129: TppDBMemo;
    ppRegion118: TppRegion;
    ppLabel752: TppLabel;
    ppLabel753: TppLabel;
    ppLabel754: TppLabel;
    ppLabel755: TppLabel;
    ppDBText247: TppDBText;
    ppDBText248: TppDBText;
    ppDBText249: TppDBText;
    ppDBText250: TppDBText;
    ppLabel756: TppLabel;
    ppShape29: TppShape;
    ppLabel757: TppLabel;
    ppDBMemo130: TppDBMemo;
    ppRegion119: TppRegion;
    ppLabel758: TppLabel;
    ppDBText251: TppDBText;
    ppLabel759: TppLabel;
    ppDBText252: TppDBText;
    ppLabel760: TppLabel;
    ppDBText253: TppDBText;
    ppLabel761: TppLabel;
    ppDBText254: TppDBText;
    ppDBText255: TppDBText;
    ppLabel762: TppLabel;
    ppShape30: TppShape;
    ppLabel763: TppLabel;
    ppDBMemo131: TppDBMemo;
    ppRegion120: TppRegion;
    ppLabel764: TppLabel;
    ppDBText256: TppDBText;
    ppDBText257: TppDBText;
    ppLabel765: TppLabel;
    ppLabel766: TppLabel;
    ppDBText258: TppDBText;
    ppDBText259: TppDBText;
    ppLabel767: TppLabel;
    ppShape31: TppShape;
    ppDBMemo132: TppDBMemo;
    ppDBText260: TppDBText;
    ppSummaryBand17: TppSummaryBand;
    ppDBText261: TppDBText;
    ppRegion114: TppRegion;
    ppLabel768: TppLabel;
    PP_CENNIK_LARGE: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppDetailBand22: TppDetailBand;
    ppShape32: TppShape;
    ppDBText262: TppDBText;
    ppLabel769: TppLabel;
    ppDBText263: TppDBText;
    ppLabel770: TppLabel;
    ppFooterBand19: TppFooterBand;
    ppGroup13: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppDBText264: TppDBText;
    ppDBText265: TppDBText;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppDBMemo133: TppDBMemo;
    ppLine76: TppLine;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppGroup15: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppLabel772: TppLabel;
    ppDBMemo134: TppDBMemo;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppGroup16: TppGroup;
    ppGroupHeaderBand16: TppGroupHeaderBand;
    ppLabel773: TppLabel;
    ppDBMemo135: TppDBMemo;
    ppGroupFooterBand16: TppGroupFooterBand;
    ppGroup17: TppGroup;
    ppGroupHeaderBand17: TppGroupHeaderBand;
    ppLabel774: TppLabel;
    ppDBMemo136: TppDBMemo;
    ppGroupFooterBand17: TppGroupFooterBand;
    ppGroup18: TppGroup;
    ppGroupHeaderBand18: TppGroupHeaderBand;
    ppLabel775: TppLabel;
    ppDBMemo137: TppDBMemo;
    ppGroupFooterBand18: TppGroupFooterBand;
    ppLabel424: TppLabel;
    PpCheckKKMVERS: TppLabel;
    ppLabel426: TppLabel;
    ppLabel420: TppLabel;
    PpCheckKKMUSER: TppLabel;
    ppLabel417: TppLabel;
    ppSystemVariable31: TppSystemVariable;
    ppLabel394: TppLabel;
    PpCheckRNUser: TppLabel;
    ppLabel391: TppLabel;
    ppSystemVariable28: TppSystemVariable;
    ppLabel398: TppLabel;
    PpCheckRNVers: TppLabel;
    ppLabel400: TppLabel;
    ppDBMemo138: TppDBMemo;
    ppDBMemo139: TppDBMemo;
    ppDBMemo140: TppDBMemo;
    ppDBMemo141: TppDBMemo;
    PpSTFAKT: TppReport;
    ppTitleBand12: TppTitleBand;
    ppImage23: TppImage;
    ppRegion66: TppRegion;
    STFAKT_TITLE: TppMemo;
    ppRegion67: TppRegion;
    ppDBMemo79: TppDBMemo;
    ppLabel372: TppLabel;
    ppRegion68: TppRegion;
    ppLabel425: TppLabel;
    ppDBMemo80: TppDBMemo;
    ppRegion73: TppRegion;
    ppLabel433: TppLabel;
    ppDBMemo82: TppDBMemo;
    ppRegion74: TppRegion;
    ppLabel434: TppLabel;
    ppDBMemo85: TppDBMemo;
    ppRegion75: TppRegion;
    ppLabel435: TppLabel;
    ppDBMemo87: TppDBMemo;
    ppRegion76: TppRegion;
    ppLabel436: TppLabel;
    ppDBMemo88: TppDBMemo;
    ppRegion77: TppRegion;
    ppLabel437: TppLabel;
    ppDBMemo89: TppDBMemo;
    ppRegion78: TppRegion;
    ppLabel438: TppLabel;
    ppDBMemo90: TppDBMemo;
    ppRegion79: TppRegion;
    ppLabel439: TppLabel;
    ppLabel440: TppLabel;
    ppLabel445: TppLabel;
    ppLabel441: TppLabel;
    ppLabel442: TppLabel;
    ppLabel443: TppLabel;
    ppLabel444: TppLabel;
    ppLabel476: TppLabel;
    ppLabel477: TppLabel;
    ppLabel478: TppLabel;
    ppLabel482: TppLabel;
    ppLabel483: TppLabel;
    ppLabel484: TppLabel;
    ppLabel485: TppLabel;
    ppLabel486: TppLabel;
    ppLabel487: TppLabel;
    ppLabel488: TppLabel;
    ppLabel489: TppLabel;
    ppLabel490: TppLabel;
    ppLabel491: TppLabel;
    ppLabel492: TppLabel;
    ppRegion80: TppRegion;
    ppLabel370: TppLabel;
    ppDBMemo76: TppDBMemo;
    ppHeaderBand15: TppHeaderBand;
    ppShape21: TppShape;
    ppLabel446: TppLabel;
    ppLabel447: TppLabel;
    ppLabel448: TppLabel;
    ppLabel449: TppLabel;
    ppLabel450: TppLabel;
    ppLabel451: TppLabel;
    ppLabel452: TppLabel;
    ppLabel461: TppLabel;
    ppLabel465: TppLabel;
    ppLabel466: TppLabel;
    ppLabel467: TppLabel;
    ppLabel474: TppLabel;
    ppLabel475: TppLabel;
    ppLabel479: TppLabel;
    ppLabel480: TppLabel;
    ppLabel481: TppLabel;
    ppLabel393: TppLabel;
    ppLabel395: TppLabel;
    ppLabel397: TppLabel;
    ppLabel418: TppLabel;
    ppLabel419: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBCalc37: TppDBCalc;
    ppDBText145: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBMemo91: TppDBMemo;
    ppDBText136: TppDBText;
    ppDBText144: TppDBText;
    ppDBText152: TppDBText;
    ppLabel458: TppLabel;
    ppDBMemo92: TppDBMemo;
    ppDBMemo93: TppDBMemo;
    ppFooterBand14: TppFooterBand;
    ppLine59: TppLine;
    ppLabel453: TppLabel;
    ppSystemVariable34: TppSystemVariable;
    ppLabel454: TppLabel;
    ppSystemVariable35: TppSystemVariable;
    ppLabel455: TppLabel;
    ppSystemVariable36: TppSystemVariable;
    ppLabel456: TppLabel;
    ppLabel457: TppLabel;
    PpStfaktUser: TppLabel;
    STFAKT_TITLE2: TppLabel;
    ppLabel460: TppLabel;
    PpStfaktvers: TppLabel;
    ppLabel462: TppLabel;
    ppSummaryBand12: TppSummaryBand;
    ppLine60: TppLine;
    ppLabel463: TppLabel;
    ppDBCalc38: TppDBCalc;
    ppLabel464: TppLabel;
    ppDBCalc39: TppDBCalc;
    ppDBCalc40: TppDBCalc;
    STFAKT_SUMM: TppMemo;
    ppLabel469: TppLabel;
    ppDBText151: TppDBText;
    ppDBCalc41: TppDBCalc;
    ppDBCalc42: TppDBCalc;
    ppLabel459: TppLabel;
    ppLabel468: TppLabel;
    ppDBText150: TppDBText;
    ppDBText153: TppDBText;
    ppMemo1: TppMemo;
    ppMemo2: TppMemo;
    ppDBCalc59: TppDBCalc;
    ppDBCalc60: TppDBCalc;
    PipPsort: TppDBPipeline;
    PipPsorts: TppDBPipeline;
    PpPsort: TppReport;
    ppTitleBand15: TppTitleBand;
    ppImage3: TppImage;
    ppRegion95: TppRegion;
    ppLabel54: TppLabel;
    ppDBText21: TppDBText;
    ppRegion96: TppRegion;
    ppDBMemo16: TppDBMemo;
    ppLabel56: TppLabel;
    ppRegion97: TppRegion;
    ppLabel57: TppLabel;
    ppDBMemo17: TppDBMemo;
    ppRegion99: TppRegion;
    ppLabel59: TppLabel;
    ppDBMemo19: TppDBMemo;
    ppRegion101: TppRegion;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel66: TppLabel;
    ppDBText22: TppDBText;
    ppHeaderBand4: TppHeaderBand;
    ppShape6: TppShape;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel73: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBCalc49: TppDBCalc;
    ppDBText23: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBMemo108: TppDBMemo;
    ppFooterBand4: TppFooterBand;
    ppLine3: TppLine;
    ppLabel74: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel75: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel76: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    PpPsortUser: TppLabel;
    ppLabel80: TppLabel;
    ppDBText28: TppDBText;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    PpPsortVers: TppLabel;
    ppSummaryBand15: TppSummaryBand;
    ppLine4: TppLine;
    ppLabel84: TppLabel;
    ppDBCalc50: TppDBCalc;
    ppLabel85: TppLabel;
    ppLabel89: TppLabel;
    ppDBText29: TppDBText;
    ppLabel90: TppLabel;
    ppLabel92: TppLabel;
    ppDBMemo18: TppDBMemo;
    ppDBText24: TppDBText;
    ppDBText27: TppDBText;
    ppLabel55: TppLabel;
    ppLabel58: TppLabel;
    ppLabel62: TppLabel;
    ppLabel65: TppLabel;
    ppLabel69: TppLabel;
    ppLabel72: TppLabel;
    ppLabel79: TppLabel;
    ppDBText30: TppDBText;
    ppImage2: TppImage;
    PpRN2: TppReport;
    ppTitleBand18: TppTitleBand;
    ppImage5: TppImage;
    ppRegion98: TppRegion;
    ppDBMemo110: TppDBMemo;
    ppRegion102: TppRegion;
    ppDBMemo116: TppDBMemo;
    ppRegion103: TppRegion;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppDBText31: TppDBText;
    ppShape24: TppShape;
    ppShape36: TppShape;
    ppLabel371: TppLabel;
    ppShape37: TppShape;
    ppLabel392: TppLabel;
    ppLabel421: TppLabel;
    ppLabel423: TppLabel;
    ppLabel470: TppLabel;
    ppLabel493: TppLabel;
    ppLabel518: TppLabel;
    ppLabel579: TppLabel;
    ppLabel580: TppLabel;
    ppLabel614: TppLabel;
    ppLabel615: TppLabel;
    ppLabel616: TppLabel;
    ppLabel617: TppLabel;
    ppLabel618: TppLabel;
    ppLabel629: TppLabel;
    ppLabel630: TppLabel;
    ppLabel631: TppLabel;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel540: TppLabel;
    ppLabel541: TppLabel;
    ppLabel568: TppLabel;
    ppDBText33: TppDBText;
    ppLabel574: TppLabel;
    ppSystemVariable29: TppSystemVariable;
    ppSystemVariable30: TppSystemVariable;
    ppLabel577: TppLabel;
    ppSystemVariable32: TppSystemVariable;
    ppLabel578: TppLabel;
    ppHeaderBand18: TppHeaderBand;
    ppDetailBand18: TppDetailBand;
    ppDBCalc51: TppDBCalc;
    ppDBText35: TppDBText;
    ppDBText133: TppDBText;
    ppDBText142: TppDBText;
    ppDBMemo142: TppDBMemo;
    ppFooterBand17: TppFooterBand;
    ppSummaryBand18: TppSummaryBand;
    ppLine6: TppLine;
    ppLabel601: TppLabel;
    ppDBCalc52: TppDBCalc;
    ppLabel608: TppLabel;
    ppLabel609: TppLabel;
    ppDBText174: TppDBText;
    ppLabel610: TppLabel;
    ppLabel603: TppLabel;
    ppLabel604: TppLabel;
    ppLabel607: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLabel611: TppLabel;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLabel612: TppLabel;
    ppLabel613: TppLabel;
    ppLine21: TppLine;
    ppLabel634: TppLabel;
    ppLabel542: TppLabel;
    ppLabel543: TppLabel;
    ppLabel555: TppLabel;
    ppLabel558: TppLabel;
    ppLabel602: TppLabel;
    ppLabel635: TppLabel;
    ppLabel636: TppLabel;
    ppLabel637: TppLabel;
    ppLabel638: TppLabel;
    ppLabel776: TppLabel;
    ppLabel778: TppLabel;
    ppLabel779: TppLabel;
    ppLabel780: TppLabel;
    ppLabel782: TppLabel;
    ppLabel783: TppLabel;
    ppLabel784: TppLabel;
    ppLabel781: TppLabel;
    ppLabel581: TppLabel;
    ppSystemVariable33: TppSystemVariable;
    ppSystemVariable64: TppSystemVariable;
    ppLabel582: TppLabel;
    ppSystemVariable65: TppSystemVariable;
    ppLabel583: TppLabel;
    ppShape35: TppShape;
    ppLabel587: TppLabel;
    ppLabel588: TppLabel;
    ppLabel589: TppLabel;
    ppLabel590: TppLabel;
    ppLabel591: TppLabel;
    ppLabel592: TppLabel;
    ppLabel593: TppLabel;
    ppLabel594: TppLabel;
    ppLabel595: TppLabel;
    ppLabel596: TppLabel;
    ppLabel597: TppLabel;
    ppLabel598: TppLabel;
    ppLabel599: TppLabel;
    ppLabel600: TppLabel;
    ppLabel785: TppLabel;
    ppLabel786: TppLabel;
    ppLabel787: TppLabel;
    ppLabel788: TppLabel;
    ppLabel789: TppLabel;
    ppLine5: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLine81: TppLine;
    ppLine82: TppLine;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLine87: TppLine;
    ppLine88: TppLine;
    ppShape34: TppShape;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine55: TppLine;
    ppLine57: TppLine;
    ppLine63: TppLine;
    ppLine65: TppLine;
    PpKKM2: TppReport;
    ppTitleBand19: TppTitleBand;
    ppImage6: TppImage;
    ppRegion104: TppRegion;
    ppDBMemo109: TppDBMemo;
    ppRegion105: TppRegion;
    ppDBMemo111: TppDBMemo;
    ppRegion106: TppRegion;
    ppShape38: TppShape;
    ppShape39: TppShape;
    ppLabel790: TppLabel;
    ppLabel791: TppLabel;
    ppDBText32: TppDBText;
    ppShape40: TppShape;
    ppLabel792: TppLabel;
    ppShape41: TppShape;
    ppLabel793: TppLabel;
    ppLabel794: TppLabel;
    ppLabel795: TppLabel;
    ppLabel796: TppLabel;
    ppLabel797: TppLabel;
    ppLabel798: TppLabel;
    ppLabel799: TppLabel;
    ppLabel800: TppLabel;
    ppLabel801: TppLabel;
    ppLabel802: TppLabel;
    ppLabel803: TppLabel;
    ppLabel804: TppLabel;
    ppLabel805: TppLabel;
    ppLabel806: TppLabel;
    ppLabel807: TppLabel;
    ppLabel808: TppLabel;
    ppLine66: TppLine;
    ppLine89: TppLine;
    ppLine90: TppLine;
    ppLine91: TppLine;
    ppLine92: TppLine;
    ppLine93: TppLine;
    ppLine94: TppLine;
    ppLabel809: TppLabel;
    ppLabel810: TppLabel;
    ppLabel811: TppLabel;
    ppLabel812: TppLabel;
    ppLabel813: TppLabel;
    ppLabel814: TppLabel;
    ppLabel815: TppLabel;
    ppLabel816: TppLabel;
    ppLabel817: TppLabel;
    ppLabel818: TppLabel;
    ppLabel819: TppLabel;
    ppLabel820: TppLabel;
    ppLabel821: TppLabel;
    ppLabel822: TppLabel;
    ppLabel823: TppLabel;
    ppLabel824: TppLabel;
    ppLabel825: TppLabel;
    ppLabel826: TppLabel;
    ppLabel827: TppLabel;
    ppLine95: TppLine;
    ppLine96: TppLine;
    ppLine97: TppLine;
    ppLine98: TppLine;
    ppLine99: TppLine;
    ppLine100: TppLine;
    ppLine101: TppLine;
    ppLine102: TppLine;
    ppLine103: TppLine;
    ppLine104: TppLine;
    ppLine105: TppLine;
    ppLabel828: TppLabel;
    ppSystemVariable66: TppSystemVariable;
    ppSystemVariable67: TppSystemVariable;
    ppLabel829: TppLabel;
    ppSystemVariable68: TppSystemVariable;
    ppLabel830: TppLabel;
    ppHeaderBand21: TppHeaderBand;
    ppLabel831: TppLabel;
    ppSystemVariable69: TppSystemVariable;
    ppSystemVariable70: TppSystemVariable;
    ppLabel832: TppLabel;
    ppSystemVariable71: TppSystemVariable;
    ppLabel833: TppLabel;
    ppShape42: TppShape;
    ppLabel834: TppLabel;
    ppLine106: TppLine;
    ppLine107: TppLine;
    ppLabel835: TppLabel;
    ppLabel836: TppLabel;
    ppLabel837: TppLabel;
    ppLabel838: TppLabel;
    ppLabel839: TppLabel;
    ppLabel840: TppLabel;
    ppLabel841: TppLabel;
    ppLabel842: TppLabel;
    ppLabel843: TppLabel;
    ppLabel844: TppLabel;
    ppLabel845: TppLabel;
    ppLabel846: TppLabel;
    ppLabel847: TppLabel;
    ppLabel848: TppLabel;
    ppLabel849: TppLabel;
    ppLabel850: TppLabel;
    ppLine108: TppLine;
    ppLine109: TppLine;
    ppLine110: TppLine;
    ppLine111: TppLine;
    ppLine112: TppLine;
    ppLine113: TppLine;
    ppLine114: TppLine;
    ppLine115: TppLine;
    ppLine116: TppLine;
    ppLabel851: TppLabel;
    ppLabel852: TppLabel;
    ppLine117: TppLine;
    ppDetailBand23: TppDetailBand;
    ppDBCalc53: TppDBCalc;
    ppDBText36: TppDBText;
    ppDBText169: TppDBText;
    ppDBText175: TppDBText;
    ppDBMemo112: TppDBMemo;
    ppLine118: TppLine;
    ppFooterBand20: TppFooterBand;
    ppSummaryBand19: TppSummaryBand;
    ppLine119: TppLine;
    ppLabel853: TppLabel;
    ppDBCalc54: TppDBCalc;
    ppLabel854: TppLabel;
    ppLabel855: TppLabel;
    ppDBText176: TppDBText;
    ppLabel856: TppLabel;
    ppLabel857: TppLabel;
    ppLabel858: TppLabel;
    ppLabel859: TppLabel;
    ppLine120: TppLine;
    ppLine121: TppLine;
    ppLine122: TppLine;
    ppLabel860: TppLabel;
    ppLine123: TppLine;
    ppLine124: TppLine;
    ppLabel861: TppLabel;
    ppLabel862: TppLabel;
    ppLine125: TppLine;
    ppLabel863: TppLabel;
    ppLabel864: TppLabel;
    ppLine126: TppLine;
    ppLine127: TppLine;
    ppRegion115: TppRegion;
    ppLabel865: TppLabel;
    ppDBMemo114: TppDBMemo;
    ppRegion121: TppRegion;
    ppLabel83: TppLabel;
    ppDBMemo115: TppDBMemo;
    ppMemo3: TppMemo;
    ppRegion122: TppRegion;
    ppDBMemo117: TppDBMemo;
    ppDBMemo118: TppDBMemo;
    ppLabel777: TppLabel;
    ppLabel866: TppLabel;
    ppDBText34: TppDBText;
    ppLabel867: TppLabel;
    ppDBCalc61: TppDBCalc;
    ppLabel868: TppLabel;
    ppLabel869: TppLabel;
    ppDBText177: TppDBText;
    ppLabel870: TppLabel;
    ppDBCalc62: TppDBCalc;
    ppLabel871: TppLabel;
    ppDBText178: TppDBText;
    ppLabel872: TppLabel;
    ppDBCalc65: TppDBCalc;
    ppLabel873: TppLabel;
    ppDBCalc66: TppDBCalc;
    ppLabel874: TppLabel;
    ppDBCalc67: TppDBCalc;
    frRND: TfrReport;
    FrRNDds: TfrDBDataSet;
    frRNRear: TfrReport;
    ppRegion124: TppRegion;
    DBMEMO_SKIDSTR_RN: TppDBMemo;
    ppRegion123: TppRegion;
    DBMEMO_SKIDSTR_CHECK: TppDBMemo;
    ppRegion128: TppRegion;
    DBMEMO_SKIDSTR_CHECK_KKM: TppDBMemo;
    frVipiska: TfrReport;
    frVipiskaDS: TfrDBDataSet;
    ppDBText179: TppDBText;
    ppDBText180: TppDBText;
    ppDBText181: TppDBText;
    ppDBText270: TppDBText;
    ppSystemVariable72: TppSystemVariable;
    ppLabel875: TppLabel;
    ppSystemVariable73: TppSystemVariable;
    ppLabel884: TppLabel;
    ppLabel885: TppLabel;
    ppSystemVariable74: TppSystemVariable;
    ppLabel886: TppLabel;
    ppSystemVariable75: TppSystemVariable;
    ppLabel887: TppLabel;
    ppLabel888: TppLabel;
    ppLabel889: TppLabel;
    ppLabel890: TppLabel;
    ppLabel891: TppLabel;
    ppLabel892: TppLabel;
    ppLabel893: TppLabel;
    ppLabel898: TppLabel;
    ppLabel899: TppLabel;
    ppLabel900: TppLabel;
    ppGroup19: TppGroup;
    ppGroupHeaderBand19: TppGroupHeaderBand;
    ppGroupFooterBand19: TppGroupFooterBand;
    ppLabel901: TppLabel;
    ppLabel902: TppLabel;
    ppLabel903: TppLabel;
    ppDBText271: TppDBText;
    ppDBText272: TppDBText;
    ppDBText273: TppDBText;
    ppGroup20: TppGroup;
    ppGroupHeaderBand20: TppGroupHeaderBand;
    ppGroupFooterBand20: TppGroupFooterBand;
    ppLabel904: TppLabel;
    ppDBText274: TppDBText;
    ppLabel905: TppLabel;
    ppDBText275: TppDBText;
    ppLabel906: TppLabel;
    ppDBText276: TppDBText;
    ppGroup21: TppGroup;
    ppGroupHeaderBand21: TppGroupHeaderBand;
    ppGroupFooterBand21: TppGroupFooterBand;
    ppLabel907: TppLabel;
    ppDBText277: TppDBText;
    ppLabel908: TppLabel;
    ppDBText278: TppDBText;
    ppLabel909: TppLabel;
    ppDBText279: TppDBText;
    ppGroup22: TppGroup;
    ppGroupHeaderBand22: TppGroupHeaderBand;
    ppGroupFooterBand22: TppGroupFooterBand;
    ppLabel910: TppLabel;
    ppDBText280: TppDBText;
    ppLabel911: TppLabel;
    ppDBText281: TppDBText;
    ppLabel912: TppLabel;
    ppDBText282: TppDBText;
    ppLabel913: TppLabel;
    ppDBText283: TppDBText;
    ppLabel914: TppLabel;
    ppLabel915: TppLabel;
    ppDBText284: TppDBText;
    ppLabel916: TppLabel;
    ppDBCalc68: TppDBCalc;
    ppLargeSkidLabel: TppLabel;
    ppLabel876: TppLabel;
    ppLabel877: TppLabel;
    ppLabel878: TppLabel;
    ppLabel879: TppLabel;
    ppDBText182: TppDBText;
    ppLabel880: TppLabel;
    ppDBText183: TppDBText;
    ppLabel881: TppLabel;
    ppDBText266: TppDBText;
    frSTFakt: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppLabel163: TppLabel;
    ppLabel175: TppLabel;
    ppLabel882: TppLabel;
    ppRegion125: TppRegion;
    ppLabel883: TppLabel;
    ppLabel917: TppLabel;
    ppLabel918: TppLabel;
    ppLabel919: TppLabel;
    ppLabel920: TppLabel;
    ppLabel921: TppLabel;
    ppLabel922: TppLabel;
    ppLabel923: TppLabel;
    ppLabel924: TppLabel;
    ppLabel925: TppLabel;
    ppLabel926: TppLabel;
    ppLabel927: TppLabel;
    ppLabel928: TppLabel;
    ppLabel929: TppLabel;
    ppLabel930: TppLabel;
    ppLabel931: TppLabel;
    ppLabel932: TppLabel;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppLabel933: TppLabel;
    ppLabel934: TppLabel;
    ppLabel935: TppLabel;
    ppLabel936: TppLabel;
    ppLabel937: TppLabel;
    ppLabel938: TppLabel;
    ppLabel939: TppLabel;
    ppLabel940: TppLabel;
    ppLabel941: TppLabel;
    ppLabel942: TppLabel;
    ppLabel943: TppLabel;
    ppLabel944: TppLabel;
    ppLabel945: TppLabel;
    ppLabel946: TppLabel;
    ppLabel947: TppLabel;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText59: TppDBText;
    ppLabel948: TppLabel;
    ppLabel949: TppLabel;
    ppLabel950: TppLabel;
    ppDBCalc63: TppDBCalc;
    frTorg12: TfrReport;
    frDBTorg12: TfrDBDataSet;
    frDesigner1: TfrDesigner;
    ppLabel951: TppLabel;
    PP_BAR_CODE: TppReport;
    ppLabel771: TppLabel;
    ppLine128: TppLine;
    ppLabel952: TppLabel;
    ppLine129: TppLine;
    ppLine130: TppLine;
    ppLine131: TppLine;
    ppLine132: TppLine;
    ppLine133: TppLine;
    ppLine134: TppLine;
    ppLine135: TppLine;
    ppDetailBand24: TppDetailBand;
    ppDBBarCode2: TppDBBarCode;
    ppDBText66: TppDBText;
    frDSStfaktPN: TfrDBDataSet;
    frSTFaktPN: TfrReport;
    ppDBMemo143: TppDBMemo;
    ppDBMemo144: TppDBMemo;
    ppDBMemo145: TppDBMemo;
    ppDBMemo146: TppDBMemo;
    ppLabel43: TppLabel;
    ppLabel50: TppLabel;
    ppDBText67: TppDBText;
    ppDBBarCode6: TppDBBarCode;
    ppDBBarCode7: TppDBBarCode;
    CENNIK_LARGE: TfrReport;
    CENNIK_BIG: TfrReport;
    cennik_medium: TfrReport;
    cennik_small: TfrReport;
    SPEZIFICAZIYA: TfrReport;
    ppMemo4: TppMemo;
    ppLine136: TppLine;
    ppLine137: TppLine;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppMemo5: TppMemo;
    ppMemo6: TppMemo;
    ppShape33: TppShape;
    ppShape43: TppShape;
    ppMemo7: TppMemo;
    ppMemo8: TppMemo;
    myRect1: TppShape;
    myLabel1: TppMemo;
    ppShape45: TppShape;
    ppShape46: TppShape;
    ppShape47: TppShape;
    ppShape48: TppShape;
    myRect2: TppShape;
    ppLabel953: TppLabel;
    ppDBText68: TppDBText;
    MH1: TfrReport;
    MH3: TfrReport;
    fsDS_PRINT_MHS: TfrDBDataSet;
    frReport1: TfrReport;
    ppLabel954: TppLabel;
    ppLabel955: TppLabel;
    ppLabel956: TppLabel;
    ppLabel957: TppLabel;
    ppLabel958: TppLabel;
    ppLabel959: TppLabel;
    ppLabel960: TppLabel;
    ppLabel961: TppLabel;
    ppLabel962: TppLabel;
    ppLabel963: TppLabel;
    ppLabel964: TppLabel;
    ppLabel965: TppLabel;
    ppLabel894: TppLabel;
    frTransportNakl2: TfrReport;
    frSTFakt2012: TfrReport;
    ppLabel895: TppLabel;
    ppLabel896: TppLabel;
    ppLabel897: TppLabel;
    ppLabel966: TppLabel;
    ppTitleBand20: TppTitleBand;
    ppGroup23: TppGroup;
    ppGroupHeaderBand23: TppGroupHeaderBand;
    ppGroupFooterBand23: TppGroupFooterBand;
    ppShape44: TppShape;
    ppDBText69: TppDBText;
    ppLabel967: TppLabel;
    ppDBText70: TppDBText;
    ppLabel968: TppLabel;
    ppLabel969: TppLabel;
    ppDBText71: TppDBText;
    ppLine138: TppLine;
    ppGroup24: TppGroup;
    ppGroupHeaderBand24: TppGroupHeaderBand;
    ppGroupFooterBand24: TppGroupFooterBand;
    ppGroup25: TppGroup;
    ppGroupHeaderBand25: TppGroupHeaderBand;
    ppGroupFooterBand25: TppGroupFooterBand;
    ppGroup26: TppGroup;
    ppGroupHeaderBand26: TppGroupHeaderBand;
    ppGroupFooterBand26: TppGroupFooterBand;
    ppShape49: TppShape;
    ppDBText73: TppDBText;
    ppLabel970: TppLabel;
    ppDBText82: TppDBText;
    ppLabel971: TppLabel;
    ppLabel972: TppLabel;
    ppDBText83: TppDBText;
    ppGroup27: TppGroup;
    ppGroupHeaderBand27: TppGroupHeaderBand;
    ppGroupFooterBand27: TppGroupFooterBand;
    ppGroup28: TppGroup;
    ppGroupHeaderBand28: TppGroupHeaderBand;
    ppGroupFooterBand28: TppGroupFooterBand;
    ppShape50: TppShape;
    ppDBText84: TppDBText;
    ppLabel973: TppLabel;
    ppDBText85: TppDBText;
    ppLabel974: TppLabel;
    ppLabel975: TppLabel;
    ppDBText267: TppDBText;
    ppLine139: TppLine;
    ppLine140: TppLine;
    ppGroup29: TppGroup;
    ppGroupHeaderBand29: TppGroupHeaderBand;
    ppGroupFooterBand29: TppGroupFooterBand;
    ppGroup30: TppGroup;
    ppGroupHeaderBand30: TppGroupHeaderBand;
    ppGroupFooterBand30: TppGroupFooterBand;
    ppShape51: TppShape;
    ppDBText268: TppDBText;
    ppLabel976: TppLabel;
    ppDBText269: TppDBText;
    ppLabel977: TppLabel;
    ppDBText285: TppDBText;
    ppLabel978: TppLabel;
    ppLine141: TppLine;
    frBarCodeObject1: TfrBarCodeObject;
    MH1_1: TfrReport;
    ppLabel979: TppLabel;
    ppLabel980: TppLabel;
    ppLabel981: TppLabel;
    ppDBText286: TppDBText;
    ppDBText287: TppDBText;
    PipMails2ppField33: TppField;
    PipMails2ppField34: TppField;
    PipMails2ppField35: TppField;
    ppLabel982: TppLabel;
    ppLabel983: TppLabel;
    ppLabel984: TppLabel;
    ppLabel985: TppLabel;
    ppMemo9: TppMemo;
    PipRNppField42: TppField;
    procedure ppTitleBand1BeforeGenerate(Sender: TObject);
    procedure ppDBCalc4Print(Sender: TObject);
    procedure PpRNPreviewFormCreate(Sender: TObject);
    procedure PP_CENNIK_BIGGroupHeaderBand1BeforeGenerate(Sender: TObject);
    procedure ppGroupHeaderBand7BeforeGenerate(Sender: TObject);
    procedure ppGroupHeaderBand1BeforeGenerate(Sender: TObject);
    procedure PP_CENNIK_MEDIUMPreviewFormCreate(Sender: TObject);
    procedure PP_CENNIK_SMALLPreviewFormCreate(Sender: TObject);
    procedure PP_CENNIK_BIGPreviewFormCreate(Sender: TObject);
    procedure PpRNDPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand2BeforeGenerate(Sender: TObject);
    procedure ppDBCalc8Print(Sender: TObject);
    procedure ppTitleBand3BeforePrint(Sender: TObject);
    procedure ppTitleBand4BeforeGenerate(Sender: TObject);
    procedure PpZAYPreviewFormCreate(Sender: TObject);
    procedure PpZayFAXPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand5BeforeGenerate(Sender: TObject);
    procedure PpZayExpPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand6BeforeGenerate(Sender: TObject);
    procedure PpMAILPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand7BeforeGenerate(Sender: TObject);
    procedure ppDBCalc20Print(Sender: TObject);
    procedure PpSpisPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand8BeforeGenerate(Sender: TObject);
    procedure PpPERPreviewFormCreate(Sender: TObject);
    procedure ppDBCalc24Print(Sender: TObject);
    procedure ppTitleBand9BeforeGenerate(Sender: TObject);
    procedure ppDBCalc28Print(Sender: TObject);
    procedure PpPnRoznPreviewFormCreate(Sender: TObject);
    procedure PpCheckRNPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand10BeforeGenerate(Sender: TObject);
    procedure ppDBCalc32Print(Sender: TObject);
    procedure PpCheckKKMPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand11BeforeGenerate(Sender: TObject);
    procedure ppDBCalc36Print(Sender: TObject);
    procedure ppTitleBand12BeforeGenerate(Sender: TObject);
    procedure ppDBCalc40Print(Sender: TObject);
    procedure PpSTFAKTPreviewFormCreate(Sender: TObject);
    procedure PpSTPreviewFormCreate(Sender: TObject);
    procedure ppDBCalc46Print(Sender: TObject);
    procedure ppTitleBand13BeforeGenerate(Sender: TObject);
    procedure PpREMONPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand14BeforeGenerate(Sender: TObject);
    procedure PpPnZakPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand16BeforeGenerate(Sender: TObject);
    procedure ppDBCalc58Print(Sender: TObject);
    procedure ppDetailBand20BeforeGenerate(Sender: TObject);
    procedure PpGarantPreviewFormCreate(Sender: TObject);
    procedure PpDetalKLNPreviewFormCreate(Sender: TObject);
    procedure PP_CENNIK_LARGEPreviewFormCreate(Sender: TObject);
    procedure ppGroupHeaderBand13BeforeGenerate(Sender: TObject);
    procedure ppTitleBand15BeforeGenerate(Sender: TObject);
    procedure PpPsortPreviewFormCreate(Sender: TObject);
    procedure ppTitleBand18BeforeGenerate(Sender: TObject);
    procedure PpRN2PreviewFormCreate(Sender: TObject);
    procedure ppTitleBand19BeforeGenerate(Sender: TObject);
    procedure PpKKM2PreviewFormCreate(Sender: TObject);
    procedure frRNDBeginDoc;
    procedure LoadXltAndPrint(xltFilename: string);
    procedure frRNDUserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    procedure frVipiskaBeginDoc;
    procedure frVipiskaUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure PpRNBeforePrint(Sender: TObject);
    procedure PpCheckRNBeforePrint(Sender: TObject);
    procedure PpCheckKKMBeforePrint(Sender: TObject);
    procedure frSTFaktUserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    procedure PpREMONBeforePrint(Sender: TObject);
    procedure frTorg12UserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    procedure frTorg12BeginDoc;
    procedure frSTFaktPNUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure frSTFaktBeginDoc;
    procedure MH1BeginDoc;
    procedure MH1UserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    procedure MH3UserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    procedure frSTFakt2012BeginDoc;
    procedure frSTFakt2012UserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure frTransportNakl2UserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure MH3BeginDoc;
  private
    { Private declarations }
  public
  bShowSkid: boolean;
    { Public declarations }

  end;

var
  Print_DOC: TPrint_DOC;

const  CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов

implementation

{$R *.DFM}

procedure TPrint_DOC.ppTitleBand1BeforeGenerate(Sender: TObject);
begin
     PpRNUser.Caption:=USERFIO_SHORT;
     PpRNUser2.Caption:=USERFIO_SHORT;
     RN_VERS.caption:=PROG_VERSION;

     if datamodule2.PrintRN.FieldByName('FRM_ID').AsInteger=datamodule2.PrintRN.FieldByName('OSN_FRM_ID').AsInteger then
     try
       Ppimage1.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.ppDBCalc4Print(Sender: TObject);
VAR
   NDS,SUMM1,SKID,SUMM2:double;
begin
     SUMM1:=PpDBCALC4.Value;
     SUMM2:=SUMM1;
     RN_SUMM.lines.clear;
     RN_SUMM.lines.add(VALUTA_CHAR(SUMM2,DataModule2.PrintRN.fieldByname('VALUTA_AUTO1').asstring,
     DataModule2.PrintRN.fieldByname('VALUTA_AUTO2').asstring,
     DataModule2.PrintRN.fieldByname('VALUTA_AUTO3').asstring,
     DataModule2.PrintRN.fieldByname('VALUTA_AUTO11').asstring,
     DataModule2.PrintRN.fieldByname('VALUTA_AUTO12').asstring,
     DataModule2.PrintRN.fieldByname('VALUTA_AUTO13').asstring));
     NDS:=DataModule2.PrintRN.fieldByname('NDS').asfloat;
     RN_NDS.caption:=trim(floattostrf((SUMM2*NDS)/(100+NDS),fffixed,19,2))
end;

procedure TPrint_DOC.PpRNPreviewFormCreate(Sender: TObject);
begin
     ppRN.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.PP_CENNIK_BIGGroupHeaderBand1BeforeGenerate(
  Sender: TObject);
begin
     if pipCennik.GetFieldForName('TW_KWM_UCHET').AsDouble=0 then
     pp_cennik_big.GroupHeader[4].Visible:=false
    else
    pp_cennik_big.GroupHeader[4].visible:=true;



    if ((pipCennik.GetFieldForName('MET_MONEY_SHOP1').Asdouble=1) or (pipCennik.GetFieldForName('TW_NOSKID').AsDouble=1)) then
     pp_cennik_big.GroupFooter[6].Visible:=true
    else
     pp_cennik_big.GroupFooter[6].Visible:=false;

end;

procedure TPrint_DOC.ppGroupHeaderBand7BeforeGenerate(Sender: TObject);
begin
     if pipCennik.GetFieldForName('tw_kwm_uchet').AsDouble=0 then
     pp_cennik_medium.GroupHeader[4].Visible:=false
    else
    pp_cennik_medium.GroupHeader[4].visible:=true;

    if ((pipCennik.GetFieldForName('MET_MONEY_SHOP1').Asdouble=1) or (pipCennik.GetFieldForName('TW_NOSKID').AsDouble=1)) then
     pp_cennik_medium.GroupFooter[6].Visible:=true
    else
     pp_cennik_medium.GroupFooter[6].Visible:=false;
end;

procedure TPrint_DOC.ppGroupHeaderBand1BeforeGenerate(Sender: TObject);
begin
     if pipCennik.GetFieldForName('tw_kwm_uchet').AsDouble=0 then
     pp_cennik_small.GroupHeader[4].Visible:=false
    else
    pp_cennik_small.GroupHeader[4].visible:=true;

    if ((pipCennik.GetFieldForName('MET_MONEY_SHOP1').Asdouble=1) or (pipCennik.GetFieldForName('TW_NOSKID').AsDouble=1)) then
     pp_cennik_small.GroupFooter[6].Visible:=true
    else
     pp_cennik_small.GroupFooter[6].Visible:=false;
end;

procedure TPrint_DOC.PP_CENNIK_MEDIUMPreviewFormCreate(Sender: TObject);
begin
     pp_CENNIK_MEDIUM.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.PP_CENNIK_SMALLPreviewFormCreate(Sender: TObject);
begin
     pp_CENNIK_SMALL.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.PP_CENNIK_BIGPreviewFormCreate(Sender: TObject);
begin
     pp_CENNIK_BIG.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.PpRNDPreviewFormCreate(Sender: TObject);
begin
     PpRND.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppTitleBand2BeforeGenerate(Sender: TObject);
begin
     PpRNDUser.Caption:=USERFIO_SHORT;
     PpRNDVers.caption:=PROG_VERSION;
     if datamodule2.PrintRN.FieldByName('FRM_ID').AsInteger=datamodule2.PrintRN.FieldByName('OSN_FRM_ID').AsInteger then
     try
       Ppimage4.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.ppDBCalc8Print(Sender: TObject);
VAR
   NDS,SUMM1,SKID,SUMM2:double;
begin
   SUMM1:=PpDBCALC8.Value;
     SUMM2:=SUMM1;
     RND_SUMM.lines.clear;
     RND_SUMM.lines.add(VALUTA_CHAR(SUMM2,DataModule2.PrintRN.fieldByname('VALUTA_AUTO1').asstring,
      DataModule2.PrintRN.fieldByname('VALUTA_AUTO2').asstring,
      DataModule2.PrintRN.fieldByname('VALUTA_AUTO3').asstring,
      DataModule2.PrintRN.fieldByname('VALUTA_AUTO11').asstring,
      DataModule2.PrintRN.fieldByname('VALUTA_AUTO12').asstring,
      DataModule2.PrintRN.fieldByname('VALUTA_AUTO13').asstring));
     NDS:=DataModule2.PrintRN.fieldByname('NDS').asfloat;
     RND_NDS.caption:=trim(floattostrf((SUMM2*NDS)/(100+NDS),fffixed,19,2))
end;

procedure TPrint_DOC.ppTitleBand3BeforePrint(Sender: TObject);
begin
    MailsTitle1.caption:=Datamodule2.PrintMail.fieldByname('MAILVID_NAM').asstring+' № '+
     Datamodule2.PrintMail.fieldByname('MAIL_NUM').asstring+' от '+
     date_sokr(Datamodule2.PrintMail.fieldByname('MAIL_DATE').asdatetime);
    MailsTitle2.caption:=Datamodule2.PrintMail.fieldByname('MAILVID_NAM').asstring+' № '+
     Datamodule2.PrintMail.fieldByname('MAIL_NUM').asstring+' от '+
     date_sokr(Datamodule2.PrintMail.fieldByname('MAIL_DATE').asdatetime);
     PpMAILUser.Caption:=USERFIO_SHORT;
     PpMAILUser2.Caption:=USERFIO_SHORT;
     PpMAILVers.caption:=PROG_VERSION;
     try
       Ppimage7.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.ppTitleBand4BeforeGenerate(Sender: TObject);
begin
     PpZayUser.Caption:=USERFIO_SHORT;
     PpZayVers.caption:=PROG_VERSION;
     try
       Ppimage8.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.PpZAYPreviewFormCreate(Sender: TObject);
begin
     PpZAY.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.PpZayFAXPreviewFormCreate(Sender: TObject);
begin
     PpZayFax.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppTitleBand5BeforeGenerate(Sender: TObject);
begin
     try
       Ppimage10.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.PpZayExpPreviewFormCreate(Sender: TObject);
begin
     PpZayExp.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppTitleBand6BeforeGenerate(Sender: TObject);
begin
     PpZayExpUser.Caption:=USERFIO_SHORT;
     PpZayExpVers.caption:=PROG_VERSION;
     try
       Ppimage11.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.PpMAILPreviewFormCreate(Sender: TObject);
begin
     PpMAIL.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppTitleBand7BeforeGenerate(Sender: TObject);
begin
     PpSpisUser.Caption:=USERFIO_SHORT;
     PpSpisVers.caption:=PROG_VERSION;
     try
       Ppimage13.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.ppDBCalc20Print(Sender: TObject);
VAR
   SUMM1,SKID,SUMM2:double;
begin
   SUMM1:=PpDBCALC20.Value;
     SUMM2:=SUMM1;
     SPIS_SUMM.lines.clear;
     SPIS_SUMM.lines.add(RUB_CHAR(SUMM2));
end;

procedure TPrint_DOC.PpSpisPreviewFormCreate(Sender: TObject);
begin
     PpSpis.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppTitleBand8BeforeGenerate(Sender: TObject);
begin
     PpPerUser.Caption:=USERFIO_SHORT;
     PpPerVers.caption:=PROG_VERSION;
     try
       Ppimage15.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.PpPERPreviewFormCreate(Sender: TObject);
begin
     PpPer.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppDBCalc24Print(Sender: TObject);
VAR
   SUMM1,SKID,SUMM2:double;
begin
   SUMM1:=PpDBCALC24.Value;
     SUMM2:=SUMM1;
     PER_SUMM.lines.clear;
     PER_SUMM.lines.add(RUB_CHAR(SUMM2));
end;

procedure TPrint_DOC.ppTitleBand9BeforeGenerate(Sender: TObject);
begin
     PpPnRoznUser.Caption:=USERFIO_SHORT;
     PpPnRoznUser2.Caption:=USERFIO_SHORT;
     PpPnRoznVers.caption:=PROG_VERSION;
     try
       Ppimage17.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.ppDBCalc28Print(Sender: TObject);
VAR
   SUMM1,SKID,SUMM2:double;
begin
   SUMM1:=PpDBCALC28.Value;
     SUMM2:=SUMM1;
     PNROZN_SUMM.lines.clear;
     PNROZN_SUMM.lines.add(RUB_CHAR(SUMM2));
end;

procedure TPrint_DOC.PpPnRoznPreviewFormCreate(Sender: TObject);
begin
     PpPnRozn.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.PpCheckRNPreviewFormCreate(Sender: TObject);
begin
     PpCheckRN.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppTitleBand10BeforeGenerate(Sender: TObject);
begin
     PpCheckRNUser.Caption:=USERFIO_SHORT;
     PpCheckRNVers.caption:=PROG_VERSION;
     if datamodule2.PrintRN.FieldByName('FRM_ID').AsInteger=datamodule2.PrintRN.FieldByName('OSN_FRM_ID').AsInteger then
     try
       Ppimage19.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.ppDBCalc32Print(Sender: TObject);
VAR
   SUMM1,SKID,SUMM2:double;
begin
   SUMM1:=PpDBCALC32.Value;
     SUMM2:=SUMM1;
     CHECKRN_SUMM.lines.clear;
     CHECKRN_SUMM.lines.add(VALUTA_CHAR(SUMM2,DataModule2.PrintRN.fieldByname('VALUTA_AUTO1').asstring,
      DataModule2.PrintRN.fieldByname('VALUTA_AUTO2').asstring,
      DataModule2.PrintRN.fieldByname('VALUTA_AUTO3').asstring,
      DataModule2.PrintRN.fieldByname('VALUTA_AUTO11').asstring,
      DataModule2.PrintRN.fieldByname('VALUTA_AUTO12').asstring,
      DataModule2.PrintRN.fieldByname('VALUTA_AUTO13').asstring));
end;

procedure TPrint_DOC.PpCheckKKMPreviewFormCreate(Sender: TObject);
begin
     PpCheckKKM.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppTitleBand11BeforeGenerate(Sender: TObject);
begin
     PpCheckKKMUser.Caption:=USERFIO_SHORT;
     PpCheckKKMVers.caption:=PROG_VERSION;
     if datamodule2.PrintRN.FieldByName('FRM_ID').AsInteger=datamodule2.PrintRN.FieldByName('OSN_FRM_ID').AsInteger then
     try
       Ppimage21.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.ppDBCalc36Print(Sender: TObject);
VAR
   SUMM1,SKID,SUMM2:double;
begin
   SUMM1:=PpDBCALC36.Value;
     SUMM2:=SUMM1;
     CHECKKKM_SUMM.lines.clear;
     CHECKKKM_SUMM.lines.add(RUB_CHAR(SUMM2));
end;

procedure TPrint_DOC.ppTitleBand12BeforeGenerate(Sender: TObject);
begin
     PpSTFAKTUser.Caption:=USERFIO_SHORT;
     PpSTFAKTVers.caption:=PROG_VERSION;
     try
       Ppimage23.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.ppDBCalc40Print(Sender: TObject);
VAR
   SUMM1,SKID,SUMM2:double;
begin
   SUMM1:=PpDBCALC40.Value;
     STFAKT_SUMM.lines.clear;
     STFAKT_SUMM.lines.add('Сумма: '+RUB_CHAR(SUMM1));
end;

procedure TPrint_DOC.PpSTFAKTPreviewFormCreate(Sender: TObject);
begin
     PpSTFAKT.PreviewForm.WindowState:=WsMaximized;
end;


procedure TPrint_DOC.PpSTPreviewFormCreate(Sender: TObject);
begin
     PpST.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppDBCalc46Print(Sender: TObject);
VAR
   SUMM1,SKID,SUMM2,NDS:double;
begin
     SUMM1:=PpDBCALC46.Value;
     SUMM2:=SUMM1;
     ST_SUMM.lines.clear;
     ST_SUMM.lines.add(VALUTA_CHAR(SUMM2,DataModule2.PrintST.fieldByname('VALUTA_AUTO1').asstring,
      DataModule2.PrintST.fieldByname('VALUTA_AUTO2').asstring,
      DataModule2.PrintST.fieldByname('VALUTA_AUTO3').asstring,
      DataModule2.PrintST.fieldByname('VALUTA_AUTO11').asstring,
      DataModule2.PrintST.fieldByname('VALUTA_AUTO12').asstring,
      DataModule2.PrintST.fieldByname('VALUTA_AUTO13').asstring));
     NDS:=DataModule2.PrintST.fieldByname('NDS').asfloat;
     ST_NDS.caption:=trim(floattostrf((SUMM2*NDS)/(100+NDS),fffixed,19,2))
end;

procedure TPrint_DOC.ppTitleBand13BeforeGenerate(Sender: TObject);
begin
     PpSTUser.Caption:=USERFIO_SHORT;
     PpStVers.caption:=PROG_VERSION;
     PpSTUser2.Caption:=USERFIO_SHORT;
     PpStVers2.caption:=PROG_VERSION;
     try
       Ppimage25.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
     if PRINT_MP then begin
       try
         Ppimage2.Visible:=True;
         Ppimage2.Picture.LoadFromFile(MP_NAME);
         Ppimage2.Visible:=True;
       Except
       End;
     end else Ppimage2.visible:=False;

end;

procedure TPrint_DOC.PpREMONPreviewFormCreate(Sender: TObject);
begin
     PpREMON.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppTitleBand14BeforeGenerate(Sender: TObject);
begin
     PpRemonuser.Caption:=USERFIO_SHORT;
     PpRemonVers.caption:=PROG_VERSION;
     PpRemonUser2.Caption:=USERFIO_SHORT;
     PpRemonVers2.caption:=PROG_VERSION;
     try
       Ppimage28.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.PpPnZakPreviewFormCreate(Sender: TObject);
begin
     PpPnZak.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppTitleBand16BeforeGenerate(Sender: TObject);
begin
     PpPnZakUser.Caption:=USERFIO_SHORT;
     PpPnZakUser2.Caption:=USERFIO_SHORT;
     PpPnZakVers.caption:=PROG_VERSION;
     try
       Ppimage32.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.ppDBCalc58Print(Sender: TObject);
VAR
   SUMM1,SKID,SUMM2:double;
begin
   SUMM1:=PpDBCALC58.Value;
     SUMM2:=SUMM1;
     PNZAK_SUMM.lines.clear;
     PNZAK_SUMM.lines.add(RUB_CHAR(SUMM2));
end;

procedure TPrint_DOC.ppDetailBand20BeforeGenerate(Sender: TObject);
begin
     try
       Ppimage34.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
     GARANT_money.lines.clear;
     GARANT_money.lines.add(floattostrf(DataModule2.PrintGarant.fieldByname('TW_MONEY').asfloat,fffixed,19,2)+
     ' ('+RUB_CHAR(DataModule2.PrintGarant.fieldByname('TW_MONEY').asfloat)+')');
     GARANT_money2.lines.clear;
     GARANT_money2.lines.add(floattostrf(DataModule2.PrintGarant.fieldByname('TW_MONEY').asfloat,fffixed,19,2)+
     ' ('+RUB_CHAR(DataModule2.PrintGarant.fieldByname('TW_MONEY').asfloat)+')');

end;

procedure TPrint_DOC.PpGarantPreviewFormCreate(Sender: TObject);
begin
     PpGarant.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.PpDetalKLNPreviewFormCreate(Sender: TObject);
begin
     PpDetalKLN.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.PP_CENNIK_LARGEPreviewFormCreate(Sender: TObject);
begin
     pp_CENNIK_LARGE.PreviewForm.WindowState:=WsMaximized;

end;

procedure TPrint_DOC.ppGroupHeaderBand13BeforeGenerate(Sender: TObject);
begin
     if pipCennik.GetFieldForName('tw_kwm_uchet').AsDouble=0 then
     pp_cennik_large.GroupHeader[4].Visible:=false
    else
     pp_cennik_large.GroupHeader[4].visible:=true;



    if ((pipCennik.GetFieldForName('MET_MONEY_SHOP1').Asdouble=1) or (pipCennik.GetFieldForName('TW_NOSKID').AsDouble=1)) then
     pp_cennik_large.GroupFooter[6].Visible:=true
    else
     pp_cennik_large.GroupFooter[6].Visible:=false;


end;

procedure TPrint_DOC.ppTitleBand15BeforeGenerate(Sender: TObject);
begin
     PpPsortUser.Caption:=USERFIO_SHORT;
     PpPsortVers.caption:=PROG_VERSION;
     try
       Ppimage3.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.PpPsortPreviewFormCreate(Sender: TObject);
begin
     Pppsort.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppTitleBand18BeforeGenerate(Sender: TObject);
begin
     try
       Ppimage5.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.PpRN2PreviewFormCreate(Sender: TObject);
begin
     PpRN2.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.ppTitleBand19BeforeGenerate(Sender: TObject);
begin
     try
       Ppimage6.Picture.LoadFromFile(LOGO_NAME);
     Except
     End;
end;

procedure TPrint_DOC.PpKKM2PreviewFormCreate(Sender: TObject);
begin
     PpKKM2.PreviewForm.WindowState:=WsMaximized;
end;

procedure TPrint_DOC.frRNDBeginDoc;
var frO: TfrView;
	frP: TfrPictureView;

begin
       frRND.Dictionary.Variables['UserName']:=''''+USERFIO_SHORT+'''';

       if datamodule2.PrintRN.FieldByName('RNTYP_NDS').AsInteger=1 then
        begin
          frO := frRND.FindObject('Memo6');
          frO.Visible := False;
        end;

       if datamodule2.PrintRN.FieldByName('FRM_ID').AsInteger=datamodule2.PrintRN.FieldByName('OSN_FRM_ID').AsInteger then
       begin

       try
       frP := TfrPictureView(frRND.FindObject('Picture1'));
       frP.Picture.LoadFromFile(LOGO_NAME);
       frP := TfrPictureView(frRND.FindObject('Picture2'));
       frP.Picture.LoadFromFile(LOGO_NAME);
       except
       end;
       end;

end;

procedure TPrint_DOC.LoadXltAndPrint(xltFilename: string);
var excel: TExcelApplication;
ServiceManager: Olevariant;
    Desktop: Olevariant;
    Document,Sheets, ooParams, ooValue, ooReflection, sheet, cell: OleVariant;
    FilePath: String;
begin



     exit;

    try

    Excel := TExcelApplication.Create(nil);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
    Excel.Workbooks.Add(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\'+xltFilename, 0);
    Excel.Visible[0]:=true;

//    Excel.Workbooks[1].PrintPreview(false, 0);

    Excel.Disconnect;
    freeandnil(excel);
    except




    
       try
         ServiceManager := CreateOleObject('com.sun.star.ServiceManager');
       except
         exit;
       end;

       FilePath := 'private:factory/scalc';
       filePath:=convertToURL(ExtractFilePath(ParamStr(0))+CN_TemplateFolder+'\'+xltFilename);
         if (VarType(ServiceManager) = varDispatch) then
           Desktop := ServiceManager.CreateInstance('com.sun.star.frame.Desktop');

        ooParams := VarArrayCreate([0, 0], varVariant);
        ooReflection := ServiceManager.createInstance('com.sun.star.reflection.CoreReflection');
        ooReflection.forName('com.sun.star.beans.PropertyValue').createObject(ooValue);
        ooValue.Name := 'AsTemplate';
        ooValue.Value := True;
        ooParams[0] := ooValue;


        Document := Desktop.LoadComponentFromURL(
                      FilePath, '_blank', 0,
                      ooParams);


      begin
      end;
    end;



end;

procedure TPrint_DOC.frRNDUserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
  var tonn, kg: string;
      weight: double;
      v: string;
      old: string;
      fieldName: string;
begin
    if (Name='INTASSTRING') then
    begin
    v := money_char(frRND.Dictionary.Variables[p1], 1);

    val :=ansiLowerCase(v);
    end;

    if (Name='REPLACE1') then
    begin
    val := stringreplace(DataModule2.PrintRN.FieldByName('RN_WHO').AsString, 'года, ', 'года'+chr(13), [rfReplaceAll]);
    end;

    if (Name='DROPEOL') then
    begin



    old := DataModule2.PrintRN.fieldbyname(p1).asstring;
    v := stringreplace(old, char(13)+char(10),' ', [rfReplaceAll] );

    val :=v;
    end;
    if (Name='WEIGHTASSTRING') then
    begin
    weight:=frRND.Dictionary.Variables[p1];
    if (int(weight)>0) then
		tonn := money_char(weight, 2)+' т ';
    kg:=money_char( (weight - int(weight))*1000, 1) + ' кг';

    v := tonn + kg;

    val := ansiLowerCase(v);
    end;

end;

procedure TPrint_DOC.frVipiskaBeginDoc;
var frO: TfrView;
	frP: TfrPictureView;

begin
       frVipiska.Dictionary.Variables['UserName']:=''''+USERFIO_SHORT+'''';
       try
       frP := TfrPictureView(frVipiska.FindObject('Picture1'));
       frP.Picture.LoadFromFile(LOGO_NAME);
       frP := TfrPictureView(frVipiska.FindObject('Picture2'));
       frP.Picture.LoadFromFile(LOGO_NAME);
       except
       end;

end;

procedure TPrint_DOC.frVipiskaUserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
  var old: string ;
  v: string;
begin
    if (Name='DROPEOL') then
    begin



    old := DataModule2.PrintRN.fieldbyname(p1).asstring;
    v := stringreplace(old, char(13)+char(10),' ', [rfReplaceAll] );

    val :=v;
    end;
end;

procedure TPrint_DOC.PpRNBeforePrint(Sender: TObject);
begin
  DBMEMO_SKIDSTR_RN.Visible:= bShowSkid;

  myRect1.Visible:=(SHOPID in [10, 105]);
  myRect2.visible:=myRect1.Visible;
  myLabel1.visible:=myRect1.Visible;
  if DataModule2.PrintRN.FieldByName('RNTYP_NDS').asinteger=1 then
  begin

  ppLabel35.Text := 'По доверенности'
  end;

end;

procedure TPrint_DOC.PpCheckRNBeforePrint(Sender: TObject);
begin
DBMEMO_SKIDSTR_CHECK.Visible:= bShowSkid;

if (DataModule2.PrintRN.FieldByName('KLN_ID').asinteger=2704778) or (DataModule2.PrintRN.FieldByName('KLN_ID').asinteger=2703977) then
  begin
        ppCheckRN.FooterBand.Visible:=true;
  end
  else
        ppCheckRN.FooterBand.Visible:=false;


end;

procedure TPrint_DOC.PpCheckKKMBeforePrint(Sender: TObject);
begin
DBMEMO_SKIDSTR_CHECK_KKM.Visible:= bShowSkid;
end;

procedure TPrint_DOC.frSTFaktUserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var   v: string;
      old: string;
      fieldName: string;
begin
if (Name='DROPEOL') then
    begin



    old := DataModule2.PrintSTFakt.fieldbyname(p1).asstring;
    v := stringreplace(old, char(13)+char(10),' ', [rfReplaceAll] );

    val :=v;
    end;
end;

procedure TPrint_DOC.PpREMONBeforePrint(Sender: TObject);
var k : integer;
begin
  k:=0;
  if (CHECK_USER_DOSTUP('PRICE_LIST_MONEY3')=-1) then
  begin
    ppDBText64.Visible:=false;
    ppDBText65.Visible:=false;
    ppLabel938.Visible:=false;
    ppLabel941.Visible:=false;
    ppLabel946.Visible:=false;
    ppLabel947.Visible:=false;
    inc(k);
  end;
  if (CHECK_USER_DOSTUP('PRICE_LIST_MONEY2')=-1) then
  begin
    ppDBText62.Visible:=false;
    ppDBText63.Visible:=false;
    ppLabel937.Visible:=false;
    ppLabel940.Visible:=false;
    ppLabel944.Visible:=false;
    ppLabel945.Visible:=false;
    inc(k);
  end
  else begin
    if k=1 then begin
      ppDBText62.Left:=ppDBText62.Left+1.25;
      ppDBText63.Left:=ppDBText63.Left+1.25;
      ppLabel937.Left:=ppLabel937.Left+1.25;
      ppLabel940.Left:=ppLabel940.Left+1.25;
      ppLabel944.Left:=ppLabel944.Left+1.25;
      ppLabel945.Left:=ppLabel945.Left+1.25;
    end;
  end;
  if (CHECK_USER_DOSTUP('PRICE_LIST_MONEY1')=-1) then
  begin
    ppDBText60.Visible:=false;
    ppDBText61.Visible:=false;
    ppLabel936.Visible:=false;
    ppLabel939.Visible:=false;
    ppLabel942.Visible:=false;
    ppLabel943.Visible:=false;
    inc(k);
  end
  else begin
    if k=1 then begin
      ppDBText60.Left:=ppDBText60.Left+1.25;
      ppDBText61.Left:=ppDBText61.Left+1.25;
      ppLabel936.Left:=ppLabel936.Left+1.25;
      ppLabel939.Left:=ppLabel939.Left+1.25;
      ppLabel942.Left:=ppLabel942.Left+1.25;
      ppLabel943.Left:=ppLabel943.Left+1.25;
    end;
    if k=2 then begin
      ppDBText60.Left:=ppDBText60.Left+2.5;
      ppDBText61.Left:=ppDBText61.Left+2.5;
      ppLabel936.Left:=ppLabel936.Left+2.5;
      ppLabel939.Left:=ppLabel939.Left+2.5;
      ppLabel942.Left:=ppLabel942.Left+2.5;
      ppLabel943.Left:=ppLabel943.Left+2.5;
    end;
  end;
      ppDBText172.Left:=ppDBText172.Left+1.25*k;
      ppDBText166.Left:=ppDBText166.Left+1.25*k;
      ppDBMemo104.Left:=ppDBMemo104.Left+1.25*k;
      ppDBText170.Left:=ppDBText170.Left+1.25*k;
      ppDBText171.Left:=ppDBText171.Left+1.25*k;
      ppDBMemo113.Width:=ppDBMemo113.Width+1.25*k;

      ppLabel561.Left:=ppLabel561.Left+1.25*k;
      ppLabel531.Left:=ppLabel531.Left+1.25*k;
      ppLabel564.Left:=ppLabel564.Left+1.25*k;
      ppLabel563.Left:=ppLabel563.Left+1.25*k;
      ppLabel562.Left:=ppLabel562.Left+1.25*k;

      ppLabel548.Left:=ppLabel548.Left+1.25*k;
      ppLabel550.Left:=ppLabel550.Left+1.25*k;
      ppLabel539.Left:=ppLabel539.Left+1.25*k;
      ppLabel549.Left:=ppLabel549.Left+1.25*k;
      ppLabel547.Left:=ppLabel547.Left+1.25*k;

end;

procedure TPrint_DOC.frTorg12UserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
  var tonn, kg: string;
      weight: double;
      v: string;
      old: string;
      fieldName: string;
begin
    if (Name='DROPEOL') then
    begin
      old := DataModule2.PrintTorg12.fieldbyname(p1).asstring;
      v := stringreplace(old, char(13)+char(10),' ', [rfReplaceAll] );
      val :=v;
    end;

    if (Name='INTASSTRING') then
    begin
    v := money_char(frTorg12.Dictionary.Variables[p1], 1);

    val :=ansiLowerCase(v);
    end;

      if (Name='WEIGHTASSTRING') then
    begin
    weight:=frTorg12.Dictionary.Variables[p1];
    if (int(weight)>0) then
		tonn := money_char(weight, 2)+' т ';
    kg:=money_char( (weight - int(weight))*1000, 1) + ' кг';

    v := tonn + kg;

    val := ansiLowerCase(v);
    end;

    if (Name='REPLACE1') then
    begin
    val := stringreplace(DataModule2.PrintTorg12.FieldByName('RN_WHO').AsString, 'года, ', 'года'+chr(13), [rfReplaceAll]);
    end;



end;

procedure TPrint_DOC.frTorg12BeginDoc;
var frO: TfrView;

begin
       if datamodule2.Printtorg12.FieldByName('TYP_NDS').AsInteger<2 then
        begin
          frO := frTorg12.FindObject('Memo6');
          frO.Visible := False;
        end;
       frTorg12.Dictionary.Variables['UserName']:=''''+USERFIO_SHORT+'''';

       if (SHOPID  in [10,105]) then
       begin

        frO := frTorg12.FindObject('Memo153');
        frO.Visible := true;
       end;
end;

procedure TPrint_DOC.frSTFaktPNUserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var   v: string;
      old: string;
      fieldName: string;
begin
if (Name='DROPEOL') then
    begin



    old := DataModule2.PrintSTFaktPN.fieldbyname(p1).asstring;
    v := stringreplace(old, char(13)+char(10),' ', [rfReplaceAll] );

    val :=v;
    end;
end;

procedure TPrint_DOC.frSTFaktBeginDoc;
var prikaz: string;
begin

frstFakt.Dictionary.Variables['UserName']:=''''+USERFIO_SHORT+'''';


{
Прошу добавить в с/ф строку под подписью руководителя и гл.бухгалтера:
На основании приказа № 15/1 от 01,01,2009года Бадоев Э.Ю. (ООО Олимпия-розница)
На основании приказа № 17/1 от 01,01,2009года Батькина Г.В. (ООО Олимпия-розница)
На основании приказа № 04/2 от 11,01,2010года Шустров А.Ю. (ООО Олимпия-розница)
На основании приказа № 20/1 от 02,12,2008года Талакань Ю.А. (ООО Прометей)
На основании приказа № 11/2 от 03,03,2010года Куликов Д.В.. (ООО Прометей)
}

  if DataModule2.PrintSTFAKT.FieldByName('FRM_ID').asInteger=2702542 then
  begin
    if userid = 107 then  //батькина
      prikaz := 'На основании приказа № 17/1 от 01.01.2009 года Батькина Г.В.';
    if userid = 2702488 then  //бадоев
      prikaz := 'На основании приказа № 15/1 от 01.01.2009 года Бадоев Ю.Э.';
    if userid = 2697416 then  //бадоев
      prikaz := 'На основании доверенности 19/2010 от 29.09.2010 года Шуникова Ю.А.';
    if userid = 1423476 then  //Шустров
      prikaz := 'На основании приказа № 04/2 от 11.01.2010 года Шустров А.Ю.';
    if userid = 109 then  //Шустров
      prikaz := 'На основании приказа № 04/2 от 11.01.2010 года Шустров А.Ю.';


    if userid = 520028783 then  //Чумагина
      prikaz := 'На основании доверенности 16/2010 от 15.09.2010 года Чумагина Е.В.';

    if userid = 1646598 then  //Смирнова
      prikaz := 'На основании доверенности 17/2010 от 15.09.2010 года Смирнова Л.П.';

    if userid = 520029050 then  //Габриелян
      prikaz := 'На основании приказа 25/3 от 02.08.2010 года Габриелян И.А.';



  end;


  if DataModule2.PrintSTFAKT.FieldByName('FRM_ID').asInteger=2697090 then
  begin
    if userid = 2697416 then  //Талакань
      prikaz := 'На основании приказа № 20/1 от 02.12.2008 года Шуникова Ю.А.';
    if userid = 520028855 then  //Куликов
      prikaz := 'На основании приказа № 11/2 от 03.03.2010 года Куликов Д.В.';


    if userid = 107 then  //батькина
      prikaz := 'На основании приказа № 02 от 01.01.2011 года Батькина Г.В.';
    if userid = 2704266 then  //батькина
      prikaz := 'На основании приказа № 16 от 06.11.2012 года Щеников Н.В.';
    if userid = 2702488 then  //бадоев
      prikaz := 'На основании приказа № 02 от 01.01.2011 года Бадоев Ю.Э.';
    if userid = 1423476 then  //Шустров
      prikaz := 'На основании приказа № 02 от 01.01.2011 года Шустров А.Ю.';
    if userid = 109 then  //Шустров
      prikaz := 'На основании приказа № 02 от 01.01.2011 года Шустров А.Ю.';
    if userid = 520029050 then  //Габриелян
      prikaz := 'На основании приказа 02 от 01.01.2011 года Габриелян И.А.';
    if userid = 2703413 then  //Габриелян
      prikaz := 'На основании приказа 06/2 от 28.02.2014 года Килинкаров А.Г.';

  end;






  if prikaz<>'' then
    frSTFakt.Dictionary.Variables['PRIKAZ_TEXT']:='''/'+prikaz+'/''';
end;

procedure TPrint_DOC.MH1BeginDoc;
begin
MH1.Dictionary.Variables['UserFio']:=''''+USERFIO_SHORT+'''';
end;

procedure TPrint_DOC.MH1UserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var v: string;
    old: string;
    f_name: string;
begin
  if (Name='DROPEOL') then
    begin
    f_name:=copy(p1, 0, length(p1));

//    if (p1='1') then
//      old := DataModule2.Print_MH.fieldbyname('frm_1').asstring;
//    if (p1='2') then
      old := DataModule2.Print_MH.fieldbyname(p1).asstring;

    v := stringreplace(old, char(13)+char(10),' ', [rfReplaceAll] );

    val :=v;
    end;
end;

procedure TPrint_DOC.MH3UserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var v: string;
    old: string;
begin
  if (Name='DROPEOL') then
    begin
    old := DataModule2.Print_MH.fieldbyname(p1).asstring;
    v := stringreplace(old, char(13)+char(10),' ', [rfReplaceAll] );

    val :=v;
    end;
end;

procedure TPrint_DOC.frSTFakt2012BeginDoc;
var prikaz: string;
var frO: TfrView;
begin

frstFakt2012.Dictionary.Variables['UserName']:=''''+USERFIO_SHORT+'''';


{
Прошу добавить в с/ф строку под подписью руководителя и гл.бухгалтера:
На основании приказа № 15/1 от 01,01,2009года Бадоев Э.Ю. (ООО Олимпия-розница)
На основании приказа № 17/1 от 01,01,2009года Батькина Г.В. (ООО Олимпия-розница)
На основании приказа № 04/2 от 11,01,2010года Шустров А.Ю. (ООО Олимпия-розница)
На основании приказа № 20/1 от 02,12,2008года Талакань Ю.А. (ООО Прометей)
На основании приказа № 11/2 от 03,03,2010года Куликов Д.В.. (ООО Прометей)
}

if DataModule2.PrintSTFAKT.FieldByName('PRINT_FOOTER').asInteger=0 then
begin

        frO := frSTFakt2012.FindObject('PageFooter1');
          frO.Visible := False;
end;

  if DataModule2.PrintSTFAKT.FieldByName('FRM_ID').asInteger=2702542 then
  begin
    if userid = 107 then  //батькина
      prikaz := 'На основании приказа № 17/1 от 01.01.2009 года Батькина Г.В.';
    if userid = 2702488 then  //бадоев
      prikaz := 'На основании приказа № 15/1 от 01.01.2009 года Бадоев Ю.Э.';
    if userid = 2697416 then  //бадоев
      prikaz := 'На основании доверенности 19/2010 от 29.09.2010 года Шуникова Ю.А.';
    if userid = 1423476 then  //Шустров
      prikaz := 'На основании приказа № 04/2 от 11.01.2010 года Шустров А.Ю.';
    if userid = 109 then  //Шустров
      prikaz := 'На основании приказа № 04/2 от 11.01.2010 года Шустров А.Ю.';


    if userid = 520028783 then  //Чумагина
      prikaz := 'На основании доверенности 16/2010 от 15.09.2010 года Чумагина Е.В.';

    if userid = 1646598 then  //Смирнова
      prikaz := 'На основании доверенности 17/2010 от 15.09.2010 года Смирнова Л.П.';

    if userid = 520029050 then  //Габриелян
      prikaz := 'На основании приказа 25/3 от 02.08.2010 года Габриелян И.А.';

    if userid = 1423186 then  //Коржавина
      prikaz := 'На основании приказа № 10 от 11.10.2011 года Коржавина Л.В.';      


  end;


  if DataModule2.PrintSTFAKT.FieldByName('FRM_ID').asInteger=2697090 then
  begin
    if userid = 2697416 then  //Талакань
      prikaz := 'На основании приказа № 20/1 от 02.12.2008 года Шуникова Ю.А.';
    if userid = 520028855 then  //Куликов
      prikaz := 'На основании приказа № 11/2 от 03.03.2010 года Куликов Д.В.';


    if userid = 1423186 then  //Коржавина
      prikaz := 'На основании приказа № 10 от 11.10.2011 года Коржавина Л.В.';
    if userid = 107 then  //батькина
      prikaz := 'На основании приказа № 02 от 01.01.2011 года Батькина Г.В.';
    if userid = 2702488 then  //бадоев
      prikaz := 'На основании приказа № 02 от 01.01.2011 года Бадоев Ю.Э.';
    if userid = 1423476 then  //Шустров
      prikaz := 'На основании приказа № 02 от 01.01.2011 года Шустров А.Ю.';
    if userid = 109 then  //Шустров
      prikaz := 'На основании приказа № 02 от 01.01.2011 года Шустров А.Ю.';
    if userid = 520029050 then  //Габриелян
      prikaz := 'На основании приказа 02 от 01.01.2011 года Габриелян И.А.';


    if userid = 2704021 then  //Габриелян
      prikaz := 'На основании приказа 11 от 01.10.2011 года Степанов В. С.';
    if userid = 2704266 then  //Габриелян
      prikaz := 'На основании приказа 16 от 06.011.2012 года Щеников Н. В.';
    if userid = 520031268 then  //Габриелян
      prikaz := 'На основании приказа 27 от 01.07.2013 года Смирнов С. В.';
    if userid = 520031270 then  //Габриелян
      prikaz := 'На основании приказа 02 от 01.07.2013 года Жуков К. Е.';


  end;






  if prikaz<>'' then
    frstFakt2012.Dictionary.Variables['PRIKAZ_TEXT']:='''/'+prikaz+'/''';
end;

procedure TPrint_DOC.frSTFakt2012UserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var   v: string;
      old: string;
      fieldName: string;
begin
if (Name='DROPEOL') then
    begin



    old := DataModule2.PrintSTFakt.fieldbyname(p1).asstring;
    v := stringreplace(old, char(13)+char(10),' ', [rfReplaceAll] );

    val :=v;
    end;
end;

procedure TPrint_DOC.frTransportNakl2UserFunction(const Name: String; p1,
  p2, p3: Variant; var Val: Variant);

var tonn, kg: string;
      weight: double;
      v: string;
      old: string;
      fieldName: string;
begin


    if (Name='DROPEOL') then
    begin



    old := DataModule2.PrintTransportNakl2.fieldbyname(p1).asstring;
    v := stringreplace(old, char(13)+char(10),' ', [rfReplaceAll] );

    val :=v;
    end;
    if (Name='WEIGHTASSTRING') then
    begin
    weight:=frRND.Dictionary.Variables[p1];
    if (int(weight)>0) then
		tonn := money_char(weight, 2)+' т ';
    kg:=money_char( (weight - int(weight))*1000, 1) + ' кг';

    v := tonn + kg;

    val := ansiLowerCase(v);
    end;

end;

procedure TPrint_DOC.MH3BeginDoc;
begin
MH3.Dictionary.Variables['UserFio']:=''''+USERFIO_SHORT+'''';
end;

end.
