unit DocSt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, CurrEdit, Mask, ToolEdit, RxLookup, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,Data1,B_DBUtils,B_Utils, Db,
  IBCustomDataSet, IBQuery, RxMemDS, IBDatabase,DetalTW, Menus,SetSkid,VclUtils,
  DBCtrls;

type
  TDoc_St = class(TForm)
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
    ST_OSN: TMemo;
    Label10: TLabel;
    ST_NUM: TEdit;
    Label11: TLabel;
    ST_DATE: TDateEdit;
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
    MemSTS: TRxMemoryData;
    DsSTS: TDataSource;
    MemSTSTW_ID: TIntegerField;
    MemSTSTW_NAM: TStringField;
    MemSTSTW_MONEY: TFloatField;
    MemSTSTW_KOL: TFloatField;
    MemSTSTW_SUMM: TFloatField;
    MemSTSED_SHORT: TStringField;
    MemSTSSTS_ID: TIntegerField;
    MemSTSTW_ART: TIntegerField;
    ST_SUMM: TRxCalcEdit;
    Label14: TLabel;
    StDocTransaction: TIBTransaction;
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
    MemSTSTW_SKID: TFloatField;
    MemSTSTW_OKMONEY: TFloatField;
    IbValuta: TIBQuery;
    DsValuta: TDataSource;
    IbValutaVALUTA_ID: TIntegerField;
    IbValutaVALUTA_FULL: TIBStringField;
    Label1: TLabel;
    ST_VALUTA: TRxDBLookupCombo;
    N1: TMenuItem;
    MnSet_Skid: TMenuItem;
    MemSTSOST: TFloatField;
    ToolButton2: TToolButton;
    Btn_RefreshOst: TToolButton;
    MnRefreshOst: TMenuItem;
    N3: TMenuItem;
    BTN_KLN: TBitBtn;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ToolButton3: TToolButton;
    BtnOnHelp: TToolButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    N7: TMenuItem;
    MnOnHelp: TMenuItem;
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
    MemSTSTW_COLOR: TIntegerField;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ShowOst: TCheckBox;
    MemSTSMET_MONEY_SHOP: TStringField;
    Label2: TLabel;
    ListOst: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    OstTransaction: TIBTransaction;
    QrListOst: TIBQuery;
    QrListOstCFG_ID: TIntegerField;
    QrListOstCFG_VALUE: TIBStringField;
    QrListOstSKL_LIST: TIBStringField;
    DBEdit1: TDBEdit;
    DsListOst: TDataSource;
    Label4: TLabel;
    NDS: TRxCalcEdit;
    MenuNDS: TPopupMenu;
    N8: TMenuItem;
    FRM: TRxDBLookupCombo;
    Label9: TLabel;
    KLN_KTG: TEdit;
    MemSTStw_NOSKID: TIntegerField;
    MemSTStw_skid_load: TFloatField;
    MemSTSRNS_WEIGHT: TFloatField;
    MemSTSTW_WEIGHT: TFloatField;
    Label12: TLabel;
    RN_WEIGHT: TRxCalcEdit;
    MemSTSnapr: TIntegerField;
    MemSTSktg: TIntegerField;
    ToolButton9: TToolButton;
    Label13: TLabel;
    ST_NAC: TRxCalcEdit;
    MemSTStw_seb: TFloatField;
    ToolButton10: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure Show_Sost;
    Procedure Refresh_summ;
    Procedure Change_FRMKln(ID,N:integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MemSTSCalcFields(DataSet: TDataSet);
    procedure BTN_KLNClick(Sender: TObject);
    procedure Btn_ApplyClick(Sender: TObject);
    procedure MemSTSTW_IDChange(Sender: TField);
    procedure Btn_SAVEClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DsSTSDataChange(Sender: TObject; Field: TField);
    procedure Btn_DelTowClick(Sender: TObject);
    procedure Btn_DetalClick(Sender: TObject);
    procedure ADD_STS(TW_ID:integer;KOL:double);
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
    procedure BtnOnHelpClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MemSTSAfterPost(DataSet: TDataSet);
    procedure MemSTSAfterDelete(DataSet: TDataSet);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ToolButton6Click(Sender: TObject);
    procedure MemSTSTW_KOLChange(Sender: TField);
    procedure ListOstChange(Sender: TObject);
    function Get_napr_kln(TW_ID:integer): integer;
    procedure SpeedButton1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure NDSKeyPress(Sender: TObject; var Key: Char);
    procedure NDSExit(Sender: TObject);
    procedure SetNDS;
    procedure FRMChange(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
  private
    { Private declarations }
    REAL_TYP: integer;
    pers_skid: integer;
    kln_ktg_id: integer;
    initComplete: boolean;
  public
    { Public declarations }
  end;



var
  CanTimer:boolean;
  CanInsert:Boolean=False;
  STS_DEL:array[1..10000] of integer;
  STS_DEL_MESS:array[1..10000] of string;
  CNT_DEL:integer=0;
  SAVE:boolean;
  Doc_St: TDoc_St;
  Sost:integer=0;
  KLN_ID:integer;
  SHOP_ID:integer;
  ST_NUMS:integer;
  STR:ansistring='';
  otkr:integer=0;

implementation

uses Mainform, DicKlient, ANALIZTW, DicTowar, SelectPrint, SetKolvo,
  SetOstSt, PrintDoc;

{$R *.DFM}



procedure TDoc_St.Show_sost;
var
   s:ansistring;
   StEmpty:boolean;
   c:integer;
   SHOW_COLUMN:ansistring;
   i: integer;
begin
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

     if Doc_St.Tag<0 then
       Doc_ST.caption:='Счёт. Новый'
     else Doc_ST.caption:='Счёт. Редактирование';
     if MemSTS.RecordCount=0 then StEmpty:=true else StEmpty:=false;
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
     Btn_SAVE.enabled:=(not StEmpty);
     MnSAVE.enabled:=(not StEmpty);
     MnSEt_SKid.enabled:=(not StEmpty) ;
     Btn_Apply.enabled:=(not StEmpty);
     MnApply.enabled:=(not StEmpty);
     Btn_Print.enabled:=not StEmpty;
     MnPrint.enabled:=not StEmpty;
     Btn_Propertis.enabled:=true;
     MnHistory.enabled:=true;
     Btn_RefreshOst.enabled:=not StEmpty;
     MnRefreshOst.enabled:=not StEmpty;
     Btn_SubDoc.enabled:=not StEmpty;
     MnSubDoc.enabled:=not StEmpty;
     Btn_DicTow.enabled:=true;
     MnTw.enabled:=True;
     Btn_DelTow.enabled:=not StEmpty;
     MnDel.enabled:=not StEmpty;
     Btn_DETAL.enabled:=not StEmpty and CANTW_DETAL;
     MnDETAL.enabled:=not StEmpty and CANTW_DETAL;
     Btn_Analiz.enabled:=not StEmpty and CANTW_ANALIZ;
     MnAnaliz.enabled:=not StEmpty and CANTW_ANALIZ;
     Btn_Marketing.enabled:=not StEmpty and CANTW_MARKETING;
     MnMarketing.enabled:=not StEmpty and CANTW_MARKETING;
     Btn_PrintCenn.enabled:=not StEmpty;
     MnCenn.enabled:=not StEmpty;
     Btn_PrintCennMore.enabled:=not StEmpty;
     MnCennMore.enabled:=not StEmpty;
     RxDbgrid1.ReadOnly:=False;
     BTN_KLN.enabled:=True;
     ST_DATE.enabled:=True;
     ST_VALUTA.enabled:=True;
     NDS.enabled:=True;
     ST_OSN.enabled:=True;
end;

procedure TDoc_St.Change_FrmKln(ID,N:integer);
var
   s1,s2:ansistring;
   kateg:integer;
begin
     {Отображаем название фирмы и банка}
//     Query1Transaction.Active:=False;
     IbQuery2.Close;
     IbQuery2.SQL.clear;
     IbQuery2.SQL.add('select * from kln_data_frm(:KLN_ID, :frm_id)');
     IbQuery2.Parambyname('KLN_ID').asinteger:=ID;
     IbQuery2.Parambyname('FRM_ID').asinteger:=GL_FRM_WORK_MODE;
     IbQuery2.Open;
     if IbQuery2.eof then begin
       s1:='Не найден!';
       s2:='Не найден!';
     end else begin
       s1:=IbQuery2.fieldByname('KLN_FULL').asstring;
       S2:=IbQuery2.fieldByname('KLN_REKW').asstring;
     end;
     if N=1 then begin
        FRM_BNK.text:=s2;

        if (IbQuery2.fieldByname('KLN_USE_NDS').asstring='1') then
                NDS.Value:=18
        else
                NDS.Value:=0;

     end else begin
        KLN_NAME.text:=s1;
        kln_ktg.Text:=IbQuery2.fieldByname('KLN_ktg').asstring;

        if kln_ktg_id<>IbQuery2.fieldByname('KLN_ktg_id').asinteger then
        begin
          kln_ktg_id:=IbQuery2.fieldByname('KLN_ktg_id').asinteger;
          if initComplete then
            SetKlnPrice(memSTS, kln_ktg_id);
          Refresh_summ;
        end;

        kln_ktg_id:=IbQuery2.fieldByname('KLN_ktg_id').asinteger;
        KLN_BNK.text:=s2;
     end;
     IbQuery2.Close;
//************
     if otkr<>1 then
     begin
     if not MemSTS.IsEmpty then
     begin
       memSTS.First;
       MemSTS.DisableControls;
       while not memSTS.Eof do
       begin
         MemSTS.Edit;
         kateg:=Get_napr_kln(MemSTS.Fieldbyname('TW_ID').asinteger);

         MemSTS.Fieldbyname('TW_SKID').asfloat:= (MemSTS.Fieldbyname('TW_MONEY').asfloat- GetTWKtgPrice(MemSTS.Fieldbyname('TW_ID').asinteger,kateg {kln_ktg_id}))*100/MemSTS.Fieldbyname('TW_MONEY').asfloat;
         MemSTS.Post;
         MemSTS.Next;
       end;
       memSTS.First;
       MemSTS.EnableControls;
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

procedure TDoc_ST.SetNDS;
var nds_ok: boolean;
begin
/////////////////////////////////////////////////////////////////////////
nds_ok := false;
          {
          Add_SQL(IbQuery1,'select RES from ST_CHECK(:ST_ID)');
          IbQuery1.Parambyname('ST_ID').asinteger:=Doc_ST.tag;
          IbQuery1.Open;
          if (IbQuery1.FieldByName('RES').AsInteger = 1) and
          (NDS_SMALL_DATE(ST_DATE.Date)<> NDS.Value) then
          begin
             Messbox('Ставка НДС выставлена в соответствии с текущей настройкой!',MessSystem,48);
             NDS.Value := NDS_SMALL_DATE(ST_DATE.Date);
             nds_ok :=true;
          end;
          if (IbQuery1.FieldByName('RES').AsInteger = 2) and
          (NDS_DATE(ST_DATE.Date)<> NDS.Value) then
          begin
             Messbox('Ставка НДС выставлена в соответствии с текущей настройкой!',MessSystem,48);
             NDS.Value := NDS_DATE(ST_DATE.Date);
             nds_ok :=true;
          end;




        if (not nds_ok) then

        if (NDS.value<>NDS_DATE(ST_DATE.date))
           AND (NDS.Value <> NDS_SMALL_DATE(ST_DATE.Date)) then
           begin
           NDS.value:=NDS_DATE(ST_DATE.date);
           SAVE:=False;
           Messbox('Ставка НДС выставлена в соответствии с текущей настройкой!',MessSystem,48);
        end;
        }

        NDS.enabled:=True;
//
end;

procedure TDoc_St.FormShow(Sender: TObject);
begin
     real_typ:=1;
     initComplete:=false;
     Timer1.enabled:=False;
     OstTransaction.Active:=False;
     QrListOst.Close;
     QrListOst.ParamByname('US_ID').asinteger:=USERID;
     QrListOst.Open;
     ListOst.value:='-1';
     CanTimer:=False;
     StDocTransaction.Active:=False;
     IbValuta.close;
     IbValuta.Open;



     FRM.Value := inttostr(DEFAULT_FIRMA);





     Sost:=0;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-29;
     {Определяем название}
     if Doc_St.tag<0 then begin
       BtnOnHelp.enabled:=False;
       MnOnHelp.enabled:=False;
       Sost:=1;
       Get_default;
       ST_VALUTA.value:='0';
       {Устанавливаем данные}
       SHOP_ID:=SHOPID;
       KLN_ID:=DEFAULT_KLIENT;
       ST_OSN.lines.clear;
       ST_NUM.text:='Новый';
       ST_DATE.date:=Date();
       ST_NUMS:=-1;
       NDS.value:=NDS_DATE(ST_DATE.date);

       SetNDS;
//
     end else begin
         BtnOnHelp.enabled:=True;
         MnOnHelp.enabled:=True;
          {Читаем счёт}
          IbQuery1.Close;
          IbQuery1.SQL.clear;
          IbQuery1.SQL.add('select * from ST where ST_ID=:ST_ID');
          IbQuery1.Parambyname('ST_ID').asinteger:=Doc_St.tag;
          IbQuery1.Open;
          FRM.value:=inttostr(IbQuery1.fieldbyname('FRM_ID').asinteger);
          if FRM.Value='' then
     		begin
     		   Datamodule1.IbSaveSQL.Transaction.Active:=false;
     		   Datamodule1.IbSaveSQL.SQL.Text:='SELECT KLN_FULL FROM KLN_DATA(:KLN_ID)';
     		   Datamodule1.IbSaveSQL.parambyname('KLN_ID').asinteger:=IbQuery1.fieldByname('FRM_ID').asinteger;
				Datamodule1.IbSaveSQL.Open;
     		   if not Datamodule1.IbSaveSQL.Eof then
      		  begin
      		 	  FRM.displayempty:=Datamodule1.IbSaveSQL.Fieldbyname('KLN_FULL').asstring;
      		      FRM.emptyvalue:=inttostR(IbQuery1.fieldByname('FRM_ID').asinteger);
      		  end;
       		 Datamodule1.IbSaveSQL.Close;
    		end;

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
          SHOP_ID:=IbQuery1.fieldbyname('SHOP_ID').asinteger;
          ST_OSN.lines.clear;
          ST_OSN.lines.add(IbQuery1.fieldbyname('ST_OSN').asstring);
          ST_NUM.text:=IbQuery1.fieldbyname('ST_NUM').asstring;
          ST_NUMS:=IbQuery1.fieldbyname('ST_NUM').asinteger;
          ST_DATE.date:=IbQuery1.fieldbyname('ST_DATE').asdatetime;
          ST_VALUTA.value:=IbQuery1.fieldbyname('VALUTA_ID').asstring;
          NDS.value:=IbQuery1.fieldbyname('NDS').asfloat;
          {Читаем содержимое накладной}
          IbQuery1.Close;
          IbQuery1.SQL.clear;
          IbQuery1.SQL.add('select * from LIST_STS(:ST_ID) order by STS_ID');
          IbQuery1.Parambyname('ST_ID').asinteger:=Doc_St.tag;
          IbQuery1.Open;
          while not IbQuery1.eof do begin
                CanInsert:=True;
                MemSTS.Append;
                Get_napr_kln(IbQuery1.Fieldbyname('TW_ID').asinteger);
                MemSTS.Fieldbyname('STS_ID').asinteger:=IbQuery1.Fieldbyname('STS_ID').asinteger;
                MemSTS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TW_COLOR').asinteger;
                MemSTS.Fieldbyname('TW_ID').asinteger:=IbQuery1.Fieldbyname('TW_ID').asinteger;
                MemSTS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
                MemSTS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
                MemSTS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
                MemSTS.Fieldbyname('TW_KOL').asfloat:=IbQuery1.Fieldbyname('TW_KOL').asfloat;
                MemSTS.Fieldbyname('TW_MONEY').asfloat:=IbQuery1.Fieldbyname('TW_MONEY').asfloat;
{---}           MemSTS.Fieldbyname('TW_WEIGHT').asfloat:=IbQuery1.Fieldbyname('TW_WEIGHT').asfloat;
                MemSTS.Fieldbyname('TW_SKID').asfloat:=IbQuery1.Fieldbyname('TW_SKID').asfloat;
                MemSTS.Fieldbyname('TW_SKID_LOAD').asfloat:=MemSTS.Fieldbyname('TW_SKID').asfloat;
                MemSTS.Fieldbyname('MET_MONEY_SHOP').asstring:=IbQuery1.Fieldbyname('MET_MONEY_SHOP').asstring;
                MemSTS.fieldByname('OST').asfloat:=GetOst(IbQuery1.Fieldbyname('TW_ID').asinteger,0, gl_frm_work_mode);
                MemSTS.fieldByname('TW_NOSKID').asfloat:=IbQuery1.Fieldbyname('TW_NOSKID').asinteger;

                MemSTS.Fieldbyname('TW_SEB').AsFloat:=GetTWKtgPrice(IbQuery1.Fieldbyname('TW_ID').asinteger, 5);
                
                MemSTS.Post;
                CanInsert:=False;
                IbQuery1.next;
          end;
     end;
///////////////////////////////////////////////////////////////////////
//Добавлено для проверки НДС открываемых накладных.
//11.04.2004 Игорь Сторожев
{
                        Add_SQL(IbQuery1,'select RES from ST_CHECK(:ST_ID)');
                        IbQuery1.Parambyname('ST_ID').asinteger:=Doc_ST.tag;
                        IbQuery1.Open;
                        if (IbQuery1.FieldByName('RES').AsInteger = 1) and
                        (NDS_SMALL_DATE(ST_DATE.Date)<> NDS.Value) then
                          begin
                            Messbox('В соответствии с настройками и введеными товарами ставка НДС в накладной должна быть равна '+floattostrf(NDS_SMALL_DATE(ST_DATE.date),fffixed,19,2)+' %! ',MessSystem,16);
                          end;
                        if (IbQuery1.FieldByName('RES').AsInteger = 2) and
                        (NDS_DATE(ST_DATE.Date)<> NDS.Value) then
                          begin
                            Messbox('В соответствии с настройками и введеными товарами ставка НДС в накладной должна быть равна '+floattostrf(NDS_DATE(ST_DATE.date),fffixed,19,2)+'%!',MessSystem,16);
                          end;

                        if (NDS.value<>NDS_DATE(ST_DATE.date)) and (NDS.value<>NDS_SMALL_DATE(ST_DATE.date))
                        then Messbox('В соответствии с настройками ставка НДС в накладной должна быть равна '+floattostrf(NDS_DATE(ST_DATE.date),fffixed,19,2)+'% или '+floattostrf(NDS_SMALL_DATE(ST_DATE.date),fffixed,19,2)+'%!',MessSystem,16);
 }





     otkr:=1;
     if FRM.value<>'' then
       Change_FrmKln(strtoint(FRM.value),1);
     Change_FrmKln(KLN_ID,2);
     otkr:=0;
     Refresh_summ;
     Show_Sost;
     SAVE:=true;
     RxDbGrid1.setfocus;
     Timer1.enabled:=True;
     CanTimer:=True;
     initComplete:=true;
end;

procedure TDoc_St.FormKeyPress(Sender: TObject; var Key: Char);
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
              key:=#0;
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
                    ADD_STS(ID,-1);
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
  if key=#10 then begin
     key:=#0;
     try
       KLN_NAME.setfocus;
     except
     end;
     if BTN_SAVE.enabled then Btn_SAVE.click;
  end;
     Show_Sost;
end;

procedure TDoc_St.MemSTSCalcFields(DataSet: TDataSet);
begin
     MemSTS.fieldbyname('TW_OKMONEY').asfloat:=
       OKRUG(MemSTS.fieldbyname('TW_MONEY').asfloat*(1-(MemSTS.fieldbyname('TW_SKID').asfloat)/100),2);
     MemSTS.fieldbyname('TW_SUMM').asfloat:=MemSTS.fieldbyname('TW_OKMONEY').asfloat*MemSTS.fieldbyname('TW_KOL').asfloat;
     MemSTS.fieldbyname('STS_WEIGHT').asfloat:=MemSTS.fieldbyname('TW_WEIGHT').asfloat*MemSTS.fieldbyname('TW_KOL').asfloat;
end;

Procedure TDoc_St.Refresh_summ;
var
   a,ID:integer;
   Summ,sw:Double;
   nac_summ: Double;
begin
     nac_summ:=0;
     if MemSTS.RecordCount=0 then
     begin
        ST_SUMM.Value:=0;
        NDS.ReadOnly:=false;
        MenuNDS.Items[0].Visible:=true;
     end
     else begin
         ID:=MemSTS.RecNo;
         MemSTS.DisableControls;
         MemSTS.First;
         Summ:=0;
         while not MemSTS.eof do begin
               SUMM:=SUMM+MemSTS.fieldbyname('TW_SUMM').asfloat;
               sw:=sw+MemSTS.fieldbyname('STS_WEIGHT').asfloat;

               nac_summ:=nac_summ+
               (
               (MemSTS.fieldbyname('TW_MONEY').asfloat*((100-MemSTS.fieldbyname('TW_SKID').asfloat)/100)) - MemSTS.fieldbyname('TW_seb').asfloat)
               *(MemSTS.fieldbyname('TW_KOL').asfloat);


               MemSTS.next;
         end;
         MemSTS.First;
         for a:=1 to ID-1 do MemSTS.next;
         ST_SUMM.Value:=SUMM;
//         NDS.ReadOnly:=true;
         MenuNDS.Items[0].Visible:=false;
         MemSTS.EnableControls;
         RN_WEIGHT.Value:=sw;
         st_nac.value:=nac_summ;

     end;
end;

procedure TDoc_St.BTN_KLNClick(Sender: TObject);
var pers:integer;
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=KLN_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN_ID then begin
        KLN_ID:=DIC_KLIENT.tag;
        Change_FrmKln(KLN_ID,2);
//*******
      if not MemSTS.IsEmpty then
      begin
       memSTS.First;
       MemSTS.DisableControls;
       while not memSTS.Eof do
       begin
         if ((MemSTS.Fieldbyname('napr').asfloat=1) or (MemSTS.FieldByName('tw_noskid').asinteger=1)) then
           pers:=0
         else
           pers:=PERS_SKID;

         MemSTS.Edit;
         MemSTS.Fieldbyname('TW_SKID').asfloat:=MemSTS.Fieldbyname('TW_SKID').asfloat+pers;
         MemSTS.Fieldbyname('TW_SKID_LOAD').asfloat:=MemSTS.Fieldbyname('TW_SKID').asfloat;

         if (MemSTS.Fieldbyname('napr').asfloat=1) then
           MemSTS.Fieldbyname('SKID_TXT').asstring:='Направление клиента';
         if(pers<>0) and (MemSTS.Fieldbyname('napr').asfloat=0) then
           MemSTS.Fieldbyname('SKID_TXT').asstring:=MemSTS.Fieldbyname('SKID_TXT').asstring + ' + перс.скидка';

         MemSTS.Post;
         MemSTS.Next;
       end;
       memSTS.First;
       MemSTS.EnableControls;
      end;
//*******
     end;
     DIC_KLIENT.Destroy;
     RxDbgrid2.setfocus;
end;


procedure TDoc_St.Btn_ApplyClick(Sender: TObject);
var
   A,ST_ID,ID,OLDID:integer;
   r,IDR:double;
begin
     if (MemSTs.State in [dsInsert,DsEdit]) then MemSts.Post;

      if FRM.value='' then
   	  begin
	     Messbox('Не указана фирма!',  MessError, MB_OK);
    	 exit;
	  end;
     if CheckTWPrice(memSTS, kln_ktg_id)<0 then
      exit;


     CanTimer:=False;;
     Timer1.enabled:=False;
     {Сохраняем счёт (Apply)}
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     OLDID:=MemSTS.recno;
     Try
        IBSAVE_CLEAR;
        if ST_NUMS<0 then ST_NUMS:=NEW_ST_NUM(strtoint('0'+FRM.Value),ST_DATE.date);
        IBSAVE_ADD('ST_NUM',ST_NUMS);
        IBSAVE_ADD('ST_SKID',0);
        IBSAVE_ADD('ST_DATE',strtodatetime(datetostr(ST_DATE.date)+' '+timetostr(time())));
        IBSAVE_ADD('SHOP_ID',SHOP_ID);
        IBSAVE_ADD('ST_OSN',Memotostr(ST_OSN.lines));
        IBSAVE_ADD('KLN_ID',KLN_ID);
        IBSAVE_ADD('US_ID',USERID);
        IBSAVE_ADD('FRM_ID',strtoint(frm.value));
        IBSAVE_ADD('NDS',NDS.value);
        IBSAVE_ADD('VALUTA_ID',ST_VALUTA.value);
        ST_ID:=IBSAVE_DOC('ST',DOC_ST.tag);
        if ST_ID<=0 then IDR:=SQRT(-1)
        else begin
             // Фиксируем удаление товаров
             for A:=1 to CNT_DEL do begin
               IBSAVE_CLEAR;
               IBSAVE_ADD('DOC','ST');
               IBSAVE_ADD('US_ID',USERID);
               IBSAVE_ADD('SHOP_ID',SHOPID);
               IBSAVE_ADD('MESS',STS_DEL_MESS[a]);
               IBSAVE_ADD('DOP1',4);
               IBSAVE_ADD('DOP2',ST_ID);
               if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
             end;
             {Сохраняем содержимое}
             {Сначала удаляем удалённое}
             for A:=1 to CNT_DEL do begin
                 if STS_DEL[A]>0 then if not IBDELETE_DOC('STS',STS_DEL[A]) then IDR:=SQRT(-1);
             end;
             {Сохраняем имеющееся}
             MemSTS.DisableControls;
             MemSTS.First;
             while not MemSTS.eof do begin
                   IBSAVE_CLEAR;
                   IBSAVE_ADD('ST_ID',ST_ID);
                   IBSAVE_ADD('TW_ID',MemSTS.fieldbyname('TW_ID').asinteger);
                   IBSAVE_ADD('TW_KOL',MemSTS.fieldbyname('TW_KOL').asfloat);
                   IBSAVE_ADD('TW_MONEY',OKRUG(MemSTS.fieldbyname('TW_MONEY').asfloat,2));
                   IBSAVE_ADD('TW_SKID',MemSTS.fieldbyname('TW_SKID').asfloat);
                   ID:=IBSAVE_DOC('STS',MemSTS.fieldbyname('STS_ID').asinteger);
                   if ID<0 then IDR:=SQRT(-1) else begin
                      if (DOC_ST.tag>0) and (MemSTS.fieldbyname('STS_ID').asinteger<0) then begin
                          // Фиксируем факт добавления товара
                          IBSAVE_CLEAR;
                          IBSAVE_ADD('DOC','ST');
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          IBSAVE_ADD('MESS','Добавлен товар: '+MemSTS.Fieldbyname('TW_ART').asstring+' '+
                          MemSTS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemSTS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
                          MemSTS.Fieldbyname('ED_SHORT').asstring+' по цене '+floattostrf(MemSTS.Fieldbyname('TW_OKMONEY').asfloat,fffixed,19,2));
                          IBSAVE_ADD('DOP1',2);
                          IBSAVE_ADD('DOP2',ST_ID);
                          if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                      end;
                      MemSTS.Edit;
                      MemSTS.fieldbyname('STS_ID').asinteger:=ID;
                      MemSTS.Post;
                   end;
                   MemSTS.next;
             end;
        end;
        {Всё прошло нормально - изменяем временные данные}
        {Отображаем номер}
        Doc_ST.tag:=ST_ID;
        ST_NUM.text:=inttostr(ST_NUMS);
        MemSTS.First;
        while not MemSTS.eof do begin
              if MemSTS.fieldbyname('STS_ID').asinteger<0 then begin
                 MemSTS.Edit;
                 MemSTS.fieldbyname('STS_ID').asinteger:=-MemSTS.fieldbyname('STS_ID').asinteger;
                 MemSTS.Post;
              end;
              MemSTS.next;
        end;
        MemSTS.First;
        for a:=1 to OLDID-1 do MemSTS.next;
        SAVE:=TRUE;
        CNT_DEL:=0;
        MemSTS.EnableControls;
        Datamodule1.IBTransaction2.Commit;
        BtnOnHelp.enabled:=True;
        MnOnHelp.enabled:=True;
     Except
        Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
     CanTimer:=True;
     Timer1.enabled:=True;
end;

procedure TDoc_St.MemSTSTW_IDChange(Sender: TField);
begin
     SAVE:=FALSE;
end;

procedure TDoc_St.Btn_SAVEClick(Sender: TObject);
begin
     SAVE:=false;
     Btn_Apply.Click;
     if SAVE then begin
        Close;
     end;
end;

procedure TDoc_St.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save) and (Btn_Apply.enabled) then begin
        if Messbox('Счёт был изменён! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDoc_St.DsSTSDataChange(Sender: TObject; Field: TField);
begin
     if (MemSTS.State in [dsInsert]) and ( not CanInsert) then MemSTS.Cancel;
end;

procedure TDoc_St.Btn_DelTowClick(Sender: TObject);
begin
     if Messbox('Удалить из счёта товар "'+MemSTS.Fieldbyname('TW_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        SAVE:=False;
        if MemSTS.Fieldbyname('STS_ID').asinteger>0 then begin
          inc(CNT_DEL);
          STS_DEL[CNT_DEL]:=MemSTS.Fieldbyname('STS_ID').asinteger;
          STS_DEL_MESS[CNT_DEL]:='Удален товар: '+MemSTS.Fieldbyname('TW_ART').asstring+' '+
          MemSTS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemSTS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
          MemSTS.Fieldbyname('ED_SHORT').asstring+' по цене '+floattostrf(MemSTS.Fieldbyname('TW_OKMONEY').asfloat,fffixed,19,2);
        end;
        MemSTS.delete;
        Refresh_summ;
        Show_Sost;
     end;
end;

procedure TDoc_St.Btn_DetalClick(Sender: TObject);
begin
  SHOW_DETAL_TW(MemSTS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_St.FormKeyDown(Sender: TObject; var Key: Word;
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
          Select_Print.Button1.caption:='Напечатать счёт';
          Select_Print.Button2.caption:='Напечатать Ценник на выбранный товар';
          Select_Print.Button3.caption:='Напечатать Ценники на все товары в счёте';
          Select_Print.showModal;
          if Select_Print.tag>0 then begin
             if (Btn_Print.Enabled) and (Select_Print.tag=1) then Btn_Print.click;
             if (Btn_PrintCenn.Enabled) and (Select_Print.tag=2) then Btn_PrintCenn.click;
             if (Btn_PrintCennMore.Enabled) and (Select_Print.tag=3) then Btn_PrintCennMore.click;
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
        Btn_SAve.click;
     end;
end;

//*****
function TDoc_St.Get_napr_kln(TW_ID:integer): integer;
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
         MemSTS.FieldByName('napr').asinteger:=0;
         MemSTS.FieldByName('ktg').asinteger:=kln_ktg_id;
       end
       else
       begin
         kateg:=0;
         while not QueryWork.Eof do
         begin
           if kateg<QueryWork.FieldByName('skid').asinteger then
           begin
             kateg:=QueryWork.FieldByName('skid').asinteger;
             MemSTS.FieldByName('ktg').asinteger:=kateg;
           end;
           QueryWork.Next;
         end;
         MemSTS.FieldByName('napr').asinteger:=1;
       end;
  result:=kateg;
end;
//*****

procedure TDoc_St.ADD_STS(TW_ID:integer;KOL:double);
var
   TW_TEMP,kateg,pers:integer;
   TW_STR:ansistring;
   ISS:boolean;
   VALUTA_ID:integer;
   KURS1,KURS2:double;
   nds_error: boolean;
   klnKtgName: string;
begin
    nds_error := false;
     TW_TEMP:=0;

     if FRM.value='' then
     begin
      Messbox('Не указана фирма!',  MessError, MB_OK);
      exit;
     end;


     {Проверяем, нет ли в счёте уже такого товара}
     if MemSTS.RecordCount>0 then TW_TEMP:=MemSTS.fieldByname('TW_ID').asinteger;
     ISS:=false;
     MemSTS.Disablecontrols;
     MemSTS.first;
     while (not MemSTS.eof) and (not ISS) do begin
           if MemSTS.fieldByname('TW_ID').asinteger=TW_ID then begin
              ISS:=true;
              TW_STR:=MemSTS.fieldByname('TW_ART').asstring+'-'+MemSTS.fieldByname('TW_NAM').asstring;
           end;
           MemSTS.next;
     end;
     MemSTS.EnableControls;
     if ISS then Messbox('Счёт уже содержит товар '+TW_STR+' и он не может быть добавлен!',MessSystem,48) else
     begin
          Query1Transaction.Active:=False;
          ADD_SQL(IbQuery1,'select tw.valuta_id,twktg.twktg_color,tw.tw_weight,tw.tw_art,tw.tw_nam,tw.ed_id, tw.tw_nds_small, ed.ed_short, '+
          '(select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
          '(select max(kurs_date) from kurs where '+
          'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz '+
          'from tw,ed,twktg '+
          'where tw.ed_id=ed.ed_id and tw.tw_id=:TW_ID and tw.twktg_id=twktg.twktg_id ');

          ADD_SQL(IbQuery2,'select * from tw_mroz(:tw_id,:SHOP_ID)');
          IbQuery1.Parambyname('TW_ID').asinteger:=TW_ID;
          IbQuery2.Parambyname('TW_ID').asinteger:=TW_ID;
          IbQuery2.Parambyname('SHOP_ID').asinteger:=SHOPID;
          IbQuery1.Open;
          IbQuery2.Open;
//          DataModule1.MainDicRnTyp.Locate('RNTYP_ID',Doc_ST.ToolBar1.Tag,[]);
          // НДС всегда выделяется!
//Игорь Сторожев 10.04.2004 для НДС=10%
          if  (IbQuery1.Fieldbyname('TW_NDS_SMALL').asstring='1')
                and  (NDS.Value <> NDS_SMALL_DATE(ST_DATE.Date))  then nds_error:=true;
          if  (IbQuery1.Fieldbyname('TW_NDS_SMALL').asstring<>'1')
                and  (NDS.Value <> NDS_DATE(ST_DATE.Date))  then nds_error:=true;
//          if (DataModule1.MainDicRnTyp.fieldByname('RNTYP_NDS').asinteger=1)
//          and (nds_error) then Messbox('НДС товара не соответствует НДС накладной и он не может быть добавлен!',MessSystem,48)
         //////17-74-207 if (nds_error) then Messbox('НДС товара не соответствует НДС накладной и он не может быть добавлен!',MessSystem,48)

      //17-04-2017 else

      begin
          CanInsert:=True;
          MemSTS.Append;

          Kateg:=Get_napr_kln(TW_ID);

          MemSTS.Fieldbyname('STS_ID').asinteger:=-1;
          MemSTS.Fieldbyname('TW_ID').asinteger:=TW_ID;
          MemSTS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TWKTG_COLOR').asinteger;
          MemSTS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
          MemSTS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
          MemSTS.Fieldbyname('TW_WEIGHT').asfloat:=IbQuery1.Fieldbyname('TW_WEIGHT').asfloat;
          MemSTS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
          MemSTS.Fieldbyname('TW_MONEY').asfloat:=IbQuery2.Fieldbyname('MONEY').asfloat;
          MemSTS.Fieldbyname('MET_MONEY_SHOP').asstring:=IbQuery2.Fieldbyname('MET_MONEY_SHOP').asstring;

          ADD_SQL(IBQuery3, 'select valueint from proptw where tw_id=:tw_id and proptwtyp_id=6 and frm_id = :FRM_ID');
          IBQuery3.ParamByName('TW_ID').asinteger:=TW_ID;
          IBQuery3.ParamByName('FRM_ID').asinteger:=GL_FRM_WORK_MODE;
          IBQuery3.Open;
          if ibquery3.Eof then
            MemSTS.Fieldbyname('TW_NOSKID').asinteger:=0
          else
            MemSTS.Fieldbyname('TW_NOSKID').asinteger:=IBQuery3.fieldByName('VALUEINT').asinteger;
          IBQuery3.Close;


          MemSTS.Fieldbyname('TW_SEB').AsFloat:=GetTWKtgPrice(TW_ID, 5);


//          MemSTS.Fieldbyname('TW_NOSKID').asinteger:=IbQuery1.Fieldbyname('TW_NOSKID').asinteger;


          if ((MemSTS.Fieldbyname('napr').asfloat=1) or (MemSTS.FieldByName('tw_noskid').asinteger=1)) then
            pers:=0
          else
            pers:=pers_skid;       //strtoint(QueryWork.fieldbyname('valuestr').asstring);
          MemSTS.Fieldbyname('TW_SKID').asfloat:= ((IbQuery2.Fieldbyname('MONEY').asfloat- GetTWKtgPrice(TW_ID,kateg {kln_ktg_id}))*100/IbQuery2.Fieldbyname('MONEY').asfloat)+pers;

          MemSTS.Fieldbyname('TW_SKID_LOAD').asfloat:=MemSTS.Fieldbyname('TW_SKID').asfloat;





          MemSTS.fieldByname('OST').asfloat:= GetOst(TW_ID, 0, gl_frm_work_mode);
          if KOL<0 then begin
             Application.createForm(TSET_KOLVO,SET_KOLVO);
             SET_KOLVO.NAME.text:=IbQuery1.fieldByname('TW_ART').asstring+
                            IbQuery1.fieldByname('TW_NAM').asstring;
             SET_KOLVO.showModal;
             if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
             MemSTS.Fieldbyname('TW_KOL').asfloat:=SET_KOLVO.KOL.value;
             SET_KOLVO.destroy;
          end else MemSTS.Fieldbyname('TW_KOL').asfloat:=KOL;
          MemSTS.Post;
          CanInsert:=False;
     end;  //nds_error check
     end;
     IbQuery1.Close;
     RxDbGrid1.setfocus;
end;

procedure TDoc_St.Btn_PrintClick(Sender: TObject);
begin
     SAVE:=false;
     Btn_Apply.Click;
     if (SAVE) then begin
        {Печатаем}
        PRINT_ST(Doc_St.tag);
     end;
end;

procedure TDoc_St.Btn_SubdocClick(Sender: TObject);
begin
     SAVE:=false;
     Btn_Apply.Click;
     if (SAVE) then begin
        {Создаём документ на основании имеющегося...}
        SUBDOC(2,Doc_ST.tag);
     end;
end;

procedure TDoc_St.Btn_PropertisClick(Sender: TObject);
begin
        {Отображаем "историю" приходной накладной}
        SHOW_HISTORY_DOC('Счет № '+ST_NUM.text,'ST',DOC_ST.tag);
end;

procedure TDoc_St.Btn_DicTowClick(Sender: TObject);
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
            ADD_STS(ARR_TW[a].ID,ARR_TW[a].KOL);
        end;
     end;
     Refresh_summ;
     Show_sost;
     CanTimer:=True;
     Timer1.enabled:=True;
end;

procedure TDoc_St.Btn_FindTowClick(Sender: TObject);
begin
     {}
end;

procedure TDoc_St.Btn_AnalizClick(Sender: TObject);
begin
   SHOW_ANALIZ_TW(MemSTS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_St.Btn_MarketingClick(Sender: TObject);
begin
     SHOW_MARKETING_TW(MemSTS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_St.Btn_PrintCennClick(Sender: TObject);
begin
     CLEAR_CENNIK;
     ADD_CENNIK(MemSTS.fieldbyname('TW_ID').asinteger,Default_sklad, FRM.Text);
     PRINT_CENNIK;
end;

procedure TDoc_St.Btn_PrintCennMoreClick(Sender: TObject);
var
   a,ID:integer;
begin
     CanTimer:=False;
     Timer1.enabled:=False;
     CLEAR_CENNIK;
     if MemSTS.RecordCount>0 then begin
         ID:=MemSTS.RecNo;
         MemSTS.DisableControls;
         MemSTS.First;
         while not MemSTS.eof do begin
               ADD_CENNIK(MemSTS.fieldbyname('TW_ID').asinteger,default_sklad, FRM.Text);
               MemSTS.next;
         end;
         MemSTS.First;
         for a:=1 to ID-1 do MemSTS.next;
         MemSTS.EnableControls;
         PRINT_CENNIK;
     end;
     CanTimer:=True;
end;

procedure TDoc_St.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     CanTimer:=False;
     Timer1.enabled:=False;
     IbValuta.close;
end;

procedure TDoc_St.MnSet_SkidClick(Sender: TObject);
begin
     application.createForm(TSET_SKID,SET_SKID);
     GLOBAL_MON1:=MemSTS.fieldByname('TW_MONEY').asfloat;
     SET_SKID.MONEY1.value:=MemSTS.fieldByname('TW_MONEY').asfloat;
     SET_SKID.MONEY2.value:=MemSTS.fieldByname('TW_OKMONEY').asfloat;
     SET_SKID.showModal;
     if SET_SKID.tag>0 then begin
        MemSTS.edit;
        MemSTS.fieldByname('TW_SKID').asfloat:=GLOBAL_SKID;
        MemSTS.Post;
     end;
     SET_SKID.Destroy;
     Refresh_summ;
end;

procedure TDoc_St.Btn_RefreshOstClick(Sender: TObject);
var
   a,ID:integer;
   Summ:Double;
   s:ansistring;
begin
     Refresh_Summ;
     s:=Doc_ST.caption;
     Doc_ST.caption:=Doc_ST.caption+'. Чтение остатков товаров';
     if MemSTS.RecordCount>0 then begin
         ID:=MemSTS.RecNo;
         MemSTS.DisableControls;
         MemSTS.First;
         Summ:=0;
         while not MemSTS.eof do begin
               MemSTS.Edit;
               MemSTS.fieldByname('OST').asfloat:=GetOst(MemSTS.Fieldbyname('TW_ID').asinteger,0, gl_frm_work_mode);
               MemSTS.Post;
               MemSTS.next;
         end;
         MemSTS.First;
         for a:=1 to ID-1 do MemSTS.next;
         MemSTS.EnableControls;
     end;
     Doc_ST.caption:=s;
end;

procedure TDoc_St.BtnOnHelpClick(Sender: TObject);
var
   s:ansistring;
begin
     if Not Save then Btn_Apply.click;
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select * from help_on_st(:st_id)');
     QueryWork.ParamByname('ST_ID').asinteger:=DOC_ST.tag;
     QueryWork.Open;
     if QueryWork.eof then Messbox('Товар по Счёту не может быть полностью выписан ни с одного из складов!',MessSystem,48)
     else begin
          s:='';
          while not QueryWork.eof do begin
                s:=s+QueryWork.fieldByname('SKL_SHORT').asstring+', ';
                QueryWork.next;
          end;
          s:=B_utils.left(s,length(s)-2);
          Messbox('Товар по счёту полностью может быть выписан со складов: '+s,MessSystem,48);
     end;
     QueryWork.Close;
     WorkTransaction.Active:=False;
end;

procedure TDoc_St.Timer1Timer(Sender: TObject);
begin
 if ShowOst.checked then begin
   try
     Timer1.enabled:=False;
     if MemSTS.recordcount>0 then begin
       QrFastInfo.close;
       if CanTimer then begin
         FastInfoTransaction.Active:=False;
         QrFastInfo.Open;
       End;
     end;
   Except
   End;
 end;
end;

procedure TDoc_St.MemSTSAfterPost(DataSet: TDataSet);
begin
     Timer1.enabled:=False;
     QrFastInfo.close;
     if MemSTS.recordcount>0 then begin
       QrFastInfo.ParamByname('TW_ID').asinteger:=MemSTS.fieldByname('TW_ID').asinteger;
       Timer1.enabled:=True;
     end;


end;

procedure TDoc_St.MemSTSAfterDelete(DataSet: TDataSet);
begin
     Timer1.enabled:=False;
     QrFastInfo.close;
     if MemSTS.recordcount>0 then begin
       QrFastInfo.ParamByname('TW_ID').asinteger:=MemSTS.fieldByname('TW_ID').asinteger;
       Timer1.enabled:=True;
     end;
end;

procedure TDoc_St.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
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

procedure TDoc_St.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
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
     if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET_MONEY_SHOP').Asstring='1') and
     (Field.Fieldname='TW_MONEY') then begin
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

procedure TDoc_St.ToolButton6Click(Sender: TObject);
begin
     My_lock;

end;


procedure TDoc_St.MemSTSTW_KOLChange(Sender: TField);
var
  val:double;
begin
   SAVE:=FALSE;
   val:=MemSTS.fieldByname('TW_KOL').asfloat;
   if val<=0 then begin
     MemSTS.fieldByname('TW_KOL').asfloat:=1;
     messbox('Количество товара не может быть нулевой или отрицательной величиной! '+CR+
     'Количеcтво с '+floattostrf(val,fffixed,19,4)+' изменено на 1.000!',MessError,16);
   end;
end;

procedure TDoc_St.ListOstChange(Sender: TObject);
begin
   Btn_RefreshOSt.click;
end;

procedure TDoc_St.SpeedButton1Click(Sender: TObject);
var
  ID:integer;
begin
   ID:=strtoint(ListOst.value);
   application.createForm(Tset_ost_st,Set_ost_st);
   Set_ost_st.showModal;
   Set_ost_st.destroy;
   OstTransaction.Active:=False;
   QrListOst.Close;
   QrListOst.ParamByname('US_ID').asinteger:=USERID;
   QrListOst.Open;
   if QrListOst.locate('CFG_ID',ID,[]) then begin
      ListOst.value:=QrListOst.fieldByname('cfg_id').asstring;
   end else begin
      QrListOst.first;
      ListOst.value:=QrListOst.fieldByname('cfg_id').asstring;
   end;
end;

procedure TDoc_St.N8Click(Sender: TObject);
begin
   NDS.value:=NDS_DATE(ST_DATE.date);
end;

procedure TDoc_St.NDSKeyPress(Sender: TObject; var Key: Char);
var err: boolean;
begin


{ 17-04-2017 убрал проверку на НДС в счете
err:=true;
if key=#13 then begin
     if (NDS.Value = NDS_DATE(st_date.Date))
        then err:=false;
     if (NDS.Value = NDS_SMALL_DATE(st_date.Date))
        then err:=false;

      if err=true then
      begin
                messbox('Веденный НДС не допустим в данной накладной!',MessSystem,48);
                err:=true;
                nds.Value:= NDS_DATE(st_date.Date);
                nds.SetFocus;
      end;
  end;
 }
//  if (err<> true) or (key<>#13) then
//          TabelKeyPress(sender, key);
end;

procedure TDoc_St.NDSExit(Sender: TObject);
var err: boolean;
begin
      {
err:=true;

     if (frm.Value = '2696633') then
      err:=false
     else
     begin
     if (NDS.Value = NDS_DATE(st_date.Date))
        then err:=false;
     if (NDS.Value = NDS_SMALL_DATE(st_date.Date))
        then err:=false;
     end;

      if err=true then
      begin
                messbox('Веденный НДС не допустим в данной накладной!',MessSystem,48);
                err:=true;
                nds.Value:= NDS_DATE(st_date.Date);
                nds.SetFocus;
      end;
           }

end;

procedure TDoc_St.FRMChange(Sender: TObject);
begin
     if FRM.value<>'' then
       Change_FrmKln(strtoint(FRM.value),1);
end;

procedure TDoc_St.ToolButton9Click(Sender: TObject);
var
   a,ID:integer;
begin
     CanTimer:=False;
     Timer1.enabled:=False;
     CLEAR_CENNIK;
     if MemSTS.RecordCount>0 then begin
         ID:=MemSTS.RecNo;
         MemSTS.DisableControls;
         MemSTS.First;
         while not MemSTS.eof do begin
               ADD_CENNIK(MemSTS.fieldbyname('TW_ID').asinteger,default_sklad, FRM.Text);
               DataModule1.MemCENNIK.Edit;
               DataModule1.memCENNIK.fieldByName('TITLE').AsString:='';

               DataModule1.memCENNIK.fieldByName('TW_MROZ').asFloat:=DataModule1.memCENNIK.fieldByName('TW_MROZ_2').asFloat;
               DataModule1.MemCENNIK.Post;

               MemSTS.next;
         end;
         MemSTS.First;
         for a:=1 to ID-1 do MemSTS.next;
         MemSTS.EnableControls;
///         PRINT_CENNIK;
     end;
     CanTimer:=True;





     with Print_doc do
     begin


     ppSystemVariable72.Visible:=false;
     ppSystemVariable73.Visible:=false;
     ppSystemVariable74.Visible:=false;
     ppSystemVariable75.Visible:=false;
     ppLabel875.Visible:=false;
     ppLabel884.Visible:=false;
     ppLabel885.Visible:=false;
     ppLabel886.Visible:=false;

     pp_cennik_large.GroupFooter[4].Visible:=true;
     pp_cennik_big.GroupFooter[4].Visible:=true;
     pp_cennik_medium.GroupFooter[4].Visible:=true;
     pp_cennik_small.GroupFooter[4].Visible:=true;

     end;


//     findComponent('ppLabel875');
//     .Visible:=false;
//     TPPSystemVariable(.);

     PRINT_CENNIK;
     with Print_doc do
     begin


     ppSystemVariable72.Visible:=true;
     ppSystemVariable73.Visible:=true;
     ppSystemVariable74.Visible:=true;
     ppSystemVariable75.Visible:=true;
     ppLabel875.Visible:=true;
     ppLabel884.Visible:=true;
     ppLabel885.Visible:=true;
     ppLabel886.Visible:=true;
     pp_cennik_large.GroupFooter[4].Visible:=false;
     pp_cennik_big.GroupFooter[4].Visible:=false;
     pp_cennik_medium.GroupFooter[4].Visible:=false;
     pp_cennik_small.GroupFooter[4].Visible:=false;
     end;

end;

procedure TDoc_St.ToolButton10Click(Sender: TObject);
var
   a,ID:integer;
begin
     CanTimer:=False;
     Timer1.enabled:=False;
     CLEAR_CENNIK;
     if MemSTS.RecordCount>0 then begin
         ID:=MemSTS.RecNo;
         MemSTS.DisableControls;
         MemSTS.First;
         while not MemSTS.eof do begin
               ADD_CENNIK(MemSTS.fieldbyname('TW_ID').asinteger,default_sklad, FRM.Text);
               DataModule1.MemCENNIK.Edit;
               DataModule1.memCENNIK.fieldByName('TITLE').AsString:='';

//               DataModule1.memCENNIK.fieldByName('TW_MROZ').asFloat:=DataModule1.memCENNIK.fieldByName('TW_MROZ_2').asFloat;
               DataModule1.MemCENNIK.Post;

               MemSTS.next;
         end;
         MemSTS.First;
         for a:=1 to ID-1 do MemSTS.next;
         MemSTS.EnableControls;
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
