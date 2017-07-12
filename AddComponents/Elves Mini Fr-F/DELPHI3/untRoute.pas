unit untRoute;
{------------------------------------------------------------------------------}
{ (C) НТЦ "Штрих-М". All rights reserved. WEB: http://www.m-style.aha.ru       }
{------------------------------------------------------------------------------}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, untObj, ExtCtrls, Grids;

const
  RATE_FILE_SIGNATURE = 'FPrnM_T.exe rates file';
type
  TfrmRoute = class(TForm)
    pnlRight: TPanel;
    Label3: TLabel;
    cbRouteNumber: TComboBox;
    Label4: TLabel;
    cbRateType: TComboBox;
    btnAdd: TButton;
    btnReport: TButton;
    btnClose: TButton;
    lineBevel: TBevel;
    pnlClient: TPanel;
    pnlBottom: TPanel;
    lineShape: TShape;
    Label1: TLabel;
    Label2: TLabel;
    edtResultCode: TEdit;
    edtBadParam: TEdit;
    chkCacheReport: TCheckBox;
    chkShowProgress: TCheckBox;
    boxWork: TStringGrid;
    btnLoad: TButton;
    btnSave: TButton;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pnlClientResize(Sender: TObject);
    procedure pnlBottomResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbRateTypeChange(Sender: TObject);
    procedure cbRouteNumberChange(Sender: TObject);
    procedure pnlRightResize(Sender: TObject);
    procedure ExitHandler(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure boxWorkSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure boxWorkDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnAddClick(Sender: TObject);
    procedure chkCacheReportClick(Sender: TObject);
    procedure chkShowProgressClick(Sender: TObject);
    procedure boxWorkExit(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    fRow: integer;
    fCol: integer;
    fRouteList: TList;
    procedure LoadProperties;
  protected
    procedure WmGetMinMaxInfo(var Msg: TMessage); message WM_GETMINMAXINFO;
  end;

var
  frmRoute: TfrmRoute;
  fileRate: TextFile;

implementation
{$R *.DFM}

procedure TfrmRoute.WmGetMinMaxInfo(var Msg: TMessage);
begin
  with TWMGetMinMaxInfo(Msg).MinMaxInfo^ do
    begin
    ptMinTrackSize.X := 617;
    ptMinTrackSize.Y := 443;
    end;
end;

procedure TfrmRoute.LoadProperties;
begin
  edtResultCode.Text:= '('+IntToStr(AX.ResultCode)+') '+AX.ResultDescription;
  edtBadParam.Text:= '('+IntToStr(AX.BadParam)+') '+AX.BadParamDescription;
  chkCacheReport.Checked:= AX.CacheReport;
  chkShowProgress.Checked:= AX.ShowProgress;
  cbRouteNumber.ItemIndex:= AX.RouteNumber-1;
  cbRateType.ItemIndex:= AX.RateType;
end;

procedure TfrmRoute.FormCreate(Sender: TObject);
var
  i,j: integer;
begin
  Caption:= AX.DeviceDescription+Caption;
  for i:= 1 to 20 do
    begin
    boxWork.Cells[0,i]:= 'Зона '+IntToStr(i-1);
    boxWork.Cells[i,0]:= 'Зона '+IntToStr(i-1);
    end;
  for i:= 1 to 20 do
    for j:= 1 to 20 do
      boxWork.Cells[i,j]:= '1'+DecimalSeparator+'1';
  dlgSave.InitialDir:= ExtractFilePath(Application.ExeName);
  dlgOpen.InitialDir:= ExtractFilePath(Application.ExeName);
end;

procedure TfrmRoute.FormDestroy(Sender: TObject);
begin
  fRouteList.Free;
end;

procedure TfrmRoute.pnlClientResize(Sender: TObject);
begin
  boxWork.Width:= pnlClient.Width-16;
  boxWork.Height:= pnlClient.Height-127;
end;

procedure TfrmRoute.pnlBottomResize(Sender: TObject);
begin
  lineShape.Width:= pnlBottom.Width-16;
  edtResultCode.Width:= pnlBottom.Width-88;
  edtBadParam.Width:= pnlBottom.Width-88;
end;

procedure TfrmRoute.FormShow(Sender: TObject);
begin
  LoadProperties;
  btnClose.SetFocus;
  fRow:= -1;
end;

procedure TfrmRoute.cbRateTypeChange(Sender: TObject);
begin
  AX.RateType:= cbRateType.ItemIndex;
end;

procedure TfrmRoute.cbRouteNumberChange(Sender: TObject);
begin
  AX.RouteNumber:= cbRouteNumber.ItemIndex+1;
end;

procedure TfrmRoute.pnlRightResize(Sender: TObject);
begin
  btnClose.Top:= pnlRight.Height-34;
  lineBevel.Height:= pnlRight.Height-19;
end;

procedure TfrmRoute.ExitHandler(Sender: TObject);
var
  fEdit: TEdit;
begin
  fEdit:= Sender as TEdit;
  try
    if (StrToFloat(fEdit.Text)<0) then
      raise Exception.Create('');
  except
    fEdit.SetFocus;
  end;
end;

procedure TfrmRoute.boxWorkSelectCell(Sender: TObject; Col, Row: Integer;
  var CanSelect: Boolean);
begin
  if (Col<Row)and(Col<>0) then
    CanSelect:= FALSE
  else
    begin
    if fRow<>-1 then
      begin
        try
          AX.Price:= StrToFloat(boxWork.Cells[fCol,FRow]);
          if AX.ResultCode<>0 then
            raise Exception.Create('');
        except
          boxWork.Cells[fCol,FRow]:= FloatToStr(AX.Price);
        end;
      end;
    fRow:= Row;
    fCol:= Col;
    CanSelect:= TRUE;
    end;
end;

procedure TfrmRoute.boxWorkDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (Col<Row)and(Col<>0) then
    begin
    boxWork.Canvas.Brush.Color:= clBtnFace;
    boxWork.Canvas.FillRect(Rect);
    end;
end;

procedure TfrmRoute.btnReportClick(Sender: TObject);
begin
  btnAdd.Enabled:= FALSE;
  btnReport.Enabled:= FALSE;
  chkCacheReport.Enabled:= FALSE;
  chkShowProgress.Enabled:= FALSE;
  cbRouteNumber.Enabled:= FALSE;
  cbRateType.Enabled:= FALSE;
  btnClose.Enabled:= FALSE;
  try
    AX.ReportType:= 18;
    if AX.BeginReport=0 then
      begin
        try
          while AX.GetRecord=0 do
            begin
            Application.ProcessMessages;
            boxWork.Cells[AX.LastZone+1, AX.FirstZone+1]:= FloatToStr(AX.Price);
            end;
        finally
          LoadProperties;
          AX.EndReport;
        end;
      end
    else
      LoadProperties;
  finally
    btnAdd.Enabled:= TRUE;
    btnReport.Enabled:= TRUE;
    chkCacheReport.Enabled:= TRUE;
    chkShowProgress.Enabled:= TRUE;
    cbRouteNumber.Enabled:= TRUE;
    cbRateType.Enabled:= TRUE;
    btnClose.Enabled:= TRUE;
  end;
end;

procedure TfrmRoute.btnAddClick(Sender: TObject);
var
  i,j: integer;
begin
  btnAdd.Enabled:= FALSE;
  btnReport.Enabled:= FALSE;
  chkCacheReport.Enabled:= FALSE;
  chkShowProgress.Enabled:= FALSE;
  cbRouteNumber.Enabled:= FALSE;
  cbRateType.Enabled:= FALSE;
  btnClose.Enabled:= FALSE;
  try
    AX.RecordType:= 2;
    if AX.BeginAdd=0 then
      begin
        try
          for i:= 0 to 19 do
            for j:= i to 19 do
              begin
              AX.FirstZone:= i;
              AX.LastZone:= j;
              AX.Price:= StrToFloat(boxWork.Cells[j+1,i+1]);
              AX.SetRecord;
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
    btnAdd.Enabled:= TRUE;
    btnReport.Enabled:= TRUE;
    chkCacheReport.Enabled:= TRUE;
    chkShowProgress.Enabled:= TRUE;
    cbRouteNumber.Enabled:= TRUE;
    cbRateType.Enabled:= TRUE;
    btnClose.Enabled:= TRUE;
  end;
end;

procedure TfrmRoute.chkCacheReportClick(Sender: TObject);
begin
  AX.CacheReport:= chkCacheReport.Checked;
  LoadProperties;
end;

procedure TfrmRoute.chkShowProgressClick(Sender: TObject);
begin
  AX.ShowProgress:= chkShowProgress.Checked;
  LoadProperties;
end;

procedure TfrmRoute.boxWorkExit(Sender: TObject);
begin
    if fRow<>-1 then
      begin
      try
        AX.Price:= StrToFloat(boxWork.Cells[fCol,FRow]);
      except
        {no exception processing needed}
      end;
      if AX.ResultCode<>0 then
        boxWork.Cells[fCol,FRow]:= FloatToStr(AX.Price);
      end;
end;

procedure TfrmRoute.btnLoadClick(Sender: TObject);
var
  strTemp1, strTemp2, strTemp3: string;
begin
  if dlgOpen.Execute then
    begin
      try
        AssignFile(fileRate, dlgOpen.FileName);
        Reset(fileRate);
        try
          ReadLn(fileRate, strTemp1);
          if strTemp1=RATE_FILE_SIGNATURE then
            begin
            while not(Eof(fileRate)) do
              begin
              ReadLn(fileRate, strTemp1);
              ReadLn(fileRate, strTemp2);
              ReadLn(fileRate, strTemp3);
              StrToFloat(strTemp3);
              boxWork.Cells[StrToInt(strTemp2)+1,StrToInt(strTemp1)+1]:= strTemp3;
              end;
            end
          else
            raise Exception.Create('');
        finally
          CloseFile(fileRate);
        end;
      except
        MessageBox(handle, 'В процессе чтения файла произошёл сбой', PChar(Application.Title), MB_OK or MB_ICONWARNING);
      end;
    end;
end;

procedure TfrmRoute.btnSaveClick(Sender: TObject);
var
  i,j: integer;
begin
  if dlgSave.Execute then
    begin
    AssignFile(fileRate, dlgSave.FileName);
    Rewrite(fileRate);
    WriteLn(fileRate, RATE_FILE_SIGNATURE);
    for i:= 0 to 19 do
      for j:= i to 19 do
        begin
        WriteLn(fileRate, IntToStr(i));
        WriteLn(fileRate, IntToStr(j));
        WriteLn(fileRate, boxWork.Cells[j+1,i+1]);
        end;
    CloseFile(fileRate);
    end;
end;

end.
