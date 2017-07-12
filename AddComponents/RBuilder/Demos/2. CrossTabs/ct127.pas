{******************************************************************************}
{                                                                              }
{                      ReportBuilder CrossTab Demos                            }
{                                                                              }
{            Copyright (c) 1996, 2000 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit ct127;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppComm, ppProd, ppClass, ppReport, ppBands, ppRelatv, ppCache, ctRptFrm,
  daQClass, ppDB, ppDBPipe, ppDBBDE, daDataVw, daQuery, daDBBDE,
  ppModule, daDatMod, ppCTMain, ppStrtch, ppVar, ppPrnabl, ppCtrls,
  ppCTRend, ppCTCell, ppPrintr, ppDevice, ppUtils;

type

  TfrmCT127 = class(TctReportForm)
    ppReport1: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppCrossTab1: TppCrossTab;
    plOrders: TppChildBDEPipeline;
  private
  public
  published
    procedure CrossTabGetCaptionTextEvent(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
    procedure CrossTabGetValueTextEvent(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
    procedure CrossTabGetTotalValueTextEvent(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
    procedure CrossTabGetTotalCaptionTextEvent(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer; var aText: String);

  end;

var
  frmCT127: TfrmCT127;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmCT128.CrossTabGetCaptionTextEvent }

procedure TfrmCT127.CrossTabGetCaptionTextEvent(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
begin
  aText := aText + ' (C)';
end; {procedure, CrossTabGetCaptionTextEvent}

{------------------------------------------------------------------------------}
{ TfrmCT128.CrossTabGetValueTextEvent }

procedure TfrmCT127.CrossTabGetValueTextEvent(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
begin
  aText := aText + ' (V)';
end; {procedure, CrossTabGetValueTextEvent}

{------------------------------------------------------------------------------}
{ TfrmCT128.CrossTabGetTotalValueTextEvent }

procedure TfrmCT127.CrossTabGetTotalValueTextEvent(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer; const aDisplayFormat: String; aValue: Variant; var aText: String);
begin
  aText := aText + ' (TV)';
end; {procedure, CrossTabGetTotalValueTextEvent}

{------------------------------------------------------------------------------}
{ TfrmCT128.CrossTabGetTotalCaptionTextEvent }

procedure TfrmCT127.CrossTabGetTotalCaptionTextEvent(Sender: TObject; aElement: TppElement; aColumn, aRow: Integer; var aText: String);
begin
  aText := aText + ' (TC)';
end; {procedure, CrossTabGetTotalCaptionTextEvent}


end.
