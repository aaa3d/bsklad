{******************************************}
{ }
{ FastReport v3.0 }
{ Report datasets selector }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxEditReportData;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, frxClass, CheckLst
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxReportDataForm = class(TForm)
    OKB:TButton;
    CancelB:TButton;
    DatasetsLB:TCheckListBox;
    procedure FormShow(Sender:TObject);
    procedure FormHide(Sender:TObject);
    procedure FormCreate(Sender:TObject);
  private
    procedure BuildDatasetsList;
    procedure CopyToReport;
  public
    Report:TfrxReport;
  end;

implementation

{$R *.DFM}

uses frxUtils, frxRes;

procedure TfrxReportDataForm.BuildDatasetsList;
var
  i:Integer;
  ds:TfrxDataSet;
  dsList:TStringList;
begin
  dsList:= TStringList.Create;

  if Report.EnabledDataSets.Count > 0 then
  begin
    for i:= 0 to Report.EnabledDataSets.Count-1 do
    begin
      ds:= Report.EnabledDataSets[i].DataSet;
      if ds<>nil then
        dsList.AddObject(ds.UserName, ds);
    end;
  end
  else
    frxGetDataSetList(dsList);

  dsList.Sort;

  for i:= 0 to dsList.Count-1 do
  begin
    ds:= TfrxDataSet(dsList.Objects[i]);
    DataSetsLB.Items.AddObject(ds.UserName, ds);
    if Report.Datasets.Find(ds)<>nil then
      DataSetsLB.Checked[DataSetsLB.Items.Count-1]:= True;
  end;

  dsList.Free;
end;

procedure TfrxReportDataForm.FormShow(Sender:TObject);
begin
  BuildDatasetsList;
end;

procedure TfrxReportDataForm.FormHide(Sender:TObject);
begin
  if ModalResult = mrOk then
    CopyToReport;
end;

procedure TfrxReportDataForm.CopyToReport;
var
  i:Integer;
begin
  Report.Datasets.Clear;
  for i:= 0 to DatasetsLB.Items.Count-1 do
    if DatasetsLB.Checked[i] then
      Report.DataSets.Add(TfrxDataSet(DatasetsLB.Items.Objects[i]));
end;

procedure TfrxReportDataForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

end.
