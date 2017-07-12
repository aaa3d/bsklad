{******************************************}
{ }
{ FastReport v3.0 }
{ Chart design editor }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxChartEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ExtCtrls, Buttons, frxClass, frxChart, frxCustomEditors,
  frxCtrls, frxInsp, frxDock, TeeProcs, TeEngine, Chart, Series, ComCtrls,
  ImgList
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxChartEditor = class(TfrxViewEditor)
  public
    function Edit:Boolean; override;
    function HasEditor:Boolean; override;
    procedure GetMenuItems; override;
    function Execute(Tag:Integer; Checked:Boolean):Boolean; override;
  end;

  TfrxChartEditorForm = class(TForm)
    OkB:TButton;
    Panel1:TPanel;
    InspSite:TPanel;
    ChartTree:TTreeView;
    Panel2:TPanel;
    ChartImages:TImageList;
    Image1:TImage;
    Popup:TPopupMenu;
    LineMI:TMenuItem;
    AreaMI:TMenuItem;
    PointMI:TMenuItem;
    BarMI:TMenuItem;
    HorizBarMI:TMenuItem;
    PieMI:TMenuItem;
    GanttMI:TMenuItem;
    FastLineMI:TMenuItem;
    TreePanel:TPanel;
    AddB:TSpeedButton;
    DeleteB:TSpeedButton;
    SourcePanel:TPanel;
    DBSourceRB:TRadioButton;
    FixedDataRB:TRadioButton;
    DBSourceP:TGroupBox;
    DatasetLbl:TLabel;
    X1Lbl:TLabel;
    Y1Lbl:TLabel;
    DatasetsCB:TComboBox;
    X1ValuesCB:TComboBox;
    Y1ValuesCB:TComboBox;
    FixedDataP:TGroupBox;
    X3Lbl:TLabel;
    Y3Lbl:TLabel;
    XValuesE:TEdit;
    YValuesE:TEdit;
    InsExpressionB1:TSpeedButton;
    InsExpressionB2:TSpeedButton;
    CancelB:TButton;
    OtherLbl:TGroupBox;
    ShowTopLbl:TLabel;
    CaptionLbl:TLabel;
    SortLbl:TLabel;
    TopNE:TEdit;
    TopNCaptionE:TEdit;
    SortCB:TComboBox;
    UpDown1:TUpDown;
    BandSourceP:TGroupBox;
    BandLbl:TLabel;
    X2Lbl:TLabel;
    Y2Lbl:TLabel;
    InsExpressionB3:TSpeedButton;
    InsExpressionB4:TSpeedButton;
    DatabandsCB:TComboBox;
    X2ValuesCB:TComboBox;
    Y2ValuesCB:TComboBox;
    BandSourceRB:TRadioButton;
    procedure FormShow(Sender:TObject);
    procedure ChartTreeClick(Sender:TObject);
    procedure AddBClick(Sender:TObject);
    procedure AddClick(Sender:TObject);
    procedure DeleteBClick(Sender:TObject);
    procedure InsExpressionB1Click(Sender:TObject);
    procedure InsExpressionB2Click(Sender:TObject);
    procedure DoClick(Sender:TObject);
    procedure FormCreate(Sender:TObject);
    procedure UpDown1Click(Sender:TObject; Button:TUDBtnType);
    procedure InsExpressionB3Click(Sender:TObject);
    procedure InsExpressionB4Click(Sender:TObject);
  private
    { Private declarations }
    FChart:TfrxChartView;
    FCurSeries:TfrxSeriesItem;
    FInspector:TfrxObjectInspector;
    FReport:TfrxReport;
    FUpdating:Boolean;
    procedure CalcWidth(RB:TRadioButton);
    procedure EnablePanel(P:TWinControl; E:Boolean);
    procedure FillDataFields;
    procedure FillDataFields1;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    property Chart:TfrxChartView read FChart write FChart;
  end;

implementation

uses frxDsgnIntf, frxUtils, GanttCh, frxRes;

{$R *.DFM}

type
  TSeriesClass = class of TChartSeries;
  THackControl = class(TControl);

const
  ChartSeries:array[0..7] of TSeriesClass =
    (TLineSeries, TAreaSeries, TPointSeries, TBarSeries, THorizBarSeries,
     TPieSeries, TGanttSeries, TFastLineSeries);

{ TfrxChartEditor }

function TfrxChartEditor.HasEditor:Boolean;
begin
  Result:= True;
end;

function TfrxChartEditor.Edit:Boolean;
begin
  with TfrxChartEditorForm.Create(Designer) do
  begin
    Chart.Assign(TfrxChartView(Component));
    Result:= ShowModal = mrOk;
    if Result then
      TfrxChartView(Component).Assign(Chart);
    Free;
  end;
end;

function TfrxChartEditor.Execute(Tag:Integer; Checked:Boolean):Boolean;
var
  i:Integer;
  c:TfrxComponent;
  v:TfrxChartView;
begin
  Result:= inherited Execute(Tag, Checked);
  for i:= 0 to Designer.SelectedObjects.Count-1 do
  begin
    c:= Designer.SelectedObjects[i];
    if (c is TfrxChartView) and not (rfDontModify in c.Restrictions) then
    begin
      v:= TfrxChartView(c);
      if Tag = 1 then
        v.Chart.View3D:= Checked
      else if Tag = 2 then
        v.Chart.AxisVisible:= Checked;
      Result:= True;
    end;
  end;
end;

procedure TfrxChartEditor.GetMenuItems;
var
  v:TfrxChartView;
begin
  v:= TfrxChartView(Component);
  AddItem(frxResources.Get('ch3D'), 1, v.Chart.View3D);
  AddItem(frxResources.Get('chAxis'), 2, v.Chart.AxisVisible);
  inherited;
end;

{ TfrxChartEditorForm }

constructor TfrxChartEditorForm.Create(AOwner:TComponent);
begin
  inherited;
  FReport:= TfrxCustomDesigner(AOwner).Report;
  FChart:= TfrxChartView.Create(FReport);
  FInspector:= TfrxObjectInspector.Create(Owner);
  with FInspector do
  begin
    SplitterPos:= InspSite.Width div 2;
    Box.Parent:= InspSite;
    Box.Align:= alClient;
  end;
  OnMouseWheelDown:= FInspector.FormMouseWheelDown;
  OnMouseWheelUp:= FInspector.FormMouseWheelUp;

  frxAssignImages(Image1.Picture.Bitmap, 16, 16, ChartImages);
  Image1.Free;
end;

destructor TfrxChartEditorForm.Destroy;
begin
  FChart.Free;
  inherited;
end;

procedure TfrxChartEditorForm.FormShow(Sender:TObject);

  procedure FillChartTree;
  var
    i, j, ind:Integer;
    n:TTreeNode;
  begin
    for i:= 0 to FChart.Chart.SeriesCount-1 do
    begin
      n:= ChartTree.Items.AddChild(ChartTree.Items[0], 'Series'+IntToStr(i+1));

      ind:= 9;
      for j:= 0 to 7 do
        if FChart.Chart.Series[i].ClassType = ChartSeries[j] then
        begin
          ind:= j+1;
          break;
        end;

      n.ImageIndex:= ind;
      n.SelectedIndex:= ind;
      n.StateIndex:= ind;
      n.Data:= FChart.Chart.Series[i];
    end;

    ChartTree.Items[0].Data:= FChart.Chart;
    ChartTree.FullExpand;
    ChartTree.Selected:= ChartTree.Items[0];
    ChartTreeClick(nil);
  end;

  procedure FillBandsList;
  var
    i:Integer;
    c:TfrxComponent;
  begin
    for i:= 0 to FReport.Designer.Objects.Count-1 do
    begin
      c:= FReport.Designer.Objects[i];
      if c is TfrxDataBand then
        DatabandsCB.Items.Add(c.Name);
    end;
  end;

begin
  FInspector.Inspect([FChart.Chart]);
  FillChartTree;
  FReport.GetDatasetList(DatasetsCB.Items);
  FillBandsList;

  CalcWidth(DBSourceRB);
  CalcWidth(BandSourceRB);
  CalcWidth(FixedDataRB);
  SortCB.Items.Add(frxResources.Get('chsoNone'));
  SortCB.Items.Add(frxResources.Get('chsoAscending'));
  SortCB.Items.Add(frxResources.Get('chsoDescending'));
end;

procedure TfrxChartEditorForm.ChartTreeClick(Sender:TObject);
var
  i:Integer;
begin
  i:= ChartTree.Selected.AbsoluteIndex-1;
  if i >= 0 then
    FCurSeries:= FChart.SeriesData[i] else
    FCurSeries:= nil;

  FInspector.Inspect([ChartTree.Selected.Data]);
  EnablePanel(SourcePanel, FCurSeries<>nil);
  DeleteB.Visible:= FCurSeries<>nil;

  if FCurSeries<>nil then
  begin
    FUpdating:= True;
    if FCurSeries.DataType = dtDBData then
    begin
      DBSourceRB.Checked:= True;
      EnablePanel(DBSourceP, True);
      EnablePanel(BandSourceP, False);
      EnablePanel(FixedDataP, False);
      X1ValuesCB.Text:= FCurSeries.XSource;
      Y1ValuesCB.Text:= FCurSeries.YSource;
      if FCurSeries.DataSet = nil then
        DatasetsCB.ItemIndex:=-1 else
        DatasetsCB.ItemIndex:= DatasetsCB.Items.IndexOf(
          FReport.GetAlias(FCurSeries.DataSet));
      FillDataFields;
    end
    else if FCurSeries.DataType = dtBandData then
    begin
      BandSourceRB.Checked:= True;
      EnablePanel(DBSourceP, False);
      EnablePanel(BandSourceP, True);
      EnablePanel(FixedDataP, False);
      X2ValuesCB.Text:= FCurSeries.XSource;
      Y2ValuesCB.Text:= FCurSeries.YSource;
      if FCurSeries.DataBand = nil then
        DatabandsCB.ItemIndex:=-1 else
        DatabandsCB.ItemIndex:= DatabandsCB.Items.IndexOf(FCurSeries.DataBand.Name);
      FillDataFields1;
    end
    else
    begin
      FixedDataRB.Checked:= True;
      EnablePanel(DBSourceP, False);
      EnablePanel(BandSourceP, False);
      EnablePanel(FixedDataP, True);
      XValuesE.Text:= FCurSeries.XSource;
      YValuesE.Text:= FCurSeries.YSource;
    end;

    TopNE.Text:= IntToStr(FCurSeries.TopN);
    TopNCaptionE.Text:= FCurSeries.TopNCaption;
    SortCB.ItemIndex:= Integer(FCurSeries.SortOrder);
    FUpdating:= False;
  end;
end;

procedure TfrxChartEditorForm.AddBClick(Sender:TObject);
var
  pt:TPoint;
begin
  ChartTree.SetFocus;
  pt:= AddB.ClientToScreen(Point(0, 24));
  Popup.Popup(pt.X, pt.Y);
end;

procedure TfrxChartEditorForm.AddClick(Sender:TObject);
var
  sc:TSeriesClass;
  s:TChartSeries;
  n:TTreeNode;
  ind:Integer;
  b:Boolean;
begin
  ind:= TMenuItem(Sender).Tag;
  sc:= ChartSeries[ind];
  s:= TChartSeries(sc.NewInstance);
  s.Create(FChart.Chart);
  FChart.Chart.AddSeries(s);
  FChart.SeriesData.Add;

  with FChart.Chart do
  begin
    b:= not (s is TPieSeries);
    View3DOptions.Orthogonal:= b;
    AxisVisible:= b;
    View3DWalls:= b;
  end;

  n:= ChartTree.Items.AddChild(ChartTree.Items[0], 'Series'+
    IntToStr(ChartTree.Items.Count));
  n.ImageIndex:= ind+1;
  n.SelectedIndex:= ind+1;
  n.StateIndex:= ind+1;
  n.Data:= s;
  ChartTree.Selected:= n;
  ChartTreeClick(nil);
end;

procedure TfrxChartEditorForm.DeleteBClick(Sender:TObject);
var
  s:TChartSeries;
begin
  ChartTree.SetFocus;
  s:= ChartTree.Selected.Data;
  s.Free;
  FCurSeries.Free;
  ChartTree.Selected.Free;
  ChartTree.Selected:= ChartTree.Items[0];
  ChartTreeClick(nil);
end;

procedure TfrxChartEditorForm.InsExpressionB1Click(Sender:TObject);
var
  s:String;
begin
  s:= TfrxCustomDesigner(Owner).InsertExpression('');
  if s<>'' then
  begin
    X1ValuesCB.Text:= s;
    X1ValuesCB.SetFocus;
  end;
end;

procedure TfrxChartEditorForm.InsExpressionB2Click(Sender:TObject);
var
  s:String;
begin
  s:= TfrxCustomDesigner(Owner).InsertExpression('');
  if s<>'' then
  begin
    Y1ValuesCB.Text:= s;
    Y1ValuesCB.SetFocus;
  end;
end;

procedure TfrxChartEditorForm.InsExpressionB3Click(Sender:TObject);
var
  s:String;
begin
  s:= TfrxCustomDesigner(Owner).InsertExpression('');
  if s<>'' then
  begin
    X2ValuesCB.Text:= s;
    X2ValuesCB.SetFocus;
  end;
end;

procedure TfrxChartEditorForm.InsExpressionB4Click(Sender:TObject);
var
  s:String;
begin
  s:= TfrxCustomDesigner(Owner).InsertExpression('');
  if s<>'' then
  begin
    Y2ValuesCB.Text:= s;
    Y2ValuesCB.SetFocus;
  end;
end;

procedure TfrxChartEditorForm.CalcWidth(RB:TRadioButton);
begin
  RB.Width:= Canvas.TextWidth(RB.Caption)+24;
end;

procedure TfrxChartEditorForm.EnablePanel(P:TWinControl; E:Boolean);
var
  i:Integer;
begin
  for i:= 0 to P.ControlCount-1 do
  begin
    THackControl(P.Controls[i]).Enabled:= E;
    if not E then
      if (P.Controls[i] is TEdit) or (P.Controls[i] is TComboBox) then
        THackControl(P.Controls[i]).Text:= '';
    if P.Controls[i] is TGroupBox then
      EnablePanel(TWinControl(P.Controls[i]), E);
  end;
end;

procedure TfrxChartEditorForm.FillDataFields;
var
  ds:TfrxDataSet;
  l:TStringList;
  i:Integer;
begin
  ds:= FReport.GetDataSet(DatasetsCB.Items[DatasetsCB.ItemIndex]);
  if ds = nil then
  begin
    X1ValuesCB.Items.Clear;
    Y1ValuesCB.Items.Clear;
  end
  else
  begin
    l:= TStringList.Create;
    try
      ds.GetFieldList(l);
      for i:= 0 to l.Count-1 do
        l[i]:= FReport.GetAlias(ds)+'."'+l[i]+'"';

      X1ValuesCB.Items:= l;
      Y1ValuesCB.Items:= l;
    finally
      l.Free;
    end;
  end;
end;

procedure TfrxChartEditorForm.FillDataFields1;
var
  db:TfrxDataBand;
  ds:TfrxDataSet;
  l:TStringList;
  i:Integer;
begin
  db:= TfrxDataBand(FReport.FindObject(DatabandsCB.Items[DatabandsCB.ItemIndex]));
  if db<>nil then
    ds:= db.DataSet
  else
    ds:= nil;
  if ds = nil then
  begin
    X2ValuesCB.Items.Clear;
    Y2ValuesCB.Items.Clear;
  end
  else
  begin
    l:= TStringList.Create;
    try
      ds.GetFieldList(l);
      for i:= 0 to l.Count-1 do
        l[i]:= FReport.GetAlias(ds)+'."'+l[i]+'"';

      X2ValuesCB.Items:= l;
      Y2ValuesCB.Items:= l;
    finally
      l.Free;
    end;
  end;
end;

procedure TfrxChartEditorForm.DoClick(Sender:TObject);
begin
  if FUpdating then Exit;
  FUpdating:= True;

  case TControl(Sender).Tag of
    1:// DBSourceRB
      begin
        DBSourceRB.Checked:= True;
        FCurSeries.DataType:= dtDBData;
        FCurSeries.XSource:= '';
        FCurSeries.YSource:= '';
        EnablePanel(DBSourceP, True);
        EnablePanel(BandSourceP, False);
        EnablePanel(FixedDataP, False);
      end;

    2:// DatasetsCB
      begin
        FillDataFields;
        FCurSeries.DataSet:= FReport.GetDataSet(DatasetsCB.Items[DatasetsCB.ItemIndex]);
      end;

    3:// X1ValuesCB
      begin
        FCurSeries.XSource:= X1ValuesCB.Text;
      end;

    4:// Y1ValuesCB
      begin
        FCurSeries.YSource:= Y1ValuesCB.Text;
      end;

    5:// BandSourceRB
      begin
        BandSourceRB.Checked:= True;
        FCurSeries.DataType:= dtBandData;
        FCurSeries.XSource:= '';
        FCurSeries.YSource:= '';
        EnablePanel(DBSourceP, False);
        EnablePanel(BandSourceP, True);
        EnablePanel(FixedDataP, False);
      end;

    6:// DatabandsCB
      begin
        FillDataFields1;
        FCurSeries.DataBand:=
          TfrxDataBand(FReport.FindObject(DatabandsCB.Items[DatabandsCB.ItemIndex]));
      end;

    7:// X2ValuesCB
      begin
        FCurSeries.XSource:= X2ValuesCB.Text;
      end;

    8:// Y2ValuesCB
      begin
        FCurSeries.YSource:= Y2ValuesCB.Text;
      end;

    9:// FixedDataRB
      begin
        FixedDataRB.Checked:= True;
        FCurSeries.DataType:= dtFixedData;
        FCurSeries.XSource:= '';
        FCurSeries.YSource:= '';
        EnablePanel(DBSourceP, False);
        EnablePanel(BandSourceP, False);
        EnablePanel(FixedDataP, True);
      end;

    10:// XValuesE
      begin
        FCurSeries.XSource:= XValuesE.Text;
      end;

    11:// YValuesE
      begin
        FCurSeries.YSource:= YValuesE.Text;
      end;

    12:// TopNE
      begin
        FCurSeries.TopN:= StrToInt(TopNE.Text);
      end;

    13:// TopNCaptionE
      begin
        FCurSeries.TopNCaption:= TopNCaptionE.Text;
      end;

    14:// SortCB
      begin
        FCurSeries.SortOrder:= TfrxSeriesSortOrder(SortCB.ItemIndex);
      end;
  end;

  FUpdating:= False;
end;

procedure TfrxChartEditorForm.UpDown1Click(Sender:TObject; Button:TUDBtnType);
begin
  DoClick(Sender);
end;

procedure TfrxChartEditorForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

initialization
  frxComponentEditors.Register(TfrxChartView, TfrxChartEditor);
  frxHideProperties(TChart, 'Align;AllowPanning;AllowZoom;Anchors;AnimatedZoom;'+
    'AnimatedZoomSteps;AutoSize;BackImage;BackImageInside;BackImageMode;'+
    'BevelInner;BevelOuter;BevelWidth;BorderStyle;BorderWidth;ClipPoints;Color;'+
    'Constraints;Cursor;DragCursor;DragKind;DragMode;DockSite;Enabled;Foot;Frame;Height;'+
    'HelpContext;Hint;Left;Locked;MarginBottom;MarginLeft;MarginRight;MarginTop;'+
    'MaxPointsPerPage;Name;Page;ParentColor;ParentShowHint;PopupMenu;PrintProportional;'+
    'ScaleLastPage;SeriesList;ShowHint;TabOrder;TabStop;Tag;Top;UseDockManager;'+
    'Visible;Width');
  frxHideProperties(TChartSeries, 'ColorSource;Cursor;DataSource;Name;'+
    'ParentChart;Tag;XLabelsSource');
  frxHideProperties(TfrxChartView, 'SeriesData');

end.
