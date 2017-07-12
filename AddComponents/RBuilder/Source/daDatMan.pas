{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daDatMan;

interface

{$I ppIfDef.pas}

uses
  SysUtils, Classes, Controls, Dialogs, Graphics, Forms, Menus, IniFiles,
  ppClass, ppComm, ppTypes, ppUtils, ppDsIntf, ppWizard, ppForms,
  ppDB, ppDsgner, ppDsgnDB,
  daDatMod, daDB, daDatWiz, daDatWin, daDataVw;

type
  TdaDataManager = class;


  { TdaDataWizardManager }
  TdaDataWizardManager = class(TppCommunicator)
    private
      FDataManager: TdaDataManager;
      FDataModule: TdaDataModule;
      FDataView: TdaCustomDataView;
      FDataWizards: TList;
      FLanguageIndex: Longint;
      FDataSettings: TppDataSettings;

      procedure SetDataModule(aDataModule: TdaDataModule);
      procedure SetDataSettings(aDataSettings: TppDataSettings);

      function CreateDataView(aDataViewClass: TClass): TdaCustomDataView;
      procedure DataWizardCreateDataViewEvent(Sender: TObject; var aDataView: TObject);
      procedure DataViewValidateNameEvent(Sender: TObject; const aName: String; var aNameValid: Boolean);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      function  CreateWizard(aWizardClass: TClass): TppWizard;
      procedure FreeWizard(aWizard: TppWizard);
      procedure AddWizard(aWizard: TppWizard);
      function FindWizard(aWizardClass: TClass): TppWizard;

      function GetSessionClass: TdaSessionClass;
      function DesignDataView(aDataView: TdaCustomDataView): Boolean;
      function NewDataView(var aDataView: TdaCustomDataView): Boolean;

      property DataManager: TdaDataManager read FDataManager write FDataManager;
      property DataModule: TdaDataModule read FDataModule write SetDataModule;
      property DataSettings: TppDataSettings read FDataSettings write SetDataSettings;
      property DataView: TdaCustomDataView read FDataView write FDataView;
      property LanguageIndex: Longint read FLanguageIndex write FLanguageIndex;

    end; {class, TdaDataWizardManager}


  { TdaDataManager }
  TdaDataManager = class(TppDesignModule)
    private
      FCurrentReport: TppCustomReport;
      FDataModule: TdaDataModule;
      FDataViewWindows: TStringList;
      FReportDesigner: TppDesignerWindow;
      FFileMenu: TMenuItem;
      FMenu: TMainMenu;
      FMenuItemDataSettings: TMenuItem;
      FMenuItemImportFromFile: TMenuItem;
      FReport: TppCustomReport;
      FWizardManager: TdaDataWizardManager;
      FWorkSpace: TScrollBox;

      procedure CreateControls;
      procedure CreateMenu;

      procedure FileMenuClickEvent(Sender: TObject);
      procedure FileMenuItemClickEvent(Sender: TObject);
      procedure DeleteDataViewEvent(Sender: TObject);
      procedure EditDataViewEvent(Sender: TObject);
      function  GetDataModuleForReport: TdaDataModule;
      procedure InitializeStatusBar;
      procedure SetAllowDataSettingsChange(aValue: Boolean);
      procedure SetDataModule(aDataModule: TdaDataModule);
      procedure SetReport(aReport: TppCustomReport);

      procedure CalcWindowPosition(aDataViewWindow: TdaDataViewToolWin);
      function  GetDataViewWindowForIndex(aIndex: Integer): TdaDataViewToolWin;
      function  AddDataViewWindow(aDataView: TdaDataView): TdaDataViewToolWin;
      procedure IntitializeDataViewWindows;
      procedure RemoveDataViewWindow(aIndex: Integer);
      procedure UpdateDataViewWindows;
      procedure FreeDataViewWindows;
      procedure SaveDataViewWindowStates;

      procedure DataModuleRemoveChildEvent(Sender: TObject);
      procedure DataModuleLanguageChangedEvent(Sender: TObject);

      procedure DesignerDataSettingsChangeEvent(Sender: TObject);

    protected
      procedure SetComponent(aComponent: TComponent); override;
      function  GetDataViewForIndex(aIndex: Integer): TdaDataView;
      procedure SetLanguageIndex(aLanguageIndex: Integer); override;

    public
      constructor CreateModule(aParent: TWinControl; aComponentDesigner: TppComponentDesigner); override;
      destructor Destroy; override;

      procedure ActiveChanging(var aAllowChange: Boolean); override;
      procedure SaveStateInfo; override;
      procedure LoadStateInfo; override;

      function DesignDataView(aDataView: TdaDataView): Boolean;
      procedure DisplayDataSettingsDialog;
      procedure NewDataView;
      procedure ImportDataModule;
      procedure ImportDataModuleFromFile;
      procedure MergeDataModule;
      procedure ExportDataModule;
      procedure ExportDataModuleToFile;

      property DataModule: TdaDataModule read FDataModule write SetDataModule;

   end; {class, TdaDataManager}


implementation

{$R daIDEBmp.res}

uses
  daDSDlg, daQryDsg, daQryWiz;


type
  TdaFileMenuCommandType = (fmDataSettings, fmNew, fmImport, fmMerge, fmExport, fmImportFromFile, fmExportToFile);

const
  cMenuCaptions: array [0..0] of Integer = (704); {&File}

  {'&Data Settings', '&New', '&Import', '&Merge', '&Export', '&Import From File', '&Export To File'}
  cFileMenuCaptions: array [Low(TdaFileMenuCommandType)..High(TdaFileMenuCommandType)] of Integer =
                     (701, 708, 705, 707, 702, 706, 703);


{------------------------------------------------------------------------------}
{ daDefaultDatabaseType }

function daDefaultDatabaseType(aDataOwner: TComponent; const aSessionType, aDatabaseName: String): TppDatabaseType;
var
  lSessionClass: TdaSessionClass;
  lSession: TdaSession;
begin

  Result := dtOther;

  lSessionClass := daGetSessionClass(aSessionType);

  if (lSessionClass <> nil) then
    begin
      lSession := lSessionClass.Create(nil);
      lSession.DataOwner := aDataOwner;
 
      Result := lSession.GetDatabaseType(aDatabaseName);

      lSession.Free;
    end;

end; {function, daDefaultDatabaseType}

{******************************************************************************
 *
 ** D A T A   W I Z A R D   M A N A G E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataWizardManager.Create }

constructor TdaDataWizardManager.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDataView := nil;
  FDataModule := nil;

  FDataWizards := TList.Create;
  FLanguageIndex := 0;

  FDataSettings := TppDataSettings.Create(Self);


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDataWizardManager.Destroy }

destructor TdaDataWizardManager.Destroy;
begin

  FDataSettings.Free;

  FDataWizards.Free;

  inherited Destroy;

end; {constructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDataWizardManager.Notify }

procedure TdaDataWizardManager.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator = FDataView) then
    FDataView := nil

  else if (aCommunicator = FDataModule) then
    FDataManager.DataModule := nil

  else if (aCommunicator = FDataSettings.DataDictionary) then
    FDataSettings.DataDictionary := nil

  else if (FDataWizards.IndexOf(aCommunicator) <> -1) then
    FDataWizards.Remove(aCommunicator);

end; {procedure, Notify}


{------------------------------------------------------------------------------}
{ TdaDataWizardManager.SetDataModule }

procedure TdaDataWizardManager.SetDataModule(aDataModule: TdaDataModule);
begin

  if FDataModule <> nil then
    FDataModule.RemoveNotify(Self);

  FDataModule := aDataModule;

  if FDataModule <> nil then
    FDataModule.AddNotify(Self);

end; {procedure, SetDataModule}

{------------------------------------------------------------------------------}
{ TdaDataWizardManager.SetDataSettings }

procedure TdaDataWizardManager.SetDataSettings(aDataSettings: TppDataSettings);
begin
  FDataSettings.Assign(aDataSettings);

end; {procedure, SetDataSettings}

{------------------------------------------------------------------------------}
{ TdaDataWizardManager.GetSessionClass }

function TdaDataWizardManager.GetSessionClass: TdaSessionClass;
begin
  Result := daGetSessionClass(FDataSettings.SessionType);

end; {function, GetSessionClass}


{------------------------------------------------------------------------------}
{ TdaDataWizardManager.NewDataView }

function TdaDataWizardManager.NewDataView(var aDataView: TdaCustomDataView): Boolean;
var
  lFormClass: TFormClass;
  lNewDialog: TppCustomNewDialog;
  lNextAction: TppNextActionType;
  lCreateClass: TdaDataViewClass;
  lWizard: TdaCustomDataWizard;

begin

   Result := False;

  {get the registered dialog class}
  lFormClass := ppGetFormClass(TppCustomNewDialog);

  {create the dialog}
  lNewDialog := TppCustomNewDialog(lFormClass.Create(Application));
  lNewDialog.LanguageIndex := FLanguageIndex;

  daGetDataViewTemplates(lNewDialog.TemplateClasses);
  daGetDataWizardClasses(daGetSessionClass(FDataSettings.SessionType), lNewDialog.WizardClasses);

  {show dialog}
  if (lNewDialog.ShowModal <> mrOK) or (lNewDialog.CreateClass = nil) then
    begin
      lNewDialog.Free;

      Exit;
    end;

  {try to get the wizard from the dialog (may be nil if not a persistent wizard}
  lCreateClass := TdaDataViewClass(lNewDialog.CreateClass);


  lNextAction := ppnaNone;

  {create the data view via a wizard}
  if (lCreateClass.InheritsFrom(TdaCustomDataWizard)) then
    begin
      {create the wizard, if needed}
      lWizard := TdaCustomDataWizard(CreateWizard(TppWizardClass(lCreateClass)));
      lWizard.EditMode := ppemAll;
      lWizard.LanguageIndex := FLanguageIndex;
      lWizard.OnCreateDataView := DataWizardCreateDataViewEvent;
      lWizard.OnValidateName   := DataViewValidateNameEvent;
      lWizard.SessionClass     := GetSessionClass;
      lWizard.DataSettings     := FDataSettings;

      if lWizard.Execute then
        begin
          FDataView.Template.DatabaseSettings.Name := lWizard.DataViewName;

          lNextAction := lWizard.NextAction;
        end
      else
        FDataView.Free;


      FreeWizard(lWizard);

    end

  {create the data view directly and call design}
  else if (lCreateClass.InheritsFrom(TdaCustomDataView)) then
    begin
      FDataView := CreateDataView(lCreateClass);

      FDataView.LanguageIndex := FLanguageIndex;
      FDataView.OnValidateName := DataViewValidateNameEvent;

      FDataView.Design;

      if not(FDataView.Valid) then
        FDataView.Free
      else
        lNextAction := FDataView.NextAction;

    end;

  {allow the data view to be previewed}
  if (FDataView <> nil) and (FDataView.Valid) then
    begin

      Result := True;
      aDataView := FDataView;

      if (FDataView <> nil) then

         case lNextAction of

           ppnaPreview:
             begin
               FDataView.Preview;

               FDataView.RemoveNotify(Self);
             end;

           ppnaDesign:
             DesignDataView(FDataView);

         end;

    end;

  FDataView := nil;
  
  lNewDialog.Free;

end; {procedure, NewDataView}

{------------------------------------------------------------------------------}
{ TdaDataWizardManager.DesignDataView }

function TdaDataWizardManager.DesignDataView(aDataView: TdaCustomDataView): Boolean;
var
  lWizard: TdaCustomDataWizard;
  lNextAction: TppNextActionType;

begin
  Result := False;

  lNextAction := ppnaNone;

  FDataView := aDataView;

  if (FDataView.DataDesignerClass <> nil) then
    lWizard := TdaCustomDataWizard(CreateWizard(FDataView.DataDesignerClass))
  else
    lWizard := nil;


  if (lWizard <> nil) then
    begin
      lWizard.LanguageIndex := FLanguageIndex;
      lWizard.OnCreateDataView := DataWizardCreateDataViewEvent;
      lWizard.OnValidateName   := DataViewValidateNameEvent;
      lWizard.EditMode := FDataView.EditMode;
      lWizard.SessionClass := GetSessionClass;
      lWizard.DataSettings := FDataSettings;

      if lWizard.Execute then
        begin
          FDataView.Template.DatabaseSettings.Name := lWizard.DataViewName;

          Result := True;
          lNextAction := lWizard.NextAction;
        end;

      FreeWizard(lWizard);
    end

  else
    begin
      FDataView.LanguageIndex := FLanguageIndex;
      FDataView.OnValidateName := DataViewValidateNameEvent;

      FDataView.Design;
      Result := True;

      lNextAction := FDataView.NextAction;
    end;

  {preview the data}
  if (FDataView <> nil) and (FDataView.Valid) then
    begin

      if (lNextAction = ppnaPreview) then
        FDataView.Preview;
    end;


  FDataView := nil;

end;  {procedure, DesignDataView}

{------------------------------------------------------------------------------}
{ TdaDataWizardManager.AddWizard }

procedure TdaDataWizardManager.AddWizard(aWizard: TppWizard);
begin

  if FDataWizards.IndexOf(aWizard) >= 0 then Exit;

  FDataWizards.Add(aWizard);
  aWizard.AddNotify(Self);

end; {procedure, AddWizard}


{------------------------------------------------------------------------------}
{ TdaDataWizardManager.CreateWizard }

function TdaDataWizardManager.CreateWizard(aWizardClass: TClass): TppWizard;
var
  liIndex: Integer;
  lWizards: TStringList;

begin

  Result := nil;

  {validate WizardClass}
  if (aWizardClass = nil) or not aWizardClass.InheritsFrom(TppWizard) then Exit;

  {try to find the wizard in the existing list}
  Result := FindWizard(aWizardClass);

  if (Result <> nil) then Exit;

  {search the owner and add any new wizards}
  lWizards := TppCommunicatorPickList.Create(FDataModule, TdaCustomDataWizard);

  for liIndex := 0 to lWizards.Count-1 do
    if FDataWizards.IndexOf(lWizards.Objects[liIndex]) < 0 then
      AddWizard(TppWizard(lWizards.Objects[liIndex]));

  {try to find the wizard in the updated list}
  Result := FindWizard(aWizardClass);

  if (Result <> nil) then Exit;

  {create a new wizard}
  Result := TppWizardClass(aWizardClass).Create(Self);

  AddWizard(Result);

  lWizards.Free;

end; {procedure, CreateWizard}



{------------------------------------------------------------------------------}
{ TdaDataWizardManager.FindWizard }

function TdaDataWizardManager.FindWizard(aWizardClass: TClass): TppWizard;
var
  liIndex: Integer;
  lbFound: Boolean;
  lWizard: TppWizard;
begin

  Result := nil;

  lbFound := False;
  liIndex := 0;

  while (liIndex < FDataWizards.Count) and not(lbFound) do
    begin
      lWizard := TppWizard(FDataWizards[liIndex]);

      if (lWizard.ClassType = aWizardClass) then
        lbFound := True
      else
        Inc(liIndex);

    end;

  if (lbFound) then
    Result := TppWizard(FDataWizards[liIndex]);

end; {procedure, FindWizard}



{------------------------------------------------------------------------------}
{ TdaDataWizardManager.FreeWizard }

procedure TdaDataWizardManager.FreeWizard(aWizard: TppWizard);
var
  liPosition: Integer;
begin

  if (aWizard = nil) then Exit;

  liPosition := FDataWizards.IndexOf(aWizard);

  if (liPosition = -1) then
    aWizard.Free;

end; {procedure, FreeWizard}

{------------------------------------------------------------------------------}
{ TdaDataWizardManager.DataWizardCreateDataViewEvent }

procedure TdaDataWizardManager.DataWizardCreateDataViewEvent(Sender: TObject; var aDataView: TObject);
var
  lDataViewClass: TComponentClass;
begin

  if (FDataView = nil) then
    begin

      if not(Sender is TdaCustomDataWizard) then Exit;

      lDataViewClass := daGetDataViewClassForWizardClass(GetSessionClass, Sender.ClassType);

      if (lDataViewClass = nil) then Exit;

      FDataView := CreateDataView(lDataViewClass);

    end;

  aDataView := FDataView;

end; {procedure, DataWizardCreateDataViewEvent}

{------------------------------------------------------------------------------}
{ TdaDataWizardManager.CreateDataView }

function TdaDataWizardManager.CreateDataView(aDataViewClass: TClass): TdaCustomDataView;
begin

  Result := TdaCustomDataViewClass(aDataViewClass).Create(FDataModule.Owner);

  Result.Parent := FDataModule;

  Result.AddNotify(Self);

  Result.New := True;

end; {procedure, CreateDataView}

{------------------------------------------------------------------------------}
{ TdaDataWizardManager.DataViewValidateNameEvent }

procedure TdaDataWizardManager.DataViewValidateNameEvent(Sender: TObject; const aName: String; var aNameValid: Boolean);
begin
  aNameValid := True;
end; {procedure, DataViewValidateNameEvent}


{******************************************************************************
 *
 ** D A T A   M AN A G E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataManager.CreateModule }

constructor TdaDataManager.CreateModule(aParent: TWinControl; aComponentDesigner: TppComponentDesigner);
begin

  inherited CreateModule(aParent, aComponentDesigner);

  Caption := ppLoadStr(742); {Data}
  OrderIndex := 1;

 { CreateControls;}

  FWorkspace := nil;

  FReport := nil;
  FCurrentReport := nil;
  FDataModule := nil;
  FDataViewWindows := TStringList.Create;

  FWizardManager := TdaDataWizardManager.Create(nil);
  FWizardManager.DataManager := Self;


end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TdaDataManager.Destroy }

destructor TdaDataManager.Destroy;
begin

  if (FReportDesigner <> nil) and (FReportDesigner.DataSettings <> nil) then
    TppDataSettings(FReportDesigner.DataSettings).OnChange := nil;

  {clear the data view window list, this
   will avoid the access violation that occurs
   when SetDataModule(nil) tries to free them explicity}
  FDataViewWindows.Clear;

  SetDataModule(nil);

  FDataViewWindows.Free;
  FWizardManager.Free;

  inherited Destroy;

end; {constructor, Destroy}


{------------------------------------------------------------------------------}
{ TdaDataManager.CreateControls }

procedure TdaDataManager.CreateControls;
begin

  CreateMenu;

  {create workspace scrollbox}
  FWorkSpace := TScrollBox.Create(Parent);
  FWorkSpace.Parent := Parent;
  FWorkSpace.Align := alClient;
  FWorkSpace.Color := clAppWorkSpace;

end; {procedure, CreateControls}


{------------------------------------------------------------------------------}
{ TdaDataManager.CreateMenu }

procedure TdaDataManager.CreateMenu;
var
  lMenuItem: TMenuItem;
  lFileCommandType: TdaFileMenuCommandType;
  lbAppendDots: Boolean;
begin
        
  FMenu := TMainMenu.Create(Parent);

  FFileMenu := TMenuItem.Create(Parent);
  FFileMenu.Caption := ppLoadStr(cMenuCaptions[0]);
  FFileMenu.OnClick := FileMenuClickEvent;

  FMenu.Items.Add(FFileMenu);

  {create File menu and subitems: Open, Save, SaveAs}

  for lFileCommandType := Low(TdaFileMenuCommandType) to High(TdaFileMenuCommandType) do
    begin

      lMenuItem := TMenuItem.Create(Parent);
      lMenuItem.Caption := ppLoadStr(cFileMenuCaptions[lFileCommandType]);
      lbAppendDots := (Pos('...', lMenuItem.Caption) = 0);
      if lbAppendDots then
        lMenuItem.Caption := lMenuItem.Caption  + '...';
      lMenuItem.Tag     := Ord(lFileCommandType);
      lMenuItem.OnClick := FileMenuItemClickEvent;

      if (lFileCommandType = fmDataSettings) then
        FMenuItemDataSettings := lMenuItem;

      if (lFileCommandType = fmImportFromFile) then
        FMenuItemImportFromFile := lMenuItem;


      if (lFileCommandType in [fmDataSettings, fmNew, fmExport]) then
        begin
          FFileMenu.Add(lMenuItem);
          lMenuItem := TMenuItem.Create(Parent);
          lMenuItem.Caption := '-';
        end;
        

      FFileMenu.Add(lMenuItem);

    end;

end; {procedure, CreateMenu}


{------------------------------------------------------------------------------}
{ TdaDataManager.LoadStateInfo }

procedure TdaDataManager.LoadStateInfo;
var
  lIniFile: TIniFile;

begin
  if FWorkSpace = nil then Exit;

  lIniFile := TIniFile.Create('RBuilder.ini');

  FWizardManager.DataSettings.LoadStateInfo(lIniFile, FDataModule);

  lIniFile.Free;

end; {procedure, LoadStateInfo}


{------------------------------------------------------------------------------}
{ TdaDataManager.SaveStateInfo }

procedure TdaDataManager.SaveStateInfo;
var
  lIniFile: TIniFile;

begin
  if FWorkspace = nil then Exit;

  lIniFile := TIniFile.Create('RBuilder.ini');

  FWizardManager.DataSettings.SaveStateInfo(lIniFile);

  lIniFile.Free;

end; {procedure, SaveStateInfo}

{------------------------------------------------------------------------------}
{ TdaDataManager.FreeDataViewWindows }

procedure TdaDataManager.FreeDataViewWindows;
var
  liIndex: Integer;
  
begin

  for liIndex := FDataViewWindows.Count-1 downto 0 do
    RemoveDataViewWindow(liIndex);

  FDataViewWindows.Clear;

end;   {procedure, FreeDataViewWindows}

{------------------------------------------------------------------------------}
{ TdaDataManager.SetComponent }

procedure TdaDataManager.SetComponent(aComponent: TComponent);
begin

  if (aComponent <> nil) and not (aComponent is TppCustomReport) then Exit;

  inherited SetComponent(aComponent);

  SetReport(TppCustomReport(aComponent));

end; {procedure, SetComponent}


{------------------------------------------------------------------------------}
{ TdaDataManager.SetReport }

procedure TdaDataManager.SetReport(aReport: TppCustomReport);
begin

  {do nothing, if this tab has never been active}
  if (FWorkspace = nil) then Exit;

  FReport := aReport;

  if (FReport <> nil) then
     SetLanguageIndex(FReport.LanguageIndex);


end; {procedure, SetReport}

{------------------------------------------------------------------------------}
{ TdaDataManager.GetDataModuleForReport }

function TdaDataManager.GetDataModuleForReport: TdaDataModule;
begin

 {create a new data module, if needed}
  if (FReport = nil) then
    Result := nil

  else if (daGetDataModule(FReport) = nil) then
    Result := TdaDataModule.CreateForReport(FReport)

  else
    Result := daGetDataModule(FReport);


end; {procedure, GetDataModuleForReport}

{------------------------------------------------------------------------------}
{ TdaDataManager.SetDataModule }

procedure TdaDataManager.SetDataModule(aDataModule: TdaDataModule);
begin

  if (FDataModule = aDataModule) then Exit;

  if (FDataModule <> nil) then
    begin
      FDataModule.OnRemoveChild := nil;
      FDataModule.OnLanguageChanged := nil;
      FreeDataViewWindows;
    end;

  FDataModule := aDataModule;
  FWizardManager.DataModule := aDataModule;

  if FDataModule <> nil then
    begin
      IntitializeDataViewWindows;
      FDataModule.OnRemoveChild := DataModuleRemoveChildEvent;
      FDataModule.OnLanguageChanged := DataModuleLanguageChangedEvent;
    end;

end; {procedure, SetDataModule}

{------------------------------------------------------------------------------}
{ TdaDataManager.SetAllowDataSettingsChange }

procedure TdaDataManager.SetAllowDataSettingsChange(aValue: Boolean);
var
  liIndex: Integer;
  
begin
  FMenuItemDataSettings.Visible := aValue;

  liIndex := FFileMenu.IndexOf(FMenuItemDataSettings);

  {set the line "-" item  visibility also}
  FFileMenu.Items[liIndex+1].Visible := FMenuItemDataSettings.Visible;

end; {procedure, SetAllowDataSettingsChange}



{------------------------------------------------------------------------------}
{ TdaDataManager.DataModuleRemoveChildEvent }

procedure TdaDataManager.DataModuleRemoveChildEvent(Sender: TObject);
var
  liIndex: Integer;

begin

  liIndex := FDataViewWindows.IndexOf(TdaDataView(Sender).UserName);

  if liIndex >= 0 then
    RemoveDataViewWindow(liIndex);

end; {procedure, DataModuleRemoveChildEvent}


{------------------------------------------------------------------------------}
{ TdaDataManager.ActiveChanging }

procedure TdaDataManager.ActiveChanging(var aAllowChange: Boolean);
var
  lbFirstTime: Boolean;
  lDataSettings: TppDataSettings;
{  liIndex: Integer;}

begin


  if (ComponentDesigner = nil) then Exit;

  if Active then
    begin

      SaveDataViewWindowStates;
      if (FReportDesigner <> nil) and (FReportDesigner.DataSettings <> nil) then
        TppDataSettings(FReportDesigner.DataSettings).Assign(FWizardManager.DataSettings);

    end
  else
    begin

      lbFirstTime := (FWorkspace = nil);

      if lbFirstTime then
        begin
         FReportDesigner := TppDesignerWindow(ComponentDesigner);
         CreateControls;
         if (FReportDesigner <> nil) then
           SetReport(FReportDesigner.Report);
         LoadStateInfo;

         if (FReportDesigner.DataSettings <> nil) then
           TppDataSettings(FReportDesigner.DataSettings).OnChange := DesignerDataSettingsChangeEvent;

        end;

      SetDataModule(GetDataModuleForReport);

      FCurrentReport := TppCustomReport(ComponentDesigner.CurrentComponent);

      ComponentDesigner.Menu := FMenu;

      if (FReport <> nil) and not (csDesigning in FReport.ComponentState) then
        begin
          if (FReportDesigner <> nil) and (FReportDesigner.DataSettings <> nil) then
            begin
              lDataSettings := TppDataSettings(FReportDesigner.DataSettings);

              if (lDataSettings.DatabaseType = dtOther) then
                lDataSettings.DatabaseType := daDefaultDatabaseType(DataModule.Owner, lDataSettings.SessionType, lDataSettings.DatabaseName);

              FWizardManager.DataSettings := lDataSettings;

            end;

          SetAllowDataSettingsChange(FReportDesigner.AllowDataSettingsChange);
        end;

      InitializeStatusBar;

      UpdateDataViewWindows;

    end;


end; {procedure, ActiveChanging}

{------------------------------------------------------------------------------}
{ TdaDataManager.DesignerDataSettingsChangeEvent }

procedure TdaDataManager.DesignerDataSettingsChangeEvent(Sender: TObject);
begin
  if (FReportDesigner <> nil) and (FReportDesigner.DataSettings <> nil) then
    FWizardManager.DataSettings := TppDataSettings(FReportDesigner.DataSettings);

end; {procedure, DesignerDataSettingsChangeEvent}


{------------------------------------------------------------------------------}
{ TdaDataManager.GetDataViewWindowForIndex }

function TdaDataManager.GetDataViewWindowForIndex(aIndex: Integer): TdaDataViewToolWin;
begin
  Result := TdaDataViewToolWin(FDataViewWindows.Objects[aIndex]);

end; {function, GetDataViewWindowForIndex}


{------------------------------------------------------------------------------}
{ TdaDataManager.GetDataViewForIndex }

function TdaDataManager.GetDataViewForIndex(aIndex: Integer): TdaDataView;
var
  lToolWindow: TdaDataViewToolWin;

begin
  lToolWindow := GetDataViewWindowForIndex(aIndex);

  Result := lToolWindow.DataView;

end; {function, GetDataViewForIndex}


{------------------------------------------------------------------------------}
{ TdaDataManager.IntitializeDataViewWindows }

procedure TdaDataManager.IntitializeDataViewWindows;
var
  liIndex: Integer;
  lDataView: TdaCustomDataView;
  lToolWindow: TdaDataViewToolWin;

begin
  if (FDataModule = nil) then Exit;

  for liIndex := 0 to FDataModule.DataViewCount-1 do
    begin

      lDataView := FDataModule.DataViews[liIndex];

      lToolWindow := AddDataViewWindow(lDataView);

      if (lDataView.Width > 0) then
        begin
          lToolWindow.Left   := lDataView.Left;
          lToolWindow.Top    := lDataView.Top;
          lToolWindow.Width  := lDataView.Width;
          lToolWindow.Height := lDataView.Height;

          {make sure window is wihin visible area}
          if lToolWindow.Left >=  FWorkSpace.ClientWidth then
            lToolWindow.Left := FWorkSpace.ClientWidth - 25;

          if lToolWindow.Top >=  FWorkSpace.ClientHeight then
            lToolWindow.Top := FWorkSpace.ClientHeight - 25;
        end;


    end;

end; {procedure, IntitializeDataViewWindows}


{------------------------------------------------------------------------------}
{ TdaDataManager.UpdateDataViewWindows }

procedure TdaDataManager.UpdateDataViewWindows;
var
  liIndex: Integer;
  lDataView: TdaCustomDataView;

begin
  if (FDataModule = nil) then Exit;

  for liIndex := 0 to FDataModule.DataViewCount-1 do
    begin
      lDataView := FDataModule.DataViews[liIndex];

      if FDataViewWindows.IndexOf(lDataView.UserName) < 0 then
        AddDataViewWindow(lDataView);

    end;

end; {procedure, UpdateDataViewWindows}


{------------------------------------------------------------------------------}
{ TdaDataManager.AddDataViewWindow }

function TdaDataManager.AddDataViewWindow(aDataView: TdaDataView): TdaDataViewToolWin;
var
  lToolWindow: TdaDataViewToolWin;

begin

  lToolWindow := TdaDataViewToolWin.Create(FWorkSpace);
  lToolWindow.Parent := FWorkSpace;
  lToolWindow.DataView := TdaCustomDataView(aDataView);
  lToolWindow.OnDeleteDataView := DeleteDataViewEvent;
  lToolWindow.OnEditDataView := EditDataViewEvent;

{$IFNDEF Delphi4}
  lToolWindow.Width := 258;
{$ELSE}
  lToolWindow.Width := 242;
{$ENDIF}

  CalcWindowPosition(lToolWindow);

  lToolWindow.Visible := True;

  FDataViewWindows.AddObject(aDataView.UserName, lToolWindow);

  Result := lToolWindow;

end; {procedure, AddDataViewWindow}


{------------------------------------------------------------------------------}
{ TdaDataManager.CalcWindowPosition }

procedure TdaDataManager.CalcWindowPosition(aDataViewWindow: TdaDataViewToolWin);
var
  lToolWindow: TdaDataViewToolWin;
  liMaxRight: Integer;
  liWindow: Integer;

begin

  liMaxRight  := 0;

  {calc max x pos for existing windows }
  for liWindow := 0 to FDataViewWindows.Count-1 do
    begin
      lToolWindow := TdaDataViewToolWin(FDataViewWindows.Objects[liWindow]);
      if liMaxRight < (lToolWindow.Left + lToolWindow.Width) then
        liMaxRight := (lToolWindow.Left + lToolWindow.Width);

    end;


  aDataViewWindow.Left := liMaxRight + 10;
  aDataViewWindow.Top := 10;

  {make sure window is within visible area}
  if aDataViewWindow.Left >=  FWorkSpace.ClientWidth then
    aDataViewWindow.Left := FWorkSpace.ClientWidth - 25;


end;{procedure, CalcWindowPosition}



{------------------------------------------------------------------------------}
{ TdaDataManager.RemoveDataViewWindow }

procedure TdaDataManager.RemoveDataViewWindow(aIndex: Integer);
var
  lDataViewWindow: TdaDataViewToolWin;

begin

  lDataViewWindow := GetDataViewWindowForIndex(aIndex);

  {save position props}
  lDataViewWindow.SavePositionState;

  lDataViewWindow.Free;

  FDataViewWindows.Delete(aIndex);


end;  {procedure, RemoveDataViewWindow}


{------------------------------------------------------------------------------}
{ TdaDataManager.SaveDataViewWindowStates }

procedure TdaDataManager.SaveDataViewWindowStates;
var
  liIndex: Integer;

begin

  for liIndex := 0 to FDataViewWindows.Count-1 do
    GetDataViewWindowForIndex(liIndex).SavePositionState;


end; {procedure, SaveDataViewWindowStates}


{------------------------------------------------------------------------------}
{ TdaDataManager.DeleteDataViewEvent }

procedure TdaDataManager.DeleteDataViewEvent(Sender: TObject);
var
  lDataViewWindow: TdaDataViewToolWin;

begin

  lDataViewWindow := TdaDataViewToolWin(Sender);

  {note: when DataView is free'd the DataModuleRemoveChildEvent handler will fire}
  lDataViewWindow.DataView.Free;

  FDataModule.Modified := True;

end;  {procedure, DeleteDataViewEvent}



{------------------------------------------------------------------------------}
{ TdaDataManager.EditDataViewEvent }

procedure TdaDataManager.EditDataViewEvent(Sender: TObject);
var
  lDataView: TdaDataView;
begin

  lDataView := TdaDataViewToolWin(Sender).DataView;

  if lDataView.EditMode = ppemPreview then
    lDataView.Preview

  else if DesignDataView(lDataView) then
    begin
      TdaDataViewToolWin(Sender).Refresh;
      FDataModule.Modified := True;
    end;


end;  {procedure, EditDataViewEvent}


{------------------------------------------------------------------------------}
{ TdaDataManager.NewDataView }

procedure TdaDataManager.NewDataView;
var
  lDataView: TdaCustomDataView;
begin

  if (FDataModule = nil) or (FReport = nil) then Exit;

  if FWizardManager.NewDataView(lDataView) then
    begin
      {if (FReport.DataPipeline = nil) then
        lDataView.Report := FReport
      else if (FCurrentReport.DataPipeline = nil) then
        lDataView.Report := FCurrentReport;}

      {TMO - always assign current report to dataview, even if data pipeline is not nil}
      lDataView.Report := FCurrentReport;

      AddDataViewWindow(lDataView);

      FDataModule.Modified := True;
    end;

end; {procedure, NewDataView}

{------------------------------------------------------------------------------}
{ TdaDataManager.DesignDataView }

function TdaDataManager.DesignDataView(aDataView: TdaDataView): Boolean;
begin

  aDataView.Active := False;

  Result := FWizardManager.DesignDataView(TdaCustomDataView(aDataView));


end;  {procedure, DesignDataView}

{------------------------------------------------------------------------------}
{ TdaDataManager.ImportDataModule }

procedure TdaDataManager.ImportDataModule;
begin

  if (FDataModule = nil) then Exit;

  FDataModule.Template.InitializeSettings(FReport.Template);

  if FDataModule.Template.ShowOpenDialog then
    begin
      FDataModule.Template.Load;

      {delete old data views}
      FreeDataViewWindows;

      {add new data views}
      IntitializeDataViewWindows;

      {connect report to first dataview}
      if FDataModule.DataViewCount > 0 then
        FDataModule.DataViews[0].Report := FReport;

      FDataModule.Modified := True;

    end;


end;  {procedure, ImportDataModule}

{------------------------------------------------------------------------------}
{ TdaDataManager.ImportDataModuleFromFile }

procedure TdaDataManager.ImportDataModuleFromFile;
begin

  if (FDataModule = nil) then Exit;

  FDataModule.Template.InitializeSettings(FReport.Template);
  FDataModule.Template.SaveTo := stFile;

  if FDataModule.Template.ShowOpenDialog then
    begin
      FDataModule.Template.Load;

      {delete old data views}
      FreeDataViewWindows;

      {add new data views}
      IntitializeDataViewWindows;

      {connect report to first dataview}
      if FDataModule.DataViewCount > 0 then
        begin

          if (FReport.DataPipeline = nil) then
            FDataModule.DataViews[0].Report := FReport

          else if (FCurrentReport.DataPipeline = nil) then
            FDataModule.DataViews[0].Report := FCurrentReport;

        end;

      FDataModule.Modified := True;

    end;


end;  {procedure, ImportDataModuleFromFile}





{------------------------------------------------------------------------------}
{ TdaDataManager.MergeDataModule }

procedure TdaDataManager.MergeDataModule;
var
  lTempModule: TdaDataModule;

begin

  if (FDataModule = nil) then Exit;


  {create a temporary module}
  lTempModule := TdaDataModule.Create(FDataModule.Owner);

  lTempModule.Template.InitializeSettings(FReport.Template);

  try

    if lTempModule.Template.ShowOpenDialog then
      begin
        lTempModule.Template.Load;

        {merge with existing data module}
        FDataModule.Merge(lTempModule);

        {add new data views}
        UpdateDataViewWindows;

        FDataModule.Modified := True;

      end;

  finally
    lTempModule.Free;

  end;

end;  {procedure, MergeDataModule}


{------------------------------------------------------------------------------}
{ TdaDataManager.ExportDataModule }

procedure TdaDataManager.ExportDataModule;
var
  liPos: Integer;
  lsDescription: String;
begin

  if (FDataModule = nil) then Exit;

  FDataModule.Template.InitializeSettings(FReport.Template);

  lsDescription := FDataModule.Template.Description;

  liPos := Pos('.', lsDescription);

  if (liPos <> 0) then
    lsDescription := Copy(lsDescription, 1, liPos - 1);

  FDataModule.Template.Description := lsDescription + ppLoadStr(742); {Data}

  if FDataModule.Template.ShowSaveDialog then
    begin
      SaveDataViewWindowStates;

      {FDataModule.Template.Format := ftASCII;}
      FDataModule.Template.Save;

    end;


end;  {procedure, ExportDataModule}



{------------------------------------------------------------------------------}
{ TdaDataManager.ExportDataModuleToFile }

procedure TdaDataManager.ExportDataModuleToFile;
begin

  if (FDataModule = nil) then Exit;

  FDataModule.Template.InitializeSettings(FReport.Template);

  FDataModule.Template.SaveTo := stFile;
  FDataModule.Template.Format := ftASCII;

  FDataModule.Template.Description := FDataModule.Template.Description + ' data';

  if FDataModule.Template.ShowSaveDialog then
    begin
      SaveDataViewWindowStates;

      {FDataModule.Template.Format := ftASCII;}
      FDataModule.Template.Save;

    end;


end;  {procedure, ExportDataModuleToFile}


{------------------------------------------------------------------------------}
{ TdaDataManager.FileMenuClickEvent }

procedure TdaDataManager.FileMenuClickEvent(Sender: TObject);
var
  liIndex: Integer;

begin

  {set visibility of explicit file import and export options}
  FMenuItemImportFromFile.Visible := FReportDesigner.AllowSaveToFile and (FCurrentReport.Template.SaveTo = stDataBase);

  liIndex := FFileMenu.IndexOf(FMenuItemImportFromFile);

  FFileMenu.Items[liIndex-1].Visible   := FMenuItemImportFromFile.Visible;
  FFileMenu.Items[liIndex+1].Visible   := FMenuItemImportFromFile.Visible;


end; {procedure, FileMenuClickEvent}


{------------------------------------------------------------------------------}
{ TdaDataManager.FileMenuItemClickEvent }

procedure TdaDataManager.FileMenuItemClickEvent(Sender: TObject);
begin

  case TdaFileMenuCommandType(TMenuItem(Sender).Tag) of
    fmDataSettings: DisplayDataSettingsDialog;
    fmNew: NewDataView;
    fmImport: ImportDataModule;
    fmMerge: MergeDataModule;
    fmExport: ExportDataModule;
    fmExportToFile: ExportDataModuleToFile;
    fmImportFromFile: ImportDataModuleFromFile;

  end;


end; {procedure, FileMenuItemClickEvent}

{------------------------------------------------------------------------------}
{ TdaDataManager.DisplayDataSettingsDialog }

procedure TdaDataManager.DisplayDataSettingsDialog;
var
  lDataSettingsDlg: TppCustomDataSettingsDialog;
  lFormClass: TFormClass;

begin

  if (FDataModule = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomDataSettingsDialog);

  lDataSettingsDlg := TppCustomDataSettingsDialog(lFormClass.Create(Application));
  lDataSettingsDlg.DataModule := FDataModule;
  lDataSettingsDlg.LanguageIndex := FCurrentReport.LanguageIndex;
  lDataSettingsDlg.DataSettings := FWizardManager.DataSettings;

  lDataSettingsDlg.ShowModal;

  lDataSettingsDlg.Free;

end; {procedure, DisplayDataSettingsDialog}

{------------------------------------------------------------------------------}
{ TdaDataManager.DataModuleLanguageChangedEvent}

procedure TdaDataManager.DataModuleLanguageChangedEvent(Sender: TObject);

begin

  if (FReport <> nil) then
    SetLanguageIndex(FReport.LanguageIndex);

end; {procedure, DataModuleLanguageChangedEvent}

{------------------------------------------------------------------------------}
{ TdaDataManager.SetLanguageIndex}

procedure TdaDataManager.SetLanguageIndex(aLanguageIndex: Longint);
var
  liIndex: Integer;
  lMenuItem: TMenuItem;
  lbAppendDots: Boolean;

begin
  inherited SetLanguageIndex(aLanguageIndex);

  Caption := ppLoadStr(742); {Data}

  if FFileMenu <> nil then
    begin
      FFileMenu.Caption := ppLoadStr(cMenuCaptions[0]);

      for liIndex := 0 to FFileMenu.Count-1 do
        begin
          lMenuItem :=  FFileMenu.Items[liIndex];

          if lMenuItem.Tag <= 0 then
            Continue;

          lMenuItem.Caption := ppLoadStr(cFileMenuCaptions[TdaFileMenuCommandType(lMenuItem.Tag)]);
          lbAppendDots := (Pos('...', lMenuItem.Caption) = 0);
          if lbAppendDots then
            lMenuItem.Caption := lMenuItem.Caption  + '...';

        end;
    end;

  {update tool windows}
  for liIndex := 0 to FDataViewWindows.Count-1 do
    GetDataViewWindowForIndex(liIndex).LanguageIndex := aLanguageIndex;

end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TdaDataManager.InitializeStatusBar}

procedure TdaDataManager.InitializeStatusBar;
begin
  StatusBar.SimplePanel := True;
  StatusBar.SimpleText  := ppLoadStr(180);

end; {procedure, InitializeStatusBar}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppResourceManager.AddResFileName('rbDADE');

  ppRegisterDesignModule(TdaDataManager, 'TppDesignerWindow');
  ppRegisterForm(TppCustomDataSettingsDialog, TdaDataSettingsDialog);

  daRegisterWizard(TdaQueryWizard);
  daRegisterWizard(TdaQueryDesigner);

finalization

  ppResourceManager.RemoveResFileName('rbDADE');

  ppUnRegisterDesignModule(TdaDataManager, 'TppDesignerWindow');
  ppUnRegisterForm(TppCustomDataSettingsDialog);

  daUnRegisterWizard(TdaQueryWizard);
  daUnRegisterWizard(TdaQueryDesigner);

end.
