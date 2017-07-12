{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppCache, ppDB, ppDBPipe, ppDBBDE, ppComm, ppProd, ppClass, ppReport, Db,
  DBTables, ppBands, ppPrnabl, ppCtrls, StdCtrls, ppVar,
  rbClass, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }



  TfrmStockSummary = class(TrbReportForm)
    qryStock: TQuery;
    dsStock: TDataSource;
    rbStock: TppReport;
    plStock: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    ppLabel1: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    rlRecommendation: TppLabel;
    ppLine2: TppLine;
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
    btnPreview: TButton;
    ppLabel22: TppLabel;
    ppDBText1: TppDBText;
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure ppDetailBand1BeforeGenerate(Sender: TObject);
    procedure vrBuyTotalCalc(Sender: TObject; var Value: Variant);
    procedure vrHoldTotalCalc(Sender: TObject; var Value: Variant);
    procedure vrSellTotalCalc(Sender: TObject; var Value: Variant);

  protected
    function GetReport: TppReport; override;

  private
    FRecommendationColor: TColor;
  public
    { Public declarations }
  end;

var
  frmStockSummary: TfrmStockSummary;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmStockSummary.GetReport }

function TfrmStockSummary.GetReport: TppReport;
begin
  Result := rbStock;

end; {function, GetReport}


{------------------------------------------------------------------------------}
{ TfrmStockSummary.ppGroupHeaderBand1BeforePrint }

procedure TfrmStockSummary.ppGroupHeaderBand1BeforePrint(Sender: TObject);
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
  if rbStock.Groups[0].FirstPage then

    rlRecommendation.Caption := 'Recommended ' + lsRecommendation + ' List'
  else
    rlRecommendation.Caption := 'Recommended ' + lsRecommendation + '''s continued...';

end; {procedure, ppGroupHeaderBand2BeforePrint}


{------------------------------------------------------------------------------}
{ TfrmStockSummary.btnPreviewClick }

procedure TfrmStockSummary.btnPreviewClick(Sender: TObject);
begin
  rbStock.Print;

end; {procedure, btnPreviewClick}

{------------------------------------------------------------------------------}
{ TfrmStockSummary.ppDetailBand2BeforeGenerate }

procedure TfrmStockSummary.ppDetailBand1BeforeGenerate(Sender: TObject);
begin
  {set the font color of Symbol, Recommendation variables}
  dbtRecommendation.Font.Color := FRecommendationColor;
  dbtSymbol.Font.Color     := FRecommendationColor;

end; {procedure, ppDetailBand2BeforeGenerate}


{------------------------------------------------------------------------------}
{ TfrmStockSummary.vrBuyTotalCalc }

procedure TfrmStockSummary.vrBuyTotalCalc(Sender: TObject; var Value: Variant);
begin
  if (qryStock.FieldByName('Rcmndation').AsString = 'BUY') then
    Value := Value + 1;

end; {procedure, vrBuyTotalCalc}

{------------------------------------------------------------------------------}
{ TfrmStockSummary.vrHoldTotalCalc }

procedure TfrmStockSummary.vrHoldTotalCalc(Sender: TObject; var Value: Variant);
begin
  if (qryStock.FieldByName('Rcmndation').AsString = 'HOLD') then
    Value := Value + 1;

end; {procedure, vrHoldTotalCalc}

{------------------------------------------------------------------------------}
{ TfrmStockSummary.vrSellTotalCalc }

procedure TfrmStockSummary.vrSellTotalCalc(Sender: TObject; var Value: Variant);
begin
  if (qryStock.FieldByName('Rcmndation').AsString = 'SELL') then
    Value := Value + 1;

end; {procedure, vrSellTotalCalc}

end.
