{******************************************************************************}
{                                                                              }
{                      ReportBuilder CrossTab Demos                            }
{                                                                              }
{            Copyright (c) 1996, 2000 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit ct121;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppComm, ppProd, ppClass, ppReport, ppBands, ppRelatv, ppCache, ctRptFrm,
  daQClass, ppDB, ppDBPipe, ppDBBDE, daDataVw, daQuery, daDBBDE,
  ppModule, daDatMod, ppCTMain, ppStrtch, ppVar, ppPrnabl, ppCtrls;

type
  TfrmCT121 = class(TctReportForm)
    ppReport1: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppCrossTab1: TppCrossTab;
    plOrders: TppChildBDEPipeline;
    procedure ppCrossTab1TraverseRecord(Sender: TObject;
      aDataPipeline: TppDataPipeline; var aSkipRecord: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCT121: TfrmCT121;

implementation

{$R *.DFM}

procedure TfrmCT121.ppCrossTab1TraverseRecord(Sender: TObject; aDataPipeline: TppDataPipeline; var aSkipRecord: Boolean);
begin
  if (aDataPipeline['State'] = '') or (aDataPipeline['State'] = null) then
    aSkipRecord := True;
end;

end.
