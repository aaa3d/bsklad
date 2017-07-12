unit DICPNTYP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_DBUtils,B_Utils, Db, IBCustomDataSet, IBQuery, IBDatabase, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Menus;

type
  TDIC_PNTYP = class(TForm)
    Panel2: TPanel;
    Image2: TImage;
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    BtnNEW: TToolButton;
    BtnOPEN: TToolButton;
    BtnDELETE: TToolButton;
    RxDBGrid1: TRxDBGrid;
    TransactionTYP: TIBTransaction;
    Query_PNTYP: TIBQuery;
    DsPNTYP: TDataSource;
    Query_PNTYPPNTYP_ID: TIntegerField;
    Query_PNTYPPNTYP_SHORT: TIBStringField;
    Query_PNTYPPNTYP_FULL: TIBStringField;
    Query_PNTYPNUM_TYP: TSmallintField;
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
    procedure BtnDELETEClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Query_PNTYPAfterOpen(DataSet: TDataSet);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_PNTYP: TDIC_PNTYP;

implementation

uses EditPnTyp;

{$R *.DFM}

procedure TDIC_PNTYP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Query_PNTYP.close;
     TransactionTyp.Active:=False;
end;

procedure TDIC_PNTYP.FormShow(Sender: TObject);
begin
     TransactionTyp.Active:=False;
     Query_PNTYP.close;
     Query_PNTYP.Open;
end;

procedure TDIC_PNTYP.BtnNEWClick(Sender: TObject);
begin
     Application.createForm(TEDIT_PNTYP,EDIT_PNTYP);
     EDIT_PNTYP.tag:=-1;
     EDIT_PNTYP.ShowModal;
     if EDIT_PNTYP.tag>0 then begin
       TransactionTyp.Active:=False;
       Query_PNTYP.close;
       Query_PNTYP.Open;
       Query_PNTYP.locate('PNTYP_ID',EDIT_PNTYP.tag,[]);
     end;
     RxDbgrid1.setfocus;
end;

procedure TDIC_PNTYP.BtnOPENClick(Sender: TObject);
begin
     Application.createForm(TEDIT_PNTYP,EDIT_PNTYP);
     EDIT_PNTYP.tag:=Query_PNTYP.fieldByname('PNTYP_ID').asinteger;
     EDIT_PNTYP.ShowModal;
     TransactionTyp.Active:=False;
     Query_PNTYP.close;
     Query_PNTYP.Open;
     Query_PNTYP.locate('PNTYP_ID',EDIT_PNTYP.tag,[]);
     RxDbgrid1.setfocus;
end;

procedure TDIC_PNTYP.BtnDELETEClick(Sender: TObject);
begin
     if Messbox('Удалить тип приходной накладной "'+Query_PNTYP.FieldByname('PNTYP_FULL').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('PNTYP',Query_PNTYP.FieldByname('PNTYP_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        TransactionTyp.Active:=False;
        Query_PNTYP.close;
        Query_PNTYP.Open;
        RxDbgrid1.setfocus;
     end;
end;

procedure TDIC_PNTYP.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDIC_PNTYP.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TDIC_PNTYP.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.enabled) then begin
        key:=#0;
        BtnOpen.click;
     end;
end;

procedure TDIC_PNTYP.Query_PNTYPAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
     EN:=not Query_PNTYP.eof;
     BtnOpen.enabled:=En;
     BtnDelete.enabled:=En;
     MnOpen.enabled:=En;
     MnDel.enabled:=En;

end;

procedure TDIC_PNTYP.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

end.
