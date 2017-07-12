unit ZpTabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, Db, RxMemDS,Data1,b_utils,b_dbutils,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TZp_Tabel = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    MemTabel: TRxMemoryData;
    MemTabelus_id: TIntegerField;
    MemTabelus_full: TStringField;
    MemTabelotdel_id: TIntegerField;
    MemTabelotdel_name: TStringField;
    MemTabelField1: TStringField;
    MemTabelField2: TStringField;
    MemTabelStringField3: TStringField;
    MemTabelField4: TStringField;
    MemTabelField5: TStringField;
    MemTabelField6: TStringField;
    MemTabelField7: TStringField;
    MemTabelField8: TStringField;
    MemTabelField9: TStringField;
    MemTabelField10: TStringField;
    MemTabelField11: TStringField;
    MemTabelField12: TStringField;
    MemTabelField13: TStringField;
    MemTabelField14: TStringField;
    MemTabelField15: TStringField;
    MemTabelField16: TStringField;
    MemTabelField17: TStringField;
    MemTabelField18: TStringField;
    MemTabelField19: TStringField;
    MemTabelField20: TStringField;
    MemTabelField21: TStringField;
    MemTabelField22: TStringField;
    MemTabelField23: TStringField;
    MemTabelField24: TStringField;
    MemTabelField25: TStringField;
    MemTabelField26: TStringField;
    MemTabelField27: TStringField;
    MemTabelField28: TStringField;
    MemTabelField29: TStringField;
    MemTabelField30: TStringField;
    MemTabelField31: TStringField;
    DsTabel: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Zp_Tabel: TZp_Tabel;

implementation

uses Mainform;

{$R *.DFM}

procedure TZp_Tabel.ToolButton1Click(Sender: TObject);
begin
   close;
end;

procedure TZp_Tabel.FormShow(Sender: TObject);
var
  dt:tdatetime;
  d,m,y:word;
begin
    Top:=Main_Form.Top+22;
    Left:=Screen.DesktopLeft;
    Width:=Screen.Width;
    Height:=Screen.Height-Main_Form.Top-22-28;
   // Процедура обновляет информацию по расчетному месяцу
//   if CanRefresh then begin
     decodedate(date(),y,m,d);
     MemTabel.EmptyTable;
     WorkTransaction.Active:=False;
     ADD_SQL(QueryWork,'select * from users_in_dt(:dt) order by us_full');
     dt:=encodedate(y,m,1)-sekond1;
     QueryWork.paramByname('dt').asdatetime:=dt;
     QueryWork.open;
     while not QueryWork.eof do begin
       MemTabel.append;
       MemTabel.fieldByname('us_id').asinteger:=QueryWork.fieldByname('us_id').asinteger;
       MemTabel.fieldByname('us_full').asstring:=QueryWork.fieldByname('us_full').asstring;
       MemTabel.fieldByname('otdel_id').asinteger:=QueryWork.fieldByname('otdel_id').asinteger;
       MemTabel.fieldByname('otdel_name').asstring:=QueryWork.fieldByname('otdel_name').asstring;
       MemTabel.post;;
       QueryWork.next;
     end;
     MemTabel.first;
//   end;
end;

procedure TZp_Tabel.FormKeyPress(Sender: TObject; var Key: Char);
var
  s:string;
begin
   if key in ['1','2','3','4','5','6','7','8','в','В','О','о','п','П'] then begin
      s:=ansiuppercase(key);
      key:=s[1];
   end else begin
      key:=#0;
      beep;
   end
end;

end.
