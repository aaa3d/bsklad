unit dm0145;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ppClass, dmUtil, ppBands, ppCache, ppCtrls, ppComm, ppReport,
  ppPrnabl, ppDB, ppDBBDE, Db, DBTables, ppStrtch, ppMemo, ppProd, dmEvents,
  ppDBPipe, ppVar, ppRelatv;

type
  Tfrm0145 = class(TdmCustomForm)
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
    ppCustomerListLabel10: TppLabel;
    ppCustomerListLabel11: TppLabel;
    ppCustomerListCalc1: TppSystemVariable;
    ppCustomerListCalc3: TppSystemVariable;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppCustomerListStartPage(Sender: TObject);
    procedure ppCustomerListEndPage(Sender: TObject);
    procedure ppCustomerListAfterPrint(Sender: TObject);
    procedure ppCustomerListBeforePrint(Sender: TObject);
    procedure ppCustomerListCancel(Sender: TObject);
    procedure ppCustomerListCancelDialogClose(Sender: TObject);
    procedure ppCustomerListCancelDialogCreate(Sender: TObject);
    procedure ppCustomerListEndFirstPass(Sender: TObject);
    procedure ppCustomerListEndSecondPass(Sender: TObject);
    procedure ppCustomerListPreviewFormClose(Sender: TObject);
    procedure ppCustomerListPreviewFormCreate(Sender: TObject);
    procedure ppCustomerListPrintDialogClose(Sender: TObject);
    procedure ppCustomerListPrintDialogCreate(Sender: TObject);
    procedure ppCustomerListPrintingComplete(Sender: TObject);
    procedure ppCustomerListStartFirstPass(Sender: TObject);
    procedure ppCustomerListStartSecondPass(Sender: TObject);
    procedure ppCustomerListGroup1AfterGroupBreak(Sender: TObject);
    procedure ppCustomerListGroup1GetBreakValue(Sender: TObject;
      var aBreakValue: String);
    procedure ppCustomerListGroup1BeforeGroupBreak(Sender: TObject);
    procedure ppCustomerListGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppCustomerListGroupHeaderBand1AfterPrint(Sender: TObject);
    procedure ppCustomerListGroupFooterBand1AfterPrint(Sender: TObject);
    procedure ppCustomerListGroupFooterBand1BeforePrint(Sender: TObject);
  private
    FEventTracker: TfrmEvents;
    procedure AddEvent(const aDesc: String);
  protected
    function GetReport: TppProducer; override;
  public
    { Public declarations }
  end;

var
  frm0145: Tfrm0145;

implementation

{$R *.DFM}


function Tfrm0145.GetReport: TppProducer;
begin
  Result := ppCustomerList;
end;

procedure Tfrm0145.FormCreate(Sender: TObject);
begin
  FEventTracker := TfrmEvents.Create(Application);
  FEventTracker.Show;
end;

procedure Tfrm0145.FormDestroy(Sender: TObject);
begin
  FEventTracker.Free;
  FEventTracker := nil;
end;

procedure Tfrm0145.AddEvent(const aDesc: String);
begin
  if (FEventTracker <> nil) then
    FEventTracker.AddEvent(aDesc);
end;

procedure Tfrm0145.ppCustomerListStartPage(Sender: TObject);
begin
  AddEvent('------------------------------------------------');
  AddEvent('Report.OnStartPage' + IntToStr(ppCustomerList.AbsolutePageNo));
end;

procedure Tfrm0145.ppCustomerListEndPage(Sender: TObject);
begin
  AddEvent('Report.OnEndPage' + IntToStr(ppCustomerList.AbsolutePageNo));
end;

procedure Tfrm0145.ppCustomerListAfterPrint(Sender: TObject);
begin
  AddEvent('Report.AfterPrint');
end;

procedure Tfrm0145.ppCustomerListBeforePrint(Sender: TObject);
begin
  AddEvent('Report.BeforePrint');
end;

procedure Tfrm0145.ppCustomerListCancel(Sender: TObject);
begin
  AddEvent('Report.OnCancel');
end;

procedure Tfrm0145.ppCustomerListCancelDialogClose(Sender: TObject);
begin
  AddEvent('Report.OnCancelDialogClose');
end;

procedure Tfrm0145.ppCustomerListCancelDialogCreate(Sender: TObject);
begin
  AddEvent('Report.OnCancelDialogCreate');
end;

procedure Tfrm0145.ppCustomerListEndFirstPass(Sender: TObject);
begin
  AddEvent('Report.OnEndFirstPass');
end;

procedure Tfrm0145.ppCustomerListEndSecondPass(Sender: TObject);
begin
  AddEvent('Report.OnEndSecondPass');
end;

procedure Tfrm0145.ppCustomerListPreviewFormClose(Sender: TObject);
begin
  AddEvent('Report.OnPreviewFormClose');
end;

procedure Tfrm0145.ppCustomerListPreviewFormCreate(Sender: TObject);
begin
  AddEvent('Report.OnPreviewFormCreate');
end;

procedure Tfrm0145.ppCustomerListPrintDialogClose(Sender: TObject);
begin
  AddEvent('Report.OnPrintDialogClose');
end;

procedure Tfrm0145.ppCustomerListPrintDialogCreate(Sender: TObject);
begin
  AddEvent('Report.OnPrintDialogCreate');
end;

procedure Tfrm0145.ppCustomerListPrintingComplete(Sender: TObject);
begin
  AddEvent('Report.OnPrintingComplete');
end;

procedure Tfrm0145.ppCustomerListStartFirstPass(Sender: TObject);
begin
  AddEvent('Report.OnStartFirstPass');
end;

procedure Tfrm0145.ppCustomerListStartSecondPass(Sender: TObject);
begin
  AddEvent('Report.OnStartSecondPass');
end;




procedure Tfrm0145.ppCustomerListGroup1AfterGroupBreak(Sender: TObject);
begin
  AddEvent('Report.Groups[0].AfterGroupBreak' + IntToStr(ppCustomerList.Groups[0].BreakNo));
end;

procedure Tfrm0145.ppCustomerListGroup1GetBreakValue(Sender: TObject;
  var aBreakValue: String);
begin
  AddEvent('Report.Groups[0].OnGetBreakValue(' + aBreakValue + ')');
end;

procedure Tfrm0145.ppCustomerListGroup1BeforeGroupBreak(Sender: TObject);
begin
  AddEvent('Report.Groups[0].BeforeGroupBreak' + IntToStr(ppCustomerList.Groups[0].BreakNo));
end;

procedure Tfrm0145.ppCustomerListGroupHeaderBand1BeforePrint(
  Sender: TObject);
begin
  AddEvent('Report.Groups[0].HeaderBandBeforePrint' + IntToStr(ppCustomerList.Groups[0].BreakNo));
end;

procedure Tfrm0145.ppCustomerListGroupHeaderBand1AfterPrint(
  Sender: TObject);
begin
  AddEvent('Report.Groups[0].HeaderBandAfterPrint' + IntToStr(ppCustomerList.Groups[0].BreakNo));
end;

procedure Tfrm0145.ppCustomerListGroupFooterBand1AfterPrint(
  Sender: TObject);
begin
  AddEvent('Report.Groups[0].FooterBandAfterPrint' + IntToStr(ppCustomerList.Groups[0].BreakNo));
end;

procedure Tfrm0145.ppCustomerListGroupFooterBand1BeforePrint(
  Sender: TObject);
begin
  AddEvent('Report.Groups[0].FooterBandBeforePrint' + IntToStr(ppCustomerList.Groups[0].BreakNo));
end;

end.
