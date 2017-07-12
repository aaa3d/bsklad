unit dm0085;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dmUtil, ppClass, ppBands, ppCache, ppCtrls, ppComm, ppReport,
  ppPrnabl, ppDB, ppDBBDE, Db, DBTables, ppStrtch, ppMemo, ppRegion, ppProd,
  ppDBPipe, ppRelatv;

type
  Tfrm0085 = class(TdmCustomForm)
    tblBioLife: TTable;
    dsBioLife: TDataSource;
    ppBDEPipeline1: TppBDEPipeline;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ppReport1: TppReport;
    ppReport1HeaderBand1: TppHeaderBand;
    ppReport1Label1: TppLabel;
    ppReport1Line1: TppLine;
    ppReport1DetailBand1: TppDetailBand;
    ppReport1DBMemo2: TppDBMemo;
    ppReport1Memo1: TppMemo;
    ppReport2Memo1: TppMemo;
    ppReport1FooterBand1: TppFooterBand;
    ppReport1Region1: TppRegion;
    ppReport1Region2: TppRegion;
  private
    { Private declarations }
  protected
    function GetReport: TppProducer; override;
  public
    { Public declarations }
  end;

var
  frm0085: Tfrm0085;

implementation

{$R *.DFM}

function Tfrm0085.GetReport: TppProducer;
begin
  Result := ppReport1;
end;



end.
