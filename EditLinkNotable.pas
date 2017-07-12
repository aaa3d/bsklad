unit EditLinkNotable;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Data1,
  B_utils,b_Dbutils, Db, IBCustomDataSet, IBQuery, IBDatabase, StdCtrls,
  ComCtrls, ToolWin;

type
  TEDIT_LINKNOTABLE = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    NAME: TEdit;
    PRIM: TMemo;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_LINKNOTABLE: TEDIT_LINKNOTABLE;

implementation

{$R *.DFM}

procedure TEDIT_LINKNOTABLE.FormShow(Sender: TObject);
begin
    if tag<0 then begin
       caption:=caption+'. Новая';
    end else begin
       NAME.enabled:=False;
       WorkTransaction.Active:=False;
       ADD_SQL(QueryWork,'select cfg_value,cfg_big,cfg_set1 from cfg where cfg_id=:cfg_id');
       QueryWork.ParamByname('CFG_ID').asinteger:=TAG;
       QueryWork.Open;
       NAME.text:=QueryWork.fieldByname('cfg_value').asstring;
       PRIM.text:=QueryWork.fieldByname('cfg_big').asstring;
       caption:=caption+'. Изменение "'+NAME.text+'"';
       PRIM.setfocus;
    end;
end;

procedure TEDIT_LINKNOTABLE.ToolButton1Click(Sender: TObject);
var
 ID:integer;
 r:double;
begin
  if (trim(NAME.text)='') then
  Messbox('Имя таблицы не может быть пустым!',MessSystem,48) else begin
    Datamodule1.IBTransaction2.Active:=False;
    Datamodule1.IBTransaction2.StartTransaction;
    try
      IBSAVE_CLEAR;
      IBSAVE_ADD('CFG_NAME','LINK_NOTABLE');
      IBSAVE_ADD('CFG_VALUE',ansiuppercase(trim(NAME.text)));
      IBSAVE_ADD('CFG_BIG',memotostr(PRIM.lines));
      IBSAVE_ADD('CFG_SET1',0);

      ID:=IBSAVE_DOC('CFG',tag);
      if ID<0 then r:=sqrt(-1);
      Datamodule1.IBTransaction2.Commit;
      Tag:=ID;
      Datamodule1.IBTransaction2.Active:=False;
      close;
    except
       Datamodule1.IBTransaction2.Rollback;
    end;
    Datamodule1.IBTransaction2.Active:=False;
  end;
end;

end.
