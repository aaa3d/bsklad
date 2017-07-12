{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbViaWiz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ppBands, ppCtrls, ppPrnabl, ppClass, ppDB, ppProd,
  ppReport, ppComm, ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppVar,
  rbClass, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }

  TfrmViaReportWizard = class(TrbReportForm)
    tblCustomer: TTable;
    dsCustomer: TDataSource;
    plCustomer: TppBDEPipeline;
    rbCustomerList: TppReport;
    gbReportStyle: TGroupBox;
    rbTabular: TRadioButton;
    rbVertical: TRadioButton;
    btnPreview: TButton;
    btnPrint: TButton;
    ppTitleBand2: TppTitleBand;
    ppLabel2: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure rbTabularClick(Sender: TObject);
    procedure rbVerticalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPathName: String;
  protected
    function GetReport: TppReport; override;
  public
    { Public declarations }
  end;

var
  frmViaReportWizard: TfrmViaReportWizard;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmViaDataTree.GetReport }

function TfrmViaReportWizard.GetReport: TppReport;
begin
  Result := rbCustomerList;

end; {function, GetReport}

{------------------------------------------------------------------------------}
{ TfrmViaDataTree.FormCreate }

procedure TfrmViaReportWizard.FormCreate(Sender: TObject);
begin
  FPathName := ExtractFilePath(ParamStr(0));

  rbCustomerList.Template.FileName := FPathName + 'CustTab.rtm';

end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TfrmViaDataTree.btnPreviewClick }

procedure TfrmViaReportWizard.btnPreviewClick(Sender: TObject);
begin
  rbCustomerList.Template.LoadFromFile;
  rbCustomerList.DeviceType := 'Screen';
  rbCustomerList.Print;
end; {procedure, btnPreviewClick}

{------------------------------------------------------------------------------}
{ TfrmViaDataTree.btnPrintClick }

procedure TfrmViaReportWizard.btnPrintClick(Sender: TObject);
begin
  rbCustomerList.Template.LoadFromFile;
  rbCustomerList.DeviceType := 'Printer';
  rbCustomerList.Print;
end; {procedure, btnPrintClick}

{------------------------------------------------------------------------------}
{ TfrmViaDataTree.rbTabularClick }

procedure TfrmViaReportWizard.rbTabularClick(Sender: TObject);
begin
  rbCustomerList.Template.FileName := FPathName + 'CustTab.rtm';
end; {procedure, rbTabularClick}

{------------------------------------------------------------------------------}
{ TfrmViaDataTree.rbVerticalClick }

procedure TfrmViaReportWizard.rbVerticalClick(Sender: TObject);
begin
  rbCustomerList.Template.FileName := FPathName + 'CustVert.rtm';

end; {procedure, rbVerticalClick}

end.
