unit MailNewMoney;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, ToolWin, ComCtrls, Mask, ToolEdit, CurrEdit,
  StdCtrls, Grids, DBGrids, RXDBCtrl, Db, RxMemDS, Menus;

type
  TMAIL_NEW_MONEY = class(TForm)
    Label1: TLabel;
    VALUTA: TEdit;
    Label2: TLabel;
    MON1: TRxCalcEdit;
    Label3: TLabel;
    MON2: TRxCalcEdit;
    ToolBar1: TToolBar;
    BtnSave: TToolButton;
    RxDBGrid1: TRxDBGrid;
    ToolButton1: TToolButton;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    MemMailsMon: TRxMemoryData;
    MemMailsMonID: TIntegerField;
    MemMailsMonTW_KOL: TFloatField;
    MemMailsMonMON1: TFloatField;
    MemMailsMonMON2: TFloatField;
    MemMailsMonPERCENT: TFloatField;
    MemMailsMonPRIM: TStringField;
    DsMailsMon: TDataSource;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    PopupMenu1: TPopupMenu;
    MnSave: TMenuItem;
    N2: TMenuItem;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    procedure BtnNewClick(Sender: TObject);
    procedure MON1Change(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure MemMailsMonAfterDelete(DataSet: TDataSet);
    procedure BtnOpenClick(Sender: TObject);
    procedure DsMailsMonDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MAIL_NEW_MONEY: TMAIL_NEW_MONEY;

implementation

uses EditMailsMon;

{$R *.DFM}

procedure TMAIL_NEW_MONEY.BtnNewClick(Sender: TObject);
begin
     Application.createForm(TEDIT_MAILS_MON,EDIT_MAILS_MON);
     EDIT_MAILS_MON.ROZN1.value:=MON1.value;
     EDIT_MAILS_MON.ROZN2.value:=MON2.value;
     EDIT_MAILS_MON.MON1.value:=MON1.value;
     EDIT_MAILS_MON.TW_KOL.value:=1;
     EDIT_MAILS_MON.TW_PRIM.text:='';
     EDIT_MAILS_MON.showModal;
     if EDIT_MAILS_MON.tag>0 then begin
        CanInsertMon:=true;
        MemMailsMon.Append;
        MemMailsMon.fieldByname('MON1').asfloat:=EDIT_MAILS_MON.MON1.value;
        MemMailsMon.fieldByname('MON2').asfloat:=EDIT_MAILS_MON.MON2.value;
        MemMailsMon.fieldByname('TW_KOL').asfloat:=EDIT_MAILS_MON.TW_KOL.value;
        MemMailsMon.fieldByname('PRIM').asstring:=EDIT_MAILS_MON.TW_PRIM.text;
        MemMailsMon.Post;
        CanInsertMon:=False;
     end;
     EDIT_MAILS_MON.destroy;
end;

procedure TMAIL_NEW_MONEY.MON1Change(Sender: TObject);
begin
     MON2.value:=MON1.value*TMP_COEFF;
end;

procedure TMAIL_NEW_MONEY.ToolButton5Click(Sender: TObject);
begin
     My_lock;
end;

procedure TMAIL_NEW_MONEY.BtnSaveClick(Sender: TObject);
begin
     tag:=2;
     close;
end;

procedure TMAIL_NEW_MONEY.FormShow(Sender: TObject);
begin
     tag:=0;
end;

procedure TMAIL_NEW_MONEY.BtnDelClick(Sender: TObject);
begin
     if Messbox('Удалить дополнительную цену?',MessSubmitDelete,4+48+256)=6 then begin
     end;
end;

procedure TMAIL_NEW_MONEY.MemMailsMonAfterDelete(DataSet: TDataSet);
var
   EN:boolean;
begin
     if MemMailsMon.recordcount=0 then EN:=False
     else EN:=True;
     BtnOpen.enabled:=En;
     MnOpen.enabled:=En;
     BtnDel.enabled:=En;
     MnDel.enabled:=En;
end;

procedure TMAIL_NEW_MONEY.BtnOpenClick(Sender: TObject);
begin
     Application.createForm(TEDIT_MAILS_MON,EDIT_MAILS_MON);
     EDIT_MAILS_MON.ROZN1.value:=MON1.value;
     EDIT_MAILS_MON.ROZN2.value:=MON2.value;
     EDIT_MAILS_MON.MON1.value:=MemMailsMon.fieldByname('MON1').asfloat;
     EDIT_MAILS_MON.TW_KOL.value:=MemMailsMon.fieldByname('TW_KOL').asfloat;
     EDIT_MAILS_MON.TW_PRIM.text:=MemMailsMon.fieldByname('PRIM').asstring;
     EDIT_MAILS_MON.showModal;
     if EDIT_MAILS_MON.tag>0 then begin
        MemMailsMon.Edit;
        MemMailsMon.fieldByname('MON1').asfloat:=EDIT_MAILS_MON.MON1.value;
        MemMailsMon.fieldByname('MON2').asfloat:=EDIT_MAILS_MON.MON2.value;
        MemMailsMon.fieldByname('TW_KOL').asfloat:=EDIT_MAILS_MON.TW_KOL.value;
        MemMailsMon.fieldByname('PRIM').asstring:=EDIT_MAILS_MON.TW_PRIM.text;
        MemMailsMon.Post;
     end;
     EDIT_MAILS_MON.destroy;
end;

procedure TMAIL_NEW_MONEY.DsMailsMonDataChange(Sender: TObject;
  Field: TField);
begin
     if (MemMailsMon.State in [dsInsert]) and ( not CanInsertMon) then MemMailsMon.Cancel;
end;

end.
