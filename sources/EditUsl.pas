unit EditUsl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls,b_utils,b_Dbutils,Data1, ActnList, Db,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TEdit_USL = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    NAME: TEdit;
    DEB: TEdit;
    CRED: TEdit;
    ActionList1: TActionList;
    Action1: TAction;
    ToolButton1: TToolButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure Action1Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure NAMEChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_USL: TEdit_USL;
  SAVE:Boolean;

implementation

{$R *.DFM}

procedure TEdit_USL.Action1Execute(Sender: TObject);
var
   ID:integer;
   r:double;
begin
   SAVE:=False;
   if (trim(NAME.text)='') then Messbox('Ќаименование не может быть пустой строкой!',MessSystem,48) else begin
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     IBSAVE_CLEAR;
     IBSAVE_ADD('USL_NAME',NAME.text);
     IBSAVE_ADD('DEB',trim(DEB.text));
     IBSAVE_ADD('CRED',trim(Cred.text));
     try
       ID:=IBSAVE_DOC('USL',EDIT_USL.tag);
       if ID<0 then r:=sqrt(-1) else EDIT_USL.tag:=ID;
       Datamodule1.IBTransaction2.Commit;
       SAVE:=true;
     Except
       Datamodule1.IBTransaction2.Rollback;
     End;
     Datamodule1.IBTransaction2.Active:=False;
   end;
   if SAVE then close;
end;

procedure TEdit_USL.FormShow(Sender: TObject);
begin
    if Edit_USl.tag<0 then begin
    end else begin
      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select usl_name,deb,cred from usl where usl_id=:usl_id');
      QueryWork.ParamByname('USL_ID').asinteger:=tag;
      QueryWork.Open;
      NAME.text:=QueryWork.FieldByname('USL_NAME').asstring;
      DEB.text:=QueryWork.FieldByname('DEB').asstring;
      CRED.text:=QueryWork.FieldByname('CRED').asstring;
      QueryWork.Close;
    end;
    SAVE:=True;
end;

procedure TEdit_USL.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#27 then begin
       key:=#0;
       close;
    end;
end;

procedure TEdit_USL.NAMEChange(Sender: TObject);
begin
   SAVE:=False;
end;

procedure TEdit_USL.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if not Save then begin
        CanClose:=false;
        if Messbox('ƒанные были изменены! ¬ы подтверждаете выход без сохранени€ изменений?',MessSubmit,4+48+256)=6 then CanClose:=True;
     end else CanClose:=true;
end;

end.


