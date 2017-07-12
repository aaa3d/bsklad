unit ClosePeriodDir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit,Data1,b_utils,b_DButils, Db, IBCustomDataSet,
  IBQuery, IBDatabase,VclUtils;

type
  TCLOSE_PERIOD_DIR = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DT: TDateEdit;
    Button1: TButton;
    Button2: TButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CLOSE_PERIOD_DIR: TCLOSE_PERIOD_DIR;
  dt1:tdatetime;
  id:integer;

implementation

{$R *.DFM}

procedure TCLOSE_PERIOD_DIR.FormShow(Sender: TObject);
begin
    WorkTransaction.Active:=False;
    OPEN_SQL(QueryWork,'select min(date_value) as date_value from cfg where cfg_name="$CONST_CLOSE_PERIOD_ADM" and cfg_set1=2');
    if QueryWork.eof then dt1:=encodedate(1990,1,1) else dt1:=QueryWork.fieldByname('date_value').asdatetime;
    Label2.caption:='Дату можно установить на значение не раньше чем '+date_short(dt1)+' !';
     OPEN_SQL(QueryWork,'select cfg_id,date_value as date_value from cfg where cfg_name="$CONST_CLOSE_PERIOD_DIR" and cfg_set1=2');
     if QueryWork.eof then begin
        dt.date:=encodedate(1990,1,1);
        id:=-1;
     end else begin
        dt.date:=QueryWork.fieldByname('date_value').asdatetime;
        id:=QueryWork.fieldByname('cfg_id').asinteger;
     end;
end;

procedure TCLOSE_PERIOD_DIR.Button2Click(Sender: TObject);
begin
   close;
end;

procedure TCLOSE_PERIOD_DIR.Button1Click(Sender: TObject);
var
  NEWID:integer;
  r:double;
begin
    if dt.date<dt1 then messbox('Вы не можете установить дату на значение раньше, чем '+date_short(dt1)+' !',MessSystem,48) else begin
       Datamodule1.IBTransaction2.Active:=False;
       Datamodule1.IBTransaction2.StartTransaction;
       Try
          IBSAVE_CLEAR;
          IBSAVE_ADD('CFG_NAME','$CONST_CLOSE_PERIOD_DIR');
          IBSAVE_ADD('CFG_SET1',2);

          IBSAVE_ADD('DATE_VALUE',strtodatetime(datetostr(dt.date)+' 23:59:59'));
          IBSAVE_ADD('CFG_BIG','Минимальная дата, на которую может открыть период бухгалтер');
          NEWID:=IBSAVE_DOC('CFG',ID);
          if NEWID<0 then r:=Sqrt(-1);
          OPEN_SQL(QueryWork,'select * from closed_period');
          while not QueryWork.eof do begin
              if QueryWork.fieldByname('PERIOD_CLOSE').asdatetime<dt.date then begin
                IBSAVE_CLEAR;
                IBSAVE_ADD('PERIOD_CLOSE',strtodatetime(datetostr(dt.date)+' 23:59:59'));
                IBSAVE_ADD('US_ID',USERID);
                IBSAVE_ADD('MESS','Закрыто директором!');
                IBSAVE_ADD('USGROUP_ID',QueryWork.fieldByname('USGROUP_ID').asinteger);
                NEWID:=IBSAVE_DOC('PERIOD',-1);
                if NEWID<0 then r:=Sqrt(-1);
              end;
              QueryWork.next;
          end;
          Datamodule1.IBTransaction2.Commit;
          Datamodule1.IBTransaction2.Active:=False;
          Worktransaction.Active:=False;
          close;
       Except
          Datamodule1.IBTransaction2.Rollback;
          Messbox('Ошибка при сохранении !',MessError,16);
       End;
       Datamodule1.IBTransaction2.Active:=False;
    end;
end;

end.
