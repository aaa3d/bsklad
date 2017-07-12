{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ppCtrls, ppVar, ppPrnabl, ppClass, ppBands, ppDB, ppProd, ppReport,
  ppComm, ppCache, ppDBPipe, Db, DBTables,
  rbClass, ppDBBDE, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }

  TfrmCustomerList = class(TrbReportForm)
    tblCustomer: TTable;
    dsCustomer: TDataSource;
    rbCustomerList: TppReport;
    btnPreview: TButton;
    plCustomer: TppBDEPipeline;
    ppCustomerListHeader: TppHeaderBand;
    ppCustomerListLabel1: TppLabel;
    ppCustomerListLabel2: TppLabel;
    ppCustomerListLabel3: TppLabel;
    ppCustomerListLabel4: TppLabel;
    ppCustomerListLabel6: TppLabel;
    ppCustomerListLabel7: TppLabel;
    ppCustomerListLabel8: TppLabel;
    ppCustomerListLabel9: TppLabel;
    ppCustomerListLine1: TppLine;
    ppCustomerListDetail: TppDetailBand;
    ppCustomerListDBText2: TppDBText;
    ppCustomerListDBText8: TppDBText;
    ppCustomerListDBText3: TppDBText;
    ppCustomerListDBText4: TppDBText;
    ppCustomerListDBText5: TppDBText;
    ppCustomerListDBText6: TppDBText;
    ppCustomerListFooter: TppFooterBand;
    ppCustomerListCalc1: TppSystemVariable;
    ppCustomerListCalc3: TppSystemVariable;
    procedure btnPreviewClick(Sender: TObject);
  protected
    function GetReport: TppReport; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCustomerList: TfrmCustomerList;

implementation

{$R *.DFM}


{------------------------------------------------------------------------------}
{ TfrmCustomerList.GetReport }

function TfrmCustomerList.GetReport: TppReport;
begin
  Result := rbCustomerList;
  
end; {function, GetReport}

{------------------------------------------------------------------------------}
{ TfrmCustomerList.btnPreviewClick }

procedure TfrmCustomerList.btnPreviewClick(Sender: TObject);
begin
  rbCustomerList.Print;

end;  {procedure, btnPreviewClick}

end.
