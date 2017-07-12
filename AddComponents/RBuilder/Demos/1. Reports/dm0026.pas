unit dm0026;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ppClass, dmUtil, ppBands, ppCache, ppCtrls, ppComm, ppReport,
  ppPrnabl, ppDB, ppDBBDE, Db, DBTables, ppStrtch, ppMemo, ppRichTx,
  ppRegion, ppProd, ppRelatv;

type
  Tfrm0026 = class(TdmCustomForm)
    Label2: TLabel;
    Label3: TLabel;
    ppReport1: TppReport;
    ppCustomerListDetail: TppDetailBand;
    ppReport1RichText1: TppRichText;
    ppReport1HeaderBand1: TppHeaderBand;
    ppReport1Label1: TppLabel;

  private
    { Private declarations }

  protected
    function GetReport: TppProducer; override;
  public
    { Public declarations }
  end;

var
  frm0026: Tfrm0026;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{Tfrm0026.GetReport}

function Tfrm0026.GetReport: TppProducer;
begin
  Result := ppReport1;
end;


end.
