{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbMailL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppComm, ppProd, ppReport,
  rbClass, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }

  TfrmMailingLabels = class(TrbReportForm)
    rbMailingLabels: TppReport;
    ppReport1ColumnHeaderBand1: TppColumnHeaderBand;
    ppReport1DetailBand1: TppDetailBand;
    ppReport1Shape1: TppShape;
    ppReport1ColumnFooterBand1: TppColumnFooterBand;
    btnPreview: TButton;
    procedure btnPreviewClick(Sender: TObject);
  protected
    function GetReport: TppReport; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMailingLabels: TfrmMailingLabels;

implementation

{$R *.DFM}


{------------------------------------------------------------------------------}
{ TfrmMailingLabels.GetReport }

function TfrmMailingLabels.GetReport: TppReport;
begin
  Result := rbMailingLabels;

end; {function, GetReport}


{------------------------------------------------------------------------------}
{ TfrmMailingLabels.btnPreviewClick }

procedure TfrmMailingLabels.btnPreviewClick(Sender: TObject);
begin
  rbMailingLabels.Print;
  
end; {procedure, btnPreviewClick}

end.
