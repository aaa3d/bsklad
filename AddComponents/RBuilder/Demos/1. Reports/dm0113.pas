unit dm0113;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ppClass, Db, DBTables, ppDB, dmUtil, ppReport, ppComm, ppCache,
  ppBands, ppPrnabl, ppCtrls, ppDBBDE, Grids, DBGrids, ppProd, ppDBPipe,
  ppRelatv;

type
  Tfrm0113 = class(TdmCustomForm)
    ppReport1: TppReport;
    ppReport1Shape2: TppShape;
    ppReport1Shape3: TppShape;
    ppReport1Shape4: TppShape;
    ppReport1Label2: TppLabel;
    ppReport1Label3: TppLabel;
    ppReport1Label4: TppLabel;
    ppBDEPipeline1: TppBDEPipeline;
    Table1: TTable;
    DataSource1: TDataSource;
    ppReport1DBText1: TppDBText;
    ppReport1DBText2: TppDBText;
    ppReport1DBCalc1: TppDBCalc;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetReport: TppProducer; override;
    procedure Init; override;
  public
    { Public declarations }
  end;

var
  frm0113: Tfrm0113;

implementation

{$R *.DFM}


function Tfrm0113.GetReport: TppProducer;
begin
  Result := ppReport1;
end;

procedure Tfrm0113.Init;
begin
  {initialize inherited properties}
  DisplayForm := True;
  AssignViewer := True;
end;

procedure Tfrm0113.Button1Click(Sender: TObject);
begin
  Table1.DisableControls;

  ppReport1.Reset;
  ppReport1.Print;

  Table1.EnableControls;
end;


end.
