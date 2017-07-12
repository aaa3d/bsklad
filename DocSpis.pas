unit DocSpis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, CurrEdit, Mask, ToolEdit, RxLookup, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,Data1,B_DBUtils,B_Utils, Db,
  IBCustomDataSet, IBQuery, RxMemDS, IBDatabase,DetalTW, Menus,SetSkid;

type
  TDoc_SPIS = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Btn_DicTow: TToolButton;
    Btn_DelTow: TToolButton;
    ToolButton4: TToolButton;
    Btn_Propertis: TToolButton;
    Btn_Print: TToolButton;
    Btn_FindTow: TToolButton;
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
    MemSPISS: TRxMemoryData;
    DsPERS: TDataSource;
    MemSPISSTW_ID: TIntegerField;
    MemSPISSTW_NAM: TStringField;
    MemSPISSTW_MONEY: TFloatField;
    MemSPISSTW_KOL: TFloatField;
    MemSPISSTW_SUMM: TFloatField;
    MemSPISSED_SHORT: TStringField;
    MemSPISSSTS_ID: TIntegerField;
    MemSPISSTW_ART: TIntegerField;
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
    MnFind: TMenuItem;
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
    MemSPISSOST: TFloatField;
    ToolButton2: TToolButton;
    Btn_RefreshOst: TToolButton;
    MnRefreshOst: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    MnProw: TMenuItem;
    MnUnprow: TMenuItem;
    MemSPISSTW_COLOR: TIntegerField;
    N1: TMenuItem;
    N4: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    Btn_Ost: TToolButton;
    MnOst: TMenuItem;
    MemSPISSOTG_KOL: TFloatField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    BtnKorr: TToolButton;
    btnFastInfo: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    US2_LABEL: TLabel;
    US2_Btn: TSpeedButton;
    Label5: TLabel;
    SPIS_OSN: TMemo;
    SPIS_NUM: TEdit;
    SPIS_DATE: TDateEdit;
    SPIS_SUMM: TRxCalcEdit;
    Btn_RefreshSumm: TBitBtn;
    SPIS_WHO: TEdit;
    SPIS_SPISVID: TRxDBLookupCombo;
    US2_FULL: TEdit;
    SHOP: TRxDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    Label6: TLabel;
    FRM: TRxDBLookupCombo;
    Label1: TLabel;
    SKL: TRxDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure Show_Sost;
    Procedure Refresh_summ;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MemSPISSCalcFields(DataSet: TDataSet);
    procedure Btn_RefreshSummClick(Sender: TObject);
    procedure Btn_ApplyClick(Sender: TObject);
    procedure Btn_SAVEClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DsPERSDataChange(Sender: TObject; Field: TField);
    procedure Btn_DelTowClick(Sender: TObject);
    procedure Btn_DetalClick(Sender: TObject);
    procedure ADD_SPISS(TW_ID:integer;KOL:double);
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
    procedure Btn_RefreshOstClick(Sender: TObject);
    procedure Change_FrmUs2(ID:integer;n:integer);
    procedure SPIS_WHOChange(Sender: TObject);
    procedure SPIS_OSNChange(Sender: TObject);
    procedure SPIS_DATEChange(Sender: TObject);
    procedure Btn_ProwClick(Sender: TObject);
    procedure Btn_UnprowClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure MemSPISSOTG_KOLChange(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure SPIS_SPISVIDChange(Sender: TObject);
    procedure Btn_OstClick(Sender: TObject);
    procedure US2_BtnClick(Sender: TObject);
    procedure MemSPISSTW_KOLChange(Sender: TField);
    procedure BtnKorrClick(Sender: TObject);
    procedure FRMChange(Sender: TObject);
    procedure SKLChange(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  CanRefreshSKL:boolean;
  CanInsert:Boolean=False;
  SPISS_DEL:array[1..1000] of integer;
  SPISS_DEL_TW:array[1..1000] of integer;
  SPISS_DEL_OTG:array[1..1000] of double;
  SPISS_DEL_MESS:array[1..1000] of string;
  SPISS_DEL_MESS2:array[1..1000] of string;
  CNT_DEL:integer=0;
  SAVE:boolean;
  Doc_SPIS: TDoc_SPIS;
  Sost:integer=0;


  SPIS_NUMS:integer;
  STR:ansistring='';
  SPIS_PROW:boolean;
  SPIS_KORR:boolean;
  CanKorr:boolean;
  US2_ID:integer;
  SKL_ID: integer;

implementation

uses Mainform, DicKlient, ANALIZTW, DicTowar, SelectPrint, SetKolvo;

{$R *.DFM}

procedure TDoc_SPIS.Show_sost;
var
   s:ansistring;
   SpisEmpty:boolean;
begin
     if Doc_Spis.Tag<0 then
       Doc_Spis.caption:='Акт списания. Новая'
     else begin
          if SPIS_PROW then
            Doc_SPIS.caption:='Акт списания. Просмотр'
          else
            Doc_SPIS.caption:='Акт списания. Редактирование';
          if SPIS_KORR then Doc_SPIS.caption:='Акт списания. Коррекция';
     end;
     if MemSPISS.RecordCount=0 then SpisEmpty:=true else SpisEmpty:=false;
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
     BtnKorr.enabled:=SPIS_PROW and (not SPIS_korr) and CanKorr;
     FRM.enabled:=not SPIS_PROW;
     SHOP.enabled:=not SPIS_PROW or (SPIS_KORR);
     Btn_Prow.enabled:=(not SPIS_PROW) and (not SpisEmpty) and (not SPIS_Korr);
     MnProw.enabled:=(not SPIS_PROW) and (not SpisEmpty) and (not SPIS_Korr);
     Btn_UnProw.enabled:=(SPIS_PROW) and (not SpisEmpty) and (not SPIS_Korr);
     MnUnProw.enabled:=(SPIS_PROW) and (not SpisEmpty) and (not SPIS_Korr);
     Btn_SAVE.enabled:=((not SPIS_PROW) or (spis_korr)) and (not SpisEmpty);
     MnSAVE.enabled:=((not SPIS_PROW) or (spis_korr)) and (not SpisEmpty);
     Btn_Apply.enabled:=((not SPIS_PROW) or (spis_korr)) and (not SpisEmpty);
     MnApply.enabled:=((not SPIS_PROW) or (spis_korr)) and (not SpisEmpty);
     Btn_Print.enabled:=not SpisEmpty;
     MnPrint.enabled:=not SpisEmpty;
     Btn_Propertis.enabled:=true;
     MnHistory.enabled:=true;
     Btn_SubDoc.enabled:=not SpisEmpty;
     MnSubDoc.enabled:=not SpisEmpty;
     Btn_DicTow.enabled:=not SPIS_PROW;
     MnTw.enabled:=not SPIS_PROW;
     Btn_FindTow.enabled:=not SpisEmpty;
     MnFind.enabled:=not SpisEmpty;
     Btn_DelTow.enabled:=(not SPIS_PROW) and (not SpisEmpty);
     MnDel.enabled:=(not SPIS_PROW) and (not SpisEmpty);
     Btn_Ost.enabled:=(not SPIS_PROW) and (not SpisEmpty);
     MnOst.enabled:=(not SPIS_PROW) and (not SpisEmpty);
     Btn_DETAL.enabled:=not SpisEmpty and CANTW_DETAL;
     MnDETAL.enabled:=not SpisEmpty and CANTW_DETAL;
     Btn_Analiz.enabled:=not SpisEmpty and CANTW_ANALIZ;
     MnAnaliz.enabled:=not SpisEmpty and CANTW_ANALIZ;
     Btn_Marketing.enabled:=not SpisEmpty and CANTW_MARKETING;
     MnMarketing.enabled:=not SpisEmpty and CANTW_MARKETING;
     Btn_PrintCenn.enabled:=not SpisEmpty;
     MnCenn.enabled:=not SpisEmpty;
     Btn_PrintCennMore.enabled:=not SpisEmpty;
     MnCennMore.enabled:=not SpisEmpty;
     RxDbgrid1.ReadOnly:=SPIS_PROW;
     SKL.enabled:=not SPIS_PROW ;
     SPIS_SPISVID.enabled:=not SPIS_PROW;
     SPIS_DATE.enabled:=not SPIS_PROW;
     SPIS_OSN.enabled:=not SPIS_PROW or (SPIS_KORR);
     SPIS_WHO.enabled:=not SPIS_PROW or (SPIS_KORR);
end;

procedure TDoc_SPIS.Change_FrmUs2(ID:integer;N:integer);
var
   s1,s2:ansistring;
begin
     {Отображаем название фирмы и банка}
     Query1Transaction.Active:=False;
     IbQuery1.Close;
     IbQuery1.SQL.clear;
     IbQuery1.SQL.add('select KLN_FAM,KLN_NAME,KLN_NAME2,KLN_ORG,KLN_BNK FROM KLN WHERE KLN_ID=:KLN_ID');
     IbQuery1.Parambyname('KLN_ID').asinteger:=ID;
     IbQuery1.Open;
     s1:='';
     S2:='';
     if IbQuery1.eof then begin
     end else begin
         if trim(IbQuery1.fieldbyname('KLN_FAM').asstring)='' then s1:=IbQuery1.fieldbyname('KLN_ORG').asstring else
         begin
              s1:=IbQuery1.fieldbyname('KLN_FAM').asstring+'. '+
               IbQuery1.fieldbyname('KLN_NAME').asstring+'. '+
               IbQuery1.fieldbyname('KLN_NAME2').asstring;
         end;
         s2:=IbQuery1.fieldbyname('KLN_BNK').asstring;
     end;
     if n=2 then US2_FULL.text:=s1;
     IbQuery1.Close;
end;


procedure TDoc_SPIS.FormShow(Sender: TObject);
begin
    // смотрим доступ на проводку
    SPIS_KORR:=false;
    WorkTransaction.Active:=False;
    ADD_SQL(QueryWork,'select count(USDOSTUP.USDOSTUP_ID) as cc FROM KLN,USDOSTUP WHERE USDOSTUP.USGROUP_ID=KLN.USGROUP_ID '+
    'AND USDOSTUP.USDOSTUP_NAME="PROVODKA_SPIS" and kln.kln_id=:us_id');
    QueryWork.paramByname('US_ID').asinteger:=USERID;
    QueryWork.open;
    CanKorr:=false;
    if QueryWork.eof then CanKorr:=false else begin
      if QueryWork.fieldByname('CC').asinteger>0 then CanKorr:=true;
    end;
     IS_EDIT_SPIS:=true;
     CanRefreshSKL:=false;

     Sost:=0;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-29;
     {Определяем название}
     if Doc_SPIS.tag<0 then begin
       Sost:=1;

       SPIS_PROW:=FALSE;
       Get_default;
       {Устанавливаем данные}
       SPIS_OSN.lines.clear;
       SPIS_WHO.text:='';
       SPIS_NUM.text:='Новый';
       SPIS_DATE.date:=Date();
       SPIS_NUMS:=-1;
       SPIS_SPISVID.value:=DataModule1.MainDicSpisVid.fieldbyname('SPISVID_ID').asstring;
       SKL.value:=inttostr(DEFAULT_SKLAD);
       SHOP.value := inttostr(SHOPID);



       US2_ID:=0;
     end else begin
          {Читаем накладную}
          Query1Transaction.Active:=False;
          ADD_SQL(IbQuery1,'select SPIS.*, (select kln_full from kln_data(spis.frm_id)) FRM_FULL from SPIS where SPIS_ID=:SPIS_ID');
          {Определяем, где накладная}
          IbQuery1.Parambyname('SPIS_ID').asinteger:=Doc_SPIS.tag;
          IbQuery1.Open;
          if IbQuery1.fieldbyname('SPIS_PROW').asstring='1' then SPIS_PROW:=true else SPIS_PROW:=false;




          US2_ID:=IbQuery1.fieldbyname('US_ID2').asinteger;
          SKL.value:=IbQuery1.fieldbyname('SKL_ID').asstring;
          FRM.Value:=IbQuery1.fieldbyname('FRM_ID').asstring;
          if FRM.value='' then
          begin
            FRM.DisplayEmpty := IbQuery1.fieldbyName('FRM_FULL').asstring;
            FRM.EmptyValue := IbQuery1.fieldbyName('FRM_ID').asstring;
          end;
          

          SPIS_SPISVID.value:=IbQuery1.fieldbyname('SPISVID_ID').asstring;
          SHOP.value:=IbQuery1.fieldbyname('SHOP_ID').asstring;


          
          SPIS_OSN.lines.clear;
          SPIS_OSN.lines.add(IbQuery1.fieldbyname('SPIS_OSN').asstring);
          SPIS_WHO.text:=IbQuery1.fieldbyname('SPIS_WHO').asstring;
          SPIS_NUM.text:=IbQuery1.fieldbyname('SPIS_NUM').asstring;
          SPIS_NUMS:=IbQuery1.fieldbyname('SPIS_NUM').asinteger;
          SPIS_DATE.date:=IbQuery1.fieldbyname('SPIS_DATE').asdatetime;
          {Читаем содержимое Акта списания}
          Add_SQL(IbQuery1,'select * from LIST_SPISS(:SPIS_ID) order by SPISS_ID');
          IbQuery1.Parambyname('SPIS_ID').asinteger:=Doc_SPIS.tag;
          IbQuery1.Open;
          while not IbQuery1.eof do begin
                CanInsert:=True;
                MemSPISS.Append;
                MemSPISS.Fieldbyname('SPISS_ID').asinteger:=IbQuery1.Fieldbyname('SPISS_ID').asinteger;
                MemSPISS.Fieldbyname('TW_ID').asinteger:=IbQuery1.Fieldbyname('TW_ID').asinteger;
                MemSPISS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TW_COLOR').asinteger;
                MemSPISS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
                MemSPISS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
                MemSPISS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
                MemSPISS.Fieldbyname('TW_KOL').asfloat:=IbQuery1.Fieldbyname('TW_KOL').asfloat;
                MemSPISS.Fieldbyname('OTG_KOL').asfloat:=IbQuery1.Fieldbyname('OTG_KOL').asfloat;
                MemSPISS.Fieldbyname('TW_MONEY').asfloat:=IbQuery1.Fieldbyname('TW_MONEY').asfloat;
                MemSPISS.fieldByname('OST').asfloat:=IbQuery1.Fieldbyname('OST').asfloat;;
                MemSPISS.Post;
                CanInsert:=False;
                IbQuery1.next;
          end;
     end;
     SPIS_SPISVID.OnChange(Sender);
     Change_FRMUs2(Us2_ID,2);
     btn_refreshost.Click;
     Refresh_summ;
     Show_Sost;
     CanRefreshSKL:=true;
     Pagecontrol1.ActivePage:=Tabsheet1;
     RxDbGrid1.setfocus;
     SAVE:=true;
end;

procedure TDoc_SPIS.FormKeyPress(Sender: TObject; var Key: Char);
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
                    ADD_SPISS(ID,-1);
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
     Show_Sost;
end;

procedure TDoc_SPIS.MemSPISSCalcFields(DataSet: TDataSet);
begin
     MemSPISS.fieldbyname('TW_SUMM').asfloat:=MemSPISS.fieldbyname('TW_MONEY').asfloat*MemSPISS.fieldbyname('TW_KOL').asfloat;
end;

Procedure TDoc_SPIS.Refresh_summ;
var
   a,ID:integer;
   Summ:Double;
begin
     if MemSPISS.RecordCount=0 then begin
        SPIS_SUMM.Value:=0;
     end else begin
         ID:=MemSPISS.RecNo;
         MemSPISS.DisableControls;
         MemSPISS.First;
         Summ:=0;
         while not MemSPISS.eof do begin
               SUMM:=SUMM+MemSPISS.fieldbyname('TW_SUMM').asfloat;
               MemSPISS.next;
         end;
         MemSPISS.First;
         for a:=1 to ID-1 do MemSPISS.next;
         MemSPISS.EnableControls;
         SPIS_SUMM.Value:=SUMM;
     end;
end;

procedure TDoc_SPIS.Btn_RefreshSummClick(Sender: TObject);
begin
     Refresh_summ;
end;

procedure TDoc_SPIS.Btn_ApplyClick(Sender: TObject);
var
   A,SPIS_ID,ID,OLDID:integer;
   r,IDR:double;
   CAN:boolean;
begin
  {Сохраняем Акт списания (Apply)}
   if (MemSpiss.State in [dsInsert,DsEdit]) then MemSpiss.Post;

   if SKL.value='' then begin
    messbox('Не указан склад', messError, 0);
    Exit;
   end;


   if FRM.value='' then
   begin
     Messbox('Не указана фирма!',  MessError, MB_OK);
     exit;
   end;



  // Проверяем правильность указания вида;
  CAN:=False;
  if (SPIS_DATE.date>encodedate(2001,12,31)) then begin
     if DataModule1.MainDicSpisVid.FieldByname('SPISVID_2002').asinteger=0 then begin
         Messbox('Начиная с 20002 года указанный вид акта списания использовать нельзя!',MessError,48);
     end else CAN:=True;
  end else CAN:=true;
  if CAN then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     OLDID:=MemSPISS.recno;
     Try
        if (not SPIS_PROW) or (spis_korr) then begin
          IBSAVE_CLEAR;
          if SPIS_NUMS<0 then SPIS_NUMS:=NEW_SPIS_NUM(STRTOINT('0'+frm.vALUE), SPIS_DATE.date);
          IBSAVE_ADD('FRM_ID',strtoint(frm.value));
          IBSAVE_ADD('SPIS_NUM',SPIS_NUMS);
          if (not spis_korr) then IBSAVE_ADD('SPIS_DATE',strtodatetime(datetostr(SPIS_DATE.date)+' '+timetostr(time())));
          IBSAVE_ADD('SKL_ID',strtoint(SKL.value));
          IBSAVE_ADD('SPISVID_ID',SPIS_SPISVID.value);
          IBSAVE_ADD('SHOP_ID',strtoint(SHOP.value));

          if (not spis_korr) then IBSAVE_ADD('SPIS_PROW','0');
          IBSAVE_ADD('SPIS_OSN',Memotostr(SPIS_OSN.lines));
          IBSAVE_ADD('SPIS_WHO',SPIS_WHO.text);
          IBSAVE_ADD('US_ID',USERID);
          IBSAVE_ADD('US_ID2',US2_ID);
          SPIS_ID:=IBSAVE_DOC('SPIS',DOC_SPIS.tag);
        end else SPIS_ID:=DOC_SPIS.tag;
        if SPIS_ID<=0 then IDR:=SQRT(-1)
          else begin
           if not SPIS_KORR then begin
             // Фиксируем удаление товаров
             for A:=1 to CNT_DEL do begin
               IBSAVE_CLEAR;
               IBSAVE_ADD('DOC','SPIS');
               IBSAVE_ADD('US_ID',USERID);
               IBSAVE_ADD('SHOP_ID',SHOPID);
               IBSAVE_ADD('MESS',SPISS_DEL_MESS[a]);
               IBSAVE_ADD('DOP1',4);
               IBSAVE_ADD('DOP2',SPIS_ID);
               if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
               if SPISS_DEL_OTG[a]>0 then begin
                 IBSAVE_CLEAR;
                 IBSAVE_ADD('DOC','TWSPIS');
                 IBSAVE_ADD('US_ID',USERID);
                 IBSAVE_ADD('SHOP_ID',SHOPID);
                 IBSAVE_ADD('MESS',SPISS_DEL_MESS2[a]);
                 IBSAVE_ADD('DOP1',DOC_SPIS.tag);
                 IBSAVE_ADD('DOP2',-SPISS_DEL_TW[a]);
                 if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
               end;
             end;
             {Сохраняем содержимое}
             {Сначала удаляем удалённое}
             for A:=1 to CNT_DEL do begin
                 if SPISS_DEL[A]>0 then if not IBDELETE_DOC('SPISS',SPISS_DEL[A]) then IDR:=SQRT(-1);
             end;
             {Сохраняем имеющееся}
             MemSPISS.DisableControls;
             MemSPISS.First;
             while not MemSPISS.eof do begin
                   IBSAVE_CLEAR;
                   IBSAVE_ADD('SPIS_ID',SPIS_ID);
                   IBSAVE_ADD('TW_ID',MemSPISS.fieldbyname('TW_ID').asinteger);
                   IBSAVE_ADD('TW_KOL',MemSPISS.fieldbyname('TW_KOL').asfloat);
                   IBSAVE_ADD('OTG_KOL',MemSPISS.fieldbyname('OTG_KOL').asfloat);
                   if MemSPISS.fieldbyname('SPISS_ID').asinteger<0 then begin
                      IBSAVE_ADD('OTG_US',0);
                      IBSAVE_ADD('OTG_DATE',NOW());
                   end;
                   ID:=IBSAVE_DOC('SPISS',MemSPISS.fieldbyname('SPISS_ID').asinteger);
                   if ID<0 then IDR:=SQRT(-1) else begin
                      if (DOC_SPIS.tag>0) and (MemSPISS.fieldbyname('SPISS_ID').asinteger<0) then begin
                          // Фиксируем факт добавления товара
                          IBSAVE_CLEAR;
                          IBSAVE_ADD('DOC','SPIS');
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          IBSAVE_ADD('MESS','Добавлен товар: '+MemSPISS.Fieldbyname('TW_ART').asstring+' '+
                          MemSPISS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemSPISS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
                          MemSPISS.Fieldbyname('ED_SHORT').asstring);
                          IBSAVE_ADD('DOP1',2);
                          IBSAVE_ADD('DOP2',SPIS_ID);
                          if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                      end;
                      MemSPISS.Edit;
                      MemSPISS.fieldbyname('SPISS_ID').asinteger:=ID;
                      MemSPISS.Post;
                   end;
                   MemSPISS.next;
             end;
           end;
        end;
        {Всё прошло нормально - изменяем временные данные}
        {Отображаем номер}
        Doc_SPIS.tag:=SPIS_ID;
        SPIS_NUM.text:=inttostr(SPIS_NUMS);
        MemSPISS.First;
        while not MemSPISS.eof do begin
              if MemSPISS.fieldbyname('SPISS_ID').asinteger<0 then begin
                 MemSPISS.Edit;
                 MemSPISS.fieldbyname('SPISS_ID').asinteger:=-MemSPISS.fieldbyname('SPISS_ID').asinteger;
                 MemSPISS.Post;
              end;
              MemSPISS.next;
        end;
        MemSPISS.First;
        for a:=1 to OLDID-1 do MemSPISS.next;
        SAVE:=TRUE;
        CNT_DEL:=0;
        MemSPISS.EnableControls;
        Datamodule1.IBTransaction2.Commit;
     Except
        Messbox('Ошибка при сохранении Акта списания!',MessSystem,48);
        Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TDoc_SPIS.Btn_SAVEClick(Sender: TObject);
begin
     SAVE:=false;
     Btn_Apply.Click;
     if SAVE then begin
        if not SPIS_PROW then BTN_PROW.click;
        Close;
     end;
end;

procedure TDoc_SPIS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save) and (Btn_Apply.enabled) then begin
        if Messbox('Акт был изменён! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDoc_SPIS.DsPERSDataChange(Sender: TObject; Field: TField);
begin
     if MemSPISS.State in [dsInsert,dsEdit] then SAVE:=False;
     if (MemSPISS.State in [dsInsert]) and ( not CanInsert) then MemSPISS.Cancel;
end;

procedure TDoc_SPIS.Btn_DelTowClick(Sender: TObject);
var
  SPIS_NUM_FULL:ansistring;
begin
     if Messbox('Удалить из акта списания товар "'+MemSPISS.Fieldbyname('TW_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        SAVE:=False;
        if MemSPISS.Fieldbyname('SPISS_ID').asinteger>0 then begin
          WorkTransaction.Active:=False;
          ADD_SQL(QueryWork,'select KLN.KLN_PREFIX,SHOP.SHOP_PREFIX,SHOP.SHOP_POSTFIX, '+
          'SPIS.SPIS_NUM from SPIS,SHOP,KLN where SPIS.SPIS_ID=:SPIS_ID '+
          'and SPIS.FRM_ID=KLN.KLN_ID  '+
          'and SPIS.SHOP_ID=SHOP.SHOP_ID ');
          QueryWork.paramByname('SPIS_ID').asinteger:=DOC_SPIS.tag;
          QueryWork.open;
          if not QueryWork.eof then
            SPIS_NUM_FULL:=QueryWork.fieldByname('KLN_PREFIX').asstring+' '+
            QueryWork.fieldByname('SHOP_PREFIX').asstring+'СПИС'+
            b_utils.right('0000000000'+inttostr(SPIS_NUMS),10)+QueryWork.fieldByname('SHOP_POSTFIX').asstring;
          inc(CNT_DEL);
          SPISS_DEL[CNT_DEL]:=MemSPISS.Fieldbyname('SPISS_ID').asinteger;
          SPISS_DEL_OTG[CNT_DEL]:=MemSPISS.Fieldbyname('OTG_KOL').asinteger;
          SPISS_DEL_TW[CNT_DEL]:=MemSPISS.Fieldbyname('TW_ID').asinteger;
          SPISS_DEL_MESS[CNT_DEL]:='Удален товар: '+MemSPISS.Fieldbyname('TW_ART').asstring+' '+
          MemSPISS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemSPISS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
          MemSPISS.Fieldbyname('ED_SHORT').asstring;
          SPISS_DEL_MESS2[CNT_DEL]:=SPIS_NUM_FULL+' Из акта удален товар с отгрузкой '+floattostrf(MemSPISS.Fieldbyname('OTG_KOL').asfloat,fffixed,19,3)+' '+
          MemSPISS.Fieldbyname('ED_SHORT').asstring;
        end;
        MemSPISS.delete;
        Refresh_summ;
        Show_Sost;
     end;
end;

procedure TDoc_SPIS.Btn_DetalClick(Sender: TObject);
begin
   SHOW_DETAL_TW(MemSPISS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_SPIS.FormKeyDown(Sender: TObject; var Key: Word;
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
          Select_Print.Button1.caption:='Напечатать акт списания';
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
     if (key=192) and (btnFastInfo.enabled) then
     begin
     	key:=0;
     	btnFastInfo.click; {~}
     end;     
     if (key=13) and (ssCtrl in Shift) and (Btn_Save.enabled) then begin
        key:=0;
        Btn_SAve.click;
     end;
end;

procedure TDoc_SPIS.ADD_SPISS(TW_ID:integer;KOL:double);
var
   TW_TEMP:integer;
   TW_STR:ansistring;
   ISS:boolean;
begin
     TW_TEMP:=0;

     ISS:=false;
     {проверка дозволенности товара для данной фирмы (в расширенном режиме)}
     if FRM.Value='' then
     begin
     	Messbox('Не указана фирма!',  MessError, MB_OK);
        exit;
     end;

     


     {Проверяем, нет ли в накладной уже такого товара}
     if MemSPISS.RecordCount>0 then TW_TEMP:=MemSPISS.fieldByname('TW_ID').asinteger;
     ISS:=false;
     MemSPISS.Disablecontrols;
     MemSPISS.first;
     while (not MemSPISS.eof) and (not ISS) do begin
           if MemSPISS.fieldByname('TW_ID').asinteger=TW_ID then begin
              ISS:=true;
              TW_STR:=MemSPISS.fieldByname('TW_ART').asstring+'-'+MemSPISS.fieldByname('TW_NAM').asstring;
           end;
           MemSPISS.next;
     end;
     MemSPISS.EnableControls;
     if ISS then Messbox('Акт уже содержит товар '+TW_STR+' и он не может быть добавлен!',MessSystem,48) else
     begin
          SAVE:=False;
          Query1Transaction.Active:=False;
          IbQuery1.Close;
          IbQuery1.SQL.clear;
          IbQuery1.SQL.add('select twktg.twktg_color,tw.tw_art,tw.tw_nam,tw.ed_id,ed.ed_short, '+
          '(select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
          '(select max(kurs_date) from kurs where '+
          'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz '+
          'from tw,ed,twktg '+
          'where tw.ed_id=ed.ed_id and tw.tw_id=:TW_ID and tw.twktg_id=twktg.twktg_id ');
          IbQuery1.Parambyname('TW_ID').asinteger:=TW_ID;

          IbQuery1.Open;

          CanInsert:=True;
          MemSPISS.Append;
          MemSPISS.Fieldbyname('SPISS_ID').asinteger:=-1;
          MemSPISS.Fieldbyname('TW_ID').asinteger:=TW_ID;
          MemSPISS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
          MemSPISS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TWKTG_COLOR').asinteger;
          MemSPISS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
          MemSPISS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
          MemSPISS.Fieldbyname('TW_MONEY').asfloat:=0;
          MemSPISS.Fieldbyname('OTG_KOL').asfloat:=0;
          MemSPISS.fieldByname('OST').asfloat:=GetOst(TW_ID, strtoint(skl.value), strtoint(frm.value));
          if KOL<0 then begin
             Application.createForm(TSET_KOLVO,SET_KOLVO);
             SET_KOLVO.NAME.text:=IbQuery1.fieldByname('TW_ART').asstring+
                            IbQuery1.fieldByname('TW_NAM').asstring;
             SET_KOLVO.showModal;
             if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
             MemSPISS.Fieldbyname('TW_KOL').asfloat:=SET_KOLVO.KOL.value;
             SET_KOLVO.destroy;
          end else MemSPISS.Fieldbyname('TW_KOL').asfloat:=KOL;
          MemSPISS.Post;
          CanInsert:=False;
     end;
     IbQuery1.Close;
     RxDbGrid1.setfocus;
end;

procedure TDoc_SPIS.Btn_PrintClick(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then if Messbox('Документ был изменен! Сохранить изменения?',MessSubmit,4+48)=6 then Btn_Apply.click;
        {Печатаем}
        PRINT_SPIS(Doc_SPIS.tag);
end;

procedure TDoc_SPIS.Btn_SubdocClick(Sender: TObject);
begin
     if Not Save and Btn_Apply.enabled then Btn_Apply.click;
     {Создаём документ на основании имеющегося...}
     SUBDOC(4,DOC_SPIS.tag);
end;

procedure TDoc_SPIS.Btn_PropertisClick(Sender: TObject);
begin
    {Отображаем "историю" накладной перемещения}
    SHOW_HISTORY_DOC('Акт списания № '+SPIS_NUM.text,'SPIS',DOC_SPIS.tag);
end;

procedure TDoc_SPIS.Btn_DicTowClick(Sender: TObject);
var
   a:integer;
begin
     if SKL_ID<>0 then SELECT_SKLAD:=SKL_ID;
     DicTowarSet:=1; {Ввод товаров из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
        for a:=1 to CNT_TW do begin
            ADD_SPISS(ARR_TW[a].ID,ARR_TW[a].KOL);
        end;
     end;
     Btn_refreshSumm.click;
     Show_sost;
end;

procedure TDoc_SPIS.Btn_FindTowClick(Sender: TObject);
begin
     {}
end;

procedure TDoc_SPIS.Btn_AnalizClick(Sender: TObject);
begin
   SHOW_ANALIZ_TW(MemSPISS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_SPIS.Btn_MarketingClick(Sender: TObject);
begin
     SHOW_MARKETING_TW(MemSPISS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_SPIS.Btn_PrintCennClick(Sender: TObject);
begin
     CLEAR_CENNIK;
     ADD_CENNIK(MemSPISS.fieldbyname('TW_ID').asinteger,SKL_ID);
     PRINT_CENNIK;
end;

procedure TDoc_SPIS.Btn_PrintCennMoreClick(Sender: TObject);
var
   a,ID:integer;
begin
     CLEAR_CENNIK;
     if MemSPISS.RecordCount>0 then begin
         ID:=MemSPISS.RecNo;
         MemSPISS.DisableControls;
         MemSPISS.First;
         while not MemSPISS.eof do begin
               ADD_CENNIK(MemSPISS.fieldbyname('TW_ID').asinteger,SKL_ID);
               MemSPISS.next;
         end;
         MemSPISS.First;
         for a:=1 to ID-1 do MemSPISS.next;
         MemSPISS.EnableControls;
         PRINT_CENNIK;
     end;
end;

procedure TDoc_SPIS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IS_EDIT_SPIS:=false;
end;

procedure TDoc_SPIS.Btn_RefreshOstClick(Sender: TObject);
var
   a,ID:integer;
   Summ:Double;
   s:ansistring;
begin
     s:=Doc_SPIS.caption;
     Doc_SPIS.caption:=Doc_SPIS.caption+'. Чтение остатков товаров';
     if MemSPISS.RecordCount>0 then begin
         ID:=MemSPISS.RecNo;
         MemSPISS.DisableControls;
         MemSPISS.First;
         Summ:=0;
         while not MemSPISS.eof do begin
               MemSPISS.Edit;
               MemSPISS.fieldByname('OST').asfloat:=GetOst(MemSPISS.fieldByname('TW_ID').asinteger,strtoint(SKL.value), strtoint(FRM.value));
               MemSPISS.Post;
               MemSPISS.next;
         end;
         MemSPISS.First;
         for a:=1 to ID-1 do MemSPISS.next;
         MemSPISS.EnableControls;
     end;
     Doc_SPIS.caption:=s;
     Refresh_Summ;
end;

procedure TDoc_SPIS.SPIS_WHOChange(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TDoc_SPIS.SPIS_OSNChange(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TDoc_SPIS.SPIS_DATEChange(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TDoc_SPIS.Btn_ProwClick(Sender: TObject);
begin
     SAVE:=False;
     if Not Save and Btn_Apply.enabled then Btn_Apply.click;
     if (SAVE) then begin
        if PROV_SPIS(Doc_SPIS.tag,'') then begin
                SPIS_KORR:=False;
                SPIS_PROW:=True;
                Show_Sost;
                Btn_RefreshOst.click;
                SAVE:=True;
        end;
     end;
end;

procedure TDoc_SPIS.Btn_UnprowClick(Sender: TObject);
begin
     if UNPROV_SPIS(Doc_SPIS.tag,'') then begin
                Btn_RefreshOst.click;
                SPIS_KORR:=False;
                SPIS_PROW:=False;
                Show_Sost;
                SAVE:=True;
     end;
end;

procedure TDoc_SPIS.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if (Field.FieldName='TW_ART')
        and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
        then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
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
     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
      if (Field.FieldName='TW_ART')
         and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
         then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
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
     end;
end;

procedure TDoc_SPIS.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='OTG_KOL' then begin
        {Отгружено больше}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat>
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR4>0) then Background:=OTG_COLOR4;
        {Отгружен частично}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR3>0) then Background:=OTG_COLOR3;
        {Отгружено полностью}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR2>0) then Background:=OTG_COLOR2;
        {Вообще не отгружено}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat=0)
           and (OTG_COLOR1>0) then Background:=OTG_COLOR1;
     end;
     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
     if Field.Fieldname='OTG_KOL' then begin
        {Отгружено больше}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat>
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR4>0) then Afont.color:=OTG_COLOR4;
        {Отгружен частично}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR3>0) then Afont.color:=OTG_COLOR3;
        {Отгружено полностью}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR2>0) then Afont.color:=OTG_COLOR2;
        {Вообще не отгружено}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat=0)
           and (OTG_COLOR1>0) then Afont.color:=OTG_COLOR1;
     end;
     end;

end;

procedure TDoc_SPIS.MemSPISSOTG_KOLChange(Sender: TField);
begin
     if not (MemSPISS.state in [dsinsert]) then begin
        MemSPISS.fieldbyname('OTG_DATE').asdatetime:=DATE()+TIME();
        MemSPISS.fieldbyname('OTG_US').asinteger:=USERID;
        MemSPISS.fieldbyname('OTG_USS').asstring:=USERFIO;
     end;
end;

procedure TDoc_SPIS.FormActivate(Sender: TObject);
begin
     PageControl1.ActivePage:=Tabsheet1;
     RxDbGrid1.setfocus;
end;

procedure TDoc_SPIS.ToolButton3Click(Sender: TObject);
begin
     My_lock;
end;

procedure TDoc_SPIS.SPIS_SPISVIDChange(Sender: TObject);
var
  vis:boolean;
begin
   SAVE:=False;
   if DataModule1.MainDicSpisVid.fieldByname('SPISVID_US').asinteger=1 then vis:=true else vis:=false;
   US2_Label.visible:=Vis;
   US2_FULL.visible:=Vis;
   US2_BTN.visible:=Vis;
end;

procedure TDoc_SPIS.Btn_OstClick(Sender: TObject);
begin
    MemSpiss.edit;
    MemSpiss.FieldByName('TW_KOL').asfloat:=
      MemSpisS.fieldByname('OST').asfloat;
    MemSpiss.Post;
end;

procedure TDoc_SPIS.US2_BtnClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=US2_ID;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>Us2_ID then begin
        SAVE:=False;
        US2_ID:=DIC_KLIENT.tag;
        Change_FRMUs2(Us2_ID,2);
     end;
     DIC_KLIENT.Destroy;
end;

procedure TDoc_SPIS.MemSPISSTW_KOLChange(Sender: TField);
var
  val:double;
begin
   SAVE:=FALSE;
   val:=MemSPISS.fieldByname('TW_KOL').asfloat;
   if val<=0 then begin
     MemSPISS.fieldByname('TW_KOL').asfloat:=1;
     messbox('Количество товара не может быть нулевой или отрицательной величиной! '+CR+
     'Количеcтво с '+floattostrf(val,fffixed,19,4)+' изменено на 1.000!',MessError,16);
   end;
end;

procedure TDoc_SPIS.BtnKorrClick(Sender: TObject);
var
  close_date:tdatetime;
begin
  WorkTransaction.Active:=False;
  ADD_SQL(QueryWork,' select cast((select period2.period_close from period period2 where '+
  'period2.usgroup_id=usgroup.usgroup_id and period2.period_change=(select max(period.period_change) from '+
  'period where period.usgroup_id=usgroup.usgroup_id)) as date) as dt '+
  'from kln,usgroup where kln.usgroup_id=usgroup.usgroup_id and (kln.kln_id=:kln_id) ');
  QueryWork.PAramByname('kln_id').asinteger:=userid;
  QueryWork.Open;
  if QueryWork.eof then close_date:=date()
  else close_date:=QueryWork.fieldByname('dt').asdatetime;
    // Коррекция
  if SPIS_DATE.date<close_date then messbox('Дата документа меньше даты закрытия периода!',MessSystem,48) else begin
    if not SPIS_KORR then begin
      if messbox('Открыть акт списания для коррекции?',MessSubmit,4+48+256)=6 then begin
         // фиксируем акт коррекции
         Datamodule1.IBTransaction2.Active:=False;
         Datamodule1.IBTransaction2.StartTransaction;
         try
           IBSAVE_CLEAR;
           IBSAVE_ADD('US_ID',USERID);
           IBSAVE_ADD('SHOP_ID',SHOPID);
           IBSAVE_ADD('MESS','$6');
           IBSAVE_ADD('DOC','SPIS');
           IBSAVE_ADD('DOP1',2);
           IBSAVE_ADD('DOP2',DOC_SPIS.tag);
           IBSAVE_DOC('ARCUPDATE',-1);
           Datamodule1.IBTransaction2.Commit;
         except
           Datamodule1.IBTransaction2.Rollback;
         end;
         Datamodule1.IBTransaction2.Active:=False;
         SPIS_KORR:=true;
         Show_sost;
      end;
    end;
  end;
end;

procedure TDoc_SPIS.FRMChange(Sender: TObject);
begin
  save:=false;
  Btn_RefreshOstClick(nil);
  show_sost;
end;

procedure TDoc_SPIS.SKLChange(Sender: TObject);
begin
  save:=false;
  Btn_RefreshOstClick(nil);
  show_sost;
end;

end.
