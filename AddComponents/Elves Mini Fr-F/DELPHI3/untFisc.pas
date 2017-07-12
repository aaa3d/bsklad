unit untFisc;
{------------------------------------------------------------------------------}
{ (C) ÍÒÖ "Øòðèõ-Ì". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, untObj;

type
  TfrmFiscal = class(TForm)
    Label36: TLabel;
    Label35: TLabel;
    Label34: TLabel;
    Label28: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label24: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    edtEndYear: TEdit;
    edtEndMonth: TEdit;
    edtEndDay: TEdit;
    edtYear: TEdit;
    edtMonth: TEdit;
    edtDay: TEdit;
    edtEndSession: TEdit;
    edtSession: TEdit;
    edtINN: TEdit;
    edtMachineNumber: TEdit;
    edtSerialNumber: TEdit;
    btnFiscalization: TButton;
    btnSetSerialNumber: TButton;
    btnGetRange: TButton;
    Bevel1: TBevel;
    btnClose: TButton;
    Caption1: TLabel;
    Caption2: TLabel;
    Shape1: TShape;
    edtResultCode: TEdit;
    edtBadParam: TEdit;
    cbReportType: TComboBox;
    Label1: TLabel;
    btnReport: TButton;
    edtPassword: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiscalizationClick(Sender: TObject);
    procedure btnSetSerialNumberClick(Sender: TObject);
    procedure btnGetRangeClick(Sender: TObject);
    procedure edtSerialNumberExit(Sender: TObject);
    procedure edtMachineNumberExit(Sender: TObject);
    procedure edtINNExit(Sender: TObject);
    procedure edtSessionExit(Sender: TObject);
    procedure edtEndSessionExit(Sender: TObject);
    procedure edtDayExit(Sender: TObject);
    procedure edtMonthExit(Sender: TObject);
    procedure edtYearExit(Sender: TObject);
    procedure edtEndDayExit(Sender: TObject);
    procedure edtEndMonthExit(Sender: TObject);
    procedure edtEndYearExit(Sender: TObject);
    procedure cbReportTypeChange(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure edtPasswordExit(Sender: TObject);
  private
    fProcessing: boolean;
    procedure EnableButtons;
    procedure DisableButtons;
    procedure LoadProperties;
  end;

var
  frmFiscal: TfrmFiscal;

implementation
{$R *.DFM}

procedure TfrmFiscal.EnableButtons;
var
  i: integer;
begin
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= TRUE;
end;

procedure TfrmFiscal.DisableButtons;
var
  i: integer;
begin
  edtResultCode.Text:= '';
  edtBadParam.Text:= '';
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= FALSE;
end;

procedure TfrmFiscal.FormCreate(Sender: TObject);
begin
  Caption:= AX.DeviceDescription+Caption;
  fProcessing:= TRUE;
  edtSerialNumberExit(nil);
  edtMachineNumberExit(nil);
  edtINNExit(nil);
  edtEndSessionExit(nil);
  edtEndDayExit(nil);
  edtEndMonthExit(nil);
  edtEndYearExit(nil);
  fProcessing:= FALSE;
  SendMessage(cbReportType.handle, CB_SETDROPPEDWIDTH , 130, 0);
end;

procedure TfrmFiscal.FormShow(Sender: TObject);
begin
  LoadProperties;
  btnClose.SetFocus;
end;

procedure TfrmFiscal.LoadProperties;
begin
  if not(fProcessing) then
    begin
    fProcessing:= TRUE;
    edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
    edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
    edtPassword.Text:= AX.Password;
    edtSerialNumber.Text:= AX.SerialNumber;
    edtMachineNumber.Text:= AX.MachineNumber;
    edtINN.Text:= AX.INN;
    edtSession.Text:= IntToStr(AX.Session);
    edtEndSession.Text:= IntToStr(AX.EndSession);
    edtDay.Text:= IntToStr(AX.Day);
    edtMonth.Text:= IntToStr(AX.Month);
    edtYear.Text:= IntToStr(AX.Year);
    edtEndDay.Text:= IntToStr(AX.EndDay);
    edtEndMonth.Text:= IntToStr(AX.EndMonth);
    edtEndYear.Text:= IntToStr(AX.EndYear);
    case AX.ReportType of
      4..6:
        cbReportType.ItemIndex:= AX.ReportType-3;
      else
        begin
        cbReportType.ItemIndex:= 0;
        AX.ReportType:= 3;
        end;
    end;
    fProcessing:= FALSE;
    end;
end;

procedure TfrmFiscal.btnFiscalizationClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.Fiscalization;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmFiscal.btnSetSerialNumberClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SetSerialNumber;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmFiscal.btnGetRangeClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.GetRange;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmFiscal.edtSerialNumberExit(Sender: TObject);
begin
  AX.SerialNumber:= edtSerialNumber.Text;
  LoadProperties;
end;

procedure TfrmFiscal.edtMachineNumberExit(Sender: TObject);
begin
  AX.MachineNumber:= edtMachineNumber.Text;
  LoadProperties;
end;

procedure TfrmFiscal.edtINNExit(Sender: TObject);
begin
  AX.INN:= edtINN.Text;
  LoadProperties;
end;

procedure TfrmFiscal.edtSessionExit(Sender: TObject);
begin
  try
    AX.Session:= StrToInt(edtSession.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmFiscal.edtEndSessionExit(Sender: TObject);
begin
  try
    AX.EndSession:= StrToInt(edtEndSession.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmFiscal.edtDayExit(Sender: TObject);
begin
  try
    AX.Day:= StrToInt(edtDay.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmFiscal.edtMonthExit(Sender: TObject);
begin
  try
    AX.Month:= StrToInt(edtMonth.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmFiscal.edtYearExit(Sender: TObject);
begin
  try
    AX.Year:= StrToInt(edtYear.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmFiscal.edtEndDayExit(Sender: TObject);
begin
  try
    AX.EndDay:= StrToInt(edtEndDay.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmFiscal.edtEndMonthExit(Sender: TObject);
begin
  try
    AX.EndMonth:= StrToInt(edtEndMonth.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmFiscal.edtEndYearExit(Sender: TObject);
begin
  try
    AX.EndYear:= StrToInt(edtEndYear.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmFiscal.cbReportTypeChange(Sender: TObject);
begin
  AX.ReportType:= cbReportType.ItemIndex+3;
end;

procedure TfrmFiscal.btnReportClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.Report;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmFiscal.edtPasswordExit(Sender: TObject);
begin
  try
    AX.Password:= edtPassword.Text;
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

end.
