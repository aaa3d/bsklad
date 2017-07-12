unit B_DButils;
{ ********************************************************************
  **** Copyright 1980-1999 Britvin Sergej,                        ****
  **** Beginner(C), Yaroslavl, Russia,                            ****
  **** E-mail:  Beginner@inbox.ru                                 ****
  ****------------------------------------------------------------****
  ****  ������, ���������� ������� ������ � ����� � BSKLAD        ****
  ********************************************************************}

interface

uses windows, messages, B_utils,Sysutils,Data1,Menus,DataPrint,AllPrint,Forms,SetPnPrint,
     SetSubDoc,AnalizPn,MarketingTW,VclUtils,
     AnalizRn,AnalizSPIS,SpeedBar,SIZECENNIK,FormDebug,
     Unit_AMC100F,Elves_Unit,DataQr,Graphics, Unit_AMC200F, dialogs, FR_Shtrih, classes,
     RxLookup, IBQuery, IBdatabase, RxMemDS, FR_CLASS;

const
    UpColor=$009B9DFB; // ���� ������
    DownColor=$00F9A99D; // ���� ������
    ChangeColor=$00FEEA8B; // ���� ����������
             
    NoUtwColor=clRed; // ����� �������

    Preview=1;
    NoPreview=2;
    const_SF='��-�.';
    const_AV='��.��.';
    PathForHtmlZay='ZAYs\'; // ���� ��� ����������� HTML ������
    TYP_REAL=4; // ��� ��������� ��� ����������
    PROG_VERSION='3.03.05.03';
        ZAY_PNTYP=1; // ��� ������ �� ��������� � ������ �� �������
        ZAY_ZOLOR1=-1;  // ��������� � � ������
        ZAY_COLOR2=$0093C9FF; // �� �������
        ZAY_COLOR6=$00FFC4E1; // ��� �����������
        ZAY_COLOR3=$0080FF80; // ������������
        ZAY_COLOR4=$00C080FF; // ����������
        ZAY_COLOR5=$00FFFF80; // �����������
        ZAY_COLOR7=$00BCC6CB; // ����������
        TW_COLOR6=100000;
        ZAY_SPEED=3.0;
        FORM1_CAPTION='Beginner�'+#39+'s ��� ����� ������ '+PROG_VERSION+' ���������� ��� ����� ������߮, �. ���������';
        Isblob=1;
        AMC100F_NOFUN='��� ���-100� ������ ������� �� �������������!';
        MessErrorOsn='������ ��� ��������� ��������� �� ��������� !';
        MessErrorKKM='������ ����� � �������� ��������� !';
        MessNoSubdocST='����, �� ��������� �������� ��������� �������� ��������� ����� �����!';
        MessNoSubdocRN='��������� ���������, �� ��������� ������� ��������� �������� ��������� ����� �������!';
        MessNoSubdocPN='��������� ���������, �� ��������� ������� ��������� �������� ��������� ����� �������!';
        MessNoSubdocSPIS='��� ��������, �� ��������� �������� ��������� �������� ��������� ����� �����!';
        MessNoSubdocPER='��������� �����������, �� ��������� ������� ��������� �������� ��������� ����� �������!';
        MessNoSubdocMail='��������� ����������� �����, �� ��������� ������� ��������� �������� ��������� ����� �������!';
        MessNoSubdocRemon='��� ����������, �� ��������� �������� ��������� �������� ��������� ����� ������!';        
        MessChange='������ ���� ��������! �� ������������� ����� ��� ���������� ���������?';
        MessNoPrintNoProw='�� �� ����� ���� �� ������ �������������� ���������!';
        MessSubmitDelete='������������� ��������!';
        MessSubmit='�������������!';
        MessCritical='����������� ������!';
        MessError='������!';
        MessAdm='�������� ��������������!';
        MessSystem='��������� �������!';
        MessDostup='����������� �������!';
        MAX_PNTYP=50;
        MAX_PNTYP2=50;
        MAX_RNTYP=50;

        CAP_REPORT_CARD_ONE_SHOP='����� �� ������������� ���������� ���� ������ � ����� ��������';


type
    RN=record
      RN_ID: integer;

      SALES_ID: integer;
      RN_NUMS: integer;
      FRM_ID: integer;
      FRM_SHORT: string;
      FRM_PREFIX: string;
      KASSIR_ID: integer;
      KASSA_ID: integer;
      PO_SUMM: currency;
      FRM_USE_NDS: boolean;
      RVID_ID: integer;
    end;

    typecash=record
       otdel:integer;
       koli:real;
       Cena:real;
       towar: string;
       DocName: string;
       FrmID: integer;
       twSkid: double;
       DiskontNumber: string;
       Ed: string;
       skl_name: string;
    end;

    CHECK=record
       TW_ID:integer;
       TW_KOL:double;
       TW_MONEY:double;
       RN_SKID:double;
    end;
    IbRec=record
        NAME:ansistring;
        VALUE:variant;
        BLOB:boolean;
    end;
    PNRNTYP=record
       SHORT:string[32];
       FULL:string[254];
       ID:integer;
       Doc:integer;
       Jou:integer;
       IsTemp: boolean;
    end;
    KATTYP=record
      ID:integer;
      NAME:string[254];
    end;
    ARRTYP=record
       ID:integer;
       KOL:double;
    end;

    type FastQuery = class(TIBQuery)
      private
        _tr: TIBtransaction;
      public
      constructor Create(SQL: string);
    end;

const
  gl_READY_COM_DATA = WM_USER + 1;      //���������, ��������  ��� � gl_COM_DATA ���� ������ �� ������� ����� �����.

var
   CheckTitle : TTitle;
   CheckBottom: TBottom;
   CheckSale: array [0..40] of TSale;
   KKM_COM:integer; // ����� ����� ���
   Global_close_day:tdatetime; // ���� ������ ��
   global_NoFindKKM: Boolean;
   cnt_dop_elves:integer;
   arr_dop_elves:array[1..200] of string[24];
   cnt_dop_AMS:integer;
   arr_dop_AMS:array[1..200] of string[24];
   Print_dop_Elves:boolean;
   Can_create_PO:boolean; // ����� �� ������������ ��������� ����������
   History_doc_name:string; // ���������� ��� ������� �������
   History_doc_ID:integer;
   KKM_ON:boolean; // ��� ���������
   KKM_ID: integer;	//id ��������� ��� ������ �����
   StopFlag:boolean; // ��� ������ ����
   Count_cash_towar:integer;
//   CASH_TOWAR_NAME:array[0..100] of string;
   CASH_TOWAR:array[0..100] of typecash;
   KKM_ONLINE_CODE:string;
   GlDocNum,GlDocOpis:ansistring;
   GlDocDate:Tdatetime;
   DicUslSet:integer;
   DEFAULT_NAKL_KLN:integer=0;
   DEFAULT_NAKL_USL:integer=2;
   DEFAULT_NAKL_MET:integer=1;
   JOU_REFRESH_TIME:integer; // �������� �������������� �������� (�� ���������-30 ���)
   JOU_REFRESH_CAN:boolean; // ��������� �� �������;
   IS_EMAIL_CHECK:boolean; // ��������� ������������ �������� e-mail � �����������
   NUM_KASSIR:integer; // ����� ������� ��� ����������� ������������
   USER_PASSWORD:ansistring; // ������ ������������ (������������ � ���������� ������������
   MODEL_KKM:integer; // ������ ��� (1-���-100�, 2 �� �����-���� ��-�
   IS_KKM:boolean; // ���������, ��������� �� ��� � ������� ��������� ��������
   PRINT_KKM_TW_NAME:integer; // �������� �� �� ���� ������ ������������ ������ (0 - �� ��������, 1 - ������, 2 - �����������)
   GLOBAL_PROPTWKTG_SELECT:integer;
   LOGO_NAME:ansistring; // ���� � ����� ��������
   MP_NAME:ansistring; // ���� � ����� ������
   PRINT_MP:boolean; // �������� ������ ��� ���
   // ����� ��� ������
   base_name:array[1..100] of ansistring;
   base_paths:array[1..100] of ansistring;
   base_ico:array[1..100] of ansistring;
   base_logo:array[1..100] of ansistring;
   BASE_NAME_GLOBAL:ansistring;

   BASE_PATH:ansistring;  // ���� � ����
   GLOBAL_MAIN_KURS:double; // ���� ���������������
   ADM_TIME:boolean;
   CAN_ADM_JOU:boolean; // ����� �� ���������������� �������
   CAN_ADM_KONTAKT:boolean; // ����� �� ���������������� �������
   KKM_NOOST:boolean;
   TW_CAN_CREATE,TW_CAN_EDIT,TW_CAN_DELETE:boolean;
   DEFAULT_USGROUP:integer;
   IsEmailExport:boolean; // ����� �������� ������� ��������� ���������
   IsRefreshRe:boolean; // ����� ������� �������
   IS_EDIT_NPZ, IS_EDIT_WOZW,IS_EDIT_WOZW_PN,IS_EDIT_RN,IS_EDIT_PN,IS_EDIT_SPIS,IS_EDIT_PER, IS_EDIT_ZONE_PER, IS_EDIT_PSORT, IS_EDIT_SALE:boolean;
   DEFAULT_PNVID_WOZW,DEFAULT_RNVID_WOZW:integer;
   GLOBAL_SKID:double;
   GLOBAL_MON1:double;
   DEFAULT_ZAY_PNVID:integer;
   ADM_TW:boolean; // ����������������� ������
   JOU_RN_CHANGE:boolean; // ����������� ��������� � ������� � ��������
                  // � �� ��������� ��������
   DEFAULT_ST_SKID:integer; // ��� ������� ��� ������ � �����
   GlCanKKM:boolean; // ��������� ��������

   SHOW_ZAKUP:boolean; // �������� ���������� ���
   SHOW_POST:boolean; // �������� ���������� � ����������
   CANTW_DETAL,CANTW_ANALIZ,CANTW_MARKETING:boolean; // ������ �
     // ��������� ���������, �������, ������������� ������

   SELECT_SKLAD:integer;
   GL_SELECT_SHOP:integer;
   NEWUPDATE_TWTREE,UPDATE_TWTREE:Tdatetime;
   IsPnOst:boolean; // ����� ������� �������� �� ��������� ���������
   ADM_USGROUP:integer=1; // ��������� ��������������
   USER_USGROUP:integer; // ��������� ������� ������������
   DEFAULT_SERVER_NAME:ansistring;
   DEFAULT_TW_ED,DEFAULT_TW_TWKTG,DEFAULT_TW_VALUTA:integer;
   DEFAULT_OWNER_PN,DEFAULT_OWNER_REMON:integer;
   IS_ANALIZ_TW,IS_ANALIZ_PN,IS_ANALIZ_RN,IS_ANALIZ_SPIS:boolean;
   TW_FON,TW_COLOR:integer;
   PATH_TMP:ansistring; // ������� ��� ��������� ������
   PATH_SHOP:ansistring;  // ������� ��� ��������� �������
   GLOBAL_PATH_REMOTE_SHOP:ansistring; // ������� ��� ��������� �������
   PATH_REMOTE_SHOP:ansistring;
   TMP_MES:double;
   VALUTA_TMP1,VALUTA_TMP2:ansistring;
   TMP_COEFF:double;
   IVALUTA_TMP,KTG_TMP1,KTG_TMP2:integer;
   TMP1,TMP2,TMP3:double;
   ITMP1,ITMP2,ITMP3:integer;
   TYP_KKM:integer;
   CFG_MAIN_FORM:integer;
   SHOP_TMP:ansistring;
   MAX_PRIBYL:double; {���������� ��� ������ � ������������}
   CARDKLNTREE:integer=48330003; {������� ��� ����������� ���� �� ���������}
   ARR_CHECK:array[1..1000] of check;
   CNT_CHECK:integer=0;
   DEFAULT_VALUTA_KURS:integer=1; {������ ��� ������ ��������� - ������}
   TIME_GET_DISCONT:integer;
   DicTowarSet:integer;
   DicKlnSet:integer;
   CNT_TW:integer;
   ARR_TW:array[1..1000] of ARRTYP;

   CNT_KLN:integer;
   ARR_KLN:array[1..1000] of ARRTYP;

   CanInsertMon:boolean; {��� ��� � �����}

   // ����� ���������
   MySubDocPn2Btn: array[0..MAX_PNTYP2] of TSpeedItem;
   MySubJouPn2Btn: array[0..MAX_PNTYP2] of TSpeedItem;
   MySubDocsPn2Menu: array[0..MAX_PNTYP2] of TMenuItem;
   MySubJouPn2Menu: array[0..MAX_PNTYP2] of TMenuItem;

   MySubDocRnBtn: array[0..MAX_RNTYP] of TSpeedItem;
   MySubJouRnBtn: array[0..MAX_RNTYP] of TSpeedItem;
   MySubDocsRnMenu: array[0..MAX_RNTYP] of TMenuItem;
   MySubWozwRnMenu: array[0..MAX_RNTYP] of TMenuItem;
   MySubWozwPnMenu: array[0..MAX_PNTYP] of TMenuItem;
   MySubJouRnMenu: array[0..MAX_RNTYP] of TMenuItem;
   CntPNTYP:integer=0;
   CntRNTYP:integer=0;     {������� ���������� ����� ��������� � ��������� ���������}
   PNTYP:array[1..MAX_PNTYP] of PNRNTYP; {������ ����� ��������� ���������}
   RNTYP:array[1..MAX_RNTYP] of PNRNTYP; {������ ����� ��������}
   IbRecCnt:integer=0;
   IbArrREC:array[1..200] of IbRec;
   USERID:integer;
   USER_TABEL: integer;   
   USERFIO,USERFIO_SHORT:ansistring;
   USER_EDIT_MONEY_MODE: integer;
   USER_MIN_MONEY_KTG: integer;
   //��������� ����� ������� 14.04.2004 �� ������� �2 - ��������� ������ ������� ����
   CASHIER_NAME : ansiString; //����� ���� ��� �������� ����� �������. ����������� ��
   //������� KLN.KLN_KKM_PASSWORD � ������������� � ������ "EditKontakt"
   //��� �� ������������� �������� ���� � ���� �� ������������ �������� - ���
   //������������� ������������� ��������� ���� ��� ���� �����

   USWORK_ID:integer=0;
   COMPUTERNAME:ansistring;
   SHOPID:integer;
   MANUAL_SHOPID: integer;
   MARKET_PERIOD:integer=30;
   DEFAULT_RNTYP_KKM:integer;

   DEFAULT_FIRMA:integer;
   DEFAULT_OWNER:integer;
   DEFAULT_KLIENT:integer;
   DEFAULT_POST:integer;
   DEFAULT_SKLAD:integer;
   DEFAULT_SHOP:integer;
   DEFAULT_PNVID:integer;
   DEFAULT_RNVID:integer;
   DEFAULT_SPISVID:integer;

   GL_FRM_WORK_MODE: integer;  //���������� ID �����, ������� �������� (�� ��� ���)
                            // ���� ��, �� ���� ������� � ��������� ������� (FRM = 0)
                            // ���� ��������� ����� - �� ���� ���������.

   OST_COLOR1:integer; {������� ������� ��� ����������}
   OST_COLOR2:integer; {������� �� ������� ��� ����������}
   OST_COLOR3:integer; {������� �������������}
   OST_COLOR4:integer; {������� �������}

   OTG_COLOR1:integer; {����, ���� ����� ������ �� �������/�� ��������}
   OTG_COLOR2:integer; {����, ���� ����� �������/�������� ���������}
   OTG_COLOR3:integer; {����, ���� ����� �������/�������� ��������}
   OTG_COLOR4:integer; {����, ���� ����� �������/�������� � ���������}

   GL_TEXT: string;
   gl_SHOP_FRM: integer;
   gl_COM_PORT, gl_COM_PORT2, gl_COM_PORT3: string; //��� ��� ����� ��� ������� ����� �����.
   gl_LAST_BAR_CODE: string;


   GET_DEFAULT_LAST_TIME: TDateTime;



//function NDS_DATE(DT:tdatetime):double;
function NDS_DATE(DT:tdatetime; RNTYP_ID: integer=0):double;
function NDS_SMALL_DATE(DT:tdatetime):double;   //���������� ������� ��� �� ��������� (��������� 07.04.2004 ��� ��� 10%)
function NP_DATE(RNTYP_ID:integer;DT:tdatetime):double;
function PREP_KKM1:boolean;
function PREP_KKM2:boolean;
function PREP_KKM3:boolean;
function BSKLAD_CONTROLSUMM(s:ansistring):int64;
//procedure print_wozwrat_cash; // ������� ������
Procedure Add_LOG(s:ansistring);
Procedure Edit_RN(RN_ID:integer);
Procedure Edit_PN(PN_ID:integer);
Procedure Edit_PER(PER_ID:integer);
Procedure Edit_NPZ(NPZ_ID:integer);
Procedure Edit_PSORT(PSORT_ID:integer);
Procedure Edit_SPIS(SPIS_ID:integer);
Procedure DET_REAL(TW_ID:integer;MES:double);
Procedure My_Lock;
procedure SHOP_RVID_DEFAULT(SHOP_ID,RTYP_ID:integer;var RVID_ID:integer;VAR RVID_KLN:integer;VAR RVID_SUBKLN:integer);
Function SHOP_KLN_DEFAULT(SHOP_ID,RTYP_ID:integer):integer;
Function SHOP_FRM_DEFAULT(SHOP_ID,RTYP_ID:integer):integer;
Function SHOP_KLN_DEFAULTPN(SHOP_ID,PTYP_ID:integer):integer;
Function SHOP_FRM_DEFAULTPN(SHOP_ID,PTYP_ID:integer):integer;
Procedure SEND_MAIL(TYP:integer;TXT:ansistring);
procedure CLEAR_CENNIK;
procedure ADD_CENNIK(TW_ID:integer;SKL_ID:integer; FRM_NAME: string='');
procedure CLEAR_KKM;
procedure ADD_KKM(TW_ID:integer;TW_KOL,TW_MONEY,RN_SKID:double);
{������� ��������� ������������� �����, ���� ���� -���������� ID � �������,
 ���� ��� - ���������� ����������������}
//isAdminMode �������� - ����� �� �������������� ����� ��������� ��� ���.
//�������������, ��� ���, �� � ������� ����. ���� ����� ��������� �������������� �����
//isDialogMode �������� - ����� �� ��������� ���-�� ���������� ��� ��� ������� ��� ��������
function GET_DISKONT(CARD_NUM:ansistring; VAR DISKONT_PERCENT:double;VAR KLN_ID:integer;
          VAR KLN_FULL:ansistring; Const isAdminMode:boolean = False;
           Const isDialogMode:boolean = True; const SALE_SUMM: double = 0; isAutoRegister: boolean = false):integer;
procedure B_STOP;
Function GetOst(TW_ID,SKL_ID:integer; FRM_ID: integer=0):double;
Function GetSaleOst(TW_ID,SKL_ID:integer):double;
Function GetZoneOst(TW_ID,skl_id,ZONE_ID:integer):double;
Function GetShopOst(TW_ID,SHOP_ID, ZONE_TYPE, ZONE_CLOSED:integer):double;
Function GetOstList(TW_ID,ListSKL:integer):double;
procedure SHOW_DETAL_TW(TW_ID:integer);
procedure SHOW_ANALIZ_TW(TW_ID:integer);
procedure SHOW_ANALIZ_PN(PN_ID:integer);
procedure SHOW_ANALIZ_RN(RN_ID:integer);
procedure SHOW_ANALIZ_SPIS(SPIS_ID:integer);
procedure SHOW_MARKETING_TW(TW_ID:integer);
PROCEDURE SHOW_HISTORY_DOC(Cap:string;DOC:string;ID:integer);
PROCEDURE SubDoc(TYP:INTEGER;ID:integer);
PROCEDURE PRINT_OPLATA(OPLATA_ID:integer);
PROCEDURE PRINT_SALE(SALE_ID:integer; bShowSkid: boolean=true ; SilentPrint: boolean = false; doubleCopy: boolean = false);
PROCEDURE PRINT_SALE_MH3(SALE_ID:integer; count: integer = 1);
PROCEDURE PRINT_RN(RN_ID:integer; bShowSkid: boolean=true; PRINT_SPEZIF: boolean=false; silent_print: boolean=false; doubleCopy: boolean = false);
PROCEDURE PRINT_RN_TTN(RN_ID:integer; bShowSkid: boolean=true);
PROCEDURE PRINT_RN_T12(RN_ID:integer; n_typ:integer; bShowSkid: boolean=true);
PROCEDURE PRINT_PN_T12(PN_ID:integer; n_typ:integer; bShowSkid: boolean=true);
//PROCEDURE PRINT_PN_T12(PN_ID:integer; n_typ:integer; bShowSkid: boolean=true);
PROCEDURE PRINT_MH1_MH3(DOC_TYPE, DOC_ID, PRINT_FORM_TYPE:integer);
PROCEDURE PRINT_RN_MH3_SILENT(DOC_ID :integer; count: integer = 1);
procedure PRINT_trans_nakl(PN_ID:integer; doc_type: integer);
procedure PRINT_RN_WOZW_ST_FAKT(RN_ID: integer);
procedure PRINT_PN_ST_FAKT(PN_ID: integer);
PROCEDURE PRINT_RN_OLD(RN_ID:integer);
PROCEDURE PRINT_SALE_OLD(SALE_ID:integer);
PROCEDURE PRINT_NPZ(NPZ_ID:integer); // ������ ��������� ����������� ����������� ����� ������	(���)
PROCEDURE PRINT_RNW(RN_ID:integer);
PROCEDURE PRINT_REMON(REMON_ID:integer;SKL_ID:integer);
PROCEDURE PRINT_MAILS(MAIL_ID:integer);
PROCEDURE PRINT_MAILS2(MAIL_ID:integer;TYP:integer);
PROCEDURE PRINT_MAILS2RN(MAIL_ID:integer);
PROCEDURE PRINT_GARANT_TALON(GARANT_ID:integer);
PROCEDURE PRINT_STFAKTDOC(STFAKT_ID:integer);
PROCEDURE PRINT_STFAKTDOC_NEW(STFAKT_ID:integer);
PROCEDURE PRINT_STFAKTDOC_2012(STFAKT_ID:integer;IS_WOZW_RN: integer);
PROCEDURE PRINT_CHECK1(RN_ID:integer;MODE:integer; bShowSkid: boolean=true);
PROCEDURE PRINT_SALE_CHECK1(SALE_ID:integer;MODE:integer; bShowSkid: boolean=true);
PROCEDURE PRINT_CHECK2(KKM_ID:integer;Mode:integer);
PROCEDURE PRINT_CHECK3(RN_ID:integer;MODE:integer);
PROCEDURE PRINT_CHECK4(KKM_ID:integer;Mode:integer);
PROCEDURE PRINT_PN(PN_ID:INTEGER;X,Y:integer);
PROCEDURE PRINT_DETALKLN(KLN_ID:integer);
PROCEDURE PRINT_ST(ST_ID:integer);
PROCEDURE PRINT_SPIS(SPIS_ID:integer);
PROCEDURE PRINT_PSORT(PSORT_ID:integer);
PROCEDURE PRINT_PER(PER_ID:integer);
PROCEDURE PRINT_CENNIK;
FUNCTION NEW_MAIL_NUM(FRM_ID: integer; MAIL_DATE:TdateTime):INTEGER;  //
FUNCTION NEW_PN_NUM(PNTYP_ID:INTEGER;FRM_ID: integer;PN_DATE:TDateTime):INTEGER; //
FUNCTION NEW_PO_NUM(FRM_ID: integer; PO_DATE:TdateTime):INTEGER; // ����� ����� ����������   //
FUNCTION NEW_RN_NUM(RNTYP_ID:INTEGER;FRM_ID: INTEGER; RN_DATE:TDateTime):INTEGER;  //
FUNCTION NEW_SALE_NUM(RNTYP_ID:INTEGER;SALE_DATE:TdateTime):INTEGER;
FUNCTION NEW_ST_NUM(FRM_ID: integer;ST_DATE:TDateTime):INTEGER; //
FUNCTION NEW_ZREMON_NUM(ZREMON_DATE:TDateTime):INTEGER;
FUNCTION NEW_TRINDEF_NUM(TRINDEF_DATE:TDateTime):INTEGER;
FUNCTION NEW_OPLATA_NUM(OPLATA_DATE:TDateTime):INTEGER;
FUNCTION NEW_REMOn_NUM(FRM_ID: integer; REMON_DATE:TDateTime):INTEGER; //
FUNCTION NEW_PSORT_NUM(FRM_ID: integer; PSORT_DATE:TDateTime):INTEGER;   //
FUNCTION NEW_STFAKT_NUM(FRM_ID: integer;STFAKT_DATE:TDateTime):INTEGER;    //
FUNCTION NEW_SPIS_NUM(FRM_ID: integer;SPIS_DATE:TDateTime):INTEGER; //
FUNCTION NEW_PER_NUM(FRM_ID: integer;PER_DATE:TDateTime):INTEGER; //
FUNCTION NEW_ZONE_PER_NUM(PER_DATE:TDateTime):INTEGER;
FUNCTION NEW_GARANT_NUM(GARANT_DATE:TDateTime):INTEGER;
FUNCTION UNPROV_PN(PN_ID:integer;s:ansistring; UseSharedTransaction: boolean=false):boolean;
FUNCTION PROV_PN(PN_ID:integer;s:ansistring; UseSharedTransaction: boolean=false):boolean;
FUNCTION UNPROV_PER(PER_ID:integer;s:ansistring):boolean;
FUNCTION UNPROV_ZONE_PER(ZONE_PER_ID:integer;s:ansistring):boolean;
FUNCTION PROV_PER(PER_ID:integer;s:ansistring):boolean;
FUNCTION PROV_ZONE_PER(ZONE_PER_ID:integer;s:ansistring):boolean;
FUNCTION UNPROV_NPZ(NPZ_ID:integer;s:ansistring):boolean;
FUNCTION PROV_NPZ(NPZ_ID:integer;s:ansistring):boolean;
FUNCTION UNPROV_SPIS(SPIS_ID:integer;s:ansistring):boolean;
FUNCTION PROV_SPIS(SPIS_ID:integer;s:ansistring):boolean;
FUNCTION UNPROV_SPIS_WOZW(SPIS_ID:integer;s:ansistring):boolean;
FUNCTION PROV_SPIS_WOZW(SPIS_ID:integer;s:ansistring):boolean;
FUNCTION UNPROV_PSORT(PSORT_ID:integer;s:string):boolean;
FUNCTION PROV_PSORT(PSORT_ID:integer;s:string):boolean;
FUNCTION UNPROV_RN(RN_ID:integer;s:ansistring; UseSharedTransaction: boolean=false):boolean;
FUNCTION UNPROV_WOZW(WOZW_ID:integer;s:ansistring):boolean;
FUNCTION UNPROV_WOZW_PN(WOZW_ID:integer;s:ansistring):boolean;
FUNCTION PROV_REMON(REMON_ID:integer;s:ansistring):boolean;
FUNCTION PROV_RN(RN_ID:integer;s:ansistring; UseSharedTransaction: boolean=false{;FastProw: boolean=false}):boolean;
FUNCTION PROV_SALE(SALE_ID:integer;s:ansistring; FastProw: boolean=false):boolean;
FUNCTION UNPROV_SALE(SALE_ID:integer;s:ansistring):boolean;
FUNCTION PROV_WOZW(WOZW_ID:integer;s:ansistring):boolean;
FUNCTION PROV_WOZW_PN(WOZW_ID:integer;s:ansistring):boolean;
FUNCTION DEFAULT_KURS(VALUTA_ID,KURS_TYP:INTEGER):double;
function GET_DEFAULT_SHOP(SKL_ID: integer): integer ;
PROCEDURE GET_DEFAULT;
function GET_DEFAULT_CFG(CFG_NAME: string; CFG_SET1: integer): integer;
PROCEDURE IBSAVE_CLEAR;
PROCEDURE IBSAVE_ADD(NAME:ansistring;VALUE:variant); Overload;
PROCEDURE IBSAVE_ADD(NAME:ansistring;VALUE:variant;OnBlob:integer); Overload;
FUNCTION IBSAVE_DOC(TABLENAME:ansistring;TABLEID:integer):integer;
FUNCTION IBDELETE_DOC(TABLENAME:ansistring;TABLEID:integer):boolean;
PROCEDURE PRINT_KKM;
function CHECK_DOSTUP(USDOSTUP_NAME:ansistring):boolean;
function CHECK_USER_DOSTUP(USDOSTUP_NAME:ansistring;_user_id:integer=0):integer;
procedure MainMenuSet;
procedure clear_cash;
procedure add_cash(SW1:ansistring;Cena,KOL:double;Otdel:integer;DocName: string; FrmID: integer; tw_skid:double=0; DISKONT_NUM: integer=0; Ed: string=''; skl_name: string = '');
function wozw_cash(NDSType: integer;cashType: integer):integer;
function print_cash(Mon2,Mon3:double; NDSType: integer;CashType: integer;Copy: boolean=false):integer;
function FR_SHTRIH_GET_REG_VALUE(frm_id: integer; reg: integer): double ;

Function ZPCalc(FN:ansistring;Ryear,Rmes:integer):real;
procedure Show_Wait(s:string;P:integer);
procedure RN_TO_PO(RN_ID:integer);
procedure RN_SHOWPO(RN_ID:integer);
procedure WYP_ZREMON(ZREMON_ID:integer);
procedure WYP_ZTRINDEF(TRINDEF_ID:integer;SKLID:integer);
procedure OutKkmError;
function CheckTwSaler(memData: TRxMemoryData; frm_id: integer): boolean;
function GetTWKtgPrice(tw_id, price_typ: integer): double;
function CheckTWPrice(memTable: TRxMemoryData; _kln_ktg_id: integer; maxPercent: double=0): integer;

procedure SetKlnPrice(memTable: TRxMemoryData; _kln_ktg_id: integer);




implementation

uses StFaktError,FormLock,DetalTW,
  SelectPrintRemon,WaitForm,
  DetalReal,PrintDoc,MainForm,DocRn,DocSpis,DocPer, AnalizTw,DocPn2,KkmWait,historydoc,
  DocPO,RNSHOWPO,DocRnWozw,DocPnWozw,DocPsort, CardRegister, CardDelivery, DocSpisWozw, DocRemind;

procedure SetKlnPrice(memTable: TRxMemoryData; _kln_ktg_id: integer);
var oldID: integer;
  price: double;
  klnKtgName: string;
begin
if memTable.RecordCount=0 then
  exit;

//
memTable.DisableControls;
  oldID:=memTable.fieldbyname('tw_id').asinteger;
  memTable.first;
  while not memTable.Eof do
  begin
    if memTable.FieldByName('tW_money').asfloat=0 then
      continue;

    memTable.Edit;

    price:=GetTWKtgPrice(memTable.fieldbyName('tw_id').asinteger, _kln_ktg_id);
    memTable.FieldByName('tW_skid').asfloat:=(memTable.FieldByName('tW_money').asfloat-price)*100/memTable.FieldByName('tW_money').asfloat;
    memTable.Fieldbyname('TW_SKID_LOAD').asfloat:= memTable.FieldByName('tW_skid').asfloat;


    if _kln_ktg_id=1 then klnKtgName:='������� ������';
    if _kln_ktg_id=2 then klnKtgName:='������-������� ������';
    if _kln_ktg_id=3 then klnKtgName:='���� ������';



    try
     memTable.FieldByName('skid_txt').asstring:=klnktgname;
    except
    end;

    memTable.post;
    memTable.next;
  end;
  memTable.Locate('tw_id', oldID, []);

memTable.EnableControls;
end;

function CheckTWPrice(memTable: TRxMemoryData; _kln_ktg_id: integer; maxPercent: double): integer;
var oldID: integer;
  skidLevel1, skidLevel2, skidLevel3: boolean;

  haslevel1Error: boolean;  //������� ������
  hasLevel2Error: boolean;  //������� ������ ��� �� ���� ���������
//  hasLevel22Error: boolean;  //������� ������ ��� �� ��� ���������
//  hasLevel23Error: boolean;  //������� ������ ��� �� ���� ���������
  hasLevel3Error: boolean;  //������� ���� �������
  rasprod: boolean;
  hasRasprodError: boolean;

  hasNoSkidError: boolean;


  zak_money, rozn_money, kln_ktg_money: double;
  ktg: integer;

begin
//��������� ������������ ����
//���� ��� �������� �� ��������, �������� � �� ������ ��������� ���� ������� ������
//1. ���� ���� ������ �� 1 ���������, �������� ������ ���� ���� ���� ��������� � �� ������ ���������
//2. ���� ���� ������ �� 2 ���������, �������� ������ ���� ���� ���� ��������� � �� ������ ���������
//3. ���� ���� ������ �� 3 ���������, �������� ������ ���� ���� ���� ��������� � �� ������ ���������

//2. ���� ���� ������ ������� �� �������, �������� � �� ������ ��������� ���� ���� �������
//3. ���� ���� ������ ������ ���� �������, ������ �������������


  ktg:=_kln_ktg_id; //��������� ����������� ��������� �������
                    //����� ��� ����� ���������� ������������ �� ����������� �������

  if USER_EDIT_MONEY_MODE=1 then        //����� �������� �� ���� ���������
    if _kln_ktg_id<4 then {����, ���, ��. ���}
      if _kln_ktg_id+1>USER_MIN_MONEY_KTG  then {�� ���}
        _kln_ktg_id:=USER_MIN_MONEY_KTG-1;

  if USER_EDIT_MONEY_MODE=4 then      //����� �������� �� ��� ���������
    if _kln_ktg_id<4 then {����, ���, ��. ���}
      if _kln_ktg_id+2>USER_MIN_MONEY_KTG  then {�� ���}
        _kln_ktg_id:=USER_MIN_MONEY_KTG-2;

  if USER_EDIT_MONEY_MODE=5 then      //����� �������� �� ��� ���������
    if _kln_ktg_id<4 then {����, ���, ��. ���}
      if _kln_ktg_id+3>USER_MIN_MONEY_KTG  then {�� ���}
        _kln_ktg_id:=USER_MIN_MONEY_KTG-3;



  if memTable.RecordCount=0 then
    exit;


  hasLevel1Error:=false;
  hasLevel2Error:=false;
//  hasLevel22Error:=false;
//  hasLevel23Error:=false;
  hasLevel3Error:=false;
  hasNoSkidError:=false;


  {
  USER_EDIT_MONEY_MODE=0 - �������� ����� ���� ���� ������ ��� ���� �������
  USER_EDIT_MONEY_MODE=1 - �������� ���� ���� ������ � ����� ���� ��� �� 1 ���������
  USER_EDIT_MONEY_MODE=4 - �������� ���� ���� ������ � ����� ���� ��� �� 2 ���������
  USER_EDIT_MONEY_MODE=5 - �������� ���� ���� ������ � ����� ���� ��� �� 3 ���������
  USER_EDIT_MONEY_MODE=2 - �������� ���� ���� ������ � ����� ���� �������
  USER_EDIT_MONEY_MODE=3 - ������������� ���� ���� ������ � ����� ���� �������

  }
  //
  result:=1;
  memTable.DisableControls;
    oldID:=memTable.fieldbyname('tw_id').asinteger;
    memTable.first;



    while not memTable.Eof do
    begin


      if ((memTable.fieldbyname('tw_skid').asfloat>memTable.fieldbyname('tw_skid_load').asfloat) and (USER_EDIT_MONEY_MODE=0)) then
      begin
        if memTable.fieldbyname('tw_skid').asfloat> MaxPercent then
        begin
          messbox('�� �� ������ ��������� ������', MessSystem, 48);
          result:=-5;
          memtable.EnableControls;
          break;
        end;
      end;
      memtable.Next;
    end;

   if result=-5 then
    exit;




    memTable.first;
    while not memTable.Eof do
    begin
//********************
      if(memTable.fieldbyName('napr').asinteger=1) then
        _kln_ktg_id:=memTable.fieldbyName('ktg').asinteger //+1
      else
        _kln_ktg_id:=ktg;

      if USER_EDIT_MONEY_MODE=1 then
        if _kln_ktg_id<4 then
          if _kln_ktg_id+1>USER_MIN_MONEY_KTG  then
            _kln_ktg_id:=USER_MIN_MONEY_KTG-1;

      if USER_EDIT_MONEY_MODE=4 then
        if _kln_ktg_id<4 then
          if _kln_ktg_id+2>USER_MIN_MONEY_KTG  then
            _kln_ktg_id:=USER_MIN_MONEY_KTG-2;

      if USER_EDIT_MONEY_MODE=5 then
        if _kln_ktg_id<4 then
          if _kln_ktg_id+3>USER_MIN_MONEY_KTG  then
            _kln_ktg_id:=USER_MIN_MONEY_KTG-3;
//********************

        //���������� ������ ���� ������ ������������ ��
        rozn_money:=GetTWKtgPrice(memTable.fieldbyName('tw_id').asinteger, 0);
        if USER_EDIT_MONEY_MODE=1 then    // +1
        begin
          kln_ktg_money:=GetTWKtgPrice(memTable.fieldbyName('tw_id').asinteger, _kln_ktg_id+1);
        end;
        if USER_EDIT_MONEY_MODE=4 then    // +2
        begin
          kln_ktg_money:=GetTWKtgPrice(memTable.fieldbyName('tw_id').asinteger, _kln_ktg_id+2);
        end;
        if USER_EDIT_MONEY_MODE=5 then    // +3
        begin
          kln_ktg_money:=GetTWKtgPrice(memTable.fieldbyName('tw_id').asinteger, _kln_ktg_id+3);
        end;
        zak_money:=GetTWKtgPrice(memTable.fieldbyName('tw_id').asinteger, 5);

        rasprod:=false;
        hasRasprodError:=false;
        if rozn_money<=zak_money then
        begin
          Rasprod:=true;
        //���� ����. ���� ����� �������, ��������� ����� ���� ������� ��������� ���� �������
          if ((memTable.FieldByName('tw_okmoney').asfloat<rozn_money) and (USER_EDIT_MONEY_MODE <> 3)) then
          begin
            hasRasprodError:=true;
            break;
          end;

        end;




      if not rasprod then
      begin

        if (memTable.FieldByName('tw_noskid').asinteger=1) then
          if (memTable.FieldByName('tw_okmoney').asfloat+0.1<rozn_money) then
             if USER_EDIT_MONEY_MODE<>3 then
             if  ((SHOPID <>10) and (SHOPID<>105)) then
                begin
                  hasNoSkidError:=true;
                  break;
                end;


{
        if memTable.fieldbyName('tw_skid').asfloat>0 then
        begin
            haslevel1Error:=true;
            if USER_EDIT_MONEY_MODE=0 then
              break;
        end;
}
        if (_kln_ktg_id in [0])  then    {���������� ����� � �������� � ��������!!!!!!!!!!!!}
          if (   memTable.FieldByName('tw_okmoney').asfloat+0.1<kln_ktg_money) and (memTable.FieldByName('tw_skid').asfloat>memTable.FieldByName('tw_skid_load').asfloat) then
          begin

            if memTable.FieldByName('tw_skid').asfloat>MaxPercent then
            begin
                hasLevel2Error:=true;
                if (USER_EDIT_MONEY_MODE in [1,4,5]) then
                  break;
            end;
          end;



        if (_kln_ktg_id in [1,2])  then    {���������� ����� � �������� � ��������!!!!!!!!!!!!}
          if (   memTable.FieldByName('tw_okmoney').asfloat+0.1<kln_ktg_money) and (memTable.FieldByName('tw_skid').asfloat>memTable.FieldByName('tw_skid_load').asfloat) then
          begin
            begin
                hasLevel2Error:=true;
                if (USER_EDIT_MONEY_MODE in [1,4,5]) then
                  break;
            end;
          end;
        if ((_kln_ktg_id=3) and  (hasLevel2Error=false))  then    { ���� ����, �������� � ��������!!!!!!!!!!!!}
          if (memTable.FieldByName('tw_okmoney').asfloat+0.1<zak_money) then
          begin
            hasLevel2Error:=true;
           if (USER_EDIT_MONEY_MODE in [1,4,5]) then
              break;
          end;

        if (hasLevel3Error=false)  then
          if memTable.FieldByName('tw_okmoney').asfloat+0.1<zak_money then
          begin
            hasLevel3Error:=true;
            if USER_EDIT_MONEY_MODE=2 then
              break;
          end;


      end;

      memTable.next;
    end;
//  memTable.Locate('tw_id', oldID, []);
//  memTable.EnableControls;

  if hasRasprodError then
  begin
    result:=-4;
    messbox('������ ���������� ���������!. '+chr(10)+'�� '+memTable.fieldByName('TW_ART').asstring+' '+memTable.fieldByName('TW_NAM').asstring+' ������ ��������� ���� ���� ���������!'+chr(13)+'���� ����� ������������ � ��� ������', MessSystem, 48);
    memTable.EnableControls;
    exit;
  end;

  if hasNoSkidError then
  begin
    result:=-5;
    messbox('������ ���������� ���������!. '+chr(10)+'�� '+memTable.fieldByName('TW_ART').asstring+' '+memTable.fieldByName('TW_NAM').asstring+' ������ ��������� ���� ���� ���������!'+chr(13)+'�� ���� ����� ������ �� ����������������', MessSystem, 48);
    memTable.EnableControls;
    exit;
  end;




  case USER_EDIT_MONEY_MODE of
  0: begin
      if haslevel1Error then
      begin
        messbox('������ ���������� ���������!. '+chr(10)+'�� �� ������ ��������� ������ �� ������!', MessSystem, 48);
        result:=-1;
      end;
     end;
  1: begin
       if hasLevel2Error then
       begin
          messbox('������ ���������� ���������!. '+chr(10)+'�� '+memTable.fieldByName('TW_ART').asstring+' '+memTable.fieldByName('TW_NAM').asstring+' ���� ������� ���� ���������� ���������� ��� ������� �������!', MessSystem, 48);
          result:=-2;
       end;
     end;
  4: begin
       if hasLevel2Error then
       begin
          messbox('������ ���������� ���������!. '+chr(10)+'�� '+memTable.fieldByName('TW_ART').asstring+' '+memTable.fieldByName('TW_NAM').asstring+' ���� ������� ���� ���������� ���������� ��� ������� �������!', MessSystem, 48);
          result:=-2;
       end;
     end;
  5: begin
       if hasLevel2Error then
       begin
          messbox('������ ���������� ���������!. '+chr(10)+'�� '+memTable.fieldByName('TW_ART').asstring+' '+memTable.fieldByName('TW_NAM').asstring+' ���� ������� ���� ���������� ���������� ��� ������� �������!', MessSystem, 48);
          result:=-2;
       end;
     end;
  2: begin
     if hasLevel3Error then
     begin
        messbox('������ ���������� ���������!. '+chr(10)+'�� '+memTable.fieldByName('TW_ART').asstring+' '+memTable.fieldByName('TW_NAM').asstring+' ���� ������� ���� ����������!', MessSystem, 48);
        result:=-3;
     end;
     end;
  3: begin
     if hasLevel3Error then
     begin
        messbox('��������������! '+chr(10)+'�� ���� ��� ��������� ������� ���� ������� ���� ����������!', MessSystem, 48);
        result:=3;
     end;
     end;
  end;

  if result=1 then  //�� ���� ������� ��������������, ��������� ��� ��� � ��������
  if ((hasLevel3Error) and (USER_EDIT_MONEY_MODE<>3)) then
  begin
    messbox('������ ���������� ���������!. '+chr(10)+'�� ���� ��� ��������� ������� ���� ������� ���� ����������!', MessSystem, 48);
    result:=-3;
  end;

  memTable.Locate('tw_id', oldID, []);
  memTable.EnableControls;

end;


{�������� ���� ��� �������� ���������� ������!!!! �.�. ��� ��� ������������ ������, �� ���� ������� ������ �������� �����}
function GetTWKtgPrice(tw_id, price_typ: integer): double;
var fq: FastQuery;
begin
  fq:=FastQuery.create('select case when ((select money from tw_price_frm(:tw_id, 0, :SHOP_ID, :frm_id))<=(select money from tw_price_frm(:tw_id, 5, :SHOP_ID, :frm_id)) and (:price_typ<>5)) '+
' then (select money from tw_price_frm(:tw_id, 0, :SHOP_ID, :frm_id)) else money end money, met_money_shop from tw_price_frm(:tw_id, :price_typ, :SHOP_ID, :frm_id)' );
  fq.Parambyname('TW_ID').asinteger:=TW_ID;
  fq.Parambyname('SHOP_ID').asinteger:=SHOPID;
  fq.Parambyname('price_typ').asinteger:=price_typ;

  fq.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;


  fq.open;
  if not fq.eof then
    result:=fq.fieldbyname('money').asfloat;

  fq.close;
  fq.destroy;


end;




constructor FastQuery.Create(SQL: ansistring);
begin
  inherited Create(nil);
  self.BufferChunks := 5;

  self.DataBase := DataModule1.IBDatabase1;
  self.Transaction := TIBTransaction.Create(nil);
  self.Transaction.DefaultDatabase := DataModule1.IBDatabase1;
  self.Transaction.Params.Clear();
  self.Transaction.Params.Add('read');
  self.Transaction.Params.Add('read_committed');
  self.Transaction.Params.Add('rec_version');

  self.SQL.Text := SQL;
end;


function CheckTwSaler(memData: TRxMemoryData; frm_id: integer): boolean;
var
   badCnt: integer;
   badTW: string;
   last_no: integer;
   b: integer;
begin
    result:=true;
    last_no:=memData.recno;
    memData.DisableControls;
    memData.First;
    badCnt:=0;
    badTW:='';
    while not memData.Eof do
    begin
      if memData.fieldbyname('tw_saler_id').asinteger>0 then
      if memData.fieldbyname('tw_saler_id').asinteger<> frm_id   then
      begin
        inc(badCnt);
          if badCnt < 20 then
            badTW := badTW +' ' + memData.fieldbyname('tw_art').asstring+' '+ memData.fieldbyname('TW_NAM').asstring+chr(13);
      end;

      memData.Next;

    end;

    memData.first;
    for b:=2 to last_no do memData.next;

    memData.EnableControls;


    if badCnt>0 then
    begin
      if badCnt > 19 then
        badTw := badTw +'....................'+chr(13)+ '(����� '+inttostr(badCnt)+' �������� �������)';
      application.messagebox(pchar('��������� ������ �� ����� ���� �������/�������������/�������/���������� � ��������� �����'+chr(13)+badTW), '������', MB_OK + MB_ICONSTOP);
      result:=false;
    end;



end;



procedure SHOW_SHOP_FAST_INFO(SHOP_ID, TW_ID: integer);
begin
end;


Procedure DET_REAL(TW_ID:integer;MES:double);
begin
     Wait_Form.StatusBar1.panels[0].text:='������ ���������� � ��������...';
     Wait_Form.Gauge1.Progress:=2;
     Wait_Form.Show;
     delay(1);
     Application.createForm(TDETAL_REAL,DETAL_REAL);
     Wait_Form.Gauge1.Progress:=20;
     delay(1);
     DETAL_REAL.tag:=TW_ID;
     TMP_MES:=MES;
     DETAL_REAL.showModal;
     DETAL_REAL.destroy;
end;

procedure SHOW_ANALIZ_TW(TW_ID:integer);
begin
     if NOT CHECK_DOSTUP('$DICTW.ANALIZ_TW') then Messbox('�� �� ������ ���� �� ������ ������!','����������� �������!',48)
     else begin
       if IS_ANALIZ_TW then messbox('�� ����� ���� ���������� ������� ������!',MessSystem,48) else begin
         Application.createForm(TANALIZ_TW,ANALIZ_TW);
         ANALIZ_TW.tag:=TW_ID;
         ANALIZ_TW.ShowModal;
         ANALIZ_TW.Destroy;
       end
     end;
end;


procedure SHOW_DETAL_TW(TW_ID:integer);
begin
       Application.createform(TDETAL_TW,DETAL_TW);
       DETAL_TW.tag:=TW_ID;
       DETAL_TW.showmodal;
       DETAL_TW.destroy;
end;



procedure CLEAR_CENNIK;
begin
     DataModule1.MemCennik.EmptyTable
end;

procedure ADD_CENNIK(TW_ID:integer;SKL_ID:integer; FRM_NAME: string);
begin
     DataModule1.CennikTransaction.Active:=False;
     ADD_SQL(DataModule1.QueryCennik,' select (select valueint from proptw where proptw.tw_id=tw.tw_id and proptw.proptwtyp_id=6 and proptw.frm_id=0) tw_noskid, tw.tw_art,tw.tw_nam,ed.ed_short, '+
//     ' (select money from price_okrug(   *(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
//     ' (select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
//     ' (select max(kurs.kurs_date) from kurs where '+
//     ' tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz,
     ' (select money from tw_price_frm(:tw_id,  0, :shop_id, 0)) as tw_mroz, '+
     ' tw_mroz_2,'+
     ' tw.tw_razm,tw.tw_made,tw.tw_up,tw.tw_prim,twktg.twktg_prim ,'+
     ' (select kln_data.kln_short from kln_data( (select frm_id from get_tw_saler(tw.tw_id, :shop_id, 1)))) FRM_NAME, '+
     ' tw.tw_length, tw.tw_width, tw.TW_KWM_UCHET, TW_BRAK , tw_prim_2' +
     ' from tw,ed,twktg where tw.twktg_id=twktg.twktg_id and tw.ed_id=ed.ed_id and tw.tw_id= :tw_id');
     DataModule1.QueryCennik.ParamByname('TW_ID').asinteger:=TW_ID;
     DataModule1.QueryCennik.ParamByname('SHOP_ID').asinteger:=SHOPID;
     DataModule1.QueryCennik.Open;
     if not DataModule1.QueryCennik.eof then begin
       DataModule1.MemCennik.insert;
       DataModule1.MemCennik.FieldByname('TW_ID').asinteger:=TW_ID;
       DataModule1.MemCennik.FieldByname('TW_ART').asinteger:=DataModule1.QueryCennik.fieldByname('TW_ART').asinteger;
       DataModule1.MemCennik.FieldByname('TW_NAM').asstring:=DataModule1.QueryCennik.fieldByname('TW_NAM').asstring;
       DataModule1.MemCennik.FieldByname('TWKTG_PRIM').asstring:=DataModule1.QueryCennik.fieldByname('TWKTG_PRIM').asstring;
       DataModule1.MemCennik.FieldByname('ED_SHORT').asstring:=DataModule1.QueryCennik.fieldByname('ED_SHORT').asstring;
       DataModule1.MemCennik.FieldByname('TW_MADE').asstring:=DataModule1.QueryCennik.fieldByname('TW_MADE').asstring;
       DataModule1.MemCennik.FieldByname('TW_RAZM').asstring:=DataModule1.QueryCennik.fieldByname('TW_RAZM').asstring;
       DataModule1.MemCennik.FieldByname('TW_UP').asstring:=DataModule1.QueryCennik.fieldByname('TW_UP').asstring;
       DataModule1.MemCennik.FieldByname('TW_PRIM').asstring:=DataModule1.QueryCennik.fieldByname('TW_PRIM').asstring;
       DataModule1.MemCennik.FieldByname('TW_PRIM_2').asstring:=DataModule1.QueryCennik.fieldByname('TW_PRIM_2').asstring;
       if gl_SHOP_FRM = 2702542 then
       begin
          DataModule1.MemCennik.FieldByname('FRM_NAME').asstring:='��� "������� �������"';
       end
       else
       if gl_SHOP_FRM = 2697090 then
       begin
          DataModule1.MemCennik.FieldByname('FRM_NAME').asstring:='��� "��������"';
       end
       else
          DataModule1.MemCennik.FieldByname('FRM_NAME').asstring:=DataModule1.QueryCennik.fieldByname('FRM_NAME').asstring;

       if (FRM_NAME<> '') then
          DataModule1.MemCennik.FieldByname('FRM_NAME').asstring:=FRM_NAME;



       DataModule1.MemCennik.FieldByname('TW_KWM_UCHET').asinteger:=DataModule1.QueryCennik.fieldByname('TW_KWM_UCHET').asinteger;
       DataModule1.MemCennik.FieldByname('TW_NOSKID').asinteger:=DataModule1.QueryCennik.fieldByname('TW_NOSKID').asinteger;
       DataModule1.MemCennik.FieldByname('TW_LENGTH').asfloat:=DataModule1.QueryCennik.fieldByname('TW_LENGTH').asfloat;
       DataModule1.MemCennik.FieldByname('TW_WIDTH').asfloat:=DataModule1.QueryCennik.fieldByname('TW_WIDTH').asfloat;
       DataModule1.MemCennik.FieldByname('TW_brak').ASSTRING:=DataModule1.QueryCennik.fieldByname('TW_BRAK').ASSTRING;
       DataModule1.MemCennik.FieldByname('TW_MROZ_2').asfloat:=DataModule1.QueryCennik.fieldByname('TW_MROZ_2').asfloat;

       ADD_SQL(DataModule1.QueryCennik,'select doc_num_full from last_doc(:tw_id, :skl_id )');
       DataModule1.QueryCennik.ParamByname('TW_ID').asinteger:=TW_ID;
       DataModule1.QueryCennik.ParamByname('SKL_ID').asinteger:=SKL_ID;
       DataModule1.QueryCennik.Open;
       if DataModule1.QueryCennik.eof then DataModule1.MemCennik.FieldByname('TITLE').asstring:=''
                                      else DataModule1.MemCennik.FieldByname('TITLE').asstring:=DataModule1.QueryCennik.fieldByname('DOC_NUM_FULL').asstring;





       ADD_SQL(DataModule1.QueryCennik,'select * from tw_mroz(:tw_id,:SHOP_ID)');
       DataModule1.QueryCennik.ParamByname('TW_ID').asinteger:=TW_ID;
       DataModule1.QueryCennik.ParamByname('SHOP_ID').asinteger:=SHOPID;
       DataModule1.QueryCennik.open;
       DataModule1.MemCennik.FieldByname('TW_MROZ').asfloat:=DataModule1.QueryCennik.fieldByname('MONEY').asfloat;

       DataModule1.MemCennik.FieldByname('MET_MONEY_SHOP').asinteger:=DataModule1.QueryCennik.fieldByname('MET_MONEY_SHOP').asinteger;
       DataModule1.MemCennik.FieldByname('MET_MONEY_SHOP1').asinteger:=DataModule1.QueryCennik.fieldByname('MET_MONEY_SHOP1').asinteger;

       ADD_SQL(DataModule1.QueryCennik,'select first 1 old_tw_money from remons, remon where remons.remon_id = remon.remon_id and  remon.remon_prow=1 and remons.tw_id = :tw_id and old_tw_money > :money  order by remon.remon_date desc');
       DataModule1.QueryCennik.ParamByname('TW_ID').asinteger:=TW_ID;
       DataModule1.QueryCennik.ParamByname('money').asfloat:=DataModule1.MemCennik.FieldByname('TW_MROZ').asfloat;
       DataModule1.QueryCennik.open;
       DataModule1.MemCennik.FieldByname('old_money').asfloat:=DataModule1.QueryCennik.fieldByname('old_tw_money').asfloat;

       DataModule1.MemCennik.Post;
     end;
     DataModule1.QueryCennik.close;
     DataModule1.CennikTransaction.Active:=False;
end;


PROCEDURE PRINT_KKM;
begin
     Messbox('����������-�������� ������ �� ����������!',MessSystem,48);
end;

procedure CLEAR_KKM;
begin
     CNT_CHECK:=0;
end;
procedure ADD_KKM(TW_ID:integer;TW_KOL,TW_MONEY,RN_SKID:double);
begin
     inc(CNT_CHECK);
     ARR_CHECK[CNT_CHECK].TW_ID:=TW_ID;
     ARR_CHECK[CNT_CHECK].TW_KOL:=TW_KOL;
     ARR_CHECK[CNT_CHECK].TW_MONEY:=TW_MONEY;
     ARR_CHECK[CNT_CHECK].RN_SKID:=RN_SKID;
end;

procedure B_STOP;
begin
  //
end;



FUNCTION PROV_PN(PN_ID:integer;s:ansistring; UseSharedTransaction: boolean):boolean;
{������� �������� �������� ��������� ���������}
begin
     result:=false;
     if not UseSharedTransaction then
     	if Messbox('�������� ��������� ���������'+s+'?',MessSubmit,4+48+256)<>6 then exit;

     begin
        if not UseSharedTransaction then
        begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        end;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from PROV_PN(:PN_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('PN_ID').asinteger:=PN_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;

        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� �������� ���������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ �������� ��������� '+s+'! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��������� '+s+' ��� ���������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!'+s+'',MessSystem,48);
             -4: Messbox('���� ��������� '+s+' ������ ���� �������� �������!',MessSystem,48);
             -10: Messbox('��������� '+s+' ������������� ������� �� ��������� ����������� � ����� ��������� ��� ���������� ���������-���������!',MessSystem,48);

             1: begin {��������� ��������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;

		if not UseSharedTransaction then
        begin

         if Result then
         DataModule1.IBTransaction2.Commit
          else DataModule1.IBTransaction2.Rollback;
          DataModule1.IBTransaction2.Active:=False;
        end;

        if result then GL_TEXT := GL_TEXT + '��������� �� '+s + #13;

     end;
end;

FUNCTION UNPROV_PN(PN_ID:integer;s:ansistring; UseSharedTransaction: boolean):boolean;
{������� �������� ����� � �������� ��������� ���������}
begin
     result:=false;
     if not UseSharedTransaction then
      if Messbox('����� � �������� ��������� ���������'+s+'?',MessSubmit,4+48+256)<>6 then exit;


	 begin
        if not UseSharedTransaction then
        begin
          DataModule1.IBTransaction2.Active:=False;
          DataModule1.IBTransaction2.StartTransaction;
        end;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from UNPROV_PN(:PN_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('PN_ID').asinteger:=PN_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;

        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� ������ � �������� ��������� '+s+'! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ ��� ������ � �������� ��������� '+s+'! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��������� '+s+' ��� ����� � ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������! '+s+'',MessSystem,48);
             -4: Messbox('���� ��������� '+s+' ������ ���� �������� �������!',MessSystem,48);
            -10: Messbox('��������� '+s+' ������������� ������� �� ��������� ��������� ����������� � ����� ����� � �������� ��� ������ � �������� ���������-���������!',MessSystem,48);

             1: begin {��������� ������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;

        if not UseSharedTransaction then
        begin
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
        end;
        if result then GL_TEXT := GL_TEXT + '����� � �������� �� '+s + #13;

     end;
end;

FUNCTION PROV_WOZW_PN(WOZW_ID:integer;s:ansistring):boolean;
{������� �������� �������� ��������� ���������}
begin
     result:=false;
     if Messbox('�������� ��� �������� ������ ���������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from PROV_WOZW_PN(:PN_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('PN_ID').asinteger:=WOZW_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� �������� ����! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ �������� ����! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��� ��� ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ���� ������ ���� �������� �������!',MessSystem,48);
             1: begin {��������� ��������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;

FUNCTION UNPROV_WOZW_PN(WOZW_ID:integer;s:ansistring):boolean;
{������� �������� ����� � �������� ��������� ���������}
begin
     result:=false;
     if Messbox('����� � �������� ��� ��������'+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from UNPROV_WOZW_PN(:PN_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('PN_ID').asinteger:=WOZW_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� ������ � �������� ���� ��������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ ��� ������ � �������� ���� ��������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��� ��� ���� � ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ���� ������ ���� �������� �������!',MessSystem,48);
             1: begin {��������� ������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;


FUNCTION PROV_PER(PER_ID:integer;s:ansistring):boolean;
{������� �������� �������� ��������� �����������}
begin
     result:=false;
     if Messbox('�������� ��������� ����������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from PROV_PER(:PER_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('PER_ID').asinteger:=PER_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� �������� ���������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ �������� ���������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��������� ��� ���������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ��������� ������ ���� �������� �������!',MessSystem,48);
             -5: Messbox('� ��������� ������������ ������, ����������� ���������� ������� ����������� �� ������!',MessSystem,48);
             -8: Messbox('� ��������� ������� ������, ����������� ���������� ������� ����������� � ��������� ����!',MessSystem,48);
             -9: Messbox('��������� �������� ������������ ����� �������� ������ ����'+chr(10)+'�������� ��������� ����������� �� ��������� ������ �� �����������',MessSystem,48);
             -10: Messbox('��������� �������� ���������� ������� �����������. '+chr(10)+'����� ��������� ����� ���� ��������� ������ ���� ���������� ����� �� ������� ����� � ���������!',MessSystem,48);
             -11: Messbox('� ��������� ������� ������, ������� �� ����� ���� ���������� �� ��������� �����'+chr(13)+'(����;  �����;  ������, ���������, �������� )!',MessSystem,48);
             1: begin {��������� ��������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;


FUNCTION PROV_ZONE_PER(ZONE_PER_ID:integer;s:ansistring):boolean;
{������� �������� �������� ��������� �����������}
begin
     result:=false;
     if Messbox('�������� ��������� ����������� ����� ������'+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from PROV_ZONE_PER(:ZONE_PER_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('ZONE_PER_ID').asinteger:=ZONE_PER_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� �������� ���������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ �������� ���������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��������� ��� ���������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ��������� ������ ���� �������� �������!',MessSystem,48);
             -5: Messbox('������������ ������ � ���� ��������!',MessSystem,48);
            1: begin {��������� ��������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;


FUNCTION PROV_NPZ(NPZ_ID:integer;s:ansistring):boolean;
{������� �������� �������� ��������� �����������}
begin
     result:=false;
     if Messbox('�������� ��������� ����������� ����������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from PROV_NPZ(:NPZ_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('NPZ_ID').asinteger:=NPZ_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� �������� ���������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ �������� ���������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��������� ��� ���������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ��������� ������ ���� �������� �������!',MessSystem,48);
             -5: Messbox('� ��������� ������������ ������, ����������� ���������� ������� ����������� � ��������� ����!',MessSystem,48);
             1: begin {��������� ��������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;

FUNCTION UNPROV_PER(PER_ID:integer;s:ansistring):boolean;
{������� �������� ����� � �������� ��������� �����������}
begin
     result:=false;
     if Messbox('����� � �������� ��������� ����������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from UNPROV_PER(:PER_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('PER_ID').asinteger:=PER_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� ������ � �������� ���������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ ��� ������ � �������� ���������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��������� ��� ����� � ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ��������� ������ ���� �������� �������!',MessSystem,48);
             1: begin {��������� ������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;

FUNCTION UNPROV_ZONE_PER(ZONE_PER_ID:integer;s:ansistring):boolean;
{������� �������� ����� � �������� ��������� �����������}
begin
     result:=false;
     if Messbox('����� � �������� ��������� ����������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from UNPROV_ZONE_PER(:ZONE_PER_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('ZONE_PER_ID').asinteger:=ZONE_PER_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� ������ � �������� ���������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ ��� ������ � �������� ���������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��������� ��� ����� � ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ��������� ������ ���� �������� �������!',MessSystem,48);
             1: begin {��������� ������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;


FUNCTION UNPROV_NPZ(NPZ_ID:integer;s:ansistring):boolean;
{������� �������� ����� � �������� ��������� �����������}
begin
     result:=false;
     if Messbox('����� � �������� ��������� ����������� ����������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from UNPROV_NPZ(:NPZ_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('NPZ_ID').asinteger:=NPZ_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� ������ � �������� ���������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ ��� ������ � �������� ���������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��������� ��� ����� � ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ��������� ������ ���� �������� �������!',MessSystem,48);
             1: begin {��������� ������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;


FUNCTION PROV_SPIS(SPIS_ID:integer;s:ansistring):boolean;
{������� �������� �������� ��������� �����������}
begin
     result:=false;
     if Messbox('�������� ��� �������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from PROV_SPIS(:SPIS_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('SPIS_ID').asinteger:=SPIS_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� �������� ���� ��������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ �������� ���� ��������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��� �������� ��� ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ��������� ������ ���� �������� �������!',MessSystem,48);
             -5: Messbox('� ���� �������� ������������ ������, ����������� ���������� ������� ����������� �� ������!',MessSystem,48);
             1: begin {��������� ��������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;

FUNCTION UNPROV_SPIS(SPIS_ID:integer;s:ansistring):boolean;
{������� �������� ����� � �������� ��������� �����������}
begin
     result:=false;
     if Messbox('����� � �������� ��� �������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from UNPROV_SPIS(:SPIS_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('SPIS_ID').asinteger:=SPIS_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� ������ � �������� ���� ��������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ ��� ������ � �������� ���� ��������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��� ��� ���� � ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ��������� ������ ���� �������� �������!',MessSystem,48);
             1: begin {��������� ������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;


FUNCTION PROV_SPIS_WOZW(SPIS_ID:integer;s:ansistring):boolean;
{������� �������� �������� ��������� �����������}
begin
     result:=false;
     if Messbox('�������� ������ ���� �������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from PROV_SPIS_WOZW(:SPIS_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('SPIS_ID').asinteger:=SPIS_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� �������� ������ ���� ��������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ �������� ������ ���� ��������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('������ ���� �������� ��� ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ������ ���� �������� ������ ���� �������� �������!',MessSystem,48);
             -5: Messbox('� ������ ���� �������� ������������ ������, ����������� ���������� ������� ����������� �� ������!',MessSystem,48);
             1: begin {��������� ��������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;

FUNCTION UNPROV_SPIS_WOZW(SPIS_ID:integer;s:ansistring):boolean;
{������� �������� ����� � �������� ��������� �����������}
begin
     result:=false;
     if Messbox('����� � �������� ������ ���� �������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from UNPROV_SPIS_WOZW(:SPIS_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('SPIS_ID').asinteger:=SPIS_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� ������ � �������� ������ ���� ��������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ ��� ������ � �������� ������ ���� ��������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('������ ���� ��� ���� � ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ������ ���� �������� ������ ���� �������� �������!',MessSystem,48);
             1: begin {��������� ������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;



FUNCTION PROV_PSORT(PSORT_ID:integer;s:string):boolean;
{������� �������� �������� ��� �����������}
begin
     result:=false;
     if Messbox('�������� ��� ����������� '+s+' ?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from PROV_PSORT(:PSORT_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('PSORT_ID').asinteger:=PSORT_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� �������� ���� �����������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ �������� ���� �����������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��� ����������� ��� ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ���� ������ ���� �������� �������!',MessSystem,48);
             -5: Messbox('� ���� ����������� ������������ ������, ����������� ���������� ������� ����������� �� ������!',MessSystem,48);
             1: begin {��������� ��������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;

FUNCTION UNPROV_PSORT(PSORT_ID:integer;s:string):boolean;
{������� �������� ����� � �������� ��� �����������}
begin
     result:=false;
     if Messbox('����� � �������� ��� ����������� '+s+' ?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from UNPROV_PSORT(:PSORT_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('PSORT_ID').asinteger:=PSORT_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� ������ � �������� ���� �����������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ ��� ������ � �������� ���� �����������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��� ��� ���� � ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ���� ������ ���� �������� �������!',MessSystem,48);
             1: begin {��������� ������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;


FUNCTION PROV_RN(RN_ID:integer;s:ansistring; UseSharedTransaction: boolean{;  FastProw: boolean}):boolean;
{������� �������� �������� ��������� ���������}
var
   SENDMAIL:boolean;
   SKL_ID:integer;
   SHOP_RN:integer;
   RNTYP_ID:integer;
   RN_DATE:tdatetime;
   NDS,NP:double;
   RN_KKM: boolean;
   CAN:boolean;

   MakeRemind: boolean;


   DOC_REMIND: TDOC_REMIND;


begin
   {���������� ����� ���������}

   MakeRemind:=false;

   if not UseSharedTransaction then
   begin
    DataModule1.IBTransaction2.Active:=False;
    DataModule1.IBTransaction2.StartTransaction;
   end;

   Add_SQL(DataModule1.IbSaveSQL,'select shop_id,skl_id,rntyp_id,nds,np,rn_date, rn_kkm, CARD_ID from rn where rn_id=:rn_id');
   DataModule1.IbSaveSQL.ParamByname('RN_ID').asinteger:=RN_ID;
   DataModule1.IbSaveSQL.Open;
   RN_DATE:=DataModule1.IbSaveSQL.FieldByname('RN_DATE').asdatetime;
   RNTYP_ID:=DataModule1.IbSaveSQL.FieldByname('RNTYP_ID').asinteger;
   NDS:=DataModule1.IbSaveSQL.FieldByname('NDS').asfloat;
   NP:=DataModule1.IbSaveSQL.FieldByname('NP').asfloat;
   SKL_ID:=DataModule1.IbSaveSQL.FieldByname('SKL_ID').asinteger;
   SHOP_RN:=DataModule1.IbSaveSQL.FieldByname('SHOP_ID').asinteger;
   if ((DataModule1.IbSaveSQL.FieldByname('RN_KKM').asstring ='1') and (DataModule1.IbSaveSQL.FieldByname('CARD_ID').asinteger =0)) then RN_KKM:=true   else RN_KKM:=false;

   SENDMAIL:=False;
   result:=false;
   if ((JOU_RN_CHANGE)  or (SHOP_RN = 13 ) or (SHOP_RN = 102 ))then CAN:=true
   else begin
        if SHOPID=SHOP_RN then CAN:=true
        else begin
           Messbox('��������� ������� �� � ���� ��������. �� �� ������ ���� �� �������� ������ ���������!','����������� �������!',48);
           CAN:=False;
        end;
   end;
   if CAN then begin

      if not UseSharedTransaction then
     	if Messbox('�������� ��������� ���������'+s+'?',MessSubmit,4+48+256)<>6 then exit;
     
      begin
        if not UseSharedTransaction then
   		begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        end;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;

        DataModule1.IbSaveSQL.SQL.add('select * from PROV_RN(:RN_ID,:US_ID,:SHOP_ID, :PROV_AS_SALE)');
        DataModule1.IbSaveSQL.Parambyname('RN_ID').asinteger:=RN_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        if UseSharedTransaction then
            DataModule1.IbSaveSQL.Parambyname('PROV_AS_SALE').asinteger:=1
        else
            DataModule1.IbSaveSQL.Parambyname('PROV_AS_SALE').asinteger:=0;

        DataModule1.IbSaveSQL.Open;

        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� �������� ���������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ �������� ��������� '+s+'! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��������� '+s+' ��� ���������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������! '+s,MessSystem,48);
             -4: Messbox('���� ��������� ������ ���� �������� �������!',MessSystem,48);
             -5: Messbox('� ��������� '+s+' ������� ������, ����������� ���������� ������� ����������� �� ������!',MessSystem,48);
             -8: Messbox('� ��������� '+s+' ������� ������, ����������� ���������� ������� ����������� � ��������� �����!',MessSystem,48);
             -9: Messbox('� ��������� '+s+' �� ������� ����, � ������� ������������ �������!',MessSystem,48);
             -10: Messbox('��������� '+s+' ������������� ������� �� ��������� ������� ��� ����������� � ����� ��������� ��� ���������� ���������-���������!',MessSystem,48);
             -12: Messbox('��������� �� ����� ���� ���������. ���������� ������� ��������� �� '+floattostrf(DataModule1.IbSaveSQL.fieldbyname('summ').asfloat, fffixed,19,2) +' ���.','��������������',MB_OK + MB_ICONERROR);
             -13: Messbox('��������� �� ����� ���� ���������. ���������� ������� �� �������� �� '+floattostrf(DataModule1.IbSaveSQL.fieldbyname('summ').asfloat ,fffixed,19,2) +' ���.','��������������',MB_OK + MB_ICONERROR);
             -14:
                begin
                Messbox('��������� ���������. ���������� ������� �� �������� �� '+floattostrf(DataModule1.IbSaveSQL.fieldbyname('summ').asfloat ,fffixed,19,2) +' ���.','��������������',MB_OK + MB_ICONERROR);
                result := true;
                MakeRemind:=true;
                end;
             -15:
                begin
                Messbox('��������� ���������. ���������� ������� ������� �� '+floattostrf(DataModule1.IbSaveSQL.fieldbyname('summ').asfloat ,fffixed,19,2) +' ���.','��������������',MB_OK + MB_ICONERROR);
                result := true;
                MakeRemind:=true;
                end;
             -16: Messbox('��������� �� ����� ���� ���������. ������ ������� ��������. ���������� ������� ������� �� '+floattostrf(DataModule1.IbSaveSQL.fieldbyname('summ').asfloat, fffixed,19,2) +' ���.','��������������',MB_OK + MB_ICONERROR);
             -17: Messbox('��������� '+s+' �� ����� ���� ��������� ������ ����� ��� �� 1 ����',MessSystem,48);
             -21: Messbox('��������� '+s+' �� ����� ���� ��������� �� �������� �������. ����� ������ 50 000 ���.',MessSystem,48);             
             -6: begin // �������������� ��
                   Messbox('� ������������ � �������� �����������, �� '+date_sokr(RN_DATE)+
                   ' ������ �� � ��������� '+s+' ������ ���� '+floattostrf(NP_DATE(RNTYP_ID,RN_DATE),fffixed,19,2)+'%, � �� '+
                   floattostrf(NP,fffixed,19,2)+'%. ��������� �������� ������ ��!',MessError,48);
                 end;

             -7: begin
                   Messbox('� ������������ � �������� �����������, �� '+date_sokr(RN_DATE)+
                   ' ������ ��� � '+s+' ��������� ������ ���� '+floattostrf(NDS_DATE(RN_DATE, RNTYP_ID),fffixed,19,2)+'%, � �� '+
                   floattostrf(NDS,fffixed,19,2)+'%. ��������� �������� ������ ���!',MessError,48);
                 end;
             1: begin {��������� ��������� ��������� ���������}
                if SENDMAIL then begin
                   {������������������ �� ����� �� ��������� ��������}
                end;
                {���� ����� ��������� �� ��������� � ��� �� ���� - �������� ��������}
{                if SKL_ID=Default_Sklad then begin
                   if MEssbox('������� ������ �������� �� ��������� ?',MessSubmit,4+48+256)=6 then begin
                       ADD_SQL(DataModule1.IbSaveSQL,'update rns set otg_kol=tw_kol,otg_date="NOW",otg_us=:otg_us where rn_id=:rn_id');
                       DataModule1.IbSaveSQL.parambyname('OTG_US').asinteger:=USERID;
                       DataModule1.IbSaveSQL.parambyname('RN_ID').asinteger:=RN_ID;
                       DataModule1.IbSaveSQL.ExecSQL;
                   end;
                end; }
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then
        begin
            GL_TEXT := GL_TEXT + '��������� �� '+s + #13;
//	        if  rn_kkm=false then
//    	    	Auto_rn_to_NPZ(RN_ID, false);

            if not UseSharedTransaction then
              	DataModule1.IBTransaction2.Commit
        end

        else
        if not UseSharedTransaction then
   			begin
          	 DataModule1.IBTransaction2.Rollback;
        	 DataModule1.IBTransaction2.Active:=False;
            end



      end;


      if MakeRemind then
      begin

        if CHECK_DOSTUP('REMIND.NEW') then
        begin
          DOC_REMIND := TDOC_REMIND.Create(nil);
          DOC_REMIND.Load(RN_ID);
          DOC_REMIND.ShowModal;
          FreeAndNil(DOC_REMIND);
        end
      end;



   end;
end;




FUNCTION PROV_SALE(SALE_ID:integer;s:ansistring; FastProw: boolean):boolean;
{������� �������� �������� ��������� ���������
���� �� �� ������ ������ � ��� ��������� �������-������� � ��, ��� ��������� ���� ���������
}
var
   ALL_OK, CAN: boolean;
   a: integer;
   arrRN: array [0..10] of integer;
   arrRNNUM: array[0..10] of string;
   cntRN: integer;
   shop_id, skl_id: integer;




begin
   result:=false;
   GL_TEXT:='';
   if Messbox('�������� ������� '+s+'?',MessSubmit,4+48+256)<>6 then exit;

   //��������� ������ ���������, ������� �������� ��������
   cntRN:=0;
   DataModule1.IBTransaction2.Active:=False;
   datamodule1.IbSaveSQL.Close;
   DataModule1.IBTransaction2.StartTransaction;



   datamodule1.IbSaveSQL.sql.Text := 'select sale.shop_id, sale.skl_id, rn0.rn_id, '+
'    RNTYP0.rntyp_short||'' ''|| KLN0.kln_prefix||'' ''||RN0.rn_num||SHOP0.shop_postfix RN_NUM '+
'from sale, sales, rn rn0, SHOP SHOP0, KLN KLN0, RNTYP RNTYP0 '+
'where sale.sale_id=:sale_id '+
'and sales.sale_id=sale.sale_id '+
'and rn0.rn_id = sales.rn_id '+
'and rn0.rntyp_id = rntyp0.rntyp_id '+
'AND SHOP0.SHOP_ID = rn0.shop_id '+
'AND KLN0.KLN_ID = RN0.frm_id';





   datamodule1.IbSaveSQL.Parambyname('SALE_ID').asinteger:=SALE_ID;
   datamodule1.IbSaveSQL.Open;

   shop_id:=datamodule1.IbSaveSQL.fieldbyName('SHOP_ID').asinteger;
   skl_id:=datamodule1.IbSaveSQL.fieldbyName('SKL_ID').asinteger;

   while not datamodule1.IbSaveSQL.EOF do
   begin
     if datamodule1.IbSaveSQL.fieldbyName('RN_ID').asinteger>0 then
     	begin
          arrRN[cntRN] := datamodule1.IbSaveSQL.fieldbyName('RN_ID').asinteger;
          arrRNNUM[cntRN] := datamodule1.IbSaveSQL.fieldbyName('RN_NUM').asstring;
          inc(cntRN);
        end;
        datamodule1.IbSaveSQL.Next;
   end;

   datamodule1.IbSaveSQL.Close;


   //� ����� ����������!!!!!!!!!!!!!!!!
   //�������� ��� �� �� (��� ���-�� ������� ����-���)
   //�������� ��� �� ��
   //�������� ��� �� ��
   //����� ���


  {������� � �����7 �� ������ ������.}

{
  if SHOP_ID=SHOPID then
    if SKL_ID=1322004 then
      if SHOP_ID=14 then
      if IS_KKM then
        FastProw:=true
      else

}
        FastProw:=false;



    ALL_OK:=true;



    if ALL_OK then
    for a := 0 to cntRN-1 do
    begin
      CAN := PROV_RN(arrRN[a], ' '+ arrRNNUM[a], true{, FastProw});
      if not CAN then
      	ALL_OK:=false;

      if ALL_OK=false then break;

    end;


    if all_OK then
     begin

      IBSAVE_CLEAR;
      IBSAVE_ADD('SALE_PROW', true);
      IBSAVE_ADD('US_ID', USERID);
      IBSAVE_DOC('SALE', SALE_ID);
      result := true;
      Datamodule1.IBTransaction2.Commit;
//      Messbox(GL_TEXT, messSystem, 0);
     end
    else
       Datamodule1.IBTransaction2.Rollback;





end;




FUNCTION PROV_WOZW(WOZW_ID:integer;s:ansistring):boolean;
{������� �������� �������� ��� �������� ������ �� ����������}
var
   SENDMAIL:boolean;
   SKL_ID:integer;
   SHOP_RN:integer;
   CAN:boolean;
begin
   {���������� ����� ���������}
   DataModule1.IBTransaction2.Active:=False;
   DataModule1.IBTransaction2.StartTransaction;
   Add_SQL(DataModule1.IbSaveSQL,'select shop_id,skl_id, rntyp_id from rn where rn_id=:rn_id');
   DataModule1.IbSaveSQL.ParamByname('RN_ID').asinteger:=WOZW_ID;
   DataModule1.IbSaveSQL.Open;
   SKL_ID:=DataModule1.IbSaveSQL.FieldByname('SKL_ID').asinteger;
   SHOP_RN:=DataModule1.IbSaveSQL.FieldByname('SHOP_ID').asinteger;
   SENDMAIL:=False;
   result:=false;
   CAN:=True;
   if DataModule1.IbSaveSQL.FieldByname('rntyp_id').asinteger=160010004 then
    Messbox('��������: ������� ������ ������ ����������� ����� ��������� ���������!',MessSubmit,0);


   if CAN then begin
     if Messbox('�������� ��� �������� ������ �� ���������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from PROV_WOZW(:RN_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('RN_ID').asinteger:=WOZW_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� �������� ���� ��������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ ��� �������� ����! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��� �������� ��� ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ���� ������ ���� �������� �������!',MessSystem,48);
             -5: Messbox('� ���� ������� ������, ����������� ���������� ������� ����������� ��� ��������!',MessSystem,48);
             -6: Messbox('��� ��������� �� ��������� ������ � ���������� ������ ����������!',MessSystem,48);
             1: begin {��������� ��������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
   end;
end;


FUNCTION PROV_REMON(REMON_ID:integer;s:ansistring):boolean;
{������� �������� �������� ��������� ���������}
var
   SENDMAIL:boolean;
begin
     result:=false;
     if Messbox('�������� ��� ���������� '+s+'?',MessSubmit,4+48+256)=6 then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from PROV_REMON(:REMON_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('REMON_ID').asinteger:=REMON_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� ���� ����������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ �������� ���� ����������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��� ��� ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ���� ������ ���� �������� �������!',MessSystem,48);
             1:  Result:=TRUE;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
end;

FUNCTION UNPROV_RN(RN_ID:integer;s:ansistring; UseSharedTransaction: boolean):boolean;
{������� �������� ����� � �������� ��������� ���������}
var
   SHOP_RN:integer;
   CAN:boolean;
   s1: ansistring;
begin
   result:=false;
   {���������, �� ��� ��}
   if not UseSharedTransaction then
   begin
   DataModule1.IBTransaction2.Active:=False;
   DataModule1.IBTransaction2.StartTransaction;
   end;

   ADD_SQL(DataModule1.IbSaveSQL,'select * from rn where rn_id=:rn_id');
   DataModule1.IbSaveSQL.ParamByname('RN_ID').asinteger:=RN_ID;
   DataModule1.IbSaveSQL.Open;
   if DataModule1.IbSaveSQL.eof then begin
      Messbox('��������� �� ����������!',MessSystem,48);
   end else begin
       if (DataModule1.IbSaveSQL.fieldByname('RN_KKM').asstring='1')
       and (DataModule1.IbSaveSQL.fieldByname('CARD_ID').asinteger=0)
//       and (striptime(DataModule1.IbSaveSQL.fieldByname('RN_DATE').asdatetime)=striptime(date()))
       then
         begin
         	Messbox('��������� '+s+' �������� ��������� �������������� ����! ������������ �� ������������� ������� ������� � � ��������!',MessSystem,48);
            can:=false;
            exit;
         end
   end;
   SHOP_RN:=DataModule1.IbSaveSQL.FieldByname('SHOP_ID').asinteger;
 if ((JOU_RN_CHANGE)  or (SHOP_RN = 13 )  or (SHOP_RN = 102 ))then CAN:=true
   else begin
        if SHOPID=SHOP_RN then CAN:=true
        else begin
           Messbox('��������� '+s+' ������� �� � ���� ��������. �� �� ������ ���� �� ������ � �������� ������ ���������!','����������� �������!',48);
           CAN:=False;
        end;
   end;
   if CAN then begin
     if not UseSharedTransaction then
      if Messbox('����� � �������� ��������� ���������'+s+'?',MessSubmit,4+48+256)<>6 then exit;

     begin
        if not UseSharedTransaction then
        begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        end;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from UNPROV_RN(:RN_ID,:US_ID,:SHOP_ID, :PROV_AS_SALE)');
        DataModule1.IbSaveSQL.Parambyname('RN_ID').asinteger:=RN_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        if UseSharedTransaction then
            DataModule1.IbSaveSQL.Parambyname('PROV_AS_SALE').asinteger:=1
          else DataModule1.IbSaveSQL.Parambyname('PROV_AS_SALE').asinteger:=0;

        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� ������ � �������� ���������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ ��� ������ � �������� ��������� '+s+'! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��������� '+s+' ��� ����� � ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ��������� '+s+' ������ ���� �������� �������!',MessSystem,48);
            -10: Messbox('��������� '+s+' ������������� ������� �� ��������� ������� ��� ��������� ����������� � ����� ����� � �������� ��� ������ � �������� ���������-���������!',MessSystem,48);
             1: begin {��������� ������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;

        if not UseSharedTransaction then
        begin
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
        end;
        if result then GL_TEXT := GL_TEXT + '����� � �������� �� '+s + #13;

     end;
   end;
end;



FUNCTION UNPROV_SALE(SALE_ID:integer;s:ansistring):boolean;
{������� �������� ����� � ��������  ���������}
 var  ALL_OK, CAN: boolean;
   a: integer;
   arrRN: array [0..10] of integer;
   arrRNNUM: array[0..10] of string;
   cntRN: integer;

begin
   result:=false;
   GL_TEXT:='';
   if Messbox('����� � �������� �������'+s+'?',MessSubmit,4+48+256)<>6 then exit;

   //��������� ������ ���������, ������� �������� ������ � ��������
   cntRN:=0;
   DataModule1.IBTransaction2.Active:=False;
   datamodule1.IbSaveSQL.Close;
   DataModule1.IBTransaction2.StartTransaction;



   datamodule1.IbSaveSQL.sql.Text := 'select rn0.rn_id, '+

'    RNTYP0.rntyp_short||'' ''|| KLN0.kln_prefix||'' ''||RN0.rn_num||SHOP0.shop_postfix RN_NUM '+
'from sale, sales, rn rn0, SHOP SHOP0, KLN KLN0, RNTYP RNTYP0 '+
'where sale.sale_id=:sale_id '+
'and sales.sale_id=sale.sale_id '+
'and rn0.rn_id = sales.rn_id '+
'and rn0.rntyp_id = rntyp0.rntyp_id '+
'AND SHOP0.SHOP_ID = rn0.shop_id '+
'AND KLN0.KLN_ID = RN0.frm_id';





   datamodule1.IbSaveSQL.Parambyname('SALE_ID').asinteger:=SALE_ID;
   datamodule1.IbSaveSQL.Open;
   while not datamodule1.IbSaveSQL.EOF do
   begin
     if datamodule1.IbSaveSQL.fieldbyName('RN_ID').asinteger>0 then
     	begin
          arrRN[cntRN] := datamodule1.IbSaveSQL.fieldbyName('RN_ID').asinteger;
          arrRNNUM[cntRN] := datamodule1.IbSaveSQL.fieldbyName('RN_NUM').asstring;
          inc(cntRN);
        end;

        datamodule1.IbSaveSQL.Next;
   end;

   datamodule1.IbSaveSQL.Close;


   //� ����� ����������!!!!!!!!!!!!!!!!
   //�������� ��� �� �� (��� ���-�� ������� ����-���)
   //�������� ��� �� ��
   //�������� ��� �� ��
   //����� ���


//   PROV_RN(
//   PROV_PN(
//	 PROV_RN
//if ALL_OK then    DataModule1.IBTransaction2.Commit;
//   else
//   if    DataModule1.IBTransaction2.InTransaction
//   	then DataModule1.IBTransaction2.StartTransaction;
//   DataModule1.IBTransaction2.Active:=False;
    ALL_OK:=true;
	for a := 0 to cntRN-1 do
    begin
      CAN := UNPROV_RN(arrRN[a], ' '+arrRNNUM[a], true);
      if not CAN then
      	ALL_OK:=false;


      if ALL_OK=false then break;

    end;
{
    if ALL_OK then
    for a := 0 to cntTDPN-1 do
    begin
      CAN := UNPROV_PN(arrTDPN[a], ' '+arrTDPNNUM[a], true);
      if not CAN then
      	ALL_OK:=false;

      if ALL_OK=false then break;

    end;
}

    if all_OK then
     begin
      IBSAVE_CLEAR;
      IBSAVE_ADD('SALE_PROW', false);
      IBSAVE_ADD('US_ID', USERID);
      IBSAVE_DOC('SALE', SALE_ID);
      result := true;

      Datamodule1.IBTransaction2.Commit;
//      Messbox(GL_TEXT, messSystem, 0);
     end
    else
       Datamodule1.IBTransaction2.Rollback;

       



end;

FUNCTION UNPROV_WOZW(WOZW_ID:integer;s:ansistring):boolean;
{������� �������� ����� � �������� ��������� ���������}
var
   SHOP_RN:integer;
   CAN:boolean;
begin
   result:=false;
   {���������, �� ��� ��}
   DataModule1.IBTransaction2.Active:=False;
   DataModule1.IBTransaction2.StartTransaction;
   ADD_SQL(DataModule1.IbSaveSQL,'select * from rn where rn_id=:rn_id');
   DataModule1.IbSaveSQL.ParamByname('RN_ID').asinteger:=WOZW_ID;
   DataModule1.IbSaveSQL.Open;
   if DataModule1.IbSaveSQL.eof then begin
      Messbox('��������� �� ����������!',MessSystem,48);
   end;
   CAN:=True;
   if CAN then begin
     if (Messbox('����� � �������� ��� �������� '+s+'?',MessSubmit,4+48+256)=6) then begin
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from UNPROV_WOZW(:RN_ID,:US_ID,:SHOP_ID)');
        DataModule1.IbSaveSQL.Parambyname('RN_ID').asinteger:=WOZW_ID;
        DataModule1.IbSaveSQL.Parambyname('US_ID').asinteger:=USERID;
        DataModule1.IbSaveSQL.Parambyname('SHOP_ID').asinteger:=SHOPID;
        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('������ ��� ������ � �������� ���� ��������! ���������� ��� ���!',MessSystem,48)
        else begin
          case DataModule1.IbSaveSQL.fieldbyname('RES').asinteger of
             -1: Messbox('������ ��� ������ � �������� ���� ��������! ���������� ��� ���!',MessSystem,48);
             -2: Messbox('��� ��� ���� � ��������!',MessSystem,48);
             -3: Messbox('� ��� ������������ ���� �� ������ ��������!',MessSystem,48);
             -4: Messbox('���� ���� ������ ���� �������� �������!',MessSystem,48);
             1: begin {��������� ������� ��������� ���������}
                Result:=TRUE;
             end;
          end;
        end;
        DataModule1.IbSaveSQL.Close;
        if Result then DataModule1.IBTransaction2.Commit
                  else DataModule1.IBTransaction2.Rollback;
        DataModule1.IBTransaction2.Active:=False;
     end;
   end;
end;

FUNCTION DEFAULT_KURS(VALUTA_ID,KURS_TYP:INTEGER):double;
begin
     {KURS_TYP: 0 - ���� ���������������
         ������ 0 - ���� ���������
         ������ 0 - ���� ��������� (���� ������)}
     result:=1;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('select max(kurs.kurs_kurs) as kurs_kurs from kurs where kurs.valuta_id=:VALUTA_ID2 and kurs.kurs_typ=:KURS_TYP2 and kurs.kurs_date= '+
      ' (select max(kurs_date) from kurs where kurs.valuta_id=:VALUTA_ID1 and kurs.kurs_typ=:KURS_TYP1)');
     DataModule1.IbGetDefault.Parambyname('VALUTA_ID1').asinteger:=VALUTA_ID;
     DataModule1.IbGetDefault.Parambyname('KURS_TYP1').asinteger:=KURS_TYP;
     DataModule1.IbGetDefault.Parambyname('VALUTA_ID2').asinteger:=VALUTA_ID;
     DataModule1.IbGetDefault.Parambyname('KURS_TYP2').asinteger:=KURS_TYP;
     DataModule1.IbGetDefault.Open;
     if not DataModule1.IbGetDefault.eof then result:=DataModule1.IbGetDefault.fieldbyname('KURS_KURS').asfloat;
     DataModule1.IbGetDefault.close;
     datamodule1.ibtransaction1.active:=false;
end;

function GET_DEFAULT_SHOP(SKL_ID: integer): integer ;
var tr: TIBTransaction;
var q: TIBQuery;
begin
	tr := TIBTransaction.Create(nil);
    q := TIBQuery.Create(nil);
    result:=0;
    try
      tr.AddDatabase(Datamodule1.IBDatabase1);
      q.database:=Datamodule1.IBDatabase1;
      q.Transaction := tr;
      q.SQL.Text:='SELECT CFG_SET1 FROM CFG WHERE CFG_NAME="DEFAULT_SKLAD" AND CFG_VALUE=:SKL_ID';

      q.ParamByName('SKL_ID').asinteger:=SKL_ID;
      q.Open;
      if not q.Eof then
      	result:=q.fieldbyname('CFG_SET1').asinteger;

      q.Close;

      tr.Commit;
      tr.Active:=false;
    except
      if tr.InTransaction then
      	tr.Rollback;
    end;

    freeandnil(tr);
    freeandnil(q);


end;


function GET_DEFAULT_CFG(CFG_NAME: string; CFG_SET1: integer): integer;
begin
     result:=0;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME=:CFG_NAME and CFG_SET1=:CFG_SET1');
     DataModule1.IbGetDefault.ParamByName('CFG_NAME').asstring := CFG_NAME;
     DataModule1.IbGetDefault.ParamByName('CFG_SET1').asinteger := CFG_SET1;

     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then
     //Messbox('�� ������� �������� "�� ���������"!',MessAdm,16)
     
     else result:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     datamodule1.ibtransaction1.active:=false;     
end;

PROCEDURE GET_DEFAULT;
Begin
     {���������, ����� ������� ��� ������� �������� �� ���������. �� ��������� �� �����
     ������ ��� ����� 10 �����}

//     if now - GET_DEFAULT_LAST_TIME < 1.0 / (24*12.0) then exit;

//     GET_DEFAULT_LAST_TIME := now;

    USER_EDIT_MONEY_MODE:= check_user_dostup('USER_EDIT_MONEY_MODE');
    if USER_EDIT_MONEY_MODE<0 then
      USER_EDIT_MONEY_MODE:=0;

    USER_MIN_MONEY_KTG:= check_user_dostup('USER_MIN_MONEY_KTG');
    if USER_MIN_MONEY_KTG<0 then
      USER_MIN_MONEY_KTG:=1;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_ID, CFG_SET2 FROM CFG WHERE CFG_NAME=''POS_SCANER_COM_PORT'' and CFG_BIG=:COMPUTER_NAME and CFG_SET1=:SHOP_ID');
     DataModule1.IbGetDefault.ParamByName('COMPUTER_NAME').asstring:=COMPUTERNAME;
     DataModule1.IbGetDefault.ParamByName('SHOP_ID').asinteger:=SHOPID;
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then gl_COM_PORT:=''
     else
     begin
      if DataModule1.IbGetDefault.FieldByName('CFG_SET2').asstring='0' then
        gl_COM_PORT:=''
      else
        gl_COM_PORT:='COM'+DataModule1.IbGetDefault.FieldByName('CFG_SET2').asstring;
     end;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_ID, CFG_SET2 FROM CFG WHERE CFG_NAME=''POS_SCANER_COM_PORT2'' and CFG_BIG=:COMPUTER_NAME and CFG_SET1=:SHOP_ID');
     DataModule1.IbGetDefault.ParamByName('COMPUTER_NAME').asstring:=COMPUTERNAME;
     DataModule1.IbGetDefault.ParamByName('SHOP_ID').asinteger:=SHOPID;
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then gl_COM_PORT2:=''
     else
     begin
      if DataModule1.IbGetDefault.FieldByName('CFG_SET2').asstring='0' then
        gl_COM_PORT2:=''
      else
        gl_COM_PORT2:='COM'+DataModule1.IbGetDefault.FieldByName('CFG_SET2').asstring;
     end;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_ID, CFG_SET2 FROM CFG WHERE CFG_NAME=''DISPLAY_COM_PORT'' and CFG_BIG=:COMPUTER_NAME and CFG_SET1=:SHOP_ID');
     DataModule1.IbGetDefault.ParamByName('COMPUTER_NAME').asstring:=COMPUTERNAME;
     DataModule1.IbGetDefault.ParamByName('SHOP_ID').asinteger:=SHOPID;
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then gl_COM_PORT3:=''
     else
     begin
      if DataModule1.IbGetDefault.FieldByName('CFG_SET2').asstring='0' then
        gl_COM_PORT3:=''
      else
        gl_COM_PORT3:='COM'+DataModule1.IbGetDefault.FieldByName('CFG_SET2').asstring;
     end;

  

{
    DataModule1.IbGetDefault.close;
    DataModule1.IbGetDefault.SQL.clear;
    DataModule1.IbGetDefault.SQL.add('SELECT KLN_EDIT_MONEY_MODE FROM KLN WHERE KLN_ID=:KLN_ID');
    DataModule1.IbGetDefault.parambyname('KLN_ID').asinteger:=USERID;
    DataModule1.IbGetDefault.Open;
    if DataModule1.IbGetDefault.eof then USER_EDIT_MONEY_MODE:=0
    else USER_EDIT_MONEY_MODE:=DataModule1.IbGetDefault.fieldByname('KLN_EDIT_MONEY_MODE').asinteger;
}

     JOU_REFRESH_CAN:=False;
     GLOBAL_MAIN_KURS:=DEFAULT_KURS(1,0); {���� ���������������}
     DEFAULT_SHOP:=2; {������� �� ���������}
     DataModule1.IbTransaction1.Active:=False;
     {������ ��� ��������}
     OPEN_SQL(DataModule1.IbGetDefault,'select * from main');
     SHOPID:=DataModule1.IbGetDefault.fieldByname('SHOP_ID').asinteger;

     if MANUAL_SHOPID <> 0 then
     	SHOPID:=MANUAL_SHOPID;

     OPEN_SQL(DataModule1.IbGetDefault,'select SHOP_FRM, (SELECT KLN_FRM FROM KLN WHERE KLN.KLN_ID=SHOP.SHOP_FRM) KLN_FRM FROM SHOP WHERE SHOP_ID='+inttostr(SHOPID));

     gl_SHOP_FRM := DataModule1.IbGetDefault.fieldByname('SHOP_FRM').asinteger;
     if DataModule1.IbGetDefault.fieldByname('KLN_FRM').asinteger=3 then
        GL_FRM_WORK_MODE:=gl_SHOP_FRM
     else
        GL_FRM_WORK_MODE:=0;


       

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_RNVID_WOZW"');
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then DEFAULT_RNVID_WOZW:=1
     else DEFAULT_RNVID_WOZW:=DataModule1.IbGetDefault.fieldByname('CFG_VALUE').asinteger;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_PNVID_WOZW"');
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then DEFAULT_PNVID_WOZW:=1
     else DEFAULT_PNVID_WOZW:=DataModule1.IbGetDefault.fieldByname('CFG_VALUE').asinteger;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_FIRMA" and CFG_SET1='+inttostr(SHOPID));
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then Messbox('�� ����������� ����� "�� ���������"!',MessAdm,16)
     else DEFAULT_FIRMA:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="SHOP_RNTYP_KKM" and CFG_SET1='+inttostr(SHOPID));
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� ��� ��������� ��������� ��� ��� ������!',MessAdm,16)
     else DEFAULT_RNTYP_KKM:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;



     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_OWNER"');
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� �������� "�� ���������"!',MessAdm,16)
     else DEFAULT_OWNER:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_KLIENT" and CFG_SET1='+inttostr(SHOPID));
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� ������ "�� ���������"!',MessAdm,16)
     else DEFAULT_KLIENT:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_POST"');
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� ��������� "�� ���������"!',MessAdm,16)
     else DEFAULT_POST:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="JOU_REFRESH_TIME"');
     DataModule1.IbGetDefault.Open;
     JOU_REFRESH_TIME:=30;
     if not DataModule1.IbGetDefault.eof then begin
        try
          JOU_REFRESH_TIME:=strtoint(DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asstring);
        except
        end;
     end;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="IS_EMAIL"');
     DataModule1.IbGetDefault.Open;
     IS_EMAIL_CHECK:=False;
     if not DataModule1.IbGetDefault.eof then begin
         if DataModule1.IbGetDefault.fieldByname('CFG_VALUE').asinteger=1
         then IS_EMAIL_CHECK:=True;
     end;


     PRINT_KKM_TW_NAME:=0;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="KKM_PRINT_NAME"');
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then PRINT_KKM_TW_NAME:=0
     else begin
       PRINT_KKM_TW_NAME:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     end;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_SKLAD" and CFG_SET1='+inttostr(SHOPID));
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� ����� "�� ���������"!',MessAdm,16)
     else DEFAULT_SKLAD:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_SHOP" and CFG_SET1='+inttostr(SHOPID));
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� ������� "�� ���������"!',MessAdm,16)
     else DEFAULT_SHOP:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;



     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_PNVID"');
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� ��� ��������� �������� "�� ���������"!',MessAdm,16)
     else DEFAULT_PNVID:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_ZAY_PNVID"');
     DataModule1.IbGetDefault.Open;
     DEFAULT_ZAY_PNVID:=1;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� ��� ��������� �������� "�� ���������" ��� ����������� ��������� ���������� ���� � ������ �� �������!',MessAdm,16)
     else DEFAULT_ZAY_PNVID:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_RNVID"');
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� ��� ��������� �������� "�� ���������"!',MessAdm,16)
     else DEFAULT_RNVID:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_SPISVID"');
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� ��� ����� �������� "�� ���������"!',MessAdm,16)
     else DEFAULT_SPISVID:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_TWED"');
     DataModule1.IbGetDefault.Open;
     DEFAULT_TW_ED:=0;
     if DataModule1.IbGetDefault.eof then Messbox('�� ����������� ������� ��������� "�� ���������"!',MessAdm,16)
     else DEFAULT_TW_ED:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_TWTWKTG"');
     DataModule1.IbGetDefault.Open;
     DEFAULT_TW_TWKTG:=0;
     if DataModule1.IbGetDefault.eof then Messbox('�� ����������� ��������� ������� "�� ���������"!',MessAdm,16)
     else DEFAULT_TW_TWKTG:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_TWVALUTA"');
     DataModule1.IbGetDefault.Open;
     DEFAULT_TW_VALUTA:=0;
     if DataModule1.IbGetDefault.eof then Messbox('�� ����������� ������ ������� "�� ���������"!',MessAdm,16)
     else DEFAULT_TW_VALUTA:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_SERVER_NAME"');
     DataModule1.IbGetDefault.Open;
     DEFAULT_SERVER_NAME:='';
     if DataModule1.IbGetDefault.eof then Messbox('�� ����������� ��� �������� ����������!',MessAdm,16)
     else DEFAULT_SERVER_NAME:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asstring;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_OWNER_PN"');
     DataModule1.IbGetDefault.Open;
     DEFAULT_OWNER_PN:=0;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� �������� �� ��������� � ��������� ���������!',MessAdm,16)
     else DEFAULT_OWNER_PN:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_OWNER_REMON"');
     DataModule1.IbGetDefault.Open;
     DEFAULT_OWNER_REMON:=0;
     if DataModule1.IbGetDefault.eof then Messbox('�� ���������� �������� �� ��������� � ����� ����������!',MessAdm,16)
     else DEFAULT_OWNER_REMON:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;
     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_USGROUP"');
     DataModule1.IbGetDefault.Open;
     DEFAULT_USGROUP:=0;
     if DataModule1.IbGetDefault.eof then Messbox('�� ����������� ��������� ������� �� ��������� ��� �������� ���������!',MessAdm,16)
     else DEFAULT_USGROUP:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;

     DataModule1.IbGetDefault.close;
     DataModule1.IbGetDefault.SQL.clear;
     DataModule1.IbGetDefault.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_ST_SKID"');
     DataModule1.IbGetDefault.Open;
     if DataModule1.IbGetDefault.eof then begin
       DataModule1.IbGetDefault.close;
       DataModule1.IbGetDefault.SQL.clear;
       DataModule1.IbGetDefault.SQL.add('SELECT RNTYP_ID from RN');
       DataModule1.IbGetDefault.Open;
       DEFAULT_ST_SKID:=DataModule1.IbGetDefault.fieldbyname('RNTYP_ID').asinteger;
     end else DEFAULT_ST_SKID:=DataModule1.IbGetDefault.fieldbyname('CFG_VALUE').asinteger;

     DataModule1.IbGetDefault.Close;
     Datamodule1.IBTransaction1.Active:=false;

 end;

PROCEDURE IBSAVE_CLEAR;
{��������� ������� ������ ����� ��� ������ ��� ��������� � ����}
begin
        IbRecCnt:=0;
end;

PROCEDURE IBSAVE_ADD(NAME:ansistring;VALUE:variant); Overload;
{��������� ��������� � ������ ���������� �������� ��� ����������� ������ ��� ���������
 � �������}
var
        a:integer;
        c:integer;
begin
        NAME:=trim(AnsiupperCase(NAME));
        c:=0;
        for a:=1 to IbRecCnt do if IbArrREC[a].NAME=NAME then c:=a;
        if c=0 then begin
                inc(IbRecCnt);
                IbArrREC[IbRecCnt].NAME:=NAME;
                IbArrREC[IbRecCnt].VALUE:=VALUE;
                IbArrREC[IbRecCnt].Blob:=False;
        end else begin
                IbArrREC[c].VALUE:=VALUE;
                IbArrREC[c].Blob:=False;
        end;
end;

PROCEDURE IBSAVE_ADD(NAME:ansistring;VALUE:variant;OnBlob:integer); Overload;
{��������� ��������� � ������ ���������� �������� ��� ����������� ������ ��� ���������
 � ������� ������������� ��������, ��� ���� - BLOB}
var
        a:integer;
        c:integer;
begin
        NAME:=trim(AnsiupperCase(NAME));
        c:=0;
        for a:=1 to IbRecCnt do if IbArrREC[a].NAME=NAME then c:=a;
        if c=0 then begin
                inc(IbRecCnt);
                IbArrREC[IbRecCnt].NAME:=NAME;
                IbArrREC[IbRecCnt].VALUE:=VALUE;
                if OnBlob=IsbLob then IbArrREC[IbRecCnt].Blob:=True
                                 else IbArrREC[IbRecCnt].Blob:=False;
        end else begin
                IbArrREC[c].VALUE:=VALUE;
                if OnBlob=IsbLob then IbArrREC[IbRecCnt].Blob:=True
                                 else IbArrREC[IbRecCnt].Blob:=False;
        end;
end;

Function GetGEN(TABLENAME:ansistring):integer;
{������� ���������� ������� �������� ���������� ��� ��������� �������
 ���������� 0, ���� ������� ��� ��������� �� ������� � ����� ��������� �� ������}
begin
        TABLENAME:=trim(AnsiupperCase(TABLENAME));
        DataModule1.IbGetGen.Close;
        DataModule1.IbGetGen.SQL.Clear;
        DataModule1.IbGetGen.SQL.add('select GEN_ID(GEN_'+TABLENAME+',0) FROM RDB$GENERATORS '+
                                      'WHERE RDB$GENERATOR_NAME="GEN_'+TABLENAME+'"');
        DataModule1.IbGetGen.Open;
        if DataModule1.IbGetGen.eof then result:=-1
                                    else result:=DataModule1.IbGetGen.fieldByname('GEN_ID').asinteger;
        DataModule1.IbGetGen.Close;
        if result=-1 then Messbox('������� "'+TABLENAME+'" ��� � ��������� � ���� �� ����������!'+CR+
        '���������� �������� ������������ ���������� ������� ���������, � ����� �������, ��� ��������������!',MessCritical,16);
end;


Function GetGENNEXT(TABLENAME:ansistring):integer;
{������� ���������� ���������! �������� ���������� ��� ��������� �������
 ���������� 0, ���� ������� ��� ��������� �� ������� � ����� ��������� �� ������}
begin
        TABLENAME:=trim(AnsiupperCase(TABLENAME));
        DataModule1.IbGetGen.Close;
        DataModule1.IbGetGen.SQL.Clear;
        DataModule1.IbGetGen.SQL.add('select GEN_ID(GEN_'+TABLENAME+',1) FROM RDB$GENERATORS '+
                                      'WHERE RDB$GENERATOR_NAME="GEN_'+TABLENAME+'"');
        DataModule1.IbGetGen.Open;
        if DataModule1.IbGetGen.eof then result:=1
                                    else result:=DataModule1.IbGetGen.fieldByname('GEN_ID').asinteger;
        DataModule1.IbGetGen.Close;
        if result=-1 then Messbox('������� "'+TABLENAME+'" ��� � ��������� � ���� �� ����������!'+CR+
        '���������� �������� ������������ ���������� ������� ���������, � ����� �������, ��� ��������������!',MessCritical,16);
end;

FUNCTION IBSAVE_DOC(TABLENAME:ansistring;TABLEID:integer):integer;
{������� �������� �������� � ���� ��������� (���� TABLEID<0),
 ��� �������� ������������, ���� ��� �����������}
var
        a,b,c:integer;
        sss,s,sw1,sw2:ansistring;
        NEWTABLEID:integer;
begin
        {��� ������ - ��������� SQL ������}
        result:=-1;
        TABLENAME:=trim(AnsiUpperCase(TABLENAME));
        IF TABLEID<0 then begin
                // ������� ���������� ����� ID
                NEWTABLEID:=GetGENNEXT(TABLENAME);
                DataModule1.IbSaveSQL.Close;
                DataModule1.IbSaveSQL.SQL.clear;
                DataModule1.IbSaveSQL.SQL.add('INSERT INTO '+TABLENAME+' ('+TABLENAME+'_ID,');
                sss:='';
                for a:=1 to IbRecCnt do begin
                        sss:=sss+IbArrREC[a].NAME;
                        if a<>IbRecCnt then sss:=sss+',';
                end;
                DataModule1.IbSaveSQL.SQL.add(sss);
                DataModule1.IbSaveSQL.SQL.add(') VALUES (:BEG$ID,');
                sss:='';
                for a:=1 to IbRecCnt do begin
                        sss:=sss+':'+IbArrREC[a].NAME;
                        if a<>IbRecCnt then sss:=sss+',';
                end;
                DataModule1.IbSaveSQL.SQL.add(sss);
                DataModule1.IbSaveSQL.SQL.add(')');
                DataModule1.IbSaveSQL.ParamByName('BEG$ID').asinteger:=NEWTABLEID;
                for a:=1 to IbRecCnt do begin
                   if IbArrREC[a].BLOB then
                        DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asBlob:=IbArrREC[a].VALUE
                   else begin
                        b:=typVAR(IbArrREC[a].Value);
                        case b of
                            1: {Float}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asFloat:=IbArrREC[a].VALUE;
                            2: {INteger}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asInteger:=IbArrREC[a].VALUE;
                            3: {ansistring} // �� ������ ������ ~~
                                begin
                                    sw1:=trim(IbArrREC[a].VALUE);
                                    for c:=1 to length(sw1) do if sw1[c]='~' then sw1[c]:=' ';
                                    DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asstring:=sw1;
                                end;
                            4: {Boolean} if IbArrREC[a].VALUE=TRUE then
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asinteger:=1
                                  else
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asinteger:=0;
                            5: {Date}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asdatetime:=IbArrREC[a].VALUE;
                            ELSE Messbox('��������! ��������� ������������� ��� ������ "'+inttostr(b)+'"'+CR+
                                '���������� �������� ������������ ���������� ������� ���������, � ����� �������, ��� ��������������!','����������� ������!',16);
                        end;
                   end;
                end;
        end else begin
                {���������� ������� ������}
                DataModule1.IbSaveSQL.Close;
                DataModule1.IbSaveSQL.SQL.clear;
                DataModule1.IbSaveSQL.SQL.add('UPDATE '+TABLENAME+' SET ');
                sss:='';
                for a:=1 to IbRecCnt do begin
                        sss:=sss+IbArrREC[a].NAME+'=:'+IbArrREC[a].NAME;
                        if a<>IbRecCnt then sss:=sss+',';
                end;
                DataModule1.IbSaveSQL.SQL.add(sss);
                DataModule1.IbSaveSQL.SQL.add(' WHERE '+TABLENAME+'_ID=:BEG$ID');
                DataModule1.IbSaveSQL.ParamByName('BEG$ID').asinteger:=TABLEID;
                for a:=1 to IbRecCnt do begin
                   if IbArrREC[a].BLOB then
                        DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asBlob:=IbArrREC[a].VALUE
                   else begin
                        b:=typVAR(IbArrREC[a].Value);
                        case b of
                            1: {Float}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asFloat:=IbArrREC[a].VALUE;
                            2: {INteger}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asInteger:=IbArrREC[a].VALUE;
                            3: {ansistring} // �� ������ ������ ~~
                                begin
                                    sw1:=trim(IbArrREC[a].VALUE);
                                    for c:=1 to length(sw1) do if sw1[c]='~' then sw1[c]:=' ';
                                    DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asstring:=sw1;
                                end;
                            4: {Boolean} if IbArrREC[a].VALUE=TRUE then
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asinteger:=1
                                  else
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asinteger:=0;
                            5: {Date}
                                  DataModule1.IbSaveSQL.ParamByName(IbArrREC[a].NAME).asdatetime:=IbArrREC[a].VALUE;
                            ELSE Messbox('��������! ��������� ������������� ��� ������ "'+inttostr(b)+'"'+CR+
                                '���������� �������� ������������ ���������� ������� ���������, � ����� �������, ��� ��������������!','����������� ������!',16);
                        end;
                   end;
                end;
        end;
        Try
                DataModule1.IbSaveSQL.ExecSQL;
                {��� ������ - ���� ������ ������ ������� - ���������� ID ������}
                if TABLEID<0 then result:=NEWTABLEID else result:=TABLEID;
        Except
                on e: Exception do
            begin
                Application.createform(TFORM_DEBUG,FORM_DEBUG);
//                FORM_DEBUG.ExceptionMessage := e.Message;
                FORM_DEBUG.Memo2.Lines.Add(e.Message);
                FORM_DEBUG.Memo1.lines:=DataModule1.IbSaveSQL.SQL;
                {��� ������ - ���� ������ �� ���������, ����������, � ��� ������:
                1) ���������� �������
                2) ����������� ����
                3) ...}
                {������ ���� - ��������� ����������� �������}
                DataModule1.IbSaveSQL.close;
                DataModule1.IbSaveSQL.SQL.clear;
                DataModule1.IbSaveSQL.SQL.add(' select distinct R.RDB$RELATION_NAME '+
                ' from RDB$RELATION_FIELDS R '+
                ' where R.RDB$SYSTEM_FLAG = 0 and R.RDB$RELATION_NAME=:TABLENAME ');
                DataModule1.IbSaveSQL.Parambyname('TABLENAME').asstring:=TABLENAME;
                DataModule1.IbSaveSQL.open;
                if DataModule1.IbSaveSQL.eof then begin
                   {������� � ������ ���}
                   Messbox('������� "'+TABLENAME+'" �� ������� � ���� ������!'+CR+
                   '���������� �������� ������������ ���������� ������� ���������, � ����� �������, ��� ��������������!',MessCritical,16);
                end else begin
                   {������� ���� � ������ - ��������� ��������� ������� ����
                    ����� � �������, � ���� ��� ��� ����, ������ ������
                    � ������� ������ ����}
                   b:=0;
                   s:='';
                   for a:=1 to IbRecCnt do begin
                       DataModule1.IbSaveSQL.close;
                       DataModule1.IbSaveSQL.SQL.clear;
                       DataModule1.IbSaveSQL.SQL.add('select R.RDB$FIELD_NAME, '+
                       ' F.RDB$FIELD_LENGTH, F.RDB$FIELD_TYPE, F.RDB$FIELD_SCALE, F.RDB$FIELD_SUB_TYPE '+
                       ' from RDB$FIELDS F, RDB$RELATION_FIELDS R '+
                       ' where F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE and R.RDB$SYSTEM_FLAG = 0 '+
                       'and RDB$RELATION_NAME=:TABLENAME and  R.RDB$FIELD_NAME=:FIELDNAME');
                       DataModule1.IbSaveSQL.Parambyname('TABLENAME').asstring:=TABLENAME;
                       DataModule1.IbSaveSQL.Parambyname('FIELDNAME').asstring:=IbArrREC[a].NAME;
                       DataModule1.IbSaveSQL.open;
                       if DataModule1.IbSaveSQL.eof then begin
                          inc(b);
                          s:=s+IbArrREC[a].NAME+' ';
                       end;
                       DataModule1.IbSaveSQL.close;
                   end;
                   if b=0 then begin
                      if messbox('������������ ������ ������ ��� ������� ������ � ������� "'+TABLENAME+'"!'+CR+
                      '���������� �������� ������������ ���������� ������� ���������, � ����� �������, ��� ��������������!'+CR+
                      '������� ���������� ����������?',MessCritical,4+16+256)=6 then begin
                         FORM_DEBUG.RxMem.emptyTable;
                         for a:=1 to IbRecCnt do begin
                            FORM_DEBUG.RxMem.Append;
                            FORM_DEBUG.RxMem.FieldByname('NAME').asstring:=IbArrREC[a].NAME;
                            if IbArrREC[a].BLOB then begin
                              FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='BLOB';
                              FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:=IbArrREC[a].VALUE;
                            end else begin
                                b:=typVAR(IbArrREC[a].Value);
                                case b of
                                1: {Float} begin
                                    FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='FLOAT';
                                    FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:=floattostrf(IbArrREC[a].VALUE,fffixed,19,8);
                                    end;
                                2: {INteger} begin
                                      FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='INTEGER';
                                      FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:=inttostr(IbArrREC[a].VALUE);
                                      end;
                                3: {ansistring} // �� ������ ������ ~~
                                    begin
                                        sw1:=trim(IbArrREC[a].VALUE);
                                        for c:=1 to length(sw1) do if sw1[c]='~' then sw1[c]:=' ';
                                        FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='ansistring';
                                        FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:=sw1;
                                    end;
                                4: {Boolean} begin
                                     FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='BOOLEAN';
                                     if IbArrREC[a].VALUE=TRUE then
                                      FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:='1'
                                      else
                                      FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:='0';
                                     end;
                                5: {Date} begin
                                     FORM_DEBUG.RxMem.FieldByname('TYP').asstring:='DATE';
                                     FORM_DEBUG.RxMem.FieldByname('VALUE').asstring:=datetimetostr(IbArrREC[a].VALUE);
                                     end;
                                end;
                            end;
                            FORM_DEBUG.RxMem.post;
                         end;
                         FORM_DEBUG.showmodal;
                      end;
                   end else messbox('� ������� "'+TABLENAME+'" �� ������� ���� "'+trim(s)+'"!'+CR+
                   '���������� �������� ������������ ���������� ������� ���������, � ����� �������, ��� ��������������!',MessCritical,16);
                end;
                FORM_DEBUG.destroy;
                DataModule1.IbSaveSQL.close;
        End;
	END;
end;

FUNCTION IBDELETE_DOC(TABLENAME:ansistring;TABLEID:integer):boolean;
var s:ansistring;
begin
        TABLENAME:=trim(AnsiUpperCase(TABLENAME));
        result:=false;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('DELETE FROM '+TABLENAME+' WHERE '+TABLENAME+'_ID=:BEG$ID');
        DataModule1.IbSaveSQL.ParamByName('BEG$ID').asinteger:=TABLEID;
        Try
                DataModule1.IbSaveSQL.ExecSQL;
                result:=true;
        Except
                Messbox('������ ��������! ������ ������������ � ������ ����������!'+CR+'��� ��������: '+TABLENAME+inttostr(TABLEID),MessSystem,16);
                {�������� ������: ��������� :
                 1.��� �������
                 2.�������� �������� ����
                 3.��� ������ � �������
                 4.�������� �� ��������� - ��������� �������� ������}
        End;
end;


FUNCTION NEW_ST_NUM(FRM_ID: integer;ST_DATE:TDateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin

     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT DOC_NUMBER FROM new_doc_number(''ST'', :DOC_SUBTYPE, :DOC_DATE, :FRM_ID, :SHOP_ID)');
     Datamodule1.QueryNUM.ParamByname('DOC_SUBTYPE').asinteger:=0;
     Datamodule1.QueryNUM.ParamByname('DOC_DATE').asDateTime:=ST_DATE;
     Datamodule1.QueryNUM.ParamByname('FRM_ID').AsInteger:=FRM_ID;
     Datamodule1.QueryNUM.ParamByname('SHOP_ID').AsInteger:=SHOPID;
     Datamodule1.QueryNUM.Open;
     result:=Datamodule1.QueryNUM.FieldByname('DOC_NUMBER').asinteger;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;

     exit;

     {���������� ����}
     DecodeDate(ST_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="ST_NUM_CALC"');
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('CFG_VALUE').asinteger;
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� ����������� ��������}
//             Datamodule1.QueryNUM.SQL.add('select MAX(ST_NUM) AS ST_NUM FROM ST WHERE ST_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.SQL.add('select COUNT(ST_NUM) AS ST_NUM FROM ST WHERE ST_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          2:begin  {��������� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(ST_NUM) AS ST_NUM FROM ST');
          end;
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('ST_NUM').asinteger+1;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;

FUNCTION NEW_ZREMON_NUM(ZREMON_DATE:TDateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin
     {���������� ����}
     DecodeDate(ZREMON_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="ZREMON_NUM_CALC"');
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('CFG_VALUE').asinteger;
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select count(ZREMON_NUM) AS ZREMON_NUM FROM ZREMON WHERE ZREMON_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          2:begin  {��������� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(ZREMON_NUM) AS ZREMON_NUM FROM ZREMON');
          end;
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('ZREMON_NUM').asinteger+1;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;

FUNCTION NEW_TRINDEF_NUM(TRINDEF_DATE:TDateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin
     {���������� ����}
     DecodeDate(TRINDEF_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="TRINDEF_NUM_CALC"');
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('CFG_VALUE').asinteger;
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select count(TRINDEF_NUM) AS TRINDEF_NUM FROM TRINDEF WHERE TRINDEF_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          2:begin  {��������� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(TRINDEF_NUM) AS TRiNDEF_NUM FROM TRINDEF');
          end;
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('TRINDEF_NUM').asinteger+1;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;



FUNCTION NEW_OPLATA_NUM(OPLATA_DATE:TDateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin
     {���������� ����}
     DecodeDate(OPLATA_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="OPLATA_NUM_CALC"');
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('CFG_VALUE').asinteger;
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select count(OPLATA_NUM) AS OPLATA_NUM FROM OPLATA WHERE OPLATA_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          2:begin  {��������� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(OPLATA_NUM) AS OPLATA_NUM FROM OPLATA');
          end;
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('OPLATA_NUM').asinteger+1;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;



FUNCTION NEW_REMON_NUM(FRM_ID: integer; REMON_DATE:TDateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin
{
  ���������� ��������� ��� ������ ����
}

     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT DOC_NUMBER FROM new_doc_number(''REMON'', :DOC_SUBTYPE, :DOC_DATE, :FRM_ID, :SHOP_ID)');
     Datamodule1.QueryNUM.ParamByname('DOC_SUBTYPE').asinteger:=0;
     Datamodule1.QueryNUM.ParamByname('DOC_DATE').asDateTime:=REMON_DATE;
     Datamodule1.QueryNUM.ParamByname('FRM_ID').AsInteger:=FRM_ID;
     Datamodule1.QueryNUM.ParamByname('SHOP_ID').AsInteger:=SHOPID;
     Datamodule1.QueryNUM.Open;
     result:=Datamodule1.QueryNUM.FieldByname('DOC_NUMBER').asinteger;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;

     exit;


     {���������� ����}
     DecodeDate(REMON_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="REMON_NUM_CALC"');
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('CFG_VALUE').asinteger;
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select count(REMON_NUM) AS REMON_NUM FROM REMON WHERE REMON_DATE BETWEEN :DT1 AND :DT2');
             //Datamodule1.QueryNUM.SQL.add('select MAX(REMON_NUM) AS REMON_NUM FROM REMON WHERE REMON_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          2:begin  {��������� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(REMON_NUM) AS REMON_NUM FROM REMON');
          end;
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('REMON_NUM').asinteger+1;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;

FUNCTION NEW_PSORT_NUM(FRM_ID: integer;PSORT_DATE:TDateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin
{
  ���������� ��������� ��� ������ ����
}

     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT DOC_NUMBER FROM new_doc_number(''PSORT'', :DOC_SUBTYPE, :DOC_DATE, :FRM_ID, :SHOP_ID)');
     Datamodule1.QueryNUM.ParamByname('DOC_SUBTYPE').asinteger:=0;
     Datamodule1.QueryNUM.ParamByname('DOC_DATE').asDateTime:=PSORT_DATE;
     Datamodule1.QueryNUM.ParamByname('FRM_ID').AsInteger:=FRM_ID;
     Datamodule1.QueryNUM.ParamByname('SHOP_ID').AsInteger:=SHOPID;
     Datamodule1.QueryNUM.Open;
     result:=Datamodule1.QueryNUM.FieldByname('DOC_NUMBER').asinteger;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;

     exit;


     {���������� ����}
     DecodeDate(PSORT_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="PSORT_NUM_CALC"');
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('CFG_VALUE').asinteger;
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� ����������� ��������}
//             Datamodule1.QueryNUM.SQL.add('select MAX(PSORT_NUM) AS PSORT_NUM FROM PSORT WHERE PSORT_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.SQL.add('select count(PSORT_NUM) AS PSORT_NUM FROM PSORT WHERE PSORT_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          2:begin  {��������� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(PSORT_NUM) AS PSORT_NUM FROM PSORT');
          end;
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('PSORT_NUM').asinteger+1;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;



FUNCTION NEW_STFAKT_NUM(FRM_ID: integer;STFAKT_DATE:TDateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin
{
  ���������� ��������� ��� ������ ����
}

     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT DOC_NUMBER FROM new_doc_number(''STFAKT'', :DOC_SUBTYPE, :DOC_DATE, :FRM_ID, :SHOP_ID)');
     Datamodule1.QueryNUM.ParamByname('DOC_SUBTYPE').asinteger:=0;
     Datamodule1.QueryNUM.ParamByname('DOC_DATE').asDateTime:=STFAKT_DATE;
     Datamodule1.QueryNUM.ParamByname('FRM_ID').AsInteger:=FRM_ID;
     Datamodule1.QueryNUM.ParamByname('SHOP_ID').AsInteger:=SHOPID;
     Datamodule1.QueryNUM.Open;
     result:=Datamodule1.QueryNUM.FieldByname('DOC_NUMBER').asinteger;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;

     exit;

     {���������� ����}
     DecodeDate(STFAKT_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="STFAKT_NUM_CALC"');
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('CFG_VALUE').asinteger;
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select COUNT(STFAKT_NUM) AS STFAKT_NUM FROM STFAKT WHERE STFAKT_DATE BETWEEN :DT1 AND :DT2');
//             Datamodule1.QueryNUM.SQL.add('select MAX(STFAKT_NUM) AS STFAKT_NUM FROM STFAKT WHERE STFAKT_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          2:begin  {��������� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(STFAKT_NUM) AS STFKAT_NUM FROM STFAKT');
          end;
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('STFAKT_NUM').asinteger+1;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;



FUNCTION NEW_SPIS_NUM(FRM_ID: integer;SPIS_DATE:TDateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin

{
  ���������� ��������� ��� ������ ����
}

     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT DOC_NUMBER FROM new_doc_number(''SPIS'', :DOC_SUBTYPE, :DOC_DATE, :FRM_ID, :SHOP_ID)');
     Datamodule1.QueryNUM.ParamByname('DOC_SUBTYPE').asinteger:=0;
     Datamodule1.QueryNUM.ParamByname('DOC_DATE').asDateTime:=SPIS_DATE;
     Datamodule1.QueryNUM.ParamByname('FRM_ID').AsInteger:=FRM_ID;
     Datamodule1.QueryNUM.ParamByname('SHOP_ID').AsInteger:=SHOPID;
     Datamodule1.QueryNUM.Open;
     result:=Datamodule1.QueryNUM.FieldByname('DOC_NUMBER').asinteger;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;

     exit;

     {���������� ����}
     DecodeDate(SPIS_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ����� ��������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="SPIS_NUM_CALC"');
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('CFG_VALUE').asinteger;
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select COUNT(SPIS_NUM) AS SPIS_NUM FROM SPIS WHERE SPIS_DATE BETWEEN :DT1 AND :DT2');
             //Datamodule1.QueryNUM.SQL.add('select MAX(SPIS_NUM) AS SPIS_NUM FROM SPIS WHERE SPIS_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          2:begin  {��������� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(SPIS_NUM) AS SPIS_NUM FROM SPIS');
          end;
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('SPIS_NUM').asinteger+1;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;

FUNCTION NEW_PER_NUM(FRM_ID: integer;PER_DATE:TDateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin
{
  ���������� ��������� ��� ������ ����
}

     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT DOC_NUMBER FROM new_doc_number(''PER'', :DOC_SUBTYPE, :DOC_DATE, :FRM_ID, :SHOP_ID)');
     Datamodule1.QueryNUM.ParamByname('DOC_SUBTYPE').asinteger:=0;
     Datamodule1.QueryNUM.ParamByname('DOC_DATE').asDateTime:=PER_DATE;
     Datamodule1.QueryNUM.ParamByname('FRM_ID').AsInteger:=FRM_ID;
     Datamodule1.QueryNUM.ParamByname('SHOP_ID').AsInteger:=SHOPID;
     Datamodule1.QueryNUM.Open;
     result:=Datamodule1.QueryNUM.FieldByname('DOC_NUMBER').asinteger;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;

     exit;

     {���������� ����}
     DecodeDate(PER_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="PER_NUM_CALC"');
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('CFG_VALUE').asinteger;
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select count(PER_NUM) AS PER_NUM FROM PER WHERE PER_DATE BETWEEN :DT1 AND :DT2');
//             Datamodule1.QueryNUM.SQL.add('select MAX(PER_NUM) AS PER_NUM FROM PER WHERE PER_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          2:begin  {��������� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(PER_NUM) AS PER_NUM FROM PER');
          end;
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('PER_NUM').asinteger+1;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;



FUNCTION NEW_ZONE_PER_NUM(PER_DATE:TDateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin
{
  ���������� ��������� ��� ������ ����
}

     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT DOC_NUMBER FROM new_doc_number(''ZONE_PER'', :DOC_SUBTYPE, :DOC_DATE, :FRM_ID, :SHOP_ID)');
     Datamodule1.QueryNUM.ParamByname('DOC_SUBTYPE').asinteger:=0;
     Datamodule1.QueryNUM.ParamByname('DOC_DATE').asDateTime:=PER_DATE;
     Datamodule1.QueryNUM.ParamByname('FRM_ID').AsInteger:=0;
     Datamodule1.QueryNUM.ParamByname('SHOP_ID').AsInteger:=SHOPID;
     Datamodule1.QueryNUM.Open;
     result:=Datamodule1.QueryNUM.FieldByname('DOC_NUMBER').asinteger;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;

     exit;

end;




FUNCTION NEW_PN_NUM(PNTYP_ID:INTEGER;FRM_ID: integer;PN_DATE:TdateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
   s:ansistring;
begin
{
  ���������� ��������� ��� ������ ����
}

     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT DOC_NUMBER FROM new_doc_number(''PN'', :DOC_SUBTYPE, :DOC_DATE, :FRM_ID, :SHOP_ID)');
     Datamodule1.QueryNUM.ParamByname('DOC_SUBTYPE').asinteger:=PNTYP_ID;
     Datamodule1.QueryNUM.ParamByname('DOC_DATE').asDateTime:=PN_DATE;
     Datamodule1.QueryNUM.ParamByname('FRM_ID').AsInteger:=FRM_ID;
     Datamodule1.QueryNUM.ParamByname('SHOP_ID').AsInteger:=SHOPID;
     Datamodule1.QueryNUM.Open;
     result:=Datamodule1.QueryNUM.FieldByname('DOC_NUMBER').asinteger;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;

     exit;

     {���������� ����}
     DecodeDate(PN_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ��������� ���������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT NUM_TYP FROM PNTYP WHERE PNTYP_ID=:PNTYP_ID');
     Datamodule1.QueryNUM.ParamByname('PNTYP_ID').asinteger:=PNTYP_ID;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('NUM_TYP').asinteger;
     end;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� � ����� ����, ����������� ��������}
//             Datamodule1.QueryNUM.SQL.add('select MAX(PN$_NUM) AS PN_NUM FROM PN$ WHERE PNTYP_ID=:PNTYP_ID '+
//             ' and PN$_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.SQL.add('select count(PN$_NUM) AS PN_NUM FROM PN$ WHERE PNTYP_ID=:PNTYP_ID '+
             ' and PN$_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
             Datamodule1.QueryNUM.ParamByname('PNTYP_ID').asinteger:=PNTYP_ID;
          end;
          2:begin  {��������� � ����� ���� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(PN$_NUM) AS PN_NUM FROM PN$ WHERE PNTYP_ID=:PNTYP_ID');
             Datamodule1.QueryNUM.ParamByname('PNTYP_ID').asinteger:=PNTYP_ID;
          end;
          3:begin  {��������� ������ �� ���� �����, ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select count(PN$_NUM) AS PN_NUM FROM PN$ WHERE PN$_DATE BETWEEN :DT1 AND :DT2');
//             Datamodule1.QueryNUM.SQL.add('select MAX(PN$_NUM) AS PN_NUM FROM PN$ WHERE PN$_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          4: begin {� ������ ����������� ����}
             DecodeDate(Date(),Y,M,D);
             Datamodule1.QueryNUM.SQL.add('select MAX(PN$_NUM) AS PN_NUM FROM PN$ WHERE PNTYP_ID=:PNTYP_ID '+
//             ' and bg_left(bg_right("0000000000"||PN$_NUM,10),6)=:PN_NUM');
             ' and pn$_num between  :pn_NUM1 and :PN_NUM2');
             Datamodule1.QueryNUM.ParamByname('PN_NUM1').asstring:=b_utils.right('0000'+inttostr(y),2)+
                b_utils.right('0000'+inttostr(m),2)+ b_utils.right('0000'+inttostr(d),2)+'0000';
             Datamodule1.QueryNUM.ParamByname('PN_NUM2').asstring:=b_utils.right('0000'+inttostr(y),2)+
                b_utils.right('0000'+inttostr(m),2)+ b_utils.right('0000'+inttostr(d+1),2)+'0000';
             Datamodule1.QueryNUM.ParamByname('PNTYP_ID').asinteger:=PNTYP_ID;
          end
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('PN_NUM').asinteger+1;
     if NUM_TYP=4 then begin
          DecodeDate(date(),Y,M,D);
          s:=b_utils.right('0000'+inttostr(y),2)+
             b_utils.right('0000'+inttostr(m),2)+
             b_utils.right('0000'+inttostr(d),2)+
             b_utils.right('0000'+inttostr(result),4);
          result:=strtoint(s);
     end;

     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;

FUNCTION NEW_PO_NUM(FRM_ID: integer; PO_DATE:TdateTime):INTEGER; // ����� ����� ����������
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
   s:ansistring;
begin
{
  ���������� ��������� ��� ������ ����
}

     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT DOC_NUMBER FROM new_doc_number(''PO'', :DOC_SUBTYPE, :DOC_DATE, :FRM_ID, :SHOP_ID)');
     Datamodule1.QueryNUM.ParamByname('DOC_SUBTYPE').asinteger:=0;
     Datamodule1.QueryNUM.ParamByname('DOC_DATE').asDateTime:=PO_DATE;
     Datamodule1.QueryNUM.ParamByname('FRM_ID').AsInteger:=FRM_ID;
     Datamodule1.QueryNUM.ParamByname('SHOP_ID').AsInteger:=SHOPID;
     Datamodule1.QueryNUM.Open;
     result:=Datamodule1.QueryNUM.FieldByname('DOC_NUMBER').asinteger;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;

     exit;

     // 1 - ����� ������ ���
     // 2 - ��������
     // 3 - � ������ ����
     {���������� ����}
     DecodeDate(PO_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ���������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="PO_NUM_CALC"');
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('CFG_VALUE').asinteger;
     end;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� � ����� ����, ����������� ��������}
//             Datamodule1.QueryNUM.SQL.add('select MAX(PO_NUM) AS PO_NUM FROM PO WHERE PO_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.SQL.add('select count(PO_NUM) AS PO_NUM FROM PO WHERE PO_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          2:begin  {�������� ���������}
             Datamodule1.QueryNUM.SQL.add('select MAX(PO_NUM) AS PO_NUM FROM PO');
          end;
          3: begin {� ������ ����������� ����}
             DecodeDate(Date(),Y,M,D);
             Datamodule1.QueryNUM.SQL.add('select MAX(PO_NUM) AS PO_NUM FROM PO WHERE bg_left(bg_right("0000000000"||PO_NUM,10),6)=:PO_NUM');
             Datamodule1.QueryNUM.ParamByname('PO_NUM').asstring:=b_utils.right('0000'+inttostr(y),2)+
             b_utils.right('0000'+inttostr(m),2)+
             b_utils.right('0000'+inttostr(d),2);
          end;
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('PO_NUM').asinteger+1;
     if NUM_TYP=3 then begin
          DecodeDate(date(),Y,M,D);
          s:=b_utils.right('0000'+inttostr(y),2)+
             b_utils.right('0000'+inttostr(m),2)+
             b_utils.right('0000'+inttostr(d),2)+
             b_utils.right('0000'+inttostr(result),4);
          result:=strtoint(s);
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;





FUNCTION NEW_GARANT_NUM(GARANT_DATE:TDateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin
     {���������� ����}
     DecodeDate(GARANT_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT CFG_VALUE FROM CFG WHERE CFG_NAME="GARANT_NUM_CALC"');
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('CFG_VALUE').asinteger;
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select count(GARANT_NUM_NUM) AS GARANT_NUM FROM GARANT WHERE GARANT_DT BETWEEN :DT1 AND :DT2');
             //Datamodule1.QueryNUM.SQL.add('select MAX(GARANT_NUM_NUM) AS GARANT_NUM FROM GARANT WHERE GARANT_DT BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          2:begin  {��������� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(GARANT_NUM) AS GARANT_NUM FROM GARANT');
          end;
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('GARANT_NUM').asinteger+1;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;


FUNCTION NEW_RN_NUM(RNTYP_ID:INTEGER; FRM_ID: INTEGER; RN_DATE:TdateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
   s:ansistring;
begin
{
  ���������� ��������� ��� ������ ����
}

     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT DOC_NUMBER FROM new_doc_number(''RN'', :DOC_SUBTYPE, :DOC_DATE, :FRM_ID, :SHOP_ID)');
     Datamodule1.QueryNUM.ParamByname('DOC_SUBTYPE').asinteger:=RNTYP_ID;
     Datamodule1.QueryNUM.ParamByname('DOC_DATE').asDateTime:=RN_DATE;
     Datamodule1.QueryNUM.ParamByname('FRM_ID').AsInteger:=FRM_ID;
     Datamodule1.QueryNUM.ParamByname('SHOP_ID').AsInteger:=SHOPID;
     Datamodule1.QueryNUM.Open;
     result:=Datamodule1.QueryNUM.FieldByname('DOC_NUMBER').asinteger;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;

     exit;

     {���������� ����}
     DecodeDate(RN_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ��������� ���������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT NUM_TYP FROM RNTYP WHERE RNTYP_ID=:RNTYP_ID');
     Datamodule1.QueryNUM.ParamByname('RNTYP_ID').asinteger:=RNTYP_ID;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('NUM_TYP').asinteger;
     end;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� � ����� ����, ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select count(RN_NUM) AS RN_NUM FROM RN WHERE RNTYP_ID=:RNTYP_ID '+
             ' and RN_DATE BETWEEN :DT1 AND :DT2');
//             Datamodule1.QueryNUM.SQL.add('select MAX(RN_NUM) AS RN_NUM FROM RN WHERE RNTYP_ID=:RNTYP_ID '+
//             ' and RN_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
             Datamodule1.QueryNUM.ParamByname('RNTYP_ID').asinteger:=RNTYP_ID;
          end;
          2:begin  {��������� � ����� ���� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(RN_NUM) AS RN_NUM FROM RN WHERE RNTYP_ID=:RNTYP_ID');
             Datamodule1.QueryNUM.ParamByname('RNTYP_ID').asinteger:=RNTYP_ID;
          end;
          3:begin  {��������� ������ �� ���� �����, ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select count(RN_NUM) AS RN_NUM FROM RN WHERE RN_DATE BETWEEN :DT1 AND :DT2');
//Datamodule1.QueryNUM.SQL.add('select MAX(RN_NUM) AS RN_NUM FROM RN WHERE RN_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          4: begin {� ������ ����������� ����}
             DecodeDate(Date(),Y,M,D);
             Datamodule1.QueryNUM.SQL.add('select max(RN_NUM) AS RN_NUM FROM RN WHERE RNTYP_ID=:RNTYP_ID '+
             ' and rn_num between  :RN_NUM1 and :RN_NUM2');
             Datamodule1.QueryNUM.ParamByname('RN_NUM1').asstring:=b_utils.right('0000'+inttostr(y),2)+
                b_utils.right('0000'+inttostr(m),2)+ b_utils.right('0000'+inttostr(d),2)+'0000';
             Datamodule1.QueryNUM.ParamByname('RN_NUM2').asstring:=b_utils.right('0000'+inttostr(y),2)+
                b_utils.right('0000'+inttostr(m),2)+ b_utils.right('0000'+inttostr(d+1),2)+'0000';
             Datamodule1.QueryNUM.ParamByname('RNTYP_ID').asinteger:=RNTYP_ID;

          end
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('RN_NUM').asinteger+1;
     if NUM_TYP=4 then begin
          DecodeDate(date(),Y,M,D);
          s:=b_utils.right('0000'+inttostr(y),2)+
             b_utils.right('0000'+inttostr(m),2)+
             b_utils.right('0000'+inttostr(d),2)+
             b_utils.right('0000'+inttostr(result),4);
          result:=strtoint(s);
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;


FUNCTION NEW_SALE_NUM(RNTYP_ID:INTEGER;SALE_DATE:TdateTime):INTEGER;
var
   NUM_TYP:integer;
   DT1,DT2:TdateTime;
   Y,M,D:Word;
   s:ansistring;
begin
     {���������� ����}
     DecodeDate(SALE_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ��������� ���������}
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT NUM_TYP FROM RNTYP WHERE RNTYP_ID=:RNTYP_ID');
     Datamodule1.QueryNUM.ParamByname('RNTYP_ID').asinteger:=RNTYP_ID;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then begin
        NUM_TYP:=1;
     end else begin
        NUM_TYP:=Datamodule1.QueryNUM.FieldByname('NUM_TYP').asinteger;
     end;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     case NUM_TYP OF
          1: begin {��������� � ����� ����, ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select MAX(SALE_NUM) AS SALE_NUM FROM SALE  '+
             '  SALE_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;

          end;
          2:begin  {��������� � ����� ���� �������� �� �����������}
             Datamodule1.QueryNUM.SQL.add('select MAX(SALE_NUM) AS SALE_NUM FROM SALE ');

          end;
          3:begin  {��������� ������ �� ���� �����, ����������� ��������}
             Datamodule1.QueryNUM.SQL.add('select MAX(SALE_NUM) AS SALE_NUM FROM SALE WHERE SALE_DATE BETWEEN :DT1 AND :DT2');
             Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
             Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
          end;
          4: begin {� ������ ����������� ����}
             DecodeDate(Date(),Y,M,D);
             Datamodule1.QueryNUM.SQL.add('select MAX(SALE_NUM) AS SALE_NUM FROM SALE WHERE  '+
//             '  BG_left(BG_right("0000000000"  ||SALE_NUM,10),6)=:SALE_NUM');
              ' sale_num between  :RN_NUM1 and :RN_NUM2');
             Datamodule1.QueryNUM.ParamByname('RN_NUM1').asstring:=b_utils.right('0000'+inttostr(y),2)+
                b_utils.right('0000'+inttostr(m),2)+ b_utils.right('0000'+inttostr(d),2)+'0000';
             Datamodule1.QueryNUM.ParamByname('RN_NUM2').asstring:=b_utils.right('0000'+inttostr(y),2)+
                b_utils.right('0000'+inttostr(m),2)+ b_utils.right('0000'+inttostr(d+1),2)+'0000';

//             Datamodule1.QueryNUM.ParamByname('SALE_NUM').asstring:=b_utils.right('0000'+inttostr(y),2)+
//             b_utils.right('0000'+inttostr(m),2)+
//             b_utils.right('0000'+inttostr(d),2);

          end
     end;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('SALE_NUM').asinteger+1;
     if NUM_TYP=4 then begin
          DecodeDate(date(),Y,M,D);
          s:=b_utils.right('0000'+inttostr(y),2)+
             b_utils.right('0000'+inttostr(m),2)+
             b_utils.right('0000'+inttostr(d),2)+
             b_utils.right('0000'+inttostr(result),4);
          result:=strtoint(s);
     end;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
end;

FUNCTION NEW_MAIL_NUM(FRM_ID: integer; MAIL_DATE:TdateTime):INTEGER;
var
   DT1,DT2:TdateTime;
   Y,M,D:Word;
begin
{
  ���������� ��������� ��� ������ ����
}

     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
     Datamodule1.QueryNUM.SQL.add('SELECT DOC_NUMBER FROM new_doc_number(''MAIL'', :DOC_SUBTYPE, :DOC_DATE, :FRM_ID, :SHOP_ID)');
     Datamodule1.QueryNUM.ParamByname('DOC_SUBTYPE').asinteger:=0;
     Datamodule1.QueryNUM.ParamByname('DOC_DATE').asDateTime:=MAIL_DATE;
     Datamodule1.QueryNUM.ParamByname('FRM_ID').AsInteger:=FRM_ID;
     Datamodule1.QueryNUM.ParamByname('SHOP_ID').AsInteger:=SHOPID;
     Datamodule1.QueryNUM.Open;
     result:=Datamodule1.QueryNUM.FieldByname('DOC_NUMBER').asinteger;
     Datamodule1.NumTransaction.Active:=False;
     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;

     exit;



     {���������� ����}
     result:=GetGenNext('MAIL_NUM');
{
     DecodeDate(MAIL_DATE,Y,M,D);
     DT1:=EncodeDate(Y,1,1);
     DT2:=EncodeDate(Y+1,1,1);
     Datamodule1.NumTransaction.Active:=False;
     {���������� ������� ��������� ��������� ���������}
{     Datamodule1.QueryNUM.Close;
     Datamodule1.QueryNUM.SQL.clear;
//     Datamodule1.QueryNUM.SQL.add('select MAX(MAIL_NUM) AS MAIL_NUM FROM MAIL WHERE CREATE_DATE BETWEEN :DT1 AND :DT2');
     Datamodule1.QueryNUM.SQL.add('select count(MAIL_NUM) AS MAIL_NUM FROM MAIL WHERE CREATE_DATE BETWEEN :DT1 AND :DT2');
     Datamodule1.QueryNUM.ParamByname('DT1').asdatetime:=DT1;
     Datamodule1.QueryNUM.ParamByname('DT2').asdatetime:=DT2;
     Datamodule1.QueryNUM.Open;
     if Datamodule1.QueryNUM.eof then result:=1
     else result:=Datamodule1.QueryNUM.fieldByname('MAIL_NUM').asinteger+1;
     Datamodule1.QueryNUM.Close;
     Datamodule1.NumTransaction.Active:=False;
}     
end;


PROCEDURE PRINT_REMON(REMON_ID:integer;SKL_ID:integer);
var
  CAN:boolean;
begin
   if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select remon_prow as PROW from remon where remon_id=:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=REMON_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin
     Application.createForm(TSelect_Print_Remon,Select_Print_Remon);
     Select_Print_Remon.tag:=SKL_ID;
     Select_Print_Remon.showModal;
     if Select_Print_Remon.tag>0 then begin
       if Select_Print_Remon.SKL.tag=1 then begin
        Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
        Wait_Form.Gauge1.Progress:=10;
        delay(1);
        Wait_Form.Show;
        Datamodule2.PrintTransaction.Active:=False;
        Datamodule2.PrintREMON.Close;
        Datamodule2.PrintREMON.ParamByname('REMON_ID').asinteger:=REMON_ID;
        Datamodule2.PrintREMON.ParamByname('SKL_ID').asinteger:=Select_Print_Remon.tag;
        Datamodule2.PrintREMON.Open;
        Wait_Form.Gauge1.Progress:=50;
        delay(1);
        Datamodule2.PrintREMONS.Close;
        Datamodule2.PrintREMONS.ParamByname('REMON_ID').asinteger:=REMON_ID;
        Datamodule2.PrintREMONS.ParamByname('SKL_ID').asinteger:=Select_Print_Remon.tag;
        if Select_Print_Remon.CheckBox1.checked then Datamodule2.PrintREMONS.ParamByname('FUL').asinteger:=1
                                                else Datamodule2.PrintREMONS.ParamByname('FUL').asinteger:=0;
        Datamodule2.PrintREMONS.Open;
        Wait_Form.Gauge1.Progress:=90;
        delay(1);
        {������}
//        Application.createForm(TPrint_DOC,PRINT_DOC);
        PRINT_DOC.PpRemon.reset;
        Wait_Form.Gauge1.Progress:=100;
        delay(100);
        Wait_Form.hide;
        PRINT_DOC.PpRemon.Print;
//        PRINT_DOC.destroy;
        Datamodule2.PrintREMON.Close;
        Datamodule2.PrintREMONS.Close;
        Datamodule2.PrintTransaction.Active:=False;
       end else begin
         //������ ��������
        Datamodule2.PrintREMONS.Close;
        Datamodule2.PrintREMONS.ParamByname('REMON_ID').asinteger:=REMON_ID;
        Datamodule2.PrintREMONS.ParamByname('SKL_ID').asinteger:=Select_Print_Remon.tag;
        if Select_Print_Remon.CheckBox1.checked then Datamodule2.PrintREMONS.ParamByname('FUL').asinteger:=1
                                                else Datamodule2.PrintREMONS.ParamByname('FUL').asinteger:=0;
        Datamodule2.PrintREMONS.Open;
        CLEAR_CENNIK;
        while not Datamodule2.PrintREMONS.eof do begin
           ADD_CENNIK(Datamodule2.PrintREMONS.fieldbyname('TW_ID').asinteger,Select_Print_Remon.tag);
           Datamodule2.PrintREMONS.next;
        end;
        PRINT_CENNIK;
        Datamodule2.PrintREMONS.Close;
       end;
     end;
     Select_Print_Remon.destroy;
     Wait_Form.Hide;
   end;
end;


PROCEDURE PRINT_DETALKLN(KLN_ID:integer);
begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.QrDetalKLN.Close;
     Datamodule2.QrDetalKLN.ParamByname('KLN_ID').asinteger:=KLN_ID;
     Datamodule2.QrDetalKLN.Open;
     Wait_Form.Gauge1.Progress:=70;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(1);
     Wait_Form.hide;
     Print_DOC.PpDETALKLN.Reset;
     Print_DOC.PpDETALKLN.Print;
//     PRINT_DOC.destroy;
     Datamodule2.QrDetalKLN.Close;
     Datamodule2.PrintTransaction.Active:=False;
end;

PROCEDURE PRINT_OPLATA(OPLATA_ID:integer);
begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Wait_Form.Gauge1.Progress:=100;
     delay(1);
     Wait_Form.hide;
     Messbox('������ ��������� ���������� �� ������!',MessSystem,48);
end;

PROCEDURE PRINT_SALE_CHECK1(SALE_ID:integer;MODE:integer; bShowSkid: boolean=true);
var
  CAN:boolean;
  isTEMP: boolean;
begin
	datamodule1.IBTransaction2.Active:=false;
    datamodule1.IbSaveSQL.Active:=false;
    datamodule1.IbSaveSQL.SQL.Text := 'SELECT RN_ID FROM SALES WHERE SALE_ID=:SALE_ID';
    datamodule1.IbSaveSQL.ParamByName('SALE_ID').AsInteger := SALE_ID;
    datamodule1.IbSaveSQL.Open;

    while not datamodule1.IbSaveSQL.EOF do
    begin
      PRINT_CHECK1(datamodule1.IbSaveSQL.Fieldbyname('RN_ID').asinteger, MODE, bShowSkid);
      datamodule1.IbSaveSQL.Next;
    end;
    datamodule1.IbSaveSQL.close;
    datamodule1.IBTransaction2.Active:=false;
end;


PROCEDURE PRINT_SALE(SALE_ID:integer; bShowSkid: boolean; SilentPrint: boolean; doubleCopy: boolean);
var
  CAN:boolean;
  isTEMP: boolean;
begin
	datamodule1.IBTransaction2.Active:=false;
    datamodule1.IbSaveSQL.Active:=false;
    datamodule1.IbSaveSQL.SQL.Text := 'SELECT RN_ID FROM SALES WHERE SALE_ID=:SALE_ID';
    datamodule1.IbSaveSQL.ParamByName('SALE_ID').AsInteger := SALE_ID;
    datamodule1.IbSaveSQL.Open;

    while not datamodule1.IbSaveSQL.EOF do
    begin
      PRINT_RN(datamodule1.IbSaveSQL.Fieldbyname('RN_ID').asinteger,bShowSkid,false,  SilentPrint, doubleCopy);
      datamodule1.IbSaveSQL.Next;
    end;
    datamodule1.IbSaveSQL.close;
    datamodule1.IBTransaction2.Active:=false;
end;

PROCEDURE PRINT_SALE_MH3(SALE_ID:integer; count: integer);
var
  CAN:boolean;
  isTEMP: boolean;
begin

if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select SALE_prow as PROW from SALE where SALE_ID=:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=SALE_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin



    datamodule1.IBTransaction2.Active:=false;
    datamodule1.IbSaveSQL.Active:=false;
    datamodule1.IbSaveSQL.SQL.Text := 'SELECT RN_ID FROM SALES WHERE SALE_ID=:SALE_ID';
    datamodule1.IbSaveSQL.ParamByName('SALE_ID').AsInteger := SALE_ID;
    datamodule1.IbSaveSQL.Open;

    while not datamodule1.IbSaveSQL.EOF do
    begin
//      PRINT_MH1_MH3(2,datamodule1.IbSaveSQL.Fieldbyname('RN_ID').asinteger,2);

      PRINT_RN_MH3_SILENT(datamodule1.IbSaveSQL.Fieldbyname('RN_ID').asinteger, count);

      datamodule1.IbSaveSQL.Next;
    end;
    datamodule1.IbSaveSQL.close;
    datamodule1.IBTransaction2.Active:=false;
    end;
end;



PROCEDURE PRINT_SALE_OLD(SALE_ID:integer);
var
  CAN:boolean;
  isTEMP: boolean;
begin
	datamodule1.IBTransaction2.Active:=false;
    datamodule1.IbSaveSQL.Active:=false;
    datamodule1.IbSaveSQL.SQL.Text := 'SELECT RN_ID FROM SALES WHERE SALE_ID=:SALE_ID';
    datamodule1.IbSaveSQL.ParamByName('SALE_ID').AsInteger := SALE_ID;
    datamodule1.IbSaveSQL.Open;

    while not datamodule1.IbSaveSQL.EOF do
    begin
      PRINT_RN_OLD(datamodule1.IbSaveSQL.Fieldbyname('RN_ID').asinteger);
      datamodule1.IbSaveSQL.Next;
    end;
    datamodule1.IbSaveSQL.close;
    datamodule1.IBTransaction2.Active:=false;
end;

PROCEDURE PRINT_RN(RN_ID:integer; bShowSkid: boolean; PRINT_SPEZIF: boolean; silent_print: boolean; doubleCopy: boolean);
var
  CAN:boolean;
  isTEMP: boolean;
begin
   isTEMP:=false;
   if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select rn_prow as PROW from rn where rn_id=:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=RN_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintRNS.ParamByname('RN_ID').asinteger:=RN_ID;
     Datamodule2.PrintRNS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintRN.Close;
     Datamodule2.PrintRN.ParamByname('RN_ID').asinteger:=RN_ID;
     Datamodule2.PrintRN.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     PRINT_DOC.bShowSkid := bShowSkid;
     delay(1);
     Wait_Form.hide;


       if Datamodule2.PrintRN.fieldbyname('RNTYP_TEMP').asstring='1' then begin
			Print_DOC.frVipiska.ShowReport;
       end
       else
       if (PRINT_SPEZIF=true) then
       begin
        Print_DOC.SPEZIFICAZIYA.ShowReport;


       end
       else

       begin
       	if Datamodule2.PrintRN.fieldbyname('RN_DOST').asstring='1' then
         begin
            if (silent_print) then (Print_DOC.frRND.FindObject('band1') as TfrView).visible:=false;
            if (not silent_print) then
            begin
            if application.MessageBox('���������� ��������� ������� ���������?', '������', MB_YESNO + MB_DEFBUTTON2) = IDNO then
              (Print_DOC.frRND.FindObject('band1') as TfrView).visible:=false
            else
              (Print_DOC.frRND.FindObject('band1') as TfrView).visible:=true;
            end;

            Print_DOC.frRND.ShowReport;
       	 end

         else
         begin
           Print_DOC.PpRN.Reset;

           if silent_print=true then
           begin
             PRINT_DOC.PpRN.DeviceType:='Printer';
             PRINT_DOC.PpRN.ShowPrintDialog:=False;
           end
           else
           begin
             PRINT_DOC.PpRN.DeviceType:='Screen';
             PRINT_DOC.PpRN.ShowPrintDialog:=True;
           end;
           if (doubleCopy)then
                Print_DOC.PpRN.Print;
           Print_DOC.PpRN.Print;


         end;
       end;
//     PRINT_DOC.destroy;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintRN.Close;
     Datamodule2.PrintTransaction.Active:=False;
   end;
end;

PROCEDURE PRINT_RN_TTN(RN_ID:integer; bShowSkid: boolean);
var
  CAN:boolean;
  isTEMP: boolean;
begin
   isTEMP:=false;
   if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select rn_prow as PROW from rn where rn_id=:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=RN_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintRNS.ParamByname('RN_ID').asinteger:=RN_ID;
     Datamodule2.PrintRNS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintRN.Close;
     Datamodule2.PrintRN.ParamByname('RN_ID').asinteger:=RN_ID;
     Datamodule2.PrintRN.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     PRINT_DOC.bShowSkid := bShowSkid;
     delay(1);
     Wait_Form.hide;


       if Datamodule2.PrintRN.fieldbyname('RNTYP_TEMP').asstring='1' then begin
			    Print_DOC.frVipiska.ShowReport;
       end
       else
       begin
         begin
            if application.MessageBox('���������� ��������� ������� ���������?', '������', MB_YESNO + MB_DEFBUTTON2) = IDNO then
              (Print_DOC.frRND.FindObject('band1') as TfrView).visible:=false
            else
              (Print_DOC.frRND.FindObject('band1') as TfrView).visible:=true;



			    Print_DOC.frRND.ShowReport;
       	 end

       end;
//     PRINT_DOC.destroy;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintRN.Close;
     Datamodule2.PrintTransaction.Active:=False;
   end;
end;

PROCEDURE PRINT_RN_T12(RN_ID:integer; n_typ:integer; bShowSkid: boolean);
var
  CAN:boolean;
  isTEMP: boolean;
begin
   isTEMP:=false;
   if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select rn_prow as PROW from rn where rn_id=:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=RN_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintTorg12s.Close;
     Datamodule2.PrintTorg12s.ParamByname('N_ID').asinteger:=RN_ID;
     Datamodule2.PrintTorg12s.ParamByname('TYP').asinteger:=n_typ;
     Datamodule2.PrintTorg12s.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintTorg12.Close;
     Datamodule2.PrintTorg12.ParamByname('N_ID').asinteger:=RN_ID;
     Datamodule2.PrintTorg12.ParamByname('TYP').asinteger:=n_typ;
     Datamodule2.PrintTorg12.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     PRINT_DOC.bShowSkid := bShowSkid;
     delay(1);
     Wait_Form.hide;


     Print_DOC.frTorg12.ShowReport;

//     PRINT_DOC.destroy;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintTorg12.Close;
     Datamodule2.PrintTransaction.Active:=False;
   end;
end;

procedure PRINT_RN_WOZW_ST_FAKT(RN_ID: integer);
begin
//     Application.createForm(TSTFAKT_ERROR,STFAKT_ERROR);
//     STFAKT_ERROR.Tag:=PN_ID;
//     STFAKT_ERROR.FormCreate(STFAKT_ERROR);
//     if STFAKT_ERROR.Memo1.Tag>0 then STFAKT_ERROR.showModal
//     else
     begin
       Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
       Wait_Form.Gauge1.Progress:=10;
       Wait_Form.Show;
       delay(1);
       Datamodule2.PrintTransaction.Active:=False;
       Datamodule2.PrintSTFAKTSPN.Close;
       Datamodule2.PrintSTFAKTSPN.ParamByname('PN_ID').asinteger:=RN_ID;
       Datamodule2.PrintSTFAKTSPN.ParamByname('IS_RN').asinteger:=1;
       Datamodule2.PrintSTFAKTSPN.Open;
       Wait_Form.Gauge1.Progress:=50;
       delay(1);
       Datamodule2.PrintSTFAKTPN.Close;
       Datamodule2.PrintSTFAKTPN.ParamByname('PN_ID').asinteger:=RN_ID;
       Datamodule2.PrintSTFAKTPN.ParamByname('IS_RN').asinteger:=1;
       Datamodule2.PrintSTFAKTPN.Open;
       Wait_Form.Gauge1.Progress:=90;
       delay(1);
//       Application.createForm(TPRINT_DOC,PRINT_DOC);
       Wait_Form.Gauge1.Progress:=100;
       delay(1);
         PRINT_DOC.STFAKT_TITLE.lines.clear;
         PRINT_DOC.STFAKT_TITLE.lines.add('�ר�-������� � '+Datamodule2.PrintSTFAKTPN.fieldByname('STFAKT_FULL_NUM').asstring+' �� '+date_sokr(Datamodule2.PrintSTFAKTPN.fieldByname('STFAKT_DATE').asdatetime));
         PRINT_DOC.STFAKT_TITLE2.caption:='�ר�-������� � '+Datamodule2.PrintSTFAKTPN.fieldByname('STFAKT_FULL_NUM').asstring+' �� '+date_sokr(Datamodule2.PrintSTFAKTPN.fieldByname('STFAKT_DATE').asdatetime);
         Print_DOC.frSTFaktPN.ShowReport;

//         PRINT_DOC.PpStfakt.reset;
//         PRINT_DOC.PpStfakt.Print;
       Wait_Form.Hide;
//       PRINT_DOC.destroy;
       Datamodule2.PrintSTFAKTSPN.Close;
       Datamodule2.PrintSTFAKTPN.Close;
       Datamodule2.PrintTransaction.Active:=False;
     end;
//     STFAKT_ERROR.destroy;
end;


procedure PRINT_PN_ST_FAKT(PN_ID: integer);
begin
//     Application.createForm(TSTFAKT_ERROR,STFAKT_ERROR);
//     STFAKT_ERROR.Tag:=PN_ID;
//     STFAKT_ERROR.FormCreate(STFAKT_ERROR);
//     if STFAKT_ERROR.Memo1.Tag>0 then STFAKT_ERROR.showModal
//     else
     begin
       Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
       Wait_Form.Gauge1.Progress:=10;
       Wait_Form.Show;
       delay(1);
       Datamodule2.PrintTransaction.Active:=False;
       Datamodule2.PrintSTFAKTSPN.Close;
       Datamodule2.PrintSTFAKTSPN.ParamByname('PN_ID').asinteger:=PN_ID;
       Datamodule2.PrintSTFAKTSPN.ParamByname('IS_RN').asinteger:=0;
       Datamodule2.PrintSTFAKTSPN.Open;
       Wait_Form.Gauge1.Progress:=50;
       delay(1);
       Datamodule2.PrintSTFAKTPN.Close;
       Datamodule2.PrintSTFAKTPN.ParamByname('PN_ID').asinteger:=PN_ID;
       Datamodule2.PrintSTFAKTPN.ParamByname('IS_RN').asinteger:=0;
       Datamodule2.PrintSTFAKTPN.Open;
       Wait_Form.Gauge1.Progress:=90;
       delay(1);
//       Application.createForm(TPRINT_DOC,PRINT_DOC);
       Wait_Form.Gauge1.Progress:=100;
       delay(1);
         PRINT_DOC.STFAKT_TITLE.lines.clear;
         PRINT_DOC.STFAKT_TITLE.lines.add('�ר�-������� � '+Datamodule2.PrintSTFAKTPN.fieldByname('STFAKT_FULL_NUM').asstring+' �� '+date_sokr(Datamodule2.PrintSTFAKTPN.fieldByname('STFAKT_DATE').asdatetime));
         PRINT_DOC.STFAKT_TITLE2.caption:='�ר�-������� � '+Datamodule2.PrintSTFAKTPN.fieldByname('STFAKT_FULL_NUM').asstring+' �� '+date_sokr(Datamodule2.PrintSTFAKTPN.fieldByname('STFAKT_DATE').asdatetime);
         Print_DOC.frSTFaktPN.ShowReport;

//         PRINT_DOC.PpStfakt.reset;
//         PRINT_DOC.PpStfakt.Print;
       Wait_Form.Hide;
//       PRINT_DOC.destroy;
       Datamodule2.PrintSTFAKTSPN.Close;
       Datamodule2.PrintSTFAKTPN.Close;
       Datamodule2.PrintTransaction.Active:=False;
     end;
//     STFAKT_ERROR.destroy;
end;

PROCEDURE PRINT_MH1_MH3(DOC_TYPE, DOC_ID, PRINT_FORM_TYPE:integer);
var
  CAN:boolean;
begin

{06-05-2014}
can:=true;

if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else
   if (doc_type in [1,2]) then
   begin
      DataModule1.CanPrintTransaction.Active:=False;
      if (PRINT_FORM_TYPE=1) then
              ADD_SQL(DataModule1.QueryCanPrint,'select PN$_prow as PROW from PN$ where PN$_ID=:id');
      if (PRINT_FORM_TYPE=11) then
              ADD_SQL(DataModule1.QueryCanPrint,'select PN$_prow as PROW from PN$ where PN$_ID=:id');
      if (PRINT_FORM_TYPE=2) then
              ADD_SQL(DataModule1.QueryCanPrint,'select rn_prow as PROW from RN where RN_ID=:id');

      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=DOC_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin



     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PRINT_MH.Close;
     Datamodule2.PRINT_MH.ParamByname('DOC_TYPE').asinteger:=DOC_TYPE;
     Datamodule2.PRINT_MH.ParamByname('DOC_ID').asinteger:=DOC_ID;
     Datamodule2.PRINT_MH.ParamByname('PRINT_FORM_TYPE').asinteger:=PRINT_FORM_TYPE;
     Datamodule2.PRINT_MH.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PRINT_MH_S.Close;
     Datamodule2.PRINT_MH_S.ParamByname('DOC_TYPE').asinteger:=DOC_TYPE;
     Datamodule2.PRINT_MH_S.ParamByname('DOC_ID').asinteger:=DOC_ID;
     Datamodule2.PRINT_MH_S.Open;

     Wait_Form.Gauge1.Progress:=90;
     delay(1);
     Wait_Form.Gauge1.Progress:=100;

     delay(1);
     Wait_Form.hide;

     if PRINT_FORM_TYPE=1 then
      Print_DOC.MH1.ShowReport;

     if PRINT_FORM_TYPE=11 then
      Print_DOC.MH1_1.ShowReport;

     if PRINT_FORM_TYPE=2 then
      Print_DOC.MH3.ShowReport;
     end;
end;

PROCEDURE PRINT_RN_MH3_SILENT(DOC_ID :integer;count: integer);
var can: boolean;
begin
if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select rn_prow as PROW from RN where RN_ID=:id');

      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=DOC_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin


     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PRINT_MH.Close;
     Datamodule2.PRINT_MH.ParamByname('DOC_TYPE').asinteger:=2;
     Datamodule2.PRINT_MH.ParamByname('DOC_ID').asinteger:=DOC_ID;
     Datamodule2.PRINT_MH.ParamByname('PRINT_FORM_TYPE').asinteger:=2;
     Datamodule2.PRINT_MH.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PRINT_MH_S.Close;
     Datamodule2.PRINT_MH_S.ParamByname('DOC_TYPE').asinteger:=2;
     Datamodule2.PRINT_MH_S.ParamByname('DOC_ID').asinteger:=DOC_ID;
     Datamodule2.PRINT_MH_S.Open;

     Wait_Form.Gauge1.Progress:=90;
     delay(1);
     Wait_Form.Gauge1.Progress:=100;

     delay(1);
     Wait_Form.hide;


//  Print_DOC.MH3.PrepareReport;
//Print_DOC.MH3.PrintOptions.ShowDialog := False;
//Print_DOC.MH3.Print;

      Print_DOC.MH3.PrepareReport;
      Print_DOC.MH3.PrintPreparedReport( '', count, false, frAll );
      end;
end;


procedure PRINT_trans_nakl(PN_ID:integer; doc_type: integer);
begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintTransportNakl2.close;
     Datamodule2.PrintTransportNakl2.ParamByname('DOC_TYPE').asinteger:=doc_type;
     Datamodule2.PrintTransportNakl2.ParamByname('DOC_ID').asinteger:=PN_ID;
     Datamodule2.PrintTransportNakl2.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);

     Print_DOC.frTransportNakl2.ShowReport;
     
end;

PROCEDURE PRINT_PN_T12(PN_ID:integer; n_typ:integer; bShowSkid: boolean);
var
  CAN:boolean;
  isTEMP: boolean;
begin
   isTEMP:=false;
   if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select rn$_prow as PROW from pn$ where pn$_id=:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=PN_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintTorg12s.Close;
     Datamodule2.PrintTorg12s.ParamByname('N_ID').asinteger:=PN_ID;
     Datamodule2.PrintTorg12s.ParamByname('TYP').asinteger:=n_typ;
     Datamodule2.PrintTorg12s.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintTorg12.Close;
     Datamodule2.PrintTorg12.ParamByname('N_ID').asinteger:=PN_ID;
     Datamodule2.PrintTorg12.ParamByname('TYP').asinteger:=n_typ;
     Datamodule2.PrintTorg12.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
     Wait_Form.Gauge1.Progress:=100;
     PRINT_DOC.bShowSkid := bShowSkid;
     delay(1);
     Wait_Form.hide;

     Print_DOC.frTorg12.ShowReport;

//     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintTorg12.Close;
     Datamodule2.PrintTransaction.Active:=False;
   end;
end;

PROCEDURE PRINT_RN_OLD(RN_ID:integer);
var
  CAN:boolean;
begin
   if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select rn_prow as PROW from rn where rn_id=:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=RN_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintRNS.ParamByname('RN_ID').asinteger:=RN_ID;
     Datamodule2.PrintRNS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintRN.Close;
     Datamodule2.PrintRN.ParamByname('RN_ID').asinteger:=RN_ID;
     Datamodule2.PrintRN.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(1);
     Wait_Form.hide;
     if Datamodule2.PrintRN.fieldbyname('RN_DOST').asstring='1' then begin
           Print_DOC.PpRND.Reset;
           Print_DOC.PpRND.Print;
//			Print_DOC.frRND.ShowReport;
       end else begin
           Print_DOC.PpRN.Reset;
           Print_DOC.PpRN.Print;
       end;
//     PRINT_DOC.destroy;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintRN.Close;
     Datamodule2.PrintTransaction.Active:=False;
   end;
end;

PROCEDURE PRINT_RNW(RN_ID:integer); // ������ ��������� ����������� �����������
var
  CAN:boolean;
  NPZ_IDS: array [0..100] of integer;
  NPZ_NUM: integer;
begin
  NPZ_NUM:=0;
   if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select rn_prow as PROW from rn where rn_id=:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=RN_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else


   begin
     datamodule1.IbSaveSQL.Transaction.Active:=false;
     Datamodule1.IbSaveSQL.SQL.Clear;
     datamodule1.IbSaveSQL.SQL.Add('SELECT NPZ_ID FROM NPZ WHERE NPZ.RN_ID=:RN_ID');
     datamodule1.IbSaveSQL.ParamByName('RN_ID').asinteger:=RN_ID;
     datamodule1.IbSaveSQL.Open;

     while not datamodule1.IbSaveSQL.Eof do
     begin
        PRINT_NPZ(DataModule1.ibsaveSQL.fieldbyname('NPZ_ID').asinteger);
        datamodule1.IbSaveSQL.next;
     end;
     datamodule1.IbSaveSQL.close;
     datamodule1.IbSaveSQL.Transaction.active:=false;
   end;  

end;


PROCEDURE PRINT_NPZ(NPZ_ID:integer); // ������ ��������� ����������� ����������� ����� ������	(���)

begin

end;

PROCEDURE PRINT_MAILS2(MAIL_ID:integer;TYP:integer);
begin
// ������ ������ �� �������
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintMAILS2.Close;
     Datamodule2.PrintMAILS2.ParamByname('MAIL_ID').asinteger:=MAIL_ID;
     Datamodule2.PrintMAILS2.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintMAIL2.Close;
     Datamodule2.PrintMAIL2.ParamByname('MAIL_ID').asinteger:=MAIL_ID;
     Datamodule2.PrintMAIL2.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPrint_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     Wait_Form.hide;
     case typ of
       1: begin
             PRINT_DOC.PpZAY.reset;
             PRINT_DOC.PpZAY.Print;
          end;
       2: begin
             PRINT_DOC.PpZAYFAX.reset;
             PRINT_DOC.PpZAYFAX.Print;
          end;
       3: begin
             PRINT_DOC.PpZAYExp.reset;
             PRINT_DOC.PpZAYExp.Print;
          end;
     end;
//     PRINT_DOC.destroy;
     Datamodule2.PrintMAILS2.Close;
     Datamodule2.PrintMAIL2.Close;
     Datamodule2.PrintTransaction.Active:=False;
end;

PROCEDURE PRINT_MAILS2RN(MAIL_ID:integer);
begin
// ������ ������ �� �������
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintRNS.SQL.Clear;
     Datamodule2.PrintRNS.SQL.Add('select * from print_mails2rn(:MAIL_ID)');
     Datamodule2.PrintRNS.ParamByname('MAIL_ID').asinteger:=MAIL_ID;
     Datamodule2.PrintRNS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintRN.Close;
     Datamodule2.PrintRN.SQL.Clear;
     Datamodule2.PrintRN.SQL.Add('select * from print_mail2rn(:MAIL_ID)');
     Datamodule2.PrintRN.ParamByname('MAIL_ID').asinteger:=MAIL_ID;
     Datamodule2.PrintRN.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPrint_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     Wait_Form.hide;

     if application.MessageBox('���������� ��������� ������� ���������?', '������', MB_YESNO + MB_DEFBUTTON2) = IDNO then
       (Print_DOC.frRND.FindObject('band1') as TfrView).visible:=false
     else
       (Print_DOC.frRND.FindObject('band1') as TfrView).visible:=true;

     (PRINT_DOC.frRND.FindObject('Picture2') as TfrView).visible:=false;
     (PRINT_DOC.frRND.FindObject('Memo3') as TfrView).visible:=false;
     (PRINT_DOC.frRND.FindObject('Memo179') as TfrView).visible:=false;
     (PRINT_DOC.frRND.FindObject('Memo180') as TfrView).visible:=false;
//     (PRINT_DOC.frRND.FindObject('Memo181') as TfrView).visible:=false;
     (PRINT_DOC.frRND.FindObject('Memo183') as TfrView).visible:=false;
     (PRINT_DOC.frRND.FindObject('Memo15') as TfrView).Memo.Clear;
     (PRINT_DOC.frRND.FindObject('Memo94') as TfrView).Memo.Clear;

     PRINT_DOC.frRND.ShowReport;

     (PRINT_DOC.frRND.FindObject('Picture2') as TfrView).visible:=true;
     (PRINT_DOC.frRND.FindObject('Memo3') as TfrView).visible:=true;
     (PRINT_DOC.frRND.FindObject('Memo179') as TfrView).visible:=true;
     (PRINT_DOC.frRND.FindObject('Memo180') as TfrView).visible:=true;
//     (PRINT_DOC.frRND.FindObject('Memo181') as TfrView).visible:=true;
     (PRINT_DOC.frRND.FindObject('Memo183') as TfrView).visible:=true;
     (PRINT_DOC.frRND.FindObject('Memo15') as TfrView).Memo.Text:='57763031';
     (PRINT_DOC.frRND.FindObject('Memo94') as TfrView).Memo.Text:='[DataModule2.PrintRN."KLN_GB"]';

//     PRINT_DOC.destroy;
     Datamodule2.PrintMAILS2.Close;
     Datamodule2.PrintMAIL2.Close;
     Datamodule2.PrintRN.SQL.Clear;
     Datamodule2.PrintRNS.SQL.Clear;
     Datamodule2.PrintRN.SQL.Add('select * from print_Rn(:RN_ID)');
     Datamodule2.PrintRNS.SQL.Add('select * from Print_RNS(:RN_ID) order by rns_id');
     Datamodule2.PrintTransaction.Active:=False;
end;

PROCEDURE PRINT_MAILS(MAIL_ID:integer);
begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     delay(1);
     Wait_Form.Show;
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintMAILS.Close;
     Datamodule2.PrintMAILS.ParamByname('MAIL_ID').asinteger:=MAIL_ID;
     Datamodule2.PrintMAILS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintMAIL.Close;
     Datamodule2.PrintMAIL.ParamByname('MAIL_ID').asinteger:=MAIL_ID;
     Datamodule2.PrintMAIL.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPrint_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(1);
     Wait_Form.hide;
     PRINT_DOC.PpMail.reset;
     PRINT_DOC.PpMail.Print;
//     PRINT_DOC.destroy;
     Datamodule2.PrintMAILS.Close;
     Datamodule2.PrintMAIL.Close;
     Datamodule2.PrintTransaction.Active:=False;
end;

PROCEDURE PRINT_GARANT_TALON(GARANT_ID:integer);
begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     delay(1);
     Wait_Form.Show;
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintGARANT.Close;
     Datamodule2.PrintGARANT.ParamByname('GARANT_ID').asinteger:=GARANT_ID;
     Datamodule2.PrintGARANT.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(1);
     Wait_Form.hide;
     PRINT_DOC.PpGarant.reset;
     PRINT_DOC.PpGarant.Print;
//     PRINT_DOC.Destroy;
     Datamodule2.PrintGARANT.Close;
     Datamodule2.PrintTransaction.Active:=False;
end;


PROCEDURE PRINT_CENNIK;
begin
     {�������� ������� �������}
     Application.createform(TSIZE_CENNIK,SIZE_CENNIK);
     SIZE_CENNIK.showModal;
     if SIZE_CENNIK.tag>=0 then case SIZE_CENNIK.tag of
        0: begin
//              Application.createForm(TPrint_DOC,PRINT_DOC);
              PRINT_DOC.PP_CENNIK_LARGE.reset;
              PRINT_DOC.PP_CENNIK_LARGE.Print;
//              PRINT_DOC.destroy;
        end;
        1: begin
//              Application.createForm(TPrint_DOC,PRINT_DOC);
              PRINT_DOC.PP_CENNIK_BIG.reset;
              PRINT_DOC.PP_CENNIK_BIG.Print;
//              PRINT_DOC.destroy;
        end;
        2: begin
//              Application.createForm(TPrint_DOC,PRINT_DOC);
              PRINT_DOC.PP_CENNIK_MEDIUM.reset;
              PRINT_DOC.PP_CENNIK_MEDIUM.Print;
//              PRINT_DOC.destroy;
        end;
        3: begin
//              Application.createForm(TPrint_DOC,PRINT_DOC);
              PRINT_DOC.PP_CENNIK_SMALL.reset;
              PRINT_DOC.PP_CENNIK_SMALL.Print;
//              PRINT_DOC.destroy;
        end;
        4: begin
//              Application.createForm(TPrint_DOC,PRINT_DOC);
              PRINT_DOC.PP_BAR_CODE.reset;
              PRINT_DOC.PP_BAR_CODE.Print;
//                PRINT_DOC.frBAR_CODE.ShowReport;
//              PRINT_DOC.destroy;
        end;
     end;
     SIZE_CENNIK.destroy;
end;

PROCEDURE PRINT_PER(PER_ID:integer);
var
  CAN:boolean;
begin
   if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select case when not per_prow=1 then (select rn_prow from rn where rn_id = per.rn_id) else per_prow end   per_prow from per where per_id =:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=PER_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('per_prow').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintPERS.Close;
     Datamodule2.PrintPERS.ParamByname('PER_ID').asinteger:=PER_ID;
     Datamodule2.PrintPERS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintPER.Close;
     Datamodule2.PrintPER.ParamByname('PER_ID').asinteger:=PER_ID;
     Datamodule2.PrintPER.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(1);
     PRINT_DOC.PpPER.reset;
     Wait_Form.Hide;
     PRINT_DOC.PpPER.Print;
//     PRINT_DOC.destroy;
     Datamodule2.PrintPERS.Close;
     Datamodule2.PrintPER.Close;
     Datamodule2.PrintTransaction.Active:=False;
   end;
end;

PROCEDURE PRINT_STFAKTDOC_NEW(STFAKT_ID:integer);
begin
     Application.createForm(TSTFAKT_ERROR,STFAKT_ERROR);
     STFAKT_ERROR.Tag:=STFAKT_ID;
     STFAKT_ERROR.FormCreate(STFAKT_ERROR);
     if STFAKT_ERROR.Memo1.Tag>0 then STFAKT_ERROR.showModal
     else begin
       Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
       Wait_Form.Gauge1.Progress:=10;
       Wait_Form.Show;
       delay(1);
       Datamodule2.PrintTransaction.Active:=False;
       Datamodule2.PrintSTFAKTS.Close;
       Datamodule2.PrintSTFAKTS.ParamByname('STFAKT_ID').asinteger:=STFAKT_ID;
       Datamodule2.PrintSTFAKTS.Open;
       Wait_Form.Gauge1.Progress:=50;
       delay(1);
       Datamodule2.PrintSTFAKT.Close;
       Datamodule2.PrintSTFAKT.ParamByname('STFAKT_ID').asinteger:=STFAKT_ID;
       Datamodule2.PrintSTFAKT.Open;
       Wait_Form.Gauge1.Progress:=90;
       delay(1);
//       Application.createForm(TPRINT_DOC,PRINT_DOC);
       Wait_Form.Gauge1.Progress:=100;
       delay(1);
         PRINT_DOC.STFAKT_TITLE.lines.clear;
         PRINT_DOC.STFAKT_TITLE.lines.add('�ר�-������� � '+Datamodule2.PrintSTFAKT.fieldByname('STFAKT_FULL_NUM').asstring+' �� '+date_sokr(Datamodule2.PrintSTFAKT.fieldByname('STFAKT_DATE').asdatetime));
         PRINT_DOC.STFAKT_TITLE2.caption:='�ר�-������� � '+Datamodule2.PrintSTFAKT.fieldByname('STFAKT_FULL_NUM').asstring+' �� '+date_sokr(Datamodule2.PrintSTFAKT.fieldByname('STFAKT_DATE').asdatetime);
         Print_DOC.frSTFakt.ShowReport;

//         PRINT_DOC.PpStfakt.reset;
//         PRINT_DOC.PpStfakt.Print;
       Wait_Form.Hide;
//       PRINT_DOC.destroy;
       Datamodule2.PrintSTFAKTS.Close;
       Datamodule2.PrintSTFAKT.Close;
       Datamodule2.PrintTransaction.Active:=False;
     end;
     STFAKT_ERROR.destroy;
end;

PROCEDURE PRINT_STFAKTDOC_2012(STFAKT_ID:integer; IS_WOZW_RN: integer);
begin
     Application.createForm(TSTFAKT_ERROR,STFAKT_ERROR);
     STFAKT_ERROR.Tag:=STFAKT_ID;
     STFAKT_ERROR.FormCreate(STFAKT_ERROR);
     if ((IS_WOZW_RN=0) and (STFAKT_ERROR.Memo1.Tag>0)) then STFAKT_ERROR.showModal
     else begin
       Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
       Wait_Form.Gauge1.Progress:=10;
       Wait_Form.Show;
       delay(1);
       Datamodule2.PrintTransaction.Active:=False;
       Datamodule2.PrintSTFAKTS.Close;
       Datamodule2.PrintSTFAKTS.ParamByname('STFAKT_ID').asinteger:=STFAKT_ID;
       Datamodule2.PrintSTFAKTS.ParamByname('IS_WOZW_RN').asinteger:=IS_WOZW_RN;
       Datamodule2.PrintSTFAKTS.Open;
       Wait_Form.Gauge1.Progress:=50;
       delay(1);
       Datamodule2.PrintSTFAKT.Close;
       Datamodule2.PrintSTFAKT.ParamByname('STFAKT_ID').asinteger:=STFAKT_ID;
       Datamodule2.PrintSTFAKT.ParamByname('IS_WOZW_RN').asinteger:=IS_WOZW_RN;

       Datamodule2.PrintSTFAKT.Open;
       Wait_Form.Gauge1.Progress:=90;
       delay(1);
//       Application.createForm(TPRINT_DOC,PRINT_DOC);
       Wait_Form.Gauge1.Progress:=100;
       delay(1);
         PRINT_DOC.STFAKT_TITLE.lines.clear;
         PRINT_DOC.STFAKT_TITLE.lines.add('�ר�-������� � '+Datamodule2.PrintSTFAKT.fieldByname('STFAKT_FULL_NUM').asstring+' �� '+date_sokr(Datamodule2.PrintSTFAKT.fieldByname('STFAKT_DATE').asdatetime));
         PRINT_DOC.STFAKT_TITLE2.caption:='�ר�-������� � '+Datamodule2.PrintSTFAKT.fieldByname('STFAKT_FULL_NUM').asstring+' �� '+date_sokr(Datamodule2.PrintSTFAKT.fieldByname('STFAKT_DATE').asdatetime);
         Print_DOC.frSTFakt2012.ShowReport;

//         PRINT_DOC.PpStfakt.reset;
//         PRINT_DOC.PpStfakt.Print;
       Wait_Form.Hide;
//       PRINT_DOC.destroy;
       Datamodule2.PrintSTFAKTS.Close;
       Datamodule2.PrintSTFAKT.Close;
       Datamodule2.PrintTransaction.Active:=False;
     end;
     STFAKT_ERROR.destroy;
end;

PROCEDURE PRINT_STFAKTDOC(STFAKT_ID:integer);
begin
     Application.createForm(TSTFAKT_ERROR,STFAKT_ERROR);
     STFAKT_ERROR.Tag:=STFAKT_ID;
     STFAKT_ERROR.FormCreate(STFAKT_ERROR);
     if STFAKT_ERROR.Memo1.Tag>0 then STFAKT_ERROR.showModal
     else begin
       Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
       Wait_Form.Gauge1.Progress:=10;
       Wait_Form.Show;
       delay(1);
       Datamodule2.PrintTransaction.Active:=False;
       Datamodule2.PrintSTFAKTS.Close;
       Datamodule2.PrintSTFAKTS.ParamByname('STFAKT_ID').asinteger:=STFAKT_ID;
       Datamodule2.PrintSTFAKTS.Open;
       Wait_Form.Gauge1.Progress:=50;
       delay(1);
       Datamodule2.PrintSTFAKT.Close;
       Datamodule2.PrintSTFAKT.ParamByname('STFAKT_ID').asinteger:=STFAKT_ID;
       Datamodule2.PrintSTFAKT.Open;
       Wait_Form.Gauge1.Progress:=90;
       delay(1);
//       Application.createForm(TPRINT_DOC,PRINT_DOC);
       Wait_Form.Gauge1.Progress:=100;
       delay(1);
         PRINT_DOC.STFAKT_TITLE.lines.clear;
         PRINT_DOC.STFAKT_TITLE.lines.add('�ר�-������� � '+Datamodule2.PrintSTFAKT.fieldByname('STFAKT_FULL_NUM').asstring+' �� '+date_sokr(Datamodule2.PrintSTFAKT.fieldByname('STFAKT_DATE').asdatetime));
         PRINT_DOC.STFAKT_TITLE2.caption:='�ר�-������� � '+Datamodule2.PrintSTFAKT.fieldByname('STFAKT_FULL_NUM').asstring+' �� '+date_sokr(Datamodule2.PrintSTFAKT.fieldByname('STFAKT_DATE').asdatetime);
         PRINT_DOC.PpStfakt.reset;
         PRINT_DOC.PpStfakt.Print;
       Wait_Form.Hide;
//       PRINT_DOC.destroy;
       Datamodule2.PrintSTFAKTS.Close;
       Datamodule2.PrintSTFAKT.Close;
       Datamodule2.PrintTransaction.Active:=False;
     end;
     STFAKT_ERROR.destroy;
end;

PROCEDURE PRINT_SPIS(SPIS_ID:integer);
var
  CAN:boolean;
begin
   if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select spis_prow as PROW from spis where spis_id=:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=SPIS_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     delay(1);
     Wait_Form.Show;
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintSPISS.Close;
     Datamodule2.PrintSPISS.ParamByname('SPIS_ID').asinteger:=SPIS_ID;
     Datamodule2.PrintSPISS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintSPIS.Close;
     Datamodule2.PrintSPIS.ParamByname('SPIS_ID').asinteger:=SPIS_ID;
     Datamodule2.PrintSPIS.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     PRINT_DOC.PpSPIS.reset;
     Wait_Form.Hide;
     PRINT_DOC.PpSPIS.Print;
//     PRINT_DOC.destroy;
     Datamodule2.PrintSPISS.Close;
     Datamodule2.PrintSPIS.Close;
     Datamodule2.PrintTransaction.Active:=False;
   end;
end;

PROCEDURE PRINT_PSORT(PSORT_ID:integer);
var
  CAN:boolean;
begin
   if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select psort_prow as PROW from psort where psort_id=:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=PSORT_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     delay(1);
     Wait_Form.Show;
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintPSORTS.Close;
     Datamodule2.PrintPSORTS.ParamByname('PSORT_ID').asinteger:=PSORT_ID;
     Datamodule2.PrintPSORTS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintPSORT.Close;
     Datamodule2.PrintPSORT.ParamByname('PSORT_ID').asinteger:=PSORT_ID;
     Datamodule2.PrintPSORT.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     PRINT_DOC.PpPSORT.reset;
     Wait_Form.Hide;
     PRINT_DOC.PpPSORT.Print;
//     PRINT_DOC.destroy;
     Datamodule2.PrintPSORTS.Close;
     Datamodule2.PrintPSORT.Close;
     Datamodule2.PrintTransaction.Active:=False;
   end;
end;


PROCEDURE PRINT_CHECK1(RN_ID:integer;MODE:integer; bShowSkid: boolean=true);
begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     delay(1);
     Wait_Form.Show;
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintRNS.ParamByname('RN_ID').asinteger:=RN_ID;
     Datamodule2.PrintRNS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintRN.Close;
     Datamodule2.PrintRN.ParamByname('RN_ID').asinteger:=RN_ID;
     Datamodule2.PrintRN.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     PRINT_DOC.bShowSkid:= bShowSkid;
     delay(1);
     PRINT_DOC.PpCHECKRN.reset;
     Wait_Form.Hide;
     if Mode=Preview then begin
       PRINT_DOC.PpCHECKRN.DeviceType:='Screen';
       PRINT_DOC.PpCHECKRN.ShowPrintDialog:=True;
       PRINT_DOC.PpCHECKRN.Print;
     end else begin
       PRINT_DOC.PpCHECKRN.DeviceType:='Printer';
       PRINT_DOC.PpCHECKRN.ShowPrintDialog:=False;
       PRINT_DOC.PpCHECKRN.Print;
     end;
//     PRINT_DOC.destroy;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintRN.Close;
     Datamodule2.PrintTransaction.Active:=False;
end;

PROCEDURE PRINT_CHECK2(KKM_ID:integer;Mode:integer);
begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintKKMS.Close;
     Datamodule2.PrintKKMS.ParamByname('KKM_ID').asinteger:=KKM_ID;
     Datamodule2.PrintKKMS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintKKM.Close;
     Datamodule2.PrintKKM.ParamByname('KKM_ID').asinteger:=KKM_ID;
     Datamodule2.PrintKKM.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(1);
     PRINT_DOC.PpCheckKKM.reset;
     Wait_Form.Hide;

     if Mode=Preview then begin
       PRINT_DOC.PpCheckKKM.DeviceType:='Screen';
       PRINT_DOC.PpCheckKKM.ShowPrintDialog:=True;
       PRINT_DOC.PpCheckKKM.Print;
     end else begin
       PRINT_DOC.PpCheckKKM.DeviceType:='Printer';
       PRINT_DOC.PpCheckKKM.ShowPrintDialog:=False;
       PRINT_DOC.PpCheckKKM.Print;
     end;
//     PRINT_DOC.destroy;
     Datamodule2.PrintKKMS.Close;
     Datamodule2.PrintKKM.Close;
     Datamodule2.PrintTransaction.Active:=False;
end;

PROCEDURE PRINT_CHECK3(RN_ID:integer;MODE:integer);
begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     delay(1);
     Wait_Form.Show;
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintRNS.ParamByname('RN_ID').asinteger:=RN_ID;
     Datamodule2.PrintRNS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintRN.Close;
     Datamodule2.PrintRN.ParamByname('RN_ID').asinteger:=RN_ID;
     Datamodule2.PrintRN.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(1);
     PRINT_DOC.PpRN2.reset;
     Wait_Form.Hide;
     if Mode=Preview then begin
       PRINT_DOC.PpRN2.DeviceType:='Screen';
       PRINT_DOC.PpRN2.ShowPrintDialog:=True;
       PRINT_DOC.PpRN2.Print;
     end else begin
       PRINT_DOC.PpRN2.DeviceType:='Printer';
       PRINT_DOC.PpRN2.ShowPrintDialog:=False;
       PRINT_DOC.PpRN2.Print;
     end;
//     PRINT_DOC.destroy;
     Datamodule2.PrintRNS.Close;
     Datamodule2.PrintRN.Close;
     Datamodule2.PrintTransaction.Active:=False;
end;

PROCEDURE PRINT_CHECK4(KKM_ID:integer;Mode:integer);
begin
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintKKMS.Close;
     Datamodule2.PrintKKMS.ParamByname('KKM_ID').asinteger:=KKM_ID;
     Datamodule2.PrintKKMS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintKKM.Close;
     Datamodule2.PrintKKM.ParamByname('KKM_ID').asinteger:=KKM_ID;
     Datamodule2.PrintKKM.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     Wait_Form.Gauge1.Progress:=100;
     delay(1);
     PRINT_DOC.PpKKM2.reset;
     Wait_Form.Hide;
     if Mode=Preview then begin
       PRINT_DOC.PpKKM2.DeviceType:='Screen';
       PRINT_DOC.PpKKM2.ShowPrintDialog:=True;
       PRINT_DOC.PpKKM2.Print;
     end else begin
       PRINT_DOC.PpKKM2.DeviceType:='Printer';
       PRINT_DOC.PpKKM2.ShowPrintDialog:=False;
       PRINT_DOC.PpKKM2.Print;
     end;
//     PRINT_DOC.destroy;
     Datamodule2.PrintKKMS.Close;
     Datamodule2.PrintKKM.Close;
     Datamodule2.PrintTransaction.Active:=False;
end;




PROCEDURE PRINT_ST(ST_ID:integer);
begin
     if Messbox('���������� ����������� ������ � �����?',MessSubmit,4+48+256)=6 then PRINT_MP:=true
     else PRINT_MP:=false;
     Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
     Wait_Form.Gauge1.Progress:=10;
     Wait_Form.Show;
     delay(1);
     Datamodule2.PrintTransaction.Active:=False;
     Datamodule2.PrintSTS.Close;
     Datamodule2.PrintSTS.ParamByname('ST_ID').asinteger:=ST_ID;
     Datamodule2.PrintSTS.Open;
     Wait_Form.Gauge1.Progress:=50;
     delay(1);
     Datamodule2.PrintST.Close;
     Datamodule2.PrintST.ParamByname('ST_ID').asinteger:=ST_ID;
     Datamodule2.PrintST.Open;
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
//     Application.createForm(TPRINT_DOC,PRINT_DOC);
     PRINT_DOC.PpST.reset;
     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     Wait_Form.Hide;
     PRINT_DOC.PpST.Print;
     Datamodule2.PrintSTS.Close;
     Datamodule2.PrintST.Close;
     Datamodule2.PrintTransaction.Active:=False;
//     PRINT_DOC.destroy;
end;


PROCEDURE PRINT_PN(PN_ID:INTEGER;X,Y:integer);
var
  CAN:boolean;
begin
   if CHECK_DOSTUP('$PRINT.NOPROW') then CAN:=true
   else begin
      DataModule1.CanPrintTransaction.Active:=False;
      ADD_SQL(DataModule1.QueryCanPrint,'select pn$_prow as PROW from pn$ where pn$_id=:id');
      DataModule1.QueryCanPrint.ParamByname('ID').asinteger:=PN_ID;
      DataModule1.QueryCanPrint.open;
      CAN:=(DataModule1.QueryCanPrint.fieldByname('PROW').asinteger=1);
   end;
   if not CAN then messbox(MessNoPrintNoProw,MessDostup,48) else begin
     Application.createForm(TSET_PNPRINT,SET_PNPRINT);
     SET_PNPRINT.top:=x;
     SET_PNPRINT.Left:=Y;
     SET_PNPRINT.Btn1.enabled:=SHOW_ZAKUP and SHOW_POST;
     SET_PNPRINT.showModal;
     if SET_PNPRINT.tag>0 then begin
       Wait_Form.StatusBar1.panels[0].text:='���������� � ������...';
       Wait_Form.Gauge1.Progress:=10;
       delay(1);
       Wait_Form.Show;
       Datamodule2.PrintTransaction.Active:=False;
       Datamodule2.PrintPNS.Close;
       Datamodule2.PrintPNS.ParamByname('PN_ID').asinteger:=PN_ID;
       Datamodule2.PrintPNS.ParamByname('SHOP_ID').asinteger:=SHOPID;
       Datamodule2.PrintPNS.Open;
       Wait_Form.Gauge1.Progress:=50;
       delay(1);
       Datamodule2.PrintPN.Close;
       Datamodule2.PrintPN.ParamByname('PN_ID').asinteger:=PN_ID;
       Datamodule2.PrintPN.Open;
       Wait_Form.Gauge1.Progress:=90;
       delay(1);
//       Application.createForm(TPRINT_DOC,PRINT_DOC);
       if SET_PNPRINT.tag=1 then begin
         Wait_Form.Gauge1.Progress:=100;
         delay(1);
         PRINT_DOC.PpPnZak.Reset;
         Wait_Form.Hide;
         PRINT_DOC.PpPnZak.Print;
       end;
       if SET_PNPRINT.tag=2 then begin
         Wait_Form.Gauge1.Progress:=100;
         delay(1);
         PRINT_DOC.PpPnRozn.Reset;
         Wait_Form.Hide;
         PRINT_DOC.PpPnRozn.Print;
       end;
//       PRINT_DOC.destroy;
       Datamodule2.PrintPNS.Close;
       Datamodule2.PrintPN.Close;
       Datamodule2.PrintTransaction.Active:=False;
     end;
     SET_PNPRINT.destroy;
   end;
end;




PROCEDURE SubDoc(TYP:INTEGER;ID:integer);
{�������� ��������� �� ���������..}
VAR
   TYP2,SUBTYP2:integer;
   VARNAME:ansistring;
   ERRNAME:ansistring;
   check_res: integer;
begin
     Application.createForm(TSET_SUBDOC,SET_SUBDOC);
     SET_SUBDOC.Edit1.text:='';
     case TYP of
          1: SET_SUBDOC.Edit1.text:='��������� ���������';
          2: SET_SUBDOC.Edit1.text:='����';
          3: SET_SUBDOC.Edit1.text:='��������� ���������';
          4: SET_SUBDOC.Edit1.text:='��� ��������';
          5: SET_SUBDOC.Edit1.text:='��������� �����������';
          6: SET_SUBDOC.Edit1.text:='��������� ����������� �����';
          7: SET_SUBDOC.Edit1.text:='��� ����������';
     end;
     SET_SUBDOC.showModal;
     if SET_SUBDOC.tag>0 then begin
        TYP2:=SET_SUBDOC.MemSubDoc.fieldByname('TYP').asinteger;
        SUBTYP2:=SET_SUBDOC.MemSubDoc.fieldByname('ID').asinteger;
        {������ ��������}
        case TYP of
             1: begin {������� �� ��������� ��������� ���������}
                     VARNAME:='PN';
                     ERRNAME:=MessNoSubdocPN;
                end;
             2: begin {������� �� ��������� �����}
                     VARNAME:='ST';
                     ERRNAME:=MessNoSubdocST;
                end;
             3: begin {������� �� ��������� ��������� ���������}
                     VARNAME:='RN';
                     ERRNAME:=MessNoSubdocRN;
                end;
             4: begin {������� �� ��������� ���� ��������}
                     VARNAME:='SPIS';
                     ERRNAME:=MessNoSubdocSPIS;
                end;
             5: begin {������� �� ��������� ��������� ����������}
                     VARNAME:='PER';
                     ERRNAME:=MessNoSubdocPER;
                end;
             6: begin {������� �� ��������� �����}
                     VARNAME:='MAIL';
                     ERRNAME:=MessNoSubdocMail;
                end;
             7: begin {������� �� ��������� ���� ����������}
                     VARNAME:='REMON';
                     ERRNAME:=MessNoSubdocRemon;
                end;
        end;
        case TYP2 of
             0: begin {������ ���������}
                      case SUBTYP2 of
                           1: begin {��� ��������}
                              Datamodule1.IBTransaction2.Active:=False;
                              Datamodule1.IBTransaction2.StartTransaction;
                              ADD_SQL(Datamodule1.IbSaveSQL,'select * FROM SUBDOC_'+VARNAME+'_TO_SPIS(:ID,:SHOP_ID,:US_ID)');
                              Datamodule1.IbSaveSQL.ParamByname('ID').asinteger:=ID;
                              Datamodule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
                              Datamodule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
                              Try
                                 Datamodule1.IbSaveSQL.Open;
                                 if not Datamodule1.IbSaveSQL.eof then begin
                                    Messbox('������ ��� �������� � '+
                                    Datamodule1.IbSaveSQL.fieldByname('SPIS_NUM_FULL').asstring+' �� '+date_sokr(date()),MessSystem,48);
                                 end else messbox(ErrName,MessSystem,48);
                                 Datamodule1.IBTransaction2.Commit;
                              Except
                                    Datamodule1.IBTransaction2.RollBAck;
                                    Messbox(MessErrorOsn,MessError,16);
                              End;
                              Datamodule1.IBTransaction2.Active:=False;
                           end;
                           2: begin {��� ����������}
                              Datamodule1.IBTransaction2.Active:=False;
                              Datamodule1.IBTransaction2.StartTransaction;
                              ADD_SQL(Datamodule1.IbSaveSQL,'select * FROM SUBDOC_'+VARNAME+'_TO_REMON(:ID,:SHOP_ID,:US_ID)');
                              Datamodule1.IbSaveSQL.ParamByname('ID').asinteger:=ID;
                              Datamodule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
                              Datamodule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
                              Try
                                 Datamodule1.IbSaveSQL.Open;
                                 if not Datamodule1.IbSaveSQL.eof then begin
                                    Messbox('������ ��� ���������� � '+
                                    Datamodule1.IbSaveSQL.fieldByname('REMON_NUM_FULL').asstring+' �� '+date_sokr(date()),MessSystem,48);
                                 end else messbox(ErrName,MessSystem,48);
                                 Datamodule1.IBTransaction2.Commit;
                              Except
                                    Datamodule1.IBTransaction2.RollBAck;
                                    Messbox(MessErrorOsn,MessError,16);
                              End;
                              Datamodule1.IBTransaction2.Active:=False;
                           end;
                           3: begin {��� �������� � ����}
                              Datamodule1.IBTransaction2.Active:=False;
                              Datamodule1.IBTransaction2.StartTransaction;
                              ADD_SQL(Datamodule1.IbSaveSQL,'select * FROM SUBDOC_'+VARNAME+'_TO_SWAPBRAK(:ID,:SHOP_ID,:US_ID)');
                              Datamodule1.IbSaveSQL.ParamByname('ID').asinteger:=ID;
                              Datamodule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
                              Datamodule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
                              Try
                                 Datamodule1.IbSaveSQL.Open;
                                 if not Datamodule1.IbSaveSQL.eof then begin
                                    Messbox('������ ��� �������� � ���� � '+
                                    Datamodule1.IbSaveSQL.fieldByname('SWAPBRAK_NUM_FULL').asstring+' �� '+date_sokr(date()),MessSystem,48);
                                 end else messbox(ErrName,MessSystem,48);
                                 Datamodule1.IBTransaction2.Commit;
                              Except
                                    Datamodule1.IBTransaction2.RollBAck;
                                    Messbox(MessErrorOsn,MessError,16);
                              End;
                              Datamodule1.IBTransaction2.Active:=False;
                           end;
                           4: begin {��������� �����������}
                              Datamodule1.IBTransaction2.Active:=False;
                              Datamodule1.IBTransaction2.StartTransaction;
                              ADD_SQL(Datamodule1.IbSaveSQL,'select * FROM SUBDOC_'+VARNAME+'_TO_PER(:ID,:SHOP_ID,:US_ID)');
                              Datamodule1.IbSaveSQL.ParamByname('ID').asinteger:=ID;
                              Datamodule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
                              Datamodule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
                              Try
                                 Datamodule1.IbSaveSQL.Open;
                                 if not Datamodule1.IbSaveSQL.eof then begin
                                    Messbox('������� ��������� ����������� � '+
                                    Datamodule1.IbSaveSQL.fieldByname('PER_NUM_FULL').asstring+' �� '+date_sokr(date()),MessSystem,48);
                                 end else messbox(ErrName,MessSystem,48);
                                 Datamodule1.IBTransaction2.Commit;
                              Except
                                    Datamodule1.IBTransaction2.RollBAck;
                                    Messbox(MessErrorOsn,MessError,16);
                              End;
                              Datamodule1.IBTransaction2.Active:=False;
                           end;
                           5: begin {����}
                              Datamodule1.IBTransaction2.Active:=False;
                              Datamodule1.IBTransaction2.StartTransaction;
                              ADD_SQL(Datamodule1.IbSaveSQL,'select * FROM SUBDOC_'+VarName+'_TO_ST(:ID,:SHOP_ID,:US_ID)');
                              Datamodule1.IbSaveSQL.ParamByname('ID').asinteger:=ID;
                              Datamodule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
                              Datamodule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
                              Try
                                 Datamodule1.IbSaveSQL.Open;
                                 if not Datamodule1.IbSaveSQL.eof then begin
                                    Messbox('������ ���� � '+
                                    Datamodule1.IbSaveSQL.fieldByname('ST_NUM_FULL').asstring+' �� '+date_sokr(date()),MessSystem,48);
                                 end else messbox(ErrName,MessSystem,48);
                                 Datamodule1.IBTransaction2.Commit;
                              Except
                                    Datamodule1.IBTransaction2.RollBAck;
                                    Messbox('������ ��� ��������� ��������� �� ���������!',MessError,16);
                              End;
                              Datamodule1.IBTransaction2.Active:=False;
                           end;
                           7: begin {��������� ����������� �����}
                              Datamodule1.IBTransaction2.Active:=False;
//                              if ((VarName<>'PN') and (VarName<>'ST')) then
//                                messbox('������� �� �����������', messSystem, 48)
//                              else
                              begin

                              Datamodule1.IBTransaction2.StartTransaction;
                              ADD_SQL(Datamodule1.IbSaveSQL,'select * FROM SUBDOC_'+VarName+'_TO_MAIL(:ID,:SHOP_ID,:US_ID)');
                              Datamodule1.IbSaveSQL.ParamByname('ID').asinteger:=ID;
                              Datamodule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
                              Datamodule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
                              Try
                                 Datamodule1.IbSaveSQL.Open;
                                 if not Datamodule1.IbSaveSQL.eof then begin
                                    Messbox('������� ��������� ����������� ����� � '+
                                    Datamodule1.IbSaveSQL.fieldByname('MAIL_NUM_FULL').asstring+' �� '+date_sokr(date()),MessSystem,48);
                                 end else messbox(MessNoSubdocST,MessSystem,48);
                                 Datamodule1.IBTransaction2.Commit;
                              Except
                                on e: eXception do
                                begin
                                    Datamodule1.IBTransaction2.RollBAck;
                                    Messbox(MessErrorOsn+chr(13)+e.message,MessError,16);
                                end;
                              End;
                              Datamodule1.IBTransaction2.Active:=False;
                              end;
                           end;
                      end;
             end;
             1: begin {���������}
                Datamodule1.IBTransaction2.Active:=False;
                Datamodule1.IBTransaction2.StartTransaction;
                ADD_SQL(Datamodule1.IbSaveSQL,'select * FROM SUBDOC_'+VARNAME+'_TO_PN(:ID,:SHOP_ID,:US_ID,:PNTYP_ID)');
                Datamodule1.IbSaveSQL.ParamByname('ID').asinteger:=ID;
                Datamodule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
                Datamodule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
                Datamodule1.IbSaveSQL.ParamByname('PNTYP_ID').asinteger:=SUBTYP2;
                Try
                   Datamodule1.IbSaveSQL.Open;
                   if not Datamodule1.IbSaveSQL.eof then begin
                      Messbox('������� '+SET_SUBDOC.MemSubDoc.fieldByname('NAME').asstring+' � '+
                      Datamodule1.IbSaveSQL.fieldByname('PN_NUM_FULL').asstring+' �� '+date_sokr(date()),MessSystem,48);
                   end  else messbox(ErrName,MessSystem,48);
                   Datamodule1.IBTransaction2.Commit;
                Except
                      Datamodule1.IBTransaction2.RollBAck;
                      Messbox(MessErrorOsn,MessError,16);
                End;
                Datamodule1.IBTransaction2.Active:=False;
             end;
             2: begin {���������}
                Datamodule1.IBTransaction2.Active:=False;
                Datamodule1.IBTransaction2.StartTransaction;
                //��������, �� ���� ������ ���������
                check_res:=1;
                case TYP of
                2: begin
                   ADD_SQL(Datamodule1.IbSaveSQL,'select RES FROM ST_CHECK(:ID)');
                   Datamodule1.IbSaveSQL.ParamByname('ID').asinteger:=ID;
                   Datamodule1.IbSaveSQL.Open;
                   check_res:= Datamodule1.ibsavesql.FieldByName('RES').asinteger;
                   end;

                3: begin
                   ADD_SQL(Datamodule1.IbSaveSQL,'select RES FROM RN_CHECK(:ID)');
                   Datamodule1.IbSaveSQL.ParamByname('ID').asinteger:=ID;
                   Datamodule1.IbSaveSQL.Open;
                   check_res:= Datamodule1.ibsavesql.FieldByName('RES').asinteger;
                   end;
                end;
//��������� ��� �������� ��������� ��������� �� ������������ ��� 11.04.2004 ����� ��������
                if (check_res=0) then
                begin
                    messbox('��������� ��������� �� ����� ���� �������. � ������� ��������� ������ ������� ����.',MessSystem,48);
                end
                else
                begin



                ADD_SQL(Datamodule1.IbSaveSQL,'select * FROM SUBDOC_'+VARNAME+'_TO_RN(:ID,:SHOP_ID,:US_ID,:RNTYP_ID)');
                Datamodule1.IbSaveSQL.ParamByname('ID').asinteger:=ID;
                Datamodule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
                Datamodule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
                Datamodule1.IbSaveSQL.ParamByname('RNTYP_ID').asinteger:=SUBTYP2;
                Try
                   Datamodule1.IbSaveSQL.Open;
                   if not Datamodule1.IbSaveSQL.eof then begin
                      Messbox('������� '+SET_SUBDOC.MemSubDoc.fieldByname('NAME').asstring+' � '+
                      Datamodule1.IbSaveSQL.fieldByname('RN_NUM_FULL').asstring+' �� '+date_sokr(date()),MessSystem,48);
                   end else messbox(ErrName,MessSystem,48);
                   Datamodule1.IBTransaction2.Commit;
                Except
                      Datamodule1.IBTransaction2.RollBAck;
                      Messbox(MessErrorOsn,MessError,16);
                End;
                end;
                Datamodule1.IBTransaction2.Active:=False;
             end;
        end;
     end;
     SET_SUBDOC.Destroy;
end;


procedure SHOW_ANALIZ_PN(PN_ID:integer);
begin
     // ������������� ��������� ������ �� ������ �������
     if NOT CHECK_DOSTUP('$JOU.PN.ANALIZ') then Messbox('�� �� ������ ���� �� ������ ��������� ���������!','����������� �������!',48)
     else begin
       if IS_ANALIZ_PN then messbox('�� ����� ���� ���������� ������� ��������� ���������!',MessSystem,48) else begin
         Application.createForm(TANALIZ_PN,ANALIZ_PN);
         ANALIZ_PN.tag:=PN_ID;
         ANALIZ_PN.showModal;
         ANALIZ_PN.destroy;
       end
     end;
end;

procedure SHOW_ANALIZ_RN(RN_ID:integer);
begin
     // ������������� ��������� ������ �� ������ �������
     if NOT CHECK_DOSTUP('$JOU.RN.ANALIZ') then Messbox('�� �� ������ ���� �� ������ ��������� ���������!','����������� �������!',48)
     else begin
       if IS_ANALIZ_RN then messbox('�� ����� ���� ���������� ������� ��������� ���������!',MessSystem,48) else begin
         Application.createForm(TANALIZ_RN,ANALIZ_RN);
         ANALIZ_RN.tag:=RN_ID;
         ANALIZ_RN.showModal;
         ANALIZ_RN.destroy;
       end
     end;
end;

procedure SHOW_ANALIZ_SPIS(SPIS_ID:integer);
begin
     // ������������� ��������� ������ �� ������ �������
     if NOT CHECK_DOSTUP('$JOU.SPIS.ANALIZ') then Messbox('�� �� ������ ���� �� ������ ���� ��������!','����������� �������!',48)
     else begin
       if IS_ANALIZ_SPIS then messbox('�� ����� ���� ���������� ������� ���� ��������!',MessSystem,48) else begin
         Application.createForm(TANALIZ_SPIS,ANALIZ_SPIS);
         ANALIZ_SPIS.tag:=SPIS_ID;
         ANALIZ_SPIS.showModal;
         ANALIZ_SPIS.destroy;
       end;
     end;
end;

procedure SHOW_MARKETING_TW(TW_ID:integer);
begin
     Application.createForm(TMarketing_TW,Marketing_TW);
     Marketing_TW.tag:=TW_ID;
     Marketing_TW.showModal;
     Marketing_TW.destroy;
end;

Function GetOstList(TW_ID,ListSKL:integer):double;
begin
     DataModule1.OstTransaction.Active:=False;
     DataModule1.QueryOst.close;
     DataModule1.QueryOst.SQL.clear;
     DataModule1.QueryOst.SQL.add('select ost from ost_listost(:TW_ID,:ListSKL)');
     DataModule1.QueryOst.ParamByname('TW_ID').asinteger:=TW_ID;
     DataModule1.QueryOst.ParamByname('ListSKL').asinteger:=ListSKL;
     DataModule1.QueryOst.Open;
     if DataModule1.QueryOst.eof then result:=0
     else result:=DataModule1.QueryOst.fieldByname('OST').asfloat;
     DataModule1.QueryOst.close;
     DataModule1.OstTransaction.Active:=False;
end;

Function GetOst(TW_ID,SKL_ID:integer; FRM_ID: integer):double;
begin
     DataModule1.OstTransaction.Active:=False;
     DataModule1.QueryOst.close;
     DataModule1.QueryOst.SQL.clear;
     if ((FRM_ID<>0) and (skl_ID <> 0)) then
     begin
       if frm_id<0 then
          DataModule1.QueryOst.SQL.add('select ost from ost_now_skl_frm_roz(:TW_ID, :SKL_ID,  :FRM_ID)')
       else
          DataModule1.QueryOst.SQL.add('select ost from ost_now_skl_frm(:TW_ID, :SKL_ID,  :FRM_ID)');

       DataModule1.QueryOst.ParamByname('FRM_ID').asinteger:=FRM_ID;
       DataModule1.QueryOst.ParamByname('SKL_ID').asinteger:=SKL_ID;
     end
     else
     if FRM_ID<>0 then
     begin
       DataModule1.QueryOst.SQL.add('select ost from ost_now_frm(:TW_ID, :FRM_ID)');
       DataModule1.QueryOst.ParamByname('FRM_ID').asinteger:=FRM_ID;
     end
     else
     begin
       if SKL_ID=0 then
       begin
        DataModule1.QueryOst.SQL.add('select ost from ost_now_all(:TW_ID)')
       end
       else
       begin
            DataModule1.QueryOst.SQL.add('select ost from ost_now(:TW_ID,:skl_id)');
            DataModule1.QueryOst.ParamByname('SKL_ID').asinteger:=SKL_ID;
       end;
     end;

     DataModule1.QueryOst.ParamByname('TW_ID').asinteger:=TW_ID;
     DataModule1.QueryOst.Open;
     if DataModule1.QueryOst.eof then result:=0
     else result:=DataModule1.QueryOst.fieldByname('OST').asfloat;
     DataModule1.QueryOst.close;
     DataModule1.OstTransaction.Active:=False;
end;


Function GetSaleOst(TW_ID,SKL_ID:integer):double;
begin
     DataModule1.OstTransaction.Active:=False;
     DataModule1.QueryOst.close;
     DataModule1.QueryOst.SQL.clear;
     DataModule1.QueryOst.SQL.add('select ost from ost_sale_now(:TW_ID,:skl_id)');
     DataModule1.QueryOst.ParamByname('SKL_ID').asinteger:=SKL_ID;
     DataModule1.QueryOst.ParamByname('TW_ID').asinteger:=TW_ID;
     DataModule1.QueryOst.Open;
     if DataModule1.QueryOst.eof then result:=0
     else result:=DataModule1.QueryOst.fieldByname('OST').asfloat;
     DataModule1.QueryOst.close;
     DataModule1.OstTransaction.Active:=False;
end;


Function GetZoneOst(TW_ID,skl_id, ZONE_ID:integer):double;
begin
     DataModule1.OstTransaction.Active:=False;
     DataModule1.QueryOst.close;
     DataModule1.QueryOst.SQL.clear;

     DataModule1.QueryOst.SQL.add('select ost from zone_ost_now(:TW_ID, :skl_id, :zone_id)');
     DataModule1.QueryOst.ParamByname('zone_ID').asinteger:=ZONE_ID;
     DataModule1.QueryOst.ParamByname('skl_ID').asinteger:=SKL_ID;
     DataModule1.QueryOst.ParamByname('TW_ID').asinteger:=TW_ID;
     DataModule1.QueryOst.Open;
     if DataModule1.QueryOst.eof then result:=0
     else result:=DataModule1.QueryOst.fieldByname('OST').asfloat;
     DataModule1.QueryOst.close;
     DataModule1.OstTransaction.Active:=False;
end;

Function GetShopOst(TW_ID,SHOP_ID, ZONE_TYPE, ZONE_CLOSED:integer):double;
begin
     DataModule1.OstTransaction.Active:=False;
     DataModule1.QueryOst.close;
     DataModule1.QueryOst.SQL.clear;

     DataModule1.QueryOst.SQL.add('select ost from shop_ost_now(:TW_ID,:shop_id, :zone_type, :zone_closed)');
     DataModule1.QueryOst.ParamByname('shop_ID').asinteger:=shop_ID;
     DataModule1.QueryOst.ParamByname('TW_ID').asinteger:=TW_ID;
     if ZONE_TYPE<>-1 then
        DataModule1.QueryOst.ParamByname('ZONE_TYPE').asinteger:=ZONE_TYPE;
     if zone_closed<>-1 then
        DataModule1.QueryOst.ParamByname('ZONE_CLOSED').asinteger:=ZONE_closed;
     DataModule1.QueryOst.Open;
     if DataModule1.QueryOst.eof then result:=0
     else result:=DataModule1.QueryOst.fieldByname('OST').asfloat;
     DataModule1.QueryOst.close;
     DataModule1.OstTransaction.Active:=False;
end;
{������� ��������� ������������� �����, ���� ���� -���������� ID � �������,
 ���� ��� - ���������� ����������������}
//isAdminMode �������� - ����� �� �������������� ����� ��������� ��� ���.
//�������������, ��� ���, �� � ������� ����. ���� ����� ��������� �������������� �����
//isDialogMode �������� - ����� �� ��������� ���-�� ���������� ��� ��� ������� ��� ��������
function GET_DISKONT(CARD_NUM:ansistring; VAR DISKONT_PERCENT:double;VAR KLN_ID:integer;
          VAR KLN_FULL:ansistring; Const isAdminMode:boolean = False;
           Const isDialogMode:boolean = True; const SALE_SUMM: double = 0;  isAutoRegister: boolean = false):integer;
var
   r:double;
   diap1,diap2:integer;
   card_name:string;
   cfg_id:integer;
   default_kln:integer;
   uch:integer;
   usl:integer;
   usl_summ:double;
//   CanReg:boolean;
   N_CARD_NUM:integer;
   s:string;
   isCardDelivered : boolean; //�������, ������ ����� ��� ���
   isEmptyResult : boolean; //�������, ��� ���� ������ ������� ������, � �� ������ ����������
//��������� �������.�������� �� ������ "����� ����� ���� ���������������� ��� ���"
function canCARD_REG: boolean;
begin
 result := false;
 OPEN_SQL(DataModule1.WorkDiskont,'select * from cfg where CFG_NAME="CARD_REG"');
 if not DataModule1.WorkDiskont.eof then
  begin
    //������ ����-���������,������������� ����� ��� ���
    while not DataModule1.WorkDiskont.eof do
     begin
       diap1:=strtoint(argc(DataModule1.WorkDiskont.fieldByname('cfg_value').asstring,3));
       diap2:=strtoint(argc(DataModule1.WorkDiskont.fieldByname('cfg_value').asstring,4));
       if (N_CARD_NUM>=diap1) and (N_CARD_NUM<=diap2) and
        (DataModule1.WorkDiskont.fieldbyname('cfg_set2').asinteger=1) then
       begin
         s:=DataModule1.WorkDiskont.fieldByname('cfg_value').asstring;
         usl:=strtoint(argc(s,1)); // ������� ������ �����
         usl_summ:=FixedStringToDouble(argc(s,5));
         card_name:=DataModule1.WorkDiskont.fieldByname('CFG_BIG').asstring;
         cfg_id:=DataModule1.WorkDiskont.fieldByname('CFG_ID').asinteger;
         default_kln:=DataModule1.WorkDiskont.fieldByname('CFG_SET1').asinteger;
         uch:=strtoint(argc(s,2));
         result := true;
       end;
       DataModule1.WorkDiskont.next;
     end; //while
  end; //������ ����
end; //function
//============================

// ������� �������������� ����������� �����. ��������� - ID ����� �����.
//������� ��� ������� ���������� �������������� ������������ �� ������ ������� 
function AutoRegister_CARD: longint;
begin
 result := -1;
 if uch=2 then
  begin
    // ��������� ���� - �������������� ����� ������ ������ �����
  end
 else
  begin
   // ���� �� �����������
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
    KLN_ID:=default_kln; // ������ �� ��������� ��� ������ �����
    if KLN_ID>=0 then
     begin
       // ������������ �������� ��������������� �������� �������
       {������������ ����� �����}
       IBSAVE_CLEAR;
       IBSAVE_ADD('CARD_NUM',CARD_NUM);
       IBSAVE_ADD('REG_USER_ID',USERID);
       IBSAVE_ADD('SHOP_ID',SHOPID);
       IBSAVE_ADD('KLN_ID',KLN_ID);
       IBSAVE_ADD('REG_DATE',Now());
       IBSAVE_ADD('CARD_OSN','�������������� ����������� �����!');
       if usl=2 then IBSAVE_ADD('CARD_ADDSUMM',usl_summ); // ��������� ����� �� �����
       result:=IBSAVE_DOC('CARD',-1);
       if result>0 then
        begin
         // ������������ �������� �����
         if usl=1 then
          begin
           // ��������� ������������� ������ ��� �����������
           IBSAVE_CLEAR;
           IBSAVE_ADD('CARDSKID_ID',strtoint(argc(s,6)));
           IBSAVE_ADD('CARD_ID',result);
           if IBSAVE_DOC('CARDSKIDLINK',-1)<0 then r:=sqrt(-1);
           // ������������� ������ ���������
          end;
         KLN_FULL:='������� �� ����� � '+CARD_NUM;
        end //result>0
       else r:=SQRT(-1);
     end //KLN_ID >0
    else r:=SQRT(-1);
    Datamodule1.IBTransaction2.Commit;
    Datamodule1.IBTransaction2.Active:=False;
   except
     Datamodule1.IBTransaction2.Rollback;
     Messbox('������ ��� ����������� ����� �����!',MessSystem,48);
   end;
   Datamodule1.IBTransaction2.Active:=False;
end; // ������� �������������� ����������� �����.
end;



//============================
begin //get_diskont
 try
   N_CARD_NUM:=strtoint(CARD_NUM);
 Except
   N_CARD_NUM:=0;
 end;
 isCardDelivered := false; //�������, ������ ����� ��� ���
 isEmptyResult := false; //�������, ��� ���� ������ ������� ������, � �� ������ ����������
 KLN_ID:=-1;
 KLN_FULL:='';
 result:=-1;
 DISKONT_PERCENT:=0;
 //���� ����� � ������� ����
 DataModule1.DiskontTransaction.Active:=False;
 DataModule1.QueryDiskont.Close;
 DataModule1.QueryDiskont.SQL.clear;
 DataModule1.QueryDiskont.SQL.add('select * from CARD WHERE CARD_NUM=:CARD_NUM');
 DataModule1.QueryDiskont.ParamByname('CARD_NUM').asstring:=CARD_NUM;
 DataModule1.QueryDiskont.Open;
 if not DataModule1.QueryDiskont.eof then //����� ����� ����,
  begin
     result:=DataModule1.QueryDiskont.fieldByname('CARD_ID').asinteger;
     //�������, ������ ����� ��� ���
     isCardDelivered := not DataModule1.QueryDiskont.fieldByname('CARD_DATE').isNull;
     if isDialogMode then //��� ����� ������� - ����� ����������
      if not isCardDelivered then //����� �� ������
       begin
        //������: ������ �����?
        if Messbox('���������� ����� � ������� '+CARD_NUM+
             ' �� ������! ������ �?',MessSystem,4+48+256)=7 then //answer "NO"
          isEmptyResult := true  //�� ���, �� ������� ��� ������
        else
         begin //������ ������ ����� � ����� ���� �� ��������� ������
           //������ �����
           IBSAVE_CLEAR;
           IBSAVE_ADD('CARD_DATE',Now());
           IBSAVE_ADD('US_ID', USERID);
           IBSAVE_DOC('CARD',result);
           Datamodule1.IBTransaction2.Commit;
           Datamodule1.IBTransaction2.Active:=False;


           Application.createForm(TFCARDDelivery, FCARDDelivery);
           FCARDDelivery.tag:=result;
           FCARDDelivery.ConfirmModeShowModal; //������ � ������ ������������� ������ ����� �� �������
//           FCARDDelivery.ShowModal; //������ � ������ ������ �����
           FCARDDelivery.Destroy;
         end;
       end //����� �� ������
      else //����� ������
       begin
         if not isAdminMode then //���� ��� ����� �������, �� ������ ������������� ������ �������
          begin
           Application.createForm(TFCARDDelivery, FCARDDelivery);
           FCARDDelivery.tag:=result;
           FCARDDelivery.ConfirmModeShowModal; //������ � ������ ������������� ������ ����� �� �������
            //����� ���� ��������
           if FCARDDelivery.Tag <> result then
            result := FCARDDelivery.Tag;


           FCARDDelivery.Destroy;
          end
       end;
   end //����� ����� ����
  else //����� ����� ���
   begin
    if not isDialogMode  then //��� �� ����� ������� - ������� ��� ������
         isEmptyResult := true
    else
      begin //��� ����� ������� - �������� ������
       //���������, ����� �� ����� ���� ����������������?
       //���������� ���������, ������������� �� ����� ��� � �������� ����
       if not CanCARD_REG() then //����� �� �.�.���������������� - ������� �� ���� � ������� ��� ������
         begin
           messbox('������ ����������� ����� �� ������ � �������� �������������! '+
                    '�������� �� ���� �������������!', MessSystem,48);
           isEmptyResult := true;
         end //����� �� �.�.����������������
       else
        begin //����� �.�. ����������������
         if Messbox('���������� ����� � ������� '+CARD_NUM+' �� ����������������! ���������������� �?',
              MessSystem,4+256)=7 then //answer "NO". ����������, ���������������� �����?
          begin //�� ���� �������������� - ������� ��� ������
           isEmptyResult := true;
          end //�� ���� �������������� - ������� ��� ������
         else  //���� ��������������- �������������� �����������,������������ ������ � ����,
          begin // + ������ �������,���� ����.
            //�������������� ����������� ��������
            result := AutoRegister_CARD();
            //�������� ���������� - ��������� � ���������
            //���� ������������ ������ �������?
            if  isAutoRegister=false then
            begin


            if (isAdminMode) and (result>0) then //���� ��� ����� ������, � ����� ����������������
             begin
              //...�� ������ ����������� �����
              Application.createForm(TFRegister, FRegister);
              FRegister.tag:=result;
              FRegister.ShowModal;
              FRegister.Destroy;
             end
            else
              begin //������ ������ ����� � ����� ���� �� ��������� ������
               IBSAVE_CLEAR;
               IBSAVE_ADD('CARD_DATE',Now());
               IBSAVE_ADD('US_ID', USERID);
               IBSAVE_DOC('CARD',result);
               Datamodule1.IBTransaction2.Commit;
               Datamodule1.IBTransaction2.Active:=False;


               Application.createForm(TFCARDDelivery, FCARDDelivery);
               FCARDDelivery.tag:=result;
//               FCARDDelivery.ShowModal; //������ � ������ ������ �����
               FCARDDelivery.ConfirmModeShowModal; //������ � ������ ������ �����
               FCARDDelivery.Destroy;
              end;
             end; // isAutoRegister
          end; //���� ��������������
        end; //����� �.�. ����������������
      end; //��� ����� ������� - �������� ������
   end; //����� ����� ���

  DataModule1.DiskontTransaction.Active:=False;
  //��� ������ ���������� - ������ ���� ������ ������ ��� ����� � ������� ����������
  if not isEmptyResult then //��� ����� ����� 2 �� �����:������ ������ �� �����
   begin
    //������������� ������ �� ������, ���� ������ ����������
    //��� �������� (������) ������ ����������� ����. ����� � �� ���������
    DataModule1.QueryDiskont.Close;
    DataModule1.QueryDiskont.SQL.clear;
    DataModule1.QueryDiskont.SQL.add('select * from CARD WHERE CARD_NUM=:CARD_NUM');
    DataModule1.QueryDiskont.ParamByname('CARD_NUM').asstring:=CARD_NUM;
    DataModule1.QueryDiskont.Open;
    //�������, ������ ����� ��� ���
    isCardDelivered := not DataModule1.QueryDiskont.fieldByname('CARD_DATE').isNull;
    KLN_ID:=DataModule1.QueryDiskont.fieldByname('KLN_ID').asinteger;

    DataModule1.QueryDiskont.Close;
    DataModule1.QueryDiskont.SQL.clear;
    DataModule1.QueryDiskont.SQL.add('select KLN_FULL FROM KLN_DATA( :KLN_ID)');
    DataModule1.QueryDiskont.ParamByname('KLN_ID').asinteger:=KLN_ID;
    DataModule1.QueryDiskont.Open;
    KLN_FULL:=DataModule1.QueryDiskont.fieldByname('KLN_FULL').asstring;

    //��������! ���� ����� �� ������, �� ������� ������ ������ ���������� �������,
    //����� � ��������� ��������� ��� (������) �� �����������
    if isCardDelivered then
     begin
      DataModule1.QueryDiskont.Close;
      DataModule1.QueryDiskont.SQL.clear;
      DataModule1.QueryDiskont.SQL.add('select SKID_PERCENT from GET_CARDSKID( :CARD_ID , :SALE_SUMM )');
      DataModule1.QueryDiskont.ParamByname('CARD_ID').asinteger:=result;
      DataModule1.QueryDiskont.ParamByname('SALE_SUMM').asfloat:=sale_summ;
      DataModule1.QueryDiskont.Open;
      DISKONT_PERCENT:=DataModule1.QueryDiskont.fieldByname('SKID_PERCENT').asfloat;
     end; //����� ������: ��������� ������� ������
   end; //����� ����� 2:������ ������ �� �����.
  DataModule1.QueryDiskont.Close;
  DataModule1.DiskontTransaction.Active:=False;
end;


Procedure SEND_MAIL(TYP:integer;TXT:ansistring);
{TYP- ��� �����  1 - �������, �� �� �������
 TXT - �����}
begin

end;


Function SHOP_KLN_DEFAULT(SHOP_ID,RTYP_ID:integer):integer;
{������ ����� �� ��������� ��� ��������}
begin
     DataModule1.ShopDefaultTransaction.Active:=False;
     ADD_SQL(DataModule1.QueryShopDefault,'select cfg_value from cfg where cfg_name="DEFAULT_SHOP_RNTYP" and cfg.cfg_set1=:RTYP_ID '+
     ' and cfg.cfg_set2=1 and cfg.cfg_set3=:SHOP_ID');
     DataModule1.QueryShopDefault.ParamByname('SHOP_ID').asinteger:=SHOP_ID;
     DataModule1.QueryShopDefault.ParamByname('RTYP_ID').asinteger:=RTYP_ID;
     DataModule1.QueryShopDefault.Open;
     if DataModule1.QueryShopDefault.eof then result:=DEFAULT_KLIENT
     else result:=DataModule1.QueryShopDefault.fieldByname('CFG_VALUE').asinteger;
     DataModule1.QueryShopDefault.Close;
     DataModule1.ShopDefaultTransaction.Active:=False;
end;

Function SHOP_FRM_DEFAULT(SHOP_ID,RTYP_ID:integer):integer;
{������ ������� �� �������� ��� ���������}
begin
     DataModule1.ShopDefaultTransaction.Active:=False;
     ADD_SQL(DataModule1.QueryShopDefault,'select cfg_value from cfg where cfg_name="DEFAULT_SHOP_RNTYP" and cfg.cfg_set1=:RTYP_ID '+
     ' and cfg.cfg_set2=2 and cfg.cfg_set3=:SHOP_ID');
     DataModule1.QueryShopDefault.ParamByname('SHOP_ID').asinteger:=SHOP_ID;
     DataModule1.QueryShopDefault.ParamByname('RTYP_ID').asinteger:=RTYP_ID;
     DataModule1.QueryShopDefault.Open;
     if DataModule1.QueryShopDefault.eof then result:=DEFAULT_KLIENT
     else result:=DataModule1.QueryShopDefault.fieldByname('CFG_VALUE').asinteger;
     DataModule1.QueryShopDefault.Close;
     DataModule1.ShopDefaultTransaction.Active:=False;
end;

procedure SHOP_RVID_DEFAULT(SHOP_ID,RTYP_ID:integer;var RVID_ID:integer;VAR RVID_KLN:integer;VAR RVID_SUBKLN:integer);
{������ ������� �� �������� ��� ���������}
begin
     DataModule1.ShopDefaultTransaction.Active:=False;
     ADD_SQL(DataModule1.QueryShopDefault,'select * from cfg where cfg_name="DEFAULT_SHOP_RNTYP" and cfg.cfg_set1=:RTYP_ID '+
     ' and cfg.cfg_set3=:SHOP_ID');
     DataModule1.QueryShopDefault.ParamByname('SHOP_ID').asinteger:=SHOP_ID;
     DataModule1.QueryShopDefault.ParamByname('RTYP_ID').asinteger:=RTYP_ID;
     DataModule1.QueryShopDefault.Open;
     if DataModule1.QueryShopDefault.eof then begin
        RVID_ID:=1;
        RVID_KLN:=0;
        RVID_SUBKLN:=0;
     end else begin
        if DataModule1.QueryShopDefault.locate('cfg_set2',3,[]) then begin
          RVID_ID:=DataModule1.QueryShopDefault.fieldByname('CFG_VALUE').asinteger;
          if DataModule1.QueryShopDefault.locate('cfg_set2',4,[]) then begin
          end else begin
             RVID_KLN:=DataModule1.QueryShopDefault.fieldByname('CFG_VALUE').asinteger;
             ADD_SQL(DataModule1.QueryShopDefault,'select * from rvid where rvid_id=:rvid_id');
             DataModule1.QueryShopDefault.ParamByname('rvid_id').asinteger:=RVID_ID;
             DataModule1.QueryShopDefault.Open;
             RVID_SUBKLN:=DataModule1.QueryShopDefault.fieldByname('rvid_subkln').asinteger;
             if RVID_SUBKLN=0 then RVID_KLN:=-1;
          end;
        end else begin
           RVID_ID:=1;
           RVID_KLN:=0;
           RVID_SUBKLN:=0;
        end;
     end;
     DataModule1.QueryShopDefault.Close;
     DataModule1.ShopDefaultTransaction.Active:=False;
end;



Function SHOP_KLN_DEFAULTPN(SHOP_ID,PTYP_ID:integer):integer;
{������ ����� �� ��������� ��� ��������}
begin
     DataModule1.ShopDefaultTransaction.Active:=False;
     ADD_SQL(DataModule1.QueryShopDefault,'select cfg_value from cfg where cfg_name="DEFAULT_SHOP_PNTYP" and cfg.cfg_set1=:PTYP_ID '+
     ' and cfg.cfg_set2=1 and cfg.cfg_set3=:SHOP_ID');
     DataModule1.QueryShopDefault.ParamByname('SHOP_ID').asinteger:=SHOP_ID;
     DataModule1.QueryShopDefault.ParamByname('PTYP_ID').asinteger:=PTYP_ID;
     DataModule1.QueryShopDefault.Open;
     if DataModule1.QueryShopDefault.eof then result:=DEFAULT_KLIENT
     else result:=DataModule1.QueryShopDefault.fieldByname('CFG_VALUE').asinteger;
     DataModule1.QueryShopDefault.Close;
     DataModule1.ShopDefaultTransaction.Active:=False;
end;

Function SHOP_FRM_DEFAULTPN(SHOP_ID,PTYP_ID:integer):integer;
{������ ������� �� �������� ��� ���������}
begin
     DataModule1.ShopDefaultTransaction.Active:=False;
     ADD_SQL(DataModule1.QueryShopDefault,'select cfg_value from cfg where cfg_name="DEFAULT_SHOP_PNTYP" and cfg.cfg_set1=:PTYP_ID '+
     ' and cfg.cfg_set2=2 and cfg.cfg_set3=:SHOP_ID');
     DataModule1.QueryShopDefault.ParamByname('SHOP_ID').asinteger:=SHOP_ID;
     DataModule1.QueryShopDefault.ParamByname('PTYP_ID').asinteger:=PTYP_ID;
     DataModule1.QueryShopDefault.Open;
     if DataModule1.QueryShopDefault.eof then result:=DEFAULT_KLIENT
     else result:=DataModule1.QueryShopDefault.fieldByname('CFG_VALUE').asinteger;
     DataModule1.QueryShopDefault.Close;
     DataModule1.ShopDefaultTransaction.Active:=False;
end;

Procedure My_Lock;
begin
     Application.createForm(TFORM_LOCK,FORM_LOCK);
     FORM_LOCK.showModal;
     FORM_LOCK.destroy;
end;


function CHECK_DOSTUP(USDOSTUP_NAME:ansistring):boolean;
begin
  Datamodule1.CheckDostTransaction.Active:=False;
  Datamodule1.QueryCheckDost.close;
  Datamodule1.QueryCheckDost.ParamByname('USGROUP_ID').asinteger:=USER_USGROUP;
  Datamodule1.QueryCheckDost.ParamByname('USDOSTUP_NAME').asstring:=USDOSTUP_NAME;
  Datamodule1.QueryCheckDost.open;
  if Datamodule1.QueryCheckDost.eof then result:=false
                                    else result:=true;
  Datamodule1.CheckDostTransaction.Commit;                                  
end;
{
function CHECK_USER_DOSTUP(USDOSTUP_NAME:ansistring):integer;
begin
{
SELECT CFG_ID , CFG_SET2 FROM CFG
WHERE CFG_NAME=:USDOSTUP_NAME
AND CFG_SET1=:USER_ID
}
{
  result:=-1;
  Datamodule1.CheckDostTransaction.Active:=False;
  Datamodule1.QueryCheckUserDostup.close;
  Datamodule1.QueryCheckUserDostup.ParamByname('USER_ID').asinteger:=USERID;
  Datamodule1.QueryCheckUserDostup.ParamByname('USDOSTUP_NAME').asstring:=USDOSTUP_NAME;
  Datamodule1.QueryCheckUserDostup.open;
  if Datamodule1.QueryCheckUserDostup.eof then result:=-1
                                    else result:=Datamodule1.QueryCheckUserDostup.fieldbyname('CFG_SET2').asinteger;
  Datamodule1.CheckDostTransaction.Commit;
end;
}

function CHECK_USER_DOSTUP(USDOSTUP_NAME:ansistring; _user_id: integer):integer;
begin
{
SELECT CFG_ID , CFG_SET2 FROM CFG 
WHERE CFG_NAME=:USDOSTUP_NAME
AND CFG_SET1=:USER_ID
}
  if (_user_id=0) then
        _user_id:=USERID;

  result:=-1;
  Datamodule1.CheckDostTransaction.Active:=False;
  Datamodule1.QueryCheckUserDostup.close;
  Datamodule1.QueryCheckUserDostup.ParamByname('USER_ID').asinteger:=_user_id;
  Datamodule1.QueryCheckUserDostup.ParamByname('USDOSTUP_NAME').asstring:=USDOSTUP_NAME;
  Datamodule1.QueryCheckUserDostup.open;
  if Datamodule1.QueryCheckUserDostup.eof then result:=-1
                                    else result:=Datamodule1.QueryCheckUserDostup.fieldbyname('CFG_SET2').asinteger;
  Datamodule1.CheckDostTransaction.Commit;
end;


Procedure Edit_RN(RN_ID:integer);
// ��������� �������� �������������� ���������
var
   RTYP:integer;
   a,b,c:integer;
   wozw:integer;
begin
  // ���������� ���
  RTYP:=-1;
  Datamodule1.EditTransaction.Active:=False;
  ADD_SQL(Datamodule1.QueryEdit,'select rntyp_id,(select min(wozw_id) from rns where rn_id=rn.rn_id) as wozw from rn where rn_id=:rn_id');
  Datamodule1.QueryEdit.Parambyname('RN_ID').asinteger:=RN_ID;
  Datamodule1.QueryEdit.Open;
  wozw:=Datamodule1.QueryEdit.fieldbyname('WOZW').asinteger;
  RTYP:=Datamodule1.QueryEdit.fieldbyname('RNTYP_ID').asinteger;
  Datamodule1.QueryEdit.close;
  Datamodule1.EditTransaction.Active:=False;
  if RTYP>0 then begin
     b:=-1;
     for a:=1 to CntRntyp do if RTYP=RNTYP[a].ID then begin
        b:=RNTYP[a].ID;
        c:=a;
     end;
     if b>-1 then begin
        if wozw>0 then begin
          // ������ ���������
          if IS_EDIT_WOZW then Messbox('�� ��� �������������� ��� ������������ ��� �������� �� ����������!',MessSYstem,48) else begin
            Application.CreateForm(TDoc_RN_WOZW,Doc_RN_WOZW);
            Doc_RN_WOZW.tag:=RN_ID;
            Doc_RN_WOZW.Panel1.tag:=B;
            Doc_RN_WOZW.Toolbar1.tag:=c;
            Doc_RN_WOZW.showModal;
            Doc_RN_WOZW.destroy;
          end;
        end else begin
          // ���������
          if IS_EDIT_RN then Messbox('�� ��� �������������� ��� ������������ ��������� ���������!',MessSYstem,48) else begin
            Application.CreateForm(TDoc_RN,Doc_RN);
            Doc_RN.tag:=RN_ID;
            Doc_RN.ToolBar1.Tag:=B;
            Doc_RN.StatusBar1.tag:=c;
            Doc_RN.showModal;
            Doc_RN.destroy;
          end;
        end
     end;
  end;
end;

Procedure Edit_PSORT(PSORT_ID:integer);
begin
    if IS_EDIT_PSORT then Messbox('�� ��� �������������� ��� ������������ ��� �����������!',MessSYstem,48) else begin
        Application.CreateForm(TDoc_PSORT,Doc_PSORT);
        Doc_PSORT.tag:=PSORT_ID;
        Doc_PSORT.showModal;
        Doc_PSORT.destroy;
    end;
end;


Procedure Edit_SPIS(SPIS_ID:integer);
var wozw: integer;
begin
wozw:=0;
// ���������� ���

  Datamodule1.EditTransaction.Active:=False;
  ADD_SQL(Datamodule1.QueryEdit,'select sum(wozw_id) as WOZW from spiss where spiss.spis_id = :SPIS_ID');
  Datamodule1.QueryEdit.Parambyname('SPIS_ID').asinteger:=SPIS_ID;
  Datamodule1.QueryEdit.Open;
  wozw:=Datamodule1.QueryEdit.fieldbyname('WOZW').asinteger;
  Datamodule1.QueryEdit.close;
  Datamodule1.EditTransaction.Active:=False;
  if wozw<=0 then
   begin
        if IS_EDIT_SPIS then Messbox('�� ��� �������������� ��� ������������ ��� ��������!',MessSYstem,48) else
    begin
        Application.CreateForm(TDoc_SPIS,Doc_SPIS);
        Doc_SPIS.tag:=SPIS_ID;
        Doc_SPIS.showModal;
        Doc_SPIS.destroy;
    end;
   end else
   begin
       // ������ ��������
    if IS_EDIT_WOZW then Messbox('�� ��� �������������� ��� ������������ ������ ���� ��������!',MessSYstem,48) else
      begin
        Application.CreateForm(TDoc_SPIS_wozw,Doc_SPIS_wozw);
        Doc_SPIS_wozw.tag:=SPIS_ID;
        Doc_SPIS_wozw.showModal;
        Doc_SPIS_wozw.destroy;
      end;
   end;


end;

Procedure Edit_PER(PER_ID:integer);
begin
    if IS_EDIT_PER then Messbox('�� ��� �������������� ��� ������������ ��������� �����������!',MessSYstem,48) else begin
        Application.CreateForm(TDoc_PER,Doc_PER);
        Doc_PER.tag:=PER_ID;
        Doc_PER.showModal;
        Doc_PER.destroy;
    end;
end;

Procedure Edit_NPZ(NPZ_ID:integer);
begin
end;


Procedure Edit_PN(PN_ID:integer);
// ��������� �������� �������������� ���������
var
   PTYP:integer;
   a,b,c:integer;
   wozw:integer;
begin
  // ���������� ���
  PTYP:=-1;
  Datamodule1.EditTransaction.Active:=False;
  ADD_SQL(Datamodule1.QueryEdit,'select pntyp_id,(select min(wozw_id) from pns$ where pn$_id=pn$.pn$_id) as wozw  from pn$ where pn$_id=:pn_id');
  Datamodule1.QueryEdit.Parambyname('PN_ID').asinteger:=PN_ID;
  Datamodule1.QueryEdit.Open;
  wozw:=Datamodule1.QueryEdit.fieldbyname('WOZW').asinteger;
  PTYP:=Datamodule1.QueryEdit.fieldbyname('PNTYP_ID').asinteger;
  Datamodule1.QueryEdit.close;
  Datamodule1.EditTransaction.Active:=False;
  if PTYP>0 then begin
     b:=-1;
     for a:=1 to CntPntyp do if PTYP=PNTYP[a].ID then begin
        b:=PNTYP[a].ID;
        c:=a;
     end;
     if b>-1 then begin
        if wozw>0 then begin
          // ������ ���������
          if IS_EDIT_WOZW_PN then Messbox('�� ��� �������������� ��� ������������ ��� �������� ����������!',MessSYstem,48) else begin
            Application.CreateForm(TDoc_PN_WOZW,Doc_PN_WOZW);
            Doc_PN_WOZW.tag:=PN_ID;
            Doc_PN_WOZW.Panel1.tag:=B;
            Doc_PN_WOZW.Toolbar1.tag:=c;
            Doc_PN_WOZW.showModal;
            Doc_PN_WOZW.destroy;
          end;
        end else begin
          // ���������
          if IS_EDIT_PN then Messbox('�� ��� �������������� ��� ������������ ��������� ���������!',MessSYstem,48) else begin
            Application.CreateForm(TDoc_PN2,Doc_PN2);
            Doc_PN2.tag:=PN_ID;
            Doc_PN2.StatusBar1.tag:=b;
            Doc_PN2.showModal;
            Doc_PN2.destroy;
          end;
        end;
     end;
  end;
end;


procedure clear_cash;
begin
     COUNT_CASH_TOWAR:=-1;

end;

procedure add_cash(SW1:ansistring;Cena,KOL:double;Otdel:integer;DocName: string;FRMID: integer; tw_skid:double; DISKONT_NUM: integer; Ed: string; skl_name: string);
var
  a,b,c:integer;
begin
  if (Cena>=0) and (Kol>0) and (Otdel>0) and (Otdel<8) then begin
     inc(COUNT_CASH_TOWAR);
//     CASH_TOWAR_NAME[COUNT_CASH_TOWAR]:=Sw1;
     CASH_TOWAR[COUNT_CASH_TOWAR].otdel:=Otdel;
     CASH_TOWAR[COUNT_CASH_TOWAR].koli:=KOL;
     CASH_TOWAR[COUNT_CASH_TOWAR].Cena:=Cena;
     CASH_TOWAR[COUNT_CASH_TOWAR].towar := SW1;
     CASH_TOWAR[COUNT_CASH_TOWAR].DocName := DocName;
     CASH_TOWAR[COUNT_CASH_TOWAR].FrmID := FrmID;
     CASH_TOWAR[COUNT_CASH_TOWAR].twSkid := tw_skid;
     CASH_TOWAR[COUNT_CASH_TOWAR].DiskontNumber := '';
     if DISKONT_NUM>0 then CASH_TOWAR[COUNT_CASH_TOWAR].DiskontNumber := '��: '+inttostr(DISKONT_NUM);
     CASH_TOWAR[COUNT_CASH_TOWAR].Ed := Ed;
     CASH_TOWAR[COUNT_CASH_TOWAR].SKL_NAME := skl_name;


  end;
end;

function wozw_cash( NDSType: integer;cashType: integer):integer;
var
   a,b:integer;
   mon:double;

   FRM_SUMM: currency;
   arrFRM: array [0..10] of integer;
   cntFrm: integer;
   found: boolean;
begin

 // �������
// assignfile(check_file, 'print_check.txt');
// append(check_file);
// writeln(check_file, '������ ���� ��������');
// writeln(check_file, '������ �������� '+ inttostr(MODEL_KKM));
 result:=0;
 if NOT IS_KKM then BEGIN
    messbox('��� �� ���������!',MessSystem,48);
 END ELSE begin // ��������� ��������, ������ ���� ��� ��������� � ����������
  if MODEL_KKM=1 then begin
     // ������ ���� �������� �� ���-100�
      if Count_cash_towar>13 then messbox('����� ������� � ���� �� ����� ����� 13-��!',MessSystem,48)
      else if ConnectKKM(KKM_COM) <> 1 then
        begin
                messbox('������ ���������� � ���!',MessSystem,48)
        end
      else begin
        // ������� ������ ����
        cbClearSales;
        // ������������� ����� 2 ������ � ������������
        cbSetLinesInSale(2);
        // �������� ����� ������� ������ ������� ����� ������ ����
         cbSetClearBufMode(1);
        // ������������� ������ �� ���
        cbSetCreditMode(0);
        // ������������� ���� ������ ���� ��������
        cbSetReturnMode(1);
        // ��������� ���
        for a:=0 to Count_cash_towar do begin
            cbAddSale(PChar(CASH_TOWAR[a].towar),b_utils.okrug(CASH_TOWAR[a].cena,2),b_utils.okrug(CASH_TOWAR[a].koli,3),CASH_TOWAR[a].otdel);
        end;
        // ������ ��������
        cbSetCash(0);
        OutKkmError;
        // ������� ���
        KKM_WAIT.Show;
        OutKkmError;
        StartWaiting(1);
        while (WaitingStatus=1) and (not StopFlag) do Application.ProcessMessages;
        StopWaiting;
        OutKkmError;
        DisconnectKKM();
        if StopFlag then Messbox('����� ���� ��� �������.',MessSystem,48)
        else result:=1; // �������� ������ ����
        KKM_WAIT.Hide;
      end;
  end;
  if MODEL_KKM=2 then begin
    // ������ ���� �������� �� �� ����� ���� ��-�
    mon:=0;
    for a:=0 to Count_cash_towar do begin
           Elves_wozw_towar(CASH_TOWAR[a].towar,CASH_TOWAR[a].otdel,b_utils.okrug(CASH_TOWAR[a].cena,2),
           b_utils.okrug(CASH_TOWAR[a].koli,3));
           mon:=mon+b_utils.okrug(CASH_TOWAR[a].cena,2)*b_utils.okrug(CASH_TOWAR[a].koli,3);
    end;
    // ��������� ���
    Elves_CLose_check(0,0);
    result:=1;
  end;

  if MODEL_KKM=3 then begin
    for a := 0 to Count_cash_towar  do
       begin
       checksale[a].Oper1 := cash_towar[a].cena;
       checksale[a].Oper2 := cash_towar[a].koli;
       checksale[a].Section := cash_towar[a].otdel;
       checksale[a].TovGr := 0;
       checksale[a].Name := CASH_TOWAR[a].towar;
//       writeln(check_file, checksale[a].name + ' '+ floattostr(checksale[a].Oper2)+'��/�/�� �� '+ floattostr(checksale[a].Oper1));
       end;


//       writeln(check_file, '���������: '+       CheckTitle.lines[1].Line + ':' +        CheckTitle.lines[2].Line);
//       writeln(check_file, '���: '+       CheckBottom.lines[1].Line + ':' +        CheckBottom.lines[2].Line);
	SetPort(KKM_COM);
       if ReturnP(@CheckTitle,@CheckSale,Count_Cash_Towar + 1 ,@CheckBottom,1)=1 then
        begin
          result := 1;
        end
        else MessageDlg(Errors[GetKKMError],mtInformation,[mbOk],0);
	resetPort;
     end;

    if MODEL_KKM=4 then begin

//    if (FRShtrih.Connect(true)) then
     FRSHtrih.OpenDrawer;     //Connect+Disconnect
     begin


           //����� ���� ��������� ���� ������ ��������� �������, ��������� ������ ����-���������
      cntFrm:=0;

      for a := 0 to Count_cash_towar do
      begin
        if cntFrm =0 then
        begin
        	arrFRM[cntFRM]:=CASH_TOWAR[a].FrmID;
            inc(cntFrm);
        end
        else
        begin
          found:=false;
          for b := 0 to cntFrm do
          begin
             if arrFrm[b] = CASH_TOWAR[a].FrmID then
               begin
				        found:=true;
                break;
               end;

          end;

         if found=false then
         begin
        	arrFRM[cntFRM]:=CASH_TOWAR[a].FrmID;
            inc(cntFrm);
         end;

        end;
      end;

      //���� ������ � ������� ���� - �� �� ������� ���� �������

      	for b := 0 to cntFrm-1 do
      	begin

      		FRShtrih.Clean;
          FRM_SUMM:=0;
      		FRShtrih.FRM_ID:=arrFRM[b];
          FRShtrih.Connect(true, 5); //����������� ���� ��������. ���� 5 ������



      		for a := 0 to Count_cash_towar  do
      		begin
                if CASH_TOWAR[a].FrmID <> arrFrm[b] then
                	continue;
                FRM_SUMM:=FRM_SUMM+cash_towar[a].cena*cash_towar[a].koli;
        		frShtrih.AddOp(CASH_TOWAR[a].towar, cash_towar[a].cena, cash_towar[a].koli, cash_towar[a].Ed);
         	end;

            OutKkmError;
      		FRM_SUMM := round(FRM_SUMM*100) / 100;
            FRShtrih.CheckOpenDocument;   //���� �� ���������� �� ������� �����
      		FRShtrih.SetSumm(FRM_SUMM, NDSType, CashType);
//      		OutKkmError;
      		FRShtrih.ExecuteOP(2);  //���� �� ���������� �� ������� �����
      		FRShtrih.Disconnect;
      		OutKkmError;
         end;


     end;
    end;


 end;

// closefile(check_file);
end;


function print_cash(Mon2,Mon3:double; NDSType: integer;CashType: integer ; Copy: boolean):integer;
var
   a,b:integer;


   Error: integer;
   FRM_SUMM: currency;
   arrFRM: array [0..10] of integer;
   cntFrm: integer;
   found: boolean;
   SkidSumm: double;
//   check_file:  textfile;

begin

 //01 10 2007 - ����� �� ����� ��������� ���
 NDSType:=2;



//  assignfile(check_file, 'print_check.txt');
//  append(check_file);
//  writeln(check_file, '�������� ������� ���. ������ �������� '+ inttostr(Model_KKM));
 result:=0;
 if NOT IS_KKM then BEGIN
    messbox('��� �� ���������!',MessSystem,48);
 END ELSE begin // ��������� ��������, ������ ���� ��� ��������� � ����������
  if MODEL_KKM=1 then begin // ���-100�
      if Count_cash_towar>13 then messbox('����� ������� � ���� �� ����� ����� 13-��!',MessSystem,48)
        else
       if ConnectKKM(KKM_COM) <> 1 then
        begin
                messbox('������ ���������� � ���!',MessSystem,48)
        end
      else
      begin
      // ������� ������ ����
        cbClearSales;
        // ������������� ����� 2 ������ � ������������
        cbSetLinesInSale(2);
        // �������� ����� ������� ������ ������� ����� ������ ����
         cbSetClearBufMode(1);
        // ������������� ������ �� ���
        cbSetCreditMode(0);
        // ������������� ���� ������ ���������� ����
        cbSetReturnMode(0);
        // ��������� ���
        for a:=0 to Count_cash_towar do begin
            cbAddSale(PChar(CASH_TOWAR[a].towar),b_utils.okrug(CASH_TOWAR[a].cena,2),b_utils.okrug(CASH_TOWAR[a].koli,3),CASH_TOWAR[a].otdel);
        end;
        // ������ ��������
        cbSetCash(Mon2);
        OutKkmError;
        // ������� ���
        KKM_WAIT.Show;
        OutKkmError;
        StartWaiting(1);
        while (WaitingStatus=1) and (not StopFlag) do Application.ProcessMessages;
        StopWaiting;
        OutKkmError;
        DisconnectKKM();
        if StopFlag then Messbox('����� ���� ��� �������.',MessSystem,48)
        else result:=1; // �������� ������ ����
        KKM_WAIT.Hide;
      end;
  end;
  if MODEL_KKM=2 then begin
    // ������ ���� �� �� ����� ���� ��-�
    // ������ ���.����������
    if Print_dop_Elves then begin
       for a:=1 to cnt_dop_elves do Elves_Print_String(b_utils.left(arr_dop_elves[a]+b_utils.space(24),24));
    end;
    Print_dop_Elves:=False;
    // �������� ��� ���
    for a:=0 to Count_cash_towar do begin
           Elves_Reg_towar(CASH_TOWAR[a].towar,CASH_TOWAR[a].otdel,b_utils.okrug(CASH_TOWAR[a].cena,2),
           b_utils.okrug(CASH_TOWAR[a].koli,3),0);
    end;
    // ��������� ���
    Elves_CLose_check(Mon2,0);
    result:=1; // �������� ������ ����
  end;


    if MODEL_KKM=4 then begin

     FRSHtrih.OpenDrawer;   //Connect+Disconnect

     begin
      //����� ���� ��������� ���� ������ ��������� �������, ��������� ������ ����-���������
      cntFrm:=0;

      for a := 0 to Count_cash_towar do
      begin
        if cntFrm =0 then
        begin
        	arrFRM[cntFRM]:=CASH_TOWAR[a].FrmID;
            inc(cntFrm);
        end
        else
        begin
          found:=false;
          for b := 0 to cntFrm do
          begin
             if arrFrm[b] = CASH_TOWAR[a].FrmID then
               begin
				        found:=true;
                break;
               end;

          end;

         if found=false then
         begin
        	arrFRM[cntFRM]:=CASH_TOWAR[a].FrmID;
            inc(cntFrm);
         end;

        end;
      end;

      //���� ������ � ������� ���� - �� �� ������� ���� �������

      	for b := 0 to cntFrm-1 do
      	begin


      		FRShtrih.Clean;
          FRM_SUMM:=0;
      		FRShtrih.FRM_ID:=arrFRM[b];
          FRShtrih.Connect(true, 5); //����������� ���� ��������. ���� 5 ������


          if (FRShtrih.FRM_ID = 2702542) then
            NDSType:=1;
          if (FRShtrih.FRM_ID = 2696877) then
            NDSType:=1;



          SkidSumm:=0;
          FRShtrih.DiskontNumber:='';
      		for a := 0 to Count_cash_towar  do
      		begin
                if CASH_TOWAR[a].FrmID <> arrFrm[b] then
                	continue;
        		FRM_SUMM:=FRM_SUMM+cash_towar[a].cena*cash_towar[a].koli;
        		frShtrih.AddOp(CASH_TOWAR[a].towar, cash_towar[a].cena, cash_towar[a].koli, cash_towar[a].Ed);
                        FRShtrih.DocName:=CASH_TOWAR[a].DocName;
                        FRShtrih.DiskontNumber:=CASH_TOWAR[a].DiskontNumber;
                        FRShtrih.skl_name := CASH_TOWAR[a].skl_name;
                        SkidSumm:= SkidSumm+CASH_TOWAR[a].twskid*cash_towar[a].koli;

      		end;
          FRShtrih.SkidSumm:=SkidSumm;

          FRShtrih.CheckOpenDocument; //���� �� ���������� �� ������� �����
          FRM_SUMM := round(FRM_SUMM*100)/100;
//            if b=cntFrm-1 then
//              FRM_SUMM:=Mon2;
//            mon2 := mon2-FRM_SUMM;

       		FRShtrih.SetSumm(FRM_SUMM, NDSType, cashType);  //���� �� ���������� �� ������� �����
          if Copy=false then
        		FRShtrih.ExecuteOP(0)   //���� �� ���������� �� ������� �����
          else
            FRShtrih.ExecuteOP(4);       //���� �� ���������� �� ������� �����

      		FRShtrih.Disconnect;
      		OutKkmError;
      	end;
     end;


    end;

    if MODEL_KKM=3 then begin
//    resetport;
//    setport(1);
    for a := 0 to Count_cash_towar  do
       begin
       checksale[a].Oper1 := cash_towar[a].cena;
       checksale[a].Oper2 := cash_towar[a].koli;
       checksale[a].Section := cash_towar[a].otdel;
       checksale[a].TovGr := 0;
       checksale[a].Name := CASH_TOWAR[a].towar;
//       writeln(check_file, checksale[a].name + ' '+ floattostr(checksale[a].Oper2)+'��/�/�� �� '+ floattostr(checksale[a].Oper1));
       end;

//       writeln(check_file, '���������: '+       CheckTitle.lines[1].Line + ':' +        CheckTitle.lines[2].Line);
//       writeln(check_file, '���: '+       CheckBottom.lines[1].Line + ':' +        CheckBottom.lines[2].Line);
       SetPort(KKM_COM);
       SetVnNal(Mon2);

       if OutCheck(@CheckTitle,@CheckSale,Count_Cash_Towar + 1 ,@CheckBottom,1)=1 then
        begin
          result := 1;
        end
        else MessageDlg(Errors[GetKKMError],mtInformation,[mbOk],0);
        resetPort;
     end;

 end;
//     closefile(check_file);
end;

{
procedure print_wozwrat_cash;
var
   a,b:integer;
begin
 if IS_KKM then begin // ��������� ��������, ������ ���� ��� ��������� � ����������
    // ������� ������
      if MODEL_KKM=1 then begin // AIN-100O
      if Count_cash_towar>13 then messbox('����� ������� � ���� �� ����� ���� ������ 13-oe!',MessSystem,48)
      else
       if ConnectKKM(KKM_COM) <> 1 then
        begin
                messbox('������ ���������� � ���!',MessSystem,48)
        end
      else
      begin
        // I?euaai nienie ?aea
        cbClearSales;
        // Onoaiaaeeaaai ?a?ei 2 no?iee a iaeiaiiaaiee
        cbSetLinesInSale(2);
        // aee??aai ?a?ei i?enoee nienea oiaa?ia iinea auaiaa ?aea
         cbSetClearBufMode(1);
        // Onoaiaaeeaaai ieaoa? ca IAE
        cbSetCreditMode(0);
        // Onoaiaaeeaaai ?a?e auaiaa ?anoiaiiai ?aea
        cbSetReturnMode(1);
        // Caiieiyai ?ae
        for a:=0 to Count_cash_towar do begin
            cbAddSale(PChar(CASH_TOWAR_NAME[a]),b_utils.okrug(CASH_TOWAR[a].cena,2),b_utils.okrug(CASH_TOWAR[a].koli,3),CASH_TOWAR[a].otdel);
        end;
        // Aaiaei iaee?iua
        OutKkmError;
        // Auaiaei ?ae
        KKM_WAIT.Show;
        OutKkmError;
        StartWaiting(1);
        while (WaitingStatus=1) and (not StopFlag) do Application.ProcessMessages;
        StopWaiting;
        OutKkmError;
        DisconnectKKM();
        if StopFlag then Messbox('����� ���� ��� �������.',MessSystem,48);
        KKM_WAIT.Hide;
      end;
  end;


    if MODEL_KKM=2 then begin
      // ������ ���� �� �� ����� ���� ��-�
      for a:=0 to Count_cash_towar do begin
             Elves_wozw_towar(CASH_TOWAR_NAME[a],CASH_TOWAR[a].otdel,b_utils.okrug(CASH_TOWAR[a].cena,2),
             b_utils.okrug(CASH_TOWAR[a].koli,3));
      end;
      // ��������� ���
      Elves_CLose_check(0,0);
    end;
   if MODEL_KKM=3 then begin
//    resetport;
//    setport(1);
    for a := 0 to Count_cash_towar  do
       begin
       checksale[a].Oper1 := cash_towar[a].cena;
       checksale[a].Oper2 := cash_towar[a].koli;
       checksale[a].Section := cash_towar[a].otdel;
       checksale[a].TovGr := 0;
       checksale[a].Name := cash_towar_name[a];
       end;
       SetPort(KKM_COM);
       if ReturnP(@CheckTitle,@CheckSale,Count_Cash_Towar + 1 ,@CheckBottom,1)=1 then
        begin
//          result := 1;
        end
        else MessageDlg(Errors[GetKKMError],mtInformation,[mbOk],0);
       ResetPort;
     end;

 end
end;
}


function FR_SHTRIH_GET_REG_VALUE(frm_id: integer; reg: integer): double ;
begin
      FRShtrih.Clean;
      FRShtrih.FRM_ID:=frm_id;
      FRShtrih.Connect(true, 5); //����������� ���� ��������. ���� 5 ������

      result := FRShtrih.GetRegValue(reg);


      FRShtrih.Disconnect;
      OutKkmError;
end;


Procedure Add_LOG(s:ansistring);
begin
  Datamodule1.LogTransaction.Active:=False;
  Datamodule1.LogTransaction.StartTransaction;
  try
    ADD_SQL(Datamodule1.QrLog,'insert into log (us_id,shop_id,mess) values (:us_id,:shop_id,:mess)');
    Datamodule1.QrLog.ParamByname('US_ID').asinteger:=USERID;
    Datamodule1.QrLog.ParamByname('SHOP_ID').asinteger:=SHOPID;
    Datamodule1.QrLog.ParamByname('MESS').asstring:=s;
    Datamodule1.QrLog.ExecSQL;
    Datamodule1.LogTransaction.Commit;
  Except
    Datamodule1.LogTransaction.Rollback;
  End;
  Datamodule1.LogTransaction.Active:=False;
end;


function BSKLAD_CONTROLSUMM(s:ansistring):int64;
var
 a,P1,P2,P3,P4,P5,P6,P7,P8:integer;
 s2:ansistring;
begin
  // ������� ���������� ����������� ����� ������;
  s:=trim(ansiuppercase(s));
  P1:=length(s); // ����� ������
  P2:=0;
  for a:=1 to length(s) do P2:=P2+ord(s[a]); // ����������� ����� ������
  P3:=0;
  for a:=1 to length(s) do if IsAlpha(s[a]) then P3:=P3+ord(s[a]); // ����������� ����� ����
  P4:=0;
  for a:=1 to length(s) do if IsDigit(s[a]) then P4:=P4+ord(s[a]); // ����������� ����� ����
  P5:=P2 mod 13; // ������� �� ������� �� 13
  s2:=b_utils.right(inttostr(P1),1)+ // ��������� ����� ����� ������
     b_utils.right('00'+inttostr(P2),2)+ // ��� ��������� ����� ����������� ����� ������
     b_utils.right(inttostr(P3),1)+ // ��������� ����� ����������� ����� ����
     b_utils.right(inttostr(P4),1)+ // ��������� ����� ����������� ����� ����
     b_utils.right(inttostr(P5),1); // ������� �� ������� �� 13
  P6:=(ord(s2[1])-48)+(ord(s2[2])-48)+(ord(s2[3])-48)+(ord(s2[4])-48)+(ord(s2[5])-48);
  P6:=P6 mod 2;
  s2:=s2+inttostr(P6);
  result:=strtoint64(s2);
end;





Function ZPCalc(FN:ansistring;Ryear,Rmes:integer):real;
const
  deb=true;
var
  a,b,c,d:integer;
  s1,s2,s3,s4,s5,s6:ansistring;
  c1,c2,c3:CHAR;
  typ,subtyp:integer;
  TitleWd:ansistring;
  WDT1,WDT2,WDT2b:tdatetime;
  mes:integer;
  SHOP,SKL,MEN,VALUTA,WVALUTA,TWTREE:integer;
  PNTYPS,RNTYPS:ansistring;
  SQL,OPIS:ansistring;
  ZAK,ZAKMES,ZAKMES2:integer;
  ZakDT1,ZakDt2:tdatetime;
begin
    // ���������� ������
    typ:=0;
    subtyp:=0;
    a:=1;
    SHOP:=0; SKL:=0;
    while a<=argv(FN) do begin
       s1:=ansiuppercase(trim(argc(FN,a)));
       if s1='#1' then begin // ������� � ���
          TYP:=1;
       end;
       if s1='#2' then begin // �������
          TYP:=2;
       end;
       if s1='#3' then begin // �������������
          TYP:=3;
       end;
       if s1='#4' then begin // ���
          TYP:=4;
       end;
       if copy(s1,1,2)='$9' then begin // �����, �����������
             s2:=copy(s1,3,length(s1)-2);
             c:=strtoint(s2[1]);
             if c=0 then begin
               ZAK:=0;
             end else begin
                ZAK:=c;
                s2:=b_utils.right(s2,length(s2)-1);
                if ZAK in [1,2] then begin
                  try
                    ZAKMES:=strtoint(s2);
                  except
                    ZAKMES:=0;
                  end;
                end;
                if ZAK=3 then begin
                  for b:=1 to length(s2) do if s2[b]='_' then s2[b]:=' ';
                  try
                    ZAKMES:=strtoint(argc(s2,1));
                  except
                    ZAKMES:=0;
                  end;
                  try
                    ZAKMES2:=strtoint(argc(s2,2));
                  except
                    ZAKMES2:=0;
                  end;
                end;
                if ZAK=1 then begin
                   // �� �������� N �������
                   ZakDT1:=incmonth(Wdt2b,-trunc(ZakMes))+1;
                   ZakDT2:=Wdt2b+1-sekond1;
                end;
                if ZAK=2 then begin
                   // ����� N �������
                   ZakDT2:=incmonth(Wdt2b+1-sekond1,-trunc(ZakMes))-sekond1;
                   ZakDT1:=encodedate(1900,1,1);
                end;
                if ZAK=3 then begin
                   // �� .. �� .. ������� �����
                   ZakDT1:=incmonth(Wdt2b,-trunc(ZakMes2))+1;
                   ZakDT2:=incmonth(Wdt2b+1-sekond1,-trunc(ZakMes))-sekond1;
                END;
             end;
       end;
       if copy(s1,1,2)='$7' then begin // ���� ��������� ���������
             s2:=copy(s1,3,length(s1)-2);
             if S2='-1' then begin // ��� ���� ���������
                PNTYPS:='';
             end else begin // �������� ����� ���������
                for b:=1 to length(s2) do if s2[b]='_' then s2[b]:=' ';
                PNTYPS:='';
                for b:=1 to argv(s2) do begin
                   PNTYPS:=PNTYPS+trim(argc(s2,b))+',';
                end;
                PNTYPS:=b_utils.left(PNTYPS,length(PNTYPS)-1);
             end
       end;
       if copy(s1,1,2)='$8' then begin // ���� ��������� ���������
             s2:=copy(s1,3,length(s1)-2);
             if S2='-1' then begin // ��� ���� ���������
                RNTYPS:='';
             end else begin
                for b:=1 to length(s2) do if s2[b]='_' then s2[b]:=' ';
                RNTYPS:='';
                for b:=1 to argv(s2) do begin
                   RNTYPS:=RNTYPS+trim(argc(s2,b))+',';
                end;
                RNTYPS:=b_utils.left(RNTYPS,length(RNTYPS)-1);
             end
       end;
       if copy(s1,1,2)='$2' then begin // ���������
             s2:=copy(s1,3,length(s1)-2);
             try
                SHOP:=strtoint(s2); // ���� �������
             except
                SHOP:=0; // ��� ��������
             end;
       end;
       if copy(s1,1,2)='$0' then begin // ������ ������
             s2:=copy(s1,3,length(s1)-2);
             try
                WVALUTA:=strtoint(s2);
             except
                WVALUTA:=0;
             end;
             // 0 - ������ ������ - ������
             // 1 - ������ ������ - �������
       end;
       if copy(s1,1,2)='$6' then begin // ������ �������
             s2:=copy(s1,3,length(s1)-2);
             try
                TWTREE:=strtoint(s2); // ���� ������
             except
                TWTREE:=0; // ��� ������
             end;
       end;
       if copy(s1,1,2)='$3' then begin // �� ������
             s2:=copy(s1,3,length(s1)-2);
             try
                SKL:=strtoint(s2); // ���� �����
             except
                SKL:=0; // ��� ������
             end;
       end;
       if copy(s1,1,2)='$4' then begin // ��������
             s2:=copy(s1,3,length(s1)-2);
             try
                MEN:=strtoint(s2); // ���� ��������
             except
                MEN:=-1; // ��� ���������
             end;
       end;
       if copy(s1,1,2)='$5' then begin // ������
             s2:=copy(s1,3,length(s1)-2);
             try
                VALUTA:=strtoint(s2);
             except
                VALUTA:=0;
             end;
             // 0 - ��� ������ �� ������
             // 1 - �������� �����
             // 2 - ���������� �����
       end;
       if copy(s1,1,2)='$1' then begin
             s2:=copy(s1,3,length(s1)-2);
             // ������ �������
             c1:=s2[1];
             case c1 of
               '1': begin // ��������� ������
                      TitleWd:='�� ��������� ������';
                      WDT1:=encodedate(Ryear,Rmes,1);
                      Wdt2:=incmonth(Wdt1,1)-sekond1;
                      Wdt2b:=incmonth(Wdt1,1)-1;
                    end;
               '2': begin // �� n ������� ������ ���������� �������
                      // �������� ����� �������
                      s3:=copy(s2,2,length(s2)-1);
                      try
                        mes:=strtoint(s3);
                      except
                        mes:=0;
                      end;
                      // ��������� ����;
                      Wdt1:=incmonth(encodedate(RYear,Rmes,1),-mes);
                      Wdt2:=incmonth(Wdt1,1)-sekond1;
                      Wdt2b:=incmonth(Wdt1,1)-1;
                      TitleWd:='�� ������ �� '+inttostr(mes)+' ������� ������ ����������';
                    end;
               '3': begin // �� ��������� n �������, � ��� ����� � ���������
                      s3:=copy(s2,2,length(s2)-1);
                      try
                        mes:=strtoint(s3);
                      except
                        mes:=0;
                      end;
                      // ��������� ����;
                      Wdt1:=incmonth(encodedate(RYear,Rmes,1),-(mes-1));
                      Wdt2:=incmonth(encodedate(RYear,Rmes,1),1)-sekond1;
                      Wdt2b:=incmonth(encodedate(RYear,Rmes,1),1)-1;
                      TitleWd:='�� ��������� '+inttostr(mes)+' �������, ������� ����������';
                    end;
               '4': begin // �� ��������� ������
                      s3:=copy(s2,2,length(s2)-1);
                      Wdt1:=encodedate(strtoint(copy(s3,1,4)),strtoint(copy(s3,5,2)),strtoint(copy(s3,7,2)));
                      Wdt2:=encodedate(strtoint(copy(s3,9,4)),strtoint(copy(s3,13,2)),strtoint(copy(s3,15,2)))+1-sekond1;
                      Wdt2b:=encodedate(strtoint(copy(s3,9,4)),strtoint(copy(s3,13,2)),strtoint(copy(s3,15,2)));
                      TitleWd:='�� ���� ��������� �����';
                    end;
               else begin // �� ������� ����������������
               end;
             end;
       end;
       inc(a);
    end;
    begin
       // ��������� ������
       SQL:='select sum(calc_kol*(roundd((rns.tw_money*(1-rns.tw_skiddoll/100))*(1-(rns.tw_skid+rn.rn_skid)/100),2))) as wyr, '+
       ' sum(calc_kol*seb) as seb,sum(calc_kol*nds) as nds,sum(calc_kol*seb$) as seb$,sum(calc_kol*nds$) as nds$,sum(calc_kol*nac) as nac,sum(calc_kol*nac$) as nac$ '+
       ' from rn,rns,re';
       if TWTREE<>0 then SQL:=SQL+',tw,list_twtree('+inttostr(TWTREE)+',0) ';
       if (VALUTA<>0) and (TWTREE=0) then SQL:=SQL+',tw ';
       SQL:=SQL+' where re.ids=rns.rns_id and rn.rn_id=rns.rn_id and re.typ=1 '+
       ' and re.dt between :wdt1 and :wdt2 ';
       if RNTYPS<>'' then SQL:=SQL+ ' and re.rntyp_id in ('+RNTYPS+') ';
       if PNTYPS<>'' then SQL:=SQL+ ' and re.pp_pntyp_id in ('+PNTYPS+') ';
       if SHOP<>0 then SQL:=SQL+ ' and re.shop_id='+inttostr(SHOP);
       if SKL<>0 then SQL:=SQL+ ' and rn.skl_id='+inttostr(SKL);
       if MEN<>-1 then SQL:=SQL+ ' and re.pp_men='+inttostr(MEN);
       if TWTREE<>0 then SQL:=SQL+' and rns.tw_id=tw.tw_id and tw.twtree_id=list_twtree.twtree_id';
       if VALUTA<>0 then begin
          if VALUTA=1 then SQL:=SQL+' and tw.valuta_id=0 '; // ��������
          if VALUTA=2 then SQL:=SQL+' and tw.valuta_id=1 '; // ����������
       end;
       if Zak<>0 then begin
          SQL:=SQL+' and pp_dt between :zakDt1 and :zakDt2 ';
       end;


       // ��������� �������� ������
       if TYP=1 then OPIS:='�������';
       if TYP=2 then OPIS:='�������';
       if TYP=3 then OPIS:='������������� ���������� ������';
       if TYP=4 then OPIS:='��� ������� ���������� ������';
       OPIS:=OPIS+' '+TitleWd+' ('+date_sokr(wdt1)+' �� '+date_sokr(wdt2)+')';
       if SHOP=0 then OPIS:=OPIS+', ����� ���������� ' else begin
          OPEN_SQL(DataModule1.QueryZP2,'select shop_name from shop where shop_id='+inttostr(shop));
          OPIS:=OPIS+', ������ ��������� "'+DataModule1.QueryZP2.fieldbyname('shop_name').asstring+'"';
       end;
       if SKL=0 then OPIS:=OPIS+', �� ���� ������� ' else begin
          OPEN_SQL(DataModule1.QueryZP2,'select skl_full from skl where skl_id='+inttostr(skl));
          OPIS:=OPIS+', ������ �� ������ "'+DataModule1.QueryZP2.fieldbyname('skl_full').asstring+'"';
       end;
       if TWTREE<>0 then begin
          OPEN_SQL(DataModule1.QueryZP2,'select twtree_nam from twtree_full('+inttostr(twtree)+',"")');
          OPIS:=OPIS+', ������ �� ������ ������� "'+DataModule1.QueryZP2.fieldbyname('twtree_nam').asstring+'"';
       end;
       if MEN<>-1 then begin
          OPEN_SQL(DataModule1.QueryZP2,'select kln_full from kln_data('+inttostr(men)+')');
          OPIS:=OPIS+', ������ ������ ��������� "'+DataModule1.QueryZP2.fieldbyname('kln_full').asstring+'"';
       end;
       if VALUTA=1 then OPIS:=OPIS+', ������ �������� �����';
       if VALUTA=2 then OPIS:=OPIS+', ������ ���������� �����';
       if PNTYPS<>'' then begin
          OPEN_SQL(DataModule1.QueryZP2,'select pntyp_short from pntyp where pntyp_id in ('+pntyps+')');
          s2:='';
          while not DataModule1.QueryZP2.eof do begin
             s2:=s2+DataModule1.QueryZP2.fieldByname('pntyp_short').asstring+',';
             DataModule1.QueryZP2.next;
          end;
          s2:=b_utils.left(s2,length(s2)-1);
          OPIS:=OPIS+', �� ��������� '+S2;
       end else OPIS:=OPIS+', �� ���� ���������';
       if ZAK<>0 then begin
          if ZAK=1 then begin
             OPIS:=OPIS+', ����������� �� '+
             OKON_CHAR('��������� ',' �������� ','��������� ',trunc(ZakMes))
             +inttostr(trunc(ZakMes))+
             OKON_CHAR(' ����� ',' ������ ',' ������� ',trunc(ZakMes));
          end;
          if ZAK=2 then begin
             OPIS:=OPIS+', ����������� ����� '+
             floattostrf(ZakMes,fffixed,12,0)+
             OKON_CHAR(' ������ ',' ������� ',' ������� ',trunc(ZakMes))+' ����� ';
          end;
          if ZAK=3 then begin
             OPIS:=OPIS+', ����������� �� '
            +inttostr(trunc(ZakMes))+' �� '+inttostr(trunc(ZakMes2))+
            OKON_CHAR(' ������ ',' ������� ',' ������� ',trunc(ZakMEs2))+' �����';
          end;
          OPIS:=OPIS+' ('+date_sokr(Zakdt1)+' - '+date_sokr(Zakdt2)+')';
       end;
       if RNTYPS<>'' then begin
          OPEN_SQL(DataModule1.QueryZP2,'select rntyp_short from rntyp where rntyp_id in ('+rntyps+')');
          s2:='';
          while not DataModule1.QueryZP2.eof do begin
             s2:=s2+DataModule1.QueryZP2.fieldByname('rntyp_short').asstring+',';
             DataModule1.QueryZP2.next;
          end;
          s2:=b_utils.left(s2,length(s2)-1);
          OPIS:=OPIS+', �� ��������� '+S2;
       end else OPIS:=OPIS+', �� ���� ���������';

       ADD_SQL(DataModule1.QueryZP1,SQL);
       DataModule1.QueryZP1.ParamByname('WDT1').asdatetime:=WDT1;
       DataModule1.QueryZP1.ParamByname('WDT2').asdatetime:=WDT2;
       if Zak<>0 then begin
         DataModule1.QueryZP1.ParamByname('ZakDT1').asdatetime:=ZakDT1;
         DataModule1.QueryZP1.ParamByname('ZakDT2').asdatetime:=ZakDT2;
       end;
       DataModule1.QueryZP1.Open;
//       if TYP=1 then Main_form.Memo1.Lines.add('����� ��������� '+floattostrf(DataModule1.QueryZP1.fieldByname('wyr').asfloat,fffixed,19,2)+' ���');
//       if TYP=2 then Main_form.Memo1.Lines.add('����� ��������� '+floattostrf(DataModule1.QueryZP1.fieldByname('nac').asfloat,fffixed,19,2)+' ���');
//       if TYP=3 then Main_form.Memo1.Lines.add('����� ��������� '+floattostrf(DataModule1.QueryZP1.fieldByname('seb').asfloat,fffixed,19,2)+' ���');
//       if TYP=4 then Main_form.Memo1.Lines.add('����� ��������� '+floattostrf(DataModule1.QueryZP1.fieldByname('nds').asfloat,fffixed,19,2)+' ���');
    end;
end;

procedure Show_Wait(s:string;P:integer);
begin
     Wait_Form.StatusBar1.panels[0].text:=s;
     Wait_Form.Gauge1.Progress:=p;
     Wait_Form.Show;
     delay(1);
end;

PROCEDURE SHOW_HISTORY_DOC(Cap:string;DOC:string;ID:integer);
begin
   History_doc_name:=trim(ansiuppercase(DOC));
   History_doc_ID:=ID;
   Application.createForm(THISTORY_DOC,HISTORY_DOC);
   HISTORY_DOC.caption:='������� ��������� '+Cap;
   HISTORY_DOC.showModal;
   HISTORY_DOC.destroy;;
end;

procedure RN_TO_PO(RN_ID:integer);
begin
   DataModule1.WorkTransaction.Active:=False;
   ADD_SQL(DataModule1.QueryWork,'select rn.frm_id, rn.kln_id,kln_prefix,shop_prefix,shop_postfix,rntyp_short,rn_num,rn_date, '+
   '(select sum(rns.tw_kol* '+
   'roundd((rns.tw_money*(1-rns.tw_skiddoll/100))*(1-(rns.tw_skid+rn.rn_skid)/100),2) '+
   ') from rns where rns.rn_id=rn.rn_id) as rn_summ '+
   'from rn,kln,shop,rntyp '+
   'where rn.rn_id=:rn_id and rn.shop_id=shop.shop_id '+
   'and rn.rntyp_id=rntyp.rntyp_id and rn.frm_id=kln.kln_id');
   DataModule1.QueryWork.ParamByname('rn_id').asinteger:=RN_ID;
   DataModule1.QueryWork.Open;
   if not DataModule1.QueryWork.eof then begin
      Application.createForm(TDOC_PO,DOC_PO);
      DOC_PO.PO_SUMM.value:=DataModule1.QueryWork.fieldByname('rn_summ').asfloat;
      DOC_PO.KLN_NAME.tag:=DataModule1.QueryWork.fieldByname('kln_id').asinteger;
      DOC_PO.PO_OSN.text:='���������� �� ����� ���������� ��������� '+DataModule1.QueryWork.fieldByname('kln_prefix').asstring+' '+
      DataModule1.QueryWork.fieldByname('shop_prefix').asstring+DataModule1.QueryWork.fieldByname('RNTYP_SHORT').asstring+
      b_utils.right('000000000'+DataModule1.QueryWork.fieldByname('RN_NUM').asstring,10)+
      DataModule1.QueryWork.fieldByname('shop_postfix').asstring+' �� '+date_sokr(DataModule1.QueryWork.fieldByname('RN_DATE').asdatetime);
      DOC_PO.FRM.Value := DataModule1.QueryWork.fieldByname('frm_id').asString;
      DOC_PO.tag:=-2;
      DOC_PO.ShowModal;
      DOC_PO.Destroy;
   end;

end;

procedure RN_SHOWPO(RN_ID:integer);
begin
   application.createForm(TRN_SHOW_PO,RN_SHOW_PO);
   RN_SHOW_PO.tag:=RN_ID;
   RN_SHOW_PO.showModal;
   RN_SHOW_PO.Destroy;
end;

procedure OutKkmError;
begin
   case Model_KKM of
   1:	Main_Form.Statusbar1.panels[1].text:='��������� ���-100�: '+GetErrorMsg;
   4:	begin
       Main_Form.Statusbar1.panels[1].text:='��������� �����-��-�: '+FRShtrih.ResultCodeDescription;
       FRShtrih.Disconnect;
      end;
   end;

end;


function PREP_KKM1:boolean;
var
   P,T:ansistring;
begin
 // ��������� ������������ � ��� ���-100�, ����������� ��������� � ������ ����, ��������� TRUE,
 // ���� ��� ������ �������
 if not IS_KKM then result:=false else
 begin
   DisconnectKKM;
   try
        SetSupplierCode(PChar(KKM_ONLINE_CODE));
   except
   end;
   if ConnectKKM(KKM_COM)=0 then begin
      result:=false;
   end else begin
     // ��������� ����������� ����������� ������ �� ��� ���-100�
     // ������� �������� ����
     CbClearTitle;
     OutKkmError;
     // ��������� ���������
     Datamodule1.KKMTransaction.Active:=False;
     ADD_SQL(Datamodule1.QrKKM,'select * from cfg where cfg_name="$CHECK.HEADER" '+
     ' and cfg_set1=:SHOP_ID order by cfg_set2');
     Datamodule1.QrKKM.parambyname('SHOP_ID').asinteger:=SHOPID;
     Datamodule1.QrKKM.Open;
     while not Datamodule1.QrKKM.eof do begin
        if Datamodule1.QrKKM.fieldbyname('CFG_set3').asinteger=1 then P:='C' else P:='W';
        T:=ansiuppercase(b_utils.left(Datamodule1.QrKKM.fieldbyname('CFG_VALUE').asstring+space(18),17));
//        cbAddTitleLine(PChar(P+T));
        OutKkmError;
        Datamodule1.QrKKM.next;
     end;
     // ������� ������� ����
     CbClearBottom;
     OutKkmError;
     // ��������� ������
     ADD_SQL(Datamodule1.QrKKM,'select * from cfg where cfg_name="$CHECK.FOOTER" '+
     ' and cfg_set1=:SHOP_ID order by cfg_set2');
     Datamodule1.QrKKM.parambyname('SHOP_ID').asinteger:=SHOPID;
     Datamodule1.QrKKM.Open;
     while not Datamodule1.QrKKM.eof do begin
        if Datamodule1.QrKKM.fieldbyname('CFG_set3').asinteger=1 then P:='C' else P:='W';
        T:=ansiuppercase(b_utils.left(Datamodule1.QrKKM.fieldbyname('CFG_VALUE').asstring+space(18),17));
        cbAddBottomLine(PChar(P+T));
        OutKkmError;
        Datamodule1.QrKKM.next;
     end;
     OutKkmError;
     //��������� ����� ������� 14.04.2004 �� ������� �2 - ��������� ������ ������� ����
     //� ������ ���� ������������� ��������� ��� �������, ���� ��� ����.
     if (CASHIER_NAME <>'') then
      begin
       cbAddBottomLine(PChar('������ ' + CASHIER_NAME));
       OutKkmError;
      end;
     result:=true;
   end;
   Datamodule1.KKMTransaction.Active:=False;
 end;
end;


function PREP_KKM2:boolean;
var
   P,T:ansistring;
   f: text;
   attr: byte;
   i: integer;
   s: string;
begin
 // ��������� ������������ � ��� ���-100�, ����������� ��������� � ������ ����, ��������� TRUE,
 // ���� ��� ������ �������
 if not IS_KKM then result:=false
 else
begin
//   DisconnectKKM;
   ResetPort();
   try
        assign(f, 'code.dat');
        rewrite(f);
        writeln(f, PChar(KKM_ONLINE_CODE));
//        SetSupplierCode(PChar(KKM_ONLINE_CODE));
        closefile(f);
   except
   end;

   begin
     // ��������� ����������� ����������� ������ �� ��� ���-100�
     // ������� �������� ����
//     CbClearTitle;
//     OutKkmError;
     // ��������� ���������

     Datamodule1.KKMTransaction.Active:=False;
     ADD_SQL(Datamodule1.QrKKM,'select * from cfg where cfg_name="$CHECK.HEADER" '+
     ' and cfg_set1=:SHOP_ID order by cfg_set2');
     Datamodule1.QrKKM.parambyname('SHOP_ID').asinteger:=SHOPID;
     Datamodule1.QrKKM.Open;
     I := 1;

     CheckTitle.pos:=0;
     while not Datamodule1.QrKKM.eof do begin
        if Datamodule1.QrKKM.fieldbyname('CFG_set3').asinteger=1 then attr:=1 else attr:=2;
        T:=ansiuppercase(b_utils.left(Datamodule1.QrKKM.fieldbyname('CFG_VALUE').asstring+space(18),16));
//        attr := 0;
        Checktitle.Lines[I].Attr := attr;
        s:=t;
        Checktitle.Lines[I].Line := T+#0;
//        OutKkmError;
        Datamodule1.QrKKM.next;
        inc(I);
        if I > 3 then break;
     end;
     // ������� ������� ����
//     CbClearBottom;
//     OutKkmError;
     // ��������� ������
     ADD_SQL(Datamodule1.QrKKM,'select * from cfg where cfg_name="$CHECK.FOOTER" '+
     ' and cfg_set1=:SHOP_ID order by cfg_set2');
     Datamodule1.QrKKM.parambyname('SHOP_ID').asinteger:=SHOPID;
     Datamodule1.QrKKM.Open;
     I:=1;
     CheckBottom.pos:=1;
     while not Datamodule1.QrKKM.eof do begin
        if Datamodule1.QrKKM.fieldbyname('CFG_set3').asinteger=1 then attr:=1 else attr:=2;
        T:=ansiuppercase(b_utils.left(Datamodule1.QrKKM.fieldbyname('CFG_VALUE').asstring+space(18),16));
        CheckBottom.Lines[I].Attr := attr;
        CheckBottom.Lines[I].Line := T+#0;
//        cbAddBottomLine(PChar(P+T));
//        OutKkmError;
        Datamodule1.QrKKM.next;
        inc(I);
        if I > 3 then break;
     end;
//     OutKkmError;
     //��������� ����� ������� 14.04.2004 �� ������� �2 - ��������� ������ ������� ����
     //� ������ ���� ������������� ��������� ��� �������, ���� ��� ����.
     if (CASHIER_NAME <>'') and (I < 3) then
      begin
      CheckBottom.lines[I].Attr:=1;
      CheckBottom.lines[I].Line:= PChar(CASHIER_NAME)+#0;

//       cbAddBottomLine(PChar('������ ' + CASHIER_NAME));
//       OutKkmError;
      end;



   end;

  if SetPort(KKM_COM)=0 then
   begin
      result:=false;
   end
      else result := true;
 ResetPort;

 end;
end;


function PREP_KKM3:boolean;		//������������� �����-��-�
var
   T:ansistring;
   n: integer;

begin
  result:=false;

  if not IS_KKM then
  result:=false
  else
    result := FRShtrih.Prepare();
end;


procedure WYP_ZREMON(ZREMON_ID:integer);
var
 r:double;
 s,s2:string;
begin
   // ���������� ������ �� ����������
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
     ADD_SQL(DataModule1.IbSaveSQL,'select * from ZREMON_TO_REMON(:ZREMON_ID,:US_ID,:SHOP_ID)');
     DataModule1.IbSaveSQL.parambyname('ZREMON_ID').asinteger:=ZREMON_ID;
     DataModule1.IbSaveSQL.parambyname('US_ID').asinteger:=USERID;
     DataModule1.IbSaveSQL.parambyname('SHOP_ID').asinteger:=SHOPID;
     DataModule1.IbSaveSQL.open;
     if DataModule1.IbSaveSQL.eof then s2:='�������� ������ ��� �������� ���� ����������!'
     else begin
         case DataModule1.IbSaveSQL.fieldByname('RES').asinteger of
           -2: s:='��� ���������� ��� ��� ��������!';
           -3: s:='�� �� ������ ���� �� �������� ���� ����������!';
           -4: s:='���� ���� ���������� ������ ���� �������� �������!';
           1: s:='��� ������� ��������!';
         end;
         s2:='������ ��� ���������� � '+DataModule1.IbSaveSQL.fieldByname('REMON_FULLNUM').asstring+' �� '+date_sokr(date())+', '+s;
     end;
     Datamodule1.IBTransaction2.commit;
     Datamodule1.IBTransaction2.Active:=False;
     Messbox(s2,MessSystem,48);
end;

procedure WYP_ZTRINDEF(TRINDEF_ID:integer;SKLID:integer);
var
 r:double;
 s,s2:string;
begin
   // ���������� ������ �� ����������
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
     ADD_SQL(DataModule1.IbSaveSQL,'select * from ZTRINDEF_INTO_REMON_PSORT(:TRINDEF_ID,:US_ID,:SHOP_ID,:SKL_ID)');
     DataModule1.IbSaveSQL.parambyname('TRINDEF_ID').asinteger:=TRINDEF_ID;
     DataModule1.IbSaveSQL.parambyname('US_ID').asinteger:=USERID;
//     DataModule1.IbSaveSQL.parambyname('DT').asdatetime:=Date;
     DataModule1.IbSaveSQL.parambyname('SHOP_ID').asinteger:=SHOPID;
     DataModule1.IbSaveSQL.parambyname('SKL_ID').asinteger:=SKLID;
     DataModule1.IbSaveSQL.open;
     if DataModule1.IbSaveSQL.eof then s2:='�������� ������ ��� �������� ���� ����������!'
     else begin
         case DataModule1.IbSaveSQL.fieldByname('RES').asinteger of
           -2: s:='��� ���������� ��� ��� ��������!';
           -3: s:='�� �� ������ ���� �� �������� ���� ����������!';
           -4: s:='���� ���� ���������� ������ ���� �������� �������!';
           1: s:='��� ������� ��������!';
         end;
         s2:='������ ��� ���������� � '+DataModule1.IbSaveSQL.fieldByname('REMON_FULLNUM').asstring+' � ����������� � '+DataModule1.IbSaveSQL.fieldByname('PSORT_FULLNUM').asstring+' �� '+date_sokr(date())+', '+s;
     end;
     Datamodule1.IBTransaction2.commit;
     Datamodule1.IBTransaction2.Active:=False;
     Messbox(s2,MessSystem,48);
end;


procedure MainMenuSet;
begin
        MAIN_FORM.mnuRemind.Visible := CHECK_DOSTUP('REMIND.NEW') or CHECK_DOSTUP('REMIND.SHOW_ALL'); 
        Main_FORM.MnPrice.Enabled:=(CHECK_USER_DOSTUP('PRICE_PRINT')<>-1); // ������ �����-�����
        Main_FORM.MnDicKLN.enabled:=CHECK_DOSTUP('$DIC.DIC_KLN'); // ���������� ��������
        Main_FORM.BtnDicKLN.enabled:=CHECK_DOSTUP('$DIC.DIC_KLN'); // ���������� ��������
        Main_FORM.MnDicTW.enabled:=CHECK_DOSTUP('$DIC.DIC_TW'); // ���������� �������
        Main_FORM.BtnDicTW.enabled:=CHECK_DOSTUP('$DIC.DIC_TW'); // ���������� �������
        Main_FORM.MnDicTWKTG.enabled:=CHECK_DOSTUP('$DIC.DIC_TWKTG'); // ���������� ��������� �������
//        Main_FORM.MnDicTOW.enabled:=Main_FORM.MnDicTW.enabled or Main_FORM.MnDicTWKTG.enabled;
        Main_FORM.MnDicSHOP.enabled:=CHECK_DOSTUP('$DIC.DIC_SHOP'); // ���������� ���������
        Main_FORM.MnDicSKL.enabled:=CHECK_DOSTUP('$DIC.DIC_SKL'); // ���������� �������
        Main_FORM.MnDicNDS.enabled:=CHECK_DOSTUP('$DIC.DIC_NDS'); // ���������� ������ ���
        Main_FORM.MnServisKursPN.enabled:=CHECK_DOSTUP('$SERVIS.KURS_PN'); // ����� ����� ���������
        Main_FORM.MnServisKursRN.enabled:=CHECK_DOSTUP('$SERVIS.KURS_RN'); // ����� ����� ���������
        Main_FORM.MnServisKursMONEY.enabled:=CHECK_DOSTUP('$SERVIS.KURS_MONEY'); // ����� ����� ���������������
        main_form.MnServisKursy.enabled := Main_FORM.MnServisKursPN.enabled or Main_FORM.MnServisKursRN.enabled or Main_FORM.MnServisKursMONEY.enabled;
        Main_FORM.MnDicAdm.enabled:=(CHECK_DOSTUP('$ADM')) or (USER_USGROUP=ADM_USGROUP); // �����������������
        Main_FORM.MnADM.enabled:=(CHECK_DOSTUP('$ADM')) or (USER_USGROUP=ADM_USGROUP); // �����������������
        Main_FORM.MnServisCloseDir.enabled:=CHECK_DOSTUP('$SERVIS.CLOSEDIR'); // �������� ������� �����������
        Main_FORM.MnServisCloseWork.enabled:=CHECK_DOSTUP('$SERVIS.CLOSEWORK'); // �������� ������� ������
        Main_FORM.MnJouKKM.enabled:=CHECK_DOSTUP('$JOU.KKM.SHOW'); // �������� ������� �������� ������
        Main_FORM.BtnJouKKM.enabled:=CHECK_DOSTUP('$JOU.KKM.SHOW'); // �������� ������� �������� ������
        Main_FORM.MnDOCKKM.enabled:=CHECK_DOSTUP('$JOU.KKM.EDIT_MYSHOP'); // �������������� �������� ��������� � ����� ��������
        Main_FORM.BtnDOCKKM.enabled:=CHECK_DOSTUP('$JOU.KKM.EDIT_MYSHOP'); // �������������� �������� ��������� � ����� ��������
        Main_FORM.MnReportAnalitika.enabled:=CHECK_DOSTUP('$REPORT.ANALITIKA'); // ������ � �������� ���������
        Main_FORM.MnReportOst.enabled:=CHECK_DOSTUP('$REPORT.OST'); // ����� �� ��������
        Main_FORM.MnReportOstNul.enabled:=CHECK_DOSTUP('$REPORT.OSTNUL'); // ����� �� ������������� ��������
        Main_FORM.MnReportTorgPers.enabled:=CHECK_DOSTUP('$REPORT.TORG.PERS'); // ������������ ����� � ��������
        Main_FORM.BtnReportTorgPers.enabled:=CHECK_DOSTUP('$REPORT.TORG.PERS'); // ������������ ����� � ��������
        Main_FORM.ActReportPersPribyl.enabled:=CHECK_DOSTUP('$REPORT.PRIBYL.PERS'); // ������������ ����� � ��������
        Main_FORM.mnuReportNacTabel.enabled:=CHECK_DOSTUP('$REPORT.ITOG.REPORT_NAC_TABLE_GROUP'); // ����� � ������� �� �������-�������

        Main_FORM.MnReportPribylWide.enabled:=CHECK_DOSTUP('$REPORT.PRIBYL.WIDE'); // ����������� ����� � �������
        MAIN_FORM.BtnPribylWide.enabled:=CHECK_DOSTUP('$REPORT.PRIBYL.WIDE'); // ����������� ����� � �������
        Main_FORM.MnReportZakup.enabled:=CHECK_DOSTUP('$REPORT.MINOST'); // ����� � ����������� ��������
        Main_FORM.BtnReportZakup.enabled:=CHECK_DOSTUP('$REPORT.MINOST'); // ����� � ����������� ��������
        Main_FORM.MnOtgr.enabled:=CHECK_DOSTUP('$OTGRUZ'); // ��������
        Main_FORM.MnPol.enabled:=CHECK_DOSTUP('$POL'); // ���������
        Main_FORM.BtnOtgr.enabled:=CHECK_DOSTUP('$OTGRUZ'); // ��������
        Main_FORM.BtnPol.enabled:=CHECK_DOSTUP('$POL'); // ���������
        Main_FORM.MnOtgrPol.enabled:=Main_FORM.MnOtgr.enabled or Main_FORM.MnPol.enabled;
        Can_create_PO:=CHECK_DOSTUP('$JOU.PO.NEW');
        Main_FORM.ActJouZREMON.enabled:=CHECK_DOSTUP('$JOU.ZREMON.NEW'); // ������ ������ �� ����������
        Main_FORM.ActDocZREMON.enabled:=CHECK_DOSTUP('$JOU.ZREMON.NEW'); // ������ ������ �� ����������
        Main_FORM.ActDocPO.enabled:=Can_create_PO; // �������� ����������
        Main_FORM.ActDocPOWozw.enabled:=Can_create_PO; // ������� ����������
        Main_FORM.ActJOUPO.enabled:=Can_create_PO; // �������� ����������
        Main_FORM.SpeedDocPO.enabled:=Can_create_PO; // �������� ����������
        Main_FORM.SpeedDocPOWozw.enabled:=Can_create_PO; // �������� ������� ����������
        Main_FORM.SpeedJouPO.enabled:=Can_create_PO; // �������� ����������
        Main_FORM.MnDocsSpis.enabled:=CHECK_DOSTUP('$JOU.SPIS.NEW'); // ��� ��������
        Main_FORM.BtnDocsSpis.enabled:=CHECK_DOSTUP('$JOU.SPIS.NEW'); // ��� ��������
        Main_FORM.SpeedItem18.enabled:=CHECK_DOSTUP('$JOU.SPIS.NEW'); // ��� ��������
        Main_FORM.MnDocKKM.enabled:=CHECK_DOSTUP('$JOU.RNKKM.NEW'); // �������� ���������
        Main_FORM.BtnDocKKM.enabled:=CHECK_DOSTUP('$JOU.RNKKM.NEW'); // �������� ���������
        Main_FORM.MnKKM.enabled:=CHECK_DOSTUP('$KKM.ON') and KKM_ON; // �������� ��������



        if ((IS_KKM) and (MODEL_KKM=4))then      Main_Form.MnuKKMshtrih.Visible:=true;

        GlCanKKM:=CHECK_DOSTUP('$KKM.ON');// and KKM_ON;
        MAIN_FORM.ReportOneStfakt.enabled:=CHECK_DOSTUP('$REPORT.ONE_STFAKT'); // ����� � ������ ����-�������
        MAIN_FORM.MnReportINN.enabled:=CHECK_DOSTUP('$REPORT.INN'); // ������� ���
        MAIN_FORM.MnReportsClientsDiscont.enabled:=CHECK_DOSTUP('$REPORT.CARD'); // ������������� ����������� ����
        MAIN_FORM.MnReportPost.enabled:=CHECK_DOSTUP('$REPORT.POST'); // ������ � ������������
        MAIN_FORM.MnReportsClients.enabled:=CHECK_DOSTUP('$REPORT.INN') or CHECK_DOSTUP('$REPORT.CARD') or CHECK_DOSTUP('$REPORT.POST') or CHECK_DOSTUP('$REPORT.MAZURIK');
        MAIN_FORM.MnReportPol.enabled:=CHECK_DOSTUP('$REPORT.POL');
        MAIN_FORM.MnReportOtg.enabled:=CHECK_DOSTUP('$REPORT.OTG');
        MAIN_FORM.MnReportPolOtg.enabled:=CHECK_DOSTUP('$REPORT.POL') or CHECK_DOSTUP('$REPORT.OTG');
        MAIN_FORM.MnReportSkid.enabled:=CHECK_DOSTUP('$REPORT.OSNSKID');
        Main_Form.MnReportMoney.enabled:=CHECK_DOSTUP('$REPORT.MONEY'); // ����� � ����� �� ������
        MAIN_FORM.MnReportMarketKonk.enabled:=CHECK_DOSTUP('$REPORT.MARKET.KONK'); // ������� �����������
        MAIN_FORM.MnReportMarketOld.enabled:=CHECK_DOSTUP('$REPORT.MARKET.OLD'); // ���������� ������
        MAIN_FORM.MnReportMarket.enabled:=CHECK_DOSTUP('$REPORT.MARKET.KONK') or CHECK_DOSTUP('$REPORT.MARKET.OLD'); // ������������� ������������
        MAIN_FORM.MnRepNalog.enabled:=CHECK_DOSTUP('$REPORT.VEDOM_NALOG'); // ��������� �������� ������� �� ������������� 
        MAIN_FORM.ActReportKorr.enabled:=CHECK_DOSTUP('$REPORT.KORR'); // �����-������� �� ��������� ���
        MAIN_FORM.MnReportItog.enabled:=CHECK_DOSTUP('$REPORT.ITOG'); // �������� ������
        MAIN_FORM.ActRepStat.enabled:=CHECK_DOSTUP('$REPORT.STAT'); // ����������
        MAIN_FORM.BtnStat.enabled:=CHECK_DOSTUP('$REPORT.STAT'); // ����������
        MAIN_FORM.ActCardZp.Caption:=CAP_REPORT_CARD_ONE_SHOP;
        MAIN_FORM.ActCardZp.enabled:=CHECK_DOSTUP('$REPORT.CARD_ONE_SHOP'); // ����� � ���������������� ������������ �������
        MAIN_FORM.MnCardSumm.enabled:=CHECK_DOSTUP('$SERVIS.CARD.SUMM'); // ����� �� ������������� �����
        MAIN_FORM.MnCardNUM.enabled:=CHECK_DOSTUP('$SERVIS.CARD.NUM'); // �������� ������
        MAIN_FORM.MnCard.enabled:=MAIN_FORM.MnCardSumm.enabled or MAIN_FORM.MnCardNUM.enabled;
        Main_Form.MnKlnMerge.enabled:=CHECK_DOSTUP('$SERVIS.KLN.MERGE'); // ����������� ���������
        Main_Form.makeComplexRN.enabled:=CHECK_DOSTUP('$SERVIS.MAKE_COMPLEX_RN'); // ����������� ���������
        Main_Form.MnReportTwChange.enabled:=CHECK_DOSTUP('$REPORT.TW.CHANGE'); // �������� �������, ���������� �� ������
        Main_Form.Mn1CExp.enabled:=CHECK_DOSTUP('$SERVIS.1S'); // ������ � 1-� ������������
        Main_Form.Mn1CImp.enabled:=CHECK_DOSTUP('$SERVIS.1S'); // ������ � 1-� ������������
        Main_Form.Mn1CExpRep.enabled:=CHECK_DOSTUP('$SERVIS.1S'); // ������ � 1-� ������������
        Main_Form.MnZP.enabled:=CHECK_DOSTUP('$ZP.ON'); // ������ ���������� �����
        SHOW_ZAKUP:=CHECK_DOSTUP('$SHOW.ZAKUP');
        SHOW_POST:=CHECK_DOSTUP('$FIND.PN');
        JOU_RN_CHANGE:=CHECK_DOSTUP('$JOU.RN.CHANGE'); // ������ � �������� �� � ��������� ��������
        ADM_TW:=CHECK_DOSTUP('$ADM.TW'); //
        TW_CAN_CREATE:=CHECK_DOSTUP('$DICTW.CAN_CREATE'); // �������� ������ � ������ �������
        TW_CAN_EDIT:=CHECK_DOSTUP('$DICTW.CAN_EDIT'); // ��������� ������ � ������ �������
        TW_CAN_DELETE:=CHECK_DOSTUP('$DICTW.CAN_DELETE'); // �������� ������ � ������ �������
        CAN_ADM_JOU:=CHECK_DOSTUP('$ADM.JOU'); // ����������������� ��������
        CAN_ADM_KONTAKT:=CHECK_DOSTUP('$ADM.KONTAKT'); // ����������������� ��������
        KKM_NOOST:=CHECK_DOSTUP('$DOC.KKM.NOOST'); // ����������� ���������� ��� ������������� �������
        Main_Form.MnLinkNotable.enabled:=CHECK_DOSTUP('$ADM.LINKNOTABLE'); // �������, ����������� �� �������������
        Main_Form.MnLinkNoField.enabled:=CHECK_DOSTUP('$ADM.LINKNOFIELD'); // ����, ����������� �� �������������
        Main_Form.DicPropTwktg.enabled:=CHECK_DOSTUP('$DICPROPKTG'); // ���������� ��������� ������
        ADM_TIME:=CHECK_DOSTUP('$ADM.TIME'); // ����������� ������ ����� ��������� � �������� �������
        Main_form.MnMailingMail.Enabled := CHECK_DOSTUP('$MAIL.SHOW'); //������ �����
        Main_form.SpeedItem3.Enabled := CHECK_DOSTUP('$MAIL.SHOW'); //������ �����
        Main_form.MnDocEmail.Enabled := CHECK_DOSTUP('$MAIL.NEW'); //����� ������
        Main_form.N20.Enabled := CHECK_DOSTUP('$JOU.GARANT_TALON.SHOW'); // ������ ����������� �������
        Main_form.N19.Enabled := CHECK_DOSTUP('$JOU.DISKONT.SHOW');// ������ ���������
        Main_form.N12.Enabled := CHECK_DOSTUP('$JOU.PSORT.SHOW');//������ ����� �����������
        Main_form.MnJouSpis.Enabled := CHECK_DOSTUP('$JOU.SPIS.SHOW');
        Main_form.MnJouST.Enabled := CHECK_DOSTUP('$JOU.ST.SHOW');//������ ������
        Main_form.SpeedItem15.Enabled := CHECK_DOSTUP('$JOU.ST.SHOW');//������ ������
        Main_form.MnJouSTFAKT.Enabled := CHECK_DOSTUP('$JOU.STF.SHOW');//������ ������-������
        Main_form.SpeedItem16.Enabled := CHECK_DOSTUP('$JOU.STF.SHOW');//������ ������-������
        Main_form.ActJouRemon.Enabled := CHECK_DOSTUP('$JOU.REMON.SHOW');//������ ����� ����������
        Main_form.SpeedItem7.Enabled := CHECK_DOSTUP('$JOU.REMON.SHOW');//������ ����� ����������
        Main_form.MnJouPerem.Enabled := CHECK_DOSTUP('$JOU.PER.SHOW');//������ ��������� �����������
        Main_form.SpeedItem5.Enabled := CHECK_DOSTUP('$JOU.PER.SHOW');//������ ��������� �����������
        Main_form.SpeedItem13.Enabled := CHECK_DOSTUP('$JOU.PER.SHOW');//��������� �����������
        Main_form.N9.Enabled := CHECK_DOSTUP('$JOU.GARANT_TALON.NEW');//����������� �����
        main_form.DocPSort.Enabled := check_dostup('$JOU.PSORT.NEW'); //��� �����������

        main_form.ActDocRemon.Enabled := check_dostup('$JOU.SPIS.NEW'); //��� ����������
        main_form.SpeedItem6.Enabled := check_dostup('$JOU.SPIS.NEW');  //��� ����������

        main_form.mndocst.Enabled := check_dostup('$JOU.ST.NEW'); //����
        main_form.SpeedItem11.Enabled := check_dostup('$JOU.ST.NEW'); //����
        main_form.n109.Enabled := check_dostup('$JOU.ZREMON.NEW'); //������ �� ����������
        main_form.MnDocsPerem.Enabled:= check_dostup('$JOU.PER.NEW');//������ �� �����������
        main_form.BtnDicUsl.enabled := check_dostup('$DIC.DIC_USLUGI.SHOW');//���������� ������
        main_form.mnpn.enabled :=Check_Dostup('$JOU.PN.NEW');
        main_form.mnpnwozw.enabled :=Check_Dostup('$DOC.AKT_WOZW_POST.NEW');
        main_form.mnrn.enabled :=Check_Dostup('$JOU.RN.NEW') or Check_Dostup('JOU.VIPISKA.CREATE') or Check_Dostup('$JOU.RN.REZ.NEW');
        main_form.mnwozw.enabled :=Check_Dostup('$DOC.AKT_WOZW.NEW');

        main_form.mnservis.Enabled:=Check_Dostup('$SERVIS.DOSTUP');
        main_form.mnreports.Enabled:=Check_Dostup('$REPORT.DOSTUP');
        main_form.mnmailing.Enabled:=Check_Dostup('$MAIL.DOSTUP');
        main_form.mnjou.Enabled:=Check_Dostup('$JOU.DOSTUP');
        main_form.mndocs.Enabled:=Check_Dostup('$DOC.DOSTUP');

        main_form.SpeedItem3.Enabled:= CHECK_DOSTUP('$MAIL.NEW') and  Check_Dostup('$MAIL.DOSTUP');
        main_form.SpeedItem15.Enabled:= CHECK_DOSTUP('$JOU.ST.SHOW') and  Check_Dostup('$JOU.DOSTUP');
        main_form.SpeedItem17.Enabled:= CHECK_DOSTUP('$JOU.PER.SHOW') and  Check_Dostup('$JOU.DOSTUP');
        main_form.SpeedItem18.Enabled:= CHECK_DOSTUP('$JOU.SPIS.SHOW') and  Check_Dostup('$JOU.DOSTUP');
        main_form.SpeedItem20.Enabled:= CHECK_DOSTUP('$MAIL.SHOW') and  Check_Dostup('$MAIL.DOSTUP');


        main_form.JouSale.enabled := check_dostup('$JOU.SALE.SHOW');	//��������� ������� ������


        main_form.DocSale.enabled := check_dostup('$JOU.SALE.NEW');	//�������� �������
        main_form.mnuJouSale.Enabled := main_form.JouSale.Enabled;
        main_form.mnudocSale.Enabled := main_form.DocSale.Enabled;

        main_form.mnuSetMOneyDopusk.Visible:= check_dostup('EDIT_MONEY_DOPUSK');

        main_form.mnuWozwToPost.Visible:=check_dostup('MAKE_VN_REAL_WOZW');
        main_form.mnuMakeRealToKln.Visible:=check_dostup('MAKE_VN_REAL_WOZW');


//        if not  IsExtMode then
//            begin
//            main_form.mnuJouSale.ShortCut := ShortCut(0, []);
//            main_form.mnuDocSale.ShortCut := ShortCut(0, []);
//            end
//            else
//            begin
//              main_form.MnDocKKM.ShortCut:= ShortCut(0, []);
//              main_form.MnJouKKM.ShortCut:= ShortCut(0, []);
//            end;

end;

function NDS_DATE(DT:tdatetime; RNTYP_ID: integer=0):double;
begin

//select MAX(NDS) AS NDS, MIN(NDS) AS NDS_SMALL from NDS
//where NDS_DATE = (SELECT MAX(NDS_DATE) FROM NDS WHERE NDS_DATE < '07.04.2004')

//����� �������� 10�04�2004 ��� ���=10%
   Datamodule1.NdsNpTransaction.Active:=False;
   ADD_SQL(Datamodule1.QrNdsNp,'select NDS from nds_current(:dt)');
//   ADD_SQL(Datamodule1.QrNdsNp,'select MAX(NDS) AS NDS, MIN(NDS) AS NDS_SMALL from NDS where NDS_DATE = (SELECT MAX(NDS_DATE) FROM NDS WHERE NDS_DATE < :dt)');
   Datamodule1.QrNdsNp.paramByname('dt').asdatetime:=dt;
   Datamodule1.QrNdsNp.open;
   result:=Datamodule1.QrNdsNp.fieldByname('NDS').asfloat;

   Datamodule1.QrNdsNp.close;

   Datamodule1.NdsNpTransaction.Active:=False;

   if RNTYP_ID <> 0 then
   begin
       try
 	   ADD_SQL(Datamodule1.QrNdsNp,'select RNTYP_NDS from RNTYP WHERE RNTYP_ID=:RNTYP_ID');
	   Datamodule1.QrNdsNp.paramByname('RNTYP_ID').asinteger:=RNTYP_ID;
	   Datamodule1.QrNdsNp.open;
	   if ( Datamodule1.QrNdsNp.fieldByname('RNTYP_NDS').asinteger=2) then
		   result:=0;
	   if ( Datamodule1.QrNdsNp.fieldByname('RNTYP_NDS').asinteger=0) then
		   result:=0;
	   Datamodule1.QrNdsNp.close;
     Datamodule1.NdsNpTransaction.Active:=False;
       except
       end;
   end;



end;
//����� �������� 10�04�2004 ��� ���=10%
function NDS_SMALL_DATE(DT:tdatetime):double;
begin
   Datamodule1.NdsNpTransaction.Active:=False;
   ADD_SQL(Datamodule1.QrNdsNp,'select NDS_SMALL from nds_current(:dt)');
//   ADD_SQL(Datamodule1.QrNdsNp,'select MAX(NDS) AS NDS, MIN(NDS) AS NDS_SMALL from NDS where NDS_DATE = (SELECT MAX(NDS_DATE) FROM NDS WHERE NDS_DATE < :dt)');
   Datamodule1.QrNdsNp.paramByname('dt').asdatetime:=dt;
   Datamodule1.QrNdsNp.open;
   result:=Datamodule1.QrNdsNp.fieldByname('NDS_SMALL').asfloat;
   Datamodule1.QrNdsNp.close;
end;

function NP_DATE(RNTYP_ID:integer;DT:tdatetime):double;
begin
   Datamodule1.NdsNpTransaction.Active:=False;
   ADD_SQL(Datamodule1.QrNdsNp,'select NP from np_current(:rntyp_id,:dt)');
   Datamodule1.QrNdsNp.paramByname('RNTYP_ID').asinteger:=RNTYP_ID;
   Datamodule1.QrNdsNp.paramByname('dt').asdatetime:=dt;
   Datamodule1.QrNdsNp.open;
   result:=Datamodule1.QrNdsNp.fieldByname('NP').asfloat;
   Datamodule1.QrNdsNp.close;
   Datamodule1.NdsNpTransaction.Active:=False;
end;

{��������� �������������� ����������� ����, ��������� � ���, ������������� �������� � �������,
��������� � ���������� ��������, ������������� � ����������� ������������.
�������� 1. ��� �������� ������ ���������. 2. ��� �������� ������� ���������. 3. ��� ����� �����.
4. ��� ����� ��������. 5. ��� ����� ���� (������ ������������ �� ����������� �������}
//procedure SetFrmShopZone(_frmID: integer; _shopID: integer; _zoneID: integer;
//   				_FRM: TRxDBLookupCombo; _SHOP: TRxDBLookupCombo; _ZONE: TRxDBLookupCombo);
//var tr: TIBTransaction;
//	qry: TIBQuery;
//    frmQuery: TIBQuery;
//    shopQuery: TIBQuery;
//    zoneQuery: TIBQuery;
//                   
//begin
// {������������� ����������� ����}
//  tr := TIBTransaction.Create(nil);
//  qry:= TIBQuery.Create(nil);
// try
//
//  tr.AddDatabase(DataModule1.IBDatabase1);
//  qry.Database:=DataModule1.IBDatabase1;
//  qry.transaction:=tr;
//
//  if _FRM<> nil then
//    frmQuery:= TIBQuery(_FRM.lookupsource.dataset);
//  if _SHOP<> nil then
//  shopQuery:= TIBQuery(_SHOP.lookupsource.dataset);
//  if _ZONE<> nil then
//  zoneQuery:= TIBQuery(_ZONE.lookupsource.dataset);
//
//  if _FRM <> nil then
//  begin
//   if not frmQuery.Active then
//   begin
//   	frmQuery.Close;
//
//
//   	if IsExtMode then
//    begin
//    frmQuery.SQL.Text := '  select kln.kln_id,  (select kln_data.kln_short from kln_data(kln.kln_id)) '+
//      ' from kln where kln.kln_frm = :KLN_FRM ';
//
//	  frmQuery.ParamByName('KLN_FRM').asinteger:=2
//    end
//   	else
//    begin
//        frmQuery.SQL.Text := ' select kln.kln_id,  (select kln_data.kln_short from kln_data(kln.kln_id))  from kln where (kln.kln_frm = :KLN_FRM) or (kln.kln_id=4) ';
//        frmQuery.ParamByName('KLN_FRM').asinteger:=1;
//    end;
//    
//   	frmQuery.Open;
//   end;
//  end;
//
//
//
//  //������ �����
//  if _frmID >0 then
//  begin
//
//    if strtoint('0'+_FRM.Value) <> _frmID then
//  	_FRM.Value := inttostr(_frmID);
//    if _FRM.Value='' then
//    begin
//      qry.SQL.Text:='SELECT KLN_FULL FROM KLN_DATA(:KLN_ID)';
//  	  qry.parambyname('KLN_ID').asinteger:=_frmID;
//	  qry.Open;
//      if not qry.Eof then
//      begin
//      _FRM.displayempty:=qry.Fieldbyname('KLN_FULL').asstring;
//      _FRM.emptyvalue:=inttostr(_frmID);
//      end;
//      qry.Close;
//    end;
//	//�������� ������ ��������� ���������
//	if _Shop <> nil then
//    begin
//      SHOPQuery.Close;
//      try
//      if IsExtMode then
//   		shopQuery.ParamByName('shop_mode').asinteger:=1
//       	else
//       	shopQuery.ParamByName('shop_mode').asinteger:=0;
//
//      except
//      end;
//
//    shopQuery.Open;
//    end;
//    
//  end;
//
//
//
//  if _shopID>0 then
//  begin
//
//    if strtoint('0'+_SHOP.Value) <> _shopID then
//  		_SHOP.Value := inttostr(_shopID);
//
//    if _SHOP.Value='' then
//    begin
//      qry.SQL.Text:='SELECT SHOP_NAME FROM SHOP  WHERE SHOP_ID=:SHOP_ID';
//      qry.parambyname('SHOP_ID').asinteger:=_shopID;
//      qry.Open;
//      if not qry.Eof then
//      begin
//       _SHOP.displayempty:=qry.Fieldbyname('SHOP_NAME').asstring;
//       _SHOP.emptyvalue:=inttostr(_shopID);
//      end;
//      qry.Close;
//    end;
//    if (_Zone <> nil) then
//    begin
//     zoneQuery.Close;
//     zoneQuery.ParamByName('SHOP_ID').asinteger := strtoint('0'+_SHOP.value);
//     zoneQuery.Open;
//    end;
//    
//  end;
//
//
//  if _zoneID <> -1 then
//  begin
//
//   if (_zoneID=0) and (not ZoneQuery.eof) then
//  	_ZONE.Value:= zoneQuery.fieldbyname('zone_id').asstring
//   else
//    begin
//
//     if strtoint('0'+_ZONE.Value) <> _zoneID then
//  	  _ZONE.Value := inttostr(_zoneID);
//
//
//     if _ZONE.Value='' then
//     begin
//      qry.SQL.Text:='SELECT ZONE_NAME FROM ZONE  WHERE ZONE_ID=:ZONE_ID';
//  	  qry.parambyname('ZONE_ID').asinteger:=_zoneID;
//	  qry.Open;
//      if not qry.Eof then
//      begin
//      _ZONE.displayempty:=qry.Fieldbyname('ZONE_NAME').asstring;
//      _ZONE.emptyvalue:=inttostr(_zoneID);
//      end;
//      qry.Close;
//     end;
//    end;
//  end;
//
//
// if tr.InTransaction then
// 	tr.Commit;
//
//
//
// except
// 	on e: Exception do
//    begin
//    	if tr.InTransaction then
//        	tr.Rollback;
//        MESSBOX(e.message, MessCritical, MB_OK);
//    end;
// end;
//
// freeandnil(tr);
// freeandnil(qry);
//
//end;



end.
