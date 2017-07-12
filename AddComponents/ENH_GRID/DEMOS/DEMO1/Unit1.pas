unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Grids, DBGridEH, ComCtrls, Db, DBTables,
  Buttons, DBGrids, PrViewEh, PrnDbgeh;

type
  TForm1 = class(TForm)
    DataSource2: TDataSource;
    Table1: TTable;
    Table2: TTable;
    DataSource3: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEH1: TDBGridEH;
    Panel1: TPanel;
    TabSheet2: TTabSheet;
    DBGridEH2: TDBGridEH;
    TabSheet3: TTabSheet;
    DBGridEH3: TDBGridEH;
    DBGridEH4: TDBGridEH;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    TabSheet4: TTabSheet;
    ImageList2: TImageList;
    tEmployee: TTable;
    tEmployeeEmpNo: TIntegerField;
    tEmployeeLastName: TStringField;
    tEmployeeFirstName: TStringField;
    tEmployeePhoneExt: TStringField;
    tEmployeeHireDate: TDateTimeField;
    tEmployeeSalary: TFloatField;
    tEmployeeSalaryType: TIntegerField;
    dsEmployee: TDataSource;
    DBGridEH5: TDBGridEH;
    qrVendors: TQuery;
    qrVendorsVendorNo: TFloatField;
    qrVendorsVendorName: TStringField;
    qrVendorsAddress1: TStringField;
    qrVendorsAddress2: TStringField;
    qrVendorsCity: TStringField;
    qrVendorsState: TStringField;
    qrVendorsZip: TStringField;
    qrVendorsCountry: TStringField;
    qrVendorsPhone: TStringField;
    qrVendorsFAX: TStringField;
    qrVendorsPreferred: TBooleanField;
    dsVendors: TDataSource;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query1VNo: TFloatField;
    Query1VName: TStringField;
    Query1PNo: TFloatField;
    Query1PDescription: TStringField;
    Query1PCost: TCurrencyField;
    Query1IQty: TIntegerField;
    Query1VName1: TStringField;
    Query1VPreferred: TBooleanField;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    TabSheet5: TTabSheet;
    Panel3: TPanel;
    cbClearSelection: TCheckBox;
    cbShowIndicator: TCheckBox;
    cbTitle: TCheckBox;
    cbHighlightFocus: TCheckBox;
    cbMultiselect: TCheckBox;
    dbgList: TDBGridEH;
    dsCustomer: TDataSource;
    tCustomer: TTable;
    PreviewSetupPanel: TPanel;
    bPrint: TButton;
    bPrinterSetup: TButton;
    bPrevPage: TButton;
    bNextPage: TButton;
    bStop: TButton;
    bClosePreview: TButton;
    PrintDBGridEh1: TPrintDBGridEh;
    PreviewBox1: TPreviewBox;
    bInpPreview: TButton;
    bPreview: TButton;
    DBNavigator1: TDBNavigator;
    bOpenClose: TButton;
    bFiltr: TButton;
    lPageinfo: TLabel;
    cCustomPreview: TButton;
    procedure bFiltrClick(Sender: TObject);
    procedure bOpenCloseClick(Sender: TObject);
    procedure Query1UpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure DBGridEH2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEH; State: TGridDrawState);
    procedure DBGridEH2DrawFooterCell(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEH; Rect: TRect; State: TGridDrawState);
    procedure DBGridEH2GetCellParams(Sender: TObject; Column: TColumnEH;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEH2GetFooterParams(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEH; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment;
      State: TGridDrawState; var Text: String);
    procedure tEmployeeCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGridEH1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEH);
    procedure cbClearSelectionClick(Sender: TObject);
    procedure cbShowIndicatorClick(Sender: TObject);
    procedure cbTitleClick(Sender: TObject);
    procedure cbHighlightFocusClick(Sender: TObject);
    procedure cbMultiselectClick(Sender: TObject);
    procedure DBGridEH1SortMarkingChanged(Sender: TObject);
    procedure bPrintClick(Sender: TObject);
    procedure bPrinterSetupClick(Sender: TObject);
    procedure bPrevPageClick(Sender: TObject);
    procedure bNextPageClick(Sender: TObject);
    procedure bStopClick(Sender: TObject);
    procedure bClosePreviewClick(Sender: TObject);
    procedure bPreviewClick(Sender: TObject);
    procedure bInpPreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PreviewBox1PrinterPreviewChanged(Sender: TObject);
    procedure cCustomPreviewClick(Sender: TObject);
  private
    { Private declarations }
    procedure InplacePreviewSetupDialog(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses CustPrev;

{$R *.DFM}

procedure TForm1.bFiltrClick(Sender: TObject);
begin
  if (Query1.Filtered = True) then begin
    Query1.Filtered := False;
    bFiltr.Caption := 'Filtr';
  end else begin
    Query1.Filtered := True;
    bFiltr.Caption := 'UnFiltr';
  end;
end;

procedure TForm1.bOpenCloseClick(Sender: TObject);
begin
  if (Query1.Active = False) then begin
    Query1.Active := True;
    bOpenClose.Caption := 'Close';
  end else begin
    Query1.Active := False;
    bOpenClose.Caption := 'Open';
  end;
end;

procedure TForm1.Query1UpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  //
end;

procedure TForm1.DBGridEH2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEH;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEH2.CellRect(DBGridEH2.Col,DBGridEH2.Row).Top) and (not (gdFocused in State) or not DBGridEH2.Focused) then
    DBGridEH2.Canvas.Brush.Color := clAqua;
  DBGridEH2.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TForm1.DBGridEH2DrawFooterCell(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEH; Rect: TRect; State: TGridDrawState);
begin
  DBGridEH2.DefaultDrawFooterCell(Rect,DataCol,Row,Column,State);
end;

procedure TForm1.DBGridEH2GetCellParams(Sender: TObject; Column: TColumnEH;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if Query1.FieldByName('IQty').Text = '17' then
    AFont.Style := AFont.Style + [fsBold];
end;

procedure TForm1.DBGridEH2GetFooterParams(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEH; AFont: TFont; var Background: TColor;
  var Alignment: TAlignment; State: TGridDrawState; var Text: String);
begin
  if (Column.Field.FieldName = 'PDescription') then Text := 'Qty = ' + Text
  else if (Column.Field.FieldName = 'VName') then Text := Text + ' records';
end;

procedure TForm1.tEmployeeCalcFields(DataSet: TDataSet);
begin
  if (tEmployeeSalary.AsFloat < 15000) then
    tEmployeeSalaryType.AsFloat := 5
  else if (tEmployeeSalary.AsFloat < 20000) then
    tEmployeeSalaryType.AsFloat := 4
  else if (tEmployeeSalary.AsFloat < 25000) then
    tEmployeeSalaryType.AsFloat := 3
  else if (tEmployeeSalary.AsFloat < 30000) then
    tEmployeeSalaryType.AsFloat := 2
  else if (tEmployeeSalary.AsFloat < 50000) then
    tEmployeeSalaryType.AsFloat := 1
  else
    tEmployeeSalaryType.AsFloat := 0;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  DBGridEH1.Columns[DBGridEH1.VisibleColumns.Count].Visible := True;
  if (DBGridEH1.Columns.Count = DBGridEH1.VisibleColumns.Count) then SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := True;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  DBGridEH1.VisibleColumns.Items[DBGridEH1.VisibleColumns.Count-1].Visible := False;
  if (DBGridEH1.VisibleColumns.Count = 0) then SpeedButton2.Enabled := False;
  SpeedButton1.Enabled := True;
end;

procedure TForm1.DBGridEH1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEH);
begin
{  case Column.Title.SortMarker of
    smNoneEh: Column.Title.SortMarker := smDownEh;
    smDownEh: Column.Title.SortMarker := smUpEh;
    smUpEh: Column.Title.SortMarker := smNoneEh;
  end;}
end;

procedure TForm1.cbClearSelectionClick(Sender: TObject);
begin
  if cbClearSelection.Checked then
    dbgList.OptionsEh := dbgList.OptionsEh + [dghClearSelection]
  else
    dbgList.OptionsEh := dbgList.OptionsEh - [dghClearSelection];
end;

procedure TForm1.cbShowIndicatorClick(Sender: TObject);
begin
  if cbShowIndicator.Checked then
    dbgList.Options := dbgList.Options + [dgIndicator]
  else
    dbgList.Options := dbgList.Options - [dgIndicator];
end;

procedure TForm1.cbTitleClick(Sender: TObject);
begin
  if cbTitle.Checked then
    dbgList.Options := dbgList.Options + [dgTitles]
  else
    dbgList.Options := dbgList.Options - [dgTitles];
end;

procedure TForm1.cbHighlightFocusClick(Sender: TObject);
begin
  if cbHighlightFocus.Checked then
    dbgList.OptionsEh := dbgList.OptionsEh + [dghHighlightFocus]
  else
    dbgList.OptionsEh := dbgList.OptionsEh - [dghHighlightFocus];
end;

procedure TForm1.cbMultiselectClick(Sender: TObject);
begin
  if cbMultiselect.Checked then
    dbgList.Options := dbgList.Options + [dgMultiselect]
  else
    dbgList.Options := dbgList.Options - [dgMultiselect];
end;

procedure TForm1.DBGridEH1SortMarkingChanged(Sender: TObject);
var i :Integer;
    s:String;
   function DeleteStr(str:String; sunstr:String): String;
   var i:Integer;
   begin
     i := Pos(sunstr,str);
     if i <> 0 then Delete(str,i,Length(sunstr));
     Result := str;
   end;
begin
  s := '';
  for i := 0 to DBGridEH1.SortMarkedColumns.Count-1 do
   if DBGridEH1.SortMarkedColumns[i].Title.SortMarker = smUpEh then
     s := s + DBGridEH1.SortMarkedColumns[i].FieldName + ' DESC , '
   else
     s := s + DBGridEH1.SortMarkedColumns[i].FieldName + ', ';
  if s <> '' then s := ' ORDER BY ' + Copy(s,1,Length(s)-2);
  s := DeleteStr(s,'1');
  Query1.SQL.Strings[Query1.SQL.Count-2] := s;
  Query1.Close;
  Query1.Open;
end;

procedure TForm1.bPreviewClick(Sender: TObject);
begin
  PrintDBGridEh1.Preview;
end;

procedure TForm1.bInpPreviewClick(Sender: TObject);
begin
  DBGridEH1.Visible := False;
  Panel1.Visible := False;
  PreviewBox1.Visible := True;
  PreviewSetupPanel.Visible := True;
  PreviewBox1.Printer.PrinterSetupOwner := DBGridEH1;
  PreviewBox1.Printer.OnPrinterSetupDialog := InplacePreviewSetupDialog;
  PrintDBGridEh1.PrintTo(PreviewBox1.Printer);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PreviewBox1.Align := alClient;
end;

procedure TForm1.bPrintClick(Sender: TObject);
begin
  PreviewBox1.PrintDialog;
end;

procedure TForm1.bPrinterSetupClick(Sender: TObject);
begin
  PreviewBox1.PrinterSetupDialog;
end;

procedure TForm1.bPrevPageClick(Sender: TObject);
begin
  PreviewBox1.PageIndex := Pred(PreviewBox1.PageIndex);
end;

procedure TForm1.bStopClick(Sender: TObject);
begin
  PreviewBox1.Printer.Abort;
end;

procedure TForm1.PreviewBox1PrinterPreviewChanged(Sender: TObject);
begin
  bStop.Enabled := PreviewBox1.Printer.Printing;
  bClosePreview.Enabled := not PreviewBox1.Printer.Printing;
  bPrint.Enabled := not PreviewBox1.Printer.Printing;
  bPrinterSetup.Enabled := not PreviewBox1.Printer.Printing;
  bPrevPage.Enabled:=PreviewBox1.PageIndex>1;
  bNextPage.Enabled:=PreviewBox1.PageIndex<PreviewBox1.PageCount;
  lPageInfo.Caption := 'Page '+IntToStr(PreviewBox1.PageIndex)+' of '+IntToStr(PreviewBox1.PageCount);
end;

procedure TForm1.bClosePreviewClick(Sender: TObject);
begin
    PreviewBox1.Visible := False;
    PreviewSetupPanel.Visible := False;
    Panel1.Visible := True;
    DBGridEH1.Visible := True;
end;

procedure TForm1.bNextPageClick(Sender: TObject);
begin
  PreviewBox1.PageIndex := Succ(PreviewBox1.PageIndex);
end;


procedure TForm1.InplacePreviewSetupDialog(Sender: TObject);
begin
  PreviewBox1.Printer.OnPrinterSetupDialog := InplacePreviewSetupDialog;
  PreviewBox1.Printer.PrinterSetupOwner := DBGridEh1;
  if PrintDBGridEh1.PrinterSetupDialog then
    PrintDBGridEh1.PrintTo(PreviewBox1.Printer);
end;

procedure TForm1.cCustomPreviewClick(Sender: TObject);
var
  FormImage: TBitmap;
  Info: PBitmapInfo;
  InfoSize: DWORD;
  Image: Pointer;
  ImageSize: DWORD;
  Bits: HBITMAP;
  DIBWidth, DIBHeight: Longint;
  PrintWidth, PrintHeight: Longint;
  StdPrinterPreview:TPrinterPreview;
  i:Integer;
begin
  StdPrinterPreview := SetPrinterPreview(fCustomPreview.PreviewBox1.Printer);
  try
  PrinterPreview.BeginDoc;
  try
    i := 0;
    while True do begin
      PageControl1.ActivePage := PageControl1.Pages[i];
      FormImage := GetFormImage;
      Canvas.Lock;
      try
        { Paint bitmap to the printer }
        with PrinterPreview, Canvas do
        begin
          Bits := FormImage.Handle;
          GetDIBSizes(Bits, InfoSize, ImageSize);
          Info := AllocMem(InfoSize);
          try
            Image := AllocMem(ImageSize);
            try
              GetDIB(Bits, 0, Info^, Image^);
              with Info^.bmiHeader do
              begin
                DIBWidth := biWidth;
                DIBHeight := biHeight;
              end;
              case PrintScale of
                poProportional:
                  begin
                    PrintWidth := MulDiv(DIBWidth, GetDeviceCaps(Handle,
                      LOGPIXELSX), PixelsPerInch);
                    PrintHeight := MulDiv(DIBHeight, GetDeviceCaps(Handle,
                      LOGPIXELSY), PixelsPerInch);
                  end;
                poPrintToFit:
                  begin
                    PrintWidth := MulDiv(DIBWidth, PagEheight, DIBHeight);
                    if PrintWidth < PageWidth then
                      PrintHeight := PagEheight
                    else
                    begin
                      PrintWidth := PageWidth;
                      PrintHeight := MulDiv(DIBHeight, PageWidth, DIBWidth);
                    end;
                  end;
              else
                PrintWidth := DIBWidth;
                PrintHeight := DIBHeight;
              end;
              StretchDIBits(Canvas.Handle, 0, 0, PrintWidth, PrintHeight, 0, 0,
                DIBWidth, DIBHeight, Image, Info^, DIB_RGB_COLORS, SRCCOPY);
            finally
              FreeMem(Image, ImageSize);
            end;
          finally
            FreeMem(Info, InfoSize);
          end;
        end;
      finally
        Canvas.Unlock;
        FormImage.Free;
      end;
      Inc(i);
      if PageControl1.PageCount = i then Exit;
      PrinterPreview.NewPage;
    end;
  finally
    PrinterPreview.EndDoc;
  end;
  finally
    SetPrinterPreview(StdPrinterPreview);
    PageControl1.ActivePage := PageControl1.Pages[0];
  end;
end;

end.
