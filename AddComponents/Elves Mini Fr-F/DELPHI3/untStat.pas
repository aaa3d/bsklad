unit untStat;
{------------------------------------------------------------------------------}
{ (C) ��� "�����-�". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, untObj;

type
  TfrmStatus = class(TForm)
    Report: TMemo;
    Caption1: TLabel;
    edtResultCode: TEdit;
    Caption2: TLabel;
    edtBadParam: TEdit;
    btnGetStatus: TButton;
    btnClose: TButton;
    Shape1: TShape;
    Bevel1: TBevel;
    btnGetLastError: TButton;
    btnGetSumm: TButton;
    btnGetDeviceMetrics: TButton;
    btnGetSupportedMode: TButton;
    btnGetLastSummary: TButton;
    btnGetCurrentMode: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnGetStatusClick(Sender: TObject);
    procedure btnGetLastErrorClick(Sender: TObject);
    procedure btnGetSummClick(Sender: TObject);
    procedure btnGetDeviceMetricsClick(Sender: TObject);
    procedure btnGetSupportedModeClick(Sender: TObject);
    procedure btnGetLastSummaryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnGetCurrentModeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure EnableButtons;
    procedure DisableButtons;
    procedure LoadProperties;
  end;

var
  frmStatus: TfrmStatus;

implementation
{$R *.DFM}

procedure TfrmStatus.EnableButtons;
var
  i: integer;
begin
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= TRUE;
end;

procedure TfrmStatus.DisableButtons;
var
  i: integer;
begin
  edtResultCode.Text:= '';
  edtBadParam.Text:= '';
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= FALSE;
end;

procedure TfrmStatus.LoadProperties;
begin
  edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
  edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
end;

procedure TfrmStatus.FormShow(Sender: TObject);
begin
  Report.Lines.Clear;
  btnClose.SetFocus;
  LoadProperties;
end;

procedure TfrmStatus.btnGetStatusClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if AX.GetStatus=0 then
      begin
      Report.Lines.Add('������: '+IntToStr(AX.Operator));
      Report.Lines.Add('����� ��� � ����: '+IntToStr(AX.LogicalNumber));
      if AX.Fiscal then
        Report.Lines.Add('����� ���������������') else
        Report.Lines.Add('����� �� ���������������');
      Report.Lines.Add('������� �����: '+IntToStr(AX.Hour)+':'+IntToStr(AX.Minute)+':'+IntToStr(AX.Second));
      Report.Lines.Add('������� ����: '+IntToStr(AX.Day)+'/'+IntToStr(AX.Month)+'/'+IntToStr(AX.Year));
      Report.Lines.Add('��������� �����: '+AX.SerialNumber);
      Report.Lines.Add('������ ���: '+AX.ROMVersion);
      case AX.Mode of
        0: Report.Lines.Add('������� �����: ����� ������');
        1: Report.Lines.Add('������� �����: ����� �����������');
        2: Report.Lines.Add('������� �����: ����� ������� ��� �������');
        3: Report.Lines.Add('������� �����: ����� ������� � ��������');
        4: Report.Lines.Add('������� �����: ����� ����������������');
        5: Report.Lines.Add('������� �����: ����� ���������� ����������');
        7: Report.Lines.Add('������� �����: ��������������');
        else Report.Lines.Add('������� �����: ��� '+IntToStr(AX.Mode));
      end;
      if string(AX.ROMVersion)[1]='2' then
        begin
        case (10*(AX.Mode)+AX.AdvancedMode) of
          0: Report.Lines.Add('����������� �����: �����');
          10: Report.Lines.Add('����������� �����: �������� �������');
          11: Report.Lines.Add('����������� �����: ���� ������');
          12: Report.Lines.Add('����������� �����: �������� ����� ������ ������');
          20: Report.Lines.Add('����������� �����: �������� �������');
          21: Report.Lines.Add('����������� �����: ���� ������');
          22: Report.Lines.Add('����������� �����: ���� ������ X-������');
          30: Report.Lines.Add('����������� �����: �������� �������');
          31: Report.Lines.Add('����������� �����: ���� ������');
          32: Report.Lines.Add('����������� �����: ���� ������ Z-������');
          33: Report.Lines.Add('����������� �����: �������� ������������� �������');
          34: Report.Lines.Add('����������� �����: ���� ���� � ����������');
          35: Report.Lines.Add('����������� �����: �������� ������������� ������ �������');
          36: Report.Lines.Add('����������� �����: ���� ����� �������');
          37: Report.Lines.Add('����������� �����: ���� ��������� ����� � ����������');
          40: Report.Lines.Add('����������� �����: �������� �������');
          41: Report.Lines.Add('����������� �����: ���� ������');
          50: Report.Lines.Add('����������� �����: �������� �������');
          51: Report.Lines.Add('����������� �����: ���� ������');
          52: Report.Lines.Add('����������� �����: ������ ������');
          53: Report.Lines.Add('����������� �����: �������� ����� ������');
          54: Report.Lines.Add('����������� �����: ������������� ����� � ����� ���������� ����������');
          71: Report.Lines.Add('����������� �����: ���� ��������� ������');
          72: Report.Lines.Add('����������� �����: ����������� ������');
          73: Report.Lines.Add('����������� �����: ����� ����� ������� � ����������');
          74: Report.Lines.Add('����������� �����: ����� ������');
          75: Report.Lines.Add('����������� �����: ���� ���� ����� ������ ����');
          76: Report.Lines.Add('����������� �����: ���� ������� ����� ������ ����');
          77: Report.Lines.Add('����������� �����: ��������� ������������� ���');
          78: Report.Lines.Add('����������� �����: �������� ������������� ��������� ������');
          else Report.Lines.Add('����������� �����: ��� '+IntToStr(AX.AdvancedMode));
          end;
        Report.Lines.Add('���������� �� �����: '+IntToStr(AX.SlotNumber));
        if AX.DrawerOpened then
          Report.Lines.Add('���� ������')
        else
          Report.Lines.Add('���� ������');
        if AX.SessionOpened then
          Report.Lines.Add('����� �������')
        else
          Report.Lines.Add('����� �������');
        end;
      case AX.Model of
        0: Report.Lines.Add('������: �����-�����-�');
        1: Report.Lines.Add('������: �����-�����-�');
        2: Report.Lines.Add('������: �����-����-��-�');
        3: Report.Lines.Add('������: �����-POS-�');
        4: Report.Lines.Add('������: ����-����-�');
        5: Report.Lines.Add('������: �����-����-�');
        else Report.Lines.Add('������: '+IntToStr(AX.Model));
      end;
      if AX.PasswordEntered then
        Report.Lines.Add('������ �����') else
        Report.Lines.Add('������ �� �����');
      Report.Lines.Add('����� ����: '+IntToStr(AX.CheckNumber));
      Report.Lines.Add('����� ��������� �������� �����: '+IntToStr(AX.Session));
      Report.Lines.Add('���������� ����� �������� �������� ����� �������: '+IntToStr(AX.PointPosition));
      case AX.CheckState of
        0: Report.Lines.Add('��� ������');
        1: Report.Lines.Add('������ ��� �������');
        2: Report.Lines.Add('������ ��� ��������');
        3: Report.Lines.Add('������ ��� �������������');
      else Report.Lines.Add('��������� ����: '+IntToStr(AX.CheckState));
      end;
      Report.Lines.Add('������� ����� ����: '+FloatToStr(AX.Summ));
      if string(AX.ROMVersion)[1]='1' then
        begin
        Report.Lines.Add('��� ��������� ������ �� ���: '+IntToStr(AX.ECRError));
        Report.Lines.Add('�������� ���������� ���� ������: '+AX.ECRErrorDescription);
        end;
      end;
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnGetLastErrorClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if AX.GetLastError=0 then
      begin
      Report.Lines.Add('��� ��������� ������ �� ���: '+IntToStr(AX.ECRError));
      Report.Lines.Add('�������� ����: '+AX.ECRErrorDescription);
      end;
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnGetSummClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if AX.GetSumm=0 then
      Report.Lines.Add('����� �������� � ���: '+FloatToStr(AX.Summ));
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnGetDeviceMetricsClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if AX.GetDeviceMetrics=0 then
      begin
      case AX.UCodePage of
        0: Report.Lines.Add('������� �������� �������');
        1: Report.Lines.Add('��������� �������� �������');
        2: Report.Lines.Add('���������� �������� �������');
        3: Report.Lines.Add('���������� �������� �������');
        4: Report.Lines.Add('��������� �������� �������');
        5: Report.Lines.Add('����������� �������� �������');
        6: Report.Lines.Add('����������� �������� �������');
        7: Report.Lines.Add('����������� �������� �������');
        8: Report.Lines.Add('���������� �������� �������');
        9: Report.Lines.Add('���������� �������� �������');
        10: Report.Lines.Add('��������� �������� �������');
        11: Report.Lines.Add('��������� �������� �������');
        12: Report.Lines.Add('��������������� �������� �������');
        13: Report.Lines.Add('���������� �������� �������');
        14: Report.Lines.Add('���������� �������� �������');
        15: Report.Lines.Add('��������� �������� �������');
        16: Report.Lines.Add('�������� �������� �������');
        17: Report.Lines.Add('��������� �������� �������');
        18: Report.Lines.Add('���������� �������� �������');
        19: Report.Lines.Add('���������� �������� �������');
        else Report.Lines.Add('�������� �������: '+IntToStr(AX.UCodePage));
      end;
      case AX.UType of
        1: Report.Lines.Add('��� ����������: ���');
        2: Report.Lines.Add('��� ����������: ����');
        3: Report.Lines.Add('��� ����������: ���� MemoPlus');
        4: Report.Lines.Add('��� ����������: ������� ��������');
        5: Report.Lines.Add('��� ����������: �������� ����� ������');
        6: Report.Lines.Add('��� ����������: ������� ����������');
        7: Report.Lines.Add('��� ����������: ������ �����-����, PIN-����������, ����������� ����������');
        else Report.Lines.Add('��� ����������: '+IntToStr(AX.UType));
      end;
      Report.Lines.Add('������ ��������: '+IntToStr(AX.UMajorVersion)+'.'+
        IntToStr(AX.UMinorVersion)+' , ������: '+IntToStr(AX.UBuild));
      Report.Lines.Add('������ ���������: '+IntToStr(AX.UProtocolVersion));
      if AX.UType=1 then
        begin
          case AX.UModel of
            0: Report.Lines.Add('������: �����-�����-�');
            1: Report.Lines.Add('������: �����-�����-�');
            2: Report.Lines.Add('������: �����-����-��-�');
            3: Report.Lines.Add('������: �����-POS-�');
            4: Report.Lines.Add('������: ����-����-�');
            5: Report.Lines.Add('������: �����-����-�');
            6: Report.Lines.Add('������: �����-2000�');
            7: Report.Lines.Add('������: �����-01-01�');
            8: Report.Lines.Add('������: �����-01-02�');
            9: Report.Lines.Add('������: �����-01-03�');
            else Report.Lines.Add('������: '+IntToStr(AX.UModel));
          end;
        end
      else
        Report.Lines.Add('������: ��� ������� ���� ��������� � ����� �� ����������.');
      Report.Lines.Add('�������� ����������: '+AX.UDescription);
      Report.Lines.Add('�������������� ������: '+IntToSTr(AX.UMode));
      end;
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnGetSupportedModeClick(Sender: TObject);
var
  fResult: integer;
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    AX.UMode:= 32768;
    fResult:= AX.GetSupportedMode;
    case fResult of
      0:
        Report.Lines.Add('����� "OffLine" �������������� �����������');
      -3860:
        Report.Lines.Add('����� "OffLine" �� �������������� �����������');
      else
        Report.Lines.Add('�� ������� �������� ������ � ��������� ������ "OffLine"');
      end;
    AX.UMode:= 16384;
    fResult:= AX.GetSupportedMode;
    case fResult of
      0:
        Report.Lines.Add('����� "OnLine" �������������� �����������');
      -3860:
        Report.Lines.Add('����� "OnLine" �� �������������� �����������');
      else
        Report.Lines.Add('�� ������� �������� ������ � ��������� ������ "OnLine"');
      end;
    AX.UMode:= 8192;
    fResult:= AX.GetSupportedMode;
    case fResult of
      0:
        Report.Lines.Add('����� "��������� OnLine" �������������� �����������');
      -3860:
        Report.Lines.Add('����� "��������� OnLine" �� �������������� �����������');
      else
        Report.Lines.Add('�� ������� �������� ������ � ��������� ������ "��������� OnLine"');
      end;
    AX.UMode:= 4096;
    fResult:= AX.GetSupportedMode;
    case fResult of
      0:
        Report.Lines.Add('����� "���������� �����������" �������������� �����������');
      -3860:
        Report.Lines.Add('����� "���������� �����������" �� �������������� �����������');
      else
        Report.Lines.Add('�� ������� �������� ������ � ��������� ������ "���������� �����������"');
      end;
    AX.UMode:= 2048;
    fResult:= AX.GetSupportedMode;
    case fResult of
      0:
        Report.Lines.Add('����� "���������� �����" �������������� �����������');
      -3860:
        Report.Lines.Add('����� "���������� �����" �� �������������� �����������');
      else
        Report.Lines.Add('�� ������� �������� ������ � ��������� ������ "���������� �����"');
      end;
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnGetLastSummaryClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if (AX.GetLastSummary=0) then
      Report.Lines.Add('����� ���������� �������� �����: '+FloatToStr(AX.Summ));
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmStatus.btnGetCurrentModeClick(Sender: TObject);
begin
  Report.Lines.Clear;
  DisableButtons;
  try
    if AX.GetCurrentMode=0 then
      begin
        case AX.Mode of
          0: Report.Lines.Add('������� �����: ����� ������');
          1: Report.Lines.Add('������� �����: ����� �����������');
          2: Report.Lines.Add('������� �����: ����� ������� ��� �������');
          3: Report.Lines.Add('������� �����: ����� ������� � ��������');
          4: Report.Lines.Add('������� �����: ����� ����������������');
          5: Report.Lines.Add('������� �����: ����� ���������� ����������');
          7: Report.Lines.Add('������� �����: ��������������');
          else Report.Lines.Add('������� �����: ��� '+IntToStr(AX.Mode));
        end;
        case (10*(AX.Mode)+AX.AdvancedMode) of
          0: Report.Lines.Add('����������� �����: �����');
          10: Report.Lines.Add('����������� �����: �������� �������');
          11: Report.Lines.Add('����������� �����: ���� ������');
          12: Report.Lines.Add('����������� �����: �������� ����� ������ ������');
          20: Report.Lines.Add('����������� �����: �������� �������');
          21: Report.Lines.Add('����������� �����: ���� ������');
          22: Report.Lines.Add('����������� �����: ���� ������ X-������');
          30: Report.Lines.Add('����������� �����: �������� �������');
          31: Report.Lines.Add('����������� �����: ���� ������');
          32: Report.Lines.Add('����������� �����: ���� ������ Z-������');
          33: Report.Lines.Add('����������� �����: �������� ������������� �������');
          34: Report.Lines.Add('����������� �����: ���� ���� � ����������');
          35: Report.Lines.Add('����������� �����: �������� ������������� ������ �������');
          36: Report.Lines.Add('����������� �����: ���� ����� �������');
          37: Report.Lines.Add('����������� �����: ���� ��������� ����� � ����������');
          40: Report.Lines.Add('����������� �����: �������� �������');
          41: Report.Lines.Add('����������� �����: ���� ������');
          50: Report.Lines.Add('����������� �����: �������� �������');
          51: Report.Lines.Add('����������� �����: ���� ������');
          52: Report.Lines.Add('����������� �����: ������ ������');
          53: Report.Lines.Add('����������� �����: �������� ����� ������');
          54: Report.Lines.Add('����������� �����: ������������� ����� � ����� ���������� ����������');
          71: Report.Lines.Add('����������� �����: ���� ��������� ������');
          72: Report.Lines.Add('����������� �����: ����������� ������');
          73: Report.Lines.Add('����������� �����: ����� ����� ������� � ����������');
          74: Report.Lines.Add('����������� �����: ����� ������');
          75: Report.Lines.Add('����������� �����: ���� ���� ����� ������ ����');
          76: Report.Lines.Add('����������� �����: ���� ������� ����� ������ ����');
          77: Report.Lines.Add('����������� �����: ��������� ������������� ���');
          78: Report.Lines.Add('����������� �����: �������� ������������� ��������� ������');
          else Report.Lines.Add('����������� �����: ��� '+IntToStr(AX.AdvancedMode));
        end;
        if AX.OutOfPaper then
          Report.Lines.Add('��� ������')
        else
          Report.Lines.Add('������ ����');
        if AX.PrinterConnectionFailed then
          Report.Lines.Add('����� � ��������� ����� ���')
        else
          Report.Lines.Add('����� � ��������� ����� ����');
      end;
  finally
    EnableButtons;
    LoadProperties;
  end;
end;

procedure TfrmStatus.FormCreate(Sender: TObject);
begin
  Caption:= AX.DeviceDescription+Caption;
end;

end.
