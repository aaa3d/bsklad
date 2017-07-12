{******************************************}
{ }
{ FastReport v3.0 }
{ TeeChart Add-In Object }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxChart;

interface

{$I frx.inc}
{$I frxReg.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Menus, Controls, frxClass,
  TeeProcs, TeEngine, Chart, Series, TeCanvas
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxChartObject = class(TComponent); // fake component

  TfrxSeriesDataType = (dtDBData, dtBandData, dtFixedData);
  TfrxSeriesSortOrder = (soNone, soAscending, soDescending);

  TfrxSeriesItem = class(TCollectionItem)
  private
    FDataBand:TfrxDataBand;
    FDataSet:TfrxDataSet;
    FDataSetName:String;
    FDataType:TfrxSeriesDataType;
    FSortOrder:TfrxSeriesSortOrder;
    FTopN:Integer;
    FTopNCaption:String;
    FXSource:String;
    FYSource:String;
    FXValues:String;
    FYValues:String;
    procedure FillSeries(Series:TChartSeries);
    procedure SetDataSet(const Value:TfrxDataSet);
    procedure SetDataSetName(const Value:String);
    function GetDataSetName:String;
  published
    property DataType:TfrxSeriesDataType read FDataType write FDataType;
    property DataBand:TfrxDataBand read FDataBand write FDataBand;
    property DataSet:TfrxDataSet read FDataSet write SetDataSet;
    property DataSetName:String read GetDataSetName write SetDataSetName;
    property SortOrder:TfrxSeriesSortOrder read FSortOrder write FSortOrder;
    property TopN:Integer read FTopN write FTopN;
    property TopNCaption:String read FTopNCaption write FTopNCaption;
    property XSource:String read FXSource write FXSource;
    property YSource:String read FYSource write FYSource;
    property XValues:String read FXValues write FXValues;
    property YValues:String read FYValues write FYValues;
  end;

  TfrxSeriesData = class(TCollection)
  private
    FReport:TfrxReport;
    function GetSeries(Index:Integer):TfrxSeriesItem;
  public
    constructor Create(Report:TfrxReport);
    function Add:TfrxSeriesItem;
    property Items[Index:Integer]:TfrxSeriesItem read GetSeries; default;
  end;

  TfrxChartView = class(TfrxView)
  private
    FChart:TChart;
    FSeriesData:TfrxSeriesData;
    procedure CreateChart;
    procedure FillChart;
    procedure ReadData(Stream:TStream);
    procedure ReadData1(Reader:TReader);
    procedure ReadData2(Reader:TReader);
    procedure WriteData(Stream:TStream);
    procedure WriteData1(Writer:TWriter);
    procedure WriteData2(Writer:TWriter);
  protected
    procedure DefineProperties(Filer:TFiler); override;
    procedure Notification(AComponent:TComponent; Operation:TOperation); override;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure Draw(Canvas:TCanvas; ScaleX, ScaleY, OffsetX, OffsetY:Extended); override;
    procedure AfterPrint; override;
    procedure GetData; override;
    procedure BeforeStartReport; override;
    procedure OnNotify(Sender:TObject); override;
    class function GetDescription:String; override;
    property Chart:TChart read FChart;
    property SeriesData:TfrxSeriesData read FSeriesData;
  published
    property BrushStyle;
    property Color;
    property Frame;
  end;

implementation

uses
  frxChartRTTI,
{$IFNDEF NO_EDITORS}
  frxChartEditor,
{$ENDIF}
  frxDsgnIntf, frxUtils, frxRes;

{ TfrxSeriesItem }

procedure TfrxSeriesItem.SetDataSet(const Value:TfrxDataSet);
begin
  FDataSet:= Value;
  if FDataSet = nil then
    FDataSetName:= '' else
    FDataSetName:= FDataSet.UserName;
end;

procedure TfrxSeriesItem.SetDataSetName(const Value:String);
begin
  FDataSetName:= Value;
  FDataSet:= frxFindDataSet(FDataSet, FDataSetName,
    TfrxSeriesData(Collection).FReport);
end;

function TfrxSeriesItem.GetDataSetName:String;
begin
  if FDataSet = nil then
    Result:= FDataSetName else
    Result:= FDataSet.UserName;
end;

procedure TfrxSeriesItem.FillSeries(Series:TChartSeries);
var
  i:Integer;
  slx, sly:TStringList;
  xv, yv:String;

  procedure Sort;
  var
    i:Integer;
    sl:TStringList;
    s:String;
  begin
    sl:= TStringList.Create;
    sl.Sorted:= True;
    sl.Duplicates:= dupAccept;

    for i:= 0 to slx.Count-1 do
    begin
      s:= sly[i];
      if not frxIsValidFloat(s) then
        s:= '0';
      sl.Add(Format('%18.2f', [frxStrToFloat(s)])+'='+slx[i]);
    end;

    slx.Clear;
    sly.Clear;
    if FSortOrder = soAscending then
      for i:= 0 to sl.Count-1 do
      begin
        slx.Add(Trim(Copy(sl[i], Pos('=', sl[i])+1, 255)));
        sly.Add(Trim(Copy(sl[i], 1, Pos('=', sl[i])-1)));
      end
    else
      for i:= sl.Count-1 downto 0 do
      begin
        slx.Add(Trim(Copy(sl[i], Pos('=', sl[i])+1, 255)));
        sly.Add(Trim(Copy(sl[i], 1, Pos('=', sl[i])-1)));
      end;

    sl.Free;
  end;

  procedure MakeTopN;
  var
    i:Integer;
    d:Double;
    sl:TStringList;
    s:String;
  begin
    sl:= TStringList.Create;
    sl.Sorted:= True;
    sl.Duplicates:= dupAccept;

    for i:= 0 to slx.Count-1 do
    begin
      s:= sly[i];
      if not frxIsValidFloat(s) then
        s:= '0';
      sl.Add(Format('%18.2f', [frxStrToFloat(s)])+'='+slx[i]);
    end;

    slx.Clear;
    sly.Clear;
    for i:= sl.Count-1 downto sl.Count-FTopN do
    begin
      slx.Add(Trim(Copy(sl[i], Pos('=', sl[i])+1, 255)));
      sly.Add(Trim(Copy(sl[i], 1, Pos('=', sl[i])-1)));
    end;

    d:= 0;
    for i:= sl.Count-FTopN-1 downto 0 do
      d:= d+frxStrToFloat(Trim(Copy(sl[i], 1, Pos('=', sl[i])-1)));

    slx.Add(FTopNCaption);
    sly.Add(FloatToStr(d));

    sl.Free;
  end;

begin
  slx:= TStringList.Create;
  sly:= TStringList.Create;
  Series.Clear;

  xv:= FXValues;
  if (xv<>'') and (xv[1] = ';') then
    Delete(xv, 1, 1);
  yv:= FYValues;
  if (yv<>'') and (yv[1] = ';') then
    Delete(yv, 1, 1);

  frxSetCommaText(xv, slx);
  frxSetCommaText(yv, sly);

  if slx.Count = sly.Count then
    if slx.Count > 0 then
    begin
      if (FTopN > 0) and (FTopN < slx.Count) then
        MakeTopN
      else if FSortOrder<>soNone then
        Sort;

      for i:= 0 to slx.Count-1 do
        if frxIsValidFloat(sly[i]) then
          Series.Add(frxStrToFloat(sly[i]), slx[i], clTeeColor);
    end;

  slx.Free;
  sly.Free;
end;

{ TfrxSeriesData }

constructor TfrxSeriesData.Create(Report:TfrxReport);
begin
  inherited Create(TfrxSeriesItem);
  FReport:= Report;
end;

function TfrxSeriesData.Add:TfrxSeriesItem;
begin
  Result:= TfrxSeriesItem(inherited Add);
end;

function TfrxSeriesData.GetSeries(Index:Integer):TfrxSeriesItem;
begin
  Result:= TfrxSeriesItem(inherited Items[Index]);
end;

{ TfrxChartView }

constructor TfrxChartView.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  CreateChart;
  FSeriesData:= TfrxSeriesData.Create(Report);
end;

destructor TfrxChartView.Destroy;
begin
  FChart.Free;
  inherited Destroy;
  FSeriesData.Free;
end;

class function TfrxChartView.GetDescription:String;
begin
  Result:= frxResources.Get('obChart');
end;

procedure TfrxChartView.Notification(AComponent:TComponent; Operation:TOperation);
var
  i:Integer;
begin
  inherited;
  if Operation = opRemove then
  begin
    for i:= 0 to FSeriesData.Count-1 do
      if AComponent is TfrxDataSet then
      begin
        if FSeriesData[i].DataSet = AComponent then
          FSeriesData[i].DataSet:= nil;
      end
      else if AComponent is TfrxBand then
      begin
        if FSeriesData[i].DataBand = AComponent then
          FSeriesData[i].DataBand:= nil;
      end;
  end;
end;

procedure TfrxChartView.CreateChart;
begin
  FChart:= TChart.Create(Self);
  with FChart do
  begin
    Color:= clWhite;
    BevelInner:= bvNone;
    BevelOuter:= bvNone;
    Name:= 'Chart';
    Frame.Visible:= False;
    View3DOptions.Rotation:= 0;
    Title.Text.Text:= '';
  end;
end;

procedure TfrxChartView.DefineProperties(Filer:TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('Chart', ReadData, WriteData, True);
  Filer.DefineProperty('ChartElevation', ReadData1, WriteData1, True);
  Filer.DefineProperty('SeriesData', ReadData2, WriteData2, True);
end;

procedure TfrxChartView.ReadData(Stream:TStream);
begin
  FChart.Free;
  CreateChart;
  Stream.ReadComponent(FChart);
end;

procedure TfrxChartView.WriteData(Stream:TStream);
begin
  Stream.WriteComponent(FChart);
end;

procedure TfrxChartView.ReadData1(Reader:TReader);
begin
  FChart.View3DOptions.Elevation:= Reader.ReadInteger;
end;

procedure TfrxChartView.WriteData1(Writer:TWriter);
begin
  Writer.WriteInteger(FChart.View3DOptions.Elevation);
end;

procedure TfrxChartView.ReadData2(Reader:TReader);
begin
  frxReadCollection(FSeriesData, Reader, Self);
end;

procedure TfrxChartView.WriteData2(Writer:TWriter);
begin
  frxWriteCollection(FSeriesData, Writer, Self);
end;

procedure TfrxChartView.FillChart;
var
  i:Integer;
begin
  for i:= 0 to FSeriesData.Count-1 do
    FSeriesData[i].FillSeries(FChart.Series[i]);
end;

procedure TfrxChartView.Draw(Canvas:TCanvas; ScaleX, ScaleY, OffsetX,
  OffsetY:Extended);
var
  EMF:TMetafile;
begin
  BeginDraw(Canvas, ScaleX, ScaleY, OffsetX, OffsetY);
  DrawBackground;

  FillChart;

  if Color = clTransparent then
    FChart.Color:= clWhite else
    FChart.Color:= Color;
  EMF:= FChart.TeeCreateMetafile(False, Rect(0, 0, Round(Width), Round(Height)));
  Canvas.StretchDraw(Rect(FX, FY, FX1, FY1), EMF);
  EMF.Free;

  DrawFrame;
end;

procedure TfrxChartView.AfterPrint;
var
  i:Integer;
begin
  for i:= 0 to FSeriesData.Count-1 do
    with FSeriesData[i] do
    begin
      XValues:= '';
      YValues:= '';
    end;
end;

procedure TfrxChartView.GetData;
var
  i:Integer;
begin
  inherited;
  for i:= 0 to FSeriesData.Count-1 do
    with FSeriesData[i] do
      if (DataType = dtDBData) and (DataSet<>nil) then
      begin
        XValues:= '';
        YValues:= '';

        DataSet.First;
        while not DataSet.Eof do
        begin
          XValues:= XValues+';'+VarToStr(Report.Calc(XSource));
          YValues:= YValues+';'+VarToStr(Report.Calc(YSource));
          DataSet.Next;
        end;
      end
      else if DataType = dtFixedData then
      begin
        XValues:= XSource;
        YValues:= YSource;
      end
end;

procedure TfrxChartView.BeforeStartReport;
var
  i:Integer;
begin
  for i:= 0 to FSeriesData.Count-1 do
    with FSeriesData[i] do
    begin
      XValues:= '';
      YValues:= '';
    end;
  Report.Engine.NotifyList.Add(Self);
end;

procedure TfrxChartView.OnNotify(Sender:TObject);
var
  i:Integer;
begin
  inherited;
  for i:= 0 to FSeriesData.Count-1 do
    with FSeriesData[i] do
      if (DataType = dtBandData) and (DataBand = Sender) then
      begin
        Report.CurObject:= Self.Name;
        XValues:= XValues+';'+VarToStr(Report.Calc(XSource));
        YValues:= YValues+';'+VarToStr(Report.Calc(YSource));
      end;
end;

initialization
{$IFDEF TeeChart7}
  RegisterTeeStandardSeries;
{$ENDIF}
  frxObjects.RegisterObject1(TfrxChartView, nil, '', 'Other', 0, 25);

end.
