unit untPLU;
{------------------------------------------------------------------------------}
{ (C) НТЦ "Штрих-М". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  untObj, StdCtrls, ExtCtrls, Grids;

type
  TfrmPLU = class(TForm)
    btnClose: TButton;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    edtResultCode: TEdit;
    edtBadParam: TEdit;
    chkCacheReport: TCheckBox;
    chkShowProgress: TCheckBox;
    Bevel1: TBevel;
    Label3: TLabel;
    edtFirstRecord: TEdit;
    Label4: TLabel;
    edtLastRecord: TEdit;
    btnReport: TButton;
    btnClear: TButton;
    btnInsert: TButton;
    btnAdd: TButton;
    gridMain: TStringGrid;
    btnDelete: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure edtFirstRecordExit(Sender: TObject);
    procedure edtLastRecordExit(Sender: TObject);
    procedure chkCacheReportClick(Sender: TObject);
    procedure chkShowProgressClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure gridMainSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure gridMainExit(Sender: TObject);
  private
    fRow: integer;
    fCol: integer;
  private
    procedure DisableButtons;
    procedure EnableButtons;
    procedure LoadProperties;
    procedure FillRow(aRow: integer);
    procedure SetRow(aRow: integer);
  end;

var
  frmPLU: TfrmPLU;

implementation
{$R *.DFM}

procedure TfrmPLU.FormCreate(Sender: TObject);
begin
  Caption:= AX.DeviceDescription+Caption;
  gridMain.Cells[0,0]:= 'Запись';
  gridMain.Cells[1,0]:= 'Название';
  gridMain.Cells[2,0]:= 'Цена';
  gridMain.Cells[3,0]:= 'Секция';
  gridMain.Cells[4,0]:= 'Налог';
  gridMain.Cells[5,0]:= 'Штрих-код';
  gridMain.Cells[6,0]:= 'Количество';
end;

procedure TfrmPLU.FillRow(aRow: integer);
begin
  gridMain.Cells[0,aRow]:= IntToStr(AX.PLUNumber);
  gridMain.Cells[1,aRow]:= AX.Name;
  gridMain.Cells[2,aRow]:= FloatToStr(AX.Price);
  gridMain.Cells[3,aRow]:= IntToStr(AX.Department);
  gridMain.Cells[4,aRow]:= IntToStr(AX.Tax);
  gridMain.Cells[5,aRow]:= AX.Barcode;
  gridMain.Cells[6,aRow]:= FloatToStr(AX.Quantity);
end;

procedure TfrmPLU.SetRow(aRow: integer);

  procedure CheckRes;
  begin
    if AX.ResultCode<>0 then raise Exception.Create('');
  end;
var
  tmpString: string;
begin
  AX.PLUNumber:= StrToInt(gridMain.Cells[0,aRow]); CheckRes;
  AX.Name:= gridMain.Cells[1,aRow]; CheckRes;
  tmpString:= AX.Name;
  if length(tmpString)>10 then
    begin
    SetLength(tmpString,10);
    AX.Name:= tmpString;
    end;
  AX.Price:= StrToFloat(gridMain.Cells[2,aRow]); CheckRes;
  AX.Department:= StrToInt(gridMain.Cells[3,aRow]); CheckRes;
  AX.Tax:= StrToInt(gridMain.Cells[4,aRow]); CheckRes;
  AX.Barcode:= gridMain.Cells[5,aRow]; CheckRes;
  AX.Quantity:= StrToFloat(gridMain.Cells[6,aRow]); CheckRes;
end;

procedure TfrmPLU.FormShow(Sender: TObject);
var
  tmpString: string;
begin
  LoadProperties;
  tmpString:= AX.Name;
  if length(tmpString)>10 then
    begin
    SetLength(tmpString, 10);
    AX.Name:= tmpString;
    end;
  btnClearClick(nil);
  btnClose.SetFocus;
end;

procedure TfrmPLU.DisableButtons;
var
  i: integer;
begin
  edtResultCode.Text:= '';
  edtBadParam.Text:= '';
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= FALSE;
end;

procedure TfrmPLU.EnableButtons;
var
  i: integer;
begin
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= TRUE;
end;

procedure TfrmPLU.LoadProperties;
begin
  edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
  edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
  chkCacheReport.Checked:= AX.CacheReport;
  chkShowProgress.Checked:= AX.ShowProgress;
  edtFirstRecord.Text:= IntToStr(AX.FirstRecord);
  edtLastRecord.Text:= IntToStr(AX.LastRecord);
end;

procedure TfrmPLU.btnInsertClick(Sender: TObject);
begin
  gridMain.RowCount:= gridMain.RowCount+1;
  FillRow(gridMain.RowCount-1);
end;

procedure TfrmPLU.btnClearClick(Sender: TObject);
begin
  gridMain.RowCount:= 2;
  fRow:= -1;
  FillRow(1);
end;

procedure TfrmPLU.btnDeleteClick(Sender: TObject);
begin
  if gridMain.RowCount>2 then
    gridMain.RowCount:= gridMain.RowCount-1;
end;

procedure TfrmPLU.edtFirstRecordExit(Sender: TObject);
begin
  try
    AX.FirstRecord:= StrToInt(edtFirstRecord.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmPLU.edtLastRecordExit(Sender: TObject);
begin
  try
    AX.LastRecord:= StrToInt(edtLastRecord.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmPLU.chkCacheReportClick(Sender: TObject);
begin
  AX.CacheReport:= chkCacheReport.Checked;
  LoadProperties;
end;

procedure TfrmPLU.chkShowProgressClick(Sender: TObject);
begin
  AX.ShowProgress:= chkShowProgress.Checked;
  LoadProperties;
end;

procedure TfrmPLU.btnReportClick(Sender: TObject);
var
  fAdded: boolean;
begin
  DisableButtons;
  try
    AX.ReportType:= 16;
    if AX.BeginReport=0 then
      begin
      btnClearClick(nil);
      fAdded:= FALSE;
        try
          while AX.GetRecord=0 do
            begin
            if (fAdded) then
              gridMain.RowCount:= gridMain.RowCount+1;
            Application.ProcessMessages;
            fAdded:= TRUE;
            FillRow(gridMain.RowCount-1);
            end;
        finally
          LoadProperties;
          AX.EndReport;
        end;
      end
    else
      LoadProperties;
  finally
    EnableButtons;
  end;
end;

procedure TfrmPLU.btnAddClick(Sender: TObject);
var
  i: integer;
begin
  DisableButtons;
  try
    AX.RecordType:= 0;
    if AX.BeginAdd=0 then
      begin
      try
        for i:= 1 to gridMain.RowCount-1 do
          begin
          SetRow(i);
          if AX.SetRecord<>0 then
            raise Exception.Create('');
          end;
        AX.EndAdd;
        LoadProperties;
      except
        LoadProperties;
        AX.ClearOutput;
      end;
      end
    else
      LoadProperties;
  finally
    EnableButtons;
  end;
end;

procedure TfrmPLU.gridMainSelectCell(Sender: TObject; Col, Row: Integer;
  var CanSelect: Boolean);
begin
  if fRow<>-1 then
    begin
    try
      SetRow(fRow);
    except
      {no exception processing needed}
    end;
    FillRow(fRow);
    end;
  fCol:= Col;
  fRow:= Row;
  CanSelect:= TRUE;
end;

procedure TfrmPLU.gridMainExit(Sender: TObject);
begin
  if fRow<>-1 then
    begin
    try
      SetRow(fRow);
    except
      {no exception processing needed}
    end;
    FillRow(fRow);
    end;
end;

end.
