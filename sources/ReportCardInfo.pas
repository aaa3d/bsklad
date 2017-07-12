unit ReportCardInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, IBDatabase, FR_Class, Db, IBCustomDataSet,
  IBQuery, RXCtrls, ExtCtrls;

type
  Treport_card_info = class(TForm)
    Label1: TLabel;
    DT1: TDateEdit;
    Label2: TLabel;
    DT2: TDateEdit;
    Button1: TButton;
    btnExcel: TButton;
    Button2: TButton;
    QueryReport: TIBQuery;
    QueryReportSHOP_ID: TIntegerField;
    QueryReportSHOP_NAME: TIBStringField;
    QueryReportRNTYP_ID: TIntegerField;
    QueryReportRNTYP_SHORT: TIBStringField;
    QueryReportDELTA1: TFloatField;
    QueryReportDELTA2: TFloatField;
    QueryReportDELTA3: TFloatField;
    QueryReportSEB_SUMM: TFloatField;
    QueryReportSPEC_SUMM: TFloatField;
    QueryReportREAL_SUMM: TFloatField;
    QueryReportNAC_SUMM: TFloatField;
    QueryReportSPEC_NDS_SUMM: TFloatField;
    QueryReportREAL_NDS_SUMM: TFloatField;
    QueryReportSPEC2_SUMM: TFloatField;
    QueryReportSPEC2_NDS_SUMM: TFloatField;
    DsReport: TDataSource;
    Rep: TfrReport;
    ReportTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    WorkTransaction: TIBTransaction;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RxCheckListBox1: TRxCheckListBox;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  report_card_info: Treport_card_info;

implementation

{$R *.DFM}

procedure Treport_card_info.Button1Click(Sender: TObject);
var fields: array[0..20] of string;
i: integer;

separator: string;

begin
fields[0]:='CARD_NUM';
fields[1]:='KLN_FIO';
fields[2]:='KLN_BIRTHDAY';
fields[3]:='100';
fields[4]:='case when KLN_SEX  = 1 then "М" when KLN_SEX=2 then "Ж" else "" end KLN_SEX';
fields[5]:='KLN_ADDRESS';
fields[6]:='KLN_PHONE';
fields[7]:='0000';
fields[8]:='0';
fields[9]:='0';
fields[10]:='0';
fields[11]:='CHECK_SMS';
fields[12]:='CHECK_PERS_DANN';
fields[13]:='case when KLN_REKLAMA_INFO like "1_________" then "Постоянный клиент " else "" end || '+
'case when KLN_REKLAMA_INFO like "_1________" then "Рекомендации "  else "" end ||'+
'case when KLN_REKLAMA_INFO like "__1_______" then "Сайт "  else "" end ||'+
'case when KLN_REKLAMA_INFO like "___1______" then "Телевидение "   else "" end ||'+
'case when KLN_REKLAMA_INFO like "____1_____" then "Наружные щиты "  else "" end ||'+
'case when KLN_REKLAMA_INFO like "_____1____" then "Радио "   else "" end ||'+
'case when KLN_REKLAMA_INFO like "______1___" then "Реклама на транспорте "   else "" end ||'+
'case when KLN_REKLAMA_INFO like "_______1__" then "Реклама в лифтах "   else "" end ||'+
'case when KLN_REKLAMA_INFO like "________1_" then "Листовки "   else "" end KLN_REKLAMA_INFO';


        memo1.Text:='';

        memo1.Text:=memo1.Text + 'SELECT ';
        separator := '';

        for i:=0 to RxCheckListBox1.items.Count-1  do
        begin
                if (RxCheckListBox1.Checked[i])then
                begin
                        memo1.Text:=Memo1.Text +char(13)+ separator + fields[i];
                        separator := ',';
                end
        end;

        memo1.Text:=memo1.text + char(13)+' FROM CARD ';

        memo1.Text:=memo1.text + char(13)+' WHERE card.reg_date between :dt1 and :dt2 ';

        separator := '';
        for i:=0 to RxCheckListBox1.items.Count-1  do
        begin
                if (RxCheckListBox1.Selected[i])then
                begin
                        if (separator='') then
                                memo1.Text:=memo1.text + char(13)+' ORDER BY ';

                        memo1.Text:=Memo1.Text +char(13)+ separator + inttostr(i+1);
                        separator := ',';
                end
        end;
        if (separator='') then
                memo1.Text:=memo1.text + char(13)+' ORDER BY 1';











end;

end.
