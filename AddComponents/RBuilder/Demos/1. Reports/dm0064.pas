unit dm0064;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppCtrls, ppBands, ppClass, ppPrnabl, DBTables, ppCache, ppDB, ppDBBDE,
  Db, ppComm, ppProd, ppReport, dmUtil, StdCtrls, ppDBPipe, ppVar, ppRelatv;

type
  Tfrm0064 = class(TdmCustomForm)
    ppReport1: TppReport;
    tblCustomer: TTable;
    dsCustomer: TDataSource;
    plCustomer: TppBDEPipeline;
    plOrder: TppBDEPipeline;
    dsOrder: TDataSource;
    ppReport1DBText1: TppDBText;
    ppReport1DBText2: TppDBText;
    ppReport1DBText3: TppDBText;
    ppReport1Label1: TppLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    tblOrder: TTable;
    ppReport1Calc1: TppSystemVariable;
    procedure plCustomerRecordPositionChange(Sender: TObject);
  private
    procedure RetrieveDetailData;

  protected
    function GetReport: TppProducer; override;
    
  public
    { Public declarations }
  end;

var
  frm0064: Tfrm0064;

implementation

{$R *.DFM}

function Tfrm0064.GetReport: TppProducer;
begin
  Result := ppReport1;
end;

procedure Tfrm0064.RetrieveDetailData;
begin
  tblOrder.Filter := 'custno = ' + tblCustomer.FieldByName('CustNo').AsString;
end;

procedure Tfrm0064.plCustomerRecordPositionChange(Sender: TObject);
begin
  RetrieveDetailData;
end;


end.
