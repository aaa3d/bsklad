unit EditPropTWKTGTREE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Db, IBCustomDataSet, IBQuery, IBDatabase,b_utils,b_dbutils;

type
  TEDIT_PROPTWKTGTREE = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    BtnSave: TButton;
    Button2: TButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_PROPTWKTGTREE: TEDIT_PROPTWKTGTREE;

implementation

uses Data1;

{$R *.DFM}

procedure TEDIT_PROPTWKTGTREE.Button2Click(Sender: TObject);
begin
   close;
end;

procedure TEDIT_PROPTWKTGTREE.FormShow(Sender: TObject);
begin
   if tag<0 then begin
      caption:='Новый раздел каталога';
      Edit1.text:='';
   end else begin
      caption:='Изменение раздела каталога';
      WorkTransaction.Active:=False;
      ADD_SQL(QueryWork,'select * from proptwktgtree where proptwktgtree_id=:proptwktgtree_id');
      QueryWork.paramByname('proptwktgtree_ID').asinteger:=tag;
      QueryWork.Open;
      Edit1.text:=QueryWork.fieldByname('proptwktgtree_name').asstring;
      QueryWork.Close;
   end;
end;

procedure TEDIT_PROPTWKTGTREE.BtnSaveClick(Sender: TObject);
var
        rr:integer;
        r:double;
begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
                IBSAVE_CLEAR;
                IBSAVE_ADD('PROPTWKTGTREE_NAME',Edit1.text);
                IBSAVE_ADD('PARENT_ID',BtnSave.tag);
                rr:=IBSAVE_DOC('PROPTWKTGTREE',tag);
                if rr<0 then r:=sqrt(-1);
                Datamodule1.IBTransaction2.Commit;
                Datamodule1.IBTransaction2.Active:=False;
                tag:=rr;
                close;
           except
                Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
end;

end.
