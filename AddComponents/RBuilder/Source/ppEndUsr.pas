{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppEndUsr;

interface

{$I ppIfDef.pas}

uses
  ComCtrls, Classes, Forms, Graphics, Menus, Messages, Tabs,
  ppDsIntf, ppDsgner, ppReport, ppClass, ppTypes, ppComm, ppTmplat, ppWizard,
  ppDsgnDB;

type

  { TppDesigner }
  TppDesigner = class(TppCommunicator)
    private
      FAllowDataSettingsChange: Boolean;
      FAllowSaveToFile: Boolean;
      FCaption: String;
      FComponentClasses: TStrings;
      FNagem: Boolean;
      FIcon: TIcon;
      FMenu: TMainMenu;
      FMergeMenu: TMainMenu;
      FPosition: TPosition;
      FDesignerWindow: TppDesignerWindow;
      FReport: TppReport;
      FShowComponents: TppShowComponents;
      FShowData: Boolean;
      FTabsVisible: Boolean;
      FVisible: Boolean;
      FWindowHeight: Integer;
      FWindowLeft: Integer;
      FWindowState: TWindowState;
      FWindowTag: LongInt;
      FWindowTop: Integer;
      FWindowWidth: Integer;
      FDataSettings: TppDataSettings;

{$IFDEF WINDOWS}
      FSetPositionNeeded: Boolean;
{$ENDIF}

      {events}
      FOnActivate: TNotifyEvent;
      FOnAssignField: TNotifyEvent;
      FOnClose: TCloseEvent;
      FOnCreate: TNotifyEvent;
      FOnCreateComponent: TppComponentEvent;
      FOnCreateReport: TppCreateReportEvent;
      FOnCustomOpenDoc: TNotifyEvent;
      FOnCustomSaveDoc: TNotifyEvent;
      FOnDestroyComponent: TppComponentEvent;
      FOnDeActivate: TNotifyEvent;
      FOnDestroy: TNotifyEvent;
      FOnCloseQuery: TCloseQueryEvent;
      FOnGetDataNames: TppGetDataNamesEvent;
      FOnGetAliasForField: TppGetAliasForFieldEvent;
      FOnGetDisplayFormats: TppGetDisplayFormatsEvent;
      FOnGetFieldForAlias: TppGetFieldForAliasEvent;
      FOnGetFields: TppGetFieldsEvent;
      FOnHide: TNotifyEvent;
      FOnReportSelected: TNotifyEvent;
      FOnResize: TNotifyEvent;
      FOnSelectionChanged: TppSetSelectionEvent;
      FOnShow: TNotifyEvent;
      FOnTabChange: TppTabChangeEvent;
      FOnValidateComponent: TppValidateComponentEvent;

{$IFDEF WIN32}
      FRAPInterface: TppRAPInterfaceOptions;
      FRAPOptions: TppRAPOptions;

{$ENDIF}

{$IFDEF WINDOWS}
    procedure SetInitialPosition;
{$ENDIF}


      function GetCurrentReport: TppCustomReport;
      function GetFieldAliases: TStrings;
      function GetForm: TForm;
      function GetFormStyle: TFormStyle;
{$IFDEF WIN32}
      function GetNotebook: TPageControl;
{$ELSE}
      function GetNotebook: TTabbedNotebook;
{$ENDIF}
      procedure GetShowComponentClasses(aComponentClasses: TStrings);

      function GetShowData: Boolean;
      function GetTabSet: TTabset;
      function GetVisible: Boolean;
      function GetWindowHeight: Integer;
      function GetWindowLeft: Integer;
      function GetWindowTop: Integer;
      function GetWindowWidth: Integer;
      function GetWindowState: TWindowState;
      function GetWindowTag: LongInt;

      procedure DesignerWindowShowEvent(Sender: TObject);
      procedure DesignerWindowDestroyed(Sender: TObject);
      procedure IconChange(Sender: TObject);
      procedure SetAllowDataSettingsChange(aValue: Boolean);
      procedure SetAllowSaveToFile(aValue: Boolean);
      procedure SetComponentClasses(aComponentClasses: TStrings);
      procedure SetCaption(aCaption: String);
      procedure SetDataSettings(aDataSettings: TppDataSettings);
      procedure SetFormStyle(aFormStyle: TFormStyle);
      procedure SetFieldAliases(aFieldAliases: TStrings);
      procedure SetMergeMenu(aMenu: TMainMenu);
      procedure SetHeight(aHeight: Integer);
      procedure SetIcon(aIcon: TIcon);
      procedure SetLeft(aLeft: Integer);
      procedure SetPosition(aPosition: TPosition);
      procedure SetTabsVisible(aValue: Boolean);
      procedure SetTop(aTop: Integer);
      procedure SetVisible(aValue: Boolean);
      procedure SetWidth(aWidth: Integer);
      procedure SetWindowState(aWindowState: TWindowState);
      procedure SetWindowTag(aTag: LongInt);

      procedure SetOnActivate(aNotifyEvent: TNotifyEvent);
      procedure SetOnAssignField(aNotifyEvent: TNotifyEvent);
      procedure SetOnClose(aCloseEvent: TCloseEvent);
      procedure SetOnCloseQuery(aCloseQueryEvent: TCloseQueryEvent);
      procedure SetOnCreateComponent(aComponentEvent: TppComponentEvent);
      procedure SetOnCreateReport(aCreateReportEvent: TppCreateReportEvent);
      procedure SetOnCustomOpenDoc(aNotifyEvent: TNotifyEvent);
      procedure SetOnCustomSaveDoc(aNotifyEvent: TNotifyEvent);
      procedure SetOnDestroyComponent(aComponentEvent: TppComponentEvent);
      procedure SetOnDeactivate(aNotifyEvent: TNotifyEvent);
      procedure SetOnGetAliasForField(aGetAliasForFieldEvent: TppGetAliasForFieldEvent);
      procedure SetOnGetDataNames(aOnGetDataNamesEvent: TppGetDataNamesEvent);
      procedure SetOnGetDisplayFormats(aGetDisplayFormatsEvent: TppGetDisplayFormatsEvent);
      procedure SetOnGetFieldForAlias(aGetFieldForAliasEvent: TppGetFieldForAliasEvent);
      procedure SetOnGetFields(aOnGetFieldsEvent: TppGetFieldsEvent);
      procedure SetOnSelectionChanged(aSetSelectionEvent: TppSetSelectionEvent);
      procedure SetOnHide(aNotifyEvent: TNotifyEvent);
      procedure SetOnResize(aNotifyEvent: TNotifyEvent);
      procedure SetOnShow(aNotifyEvent: TNotifyEvent);
      procedure SetOnTabChange(aTabChangeEvent: TppTabChangeEvent);
      procedure SetOnReportSelected(aNotifyEvent: TNotifyEvent);
      procedure SetRAPInterface(aInterfaceOptions: TppRAPInterfaceOptions);
      procedure SetRAPOptions(aRAPOptions: TppRAPOptions);
      procedure SetReport(aReport: TppReport);
      procedure SetShowComponents(aShowComponents: TppShowComponents);
      procedure SetShowData(Value: Boolean);
      procedure SetOnValidateComponent(aValidateComponentEvent: TppValidateComponentEvent);
      procedure ShowNagDlg;
      procedure ReportDestroyed(Sender: TObject);

    protected
      procedure Loaded; override;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      procedure BringToFront;
      procedure Close;
      procedure Hide;
      procedure Invalidate;
      procedure PrintReport;
      procedure SendToBack;
      procedure SetBounds(aLeft, aTop, aWidth, aHeight: Integer);
      procedure SetSelection(aSelection: TppDesignerSelectionList);

      procedure Show;
      procedure ShowModal;
      procedure UpdateDocHistory(aTemplate: TppTemplate);

      property ComponentClasses: TStrings read FComponentClasses write SetComponentClasses;
      property CurrentReport: TppCustomReport read GetCurrentReport;
      property FieldAliases: TStrings read GetFieldAliases write SetFieldAliases;
      property Form: TForm read GetForm;
      property FormStyle: TFormStyle read GetFormStyle write SetFormStyle default fsNormal;
      property Menu: TMainMenu read FMenu;
 {$IFDEF WIN32}
      property Notebook: TPageControl read GetNotebook;
 {$ELSE}
      property Notebook: TTabbedNotebook read GetNotebook;
      property ShowComponents: TppShowComponents read FShowComponents write SetShowComponents;
                                               {default cAllShowComponents;}
 {$ENDIF}

      property TabSet: TTabset read GetTabSet;

     {public events - support for versions 3.52 and prior}
      property OnGetAliasForField: TppGetAliasForFieldEvent read FOnGetAliasForField write SetOnGetAliasForField;
      property OnGetFieldForAlias: TppGetFieldForAliasEvent read FOnGetFieldForAlias write SetOnGetFieldForAlias;

 published
      property Caption: String read FCaption write SetCaption;
      property MergeMenu: TMainMenu read FMergeMenu write SetMergeMenu;
      property Icon: TIcon read FIcon write SetIcon;
      property Position: TPosition read FPosition write SetPosition;
      property AllowDataSettingsChange: Boolean read FAllowDataSettingsChange write SetAllowDataSettingsChange default False;
      property AllowSaveToFile: Boolean read FAllowSaveToFile write SetAllowSaveToFile default True;

{$IFDEF WIN32}
      property ShowComponents: TppShowComponents read FShowComponents write SetShowComponents
                                               default cAllShowComponents;

      property RAPInterface: TppRAPInterfaceOptions read FRAPInterface write SetRAPInterface
                                               default cAllRAPInterfaceOptions;
      property RAPOptions: TppRAPOptions read FRAPOptions write SetRAPOptions
                                               default cAllRAPOptions;

{$ENDIF}

      property DataSettings: TppDataSettings read FDataSettings write SetDataSettings;


      property Report: TppReport read FReport write SetReport;
      property ShowData: Boolean read GetShowData write SetShowData default True;
      property TabsVisible: Boolean read FTabsVisible write SetTabsVisible default True;
      property Visible: Boolean read GetVisible write SetVisible default True;
      property WindowHeight: Integer read GetWindowHeight write SetHeight;
      property WindowLeft: Integer read GetWindowLeft write SetLeft;
      property WindowTop: Integer read GetWindowTop write SetTop;
      property WindowWidth: Integer read GetWindowWidth write SetWidth;
      property WindowState: TWindowState read GetWindowState write SetWindowState default wsNormal;
      property WindowTag: LongInt read GetWindowTag write SetWindowTag default 0;

      {events}
      property OnActivate: TNotifyEvent read FOnActivate write SetOnActivate;
      property OnAssignField: TNotifyEvent read FOnAssignField write SetOnAssignField;
      property OnClose: TCloseEvent read FOnClose write SetOnClose;
      property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write SetOnCloseQuery;
      property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
      property OnCreateComponent: TppComponentEvent read FOnCreateComponent write SetOnCreateComponent;
      property OnCreateReport: TppCreateReportEvent read FOnCreateReport write SetOnCreateReport;
      property OnCustomOpenDoc: TNotifyEvent read FOnCustomOpenDoc write SetOnCustomOpenDoc;
      property OnCustomSaveDoc: TNotifyEvent read FOnCustomSaveDoc write SetOnCustomSaveDoc;
      property OnDestroyComponent: TppComponentevent read FOnDestroyComponent write SetOnDestroyComponent;
      property OnDeactivate: TNotifyEvent read FOnDeactivate write SetOnDeactivate;
      property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
      property OnGetDataNames: TppGetDataNamesEvent read FOnGetDataNames write SetOnGetDataNames;
      property OnGetDisplayFormats: TppGetDisplayFormatsEvent read FOnGetDisplayFormats write SetOnGetDisplayFormats;
      property OnGetFields: TppGetFieldsEvent read FOnGetFields write SetOnGetFields;
      property OnHide: TNotifyEvent read FOnHide write SetOnHide;
      property OnResize: TNotifyEvent read FOnResize write SetOnResize;
      property OnReportSelected: TNotifyEvent read FOnReportSelected write SetOnReportSelected;
      property OnSelectionChanged: TppSetSelectionEvent read FOnSelectionChanged write SetOnSelectionChanged;
      property OnShow: TNotifyEvent read FOnShow write SetOnShow;
      property OnTabChange: TppTabChangeEvent read FOnTabChange write SetOnTabChange;
      property OnValidateComponent: TppValidateComponentEvent read FOnValidateComponent write SetOnValidateComponent;

  end; {class, TppDesigner }


implementation

uses ppForms, ppUtils, TypInfo, ppCmpReg;

{------------------------------------------------------------------------------}
{ TppDesigner.ShowNagDlg }

procedure TppDesigner.ShowNagDlg;
var
  lDemoDialog: TppCustomDemoDialog;
  lFormClass: TFormClass;

begin

  if FNagem then
    begin
      FNagem := False;
      lFormClass := ppGetFormClass(TppCustomDemoDialog);
      lDemoDialog := TppCustomDemoDialog(lFormClass.Create(Application));
      lDemoDialog.ShowModal;
      lDemoDialog.Release;
    end;


end;


{------------------------------------------------------------------------------}
{ TppDesigner.Create }

constructor TppDesigner.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAllowDataSettingsChange := False;
  FAllowSaveToFile := True;

  FCaption := 'ReportBuilder';

{$IFDEF Demo}
  FNagem := True;
{$ELSE}
  FNagem := False;
{$ENDIF}

  FMenu         := nil;
  FMergeMenu    := nil;
  FWindowHeight := 400;
  FIcon         := TIcon.Create;
  FIcon.OnChange := IconChange;
  FWindowLeft   := 100;
  FPosition     := poScreenCenter;
  FReport       := nil;
  FShowData     := True;
  FTabsVisible  := True;
  FWindowTop    := 50;
  FVisible      := True;
  FWindowWidth  := 600;
  FWindowState  := wsNormal;
  FWindowTag    := 0;

  FDataSettings := TppDataSettings.Create(Self);

  FShowComponents := cAllShowComponents;
  FComponentClasses := TStringList.Create;
  GetShowComponentClasses(FComponentClasses);


{$IFDEF WIN32}
  FRAPInterface := cAllRAPInterfaceOptions;
  FRAPOptions   := cAllRAPOptions;
{$ENDIF}

  {events }
  FOnActivate             := nil;
  FOnAssignField          := nil;
  FOnClose                := nil;
  FOnCloseQuery           := nil;
  FOnCreate               := nil;
  FOnDeactivate           := nil;
  FOnDestroy              := nil;
  FOnGetAliasForField     := nil;
  FOnGetDataNames         := nil;
  FOnGetDisplayFormats    := nil;
  FOnGetFieldForAlias     := nil;
  FOnGetFields            := nil;
  FOnHide                 := nil;
  FOnSelectionChanged     := nil;
  FOnShow                 := nil;
  FOnResize               := nil;
  FOnTabChange            := nil;

{$IFDEF WINDOWS}
  FSetPositionNeeded := True;
{$ENDIF}

  {create designer for run-time only}
  if (csDesigning in ComponentState)  then
    FDesignerWindow := nil
  else
    begin
      FDesignerWindow := TppDesignerWindow.Create(Self);
      FDesignerWindow.OnFormDestroy   := DesignerWindowDestroyed;
      FDesignerWindow.OnReportDestroy := ReportDestroyed;
      FDesignerWindow.OnShow          := DesignerWindowShowEvent;
      FMenu := FDesignerWindow.MainMenu;
    end;


end;


{------------------------------------------------------------------------------}
{ TppDesigner.Destroy }

destructor TppDesigner.Destroy;
begin

  if Assigned(FOnDestroy) then FOnDestroy(Self);

  FDataSettings.Free;
  FReport := nil;
  FIcon.Free;
  FComponentClasses.Free;

  {let MDI Parent free the child window}
  if (FDesignerWindow <> nil) and (FDesignerWindow.FormStyle = fsMDIChild) then
    begin
      FDesignerWindow.OnFormDestroy   := nil;
      FDesignerWindow.OnReportDestroy := nil;
      FDesignerWindow.OnShow          := nil;
      FDesignerWindow := nil;
    end;

  FDesignerWindow.Free;

  inherited Destroy;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.Loaded }

procedure TppDesigner.Loaded;
begin

  inherited Loaded;

  if FDesignerWindow <> nil then
    begin

      {assign report to the designer window}
      FDesignerWindow.Component := FReport;

      SetShowData(FShowData);

      SetDataSettings(FDataSettings);

      FDesignerWindow.LoadStateInfo;

      {note: must set this in the Loaded for Delphi 5 or get an error.}
      FDesignerWindow.RAPInterface := FRAPInterface;

    end;

  if Assigned(FOnCreate) then FOnCreate(Self);

end;


{$IFDEF TEST}

{------------------------------------------------------------------------------}
{ TppDesigner.CreateDesignerWindow }

procedure TppDesigner.CreateDesignerWindow;
begin

  if (FDesignerWindow <> nil) then Exit;

  if (csDesigning in ComponentState) then Exit;

  FDesignerWindow := TppDesignerWindow.Create(Self);

  {internal events}
  FDesignerWindow.OnFormDestroy   := DesignerWindowDestroyed;
  FDesignerWindow.OnReportDestroy := ReportDestroyed;
  FDesignerWindow.OnShow          := ShowNagDlg;

  FMenu := FDesignerWindow.MainMenu;


  FDesignerWindow.Caption := FCaption;
  FDesignerWindow.MainMenu.Merge(FMergeMenu);

  FDesignerWindow.Icon     := FIcon;

{$IFDEF WIN32}
  FDesignerWindow.Position := FPosition;
{$ENDIF}

   {optimization}
   if (FShowComponents <> cAllShowComponents) then
     FDesignerWindow.ComponentClasses := FComponentClasses;

   FDesignerWindow.Report       := FReport;
   SetShowData(FShowData);
  
   FDesignerWindow.SetTabsVisible(FTabsVisible);
   FDesignerWindow.Height      := FWindowHeight;
   FDesignerWindow.Left        := FWindowLeft;
   FDesignerWindow.Top         := FWindowTop;
   FDesignerWindow.Width       := FWindowWidth;
   FDesignerWindow.WindowState := FWindowState;
   FDesignerWindow.Tag         := FWindowTag;

   {pass-thru events}
   FDesignerWindow.OnActivate          := FOnActivate;
   FDesignerWindow.OnAssignField       := FOnAssignField;
   FDesignerWindow.OnClose             := FOnClose;
   FDesignerWindow.OnCloseQuery        := FOnCloseQuery;
   FDesignerWindow.OnCreateComponent   := FOnCreateComponent;
   FDesignerWindow.OnDeactivate        := FOnDeactivate;
   FDesignerWindow.OnGetAliasForField  := FOnGetAliasForField;
   FDesignerWindow.OnGetDisplayFormats := FOnGetDisplayFormats;
   FDesignerWindow.OnGetFieldForAlias  := FOnGetFieldForAlias;
   FDesignerWindow.OnHide              := FOnHide;
   FDesignerWindow.OnResize            := FOnResize;
   FDesignerWindow.OnReportSelected    := FOnReportSelected;
   FDesignerWindow.OnSetSelection      := FOnSelectionChanged;
   FDesignerWindow.OnShow              := FOnShow;
   FDesignerWindow.OnTabChange         := FOnTabChange;

end;

{$ENDIF}


{------------------------------------------------------------------------------}
{ TppDesigner.DesignerWindowShowEvent}

procedure TppDesigner.DesignerWindowShowEvent(Sender: TObject);
begin

  if (FDesignerWindow <> nil) then
    begin
      FDesignerWindow.SetTabsVisible(FTabsVisible);
      FDesignerWindow.RAPInterface := FRAPInterface;
      FDesignerWindow.RAPOptions := FRAPOptions;
    end;

  ShowNagDlg;

  if Assigned(FOnShow) then FOnShow(FDesignerWindow);

end; {procedure, DesignerWindowShowEvent}


{------------------------------------------------------------------------------}
{ TppDesigner.DesignerWindowDestroyed}

procedure TppDesigner.DesignerWindowDestroyed(Sender: TObject);
begin
  FDesignerWindow := nil;
end;


{------------------------------------------------------------------------------}
{ TppDesigner.ReportDestroyed}

procedure TppDesigner.ReportDestroyed(Sender: TObject);
begin
  FReport := nil;
end;


{------------------------------------------------------------------------------}
{ TppDesigner.Notification }

procedure TppDesigner.Notification(AComponent: TComponent; Operation: TOperation);
begin

  inherited Notification(AComponent, Operation);

  if (aComponent = FReport) and (Operation = opRemove) then
    FReport := nil

  else if (aComponent = FMergeMenu) and (Operation = opRemove) then
    FMergeMenu := nil
  else if (aComponent = FDesignerWindow) and (Operation = opRemove) then
     FDesignerWindow := nil;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.Notify }

procedure TppDesigner.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator = FDataSettings.DataDictionary) then
    FDataSettings.DataDictionary := nil;

end; {procedure, Notify}



{------------------------------------------------------------------------------}
{ TppDesigner.SetMergeMenu }

procedure TppDesigner.SetMergeMenu(aMenu: TMainMenu);
begin

  FMergeMenu := aMenu;

  {merge MergeMenu with DesignerWindow's menu}
  if (FDesignerWindow <> nil) then
    FDesignerWindow.MainMenu.Merge(FMergeMenu);


end;


{------------------------------------------------------------------------------}
{ TppDesigner.SetReport }

procedure TppDesigner.SetReport(aReport: TppReport);
begin

  if (FReport = aReport) then Exit;

  {remove old designer window }
  if (FDesignerWindow <> nil) and (FReport <> nil) then
    FDesignerWindow.Component := nil;

  FReport := aReport;

  {if reading or loading, do not attach report to designer, until the loaded}
  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

 {assign report to the designer window}
 if (FDesignerWindow <> nil) then
    FDesignerWindow.Component := aReport;

 if (FReport <> nil) then
   SetShowData(FShowData);

end;

{------------------------------------------------------------------------------}
{ TppDesigner.GetForm }

function TppDesigner.GetForm: TForm;
begin
  Result := TForm(FDesignerWindow);

end;


{------------------------------------------------------------------------------}
{ TppDesigner.GetFormStyle }

function TppDesigner.GetFormStyle: TFormStyle;
begin
  if (FDesignerWindow = nil) then
    Result := fsNormal
  else
    Result := FDesignerWindow.FormStyle;
end;


{------------------------------------------------------------------------------}
{ TppDesigner.GetNotebook }

{$IFDEF WIN32}
function TppDesigner.GetNotebook: TPageControl;
{$ELSE}
function TppDesigner.GetNotebook: TTabbedNotebook;
{$ENDIF}

begin
  if (FDesignerWindow = nil) then
    Result := nil
  else
    Result := FDesignerWindow.Notebook;
end;

{------------------------------------------------------------------------------}
{ TppDesigner.GetShowData }

function TppDesigner.GetShowData: Boolean;
begin
  if (FReport = nil) or (csDesigning in ComponentState) then
    Result := FShowData
  else
    Result := (pppcDisplayData in FReport.DesignState);
end;


{------------------------------------------------------------------------------}
{ TppDesigner.GetTabset }

function TppDesigner.GetTabset: TTabset;
begin
  if (FDesignerWindow = nil) then
    Result := nil
  else
    Result := FDesignerWindow.tbsReport;
end;



{------------------------------------------------------------------------------}
{ TppDesigner.GetVisible }

function TppDesigner.GetVisible: Boolean;
begin
  if (FDesignerWindow = nil) then
    Result := FVisible
  else
    Result := FDesignerWindow.Visible;
end;

{------------------------------------------------------------------------------}
{ TppDesigner.GetWindowHeight }

function TppDesigner.GetWindowHeight: Integer;
begin

  if (FDesignerWindow = nil) then
    Result := FWindowHeight
  else
    Result := FDesignerWindow.Height;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.GetWindowLeft }

function TppDesigner.GetWindowLeft: Integer;
begin

  if (FDesignerWindow = nil) then
    Result := FWindowLeft
  else
    Result := FDesignerWindow.Left;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.GetWindowTop }

function TppDesigner.GetWindowTop: Integer;
begin

  if (FDesignerWindow = nil) then
    Result := FWindowTop
  else
    Result := FDesignerWindow.Top;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.GetWindowWidth }

function TppDesigner.GetWindowWidth: Integer;
begin

  if (FDesignerWindow = nil) then
    Result := FWindowWidth
  else
    Result := FDesignerWindow.Width;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.GetWindowState }

function TppDesigner.GetWindowState: TWindowState;
begin

  if (FDesignerWindow = nil) then
    Result := FWindowState
  else
    Result := FDesignerWindow.WindowState;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.GetWindowTag }

function TppDesigner.GetWindowTag: LongInt;
begin

  if (FDesignerWindow = nil) then
    Result := FWindowTag
  else
    Result := FDesignerWindow.Tag;

end;

{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppDesigner.SetRAPInterface }

procedure TppDesigner.SetRAPInterface(aInterfaceOptions: TppRAPInterfaceOptions);
var
  lNewOptions: TppRAPInterfaceOptions;

begin
  if (FRAPInterface = aInterfaceOptions) then Exit;

  lNewOptions := aInterfaceOptions - FRAPInterface;

  FRAPInterface := aInterfaceOptions;

  {note: must set this in the Loaded for Delphi 5 or get an error.}
  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (FDesignerWindow <> nil) and (FDesignerWindow.Visible) then
    FDesignerWindow.RAPInterface := FRAPInterface;


  {if no interface then no options }
  if (FRAPInterface = []) then
    FRAPOptions := []

  else if (FRAPInterface = [riDialog]) then
    FRAPOptions := cRAPDialogOptions

  else if (riNotebookTab in lNewOptions) then
    FRAPOptions := cALLRAPOptions;


end; {procedure, SetRAPInterface}


{------------------------------------------------------------------------------}
{ TppDesigner.SetRAPOptions }

procedure TppDesigner.SetRAPOptions(aRAPOptions: TppRAPOptions);
begin

  {cannot set any options if interface is turned off}
  if (FRAPInterface = []) then Exit;

  {if interface is dialog only dialog options may be set}
  if (FRAPInterface = [riDialog]) then
    FRAPOptions := (aRAPOptions * cRAPDialogOptions) + [roViewVariables]
  else
    begin
      {when notebook tab is visible, user can at a minimum view the variables}
      FRAPOptions := aRAPOptions + [roViewVariables];

      {if editing allowed, then viewing must be allowed also}
      if (roEditEvents in FRAPOptions) then
        FRAPOptions := aRAPOptions + [roViewEvents];

      if (roEditGlobals in FRAPOptions) then
        FRAPOptions := aRAPOptions + [roViewGlobals];

    end;

  if (FDesignerWindow <> nil) and (FDesignerWindow.Visible) then
    FDesignerWindow.RAPOptions := FRAPOptions;

end; {procedure, FRAPOptions}

{$ENDIF}

{------------------------------------------------------------------------------}
{ TppDesigner.SetShowComponents }

procedure TppDesigner.SetShowComponents(aShowComponents: TppShowComponents);
var
  lComponentClasses: TStringList;

begin

  if (FShowComponents = aShowComponents) then Exit;

  FShowComponents := aShowComponents;

  lComponentClasses := TStringList.Create;

  GetShowComponentClasses(lComponentClasses);

  SetComponentClasses(lComponentClasses);

  lComponentClasses.Free;

end; {procedure, SetShowComponents}


{------------------------------------------------------------------------------}
{ TppDesigner.SetComponentClasses}

procedure TppDesigner.SetComponentClasses(aComponentClasses: TStrings);
begin

   FComponentClasses.Assign(aComponentClasses);

  if (FDesignerWindow <> nil) then
    FDesignerWindow.ComponentClasses := FComponentClasses;

end; {procedure, SetComponentClasses}

{------------------------------------------------------------------------------}
{ TppDesigner.SetComponentClasses}

procedure TppDesigner.SetAllowSaveToFile(aValue: Boolean);
begin

  FAllowSaveToFile := aValue;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.AllowSaveToFile := FAllowSaveToFile;

end; {procedure, SetComponentClasses}


{------------------------------------------------------------------------------}
{ TppDesigner.SetAllowDataSettingsChange}

procedure TppDesigner.SetAllowDataSettingsChange(aValue: Boolean);
begin

  FAllowDataSettingsChange := aValue;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.AllowDataSettingsChange := FAllowDataSettingsChange;

end; {procedure, SetAllowDataSettingsChange}


{------------------------------------------------------------------------------}
{ TppDesigner.GetShowComponentClasses}

procedure TppDesigner.GetShowComponentClasses(aComponentClasses: TStrings);
var
  liIndex: Integer;
  liClass: Integer;
  lEnumNames: TStringList;
  lsClassName: String;
  lHideComponents: TStringList;

begin

  lEnumNames := TStringList.Create;
  lHideComponents := TStringList.Create;

  {get list of enum names}
  ppGetEnumNames(TypeInfo(TppShowComponent), lEnumNames);

  {determine list of components to be ommitted (i.e. not shown on palette}
  for liIndex := lEnumNames.Count-1 downto 0 do
    if TppShowComponent(liIndex) in FShowComponents then
      lEnumNames.Delete(liIndex);

  {build list of classnames for items to be hidden}
  for liIndex := 0 to lEnumNames.Count-1 do
    begin
      lsClassName := 'Tpp' + Copy(lEnumNames[liIndex],3, Length(lEnumNames[liIndex]));

      lHideComponents.Add(lsClassName);

    end;


  {get list of all registered classes}
  aComponentClasses.Assign(ppComponentClassList);

  {delete any class to be hidden}
  for liClass := 0 to lHideComponents.Count-1 do
    begin
      liIndex := aComponentClasses.IndexOf(lHideComponents[liClass]);

      if liIndex >= 0 then
        aComponentClasses.Delete(liIndex);

    end;


  lHideComponents.Free;
  lEnumNames.Free;


end; {procedure, GetShowComponentClasses}


{------------------------------------------------------------------------------}
{ TppDesigner.SetShowData }

procedure TppDesigner.SetShowData(Value: Boolean);
begin
  FShowData := Value;

  if (csDesigning in ComponentState) then Exit;

  if (FReport = nil) then Exit;

  if (FShowData) and not(pppcDisplayData in FReport.DesignState) then
    FReport.DSInclude([pppcDisplayData])

  else if not(FShowData) and (pppcDisplayData in FReport.DesignState) then
    FReport.DSExclude([pppcDisplayData]);

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetTabsVisible }

procedure TppDesigner.SetTabsVisible(aValue: Boolean);
begin
  FTabsVisible := aValue;

  {note: must set this in the Loaded for Delphi 5 or get an error.}
  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.SetTabsVisible(aValue);

end;

{------------------------------------------------------------------------------}
{ TppDesigner.BringToFront }

procedure TppDesigner.BringToFront;
begin
  if (FDesignerWindow <> nil) then
    FDesignerWindow.BringToFront;
end;

{------------------------------------------------------------------------------}
{ TppDesigner.Close }

procedure TppDesigner.Close;
begin
  if (FDesignerWindow <> nil) then
    FDesignerWindow.Close;
end;

{------------------------------------------------------------------------------}
{ TppDesigner.Show }

procedure TppDesigner.Show;
begin

{$IFDEF WINDOWS}
  if FSetPositionNeeded then
    begin
      SetInitialPosition;
      FSetPositionNeeded := False;
    end;
{$ENDIF}

  if (FDesignerWindow <> nil) then
    FDesignerWindow.Show;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.ShowModal }

procedure TppDesigner.ShowModal;
begin

{$IFDEF WINDOWS}
  if FSetPositionNeeded then
    begin
      SetInitialPosition;
      FSetPositionNeeded := False;
    end;
{$ENDIF}

  if (FDesignerWindow <> nil) then
    begin

      FDesignerWindow.DesignerState := FDesignerWindow.DesignerState + [dsModal];

      try
        FDesignerWindow.ShowModal;
      finally
        FDesignerWindow.DesignerState := FDesignerWindow.DesignerState - [dsModal];
      end;

    end;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.Hide }

procedure TppDesigner.Hide;
begin
  if (FDesignerWindow <> nil) then
    FDesignerWindow.Hide;
end;


{------------------------------------------------------------------------------}
{ TppDesigner.UpdateDocHistory }

procedure TppDesigner.UpdateDocHistory(aTemplate: TppTemplate);
begin
  if (FDesignerWindow <> nil) then
    FDesignerWindow.UpdateDocHistory(aTemplate);
end; {procedure, UpdateDocHistory}


{------------------------------------------------------------------------------}
{ TppDesigner.Invalidate }

procedure TppDesigner.Invalidate;
begin
  if (FDesignerWindow <> nil) then
    FDesignerWindow.Invalidate;
end;

{------------------------------------------------------------------------------}
{ TppDesigner.PrintReport }

procedure TppDesigner.PrintReport;
begin
  FDesignerWindow.Viewer.Print;
end;

{------------------------------------------------------------------------------}
{ TppDesigner.SendToBack }

procedure TppDesigner.SendToBack;
begin
  if (FDesignerWindow <> nil) then
    FDesignerWindow.SendToBack;
end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetBounds }

procedure TppDesigner.SetBounds(aLeft, aTop, aWidth, aHeight: Integer);
begin
  if (FDesignerWindow <> nil) then
    FDesignerWindow.SetBounds(aLeft, aTop, aWidth, aHeight);
end;


{------------------------------------------------------------------------------}
{ TppDesigner.SetCaption }

procedure TppDesigner.SetCaption(aCaption: String);
begin
  FCaption := aCaption;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.DefaultCaption := FCaption;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetDataSettings }

procedure TppDesigner.SetDataSettings(aDataSettings: TppDataSettings);
begin

  FDataSettings.Assign(aDataSettings);

  if (FDesignerWindow <> nil) then
    FDesignerWindow.DataSettings := FDataSettings;


end;  {procedure, SetDataSettings}


{------------------------------------------------------------------------------}
{ TppDesigner.SetFormStyle }

procedure TppDesigner.SetFormStyle(aFormStyle: TFormStyle);
begin

  if (FDesignerWindow <> nil) then
    begin
      FDesignerWindow.ChangeFormStyle(aFormStyle);
      FDesignerWindow.ComponentClasses := FComponentClasses;
    end;


end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetHeight }

procedure TppDesigner.SetHeight(aHeight: Integer);
begin
  FWindowHeight := aHeight;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.Height := FWindowHeight;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetIcon }

procedure TppDesigner.SetIcon(aIcon: TIcon);
begin

  FIcon.Assign(aIcon);

  if (FDesignerWindow <> nil) then
    FDesignerWindow.Icon := FIcon;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.IconChange }

procedure TppDesigner.IconChange(Sender: TObject);
begin

  if (FDesignerWindow <> nil) then
    FDesignerWindow.Icon := FIcon;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetLeft }

procedure TppDesigner.SetLeft(aLeft: Integer);
begin
  FWindowLeft:= aLeft;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.Left := FWindowLeft;

end;



{------------------------------------------------------------------------------}
{ TppDesigner.SetPosition }

procedure TppDesigner.SetPosition(aPosition: TPosition);
begin

  FPosition := aPosition;

{$IFDEF WIN32}
  if (FDesignerWindow <> nil) then
    FDesignerWindow.Position := FPosition;


{$ELSE}

  {note: 1. D1 cannot support Position property because setting this calls
            RecreatWnd and TB97 for D1 cannot handle this (i.e. floating toolbars
            will no longer work) The SetInitialPosition procedure below is used
            to support poScreenCenter for D1.

         2. When reading/loading need to allow WindowHeight, WindowLeft,
            etc. to be read up. Therefore SetInitialPosition will be called
            prior to Show or ShowModal}


  if not (csReading in ComponentState) and not (csLoading in ComponentState) then
    SetInitialPosition;

{$ENDIF}


end;

{$IFDEF WINDOWS}

{------------------------------------------------------------------------------}
{ TppDesigner.SetInitialPosition }

procedure TppDesigner.SetInitialPosition;
var
  liLeft: Integer;
  liTop: Integer;

begin

  if (FDesignerWindow = nil) then Exit;

  {center the designer window on the screen }

  if FPosition = poScreenCenter then
    begin

      if FDesignerWindow.FormStyle = fsMDIChild then
        begin
          liLeft := (Application.MainForm.ClientWidth  - FDesignerWindow.Width )  div 2;
          liTop  := (Application.MainForm.ClientHeight - FDesignerWindow.Height) div 2;
        end
      else
        begin
          liLeft := (Screen.Width  - FDesignerWindow.Width) div 2;
          liTop  := (Screen.Height - FDesignerWindow.Height) div 2;
        end;

      if liLeft < 0 then
        liLeft := 0;


      if liTop  < 0 then
        liTop := 0;

      SetBounds(liLeft, liTop, FDesignerWindow.Width, FDesignerWindow.Height);

  end;

end;

{$ENDIF}


{------------------------------------------------------------------------------}
{ TppDesigner.SetTop }

procedure TppDesigner.SetTop(aTop: Integer);
begin
  FWindowTop:= aTop;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.Top := FWindowTop;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetVisible }

procedure TppDesigner.SetVisible(aValue: Boolean);
begin
  FVisible := aValue;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.Visible := FVisible;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetWidth }

procedure TppDesigner.SetWidth(aWidth: Integer);
begin
  FWindowWidth := aWidth;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.Width := FWindowWidth;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetWindowState }

procedure TppDesigner.SetWindowState(aWindowState: TWindowState);
begin
  FWindowState := aWindowState;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.WindowState := aWindowState;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetWindowTag }

procedure TppDesigner.SetWindowTag(aTag: LongInt);
begin
  FWindowTag := aTag;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.Tag := aTag;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnActivate }

procedure TppDesigner.SetOnActivate(aNotifyEvent: TNotifyEvent);
begin
  FOnActivate := aNotifyEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnActivate := FOnActivate;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnAssignField }

procedure TppDesigner.SetOnAssignField(aNotifyEvent: TNotifyEvent);
begin
  FOnAssignField := aNotifyEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnAssignField := FOnAssignField;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnClose }

procedure TppDesigner.SetOnClose(aCloseEvent: TCloseEvent);
begin

  FOnClose := aCloseEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnClose := FOnClose;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnCloseQuery }

procedure TppDesigner.SetOnCloseQuery(aCloseQueryEvent: TCloseQueryEvent);
begin
  FOnCloseQuery := aCloseQueryEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnCloseQuery := FOnCloseQuery;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnCreateComponent }

procedure TppDesigner.SetOnCreateComponent(aComponentEvent: TppComponentEvent);
begin
  FOnCreateComponent := aComponentEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnCreateComponent := FOnCreateComponent;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnCreateComponent }

procedure TppDesigner.SetOnCreateReport(aCreateReportEvent: TppCreateReportEvent);
begin
  FOnCreateReport := aCreateReportEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnCreateReport := FOnCreateReport;

end;



{------------------------------------------------------------------------------}
{ TppDesigner.SetOnCustomOpenDoc }

procedure TppDesigner.SetOnCustomOpenDoc(aNotifyEvent: TNotifyEvent);
begin
  FOnCustomOpenDoc := aNotifyEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnCustomOpenDoc := FOnCustomOpenDoc;

end; {procedure, SetOnCustomOpenDoc}

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnCustomSaveDoc }

procedure TppDesigner.SetOnCustomSaveDoc(aNotifyEvent: TNotifyEvent);
begin
  FOnCustomSaveDoc := aNotifyEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnCustomSaveDoc := FOnCustomSaveDoc;

end; {procedure, SetOnCustomSaveDoc}


{------------------------------------------------------------------------------}
{ TppDesigner.SetOnDestroyComponent }

procedure TppDesigner.SetOnDestroyComponent(aComponentEvent: TppComponentEvent);
begin
  FOnDestroyComponent := aComponentEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnDestroyComponent := FOnDestroyComponent;

end;


{------------------------------------------------------------------------------}
{ TppDesigner.SetOnValidateComponent }

procedure TppDesigner.SetOnValidateComponent(aValidateComponentEvent: TppValidateComponentEvent);
begin
  FOnValidateComponent := aValidateComponentEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnValidateComponent := FOnValidateComponent;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnDeactivate }

procedure TppDesigner. SetOnDeactivate(aNotifyEvent: TNotifyEvent);
begin
  FOnDeactivate := aNotifyEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnDeactivate := FOnDeactivate;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.GetCurrentReport }

function TppDesigner.GetCurrentReport: TppCustomReport;
begin
   if (FDesignerWindow = nil) then
    Result := nil
  else
    Result := FDesignerWindow.CurrentReport;

end;


{------------------------------------------------------------------------------}
{ TppDesigner.GetFieldAliases }

function TppDesigner.GetFieldAliases: TStrings;
begin

  if (FDesignerWindow = nil) then
    Result := nil
  else
    Result := FDesignerWindow.FieldAliases;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnGetFieldAliases }

procedure TppDesigner.SetFieldAliases(aFieldAliases: TStrings);
begin
  if (FDesignerWindow <> nil) then
    FDesignerWindow.FieldAliases := aFieldAliases;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnGetFieldForAlias }

procedure TppDesigner.SetOnGetFieldForAlias(aGetFieldForAliasEvent: TppGetFieldForAliasEvent);
begin
  FOnGetFieldForAlias := aGetFieldForAliasEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnGetFieldForAlias := FOnGetFieldForAlias;
end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnGetFields }

procedure TppDesigner.SetOnGetFields(aOnGetFieldsEvent: TppGetFieldsEvent);
begin
  FOnGetFields := aOnGetFieldsEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnGetFields := FOnGetFields;
end;


{------------------------------------------------------------------------------}
{ TppDesigner.SetOnGetAliasForFieldName }

procedure TppDesigner.SetOnGetAliasForField(aGetAliasForFieldEvent: TppGetAliasForFieldEvent);
begin
  FOnGetAliasForField := aGetAliasForFieldEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnGetAliasForField := FOnGetAliasForField;
end;


{------------------------------------------------------------------------------}
{ TppDesigner.SetOnGetDisplayFormats }

procedure TppDesigner.SetOnGetDisplayFormats(aGetDisplayFormatsEvent: TppGetDisplayFormatsEvent);
begin
  FOnGetDisplayFormats := aGetDisplayFormatsEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnGetDisplayFormats := FOnGetDisplayFormats;
end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnGetDataNames }

procedure TppDesigner.SetOnGetDataNames(aOnGetDataNamesEvent: TppGetDataNamesEvent);
begin
  FOnGetDataNames := aOnGetDataNamesEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnGetDataNames := FOnGetDataNames;
end;


{------------------------------------------------------------------------------}
{ TppDesigner.SetOnHide }

procedure TppDesigner.SetOnHide(aNotifyEvent: TNotifyEvent);
begin

  FOnHide := aNotifyEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnHide := FOnHide;

end;


{------------------------------------------------------------------------------}
{ TppDesigner.SetSelection }


procedure TppDesigner.SetSelection(aSelection: TppDesignerSelectionList);
begin

  if (FDesignerWindow <> nil) then
    FDesignerWindow.SelectionChanged(aSelection);

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnResize }

procedure TppDesigner.SetOnResize(aNotifyEvent: TNotifyEvent);
begin

  FOnResize := aNotifyEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnResize := FOnResize;

end;


{------------------------------------------------------------------------------}
{ TppDesigner.SetReportSelected }

procedure TppDesigner.SetOnReportSelected(aNotifyEvent: TNotifyEvent);
begin

  FOnReportSelected := aNotifyEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnReportSelected := FOnReportSelected;

end;


{------------------------------------------------------------------------------}
{ TppDesigner.SetOnSelectionChangedd }

procedure TppDesigner.SetOnSelectionChanged(aSetSelectionEvent: TppSetSelectionEvent);
begin

  FOnSelectionChanged := aSetSelectionEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnSetSelection := FOnSelectionChanged;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnShow }

procedure TppDesigner.SetOnShow(aNotifyEvent: TNotifyEvent);
begin

  FOnShow := aNotifyEvent;

end;

{------------------------------------------------------------------------------}
{ TppDesigner.SetOnTabChange }

procedure TppDesigner.SetOnTabChange(aTabChangeEvent: TppTabChangeEvent);
begin

  FOnTabChange := aTabChangeEvent;

  if (FDesignerWindow <> nil) then
    FDesignerWindow.OnTabChange := FOnTabChange;

end;

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppDesigner]);

finalization

  UnRegisterClasses([TppDesigner]);

end.

