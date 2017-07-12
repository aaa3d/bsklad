unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frxDBSet, DBTables, Db, frxClass;

type
  TReportData = class(TDataModule)
    Customers: TTable;
    CustomersCustNo: TFloatField;
    CustomersCompany: TStringField;
    CustomersAddr1: TStringField;
    CustomersAddr2: TStringField;
    CustomersCity: TStringField;
    CustomersState: TStringField;
    CustomersZip: TStringField;
    CustomersCountry: TStringField;
    CustomersPhone: TStringField;
    CustomersFAX: TStringField;
    CustomersTaxRate: TFloatField;
    CustomersContact: TStringField;
    CustomersLastInvoiceDate: TDateTimeField;
    Orders: TTable;
    OrdersOrderNo: TFloatField;
    OrdersCustNo: TFloatField;
    OrdersCustCompany: TStringField;
    OrdersSaleDate: TDateTimeField;
    OrdersShipDate: TDateTimeField;
    OrdersEmpNo: TIntegerField;
    OrdersShipToContact: TStringField;
    OrdersShipToAddr1: TStringField;
    OrdersShipToAddr2: TStringField;
    OrdersShipToCity: TStringField;
    OrdersShipToState: TStringField;
    OrdersShipToZip: TStringField;
    OrdersShipToCountry: TStringField;
    OrdersShipToPhone: TStringField;
    OrdersShipVIA: TStringField;
    OrdersPO: TStringField;
    OrdersTerms: TStringField;
    OrdersPaymentMethod: TStringField;
    OrdersItemsTotal: TCurrencyField;
    OrdersTaxRate: TFloatField;
    OrdersFreight: TCurrencyField;
    OrdersAmountPaid: TCurrencyField;
    LineItems: TTable;
    LineItemsOrderNo: TFloatField;
    LineItemsItemNo: TFloatField;
    LineItemsPartNo: TFloatField;
    LineItemsPartName: TStringField;
    LineItemsQty: TIntegerField;
    LineItemsPrice: TCurrencyField;
    LineItemsDiscount: TFloatField;
    LineItemsTotal: TCurrencyField;
    LineItemsExtendedPrice: TCurrencyField;
    Parts: TTable;
    PartsPartNo: TFloatField;
    PartsVendorNo: TFloatField;
    PartsDescription: TStringField;
    PartsOnHand: TFloatField;
    PartsOnOrder: TFloatField;
    PartsCost: TCurrencyField;
    PartsListPrice: TCurrencyField;
    CustomerSource: TDataSource;
    OrderSource: TDataSource;
    LineItemSource: TDataSource;
    PartSource: TDataSource;
    RepQuery: TQuery;
    RepQueryCustNo: TFloatField;
    RepQueryCompany: TStringField;
    RepQueryAddr1: TStringField;
    RepQueryAddr2: TStringField;
    RepQueryCity: TStringField;
    RepQueryState: TStringField;
    RepQueryZip: TStringField;
    RepQueryCountry: TStringField;
    RepQueryPhone: TStringField;
    RepQueryFAX: TStringField;
    RepQueryTaxRate: TFloatField;
    RepQueryContact: TStringField;
    RepQueryLastInvoiceDate: TDateTimeField;
    RepQueryOrderNo: TFloatField;
    RepQueryCustNo_1: TFloatField;
    RepQuerySaleDate: TDateTimeField;
    RepQueryShipDate: TDateTimeField;
    RepQueryEmpNo: TIntegerField;
    RepQueryShipToContact: TStringField;
    RepQueryShipToAddr1: TStringField;
    RepQueryShipToAddr2: TStringField;
    RepQueryShipToCity: TStringField;
    RepQueryShipToState: TStringField;
    RepQueryShipToZip: TStringField;
    RepQueryShipToCountry: TStringField;
    RepQueryShipToPhone: TStringField;
    RepQueryShipVIA: TStringField;
    RepQueryPO: TStringField;
    RepQueryTerms: TStringField;
    RepQueryPaymentMethod: TStringField;
    RepQueryItemsTotal: TCurrencyField;
    RepQueryTaxRate_1: TFloatField;
    RepQueryFreight: TCurrencyField;
    RepQueryAmountPaid: TCurrencyField;
    RepQueryOrderNo_1: TFloatField;
    RepQueryItemNo: TFloatField;
    RepQueryPartNo: TFloatField;
    RepQueryQty: TIntegerField;
    RepQueryDiscount: TFloatField;
    RepQueryPartNo_1: TFloatField;
    RepQueryVendorNo: TFloatField;
    RepQueryDescription: TStringField;
    RepQueryOnHand: TFloatField;
    RepQueryOnOrder: TFloatField;
    RepQueryCost: TCurrencyField;
    RepQueryListPrice: TCurrencyField;
    RepQuerySource: TDataSource;
    CustomersDS: TfrxDBDataset;
    OrdersDS: TfrxDBDataset;
    ItemsDS: TfrxDBDataset;
    PartDS: TfrxDBDataset;
    QueryDS: TfrxDBDataset;
    Bio: TTable;
    BioSource: TDataSource;
    BioDS: TfrxDBDataset;
    Country: TTable;
    CountrySource: TDataSource;
    CountryDS: TfrxDBDataset;
    Cross: TTable;
    CrossSource: TDataSource;
    CrossDS: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportData: TReportData;

implementation

{$R *.DFM}

procedure TReportData.DataModuleCreate(Sender: TObject);
begin
  Cross.DatabaseName := ExtractFilePath(Application.ExeName);
end;

end.
