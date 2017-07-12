unit DICRNVID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_DBUtils,B_Utils, Db, IBCustomDataSet, IBQuery, IBDatabase, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Menus;

type
  TDIC_RNVID = class(TForm)
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
    Query_RNVID: TIBQuery;
    DsRNVID: TDataSource;
    Query_RNVIDRNVID_ID: TIntegerField;
    Query_RNVIDRNVID_NAM: TIBStringField;
    PopupMenu1: TPopupMenu;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    ToolButton1: TToolButton;
    Image1: TImage;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnNEWClick(Sender: TObject);
    procedure BtnOPENClick(Sender: TObject);
    procedure BtnDELClick(Sender: TObject);
    procedure Query_RNVIDAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_RNVID: TDIC_RNVID;

implementation

uses EditRnVid;

{$R *.DFM}

procedure TDIC_RNVID.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Query_RNVID.close;
     TransactionVid.Active:=False;
end;

procedure TDIC_RNVID.FormShow(Sender: TObject);
begin
     TransactionVid.Active:=False;
     Query_RNVID.close;
     Query_RNVID.Open;
end;

procedure TDIC_RNVID.BtnNEWClick(Sender: TObject);
begin
     Application.createForm(TEDIT_RNVID,EDIT_RNVID);
     EDIT_RNVID.tag:=-1;
     EDIT_RNVID.ShowModal;
     if EDIT_RNVID.tag>0 then begin
       TransactionVid.Active:=False;
       Query_RNVID.close;
       Query_RNVID.Open;
       Query_RNVID.locate('RNVID_ID',EDIT_RNVID.tag,[]);
     end;
     RxDbgrid1.setfocus;
end;

procedure TDIC_RNVID.BtnOPENClick(Sender: TObject);
begin
     Application.createForm(TEDIT_RNVID,EDIT_RNVID);
     EDIT_RNVID.tag:=Query_RNVID.fieldByname('RNVID_ID').asinteger;
     EDIT_RNVID.ShowModal;
     TransactionVid.Active:=False;
     Query_RNVID.close;
     Query_RNVID.Open;
     Query_RNVID.locate('RNVID_ID',EDIT_RNVID.tag,[]);
     RxDbgrid1.setfocus;
end;

procedure TDIC_RNVID.BtnDELClick(Sender: TObject);
begin
     if Messbox('Удалить вид расходной накладной "'+Query_RNVID.FieldByname('RNVID_NAM').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('RNVID',Query_RNVID.FieldByname('RNVID_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        TransactionVid.Active:=False;
        Query_RNVID.close;
        Query_RNVID.Open;
        RxDbgrid1.setfocus;
     end;
end;

procedure TDIC_RNVID.Query_RNVIDAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
     EN:=not Query_RNVID.eof;
     BtnOpen.enabled:=En;
     BtnDel.enabled:=En;
     MnOpen.enabled:=En;
     MnDel.enabled:=En;
end;

procedure TDIC_RNVID.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDIC_RNVID.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.enabled) then begin
        key:=#0;
        BtnOpen.click;
     end;
end;

procedure TDIC_RNVID.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TDIC_RNVID.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

end.
