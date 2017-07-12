unit DICSPISVID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_DBUtils,B_Utils, Db, IBCustomDataSet, IBQuery, IBDatabase, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Menus;

type
  TDIC_SPISVID = class(TForm)
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
    Query_SPISVID: TIBQuery;
    DsSPISVID: TDataSource;
    Query_SPISVIDSPISVID_ID: TIntegerField;
    Query_SPISVIDSPISVID_NAM: TIBStringField;
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
    procedure Query_SPISVIDAfterOpen(DataSet: TDataSet);
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
  DIC_SPISVID: TDIC_SPISVID;

implementation

uses EditSpisVid;

{$R *.DFM}

procedure TDIC_SPISVID.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Query_SPISVID.close;
end;

procedure TDIC_SPISVID.FormShow(Sender: TObject);
begin
     Query_SPISVID.close;
     Query_SPISVID.Open;
end;

procedure TDIC_SPISVID.BtnNEWClick(Sender: TObject);
begin
     Application.createForm(TEDIT_SPISVID,EDIT_SPISVID);
     EDIT_SPISVID.tag:=-1;
     EDIT_SPISVID.ShowModal;
     if EDIT_SPISVID.tag>0 then begin
       TransactionVid.Active:=False;
       Query_SPISVID.close;
       Query_SPISVID.Open;
       Query_SPISVID.locate('SPISVID_ID',EDIT_SPISVID.tag,[]);
     end;
     RxDbgrid1.setfocus;
end;

procedure TDIC_SPISVID.BtnOPENClick(Sender: TObject);
begin
     Application.createForm(TEDIT_SPISVID,EDIT_SPISVID);
     EDIT_SPISVID.tag:=Query_SPISVID.fieldByname('SPISVID_ID').asinteger;
     EDIT_SPISVID.ShowModal;
     TransactionVid.Active:=False;
     Query_SPISVID.close;
     Query_SPISVID.Open;
     Query_SPISVID.locate('SPISVID_ID',EDIT_SPISVID.tag,[]);
     RxDbgrid1.setfocus;
end;

procedure TDIC_SPISVID.BtnDELClick(Sender: TObject);
begin
     if Messbox('Удалить вид Акта списания "'+Query_SPISVID.FieldByname('SPISVID_NAM').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('SPISVID',Query_SPISVID.FieldByname('SPISVID_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        TransactionVid.Active:=False;
        Query_SPISVID.close;
        Query_SPISVID.Open;
        RxDbgrid1.setfocus;
     end;
end;

procedure TDIC_SPISVID.Query_SPISVIDAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
     EN:=not Query_SPISVID.eof;
     BtnOpen.enabled:=En;
     BtnDel.enabled:=En;
     MnOpen.enabled:=En;
     MnDel.enabled:=En;
end;

procedure TDIC_SPISVID.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDIC_SPISVID.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.enabled) then begin
        key:=#0;
        BtnOpen.click;
     end;
end;

procedure TDIC_SPISVID.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        key:=#0;
        close;
     end;

end;

procedure TDIC_SPISVID.ToolButton2Click(Sender: TObject);
begin
     My_lock;
     
end;

end.
