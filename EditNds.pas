unit EditNds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls,Data1,b_utils,b_Dbutils, ActnList, ToolEdit, StdCtrls,
  Mask, CurrEdit, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TEDIT_NDS = class(TForm)
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    ActApply: TAction;
    ActSave: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    NDS: TRxCalcEdit;
    NDS_DATE: TDateEdit;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure ActSaveExecute(Sender: TObject);
    procedure ActApplyExecute(Sender: TObject);
    procedure NDSChange(Sender: TObject);
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
  EDIT_NDS: TEDIT_NDS;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEDIT_NDS.ActSaveExecute(Sender: TObject);
begin
   ActApply.Execute;
   if SAVE then close;
end;

procedure TEDIT_NDS.ActApplyExecute(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   // Применить
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
      IBSAVE_CLEAR;
      IBSAVE_ADD('NDS',NDS.value);
      IBSAVE_ADD('NDS_DATE',NDS_DATE.date);
      IBSAVE_ADD('US_ID',USERID);
      ID:=ibsave_doc('NDS',EDIT_NDS.tag);
      if ID<0 then r:=sqrt(-1);
      EDIT_NDS.tag:=ID;
      Save:=True;
      Datamodule1.IBTransaction2.Commit;
   except
      Datamodule1.IBTransaction2.Rollback;
   end;
   Datamodule1.IBTransaction2.Active:=False;
   show_sost;
end;

procedure TEDIT_NDS.NDSChange(Sender: TObject);
begin
   save:=False;
end;

procedure TEDIT_NDS.Show_sost;
begin
  if EDIT_NDS.tag<=0 then caption:='Ставка НДС. Новая'
                     else caption:='Ставка НДС. Редактирование';
end;

procedure TEDIT_NDS.FormShow(Sender: TObject);
begin
    if tag<0 then begin
       NDS.value:=0;
       NDS_DATE.date:=Date();
    end else begin
       Worktransaction.Active:=False;
       ADD_SQL(QueryWork,'select * from NDS where NDS_ID=:NDS_ID');
       QueryWork.ParamByname('NDS_ID').asinteger:=tag;
       QueryWork.open;
       NDS.value:=QueryWork.fieldByname('NDS').asfloat;
       NDS_DATE.date:=QueryWork.fieldByname('NDS_DATE').asdatetime;
       QueryWork.close;
    end;
    Show_sost;
    SAVE:=True;
end;

procedure TEDIT_NDS.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then close;
end;

procedure TEDIT_NDS.ToolButton3Click(Sender: TObject);
begin
  my_lock;
end;

procedure TEDIT_NDS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save)  then begin
        if Messbox(MessChange,MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

end.
