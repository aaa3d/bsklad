unit CardSkid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_DButils, ComCtrls, ToolWin, Db, Grids, DBGrids, RXDBCtrl,
  IBCustomDataSet, IBQuery, IBDatabase, Menus;

type
  TCARD_SKID = class(TForm)
    ToolBar1: TToolBar;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    SkidTransaction: TIBTransaction;
    QrSKIDNUM: TIBQuery;
    DsSkidSumm: TDataSource;
    RxDBGrid1: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    QrSKIDNUMCARDSKID_ID: TIntegerField;
    QrSKIDNUMCARDSKID_NUM: TIBStringField;
    QrSKIDNUMCARDSKID_DT1: TDateTimeField;
    QrSKIDNUMCARDSKID_DT2: TDateTimeField;
    QrSKIDNUMCARDSKID_NAME: TIBStringField;
    QrSKIDNUMCARDSKID_PERCENT: TFloatField;
    QrSKIDNUMUS_ID: TIntegerField;
    QrSKIDNUMCARDSKID_TYP: TIntegerField;
    QrSKIDNUMTM: TDateTimeField;
    QrSKIDNUMUS_FULL: TIBStringField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure QrSKIDNUMAfterOpen(DataSet: TDataSet);
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
  CARD_SKID: TCARD_SKID;

implementation

uses EditCardSkid, EditCardNum;

{$R *.DFM}

procedure TCARD_SKID.QrSKIDNUMAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
  EN:=not QrSKIDNUM.eof;
  BtnOpen.enabled:=En;
  BtnDel.enabled:=En;
  MnOpen.enabled:=En;
  MnDel.enabled:=En;

end;

procedure TCARD_SKID.FormShow(Sender: TObject);
begin
  SkidTransaction.Active:=False;
  QrSKIDNUM.close;
  QrSKIDNUM.open;
end;

procedure TCARD_SKID.BtnDelClick(Sender: TObject);
begin
   if Messbox('Удалить номерную скидку скидку в '+floattostrf(QrSkidNum.fieldbyname('CARDSKID_PERCENT').asfloat,fffixed,19,3)+'% ?',MessSubmitDelete,4+48+256)=6 then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     if IBDELETE_DOC('CARDSKID',QrSkidNum.fieldbyname('CARDSKID_ID').asinteger) then begin
       Datamodule1.IBTransaction2.Commit;
     end else Datamodule1.IBTransaction2.Rollback;
     Datamodule1.IBTransaction2.Active:=False;
     SkidTransaction.Active:=False;
     QrSkidNum.close;
     QrSkidNum.open;
   end;

end;

procedure TCARD_SKID.BtnNewClick(Sender: TObject);
var
   ID:integer;
   r:double;
   NUM:integer;
begin
   Application.createForm(TEDIT_CARDNUM,EDIT_CARDNUM);
   EDIT_CARDNUM.caption:='Новая номерная сикидка';
   EDIT_CARDNUM.DT1.date:=date();
   EDIT_CARDNUM.TYP.itemindex:=0;
   EDIT_CARDNUM.DT2.date:=date();
   EDIT_CARDNUM.showmodal;
   if EDIT_CARDNUM.tag>0 then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     // Определяем новый номер скидки
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select max(cast(cardskid_num as integer)) as num from cardskid');
     if QueryWork.eof then NUM:=0
     else NUM:=strtoint('0'+QueryWork.fieldbyname('NUM').asstring);
     NUM:=NUM+1;
     QueryWork.Close;
     IBSAVE_CLEAR;
     IBSAVE_ADD('CARDSKID_NUM',NUM);
     IBSAVE_ADD('CARDSKID_DT1',EDIT_CARDNUM.DT1.date);
     IBSAVE_ADD('CARDSKID_DT2',EDIT_CARDNUM.DT2.date);
     IBSAVE_ADD('CARDSKID_NAME',EDIT_CARDNUM.OPIS.text);
     IBSAVE_ADD('CARDSKID_PERCENT',EDIT_CARDNUM.PERCENT.value);
     IBSAVE_ADD('US_ID',USERID);
     IBSAVE_ADD('CARDSKID_TYP',EDIT_CARDNUM.TYP.itemindex+1);
     try
       ID:=ibsave_doc('CARDSKID',-1);
       if ID<0 then r:=sqrt(-1);
       Datamodule1.IBTransaction2.Commit;
       SkidTransaction.Active:=False;
       QrSkidNum.close;
       QrSkidNum.open;
       QrSkidNum.locate('CARDSKID_ID',ID,[]);
     Except
       Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
   end;
   EDIT_CARDNUM.destroy;
end;

procedure TCARD_SKID.BtnOpenClick(Sender: TObject);
var
   ID:integer;
   r:double;
begin
   Application.createForm(TEDIT_CARDNUM,EDIT_CARDNUM);
   EDIT_CARDNUM.caption:='Изменить номерную скидку № '+Qrskidnum.fieldbyname('CARDSKID_NUM').asstring;
   EDIT_CARDNUM.OPIS.text:=Qrskidnum.fieldbyname('CARDSKID_NAME').asstring;
   EDIT_CARDNUM.DT1.date:=Qrskidnum.fieldbyname('CARDSKID_DT1').asdatetime;
   EDIT_CARDNUM.DT2.date:=Qrskidnum.fieldbyname('CARDSKID_DT1').asdatetime;
   EDIT_CARDNUM.TYP.itemindex:=Qrskidnum.fieldbyname('CARDSKID_TYP').asinteger-1;
   EDIT_CARDNUM.PERCENT.value:=QrskidNUM.fieldbyname('CARDSKID_PERCENT').asfloat;
   EDIT_CARDNUM.showmodal;
   if EDIT_CARDNUM.tag>0 then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     IBSAVE_CLEAR;
     IBSAVE_ADD('CARDSKID_DT1',EDIT_CARDNUM.DT1.date);
     IBSAVE_ADD('CARDSKID_DT2',EDIT_CARDNUM.DT2.date);
     IBSAVE_ADD('CARDSKID_NAME',EDIT_CARDNUM.OPIS.text);
     IBSAVE_ADD('CARDSKID_PERCENT',EDIT_CARDNUM.PERCENT.value);
     IBSAVE_ADD('US_ID',USERID);
     IBSAVE_ADD('CARDSKID_TYP',EDIT_CARDNUM.TYP.itemindex+1);
     try
       ID:=ibsave_doc('CARDSKID',Qrskidnum.fieldbyname('CARDSKID_ID').asinteger);
       if ID<0 then r:=sqrt(-1);
       Datamodule1.IBTransaction2.Commit;
       SkidTransaction.Active:=False;
       QrSkidnum.close;
       QrSkidNum.open;
       QrSkidNum.locate('CARDSKID_ID',ID,[]);
     Except
       Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
   end;
   EDIT_CARDNUM.destroy;
end;

procedure TCARD_SKID.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.enabled then BtnOpen.click;
end;

end.
