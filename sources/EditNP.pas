unit EditNP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls,Data1,b_utils,b_Dbutils, ActnList, ToolEdit, StdCtrls,
  Mask, CurrEdit, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TEDIT_NP = class(TForm)
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    ActApply: TAction;
    ActSave: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    NP: TRxCalcEdit;
    NP_DATE: TDateEdit;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure ActSaveExecute(Sender: TObject);
    procedure ActApplyExecute(Sender: TObject);
    procedure NPChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Show_sost;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_NP: TEDIT_NP;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEDIT_NP.ActSaveExecute(Sender: TObject);
begin
   ActApply.Execute;
   if SAVE then close;
end;

procedure TEDIT_NP.ActApplyExecute(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   // Применить
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
      IBSAVE_CLEAR;
      IBSAVE_ADD('NP',NP.value);
      IBSAVE_ADD('RNTYP_ID',Toolbar1.tag); // Через Toolbar передаем код типа расходных накладных
      IBSAVE_ADD('NP_DATE',NP_DATE.date);
      IBSAVE_ADD('US_ID',USERID);
      ID:=ibsave_doc('NP',EDIT_NP.tag);
      if ID<0 then r:=sqrt(-1);
      EDIT_NP.tag:=ID;
      Save:=True;
      Datamodule1.IBTransaction2.Commit;
   except
      Datamodule1.IBTransaction2.Rollback;
   end;
   Datamodule1.IBTransaction2.Active:=False;
   show_sost;
end;

procedure TEDIT_NP.NPChange(Sender: TObject);
begin
   save:=False;
end;

procedure TEDIT_NP.Show_sost;
begin
  if EDIT_NP.tag<=0 then caption:='Ставка НП. Новая'
                     else caption:='Ставка НП. Редактирование';
end;

procedure TEDIT_NP.FormShow(Sender: TObject);
begin
    if tag<0 then begin
       NP.value:=0;
       NP_DATE.date:=Date();
    end else begin
       Worktransaction.Active:=False;
       ADD_SQL(QueryWork,'select * from NP where NP_ID=:NP_ID');
       QueryWork.ParamByname('NP_ID').asinteger:=tag;
       QueryWork.open;
       NP.value:=QueryWork.fieldByname('NP').asfloat;
       NP_DATE.date:=QueryWork.fieldByname('NP_DATE').asdatetime;
       QueryWork.close;
    end;
    Show_sost;
    SAVE:=True;
end;

procedure TEDIT_NP.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then close;
end;

procedure TEDIT_NP.ToolButton3Click(Sender: TObject);
begin
  my_lock;
end;

procedure TEDIT_NP.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save)  then begin
        if Messbox(MessChange,MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

end.
