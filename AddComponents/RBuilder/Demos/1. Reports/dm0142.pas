unit dm0142;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ppClass, dmUtil, ppBands, ppCache, ppCtrls, ppComm, ppReport,
  ppPrnabl, ppDB, ppDBBDE, Db, DBTables, ppStrtch, ppMemo, ppProd, dmEvents,
  ppDBPipe, ppVar, ppRelatv;

type
  Tfrm0142 = class(TdmCustomForm)
    tblCustomer: TTable;
    dsCustomer: TDataSource;
    ppBDEPipeline1: TppBDEPipeline;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ppCustomerList: TppReport;
    ppCustomerListHeader: TppHeaderBand;
    ppCustomerListLabel1: TppLabel;
    ppCustomerListLabel2: TppLabel;
    ppCustomerListLabel3: TppLabel;
    ppCustomerListLabel4: TppLabel;
    ppCustomerListLabel6: TppLabel;
    ppCustomerListLabel7: TppLabel;
    ppCustomerListLabel8: TppLabel;
    ppCustomerListLabel9: TppLabel;
    ppCustomerListDetail: TppDetailBand;
    ppCustomerListDBText2: TppDBText;
    ppCustomerListDBText8: TppDBText;
    ppCustomerListDBText3: TppDBText;
    ppCustomerListDBText4: TppDBText;
    ppCustomerListDBText5: TppDBText;
    ppCustomerListDBText6: TppDBText;
    ppCustomerListFooter: TppFooterBand;
    ppCustomerListLine1: TppLine;
    ppCustomerListDBCalc1: TppDBCalc;
    ppCustomerListLabel5: TppLabel;
    ppCustomerListCalc1: TppSystemVariable;
    ppCustomerListCalc3: TppSystemVariable;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppBDEPipeline1Close(Sender: TObject);
    procedure ppBDEPipeline1First(Sender: TObject);
    procedure ppBDEPipeline1Last(Sender: TObject);
    procedure ppBDEPipeline1Next(Sender: TObject);
    procedure ppBDEPipeline1Open(Sender: TObject);
    procedure ppBDEPipeline1Prior(Sender: TObject);
    procedure ppBDEPipeline1Traversal(Sender: TObject);
    procedure ppCustomerListStartPage(Sender: TObject);
    procedure ppCustomerListEndPage(Sender: TObject);
  private
    FEventTracker: TfrmEvents;
    procedure AddEvent(const aDesc: String);
  protected
    function GetReport: TppProducer; override;
  public
    { Public declarations }
  end;

var
  frm0142: Tfrm0142;

implementation

{$R *.DFM}


function Tfrm0142.GetReport: TppProducer;
begin
  Result := ppCustomerList;
end;

procedure Tfrm0142.FormCreate(Sender: TObject);
begin
  FEventTracker := TfrmEvents.Create(Application);
  FEventTracker.Show;
end;

procedure Tfrm0142.FormDestroy(Sender: TObject);
begin
  FEventTracker.Free;
  FEventTracker := nil;
end;

procedure Tfrm0142.AddEvent(const aDesc: String);
begin
  if (FEventTracker <> nil) then
    FEventTracker.AddEvent(aDesc);
end;

procedure Tfrm0142.ppBDEPipeline1Close(Sender: TObject);
begin
  AddEvent('DataPipeline.OnClose');
end;

procedure Tfrm0142.ppBDEPipeline1First(Sender: TObject);
begin
  AddEvent('DataPipeline.OnFirst');
end;

procedure Tfrm0142.ppBDEPipeline1Last(Sender: TObject);
begin
  AddEvent('DataPipeline.OnLast');
end;

procedure Tfrm0142.ppBDEPipeline1Next(Sender: TObject);
begin
  AddEvent('DataPipeline.OnNext');
end;

procedure Tfrm0142.ppBDEPipeline1Open(Sender: TObject);
begin
  AddEvent('DataPipeline.OnOpen');
end;

procedure Tfrm0142.ppBDEPipeline1Prior(Sender: TObject);
begin
  AddEvent('DataPipeline.OnPrior');
end;

procedure Tfrm0142.ppBDEPipeline1Traversal(Sender: TObject);
begin
  AddEvent('DataPipeline.OnTraversal' + IntToStr(ppBDEPipeline1.TraversalCount));
end;

procedure Tfrm0142.ppCustomerListStartPage(Sender: TObject);
begin
  AddEvent('------------------------------------------------');
  AddEvent('Report.OnStartPage' + IntToStr(ppCustomerList.AbsolutePageNo));
end;

procedure Tfrm0142.ppCustomerListEndPage(Sender: TObject);
begin
  AddEvent('Report.OnEndPage' + IntToStr(ppCustomerList.AbsolutePageNo));
end;

end.
