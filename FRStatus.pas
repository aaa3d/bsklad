unit FRStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFR_STATUS = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FR_STATUS: TFR_STATUS;

implementation

uses FR_Shtrih;

{$R *.DFM}

procedure TFR_STATUS.FormShow(Sender: TObject);
begin
  try
    Memo1.Clear;
    FRShtrih.connect(true);


    begin
      with Memo1 do
      begin
        Lines.Add('�� ��:');
        Lines.Add(#9'������: '+FRShtrih.FR.ECRSoftVersion);
        Lines.Add(#9'������: '+IntToStr(FRShtrih.FR.ECRBuild));
        Lines.Add(#9'����: '+DateToStr(FRShtrih.FR.ECRSoftDate));
        Lines.Add('�� ��:');
        Lines.Add(#9'������: '+FRShtrih.FR.FMSoftVersion);
        Lines.Add(#9'������: '+IntToStr(FRShtrih.FR.FMBuild));
        Lines.Add(#9'����: '+DateToStr(FRShtrih.FR.FMSoftDate));
        Lines.Add('����� ��:<'+IntToStr(FRShtrih.FR.ECRFlags)+'>');
        Lines.Add(#9'����� ������������� ������� '+FRShtrih.ECRFlagsToStr(0));
        Lines.Add(#9'����� ������� ����� '+FRShtrih.ECRFlagsToStr(1));
        Lines.Add(#9'������� ������ ����������� ��������� '+FRShtrih.ECRFlagsToStr(2));
        Lines.Add(#9'������ ������ ������������ ��������� '+FRShtrih.ECRFlagsToStr(3));
        Lines.Add(#9'��������� ���������� ����� '+FRShtrih.ECRFlagsToStr(4));
        Lines.Add(#9'���� '+FRShtrih.ECRFlagsToStr(5));
        Lines.Add(#9'���������� ������ ������������� ������� '+FRShtrih.ECRFlagsToStr(6));
        Lines.Add(#9'���������� ������ ���. ����� '+FRShtrih.ECRFlagsToStr(7));
        Lines.Add(#9'����� ������������ ������������� ������� '+FRShtrih.ECRFlagsToStr(8));
        Lines.Add(#9'����� ������������ ���. ����� '+FRShtrih.ECRFlagsToStr(9));
        Lines.Add(#9'������ ������� �� '+FRShtrih.ECRFlagsToStr(10));
        Lines.Add(#9'�������� ���� '+FRShtrih.ECRFlagsToStr(11));
        Lines.Add(#9'����� ������� ������� �������� '+FRShtrih.ECRFlagsToStr(12));
        Lines.Add(#9'����� ������ ������� �������� '+FRShtrih.ECRFlagsToStr(13));
        Lines.Add(#9'���� ����� ��������� '+FRShtrih.ECRFlagsToStr(14));
        Lines.Add(#9'��������� ����� � ���������� '+FRShtrih.ECRFlagsToStr(15));
        Lines.Add('����� ��:<'+IntToStr(FRShtrih.FR.FMFlags)+'>');
        Lines.Add(#9'��1 '+FRShtrih.FMFlagsToStr(0));
        Lines.Add(#9'��2 '+FRShtrih.FMFlagsToStr(1));
        Lines.Add(#9'�������� '+FRShtrih.FMFlagsToStr(2));
        Lines.Add(#9'������������ �� '+FRShtrih.FMFlagsToStr(3));
        Lines.Add(#9'������� �� '+FRShtrih.FMFlagsToStr(4));
        Lines.Add(#9'��������� ������ � ��'+FRShtrih.FMFlagsToStr(5));
        Lines.Add(#9'����� � �� '+FRShtrih.FMFlagsToStr(6));
        Lines.Add(#9'24 ���� � �� '+FRShtrih.FMFlagsToStr(7));
        Lines.Add('����� ��� � ����: '+IntToStr(FRShtrih.FR.LogicalNumber));
        Lines.Add('����� ���������: '+IntToStr(FRShtrih.FR.OpendocumentNumber));
        Lines.Add('���� ��: '+IntToStr(FRShtrih.FR.PortNumber));
        Lines.Add('����� ��: '+IntToStr(FRShtrih.FR.ECRMode)+ ' '+FRShtrih.FR.ECRModeDescription);
        Lines.Add('������ ������: '+IntToStr(FRShtrih.FR.ECRModeStatus));
        Lines.Add('�������� ��: '+IntToStr(FRShtrih.FR.ECRAdvancedMode)+ ' '+FRShtrih.FR.ECRAdvancedModeDescription);
        Lines.Add('���-�� ������������: '+IntToStr(FRShtrih.FR.RegistrationNumber));
        Lines.Add('���-�� ���������� ������������: '+IntToStr(FRShtrih.FR.FreeRegistration));
        Lines.Add('��������� �������� �����: '+IntToStr(FRShtrih.FR.SessionNumber));
        Lines.Add('��������� ������� � ��: '+IntToStr(FRShtrih.FR.FreeRecordInFM));
        Lines.Add('����: '+DateToStr(FRShtrih.FR.Date));
        Lines.Add('�����: '+TimeToStr(FRShtrih.FR.Time));
        Lines.Add('��������� �����: '+FRShtrih.FR.SerialNumber);
        Lines.Add('���: '+FRShtrih.FR.INN);
      end;
    end;
  finally
      FRShtrih.Disconnect;
  end;
end;

end.
