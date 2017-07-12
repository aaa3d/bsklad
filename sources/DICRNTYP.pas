unit DICRNTYP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_DBUtils,B_Utils, Db, IBCustomDataSet, IBQuery, IBDatabase, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Menus;

type
  TDIC_RNTYP = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    BtnNEW: TToolButton;
    BtnOPEN: TToolButton;
    BtnDEL: TToolButton;
    RxDBGrid1: TRxDBGrid;
    TransactionTYP: TIBTransaction;
    Query_RNTYP: TIBQuery;
    DsRNTYP: TDataSource;
    PopupMenu1: TPopupMenu;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    ToolButton1: TToolButton;
    Image1: TImage;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Query_RNTYPRNTYP_ID: TIntegerField;
    Query_RNTYPRNTYP_SHORT: TIBStringField;
    Query_RNTYPRNTYP_FULL: TIBStringField;
    Query_RNTYPRNTYP_NDS_FULL: TIBStringField;
    Query_RNTYPNOCLOSE_FULL: TIBStringField;
    Query_RNTYPNP: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnNEWClick(Sender: TObject);
    procedure BtnOPENClick(Sender: TObject);
    procedure BtnDELClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Query_RNTYPAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_RNTYP: TDIC_RNTYP;

implementation

uses EditRnTyp;

{$R *.DFM}

procedure TDIC_RNTYP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Query_RNTYP.close;
     TransactionTyp.Active:=False;
end;

procedure TDIC_RNTYP.FormShow(Sender: TObject);
begin
     TransactionTyp.Active:=False;
     Query_RNTYP.close;
     Query_RNTYP.Open;
end;

procedure TDIC_RNTYP.BtnNEWClick(Sender: TObject);
begin
     Application.createForm(TEDIT_RNTYP,EDIT_RNTYP);
     EDIT_RNTYP.tag:=-1;
     EDIT_RNTYP.ShowModal;
     if EDIT_RNTYP.tag>0 then begin
       TransactionTyp.Active:=False;
       Query_RNTYP.close;
       Query_RNTYP.Open;
       Query_RNTYP.locate('RNTYP_ID',EDIT_RNTYP.tag,[]);
     end;
     RxDbgrid1.setfocus;
end;

procedure TDIC_RNTYP.BtnOPENClick(Sender: TObject);
begin
     Application.createForm(TEDIT_RNTYP,EDIT_RNTYP);
     EDIT_RNTYP.tag:=Query_RNTYP.fieldByname('RNTYP_ID').asinteger;
     EDIT_RNTYP.ShowModal;
     TransactionTyp.Active:=False;
     Query_RNTYP.close;
     Query_RNTYP.Open;
     Query_RNTYP.locate('RNTYP_ID',EDIT_RNTYP.tag,[]);
     RxDbgrid1.setfocus;
end;

procedure TDIC_RNTYP.BtnDELClick(Sender: TObject);
begin
     if Messbox('Удалить тип расходной накладной "'+Query_RNTYP.FieldByname('RNTYP_FULL').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('RNTYP',Query_RNTYP.FieldByname('RNTYP_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        TransactionTyp.Active:=False;
        Query_RNTYP.close;
        Query_RNTYP.Open;
        RxDbgrid1.setfocus;
     end;
end;

procedure TDIC_RNTYP.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDIC_RNTYP.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.enabled) then begin
        key:=#0;
        BtnOpen.click;
     end;
end;

procedure TDIC_RNTYP.Query_RNTYPAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
     EN:=not Query_RNTYP.eof;
     BtnOpen.enabled:=En;
     BtnDel.enabled:=En;
     MnOpen.enabled:=En;
     MnDel.enabled:=En;

end;

procedure TDIC_RNTYP.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TDIC_RNTYP.ToolButton3Click(Sender: TObject);
begin
     My_lock;
end;

end.
