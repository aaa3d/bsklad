unit CalcPnOst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, RxLookup, Db, IBCustomDataSet, IBQuery,
  IBDatabase, ComCtrls, StdCtrls, Mask, ToolEdit,VclUtils, ExtCtrls,
  RXClock;

type
  TCalc_PNOST = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    GroupBox1: TGroupBox;
    PN1: TRadioButton;
    PN2: TRadioButton;
    BtnStartStop: TButton;
    BtnClose: TButton;
    ProgressBar1: TProgressBar;
    StatusBar1: TStatusBar;
    WorkTransaction: TIBTransaction;
    PnTypTransaction: TIBTransaction;
    QrPNTYP: TIBQuery;
    QrPNTYPPNTYP_ID: TIntegerField;
    QrPNTYPPNTYP_SHORT: TIBStringField;
    QrPNTYPPNTYP_FULL: TIBStringField;
    QrPNTYPNUM_TYP: TSmallintField;
    QrPNTYPPNTYP_CALC: TIntegerField;
    QrPNTYPPNTYP_POST_CALC: TIBStringField;
    DsPNTYP: TDataSource;
    PNTYP: TRxDBLookupCombo;
    QueryWork: TIBQuery;
    Label3: TLabel;
    Label4: TLabel;
    RxClock1: TRxClock;
    Label_time: TLabel;
    Timer1: TTimer;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PN2Click(Sender: TObject);
    procedure BtnStartStopClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Calc_PNOST: TCalc_PNOST;

implementation

uses PrepareForm;

{$R *.DFM}

procedure TCalc_PNOST.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TCalc_PNOST.FormShow(Sender: TObject);
begin
     GET_DEFAULT;
     PnTypTransaction.Active:=False;
     QrPnTyp.close;
     QrPnTyp.open;
     PNTYP.value:=QrPnTyp.fieldByname('PNTYP_ID').asstring;
     DT2.date:=date();
     DT1.date:=date()-1;
     BtnStartStop.Tag:=1;
     if IsPnOst then begin // Автоматический режим
       DT1.date:=date()-36500;
       DT2.date:=date();
       Pn1.checked:=true;
       BtnStartStop.click;
       Timer1.Enabled:=true;
     end;
end;

procedure TCalc_PNOST.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QrPnTyp.close;
     PnTypTransaction.Active:=False;
     WorkTransaction.Active:=False;
end;

procedure TCalc_PNOST.PN2Click(Sender: TObject);
begin
     PNTYP.visible:=PN2.checked;
end;

procedure TCalc_PNOST.BtnStartStopClick(Sender: TObject);
var
   n,t,e:integer;
   n1,n2:integer;
begin
  if BtnStartStop.tag=2 then BtnStartStop.tag:=3;
  if BtnStartStop.tag=1 then begin
     label_Time.Caption:=timetostr(time());
     BtnStartStop.enabled:=False;
     BtnClose.enabled:=False;
     DT1.Enabled:=False;
     DT2.Enabled:=False;
     PN1.Enabled:=False;
     PN2.enabled:=False;
     PNTYP.enabled:=False;
     Statusbar1.panels[0].text:='Определяем количество приходных накладных...';
     try
        Prepare_form.caption:=Statusbar1.panels[0].text;
     except
     end;
     delay(1);
     WorkTransaction.Active:=False;
     if PN1.checked then ADD_SQL(QueryWork,'select count(*) as cc from pn$ where pn$_date between :DT1 and :DT2')
     else begin
          ADD_SQL(QueryWork,'select count(*) as cc from pn$ where pn$_date between :DT1 and :DT2 and PNTYP_ID=:PNTYP_ID');
          QueryWork.PAramByname('PNTYP_ID').asinteger:=strtoint(PNTYP.value);
     end;
     QueryWork.PAramByname('DT1').asdatetime:=DT1.date;
     QueryWork.PAramByname('DT2').asdatetime:=DT2.date+1-Sekond1;
     QueryWork.Open;
     if QueryWork.eof then n1:=0 else n1:=QueryWork.fieldByname('CC').asinteger;
     n:=n1;
     if n=0 then messbox('Список накладных пуст!',MessSystem,48) else begin
        begin
           BtnStartStop.enabled:=True;
           BtnStartStop.Caption:='Остановить';
           BtnStartStop.tag:=2;
           WorkTransaction.Active:=False;
           t:=0;
           e:=0;
           // Вторая часть
           if PN1.checked then ADD_SQL(QueryWork,'select PN$_ID from pn$ where pn$_date between :DT1 and :DT2 order by PN$_DATE')
           else begin
                ADD_SQL(QueryWork,'select PN$_ID from pn$ where pn$_date between :DT1 and :DT2 and PNTYP_ID=:PNTYP_ID order by PN$_DATE');
                QueryWork.PAramByname('PNTYP_ID').asinteger:=strtoint(PNTYP.value);
           end;
           QueryWork.PAramByname('DT1').asdatetime:=DT1.date;
           QueryWork.PAramByname('DT2').asdatetime:=DT2.date+1-Sekond1;
           QueryWork.Open;
           while not QueryWork.eof do begin
                 Datamodule1.IBTransaction2.Active:=False;
                 Datamodule1.IBTransaction2.StartTransaction;
                 inc(t);
                 Statusbar1.panels[0].text:='Идёт расчёт остатков накладной '+inttostr(t)+' из '+inttostr(n)+'. Ошибок: '+inttostr(e)+' ...';
                 try
                   Prepare_form.caption:=Statusbar1.panels[0].text;
                 except
                 end;
                 Progressbar1.Position:=trunc((t*100)/n);
                 delay(1);
                 Try
                    ADD_SQL(DataModule1.IbSaveSQL,'select * from check_torg_pn( :PN_ID)');
                    DataModule1.IbSaveSQL.ParamByname('PN_ID').asinteger:=QueryWork.FieldByname('PN$_ID').asinteger;
                    DataModule1.IbSaveSQL.Open;
                    Datamodule1.IBTransaction2.Commit;
                 Except
                    Datamodule1.IBTransaction2.RollBack;
                    inc(e);
                 End;
                 QueryWork.next;
                 if BtnStartStop.tag=3 then begin
                    Messbox('Расчёт остановлен пользователем!',MessSystem,48);
                    QueryWork.Last;
                    QueryWork.Next;
                 end;
           end;
        end;
     end;
     BtnStartStop.Caption:='Начать';
     BtnStartStop.tag:=1;
     BtnStartStop.enabled:=True;
     BtnClose.enabled:=True;
     DT1.Enabled:=True;
     DT2.Enabled:=True;
     PN1.Enabled:=True;
     PN2.enabled:=True;
     PNTYP.enabled:=True;
     Statusbar1.panels[0].text:='';
     Progressbar1.Position:=0;
     Label_Time.caption:='';
  end;
end;

procedure TCalc_PNOST.Timer1Timer(Sender: TObject);
begin
  timer1.enabled:=False;
  Close;
end;

end.
