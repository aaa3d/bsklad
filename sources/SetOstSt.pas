unit SetOstSt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Grids, DBGrids, RXDBCtrl,Data1,b_utils,b_Dbutils,
  ActnList, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TSet_Ost_St = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    ActionList1: TActionList;
    ActNew: TAction;
    ActOpen: TAction;
    ActDel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ListTransaction: TIBTransaction;
    QueryList: TIBQuery;
    DsList: TDataSource;
    QueryListCFG_ID: TIntegerField;
    QueryListCFG_VALUE: TIBStringField;
    QueryListSKL_LIST: TIBStringField;
    procedure ActNewExecute(Sender: TObject);
    procedure ActOpenExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QueryListAfterOpen(DataSet: TDataSet);
    procedure QueryListAfterScroll(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Set_Ost_St: TSet_Ost_St;

implementation

uses EditSetOstSt;

{$R *.DFM}

procedure TSet_Ost_St.ActNewExecute(Sender: TObject);
begin
   // Новый набор
   Application.createForm(TEDIT_SET_OST_ST,EDIT_SET_OST_ST);
   EDIT_SET_OST_ST.tag:=-1;
   EDIT_SET_OST_ST.ShowModal;
   if EDIT_SET_OST_ST.tag>0 then begin
     ListTransaction.Active:=False;
     QueryList.close;
     QueryList.ParamByname('US_ID').asinteger:=USERID;
     QueryList.Open;
     QueryList.locate('cfg_id',EDIT_SET_OST_ST.tag,[]);
   end;
   EDIT_SET_OST_ST.destroy;
end;

procedure TSet_Ost_St.ActOpenExecute(Sender: TObject);
begin
   // Изменить
   Application.createForm(TEDIT_SET_OST_ST,EDIT_SET_OST_ST);
   EDIT_SET_OST_ST.tag:=QueryList.fieldByname('CFG_ID').asinteger;;
   EDIT_SET_OST_ST.ShowModal;
   if EDIT_SET_OST_ST.tag>0 then begin
     ListTransaction.Active:=False;
     QueryList.close;
     QueryList.ParamByname('US_ID').asinteger:=USERID;
     QueryList.Open;
     QueryList.locate('cfg_id',EDIT_SET_OST_ST.tag,[]);
   end;
   EDIT_SET_OST_ST.destroy;
end;

procedure TSet_Ost_St.ActDelExecute(Sender: TObject);
begin
   // Удалить
   if Messbox('Удалить набор "'+QueryList.FieldByname('CFG_value').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
        Datamodule1.IBTransaction2.Active:=False;
        Datamodule1.IBTransaction2.StartTransaction;
        IBDELETE_DOC('CFG',QueryList.FieldByname('CFG_ID').asinteger);
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        ListTransaction.Active:=False;
        QueryList.close;
        QueryList.ParamByname('US_ID').asinteger:=USERID;
        QueryList.Open;
   end;
end;

procedure TSet_Ost_St.FormShow(Sender: TObject);
begin
    ListTransaction.Active:=False;
    QueryList.close;
    QueryList.ParamByname('US_ID').asinteger:=USERID;
    QueryList.Open;

end;

procedure TSet_Ost_St.QueryListAfterOpen(DataSet: TDataSet);
var
  EN:boolean;
begin
    EN:=not QueryList.eof;
    if EN then begin
       ActOpen.enabled:=QueryList.fieldByname('cfg_id').asinteger<>-1;
       ActDel.enabled:=QueryList.fieldByname('cfg_id').asinteger<>-1;
    end else ActOpen.enabled:=EN;
end;

procedure TSet_Ost_St.QueryListAfterScroll(DataSet: TDataSet);
begin
    ActOpen.enabled:=QueryList.fieldByname('cfg_id').asinteger<>-1;
    ActDel.enabled:=QueryList.fieldByname('cfg_id').asinteger<>-1;
end;

procedure TSet_Ost_St.RxDBGrid1DblClick(Sender: TObject);
begin
    if ActOpen.enabled then ActOpen.Execute;
end;

procedure TSet_Ost_St.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#27 then begin
       key:=#0;
       close;
    end;
end;

end.
