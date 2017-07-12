{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbSectSR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, StdCtrls, ppComm, ppCache, ppDB, ppDBPipe, ppDBBDE, Db,
  ppCtrls, ppBands, ppReport, ppPrnabl, ppClass, ppStrtch, ppSubRpt, ppProd,
  ppVar, rbClass, ppRelatv;

type
  TfrmSectionSubreports = class(TrbReportForm)
    tblCustomer: TTable;
    dsCustomer: TDataSource;
    ppBDEPipeline1: TppBDEPipeline;
    Label1: TLabel;
    qryStock: TQuery;
    dsStock: TDataSource;
    plStock: TppBDEPipeline;
    Label2: TLabel;
    rbSectSub: TppReport;
    ppDetailBand2: TppDetailBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppCustomerListHeader: TppHeaderBand;
    ppCustomerListLabel1: TppLabel;
    ppCustomerListLabel2: TppLabel;
    ppCustomerListLabel3: TppLabel;
    ppCustomerListLabel4: TppLabel;
    ppCustomerListLabel6: TppLabel;
    ppCustomerListLabel7: TppLabel;
    ppCustomerListLabel8: TppLabel;
    ppCustomerListLabel9: TppLabel;
    ppCustomerListLine1: TppLine;
    ppCustomerListDetail: TppDetailBand;
    ppCustomerListDBText2: TppDBText;
    ppCustomerListDBText8: TppDBText;
    ppCustomerListDBText3: TppDBText;
    ppCustomerListDBText4: TppDBText;
    ppCustomerListDBText5: TppDBText;
    ppCustomerListDBText6: TppDBText;
    ppCustomerListFooter: TppFooterBand;
    srStock: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppReport1Label13: TppLabel;
    ppStockListLabel21: TppLabel;
    ppStockListLabel23: TppLabel;
    ppReport1Label14: TppLabel;
    ppReport1Label10: TppLabel;
    ppReport1Label11: TppLabel;
    ppReport1Label12: TppLabel;
    ppReport1Label9: TppLabel;
    btnPreview: TButton;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText6: TppDBText;
    ppLabel10: TppLabel;
    ppDBText7: TppDBText;
    ppLabel11: TppLabel;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLabel14: TppLabel;
    ppDBText10: TppDBText;
    ppLabel15: TppLabel;
    ppDBText11: TppDBText;
    ppLabel16: TppLabel;
    ppDBText12: TppDBText;
    ppLabel17: TppLabel;
    ppDBText13: TppDBText;
    ppLine4: TppLine;
    ppLabel13: TppLabel;
    ppLabel19: TppLabel;
    dbtRecommendation: TppDBText;
    ppLabel20: TppLabel;
    ppDBText15: TppDBText;
    ppLabel21: TppLabel;
    ppDBText16: TppDBText;
    ppLine5: TppLine;
    ppLabel18: TppLabel;
    dbtSymbol: TppDBText;
    dbtCompany: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppReport1SummaryBand1: TppSummaryBand;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    vrBuyTotal: TppVariable;
    vrHoldTotal: TppVariable;
    vrSellTotal: TppVariable;
    ppDBCalc2: TppDBCalc;
    ppLine7: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rlRecommendation: TppLabel;
    ppLine2: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppCustomerListCalc1: TppSystemVariable;
    ppCustomerListCalc3: TppSystemVariable;
    procedure btnPreviewClick(Sender: TObject);
    procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforeGenerate(Sender: TObject);
    procedure vrBuyTotalCalc(Sender: TObject;  var Value: Variant);
    procedure vrHoldTotalCalc(Sender: TObject;  var Value: Variant);
    procedure vrSellTotalCalc(Sender: TObject;  var Value: Variant);
  protected
    function GetReport: TppReport; override;
  private
    FRecommendationColor: TColor;
  public
    { Public declarations }
  end;

var
  frmSectionSubreports: TfrmSectionSubreports;

implementation

{$R *.DFM}


{------------------------------------------------------------------------------}
{ TfrmSectionSubreports.GetReport }

function TfrmSectionSubreports.GetReport: TppReport;
begin
  Result := rbSectSub;
end; {function, GetReport}

{------------------------------------------------------------------------------}
{ TfrmSectionSubreports.GetReport }

procedure TfrmSectionSubreports.btnPreviewClick(Sender: TObject);
begin
  rbSectSub.Print;

end; {procedure, btnPreviewClick}

{------------------------------------------------------------------------------}
{ TfrmSectionSubreports.ppGroupHeaderBand2BeforePrint }

procedure TfrmSectionSubreports.ppGroupHeaderBand2BeforePrint(Sender: TObject);
var
  lsRecommendation: String;
begin
  lsRecommendation := qryStock.FieldByName('Rcmndation').AsString;

  {determine the font color based on the value of Recommendation}
  if lsRecommendation = 'BUY' then
    FRecommendationColor := clRed

  else if lsRecommendation = 'HOLD' then
    FRecommendationColor := clGreen

  else {lsRecommendation = 'SELL'}
    FRecommendationColor := clBlue;

 rlRecommendation.Font.Color := FRecommendationColor;

  {check whether group first page of group or a continuation}
  if srStock.Report.Groups[0].FirstPage then
    rlRecommendation.Caption := 'Recommended ' + lsRecommendation + ' List'
  else
    rlRecommendation.Caption := 'Recommended ' + lsRecommendation + '''s continued...';

end; {procedure, ppGroupHeaderBand2BeforePrint}

{------------------------------------------------------------------------------}
{ TfrmSectionSubreports.ppDetailBand2BeforeGenerate }

procedure TfrmSectionSubreports.ppDetailBand2BeforeGenerate(Sender: TObject);
begin
  {set the font color of Symbol, Recommendation variables}
  dbtRecommendation.Font.Color := FRecommendationColor;
  dbtSymbol.Font.Color := FRecommendationColor;

end; {procedure, ppDetailBand2BeforeGenerate}

{------------------------------------------------------------------------------}
{ TfrmSectionSubreports.vrBuyTotalCalc }

procedure TfrmSectionSubreports.vrBuyTotalCalc(Sender: TObject;  var Value: Variant);
begin
  if (qryStock.FieldByName('Rcmndation').AsString = 'BUY') then
    Value := Value + 1;

end; {procedure, vrBuyTotalCalc}

{------------------------------------------------------------------------------}
{ TfrmSectionSubreports.vrHoldTotalCalc }

procedure TfrmSectionSubreports.vrHoldTotalCalc(Sender: TObject;  var Value: Variant);
begin
  if (qryStock.FieldByName('Rcmndation').AsString = 'HOLD') then
    Value := Value + 1;

end; {function, vrHoldTotalCalc}

{------------------------------------------------------------------------------}
{ TfrmSectionSubreports.vrSellTotalCalc }

procedure TfrmSectionSubreports.vrSellTotalCalc(Sender: TObject;  var Value: Variant);
begin
  if (qryStock.FieldByName('Rcmndation').AsString = 'SELL') then
    Value := Value + 1;

end; {function, vrSellTotalCalc}

end.
