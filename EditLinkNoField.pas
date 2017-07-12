unit EditLinkNoField;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, ComCtrls, ToolWin, IBDatabase, Db,
  IBCustomDataSet, IBQuery;

type
  TEDIT_LINKNOFIELD = class(TForm)
    ToolBar1: TToolBar;
    BtnSave: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TABLE_NAME: TEdit;
    TABLE_FIELD: TEdit;
    PRIM: TMemo;
    QueryWork: TIBQuery;
    WorkTransaction: TIBTransaction;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_LINKNOFIELD: TEDIT_LINKNOFIELD;

implementation

{$R *.DFM}

procedure TEDIT_LINKNOFIELD.FormShow(Sender: TObject);
begin
    if tag<0 then begin
       caption:=caption+'. Новая';
    end else begin
       TABLE_NAME.enabled:=False;
       TABLE_FIELD.enabled:=False;
       WorkTransaction.Active:=False;
       ADD_SQL(QueryWork,'select cfg_value,cfg_big,cfg_set1 from cfg where cfg_id=:cfg_id');
       QueryWork.ParamByname('CFG_ID').asinteger:=TAG;
       QueryWork.Open;
       TABLE_NAME.text:=argc(QueryWork.fieldByname('cfg_value').asstring,1);
       TABLE_FIELD.text:=argc(QueryWork.fieldByname('cfg_value').asstring,2);
       PRIM.text:=QueryWork.fieldByname('cfg_big').asstring;
       caption:=caption+'. Изменение "'+TABLE_NAME.text+'-'+TABLE_FIELD.text+'"';
       PRIM.setfocus;
    end;
end;

procedure TEDIT_LINKNOFIELD.BtnSaveClick(Sender: TObject);
var
 ID:integer;
 r:double;
begin
  if (trim(TABLE_NAME.text)='') or (trim(TABLE_FIELD.text)='') then
  Messbox('Имя таблицы и имя поле не могут быть пустыми!',MessSystem,48) else begin
    Datamodule1.IBTransaction2.Active:=False;
    Datamodule1.IBTransaction2.StartTransaction;
    try
      IBSAVE_CLEAR;
      IBSAVE_ADD('CFG_NAME','LINK_NOFIELD');
      IBSAVE_ADD('CFG_VALUE',ansiuppercase(trim(TABLE_NAME.text))+' '+ansiuppercase(trim(TABLE_FIELD.text)));
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
