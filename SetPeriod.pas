unit SetPeriod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Data1,B_Utils,B_DButils, Db, IBCustomDataSet, IBQuery, IBDatabase,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, Menus;

type
  TSET_PERIOD = class(TForm)
    ToolBar1: TToolBar;
    BtnOpen: TToolButton;
    PeriodTransaction: TIBTransaction;
    QrPeriod: TIBQuery;
    DsPeriod: TDataSource;
    PopupMenu1: TPopupMenu;
    MnOpen: TMenuItem;
    RxDBGrid1: TRxDBGrid;
    QrPeriodPERIOD_CHANGE: TDateTimeField;
    QrPeriodUSGROUP_ID: TIntegerField;
    QrPeriodUSGROUP_NAME: TIBStringField;
    QrPeriodUSGROUP_PRIM: TIBStringField;
    QrPeriodPERIOD_CLOSE: TDateTimeField;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    QrPeriodTM: TDateTimeField;
    ToolButton3: TToolButton;
    QrPeriodWHI: TIBStringField;
    QrPeriodUSER_FIO: TIBStringField;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure QrPeriodAfterOpen(DataSet: TDataSet);
    procedure BtnOpenClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SET_PERIOD: TSET_PERIOD;

implementation

uses EditPeriod, HistoryPeriod;

{$R *.DFM}

procedure TSET_PERIOD.FormShow(Sender: TObject);
begin
     PeriodTransaction.Active:=False;
     QrPeriod.Close;
     QrPeriod.Open;
end;

procedure TSET_PERIOD.QrPeriodAfterOpen(DataSet: TDataSet);
begin
     BtnOpen.enabled:=Not QrPeriod.Eof;
     MnOpen.enabled:=Not QrPeriod.Eof;
end;

procedure TSET_PERIOD.BtnOpenClick(Sender: TObject);
var
   ID:integer;
begin
     ID:=QrPeriod.fieldByname('USGROUP_ID').asinteger;
     Application.createForm(TEdit_PERIOD,EDIT_PERIOD);
     EDIT_PERIOD.USGROUP_NAME.text:=QrPeriod.fieldByname('USGROUP_NAME').asstring;
     EDIT_PERIOD.OLD_DATE.date:=QrPeriod.fieldByname('PERIOD_CLOSE').asdatetime;
     QueryWork.ParamByName('ID').asinteger:=ID;
     QueryWork.Open;
     EDIT_PERIOD.NEW_DATE.date:=date()-QueryWork.fieldByname('close_per').asinteger;
     EDIT_PERIOD.tag:=Id;
     EDIT_PERIOD.ShowModal;
     if EDIT_PERIOD.tag<0 then begin
        PeriodTransaction.Active:=False;
        QrPeriod.Close;
        QrPeriod.Open;
        QrPeriod.Locate('USGROUP_ID',ID,[]);
     end;
     EDIT_PERIOD.Destroy;
     RxDbgrid1.setfocus;
end;

procedure TSET_PERIOD.RxDBGrid1DblClick(Sender: TObject);
begin
     if BtnOpen.enabled then BtnOpen.click;
end;

procedure TSET_PERIOD.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

procedure TSET_PERIOD.ToolButton3Click(Sender: TObject);
begin
  Application.createForm(THISTORY_PERIOD,HISTORY_PERIOD);
  HISTORY_PERIOD.Edit1.text:=QrPeriod.fieldbyname('USGROUP_NAME').asstring;
  HISTORY_PERIOD.tag:=QrPeriod.fieldbyname('USGROUP_ID').asinteger;
  HISTORY_PERIOD.ShowModal;
  HISTORY_PERIOD.Destroy;
end;

end.
