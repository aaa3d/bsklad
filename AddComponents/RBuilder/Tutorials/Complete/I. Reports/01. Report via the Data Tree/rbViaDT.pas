{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}


unit rbViaDT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ppCtrls, ppDB, ppPrnabl, ppClass, ppBands, ppProd, ppReport, ppComm,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppVar,
  rbClass, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }

  TfrmViaDataTree = class(TrbReportForm)
    tblCustomer: TTable;
    dsCustomer: TDataSource;
    plCustomer: TppBDEPipeline;
    rbCustomerList: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppShape3: TppShape;
    ppDBText2: TppDBText;
    ppShape4: TppShape;
    ppLabel5: TppLabel;
    ppShape5: TppShape;
    ppDBText3: TppDBText;
    ppShape6: TppShape;
    ppLabel6: TppLabel;
    ppShape7: TppShape;
    ppDBText4: TppDBText;
    ppShape8: TppShape;
    ppLabel7: TppLabel;
    ppShape9: TppShape;
    ppDBText5: TppDBText;
    ppShape10: TppShape;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    btnPreview: TButton;
    procedure btnPreviewClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetReport: TppReport; override;
  public
    { Public declarations }
  end;

var
  frmViaDataTree: TfrmViaDataTree;

implementation

{$R *.DFM}


{------------------------------------------------------------------------------}
{ TfrmViaDataTree.GetReport }

function TfrmViaDataTree.GetReport: TppReport;
begin
  Result := rbCustomerList;
  
end; {function, GetReport}


{------------------------------------------------------------------------------}
{ TfrmViaDataTree.btnPreviewClick }

procedure TfrmViaDataTree.btnPreviewClick(Sender: TObject);
begin
  rbCustomerList.Print;

end; {procedure, btnPreviewClick}

end.
