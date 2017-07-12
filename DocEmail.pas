unit DocEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DBUtils, CurrEdit, Mask, ToolEdit, Grids, DBGrids,
  RXDBCtrl, StdCtrls, ComCtrls, ExtCtrls, ToolWin, IBDatabase, RxLookup,
  Db, IBCustomDataSet, IBQuery, RxMemDS, Menus, Buttons,DetalTw, DBCtrls,VclUtils,
  SakSMTP, SakMsg,UtwMail, RXSpin, CheckLst;

type
  TDoc_Email = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnSave: TToolButton;
    BtnApply: TToolButton;
    ToolButton3: TToolButton;
    BtnPrint: TToolButton;
    BtnSend: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    MAIL_TXT: TMemo;
    Label1: TLabel;
    FROM_US: TEdit;
    Label2: TLabel;
    TO_TXT: TEdit;
    Label3: TLabel;
    MAIL_TEM: TEdit;
    TabSheet4: TTabSheet;
    Label_from: TLabel;
    Label_to: TLabel;
    MAIL_CONF: TCheckBox;
    MAIL_REPLY: TCheckBox;
    Panel3: TPanel;
    Panel4: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel5: TPanel;
    TITLE1: TLabel;
    TITLE2: TLabel;
    TITLE3: TLabel;
    TITLE4: TLabel;
    TITLE5: TLabel;
    TITLE6: TLabel;
    TITLE8: TLabel;
    TITLE7: TLabel;
    Label20: TLabel;
    MAIL_DATE: TDateEdit;
    MailTransaction: TIBTransaction;
    QrValuta: TIBQuery;
    QrValutaVALUTA_ID: TIntegerField;
    QrValutaVALUTA_SHORT: TIBStringField;
    QrValutaVALUTA_FULL: TIBStringField;
    DsValuta: TDataSource;
    QrPnTyp: TIBQuery;
    QrPnTypPNTYP_ID: TIntegerField;
    QrPnTypPNTYP_SHORT: TIBStringField;
    DsPnTyp: TDataSource;
    MAIL_NUM2: TEdit;
    Label22: TLabel;
    MemMails: TRxMemoryData;
    MemMailsMAILS_ID: TIntegerField;
    MemMailsTW_ID: TIntegerField;
    MemMailsTW_ART: TIntegerField;
    MemMailsTW_NAM: TStringField;
    MemMailsED_SHORT: TStringField;
    MemMailsOST: TFloatField;
    MemMailsTW_KOL: TFloatField;
    MemMailsTW_KOL_OLD: TFloatField;
    MemMailsMONEY_ZAK: TFloatField;
    MemMailsNEW_MROZ: TFloatField;
    MemMailsMAILS_SPEED: TFloatField;
    MemMailsMAILS_PRIM: TStringField;
    DsMails: TDataSource;
    ToolButton2: TToolButton;
    BtnDicTowar: TToolButton;
    BtnNoDicTowar: TToolButton;
    ToolButton8: TToolButton;
    BtnDel: TToolButton;
    BtnReply: TToolButton;
    MemMailsTW_PERCENT: TFloatField;
    PopupMenu1: TPopupMenu;
    MnDicTowar: TMenuItem;
    MemMailsTW_MROZ: TFloatField;
    Query1Transaction: TIBTransaction;
    IBQuery1: TIBQuery;
    MnSave: TMenuItem;
    MnApply: TMenuItem;
    MemMailsTWKTG_COLOR: TIntegerField;
    MnNoDicTowar: TMenuItem;
    ToolButton1: TToolButton;
    BtnDetal: TToolButton;
    BtnAnaliz: TToolButton;
    BtnMarketing: TToolButton;
    N2: TMenuItem;
    MnDetal: TMenuItem;
    MnAnaliz: TMenuItem;
    MnMarketing: TMenuItem;
    N3: TMenuItem;
    MnDel: TMenuItem;
    Timer1: TTimer;
    RxDBGrid2: TRxDBGrid;
    SKL_FROM: TRxDBLookupCombo;
    SKL_TO: TRxDBLookupCombo;
    Panel6: TPanel;
    Label9: TLabel;
    MAIL_NUM: TEdit;
    Label10: TLabel;
    VALUTA_ID: TRxDBLookupCombo;
    Label12: TLabel;
    SUMM: TRxCalcEdit;
    Label13: TLabel;
    PRIBYL: TRxCalcEdit;
    BtnRefreshSumm: TBitBtn;
    BtnMoney: TBitBtn;
    POST_FULL: TEdit;
    Label11: TLabel;
    UTW_DATE: TDateEdit;
    Label8: TLabel;
    Label14: TLabel;
    MAIL_OSN: TEdit;
    SKL_RAZG: TRxDBLookupCombo;
    Label15: TLabel;
    Label18: TLabel;
    PRIM1: TMemo;
    Label19: TLabel;
    Label16: TLabel;
    MAILOPL_ID: TRxDBLookupCombo;
    Label17: TLabel;
    OPLDO_DATE: TDateEdit;
    PRIM2: TMemo;
    ggg: TLabel;
    Label21: TLabel;
    WYP_DATE: TDateEdit;
    OPL_DATE: TDateEdit;
    BtnPost: TBitBtn;
    N4: TMenuItem;
    MnPost: TMenuItem;
    N6: TMenuItem;
    BtnTo: TBitBtn;
    ToShop: TBitBtn;
    N5: TMenuItem;
    MnPrint: TMenuItem;
    QrMailVID: TIBQuery;
    QrMailVIDMAILVID_ID: TIntegerField;
    QrMailVIDMAILVID_NAM: TIBStringField;
    DsMailVid: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    N7: TMenuItem;
    N8: TMenuItem;
    MemMailsRASP1: TStringField;
    MemMailsRASP2: TStringField;
    MemMailsRASP3: TStringField;
    MemMailsRASP4: TStringField;
    MemMailsRASP5: TStringField;
    MemMailsRASP6: TStringField;
    MemMailsRASP7: TStringField;
    MemMailsRASP8: TStringField;
    MemMailsRASP9: TStringField;
    MemMailsRASP10: TStringField;
    MemMailsRASP11: TStringField;
    MemMailsRASP12: TStringField;
    MemMailsRASP13: TStringField;
    MemMailsRASP14: TStringField;
    MemMailsRASP15: TStringField;
    MemMailsRASP16: TStringField;
    MemMailsRASP17: TStringField;
    MemMailsRASP18: TStringField;
    MemMailsRASP19: TStringField;
    MemMailsRASP20: TStringField;
    RASP1: TDBEdit;
    TITLE9: TLabel;
    TITLE10: TLabel;
    TITLE11: TLabel;
    TITLE12: TLabel;
    RASP2: TDBEdit;
    RASP3: TDBEdit;
    RASP4: TDBEdit;
    RASP5: TDBEdit;
    RASP6: TDBEdit;
    RASP7: TDBEdit;
    RASP8: TDBEdit;
    RASP9: TDBEdit;
    RASP10: TDBEdit;
    RASP11: TDBEdit;
    RASP12: TDBEdit;
    MemMailsVALUTA_ID: TIntegerField;
    MemMailsTWKTG_ID: TIntegerField;
    MemMailsTW_RASPR: TStringField;
    MemMailsOLD_MZAK: TFloatField;
    MAIL_VID: TRxDBLookupCombo;
    ToolButton6: TToolButton;
    MemMailsTW_PRIBYL: TFloatField;
    Check: TCheckBox;
    BtnSubdoc: TToolButton;
    ToolButton7: TToolButton;
    N9: TMenuItem;
    MnSubdoc: TMenuItem;
    MnApply2: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Label4: TLabel;
    N1: TMenuItem;
    N10: TMenuItem;
    BtnREAL: TToolButton;
    MnReal: TMenuItem;
    BtnExport: TToolButton;
    ToolButton10: TToolButton;
    ShowOst: TCheckBox;
    ToolButton9: TToolButton;
    SakMsg1: TSakMsg;
    SakSMTP1: TSakSMTP;
    KLN_EMAIL: TEdit;
    Label5: TLabel;
    MAIL_KURS: TRxCalcEdit;
    Label6: TLabel;
    UTW_NEW: TComboBox;
    Bevel1: TBevel;
    MAIL_OPIS: TMemo;
    Label7: TLabel;
    ZAY_WEIGHT: TRxCalcEdit;
    MemMailsTW_WEIGHT: TFloatField;
    MemMailsMAILS_WEIGHT: TFloatField;
    Label23: TLabel;
    ZAY_WEIGHT1: TRxCalcEdit;
    FRM: TRxDBLookupCombo;
    QrFastInfo: TIBQuery;
    QrFastInfoVID: TIBStringField;
    QrFastInfoF1: TFloatField;
    QrFastInfoF2: TFloatField;
    QrFastInfoF3: TFloatField;
    QrFastInfoF4: TFloatField;
    QrFastInfoF5: TFloatField;
    QrFastInfoF6: TFloatField;
    QrFastInfoF7: TFloatField;
    QrFastInfoF8: TFloatField;
    QrFastInfoF9: TFloatField;
    QrFastInfoF10: TFloatField;
    QrFastInfoF11: TFloatField;
    QrFastInfoF12: TFloatField;
    QrFastInfoF13: TFloatField;
    QrFastInfoF14: TFloatField;
    QrFastInfoF15: TFloatField;
    QrFastInfoF16: TFloatField;
    QrFastInfoF17: TFloatField;
    QrFastInfoF18: TFloatField;
    QrFastInfoF19: TFloatField;
    QrFastInfoF20: TFloatField;
    QrFastInfoVID_ID: TIntegerField;
    FastInfoTransaction: TIBTransaction;
    DsFastInfo: TDataSource;
    MemMailsnew_money1: TFloatField;
    MemMailsold_money1: TFloatField;
    MemMailsnew_money2: TFloatField;
    MemMailsold_money2: TFloatField;
    MemMailsnewmoney3: TFloatField;
    MemMailsold_money3: TFloatField;
    Label25: TLabel;
    Edit1: TEdit;
    Label26: TLabel;
    Edit2: TEdit;
    Label27: TLabel;
    Edit3: TEdit;
    edit4: TEdit;
    MemMailsMET_MONEY_SHOP: TIntegerField;
    Label29: TLabel;
    Edit5: TEdit;
    MemMailsnew_money4: TFloatField;
    MemMailsold_money4: TFloatField;
    tabAutoCalc: TTabSheet;
    GroupBox2: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    price_dest: TComboBox;
    price_PERCENT: TRxSpinEdit;
    price_source: TComboBox;
    Button1: TButton;
    price_round_type: TComboBox;
    Label33: TLabel;
    Edit6: TEdit;
    N11: TMenuItem;
    MemMailsnum: TIntegerField;
    Label24: TLabel;
    PER_POST_ID: TRxDBLookupCombo;
    Label34: TLabel;
    PER_FRM_ID: TRxDBLookupCombo;
    MAIL_OPT_ROZN: TComboBox;
    Label35: TLabel;
    TabSheet5: TTabSheet;
    gridComments: TRxDBGrid;
    memComments: TRxMemoryData;
    memCommentsKLN_ID: TIntegerField;
    memCommentsUS_FIO: TStringField;
    memCommentsTM: TDateTimeField;
    memCommentsCOMMENT: TStringField;
    dsComments: TDataSource;
    Button2: TButton;
    memCommentsSOGL: TIntegerField;
    memCommentsSOGL_TXT: TStringField;
    Label36: TLabel;
    memCommentsMAIL_COMMENT_ID: TIntegerField;
    Panel7: TPanel;
    Panel8: TPanel;
    MemMailsnew_money6: TFloatField;
    MemMailsold_money6: TFloatField;
    Label37: TLabel;
    Edit7: TEdit;
    Label38: TLabel;
    Edit8: TEdit;
    Label39: TLabel;
    Edit9: TEdit;
    chk_forOOP: TCheckBox;
    CheckListBox1: TCheckListBox;
    procedure SelectSave;
    procedure Show_sost;
    procedure ADD_MAILS(TW_ID:integer;KOL:double);
    procedure FormShow(Sender: TObject);
    procedure MAIL_VIDChange(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MemMailsOnCalcFields(DataSet: TDataSet);
    procedure DsMailsDataChange(Sender: TObject; Field: TField);
    procedure BtnDicTowarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnNoDicTowarClick(Sender: TObject);
    procedure BtnRefreshSummClick(Sender: TObject);
    procedure MemMailsAfterScroll(DataSet: TDataSet);
    procedure RefreshFast;
    procedure BtnDetalClick(Sender: TObject);
    procedure BtnAnalizClick(Sender: TObject);
    procedure BtnMarketingClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnPostClick(Sender: TObject);
    procedure BtnToClick(Sender: TObject);
    procedure TO_TXTChange(Sender: TObject);
    procedure ToShopClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnMoneyClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure VALUTA_IDChange(Sender: TObject);
    procedure BtnSubdocClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MAIL_TEMChange(Sender: TObject);
    procedure MAIL_CONFClick(Sender: TObject);
    procedure MAIL_REPLYClick(Sender: TObject);
    procedure MAIL_TXTChange(Sender: TObject);
    procedure SKL_FROMChange(Sender: TObject);
    procedure SKL_TOChange(Sender: TObject);
    procedure CheckClick(Sender: TObject);
    procedure UTW_DATEChange(Sender: TObject);
    procedure WYP_DATEChange(Sender: TObject);
    procedure OPL_DATEChange(Sender: TObject);
    procedure OPLDO_DATEChange(Sender: TObject);
    procedure MAILOPL_IDChange(Sender: TObject);
    procedure SKL_RAZGChange(Sender: TObject);
    procedure MAIL_OSNChange(Sender: TObject);
    procedure PRIM1Change(Sender: TObject);
    procedure PRIM2Change(Sender: TObject);
    procedure BtnREALClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure UTW_NEWChange(Sender: TObject);
    procedure MemMailsTW_KOLChange(Sender: TField);
    procedure FRMChange(Sender: TObject);
    function CheckTwSaler: boolean;
    procedure Button1Click(Sender: TObject);
    function CheckZayMoney: integer;
    procedure N11Click(Sender: TObject);
    procedure PER_POST_IDChange(Sender: TObject);
    procedure PER_FRM_IDChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure memCommentsCalcFields(DataSet: TDataSet);
    procedure gridCommentsDblClick(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure MAIL_OPT_ROZNChange(Sender: TObject);
    procedure MemMailsBeforeScroll(DataSet: TDataSet);
    procedure MemMailsAfterInsert(DataSet: TDataSet);
  private
    skl_to_frm, skl_from_frm: integer;
    procedure READY_COM_DATAMessage(var AMessage: TMessage); message
      gl_READY_COM_DATA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MAIL_SUBSOST:ansistring;
  ISPrint:Boolean=False;
  TMPMAIL:integer;
  MAIL_SHOP:integer;
  MAIL_AUTO,MAIL_DEL,MAIL_OLD,MAIL_WYP:boolean;
  VALUTA_KURS:double;
  CanInsert:Boolean=False;
  SKL:array[1..100] of integer;
  CNT_SKL:integer;
  MAILS_DEL:array[1..10000] of integer;
  CNT_DEL:integer=0;
  Doc_Email: TDoc_Email;
  SAVE:boolean;
  TO_ID:integer;
  MAIL_DOP1,MAIL_DOP2:integer;
  MAIL_NUMS:integer;
  POST_ID:integer;
  MAIL_SOST:integer;
  OPL_US:integer;
  UTW_US:integer;
  WYP_US:integer;
  Sost:integer;
  STR:ansistring;
  CanRefresh: boolean;
  badTW: string;
  mail_us_id: integer;
//  _SKL_RAZG_ID, _SKL_FROM_ID, _SKL_TO_ID : integer;

implementation

uses DicTowar, SetKolvo, ANALIZTW, Mainform, DicKlient, SelectShop,
  SetNewTW, MailNewMoney, SelectPrint, MailSubdoc, WaitForm, TextEditDialog;

{$R *.DFM}

procedure TDoc_Email.READY_COM_DATAMessage(var AMessage: TMessage);
var tW_id: integer;
  tw_art: string;
  tw_art_int: integer;
  brak: string;
  tw_kol: double;

begin
  try
       tw_kol:=AMessage.LParam/1000;
       tw_id:=AMessage.WParam;

       if memMAILS.Locate('TW_ID', tw_id, [])  then
       begin
         memMAILS.Edit;
         memMAILS.FieldByName('TW_KOL').asfloat:=memMAILS.FieldByName('TW_KOL').asfloat+tw_kol;
//         memMAILS.Post;
//не надо, т.к. POST делается в другом месте при пересчете цены при изменении количества.
       end
       else
         ADD_MAILS(tw_id, tw_kol);


  except
   on e: Exception do
     messbox(e.message, e.message, 0);
  end;

  show_sost;

  statusBar1.Panels[0].Text:='Ввод со сканера штрих кода';
  statusBar1.Panels[1].Text:=gl_LAST_BAR_CODE;
end;



function TDoc_Email.CheckZayMoney: integer;
begin
  result:=1;
  memMails.DisableControls;
  memMails.First;
  try
  while not memMails.Eof do
  begin
    if memMails.FieldByName('MONEY_ZAK').asFloat < 0.01 then
      raise Exception.Create('Не проставлена цена закупки');
    if memMails.FieldByName('NEW_MROZ').asFloat < 0.01 then
      raise Exception.Create('Не проставлена розничная цена ');
    if memMails.FieldByName('NEW_MONEY1').asFloat < 0.01 then
      raise Exception.Create('Не проставлена оптовая цена');
    if memMails.FieldByName('NEW_MONEY2').asFloat < 0.01 then
      raise Exception.Create('Не проставлена крупно оптовая цена');
    if memMails.FieldByName('NEW_MONEY3').asFloat < 0.01 then
      raise Exception.Create('Не проставлена спец цена');
    if memMails.FieldByName('NEW_MONEY6').asFloat < 0.01 then
      raise Exception.Create('Не проставлена спец цена 2');
    if memMails.FieldByName('NEW_MONEY4').asFloat < 0.01 then
      raise Exception.Create('Не проставлена цена перепродажи');

    memMails.Next;
  end;
  except
    on e: Exception do
    begin
     messbox(e.Message, 'Ошибка сохранения',  0);
     result:=0;
    end;
  end;



  memMails.EnableControls;
end;


procedure TDoc_Email.FormShow(Sender: TObject);
var
   c:integer;
   cc,ee1,ee2:integer;
   sw1,sw2:ansistring;
begin
     {Определяем местоположение}
     CanRefresh:=false;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.DesktopHeight-Main_Form.Top-22-28;
     MAIL_OPIS.lines.clear;
     ISPrint:=False;
     Wait_Form.StatusBar1.panels[0].text:='Формирование быстрых заголовков..';
     Wait_Form.Gauge1.Progress:=2;
     Wait_Form.Show;
     delay(1);
     TMPMAIL:=0;

     skl_to_frm:=0;
     skl_from_frm:=0;

     {Определяем перечень складов}
     CNT_SKL:=0;
     Query1Transaction.Active:=False;
     OPEN_SQL(IbQuery1,'select skl_id,skl_short from skl where skl_speed>0 order by skl_speed');
     while not IbQuery1.eof do begin
           if CNT_SKL<11 then begin
             inc(CNT_SKL);
             SKL[CNT_SKL]:=IbQuery1.fieldByname('SKL_ID').asinteger;
             case CNT_SKL of
                  1: TITLE1.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
                  2: TITLE2.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
                  3: TITLE3.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
                  4: TITLE4.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
                  5: TITLE5.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
                  6: TITLE6.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
                  7: TITLE7.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
                  8: TITLE8.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
                  9: TITLE9.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
                  10: TITLE10.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
                  11: TITLE11.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
                  12: TITLE12.caption:=IbQuery1.fieldByname('SKL_SHORT').asstring+':';
             end;
           end;
           IbQuery1.next;
     end;
     TO_ID:=0;
     MailTransaction.Active:=False;
     Wait_Form.StatusBar1.panels[0].text:='Загрузка перечня валют..';
     Wait_Form.Gauge1.Progress:=7;
     delay(1);
     QrValuta.close;
     QrValuta.Open;
     Wait_Form.StatusBar1.panels[0].text:='Загрузка видов сообщений ..';
     Wait_Form.Gauge1.Progress:=12;
     delay(1);
     QrMailVid.close;
     QrMailVid.ParamByname('US_ID').asinteger:=USERID;
     QrMailVid.Parambyname('MAIL_ID').asinteger:=DOC_EMAIL.tag;
     QrMailVid.Open;

     Wait_Form.StatusBar1.panels[0].text:='Загрузка перечня оплат..';
     Wait_Form.Gauge1.Progress:=22;
     delay(1);
     QrPnTyp.close;
     QrPnTyp.Open;
     MemMails.EmptyTable;
     CanInsert:=False;
     Sost:=0;




     if Doc_Email.tag<0 then begin


        UTW_NEW.itemindex:=1;
        if (SHOPID = 20) then
          UTW_NEW.itemindex:=2;
        if (SHOPID = 10) then
          UTW_NEW.itemindex:=2;

        MAIL_KURS.value:=DEFAULT_KURS(1,0);
        MAIL_SUBSOST:='';
        GET_DEFAULT;

        MAIL_OPT_ROZN.itemIndex:=0;










        FRM.Value := inttostr(DEFAULT_FIRMA);

        PER_FRM_ID.Value:=inttostr(DEFAULT_FIRMA);
        PER_POST_ID.Value:=inttostr(DEFAULT_FIRMA);




        Wait_Form.StatusBar1.panels[0].text:='Формирование нового сообщения..';
        Wait_Form.Gauge1.Progress:=50;
        delay(1);
        {Новое сообщение}
        MAIL_AUTO:=false;
        MAIL_SHOP:=SHOPID;
        MAIL_DEL:=false;
        MAIL_OLD:=false;
        MAIL_WYP:=false;
        MAIL_NUM.text:='Новый!';
        MAIL_NUM2.text:='Новый!';
        Mail_Nums:=-1;
        POST_ID:=0;
        VALUTA_ID.value:=QrValuta.fieldByname('VALUTA_ID').asstring;

		    SKL_RAZG.Value:=inttostr(DEFAULT_SKLAD);
        SKL_FROM.Value:=inttostr(DEFAULT_SKLAD);
        SKL_TO.Value:=inttostr(DEFAULT_SKLAD);


        if (SHOPID = 20) then
          MAIL_OPT_ROZN.ItemIndex := 1;
        if (SHOPID = 10) then
          MAIL_OPT_ROZN.ItemIndex := 1;

        if (USERID = 520028855) or (USERID = 2681031) or (USERID = 80733920) then
        begin
          MAIL_OPT_ROZN.ItemIndex := 1;
          frm.Value := '2697090';
          UTW_NEW.itemindex:=2;
        end;



        QrPnTyp.locate('PNTYP_ID', '2', [loCaseInsensitive]);
        MAILOPL_ID.value:=QrPnTyp.fieldByname('PNTYP_ID').asstring;
        MAIL_DATE.date:=date();
        FROM_US.text:=USERFIO; {От кого}
        TO_TXT.text:='';
        MAIL_VID.value:=QrMailVid.fieldByname('MAILVID_ID').asstring;
        MAIL_TEM.text:='';     {Тема}
        MAIL_CONF.checked:=False; {Конфиденциальность}
        MAIL_REPLY.checked:=False; {Обязателен ответ}
        MAIL_TXT.Lines.clear; {Текст почтового сообщения}
        MAIL_OSN.text:=''; {Основание заявки на закупку}
        OPLDO_DATE.date:=date(); {Оплатить заявку до...}
        PRIM1.lines.clear;
        PRIM2.lines.clear;
        MAIL_SOST:=0; {Черновик}
        OPL_US:=0;
        OPL_DATE.date:=date();
        OPL_DATE.visible:=False;
        UTW_US:=0;
        UTW_DATE.date:=date();
        UTW_DATE.visible:=False;
        WYP_US:=0;
        WYP_DATE.date:=date();
        WYP_DATE.visible:=False;
     end else begin
        {почта правится}
        Wait_Form.StatusBar1.panels[0].text:='Загрузка содержимого..';
        Wait_Form.Gauge1.Progress:=27;
        delay(1);
        Query1Transaction.Active:=False;
        ADD_SQL(IbQuery1,'select * from mail where mail_id=:mail_id');
        IbQuery1.Parambyname('mail_id').asinteger:=Doc_EMail.tag;
        IbQuery1.Open;
        {Заполняем}
        sw1:=IbQuery1.fieldByname('MAIL_SUBSOST').asstring;
        try
          UTW_NEW.ItemIndex:=strtoint(sw1[2]);
        except
           UTW_NEW.ItemIndex:=0;
        end;
        if IbQuery1.fieldByname('MAIL_KURS').asfloat=0 then MAIL_KURS.value:=DEFAULT_KURS(1,0) else MAIL_KURS.value:=IbQuery1.fieldByname('MAIL_KURS').asfloat;
        MAIL_DATE.date:=IbQuery1.fieldByname('CREATE_DATE').asdatetime;
        MAIL_SUBSOST:=IbQuery1.fieldByname('MAIL_SUBSOST').asstring;
        // US_ID
        MAIL_SHOP:=IbQuery1.fieldByname('SHOP_ID').asinteger;
        TO_TXT.text:=IbQuery1.fieldByname('TO_TXT').asstring;
        TO_ID:=IbQuery1.fieldByname('TO_ID').asinteger;

        mail_us_id:=IbQuery1.fieldByname('US_ID').asinteger;


        FRM.Value := IbQuery1.fieldbyname('FRM_ID').asstring;

        PER_POST_ID.Value:=IbQuery1.fieldbyname('PER_POST_ID').asstring;
        PER_FRM_ID.Value:=IbQuery1.fieldbyname('PER_FRM_ID').asstring;

        SKL_RAZG.Value := IbQuery1.fieldbyname('SKL_ID').asstring;
        SKL_FROM.Value := IbQuery1.fieldbyname('MAIL_DOP1').asstring;
        SKL_TO.Value := IbQuery1.fieldbyname('MAIL_DOP2').asstring;


        if IbQuery1.fieldByname('MAILVID_ID').asstring=''
        then MAIL_VID.value:=QrMailVid.fieldbyname('MAILVID_ID').asstring
        else MAIL_VID.value:=inttostr(IbQuery1.fieldByname('MAILVID_ID').asinteger);
        MAIL_TEM.text:=IbQuery1.fieldByname('MAIL_TEM').asstring;     {Тема}
        MAIL_CONF.checked:=strtoboolean(IbQuery1.fieldByname('MAIL_CONF').asstring); {Конфиденциальность}
        MAIL_REPLY.checked:=strtoboolean(IbQuery1.fieldByname('MAIL_REPLY').asstring); {Обязателен ответ}
        chk_forOOP.Checked:=strtoboolean(IbQuery1.fieldByname('chk_forOOP').asstring);
        MAIL_TXT.Lines.clear; {Текст почтового сообщения}
        MAIL_TXT.Lines.add(IbQuery1.fieldByname('MAIL_TXT').asstring);


        MAIL_NUM.text:=IbQuery1.fieldByname('MAIL_NUM').asstring;
        MAIL_NUM2.text:=IbQuery1.fieldByname('MAIL_NUM').asstring;
        Mail_Nums:=IbQuery1.fieldByname('MAIL_NUM').asinteger;
        if IbQuery1.fieldByname('VALUTA_ID').asstring=''
        then VALUTA_ID.value:=QrValuta.fieldbyname('VALUTA_ID').asstring
        else VALUTA_ID.value:=inttostr(IbQuery1.fieldByname('VALUTA_ID').asinteger);
        POST_ID:=IbQuery1.fieldByname('POST_ID').asinteger; {Поставщик}
        MAIL_OSN.text:=IbQuery1.fieldByname('MAIL_OSN').asstring; {Основание заявки на закупку}

        MAIL_OPT_ROZN.ItemIndex:= IbQuery1.fieldByname('MAIL_OPT_ROZN').AsInteger; 


        if IbQuery1.fieldByname('MAILOPL_ID').asstring=''
        then MAILOPL_ID.value:=QrPntyp.fieldbyname('PNTYP_ID').asstring
        else MAILOPL_ID.value:=inttostr(IbQuery1.fieldByname('MAILOPL_ID').asinteger);
        OPLDO_DATE.date:=IbQuery1.fieldByname('OPLDO_DATE').asdatetime; {Оплатить заявку до...}
        PRIM1.lines.clear;
        PRIM1.lines.add(IbQuery1.fieldByname('PRIM1').asstring);
        PRIM2.lines.clear;
        PRIM2.lines.add(IbQuery1.fieldByname('PRIM2').asstring);
        FROM_US.text:=USERFIO; {От кого}
        MAIL_SOST:=IbQuery1.fieldByname('MAIL_SOST').asinteger; {Состояние}
        OPL_DATE.date:=IbQuery1.fieldByname('OPL_DATE').asdatetime; {Дата оплаты}
        OPL_US:=IbQuery1.fieldByname('OPL_US').asinteger;
        if MAIL_SOST>3 then OPL_DATE.visible:=true; // Заявка оплачена
        UTW_DATE.date:=IbQuery1.fieldByname('UTW_DATE').asdatetime; {Дата утверждения}
        UTW_US:=IbQuery1.fieldByname('UTW_US').asinteger;
        if MAIL_SOST>2 then UTW_DATE.visible:=true; {Заявка утверждена}
        WYP_DATE.date:=IbQuery1.fieldByname('WYP_DATE').asdatetime; {Дата выполнения}
        WYP_US:=IbQuery1.fieldByname('WYP_US').asinteger;
        if MAIL_SOST>4 then WYP_DATE.visible:=true; // Заявка выполнена
        Check.checked:=strtoboolean(IbQuery1.fieldByname('MAIL_ODOBR').asstring);
        MAIL_DEL:=strtoboolean(IbQuery1.fieldByname('MAIL_DEL').asstring);
        MAIL_OLD:=strtoboolean(IbQuery1.fieldByname('MAIL_OLD').asstring);
        MAIL_WYP:=strtoboolean(IbQuery1.fieldByname('MAIL_WYP').asstring);
        MAIL_AUTO:=strtoboolean(IbQuery1.fieldByname('MAIL_AUTO').asstring);
        // Загружаем список
        Wait_Form.Gauge1.Progress:=50;
        delay(1);
        ADD_SQL(IbQuery1,'select * from list_mails(:mail_id) order by mails_id');
        IbQuery1.paramByname('MAIL_ID').asinteger:=DOC_Email.tag;
        IbQuery1.Open;
        MemMails.disablecontrols;
        CanInsert:=True;
        while not IbQuery1.eof do begin
              MemMails.Append;
              MemMails.fieldByname('MAILS_ID').asinteger:=IbQuery1.fieldByname('MAILS_ID').asinteger;
              MemMails.fieldByname('TW_ID').asinteger:=IbQuery1.fieldByname('TW_ID').asinteger;
              MemMails.fieldByname('TW_ART').asinteger:=IbQuery1.fieldByname('TW_ART').asinteger;
              MemMails.fieldByname('TW_NAM').asstring:=IbQuery1.fieldByname('TW_NAM').asstring;
              MemMails.fieldByname('ED_SHORT').asstring:=IbQuery1.fieldByname('ED_SHORT').asstring;
              MemMails.fieldByname('OST').asfloat:=IbQuery1.fieldByname('OST').asfloat;
              MemMails.fieldByname('TW_KOL').asfloat:=IbQuery1.fieldByname('TW_KOL').asfloat;
              MemMails.fieldByname('TW_WEIGHT').asfloat:=IbQuery1.fieldByname('TW_WEIGHT').asfloat;
              MemMails.fieldByname('TW_KOL_OLD').asfloat:=IbQuery1.fieldByname('TW_KOL_OLD').asfloat;
              MemMails.fieldByname('MONEY_ZAK').asfloat:=IbQuery1.fieldByname('MONEY_ZAK').asfloat;
              MemMails.fieldByname('NEW_MROZ').asfloat:=IbQuery1.fieldByname('NEW_MROZ').asfloat;
              MemMails.fieldByname('MAILS_SPEED').asfloat:=IbQuery1.fieldByname('MAILS_SPEED').asfloat;
              MemMails.fieldByname('MAILS_PRIM').asstring:=IbQuery1.fieldByname('MAILS_PRIM').asstring;
              MemMails.fieldByname('TW_MROZ').asfloat:=IbQuery1.fieldByname('TW_MROZ').asfloat;
              MemMails.fieldByname('TWKTG_COLOR').asinteger:=IbQuery1.fieldByname('TW_COLOR').asinteger;
              MemMails.fieldByname('TWKTG_ID').asinteger:=IbQuery1.fieldByname('TWKTG_ID').asinteger;
              MemMails.fieldByname('VALUTA_ID').asinteger:=IbQuery1.fieldByname('VALUTA_ID').asinteger;
              MemMails.fieldByname('TW_RASPR').asinteger:=IbQuery1.fieldByname('TW_RASPR').asinteger;
              MemMails.fieldByname('OLD_MZAK').asfloat:=IbQuery1.fieldByname('OLD_MZAK').asfloat;
              MemMails.fieldByname('MET_MONEY_SHOP').asinteger:=IbQuery1.fieldByname('MET_MONEY_SHOP').asinteger;


              MemMails.fieldByname('NEW_MONEY1').asfloat:=IbQuery1.fieldByname('NEW_MONEY1').asfloat;
              MemMails.fieldByname('NEW_MONEY2').asfloat:=IbQuery1.fieldByname('NEW_MONEY2').asfloat;
              MemMails.fieldByname('NEW_MONEY3').asfloat:=IbQuery1.fieldByname('NEW_MONEY3').asfloat;
              MemMails.fieldByname('NEW_MONEY6').asfloat:=IbQuery1.fieldByname('NEW_MONEY6').asfloat;
              MemMails.fieldByname('NEW_MONEY7').asfloat:=IbQuery1.fieldByname('NEW_MONEY7').asfloat;
              MemMails.fieldByname('NEW_MONEY8').asfloat:=IbQuery1.fieldByname('NEW_MONEY8').asfloat;
              MemMails.fieldByname('NEW_MONEY4').asfloat:=IbQuery1.fieldByname('NEW_MONEY4').asfloat;
              MemMails.fieldByname('OLD_MONEY1').asfloat:=IbQuery1.fieldByname('OLD_MONEY1').asfloat;
              MemMails.fieldByname('OLD_MONEY2').asfloat:=IbQuery1.fieldByname('OLD_MONEY2').asfloat;
              MemMails.fieldByname('OLD_MONEY3').asfloat:=IbQuery1.fieldByname('OLD_MONEY3').asfloat;
              MemMails.fieldByname('OLD_MONEY6').asfloat:=IbQuery1.fieldByname('OLD_MONEY6').asfloat;
              MemMails.fieldByname('OLD_MONEY7').asfloat:=IbQuery1.fieldByname('OLD_MONEY7').asfloat;
              MemMails.fieldByname('OLD_MONEY8').asfloat:=IbQuery1.fieldByname('OLD_MONEY8').asfloat;
              MemMails.fieldByname('OLD_MONEY4').asfloat:=IbQuery1.fieldByname('OLD_MONEY4').asfloat;


              for cc:=1 to 12 do begin
                ee1:=IbQuery1.fieldByname('MOVE'+inttostr(cc)).asinteger;
                ee2:=IbQuery1.fieldByname('RASP'+inttostr(cc)).asinteger;
                if ee1>0 then sw1:=inttostr(ee1) else sw1:='';
                if ee2>0 then sw2:=inttostr(ee2) else sw2:='';
                MemMails.fieldByname('RASP'+inttostr(cc)).asstring:=sw1+' / '+sw2;
              end;

              MemMails.Post;
              IbQuery1.next;
        end;
        Wait_Form.Gauge1.Progress:=70;
        delay(1);
        CanInsert:=False;
        MemMails.first;
        MemMails.enablecontrols;
        Query1Transaction.Active:=False;
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select KLN_FULL FROM KLN_DATA( :KLN_ID)');
        IbQuery1.Parambyname('KLN_ID').asinteger:=POST_ID;
        IbQuery1.Open;
        POST_FULL.text:=IbQuery1.fieldByname('KLN_FULL').asstring;
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select KLN_EMAIL FROM KLN WHERE KLN_ID=:KLN_ID');
        IbQuery1.Parambyname('KLN_ID').asinteger:=POST_ID;
        IbQuery1.Open;
        KLN_EMAIL.text:=IbQuery1.fieldByname('KLN_EMAIL').asstring;
        IbQuery1.Close;
        // Проверяем доступность кнопок записи
     end;
     Wait_Form.StatusBar1.panels[0].text:='Завершающие настройки..';
     Wait_Form.Gauge1.Progress:=90;
     delay(1);
     CNT_DEL:=0;
     SAVE:=True;
     MAIL_VIDChange(Sender);
     Show_sost;
     MemMailsAfterScroll(MemMails);
     {Заполняем названия для быстрых остатков}
     Query1Transaction.Active:=False;
     IbQuery1.close;
     IbQuery1.SQL.clear;
     IbQuery1.SQL.add('select SKL_ID,SKL_SHORT FROM SKL WHERE SKL_SPEED>0 order by SKL_SPEED');
     IbQuery1.Open;
     c:=0;
     while not IbQuery1.eof do begin
       inc(c);
       RxDbgrid2.Columns[c].Title.Caption:=IbQuery1.fieldByname('SKL_SHORT').asstring;
       IbQuery1.next;
     end;
     IbQuery1.close;
     {Закрываем правку}
//     if MAIL_SOST in [3,4,5,6,7] then MAIL_KURS.enabled:=False else MAIL_KURS.enabled:=True;
     if MAIL_SOST in [2,3,4,5,6,7] then begin {На подпись,Утверждение,оплата, выполнение, просмотр}
        BtnSave.enabled:=False;
        MnSave.enabled:=False;
        BtnApply.Enabled:=False;
        MnApply2.enabled:=False;
        BtnSend.Enabled:=False;
        BtnReply.enabled:=False;
        BtnDicTowar.enabled:=False;
        BtnNoDicTowar.enabled:=False;
        MnDicTowar.enabled:=False;
        MnNoDicTowar.enabled:=False;
        BtnDel.enabled:=False;
        MnDel.enabled:=False;
        MAIL_VID.enabled:=False;
        FROM_US.enabled:=False;
        TO_TXT.enabled:=False;
        BtnTo.enabled:=False;
        ToShop.enabled:=False;
        MAIL_TEM.enabled:=False;
        MAIL_CONF.enabled:=False;
        MAIL_REPLY.enabled:=False;
        chk_forOOP.enabled:=false;
        MAIL_TXT.readOnly:=True;
        SKL_FROM.Enabled:=False;
        SKL_TO.Enabled:=False;
        Check.enabled:=False;
        VALUTA_ID.enabled:=False;
        BtnPost.enabled:=False;
        MAIL_OSN.enabled:=False;
        Wyp_date.enabled:=False;
        SKL_RAZG.enabled:=False;
        MAILOPL_ID.enabled:=False;
        OPLDO_DATE.enabled:=False;
        OPL_DATE.enabled:=False;
        PRIM1.readonly:=True;
        PRIM2.readonly:=True;
        WYP_DATE.visible:=False;
        OPL_DATE.visible:=False;
        BtnMoney.enabled:=False;
        {А теперь нужное открываем}
        if MAIL_SOST=2 then begin {на подпись}
           PRIM2.ReadOnly:=False;
           BtnApply.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.PODP');
           MnApply.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.PODP');
           BtnSave.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.PODP');
           MnSave.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.PODP');
           MAIL_OSN.enabled:=True;
           OPLDO_DATE.enabled:=True;
        end;
        if MAIL_SOST=6 then begin {утверждение}
           UTW_DATE.visible:=True;
           UTW_DATE.Date:=date();
           UTW_US:=UserId;
           BtnApply.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.UTW');
           MnApply.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.UTW');
           BtnSave.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.UTW');
           MnSave.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.UTW');
        end;
        if MAIL_SOST=3 then begin {оплата}
           UTW_DATE.visible:=True;
           OPL_DATE.visible:=true;
           OPL_DATE.Enabled:=true;
           OPL_DATE.Date:=now;
           OPL_US:=USERID;
           BtnApply.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.OPL');
           MnApply.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.OPL');
           BtnSave.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.OPL');
           MnSave.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.OPL');
        end;
        if MAIL_SOST=4 then begin {Выполнение}
           UTW_DATE.visible:=True;
           OPL_DATE.visible:=true;
           WYP_DATE.visible:=True;
           WYP_DATE.Enabled:=true;
           WYP_DATE.Date:=now;
           WYP_US:=USERID;
           BtnApply.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.WYP');
           MnApply.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.WYP');
           BtnSave.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.WYP');
           MnSave.Enabled:=CHECK_DOSTUP('$MAIL.ZAY.WYP');
        end;
     end;
     WorkTransaction.Active:=False;
     Wait_Form.StatusBar1.panels[0].text:='Обновление суммы..';
     Wait_Form.Gauge1.Progress:=96;
     delay(1);
     canRefresh:=true;
     BtnRefreshSumm.click;
     Wait_Form.StatusBar1.panels[0].text:='Обновление суммы..';
     Wait_Form.Gauge1.Progress:=100;
     delay(100);
     BtnExport.enabled:=Check.Checked and (mail_vid.value='2') and not MAIL_WYP;
     Wait_Form.Hide;

     TabSheet5Show(nil);

     SAVE:=True;

end;

procedure TDoc_Email.MAIL_VIDChange(Sender: TObject);
var
   En5,En4,En3,VIS:boolean;
   a,TYP:integer;
begin
     TYP:=strtoint(Mail_vid.value);

      panel7.visible:= not (typ=7);
      panel7.visible:= not (typ=7);
      label24.Visible:= not (typ=7);
      label34.Visible:= not (typ=7);
      per_post_id.Visible:= not (typ=7);
      per_frm_id.Visible:= not (typ=7);

     //запрет создания распоряжений 23-10-2013
     if (typ=7) then//распоряжение
     begin
      if (not check_dostup('$MAIL.CREATE.VID7')) then
      begin
        Messbox('Вы не можете создавать распоряжения',MessSystem,48);
        Mail_vid.value := '1';
        TYP := 1;

      end;











     end;

     if (TYP=3) and (Doc_Email.tag<0) and (Doc_Email.visible) and (MemMails.recordcount=0) then
       Messbox('Не забудьте определить валюту оплаты заявки!',MessSystem,48);
     if (TYP=3) and (MemMails.recordcount>0) then begin
        BtnReal.Enabled:=true;
        MnReal.Enabled:=true;
     end else begin
        BtnReal.Enabled:=False;
        MnReal.Enabled:=False;
     end;
     {1 - Список товаров, 2 - Заявка на перемещение, 3 - Заявка на закупку
      4 - Кассовый отчёт  5 - Email}
     if (TYP in [2,3]) then En5:=False else En5:=True;
     if TYP=2 then EN3:=True else En3:=False; {Заявка на перемещение}
     if TYP=3 then EN4:=True else En4:=False; {Заявка на закупку}
     if En4 then Panel5.Height:=73 else Panel5.Height:=0;
     BtnPost.enabled:=En4;
     MnPost.enabled:=En4;
     Panel6.Visible:=En4;
     Label_from.visible:=En3;
     Label_to.visible:=En3;
     SKL_FROM.visible:=En3;
     SKL_TO.visible:=En3;
     Check.Visible:=En3;
     ZAY_WEIGHT.Visible:=En3;
     Label7.visible:=En3;
     if En4 then VIS:=true else VIS:=false;
     {Определяем величину подробных остатков}
     WorkTransaction.Active:=False;
     QueryWork.close;
     QueryWork.SQL.clear;
     QueryWork.SQL.add('select count(*) as cc from cfg where cfg_set1= :SE and (cfg_name="SPEED") and (cfg_value=1)');
     if (En4 or En3) then QueryWork.ParamByname('SE').asinteger:=2 else QueryWork.ParamByname('SE').asinteger:=1;
     QueryWork.Open;
     if QueryWork.eof then begin
        Panel4.Height:=Panel5.Height+19;
     end else begin
         Panel4.Height:=Panel5.Height+19*(QueryWork.fieldbyname('cc').asinteger+1)+10;
     end;
     QueryWork.close;
     for a:=1 to cnt_skl do begin
         case a of
              1: title1.visible:=VIS;
              2: title2.visible:=VIS;
              3: title3.visible:=VIS;
              4: title4.visible:=VIS;
              5: title5.visible:=VIS;
              6: title6.visible:=VIS;
              7: title7.visible:=VIS;
              8: title8.visible:=VIS;
              9: title9.visible:=VIS;
              10: title10.visible:=VIS;
              11: title11.visible:=VIS;
              12: title12.visible:=VIS;
         end;
         case a of
              1: RASP1.visible:=VIS;
              2: RASP2.visible:=VIS;
              3: RASP3.visible:=VIS;
              4: RASP4.visible:=VIS;
              5: RASP5.visible:=VIS;
              6: RASP6.visible:=VIS;
              7: RASP7.visible:=VIS;
              8: RASP8.visible:=VIS;
              9: RASP9.visible:=VIS;
              10: RASP10.visible:=VIS;
              11: RASP11.visible:=VIS;
              12: RASP12.visible:=VIS;
         end;
     end;
     RxDbGrid1.Columns[3+1].visible:=VIS;
     RxDbGrid1.Columns[5+1].visible:=VIS;
     RxDbGrid1.Columns[6+1].visible:=VIS;
     RxDbGrid1.Columns[7+1].visible:=VIS;
     RxDbGrid1.Columns[8+1].visible:=VIS;
     RxDbGrid1.Columns[9+1].visible:=VIS;
//     RxDbGrid1.Columns[9].ReadOnly:=(gl_FRM_WORK_MODE>0);


     RxDbGrid1.Columns[11+1].visible:=VIS;
     RxDbGrid1.Columns[12+1].visible:=VIS;
     RxDbGrid1.Columns[13+1].visible:=VIS;
     RxDbGrid1.Columns[14+1].visible:=VIS;
     RxDbGrid1.Columns[15+1].visible:=VIS;
     RxDbGrid1.Columns[16+1].visible:=VIS;
     RxDbGrid1.Columns[17+1].visible:=VIS;
     RxDbGrid1.Columns[18+1].visible:=VIS;
     RxDbGrid1.Columns[19+1].visible:=VIS;
     RxDbGrid1.Columns[20+1].visible:=VIS;
     RxDbGrid1.Columns[21+1].visible:=VIS;
     RxDbGrid1.Columns[22+1].visible:=VIS;
     RxDbGrid1.Columns[23+1].visible:=VIS;
     RxDbGrid1.Columns[24+1].visible:=VIS;


     BtnNoDicTowar.Enabled:=En5;
     MnNoDicTowar.Enabled:=En5;

     if ((typ=3) and (MAIL_SOST=0)) then
      GroupBox2.visible:=true
     else
      GroupBox2.visible:=false;


     SAVE:=False;
end;

procedure TDoc_Email.BtnApplyClick(Sender: TObject);
var
   r:double;
   last_no:integer;
   tmp_a,NEWIDS,NEWID,a,b,c,d:integer;
   ss1,ss2,ss3,ss4:ansistring;
   raspr,ost_min:real;
   res,OLD_TAG:integer;
   EMAIL_HOST:ansistring;
   s:ansistring;
   cc:char;
   Utw1,Utw2:boolean;
begin
 if not btnApply.Enabled then
  exit;


 if (mail_sost=6) and (UTW_NEW.itemindex>0) then begin
    // Запись утверждения директоров
    Application.createForm(TUTW_MAIL,UTW_MAIL);
    IF MAIL_SUBSOST[3]='1' then UTW_MAIL.UTW1.checked:=True else UTW_MAIL.UTW1.checked:=False;
    IF MAIL_SUBSOST[4]='1' then UTW_MAIL.UTW2.checked:=True else UTW_MAIL.UTW2.checked:=False;
    UTW_MAIL.UTW1.enabled:=Check_Dostup('$MAIL.ZAY.UTW1');
    UTW_MAIL.UTW2.enabled:=Check_Dostup('$MAIL.ZAY.UTW2');
    if UTW_MAIL.tag>0 then begin
    end;
    UTW_MAIL.destroy;
 end else begin
  // Проверка на заполнение основание, примечания директора и даты оплаты
  if (((mail_sost=2) and (TMPMAIL=0))or (mail_sost=6)) and ((trim(mail_osn.text)='') or (length(trim(opldo_date.text))<6) or (prim2.lines.count=0) or (trim(prim2.text)='')) then begin
     messbox('При подписи заявки "Оплатить до", основание и "примечание директора" должны быть обязательно заполнены!',MessSystem,48);
  end else begin
     Wait_Form.StatusBar1.panels[0].text:='Запись сообщения..';
     Wait_Form.Gauge1.Progress:=2;
     Wait_Form.Show;
     delay(1);
     BtnRefreshSumm.Click;
     delay(1);
     if (Memmails.State in [dsInsert,DsEdit]) then MemMails.Post;
     SAVE:=False;
     Wait_Form.Gauge1.Progress:=3;
     delay(1);
     Statusbar1.panels[3].text:='Фаза 1...';  delay(1);
     {Выясняем корректность получателя}
     MAIL_DOP1:=1;
     MAIL_DOP2:=1;
     if Mail_VID.value='2' then begin {Заявка на перемещение}
       MAIL_DOP1:=strtoint('0'+SKL_FROM.value);
       MAIL_DOP2:=strtoint('0'+SKL_TO.value);
       if MAIL_DOP1=0 then begin
         Messbox('Не указан склад-отправитель', messError,0);
         Exit;
       end;
       if mail_dop2=0  then begin
         messBox('Не указан склад-получатель', messError, 0);
         Exit;
       end;

       if (    (skl_from_frm = 0) and (skl_to_frm>0 ) and (skl_to_frm <> strtoint(frm.Value))) then
        begin
          Messbox('Нельзя перемещать товары со склада '+skl_from.Text+' на склад '+SKL_TO.text+'!',  MessError, MB_OK);
          Wait_Form.Hide;
          exit;
        end;

        if per_post_id.Value='' then
        begin
        Messbox('не указана фирма-поставщик',  MessError, MB_OK);
          Wait_Form.Hide;
          exit;
        end;
        if per_frm_id.Value='' then
        begin
        Messbox('не указана фирма-покупатель',  MessError, MB_OK);
          Wait_Form.Hide;
          exit;
        end;

        if ((strtoint(per_post_id.Value) = 2646742) or
        (strtoint(per_post_id.Value) = 2669809) or
        (strtoint(per_post_id.Value) = 2669810) or
        (strtoint(per_post_id.Value) = 2696214)) then
        begin

          if ((strtoint(per_frm_id.Value) <> (strtoint(per_post_id.Value)))) then
          if not CHECK_DOSTUP('$MAIL.ZAY_PER.ANY_FRM') then
          begin
            Messbox('нельзя перемещать товар с указанной фирмы на указанную фирму',  MessError, MB_OK);
            Wait_Form.Hide;
            exit;
          end;
        end;





//       if CheckTwSaler <> true then
//        exit;




     end;

     if Mail_VID.value='3' then begin {Заявка на закупку}
       if SKL_RAZG.value =''  then
       	begin
         	messbox('Не указан магазин разгрузки',MessSystem,48);
            exit;
        end;
       if MAILOPL_ID.value =''  then
       	begin
         	messbox('Не указан тип оплаты',MessSystem,48);
            exit;
        end;
//        if CheckTwSaler <> true then
//        exit;

     end;
     Wait_Form.Gauge1.Progress:=6;
     delay(1);
     Statusbar1.panels[3].text:='Фаза 2...';  delay(1);
     {Определяем номер}
     IF MAIL_NUMS<0 then begin
        MAIL_NUMS:=NEW_MAIL_NUM(strtoint('0'+frm.Value), MAIL_DATE.date);
        MAIL_NUM.text:=inttostr(MAIL_NUMS);
        MAIL_NUM2.text:=inttostr(MAIL_NUMS);
     end;
     Statusbar1.panels[3].text:='Фаза 3...';  delay(1);
     {Записываем}
     Statusbar1.panels[3].text:='Фаза 4...';  delay(1);
     Wait_Form.Gauge1.Progress:=12;
     delay(1);
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Statusbar1.panels[3].text:='Фаза 5...';  delay(1);
     Wait_Form.Gauge1.Progress:=15;
     delay(1);
     Try
       Wait_Form.Gauge1.Progress:=18;
       delay(1);
       Statusbar1.panels[3].text:='Фаза 6...';  delay(1);
       IBSAVE_CLEAR;
       Statusbar1.panels[3].text:='Фаза 7...';  delay(1);
       Wait_Form.Gauge1.Progress:=21;
       delay(1);
       if (not IsPrint) or (Doc_Email.tag<0) then begin
           Statusbar1.panels[3].text:='Фаза 8...';  delay(1);
           if (MAIL_SOST<2) or (Doc_Email.tag<0) then IBSAVE_ADD('US_ID',USERID); // Не меняем пользователя, если заявка
           Statusbar1.panels[3].text:='Фаза 9...';  delay(1);
           MAIL_DATE.date:=now();
       end;
       IBSAVE_ADD('CREATE_DATE',MAIL_DATE.date);
       Statusbar1.panels[3].text:='Фаза 10...';  delay(1);
       Wait_Form.Gauge1.Progress:=30;
       delay(1);
       IBSAVE_ADD('SHOP_ID',MAIL_SHOP);
       IBSAVE_ADD('MAIL_KURS',MAIL_KURS.value);
       IBSAVE_ADD('FRM_ID',strtoint('0'+FRM.value));
       IBSAVE_ADD('PER_POST_ID',strtoint('0'+PER_POST_ID.value));
       IBSAVE_ADD('PER_FRM_ID',strtoint('0'+PER_FRM_ID.value));
       IBSAVE_ADD('TO_ID',TO_ID);
       IBSAVE_ADD('TO_TXT',TO_Txt.text);
       if MAIL_VID.value='' then
          IBSAVE_ADD('MAILVID_ID',QrMailvid.fieldbyname('MAILVID_ID').asinteger)
          else IBSAVE_ADD('MAILVID_ID',strtoint(MAIL_VID.value));
       Statusbar1.panels[3].text:='Фаза 10-1...';  delay(1);
       Wait_Form.Gauge1.Progress:=33;
       delay(1);
       IBSAVE_ADD('MAIL_TEM',MAIL_TEM.text);
       IBSAVE_ADD('MAIL_DEL',MAIL_DEL);
       IBSAVE_ADD('MAIL_AUTO',MAIL_AUTO);
       IBSAVE_ADD('MAIL_OLD',MAIL_OLD);
       IBSAVE_ADD('MAIL_CONF',MAIL_CONF.checked);
       IBSAVE_ADD('MAIL_ODOBR',Check.checked);
       IBSAVE_ADD('MAIL_WYP',MAIL_WYP);
       IBSAVE_ADD('MAIL_REPLY',MAIL_REPLY.checked);
       IBSAVE_ADD('chk_forOOP', chk_forOOP.checked);

       IBSAVE_ADD('MAIL_TXT',memotostr(MAIL_TXT.lines));
       IBSAVE_ADD('MAIL_DOP1',MAIL_DOP1);
       IBSAVE_ADD('MAIL_DOP2',MAIL_DOP2);
       IBSAVE_ADD('MAIL_NUM',MAIL_NUMS);
       IBSAVE_ADD('MAIL_OPT_ROZN', MAIL_OPT_ROZN.ItemIndex);

       if length(mail_subsost)<10 then mail_subsost:=mail_subsost+space(10);
       for tmp_a:=1 to 10 do if Mail_subsost[tmp_a]=' ' then mail_subsost[tmp_a]:='0';
       s:=inttostr(UTW_NEW.itemindex);
       cc:=s[1];
       MAIL_SUBSOST[2]:=cc;
       IBSAVE_ADD('MAIL_SUBSOST',b_utils.left(MAIL_SUBSOST+space(10),10));
       if VALUTA_ID.value='' then
        IBSAVE_ADD('VALUTA_ID',QrValuta.fieldbyname('VALUTA_ID').asinteger)
        else IBSAVE_ADD('VALUTA_ID',strtoint(VALUTA_ID.value));
       Statusbar1.panels[3].text:='Фаза 10-2...';  delay(1);
       IBSAVE_ADD('POST_ID',POST_ID);
       IBSAVE_ADD('MAIL_OSN',MAIL_OSN.text);
       if MAILOPL_ID.value='' then
        IBSAVE_ADD('MAILOPL_ID',QrPntyp.fieldbyname('PNTYP_ID').asinteger)
       else IBSAVE_ADD('MAILOPL_ID',strtoint(MAILOPL_ID.value));
       Statusbar1.panels[3].text:='Фаза 10-3...';  delay(1);
       IBSAVE_ADD('OPLDO_DATE',OPLDO_DATE.date);
       IBSAVE_ADD('PRIM1',memotostr(Prim1.lines));
       IBSAVE_ADD('PRIM2',memotostr(Prim2.lines));
       IBSAVE_ADD('MAIL_SOST',MAIL_SOST);
       Statusbar1.panels[3].text:='Фаза 11...';  delay(1);
       Wait_Form.Gauge1.Progress:=36;
       delay(1);
       if (not IsPrint) then begin
         case MAIL_SOST of
              2: if TMPMAIL=0 then IBSAVE_ADD('MAIL_SOST',6);
              6: IBSAVE_ADD('MAIL_SOST',3);
              3: IBSAVE_ADD('MAIL_SOST',4);
              4: IBSAVE_ADD('MAIL_SOST',5);
         end;
       end;
       Statusbar1.panels[3].text:='Фаза 12...';  delay(1);
       IBSAVE_ADD('OPL_DATE',OPL_DATE.date);
       IBSAVE_ADD('OPL_US',OPL_US);
       IBSAVE_ADD('UTW_DATE',UTW_DATE.date);
       IBSAVE_ADD('UTW_US',UTW_US);
       IBSAVE_ADD('WYP_DATE',WYP_DATE.date);
       IBSAVE_ADD('WYP_US',WYP_US);
	     IBSAVE_ADD('SKL_ID',strtoint('0'+SKL_RAZG.value));
       Statusbar1.panels[3].text:='Фаза 13...';  delay(1);
       OLD_TAG:=Doc_Email.tag;
       Statusbar1.panels[3].text:='Фаза 14...';  delay(1);
       Wait_Form.Gauge1.Progress:=42;
       delay(1);
       res:=IBSAVE_DOC('MAIL',Doc_Email.tag);
       Statusbar1.panels[3].text:='Фаза 15...';  delay(1);
       Wait_Form.Gauge1.Progress:=45;
       delay(1);
       if res<0 then r:=Sqrt(-1)
       else begin
            Statusbar1.panels[3].text:='Фаза 16...';  delay(1);
            {Фиксируем факт доставки}
            if OLD_TAG<0 then begin
              Statusbar1.panels[3].text:='Фаза 17...';  delay(1);
              IBSAVE_CLEAR;
              IBSAVE_ADD('MAILDOST_DATE',my_now);
              IBSAVE_ADD('SHOP_ID',SHOPID);
              IBSAVE_ADD('MAIL_ID',res);
              Statusbar1.panels[3].text:='Фаза 18...';  delay(1);
              if IBSAVE_DOC('MAILDOST',-1)<0 then r:=sqrt(-1);
              Statusbar1.panels[3].text:='Фаза 19...';  delay(1);
            end;
            Wait_Form.Gauge1.Progress:=60;
            delay(1);
            {Теперь содержимое}
            {Удаляем удалённое}
            Statusbar1.panels[3].text:='Фаза 20...';  delay(1);
            for a:=1 to CNT_DEL do begin
                if not IBDELETE_DOC('MAILS',MAILS_DEL[a]) then r:=Sqrt(-1);
            end;
            Statusbar1.panels[3].text:='Фаза 21...';  delay(1);
            {Сохраняем содержимое}
            Wait_Form.Gauge1.Progress:=63;
            delay(1);

            if MemMails.recordcount>0 then begin
               last_no:=MemMails.recno;
               MemMails.disablecontrols;
               MemMails.first;
               Statusbar1.panels[3].text:='Фаза 22...';  delay(1);
               while not MemMails.eof do begin
                     Wait_Form.Gauge1.Progress:=63+trunc(17*(MemMails.recno/MemMails.recordcount));
                     application.processmessages;
                     Statusbar1.panels[3].text:='Фаза 23...';  application.processmessages;
                     IBSAVE_CLEAR;
                     IBSAVE_ADD('MAIL_ID',res);
                     IBSAVE_ADD('TW_ID',MemMails.fieldByname('TW_ID').asinteger);
                     if MemMails.fieldByname('TW_ID').asinteger<=0 then begin
                       IBSAVE_ADD('TW_NAM',MemMails.fieldByname('TW_NAM').asstring);
                       IBSAVE_ADD('ED_SHORT',MemMails.fieldByname('ED_SHORT').asstring);
                     end else begin
                       IBSAVE_ADD('TW_NAM','');
                       IBSAVE_ADD('ED_SHORT','');
                     end;
                     Statusbar1.panels[3].text:='Фаза 24...';  application.processmessages;
                     IBSAVE_ADD('OST',MemMails.fieldByname('OST').asfloat);
                     IBSAVE_ADD('TW_KOL',MemMails.fieldByname('TW_KOL').asfloat);
                     if ((MAIL_SOST<>2) or (doc_email.tag<0)) then IBSAVE_ADD('TW_KOL_OLD',MemMails.fieldByname('TW_KOL').asfloat)
                      else IBSAVE_ADD('TW_KOL_OLD',MemMails.fieldByname('TW_KOL_OLD').asfloat);
                     IBSAVE_ADD('MONEY_ZAK',MemMails.fieldByname('MONEY_ZAK').asfloat);
                     IBSAVE_ADD('NEW_MROZ',MemMails.fieldByname('NEW_MROZ').asfloat);
                     IBSAVE_ADD('MAILS_SPEED',MemMails.fieldByname('MAILS_SPEED').asfloat);
                     IBSAVE_ADD('MAILS_PRIM',MemMails.fieldByname('MAILS_PRIM').asstring);
                     IBSAVE_ADD('OLD_MZAK',MemMails.fieldByname('OLD_MZAK').asfloat);
                     IBSAVE_ADD('VALUTA_ID',MemMails.fieldByname('VALUTA_ID').asinteger);
                     IBSAVE_ADD('TW_RASPR',strtoboolean(MemMails.fieldByname('TW_RASPR').asstring));
                     IBSAVE_ADD('TWKTG_ID',MemMails.fieldByname('TWKTG_ID').asinteger);

                     IBSAVE_ADD('NEW_MONEY1',MemMails.fieldByname('NEW_MONEY1').asfloat);
                     IBSAVE_ADD('NEW_MONEY2',MemMails.fieldByname('NEW_MONEY2').asfloat);
                     IBSAVE_ADD('NEW_MONEY3',MemMails.fieldByname('NEW_MONEY3').asfloat);
                     IBSAVE_ADD('NEW_MONEY6',MemMails.fieldByname('NEW_MONEY6').asfloat);
                     IBSAVE_ADD('NEW_MONEY7',MemMails.fieldByname('NEW_MONEY7').asfloat);
                     IBSAVE_ADD('NEW_MONEY8',MemMails.fieldByname('NEW_MONEY8').asfloat);
                     IBSAVE_ADD('NEW_MONEY4',MemMails.fieldByname('NEW_MONEY4').asfloat);
                     IBSAVE_ADD('OLD_MONEY1',MemMails.fieldByname('OLD_MONEY1').asfloat);
                     IBSAVE_ADD('OLD_MONEY2',MemMails.fieldByname('OLD_MONEY2').asfloat);
                     IBSAVE_ADD('OLD_MONEY3',MemMails.fieldByname('OLD_MONEY3').asfloat);
                     IBSAVE_ADD('OLD_MONEY6',MemMails.fieldByname('OLD_MONEY6').asfloat);
                     IBSAVE_ADD('OLD_MONEY7',MemMails.fieldByname('OLD_MONEY7').asfloat);
                     IBSAVE_ADD('OLD_MONEY8',MemMails.fieldByname('OLD_MONEY8').asfloat);
                     IBSAVE_ADD('OLD_MONEY4',MemMails.fieldByname('OLD_MONEY4').asfloat);


                     Statusbar1.panels[3].text:='Фаза 25...';  application.processmessages;
                     NEWID:=IBSAVE_DOC('MAILS',MemMails.fieldByname('MAILS_ID').asinteger);
                     if NEWID<0 then r:=Sqrt(-1) else begin
                        Statusbar1.panels[3].text:='Фаза 26...';  application.processmessages;
                        MemMails.edit;
                        MemMails.fieldByname('MAILS_ID').asinteger:=NEWID;
                        MemMails.Post;
                        {Удаляем старое распределение}
                        ADD_SQL(DataModule1.IbSaveSQL,'DELETE FROM MAILSS WHERE MAILS_ID=:MAILS_ID');
                        Statusbar1.panels[3].text:='Фаза 27...';  application.processmessages;
                        DataModule1.IbSaveSQL.ParamByname('MAILS_ID').asinteger:=NEWID;
                        DataModule1.IbSaveSQL.ExecSQL;
                        {Сохраняем распределение}
                        Statusbar1.panels[3].text:='Фаза 28...';  application.processmessages;
                        for c:=1 to CNT_SKL do begin
                            {Определяем количества}
                            case c of
                                 1: ss1:=MemMails.fieldByname('RASP1').asstring;
                                 2: ss1:=MemMails.fieldByname('RASP2').asstring;
                                 3: ss1:=MemMails.fieldByname('RASP3').asstring;
                                 4: ss1:=MemMails.fieldByname('RASP4').asstring;
                                 5: ss1:=MemMails.fieldByname('RASP5').asstring;
                                 6: ss1:=MemMails.fieldByname('RASP6').asstring;
                                 7: ss1:=MemMails.fieldByname('RASP7').asstring;
                                 8: ss1:=MemMails.fieldByname('RASP8').asstring;
                                 9: ss1:=MemMails.fieldByname('RASP9').asstring;
                                 10: ss1:=MemMails.fieldByname('RASP10').asstring;
                                 11: ss1:=MemMails.fieldByname('RASP11').asstring;
                                 12: ss1:=MemMails.fieldByname('RASP12').asstring;
                            end;
                            {Проверяем, есть ли / в строке}
                            ss1:=trim(ss1);
                            ss2:='';
                            for d:=1 to length(ss1) do if ss1[d]='/' then ss2:=ss2+' ' else ss2:=ss2+ss1[d];
                            ss2:='0'+ss2+'.0';
                            ss3:='0'+argc(ss2,1);
                            ss4:='0'+argc(ss2,2);
                            raspr:=strtofloat(ss3);
                            ost_min:=strtofloat(stringreplace(ss4, '.', DECIMALSEPARATOR, [rfReplaceAll]));
                            Statusbar1.panels[3].text:='Фаза 29...';  application.processmessages;
                            if (raspr>0) or (ost_min>0) then begin
                                 {Сохраняем}
                                 IBSAVE_CLEAR;
                                 IBSAVE_ADD('MAILS_ID',NEWID);
                                 IBSAVE_ADD('SKL_ID',SKL[c]);
                                 IBSAVE_ADD('RASPR',Int(RASPR));
                                 IBSAVE_ADD('OST_MIN',int(OST_MIN));
                                 Statusbar1.panels[3].text:='Фаза 30...';  application.processmessages;
                                 NEWIDS:=IBSAVE_DOC('MAILSS',-1);
                                 Statusbar1.panels[3].text:='Фаза 31...';  application.processmessages;
                                 if NEWIDS<0 then r:=Sqrt(-1);
                               end;
                        end;
                     end;
                     Statusbar1.panels[3].text:='Фаза 32...';  application.processmessages;
                     MemMails.next;
               end;
               Wait_Form.Gauge1.Progress:=80;
               delay(1);
               Statusbar1.panels[3].text:='Фаза 33...';  delay(1);
               MemMails.first;
               for b:=2 to last_no do MemMails.next;
               MemMails.enablecontrols;
            end;
            Statusbar1.panels[3].text:='Фаза 34...';  delay(1);
       end;
       Statusbar1.panels[3].text:='Фаза 35...';  delay(1);
       Datamodule1.IBTransaction2.Commit;
       Wait_Form.Gauge1.Progress:=100;
       delay(1);
       Wait_Form.Hide;
       Doc_Email.tag:=res;
       Datamodule1.IBTransaction2.Active:=False;
       if (MAIL_SOST=4) and (not Mail_auto) then begin
          if Messbox('Выполнить оформление первичных документов?',MessSubmit,4+48)=6 then begin
             {Запустить процедуру оформления документов}
             Application.createForm(TMAIL_SUBDOC,MAIL_SUBDOC);
             MAIL_SUBDOC.tag:=DOC_EMAIL.tag;
             MAIL_SUBDOC.ShowModal;
             MAIL_SUBDOC.Destroy;
          end;
       end;
       Statusbar1.panels[3].text:='Фаза 36...';  delay(1);
       CNT_DEL:=0;
       SAVE:=True;
       // Запрос на отправку почты
       WorkTransaction.Active:=False;
       // Читаем настройки для экспорта данных в систему банк-клиент
       // Читаем имя хоста для отправки
       OPEN_SQL(QueryWork,'select CFG_ID,CFG_VALUE FROM CFG WHERE CFG_NAME="EMAIL_HOST"');
       if QueryWork.eof then begin
         EMAIL_HOST:='';
       end else begin
         EMAIL_HOST:=QueryWork.fieldByname('CFG_VALUE').asstring;
       end;
       if EMAIL_HOST<>'' then begin
         OPEN_SQL(QueryWork,'select kln_email from kln where kln_id='+inttostr(userid));
         if not QueryWork.eof then begin
           if (pos('@',QueryWork.fieldbyname('KLN_EMAIL').asstring)>0) and (MAIL_SOST<2) then begin
              if Messbox('Отправить Вам копию документа по электронной почте?',MessSubmit,4+48+256)=6 then begin
                 Wait_Form.Gauge1.Progress:=10;
                 Wait_Form.StatusBar1.panels[0].text:='Отправка сообщения..';
                 Wait_Form.Show;
                 delay(1);
               try
                  SakSMTP1.host := EMAIL_HOST;
                  SakSMTP1.connect;

                  SakMsg1.ParseMsg;
                  SakMsg1.AttachedFiles.Clear;
                  SakMsg1.CharSet := 'windows-1251';
                  SakMsg1.TextEncoding := te8Bit;
                  SakMsg1.UserName := 'Система складского учета BSKLAD!';
                  SakMsg1.From := QueryWork.fieldbyname('KLN_EMAIL').asstring;
                  SakMsg1.SendTo := QueryWork.fieldbyname('KLN_EMAIL').asstring;
                  SakMsg1.Subject := MAIL_VID.Text+' № '+MAIL_NUM.text+' от '+date_sokr(MAIL_DATE.date);
                  SakMsg1.Text.Clear;
                  if MAIL_VID.value='3' then begin
                     OPEN_SQL(QueryWork,'select kln_email from kln where kln_id='+inttostr(POST_ID));
                     if not QueryWork.eof then begin
                       if pos('@',QueryWork.fieldbyname('KLN_EMAIL').asstring)>0 then
                       SakMsg1.Text.add(QueryWork.fieldbyname('KLN_EMAIL').asstring)
                       else SakMsg1.Text.add('Электронный адрес отсутствует');
                     end;
                     ADD_SQL(QueryWork,'select * from kln_data( :kln_id)');
                     QueryWork.ParamByName('KLN_ID').asinteger:=strtoint('0'+FRM.value);
                     QueryWork.Open;
                     // Заявка на закупку
                     s:='Поставщик: '+POST_FULL.text+#13+#10+Powt_sym('-',76)+#13+#10+

                     'Заказчик: '+QueryWork.fieldByname('KLN_FULL').asstring+#13+#10+
                     'Адрес: '+QueryWork.fieldByname('KLN_ADR').asstring+#13+#10+
                     'Реквизиты: '+QueryWork.fieldByname('KLN_REKW').asstring+#13+#10+
                     'Телефон: '+QueryWork.fieldByname('KLN_TEL').asstring+#13+#10+
                     'Валюта: '+VALUTA_ID.Text;
                     SakMsg1.Text.add(s);
                     Last_no:=MemMails.Recno;
                     MemMails.DisableControls;
                     MemMails.First;
                     a:=0;
                     SakMsg1.Text.add(Powt_sym('-',76));
                     for a:=1 to mail_txt.Lines.Count do SakMsg1.Text.add(mail_txt.Lines[a-1]);
                     SakMsg1.Text.add(Powt_sym('-',76));
                     Wait_Form.Gauge1.Progress:=20;
                     delay(1);
                     a:=0;
                     While not MemMails.eof do begin
                       Wait_Form.Gauge1.Progress:=20+trunc(60*(MemMails.Recno/MemMails.Recordcount));;
                       delay(1);
                       inc(a);
                       s:=b_utils.right('       '+inttostr(a),6)+' '+
                       b_utils.left(MemMails.fieldByname('TW_NAM').asstring+space(80),52)+
                       b_utils.left(MemMails.fieldByname('ED_SHORT').asstring+'       ',6)+
                       b_utils.right('       '+floattostrf(MemMails.fieldByname('TW_KOL').asfloat,fffixed,19,4),11);
                       SakMsg1.Text.add(s);
                       MemMails.Next;
                     end;
                     MemMails.first;
                     for b:=2 to last_no do MemMails.next;
                     MemMails.enablecontrols;
                     SakMsg1.Text.add(Powt_sym('-',76));
                  end else begin
                    s:='Тема: '+mail_tem.Text+#13+#10;
                    SakMsg1.Text.add(s);
                    for a:=1 to mail_txt.Lines.Count do SakMsg1.Text.add(mail_txt.Lines[a-1]);
                  end;
                  Wait_Form.Gauge1.Progress:=80;
                  delay(1);
                  if not SakSMTP1.SMTPError then begin
                      Wait_Form.Gauge1.Progress:=90;
                      delay(1);
                        SakSMTP1.SendTheMessage( SakMsg1);
                  end else begin
                    r:=sqrt(-1);
                  end;
                  SakMsg1.ParseMsg;
                  Wait_Form.Gauge1.Progress:=95;
                  delay(10);
                  SakSMTP1.Disconnect;
                  Wait_Form.Gauge1.Progress:=100;
                  delay(10);
                  Wait_Form.Hide;
                  Messbox('"'+MAIL_VID.Text+' № '+MAIL_NUM.text+' от '+date_sokr(MAIL_DATE.date)+'" отправлен Вам на e-mail!',MessSystem,48);
                 except
                    Messbox('Сообщение не отправлено из-за ошибок с почтовым сервером!',MessError,16);
                 end;
                  Wait_Form.Hide;
              end;
           end;
         end;
       end;
     Except
        on e: Exception do
        begin
          Messbox('Ошибка при записи электронной почты!'+chr(13)+'Описание ошибки: '+e.message,MessSystem,16);
          Datamodule1.IBTransaction2.Rollback;
        end
     End;
     Statusbar1.panels[3].text:='Фаза 38...';  delay(1);
     Datamodule1.IBTransaction2.Active:=False;
     MemMails.enablecontrols;
     ISPrint:=False;
     BtnExport.enabled:=Check.Checked and (mail_vid.value='2') and not MAIL_WYP;
  end;
 end;
end;

procedure TDoc_Email.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrValuta.close;
     QrPnTyp.close;
     MailTransaction.Active:=False;

end;

procedure TDoc_Email.MemMailsOnCalcFields(DataSet: TDataSet);
vaR
   Percent:Double;
begin
if CanRefresh then
begin
//     MemMails.fieldByname('num').AsInteger:=DataSet.RecNo;

     if MemMails.fieldByname('MONEY_ZAK').asfloat=0 then Percent:=100
     else Percent:=(MemMails.fieldByname('NEW_MROZ').asfloat-MemMails.fieldByname('MONEY_ZAK').asfloat)/(MemMails.fieldByname('MONEY_ZAK').asfloat/100);
     MemMails.fieldByname('TW_PERCENT').asfloat:=Percent;
     MemMails.fieldByname('TW_PRIBYL').asfloat:=MemMails.fieldbyname('TW_KOL').asfloat*(MemMails.fieldbyname('NEW_MROZ').asfloat-MemMails.fieldbyname('MONEY_ZAK').asfloat);
     MemMails.fieldByname('MAILS_WEIGHT').asfloat:=MemMails.fieldbyname('TW_KOL').asfloat*MemMails.fieldbyname('TW_WEIGHT').asfloat;

    if ( MemMails.fieldByname('money_zak').asfloat<>0) then
    begin
      edit1.Text:= floattostrf((MemMails.fieldByname('neW_money1').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
      floattostrf((MemMails.fieldByname('neW_money1').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
      edit2.Text:= floattostrf((MemMails.fieldByname('neW_money2').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
      floattostrf((MemMails.fieldByname('neW_money2').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
      edit3.Text:= floattostrf((MemMails.fieldByname('neW_money3').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
      floattostrf((MemMails.fieldByname('neW_money3').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
      edit7.Text:= floattostrf((MemMails.fieldByname('neW_money6').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
      floattostrf((MemMails.fieldByname('neW_money6').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
      edit8.Text:= floattostrf((MemMails.fieldByname('neW_money7').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
      floattostrf((MemMails.fieldByname('neW_money7').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
      edit9.Text:= floattostrf((MemMails.fieldByname('neW_money8').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
      floattostrf((MemMails.fieldByname('neW_money8').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';

      
      edit4.Text:= floattostrf((MemMails.fieldByname('NEW_MROZ').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
      floattostrf((MemMails.fieldByname('NEW_MROZ').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
      try
      edit6.Text:= floattostrf((MemMails.fieldByname('NEW_MROZ').asfloat-MemMails.fieldByname('neW_money4').asfloat)*100/MemMails.fieldByname('neW_money4').asfloat,fffixed,19,2)+'%, '+
      floattostrf((MemMails.fieldByname('NEW_MROZ').asfloat-MemMails.fieldByname('neW_money4').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
      except
      end;
      edit5.Text:= floattostrf((MemMails.fieldByname('neW_money4').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
      floattostrf((MemMails.fieldByname('neW_money4').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';

    end;


end;
end;

procedure TDoc_Email.DsMailsDataChange(Sender: TObject; Field: TField);
begin
     if (MemMails.State in [dsInsert]) and ( not CanInsert) then MemMails.Cancel;
end;

procedure TDoc_Email.BtnDicTowarClick(Sender: TObject);
var
   a:integer;
begin
     DicTowarSet:=1; {Ввод товаров из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.Treeview1.Tag:=0;
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
        for a:=1 to CNT_TW do begin
            delay(10);
            ADD_MAILS(ARR_TW[a].ID,ARR_TW[a].KOL);
        end;
     end;
end;

procedure TDoc_Email.ADD_MAILS(TW_ID:integer;KOL:double);
var
   TW_TEMP:integer;
   s4,TW_STR:ansistring;
   ISS:boolean;
   a:integer;
   KURS1,KURS2:double;
   ZAK,ZAKD:double;
   fq: FastQuery;
begin
  SAVE:=False;
  canrefresh:=false;
  if TW_ID<0 then begin
     {Добавляем товар не из каталога}
          {Надо спросить валюту}
          Application.createForm(TSET_NEW_TW,SET_NEW_TW);
          SET_NEW_TW.showModal;
          SET_NEW_TW.Destroy;
          CanInsert:=True;
          MemMails.Append;
          MemMails.Fieldbyname('MAILS_ID').asinteger:=-1;
          MemMails.Fieldbyname('TWKTG_COLOR').asinteger:=KTG_TMP2;
          MemMails.Fieldbyname('TWKTG_ID').asinteger:=KTG_TMP1;
          if ITMP1=1 then MemMails.Fieldbyname('TW_RASPR').asstring:='1'
                     else MemMails.Fieldbyname('TW_RASPR').asstring:='0';
          MemMails.Fieldbyname('TW_ID').asinteger:=-1;
          MemMails.Fieldbyname('TW_ART').asinteger:=0;
          MemMails.Fieldbyname('TW_NAM').asstring:='';
          MemMails.Fieldbyname('ED_SHORT').asstring:='';
          MemMails.Fieldbyname('TW_MROZ').asfloat:=0;
          MemMails.fieldByname('OST').asfloat:=0;
          MemMails.Fieldbyname('TW_KOL').asfloat:=1;
          MemMails.Fieldbyname('TW_KOL_OLD').asfloat:=MemMails.Fieldbyname('TW_KOL').asfloat;
          MemMails.Fieldbyname('MONEY_ZAK').asfloat:=0;
          MemMails.Fieldbyname('NEW_MROZ').asfloat:=0;
          MemMails.Fieldbyname('MAILS_SPEED').asfloat:=0;
          MemMails.Fieldbyname('MAILS_PRIM').asstring:='';
          MemMails.Fieldbyname('VALUTA_ID').asinteger:=IVALUTA_TMP;
          MemMails.Post;
          CanInsert:=False;
  end else begin

     {проверка дозволенности товара для данной фирмы (в расширенном режиме)}
     if FRM.Value='' then
     begin
     	Messbox('Не указана фирма!',  MessError, MB_OK);
        exit;
     end;
     

     TW_TEMP:=0;
     {Проверяем, нет ли в электронной почте уже такого товара}
     if MemMails.RecordCount>0 then TW_TEMP:=MemMails.fieldByname('TW_ID').asinteger;
     ISS:=false;
     MemMails.Disablecontrols;
     MemMails.first;
     while (not MemMails.eof) and (not ISS) do begin
           if MemMails.fieldByname('TW_ID').asinteger=TW_ID then begin
              ISS:=true;
              TW_STR:=MemMails.fieldByname('TW_ART').asstring+'-'+MemMails.fieldByname('TW_NAM').asstring;
           end;
           MemMails.next;
     end;
     MemMails.EnableControls;
     if ISS then Messbox('Сообщение почты уже содержит товар '+TW_STR+' и он не может быть добавлен!',MessSystem,48) else
     begin
          Query1Transaction.Active:=False;
          IbQuery1.Close;
          IbQuery1.SQL.clear;
          IbQuery1.SQL.add('select tw.tw_weight, tw.tw_raspr,twktg.twktg_id,twktg.twktg_color,tw.valuta_id,tw.tw_art,tw.tw_nam,tw.ed_id,ed.ed_short, '+
          ' (select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
          ' (select max(kurs_date) from kurs where '+
          ' tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz '+
          ' from tw,ed,twktg '+
          ' where tw.ed_id=ed.ed_id and tw.tw_id=:TW_ID and tw.twktg_id=twktg.twktg_id');
          IbQuery1.Parambyname('TW_ID').asinteger:=TW_ID;
          IbQuery1.Open;
          CanInsert:=True;
          MemMails.Append;
          {Добавляем данные распределения}
          Worktransaction.Active:=False;
          ADD_SQL(QueryWork,'select * from last_zak_frm(:tw_id, :frm_id)');
          QueryWork.ParamByname('tw_id').asinteger:=TW_ID;
          QueryWork.ParamByname('frm_id').asinteger:=GL_FRM_WORK_MODE;
          QueryWork.Open;
          if QueryWork.eof then begin
             ZAK:=0;
             ZAKD:=0;
          end else begin
              ZAK:=QueryWork.fieldByname('TW_MONEY').asfloat;
              ZAKD:=QueryWork.fieldByname('TW_MONEYD').asfloat;
          end;
          MemMails.Fieldbyname('RASP1').asstring:='/';
          MemMails.Fieldbyname('RASP2').asstring:='/';
          MemMails.Fieldbyname('RASP3').asstring:='/';
          MemMails.Fieldbyname('RASP4').asstring:='/';
          MemMails.Fieldbyname('RASP5').asstring:='/';
          MemMails.Fieldbyname('RASP6').asstring:='/';
          MemMails.Fieldbyname('RASP7').asstring:='/';
          MemMails.Fieldbyname('RASP8').asstring:='/';
          MemMails.Fieldbyname('RASP9').asstring:='/';
          MemMails.Fieldbyname('RASP10').asstring:='/';
          MemMails.Fieldbyname('RASP11').asstring:='/';
          MemMails.Fieldbyname('RASP12').asstring:='/';
          Worktransaction.Active:=False;
          ADD_SQL(QueryWork,'select * from twmin where tw_id=:tw_id');
          QueryWork.ParamByname('TW_ID').asinteger:=TW_ID;
          QueryWork.open;
          for a:=1 to CNT_SKL do begin
              if QueryWork.fieldByname('TW_MIN').asinteger=0 then s4:=''
                 else s4:=inttostr(QueryWork.fieldByname('TW_MIN').asinteger);
              if QueryWork.locate('SKL_ID',SKL[a],[]) then begin
                 case a of
                      1: MemMails.Fieldbyname('RASP1').asstring:='/'+s4;
                      2: MemMails.Fieldbyname('RASP2').asstring:='/'+s4;
                      3: MemMails.Fieldbyname('RASP3').asstring:='/'+s4;
                      4: MemMails.Fieldbyname('RASP4').asstring:='/'+s4;
                      5: MemMails.Fieldbyname('RASP5').asstring:='/'+s4;
                      6: MemMails.Fieldbyname('RASP6').asstring:='/'+s4;
                      7: MemMails.Fieldbyname('RASP7').asstring:='/'+s4;
                      8: MemMails.Fieldbyname('RASP8').asstring:='/'+s4;
                      9: MemMails.Fieldbyname('RASP9').asstring:='/'+s4;
                      10: MemMails.Fieldbyname('RASP10').asstring:='/'+s4;
                      11: MemMails.Fieldbyname('RASP11').asstring:='/'+s4;
                      12: MemMails.Fieldbyname('RASP12').asstring:='/'+s4;
                 end;
              end;
          end;
          MemMails.Fieldbyname('MAILS_ID').asinteger:=-1;
          if VALUTA_ID.value='0' then MemMails.Fieldbyname('OLD_MZAK').asfloat:=ZAK; {Рубли}
          if VALUTA_ID.value='1' then MemMails.Fieldbyname('OLD_MZAK').asfloat:=ZAKD; {Доллары}
          MemMails.Fieldbyname('MONEY_ZAK').asfloat:=0;
          {if VALUTA_ID.value='0' then MemMails.Fieldbyname('MONEY_ZAK').asfloat:=ZAK;} {Рубли}
          {if VALUTA_ID.value='1' then MemMails.Fieldbyname('MONEY_ZAK').asfloat:=ZAKD;} {Доллары}
          MemMails.Fieldbyname('TWKTG_COLOR').asinteger:=IbQuery1.Fieldbyname('TWKTG_COLOR').asinteger;
          MemMails.Fieldbyname('TWKTG_ID').asinteger:=IbQuery1.Fieldbyname('TWKTG_ID').asinteger;
          MemMails.Fieldbyname('TW_ID').asinteger:=TW_ID;
          MemMails.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
          MemMails.Fieldbyname('TW_WEIGHT').asfloat:=IbQuery1.Fieldbyname('TW_WEIGHT').asfloat;
          MemMails.Fieldbyname('TW_RASPR').asstring:=IbQuery1.Fieldbyname('TW_RASPR').asstring;
          MemMails.Fieldbyname('VALUTA_ID').asinteger:=IbQuery1.Fieldbyname('VALUTA_ID').asinteger;
          MemMails.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
          MemMails.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
          MemMails.Fieldbyname('TW_MROZ').asfloat:=IbQuery1.Fieldbyname('TW_MROZ').asfloat/VALUTA_KURS;

          fq:=FastQuery.Create('SELECT * FROM TW_PRICE_LIST_FRM(:TW_ID, :FRM_ID)');
          fq.ParamByName('TW_ID').asinteger:=TW_ID;
          fq.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;
          fq.Open;

          while not fq.eof do
          begin
            MemMails.Fieldbyname('MET_MONEY_SHOP').asinteger:=fq.Fieldbyname('MET_MONEY_SHOP').asinteger;
            if fq.FieldByName('TWPRICE_TYP').asinteger=1 then
              begin MemMails.Fieldbyname('NEW_MONEY1').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemMails.Fieldbyname('OLD_MONEY1').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            if fq.FieldByName('TWPRICE_TYP').asinteger=2 then
              begin MemMails.Fieldbyname('NEW_MONEY2').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemMails.Fieldbyname('OLD_MONEY2').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            if fq.FieldByName('TWPRICE_TYP').asinteger=3 then
              begin MemMails.Fieldbyname('NEW_MONEY3').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemMails.Fieldbyname('OLD_MONEY3').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            if fq.FieldByName('TWPRICE_TYP').asinteger=6 then
              begin MemMails.Fieldbyname('NEW_MONEY6').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemMails.Fieldbyname('OLD_MONEY6').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;

            if fq.FieldByName('TWPRICE_TYP').asinteger=7 then
              begin MemMails.Fieldbyname('NEW_MONEY7').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemMails.Fieldbyname('OLD_MONEY7').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            if fq.FieldByName('TWPRICE_TYP').asinteger=8 then
              begin MemMails.Fieldbyname('NEW_MONEY8').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemMails.Fieldbyname('OLD_MONEY8').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;



            if fq.FieldByName('TWPRICE_TYP').asinteger=4 then
              begin MemMails.Fieldbyname('NEW_MONEY4').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemMails.Fieldbyname('OLD_MONEY4').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            fq.next;
          end;
          fq.close;
          fq.Destroy;


          MemMails.fieldByname('OST').asfloat:=GetOst(TW_ID,0, gl_frm_work_mode);
          if KOL<0 then begin
             Application.createForm(TSET_KOLVO,SET_KOLVO);
             SET_KOLVO.NAME.text:=IbQuery1.fieldByname('TW_ART').asstring+
                            IbQuery1.fieldByname('TW_NAM').asstring;
             SET_KOLVO.showModal;
             if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
             MemMails.Fieldbyname('TW_KOL').asfloat:=SET_KOLVO.KOL.value;
             SET_KOLVO.destroy;
          end else MemMails.Fieldbyname('TW_KOL').asfloat:=KOL;
          MemMails.Fieldbyname('TW_KOL_OLD').asfloat:=MemMails.Fieldbyname('TW_KOL').asfloat;
          MemMails.Fieldbyname('NEW_MROZ').asfloat:=MemMails.Fieldbyname('TW_MROZ').asfloat;
          MemMails.Fieldbyname('MAILS_PRIM').asstring:='';
          ADD_SQL(QueryWork,'select speed_all from report_min_ost(:TW_ID,:MES, 0, 0, 0, null)');
          QueryWork.ParamByname('TW_ID').asinteger:=TW_ID;
          QueryWork.ParamByname('MES').asfloat:=ZAY_SPEED;
          QueryWork.open;
          if QueryWork.eof then MemMails.Fieldbyname('MAILS_SPEED').asfloat:=0
                           else MemMails.Fieldbyname('MAILS_SPEED').asfloat:=QueryWork.fieldByname('SPEED_ALL').asfloat;
          MemMails.Post;
          CanInsert:=False;
     end;
  end;
  IbQuery1.Close;
  RxDbGrid1.setfocus;

  CanRefresh:=true;
  BtnRefreshSumm.click;

end;

procedure TDoc_Email.Show_sost;
var
   s:ansistring;
   MailsEmpty:boolean;
   typ: integer;
begin
     if Doc_Email.Tag<0 then
       Doc_Email.caption:='Сообщение электронной почты. Новое'
     else begin
       case MAIL_SOST of
         0: Doc_Email.caption:='Сообщение электронной почты. Редактирование';
         1: Doc_Email.caption:='Сообщение электронной почты. Просмотр-ответ';
         2: Doc_Email.caption:='Сообщение электронной почты. Подпись';
         6: Doc_Email.caption:='Сообщение электронной почты. Утверждение';
         7: Doc_Email.caption:='Сообщение электронной почты. Просмотр отказанного';
         3: Doc_Email.caption:='Сообщение электронной почты. Оплата';
         4: Doc_Email.caption:='Сообщение электронной почты. Выполнение';
         5: Doc_Email.caption:='Сообщение электронной почты. Просмотр выполненного';
       end;
     end;
     if MemMails.RecordCount=0 then MailsEmpty:=true else MailsEmpty:=false;
     case Sost of
             0: begin
                   s:='Ожидание...';
                   Panel6.Color:=clBtnFace;
                   Panel6.Font.color:=ClWindowText;
                   Panel5.Color:=clBtnFace;
                   Panel5.Font.color:=ClWindowText;
                end;
             1: begin
                   s:='Ввод товаров...';
                   if TW_FON>=0 then Panel5.Color:=TW_FON;
                   if TW_COLOR>=0 then Panel5.Font.color:=TW_COLOR;
                   if TW_FON>=0 then Panel5.Color:=TW_FON;
                   if TW_COLOR>=0 then Panel5.Font.color:=TW_COLOR;
                end;
     end;
     StatusBar1.Panels[0].text:='Состояние: '+s;
     StatusBar1.Panels[1].text:=STR;


      TYP:=strtoint(Mail_vid.value);

      panel7.visible:= not (typ=7);
      panel8.visible:= not (typ=7);
      label24.Visible:= not (typ=7);
      label34.Visible:= not (typ=7);
      per_post_id.Visible:= not (typ=7);
      per_frm_id.Visible:= not (typ=7);


     //запрет создания распоряжений 23-10-2013
     if (strtoint(Mail_vid.value)=7) then//распоряжение
     begin

       if (not check_dostup('$MAIL.CREATE.VID7')) then
       begin

       end;
     end;


//     FRM.Enabled := MailsEmpty;
end;

procedure TDoc_Email.FormKeyPress(Sender: TObject; var Key: Char);
var
   ID:integer;
   N:integer;
begin
     if ((key=' ') and (rxdbgrid1.focused) and (MemMails.recordcount>0)) then RefreshFast;
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
             key:=#0;
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
                    ADD_MAILS(ID,-1);
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
  if key=#10 then begin
     key:=#0;
     try
       RxDbgrid1.setfocus;
       RxDbgrid2.setfocus;
     except
     end;
     if BTNSAVE.enabled then SelectSAVE;
  end;
  Show_Sost;
end;

procedure TDoc_Email.SelectSave;
begin
     {}
end;


procedure TDoc_Email.BtnSaveClick(Sender: TObject);
begin
 if not btnApply.Enabled then
  exit;
     Save:=False;
     BtnApply.click;
     if Save then close;
end;

procedure TDoc_Email.BtnSendClick(Sender: TObject);
begin
     TMPMAIL:=1;
     Save:=False;
     MAIL_DATE.date:=now();
     if MAIL_VID.value='3' then begin

        if  CheckZayMoney()  = 0 then
          Exit;


        {Заявка на закупку - готово для утверждения}
        MAIL_SOST:=2;                                   
     end else begin
        MAIL_SOST:=1;
     end;
     BtnApply.click;
     if SAVE then begin
        Messbox('Ваше сообщение отправлено адресату...',MessSystem,48);
        close;
     end;
end;

procedure TDoc_Email.BtnNoDicTowarClick(Sender: TObject);
begin
     Add_Mails(-1,0);
end;

procedure TDoc_Email.BtnRefreshSummClick(Sender: TObject);
var
   a,b:integer;
   r,p:double;
   weight: double;
begin
     SUMM.value:=0;
     ZAY_WEIGHT.value:=0;

     PRIBYL.value:=0;
     if MemMails.RecordCount>0 then begin
        a:=MemMails.recno;
        MemMails.disablecontrols;
        MemMails.first;
        r:=0; p:=0;      weight:=0;
        while not MemMails.eof do begin
          r:=r+MemMails.fieldbyname('TW_KOL').asfloat*MemMails.fieldbyname('MONEY_ZAK').asfloat;
          p:=p+MemMails.fieldbyname('TW_KOL').asfloat*(MemMails.fieldbyname('NEW_MROZ').asfloat-MemMails.fieldbyname('MONEY_ZAK').asfloat);
          weight:=weight+MemMails.fieldbyname('TW_KOL').asfloat*MemMails.fieldbyname('TW_WEIGHT').asfloat;
          MemMails.next;
        end;
        MemMails.first;
        for b:=2 to a do MemMails.next;
        SUMM.value:=r;
        ZAY_WEIGHT.value:=weight;
        Pribyl.value:=p;
        MemMails.Enablecontrols;
     end;
     ZAY_WEIGHT1.value:=ZAY_WEIGHT.value;
end;

procedure TDoc_Email.MemMailsAfterScroll(DataSet: TDataSet);
var
   EN,En2:boolean;
   TYP:integer;
begin
     Statusbar1.panels[2].text:='';
     if MemMails.recordcount>0 then begin
        TYP:=strtoint(Mail_vid.value);
        if TYP=3 then Statusbar1.panels[2].text:='Последняя закупка :'+floattostrf(MemMails.fieldByname('OLD_MZAK').asfloat,fffixed,19,4)+' '+QrValuta.fieldByname('VALUTA_SHORT').asstring;
        if ((TYP=3)  and (MemMails.fieldByname('money_zak').asfloat<>0)) then
        begin
          edit1.Text:= floattostrf((MemMails.fieldByname('neW_money1').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
          floattostrf((MemMails.fieldByname('neW_money1').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
          edit2.Text:= floattostrf((MemMails.fieldByname('neW_money2').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
          floattostrf((MemMails.fieldByname('neW_money2').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
          edit3.Text:= floattostrf((MemMails.fieldByname('neW_money3').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
          floattostrf((MemMails.fieldByname('neW_money3').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
          edit7.Text:= floattostrf((MemMails.fieldByname('neW_money6').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
          floattostrf((MemMails.fieldByname('neW_money6').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
          edit8.Text:= floattostrf((MemMails.fieldByname('neW_money7').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
          floattostrf((MemMails.fieldByname('neW_money7').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
          edit9.Text:= floattostrf((MemMails.fieldByname('neW_money8').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
          floattostrf((MemMails.fieldByname('neW_money8').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';

          edit4.Text:= floattostrf((MemMails.fieldByname('NEW_MROZ').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
          floattostrf((MemMails.fieldByname('NEW_MROZ').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
          try
          edit6.Text:= floattostrf((MemMails.fieldByname('NEW_MROZ').asfloat-MemMails.fieldByname('neW_money4').asfloat)*100/MemMails.fieldByname('neW_money4').asfloat,fffixed,19,2)+'%, '+
          floattostrf((MemMails.fieldByname('NEW_MROZ').asfloat-MemMails.fieldByname('neW_money4').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';
          except
          end;
          edit5.Text:= floattostrf((MemMails.fieldByname('neW_money4').asfloat-MemMails.fieldByname('money_zak').asfloat)*100/MemMails.fieldByname('money_zak').asfloat,fffixed,19,2)+'%, '+
          floattostrf((MemMails.fieldByname('neW_money4').asfloat-MemMails.fieldByname('money_zak').asfloat)*MemMails.fieldByname('tw_kol').asfloat,fffixed,19,2)+' руб';

        end;

     end else
     Timer1.enabled:=False;
     QrFastInfo.close;
     if MemMails.fieldByname('TW_ID').asinteger>0 then EN:=true else EN:=False;
     En2:=True;
     if MemMails.recordcount=0 then begin
        EN:=False;
        EN2:=False;
        VALUTA_ID.enabled:=True;
     end else VALUTA_ID.enabled:=False;
     BtnReal.enabled:=En and (TYP=3);
     MnReal.enabled:=En and (TYP=3);
     BtnDETAL.enabled:=EN and CANTW_DETAL;
     MnDETAL.enabled:=EN and CANTW_DETAL;
     BtnAnaliz.enabled:=EN and CANTW_ANALIZ;
     MnAnaliz.enabled:=EN and CANTW_ANALIZ;
     BtnMarketing.enabled:=EN and CANTW_MARKETING;
     MnMarketing.enabled:=EN and CANTW_MARKETING;
     BtnDel.enabled:=En2;
     MnDel.enabled:=En2;
     if EN then begin
        if ((MAIL_VID.value='2') or (MAIL_VID.value='3')) then QrFastInfo.ParamByname('SPEED').asinteger:=2
        else QrFastInfo.ParamByname('SPEED').asinteger:=1;
        QrFastInfo.ParamByname('TW_ID').asinteger:=MemMails.fieldByname('TW_ID').asinteger;
     end;
     if ShowOst.checked then Timer1.Enabled:=true;
end;

procedure TDoc_Email.BtnDetalClick(Sender: TObject);
begin
  SHOW_DETAL_TW(MemMails.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_Email.BtnAnalizClick(Sender: TObject);
begin
  SHOW_ANALIZ_TW(MemMails.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_Email.BtnMarketingClick(Sender: TObject);
begin
     SHOW_MARKETING_TW(MemMails.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_Email.BtnDelClick(Sender: TObject);
begin
     if Messbox('Удалить из сообщения товар "'+MemMails.fieldbyname('TW_ART').asstring+': '+
       MemMails.fieldbyname('TW_NAM').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
       if MemMails.fieldbyname('MAILS_ID').asinteger>0 then begin
         inc(CNT_DEL);
         MAILS_DEL[CNT_DEL]:=MemMails.fieldbyname('MAILS_ID').asinteger;
       end;
       MemMails.delete;
       BtnRefreshSumm.click;
     end;
     show_sost;

end;

procedure TDoc_Email.Timer1Timer(Sender: TObject);
begin
     Timer1.enabled:=False;
     RefreshFast;
end;

procedure TDoc_Email.BtnPostClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=POST_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>POST_ID then begin
        SAVE:=False;
        POST_ID:=DIC_KLIENT.tag;
        {Отображаем название фирмы и банка}
        Query1Transaction.Active:=False;
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select KLN_FULL FROM KLN_DATA( :KLN_ID)');
        IbQuery1.Parambyname('KLN_ID').asinteger:=POST_ID;
        IbQuery1.Open;
        POST_FULL.text:=IbQuery1.fieldByname('KLN_FULL').asstring;
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select KLN_EMAIL FROM KLN where KLN_ID=:KLN_ID');
        IbQuery1.Parambyname('KLN_ID').asinteger:=POST_ID;
        IbQuery1.Open;
        KLN_EMAIL.text:=IbQuery1.fieldByname('KLN_EMAIL').asstring;
        IbQuery1.Close;
     end;
     DIC_KLIENT.Destroy;

end;

procedure TDoc_Email.BtnToClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=TO_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>TO_ID then begin
        SAVE:=False;
        {Отображаем название фирмы и банка}
        WorkTransaction.Active:=False;
        QueryWork.Close;
        QueryWork.SQL.clear;
        QueryWork.SQL.add('select KLN_FULL FROM KLN_DATA( :KLN_ID)');
        QueryWork.Parambyname('KLN_ID').asinteger:=DIC_KLIENT.tag;
        QueryWork.Open;
        TO_TXT.text:=QueryWork.fieldByname('KLN_FULL').asstring;
        TO_ID:=DIC_KLIENT.tag;
        QueryWork.Close;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TDoc_Email.TO_TXTChange(Sender: TObject);
begin
     SAVE:=False;
     TO_ID:=0; {Сбросить, если пользователь вручную определил кому}
     if Pos('@',To_Txt.text)>0 then begin
        MAIL_VID.value:='5';
        MAIL_VIDChange(Sender);
     end;
     if Trim(AnsiUpperCase(TO_TXT.text))='ВСЕМ' then TO_ID:=-1;
     if Pos('@',To_Txt.text)>0 then TO_ID:=-2;

end;

procedure TDoc_Email.ToShopClick(Sender: TObject);
begin
     {Cписок складов}
     Application.createForm(TSelect_Shop,Select_shop);
     Select_Shop.top:=ToSHop.height+ToSHop.top+Tabsheet1.top+Pagecontrol1.top+Doc_Email.top+ToolBar1.Height+20;
     Select_Shop.Left:=ToSHop.Left+Tabsheet1.Left+Pagecontrol1.Left+Doc_Email.Left;
     Select_Shop.showModal;
     if Select_Shop.tag>0 then begin
        SAVE:=False;
        TO_TXT.text:=SHOP_TMP;
        TO_ID:=-Select_Shop.tag-2;
     end;
     Select_Shop.Destroy;

end;

procedure TDoc_Email.BtnPrintClick(Sender: TObject);
var TYP:integer;
begin
   ISPrint:=True;
   SAVE:=False;
   BtnApply.click;
   if SAVE then begin
     TYP:=strtoint(Mail_vid.value);
     if TYP=3 then begin
        Application.createForm(TSelect_Print,Select_Print);
        Select_Print.Position:=PoDesigned;
        Select_Print.top:=Doc_Email.top+BtnPrint.top+4+BtnPrint.Height;
        Select_Print.left:=Doc_Email.left+BtnPrint.left+4+BtnPrint.Width;
        Select_Print.Button1.caption:='Напечатать Заявку на закупку';
        Select_Print.Button2.caption:='Напечатать Факс заявки на закупку';
        Select_Print.Button3.caption:='Напечатать Задание экспедитору';
        Select_Print.showModal;
        if Select_Print.tag>0 then begin
              PRINT_MAILS2(Doc_Email.tag,Select_Print.tag);
        end;
        Select_Print.destroy;
     end else begin {Простая печать}
         PRINT_MAILS(DOC_EMAIL.tag);
     end;
   end;
end;

procedure TDoc_Email.BtnMoneyClick(Sender: TObject);
VAR
  M,N:integer;
begin
     SAVE:=False;
     {Определяем новые цены на товар}
     Application.createForm(TMAIL_NEW_MONEY,MAIL_NEW_MONEY);
     {Читаем данные}
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select valuta.valuta_id,valuta.valuta_short, '+
     ' (select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
     ' (select max(kurs_date) from kurs where '+
     '  valuta.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)) as kurs_kurs '+
     ' from valuta where valuta_id=:valuta_id');
     QueryWork.ParamByname('VALUTA_ID').asinteger:=MemMails.fieldByname('VALUTA_ID').asinteger;
     QueryWork.Open;
     TMP_COEFF:=QueryWork.FieldByname('KURS_KURS').asfloat;
     MAIL_NEW_MONEY.VALUTA.text:=QueryWork.FieldByname('VALUTA_SHORT').asstring;
     if strtoint(VALUTA_ID.VALUE)=0 then MAIL_NEW_MONEY.MON1.value:=MemMails.fieldByname('NEW_MROZ').asfloat/TMP_COEFF
     else MAIL_NEW_MONEY.MON1.value:=MemMails.fieldByname('NEW_MROZ').asfloat;
     MAIL_NEW_MONEY.MemMailsMon.EmptyTable;
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select * from mailsmon where mails_id=:mails_id order by tw_kol');
     QueryWork.ParamByname('MAILS_ID').asinteger:=MemMails.fieldByname('MAILS_ID').asinteger;
     QueryWork.Open;
     While not QueryWork.eof do begin
           CanInsertMon:=True;
           MAIL_NEW_MONEY.MemMailsMon.append;
           MAIL_NEW_MONEY.MemMailsMon.fieldByname('TW_KOL').asfloat:=QueryWork.fieldByname('TW_KOL').asfloat;
           MAIL_NEW_MONEY.MemMailsMon.fieldByname('MON1').asfloat:=MemMails.fieldByname('NEW_MROZ').asfloat-((MemMails.fieldByname('NEW_MROZ').asfloat/100)*QueryWork.fieldByname('TW_PERCENT').asfloat);
           MAIL_NEW_MONEY.MemMailsMon.fieldByname('MON2').asfloat:=MAIL_NEW_MONEY.MemMailsMon.fieldByname('MON1').asfloat*TMP_COEFF;
           MAIL_NEW_MONEY.MemMailsMon.fieldByname('PERCENT').asfloat:=QueryWork.fieldByname('TW_PERCENT').asfloat;
           MAIL_NEW_MONEY.MemMailsMon.fieldByname('PRIM').asstring:=QueryWork.fieldByname('MAILSMON_PRIM').asstring;
           MAIL_NEW_MONEY.MemMailsMon.Post;
           CanInsertMon:=False;
           QueryWork.next;
     end;
     MAIL_NEW_MONEY.MemMailsMon.first;
     MAIL_NEW_MONEY.showModal;
     if MAIL_NEW_MONEY.tag=2 then begin
        {Сохраняем заявку и цены нового товара}
        M:=MemMails.recno;
        BtnApply.click;
        MemMails.first;
        for N:=1 to M-1 do MemMails.next;
        begin
          Datamodule1.IBTransaction2.Active:=False;
          Datamodule1.IBTransaction2.StartTransaction;
          Try
             ADD_SQL(DataModule1.IbSaveSQL,'DELETE FROM MAILSMON WHERE MAILS_ID= :MAILS_ID');
             DataModule1.IbSaveSQL.ParamByname('MAILS_ID').asinteger:=MemMails.fieldByname('MAILS_ID').asinteger;
               DataModule1.IbSaveSQL.ExecSQL;
             MAIL_NEW_MONEY.MemMailsMon.first;
             while not MAIL_NEW_MONEY.MemMailsMon.eof do begin
                   IBSAVE_CLEAR;
                   IBSAVE_ADD('MAILS_ID',MemMails.fieldByname('MAILS_ID').asinteger);
                   IBSAVE_ADD('TW_KOL',MAIL_NEW_MONEY.MemMailsMon.fieldByname('TW_KOL').asfloat);
                   if MAIL_NEW_MONEY.MON2.value=0 then IBSAVE_ADD('TW_PERCENT',0) else
                   IBSAVE_ADD('TW_PERCENT',(MAIL_NEW_MONEY.MON2.value-MAIL_NEW_MONEY.MemMailsMon.fieldByname('MON2').asfloat)/(MAIL_NEW_MONEY.MON2.value/100));
                   IBSAVE_ADD('MAILSMON_PRIM',MAIL_NEW_MONEY.MemMailsMon.fieldByname('PRIM').asstring);
                   IBSAVE_DOC('MAILSMON',-1);
                   MAIL_NEW_MONEY.MemMailsMon.next;
             end;
             Datamodule1.IBTransaction2.Commit;
          Except
             Datamodule1.IBTransaction2.Rollback;
          End;
          Datamodule1.IBTransaction2.Active:=False;
        end;
     end;
     MAIL_NEW_MONEY.destroy;
end;

procedure TDoc_Email.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if MemMails.recordcount>0 then begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if (Field.FieldName='TW_ART')
        and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').asinteger>=0)
        then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').asinteger;
     if (Field.FieldName='MONEY_ZAK') and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MONEY_ZAK').asfloat>(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OLD_MZAK').asfloat)
        and (TW_COLOR6>=0)
        then BackGround:=TW_COLOR6;
     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
      if (Field.FieldName='TW_ART')
         and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').asinteger>=0)
         then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').asinteger;
     if (Field.FieldName='MONEY_ZAK') and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MONEY_ZAK').asfloat>(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OLD_MZAK').asfloat)
        and (TW_COLOR6>=0)
        then Afont.color:=TW_COLOR6;
     end;
     // Выделение цветом, если остаток+заказываемое количество больше, чем скорость продаж
     if (Field.FieldName='TW_KOL') and
     ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').asfloat+(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').asfloat>(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MAILS_SPEED').asfloat)
        then Background:=$00C58AFF;

       Afont.Style:=[];
       if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1') and
       (Field.Fieldname='NEW_MROZ') then begin
        BackGround:=$009FFF9F;
        Afont.Style:=[FsBold];
        Afont.color:=ClGreen;
       end;


  end;
end;

procedure TDoc_Email.VALUTA_IDChange(Sender: TObject);
var
   a,ID:integer;
   ZAK,ZAKD:double;
begin
  SAVE:=False;
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select valuta.valuta_id,valuta.valuta_short, '+
     ' (select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
     ' (select max(kurs_date) from kurs where '+
     '  valuta.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)) as kurs_kurs '+
     ' from valuta where valuta_id=:valuta_id');
     QueryWork.ParamByname('VALUTA_ID').asinteger:=strtoint(VALUTA_ID.value);
     QueryWork.Open;
     VALUTA_KURS:=QueryWork.FieldByname('KURS_KURS').asfloat;
     TMP_COEFF:=VALUTA_KURS;
     MemMailsNEW_MROZ.DisplayFormat:='#0.00 '+QrValuta.fieldByname('valuta_short').asstring;
     MemMailsTW_MROZ.DisplayFormat:='#0.00 '+QrValuta.fieldByname('valuta_short').asstring;
     MemMailsMONEY_ZAK.DisplayFormat:='#0.00 '+QrValuta.fieldByname('valuta_short').asstring;
     MemMailsTW_PRIBYL.DisplayFormat:='#0.00 '+QrValuta.fieldByname('valuta_short').asstring;
     {Просканировать товары и поменять цены и т.д}
     ID:=MemMails.recno;
     MemMails.disablecontrols;
     MemMails.first;
     WorkTransaction.Active:=False;
     while not MemMails.eof do begin
           if MemMails.fieldByname('TW_ID').asinteger>0 then begin
             ADD_SQL(QueryWork,'select (select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
             '(select max(kurs_date) from kurs where '+
             'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz '+
             ' from tw where tw_id=:tw_id');
             QueryWork.ParamByname('TW_ID').asinteger:=MemMails.fieldByname('TW_ID').asinteger;
             QueryWork.Open;
             MemMails.edit;
             MemMails.fieldByname('TW_MROZ').asfloat:=QueryWork.fieldByname('TW_MROZ').asfloat/VALUTA_KURS;
             ADD_SQL(QueryWork,'select * from last_zak_frm(:tw_id, :frm_id)');
             QueryWork.ParamByname('tw_id').asinteger:=MemMails.fieldByname('TW_ID').asinteger;
             QueryWork.paramByname('FRM_ID').asinteger:=GL_FRM_WORK_MODE;
             QueryWork.Open;
             if QueryWork.eof then begin
                ZAK:=0;
                ZAKD:=0;
             end else begin
                 ZAK:=QueryWork.fieldByname('TW_MONEY').asfloat;
                 ZAKD:=QueryWork.fieldByname('TW_MONEYD').asfloat;
             end;
             if VALUTA_ID.value='0' then MemMails.Fieldbyname('OLD_MZAK').asfloat:=ZAK; {Рубли}
             if VALUTA_ID.value='1' then MemMails.Fieldbyname('OLD_MZAK').asfloat:=ZAKD; {Доллары}
             MemMails.Post;
           end;
           MemMails.next;
     end;
     MemMails.first;
     for a:=1 to ID-1 do MemMails.next;
     MemMails.Enablecontrols;
end;

procedure TDoc_Email.BtnSubdocClick(Sender: TObject);
begin
     SAVE:=false;
     BtnApply.Click;
     if (SAVE) then begin
        {Создаём документ на основании имеющегося...}
        SUBDOC(6,DOC_Email.tag);
     end;
end;

procedure TDoc_Email.FormActivate(Sender: TObject);
var
   VID:integer;
begin
     {Устанавливаем закладку}
     VID:=strtoint(MAIL_VID.value);
     if VID=2 then Pagecontrol1.ActivePage:=Tabsheet3
     else
     if VID=3 then Pagecontrol1.ActivePage:=Tabsheet4
     else Pagecontrol1.ActivePage:=Tabsheet1;
end;

procedure TDoc_Email.ToolButton4Click(Sender: TObject);
begin
     My_lock;
end;

procedure TDoc_Email.N8Click(Sender: TObject);
begin
     if MemMails.recordcount>0 then begin
       if MemMails.fieldByname('TW_KOL').asfloat=MemMails.fieldByname('TW_KOL_OLD').asfloat
       then Messbox('Количество товара не изменено!',MessSystem,48)
       else Messbox('Первоначально было '+floattostrf(MemMails.fieldByname('TW_KOL_OLD').asfloat,fffixed,19,4)+' '+
       MemMails.fieldByname('ED_SHORT').asstring,MessSystem,48);
     end;
end;

procedure TDoc_Email.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (not Save) and (BtnApply.enabled) then begin
        if Messbox('Сообщение было изменено! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;

end;

procedure TDoc_Email.MAIL_TEMChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDoc_Email.MAIL_CONFClick(Sender: TObject);
begin
        SAVE:=False;
end;

procedure TDoc_Email.MAIL_REPLYClick(Sender: TObject);
begin
  SAVE:=False;
end;

procedure TDoc_Email.MAIL_TXTChange(Sender: TObject);
begin
 SAVE:=False;
end;

procedure TDoc_Email.SKL_FROMChange(Sender: TObject);
begin
     skl_from_frm := dataModule1.MainDicSkl.fieldbyname('skl_frm').asinteger;
  	 SAVE:=False;
end;

procedure TDoc_Email.SKL_TOChange(Sender: TObject);
begin
     skl_to_frm := dataModule1.MainDicSkl.fieldbyname('skl_frm').asinteger;
  	 SAVE:=False;

end;

procedure TDoc_Email.CheckClick(Sender: TObject);
begin
  SAVE:=False;
end;

procedure TDoc_Email.UTW_DATEChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TDoc_Email.WYP_DATEChange(Sender: TObject);
begin
  SAVE:=False;
end;

procedure TDoc_Email.OPL_DATEChange(Sender: TObject);
begin
  SAVE:=False;
end;

procedure TDoc_Email.OPLDO_DATEChange(Sender: TObject);
begin
  SAVE:=False;
end;

procedure TDoc_Email.MAILOPL_IDChange(Sender: TObject);
begin
  SAVE:=False;
end;

procedure TDoc_Email.SKL_RAZGChange(Sender: TObject);
begin
  	 SAVE:=False;
end;

procedure TDoc_Email.MAIL_OSNChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDoc_Email.PRIM1Change(Sender: TObject);
begin
  save:=false;
end;

procedure TDoc_Email.PRIM2Change(Sender: TObject);
begin
  save:=False;
end;

procedure TDoc_Email.BtnREALClick(Sender: TObject);
begin
     DET_REAL(MemMails.fieldbyname('TW_ID').asinteger,ZAY_SPEED);
end;

procedure TDoc_Email.BtnExportClick(Sender: TObject);
var
   ID:integer;
   r:double;
   MERR:integer;
   docs: string;

begin
   MERR:=0;
   if Messbox('Оформить на основании указанной заявки на перемещения накладную перемещения?',MessSubmit,4+48+256)=6 then begin
      BtnApply.click;
      if SAVE then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           ADD_SQL(DataModule1.IbSaveSQL,'select * from SUBDOC_MAIL_TO_PER1(:MAIL_ID,:SHOP_ID,:US_ID)');
           DataModule1.IbSaveSQL.ParamByname('MAIL_ID').asinteger:=DOC_EMAIL.tag;
           DataModule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
           DataModule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;
           DataModule1.IbSaveSQL.Open;
           if  Datamodule1.IbSaveSQL.Eof then
           	Messbox('Документы не оформлены',MessSystem,48)
            else
            begin

           		while not Datamodule1.IbSaveSQL.Eof do
           		begin
           			docs := docs + chr(13) +  DataModule1.IbSaveSQL.fieldByname('DOC_NUM_FULL').asstring;
            		Datamodule1.IbSaveSQL.Next;
           		end;
           		Messbox('Оформлены документы :' + docs+chr(13)+'от '+date_sokr(date()),MessSystem,48);
           end;
           Datamodule1.IbSaveSQL.Close;
           Datamodule1.IBTransaction2.Commit;
        Except
              inc(MERR);
              Datamodule1.IBTransaction2.Rollback;
              messbox('Ошибка оформления!',MessSystem,48);
        End;
        Datamodule1.IBTransaction2.Active:=False;
     end;
     if Messbox('Отметить заявку, как выполненную?',MessSubmit,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        Try
           IBSAVE_CLEAR;
           IBSAVE_ADD('MAIL_WYP','1');
           if IBSAVE_DOC('MAIL',DOC_EMAIL.tag)<0 then r:=Sqrt(-1);
           Datamodule1.IBTransaction2.commit;
        Except
           inc(MERR);
           Datamodule1.IBTransaction2.Rollback;
           messbox('Ошибка оформления!',MessSystem,48);
        End;
        Datamodule1.IBTransaction2.Active:=False;
        if MERR=0 then close;
     end;
   end;
end;

procedure TDoc_Email.UTW_NEWChange(Sender: TObject);
begin
  if UTW_NEW.itemindex<0 then UTW_NEW.itemindex:=0;
end;

procedure TDoc_Email.RefreshFast;
begin
     try
       QrFastInfo.close;
       if MemMails.recordCount>0 then begin
         FastInfoTransaction.Active:=False;
         QrFastInfo.Open;
       end;
     Except
     End;
end;


procedure TDoc_Email.MemMailsTW_KOLChange(Sender: TField);
begin
    if CanRefresh then
        BtnRefreshSumm.Click;

end;

procedure TDoc_Email.FRMChange(Sender: TObject);
begin
   	save:=false;
end;

function TDoc_email.CheckTwSaler: boolean;
var last_no, b: integer;
     iss: boolean;
     badCnt: integer;
begin
  result:=true;

  if FRM.value = '2646742' then exit;

  last_no:=MemMails.recno;
  MemMails.disablecontrols;
  MemMails.first;
  badTW:= '';
  badCnt:=0;
  while not MemMails.eof do
  begin
    begin
        iss:=false;
     	  QueryWork.Transaction.active:=false;
        QueryWork.SQL.Text:='SELECT TW_ART FROM TW WHERE TW_ID=:TW_ID AND TW_SALER_ID=:FRM_ID';
        QueryWork.ParamByName('TW_ID').asinteger := memmails.fieldbyname('tw_id').asinteger;
        QueryWork.ParamByName('FRM_ID').asinteger := strtoint(FRM.Value);
        QueryWork.Open;
        if QueryWork.Eof then
           ISS:=true;
        QueryWork.close;
        if ISS then
        begin
          inc(badCnt);
          if badCnt < 20 then
            badTW := badTW + memmails.fieldbyname('TW_NAM').asstring+chr(13);


        end;
     end;

    memmails.Next;
  end;

  MemMails.first;
  for b:=2 to last_no do MemMails.next;
  MemMails.enablecontrols;

  if badTW <> '' then
  begin
    if badCnt > 19 then
      badTw := badTw +'....................'+chr(13)+ '(Всего '+inttostr(badCnt)+' неверных товаров)';

    application.messagebox(pchar('Указанные товары не могут быть проданы в выбранной фирме'+chr(13)+badTW), 'Ошибка', MB_OK + MB_ICONSTOP);
    result := false;

  end;

end;

procedure TDoc_Email.Button1Click(Sender: TObject);
var fieldDest, fieldSource: string;
  newValue: double;
begin
  if ((((price_dest.ItemIndex=-1)
  or (price_source.ItemIndex=-1))
  or (price_round_type.ItemIndex=-1)
  or (memMails.RecordCount=0))) then
    exit;



  case price_dest.ItemIndex of
  0: fieldDest:='NEW_MROZ';
  1: fieldDest:='NEW_MONEY1';
  2: fieldDest:='NEW_MONEY2';
  3: fieldDest:='NEW_MONEY3';
  4: fieldDest:='NEW_MONEY4';
  5: fieldDest:='NEW_MONEY6';
  6: fieldDest:='NEW_MONEY7';
  7: fieldDest:='NEW_MONEY8';
  end;


  case price_source.ItemIndex of
  0:  fieldSource:='money_zak';
  1:  fieldSource:='TW_MROZ';
  2:  fieldSource:='old_money1';
  3:  fieldSource:='old_money2';
  4:  fieldSource:='old_money3';
  5:  fieldSource:='old_money4';
  6:  fieldSource:='old_money6';
  7:  fieldSource:='old_money7';
  8:  fieldSource:='old_money8';
  end;



  memMails.First;
  while not memMails.Eof do
  begin

    memMails.Edit;


    newValue:=memMails.FieldByName(fieldSource).asfloat * (price_percent.Value+100)/100;;

   case price_round_type.ItemIndex of
   0: newValue:=  int(newValue+0.999999);
   1: newValue:=  int(newValue/10+0.999999)*10;
   2: newValue:=  int(newValue);
   3: newValue:=  int(newValue/10)*10;
   4: newValue:=  int(newValue*100)/100;
   5: newValue:=  int((newValue*10+0.99999))/10;
   6: newValue:=  int(newValue*10)/10;
   end;


   memMails.fieldByName(fieldDest).asfloat:=newValue;

    memMails.Post;

    memMails.Next;
  end;
  memMails.First;

end;

procedure TDoc_Email.N11Click(Sender: TObject);
begin
//

 QueryWork.Transaction.active:=false;
 ADD_SQL(QueryWork,'select * from last_zak_frm(:tw_id, :frm_id)');
 QueryWork.Transaction.StartTransaction;
 memMails.First;
 while not memMails.Eof do
 begin


        QueryWork.ParamByName('TW_ID').asinteger := memmails.fieldbyname('tw_id').asinteger;
        QueryWork.ParamByName('FRM_ID').asinteger := GL_FRM_WORK_MODE;
        querywork.Open;
        memMails.Edit;
        memMails.FieldByName('OLD_MZAK').asFloat:=queryWork.FieldByName('tw_money').asFloat;
        memMails.post;

        QueryWork.Close;
  memMails.Next;
 end;

 QueryWork.Transaction.Commit;

end;

procedure TDoc_Email.PER_POST_IDChange(Sender: TObject);
begin
  	 SAVE:=False;
end;

procedure TDoc_Email.PER_FRM_IDChange(Sender: TObject);
begin
  	 SAVE:=False;
end;

procedure TDoc_Email.Button2Click(Sender: TObject);
var d: TTEXT_EDIT_DIALOG;

  iddd: integer;
begin

  begin

   if (mail_sost=2) and Check_Dostup('$MAIL.COMMENT') then

   begin

      d:=TTEXT_EDIT_DIALOG.Create(nil);
      d.OKBtn.Enabled:=( (mail_sost=2) and Check_Dostup('$MAIL.COMMENT') );

      if d.ShowModal = mrOK then
      begin
        try

      IBSAVE_CLEAR;
      IBSAVE_ADD('US_ID', USERID);
      IBSAVE_ADD('US_FIO', USERFIO);
      IBSAVE_ADD('COMMENT', d.Memo1.Text);
      IBSAVE_ADD('SOGL', d.RadioGroup1.ItemIndex);

      if (d.RadioGroup1.ItemIndex<>-1) then
        IBSAVE_ADD('SOGL_TXT', d.RadioGroup1.Items[d.RadioGroup1.ItemIndex]);

      IBSAVE_ADD('MAIL_ID', self.Tag);

      iddd := -1;



      IBSAVE_DOC('MAIL_COMMENT', iddd);

      Datamodule1.IBTransaction2.Commit;
      Except
        on e: Exception do
        begin
          Messbox('Ошибка при записи комментария!'+chr(13)+'Описание ошибки: '+e.message,MessSystem,16);
          Datamodule1.IBTransaction2.Rollback;
         end
      End;

     TabSheet5Show(nil);
      end;
    end;
  end;
end;

procedure TDoc_Email.memCommentsCalcFields(DataSet: TDataSet);
begin
  if memComments.FieldByName('SOGL').asInteger=1 then
    memComments.FieldByName('SOGL_TXT').asString:='Согласована';
  if memComments.FieldByName('SOGL').asInteger=0 then
    memComments.FieldByName('SOGL_TXT').asString:='Отказана'


end;

procedure TDoc_Email.gridCommentsDblClick(Sender: TObject);

 var d: TTEXT_EDIT_DIALOG;
 iddd: integer;
begin
//  if Column.Field.FullName='COMMENT' then

  if memComments.RecordCount=0 then
  begin
    Button2.Click;
  end
  else
  begin
    d:=TTEXT_EDIT_DIALOG.Create(nil);

    d.Memo1.Text:=memComments.FieldByName('COMMENT').asString;

    d.RadioGroup1.ItemIndex:=memComments.FieldByName('SOGL').asInteger;

    if memComments.FieldByName('KLN_ID').asInteger<>USERID then
      d.OKBtn.Enabled:=false;

    d.OKBtn.Enabled:=( (mail_sost=2) and Check_Dostup('$MAIL.COMMENT') );
      



    if d.ShowModal = mrOK then
    begin

      try

      IBSAVE_CLEAR;
      IBSAVE_ADD('US_ID', USERID);
      IBSAVE_ADD('US_FIO', USERFIO);
      IBSAVE_ADD('COMMENT', d.Memo1.Text);
      IBSAVE_ADD('SOGL', d.RadioGroup1.ItemIndex);
      if (d.RadioGroup1.ItemIndex<>-1) then
        IBSAVE_ADD('SOGL_TXT', d.RadioGroup1.Items[d.RadioGroup1.ItemIndex]);

      IBSAVE_ADD('MAIL_ID', self.Tag);

      iddd := -1;
      if memComments.RecordCount>0 then
        iddd := memComments.FieldByName('MAIL_COMMENT_ID').asInteger;


      IBSAVE_DOC('MAIL_COMMENT', iddd);

      Datamodule1.IBTransaction2.Commit;



      Except
        on e: Exception do
        begin
          Messbox('Ошибка при записи комментария!'+chr(13)+'Описание ошибки: '+e.message,MessSystem,16);
          Datamodule1.IBTransaction2.Rollback;
         end
      End;

     TabSheet5Show(nil);




    end;
  end;
end;

procedure TDoc_Email.TabSheet5Show(Sender: TObject);
var
  cnt_sogl_magaz: integer; //согласования сотрудниками магазина
  cnt_sogl_torg_opt: integer; //согласования сотрудниками магазина
  cnt_skl_sogl: integer; //согласования сотрудниками склада
  cnt_opt_sogl: integer; //согласования закупщиками опта
  cnt_roz_sogl: integer; //согласования закупщиками розницы


  block_sogl: integer;

  cnt_level6_utw: integer;//количество утвердивших которые обязательно должны утвердить для розницы
  cnt_level7_utw: integer;//количество утвердивших которые обязательно должны утвердить для Всех заявок (куликов 01-11-2014)

begin
    CheckListBox1.Items.Clear;

    CheckListBox1.Items.Add('Сотрудник склада');   //есть ли место на складе
    CheckListBox1.Items.Add('Закупщик опта');     //продастся ли оптом
    CheckListBox1.Items.Add('Закупщик розницы');  //продастся ли в розницу
    CheckListBox1.Items.Add('Продавец магазина');  //продастся ли в розницу
    CheckListBox1.Items.Add('Продавец опта');  //продастся ли в розницу
    CheckListBox1.Items.Add('ОДИН ИЗ ОБЯЗАТЕЛЬНЫХ ДЛЯ ЗАЯВОК РОЗНИЦЫ');  //если никого нет - к директору не попадает
    CheckListBox1.Items.Add('ОДИН ИЗ ОБЯЗАТЕЛЬНЫХ ДЛЯ ЗАЯВОК ОПТА');  //если никого нет - к директору не попадает

    CheckListBox1.Enabled:=false;

  Query1Transaction.Active:=false;
  ibquery1.SQL.Text:='SELECT * FROM MAIL_COMMENT WHERE MAIL_ID=:MAIL_ID ORDER BY TM';

  ibquery1.ParamByName('MAIL_ID').asInteger:=self.Tag;

  ibquery1.Open;

  memComments.EmptyTable;

  cnt_sogl_magaz:=0;
//01-07-2013 - по просьбе Куликова всегда нужны соглосования
//  cnt_skl_sogl:=1;
  cnt_skl_sogl:=1;
  cnt_opt_sogl:=0;
  cnt_roz_sogl:=0;
  cnt_sogl_torg_opt:=0;

  cnt_level6_utw:=0;
  cnt_level7_utw:=0;

  block_sogl:=0;        //блокиратор согласования - если есть отказ


//09-04-2015 - Куликов. Согласования склада нужны только для склада

  if strtoint('0'+skl_razg.Value) =25 then
    cnt_skl_sogl:=0;
  if strtoint('0'+skl_razg.Value) =1322018 then
    cnt_skl_sogl:=0;


  if strtoint('0'+skl_razg.Value) =29 then      //склад 0 - прямые поставки оптового отдела. без согласований розницы и склада
  begin
  //согласовано с куликовым 14.08.2015
//    cnt_skl_sogl :=1; //'Сотрудник склада');
//23-09-2015 - для 0 склада все равно нужно согласование склада? странно, но сделал
    cnt_skl_sogl:=0;
    cnt_opt_sogl :=1; //  Закупщик опта
//    cnt_roz_sogl :=1; //   Закупщик розницы
    cnt_sogl_magaz :=1; //   Продавец магазина
//    cnt_sogl_torg_opt :=1; // Продавец опта
    cnt_level6_utw :=1; //  ОДИН ИЗ ОБЯЗАТЕЛЬНЫХ ДЛЯ ЗАЯВОК РОЗНИЦЫ
//    cnt_level7_utw :=1; //  ОДИН ИЗ ОБЯЗАТЕЛЬНЫХ ДЛЯ ЗАЯВОК ОПТА


//    cnt_skl_sogl:=1;
//        cnt_opt_sogl
  //  cnt_sogl_magaz:=1;
//    cnt_roz_sogl:=1;
//    cnt_level6_utw:=1;
//20-05 - убрано по умолчанию обязательный от опта    cnt_level7_utw:=1;
  end;


  if (chk_forOOP.Checked) then  //20-05-2015 - Куликов. Закупки "для ООП" - упрощеное согласование, только
  begin
  //согласовано с куликовым 14.08.2015
    cnt_skl_sogl :=1; //'Сотрудник склада');
    cnt_opt_sogl :=1; //  Закупщик опта
    cnt_roz_sogl :=1; //   Закупщик розницы
    cnt_sogl_magaz :=1; //   Продавец магазина
//    cnt_sogl_torg_opt :=1; // Продавец опта
    cnt_level6_utw :=1; //  ОДИН ИЗ ОБЯЗАТЕЛЬНЫХ ДЛЯ ЗАЯВОК РОЗНИЦЫ
//    cnt_level7_utw :=1; //  ОДИН ИЗ ОБЯЗАТЕЛЬНЫХ ДЛЯ ЗАЯВОК ОПТА
  end;


  //для опта не требуется согласование розницы
  {14-10-2014 обязательные согласования для закупок опта

  if (MAIL_OPT_ROZN.ItemIndex = 1) then
  begin
        cnt_level6_utw:=1;
  end;
  }
//09-04-2015 куликов - оптовый утвердитель - только оптовые заявки
  if (MAIL_OPT_ROZN.ItemIndex = 0) then
  begin
        cnt_level7_utw:=1;
  end;






  while not ibquery1.eof do
  begin

    memComments.Append;
    memComments.FieldByName('SOGL').asInteger:=ibquery1.FieldByName('SOGL').asInteger;
    memComments.FieldByName('kln_id').asInteger:=ibquery1.FieldByName('US_ID').asInteger;
    memComments.FieldByName('MAIL_COMMENT_ID').asInteger:=ibquery1.FieldByName('MAIL_COMMENT_ID').asInteger;
    memComments.FieldByName('TM').asDateTime:=ibquery1.FieldByName('TM').asDateTime;
    memComments.FieldByName('COMMENT').asString:=ibquery1.FieldByName('COMMENT').asString;
    memComments.FieldByName('US_FIO').asString:=ibquery1.FieldByName('US_FIO').asString;
    memComments.Post;


{
    ZAY_EMAIL.Items.Add('Сотрудник склада');  cnt_skl_sogl    //есть ли место на складе
    ZAY_EMAIL.Items.Add('Закупщик опта');  cnt_opt_sogl   //продастся ли оптом
    ZAY_EMAIL.Items.Add('Закупщик розницы'); cnt_roz_sogl //продастся ли в розницу
    ZAY_EMAIL.Items.Add('Продавец магазина'); cnt_sogl_magaz  //продастся ли в розницу
    ZAY_EMAIL.Items.Add('Продавец опта'); cnt_sogl_torg_opt  //продастся ли в розницу
    ZAY_EMAIL.Items.Add('ОДИН ИЗ ОБЯЗАТЕЛЬНЫХ ДЛЯ ЗАЯВОК РОЗНИЦЫ'); cnt_level6_utw //если никого нет - к директору не попадает
    ZAY_EMAIL.Items.Add('ОДИН ИЗ ОБЯЗАТЕЛЬНЫХ ДЛЯ ЗАЯВОК ОПТА'); cnt_level7_utw //если никого нет - к директору не попадает



    ZAY_EMAIL.Checked[0]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL1', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[1]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL2', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[2]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL3', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[3]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL4', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[4]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL5', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[5]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL6', USERS.fieldbyname('KLN_ID').asinteger) =1);
    ZAY_EMAIL.Checked[6]:=(check_user_dostup('$MAIL.ZAY_UTV_LEVEL7', USERS.fieldbyname('KLN_ID').asinteger) =1);
}


   if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL1',mail_us_id)=1) then
        cnt_skl_sogl:=  cnt_skl_sogl + 1;
   if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL2', mail_us_id)=1) then
        cnt_opt_sogl:=  cnt_opt_sogl + 1;
   if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL3',mail_us_id)=1) then
        cnt_roz_sogl:=  cnt_roz_sogl + 1;
   if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL4',mail_us_id)=1) then
        cnt_sogl_magaz:=  cnt_sogl_magaz + 1;
   if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL5',mail_us_id)=1) then
        cnt_sogl_torg_opt:=  cnt_sogl_torg_opt + 1;
   if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL6',mail_us_id)=1) then
        cnt_level6_utw:=  cnt_level6_utw + 1;
   if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL7',mail_us_id)=1) then
        cnt_level7_utw:=  cnt_level7_utw + 1;




    if ibquery1.FieldByName('SOGL').asInteger=1 then
    begin
//      cnt_sogl_magaz:=  cnt_sogl_magaz + 1;

//    if (ibquery1.FieldByName('SOGL').asInteger=1) then

      if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL1',ibquery1.FieldByName('US_ID').asInteger)=1) then
        cnt_skl_sogl:=  cnt_skl_sogl + 1;
      if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL2', ibquery1.FieldByName('US_ID').asInteger)=1) then
        cnt_opt_sogl:=  cnt_opt_sogl + 1;
      if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL3',ibquery1.FieldByName('US_ID').asInteger)=1) then
        cnt_roz_sogl:=  cnt_roz_sogl + 1;
      if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL4',ibquery1.FieldByName('US_ID').asInteger)=1) then
        cnt_sogl_magaz:=  cnt_sogl_magaz + 1;
      if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL5',ibquery1.FieldByName('US_ID').asInteger)=1) then
        cnt_sogl_torg_opt:=  cnt_sogl_torg_opt + 1;
      if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL6',ibquery1.FieldByName('US_ID').asInteger)=1) then
        cnt_level6_utw:=  cnt_level6_utw + 1;
      if (CHECK_USER_DOSTUP('$MAIL.ZAY_UTV_LEVEL7',ibquery1.FieldByName('US_ID').asInteger)=1) then
        cnt_level7_utw:=  cnt_level7_utw + 1;
    end
    else
    block_sogl:=-100;



    ibquery1.Next;
  end;

  ibquery1.Close;

  ///здесь только для заявок на оплату надо проверить, сколько согласований.
  //если мало - кнопку не открывать.
  if MAIL_VID.value='3' then
//  if not MAIL_SOST in [2,3,4,5,6,7] then
  if MAIL_SOST=2 then  //todo
  begin

    if ( block_sogl +  cnt_sogl_magaz + cnt_opt_sogl + cnt_roz_sogl + cnt_skl_sogl + cnt_sogl_torg_opt>=5) then
    begin
        btnApply.Enabled:=true;
        btnSave.Enabled:=true;
        btnPrint.Enabled:=true;
    end;


    if cnt_sogl_magaz<1 then
    begin
    btnApply.Enabled:=false;
    btnPrint.Enabled:=false;
    btnSave.Enabled:=false;
    end;

    if cnt_skl_sogl<1 then
    begin
    btnApply.Enabled:=false;
    btnPrint.Enabled:=false;
    btnSave.Enabled:=false;
    end;

    if cnt_opt_sogl<1 then
    begin
    btnApply.Enabled:=false;
    btnPrint.Enabled:=false;
    btnSave.Enabled:=false;;
    end;

    if cnt_roz_sogl<1 then
    begin
    btnApply.Enabled:=false;
    btnPrint.Enabled:=false;
    btnSave.Enabled:=false;
    end;

    if cnt_sogl_torg_opt<1 then
    begin
    btnApply.Enabled:=false;
    btnPrint.Enabled:=false;
    btnSave.Enabled:=false;
    end;

    if cnt_level6_utw<1 then
    begin
    btnApply.Enabled:=false;
    btnPrint.Enabled:=false;
    btnSave.Enabled:=false;
    end;

    if cnt_level7_utw<1 then
    begin
    btnApply.Enabled:=false;
    btnPrint.Enabled:=false;
    btnSave.Enabled:=false;
    end;





  end;

   if ( cnt_skl_sogl> 0) then checklistbox1.Checked[0]:=true;
   if ( cnt_opt_sogl> 0) then checklistbox1.Checked[1]:=true;
   if ( cnt_roz_sogl> 0) then checklistbox1.Checked[2]:=true;
   if ( cnt_sogl_magaz> 0) then checklistbox1.Checked[3]:=true;
   if ( cnt_sogl_torg_opt> 0) then checklistbox1.Checked[4]:=true;
   if ( cnt_level6_utw> 0) then checklistbox1.Checked[5]:=true;
   if ( cnt_level7_utw> 0) then checklistbox1.Checked[6]:=true;



end;



procedure TDoc_Email.MAIL_OPT_ROZNChange(Sender: TObject);
begin
         if (MAIL_OPT_ROZN.ItemIndex=1) then
         begin
                frm.Value := '2697090';
                UTW_NEW.itemindex:=2;
         end
end;

procedure TDoc_Email.MemMailsBeforeScroll(DataSet: TDataSet);
begin
//if DataSet.Eof then
 //   Abort;
end;

procedure TDoc_Email.MemMailsAfterInsert(DataSet: TDataSet);
begin
 if (MemMails.State in [dsInsert,DsEdit]) then
        MemMails.fieldByname('num').AsInteger:=DataSet.RecNo;
end;

end.
