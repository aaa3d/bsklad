unit CardSkidCoupon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_DButils, ComCtrls, ToolWin, Db, Grids, DBGrids, RXDBCtrl,
  IBCustomDataSet, IBQuery, IBDatabase, Menus;

type
  TCARD_SKID_COUPON = class(TForm)
    ToolBar1: TToolBar;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    SkidTransaction: TIBTransaction;
    QrCoupon: TIBQuery;
    DsSkidSumm: TDataSource;
    RxDBGrid1: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QrCouponCARDSKID_COUPON_ID: TIntegerField;
    QrCouponTM: TDateTimeField;
    QrCouponNUMBER: TIBStringField;
    QrCouponSUMM: TIntegerField;
    QrCouponCNT: TIntegerField;
    QrCouponWORK_DT_START: TDateTimeField;
    QrCouponWORK_DT_END: TDateTimeField;
    QrCouponWORK_DAYS: TIBStringField;
    QrCouponTW_DYN_GROUP_ID: TIntegerField;
    QrCouponTW_DYN_GROUP_TYP: TIntegerField;
    QrCouponUS_ID: TIntegerField;
    QrCouponWORK_TM_START: TDateTimeField;
    QrCouponWORK_TM_END: TDateTimeField;
    QrCouponDESCR: TStringField;
    procedure QrCouponAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CARD_SKID_COUPON: TCARD_SKID_COUPON;

implementation

uses EditCardSkidCoupon;


{$R *.DFM}

procedure TCARD_SKID_COUPON.QrCouponAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
  EN:=not QrCoupon.eof;
  BtnOpen.enabled:=En;
  BtnDel.enabled:=En;
  MnOpen.enabled:=En;
  MnDel.enabled:=En;

end;

procedure TCARD_SKID_COUPON.FormShow(Sender: TObject);
begin
  SkidTransaction.Active:=False;
  QrCoupon.close;
  QrCoupon.open;
end;

procedure TCARD_SKID_COUPON.BtnDelClick(Sender: TObject);
begin
   if Messbox('Удалить купон '+floattostrf(QrCoupon.fieldbyname('NUMBER').asfloat,fffixed,19,3)+'% ?',MessSubmitDelete,4+48+256)=6 then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     if IBDELETE_DOC('CARDSKID_COUPON',QrCoupon.fieldbyname('CARDSKID_COUPON_ID').asinteger) then begin
       Datamodule1.IBTransaction2.Commit;
     end else Datamodule1.IBTransaction2.Rollback;
     Datamodule1.IBTransaction2.Active:=False;
     SkidTransaction.Active:=False;
     QrCoupon.close;
     QrCoupon.open;
   end;

end;

procedure TCARD_SKID_COUPON.BtnNewClick(Sender: TObject);
var
   ID:integer;
   r:double;
   NUM:integer;
   i: integer;
   wd: string;
begin
   Application.createForm(TEDIT_CARDSKID_COUPON,EDIT_CARDSKID_COUPON);
   EDIT_CARDSKID_COUPON.caption:='Новый купон';
   EDIT_CARDSKID_COUPON.WORK_DT_START.date:=date();
   EDIT_CARDSKID_COUPON.WORK_DT_END.date:=date();
   EDIT_CARDSKID_COUPON.WORK_TM_START.date:=date();
   EDIT_CARDSKID_COUPON.WORK_TM_END.date:=date();
   EDIT_CARDSKID_COUPON.NUMBER.Text:='';
   EDIT_CARDSKID_COUPON.DESCR.Text:='';
   EDIT_CARDSKID_COUPON.CNT.Value:=100;
   EDIT_CARDSKID_COUPON.SUMM.Value:=0;

   EDIT_CARDSKID_COUPON.showmodal;
   if EDIT_CARDSKID_COUPON.tag>0 then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     // Определяем новый номер скидки
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select max(cast(cardskid_num as integer)) as num from cardskid');
     if QueryWork.eof then NUM:=0
     else NUM:=strtoint('0'+QueryWork.fieldbyname('NUM').asstring);
     NUM:=NUM+1;
     QueryWork.Close;

     wd:='';
     for i:=0 to 6 do
        if (  EDIT_CARDSKID_COUPON.WORK_DAYS.Checked[i]) then
                wd:=wd+'1'
                else
                wd:=wd+'0';

     IBSAVE_CLEAR;
     IBSAVE_ADD('NUMBER',EDIT_CARDSKID_COUPON.NUMBER.Text);
     IBSAVE_ADD('WORK_DT_START',EDIT_CARDSKID_COUPON.WORK_DT_START.date);
     IBSAVE_ADD('WORK_DT_END',EDIT_CARDSKID_COUPON.WORK_DT_END.date);
     IBSAVE_ADD('WORK_TM_START',TDateTime(EDIT_CARDSKID_COUPON.WORK_TM_START.time));
     IBSAVE_ADD('WORK_TM_END',TDateTime(EDIT_CARDSKID_COUPON.WORK_TM_END.time));
     IBSAVE_ADD('DESCR',EDIT_CARDSKID_COUPON.DESCR.text);
     IBSAVE_ADD('SUMM',EDIT_CARDSKID_COUPON.SUMM.Value);
     IBSAVE_ADD('CNT',EDIT_CARDSKID_COUPON.CNT.Value);
     IBSAVE_ADD('WORK_DAYS',wd);
     IBSAVE_ADD('US_ID',USERID);
     try
       ID:=ibsave_doc('CARDSKID_COUPON',-1);
       if ID<0 then r:=sqrt(-1);
       Datamodule1.IBTransaction2.Commit;
       SkidTransaction.Active:=False;
       QrCoupon.close;
       QrCoupon.open;
       QrCoupon.locate('CARDSKID_COUPON_ID',ID,[]);
     Except
       Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
   end;
   EDIT_CARDSKID_COUPON.destroy;
end;

procedure TCARD_SKID_COUPON.BtnOpenClick(Sender: TObject);
var
   ID:integer;
   r:double;
   i: integer;
   wd: string;
begin
   Application.createForm(TEDIT_CARDSKID_COUPON,EDIT_CARDSKID_COUPON);
   EDIT_CARDSKID_COUPON.caption:='Изменить купон № '+QrCoupon.fieldbyname('NUMBER').asstring;
   EDIT_CARDSKID_COUPON.WORK_DT_START.date:=QrCoupon.fieldbyname('WORK_DT_START').asdatetime;
   EDIT_CARDSKID_COUPON.WORK_DT_END.date:=QrCoupon.fieldbyname('WORK_DT_END').asdatetime;
   EDIT_CARDSKID_COUPON.WORK_TM_START.Time:=QrCoupon.fieldbyname('WORK_TM_START').asdatetime;
   EDIT_CARDSKID_COUPON.WORK_TM_END.Time:=QrCoupon.fieldbyname('WORK_TM_END').asdatetime;
   EDIT_CARDSKID_COUPON.NUMBER.Text:=QrCoupon.fieldbyname('NUMBER').asstring;
   EDIT_CARDSKID_COUPON.DESCR.Text:=QrCoupon.fieldbyname('DESCR').asstring;
   EDIT_CARDSKID_COUPON.CNT.Value:=QrCoupon.fieldbyname('CNT').asinteger;
   EDIT_CARDSKID_COUPON.SUMM.Value:=QrCoupon.fieldbyname('SUMM').asinteger;

   for i:=0 to 6 do
        EDIT_CARDSKID_COUPON.WORK_DAYS.Checked[i]:= (QrCoupon.fieldbyname('WORK_DAYS').asString[i+1]='1');






   EDIT_CARDSKID_COUPON.showmodal;
   if EDIT_CARDSKID_COUPON.tag>0 then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;

     wd:='';
     for i:=0 to 6 do
        if (  EDIT_CARDSKID_COUPON.WORK_DAYS.Checked[i]) then
                wd:=wd+'1'
                else
                wd:=wd+'0';

     IBSAVE_CLEAR;
     IBSAVE_ADD('NUMBER',EDIT_CARDSKID_COUPON.NUMBER.Text);
     IBSAVE_ADD('WORK_DT_START',EDIT_CARDSKID_COUPON.WORK_DT_START.date);
     IBSAVE_ADD('WORK_DT_END',EDIT_CARDSKID_COUPON.WORK_DT_END.date);
     IBSAVE_ADD('WORK_TM_START',TDateTime(EDIT_CARDSKID_COUPON.WORK_TM_START.time));
     IBSAVE_ADD('WORK_TM_END',TDateTime(EDIT_CARDSKID_COUPON.WORK_TM_END.time));
     IBSAVE_ADD('DESCR',EDIT_CARDSKID_COUPON.DESCR.text);
     IBSAVE_ADD('SUMM',EDIT_CARDSKID_COUPON.SUMM.Value);
     IBSAVE_ADD('CNT',EDIT_CARDSKID_COUPON.CNT.Value);
     IBSAVE_ADD('WORK_DAYS',wd);
     IBSAVE_ADD('US_ID',USERID);
     try
       ID:=ibsave_doc('CARDSKID_COUPON',QrCoupon.fieldbyname('CARDSKID_COUPON_ID').asinteger);
       if ID<0 then r:=sqrt(-1);
       Datamodule1.IBTransaction2.Commit;
       SkidTransaction.Active:=False;
       QrCoupon.close;
       QrCoupon.open;
       QrCoupon.locate('CARDSKID_COUPON_ID',ID,[]);
     Except
       Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
   end;
   EDIT_CARDSKID_COUPON.destroy;
end;

procedure TCARD_SKID_COUPON.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.enabled then BtnOpen.click;
end;

end.
