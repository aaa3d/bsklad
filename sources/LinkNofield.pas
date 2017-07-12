unit LinkNofield;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, Db, IBCustomDataSet, IBQuery, IBDatabase,
  ComCtrls, ToolWin, Grids, DBGridEh;

type
  TLINK_NOFIELD = class(TForm)
    ToolBar1: TToolBar;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    BtnDel: TToolButton;
    ListTransaction: TIBTransaction;
    QueryList: TIBQuery;
    QueryListCFG_ID: TIntegerField;
    QueryListCFG_VALUE: TIBStringField;
    QueryListCFG_BIG: TIBStringField;
    QueryListCFG_SET1: TIntegerField;
    QueryListCFG_TABLE: TStringField;
    QueryListCFG_FIELD: TStringField;
    DsList: TDataSource;
    DBGridEh1: TDBGridEh;
    procedure QueryListCalcFields(DataSet: TDataSet);
    procedure QueryListAfterOpen(DataSet: TDataSet);
    procedure BtnNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QueryListAfterScroll(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LINK_NOFIELD: TLINK_NOFIELD;

implementation

uses EditLinkNoField;

{$R *.DFM}

procedure TLINK_NOFIELD.QueryListCalcFields(DataSet: TDataSet);
begin
     QueryList.fieldByname('CFG_TABLE').asstring:=
     B_utils.Argc(QueryList.fieldByname('CFG_VALUE').asstring,1);
     QueryList.fieldByname('CFG_FIELD').asstring:=
     B_utils.Argc(QueryList.fieldByname('CFG_VALUE').asstring,2);
end;

procedure TLINK_NOFIELD.QueryListAfterOpen(DataSet: TDataSet);
var
  EN:boolean;
begin
    if QueryList.eof then EN:=False else begin
       if QueryList.fieldByname('CFG_SET1').asinteger=1 then EN:=False
       else EN:=True;
    end;
    BtnOpen.enabled:=EN;
    BtnDel.enabled:=EN;
end;

procedure TLINK_NOFIELD.BtnNewClick(Sender: TObject);
begin
   Application.createForm(TEDIT_LINKNOFIELD,EDIT_LINKNOFIELD);
   EDIT_LINKNOFIELD.tag:=-1;
   EDIT_LINKNOFIELD.showModal;
   if EDIT_LINKNOFIELD.tag>0 then begin
      ListTransaction.Active:=False;
      QueryList.close;
      QueryList.open;
      QueryList.locate('CFG_ID',EDIT_LINKNOFIELD.tag,[]);
   end;
   EDIT_LINKNOFIELD.destroy;

end;

procedure TLINK_NOFIELD.FormShow(Sender: TObject);
begin
   ListTransaction.Active:=False;
   QueryList.close;
   QueryList.open;
end;

procedure TLINK_NOFIELD.QueryListAfterScroll(DataSet: TDataSet);
var
  EN:boolean;
begin
    if QueryList.fieldByname('CFG_SET1').asstring<>'' then begin
       if QueryList.fieldByname('CFG_SET1').asinteger=1 then EN:=False
       else EN:=True;
    end else EN:=False;
    BtnOpen.enabled:=EN;
    BtnDel.enabled:=EN;
end;

procedure TLINK_NOFIELD.DBGridEh1DblClick(Sender: TObject);
begin
   if BtnOpen.enabled then BtnOpen.click;
end;

procedure TLINK_NOFIELD.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
    if (key=#13) and (BtnOpen.enabled) then begin
       BtnOpen.click;
    end;
end;

procedure TLINK_NOFIELD.BtnOpenClick(Sender: TObject);
begin
   Application.createForm(TEDIT_LINKNOFIELD,EDIT_LINKNOFIELD);
   EDIT_LINKNOFIELD.tag:=QueryList.fieldByname('CFG_ID').asinteger;
   EDIT_LINKNOFIELD.showModal;
   if EDIT_LINKNOFIELD.tag>0 then begin
      ListTransaction.Active:=False;
      QueryList.close;
      QueryList.open;
      QueryList.locate('CFG_ID',EDIT_LINKNOFIELD.tag,[]);
   end;
   EDIT_LINKNOFIELD.destroy;
end;

procedure TLINK_NOFIELD.BtnDelClick(Sender: TObject);
begin
    if Messbox('Удалить из перечня таблицу "'+Querylist.fieldByname('cfg_table').asstring+
    ' с полем "'+Querylist.fieldByname('cfg_field').asstring+'"?',MessSubmitDelete,4+48+256)=6 then begin
      Datamodule1.IBTransaction2.Active:=False;
      Datamodule1.IBTransaction2.StartTransaction;
      IF IBDELETE_DOC('CFG',QueryList.fieldByname('CFG_ID').asinteger) then begin
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        ListTransaction.Active:=False;
        QueryList.close;
      QueryList.open;
      end else Datamodule1.IBTransaction2.Rollback;
      Datamodule1.IBTransaction2.Active:=False;
    end;
end;

end.
