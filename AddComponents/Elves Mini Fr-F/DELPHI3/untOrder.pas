unit untOrder;
{------------------------------------------------------------------------------}
{ (C) НТЦ "Штрих-М". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  untObj, StdCtrls, ExtCtrls, Grids;

type
  TfrmOrder = class(TForm)
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
    fCol: integer;
    fRow: integer;
  private
    procedure DisableButtons;
    procedure EnableButtons;
    procedure LoadProperties;
    procedure FillRow(aRow: integer);
    procedure SetRow(aRow: integer);
  end;

var
  frmOrder: TfrmOrder;
  TECH_TEXT: string;

implementation
{$R *.DFM}

procedure TfrmOrder.FormCreate(Sender: TObject);
begin
  Caption:= AX.DeviceDescription+Caption;
  gridMain.Cells[0,0]:= 'Запись';
  gridMain.Cells[1,0]:= 'Номер';
  gridMain.Cells[2,0]:= 'Сумма';
  gridMain.Cells[3,0]:= 'Чек';
  gridMain.Cells[4,0]:= 'День';
  gridMain.Cells[5,0]:= 'Месяц';
  gridMain.Cells[6,0]:= 'Год';
  gridMain.Cells[7,0]:= 'Час';
  gridMain.Cells[8,0]:= 'Минута';
  gridMain.Cells[9,0]:= 'Тип оплаты';
end;

procedure TfrmOrder.FillRow(aRow: integer);
begin
  gridMain.Cells[0,aRow]:= IntToStr(AX.OrderNumber);
  gridMain.Cells[1,aRow]:= AX.OrderCode;
  gridMain.Cells[2,aRow]:= FloatToStr(AX.Price);
  gridMain.Cells[3,aRow]:= IntToStr(AX.CheckNumber);
  gridMain.Cells[4,aRow]:= IntToStr(AX.Day);
  gridMain.Cells[5,aRow]:= IntToStr(AX.Month);
  gridMain.Cells[6,aRow]:= IntToStr(AX.Year);
  gridMain.Cells[7,aRow]:= IntToStr(AX.Hour);
  gridMain.Cells[8,aRow]:= IntToStr(AX.Minute);
  gridMain.Cells[9,aRow]:= IntToStr(AX.TypeClose);
end;

procedure TfrmOrder.SetRow(aRow: integer);

  procedure CheckRes;
  begin
    if AX.ResultCode<>0 then raise Exception.Create('');
  end;

begin
  AX.OrderNumber:= StrToInt(gridMain.Cells[0,aRow]); CheckRes;
  AX.OrderCode:= gridMain.Cells[1,aRow]; CheckRes;
  AX.Price:= StrToFloat(gridMain.Cells[2,aRow]); CheckRes;
  AX.CheckNumber:= StrToInt(gridMain.Cells[3,aRow]); CheckRes;
  AX.Day:= StrToInt(gridMain.Cells[4,aRow]); CheckRes;
  AX.Month:= StrToInt(gridMain.Cells[5,aRow]); CheckRes;
  AX.Year:= StrToInt(gridMain.Cells[6,aRow]); CheckRes;
  AX.Hour:= StrToInt(gridMain.Cells[7,aRow]); CheckRes;
  AX.Minute:= StrToInt(gridMain.Cells[8,aRow]); CheckRes;
  AX.TypeClose:= StrToInt(gridMain.Cells[9,aRow]); CheckRes;
end;

procedure TfrmOrder.FormShow(Sender: TObject);
begin
  LoadProperties;
  btnClearClick(nil);
  btnClose.SetFocus;
end;

procedure TfrmOrder.DisableButtons;
var
  i: integer;
begin
  edtResultCode.Text:= '';
  edtBadParam.Text:= '';
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= FALSE;
end;

procedure TfrmOrder.EnableButtons;
var
  i: integer;
begin
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= TRUE;
end;

procedure TfrmOrder.LoadProperties;
begin
  edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
  edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
  chkCacheReport.Checked:= AX.CacheReport;
  chkShowProgress.Checked:= AX.ShowProgress;
  edtFirstRecord.Text:= IntToStr(AX.FirstRecord);
  edtLastRecord.Text:= IntToStr(AX.LastRecord);
end;

procedure TfrmOrder.btnInsertClick(Sender: TObject);
begin
  gridMain.RowCount:= gridMain.RowCount+1;
  FillRow(gridMain.RowCount-1);
end;

procedure TfrmOrder.btnClearClick(Sender: TObject);
begin
  gridMain.RowCount:= 2;
  fRow:= -1;
  FillRow(1);
end;

procedure TfrmOrder.btnDeleteClick(Sender: TObject);
begin
  if gridMain.RowCount>2 then
    gridMain.RowCount:= gridMain.RowCount-1;
end;

procedure TfrmOrder.edtFirstRecordExit(Sender: TObject);
begin
  try
    AX.FirstRecord:= StrToInt(edtFirstRecord.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmOrder.edtLastRecordExit(Sender: TObject);
begin
  try
    AX.LastRecord:= StrToInt(edtLastRecord.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmOrder.chkCacheReportClick(Sender: TObject);
begin
  AX.CacheReport:= chkCacheReport.Checked;
  LoadProperties;
end;

procedure TfrmOrder.chkShowProgressClick(Sender: TObject);
begin
  AX.ShowProgress:= chkShowProgress.Checked;
  LoadProperties;
end;

procedure TfrmOrder.btnReportClick(Sender: TObject);
var
  fAdded: boolean;
begin
  DisableButtons;
  try
    AX.ReportType:= 17;
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

procedure TfrmOrder.btnAddClick(Sender: TObject);
var
  i: integer;
begin
  DisableButtons;
  try
    AX.RecordType:= 1;
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

procedure TfrmOrder.gridMainSelectCell(Sender: TObject; Col, Row: Integer;
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

procedure TfrmOrder.gridMainExit(Sender: TObject);
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
