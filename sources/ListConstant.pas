unit ListConstant;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  b_utils,b_DButils,Data1, Db, IBCustomDataSet, IBQuery, IBDatabase,
  ToolWin, ComCtrls, Grids, DBGrids, RXDBCtrl, ActnList;

type
  TLIST_CONSTANT = class(TForm)
    ListTransaction: TIBTransaction;
    QueryList: TIBQuery;
    QueryListCFG_ID: TIntegerField;
    QueryListCFG_NAME: TIBStringField;
    QueryListCFG_SET1: TIntegerField;
    QueryListCFG_SET2: TIntegerField;
    QueryListCFG_SET3: TIntegerField;
    QueryListCFG_VALUE: TIBStringField;
    QueryListCFG_BIG: TIBStringField;
    QueryListDATE_VALUE: TDateTimeField;
    QueryListTM: TDateTimeField;
    QueryListDISPLAY_VALUE: TStringField;
    ToolBar1: TToolBar;
    RxDBGrid1: TRxDBGrid;
    DsList: TDataSource;
    ActionList1: TActionList;
    ActOpen: TAction;
    ToolButton1: TToolButton;
    procedure QueryListCalcFields(DataSet: TDataSet);
    procedure ActOpenExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RefreshList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LIST_CONSTANT: TLIST_CONSTANT;

implementation

{$R *.DFM}

procedure TLIST_CONSTANT.QueryListCalcFields(DataSet: TDataSet);
begin
   case QueryList.fieldByname('CFG_SET1').asinteger of
     1,3: QueryList.fieldByname('DISPLAY_VALUE').asstring:=QueryList.fieldByname('CFG_value').asstring;
     2: QueryList.fieldByname('DISPLAY_VALUE').asstring:=date_short(QueryList.fieldByname('DATE_value').asdatetime);
   end;
end;

procedure TLIST_CONSTANT.ActOpenExecute(Sender: TObject);
begin
  // Изменяем значение
end;

procedure TLIST_CONSTANT.FormShow(Sender: TObject);
begin
  RefreshList;
end;

procedure TLIST_CONSTANT.RefreshList;
begin
  ListTransaction.Active:=False;
  QueryList.close;
  QueryList.open;
end;

end.
