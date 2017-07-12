{******************************************************************************}
{                                                                              }
{                      ReportBuilder CrossTab Demos                            }
{                                                                              }
{            Copyright (c) 1996, 2000 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit ct123;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppComm, ppProd, ppClass, ppReport, ppBands, ppRelatv, ppCache, ctRptFrm,
  daQClass, ppDB, ppDBPipe, ppDBBDE, daDataVw, daQuery, daDBBDE,
  ppModule, daDatMod, ppCTMain, ppStrtch, ppVar, ppPrnabl, ppCtrls;

type
  TfrmCT123 = class(TctReportForm)
    ppReport1: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppCrossTab1: TppCrossTab;
    plOrders: TppChildBDEPipeline;
    procedure ppCrossTab1GetDimensionValue(Sender: TObject;
      aDimension: TppDimension; var aValue: Variant; var aSkip: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCT123: TfrmCT123;

implementation

{$R *.DFM}

procedure TfrmCT123.ppCrossTab1GetDimensionValue(Sender: TObject; aDimension: TppDimension; var aValue: Variant; var aSkip: Boolean);
begin
  if (aDimension.FieldName <> 'State') then Exit;
  
  if (aValue <> Null) then
    aValue := Uppercase(Copy(aValue, 1, 1))
  else
    aValue := '';
end;

end.
