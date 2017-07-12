{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbDrillD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppCtrls, ppDB, ppPrnabl, ppProd, ppReport, ppComm,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppVar, StdCtrls, ExtCtrls,
  ppStrtch, ppSubRpt,
  rbClass, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }


  TfrmDrillDownSubreport = class(TrbReportForm)
    tblCustomer: TTable;
    dsCustomer: TDataSource;
    plCustomer: TppBDEPipeline;
    tblOrder: TTable;
    dsOrder: TDataSource;
    plOrder: TppBDEPipeline;
    tblEmployee: TTable;
    dsEmployee: TDataSource;
    plEmployee: TppBDEPipeline;
    rbOrderDetail: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape3: TppShape;
    ppDBText5: TppDBText;
    ppLine2: TppLine;
    ppLine1: TppLine;
    ppLine5: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    tblItem: TTable;
    dsItem: TDataSource;
    plItem: TppBDEPipeline;
    tblPart: TTable;
    dsPart: TDataSource;
    plPart: TppBDEPipeline;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppDetailBand3: TppDetailBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppShape7: TppShape;
    ppLabel17: TppLabel;
    ppDBText11: TppDBText;
    ppLabel18: TppLabel;
    ppDBText12: TppDBText;
    ppLabel19: TppLabel;
    ppDBText13: TppDBText;
    ppLabel20: TppLabel;
    ppDBText14: TppDBText;
    ppLabel15: TppLabel;
    vrItemTotal: TppVariable;
    ppShape8: TppShape;
    ppShape6: TppShape;
    ppLabel21: TppLabel;
    vrOrderTotal: TppVariable;
    shpClickMe: TppShape;
    btnPreview: TButton;
    ppDBText4: TppDBText;
    ppDBText1: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    lbContinued: TppLabel;
    ppShape5: TppShape;
    ppLabel1: TppLabel;
    ppShape1: TppShape;
    ppLabel9: TppLabel;
    ppShape4: TppShape;
    ppLabel12: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLabel13: TppLabel;
    ppLine4: TppLine;
    ppLine3: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLabel16: TppLabel;
    ppDBText15: TppDBText;
    procedure btnPreviewClick(Sender: TObject);
    procedure vrOrderTotalCalc(Sender: TObject; var Value: Variant);
    procedure vrItemTotalCalc(Sender: TObject; var Value: Variant);
    procedure lbContinuedPrint(Sender: TObject);

  protected
    function GetReport: TppReport; override;

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  frmDrillDownSubreport: TfrmDrillDownSubreport;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmDrillDownSubreport.GetReport }

function TfrmDrillDownSubreport.GetReport: TppReport;
begin
  Result := rbOrderDetail;

end; {function, GetReport}

{------------------------------------------------------------------------------}
{ TfrmDrillDownSubreport.btnPreviewClick }

procedure TfrmDrillDownSubreport.btnPreviewClick(Sender: TObject);
begin
  rbOrderDetail.Print;

end; {procedure, btnPreviewClick}

{------------------------------------------------------------------------------}
{ TfrmDrillDownSubreport.vrItemTotalCalc }

procedure TfrmDrillDownSubreport.vrItemTotalCalc(Sender: TObject; var Value: Variant);
begin
  Value := tblItem.FieldByName('Qty').AsInteger *
           tblPart.FieldByName('ListPrice').AsCurrency;

end; {procedure, vrItemTotalCalc}

{------------------------------------------------------------------------------}
{ TfrmDrillDownSubreport.vrOrderTotalCalc }

procedure TfrmDrillDownSubreport.vrOrderTotalCalc(Sender: TObject; var Value: Variant);
begin
  Value := Value + vrItemTotal.Value;

end; {procedure, vrOrderTotalCalc}


{------------------------------------------------------------------------------}
{ TfrmDrillDownSubreport.lbContinuedPrint }

procedure TfrmDrillDownSubreport.lbContinuedPrint(Sender: TObject);
begin
  lbContinued.Visible := rbOrderDetail.DetailBand.OverFlow;

end; {procedure, lbContinuedPrint}


end.
