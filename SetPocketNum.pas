unit SetPocketNum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  b_utils,b_dbutils,data1, IBCustomDataSet, IBQuery, IBDatabase, Db,
  RxMemDS, Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin
  ;

type
  TSET_POCKET_NUM = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    MemCfg: TRxMemoryData;
    MemCfgCFG_ID: TIntegerField;
    MemCfgSHOP_ID: TIntegerField;
    MemCfgSHOP_FULL: TStringField;
    MemCfgPOCKET_NUM: TIntegerField;
    DsCfg: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryWork2: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure DsCfgDataChange(Sender: TObject; Field: TField);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SET_POCKET_NUM: TSET_POCKET_NUM;
  CanInsert:boolean;

implementation

{$R *.DFM}

procedure TSET_POCKET_NUM.FormShow(Sender: TObject);
begin
   WorkTransaction.Active:=False;
   ADD_SQL(QueryWork,'select shop_id,shop.shop_name from shop where '+
   'not SHOP_ID=:SHOP_ID '+
   'order by shop_name');
   QueryWork.parambyname('SHOP_ID').asinteger:=SHOPID;
   QueryWork.Open;
   MemCfg.emptytable;
   while not QueryWork.eof do begin
     CANINSERT:=true;
     MemCfg.append;
     MemCfg.fieldbyname('SHOP_ID').asinteger:=
       QueryWork.fieldbyname('SHOP_ID').asinteger;
     MemCfg.fieldbyname('SHOP_FULL').asstring:=
       QueryWork.fieldbyname('SHOP_NAME').asstring;
     ADD_SQL(QueryWork2,'select cfg_id,cfg_value from cfg where cfg_name="$REPLICAT" '+
     'and CFG_SET1=:SHOP_ID and CFG_SET2=:SHOP_ID2 ');
     QueryWork2.parambyname('SHOP_ID').asinteger:=SHOPID;
     QueryWork2.parambyname('SHOP_ID2').asinteger:=
       QueryWork.fieldbyname('SHOP_ID').asinteger;
     QueryWork2.open;
     if QueryWork2.eof then begin
       MemCfg.fieldbyname('CFG_ID').asinteger:=-1;
       MemCfg.fieldbyname('POCKET_NUM').asinteger:=0;
     end else begin
       MemCfg.fieldbyname('CFG_ID').asinteger:=
         QueryWork2.fieldbyname('CFG_ID').asinteger;
       MemCfg.fieldbyname('POCKET_NUM').asinteger:=
         QueryWork2.fieldbyname('CFG_VALUE').asinteger;
     end;
     MemCfg.Post;
     CANINSERT:=False;;
     QueryWOrk.next;
   end;
   QueryWork.close;
   WorkTransaction.Active:=False;


end;

procedure TSET_POCKET_NUM.DsCfgDataChange(Sender: TObject; Field: TField);
begin
     if (MemCFG.State in [dsInsert]) and ( not CanInsert) then MemCFG.Cancel;
end;

procedure TSET_POCKET_NUM.ToolButton1Click(Sender: TObject);
var
   ERR:boolean;
   r:double;
begin
  MemCfg.First;
  ERR:=False;
  Datamodule1.IBTransaction2.Active:=False;
  Datamodule1.IBTransaction2.StartTransaction;
  try
  while not MemCfg.eof do begin
     if MemCFG.fieldbyname('CFG_ID').asinteger>0 then begin
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_VALUE',MemCFG.fieldbyname('POCKET_NUM').asinteger);
        if IBSAVE_DOC('CFG',MemCFG.fieldbyname('CFG_ID').asinteger)<0 then r:=sqrt(-1);
     end else begin
        IBSAVE_CLEAR;
        IBSAVE_ADD('CFG_NAME','$REPLICAT');
        IBSAVE_ADD('CFG_SET1',SHOPID);
        IBSAVE_ADD('CFG_SET2',MemCFG.fieldbyname('SHOP_ID').asinteger);
        IBSAVE_ADD('CFG_VALUE',MemCFG.fieldbyname('POCKET_NUM').asinteger);
        if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
     end;
     MemCfg.next;
  end;
  Datamodule1.IBTransaction2.Commit;
  except
     Datamodule1.IBTransaction2.Rollback;;
     ERR:=true;
  end;
  Datamodule1.IBTransaction2.Active:=False;
  if not ERR then close;
end;

end.
