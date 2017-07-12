unit DicDost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DBUtils, Menus, ComCtrls, ToolWin, Db, IBCustomDataSet,
  IBQuery, IBDatabase, Grids, DBGrids, RXDBCtrl;

type
  TDIC_DOST = class(TForm)
    ToolBar1: TToolBar;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    PopupMenu1: TPopupMenu;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    UsGroupTransaction: TIBTransaction;
    QrUsGroup: TIBQuery;
    QrUsGroupUSGROUP_ID: TIntegerField;
    QrUsGroupUSGROUP_NAME: TIBStringField;
    QrUsGroupUSGROUP_PRIM: TIBStringField;
    DsUsGroup: TDataSource;
    RxDBGrid1: TRxDBGrid;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    QrUsGroupCLOSE_PER: TIntegerField;
    procedure BtnNewClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure QrUsGroupAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_DOST: TDIC_DOST;

implementation

uses EditUsgroup;

{$R *.DFM}

procedure TDIC_DOST.BtnNewClick(Sender: TObject);
begin
     Application.createForm(TEdit_USGROUP,Edit_USGROUP);
     Edit_USGROUP.tag:=-1;
     Edit_USGROUP.ShowModal;
     if Edit_USGROUP.tag>0 then begin
        UsgroupTransaction.Active:=False;
        QrUsgroup.close;
        QrUsgroup.Open;
        QrUsgroup.locate('USGROUP_ID',Edit_USGROUP.tag,[]);
     end;
     Edit_USGROUP.destroy;
     RxDbgrid1.setfocus;
end;

procedure TDIC_DOST.BtnOpenClick(Sender: TObject);
begin
     Application.createForm(TEdit_USGROUP,Edit_USGROUP);
     Edit_USGROUP.tag:=QrUsgroup.fieldByname('USGROUP_ID').asinteger;
     Edit_USGROUP.ShowModal;
     UsgroupTransaction.Active:=False;
     QrUsgroup.close;
     QrUsgroup.Open;
     QrUsgroup.locate('USGROUP_ID',Edit_USGROUP.tag,[]);
     Edit_USGROUP.destroy;
     RxDbgrid1.setfocus;
end;

procedure TDIC_DOST.BtnDelClick(Sender: TObject);
begin
     if Messbox('Удалить вид доступа "'+QrUsgroup.FieldByname('USGROUP_NAM').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        IBDELETE_DOC('USGROUP',QrUsgroup.FieldByname('USGROUP_ID').asinteger);
        UsgroupTransaction.Active:=False;
        QrUsgroup.close;
        QrUsgroup.Open;
        RxDbgrid1.setfocus;
     end;
end;

procedure TDIC_DOST.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrUsgroup.close;
     UsgroupTransaction.Active:=False;
end;

procedure TDIC_DOST.FormShow(Sender: TObject);
begin
     UsgroupTransaction.Active:=False;
     QrUsgroup.close;
     QrUsgroup.Open;
end;

procedure TDIC_DOST.QrUsGroupAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
     EN:=Not QrUsgroup.eof;
     BtnOpen.enabled:=EN;
     MnOpen.enabled:=EN;
     BtnDel.enabled:=EN;
     MnDel.enabled:=EN;
end;

procedure TDIC_DOST.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDIC_DOST.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

end.
