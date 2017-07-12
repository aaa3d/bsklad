unit ReportOstNul;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit,Data1,b_utils,b_dbutils, Db, IBCustomDataSet,
  IBQuery, IBDatabase, FR_Class, FR_DSet, FR_DBSet,VclUtils;

type
  TREPORT_OST_NUL = class(TForm)
    Label1: TLabel;
    DT: TDateEdit;
    BtnRun: TButton;
    BtnClose: TButton;
    ReportTransaction: TIBTransaction;
    QueryReport: TIBQuery;
    QueryReportTW_ID: TIntegerField;
    QueryReportTW_ART: TIntegerField;
    QueryReportTW_NAM: TIBStringField;
    QueryReportED_SHORT: TIBStringField;
    QueryReportTW_MROZ: TFloatField;
    QueryReportOST: TFloatField;
    QueryReportTW_SUMM: TFloatField;
    DsReport: TDataSource;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnRunClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_OST_NUL: TREPORT_OST_NUL;

implementation

uses WaitForm;

{$R *.DFM}

procedure TREPORT_OST_NUL.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#0 then begin
       key:=#0;
       close;
    end;
end;

procedure TREPORT_OST_NUL.FormShow(Sender: TObject);
begin
   DT.date:=DATE();
end;

procedure TREPORT_OST_NUL.BtnRunClick(Sender: TObject);
begin
    Wait_Form.StatusBar1.panels[0].text:='Запрос данных...';
    Wait_Form.Gauge1.Progress:=10;
    Wait_Form.Show;
    delay(1);
    BtnRun.enabled:=False;
    BtnClose.enabled:=False;
    DT.enabled:=False;
    ReportTransaction.Active:=False;
    QueryReport.close;
    QueryReport.ParamByname('DT').asdatetime:=dt.date;
    Wait_Form.Gauge1.Progress:=20;
    delay(1);
    QueryReport.Open;
    if QueryReport.eof then begin
        Wait_Form.Gauge1.Progress:=100;
        delay(100);
        Wait_Form.Hide;
        messbox('Отчет Пуст!',MessSystem,48)
    end else begin
      Wait_Form.Gauge1.Progress:=100;
      delay(100);
      Wait_Form.Hide;
      FrReport1.ShowReport;
    end;
    QueryReport.close;
    ReportTransaction.Active:=False;
    BtnRun.enabled:=True;
    BtnClose.enabled:=True;
    DT.enabled:=True;
end;

procedure TREPORT_OST_NUL.BtnCloseClick(Sender: TObject);
begin
     close;
end;

procedure TREPORT_OST_NUL.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='REPORT_TITLE' then
    ParValue:= 'по состоянию на '+date_sokr(DT.date);
  if ParName='Пользователь' then
    ParValue:='Отчет составил: '+USERFIO;
end;

end.
