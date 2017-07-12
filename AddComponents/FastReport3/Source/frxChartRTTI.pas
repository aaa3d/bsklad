{******************************************}
{ }
{ FastReport v3.0 }
{ Chart RTTI }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxChartRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, fs_iinterpreter, frxChart, fs_ichartrtti
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TFunctions = class(TObject)
  private
    function CallMethod(Instance:TObject; ClassType:TClass;
      const MethodName:String; var Params:Variant):Variant;
    function GetProp(Instance:TObject; ClassType:TClass;
      const PropName:String):Variant;
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  Functions:TFunctions;

{ TFunctions }

constructor TFunctions.Create;
begin
  with fsGlobalUnit do
  begin
    AddedBy:= Self;
    AddEnum('TfrxSeriesDataType', 'dtDBData, dtBandData, dtFixedData');
    AddClass(TfrxSeriesItem, 'TPersistent');
    with AddClass(TfrxSeriesData, 'TPersistent') do
    begin
      AddMethod('function Add:TfrxSeriesItem', CallMethod);
      AddDefaultProperty('Items', 'Integer', 'TfrxSeriesItem', CallMethod, True);
    end;
    with AddClass(TfrxChartView, 'TfrxView') do
    begin
      AddProperty('Chart', 'TChart', GetProp, nil);
      AddIndexProperty('Series', 'Integer', 'TChartSeries', CallMethod, True);
      AddProperty('SeriesData', 'TfrxSeriesData', GetProp, nil);
    end;
    AddedBy:= nil;
  end;
end;

destructor TFunctions.Destroy;
begin
  if fsGlobalUnit<>nil then
    fsGlobalUnit.RemoveItems(Self);
  inherited;
end;

function TFunctions.CallMethod(Instance:TObject; ClassType:TClass;
  const MethodName:String; var Params:Variant):Variant;
begin
  Result:= 0;

  if ClassType = TfrxSeriesData then
  begin
    if MethodName = 'ADD' then
      Result:= Integer(TfrxSeriesData(Instance).Add)
    else if MethodName = 'ITEMS.GET' then
      Result:= Integer(TfrxSeriesData(Instance).Items[Params[0]])
  end
  else if ClassType = TfrxChartView then
  begin
    if MethodName = 'SERIES.GET' then
      Result:= Integer(TfrxChartView(Instance).Chart.Series[Params[0]])
  end
end;

function TFunctions.GetProp(Instance:TObject; ClassType:TClass;
  const PropName:String):Variant;
begin
  Result:= 0;

  if ClassType = TfrxChartView then
  begin
    if PropName = 'CHART' then
      Result:= Integer(TfrxChartView(Instance).Chart)
    else if PropName = 'SERIESDATA' then
      Result:= Integer(TfrxChartView(Instance).SeriesData)
  end
end;

initialization
  Functions:= TFunctions.Create;

finalization
  Functions.Free;

end.
