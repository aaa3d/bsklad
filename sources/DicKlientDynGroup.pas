unit DicKlientDynGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,Data1, Db, IBCustomDataSet, IBQuery,DicKlient,B_DButils,
  B_utils, IBDatabase, ToolWin, Mask, ToolEdit, CurrEdit, Grids, RXGrids,
  DBGrids, RXDBCtrl, RxMemDS, RxLookup, RxDBComb;

type
  TDIC_Klient_DYN_GROUP = class(TForm)
    QueryWork: TIBQuery;
    WorkTransaction: TIBTransaction;
    memKlnTree: TRxMemoryData;
    dsKlnTree: TDataSource;
    TabControl1: TTabControl;
    RxDBGrid2: TRxDBGrid;
    DsKlnDynList: TDataSource;
    KLNDynKlnList1: TIBQuery;
    Splitter1: TSplitter;
    KlnDynListTr: TIBTransaction;
    ResultKlnSet1: TIBQuery;
    trResultKlnSet: TIBTransaction;
    dsResultKlnSet: TDataSource;
    ResultKlnSet: TRxMemoryData;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    BtnApply: TToolButton;
    btnNew: TToolButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheetTREE: TTabSheet;
    Label2: TLabel;
    ToolBar2: TToolBar;
    GetGroup: TToolButton;
    btnDelKlnTREE: TToolButton;
    RxDBGrid1: TRxDBGrid;
    TabSheetTW: TTabSheet;
    ToolBar3: TToolBar;
    GetKln: TToolButton;
    btnDELKln: TToolButton;
    RxDBGrid4: TRxDBGrid;
    TabSheetRESULT: TTabSheet;
    RxDBGrid3: TRxDBGrid;
    ToolBar4: TToolBar;
    BtnRefresh: TToolButton;
    TabSheetUSL: TTabSheet;
    chkKLN_NAM: TCheckBox;
    chkKLN_GR: TCheckBox;
    chkKAT: TCheckBox;
    KLN_NAM: TEdit;
    KLN_GR: TEdit;
    DYNTREE_TYP: TComboBox;
    chkTemporary: TCheckBox;
    DYNKlnLIST_NAME: TEdit;
    chkPrivate: TCheckBox;
    Label1: TLabel;
    Label3: TLabel;
    dsKln: TDataSource;
    memKln: TRxMemoryData;
    StatusBar1: TStatusBar;
    StatusBar2: TStatusBar;
    StatusBar3: TStatusBar;
    btnSelect: TToolButton;
    ToolButton7: TToolButton;
    KlnDynKlnList: TRxMemoryData;
    KlnDynKlnListTWDYNGROUP_NAM: TIBStringField;
    KlnDynKlnListKLNDYNGROUP_ID: TIntegerField;
    btnDEL: TToolButton;
    ToolButton9: TToolButton;
    StatusBar4: TStatusBar;
    KLNDynKlnList1US_NAME: TIBStringField;
    KlnDynKlnListUS_NAME: TIBStringField;
    KLNDynKlnList1USER_ID: TIntegerField;
    KlnDynKlnListUSER_ID: TIntegerField;
    Timer1: TTimer;
    chkGor: TCheckBox;
    chkSumKred: TCheckBox;
    chkKrZapr: TCheckBox;
    chkLo: TCheckBox;
    chkVidD: TCheckBox;
    chkPok: TCheckBox;
    chkPos: TCheckBox;
    chkPersSk: TCheckBox;
    chkOPPok: TCheckBox;
    chkSumDogPosM: TCheckBox;
    chkOPPos: TCheckBox;
    ResultKlnSet1KLN_ID: TIntegerField;
    ResultKlnSet1KLN_NAME: TIBStringField;
    ResultKlnSetKLN_NAME: TIBStringField;
    ResultKlnSetKLNTREE_NAM: TIBStringField;
    memKlnTreerelation_id: TIntegerField;
    memKlnTreeklntree_id: TIntegerField;
    memKlnTreeklntree_nam: TStringField;
    memKlnrelation_id: TIntegerField;
    memKlnklntree_id: TIntegerField;
    memKlnklntree_nam: TStringField;
    memKlnkln_id: TIntegerField;
    memKlnkln_nam: TStringField;
    KLNDynKlnList1KLNDYNGROUP_ID: TIntegerField;
    KLNDynKlnList1KLNDYNGROUP_NAM: TIBStringField;
    Gor: TEdit;
    SumKred: TRxCalcEdit;
    PersSk: TRxCalcEdit;
    OPPos: TRxCalcEdit;
    OPPok: TRxCalcEdit;
    SumDogPosM: TRxCalcEdit;
    Lo: TComboBox;
    KAT: TComboBox;
    Pok: TComboBox;
    Pos: TComboBox;
    VidD: TRxDBLookupCombo;
    kln_worktyp: TIBQuery;
    kln_worktypKLN_WORKTYPE_ID: TIntegerField;
    kln_worktypKLN_WORKTYPE_NAME: TIBStringField;
    kln_worktypTM: TDateTimeField;
    ds_kln_worktyp: TDataSource;
    chkSumDogPosB: TCheckBox;
    SumDogPosB: TRxCalcEdit;
    KrZapr: TEdit;
    ResultKlnSet1KLNTREE_NAM: TIBStringField;
    ResultKlnSetKLN_ID: TIntegerField;
    chkSumKredM: TCheckBox;
    SumKredM: TRxCalcEdit;
    chkForOp: TCheckBox;
    ForOp: TComboBox;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure DYNKlnLIST_NAMEChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function CHECK_KLNTREE:boolean;
    procedure GetGroupClick(Sender: TObject);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure ApplyClick(Sender: TObject);
    procedure LoadList;
    procedure LoadDynKlnSet;
    procedure TabControl1Change(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure RxDBGrid3TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure RxDBGrid3GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure DYNTREE_TYPChange(Sender: TObject);
    procedure GetKlnClick(Sender: TObject);
    procedure RxDBGrid4GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid4TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure KlnDynKlnListAfterScroll(DataSet: TDataSet);
    procedure btnDelKlnTREEClick(Sender: TObject);
    procedure btnDELKlnClick(Sender: TObject);
    procedure ShowSost;
    procedure chkKln_NAMClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RxDBGrid2GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid2TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure btnDELClick(Sender: TObject);
    procedure KlnDynKlnListBeforeScroll(DataSet: TDataSet);
    function MakeDynSQL: string;
    procedure Timer1Timer(Sender: TObject);
    procedure KLN_NAMChange(Sender: TObject);
    procedure KLN_GRChange(Sender: TObject);
    procedure GorChange(Sender: TObject);
    procedure SumKredChange(Sender: TObject);
    procedure KATChange(Sender: TObject);
    procedure PersSkChange(Sender: TObject);
    procedure OPPokChange(Sender: TObject);
    procedure OPPosChange(Sender: TObject);
    procedure SumDogPosMChange(Sender: TObject);
    procedure SumDogPosBChange(Sender: TObject);
    procedure LoChange(Sender: TObject);
    procedure VidDChange(Sender: TObject);
    procedure PokChange(Sender: TObject);
    procedure PosChange(Sender: TObject);
    procedure chkKrZaprClick(Sender: TObject);
    procedure chkSumKredClick(Sender: TObject);
    procedure chkKATClick(Sender: TObject);
    procedure chkLoClick(Sender: TObject);
    procedure chkVidDClick(Sender: TObject);
    procedure chkPokClick(Sender: TObject);
    procedure chkPosClick(Sender: TObject);
    procedure chkSumKredMClick(Sender: TObject);
    procedure chkForOpClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
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
  public
    { Public declarations }
    SELECTED_DYNTREE_ID: integer;
    SELECTED_DYNTREE_TYP: integer;
    SELECTED_DYNTREE_NAM: string;
  end;

var
  DIC_Klient_DYN_GROUP: TDIC_Klient_DYN_GROUP;


implementation

uses Mainform, PrintPrice;

{$R *.DFM}

function TDIC_Klient_DYN_GROUP.MakeDynSQL: string;
var sWhere,s: string;
begin
 sWhere:='';


       //Формируем критерии запроса   BS
       if  chkKLN_NAM.checked then sWhere := sWhere+' AND upper((select kln_full from kln_data(kln.kln_id))) LIKE(upper(''%'+stringreplace(KLN_NAM.text,'''', '', [rfReplaceAll])+'%''))';
       if  chkKLN_GR.checked then sWhere := sWhere+' AND upper((select klntree_nam from klntree_full(kln.klntree_id,''''))) LIKE(upper(''%'+stringreplace(KLN_GR.text,'''', '', [rfReplaceAll])+'%''))';

       if  chkKAT.checked then sWhere := sWhere+' AND propkln.typ=2 AND propkln.valueint='+inttostr(strtoint( copy( KAT.Items[KAT.itemindex], length(KAT.Items[KAT.ItemIndex])-1, 2)));

       if  chkGOR.checked then sWhere := sWhere+' AND upper(kln.kln_org_city) LIKE(upper(''%'+stringreplace(Gor.text,'''', '', [rfReplaceAll])+'%''))';

       if  chkKrZapr.checked then sWhere := sWhere+' AND kln.kln_credit1=-1.0';
       if  chkSumKred.checked then sWhere := sWhere+' AND kln.kln_credit1>='+floattostr(SumKred.Value);
       if  chkSumKredM.checked then sWhere := sWhere+' AND kln.kln_credit1<='+floattostr(SumKredM.Value);

       if  chkLo.checked then sWhere := sWhere+' AND propkln.typ=3 AND propkln.valueint='+inttostr(strtoint(copy(Lo.Items[Lo.itemindex], length(Lo.Items[Lo.ItemIndex])-1, 2)));
       if  chkVidD.checked then sWhere := sWhere+' AND propkln.typ=4 AND propkln.valueint='+(VidD.Value);

       if  chkPok.checked then sWhere := sWhere+' AND propkln.typ=5 AND propkln.valueint='+Inttostr(strtoint(copy(Pok.Items[Pok.itemindex], length(Pok.Items[Pok.ItemIndex])-1, 2)));
       if  chkPos.checked then sWhere := sWhere+' AND propkln.typ=6 AND propkln.valueint='+inttostr(strtoint(copy(Pos.Items[Pos.itemindex], length(Pos.Items[Pos.ItemIndex])-1, 2)));

       if  chkForOp.checked then sWhere := sWhere+' AND propkln.typ=11 AND propkln.valueint='+inttostr(strtoint(copy(ForOp.Items[ForOp.itemindex], length(ForOp.Items[ForOp.ItemIndex])-1, 2)));

       if  chkPersSk.checked then sWhere := sWhere+' AND propkln.typ=7 AND propkln.valueint='+floattostr(PersSk.Value);
       if  chkOPPok.checked then sWhere := sWhere+' AND propkln.typ=8 AND propkln.valueint='+floattostr(OPPok.Value);
       if  chkOPPos.checked then sWhere := sWhere+' AND propkln.typ=9 AND propkln.valueint='+floattostr(OPPos.Value);

       if  chkSumDogPosM.checked then sWhere := sWhere+' AND propkln.typ=10 AND propkln.valueint<'+floattostr(SumDogPosM.Value);
       if  chkSumDogPosB.checked then sWhere := sWhere+' AND propkln.typ=10 AND propkln.valueint>'+floattostr(SumDogPosB.Value);

       if (chkKAT.checked) or
          (chkLo.checked) or
          (chkVidD.checked) or
          (chkPok.checked) or
          (chkPos.checked) or
          (chkForOp.checked) or
          (chkPersSk.checked) or
          (chkOPPok.checked) or
          (chkOPPos.checked) or
          (chkSumDogPosM.checked) or
          (chkSumDogPosB.checked)
       then
         result:=' SELECT kln.kln_id, (select kln_full from kln_data(kln.kln_id)),'+
                 '(select klntree_nam from klntree_full(kln.klntree_id,'''')) '+
                 'from kln, PropKln WHERE kln.kln_id=propkln.kln_id ' +sWhere
       else
         result:=' SELECT kln.kln_id, (select kln_full from kln_data(kln.kln_id)),'+
                 '(select klntree_nam from klntree_full(kln.klntree_id,'''')) '+
                 'from kln WHERE 1=1 '+sWhere;

end;

procedure TDIC_Klient_DYN_GROUP.LoadDynKlnSet;
begin
    DEL_CNT:=0;
    CurEditGroupTyp:=1;

    memKlnTree.EmptyTable;
    memKln.EmptyTable;
    ResultKlnSet.EmptyTable;


    Kln_NAM.Tag:=-1;
    Kln_GR.Tag:=-1;
    KAT.Tag:=-1;
    Gor.Tag:=-1;
    KrZapr.Tag:=-1;
    SumKred.Tag:=-1;
    Lo.Tag:=-1;
    VidD.Tag:=-1;
    Pok.Tag:=-1;
    Pos.Tag:=-1;
    ForOp.Tag:=-1;
    PersSk.Tag:=-1;
    OPPok.Tag:=-1;
    OPPos.Tag:=-1;
    SumDogPosM.Tag:=-1;
    SumDogPosB.Tag:=-1;

    Kln_NAM.Text:='';
    Kln_GR.Text:='';
    KAT.ItemIndex:=-1;
    Gor.Text:='';
    SumKred.Value:=0;
    Lo.ItemIndex:=-1;
    VidD.Value:='';
    Pok.ItemIndex:=-1;
    Pos.ItemIndex:=-1;
    ForOp.ItemIndex:=-1;
    PersSk.Value:=0;
    OPPok.Value:=0;
    OPPos.Value:=0;
    SumDogPosM.Value:=0;
    SumDogPosB.Value:=0;

    chkKln_NAM.Checked:=false;
    chkKln_GR.Checked:=false;
    chkKAT.Checked:=false;
    chkGor.Checked:=false;
    chkSumKred.Checked:=false;
    chkLo.Checked:=false;
    chkVidD.Checked:=false;
    chkPok.Checked:=false;
    chkPos.Checked:=false;
    chkForOp.Checked:=false;
    chkPersSk.Checked:=false;
    chkOPPok.Checked:=false;
    chkOPPos.Checked:=false;
    chkSumDogPosM.Checked:=false;
    chkSumDogPosB.Checked:=false;


    CurEditGroupID:=KlnDynKlnList.FieldByName('KlnDYNGROUP_ID').asinteger;

    WorkTransaction.Active:=False;
    QueryWork.close;
    if CurEditGroupID<=0 then
    begin
      DYNKLNLIST_NAME.Text:=KlnDynKlnList.FieldByName('KlnDynGroup_NAM').asstring;
      USER_ID:=KlnDynKlnList.FieldByName('USER_ID').asinteger;
      DYNTREE_TYP.ItemIndex:=0;
      DYNTREE_TYP.OnChange(nil);
      DYNTREE_TYP.Enabled:=true;

      chkTemporary.checked:=true;
      chkPrivate.checked:=true;


    end
    else
    begin
      DYNTREE_TYP.Enabled:=false;
      QueryWork.SQL.clear;
      Querywork.sql.Text:='SELECT * FROM KLIENTDYNGROUP WHERE KLIENTDYNGROUP_ID=:ID';
      QueryWork.Parambyname('ID').asinteger:=CurEditGroupID;
      QueryWork.open;
      if not QueryWork.eof then
      begin

          DYNKLNLIST_NAME.text:=QueryWork.fieldbyname('klientdyngroup_nam').asstring;
          USER_ID:=QueryWork.fieldbyname('user_id').asinteger;
          DYNTREE_TYP.ItemIndex:=QueryWork.fieldbyname('klientdyngroup_typ').asinteger;
          DYNTREE_TYPChange(self);

          if QueryWork.fieldbyname('is_temporary').asinteger=0 then  chkTemporary.checked:=false  else chkTemporary.checked:=TRUE;
          if QueryWork.fieldbyname('private_mode').asinteger=0 then  chkPrivate.checked:=false  else chkPrivate.checked:=TRUE;


          queryWork.close;

          //Грузим список групп
          Querywork.SQL.Text:='select relationklient.relationKLIENT_id, relationklient.child_id, (select klntree_nam from klntree_full(klntree.klntree_id, '''')) klntree_nam1 '+
          'from relationklient, klntree where relationklient.relation_typ=1 and relationklient.parent_id=:ID and klntree.klntree_id=relationklient.child_id';
          QueryWork.Parambyname('ID').asinteger:=CurEditGroupID;
          QueryWork.open;


          while not querywork.Eof do
          begin
            memklntree.Append;
            memklntree.FieldByName('relation_id').asinteger:=querywork.FieldByName('relationklient_id').asinteger;
            memklntree.FieldByName('klntree_id').asinteger:=querywork.FieldByName('child_id').asinteger;
            memklntree.FieldByName('klntree_nam').asstring:=querywork.FieldByName('klntree_nam1').asstring;
            memklntree.Post;
            querywork.Next;
          end;
          QueryWork.close;


          queryWork.close;

          //Грузим список клиентов
          Querywork.SQL.Text:='select relationklient.relationKLIENT_id, kln.kln_id, ((select kln_full from kln_data(kln.kln_id))) as kln_name, kln.klntree_id,  (select klntree_nam from klntree_full(klntree.klntree_id, '''')) klntree_nam '+
          'from relationklient, klntree, kln where relationklient.parent_id=:ID and klntree.klntree_id=kln.klntree_id  and relationklient.relation_typ=2 and kln.kln_id = relationklient.child_id';
          QueryWork.Parambyname('ID').asinteger:=CurEditGroupID;
          QueryWork.open;


          while not querywork.Eof do
          begin
            memkln.Append;
            memkln.FieldByName('relation_id').asinteger:=querywork.FieldByName('relationklient_id').asinteger;
            memkln.FieldByName('klntree_id').asinteger:=querywork.FieldByName('klntree_id').asinteger;
            memkln.FieldByName('klntree_nam').asstring:=querywork.FieldByName('klntree_nam').asstring;
            memkln.FieldByName('kln_id').asinteger:=querywork.FieldByName('kln_id').asinteger;
            memkln.FieldByName('kln_nam').asstring:=querywork.FieldByName('kln_name').asstring;
            memkln.Post;
            querywork.Next;
          end;
          QueryWork.close;

          //Грузим условия товара
          Querywork.SQL.Text:='select * from CFG WHERE CFG_SET1=:ID and CFG_NAME=''KLN_DYN_KLN_LIST_PROP''';
          QueryWork.Parambyname('ID').asinteger:=CurEditGroupID;
          QueryWork.open;

          while not QueryWork.Eof do
          begin

           case QueryWork.fieldbyname('CFG_SET3').asinteger of
           1: begin
               chkKln_Nam.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               KLN_NAM.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkKln_Nam.Checked then
                 KLN_Nam.text:=QueryWork.fieldbyname('CFG_VALUE').asstring;
              end;
           2: begin
               chkKLN_GR.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               KLN_GR.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkKLN_GR.Checked then
                 KLN_GR.text:=QueryWork.fieldbyname('CFG_VALUE').asstring;
              end;
           3: begin
               chkKAT.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               KAT.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkKAT.Checked then
                 KAT.ItemIndex:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           4: begin
               chkGor.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               Gor.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkGor.Checked then
                 Gor.Text:=QueryWork.fieldbyname('CFG_VALUE').asstring;
              end;
           5: begin
               chkKrZapr.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               KrZapr.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
              end;
           6: begin
               chkSumKred.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               SumKred.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkSumKred.Checked then
                 SumKred.value:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           61: begin
               chkSumKredM.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               SumKredM.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkSumKredM.Checked then
                 SumKredM.value:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           7: begin
               chkLo.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               Lo.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkLo.Checked then
                 Lo.ItemIndex:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           8: begin
               chkVidD.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               VidD.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkVidD.Checked then
                 VidD.value:=QueryWork.fieldbyname('CFG_VALUE').asstring;
              end;
           9: begin
               chkPok.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               Pok.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkPok.Checked then
                 Pok.ItemIndex:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           10: begin
               chkPos.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               Pos.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkPos.Checked then
                 Pos.ItemIndex:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           11: begin
               chkPersSk.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               PersSk.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkPersSk.Checked then
                 PersSk.Value:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           12: begin
               chkOPPok.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               OPPok.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkOPPok.Checked then
                 OPPok.Value:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           13: begin
               chkOPPos.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               OPPos.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkOPPos.Checked then
                 OPPos.Value:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           14: begin
               chkSumDogPosM.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               SumDogPosM.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkSumDogPosM.Checked then
                 SumDogPosM.Value:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           15: begin
               chkSumDogPosB.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               SumDogPosB.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkSumDogPosB.Checked then
                 SumDogPosB.Value:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           16: begin
               chkForOp.Checked:=StrToBoolean(QueryWork.fieldbyname('CFG_SET2').asstring);
               ForOp.tag:=QueryWork.fieldbyname('CFG_ID').asinteger;
               if chkForOp.Checked then
                 ForOp.ItemIndex:=QueryWork.fieldbyname('CFG_VALUE').asinteger;
              end;
           end;



            QueryWork.Next;
          end;
          QueryWork.close;

      end;


    end;



   SAVE:=true;
   Showsost;
end;


procedure TDIC_Klient_DYN_GROUP.LoadList;
begin

   if (((SAVE=false) and (btnApply.Enabled)) and (KlnDynKlnList.ControlsDisabled=false))
    then
    begin

        if Messbox('Данные были изменены. Сохранить изменения?', messsystem, MB_YESNO)=IDYES then
          btnApply.OnClick(nil);
    end;


  KlnDynKlnList.DisableControls;

  KlnDynKlnList1.close;
  KlnDynKlnList1.ParamByName('USER_ID').asinteger:=USERID;

  if ((TabControl1.TabIndex=2) and (Check_dostup('$DIC_KLN_SET.VIEW_ANY$')))
  then
    KlnDynKlnList1.ParamByName('SHOW_ALL').asinteger:=3
  else
    KlnDynKlnList1.ParamByName('SHOW_ALL').asinteger:=TabControl1.TabIndex;


  klnDynKlnList1.Open;
  KlnDynKlnList.LoadFromDataSet(klnDynKlnList1, 0, lmCopy);
  KlnDynKlnList1.Close;



  if CurEditGroupID>0 then
  while not KlnDynKlnList.Eof do
  begin
    if KlnDynKlnList.FieldByName('KLNDYNGROUP_ID').asinteger=CurEditGroupID then
      break;
    KlnDynKlnList.Next;
  end;

  KlnDynKlnList.EnableControls;
  ShowSost;
  save:=true;
end;


procedure TDIC_Klient_DYN_GROUP.BtnCloseClick(Sender: TObject);
begin
     kln_worktyp.Close;
     close;
end;

procedure TDIC_Klient_DYN_GROUP.FormShow(Sender: TObject);
begin
     {Определяем местоположение}
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.Width;
     Height:=Screen.Height-Main_Form.Top-22-28;

    chkTemporary.Enabled:=CHECK_DOSTUP('$DIC_KLN_SET.DISABLE_TEMPORARY$');



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

procedure TDIC_Klient_DYN_GROUP.BtnApplyClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_KLNTREE then begin
//                Newtag:=SAVE_TWTREE;
                if Newtag>=0 then begin
                        self.tag:=Newtag;
                        SAVE:=true;
                end;
        end;
end;

procedure TDIC_Klient_DYN_GROUP.BtnSaveClick(Sender: TObject);
var
        Newtag:integer;
begin
        if CHECK_KLNTREE then begin
//                Newtag:=SAVE_TWTREE;
                if Newtag>0 then begin
                        SAVE:=true;
                        self.tag:=NewTag;
                        close;
                end;
        end;
end;

procedure TDIC_Klient_DYN_GROUP.DYNKlnLIST_NAMEChange(Sender: TObject);
begin
        SAVE:=false;
end;

procedure TDIC_Klient_DYN_GROUP.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
        CanClose:=True;
        if not SAVE then if Messbox('Данные были изменены! Вы подтверждаете выход без сохранения!',MessSubmit,4+48+256)<>6 then begin
                CanClose:=False;
        end;
end;

function TDIC_Klient_DYN_GROUP.CHECK_KlnTREE:boolean;
begin
        {Функция проверяет корректнойсть ввода}
        result:=true;
        if length(trim(DYNKlnLIST_NAME.text))=0 then result:=false;
        if not result then messbox('Название раздела не может быть пустой строкой!','Некорректный ввод!',48);
end;

procedure TDIC_Klient_DYN_GROUP.GetGroupClick(Sender: TObject);
begin
     DicKlnSet:=3; {Ввод одной группы товаров}
     DIC_Klient.tag:=GetGroup.tag;
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_Klient.showmodal;
     if DIC_Klient.tag>0 then begin
       {Отображаем название}
       save:=false;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select KLNTREE_NAM FROM KLNTREE_full(:KLNTREE_ID, '''')');
       QueryWork.ParamByname('KLNTREE_ID').asinteger:=DIC_Klient.tag;
       QueryWork.Open;
       if not QueryWork.eof then
       begin
        memKlnTree.DisableControls;
        memKlnTree.Append;
        memKlnTree.fieldbyname('klntree_id').asinteger:=DIC_Klient.tag;
        memKlnTree.fieldbyname('klntree_nam').asstring:=QueryWork.fieldByname('KLNTREE_NAM').asstring;
        memKlnTree.fieldbyname('relation_id').asinteger:=-1;
        memKlnTree.Post;
        memKlnTree.EnableControls;
       end;
     end;

     DIC_KLIENT.Destroy;

     ShowSost;


end;

procedure TDIC_Klient_DYN_GROUP.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
  if (Field <> nil) then
  begin
   por := not por; //Изменяем статус сортировки
   Fld:=Field;
  //Собственно говоря это и есть та строка сортировки
  //Благодаря которой в Гриде мы сортируем
   memKlnTree.SortOnFields(Field.FieldName, True, por);
  end;
end;

procedure TDIC_Klient_DYN_GROUP.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  if field = fld then
   if por then SortMarker := smDown else SortMarker := smUp;
end;

procedure TDIC_Klient_DYN_GROUP.ApplyClick(Sender: TObject);
var id: integer;
    i: integer;
    id2: integer;
    sWhere: string;
begin

  if DYNTREE_TYP.ItemIndex=0 then
  begin
    if not chkKLN_NAM.checked
      and not chkKLN_GR.checked
      and not chkKAT.checked
      and not chkGOR.checked
      and not chkSumKred.checked
      and not chkKrZapr.checked
      and not chkLo.checked
      and not chkVidD.checked
      and not chkPok.checked
      and not chkPos.checked
      and not chkForOp.checked
      and not chkPersSk.checked
      and not chkOPPok.checked
      and not chkOPPos.checked
      and not chkSumDogPosM.checked
      and not chkSumDogPosB.checked
    then
    begin
      messbox('Нельзя сохранить набор, т.к. не задано ни одного условия', messSystem, 0);
      exit;
    end;

  end;



  memKlnTree.DisableControls;
  memKln.DisableControls;

  try
        //шапка группы
        IBSAVE_CLEAR;
        IBSAVE_ADD('KLIENTDYNGROUP_NAM', DYNKlnLIST_NAME.Text);
        IBSAVE_ADD('USER_ID', USER_ID);
        IBSAVE_ADD('KLIENTDYNGROUP_TYP', DYNTREE_TYP.itemIndex);
        if DYNTREE_TYP.ItemIndex=0 then
          IBSAVE_ADD('DYN_SQL', MakeDynSQL)
        else IBSAVE_ADD('DYN_SQL','');

        if chkTemporary.Checked then IBSAVE_ADD('IS_TEMPORARY', 1)    else   IBSAVE_ADD('IS_TEMPORARY', 0);
        if chkPrivate.Checked   then IBSAVE_ADD('PRIVATE_MODE', 1)    else   IBSAVE_ADD('PRIVATE_MODE', 0);


        id2:=IBSAVE_DOC('KLIENTDYNGROUP', CurEditGroupID);


        //удаляем удаленное
        for i := 0 to DEL_CNT-1 do
        begin
          IBDELETE_DOC('RELATIONKLIENT', DEL_ARR[i]);
        end;


       //сохраняем список групп
       memKlntree.First;
       while not memKlnTree.Eof do
       begin
          if memKlnTree.FieldByName('relation_id').asinteger<0 then
            begin
              IBSAVE_CLEAR;
              IBSAVE_ADD('RELATION_TYP', 1);  //1 - группы, 2 - товары
              IBSAVE_ADD('PARENT_ID', id2);
              IBSAVE_ADD('CHILD_ID', memKlnTree.FieldByName('Klntree_id').asinteger);
              id:=IBSAVE_DOC('RELATIONKLIENT', -1);
              if id <0 then raise Exception.Create('Ошибка охранения');

              memKlnTree.Edit;
              memKlnTree.FieldByName('relation_id').asinteger:=id;
              memKlnTree.Post;
            end;
          memKlnTree.Next;
       end;
       //сохраняем список товаров
       memKln.First;
       while not memKln.Eof do
       begin
          if memKln.FieldByName('relation_id').asinteger<0 then
            begin
              IBSAVE_CLEAR;
              IBSAVE_ADD('RELATION_TYP', 2);  //1 - группы, 2 - товары
              IBSAVE_ADD('PARENT_ID', id2);
              IBSAVE_ADD('CHILD_ID', memKln.FieldByName('kln_id').asinteger);
              id:=IBSAVE_DOC('RELATIONKLIENT', -1);
              if id <0 then raise Exception.Create('Ошибка охранения');

              memKln.Edit;
              memKln.FieldByName('relation_id').asinteger:=id;
              memKln.Post;
            end;
          memKln.Next;
       end;

       if DYNTREE_TYP.ItemIndex=0 then
       begin
       //сохраняем параметры запроса и формируем сам запрос
       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkKLN_NAM.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkKLN_NAM.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', Kln_Nam.text); // значение элемента
       id:=IBSAVE_DOC('CFG', KLN_NAM.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkKLN_GR.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkKLN_GR.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', KLN_GR.text); // значение элемента
       id:=IBSAVE_DOC('CFG', KLN_GR.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента


       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkKAT.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkKAT.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', KAT.ItemIndex); // значение элемента
       id:=IBSAVE_DOC('CFG', KAT.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkGor.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkGor.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', Gor.Text); // значение элемента
       id:=IBSAVE_DOC('CFG', Gor.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkKrZapr.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkKrZapr.tag); // код элемента
       id:=IBSAVE_DOC('CFG', KrZapr.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkSumKred.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkSumKred.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', floattostr(SumKred.Value)); // значение элемента
       id:=IBSAVE_DOC('CFG', SumKred.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkSumKredM.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkSumKredM.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', floattostr(SumKredM.Value)); // значение элемента
       id:=IBSAVE_DOC('CFG', SumKredM.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkLo.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkLo.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', Lo.ItemIndex); // значение элемента
       id:=IBSAVE_DOC('CFG', Lo.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkVidD.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkVidD.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', (VidD.Value)); // значение элемента
       id:=IBSAVE_DOC('CFG', VidD.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkPok.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkPok.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', Pok.ItemIndex); // значение элемента
       id:=IBSAVE_DOC('CFG', Pok.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkPos.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkPos.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', Pos.ItemIndex); // значение элемента
       id:=IBSAVE_DOC('CFG', Pos.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkForOp.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkForOp.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', ForOp.ItemIndex); // значение элемента
       id:=IBSAVE_DOC('CFG', ForOp.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkPersSk.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkPersSk.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', floattostr(PersSk.Value)); // значение элемента
       id:=IBSAVE_DOC('CFG', PersSk.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkOPPok.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkOPPok.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', floattostr(OPPok.Value)); // значение элемента
       id:=IBSAVE_DOC('CFG', OPPok.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkOPPos.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkOPPos.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', floattostr(OPPos.Value)); // значение элемента
       id:=IBSAVE_DOC('CFG', OPPos.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkSumDogPosM.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkSumDogPosM.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', floattostr(SumDogPosM.Value)); // значение элемента
       id:=IBSAVE_DOC('CFG', SumDogPosM.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента

       IBSAVE_CLEAR;
       IBSAVE_ADD('CFG_NAME', 'KLN_DYN_KLN_LIST_PROP');
       IBSAVE_ADD('CFG_SET1', id2);  //код группы
       IBSAVE_ADD('CFG_SET2', chkSumDogPosB.checked); // включено или нет
       IBSAVE_ADD('CFG_SET3', chkSumDogPosB.tag); // код элемента
       IBSAVE_ADD('CFG_VALUE', floattostr(SumDogPosB.Value)); // значение элемента
       id:=IBSAVE_DOC('CFG', SumDogPosB.tag); if id <0 then raise Exception.Create('Ошибка охранения'); // код записи элемента
       end;

       DataModule1.IBTransaction2.Commit;
       DEL_CNT:=0;

       CurEditGroupID:=id2;
       SAVE:=true;
       LoadList;

  Except
    DataModule1.IBTransaction2.Rollback;
    ShowMessage('Error saving');
  end;

  memKlnTree.EnableControls;
  memKln.EnableControls;
end;

procedure TDIC_Klient_DYN_GROUP.TabControl1Change(Sender: TObject);
begin
  LoadList;
end;

procedure TDIC_Klient_DYN_GROUP.btnNewClick(Sender: TObject);
begin
    if (((SAVE=false) and (btnApply.Enabled)) and (KlnDynKlnList.ControlsDisabled=false))
    then
    begin

        if Messbox('Данные были изменены. Сохранить изменения?', messsystem, MB_YESNO)=IDYES then
          btnApply.OnClick(nil);
    end;


  TabControl1.TabIndex:=0;
  LoadList;
  KlnDynKlnList.DisableControls;


  if not  KlnDynKlnList.Locate('KLNDYNGROUP_ID', -1, [])  then
  begin
    KlnDynKlnList.Append;
    KlnDynKlnList.FieldByName('USER_ID').AsInteger:=USERID;
    KlnDynKlnList.FieldByName('KLNDYNGROUP_ID').AsInteger:=-1;
    KlnDynKlnList.FieldByName('KLNDYNGROUP_NAM').AsString:='_Новая_';
    KlnDynKlnList.Post;
    KlnDynKlnList.Last;
  end;
  KlnDynKlnList.EnableControls;
  SAVE:=true;
  LoadDynKlnSet;
end;

procedure TDIC_Klient_DYN_GROUP.BtnRefreshClick(Sender: TObject);
begin
  if SAVE=false then
    messBox('Данные были изменены... Возможно, будет выведен неверный набор клиентов.'+chr(13)+'Для вывода верного набора товаров необходимо сначала сохранить изменения', messSystem, 0);


  Screen.Cursor:=crHourGlass;

  ResultKlnSEt1.close;
  ResultKlnSEt1.ParamByName('TYP').asinteger:=CurEditGroupTyp;
  ResultKlnSEt1.ParamByName('ID').asinteger:=CurEditGroupID;
  ResultKlnSEt1.Open;

  ResultKlnSet.LoadFromDataSet(ResultKlnSet1, 0, lmCopy);

  ResultKlnSEt1.Close;
  Screen.Cursor:=crDefault;

  ShowSost;

end;

procedure TDIC_Klient_DYN_GROUP.RxDBGrid3TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
  if (Field <> nil) then
  begin
   por1 := not por1; //Изменяем статус сортировки
   Fld1:=Field;
  //Собственно говоря это и есть та строка сортировки
  //Благодаря которой в Гриде мы сортируем
   ResultKlnSet.SortOnFields(Field.FieldName, True, por1);
  end;
end;

procedure TDIC_Klient_DYN_GROUP.RxDBGrid3GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  if field = fld1 then
   if por1 then SortMarker := smDown else SortMarker := smUp;
end;

procedure TDIC_Klient_DYN_GROUP.DYNTREE_TYPChange(Sender: TObject);
begin
  CurEditGroupTyp:=DYNTREE_TYP.ItemIndex;
  SAVE:=false;


  case DYNTREE_TYP.ItemIndex of
    0: begin
         TabSheetUSL.TabVisible:=true;
         TabSheetTREE.TabVisible:=false;
         TabSheetTW.TabVisible:=false;
         kln_worktyp.Open;
       end;
    1: begin
         TabSheetTREE.TabVisible:=true;
         TabSheetUSL.TabVisible:=false;
         TabSheetTW.TabVisible:=false;
         kln_worktyp.Close;
       end;
    2: begin
         TabSheetTW.TabVisible:=true;
         TabSheetUSL.TabVisible:=false;
         TabSheetTREE.TabVisible:=false;
         kln_worktyp.Close;
       end;
  end;
  PageControl1.ActivePageIndex:= DYNTREE_TYP.ItemIndex;
end;

procedure TDIC_Klient_DYN_GROUP.GetKlnClick(Sender: TObject);
var
   a:integer;
begin
{
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.tag:=KLN.tag;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN.tag then begin
        KLN.tag:=DIC_KLIENT.tag;
        ChangeKln;
     end;
     DIC_KLIENT.Destroy;
}
     DicKlnSet:=4; {Ввод клиентов из каталога клиентов}
     CNT_KLN:=0;
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DIC_KLIENT.showmodal;
     if CNT_KLN>0 then begin
        SAVE:=false;
        for a:=1 to CNT_KLN do
        begin
            save:=false;
            ADD_SQL(QueryWork,'select kln_id, (select kln_full from kln_data(kln.kln_id)) as KLN_NAME, klntree_id, (select KLNTREE_NAM FROM KLNTREE_full(KLN.KLNTREE_ID, '''')) klntree_nam from kln where kln_id=:KL_ID');
            QueryWork.ParamByName('KL_ID').asinteger:=ARR_KLN[a].ID;
            QueryWork.Open;
            if not QueryWork.eof then
            begin
              memKln.DisableControls;
              memKln.Append;
              memKln.fieldbyname('klntree_id').asinteger:=QueryWork.fieldByname('KLNTREE_ID').asinteger;
              memKln.fieldbyname('klntree_nam').asstring:=QueryWork.fieldByname('KLNTREE_NAM').asstring;
              memKln.fieldbyname('kln_id').asinteger:=QueryWork.fieldByname('KLN_ID').asinteger;
              memKln.fieldbyname('kln_nam').asstring:=QueryWork.fieldByname('KLN_NAME').asstring;
              memKln.fieldbyname('relation_id').asinteger:=-1;
              memKln.Post;
              memKln.EnableControls;
            end;
        end;
     end;
     DIC_KLIENT.Destroy;
     ShowSost;


end;

procedure TDIC_Klient_DYN_GROUP.RxDBGrid4GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  if field = fld2 then
   if por2 then SortMarker := smDown else SortMarker := smUp;
end;

procedure TDIC_Klient_DYN_GROUP.RxDBGrid4TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
  if (Field <> nil) then
  begin
   por2 := not por2; //Изменяем статус сортировки
   Fld2:=Field;
  //Собственно говоря это и есть та строка сортировки
  //Благодаря которой в Гриде мы сортируем
   MemKln.SortOnFields(Field.FieldName, True, por2);
  end;
end;

procedure TDIC_Klient_DYN_GROUP.RxDBGrid2DblClick(Sender: TObject);
begin
  if BtnSelect.Visible then BtnSelect.Click;
end;

procedure TDIC_Klient_DYN_GROUP.btnSelectClick(Sender: TObject);
begin
  {Выбор одного товара}
  if not Save then
    messbox('Данные были изменены. Сначала изменения необходимо сохранить', messSystem, 0)
  else
  begin
    SELECTED_DYNTREE_ID:=CurEditGroupID;
    SELECTED_DYNTREE_TYP:=CurEditGrouptyp;
    SELECTED_DYNTREE_NAM:=DYNKlnLIST_NAME.Text;
    close;
  end;
end;

procedure TDIC_Klient_DYN_GROUP.KlnDynKlnListAfterScroll(DataSet: TDataSet);
begin

  Timer1.Enabled:=false;
  Timer1.Enabled:=true;

//    CurEditGroupID:=TwDynTwList.FieldByName('TwDynGroup_ID').asinteger;
//    DYNTWLIST_NAME.Text:=TwDynTwList.FieldByName('TwDynGroup_NAM').asstring;
//    if not TwDynTwList.ControlsDisabled then
//      LoadDynTWSet;
//    ShowSost;
end;

procedure TDIC_Klient_DYN_GROUP.btnDelKlnTREEClick(Sender: TObject);
begin
  save:=false;
       if Messbox('Удалить группу "'+MemKlnTREE.Fieldbyname('KLNTREE_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then
       begin
        if MemKlnTREE.Fieldbyname('RELATION_ID').asinteger>0 then
        begin
          DEL_ARR[DEL_CNT]:=MemKlnTREE.Fieldbyname('RELATION_ID').asinteger;
          inc(DEL_CNT);
        end;
        MemKlnTREE.delete;
     end;
  showSost;
end;

procedure TDIC_Klient_DYN_GROUP.btnDELKlnClick(Sender: TObject);
begin
  save:=false;
       if Messbox('Удалить клиента "'+MemKln.Fieldbyname('Kln_NAM').asstring+' '+MemKln.Fieldbyname('Kln_NAM').asstring+'"?',MessSubmit,4+48+256)=6 then
       begin
        if MemKln.Fieldbyname('RELATION_ID').asinteger>0 then
        begin
          DEL_ARR[DEL_CNT]:=MemKln.Fieldbyname('RELATION_ID').asinteger;
          inc(DEL_CNT);
        end;
        MemKln.delete;
     end;

     Showsost;
end;

procedure TDIC_Klient_DYN_GROUP.ShowSost;
begin

  btnNEW.Enabled:=CHECK_DOSTUP('$DIC_TW_SET.NEW$');

  btnAPPLY.Enabled:=((CHECK_DOSTUP('$DIC_TW_SET.NEW$')and (KlnDYNKlnLIST.FieldByName('USER_ID').asinteger=USERID)) or ((CHECK_DOSTUP('$DIC_TW_SET.EDIT_DEL_ANY$')))) ;
  btnDEL.Enabled:= ((CHECK_DOSTUP('$DIC_TW_SET.DEL$')) and (KlnDYNKlnLIST.FieldByName('USER_ID').asinteger=USERID)) or ((CHECK_DOSTUP('$DIC_TW_SET.EDIT_DEL_ANY$')));


  chkPrivate.Enabled:= ((CHECK_DOSTUP('$DIC_TW_SET.DISABLE_PRIVATE$')) and ((USER_ID=USERID) or (CHECK_DOSTUP('$DIC_TW_SET.EDIT_DEL_ANY$'))))  ;




  StatusBar1.Panels[0].Text:='Элементов: '+inttostr(MemKlnTree.RecordCount);
  StatusBar2.Panels[0].Text:='Элементов: '+inttostr(MemKln.RecordCount);
  StatusBar3.Panels[0].Text:='Элементов: '+inttostr(ResultKlnSet.RecordCount);
  StatusBar4.Panels[0].Text:='Элементов: '+inttostr(KlnDynKlnList.RecordCount);

end;

procedure TDIC_Klient_DYN_GROUP.chkKln_NAMClick(Sender: TObject);
begin
  SAVE:=FALSE;
  ShowSost;
end;

procedure TDIC_Klient_DYN_GROUP.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex=3
   then BtnRefresh.OnClick(sender);

end;

procedure TDIC_Klient_DYN_GROUP.RxDBGrid2GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  if field = fld5 then
   if por5 then SortMarker := smDown else SortMarker := smUp;
end;

procedure TDIC_Klient_DYN_GROUP.RxDBGrid2TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
  if (Field <> nil) then
  begin
   por5 := not por5; //Изменяем статус сортировки
   Fld5:=Field;
  //Собственно говоря это и есть та строка сортировки
  //Благодаря которой в Гриде мы сортируем
   KlnDynKlnList.SortOnFields(Field.FieldName, True, por5);
  end;
end;

procedure TDIC_Klient_DYN_GROUP.btnDELClick(Sender: TObject);
var ID: integer;
begin
  {Проверяем, можно ли удалить}
  ID:=KLNDYNKLNLIST.fieldByname('KLNDYNGROUP_ID').asinteger;
  if Messbox('Удалить набор  клиентов '+KlnDYNKlnLIST.fieldByname('KLNDYNGROUP_NAM').asstring+' ?',MessSubmitDelete,4+48+256)=6 then
  begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;

     try
        IBDELETE_DOC('KLIENTDYNGROUP', ID);
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
     KLNDYNKLNLIST.locate('KLNDYNGROUP_ID',ID,[]);
  end;

end;

procedure TDIC_Klient_DYN_GROUP.KlnDynKlnListBeforeScroll(DataSet: TDataSet);
begin
    if (((SAVE=false) and (btnApply.Enabled)) and (KlnDynKlnList.ControlsDisabled=false))
    then
    begin

        if Messbox('Данные были изменены. Сохранить изменения?', messsystem, MB_YESNO)=IDYES then
          btnApply.OnClick(nil);
    end

end;

procedure TDIC_Klient_DYN_GROUP.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  LoadDynKlnSet;
end;


procedure TDIC_Klient_DYN_GROUP.KLN_NAMChange(Sender: TObject);
begin
  if (KLN_NAM.Text='') then
    chkKLN_NAM.Checked:=false
  else
    chkKLN_NAM.Checked:=true;
  SAVE:=false;
end;

procedure TDIC_Klient_DYN_GROUP.KLN_GRChange(Sender: TObject);
begin
  if (KLN_GR.Text='') then
    chkKLN_GR.Checked:=false
  else
    chkKLN_GR.Checked:=true;
  SAVE:=false;
end;

procedure TDIC_Klient_DYN_GROUP.GorChange(Sender: TObject);
begin
  if (Gor.Text='') then
    chkGor.Checked:=false
  else
    chkGor.Checked:=true;
  SAVE:=false;
end;

procedure TDIC_Klient_DYN_GROUP.SumKredChange(Sender: TObject);
begin
  chkSumKred.Checked:=true;
  SAVE:=false;
end;

procedure TDIC_Klient_DYN_GROUP.KATChange(Sender: TObject);
begin
//  chkKAT.Checked:=true;
  //SAVE:=false;

end;

procedure TDIC_Klient_DYN_GROUP.PersSkChange(Sender: TObject);
begin
  chkPersSk.Checked:=true;
  SAVE:=false;

end;

procedure TDIC_Klient_DYN_GROUP.OPPokChange(Sender: TObject);
begin
  chkOPPok.Checked:=true;
  SAVE:=false;

end;

procedure TDIC_Klient_DYN_GROUP.OPPosChange(Sender: TObject);
begin
  chkOPPos.Checked:=true;
  SAVE:=false;

end;

procedure TDIC_Klient_DYN_GROUP.SumDogPosMChange(Sender: TObject);
begin
  chkSumDogPosM.Checked:=true;
  SAVE:=false;

end;

procedure TDIC_Klient_DYN_GROUP.SumDogPosBChange(Sender: TObject);
begin
  chkSumDogPosB.Checked:=true;
  SAVE:=false;

end;

procedure TDIC_Klient_DYN_GROUP.LoChange(Sender: TObject);
begin
//  chkLo.Checked:=true;
  //SAVE:=false;
end;

procedure TDIC_Klient_DYN_GROUP.VidDChange(Sender: TObject);
begin
//  chkVidD.Checked:=true;
  //SAVE:=false;

end;

procedure TDIC_Klient_DYN_GROUP.PokChange(Sender: TObject);
begin
//  chkPok.Checked:=true;
  //SAVE:=false;

end;

procedure TDIC_Klient_DYN_GROUP.PosChange(Sender: TObject);
begin
//  chkPos.Checked:=true;
  //SAVE:=false;

end;

procedure TDIC_Klient_DYN_GROUP.chkKrZaprClick(Sender: TObject);
begin
  Save:=false;

  if chkKrZapr.Checked then
  begin
    chkSumKred.Enabled:=false;
    SumKred.Enabled:=false;
    chkSumKredM.Enabled:=false;
    SumKredM.Enabled:=false;
  end
  else
  begin
    chkSumKred.Enabled:=true;
    SumKred.Enabled:=true;
    chkSumKredM.Enabled:=true;
    SumKredM.Enabled:=true;
  end;



end;

procedure TDIC_Klient_DYN_GROUP.chkSumKredClick(Sender: TObject);
begin
  SAVE:=false;

  if chkSumKred.Checked then
    chkKrZapr.Enabled:=false
  else
    chkKrZapr.Enabled:=true;

end;

procedure TDIC_Klient_DYN_GROUP.chkKATClick(Sender: TObject);
begin
  SAVE:=FALSE;
  if chkKAT.Checked then
    KAT.Enabled:=true
  else
    KAT.Enabled:=false;
  ShowSost;

end;

procedure TDIC_Klient_DYN_GROUP.chkLoClick(Sender: TObject);
begin
  SAVE:=FALSE;
  if chkLo.Checked then
    Lo.Enabled:=true
  else
    Lo.Enabled:=false;
  ShowSost;

end;

procedure TDIC_Klient_DYN_GROUP.chkVidDClick(Sender: TObject);
begin
  SAVE:=FALSE;
  if chkVidD.Checked then
    VidD.Enabled:=true
  else
    VidD.Enabled:=false;
  ShowSost;

end;

procedure TDIC_Klient_DYN_GROUP.chkPokClick(Sender: TObject);
begin
  SAVE:=FALSE;
  if chkPok.Checked then
    Pok.Enabled:=true
  else
    Pok.Enabled:=false;
  ShowSost;

end;

procedure TDIC_Klient_DYN_GROUP.chkPosClick(Sender: TObject);
begin
  SAVE:=FALSE;
  if chkPos.Checked then
    Pos.Enabled:=true
  else
    Pos.Enabled:=false;
  ShowSost;

end;

procedure TDIC_Klient_DYN_GROUP.chkSumKredMClick(Sender: TObject);
begin
  SAVE:=false;

  if chkSumKredM.Checked then
    chkKrZapr.Enabled:=false
  else
    chkKrZapr.Enabled:=true;

end;

procedure TDIC_Klient_DYN_GROUP.chkForOpClick(Sender: TObject);
begin
  SAVE:=FALSE;
  if chkForOp.Checked then
    ForOp.Enabled:=true
  else
    ForOp.Enabled:=false;
  ShowSost;

end;

procedure TDIC_Klient_DYN_GROUP.ToolButton1Click(Sender: TObject);
var groupid: Integer;
begin

groupid:=RxDBGrid2.DataSource.DataSet.FieldByName('KLNDYNGROUP_ID').asInteger;

if groupid=0 then
  exit;

  datamodule1.IbSaveSQL.SQL.Text:='execute procedure COPY_KLN_DYN_GROUP(:group_id, :user_id)';
  datamodule1.IbSaveSQL.ParamByName('group_id').asInteger:=groupid;
  datamodule1.IbSaveSQL.ParamByName('user_id').asInteger:=userid;
  datamodule1.IbSaveSQL.ExecSQL;

  datamodule1.IbSaveSQL.Transaction.Commit;

  LoadList;

end;

End.
