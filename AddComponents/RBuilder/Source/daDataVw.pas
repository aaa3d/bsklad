{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daDataVw;

interface

{$I ppIfDef.pas}

uses
  Messages, Classes, Dialogs, SysUtils, Forms, ExtCtrls,
  ppComm, ppClass, ppDB, ppTmplat, ppTypes, ppUtils, ppRTTI;

type

  TdaDataViewTemplate = class;
  TdaCustomDataView = class;
  TdaCustomDataViewClass = class of TdaCustomDataView;


 { TdaCustomDataViewDialog}
  TdaCustomDataViewDialog = class(TForm)
    private
      FDataView: TdaCustomDataView;
      FLanguageIndex: Longint;

      procedure SetLanguageIndex(aLanguageIndex: Longint);

    protected
      procedure SetDataView(aDataView: TdaCustomDataView); virtual;
      procedure LanguageChanged; virtual;

    public
      property DataView: TdaCustomDataView read FDataView write SetDataView;
      property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;

  end; {class, TdaCustomDataViewDialog}


  { TdaCustomPreviewDataDialog}
  TdaCustomPreviewDataDialog = class(TdaCustomDataViewDialog)

  end; {class, TdaCustomPreviewDataDialog}

  
  { TdaCustomDesignDataDialog}
  TdaCustomDesignDataDialog = class(TdaCustomDataViewDialog)

  end; {class, TdaCustomDesignDataDialog}

  

  { TdaCustomDataView }
  TdaCustomDataView = class(TdaDataView)
    private
      FAskAtRunTime: Boolean;
      FTemplate: TdaDataViewTemplate;
      FLeft: Integer;
      FTop: Integer;
      FWidth: Integer;
      FHeight: Integer;
      FTimer: TTimer;
      FDesigning: Boolean;
      FAskUser: Boolean;

      procedure SetTemplate(aTemplate: TdaDataViewTemplate);

      procedure AfterLoadededEvent(Sender: TObject);

    protected
      procedure Loaded; override;
      procedure AfterLoaded; virtual;
      procedure ReportBeforePrintEvent; virtual;

      function GetDataPipelineCount: Integer; override;
      function GetDataPipelineForIndex(aIndex: Integer): TppDataPipeline; override;

      procedure SetActive(Value: Boolean); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Transfer(aSource: TppCommunicator); override;

      procedure EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList); override;

      class function ClassBitmap: Longint; override;
      class function ClassDescription: String; override;
      class function DataDesignerClass: TClass; virtual;
      class function PreviewFormClass: TFormClass; override;
      class function DesignFormClass: TFormClass; {override;}
      class function IsTemplate: Boolean; override;

      function AddDataPipeline(aDataPipeline: TppDataPipeline): Integer; override;
      function RemoveDataPipeline(aDataPipeline: TppDataPipeline): Integer; override;

      {descendents can override these}
      procedure Init; virtual;
      procedure CreateDataPipelines; virtual;
      procedure CreatePipelineFields(aDataPipeline: TppDataPipeline); virtual;
      procedure ConnectPipelinesToData; virtual;
      procedure DefineDataSelection; virtual;

      procedure Design; override;
      procedure Preview; override;

      property AskUser: Boolean read FAskUser write FAskUser;
      property Designing: Boolean read FDesigning write FDesigning;
      property Template: TdaDataViewTemplate read FTemplate write SetTemplate;

    published
      property AskAtRunTime: boolean read FAskAtRunTime write FAskAtRunTime default False;

      property Left: Integer read FLeft write FLeft;
      property Top: Integer read FTop write FTop;
      property Width: Integer read FWidth write FWidth;
      property Height: Integer read FHeight write FHeight;

  end; {class TdaCustomDataView}



  { TdaDataViewTemplate }
  TdaDataViewTemplate = class(TppTemplate)
    private
      FDataView: TdaDataView;
      FNewDataView: TdaDataView;
      FSaveDataView: TdaDataView;
      FSaveOwner: TComponent;

    protected
      {functions used by Reader during load }
      procedure LoadCallback(Component: TComponent); override;
      procedure LoadSetName(Reader: TReader; Component: TComponent; var Name: string); override;

      function  LoadStart: Boolean; override;
      procedure LoadEnd(aLoaded: Boolean); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure New; override;

  end; {class, TdaDataViewTemplate }


  {general routines}
  procedure daGetDataViewClasses(aList: TStrings);
  procedure daGetDataViewTemplates(aList: TStrings);
  procedure daGetDataViewWizardClasses(aSessionClass: TClass; aList: TStrings);

  procedure daRegisterDataView(aDataViewClass: TdaDataViewClass);
  procedure daUnRegisterDataView(aDataViewClass: TdaDataViewClass);

  procedure daGetDataViewSessionClasses(aList: TStrings);

  
implementation

uses
  daDB;

var
  FDataViewList: TStringList = nil;

{******************************************************************************
 *
 ** C U S T O M   D A T A V I E W  D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaCustomDataViewDialog.SetDataView }

procedure TdaCustomDataViewDialog.SetDataView(aDataView: TdaCustomDataView);
begin
  FDataView := aDataView;

end; {procedure, SetDataView}

{------------------------------------------------------------------------------}
{ TdaCustomDataViewDialog.SetLanguageIndex }

procedure TdaCustomDataViewDialog.SetLanguageIndex(aLanguageIndex: Longint);
begin
  FLanguageIndex:= aLanguageIndex;

  LanguageChanged;

end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TdaCustomDataViewDialog.LanguageChanged }

procedure TdaCustomDataViewDialog.LanguageChanged;
begin

end; {procedure, LanguageChanged}


{******************************************************************************
 *
 ** C U S T O M   D A T A  V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Create }

constructor TdaCustomDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FTemplate := TdaDataViewTemplate.Create(Self);

  FLeft   := 0;
  FTop    := 0;
  FWidth  := 0;
  FHeight := 0;

  EventNotifies := [ciProducerBeforePrint];

  FAskAtRuntime := False;
  FAskUser      := False;
  FDesigning    := False;

  Description := ClassDescription;
  UserName := ppTextToIdentifier(Description);

  Valid := True;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Destroy }

destructor TdaCustomDataView.Destroy;
begin

  FTemplate.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.EventNotify }

procedure TdaCustomDataView.EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
begin

  inherited EventNotify(aCommunicator, aEventID, aParams);

  if (aCommunicator = Report) and (aEventID = ciProducerBeforePrint) then
    ReportBeforePrintEvent;

end; {procedure, EventNotify}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Loaded }

procedure TdaCustomDataView.Loaded;
begin

  inherited Loaded;

  if DataPipelineCount = 0 then Exit;

  ConnectPipelinesToData;

  {intialize Ask at Runtime}
  FAskUser := FAskAtRuntime;

  FTimer := TTimer.Create(Self);
  FTimer.Interval := 100;
  FTimer.OnTimer  := AfterLoadededEvent;


end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.AfterLoadededEvent }

procedure TdaCustomDataView.AfterLoadededEvent(Sender: TObject);
begin

  FTimer.Free;
  FTimer := nil;

  AfterLoaded;

end; {procedure, AfterLoadededEvent}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.AfterLoaded }

procedure TdaCustomDataView.AfterLoaded;
var
  lModified: Boolean;
begin

  if (Report <> nil) and (Report.ComponentDesigner <> nil) and
     (Report.ComponentDesigner.Visible) then
    begin
      lModified := Report.Modified;
      SetActive(True);

      if (lModified <> Report.Modified) then
        Report.Modified := lModified;

    end;

end; {procedure, AfterLoaded}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.ReportBeforePrintEvent }

procedure TdaCustomDataView.ReportBeforePrintEvent;
begin

  if not Active then
    SetActive(True);

end; {procedure, ReportBeforePrintEvent}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.GetDataPipelineCount }

function TdaCustomDataView.GetDataPipelineCount: Integer;
begin
  Result := ChildCount;

end; {function, GetDataPipelineCount}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.GetDataPipelineForIndex }

function TdaCustomDataView.GetDataPipelineForIndex(aIndex: Integer): TppDataPipeline;
begin
  Result := TppDataPipeline(Children[aIndex]);
end; {function, GetDataPipelineForIndex}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.AddDataPipeline }

function TdaCustomDataView.AddDataPipeline(aDataPipeline: TppDataPipeline): Integer;
begin
  AddChild(aDataPipeline);

  Result := ChildCount - 1;
end; {function, AddDataPipeline}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.RemoveDataPipeline }

function TdaCustomDataView.RemoveDataPipeline(aDataPipeline: TppDataPipeline): Integer;
begin
  Result := RemoveChild(aDataPipeline)
end; {function, RemoveDataPipeline}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.IsTemplate }

class function TdaCustomDataView.IsTemplate: Boolean;
begin
  Result := False;
end; {function, IsTemplate}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.ClassDescription }

class function TdaCustomDataView.ClassDescription: String;
begin
  Result := ClassName;
end; {function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.ClassBitmap }

class function TdaCustomDataView.ClassBitmap: Longint;
begin
  Result := ppBitmapFromResource('DANODATAVIEW');
end; {class function, ClassBitmap}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.DataDesignerClass }

class function TdaCustomDataView.DataDesignerClass: TClass;
begin
  Result := nil;
end; {class function, DataDesignerClass}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.PreviewFormClass }

class function TdaCustomDataView.PreviewFormClass: TFormClass;
begin
  Result := TFormClass(GetClass('TdaPreviewDataDialog'));

end; {class function, PreviewFormClass}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.DesignFormClass }

class function TdaCustomDataView.DesignFormClass: TFormClass;
begin
  Result := nil;
end; {class function, DesignFormClass}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.SetTemplate }

procedure TdaCustomDataView.SetTemplate(aTemplate: TdaDataViewTemplate);
begin
  FTemplate.Assign(aTemplate);
end; {procedure, SetTemplate}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.SetActive }

procedure TdaCustomDataView.SetActive(Value: Boolean);
var
  liIndex: Integer;

begin

  {4.06 - DPTeeChart needs the pipe to be active}
  {if Active = Value then Exit;}

  if Value and (DataPipelineCount = 0) then
    Init;

  if FAskUser and Value then
    begin
      FAskUser := False;
      Design
    end
  else if FAskAtRuntime and not Value then
    FAskUser := True;

  {4.06 - DPTeeChart needs the pipe to be active}
 { for liIndex := 0 to DataPipelineCount - 1 do

    if DataPipelines[liIndex].Active <> Value then
      begin

        if Value then
          DataPipelines[liIndex].Open
        else
          DataPipelines[liIndex].Close;

      end; }

  {open/close each pipeline}
  for liIndex := 0 to DataPipelineCount - 1 do
    if Value then
      DataPipelines[liIndex].Open
    else
      DataPipelines[liIndex].Close;


  inherited SetActive(Value);


end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Init }


procedure TdaCustomDataView.Init;
var
  liIndex: Integer;

begin
  if (DataPipelineCount > 0) then Exit;

  CreateDataPipelines;
  ConnectPipelinesToData;

  for liIndex := 0 to DataPipelineCount-1 do
    CreatePipelineFields(DataPipelines[liIndex]);


end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.CreateDataPipelines }

procedure TdaCustomDataView.CreateDataPipelines;
begin
  {descendants should add code here to create a DataPipeline}

end; {procedure, CreateDataPipelines}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.ConnectPipelinesToData }

procedure TdaCustomDataView.ConnectPipelinesToData;
begin
  {descendants should add code here to connect a DataPipeline(s) to data
  (for example: connect a DBPipeline to a TDataSource}

end; {procedure, ConnectPipelinesToData}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.CreatePipelineFields }

procedure TdaCustomDataView.CreatePipelineFields(aDataPipeline: TppDataPipeline);
begin
  {descendants should add code here to create DataPipeline Fields}

end; {procedure, CreatePipelineFields}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.DefineDataSelection }

procedure TdaCustomDataView.DefineDataSelection;
begin
  {add selection criteria here}

end; {procedure, DefineDataSelection}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Design }

procedure TdaCustomDataView.Design;
var
  lForm: TdaCustomDesignDataDialog;
  lFormClass: TFormClass;

begin

  lFormClass := DesignFormClass;

  if (lFormClass = nil) or not lFormClass.InheritsFrom(TdaCustomDesignDataDialog) then Exit;

  lForm := TdaCustomDesignDataDialog(lFormClass.Create(Application));

  lForm.DataView := Self;
  lForm.LanguageIndex := LanguageIndex;

  lForm.ShowModal;

  lForm.Free;

  {set AskUser to False to suppress the automatic ask at runtime
  behavior the next time the DataView is set to active }
  
  FAskUser := False;



end; {procedure, Design}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Preview }

procedure TdaCustomDataView.Preview;
var
  lForm: TdaCustomPreviewDataDialog;
  lFormClass: TFormClass;

begin

  lFormClass := PreviewFormClass;

  if (lFormClass = nil) or not lFormClass.InheritsFrom(TdaCustomPreviewDataDialog) then Exit;

  {SetActive(True);}

  lForm := TdaCustomPreviewDataDialog(lFormClass.Create(Application));

  lForm.DataView := Self;
  lForm.LanguageIndex := LanguageIndex;

  lForm.ShowModal;

  lForm.Free;

end; {procedure, Preview}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Transfer }

procedure TdaCustomDataView.Transfer(aSource: TppCommunicator);
var
  liIndex: Integer;
  lSource: TdaCustomDataView;

begin

  inherited Transfer(aSource);

  if not (aSource is TdaCustomDataView) then Exit;

  lSource := TdaCustomDataView(aSource);

  {change owner for pipelines}
  for liIndex := 0 to lSource.DataPipelineCount - 1 do
    begin
      lSource.DataPipelines[liIndex].DataView := Self;
      lSource.DataPipelines[liIndex].ChangeOwner(Owner);
    end;

end; {procedure, Transfer}

{******************************************************************************
 *
 ** D A T A V I E W   T E M P L A T E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.Create }

constructor TdaDataViewTemplate.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDataView     := TdaDataView(aOwner);
  Root          := aOwner;
 { Root          := FDataView.Owner; }

  FNewDataView    := nil;
  FSaveDataView   := nil;

  FSaveOwner      := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.Destroy }

destructor TdaDataViewTemplate.Destroy;
begin
  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.New }

procedure TdaDataViewTemplate.New;
var
  lNewDataView: TdaDataView;
  lDataViewClass: TComponentClass;

begin
  {create and assign new report}
  lDataViewClass := TComponentClass(FDataView.ClassType);
  lNewDataView := TdaDataView(lDataViewClass.Create(nil));

  FDataView.Transfer(lNewDataView);

  lNewDataView.Free;

  inherited New;

end; {procedure, New}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.LoadStart }

function TdaDataViewTemplate.LoadStart: Boolean;
begin

  inherited LoadStart;

  Result := False;

  if FDataView = nil then Exit;

  FSaveDataView := TdaDataViewClass(FDataView.ClassType).Create(nil);
  FSaveDataView.Transfer(FDataView);

  Result := True;

end; {function, LoadStart}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.LoadEnd }

procedure TdaDataViewTemplate.LoadEnd(aLoaded: Boolean);
begin

  if aLoaded then
    begin
      {assign new template }
      FDataView.Transfer(FNewDataView);
    end
  else
    {restore original dataview}
    FDataView.Transfer(FSaveDataView);

  FSaveDataView.Free;

  if FNewDataView <> nil then
    begin
      FNewDataView.Free;
      FNewDataView := nil;
    end;

  inherited LoadEnd(aLoaded);

end; {procedure, LoadEnd}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.LoadCallback }

procedure TdaDataViewTemplate.LoadCallback(Component: TComponent);
begin

  if (Component is TdaDataView) then
    FNewDataView := TdaDataView(Component);

end; {procedure, LoadCallback}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.LoadSetName }

procedure TdaDataViewTemplate.LoadSetName(Reader: TReader; Component: TComponent; var Name: string);
begin

  inherited LoadSetName(Reader, Component, Name);
  
  if FDataView = nil then Exit;

  if (Reader.Root = FDataView.Owner) and (FDataView.Owner.FindComponent(Name) <> nil) then
    Name := FDataView.GetValidName(Component);

end; {procedure, LoadSetName}



{******************************************************************************
 *
 ** G E N E R A L   R O U T I N E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppDataViews }

function ppDataViewClasses: TStrings;
begin

  if (FDataViewList = nil) then
    FDataViewList := TStringList.Create;

  Result := FDataViewList;

end; {function, ppDataViewClasses}

{------------------------------------------------------------------------------}
{ daGetDataViewClasses }

procedure daGetDataViewClasses(aList: TStrings);
begin

  aList.Assign(ppDataViewClasses);

end; {procedure, daGetDataViewTemplates}


{------------------------------------------------------------------------------}
{ daGetDataViewTemplates }

procedure daGetDataViewTemplates(aList: TStrings);
var
  liIndex: Integer;

begin

  aList.Assign(ppDataViewClasses);

  for liIndex := aList.Count-1 downto  0 do
    {delete any items that do not apply }
    if not TdaDataViewClass(aList.Objects[liIndex]).IsTemplate then
      aList.Delete(liIndex);

end; {procedure, daGetDataViewTemplates}

{------------------------------------------------------------------------------}
{ daGetDataViewWizardClasses }

procedure daGetDataViewWizardClasses(aSessionClass: TClass; aList: TStrings);
var
  liIndex: Integer;
  lDataViewClass: TdaDataViewClass;

begin

  aList.Assign(ppDataViewClasses);

  for liIndex := aList.Count-1 downto 0 do
    begin
      lDataViewClass := TdaDataViewClass(aList.Objects[liIndex]);

      {delete any items that do not apply}
      if (lDataViewClass.SessionClass <> aSessionClass) or
         (TdaDataViewClass(aList.Objects[liIndex]).IsTemplate) then
        aList.Delete(liIndex);

    end;

end; {procedure, daGetDataViewWizardClasses}


{------------------------------------------------------------------------------}
{ daGetDataViewSessionClasses }

procedure daGetDataViewSessionClasses(aList: TStrings);
var
  liIndex: Integer;
  lDataViewClass: TdaDataViewClass;
  lDataViewClasses: TStrings;
  lSessionClass: TdaSessionClass;

begin

  lDataViewClasses := ppDataViewClasses;

  aList.Clear;

  for liIndex := lDataViewClasses.Count-1 downto 0 do
    begin
      lDataViewClass := TdaDataViewClass(lDataViewClasses.Objects[liIndex]);

      lSessionClass := TdaSessionClass(lDataViewClass.SessionClass);

      if aList.IndexOf(lSessionClass.ClassDescription) < 0 then
        aList.AddObject(lSessionClass.ClassDescription, TObject(lSessionClass));

    end;


end; {procedure, daGetDataViewSessionClasses}





{------------------------------------------------------------------------------}
{ daRegisterDataView }

procedure daRegisterDataView(aDataViewClass: TdaDataViewClass);
var
  liIndex: Integer;
begin

  liIndex :=  ppDataViewClasses.IndexOf(aDataViewClass.ClassDescription);

  if liIndex >= 0 then Exit;

  RegisterClass(aDataViewClass);

  ppDataViewClasses.AddObject(aDataViewClass.ClassDescription, TObject(aDataViewClass));

end; {procedure, daRegisterDataView}

{------------------------------------------------------------------------------}
{ daUnRegisterDataView }

procedure daUnRegisterDataView(aDataViewClass: TdaDataViewClass);
var
  liIndex: Integer;
begin

  if (aDataViewClass = nil) then Exit;

  if (FDataViewList = nil) then Exit;

  UnRegisterClass(aDataViewClass);

  liIndex := ppDataViewClasses.IndexOf(aDataViewClass.ClassDescription);

  if liIndex >= 0 then
    ppDataViewClasses.Delete(liIndex);

end; {procedure, daUnRegisterDataView}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

finalization

  FDataViewList.Free;
  FDataViewList := nil;

end.

