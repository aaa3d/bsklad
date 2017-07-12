unit AddReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, IBDatabase, StdCtrls, Mask, ToolEdit, Db,
  IBCustomDataSet, IBQuery, FR_Class, FR_DSet, FR_DBSet;

type
  TADD_REPORT = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DT1: TDateEdit;
    DT2: TDateEdit;
    BtnOK: TButton;
    Memo1: TMemo;
    WorkTransaction: TIBTransaction;
    ReportPost: TIBQuery;
    ReportPostPNTYP_ID: TIntegerField;
    ReportPostPNTYP_SHORT: TIBStringField;
    ReportPostSEB: TFloatField;
    ReportPostSEBNEW: TFloatField;
    ReportPostNDS: TFloatField;
    ReportPostSEB2: TFloatField;
    ReportPostNDS2: TFloatField;
    FrPost: TfrDBDataSet;
    POSt: TfrReport;
    ReportPostAV_SEB: TFloatField;
    ReportPostAV_NDS: TFloatField;
    ReportPostAV_SEB_WHITE: TFloatField;
    ReportPostAV_NDS_WHITE: TFloatField;
    ReportPostSF_SEB: TFloatField;
    ReportPostSF_NDS: TFloatField;
    ReportPostSF_SEB_WHITE: TFloatField;
    ReportPostSF_NDS_WHITE: TFloatField;
    Button1: TButton;
    ReportRN: TIBQuery;
    FrRN: TfrDBDataSet;
    RN: TfrReport;
    ReportRNRNTYP_ID: TIntegerField;
    ReportRNRNTYP_SHORT: TIBStringField;
    ReportRNOBOROT: TFloatField;
    ReportRNOB_NDS: TFloatField;
    ReportRNOB_NSP: TFloatField;
    ReportRNSEB: TFloatField;
    ReportRNNDS: TFloatField;
    ReportRNKORR: TFloatField;
    ReportRNKOL1: TFloatField;
    ReportRNKOL2: TFloatField;
    ReportRNSEBNDS: TFloatField;
    procedure BtnOKClick(Sender: TObject);
    procedure POStGetValue(const ParName: String; var ParValue: Variant);
    procedure RNGetValue(const ParName: String; var ParValue: Variant);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ADD_REPORT: TADD_REPORT;

implementation

{$R *.DFM}

procedure TADD_REPORT.BtnOKClick(Sender: TObject);
begin
    WorkTransaction.Active:=False;
    ReportPost.close;
    ReportPost.paramByname('dt1').asdatetime:=dt1.date;
    ReportPost.paramByname('dt2').asdatetime:=dt2.date+1-sekond1;
    ReportPost.Open;
    POST.showReport;
end;

procedure TADD_REPORT.POStGetValue(const ParName: String;
  var ParValue: Variant);
begin
    if ParName='REPTITLE' then
    ParValue:='Отчет по поставкам за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);

end;

procedure TADD_REPORT.RNGetValue(const ParName: String;
  var ParValue: Variant);
begin
    if ParName='REPTITLE' then
    ParValue:='Отчет по реализации за период с '+date_sokr(dt1.date)+' по '+date_sokr(dt2.date);
end;

procedure TADD_REPORT.Button1Click(Sender: TObject);
begin
//Сторожев Игорь 28.04.2004 Изменена для получения отчета кореркции НДС
    WorkTransaction.Active:=False;
    ReportRN.close;
    ReportRN.SQL.Clear;
    ReportRN.SQL.Add('select * from check_rn(:dt1,:dt2)');
    ReportRN.paramByname('dt1').asdatetime:=dt1.date;
    ReportRN.paramByname('dt2').asdatetime:=dt2.date+1-sekond1;
    ReportRN.Open;
    RN.showReport;
end;

end.
