{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbFrmJIT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppDB, ppComm, ppCache, ppTxPipe, ppVar, ppBands, ppCtrls, ppPrnabl,
  ppClass, ppProd, ppReport, StdCtrls, Grids, ppDBJIT,
  rbClass, ppRelatv;


type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }

  TfrmPrintFromStringGrid = class(TrbReportForm)
    plCustomerTxt: TppTextPipeline;
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
    grCustomer: TStringGrid;
    btnPreview: TButton;
    plCustomer: TppJITPipeline;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    ppField12: TppField;
    ppField13: TppField;
    ppField14: TppField;
    ppField15: TppField;
    ppField16: TppField;
    procedure btnPreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function plCustomerGetDataSetName: String;
    procedure plCustomerOpenDataSet(Sender: TObject);
    procedure plCustomerCloseDataSet(Sender: TObject);
    function plCustomerCheckBOF: Boolean;
    function plCustomerCheckEOF: Boolean;
    procedure plCustomerGotoFirstRecord(Sender: TObject);
    procedure plCustomerGotoLastRecord(Sender: TObject);
    procedure plCustomerGotoBookmark(aBookmark: Integer);
    function plCustomerGetBookmark: Integer;
    procedure plCustomerTraverseBy(aIncrement: Integer);
    function plCustomerGetFieldAsString(aFieldName: String): String;
    function plCustomerGetFieldAsDouble(aFieldName: String): Double;
    function plCustomerGetFieldValue(aFieldName: String): Variant;

  private
    FRowIndex: Integer;

    function GetGridFieldValue(const aFieldName: String): String;

  protected
    function GetReport: TppReport; override;

  public
    { Public declarations }
  end;

  procedure PipeDataToGrid(aPipeline: TppDataPipeline; aGrid: TStringGrid);

var
  frmPrintFromStringGrid: TfrmPrintFromStringGrid;

implementation

{$R *.DFM}



{------------------------------------------------------------------------------}
{ PipeDataToGrid }

procedure PipeDataToGrid(aPipeline: TppDataPipeline; aGrid: TStringGrid);
var
  liRow: Integer;
  liRecordCount: Integer;
  liField: Integer;

begin

  if not aPipeline.Active then
    aPipeline.Open;

  liRecordCount := 0;
  aPipeline.First;

  {calc number of records in the pipe}
  while not aPipeline.EOF do
    begin
      Inc(liRecordCount);
      aPipeline.Next;

    end;

  {set row and column size for the string grid}
  aGrid.RowCount := liRecordCount+1;
  aGrid.ColCount := aPipeline.FieldCount+1;

  {load field names into the title row}
  for liField := 0 to aPipeline.FieldCount-1 do
    aGrid.Cells[liField+1, 0] := aPipeline.Fields[liField].FieldName;


  liRow := 1;
  aPipeline.First;

  {load the grid with data from the pipeline}
  while not aPipeline.EOF do
    begin

      for liField := 0 to aPipeline.FieldCount-1 do
        aGrid.Cells[liField+1, liRow] := aPipeline.Fields[liField].AsString;

      aGrid.Objects[0, liRow] := TObject(aPipeline.GetBookMark);

      aPipeline.Next;

      Inc(liRow);


    end;


end; {procedure, PipeDataToGrid}



{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.GetReport }

function TfrmPrintFromStringGrid.GetReport: TppReport;
begin
  Result := rbCustomerList;
end; {function, GetReport}


{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.GetGridFieldValue }

function TfrmPrintFromStringGrid.GetGridFieldValue(const aFieldName: String): String;
var
  liFieldIndex: Integer;
  lFieldList: TStrings;
begin

  lFieldList := grCustomer.Rows[0];

  liFieldIndex := lFieldList.IndexOf(aFieldName);

  if (liFieldIndex >=0) then
    Result := grCustomer.Cells[liFieldIndex, FRowIndex]
  else
    Result := '';

end; {function, GetGridFieldValue}


{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.btnPreviewClick }

procedure TfrmPrintFromStringGrid.btnPreviewClick(Sender: TObject);
begin
  rbCustomerList.Print;
  
end; {procedure, btnPreviewClick}


{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.FormCreate }

procedure TfrmPrintFromStringGrid.FormCreate(Sender: TObject);
begin

  plCustomerTxt.FileName := ExtractFilePath(ParamStr(0)) + 'Customer.txt';

  PipeDataToGrid(plCustomerTxt, grCustomer);

  FRowIndex := 0;

end; {procedure, FormCreate}


{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerGetDataSetName }

function TfrmPrintFromStringGrid.plCustomerGetDataSetName: String;
begin
  Result := 'Customer';

end; {function, plCustomerGetDataSetName}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerOpenDataSet }

procedure TfrmPrintFromStringGrid.plCustomerOpenDataSet(Sender: TObject);
begin
  FRowIndex := 1;

end; {procedure, plCustomerOpenDataSet}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerCloseDataSet }

procedure TfrmPrintFromStringGrid.plCustomerCloseDataSet(Sender: TObject);
begin
  FRowIndex := 0;

end;{procedure, plCustomerCloseDataSet}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerCheckBOF }

function TfrmPrintFromStringGrid.plCustomerCheckBOF: Boolean;
begin
  Result := (FRowIndex < 1);

end; {function, plCustomerCheckBOF}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerCheckEOF }

function TfrmPrintFromStringGrid.plCustomerCheckEOF: Boolean;
begin
  Result := (FRowIndex > grCustomer.RowCount);

end; {function, plCustomerCheckEOF}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerGotoFirstRecord }

procedure TfrmPrintFromStringGrid.plCustomerGotoFirstRecord(Sender: TObject);
begin
  FRowIndex := 1;

end; {procedure, plCustomerGotoFirstRecord}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerGotoLastRecord }

procedure TfrmPrintFromStringGrid.plCustomerGotoLastRecord(Sender: TObject);
begin
  FRowIndex := grCustomer.RowCount;

end; {procedure, plCustomerGotoLastRecord}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerGotoBookmark }

procedure TfrmPrintFromStringGrid.plCustomerGotoBookmark(aBookmark: Integer);
begin
   FRowIndex := aBookmark;

end; {function, plCustomerGotoBookmark}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerGetBookmark }

function TfrmPrintFromStringGrid.plCustomerGetBookmark: Integer;
begin
   Result := FRowIndex;

end; {function, plCustomerGetBookmark}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerTraverseBy }

procedure TfrmPrintFromStringGrid.plCustomerTraverseBy(aIncrement: Integer);
begin
  FRowIndex := FRowIndex + aIncrement;

end; {procedure, plCustomerTraverseBy}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerGetFieldAsString }

function TfrmPrintFromStringGrid.plCustomerGetFieldAsString(aFieldName: String): String;
begin
  Result := GetGridFieldValue(aFieldName);

end; {function, plCustomerGetFieldAsString}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerGetFieldAsDouble }

function TfrmPrintFromStringGrid.plCustomerGetFieldAsDouble(aFieldName: String): Double;
begin
  Result := StrToFloat(GetGridFieldValue(aFieldName));

end; {function, plCustomerGetFieldAsDouble}

{------------------------------------------------------------------------------}
{ TfrmPrintFromStringGrid.plCustomerGetFieldValue }

function TfrmPrintFromStringGrid.plCustomerGetFieldValue(aFieldName: String): Variant;
begin
  Result := GetGridFieldValue(aFieldName);

end; {function, plCustomerGetFieldValue}

end.
