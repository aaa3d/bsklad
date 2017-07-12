{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daDatPrv;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DB, DBGrids, StdCtrls, DBCtrls, ExtCtrls, Buttons,
  ppTypes, ppClass, ppDB, ppUtils, daDataVw;

type

  TdaPreviewDataDialog = class(TdaCustomPreviewDataDialog)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnOK: TButton;
    edtRecordNo: TEdit;
    lblRecord: TLabel;
    lblRecordCount: TLabel;
    spbFirst: TSpeedButton;
    spbPrior: TSpeedButton;
    spbNext: TSpeedButton;
    spbLast: TSpeedButton;
    procedure spbFirstClick(Sender: TObject);
    procedure spbPriorClick(Sender: TObject);
    procedure spbNextClick(Sender: TObject);
    procedure spbLastClick(Sender: TObject);
    procedure edtRecordNoExit(Sender: TObject);

  private
    FRecordCount: Longint;
    FCurrentRecord: Longint;
    FDataSet: TDataSet;

    function GetDataSource: TDataSource;
    procedure SetDataSource(aDataSource: TDataSource);
    procedure MoveBy(aIncrement: Longint);

  protected
    {override from ancestor}
    procedure SetDataView(aDataView: TdaCustomDataView); override;
    procedure LanguageChanged; override;

  public

    property DataSource: TDataSource read GetDataSource write SetDataSource;

  end;

var
  daPreviewDataDialog: TdaPreviewDataDialog;

implementation

{$R *.DFM}


{------------------------------------------------------------------------------}
{ TdaPreviewDataDialog.SetDataView }

procedure TdaPreviewDataDialog.SetDataView(aDataView: TdaCustomDataView);
var
  lDataSource: TDataSource;
begin


  inherited SetDataView(aDataView);

  lDataSource := nil;

  if (aDataView <> nil) then
    begin
      aDataView.Active := True;
      if (aDataView.DataPipelineCount > 0) then

        {check whether DataPipeline has a DataSource property}
        if ppCheckPropInfo(aDataView.DataPipelines[0],  'DataSource') then
          lDataSource := TDataSource(ppGetOrdPropValue(aDataView.DataPipelines[0], 'DataSource'));

    {  if DataView.DataPIpelineCount > 1 then
        {check whether DataPipeline has a DataSource property}
     {   if ppCheckPropInfo(aDataView.DataPipelines[1],  'DataSource') then
             DBGrid2.DataSource := TDataSource(ppGetOrdPropValue(aDataView.DataPipelines[1], 'DataSource'));
      }
    end;


  SetDataSource(lDataSource);

  LanguageChanged;

  if aDataView = nil then Exit;

  Caption := ppLoadStr(808) + ' - ' + DataView.Description; {Preview Data}


end; {procedure, SetDataView}

{------------------------------------------------------------------------------}
{ TdaPreviewDataDialog.LanguageChanged; }

procedure TdaPreviewDataDialog.LanguageChanged;
begin

  if DataView <> nil then
    Caption := ppLoadStr(808) + ' - ' + DataView.Description {Preview Data}
  else
    Caption := ppLoadStr(808); {Preview Data}


  btnOK.Caption := ppLoadStr(ppMsgOK); {OK}

  lblRecord.Caption := ppLoadStr(812); {Record}

end; {procedure, LanguageChanged;}

{------------------------------------------------------------------------------}
{ TdaPreviewDataDialog.SetDataSource }

procedure TdaPreviewDataDialog.SetDataSource(aDataSource: TDataSource);
begin
  if (aDataSource <> nil) then
    FDataSet := aDataSource.DataSet
  else
    FDataSet := nil;

  if FDataSet <> nil then
    FRecordCount := FDataSet.RecordCount
  else
    FRecordCount := 0;

  if (FRecordCount = -1) then
    lblRecordCount.Caption := ''
  else
    lblRecordCount.Caption := ppLoadStr(800) + ' ' + IntToStr(FRecordCount); {of}

  FCurrentRecord := 0;
  MoveBy(1);

  {set data-aware control datasources}
  DBGrid1.DataSource := aDataSource;

end;

{------------------------------------------------------------------------------}
{ TdaPreviewDataDialog.GetDataSource }

function TdaPreviewDataDialog.GetDataSource: TDataSource;
begin
  Result := DBGrid1.DataSource;
end;

{------------------------------------------------------------------------------}
{ TdaPreviewDataDialog.MoveBy }

procedure TdaPreviewDataDialog.MoveBy(aIncrement: Longint);
begin

  if (FDataSet = nil) then Exit;

  Inc(FCurrentRecord, aIncrement);

  if (FCurrentRecord <= 1) then
    begin
      FCurrentRecord := 1;
      FDataSet.First;
    end

  else if (FCurrentRecord >= FRecordCount) then
    begin
      FCurrentRecord := FRecordCount;
      FDataSet.Last;
    end

  else
    FDataSet.MoveBy(aIncrement);

  edtRecordNo.Text := IntToStr(FCurrentRecord);

end;

{------------------------------------------------------------------------------}
{ TdaPreviewDataDialog.FirstClick }

procedure TdaPreviewDataDialog.spbFirstClick(Sender: TObject);
begin
  MoveBy((FRecordCount + 1) * -1);
end;

{------------------------------------------------------------------------------}
{ TdaPreviewDataDialog.PriorClick }

procedure TdaPreviewDataDialog.spbPriorClick(Sender: TObject);
begin
  MoveBy(-1);
end;

{------------------------------------------------------------------------------}
{ TdaPreviewDataDialog.NextClick }

procedure TdaPreviewDataDialog.spbNextClick(Sender: TObject);
begin
  MoveBy(1);
end;

{------------------------------------------------------------------------------}
{ TdaPreviewDataDialog.LastClick }

procedure TdaPreviewDataDialog.spbLastClick(Sender: TObject);
begin
  MoveBy(FRecordCount + 1);
end;


{------------------------------------------------------------------------------}
{ TdaPreviewDataDialog.RecordNoExit }

procedure TdaPreviewDataDialog.edtRecordNoExit(Sender: TObject);
var
  liNewRecord: Longint;
begin
  try
    liNewRecord := StrToInt(edtRecordNo.Text);
    MoveBy(liNewRecord - FCurrentRecord);
  except
    {message: Invalid Number.}
    ShowMessage(ppLoadStr(332));
    edtRecordNo.Text := IntToStr(FCurrentRecord);
  end; {try, except}

end;

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClass(TdaPreviewDataDialog);

finalization

  UnRegisterClass(TdaPreviewDataDialog);

end.
