{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbMD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppCtrls, ppDB, ppPrnabl, ppProd, ppReport, ppComm,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppVar, StdCtrls,
  rbClass, ExtCtrls, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }

  TfrmMasterDetail = class(TrbReportForm)
    rbOrderSummary: TppReport;
    btnPreview: TButton;
    Shape1: TShape;
    Shape4: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape5: TShape;
    tblCustomer: TTable;
    dsCustomer: TDataSource;
    plCustomer: TppBDEPipeline;
    tblOrder: TTable;
    dsOrder: TDataSource;
    plOrder: TppBDEPipeline;
    tblEmployee: TTable;
    dsEmployee: TDataSource;
    plEmployee: TppBDEPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine2: TppLine;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine1: TppLine;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape3: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppShape5: TppShape;
    ppLabel11: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppShape4: TppShape;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc2: TppDBCalc;
    ppLine4: TppLine;
    ppLine5: TppLine;
    procedure btnPreviewClick(Sender: TObject);
  protected
    function GetReport: TppReport; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterDetail: TfrmMasterDetail;

implementation

{$R *.DFM}


{------------------------------------------------------------------------------}
{ TfrmMasterDetail.GetReport }

function TfrmMasterDetail.GetReport: TppReport;
begin
  Result := rbOrderSummary;

end;  {function, GetReport}

{------------------------------------------------------------------------------}
{ TfrmMasterDetail.btnPreviewClick }

procedure TfrmMasterDetail.btnPreviewClick(Sender: TObject);
begin
  rbOrderSummary.Print;

end; {procedure, btnPreviewClick}

end.
