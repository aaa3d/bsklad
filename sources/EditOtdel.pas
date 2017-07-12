unit EditOtdel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ToolWin,B_utils,b_Dbutils,Data1, ActnList, Db,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TEDIT_OTDEL = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    OTDEL_NAME: TEdit;
    ActionList1: TActionList;
    ActApply: TAction;
    ActSave: TAction;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure OTDEL_NAMEChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActApplyExecute(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_OTDEL: TEDIT_OTDEL;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEDIT_OTDEL.FormShow(Sender: TObject);
begin
    if tag<0 then begin
       OTDEL_NAME.text:='';
    end else begin
       WorkTransaction.Active:=False;
       ADD_SQL(QueryWork,'select otdel_name from otdel where otdel_id=:otdel_id');
       QueryWork.ParamByname('OTDEL_ID').asinteger:=tag;
       QueryWork.Open;
       OTDEL_NAME.text:=QueryWork.fieldByname('OTDEL_NAME').asstring;
    end;
    SAVE:=True;
end;


procedure TEDIT_OTDEL.OTDEL_NAMEChange(Sender: TObject);
begin
    SAVE:=False;
end;

procedure TEDIT_OTDEL.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if SAVE then CanClose:=true else begin
      if messbox(MessChange,MessSUbmit,4+48+256)=6 then CanClose:=true else CanClose:=False;
   end
end;

procedure TEDIT_OTDEL.ActApplyExecute(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   // Применить
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   IBSAVE_CLEAR;
   IBSAVE_ADD('OTDEL_NAME',OTDEL_NAME.text);
   try
     ID:=IBSAVE_DOC('OTDEL',EDIT_OTDEL.tag);
     if ID<0 then r:=sqrt(-1);
     EDIT_OTDEL.tag:=ID;
     Datamodule1.IBTransaction2.Commit;
     SAVE:=true;
   except
     Datamodule1.IBTransaction2.Rollback;
     SAVE:=False;
   end;
   Datamodule1.IBTransaction2.Active:=False;
end;

procedure TEDIT_OTDEL.ActSaveExecute(Sender: TObject);
begin
   // Сохранить
   if ActApply.Enabled then ActApply.Execute;
   if SAVE then close;
end;

procedure TEDIT_OTDEL.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#27 then begin
       key:=#0;
       close;
    end;
end;

end.
