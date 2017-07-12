unit DocZTrindef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ToolWin, ComCtrls, Grids, DBGrids, RXDBCtrl,Data1,b_utils,b_Dbutils,
  VclUtils, ActnList, StdCtrls, Mask, ToolEdit, Db, RxLookup, RxMemDS,
  IBDatabase, IBCustomDataSet, IBQuery,WaitForm, Placemnt, RXSplit, ImgList,
  RXSpin, RXCtrls, Buttons, CurrEdit, FR_Class, FR_DSet, FR_DBSet;

type
  TDOC_ZTRINDEF = class(TForm)
    ActionList1: TActionList;
    ActSave: TAction;
    ActApply: TAction;
    DicTW: TAction;
    ActDetal: TAction;
    ActAnaliz: TAction;
    ActMarketing: TAction;
    ActLock: TAction;
    ActDel: TAction;
    ActPrint: TAction;
    ActHistory: TAction;
    ActRefresh: TAction;
    ActOk: TAction;
    ToolBar1: TToolBar;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    zakryt: TToolButton;
    ToolButton14: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton11: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    USER: TEdit;
    TRINDEF_NUM: TEdit;
    TRINDEF_DATE: TDateEdit;
    TRINDEF_OSN: TMemo;
    TRINDEF_SHOP: TRxDBLookupCombo;
    TRINDEF_SKL: TRxDBLookupCombo;
    Label3: TLabel;
    Label7: TLabel;
    RxDBGrid1: TRxDBGrid;
    DsStat: TDataSource;
    MemStat: TRxMemoryData;
    MemStatSTAT_ID: TIntegerField;
    MemStatSTAT_NAME: TStringField;
    ImageList1: TImageList;
    DsTRINDEFS: TDataSource;
    DsTRINDEF: TDataSource;
    IBQuery: TIBQuery;
    QueryTransaction: TIBTransaction;
    StatusBar1: TStatusBar;
    MemZTrindefs: TRxMemoryData;
    QueryWork: TIBQuery;
    WorkTransaction: TIBTransaction;
    MemZTrindefsTRINDEFS_ID: TIntegerField;
    MemZTrindefsTW_ID: TIntegerField;
    MemZTrindefsMON_GOOD: TIntegerField;
    MemZTrindefsOLD_MON_BAD: TIntegerField;
    MemZTrindefsZAK_MON: TIntegerField;
    MemZTrindefsCOMENT: TIBStringField;
    MemZTrindefsTW_ART: TIntegerField;
    MemZTrindefsTW_NAM: TStringField;
    MemZTrindefsTW_KOL: TIntegerField;
    MemZTrindefsmet: TIntegerField;
    MemZTrindefsED_SHORT: TStringField;
    MemZTrindefstwktg_color: TIntegerField;
    MemZTrindefsTW_BAD: TFloatField;
    MemZTrindefsNEW_MON_BAD: TFloatField;
    MemZTrindefsUTV_MON_BAD: TFloatField;
    stat_list: TRxCheckListBox;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    trindef_stats: TMemo;
    Edit1: TEdit;
    trindef_type: TComboBox;
    MemZTrindefstw_ost: TFloatField;
    tw_nam: TEdit;
    BtnTW: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    PSORT_TW_PRICE: TRxCalcEdit;
    Label11: TLabel;
    MemZTrindefstw_id2: TIntegerField;
    MemZTrindefstw_art2: TIntegerField;
    MemZTrindefstw_nam2: TStringField;
    MemZTrindefsed_short2: TStringField;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    print_query: TIBQuery;
    print_queryTRINDEF_NUM: TIntegerField;
    print_queryTRINDEF_DT: TDateTimeField;
    print_queryCOMMENT: TIBStringField;
    print_queryTRINDEF_TW_NAM: TIBStringField;
    print_queryTRINDEF_TYPE_STR: TIBStringField;
    print_queryUSERS_COMMENT: TStringField;
    MemZTrindefszak_brak: TFloatField;
    Label12: TLabel;
    MEN_ID: TRxDBLookupCombo;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    MemZTrindefskropt_price: TFloatField;
    MemZTrindefsspec_price: TFloatField;
    MemZTrindefstw2_mon_good: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DicTWExecute(Sender: TObject);
    procedure ADD_ZTRINDEFS(TW_ID: integer;TW_KOL:double;typ: integer=1);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure ActApplyExecute(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure MemZTrindefsAfterEdit(DataSet: TDataSet);
    procedure ActDetalExecute(Sender: TObject);
    procedure ActOkExecute(Sender: TObject);
    procedure DsTRINDEFSDataChange(Sender: TObject; Field: TField);
    procedure ActAnalizExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);//    procedure ToolButton4Click(Sender: TObject);
    procedure Show_sost;
    procedure stat_listClick(Sender: TObject);
    procedure trindef_statsChange(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure stat_listStateChange(Sender: TObject; Index: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure trindef_typeChange(Sender: TObject);
    procedure TRINDEF_SKLChange(Sender: TObject);
    procedure TRINDEF_OSNChange(Sender: TObject);
    procedure TRINDEF_DATEChange(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure BtnTWClick(Sender: TObject);
    procedure UPDATE_MONEY_INFO;
    procedure MemZTrindefsTW_BADChange(Sender: TField);
    procedure MemZTrindefsNEW_MON_BADChange(Sender: TField);
    procedure PSORT_TW_PRICEChange(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure ActPrintExecute(Sender: TObject);
    procedure ActHistoryExecute(Sender: TObject);
    procedure stat_listClickCheck(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
  private
    { Private declarations }
    trindeF_title, trindeF_comment, trindeF_comments: string;
  public
    { Public declarations }
  end;

var
  Can_Utw:boolean;
  PREV_STAT:integer;
  CanRefresh:boolean;
  SAVE:boolean;
  CanInsert:boolean;
  CanInsertDop:boolean;
  DOC_ZTRINDEF: TDOC_ZTRINDEF;
  TRINDEF_NUMS:integer;
  USER_ID:integer;
  Sost:integer=0;
  STR:ansistring='';
  TRINDEFS_DEL:array[1..10000] of integer;
  TRINDEFS_DEL_MESS:array[1..10000] of string;
  CNT_DEL:integer=0;
  SHOP_ID:integer;
  SKL_ID:integer;
  ZSTAT:integer;

  stat_comment: array[1.. 6] of string;

  TRINDEF_RESULT: double;

  RES_CREATED: integer;




implementation

uses Mainform, DicTowar, DicTwDynGroup, SetKolvo;

{$R *.DFM}

procedure TDOC_ZTRINDEF.FormShow(Sender: TObject);
var s: string;
n1, n2: integer;
i: integer;
b: boolean;
stt: string;
begin
    sost:=0;
    Can_Utw:=Check_Dostup('$JOU.ZTRINDEF.UTW');
    Top:=Main_Form.Top+22;
    Left:=Screen.DesktopLeft;
    Width:=Screen.Width;
    Height:=Screen.DesktopHeight-Main_Form.Top-22-28;
    CanRefresh:=true;
    CanInsert:=false;
    MemZTrindefs.EmptyTable;

    //заполнить статусы в соответствии с допусками

    queryWork.SQL.Text:='SELECT cfg_id,  cfg_set2, cfg_value, '+
    'case when exists (select * from cfg c2 where c2.cfg_name=''$JOU.ZTRINDEF.USER_DOSTUP'' and c2.cfg_set2 = c0.cfg_set2 and c2.cfg_set1=:user_id) '+
    'then 1 else 0 end dostup FROM CFG c0 where CFG_NAME=:cfg_name order by cfg_set2 desc';
    queryWork.ParamByName('CFG_NAME').asstring:='TRINDEF_STAT';
    queryWork.ParamByName('USER_ID').asinteger:=USERID;
    queryWork.Open;
    stat_list.Items.Clear;
    while not queryWork.Eof do
    begin
      stat_list.Items.Insert(0,queryWork.fieldbyname('cfg_value').asString);
      stat_list.EnabledItem[0]:=(queryWork.fieldbyname('dostup').asInteger=1);
      if stat_list.EnabledItem[0] then
      begin

        stat_list.ItemIndex:=0;
        stat_listClick(nil);
      end;




      queryWork.next;
    end;


    {queryWork.SQL.Text:='SELECT * FROM CFG where CFG_NAME=''TRINDEF_STAT'' order by cfg_set2 desc';
    queryWork.Open;

    while not queryWork.Eof do
    begin

      if ((CHECK_DOSTUP('$JOU.ZTRINDEF.'+queryWork.fieldByName('cfg_set1').asString)) or (stat_list.Items.Count> 0)) then
      begin


      stat_list.Items.Insert(0, queryWork.fieldByName('cfg_Value').asString);

      stat_list.EnabledItem[0]:=CHECK_DOSTUP('$JOU.ZTRINDEF.'+queryWork.fieldByName('cfg_set1').asString);

      if stat_list.EnabledItem[0] then
      begin
        stat_list.ItemIndex:=0;
        stat_listClick(nil);
      end
//        stat_list.Selected[0]:=true;

      end;

      queryWork.next;
    end;
    querywork.Close;

    }


    if tag<0 then begin
      // Новый документ

      PREV_STAT:=1; // Предудущее состояние - в работе
      SHOP_ID:=SHOPID;
      SAVE:=true;
      TRINDEF_NUMS:=-1;
      TRINDEF_NUM.text:='Новый';
      TRINDEF_DATE.date:=date();

      Edit1.Text:='000000';

    MemStat.EmptyTable;
    MemStat.append;
    MemStat.fieldByname('STAT_ID').asinteger:=1;
    MemStat.fieldByname('STAT_NAME').asstring:='Новая (в работе)';
    MemStat.append;
    MemStat.fieldByname('STAT_ID').asinteger:=2;
    MemStat.fieldByname('STAT_NAME').asstring:='Готова к утверждению';
{    if CHECK_DOSTUP('$JOU.ZTRINDEF.UTW') then
    begin
      MemStat.append;
      MemStat.fieldByname('STAT_ID').asinteger:=3;
      MemStat.fieldByname('STAT_NAME').asstring:='Закрыта';
    end;  }
    MemStat.Post;
{
    RxDBGrid1.Columns[5].ReadOnly:=false;
    RxDBGrid1.Columns[8].ReadOnly:=false;
    RxDBGrid1.Columns[9].ReadOnly:=true;
    RxDBGrid1.Columns[11].ReadOnly:=false;
    }
      // Заполняем ZTRINDEF_STAT


      USER.text:=USERFIO;
      USER_ID:=USERID;
      TRINDEF_OSN.text:='';
      sost:=0;
      TRINDEF_SHOP.value:=inttostr(SHOPID);

      for i:=listbox1.Items.Count  to  stat_list.items.Count-1 do
        listbox1.Items.Add('');
    end
    else
    begin
      Save:=true;
      CanRefresh:=False;
      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select trindef.*,(select kln_full from kln_data(trindef.us_id)) as us_full, (select tw_art||" "||tW_nam from tw where tw_id=trindef.psort_tw_id) as psort_tw_nam from trindef where trindef_id=:ID');
      QueryWork.paramByname('ID').asinteger:=tag;
      QueryWork.Open;

              RES_CREATED:=QueryWork.fieldByname('RES_CREATED').asinteger;

      SKL_ID:=QueryWork.fieldByname('SKL_ID').asinteger;
      TRINDEF_NUMS:=QueryWork.fieldByname('trindef_num').asinteger;
      TRINDEF_NUM.text:=b_utils.right('0000000000'+QueryWork.fieldByname('trindef_num').asstring,10);
      TRINDEF_DATE.date:=QueryWork.fieldByname('trindef_DATE').asdatetime;


      TRINDEF_SHOP.Value:=QueryWork.fieldByname('trindef_shop').asstring;
      MEN_ID.Value:=QueryWork.fieldByname('MEN_ID').asstring;
      TRINDEF_SKL.Value:=QueryWork.fieldByname('skl_id').asstring;
      USER_ID:=QueryWork.fieldByname('US_ID').asinteger;
      USER.text:=QueryWork.fieldByname('US_FULL').asstring;
      trindef_OSN.text:=QueryWork.fieldByname('trindef_osn').asstring;

      tw_nam.Tag:=QueryWork.fieldByname('PSORT_TW_ID').asinteger;
      tw_nam.text:=QueryWork.fieldByname('psort_tw_nam').asstring;

      PSORT_TW_PRICE.value:=QueryWork.fieldByname('PSORT_TW_PRICE').asFloat;



      if QueryWork.fieldByname('trindef_type').asstring<>'' then
        trindef_type.ItemIndex:=StrToInt(QueryWork.fieldByname('trindef_type').asstring);

      Edit1.Text:=QueryWork.fieldByname('trindef_stats').asstring;

      s:=QueryWork.fieldByname('trindef_comments').asstring;
      s:=stringreplace(s, #13#10, ' ', [rfReplaceall]);
      s:=stringreplace(s, #27, #13#10, [rfReplaceall]);

      listbox1.Items.Text:=s;

      for i := 0 to listbox1.items.count-1 do
      begin
          {можно 1 или 2}
          b:=(copy(listbox1.items[i], 1, 1) ='1');
//          if b = false then
//            b:=(copy(listbox1.items[i], 1, 1) ='2');


          listbox1.items[i]:=copy(listbox1.items[i], 2, length(listbox1.items[i]));

          stat_list.Checked[i]:=b;

      end;

      for i:=listbox1.Items.Count  to  stat_list.items.Count-1 do
        listbox1.Items.Add('');









      WorkTransaction.Active:=False;
{      ADD_SQL(QueryWork,'select trindefs.trindefs_id,trindefs.tw_id, tw.tw_art, tw.tw_nam, ed.ed_short, (select money from tw_price_frm(trindefs.tw_id,0,0,0)) as mon_good,'+
         '(select ost from  ost_now_all(trindefs.tw_id)) as tw_ost, twktg.twktg_color,'+
         '(select tw_price_frm.money from tw_price_frm((select tw_id from tw where tw_art = (select tw_art from tw where tw_id=trindefs.tw_id) and  tw_brak=1),0,0,0)) as OLD_MON_BAD,'+
         '(select tw_price_frm.money from tw_price_frm(trindefs.tw_id,5,0,0)) as zak_mon,'+
         'trindefs.tw_bad,trindefs.new_mon_bad,trindefs.utv_mon_bad,trindefs.comment '+
         'from trindefs,tw, ed,twktg '+
         'where trindefs.trindef_id=:ID and tw.tw_id=trindefs.tw_id and ed.ed_id=tw.ed_id and tw.twktg_id=twktg.twktg_id');
}

      ADD_SQL(QueryWork,'SELECT * FROM LIST_ZTRINDEFS(:ID)');
      QueryWork.paramByname('ID').asinteger:=tag;
      QueryWork.Open;
      while not QueryWork.eof do begin
        CanInsert:=true;
        MemZTrindefs.append;
        MemZTrindefs.fieldByname('trindefs_id').asinteger:=QueryWork.fieldByname('trindefs_id').asinteger;
        MemZTrindefs.fieldByname('met').asinteger:=0; // изначально - в работе
        MemZTrindefs.fieldByname('tw_id').asinteger:=QueryWork.fieldByname('tw_id').asinteger;
        MemZTrindefs.fieldByname('tw_art').asinteger:=QueryWork.fieldByname('tw_art').asinteger;
        MemZTrindefs.fieldByname('tw_ost').asinteger:=QueryWork.fieldByname('tw_ost').asinteger;

        MemZTrindefs.fieldByname('tw_id2').asinteger:=QueryWork.fieldByname('tw_id2').asinteger;
        MemZTrindefs.fieldByname('tw_art2').asinteger:=QueryWork.fieldByname('tw_art2').asinteger;
        MemZTrindefs.fieldByname('ed_short2').asstring:=QueryWork.fieldByname('ed_short2').asstring;
        MemZTrindefs.fieldByname('tw_nam2').asstring:=QueryWork.fieldByname('tw_nam2').asstring;
        MemZTrindefs.fieldByname('TW2_MON_GOOD').asfloat:=QueryWork.fieldByname('TW2_MON_GOOD').asfloat;


        MemZTrindefs.fieldByname('tw_bad').asfloat:=QueryWork.fieldByname('tw_bad').asfloat;
        MemZTrindefs.fieldByname('tw_nam').asstring:=QueryWork.fieldByname('tw_nam').asstring;
        MemZTrindefs.fieldByname('ed_short').asstring:=QueryWork.fieldByname('ed_short').asstring;
        MemZTrindefs.fieldByname('twktg_color').asinteger:=QueryWork.fieldByname('twktg_color').asinteger;
        MemZTrindefs.fieldByname('comment').asstring:=QueryWork.fieldByname('comment').asstring;
        MemZTrindefs.fieldByname('mon_good').asfloat:=QueryWork.fieldByname('mon_good').asfloat;
        MemZTrindefs.fieldByname('kropt_price').asfloat:=QueryWork.fieldByname('kropt_price').asfloat;
        MemZTrindefs.fieldByname('spec_price').asfloat:=QueryWork.fieldByname('spec_price').asfloat;


        MemZTrindefs.fieldByname('old_mon_bad').asfloat:=QueryWork.fieldByname('old_mon_bad').asfloat;

        MemZTrindefs.fieldByname('new_mon_bad').asfloat:=QueryWork.fieldByname('new_mon_bad').asfloat;
        MemZTrindefs.fieldByname('zak_brak').asfloat:=QueryWork.fieldByname('zak_brak').asfloat;
        MemZTrindefs.fieldByname('utv_mon_bad').asfloat:=QueryWork.fieldByname('utv_mon_bad').asfloat;

        MemZTrindefs.fieldByname('zak_mon').asfloat:=QueryWork.fieldByname('zak_mon').asfloat;





        MemZTrindefs.post;
        CanInsert:=false;
        QueryWork.next;
      end;

      CanRefresh:=true;
      wait_form.hide;
      Statusbar1.panels[2].text:=''; delay(1);
      CanInsert:=true;

    end;

    UPDATE_MONEY_INFO;
    show_sost;
    SAVE:=true;
end;






procedure TDOC_ZTRINDEF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (not Save) and (ActApply.enabled) then begin
        if Messbox('Документ был изменён! Вы подтверждаете выход без сохранения изменений?',MessSubmit,4+48+256)=6
        then
          begin
            PREV_STAT:=1;
            CanClose:=true
          end
        else CanClose:=False;
     end;

end;

procedure TDOC_ZTRINDEF.DicTWExecute(Sender: TObject);
var
   a:integer;
begin
     DicTowarSet:=1; //Ввод товаров из каталога товаров
     CNT_TW:=0;
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
        for a:=1 to CNT_TW do begin
            ADD_ZTRINDEFS(ARR_TW[a].ID,ARR_TW[a].Kol);
        end;
     end;

      UPDATE_MONEY_INFO;
{     Refresh_summ;
     Show_sost;
}
end;

procedure TDOC_ZTRINDEF.ADD_ZTRINDEFS(TW_ID:integer; TW_KOL:double; typ: integer);
var
   TW_STR:ansistring;
   ISS:boolean;
   MSHOP:integer;
   MSKID:double;
   NEW_MROZ:double;
   fq: FastQuery;

begin
   // добавляем товар
   //Проверяем, нет ли в счёте уже такого товара

   if edit1.Text<>'000000' then
    exit;


   ISS:=false;
   MemZTrindefs.Disablecontrols;
   MemZTrindefs.first;
   while (not MemZTrindefs.eof) and (not ISS) do begin
         if MemZTrindefs.fieldByname('TW_ID').asinteger=TW_ID then begin
            ISS:=true;
            TW_STR:=MemZTrindefs.fieldByname('TW_ART').asstring+'-'+MemZTrindefs.fieldByname('TW_NAM').asstring;
         end;
         MemZTrindefs.next;
   end;
   MemZTrindefs.EnableControls;
   if ISS then Messbox('Документ уже содержит товар '+TW_STR+' и он не может быть добавлен!',MessSystem,48)
   else
   begin
     SAVE:=False;
     CanRefresh:=False;
     SHOW_WAIT('Запрос общих данных...',10);
     WorkTransaction.Active:=false;
     Querywork.Close;
     ADD_SQL(QueryWork,'select tw.tw_id, tw.tw_art, tw.tw_nam, ed.ed_short, tw_price_frm.money as mon_good, ost_now_all.ost  as tw_kol, twktg.twktg_color,'+
       '(select tw_price_frm.money from tw_price_frm((select tw_id from tw where tw_art = (select tw_art from tw where tw_id=:TW_ID) and  tw_brak=1),0,0, 0)) as OLD_MON_BAD,'+
       '(select tw_price_frm.money from tw_price_frm(:TW_ID,5,0, 0)) as zak_mon, '+
       '(select tw_price_frm.money from tw_price_frm(:TW_ID,2,0, 0)) as kropt_price, '+
       '(select tw_price_frm.money from tw_price_frm(:TW_ID,3,0, 0)) as spec_price '+
       'from tw_price_frm(:TW_ID,0,0, 0),tw, ed, ost_now_all(:TW_ID), twktg '+
       'where tw.tw_id=:TW_ID and ed.ed_id=tw.ed_id and tw.twktg_id=twktg.twktg_id');
     Querywork.paramByname('tw_id').asinteger:=tw_id;
     Querywork.open;

    //работе

     if typ=1 then begin
     CanInsert:=true;
     MemZTrindefs.append;
     MemZTrindefs.fieldByname('trindefs_id').asinteger:=-1;
     MemZTrindefs.fieldByname('met').asinteger:=0; // изначально - в
     MemZTrindefs.fieldByname('tw_id').asinteger:=QueryWork.fieldByname('tw_id').asinteger;
     MemZTrindefs.fieldByname('tw_art').asinteger:=QueryWork.fieldByname('tw_art').asinteger;
     MemZTrindefs.fieldByname('tw_kol').asinteger:=QueryWork.fieldByname('tw_kol').asinteger;
     MemZTrindefs.fieldByname('tw_bad').asfloat:=TW_KOL;
     MemZTrindefs.fieldByname('tw_nam').asstring:=QueryWork.fieldByname('tw_nam').asstring;
     MemZTrindefs.fieldByname('ed_short').asstring:=QueryWork.fieldByname('ed_short').asstring;
     MemZTrindefs.fieldByname('twktg_color').asinteger:=QueryWork.fieldByname('twktg_color').asinteger;
     MemZTrindefs.fieldByname('comment').asstring:='';
     MemZTrindefs.fieldByname('mon_good').asfloat:=QueryWork.fieldByname('mon_good').asfloat;
     MemZTrindefs.fieldByname('kropt_price').asfloat:=QueryWork.fieldByname('kropt_price').asfloat;
     MemZTrindefs.fieldByname('spec_price').asfloat:=QueryWork.fieldByname('spec_price').asfloat;
     MemZTrindefs.fieldByname('old_mon_bad').asfloat:=QueryWork.fieldByname('old_mon_bad').asfloat;
     MemZTrindefs.fieldByname('new_mon_bad').asfloat:=QueryWork.fieldByname('old_mon_bad').asfloat;

     MemZTrindefs.fieldByname('utv_mon_bad').asfloat:=0;
     MemZTrindefs.fieldByname('zak_mon').asfloat:=QueryWork.fieldByname('zak_mon').asfloat;
     MemZTrindefs.fieldByname('tw_ost').asfloat:=getost(tw_id,strtoint('0'+trindef_skl.value), 0);
     MemZTrindefs.Post;
     CanInsert:=False;

     end;
     if typ=2 then begin
             CanInsert:=True;
             MemZTrindefs.Edit;
             MemZTrindefs.fieldByname('tw_id2').asinteger:=QueryWork.fieldByname('tw_id').asinteger;
             MemZTrindefs.fieldByname('tw_art2').asinteger:=QueryWork.fieldByname('tw_art').asinteger;
             MemZTrindefs.fieldByname('tw_nam2').asstring:=QueryWork.fieldByname('tw_nam').asstring;
             MemZTrindefs.fieldByname('ed_short2').asstring:=QueryWork.fieldByname('ed_short').asstring;
             MemZTrindefs.fieldByname('tw2_mon_good').asfloat:=QueryWork.fieldByname('mon_good').asfloat;

             if (MemZTrindefs.fieldByname('TW_ID2').asinteger>0) then
                     MemZTrindefs.fieldByname('zak_brak').asfloat:=b_dbutils.GetTWKtgPrice( MemZTrindefs.fieldByname('TW_ID2').asinteger,5);
             MemZTrindefs.Post;
             CanInsert:=False;
     end;


     CanInsert:=True;
     MemZTrindefs.Edit;

     
     if (((trindef_type.itemIndex=4) and (typ=2) )
     or  ((trindef_type.itemIndex<>4) and (typ=1) ))then
     if TW_KOL<0 then
     begin
             Application.createForm(TSET_KOLVO,SET_KOLVO);
             SET_KOLVO.NAME.text:=QueryWork.fieldByname('TW_ART').asstring+
                            QueryWork.fieldByname('TW_NAM').asstring;
             SET_KOLVO.showModal;
             if SET_KOLVO.KOL.value<=0 then SET_KOLVO.KOL.value:=1;
             MemZTrindefs.Fieldbyname('tw_bad').asfloat:=SET_KOLVO.KOL.value;
             SET_KOLVO.destroy;
     end else MemZTrindefs.Fieldbyname('tw_bad').asfloat:=TW_KOL;




     CanRefresh:=true;
     MemZTrindefs.post;
     wait_form.hide;
     Statusbar1.panels[2].text:=''; delay(1);
     CanInsert:=false;

     if trindef_type.ItemIndex=4 then
     begin
     if sost=1 then sost:=2
      else if sost=2 then sost:=1;
     end
   end;
end;

procedure TDOC_ZTRINDEF.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     RxDbgrid1.Canvas.Font.color:=clWindowText;
     if (GdSelected in State ) then begin
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
           RxDbgrid1.Canvas.Font.color:=clHighlighttext;
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger>=0 then begin
              if Column.Field.FullName='TW_ART' then RxDbgrid1.Canvas.Font.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger;
           end;
           RxDbgrid1.Canvas.Brush.color:=clHighlight;
     end;
     RxDbgrid1.Canvas.Brush.color:=clWindow;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger>=0 then begin
           if Column.Field.FullName='TW_ART' then RxDbgrid1.Canvas.Brush.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TWKTG_COLOR').Asinteger;
     end;
     if (GdSelected in State ) then RxDbgrid1.Canvas.Brush.color:=clHighlight;
     if Column.Index>0 then
        RxDbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)
     else begin
         RxDbgrid1.Canvas.FillRect(Rect);
         ImageList1.Draw(RxDbgrid1.Canvas,((Rect.Left + Rect.Right - ImageList1.Width) div 2),
         ((Rect.Top + Rect.Bottom - ImageList1.Height) div 2),
         (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('MET').Asinteger,True);
    end;

end;

procedure TDOC_ZTRINDEF.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  RxDbgrid1.DefaultDrawDataCell(Rect, Field, State)
end;

procedure TDOC_ZTRINDEF.ActApplyExecute(Sender: TObject);
var
   A,TRINDEF_ID,ID,OLDID:integer;
   r,IDR:double;
   warnString: string;

   warnCount: integer;

   s: string;
   i: integer;


begin
     if (MemZTrindefs.State in [dsInsert,DsEdit]) then MemZTrindefs.Post;




     {Сохранение документа (Apply)}
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     OLDID:=MemZTrindefs.recno;
     Try
        IBSAVE_CLEAR;
        if TRINDEF_NUMS<0 then TRINDEF_NUMS:=NEW_TRINDEF_NUM(TRINDEF_DATE.date);
        IBSAVE_ADD('SKL_ID',strtoint(TRINDEF_SKL.Value));
        IBSAVE_ADD('TRINDEF_SHOP',strtoint(TRINDEF_SHOP.Value));
        IBSAVE_ADD('MEN_ID',strtoint('0'+MEN_ID.Value));
        IBSAVE_ADD('TRINDEF_NUM',TRINDEF_NUMS);
        IBSAVE_ADD('TRINDEF_DATE',strtodatetime(datetostr(TRINDEF_DATE.date)+' '+timetostr(time())));
        IBSAVE_ADD('US_ID',USER_ID); // записываем пользователя, который изначально создавал документ
        IBSAVE_ADD('TRINDEF_OSN',TRINDEF_OSN.text);
        IBSAVE_ADD('trindef_type',trindef_type.ItemIndex);
        IBSAVE_ADD('psort_tw_id',tw_nam.tag);
        IBSAVE_ADD('PSORT_TW_PRICE',PSORT_TW_PRICE.value);
        IBSAVE_ADD('TRINDEF_RESULT',TRINDEF_RESULT);
        IBSAVE_ADD('RES_CREATED',RES_CREATED);







        s:='';

        for i := 0 to listbox1.items.Count-1 do begin
          if stat_list.Checked[i] then  s:=s+'1'
          else s:=s+'0';



          s:=s +  listbox1.Items[i]+#27;
        end;


        IBSAVE_ADD('TRINDEF_COMMENTS', s);
        IBSAVE_ADD('TRINDEF_STATS', Edit1.text);

        TRINDEF_ID:=IBSAVE_DOC('TRINDEF',DOC_ZTRINDEF.tag);

        if TRINDEF_ID<=0 then IDR:=SQRT(-1)
        else begin
             // Фиксируем удаление товаров
             for A:=1 to CNT_DEL do begin
               IBSAVE_CLEAR;
               IBSAVE_ADD('DOC','TRINDEF');
               IBSAVE_ADD('US_ID',USERID);
               IBSAVE_ADD('SHOP_ID',SHOPID);
               IBSAVE_ADD('MESS',TRINDEFS_DEL_MESS[A]);
               IBSAVE_ADD('DOP1',4);
               IBSAVE_ADD('DOP2',TRINDEF_ID);
               if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
             end;
             //Сохраняем содержимое
             //Сначала удаляем удалённое
             for A:=1 to CNT_DEL do begin
                 if TRINDEFS_DEL[A]>0 then if not IBDELETE_DOC('TRINDEFS',TRINDEFS_DEL[A]) then IDR:=SQRT(-1);
             end;
             //Сохраняем имеющееся
             MemZTRINDEFS.DisableControls;
             MemZTRINDEFS.First;
             while not MemZTRINDEFS.eof do begin
                   IBSAVE_CLEAR;
                   IBSAVE_ADD('TRINDEF_ID',TRINDEF_ID);
                   IBSAVE_ADD('tw_id',MemZTrindefs.fieldByname('tw_id').asinteger);
                   IBSAVE_ADD('tw_bad',MemZTrindefs.fieldByname('tw_bad').asfloat);
                   IBSAVE_ADD('comment',MemZTrindefs.fieldByname('comment').asstring);
                   IBSAVE_ADD('new_mon_bad',MemZTrindefs.fieldByname('new_mon_bad').asfloat);
                   IBSAVE_ADD('zak_brak',MemZTrindefs.fieldByname('zak_brak').asfloat);                   
                   IBSAVE_ADD('utv_mon_bad',MemZTrindefs.fieldByname('utv_mon_bad').asfloat);
                   IBSAVE_ADD('TW_ID2',MemZTrindefs.fieldbyname('TW_ID2').asinteger);

                   ID:=IBSAVE_DOC('TRINDEFS',MemZTrindefS.fieldbyname('TRINDEFS_ID').asinteger);

                   if ID<0 then IDR:=SQRT(-1) else begin
                      if (DOC_ZTRINDEF.tag>0) and (MemZTRINDEFS.fieldbyname('TRINDEFS_ID').asinteger<0) then begin
                          // Фиксируем факт добавления товара
                          IBSAVE_CLEAR;
                          IBSAVE_ADD('DOC','TRINDEF');
                          IBSAVE_ADD('US_ID',USERID);
                          IBSAVE_ADD('SHOP_ID',SHOPID);
                          IBSAVE_ADD('MESS','Добавлен товар: '+MemZTRINDEFS.Fieldbyname('TW_ART').asstring+' '+
                            MemZTRINDEFS.Fieldbyname('TW_NAM').asstring);
                          IBSAVE_ADD('DOP1',2);
                          IBSAVE_ADD('DOP2',TRINDEF_ID);
                          if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
                      end;
                      MemZTRINDEFS.Edit;
                      MemZTRINDEFS.fieldbyname('TRINDEFS_ID').asinteger:=ID;
                      MemZTRINDEFS.Post;
                   end;
                   MemZTRINDEFS.next;
             end;
        end;
        //Всё прошло нормально - изменяем временные данные
        //Отображаем номер
        Doc_ZTRINDEF.tag:=TRINDEF_ID;
        TRINDEF_NUM.text:=b_utils.right('0000000000'+inttostr(TRINDEF_NUMS),10);
        MemZTRINDEFS.First;
        while not MemZTRINDEFS.eof do begin
              if MemZTRINDEFS.fieldbyname('TRINDEFS_ID').asinteger<0 then begin
                 MemZTRINDEFS.Edit;
                 MemZTRINDEFS.fieldbyname('TRINDEFS_ID').asinteger:=-MemZTRINDEFS.fieldbyname('TRINDEFS_ID').asinteger;
                 MemZTRINDEFS.Post;
              end;
              MemZTRINDEFS.next;
        end;
        MemZTRINDEFS.First;
        for a:=1 to OLDID-1 do MemZTRINDEFS.next;
        SAVE:=TRUE;
        CNT_DEL:=0;
        MemZTRINDEFS.EnableControls;
        Datamodule1.IBTransaction2.Commit;
     Except
        Datamodule1.IBTransaction2.Rollback;
        ShowMessage('Проверьте правильность или наличие данных');
     End;
     Datamodule1.IBTransaction2.Active:=False;

end;

procedure TDOC_ZTRINDEF.ActSaveExecute(Sender: TObject);
begin
   // Сохранить
     SAVE:=false;
     ActApply.Execute;
     if SAVE then begin
        Close;
     end;

end;

procedure TDOC_ZTRINDEF.ActDelExecute(Sender: TObject);
begin
     if Messbox('Удалить из заявки товар "'+MemZTRINDEFS.Fieldbyname('TW_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then begin
        SAVE:=False;
        if MemZTRINDEFS.Fieldbyname('TRINDEFS_ID').asinteger>0 then begin
          inc(CNT_DEL);
          TRINDEFS_DEL[CNT_DEL]:=MemZTRINDEFS.Fieldbyname('TRINDEFS_ID').asinteger;
          TRINDEFS_DEL_MESS[CNT_DEL]:='Удален товар: '+MemZTRINDEFS.Fieldbyname('TW_ART').asstring+' '+
            MemZTRINDEFS.Fieldbyname('TW_NAM').asstring;
        end;
        MemZTRINDEFS.delete;
//        Refresh_summ;
//        Show_Sost;
     end;
end;

procedure TDOC_ZTRINDEF.MemZTrindefsAfterEdit(DataSet: TDataSet);
begin
  Save:=false;
//  MemZTRINDEFS.Edit;
end;

procedure TDOC_ZTRINDEF.ActDetalExecute(Sender: TObject);
begin
   SHOW_DETAL_TW(MemZTrindefs.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_ZTRINDEF.ActOkExecute(Sender: TObject);
begin
    if (Messbox('Вы уверены, что закончили утверждение заявки на переоценку?',MessSubmit,4+48+256)=6) then
    begin
       ActSave.execute;
    end;
end;

procedure TDOC_ZTRINDEF.DsTRINDEFSDataChange(Sender: TObject;
  Field: TField);
begin
  if MemZTrindefs.State in [dsInsert,dsEdit] then
    SAVE:=False;
  if (MemZTrindefs.State in [dsInsert]) and ( not CanInsert) then
    MemZTrindefs.Cancel;
end;

procedure TDOC_ZTRINDEF.ActAnalizExecute(Sender: TObject);
begin
   SHOW_ANALIZ_TW(MemZtrindefs.fieldbyname('TW_ID').asinteger);
end;

procedure TDOC_ZTRINDEF.FormKeyPress(Sender: TObject; var Key: Char);
var
   ID:integer;
   N:integer;
begin
  if Edit1.Text<>'000000' then
    exit;

  begin
     if (key='*') and (sost=0)  then begin
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
                 if CanRefresh then begin
                   {Добавляем строку}
                   QueryTransaction.Active:=False;
                   IBQuery.close;
                   IBQuery.SQL.clear;
                    IBQuery.SQL.add('select TW_ID from TW where TW_ART=:TW_ART and TW_BRAK=:TW_BRAK');
                 if B_utils.left(STR,1)='Б' then begin
                    N:=strtoint(B_Utils.right(STR,length(STR)-1));
                    IBQuery.ParamByname('TW_ART').asinteger:=N;
                    IBQuery.ParamByname('TW_BRAK').asstring:='1';
                 end else begin
                    N:=strtoint(STR);
                    IBQuery.ParamByname('TW_ART').asinteger:=N;
                    IBQuery.ParamByname('TW_BRAK').asstring:='0';
                 end;
                   IBQuery.Open;
                   if not IBQuery.eof then begin
                      ID:=IBQuery.fieldbyname('TW_ID').asinteger;
                     ADD_ZTRINDEFS(ID,-1, sost);
                     UPDATE_MONEY_INFO;
                   //    Refresh_summ;
                   end else messbox('Не существует товара с кодом: '+inttostr(N)+' !',MessSystem,48);
                 end;
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

procedure TDOC_ZTrindef.Show_sost;
var
   s:ansistring;
   ZtrindefEmpty:boolean;
   c:integer;
   SHOW_COLUMN:ansistring;
   STATUS:integer;
   ZEmpty:boolean;
   n0, n1, n2, n3, n4, n5: integer;
begin
//     if DOC_ZTRINDEF.Tag<0 then
  //     DOC_ZTRINDEF.caption:='Заявка на переоценку. Новая'
    // else DOC_ZTRINDEF.caption:='Заявка на переоценку. Редактирование';
     if MemZTrindefs.RecordCount=0 then ZtrindefEmpty:=true else ZtrindefEmpty:=false;
     case Sost of
             0: begin
                   s:='Ожидание...';
                   Panel2.Color:=clBtnFace;
                   Panel2.Font.color:=ClWindowText;
                end;
             1: begin
                   s:='Ввод списываемого ...';
                   if TW_FON>=0 then Panel2.Color:=TW_FON;
                   if TW_COLOR>=0 then Panel2.Font.color:=TW_COLOR;

                end;
             2: begin
                   s:='Ввод приходуемого ...';
                   if TW_FON>=0 then Panel2.Color:=TW_FON;
                   if TW_COLOR>=0 then Panel2.Font.color:=TW_COLOR;
                end;
     end;
     StatusBar1.Panels[0].text:='Состояние: '+s;
     StatusBar1.Panels[1].text:=STR;
//     STATUS:=strtoint(TRINDEF_STAT.value);
     if MemZtrindefs.recordcount=0 then ZEmpty:=true else ZEmpty:=false;
     ActSave.enabled:=(Not Zempty) ;
     ActApply.enabled:=(Not Zempty);
//     ActOk.enabled:=(Not Zempty) and (Status =23) and Can_Utw;
     DicTW.enabled:=(Edit1.Text = '000000');
     ActDel.enabled:=(Not Zempty) and  (Edit1.Text = '000000');
     ActDetal.enabled:=(Not Zempty);
     ActAnaliz.enabled:=(Not Zempty);
     ActMarketing.enabled:=(Not Zempty);
     trindef_date.enabled:=(Sost=0);
     trindef_osn.enabled:=(Sost=0);

     trindef_date.Enabled:= (Edit1.Text = '000000');
     trindef_skl.Enabled:= (Edit1.Text = '000000');
     trindef_osn.enabled:=(Edit1.Text = '000000');

     n0 := strtoint(copy(Edit1.Text , 1, 1));
     n1 := strtoint(copy(Edit1.Text , 2, 1));
     n2 := strtoint(copy(Edit1.Text , 3, 1));
     n3 := strtoint(copy(Edit1.Text , 4, 1));
     n4 := strtoint(copy(Edit1.Text , 5, 1));
     n5 := strtoint(copy(Edit1.Text , 6, 1));

     RxDbGrid1.ReadOnly:= not
     (
     (    (n0+n2+n1+n3+n4+n5) = 0)
     or
     ( (n0=0) and ((n1+n2+n3+n4+n5) = 0))
     or (((n3+n4+n5)=0))
     );







     if stat_list.Items.Count>4 then
     begin



     if (stat_list.EnabledItem[1] or stat_list.EnabledItem[2]) then
     begin
//убрал редактирование новой цены брака        rxDbGrid1.Columns.Items[8].ReadOnly:= false;
        RxDbGrid1.ReadOnly:=rxDbGrid1.Columns.Items[8].ReadOnly;
        if ((not stat_list.Checked[1]) or ( not stat_list.Checked[2])) then
        if ((Edit1.Text[4]='0') and (Edit1.text[5]='0'))
        then
                DicTW.enabled:=  true;

        actDel.Enabled:=dicTW.Enabled;

     end
     else
     begin
        rxDbGrid1.Columns.Items[8].ReadOnly:= true;
     end   ;


     toolbutton17.Enabled:= (Edit1.Text = '111110') and stat_list.EnabledItem[5];




     if (RES_CREATED = 1)then
        toolbutton19.Enabled:=false;









     end;



     tw_nam.Visible:=(trindef_type.ItemIndex=3);
     btnTw.visible:=(trindef_type.ItemIndex=3);
     PSORT_TW_PRICE.visible:=(trindef_type.ItemIndex=3);
     Label11.visible:=(trindef_type.ItemIndex=3);


     rxDbGrid1.Columns.Items[8].Visible:=not Label11.visible;


     rxDbGrid1.Columns.Items[9].Visible:=(TRINDEF_TYPE.ItemIndex=4);
     rxDbGrid1.Columns.Items[10].Visible:=(TRINDEF_TYPE.ItemIndex=4);
     rxDbGrid1.Columns.Items[11].Visible:=(TRINDEF_TYPE.ItemIndex=4);
     rxDbGrid1.Columns.Items[12].Visible:=(TRINDEF_TYPE.ItemIndex=4);



//     PSORT_TW_PRICE.Enabled:=trindef_type.Enabled;
     btnTw.Enabled:=trindef_type.Enabled;




     //     Ztrindef_Stat.enabled:=(STATUS in [1,2,22,23]);
     // Определяем доступность строк
 {    RxDbGrid1.Columns[4].ReadOnly:=(Sost=0);
     RxDbGrid1.Columns[8].ReadOnly:=(Sost=0);
     RxDbGrid1.Columns[9].ReadOnly:=(Sost=0);
     RxDbGrid1.Columns[11].ReadOnly:=(Sost=0);}

end;


procedure FixUsDostup;
var us_dostup: integer;
begin

us_dostup:= 1;



//
end;


procedure TDOC_ZTRINDEF.stat_listClick(Sender: TObject);
var s: string;
begin
  if (stat_list.ItemIndex<> -1) then
  begin
    button1.Caption:='Утвердить: '+stat_list.Items[stat_list.ItemIndex];
    button2.Caption:='Отказать: '+stat_list.Items[stat_list.ItemIndex];

    if (Edit1.text = 'Edit1') then
            edit1.Text:='000000';

    s:=edit1.Text;
    if stat_list.Checked[stat_list.ItemIndex] then
      s[stat_list.ItemIndex+1]:='1'
    else
      s[stat_list.ItemIndex+1]:='0';

    edit1.Text:=s;

    if stat_list.ItemIndex <=  listbox1.Items.Count-1 then
      trindef_stats.Text:=listbox1.Items[stat_list.ItemIndex]
    else
      trindef_stats.Text:='';


    trindef_stats.Enabled:= stat_list.EnabledItem[stat_list.ItemIndex] and not stat_list.Checked[stat_list.ItemIndex];

    if trindef_stats.Enabled then
    begin
      label8.Caption:='Комментарий: редактирование разрешено';

      if (stat_list.itemIndex in [0,1,2,3]) then
        trindef_type.Enabled:=true
      else
        trindef_type.Enabled:=false;



    end
    else
    begin
      label8.Caption:='Комментарий: редактирование запрещено';
      trindef_type.Enabled:=false;
    end;


    listbox1.ItemIndex:=stat_list.ItemIndex;



  end;
  save:=false;
  Show_sost;
end;

procedure TDOC_ZTRINDEF.trindef_statsChange(Sender: TObject);
begin
  if stat_list.ItemIndex<>-1 then
  begin

    while stat_list.ItemIndex > listbox1.Items.Count - 1 do
      listbox1.Items.Add('');


    listbox1.Items[stat_list.ItemIndex]:=trindef_stats.Text;
  end;
   save:=false;

end;

procedure TDOC_ZTRINDEF.ListBox1Click(Sender: TObject);
begin
stat_list.ItemIndex:=listbox1.ItemIndex;
stat_listClick(nil);

end;

procedure TDOC_ZTRINDEF.stat_listStateChange(Sender: TObject;
  Index: Integer);
begin
  stat_listClick(nil);
end;

procedure TDOC_ZTRINDEF.Button1Click(Sender: TObject);
begin
  if  stat_list.ItemIndex > -1 then
  begin
    if stat_list.EnabledItem[stat_list.ItemIndex] then
    begin
      stat_list.Checked[stat_list.ItemIndex]:=true;
      stat_listClickCheck(nil);
    end
  end ;
    Show_sost;
end;

procedure TDOC_ZTRINDEF.Button2Click(Sender: TObject);
begin
  if  stat_list.ItemIndex > -1 then
  begin
    if stat_list.EnabledItem[stat_list.ItemIndex] then
      stat_list.Checked[stat_list.ItemIndex]:=false;
  end
end;

procedure TDOC_ZTRINDEF.trindef_typeChange(Sender: TObject);
var id, tw_brak_id, a: integer;
s: string;
begin
  save:=false;


  canRefresh:=false;


  if MemZTrindefs.RecordCount>0 then begin
         ID:=MemZTrindefs.RecNo;
         MemZTrindefs.DisableControls;
         MemZTrindefs.First;

         while not MemZTrindefs.eof do begin
               MemZTrindefs.Edit;

               if trindef_type.ItemIndex = 2 then
               begin
                 //28-11-2013 - убрано зануление - списание идет по цене брака MemZTrindefs.fieldByname('new_mon_bad').asfloat:=0
               end
               else
               if trindef_type.ItemIndex=3 then
                tw_brak_id:=tw_nam.Tag
               else
               begin
                WorkTransaction.Active:=false;
                Querywork.Close;
                ADD_SQL(QueryWork,'select tw_price_frm.money as price_brak from tw_price_frm((select tw_id from tw where tw_art = (select tw_art from tw where tw_id=:TW_ID) and  tw_brak=1),0,0, 0)');

                Querywork.paramByname('tw_id').asinteger:=MemZTrindefs.fieldByname('TW_ID').asinteger;
                Querywork.open;
//                tW_brak_id:=MemZTrindefs.fieldByname('TW_ID').asinteger;
                MemZTrindefs.fieldByname('new_mon_bad').asfloat:= Querywork.FieldbyName('price_brak').asFloat;
                MemZTrindefs.fieldByname('zak_brak').asfloat:= b_dbutils.GetTWKtgPrice( MemZTrindefs.fieldByname('TW_ID2').asinteger,5);

                Querywork.Close;
               end;



               MemZTrindefs.Post;
               MemZTrindefs.next;
         end;
         MemZTrindefs.First;
         for a:=1 to ID-1 do MemZTrindefs.next;
         MemZTrindefs.EnableControls;
     end;
     self.caption:=s;



  canRefresh:=true;

  UPDATE_MONEY_INFO;

  Show_sost;
end;

procedure TDOC_ZTRINDEF.UPDATE_MONEY_INFO;
var
   a,ID:integer;
   Summ:Double;
   s:ansistring;
   //  price_good_tw,
   price_prihod: double;
   price_rashod: double;

  sum_good_tw, sum_brak_tw, sum_zak_tw: double;
  sum_tw_kol: double;
  tw_brak_id: integer;
  summ_ubit: double;

begin
  if not canRefresh then exit;

  canRefresh:=false;

  if self.Visible then begin

     s:=self.caption;
     self.caption:=self.caption+'. Расчет убытков';
     summ_ubit:=0;
     if MemZTrindefs.RecordCount>0 then begin
         ID:=MemZTrindefs.RecNo;
         MemZTrindefs.DisableControls;
         MemZTrindefs.First;
         Summ:=0;

//цена брака
//закупочная цена
//остатки


//первый куплен за 50 цена 100
//второй куплен за 70 цена 90
//пересорт первого во второй - первого нет есь второй.
//т.е.. первый был продан по цене второго
//было куплено за 50 продано за 90 = наценка 40 должна была быть 50
//теперь второй будет продан о цене второго но с закупкой первого
// 90 - 50 = 40 наценка

// 40 + 40 = 80
//а было бы 50 + 20 = 70
// убыток = розничная цена приходуемого минус цена списываемого - по словам бреховой 22-12-2011.

//убытки: (цена брака - закупка) * колво
//если списание - цена брака = 0;
{
Неопределено     0
Пересорт в брак + 1
Списание +++       2
Пересорт в один артикул 3
Пересорт в несколько артикулов 4
еревод на склад 7СБ     5
}



         while not MemZTrindefs.eof do begin
               MemZTrindefs.Edit;
               MemZTrindefs.fieldByname('tw_ost').asfloat:=GetOst(MemZTrindefs.fieldByname('TW_ID').asinteger,strtoint('0'+TRINDEF_SKL.value), 0);
               MemZTrindefs.fieldByname('zak_mon').asfloat:= b_dbutils.GetTWKtgPrice( MemZTrindefs.fieldByname('TW_ID').asinteger,5);

               //новая розничная цена  брака товара
               price_prihod:=MemZTrindefs.fieldByname('new_mon_bad').asfloat;
               //цена списываемого товара - закупочная
               price_rashod:=MemZTrindefs.fieldByname('zak_mon').asfloat;

               //если перевод в брак тогда розничная цена - новая цена брака  . результат - разница между розничными ценами.
               if trindeF_type.ItemIndex=1 then
               begin
                price_prihod:=MemZTrindefs.fieldByname('new_mon_bad').asfloat;
                ////28-11-2013 - изменена условная цена по указанию куликоваprice_rashod:=MemZTrindefs.fieldByname('MON_GOOD').asfloat;
                price_rashod:=MemZTrindefs.fieldByname('kropt_price').asfloat;
               end;
                if trindeF_type.ItemIndex=5 then
               begin
                price_prihod:=MemZTrindefs.fieldByname('new_mon_bad').asfloat;
                ////28-11-2013 - изменена условная цена по указанию куликоваprice_rashod:=MemZTrindefs.fieldByname('MON_GOOD').asfloat;
                price_rashod:=MemZTrindefs.fieldByname('kropt_price').asfloat;
               end;

               //если списание  . результат - закупочная цена списываемого.
               if trindeF_type.ItemIndex=2 then
               begin
                price_prihod:=0;
                ////28-11-2013 - изменена условная цена по указанию куликоваprice_rashod:=MemZTrindefs.fieldByname('zak_mon').asfloat;
                price_rashod:=MemZTrindefs.fieldByname('spec_price').asfloat;

                if ( pos('(Б)', MemZTrindefs.fieldByname('TW_NAM').asstring) = 1) then
                        price_rashod:=MemZTrindefs.fieldByname('new_mon_bad').asfloat;
               end;


                //если пересорт в 1 артикул -   берется цена из окошка.... это закупочная цена

                ////28-11-2013 - изменена условная цена по указанию куликова
               if trindeF_type.ItemIndex=3 then
               begin
                price_prihod:=psort_tw_price.value;
                price_rashod:=MemZTrindefs.fieldByname('zak_mon').asfloat;
                price_rashod:=MemZTrindefs.fieldByname('mon_good').asfloat;
               end;
               if trindeF_type.ItemIndex=4 then
               begin
                //price_rashod:=MemZTrindefs.fieldByname('zak_mon').asfloat;
                //price_prihod:=MemZTrindefs.fieldByname('zak_brak').asfloat;
                price_rashod:=MemZTrindefs.fieldByname('mon_good').asfloat;
                price_prihod:=MemZTrindefs.fieldByname('tw2_mon_good').asfloat;
               end;


               //if trindeF_type.ItemIndex=4 then
//                price_rashod:=MemZTrindefs.fieldByname('mon_good').asfloat;



               summ_ubit:= summ_ubit + (price_prihod - price_rashod) *  MemZTrindefs.fieldByname('tw_bad').asfloat;

               MemZTrindefs.Post;
               MemZTrindefs.next;
         end;
         MemZTrindefs.First;
         for a:=1 to ID-1 do MemZTrindefs.next;
         MemZTrindefs.EnableControls;
     end;
     self.caption:=s;
  end;
                                  //FloatToStrF(amount1, ffCurrency, 2, 4));
  label10.caption:='Результат: '+FloatToStrF(summ_ubit, ffCurrency, 4, 2)+' руб' ; //floattostr(summ_ubit)+' руб.';
  TRINDEF_RESULT:=summ_ubit;

  canRefresh:=true;

  save:=false;
end;

procedure TDOC_ZTRINDEF.TRINDEF_SKLChange(Sender: TObject);
var
   a,ID:integer;
   Summ:Double;
   s:ansistring;

begin
  if not canRefresh then exit;

  if self.Visible then begin

     s:=self.caption;
     self.caption:=self.caption+'. Чтение остатков товаров';
     if MemZTrindefs.RecordCount>0 then begin
         ID:=MemZTrindefs.RecNo;
         MemZTrindefs.DisableControls;
         MemZTrindefs.First;
         Summ:=0;


         while not MemZTrindefs.eof do begin
               MemZTrindefs.Edit;
           	   MemZTrindefs.fieldByname('tw_ost').asfloat:=GetOst(MemZTrindefs.fieldByname('TW_ID').asinteger,strtoint('0'+TRINDEF_SKL.value), 0);
               MemZTrindefs.Post;
               MemZTrindefs.next;
         end;
         MemZTrindefs.First;
         for a:=1 to ID-1 do MemZTrindefs.next;
         MemZTrindefs.EnableControls;
     end;
     self.caption:=s;
  end;

  save:=false;
end;

procedure TDOC_ZTRINDEF.TRINDEF_OSNChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDOC_ZTRINDEF.TRINDEF_DATEChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDOC_ZTRINDEF.ToolButton17Click(Sender: TObject);
begin
    ADD_SQL(Datamodule1.IbSaveSQL,'select * FROM SUBDOC_TRINDEF_TO_SPIS(:ID,:SHOP_ID,:US_ID)');
    Datamodule1.IbSaveSQL.ParamByname('ID').asinteger:=self.Tag;
    Datamodule1.IbSaveSQL.ParamByname('SHOP_ID').asinteger:=SHOPID;
    Datamodule1.IbSaveSQL.ParamByname('US_ID').asinteger:=USERID;

    Try
       Datamodule1.IbSaveSQL.Open;
       if not Datamodule1.IbSaveSQL.eof then begin
          Messbox('Создана '+' № '+
          Datamodule1.IbSaveSQL.fieldByname('DOC_NUM_FULL').asstring+' от '+date_sokr(date()),MessSystem,48);
          stat_list.ItemIndex:=5;
          stat_list.Checked[5]:=true;
       end else messbox('ошибка',MessSystem,48);
       Datamodule1.IBTransaction2.Commit;

    Except
          Datamodule1.IBTransaction2.RollBAck;
          Messbox(MessErrorOsn,MessError,16);
    End;

    Datamodule1.IBTransaction2.Active:=False;



end;

procedure TDOC_ZTRINDEF.BtnTWClick(Sender: TObject);
var
   a:integer;
begin
     DicTowarSet:=4; {Ввод товаров из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.Tag>0 then
     begin
      save:=false;
      QueryWork.close;
      QueryWork.SQL.clear;
      QueryWork.SQL.add('select tw_id, tw_art, tw_nam, (select money from tw_price_frm(tw.tw_id, 0, 0,0)) tw_money from tw where tw_id = :tw_id');
      QueryWork.ParamByname('TW_ID').asinteger:=DIC_TOWAR.Tag;
      QueryWork.Open;
      if not QueryWork.eof then
      begin
        tw_nam.text:= QueryWork.fieldByname('TW_ART').asstring +' '+ QueryWork.fieldByname('TW_NAM').asstring;
        tw_nam.tag:=QueryWork.fieldByname('TW_ID').asinteger;
        psort_tw_price.value:=QueryWork.fieldByname('tw_money').asfloat;
      end;
     end;

     trindef_typeChange(nil);

     UPDATE_MONEY_INFO;
     Show_Sost;


end;


procedure TDOC_ZTRINDEF.MemZTrindefsTW_BADChange(Sender: TField);
begin
// if CAN_REFRESH then
   	UPDATE_MONEY_INFO;
end;

procedure TDOC_ZTRINDEF.MemZTrindefsNEW_MON_BADChange(Sender: TField);
begin
   	UPDATE_MONEY_INFO;
end;

procedure TDOC_ZTRINDEF.PSORT_TW_PRICEChange(Sender: TObject);
begin
   	UPDATE_MONEY_INFO;
end;

procedure TDOC_ZTRINDEF.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
        if ParName='TRINDEF_TITLE' then
                parValue:=trindeF_title;
        if ParName='TRINDEF_COMMENT' then
                parValue:=trindeF_comment;
        if ParName='TRINDEF_COMMENTS' then
                parValue:=trindeF_comments;

end;

procedure TDOC_ZTRINDEF.ActPrintExecute(Sender: TObject);
var i: integer;
begin
trindef_title:='Заявка на '+ trindef_type.Text + '№ '+TRINDEF_NUM.Text + ' от '+TRINDEF_DATe.Text+chr(13)+'Составитель: '+USER.Text;
trindef_comment:=trindef_osn.Text;

print_query.ParamByName('trindef_id').asInteger:=self.tag;
print_query.Open;
trindef_comments:=print_query.fieldbyname('users_comment').asString;
{
for i:=0 to listbox1.Items.Count-1 do
begin
trindef_comments:=trindef_comments + stat_list.Items[i] +': ' +listbox1.Items[i]+chr(13);

end;
}
print_query.Close;
   frReport1.ShowReport;
end;

procedure TDOC_ZTRINDEF.ActHistoryExecute(Sender: TObject);
begin
     SHOW_HISTORY_DOC('История заявки','TRINDEF',self.tag);
end;

procedure TDOC_ZTRINDEF.stat_listClickCheck(Sender: TObject);
var s: string;
i: integer;
r: double;
begin
  {
  юзер тип дозжности действие текст комментария
  }

  i:=stat_list.ItemIndex;
  IBSAVE_CLEAR;
  IBSAVE_ADD('DOC','TRINDEF');
  IBSAVE_ADD('US_ID',USERID);
  IBSAVE_ADD('SHOP_ID',SHOPID);


  if stat_list.Checked[i] then
          IBSAVE_ADD('MESS',stat_list.Items[i]+ ': Утверждено: '+trindef_stats.Text)
  else
          IBSAVE_ADD('MESS',stat_list.Items[i]+ ': Отмена утверждения: '+trindef_stats.Text);
  IBSAVE_ADD('DOP1',0);
  IBSAVE_ADD('DOP2',self.tag);
  if IBSAVE_DOC('ARCUPDATE',-1)<0 then r:=sqrt(-1);
  DATAMODULE1.IBTransaction2.Commit;

  actapply.Execute;

end;

procedure TDOC_ZTRINDEF.ToolButton19Click(Sender: TObject);
var rn_id: integer;
rn_num: string;

begin
//    ADD_SQL(Datamodule1.IbSaveSQL,'select * FROM SUBDOC_TRINDEF_TO_RN(:ID,:SHOP_ID,:US_ID)');

   // Сохранить
        SAVE:=false;
        ActApply.Execute;
        

        RES_CREATED:=1;

        DataModule1.QueryWork.SQL.Text:='SELECT RN_ID, RN_NAME FROM SUBDOC_TRINDEF_TO_RN(:TRINDEF_ID, :US_ID)';
        DataModule1.QueryWork.ParamByName('TRINDEF_ID').asinteger:= self.Tag;
        DataModule1.QueryWork.ParamByName('US_ID').asinteger:= USERID;

    Try
       Datamodule1.QueryWork.Open;
       if not Datamodule1.QueryWork.eof then begin
       rn_id:= Datamodule1.QueryWork.fieldByname('RN_ID').asInteger;
       rn_num:=Datamodule1.QueryWork.fieldByname('RN_NAME').asstring;




       ADD_SQL(Datamodule1.QueryWork,'update rn set shop_id = :shop_id,  rn_prow = 1, rntyp_id = 6 where rn_id=:rn_id');
       Datamodule1.QueryWork.ParamByname('RN_ID').asinteger:=rn_id;
       Datamodule1.QueryWork.ParamByname('SHOP_ID').asinteger:=SHOPID;
       Datamodule1.QueryWork.ExecSQL;
       datamodule1.QueryWork.Transaction.Commit;

       Messbox('Создана '+' № '+rn_num
          +' от '+date_sokr(date()),MessSystem,48);
//          stat_list.ItemIndex:=5;
//          stat_list.Checked[5]:=true;
       end else messbox('ошибка',MessSystem,48);



    Except
          Datamodule1.QueryWork.Transaction.RollBAck;
          Messbox(MessErrorOsn,MessError,16);
    End;

    Datamodule1.IBTransaction2.Active:=False;
end;

end.

