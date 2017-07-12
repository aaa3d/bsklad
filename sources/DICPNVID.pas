unit DICPNVID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_DBUtils,B_Utils, Db, IBCustomDataSet, IBQuery, IBDatabase, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Menus;

type
  TDIC_PNVID = class(TForm)
    Panel2: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    BtnNEW: TToolButton;
    BtnOPEN: TToolButton;
    BtnDEL: TToolButton;
    RxDBGrid1: TRxDBGrid;
    TransactionVID: TIBTransaction;
    Query_PNVID: TIBQuery;
    DsPNVID: TDataSource;
    Query_PNVIDPNVID_ID: TIntegerField;
    Query_PNVIDPNVID_NAM: TIBStringField;
    ToolButton1: TToolButton;
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    Query_PNVIDPNVID_ACTIV: TIntegerField;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnNEWClick(Sender: TObject);
    procedure BtnOPENClick(Sender: TObject);
    procedure BtnDELClick(Sender: TObject);
    procedure Query_PNVIDAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_PNVID: TDIC_PNVID;

implementation

uses EditPnVid;

{$R *.DFM}

procedure TDIC_PNVID.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Query_PNVID.close;
     TransactionVid.Active:=False;
end;

procedure TDIC_PNVID.FormShow(Sender: TObject);
begin
     TransactionVid.Active:=False;
     Query_PNVID.close;
     Query_PNVID.Open;
end;

procedure TDIC_PNVID.BtnNEWClick(Sender: TObject);
begin
     Application.createForm(TEDIT_PNVID,EDIT_PNVID);
     EDIT_PNVID.tag:=-1;
     EDIT_PNVID.ShowModal;
     if EDIT_PNVID.tag>0 then begin
       TransactionVid.Active:=False;
       Query_PNVID.close;
       Query_PNVID.Open;
       Query_PNVID.locate('PNVID_ID',EDIT_PNVID.tag,[]);
     end;
     RxDbgrid1.setfocus;
end;

procedure TDIC_PNVID.BtnOPENClick(Sender: TObject);
begin
     Application.createForm(TEDIT_PNVID,EDIT_PNVID);
     EDIT_PNVID.tag:=Query_PNVID.fieldByname('PNVID_ID').asinteger;
     EDIT_PNVID.ShowModal;
     TransactionVid.Active:=False;
     Query_PNVID.close;
     Query_PNVID.Open;
     Query_PNVID.locate('PNVID_ID',EDIT_PNVID.tag,[]);
     RxDbgrid1.setfocus;

end;

procedure TDIC_PNVID.BtnDELClick(Sender: TObject);
begin
     if Messbox('Удалить вид приходной накладной "'+Query_PNVID.FieldByname('PNVID_NAM').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('PNVID',Query_PNVID.FieldByname('PNVID_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        TransactionVid.Active:=False;
        Query_PNVID.close;
        Query_PNVID.Open;
        RxDbgrid1.setfocus;
     end;

end;

procedure TDIC_PNVID.Query_PNVIDAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
     EN:=not Query_PNVID.eof;
     BtnOpen.enabled:=En;
     BtnDel.enabled:=En;
     MnOpen.enabled:=En;
     MnDel.enabled:=En;
end;

procedure TDIC_PNVID.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDIC_PNVID.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.enabled) then begin
        key:=#0;
        BtnOpen.click;
     end;
end;

procedure TDIC_PNVID.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TDIC_PNVID.ToolButton3Click(Sender: TObject);
begin
     My_lock;
end;

end.
