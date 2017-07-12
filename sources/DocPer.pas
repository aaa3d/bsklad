unit DocPer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, CurrEdit, Mask, ToolEdit, RxLookup, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, ComCtrls, ToolWin,Data1,B_DBUtils,B_Utils, Db,
  IBCustomDataSet, IBQuery, RxMemDS, IBDatabase,DetalTW, Menus,SetSkid;

type
  TDoc_PER = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Label8: TLabel;
    PER_OSN: TMemo;
    Label10: TLabel;
    PER_NUM: TEdit;
    Label11: TLabel;
    PER_DATE: TDateEdit;
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
    MemPERS: TRxMemoryData;
    DsPERS: TDataSource;
    MemPERSTW_ID: TIntegerField;
    MemPERSTW_NAM: TStringField;
    MemPERSTW_MONEY: TFloatField;
    MemPERSTW_KOL: TFloatField;
    MemPERSTW_SUMM: TFloatField;
    MemPERSED_SHORT: TStringField;
    MemPERSSTS_ID: TIntegerField;
    MemPERSTW_ART: TIntegerField;
    PER_SUMM: TRxCalcEdit;
    Label14: TLabel;
    Btn_RefreshSumm: TBitBtn;
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
    MemPERSOST: TFloatField;
    ToolButton2: TToolButton;
    Btn_RefreshOst: TToolButton;
    MnRefreshOst: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    SKL_FROM: TRxDBLookupCombo;
    Label3: TLabel;
    PER_WHO: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    N2: TMenuItem;
    MnProw: TMenuItem;
    MnUnprow: TMenuItem;
    Label4: TLabel;
    MemPERSTW_COLOR: TIntegerField;
    N1: TMenuItem;
    MnFRM: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    Btn_Ost: TToolButton;
    MnOst: TMenuItem;
    MemPERSOTG_KOL: TFloatField;
    MemPERSPOL_KOL: TFloatField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    SKL_TO: TRxDBLookupCombo;
    Label6: TLabel;
    btnFastInfo: TToolButton;
    MemPersPERS_WEIGHT: TFloatField;
    MemPERSTW_WEIGHT: TFloatField;
    Label7: TLabel;
    PER_WEIGHT: TRxCalcEdit;
    BitBtn1: TBitBtn;
    FRM: TRxDBLookupCombo;
    Label2: TLabel;
    frm2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Show_Sost;
    Procedure Refresh_summ;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MemPERSCalcFields(DataSet: TDataSet);
    procedure Btn_RefreshSummClick(Sender: TObject);
    procedure Btn_ApplyClick(Sender: TObject);
    procedure MemPERSTW_IDChange(Sender: TField);
    procedure Btn_SAVEClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DsPERSDataChange(Sender: TObject; Field: TField);
    procedure Btn_DelTowClick(Sender: TObject);
    procedure Btn_DetalClick(Sender: TObject);
    procedure ADD_PERS(TW_ID:integer;KOL:double);
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
    procedure SKL_FROMChange(Sender: TObject);
    procedure PER_WHOChange(Sender: TObject);
    procedure PER_OSNChange(Sender: TObject);
    procedure PER_DATEChange(Sender: TObject);
    procedure Btn_ProwClick(Sender: TObject);
    procedure Btn_UnprowClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure MemPERSOTG_KOLChange(Sender: TField);
    procedure MemPERSPOL_KOLChange(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Btn_OstClick(Sender: TObject);
    procedure MemPERSTW_KOLChange(Sender: TField);
    procedure SKL_TOChange(Sender: TObject);
    procedure FRMChange(Sender: TObject);
  private

    skl_from_frm, skl_to_frm: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CanRefreshSKL:boolean;
  CanInsert:Boolean=False;
  PERS_DEL:array[1..1000] of integer;
  PERS_DEL_TW:array[1..1000] of integer;
  PERS_DEL_OTG:array[1..1000] of double;
  PERS_DEL_POL:array[1..1000] of double;
  PERS_DEL_MESS:array[1..1000] of string;
  PERS_DEL_MESS2:array[1..1000] of string;
  CNT_DEL:integer=0;
  SAVE:boolean;
  Doc_PER: TDoc_PER;
  Sost:integer=0;
  SHOP_ID:integer;
  PER_NUMS:integer;
  STR:ansistring='';
  PER_PROW:boolean;



  CAN_REFRESH: boolean;

implementation

uses Mainform, DicKlient, ANALIZTW, DicTowar, SelectPrint, SetKolvo;

{$R *.DFM}

procedure TDoc_PER.Show_sost;
var
   s:ansistring;
   PerEmpty:boolean;
begin
     if Doc_Per.Tag<0 then
       Doc_Per.caption:='Накладная перемещения. Новая'
     else begin
          if PER_PROW then
            Doc_PER.caption:='Накладная перемещения. Просмотр'
          else
            Doc_PER.caption:='Накладная перемещения. Редактирование';
     end;
     if MemPERS.RecordCount=0 then PerEmpty:=true else PerEmpty:=false;
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
     Btn_Prow.enabled:=(not PER_PROW) and (not PerEmpty);
     MnProw.enabled:=(not PER_PROW) and (not PerEmpty);
     Btn_UnProw.enabled:=(PER_PROW) and (not PerEmpty);
     MnUnProw.enabled:=(PER_PROW) and (not PerEmpty);
     Btn_SAVE.enabled:=(not PER_PROW) and (not PerEmpty);
     MnSAVE.enabled:= (not PER_PROW) and (not PerEmpty);
     Btn_Apply.enabled:=(not PER_PROW) and (not PerEmpty);
     MnApply.enabled:=(not PER_PROW) and (not PerEmpty);
     Btn_Print.enabled:=not PerEmpty;
     MnPrint.enabled:=not PerEmpty;
     Btn_Propertis.enabled:=true;
     MnHistory.enabled:=true;
     Btn_SubDoc.enabled:=not PerEmpty;
     MnSubDoc.enabled:=not PerEmpty;
     Btn_DicTow.enabled:=not PER_PROW;
     MnTw.enabled:=not PER_PROW;
     Btn_FindTow.enabled:=not PerEmpty;
     MnFind.enabled:=not PerEmpty;
     Btn_DelTow.enabled:=(not PER_PROW) and (not PerEmpty);
     MnDel.enabled:=(not PER_PROW) and (not PerEmpty);
     Btn_Ost.enabled:=(not PER_PROW) and (not PerEmpty);
     MnOst.enabled:=(not PER_PROW) and (not PerEmpty);
     Btn_DETAL.enabled:=not PerEmpty and CANTW_DETAL;
     MnDETAL.enabled:=not PerEmpty and CANTW_DETAL;
     Btn_Analiz.enabled:=not PerEmpty and CANTW_ANALIZ;
     MnAnaliz.enabled:=not PerEmpty and CANTW_ANALIZ;
     Btn_Marketing.enabled:=not PerEmpty and CANTW_MARKETING;
     MnMarketing.enabled:=not PerEmpty and CANTW_MARKETING;
     Btn_PrintCenn.enabled:=not PerEmpty;
     MnCenn.enabled:=not PerEmpty;
     Btn_PrintCennMore.enabled:=not PerEmpty;
     MnCennMore.enabled:=not PerEmpty;
     RxDbgrid1.ReadOnly:=Per_PROW;
     SKL_FROM.enabled:=not PER_PROW;
     SKL_TO.enabled:=not PER_PROW;
     PER_DATE.enabled:=not PER_PROW;
     PER_OSN.enabled:=not PER_PROW;
     PER_WHO.enabled:=not PER_PROW;
     FRM.enabled:=(Not PER_PROW) ;
     MnFrm.enabled:=frm.enabled;
end;

procedure TDoc_PER.FormShow(Sender: TObject);
begin
     CAN_REFRESH:=false;
     IS_EDIT_PER:=true;
     CanRefreshSKL:=false;
     skl_from_frm:=-1;




     Sost:=0;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-29;
     {Определяем название}
     if Doc_PER.tag<0 then begin
       Sost:=1;
       PER_PROW:=FALSE;
       Get_default;
       {Устанавливаем данные}
       SHOP_ID:=SHOPID;
       PER_OSN.lines.clear;
       PER_WHO.text:='';
       PER_NUM.text:='Новая';
       PER_DATE.date:=Date();
       PER_NUMS:=-1;

			 SKL_FROM.value := inttostr(DEFAULT_SKLAD);
       SKL_TO.value := inttostr(DEFAULT_SKLAD);


     end else begin
          {Читаем накладную}
          ADD_SQL(IbQuery1,'select per.*,  (select kln_full from kln_data(per.frm_id)) FRM_FULL, (select kln_full from kln_data((select rn.kln_id from rn where rn.rn_id=per.rn_id))) FRM_2 '+
' from PER where PER_ID=:PER_ID');

          {Определяем, где накладная}
          IbQuery1.Parambyname('PER_ID').asinteger:=Doc_PER.tag;
          IbQuery1.Open;
          if IbQuery1.fieldbyname('PER_PROW').asstring='1' then PER_PROW:=true else PER_PROW:=false;








          SKL_FROM.value := IbQuery1.fieldbyname('SKL_FROM').asstring;
          SKL_TO.value := IbQuery1.fieldbyname('SKL_TO').asstring;

          FRM.value := IbQuery1.fieldbyname('FRM_ID').asstring;
          if FRM.value='' then
          begin
            FRM.DisplayEmpty := IbQuery1.fieldbyName('FRM_FULL').asstring;
            FRM.EmptyValue := IbQuery1.fieldbyName('FRM_ID').asstring;
          end;

          frm2.Caption:=IbQuery1.fieldbyName('FRM_2').asstring;




          SHOP_ID:=IbQuery1.fieldbyname('SHOP_ID').asinteger;
          PER_OSN.lines.clear;
          PER_OSN.lines.add(IbQuery1.fieldbyname('PER_OSN').asstring);
          PER_WHO.text:=IbQuery1.fieldbyname('PER_WHO').asstring;
          PER_NUM.text:=IbQuery1.fieldbyname('PER_NUM').asstring;
          PER_NUMS:=IbQuery1.fieldbyname('PER_NUM').asinteger;
          PER_DATE.date:=IbQuery1.fieldbyname('PER_DATE').asdatetime;
          {Читаем содержимое накладной}


          ADD_SQL(IbQuery1,'select rn_prow from rn, per where rn.rn_id=per.rn_id and PER_ID=:PER_ID');
          IbQuery1.Parambyname('PER_ID').asinteger:=Doc_PER.tag;
          IbQuery1.Open;
          if not ibquery1.Eof then  //у перемещения есть документы в связке. закрыть изменение фирмы
          begin
            FRM.ReadOnly:=true;
            if ibquery1.FieldByName('RN_PROW').asstring='1' then PER_PROW:=true else PER_PROW:=false;
          end;
          ibquery1.Close;





          {Читаем накладную перемещения}
          Add_SQL(IbQuery1,'select * from LIST_PERS(:PER_ID,1) order by PERS_ID');
          IbQuery1.Parambyname('PER_ID').asinteger:=Doc_PER.tag;
          IbQuery1.Open;
          while not IbQuery1.eof do begin
                CanInsert:=True;
                MemPERS.Append;
                MemPERS.Fieldbyname('PERS_ID').asinteger:=IbQuery1.Fieldbyname('PERS_ID').asinteger;
                MemPERS.Fieldbyname('TW_ID').asinteger:=IbQuery1.Fieldbyname('TW_ID').asinteger;
                MemPERS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TW_COLOR').asinteger;
                MemPERS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
                MemPERS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
                MemPERS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
                MemPERS.Fieldbyname('TW_KOL').asfloat:=IbQuery1.Fieldbyname('TW_KOL').asfloat;
                MemPERS.Fieldbyname('OTG_KOL').asfloat:=IbQuery1.Fieldbyname('OTG_KOL').asfloat;
                MemPERS.Fieldbyname('POL_KOL').asfloat:=IbQuery1.Fieldbyname('POL_KOL').asfloat;
                MemPERS.Fieldbyname('TW_MONEY').asfloat:=IbQuery1.Fieldbyname('TW_MONEY').asfloat;
                MemPERS.fieldByname('OST').asfloat:=IbQuery1.Fieldbyname('OST').asfloat;;
                MemPERS.fieldByname('TW_WEIGHT').asfloat:=IbQuery1.Fieldbyname('TW_WEIGHT').asfloat;


                MemPERS.Post;
                CanInsert:=False;
                IbQuery1.next;
          end;
     end;
     btn_refreshost.Click;
     CAN_REFRESH:=true;
     Refresh_summ;
     Show_Sost;
     CanRefreshSKL:=true;
     Pagecontrol1.ActivePage:=Tabsheet1;
     RxDbGrid1.setfocus;
     SAVE:=true;
end;

procedure TDoc_PER.FormKeyPress(Sender: TObject; var Key: Char);
var
   ID:integer;
   N:integer;
begin
   if not PER_PROW then begin
     if (key='*') and (sost=0)  then begin
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
                    ADD_PERS(ID,-1);
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
end;

procedure TDoc_PER.MemPERSCalcFields(DataSet: TDataSet);
begin
     MemPERS.fieldbyname('TW_SUMM').asfloat:=MemPERS.fieldbyname('TW_MONEY').asfloat*MemPERS.fieldbyname('TW_KOL').asfloat;
     MemPERS.fieldbyname('PERS_WEIGHT').asfloat:=MemPERS.fieldbyname('TW_WEIGHT').asfloat*MemPERS.fieldbyname('TW_KOL').asfloat;
end;

Procedure TDoc_PER.Refresh_summ;
var
   a,ID:integer;
   Summ:Double;
   Weight: double;
begin
     if MemPERS.RecordCount=0 then begin
        PER_SUMM.Value:=0;
        PER_WEIGHT.Value:=0;
     end else begin

         ID:=MemPERS.RecNo;
         MemPERS.DisableControls;
         MemPERS.First;
         Summ:=0;
         Weight:=0;
         while not MemPERS.eof do begin
               SUMM:=SUMM+MemPERS.fieldbyname('TW_SUMM').asfloat;
               WEIGHT:=WEIGHT+MemPERS.fieldbyname('PERS_WEIGHT').asfloat;
               MemPERS.next;
         end;
         MemPERS.First;
         for a:=1 to ID-1 do MemPERS.next;
         MemPERS.EnableControls;
         PER_SUMM.Value:=SUMM;
         PER_WEIGHT.Value:=WEIGHT;
     end;
end;

procedure TDoc_PER.Btn_RefreshSummClick(Sender: TObject);
begin
     Refresh_summ;
end;

procedure TDoc_PER.Btn_ApplyClick(Sender: TObject);
var
   A,PER_ID,ID,OLDID:integer;
   r,IDR:double;
   new_rns_td_id: integer;
   new_pns_td_id: integer;
begin

  if SKL_FROM.value='' then messbox('Не указан склад-отправитель!',MessSystem,48)
  else
  if SKL_TO.value='' then messbox('Не указан склад-получатель!',MessSystem,48)
  else

  if FRM.value='' then
   begin
     Messbox('Не указана фирма!',  MessError, MB_OK);
     exit;
   end
   else
{
  if (  ((skl_from_frm>0) and   (skl_to_frm=0)) ) then
  begin
    Messbox('Нельзя перемещать товар со склада фирмы на розничный склад без создания заявки на перемещений.'+chr(13)+'Сделайте накладную перемещения на основании заявки на перемещение',  MessError, MB_OK);
    exit;
  end
  else

  if (  (skl_from_frm=0) and   (skl_to_frm>0) ) then
  begin
    Messbox('нельзя перемещать товар с розничного склада на склад фирмы',  MessError, MB_OK);
    exit;
  end

  else
}
  //ПРОВЕРИТЬ ПРОДАВЦА ТОВАРОВ
  //(только если продажи производятся со складов, где нет фирмы-владельца)
  //для единого склада не нужна проверка на продавца товара в перемещении.
{
  if (skl_from_frm=0) then
    if  (CheckTwSaler(mempers, strtoint(frm.value))=false)   then
    exit
  else
 }
  begin
     {Сохраняем накладную (Apply)}
     caption:='Шаг1';
     if (MemPers.State in [dsInsert,DsEdit]) then MemPers.Post;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     OLDID:=MemPERS.recno;
     Try
        if NOT PER_PROW then begin
          IBSAVE_CLEAR;
          if PER_NUMS<0 then PER_NUMS:=NEW_PER_NUM(strtoint('0'+frm.Value),PER_DATE.date);
          IBSAVE_ADD('PER_NUM',PER_NUMS);
          IBSAVE_ADD('FRM_ID',FRM.Value);
          IBSAVE_ADD('FRM_TO',FRM.Value);
          IBSAVE_ADD('PER_DATE',strtodatetime(datetostr(PER_DATE.date)+' '+timetostr(time())));
          IBSAVE_ADD('SKL_FROM',strtoint(SKL_FROM.value));
          IBSAVE_ADD('SKL_TO',strtoint(SKL_TO.value));
          IBSAVE_ADD('SHOP_ID',SHOP_ID);
          IBSAVE_ADD('PER_PROW','0');
          IBSAVE_ADD('PER_OSN',Memotostr(PER_OSN.lines));
          IBSAVE_ADD('PER_WHO',PER_WHO.text);
          IBSAVE_ADD('US_ID',USERID);
          PER_ID:=IBSAVE_DOC('PER',DOC_PER.tag);
          caption:='Шаг2';
        end else PER_ID:=DOC_PER.tag;
        if PER_ID<=0 then IDR:=SQRT(-1)
        else begin
             // Фиксируем удаление товаров
      caption:='Шаг3';
             for A:=1 to CNT_DEL do begin
               IBSAVE_CLEAR;
               IBSAVE_ADD('DOC','PER');
               IBSAVE_ADD('US_ID',USERID);
               IBSAVE_ADD('SHOP_ID',SHOPID);
               IBSAVE_ADD('MESS',PERS_DEL_MESS[a]);
               IBSAVE_ADD('DOP1',4);
               IBSAVE_ADD('DOP2',PER_ID);
               if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
               if ((PERS_DEL_OTG[a]>0) or (PERS_DEL_POL[a]>0)) then begin
                 IBSAVE_CLEAR;
                 IBSAVE_ADD('DOC','TWPER');
                 IBSAVE_ADD('US_ID',USERID);
                 IBSAVE_ADD('SHOP_ID',SHOPID);
                 IBSAVE_ADD('MESS',PERS_DEL_MESS2[a]);
                 IBSAVE_ADD('DOP1',DOC_PER.tag);
                 IBSAVE_ADD('DOP2',-PERS_DEL_TW[a]);
                 if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
               end;
             end;
     caption:='Шаг4';
             {Сохраняем содержимое}
             {Сначала удаляем удалённое}
             for A:=1 to CNT_DEL do begin
                 if PERS_DEL[A]>0 then if not IBDELETE_DOC('PERS',PERS_DEL[A]) then IDR:=SQRT(-1);
             end;
             {Сохраняем имеющееся}
             MemPERS.DisableControls;
             MemPERS.First;
     caption:='Шаг5';
             while not MemPERS.eof do
             begin
                   caption:='Шаг5 ID='+inttostr(MemPers.recno);

                   IBSAVE_CLEAR;
                   IBSAVE_ADD('PER_ID',PER_ID);
                   if new_rns_td_id > 0 then
                    IBSAVE_ADD('RNS_TD_ID',new_rns_td_id);
                   IBSAVE_ADD('TW_ID',MemPERS.fieldbyname('TW_ID').asinteger);
                   IBSAVE_ADD('TW_KOL',MemPERS.fieldbyname('TW_KOL').asfloat);
                   IBSAVE_ADD('TW_MONEY',MemPERS.fieldbyname('TW_MONEY').asfloat);
                   IBSAVE_ADD('OTG_KOL',MemPERS.fieldbyname('OTG_KOL').asfloat);
                   IBSAVE_ADD('POL_KOL',MemPERS.fieldbyname('POL_KOL').asfloat);
                   if MemPERS.fieldbyname('PERS_ID').asinteger<0 then begin
                      IBSAVE_ADD('OTG_US',0);
                      IBSAVE_ADD('OTG_DATE',NOW());
                      IBSAVE_ADD('POL_US',0);
                      IBSAVE_ADD('POL_DATE',NOW());
                   end;
                   ID:=IBSAVE_DOC('PERS',MemPERS.fieldbyname('PERS_ID').asinteger);
                   if ID<0 then IDR:=SQRT(-1) else begin
                      if (DOC_PER.tag>0) and (MemPERS.fieldbyname('PERS_ID').asinteger<0) then begin
                          // Фиксируем факт добавления товара
                          IBSAVE_CLEAR;
                          IBSAVE_ADD('DOC','PER');
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          IBSAVE_ADD('MESS','Добавлен товар: '+MemPERS.Fieldbyname('TW_ART').asstring+' '+
                          MemPERS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemPERS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
                          MemPERS.Fieldbyname('ED_SHORT').asstring);
                          IBSAVE_ADD('DOP1',2);
                          IBSAVE_ADD('DOP2',PER_ID);
                          if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                      end;
                      MemPERS.Edit;
                      MemPERS.fieldbyname('PERS_ID').asinteger:=ID;
                      MemPERS.Post;
                   end;





                   MemPERS.next;
             end;
        end;
     caption:='Шаг6';
        {Всё прошло нормально - изменяем временные данные}
        {Отображаем номер}
        Doc_PER.tag:=PER_ID;
        PER_NUM.text:=inttostr(PER_NUMS);
        MemPERS.First;
        while not MemPERS.eof do begin
              if MemPERS.fieldbyname('PERS_ID').asinteger<0 then begin
                 MemPERS.Edit;
                 MemPERS.fieldbyname('PERS_ID').asinteger:=-MemPERS.fieldbyname('PERS_ID').asinteger;
                 MemPERS.Post;
              end;
              // считаем, что товар в дополнительные накладные сохранился, и его больше сохранять НЕ НАДО

              MemPERS.next;
        end;
        MemPERS.First;
        for a:=1 to OLDID-1 do MemPERS.next;
        CNT_DEL:=0;
        MemPERS.EnableControls;
        Datamodule1.IBTransaction2.Commit;
        SAVE:=TRUE;
     Except
        Messbox('Ошибка при сохранении накладной перемещения!',MessSystem,48);
        Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TDoc_PER.MemPERSTW_IDChange(Sender: TField);
begin
     SAVE:=FALSE;
end;

procedure TDoc_PER.Btn_SAVEClick(Sender: TObject);
begin
     SAVE:=false;
     Btn_Apply.Click;
     if SAVE then begin
        if not PER_PROW then Btn_Prow.Click;
        Close;
     end;
end;

procedure TDoc_PER.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save) and (Btn_Apply.enabled) then begin
        if Messbox('Накладная была изменёна! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDoc_PER.DsPERSDataChange(Sender: TObject; Field: TField);
begin
     if MemPERS.State in [dsInsert,dsEdit] then SAVE:=False;
     if (MemPERS.State in [dsInsert]) and ( not CanInsert) then MemPERS.Cancel;
end;

procedure TDoc_PER.Btn_DelTowClick(Sender: TObject);
var
   PER_NUM_FULL:ansistring;
begin
     if Messbox('Удалить из накладной товар "'+MemPERS.Fieldbyname('TW_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        SAVE:=False;
        if MemPERS.Fieldbyname('PERS_ID').asinteger>0 then begin
          inc(CNT_DEL);
          WorkTransaction.Active:=False;
          ADD_SQL(QueryWork,'select KLN.KLN_PREFIX,SHOP.SHOP_PREFIX,SHOP.SHOP_POSTFIX, '+
          'PER.PER_NUM from PER,SHOP,KLN where PER.PER_ID=:PER_ID '+
          'and PER.FRM_ID=KLN.KLN_ID  '+
          'and PER.SHOP_ID=SHOP.SHOP_ID ');
          QueryWork.paramByname('PER_ID').asinteger:=DOC_PER.tag;
          QueryWork.open;
          if not QueryWork.eof then
            PER_NUM_FULL:=QueryWork.fieldByname('KLN_PREFIX').asstring+' '+
            QueryWork.fieldByname('SHOP_PREFIX').asstring+'ПЕР'+
            b_utils.right('0000000000'+inttostr(PER_NUMS),10)+QueryWork.fieldByname('SHOP_POSTFIX').asstring;
          PERS_DEL[CNT_DEL]:=MemPERS.Fieldbyname('PERS_ID').asinteger;
          PERS_DEL_OTG[CNT_DEL]:=MemPERS.Fieldbyname('OTG_KOL').asinteger;
          PERS_DEL_POL[CNT_DEL]:=MemPERS.Fieldbyname('POL_KOL').asinteger;
          PERS_DEL_TW[CNT_DEL]:=MemPERS.Fieldbyname('TW_ID').asinteger;
          PERS_DEL_MESS[CNT_DEL]:='Удален товар: '+MemPERS.Fieldbyname('TW_ART').asstring+' '+
          MemPERS.Fieldbyname('TW_NAM').asstring+' '+floattostrf(MemPERS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
          MemPERS.Fieldbyname('ED_SHORT').asstring;
          PERS_DEL_MESS2[CNT_DEL]:=PER_NUM_FULL+' Из накладной удален товар с отгрузкой '+floattostrf(MemPERS.Fieldbyname('OTG_KOL').asfloat,fffixed,19,3)+' '+
          MemPERS.Fieldbyname('ED_SHORT').asstring+' и получением '+floattostrf(MemPERS.Fieldbyname('POL_KOL').asfloat,fffixed,19,3)+' '+
          MemPERS.Fieldbyname('ED_SHORT').asstring;
        end;
        MemPERS.delete;
        Refresh_summ;
        Show_Sost;
     end;
end;

procedure TDoc_PER.Btn_DetalClick(Sender: TObject);
begin
  SHOW_DETAL_TW(MemPERS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_PER.FormKeyDown(Sender: TObject; var Key: Word;
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
          Select_Print.Button1.caption:='Напечатать накладную перемещения';
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

procedure TDoc_PER.ADD_PERS(TW_ID:integer;KOL:double);
var
   TW_TEMP:integer;
   TW_STR:ansistring;
   ISS:boolean;
begin
  begin

     if FRM.value='' then
     begin
      Messbox('Не указана фирма!',  MessError, MB_OK);
      exit;
     end;

     if SKL_FROM.value='' then
     begin
      Messbox('Не указан склад-отправитель!',  MessError, MB_OK);
      exit;
     end;

     if SKL_TO.value='' then
     begin
      Messbox('Не указан склад-получатель!',  MessError, MB_OK);
      exit;
     end;

     Can_Refresh:=false;
     TW_TEMP:=0;
     {Проверяем, нет ли в накладной уже такого товара}
     if MemPERS.RecordCount>0 then TW_TEMP:=MemPERS.fieldByname('TW_ID').asinteger;
     ISS:=false;
     MemPERS.Disablecontrols;
     MemPERS.first;
     while (not MemPERS.eof) and (not ISS) do begin
           if MemPERS.fieldByname('TW_ID').asinteger=TW_ID then begin
              ISS:=true;
              TW_STR:=MemPERS.fieldByname('TW_ART').asstring+'-'+MemPERS.fieldByname('TW_NAM').asstring;
           end;
           MemPERS.next;
     end;
     MemPERS.EnableControls;
     if ISS then Messbox('Накладная уже содержит товар '+TW_STR+' и он не может быть добавлен!',MessSystem,48) else
     begin
               //Проверять только если продажа со склада, где нет фирмы-владельца

          SAVE:=False;
          Query1Transaction.Active:=False;
          IbQuery1.Close;
          IbQuery1.SQL.clear;
          IbQuery1.SQL.add('select tw.tw_weight, twktg.twktg_color,tw.tw_art,tw.tw_nam,tw.ed_id,ed.ed_short,  '+
          '(select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
          '(select max(kurs_date) from kurs where '+
          'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz '+
          'from tw,ed,twktg '+
          'where tw.ed_id=ed.ed_id and tw.tw_id=:TW_ID and tw.twktg_id=twktg.twktg_id ');
          IbQuery1.Parambyname('TW_ID').asinteger:=TW_ID;
          IbQuery1.Open;

          CanInsert:=True;
          MemPERS.Append;
          MemPERS.Fieldbyname('PERS_ID').asinteger:=-1;
          MemPERS.Fieldbyname('TW_ID').asinteger:=TW_ID;
          MemPERS.Fieldbyname('TW_ART').asinteger:=IbQuery1.Fieldbyname('TW_ART').asinteger;
          MemPERS.Fieldbyname('TW_COLOR').asinteger:=IbQuery1.Fieldbyname('TWKTG_COLOR').asinteger;
          MemPERS.Fieldbyname('TW_NAM').asstring:=IbQuery1.Fieldbyname('TW_NAM').asstring;
          MemPERS.Fieldbyname('ED_SHORT').asstring:=IbQuery1.Fieldbyname('ED_SHORT').asstring;
          MemPERS.Fieldbyname('TW_MONEY').asfloat:=IbQuery1.Fieldbyname('TW_MROZ').asfloat;
          MemPERS.Fieldbyname('TW_WEIGHT').asfloat:=IbQuery1.Fieldbyname('TW_WEIGHT').asfloat;
          MemPERS.Fieldbyname('OTG_KOL').asfloat:=0;
          MemPERS.Fieldbyname('POL_KOL').asfloat:=0;
          MemPERS.fieldByname('OST').asfloat:=GetOst(TW_ID,strtoint(SKL_FROM.value), strtoint(FRM.value));


          if KOL<0 then begin
             Application.createForm(TSET_KOLVO,SET_KOLVO);
             SET_KOLVO.NAME.text:=IbQuery1.fieldByname('TW_ART').asstring+
                            IbQuery1.fieldByname('TW_NAM').asstring;
             SET_KOLVO.showModal;
             if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
             MemPERS.Fieldbyname('TW_KOL').asfloat:=SET_KOLVO.KOL.value;
             SET_KOLVO.destroy;
          end else MemPERS.Fieldbyname('TW_KOL').asfloat:=KOL;
          MemPERS.Post;
          CanInsert:=False;
     end;
     IbQuery1.Close;
     RxDbGrid1.setfocus;
     Can_Refresh:=true;
     Refresh_summ;
  end;
end;

procedure TDoc_PER.Btn_PrintClick(Sender: TObject);
begin
     if Not Save then
        if Btn_Apply.enabled then if Messbox('Документ был изменен! Сохранить изменения?',MessSubmit,4+48)=6 then Btn_Apply.click;
        {Печатаем}
        PRINT_PER(Doc_PER.tag);
end;

procedure TDoc_PER.Btn_SubdocClick(Sender: TObject);
begin
     if Not Save and Btn_Apply.enabled then Btn_Apply.click;
     {Создаём документ на основании имеющегося...}
     SUBDOC(5,0);
end;

procedure TDoc_PER.Btn_PropertisClick(Sender: TObject);
begin
     {Отображаем "историю" накладной перемещения}
     SHOW_HISTORY_DOC('Накладная перемещения № '+PER_NUM.text,'PER',DOC_PER.tag);
end;

procedure TDoc_PER.Btn_DicTowClick(Sender: TObject);
var
   a:integer;
begin
     if skl_from.value<>'' then SELECT_SKLAD:=strtoint(skl_from.value);
     DicTowarSet:=1; {Ввод товаров из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
        for a:=1 to CNT_TW do begin
            ADD_PERS(ARR_TW[a].ID,ARR_TW[a].KOL);
        end;
     end;
     Btn_refreshSumm.click;
     Show_sost;
end;

procedure TDoc_PER.Btn_FindTowClick(Sender: TObject);
begin
     {}
end;

procedure TDoc_PER.Btn_AnalizClick(Sender: TObject);
begin
  SHOW_ANALIZ_TW(MemPERS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_PER.Btn_MarketingClick(Sender: TObject);
begin
     SHOW_MARKETING_TW(MemPERS.fieldbyname('TW_ID').asinteger);
end;

procedure TDoc_PER.Btn_PrintCennClick(Sender: TObject);
begin
     CLEAR_CENNIK;
     ADD_CENNIK(MemPERS.fieldbyname('TW_ID').asinteger,strtoint(skl_from.value));
     PRINT_CENNIK;
end;

procedure TDoc_PER.Btn_PrintCennMoreClick(Sender: TObject);
var
   a,ID:integer;
begin
     CLEAR_CENNIK;
     if MemPERS.RecordCount>0 then begin
         ID:=MemPERS.RecNo;
         MemPERS.DisableControls;
         MemPERS.First;
         while not MemPERS.eof do begin
               ADD_CENNIK(MemPERS.fieldbyname('TW_ID').asinteger,strtoint(skl_from.value));
               MemPERS.next;
         end;
         MemPERS.First;
         for a:=1 to ID-1 do MemPERS.next;
         MemPERS.EnableControls;
         PRINT_CENNIK;
     end;
end;

procedure TDoc_PER.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IS_EDIT_PER:=False;

end;

procedure TDoc_PER.Btn_RefreshOstClick(Sender: TObject);
var
   a,ID:integer;
   Summ:Double;
   s:ansistring;
begin
     s:=Doc_PER.caption;
     Doc_PER.caption:=Doc_PER.caption+'. Чтение остатков товаров';
     if MemPERS.RecordCount>0 then begin
         ID:=MemPERS.RecNo;
         MemPERS.DisableControls;
         MemPERS.First;
         Summ:=0;
         while not MemPERS.eof do begin
               MemPERS.Edit;
               MemPERS.fieldByname('OST').asfloat:=GetOst(MemPERS.fieldByname('TW_ID').asinteger,strtoint(skl_from.value), strtoint(FRM.value));
               MemPERS.Post;
               MemPERS.next;
         end;
         MemPERS.First;
         for a:=1 to ID-1 do MemPERS.next;
         MemPERS.EnableControls;
     end;
     Doc_PER.caption:=s;
     Refresh_Summ;
end;

procedure TDoc_PER.SKL_FROMChange(Sender: TObject);

begin

  save:=false;

  Btn_RefreshOstClick(nil);


  show_sost;


end;

procedure TDoc_PER.PER_WHOChange(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TDoc_PER.PER_OSNChange(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TDoc_PER.PER_DATEChange(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TDoc_PER.Btn_ProwClick(Sender: TObject);
begin
     if Not Save and Btn_Apply.enabled then Btn_Apply.click;
     if (SAVE) then begin
        if PROV_PER(Doc_Per.tag,'') then begin
                PER_PROW:=True;
                Show_Sost;
                Btn_RefreshOst.click;
                SAVE:=true;
        end;
     end;
end;

procedure TDoc_PER.Btn_UnprowClick(Sender: TObject);
begin
     if UNPROV_PER(Doc_Per.tag,'') then begin
                Btn_RefreshOst.click;
                PER_PROW:=False;
                Show_Sost;
                SAVE:=True;
     end;
end;

procedure TDoc_PER.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
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

procedure TDoc_PER.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
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

procedure TDoc_PER.RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='POL_KOL' then begin
        {Отгружено больше}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_KOL').Asfloat>
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR4>0) then Background:=OTG_COLOR4;
        {Отгружен частично}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_KOL').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR3>0) then Background:=OTG_COLOR3;
        {Отгружено полностью}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_KOL').Asfloat=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR2>0) then Background:=OTG_COLOR2;
        {Вообще не отгружено}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_KOL').Asfloat=0)
           and (OTG_COLOR1>0) then Background:=OTG_COLOR1;
     end;
     if HighLight then  begin
      Afont.color:=clHighlighttext;
      Background:=clHighlight;
     if Field.Fieldname='POL_KOL' then begin
        {Отгружено больше}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_KOL').Asfloat>
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR4>0) then Afont.color:=OTG_COLOR4;
        {Отгружен частично}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_KOL').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR3>0) then Afont.color:=OTG_COLOR3;
        {Отгружено полностью}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_KOL').Asfloat=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OTG_COLOR2>0) then Afont.color:=OTG_COLOR2;
        {Вообще не отгружено}
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('POL_KOL').Asfloat=0)
           and (OTG_COLOR1>0) then Afont.color:=OTG_COLOR1;
     end;
     end;


end;

procedure TDoc_PER.MemPERSOTG_KOLChange(Sender: TField);
begin
     if not (MemPERS.state in [dsinsert]) then begin
        MemPERS.fieldbyname('OTG_DATE').asdatetime:=DATE()+TIME();
        MemPERS.fieldbyname('OTG_US').asinteger:=USERID;
        MemPERS.fieldbyname('OTG_USS').asstring:=USERFIO;
     end;

end;

procedure TDoc_PER.MemPERSPOL_KOLChange(Sender: TField);
begin
     if not (MemPERS.state in [dsinsert]) then begin
        MemPERS.fieldbyname('POL_DATE').asdatetime:=DATE()+TIME();
        MemPERS.fieldbyname('POL_US').asinteger:=USERID;
        MemPERS.fieldbyname('POL_USS').asstring:=USERFIO;
     end;
end;

procedure TDoc_PER.FormActivate(Sender: TObject);
begin
     PageControl1.ActivePage:=Tabsheet1;
     RxDbGrid1.setfocus;
end;

procedure TDoc_PER.ToolButton3Click(Sender: TObject);
begin
     My_lock;
end;

procedure TDoc_PER.Btn_OstClick(Sender: TObject);
begin
    MemPers.edit;
    MemPers.FieldByName('TW_KOL').asfloat:=
      MemPerS.fieldByname('OST').asfloat;
    MemPers.Post;

end;

procedure TDoc_PER.MemPERSTW_KOLChange(Sender: TField);
var
  val:double;
begin

   SAVE:=FALSE;
   val:=MemPERS.fieldByname('TW_KOL').asfloat;
   if val<=0 then begin
     MemPERS.fieldByname('TW_KOL').asfloat:=1;
     messbox('Количество товара не может быть нулевой или отрицательной величиной! '+CR+
     'Количеcтво с '+floattostrf(val,fffixed,19,4)+' изменено на 1.000!',MessError,16);
   end;
   if CAN_REFRESH then
   	Refresh_summ;


end;

procedure TDoc_PER.SKL_TOChange(Sender: TObject);
begin
  SAVE:=FALSE;
  skl_to_frm := dataModule1.MainDicSkl.fieldbyname('skl_frm').asinteger;
end;

procedure TDoc_PER.FRMChange(Sender: TObject);
begin
   	save:=false;
    Btn_RefreshOstClick(nil);
end;

end.
