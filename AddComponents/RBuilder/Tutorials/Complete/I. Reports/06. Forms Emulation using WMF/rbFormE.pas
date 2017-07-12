{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbFormE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppBands, ppProd, ppReport,
  ppComm, ppCache, ppDB, ppDBPipe, ppDBBDE, Db, DBTables,
  rbClass, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }

  TfrmFormsEmulation = class(TrbReportForm)
    tblCustomer: TTable;
    tblCustomerCustNo: TFloatField;
    tblCustomerCompany: TStringField;
    tblCustomerAddr1: TStringField;
    tblCustomerAddr2: TStringField;
    tblCustomerCity: TStringField;
    tblCustomerState: TStringField;
    tblCustomerZip: TStringField;
    tblCustomerCountry: TStringField;
    tblCustomerPhone: TStringField;
    tblCustomerFAX: TStringField;
    tblCustomerTaxRate: TFloatField;
    tblCustomerContact: TStringField;
    tblCustomerLastInvoiceDate: TDateTimeField;
    tblCustomerWages: TCurrencyField;
    tblCustomerSSWages: TCurrencyField;
    tblCustomerMedicareWages: TCurrencyField;
    tblCustomerFederalTaxWithheld: TCurrencyField;
    tblCustomerSSTaxWithheld: TCurrencyField;
    tblCustomerMedicareTaxWithheld: TCurrencyField;
    dsCustomer: TDataSource;
    plCustomer: TppBDEPipeline;
    rbFormEmul: TppReport;
    ppDetailBand2: TppDetailBand;
    ppImage2: TppImage;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel2: TppLabel;
    ppMemo2: TppMemo;
    mmEmployeeAddress1: TppMemo;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    ppMemo1: TppMemo;
    ppDBText13: TppDBText;
    ppDBText16: TppDBText;
    mmEmployeeAddress2: TppMemo;
    ppLabel4: TppLabel;
    btnPreview: TButton;
    procedure btnPreviewClick(Sender: TObject);
    procedure tblCustomerCalcFields(DataSet: TDataSet);
    procedure ppDetailBand2BeforeGenerate(Sender: TObject);
  protected
    function GetReport: TppReport; override;
  private
    procedure BuildEmployeeAddress(aStrings: TStrings);
  public
    { Public declarations }
  end;

var
  frmFormsEmulation: TfrmFormsEmulation;

implementation

{$R *.DFM}

function TfrmFormsEmulation.GetReport: TppReport;
begin
  Result := rbFormEmul;
end;

procedure TfrmFormsEmulation.btnPreviewClick(Sender: TObject);
begin
  rbFormEmul.Print;
end;

procedure TfrmFormsEmulation.tblCustomerCalcFields(DataSet: TDataSet);
begin
  tblCustomerWages.AsCurrency := 40000;
  tblCustomerSSWages.AsCurrency := tblCustomerWages.AsCurrency;
  tblCustomerMedicareWages.AsCurrency := tblCustomerWages.AsCurrency;

  tblCustomerFederalTaxWithheld.AsCurrency := tblCustomerWages.AsCurrency  * 0.2;
  tblCustomerSSTaxWithheld.AsCurrency := tblCustomerWages.AsCurrency  * 0.05;
  tblCustomerMedicareTaxWithheld.AsCurrency := tblCustomerWages.AsCurrency  * 0.01;
end;

procedure TfrmFormsEmulation.ppDetailBand2BeforeGenerate(Sender: TObject);
begin
  BuildEmployeeAddress(mmEmployeeAddress1.Lines);
  BuildEmployeeAddress(mmEmployeeAddress2.Lines);
end;

procedure TfrmFormsEmulation.BuildEmployeeAddress(aStrings: TStrings);
var
  lsLine: String;
  lsState: String;
  lsZIP: String;

begin

   {clear memo}
   aStrings.Clear;

   {add contact}
   lsLine := tblCustomer.FieldByName('Contact').AsString;
   aStrings.Add(lsLine);

   {add address line1}
   lsLine := tblCustomer.FieldByName('Addr1').AsString;
   if lsLine <> '' then
    aStrings.Add(lsLine);

   {add address line2}
   lsLine := tblCustomer.FieldByName('Addr2').AsString;
   if lsLine <> '' then
    aStrings.Add(lsLine);

   {add city, state zip}
   lsLine := tblCustomer.FieldByName('City').AsString;

   lsState := tblCustomer.FieldByName('State').AsString;

   if lsState <> '' then
     lsLine := lsLine + ', ' + lsState;

   lsZIP := tblCustomer.FieldByName('ZIP').AsString;

    if lsZIP <> '' then
     lsLine := lsLine + ' ' + lsZIP;

   aStrings.Add(lsLine);

end;

end.
