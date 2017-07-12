unit untDevs;
{------------------------------------------------------------------------------}
{ (C) ÍÒÖ "Øòðèõ-Ì". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, untObj;

type
  TfrmDevices = class(TForm)
    Caption1: TLabel;
    Caption2: TLabel;
    edtBadParam: TEdit;
    edtResultCode: TEdit;
    btnAdd: TButton;
    btnDelete: TButton;
    Bevel1: TBevel;
    Shape1: TShape;
    btnClose: TButton;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbDeviceNumber: TComboBox;
    cbDeviceIndex: TComboBox;
    Label7: TLabel;
    bottomPanel: TPanel;
    Shape2: TShape;
    chkDeviceEnabled: TCheckBox;
    edtMachineName: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    cbBaudRate: TComboBox;
    cbPortNumber: TComboBox;
    edtDeviceName: TEdit;
    Label1: TLabel;
    Label9: TLabel;
    topPanel: TPanel;
    edtDeviceCount: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    udPortNumber: TUpDown;
    udBaudRate: TUpDown;
    edtPortNumber: TEdit;
    edtBaudRate: TEdit;
    procedure FormShow(Sender: TObject);
    procedure cbPortNumberChange(Sender: TObject);
    procedure cbBaudRateChange(Sender: TObject);
    procedure cbDeviceIndexChange(Sender: TObject);
    procedure cbDeviceNumberChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure chkDeviceEnabledClick(Sender: TObject);
    procedure edtDeviceNameChange(Sender: TObject);
    procedure udPortNumberClick(Sender: TObject; Button: TUDBtnType);
    procedure udBaudRateClick(Sender: TObject; Button: TUDBtnType);
    procedure edtPortNumberExit(Sender: TObject);
    procedure edtBaudRateExit(Sender: TObject);
    procedure edtBaudRateKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtMachineNameExit(Sender: TObject);
  protected
    fProcessing: boolean;
    procedure LoadProperties;
  end;

var
  frmDevices: TfrmDevices;

implementation
{$R *.DFM}

procedure TfrmDevices.FormCreate(Sender: TObject);
begin
  Caption:= AX.DeviceDescription+Caption;
  fProcessing:= FALSE;
end;

procedure TfrmDevices.LoadProperties;
begin
  if not(fProcessing) then
    begin
    fProcessing:= TRUE;
    edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
    edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
    cbPortNumber.ItemIndex:= AX.PortNumber-1;
    edtPortNumber.Text:= IntToStr(AX.PortNumber);
    case AX.BaudRate of
      3: cbBaudRate.ItemIndex:= 0;
      4: cbBaudRate.ItemIndex:= 1;
      7: cbBaudRate.ItemIndex:= 3;
      9: cbBaudRate.ItemIndex:= 4;
      12: cbBaudRate.ItemIndex:= 5;
      14: cbBaudRate.ItemIndex:= 6;
      18: cbBaudRate.ItemIndex:= 7;
      else  cbBaudRate.ItemIndex:= 2;
    end;
    edtBaudRate.Text:= IntToStr(AX.BaudRate);
    edtMachineName.Text:= AX.MachineName;
    cbDeviceIndex.ItemIndex:= AX.CurrentDeviceIndex;
    cbDeviceNumber.ItemIndex:= AX.CurrentDeviceNumber-1;
    edtDeviceCount.Text:= IntToStr(AX.DeviceCount);
    edtDeviceName.Text:= AX.CurrentDeviceName;
    chkDeviceEnabled.Checked:= AX.DeviceEnabled;
    fProcessing:= FALSE;
    end;
end;

procedure TfrmDevices.FormShow(Sender: TObject);
begin
  LoadProperties;
  btnClose.SetFocus;
end;

procedure TfrmDevices.btnAddClick(Sender: TObject);
begin
  AX.AddDevice;
  LoadProperties;
end;

procedure TfrmDevices.btnDeleteClick(Sender: TObject);
begin
  AX.DeleteDevice;
  LoadProperties;
end;

procedure TfrmDevices.cbPortNumberChange(Sender: TObject);
begin
  AX.PortNumber:= cbPortNumber.ItemIndex+1;
  LoadProperties;
end;

procedure TfrmDevices.cbBaudRateChange(Sender: TObject);
begin
  case cbBaudRate.ItemIndex of
    0: AX.BaudRate:= 3;
    1: AX.BaudRate:= 4;
    2: AX.BaudRate:= 5;
    3: AX.BaudRate:= 7;
    4: AX.BaudRate:= 9;
    5: AX.BaudRate:= 12;
    6: AX.BaudRate:= 14;
    7: AX.BaudRate:= 18;
  end;
  LoadProperties;
end;

procedure TfrmDevices.cbDeviceIndexChange(Sender: TObject);
begin
  AX.CurrentDeviceIndex:= cbDeviceIndex.ItemIndex;
  LoadProperties;
end;

procedure TfrmDevices.cbDeviceNumberChange(Sender: TObject);
begin
  AX.CurrentDeviceNumber:= cbDeviceNumber.ItemIndex+1;
  LoadProperties;
end;

procedure TfrmDevices.chkDeviceEnabledClick(Sender: TObject);
begin
  AX.DeviceEnabled:= chkDeviceEnabled.Checked;
  LoadProperties;
end;

procedure TfrmDevices.edtDeviceNameChange(Sender: TObject);
begin
  AX.CurrentDevicename:= edtDeviceName.Text;
  LoadProperties;
end;

procedure TfrmDevices.udPortNumberClick(Sender: TObject; Button: TUDBtnType);
begin
  if Button=btNext then
    AX.PortNumber:= AX.PortNumber+1
  else
    AX.PortNumber:= AX.PortNumber-1;
  LoadProperties;
end;

procedure TfrmDevices.udBaudRateClick(Sender: TObject; Button: TUDBtnType);
begin
  if Button=btNext then
    AX.BaudRate:= AX.BaudRate+1
  else
    AX.BaudRate:= AX.BaudRate-1;
  LoadProperties;
end;

procedure TfrmDevices.edtPortNumberExit(Sender: TObject);
begin
  try
    AX.PortNumber:= StrToInt(edtPortNumber.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmDevices.edtBaudRateExit(Sender: TObject);
begin
  try
    AX.BaudRate:= StrToInt(edtBaudrate.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmDevices.edtBaudRateKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    edtBaudRateExit(nil);
end;

procedure TfrmDevices.edtPortNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    edtPortNumberExit(nil);
end;

procedure TfrmDevices.edtMachineNameExit(Sender: TObject);
begin
  AX.MachineName:= edtMachineName.Text;
  LoadProperties;
end;

end.
