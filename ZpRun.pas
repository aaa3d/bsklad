unit ZpRun;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_dbutils, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl,
  ExtCtrls, StdCtrls, Db, RxMemDS, IBDatabase, IBCustomDataSet, IBQuery;

type
  TZP_RUN = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    RxDBGrid2: TRxDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    MemMes: TRxMemoryData;
    MemMestxt: TStringField;
    MemMesmes: TIntegerField;
    MemMesyear: TIntegerField;
    DsMes: TDataSource;
    MemMesabs: TIntegerField;
    MemCalc: TRxMemoryData;
    MemCalcus_id: TIntegerField;
    MemCalcus_full: TStringField;
    MemCalcotdel_id: TIntegerField;
    MemCalcotdel_name: TStringField;
    MemCalcsost_id: TIntegerField;
    MemCalcsost_full: TStringField;
    MemCalcmail_date: TStringField;
    MemCalcsumm: TFloatField;
    DsCalc: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure FormShow(Sender: TObject);
    Procedure MyRefresh;
    procedure MemMesAfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZP_RUN: TZP_RUN;
  CanRefresh:boolean;

implementation

uses ZpRunProgress;

{$R *.DFM}

procedure TZP_RUN.FormShow(Sender: TObject);
var
  y,m,d:word;
  curr:integer;
begin
   CanRefresh:=False;
   MemMes.DisableControls;
   MemMes.EmptyTable;
   for y:=2002 to 2100 do begin
     for m:=1 to 12 do begin
        MemMes.append;
        MemMes.fieldByname('mes').asinteger:=m;
        MemMes.fieldByname('year').asinteger:=y;
        MemMes.fieldByname('txt').asstring:=messokr2[m]+' '+inttostr(y);
        MemMes.fieldByname('abs').asinteger:=strtoint(inttostr(y)+b_utils.right('00'+inttostr(m),2));
        MemMes.post;
     end;
   end;
   // определяем текущий месяц;
   decodedate(date(),y,m,d);
   curr:=strtoint(inttostr(y)+b_utils.right('00'+inttostr(m),2));
   MemMes.locate('abs',curr,[]);
   MemMes.EnableControls;
   CanRefresh:=True;
   myrefresh;
end;

procedure TZP_RUN.Myrefresh;
var
  dt:tdatetime;
begin
   // Процедура обновляет информацию по расчетному месяцу
   if CanRefresh then begin
     MemCalc.EmptyTable;
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select * from users_in_dt(:dt) order by us_full');
     dt:=encodedate(MemMes.fieldByname('year').asinteger,MemMes.fieldByname('mes').asinteger,1)-sekond1;
     QueryWork.paramByname('dt').asdatetime:=dt;
     QueryWork.open;
     while not QueryWork.eof do begin
       MemCalc.append;
       MemCalc.fieldByname('us_id').asinteger:=QueryWork.fieldByname('us_id').asinteger;
       MemCalc.fieldByname('us_full').asstring:=QueryWork.fieldByname('us_full').asstring;
       MemCalc.fieldByname('otdel_id').asinteger:=QueryWork.fieldByname('otdel_id').asinteger;
       MemCalc.fieldByname('otdel_name').asstring:=QueryWork.fieldByname('otdel_name').asstring;
       MemCalc.fieldByname('sost_id').asinteger:=0;
       MemCalc.fieldByname('sost_full').asstring:='не рассчитана';
       MemCalc.fieldByname('summ').asfloat:=0;
       MemCalc.post;;
       QueryWork.next;
     end;
     MemCalc.first;
   end;
end;

procedure TZP_RUN.MemMesAfterScroll(DataSet: TDataSet);
begin
   Myrefresh;
end;

procedure TZP_RUN.Button1Click(Sender: TObject);
begin
  if messbox('Начать расчет зарплаты за '+MemMes.fieldByname('txt').asstring+' ?',messSubmit,4+48+256)=6 then begin
      application.createform(TZP_RUN_PROGRESS,ZP_RUN_PROGRESS);
      ZP_RUN_PROGRESS.showModal;
      ZP_RUN_PROGRESS.Destroy;
  end;
end;

end.
