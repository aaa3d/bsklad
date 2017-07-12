unit SetMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, Db, IBCustomDataSet, IBQuery, IBDatabase,
  ComCtrls, ExtCtrls, StdCtrls, ToolWin, RXSpin, RxLookup, Mask, ToolEdit,
  CurrEdit,VclUtils, Buttons, Menus, Grids, DBGrids, RXDBCtrl;

type
  TSet_Main = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    BtnSave: TToolButton;
    BtnApply: TToolButton;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    ST_TEXT: TMemo;
    Panel2: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    SetTransaction: TIBTransaction;
    SetQuery: TIBQuery;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Image1: TImage;
    RichEdit2: TRichEdit;
    RN_TEXT: TMemo;
    TabSheet4: TTabSheet;
    Panel3: TPanel;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    Panel4: TPanel;
    Edit2: TEdit;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button2: TButton;
    Panel5: TPanel;
    Edit3: TEdit;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Button3: TButton;
    Panel6: TPanel;
    Edit4: TEdit;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ColorDialog1: TColorDialog;
    Label3: TLabel;
    Panel7: TPanel;
    Edit5: TEdit;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    Button5: TButton;
    Panel8: TPanel;
    Edit6: TEdit;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    Button6: TButton;
    Panel9: TPanel;
    Edit7: TEdit;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    Button7: TButton;
    Panel10: TPanel;
    Edit8: TEdit;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    Button8: TButton;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    MARKET_PERIOD: TRxSpinEdit;
    Label5: TLabel;
    Label6: TLabel;
    TIME_GET_DISCONT: TRxSpinEdit;
    Label7: TLabel;
    Label8: TLabel;
    ST_NUM_CALC: TComboBox;
    Label9: TLabel;
    PER_NUM_CALC: TComboBox;
    SPIS_NUM_CALC: TComboBox;
    Label10: TLabel;
    TabSheet5: TTabSheet;
    Label11: TLabel;
    QrSHOP: TIBQuery;
    SetTransaction2: TIBTransaction;
    QrSHOPSHOP_ID: TIntegerField;
    QrSHOPSHOP_NAME: TIBStringField;
    QrSHOPSHOP_LAST: TDateTimeField;
    QrSHOPSHOP_OFFICE: TIBStringField;
    QrSHOPSHOP_PREFIX: TIBStringField;
    QrSHOPSHOP_POSTFIX: TIBStringField;
    QrSHOPSHOP_COLOR: TIntegerField;
    DsShop: TDataSource;
    SHOP: TRxDBLookupCombo;
    Bevel1: TBevel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    SKL1: TRxDBLookupCombo;
    SHOP1: TRxDBLookupCombo;
    KLN1: TEdit;
    BTN_KLN1: TButton;
    FRM1: TEdit;
    BTN_FRM1: TButton;
    QrSKL: TIBQuery;
    QrSKLSKL_ID: TIntegerField;
    QrSKLSKL_FULL: TIBStringField;
    DsSKL: TDataSource;
    Label16: TLabel;
    KKM1: TRxSpinEdit;
    TabSheet6: TTabSheet;
    Panel11: TPanel;
    Image3: TImage;
    RichEdit3: TRichEdit;
    GARANT_TEXT: TMemo;
    Label20: TLabel;
    GARANT_NUM_CALC: TComboBox;
    Label22: TLabel;
    OTGRUZ_LAST_DATE: TDateEdit;
    TabSheet7: TTabSheet;
    GroupBox1: TGroupBox;
    Speed1_1: TCheckBox;
    Speed1_2: TCheckBox;
    Speed1_3: TCheckBox;
    Speed1_4: TCheckBox;
    Speed1_5: TCheckBox;
    Speed1_6: TCheckBox;
    GroupBox2: TGroupBox;
    Speed2_1: TCheckBox;
    Speed2_2: TCheckBox;
    Speed2_3: TCheckBox;
    Speed2_4: TCheckBox;
    Speed2_5: TCheckBox;
    Speed2_6: TCheckBox;
    Label23: TLabel;
    STFAKT_NUM_CALC: TComboBox;
    Label24: TLabel;
    NDS: TRxCalcEdit;
    QrUsgroup: TIBQuery;
    QrUsgroupUSGROUP_ID: TIntegerField;
    QrUsgroupUSGROUP_NAME: TIBStringField;
    DsUsgroup: TDataSource;
    PopupMenu1: TPopupMenu;
    MnSave: TMenuItem;
    MnApply: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label28: TLabel;
    REMON_NUM_CALC: TComboBox;
    Panel12: TPanel;
    Edit9: TEdit;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    Button10: TButton;
    Panel13: TPanel;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    Button9: TButton;
    TabSheet9: TTabSheet;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Bevel9: TBevel;
    TWED: TRxDBLookupCombo;
    TWKTG: TRxDBLookupCombo;
    TWVALUTA: TRxDBLookupCombo;
    QrVALUTA: TIBQuery;
    QrTWKTG: TIBQuery;
    QrED: TIBQuery;
    QrEDED_ID: TIntegerField;
    QrEDED_FULL: TIBStringField;
    QrTWKTGTWKTG_ID: TIntegerField;
    QrTWKTGTWKTG_NAM: TIBStringField;
    QrVALUTAVALUTA_FULL: TIBStringField;
    QrVALUTAVALUTA_ID: TIntegerField;
    DsED: TDataSource;
    DsTWKTG: TDataSource;
    DsVALUTA: TDataSource;
    Label33: TLabel;
    Bevel14: TBevel;
    SERVER_NAME: TEdit;
    Bevel15: TBevel;
    Label34: TLabel;
    Bevel16: TBevel;
    Label35: TLabel;
    QrOwner: TIBQuery;
    DsOwner: TDataSource;
    QrOwnerOWNER_ID: TIntegerField;
    QrOwnerOWNER_NAME: TIBStringField;
    OWNER_PN: TRxDBLookupCombo;
    OWNER_REMON: TRxDBLookupCombo;
    Label36: TLabel;
    QrRNTYP: TIBQuery;
    DsRNTYP: TDataSource;
    QrRNTYPRNTYP_ID: TIntegerField;
    QrRNTYPRNTYP_FULL: TIBStringField;
    ST_SKID: TRxDBLookupCombo;
    QrRNVID: TIBQuery;
    QrPNVID: TIBQuery;
    QrRNVIDRNVID_ID: TIntegerField;
    QrRNVIDRNVID_NAM: TIBStringField;
    QrRNVIDTM: TDateTimeField;
    QrPNVIDPNVID_ID: TIntegerField;
    QrPNVIDPNVID_NAM: TIBStringField;
    QrPNVIDPNVID_ACTIV: TIntegerField;
    QrPNVIDTM: TDateTimeField;
    DsRNVID: TDataSource;
    DsPNVID: TDataSource;
    Label37: TLabel;
    Bevel17: TBevel;
    PNVID: TRxDBLookupCombo;
    Label38: TLabel;
    Bevel18: TBevel;
    RNVID: TRxDBLookupCombo;
    Label39: TLabel;
    ZAY_PNVID: TRxDBLookupCombo;
    Label40: TLabel;
    USGROUP: TRxDBLookupCombo;
    Bevel19: TBevel;
    Label41: TLabel;
    Bevel20: TBevel;
    Edit10: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    LOCAL_PATH: TEdit;
    GLOBAL_PATH: TEdit;
    TMP_PATH: TEdit;
    TabSheet10: TTabSheet;
    Label43: TLabel;
    EMAIL_HOST: TEdit;
    UTW_EMAIL: TEdit;
    Label48: TLabel;
    NO_EMAIL: TEdit;
    Label45: TLabel;
    Label46: TLabel;
    OK_EMAIL: TEdit;
    Label47: TLabel;
    NOOK_EMAIL: TEdit;
    Label49: TLabel;
    HOME_EMAIL: TEdit;
    Label50: TLabel;
    EMAIL_RUB: TRxCalcEdit;
    EMAIL_DOLLAR: TRxCalcEdit;
    Label51: TLabel;
    TITLE_EMAIL: TEdit;
    Label52: TLabel;
    Label54: TLabel;
    DATE_EXP2: TDateEdit;
    TIME_EXP2: TEdit;
    ZAY_MES: TRxSpinEdit;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    ZAY_PERCENT_WARNING: TRxSpinEdit;
    Label58: TLabel;
    Label60: TLabel;
    ISKKM: TEdit;
    IS_EMAIL: TCheckBox;
    Label61: TLabel;
    Label62: TLabel;
    Jou_Refresh: TRxSpinEdit;
    Bevel21: TBevel;
    Label63: TLabel;
    Bevel22: TBevel;
    Label64: TLabel;
    PNVID_WOZW: TRxDBLookupCombo;
    RNVID_WOZW: TRxDBLookupCombo;
    Label21: TLabel;
    KKM_ONLINE: TEdit;
    Label42: TLabel;
    PSORT_NUM_CALC: TComboBox;
    Label17: TLabel;
    RNTYP_KKM: TRxDBLookupCombo;
    Label18: TLabel;
    KKM_SHOP: TComboBox;
    Label19: TLabel;
    PO_NUM_CALC: TComboBox;
    REPEAT_EMAIL: TEdit;
    Label44: TLabel;
    Label53: TLabel;
    ZREMON_NUM_CALC: TComboBox;
    Label59: TLabel;
    DefExpeditor: TRxLookupEdit;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    GroupBox3: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    keepUnprovRN: TRxSpinEdit;
    keep_TEMP_RN: TRxSpinEdit;
    keepProvVIP: TRxSpinEdit;
    Label69: TLabel;
    RxDBGrid1: TRxDBGrid;
    DOP_FIRM_SELECT: TSpeedButton;
    DOP_FIRM_DELETE: TSpeedButton;
    DsDopFirm: TDataSource;
    QrDopFirm: TIBQuery;
    QrDopFirmKLN_ID: TIntegerField;
    QrDopFirmF_1: TIBStringField;
    SetTransactionDopFirm: TIBTransaction;
    Label70: TLabel;
    NacProcent: TRxSpinEdit;
    Label71: TLabel;
    RNTYP_DOP: TRxDBLookupCombo;
    PNTYP_DOP: TRxDBLookupCombo;
    Label72: TLabel;
    QrPNTYP: TIBQuery;
    DsPnTYP: TDataSource;
    QrPNTYPPNTYP_ID: TIntegerField;
    QrPNTYPPNTYP_FULL: TIBStringField;
    cbCreditMode: TComboBox;
    Label73: TLabel;
    KKM_PRINT_NAME: TComboBox;
    Label68: TLabel;
    FRM: TRxDBLookupCombo;
    IBQuery_frm: TIBQuery;
    DataSource2: TDataSource;
    IBQuery_frmKLN_ID: TIntegerField;
    IBQuery_frmF_1: TIBStringField;
    procedure Change_FrmKln(ID,N:integer);
    procedure FormShow(Sender: TObject);
    procedure ST_TEXTChange(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure RN_TEXTChange(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure RadioButton13Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure RadioButton16Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SHOPChange(Sender: TObject);
    procedure BTN_KLN1Click(Sender: TObject);
    procedure BTN_FRM1Click(Sender: TObject);
    procedure SKL1Change(Sender: TObject);
    procedure SHOP1Change(Sender: TObject);
    procedure KKM1Change(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure RadioButton19Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure RadioButton18Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure SERVER_NAMEChange(Sender: TObject);
    procedure Speed1_1Click(Sender: TObject);
    procedure OWNER_REMONChange(Sender: TObject);
    procedure TWVALUTAChange(Sender: TObject);
    procedure ST_SKIDChange(Sender: TObject);
    procedure LOCAL_PATHChange(Sender: TObject);
    procedure GLOBAL_PATHChange(Sender: TObject);
    procedure TMP_PATHChange(Sender: TObject);
    procedure NO_EMAILChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure KKM_ONLINEChange(Sender: TObject);
    procedure RNTYP_KKMChange(Sender: TObject);
    procedure KKM_SHOPChange(Sender: TObject);
    procedure PO_NUM_CALCChange(Sender: TObject);
    procedure DOP_FIRM_SELECTClick(Sender: TObject);
    procedure DOP_FIRM_DELETEClick(Sender: TObject);
    procedure LoadEmailSettings;
    procedure FRMChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
    SETSHOP=record
      SKL:integer;
      SHOP:integer;
      FRM:integer;
      KLN:integer;
      KKM1:integer;
      CFG_SKL:integer;
      CFG_SHOP:integer;
      CFG_FRM:integer;
      CFG_KLN:integer;
      CFG_KKM1:integer;
      SHOP_ID:integer;
      LOCAL_PATH:ansistring;
      GLOBAL_PATH:ansistring;
      TMP_PATH:ansistring;
      CFG_LOCAL_PATH:integer;
      CFG_GLOBAL_PATH:integer;
      CFG_TMP_PATH:integer;
      CFG_KKM_ONLINE:integer;
      KKM_ONLINE:string;
      RNTYP_KKM:integer;
      CFG_RNTYP_KKM:integer;
      KKM_SHOP:integer;
      CFG_KKM_SHOP:integer;
    end;

var
  ISKKM_ID:integer;
  CNT_SETSHOP:integer;
  ARR_SETSHOP:array[1..1000] of SETSHOP;
  Set_Main: TSet_Main;
  ST_SKID_ID:integer;
  ST_TEXT_ID:integer;
  RN_TEXT_ID:integer;
  GARANT_TEXT_ID:integer;
  TW_COLOR_ID:integer;
  TW_FON_ID:integer;
  USGROUP_ID:integer;
  OST_COLOR1_ID:integer;
  OST_COLOR2_ID:integer;
  OST_COLOR3_ID:integer;
  OST_COLOR4_ID:integer;
  OTG_COLOR1_ID:integer;
  OTG_COLOR2_ID:integer;
  OTG_COLOR3_ID:integer;
  OTG_COLOR4_ID:integer;
  MARKET_PERIOD_ID:integer;
  TIME_GET_DISCONT_ID:integer;
  ST_NUM_CALC_ID:integer;
  ZREMON_NUM_CALC_ID:integer;
  REMON_NUM_CALC_ID:integer;
  PSORT_NUM_CALC_ID:integer;
  STFAKT_NUM_CALC_ID:integer;
  PER_NUM_CALC_ID:integer;
  OPLATA_NUM_CALC_ID:integer;
  SPIS_NUM_CALC_ID:integer;
  GARANT_NUM_CALC_ID:integer;
  KEEP_UNPROV_RN_ID: integer;
  KEEP_PROV_VIP_ID: integer;
  KEEP_TEMP_RN_ID: integer;
  NAC_PERCENT_ID: integer;

  OTGRUZ_LAST_DATE_ID:integer;
  PO_NUM_CALC_ID:integer;
  NDS_ID:integer;
  SAVE:boolean;
  Speed1_1_ID,Speed1_2_ID,Speed1_3_ID,Speed1_4_ID,Speed1_5_ID,Speed1_6_ID:integer;
  Speed2_1_ID,Speed2_2_ID,Speed2_3_ID,Speed2_4_ID,Speed2_5_ID,Speed2_6_ID:integer;
  TWED_ID,TWKTG_ID,TWVALUTA_ID:integer;
  DEFAULT_SERVER_NAME_ID:integer;
  OWNER_PN_ID:integer;
  OWNER_REMON_ID:integer;
  ZAY_PNVID_ID,PNVID_ID,RNVID_ID:integer;
  HOST_ID:integer;
  NO_EMAIL_ID:integer;
  OK_EMAIL_ID:integer;
  REPEAT_EMAIL_ID:integer;
  NOOK_EMAIL_ID:integer;
  UTW_EMAIL_ID:integer;
  HOME_EMAIL_ID:integer;
  TITLE_EMAIL_ID:integer;
  RUB_EMAIL_ID:integer;
  DOLLAR_EMAIL_ID:integer;
  DATE_EXP2_ID:integer;
  ZAY_MES_ID:integer;
  ZAY_PERCENT_WARNING_ID:integer;
  KKM_PRINT_NAME_ID:integer;
  IS_EMAIL_ID:integer; // CFG_ID обязательной проверки e-mail у сотрудников
  JOU_REFRESH_ID:integer; // Интервал обновления журналов
  PNVID_WOZW_ID,RNVID_WOZW_ID:integer;
  CREDIT_MODE_ID: integer;

implementation

uses DicKlient;

{$R *.DFM}

procedure TSet_Main.LoadEmailSettings;
begin
     if SetQuery.Transaction.InTransaction then
      SetQuery.Transaction.Commit;


     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="NO_EMAIL" and CFG_SET1='+FRM.Value);
     if SetQuery.eof then begin
        NO_EMAIL_ID:=-1;
        NO_EMAIL.text:='';
     end else begin
          NO_EMAIL_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          NO_EMAIL.text:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="OK_EMAIL" and CFG_SET1='+FRM.Value);
     if SetQuery.eof then begin
        OK_EMAIL_ID:=-1;
        OK_EMAIL.text:='';
     end else begin
          OK_EMAIL_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          OK_EMAIL.text:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="REPEAT_EMAIL" and CFG_SET1='+FRM.Value);
     if SetQuery.eof then begin
        REPEAT_EMAIL_ID:=-1;
        REPEAT_EMAIL.text:='';
     end else begin
          REPEAT_EMAIL_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          REPEAT_EMAIL.text:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="NOOK_EMAIL" and CFG_SET1='+FRM.Value);
     if SetQuery.eof then begin
        NOOK_EMAIL_ID:=-1;
        NOOK_EMAIL.text:='';
     end else begin
          NOOK_EMAIL_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          NOOK_EMAIL.text:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="HOME_EMAIL" and CFG_SET1='+FRM.Value);
     if SetQuery.eof then begin
        HOME_EMAIL_ID:=-1;
        HOME_EMAIL.text:='';
     end else begin
          HOME_EMAIL_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          HOME_EMAIL.text:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="TITLE_EMAIL" and CFG_SET1='+FRM.Value);
     if SetQuery.eof then begin
        TITLE_EMAIL_ID:=-1;
        TITLE_EMAIL.text:='';
     end else begin
          TITLE_EMAIL_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          TITLE_EMAIL.text:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="RUB_EMAIL" and CFG_SET1='+FRM.Value);
     if SetQuery.eof then begin
        RUB_EMAIL_ID:=-1;
        EMAIL_RUB.value:=0;
     end else begin
          RUB_EMAIL_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          EMAIL_RUB.value:=SetQuery.fieldByname('CFG_VALUE').asfloat;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DOLLAR_EMAIL" and CFG_SET1='+FRM.Value);
     if SetQuery.eof then begin
        DOLLAR_EMAIL_ID:=-1;
        EMAIL_DOLLAR.value:=0;
     end else begin
          DOLLAR_EMAIL_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          EMAIL_DOLLAR.value:=SetQuery.fieldByname('CFG_VALUE').asfloat;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="UTW_EMAIL" and CFG_SET1='+FRM.Value);
     if SetQuery.eof then begin
        UTW_EMAIL_ID:=-1;
        UTW_EMAIL.text:='';
     end else begin
          UTW_EMAIL_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          UTW_EMAIL.text:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;
end;


procedure TSet_Main.FormShow(Sender: TObject);
begin
     {Читаем данные}
     GET_DEFAULT;
     CNT_SETSHOP:=0;
     SetTransaction.Active:=False;
     SetTransaction2.Active:=False;
     QrRnVid.close;
     QrRnVid.Open;
     QrPnVid.close;
     QrPnVid.Open;
     QrRnTyp.close;
     QrRnTyp.Open;
     QrOwner.close;
     QrOwner.Open;
     QrEd.close;
     QrEd.Open;
     QrTWKTG.close;
     QrTWKTG.Open;
     QrVALUTA.close;
     QrVALUTA.Open;
     QrShop.close;
     QrShop.Open;
     QrUsgroup.close;
     QrUsgroup.Open;
     QrSKL.close;
     QrSKL.Open;
     SHOP.value:='1';

     QrPNtyp.Open;


     QrDopFirm.Active:=true;

     IBTransaction1.Active:=true;
     IBQuery1.Open;

     while not ibquery1.Eof do
     begin
         if ibquery1.FieldByName('CFG_SET1').asinteger = 1 then
           begin
             defExpeditor.Text := ibquery1.FieldByName('CFG_VALUE').asstring;
             ibquery1.First;
             break;
           end;
         ibquery1.Next;
     end;

     IBQuery_frm.Open;

     FRM.EmptyValue:='0';
     FRM.DisplayEmpty:='Розничная сеть';
     LoadEmailSettings;




     OPEN_SQL(SetQuery,'select CFG_ID,CFG_SET2,CFG_VALUE FROM CFG WHERE CFG_NAME="SPEED" and CFG_SET1=1');
     SetQuery.Open;
     if SetQuery.locate('CFG_SET2',1,[]) then begin
        Speed1_1_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed1_1.checked:=true else Speed1_1.checked:=false;
     end else Speed1_1_ID:=-1;
     if SetQuery.locate('CFG_SET2',2,[]) then begin
        Speed1_2_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed1_2.checked:=true else Speed1_2.checked:=false;
     end else Speed1_2_ID:=-1;
     if SetQuery.locate('CFG_SET2',3,[]) then begin
        Speed1_3_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed1_3.checked:=true else Speed1_3.checked:=false;
     end else Speed1_3_ID:=-1;
     if SetQuery.locate('CFG_SET2',4,[]) then begin
        Speed1_4_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed1_4.checked:=true else Speed1_4.checked:=false;
     end else Speed1_4_ID:=-1;
     if SetQuery.locate('CFG_SET2',5,[]) then begin
        Speed1_5_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed1_5.checked:=true else Speed1_5.checked:=false;
     end else Speed1_5_ID:=-1;
     if SetQuery.locate('CFG_SET2',6,[]) then begin
        Speed1_6_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed1_6.checked:=true else Speed1_6.checked:=false;
     end else Speed1_6_ID:=-1;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_SET2,CFG_VALUE FROM CFG WHERE CFG_NAME="SPEED" and CFG_SET1=2');
     if SetQuery.locate('CFG_SET2',1,[]) then begin
        Speed2_1_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed2_1.checked:=true else Speed2_1.checked:=false;
     end else Speed2_1_ID:=-1;
     if SetQuery.locate('CFG_SET2',2,[]) then begin
        Speed2_2_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed2_2.checked:=true else Speed2_2.checked:=false;
     end else Speed2_2_ID:=-1;
     if SetQuery.locate('CFG_SET2',3,[]) then begin
        Speed2_3_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed2_3.checked:=true else Speed2_3.checked:=false;
     end else Speed2_3_ID:=-1;
     if SetQuery.locate('CFG_SET2',4,[]) then begin
        Speed2_4_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed2_4.checked:=true else Speed2_4.checked:=false;
     end else Speed2_4_ID:=-1;
     if SetQuery.locate('CFG_SET2',5,[]) then begin
        Speed2_5_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed2_5.checked:=true else Speed2_5.checked:=false;
     end else Speed2_5_ID:=-1;
     if SetQuery.locate('CFG_SET2',6,[]) then begin
        Speed2_6_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        if SetQuery.fieldByname('CFG_VALUE').asinteger=1
        then Speed2_6.checked:=true else Speed2_6.checked:=false;
     end else Speed2_6_ID:=-1;




     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_RNVID"');
     RNVID.value:=QrRNVID.fieldbyname('RNVID_ID').asstring;
     if SetQuery.eof then RNVID_ID:=-1
     else begin
          RNVID_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          RNVID.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_PNVID_WOZW"');
     if SetQuery.eof then begin
        PNVID_WOZW_ID:=-1;
        PNVID_WOZW.value:='1';
        DEFAULT_PNVID_WOZW:=1;
     end else begin
          PNVID_WOZW_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          PNVID_WOZW.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
          DEFAULT_PNVID_WOZW:=SetQuery.fieldByname('CFG_VALUE').asinteger;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_RNVID_WOZW"');
     if SetQuery.eof then begin
        RNVID_WOZW_ID:=-1;
        RNVID_WOZW.value:='1';
        DEFAULT_RNVID_WOZW:=1;
     end else begin
          RNVID_WOZW_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          RNVID_WOZW.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
          DEFAULT_RNVID_WOZW:=SetQuery.fieldByname('CFG_VALUE').asinteger;
     end;


      OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="PNTYP_DOP"');
     if SetQuery.eof then begin
        PNTYP_DOP.tag:=-1;
        PNTYP_DOP.value:='1';

     end else begin
          PNTYP_DOP.tag:=SetQuery.fieldByname('CFG_ID').asinteger;
          PNTYP_DOP.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="RNTYP_DOP"');
     if SetQuery.eof then begin
        RNTYP_DOP.tag:=-1;
        RNTYP_DOP.value:='1';

     end else begin
          RNTYP_DOP.tag:=SetQuery.fieldByname('CFG_ID').asinteger;
          RNTYP_DOP.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;



     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_USGROUP"');
     if SetQuery.eof then begin
        USGROUP_ID:=-1;
        USGROUP.value:=QrUsgroup.fieldbyname('USGROUP_ID').asstring;
     end else begin
          USGROUP_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          USGROUP.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,DATE_VALUE FROM CFG WHERE CFG_NAME="LAST_EMAIL_EXPORT"');
     if SetQuery.eof then begin
        DATE_EXP2_ID:=-1;
        DATE_EXP2.date:=date();
        TIME_EXP2.text:='';
     end else begin
          DATE_EXP2_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          DATE_EXP2.date:=SetQuery.fieldByname('DATE_VALUE').asdatetime;
          TIME_EXP2.text:=timetostr(SetQuery.fieldByname('DATE_VALUE').asdatetime);
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="EMAIL_HOST"');
     if SetQuery.eof then begin
        HOST_ID:=-1;
        EMAIL_HOST.text:='';
     end else begin
          HOST_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          EMAIL_HOST.text:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;








//////////////////////////////////////////////////////










////////////////////////////////////////////////







     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_ZAY_PNVID"');
     ZAY_PNVID.value:=QrRNVID.fieldbyname('RNVID_ID').asstring;
     if SetQuery.eof then ZAY_PNVID_ID:=-1
     else begin
          ZAY_PNVID_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          ZAY_PNVID.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_PNVID"');
     PNVID.value:=QrPNVID.fieldbyname('PNVID_ID').asstring;
     if SetQuery.eof then PNVID_ID:=-1
     else begin
          PNVID_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          PNVID.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_OWNER_PN"');
     OWNER_PN_ID:=-1;
     if SetQuery.eof then OWNER_PN.value:=QrOwner.fieldbyname('OWNER_ID').asstring
     else begin
          OWNER_PN_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          OWNER_PN.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_OWNER_REMON"');
     OWNER_REMON_ID:=-1;
     if SetQuery.eof then OWNER_REMON.value:=QrOwner.fieldbyname('OWNER_ID').asstring
     else begin
          OWNER_REMON_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          OWNER_REMON.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_ST_SKID"');
     ST_SKID_ID:=-1;
     if SetQuery.eof then ST_SKID.value:=QrRnTyp.fieldbyname('RNTYP_ID').asstring
     else begin
          ST_SKID_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          ST_SKID.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;


     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="REMON_NUM_CALC"');
     REMON_NUM_CALC.itemIndex:=0;
     if SetQuery.eof then REMON_NUM_CALC_ID:=-1
     else begin
          REMON_NUM_CALC_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          REMON_NUM_CALC.itemIndex:=SetQuery.fieldByname('CFG_VALUE').asinteger-1;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="PO_NUM_CALC"');
     PO_NUM_CALC.itemIndex:=0;
     if SetQuery.eof then PO_NUM_CALC_ID:=-1
     else begin
          PO_NUM_CALC_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          PO_NUM_CALC.itemIndex:=SetQuery.fieldByname('CFG_VALUE').asinteger-1;
     end;




     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="PSORT_NUM_CALC"');
     PSORT_NUM_CALC.itemIndex:=0;
     if SetQuery.eof then PSORT_NUM_CALC_ID:=-1
     else begin
          PSORT_NUM_CALC_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          PSORT_NUM_CALC.itemIndex:=SetQuery.fieldByname('CFG_VALUE').asinteger-1;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="ST_NUM_CALC"');
     ST_NUM_CALC.itemIndex:=0;
     if SetQuery.eof then ST_NUM_CALC_ID:=-1
     else begin
          ST_NUM_CALC_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          ST_NUM_CALC.itemIndex:=SetQuery.fieldByname('CFG_VALUE').asinteger-1;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="ZREMON_NUM_CALC"');
     ZREMON_NUM_CALC.itemIndex:=0;
     if SetQuery.eof then ZREMON_NUM_CALC_ID:=-1
     else begin
          ZREMON_NUM_CALC_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          ZREMON_NUM_CALC.itemIndex:=SetQuery.fieldByname('CFG_VALUE').asinteger-1;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="NDS"');
     NDS.value:=20;
     if SetQuery.eof then NDS_ID:=-1
     else begin
          NDS_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          NDS.Value:=SetQuery.fieldByname('CFG_VALUE').asfloat;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_TWED"');
     if SetQuery.eof then begin
        TWED_ID:=-1;
        TWED.value:=QrED.fieldbyname('ED_ID').asstring;
     end else begin
        TWED_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        TWED.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_SERVER_NAME"');
     if SetQuery.eof then begin
        SERVER_NAME.text:='';
        DEFAULT_SERVER_NAME_ID:=-1;
     end else begin
        DEFAULT_SERVER_NAME_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        SERVER_NAME.text:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_TWTWKTG"');
     if SetQuery.eof then begin
        TWKTG_ID:=-1;
        TWKTG.value:=QrTWKTG.fieldbyname('TWKTG_ID').asstring;
     end else begin
        TWKTG_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        TWKTG.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="ISKKM"');
     ISKKM.text:='';
     if SetQuery.eof then begin
        ISKKM_ID:=-1;
     end else begin
        ISKKM_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        ISKKM.text:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="DEFAULT_TWVALUTA"');
     if SetQuery.eof then begin
        TWVALUTA_ID:=-1;
        TWVALUTA.value:=QrVALUTA.fieldbyname('VALUTA_ID').asstring;
     end else begin
        TWVALUTA_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
        TWVALUTA.value:=SetQuery.fieldByname('CFG_VALUE').asstring;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="STFAKT_NUM_CALC"');
     STFAKT_NUM_CALC.itemIndex:=0;
     if SetQuery.eof then STFAKT_NUM_CALC_ID:=-1
     else begin
          STFAKT_NUM_CALC_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          STFAKT_NUM_CALC.itemIndex:=SetQuery.fieldByname('CFG_VALUE').asinteger-1;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,DATE_VALUE FROM CFG WHERE CFG_NAME="OTGRUZ_LAST_DATE"');
     OTGRUZ_LAST_DATE.date:=DATE()-30;
     if SetQuery.eof then OTGRUZ_LAST_DATE_ID:=-1
     else begin
          OTGRUZ_LAST_DATE_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          OTGRUZ_LAST_DATE.date:=SetQuery.fieldByname('DATE_VALUE').asdatetime;
     end;


     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="GARANT_NUM_CALC"');
     GARANT_NUM_CALC.itemIndex:=0;
     if SetQuery.eof then GARANT_NUM_CALC_ID:=-1
     else begin
          GARANT_NUM_CALC_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          GARANT_NUM_CALC.itemIndex:=SetQuery.fieldByname('CFG_VALUE').asinteger-1;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="ZAY_PRIBYL_MES"');
     ZAY_MES.value:=3;
     if SetQuery.eof then ZAY_MES_ID:=-1
     else begin
          ZAY_MES_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          ZAY_MES.value:=SetQuery.fieldByname('CFG_VALUE').asfloat;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="ZAY_PERCENT_WARNING"');
     ZAY_PERCENT_WARNING.value:=1;
     if SetQuery.eof then ZAY_PERCENT_WARNING_ID:=-1
     else begin
          ZAY_PERCENT_WARNING_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          ZAY_PERCENT_WARNING.value:=SetQuery.fieldByname('CFG_VALUE').asfloat;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="PER_NUM_CALC"');
     PER_NUM_CALC.itemIndex:=0;
     if SetQuery.eof then PER_NUM_CALC_ID:=-1
     else begin
          PER_NUM_CALC_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          PER_NUM_CALC.itemIndex:=SetQuery.fieldByname('CFG_VALUE').asinteger-1;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="SPIS_NUM_CALC"');
     SPIS_NUM_CALC.itemIndex:=0;
     if SetQuery.eof then SPIS_NUM_CALC_ID:=-1
     else begin
          SPIS_NUM_CALC_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          SPIS_NUM_CALC.itemIndex:=SetQuery.fieldByname('CFG_VALUE').asinteger-1;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="TW_COLOR"');
     if SetQuery.eof then begin
        TW_COLOR_ID:=-1;
        RadioButton17.checked:=True;
     end else begin
        if SetQuery.fieldByname('CFG_VALUE').asinteger<0 then RadioButton17.checked:=True
        else begin
          RadioButton18.checked:=True;
          Edit9.font.color:=SetQuery.fieldByname('CFG_VALUE').asinteger;
        end;
        TW_COLOR_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
     end;
     RadioButton18Click(Sender);

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="TW_FON"');
     if SetQuery.eof then begin
        TW_FON_ID:=-1;
        RadioButton19.checked:=True;
     end else begin
        if SetQuery.fieldByname('CFG_VALUE').asinteger<0 then RadioButton19.checked:=True
        else begin
          RadioButton20.checked:=True;
          Edit9.color:=SetQuery.fieldByname('CFG_VALUE').asinteger;
        end;
        TW_FON_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
     end;
     RadioButton19Click(Sender);


     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="MARKET_PERIOD"');
     if SetQuery.eof then MARKET_PERIOD_ID:=-1
     else begin
          MARKET_PERIOD_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          MARKET_PERIOD.value:=SetQuery.fieldByname('CFG_VALUE').asinteger;
     end;
     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="TIME_GET_DISCONT"');
     if SetQuery.eof then TIME_GET_DISCONT_ID:=-1
     else begin
          TIME_GET_DISCONT_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          TIME_GET_DISCONT.value:=SetQuery.fieldByname('CFG_VALUE').asinteger;
     end;


     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="TIME_KEEP_UNPROV_RN"');
     if SetQuery.eof then KEEP_UNPROV_RN_ID:=-1
     else begin
          KEEP_UNPROV_RN_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          KEEPUNPROVRN.value:=SetQuery.fieldByname('CFG_VALUE').asinteger;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="TIME_KEEP_PROV_VIP"');
     if SetQuery.eof then KEEP_PROV_VIP_ID:=-1
     else begin
          KEEP_PROV_VIP_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          KEEPPROVVIP.value:=SetQuery.fieldByname('CFG_VALUE').asinteger;
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="TIME_KEEP_TEMP_RN"');
     if SetQuery.eof then KEEP_TEMP_RN_ID:=-1
     else begin
          KEEP_TEMP_RN_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          KEEP_TEMP_RN.value:=SetQuery.fieldByname('CFG_VALUE').asinteger;
     end;



     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="NAC_PERCENT"');
     if SetQuery.eof then NAC_PERCENT_ID:=-1
     else begin
          NAC_PERCENT_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          NACPROCENT.value:=SetQuery.fieldByname('CFG_VALUE').asinteger;
     end;





     OPEN_SQL(SetQuery,'select CFG_ID,CFG_BIG FROM CFG WHERE CFG_NAME="ST_TEXT"');
     ST_TEXT.Lines.clear;
     if SetQuery.eof then ST_TEXT_ID:=-1
     else begin
          ST_TEXT_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          ST_TEXT.Lines.add(SetQuery.fieldByname('CFG_BIG').asstring);
     end;
     OPEN_SQL(SetQuery,'select CFG_ID,CFG_BIG FROM CFG WHERE CFG_NAME="GARANT_TEXT"');
     GARANT_TEXT.Lines.clear;
     if SetQuery.eof then GARANT_TEXT_ID:=-1
     else begin
          GARANT_TEXT_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          GARANT_TEXT.Lines.add(SetQuery.fieldByname('CFG_BIG').asstring);
     end;
     OPEN_SQL(SetQuery,'select CFG_ID,CFG_BIG FROM CFG WHERE CFG_NAME="RN_TEXT"');
     RN_TEXT.Lines.clear;
     if SetQuery.eof then RN_TEXT_ID:=-1
     else begin
          RN_TEXT_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          RN_TEXT.Lines.add(SetQuery.fieldByname('CFG_BIG').asstring);
     end;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_SET1 FROM CFG WHERE CFG_NAME="CREDIT_MODE"');
     if SetQuery.eof then begin
        CREDIT_MODE_ID:=-1;
        cbCreditMode.ItemIndex:=-1;
     end else begin
          CREDIT_MODE_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
          cbCreditMode.ItemIndex:=SetQuery.fieldByname('CFG_SET1').asinteger;
     end;


     OPEN_SQL(SetQuery,'select CFG_ID,CFG_SET1,CFG_VALUE FROM CFG WHERE CFG_NAME="OST_COLOR"');
     OST_COLOR1_ID:=-1;
     OST_COLOR2_ID:=-1;
     OST_COLOR3_ID:=-1;
     OST_COLOR4_ID:=-1;
     RadioButton1.Checked:=true;
     Edit1.Color:=clWindow;
     RadioButton3.Checked:=true;
     Edit2.Color:=clWindow;
     RadioButton5.Checked:=true;
     Edit3.Color:=clWindow;
     RadioButton6.Checked:=true;
     Edit4.Color:=clWindow;
     if SetQuery.locate('CFG_SET1',1,[]) then begin
       OST_COLOR1_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
       if SetQuery.fieldByname('CFG_VALUE').asinteger>0 then begin
        RadioButton2.Checked:=true;
        Edit1.Color:=SetQuery.fieldByname('CFG_VALUE').asinteger;
       end;
     end;
     if SetQuery.locate('CFG_SET1',2,[]) then begin
       OST_COLOR2_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
       if SetQuery.fieldByname('CFG_VALUE').asinteger>0 then begin
        RadioButton4.Checked:=true;
        Edit2.Color:=SetQuery.fieldByname('CFG_VALUE').asinteger;
       end;
     end;
     if SetQuery.locate('CFG_SET1',3,[]) then begin
       OST_COLOR3_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
       if SetQuery.fieldByname('CFG_VALUE').asinteger>0 then begin
        RadioButton6.Checked:=true;
        Edit3.Color:=SetQuery.fieldByname('CFG_VALUE').asinteger;
       end;
     end;
     if SetQuery.locate('CFG_SET1',4,[]) then begin
       OST_COLOR4_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
       if SetQuery.fieldByname('CFG_VALUE').asinteger>0 then begin
        RadioButton8.Checked:=true;
        Edit4.Color:=SetQuery.fieldByname('CFG_VALUE').asinteger;
       end;
     end;
     Button1.enabled:=RadioButton2.Checked;
     Button2.enabled:=RadioButton4.Checked;
     Button3.enabled:=RadioButton6.Checked;
     Button4.enabled:=RadioButton8.Checked;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_SET1,CFG_VALUE FROM CFG WHERE CFG_NAME="OTG_COLOR"');
     OTG_COLOR1_ID:=-1;
     OTG_COLOR2_ID:=-1;
     OTG_COLOR3_ID:=-1;
     OTG_COLOR4_ID:=-1;
     RadioButton9.Checked:=true;
     Edit5.Color:=clWindow;
     RadioButton11.Checked:=true;
     Edit6.Color:=clWindow;
     RadioButton13.Checked:=true;
     Edit7.Color:=clWindow;
     RadioButton15.Checked:=true;
     Edit8.Color:=clWindow;
     if SetQuery.locate('CFG_SET1',1,[]) then begin
       OTG_COLOR1_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
       if SetQuery.fieldByname('CFG_VALUE').asinteger>0 then begin
        RadioButton10.Checked:=true;
        Edit5.Color:=SetQuery.fieldByname('CFG_VALUE').asinteger;
       end;
     end;
     if SetQuery.locate('CFG_SET1',2,[]) then begin
       OTG_COLOR2_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
       if SetQuery.fieldByname('CFG_VALUE').asinteger>0 then begin
        RadioButton12.Checked:=true;
        Edit6.Color:=SetQuery.fieldByname('CFG_VALUE').asinteger;
       end;
     end;
     if SetQuery.locate('CFG_SET1',3,[]) then begin
       OTG_COLOR3_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
       if SetQuery.fieldByname('CFG_VALUE').asinteger>0 then begin
        RadioButton14.Checked:=true;
        Edit7.Color:=SetQuery.fieldByname('CFG_VALUE').asinteger;
       end;
     end;
     if SetQuery.locate('CFG_SET1',4,[]) then begin
       OTG_COLOR4_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
       if SetQuery.fieldByname('CFG_VALUE').asinteger>0 then begin
        RadioButton16.Checked:=true;
        Edit8.Color:=SetQuery.fieldByname('CFG_VALUE').asinteger;
       end;
     end;
     Button5.enabled:=RadioButton10.Checked;
     Button6.enabled:=RadioButton12.Checked;
     Button7.enabled:=RadioButton14.Checked;
     Button8.enabled:=RadioButton16.Checked;

     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="KKM_PRINT_NAME"');
     KKM_PRINT_NAME.ItemIndex:=0;
     if SetQuery.eof then KKM_PRINT_NAME_ID:=-1
     else begin
          KKM_PRINT_NAME.ItemIndex:=SetQuery.fieldByname('CFG_VALUE').asinteger;
          KKM_PRINT_NAME_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
     end;


     OPEN_SQL(SetQuery,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="JOU_REFRESH_TIME"');
     JOU_REFRESH.value:=60;
     if SetQuery.eof then JOU_REFRESH_ID:=-1
     else begin
          try
             JOU_REFRESH.value:=strtoint(SetQuery.fieldByname('CFG_VALUE').asstring);
          except
          end;
          JOU_REFRESH_ID:=SetQuery.fieldByname('CFG_ID').asinteger;
     end;



     SHOP.value:='1';
     SAVE:=true;
end;

procedure TSet_Main.ST_TEXTChange(Sender: TObject);
begin
     SAVE:=false;
end;

procedure TSet_Main.BtnApplyClick(Sender: TObject);
var
   r:double;
   a:integer;
   s:ansistring;
   exp_id : longint;
begin
     exp_id := -1;
     BtnApply.enabled:=False;
     MnApply.enabled:=False;
     Set_Main.Statusbar1.panels[0].text:='Запись параметра 1...';
     delay(1);
     Try
        ibquery2.SQL.Clear;
        ibquery2.sql.Add('UPDATE CFG SET CFG_SET1 = 0 WHERE CFG_NAME = "EXPEDITOR"');
        ibquery2.ExecSQL;

        OPEN_SQL(ibquery2,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="EXPEDITOR" AND CFG_VALUE = "'+defExpeditor.Text+'"');

        ibquery2.Open;
        if not ibquery2.Eof then   exp_id := ibquery2.fieldbyname('CFG_ID').asinteger;
        ibquery2.Close;

        ibtransaction1.Commit;
        ibtransaction1.Active:=false;

        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;


        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME', 'EXPEDITOR');
        IBSAVE_ADD('CFG_VALUE', defExpeditor.Text);
        IBSAVE_ADD('CFG_SET1', 1);
        if IBSAVE_DOC('CFG', exp_id) <0     then  r:=SQRT(-1);


        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','SPEED');
        IBSAVE_ADD('CFG_SET1','1');
        IBSAVE_ADD('CFG_SET2','1');
        IBSAVE_ADD('CFG_VALUE',Speed1_1.checked);
        SPEED1_1_ID:=IBSAVE_DOC('CFG',SPEED1_1_ID);
        if SPEED1_1_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 2...';
        delay(1);
        IBSAVE_ADD('CFG_SET2','2');
        IBSAVE_ADD('CFG_VALUE',Speed1_2.checked);
        SPEED1_2_ID:=IBSAVE_DOC('CFG',SPEED1_2_ID);
        if SPEED1_2_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 3...';
        delay(1);
        IBSAVE_ADD('CFG_SET2','3');
        IBSAVE_ADD('CFG_VALUE',Speed1_3.checked);
        SPEED1_3_ID:=IBSAVE_DOC('CFG',SPEED1_3_ID);
        if SPEED1_3_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 4...';
        delay(1);
        IBSAVE_ADD('CFG_SET2','4');
        IBSAVE_ADD('CFG_VALUE',Speed1_4.checked);
        SPEED1_4_ID:=IBSAVE_DOC('CFG',SPEED1_4_ID);
        if SPEED1_4_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 5...';
        delay(1);
        IBSAVE_ADD('CFG_SET2','5');
        IBSAVE_ADD('CFG_VALUE',Speed1_5.checked);
        SPEED1_5_ID:=IBSAVE_DOC('CFG',SPEED1_5_ID);
        if SPEED1_5_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 6...';
        delay(1);
        IBSAVE_ADD('CFG_SET2','6');
        IBSAVE_ADD('CFG_VALUE',Speed1_6.checked);
        SPEED1_6_ID:=IBSAVE_DOC('CFG',SPEED1_6_ID);
        if SPEED1_6_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 7...';
        delay(1);
        IBSAVE_ADD('CFG_SET1','2');
        IBSAVE_ADD('CFG_SET2','1');
        IBSAVE_ADD('CFG_VALUE',Speed2_1.checked);
        SPEED2_1_ID:=IBSAVE_DOC('CFG',SPEED2_1_ID);
        if SPEED1_1_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 8...';
        delay(1);
        IBSAVE_ADD('CFG_SET2','2');
        IBSAVE_ADD('CFG_VALUE',Speed2_2.checked);
        SPEED2_2_ID:=IBSAVE_DOC('CFG',SPEED2_2_ID);
        if SPEED1_2_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 9...';
        delay(1);
        IBSAVE_ADD('CFG_SET2','3');
        IBSAVE_ADD('CFG_VALUE',Speed2_3.checked);
        SPEED2_3_ID:=IBSAVE_DOC('CFG',SPEED2_3_ID);
        if SPEED2_3_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 10...';
        delay(1);
        IBSAVE_ADD('CFG_SET2','4');
        IBSAVE_ADD('CFG_VALUE',Speed2_4.checked);
        SPEED2_4_ID:=IBSAVE_DOC('CFG',SPEED2_4_ID);
        if SPEED2_4_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 11...';
        delay(1);
        IBSAVE_ADD('CFG_SET2','5');
        IBSAVE_ADD('CFG_VALUE',Speed2_5.checked);
        SPEED2_5_ID:=IBSAVE_DOC('CFG',SPEED2_5_ID);
        if SPEED2_5_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 12...';
        delay(1);
        IBSAVE_ADD('CFG_SET2','6');
        IBSAVE_ADD('CFG_VALUE',Speed2_6.checked);
        SPEED2_6_ID:=IBSAVE_DOC('CFG',SPEED2_6_ID);
        if SPEED2_6_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 13...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','OTGRUZ_LAST_DATE');
        IBSAVE_ADD('DATE_VALUE',OTGRUZ_LAST_DATE.date);
        OTGRUZ_LAST_DATE_ID:=IBSAVE_DOC('CFG',OTGRUZ_LAST_DATE_ID);
        if OTGRUZ_LAST_DATE_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 14...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','GARANT_TEXT');
        IBSAVE_ADD('CFG_BIG',Memotostr(GARANT_TEXT.lines));
        GARANT_TEXT_ID:=IBSAVE_DOC('CFG',GARANT_TEXT_ID);
        if GARANT_TEXT_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 15...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','ST_TEXT');
        IBSAVE_ADD('CFG_BIG',Memotostr(ST_TEXT.lines));
        ST_TEXT_ID:=IBSAVE_DOC('CFG',ST_TEXT_ID);
        if ST_TEXT_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 16...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','RN_TEXT');
        IBSAVE_ADD('CFG_BIG',Memotostr(RN_TEXT.lines));
        RN_TEXT_ID:=IBSAVE_DOC('CFG',RN_TEXT_ID);
        if RN_TEXT_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 17...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','OST_COLOR');
        IBSAVE_ADD('CFG_SET1',1);
        if RadioButton1.checked then IBSAVE_ADD('CFG_VALUE',-1)
                                else IBSAVE_ADD('CFG_VALUE',Edit1.color);
        OST_COLOR1_ID:=IBSAVE_DOC('CFG',OST_COLOR1_ID);
        if OST_COLOR1_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 18...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','OST_COLOR');
        IBSAVE_ADD('CFG_SET1',2);
        if RadioButton3.checked then IBSAVE_ADD('CFG_VALUE',-1)
                                else IBSAVE_ADD('CFG_VALUE',Edit2.color);
        OST_COLOR2_ID:=IBSAVE_DOC('CFG',OST_COLOR2_ID);
        if OST_COLOR2_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 19...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','OST_COLOR');
        IBSAVE_ADD('CFG_SET1',3);
        if RadioButton5.checked then IBSAVE_ADD('CFG_VALUE',-1)
                                else IBSAVE_ADD('CFG_VALUE',Edit3.color);
        OST_COLOR3_ID:=IBSAVE_DOC('CFG',OST_COLOR3_ID);
        if OST_COLOR3_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 20...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','OST_COLOR');
        IBSAVE_ADD('CFG_SET1',4);
        if RadioButton7.checked then IBSAVE_ADD('CFG_VALUE',-1)
                                else IBSAVE_ADD('CFG_VALUE',Edit4.color);
        OST_COLOR4_ID:=IBSAVE_DOC('CFG',OST_COLOR4_ID);
        if OST_COLOR4_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 21...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','OTG_COLOR');
        IBSAVE_ADD('CFG_SET1',1);
        if RadioButton9.checked then IBSAVE_ADD('CFG_VALUE',-1)
                                else IBSAVE_ADD('CFG_VALUE',Edit5.color);
        OTG_COLOR1_ID:=IBSAVE_DOC('CFG',OTG_COLOR1_ID);
        if OTG_COLOR1_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 22...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','OTG_COLOR');
        IBSAVE_ADD('CFG_SET1',2);
        if RadioButton11.checked then IBSAVE_ADD('CFG_VALUE',-1)
                                else IBSAVE_ADD('CFG_VALUE',Edit6.color);
        OTG_COLOR2_ID:=IBSAVE_DOC('CFG',OTG_COLOR2_ID);
        if OTG_COLOR2_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 23...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','OTG_COLOR');
        IBSAVE_ADD('CFG_SET1',3);
        if RadioButton13.checked then IBSAVE_ADD('CFG_VALUE',-1)
                                else IBSAVE_ADD('CFG_VALUE',Edit7.color);
        OTG_COLOR3_ID:=IBSAVE_DOC('CFG',OTG_COLOR3_ID);
        if OTG_COLOR3_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 24...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','OTG_COLOR');
        IBSAVE_ADD('CFG_SET1',4);
        if RadioButton15.checked then IBSAVE_ADD('CFG_VALUE',-1)
                                else IBSAVE_ADD('CFG_VALUE',Edit8.color);
        OTG_COLOR4_ID:=IBSAVE_DOC('CFG',OTG_COLOR4_ID);
        if OTG_COLOR4_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 25...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','MARKET_PERIOD');
        IBSAVE_ADD('CFG_VALUE',inttostr(trunc(MARKET_PERIOD.value)));
        MARKET_PERIOD_ID:=IBSAVE_DOC('CFG',MARKET_PERIOD_ID);
        if MARKET_PERIOD_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 26...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','TIME_GET_DISCONT');
        IBSAVE_ADD('CFG_VALUE',inttostr(trunc(TIME_GET_DISCONT.value)));
        TIME_GET_DISCONT_ID:=IBSAVE_DOC('CFG',TIME_GET_DISCONT_ID);
        if TIME_GET_DISCONT_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 31...';
        delay(1);


        ///Сохранение параметров хранения документов
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','TIME_KEEP_UNPROV_RN');
        IBSAVE_ADD('CFG_VALUE',inttostr(trunc(KEEPunprovRN.value)));
        KEEP_UNPROV_RN_ID:=IBSAVE_DOC('CFG',KEEP_UNPROV_RN_ID);
        if KEEP_UNPROV_RN_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 32-1...';

        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','TIME_KEEP_PROV_VIP');
        IBSAVE_ADD('CFG_VALUE',inttostr(trunc(keepprovvip.value)));
        KEEP_PROV_VIP_ID:=IBSAVE_DOC('CFG',KEEP_PROV_VIP_ID);
        if KEEP_PROV_VIP_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 32-1...';

        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','TIME_KEEP_TEMP_RN');
        IBSAVE_ADD('CFG_VALUE',inttostr(trunc(KEEP_TEMP_RN.value)));
        KEEP_TEMP_RN_ID:=IBSAVE_DOC('CFG',KEEP_TEMP_RN_ID);
        if KEEP_TEMP_RN_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 32-1...';

        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','NAC_PERCENT');
        IBSAVE_ADD('CFG_VALUE',inttostr(trunc(NACPROCENT.value)));
        NAC_PERCENT_ID:=IBSAVE_DOC('CFG',NAC_PERCENT_ID);
        if NAC_PERCENT_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 32-1...';

        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','PNTYP_DOP');
        IBSAVE_ADD('CFG_VALUE',strtoint(PNTYP_DOP.Value));
        PNTYP_DOP.Tag:=IBSAVE_DOC('CFG',PNTYP_DOP.Tag);
        if PNTYP_DOP.Tag<0 then r:=SQRT(-1);

        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','RNTYP_DOP');
        IBSAVE_ADD('CFG_VALUE',strtoint(RNTYP_DOP.Value));
        RNTYP_DOP.Tag:=IBSAVE_DOC('CFG',RNTYP_DOP.Tag);
        if RNTYP_DOP.Tag<0 then r:=SQRT(-1);

        
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 32-1...';

        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','GARANT_NUM_CALC');
        IBSAVE_ADD('CFG_VALUE',GARANT_NUM_CALC.itemindex+1);
        GARANT_NUM_CALC_ID:=IBSAVE_DOC('CFG',GARANT_NUM_CALC_ID);
        if GARANT_NUM_CALC_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 32-1...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','ST_NUM_CALC');
        IBSAVE_ADD('CFG_VALUE',ST_NUM_CALC.itemindex+1);
        ST_NUM_CALC_ID:=IBSAVE_DOC('CFG',ST_NUM_CALC_ID);
        if ST_NUM_CALC_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 32-2...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','ZREMON_NUM_CALC');
        IBSAVE_ADD('CFG_VALUE',ZREMON_NUM_CALC.itemindex+1);
        ZREMON_NUM_CALC_ID:=IBSAVE_DOC('CFG',ZREMON_NUM_CALC_ID);
        if ZREMON_NUM_CALC_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 33...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','STFAKT_NUM_CALC');
        IBSAVE_ADD('CFG_VALUE',STFAKT_NUM_CALC.itemindex+1);
        STFAKT_NUM_CALC_ID:=IBSAVE_DOC('CFG',STFAKT_NUM_CALC_ID);
        if STFAKT_NUM_CALC_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 34...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','PER_NUM_CALC');
        IBSAVE_ADD('CFG_VALUE',PER_NUM_CALC.itemindex+1);
        PER_NUM_CALC_ID:=IBSAVE_DOC('CFG',PER_NUM_CALC_ID);
        if PER_NUM_CALC_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='Запись параметра 35...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','SPIS_NUM_CALC');
        IBSAVE_ADD('CFG_VALUE',SPIS_NUM_CALC.itemindex+1);
        SPIS_NUM_CALC_ID:=IBSAVE_DOC('CFG',SPIS_NUM_CALC_ID);
        if SPIS_NUM_CALC_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 35-1...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','TW_COLOR');
        if RadioButton17.checked then begin
          IBSAVE_ADD('CFG_VALUE',-1);
          TW_COLOR:=-1;
        end else begin
          IBSAVE_ADD('CFG_VALUE',Edit9.font.color);
          TW_COLOR:=Edit9.font.color;
        end;
        TW_COLOR_ID:=IBSAVE_DOC('CFG',TW_COLOR_ID);
        if TW_COLOR_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 35-2...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','TW_FON');
        if RadioButton19.checked then begin
          IBSAVE_ADD('CFG_VALUE',-1);
          TW_FON:=-1;
        end else begin
          IBSAVE_ADD('CFG_VALUE',Edit9.color);
          TW_FON:=Edit9.color;
        end;
        TW_FON_ID:=IBSAVE_DOC('CFG',TW_FON_ID);
        if TW_FON_ID<0 then r:=SQRT(-1);


        Set_Main.Statusbar1.panels[0].text:='Запись параметра 36...';
        delay(1);
        s:=inttostr(Trunc(NDS.value));
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','NDS');
        IBSAVE_ADD('CFG_VALUE',s);
        NDS_ID:=IBSAVE_DOC('CFG',NDS_ID);
        if NDS_ID<0 then r:=SQRT(-1);
        Set_Main.Statusbar1.panels[0].text:='';
        delay(1);
        if RadioButton9.checked then OTG_COLOR1:=-1
                                else OTG_COLOR1:=Edit5.color;
        if RadioButton11.checked then OTG_COLOR2:=-1
                                else OTG_COLOR2:=Edit6.color;
        if RadioButton13.checked then OTG_COLOR3:=-1
                                else OTG_COLOR3:=Edit7.color;
        if RadioButton15.checked then OTG_COLOR4:=-1
                                else OTG_COLOR4:=Edit8.color;
        if RadioButton1.checked then OST_COLOR1:=-1
                                else OST_COLOR1:=Edit1.color;
        if RadioButton3.checked then OST_COLOR2:=-1
                                else OST_COLOR2:=Edit1.color;
        if RadioButton5.checked then OST_COLOR3:=-1
                                else OST_COLOR3:=Edit1.color;
        if RadioButton7.checked then OST_COLOR4:=-1
                                else OST_COLOR4:=Edit1.color;
        {Сохраняем настройки магазинов}
        Set_Main.Statusbar1.panels[0].text:='Запись параметров магазинов...';
        delay(1);
        for a:=1 to CNT_SETSHOP do begin
          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_SET1',ARR_SETSHOP[a].SHOP_ID);
          IBSAVE_ADD('CFG_NAME','SHOP_KKM_MODEL');
          IBSAVE_ADD('CFG_VALUE',ARR_SETSHOP[a].KKM_SHOP);
          ARR_SETSHOP[a].CFG_KKM_SHOP:=IBSAVE_DOC('CFG',ARR_SETSHOP[a].CFG_KKM_SHOP);
          if ARR_SETSHOP[a].CFG_KKM_SHOP<0 then r:=SQRT(-1);

          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_SET1',ARR_SETSHOP[a].SHOP_ID);
          IBSAVE_ADD('CFG_NAME','SHOP_RNTYP_KKM');
          IBSAVE_ADD('CFG_VALUE',ARR_SETSHOP[a].RNTYP_KKM);
          ARR_SETSHOP[a].CFG_RNTYP_KKM:=IBSAVE_DOC('CFG',ARR_SETSHOP[a].CFG_RNTYP_KKM);
          if ARR_SETSHOP[a].CFG_RNTYP_KKM<0 then r:=SQRT(-1);

          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_SET1',ARR_SETSHOP[a].SHOP_ID);
          IBSAVE_ADD('CFG_NAME','DEFAULT_FIRMA');
          IBSAVE_ADD('CFG_VALUE',ARR_SETSHOP[a].FRM);
          ARR_SETSHOP[a].CFG_FRM:=IBSAVE_DOC('CFG',ARR_SETSHOP[a].CFG_FRM);
          if ARR_SETSHOP[a].CFG_FRM<0 then r:=SQRT(-1);

          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_SET1',ARR_SETSHOP[a].SHOP_ID);
          IBSAVE_ADD('CFG_NAME','DEFAULT_SKLAD');
          IBSAVE_ADD('CFG_VALUE',ARR_SETSHOP[a].SKL);
          ARR_SETSHOP[a].CFG_SKL:=IBSAVE_DOC('CFG',ARR_SETSHOP[a].CFG_SKL);
          if ARR_SETSHOP[a].CFG_SKL<0 then r:=SQRT(-1);

          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_SET1',ARR_SETSHOP[a].SHOP_ID);
          IBSAVE_ADD('CFG_NAME','DEFAULT_SHOP');
          IBSAVE_ADD('CFG_VALUE',ARR_SETSHOP[a].SHOP);
          ARR_SETSHOP[a].CFG_SHOP:=IBSAVE_DOC('CFG',ARR_SETSHOP[a].CFG_SHOP);
          if ARR_SETSHOP[a].CFG_SHOP<0 then r:=SQRT(-1);

          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_SET1',ARR_SETSHOP[a].SHOP_ID);
          IBSAVE_ADD('CFG_NAME','DEFAULT_KLIENT');
          IBSAVE_ADD('CFG_VALUE',ARR_SETSHOP[a].KLN);
          ARR_SETSHOP[a].CFG_KLN:=IBSAVE_DOC('CFG',ARR_SETSHOP[a].CFG_KLN);
          if ARR_SETSHOP[a].CFG_KLN<0 then r:=SQRT(-1);

          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_SET1',ARR_SETSHOP[a].SHOP_ID);
          IBSAVE_ADD('CFG_NAME','KKM_ONLINE');
          IBSAVE_ADD('CFG_VALUE',ARR_SETSHOP[a].KKM_ONLINE);
          ARR_SETSHOP[a].CFG_KKM_ONLINE:=IBSAVE_DOC('CFG',ARR_SETSHOP[a].CFG_KKM_ONLINE);
          if ARR_SETSHOP[a].CFG_KKM_ONLINE<0 then r:=SQRT(-1);


          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_SET1',ARR_SETSHOP[a].SHOP_ID);
          IBSAVE_ADD('CFG_NAME','COM_PORT_KKM1');
          IBSAVE_ADD('CFG_VALUE',ARR_SETSHOP[a].KKM1);
          ARR_SETSHOP[a].CFG_KKM1:=IBSAVE_DOC('CFG',ARR_SETSHOP[a].CFG_KKM1);
          if ARR_SETSHOP[a].CFG_KKM1<0 then r:=SQRT(-1);

          // Запись путей
          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_SET1',ARR_SETSHOP[a].SHOP_ID);
          IBSAVE_ADD('CFG_NAME','LOCAL_PATH');
          IBSAVE_ADD('CFG_VALUE',ARR_SETSHOP[a].LOCAL_PATH);
          ARR_SETSHOP[a].CFG_LOCAL_PATH:=IBSAVE_DOC('CFG',ARR_SETSHOP[a].CFG_LOCAL_PATH);
          if ARR_SETSHOP[a].CFG_LOCAL_PATH<0 then r:=SQRT(-1);

          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_SET1',ARR_SETSHOP[a].SHOP_ID);
          IBSAVE_ADD('CFG_NAME','GLOBAL_PATH');
          IBSAVE_ADD('CFG_VALUE',ARR_SETSHOP[a].GLOBAL_PATH);
          ARR_SETSHOP[a].CFG_GLOBAL_PATH:=IBSAVE_DOC('CFG',ARR_SETSHOP[a].CFG_GLOBAL_PATH);
          if ARR_SETSHOP[a].CFG_GLOBAL_PATH<0 then r:=SQRT(-1);

          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_SET1',ARR_SETSHOP[a].SHOP_ID);
          IBSAVE_ADD('CFG_NAME','TMP_PATH');
          IBSAVE_ADD('CFG_VALUE',ARR_SETSHOP[a].TMP_PATH);
          ARR_SETSHOP[a].CFG_TMP_PATH:=IBSAVE_DOC('CFG',ARR_SETSHOP[a].CFG_TMP_PATH);
          if ARR_SETSHOP[a].CFG_TMP_PATH<0 then r:=SQRT(-1);
        end;


        Set_Main.Statusbar1.panels[0].text:='Запись параметра 48...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_TWED');
        IBSAVE_ADD('CFG_VALUE',strtoint(TWED.value));
        TWED_ID:=IBSAVE_DOC('CFG',TWED_ID);
        if TWED_ID<0 then r:=SQRT(-1) else DEFAULT_TW_ED:=strtoint(TWED.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 49...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_TWTWKTG');
        IBSAVE_ADD('CFG_VALUE',strtoint(TWKTG.value));
        TWKTG_ID:=IBSAVE_DOC('CFG',TWKTG_ID);
        if TWKTG_ID<0 then r:=SQRT(-1)  else DEFAULT_TW_TWKTG:=strtoint(TWKTG.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 50...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_TWVALUTA');
        IBSAVE_ADD('CFG_VALUE',strtoint(TWVALUTA.value));
        TWVALUTA_ID:=IBSAVE_DOC('CFG',TWVALUTA_ID);
        if TWVALUTA_ID<0 then r:=SQRT(-1) else DEFAULT_TW_VALUTA:=strtoint(TWVALUTA.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 51...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_SERVER_NAME');
        IBSAVE_ADD('CFG_VALUE',SERVER_NAME.text);
        DEFAULT_SERVER_NAME_ID:=IBSAVE_DOC('CFG',DEFAULT_SERVER_NAME_ID);
        if DEFAULT_SERVER_NAME_ID<0 then r:=SQRT(-1) else DEFAULT_SERVER_NAME:=SERVER_NAME.text;

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 52...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_OWNER_PN');
        IBSAVE_ADD('CFG_VALUE',strtoint(OWNER_PN.value));
        OWNER_PN_ID:=IBSAVE_DOC('CFG',OWNER_PN_ID);
        if OWNER_PN_ID<0 then r:=SQRT(-1) else DEFAULT_OWNER_PN:=strtoint(OWNER_PN.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 53...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_OWNER_REMON');
        IBSAVE_ADD('CFG_VALUE',strtoint(OWNER_REMON.value));
        OWNER_REMON_ID:=IBSAVE_DOC('CFG',OWNER_REMON_ID);
        if OWNER_REMON_ID<0 then r:=SQRT(-1) else DEFAULT_OWNER_REMON:=strtoint(OWNER_REMON.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 54...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_ST_SKID');
        IBSAVE_ADD('CFG_VALUE',strtoint(ST_SKID.value));
        ST_SKID_ID:=IBSAVE_DOC('CFG',ST_SKID_ID);
        if ST_SKID_ID<0 then r:=SQRT(-1) else DEFAULT_ST_SKID:=strtoint(ST_SKID.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 55...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_RNVID');
        IBSAVE_ADD('CFG_VALUE',strtoint(RNVID.value));
        RNVID_ID:=IBSAVE_DOC('CFG',RNVID_ID);
        if RNVID_ID<0 then r:=SQRT(-1) else DEFAULT_RNVID:=strtoint(RNVID.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 56...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_PNVID');
        IBSAVE_ADD('CFG_VALUE',strtoint(PNVID.value));
        PNVID_ID:=IBSAVE_DOC('CFG',PNVID_ID);
        if PNVID_ID<0 then r:=SQRT(-1) else DEFAULT_PNVID:=strtoint(PNVID.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 57...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_ZAY_PNVID');
        IBSAVE_ADD('CFG_VALUE',strtoint(ZAY_PNVID.value));
        ZAY_PNVID_ID:=IBSAVE_DOC('CFG',ZAY_PNVID_ID);
        if ZAY_PNVID_ID<0 then r:=SQRT(-1) else DEFAULT_ZAY_PNVID:=strtoint(ZAY_PNVID.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 58...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_USGROUP');
        IBSAVE_ADD('CFG_VALUE',strtoint(USGROUP.value));
        USGROUP_ID:=IBSAVE_DOC('CFG',USGROUP_ID);
        if USGROUP_ID<0 then r:=SQRT(-1) else DEFAULT_USGROUP:=strtoint(USGROUP.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 60...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','EMAIL_HOST');
        IBSAVE_ADD('CFG_VALUE',EMAIL_HOST.text);
        HOST_ID:=IBSAVE_DOC('CFG',HOST_ID);
        if HOST_ID<0 then r:=SQRT(-1);


////////////////////////////////////////////





        Set_Main.Statusbar1.panels[0].text:='Запись параметра 62...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','NO_EMAIL');
        IBSAVE_ADD('CFG_VALUE',NO_EMAIL.text);
        IBSAVE_ADD('CFG_SET1',strtoint(FRM.Value));
        NO_EMAIL_ID:=IBSAVE_DOC('CFG',NO_EMAIL_ID);
        if NO_EMAIL_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 63...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','OK_EMAIL');
        IBSAVE_ADD('CFG_VALUE',OK_EMAIL.text);
        IBSAVE_ADD('CFG_SET1',strtoint(FRM.Value));
        OK_EMAIL_ID:=IBSAVE_DOC('CFG',OK_EMAIL_ID);
        if OK_EMAIL_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 63-2...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','REPEAT_EMAIL');
        IBSAVE_ADD('CFG_VALUE',REPEAT_EMAIL.text);
        IBSAVE_ADD('CFG_SET1',strtoint(FRM.Value));
        REPEAT_EMAIL_ID:=IBSAVE_DOC('CFG',REPEAT_EMAIL_ID);
        if REPEAT_EMAIL_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 64...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','NOOK_EMAIL');
        IBSAVE_ADD('CFG_VALUE',NOOK_EMAIL.text);
        IBSAVE_ADD('CFG_SET1',strtoint(FRM.Value));
        NOOK_EMAIL_ID:=IBSAVE_DOC('CFG',NOOK_EMAIL_ID);
        if NOOK_EMAIL_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 65...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','UTW_EMAIL');
        IBSAVE_ADD('CFG_VALUE',UTW_EMAIL.text);
        IBSAVE_ADD('CFG_SET1',strtoint(FRM.Value));
        UTW_EMAIL_ID:=IBSAVE_DOC('CFG',UTW_EMAIL_ID);
        if UTW_EMAIL_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 66...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','HOME_EMAIL');
        IBSAVE_ADD('CFG_VALUE',HOME_EMAIL.text);
        IBSAVE_ADD('CFG_SET1',strtoint(FRM.Value));
        HOME_EMAIL_ID:=IBSAVE_DOC('CFG',HOME_EMAIL_ID);
        if HOME_EMAIL_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 67...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','TITLE_EMAIL');
        IBSAVE_ADD('CFG_VALUE',TITLE_EMAIL.text);
        IBSAVE_ADD('CFG_SET1',strtoint(FRM.Value));
        TITLE_EMAIL_ID:=IBSAVE_DOC('CFG',TITLE_EMAIL_ID);
        if TITLE_EMAIL_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 68...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','RUB_EMAIL');
        IBSAVE_ADD('CFG_VALUE',inttostr(trunc(EMAIL_RUB.value)));
        IBSAVE_ADD('CFG_SET1',strtoint(FRM.Value));
        RUB_EMAIL_ID:=IBSAVE_DOC('CFG',RUB_EMAIL_ID);
        if RUB_EMAIL_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 69...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DOLLAR_EMAIL');
        IBSAVE_ADD('CFG_VALUE',inttostr(trunc(EMAIL_DOLLAR.value)));
        IBSAVE_ADD('CFG_SET1',strtoint(FRM.Value));
        DOLLAR_EMAIL_ID:=IBSAVE_DOC('CFG',DOLLAR_EMAIL_ID);
        if DOLLAR_EMAIL_ID<0 then r:=SQRT(-1);


//////////////////////////////////////////////



        Set_Main.Statusbar1.panels[0].text:='Запись параметра 71...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','LAST_EMAIL_EXPORT');
        IBSAVE_ADD('DATE_VALUE',Date_exp2.date);
        DATE_EXP2_ID:=IBSAVE_DOC('CFG',DATE_EXP2_ID);
        if DATE_EXP2_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 72...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','ZAY_PRIBYL_MES');
        IBSAVE_ADD('CFG_VALUE',inttostr(round(ZAY_MES.value)));
        ZAY_MES_ID:=IBSAVE_DOC('CFG',ZAY_MES_ID);
        if ZAY_MES_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 73...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','ZAY_PERCENT_WARNING');
        IBSAVE_ADD('CFG_VALUE',inttostr(round(ZAY_PERCENT_WARNING.value)));
        ZAY_PERCENT_WARNING_ID:=IBSAVE_DOC('CFG',ZAY_PERCENT_WARNING_ID);
        if ZAY_PERCENT_WARNING_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 75...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','KKM_PRINT_NAME');
        IBSAVE_ADD('CFG_VALUE',KKM_PRINT_NAME.itemindex);
        KKM_PRINT_NAME_ID:=IBSAVE_DOC('CFG',KKM_PRINT_NAME_ID);
        if KKM_PRINT_NAME_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 76...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','ISKKM');
        IBSAVE_ADD('CFG_VALUE',ISKKM.text);
        ISKKM_ID:=IBSAVE_DOC('CFG',ISKKM_ID);
        if ISKKM_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 77...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','IS_EMAIL');
        IBSAVE_ADD('CFG_VALUE',IS_EMAIL.checked);
        IS_EMAIL_ID:=IBSAVE_DOC('CFG',IS_EMAIL_ID);
        if IS_EMAIL_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 78...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','JOU_REFRESH_TIME');
        IBSAVE_ADD('CFG_VALUE',inttostr(trunc(JOU_REFRESH.value)));
        JOU_REFRESH_ID:=IBSAVE_DOC('CFG',JOU_REFRESH_ID);
        if JOU_REFRESH_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 79...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_PNVID_WOZW');
        IBSAVE_ADD('CFG_VALUE',strtoint(PNVID_WOZW.value));
        PNVID_WOZW_ID:=IBSAVE_DOC('CFG',PNVID_WOZW_ID);
        if PNVID_WOZW_ID<0 then r:=SQRT(-1) else DEFAULT_PNVID_WOZW:=strtoint(PNVID_WOZW.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 80...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','DEFAULT_RNVID_WOZW');
        IBSAVE_ADD('CFG_VALUE',strtoint(RNVID_WOZW.value));
        RNVID_WOZW_ID:=IBSAVE_DOC('CFG',RNVID_WOZW_ID);
        if RNVID_WOZW_ID<0 then r:=SQRT(-1) else DEFAULT_RNVID_WOZW:=strtoint(RNVID_WOZW.value);

        Set_Main.Statusbar1.panels[0].text:='Запись параметра 81...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','PSORT_NUM_CALC');
        IBSAVE_ADD('CFG_VALUE',PSORT_NUM_CALC.itemindex+1);
        PSORT_NUM_CALC_ID:=IBSAVE_DOC('CFG',PSORT_NUM_CALC_ID);
        if PSORT_NUM_CALC_ID<0 then r:=SQRT(-1);

        Set_Main.Statusbar1.panels[0].text:='Запись нумератора пересортиц...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','PO_NUM_CALC');
        IBSAVE_ADD('CFG_VALUE',PO_NUM_CALC.itemindex+1);
        PO_NUM_CALC_ID:=IBSAVE_DOC('CFG',PO_NUM_CALC_ID);
        if PO_NUM_CALC_ID<0 then r:=SQRT(-1);


        Set_Main.Statusbar1.panels[0].text:='Запись режима кредитования...';
        delay(1);
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','CREDIT_MODE');
        IBSAVE_ADD('CFG_SET1',cbCreditMode.itemindex);
        CREDIT_MODE_ID:=IBSAVE_DOC('CFG',CREDIT_MODE_ID);
        if CREDIT_MODE_ID<0 then r:=SQRT(-1);


        Datamodule1.IBTransaction2.Commit;
        SAVE:=true;
     except
        Datamodule1.IBTransaction2.Rollback;
        Messbox('Ошибка при записи конфигурации!',MessError,16);
     end;
     Datamodule1.IBTransaction2.Active:=False;

     ibtransaction1.Active:=true;
     ibquery1.Open;
     Set_Main.Statusbar1.panels[0].text:='';
     delay(1);
     BtnApply.enabled:=True;
     MnApply.enabled:=True;
end;

procedure TSet_Main.BtnSaveClick(Sender: TObject);
begin
     BtnSave.enabled:=False;
     MnSave.enabled:=False;
     SAVE:=false;
     if BtnApply.enabled then BtnApply.click;
     if SAVE then close;
     BtnSave.enabled:=True;
     MnSave.enabled:=True;
end;

procedure TSet_Main.RN_TEXTChange(Sender: TObject);
begin
     SAVE:=false;
end;

procedure TSet_Main.RadioButton1Click(Sender: TObject);
begin
     SAVE:=false;
     Button1.enabled:=RadioButton2.Checked;
     if RadioButton1.checked then Edit1.color:=clWindow;
end;

procedure TSet_Main.RadioButton4Click(Sender: TObject);
begin
     SAVE:=false;
     Button2.enabled:=RadioButton4.Checked;
     if RadioButton3.checked then Edit2.color:=clWindow;
end;

procedure TSet_Main.RadioButton5Click(Sender: TObject);
begin
     SAVE:=false;
     Button3.enabled:=RadioButton6.Checked;
     if RadioButton5.checked then Edit3.color:=clWindow;
end;

procedure TSet_Main.RadioButton7Click(Sender: TObject);
begin
     SAVE:=false;
     Button4.enabled:=RadioButton8.Checked;
     if RadioButton7.checked then Edit4.color:=clWindow;
end;

procedure TSet_Main.Button1Click(Sender: TObject);
begin
     ColorDialog1.Color:=Edit1.color;
     if ColorDialog1.Execute then Edit1.color:=ColorDialog1.Color;
end;

procedure TSet_Main.Button2Click(Sender: TObject);
begin
     ColorDialog1.Color:=Edit2.color;
     if ColorDialog1.Execute then Edit2.color:=ColorDialog1.Color;
end;

procedure TSet_Main.Button3Click(Sender: TObject);
begin
     ColorDialog1.Color:=Edit3.color;
     if ColorDialog1.Execute then Edit3.color:=ColorDialog1.Color;
end;

procedure TSet_Main.Button4Click(Sender: TObject);
begin
     ColorDialog1.Color:=Edit4.color;
     if ColorDialog1.Execute then Edit4.color:=ColorDialog1.Color;

end;

procedure TSet_Main.RadioButton9Click(Sender: TObject);
begin
     SAVE:=false;
     Button5.enabled:=RadioButton10.Checked;
     if RadioButton9.checked then Edit5.color:=clWindow;
end;

procedure TSet_Main.RadioButton11Click(Sender: TObject);
begin
     SAVE:=false;
     Button6.enabled:=RadioButton12.Checked;
     if RadioButton11.checked then Edit6.color:=clWindow;
end;

procedure TSet_Main.RadioButton13Click(Sender: TObject);
begin
     SAVE:=false;
     Button7.enabled:=RadioButton14.Checked;
     if RadioButton13.checked then Edit7.color:=clWindow;
end;

procedure TSet_Main.Button5Click(Sender: TObject);
begin
     ColorDialog1.Color:=Edit5.color;
     if ColorDialog1.Execute then Edit5.color:=ColorDialog1.Color;
end;

procedure TSet_Main.Button6Click(Sender: TObject);
begin
     ColorDialog1.Color:=Edit6.color;
     if ColorDialog1.Execute then Edit6.color:=ColorDialog1.Color;

end;

procedure TSet_Main.Button7Click(Sender: TObject);
begin
     ColorDialog1.Color:=Edit7.color;
     if ColorDialog1.Execute then Edit7.color:=ColorDialog1.Color;
end;

procedure TSet_Main.Button8Click(Sender: TObject);
begin
     ColorDialog1.Color:=Edit8.color;
     if ColorDialog1.Execute then Edit8.color:=ColorDialog1.Color;
end;

procedure TSet_Main.RadioButton16Click(Sender: TObject);
begin
     SAVE:=false;
     Button8.enabled:=RadioButton16.Checked;
     if RadioButton15.checked then Edit8.color:=clWindow;
end;

procedure TSet_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrUsgroup.close;
     QrShop.close;
     QrRntyp.close;
     QrRnvid.close;
     QrPnVid.close;
     QrSKL.close;
     SetTransaction2.Active:=False;
end;

procedure TSet_Main.SHOPChange(Sender: TObject);
var
   a,b,c,d,e:integer;
begin
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=1;
     if c=0 then begin
        {Читаем предустановленные данные}
        inc(CNT_SETSHOP);
        ARR_SETSHOP[CNT_SETSHOP].SHOP_ID:=b;
        SetQuery.Close;
        SetQuery.SQL.clear;
        SetQuery.SQL.add('select CFG_ID,CFG_NAME,CFG_VALUE FROM CFG WHERE CFG_SET1=:CFG_SET1');
        SetQuery.ParamByname('CFG_SET1').asinteger:=b;
        SetQuery.Open;
        // Локальный путь для пакетов
        if SetQuery.locate('CFG_NAME','LOCAL_PATH',[]) then begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_LOCAL_PATH:=SetQuery.fieldByname('CFG_ID').asinteger;
           ARR_SETSHOP[CNT_SETSHOP].LOCAL_PATH:=SetQuery.fieldByname('CFG_VALUE').asstring;
        end else begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_LOCAL_PATH:=-1;
           ARR_SETSHOP[CNT_SETSHOP].LOCAL_PATH:='C:\';
        end;
        // Глобальный путь для пакетов
        if SetQuery.locate('CFG_NAME','GLOBAL_PATH',[]) then begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_GLOBAL_PATH:=SetQuery.fieldByname('CFG_ID').asinteger;
           ARR_SETSHOP[CNT_SETSHOP].GLOBAL_PATH:=SetQuery.fieldByname('CFG_VALUE').asstring;
        end else begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_GLOBAL_PATH:=-1;
           ARR_SETSHOP[CNT_SETSHOP].GLOBAL_PATH:='C:\';
        end;

        if SetQuery.locate('CFG_NAME','TMP_PATH',[]) then begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_TMP_PATH:=SetQuery.fieldByname('CFG_ID').asinteger;
           ARR_SETSHOP[CNT_SETSHOP].TMP_PATH:=SetQuery.fieldByname('CFG_VALUE').asstring;
        end else begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_TMP_PATH:=-1;
           ARR_SETSHOP[CNT_SETSHOP].TMP_PATH:='C:\TEMP\';
        end;

        if SetQuery.locate('CFG_NAME','DEFAULT_FIRMA',[]) then begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_FRM:=SetQuery.fieldByname('CFG_ID').asinteger;
           ARR_SETSHOP[CNT_SETSHOP].FRM:=SetQuery.fieldByname('CFG_VALUE').asinteger;
        end else begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_FRM:=-1;
           ARR_SETSHOP[CNT_SETSHOP].FRM:=DEFAULT_FIRMA;
        end;
        if SetQuery.locate('CFG_NAME','DEFAULT_SHOP',[]) then begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_SHOP:=SetQuery.fieldByname('CFG_ID').asinteger;
           ARR_SETSHOP[CNT_SETSHOP].SHOP:=SetQuery.fieldByname('CFG_VALUE').asinteger;
        end else begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_SHOP:=-1;
           ARR_SETSHOP[CNT_SETSHOP].SHOP:=DEFAULT_SHOP;
        end;
        if SetQuery.locate('CFG_NAME','DEFAULT_SKLAD',[]) then begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_SKL:=SetQuery.fieldByname('CFG_ID').asinteger;
           ARR_SETSHOP[CNT_SETSHOP].SKL:=SetQuery.fieldByname('CFG_VALUE').asinteger;
        end else begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_SKL:=-1;
           ARR_SETSHOP[CNT_SETSHOP].SKL:=DEFAULT_SKLAD;
        end;
        if SetQuery.locate('CFG_NAME','DEFAULT_KLIENT',[]) then begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_KLN:=SetQuery.fieldByname('CFG_ID').asinteger;
           ARR_SETSHOP[CNT_SETSHOP].KLN:=SetQuery.fieldByname('CFG_VALUE').asinteger;
        end else begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_KLN:=-1;
           ARR_SETSHOP[CNT_SETSHOP].KLN:=DEFAULT_KLIENT;
        end;
        if SetQuery.locate('CFG_NAME','COM_PORT_KKM1',[]) then begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_KKM1:=SetQuery.fieldByname('CFG_ID').asinteger;
           ARR_SETSHOP[CNT_SETSHOP].KKM1:=SetQuery.fieldByname('CFG_VALUE').asinteger;
        end else begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_KKM1:=-1;
           ARR_SETSHOP[CNT_SETSHOP].KKM1:=1;
        end;
        if SetQuery.locate('CFG_NAME','KKM_ONLINE',[]) then begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_KKM_ONLINE:=SetQuery.fieldByname('CFG_ID').asinteger;
           ARR_SETSHOP[CNT_SETSHOP].KKM_ONLINE:=SetQuery.fieldByname('CFG_VALUE').asstring;
        end else begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_KKM_ONLINE:=-1;
           ARR_SETSHOP[CNT_SETSHOP].KKM_ONLINE:='';
        end;
        if SetQuery.locate('CFG_NAME','SHOP_RNTYP_KKM',[]) then begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_RNTYP_KKM:=SetQuery.fieldByname('CFG_ID').asinteger;
           ARR_SETSHOP[CNT_SETSHOP].RNTYP_KKM:=SetQuery.fieldByname('CFG_VALUE').asinteger;
        end else begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_RNTYP_KKM:=-1;
           ARR_SETSHOP[CNT_SETSHOP].RNTYP_KKM:=QrRntyp.fieldByname('RNTYP_ID').asinteger;
        end;
        if SetQuery.locate('CFG_NAME','SHOP_KKM_MODEL',[]) then begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_KKM_SHOP:=SetQuery.fieldByname('CFG_ID').asinteger;
           ARR_SETSHOP[CNT_SETSHOP].KKM_SHOP:=SetQuery.fieldByname('CFG_VALUE').asinteger;
        end else begin
           ARR_SETSHOP[CNT_SETSHOP].CFG_KKM_SHOP:=-1;
           ARR_SETSHOP[CNT_SETSHOP].KKM_SHOP:=0;
        end;
        SetQuery.Close;
     end;
     {Отображаем состояние}
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     SKL1.Value:=inttostr(ARR_SETSHOP[c].SKL);
     SHOP1.Value:=inttostr(ARR_SETSHOP[c].SHOP);
     Change_FrmKln(ARR_SETSHOP[c].KLN,1);
     Change_FrmKln(ARR_SETSHOP[c].FRM,2);
     KKM1.value:=ARR_SETSHOP[c].KKM1;
     RNTYP_KKM.value:=inttostr(ARR_SETSHOP[c].RNTYP_KKM);
     LOCAL_PATH.text:=ARR_SETSHOP[c].LOCAL_PATH;
     GLOBAL_PATH.text:=ARR_SETSHOP[c].GLOBAL_PATH;
     TMP_PATH.text:=ARR_SETSHOP[c].TMP_PATH;
     KKM_ONLINE.text:=ARR_SETSHOP[c].KKM_ONLINE;
     KKM_SHOP.itemindex:=ARR_SETSHOP[c].KKM_SHOP;
end;

procedure TSet_Main.BTN_KLN1Click(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=ARR_SETSHOP[c].KLN;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>ARR_SETSHOP[c].KLN then begin
        ARR_SETSHOP[c].KLN:=DIC_KLIENT.tag;
        Change_FrmKln(ARR_SETSHOP[c].KLN,1);
     end;
     DIC_KLIENT.Destroy;
end;

procedure TSet_Main.Change_FrmKln(ID,N:integer);
var
   s1:ansistring;
begin
     {Отображаем название фирмы и банка}
     SetQuery.Close;
     SetQuery.SQL.clear;
     SetQuery.SQL.add('select kln_full from kln_data( :KLN_ID )');
     SetQuery.Parambyname('KLN_ID').asinteger:=ID;
     SetQuery.Open;
     s1:='';
     if SetQuery.eof then begin
     end else begin
          s1:=SetQuery.fieldbyname('KLN_FULL').asstring;
     end;
     if N=1 then begin
        KLN1.text:=s1;
     end else begin
        FRM1.text:=s1;
     end;
     SetQuery.Close;
end;

procedure TSet_Main.BTN_FRM1Click(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=ARR_SETSHOP[c].FRM;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>ARR_SETSHOP[c].FRM then begin
        ARR_SETSHOP[c].FRM:=DIC_KLIENT.tag;
        Change_FrmKln(ARR_SETSHOP[c].FRM,2);
     end;
     DIC_KLIENT.Destroy;
end;

procedure TSet_Main.SKL1Change(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     try
       ARR_SETSHOP[c].SKL:=strtoint(SKL1.VALUE);
     except
     end;
end;

procedure TSet_Main.SHOP1Change(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     try
       ARR_SETSHOP[c].SHOP:=strtoint(SHOP1.VALUE);
     except
     end;
end;

procedure TSet_Main.KKM1Change(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     ARR_SETSHOP[c].KKM1:=trunc(KKM1.value);
end;

procedure TSet_Main.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TSet_Main.RadioButton19Click(Sender: TObject);
begin
     SAVE:=false;
     Button10.enabled:=RadioButton20.Checked;
     if RadioButton19.checked then Edit9.color:=clWindow;
end;

procedure TSet_Main.Button10Click(Sender: TObject);
begin
     SAVE:=false;
     ColorDialog1.Color:=Edit9.color;
     if ColorDialog1.Execute then Edit9.color:=ColorDialog1.Color;
end;

procedure TSet_Main.RadioButton18Click(Sender: TObject);
begin
     SAVE:=false;
     Button9.enabled:=RadioButton18.Checked;
     if RadioButton17.checked then Edit9.Font.color:=clWindowText;
end;

procedure TSet_Main.Button9Click(Sender: TObject);
begin
     SAVE:=false;
     ColorDialog1.Color:=Edit9.Font.color;
     if ColorDialog1.Execute then Edit9.Font.color:=ColorDialog1.Color;
end;

procedure TSet_Main.SERVER_NAMEChange(Sender: TObject);
begin
     SAVE:=false;
end;

procedure TSet_Main.Speed1_1Click(Sender: TObject);
begin
     SAVE:=false;
end;

procedure TSet_Main.OWNER_REMONChange(Sender: TObject);
begin
     SAVE:=false;
end;

procedure TSet_Main.TWVALUTAChange(Sender: TObject);
begin
     SAVE:=false;
end;

procedure TSet_Main.ST_SKIDChange(Sender: TObject);
begin
     SAVE:=false;
end;

procedure TSet_Main.LOCAL_PATHChange(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     ARR_SETSHOP[c].LOCAL_PATH:=LOCAL_PATH.text;
end;

procedure TSet_Main.GLOBAL_PATHChange(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     ARR_SETSHOP[c].GLOBAL_PATH:=GLOBAL_PATH.text;
end;

procedure TSet_Main.TMP_PATHChange(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     ARR_SETSHOP[c].TMP_PATH:=TMP_PATH.text;
end;

procedure TSet_Main.NO_EMAILChange(Sender: TObject);
begin
     SAVE:=False;
end;

procedure TSet_Main.FormActivate(Sender: TObject);
begin
    // Устанавливаем по умолчанию страницу с данными экспорта и электронной почты
    PageControl1.ActivePage:=TabSheet10;
end;

procedure TSet_Main.KKM_ONLINEChange(Sender: TObject);
var
   a,b,c:integer;
   s1,s2:string;
begin
     s1:=KKM_ONLINE.text;
     s2:='';
     for a:=1 to length(s1) do if s1[a] in ['0'..'9'] then s2:=s2+s1[a];
     if s2<>s1 then KKM_ONLINE.text:=s2;
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     ARR_SETSHOP[c].KKM_ONLINE:=KKM_ONLINE.text;
end;

procedure TSet_Main.RNTYP_KKMChange(Sender: TObject);
var
   a,b,c:integer;
begin
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     try
       ARR_SETSHOP[c].RNTYP_KKM:=strtoint(RNTYP_KKM.value);
     except
     end;
end;

procedure TSet_Main.KKM_SHOPChange(Sender: TObject);
var
   a,b,c:integer;
begin
     if KKM_SHOP.ItemIndex<0 then KKM_SHOP.ItemIndex:=0;
     b:=strtoint(SHOP.value);
     c:=0;
     for a:=1 to CNT_SETSHOP do if ARR_SETSHOP[a].SHOP_ID=b then c:=a;
     try
       ARR_SETSHOP[c].KKM_SHOP:=KKM_SHOP.ItemIndex;
     except
     end;
end;

procedure TSet_Main.PO_NUM_CALCChange(Sender: TObject);
begin
    if PO_NUM_CALC.itemindex<0 then PO_NUM_CALC.itemindex:=0;
end;

procedure TSet_Main.DOP_FIRM_SELECTClick(Sender: TObject);
begin
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=-1;;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>-1 then begin
        try
        	Datamodule1.ibsavesql.Transaction.Active:=false;
        	ADD_SQL(Datamodule1.ibsavesql, 'UPDATE KLN SET KLN_FRM=2 WHERE KLN_ID=:KLN_ID');	//0 - не фирма, 1 - основная фирма, 2 - дополнительная фирма
        	Datamodule1.ibsavesql.ParamByName('KLN_ID').asinteger := DIC_KLIENT.Tag;
        	datamodule1.IbSaveSQL.ExecSQL;
        	Datamodule1.ibsavesql.Transaction.Commit;

			QrDopFirm.Transaction.Active:=false;
            QrDopFirm.Active:=false;
            QrDopFirm.Active:=true;

        except
        	Datamodule1.ibsavesql.Transaction.Rollback;
        end;




     end;
     DIC_KLIENT.Destroy;
end;

procedure TSet_Main.DOP_FIRM_DELETEClick(Sender: TObject);
begin
    if Messbox('Вы уверены, что хотите удалить из этого списка фирму'+
    chr(13)+ QrDopFirm.fieldbyname('F_1').asstring +'?', MessSubmitDelete, 4+48+256)=6 then
    begin
    	try
        	Datamodule1.ibsavesql.Transaction.Active:=false;
        	ADD_SQL(Datamodule1.ibsavesql, 'UPDATE KLN SET KLN_FRM=0 WHERE KLN_ID=:KLN_ID');	//0 - не фирма, 1 - основная фирма, 2 - дополнительная фирма
        	Datamodule1.ibsavesql.ParamByName('KLN_ID').asinteger := QrDopFirm.fieldbyname('KLN_ID').asinteger;
        	datamodule1.IbSaveSQL.ExecSQL;
        	Datamodule1.ibsavesql.Transaction.Commit;

			QrDopFirm.Transaction.Active:=false;
            QrDopFirm.Active:=false;
            QrDopFirm.Active:=true;
        except
        	Datamodule1.ibsavesql.Transaction.Rollback;
        end;
    end;
	
end;

procedure TSet_Main.FRMChange(Sender: TObject);
begin
  LoadEmailSettings;
end;

end.
