unit DICZONE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_DBUtils,B_Utils, Db, IBCustomDataSet, IBQuery, IBDatabase, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Menus;

type
  TDIC_ZONE = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    BtnNEW: TToolButton;
    BtnOPEN: TToolButton;
    BtnDEL: TToolButton;
    RxDBGrid1: TRxDBGrid;
    TransactionZone: TIBTransaction;
    Query_ZONE: TIBQuery;
    DsZone: TDataSource;
    PopupMenu1: TPopupMenu;
    MnNew: TMenuItem;
    MnOpen: TMenuItem;
    MnDel: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    IBQuery1: TIBQuery;
    Query_ZONEZONE_ID: TIntegerField;
    Query_ZONESKL_ID: TIntegerField;
    Query_ZONEZONE_NAME: TIBStringField;
    Query_ZONEZONE_DESCR: TIBStringField;
    Query_ZONETM: TDateTimeField;
    Query_ZONESKL_SHORT: TIBStringField;
    Query_ZONETW_DATE_PROIZV: TIBStringField;
    Query_ZONEZONE_KUBATURA: TFloatField;
    Query_ZONEZONE_TYPE: TIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnNEWClick(Sender: TObject);
    procedure BtnOPENClick(Sender: TObject);
    procedure BtnDELClick(Sender: TObject);
    procedure Query_ZONEAfterOpen(DataSet: TDataSet);
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
  DIC_ZONE: TDIC_ZONE;

implementation

uses EditRnVid, EditZone;

{$R *.DFM}

procedure TDIC_ZONE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Query_ZONE.close;
     TransactionZone.Active:=False;
end;

procedure TDIC_ZONE.FormShow(Sender: TObject);
begin
     TransactionZone.Active:=False;
     Query_ZONE.close;
     Query_ZONE.Open;
end;

procedure TDIC_ZONE.BtnNEWClick(Sender: TObject);
begin
     Application.createForm(TEDIT_ZONE,EDIT_ZONE);
     EDIT_ZONE.tag:=-1;
     EDIT_ZONE.ShowModal;
     if EDIT_ZONE.tag>0 then begin
       TransactionZone.Active:=False;
       Query_ZONE.close;
       Query_ZONE.Open;
       Query_ZONE.locate('ZONE_ID',EDIT_ZONE.tag,[]);
     end;
     RxDbgrid1.setfocus;
end;

procedure TDIC_ZONE.BtnOPENClick(Sender: TObject);
begin
     Application.createForm(TEDIT_ZONE,EDIT_ZONE);
     EDIT_ZONE.tag:=Query_ZONE.fieldByname('ZONE_ID').asinteger;
     EDIT_ZONE.ShowModal;
     TransactionZone.Active:=False;
     Query_ZONE.close;
     Query_ZONE.Open;
     Query_ZONE.locate('ZONE_ID',EDIT_ZONE.tag,[]);
     RxDbgrid1.setfocus;
end;

procedure TDIC_ZONE.BtnDELClick(Sender: TObject);
begin
     if Messbox('Удалить зону "'+Query_ZONE.FieldByname('ZONE_NAME').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('ZONE',Query_ZONE.FieldByname('ZONE_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        TransactionZone.Active:=False;
        Query_ZONE.close;
        Query_ZONE.Open;
        RxDbgrid1.setfocus;
     end;
end;

procedure TDIC_ZONE.Query_ZONEAfterOpen(DataSet: TDataSet);
var
   EN:boolean;
begin
     EN:=not Query_ZONE.eof;
     BtnOpen.enabled:=En;
     BtnDel.enabled:=En;
     MnOpen.enabled:=En;
     MnDel.enabled:=En;
end;

procedure TDIC_ZONE.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TDIC_ZONE.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (BtnOpen.enabled) then begin
        key:=#0;
        BtnOpen.click;
     end;
end;

procedure TDIC_ZONE.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TDIC_ZONE.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

end.
