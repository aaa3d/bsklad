unit untMain;
{------------------------------------------------------------------------------}
{ Главное окно приложения. Базовые функции.                                    }
{------------------------------------------------------------------------------}
{ (C) НТЦ "Штрих-М". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
interface
uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ComObj, Buttons,
  untObj, untStat, untDevs, untUtil, untLenta, untProg, untFisc,
  untRoute, untOrder, untPLU;

type
  TfrmMain = class(TForm)
    btnAdvanced: TButton;
    btnProperties: TButton;
    btnClose: TButton;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    edtResultCode: TEdit;
    edtBadParam: TEdit;
    Bevel2: TBevel;
    chkDeviceEnabled: TCheckBox;
    btnStatus: TButton;
    cbMode: TComboBox;
    btnSetMode: TButton;
    Label5: TLabel;
    edtPassword: TEdit;
    Label7: TLabel;
    pcMain: TPageControl;
    page1: TTabSheet;
    Label15: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cbTypeClose: TComboBox;
    edtQuantity: TEdit;
    edtPrice: TEdit;
    cbDepartment: TComboBox;
    edtPercents: TEdit;
    edtSumm: TEdit;
    edtCaption: TEdit;
    edtName: TEdit;
    btnPrintString: TButton;
    btnCashIncome: TButton;
    btnCashOutcome: TButton;
    btnPercentsDiscount: TButton;
    btnPercentsCharge: TButton;
    btnRegistration: TButton;
    btnReturn: TButton;
    btnAnnulate: TButton;
    btnStorno: TButton;
    btnDelivery: TButton;
    btnCloseCheck: TButton;
    chkLockdevices: TCheckBox;
    btnFont: TButton;
    FontDialog: TFontDialog;
    cbDestination: TComboBox;
    Label16: TLabel;
    btnSummDiscount: TButton;
    btnSummCharge: TButton;
    btnAbout: TButton;
    Label19: TLabel;
    cbReportType: TComboBox;
    btnReport: TButton;
    cbTestMode: TComboBox;
    Label21: TLabel;
    cbEnableCheckSumm: TComboBox;
    Label18: TLabel;
    page2: TTabSheet;
    btnPrintHeader: TButton;
    btnPrintFooter: TButton;
    btnFullCut: TButton;
    btnPartialCut: TButton;
    btnInitSettings: TButton;
    btnResetSettings: TButton;
    btnLockKeyboard: TButton;
    btnUnlockKeyboard: TButton;
    edtTimeout: TEdit;
    Label39: TLabel;
    btnSubResult: TButton;
    btnDisplayDraw: TButton;
    btnDisplayWrite: TButton;
    btnPrinterWrite: TButton;
    btnResetChargeDiscount: TButton;
    btnResetSummary: TButton;
    btnTestDevice: TButton;
    btnCancelCheck: TButton;
    btnRoute: TButton;
    btnFiscal: TButton;
    btnRecords: TButton;
    btnOrders: TButton;
    btnOpenDrawer: TButton;
    edtRouteCode: TEdit;
    Label3: TLabel;
    btnInputRoute: TButton;
    btnBeep: TButton;
    btnProgramming: TButton;
    btnLenta: TButton;
    Shape2: TShape;
    Label4: TLabel;
    chkDisableParamWindow: TCheckBox;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPropertiesClick(Sender: TObject);
    procedure btnBeepClick(Sender: TObject);
    procedure btnPrintStringClick(Sender: TObject);
    procedure btnSetModeClick(Sender: TObject);
    procedure btnLockKeyboardClick(Sender: TObject);
    procedure btnUnlockKeyboardClick(Sender: TObject);
    procedure btnCashIncomeClick(Sender: TObject);
    procedure btnCashOutcomeClick(Sender: TObject);
    procedure btnPercentsDiscountClick(Sender: TObject);
    procedure btnPercentsChargeClick(Sender: TObject);
    procedure btnRegistrationClick(Sender: TObject);
    procedure btnCloseCheckClick(Sender: TObject);
    procedure btnSubResultClick(Sender: TObject);
    procedure btnDisplayDrawClick(Sender: TObject);
    procedure btnDisplayWriteClick(Sender: TObject);
    procedure btnDeliveryClick(Sender: TObject);
    procedure btnStornoClick(Sender: TObject);
    procedure btnAnnulateClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure btnCancelCheckClick(Sender: TObject);
    procedure chkDeviceEnabledClick(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
    procedure btnAdvancedClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkLockdevicesClick(Sender: TObject);
    procedure btnFontClick(Sender: TObject);
    procedure btnSummDiscountClick(Sender: TObject);
    procedure btnSummChargeClick(Sender: TObject);
    procedure edtNameExit(Sender: TObject);
    procedure edtCaptionExit(Sender: TObject);
    procedure edtSummExit(Sender: TObject);
    procedure edtPercentsExit(Sender: TObject);
    procedure cbDepartmentChange(Sender: TObject);
    procedure cbTypeCloseChange(Sender: TObject);
    procedure edtPriceExit(Sender: TObject);
    procedure edtQuantityExit(Sender: TObject);
    procedure cbDestinationChange(Sender: TObject);
    procedure btnTestDeviceClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnPrintHeaderClick(Sender: TObject);
    procedure btnPrintFooterClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure cbModeChange(Sender: TObject);
    procedure edtPasswordExit(Sender: TObject);
    procedure cbReportTypeChange(Sender: TObject);
    procedure cbTestModeChange(Sender: TObject);
    procedure edtTimeoutExit(Sender: TObject);
    procedure btnLentaClick(Sender: TObject);
    procedure btnProgrammingClick(Sender: TObject);
    procedure btnFullCutClick(Sender: TObject);
    procedure btnPartialCutClick(Sender: TObject);
    procedure btnPrinterWriteClick(Sender: TObject);
    procedure btnInitSettingsClick(Sender: TObject);
    procedure btnResetSettingsClick(Sender: TObject);
    procedure btnResetChargeDiscountClick(Sender: TObject);
    procedure cbEnableCheckSummChange(Sender: TObject);
    procedure btnFiscalClick(Sender: TObject);
    procedure btnRouteClick(Sender: TObject);
    procedure btnOrdersClick(Sender: TObject);
    procedure btnRecordsClick(Sender: TObject);
    procedure btnResetSummaryClick(Sender: TObject);
    procedure btnOpenDrawerClick(Sender: TObject);
    procedure edtRouteCodeExit(Sender: TObject);
    procedure btnInputRouteClick(Sender: TObject);
    procedure chkDisableParamWindowClick(Sender: TObject);
  private
    fProcessing: boolean;
    procedure LoadProperties;
    procedure EnableButtons;
    procedure DisableButtons;
  end;

var
  frmMain: TfrmMain;

{------------------------------------------------------------------------------}
implementation
{$R *.DFM}

procedure TfrmMain.EnableButtons;
var
  i: integer;
begin
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= TRUE;
  for i:= 0 to page1.ControlCount-1 do
    page1.Controls[i].Enabled:= TRUE;
  for i:= 0 to page2.ControlCount-1 do
    page2.Controls[i].Enabled:= TRUE;
end;

procedure TfrmMain.DisableButtons;
var
  i: integer;
begin
  edtResultCode.Text:= '';
  edtBadParam.Text:= '';
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= FALSE;
  for i:= 0 to page1.ControlCount-1 do
    page1.Controls[i].Enabled:= FALSE;
  for i:= 0 to page2.ControlCount-1 do
    page2.Controls[i].Enabled:= FALSE;
end;

procedure TfrmMain.LoadProperties;
begin
  if not(fProcessing) then
    begin
    fProcessing:= TRUE;
    edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
    edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
    edtName.Text:= AX.Name;
    edtCaption.Text:= AX.Caption;
    edtRouteCode.Text:= IntToStr(AX.RouteCode);
    edtSumm.Text:= FloatToStr(AX.Summ);
    edtPercents.Text:= FloatToStr(AX.Percents);
    cbDepartment.ItemIndex:= AX.Department;
    edtPrice.Text:= FloatToStr(AX.Price);
    edtQuantity.Text:= FloatToStr(AX.Quantity);
    cbTypeClose.ItemIndex:= AX.TypeClose;
    cbDestination.ItemIndex:= AX.Destination;
    if (AX.Mode=7) then
      AX.Mode:= 0;
    cbMode.ItemIndex:= AX.Mode;
    edtPassword.Text:= AX.Password;
    chkDisableParamWindow.Checked:= AX.DisableParamWindow;
    cbReportType.ItemIndex:= AX.ReportType;
    chkLockDevices.Checked:= AX.LockDevices;
    chkDeviceEnabled.Checked:= AX.DeviceEnabled;
    case AX.ReportType of
      0..2:
        cbReportType.ItemIndex:= AX.ReportType;
      7..11:
        cbReportType.ItemIndex:= AX.ReportType-4;
      else
        begin
        cbReportType.ItemIndex:= 1;
        AX.ReportType:= 1;
        end;
    end;
    if AX.TestMode then
      cbTestMode.ItemIndex:= 1
    else
      cbTestMode.ItemIndex:= 0;
    if AX.EnableCheckSumm then
      cbEnableCheckSumm.ItemIndex:=0
    else
      cbEnableCheckSumm.ItemIndex:=1;
    fProcessing:= FALSE;
    end;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  fFont: TFont;
begin
  edtPercents.Text:= '12'+DecimalSeparator+'1';
  edtPrice.Text:= '43'+DecimalSeparator+'2';
  fProcessing:= FALSE;
  fFont:= TFont.Create;
  try
    GetRegistryFont(fFont);
    Font.Assign(fFont);
  finally
    fFont.Free;
  end;
  SendMessage(cbMode.handle, CB_SETDROPPEDWIDTH , 220, 0);
  SendMessage(cbReportType.handle, CB_SETDROPPEDWIDTH , 180, 0);
  AX:= CreateAX('AddIn.FprnM45', 'FprnM1C.dll','FprnMLS.exe');
  try
{------------------------------------------------------------------------------}
{ Проверка версии. В ранних релизах этого свойства(в числе других) нет.        }
{------------------------------------------------------------------------------}
    AX.Destination:= 0;
  except
    on Exception do
      begin
      MessageBox(handle, 'Этот тест предназначен для более поздней версии драйвера. Запуск невозможен. Обновите драйвер.', PChar(Application.Title), MB_OK or MB_ICONINFORMATION);
      Application.ShowMainForm:= FALSE;
      Application.Terminate;
      Exit;
      end;
  end;
  fProcessing:= TRUE;
  cbReportType.ItemIndex:=1;
  edtTimeoutExit(nil);
  edtRouteCodeExit(nil);
  edtNameExit(nil);
  edtCaptionExit(nil);
  edtSummExit(nil);
  edtPercentsExit(nil);
  edtPriceExit(nil);
  edtQuantityExit(nil);
  edtPasswordExit(nil);
  cbReportTypeChange(nil);
  fProcessing:= FALSE;
  LoadProperties;
  Caption:= Caption+AX.DeviceDescription;
  Application.Title:= Caption;
  AX.ApplicationHandle:= Application.Handle;
end;

procedure TfrmMain.btnPropertiesClick(Sender: TObject);
begin
  AX.ShowProperties;
  LoadProperties;
end;

procedure TfrmMain.btnBeepClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.Beep;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnPrintStringClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.PrintString;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnSetModeClick(Sender: TObject);
var
  fAllow: boolean;
begin
  if AX.Mode<>5 then
    fAllow:= TRUE
  else
    begin
    if MessageBox(handle, 'Вы подтверждаете переход в режим налогового инспектора?',
    PChar(Application.Title), MB_YESNO or MB_DEFBUTTON2 or MB_ICONWARNING)=IDYES then
      fAllow:= TRUE
    else
      fAllow:= FALSE;
    end;
  if fAllow then
    begin
    DisableButtons;
    try
      AX.SetMode;
    finally
      LoadProperties;
      EnableButtons;
    end;
    end;
end;

procedure TfrmMain.btnLockKeyboardClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.LockKeyboard;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnUnlockKeyboardClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.UnlockKeyboard;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnCashIncomeClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.CashIncome;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnCashOutcomeClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.CashOutcome;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnPercentsDiscountClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.PercentsDiscount;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnPercentsChargeClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.PercentsCharge;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnRegistrationClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.Registration;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnCloseCheckClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.CloseCheck;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnSubResultClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SubResult;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnDisplayDrawClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.DisplayDraw;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnDisplayWriteClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.DisplayWrite;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnDeliveryClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.Delivery;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnStornoClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.Storno;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnAnnulateClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.Annulate;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnReturnClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.Return;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnCancelCheckClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.CancelCheck;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.chkDeviceEnabledClick(Sender: TObject);
begin
  AX.DeviceEnabled:= chkDeviceEnabled.Checked;
  LoadProperties;
end;

procedure TfrmMain.btnStatusClick(Sender: TObject);
begin
  frmStatus.Font.Assign(Font);
  frmStatus.ShowModal;
  LoadProperties;
end;

procedure TfrmMain.btnAdvancedClick(Sender: TObject);
begin
  frmDevices.Font.Assign(Font);
  frmDevices.ShowModal;
  LoadProperties;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  LoadProperties;
end;

procedure TfrmMain.chkLockdevicesClick(Sender: TObject);
begin
  AX.LockDevices:= chkLockDevices.Checked;
  LoadProperties;
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

procedure TfrmMain.btnSummDiscountClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SummDiscount;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnSummChargeClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SummCharge;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.edtNameExit(Sender: TObject);
begin
  AX.Name:= edtName.Text;
  LoadProperties;
end;

procedure TfrmMain.edtCaptionExit(Sender: TObject);
begin
  AX.Caption:= edtCaption.Text;
  LoadProperties;
end;

procedure TfrmMain.edtSummExit(Sender: TObject);
begin
  try
    AX.Summ:= StrToFloat(edtSumm.Text);
  except
  end;
  LoadProperties;
end;

procedure TfrmMain.edtPercentsExit(Sender: TObject);
begin
  try
    AX.Percents:= StrToFloat(edtPercents.Text);
  except
  end;
  LoadProperties;
end;

procedure TfrmMain.cbDepartmentChange(Sender: TObject);
begin
  AX.Department:= cbDepartment.ItemIndex;
  LoadProperties;
end;

procedure TfrmMain.cbTypeCloseChange(Sender: TObject);
begin
  AX.TypeClose:= cbTypeClose.ItemIndex;
  LoadProperties;
end;

procedure TfrmMain.edtPriceExit(Sender: TObject);
begin
  try
    AX.Price:= StrToFloat(edtPrice.Text);
  except
  end;
  LoadProperties;
end;

procedure TfrmMain.edtQuantityExit(Sender: TObject);
begin
  try
    AX.Quantity:= StrToFloat(edtQuantity.Text);
  except
  end;
  LoadProperties;
end;

procedure TfrmMain.cbDestinationChange(Sender: TObject);
begin
  AX.Destination:= cbDestination.ItemIndex;
  LoadProperties;
end;

procedure TfrmMain.btnTestDeviceClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.TestDevice;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnAboutClick(Sender: TObject);
begin
  {}
end;

procedure TfrmMain.btnPrintHeaderClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.PrintHeader;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnPrintFooterClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.PrintFooter;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnReportClick(Sender: TObject);
begin
  DisableButtons;
  Refresh;
  try
    AX.Report;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.cbModeChange(Sender: TObject);
begin
  AX.Mode:= cbMode.ItemIndex;
  LoadProperties;
end;

procedure TfrmMain.edtPasswordExit(Sender: TObject);
begin
  AX.Password:= edtPassword.Text;
  LoadProperties;
end;

procedure TfrmMain.cbReportTypeChange(Sender: TObject);
begin
  case cbReportType.ItemIndex of
    0..2:
      AX.ReportType:= cbReportType.ItemIndex;
    else
      AX.ReportType:= cbReportType.ItemIndex+4;
  end;
  LoadProperties;
end;

procedure TfrmMain.cbTestModeChange(Sender: TObject);
begin
  if cbTestMode.ItemIndex=0 then
    AX.TestMode:= FALSE
  else
    AX.TestMode:= TRUE;
  LoadProperties;
end;

procedure TfrmMain.edtTimeoutExit(Sender: TObject);
begin
  try
    AX.Timeout:= StrToInt(edtTimeout.Text);
  except ;
  end;
  LoadProperties;
end;

procedure TfrmMain.btnLentaClick(Sender: TObject);
begin
  frmLenta.Font.Assign(Font);
  frmLenta.ShowModal;
  LoadProperties;
end;

procedure TfrmMain.btnProgrammingClick(Sender: TObject);
begin
  frmProgramming.Font.Assign(Font);
  frmProgramming.ShowModal;
  LoadProperties;
end;

procedure TfrmMain.btnFullCutClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.FullCut;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnPartialCutClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.PartialCut;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnPrinterWriteClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.PrinterWrite;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnInitSettingsClick(Sender: TObject);
begin
  if MessageBox(handle, 'Вы подтверждаете инициализацию таблиц ККМ?',
  PChar(Application.Title), MB_YESNO or MB_DEFBUTTON2 or MB_ICONWARNING)=IDYES then
    begin
    DisableButtons;
      try
        AX.InitSettings;
      finally
        EnableButtons;
        LoadProperties;
      end;
    end;
end;

procedure TfrmMain.btnResetSettingsClick(Sender: TObject);
begin
  if MessageBox(handle, 'Вы подтверждаете технологическое обнуление ККМ?',
  PChar(Application.Title), MB_YESNO or MB_DEFBUTTON2 or MB_ICONWARNING)=IDYES then
    begin
    DisableButtons;
      try
        AX.ResetSettings;
      finally
        EnableButtons;
        LoadProperties;
      end;
    end;
end;

procedure TfrmMain.btnResetChargeDiscountClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.ResetChargeDiscount;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.cbEnableCheckSummChange(Sender: TObject);
begin
  if cbEnableCheckSumm.ItemIndex=0 then
    AX.EnableCheckSumm:= TRUE
  else
    AX.EnableCheckSumm:= FALSE;
  LoadProperties;
end;

procedure TfrmMain.btnFiscalClick(Sender: TObject);
begin
  frmFiscal.Font.Assign(Font);
  frmFiscal.ShowModal;
  LoadProperties;
end;

procedure TfrmMain.btnRouteClick(Sender: TObject);
begin
  frmRoute.Font.Assign(Font);
  frmRoute.ShowModal;
  LoadProperties;
end;

procedure TfrmMain.btnOrdersClick(Sender: TObject);
begin
  frmOrder.Font.Assign(Font);
  frmOrder.ShowModal;
  LoadProperties;
end;

procedure TfrmMain.btnRecordsClick(Sender: TObject);
begin
  frmPLU.Font.Assign(Font);
  frmPLU.ShowModal;
  LoadProperties;
end;

procedure TfrmMain.btnResetSummaryClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.ResetSummary;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.btnOpenDrawerClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.OpenDrawer;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.edtRouteCodeExit(Sender: TObject);
begin
  try
    AX.RouteCode:= StrToInt(edtRouteCode.Text);
  except
  end;
  LoadProperties;
end;

procedure TfrmMain.btnInputRouteClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.InputRoute;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmMain.chkDisableParamWindowClick(Sender: TObject);
begin
  AX.DisableParamWindow:= chkDisableParamWindow.Checked;
  LoadProperties;
end;

end.
