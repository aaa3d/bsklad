{******************************************************************************}
{                                                                              }
{                      ReportBuilder CrossTab Demos                            }
{                                                                              }
{            Copyright (c) 1996, 2000 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit ct126;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppComm, ppProd, ppClass, ppReport, ppBands, ppRelatv, ppCache, ctRptFrm,
  daQClass, ppDB, ppDBPipe, ppDBBDE, daDataVw, daQuery, daDBBDE,
  ppModule, daDatMod, ppCTMain, ppStrtch, ppVar, ppPrnabl, ppCtrls;

type
  TfrmCT126 = class(TctReportForm)
    ppReport1: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppCrossTab1: TppCrossTab;
    plOrders: TppChildBDEPipeline;
    procedure FormCreate(Sender: TObject);
  private
    procedure ppCrossTab1FormatCell(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer);
  public
    { Public declarations }
  end;

var
  frmCT126: TfrmCT126;

implementation

{$R *.DFM}

procedure TfrmCT126.FormCreate(Sender: TObject);
begin
  ppCrossTab1.OnFormatCell := ppCrossTab1FormatCell;
end;

procedure TfrmCT126.ppCrossTab1FormatCell(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer);
begin
  if (aRow > 0) and (aColumn > 0) and ((aColumn mod 2) = 0) then
    aElement.Color := clSilver
  else
    aElement.Color := clWhite;
end;


end.
