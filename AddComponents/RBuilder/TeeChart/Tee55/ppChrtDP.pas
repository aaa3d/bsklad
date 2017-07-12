{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppChrtDP;

interface

{$I ppIfDef.pas}

uses
  SysUtils, Classes, Graphics, Controls, Forms, ExtCtrls,
  TeeProcs, TeEngine, Chart, IEditCha,
  ppComm, ppClass, ppDevice, ppTypes, ppDB, ppChrt, ppChDPEd, ppDsgnCt, ppDrwCmd;

type

  TppCustomDBChart = class;

  { TppCustomDBChart }
  TppCustomDBChart = class(TCustomChart)
    private
      FAutoRefresh: Boolean;
      FDataPipeList: TList;
      FShowGlassCursor: Boolean;
      FRefreshingData: Boolean;

      procedure AddPointToSeries(aDataPipeline: TppDataPipeline; aSeries: TChartSeries; aX, aY: Double; aXLabel: String; aColor: TColor);
      function  GetFloatFieldValue(aDataPipeline: TppDataPipeline; const aFieldAlias: String): Double;
      procedure GetSeriesForDataPipeline(aDataPipeline: TppDataPipeline; aSeriesList: TChartSeriesList);
      procedure RecordToPoint(aDataPipeline: TppDataPipeline; aSeries: TChartSeries);
      procedure TraverseDataPipeline(aDataPipeline: TppDataPipeline; aSeriesList: TChartSeriesList);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;
      function  IsValidDataSource(aSeries: TChartSeries; aComponent: TComponent): Boolean; override;

      procedure FillSeriesSourceItems(aSeries: TChartSeries; Proc: TGetStrProc); override;
      procedure FillValueSourceItems(aValueList: TChartValueList; Proc: TGetStrProc); override;
      procedure RefreshData;
      procedure RefreshDataPipeline(aDataPipeline: TppDataPipeline);

      property DataPipeList: TList read FDataPipeList write FDataPipeList;

      property AutoRefresh: Boolean read FAutoRefresh write FAutoRefresh default True;
      property ShowGlassCursor: Boolean read FShowGlassCursor write FShowGlassCursor default True;

      property RefreshingData: Boolean read FRefreshingData;

    end; {class, TppCustomDBChart}

  { TppDPTeeChart }
  TppDPTeeChart = class(TppCustomTeeChart)
    private
      FDataPipeList: TList;

      procedure UpdateDataPipeList;
      
      {popup menu event handlers}
      procedure RefreshDataMenuClick(Sender: TObject);

    protected
      procedure CreateChart(var aChart: TCustomChart); override;
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Edit; override;
      procedure PopupMenuClick(Sender: TObject); override;
      procedure PaintDesignControl(aCanvas: TCanvas); override;

      procedure Loaded; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

    published
      property Chart;
      property PrintMethod;
      property Visible;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;
  end; {class, TppDPTeeChart}


  { TppDPTeeChartControl }
  TppDPTeeChartControl = class(TppCustomDBChart)
    private
      FStreamingParent: TComponent;

      procedure SetStreamingParent(aParent: TComponent);

    protected

      procedure SetParentComponent(Value: TComponent); override;
      procedure ReadState(Reader: TReader); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  HasParent: Boolean; override;
      function  GetParentComponent: TComponent; override;

      property StreamingParent: TComponent read FStreamingParent write SetStreamingParent;

    published
      { TCustomDBChart properties }
      property ShowGlassCursor;

      { TCustomChart Properties }
      property BackImage;
      property BackImageInside;
      property BackImageMode;
      property BottomWall;
      property Foot;
      property Gradient;
      property LeftWall;
      property MarginBottom;
      property MarginLeft;
      property MarginRight;
      property MarginTop;
      property Title;

      { TCustomAxisPanel properties }
      property AxisVisible;
      property BackColor;
      property BottomAxis;
      property Chart3DPercent;
      property ClipPoints;
      property Frame;
      property LeftAxis;
      property Legend;
      property MaxPointsPerPage;
      property Page;
      property RightAxis;
      property ScaleLastPage;
      property SeriesList;
      property TopAxis;
      property View3D;
      property View3DWalls;

      { TPanel properties }
      property BevelInner;
      property BevelWidth;
      property BevelOuter;
      property BorderWidth;
      property BorderStyle;
      property Color;

  end; {class, TppDPTeeChartControl}

implementation

uses TeeConst;

{******************************************************************************
 *
 ** C U S T O M   D B   C H A R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.Create }

constructor TppCustomDBChart.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAutoRefresh := True;
  FDataPipeList := nil;
  FShowGlassCursor := True;
  FRefreshingData := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.Destroy }

destructor TppCustomDBChart.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.Assign }

procedure TppCustomDBChart.Assign(Source: TPersistent);
var
  lSource: TppCustomDBChart;
begin

  inherited Assign(Source);

  if not(Source is TppCustomDBChart) then Exit;

  lSource := TppCustomDBChart(Source);

  AutoRefresh := lSource.AutoRefresh;
  ShowGlassCursor := lSource.ShowGlassCursor;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.IsValidDataSource }

function TppCustomDBChart.IsValidDataSource(aSeries: TChartSeries; aComponent: TComponent):Boolean;
begin
  Result := ((ASeries <> AComponent) and
            ((aComponent is TChartSeries) and aSeries.IsValidSeriesSource(TChartSeries(aComponent))) or
             (aComponent is TppDataPipeline) and (TppDataPipeline(aComponent).Visible));

end; {procedure, IsValidDataSource}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.FillSeriesSourceItems }

procedure TppCustomDBChart.FillSeriesSourceItems(aSeries: TChartSeries; Proc: TGetStrProc);
var
  liIndex: Integer;
  lDataPipeline: TppDataPipeline;
begin

  if (aSeries.DataSource = nil) or not(aSeries.DataSource is TppDataPipeline) then Exit;

  lDataPipeline := TppDataPipeline(aSeries.DataSource);

  for liIndex := 0 to lDataPipeline.FieldCount - 1 do
    Proc(lDataPipeline.Fields[liIndex].FieldAlias);

end; {procedure, FillSeriesSourceItems}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.FillValueSourceItems }

procedure TppCustomDBChart.FillValueSourceItems(aValueList: TChartValueList; Proc: TGetStrProc);
var
  lSeries: TChartSeries;
begin

  lSeries := aValueList.Owner;

  if (lSeries.DataSource = nil) and (lSeries.DataSource is TppDataPipeline) then
    FillSeriesSourceItems(lSeries, Proc)
  else
    inherited FillValueSourceItems(aValueList, Proc);

end; {procedure, FillValueSourceItems}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.RefreshData }

procedure TppCustomDBChart.RefreshData;
var
  liIndex: Integer;
  lDataPipeline: TppDataPipeline;
begin

  if FRefreshingData then Exit;
  
  if (FDataPipeList = nil) then Exit; 

  for liIndex := 0 to FDataPipeList.Count - 1 do
    begin
      lDataPipeline := TppDataPipeline(FDataPipeList[liIndex]);

      RefreshDataPipeline(lDataPipeline)
    end;

end; {procedure, RefreshData}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.GetFloatFieldValue }

function TppCustomDBChart.GetFloatFieldValue(aDataPipeline: TppDataPipeline; const aFieldAlias: String): Double;
var
  lField: TppField;
begin
  lField := aDataPipeline.GetFieldForAlias(aFieldAlias);

  if (lField = nil) or (lField.Value = Null) then
    Result := 0
  else
    Result := lField.Value;

end; {procedure, GetFloatFieldValue}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.AddPointToSeries }

procedure TppCustomDBChart.AddPointToSeries(aDataPipeline: TppDataPipeline; aSeries: TChartSeries; aX, aY: Double; aXLabel: String; aColor: TColor);
var
  liIndex: Integer;
  lValueList: TChartValueList;
begin

  for liIndex := 2 to aSeries.ValuesLists.Count - 1 do
    begin
      lValueList := aSeries.ValuesLists[liIndex];

      if (lValueList.ValueSource <> '') then
        lValueList.TempValue := GetFloatFieldValue(aDataPipeline, lValueList.ValueSource)
      else
        aSeries.ClearTempValue(lValueList);

    end;

  if aSeries.YMandatory then
    begin
      if (aSeries.XValues.ValueSource <> '') then
        liIndex := aSeries.AddXY(aX, aY, aXLabel, aColor)
      else
        liIndex := aSeries.AddY(aY, aXLabel, aColor);
    end
  else
    begin
      if (aSeries.YValues.ValueSource <> '') then
        liIndex := aSeries.AddXY(aX, aY, aXLabel, aColor)
      else
        liIndex := aSeries.AddX(aX, aXLabel, aColor);
    end;

  if (liIndex <> -1) then
    aSeries.AddValue(liIndex);

end; {procedure, AddPointToSeries}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.RecordToPoint }

procedure TppCustomDBChart.RecordToPoint(aDataPipeline: TppDataPipeline; aSeries: TChartSeries);
var
  liIndex: Integer;
  liFieldCount: Integer;
  lsFieldAlias: String;
  lField: TppField;
  lsXLabel: String;
  lColor: TColor;
  ldX: Double;
  ldY: Double;
begin

  ldX := 0;
  ldY := 0;
  lColor := clTeeColor;

  {get the x-label}
  if (aSeries.XLabelsSource <> '') then
    begin
      lsFieldAlias := aSeries.XLabelsSource;
      lField := aDataPipeline.GetFieldForAlias(lsFieldAlias);
      lsXLabel := aDataPipeline.GetFieldAsString(lField.FieldName);
    end
  else
    lsXLabel := '';

  {get the color}
  if (aSeries.ColorSource = '') then
    begin
      lsFieldAlias := TeeExtractField(aSeries.MandatoryValueList.ValueSource, 1);

      lField := aDataPipeline.GetFieldForAlias(lsFieldAlias);

      if (lField <> nil) and (lField.Value = null) then
        lColor := clNone
      else
        lColor := clTeeColor;
    end
  else
    begin
      lsFieldAlias := aSeries.ColorSource;

      lField := aDataPipeline.GetFieldForAlias(lsFieldAlias);

      if (lField <> nil) then
        lColor := aDataPipeline.GetFieldValue(lField.FieldName);
    end;

  liFieldCount := TeeNumFields(aSeries.MandatoryValueList.ValueSource);

  if (liFieldCount = 1) then
    begin
      lsFieldAlias := aSeries.MandatoryValueList.ValueSource;

      {if aSeries.XLabelsSource = '' then
          lsXLabel := lsFieldAlias;}

      if aSeries.YMandatory then
        begin
          ldX := GetFloatFieldValue(aDataPipeline, aSeries.XValues.ValueSource);
          ldY := GetFloatFieldValue(aDataPipeline, lsFieldAlias);
        end
      else
        begin
          ldX := GetFloatFieldValue(aDataPipeline, lsFieldAlias);
          ldY := GetFloatFieldValue(aDataPipeline, aSeries.YValues.ValueSource);
        end;

      AddPointToSeries(aDataPipeline, aSeries, ldX, ldY, lsXLabel, lColor);
    end

  else
    for liIndex := 1 to liFieldCount do
      begin
        lsFieldAlias := TeeExtractField(aSeries.MandatoryValueList.ValueSource, liIndex);

        {if aSeries.XLabelsSource = '' then
          lsXLabel := lsFieldAlias;}

        if aSeries.YMandatory then
          ldY := GetFloatFieldValue(aDataPipeline, lsFieldAlias)
        else
          ldX := GetFloatFieldValue(aDataPipeline, lsFieldAlias);

        AddPointToSeries(aDataPipeline, aSeries, ldX, ldY, lsXLabel, lColor);
      end;

end; {procedure, RecordToPoint}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.TraverseDataPipeline }

procedure TppCustomDBChart.TraverseDataPipeline(aDataPipeline: TppDataPipeline; aSeriesList: TChartSeriesList);
var
  lBookmark: Integer;
  liIndex: Integer;
  lDPState: TppDataPipelineStates;
  llTraversalCount: Longint;
begin

  lBookmark := 0;
  llTraversalCount := 0;

  try
    lDPState := aDataPipeline.State;
    llTraversalCount := aDataPipeline.TraversalCount;
    lBookmark := aDataPipeline.GetBookMark;

    aDataPipeline.First;

    while not(aDataPipeline.EOF) do
      try

        for liIndex := 0 to aSeriesList.Count - 1 do
          RecordToPoint(aDataPipeline, aSeriesList[liIndex]);

        aDataPipeline.Next;
      except
        on EAbort do Break; { <-- exit while loop !!! }
      end; {try-except, next record}

  finally
    try
      aDataPipeline.GotoBookMark(lBookmark);
    finally
      aDataPipeline.FreeBookMark(lBookmark);
    end;

    aDataPipeline.State := lDPState;
    aDataPipeline.TraversalCount := llTraversalCount;

  end; {try-finally, bookmark}

end; {procedure, TraverseDataPipeline}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.GetSeriesForDataPipeline }

procedure TppCustomDBChart.GetSeriesForDataPipeline(aDataPipeline: TppDataPipeline; aSeriesList: TChartSeriesList);
var
  liIndex: Longint;
  lSeries: TChartSeries;
begin

  aSeriesList.Clear;

  for liIndex := 0 to SeriesCount - 1 do
    begin
      lSeries := Series[liIndex];

      if (lSeries.DataSource = aDataPipeline) and
         (lSeries.MandatoryValueList.ValueSource <> '') then
        aSeriesList.Add(lSeries);

    end;

end; {procedure, GetSeriesForDataPipeline}

{------------------------------------------------------------------------------}
{ TppCustomDBChart.RefreshDataPipeline }

procedure TppCustomDBChart.RefreshDataPipeline(aDataPipeline: TppDataPipeline);
var
  lSaveCursor: TCursor;
  liIndex: Integer;
  lSeriesList: TChartSeriesList;
  lSeries: TChartSeries;
  lbTraverseAllData: Boolean;
begin

  if not(aDataPipeline.Active) then  Exit;

  if FRefreshingData then Exit;

  FRefreshingData := True;

  lSeriesList := TChartSeriesList.Create;
  lbTraverseAllData := True;

  try
    GetSeriesForDataPipeline(aDataPipeline, lSeriesList);

    if (lSeriesList.Count > 0) then
      begin
        lSaveCursor := Screen.Cursor;

        if FShowGlassCursor then
          Screen.Cursor := crHourGlass;

        try
          {clear series points}
          for liIndex := 0 to lSeriesList.Count - 1 do
            lSeriesList[liIndex].Clear;

          {convert data to series points}
          if (lbTraverseAllData) then
            TraverseDataPipeline(aDataPipeline, lSeriesList)

          else
            begin
              for liIndex := 0 to lSeriesList.Count - 1 do
                begin
                  lSeries := lSeriesList.Series[liIndex];

                  RecordToPoint(aDataPipeline, lSeries);
                end;
            end;

          {refresh any related series}
          for liIndex := 0 to lSeriesList.Count - 1 do
            TChartSeries(lSeriesList[liIndex]).RefreshSeries;

        finally
          if FShowGlassCursor then
            Screen.Cursor := lSaveCursor;
        end; {try-finally, process each record}

      end; {if, list series created}

  finally
    lSeriesList.Free;
    FRefreshingData := False;
  end; {try-finally, build list of series}

end; {procedure, RefreshDataPipeline}


{******************************************************************************
 *
 ** D P   T E E   C H A R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDPTeeChart.Create }

constructor TppDPTeeChart.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDataPipeList := TList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDPTeeChart.Destroy }

destructor TppDPTeeChart.Destroy;
begin

  FDataPipeList.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDPTeeChart.Notify }

procedure TppDPTeeChart.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
var
  liIndex: Integer;
  lSeries: TChartSeries;
begin

  inherited Notify(aCommunicator, aOperation);

  case aOperation of

    ppopRemove:
      begin
        {delete pipeline from list}
        liIndex := FDataPipeList.IndexOf(aCommunicator);

        if (liIndex = -1) then Exit;

        FDataPipeList.Delete(liIndex);

        if (csDestroying in ComponentState) then Exit;

        {clear DataSource}
        for liIndex := 0 to Chart.SeriesCount - 1 do
          begin
            lSeries := Chart.Series[liIndex];

            if (lSeries.DataSource = aCommunicator) then
             lSeries.DataSource := nil;
          end;

     {   TppDPTeeChartControl(Chart).RefreshData;}

        {repaint control}
        InvalidateDesignControl;

      end;

    ppopActiveChange:
      if (pppcDesigning in DesignState) and not(Printing) and not(csDestroying in ComponentState)
          and not TppDPTeeChartControl(Chart).FRefreshingData then

           {repaint control}
          InvalidateDesignControl;


   {the following code caused problems if 2 Charts were connected to the same
    datapipeline. This code is only used at design-time. The user can manually refresh
    the chart by selecting the refresh data menu command.}
   {ppopDataChange:

      if (pppcDesigning in DesignState) and not(Printing) and not(csDestroying in ComponentState)
          and not TppDPTeeChartControl(Chart).FRefreshingData then
        begin
          TppDPTeeChartControl(Chart).RefreshData;

          {repaint control}
     {     InvalidateDesignControl;

        end;}

  end;


end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDPTeeChart.Loaded }

procedure TppDPTeeChart.Loaded;
begin


  UpdateDataPipeList;

  {TppDPTeeChartControl(Chart).RefreshData;}

  {repaint control}
 { InvalidateDesignControl;}

  inherited Loaded;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TppDPTeeChart.PropertiesToDrawCommand }

procedure TppDPTeeChart.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
begin

  TppDPTeeChartControl(Chart).RefreshData;

  inherited  PropertiesToDrawCommand(aDrawCommand);


end; {procedure, PropertiesToDrawCommand}

{------------------------------------------------------------------------------}
{ TppDPTeeChart.PaintDesignControl}

procedure TppDPTeeChart.PaintDesignControl(aCanvas: TCanvas);
begin
  if TppDPTeeChartControl(Chart).RefreshingData then Exit;

  inherited PaintDesignControl(aCanvas);

end; {procedure, PaintDesignControl}


{------------------------------------------------------------------------------}
{ TppDPTeeChart.UpdateDataPipeList }

procedure TppDPTeeChart.UpdateDataPipeList;
var
  liIndex: Longint;
  lSeries: TChartSeries;
  lDataPipeline: TppDataPipeline;
begin

  for liIndex := 0 to FDataPipeList.Count - 1 do
    TppDataPipeline(FDataPipeList[liIndex]).RemoveNotify(Self);

  FDataPipeList.Clear;

  if (Chart = nil) then Exit;

  for liIndex := 0 to Chart.SeriesCount - 1 do
    begin
      lSeries := Chart.Series[liIndex];

      if (lSeries.DataSource <> nil) and (lSeries.DataSource is TppDataPipeline) then
        begin
          lDataPipeline := TppDataPipeline(lSeries.DataSource);

          if (FDataPipeList.IndexOf(lDataPipeline) = -1) then
            begin
              lDataPipeline.AddNotify(Self);

              FDataPipeList.Add(lDataPipeline);
            end;
        end;

    end;

  TppDPTeeChartControl(Chart).DataPipeList := FDataPipeList;

end; {procedure, UpdateDataPipeList}

{------------------------------------------------------------------------------}
{ TppDPTeeChart.CreateChart }

procedure TppDPTeeChart.CreateChart(var aChart: TCustomChart);
begin

  {create & configure tee chart control}

 {note: create with a nil owner and then insert into the Owner
         at the bottom of this procedure - this avoids D5 lockup}

  aChart := TppDPTeeChartControl.Create(nil);

  TppDPTeeChartControl(aChart).StreamingParent := Self;

  {use global parent window as the parent}
  aChart.Parent := ppParentWnd;

  aChart.Name := GetValidName(aChart);

  aChart.Title.Text.Clear;
  aChart.Title.Text.Add('Chart');
  aChart.Foot.Font.Color := clRed;
  aChart.Foot.Font.Style :=[fsItalic];
  aChart.Color := clWhite;
  aChart.BevelOuter := bvNone;
  aChart.BufferedDisplay := False;


  if Owner <> nil then
    Owner.InsertComponent(aChart);
  

end; {procedure, CreateChart}

{------------------------------------------------------------------------------}
{ TppDPTeeChart.Edit }

procedure TppDPTeeChart.Edit;
var
  lProc: TOnCreateEditSeries;
begin

  lProc := IEditCha.InternalOnCreateEditSeries;

  IEditCha.InternalOnCreateEditSeries := ppChDPEd.OnCreateEditDBChart;

  inherited Edit;

  IEditCha.InternalOnCreateEditSeries := lProc;

  UpdateDataPipeList;

 { TppDPTeeChartControl(Chart).RefreshData;}

  {repaint control}
  InvalidateDesignControl;

end; {procedure, Edit}

{------------------------------------------------------------------------------}
{ TppDPTeeChart.CreatePopupMenu }

procedure TppDPTeeChart.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(25, 'RefreshData', '',  497);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppDPTeeChart.PopupMenuClick }

procedure TppDPTeeChart.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  {assign menu item event handlers}
  TppPopupMenu(Sender).ItemByName('RefreshData').OnClick  := RefreshDataMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppDPTeeChart.RefreshDataMenuClick }

procedure TppDPTeeChart.RefreshDataMenuClick(Sender: TObject);
begin

{  TppDPTeeChartControl(Chart).RefreshData;}

  {repaint control}
  InvalidateDesignControl;

end; {procedure, RefreshDataMenuClick}

{******************************************************************************
 *
 ** D A T A   P I P E   T E E   C H A R T   C O N T R O L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDPTeeChartControl.Create }

constructor TppDPTeeChartControl.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FStreamingParent := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDPTeeChartControl.Destroy }

destructor TppDPTeeChartControl.Destroy;
begin

  {remove from parent}
  SetStreamingParent(nil);


  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDPTeeChartControl.SetStreamingParent }

procedure TppDPTeeChartControl.SetStreamingParent(aParent: TComponent);
begin

  if (FStreamingParent <> nil) and (FStreamingParent is TppCustomTeeChart) then
    TppCustomTeeChart(FStreamingParent).SetChartProperty(nil);

  FStreamingParent := aParent;

  if (FStreamingParent <> nil) and (FStreamingParent is TppCustomTeeChart) then
    TppCustomTeeChart(FStreamingParent).SetChartProperty(Self);

end; {procedure, SetStreamingParent}

{------------------------------------------------------------------------------}
{ TppDPTeeChartControl.HasParent }

function TppDPTeeChartControl.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppDPTeeChartControl.GetParentComponent - required method for Components with HasParent = True }

function TppDPTeeChartControl.GetParentComponent: TComponent;
begin
  Result := FStreamingParent;
end; {function, GetParentComponent}


{------------------------------------------------------------------------------}
{ TppDPTeeChartControl.SetParentComponent - required method for Components with HasParent = True }

procedure TppDPTeeChartControl.SetParentComponent(Value: TComponent);
begin
  if (Value is TppCustomTeeChart) then
    SetStreamingParent(Value);
end;

{------------------------------------------------------------------------------}
{ TppDPTeeChartControl.ReadState }

procedure TppDPTeeChartControl.ReadState(Reader: TReader);
begin

  inherited ReadState(Reader);

  {use global parent window as the parent}
  Parent := ppParentWnd;

end;

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppDPTeeChart, TppDPTeeChartControl]);

  ppRegisterComponent(TppDPTeeChart, 'Data Components', 6, 463, '', 0);

finalization

  ppUnRegisterComponent(TppDPTeeChart);

end.
