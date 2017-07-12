unit LinkNotable;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, Grids, DBGridEh, Db, IBCustomDataSet, IBQuery,
  IBDatabase, ComCtrls, ToolWin;

type
  TLINK_NOTABLE = class(TForm)
    ToolBar1: TToolBar;
    BtnNew: TToolButton;
    BtnDel: TToolButton;
    ListTransaction: TIBTransaction;
    BtnOpen: TToolButton;
    QueryList: TIBQuery;
    QueryListCFG_ID: TIntegerField;
    QueryListCFG_VALUE: TIBStringField;
    QueryListCFG_BIG: TIBStringField;
    DsList: TDataSource;
    DBGridEh1: TDBGridEh;
    QueryListCFG_SET1: TIntegerField;
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
  LINK_NOTABLE: TLINK_NOTABLE;

implementation

uses EditLinkNotable;

{$R *.DFM}

procedure TLINK_NOTABLE.QueryListAfterOpen(DataSet: TDataSet);
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

procedure TLINK_NOTABLE.BtnNewClick(Sender: TObject);
begin
   Application.createForm(TEDIT_LINKNOTABLE,EDIT_LINKNOTABLE);
   EDIT_LINKNOTABLE.tag:=-1;
   EDIT_LINKNOTABLE.showModal;
   if EDIT_LINKNOTABLE.tag>0 then begin
      ListTransaction.Active:=False;
      QueryList.close;
      QueryList.open;
      QueryList.locate('CFG_ID',EDIT_LINKNOTABLE.tag,[]);
   end;
   EDIT_LINKNOTABLE.destroy;
end;

procedure TLINK_NOTABLE.FormShow(Sender: TObject);
begin
   ListTransaction.Active:=False;
   QueryList.close;
   QueryList.open;
end;

procedure TLINK_NOTABLE.QueryListAfterScroll(DataSet: TDataSet);
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

procedure TLINK_NOTABLE.DBGridEh1DblClick(Sender: TObject);
begin
   if BtnOpen.enabled then BtnOpen.click;
end;

procedure TLINK_NOTABLE.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
    if (key=#13) and (BtnOpen.enabled) then begin
       BtnOpen.click;
    end;
end;

procedure TLINK_NOTABLE.BtnOpenClick(Sender: TObject);
begin
   Application.createForm(TEDIT_LINKNOTABLE,EDIT_LINKNOTABLE);
   EDIT_LINKNOTABLE.tag:=QueryList.fieldByname('CFG_ID').asinteger;
   EDIT_LINKNOTABLE.showModal;
   if EDIT_LINKNOTABLE.tag>0 then begin
      ListTransaction.Active:=False;
      QueryList.close;
      QueryList.open;
      QueryList.locate('CFG_ID',EDIT_LINKNOTABLE.tag,[]);
   end;
   EDIT_LINKNOTABLE.destroy;
end;

procedure TLINK_NOTABLE.BtnDelClick(Sender: TObject);
begin
    if Messbox('Удалить из перечня таблицу "'+Querylist.fieldByname('cfg_value').asstring+'"?',MessSubmitDelete,4+48+256)=6 then begin
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
