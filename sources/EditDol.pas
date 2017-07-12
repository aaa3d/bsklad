unit EditDol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, ComCtrls, ToolWin, Db, IBCustomDataSet, IBQuery,
  IBDatabase, StdCtrls, ActnList;

type
  TEDIT_DOL = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    DOL_NAME: TEdit;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ActionList1: TActionList;
    ActSave: TAction;
    ActApply: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure DOL_NAMEChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActApplyExecute(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_DOL: TEDIT_DOL;
  SAVE:boolean;

implementation

{$R *.DFM}

const
   CAP_INSERT='Зарплата. Новая штатная единица.';
   CAP_EDIT='Зарплата. Штатная единица. Редактирование.';

procedure TEDIT_DOL.DOL_NAMEChange(Sender: TObject);
begin
    SAVE:=False;
end;

procedure TEDIT_DOL.FormShow(Sender: TObject);
begin
   if tag<0 then begin
      Caption:=Cap_insert;
      DOL_NAME.text:='';
   end else begin
      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select dol_name from dol where dol_id=:dol_id');
      QueryWork.ParamByname('DOL_ID').asinteger:=EDIT_DOL.tag;
      QueryWork.open;
      Caption:=CAP_EDIT;
      DOL_NAME.text:=QueryWork.fieldByname('DOL_NAME').asstring;
   end;
   SAVE:=True;
end;

procedure TEDIT_DOL.ActApplyExecute(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   // Применить
   SAVE:=False;
   if trim(DOL_NAME.text)='' then messbox('Наименование штатной единицы не может быть пустой строкой!',MessSystem,48)
   else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     IBSAVE_CLEAR;
     IBSAVE_ADD('DOL_NAME',trim(DOL_NAME.text));
     IBSAVE_ADD('OTDEL_ID',DOL_NAME.tag);
     try
       ID:=IBSAVE_DOC('DOL',EDIT_DOL.tag);
       if ID<0 then r:=sqrt(-1);
       Datamodule1.IBTransaction2.Commit;
       EDIT_DOL.tag:=ID;
       SAVE:=True;
     except
       Datamodule1.IBTransaction2.Rollback;
     end;
     Datamodule1.IBTransaction2.Active:=False;
   end
end;

procedure TEDIT_DOL.ActSaveExecute(Sender: TObject);
begin
   // Сохранить
   if ActApply.enabled then ActApply.Execute;
   if SAVE then close;
end;

procedure TEDIT_DOL.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save) then begin
        if Messbox(MessChange,MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

end.
