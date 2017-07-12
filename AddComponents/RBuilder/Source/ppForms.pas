{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppForms;

interface

{$I ppIfDef.pas}

uses
  Classes, Controls, ExtCtrls, Forms, Dialogs, Graphics, Messages, StdCtrls,
  ComCtrls, ppTypes;

type

  { TppUpDown }
  TppUpDown = class(TUpDown)
    private
      FCanvas: TControlCanvas;
      FBuddy: TControl;

      procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
      procedure SetBuddy(aBuddy: TControl);

    protected
      procedure Paint;
    public
     constructor Create(aOwner: TComponent); override;
     constructor CreateForControl(aControl: TControl); virtual;
     destructor Destroy; override;

     property Buddy: TControl read FBuddy write SetBuddy;

  end; {class, TppUpDown}



  { TppForm }
  TppForm = class(TForm)
  private
    FppOnActivate: TNotifyEvent;
    FppOnClose: TNotifyEvent;
    FppOnDestroy: TNotifyEvent;
    FLanguageIndex: Longint;
    FReport: TComponent;

    procedure SetLanguageIndex(Value: Longint);
    procedure SetReport(aReport: TComponent);

  protected
    procedure WMClose(var Message: TMessage); message WM_CLOSE;

    procedure Activate; override;
    procedure LanguageChanged; virtual;
    procedure ReportAssigned; virtual;

    procedure ExitActiveControl;
    procedure WarningDlg(aMessge: String);

  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;

    property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;
    property Report: TComponent read FReport write SetReport;

    {events - used internally by TppReport }
    property ppOnActivate: TNotifyEvent read FppOnActivate write FppOnActivate;
    property ppOnClose: TNotifyEvent read FppOnClose write FppOnClose;
    property ppOnDestroy: TNotifyEvent read FppOnDestroy write FppOnDestroy;

  end; {class, TppForm}

  { TppCustomPreviewer }
  TppCustomPreviewer = class(TppForm)
    private

    protected
      function GetViewer: TObject; virtual;

    public
      procedure Init; virtual;

    published
      property Viewer: TObject read GetViewer;

  end; {class, TppCustomPreviewer}

 { TppCustomRTFEditor }
  TppCustomRTFEditor = class(TppForm)
  private
    FMailMerge: Boolean;

  protected
    {Get Lines methods used for public property below}
    function GetLines: TStrings; virtual; abstract;

  public
    {this allows the TppCustomRichText component to load and retreive RTF data}
    property Lines: TStrings read GetLines;
    property MailMerge: Boolean read FMailMerge write FMailMerge;

  end; {class TppCustomRTFEditor}


 { TppCustomMailMergeDialog }
  TppCustomMailMergeDialog = class(TppForm)
    protected
      function  GetSelectedField: String; virtual; abstract;
      function  GetFieldNames: TStrings; virtual; abstract;
      procedure SetFieldNames(aList: TStrings); virtual; abstract;

    public
      property FieldNames: TStrings read GetFieldNames write SetFieldNames;
      property SelectedField: String read GetSelectedField;

  end; {class, TppCustomMailMergeDialog}


 { TppCustomAutoSearchDialog }
  TppCustomAutoSearchDialog = class(TppForm)
    private
      FAutoSearchFields: TList;

    public
      procedure Init; virtual; abstract;

      property AutoSearchFields: TList read FAutoSearchFields write FAutoSearchFields;

  end; {class, TppCustomAutoSearchDialog}

  { TppCustomReportExplorer }
  TppCustomReportExplorer = class(TppForm)
    private
      FFormSettingsRemembered: Boolean;

    protected
      procedure SetFormSettingsRemembered(aValue: Boolean);
      function  GetReportExplorer: TComponent; virtual; abstract;
      procedure SetReportExplorer(aComponent: TComponent); virtual; abstract;

    public
      constructor Create(aComponent: TComponent); override;

      procedure Initialize; virtual; abstract;
      procedure Refresh; virtual; abstract;

      property ReportExplorer: TComponent read GetReportExplorer write SetReportExplorer;

      property FormSettingsRemembered: Boolean read FFormSettingsRemembered;
  end;

  { TppCustomPageSettingDialog }
  TppCustomPageSettingDialog = class(TppForm)
  private
    FPageSetting: TppPageSettingType;
    FPageList: TStrings;
    FValidPages: String;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    property PageList: TStrings read FPageList;
    property PageSetting: TppPageSettingType read FPageSetting write FPageSetting;
    property ValidPages: String read FValidPages write FValidPages;

  end; {class TppCustomPageSettingDialog}

  { TppCustomPrintDialog }
  TppCustomPrintDialog = class(TppForm)
  private
    FAllowPrintToArchive: Boolean;
    FAllowPrintToFile: Boolean;
    FArchiveFileName: String;
    FDefaultFileExt: String;
    FDeviceType: String;
    FFileFilter: String;
    FTextFileName: String;
    FPageRequest: TObject;
    FPrinter: TObject;
    FPrinterChanged: Boolean;
    FPrintToArchive: Boolean;
    FPrintToFile: Boolean;

  protected
    procedure SetPageRequest(aPageRequest: TObject); virtual;

  public
    constructor Create(aOwner: TComponent); override;
    
    procedure Init; virtual; abstract;

    property AllowPrintToArchive: Boolean read FAllowPrintToArchive write FAllowPrintToArchive;
    property AllowPrintToFile: Boolean read FAllowPrintToFile write FAllowPrintToFile;
    property ArchiveFileName: String read FArchiveFileName write FArchiveFileName;
    property DeviceType: String read FDeviceType write FDeviceType;
    property PageRequest: TObject read FPageRequest write SetPageRequest;
    property PrinterChanged: Boolean read FPrinterChanged write FPrinterChanged;
    property Printer: TObject read FPrinter write FPrinter;
    property PrintToArchive: Boolean read FPrintToArchive write FPrintToArchive;
    property PrintToFile: Boolean read FPrintToFile write FPrintToFile;
    property TextFileName: String read FTextFileName write FTextFileName;
    property DefaultFileExt: String read FDefaultFileExt write FDefaultFileExt;
    property FileFilter: String read FFileFilter write FFileFilter;

  end; {class TppCustomPrintDialog}

  { TppCustomCancelDialog }
  TppCustomCancelDialog = class(TppForm)
  private
    FActiveForm: TForm;
    FAllowPrintCancel: Boolean;
    FModal: Boolean;
    FppOnCancel: TNotifyEvent;
    FPrintProgress: String;
    FTimer: TTimer;

    procedure FormHideEvent;
    procedure FormShowEvent;
    procedure SetPrintProgress(Value: String);
    procedure TimerEvent(Sender: TObject);

  protected
    procedure WMShowWindow(var Message: TMessage); message WM_SHOWWINDOW;

    procedure DoOnCancel;
    
    procedure PrintProgressChanged; virtual;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure ppCloseModal; {note: there is already a CloseModal in TCustomForm}
    procedure ppShowModal;

    property AllowPrintCancel: Boolean read FAllowPrintCancel write FAllowPrintCancel;
    property ppOnCancel: TNotifyEvent read FppOnCancel write FppOnCancel;
    property PrintProgress: String read FPrintProgress write SetPrintProgress;

  end; {class, TppCustomCancelDialog}


  { TppCustomPageSetupDialog }
  TppCustomPageSetupDialog = class(TppForm)
  end; {class, TppPageSetupDialog}


  { TppCustomPrintToFileSetupDialog }
  TppCustomPrintToFileSetupDialog = class(TppForm)
  private
    FCurrentReport: TComponent;

    procedure SetCurrentReport(aReport: TComponent);

  protected
    procedure CurrentReportAssigned; virtual;

  public
    constructor Create(aOwner: TComponent); override;

    property CurrentReport: TComponent read FCurrentReport write SetCurrentReport;

  end; {class, TppCustomPrintToFileSetupDialog}

  { TppCustomDataDialog }
  TppCustomDataDialog = class(TppForm)
  private
    FDetailDataPipeline:TComponent;
    FMasterDataPipeline: TComponent;
  public
    property DetailDataPipeline: TComponent read FDetailDataPipeline write FDetailDataPipeline;
    property MasterDataPipeline: TComponent read FMasterDataPipeline write FMasterDataPipeline;
  end; {class, TppCustomDataDialog}


  { TppCustomGroupDialog }
  TppCustomGroupDialog = class(TppForm)
  private
    FOnGetFieldForAlias: TppGetFieldForAliasEvent;

  protected
   procedure DoGetFieldForAlias(const aFieldAlias: String; var aDataPipeline: TObject; var aDataField: String);
   function GetFieldAliases: TStrings; virtual; abstract;
   procedure SetFieldAliases(aFieldAliases: TStrings); virtual; abstract;

  public
    property FieldAliases: TStrings read GetFieldAliases write SetFieldAliases;
    property OnGetFieldForAlias: TppGetFieldForAliasEvent read FOnGetFieldForAlias write FOnGetFieldForAlias;

  end; {class, TppCustomGroupDialog}


  { TppCustomFormatDialog }
  TppCustomFormatDialog = class(TppForm)
  private

  protected
    function GetDisplayFormat: String; virtual; abstract;
    function GetDisplayFormats: TStrings; virtual; abstract;

    procedure SetDisplayFormat(const aDisplayFormat: String);  virtual; abstract;
    procedure SetDisplayFormats(aDisplayFormats: TStrings); virtual; abstract;

  public

    property DisplayFormat: String read GetDisplayFormat write SetDisplayFormat;
    property DisplayFormats: TStrings read GetDisplayFormats write SetDisplayFormats;

  end; {class, TppCustomFormatDialog}


  { TppCustomGridDialog }
  TppCustomGridDialog = class(TppForm)
  private
    FSnapToGrid: Boolean;
    FDisplayGrid: Boolean;
    FXGridSpace: Integer;
    FYGridSpace: Integer;

  public

    property SnapToGrid: Boolean read FSnapToGrid write FSnapToGrid;
    property DisplayGrid: Boolean read FDisplayGrid write FDisplayGrid;
    property XGridSpace: Integer read FXGridSpace write FXGridSpace;
    property YGridSpace: Integer read FYGridSpace write FYGridSpace;

 end; {class, TppCustomGridDialog}

 
  { TppCustomAboutDialog }
  TppCustomAboutDialog = class(TppForm)
  end; {class, TppCustomAboutDialog}


  { TppCustomPositionDialog }
  TppCustomPositionDialog = class(TppForm)
  private
    FComponent: TComponent;
    FPropBottomOffset: Single;
    FPropLeft: Single;
    FPropTop: Single;
    FPropWidth: Single;
    FPropHeight: Single;
    FPropOverFlowOffset: Single;
    FOnPositionChange: TNotifyEvent;
    FParentHeight: Boolean;
    FParentWidth: Boolean;
    FPropStopPosition: Single;
    FUnits: TppUnitType;

  protected
    procedure DoPositionChange;

  public
    property Component: TComponent read FComponent write FComponent;
    property PropBottomOffset: Single read FPropBottomOffset write FPropBottomOffset;
    property PropLeft: Single read FPropLeft write FPropLeft;
    property PropHeight: Single read FPropHeight write FPropHeight;
    property PropOverFlowOffset: Single read FPropOverFlowOffset write FPropOverFlowOffset;
    property PropTop: Single read FPropTop write FPropTop;
    property PropWidth: Single read FPropWidth write FPropWidth;
    property ParentHeight: Boolean read FParentHeight write FParentHeight;
    property ParentWidth: Boolean read FParentWidth write FParentWidth;
    property PropStopPosition: Single read FPropStopPosition write FPropStopPosition;
    property Units: TppUnitType read FUnits write FUnits;

    property OnPositionChange: TNotifyEvent read FOnPositionChange write FOnPositionChange;

  end; {class, TppCustomPositionDialog}

  { TppCustomBandPositionDialog }
  TppCustomBandPositionDialog = class(TppForm)
  private
    FBand: TComponent;
    FPropHeight: Single;
    FPropBottomOffset: Single;
    FPropPrintCount: Integer;
    FPropPrintPosition: Single;
    FOnPositionChange: TNotifyEvent;
    FUnits: TppUnitType;

  protected
    procedure DoPositionChange;

  public
    property Band: TComponent read FBand write FBand;
    property PropHeight: Single read FPropHeight write FPropHeight;
    property PropBottomOffset: Single read FPropBottomOffset write FPropBottomOffset;
    property PropPrintCount: Integer read FPropPrintCount write FPropPrintCount;
    property PropPrintPosition: Single read FPropPrintPosition write FPropPrintPosition;
    property Units: TppUnitType read FUnits write FUnits;

    property OnPositionChange: TNotifyEvent read FOnPositionChange write FOnPositionChange;

  end; {class, TppCustomBandPositionDialog}


  { TppCustomMemoDialog }
  TppCustomMemoDialog = class(TppForm)
  protected
    procedure SetLines(aLines: TStrings); virtual; abstract;
    function GetLines: TStrings; virtual; abstract;
  public
     property Lines: TStrings read GetLines write SetLines;
  end; {class, TppCustomMemoDialog}


  { TppCustomDBTextDialog }
  TppCustomDBTextDialog = class(TppForm)
  private
    FResetGroupIndex: Integer;

  protected
    procedure SetGroupDescriptions(aDescriptions: TStrings); virtual; abstract;
    function GetGroupDescriptions: TStrings; virtual; abstract;

  public
    property ResetGroupIndex: Integer read FResetGroupIndex write FResetGroupIndex;
    property GroupDescriptions: TStrings read GetGroupDescriptions write SetGroupDescriptions;

  end; {class, TppCustomDBTextDialog}


  { TppCustomDBCalcDialog }
  TppCustomDBCalcDialog = class(TppForm)
  private
    FDBCalcType: Integer;
    FResetGroupIndex: Integer;

  protected
    procedure SetGroupDescriptions(aDescriptions: TStrings); virtual; abstract;
    function GetGroupDescriptions: TStrings; virtual; abstract;

  public
    property DBCalcType: Integer read FDBCalcType write FDBCalcType;
    property ResetGroupIndex: Integer read FResetGroupIndex write FResetGroupIndex;
    property GroupDescriptions: TStrings read GetGroupDescriptions write SetGroupDescriptions;

  end; {class, TppCustomDBCalcDialog}


  { TppCustomCalcTimingDialog }
  TppCustomCalcTimingDialog = class(TppForm)
  private
    FCalcType: Integer;
    FCalcComponent: TComponent;
    FDataPipelines: TStrings;
    FGroups: TStrings;
    FResetType: Integer;
    FResetComponent: TComponent;

  protected
    procedure SetDataPipelines(aList: TStrings); virtual;
    procedure SetGroups(aList: TStrings); virtual;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    property DataPipelines: TStrings read FDataPipelines write SetDataPipelines;
    property Groups: TStrings read FGroups write SetGroups;
    property CalcType: Integer read FCalcType write FCalcType;
    property CalcComponent: TComponent read FCalcComponent write FCalcComponent;
    property ResetType: Integer read FResetType write FResetType;
    property ResetComponent: TComponent read FResetComponent write FResetComponent;

  end; {class, TppCustomCalcTimingDialog}


  { TppCustomCalcDialog }
  TppCustomCalcDialog = class(TppForm)
  end;



  { TppCustomShiftDialog }
  TppCustomShiftDialog = class(TppForm)
  private
    FSelectedComponent: String;

  protected
    procedure SetSelectionList(aSelectionlist: TStrings); virtual; abstract;
    function  GetSelectionList: TStrings; virtual; abstract;

  public
    property SelectedComponent: String read FSelectedComponent write FSelectedComponent;
    property SelectionList: TStrings read GetSelectionList write SetSelectionList;

  end; {class, TppCustomShiftDialog}

  { TppCustomDrillDownDialog }
  TppCustomDrillDownDialog = class(TppForm)
  private
    FSelectedComponent: String;

  protected
    procedure SetSelectionList(aSelectionlist: TStrings); virtual; abstract;
    function GetSelectionList: TStrings; virtual; abstract;

  public
    property SelectedComponent: String read FSelectedComponent write FSelectedComponent;
    property SelectionList: TStrings read GetSelectionList write SetSelectionList;

  end; {class, TppCustomDrillDownDialog}


  { TppCustomDemoDialog }
  TppCustomDemoDialog = class(TppForm)
  private

  end; {class, TppCustomDemoDialog}


  { TppCustomTemplateDialog }
  TppCustomTemplateDialog = class(TppForm)
  private
    FDataPipeline: TComponent;
    FDialogType: TppDialogType;
    FItemType: Integer;
    FNameField: String;
    FOnHelpClick: TNotifyEvent;

  protected
    procedure DoOnHelpClick;
    function  GetTemplateName: String; virtual; abstract;
    function  GetTemplateNames: TStrings; virtual; abstract;
    function  HelpEventAssigned: Boolean;
    procedure SetDataPipeline(aComponent: TComponent); virtual;
    procedure SetTemplateName(aTemplateName: String); virtual; abstract;
    procedure SetTemplateNames(aTemplateNames: TStrings); virtual; abstract;

  public
    property DataPipeline: TComponent read FDataPipeline write SetDataPipeline;
    property DialogType: TppDialogType read FDialogType write FDialogType;
    property ItemType: Integer read FItemType write FItemType;
    property NameField: String read FNameField write FNameField;
    property OnHelpClick: TNotifyEvent read FOnHelpClick write FOnHelpClick;
    property TemplateName: String read GetTemplateName write SetTemplateName;
    property TemplateNames: TStrings read GetTemplateNames write SetTemplateNames;

  end; {class, TppCustomTemplateDialog}


  { TppCustomTemplateErrorDialog }
  TppCustomTemplateErrorDialog = class(TppForm)
  private

  protected
    function  GetErrorMessage: String; virtual; abstract;
    procedure SetErrorMessage(aMessage: String); virtual; abstract;

  public
    property ErrorMessage: String read GetErrorMessage write SetErrorMessage;

  end; {class, TppCustomTemplateErrorDialog}

 
  { TppCustomBarCodeDialog }
  TppCustomBarCodeDialog = class(TppForm)
  private
    FAddOnCode: String;
    FAutoEncode : boolean;
    FBarWidth: Single;
    FBearerBars: Boolean;
    FCalcCheckDigit: Boolean;
    FOrientation: TppBarcodeOrientation;
    FBarCodeType: TppBarCodeType;
    FUnits: TppUnitType;
    FWideBarRatio: Single;

    FOnChange: TNotifyEvent;

  protected
    procedure DoApplyChanges;

  public
    property AddOnCode: String read FAddOnCode write FAddOnCode;
    property AutoEncode : boolean read FAutoEncode write FAutoEncode;
    property BarWidth: Single read FBarWidth write FBarWidth;
    property BearerBars: Boolean read FBearerBars write FBearerBars;
    property CalcCheckDigit: Boolean read FCalcCheckDigit write FCalcCheckDigit;
    property Orientation: TppBarcodeOrientation read FOrientation write FOrientation;
    property BarCodeType: TppBarCodeType read FBarCodeType write FBarCodeType;
    property Units: TppUnitType read FUnits write FUnits;
    property WideBarRatio: Single read FWideBarRatio write FWideBarRatio;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;

  end; {class, TppCustomBarCodeDialog}


 { TppCustomNewDialog }
  TppCustomNewDialog = class(TppForm)
    private

    protected
      function  GetCreateClass: TClass; virtual; abstract;
      function GetWizard: TComponent; virtual; abstract;
      function  GetWizardClasses: TStrings; virtual; abstract;
      function  GetTemplateClasses: TStrings; virtual; abstract;
      procedure SetWizardClasses(aList: TStrings); virtual; abstract;
      procedure SetTemplateClasses(aList: TStrings); virtual; abstract;

    public
      property CreateClass: TClass read GetCreateClass;
      property TemplateClasses: TStrings read GetTemplateClasses write SetTemplateClasses;
      property WizardClasses: TStrings read GetWizardClasses write SetWizardClasses;

  end; {class TppCustomNewDialog}


 { TppCustomCalcOrderDialog }
  TppCustomCalcOrderDialog = class(TppForm)
  private

  protected
    procedure SetCurrentBand(aBand: TComponent); virtual; abstract;
    function GetCurrentBand: TComponent; virtual; abstract;

  public
    property CurrentBand: TComponent read GetCurrentband write SetCurrentBand;

  end; {class, TppCustomCalcOrderDialog}

  { TppCustomMasterFieldLinkEditor }
  TppCustomMasterFieldLinkEditor = class(TppForm)
    protected
     function GetDataPipeline: TComponent; virtual; abstract;
     procedure SetDataPipeline(aDataPipeline: TComponent); virtual; abstract;

    public
      function Execute: Boolean; virtual; abstract;

      property DataPipeline: TComponent read GetDataPipeline write SetDataPipeline;

  end; {class, TppCustomMasterFieldLinkEditor}

  { TppCustomCrossTabDesignerForm }
  TppCustomCrossTabDesignerForm = class(TppForm)
    private
      FCrossTab: TComponent;

    public
      property CrossTab: TComponent read FCrossTab write FCrossTab;

  end; {class, TppCustomCrossTabDesignerForm}


  {register procedures}
  function  ppFormClassList: TStringList;
  function  ppGetFormClass(aAncestorClass: TFormClass): TFormClass;
  procedure ppRegisterForm(aAncestorClass, aDescendantClass: TFormClass);
  procedure ppUnRegisterForm(aAncestorClass: TFormClass);

implementation

var
  FFormClassList: TStringList = nil;


{******************************************************************************
 *
 ** T p p U p D o w n
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppUpDown.Create }

constructor TppUpDown.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  Min := -100;

  {create a canvas}
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppUpDown.Destroy }

destructor TppUpDown.Destroy;
begin

  FCanvas.Free;
  
  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppUpDown.CreateForControl }

constructor TppUpDown.CreateForControl(aControl: TControl);
begin

  Create(aControl.Owner);

  Parent := aControl.Parent;
  SetBuddy(aControl);

end; {constructor, CreateWithBuddy}

{------------------------------------------------------------------------------}
{ TppUpDown.SetBuddy }

procedure TppUpDown.SetBuddy(aBuddy: TControl);
begin
  FBuddy := aBuddy;

  Left   := FBuddy.left + FBuddy.Width - Width -2;
  Top    := FBuddy.Top + 2;
  Height := FBuddy.Height - 4;

end; {procdure, SetBuddy}

{------------------------------------------------------------------------------}
{ TppUpDown.WMPaint }

procedure TppUpDown.WMPaint(var Message: TWMPaint);
begin

  inherited;

  Paint;

end; {procedure, WMPaint}

{------------------------------------------------------------------------------}
{ TppUpDown.Paint }

procedure TppUpDown.Paint;
var
  liCenter: Integer;
  liStartY: Integer;
  liCount: Integer;

begin

  FCanvas.Pen.Color := clBlack;

  liCenter := (Width div 2) - 1;

  liStartY := 2;

  {draw top arrow}
  for liCount := 0 to 2 do
    begin
      FCanvas.MoveTo(liCenter - liCount,   liStartY + liCount);
      FCanvas.LineTo(liCenter + liCount+1, liStartY + liCount);
    end;

  liStartY := Height - 3;

  {draw bottom arrow}
  for liCount := 0 to 2 do
    begin
      FCanvas.MoveTo(liCenter - liCount,   liStartY - liCount);
      FCanvas.LineTo(liCenter + liCount+1, liStartY - liCount);
    end;


end; {procedure, Paint}

{******************************************************************************
 *
 ** F O R M
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppForm.Create }

constructor TppForm.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FppOnActivate  := nil;
  FppOnClose     := nil;
  FppOnDestroy   := nil;
  FLanguageIndex := 0;
  FReport        := nil;

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppForm.Destroy }

destructor TppForm.Destroy;
begin
  if Assigned(FppOnClose) then FppOnClose(Self);

  if Assigned(FppOnDestroy) then FppOnDestroy(Self);

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppForm.Activate }

procedure TppForm.Activate;
begin
  inherited Activate;

  {this allows a modal previewer to continue the report}
  if Assigned(FppOnActivate) then FppOnActivate(Self);
end;

{------------------------------------------------------------------------------}
{ TppForm.WMClose }

procedure TppForm.WMClose(var Message: TMessage);
begin

  {note: WMClose never fires when the Close button of the form is pressed
         so this code is useless}
  {if Assigned(FppOnClose) then FppOnClose(Self);}

  inherited;

end;


{------------------------------------------------------------------------------}
{ TppForm.SetLanguageIndex }

procedure TppForm.SetLanguageIndex(Value: Longint);
begin
  FLanguageIndex := Value;

  LanguageChanged;
end;

{------------------------------------------------------------------------------}
{ TppForm.LanguageChanged }

procedure TppForm.LanguageChanged;
begin

end;

{------------------------------------------------------------------------------}
{ TppForm.SetReport }

procedure TppForm.SetReport(aReport: TComponent);
begin
  FReport := aReport;
  ReportAssigned;
end;

{------------------------------------------------------------------------------}
{ TppForm.ReportAssigned }

procedure TppForm.ReportAssigned;
begin

end;

{------------------------------------------------------------------------------}
{ TppForm.WarningDlg }

procedure TppForm.WarningDlg(aMessge: String);
begin
  {set ModalResult to none, because when the Default button of a dialog
   is activated by the keyboard and an error occurrs we do not want to
   close the dialog}
  ModalResult := mrNone;
  MessageDlg(aMessge, mtWarning, [mbOK], 0);

end; {procedure, WarningDlg}

{------------------------------------------------------------------------------}
{ TppForm.ExitActiveControl }

procedure TppForm.ExitActiveControl;
begin
  {note: this method can be called from the close button of the dialog;
         when the close button is the default button the OnExit event of
         an active TEdit will not fire when the default button is activated
         by the keyboard }
  
  {if ActiveControl is an Edit box, fire the OnExit event}
  if (ActiveControl is TEdit) and Assigned(TEdit(ActiveControl).OnExit) then
    TEdit(ActiveControl).OnExit(ActiveControl);

end;


{******************************************************************************
 *
 ** C U S T O M   R E P O R T   E X P L O R E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.Create }

constructor TppCustomReportExplorer.Create(aComponent: TComponent);
begin

  inherited Create(aComponent);

  FFormSettingsRemembered := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomReportExplorer.SetFormSettingsRemembered }

procedure TppCustomReportExplorer.SetFormSettingsRemembered(aValue: Boolean);
begin

  FFormSettingsRemembered := aValue;

end; {constructor, SetFormSettingsRemembered}

{******************************************************************************
 *
 ** T I M I N G   D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomCalcTimingDialog.Create }

constructor TppCustomCalcTimingDialog.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FCalcType := -1;
  FCalcComponent := nil;
  FDataPipelines := TStringList.Create;
  FGroups := TStringList.Create;
  FResetType := -1;
  FResetComponent := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomCalcTimingDialog.Destroy }

destructor TppCustomCalcTimingDialog.Destroy;
begin

  FDataPipelines.Free;
  FGroups.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomCalcTimingDialog.SetDataPipelines }

procedure TppCustomCalcTimingDialog.SetDataPipelines(aList: TStrings);
begin
  FDataPipelines.Assign(aList);
end; {procedure, SetDataPipelines}

{------------------------------------------------------------------------------}
{ TppCustomCalcTimingDialog.SetGroups }

procedure TppCustomCalcTimingDialog.SetGroups(aList: TStrings);
begin
  FGroups.Assign(aList);
end; {procedure, SetGroups}


{******************************************************************************
 *
 ** P R I N T   P R E V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomPrintDialog.GetViewer }

function TppCustomPreviewer.GetViewer: TObject;
begin
  Result := nil;
end; {function, GetViewer}

{------------------------------------------------------------------------------}
{ TppCustomPrintDialog.Init }

procedure TppCustomPreviewer.Init;
begin

end; {procedure, Init}

{******************************************************************************
 *
 ** P R I N T   D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomPrintDialog.Create }

constructor TppCustomPrintDialog.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FAllowPrintToArchive := False;
  FAllowPrintToFile := False;
  FArchiveFileName  := '';
  FDeviceType       := '';
  FPrinterChanged   := False;
  FPrintToArchive   := False;
  FPrintToFile      := False;
  FPrinter          := nil;
  FTextFileName     := '';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomPrintDialog.SetPageRequest }

procedure TppCustomPrintDialog.SetPageRequest(aPageRequest: TObject);
begin

  FPageRequest := aPageRequest;

end; {procedure, SetPageRequest}

{******************************************************************************
 *
 ** P A G E   S E T T I N G   D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomPageSettingDialog.Create }

constructor TppCustomPageSettingDialog.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FPageList         := TStringList.Create;
  FPageSetting      := psAll;
  FValidPages       := '';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomPageSettingDialog.Destroy }

destructor TppCustomPageSettingDialog.Destroy;
begin

  FPageList.Free;

  inherited Destroy;

end; {destructor, Destroy}

{******************************************************************************
 *
 ** C A N C E L   D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomCancelDialog.Create }

constructor TppCustomCancelDialog.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FActiveForm       := nil;
  FAllowPrintCancel := False;
  FModal            := False;
  FppOnCancel       := nil;
  FPrintProgress    := '';

  {create timer used to implement ppCloseModal}
  FTimer := TTimer.Create(Self);
  FTimer.Enabled  := False;
  FTimer.Interval := 10;
  FTimer.OnTimer  := TimerEvent;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomCancelDialog.Destroy }

destructor TppCustomCancelDialog.Destroy;
begin

  {call form hide event handler here, because for in many cases WMShowWindow
   never fires the hide event}
  FormHideEvent;

  FTimer.Free;
  inherited Destroy;
end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppCustomCancelDialog.WMShowWindow}

procedure TppCustomCancelDialog.WMShowWindow(var Message: TMessage);
begin

  if (Message.wParam = 1) then

    FormShowEvent
  else
    FormHideEvent;

  inherited;

end; {procedure, WMShowWindow}


{------------------------------------------------------------------------------}
{ TppCustomCancelDialog.SetPrintProgress }

procedure TppCustomCancelDialog.SetPrintProgress(Value: String);
begin
  FPrintProgress := Value;

  PrintProgressChanged;
end;

{------------------------------------------------------------------------------}
{ TppCustomCancelDialog.PrintProgressChanged }

procedure TppCustomCancelDialog.PrintProgressChanged;
begin

end;

{------------------------------------------------------------------------------}
{ TppCustomCancelDialog.DoOnCancel }

procedure TppCustomCancelDialog.DoOnCancel;
begin
  if Assigned(FppOnCancel) then FppOnCancel(Self);
end; {procedure, DoOnCancel}

{------------------------------------------------------------------------------}
{ TppCustomCancelDialog.FormShow}

procedure TppCustomCancelDialog.FormShowEvent;
begin

  if FModal then Exit;

  {disable the currently active form}
  FActiveForm := Screen.ActiveForm;

  if (FActiveForm <> nil) then
    FActiveForm.Enabled := False;

end; {procedure, FormShow}

{------------------------------------------------------------------------------}
{ TppCustomCancelDialog.FormHide}

procedure TppCustomCancelDialog.FormHideEvent;
begin

  if FModal then Exit;

  {re-enable the previously active form}
  if (FActiveForm <> nil) and not(FActiveForm.Enabled) then
    begin

      FActiveForm.Enabled := True;

      if (FActiveForm.CanFocus) and (Screen.ActiveForm = Self) then
        FActiveForm.SetFocus;

    end;

end; {procedure, FormHide}


{------------------------------------------------------------------------------}
{ TppCustomCancelDialog.ppCloseModal}

procedure TppCustomCancelDialog.ppCloseModal;
begin
  FTimer.Enabled := True;

end; {procedure, ppCloseModal}

{------------------------------------------------------------------------------}
{ TppCustomCancelDialog.ppShowModal}

procedure TppCustomCancelDialog.ppShowModal;
begin
  FModal := True;
  ShowModal;
end; {procedure, ppShowModal}


{------------------------------------------------------------------------------}
{ TppCustomCancelDialog.TimerEvent }

procedure TppCustomCancelDialog.TimerEvent;
begin
  ModalResult := mrOK;
end; {procedure, TimerEvent}


{******************************************************************************
 *
 ** P R I N T   T O  S E T U P  F I L E  D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomPrintToFileSetupDialog.Create }

constructor TppCustomPrintToFileSetupDialog.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FCurrentReport := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomPrintToFileSetupDialog.SetCurrentReport }

procedure TppCustomPrintToFileSetupDialog.SetCurrentReport(aReport: TComponent);
begin

  FCurrentReport := aReport;
  CurrentReportAssigned;

end; {procedure, SetCurrentReport}

{------------------------------------------------------------------------------}
{ TppCustomPrintToFileSetupDialog.CurrentReportAssigned }

procedure TppCustomPrintToFileSetupDialog.CurrentReportAssigned;
begin

end; {procedure, CurrentReportAssigned}


{******************************************************************************
 *
 ** G R O U P  D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomGroupDialog.DoGetFieldForAlias }

procedure TppCustomGroupDialog.DoGetFieldForAlias(const aFieldAlias: String;
                                                var aDataPipeline: TObject; var aDataField: String);
begin
  if Assigned(FOnGetFieldForAlias) then  FOnGetFieldForAlias(Self, aFieldAlias, aDataPipeline, aDataField);
end; {procedure, DoGetFieldForAlias}

{******************************************************************************
 *
 ** P O S I T I O N  D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomPositionDialog.DoPositionChange }

procedure TppCustomPositionDialog.DoPositionChange;
begin
  if Assigned(FOnPositionChange) then FOnPositionChange(Self);
end; {procedure, DoPositionChange}


{******************************************************************************
 *
 ** T E M P L A T E   D I A L O G
 *
{******************************************************************************}

procedure TppCustomTemplateDialog.SetDataPipeline(aComponent: TComponent);
begin
  FDataPipeline := aComponent;
end; {function, SetDataPipeline}

{******************************************************************************
 *
 ** G R O U P   D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomGroupDialog.DoOnHelpClick }

procedure TppCustomTemplateDialog.DoOnHelpClick;
begin
  if HelpEventAssigned then FOnHelpClick(Self);
end; {function, DoOnHelpClick}

{------------------------------------------------------------------------------}
{ TppCustomGroupDialog.HelpEventAssigned }

function TppCustomTemplateDialog.HelpEventAssigned: Boolean;
begin
  Result := Assigned(FOnHelpClick);
end; {function, HelpEventAssigned}

{******************************************************************************
 *
 ** B A N D P O S I T I O N  D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomBandPositionDialog.DoPositionChange }

procedure TppCustomBandPositionDialog.DoPositionChange;
begin
  if Assigned(FOnPositionChange) then FOnPositionChange(Self);
end; {procedure, DoPositionChange}



{******************************************************************************
 *
 ** B A R C O D E  D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomBarCodeDialog.DoApplyChanges }

procedure TppCustomBarCodeDialog.DoApplyChanges;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;



{******************************************************************************
 *
 ** R E G I S T E R   P R O C E D U R E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppGetFormClassList - this routine creates the stringlist which will contain
  the class reference variables for the ReportBuilder forms.  The register
  routines always call this routine first, thus forcing the creation of the
  stringlist. This approach was taken because unit loading sequences would not
  guarantee that ppForm initialization fired first, resulting in a nil
  ppFormClassList. This function solves that problem...}

function ppFormClassList: TStringList;
begin
  if FFormClassList = nil then
    FFormClassList := TStringList.Create;

  Result := FFormClassList;
end;

{------------------------------------------------------------------------------}
{ ppRegisterForm }

procedure ppRegisterForm(aAncestorClass, aDescendantClass: TFormClass);
var
  lClassList: TStringList;
begin

  ppUnRegisterForm(aAncestorClass);

  {register class so descendant can be instantiated}
  RegisterClass(aDescendantClass);

  lClassList := ppFormClassList;

  lClassList.AddObject(aAncestorClass.ClassName, TObject(aDescendantClass));

end;

{------------------------------------------------------------------------------}
{ ppUnRegisterForm }

procedure ppUnRegisterForm(aAncestorClass: TFormClass);
var
  liIndex: Integer;
  lFormClass: TFormClass;
  lClassList: TStringList;

begin

  if (aAncestorClass = nil) then Exit;

  if (FFormClassList = nil) then Exit;

  lClassList := ppFormClassList;

  liIndex := lClassList.IndexOf(aAncestorClass.ClassName);

  if liIndex >= 0 then
    begin
      lFormClass := TFormClass(lClassList.Objects[liIndex]);

      UnRegisterClass(lFormClass);

      lClassList.Delete(liIndex);
    end;
end;

{------------------------------------------------------------------------------}
{ ppGetFormClass }

function ppGetFormClass(aAncestorClass: TFormClass): TFormClass;
var
  liIndex: Integer;
  lClassList: TStringList;

begin
  lClassList := ppFormClassList;

  liIndex :=  lClassList.IndexOf(aAncestorClass.ClassName);

  if liIndex >= 0 then
    Result := TFormClass(lClassList.Objects[liIndex])
  else
    Result := nil;

end;

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

finalization

  FFormClassList.Free;
  FFormClassList := nil;
  
end.
