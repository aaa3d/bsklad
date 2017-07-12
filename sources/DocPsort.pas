unit DocPsort;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ExtCtrls,Data1,b_utils,b_Dbutils,
  ActnList, StdCtrls, Buttons, CurrEdit, RxLookup, Mask, ToolEdit,
  IBDatabase, Db, IBCustomDataSet, IBQuery, RxMemDS,DetalTW,VclUtils,
  DBCtrls;

type
  TDOC_PSORT = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    ActionList1: TActionList;
    ActLock: TAction;
    ActProw: TAction;
    ActUnProw: TAction;
    ActSave: TAction;
    ActApply: TAction;
    ActPrint: TAction;
    ActHistory: TAction;
    ActDicTw: TAction;
    ActDel: TAction;
    ActDetal: TAction;
    ActAnaliz: TAction;
    ActMarket: TAction;
    ActPrintCenn: TAction;
    ActPrintCennAll: TAction;
    ActRefresh: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton18: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    Label10: TLabel;
    PSORT_NUM: TEdit;
    Label11: TLabel;
    PSORT_DATE: TDateEdit;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    Label2: TLabel;
    PSORT_OSN: TMemo;
    MemPsorts: TRxMemoryData;
    MemPsortspsorts_id: TIntegerField;
    MemPsortstw_id: TIntegerField;
    MemPsortstw_id2: TIntegerField;
    MemPsortstw_art1: TIntegerField;
    MemPsortstw_art2: TIntegerField;
    MemPsortstw_nam1: TStringField;
    MemPsortstw_nam2: TStringField;
    MemPsortsed_short1: TStringField;
    MemPsortsed_short2: TStringField;
    MemPsortstw_kol: TFloatField;
    MemPsortstw_ost: TFloatField;
    MemPsortstw_color1: TIntegerField;
    MemPsortstw_color2: TIntegerField;
    DsPsorts: TDataSource;
    Label3: TLabel;
    PSORT_MEN: TRxDBLookupCombo;
    ToolButton23: TToolButton;
    BtnSetOst: TToolButton;
    Label8: TLabel;
    FRM: TRxDBLookupCombo;
    Label1: TLabel;
    SKL: TRxDBLookupCombo;
    MemPsortstw_kol2: TFloatField;
    procedure FormShow(Sender: TObject);
    Procedure Show_Sost;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DsPsortsDataChange(Sender: TObject; Field: TField);
    procedure ADD_PSORTS(TW_ID:integer;KOL:double;TYP:integer);
    procedure ActLockExecute(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SKLChange(Sender: TObject);
    procedure ActRefreshExecute(Sender: TObject);
    procedure ActDetalExecute(Sender: TObject);
    procedure ActAnalizExecute(Sender: TObject);
    procedure ActMarketExecute(Sender: TObject);
    procedure ActPrintCennExecute(Sender: TObject);
    procedure ActPrintCennAllExecute(Sender: TObject);
    procedure ActApplyExecute(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure ActProwExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActUnProwExecute(Sender: TObject);
    procedure ActPrintExecute(Sender: TObject);
    procedure PSORT_DATEChange(Sender: TObject);
    procedure PSORT_OSNChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActHistoryExecute(Sender: TObject);
    procedure MemPsortstw_kolChange(Sender: TField);
    procedure BtnSetOstClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FRMChange(Sender: TObject);

  private
    { Private declarations }
    skl_frm: integer;
    FRM_ENABLED: boolean;
  public
    { Public declarations }
  end;

var
  DOC_PSORT: TDOC_PSORT;
  CanRefreshSKL:boolean;
  CanInsert:Boolean=False;
  PSORTS_DEL:array[1..1000] of integer;
  CNT_DEL:integer=0;
  SAVE:boolean;
  Sost:integer=0;
  SHOP_ID:integer;

  PSORT_NUMS:integer;
  STR:ansistring='';
  PSORT_PROW:boolean;
Const
   PSORT_CAP='Акт пересортицы';

implementation

uses Mainform, SetKolvo, ANALIZTW;

{$R *.DFM}


procedure TDOC_PSORT.Show_sost;
var
   s:ansistring;
   PsortEmpty:boolean;
begin
     if Doc_Psort.Tag<0 then
       Doc_Psort.caption:=PSORT_CAP+'. Новый'
     else begin
          if PSORT_PROW then
            Doc_PSORT.caption:=PSORT_CAP+'. Просмотр'
          else
            Doc_PSORT.caption:=PSORT_CAP+'. Редактирование'
     end;
     if MemPSORTS.RecordCount=0 then PSortEmpty:=true else PSortEmpty:=false;
     case Sost of
             0: begin
                   s:='Ожидание...';
                   Panel1.Color:=clBtnFace;
                   Panel1.Font.color:=ClWindowText;
                   StatusBar1.Panels[1].text:='Списываемый: ';
                   StatusBar1.Panels[2].text:='Приходуемый: ';
                end;
             1: begin
                   s:='Ввод списываемого...';
                   if TW_FON>=0 then Panel1.Color:=TW_FON;
                   if TW_COLOR>=0 then Panel1.Font.color:=TW_COLOR;
                   StatusBar1.Panels[1].text:='Списываемый: '+STR;
                end;
             2: begin
                   s:='Ввод приходуемого...';
                   if TW_FON>=0 then Panel1.Color:=TW_FON;
                   if TW_COLOR>=0 then Panel1.Font.color:=TW_COLOR;
                   StatusBar1.Panels[2].text:='Приходуемый: '+STR;
                end;
     end;
     StatusBar1.Panels[0].text:='Состояние: '+s;
     FRM.enabled:=not PSORT_PROW;
     ActProw.enabled:=(not PSORT_PROW) and (not PSortEmpty);
     ActUnProw.enabled:=(PSORT_PROW) and (not PsortEmpty);
     ActSAVE.enabled:=(not PSort_PROW) and (not PsortEmpty);
     ActApply.enabled:=(not PSORT_PROW) and (not PsortEmpty);
     ActPrint.enabled:=not PsortEmpty;
     ActHistory.enabled:=true;
     ActDicTw.enabled:=not PSORT_PROW;
     BtnSetost.enabled:=(not PSORT_PROW) and (not PsortEmpty);
     ActDel.enabled:=(not PSORT_PROW) and (not PsortEmpty);
     ActDETAL.enabled:=not PsortEmpty and CANTW_DETAL;
     ActAnaliz.enabled:=not PsortEmpty and CANTW_ANALIZ;
     ActMarket.enabled:=not PsortEmpty and CANTW_MARKETING;
     ActPrintCenn.enabled:=not PsortEmpty;
     ActPrintCennAll.enabled:=not PsortEmpty;
     RxDbgrid1.ReadOnly:=PSORT_PROW;
     SKL.enabled:=not PSORT_PROW;
     PSORT_DATE.enabled:=not PSORT_PROW;
     PSORT_OSN.enabled:=not PSORT_PROW;
end;


procedure TDOC_PSORT.FormShow(Sender: TObject);
begin
   // Начальная инициализация
   IS_EDIT_PSORT:=true;
   Top:=Main_Form.Top+22;
   Left:=Screen.DesktopLeft;
   Width:=Screen.Width;
   Height:=Screen.Height-Main_Form.Top-22-49;
   skl_frm:=-1;

   if DOC_PSORT.tag<0 then begin
       Sost:=1;
//       FRM_ID:=DEFAULT_FIRMA;
       PSORT_PROW:=FALSE;
       Get_default;
       {Устанавливаем данные}
       SHOP_ID:=SHOPID;
       PSORT_OSN.lines.clear;
       PSORT_NUM.text:='Новый';
       PSORT_DATE.date:=Date();
       PSORT_NUMS:=-1;
       PSORT_MEN.value:=inttostr(DEFAULT_OWNER_PN);
       SKL.value := inttostr(DEFAULT_SKLAD);



   end else begin
          {Читаем накладную}
          WorkTransaction.Active:=False;
          ADD_SQL(QueryWork,'select PSORT.*, (select kln_full from kln_data(psort.frm_id)) FRM_FULL, (select skl.skl_short from skl where skl.skl_id = psort.skl_id) SKL_SHORT from PSORT where PSORT_ID=:PSORT_ID');
          {Определяем, где накладная}
          QueryWork.Parambyname('PSORT_ID').asinteger:=Doc_PSORT.tag;
          QueryWork.Open;
          if QueryWork.fieldbyname('PSORT_PROW').asstring='1' then PSORT_PROW:=true else PSORT_PROW:=false;
          SKL.value := QueryWork.FieldbyName('SKL_ID').asstring;
          FRM.value := QueryWork.FieldbyName('FRM_ID').asstring;

          if FRM.value='' then
          begin
            FRM.DisplayEmpty := QueryWork.fieldbyName('FRM_FULL').asstring;
            FRM.EmptyValue := QueryWork.fieldbyName('FRM_ID').asstring;
          end;

          if SKL.value='' then
          begin
            SKL.DisplayEmpty := QueryWork.fieldbyName('SKL_SHORT').asstring;
            SKL.EmptyValue := QueryWork.fieldbyName('SKL_ID').asstring;
          end;

          SHOP_ID:=QueryWork.fieldbyname('SHOP_ID').asinteger;
          PSORT_OSN.lines.clear;
          PSORT_OSN.lines.add(QueryWork.fieldbyname('PSORT_OSN').asstring);
          PSORT_NUM.text:=QueryWork.fieldbyname('PSORT_NUM').asstring;
          PSORT_NUMS:=QueryWork.fieldbyname('PSORT_NUM').asinteger;
          PSORT_DATE.date:=QueryWork.fieldbyname('PSORT_DATE').asdatetime;
          PSORT_MEN.value:=QueryWork.fieldbyname('MEN_ID').asstring;


          {Читаем содержимое Акта списания}
          Add_SQL(QueryWork,'select * from LIST_PSORTS(:PSORT_ID) order by PSORTS_ID');
          QueryWork.Parambyname('PSORT_ID').asinteger:=Doc_PSORT.tag;
          QueryWork.Open;
          while not QueryWork.eof do begin
                CanInsert:=True;
                MemPSORTS.Append;
                MemPSORTS.Fieldbyname('PSORTS_ID').asinteger:=QueryWork.Fieldbyname('PSORTS_ID').asinteger;
                MemPSORTS.Fieldbyname('TW_ID').asinteger:=QueryWork.Fieldbyname('TW_ID').asinteger;
                MemPSORTS.Fieldbyname('TW_COLOR1').asinteger:=QueryWork.Fieldbyname('TW_COLOR1').asinteger;
                MemPSORTS.Fieldbyname('TW_ART1').asinteger:=QueryWork.Fieldbyname('TW_ART1').asinteger;
                MemPSORTS.Fieldbyname('TW_NAM1').asstring:=QueryWork.Fieldbyname('TW_NAM1').asstring;
                MemPSORTS.Fieldbyname('ED_SHORT1').asstring:=QueryWork.Fieldbyname('ED_SHORT1').asstring;
                MemPSORTS.Fieldbyname('TW_ID2').asinteger:=QueryWork.Fieldbyname('TW_ID2').asinteger;
                MemPSORTS.Fieldbyname('TW_COLOR2').asinteger:=QueryWork.Fieldbyname('TW_COLOR2').asinteger;
                MemPSORTS.Fieldbyname('TW_ART2').asinteger:=QueryWork.Fieldbyname('TW_ART2').asinteger;
                MemPSORTS.Fieldbyname('TW_NAM2').asstring:=QueryWork.Fieldbyname('TW_NAM2').asstring;
                MemPSORTS.Fieldbyname('ED_SHORT2').asstring:=QueryWork.Fieldbyname('ED_SHORT2').asstring;
                MemPSORTS.Fieldbyname('TW_KOL').asfloat:=QueryWork.Fieldbyname('TW_KOL').asfloat;
                MemPSORTS.Fieldbyname('TW_KOL2').asfloat:=QueryWork.Fieldbyname('TW_KOL2').asfloat;
                MemPSORTS.fieldByname('TW_OST').asfloat:=QueryWork.Fieldbyname('TW_OST').asfloat;;
                MemPSORTS.Post;
                CanInsert:=False;
                QueryWOrk.next;
          end;
          MemPSORTS.first;
   end;
   Show_Sost;
   CanRefreshSKL:=true;
   ToolButton21.Click;
   RxDbGrid1.setfocus;
   SAVE:=true;
end;



procedure TDOC_PSORT.FormKeyPress(Sender: TObject; var Key: Char);
var
   ID:integer;
   N:integer;
begin
     if (key='*') and (sost=0) then begin
        sost:=1;
        key:=#0;
        STR:='';
     end else
     if (key='*') and (sost<>0) then begin
        sost:=0;
        key:=#0;
        STR:='';
     end;
     if ((sost=1) or (sost=2)) and (key in ['0','1','2','3','4','5','6','7','8','9',#8,#13,#27]) then begin
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
                 WorkTransaction.Active:=False;
                 ADD_SQL(QueryWork,'select TW_ID from TW where TW_ART=:TW_ART and TW_BRAK=:TW_BRAK');
                 if B_utils.left(STR,1)='Б' then begin
                    N:=strtoint(B_Utils.right(STR,length(STR)-1));
                    QueryWork.ParamByname('TW_ART').asinteger:=N;
                    QueryWork.ParamByname('TW_BRAK').asstring:='1';
                 end else begin
                    N:=strtoint(STR);
                    QueryWork.ParamByname('TW_ART').asinteger:=N;
                    QueryWork.ParamByname('TW_BRAK').asstring:='0';
                 end;
                 QueryWork.Open;
                 if not QueryWork.eof then begin
                    ID:=QueryWork.fieldbyname('TW_ID').asinteger;
                    ADD_PSORTS(ID,-1,sost);
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

procedure TDOC_PSORT.DsPsortsDataChange(Sender: TObject; Field: TField);
begin
     if MemPSORTS.State in [dsInsert,dsEdit] then SAVE:=False;
     if (MemPSORTS.State in [dsInsert]) and ( not CanInsert) then MemPSORTS.Cancel;
end;


procedure TDOC_PSORT.ADD_PSORTS(TW_ID:integer;KOL:double;TYP:integer);
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



     if MemPSORTS.RecordCount>0 then TW_TEMP:=MemPSORTS.recno;

     begin
          SAVE:=False;
          WorkTransaction.Active:=False;
          ADD_SQL(QueryWork,'select twktg.twktg_color,tw.tw_art,tw.tw_nam,tw.ed_id,ed.ed_short, '+
          '(select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
          '(select max(kurs_date) from kurs where '+
          'tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)))) as tw_mroz '+
          'from tw,ed,twktg '+
          'where tw.ed_id=ed.ed_id and tw.tw_id=:TW_ID and tw.twktg_id=twktg.twktg_id ');
          QueryWork.Parambyname('TW_ID').asinteger:=TW_ID;
          QueryWork.Open;
          if Typ=1 then begin
            CanInsert:=True;
            MemPSORTS.Append;
            MemPSORTS.Fieldbyname('PSORTS_ID').asinteger:=-1;
            MemPSORTS.Fieldbyname('TW_ID').asinteger:=TW_ID;
            MemPSORTS.Fieldbyname('TW_ART1').asinteger:=QueryWork.Fieldbyname('TW_ART').asinteger;
            MemPSORTS.Fieldbyname('TW_COLOR1').asinteger:=QueryWork.Fieldbyname('TWKTG_COLOR').asinteger;
            MemPSORTS.Fieldbyname('TW_NAM1').asstring:=QueryWork.Fieldbyname('TW_NAM').asstring;
            MemPSORTS.Fieldbyname('ED_SHORT1').asstring:=QueryWork.Fieldbyname('ED_SHORT').asstring;
            MemPSORTS.fieldByname('TW_OST').asfloat:=GetOst(TW_ID,strtoint(SKL.value));
            MemPSORTS.Fieldbyname('TW_KOL').asfloat:=1;
            MemPSORTS.Fieldbyname('TW_KOL2').asfloat:=1;
            MemPSORTS.Post;
            CanInsert:=False;
          end;
          if Typ=2 then begin
            CanInsert:=True;
            MemPSORTS.Edit;
            MemPSORTS.Fieldbyname('TW_ID2').asinteger:=TW_ID;
            MemPSORTS.Fieldbyname('TW_ART2').asinteger:=QueryWork.Fieldbyname('TW_ART').asinteger;
            MemPSORTS.Fieldbyname('TW_COLOR2').asinteger:=QueryWork.Fieldbyname('TWKTG_COLOR').asinteger;
            MemPSORTS.Fieldbyname('TW_NAM2').asstring:=QueryWork.Fieldbyname('TW_NAM').asstring;
            MemPSORTS.Fieldbyname('ED_SHORT2').asstring:=QueryWork.Fieldbyname('ED_SHORT').asstring;
            if KOL<0 then begin
               Application.createForm(TSET_KOLVO,SET_KOLVO);
               SET_KOLVO.NAME.text:=QueryWork.fieldByname('TW_ART').asstring+
                              QueryWork.fieldByname('TW_NAM').asstring;
               SET_KOLVO.showModal;
               if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
               MemPSORTS.Fieldbyname('TW_KOL').asfloat:=SET_KOLVO.KOL.value;
               MemPSORTS.Fieldbyname('TW_KOL2').asfloat:=SET_KOLVO.KOL.value;
               SET_KOLVO.destroy;
            end else MemPSORTS.Fieldbyname('TW_KOL').asfloat:=KOL;
            MemPSORTS.Post;
            CanInsert:=False;
          end;
          if sost=1 then sost:=2
          else if sost=2 then sost:=1;
     end;
     show_sost;
     QueryWork.Close;
     RxDbGrid1.setfocus;
end;


procedure TDOC_PSORT.ActLockExecute(Sender: TObject);
begin
    My_lock;
end;

procedure TDOC_PSORT.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом ненулевой остаток}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if (ansiuppercase(Field.FieldName)='TW_ART1')
        and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR1').asinteger>=0)
        then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR1').asinteger;
     if (ansiuppercase(Field.FieldName)='TW_ART2')
        and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR2').asinteger>=0)
        then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR2').asinteger;
     if ansiuppercase(Field.Fieldname)='TW_OST' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_OST').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR1>0) then Background:=OST_COLOR1;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_OST').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR2>0) then Background:=OST_COLOR2;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_OST').Asfloat<0)
           and (OST_COLOR3>0) then Background:=OST_COLOR3;
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_OST').Asfloat=0)
           and (OST_COLOR4>0) then Background:=OST_COLOR4;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if (ansiuppercase(Field.FieldName)='TW_ART1')
         and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR1').asinteger>=0)
         then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR1').asinteger;
        if (ansiuppercase(Field.FieldName)='TW_ART2')
         and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR2').asinteger>=0)
         then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR2').asinteger;
        if ansiuppercase(Field.Fieldname)='TW_OST' then begin
           if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_OST').Asfloat>=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR1>0) then Afont.color:=OST_COLOR1;
           if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_OST').Asfloat<
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
           and (OST_COLOR2>0) then Afont.color:=OST_COLOR2;
           if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_OST').Asfloat<0)
           and (OST_COLOR3>0) then Afont.color:=OST_COLOR3;
           if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_OST').Asfloat=0)
           and (OST_COLOR4>0) then Afont.color:=OST_COLOR4;
        end
     end;
end;

procedure TDOC_PSORT.SKLChange(Sender: TObject);
var prev_skl_frm: integer;
begin
  save:=false;
  ActRefreshExecute(nil);
  show_sost;
end;


procedure TDOC_PSORT.ActRefreshExecute(Sender: TObject);
var
   a,ID:integer;
   Summ:Double;
   s:ansistring;
begin
     s:=Doc_PSORT.caption;
     Doc_PSORT.caption:=Doc_PSORT.caption+'. Чтение остатков товаров';
     if MemPSORTS.RecordCount>0 then begin
         ID:=MemPSORTS.RecNo;
         MemPSORTS.DisableControls;
         MemPSORTS.First;
         while not MemPSORTS.eof do begin
               MemPSORTS.Edit;
               MemPSORTS.fieldByname('TW_OST').asfloat:=GetOst(MemPSORTS.fieldByname('TW_ID').asinteger,strtoint(SKL.value), strtoint(FRM.value));
               MemPSORTS.Post;
               MemPSORTS.next;
         end;
         MemPSORTS.First;
         for a:=1 to ID-1 do MemPSORTS.next;
         MemPSORTS.EnableControls;
     end;
     Doc_PSORT.caption:=s;
end;

procedure TDOC_PSORT.ActDetalExecute(Sender: TObject);
var
  a,tw_id:integer;
begin
   tw_id:=0;
   if RxDbGrid1.Col in [1,2,3] then tw_id:=MemPSORTS.Fieldbyname('TW_ID').asinteger;
   if RxDbGrid1.Col in [4,5,6] then tw_id:=MemPSORTS.Fieldbyname('TW_ID2').asinteger;
   if tw_id>0 then begin
       show_detal_tw(TW_ID);
   end;
end;

procedure TDOC_PSORT.ActAnalizExecute(Sender: TObject);
var
  a,tw_id:integer;
begin
   tw_id:=0;
   if RxDbGrid1.Col in [1,2,3] then tw_id:=MemPSORTS.Fieldbyname('TW_ID').asinteger;
   if RxDbGrid1.Col in [4,5,6] then tw_id:=MemPSORTS.Fieldbyname('TW_ID2').asinteger;
   if tw_id>0 then begin
     show_analiz_tw(TW_ID);
   end;
end;

procedure TDOC_PSORT.ActMarketExecute(Sender: TObject);
var
  a,tw_id:integer;
begin
   tw_id:=0;
   if RxDbGrid1.Col in [1,2,3] then tw_id:=MemPSORTS.Fieldbyname('TW_ID').asinteger;
   if RxDbGrid1.Col in [4,5,6] then tw_id:=MemPSORTS.Fieldbyname('TW_ID2').asinteger;
   if tw_id>0 then begin
     SHOW_MARKETING_TW(TW_ID);
   end;
end;

procedure TDOC_PSORT.ActPrintCennExecute(Sender: TObject);
var
  a,tw_id:integer;
begin
   tw_id:=0;
   if RxDbGrid1.Col in [1,2,3] then tw_id:=MemPSORTS.Fieldbyname('TW_ID').asinteger;
   if RxDbGrid1.Col in [4,5,6] then tw_id:=MemPSORTS.Fieldbyname('TW_ID2').asinteger;
   if tw_id>0 then begin
     CLEAR_CENNIK;
     ADD_CENNIK(TW_ID,strtoint(skl.value));
     PRINT_CENNIK;
   end;
end;

procedure TDOC_PSORT.ActPrintCennAllExecute(Sender: TObject);
var
   a,ID:integer;
begin
     CLEAR_CENNIK;
     if MemPSORTS.RecordCount>0 then begin
         ID:=MemPSORTS.RecNo;
         MemPSORTS.DisableControls;
         MemPSORTS.First;
         while not MemPSORTS.eof do begin
               ADD_CENNIK(MemPSORTS.fieldbyname('TW_ID').asinteger,strtoint(skl.value));
               ADD_CENNIK(MemPSORTS.fieldbyname('TW_ID2').asinteger,strtoint(skl.value));
               MemPSORTS.next;
         end;
         MemPSORTS.First;
         for a:=1 to ID-1 do MemPSORTS.next;
         MemPSORTS.EnableControls;
         PRINT_CENNIK;
     end;
end;

procedure TDOC_PSORT.ActApplyExecute(Sender: TObject);
var
   A,PSORT_ID,ID,OLDID:integer;
   r,IDR:double;
   CAN:boolean;
begin
  if (MemPsorts.State in [dsInsert,DsEdit]) then MemPsorts.Post;

  if FRM.value='' then
  begin
    messbox('Не указана фирма', messError, 0);
    Exit;
  end;

  if skl.value='' then
  begin
    messbox('Не указан склад', messError, 0);
    Exit;
  end;


  CAN:=True;
  if CAN then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     OLDID:=MemPSORTS.recno;
     Try
        if not PSORT_PROW then begin
          IBSAVE_CLEAR;
          if PSORT_NUMS<0 then PSORT_NUMS:=NEW_PSORT_NUM(strtoint('0'+FRM.Value), PSORT_DATE.date);
          IBSAVE_ADD('FRM_ID',strtoint(FRM.value));
          IBSAVE_ADD('PSORT_NUM',PSORT_NUMS);
          IBSAVE_ADD('PSORT_DATE',strtodatetime(datetostr(PSORT_DATE.date)+' '+timetostr(time())));
          IBSAVE_ADD('SKL_ID',strtoint(skl.value));


          IBSAVE_ADD('MEN_ID',strtoint(PSORT_MEN.value));
          IBSAVE_ADD('SHOP_ID',SHOP_ID);
          IBSAVE_ADD('PSORT_PROW','0');
          IBSAVE_ADD('PSORT_OSN',Memotostr(PSORT_OSN.lines));
          IBSAVE_ADD('US_ID',USERID);
          PSORT_ID:=IBSAVE_DOC('PSORT',DOC_PSORT.tag);
        end else PSORT_ID:=DOC_PSORT.tag;
        if PSORT_ID<=0 then IDR:=SQRT(-1)
          else begin
             {Сохраняем содержимое}
             {Сначала удаляем удалённое}
             for A:=1 to CNT_DEL do begin
                 if PSORTS_DEL[A]>0 then if not IBDELETE_DOC('PSORTS',PSORTS_DEL[A]) then IDR:=SQRT(-1);
             end;
             {Сохраняем имеющееся}
             MemPSORTS.DisableControls;
             MemPSORTS.First;
             while not MemPSORTS.eof do begin
                   IBSAVE_CLEAR;
                   IBSAVE_ADD('PSORT_ID',PSORT_ID);
                   IBSAVE_ADD('TW_ID',MemPSORTS.fieldbyname('TW_ID').asinteger);
                   IBSAVE_ADD('TW_ID2',MemPSORTS.fieldbyname('TW_ID2').asinteger);
                   IBSAVE_ADD('TW_KOL',MemPSORTS.fieldbyname('TW_KOL').asfloat);
                   IBSAVE_ADD('TW_KOL2',MemPSORTS.fieldbyname('TW_KOL2').asfloat);                   
                   ID:=IBSAVE_DOC('PSORTS',MemPSORTS.fieldbyname('PSORTS_ID').asinteger);
                   if ID<0 then IDR:=SQRT(-1) else begin
                      if (DOC_PSORT.tag>0) and (MemPSORTS.fieldbyname('PSORTS_ID').asinteger<0) then begin
                          // Фиксируем факт добавления товаров
                          IBSAVE_CLEAR;
                          IBSAVE_ADD('DOC','PSORT');
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          IBSAVE_ADD('MESS','Добавлен списываемый товар: '+MemPSORTS.Fieldbyname('TW_ART1').asstring+' '+
                          MemPSORTS.Fieldbyname('TW_NAM1').asstring);
                          IBSAVE_ADD('DOP1',2);
                          IBSAVE_ADD('DOP2',PSORT_ID);
                          if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                          IBSAVE_CLEAR;
                          IBSAVE_ADD('DOC','PSORT');
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          IBSAVE_ADD('MESS','Добавлен приходуемый товар: '+MemPSORTS.Fieldbyname('TW_ART2').asstring+' '+
                          MemPSORTS.Fieldbyname('TW_NAM2').asstring+' '+floattostrf(MemPSORTS.Fieldbyname('TW_KOL').asfloat,fffixed,19,4)+' '+
                          MemPSORTS.Fieldbyname('ED_SHORT2').asstring);
                          IBSAVE_ADD('DOP1',2);
                          IBSAVE_ADD('DOP2',PSORT_ID);
                          if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                      end;
                      MemPSORTS.Edit;
                      MemPSORTS.fieldbyname('PSORTS_ID').asinteger:=ID;
                      MemPSORTS.Post;
                   end;
                   MemPSORTS.next;
             end;
        end;
        {Всё прошло нормально - изменяем временные данные}
        {Отображаем номер}
        Doc_PSORT.tag:=PSORT_ID;
        PSORT_NUM.text:=inttostr(PSORT_NUMS);
        MemPSORTS.First;
        for a:=1 to OLDID-1 do MemPSORTS.next;
        SAVE:=TRUE;
        CNT_DEL:=0;
        MemPSORTS.EnableControls;
        Datamodule1.IBTransaction2.Commit;
     Except
      on e: exception
      do begin
        Messbox('Ошибка при сохранении Акта Пересортицы!'+chr(10)+e.message,MessSystem,48);
        Datamodule1.IBTransaction2.Rollback;
        end;
     End;
     Datamodule1.IBTransaction2.Active:=False;
  end;
end;
//42003

procedure TDOC_PSORT.ActSaveExecute(Sender: TObject);
begin
     SAVE:=false;
     ActApply.Execute;
     if SAVE then begin
        if not PSORT_PROW then ActProw.Execute;
        Close;
     end;

end;

procedure TDOC_PSORT.ActProwExecute(Sender: TObject);
begin
     SAVE:=False;
     if Not Save and ActApply.enabled then ActApply.Execute;
     if (SAVE) then begin
        if PROV_PSORT(Doc_PSORT.tag,'') then begin
                PSORT_PROW:=True;
                Show_Sost;
                ActRefresh.Execute;
                SAVE:=True;
        end;
     end;

end;

procedure TDOC_PSORT.ActDelExecute(Sender: TObject);
var
  PSORT_NUM_FULL:ansistring;
begin
     if Messbox('Удалить из акта выделенную строку с товарами?',MessSubmitDelete,4+48+256)=6 then begin
        SAVE:=False;
        if MemPSORTS.Fieldbyname('PSORTS_ID').asinteger>0 then begin
          WorkTransaction.Active:=False;
          ADD_SQL(QueryWork,'select KLN.KLN_PREFIX,SHOP.SHOP_PREFIX,SHOP.SHOP_POSTFIX, '+
          'PSORT.PSORT_NUM from PSORT,SHOP,KLN where PSORT.PSORT_ID=:PSORT_ID '+
          'and PSORT.FRM_ID=KLN.KLN_ID  '+
          'and PSORT.SHOP_ID=SHOP.SHOP_ID ');
          QueryWork.paramByname('PSORT_ID').asinteger:=DOC_PSORT.tag;
          QueryWork.open;
          if not QueryWork.eof then
            PSORT_NUM_FULL:=QueryWork.fieldByname('KLN_PREFIX').asstring+' '+
            QueryWork.fieldByname('SHOP_PREFIX').asstring+'ПС'+
            b_utils.right('0000000000'+QueryWork.fieldByname('PSORT_NUM').asstring,10)+QueryWork.fieldByname('SHOP_POSTFIX').asstring;
          inc(CNT_DEL);
          PSORTS_DEL[CNT_DEL]:=MemPSORTS.Fieldbyname('PSORTS_ID').asinteger;
        end;
        MemPSORTS.delete;
        Show_Sost;
     end;
end;

procedure TDOC_PSORT.ActUnProwExecute(Sender: TObject);
begin
     if UNPROV_PSORT(Doc_PSORT.tag,'') then begin
                ActRefresh.execute;
                PSORT_PROW:=False;
                Show_Sost;
                SAVE:=True;
     end;
end;

procedure TDOC_PSORT.ActPrintExecute(Sender: TObject);
begin
   // Печать
     if Not Save then
        if ActApply.enabled then if Messbox('Документ был изменен! Сохранить изменения?',MessSubmit,4+48)=6 then ActApply.execute;
        {Печатаем}
        PRINT_PSORT(Doc_PSORT.tag);
end;

procedure TDOC_PSORT.PSORT_DATEChange(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TDOC_PSORT.PSORT_OSNChange(Sender: TObject);
begin
     SAVE:=FALSE;
end;

procedure TDOC_PSORT.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (not Save) and (ActApply.enabled) then begin
        if Messbox('Акт был изменён! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TDOC_PSORT.ActHistoryExecute(Sender: TObject);
begin
    {Отображаем "историю" акта пересортицы}
    SHOW_HISTORY_DOC('Акт пересортицы № '+PSORT_NUM.text,'PSORT',DOC_PSORT.tag);
end;

procedure TDOC_PSORT.MemPsortstw_kolChange(Sender: TField);
var
  val:double;
begin
   SAVE:=FALSE;
   val:=MemPSORTS.fieldByname('TW_KOL').asfloat;
   if val<=0 then begin
     MemPSORTS.fieldByname('TW_KOL').asfloat:=1;
     messbox('Количество товара не может быть нулевой или отрицательной величиной! '+CR+
     'Количеcтво с '+floattostrf(val,fffixed,19,4)+' изменено на 1.000!',MessError,16);
   end;
end;

procedure TDOC_PSORT.BtnSetOstClick(Sender: TObject);
begin
    MemPsorts.edit;
    MemPsorts.FieldByName('TW_KOL').asfloat:=
      MemPsorts.fieldByname('TW_OST').asfloat;
    MemPsorts.Post;
end;

procedure TDOC_PSORT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IS_EDIT_PSORT:=false;
end;

procedure TDOC_PSORT.FRMChange(Sender: TObject);
begin
  save:=false;
  ActRefreshExecute(nil);
  show_sost;
end;

end.
