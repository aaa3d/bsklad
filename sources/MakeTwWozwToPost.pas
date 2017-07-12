unit MakeTwWozwToPost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLookup, StdCtrls, Buttons, Db, IBCustomDataSet, IBQuery, IBDatabase,
  ComCtrls;

type
  TMAKE_TW_WOZW_TO_POST = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FRM: TRxDBLookupCombo;
    SKL: TRxDBLookupCombo;
    GroupBox2: TGroupBox;
    BtnTW: TSpeedButton;
    BtnDynDic: TSpeedButton;
    TW1: TRadioButton;
    TW2: TRadioButton;
    TW: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    POST: TRxDBLookupCombo;
    QueryWork: TIBQuery;
    IBTransaction1: TIBTransaction;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SHOP: TRxDBLookupCombo;
    dt1: TDateTimePicker;
    tm1: TDateTimePicker;
    procedure BtnTWClick(Sender: TObject);
    procedure BtnDynDicClick(Sender: TObject);
    procedure TW1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    tw_group_id: integer;
    tW_group_typ:integer;
  public
    { Public declarations }
  end;

var
  MAKE_TW_WOZW_TO_POST: TMAKE_TW_WOZW_TO_POST;

implementation
uses Data1, DicTowar, DicTwDynGroup, b_dbUtils;

{$R *.DFM}

procedure TMAKE_TW_WOZW_TO_POST.BtnTWClick(Sender: TObject);
begin
     DicTowarSet:=3; {Ввод одной группы товаров}
     if tw_group_typ=3 then
       DIC_TOWAR.tag:=tw_group_id;
     DIC_TOWAR.showmodal;
     if DIC_TOWAR.tag>0 then begin
       {Отображаем название}
       tw2.Checked:=true;
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

procedure TMAKE_TW_WOZW_TO_POST.BtnDynDicClick(Sender: TObject);
begin
     Application.createForm(TDIC_TW_DYN_GROUP,DIC_TW_DYN_GROUP);
     DIC_TW_DYN_GROUP.btnSelect.visible:=true;
     if tw_group_typ<3 then
      DIC_TW_DYN_GROUP.btnSelect.tag := tw_group_id;

     DIC_TW_DYN_GROUP.showmodal;
     if DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID>0 then
     begin
      tw2.Checked:=true;
      tw.Text:='* '+ DIC_TW_DYN_GROUP.SELECTED_DYNTREE_NAM +' *';
      tw_group_id:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_ID;
      tw_group_typ:=DIC_TW_DYN_GROUP.SELECTED_DYNTREE_TYP;
     end;
     DIC_TW_DYN_GROUP.Destroy;
end;

procedure TMAKE_TW_WOZW_TO_POST.TW1Click(Sender: TObject);
begin
   if TW1.Checked=true
     then
     begin
          tw.Text:= 'Все товары';
          tw_group_id:=0;
          tw_group_typ:=3
     end;
end;

procedure TMAKE_TW_WOZW_TO_POST.Button1Click(Sender: TObject);
begin
  datamodule1.IbSaveSQL.Close;

  datamodule1.IbSaveSQL.SQL.Text:='SELECT NUM_FULL FROM A2_MAKE_WOZW_TO_POST(:dt, :frm_id, :post_id, :skl_id, :shop_id, :TW_GROUP_TYP, :TW_GROUP_ID)';


  datamodule1.IbSaveSQL.ParamByName('FRM_ID').asstring:=FRM.Value;
  datamodule1.IbSaveSQL.ParamByName('POST_ID').asstring:=POST.Value;
  datamodule1.IbSaveSQL.ParamByName('dt').asdatetime:=int(dt1.Date) + frac(tm1.time);
  datamodule1.IbSaveSQL.ParamByName('SKL_ID').asString:=SKL.Value;
  datamodule1.IbSaveSQL.ParamByName('shop_id').assTRING:=shop.VALUE;
  datamodule1.IbSaveSQL.ParamByName('TW_GROUP_TYP').aSInteger:=tw_group_typ;
  datamodule1.IbSaveSQL.ParamByName('TW_GROUP_ID').aSInteger:=tw_group_id;  
  datamodule1.IbSaveSQL.Open;

  memo1.Lines.Add('создана РН '+datamodule1.IbSaveSQL.fieldbyname('NUM_FULL').asstring);
  datamodule1.IbSaveSQL.Transaction.Commit;
end;

procedure TMAKE_TW_WOZW_TO_POST.FormCreate(Sender: TObject);
begin
  dt1.DateTime:=int(now);
  tm1.DateTime:= int(now)+7/24;
end;

end.
