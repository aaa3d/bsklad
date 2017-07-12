{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbFrmTxt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppDB, ppComm, ppCache, ppTxPipe, ppVar, ppBands, ppCtrls, ppPrnabl,
  ppClass, ppProd, ppReport, StdCtrls,
  rbClass, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }


  TfrmPrintFromTextFile = class(TrbReportForm)
    plCustomer: TppTextPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    rbCustomerList: TppReport;
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
    btnPreview: TButton;
    ppField8: TppField;
    procedure btnPreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  protected
    function GetReport: TppReport; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintFromTextFile: TfrmPrintFromTextFile;

implementation

{$R *.DFM}


{------------------------------------------------------------------------------}
{ TfrmPrintFromTextFile.GetReport }

function TfrmPrintFromTextFile.GetReport: TppReport;
begin
  Result := rbCustomerList;
  
end; {function, GetReport}


{------------------------------------------------------------------------------}
{ TfrmPrintFromTextFile.btnPreviewClick }

procedure TfrmPrintFromTextFile.btnPreviewClick(Sender: TObject);
begin
  rbCustomerList.Print;

end; {procedure, btnPreviewClick}

{------------------------------------------------------------------------------}
{ TfrmPrintFromTextFile.FormCreate }

procedure TfrmPrintFromTextFile.FormCreate(Sender: TObject);
begin

  plCustomer.FileName := ExtractFilePath(ParamStr(0)) + 'Customer.txt';

end; {procedure, FormCreate}

end.
