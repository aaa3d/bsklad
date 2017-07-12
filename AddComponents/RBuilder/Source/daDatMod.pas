{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}


unit daDatMod;

interface

{$I ppIfDef.pas}

uses
  SysUtils, Classes, Controls, Forms, Dialogs,
  ppComm, ppClass, ppForms, ppTypes,ppRelatv, ppModule,
  ppReport,  daDataVw;

type

  { TdaDataModule }
  TdaDataModule = class(TppReportModule)
    private

      function GetDataViewCount: Integer;
      function GetDataViewForIndex(aIndex: Integer): TdaCustomDataView;

    protected
      procedure Loaded; override;

    public

      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function IndexOfDataView(aDataView: TdaDataView): Integer;
      procedure SetParentComponent(Value: TComponent); override;

      procedure Merge(aDataModule: TdaDataModule);
      procedure MergeWithReport(aReport: TppCustomReport);

      property DataViews[Index: Integer]: TdaCustomDataView read GetDataViewForIndex;
      property DataViewCount: Integer read GetDataViewCount;

    end; {class, TdaDataModule}


  function daGetDataModule(aReport: TppCustomReport): TdaDataModule;

implementation

{design-time strings}
{$R rbDADE.res}

{------------------------------------------------------------------------------}
{ daGetDataModule }

function daGetDataModule(aReport: TppCustomReport): TdaDataModule;
begin
  if (aReport = nil) then
    Result := nil
  else
    Result := TdaDataModule(aReport.GetModuleForClass(TdaDataModule));

end; {class, daGetDataModule }


{******************************************************************************
 *
 ** D A T A   M O D U L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataModule.Create }

constructor TdaDataModule.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);


  Template.FileExtension := 'dtm';
  Template.FileFilter    := 'Report Data file (*.dtm)|*.dtm';

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TdaDataModule.Destroy }

destructor TdaDataModule.Destroy;
begin


  inherited Destroy;

end; {constructor, Destroy}


{------------------------------------------------------------------------------}
{ TdaDataModule.Loaded }

procedure TdaDataModule.Loaded;
var
  lMainReport: TppReport;
  lDataView: TdaDataView;
  liIndex: Integer;
begin

 inherited Loaded;

 if (Report <> nil) then
   begin
     for liIndex := 0 to DataViewCount - 1 do
       begin
         lDataView := DataViews[liIndex];

         lDataView.Report := Report;
       end;
   end;

 if (Report <> nil) and Report.InheritsFrom(TppChildReport) then
   begin
     MergeWithReport(Report.MainReport);

     Free;
   end;

  lMainReport := TppReport(Report.MainReport);

  if (lMainReport <> nil) then
    lMainReport.Modified := False;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TdaDataModule.SetParentComponent - required method for Components with HasParent = True }

procedure TdaDataModule.SetParentComponent(Value: TComponent);
var
  lDataView: TdaDataView;
  liIndex: Integer;
begin

  if (Value = nil) then
    SetReport(nil)
  else if Value.InheritsFrom(TppChildReport) then
    begin
      MergeWithReport(TppChildReport(Value).MainReport);
      {Free;}
    end
  else
    SetReport(TppCustomReport(Value));

 if (Report <> nil) then
   begin
     for liIndex := 0 to DataViewCount - 1 do
       begin
         lDataView := DataViews[liIndex];

         lDataView.Report := Report;
       end;
   end;

end; {procedure, SetParentComponent}


{------------------------------------------------------------------------------}
{ TdaDataModule.GetDataViewCount }

function TdaDataModule.GetDataViewCount: Integer;
begin
  Result := ChildCount;

end; {function, GetDataViewCount}


{------------------------------------------------------------------------------}
{ TdaDataModule.GetDataViewForIndex }

function TdaDataModule.GetDataViewForIndex(aIndex: Integer): TdaCustomDataView;
begin
  Result := TdaCustomDataView(Children[aIndex]);

end; {function, GetDataViewForIndex}

{------------------------------------------------------------------------------}
{ TdaDataModule.IndexOfDataView }

function TdaDataModule.IndexOfDataView(aDataView: TdaDataView): Integer;
begin
  Result := IndexOfChild(aDataView);

end; {function, IndexOfDataView}

{------------------------------------------------------------------------------}
{ TdaDataModule.Merge }

procedure TdaDataModule.Merge(aDataModule: TdaDataModule);
var
  liIndex: Integer;
  
begin

  for liIndex := 0 to aDataModule.ChildCount-1 do
   aDataModule.Children[liIndex].Parent := Self;


end; {procedure, Merge}

{------------------------------------------------------------------------------}
{ TdaDataModule.MergeWithReport }

procedure TdaDataModule.MergeWithReport(aReport: TppCustomReport);
var
  lDataModule: TdaDataModule;
begin

  if (aReport = nil) then Exit;

  {get report's data module}
  lDataModule := daGetDataModule(aReport);

  {Re-assign this data module to the report (if no module exists),
   otherwise merge this module with the report's data module}
  if (lDataModule = nil) then
    SetReport(aReport)
  else
    lDataModule.Merge(Self);

end; {procedure, MergeWithReport}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClass(TdaDataModule);

finalization

  UnRegisterClass(TdaDataModule);

end.
