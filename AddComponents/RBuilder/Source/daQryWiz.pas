{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daQryWiz;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, Buttons, Menus, ComCtrls,
  ppComm, ppWizard, ppTypes, ppUtils, ppDB, ppMetaB, ppEndUsr, ppDsIntf, ppClass, ppDsgnDB,
  daDB, daDataVw, daDatWiz, daQClass, daQuery, daQCrDlg, daQFnDlg, daMetaDW;

type


  TdaControlOptionType = (dacoSelectAllButtons, dacoOrderButtons, dacoRadioGroup);

  TdaControlOptions = set of TdaControlOptionType;

  {forward declarations}
  TdaQueryWizardDialog = class;
  TdaWizardPage = class;

  { TdaQueryWizard }
  TdaQueryWizard = class(TdaCustomDataWizard)
    private
      FDataView: TdaQueryDataView;
      FForm: TdaQueryWizardDialog;

      procedure CloseQueryEvent(Sender: TObject; var CanClose: Boolean);

    protected
      function  GetDataView: TObject; override;
      function  GetDataViewName: String; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      class function ClassBitmap: Longint; override;
      class function ClassDescription: String; override;
      class function DataViewClass: TdaDataViewClass; override;

      procedure ClearQuery;
      function  Execute: Boolean; override;

  end; {class, TdaQueryWizard}

  { TdaQueryWizardDialog }
  TdaQueryWizardDialog = class(TForm)
    pnlWizard: TPanel;
    pgcWizard: TPageControl;
    bvlSeparator: TBevel;
    btnCancel: TButton;
    btnPrevious: TButton;
    btnNext: TButton;
    btnFinish: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    FNextAction: TppNextActionType;
    FPages: TList;
    FSQL: TdaSQL;
    FSQLClass: TdaSQLClass;
    FWizardPage: TdaWizardPage;

    procedure ActivatePage;
    procedure SetSQL(aSQL: TdaSQL);
    procedure SetSQLClass(aSQLClass: TdaSQLClass);

  public
    procedure Initialize;
    
    property SQL: TdaSQL read FSQL write SetSQL;
    property SQLClass: TdaSQLClass read FSQLClass write SetSQLClass;
    property NextAction: TppNextActionType read FNextAction write FNextAction;
    
  end; {class, TdaQueryWizardDialog}

  { TdaWizardPage }
  TdaWizardPage = class(TppCommunicator)
    private
      FBasePanel: TPanel;
      FImage: TImage;
      FInitialized: Boolean;
      FPageControl: TPageControl;
      FSettingControls: Boolean;
      FSQL: TdaSQL;
      FTabSheet: TTabSheet;
      FTitle: TLabel;

      procedure SetSQL(aSQL: TdaSQL);

    protected
      procedure CreateControls; virtual;
      procedure SQLToControls; virtual; abstract;
      function  OutOfSync: Boolean; virtual; abstract;

      property BasePanel: TPanel read FBasePanel;
      property Image: TImage read FImage;
      property Initialized: Boolean read FInitialized;
      property PageControl: TPageControl read FPageControl;
      property SettingControls: Boolean read FSettingControls;
      property SQL: TdaSQL read FSQL write SetSQL;
      property TabSheet: TTabSheet read FTabSheet;
      property Title: TLabel read FTitle;

    public
      constructor CreatePage(aOwner: TComponent; aPageControl: TPageControl); virtual;

      procedure Notification(aComponent: TComponent; aOperation: TOperation); override;
      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      class function PageName: String; virtual;

      procedure Activate;
      function  Valid: Boolean; virtual; abstract;

  end; {class, TdaWizardPage}

  { TdaWizardDualListPage }
  TdaWizardDualListPage = class(TdaWizardPage)
    private
      FAvailableBevel: TBevel;
      FAvailableLabel: TLabel;
      FAvailableList: TListBox;
      FSetRadioGroupIndex: Boolean;
      FControlOptions: TdaControlOptions;
      FDeselectButton: TSpeedButton;
      FDeselecting: Boolean;
      FListsCleared: Boolean;
      FListPanel: TPanel;
      FMoveSelectedItems: Boolean;
      FMoveUp: TSpeedButton;
      FMoveDown: TSpeedButton;
      FRadioGroup: TRadioGroup;
      FSelectedBevel: TBevel;
      FSelectButton: TSpeedButton;
      FSelectedLabel: TLabel;
      FSelectedList: TListBox;
      FSelecting: Boolean;
      FSelectionList: TList;

      procedure Move(aIncrement: Integer);
      
      procedure DeselectItems(aList: TList);
      procedure SelectItems(aList: TList);
      procedure UpdateMoveButtons;

      {events}
      procedure DeselectAllClickEvent(Sender: TObject);
      procedure DeselectOneClickEvent(Sender: TObject);
      procedure SelectAllClickEvent(Sender: TObject);
      procedure SelectOneClickEvent(Sender: TObject);

    protected
      procedure CreateControls; override;
      procedure SQLToControls; override;

      procedure DeselectAllItems;
      procedure DeselectSelectedSelectItems;
      procedure SelectAllItems;
      procedure SelectSelectedAvailableItems;

      procedure ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer); virtual; abstract;
      procedure ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer); virtual; abstract;
      function  DeselectItem(aSelectedIndex: Integer): TdaChild; virtual; abstract;
      function  GetAvailableChild(aIndex: Integer): TdaChild; virtual; abstract;
      function  GetAvailableChildCount: Integer; virtual; abstract;
      function  GetSelectedChild(aIndex: Integer): TdaChild; virtual; abstract;
      function  GetSelectedChildCount: Integer; virtual; abstract;
      function  SelectItem(aAvailableIndex: Integer): TdaChild; virtual; abstract;

      procedure AvailableDblClickEvent(Sender: TObject); virtual;
      procedure AvailableDragOverEvent(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean); virtual;
      procedure AvailableDragDropEvent(Sender, Source: TObject; X,Y: Integer); virtual;
      procedure MoveDownClickEvent(Sender: TObject); virtual;
      procedure MoveUpClickEvent(Sender: TObject); virtual;
      procedure RadioGroupClickEvent(Sender: TObject); virtual;
      procedure SelectedClickEvent(Sender: TObject); virtual;
      procedure SelectedDblClickEvent(Sender: TObject); virtual;
      procedure SelectedDragOverEvent(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean); virtual;
      procedure SelectedDragDropEvent(Sender, Source: TObject; X,Y: Integer); virtual;

      procedure ItemSelected(aItemIndex: Integer); virtual;

      {controls}
      property AvailableBevel: TBevel read FAvailableBevel;
      property AvailableLabel: TLabel read FAvailableLabel;
      property AvailableList: TListBox read FAvailableList;
      property DeselectButton: TSpeedButton read FDeselectButton;
      property ListPanel: TPanel read FListPanel;
      property RadioGroup: TRadioGroup read FRadioGroup;
      property SelectedBevel: TBevel read FSelectedBevel;
      property SelectButton: TSpeedButton read FSelectButton;
      property SelectedLabel: TLabel read FSelectedLabel;
      property SelectedList: TListBox read FSelectedList;

      property ControlOptions: TdaControlOptions read FControlOptions;
      property Deselecting: Boolean read FDeselecting;
      property MoveSelectedItems: Boolean read FMoveSelectedItems write FMoveSelectedItems;
      property Selecting: Boolean read FSelecting;
      property SetRadioGroupIndex: Boolean read FSetRadioGroupIndex write FSetRadioGroupIndex;

    public
      constructor CreatePage(aOwner: TComponent; aPageControl: TPageControl); override;
      destructor Destroy; override;

  end; {class, TdaWizardDualListPage}

  { TdaWizardTablePage }
  TdaWizardTablePage = class(TdaWizardDualListPage)
    private
      FbtnJoin: TButton;

      procedure AvailableListDrawItemEvent(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
      procedure JoinClickEvent(Sender: TObject);

    protected
      procedure CreateControls; override;
      function  OutOfSync: Boolean; override;

      {dual list methods}
      procedure ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer); override;
      procedure ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer); override;
      function  DeselectItem(aSelectedIndex: Integer): TdaChild; override;
      function  GetAvailableChild(aIndex: Integer): TdaChild; override;
      function  GetAvailableChildCount: Integer; override;
      function  GetSelectedChild(aIndex: Integer): TdaChild; override;
      function  GetSelectedChildCount: Integer; override;
      function  SelectItem(aAvailableIndex: Integer): TdaChild; override;

      procedure ItemSelected(aItemIndex: Integer); override;

    public
      function  Valid: Boolean; override;
  end; {class, TdaWizardTablePage}

  { TdaWizardFieldPage }
  TdaWizardFieldPage = class(TdaWizardDualListPage)
    protected
      procedure CreateControls; override;
      procedure SQLToControls; override;
      function  OutOfSync: Boolean; override;

      {dual list methods}
      procedure ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer); override;
      procedure ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer); override;
      function  DeselectItem(aSelectedIndex: Integer): TdaChild; override;
      function  GetAvailableChild(aIndex: Integer): TdaChild; override;
      function  GetAvailableChildCount: Integer; override;
      function  GetSelectedChild(aIndex: Integer): TdaChild; override;
      function  GetSelectedChildCount: Integer; override;
      function  SelectItem(aAvailableIndex: Integer): TdaChild; override;

      {events}
      procedure RadioGroupClickEvent(Sender: TObject); override;

    public
      constructor CreatePage(aOwner: TComponent; aPageControl: TPageControl); override;

      function  Valid: Boolean; override;

  end; {class, TdaWizardFieldPage}

  { TdaWizardCalcPage }
  TdaWizardCalcPage = class(TdaWizardDualListPage)
    private
      FbtnFunction: TButton;
      FFunctionDialog: TdaFunctionDialog;

      procedure FunctionClickEvent(Sender: TObject);
      function  GetMatchingCalcFieldIndex: Integer;

    protected
      procedure CreateControls; override;
      function  OutOfSync: Boolean; override;

      {dual list methods}
      procedure ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer); override;
      procedure ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer); override;
      function  DeselectItem(aSelectedIndex: Integer): TdaChild; override;
      function  GetAvailableChild(aIndex: Integer): TdaChild; override;
      function  GetAvailableChildCount: Integer; override;
      function  GetSelectedChild(aIndex: Integer): TdaChild; override;
      function  GetSelectedChildCount: Integer; override;
      function  SelectItem(aAvailableIndex: Integer): TdaChild; override;

    public
      constructor CreatePage(aOwner: TComponent; aPageControl: TPageControl); override;

      function  Valid: Boolean; override;

  end; {class, TdaWizardCalcPage}

  { TdaWizardGroupPage }
  TdaWizardGroupPage = class(TdaWizardDualListPage)
    private
      FDeselectionFailed: Boolean;
      FRadioGroupClicked: Boolean;
           
      procedure DisplayGroupFieldsMessage;
      procedure DisplayCalcGroupsMessage;

    protected
      procedure CreateControls; override;
      function  OutOfSync: Boolean; override;
      procedure SQLToControls; override;

      {dual list methods}
      procedure ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer); override;
      procedure ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer); override;
      function  DeselectItem(aSelectedIndex: Integer): TdaChild; override;
      function  GetAvailableChild(aIndex: Integer): TdaChild; override;
      function  GetAvailableChildCount: Integer; override;
      function  GetSelectedChild(aIndex: Integer): TdaChild; override;
      function  GetSelectedChildCount: Integer; override;
      function  SelectItem(aAvailableIndex: Integer): TdaChild; override;

      {events}
      procedure RadioGroupClickEvent(Sender: TObject); override;
      
    public
      constructor CreatePage(aOwner: TComponent; aPageControl: TPageControl); override;

      function  Valid: Boolean; override;

  end; {class, TdaWizardGroupPage}

  { TdaWizardSearchPage }
  TdaWizardSearchPage = class(TdaWizardDualListPage)
    private
      FCriteriaList: TListBox;
      FCriteriaDialog: TdaCriteriaDialog;
      
      procedure CriteriaDrawItemEvent(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);

      procedure AddParenthesesClickEvent(Sender: TObject);
      procedure InsertCriteriaClickEvent(Sender: TObject);
      procedure InsertNOTClickEvent(Sender: TObject);
      procedure InsertORClickEvent(Sender: TObject);
      procedure RemoveCriteriaClickEvent(Sender: TObject);
      procedure RemoveParenthesesClickEvent(Sender: TObject);

    protected
      procedure CreateControls; override;
      procedure SQLToControls; override;
      function  OutOfSync: Boolean; override;

      {dual list methods}
      procedure ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer); override;
      procedure ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer); override;
      function  DeselectItem(aSelectedIndex: Integer): TdaChild; override;
      function  GetAvailableChild(aIndex: Integer): TdaChild; override;
      function  GetAvailableChildCount: Integer; override;
      function  GetSelectedChild(aIndex: Integer): TdaChild; override;
      function  GetSelectedChildCount: Integer; override;
      function  SelectItem(aAvailableIndex: Integer): TdaChild; override;

      procedure ItemSelected(aItemIndex: Integer); override;

      {events}
      procedure MoveDownClickEvent(Sender: TObject); override;
      procedure MoveUpClickEvent(Sender: TObject); override;
      procedure SelectedDblClickEvent(Sender: TObject); override;

    public
      constructor CreatePage(aOwner: TComponent; aPageControl: TPageControl); override;

      function  Valid: Boolean; override;

  end; {class, TdaWizardSearchPage}

  { TdaWizardSortPage }
  TdaWizardSortPage = class(TdaWizardDualListPage)
    private
      FspbAscending: TSpeedButton;
      FspbDescending: TSpeedButton;

      procedure AscendingClickEvent(Sender: TObject);
      procedure DescendingClickEvent(Sender: TObject);

    protected
      procedure CreateControls; override;
      function  OutOfSync: Boolean; override;

      {dual list methods}
      procedure ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer); override;
      procedure ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer); override;
      function  DeselectItem(aSelectedIndex: Integer): TdaChild; override;
      function  GetAvailableChild(aIndex: Integer): TdaChild; override;
      function  GetAvailableChildCount: Integer; override;
      function  GetSelectedChild(aIndex: Integer): TdaChild; override;
      function  GetSelectedChildCount: Integer; override;
      function  SelectItem(aAvailableIndex: Integer): TdaChild; override;

      procedure ItemSelected(aItemIndex: Integer); override;

    public
      constructor CreatePage(aOwner: TComponent; aPageControl: TPageControl); override;

      function  Valid: Boolean; override;

  end; {class, TdaWizardSortPage}

  { TdaWizardFinishPage }
  TdaWizardFinishPage = class(TdaWizardPage)
    private
      FedtName: TEdit;
      FedtDescription: TEdit;
      FmemSQL: TMemo;
      FNextAction: TppNextActionType;
      FrdbDesign: TRadioButton;
      FrdbPreview: TRadioButton;

      procedure DescriptionChangeEvent(Sender: TObject);
      procedure DescriptionKeyUpEvent(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure NameChangeEvent(Sender: TObject);

    protected
      procedure CreateControls; override;
      procedure SQLToControls; override;
      function  OutOfSync: Boolean; override;
    public
      function  Valid: Boolean; override;

      property NextAction: TppNextActionType read FNextAction;

  end; {class, TdaWizardFinishPage}


var
  daQueryWizardDialog: TdaQueryWizard;

implementation

{$R *.DFM}

uses
  daDatMan;

{------------------------------------------------------------------------------}
{ ppGetQueryWizardCount }

function ppGetQueryWizardCount(aOwner: TComponent): Integer;
var
  liIndex: Integer;
begin

  Result := 0;

  if (aOwner = nil) or (csDestroying in aOwner.ComponentState) then Exit;

  for liIndex := 0 to aOwner.ComponentCount-1 do
    if aOwner.Components[liIndex].InheritsFrom(TdaQueryWizard) then
     Result := Result + 1;

end; {function, ppGetQueryWizardCount}


{******************************************************************************
 *
 ** Q U E R Y   W I Z A R D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaQueryWizard.Create }

constructor TdaQueryWizard.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDataView := nil;
  FForm := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaQueryWizard.Destroy }

destructor TdaQueryWizard.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaQueryWizard.GetDataView }

function  TdaQueryWizard.GetDataView: TObject;
begin
  Result := FDataView;
end; {function, GetDataView}

{------------------------------------------------------------------------------}
{ TdaQueryWizard.GetDataViewName }

function TdaQueryWizard.GetDataViewName: String;
begin
  if (FDataView <> nil) then
    Result := FDataView.SQL.Description;
end; {function, GetDataViewName}

{------------------------------------------------------------------------------}
{ TdaQueryWizard.ClassDescription }

class function TdaQueryWizard.ClassDescription: String;
begin
  Result := ppLoadStr(811); {Query Wizard}
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaQueryWizard.ClassBitmap }

class function TdaQueryWizard.ClassBitmap: Longint;
begin
  Result :=ppBitmapFromResource('DAQUERYWIZARD');
end; {class function, ClassBitmap}

{------------------------------------------------------------------------------}
{ TdaQueryWizard.DataViewClass }

class function TdaQueryWizard.DataViewClass: TdaDataViewClass;
begin
  Result := TdaQueryDataView;
end; {class function, DataViewClass}

{------------------------------------------------------------------------------}
{ TdaQueryWizard.Notify }

procedure TdaQueryWizard.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if not(aOperation = ppopRemove) then Exit;

  if (aCommunicator = FDataView) then
    FDataView := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TdaQueryWizard.CloseQueryEvent }

procedure TdaQueryWizard.CloseQueryEvent(Sender: TObject; var CanClose: Boolean);
begin

  {very important that the Sender be this component and NOT the form}
  if (FForm.ModalResult = mrOK) then
    DoOnValidateName(Self, FForm.SQL.DataPipelineName, CanClose);

end; {procedure, CloseQuery}

{------------------------------------------------------------------------------}
{ TdaQueryWizard.ClearQuery }

procedure TdaQueryWizard.ClearQuery;
begin
  if (FDataView <> nil) then
    FDataView.SQL.Clear;
end; {procedure, ClearQuery}

{------------------------------------------------------------------------------}
{ TdaQueryWizard.Execute }

function TdaQueryWizard.Execute: Boolean;
begin

  Result := False;

  DoOnCreateDataView(TObject(FDataView));

  if (FDataView = nil) then Exit;

  FDataView.Init;

  if (FForm = nil) then
    FForm := TdaQueryWizardDialog.Create(Application);

  {get sql from dataview}
  FForm.SQLClass := FDataView.SQLClass;
  FForm.SQL := FDataView.SQL;

  FForm.SQL.AddNotify(FDataView);

  {set form properties}
  FForm.OnCloseQuery := CloseQueryEvent;

  {set SQL properties}
  FForm.SQL.DatabaseName := DataSettings.DatabaseName;
  FForm.SQL.DatabaseType := DataSettings.DatabaseType;
  FForm.SQL.SQLType := DataSettings.SQLType;
  FForm.SQL.LanguageIndex := LanguageIndex;

  if DataSettings.UseDataDictionary then
    FForm.SQL.DataDictionary := TppDataDictionary(DataSettings.DataDictionary)
  else
    FForm.SQL.DataDictionary := nil;

  FForm.Initialize;

  {show form}
  if (FForm.ShowModal = mrOK) then
    begin
      FDataView.Valid := True;
      FDataView.SQL := FForm.SQL;
      FDataView.SQL.Modified := False;

      NextAction := FForm.NextAction;

      Result := True;
    end;

  FForm.SQL.RemoveNotify(FDataView);

  FForm.Free;
  FForm := nil;

end; {function, Execute}


{******************************************************************************
 *
 ** Q U E R Y   W I Z A R D   D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaQueryWizardDialog.FormCreate }

procedure TdaQueryWizardDialog.FormCreate(Sender: TObject);
begin

  FNextAction := ppnaNone;

  FPages := nil;
  FSQL := nil;
  FSQLClass := nil;
  FWizardPage := nil;

end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TdaQueryWizardDialog.FormDestroy }

procedure TdaQueryWizardDialog.FormDestroy(Sender: TObject);
begin

  FPages.Free;
  FSQL.Free;

end; {procedure, FormDestroy}

{------------------------------------------------------------------------------}
{ TdaQueryWizardDialog.Initialize }

procedure TdaQueryWizardDialog.Initialize;
var
  liIndex: Integer;
begin

  Caption := ppLoadStr(811); {Query Wizard}

  btnFinish.Caption := ppLoadStr(764); {Finish}
  btnCancel.Caption := ppLoadStr(738); {Cancel}
  btnPrevious.Caption := '< ' + ppLoadStr(730); {Back}
  btnNext.Caption := ppLoadStr(791) + ' >'; {Next}

  {create pages}
  if (FPages = nil) then
    begin
      FPages := TList.Create;

      FPages.Add(TdaWizardTablePage.CreatePage(Self, pgcWizard));
      FPages.Add(TdaWizardFieldPage.CreatePage(Self, pgcWizard));
      FPages.Add(TdaWizardCalcPage.CreatePage(Self, pgcWizard));
      FPages.Add(TdaWizardGroupPage.CreatePage(Self, pgcWizard));
      FPages.Add(TdaWizardSearchPage.CreatePage(Self, pgcWizard));
      FPages.Add(TdaWizardSortPage.CreatePage(Self, pgcWizard));
      FPages.Add(TdaWizardFinishPage.CreatePage(Self, pgcWizard));

      for liIndex := 0 to FPages.Count - 1 do
        TdaWizardPage(FPages[liIndex]).SQL := FSQL;

    end;

  {default to first page}
  FWizardPage := TdaWizardPage(FPages[0]);

  pgcWizard.ActivePage := FWizardPage.TabSheet;

  ActivatePage;

end; {procedure, Initialize}

{------------------------------------------------------------------------------}
{ TdaQueryWizardDialog.SetSQLClass }

procedure TdaQueryWizardDialog.SetSQLClass(aSQLClass: TdaSQLClass);
begin

  if (FSQLClass = aSQLClass) then Exit;

  if (FSQL <> nil) then
    FSQL.Free;

  FSQLClass := aSQLClass;

  FSQL := FSQLClass.Create(Self);

end; {procedure, SetSQLClass}

{------------------------------------------------------------------------------}
{ TdaQueryWizardDialog.SetSQL }

procedure TdaQueryWizardDialog.SetSQL(aSQL: TdaSQL);
begin

  FSQL.Assign(aSQL);

  FSQL.AllowSelfJoin := False;

end; {procedure, SetSQL}

{------------------------------------------------------------------------------}
{ TdaQueryWizardDialog.ActivatePage }

procedure TdaQueryWizardDialog.ActivatePage;
var
 liIndex: Integer;
begin

  liIndex := pgcWizard.ActivePage.PageIndex;

  btnPrevious.Visible := (liIndex > 0);
  btnNext.Visible     := (liIndex < (pgcWizard.PageCount - 1));
  btnFinish.Visible   := (liIndex = (pgcWizard.PageCount - 1));

  FWizardPage := TdaWizardPage(pgcWizard.ActivePage.Tag);

  FWizardPage.Activate;

end; {procedure, ActivatePage}

{------------------------------------------------------------------------------}
{ TdaQueryWizardDialog.btnFinishClick }

procedure TdaQueryWizardDialog.btnFinishClick(Sender: TObject);
begin

  if (FWizardPage.Valid) and (FSQL.Valid) then
    begin
      NextAction := TdaWizardFinishPage(FPages[FPages.Count - 1]).NextAction;

      ModalResult := mrOK;
    end;

end; {procedure, btnFinishClick}

{------------------------------------------------------------------------------}
{ TdaQueryWizardDialog.btnCancelClick }

procedure TdaQueryWizardDialog.btnCancelClick(Sender: TObject);
begin
  Close;
end; {procedure, btnCancelClick}

{------------------------------------------------------------------------------}
{ TdaQueryWizardDialog.btnPreviousClick }

procedure TdaQueryWizardDialog.btnPreviousClick(Sender: TObject);
var
  liIndex: Integer;
begin
  liIndex := pgcWizard.ActivePage.PageIndex;

  pgcWizard.ActivePage := pgcWizard.Pages[liIndex - 1];

  ActivatePage;
end; {procedure, btnPreviousClick}

{------------------------------------------------------------------------------}
{ TdaQueryWizardDialog.btnNextClick }

procedure TdaQueryWizardDialog.btnNextClick(Sender: TObject);
var
  liIndex: Integer;
begin

  if FWizardPage.Valid then
    begin
      liIndex := pgcWizard.ActivePage.PageIndex;

      pgcWizard.ActivePage := pgcWizard.Pages[liIndex + 1];

      ActivatePage;
    end;

end; {procedure, btnNextClick}

{******************************************************************************
 *
 ** W I Z A R D   P A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaWizardPage.CreatePage }

constructor TdaWizardPage.CreatePage(aOwner: TComponent; aPageControl: TPageControl);
begin

  inherited Create(aOwner);

  FPageControl := aPageControl;
  FSQL := nil;
  
  FTabSheet := TTabSheet.Create(Self);
  FTabSheet.Parent := FPageControl;
  FTabSheet.PageControl := FPageControl;
  FTabSheet.TabVisible := False;
  FTabSheet.Tag := Integer(Self);

  if (FSQL <> nil) then
    FSQL.AddNotify(Self);

end; {constructor, CreatePage}

{------------------------------------------------------------------------------}
{ TdaWizardPage.Notification }

procedure TdaWizardPage.Notification(aComponent: TComponent; aOperation: TOperation);
begin

  inherited Notification(aComponent, aOperation);

  if (aComponent = FPageControl) and (aOperation = opRemove) then
    FPageControl := nil;

end; {procedure, Notification}

{------------------------------------------------------------------------------}
{ TdaWizardPage.Notify }

procedure TdaWizardPage.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if not(aOperation = ppopRemove) then Exit;

  if (aCommunicator = FSQL) then
    FSQL := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TdaWizardPage.SetSQL }

procedure TdaWizardPage.SetSQL(aSQL: TdaSQL);
begin

  if (FSQL <> nil) then
    FSQL.RemoveNotify(Self);

  FSQL := aSQL;

  if (FSQL <> nil) then
    FSQL.AddNotify(Self);

end; {procedure, SetSQL}

{------------------------------------------------------------------------------}
{ TdaWizardPage.PageName }

class function TdaWizardPage.PageName: String;
begin
  Result := ClassName;
end; {class function, PageName}

{------------------------------------------------------------------------------}
{ TdaWizardPage.Activate }

procedure TdaWizardPage.Activate;
begin

  if (FInitialized) and not(OutOfSync) then Exit;

  TabSheet.Visible := False;

  FSettingControls := True;

  if not(FInitialized) then
    begin
      CreateControls;

      SQLToControls;

      FInitialized := True;
    end

  else if OutOfSync then
    SQLToControls;

  FSettingControls := False;

  TabSheet.Visible := True;

end; {procedure, Activate}

{------------------------------------------------------------------------------}
{ TdaWizardPage.CreateControls }

procedure TdaWizardPage.CreateControls;
begin

  FBasePanel := TPanel.Create(Self);
  FBasePanel.Parent := TabSheet;
  FBasePanel.BevelOuter := bvNone;
  FBasePanel.Align := alClient;

  {create image}
  FImage := TImage.Create(Self);
  FImage.Parent := FBasePanel;
  FImage.AutoSize := True;
  FImage.Left := 16;
  FImage.Top := 0;
  FImage.Width := 160;
  FImage.Height := 80;
  FImage.Transparent := True;

  {create title label}
  FTitle := TLabel.Create(Self);
  FTitle.Parent := FBasePanel;
  FTitle.Left := 190;
  FTitle.Top := 15;

end; {procedure, CreateControls}

{******************************************************************************
 *
 ** W I Z A R D   D U A L   L I S T   P A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.CreatePage }

constructor TdaWizardDualListPage.CreatePage(aOwner: TComponent; aPageControl: TPageControl);
begin

  inherited CreatePage(aOwner, aPageControl);

  FSelectionList := TList.Create;
  FControlOptions := [];

end; {constructor, CreatePage}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.Destroy }

destructor TdaWizardDualListPage.Destroy;
begin

  FSelectionList.Free;

  inherited Destroy;

end; {constructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.CreateControls }

procedure TdaWizardDualListPage.CreateControls;
var
  lButton: TSpeedButton;
  liLeft: Integer;
  liWidth: Integer;
  liHeight: Integer;
begin

  inherited CreateControls;

  FSetRadioGroupIndex := True;
  FDeselecting := False;
  FMoveSelectedItems := True;
  FSelecting := False;

  {create radio group}
  if (dacoRadioGroup in ControlOptions) then
    begin
      FRadioGroup := TRadioGroup.Create(Self);
      FRadioGroup.Parent := BasePanel;
      FRadioGroup.Columns := 2;

      FRadioGroup.Items.Add('');
      FRadioGroup.Items.Add('');

      FRadioGroup.Left := 8;
      FRadioGroup.Top := 80;
      FRadioGroup.Width := 305;
      FRadioGroup.Height := 41;

      FRadioGroup.OnClick := RadioGroupClickEvent;
    end;

  if (dacoOrderButtons in ControlOptions) then
    begin
      liLeft := 256;
      liWidth := 179;
    end
  else
    begin
      liLeft := 274;
      liWidth := 191;
    end;

  FListPanel := TPanel.Create(Self);
  FListPanel.Parent := BasePanel;
  FListPanel.BevelOuter := bvNone;

  if (dacoRadioGroup in ControlOptions) then
    begin
      FListPanel.Height := 178;

      liHeight := 149;
    end
  else
    begin
      FListPanel.Height := 230;

      liHeight := 201;
    end;

  FListPanel.Align := alBottom;

  {available controls}
  FAvailableBevel := TBevel.Create(Self);
  FAvailableBevel.Parent := FListPanel;
  FAvailableBevel.Shape := bsFrame;
  FAvailableBevel.Left := 8;
  FAvailableBevel.Top := 6;
  FAvailableBevel.Width := liWidth + 17;
  FAvailableBevel.Height := liHeight + 18;

  FAvailableLabel := TLabel.Create(Self);
  FAvailableLabel.Parent := FListPanel;
  FAvailableLabel.Left := 16;
  FAvailableLabel.Top := 0;

  FAvailableList := TListBox.Create(Self);
  FAvailableList.Parent := FListPanel;
  FAvailableList.Left := 16;
  FAvailableList.Top := 16;
  FAvailableList.Width := liWidth;
  FAvailableList.Height := liHeight;
  FAvailableList.DragCursor := crDefault;
  FAvailableList.DragMode := dmAutomatic;
  FAvailableList.MultiSelect := True;

  {selected controls}
  FSelectedBevel := TBevel.Create(Self);
  FSelectedBevel.Parent := FListPanel;
  FSelectedBevel.Shape := bsFrame;
  FSelectedBevel.Left := liLeft - 8;
  FSelectedBevel.Top := 6;
  FSelectedBevel.Width := liWidth + 17;
  FSelectedBevel.Height := liHeight + 18;

  if (dacoOrderButtons in ControlOptions) then
    FSelectedBevel.Width := FSelectedBevel.Width + 29;

  FSelectedLabel := TLabel.Create(Self);
  FSelectedLabel.Parent := FListPanel;
  FSelectedLabel.Left := liLeft;
  FSelectedLabel.Top := 0;

  FSelectedList := TListBox.Create(Self);
  FSelectedList.Parent := FListPanel;
  FSelectedList.Left := liLeft;
  FSelectedList.Top := 16;
  FSelectedList.Width := liWidth;
  FSelectedList.Height := liHeight;
  FSelectedList.DragCursor := crDefault;
  FSelectedList.DragMode := dmAutomatic;
  FSelectedList.MultiSelect := True;

  {create selection buttons}
  FSelectButton := TSpeedButton.Create(Self);
  FSelectButton.Parent := FListPanel;
  FSelectButton.Left := liLeft - 45;
  FSelectButton.Width := 30;
  FSelectButton.Height := 17;
  FSelectButton.Glyph.Handle :=ppBitmapFromResource('DASELECTONE');
  FSelectButton.OnClick := SelectOneClickEvent;

  FDeselectButton := TSpeedButton.Create(Self);
  FDeselectButton.Parent := FListPanel;
  FDeselectButton.Left := liLeft - 45;
  FDeselectButton.Width := 30;
  FDeselectButton.Height := 17;
  FDeselectButton.Glyph.Handle :=ppBitmapFromResource('DADESELECTONE');
  FDeselectButton.OnClick := DeselectOneClickEvent;

  if not(dacoSelectAllButtons in ControlOptions) then
    begin
      FSelectButton.Top := 55;
      FDeselectButton.Top := 84;
    end
  else
    begin
      FSelectButton.Top := 40;
      FDeselectButton.Top := 92;

      lButton := TSpeedButton.Create(Self);
      lButton.Parent := FListPanel;
      lButton.Left := liLeft - 45;
      lButton.Top := 63;
      lButton.Width := 30;
      lButton.Height := 17;
      lButton.Glyph.Handle :=ppBitmapFromResource('DASELECTALL');
      lButton.OnClick := SelectAllClickEvent;

      lButton := TSpeedButton.Create(Self);
      lButton.Parent := FListPanel;
      lButton.Left := liLeft - 45;
      lButton.Top := 115;
      lButton.Width := 30;
      lButton.Height := 17;
      lButton.Glyph.Handle :=ppBitmapFromResource('DADESELECTALL');
      lButton.OnClick := DeselectAllClickEvent;
    end;

  {create order buttons}
  if (dacoOrderButtons in ControlOptions) then
    begin
      FMoveUp := TSpeedButton.Create(Self);
      FMoveUp.Parent := FListPanel;
      FMoveUp.Left := 441;
      FMoveUp.Top := 64;
      FMoveUp.Width := 25;
      FMoveUp.Height := 17;
      FMoveUp.Glyph.Handle := ppBitmapFromResource('DAMOVEUP');
      FMoveUp.OnClick := MoveUpClickEvent;

      FMoveDown := TSpeedButton.Create(Self);
      FMoveDown.Parent := FListPanel;
      FMoveDown.Left := 441;
      FMoveDown.Top := 105;
      FMoveDown.Width := 25;
      FMoveDown.Height := 17;
      FMoveDown.Glyph.Handle := ppBitmapFromResource('DAMOVEDOWN');
      FMoveDown.OnClick := MoveDownClickEvent;
    end
  else
    begin
      FMoveUp := nil;
      FMoveDown := nil;
    end;

  {assign event handlers}
  FAvailableList.OnDblClick := AvailableDblClickEvent;
  FAvailableList.OnDragOver := AvailableDragOverEvent;
  FAvailableList.OnDragDrop := AvailableDragDropEvent;
  
  FSelectedList.OnClick := SelectedClickEvent;
  FSelectedList.OnDblClick := SelectedDblClickEvent;
  FSelectedList.OnDragOver := SelectedDragOverEvent;
  FSelectedList.OnDragDrop := SelectedDragDropEvent;

end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.SQLToControls }

procedure TdaWizardDualListPage.SQLToControls;
var
  liIndex: Integer;
  liCount: Integer;
  lChild: TdaChild;
  liItem: Integer;
begin

  FListsCleared := True;

  FAvailableList.Items.Clear;

  liCount := GetAvailableChildCount;

  for liIndex := 0 to liCount - 1 do
    begin
      lChild := GetAvailableChild(liIndex);

      liItem := FAvailableList.Items.Add('');

      ChildToAvailableItem(lChild, liItem);
    end;

  FSelectedList.Items.Clear;

  liCount := GetSelectedChildCount;

  for liIndex := 0 to liCount - 1 do
    begin
      lChild := GetSelectedChild(liIndex);

      liItem := FSelectedList.Items.Add('');

      ChildToSelectedItem(lChild, liItem);
    end;

  if (dacoRadioGroup in ControlOptions) and FSetRadioGroupIndex then
    begin

      if (GetSelectedChildCount > 0) then
        FRadioGroup.ItemIndex := 1
      else
        FRadioGroup.ItemIndex := 0;

    end;

  UpdateMoveButtons;

end; {procedure, SQLToControls}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.UpdateMoveButtons }

procedure TdaWizardDualListPage.UpdateMoveButtons;
var
  lbEnabled: Boolean;
begin

  if (FMoveUp = nil) then Exit;

  lbEnabled := (GetSelectedChildCount > 1);

  FMoveUp.Enabled := lbEnabled;
  FMoveDown.Enabled := lbEnabled;
  
end; {procedure, UpdateMoveButtons}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.SelectAllItems }

procedure TdaWizardDualListPage.SelectAllItems;
var
  lList: TList;
  liIndex: Integer;
begin

  FAvailableList.Items.BeginUpdate;
  FSelectedList.Items.BeginUpdate;

  lList := TList.Create;

  for liIndex := 0 to FAvailableList.Items.Count - 1 do
    lList.Add(TObject(liIndex));

  SelectItems(lList);

  lList.Free;

  FAvailableList.Items.EndUpdate;
  FSelectedList.Items.EndUpdate;

end; {procedure, SelectAllItems}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.DeselectAllItems }

procedure TdaWizardDualListPage.DeselectAllItems;
var
  liIndex: Integer;
begin

  FAvailableList.Items.BeginUpdate;
  FSelectedList.Items.BeginUpdate;

  FSelectionList.Clear;

  for liIndex := 0 to FSelectedList.Items.Count - 1 do
    FSelectionList.Add(TObject(liIndex));

  DeselectItems(FSelectionList);

  FSelectionList.Clear;

  FAvailableList.Items.EndUpdate;
  FSelectedList.Items.EndUpdate;

end; {procedure, DeselectAllItems}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.SelectItems }

procedure TdaWizardDualListPage.SelectItems(aList: TList);
var
  liIndex: Integer;
  liItem1: Integer;
  liItem2: Integer;
  lChild: TdaChild;
begin

  for liIndex := 0 to aList.Count - 1 do
    begin
      liItem1 := Integer(aList[liIndex]);

      if (FMoveSelectedItems) then
        liItem1 := liItem1 - liIndex;

      FListsCleared := False;

      FSelecting := True;

      lChild := SelectItem(liItem1);

      FSelecting := False;

      if (lChild <> nil) then
        begin
          liItem2 := FSelectedList.Items.Add('');

          ChildToSelectedItem(lChild, liItem2);

          if (FMoveSelectedItems) and not(FListsCleared) then
            FAvailableList.Items.Delete(liItem1);
        end;

      FListsCleared := False;
    end;

  UpdateMoveButtons;

end; {procedure, SelectItems}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.DeselectItems }

procedure TdaWizardDualListPage.DeselectItems(aList: TList);
var
  liIndex: Integer;
  liItem: Integer;
  lChild: TdaChild;
  liCount: Integer;
begin

  liCount := 0;

  for liIndex := 0 to aList.Count - 1 do
    begin
      liItem := Integer(aList[liIndex]) - liCount;

      FListsCleared := False;

      FDeselecting := True;

      lChild := DeselectItem(liItem);

      FDeselecting := False;

      if not(FListsCleared) and (lChild <> nil) then
        begin
          FSelectedList.Items.Delete(liItem);

          if (FMoveSelectedItems) then
            begin
              liItem := daInsertString(FAvailableList.Items, lChild.Tag, '');

              ChildToAvailableItem(lChild, liItem);
            end;

          Inc(liCount);
        end;

      FListsCleared := False;

    end;

  UpdateMoveButtons;

end; {procedure, DeselectItems}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.DeselectSelectedSelectItems }

procedure TdaWizardDualListPage.DeselectSelectedSelectItems;
var
  liIndex: Integer;
begin

  if (FSelectedList.SelCount = 0) then Exit;

  FSelectionList.Clear;

  for liIndex := 0 to FSelectedList.Items.Count - 1 do
    begin
      if FSelectedList.Selected[liIndex] then
        FSelectionList.Add(TObject(liIndex));
    end;

  DeselectItems(FSelectionList);

  FSelectionList.Clear;

end; {procedure, DeselectSelectedSelectItems}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.SelectSelectedAvailableItems }

procedure TdaWizardDualListPage.SelectSelectedAvailableItems;
var
  lList: TList;
  liIndex: Integer;
begin

  if (FAvailableList.SelCount = 0) then Exit;

  lList := TList.Create;

  for liIndex := 0 to FAvailableList.Items.Count - 1 do
    begin
      if FAvailableList.Selected[liIndex] then
        lList.Add(TObject(liIndex));
    end;

  SelectItems(lList);

  lList.Free;

end; {procedure, SelectSelectedAvailableItems}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.AvailableDblClickEvent }

procedure TdaWizardDualListPage.AvailableDblClickEvent(Sender: TObject);
var
  lList: TList;
begin

  if (FAvailableList.ItemIndex = -1) then Exit;

  if (GetAvailableChildCount = 0) then Exit;

  lList := TList.Create;

  lList.Add(TObject(FAvailableList.ItemIndex));

  SelectItems(lList);

  lList.Free;

end; {procedure, AvailableDblClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.AvailableDragOverEvent }

procedure TdaWizardDualListPage.AvailableDragOverEvent(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = FSelectedList) then
    Accept := True;
end; {procedure, AvailableDragOverEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.AvailableDragDropEvent }

procedure TdaWizardDualListPage.AvailableDragDropEvent(Sender, Source: TObject; X,Y: Integer);
begin
  DeselectSelectedSelectItems;
end; {procedure, AvailableDragDropEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.SelectedClickEvent }

procedure TdaWizardDualListPage.SelectedClickEvent(Sender: TObject);
var
  lPoint: TPoint;
  liItem: Integer;
begin

  GetCursorPos(lPoint);

  lPoint := FSelectedList.ScreenToClient(lPoint);

  liItem := FSelectedList.ItemAtPos(lPoint, True);

  if (liItem <> -1) then
    ItemSelected(liItem);

end; {procedure, SelectedClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.SelectedDblClickEvent }

procedure TdaWizardDualListPage.SelectedDblClickEvent(Sender: TObject);
begin

  if (FSelectedList.ItemIndex = -1) then Exit;

  if (GetSelectedChildCount = 0) then Exit;

  FSelectionList.Clear;

  FSelectionList.Add(TObject(FSelectedList.ItemIndex));

  DeselectItems(FSelectionList);

  FSelectionList.Clear;

end; {procedure, SelectedDblClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.SelectedDragOverEvent }

procedure TdaWizardDualListPage.SelectedDragOverEvent(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = FAvailableList) then
    Accept := True;
end; {procedure, SelectedDragOverEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.SelectedDragDropEvent }

procedure TdaWizardDualListPage.SelectedDragDropEvent(Sender, Source: TObject; X,Y: Integer);
begin
  SelectSelectedAvailableItems
end; {procedure, SelectedDragDropEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.Move }

procedure TdaWizardDualListPage.Move(aIncrement: Integer);
var
  liIndex: Integer;
  liNewIndex: Integer;
  lChild: TdaChild;
  liEnd: Integer;
  lList: TList;
begin

  if FSelectedList.Selected[0] and (aIncrement < 0) then Exit;
  if FSelectedList.Selected[FSelectedList.Items.Count - 1] and (aIncrement > 0) then Exit;

  FSelectedList.Items.BeginUpdate;

  lList := TList.Create;

  if (aIncrement < 0) then
    begin
      liIndex := 0;
      liEnd := FSelectedList.Items.Count;
    end
  else
    begin
      liIndex := FSelectedList.Items.Count - 1;
      liEnd := -1;
    end;

  while (liIndex <> liEnd) do
    begin
      if FSelectedList.Selected[liIndex] then
        begin
          lChild := GetSelectedChild(liIndex);

          liNewIndex := liIndex + aIncrement;

          if (liNewIndex > -1) and (liNewIndex < FSelectedList.Items.Count) then
            begin
              FSQL.MoveChild(lChild, liIndex, liNewIndex);

              FSelectedList.Items.Move(liIndex, liNewIndex);

              lList.Add(TObject(liNewIndex));
            end;
        end;

      liIndex := liIndex + (aIncrement * -1);
    end;

  for liIndex := 0 to lList.Count - 1 do
    FSelectedList.Selected[Integer(lList[liIndex])] := True;

  lList.Free;

  FSelectedList.Items.EndUpdate;

end; {procedure, Move}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.MoveUpClickEvent }

procedure TdaWizardDualListPage.MoveUpClickEvent(Sender: TObject);
begin
  Move(-1);
end; {procedure, MoveUpClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.MoveDownClickEvent }

procedure TdaWizardDualListPage.MoveDownClickEvent(Sender: TObject);
begin
  Move(1);
end; {procedure, MoveDownClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.RadioGroupClickEvent }

procedure TdaWizardDualListPage.RadioGroupClickEvent(Sender: TObject);
begin

  FListPanel.Visible := (FRadioGroup.ItemIndex = 1);

  if (SetRadioGroupIndex) and (RadioGroup.ItemIndex = 0) then
    DeselectAllItems;

end; {procedure, RadioGroupClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.DeselectAllClickEvent }

procedure TdaWizardDualListPage.DeselectAllClickEvent(Sender: TObject);
begin
  DeselectAllItems;
end; {procedure, DeselectAllClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.DeselectOneClickEvent }

procedure TdaWizardDualListPage.DeselectOneClickEvent(Sender: TObject);
begin
  DeselectSelectedSelectItems;
end; {procedure, DeselectOneClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.SelectAllClickEvent }

procedure TdaWizardDualListPage.SelectAllClickEvent(Sender: TObject);
begin
  SelectAllItems;
end; {procedure, SelectAllClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.SelectOneClickEvent }

procedure TdaWizardDualListPage.SelectOneClickEvent(Sender: TObject);
begin
  SelectSelectedAvailableItems;
end; {procedure, SelectOneClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardDualListPage.ItemSelected }

procedure TdaWizardDualListPage.ItemSelected(aItemIndex: Integer);
begin

end; {procedure, ItemSelected}

{******************************************************************************
 *
 ** W I Z A R D   T A B L E   P A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.CreateControls }

procedure TdaWizardTablePage.CreateControls;
begin

  inherited CreateControls;

  MoveSelectedItems := not(SQL.AllowSelfJoin);
  
  ppDrawMetaBitmap(TdaSelectTablesBitmap, Image.Picture.Bitmap);
  Title.Caption := ppLoadStr(822); {Select the tables that you want to query.}
  AvailableLabel.Caption := ppLoadStr(728); {Available Tables}
  SelectedLabel.Caption := ppLoadStr(824); {Selected Tables}

  AvailableList.MultiSelect := False;
  SelectedList.MultiSelect := False;

  if (SQL.AllowManualJoins) then
    begin
      SelectedList.Height := 172;

      FbtnJoin := TButton.Create(Self);
      FbtnJoin.Parent := ListPanel;
      FbtnJoin.Enabled := False;
      FbtnJoin.Caption := ppLoadStr(778);
      FbtnJoin.Left := 337;
      FbtnJoin.Top := 194;
      FbtnJoin.Height := 23;
      FbtnJoin.Width := 75;
      FbtnJoin.OnClick := JoinClickEvent;
    end
  else
    FbtnJoin := nil;

  AvailableList.Style := lbOwnerDrawFixed;
  AvailableList.OnDrawItem := AvailableListDrawItemEvent; 
  
end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.AvailableListDrawItemEvent }

procedure TdaWizardTablePage.AvailableListDrawItemEvent(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  lbJoinable: Boolean;
begin

  if (Index >= FSQL.AvailableSelectTableCount) then
    lbJoinable := True
  else
    lbJoinable := TdaTable(FSQL.AvailableSelectTables[Index]).Joinable;

  if (odSelected in State) then
    begin
      if (lbJoinable) then
        AvailableList.Canvas.Font.Color := clHighlightText
      else
        AvailableList.Canvas.Font.Color := clBtnFace
    end

  else if (lbJoinable) then
    AvailableList.Canvas.Font.Color := clWindowText
  else
    AvailableList.Canvas.Font.Color := clBtnFace;

  AvailableList.Canvas.TextRect(Rect, Rect.Left, Rect.Top, AvailableList.Items[Index]);
  
end; {procedure, AvailableListDrawItemEvent}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.OutOfSync }

function TdaWizardTablePage.OutOfSync: Boolean;
begin
  Result := FSQL.TablesOutOfSync;
end; {procedure, OutOfSync}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.Valid }

function TdaWizardTablePage.Valid: Boolean;
begin
  Result := (FSQL.SelectTableCount > 0);
end; {procedure, Valid}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.GetAvailableChild }

function TdaWizardTablePage.GetAvailableChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.AvailableSelectTables[aIndex];
end; {procedure, GetAvailableChild}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.GetAvailableChildCount }

function TdaWizardTablePage.GetAvailableChildCount: Integer;
begin
  Result := SQL.AvailableSelectTableCount;
end; {procedure, GetAvailableChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.GetSelectedChild }

function TdaWizardTablePage.GetSelectedChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.SelectTables[aIndex];
end; {procedure, GetSelectedChild}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.GetSelectedChildCount }

function TdaWizardTablePage.GetSelectedChildCount: Integer;
begin
  Result := SQL.SelectTableCount;
end; {procedure, GetSelectedChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.ChildToAvailableItem }

procedure TdaWizardTablePage.ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer);
begin
  FAvailableList.Items[aAvailableIndex] := TdaTable(aChild).TableAlias;
end; {function, ChildToAvailableItem}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.ChildToSelectedItem }

procedure TdaWizardTablePage.ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer);
begin
  FSelectedList.Items[aSelectedIndex] := TdaTable(aChild).TableAlias;
end; {procedure, ChildToSelectedItem}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.SelectItem }

function TdaWizardTablePage.SelectItem(aAvailableIndex: Integer): TdaChild;
var
  liJoinIndex: Integer;
  lTable: TdaTable;
begin

  Result := nil;
  
  lTable := SQL.AvailableSelectTables[aAvailableIndex];

  if not(lTable.Joinable) then Exit;

  liJoinIndex := lTable.IndexOfFirstJoinTable(SQL);

  Result := SQL.SelectTable(aAvailableIndex, liJoinIndex);

end; {function, SelectItem}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.DeselectItem }

function TdaWizardTablePage.DeselectItem(aSelectedIndex: Integer): TdaChild;
begin
  Result := SQL.DeselectTable(aSelectedIndex);

  if (Result <> nil) then
    SQLToControls;
end; {procedure, DeselectItem}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.ItemSelected }

procedure TdaWizardTablePage.ItemSelected(aItemIndex: Integer);
begin
  if (FbtnJoin <> nil) then
    FbtnJoin.Enabled := (SQL.SelectTables[aItemIndex].TableJoinCount > 0);
end; {procedure, ItemSelected}

{------------------------------------------------------------------------------}
{ TdaWizardTablePage.JoinClickEvent }

procedure TdaWizardTablePage.JoinClickEvent(Sender: TObject);
var
  lsTable1: String;
  lsTable2: String;
  lTable: TdaTable;
  liIndex: Integer;
begin

  if (SQL.SelectTableCount < 2) then Exit;

  liIndex := FSelectedList.ItemIndex;

  if (liIndex = -1) then Exit;

  lTable := SQL.SelectTables[liIndex];

  if (lTable.TableJoinCount = 0) then Exit;

  lsTable1 := lTable.TableJoins[0].ForeignField.TableSQLAlias;
  lsTable2 := lTable.SQLAlias;

  SQL.EditTableJoin(lsTable1, lsTable2);

end; {procedure, JoinClickEvent}

{******************************************************************************
 *
 ** W I Z A R D   F I E L D   P A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.CreatePage }

constructor TdaWizardFieldPage.CreatePage(aOwner: TComponent; aPageControl: TPageControl);
begin

  inherited CreatePage(aOwner, aPageControl);

  FControlOptions := [dacoSelectAllButtons, dacoRadioGroup, dacoOrderButtons];

end; {constructor, CreatePage}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.CreateControls }

procedure TdaWizardFieldPage.CreateControls;
begin

  inherited CreateControls;

  ppDrawMetaBitmap(TdaSelectFieldsBitmap, Image.Picture.Bitmap);
  Title.Caption := ppLoadStr(821); {Select the fields for the query.}
  AvailableLabel.Caption := ppLoadStr(727); {Available Fields}
  SelectedLabel.Caption := ppLoadStr(823); {Selected Fields}
  RadioGroup.Items[0] := ppLoadStr(718); {All Fields}
  RadioGroup.Items[1] := ppLoadStr(739); {Choose Fields}

  SetRadioGroupIndex := False;

end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.SQLToControls }

procedure TdaWizardFieldPage.SQLToControls;
begin

  inherited SQLToControls;

  if not(Initialized) then
    RadioGroup.ItemIndex := 0

  else
    begin
      if (SQL.AvailableSelectFieldCount = 0) then
        RadioGroup.ItemIndex := 0
      else
        RadioGroup.ItemIndex := 1;
    end;

end; {procedure, SQLToControls}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.OutOfSync }

function TdaWizardFieldPage.OutOfSync: Boolean;
begin
  Result := True;
end; {procedure, OutOfSync}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.Valid }

function TdaWizardFieldPage.Valid: Boolean;
begin
  Result := True;
end; {procedure, Valid}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.GetAvailableChild }

function TdaWizardFieldPage.GetAvailableChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.AvailableSelectFields[aIndex];
end; {procedure, GetAvailableChild}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.GetAvailableChildCount }

function TdaWizardFieldPage.GetAvailableChildCount: Integer;
begin
  Result := SQL.AvailableSelectFieldCount;
end; {procedure, GetAvailableChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.GetSelectedChild }

function TdaWizardFieldPage.GetSelectedChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.SelectFields[aIndex];
end; {procedure, GetSelectedChild}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.GetSelectedChildCount }

function TdaWizardFieldPage.GetSelectedChildCount: Integer;
begin
  Result := SQL.SelectFieldCount;
end; {procedure, GetSelectedChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.ChildToAvailableItem }

procedure TdaWizardFieldPage.ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer);
begin
  FAvailableList.Items[aAvailableIndex] := TdaField(aChild).Description;
end; {function, ChildToAvailableItem}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.ChildToSelectedItem }

procedure TdaWizardFieldPage.ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer);
begin
  FSelectedList.Items[aSelectedIndex] := TdaField(aChild).Alias;
end; {procedure, ChildToSelectedItem}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.SelectItem }

function TdaWizardFieldPage.SelectItem(aAvailableIndex: Integer): TdaChild;
begin
  Result := FSQL.SelectField(aAvailableIndex);
end; {function, SelectItem}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.DeselectItem }

function TdaWizardFieldPage.DeselectItem(aSelectedIndex: Integer): TdaChild;
begin
  Result := FSQL.DeselectField(aSelectedIndex);
end; {procedure, DeselectItem}

{------------------------------------------------------------------------------}
{ TdaWizardFieldPage.RadioGroupClickEvent }

procedure TdaWizardFieldPage.RadioGroupClickEvent(Sender: TObject);
begin

  inherited RadioGroupClickEvent(Sender);

  if (RadioGroup.ItemIndex = 0) then
    SelectAllItems
  else
    DeselectAllItems;

end; {procedure, RadioGroupClickEvent}

{******************************************************************************
 *
 ** W I Z A R D   C A L C   P A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.CreatePage }

constructor TdaWizardCalcPage.CreatePage(aOwner: TComponent; aPageControl: TPageControl);
begin

  inherited CreatePage(aOwner, aPageControl);

  FControlOptions := [dacoRadioGroup, dacoOrderButtons];

end; {constructor, CreatePage}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.CreateControls }

procedure TdaWizardCalcPage.CreateControls;
var
  liCalc: Integer;
begin

  inherited CreateControls;

  ppDrawMetaBitmap(TdaGroupFieldsBitmap, Image.Picture.Bitmap);
  Title.Caption := ppLoadStr(714); {Add calculated fields to the query.}
  AvailableLabel.Caption := ppLoadStr(727); {Available Fields}
  SelectedLabel.Caption := ppLoadStr(823); {Selected Fields}
  RadioGroup.Items[0] := ppLoadStr(792); {No Calculations}
  RadioGroup.Items[1] := ppLoadStr(715); {Add Calculations}

  AvailableList.MultiSelect := False;

  MoveSelectedItems := False;

  FFunctionDialog := TdaFunctionDialog.Create(Self);

  FFunctionDialog.cbxFunctions.Items.Clear;

  for liCalc := Ord(dacaAvg) to Ord(dacaSum) do
    FFunctionDialog.cbxFunctions.Items.Add(daGetCalcDesc(TdaCalcType(liCalc)));

  FSelectedList.Height := 121;

  FbtnFunction := TButton.Create(Self);
  FbtnFunction.Parent := ListPanel;
  FbtnFunction.Caption := ppLoadStr(766); {Function}
  FbtnFunction.Left := 314;
  FbtnFunction.Top := 145;
  FbtnFunction.Height := 23;
  FbtnFunction.Width := 75;
  FbtnFunction.OnClick := FunctionClickEvent;

end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.OutOfSync }

function TdaWizardCalcPage.OutOfSync: Boolean;
begin
  Result := FSQL.CalcFieldsOutOfSync;
end; {procedure, OutOfSync}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.Valid }

function TdaWizardCalcPage.Valid: Boolean;
begin
  Result := True;
end; {procedure, Valid}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.GetAvailableChild }

function TdaWizardCalcPage.GetAvailableChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.AvailableCalcFields[aIndex];
end; {procedure, GetAvailableChild}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.GetAvailableChildCount }

function TdaWizardCalcPage.GetAvailableChildCount: Integer;
begin
  Result := SQL.AvailableCalcFieldCount;
end; {procedure, GetAvailableChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.GetSelectedChild }

function TdaWizardCalcPage.GetSelectedChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.CalcFields[aIndex];
end; {procedure, GetSelectedChild}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.GetSelectedChildCount }

function TdaWizardCalcPage.GetSelectedChildCount: Integer;
begin
  Result := SQL.CalcFieldCount;
end; {procedure, GetSelectedChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.ChildToAvailableItem }

procedure TdaWizardCalcPage.ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer);
begin
  FAvailableList.Items[aAvailableIndex] := TdaField(aChild).Description;
end; {function, ChildToAvailableItem}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.ChildToSelectedItem }

procedure TdaWizardCalcPage.ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer);
begin
  FSelectedList.Items[aSelectedIndex] := TdaField(aChild).Alias;
end; {procedure, ChildToSelectedItem}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.GetMatchingCalcFieldIndex }

function TdaWizardCalcPage.GetMatchingCalcFieldIndex: Integer;
var
  lList: TStrings;
  liIndex: Integer;
  lField: TdaField;
  lCurrentField: TdaField;
  lbFound: Boolean;
begin

  Result := 0;

  if (FAvailableList.ItemIndex = -1) then Exit;

  lList := FFunctionDialog.cbxAvailableFields.Items;
  liIndex := 0;
  lbFound := False;
  lField := SQL.AvailableCalcFields[FAvailableList.ItemIndex];

  while not(lbFound) and (liIndex < lList.Count) do
    begin
      lCurrentField := TdaField(lList.Objects[liIndex]);

      if (CompareText(lField.FieldName, lCurrentField.FieldName) = 0) and
         (CompareText(lField.TableName, lCurrentField.TableName) = 0) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  if (lbFound) then
    Result := liIndex;

end; {procedure, GetMatchingCalcFieldIndex}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.SelectItem }

function TdaWizardCalcPage.SelectItem(aAvailableIndex: Integer): TdaChild;
var
  lList: TStrings;
  liIndex: Integer;
  lField: TdaField;
  lCalc: TdaCalculation;
  lsCaption: String;
  lsMessage: String;
begin

  Result := nil;

  SQL.AvailableCalcFieldList(FFunctionDialog.cbxAvailableFields.Items);

  if (FFunctionDialog.cbxAvailableFields.Items.Count = 0) then
    begin
      lsCaption := ppLoadStr(811); {Query Wizard}

      {Unable to create calculated field:}
      {There are no numeric fields on which to base calculations}
      lsMessage := 'Unable to create calculated field.' + #13#10 + #13#10 +
                   'There are no numeric fields on which to base calculations.';

      ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);

      Exit;
    end;

  FFunctionDialog.cbxFunctions.ItemIndex := Ord(dacaSum);
  FFunctionDialog.cbxAvailableFields.ItemIndex := GetMatchingCalcFieldIndex;

  if (FFunctionDialog.ShowModal = mrOK) then
    begin
      lList := FFunctionDialog.cbxAvailableFields.Items;

      if (lList.Count > 0) then
        begin
          liIndex := FFunctionDialog.cbxAvailableFields.ItemIndex;
          lField := TdaField(lList.Objects[liIndex]);
          liIndex := lField.Tag;
        end
      else
        liIndex := 0;

      lCalc := TdaCalculation(FSQL.SelectCalcField(liIndex));

      lCalc.CalcType := TdaCalcType(FFunctionDialog.cbxFunctions.ItemIndex);

      lCalc.Alias := lCalc.CalcFieldAlias;

      FSQL.ValidateFieldAlias(lCalc, True);

      Result := lCalc;
    end
  else
    Result := nil;

end; {function, SelectItem}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.DeselectItem }

function TdaWizardCalcPage.DeselectItem(aSelectedIndex: Integer): TdaChild;
begin
  Result := FSQL.DeselectCalcField(aSelectedIndex);
end; {procedure, DeselectItem}

{------------------------------------------------------------------------------}
{ TdaWizardCalcPage.FunctionClickEvent }

procedure TdaWizardCalcPage.FunctionClickEvent(Sender: TObject);
var
  liSelectedIndex: Integer;
  lCalc: TdaCalculation;
  liIndex: Integer;
  lAvailableField: TdaField;
  lList: TStrings;
begin

  liSelectedIndex := FSelectedList.ItemIndex;

  if (liSelectedIndex = -1) or (SQL.CalcFieldCount = 0) then Exit;

  lCalc := SQL.CalcFields[liSelectedIndex];

  SQL.AvailableCalcFieldList(FFunctionDialog.cbxAvailableFields.Items);

  liIndex := daFindFieldInStrings(lCalc, FFunctionDialog.cbxAvailableFields.Items);

  if (liIndex <> -1) then
    FFunctionDialog.cbxAvailableFields.ItemIndex := liIndex
  else
    FFunctionDialog.cbxAvailableFields.ItemIndex := 0;

  FFunctionDialog.cbxFunctions.ItemIndex := Ord(lCalc.CalcType);

  if (FFunctionDialog.ShowModal = mrOK) then
    begin
      lList := FFunctionDialog.cbxAvailableFields.Items;
      liIndex := FFunctionDialog.cbxAvailableFields.ItemIndex;

      if (lList.Count > 0) then
        begin
          lAvailableField := TdaField(lList.Objects[liIndex]);

          lCalc.Assign(lAvailableField);
        end;

      lCalc.CalcType := TdaCalcType(FFunctionDialog.cbxFunctions.ItemIndex);

      lCalc.Alias := lCalc.CalcFieldAlias;

      SQL.ValidateFieldAlias(lCalc, True);

      SQL.SyncOrderByFieldsWithCalcFields;

      ChildToSelectedItem(lCalc, liSelectedIndex);
    end;

end; {procedure, FunctionClickEvent}

{******************************************************************************
 *
 ** W I Z A R D   G R O U P   P A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.CreatePage }

constructor TdaWizardGroupPage.CreatePage(aOwner: TComponent; aPageControl: TPageControl);
begin

  inherited CreatePage(aOwner, aPageControl);

  FControlOptions := [dacoSelectAllButtons, dacoRadioGroup, dacoOrderButtons];
  FRadioGroupClicked := False;

  SetRadioGroupIndex := False;
  
end; {constructor, CreatePage}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.CreateControls }

procedure TdaWizardGroupPage.CreateControls;
begin

  inherited CreateControls;

  ppDrawMetaBitmap(TdaGroupFieldsBitmap, Image.Picture.Bitmap);
  Title.Caption := ppLoadStr(770); {Group rows together based on common field values.}
  AvailableLabel.Caption := ppLoadStr(727); {Available Fields}
  SelectedLabel.Caption := ppLoadStr(823); {Selected Fields}
  RadioGroup.Items[0] := ppLoadStr(793); {No Grouping}
  RadioGroup.Items[1] := ppLoadStr(820); {Select Group Fields}

  FDeselectionFailed := False;

end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.SQLToControls }

procedure TdaWizardGroupPage.SQLToControls;
begin

  inherited SQLToControls;

  if FRadioGroupClicked then Exit;

  if (SQL.GroupByFieldCount = 0) and not(SQL.HasAggregates) then
    RadioGroup.ItemIndex := 0
  else
    RadioGroup.ItemIndex := 1;

end; {procedure, SQLToControls}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.OutOfSync }

function TdaWizardGroupPage.OutOfSync: Boolean;
begin
  Result := FSQL.GroupByFieldsOutOfSync;
end; {procedure, OutOfSync}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.Valid }

function TdaWizardGroupPage.Valid: Boolean;
var
  lsCaption: String;
  lsMessage: String;
begin

  Result := True;

  if (SQL.CalcFieldCount > 0) and (SQL.GroupByFieldCount = 0) then
    begin
      lsCaption := ppLoadStr(811); {Query Wizard}

      {At least one group field must be selected....}
      lsMessage := ppLoadStr(726) + #13#10 + #13#10 + ppLoadStr(722);

      ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);

      Result := False;
    end;
    
end; {procedure, Valid}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.GetAvailableChild }

function TdaWizardGroupPage.GetAvailableChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.AvailableGroupByFields[aIndex];
end; {procedure, GetAvailableChild}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.GetAvailableChildCount }

function TdaWizardGroupPage.GetAvailableChildCount: Integer;
begin
  Result := SQL.AvailableGroupByFieldCount;
end; {procedure, GetAvailableChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.GetSelectedChild }

function TdaWizardGroupPage.GetSelectedChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.GroupByFields[aIndex];
end; {procedure, GetSelectedChild}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.GetSelectedChildCount }

function TdaWizardGroupPage.GetSelectedChildCount: Integer;
begin
  Result := SQL.GroupByFieldCount;
end; {procedure, GetSelectedChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.ChildToAvailableItem }

procedure TdaWizardGroupPage.ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer);
begin
  FAvailableList.Items[aAvailableIndex] := TdaField(aChild).Description;
end; {function, ChildToAvailableItem}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.ChildToSelectedItem }

procedure TdaWizardGroupPage.ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer);
begin
  FSelectedList.Items[aSelectedIndex] := TdaField(aChild).Description;
end; {procedure, ChildToSelectedItem}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.SelectItem }

function TdaWizardGroupPage.SelectItem(aAvailableIndex: Integer): TdaChild;
begin
  Result := FSQL.SelectGroupByField(aAvailableIndex);
end; {function, SelectItem}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.DeselectItem }

function TdaWizardGroupPage.DeselectItem(aSelectedIndex: Integer): TdaChild;
begin

  Result := FSQL.DeselectGroupByField(aSelectedIndex);

  if (Result = nil) then
    FDeselectionFailed := True;

  {is this last group field which failed deselection?}
  if FDeselectionFailed and (aSelectedIndex = Integer(FSelectionList[FSelectionList.Count - 1])) then
    begin
      FDeselectionFailed := False;

      DisplayGroupFieldsMessage;
    end;

end; {procedure, DeselectItem}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.RadioGroupClickEvent }

procedure TdaWizardGroupPage.RadioGroupClickEvent(Sender: TObject);
begin

  if FRadioGroupClicked then Exit;

  FListPanel.Visible := (FRadioGroup.ItemIndex = 1);

  if (SettingControls) then Exit;

  FRadioGroupClicked := True;

  {clear all groups}
  if (RadioGroup.ItemIndex = 0) then
    begin

      {if calcs exist, groups cannot be cleared}
      if (SQL.HasAggregates) then
        begin
          if (Initialized) then 
            DisplayCalcGroupsMessage;

          FSettingControls := True;

          RadioGroup.ItemIndex := 1;

          FSettingControls := False;
        end
      else
        begin
          SQL.ClearGroupByFields;

          SQLToControls;
        end;

    end

  else if (RadioGroup.ItemIndex = 1) then
    begin
      if (SQL.SelectFieldCount > 0) then
        SQL.SyncGroupByFieldsWithSelectFields;

      Exclude(FControlOptions, dacoRadioGroup);

      SQLToControls;

      Include(FControlOptions, dacoRadioGroup);
    end;

  ListPanel.Visible := (RadioGroup.ItemIndex = 1);

  FRadioGroupClicked := False;

end; {procedure, RadioGroupClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.DisplayGroupFieldsMessage }

procedure TdaWizardGroupPage.DisplayGroupFieldsMessage;
var
  lsCaption: String;
  lsMessage: String;
begin

  lsCaption := ppLoadStr(811); {Query Wizard}

  {Group field(s) cannot be removed....}
  lsMessage := ppLoadStr(768) + #13#10 + #13#10 + ppLoadStr(723);

  ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);

end; {procedure, DisplayGroupFieldsMessage}

{------------------------------------------------------------------------------}
{ TdaWizardGroupPage.DisplayCalcGroupsMessage }

procedure TdaWizardGroupPage.DisplayCalcGroupsMessage;
var
  lsCaption: String;
  lsMessage: String;
begin

  lsCaption := ppLoadStr(811); {Query Wizard}

  {Group field(s) cannot be removed....}
  lsMessage := ppLoadStr(768) + #13#10 + #13#10 + ppLoadStr(721);

  ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);

end; {procedure, DisplayCalcGroupsMessage}

{******************************************************************************
 *
 ** W I Z A R D   S E A R C H   P A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.CreatePage }

constructor TdaWizardSearchPage.CreatePage(aOwner: TComponent; aPageControl: TPageControl);
begin

  inherited CreatePage(aOwner, aPageControl);

  FControlOptions := [dacoRadioGroup, dacoOrderButtons];

end; {constructor, CreatePage}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.CreateControls }

procedure TdaWizardSearchPage.CreateControls;
var
  lPopupMenu: TPopupMenu;
  lMenuItem: TMenuItem;
  liOperator: Integer;
begin

  inherited CreateControls;

  ppDrawMetaBitmap(TdaSearchCriteriaBitmap, Image.Picture.Bitmap);
  {Limit the rows returned....}
  Title.Caption := ppLoadStr(786) + #13#10 + #13#10 + #13#10 + ppLoadStr(816);

  FCriteriaDialog := TdaCriteriaDialog.Create(Self);

  FCriteriaDialog.cbxOperators.Items.Clear;

  for liOperator := Ord(dacoEqual) to Ord(dacoNotBlank) do
    FCriteriaDialog.cbxOperators.Items.Add(daGetOperatorDesc(TdaCriteriaOperatorType(liOperator)));

  RadioGroup.Items[0] := ppLoadStr(719); {All Rows}
  RadioGroup.Items[1] := ppLoadStr(749); {Define Search Criteria}

  AvailableLabel.Visible := False;
  AvailableList.Visible := False;
  AvailableBevel.Visible := False;

  SelectButton.Visible := False;
  DeselectButton.Visible := False;

  SelectedLabel.Caption := ppLoadStr(741); {Criteria}
  SelectedLabel.Left := 16;

  SelectedBevel.Left := 8;
  SelectedBevel.Width := 470;

  FCriteriaList := SelectedList;

  FCriteriaList.Left := 16;
  FCriteriaList.Width := 416;

  FCriteriaList.Style := lbOwnerDrawFixed;
  FCriteriaList.OnDrawItem := CriteriaDrawItemEvent;

  lPopupMenu := TPopupMenu.Create(Self);


  lMenuItem := TMenuItem.Create(Self);
  lMenuItem.Caption := ppLoadStr(774); {Insert Criteria}
  lMenuItem.OnClick := InsertCriteriaClickEvent;
  lPopupMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(Self);
  lMenuItem.Caption := ppLoadStr(776); {Insert OR}
  lMenuItem.OnClick := InsertORClickEvent;
  lPopupMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(Self);
  lMenuItem.Caption := ppLoadStr(775); {Insert NOT};
  lMenuItem.OnClick := InsertNOTClickEvent;
  lPopupMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(Self);
  lMenuItem.Caption := '-';
  lPopupMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(Self);
  lMenuItem.Caption := ppLoadStr(756); {Edit Criteria}
  lMenuItem.OnClick := SelectedDblClickEvent;
  lPopupMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(Self);
  lMenuItem.Caption := '-';
  lPopupMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(Self);
  lMenuItem.Caption := ppLoadStr(813); {Remove}
  lMenuItem.OnClick := RemoveCriteriaClickEvent;
  lPopupMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(Self);
  lMenuItem.Caption := '-';
  lPopupMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(Self);
  lMenuItem.Caption := ppLoadStr(716); {Add Parentheses}
  lMenuItem.OnClick := AddParenthesesClickEvent;
  lPopupMenu.Items.Add(lMenuItem);

  lMenuItem := TMenuItem.Create(Self);
  lMenuItem.Caption := ppLoadStr(814); {Remove Parentheses}
  lMenuItem.OnClick := RemoveParenthesesClickEvent;
  lPopupMenu.Items.Add(lMenuItem);


  FCriteriaList.PopupMenu := lPopupMenu;
  
end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.MoveDownClickEvent }

procedure TdaWizardSearchPage.MoveDownClickEvent(Sender: TObject);
var
  liIndex: Integer;
begin

  for liIndex := 0 to FSelectedList.Items.Count - 1 do
    if FSelectedList.Selected[liIndex] and (SQL.Criteria[liIndex].CriteriaType in [dacrBegin, dacrEnd]) then
      FSelectedList.Selected[liIndex] := False;

  inherited MoveDownClickEvent(Sender);

  SQL.ResetCriteriaLevels;

  FSelectedList.Refresh;

end; {procedure, MoveDownClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.MoveUpClickEvent }

procedure TdaWizardSearchPage.MoveUpClickEvent(Sender: TObject);
var
  liIndex: Integer;
begin

  for liIndex := 0 to FSelectedList.Items.Count - 1 do
    if FSelectedList.Selected[liIndex] and (SQL.Criteria[liIndex].CriteriaType in [dacrBegin, dacrEnd]) then
      FSelectedList.Selected[liIndex] := False;

  inherited MoveUpClickEvent(Sender);

  SQL.ResetCriteriaLevels;

  FSelectedList.Refresh;

end; {procedure, MoveUpClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.SelectedDblClickEvent }

procedure TdaWizardSearchPage.SelectedDblClickEvent(Sender: TObject);
var
  lList: TStrings;
  liIndex: Integer;
  lCriteria: TdaCriteria;
  lField: TdaField;
  lAvailableField: TdaField;
  liItem: Integer;
begin

  if (FSelectionList.Count > 1) or (FSelectionList.Count = 0) then Exit;

  liItem := Integer(FSelectionList[0]);

  lCriteria := SQL.Criteria[liItem];

  if (lCriteria.CriteriaType <> dacrField) then Exit;

  SQL.AvailableCriteriaList(FCriteriaDialog.cbxAvailableFields.Items);
  FCriteriaDialog.cbxAvailableFields.ItemIndex := daFindFieldInStrings(lCriteria.Field, FCriteriaDialog.cbxAvailableFields.Items);
  FCriteriaDialog.cbxOperators.ItemIndex := Ord(lCriteria.Operator);

  if (FCriteriaDialog.ShowModal = mrOK) then
    begin
      lList := FCriteriaDialog.cbxAvailableFields.Items;
      liIndex := FCriteriaDialog.cbxAvailableFields.ItemIndex;

      if (lList.Count > 0) and (liIndex <> -1) then
        begin
          liIndex := FCriteriaDialog.cbxAvailableFields.ItemIndex;
          lAvailableField := TdaField(lList.Objects[liIndex]);

          lField := TdaField.Create(Self);
          lField.Assign(lAvailableField);
          lField.Parent := lCriteria;

          lCriteria.Operator := TdaCriteriaOperatorType(FCriteriaDialog.cbxOperators.ItemIndex);
          lCriteria.Value := FCriteriaDialog.edtValue.Text;

          ChildToSelectedItem(lCriteria, liItem);
        end;
    end;
    
end; {procedure, SelectedDblClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.CriteriaDrawItemEvent }

procedure TdaWizardSearchPage.CriteriaDrawItemEvent(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  liX: Integer;
  liMargin: Integer;
  lCanvas: TCanvas;
  lColor: TColor;
  lCriteria: TdaCriteria;
begin

  if (Index < 0) then Exit;

  lCanvas := TListBox(Control).Canvas;
  lColor := TListBox(Control).Color;
  lCriteria := SQL.Criteria[Index];

  if (odSelected in State) then
    begin
      lCanvas.Brush.Color := clHighlight;
      lCanvas.Font.Color := clHighlightText;

      lCanvas.FillRect(Rect);
    end

  else
    begin
      lCanvas.Brush.Color := lColor;

      lCanvas.FillRect(Rect);
    end;

  liMargin := 2;
  liX := Rect.Left + liMargin + (lCriteria.Level * 20);

  {if selected, font is always highlight color}
  if (odSelected in State) then
    lCanvas.Font.Color := clHighlightText;

  {draw the text}
  lCanvas.TextOut(liX, Rect.Top, lCriteria.Description);

  if odFocused in State then
    lCanvas.DrawFocusRect(Rect);

end; {procedure, CriteriaDrawItemEvent}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.SQLToControls }

procedure TdaWizardSearchPage.SQLToControls;
begin

  inherited SQLToControls;
  
end; {procedure, SQLToControls}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.OutOfSync }

function TdaWizardSearchPage.OutOfSync: Boolean;
begin
  Result := FSQL.CriteriaOutOfSync;
end; {procedure, OutOfSync}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.Valid }

function TdaWizardSearchPage.Valid: Boolean;
begin
  Result := True;
end; {procedure, Valid}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.GetAvailableChild }

function TdaWizardSearchPage.GetAvailableChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.AvailableCriteria[aIndex];
end; {procedure, GetAvailableChild}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.GetAvailableChildCount }

function TdaWizardSearchPage.GetAvailableChildCount: Integer;
begin
  Result := SQL.AvailableCriteriaCount;
end; {procedure, GetAvailableChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.GetSelectedChild }

function TdaWizardSearchPage.GetSelectedChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.Criteria[aIndex];
end; {procedure, GetSelectedChild}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.GetSelectedChildCount }

function TdaWizardSearchPage.GetSelectedChildCount: Integer;
begin
  Result := SQL.CriteriaCount;
end; {procedure, GetSelectedChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.ChildToAvailableItem }

procedure TdaWizardSearchPage.ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer);
begin
  FAvailableList.Items[aAvailableIndex] := TdaField(aChild).Description;
end; {function, ChildToAvailableItem}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.ChildToSelectedItem }

procedure TdaWizardSearchPage.ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer);
begin
  FSelectedList.Items[aSelectedIndex] := TdaCriteria(aChild).Description;
end; {procedure, ChildToSelectedItem}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.SelectItem }

function TdaWizardSearchPage.SelectItem(aAvailableIndex: Integer): TdaChild;
begin
  {Result := FSQL.SelectCriteria(aAvailableIndex);}
  Result := nil;
end; {function, SelectItem}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.DeselectItem }

function TdaWizardSearchPage.DeselectItem(aSelectedIndex: Integer): TdaChild;
begin
  {Result := FSQL.DeselectCriteria(aSelectedIndex);}
  Result := nil;
end; {procedure, DeselectItem}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.ItemSelected }

procedure TdaWizardSearchPage.ItemSelected(aItemIndex: Integer);
var
  liIndex: Integer;
  liItem: Integer;
begin

  {build selection list}
  FSelectionList.Clear;

  liItem := FSelectedList.ItemIndex;

  if (FSelectedList.SelCount = 1) then
    FSelectionList.Add(TObject(liItem))

  else
    begin

      for liIndex := 0 to FSelectedList.Items.Count - 1 do
        if FSelectedList.Selected[liIndex] then
          FSelectionList.Add(TObject(liIndex));

    end;

end; {procedure, ItemSelected}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.InsertCriteriaClickEvent }

procedure TdaWizardSearchPage.InsertCriteriaClickEvent(Sender: TObject);
var
  lList: TStrings;
  liIndex: Integer;
  lCriteria: TdaCriteria;
  lField: TdaField;
  lAvailableField: TdaField;
  liItem: Integer;
begin

  if (FSelectionList.Count > 0) then
    liItem := Integer(FSelectionList[0])
  else
    liItem := 0;

  SQL.AvailableCriteriaList(FCriteriaDialog.cbxAvailableFields.Items);
  FCriteriaDialog.cbxAvailableFields.ItemIndex := 0;
  FCriteriaDialog.cbxOperators.ItemIndex := Ord(dacoEqual);

  if (FCriteriaDialog.ShowModal = mrOK) then
    begin
      lList := FCriteriaDialog.cbxAvailableFields.Items;
      liIndex := FCriteriaDialog.cbxAvailableFields.ItemIndex;

      if (lList.Count > 0) and (liIndex <> -1) then
        begin
          lCriteria := SQL.InsertCriteria(liItem, dacrField);
          lCriteria.Operator := TdaCriteriaOperatorType(FCriteriaDialog.cbxOperators.ItemIndex);
          lCriteria.Value := FCriteriaDialog.edtValue.Text;

          liIndex := FCriteriaDialog.cbxAvailableFields.ItemIndex;
          lAvailableField := TdaField(lList.Objects[liIndex]);

          lField := TdaField.Create(SQL);
          lField.Assign(lAvailableField);
          lField.Parent := lCriteria;

          SQLToControls;
        end;
    end;

end; {procedure, InsertCriteriaClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.RemoveCriteriaClickEvent }

procedure TdaWizardSearchPage.RemoveCriteriaClickEvent(Sender: TObject);
var
  liIndex: Integer;
  liOffset: Integer;
  liSelectedIndex: Integer;
begin

  liOffset := 0;

  for liIndex := 0 to FSelectionList.Count - 1 do
    begin
      liSelectedIndex := Integer(FSelectionList[liIndex]) - liOffset;

      if (SQL.DeselectCriteria(liSelectedIndex)) then
        Inc(liOffset);
    end;

  if (liOffset > 0) then
    SQLToControls;
    
end; {procedure, RemoveCriteriaClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.AddParenthesesClickEvent }

procedure TdaWizardSearchPage.AddParenthesesClickEvent(Sender: TObject);
begin
  if SQL.AddParentheses(FSelectionList) then
    SQLToControls;
end; {procedure, AddParenthesesClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.RemoveParenthesesClickEvent }

procedure TdaWizardSearchPage.RemoveParenthesesClickEvent(Sender: TObject);
begin
  if SQL.RemoveParentheses(FSelectionList) then
    SQLToControls;
end; {procedure, RemoveParenthesesClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.InsertORClickEvent }

procedure TdaWizardSearchPage.InsertORClickEvent(Sender: TObject);
var
  liItem: Integer;
begin

  if (FSelectionList.Count > 0) then
    liItem := Integer(FSelectionList[0])
  else
    liItem := 0;

  SQL.InsertCriteria(liItem, dacrOR);

  SQLToControls;

end; {procedure, InsertORClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardSearchPage.InsertNOTClickEvent }

procedure TdaWizardSearchPage.InsertNOTClickEvent(Sender: TObject);
var
  liItem: Integer;
begin

  if (FSelectionList.Count > 0) then
    liItem := Integer(FSelectionList[0])
  else
    liItem := 0;

  SQL.InsertCriteria(liItem, dacrNOT);

  SQLToControls;

end; {procedure, InsertNOTClickEvent}

{******************************************************************************
 *
 ** W I Z A R D   S O R T   P A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.CreatePage }

constructor TdaWizardSortPage.CreatePage(aOwner: TComponent; aPageControl: TPageControl);
begin

  inherited CreatePage(aOwner, aPageControl);

  FControlOptions := [dacoSelectAllButtons, dacoRadioGroup, dacoOrderButtons];

end; {constructor, CreatePage}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.CreateControls }

procedure TdaWizardSortPage.CreateControls;
begin

  inherited CreateControls;

  ppDrawMetaBitmap(TdaSortFieldsBitmap, Image.Picture.Bitmap);

  {Order the rows of the query based on field values.}
  Title.Caption := ppLoadStr(804);
  AvailableLabel.Caption := ppLoadStr(727); {Available Fields}
  SelectedLabel.Caption := ppLoadStr(823); {Selected Fields}
  RadioGroup.Items[0] := ppLoadStr(790); {Natural Order}
  RadioGroup.Items[1] := ppLoadStr(826); {Set Order}

  FSelectedList.Height := 126;

  FspbAscending := TSpeedButton.Create(Self);
  FspbAscending.Parent := ListPanel;
  FspbAscending.Left := 256;
  FspbAscending.Top := 145;
  FspbAscending.Height := 22;
  FspbAscending.Width := 23;
  FspbAscending.Glyph.Handle := ppBitmapFromResource('DASORTASC');

  FspbDescending := TSpeedButton.Create(Self);
  FspbDescending.Parent := ListPanel;
  FspbDescending.Left := 279;
  FspbDescending.Top := 145;
  FspbDescending.Height := 22;
  FspbDescending.Width := 23;
  FspbDescending.Glyph.Handle :=ppBitmapFromResource('DASORTDESC');

  FspbAscending.GroupIndex := 1;
  FspbDescending.GroupIndex := 1;

  FspbAscending.AllowAllUp := False;
  FspbDescending.AllowAllUp := False;

  FspbAscending.Down := True;

  FspbAscending.OnClick := AscendingClickEvent;
  FspbDescending.OnClick := DescendingClickEvent;

end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.OutOfSync }

function TdaWizardSortPage.OutOfSync: Boolean;
begin
  Result := FSQL.OrderByFieldsOutOfSync;
end; {procedure, OutOfSync}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.Valid }

function TdaWizardSortPage.Valid: Boolean;
begin
  Result := True;
end; {procedure, Valid}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.GetAvailableChild }

function TdaWizardSortPage.GetAvailableChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.AvailableOrderByFields[aIndex];
end; {procedure, GetAvailableChild}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.GetAvailableChildCount }

function TdaWizardSortPage.GetAvailableChildCount: Integer;
begin
  Result := SQL.AvailableOrderByFieldCount;
end; {procedure, GetAvailableChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.GetSelectedChild }

function TdaWizardSortPage.GetSelectedChild(aIndex: Integer): TdaChild;
begin
  Result := SQL.OrderByFields[aIndex];
end; {procedure, GetSelectedChild}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.GetSelectedChildCount }

function TdaWizardSortPage.GetSelectedChildCount: Integer;
begin
  Result := SQL.OrderByFieldCount;
end; {procedure, GetSelectedChildCount}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.ChildToAvailableItem }

procedure TdaWizardSortPage.ChildToAvailableItem(aChild: TdaChild; aAvailableIndex: Integer);
begin
  FAvailableList.Items[aAvailableIndex] := TdaField(aChild).Description;
end; {function, ChildToAvailableItem}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.ChildToSelectedItem }

procedure TdaWizardSortPage.ChildToSelectedItem(aChild: TdaChild; aSelectedIndex: Integer);
begin
  FSelectedList.Items[aSelectedIndex] := TdaField(aChild).Description;
end; {procedure, ChildToSelectedItem}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.SelectItem }

function TdaWizardSortPage.SelectItem(aAvailableIndex: Integer): TdaChild;
begin
  Result := FSQL.SelectOrderByField(aAvailableIndex);
end; {function, SelectItem}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.DeselectItem }

function TdaWizardSortPage.DeselectItem(aSelectedIndex: Integer): TdaChild;
begin
  Result := FSQL.DeselectOrderByField(aSelectedIndex);
end; {procedure, DeselectItem}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.ItemSelected }

procedure TdaWizardSortPage.ItemSelected(aItemIndex: Integer);
var
  lField: TdaField;
begin

  lField := SQL.OrderByFields[aItemIndex];

  if lField.Ascending then
    FspbAscending.Down := True
  else
    FspbDescending.Down := True;

end; {procedure, ItemSelected}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.AscendingClickEvent }

procedure TdaWizardSortPage.AscendingClickEvent(Sender: TObject);
var
  lField: TdaField;
begin

  if (FSelectedList.ItemIndex = -1) or (SQL.OrderByFieldCount = 0) then Exit;

  lField := SQL.OrderByFields[FSelectedList.ItemIndex];

  lField.Ascending := True;

  ChildToSelectedItem(lField, FSelectedList.ItemIndex);

end; {procedure, AscendingClickEvent}

{------------------------------------------------------------------------------}
{ TdaWizardSortPage.DescendingClickEvent }

procedure TdaWizardSortPage.DescendingClickEvent(Sender: TObject);
var
  lField: TdaField;
begin

  if (FSelectedList.ItemIndex = -1) or (SQL.OrderByFieldCount = 0) then Exit;

  lField := SQL.OrderByFields[FSelectedList.ItemIndex];

  lField.Ascending := False;

  ChildToSelectedItem(lField, FSelectedList.ItemIndex);

end; {procedure, DescendingClickEvent}

{******************************************************************************
 *
 ** W I Z A R D   F I N I S H   P A G E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaWizardFinishPage.CreateControls }

procedure TdaWizardFinishPage.CreateControls;
var
  lLabel: TLabel;
begin

  inherited CreateControls;

  Image.Picture.Bitmap.Handle := ppBitmapFromResource('DAFINISH');

  {You have finished defining your query...}
  Title.Caption := ppLoadStr(838) + #13#10 + #13#10 + #13#10 + ppLoadStr(805);

  lLabel := TLabel.Create(Self);
  lLabel.Parent := BasePanel;
  lLabel.AutoSize := False;
  lLabel.Left := 190;
  lLabel.Top := 195;
  lLabel.Height := 45;
  lLabel.Width := 271;
  lLabel.WordWrap := True;

  {Do you want to preview your query or modify your query's design?}
  lLabel.Caption := ppLoadStr(755);

  FrdbPreview := TRadioButton.Create(Self);
  FrdbPreview.Parent := BasePanel;
  FrdbPreview.Left := 190;
  FrdbPreview.Top := 233;
  FrdbPreview.Height := 17;
  FrdbPreview.Width := 303;
  FrdbPreview.Caption := ppLoadStr(809); {Preview the query}
  FrdbPreview.Checked := True;

  FNextAction := ppnaPreview;

  FrdbDesign := TRadioButton.Create(Self);
  FrdbDesign.Parent := BasePanel;
  FrdbDesign.Left := 190;
  FrdbDesign.Top := 252;
  FrdbDesign.Height := 17;
  FrdbDesign.Width := 303;
  FrdbDesign.Caption := ppLoadStr(789); {Modify the query's design}

  lLabel := TLabel.Create(Self);
  lLabel.Parent := BasePanel;
  lLabel.Caption := ppLoadStr(753); {Description}
  lLabel.Left := 190;
  lLabel.Top := 84;

  lLabel := TLabel.Create(Self);
  lLabel.Parent := BasePanel;
  lLabel.Caption := ppLoadStr(746); {Data Pipeline Name}
  lLabel.Left := 190;
  lLabel.Top := 134;

  FedtDescription := TEdit.Create(Self);
  FedtDescription.Parent := BasePanel;
  FedtDescription.Left := 190;
  FedtDescription.Top := 104;
  FedtDescription.Width := 225;
  FedtDescription.Height := 21;

  FedtDescription.OnChange := DescriptionChangeEvent;
  FedtDescription.OnKeyUp := DescriptionKeyUpEvent;

  FedtName := TEdit.Create(Self);
  FedtName.Parent := BasePanel;
  FedtName.Left := 190;
  FedtName.Top := 154;
  FedtName.Width := 225;
  FedtName.Height := 21;

  FedtName.OnChange := NameChangeEvent;

  FmemSQL := TMemo.Create(Self);
  FmemSQL.Parent := BasePanel;
  FmemSQL.Left := 0;
  FmemSQL.Top := 104;
  FmemSQL.Width := 180;
  FmemSQL.Height := 200;
  FmemSQL.ScrollBars := ssBoth;
  FmemSQL.Visible := False;

end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TdaWizardFinishPage.SQLToControls }

procedure TdaWizardFinishPage.SQLToControls;
begin

  FedtDescription.Text := SQL.Description;
  FedtName.Text := SQL.DataPipelineName;

  FmemSQL.Lines.Assign(SQL.SQLText);
  
end; {procedure, SQLToControls}

{------------------------------------------------------------------------------}
{ TdaWizardFinishPage.OutOfSync }

function TdaWizardFinishPage.OutOfSync: Boolean;
begin
  Result := True;
end; {procedure, OutOfSync}

{------------------------------------------------------------------------------}
{ TdaWizardFinishPage.Valid }

function TdaWizardFinishPage.Valid: Boolean;
begin

  Result := True;

  if (FrdbPreview.Checked) then
    FNextAction := ppnaPreview

  else if (FrdbDesign.Checked) then
    FNextAction := ppnaDesign;

end; {procedure, Valid}

{------------------------------------------------------------------------------}
{ TdaWizardFinishPage.DescriptionChangeEvent }

procedure TdaWizardFinishPage.DescriptionChangeEvent(Sender: TObject);
begin
  FSQL.Description := FedtDescription.Text;
end; {procedure, DescriptionChangeEvent}

{------------------------------------------------------------------------------}
{ TdaWizardFinishPage.NameChangeEvent }

procedure TdaWizardFinishPage.NameChangeEvent(Sender: TObject);
begin
  FSQL.DataPipelineName := FedtName.Text;
end; {procedure, NameChangeEvent}

{------------------------------------------------------------------------------}
{ TdaWizardFinishPage.DescriptionKeyUpEvent }

procedure TdaWizardFinishPage.DescriptionKeyUpEvent(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FedtName.Text := 'pl' + ppTextToIdentifier(FedtDescription.Text);
end; {procedure, DescriptionKeyUpEvent}



end.
