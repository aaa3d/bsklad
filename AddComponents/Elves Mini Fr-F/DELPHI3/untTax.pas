unit untTax;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, untObj, untUtil, ExtCtrls, CMN_ABOX, ComCtrls, untNStat;

type
  EBadParam = class(Exception)
  end;

  TfrmMain = class(TForm)
    btnGetStatus: TButton;
    btnProperties: TButton;
    btnClose: TButton;
    btnEnter: TButton;
    btnExit: TButton;
    btnFont: TButton;
    btnAbout: TButton;
    btnEnterNumber: TButton;
    btnGetRange: TButton;
    btnFullDate: TButton;
    btnFullSession: TButton;
    chkDeviceEnabled: TCheckBox;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    edtResultCode: TEdit;
    edtResultDescription: TEdit;
    Label7: TLabel;
    edtPassword: TEdit;
    FontDialog: TFontDialog;
    edtSerialNumber: TEdit;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    edtMachineNumber: TEdit;
    Label5: TLabel;
    edtINN: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    dateStart: TDateTimePicker;
    dateEnd: TDateTimePicker;
    Label9: TLabel;
    Label10: TLabel;
    edtStartSession: TEdit;
    edtEndSession: TEdit;
    Label11: TLabel;
    btnFiscalization: TButton;
    btnShortSession: TButton;
    btnShortDate: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnPropertiesClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure chkDeviceEnabledClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnFontClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnGetStatusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEnterNumberClick(Sender: TObject);
    procedure btnGetRangeClick(Sender: TObject);
    procedure btnFiscalizationClick(Sender: TObject);
    procedure btnFullSessionClick(Sender: TObject);
    procedure btnFullDateClick(Sender: TObject);
    procedure btnShortDateClick(Sender: TObject);
    procedure btnShortSessionClick(Sender: TObject);
  private
    fProcessing: boolean;
    procedure AssignError;
    procedure EnableButtons;
    procedure DisableButtons;
    procedure DoException(Sender: TObject; E: Exception);
  end;

var
  frmMain: TfrmMain;

implementation
{$R *.DFM}

procedure TfrmMain.DoException(Sender: TObject; E: Exception);
begin
  if E is EConvertError then
    begin
    edtResultCode.Text:= '-6';
    edtResultDescription.Text:= 'Один из параметров введён неверно.';
    end
  else
    begin
    if not(E is EBadParam) then
      begin
      edtResultCode.Text:= 'Произошла исключительная ситуация';
      edtResultDescription.Text:= E.Message;
      end;
    end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  fFont: TFont;
begin
  Application.Title:= Caption;
  fProcessing:= FALSE;
  fFont:= TFont.Create;
  try
    if GetRegistryFont(fFont) then
      Font.Assign(fFont);
  finally
    fFont.Free;
  end;
  AX:= CreateAX('AddIn.FprnM45', 'FprnM1C.dll','FprnMLS.exe');
  Application.OnException:= DoException;
  AX.ApplicationHandle:= Application.Handle;
end;

procedure TfrmMain.EnableButtons;
begin
  btnGetStatus.Enabled:= TRUE;
  btnProperties.Enabled:= TRUE;
  btnClose.Enabled:= TRUE;
  btnEnter.Enabled:= TRUE;
  btnExit.Enabled:= TRUE;
  btnFont.Enabled:= TRUE;
  btnAbout.Enabled:= TRUE;
  btnEnterNumber.Enabled:= TRUE;
  btnFiscalization.Enabled:= TRUE;
  btnGetRange.Enabled:= TRUE;
  btnFullDate.Enabled:= TRUE;
  btnFullSession.Enabled:= TRUE;
  btnShortDate.Enabled:= TRUE;
  btnShortSession.Enabled:= TRUE;
end;

procedure TfrmMain.DisableButtons;
begin
  edtResultCode.Text:= '';
  edtResultDescription.Text:= '';
  btnGetStatus.Enabled:= FALSE;
  btnProperties.Enabled:= FALSE;
  btnClose.Enabled:= FALSE;
  btnEnter.Enabled:= FALSE;
  btnExit.Enabled:= FALSE;
  btnFont.Enabled:= FALSE;
  btnAbout.Enabled:= FALSE;
  btnEnterNumber.Enabled:= FALSE;
  btnFiscalization.Enabled:= FALSE;
  btnGetRange.Enabled:= FALSE;
  btnFullDate.Enabled:= FALSE;
  btnFullSession.Enabled:= FALSE;
  btnShortDate.Enabled:= FALSE;
  btnShortSession.Enabled:= FALSE;
end;

procedure TfrmMain.btnPropertiesClick(Sender: TObject);
begin
  AX.ShowProperties;
  fProcessing:= TRUE;
  chkDeviceEnabled.Checked:= AX.DeviceEnabled;
  fProcessing:= FALSE;
  AssignError;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.chkDeviceEnabledClick(Sender: TObject);
begin
  if fProcessing then
    Exit;
  fProcessing:= TRUE;
  AX.DeviceEnabled:= chkDeviceEnabled.Checked;
  chkDeviceEnabled.Checked:= AX.DeviceEnabled;
  fProcessing:= FALSE;
  AssignError;
end;

procedure TfrmMain.AssignError;
begin
  edtResultCode.Text:= IntToStr(AX.ResultCode);
  edtResultDescription.Text:= AX.ResultDescription;
end;

procedure TfrmMain.btnEnterClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.Mode:= 5;
    AX.Password:= edtPassword.Text;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.SetMode;
  finally
    AssignError;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.Mode:= 0;
    AX.Password:= edtPassword.Text;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.SetMode;
  finally
    AssignError;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnFontClick(Sender: TObject);
begin
  FontDialog.Font.Assign(Font);
  if FontDialog.Execute then
  begin
    Font.Assign(FontDialog.Font);
    SetRegistryFont(Font);
  end;
end;

function GetVersion: WideString;
var
  hVerInfo: THandle;
  hGlobal: THandle;
  AddrRes: pointer;
  Buf: array[0..7]of byte;
begin
  hVerInfo:= FindResource(hInstance, '#1', RT_VERSION);
  if hVerInfo=0 then
    RESULT:= '0.0.0.0'
  else
    begin
    hGlobal:= LoadResource(hInstance, hVerInfo);
    if hGlobal=0 then
      RESULT:= '0.0.0.0'
    else
      begin
      AddrRes:= LockResource(hGlobal);
      CopyMemory(@Buf, pointer(integer(AddrRes)+48), 8);
      RESULT:= IntToStr(Buf[2]+Buf[3]*$100)+'.'+IntToStr(Buf[0]+Buf[1]*$100)+'.'+
        IntToStr(Buf[6]+Buf[7]*$100)+'.'+IntToStr(Buf[4]+Buf[5]*$100);
      FreeResource(hGlobal);
      end;
    end;
end;

procedure TfrmMain.btnAboutClick(Sender: TObject);
begin
  ShowAboutBox('ККМ ЭЛВЕС-МИКРО-Ф', Font, ['Версия теста: '+GetVersion, 'Версия драйвера: '+AX.Version,
    'Версия сервера оборудования: '+AX.ServerVersion]);
end;

procedure TfrmMain.btnGetStatusClick(Sender: TObject);
begin
  frmStatus.Font.Assign(Font);
  frmStatus.ShowModal;
  AssignError;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  AssignError;
  btnClose.SetFocus;
  DateStart.Date:= Date;
  DateStart.Date:= Date;
end;

procedure TfrmMain.btnEnterNumberClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SerialNumber:= edtSerialNumber.Text;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.SetSerialNumber;
  finally
    AssignError;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnGetRangeClick(Sender: TObject);
var
  tmpYear, tmpMonth, tmpDay: word;
begin
  DisableButtons;
  try
    if AX.GetRange=0 then
      begin
      edtStartSession.Text:= IntToStr(AX.Session);
      edtEndSession.Text:= IntToStr(AX.EndSession);
      tmpYear:= AX.Year;
      tmpMonth:= AX.Month;
      tmpDay:= AX.Day;
      dateStart.Date:= EncodeDate(tmpYear, tmpMonth, tmpday);
      tmpYear:= AX.EndYear;
      tmpMonth:= AX.EndMonth;
      tmpDay:= AX.EndDay;
      dateEnd.date:= EncodeDate(tmpYear, tmpMonth, tmpday);
      end;
  finally
    AssignError;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnFiscalizationClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.MachineNumber:= edtMachineNumber.Text;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.INN:= edtINN.Text;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.Password:= edtPassword.Text;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.Fiscalization;
  finally
    AssignError;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnFullSessionClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.ReportType:= 6;
    AX.Session:= StrToInt(edtStartSession.Text);
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.EndSession:= StrToInt(edtEndSession.Text);
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.Report;
  finally
    AssignError;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnFullDateClick(Sender: TObject);
var
  tmpYear, tmpMonth, tmpDay: word;
begin
  DisableButtons;
  try
    AX.ReportType:= 5;
    DecodeDate(dateStart.Date, tmpYear, tmpMonth, tmpDay);
    AX.Year:= tmpYear;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.Month:= tmpMonth;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.Day:= tmpDay;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    DecodeDate(dateEnd.Date, tmpYear, tmpMonth, tmpDay);
    AX.EndYear:= tmpYear;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.EndMonth:= tmpMonth;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.EndDay:= tmpDay;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.Report;
  finally
    AssignError;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnShortDateClick(Sender: TObject);
var
  tmpYear, tmpMonth, tmpDay: word;
begin
  DisableButtons;
  try
    AX.ReportType:= 3;
    DecodeDate(dateStart.Date, tmpYear, tmpMonth, tmpDay);
    AX.Year:= tmpYear;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.Month:= tmpMonth;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.Day:= tmpDay;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    DecodeDate(dateEnd.Date, tmpYear, tmpMonth, tmpDay);
    AX.EndYear:= tmpYear;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.EndMonth:= tmpMonth;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.EndDay:= tmpDay;
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.Report;
  finally
    AssignError;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnShortSessionClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.ReportType:= 4;
    AX.Session:= StrToInt(edtStartSession.Text);
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.EndSession:= StrToInt(edtEndSession.Text);
    if AX.ResultCode<>0 then
      raise EBadParam.Create('');
    AX.Report;
  finally
    AssignError;
    EnableButtons;
  end;
end;

end.
