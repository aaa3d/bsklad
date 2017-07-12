{******************************************}
{ }
{ FastReport v3.0 }
{ Standard Report wizard }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxStdWizard;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, frxClass, frxDesgn;

type
  TfrxStdWizard = class(TfrxCustomWizard)
  public
    class function GetDescription:String; override;
    function Execute:Boolean; override;
  end;

  TfrxDotMatrixWizard = class(TfrxCustomWizard)
  public
    class function GetDescription:String; override;
    function Execute:Boolean; override;
  end;

  TfrxStdEmptyWizard = class(TfrxCustomWizard)
  public
    class function GetDescription:String; override;
    function Execute:Boolean; override;
  end;

  TfrxDMPEmptyWizard = class(TfrxCustomWizard)
  public
    class function GetDescription:String; override;
    function Execute:Boolean; override;
  end;

  TfrxStdWizardForm = class(TForm)
    Pages:TPageControl;
    DataTab:TTabSheet;
    GroupsTab:TTabSheet;
    LayoutTab:TTabSheet;
    DatasetsCB:TComboBox;
    FieldsLB:TListBox;
    AddFieldB:TSpeedButton;
    AddAllFieldsB:TSpeedButton;
    RemoveFieldB:TSpeedButton;
    RemoveAllFieldsB:TSpeedButton;
    SelectedFieldsLB:TListBox;
    SelectedFieldsL:TLabel;
    FieldUpB:TSpeedButton;
    FieldDownB:TSpeedButton;
    AvailableFieldsLB:TListBox;
    AddGroupB:TSpeedButton;
    RemoveGroupB:TSpeedButton;
    GroupsLB:TListBox;
    GroupsL:TLabel;
    GroupUpB:TSpeedButton;
    GroupDownB:TSpeedButton;
    AvailableFieldsL:TLabel;
    BackB:TButton;
    NextB:TButton;
    CancelB:TButton;
    FinishB:TButton;
    FitWidthCB:TCheckBox;
    Step1L:TLabel;
    Step2L:TLabel;
    Step3L:TLabel;
    StyleTab:TTabSheet;
    Step4L:TLabel;
    ScrollBox1:TScrollBox;
    PaintBox:TPaintBox;
    StyleLB:TListBox;
    OrientationL:TGroupBox;
    LayoutL:TGroupBox;
    PortraitImg:TImage;
    LandscapeImg:TImage;
    PortraitRB:TRadioButton;
    LandscapeRB:TRadioButton;
    TabularRB:TRadioButton;
    ColumnarRB:TRadioButton;
    procedure FormCreate(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure DatasetsCBClick(Sender:TObject);
    procedure AddFieldBClick(Sender:TObject);
    procedure AddAllFieldsBClick(Sender:TObject);
    procedure RemoveFieldBClick(Sender:TObject);
    procedure RemoveAllFieldsBClick(Sender:TObject);
    procedure AddGroupBClick(Sender:TObject);
    procedure RemoveGroupBClick(Sender:TObject);
    procedure FieldUpBClick(Sender:TObject);
    procedure FieldDownBClick(Sender:TObject);
    procedure GroupUpBClick(Sender:TObject);
    procedure GroupDownBClick(Sender:TObject);
    procedure NextBClick(Sender:TObject);
    procedure BackBClick(Sender:TObject);
    procedure GroupsTabShow(Sender:TObject);
    procedure PaintBoxPaint(Sender:TObject);
    procedure PortraitRBClick(Sender:TObject);
    procedure PagesChange(Sender:TObject);
    procedure StyleLBClick(Sender:TObject);
    procedure FinishBClick(Sender:TObject);
  private
    FDesigner:TfrxDesignerForm;
    FDotMatrix:Boolean;
    FReport:TfrxReport;
    FSampleReport:TfrxReport;
    FStyleSheet:TfrxStyleSheet;
    procedure FillDatasets;
    procedure FillFields;
    procedure UpdateAvailableFields;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.DFM}
{$R *.RES}

uses frxDsgnIntf, frxRes, frxUtils, frxDMPClass, Printers;

const
  SampleReport =
'<?xml version="1.0" encoding="utf-8"?>'+
'<TfrxReport>'+
'<TfrxReportPage>'+
'<TfrxMemoView Width="439,65337" Height="26" HAlign="haCenter" Memo.Text="Customers" Style="Title" VAlign="vaCenter"/>'+
'<TfrxMemoView Top="36" Width="253" Height="20" Style="Header line"/>'+
'<TfrxMemoView Top="36" Width="126,96846" Height="20" Memo.Text="Company" Style="Header"/>'+
'<TfrxMemoView Left="137,74799" Top="36" Width="126,2047" Height="20" Memo.Text="Address" Style="Header"/>'+
'<TfrxMemoView Top="60,47248" Width="264,5671" Height="26,45671" Memo.Text="Action Club" Style="Group header" VAlign="vaCenter"/>'+
'<TfrxMemoView Top="92" Width="126,96846" Height="20" Memo.Text="Action Club" Style="Data"/>'+
'<TfrxMemoView Left="137,74799" Top="92" Width="126,2047" Height="20" Memo.Text="PO Box 5451-F" Style="Data"/>'+
'<TfrxMemoView Top="112" Width="126,96846" Height="20" Memo.Text="Action Diver Supply" Style="Data"/>'+
'<TfrxMemoView Left="137,74799" Top="112" Width="126,2047" Height="20" Memo.Text="Blue Spar Box #3" Style="Data"/>'+
'<TfrxMemoView Top="132" Width="126,96846" Height="20" Memo.Text="Adventure Undersea" Style="Data"/>'+
'<TfrxMemoView Left="137,74799" Top="132" Width="126,2047" Height="20" Memo.Text="PO Box 744" Style="Data"/>'+
'<TfrxMemoView Top="157,98423" Width="264,47248" Height="18" Memo.Text="Count:3" Style="Group footer"/>'+
'</TfrxReportPage>'+
'</TfrxReport>';

  Style =
'<?xml version="1.0" encoding="utf-8"?>'+
'<stylesheet>'+
'<style Name="FastReport">'+
'<item Name="Title" Color="8388608" Font.Color="16777215" Font.Height="-16" Font.Style="1"/>'+
'<item Name="Header" Color="536870911" Font.Color="128" Font.Style="1"/>'+
'<item Name="Group header" Color="15790320" Font.Style="1"/>'+
'<item Name="Data" Color="536870911"/>'+
'<item Name="Group footer" Color="536870911" Font.Style="1"/>'+
'<item Name="Header line" Color="536870911" Frame.Typ="8" Frame.Width="2"/>'+
'</style>'+
'<style Name="Standard">'+
'<item Name="Title" Color="536870911" Font.Height="-16" Font.Style="1"/>'+
'<item Name="Header" Color="536870911" Font.Style="1"/>'+
'<item Name="Group header" Color="536870911" Frame.Typ="8"/>'+
'<item Name="Data" Color="536870911"/>'+
'<item Name="Group footer" Color="536870911" Frame.Typ="4"/>'+
'<item Name="Header line" Color="536870911" Frame.Typ="8" Frame.Width="2"/>'+
'</style>'+
'<style Name="Soft gray">'+
'<item Name="Title" Color="14211288" Font.Height="-16" Font.Style="1"/>'+
'<item Name="Header" Color="15790320" Font.Style="1"/>'+
'<item Name="Group header" Color="15790320" Font.Style="1"/>'+
'<item Name="Data" Color="536870911" Font.Style="0"/>'+
'<item Name="Group footer" Color="536870911" Frame.Typ="4"/>'+
'<item Name="Header line" Color="536870911" Frame.Width="2"/>'+
'</style>'+
'<style Name="Corporate">'+
'<item Name="Title" Color="0" Font.Color="16777215" Font.Height="-16" Font.Style="1"/>'+
'<item Name="Header" Color="0" Font.Color="16777215" Font.Style="1"/>'+
'<item Name="Group header" Color="52479" Font.Style="1"/>'+
'<item Name="Data" Color="536870911"/>'+
'<item Name="Group footer" Color="536870911" Font.Style="1"/>'+
'<item Name="Header line" Color="536870911" Frame.Width="2"/>'+
'</style>'+
'</stylesheet>';

{ TfrxStdWizard }

class function TfrxStdWizard.GetDescription:String;
begin
  Result:= frxResources.Get('wzStd');
end;

function TfrxStdWizard.Execute:Boolean;
begin
  with TfrxStdWizardForm.Create(Owner) do
  begin
    FDesigner:= TfrxDesignerForm(Self.Designer);
    FReport:= Report;
    Result:= ShowModal = mrOk;
    Free;
  end;
end;

{ TfrxDotMatrixWizard }

class function TfrxDotMatrixWizard.GetDescription:String;
begin
  Result:= frxResources.Get('wzDMP');
end;

function TfrxDotMatrixWizard.Execute:Boolean;
begin
  with TfrxStdWizardForm.Create(Owner) do
  begin
    FDesigner:= TfrxDesignerForm(Self.Designer);
    FDotMatrix:= True;
    FReport:= Report;
    Result:= ShowModal = mrOk;
    Free;
  end;
end;

{ TfrxStdEmptyWizard }

class function TfrxStdEmptyWizard.GetDescription:String;
begin
  Result:= frxResources.Get('wzStdEmpty');
end;

function TfrxStdEmptyWizard.Execute:Boolean;
var
  Page:TfrxReportPage;
begin
  Result:= True;
  try
    Designer.Lock;
    Report.Clear;
    Report.FileName:= '';
    Report.DotMatrixReport:= False;

    Page:= TfrxReportPage.Create(Report);
    Page.Name:= 'Page1';
    Page.SetDefaults;
  finally
    Designer.ReloadReport;
  end;
end;

{ TfrxDMPEmptyWizard }

class function TfrxDMPEmptyWizard.GetDescription:String;
begin
  Result:= frxResources.Get('wzDMPEmpty');
end;

function TfrxDMPEmptyWizard.Execute:Boolean;
var
  Page:TfrxReportPage;
begin
  Result:= True;
  try
    Designer.Lock;
    Report.Clear;
    Report.FileName:= '';
    Report.DotMatrixReport:= True;

    Page:= TfrxDMPPage.Create(Report);
    Page.Name:= 'Page1';
    Page.SetDefaults;
  finally
    Designer.ReloadReport;
  end;
end;

{ TfrxStdWizardForm }

constructor TfrxStdWizardForm.Create(AOwner:TComponent);
var
  s:TStringStream;
begin
  inherited;
  FSampleReport:= TfrxReport.Create(nil);
  s:= TStringStream.Create(SampleReport);
  FSampleReport.LoadFromStream(s);
  s.Free;

  FStyleSheet:= TfrxStyleSheet.Create;
  if FileExists(ExtractFilePath(Application.ExeName)+'wizstyle.xml') then
    FStyleSheet.LoadFromFile(ExtractFilePath(Application.ExeName)+'wizstyle.xml')
  else
  begin
    s:= TStringStream.Create(Style);
    FStyleSheet.LoadFromStream(s);
    s.Free;
  end;
end;

destructor TfrxStdWizardForm.Destroy;
begin
  FSampleReport.Free;
  FStyleSheet.Free;
  inherited;
end;

procedure TfrxStdWizardForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

procedure TfrxStdWizardForm.FormShow(Sender:TObject);
begin
  FillDatasets;
  DatasetsCB.ItemIndex:= 0;
  DatasetsCBClick(nil);

  FStyleSheet.GetList(StyleLB.Items);
  StyleLB.ItemIndex:= 0;
  StyleLBClick(nil);

  if FDotMatrix then
    StyleTab.Free;
end;

procedure TfrxStdWizardForm.FillDatasets;
var
  i:Integer;
  ds:TfrxDataSet;
  dsList:TStrings;
begin
  dsList:= TStringList.Create;
  frxGetComponents(FReport, TfrxDataSet, dsList, nil);
  DatasetsCB.Clear;

  for i:= 0 to dsList.Count-1 do
  begin
    ds:= TfrxDataSet(dsList.Objects[i]);
    if ds is TfrxCustomDBDataSet then
      DatasetsCB.Items.AddObject(ds.UserName, ds);
  end;

  dsList.Free;
end;

procedure TfrxStdWizardForm.FillFields;
var
  ds:TfrxDataSet;
begin
  FieldsLB.Clear;
  SelectedFieldsLB.Clear;
  UpdateAvailableFields;

  if DatasetsCB.ItemIndex<>-1 then
  begin
    ds:= TfrxDataSet(DatasetsCB.Items.Objects[DatasetsCB.ItemIndex]);
    ds.GetFieldList(FieldsLB.Items);
  end;

  FieldsLB.SetFocus;
  if FieldsLB.Items.Count<>0 then
  begin
    FieldsLB.ItemIndex:= 0;
    FieldsLB.Selected[0]:= True;
  end;
end;

procedure TfrxStdWizardForm.UpdateAvailableFields;
begin
  AvailableFieldsLB.Items:= SelectedFieldsLB.Items;
  GroupsLB.Clear;
end;

procedure TfrxStdWizardForm.DatasetsCBClick(Sender:TObject);
begin
  FillFields;
end;

procedure TfrxStdWizardForm.AddFieldBClick(Sender:TObject);
var
  i, j:Integer;
begin
  if FieldsLB.ItemIndex =-1 then Exit;

  i:= 0;
  j:=-1;
  while i < FieldsLB.Items.Count do
    if FieldsLB.Selected[i] then
    begin
      if j =-1 then
        j:= i;
      SelectedFieldsLB.Items.Add(FieldsLB.Items[i]);
      FieldsLB.Items.Delete(i);
    end
    else
      Inc(i);

  if j = FieldsLB.Items.Count then
    Dec(j);
  if j<>-1 then
  begin
    FieldsLB.ItemIndex:= j;
    FieldsLB.Selected[j]:= True;
  end;

  UpdateAvailableFields;
end;

procedure TfrxStdWizardForm.AddAllFieldsBClick(Sender:TObject);
begin
  if FieldsLB.Items.Count = 0 then Exit;
  FillFields;
  SelectedFieldsLB.Items:= FieldsLB.Items;
  FieldsLB.Items.Clear;
  UpdateAvailableFields;
end;

procedure TfrxStdWizardForm.RemoveFieldBClick(Sender:TObject);
var
  i, j:Integer;
begin
  if SelectedFieldsLB.ItemIndex =-1 then Exit;

  i:= 0;
  j:=-1;
  while i < SelectedFieldsLB.Items.Count do
    if SelectedFieldsLB.Selected[i] then
    begin
      if j =-1 then
        j:= i;
      FieldsLB.Items.Add(SelectedFieldsLB.Items[i]);
      SelectedFieldsLB.Items.Delete(i);
    end
    else
      Inc(i);

  if j = SelectedFieldsLB.Items.Count then
    Dec(j);
  if j<>-1 then
  begin
    SelectedFieldsLB.ItemIndex:= j;
    SelectedFieldsLB.Selected[j]:= True;
  end;

  UpdateAvailableFields;
end;

procedure TfrxStdWizardForm.RemoveAllFieldsBClick(Sender:TObject);
begin
  FillFields;
end;

procedure TfrxStdWizardForm.AddGroupBClick(Sender:TObject);
var
  i:Integer;
begin
  i:= AvailableFieldsLB.ItemIndex;
  if i =-1 then Exit;
  GroupsLB.Items.Add(AvailableFieldsLB.Items[i]);
  AvailableFieldsLB.Items.Delete(i);
  AvailableFieldsLB.ItemIndex:= i;
end;

procedure TfrxStdWizardForm.RemoveGroupBClick(Sender:TObject);
var
  i:Integer;
begin
  i:= GroupsLB.ItemIndex;
  if i =-1 then Exit;
  AvailableFieldsLB.Items.Add(GroupsLB.Items[i]);
  GroupsLB.Items.Delete(i);
  GroupsLB.ItemIndex:= i;
end;

procedure TfrxStdWizardForm.FieldUpBClick(Sender:TObject);
var
  i:Integer;
begin
  i:= SelectedFieldsLB.ItemIndex;
  if i < 1 then Exit;
  SelectedFieldsLB.Items.Exchange(i, i-1);
  UpdateAvailableFields;
end;

procedure TfrxStdWizardForm.FieldDownBClick(Sender:TObject);
var
  i:Integer;
begin
  i:= SelectedFieldsLB.ItemIndex;
  if (i =-1) or (SelectedFieldsLB.Items.Count = 0) or
    (i = SelectedFieldsLB.Items.Count-1) then Exit;
  SelectedFieldsLB.Items.Exchange(i, i+1);
  SelectedFieldsLB.ItemIndex:= i+1;
  UpdateAvailableFields;
end;

procedure TfrxStdWizardForm.GroupUpBClick(Sender:TObject);
var
  i:Integer;
begin
  i:= GroupsLB.ItemIndex;
  if i < 1 then Exit;
  GroupsLB.Items.Exchange(i, i-1);
end;

procedure TfrxStdWizardForm.GroupDownBClick(Sender:TObject);
var
  i:Integer;
begin
  i:= GroupsLB.ItemIndex;
  if (i =-1) or (i = GroupsLB.Items.Count-1) then Exit;
  GroupsLB.Items.Exchange(i, i+1);
  GroupsLB.ItemIndex:= i+1;
end;

procedure TfrxStdWizardForm.NextBClick(Sender:TObject);
begin
  Pages.SelectNextPage(True);
  PagesChange(nil);
end;

procedure TfrxStdWizardForm.BackBClick(Sender:TObject);
begin
  Pages.SelectNextPage(False);
  PagesChange(nil);
end;

procedure TfrxStdWizardForm.PagesChange(Sender:TObject);
begin
  if not FDotMatrix then
    NextB.Enabled:= Pages.ActivePage<>StyleTab else
    NextB.Enabled:= Pages.ActivePage<>LayoutTab;
  BackB.Enabled:= Pages.ActivePage<>DataTab;
end;

procedure TfrxStdWizardForm.GroupsTabShow(Sender:TObject);
begin
  AvailableFieldsLB.ItemIndex:= 0;
end;

procedure TfrxStdWizardForm.PaintBoxPaint(Sender:TObject);
var
  i:Integer;
  c:TfrxComponent;
begin
  with PaintBox.Canvas do
  begin
    Pen.Color:= clBlack;
    Brush.Color:= clWindow;
    Rectangle(0, 0, PaintBox.Width, PaintBox.Height);

    for i:= 0 to FSampleReport.AllObjects.Count-1 do
    begin
      c:= FSampleReport.AllObjects[i];
      if c is TfrxCustomMemoView then
        with TfrxCustomMemoView(c) do
          Draw(PaintBox.Canvas, 1, 1, 10, 10);
    end;
  end;
end;

procedure TfrxStdWizardForm.PortraitRBClick(Sender:TObject);
begin
  PortraitImg.Visible:= PortraitRB.Checked;
  LandscapeImg.Visible:= LandscapeRB.Checked;
end;

procedure TfrxStdWizardForm.StyleLBClick(Sender:TObject);
begin
  FSampleReport.Styles:= FStyleSheet.Find(StyleLB.Items[StyleLB.ItemIndex]);
  PaintBoxPaint(nil);
end;

procedure TfrxStdWizardForm.FinishBClick(Sender:TObject);
var
  DataSet:TfrxDataSet;
  Page:TfrxReportPage;
  Band:TfrxBand;
  Memo:TfrxCustomMemoView;
  CurY, PageWidth, MaxHeaderWidth:Extended;
  Widths, HeaderWidths, DataWidths:array of Extended;

  function Duplicate(n:Integer):String;
  begin
    Result:= '';
    SetLength(Result, n);
    FillChar(Result[1], n, '0');
  end;

  function CreateMemo(Parent:TfrxComponent):TfrxCustomMemoView;
  begin
    if FDotMatrix then
      Result:= TfrxDMPMemoView.Create(Parent) else
      Result:= TfrxMemoView.Create(Parent);
    if Parent<>nil then
      Result.CreateUniqueName;
  end;

  procedure CreatePage;
  begin
    if FDotMatrix then
      Page:= TfrxDMPPage.Create(FReport) else
      Page:= TfrxReportPage.Create(FReport);
    Page.Name:= 'Page1';
    Page.SetDefaults;
    if PortraitRB.Checked then
      Page.Orientation:= poPortrait else
      Page.Orientation:= poLandscape;
    PageWidth:= (Page.PaperWidth-Page.LeftMargin-Page.RightMargin) * 96 / 25.4;
  end;

  procedure CreateWidthsArray;
  var
    i, FieldsCount:Integer;
    HeaderMemo, DataMemo:TfrxCustomMemoView;
    MaxWidth, HeadersWidth, GapWidth:Extended;
    Style:TfrxStyles;
  begin
    FieldsCount:= AvailableFieldsLB.Items.Count;
    SetLength(Widths, FieldsCount);
    SetLength(HeaderWidths, FieldsCount);
    SetLength(DataWidths, FieldsCount);

    HeaderMemo:= CreateMemo(nil);
    DataMemo:= CreateMemo(nil);
    if not FDotMatrix then
    begin
      Style:= FStyleSheet.Find(StyleLB.Items[StyleLB.ItemIndex]);
      HeaderMemo.ApplyStyle(Style.Find('Header'));
      DataMemo.ApplyStyle(Style.Find('Data'));
    end;

    MaxWidth:= 0;
    HeadersWidth:= 0;
    MaxHeaderWidth:= 0;
    GapWidth:= 0;
    for i:= 0 to FieldsCount-1 do
    begin
      HeaderMemo.Text:= AvailableFieldsLB.Items[i];
      DataMemo.Text:= Duplicate(DataSet.DisplayWidth[AvailableFieldsLB.Items[i]]);
      HeaderWidths[i]:= HeaderMemo.CalcWidth;
      DataWidths[i]:= DataMemo.CalcWidth;
      if HeaderWidths[i] > DataWidths[i] then
        Widths[i]:= HeaderWidths[i]
      else
      begin
        Widths[i]:= DataWidths[i];
        GapWidth:= GapWidth+DataWidths[i]-HeaderWidths[i];
      end;
      MaxWidth:= MaxWidth+Widths[i];
      HeadersWidth:= HeadersWidth+HeaderWidths[i];
      if HeaderWidths[i] > MaxHeaderWidth then
        MaxHeaderWidth:= HeaderWidths[i];
    end;

    if FitWidthCB.Checked and (MaxWidth > PageWidth) then
    begin
      if HeadersWidth > PageWidth then
      begin
        for i:= 0 to FieldsCount-1 do
          Widths[i]:= HeaderWidths[i] / (HeadersWidth / PageWidth);
      end
      else
      begin
        for i:= 0 to FieldsCount-1 do
          if HeaderWidths[i] < DataWidths[i] then
            Widths[i]:= Widths[i]-(DataWidths[i]-HeaderWidths[i]) /
              GapWidth * (MaxWidth-PageWidth);
      end;
    end;

    HeaderMemo.Free;
    DataMemo.Free;
  end;

  procedure CreateTitle;
  begin
    Band:= TfrxReportTitle.Create(Page);
    Band.CreateUniqueName;
    Band.SetBounds(0, 0, 0, fr01cm * 7);
    CurY:= 30;

    Memo:= CreateMemo(Band);
    Memo.SetBounds(0, 0, 0, fr01cm * 6);
    Memo.Align:= baWidth;
    Memo.HAlign:= haCenter;
    Memo.VAlign:= vaCenter;
    Memo.Text:= 'Report';
    Memo.Style:= 'Title';
  end;

  procedure CreateHeader;
  var
    i:Integer;
    X, Y:Extended;
    HeaderMemo:TfrxCustomMemoView;
  begin
    if ColumnarRB.Checked then Exit;

    Band:= TfrxPageHeader.Create(Page);
    Band.CreateUniqueName;
    Band.SetBounds(0, CurY, 0, fr01cm * 7);

    HeaderMemo:= CreateMemo(Band);
    HeaderMemo.SetBounds(0, 0, PageWidth, 0);
    HeaderMemo.Style:= 'Header line';

    X:= 0;
    Y:= 0;
    for i:= 0 to AvailableFieldsLB.Items.Count-1 do
    begin
      if X+Widths[i] > PageWidth+1 then
      begin
        X:= 0;
        Y:= Y+fr01cm * 6;
      end;

      Memo:= CreateMemo(Band);
      Memo.SetBounds(X, Y, Widths[i], fr01cm * 6);
      Memo.Text:= AvailableFieldsLB.Items[i];
      Memo.Style:= 'Header';

      X:= X+Widths[i];
    end;

    Band.Height:= Y+fr01cm * 6;
    HeaderMemo.Height:= Band.Height;
    if FDotMatrix then
      HeaderMemo.Free;
    CurY:= CurY+Band.Height;
  end;

  procedure CreateGroupHeaders;
  var
    i:Integer;
  begin
    for i:= 0 to GroupsLB.Items.Count-1 do
    begin
      Band:= TfrxGroupHeader.Create(Page);
      Band.CreateUniqueName;
      Band.SetBounds(0, CurY, 0, fr01cm * 7);
      TfrxGroupHeader(Band).Condition:= DataSet.UserName+'."'+GroupsLB.Items[i]+'"';
      CurY:= CurY+30;

      Memo:= CreateMemo(Band);
      Memo.SetBounds(0, 0, 0, fr01cm * 6);
      Memo.Align:= baWidth;
      Memo.VAlign:= vaCenter;
      Memo.DataSet:= DataSet;
      Memo.DataField:= GroupsLB.Items[i];
      Memo.Style:= 'Group header';
    end;
  end;

  procedure CreateData;
  var
    i:Integer;
    X, Y:Extended;
  begin
    Band:= TfrxMasterData.Create(Page);
    Band.CreateUniqueName;
    Band.SetBounds(0, CurY, 0, 0);
    TfrxMasterData(Band).DataSet:= DataSet;
    CurY:= CurY+30;

    X:= 0;
    Y:= 0;
    for i:= 0 to AvailableFieldsLB.Items.Count-1 do
    begin
      if ColumnarRB.Checked then
      begin
        Memo:= CreateMemo(Band);
        Memo.SetBounds(0, Y, MaxHeaderWidth, fr01cm * 5);
        Memo.Text:= AvailableFieldsLB.Items[i];
        Memo.Style:= 'Header';

        Memo:= CreateMemo(Band);
        Memo.SetBounds(MaxHeaderWidth+fr01cm * 5, Y, DataWidths[i], fr01cm * 5);
        Memo.DataSet:= DataSet;
        Memo.DataField:= AvailableFieldsLB.Items[i];
        Memo.Style:= 'Data';

        Y:= Y+fr01cm * 5;
      end
      else
      begin
        if X+Widths[i] > PageWidth+1 then
        begin
          X:= 0;
          Y:= Y+fr01cm * 5;
        end;

        Memo:= CreateMemo(Band);
        Memo.SetBounds(X, Y, Widths[i], fr01cm * 5);
        Memo.DataSet:= DataSet;
        Memo.DataField:= AvailableFieldsLB.Items[i];
        Memo.Style:= 'Data';

        X:= X+Widths[i];
      end;
    end;

    Band.Height:= Y+fr01cm * 5;
    CurY:= CurY+Band.Height;
  end;

  procedure CreateGroupFooters;
  var
    i:Integer;
  begin
    CurY:= 1000;
    for i:= GroupsLB.Items.Count-1 downto 0 do
    begin
      Band:= TfrxGroupFooter.Create(Page);
      Band.CreateUniqueName;
      Band.SetBounds(0, CurY, 0, 0);
      CurY:= CurY-30;
    end;
  end;

  procedure CreateFooter;
  begin
    Band:= TfrxPageFooter.Create(Page);
    Band.CreateUniqueName;
    Band.SetBounds(0, 1000, 0, fr01cm * 7);

    Memo:= CreateMemo(Band);
    Memo.Align:= baWidth;
    Memo.Frame.Typ:= [ftTop];
    Memo.Frame.Width:= 2;

    Memo:= CreateMemo(Band);
    Memo.SetBounds(0, 1, 0, fr01cm * 6);
    Memo.AutoWidth:= True;
    Memo.Text:= '[Date] [Time]';

    Memo:= CreateMemo(Band);
    Memo.SetBounds(100, 1, fr1cm * 2, fr01cm * 6);
    Memo.Align:= baRight;
    Memo.HAlign:= haRight;
    Memo.Text:= 'Page [Page#]';
  end;

begin
  try
    FDesigner.Lock;
    FReport.Clear;
    FReport.FileName:= '';
    FReport.DotMatrixReport:= FDotMatrix;

    DataSet:= nil;
    if DatasetsCB.ItemIndex<>-1 then
    begin
      DataSet:= TfrxDataSet(DatasetsCB.Items.Objects[DatasetsCB.ItemIndex]);
      FReport.DataSets.Add(DataSet);
    end;

    CreatePage;
    CreateWidthsArray;
    CreateTitle;
    CreateHeader;
    CreateGroupHeaders;
    CreateData;
    CreateGroupFooters;
    CreateFooter;

    if not FDotMatrix then
      FReport.Styles:= FStyleSheet.Find(StyleLB.Items[StyleLB.ItemIndex]);

  finally
    FDesigner.ReloadReport;
    Widths:= nil;
    HeaderWidths:= nil;
    DataWidths:= nil;
  end;
end;

var
  Bmp, Bmp1:TBitmap;

initialization
  Bmp:= TBitmap.Create;
  Bmp.LoadFromResourceName(hInstance, 'frxSTDWIZARD');
  frxWizards.Register(TfrxStdWizard, Bmp);
  frxWizards.Register(TfrxDotMatrixWizard, Bmp);
  Bmp1:= TBitmap.Create;
  Bmp1.LoadFromResourceName(hInstance, 'frxSTDWIZARD1');
  frxWizards.Register(TfrxStdEmptyWizard, Bmp1);
  frxWizards.Register(TfrxDMPEmptyWizard, Bmp1);

finalization
  frxWizards.Unregister(TfrxStdWizard);
  frxWizards.Unregister(TfrxDotMatrixWizard);
  frxWizards.Unregister(TfrxStdEmptyWizard);
  frxWizards.Unregister(TfrxDMPEmptyWizard);
  Bmp.Free;
  Bmp1.Free;

end.
