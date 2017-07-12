unit ReportStat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  b_utils,b_Dbutils,Data1, TeEngine, Series, StdCtrls, ExtCtrls, TeeProcs,
  Chart, DBChart, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TREPORT_STAT = class(TForm)
    StatTransaction: TIBTransaction;
    QueryStat: TIBQuery;
    QueryStatSUMM: TFloatField;
    QueryStatTW_NSP: TFloatField;
    QueryStatTW_NDS: TFloatField;
    QueryStatSHOP_NAME: TIBStringField;
    DBChart1: TDBChart;
    ButtonStat1: TButton;
    Series1: TPieSeries;
    StatTransaction2: TIBTransaction;
    QueryStat2: TIBQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    IBStringField1: TIBStringField;
    DBChart2: TDBChart;
    ButtonStat2: TButton;
    PieSeries1: TPieSeries;
    DBChart4: TDBChart;
    ButtonStat4: TButton;
    PieSeries3: TPieSeries;
    StatTransaction4: TIBTransaction;
    QueryStat4: TIBQuery;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    IBStringField3: TIBStringField;
    StatTransaction3: TIBTransaction;
    QueryStat3: TIBQuery;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    IBStringField2: TIBStringField;
    DBChart3: TDBChart;
    ButtonStat3: TButton;
    PieSeries2: TPieSeries;
    procedure ButtonStat1Click(Sender: TObject);
    procedure ButtonStat2Click(Sender: TObject);
    procedure ButtonStat3Click(Sender: TObject);
    procedure ButtonStat4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  REPORT_STAT: TREPORT_STAT;

implementation

{$R *.DFM}

procedure TREPORT_STAT.ButtonStat1Click(Sender: TObject);
begin
    ButtonStat1.enabled:=False;
    QueryStat.close;
    StatTransaction.Active:=False;
    QueryStat.ParamByname('DT1').asdatetime:=date();
    QueryStat.ParamByname('DT2').asdatetime:=date()+1-sekond1;
    QueryStat.Open;
    ButtonStat1.enabled:=True;
end;

procedure TREPORT_STAT.ButtonStat2Click(Sender: TObject);
begin
    ButtonStat2.enabled:=False;
    QueryStat2.close;
    StatTransaction2.Active:=False;
    QueryStat2.ParamByname('DT1').asdatetime:=date();
    QueryStat2.ParamByname('DT2').asdatetime:=date()+1-sekond1;
    QueryStat2.Open;
    ButtonStat2.enabled:=True;
end;

procedure TREPORT_STAT.ButtonStat3Click(Sender: TObject);
var
  yy,mm,dd:word;
begin
    ButtonStat3.enabled:=False;
    QueryStat3.close;
    StatTransaction3.Active:=False;
    decodedate(date(),yy,mm,dd);
    QueryStat3.ParamByname('DT1').asdatetime:=encodedate(yy,mm,1);
    QueryStat3.ParamByname('DT2').asdatetime:=incmonth(encodedate(yy,mm,1),1)-sekond1;
    QueryStat3.Open;
    ButtonStat3.enabled:=True;
end;

procedure TREPORT_STAT.ButtonStat4Click(Sender: TObject);
var
  yy,mm,dd:word;
begin
    ButtonStat4.enabled:=False;
    QueryStat4.close;
    StatTransaction4.Active:=False;
    decodedate(date(),yy,mm,dd);
    QueryStat4.ParamByname('DT1').asdatetime:=incmonth(encodedate(yy,mm,1),-1);
    QueryStat4.ParamByname('DT2').asdatetime:=encodedate(yy,mm,1)-sekond1;
    QueryStat4.Open;
    ButtonStat4.enabled:=True;
end;

end.
