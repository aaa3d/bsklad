unit DocRemon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, CurrEdit, Mask, ToolEdit, RxLookup, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,Data1,B_DBUtils,B_Utils, Db,
  IBCustomDataSet, IBQuery, RxMemDS, IBDatabase,DetalTW, Menus,SetSkid,VclUtils;

type
  TDoc_Remon = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    FRM_NAME: TEdit;
    Label8: TLabel;
    REMON_OSN: TMemo;
    Label10: TLabel;
    REMON_NUM: TEdit;
    Label11: TLabel;
    REMON_DATE: TDateEdit;
    Btn_DicTow: TToolButton;
    Btn_DelTow: TToolButton;
    ToolButton4: TToolButton;
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
    IBQuery1: TIBQuery;
    MemREMONS: TRxMemoryData;
    DsRemons: TDataSource;
    MemREMONSTW_ID: TIntegerField;
    MemREMONSTW_NAM: TStringField;
    MemREMONSED_SHORT: TStringField;
    MemREMONSREMONS_ID: TIntegerField;
    MemREMONSTW_ART: TIntegerField;
    RemonDocTransaction: TIBTransaction;
    Query1Transaction: TIBTransaction;
    IBQuery2: TIBQuery;
    PopupMenu1: TPopupMenu;
    MnSave: TMenuItem;
    MnApply: TMenuItem;
    N6: TMenuItem;
    MnPrint: TMenuItem;
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
    MemREMONSOST: TFloatField;
    ToolButton2: TToolButton;
    Btn_RefreshOst: TToolButton;
    MnRefreshOst: TMenuItem;
    N3: TMenuItem;
    BTN_FRM: TBitBtn;
    N2: TMenuItem;
    MnFRM: TMenuItem;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Panel3: TPanel;
    RxDBGrid2: TRxDBGrid;
    Timer1: TTimer;
    FastInfoTransaction: TIBTransaction;
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
    DsFastInfo: TDataSource;
    RxDBGrid1: TRxDBGrid;
    IBQuery3: TIBQuery;
    MemREMONSTW_COLOR: TIntegerField;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    MemREMONSOLD_MONEY: TFloatField;
    MemREMONSNEW_MONEY: TFloatField;
    N8: TMenuItem;
    MnProw: TMenuItem;
    MemREMONSREMONS_PRIM: TStringField;
    Label1: TLabel;
    RemonTransaction: TIBTransaction;
    IbOwnerList: TIBQuery;
    IbOwnerListOWNER_ID: TIntegerField;
    IbOwnerListOWNER_NAME: TIBStringField;
    DsOwnerList: TDataSource;
    REMON_OWNER: TRxDBLookupCombo;
    GroupBox1: TGroupBox;
    REMON_SHOP: TRxDBLookupCombo;
    SHOP2: TRadioButton;
    SHOP1: TRadioButton;
    MemREMONSMET_MONEY_SHOP: TStringField;
    Timer2: TTimer;
    MemREMONSneW_money1: TFloatField;
    MemREMONSold_money1: TFloatField;
    MemREMONSnew_money2: TFloatField;
    MemREMONSold_money2: TFloatField;
    MemREMONSnew_money3: TFloatField;
    MemREMONSold_money3: TFloatField;
    MemREMONSnew_money5: TFloatField;
    MemREMONSold_money4: TFloatField;
    MemREMONSnew_money4: TFloatField;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    MemREMONSold_money6: TFloatField;
    MemREMONSnew_money6: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure Show_Sost;
    Procedure Change_FRMKln(ID:integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_FRMClick(Sender: TObject);
    procedure Btn_ApplyClick(Sender: TObject);
    procedure MemREMONSTW_IDChange(Sender: TField);
    procedure Btn_SAVEClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DsRemonsDataChange(Sender: TObject; Field: TField);
    procedure Btn_DelTowClick(Sender: TObject);
    procedure Btn_DetalClick(Sender: TObject);
    procedure ADD_REMONS(TW_ID:integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_PrintClick(Sender: TObject);
    procedure Btn_DicTowClick(Sender: TObject);
    procedure Btn_AnalizClick(Sender: TObject);
    procedure Btn_MarketingClick(Sender: TObject);
    procedure Btn_PrintCennClick(Sender: TObject);
    procedure Btn_PrintCennMoreClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_RefreshOstClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MemREMONSAfterPost(DataSet: TDataSet);
    procedure MemREMONSAfterDelete(DataSet: TDataSet);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ToolButton6Click(Sender: TObject);
    procedure Btn_ProwClick(Sender: TObject);
    procedure SHOP2Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CanTimer:boolean;
  CanInsert:Boolean=False;
  REMONS_DEL:array[1..10000] of integer;
  CNT_DEL:integer=0;
  SAVE:boolean;
  Doc_Remon: TDoc_Remon;
  Sost:integer=0;
  FRM_ID:integer;
  SHOP_ID:integer;
  REMON_NUMS:integer;
  REMON_PROW:boolean;
  STR:ansistring='';

implementation

uses Mainform, DicKlient, ANALIZTW, DicTowar, SelectPrint, PrintDoc;

{$R *.DFM}


var
  CountBox1:integer;
  
procedure TDoc_Remon.Show_sost;
var
   s:ansistring;
   RemonEmpty:boolean;
   c:integer;
   SHOW_COLUMN:ansistring;
begin
     if Doc_Remon.Tag<0 then
       Doc_Remon.caption:='Акт переоценки. Новый'
     else begin
          if REMON_PROW then Doc_REMON.caption:='Акт переоценки. Редактирование'
                        else Doc_REMON.caption:='Акт переоценки. Просмотр';
     end;
     if MemREMONS.RecordCount=0 then RemonEmpty:=true else RemonEmpty:=false;
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
     StatusBar1.Panels[0].text:='Состояние: '+s;
     StatusBar1.Panels[1].text:=STR;
     Btn_PROW.enabled:=(not RemonEmpty) and (not REMON_PROW);
     MnPROW.enabled:=(not RemonEmpty) and (not REMON_PROW);
     Btn_SAVE.enabled:=(not RemonEmpty) and (not REMON_PROW);
     MnSAVE.enabled:=(not RemonEmpty) and (not REMON_PROW);
     Btn_Apply.enabled:=(not RemonEmpty) and (not REMON_PROW);
     MnApply.enabled:=(not RemonEmpty) and (not REMON_PROW);
     Btn_Print.enabled:=not RemonEmpty;
     MnPrint.enabled:=not RemonEmpty;
     Btn_RefreshOst.enabled:=(not RemonEmpty) and (not REMON_PROW);
     MnRefreshOst.enabled:=(not RemonEmpty) and (not REMON_PROW);
     Btn_DicTow.enabled:=(not REMON_PROW);
     MnTw.enabled:=(not REMON_PROW);
     Btn_DelTow.enabled:=(not RemonEmpty) and (not REMON_PROW);
     MnDel.enabled:=(not RemonEmpty) and (not REMON_PROW);
     Btn_DETAL.enabled:=not RemonEmpty and CANTW_DETAL;
     MnDETAL.enabled:=not RemonEmpty and CANTW_DETAL;
     Btn_Analiz.enabled:=not RemonEmpty and CANTW_ANALIZ;
     MnAnaliz.enabled:=not RemonEmpty and CANTW_ANALIZ;
     Btn_Marketing.enabled:=not RemonEmpty and CANTW_MARKETING;
     MnMarketing.enabled:=not RemonEmpty and CANTW_MARKETING;
     Btn_PrintCenn.enabled:=(not RemonEmpty);
     MnCenn.enabled:=(not RemonEmpty);
     Btn_PrintCennMore.enabled:=(not RemonEmpty);
     MnCennMore.enabled:=(not RemonEmpty);
     RxDbgrid2.ReadOnly:=False;
     BTN_FRM.enabled:=(not REMON_PROW);
     MnFrm.enabled:=(not REMON_PROW);
     REMON_DATE.enabled:=(not REMON_PROW);
     REMON_OSN.enabled:=(not REMON_PROW);
     REMON_OWNER.enabled:=(not REMON_PROW);

     SHOP1.Enabled:=(not REMON_PROW);
     SHOP2.Enabled:=(not REMON_PROW);
     REMON_SHOP.enabled:=((not REMON_PROW) or (SHOP1.checked));
end;

procedure TDoc_Remon.Change_FrmKln(ID:integer);
var
   s1,s2:ansistring;
begin
     {Отображаем название фирмы и банка}
     IbQuery1.Close;
     IbQuery1.SQL.clear;
     IbQuery1.SQL.add('select KLN_FULL FROM KLN_DATA(:KLN_ID)');
     IbQuery1.Parambyname('KLN_ID').asinteger:=ID;
     IbQuery1.Open;
     s1:=IbQuery1.fieldbyname('KLN_FULL').asstring;
     FRM_NAME.text:=s1;
     IbQuery1.Close;
end;


procedure TDoc_Remon.FormShow(Sender: TObject);
var
   c:integer;
begin
     REMON_PROW:=False;
     RemonTransaction.Active:=False;
     IbOwnerList.close;
     IbOwnerList.Open;
     GET_DEFAULT;
     FastInfoTransaction.Active:=False;
     OPEN_SQL(IbQuery3,'select count(*) as cc from cfg where cfg_set1=1 and (cfg_name="SPEED") and (cfg_value=1)');
     if IbQuery3.eof then begin
        RxDbgrid1.Height:=20*2
     end else begin
         RxDbgrid1.Height:=20*(IbQuery3.fieldbyname('cc').asinteger+2)+6;
     end;
     {Определяем величину нижней таблицы}
     {Заполняем названия для быстрых остатков}
     OPEN_SQL(IbQuery3,'select SKL_ID,SKL_SHORT FROM SKL WHERE SKL_SPEED>0 order by SKL_SPEED');
     c:=0;
     SHOW_COLUMN:='';
     while not IbQuery3.eof do begin
       inc(c);
       if IbQuery3.fieldByname('SKL_ID').asinteger=Default_sklad then SHOW_COLUMN:=RxDbgrid1.Columns[c].FieldName;
       RxDbgrid1.Columns[c].Title.Caption:=IbQuery3.fieldByname('SKL_SHORT').asstring;
       IbQuery3.next;
     end;
     IbQuery3.close;
     Timer1.enabled:=False;
     CanTimer:=False;
     RemonDocTransaction.Active:=False;
     Sost:=0;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-29;
     {Определяем название}
     if Doc_Remon.tag<0 then begin
       Sost:=1;
       Get_default;
       {Устанавливаем данные}
       SHOP_ID:=SHOPID;
       FRM_ID:=DEFAULT_FIRMA;
       REMON_OSN.lines.clear;
       REMON_NUM.text:='Новый';
       REMON_DATE.date:=Date();
       REMON_NUMS:=-1;
       REMON_OWNER.value:=inttostr(DEFAULT_OWNER_REMON);
       SHOP1.Checked:=true;
       SHOP2Click(sender);
       REMON_SHOP.value:=inttostr(SHOPID);
       Timer2.enabled:=True;
       CountBox1:=0;
     end else begin
          {Читаем Акт переоценки}
          ADD_SQL(IbQuery1,'select * from REMON where REMON_ID=:REMON_ID');
          IbQuery1.Parambyname('REMON_ID').asinteger:=Doc_REMON.tag;
          IbQuery1.Open;
          if IbQuery1.fieldByname('REMON_SHOP').asinteger=0 then begin
             REMON_SHOP.value:=inttostr(SHOPID);
             SHOP1.checked:=true;
          end else begin
             SHOP2.checked:=true;
             REMON_SHOP.value:=IbQuery1.fieldByname('REMON_SHOP').asstring;
          end;
          SHOP2Click(sender);
          REMON_PROW:=strtoboolean(IbQuery1.fieldbyname('REMON_PROW').asstring);
          FRM_ID:=IbQuery1.fieldbyname('FRM_ID').asinteger;
          SHOP_ID:=IbQuery1.fieldbyname('SHOP_ID').asinteger;
          REMON_OWNER.value:=IbQuery1.fieldbyname('REMON_OWNER').asstring;
          REMON_OSN.lines.clear;
          REMON_OSN.lines.add(IbQuery1.fieldbyname('REMON_OSN').asstring);
          REMON_NUM.text:=IbQuery1.fieldbyname('REMON_NUM').asstring;
          REMON_NUMS:=IbQuery1.fieldbyname('REMON_NUM').asinteger;
          REMON_DATE.date:=IbQuery1.fieldbyname('REMON_DATE').asdatetime;
          {Читаем содержимое акта переоценки}
          ADD_SQL(IbQuery1,'select * from LIST_REMONS(:REMON_ID) order by REMONS_ID');
          IbQuery1.Parambyname('REMON_ID').asinteger:=Doc_REMON.tag;
          IbQuery1.Open;
          while not IbQuery1.eof do begin
                CanInsert:=True;
                MemREMONS.Append;
                MemREMONS.Fieldbyname('REMONS_ID').asinteger:=IbQuery1.Fieldbyname('REMONS_ID').asinteger;
                MemREMONS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TW_COLOR').asinteger;
                MemREMONS.Fieldbyname('TW_ID').asinteger:=IbQuery1.Fieldbyname('TW_ID').asinteger;
                MemREMONS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
                MemREMONS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
                MemREMONS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
                MemREMONS.Fieldbyname('REMONS_PRIM').asstring:=IbQuery1.Fieldbyname('REMONS_PRIM').asstring;
                MemREMONS.Fieldbyname('OLD_MONEY').asfloat:=IbQuery1.Fieldbyname('OLD_TW_MONEY').asfloat;
                MemREMONS.Fieldbyname('NEW_MONEY').asfloat:=IbQuery1.Fieldbyname('NEW_TW_MONEY').asfloat;
                MemREMONS.Fieldbyname('OLD_MONEY1').asfloat:=IbQuery1.Fieldbyname('OLD_TW_MONEY1').asfloat;
                MemREMONS.Fieldbyname('NEW_MONEY1').asfloat:=IbQuery1.Fieldbyname('NEW_TW_MONEY1').asfloat;
                MemREMONS.Fieldbyname('OLD_MONEY2').asfloat:=IbQuery1.Fieldbyname('OLD_TW_MONEY2').asfloat;
                MemREMONS.Fieldbyname('NEW_MONEY2').asfloat:=IbQuery1.Fieldbyname('NEW_TW_MONEY2').asfloat;
                MemREMONS.Fieldbyname('OLD_MONEY3').asfloat:=IbQuery1.Fieldbyname('OLD_TW_MONEY3').asfloat;
                MemREMONS.Fieldbyname('NEW_MONEY3').asfloat:=IbQuery1.Fieldbyname('NEW_TW_MONEY3').asfloat;
                MemREMONS.Fieldbyname('OLD_MONEY4').asfloat:=IbQuery1.Fieldbyname('OLD_TW_MONEY4').asfloat;
                MemREMONS.Fieldbyname('NEW_MONEY4').asfloat:=IbQuery1.Fieldbyname('NEW_TW_MONEY4').asfloat;
                MemREMONS.Fieldbyname('OLD_MONEY6').asfloat:=IbQuery1.Fieldbyname('OLD_TW_MONEY6').asfloat;
                MemREMONS.Fieldbyname('NEW_MONEY6').asfloat:=IbQuery1.Fieldbyname('NEW_TW_MONEY6').asfloat;

                MemREMONS.Fieldbyname('OLD_MONEY7').asfloat:=IbQuery1.Fieldbyname('OLD_TW_MONEY7').asfloat;
                MemREMONS.Fieldbyname('NEW_MONEY7').asfloat:=IbQuery1.Fieldbyname('NEW_TW_MONEY7').asfloat;
                MemREMONS.Fieldbyname('OLD_MONEY8').asfloat:=IbQuery1.Fieldbyname('OLD_TW_MONEY8').asfloat;
                MemREMONS.Fieldbyname('NEW_MONEY8').asfloat:=IbQuery1.Fieldbyname('NEW_TW_MONEY8').asfloat;

                MemREMONS.Fieldbyname('NEW_MONEY5').asfloat:=IbQuery1.Fieldbyname('NEW_TW_MONEY5').asfloat;
                MemREMONS.fieldByname('OST').asfloat:=IbQuery1.Fieldbyname('OST').asfloat;
                MemREMONS.fieldByname('MET_MONEY_SHOP').asstring:=IbQuery1.Fieldbyname('MET_MONEY_SHOP').asstring;
                MemREMONS.Post;
                CanInsert:=False;
                IbQuery1.next;
          end;
     end;
     Change_FrmKln(FRM_ID);
     Show_Sost;
     SAVE:=true;
     RxDbGrid1.setfocus;
     Timer1.enabled:=True;
     CanTimer:=True;

     RxDBGrid2.Columns[6].Visible:=(CHECK_USER_DOSTUP('PRICE_LIST_MONEY1')<>-1);
     RxDBGrid2.Columns[7].Visible:=RxDBGrid2.Columns[6].Visible;

     RxDBGrid2.Columns[8].Visible:=(CHECK_USER_DOSTUP('PRICE_LIST_MONEY2')<>-1);
     RxDBGrid2.Columns[9].Visible:=RxDBGrid2.Columns[8].Visible;

     RxDBGrid2.Columns[10].Visible:=(CHECK_USER_DOSTUP('PRICE_LIST_MONEY3')<>-1);
     RxDBGrid2.Columns[11].Visible:=RxDBGrid2.Columns[10].Visible;

     RxDBGrid2.Columns[18].Visible:=(CHECK_USER_DOSTUP('PRICE_LIST_MONEY4')<>-1);
     RxDBGrid2.Columns[19].Visible:=RxDBGrid2.Columns[18].Visible;

     RxDBGrid2.Columns[12].Visible:=(CHECK_USER_DOSTUP('PRICE_LIST_MONEY3')<>-1);
     RxDBGrid2.Columns[13].Visible:=RxDBGrid2.Columns[12].Visible;

     RxDBGrid2.Columns[14].Visible:=(CHECK_USER_DOSTUP('PRICE_LIST_MONEY3')<>-1);
     RxDBGrid2.Columns[15].Visible:=RxDBGrid2.Columns[14].Visible;

     RxDBGrid2.Columns[16].Visible:=(CHECK_USER_DOSTUP('PRICE_LIST_MONEY3')<>-1);
     RxDBGrid2.Columns[17].Visible:=RxDBGrid2.Columns[16].Visible;

     RxDBGrid2.Columns[20].Visible:=(CHECK_USER_DOSTUP('PRICE_LIST_MONEY5')<>-1);

end;

procedure TDoc_Remon.FormKeyPress(Sender: TObject; var Key: Char);
var
   ID:integer;
   N:integer;
begin
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
                    ADD_REMONS(ID);
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
       FRM_NAME.setfocus;
       REMON_OSN.setfocus;
     except
     end;
     if BTN_SAVE.enabled then Btn_SAVE.click;
  end;
     Show_Sost;
end;

procedure TDoc_Remon.Btn_FRMClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=FRM_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>FRM_ID then begin
        FRM_ID:=DIC_KLIENT.tag;
        Change_FrmKln(FRM_ID);
     end;
     DIC_KLIENT.Destroy;
end;

procedure TDoc_Remon.Btn_ApplyClick(Sender: TObject);
var
   A,REMON_ID,ID,OLDID:integer;
   r,IDR:double;
begin
     if (MemRemons.State in [dsInsert,DsEdit]) then MemRemons.Post;
     CanTimer:=False;;
     Timer1.enabled:=False;
     {Сохраняем Акт переоценки}
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     OLDID:=MemREMONS.recno;
     Try
        IBSAVE_CLEAR;
        if REMON_NUMS<0 then REMON_NUMS:=NEW_REMON_NUM(FRM_ID, REMON_DATE.date);
        if SHOP1.checked then IBSAVE_ADD('REMON_SHOP',0) else IBSAVE_ADD('REMON_SHOP',strtoint(REMON_SHOP.value)); 
        IBSAVE_ADD('REMON_NUM',REMON_NUMS);
        IBSAVE_ADD('REMON_OWNER',strtoint(REMON_OWNER.value));
        IBSAVE_ADD('REMON_DATE',strtodatetime(datetostr(REMON_DATE.date)+' '+timetostr(time())));
        IBSAVE_ADD('REMON_OSN',Memotostr(REMON_OSN.lines));
        IBSAVE_ADD('US_ID',USERID);
        IBSAVE_ADD('REMON_PROW',FALSE);
        IBSAVE_ADD('SHOP_ID',SHOP_ID);
        IBSAVE_ADD('FRM_ID',FRM_ID);
        REMON_ID:=IBSAVE_DOC('REMON',DOC_REMON.tag);
        if REMON_ID<=0 then IDR:=SQRT(-1)
        else begin
             if DOC_REMON.tag<0 then begin
               // Фиксируем акт создания накладной
               IBSAVE_CLEAR;
               IBSAVE_ADD('DOC','REMON');
               IBSAVE_ADD('US_ID',USERID);
               IBSAVE_ADD('SHOP_ID',SHOPID);
               IBSAVE_ADD('MESS','Акт создан');
               IBSAVE_ADD('DOP1',1);
               IBSAVE_ADD('DOP2',REMON_ID);
               if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
             end;
             {Сохраняем содержимое}
             {Сначала удаляем удалённое}
             for A:=1 to CNT_DEL do begin
                 if REMONS_DEL[A]>0 then if not IBDELETE_DOC('REMONS',REMONS_DEL[A]) then IDR:=SQRT(-1);
             end;
             {Сохраняем имеющееся}
             MemREMONS.DisableControls;
             MemREMONS.First;
             while not MemREMONS.eof do begin
                   IBSAVE_CLEAR;
                   IBSAVE_ADD('REMON_ID',REMON_ID);
                   IBSAVE_ADD('TW_ID',MemREMONS.fieldbyname('TW_ID').asinteger);
                   IBSAVE_ADD('SKL_ID',DEFAULT_SKLAD);
                   IBSAVE_ADD('TW_KURS',0);
                   IBSAVE_ADD('TW_KOL',0);
                   IBSAVE_ADD('OLD_TW_MONEY',MemREMONS.fieldbyname('OLD_MONEY').asfloat);
                   IBSAVE_ADD('NEW_TW_MONEY',MemREMONS.fieldbyname('NEW_MONEY').asfloat);
                   IBSAVE_ADD('OLD_TW_MONEY1',MemREMONS.fieldbyname('OLD_MONEY1').asfloat);
                   IBSAVE_ADD('NEW_TW_MONEY1',MemREMONS.fieldbyname('NEW_MONEY1').asfloat);
                   IBSAVE_ADD('OLD_TW_MONEY2',MemREMONS.fieldbyname('OLD_MONEY2').asfloat);
                   IBSAVE_ADD('NEW_TW_MONEY2',MemREMONS.fieldbyname('NEW_MONEY2').asfloat);
                   IBSAVE_ADD('OLD_TW_MONEY3',MemREMONS.fieldbyname('OLD_MONEY3').asfloat);
                   IBSAVE_ADD('NEW_TW_MONEY3',MemREMONS.fieldbyname('NEW_MONEY3').asfloat);
                   IBSAVE_ADD('OLD_TW_MONEY4',MemREMONS.fieldbyname('OLD_MONEY4').asfloat);
                   IBSAVE_ADD('NEW_TW_MONEY4',MemREMONS.fieldbyname('NEW_MONEY4').asfloat);
                   IBSAVE_ADD('OLD_TW_MONEY6',MemREMONS.fieldbyname('OLD_MONEY6').asfloat);
                   IBSAVE_ADD('NEW_TW_MONEY6',MemREMONS.fieldbyname('NEW_MONEY6').asfloat);

                   IBSAVE_ADD('OLD_TW_MONEY7',MemREMONS.fieldbyname('OLD_MONEY7').asfloat);
                   IBSAVE_ADD('NEW_TW_MONEY7',MemREMONS.fieldbyname('NEW_MONEY7').asfloat);
                   IBSAVE_ADD('OLD_TW_MONEY8',MemREMONS.fieldbyname('OLD_MONEY8').asfloat);
                   IBSAVE_ADD('NEW_TW_MONEY8',MemREMONS.fieldbyname('NEW_MONEY8').asfloat);


                   IBSAVE_ADD('REMONS_PRIM',MemREMONS.fieldbyname('REMONS_PRIM').asstring);
                   ID:=IBSAVE_DOC('REMONS',MemREMONS.fieldbyname('REMONS_ID').asinteger);
                   if ID<0 then IDR:=SQRT(-1) else begin
                      MemREMONS.Edit;
                      MemREMONS.fieldbyname('REMONS_ID').asinteger:=ID;
                      MemREMONS.Post;
                   end;
                   MemREMONS.next;
             end;
        end;
        {Всё прошло нормально - изменяем временные данные}
        {Отображаем номер}
        Doc_REMON.tag:=REMON_ID;
        REMON_NUM.text:=inttostr(REMON_NUMS);
        MemREMONS.First;
        for a:=1 to OLDID-1 do MemREMONS.next;
        SAVE:=TRUE;
        MemREMONS.EnableControls;
        Datamodule1.IBTransaction2.Commit;
     Except
        Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
     CanTimer:=True;
     Timer1.enabled:=True;
end;

procedure TDoc_Remon.MemREMONSTW_IDChange(Sender: TField);
begin
     SAVE:=FALSE;
end;

procedure TDoc_Remon.Btn_SAVEClick(Sender: TObject);
begin
     SAVE:=false;
     Btn_Apply.Click;
     if SAVE then begin
        if NOT REMON_PROW then begin
           BTN_PROW.click;
           SAVE:=True;
        end;
        Close;
     end;
end;

procedure TDoc_Remon.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save) and (Btn_Apply.enabled) then begin
        if Messbox('Акт переоценки был изменён! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDoc_Remon.DsRemonsDataChange(Sender: TObject; Field: TField);
begin
     if (MemREMONS.State in [dsInsert]) and ( not CanInsert) then MemREMONS.Cancel;
end;

procedure TDoc_Remon.Btn_DelTowClick(Sender: TObject);
begin
     if Messbox('Удалить из счёта акта переоценки "'+MemREMONS.Fieldbyname('TW_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        SAVE:=False;
        inc(CNT_DEL);
        REMONS_DEL[CNT_DEL]:=MemREMONS.Fieldbyname('REMONS_ID').asinteger;
        MemREMONS.delete;
        Show_Sost;
     end;
end;

procedure TDoc_Remon.Btn_DetalClick(Sender: TObject);
begin
  SHOW_DETAL_TW(MemREMONS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_Remon.FormKeyDown(Sender: TObject; var Key: Word;
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
          Select_Print.Button1.caption:='Напечатать акт переоценки';
          Select_Print.Button2.caption:='Напечатать Ценник на выбранный товар';
          Select_Print.Button3.caption:='Напечатать Ценники на все товары из акта переоценки';
          Select_Print.showModal;
          if Select_Print.tag>0 then begin
             if (Btn_Print.Enabled) and (Select_Print.tag=1) then Btn_Print.click;
             if (Btn_PrintCenn.Enabled) and (Select_Print.tag=2) then Btn_PrintCenn.click;
             if (Btn_PrintCennMore.Enabled) and (Select_Print.tag=3) then Btn_PrintCennMore.click;
          end;
          Select_Print.Destroy;
        end;
     end;
     if (key=192) and (ssCtrl in Shift) and (Btn_refreshOst.enabled) then begin
        key:=0;
        Btn_RefreshOst.click;
     end;
     if (key=13) and (ssCtrl in Shift) and (Btn_Save.enabled) then begin
        key:=0;
        Btn_SAve.click;
     end;
end;

procedure TDoc_Remon.ADD_REMONS(TW_ID:integer);
var
   TW_TEMP:integer;
   TW_STR:ansistring;
   ISS:boolean;
   fq: FastQuery;
begin
     TW_TEMP:=0;
     {Проверяем, нет ли в акте уже такого товара}
     if MemREMONS.RecordCount>0 then TW_TEMP:=MemREMONS.fieldByname('TW_ID').asinteger;
     ISS:=false;
     MemREMONS.Disablecontrols;
     MemREMONS.first;
     while (not MemREMONS.eof) and (not ISS) do begin
           if MemREMONS.fieldByname('TW_ID').asinteger=TW_ID then begin
              ISS:=true;
              TW_STR:=MemREMONS.fieldByname('TW_ART').asstring+'-'+MemREMONS.fieldByname('TW_NAM').asstring;
           end;
           MemREMONS.next;
     end;
     MemREMONS.EnableControls;

     fq:=FastQuery.Create('');

     if ISS then Messbox('Акт уже содержит товар '+TW_STR+' и он не может быть добавлен!',MessSystem,48) else
     begin
          Query1Transaction.Active:=False;
          ADD_SQL(IbQuery2,'select * from tw_mroz(:tw_id,:SHOP_ID)');
          ADD_SQL(IbQuery1,'select twktg.twktg_color,tw.tw_art,tw.tw_nam,tw.ed_id,ed.ed_short, '+
          '(select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
          '(select max(kurs_date) from kurs where '+
          'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz '+
          'from tw,ed,twktg '+
          'where tw.ed_id=ed.ed_id and tw.tw_id=:TW_ID and tw.twktg_id=twktg.twktg_id ');
          IbQuery1.Parambyname('TW_ID').asinteger:=TW_ID;
          IbQuery1.Open;
          IbQuery2.Parambyname('TW_ID').asinteger:=TW_ID;
          if SHOP1.Checked then IbQuery2.Parambyname('SHOP_ID').asinteger:=-1
          else IbQuery2.Parambyname('SHOP_ID').asinteger:=strtoint(REMON_SHOP.value);
          IbQuery2.Open;
          fq.Close;
          fq.SQL.text:='SELECT * FROM TW_PRICE_LIST_FRM(:TW_ID, :FRM_ID)';
          fq.ParamByName('TW_ID').asinteger:=TW_ID;
          fq.Parambyname('frm_id').asinteger:=GL_FRM_WORK_MODE;
          fq.Open;

          CanInsert:=True;
          MemREMONS.Append;
          MemREMONS.Fieldbyname('REMONS_ID').asinteger:=-1;
          MemREMONS.Fieldbyname('TW_ID').asinteger:=TW_ID;
          MemREMONS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TWKTG_COLOR').asinteger;
          MemREMONS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
          MemREMONS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
          MemREMONS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
          MemREMONS.Fieldbyname('OLD_MONEY').asfloat:=IbQuery2.Fieldbyname('MONEY').asfloat;
          MemREMONS.Fieldbyname('NEW_MONEY').asfloat:=IbQuery2.Fieldbyname('MONEY').asfloat;

          while not fq.eof do
          begin
            if fq.FieldByName('TWPRICE_TYP').asinteger=1 then
              begin MemREMONS.Fieldbyname('NEW_MONEY1').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemREMONS.Fieldbyname('OLD_MONEY1').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            if fq.FieldByName('TWPRICE_TYP').asinteger=2 then
              begin MemREMONS.Fieldbyname('NEW_MONEY2').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemREMONS.Fieldbyname('OLD_MONEY2').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            if fq.FieldByName('TWPRICE_TYP').asinteger=3 then
              begin MemREMONS.Fieldbyname('NEW_MONEY3').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemREMONS.Fieldbyname('OLD_MONEY3').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            if fq.FieldByName('TWPRICE_TYP').asinteger=4 then
              begin MemREMONS.Fieldbyname('NEW_MONEY4').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemREMONS.Fieldbyname('OLD_MONEY4').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            if fq.FieldByName('TWPRICE_TYP').asinteger=6 then
              begin MemREMONS.Fieldbyname('NEW_MONEY6').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemREMONS.Fieldbyname('OLD_MONEY6').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            if fq.FieldByName('TWPRICE_TYP').asinteger=7 then
              begin MemREMONS.Fieldbyname('NEW_MONEY7').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemREMONS.Fieldbyname('OLD_MONEY7').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            if fq.FieldByName('TWPRICE_TYP').asinteger=8 then
              begin MemREMONS.Fieldbyname('NEW_MONEY8').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; MemREMONS.Fieldbyname('OLD_MONEY8').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;
            if fq.FieldByName('TWPRICE_TYP').asinteger=5 then
              begin MemREMONS.Fieldbyname('NEW_MONEY5').asfloat:=fq.FieldByName('TWPRICE_MONEY').asfloat; end;

            fq.next;
          end;





          MemREMONS.Fieldbyname('MET_MONEY_SHOP').asstring:=IbQuery2.Fieldbyname('MET_MONEY_SHOP').asstring;
          MemREMONS.fieldByname('OST').asfloat:=GetOst(TW_ID,0, gl_frm_work_mode);
          MemREMONS.Fieldbyname('REMONS_PRIM').asstring:='';
          MemREMONS.Post;
          CanInsert:=False;

          fq.close;
          fq.Destroy;
     end;
     IbQuery1.Close;
     RxDbGrid2.setfocus;
     Show_sost;
end;

procedure TDoc_Remon.Btn_PrintClick(Sender: TObject);
begin
     SAVE:=false;
     if Btn_Prow.enabled then Btn_Apply.Click
     else SAVE:=true;
     if (SAVE) then begin
        {Печатаем}
        PRINT_REMON(Doc_REMON.tag,Default_sklad);
     end;
end;

procedure TDoc_Remon.Btn_DicTowClick(Sender: TObject);
var
   a:integer;
begin
     CanTimer:=False;
     Timer1.enabled:=False;
     DicTowarSet:=1; {Ввод товаров из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
        for a:=1 to CNT_TW do begin
            ADD_REMONS(ARR_TW[a].ID);
        end;
     end;
     Show_sost;
     CanTimer:=True;
     Timer1.enabled:=True;
end;

procedure TDoc_Remon.Btn_AnalizClick(Sender: TObject);
begin
  SHOW_ANALIZ_TW(MemREMONS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_Remon.Btn_MarketingClick(Sender: TObject);
begin
     SHOW_MARKETING_TW(MemREMONS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_Remon.Btn_PrintCennClick(Sender: TObject);
begin
     CLEAR_CENNIK;
     ADD_CENNIK(MemREMONS.fieldbyname('TW_ID').asinteger,Default_sklad);
     PRINT_CENNIK;
end;

procedure TDoc_Remon.Btn_PrintCennMoreClick(Sender: TObject);
var
   a,ID:integer;
begin
     CanTimer:=False;
     Timer1.enabled:=False;
     CLEAR_CENNIK;
     if MemREMONS.RecordCount>0 then begin
         ID:=MemREMONS.RecNo;
         MemREMONS.DisableControls;
         MemREMONS.First;
         while not MemREMONS.eof do begin
               ADD_CENNIK(MemREMONS.fieldbyname('TW_ID').asinteger,default_sklad);
               MemREMONS.next;
         end;
         MemREMONS.First;
         for a:=1 to ID-1 do MemREMONS.next;
         MemREMONS.EnableControls;
         PRINT_CENNIK;
     end;
     CanTimer:=True;
end;

procedure TDoc_Remon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     CanTimer:=False;
     Timer1.enabled:=False;
end;

procedure TDoc_Remon.Btn_RefreshOstClick(Sender: TObject);
var
   a,ID:integer;
   s:ansistring;
begin
     s:=Doc_REMON.caption;
     Doc_REMON.caption:=Doc_REMON.caption+'. Чтение остатков товаров';
     if MemREMONS.RecordCount>0 then begin
         ID:=MemREMONS.RecNo;
         MemREMONS.DisableControls;
         MemREMONS.First;
         while not MemREMONS.eof do begin
               MemREMONS.Edit;
               MemREMONS.fieldByname('OST').asfloat:=GetOst(MemREMONS.fieldByname('TW_ID').asinteger,0, gl_frm_work_mode);
               MemREMONS.Post;
               MemREMONS.next;
         end;
         MemREMONS.First;
         for a:=1 to ID-1 do MemREMONS.next;
         MemREMONS.EnableControls;
     end;
     Doc_REMON.caption:=s;
end;

procedure TDoc_Remon.Timer1Timer(Sender: TObject);
begin
  try
   if MemREMONS.recordcount>0 then begin
     Timer1.enabled:=False;
     QrFastInfo.close;
     if CanTimer then begin
       FastInfoTransaction.Active:=False;
       QrFastInfo.Open;
     End;
   end;
  except
  End;
end;

procedure TDoc_Remon.MemREMONSAfterPost(DataSet: TDataSet);
begin
     Timer1.enabled:=False;
     QrFastInfo.close;
     if MemREMONS.recordcount>0 then begin
       QrFastInfo.ParamByname('TW_ID').asinteger:=MemREMONS.fieldByname('TW_ID').asinteger;
       Timer1.enabled:=True;
     end;
end;

procedure TDoc_Remon.MemREMONSAfterDelete(DataSet: TDataSet);
begin
     Timer1.enabled:=False;
     QrFastInfo.close;
     if MemREMONS.recordcount>0 then begin
       QrFastInfo.ParamByname('TW_ID').asinteger:=MemREMONS.fieldByname('TW_ID').asinteger;
       Timer1.enabled:=True;
     end;
end;

procedure TDoc_Remon.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     Afont.color:=clWindowText;
     Background:=clWindow;
     if B_utils.Left(Field.FieldName,1)='F' then
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName(Field.FieldName).Asfloat<>0 then begin
        Afont.color:=clHighlighttext;
        Background:=clHighLight;
     end;
end;

procedure TDoc_Remon.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if MemREMONS.recordcount>0 then begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if (Field.FieldName='TW_ART')
        and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
        then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
     if Field.Fieldname='OST' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<0)
           and (OST_COLOR3>0) then Background:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat=0)
           and (OST_COLOR4>0) then Background:=OST_COLOR4;
     end;
     Afont.Style:=[];
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1') and
     (Field.Fieldname='OLD_MONEY') then begin
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
      if Field.Fieldname='OST' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat<0)
           and (OST_COLOR3>0) then Afont.color:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OST').Asfloat=0)
           and (OST_COLOR4>0) then Afont.color:=OST_COLOR4;
       end;
       Afont.Style:=[];
       if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1') and
       (Field.Fieldname='OLD_MONEY') then begin
          BackGround:=ClGreen;
          Afont.Style:=[FsBold];
          Afont.color:=$009FFF9F;
       end;
     end;
  end;
end;

procedure TDoc_Remon.ToolButton6Click(Sender: TObject);
begin
     My_lock;
end;

procedure TDoc_Remon.Btn_ProwClick(Sender: TObject);
begin
     if not SAVE then Btn_APPLY.click;
     if SAVE then begin
        if NOT REMON_PROW then begin
           if PROV_REMON(DOC_REMON.tag,'') then REMON_PROW:=true;
        end;
     end;
     Show_sost;
end;

procedure TDoc_Remon.SHOP2Click(Sender: TObject);
begin
    REMON_SHOP.enabled:=SHOP2.Checked;
end;

procedure TDoc_Remon.Timer2Timer(Sender: TObject);
begin
    GroupBox1.Visible:=not GroupBox1.Visible;
    inc(CountBox1);
    if CountBox1>10 then begin
        Timer2.Enabled:=False;
        GroupBox1.Visible:=true;
    end;
end;

procedure TDoc_Remon.ToolButton3Click(Sender: TObject);
var
   a,ID:integer;
begin
     CanTimer:=False;
     Timer1.enabled:=False;
     CLEAR_CENNIK;
     if MemREMONS.RecordCount>0 then begin
         ID:=MemREMONS.RecNo;
         MemREMONS.DisableControls;
         MemREMONS.First;
         while not MemREMONS.eof do begin
               ADD_CENNIK(MemREMONS.fieldbyname('TW_ID').asinteger,default_sklad);
               DataModule1.MemCENNIK.Edit;
               DataModule1.memCENNIK.fieldByName('TITLE').AsString:='';

//               DataModule1.memCENNIK.fieldByName('TW_MROZ').asFloat:=DataModule1.memCENNIK.fieldByName('TW_MROZ_2').asFloat;
               DataModule1.MemCENNIK.Post;

               MemREMONS.next;
         end;
         MemREMONS.First;
         for a:=1 to ID-1 do MemREMONS.next;
         MemREMONS.EnableControls;
///         PRINT_CENNIK;
     end;
     CanTimer:=True;





     with Print_doc do
     begin



     pp_cennik_large.GroupFooter[4].Visible:=true;
     pp_cennik_big.GroupFooter[4].Visible:=true;
     pp_cennik_medium.GroupFooter[4].Visible:=true;
     pp_cennik_small.GroupFooter[4].Visible:=true;


     pp_cennik_large.GroupHeader[7].Visible:=false;
     pp_cennik_large.GroupHeader[8].Visible:=true;
     pp_cennik_big.GroupHeader[7].Visible:=false;
     pp_cennik_big.GroupHeader[8].Visible:=true;
     pp_cennik_medium.GroupHeader[7].Visible:=false;
     pp_cennik_medium.GroupHeader[8].Visible:=true;
     pp_cennik_small.GroupHeader[7].Visible:=false;
     pp_cennik_small.GroupHeader[8].Visible:=true;

     end;


//     findComponent('ppLabel875');
//     .Visible:=false;
//     TPPSystemVariable(.);

     PRINT_CENNIK;
     with Print_doc do
     begin


     pp_cennik_large.GroupFooter[4].Visible:=false;
     pp_cennik_big.GroupFooter[4].Visible:=false;
     pp_cennik_medium.GroupFooter[4].Visible:=false;
     pp_cennik_small.GroupFooter[4].Visible:=false;
     
     pp_cennik_large.GroupHeader[7].Visible:=true;
     pp_cennik_large.GroupHeader[8].Visible:=false;
     pp_cennik_big.GroupHeader[7].Visible:=true;
     pp_cennik_big.GroupHeader[8].Visible:=false;
     pp_cennik_medium.GroupHeader[7].Visible:=true;
     pp_cennik_medium.GroupHeader[8].Visible:=false;
     pp_cennik_small.GroupHeader[7].Visible:=true;
     pp_cennik_small.GroupHeader[8].Visible:=false;

     end;
end;

end.