unit dm0073;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ppClass, dmUtil, ppBands, ppCache, ppCtrls, ppComm, ppReport,
  ppPrnabl, ppDB, ppDBBDE, Db, DBTables, ppStrtch, ppMemo, ExtCtrls,
  ppSubRpt, ppProd, ppDBPipe, ppRelatv, ppModule, ppVar;

const
  {WindDing ASCII codes for check marks and X's}
  cEmptyBox       = #111;
  cCheckMarkInBox = #254;
  cCheckMark      = #252;
  cX              = #251;
  cXInBox         = #253;

type
  Tfrm0073 = class(TdmCustomForm)
    tblCustomer: TTable;
    dsCustomer: TDataSource;
    plCustomer: TppBDEPipeline;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ppOrderDetail: TppReport;
    tblOrder: TTable;
    dsOrder: TDataSource;
    plOrder: TppBDEPipeline;
    Shape3: TShape;
    Label4: TLabel;
    Label5: TLabel;
    tblEmployee: TTable;
    dsEmployee: TDataSource;
    Label6: TLabel;
    plEmployee: TppBDEPipeline;
    Shape2: TShape;
    ppOrderDetailHeaderBand1: TppHeaderBand;
    ppOrderDetailLabel1: TppLabel;
    ppOrderDetailLabel2: TppLabel;
    ppOrderDetailShape1: TppShape;
    ppOrderDetailLabel3: TppLabel;
    ppOrderDetailLabel4: TppLabel;
    ppOrderDetailDBText1: TppDBText;
    ppOrderDetailDBText2: TppDBText;
    ppOrderDetailDetailBand1: TppDetailBand;
    ppOrderDetailDBText3: TppDBText;
    ppOrderDetailDBText4: TppDBText;
    ppOrderDetailDBText5: TppDBText;
    ppOrderDetailDBText6: TppDBText;
    ppOrderDetailDBText7: TppDBText;
    ppOrderDetailDBText8: TppDBText;
    ppOrderDetailLine1: TppLine;
    ppOrderDetailLine2: TppLine;
    ppOrderDetailDBText10: TppDBText;
    ppOrderDetailFooterBand1: TppFooterBand;
    ppOrderDetailGroup1: TppGroup;
    ppOrderDetailGroupHeaderBand1: TppGroupHeaderBand;
    ppOrderDetailShape2: TppShape;
    ppOrderDetailLabel5: TppLabel;
    ppOrderDetailLabel6: TppLabel;
    ppOrderDetailShape3: TppShape;
    ppOrderDetailShape4: TppShape;
    ppOrderDetailLabel7: TppLabel;
    ppOrderDetailLabel8: TppLabel;
    ppOrderDetailLabel9: TppLabel;
    ppOrderDetailLabel10: TppLabel;
    ppOrderDetailShape5: TppShape;
    ppOrderDetailLabel11: TppLabel;
    ppOrderDetailLabel12: TppLabel;
    ppOrderDetailLabel13: TppLabel;
    ppOrderDetailLabel15: TppLabel;
    ppOrderDetailGroupFooterBand1: TppGroupFooterBand;
    ppOrderDetailLine4: TppLine;
    ppOrderDetailLine3: TppLine;
    ppOrderDetailDBText9: TppDBText;
    ppOrderDetailLabel14: TppLabel;
    ppOrderDetailDBCalc1: TppDBCalc;
    tblItem: TTable;
    dsItem: TDataSource;
    plItem: TppBDEPipeline;
    Label7: TLabel;
    Shape1: TShape;
    sbrOrderDetail: TppSubReport;
    ppOrderListChildReport1: TppChildReport;
    ppOrderListChildReport1DetailBand1: TppDetailBand;
    ppOrderListChildReport1DBText1: TppDBText;
    Label8: TLabel;
    Shape4: TShape;
    tblPart: TTable;
    dsPart: TDataSource;
    plPart: TppBDEPipeline;
    ppOrderListChildReport1DBText2: TppDBText;
    ppOrderListChildReport1Label1: TppLabel;
    ppOrderListChildReport1Label2: TppLabel;
    ppOrderListChildReport1DBText3: TppDBText;
    ppOrderListChildReport1Label3: TppLabel;
    ppOrderListChildReport1Shape1: TppShape;
    ppOrderListChildReport1Shape2: TppShape;
    ppOrderListChildReport1DBText4: TppDBText;
    ppOrderListChildReport1Label4: TppLabel;
    ppOrderListChildReport1Label5: TppLabel;
    ppOrderListChildReport1Label6: TppLabel;
    ppOrderListChildReport1Shape3: TppShape;
    ppLabelContinued: TppLabel;
    Shape5: TShape;
    sbrVendorSummary: TppSubReport;
    ppOrderDetailChildReport1: TppChildReport;
    ppOrderDetailChildReport1DetailBand1: TppDetailBand;
    ppOrderDetailChildReport1DBText1: TppDBText;
    ppOrderDetailChildReport1DBText2: TppDBText;
    ppOrderDetailChildReport1Label1: TppLabel;
    ppOrderDetailChildReport1Shape4: TppShape;
    ppOrderDetailChildReport1Shape1: TppShape;
    tblVendOrd: TTable;
    dsVendOrd: TDataSource;
    plVendOrd: TppBDEPipeline;
    tblVendor: TTable;
    dsVendor: TDataSource;
    plVendor: TppBDEPipeline;
    Label10: TLabel;
    Label9: TLabel;
    ppLabelPreferred: TppLabel;
    ppOrderDetailCalc1: TppSystemVariable;
    ppOrderDetailCalc2: TppSystemVariable;
    ppOrderDetailCalc3: TppSystemVariable;
    ppCalcOrderTotal: TppVariable;
    ppCalcItemTotal: TppVariable;
    procedure ppOrderDetailDetailBand1BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppLabelPreferredPrint(Sender: TObject);
    procedure ppCalcItemTotalCalc(Sender: TObject; var Value: Variant);
    procedure ppCalcOrderTotalCalc(Sender: TObject; var Value: Variant);
  private
    { Private declarations }
  protected
    function GetReport: TppProducer; override;
  public
    { Public declarations }
  end;

var
  frm0073: Tfrm0073;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{Tfrm0073.FormCreate}

procedure Tfrm0073.FormCreate(Sender: TObject);
begin
  tblVendOrd.Active := False;
  tblVendOrd.DatabaseName := ExtractFilePath(ParamStr(0));
  tblVendOrd.Active := True;

end;

{------------------------------------------------------------------------------}
{Tfrm0073.GetReport}

function Tfrm0073.GetReport: TppProducer;
begin
  Result := ppOrderDetail;
end;

{------------------------------------------------------------------------------}
{Tfrm0073.ppOrderDetailDetailBand1BeforePrint}

procedure Tfrm0073.ppOrderDetailDetailBand1BeforePrint(Sender: TObject);
begin
  ppLabelContinued.Visible := ppOrderDetailDetailBand1.OverFlow;
end;


procedure Tfrm0073.ppLabelPreferredPrint(Sender: TObject);
begin
  {use ASCII constants defined above to set check mark}
  if tblVendor.FieldByName('Preferred').AsBoolean then
    ppLabelPreferred.Text := cXInBox
  else
    ppLabelPreferred.Text := cEmptyBox;
 
end;

procedure Tfrm0073.ppCalcItemTotalCalc(Sender: TObject; var Value: Variant);
begin
  {event handler for TppCalc.OnCalc event of the child report's item total field,
    ItemTotal = Quantity * Price }
  ppCalcItemTotal.AsFloat := tblItem.FieldByName('Qty').AsInteger * tblPart.FieldByName('ListPrice').AsFloat;

end;

procedure Tfrm0073.ppCalcOrderTotalCalc(Sender: TObject; var Value: Variant);
begin
  {event handler for TppCalc.OnCalc event of the child report's order total field,
    OrderTotal = sum(ItemTotal) }
  ppCalcOrderTotal.AsFloat := ppCalcOrderTotal.AsFloat + ppCalcItemTotal.AsFloat;
end;

end.
