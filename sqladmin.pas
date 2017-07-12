unit sqladmin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, SpeedBar, ComCtrls, data1, StdCtrls, RxRichEd, IBEvents,
  IBDatabase, Grids, DBGrids, RXDBCtrl, Db, IBCustomDataSet, IBQuery, IBSQL,
  IBScript, IBSQLMonitor;

type
  Tsql_admin = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    btnRunSQL: TSpeedItem;
    btnRunScript: TSpeedItem;
    btnCommit: TSpeedItem;
    btnRollback: TSpeedItem;
    btnPrepare: TSpeedItem;
    sql: TRxRichEdit;
    bntOpen: TSpeedItem;
    btnSave: TSpeedItem;
    od1: TOpenDialog;
    sd1: TSaveDialog;
    tr1: TIBTransaction;
    ds1: TDataSource;
    qry: TIBQuery;
    RxDBGrid1: TRxDBGrid;
    TabSheet3: TTabSheet;
    mess: TRxRichEdit;
    IBSQLMonitor1: TIBSQLMonitor;
    db1: TIBDatabase;
    scr: TIBScript;
    btnSetGens: TSpeedItem;
    procedure btnRunSQLClick(Sender: TObject);
    procedure bntOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnRollbackClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure Show_sost;
    procedure IBSQLMonitor1SQL(EventText: String; EventTime: TDateTime);
    procedure btnPrepareClick(Sender: TObject);
    procedure btnRunScriptClick(Sender: TObject);
    procedure scrExecuteError(Sender: TObject; Error, SQLText: String;
      LineIndex: Integer; var Ignore: Boolean);
    procedure scrParseError(Sender: TObject; Error, SQLText: String;
      LineIndex: Integer);
    procedure btnSetGensClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sql_admin: Tsql_admin;

implementation

{$R *.DFM}

procedure Tsql_admin.btnRunSQLClick(Sender: TObject);
begin
    mess.Clear;
    qry.SQL.Text := sql.Text;

       try
           qry.Open;
           pagecontrol1.ActivePageIndex:=1;
       except
       on e: Exception do
        begin
            mess.Lines.Add(datetimetostR(now)+': '+e.Message);
            tr1.Rollback;
            pagecontrol1.ActivePageIndex:=2;
        end;

       end;


    show_sost;



end;

procedure Tsql_admin.bntOpenClick(Sender: TObject);

begin
    if od1.Execute then
    begin
        sql.Lines.LoadFromFile(od1.FileName);
    end;

        show_sost;

end;

procedure Tsql_admin.btnSaveClick(Sender: TObject);
begin
if sd1.Execute then
    begin
        sql.Lines.SaveToFile(sd1.FileName);
    end;

        show_sost;
end;

procedure Tsql_admin.FormCreate(Sender: TObject);
begin
    db1.DatabaseName := DataModule1.IBDatabase1.DatabaseName;
    db1.Connected:=True;

    show_sost;
end;

procedure Tsql_admin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
db1.Connected:=false;
    show_sost;
end;

procedure Tsql_admin.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    show_sost;

    if tr1.InTransaction then
    begin
        Application.MessageBox('Транзакци активна. Ее надо или подтвердить или отменить', 'Предупреждение', 0);
        CanClose:=False;
    end
    else
    CanClose:=True;


end;

procedure Tsql_admin.btnRollbackClick(Sender: TObject);
begin
    if application.MessageBox('Rollback transaction', 'Вопрос', MB_YESNO) = IDYES then
        tr1.Rollback;
        show_sost;
end;

procedure Tsql_admin.btnCommitClick(Sender: TObject);
begin
    if application.MessageBox('Commit transaction', 'Вопрос', MB_YESNO) = IDYES then
        tr1.Commit;
    show_sost;
end;

procedure Tsql_admin.Show_sost;
begin
  btnCommit.Enabled := tr1.InTransaction;
  btnRollback.Enabled := tr1.InTransaction;
end;


procedure Tsql_admin.IBSQLMonitor1SQL(EventText: String;
  EventTime: TDateTime);
begin
    mess.Lines.Add(datetimetostR(eventtime)+': '+EventText);
end;

procedure Tsql_admin.btnPrepareClick(Sender: TObject);
begin
       mess.Clear;
       qry.SQL.Text := sql.Text;
       scr.Script.Text := sql.Text;
       try
        qry.Prepare;
       except
       on e: Exception do
          begin
            mess.Lines.Add(datetimetostR(now)+': '+e.Message);
            tr1.Rollback;
            pagecontrol1.ActivePageIndex:=2;
          end;
       end;

       show_sost;
end;

procedure Tsql_admin.btnRunScriptClick(Sender: TObject);
   var t1: TDateTime;
begin
    t1 := now;
    mess.Clear;
    scr.Terminator:='&';
    scr.Terminator:=';';


    scr.Script.Clear;
    scr.Script.Text := sql.Text;
    try
        scr.ValidateScript;
        scr.Terminator:='&';
        scr.Terminator:=';';
        scr.ExecuteScript;
        show_sost;
        Application.MessageBox(pchar('Скрипт выполнен успешно. Время выполнения '+ timetostr(now - t1)), 'Сообщение', MB_OK);
    except
       on e: Exception do
          begin
            Application.ProcessMessages;
            mess.Lines.Add(datetimetostR(now)+': '+e.Message);
            if tr1.InTransaction then
                tr1.Rollback;
            pagecontrol1.ActivePageIndex:=2;
            Application.MessageBox(pchar('произошла ошибка при выполнении скрипта'+e.message), pchar('Ошибка'), 0);

          end;
    end;
    show_sost;

end;

procedure Tsql_admin.scrExecuteError(Sender: TObject; Error,
  SQLText: String; LineIndex: Integer; var Ignore: Boolean);
begin
    raise exception.Create(datetimetostR(now)+': '+Error+' '+SqlText);
    Ignore := False;
end;

procedure Tsql_admin.scrParseError(Sender: TObject; Error, SQLText: String;
  LineIndex: Integer);
begin
   raise Exception.Create(datetimetostR(now)+': '+ Error + ' '+SqlText);

end;

procedure Tsql_admin.btnSetGensClick(Sender: TObject);
begin
    SQL.Text := 'select * from set_gens(код базы, увеличение)';
    pagecontrol1.ActivePageIndex:=0;
end;

procedure Tsql_admin.PageControl1Change(Sender: TObject);
begin
    if pagecontrol1.ActivePageIndex=0 then
        sql.SetFocus;
    if pagecontrol1.ActivePageIndex=1 then
        RxDBGrid1.SetFocus;
    if pagecontrol1.ActivePageIndex=2 then
        mess.SetFocus;

end;

end.
