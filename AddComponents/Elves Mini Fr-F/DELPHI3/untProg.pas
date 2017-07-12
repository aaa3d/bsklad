unit untProg;
{------------------------------------------------------------------------------}
{ (C) ÍÒÖ "Øòðèõ-Ì". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, untObj, ComCtrls;

type
  TfrmProgramming = class(TForm)
    pages: TPageControl;
    page1: TTabSheet;
    page3: TTabSheet;
    Label25: TLabel;
    Label3: TLabel;
    edtCaption: TEdit;
    cbCaptionPurpose: TComboBox;
    page4: TTabSheet;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtOrderNumber: TEdit;
    edtOrderCode: TEdit;
    edtCheckNumber: TEdit;
    edtPrice3: TEdit;
    cbTypeClose: TComboBox;
    Label16: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label15: TLabel;
    Label11: TLabel;
    edtTax: TEdit;
    edtBarcode: TEdit;
    edtDepartment: TEdit;
    edtPrice: TEdit;
    edtPLUNumber: TEdit;
    edtName: TEdit;
    edtQuantity: TEdit;
    Label27: TLabel;
    Label26: TLabel;
    edtValue: TEdit;
    cbValuePurpose: TComboBox;
    page5: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtTable: TEdit;
    edtRow: TEdit;
    edtField: TEdit;
    cbFieldType: TComboBox;
    Label17: TLabel;
    edtCaption2: TEdit;
    btnClose: TButton;
    page6: TTabSheet;
    Label36: TLabel;
    Label39: TLabel;
    edtFirstZone: TEdit;
    cbRouteType: TComboBox;
    Label41: TLabel;
    Label40: TLabel;
    edtLastZone: TEdit;
    edtPrice2: TEdit;
    edtRouteNumber: TEdit;
    Label35: TLabel;
    pnlCommon: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtBadParam: TEdit;
    edtResultCode: TEdit;
    btnSetOrder: TButton;
    btnGetOrder: TButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    btnSetRecord: TButton;
    btnGetRecord: TButton;
    Shape5: TShape;
    Shape6: TShape;
    btnSetSettings: TButton;
    btnGetSettings: TButton;
    Shape7: TShape;
    Shape8: TShape;
    btnSetRoute: TButton;
    btnGetRoute: TButton;
    Shape9: TShape;
    Shape10: TShape;
    btnSetValue: TButton;
    btnGetValue: TButton;
    page2: TTabSheet;
    edtHour: TEdit;
    Label18: TLabel;
    Label22: TLabel;
    edtMinute: TEdit;
    Label4: TLabel;
    Label24: TLabel;
    Label33: TLabel;
    edtDay: TEdit;
    edtMonth: TEdit;
    edtYear: TEdit;
    Shape12: TShape;
    btnSetTime: TButton;
    btnSetCaption: TButton;
    btnGetCaption: TButton;
    btnSetDate: TButton;
    Shape11: TShape;
    page7: TTabSheet;
    edtLicense: TEdit;
    Label20: TLabel;
    btnSetLicense: TButton;
    btnGetLicense: TButton;
    Label10: TLabel;
    cbPointPosition: TComboBox;
    btnSetPointPosition: TButton;
    Label19: TLabel;
    edtPassword: TEdit;
    Shape13: TShape;
    Shape14: TShape;
    btnGetDateTime: TButton;
    btnGetPointPosition: TButton;
    edtSecond: TEdit;
    Label21: TLabel;
    btnCurrentDateTime: TButton;
    procedure cbCaptionPurposeChange(Sender: TObject);
    procedure cbValuePurposeChange(Sender: TObject);
    procedure edtValueExit(Sender: TObject);
    procedure edtCaptionExit(Sender: TObject);
    procedure edtHourExit(Sender: TObject);
    procedure edtMinuteExit(Sender: TObject);
    procedure edtDayExit(Sender: TObject);
    procedure edtMonthExit(Sender: TObject);
    procedure edtYearExit(Sender: TObject);
    procedure edtPLUNumberExit(Sender: TObject);
    procedure edtDepartmentExit(Sender: TObject);
    procedure edtBarcodeExit(Sender: TObject);
    procedure edtTaxExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTableExit(Sender: TObject);
    procedure edtRowExit(Sender: TObject);
    procedure edtFieldExit(Sender: TObject);
    procedure cbFieldTypeChange(Sender: TObject);
    procedure edtNameExit(Sender: TObject);
    procedure cbPointPositionChange(Sender: TObject);
    procedure edtPriceExit(Sender: TObject);
    procedure edtQuantityExit(Sender: TObject);
    procedure cbTypeCloseChange(Sender: TObject);
    procedure edtOrderNumberExit(Sender: TObject);
    procedure edtCheckNumberExit(Sender: TObject);
    procedure edtPrice3Exit(Sender: TObject);
    procedure edtOrderCodeExit(Sender: TObject);
    procedure btnSetCaptionClick(Sender: TObject);
    procedure btnSetValueClick(Sender: TObject);
    procedure btnGetCaptionClick(Sender: TObject);
    procedure btnGetValueClick(Sender: TObject);
    procedure btnSetDateClick(Sender: TObject);
    procedure btnSetTimeClick(Sender: TObject);
    procedure btnSetSettingsClick(Sender: TObject);
    procedure btnGetSettingsClick(Sender: TObject);
    procedure btnSetPointPositionClick(Sender: TObject);
    procedure btnSetLicenseClick(Sender: TObject);
    procedure btnGetLicenseClick(Sender: TObject);
    procedure btnSetRecordClick(Sender: TObject);
    procedure btnGetRecordClick(Sender: TObject);
    procedure btnSetOrderClick(Sender: TObject);
    procedure btnGetOrderClick(Sender: TObject);
    procedure btnSetRouteClick(Sender: TObject);
    procedure btnGetRouteClick(Sender: TObject);
    procedure edtCaption2Exit(Sender: TObject);
    procedure edtRouteNumberExit(Sender: TObject);
    procedure edtFirstZoneExit(Sender: TObject);
    procedure edtLastZoneExit(Sender: TObject);
    procedure edtPrice2Exit(Sender: TObject);
    procedure cbRouteTypeChange(Sender: TObject);
    procedure edtLicenseExit(Sender: TObject);
    procedure edtPasswordExit(Sender: TObject);
    procedure btnGetDateTimeClick(Sender: TObject);
    procedure edtSecondExit(Sender: TObject);
    procedure btnCurrentDateTimeClick(Sender: TObject);
  private
    fProcessing: boolean;
    procedure DisableButtons;
    procedure EnableButtons;
    procedure LoadProperties;
  end;

var
  frmProgramming: TfrmProgramming;

implementation
{$R *.DFM}

procedure TfrmProgramming.FormCreate(Sender: TObject);
begin
  Caption:= AX.DeviceDescription+Caption;
  fProcessing:= FALSE;
  edtLicenseExit(nil);
  SendMessage(cbCaptionPurpose.handle, CB_SETDROPPEDWIDTH , 260, 0);
  SendMessage(cbValuePurpose.handle, CB_SETDROPPEDWIDTH , 260, 0);
  SendMessage(cbTypeClose.handle, CB_SETDROPPEDWIDTH , 130, 0);
  SendMessage(cbPointPosition.handle, CB_SETDROPPEDWIDTH , 130, 0);
end;

procedure TfrmProgramming.FormShow(Sender: TObject);
begin
  btnClose.SetFocus;
  LoadProperties;
end;

procedure TfrmProgramming.DisableButtons;
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
  for i:= 0 to page3.ControlCount-1 do
    page3.Controls[i].Enabled:= FALSE;
  for i:= 0 to page4.ControlCount-1 do
    page4.Controls[i].Enabled:= FALSE;
  for i:= 0 to page5.ControlCount-1 do
    page5.Controls[i].Enabled:= FALSE;
  for i:= 0 to page6.ControlCount-1 do
    page6.Controls[i].Enabled:= FALSE;
  for i:= 0 to page7.ControlCount-1 do
    page7.Controls[i].Enabled:= FALSE;
end;

procedure TfrmProgramming.EnableButtons;
var
  i: integer;
begin
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= TRUE;
  for i:= 0 to page1.ControlCount-1 do
    page1.Controls[i].Enabled:= TRUE;
  for i:= 0 to page2.ControlCount-1 do
    page2.Controls[i].Enabled:= TRUE;
  for i:= 0 to page3.ControlCount-1 do
    page3.Controls[i].Enabled:= TRUE;
  for i:= 0 to page4.ControlCount-1 do
    page4.Controls[i].Enabled:= TRUE;
  for i:= 0 to page5.ControlCount-1 do
    page5.Controls[i].Enabled:= TRUE;
  for i:= 0 to page6.ControlCount-1 do
    page6.Controls[i].Enabled:= TRUE;
  for i:= 0 to page7.ControlCount-1 do
    page7.Controls[i].Enabled:= TRUE;
end;

procedure TfrmProgramming.LoadProperties;
begin
  if not(fProcessing) then
    begin
    fProcessing:= TRUE;
    edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
    edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
    cbTypeClose.ItemIndex:= AX.TypeClose;
    cbCaptionPurpose.ItemIndex:= AX.CaptionPurpose;
    edtCaption.Text:= AX.Caption;
    edtOrderCode.Text:= AX.OrderCode;
    edtOrderNumber.Text:= IntToStr(AX.OrderNumber);
    edtCheckNumber.Text:= IntToStr(AX.CheckNumber);
    cbValuePurpose.ItemIndex:= AX.ValuePurpose;
    edtValue.Text:= IntToStr(AX.Value);
    edtHour.Text:= IntToStr(AX.Hour);
    edtMinute.Text:= IntToStr(AX.Minute);
    edtSecond.Text:= IntToStr(AX.Second);
    edtDay.Text:= IntToStr(AX.Day);
    edtMonth.Text:= IntToStr(AX.Month);
    edtYear.Text:= IntToStr(AX.Year);
    edtPLUNumber.Text:= IntToStr(AX.PLUNumber);
    edtPrice.Text:= FloatToStr(AX.Price);
    edtPrice3.Text:= FloatToStr(AX.Price);
    edtQuantity.Text:= FloatToStr(AX.Quantity);
    edtDepartment.Text:= IntToStr(AX.Department);
    edtBarcode.Text:= AX.Barcode;
    edtCaption2.Text:= AX.Caption;
    edtName.Text:= AX.Name;
    edtPassword.Text:= AX.Password;
    edtTax.Text:= IntToStr(AX.Tax);
    edtTable.Text:= IntToStr(AX.Table);
    edtRow.Text:= IntToStr(AX.Row);
    edtField.Text:= IntToStr(AX.Field);
    cbFieldType.ItemIndex:= AX.FieldType;
    cbPointPosition.ItemIndex:= AX.PointPosition;
    cbRouteType.ItemIndex:= AX.RateType;
    edtRouteNumber.Text:= IntToStr(AX.RouteNumber);
    edtFirstZone.Text:= IntToStr(AX.FirstZone);
    edtPrice2.Text:= FloatToStr(AX.Price);
    edtLastZone.Text:= IntToStr(AX.LastZone);
    edtLicense.Text:= IntToStr(AX.License);
    fProcessing:= FALSE;
    end;
end;

procedure TfrmProgramming.cbCaptionPurposeChange(Sender: TObject);
begin
  AX.CaptionPurpose:= cbCaptionPurpose.ItemIndex;
  LoadProperties;
end;

procedure TfrmProgramming.edtCaptionExit(Sender: TObject);
begin
  AX.Caption:= edtCaption.Text;
  LoadProperties;
end;

procedure TfrmProgramming.cbValuePurposeChange(Sender: TObject);
begin
  AX.ValuePurpose:= cbValuePurpose.ItemIndex;
  LoadProperties;
end;

procedure TfrmProgramming.edtValueExit(Sender: TObject);
begin
  try
    AX.Value:= StrToInt(edtValue.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtHourExit(Sender: TObject);
begin
  try
    AX.Hour:= StrToInt(edtHour.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtMinuteExit(Sender: TObject);
begin
  try
    AX.Minute:= StrToInt(edtMinute.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtDayExit(Sender: TObject);
begin
  try
    AX.Day:= StrToInt(edtDay.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtMonthExit(Sender: TObject);
begin
  try
    AX.Month:= StrToInt(edtMonth.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtYearExit(Sender: TObject);
begin
  try
    AX.Year:= StrToInt(edtYear.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtPLUNumberExit(Sender: TObject);
begin
  try
    AX.PLUNumber:= StrToInt(edtPLUNumber.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtDepartmentExit(Sender: TObject);
begin
  try
    AX.Department:= StrToInt(edtDepartment.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtBarcodeExit(Sender: TObject);
begin
  try
    AX.Barcode:= edtBarcode.Text;
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtTaxExit(Sender: TObject);
begin
  try
    AX.Tax:= StrToInt(edtTax.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtTableExit(Sender: TObject);
begin
  try
    AX.Table:= StrToInt(edtTable.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtRowExit(Sender: TObject);
begin
  try
    AX.Row:= StrToInt(edtRow.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtFieldExit(Sender: TObject);
begin
  try
    AX.Field:= StrToInt(edtField.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.cbFieldTypeChange(Sender: TObject);
begin
  AX.FieldType:= cbFieldType.ItemIndex;
  LoadProperties;
end;

procedure TfrmProgramming.edtNameExit(Sender: TObject);
begin
  AX.Name:= edtName.Text;
  LoadProperties;
end;

procedure TfrmProgramming.cbPointPositionChange(Sender: TObject);
begin
  AX.PointPosition:= cbPointPosition.ItemIndex;
  LoadProperties;
end;

procedure TfrmProgramming.edtPriceExit(Sender: TObject);
begin
  try
    AX.Price:= StrToFloat(edtPrice.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtQuantityExit(Sender: TObject);
begin
  try
    AX.Quantity:= StrToFloat(edtQuantity.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.cbTypeCloseChange(Sender: TObject);
begin
  AX.TypeClose:= cbTypeClose.ItemIndex;
  LoadProperties;
end;

procedure TfrmProgramming.edtOrderNumberExit(Sender: TObject);
begin
  try
    AX.OrderNumber:= StrToInt(edtOrderNumber.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtCheckNumberExit(Sender: TObject);
begin
  try
    AX.CheckNumber:= StrToInt(edtCheckNumber.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtPrice3Exit(Sender: TObject);
begin
  try
    AX.Price:= StrToFloat(edtPrice3.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtOrderCodeExit(Sender: TObject);
begin
  AX.OrderCode:= edtOrderCode.Text;
  LoadProperties;
end;

procedure TfrmProgramming.btnSetCaptionClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SetCaption;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnSetValueClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SetValue;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnGetCaptionClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.GetCaption;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnGetValueClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.GetValue;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnSetDateClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SetDate;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnSetTimeClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SetTime;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnSetSettingsClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SetSettings;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnGetSettingsClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.GetSettings;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnSetPointPositionClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SetPointPosition;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnSetLicenseClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.SetLicense;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnGetLicenseClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.GetLicense;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnSetRecordClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.RecordType:= 0;
    AX.SetRecord;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnGetRecordClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.ReportType:= 16;
    AX.GetRecord;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnSetOrderClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.RecordType:= 1;
    AX.SetRecord;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnGetOrderClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.ReportType:= 17;
    AX.GetRecord;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnSetRouteClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.RecordType:= 2;
    AX.SetRecord;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.btnGetRouteClick(Sender: TObject);
begin
  DisableButtons;
  try
    AX.ReportType:= 18;
    AX.GetRecord;
  finally
    LoadProperties;
    EnableButtons;
  end;
end;

procedure TfrmProgramming.edtCaption2Exit(Sender: TObject);
begin
  AX.Caption:= edtCaption2.Text;
  LoadProperties;
end;

procedure TfrmProgramming.edtRouteNumberExit(Sender: TObject);
begin
  try
    AX.RouteNumber:= StrToInt(edtRouteNumber.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtFirstZoneExit(Sender: TObject);
begin
  try
    AX.FirstZone:= StrToInt(edtFirstZone.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtLastZoneExit(Sender: TObject);
begin
  try
    AX.LastZone:= StrToInt(edtLastZone.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtPrice2Exit(Sender: TObject);
begin
  try
    AX.Price:= StrToFloat(edtPrice2.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.cbRouteTypeChange(Sender: TObject);
begin
  AX.RateType:= cbRouteType.ItemIndex;
  LoadProperties;
end;

procedure TfrmProgramming.edtLicenseExit(Sender: TObject);
begin
  try
    AX.License:= StrToInt(edtLicense.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.edtPasswordExit(Sender: TObject);
begin
  AX.Password:= edtPassword.Text;
  LoadProperties;
end;

procedure TfrmProgramming.btnGetDateTimeClick(Sender: TObject);
begin
  AX.GetStatus;
  LoadProperties;
end;

procedure TfrmProgramming.edtSecondExit(Sender: TObject);
begin
  try
    AX.Second:= StrToInt(edtSecond.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmProgramming.btnCurrentDateTimeClick(Sender: TObject);
var
  fHour, fMinute, fSecond, fMSec, fYear, fMonth, fDay: Word;
begin
  fProcessing:= TRUE;
  DecodeTime(Time, fHour, fMinute, fSecond, fMSec);
  edtHour.Text:= IntToStr(fHour);
  edtHourExit(nil);
  edtMinute.Text:= IntToStr(fMinute);
  edtMinuteExit(nil);
  edtSecond.Text:= IntToStr(fSecond);
  edtSecondExit(nil);
  DecodeDate(Date, fYear, fMonth, fDay);
  edtYear.Text:= IntToStr(fYear);
  edtYearExit(nil);
  edtMonth.Text:= IntToStr(fMonth);
  edtMonthExit(nil);
  edtDay.Text:= IntToStr(fDay);
  edtDayExit(nil);
  fProcessing:= FALSE;
  LoadProperties;
end;

end.
