unit EditKlnWorktype;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls,Data1,b_utils,b_Dbutils, ActnList, ToolEdit, StdCtrls,
  Mask, CurrEdit, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TEDIT_KLNWORKTYPE = class(TForm)
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    ActApply: TAction;
    ActSave: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label1: TLabel;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    KLN_WORKTYPE: TEdit;
    procedure ActSaveExecute(Sender: TObject);
    procedure ActApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Show_sost;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure KLN_WORKTYPEChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_KLNWORKTYPE: TEDIT_KLNWORKTYPE;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEDIT_KLNWORKTYPE.ActSaveExecute(Sender: TObject);
begin
   ActApply.Execute;
   if SAVE then close;
end;

procedure TEDIT_KLNWORKTYPE.ActApplyExecute(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   // Применить
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
      IBSAVE_CLEAR;
      IBSAVE_ADD('KLN_WORKTYPE_NAME',KLN_WORKTYPE.text);
      ID:=ibsave_doc('KLN_WORKTYPE',EDIT_KLNWORKTYPE.tag);
      if ID<0 then r:=sqrt(-1);
      EDIT_KLNWORKTYPE.tag:=ID;
      Save:=True;
      Datamodule1.IBTransaction2.Commit;
   except
      Datamodule1.IBTransaction2.Rollback;
   end;
   Datamodule1.IBTransaction2.Active:=False;
   show_sost;
end;

procedure TEDIT_KLNWORKTYPE.Show_sost;
begin
  if EDIT_KLNWORKTYPE.tag<=0 then caption:='Ставка НДС. Новая'
                     else caption:='Ставка НДС. Редактирование';
end;

procedure TEDIT_KLNWORKTYPE.FormShow(Sender: TObject);
begin
    if tag<0 then begin
       KLN_WORKTYPE.text:='';
    end else begin
       Worktransaction.Active:=False;
       ADD_SQL(QueryWork,'select * from KLN_WORKTYPE where KLN_WORKTYPE_ID=:ID');
       QueryWork.ParamByname('ID').asinteger:=tag;
       QueryWork.open;
       KLN_WORKTYPE.text:=QueryWork.fieldByname('KLN_WORKTYPE_NAME').asstring;
       QueryWork.close;
    end;
    Show_sost;
    SAVE:=True;
end;

procedure TEDIT_KLNWORKTYPE.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then close;
end;

procedure TEDIT_KLNWORKTYPE.ToolButton3Click(Sender: TObject);
begin
  my_lock;
end;

procedure TEDIT_KLNWORKTYPE.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (not Save)  then begin
        if Messbox(MessChange,MessSubmit,4+48+256)=6
        then CanClose:=true else CanClose:=False;
     end;
end;

procedure TEDIT_KLNWORKTYPE.KLN_WORKTYPEChange(Sender: TObject);
begin
save:=false;
end;

end.
