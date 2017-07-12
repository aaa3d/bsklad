unit dm0063;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ppClass, dmUtil, ppBands, ppCache, ppCtrls, ppComm, ppReport,
  ppPrnabl, ppDB, ppDBBDE, Db, DBTables, ppStrtch, ppMemo, ppTypes,
  ppRegion, ppProd, ppDBPipe, ppVar, ppRelatv;

type
  Tfrm0063 = class(TdmCustomForm)
    dsStock: TDataSource;
    plStock: TppBDEPipeline;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ppStockList: TppReport;
    ppStockListHeader: TppHeaderBand;
    ppStockListDetail: TppDetailBand;
    ppStockListDBText2: TppDBText;
    ppStockListDBText3: TppDBText;
    ppStockListDBText4: TppDBText;
    ppStockListFooter: TppFooterBand;
    ppStockListLabel2: TppLabel;
    ppStockListLabel4: TppLabel;
    ppStockListDBText1: TppDBText;
    ppStockListLabel5: TppLabel;
    ppStockListDBText5: TppDBText;
    ppStockListLabel6: TppLabel;
    ppStockListDBText6: TppDBText;
    ppStockListDBText7: TppDBText;
    ppStockListLabel7: TppLabel;
    ppStockListLabel8: TppLabel;
    ppStockListDBText8: TppDBText;
    ppStockListLabel9: TppLabel;
    ppStockListLabel10: TppLabel;
    ppStockListDBText9: TppDBText;
    ppStockListDBText10: TppDBText;
    ppStockListLabel11: TppLabel;
    ppStockListDBText11: TppDBText;
    ppStockListLabel12: TppLabel;
    ppDBTextRcmndation: TppDBText;
    ppStockListLabel13: TppLabel;
    ppStockListDBText13: TppDBText;
    ppStockListLabel14: TppLabel;
    ppStockListDBText14: TppDBText;
    ppStockListLabel15: TppLabel;
    ppDBTextSymbol: TppDBText;
    ppStockListDBText16: TppDBText;
    ppStockListLabel17: TppLabel;
    ppStockListDBText17: TppDBText;
    ppStockListLabel18: TppLabel;
    ppStockListLabel3: TppLabel;
    ppStockListLine1: TppLine;
    ppStockListLine2: TppLine;
    ppStockListLabel16: TppLabel;
    ppStockListLine3: TppLine;
    ppStockListLabel19: TppLabel;
    ppDetailLine: TppLine;
    ppStockListLine5: TppLine;
    ppStockListLabel20: TppLabel;
    ppStockListLine6: TppLine;
    ppStockListSummaryBand1: TppSummaryBand;
    ppStockListLabel25: TppLabel;
    ppStockListLabel27: TppLabel;
    ppStockListLabel28: TppLabel;
    ppStockListLabel29: TppLabel;
    ppStockListLabel30: TppLabel;
    ppStockListDBCalc1: TppDBCalc;
    ppStockListLabel26: TppLabel;
    ppStockListLine7: TppLine;
    ppStockListLabel31: TppLabel;
    ppStockListLabel32: TppLabel;
    qryStock: TQuery;
    ppLblRecommendation: TppLabel;
    dsHoldings: TDataSource;
    plHoldings: TppBDEPipeline;
    tblHoldings: TTable;
    ppStockListDBText12: TppDBText;
    ppStockListDBText15: TppDBText;
    ppStockListDBText18: TppDBText;
    ppStockListDBText19: TppDBText;
    ppLabelClientHoldings: TppLabel;
    ppStockListDBCalc2: TppDBCalc;
    ppStockListShape2: TppShape;
    ppStockListLabel33: TppLabel;
    ppStockListRegion1: TppRegion;
    ppStockListLabel21: TppLabel;
    ppStockListLabel22: TppLabel;
    ppStockListLabel23: TppLabel;
    ppStockListLabel24: TppLabel;
    ppDBCalcRecommendations: TppDBCalc;
    ppCalcBuyTotal: TppVariable;
    ppCalcHoldTotal: TppVariable;
    ppCalcSellTotal: TppVariable;
    ppStockListCalc1: TppSystemVariable;
    ppStockListCalc3: TppSystemVariable;
    procedure ppStockListGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppStockListGroupHeaderBand2BeforePrint(Sender: TObject);
    procedure ppStockListGroupFooterBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
    FRecommendationColor: TColor;

  protected
    function GetReport: TppProducer; override;
    
  public
    { Public declarations }
  end;

var
  frm0063: Tfrm0063;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{Tfrm0063.GetReport}

function Tfrm0063.GetReport: TppProducer;
begin
  Result := ppStockList;
end;


{------------------------------------------------------------------------------}
{Tfrm0063.ppStockListGroupHeaderBand1BeforePrint

          - GroupHeaderBand.BeforePrint event handler}

procedure Tfrm0063.ppStockListGroupHeaderBand1BeforePrint(Sender: TObject);
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

  {check whether group first page of group or a continuation}
  if ppStockList.Groups[0].FirstPage then

    ppLblRecommendation.Caption := 'Recommended ' + lsRecommendation + ' List'
  else
    ppLblRecommendation.Caption := 'Recommended ' + lsRecommendation + '''s continued...';

  ppLblRecommendation.Font.Color := FRecommendationColor;


end;

{------------------------------------------------------------------------------}
{Tfrm0063.ppStockListGroupHeaderBand2BeforePrint

              - GroupHeaderBand2.BeforePrint event handler}

procedure Tfrm0063.ppStockListGroupHeaderBand2BeforePrint(Sender: TObject);
var
  lbDetailVisible: Boolean;
  
begin
  {set the font color of Symbol, Recommendation variables}
  ppDBTextRcmndation.Font.Color := FRecommendationColor;
  ppDBTextSymbol.Font.Color     := FRecommendationColor;

  {determine whether there are any detail records associated with
    this master record}
  if (ppdaNoRecords in plHoldings.State) then
    lbDetailVisible := False
  else
    lbDetailVisible := True;

  {set visibility of detail record related objects:
    DetailBand
    GroupFooterBand for detail totals
    Region containing detail header info }
  ppStockListDetail.Visible := lbDetailVisible;
  ppStockList.Groups[1].FooterBand.Visible := lbDetailVisible;
  ppStockListRegion1.Visible := lbDetailVisible;

  {set detail record heading}
  if lbDetailVisible then
    ppLabelClientHoldings.Text := 'Client Holdings for ' +  qryStock.FieldByName('Symbol').AsString
  else
    ppLabelClientHoldings.Text := '***No Client Holdings for ' + qryStock.FieldByName('Symbol').AsString;

end;

{------------------------------------------------------------------------------}
{Tfrm0063.ppStockListGroupFooterBand1BeforePrint

              - GroupFooterBand1.BeforePrint event handler  }

procedure Tfrm0063.ppStockListGroupFooterBand1BeforePrint(Sender: TObject);
var
  lsRecommendation: String;
  
begin
  lsRecommendation := qryStock.FieldByName('Rcmndation').AsString;

  if (lsRecommendation = 'BUY') then
    ppCalcBuyTotal.AsFloat := ppDBCalcRecommendations.Value

  else if (lsRecommendation = 'SELL') then
    ppCalcSellTotal.AsFloat := ppDBCalcRecommendations.Value

  else if (lsRecommendation = 'HOLD') then
    ppCalcHoldTotal.AsFloat := ppDBCalcRecommendations.Value;

end;

end.
