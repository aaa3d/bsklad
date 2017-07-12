unit DicTwDynGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,Data1, Db, IBCustomDataSet, IBQuery,DicTowar,B_DButils,
  B_utils, IBDatabase, ToolWin, Mask, ToolEdit, CurrEdit, Grids, RXGrids,
  DBGrids, RXDBCtrl, RxMemDS, RxLookup, Buttons;

type
  TDIC_TW_DYN_GROUP = class(TForm)
    QueryWork: TIBQuery;
    WorkTransaction: TIBTransaction;
    memTwTree: TRxMemoryData;
    dsTwTree: TDataSource;
    memTwTreetwtree_id: TIntegerField;
    memTwTreetwtree_nam: TStringField;
    TabControl1: TTabControl;
    RxDBGrid2: TRxDBGrid;
    DsTwDynList: TDataSource;
    TWDynTwList1: TIBQuery;
    Splitter1: TSplitter;
    TWDynTwList1TWDYNGROUP_NAM: TIBStringField;
    TwDynListTr: TIBTransaction;
    memTwTreerelation_id: TIntegerField;
    TWDynTwList1TWDYNGROUP_ID: TIntegerField;
    ResultTWSet1: TIBQuery;
    trResultTwSet: TIBTransaction;
    dsResultTWSet: TDataSource;
    ResultTwSet: TRxMemoryData;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    BtnApply: TToolButton;
    btnNew: TToolButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheetTREE: TTabSheet;
    Label2: TLabel;
    ToolBar2: TToolBar;
    GetTwGroup: TToolButton;
    btnDelTWTREE: TToolButton;
    RxDBGrid1: TRxDBGrid;
    TabSheetTW: TTabSheet;
    ToolBar3: TToolBar;
    GetTw: TToolButton;
    btnDELTW: TToolButton;
    RxDBGrid4: TRxDBGrid;
    TabSheetRESULT: TTabSheet;
    RxDBGrid3: TRxDBGrid;
    ToolBar4: TToolBar;
    BtnRefresh: TToolButton;
    TabSheetUSL: TTabSheet;
    chkTW_NAM: TCheckBox;
    chkTWTREE_NAM: TCheckBox;
    chkKTG: TCheckBox;
    chklowPrice: TCheckBox;
    chkhiPrice: TCheckBox;
    TW_NAM: TEdit;
    TWTREE_NAM: TEdit;
    lowPrice: TRxCalcEdit;
    hiPrice: TRxCalcEdit;
    DYNTREE_TYP: TComboBox;
    chkTemporary: TCheckBox;
    DYNTWLIST_NAME: TEdit;
    chkPrivate: TCheckBox;
    Label1: TLabel;
    Label3: TLabel;
    dsTW: TDataSource;
    memTW: TRxMemoryData;
    memTWrelation_id: TIntegerField;
    memTWtwtree_id: TIntegerField;
    memTWtwtree_nam: TStringField;
    memTWtw_id: TIntegerField;
    memTWtw_nam: TStringField;
    memTWTW_ART: TIntegerField;
    StatusBar1: TStatusBar;
    StatusBar2: TStatusBar;
    StatusBar3: TStatusBar;
    btnSelect: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    TWDynTWList: TRxMemoryData;
    TWDynTWListTWDYNGROUP_NAM: TIBStringField;
    TWDynTWListTWDYNGROUP_ID: TIntegerField;
    chkTW_Saler: TCheckBox;
    chkGabarit: TCheckBox;
    Gabarit: TComboBox;
    chkTW_MADE: TCheckBox;
    TW_MADE: TEdit;
    chkTW_LAND: TCheckBox;
    TW_LAND: TEdit;
    KTG: TRxDBLookupCombo;
    TW_SALER: TRxDBLookupCombo;
    btnDEL: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    StatusBar4: TStatusBar;
    TWDynTwList1US_NAME: TIBStringField;
    TWDynTWListUS_NAME: TIBStringField;
    TWDynTwList1USER_ID: TIntegerField;
    TWDynTWListUSER_ID: TIntegerField;
    Timer1: TTimer;
    ResultTWSet1TW_ID: TIntegerField;
    ResultTWSet1TW_ART: TIntegerField;
    ResultTWSet1TW_NAM: TIBStringField;
    ResultTWSet1TWTREE_NAM: TIBStringField;
    ResultTwSetTW_ID: TIntegerField;
    ResultTwSetTW_ART: TIntegerField;
    ResultTwSetTW_NAM: TIBStringField;
    ResultTwSetTWTREE_NAM: TIBStringField;
    btnPrintPrice: TToolButton;
    chkSkipGroup: TCheckBox;
    TW: TEdit;
    BtnDynDic: TSpeedButton;
    BtnTW: TSpeedButton;
    btnCopy: TToolButton;
    ToolButton2: TToolButton;
    chkGood: TCheckBox;
    chkBrak: TCheckBox;
    chkRozn: TCheckBox;
    chkOpt: TCheckBox;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function SAVE_TWTREE:integer;
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure DYNTWLIST_NAMEChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function CHECK_TWTREE:boolean;
    procedure GetTwGroupClick(Sender: TObject);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure ApplyClick(Sender: TObject);
    procedure LoadList;
    procedure LoadDynTWSet;
    procedure TabControl1Change(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure RxDBGrid3TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure RxDBGrid3GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure DYNTREE_TYPChange(Sender: TObject);
    procedure GetTwClick(Sender: TObject);
    procedure RxDBGrid4GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid4TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure TWDynTWListAfterScroll(DataSet: TDataSet);
    procedure btnDelTWTREEClick(Sender: TObject);
    procedure btnDELTWClick(Sender: TObject);
    procedure ShowSost;
    procedure chkTW_NAMClick(Sender: TObject);
    procedure chkTWTREE_NAMClick(Sender: TObject);
    procedure chkKTGClick(Sender: TObject);
    procedure chklowPriceClick(Sender: TObject);
    procedure chkhiPriceClick(Sender: TObject);
    procedure chkTW_SalerClick(Sender: TObject);
    procedure chkGabaritClick(Sender: TObject);
    procedure chkTW_MADEClick(Sender: TObject);
    procedure chkTW_LANDClick(Sender: TObject);
    procedure TW_NAMChange(Sender: TObject);
    procedure TWTREE_NAMChange(Sender: TObject);
    procedure KTGChange(Sender: TObject);
    procedure lowPriceChange(Sender: TObject);
    procedure hiPriceChange(Sender: TObject);
    procedure TW_SALERChange(Sender: TObject);
    procedure GabaritChange(Sender: TObject);
    procedure TW_MADEChange(Sender: TObject);
    procedure TW_LANDChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RxDBGrid2GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid2TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure btnDELClick(Sender: TObject);
    procedure TWDynTWListBeforeScroll(DataSet: TDataSet);
    function MakeDynSQL: string;
    procedure Timer1Timer(Sender: TObject);
    procedure btnPrintPriceClick(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
    procedure BtnTWClick(Sender: TObject);
    procedure chkSkipGroupClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
  private
    { Private declarations }
     por: Boolean; // Индикатор направления сортировки
     fld: TField; //поле сортировки
     por1: Boolean; // Индикатор направления сортировки
     fld1: TField; //поле сортировки
     por2: Boolean; // Индикатор направления сортировки
     fld2: TField; //поле сортировки
     por5: boolean;
     fld5: TField;


     CurEditGroupID: integer;
     CurEditGroupTyp: integer;
     USER_ID: integer;

     SAVE:boolean;

     DEL_ARR: array[0..1000] of integer;
     DEL_CNT: integer;


     tw_group_id: integer;
     tw_group_typ: integer;
  public
    { Public declarations }
    SELECTED_DYNTREE_ID: integer;
    SELECTED_DYNTREE_TYP: integer;
    SELECTED_DYNTREE_NAM: string;
  end;

var
  DIC_TW_DYN_GROUP: TDIC_TW_DYN_GROUP;


implementation

uses Mainform, PrintPrice;

{$R *.DFM}

function TDIC_TW_DYN_GROUP.MakeDynSQL: string;
var sWhere: string;
begin
 sWhere:='';


       //Формируем критерии запроса
       if  chkTW_NAM.checked then sWhere := sWhere+' AND upper(TW_NAM) LIKE(upper(''%'+stringreplace(TW_NAM.text,'''', '', [rfReplaceAll])+'%''))';
       if  chkTWTREE_NAM.checked then sWhere := sWhere+' AND upper(TWTREE_FULL) LIKE(upper(''%'+stringreplace(TWTREE_NAM.text,'''', '', [rfReplaceAll])+'%''))';
       if  chkKTG.checked then sWhere := sWhere+' AND TWKTG_ID='+('0'+KTG.value);
       if  chklowPrice.checked then sWhere := sWhere+' AND (select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
                          '(select max(kurs_date) from kurs where tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0))))>='+floattostr(lowPrice.value);
       if  chkhiPrice.checked then sWhere := sWhere+' AND (select money from price_okrug(tw.tw_mroz*(select kurs.kurs_kurs from kurs where kurs.kurs_date= '+
                          '(select max(kurs_date) from kurs where tw.valuta_id=kurs.valuta_id and kurs.kurs_typ=0))))<='+floattostr(hiPrice.value);

       if  chkTW_SALER.checked then sWhere := sWhere+' AND TW_SALER_ID=0'+TW_SALER.value;
       if  chkGABARIT.checked then sWhere := sWhere+' AND TW_NEGABARIT='+inttostR(GABARIT.ItemIndex);
       if  chkTW_MADE.checked then sWhere := sWhere+' AND upper(TW_MADE) LIKE(upper(''%'+stringreplace(TW_MADE.text,'''', '', [rfReplaceAll])+'%''))';
       if  chkTW_LAND.checked then sWhere := sWhere+' AND upper(TW_LAND) LIKE(upper(''%'+stringreplace(TW_LAND.text,'''', '', [rfReplaceAll])+'%''))';



       if chkTWTREE_NAM.checked then
        result:=' SELECT TW_ID, TW_ART, TW_NAM, TW.TWTREE_ID FROM TW, TWTREE WHERE TW.TWTREE_ID=TWTREE.TWTREE_ID ' +sWhere
       else
        result:=' SELECT TW_ID, TW_ART, TW_NAM, TW.TWTREE_ID FROM TW WHERE 1=1' +sWhere;

end;

procedure TDIC_TW_DYN_GROUP.LoadDynTWSet;
begin



    DEL_CNT:=0;
    CurEditGroupTyp:=1;

    memTwTree.EmptyTable;
    memTw.EmptyTable;
    ResultTWSet.EmptyTable;


    TW_NAM.Tag:=-1;
    TWTREE_NAM.Tag:=-1;
    KTG.Tag:=-1;
    lowPrice.Tag:=-1;
    HiPrice.Tag:=-1;
    TW_SALER.Tag:=-1;
    GABARIT.Tag:=-1;
    TW_MADE.Tag:=-1;
    TW_LAND.Tag:=-1;

    TW_NAM.Text:='';
    TWTREE_NAM.Text:='';
    KTG.value:='';
    lowPrice.Value:=0;
    HiPrice.value:=0;
    TW_SALER.value:='';
    GABARIT.ItemIndex:=-1;
    TW_MADE.text:='';
    TW_LAND.text:='';

    chkTW_NAM.Checked:=false;
    chkTWTREE_NAM.Checked:=false;
    chkKTG.Checked:=false;
    chklowPrice.Checked:=false;
    chkhiPrice.Checked:=false;
    chkTW_SALER.Checked:=false;
    chkGABARIT.Checked:=false;
    chkTW_MADE.Checked:=false;
    chkTW_LAND.Checked:=false;

    tw.Text:='';
    tW_group_id:=-1;
    tw_group_typ:=-1;




    CurEditGroupID:=TWDynTWList.FieldByName('TWDYNGROUP_ID').asinteger;

    WorkTransaction.Active:=False;
    QueryWork.close;
    if CurEditGroupID<=0 then
    begin
      DYNTWLIST_NAME.Text:=TwDynTwList.FieldByName('TwDynGroup_NAM').asstring;
      USER_ID:=TwDynTwList.FieldByName('USER_ID').asinteger;
      DYNTREE_TYP.ItemIndex:=0;
      DYNTREE_TYP.OnChange(nil);
      DYNTREE_TYP.Enabled:=true;

      TW_NAM.Tag:=-1;
      TWTREE_NAM.Tag:=-1;
      KTG.Tag:=-1;
      lowPrice.Tag:=-1;
      HiPrice.Tag:=-1;
      TW_SALER.Tag:=-1;
      GABARIT.Tag:=-1;
      TW_MADE.Tag:=-1;
      TW_LAND.Tag:=-1;

      TW_NAM.Text:='';
      TWTREE_NAM.Text:='';
      KTG.value:='';
      lowPrice.Value:=0;
      HiPrice.value:=0;
      TW_SALER.value:='';
      GABARIT.ItemIndex:=-1;
      TW_MADE.text:='';
      TW_LAND.text:='';

      chkTW_NAM.Checked:=false;
      chkTWTREE_NAM.Checked:=false;
      chkKTG.Checked:=false;
      chklowPrice.Checked:=false;
      chkhiPrice.Checked:=false;
      chkTW_SALER.Checked:=false;
      chkGABARIT.Checked:=false;
      chkTW_MADE.Checked:=false;
      chkTW_LAND.Checked:=false;

      chkTemporary.checked:=true;
      chkPrivate.checked:=true;

      chkGood.checked:=true;
      chkBrak.checked:=true;

      chkskipGroup.Checked:=false;


    end
    else
    begin
      DYNTREE_TYP.Enabled:=false;
      QueryWork.SQL.clear;
//      QueryWork.SQL.add('select twdyngroup_id, twdyngroup_nam, twtree_id, (select twtree_nam from twtree_full(twtree.twtree_id, '''')) twtree_nam , twdyngroup.user_id, private_mode '+
//        'from twdyngroup, twtree '+
//        'where twdyngroup.tree_ids containing  "%"||twtree.twtree_id||"%" and twdyngroup.twdyngroup_id=:id order by 4');
      Querywork.sql.Text:='SELECT * FROM TWDYNGROUP WHERE TWDYNGROUP_ID=:ID';
      QueryWork.Parambyname('ID').asinteger:=CurEditGroupID;
      QueryWork.open;
      if not QueryWork.eof then
      begin


          tw_group_id:=QueryWork.fieldbyname('skip_group_id').asInteger;
          tw_group_typ:=QueryWork.fieldbyname('skip_group_typ').asInteger;

          chkSkipgroup.Checked:=(tw_group_id<>-1);

          DYNTWLIST_NAME.text:=QueryWork.fieldbyname('twdyngroup_nam').asstring;
          USER_ID:=QueryWork.fieldbyname('user_id').asinteger;
          DYNTREE_TYP.ItemIndex:=QueryWork.fieldbyname('twdyngroup_typ').asinteger;
          DYNTREE_TYPChange(self);

          if QueryWork.fieldbyname('is_temporary').asinteger=0 then  chkTemporary.checked:=false  else chkTemporary.checked:=TRUE;
          if QueryWork.fieldbyname('private_mode').asinteger=0 then  chkPrivate.checked:=false  else chkPrivate.checked:=TRUE;
          if QueryWork.fieldbyname('show_good').asinteger=0 then  chkGood.checked:=false  else chkGood.checked:=TRUE;
          if QueryWork.fieldbyname('show_brak').asinteger=0 then  chkBrak.checked:=false  else chkBrak.checked:=TRUE;
          if QueryWork.fieldbyname('show_rozn').asinteger=0 then  chkRozn.checked:=false  else chkRozn.checked:=TRUE;
          if QueryWork.fieldbyname('show_opt').asinteger=0 then  chkOpt.checked:=false  else chkOpt.checked:=TRUE;          



          queryWork.close;

          //Грузим список групп
          Querywork.SQL.Text:='select relation.relation_id, relation.child_id, (select twtree_nam from twtree_full(twtree.twtree_id, '''')) twtree_nam1 '+
          'from relation, twtree where relation.relation_typ=1 and relation.parent_id=:ID and twtree.twtree_id=relation.child_id';
          QueryWork.Parambyname('ID').asinteger:=CurEditGroupID;
          QueryWork.open;


          while not querywork.Eof do
          begin
            memtwtree.Append;
            memtwtree.FieldByName('relation_id').asinteger:=querywork.FieldByName('relation_id').asinteger;
            memtwtree.FieldByName('twtree_id').asinteger:=querywork.FieldByName('child_id').asinteger;
            memtwtree.FieldByName('twtree_nam').asstring:=querywork.FieldByName('twtree_nam1').asstring;
            memtwtree.Post;
            querywork.Next;
          end;
          QueryWork.close;


          queryWork.close;

          //Грузим список товаров
          Querywork.SQL.Text:='select relation.relation_id, tw.tw_id, tw.tw_art, tw.tw_nam, tw.twtree_id,  (select twtree_nam from twtree_full(twtree.twtree_id, '''')) twtree_nam '+
          'from relation, twtree, tw where relation.parent_id=:ID and twtree.twtree_id=tw.twtree_id  and relation.relation_typ=2 and tw.tw_id = relation.child_id';
          QueryWork.Parambyname('ID').asinteger:=CurEditGroupID;
          QueryWork.open;


          while not querywork.Eof do
          begin
            memtw.Append;
            memtw.FieldByName('relation_id').asinteger:=querywork.FieldByName('relation_id').asinteger;
            memtw.FieldByName('twtree_id').asinteger:=querywork.FieldByName('twtree_id').asinteger;
            memtw.FieldByName('twtree_nam').asstring:=querywork.FieldByName('twtree_nam').asstring;
            memtw.FieldByName('tw_id').asinteger:=querywork.FieldByName('tw_id').asinteger;
            memtw.FieldByName('tw_nam').asstring:=querywork.FieldByName('tw_nam').asstring;
            memtw.FieldByName('tw_art').asinteger:=querywork.FieldByName('tw_art').asinteger;
            memtw.Post;
            querywork.Next;
          end;
          QueryWork.close;

          //Грузим условия товара
          Querywork.SQL.Text:='select * from CFG WHERE CFG_SET1=:ID and CFG_NAME=''TW_DYN_TW_LIST_PROP''';
          QueryWork.Parambyname('ID').asinteger:=CurEditGroupID;
          QueryWork.open;

          while not QueryWork.Eof do
          begin

           case QueryWork.fieldbyname('CFG_SET3').asinteger of
           1: begin
               chkTW_NAm.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               TW_NAM.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               TW_Nam.text:=QueryWork.fieldbyname('CFG_VALUE').asstring;
              end;
           2: begin
               chkTWTREE_NAM.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               TWTREE_NAM.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               TWTREE_NAM.text:=QueryWork.fieldbyname('CFG_VALUE').asstring;
              end;
           3: begin
               chkKTG.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               KTG.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               KTG.value:=QueryWork.fieldbyname('CFG_VALUE').asstring;
              end;
           4: begin
               chklowPrice.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               lowPrice.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               lowPrice.Value:=strtofloat('0'+QueryWork.fieldbyname('CFG_VALUE').asstring);
              end;
           5: begin
               chkhiPrice.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               hiPrice.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               hiPrice.Value:=strtofloat('0'+QueryWork.fieldbyname('CFG_VALUE').asstring);
              end;
           6: begin
               chkTW_SALER.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               TW_SALER.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               TW_SALER.value:=QueryWork.fieldbyname('CFG_VALUE').asstring;
              end;
           7: begin
               chkGABARIT.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               GABARIT.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               GABARIT.ItemIndex:=strtoint(QueryWork.fieldbyname('CFG_VALUE').asstring);
              end;
           8: begin
               chkTW_MADE.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               TW_MADE.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               TW_MADE.text:=QueryWork.fieldbyname('CFG_VALUE').asstring;
              end;
           9: begin
               chkTW_LAND.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               TW_LAND.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               TW_LAND.text:=QueryWork.fieldbyname('CFG_VALUE').asstring;
              end;

       

           end;



            QueryWork.Next;
          end;
          QueryWork.close;

      end;

      if tw_group_typ=3 then
      begin
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
      end
      else if tw_group_typ>-1 then
      begin
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWDYNGROUP_NAM FROM TWDYNGROUP WHERE TWDYNGROUP_ID=:_ID');
       QueryWork.ParamByname('_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:='* '+ QueryWork.fieldByname('TWDYNGROUP_NAM').asstring+' *';
      end;



    end;



   SAVE:=true;
   Showsost;
end;


procedure TDIC_TW_DYN_GROUP.LoadList;
begin

   if (((SAVE=false) and (btnApply.Enabled)) and (TWDynTWList.ControlsDisabled=false))
    then
    begin

        if Messbox('Данные были изменены. Сохранить изменения?', messsystem, MB_YESNO)=IDYES then
          btnApply.OnClick(nil);
    end;


  TwDynTwList.DisableControls;

  TwDynTwList1.close;
  TwDynTwList1.ParamByName('USER_ID').asinteger:=USERID;

  if ((TabControl1.TabIndex=2) and (Check_dostup('$DIC_TW_SET.VIEW_ANY$')))
  then
    TwDynTwList1.ParamByName('SHOW_ALL').asinteger:=3
  else
    TwDynTwList1.ParamByName('SHOW_ALL').asinteger:=TabControl1.TabIndex;


  TwDynTwList1.Open;
  TwDynTwList.LoadFromDataSet(TwDynTwList1, 0, lmCopy);
  TwDynTwList1.Close;



  if CurEditGroupID>0 then
  while not TwDynTwList.Eof do
  begin
    if TwDynTwList.FieldByName('TWDYNGROUP_ID').asinteger=CurEditGroupID then
      break;
    TwDynTwList.Next;
  end;

  TwDynTwList.EnableControls;
  ShowSost;
  save:=true;
end;


procedure TDIC_TW_DYN_GROUP.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TDIC_TW_DYN_GROUP.FormShow(Sender: TObject);
begin
     {Определяем местоположение}
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;

    chkTemporary.Enabled:=CHECK_DOSTUP('$DIC_TW_SET.DISABLE_TEMPORARY$');
    btnPrintPrice.Enabled:=(CHECK_USER_DOSTUP('PRICE_PRINT')<>-1); // Печать прайс-листа



    SELECTED_DYNTREE_ID:=-1;
    SELECTED_DYNTREE_TYP:=-1;
    SELECTED_DYNTREE_NAM:='';

    if btnSelect.Visible then
    begin
      CurEditGroupID:=btnSelect.tag;
      TabControl1.TabIndex:=2;
    end
    else
      CurEditGroupID:=-1;

    DYNTREE_TYP.ItemIndex:=0;
    SAVE:=true;



    loadList;
    SAVE:=true;    
    ShowSost;
end;

function TDIC_TW_DYN_GROUP.SAVE_TWTREE:integer;
var
        rr:integer;
begin
{           result:=-1;

           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
                IBSAVE_CLEAR;
                IBSAVE_ADD('TWTREE_FULL',Edit1.text);
                IBSAVE_ADD('TWKAT_ID',1);
                IBSAVE_ADD('PARENT_ID',BtnApply.tag);
                rr:=IBSAVE_DOC('TWTREE',Edit_DYN_TWTREE.tag);
                Datamodule1.IBTransaction2.Commit;
                SAVE_TWTREE:=rr;
           except
                Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
}
end;

procedure TDIC_TW_DYN_GROUP.BtnApplyClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_TWTREE then begin
                Newtag:=SAVE_TWTREE;
                if Newtag>=0 then begin
                        self.tag:=Newtag;
                        SAVE:=true;
                end;
        end;
end;

procedure TDIC_TW_DYN_GROUP.BtnSaveClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_TWTREE then begin
                Newtag:=SAVE_TWTREE;
                if Newtag>0 then begin
                        SAVE:=true;
                        self.tag:=NewTag;
                        close;
                end;
        end;
end;

procedure TDIC_TW_DYN_GROUP.DYNTWLIST_NAMEChange(Sender: TObject);
begin
        SAVE:=false;
end;

procedure TDIC_TW_DYN_GROUP.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        CanClose:=True;
        if not SAVE then if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения!',MessSubmit,4+48+256)<>6 then begin
                CanClose:=False;
        end;
end;

function TDIC_TW_DYN_GROUP.CHECK_TWTREE:boolean;
begin
        {Функция проверяет корректнойсть ввода}
        result:=true;
        if length(trim(DYNTWLIST_NAME.text))=0 then result:=false;
        if not result then messbox('Название раздела не может быть пустой строкой!','Некорректный ввод!',48);
end;

procedure TDIC_TW_DYN_GROUP.GetTwGroupClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     DIC_TOWAR.tag:=GetTwGroup.tag;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       save:=false;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_NAM FROM TWTREE_full(:TWTREE_ID, '''')');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=DIC_TOWAR.tag;
       QueryWork.Open;
       if not QueryWork.eof then
       begin
        memTwTree.DisableControls;
        memTwTree.Append;
        memTwTree.fieldbyname('twtree_id').asinteger:=DIC_TOWAR.tag;
        memTwTree.fieldbyname('twtree_nam').asstring:=QueryWork.fieldByname('TWTREE_NAM').asstring;
        memTwTree.fieldbyname('relation_id').asinteger:=-1;
        memTwTree.Post;
        memTwTree.EnableControls;
       end;
     end;

     ShowSost;


end;

procedure TDIC_TW_DYN_GROUP.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
  if (Field <> nil) then
  begin
   por := not por; //Изменяем статус сортировки
   Fld:=Field;
  //Собственно говоря это и есть та строка сортировки
  //Благодаря которой в Гриде мы сортируем
   memTwTree.SortOnFields(Field.FieldName, True, por);
  end;
end;

procedure TDIC_TW_DYN_GROUP.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  if field = fld then
   if por then SortMarker := smDown else SortMarker := smUp;
end;

procedure TDIC_TW_DYN_GROUP.ApplyClick(Sender: TObject);
var id: integer;
    i: integer;
    id2: integer;
    sWhere: string;
begin

  if DYNTREE_TYP.ItemIndex=0 then
  begin
    if  not chkTW_NAM.checked
    and not chkTWTREE_NAM.checked
    and not chkKTG.checked
    and not chklowprice.checked
    and not chkhiPrice.checked
    and not chkTW_SALER.checked
    and not chkGABARIT.checked
    and not chkTW_MADE.checked
    and not chkTW_LAND.checked
    then
    begin
      messbox('Нельзя сохранить набор, т.к. не задано ни одного условия', messSystem, 0);
      exit;
    end;

  end;



  memTwTree.DisableControls;
  memTw.DisableControls;

  try
        //шапка группы
        IBSAVE_CLEAR;
        IBSAVE_ADD('TWDYNGROUP_NAM', DYNTWLIST_NAME.Text);
        IBSAVE_ADD('USER_ID', USER_ID);
        IBSAVE_ADD('TWDYNGROUP_TYP', DYNTREE_TYP.itemIndex);
        IBSAVE_ADD('DYN_SQL', MakeDynSQL);

        IBSAVE_ADD('SKIP_GROUP_ID', tw_group_id);
        IBSAVE_ADD('SKIP_GROUP_TYP', tw_group_typ);


        if chkTemporary.Checked then IBSAVE_ADD('IS_TEMPORARY', 1)    else   IBSAVE_ADD('IS_TEMPORARY', 0);
        if chkPrivate.Checked   then IBSAVE_ADD('PRIVATE_MODE', 1)    else   IBSAVE_ADD('PRIVATE_MODE', 0);

        if chkGood.Checked then IBSAVE_ADD('SHOW_GOOD', 1)    else   IBSAVE_ADD('SHOW_GOOD', 0);
        if chkBrak.Checked   then IBSAVE_ADD('SHOW_BRAK', 1)    else   IBSAVE_ADD('SHOW_BRAK', 0);

        if chkRozn.Checked then IBSAVE_ADD('SHOW_ROZN', 1)    else   IBSAVE_ADD('SHOW_ROZN', 0);
        if chkOpt.Checked   then IBSAVE_ADD('SHOW_OPT', 1)    else   IBSAVE_ADD('SHOW_OPT', 0);



        id2:=IBSAVE_DOC('TWDYNGROUP', CurEditGroupID);


        //удаляем удаленное
        for i := 0 to DEL_CNT do
        begin
          IBDELETE_DOC('RELATION', DEL_ARR[i]);
        end;


       //сохраняем список групп
       memtwtree.First;
       while not memTwTree.Eof do
       begin
          if memtwTree.FieldByName('relation_id').asinteger<0 then
            begin
              IBSAVE_CLEAR;
              IBSAVE_ADD('RELATION_TYP', 1);  //1 - группы, 2 - товары
              IBSAVE_ADD('PARENT_ID', id2);
              IBSAVE_ADD('CHILD_ID', memtwTree.FieldByName('twtree_id').asinteger);
              id:=IBSAVE_DOC('RELATION', -1);
              if id <0 then raise Exception.Create('Ошибка охранения');

              memTwTree.Edit;
              memtwTree.FieldByName('relation_id').asinteger:=id;
              memTwTree.Post;
            end;
          memTwTree.Next;
       end;
       //сохраняем список товаров
       memtw.First;
       while not memTw.Eof do
       begin
          if memTw.FieldByName('relation_id').asinteger<0 then
            begin
              IBSAVE_CLEAR;
              IBSAVE_ADD('RELATION_TYP', 2);  //1 - группы, 2 - товары
              IBSAVE_ADD('PARENT_ID', id2);
              IBSAVE_ADD('CHILD_ID', memTw.FieldByName('tw_id').asinteger);
              id:=IBSAVE_DOC('RELATION', -1);
              if id <0 then raise Exception.Create('Ошибка охранения');

              memTw.Edit;
              memTw.FieldByName('relation_id').asinteger:=id;
              memTw.Post;
            end;
          memTw.Next;
       end;


       //сохраняем параметры запроса и формируем сам запрос
       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'TW_DYN_TW_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkTW_NAM.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkTW_NAM.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', TW_Nam.text); // значение элемента
       id:=IBSAVE_DOC('CFG', TW_NAM.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'TW_DYN_TW_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkTWTREE_NAM.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkTWTREE_NAM.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', TWTREE_Nam.text); // значение элемента
       id:=IBSAVE_DOC('CFG', TWTREE_NAM.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента


       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'TW_DYN_TW_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkKTG.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkKTG.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', KTG.Value); // значение элемента
       id:=IBSAVE_DOC('CFG', KTG.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'TW_DYN_TW_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chklowPrice.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chklowPrice.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', floattostr(lowPrice.Value)); // значение элемента
       id:=IBSAVE_DOC('CFG', lowPrice.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'TW_DYN_TW_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkhiPrice.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkhiPrice.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', floattostr(hiPrice.Value)); // значение элемента
       id:=IBSAVE_DOC('CFG', hiPrice.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'TW_DYN_TW_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkTW_SALER.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkTW_SALER.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', TW_SALER.Value); // значение элемента
       id:=IBSAVE_DOC('CFG', TW_SALER.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'TW_DYN_TW_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkGABARIT.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkGABARIT.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', GABARIT.ItemIndex); // значение элемента
       id:=IBSAVE_DOC('CFG', GABARIT.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'TW_DYN_TW_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkTW_MADE.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkTW_MADE.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', TW_MADE.text); // значение элемента
       id:=IBSAVE_DOC('CFG', TW_MADE.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'TW_DYN_TW_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkTW_LAND.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkTW_LAND.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', TW_LAND.text); // значение элемента
       id:=IBSAVE_DOC('CFG', TW_LAND.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента





       DataModule1.IBTransaction2.Commit;
       DEL_CNT:=0;


{
       TwDynTwList.Edit;
       TwDynTwList.FieldByName('TWDYNGROUP_NAM').AsString:=DYNTWLIST_NAME.Text;
       TwDynTwList.FieldByName('TWDYNGROUP_ID').AsInteger:=CurEditGroupID;
       TwDynTwList.post;
 }
       CurEditGroupID:=id2;
       SAVE:=true;
       LoadList;

  Except
    DataModule1.IBTransaction2.Rollback;
  end;

  memTwTree.EnableControls;
  memTw.EnableControls;
end;

procedure TDIC_TW_DYN_GROUP.TabControl1Change(Sender: TObject);
begin
  LoadList;
end;

procedure TDIC_TW_DYN_GROUP.btnNewClick(Sender: TObject);
begin
    if (((SAVE=false) and (btnApply.Enabled)) and (TWDynTWList.ControlsDisabled=false))
    then
    begin

        if Messbox('Данные были изменены. Сохранить изменения?', messsystem, MB_YESNO)=IDYES then
          btnApply.OnClick(nil);
    end;


  TabControl1.TabIndex:=0;
  LoadList;
  TwDynTwList.DisableControls;


  if not  TwDynTwList.Locate('TWDYNGROUP_ID', -1, [])  then
  begin
    TwDynTwList.Append;
    TwDynTwList.FieldByName('USER_ID').AsInteger:=USERID;
    TwDynTwList.FieldByName('TWDYNGROUP_ID').AsInteger:=-1;
    TwDynTwList.FieldByName('TWDYNGROUP_NAM').AsString:='_Новая_';
    TwDynTwList.Post;
    TwDynTwList.Last;
  end;
  TwDynTwList.EnableControls;
  SAVE:=true;
  LoadDynTWSet;
end;

procedure TDIC_TW_DYN_GROUP.BtnRefreshClick(Sender: TObject);
begin
  if SAVE=false then
    messBox('Данные были изменены... Возможно, будет выведен неверный набор товаров.'+chr(13)+'Для вывода верного набора товаров необходимо сначала сохранить изменения', messSystem, 0);


  Screen.Cursor:=crHourGlass;

  ResultTwSEt1.close;
  ResultTwSEt1.ParamByName('TYP').asinteger:=CurEditGroupTyp;
  ResultTwSEt1.ParamByName('ID').asinteger:=CurEditGroupID;
  ResultTwSEt1.Open;
  ResultTwSEt1.Close;
  ResultTwSEt.LoadFromDataSet(ResultTwSEt1, 0, lmCopy);
  Screen.Cursor:=crDefault;

  ShowSost;

end;

procedure TDIC_TW_DYN_GROUP.RxDBGrid3TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
  if (Field <> nil) then
  begin
   por1 := not por1; //Изменяем статус сортировки
   Fld1:=Field;
  //Собственно говоря это и есть та строка сортировки
  //Благодаря которой в Гриде мы сортируем
   ResultTwSet.SortOnFields(Field.FieldName, True, por1);
  end;
end;

procedure TDIC_TW_DYN_GROUP.RxDBGrid3GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  if field = fld1 then
   if por1 then SortMarker := smDown else SortMarker := smUp;
end;

procedure TDIC_TW_DYN_GROUP.DYNTREE_TYPChange(Sender: TObject);
begin
  CurEditGroupTyp:=DYNTREE_TYP.ItemIndex;
  SAVE:=false;

  
  case DYNTREE_TYP.ItemIndex of
  0: begin TabSheetUSL.TabVisible:=true; TabSheetTREE.TabVisible:=false; TabSheetTW.TabVisible:=false; end;
  1: begin TabSheetTREE.TabVisible:=true;  TabSheetUSL.TabVisible:=false; TabSheetTW.TabVisible:=false; end;
  2: begin TabSheetTW.TabVisible:=true;  TabSheetUSL.TabVisible:=false; TabSheetTREE.TabVisible:=false; end;
  end;
  PageControl1.ActivePageIndex:= DYNTREE_TYP.ItemIndex;
end;

procedure TDIC_TW_DYN_GROUP.GetTwClick(Sender: TObject);
var
   a:integer;
begin
     DicTowarSet:=5; {Ввод товаров из каталога товаров}
     CNT_TW:=0;
     DIC_TOWAR.showmodal;
     if CNT_TW>0 then begin
        SAVE:=false;
        for a:=1 to CNT_TW do
        begin
            save:=false;
            QueryWork.close;
            QueryWork.SQL.clear;
            QueryWork.SQL.add('select tw_id, tw_art, tw_nam, twtree_id, (select TWTREE_NAM FROM TWTREE_full(tw.TWTREE_ID, '''')) twtree_nam from tw where tw_id = :tw_id');
            QueryWork.ParamByname('TW_ID').asinteger:=ARR_TW[a].ID;
            QueryWork.Open;
            if not QueryWork.eof then
            begin
              memTw.DisableControls;
              memTw.Append;
              memTw.fieldbyname('twtree_id').asinteger:=QueryWork.fieldByname('TWTREE_ID').asinteger;
              memTw.fieldbyname('twtree_nam').asstring:=QueryWork.fieldByname('TWTREE_NAM').asstring;
              memTw.fieldbyname('tw_id').asinteger:=QueryWork.fieldByname('TW_ID').asinteger;
              memTw.fieldbyname('tw_art').asinteger:=QueryWork.fieldByname('TW_art').asinteger;
              memTw.fieldbyname('tw_nam').asstring:=QueryWork.fieldByname('TW_NAM').asstring;
              memTw.fieldbyname('relation_id').asinteger:=-1;
              memTw.Post;
              memTw.EnableControls;
            end;
        end;
     end;
     ShowSost;


end;

procedure TDIC_TW_DYN_GROUP.RxDBGrid4GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  if field = fld2 then
   if por2 then SortMarker := smDown else SortMarker := smUp;
end;

procedure TDIC_TW_DYN_GROUP.RxDBGrid4TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
  if (Field <> nil) then
  begin
   por2 := not por2; //Изменяем статус сортировки
   Fld2:=Field;
  //Собственно говоря это и есть та строка сортировки
  //Благодаря которой в Гриде мы сортируем
   MemTw.SortOnFields(Field.FieldName, True, por2);
  end;
end;

procedure TDIC_TW_DYN_GROUP.RxDBGrid2DblClick(Sender: TObject);
begin
  if BtnSelect.Visible then BtnSelect.Click;
end;

procedure TDIC_TW_DYN_GROUP.btnSelectClick(Sender: TObject);
begin
 {Выбор одного товара}
  if not Save then
    messbox('Данные были изменены. Сначала изменения необходимо сохранить', messSystem, 0)
  else
  begin
    SELECTED_DYNTREE_ID:=CurEditGroupID;
    SELECTED_DYNTREE_TYP:=CurEditGrouptyp;
    SELECTED_DYNTREE_NAM:=DYNTWLIST_NAME.Text;
    close;
  end;
end;

procedure TDIC_TW_DYN_GROUP.TWDynTWListAfterScroll(DataSet: TDataSet);
begin

  Timer1.Enabled:=false;
  Timer1.Enabled:=true;

//    CurEditGroupID:=TwDynTwList.FieldByName('TwDynGroup_ID').asinteger;
//    DYNTWLIST_NAME.Text:=TwDynTwList.FieldByName('TwDynGroup_NAM').asstring;
//    if not TwDynTwList.ControlsDisabled then
//      LoadDynTWSet;
//    ShowSost;
end;

procedure TDIC_TW_DYN_GROUP.btnDelTWTREEClick(Sender: TObject);
begin
  save:=false;
       if Messbox('Удалить группу "'+MemTWTREE.Fieldbyname('TWTREE_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then
       begin
        if MemTWTREE.Fieldbyname('RELATION_ID').asinteger>0 then
        begin
          DEL_ARR[DEL_CNT]:=MemTWTREE.Fieldbyname('RELATION_ID').asinteger;
          inc(DEL_CNT);
        end;
        MemTWTREE.delete;
     end;
  showSost;
end;

procedure TDIC_TW_DYN_GROUP.btnDELTWClick(Sender: TObject);
begin
  save:=false;
       if Messbox('Удалить товар "'+MemTW.Fieldbyname('TW_NAM').asstring+' '+MemTW.Fieldbyname('TW_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then
       begin
        if MemTW.Fieldbyname('RELATION_ID').asinteger>0 then
        begin
          DEL_ARR[DEL_CNT]:=MemTW.Fieldbyname('RELATION_ID').asinteger;
          inc(DEL_CNT);
        end;
        MemTW.delete;
     end;

     Showsost;
end;

procedure TDIC_TW_DYN_GROUP.ShowSost;
begin
  if chkTW_NAM.Checked then
    TW_NAM.enabled:=true else TW_NAM.Enabled:=false;
  if chkTWTREE_NAM.Checked then
    TWTREE_NAM.enabled:=true else TWTREE_NAM.Enabled:=false;
  if chkKTG.Checked then
    KTG.enabled:=true else KTG.Enabled:=false;
  if chklowPrice.Checked then
    lowPrice.enabled:=true else lowPrice.Enabled:=false;
  if chkhiPrice.Checked then
    hiPrice.enabled:=true else hiPrice.Enabled:=false;
  if chkTW_SALER.Checked then
    TW_SALER.enabled:=true else TW_SALER.Enabled:=false;
  if chkGABARIT.Checked then
    GABARIT.enabled:=true else GABARIT.Enabled:=false;
  if chkTW_MADE.Checked then
    TW_MADE.enabled:=true else TW_MADE.Enabled:=false;
  if chkTW_LAND.Checked then
    TW_LAND.enabled:=true else TW_LAND.Enabled:=false;

  btnNEW.Enabled:=CHECK_DOSTUP('$DIC_TW_SET.NEW$');

  btnAPPLY.Enabled:=((CHECK_DOSTUP('$DIC_TW_SET.NEW$')and (TWDYNTWLIST.FieldByName('USER_ID').asinteger=USERID)) or ((CHECK_DOSTUP('$DIC_TW_SET.EDIT_DEL_ANY$')))) ;
  btnDEL.Enabled:= ((CHECK_DOSTUP('$DIC_TW_SET.DEL$')) and (TWDYNTWLIST.FieldByName('USER_ID').asinteger=USERID)) or ((CHECK_DOSTUP('$DIC_TW_SET.EDIT_DEL_ANY$')));


  chkPrivate.Enabled:= ((CHECK_DOSTUP('$DIC_TW_SET.DISABLE_PRIVATE$')) and ((USER_ID=USERID) or (CHECK_DOSTUP('$DIC_TW_SET.EDIT_DEL_ANY$'))))  ;




  StatusBar1.Panels[0].Text:='Элементов: '+inttostr(MemTWTree.RecordCount);
  StatusBar2.Panels[0].Text:='Элементов: '+inttostr(MemTW.RecordCount);
  StatusBar3.Panels[0].Text:='Элементов: '+inttostr(ResultTWSet.RecordCount);
  StatusBar4.Panels[0].Text:='Элементов: '+inttostr(TwDynTwList.RecordCount);

end;

procedure TDIC_TW_DYN_GROUP.chkTW_NAMClick(Sender: TObject);
begin
  SAVE:=FALSE;
  ShowSost;
end;

procedure TDIC_TW_DYN_GROUP.chkTWTREE_NAMClick(Sender: TObject);
begin
  SAVE:=FALSE;
  ShowSost;
end;

procedure TDIC_TW_DYN_GROUP.chkKTGClick(Sender: TObject);
begin
  SAVE:=FALSE;
  ShowSost;
end;

procedure TDIC_TW_DYN_GROUP.chklowPriceClick(Sender: TObject);
begin
  SAVE:=FALSE;
  ShowSost;
end;

procedure TDIC_TW_DYN_GROUP.chkhiPriceClick(Sender: TObject);
begin
  SAVE:=FALSE;
  ShowSost;
end;

procedure TDIC_TW_DYN_GROUP.chkTW_SalerClick(Sender: TObject);
begin
  SAVE:=FALSE;
  ShowSost;
end;

procedure TDIC_TW_DYN_GROUP.chkGabaritClick(Sender: TObject);
begin
  SAVE:=FALSE;
  ShowSost;
end;

procedure TDIC_TW_DYN_GROUP.chkTW_MADEClick(Sender: TObject);
begin
  SAVE:=FALSE;
  ShowSost;
end;

procedure TDIC_TW_DYN_GROUP.chkTW_LANDClick(Sender: TObject);
begin
  SAVE:=FALSE;
  ShowSost;
end;

procedure TDIC_TW_DYN_GROUP.TW_NAMChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDIC_TW_DYN_GROUP.TWTREE_NAMChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDIC_TW_DYN_GROUP.KTGChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDIC_TW_DYN_GROUP.lowPriceChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDIC_TW_DYN_GROUP.hiPriceChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDIC_TW_DYN_GROUP.TW_SALERChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDIC_TW_DYN_GROUP.GabaritChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDIC_TW_DYN_GROUP.TW_MADEChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDIC_TW_DYN_GROUP.TW_LANDChange(Sender: TObject);
begin
  save:=false;
end;

procedure TDIC_TW_DYN_GROUP.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex=3
   then BtnRefresh.OnClick(sender);

end;

procedure TDIC_TW_DYN_GROUP.RxDBGrid2GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  if field = fld5 then
   if por5 then SortMarker := smDown else SortMarker := smUp;
end;

procedure TDIC_TW_DYN_GROUP.RxDBGrid2TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
  if (Field <> nil) then
  begin
   por5 := not por5; //Изменяем статус сортировки
   Fld5:=Field;
  //Собственно говоря это и есть та строка сортировки
  //Благодаря которой в Гриде мы сортируем
   TWDynTWList.SortOnFields(Field.FieldName, True, por5);
  end;
end;

procedure TDIC_TW_DYN_GROUP.btnDELClick(Sender: TObject);
var ID: integer;
begin
  {Проверяем, можно ли удалить}
  ID:=TWDYNTWLIST.fieldByname('TWDYNGROUP_ID').asinteger;
  if Messbox('Удалить набор товаров '+TWDYNTWLIST.fieldByname('TWDYNGROUP_NAM').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;

     try
        IBDELETE_DOC('TWDYNGROUP', ID);
        Datamodule1.IBTransaction2.Commit;
     Except
     on e: Exception do
       begin
         messbox(e.message, messError, 0);
         Datamodule1.IBTransaction2.RollBAck;
       end;
     End;

     Datamodule1.IBTransaction2.Active:=False;
     SAVE:=true;
     LoadList;
     TWDYNTWLIST.locate('TWDYNGROUP_ID',ID,[]);
  end;

end;

procedure TDIC_TW_DYN_GROUP.TWDynTWListBeforeScroll(DataSet: TDataSet);
begin
    if (((SAVE=false) and (btnApply.Enabled)) and (TWDynTWList.ControlsDisabled=false))
    then
    begin

        if Messbox('Данные были изменены. Сохранить изменения?', messsystem, MB_YESNO)=IDYES then
          btnApply.OnClick(nil);
    end

end;

procedure TDIC_TW_DYN_GROUP.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  LoadDynTWSet;
end;

procedure TDIC_TW_DYN_GROUP.btnPrintPriceClick(Sender: TObject);
begin
   Application.CreateForm(TPrint_PRICE,PRINT_PRICE);
   with PRINT_PRICE do
   begin

       tw_group_id:=CurEditGroupID;
       tw_group_typ:=CurEditGrouptyp;

       tw2.Checked:=true;
       btnDynDic.Enabled:=false;
       tw.Text:='* '+ DYNTWLIST_NAME.Text +' *'

   end;

   PRINT_PRICE.showModal;
   PRINT_PRICE.destroy;
end;

procedure TDIC_TW_DYN_GROUP.BtnDynDicClick(Sender: TObject);
var dic: TDIC_TW_DYN_GROUP;
begin
     Application.createForm(TDIC_TW_DYN_GROUP,dic);
     dic.btnSelect.visible:=true;
     if tw_group_typ<3 then
      dic.btnSelect.tag := tw_group_id;

     dic.showmodal;
     if dic.SELECTED_DYNTREE_ID>0 then
     begin
      chkSkipGroup.Checked:=true;
      tw.Text:='* '+ dic.SELECTED_DYNTREE_NAM +' *';
      tw_group_id:=dic.SELECTED_DYNTREE_ID;
      tw_group_typ:=dic.SELECTED_DYNTREE_TYP;
     end;
     dic.Destroy;
end;

procedure TDIC_TW_DYN_GROUP.BtnTWClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     if tw_group_typ=3 then
       DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       chkSkipGroup.Checked:=true;
       tw_group_id:=DIC_TOWAR.tag;
       tw_group_typ:=3;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
     end;
end;

procedure TDIC_TW_DYN_GROUP.chkSkipGroupClick(Sender: TObject);
begin
  if not chkSkipGroup.Checked then
  begin
    tw_group_id:=-1;
    tw_group_typ:=-1;
  end;

end;

procedure TDIC_TW_DYN_GROUP.btnCopyClick(Sender: TObject);
var groupid: Integer;
begin

groupid:=RxDBGrid2.DataSource.DataSet.FieldByName('TWDYNGROUP_ID').asInteger;

if groupid=0 then
  exit;

  datamodule1.IbSaveSQL.SQL.Text:='execute procedure COPY_TW_DYN_GROUP(:group_id, :user_id)';
  datamodule1.IbSaveSQL.ParamByName('group_id').asInteger:=groupid;
  datamodule1.IbSaveSQL.ParamByName('user_id').asInteger:=userid;
  datamodule1.IbSaveSQL.ExecSQL;

  datamodule1.IbSaveSQL.Transaction.Commit;

  LoadList;

end;

end.


