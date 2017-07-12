unit CardSumm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_DButils, ComCtrls, ToolWin, Db, Grids, DBGrids, RXDBCtrl,
  IBCustomDataSet, IBQuery, IBDatabase, Menus;

type
  TCARD_SUMM = class(TForm)
    ToolBar1: TToolBar;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    SkidTransaction: TIBTransaction;
    QrSKIDSUMM: TIBQuery;
    DsSkidSumm: TDataSource;
    RxDBGrid1: TRxDBGrid;
    QrSKIDSUMMCARDSKIDSUMM_ID: TIntegerField;
    QrSKIDSUMMCARDSKIDSUMM_SUMM: TFloatField;
    QrSKIDSUMMCARDSKIDSUMM_PERCENT: TFloatField;
    QrSKIDSUMMUS_ID: TIntegerField;
    QrSKIDSUMMTM: TDateTimeField;
    QrSKIDSUMMUS_FULL: TIBStringField;
    PopupMenu1: TPopupMenu;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    procedure QrSKIDSUMMAfterOpen(DataSet: TDataSet);
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
  CARD_SUMM: TCARD_SUMM;

implementation

uses EditCardSkid;

{$R *.DFM}

procedure TCARD_SUMM.QrSKIDSUMMAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
  EN:=not QrSKIDSUMM.eof;
  BtnOpen.enabled:=En;
  BtnDel.enabled:=En;
  MnOpen.enabled:=En;
  MnDel.enabled:=En;

end;

procedure TCARD_SUMM.FormShow(Sender: TObject);
begin
  SkidTransaction.Active:=False;
  QrSKIDSUMM.close;
  QrSKIDSUMM.open;
end;

procedure TCARD_SUMM.BtnDelClick(Sender: TObject);
begin
   if Messbox('Удалить накопительную скидку в '+floattostrf(QrSkidSumm.fieldbyname('CARDSKIDSUMM_PERCENT').asfloat,fffixed,19,3)+'% ?',MessSubmitDelete,4+48+256)=6 then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     if IBDELETE_DOC('CARDSKIDSUMM',QrSkidSumm.fieldbyname('CARDSKIDSUMM_ID').asinteger) then begin
       Datamodule1.IBTransaction2.Commit;
     end else Datamodule1.IBTransaction2.Rollback;
     Datamodule1.IBTransaction2.Active:=False;
     SkidTransaction.Active:=False;
     QrSkidsumm.close;
     QrSkidsumm.open;
   end;

end;

procedure TCARD_SUMM.BtnNewClick(Sender: TObject);
var
   ID:integer;
   r:double;
begin
   Application.createForm(TEDIT_CARDSKID,EDIT_CARDSKID);
   EDIT_CARDSKID.caption:='Новая накопительная сикидка';
   EDIT_CARDSKID.showmodal;
   if EDIT_CARDSKID.tag>0 then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     IBSAVE_CLEAR;
     IBSAVE_ADD('CARDSKIDSUMM_SUMM',EDIT_CARDSKID.SUMM.value);
     IBSAVE_ADD('CARDSKIDSUMM_PERCENT',EDIT_CARDSKID.PERCENT.value);
     IBSAVE_ADD('US_ID',USERID);
     try
       ID:=ibsave_doc('CARDSKIDSUMM',-1);
       if ID<0 then r:=sqrt(-1);
       Datamodule1.IBTransaction2.Commit;
       SkidTransaction.Active:=False;
       QrSkidsumm.close;
       QrSkidsumm.open;
       QrSkidsumm.locate('CARDSKIDSUMM_ID',ID,[]);
     Except
       Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;

   end;
   EDIT_CARDSKID.destroy;
end;

procedure TCARD_SUMM.BtnOpenClick(Sender: TObject);
var
   ID:integer;
   r:double;
begin
   Application.createForm(TEDIT_CARDSKID,EDIT_CARDSKID);
   EDIT_CARDSKID.caption:='Измсенить накопительную сикидку';
   EDIT_CARDSKID.SUMM.value:=Qrskidsumm.fieldbyname('CARDSKIDSUMM_SUMM').asfloat;
   EDIT_CARDSKID.PERCENT.value:=Qrskidsumm.fieldbyname('CARDSKIDSUMM_PERCENT').asfloat;
   EDIT_CARDSKID.showmodal;
   if EDIT_CARDSKID.tag>0 then begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     IBSAVE_CLEAR;
     IBSAVE_ADD('CARDSKIDSUMM_SUMM',EDIT_CARDSKID.SUMM.value);
     IBSAVE_ADD('CARDSKIDSUMM_PERCENT',EDIT_CARDSKID.PERCENT.value);
     IBSAVE_ADD('US_ID',USERID);
     try
       ID:=ibsave_doc('CARDSKIDSUMM',Qrskidsumm.fieldbyname('CARDSKIDSUMM_ID').asinteger);
       if ID<0 then r:=sqrt(-1);
       Datamodule1.IBTransaction2.Commit;
       SkidTransaction.Active:=False;
       QrSkidsumm.close;
       QrSkidsumm.open;
       QrSkidsumm.locate('CARDSKIDSUMM_ID',ID,[]);
     Except
       Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;

   end;
   EDIT_CARDSKID.destroy;
end;

procedure TCARD_SUMM.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen.enabled then BtnOpen.click;
end;

end.
