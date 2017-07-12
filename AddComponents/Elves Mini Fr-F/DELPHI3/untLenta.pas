unit untLenta;
{------------------------------------------------------------------------------}
{ (C) ÍÒÖ "Øòðèõ-Ì". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ExtCtrls, StdCtrls, untObj, ComCtrls;

type
  TfrmLenta = class(TForm)
    btnClose: TButton;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    edtResultCode: TEdit;
    edtBadParam: TEdit;
    btnLenta: TButton;
    btnClear: TButton;
    Bevel1: TBevel;
    chkCacheReport: TCheckBox;
    chkShowProgress: TCheckBox;
    pages: TPageControl;
    page1: TTabSheet;
    page2: TTabSheet;
    Label3: TLabel;
    cbReportType: TComboBox;
    Label4: TLabel;
    edtCheckNumber: TEdit;
    memoReport: TListView;
    gridReport: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnLentaClick(Sender: TObject);
    procedure chkCacheReportClick(Sender: TObject);
    procedure chkShowProgressClick(Sender: TObject);
    procedure edtCheckNumberExit(Sender: TObject);
    procedure cbReportTypeChange(Sender: TObject);
  private
    procedure DisableButtons;
    procedure EnableButtons;
    procedure LoadProperties;
  end;

var
  frmLenta: TfrmLenta;

implementation
{$R *.DFM}

procedure TfrmLenta.FormCreate(Sender: TObject);
begin
  Caption:= AX.DeviceDescription+Caption;
  cbReportType.ItemIndex:= 0;
  SendMessage(cbReportType.handle, CB_SETDROPPEDWIDTH , 210, 0);
end;

procedure TfrmLenta.FormShow(Sender: TObject);
begin
  LoadProperties;
  btnClose.SetFocus;
end;

procedure TfrmLenta.DisableButtons;
var
  i: integer;
begin
  edtResultCode.Text:= '';
  edtBadParam.Text:= '';
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= FALSE;
end;

procedure TfrmLenta.EnableButtons;
var
  i: integer;
begin
  for i:= 0 to ControlCount-1 do
    Controls[i].Enabled:= TRUE;
end;

procedure TfrmLenta.LoadProperties;
begin
  edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
  edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
  if (AX.ReportType<12)or(AX.ReportType>15) then
    AX.ReportType:= 12;
  cbReportType.ItemIndex:= AX.ReportType-12;
  chkCacheReport.Checked:= AX.CacheReport;
  chkShowProgress.Checked:= AX.ShowProgress;
  edtCheckNumber.Text:= IntToStr(AX.CheckNumber);
end;

procedure TfrmLenta.btnClearClick(Sender: TObject);
begin
  gridReport.Items.Clear;
  memoReport.Items.Clear;
end;

procedure TfrmLenta.btnLentaClick(Sender: TObject);

  function DumpConv(Value: string): string;
    var
      i: integer;
    begin
    RESULT:= '';
      try
        for i:= 1 to length(Value) do
          if not(ord(Value[i]) in [48..57]) then
            raise Exception.Create('');
        if length(Value)>=3 then
          for i:= 1 to (length(Value) div 3) do
            begin
            RESULT:= RESULT+' '+IntToHex(100*(ord(Value[3*i-2])-48)+10*(ord(Value[3*i-1])-48)+(ord(Value[3*i])-48), 2);
            end;
      except
        RESULT:= '';
      end;
    end;

var
  itemList: TListItem;
  str2, str3, str4, str5, str6, str7, str8, str9: string;
begin
  DisableButtons;
  btnClearClick(nil);
  try
    case AX.ReportType of
      12,13:
        begin
        if AX.BeginReport=0 then
          begin
            try
              while AX.GetRecord=0 do
                begin
                  itemList:= gridReport.Items.Add;
                  Application.ProcessMessages;
                  itemList.Caption:= IntToStr(AX.CheckNumber);
                  itemList.SubItems.Add(IntToStr(AX.TransactionType));
                  str2:= ''; str3:= ''; str4:= ''; str5:= ''; str6:= ''; str7:= ''; str8:= ''; str9:= '';
                  case AX.TransactionType of
                    1..4,21..24:
                      begin
                      str2:= FloatToStr(AX.Summ);
                      str3:= IntToStr(AX.Department);
                      end;
                    5..6, 35, 36, 50, 51:
                      begin
                      str2:= FloatToStr(AX.Summ);
                      end;
                    11..14:
                      begin
                      str6:= IntToStr(AX.PLUNumber);
                      str4:= FloatToStr(AX.Quantity);
                      end;
                    7, 8, 37, 38:
                      begin
                      str5:= FloatToStr(AX.Percents);
                      end;
                    55:
                      begin
                      str7:=
                        IntToStr(AX.Day)+'/'+IntToStr(AX.Month)+'/'+IntToStr(AX.Year);
                      str8:=
                        IntToStr(AX.Hour)+':'+IntToStr(AX.Minute);
                      str9:= IntToStr(AX.Operator);
                      end;
                  end;
                itemList.SubItems.Add(str2);
                itemList.SubItems.Add(str3);
                itemList.SubItems.Add(str4);
                itemList.SubItems.Add(str5);
                itemList.SubItems.Add(str6);
                itemList.SubItems.Add(str7);
                itemList.SubItems.Add(str8);
                itemList.SubItems.Add(str9);
                end;
            finally
              LoadProperties;
              AX.EndReport;
            end;
          end
        else
          LoadProperties;
        end;
      else
        begin
        if AX.BeginReport=0 then
          begin
          btnClearClick(nil);
            try
              while AX.GetRecord=0 do
                begin
                Application.ProcessMessages;
                itemList:= memoReport.Items.Add;
                itemList.Caption:= IntToStr(AX.CheckNumber);
                itemList.SubItems.Add(DumpConv(AX.Caption));
                end;
            finally
              LoadProperties;
              AX.EndReport;
            end;
          end
        else
          LoadProperties;
        end;
    end;
  finally
    EnableButtons;
  end;
end;

procedure TfrmLenta.chkCacheReportClick(Sender: TObject);
begin
  AX.CacheReport:= chkCacheReport.Checked;
  LoadProperties;
end;

procedure TfrmLenta.chkShowProgressClick(Sender: TObject);
begin
  AX.ShowProgress:= chkShowProgress.Checked;
  LoadProperties;
end;

procedure TfrmLenta.edtCheckNumberExit(Sender: TObject);
begin
  try
    AX.CheckNumber:= StrToInt(edtCheckNumber.Text);
  except
    {no exception processing needed}
  end;
  LoadProperties;
end;

procedure TfrmLenta.cbReportTypeChange(Sender: TObject);
begin
  AX.ReportType:= cbReportType.ItemIndex+12;
end;

end.
