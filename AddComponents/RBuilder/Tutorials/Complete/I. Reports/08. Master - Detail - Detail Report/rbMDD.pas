{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbMDD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppCtrls, ppDB, ppPrnabl, ppProd, ppReport, ppComm,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppVar, StdCtrls, ExtCtrls,
  ppStrtch, ppSubRpt, rbClass, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }


  TfrmMasterDetailDetail = class(TrbReportForm)
    tblCustomer: TTable;
    dsCustomer: TDataSource;
    plCustomer: TppBDEPipeline;
    tblOrder: TTable;
    dsOrder: TDataSource;
    plOrder: TppBDEPipeline;
    tblEmployee: TTable;
    dsEmployee: TDataSource;
    plEmployee: TppBDEPipeline;
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
    rbOrderDetail: TppReport;
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
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppDetailBand3: TppDetailBand;
    ppShape8: TppShape;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    vrItemTotal: TppVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppShape7: TppShape;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel13: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppShape6: TppShape;
    ppLabel20: TppLabel;
    vrOrderTotal: TppVariable;
    lbContinued: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
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
    btnPreview: TButton;
    ppLabel21: TppLabel;
    ppDBText1: TppDBText;
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
  frmMasterDetailDetail: TfrmMasterDetailDetail;

implementation

{$R *.DFM}


{------------------------------------------------------------------------------}
{ TfrmMasterDetailDetail.GetReport }

function TfrmMasterDetailDetail.GetReport: TppReport;
begin
  Result := rbOrderDetail;
  
end; {function, GetReport}

{------------------------------------------------------------------------------}
{ TfrmMasterDetailDetail.btnPreviewClick }

procedure TfrmMasterDetailDetail.btnPreviewClick(Sender: TObject);
begin
  rbOrderDetail.Print;

end; {procedure, btnPreviewClick}

{------------------------------------------------------------------------------}
{ TfrmMasterDetailDetail.vrItemTotalCalc }

procedure TfrmMasterDetailDetail.vrItemTotalCalc(Sender: TObject; var Value: Variant);
begin
  Value := tblItem.FieldByName('Qty').AsInteger *
            tblPart.FieldByName('ListPrice').AsCurrency;

end; {procedure, vrItemTotalCalc}

{------------------------------------------------------------------------------}
{ TfrmMasterDetailDetail.vrOrderTotalCalc }

procedure TfrmMasterDetailDetail.vrOrderTotalCalc(Sender: TObject; var Value: Variant);
begin
  Value := Value + vrItemTotal.Value;

end; {procedure, vrOrderTotalCalc}


{------------------------------------------------------------------------------}
{ TfrmMasterDetailDetail.lbContinuedPrint }

procedure TfrmMasterDetailDetail.lbContinuedPrint(Sender: TObject);
begin
  lbContinued.Visible := rbOrderDetail.DetailBand.OverFlow;

end; {procedure, lbContinuedPrint}

end.
