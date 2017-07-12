{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbToTxt;

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

  TfrmPrintToTextFile = class(TrbReportForm)
    tblCustomer: TTable;
    dsCustomer: TDataSource;
    plCustomer: TppBDEPipeline;
    rbPrintData: TppReport;
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
  protected
    function GetReport: TppReport; override;
  private
    FPathName: String;
  public
    { Public declarations }
  end;

var
  frmPrintToTextFile: TfrmPrintToTextFile;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmPrintToTextFile.GetReport }

function TfrmPrintToTextFile.GetReport: TppReport;
begin
  Result := rbPrintData;

end; {function, GetReport}

{------------------------------------------------------------------------------}
{ TfrmPrintToTextFile.FormCreate }

procedure TfrmPrintToTextFile.FormCreate(Sender: TObject);
begin
  FPathName := ExtractFilePath(ParamStr(0));

  rbPrintData.Template.FileName := FPathName + 'CustTab.rtm';

end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TfrmPrintToTextFile.btnPreviewClick }

procedure TfrmPrintToTextFile.btnPreviewClick(Sender: TObject);
begin
  rbPrintData.Template.LoadFromFile;
  rbPrintData.TextFileName :=  FPathName + 'Customer.txt';
  rbPrintData.DeviceType := 'Screen';
  rbPrintData.Print;

end; {procedure, btnPreviewClick}

{------------------------------------------------------------------------------}
{ TfrmPrintToTextFile.btnPrintClick }

procedure TfrmPrintToTextFile.btnPrintClick(Sender: TObject);
begin
  rbPrintData.Template.LoadFromFile;
  rbPrintData.TextFileName :=  FPathName + 'Customer.txt';
  rbPrintData.DeviceType := 'Printer';
  rbPrintData.Print;

end; {procedure, btnPrintClick}

{------------------------------------------------------------------------------}
{ TfrmPrintToTextFile.rbTabularClick }

procedure TfrmPrintToTextFile.rbTabularClick(Sender: TObject);
begin
  rbPrintData.Template.FileName := FPathName + 'CustTab.rtm';

end; {procedure, rbTabularClick}

{------------------------------------------------------------------------------}
{ TfrmPrintToTextFile.rbVerticalClick }

procedure TfrmPrintToTextFile.rbVerticalClick(Sender: TObject);
begin
  rbPrintData.Template.FileName := FPathName + 'CustVert.rtm';

end; {procedure, rbVerticalClick}


end.
