unit DocRn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, CurrEdit, Mask, ToolEdit, RxLookup, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,Data1,B_DBUtils,B_Utils, Db,
  IBCustomDataSet, IBQuery, RxMemDS, IBDatabase,DetalTW, Menus,SetSkid,PrintKKM,
  ActnList,DocPo,JouPo, RXSpin, DBCtrls, FR_DSet, FR_DBSet, FR_Class;

type
  TDoc_RN = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    KLN_NAME: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    FRM_BNK: TEdit;
    KLN_BNK: TEdit;
    Label8: TLabel;
    RN_OSN: TMemo;
    Label10: TLabel;
    RN_NUM: TEdit;
    Label11: TLabel;
    RN_DATE: TDateEdit;
    Btn_DicTow: TToolButton;
    Btn_DelTow: TToolButton;
    ToolButton4: TToolButton;
    Btn_Propertis: TToolButton;
    Btn_Print: TToolButton;
    ToolButton8: TToolButton;
    Btn_Prow: TToolButton;
    Btn_Unprow: TToolButton;
    ToolButton11: TToolButton;
    Btn_SAVE: TToolButton;
    Btn_Apply: TToolButton;
    ToolButton14: TToolButton;
    Btn_Detal: TToolButton;
    Btn_Analiz: TToolButton;
    Btn_Marketing: TToolButton;
    Btn_Subdoc: TToolButton;
    IBQuery1: TIBQuery;
    MemRNS: TRxMemoryData;
    DsRNS: TDataSource;
    MemRNSTW_ID: TIntegerField;
    MemRNSTW_NAM: TStringField;
    MemRNSTW_MONEY: TFloatField;
    MemRNSTW_KOL: TFloatField;
    MemRNSTW_SUMM: TFloatField;
    MemRNSED_SHORT: TStringField;
    MemRNSSTS_ID: TIntegerField;
    MemRNSTW_ART: TIntegerField;
    Label14: TLabel;
    Query1Transaction: TIBTransaction;
    IBQuery2: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnSave: TMenuItem;
    MnApply: TMenuItem;
    N6: TMenuItem;
    MnPrint: TMenuItem;
    MnHistory: TMenuItem;
    MnSubDoc: TMenuItem;
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
    ToolButton1: TToolButton;
    Btn_PrintCenn: TToolButton;
    Btn_PrintCennMore: TToolButton;
    MemRNSTW_SKID: TFloatField;
    MemRNSTW_OKMONEY: TFloatField;
    Label1: TLabel;
    RN_VALUTA: TRxDBLookupCombo;
    N1: TMenuItem;
    MnSet_Skid: TMenuItem;
    MemRNSOST: TFloatField;
    ToolButton2: TToolButton;
    Btn_RefreshOst: TToolButton;
    MnRefreshOst: TMenuItem;
    N3: TMenuItem;
    Label2: TLabel;
    RN_SKID: TRxCalcEdit;
    Label9: TLabel;
    SKL: TRxDBLookupCombo;
    Label12: TLabel;
    RN_RNVID: TRxDBLookupCombo;
    Label13: TLabel;
    RN_KURS: TRxCalcEdit;
    RN_DOST: TCheckBox;
    Label15: TLabel;
    Label16: TLabel;
    RN_DISKONT: TEdit;
    MemRNSTW_SKIDDOLL: TFloatField;
    Btn_PrintKKM: TToolButton;
    Btn_NODISCONT: TToolButton;
    ToolButton6: TToolButton;
    RN_SKID_TXT: TEdit;
    Label17: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    TabSheet2: TTabSheet;
    ToolBar2: TToolBar;
    RxDBGrid2: TRxDBGrid;
    MemRNSSKID_TXT: TStringField;
    ONE_SKID: TEdit;
    Btn_ALLSKID: TBitBtn;
    ToolButton3: TToolButton;
    MnPROW: TMenuItem;
    MnUnprow: TMenuItem;
    N2: TMenuItem;
    MnPRINTKKM: TMenuItem;
    Timer1: TTimer;
    BTN_KLN: TBitBtn;
    N4: TMenuItem;
    MnFRM: TMenuItem;
    MnKLN: TMenuItem;
    MemRNSTW_COLOR: TIntegerField;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    RN_SUMM: TRxCalcEdit;
    Label18: TLabel;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Btn_Ost: TToolButton;
    MnOst: TMenuItem;
    MemRNSOTG_KOL: TFloatField;
    N5: TMenuItem;
    Image1: TImage;
    DOST_DATE: TDateEdit;
    MemRNSMET_MONEY_SHOP: TStringField;
    Label4: TLabel;
    RVID: TRxDBLookupCombo;
    RvidTransaction: TIBTransaction;
    DicShopRvid: TIBQuery;
    DicShopRvidRVID_ID: TIntegerField;
    DicShopRvidRVID_NAME: TIBStringField;
    DicShopRvidRVID_SUBKLN: TIntegerField;
    DsShopRvid: TDataSource;
    ActionList1: TActionList;
    PrintTWCheck: TAction;
    ToolButton9: TToolButton;
    PrintTwCheckFast: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    RVIDKLNCAP: TLabel;
    RVIDKLN: TRxDBLookupCombo;
    DicRvidKLN: TIBQuery;
    DsRvidKln: TDataSource;
    DicRvidKLNKLN_ID: TIntegerField;
    DicRvidKLNKLN_FULL: TIBStringField;
    ActRnToPO: TAction;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ActRnToStorno: TAction;
    ToolButton13: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    TabSheet3: TTabSheet;
    ToolBar3: TToolBar;
    ActNewPo: TAction;
    PoTransaction: TIBTransaction;
    RxDBGrid3: TRxDBGrid;
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
    DsListPO: TDataSource;
    ToolButton17: TToolButton;
    ActShowPO: TAction;
    ActOpenPo: TAction;
    ToolButton18: TToolButton;
    QrListPOPORN_SUMM: TFloatField;
    ActDelPo: TAction;
    ToolButton19: TToolButton;
    QrListPOPORN_ID: TIntegerField;
    Label19: TLabel;
    Timer2: TTimer;
    Timer3: TTimer;
    TABEL: TRxCalcEdit;
    Btn_Tabel: TButton;
    MemRNSRNS_TABEL: TIntegerField;
    Label20: TLabel;
    Label21: TLabel;
    NDS: TRxCalcEdit;
    NP: TRxCalcEdit;
    PopupNDS: TPopupMenu;
    MnNDS: TMenuItem;
    PopupNP: TPopupMenu;
    MnNP: TMenuItem;
    BtnPrintNpz: TToolButton;
    MnuPrintNPZFast: TMenuItem;
    MemRNSTW_SHORT_NAM: TStringField;
    IBQuery3: TIBQuery;
    DataSource3: TDataSource;
    MnuFastInfo: TMenuItem;
    Label23: TLabel;
    RN_WEIGHT: TRxCalcEdit;
    MemRNSTW_WEIGHT: TFloatField;
    MemRNSRNS_WEIGHT: TFloatField;
    ToolButton21: TToolButton;
    PrintRndRear: TAction;
    Label24: TLabel;
    RN_SUB: TEdit;
    MemRNSTW_NEGABARIT: TStringField;
    cbSkidNoPrint: TCheckBox;
    FRM: TRxDBLookupCombo;
    RN_DOV: TMaskEdit;
    RN_WHO: TComboBox;
    btnOpenDrawer: TToolButton;
    ToolButton22: TToolButton;
    actOpenDrawer: TAction;
    MemRNSTW_SALER_ID: TIntegerField;
    IBSkl: TIBQuery;
    IBSklSKL_ID: TIntegerField;
    IBSklSKL_SHORT: TIBStringField;
    IBSklSKL_FRM: TIntegerField;
    IBSklFRM_NAME: TIBStringField;
    DSSkl: TDataSource;
    KLN_KTG: TEdit;
    MemRNSTW_NOSKID: TIntegerField;
    MemRNSTW_SKID_LOAD: TFloatField;
    MemRNSnapr: TIntegerField;
    MemRNSktg: TIntegerField;
    cbDirectPost: TCheckBox;
    RN_PAYMENT: TCheckBox;
    PAYMENT_DETAIL: TEdit;
    Label22: TLabel;
    RN_NAC: TRxCalcEdit;
    MemRNSTW_SEB: TFloatField;
    Label25: TLabel;
    rn_gp: TEdit;
    chkINTERNET_MAGAZ: TCheckBox;
    fastprintRn: TAction;
    N9: TMenuItem;
    MH14: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    ToolButton20: TToolButton;
    MH_IZV: TfrReport;
    ToolButton23: TToolButton;
    MH_PRET: TfrReport;
    ToolButton24: TToolButton;
    print_mh3: TAction;
    mnuPrintMH3: TMenuItem;
    comboDiscont: TComboBox;
    Label26: TLabel;
    btn_set_sklaD_manager: TButton;
    label_PN_MANAGER: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Show_Sost;
    Procedure Refresh_summ;
    Procedure Change_FRMKln(ID,N:integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MemRNSCalcFields(DataSet: TDataSet);
    procedure BTN_KLNClick(Sender: TObject);
    procedure Btn_ApplyClick(Sender: TObject);
    procedure Btn_SAVEClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DsRNSDataChange(Sender: TObject; Field: TField);
    procedure Btn_DelTowClick(Sender: TObject);
    procedure Btn_DetalClick(Sender: TObject);
    function Get_napr_kln(TW_ID:integer): integer;
    procedure ADD_RNS(TW_ID:integer;KOL:double);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_PrintClick(Sender: TObject);
    procedure Btn_SubdocClick(Sender: TObject);
    procedure Btn_PropertisClick(Sender: TObject);
    procedure Btn_DicTowClick(Sender: TObject);
    procedure Btn_FindTowClick(Sender: TObject);
    procedure Btn_AnalizClick(Sender: TObject);
    procedure Btn_MarketingClick(Sender: TObject);
    procedure Btn_PrintCennClick(Sender: TObject);
    procedure Btn_PrintCennMoreClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MnSet_SkidClick(Sender: TObject);
    procedure Btn_RefreshOstClick(Sender: TObject);
    procedure RN_SKIDChange(Sender: TObject);
    procedure Btn_ProwClick(Sender: TObject);
    procedure Btn_UnprowClick(Sender: TObject);
    procedure SKLChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MemRNSTW_SKIDChange(Sender: TField);
    procedure Btn_ALLSKIDClick(Sender: TObject);
    procedure Btn_NODISCONTClick(Sender: TObject);
    procedure Btn_PrintKKMClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RN_DATEChange(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure RN_RNVIDChange(Sender: TObject);
    procedure RN_DOSTClick(Sender: TObject);
    procedure Btn_OstClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DOST_DATEChange(Sender: TObject);
    procedure MemRNSTW_KOLChange(Sender: TField);
    procedure RN_KURSChange(Sender: TObject);
    procedure PrintTWCheckExecute(Sender: TObject);
    procedure PrintTwCheckFastExecute(Sender: TObject);
    procedure RVIDChange(Sender: TObject);
    procedure ActRnToPOExecute(Sender: TObject);
    procedure ActRnToStornoExecute(Sender: TObject);
    procedure ActNewPoExecute(Sender: TObject);
    procedure ActShowPOExecute(Sender: TObject);
    procedure ActOpenPoExecute(Sender: TObject);
    procedure ActDelPoExecute(Sender: TObject);
    procedure QrListPOAfterOpen(DataSet: TDataSet);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure TabelKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_TabelClick(Sender: TObject);
    procedure RVIDKLNChange(Sender: TObject);
    procedure TABELChange(Sender: TObject);
    procedure MnNDSClick(Sender: TObject);
    procedure MnNPClick(Sender: TObject);
    procedure SET_NDS_NP;
    procedure BtnPrintNpzClick(Sender: TObject);
    procedure MnuPrintNPZFastClick(Sender: TObject);
    procedure NDSKeyPress(Sender: TObject; var Key: Char);
    procedure NDSExit(Sender: TObject);
    procedure RN_WHO1Change(Sender: TObject);
    function RNSumm: double;
    procedure MemRNSAfterEdit(DataSet: TDataSet);
    procedure PrintRndRearExecute(Sender: TObject);
    function TWOst(tw_id: integer): double;
    procedure SAVE_RN_KASSIR();
    procedure CalcDostCost();
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FRMChange(Sender: TObject);
    procedure RN_DOVChange(Sender: TObject);
    procedure btnOpenDrawerClick(Sender: TObject);
    procedure actOpenDrawerExecute(Sender: TObject);
    procedure RN_PAYMENTClick(Sender: TObject);
    procedure PAYMENT_DETAILChange(Sender: TObject);
    procedure fastprintRnExecute(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure MH14BeginDoc;
    procedure MH_IZVBeginDoc;
    procedure ToolButton23Click(Sender: TObject);
    procedure ToolButton24Click(Sender: TObject);
    procedure MH_PRETBeginDoc;
    procedure print_mh3Execute(Sender: TObject);
    procedure comboDiscontChange(Sender: TObject);
    procedure btnMakePnClick(Sender: TObject);
    procedure btn_set_sklaD_managerClick(Sender: TObject);


  private
    { Private declarations }
    RN_KASSA_ID: integer;
    RN_KASSIR_ID: integer;
    REAL_TYP: integer;
    pers_skid: integer;
    RNTYP_IS_TEMP: boolean;
    IS_SALE: Boolean;

    skl_frm: integer;
    kln_ktg_id: integer;
    initComplete: boolean;

  public
    { Public declarations }
  end;

var
  JOU_PO2: TJOU_PO;
  RN_KKM:boolean=false;
  CanInsert:Boolean=False;
  RNS_DEL:array[1..1000] of integer;
  RNS_DEL_TW:array[1..1000] of integer;
  RNS_DEL_OTG:array[1..1000] of double;
  RNS_DEL_MESS:array[1..1000] of string;
  RNS_DEL_MESS2:array[1..1000] of string;
  RN_PROW:boolean;
  CNT_DEL:integer=0;
  SAVE:boolean;
  Doc_RN: TDoc_RN;
  Sost:integer=0;
  KLN_ID:integer;
  EXP_ID: integer;
  RNVID_ID:integer;
//  SKL_ID:integer;
  SHOP_ID:integer;
  RN_NUMS:integer;
  STR:ansistring='';
  DISKONT_NUM:ansistring;
  NEW_DISKONT_NUM:ansistring;
  DISKONT_ID:integer;
  otkr:integer=0;
  RVID_ID,RVID_KLN,RVID_SUBKLN:integer;
  CheckDiscont: boolean;
  autoCheck: boolean;
  canRefresh: boolean;
  pn_id: integer;
  manager_id: integer;
  sklad_razgr_id: integer;



implementation

uses Mainform, DicKlient, ANALIZTW, DicTowar, SelectPrint, SetKolvo,
  WaitForm, FR_Shtrih, PrintDoc, setSkladManager;

{$R *.DFM}



procedure TDOC_RN.CalcDostCost();
var weight1, weight2: double;
	s: string;
    ID, a: integer;
    found: boolean;
    baseprice1, baseprice2: double;
    price1, price2: double;
    id1, id2: integer;

begin
	if RN_PROW then
		exit;
  exit;
  if self.Visible then begin
     s:=self.caption;
     self.caption:=self.caption+'. Чтение остатков товаров';
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

              datamodule1.IBTransaction2.Active:=true;
              datamodule1.IbSaveSQL.SQL.Text:='SELECT MONEY FROM TW_MROZ(:TW_ID, :SHOP_ID)';
              datamodule1.IbSaveSQL.parambyname('TW_ID').asinteger:=MemRNS.fieldByName('TW_ID').asinteger;
              datamodule1.IbSaveSQL.parambyname('SHOP_ID').asinteger:=SHOPID;
              datamodule1.IbSaveSQL.Open;
              baseprice1:=datamodule1.IbSaveSQL.Fieldbyname('MONEY').asfloat;
              datamodule1.IbSaveSQL.close;
              datamodule1.IBTransaction2.commit;
              except
              datamodule1.IBTransaction2.Rollback;
              end;
              datamodule1.IBTransaction2.Active:=false;

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
              datamodule1.IBTransaction2.Active:=true;
              datamodule1.IbSaveSQL.SQL.Text:='SELECT MONEY FROM TW_MROZ(:TW_ID, :SHOP_ID)';
              datamodule1.IbSaveSQL.parambyname('TW_ID').asinteger:=MemRNS.fieldByName('TW_ID').asinteger;
              datamodule1.IbSaveSQL.parambyname('SHOP_ID').asinteger:=SHOPID;
              datamodule1.IbSaveSQL.Open;
              baseprice2:=datamodule1.IbSaveSQL.Fieldbyname('MONEY').asfloat;
              datamodule1.IbSaveSQL.close;
              datamodule1.IBTransaction2.commit;
              except
              datamodule1.IBTransaction2.Rollback;
              end;
              datamodule1.IBTransaction2.Active:=false;
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
     self.caption:=s;
  end;
end;

procedure TDOC_RN.SAVE_RN_KASSIR();
begin
   RN_KASSA_ID:=KKM_ID;
   RN_KASSIR_ID := USERID;

   try
	IBSAVE_CLEAR;
    IBSAVE_ADD('KASSA_ID',RN_KASSA_ID);
	IBSAVE_ADD('KASSIR_ID',RN_KASSIR_ID);

    IBSAVE_DOC('RN',self.tag);
    Datamodule1.IBTransaction2.Commit;
   except
    Datamodule1.IBTransaction2.Rollback;
   end;
    Datamodule1.IBTransaction2.Active:=false;
end;


function TDOC_RN.TWOst(tw_id: integer): double;
var zone_type: integer;
begin
	TWOst:=0;
  TWOst:=GetOst(tw_id,strtoint('0'+SKL.Value), strtoint(FRM.value));

end;


function tDoc_rn.RnSumm: double;
var
   a,ID:integer;
   Summ:Double;
begin
result := 0;
     if MemRNS.RecordCount>0 then
     begin
         ID:=MemRNS.RecNo;
         MemRNS.DisableControls;
         MemRNS.First;
         Summ:=0;
         while not MemRNS.eof do begin
               SUMM:=SUMM+MemRNS.fieldbyname('TW_KOL').asfloat*MemRNS.fieldbyname('TW_MONEY').asfloat;
               MemRNS.next;
         end;
         MemRNS.First;
         for a:=1 to ID-1 do MemRNS.next;
         MemRNS.EnableControls;
         result := summ;
     end;
end;


procedure TDoc_RN.Show_sost;
var
   s:ansistring;
   RnEmpty:boolean;
   oldProv: Boolean;
   i: integer;
begin

     oldProv := RN_PROW;
     if is_sale then
        RN_PROW:=True;

     if self.Tag<0 then
       self.caption:=RNTYP[self.Statusbar1.Tag].FULL+'. Новая'
     else begin
          if RN_PROW then
            self.caption:=RNTYP[self.Statusbar1.Tag].FULL+'. Просмотр'
          else
            self.caption:=RNTYP[self.Statusbar1.Tag].FULL+'. Редактирование';
     end;
     if MemRNS.RecordCount=0 then RnEmpty:=true else RnEmpty:=false;
     if Timer1.Enabled then s:='Ввод дисконта...' else begin
        case Sost of
             0: begin
                   s:='Ожидание...';
                   Panel2.Color:=clBtnFace;
                   Panel2.Font.color:=ClWindowText;
                end;
             1: begin
                   s:='Ввод товаров...';
                   if TW_FON>=0 then Panel2.Color:=TW_FON;
                   if TW_COLOR>=0 then Panel2.Font.color:=TW_COLOR;
                end;
        end;
     end;





     StatusBar1.Panels[0].text:='Состояние: '+s;
     if not Timer1.enabled then StatusBar1.Panels[1].text:=STR;
     Btn_NODISCONT.enabled:=(not RN_PROW) and (not RnEmpty);
     Btn_Prow.enabled:=(not RN_PROW) and (not RnEmpty);
     MnProw.enabled:=(not RN_PROW) and (not RnEmpty);
     Btn_UnProw.enabled:=(RN_PROW) and (not RnEmpty) and (not is_sale);
     MnUnProw.enabled:=(RN_PROW) and (not RnEmpty)and (not is_sale);
     Btn_SAVE.enabled:=(not RN_PROW) and (not RnEmpty);
     MnSAVE.enabled:=(not RN_PROW) and (not RnEmpty);
     ActRnToPo.enabled:=(not RnEmpty) and (self.tag>0) and Can_create_PO;
     ActRnToStorno.enabled:=(not RnEmpty) and (self.tag>0) and RN_PROW;
     RxDbgrid1.ReadOnly:=RN_PROW;
     RxDbgrid2.readonly:=RN_PROW;
     Btn_ALLSKID.enabled:=(not RN_PROW) and (not RnEmpty);
     ONE_SKID.enabled:=(not RN_PROW) and (not RnEmpty);
     MnSEt_SKid.enabled:=(not RnEmpty) and (not RN_PROW);
     Btn_Apply.enabled:=(not RN_PROW) and (not RnEmpty);
     MnApply.enabled:=(not RN_PROW) and (not RnEmpty);
     Btn_Print.enabled:=not RnEmpty;
     PrintTwCheckFast.enabled:=not RnEmpty and not RNTYP_IS_TEMP;
     PrintTwCheck.enabled:=not RnEmpty and not RNTYP_IS_TEMP;
     MnPrint.enabled:=not RnEmpty;
     Btn_PrintKKM.enabled:=not RnEmpty and GlCanKKM and not RNTYP_IS_TEMP;
     MnPrintKKM.enabled:=not RnEmpty and GlCanKKM and not RNTYP_IS_TEMP;
     Btn_Propertis.enabled:=true;
     MnHistory.enabled:=true;
     Btn_RefreshOst.enabled:=(not RnEmpty) and (not RN_PROW);
     MnRefreshOst.enabled:=(not RnEmpty) and (not RN_PROW);
     Btn_SubDoc.enabled:=not RnEmpty;
     MnSubDoc.enabled:=not RnEmpty;
     Btn_DicTow.enabled:=(not RN_PROW);
     MnTw.enabled:= (not RN_PROW);
     Btn_DelTow.enabled:=(not RnEmpty) and (not RN_PROW);
     MnDel.enabled:=(not RnEmpty) and (not RN_PROW);
     Btn_OST.enabled:=(not RnEmpty) and (not RN_PROW);
     MnOST.enabled:=(not RnEmpty) and (not RN_PROW);
     Btn_DETAL.enabled:=not RnEmpty and CANTW_DETAL;
     MnDETAL.enabled:=not RnEmpty and CANTW_DETAL;
     Btn_Analiz.enabled:=not RnEmpty and CANTW_ANALIZ;
     MnAnaliz.enabled:=not RnEmpty and CANTW_ANALIZ;
     Btn_Marketing.enabled:=not RnEmpty and CANTW_MARKETING;
     MnMarketing.enabled:=not RnEmpty and CANTW_MARKETING;
     Btn_PrintCenn.enabled:=not RnEmpty;
     MnCenn.enabled:=not RnEmpty;
     Btn_PrintCennMore.enabled:=not RnEmpty;
     MnCennMore.enabled:=not RnEmpty;

     FRM.enabled:= (not RN_PROW) ;



     MnFRM.enabled:= (not RN_PROW);
     BTN_KLN.enabled:= (not RN_PROW);
     MnKLN.enabled:= (not RN_PROW);
     NP.enabled:= (not RN_PROW);
     MnNP.enabled:= (not RN_PROW);
     NDS.enabled:= (not RN_PROW);
     MnNDS.enabled:= (not RN_PROW);
     RN_DATE.enabled:= (not RN_PROW);
     cbDirectPost.enabled:=(not RN_PROW);
//     RN_VALUTA.enabled:= (not RN_PROW);
     RN_OSN.enabled:= (not RN_PROW);
     RN_WHO.enabled:= (not RN_PROW);
     RN_GP.enabled:= (not RN_PROW);

     self.chkINTERNET_MAGAZ.Enabled:=(not RN_PROW);

     SKL.enabled:= (not RN_PROW);
//     RN_ZONE.enabled:= (not RN_PROW);
//     RN_SKL.enabled:= (not RN_PROW);
     RN_RNVID.enabled:= (not RN_PROW);
//     RN_KURS.enabled:= (not RN_PROW);
     RN_DOST.enabled:= (not RN_PROW);
     DOST_DATE.enabled:= (not RN_PROW);
     RVID.enabled:= (not RN_PROW);
     RVIDKLN.enabled:= (not RN_PROW);
     Tabel.enabled:=(not RN_PROW);
     Btn_tabel.enabled:=(not RN_PROW) and (not RnEmpty);;
     ActNewPO.enabled:=(not RN_PROW);
     ActOpenPO.enabled:=(not RN_PROW);
     ActDelPo.enabled:=not (QrListPO.eof or RN_PROW);
     BtnPrintNpz.Enabled:= not RnEmpty and not RNTYP_IS_TEMP;
     MnuPrintNpzFast.Enabled:= not RnEmpty and not RNTYP_IS_TEMP;
     PrintRndRear.Enabled:=not RnEmpty and not RNTYP_IS_TEMP;

     RN_PROW := oldProv;


{     if USER_EDIT_MONEY_MODE=0 then
     begin
        for i := 0 to  RxDBGrid1.Columns.Count-1 do
         if RxDBGrid1.Columns[i].FieldName='TW_SKID' then
          RxDBGrid1.Columns[i].ReadOnly:=true;
     end;
}

end;

procedure TDoc_RN.Change_FrmKln(ID,N:integer);
var
   s1,s2:ansistring;
   kateg:integer;
   kln_manager_tabel: integer;
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
         kln_manager_tabel:=QueryWork.fieldbyname('kln_manager_tabel').asInteger;
     end;

     if N=1 then
     begin
        FRM_BNK.text:=s2;
     end
     else
     begin
        KLN_NAME.text:=s1;
        KLN_BNK.text:=s2;
        //менять только если табель <>0 и тип накладной - БНАЛ
        if kln_manager_tabel>0 then
        if RNTYP[self.Statusbar1.Tag].ID<>1 then
          TABEL.Value:=kln_manager_tabel;

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
         if MemRNS.Fieldbyname('MET_MONEY_SHOP').asstring='1' then
         begin
           if SHOP_KLN_DEFAULT(SHOPID,self.ToolBar1.Tag)<>KLN_ID then
           begin
             MemRNS.Fieldbyname('TW_NOSKID').asinteger:=0;
             MemRNS.Fieldbyname('MET_MONEY_SHOP').asstring:='0';
           end;
         end;
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
     QueryWork.ParamByName('kln_id').asinteger:=KLN_ID;
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


procedure TDoc_RN.FormShow(Sender: TObject);
var save1: boolean;
y,m,d: word;
h, mm, s, mils: word;
begin

     if (userid=2646702) then
        timer1.Interval := 3000;


     RN_NAC.Visible:= (shopID in [10,105]);
     canRefresh:=false;
     initComplete:=false;
     Show_Wait('Инициализация накладной. Виды реализации...',2);
     IS_EDIT_RN:=true;
     skl_frm:=-1;
     RvidTransaction.Active:=false;
     //Внутренняя продажа
//     btnMakePn.Visible:=(self.ToolBar1.Tag = 160010005);

     btn_set_sklaD_manager.Visible:=(self.ToolBar1.Tag = 160010005);
     self.label_PN_MANAGER.Visible:=(self.ToolBar1.Tag = 160010005);



     DataModule1.MainDicRnTyp.Locate('RNTYP_ID',self.ToolBar1.Tag,[]);
     REAL_TYP:=DataModule1.MainDicRnTyp.fieldByname('REAL_TYP').asinteger;
     if (DataModule1.MainDicRnTyp.fieldByname('TEMP').asstring='1') then
        RNTYP_IS_TEMP:=true else RNTYP_IS_TEMP:=false;


     DicShopRvid.close;
     DicShopRvid.ParamByname('shop_id').asinteger:=SHOPID;
     DicShopRvid.ParamByname('rntyp_id').asinteger:=self.ToolBar1.Tag;
     DicShopRvid.ParamByname('rn_id').asinteger:=self.tag;
     DicShopRvid.open;
     DicRvidKLN.close;
     DicRvidKLN.open;


     if (self.ToolBar1.Tag = 1) then
             comboDiscont.Visible:=true;


     if not DicRvidKLN.eof then RVIDKLN.value:=DicRvidKLN.fieldByname('KLN_ID').asstring;

     pn_id:=0;


     Sost:=0;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.DesktopWidth;
     Height:=Screen.DesktopHeight-Main_Form.Top-22-29;

     if real_typ = 1 then
       begin
         Label15.Caption := 'По доверенности';
         rn_who.Hint := 'номер доверенности, дата выдачи, кем, кому (организация, место работы, должность, ФИО)';
       end;

     {Определяем название}
     if self.tag<0 then begin
       Sost:=0;
       RN_KKM:=false;
       RN_PROW:=False;
       Show_wait('Инициализация накладной. Настройки по умолчанию...',40);
       Get_default;
       Show_wait('Инициализация накладной. Очистка данных...',70);
       {Устанавливаем данные}
       SHOP_RVID_DEFAULT(SHOPID,self.ToolBar1.Tag,RVID_ID,RVID_KLN,RVID_SUBKLN);
       RVID.value:=inttostr(RVID_ID);
       RVIDChange(Sender);
       KLN_ID:=SHOP_KLN_DEFAULT(SHOPID,self.ToolBar1.Tag);
       FRM.Value:= inttostR( SHOP_FRM_DEFAULT(SHOPID, self.ToolBar1.Tag));

       IbSkl.ParamByName('SHOP_ID').asinteger := SHOPID;
       IbSkl.Open;

       skl.Value := inttostR(DEFAULT_SKLAD);

       EXP_ID:= 1;
       RNVID_ID:=DEFAULT_RNVID;
       DISKONT_ID:=0;
       DISKONT_NUM:='';
       RN_OSN.lines.clear;
       RN_WHO.text:='';
       RN_NUM.text:='Новый';
       RN_NUMS:=-1;
       RN_VALUTA.value:='0';
       RN_DATE.date:=Date();
       RN_KURS.Value:=DEFAULT_KURS(1,-self.ToolBar1.Tag);
       RN_DOST.Checked:=False;
       RN_SKID_TXT.text:='';
       NDS.Value:=NDS_DATE(RN_DATE.date, self.ToolBar1.Tag);
       NP.value:=NP_DATE(self.ToolBar1.Tag,RN_DATE.date);
       SHOP_ID:=SHOPID;
       RN_SKID.value:=0;
       RN_KASSA_ID:=0;
       RN_KASSIR_ID:=0;





       
       if DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger=2 then begin
         // НДС всегда не выделяется!
         NDS.value:=0;
         NDS.enabled:=False;
       end;

       if real_typ = 1 then
       begin
          rn_who.Text := '№  от ""   20  года, выданной ';
          rn_who.Hint := 'номер доверенности, дата выдачи, кем, кому (организация, место работы, должность, ФИО)';
       end
       else
        RN_DOV.EditMask:='';

        decodeDate(date, y, m, d);
        decodetime(time, h, mm, s, mils);
        if (h=29) or (DayofWeek(Date()) = 1)  or ((m = 3) and (d = 8)) or ((m = 2) and (d = 23)) or ((m = 5) and (d = 9)) or ((m = 6) and (d = 12)) or ((m = 1) and (d = 2)) or ((m = 1) and (d = 7)) then        //начало недели - воскресенье
        begin
           if (strtoint('0'+RVID.Value)<3) then
//           if (DISKONT_ID = 0) then
           begin
                DISKONT_NUM:='70045605';
                DISKONT_ID := 1283615;
                RN_SKID.Value :=3;
           end
        end;

       Show_wait('Инициализация накладной. Все почти готово...',99);
     end else begin
          {Читаем накладную}
          Show_wait('Инициализация накладной. Чтение "шапки" накладной...',40);
          ADD_SQL(IbQuery1,'select RN.*, pn$.pn$_owner ,pn$.skl_id sklad_razgr ,  card.card_num, sales.sale_id,  (select kln_full from kln_data(rn.frm_id)) FRM_FULL, (select skl.skl_short from skl where skl.skl_id = rn.skl_id) SKL_SHORT '+
          ' from rn left join card on card.card_id = rn.card_id  left join sales on sales.rn_id = rn.rn_id left join pn$ on pn$.pn$_id = rn.pn$_id  where RN.RN_ID=:RN_ID');
          {Определяем, где накладная}
          IbQuery1.Parambyname('RN_ID').asinteger:=self.tag;
          IbQuery1.Open;
          if IbQuery1.fieldbyname('RN_PROW').asstring='1'
            then RN_PROW:=true else RN_PROW:=false;
          if IbQuery1.fieldbyname('RN_KKM').asstring='1'
            then RN_KKM:=true else RN_KKM:=false;
          RVID.value:=IbQuery1.fieldbyname('RVID_ID').asstring;
          RVIDChange(Sender);
          if IbQuery1.fieldbyname('RVID_KLN').asinteger>0
            then RVIDKLN.value:=IbQuery1.fieldbyname('RVID_KLN').asstring;

          IbSkl.ParamByName('SHOP_ID').asinteger := IbQuery1.fieldbyname('SHOP_ID').asinteger;
          IbSkl.Open;


          KLN_ID:=IbQuery1.fieldbyname('KLN_ID').asinteger;
//**********
     Add_SQL(QueryWork,'select valuestr from propkln where kln_id=:kln_id and propkln.typ=:typ');
     QueryWork.ParamByName('kln_id').asinteger:=KLN_ID;
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
          SKL.Value:=IbQuery1.fieldbyname('SKL_ID').asstring;
          frm.Value := Ibquery1.fieldbyname('frm_id').asstring;
          if FRM.value='' then
          begin
            FRM.DisplayEmpty := IbQuery1.fieldbyName('FRM_FULL').asstring;
            FRM.EmptyValue := IbQuery1.fieldbyName('FRM_ID').asstring;
          end;

          if SKL.value='' then
          begin
            SKL.DisplayEmpty := IbQuery1.fieldbyName('SKL_SHORT').asstring;
            SKL.EmptyValue := IbQuery1.fieldbyName('SKL_ID').asstring;
          end;

          pn_id:=IbQuery1.fieldbyname('PN$_ID').asinteger;
          manager_id :=IbQuery1.fieldbyname('pn$_owner').asinteger;
          sklad_razgr_id :=IbQuery1.fieldbyname('sklad_razgr').asinteger;
          if (sklad_razgr_id = 0) then label_PN_MANAGER.caption:='НЕ УКАЗАН СКЛАД РАЗГРУЗКИ';



          RNVID_ID:=IbQuery1.fieldbyname('RNVID_ID').asinteger;
          DISKONT_ID:=IbQuery1.fieldbyname('CARD_ID').asinteger;
          RN_OSN.lines.clear;
          RN_OSN.lines.add(IbQuery1.fieldbyname('RN_OSN').asstring);
          RN_WHO.text:=IbQuery1.fieldbyname('RN_WHO').asstring;
          RN_SKID_TXT.text:=IbQuery1.fieldbyname('RN_SKID_TXT').asstring;
          SHOP_ID:=IbQuery1.fieldbyname('SHOP_ID').asinteger;
          RN_NUM.text:=IbQuery1.fieldbyname('RN_NUM').asstring;
          RN_NUMS:=IbQuery1.fieldbyname('RN_NUM').asinteger;
          RN_VALUTA.value:=IbQuery1.fieldbyname('VALUTA_ID').asstring;
          RN_DATE.date:=IbQuery1.fieldbyname('RN_DATE').asdatetime;
          RN_KURS.value:=IbQuery1.fieldbyname('RN_KURS').asfloat;
          RN_SKID.value:=IbQuery1.fieldbyname('RN_SKID').asfloat;
          NDS.value:=IbQuery1.fieldbyname('NDS').asfloat;
          NP.value:=IbQuery1.fieldbyname('NP').asfloat;
          RN_KASSA_ID:=IbQuery1.fieldbyname('KASSA_ID').asinteger;
          RN_KASSIR_ID:=IbQuery1.fieldbyname('KASSIR_ID').asinteger;
          RN_SUB.text:=IbQuery1.fieldbyname('RN_SUB').asstring;
          RN_GP.text:=IbQuery1.fieldbyname('RN_GP').asstring;          


          if IbQuery1.fieldbyname('DIRECT_POST').asinteger=1 then
            cbDirectPost.checked:=true
          else
            cbDirectPost.checked:=false;


          RN_PAYMENT.checked:= (IbQuery1.fieldbyname('RN_PAYMENT').asinteger = 1);
          PAYMENT_DETAIL.Text := IbQuery1.fieldbyname('PAYMENT_DETAIL').asstring;
//          RN_PAYMENT.Enabled := not RN_PAYMENT.Checked;

          if userid=1423401 then
            RN_PAYMENT.Enabled:=true;







          autoCheck:= false;

          if IbQuery1.fieldbyname('RN_DOST').asinteger=1 then begin
            RN_DOST.checked:=true;
            DOST_DATE.date:=IbQuery1.fieldbyname('DOST_DATE').asdatetime;
          end else RN_DOST.checked:=false;
          autoCheck:= true;



          if DISKONT_ID>0 then DISKONT_NUM:=IbQuery1.fieldbyname('CARD_NUM').asstring
                          else DISKONT_NUM:='';


          is_sale := False;
          if  ((ibquery1.fieldbyname('sale_id').asinteger>0) or ( (ibquery1.fieldbyname('pn$_id').asinteger>0) and (self.ToolBar1.Tag<>160010005)         )          ) then
          begin
             messbox('Накладная сделана автоматически на основании '+RN_SUB.Text+' и может быть изменена только изменением документа-основания', messSystem, 0);
             IS_SALE:=true;
          end;

          ibquery1.Close;


          {Читаем содержимое накладной}
          Show_wait('Инициализация накладной. Чтение табличной части...',60);
          Add_SQL(IbQuery1,'select * from LIST_RNS(:RN_ID,1) order by RNS_ID');
          IbQuery1.Parambyname('RN_ID').asinteger:=self.tag;
          IbQuery1.Open;
          Show_wait('Инициализация накладной. Чтение табличной части...',70);
          while not IbQuery1.eof do begin
                CanInsert:=True;
                MemRNS.Append;
                Get_napr_kln(IbQuery1.Fieldbyname('TW_ID').asinteger);
                MemRNS.Fieldbyname('RNS_ID').asinteger:=IbQuery1.Fieldbyname('RNS_ID').asinteger;
                MemRNS.Fieldbyname('TW_ID').asinteger:=IbQuery1.Fieldbyname('TW_ID').asinteger;
                MemRNS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TW_COLOR').asinteger;
                MemRNS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
                MemRNS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
                MemRNS.Fieldbyname('TW_SHORT_NAM').asstring:=IbQuery1.Fieldbyname('TW_SHORT_NAM').asstring;
                MemRNS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
                MemRNS.Fieldbyname('TW_KOL').asfloat:=IbQuery1.Fieldbyname('TW_KOL').asfloat;
                MemRNS.Fieldbyname('OTG_KOL').asfloat:=IbQuery1.Fieldbyname('OTG_KOL').asfloat;
                MemRNS.Fieldbyname('TW_MONEY').asfloat:=IbQuery1.Fieldbyname('TW_MONEY').asfloat;
                MemRNS.Fieldbyname('TW_WEIGHT').asfloat:=IbQuery1.Fieldbyname('TW_WEIGHT').asfloat;
                MemRNS.Fieldbyname('TW_SKID').asfloat:=IbQuery1.Fieldbyname('TW_SKID').asfloat;
                MemRNS.Fieldbyname('TW_SKID_LOAD').asfloat:=IbQuery1.Fieldbyname('TW_SKID').asfloat;
                MemRNS.Fieldbyname('SKID_TXT').asstring:=IbQuery1.Fieldbyname('SKID_TXT').asstring;
                MemRNS.Fieldbyname('TW_SKIDDOLL').asfloat:=IbQuery1.Fieldbyname('TW_SKIDDOLL').asfloat;
                MemRNS.fieldByname('OST').asfloat:=IbQuery1.Fieldbyname('OST').asfloat;
                MemRNS.Fieldbyname('MET_MONEY_SHOP').asstring:=IbQuery1.Fieldbyname('MET_MONEY_SHOP').asstring;
                MemRNS.Fieldbyname('RNS_TABEL').asstring:=IbQuery1.Fieldbyname('RNS_TABEL').asstring;
                MemRNS.Fieldbyname('TW_NEGABARIT').asstring:=IbQuery1.Fieldbyname('TW_NEGABARIT').asstring;
                MemRNS.Fieldbyname('TW_NOSKID').asfloat:=IbQuery1.Fieldbyname('TW_NOSKID').asinteger;
                MemRNS.Fieldbyname('TW_SEB').asfloat:=GetTWKtgPrice(ibQuery1.Fieldbyname('TW_ID').asinteger, 5);
                MemRNS.Post;
                CanInsert:=False;
                IbQuery1.next;
          end;



          Show_wait('Инициализация накладной. Проверка НДС...',80);
          if RN_PROW then begin
                DataModule1.MainDicRnTyp.Locate('RNTYP_ID',self.ToolBar1.Tag,[]);
                if DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger=2 then begin
                        // НДС всегда не выделяется!
                        if NDS.value<>0 then Messbox('В соответствии с настройками ставка НДС в накладной должна быть равна 0%!',MessSystem,16);
                end;
                if DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger=1 then begin
                        // НДС всегда выделяется!
//Добавлено для проверки НДС открываемых накладных.
//11.04.2004 Игорь Сторожев

                        Add_SQL(IbQuery1,'select RES from RN_CHECK(:RN_ID)');
                        IbQuery1.Parambyname('RN_ID').asinteger:=self.tag;
                        IbQuery1.Open;
                        if (IbQuery1.FieldByName('RES').AsInteger = 1) and
                        (NDS_SMALL_DATE(RN_DATE.Date)<> NDS.Value) then
                          begin
                            Messbox('В соответствии с настройками и введеными товарами ставка НДС в накладной должна быть равна '+floattostrf(NDS_SMALL_DATE(RN_DATE.date),fffixed,19,2)+' %! ',MessSystem,16);
                          end;
                        if (IbQuery1.FieldByName('RES').AsInteger = 2) and
                        (NDS_DATE(RN_DATE.Date)<> NDS.Value) then
                          begin
                            Messbox('В соответствии с настройками и введеными товарами ставка НДС в накладной должна быть равна '+floattostrf(NDS_DATE(RN_DATE.date),fffixed,19,2)+'%!',MessSystem,16);
                          end;

                        if (NDS.value<>NDS_DATE(RN_DATE.date,self.ToolBar1.Tag)) and (NDS.value<>NDS_SMALL_DATE(RN_DATE.date))
                        then Messbox('В соответствии с настройками ставка НДС в накладной должна быть равна '+floattostrf(NDS_DATE(RN_DATE.date),fffixed,19,2)+'% или '+floattostrf(NDS_SMALL_DATE(RN_DATE.date),fffixed,19,2)+'%!',MessSystem,16);
                end;
                if NP.value<>NP_DATE(self.ToolBar1.Tag,RN_DATE.date)
                then Messbox('В соответствии с настройками ставка НП в накладной должна быть равна '+floattostrf(NP_DATE(self.ToolBar1.Tag,RN_DATE.date),fffixed,19,2)+'% !',MessSystem,16);
          end else SET_NDS_NP;



          Show_wait('Инициализация накладной. Все почти готово...',99);
     end;


     DOST_DATE.visible:=RN_DOST.checked;
     otkr:=1;
     if FRM.value <> '' then
    	Change_FrmKln(strtoint(FRM.value),1);

     Change_FrmKln(KLN_ID,2);
     otkr:=0;
     RN_RNVID.Value:=inttostr(RNVID_ID);
     RN_DISKONT.text:=DISKONT_NUM;
     SAVE:=TRUE;
     Refresh_summ;
     save1:=save;


     IbQuery1.Close;

     if (manager_id>0) then
     begin


     IbQuery1.SQL.Text:='select skl_full from skl where skl_id=:skl_id';
     IbQuery1.ParamByName('skl_id').asinteger:=sklad_razgr_id;
     IbQuery1.Open;

     self.label_PN_MANAGER.Caption:='Установлено: '+ IbQuery1.fieldbyname('skl_full').asstring;
     ibquery1.close;


     IbQuery1.SQL.Text:='select kln_full from kln_data(:manager_id)';
     IbQuery1.ParamByName('manager_id').asinteger:=manager_id;
     IbQuery1.Open;

     self.label_PN_MANAGER.Caption:=self.label_PN_MANAGER.Caption + ' '+ IbQuery1.fieldbyname('kln_full').asstring;
     ibquery1.close;
     end;




     //20-08-2013 - допуск на смену табеля
//     if RNTYP[self.Statusbar1.Tag].ID<>1 then
//        Tabel.Value := USER_TABEL;



     // обновляем информацию по предоплатам
     PoTransaction.Active:=False;
     QrListPO.close;
     QrListPO.paramByname('RN_ID').asinteger:=tag;
     QrListPO.open;
     SAVE:=save1;
     Wait_form.hide;
     if self.tag<0 then begin
        Timer2.enabled:=true;
        Timer3.enabled:=true;
     end;
     Show_Sost;
     canRefresh:=true;
     autocheck:=True;
     checkDiscont := true;
     initComplete:=true;
end;


procedure TDoc_RN.SET_NDS_NP;
var nds_ok: boolean;
begin
nds_ok := false;
     DataModule1.MainDicRnTyp.Locate('RNTYP_ID',self.ToolBar1.Tag,[]);
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
//Добавлено для проверки НДС открываемых накладных.
//11.04.2004 Игорь Сторожев




          Add_SQL(IbQuery1,'select RES from RN_CHECK(:RN_ID)');
          IbQuery1.Parambyname('RN_ID').asinteger:=self.tag;
          IbQuery1.Open;
          if (IbQuery1.FieldByName('RES').AsInteger = 1) and
          (NDS_SMALL_DATE(RN_DATE.Date)<> NDS.Value) then
          begin
             Messbox('Ставка НДС выставлена в соответствии с текущей настройкой!',MessSystem,48);
             NDS.Value := NDS_SMALL_DATE(RN_DATE.Date);
             nds_ok :=true;
          end;
          if (IbQuery1.FieldByName('RES').AsInteger = 2) and
          (NDS_DATE(RN_DATE.Date)<> NDS.Value) then
          begin
             Messbox('Ставка НДС выставлена в соответствии с текущей настройкой!',MessSystem,48);
             NDS.Value := NDS_DATE(RN_DATE.Date);
             nds_ok :=true;
          end;




        if (not nds_ok) then

        if (NDS.value<>NDS_DATE(RN_DATE.date))
           AND (NDS.Value <> NDS_SMALL_DATE(RN_DATE.Date)) then
           begin
           NDS.value:=NDS_DATE(RN_DATE.date);
           SAVE:=False;
           Messbox('Ставка НДС выставлена в соответствии с текущей настройкой!',MessSystem,48);
        end;
        NDS.enabled:=True;
     end;
     if NP.value<>NP_DATE(self.ToolBar1.Tag,RN_DATE.date) then begin
        NP.value:=NP_DATE(self.ToolBar1.Tag,RN_DATE.date);
        Messbox('Ставка НП выставлена в соответствии с текущей настройкой!',MessSystem,48);
        SAVE:=False;
     end;
end;


procedure TDoc_RN.FormKeyPress(Sender: TObject; var Key: Char);
var
   ID:integer;
   N:integer;
begin
  if ((key='%') or (key=';') ) and (not RN_PROW) then begin
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
  end else begin
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

procedure TDoc_RN.MemRNSCalcFields(DataSet: TDataSet);
begin
{     if (memRNS.State in [dsEdit])
     AND (rn_skid.Value > 0) then
     begin
     if not (Messbox('При изменении накладной дисконт будет аннулирован.'+#13+#10+'Продолжить?',MessSubmit,4+48+256)=6)
     then
      begin
        memRNS.Cancel;
        exit;
      end;                                           
      btn_nodiscont.Click;
      Refresh_SUMM;

     end;
 }
     MemRNS.fieldbyname('TW_OKMONEY').asfloat:=OKRUG((MemRNS.fieldbyname('TW_MONEY').asfloat*(1-(MemRNS.fieldbyname('TW_SKIDDOLL').asfloat)/100))*(1-(MemRNS.fieldbyname('TW_SKID').asfloat+RN_SKID.value)/100),2);
     MemRNS.fieldbyname('TW_SUMM').asfloat:=MemRNS.fieldbyname('TW_OKMONEY').asfloat*MemRNS.fieldbyname('TW_KOL').asfloat;
     MemRNS.fieldbyname('RNS_WEIGHT').asfloat:=MemRNS.fieldbyname('TW_WEIGHT').asfloat*MemRNS.fieldbyname('TW_KOL').asfloat;
end;

Procedure TDoc_RN.Refresh_summ;
var
   a,ID:integer;
   Summ:Double;
   Weight: double;
   nac_summ: Double;
begin
     if MemRNS.RecordCount=0 then
     begin
        RN_SUMM.Value:=0;
        RN_WEIGHT.Value:=0;
        nac_summ:=0;
//        NDS.ReadOnly:=false;
//        PopupNDS.Items[0].Visible:=true;
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

               nac_summ:=nac_summ+
               (
               MemRNS.fieldbyname('TW_SUMM').asfloat - MemRNS.fieldbyname('TW_seb').asfloat*MemRNS.fieldbyname('TW_KOL').asfloat);

               MemRNS.next;
         end;
         MemRNS.First;
         for a:=1 to ID-1 do MemRNS.next;
         MemRNS.EnableControls;
         RN_SUMM.Value:=SUMM;
         RN_WEIGHT.Value:=WEIGHT;
         RN_NAC.Value:=nac_summ;
//         NDS.ReadOnly:=true;
//         PopupNDS.Items[0].Visible:=false;
     end;
end;

procedure TDoc_RN.BTN_KLNClick(Sender: TObject);
var pers:integer;
begin
     DicKlnSet:=2; {Выбор клиента}
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=KLN_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN_ID then begin
        KLN_ID:=DIC_KLIENT.tag;
        Change_FrmKln(KLN_ID,2);
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
       RN_OSN.setfocus;
     Except
     End;
end;


procedure TDoc_RN.Btn_ApplyClick(Sender: TObject);
var
   A,RN_ID,ID,OLDID:integer;
   IDR:double;
   MET:boolean;
   r:double;
       maxPercent: double;


//   pn_id: integer;
   RN_IS_OPT: integer;


begin

// pn_id:=0;
 RN_IS_OPT:=-1;

 checkDiscont := false;
 if (MemRNS.State in [dsInsert,DsEdit]) then MemRNS.Post;

  if FRM.value='' then
  begin
   Messbox('Не указана фирма!',  MessError, MB_OK);
   exit;
  end;

  if KLN_ID=0 then
  begin
   Messbox('Не указан клиент!',  MessError, MB_OK);
   exit;
  end;
  maxPercent:=0;
if DicShopRvid.FieldByName('RVID_SUBKLN').asinteger=1 then maxPercent:=6; //по платежным картам банков максимальная скидка не более 6%. данную скидку не контролировать

   if (RNTYP[self.Statusbar1.Tag].ID <> 160010005) then        //в журнале внутренних продаж - любая скидка
          if CheckTWPrice(memRNS, kln_ktg_id, maxPercent)<0 then
             exit;




  //проверить, что выбранная фирма является фирмой-владельцем на складе
  if ((skl_frm > 0) and (skl_frm <> strtoint(frm.Value))) then
  begin
    Messbox('Выбранная фирма не может торговать с указанного склада!',  MessError, MB_OK);
    exit;
  end;


  if ((RNTYP[self.Statusbar1.Tag].ID = 160010005) and (sklad_razgr_id = 0)) then
  begin
    Messbox('Не указан склад разгрузки',  MessError, MB_OK);
    exit;
  end;


 {Сохраняем расходную (Apply)}
 {Проверяем обоснование скидки на сумму}





 if strtoint('0'+skl.value) = 0 then  Messbox('Не указан склад!',MessSystem,48) else

 if ((RN_RNVID.Value='') or (RVID.value='')) then
  Messbox('Не указан вид расходной накладной!',MessSystem,48)
 else
    begin
      begin
{      if (RN_SKID.value>0) and (length(RN_SKID_TXT.text)=0) and (not RN_PROW) then begin
         try
           RN_SKID_TXT.setfocus;
         Except
         End;
         Messbox('Скидка на сумму накладной должна быть обоснована!',MessSystem,48);
      end
      else
}
      begin
        {Проверяем обоснование скидок на товары}
        OLDID:=MemRNS.recno;
        MemRNS.DisableControls;
        MET:=FALSE;
        if not RN_PROW then begin
          MemRNS.First;
          while not MemRNS.eof do begin
                if (MemRNS.fieldByname('TW_SKID').asfloat>0) and (length(MemRNS.fieldByname('SKID_TXT').asstring)=0) then MET:=TRUE;
                MemRNS.next;
          end;
        end;
        if MET then begin
            PageControl1.ActivePage:=Tabsheet2;
            Messbox('Все скидки на товары должны быть обоснованными!',MessSystem,48);
        end else begin
         Datamodule1.IBTransaction2.Active:=False;
         Datamodule1.IBTransaction2.StartTransaction;
         Try
           Statusbar1.panels[2].text:='Фаза 1...';
           if not RN_PROW then begin
              IBSAVE_CLEAR;

              { 23-02-2015 - создание прихода на основании расхода в журнале 22020 (внутренняя продажа). журнал прихода - 9

              }


              if (RNTYP[self.Statusbar1.Tag].ID = 160010005) then
              if ((self.tag = -1)) then //новый документ в журнале внутренних расходов
              begin
                // if (RNTYP[self.Statusbar1.Tag].ID = 160010005) then
                 begin
                        DataModule1.IbSaveSQL.Close;
                        DataModule1.IbSaveSQL.SQL.clear;
                        DataModule1.IbSaveSQL.SQL.add('select new_doc_id from create_new_pn$_hat(0, :skl_id, :shop_id, ''Внутреннее перемещение'', :frm_id, :post_id, :us_id)');
                        DataModule1.IbSaveSQL.ParamByName('skl_id').asInteger:=strtoint('0'+skl.value);
                        DataModule1.IbSaveSQL.ParamByName('shop_id').asInteger:=SHOP_ID;
                        DataModule1.IbSaveSQL.ParamByName('frm_id').asInteger:=KLN_ID;
                        DataModule1.IbSaveSQL.ParamByName('post_id').asInteger:=strtoint(FRM.value);
                        DataModule1.IbSaveSQL.ParamByName('us_id').asInteger:=USERID;
                        DataModule1.IbSaveSQL.Open;
                        pn_id:=DataModule1.IbSaveSQL.fieldByName('new_doc_id').asInteger;
                        DataModule1.IbSaveSQL.Close;
                        DataModule1.IbSaveSQL.SQL.clear;




//                        DataModule1.IbSaveSQL.Transaction.Commit;



                 end;
              end;

              if (RNTYP[self.Statusbar1.Tag].ID = 160010005) then
              begin

                DataModule1.IbSaveSQL.SQL.Text:='update pn$ set pntyp_id = 9, pn$_owner=:pn_owner, skl_id=:skl_id where pn$_id = :pn_id';
                DataModule1.IbSaveSQL.ParamByName('pn_id').asInteger:=pn_id;
                DataModule1.IbSaveSQL.ParamByName('pn_owner').asInteger:=manager_id;
                DataModule1.IbSaveSQL.ParamByName('skl_id').asInteger:=sklad_razgr_id;
                DataModule1.IbSaveSQL.ExecSQL;
                DataModule1.IbSaveSQL.Close;
                DataModule1.IbSaveSQL.SQL.clear;

              end;                               

              IBSAVE_CLEAR;
              IBSAVE_ADD('PN$_ID',pn_id);


              if self.chkINTERNET_MAGAZ.Checked then
                SHOP_ID:=13;

              Statusbar1.panels[2].text:='Фаза 2...';
              if RN_NUMS<0 then RN_NUMS:=NEW_RN_NUM(RNTYP[self.Statusbar1.Tag].ID, strtoint('0'+frm.value), RN_DATE.date);
              Statusbar1.panels[2].text:='Фаза 3...';
              IBSAVE_ADD('RN_NUM',RN_NUMS);
              IBSAVE_ADD('RN_PROW',false);


              IBSAVE_ADD('RNTYP_ID',RNTYP[self.Statusbar1.Tag].ID);
              IBSAVE_ADD('RNVID_ID',strtoint('0'+RN_RNVID.value));
              IBSAVE_ADD('SKL_ID',strtoint('0'+skl.value));
              IBSAVE_ADD('RN_DATE',strtodatetime(datetostr(RN_DATE.date)+' '+timetostr(time())));
              IBSAVE_ADD('RN_SKID',RN_SKID.value);
              IBSAVE_ADD('RN_SKID_TXT',RN_SKID_TXT.text);
              IBSAVE_ADD('RN_KURS',RN_KURS.value);
              IBSAVE_ADD('SHOP_ID',SHOP_ID);
              IBSAVE_ADD('RN_OSN',Memotostr(RN_OSN.lines));
              IBSAVE_ADD('RN_WHO',RN_WHO.text);
              IBSAVE_ADD('RN_GP',RN_GP.text);
              IBSAVE_ADD('KLN_ID',KLN_ID);
              IBSAVE_ADD('US_ID',USERID);
              IBSAVE_ADD('FRM_ID',strtoint(FRM.value));
              IBSAVE_ADD('NDS',NDS.value);
              IBSAVE_ADD('NP',NP.value);
              IBSAVE_ADD('RN_DOST',RN_DOST.checked);
              if RN_DOST.checked then IBSAVE_ADD('DOST_DATE',DOST_DATE.date);
              IBSAVE_ADD('RN_KKM',RN_KKM);
              IBSAVE_ADD('VALUTA_ID',RN_VALUTA.value);
              IBSAVE_ADD('CARD_ID',DISKONT_ID);
              IBSAVE_ADD('RVID_ID',strtoint('0'+RVID.value));
              if cbDirectPost.Checked then
                IBSAVE_ADD('DIRECT_POST',1)
              else
                IBSAVE_ADD('DIRECT_POST',0);

              if RN_PAYMENT.Checked then
                IBSAVE_ADD('RN_PAYMENT',1)
              else
                IBSAVE_ADD('RN_PAYMENT',0);

              IBSAVE_ADD('PAYMENT_DETAIL', PAYMENT_DETAIL.Text);






              if RVIDKLN.Visible then IBSAVE_ADD('RVID_KLN',strtoint('0'+rvidkln.value));
              Statusbar1.panels[2].text:='Фаза 4...';
              RN_ID:=IBSAVE_DOC('RN',self.tag);
              Statusbar1.panels[2].text:='Фаза 5...';
           end else RN_ID:=self.tag;
           if RN_ID<=0 then IDR:=SQRT(-1)
            else
           begin
                 Statusbar1.panels[2].text:='Фаза 61...';
                 // Фиксируем удаление товаров
                 for A:=1 to CNT_DEL do begin
                   IBSAVE_CLEAR;
                   IBSAVE_ADD('DOC','RN');
                   IBSAVE_ADD('US_ID',USERID);
                   IBSAVE_ADD('SHOP_ID',SHOPID);
                   IBSAVE_ADD('MESS',RNS_DEL_MESS[a]);
                   IBSAVE_ADD('DOP1',4);
                   IBSAVE_ADD('DOP2',RN_ID);
                   if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                   // Удаления отгрузки
                   if RNS_DEL_OTG[a]>0 then begin
                     IBSAVE_CLEAR;
                     IBSAVE_ADD('DOC','TWRN');
                     IBSAVE_ADD('US_ID',USERID);
                     IBSAVE_ADD('SHOP_ID',SHOPID);
                     IBSAVE_ADD('MESS',RNS_DEL_MESS2[a]);
                     IBSAVE_ADD('DOP1',self.tag);
                     IBSAVE_ADD('DOP2',-RNS_DEL_TW[a]);
                     if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                   end;
                 end;
                 Statusbar1.panels[2].text:='Фаза 6...';
                 {Сохраняем содержимое}
                 {Сначала удаляем удалённое}
                 for A:=1 to CNT_DEL do begin
                     if RNS_DEL[A]>0 then if not IBDELETE_DOC('RNS',RNS_DEL[A]) then IDR:=SQRT(-1);
                 end;
                 {Сохраняем имеющееся}
                 MemRNS.First;
                 while not MemRNS.eof do begin



                       {23-02-2015 - перед сохранением во внутреннем расходе проверить все товары на наличие пары

                       }
                       if (RNTYP[self.Statusbar1.Tag].ID = 160010005) then
                       begin
                                IbQuery1.SQL.Text:='select * from CHECK_RN_TW_PAIRS(:tw_id, :RN_IS_OPT)';
                                ibquery1.ParamByName('tw_id').asinteger:=MemRNS.fieldbyname('TW_ID').asinteger;
                                ibquery1.ParamByName('RN_IS_OPT').asinteger:=RN_IS_OPT;
                                ibquery1.Open;
                                if (ibquery1.fieldbyname('RES').asinteger<0) then
                                begin
                                        Messbox(ibquery1.fieldbyname('RES_DESCR').asString ,MessSystem,48);
                                        r:=sqrt(-1);
                                end;
                                RN_IS_OPT:=ibquery1.fieldbyname('IS_OPT').asinteger;

                       end;


                       IBSAVE_CLEAR;
                       IBSAVE_ADD('RN_ID',RN_ID);
                       IBSAVE_ADD('RNS_TABEL',MemRNS.fieldbyname('RNS_TABEL').asinteger);
                       IBSAVE_ADD('TW_ID',MemRNS.fieldbyname('TW_ID').asinteger);
                       IBSAVE_ADD('TW_KOL',MemRNS.fieldbyname('TW_KOL').asfloat);



                       IBSAVE_ADD('TW_MONEY',OKRUG(MemRNS.fieldbyname('TW_MONEY').asfloat,2));
                       IBSAVE_ADD('TW_SKID',MemRNS.fieldbyname('TW_SKID').asfloat);
                       IBSAVE_ADD('TW_SKIDDOLL',MemRNS.fieldbyname('TW_SKIDDOLL').asfloat);
                       IBSAVE_ADD('TW_MONEY2',OKRUG(MemRNS.fieldbyname('TW_MONEY').asfloat,2));
                       IBSAVE_ADD('TYP_MONEY2',0);
                       if MemRNS.fieldbyname('RNS_ID').asinteger<0 then begin
                          IBSAVE_ADD('OTG_US',0);
                          IBSAVE_ADD('OTG_DATE',NOW());
                          if (
                          (
                          (strtoint(SKL.Value)=DEFAULT_SKLAD)
                           and (SHOP_ID=14)
                           and (RNTYP[self.Statusbar1.Tag].ID=1)
                           and not (RN_DOST.Checked)
                           ) or (  (RNTYP[self.Statusbar1.Tag].ID = 160010005)) and (strtoint(SKL.Value)=25) and (sklad_razgr_id=25) )  then
                                IBSAVE_ADD('OTG_KOL',MemRNS.fieldbyname('TW_KOL').asfloat)
                          else
                                  IBSAVE_ADD('OTG_KOL',0);
                       end;


                       IBSAVE_ADD('SKID_TXT',MemRNS.fieldbyname('SKID_TXT').asstring);
                       ID:=IBSAVE_DOC('RNS',MemRNS.fieldbyname('RNS_ID').asinteger);
                       if ID<0 then IDR:=SQRT(-1) else begin
                          if (self.tag>0) and (MemRNS.fieldbyname('RNS_ID').asinteger<0) then begin
                              // Фиксируем факт добавления товара
                              IBSAVE_CLEAR;
                              IBSAVE_ADD('DOC','RN');
                              IBSAVE_ADD('US_ID',USERID);
                              IBSAVE_ADD('SHOP_ID',SHOPID);
                              IBSAVE_ADD('MESS','Добавлен товар: '+MemRNS.Fieldbyname('TW_ART').asstring+' '+
                              MemRNS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemRNS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
                              MemRNS.Fieldbyname('ED_SHORT').asstring+' по цене '+floattostrf(MemRNS.Fieldbyname('TW_OKMONEY').asfloat,fffixed,19,2));
                              IBSAVE_ADD('DOP1',2);
                              IBSAVE_ADD('DOP2',RN_ID);
                              if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                          end;
                          MemRNS.Edit;
                          MemRNS.fieldbyname('RNS_ID').asinteger:=ID;
                          MemRNS.Post;
                       end;
                       MemRNS.next;
                 end;
           end;

            {Всё прошло нормально - изменяем временные данные}
            {Отображаем номер}
            self.tag:=RN_ID;
            RN_NUM.text:=inttostr(RN_NUMS);
            MemRNS.First;
            while not MemRNS.eof do begin
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
         Except
            Datamodule1.IBTransaction2.Rollback;
         End;
         Datamodule1.IBTransaction2.Active:=False;
        end;
        MemRNS.First;
        for a:=1 to OLDID-1 do MemRNS.next;
      end;
    MemRNS.EnableControls;
    Statusbar1.panels[2].text:='';
    end;
 end;

 checkDiscont := true;
end;

procedure TDoc_RN.Btn_SAVEClick(Sender: TObject);
begin
     SAVE:=false;
     Btn_Apply.Click;
     if SAVE then begin
        if not RN_PROW then if Btn_prow.enabled then Btn_prow.click;
        Close;
     end;
end;

procedure TDoc_RN.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save) and (Btn_Apply.enabled) then begin
        if Messbox(MessChange,MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDoc_RN.DsRNSDataChange(Sender: TObject; Field: TField);
begin
     if ((memRNS.State in [dsEdit]) and (field<>nil))  and (Field.FieldName = 'TW_KOL') then
     begin
     if CHECK_DOSTUP('$EDIT.SAVEDISCONT')=false then
     begin
      if (rn_skid.Value > 0) then
       begin
        if not (Messbox('При изменении накладной дисконт будет аннулирован.'+#13+#10+'Продолжить?',MessSubmit,4+48+256)=6)
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
     if (MemRNS.State in [dsInsert]) and ( not CanInsert) then MemRNS.Cancel;

end;

procedure TDoc_RN.Btn_DelTowClick(Sender: TObject);
 var
     RN_NUM_FULL:ansistring;
begin
     if Messbox('Удалить из накладной товар "'+MemRNS.Fieldbyname('TW_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        if MemRNS.Fieldbyname('RNS_ID').asinteger>0 then begin
          WorkTransaction.Active:=False;
          ADD_SQL(QueryWork,'select KLN.KLN_PREFIX,SHOP.SHOP_PREFIX,SHOP.SHOP_POSTFIX,RNTYP.RNTYP_SHORT, '+
          'RN.RN_NUM from RN,SHOP,KLN,RNTYP where RN.RN_ID=:RN_ID '+
          'and RN.FRM_ID=KLN.KLN_ID and RN.RNTYP_ID=RNTYP.RNTYP_ID '+
          'and RN.SHOP_ID=SHOP.SHOP_ID ');
          QueryWork.paramByname('RN_ID').asinteger:=self.tag;
          QueryWork.open;
          if not QueryWork.eof then
            RN_NUM_FULL:=QueryWork.fieldByname('KLN_PREFIX').asstring+' '+
            QueryWork.fieldByname('SHOP_PREFIX').asstring+QueryWork.fieldByname('RNTYP_SHORT').asstring+
            b_utils.right('0000000000'+inttostr(RN_NUMS),10)+QueryWork.fieldByname('SHOP_POSTFIX').asstring;
          inc(CNT_DEL);
          RNS_DEL[CNT_DEL]:=MemRNS.Fieldbyname('RNS_ID').asinteger;
          RNS_DEL_OTG[CNT_DEL]:=MemRNS.Fieldbyname('OTG_KOL').asinteger;
          RNS_DEL_TW[CNT_DEL]:=MemRNS.Fieldbyname('TW_ID').asinteger;
          RNS_DEL_MESS[CNT_DEL]:=RN_NUM_FULL+' Удален товар: '+MemRNS.Fieldbyname('TW_ART').asstring+' '+
          MemRNS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemRNS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
          MemRNS.Fieldbyname('ED_SHORT').asstring+' по цене '+floattostrf(MemRNS.Fieldbyname('TW_OKMONEY').asfloat,fffixed,19,2);
          RNS_DEL_MESS2[CNT_DEL]:=RN_NUM_FULL+' Из накладной удален товар с отгрузкой '+floattostrf(MemRNS.Fieldbyname('OTG_KOL').asfloat,fffixed,19,3)+' '+
          MemRNS.Fieldbyname('ED_SHORT').asstring;
        end;
        SAVE:=False;
        MemRNS.delete;
        Refresh_summ;
        Show_Sost;
     end;
end;

procedure TDoc_RN.Btn_DetalClick(Sender: TObject);
begin
       Application.createform(TDETAL_TW,DETAL_TW);
       DETAL_TW.tag:=MemRNS.fieldbyname('TW_ID').asinteger;
       DETAL_TW.showmodal;
       DETAL_TW.destroy;
end;

procedure TDoc_RN.FormKeyDown(Sender: TObject; var Key: Word;
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

function TDoc_RN.Get_napr_kln(TW_ID:integer): integer;
var kateg:integer;
begin
       Add_SQL(QueryWork,'select kln_napr.twgroup_id, kln_napr.skid_kat as skid '+
                       'from kln_napr, tw, twtree '+
                       'where kln_napr.kln_id=:kln_id and tw.tw_id=:tw_id '+
                        'and tw.twtree_id=twtree.twtree_id '+
                        'and kln_napr.typ_kln in (:typ, 0) '+
                        'and twtree.parents_ids containing ''%''||kln_napr.twgroup_id||''%''');
       QueryWork.ParamByName('kln_id').asinteger:=KLN_ID;
       QueryWork.ParamByName('typ').asinteger:=real_typ;
       QueryWork.ParamByName('tw_id').asinteger:=TW_ID;
       QueryWork.Open;
       if QueryWork.IsEmpty then
       begin
         kateg:=kln_ktg_id;
         MemRNS.FieldByName('napr').asinteger:=0;
         MemRNS.FieldByName('ktg').asinteger:=kln_ktg_id;
       end
       else
       begin
         kateg:=0;
         while not QueryWork.Eof do
         begin
           if kateg<QueryWork.FieldByName('skid').asinteger then
           begin
             kateg:=QueryWork.FieldByName('skid').asinteger;
             MemRNS.FieldByName('ktg').asinteger:=kateg;
           end;
           QueryWork.Next;
         end;
         MemRNS.FieldByName('napr').asinteger:=1;
       end;
  result:=kateg;
end;

procedure TDoc_RN.ADD_RNS(TW_ID:integer;KOL:double);
var
   TW_TEMP,kateg,pers:integer;
   TW_STR:ansistring;
   ISS:boolean;
   VALUTA_ID:integer;
   KURS1,KURS2:double;
   nds_error: boolean;
   fq: FastQuery;
   bNoSkid: boolean;
   klnKtgName: string;
   rozn_money, zak_money: double;
   y,m,d: word;
   h, mm, s, mils: word;
begin
    begin
    nds_error := false;
     TW_TEMP:=0;
     //проверяем нет ли дисконта
     if rn_skid.Value > 0 then
     begin
      decodeDate(date, y, m, d);
      decodetime(time, h, mm,s, mils);
      if (h=29) or (DayofWeek(Date()) = 1) or ((m = 3) and (d = 8)) or ((m = 2) and (d = 23)) or ((m = 5) and (d = 9)) or ((m = 6) and (d = 12)) or ((m = 1) and (d = 2)) or ((m = 1) and (d = 7))  and (DISKONT_NUM='70045605') then        //начало недели - воскресенье
        begin
        end
        else
        begin
             	if not (Messbox('При изменении накладной дисконт будет аннулирован.'+#13+#10+'Продолжить?',MessSubmit,4+48+256)=6) then exit;
             	btn_nodiscont.Click;
        end;

     end;
     {Проверяем, нет ли в накладной уже такого товара}
     if MemRNS.RecordCount>0 then TW_TEMP:=MemRNS.fieldByname('TW_ID').asinteger;
     ISS:=false;
     MemRNS.Disablecontrols;
     MemRNS.first;
     while (not MemRNS.eof) and (not ISS) do begin
           if MemRNS.fieldByname('TW_ID').asinteger=TW_ID then begin
              ISS:=true;
              TW_STR:=MemRNS.fieldByname('TW_ART').asstring+'-'+MemRNS.fieldByname('TW_NAM').asstring;
           end;
           MemRNS.next;
     end;
     MemRNS.EnableControls;
     if ISS then Messbox('Накладная уже содержит товар '+TW_STR+' и он не может быть добавлен!',MessSystem,48) else
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
          ADD_SQL(IbQuery1,'select * from tw,ed,twktg '+
          'where tw.twktg_id=twktg.twktg_id and tw.ed_id=ed.ed_id and tw.tw_id= :TW_ID');
          IbQuery1.Parambyname('TW_ID').asinteger:=TW_ID;
          IbQuery2.Parambyname('TW_ID').asinteger:=TW_ID;
          IbQuery2.Parambyname('SHOP_ID').asinteger:=SHOPID;
//          IbQuery2.Parambyname('price_typ').asinteger:=kln_ktg_id;


          IbQuery1.Open;
          IbQuery2.Open;

          DataModule1.MainDicRnTyp.Locate('RNTYP_ID',self.ToolBar1.Tag,[]);
          // НДС всегда выделяется!
//Игорь Сторожев 10.04.2004 для НДС=10%
          if  (IbQuery1.Fieldbyname('TW_NDS_SMALL').asstring='1')
                and  (NDS.Value <> NDS_SMALL_DATE(RN_DATE.Date))  then nds_error:=true;
          if  (IbQuery1.Fieldbyname('TW_NDS_SMALL').asstring<>'1')
                and  (NDS.Value <> NDS_DATE(RN_DATE.Date))  then nds_error:=true;
          if (DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger=1)
          and (nds_error) then Messbox('НДС товара не соответствует НДС накладной и он не может быть добавлен!',MessSystem,48)

      else

      begin


          CanInsert:=True;
          MemRNS.Append;
//******************
  {     Add_SQL(QueryWork,'select kln_napr.twgroup_id, kln_napr.skid_kat as skid '+
                       'from kln_napr, tw, twtree '+
                       'where kln_napr.kln_id=:kln_id and tw.tw_id=:tw_id '+
                        'and tw.twtree_id=twtree.twtree_id '+
                        'and kln_napr.typ_kln in (:typ, 0) '+
                        'and twtree.parents_ids containing ''%''||kln_napr.twgroup_id||''%''');
       QueryWork.ParamByName('kln_id').asinteger:=KLN_ID;
       QueryWork.ParamByName('typ').asinteger:=real_typ;
       QueryWork.ParamByName('tw_id').asinteger:=TW_ID;
       QueryWork.Open;
       if QueryWork.IsEmpty then
       begin
         kateg:=kln_ktg_id;
         MemRNS.FieldByName('napr').asinteger:=0;
         MemRNS.FieldByName('ktg').asinteger:=kln_ktg_id;
       end
       else
       begin
         kateg:=0;
         while not QueryWork.Eof do
         begin
           if kateg<QueryWork.FieldByName('skid').asinteger then
           begin
             kateg:=QueryWork.FieldByName('skid').asinteger;
             MemRNS.FieldByName('ktg').asinteger:=kateg;
           end;
           QueryWork.Next;
         end;
         MemRNS.FieldByName('napr').asinteger:=1;
       end;   }
//******************
          Kateg:=Get_napr_kln(TW_ID);

          if (RNTYP[self.Statusbar1.Tag].ID = 160010005) then
          begin
                if (skl.Value = '29') then
                        kateg := 8;
                if (skl.Value = '25') then
                        kateg := 7;
          end;



          MemRNS.Fieldbyname('RNS_ID').asinteger:=-1;
          MemRNS.Fieldbyname('TW_ID').asinteger:=TW_ID;
          MemRNS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TWKTG_COLOR').asinteger;
          MemRNS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
          MemRNS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
          MemRNS.Fieldbyname('TW_SHORT_NAM').asstring:=IbQuery1.Fieldbyname('TW_SHORT_NAM').asstring;
          MemRNS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
          MemRNS.Fieldbyname('TW_MONEY').asfloat:=IbQuery2.Fieldbyname('MONEY').asfloat;
	        MemRNS.Fieldbyname('TW_WEIGHT').asfloat:=IbQuery1.Fieldbyname('TW_WEIGHT').asfloat;
          MemRNS.Fieldbyname('MET_MONEY_SHOP').asstring:=IbQuery2.Fieldbyname('MET_MONEY_SHOP').asstring;
          MemRNS.Fieldbyname('TW_NEGABARIT').asstring:=IbQuery1.Fieldbyname('TW_NEGABARIT').asstring;

          MemRNS.Fieldbyname('TW_SEB').asfloat:=GetTWKtgPrice(TW_ID, 5);


//********
{          Add_SQL(QueryWork,'select valuestr from propkln where kln_id=:kln_id and propkln.typ=:typ');
          QueryWork.ParamByName('kln_id').asinteger:=KLN_ID;
          case real_typ of
            1: QueryWork.ParamByName('typ').asinteger:=12;
            2: QueryWork.ParamByName('typ').asinteger:=7;
          end;
          QueryWork.Open; }

          if ((MemRNS.Fieldbyname('napr').asfloat=1) or (MemRNS.FieldByName('tw_noskid').asinteger=1)) then
            pers:=0
          else
            pers:=pers_skid;       //strtoint(QueryWork.fieldbyname('valuestr').asstring);
//          QueryWork.Close;
          MemRNS.Fieldbyname('TW_SKID').asfloat:= ((IbQuery2.Fieldbyname('MONEY').asfloat- GetTWKtgPrice(TW_ID,kateg {kln_ktg_id}))*100/IbQuery2.Fieldbyname('MONEY').asfloat)+pers;
          if ((MemRNS.Fieldbyname('TW_SKID').asfloat < 1e-4) and (MemRNS.Fieldbyname('TW_SKID').asfloat> 0)) then
            MemRNS.Fieldbyname('TW_SKID').asfloat:=0;


          {igor 06-03-2014- для работы 3% дисконта в выходные}
          if memRNS.FieldByName('tW_noskid').asinteger=1 then
           begin

            MemRNS.fieldbyname('TW_SKID').asfloat:=-RN_skid.Value;
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

            ///20-05-2015 - во внутреннем журнале продажи ниже спеццены
            if (RNTYP[self.Statusbar1.Tag].ID = 160010005) then
                zak_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 5)
            else
                zak_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 3);



            //Если итоговая цена ниже закупки, но при этом товар не распродажный, сделать цену закупочной
            if zak_money<=rozn_money then
            begin
              if MemRNS.fieldbyname('TW_OKMONEY').asfloat<zak_money then
              begin
///10-08-2015 - была ошибка - неверно выставлялась скидка
                MemRNS.fieldbyname('TW_SKID').asfloat:=(MemRNS.Fieldbyname('TW_MONEY').asfloat- zak_money)*100/MemRNS.Fieldbyname('TW_MONEY').asfloat;;
                MemRNS.fieldbyname('SKID_TXT').asstring:='Слишком большая скидка. Цена увеличена до спеццены';

              end;
            end
            else  //товар распродажный, заместить скидку на минус
            begin

                MemRNS.fieldbyname('TW_SKID').asfloat:=-rn_skid.Value;
                MemRNS.fieldbyname('SKID_TXT').asstring:='Скидки по дисконту не действуют на уцененный товар';

            end;

          end;
          {///igor 06-03-2014- для работы 3% дисконта в выходные}





//********
          MemRNS.Fieldbyname('TW_SKID_LOAD').asfloat:=MemRNS.Fieldbyname('TW_SKID').asfloat;
//          MemRNS.Fieldbyname('TW_SKID').asfloat:=0;

//***************
    klnktgname:='';
    if kln_ktg_id=1 then klnKtgName:='Оптовый клиент';
    if kln_ktg_id=2 then klnKtgName:='Крупно-оптовый клиент';
    if kln_ktg_id=3 then klnKtgName:='Спец клиент';

    MemRNS.FieldByName('skid_txt').asstring:=klnktgname;

    if (MemRNS.Fieldbyname('napr').asfloat=1) then
      MemRNS.Fieldbyname('SKID_TXT').asstring:='Направление клиента';
    if(pers<>0) and (MemRNS.Fieldbyname('napr').asfloat=0) then
      MemRNS.Fieldbyname('SKID_TXT').asstring:=MemRNS.Fieldbyname('SKID_TXT').asstring+' перс.скидка';
//***************

          MemRNS.Fieldbyname('OTG_KOL').asfloat:=0;
          MemRNS.Fieldbyname('RNS_TABEL').asinteger:=trunc(TABEL.value);
          MemRNS.Fieldbyname('TW_SKIDDOLL').asfloat:=0;


          ADD_SQL(IBQuery3, 'select valueint from proptw where tw_id=:tw_id and proptwtyp_id=6 and frm_id = :FRM_ID');
          IBQuery3.ParamByName('TW_ID').asinteger:=TW_ID;
          IBQuery3.ParamByName('FRM_ID').asinteger:=GL_FRM_WORK_MODE;
          IBQuery3.Open;
          if ibquery3.Eof then
            MemRNS.Fieldbyname('TW_NOSKID').asinteger:=0
          else
            MemRNS.Fieldbyname('TW_NOSKID').asinteger:=IBQuery3.fieldByName('VALUEINT').asinteger;
          IBQuery3.Close;

          //MemRNS.Fieldbyname('TW_NOSKID').asinteger:=IbQuery1.Fieldbyname('TW_NOSKID').asinteger;

          if bNoskid=true then
            MemRNS.Fieldbyname('TW_NOSKID').asinteger:=1;

          if IbQuery1.Fieldbyname('VALUTA_ID').asinteger=0 then
           MemRNS.Fieldbyname('TW_SKIDDOLL').asfloat:=0 else begin
           {Определяем скидку курса}
           VALUTA_ID:=IbQuery1.Fieldbyname('VALUTA_ID').asinteger;
           KURS1:=DEFAULT_KURS(VALUTA_ID,-self.ToolBar1.Tag); {Курс расходной накладной}
           KURS2:=DEFAULT_KURS(VALUTA_ID,0); {Курс ценообразования}
           MemRNS.Fieldbyname('TW_SKIDDOLL').asfloat:=(Kurs2-kurs1)/(Kurs2/100);
          end;

          MemRNS.fieldByname('OST').asfloat:=twost(MemRNS.fieldByname('TW_ID').asinteger);

          if KOL<0 then begin
             Application.createForm(TSET_KOLVO,SET_KOLVO);
             SET_KOLVO.NAME.text:=IbQuery1.fieldByname('TW_ART').asstring+
                            IbQuery1.fieldByname('TW_NAM').asstring;
             SET_KOLVO.showModal;
             if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
             MemRNS.Fieldbyname('TW_KOL').asfloat:=SET_KOLVO.KOL.value;
             SET_KOLVO.destroy;
          end else MemRNS.Fieldbyname('TW_KOL').asfloat:=KOL;
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

procedure TDoc_RN.Btn_PrintClick(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        PRINT_RN(self.tag, not cbSkidNoPrint.Checked);
       if (RN_DOST.checked=true) then
         PRINT_RN(self.tag)
{       else
       begin
        if(RN_summ.Value>0) then
          PRINT_RN_T12(self.tag,1)
        else
         PRINT_RN_T12(self.tag,2);
       end;
}       
end;

procedure TDoc_RN.Btn_SubdocClick(Sender: TObject);
begin
     if Not Save and Btn_Apply.enabled then Btn_Apply.click;
     {Создаём документ на основании имеющегося...}
     SUBDOC(3,self.tag);
end;

procedure TDoc_RN.Btn_PropertisClick(Sender: TObject);
begin
     {Отображаем "историю" приходной накладной}
     SHOW_HISTORY_DOC(RNTYP[self.Statusbar1.Tag].FULL+' № '+RN_NUM.text,'RN',self.tag);
end;

procedure TDoc_RN.Btn_DicTowClick(Sender: TObject);
var
   a:integer;
begin
     if strtoint('0'+skl.value)<>0 then SELECT_SKLAD:=strtoint('0'+skl.value);
     DicTowarSet:=1; {Ввод товаров из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.Treeview1.Tag:=strtoint('0'+skl.value);
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
        for a:=1 to CNT_TW do begin
            ADD_RNS(ARR_TW[a].ID,ARR_TW[a].KOL);
        end;
     end;
     Refresh_summ;
     Show_sost;
end;

procedure TDoc_RN.Btn_FindTowClick(Sender: TObject);
begin
     {}
end;

procedure TDoc_RN.Btn_AnalizClick(Sender: TObject);
begin
     Application.createForm(TANALIZ_TW,ANALIZ_TW);
     ANALIZ_TW.tag:=MemRNS.fieldbyname('TW_ID').asinteger;
     ANALIZ_TW.ShowModal;
     ANALIZ_TW.Destroy;
end;

procedure TDoc_RN.Btn_MarketingClick(Sender: TObject);
begin
     SHOW_MARKETING_TW(MemRNS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_RN.Btn_PrintCennClick(Sender: TObject);
begin
     CLEAR_CENNIK;
      ADD_CENNIK(MemRNS.fieldbyname('TW_ID').asinteger,strtoint('0'+skl.value));
     PRINT_CENNIK;
end;

procedure TDoc_RN.Btn_PrintCennMoreClick(Sender: TObject);
var
   a,ID:integer;
begin
     CLEAR_CENNIK;
     if MemRNS.RecordCount>0 then begin
         ID:=MemRNS.RecNo;
         MemRNS.DisableControls;
         MemRNS.First;
         while not MemRNS.eof do begin
               ADD_CENNIK(MemRNS.fieldbyname('TW_ID').asinteger,strtoint('0'+skl.value));
               MemRNS.next;
         end;
         MemRNS.First;
         for a:=1 to ID-1 do MemRNS.next;
         MemRNS.EnableControls;
         PRINT_CENNIK;
     end;
end;

procedure TDoc_RN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IS_EDIT_RN:=False;




end;

procedure TDoc_RN.MnSet_SkidClick(Sender: TObject);
begin
     application.createForm(TSET_SKID,SET_SKID);
//     SET_SKID.MONEY1.value:=OKRUG((MemRNS.fieldbyname('TW_MONEY').asfloat*(1-(MemRNS.fieldbyname('TW_SKIDDOLL').asfloat)/100)),2);
     GLOBAL_MON1:=(MemRNS.fieldbyname('TW_MONEY').asfloat*(1-(MemRNS.fieldbyname('TW_SKIDDOLL').asfloat)/100));
     SET_SKID.MONEY1.value:=(MemRNS.fieldbyname('TW_MONEY').asfloat*(1-(MemRNS.fieldbyname('TW_SKIDDOLL').asfloat)/100));
     SET_SKID.MONEY2.value:=(MemRNS.fieldbyname('TW_MONEY').asfloat*(1-(MemRNS.fieldbyname('TW_SKIDDOLL').asfloat)/100))*(1-(MemRNS.fieldbyname('TW_SKID').asfloat+RN_SKID.value)/100);
     SET_SKID.OSN.text:=MemRNS.fieldByname('SKID_TXT').asstring;
     SET_SKID.showModal;
     if SET_SKID.tag>0 then begin
        MemRNS.edit;
        MemRNS.fieldByname('TW_SKID').asfloat:=GLOBAL_SKID-RN_SKID.value;
        MemRNS.fieldByname('SKID_TXT').asstring:=SET_SKID.OSN.text;
        MemRNS.Post;
     end;
     SET_SKID.Destroy;
     Refresh_SUMM;
end;

procedure TDoc_RN.Btn_RefreshOstClick(Sender: TObject);
var
   a,ID:integer;
   Summ:Double;
   s:ansistring;

begin
  if not canRefresh then exit;

  if self.Visible then begin
     Refresh_Summ;
     s:=self.caption;
     self.caption:=self.caption+'. Чтение остатков товаров';
     if MemRNS.RecordCount>0 then begin
         ID:=MemRNS.RecNo;
         MemRNS.DisableControls;
         MemRNS.First;
         Summ:=0;


         while not MemRNS.eof do begin
               MemRNS.Edit;
           	   MemRNS.fieldByname('OST').asfloat:=GetOst(MemRNS.fieldByname('TW_ID').asinteger,strtoint('0'+SKL.value), strtoint(frm.value));
               MemRNS.Post;
               MemRNS.next;
         end;
         MemRNS.First;
         for a:=1 to ID-1 do MemRNS.next;
         MemRNS.EnableControls;
     end;
     self.caption:=s;
  end;
end;

procedure TDoc_RN.RN_SKIDChange(Sender: TObject);
begin
     SAVE:=False;
end;

procedure TDoc_RN.Btn_ProwClick(Sender: TObject);
begin
     if Not Save and Btn_Apply.enabled then Btn_Apply.click;
     Checkdiscont := false;
     if (SAVE) then begin
        if NOT RN_PROW then begin
          if PROV_RN(self.tag,'') then begin
                RN_PROW:=True;
                Show_Sost;
                Btn_RefreshOst.click;
                SAVE:=true;
          end;
        end;
     end;
     Checkdiscont := true;
end;

procedure TDoc_RN.Btn_UnprowClick(Sender: TObject);
begin


     if UNPROV_RN(self.tag,'') then begin
                Btn_RefreshOst.click;
                RN_PROW:=False;
                Show_Sost;
                SAVE:=True;
                SET_NDS_NP;
      end;
end;

procedure TDoc_RN.SKLChange(Sender: TObject);
begin
  save:=false;
  Btn_RefreshOstClick(nil);

  self.label_PN_MANAGER.Caption := 'На склад '+SKL.text;
  sklad_razgr_id:=strtoint(SKL.value);

  show_sost;
end;

procedure TDoc_RN.FormActivate(Sender: TObject);
begin
     PageControl1.ActivePage:=Tabsheet1;
     try
       RxDbGrid1.setfocus;
     Except
     End;
     if ((self.tag<0) and (tabel.Enabled)) then TABEL.setFocus;
end;

procedure TDoc_RN.MemRNSTW_SKIDChange(Sender: TField);
begin
     if not (MemRNS.state in [dsinsert]) then begin
        if
        MemRNS.fieldbyname('TW_SKID').asfloat<=0 then
        MemRNS.fieldbyname('SKID_TXT').asstring:='';
     end;
end;

procedure TDoc_RN.Btn_ALLSKIDClick(Sender: TObject);
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

procedure TDoc_RN.Btn_NODISCONTClick(Sender: TObject);
begin
     DISKONT_ID:=0;
     RN_DISKONT.text:='';
     DISKONT_ID:=0;
     RN_SKID.value:=0;
     RN_SKID_TXT.text:='';
     Refresh_Summ;
end;

procedure TDoc_RN.Btn_PrintKKMClick(Sender: TObject);
var
        a,i:integer;
        s:string;
        pog_summ:double;
        all_summ:double;
        cash_summ:double;
        skid_money: double;
//        check_file: textfile;
begin
   memRNs.Last;
   memrns.First;

   if memrns.RecordCount > 35 then
   begin
      Messbox('Покупок должно быть не более 35!',MessSYstem,48);
      exit;
   end;

   if not RN_PROW then
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



//      assignfile(check_file, 'print_check.txt');
//      rewrite(check_file);

//    RN_KKM_ID:=KKM_ID;
//    RN_KASSIR_ID := USERID;


   if rn_kassir_id <> 0 then
   begin
   	if MessBox('Чек по этой расходной накладной уже печатался. Вы уверены что хотите выбить чек снова?', MessSystem, MB_YESNO)=IDNO  then
    	exit;
   end;

   SAVE:= false;
   if QrListPo.RecordCount>0 then begin
      // Чек с предоплатами
      // 1. Пересчитываем сумму
      if (MemRNS.State in [dsInsert,DsEdit]) then MemRNS.Post;
      if Not Save and Btn_Apply.enabled then Btn_Apply.click;
      if not save and Btn_Apply.enabled then Exit;
      Btn_RefreshOst.click;
      all_summ:=rn_summ.value;
      // 2. Определяем сумму погашенных предоплат
      pog_summ:=0;
      QrListPo.first;
      while not QrListPo.eof do begin
            pog_summ:=pog_summ+QrListPo.fieldByname('PORN_SUMM').asfloat;
            QrListPo.next;
      end;
      QrListPo.first;
      // 2. выводим чек
      clear_cash;
      if pog_summ<all_summ then begin
         cash_summ:=all_summ-pog_summ;
         if Model_KKM=1 then begin
            add_cash('Доплата за товар',cash_summ,1,1, 'РН '+RN_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(self.tag)+']', strtoint(FRM.value));
            // товар добавили - формируем измененный подвал чека
            cnt_dop_elves:=0;

            MemRns.First;
            for a:=1 to i-1 do MemRns.next;
            MemRns.Enablecontrols;
            QrListPo.first;
         end;


         if Model_KKM=3 then begin
            add_cash('Доплата за товар',cash_summ,1,1, 'РН '+RN_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(self.tag)+']', strtoint(FRM.value));
            // товар добавили - формируем измененный подвал чека
            cnt_dop_elves:=0;
            MemRns.First;
            for a:=1 to i-1 do MemRns.next;
            MemRns.Enablecontrols;
            QrListPo.first;
         end;

         if Model_KKM=4 then begin	//Штрих-ФР-К
            add_cash('Доплата за товар',cash_summ,1,1, 'РН '+RN_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(self.tag)+']', strtoint(FRM.value));
            // товар добавили - формируем измененный подвал чека
            cnt_dop_elves:=0;
            MemRns.First;
            for a:=1 to i-1 do MemRns.next;
            MemRns.Enablecontrols;
            QrListPo.first;
//            FRShtrih.AddHeader(1, 'РН '+RN_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(self.tag)+']');
         end;




         if Model_KKM=2 then begin
            add_cash('Доплата за товар',cash_summ,1,1, 'РН '+RN_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(self.tag)+']', strtoint(FRM.value));
            // товар добавили - формируем измененный подвал чека
            cnt_dop_elves:=0;
            inc(cnt_dop_elves);
            arr_dop_elves[cnt_dop_elves]:='*******ИНФОРМАЦИЯ*******';
            inc(cnt_dop_elves);
            arr_dop_elves[cnt_dop_elves]:='  Погашены предоплаты:';
            QrListPo.first;
            while not QrListPo.eof do begin
                  inc(cnt_dop_elves);
                  arr_dop_elves[cnt_dop_elves]:=QrListPo.fieldByname('PO_FULL_NUM').asstring;
                  inc(cnt_dop_elves);
                  arr_dop_elves[cnt_dop_elves]:='от '+date_sokr(QrListPo.fieldByname('PO_DATE').asdatetime);
                  inc(cnt_dop_elves);
                  arr_dop_elves[cnt_dop_elves]:='сумма:'+b_utils.right(space(18)+floattostrf(QrListPo.fieldByname('PORN_SUMM').asfloat,fffixed,19,2)+'руб.',18);
                  QrListPo.next;
            end;
            // отсекаем предоплаты
            inc(cnt_dop_elves);
            arr_dop_elves[cnt_dop_elves]:='****ОПЛАЧЕНЫ ТОВАРЫ:****';
            // теперь добавляем товары
            MemRns.First;
            while not MemRns.eof do begin
                  // ЭЛВЕС ФР
                  s:='КОД:'+MemRns.fieldbyname('TW_ART').asstring;
                  if PRINT_KKM_TW_NAME=1 then
                     s:=b_utils.left(s+space(24),24)+MemRns.fieldbyname('TW_NAM').asstring+ ', ' + memrns.fieldbyname('ED_SHORT').asstring;
                  if PRINT_KKM_TW_NAME=2 then
                     s:=b_utils.left(s+space(24),24)+MemRns.fieldbyname('TW_SHORT_NAM').asstring+ ', ' + memrns.fieldbyname('ED_SHORT').asstring;

                  inc(cnt_dop_elves);
                  arr_dop_elves[cnt_dop_elves]:=s; // добавили наименование
                  // добавляем кол-во и единицы
                  inc(cnt_dop_elves);
                  arr_dop_elves[cnt_dop_elves]:=floattostrf(MemRns.fieldbyname('TW_KOL').asfloat,fffixed,19,2)+' '+
                  MemRns.fieldbyname('ED_SHORT').asstring+' по '+
                  floattostrf(MemRns.fieldbyname('TW_OKMONEY').asfloat,fffixed,19,2)+'р.';
                  MemRns.next;
            end;
            inc(cnt_dop_elves);
            arr_dop_elves[cnt_dop_elves]:='****КОНЕЦ ИНФОРМАЦИИ!***';
            inc(cnt_dop_elves);
            MemRns.First;
            for a:=1 to i-1 do MemRns.next;
            MemRns.Enablecontrols;
            QrListPo.first;
         end;
      end;
      // выводим печать
      Print_dop_Elves:=true;
      Application.createForm(TPRINT_KKM,PRINT_KKM);
      PRINT_KKM.MON1.value:=cash_summ;
      PRINT_KKM.MON2.value:=cash_summ;
      DataModule1.MainDicRnTyp.Locate('RNTYP_ID',self.ToolBar1.Tag,[]);
      PRINT_KKM.label3.tag:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger;	//если = 2 - выделяем НДС
      PRINT_KKM.label2.tag :=DicShopRvid.fieldbyname('RVID_SUBKLN').asinteger;		//если=1 - безналичный расчет

//      writeln(check_file, 'Общая сумма: '+ floattostr(cash_summ));
//      closefile(check_file);
      PRINT_KKM.showModal;
      PRINT_KKM.destroy;
      Print_dop_Elves:=false;
      // возвращаем подвал на место
   end else begin
   // Обычный чек
   if (MemRNS.State in [dsInsert,DsEdit]) then MemRNS.Post;
   if Not Save and Btn_Apply.enabled then Btn_Apply.click;
   if not save and Btn_Apply.enabled then Exit;

   Btn_RefreshOst.click;
   MemRns.disablecontrols;
   i:=MemRns.Recno;
   MemRns.First;
   clear_cash;
//   writeln(check_file, 'Начинаем обычный чек.');
//   writeln(check_file, 'Модель аппарата '+ inttostr(Model_KKM));
   while not MemRns.eof do begin
      if Model_KKM=1 then begin
        s:=MemRns.fieldbyname('TW_ART').asstring;
        if PRINT_KKM_TW_NAME>0 then begin
          s:=b_utils.left(s+' ',17)+MemRns.fieldbyname('TW_SHORT_NAM').asstring;
        end;
     end;
     if Model_KKM=3 then begin
        s:=MemRns.fieldbyname('TW_ART').asstring;
        if PRINT_KKM_TW_NAME>0 then begin
          s:=b_utils.left(s+' ',17)+MemRns.fieldbyname('TW_SHORT_NAM').asstring;
        end;
     end;
     if Model_KKM=4 then begin
        s:=MemRns.fieldbyname('TW_ART').asstring;
        if PRINT_KKM_TW_NAME=1 then
          s:=s+' '+MemRns.fieldbyname('TW_NAM').asstring;
        if PRINT_KKM_TW_NAME=2 then
          s:=s+' '+MemRns.fieldbyname('TW_SHORT_NAM').asstring;

        FRShtrih.DocName:='РН '+RN_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(self.tag)+']';
     end;
     if Model_KKM=2 then begin
       // ЭЛВЕС ФР
       s:='КОД:'+MemRns.fieldbyname('TW_ART').asstring;
       if PRINT_KKM_TW_NAME>0 then begin
         s:=b_utils.left(s+space(24),24)+MemRns.fieldbyname('TW_SHORT_NAM').asstring;
       end;
     end;
     if length(s)>252 then s:=b_utils.left(s,252);

     skid_money:=MemRns.fieldbyname('TW_MONEY').asfloat - MemRns.fieldbyname('TW_OKMONEY').asfloat;

     if (self.cbSkidNoPrint.Checked) then
        skid_money:=0;



     add_cash(s,MemRns.fieldbyname('TW_OKMONEY').asfloat,
     round(MemRns.fieldbyname('TW_KOL').asfloat*10000)/10000,1,'РН '+RN_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(self.tag)+']', strtoint(FRM.value),
     skid_money, strtoint('0'+RN_DISKONT.Text), memRNS.FieldByName('ED_SHORT').asstring,  'СКЛАД: '+SKL.Text);
//     writeln(check_file, 'Строка вывода '+ s);
//     writeln(check_file, 'Сумма/кол-во: '+MemRns.fieldbyname('TW_OKMONEY').asstring+'/'+MemRns.fieldbyname('TW_KOL').asstring);
     MemRns.next;
   end;

   FRShtrih.lastTW_Name := s;
   Application.createForm(TPRINT_KKM,PRINT_KKM);
   PRINT_KKM.MON1.value:=RN_SUMM.value;
   PRINT_KKM.MON2.value:=RN_SUMM.value;
   DataModule1.MainDicRnTyp.Locate('RNTYP_ID',self.ToolBar1.Tag,[]);
   PRINT_KKM.label3.tag:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger;	//если = 2 - выделять НДС
   PRINT_KKM.label2.tag :=DicShopRvid.fieldbyname('RVID_SUBKLN').asinteger;		//если=1 - безналичный расчет

//   writeln(check_file, 'Общая сумма: '+ floattostr(RN_SUMM.Value));
//   closefile(check_file);
   PRINT_KKM.showModal;
   PRINT_KKM.destroy;

   SAVE_RN_KASSIR();
   MemRns.First;
   for a:=1 to i-1 do MemRns.next;
   MemRns.Enablecontrols;
 end;

end;

procedure TDoc_RN.FormCreate(Sender: TObject);
begin
     Timer1.Interval:=TIME_GET_DISCONT;
end;

procedure TDoc_RN.Timer1Timer(Sender: TObject);
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

     summ := rnSumm;
     NEW_DISKONT_ID:=GET_DISKONT(NEW_DISKONT_NUM,DISKONT_PERCENT,NEW_KLN_ID,NEW_KLN_FULL, false, true, summ);

     if (NEW_DISKONT_NUM='70048150') then
        self.cbSkidNoPrint.Checked:=true;

{     if new_diskont_id>0 then
     begin
      if kln_ktg_id>0 then
        begin
          messboX('Дисконт применяется только для розничных клиентов!', MessSystem, 0);
          exit;
        end

     end;
}

     if NEW_DISKONT_ID>0 then begin
        {Проставляем дисконт в накладной}
        KLN_ID:=SHOP_KLN_DEFAULT(SHOPID,self.ToolBar1.Tag);
        Change_FrmKln(KLN_ID,2);
        RN_DISKONT.Text:=NEW_DISKONT_NUM;
        DISKONT_ID:=NEW_DISKONT_ID;
        RN_SKID.value:=DISKONT_PERCENT;
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
            zak_money:=GetTWKtgPrice(MemRNS.fieldbyName('tw_id').asinteger, 5);

            //Если итоговая цена ниже закупки, но при этом товар не распродажный, сделать цену закупочной
            if zak_money<=rozn_money then
            begin
              if MemRNS.fieldbyname('TW_OKMONEY').asfloat<zak_money then
              begin
                memrns.Edit;
                MemRNS.fieldbyname('TW_SKID').asfloat:=(MemRNS.Fieldbyname('TW_OKMONEY').asfloat- zak_money)*100/MemRNS.Fieldbyname('TW_MONEY').asfloat;;
                MemRNS.fieldbyname('SKID_TXT').asstring:='Слишком большая скидка. Цена увеличена до закупки';
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
//        RN_SKID_TXT.text:='Дисконт по карте № '+NEW_DISKONT_NUM;
     end;
     NEW_DISKONT_NUM:='';
     Refresh_summ;
     Show_SOST;
   Except
   End;
end;

procedure TDoc_RN.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
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
     if  (((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1')
      and      (Field.Fieldname='TW_MONEY')) then begin
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

procedure TDoc_RN.RN_DATEChange(Sender: TObject);
begin
     SAVE:=False;
end;

procedure TDoc_RN.ToolButton5Click(Sender: TObject);
begin
     My_lock;
end;



procedure TDoc_RN.RN_RNVIDChange(Sender: TObject);
begin
    SAVE:=False;
end;

procedure TDoc_RN.RN_DOSTClick(Sender: TObject);
begin
   SAVE:=False;
   DOST_DATE.visible:=RN_DOST.checked;
   if not autocheck then exit;
   if real_typ=1 then Exit;

   if RN_DOST.checked then
   begin
   label15.Caption := 'Ответственный за доставку:';
   ibquery3.Close;
   ibquery3.Open;
   while not ibquery3.Eof do
     begin
         if ibquery3.FieldByName('CFG_SET1').asinteger = 1 then
           begin
             RN_WHO.Text := ibquery3.FieldByName('CFG_VALUE').asstring;
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
   RN_WHO.text := '';
   end;
end;

procedure TDoc_RN.Btn_OstClick(Sender: TObject);
begin
    MemRns.edit;
    MemRns.FieldByName('TW_KOL').asfloat:=
      MemRNS.fieldByname('OST').asfloat;
 //   MemRns.Post;
end;

procedure TDoc_RN.N5Click(Sender: TObject);
// Возврат товара
var
        a,i:integer;
        s:string;
begin
 if Messbox('Выполнить возврат товаров по накладной?',MessSubmit,4+48+256)=6 then begin
   if (MemRNS.State in [dsInsert,DsEdit]) then MemRNS.Post;
   if Not Save and Btn_Apply.enabled then Btn_Apply.click;
   Btn_RefreshOst.click;
   MemRns.disablecontrols;
   i:=MemRns.Recno;
   MemRns.First;
   clear_cash;
   while not MemRns.eof do begin
     if Model_KKM=1 then s:='КОД: '+MemRns.fieldbyname('TW_ART').asstring;
     if Model_KKM=3 then s:=MemRns.fieldbyname('TW_ART').asstring;

     if Model_KKM=4 then begin
     s:=MemRns.fieldbyname('TW_ART').asstring;
     if PRINT_KKM_TW_NAME=1 then
       s:=s+' '+MemRns.fieldbyname('TW_NAM').asstring;
     if PRINT_KKM_TW_NAME=2 then
       s:=s+' '+MemRns.fieldbyname('TW_SHORT_NAM').asstring;

     FRShtrih.DocName:='РН '+RN_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(self.tag)+']';
     end;

     if Model_KKM=2 then
       begin
       // ЭЛВЕС ФР
       s:='КОД:'+MemRns.fieldbyname('TW_ART').asstring;
       if PRINT_KKM_TW_NAME>0 then begin
         s:=b_utils.left(s+' ',24)+MemRns.fieldbyname('TW_NAM').asstring;
        end;
       end;

     if length(s)>252 then s:=b_utils.left(s,252);
     add_cash(s,MemRns.fieldbyname('TW_OKMONEY').asfloat,
     MemRns.fieldbyname('TW_KOL').asfloat,1,'РН '+RN_NUM.Text+'/'+inttostr(SHOP_ID-1)+' ['+inttostr(self.tag)+']', strtoint(frm.value),0,0, memRns.FieldByName('ED_SHORT').asstring);
     MemRns.next;
   end;

   DataModule1.MainDicRnTyp.Locate('RNTYP_ID',self.ToolBar1.Tag,[]);


   wozw_cash(DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger, DicShopRvid.fieldbyname('RVID_SUBKLN').asinteger); //Возврат всегда наличный
   Main_form.GetStatusKKM;
   MemRns.First;
   for a:=1 to i-1 do MemRns.next;
   MemRns.Enablecontrols;
 end;
end;

procedure TDoc_RN.DOST_DATEChange(Sender: TObject);
begin
     SAVE:=False;
end;

procedure TDoc_RN.MemRNSTW_KOLChange(Sender: TField);
var
  val:double;
begin
   SAVE:=FALSE;
   val:=MemRNS.fieldByname('TW_KOL').asfloat;
   if val<=0 then begin
     MemRNS.fieldByname('TW_KOL').asfloat:=1;
     messbox('Количество товара не может быть нулевой или отрицательной величиной! '+CR+
     'Количеcтво с '+floattostrf(val,fffixed,19,4)+' изменено на 1.000!',MessError,16);
   end;
end;

procedure TDoc_RN.RN_KURSChange(Sender: TObject);
var
  val:double;
begin
   SAVE:=FALSE;
   val:=RN_KURS.value;
   if RN_KURS.value<=0 then begin
     RN_KURS.value:=1;
     messbox('Курс не может быть нулевой или отрицательной величиной! '+CR+
     'Курс с '+floattostrf(val,fffixed,19,2)+' изменен на 1.0!',MessError,16);
   end;
end;

procedure TDoc_RN.PrintTWCheckExecute(Sender: TObject);
begin
    // Печать товарного чека
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        PRINT_CHECK1(self.tag,Preview, not cbSkidNoPrint.checked);
end;

procedure TDoc_RN.PrintTwCheckFastExecute(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        PRINT_CHECK1(self.tag,NoPreview);
end;

procedure TDoc_RN.RVIDChange(Sender: TObject);
begin
    SAVE:=False;
    if DicShopRvid.FieldByName('RVID_SUBKLN').asinteger=1 then begin
           DicRvidKLN.close;
           DicRvidKLN.ParamByname('RVID_ID').asinteger:=strtoint('0'+RVID.value);
           DicRvidKLN.Open;
           RVIDKLN.Visible:=true;
           RVIDKLNCAP.Visible:=true;
           if (strtoint('0'+RVIDKLN.value)=0) and (not DicRvidKLN.eof) then begin
              DicRvidKLN.First;
              RVIDKLN.value:=DicRvidKLN.fieldByname('KLN_ID').asstring;
              //22-10-2013 - по умолчанию фирма-продавец - Гефест
              //22-10-2013 - по умолчанию фирма-продавец - яркафель
//10-04-2017 - остается та фирма которая указана в РН              if (RNTYP[self.Statusbar1.Tag].ID = 1) then
//                      frm.Value := '2705195';


           end;
    end else begin
        RVIDKLN.Visible:=false;
        RVIDKLNCAP.Visible:=false;
    end;
end;

procedure TDoc_RN.ActRnToPOExecute(Sender: TObject);
begin
    RN_TO_PO(self.tag);
end;

procedure TDoc_RN.ActRnToStornoExecute(Sender: TObject);
var
   NEWID:integer;
   CODE:integer;
   NEWNUM:string;
begin
  if Messbox('Сторнировать полностью текущую накладную ?',MessSubmit,4+48+256)=6 then begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           DataModule1.IbSaveSQL.close;
           DataModule1.IbSaveSQL.SQL.clear;
           DataModule1.IbSaveSQL.SQL.add('select * from rn_storno_all( :RN_ID, :US_ID, :SHOP_ID )');
           DataModule1.IbSaveSQL.ParamByname('RN_ID').asinteger:=self.tag;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           try
              DataModule1.IbSaveSQL.open;
              NEWID:=DataModule1.IbSaveSQL.fieldByname('NEW_RN_ID').asinteger;
              code:=DataModule1.IbSaveSQL.fieldByname('CODE').asinteger;
              NEWNUM:=DataModule1.IbSaveSQL.fieldByname('RN_NUM_FULL').asstring;
              DataModule1.IbSaveSQL.close;
              Datamodule1.IBTransaction2.Commit;
              if code<0 then messbox('Текущая накладная не может быть еще раз сторнирована! Весь товар уже сторнирован!',MessSystem,48) else begin
                if Messbox('Создана сторнирующая НЕ ПРОВЕДЕННАЯ накладная № '+NEWNUM+' от '+date_sokr(date())+' на весь несторнированный товар! Провести полную отгрузку-получение по исходной накладной и сторно?',MessSubmit,4+48+256)=6 then begin
                   Datamodule1.IBTransaction2.Active:=False;
                   Datamodule1.IBTransaction2.StartTransaction;
                   DataModule1.IbSaveSQL.close;
                   DataModule1.IbSaveSQL.SQL.clear;
                   DataModule1.IbSaveSQL.SQL.add('select * from OTG_POL_RN_STORNO(:rn_id,:storno_id,:us_id)');
                   DataModule1.IbSaveSQL.ParamByname('rn_id').asinteger:=self.tag;
                   DataModule1.IbSaveSQL.ParamByname('storno_id').asinteger:=NEWID;
                   DataModule1.IbSaveSQL.ParamByname('us_id').asinteger:=USERID;
                   DataModule1.IbSaveSQL.Open;
                   if not DataModule1.IbSaveSQL.eof then begin
                      if DataModule1.IbSaveSQL.fieldByname('stat').asinteger=1 then begin
                         Datamodule1.IBTransaction2.Commit;
                         Datamodule1.IBTransaction2.Active:=False;
                         Messbox('Выполнена полная отгрузка накладной '+self.RN_NUM.text+' и получение сторно накладной '+NEWNUM+'!',MessSystem,48);
                      end else Datamodule1.IBTransaction2.Rollback;
                   end else Datamodule1.IBTransaction2.Rollback;
                end;
              end;
           except
                 Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TDoc_RN.ActNewPoExecute(Sender: TObject);
var
  ID:integer;
  r:double;
  RNTYP_SHORT: string;
begin
   // Новая предоплата
   if tag<0 then messbox('Накладная не сохранена!',MessSystem,48) else begin
     Application.createForm(TDOC_PO,DOC_PO);
     DOC_PO.tag:=-1;
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
         IBSAVE_ADD('RN_ID',self.tag);
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
         IBSAVE_ADD('DOP2',tag);
         if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
         Datamodule1.IBTransaction2.Commit;
       except
         Datamodule1.IBTransaction2.RollBAck;
       end;
       Datamodule1.IBTransaction2.Active:=False;
       PoTransaction.Active:=False;
       QrListPO.close;
       QrListPO.paramByname('RN_ID').asinteger:=tag;
       QrListPO.open;
     end;
     DOC_PO.Destroy;
   end;
end;

procedure TDoc_RN.ActShowPOExecute(Sender: TObject);
begin
   if tag>0 then RN_SHOWPO(tag);
end;

procedure TDoc_RN.ActOpenPoExecute(Sender: TObject);
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
 if tag<0 then messbox('Накладная не сохранена!',MessSystem,48) else begin
   // Перед использованием, проверяем, а нужно ли еще использовать предоплату
   Refresh_Summ;
   DataModule1.MainDicRnTyp.Locate('RNTYP_ID',self.ToolBar1.Tag,[]);
   RNTYP_SHORT:=DataModule1.MainDicRnTyp.fieldByname('RNTYP_SHORT').asstring;
   if QrListPO.recordcount=0 then PO_SUMM:=0 else begin
     PoTransaction.Active:=False;
     QrListPO.close;
     QrListPO.paramByname('RN_ID').asinteger:=tag;
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
     JOU_PO2.FRM.Tag := strtoint(FRM.value);
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
           IBSAVE_ADD('RN_ID',self.tag);
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
           IBSAVE_ADD('DOP2',tag);
           if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
           Datamodule1.IBTransaction2.Commit;
         except
           Datamodule1.IBTransaction2.RollBAck;
         end;
         Datamodule1.IBTransaction2.Active:=False;
         PoTransaction.Active:=False;
         QrListPO.close;
         QrListPO.paramByname('RN_ID').asinteger:=tag;
         QrListPO.open;
         QrListPO.locate('PO_ID',JOU_PO2.tag,[]);
       end;
     end;
     JOU_PO2.destroy;
   end;
 end;
end;

procedure TDoc_RN.ActDelPoExecute(Sender: TObject);
var
  PO_ID:integer;
  PO_NUM:string;
  PO_MESS:string;
  rntyp_short: string;
begin
   // удаление предоплаты
   if Messbox('Удалить их текущей накладной использование предоплаты № '+QrListPo.fieldByname('PO_FULL_NUM').asstring
   +' на сумму '+floattostrf(QrListPo.fieldByname('PORN_SUMM').asfloat,fffixed,19,2)+'руб. ?',MessSubmitDelete,4+48+256)=6 then begin
   	  DataModule1.MainDicRnTyp.Locate('RNTYP_ID',self.ToolBar1.Tag,[]);
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
      IBSAVE_ADD('DOP2',tag);
      IBSAVE_DOC('ARCUPDATE',-1);
      Datamodule1.IBTransaction2.commit;
      Datamodule1.IBTransaction2.Active:=False;
      PoTransaction.Active:=False;
      QrListPO.close;
      QrListPO.paramByname('RN_ID').asinteger:=tag;
      QrListPO.open;
   end;
end;

procedure TDoc_RN.QrListPOAfterOpen(DataSet: TDataSet);
begin
  ActDelPo.enabled:=(not QrListPO.eof);
end;

procedure TDoc_RN.Timer2Timer(Sender: TObject);
begin
    Timer2.enabled:=False;
    Timer3.enabled:=False;
    TABEL.color:=clWindow;
    TABEL.Font.color:=clWindowText;
end;

procedure TDoc_RN.Timer3Timer(Sender: TObject);
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

procedure TDoc_RN.TabelKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
     if (Sost=0) and (self.tag<0) then begin
        sost:=1;
        RxDbGrid1.setfocus;
     end;
     show_sost;
  end;
end;

procedure TDoc_RN.Btn_TabelClick(Sender: TObject);
var
   a,ID:integer;
begin
     SAVE:=False;
     if (MemRNS.RecordCount>0) and (trunc(TABEL.value)<>0) then begin
         ID:=MemRNS.RecNo;
         MemRNS.DisableControls;
         MemRNS.First;
         while not MemRNS.eof do begin
               if (MemRNS.fieldByname('RNS_TABEL').asinteger=0) or ((check_dostup('$JOU.RN.CHANGE_TABEL')) and (RNTYP[self.Statusbar1.Tag].ID<>1)) then begin
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

procedure TDoc_RN.RVIDKLNChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDoc_RN.TABELChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDoc_RN.MnNDSClick(Sender: TObject);
begin
    NDS.value:=NDS_DATE(RN_DATE.date);
end;

procedure TDoc_RN.MnNPClick(Sender: TObject);
begin
    NP.value:=NP_DATE(self.ToolBar1.Tag,RN_DATE.date);
end;

procedure TDoc_RN.BtnPrintNpzClick(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}

        PRINT_MH1_MH3(2,self.tag,2);
//        PRINT_RNW(self.tag);
end;

procedure TDoc_RN.MnuPrintNPZFastClick(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        PRINT_CHECK3(self.tag,NoPreview);
end;

procedure TDoc_RN.NDSKeyPress(Sender: TObject; var Key: Char);
var err: boolean;
begin
err:=true;
if key=#13 then begin
     if (NDS.Value = NDS_DATE(rn_date.Date))
        then err:=false;
     if (NDS.Value = NDS_SMALL_DATE(rn_date.Date))
        then err:=false;

      if err=true then
      begin
                messbox('Веденный НДС не допустим в данной накладной!',MessSystem,48);
                err:=true;
                nds.Value:= NDS_DATE(rn_date.Date);
                nds.SetFocus;
      end;
  end;

  if (err<> true) or (key<>#13) then
          TabelKeyPress(sender, key);
end;

procedure TDoc_RN.NDSExit(Sender: TObject);
var err: boolean;
begin

err:=true;

     if (NDS.Value = NDS_DATE(rn_date.Date, self.ToolBar1.Tag))
        then err:=false;
     if (NDS.Value = NDS_SMALL_DATE(rn_date.Date))
        then err:=false;

      if err=true then
      begin
                messbox('Веденный НДС не допустим в данной накладной!',MessSystem,48);
                err:=true;
                nds.Value:= NDS_DATE(rn_date.Date);
                nds.SetFocus;
      end;


end;

procedure TDoc_RN.RN_WHO1Change(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDoc_RN.MemRNSAfterEdit(DataSet: TDataSet);
begin
 save := False;
{   if checkDiscont then
   if (memRNS.State in [dsEdit])
     AND (rn_skid.Value > 0) then
     begin
     if not (Messbox('При изменении накладной дисконт будет аннулирован.'+#13+#10+'Продолжить?',MessSubmit,4+48+256)=6)
     then
      begin
        memRNS.Cancel;
        exit;
      end;
      memRNS.post;
      btn_nodiscont.Click;
      Refresh_SUMM;
     end;
}
end;

procedure TDoc_RN.PrintRndRearExecute(Sender: TObject);
begin
	Print_DOC.LoadXltAndPrint('rnd_rear.xlt')
end;

procedure TDoc_RN.RxDBGrid1DrawColumnCell(Sender: TObject;
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

procedure TDoc_RN.FRMChange(Sender: TObject);
begin
  save:=false;

  if (RNTYP[self.Statusbar1.Tag].ID = 1) then
          if (RVIDKLN.Visible=true) then begin
                if (frm.Value <> '2705195') then
                  messbox('Для вида реализации "по карте банка" должна быть выбрана фирма "Яркафель"', 'Предупреждение', MB_OK);
  end;

  Btn_RefreshOstClick(nil);
  show_sost;
end;

procedure TDoc_RN.RN_DOVChange(Sender: TObject);
begin
    rn_who.Text := rn_dov.Text;
end;

procedure TDoc_RN.btnOpenDrawerClick(Sender: TObject);
begin
    if MODEL_KKM<>4 then Exit;

    FRShtrih.OpenDrawer;
end;

procedure TDoc_RN.actOpenDrawerExecute(Sender: TObject);
begin
    if MODEL_KKM<>4 then Exit;

    FRShtrih.OpenDrawer;
end;

procedure TDoc_RN.RN_PAYMENTClick(Sender: TObject);
begin
  PAYMENT_DETAIL.Visible := RN_PAYMENT.Checked;
  SAVE:=False;
end;

procedure TDoc_RN.PAYMENT_DETAILChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDoc_RN.fastprintRnExecute(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        PRINT_RN(DOC_RN.Tag, not cbSkidNoPrint.Checked, false, true, true);
end;

procedure TDoc_RN.ToolButton20Click(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        MH14.ShowReport;


end;

procedure TDoc_RN.MH14BeginDoc;
begin
 MH14.Dictionary.Variables['UserFio']:=''''+USERFIO_SHORT+'''';
 MH14.Dictionary.Variables['DocID']:=self.Tag;
 MH14.Dictionary.Variables['doc_number']:=self.RN_NUM.Text;
 MH14.Dictionary.Variables['doc_date']:=''''+self.RN_DATE.Text+'''';
 MH14.Dictionary.Variables['ORG']:=''''+self.frm.Text+'''';
 MH14.Dictionary.Variables['SKL']:=''''+self.SKL.Text+'''';
end;

procedure TDoc_RN.MH_IZVBeginDoc;
begin
 MH_IZV.Dictionary.Variables['UserFio']:=''''+USERFIO_SHORT+'''';
 MH_IZV.Dictionary.Variables['DocID']:=self.Tag;
 MH_IZV.Dictionary.Variables['doc_number']:=self.RN_NUM.Text;
 MH_IZV.Dictionary.Variables['doc_date']:=''''+self.RN_DATE.Text+'''';
 MH_IZV.Dictionary.Variables['ORG']:=''''+self.frm.Text+'''';
 MH_IZV.Dictionary.Variables['SKL']:=''''+self.SKL.Text+'''';
 MH_IZV.Dictionary.Variables['KLN']:=''''+self.KLN_NAME.Text+'''';

end;

procedure TDoc_RN.ToolButton23Click(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        MH_IZV.ShowReport;
end;

procedure TDoc_RN.ToolButton24Click(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}
        MH_PRET.ShowReport;
end;

procedure TDoc_RN.MH_PRETBeginDoc;
begin
 MH_PRET.Dictionary.Variables['UserFio']:=''''+USERFIO_SHORT+'''';
 MH_PRET.Dictionary.Variables['DocID']:=self.Tag;
 MH_PRET.Dictionary.Variables['doc_number']:=self.RN_NUM.Text;
 MH_PRET.Dictionary.Variables['doc_date']:=''''+self.RN_DATE.Text+'''';
 MH_PRET.Dictionary.Variables['ORG']:=''''+self.frm.Text+'''';
 MH_PRET.Dictionary.Variables['SKL']:=''''+self.SKL.Text+'''';
 MH_PRET.Dictionary.Variables['KLN']:=''''+self.KLN_NAME.Text+'''';
 MH_PRET.Dictionary.Variables['DOC_SUMM']:=''''+self.RN_SUMM.Text+'''';
end;

procedure TDoc_RN.print_mh3Execute(Sender: TObject);
begin
   if Not Save then
        if Btn_Apply.enabled then Btn_Apply.click;
        {Печатаем}

        PRINT_RN_MH3_SILENT(self.tag,1);
//        PRINT_MH1_MH3(2,self.tag,2);
end;

procedure TDoc_RN.comboDiscontChange(Sender: TObject);
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
     RN_DISKONT.text:='';
     DISKONT_ID:=0;
     RN_SKID.value:=0;
     RN_SKID_TXT.text:='';
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

procedure TDoc_RN.btnMakePnClick(Sender: TObject);
var check_result: boolean;
begin
//1.сохранить накладную.
//2. проверить что все товары имеют главный товар (или наоборот). причем все однотипные (оптовые в розницу или наоборот)
// наценка - регулируется группами товаров по этому журналу, т.е. оптовые дают наценку опту, розничные дают наценку рознице
//тип цены выбирается типом цены или устанавливается вручную
//3. провести накладную.
//4. создать и провести приход.
//5. пометить в РН (или в ПН) что парная накладная уже есть и изменения больше недопустимы

 {       check_result:=false;
//1.

        if Not Save and Btn_Apply.enabled then Btn_Apply.click;
        if (not SAVE) then begin
            Messbox('Ошибка сохранения', 'Ошибка сохранения', 0);
            exit;
        end;
//2.
        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;

        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from CHECK_RN_TW_PAIRS(:RN_ID)');
        DataModule1.IbSaveSQL.Parambyname('RN_ID').asinteger:=self.tag;

        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('Ошибка 1 при проверке накладной ! Попробуйте ещё раз!',MessSystem,48)
        else begin

          if (DataModule1.IbSaveSQL.fieldbyname('RES').asinteger<0) then
          begin
                Messbox(DataModule1.IbSaveSQL.fieldbyname('RES_DESCR').asString ,MessSystem,48);
          end
          else
          begin
                check_result:=true;

          end;
        end;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IBTransaction2.Commit;
        DataModule1.IBTransaction2.Active:=False;

        if (not check_result) then exit;

//3.
        BTN_PROW.Click;
        if not RN_PROW then begin
                Messbox('Накладная не проведена, поэтому приход не создан, ' ,MessSystem,48);
                exit;
        end;
//4.

        DataModule1.IBTransaction2.Active:=False;
        DataModule1.IBTransaction2.StartTransaction;
        }
      {
        DataModule1.IbSaveSQL.Close;
        DataModule1.IbSaveSQL.SQL.clear;
        DataModule1.IbSaveSQL.SQL.add('select * from SUBDOC_RN_TO_PN_INTERNAL_SALE(:RN_ID)');
        DataModule1.IbSaveSQL.Parambyname('RN_ID').asinteger:=self.tag;

        DataModule1.IbSaveSQL.Open;
        if DataModule1.IbSaveSQL.eof then Messbox('Ошибка 1 при создании приходной накладной ! Попробуйте ещё раз!',MessSystem,48)
        else begin

          if (DataModule1.IbSaveSQL.fieldbyname('RES').asinteger<0) then
          begin
                Messbox(DataModule1.IbSaveSQL.fieldbyname('RES_DESCR').asString ,MessSystem,48);
          end
          else
          begin
                Messbox(DataModule1.IbSaveSQL.fieldbyname('RES_DESCR').asString ,MessSystem,48);
                check_result:=true;

          end;
        end;
        DataModule1.IbSaveSQL.Close;
        DataModule1.IBTransaction2.Commit;
        DataModule1.IBTransaction2.Active:=False;
        }

end;

procedure TDoc_RN.btn_set_sklaD_managerClick(Sender: TObject);
begin
   Application.CreateForm(Tset_sklad_manager,set_sklad_manager);
   set_sklad_manager.showModal;


   self.label_PN_MANAGER.Caption:= 'Установлено: '+set_sklad_manager.sklad_name + ' ' +set_sklad_manager.manager_name;
   sklad_razgr_id := set_sklad_manager.skladid;

   manager_id := set_sklad_manager.managerid;

   set_sklad_manager.destroy;
end;

end.




