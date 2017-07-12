unit PersPribyl2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, RxMemDS,Data1,B_utils,B_DButils, IBCustomDataSet, IBQuery,
  IBDatabase, Mask, ToolEdit, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls,VclUtils,
  RxLookup, CurrEdit, Buttons, DualList;

type
  TPERS_PRIBYL2 = class(TForm)
    ReportTransaction: TIBTransaction;
    StatusBar1: TStatusBar;
    DsReport: TDataSource;
    QrOwner: TIBQuery;
    QrOwnerOWNER_ID: TIntegerField;
    QrOwnerOWNER_NAME: TIBStringField;
    DsOwner: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnRun: TButton;
    DT1: TDateEdit;
    DT2: TDateEdit;
    OWN: TRxDBLookupCombo;
    PR1: TRxCalcEdit;
    RxDBGrid1: TRxDBGrid;
    Label6: TLabel;
    PERCENT: TRxCalcEdit;
    Image1: TImage;
    QueryReport: TIBQuery;
    QueryReportTYP: TIntegerField;
    QueryReportID: TIntegerField;
    QueryReportIDS: TIntegerField;
    QueryReportFULL_NUM: TIBStringField;
    QueryReportTW_ID: TIntegerField;
    QueryReportTW_ART: TIntegerField;
    QueryReportTW_NAM: TIBStringField;
    QueryReportED_SHORT: TIBStringField;
    QueryReportTW_KOL: TFloatField;
    QueryReportTW_MONEY: TFloatField;
    QueryReportTW_SUMM: TFloatField;
    QueryReportNAC: TFloatField;
    QueryReportPERCENT: TFloatField;
    QueryReportSHOP_COLOR: TIntegerField;
    QueryReportDOC_DATE: TDateTimeField;
    QueryReportSEB: TFloatField;
    MEN1: TRadioButton;
    MEN2: TRadioButton;
    QueryReportMEN_FULL: TIBStringField;
    QueryReportTW_COLOR: TIntegerField;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    QueryWork: TIBQuery;
    WorkTransaction: TIBTransaction;
    DualListDialog1: TDualListDialog;
    Label7: TLabel;
    Label5: TLabel;
    TW: TEdit;
    BtnDic: TSpeedButton;
    BtnDynDic: TSpeedButton;
    Label8: TLabel;
    FRM: TRxDBLookupCombo;
    MemFrm: TRxMemoryData;
    MemFrmFRM_ID: TIntegerField;
    MemFrmFRM_NAME: TStringField;
    DsFrm: TDataSource;
    QueryReportSPEC_MONEY: TFloatField;
    QueryReportREAL_MONEY: TFloatField;
    QueryReportRN_NDS: TFloatField;
    Label9: TLabel;
    nac1: TRxCalcEdit;
    Label10: TLabel;
    nac2: TRxCalcEdit;
    procedure BtnRunClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MemReportAfterScroll(DataSet: TDataSet);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure PERCENTChange(Sender: TObject);
    procedure MEN1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnDicClick(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
  private
    { Private declarations }
    RNTYP_S: string;
    ID_RNTYP: integer;
    ID_MEN_ID, MEN_ID: integer;
    tw_group_id: integer;
    tW_group_typ:integer;
  public
    { Public declarations }
  end;

var
  PERS_PRIBYL2: TPERS_PRIBYL2;

implementation

uses WaitForm, ReportPribylNewError, DicTowar, DicTwDynGroup;

{$R *.DFM}

procedure TPERS_PRIBYL2.BtnRunClick(Sender: TObject);
var
  TW_ID:integer;
  TW_BEFORE:double;
  WORK_KOL:double;
  PN_OWNER:integer;
  C,A:integer;
  PRIBSUMM,PRIBSUMMD:double;
begin
 PRIBSUMM:=0;
 PRIBSUMMD:=0;
 BtnRun.enabled:=False;
 if Dt2.date-DT1.date>31then messbox('Интервал расчета не может превышать 31 день, так как отчет может занять продолжительное время. Убавьте интервал расчета и повторите операцию!',MessSystem,48)
 else begin
  Wait_Form.StatusBar1.panels[0].text:='Запрос данных...';
  Wait_Form.Gauge1.Progress:=10;
  Wait_Form.Show;
  delay(100);
  QueryReport.disablecontrols;
  QueryReport.close;
  QueryReport.ParamByname('DT1').asdatetime:=Dt1.date;
  QueryReport.ParamByname('DT2').asdatetime:=Dt2.date+1-sekond1;
  QueryReport.ParamByname('RNTYPS').asstring:=RNTYP_S;
  QueryReport.ParamByname('START_TWTREE_ID').asinteger:=tw_group_id;
  QueryReport.ParamByname('START_TWTREE_TYP').asinteger:=tw_group_TYP;
  QueryReport.ParamByname('IN_FRM_ID').asstring:=FRM.Value;



  if MEN1.checked then QueryReport.ParamByname('MEN_ID').asinteger:=-1 else
          QueryReport.ParamByname('MEN_ID').asinteger:=strtoint(OWN.value);
  QueryReport.Open;
  Wait_Form.Gauge1.Progress:=90;
  Wait_Form.StatusBar1.panels[0].text:='Подсчет итогов...';
  Wait_Form.Show;
  delay(100);
  QueryReport.first;
  PR1.value:=0;
  nac1.value:=0;
  nac2.value:=0;


  while not QueryReport.eof do begin
    PR1.value:=PR1.value+QueryReport.fieldByname('nac').asfloat;
    nac1.value:=nac1.value+(QueryReport.fieldByname('spec_money').asfloat-QueryReport.fieldByname('seb').asfloat)*QueryReport.fieldByname('tw_kol').asfloat;
    nac2.value:=nac2.value+(QueryReport.fieldByname('real_money').asfloat-QueryReport.fieldByname('spec_money').asfloat)*QueryReport.fieldByname('tw_kol').asfloat;
    QueryReport.next;
  end;
  QueryReport.first;
  QueryReport.EnableControls;
  RxDbgrid1.setfocus;
  WAIT_FORM.Hide;
 end;
 BtnRun.enabled:=True;
end;

procedure TPERS_PRIBYL2.FormShow(Sender: TObject);
var s3, s4: string;
  a: integer;
begin
     tw_group_id:=0;
     tw_group_typ:=3;  //просто все товары

     ReportTransaction.Active:=False;
     PR1.value:=0;

     DT1.date:=date();
     DT2.date:=date();
     Percent.value:=15;


     RNTYP_S:='%';
     ID_RNTYP := -1;
     ID_MEN_ID:=-1;
     MEN_ID:=-1;
     TW.text:='Все товары';

    {Заполняем DualListDialog}
     ADD_SQL(QueryWork,'select * from cfg where cfg_name="PERS_PRIBYL" and CFG_SET2=:US_ID');
     QueryWork.ParamByname('US_ID').asinteger:=USERID;
     QueryWork.open;
     if not QueryWork.eof then
     begin
        if QueryWork.Locate('CFG_SET1',1,[]) then
        begin
           RNTYP_S:=QueryWork.fieldByname('CFG_VALUE').asstring;
           ID_RNTYP:=QueryWork.fieldByname('CFG_ID').asinteger;
        end;
        if QueryWork.Locate('CFG_SET1',2,[]) then
        begin
           MEN_ID:=QueryWork.fieldByname('CFG_VALUE').asinteger;
           ID_MEN_ID:=QueryWork.fieldByname('CFG_ID').asinteger;
        end;

     end;
     s4:='';
     s3:=RNTYP_S;
     for a:=1 to length(s3) do if s3[a]='%' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     DualListDialog1.Title:='Список типов расходных накладных';
     DualListDialog1.List1.Clear;
     DualListDialog1.List2.Clear;
     while not QueryWork.eof do begin
           if pos(' '+QueryWork.fieldByname('RNTYP_ID').asstring+' ',s3)>0 then begin
              DualListDialog1.List2.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
              s4:=s4+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
           end else
           DualListDialog1.List1.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit1.text:=s4;

     QrOwner.close;
     QrOwner.Open;

     if men_id>0 then
     begin
       MEN2.checked:=true;
       OWN.value:=inttostr(men_id);
       own.Enabled:=true;
     end
     else
      own.Enabled:=false;



      MemFrm.EmptyTable;
      MemFrm.Append;
      MemFrm.fieldByname('FRM_ID').asinteger:=-1;
      MemFrm.fieldByname('FRM_NAME').asstring:='<Все фирмы>';
      MemFrm.Post;

      MemFrm.Append;
      MemFrm.fieldByname('FRM_ID').asinteger:=0;
      MemFrm.fieldByname('FRM_NAME').asstring:='<Розница>';
      MemFrm.Post;
      
      ADD_SQL(QueryWork,'select frm_id,bg_left(frm_full,127) as frm_name from pn_dic_frm(-1) order by 2');
      QueryWork.open;
      while not QueryWork.eof do begin
        MemFrm.Append;
        MemFrm.fieldByname('FRM_ID').asinteger:=QueryWork.fieldByname('FRM_ID').asinteger;
        MemFrm.fieldByname('FRM_NAME').asstring:=QueryWork.fieldByname('FRM_NAME').asstring;
        MemFrm.Post;
        QueryWork.next;
      end;


     FRM.Value:=inttostr(GL_FRM_WORK_MODE);




end;

procedure TPERS_PRIBYL2.MemReportAfterScroll(DataSet: TDataSet);
begin
     Statusbar1.panels[0].text:='Дата: '+date_sokr(QueryReport.fieldbyname('DOC_DATE').asdatetime);
end;

procedure TPERS_PRIBYL2.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом Номер}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if (Field.FieldName='TW_ART')
        and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
        then BackGround:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
     if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').asfloat<0 then Afont.color:=ClRed;
     if Field.Fieldname='FULL_NUM' then begin
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger>0 then
           Background:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if (Field.FieldName='TW_ART')
           and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger>=0)
           then Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_COLOR').asinteger;
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').asfloat<0 then Background:=ClRed;
        if Field.Fieldname='FULL_NUM' then begin
          if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger>0 then
           Afont.color:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('SHOP_COLOR').Asinteger;
        end;
     end;
     if (Field.Fieldname='nac') and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('nac').asfloat<0) then begin
        Background:=Clred;
        Afont.color:=ClWhite;
     end;
     if (Field.Fieldname='nac$$') and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('nac$').asfloat<0) then begin
        Background:=Clred;
        Afont.color:=ClWhite;
     end;
     if (Field.Fieldname='PERCENT') and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PERCENT').asfloat<PERCENT.value) then begin
        Background:=clred;//$00FFA8FF;
        Afont.color:=ClWhite;
     end;
     if (Field.Fieldname='PERCENT$') and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('PERCENT$').asfloat<PERCENT.value) then begin
        Background:=clred;//$00FFA8FF;
        Afont.color:=ClWhite;
     end;
end;

procedure TPERS_PRIBYL2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     QueryReport.close;
     QrOwner.close;

     {Сохраняем установки}
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','PERS_PRIBYL');
        IBSAVE_ADD('CFG_SET2',USERID);
        IBSAVE_ADD('CFG_SET1',1);
        IBSAVE_ADD('CFG_VALUE',RNTYP_S);
        IBSAVE_DOC('CFG',ID_RNTYP);

        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','PERS_PRIBYL');
        IBSAVE_ADD('CFG_SET2',USERID);
        IBSAVE_ADD('CFG_SET1',2);
        IBSAVE_ADD('CFG_VALUE',strtoint('0'+own.value));
        IBSAVE_DOC('CFG',ID_MEN_ID);

        Datamodule1.IBTransaction2.Commit;
     Except
           Datamodule1.IBTransaction2.RollBack;
     End;
     Datamodule1.IBTransaction2.Active:=False;


end;

procedure TPERS_PRIBYL2.RxDBGrid1DblClick(Sender: TObject);
begin
     if not QueryReport.eof then begin
          if QueryReport.fieldByname('TYP').asinteger=1 then
          SHOW_ANALIZ_RN(QueryReport.fieldbyname('ID').asinteger);
     end;
end;

procedure TPERS_PRIBYL2.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then begin
       key:=#0;
       RxDBGrid1DblClick(Sender);
     end;
end;

procedure TPERS_PRIBYL2.PERCENTChange(Sender: TObject);
begin
   RxDbgrid1.Refresh;
end;

procedure TPERS_PRIBYL2.MEN1Click(Sender: TObject);
begin
    OWN.enabled:=MEN2.checked;
end;

procedure TPERS_PRIBYL2.BitBtn1Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     s:='%';
     s2:='';
     if DualListDialog1.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog1.list2.Count do begin
            if QueryWork.Locate('RNTYP_SHORT',DualListDialog1.List2.Strings[a-1],[])
            then begin
                 s:=s+QueryWork.fieldByname('RNTYP_ID').asstring+'%';
                 s2:=s2+' '+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
            end;
        end;
        if length(s)>0 then s:=B_utils.left(s,length(s));
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        RNTYP_S:=s;
        Edit1.text:=s2;
     end;
end;

procedure TPERS_PRIBYL2.BtnDicClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     if tw_group_typ=3 then
       DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       tw_group_id:=DIC_TOWAR.tag;
       tw_group_typ:=3;
       WorkTransaction.Active:=False;
       QueryWork.close;
       QueryWork.SQL.clear;
       QueryWork.SQL.add('select TWTREE_FULL FROM TWTREE WHERE TWTREE_ID=:TWTREE_ID');
       QueryWork.ParamByname('TWTREE_ID').asinteger:=tw_group_id;
       QueryWork.Open;
       TW.text:='';
       if not QueryWork.eof then Tw.text:=QueryWork.fieldByname('TWTREE_FULL').asstring;
     end;
end;

procedure TPERS_PRIBYL2.BtnDynDicClick(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;
     if tw_group_typ<3 then
      DIC_TW_DYN_GROUP.btnSelect.tag := tw_group_id;

     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      tw.Text:='* '+ DIC_TW_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      tw_group_id:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      tw_group_typ:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

end.
