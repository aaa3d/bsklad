{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppRptExp;

interface

{$I ppIfDef.pas}

uses
  Classes, SysUtils, Forms, Controls, Graphics, Menus, Dialogs, ComCtrls,
  ppComm, ppDB, ppTypes, ppUtils, ppTmplat, ppEndUsr, ppClass, ppReport, ppForms;

type
  TppFolderOptionType = (foAllowNew, foAllowDelete, foAllowRename);
  TppItemOptionType = (ioAllowDesign, ioAllowNew, ioAllowDelete, ioAllowRename);
  TppItemActionType = (iaOpenToDesign, iaOpenToPreview);

  TppFolderOptions = set of TppFolderOptionType;
  TppItemOptions = set of TppItemOptionType;

const
  itAllFolders = 0;
  itReport = 1;
  itCode = 2;
  itData = 3;
  itFolder = 4;
  itRecycleBin = -2;
  cDefaultFolderOptions = [foAllowNew, foAllowDelete, foAllowRename];
  cDefaultItemOptions = [ioAllowDesign, ioAllowNew, ioAllowRename, ioAllowDelete];

type

  { TppFormWrapper }
  TppFormWrapper = class(TppCommunicator)
    private
      FFormCaption: String;
      FFormIcon: TIcon;
      FFormPosition: TPosition;
      FFormHeight: Integer;
      FFormLeft: Integer;
      FFormState: TWindowState;
      FFormStyle: TFormStyle;
      FFormTag: LongInt;
      FFormTop: Integer;
      FFormWidth: Integer;

      {events}
      FOnActivate: TNotifyEvent;
      FOnClose: TCloseEvent;
      FOnCreate: TNotifyEvent;
      FOnDeactivate: TNotifyEvent;
      FOnDestroy: TNotifyEvent;
      FOnCloseQuery: TCloseQueryEvent;
      FOnHide: TNotifyEvent;
      FOnResize: TNotifyEvent;
      FOnShow: TNotifyEvent;

      procedure FormCloseEvent(Sender: TObject; var Action: TCloseAction);
      procedure IconChange(Sender: TObject);
      function  GetFormHeight: Integer;
      function  GetFormLeft: Integer;
      function  GetFormStyle: TFormStyle;
      function  GetFormTop: Integer;
      function  GetFormWidth: Integer;
      function  GetFormState: TWindowState;
      function  GetFormTag: LongInt;
      procedure PropertiesToForm;
      procedure SetFormCaption(aCaption: String);
      procedure SetFormStyle(aFormStyle: TFormStyle);
      procedure SetFormHeight(aHeight: Integer);
      procedure SetFormIcon(aIcon: TIcon);
      procedure SetFormLeft(aLeft: Integer);
      procedure SetFormPosition(aPosition: TPosition);
      procedure SetFormTop(aTop: Integer);
      procedure SetFormWidth(aWidth: Integer);
      procedure SetFormState(aFormState: TWindowState);
      procedure SetFormTag(aTag: LongInt);

      {events}
      procedure SetOnActivate(aNotifyEvent: TNotifyEvent);
      procedure SetOnClose(aCloseEvent: TCloseEvent);
      procedure SetOnCloseQuery(aCloseQueryEvent: TCloseQueryEvent);
      procedure SetOnCreate(aNotifyEvent: TNotifyEvent);
      procedure SetOnDeactivate(aNotifyEvent: TNotifyEvent);
      procedure SetOnDestroy(aNotifyEvent: TNotifyEvent);
      procedure SetOnHide(aNotifyEvent: TNotifyEvent);
      procedure SetOnResize(aNotifyEvent: TNotifyEvent);
      procedure SetOnShow(aNotifyEvent: TNotifyEvent);

    protected
      function  GetForm: TForm; virtual; abstract;

      procedure AfterShowForm; virtual;
      function  BeforeShowForm: Boolean; virtual;

      {form wrapper properties}
      property FormCaption: String read FFormCaption write SetFormCaption;
      property Form: TForm read GetForm;
      property FormStyle: TFormStyle read GetFormStyle write SetFormStyle default fsNormal;
      property FormIcon: TIcon read FFormIcon write SetFormIcon;
      property FormPosition: TPosition read FFormPosition write SetFormPosition;
      property FormHeight: Integer read GetFormHeight write SetFormHeight;
      property FormLeft: Integer read GetFormLeft write SetFormLeft;
      property FormTag: LongInt read GetFormTag write SetFormTag default 0;
      property FormTop: Integer read GetFormTop write SetFormTop;
      property FormWidth: Integer read GetFormWidth write SetFormWidth;
      property FormState: TWindowState read GetFormState write SetFormState default wsNormal;

      {events}
      property OnActivate: TNotifyEvent read FOnActivate write SetOnActivate;
      property OnClose: TCloseEvent read FOnClose write SetOnClose;
      property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write SetOnCloseQuery;
      property OnCreate: TNotifyEvent read FOnCreate write SetOnCreate;
      property OnDeactivate: TNotifyEvent read FOnDeactivate write SetOnDeactivate;
      property OnDestroy: TNotifyEvent read FOnDestroy write SetOnDestroy;
      property OnHide: TNotifyEvent read FOnHide write SetOnHide;
      property OnResize: TNotifyEvent read FOnResize write SetOnResize;
      property OnShow: TNotifyEvent read FOnShow write SetOnShow;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure BringToFront;
      procedure Close;
      procedure Hide;
      procedure Invalidate;
      procedure SendToBack;
      procedure SetBounds(aLeft, aTop, aWidth, aHeight: Integer);
      procedure Show;
      procedure ShowModal;

  end; {class, TppFormWrapper}


  {forward declarations}
  TppItemInfo = class;
  TppFolderInfo = class;
  TppItemFieldNames = class;
  TppFolderFieldNames = class;

  { TppReportExplorer }
  TppReportExplorer = class(TppFormWrapper)
    private
      FCurrentFolderId: Integer;
      FCurrentItemName: String;
      FCurrentItemType: Integer;
      FDesigner: TppDesigner;
      FDialog: TForm;
      FErrorMessage: String;
      FFolderFieldNames: TppFolderFieldNames;
      FFolderPipeline: TppDataPipeline;
      FForm: TForm;
      FInitialized: Boolean;
      FItemFieldNames: TppItemFieldNames;
      FItemPipeline: TppDataPipeline;
      FItemFormat: TppFormatType;
      FMergeMenu: TMainMenu;
      FModalForm: Boolean;
      FReport: TppReport;
      FRecyclingItems: Boolean;
      FSaveFormClass: TFormClass;
      FShowMessages: Boolean;
      FValidateSettings: Boolean;
      FYesToAll: Boolean;

      FItemAction: TppItemActionType;
      FItemOptions: TppItemOptions;
      FFolderOptions: TppFolderOptions;

      procedure ConfigureReportTemplate;
      procedure DeleteItemsInFolder(aFolderId: Integer);
      procedure DesignerCloseEvent(Sender: TObject; var Action: TCloseAction);
      procedure DialogCloseEvent(Sender: TObject; var Action: TCloseAction);
      function  Initialize: Boolean;
      function  ItemTypeForTemplate(aTemplate: TppTemplate): Integer;
      function  LocateFolderRecord(const aFolderName: String; aParentId: Integer): Boolean;
      function  LocateItemRecord(const aItemName: String; aItemType, aFolderId: Integer): Boolean;
      procedure ReportCreateDialogEvent(Sender: TObject; aDialog: TObject);
      procedure ReportLoadEndEvent(Sender: TObject);
      function  ReportLocateRecordEvent(Sender: TObject; const aItemName: String): Boolean;
      procedure ReportNewEvent(Sender: TObject);
      procedure ReportSaveEndEvent(Sender: TObject; aStream: TStream);
      procedure SetDesigner(aDesigner: TppDesigner);
      procedure SetFolderFieldNames(aFolderFieldNames: TppFolderFieldNames);
      procedure SetFolderOptions(aFolderOptions: TppFolderOptions);
      procedure SetFolderPipeline(aFolderPipeline: TppDataPipeline);
      procedure SetMergeMenu(aMenu: TMainMenu);
      procedure SetItemFieldNames(aItemFieldNames: TppItemFieldNames);
      procedure SetItemAction(aItemAction: TppItemActionType);
      procedure SetItemOptions(aItemOptions: TppItemOptions);
      procedure SetItemPipeline(aItemPipeline: TppDataPipeline);


    protected
      function  GetForm: TForm; override;

      procedure AfterShowForm; override;
      function  BeforeShowForm: Boolean; override;

      function  MoveFolderToFolder(aFolderId, aNewParentId: Integer): Boolean;
      function  MoveFoldersToFolder(aOldFolderId, aNewFolderId: Integer): Boolean;
      function  MoveItemToFolder(const aItemName: String; aItemType, aFolderId, aNewFolderId: Integer): Boolean;
      function  MoveItemsToFolder(aOldFolderId, aNewFolderId: Integer): Boolean;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
      procedure Notification(aComponent: TComponent; Operation: TOperation); override;

      function  Execute: Boolean; virtual;

      procedure SetReport(aReport: TppReport); virtual;
      function  ValidSettings: Boolean; virtual;
      
      {item routines}
      function  ChangeFolder(const aItemName: String; aItemType, aFolderId, aNewFolderId: Integer): Boolean; virtual;
      procedure Delete(const aItemName: String; aItemType, aFolderId: Integer); virtual;
      procedure FreeItems(aList: TStrings);
      function  GetNewReportName(aFolderId: Integer): String; virtual;
      procedure GetItems(aFolderId, aItemType: Integer; aList: TStrings); virtual;
      function  IsReport(const aItemName: String; aFolderId: Integer): Boolean; virtual;
      procedure LoadReport(const aReportName: String; aFolderId: Integer); virtual;
      procedure New(aFolderId: Integer);
      procedure Open(const aReportName: String; aFolderId: Integer); virtual;
      procedure Print(const aReportName: String; aFolderId: Integer); virtual;
      procedure PrintPreview(const aReportName: String; aFolderId: Integer); virtual;
      procedure Rename(const aItemName, aNewName: String; aItemType, aFolderId: Integer); virtual;
      procedure SaveReport(const aReportName: String; aFolderId: Integer); virtual;
      function  ValidItemName(const aItemName: String; aItemType, aFolderId: Integer): Boolean; virtual;

      {folder routines}
      procedure AddFolder(aParentId: Integer; aFolderName: String; var aFolderId: Integer); virtual;
      function  ChangeParentFolder(aFolderId, aNewParentId: Integer): Boolean; virtual;
      function  DeleteFolder(aFolderId: Integer): Boolean; virtual;
      procedure GetChildFolders(aFolderId: Integer; aList: TStrings); virtual;
      function  GetParentId(aFolderId: Integer): Integer; virtual;
      function  GetNewFolderName(aParentId: Integer): String; virtual;
      function  GetFolderName(aFolderId: Integer): String; virtual;
      procedure GetFolders(aList: TStrings); virtual;
      procedure GetParentFolders(aFolderId: Integer; aList: TStrings); virtual;
      procedure RenameFolder(aFolderId: Integer; const aNewName: String); virtual;
      function  ValidFolderName(aParentId: Integer; aFolderName: String): Boolean; virtual;

      {confirmation routines}
      function  ConfirmDeleteFolder(const aFolderName: String): Boolean; virtual;
      function  ConfirmDeleteFolders(aList: TStrings): Boolean; virtual;
      function  ConfirmDeleteItem(const aItemName: String): Boolean; virtual;
      function  ConfirmDeleteItems(aList: TStrings): Boolean; virtual;
      function  ConfirmRecycleItem(const aItemName: String): Boolean; virtual;
      function  ConfirmRecycleItems(aList: TStrings): Boolean; virtual;
      function  ConfirmRenameFolder(const aOldName, aNewName: String; aParentId: Integer): Boolean; virtual;
      function  ConfirmRenameItem(const aOldName, aNewName: String; aItemType, aFolderId: Integer): Boolean; virtual;
      function  ConfirmReplaceFolder(const aFolderName: String): Word; virtual;
      function  ConfirmReplaceItem(const aItemName: String): Boolean; virtual;
      procedure RejectMoveFolder(const aFolderName: String); virtual;

      property CurrentItemName: String read FCurrentItemName write FCurrentItemName;
      property CurrentItemType: Integer read FCurrentItemType;
      property CurrentFolderId: Integer read FCurrentFolderId write FCurrentFolderId;
      property ErrorMessage: String read FErrorMessage;
      property Form: TForm read GetForm;
      property Initialized: Boolean read FInitialized write FInitialized;

    published
      property Designer: TppDesigner read FDesigner write SetDesigner;
      property FolderFieldNames: TppFolderFieldNames read FFolderFieldNames write SetFolderFieldNames;
      property FolderOptions: TppFolderOptions read FFolderOptions write SetFolderOptions default cDefaultFolderOptions;
      property FolderPipeline: TppDataPipeline read FFolderPipeline write SetFolderPipeline;
      property ItemFieldNames: TppItemFieldNames read FItemFieldNames write SetItemFieldNames;
      property ItemAction: TppItemActionType read FItemAction write SetItemAction default iaOpenToDesign;
      property ItemOptions: TppItemOptions read FItemOptions write SetItemOptions default cDefaultItemOptions;
      property ItemPipeline: TppDataPipeline read FItemPipeline write SetItemPipeline;
      property MergeMenu: TMainMenu read FMergeMenu write SetMergeMenu;
      property ModalForm: Boolean read FModalForm write FModalForm default True;
      property ValidateSettings: Boolean read FValidateSettings write FValidateSettings default True;

      {form wrapper properties}
      property FormCaption;
      property FormStyle;
      property FormIcon;
      property FormPosition;
      property FormHeight;
      property FormLeft;
      property FormTag;
      property FormTop;
      property FormWidth;
      property FormState;

      {form wrapper events}
      property OnActivate;
      property OnClose;
      property OnCloseQuery;
      property OnCreate;
      property OnDeactivate;
      property OnDestroy;
      property OnHide;
      property OnResize;
      property OnShow;

  end; {class, TppReportExplorer}

  { TppFolderFieldNames }
  TppFolderFieldNames = class(TPersistent)
    private
      FName: String;
      FFolderId: String;
      FParentId: String;
      FReportExplorer: TppReportExplorer;

    public
      constructor Create(aExplorer: TppReportExplorer);

      procedure Assign(Source: TPersistent); override;

      property ReportExplorer: TppReportExplorer read FReportExplorer;

    published
      property FolderId: String read FFolderId write FFolderId;
      property Name: String read FName write FName;
      property ParentId: String read FParentId write FParentId;

  end; {class, TppFolderFieldNames}

  { TppItemFieldNames }
  TppItemFieldNames = class(TPersistent)
    private
      FDeleted: String;
      FFolderId: String;
      FItemId: String;
      FModified: String;
      FName: String;
      FReportExplorer: TppReportExplorer;
      FSize: String;
      FTemplate: String;
      FItemType: String;

    public
      constructor Create(aExplorer: TppReportExplorer);

      procedure Assign(Source: TPersistent); override;

      property ReportExplorer: TppReportExplorer read FReportExplorer;

    published
      property Deleted: String read FDeleted write FDeleted;
      property FolderId: String read FFolderId write FFolderId;
      property ItemId: String read FItemId write FItemId;
      property Modified: String read FModified write FModified;
      property Name: String read FName write FName;
      property Size: String read FSize write FSize;
      property Template: String read FTemplate write FTemplate;
      property ItemType: String read FItemType write FItemType;

  end; {class, TppItemFieldNames}

  { TppFolderInfo }
  TppFolderInfo = class
    private
      FName: String;
      FFolderId: Integer;
      FParentId: Integer;

    public
      property Name: String read FName write FName;
      property FolderId: Integer read FFolderId write FFolderId;
      property ParentId: Integer read FParentId write FParentId;
  end;

  { TppItemInfo }
  TppItemInfo = class
    private
      FDeleted: TDateTime;
      FFolderId: Integer;
      FItemId: Integer;
      FModified: TDateTime;
      FName: String;
      FSize: Integer;
      FItemType: Integer;

    public
      property Deleted: TDateTime read FDeleted write FDeleted;
      property FolderId: Integer read FFolderId write FFolderId;
      property ItemId: Integer read FItemId write FItemId;
      property Modified: TDateTime read FModified write FModified;
      property Name: String read FName write FName;
      property Size: Integer read FSize write FSize;
      property ItemType: Integer read FItemType write FItemType;

  end;

  { TppItemList }
  TppItemList = class(TListView)
    private
      FAllFolders: Boolean;
      FFolderId: Integer;
      FFoldersInSelection: Boolean;
      FImageList: TImageList;
      FItemTypeFilter: Integer;
      FLanguageIndex: Longint;
      FOnDoubleClick: TNotifyEvent;
      FOnFolderChange: TNotifyEvent;
      FOnRenameFolder: TppRenameFolderEvent;
      FOnSelectionChange: TNotifyEvent;
      FReportExplorer: TppReportExplorer;
      FSelectionCount: Integer;
      FSelectionSize: Integer;
      FSortMode: Integer;

      procedure DoOnDoubleClick;
      procedure DoOnFolderChange;
      procedure DoOnRenameFolder(aFolderId: Integer; const aNewName: String);
      procedure DoOnSelectionChange;
      function  GetItemId: Integer;
      function  GetItemName: String;
      function  GetItemType: Integer;
      procedure GetItemsForFolder;
      procedure LanguageChanged;
      procedure SetLanguageIndex(aLanguageIndex: Longint);
      procedure GetSelectedItems(aList: TStrings);
      procedure SetFolderId(aFolderId: Integer);
      procedure SetItemName(aName: String);
      procedure SetReportExplorer(aExplorer: TppReportExplorer);
      procedure SetSortMode(aSortMode: Integer);
      procedure SetSortModeDescription;

      {event handlers}
      procedure ChangeEvent(Sender: TObject; Item: TListItem; Change: TItemChange);
      procedure CompareEvent(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
      procedure ColumnClickEvent(Sender: TObject; Column: TListColumn);
      procedure DblClickEvent(Sender: TObject);
      procedure DragDropEvent(Sender, Source: TObject; X, Y: Integer);
      procedure DragOverEvent(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
      procedure EditedEvent(Sender: TObject; Item: TListItem; var S: String);
      procedure EditingEvent(Sender: TObject; Item: TListItem; var AllowEdit: Boolean);

    protected
      procedure SetParent(aParent: TWinControl); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure DeleteSelection;
      procedure EmptyRecycleBin;
      procedure MoveSelectionToFolder(aFolderId: Integer);
      procedure RenameItem;

      property AllFolders: Boolean read FAllFolders;
      property FolderId: Integer read FFolderId write SetFolderId;
      property FoldersInSelection: Boolean read FFoldersInSelection;
      property ItemName: String read GetItemName write SetItemName;
      property ItemId: Integer read GetItemId;
      property ItemType: Integer read GetItemType;
      property ItemTypeFilter: Integer read FItemTypeFilter write FItemTypeFilter;
      property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;
      property ReportExplorer: TppReportExplorer read FReportExplorer write SetReportExplorer;
      property SelectionCount: Integer read FSelectionCount;
      property SelectionSize: Integer read FSelectionSize;
      property SortMode: Integer read FSortMode write SetSortMode;

      property OnDoubleClick: TNotifyEvent read FOnDoubleClick write FOnDoubleClick;
      property OnFolderChange: TNotifyEvent read FOnFolderChange write FOnFolderChange;
      property OnRenameFolder: TppRenameFolderEvent read FOnRenameFolder write FOnRenameFolder;
      property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange;

  end; {class, TppItemList}

  function ppGetTypeExtension(aItemType: Integer): String;
  function ppGetTypeDesc(aItemType: Integer): String;


implementation

uses
  ppExpDlg, ppExpFrm;

{******************************************************************************
 *
 ** I T E M   L I S T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppItemList.Create }

constructor TppItemList.Create(aOwner: TComponent);
var
  lBitmap: TBitmap;
begin

  inherited Create(aOwner);

  FAllFolders := False;
  FFolderId := 0;
  FFoldersInSelection := False;
  FItemTypeFilter := itAllFolders;
  FOnDoubleClick := nil;
  FOnFolderChange := nil;
  FOnRenameFolder := nil;
  FOnSelectionChange := nil;
  FReportExplorer := nil;
  FSelectionCount := 0;
  FSelectionSize := 0;
  FSortMode := 1;

  OnChange := ChangeEvent;
  OnColumnClick := ColumnClickEvent;
  OnCompare := CompareEvent;
  OnDblClick := DblClickEvent;
  OnDragDrop := DragDropEvent;
  OnDragOver := DragOverEvent;
  OnEdited := EditedEvent;
  OnEditing := EditingEvent;

  DragCursor := crDefault;
  DragMode := dmAutomatic;
  SortType := stText;

  FImageList := TImageList.Create(Self);
  FImageList.Width := 16;
  FImageList.Width := 16;

  lBitmap := TBitmap.Create;

  lBitmap.Handle := ppBitmapFromResource(UpperCase('TppSubReport'));
  FImageList.AddMasked(lBitmap, clSilver);

  lBitmap.Handle := ppBitmapFromResource(UpperCase('ppCodeModule'));
  FImageList.AddMasked(lBitmap, clWhite);

  lBitmap.Handle := ppBitmapFromResource(UpperCase('ppDataModule'));
  FImageList.AddMasked(lBitmap, clWhite);

  lBitmap.Handle := ppBitmapFromResource(UpperCase('ppFolder'));
  FImageList.AddMasked(lBitmap, clWhite);

  lBitmap.Free;

  SmallImages := FImageList;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppItemList.Destroy }

destructor TppItemList.Destroy;
begin

  FImageList.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppItemList.Destroy }

procedure TppItemList.SetParent(aParent: TWinControl);
var
  lColumn: TListColumn;

begin

  inherited SetParent(aParent);

  if (Columns.Count > 0) or (csDestroying in ComponentState) then Exit;

  {create columns - must do this after parent is assigned}
  lColumn := Columns.Add;
  lColumn.Width := 250;

  lColumn := Columns.Add;
  lColumn.Width := 120;
  lColumn.Alignment := taRightJustify;

  lColumn := Columns.Add;
  lColumn.Width := 100;

  lColumn := Columns.Add;
  lColumn.Width := 140;


end; {procedure, SetParent}

{------------------------------------------------------------------------------}
{ TppItemList.SetReportExplorer }

procedure TppItemList.SetReportExplorer(aExplorer: TppReportExplorer);
begin
  FReportExplorer := aExplorer;
end; {procedure, SetReportExplorer}

{------------------------------------------------------------------------------}
{ TppItemList.SetLanguageIndex }

procedure TppItemList.SetLanguageIndex(aLanguageIndex: Longint);
begin
  FLanguageIndex := aLanguageIndex;

  LanguageChanged;
end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TppItemList.SetItemName }

procedure TppItemList.SetItemName(aName: String);
var
  lbFound: Boolean;
  liIndex: Integer;
  lItem: TListItem;
begin

  lItem := nil;
  lbFound := False;
  liIndex := 0;

  while not(lbFound) and (liIndex < Items.Count) do
    begin
      lItem := Items[liIndex];

      if (CompareText(lItem.Caption, aName) = 0) then
        lbFound := True
      else
        Inc(liIndex);
        
    end;

  if lbFound then
    begin
      Selected := lItem;

      DoOnSelectionChange;
    end;

end; {procedure, SetItemName}

{------------------------------------------------------------------------------}
{ TppItemList.LanguageChanged }

procedure TppItemList.LanguageChanged;
begin

  SetSortModeDescription;

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TppItemList.SetFolderId }

procedure TppItemList.SetFolderId(aFolderId: Integer);
begin

  FFolderId := aFolderId;

  GetItemsForFolder;

end; {constructor, SetFolderId}

{------------------------------------------------------------------------------}
{ TppItemList.SetSortMode }

procedure TppItemList.SetSortMode(aSortMode: Integer);
begin

  FSortMode := aSortMode;

  SetSortModeDescription;

end; {procedure, SetSortMode}

{------------------------------------------------------------------------------}
{ TppItemList.GetItemId }

function TppItemList.GetItemId: Integer;
var
  lItem: TListItem;
begin
  lItem := Selected;

  if (lItem <> nil) then
    Result := Integer(lItem.Data)
  else
    Result := -1;

end; {function, GetItemId}

{------------------------------------------------------------------------------}
{ TppItemList.GetItemType }

function TppItemList.GetItemType: Integer;
var
  lItem: TListItem;
begin
  lItem := Selected;

  if (lItem <> nil) then
    Result := lItem.ImageIndex + 1
  else
    Result := -1;

end; {function, GetItemType}

{------------------------------------------------------------------------------}
{ TppItemList.GetItemName }

function TppItemList.GetItemName: String;
var
  lItem: TListItem;
begin
  lItem := Selected;

  if (lItem <> nil) then
    Result := lItem.Caption
  else
    Result := '';

end; {function, GetItemName}

{------------------------------------------------------------------------------}
{ TppItemList.DoOnDoubleClick }

procedure TppItemList.DoOnDoubleClick;
begin
  if Assigned(FOnDoubleClick) then FOnDoubleClick(Self);
end; {procedure, DoOnDoubleClick}

{------------------------------------------------------------------------------}
{ TppItemList.DoOnFolderChange }

procedure TppItemList.DoOnFolderChange;
begin
  if Assigned(FOnFolderChange) then FOnFolderChange(Self);
end; {procedure, DoOnFolderChange}

{------------------------------------------------------------------------------}
{ TppItemList.DoOnRenameFolder }

procedure TppItemList.DoOnRenameFolder(aFolderId: Integer; const aNewName: String);
begin
  if Assigned(FOnRenameFolder) then FOnRenameFolder(Self, aFolderId, aNewName);
end; {procedure, DoOnRenameFolder}

{------------------------------------------------------------------------------}
{ TppItemList.DoOnSelectionChange }

procedure TppItemList.DoOnSelectionChange;
begin
  if Assigned(FOnSelectionChange) then FOnSelectionChange(Self);
end; {procedure, DoOnSelectionChange}

{------------------------------------------------------------------------------}
{ TppItemList.ChangeEvent }

procedure TppItemList.ChangeEvent(Sender: TObject; Item: TListItem; Change: TItemChange);
var
  lItem: TListItem;
  liCount: Integer;
  liSize: Integer;
  lsSize: String;
  lItems: TStrings;
  liIndex: Integer;
begin

  lItems := TStringList.Create;

  GetSelectedItems(lItems);

  liCount := lItems.Count;
  liSize := 0;
  FAllFolders := True;
  FFoldersInSelection := False;

  for liIndex := 0 to lItems.Count - 1 do
    begin
      lItem := TListItem(lItems.Objects[liIndex]);

      if ((lItem.ImageIndex + 1) <> itFolder) then
        begin
          FAllFolders := False;

          lsSize := lItem.SubItems[0];
          lsSize := Copy(lsSize, 1, Length(lsSize) - Length(ppLoadStr(565))); {'KB'}

          liSize := liSize + (StrToInt(lsSize) * 1000);
        end
      else
       FFoldersInSelection := True;

    end;

  lItems.Free;

  FSelectionCount := liCount;
  FSelectionSize := liSize;

  DoOnSelectionChange;

end; {procedure, ChangeEvent}

{------------------------------------------------------------------------------}
{ TppItemList.DblClickEvent }

procedure TppItemList.DblClickEvent(Sender: TObject);
var
  lItem: TListItem;
begin

  lItem := Selected;

  if (lItem = nil) then Exit;

  if ((lItem.ImageIndex + 1) = itFolder) then
    begin
      FFolderId := Integer(lItem.Data);

      GetItemsForFolder;

      DoOnFolderChange;
    end

  else
    DoOnDoubleClick;

end; {procedure, DblClickEvent}

{------------------------------------------------------------------------------}
{ TppItemList.ColumnClickEvent }

procedure TppItemList.ColumnClickEvent(Sender: TObject; Column: TListColumn);
begin

  if (FSortMode = (Column.Index + 1)) then
    FSortMode := FSortMode * -1
  else
    FSortMode := Column.Index + 1;

  AlphaSort;

  SetSortModeDescription;

end; {procedure, ColumnClickEvent}

{------------------------------------------------------------------------------}
{ TppItemList.CompareEvent }

procedure TppItemList.CompareEvent(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
var
  liSize1: Integer;
  liSize2: Integer;
  ldDateTime1: TDateTime;
  ldDateTime2: TDateTime;
  liDiff: Double;
begin

  {both items are folders}
  if ((Item1.ImageIndex + 1) = itFolder) and ((Item2.ImageIndex + 1) = itFolder) then
    begin
      case FSortMode of
        1: Compare := CompareText(Item1.Caption, Item2.Caption);

       -1: Compare := CompareText(Item2.Caption, Item1.Caption);
      end;
    end

  {first item is folder}
  else if ((Item1.ImageIndex + 1) = itFolder) then
    Compare := -1

  {second item is folder}
  else if ((Item2.ImageIndex + 1) = itFolder) then
    Compare := 1

  {neither item is folder}
  else
  case FSortMode of
     1: Compare := CompareText(Item1.Caption, Item2.Caption);

    -1: Compare := CompareText(Item2.Caption, Item1.Caption);

    2, -2:
      begin
        liSize1 := StrToInt(Copy(Item1.SubItems[0], 1, Length(Item1.SubItems[0]) - Length(ppLoadStr(565)))); {'KB'}
        liSize2 := StrToInt(Copy(Item2.SubItems[0], 1, Length(Item2.SubItems[0]) - Length(ppLoadStr(565)))); {'KB'}

        if (FSortMode = 2) then
          Compare := liSize1 - liSize2
        else
          Compare := liSize2 - liSize1;

      end;

     3: Compare := CompareText(Item1.SubItems[1], Item2.SubItems[1]);

    -3: Compare := CompareText(Item2.SubItems[1], Item1.SubItems[1]);

    4, -4:
      begin
        ldDateTime1 := ppStrToDateTime(Item1.SubItems[2]);
        ldDateTime2 := ppStrToDateTime(Item2.SubItems[2]);

        if (FSortMode = 4) then
          liDiff := ldDateTime1 - ldDateTime2
        else
          liDiff := ldDateTime2 - ldDateTime1;

        if (liDiff > 0) then
          Compare := 1
        else if (liDiff < 0) then
          Compare := -1
        else
          Compare := 0;
      end;
  end;

  if (Compare = 0) then
    Compare := CompareText(Item1.Caption, Item2.Caption);

end; {procedure, CompareEvent}

{------------------------------------------------------------------------------}
{ TppItemList.DragDropEvent }

procedure TppItemList.DragDropEvent(Sender, Source: TObject; X, Y: Integer);
var
  lTargetItem: TListItem;
begin

  lTargetItem := GetItemAt(X, Y);

  if (lTargetItem = nil) then Exit;

  if ((lTargetItem.ImageIndex + 1) <> itFolder) then Exit;

  MoveSelectionToFolder(Integer(lTargetItem.Data));

end; {procedure, DragDropEvent}

{------------------------------------------------------------------------------}
{ TppItemList.DragOverEvent }

procedure TppItemList.DragOverEvent(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  lItem: TListItem;
begin

  lItem := GetItemAt(X, Y);

  if (lItem <> nil) then
    Accept := ((lItem.ImageIndex + 1) = itFolder)
  else
    Accept := False;

end; {procedure, DragOverEvent}

{------------------------------------------------------------------------------}
{ TppItemList.EditingEvent }

procedure TppItemList.EditingEvent(Sender: TObject; Item: TListItem; var AllowEdit: Boolean);
begin
  AllowEdit := (FFolderId <> -2);
end; {procedure, EditingEvent}

{------------------------------------------------------------------------------}
{ TppItemList.EditedEvent }

procedure TppItemList.EditedEvent(Sender: TObject; Item: TListItem; var S: String);
var
  liParentId: Integer;
begin

  if ((Item.ImageIndex + 1) = itFolder) then
    begin
      liParentId := FReportExplorer.GetParentId(Integer(Item.Data));

      if FReportExplorer.ConfirmRenameFolder(Item.Caption, S, liParentId) then
        begin
          DoOnRenameFolder(Integer(Item.Data), S);

          FReportExplorer.RenameFolder(Integer(Item.Data), S)
        end
      else
        S := Item.Caption;
    end
  else
    begin
      if FReportExplorer.ConfirmRenameItem(Item.Caption, S, Item.ImageIndex + 1, Integer(Item.Data)) then
        FReportExplorer.Rename(Item.Caption, S, Item.ImageIndex + 1, Integer(Item.Data))
      else
        S := Item.Caption;
    end;

end; {procedure, EditedEvent}

{------------------------------------------------------------------------------}
{ TppItemList.MoveSelectionToFolder }

procedure TppItemList.MoveSelectionToFolder(aFolderId: Integer);
var
  lItem: TListItem;
  liIndex: Integer;
  lItems: TStrings;
  lbChange: Boolean;
  lbFolderChange: Boolean;
begin

  lItems := TStringList.Create;

  GetSelectedItems(lItems);

  lbChange := False;
  lbFolderChange := False;

  for liIndex := 0 to lItems.Count - 1 do
    begin
      lItem := TListItem(lItems.Objects[liIndex]);

      if ((lItem.ImageIndex + 1) = itFolder) then
        begin
          if FReportExplorer.ChangeParentFolder(Integer(lItem.Data), aFolderId) then
            lbFolderChange :=  True;
        end
      else
        begin
          if FReportExplorer.ChangeFolder(lItem.Caption, lItem.ImageIndex + 1, Integer(lItem.Data), aFolderId) then
            lbChange := True;
        end;
    end;

  lItems.Free;

  if lbFolderChange then
    DoOnFolderChange

  else if lbChange then
    GetItemsForFolder;

end; {procedure, MoveSelectionToFolder}

{------------------------------------------------------------------------------}
{ TppItemList.EmptyRecycleBin }

procedure TppItemList.EmptyRecycleBin;
var
  lbConfirmed: Boolean;
  lItems: TStringList;
  liIndex: Integer;
begin

  lItems := TStringList.Create;

  FReportExplorer.GetItems(-2, itAllFolders, lItems);

  lbConfirmed := FReportExplorer.ConfirmDeleteItems(lItems);

  for liIndex := 0 to lItems.Count - 1 do
    TppItemInfo(lItems.Objects[liIndex]).Free;

  if (lbConfirmed) then
    begin
      FReportExplorer.DeleteItemsInFolder(-2);

      DoOnFolderChange;
    end;

  lItems.Free;

end; {procedure, EmptyRecycleBin}

{------------------------------------------------------------------------------}
{ TppItemList.DeleteSelection }

procedure TppItemList.DeleteSelection;
var
  lItem: TListItem;
  lItems: TStrings;
  liIndex: Integer;
  lbConfirmed: Boolean;
  lbFolderChange: Boolean;
begin

  lItems := TStringList.Create;

  GetSelectedItems(lItems);

  if (FFolderId = itRecycleBin) then
    lbConfirmed := FReportExplorer.ConfirmDeleteItems(lItems)
  else
    lbConfirmed := FReportExplorer.ConfirmRecycleItems(lItems);

  if not(lbConfirmed) then Exit;

  Items.BeginUpdate;

  lbFolderChange := False;

  for liIndex := 0 to lItems.Count - 1 do
    begin
      lItem := TListItem(lItems.Objects[liIndex]);

      if ((lItem.ImageIndex + 1) = itFolder) then
        lbFolderChange :=  True;

      if (FFolderId = itRecycleBin) then
        FReportExplorer.Delete(lItem.Caption, lItem.ImageIndex + 1, Integer(lItem.Data))
      else
        begin
          if ((lItem.ImageIndex + 1) = itFolder) then
            FReportExplorer.ChangeParentFolder(Integer(lItem.Data), -2)
          else
            FReportExplorer.ChangeFolder(lItem.Caption, lItem.ImageIndex + 1, Integer(lItem.Data), -2);
        end;

      lItem.Free;
    end;

  lItems.Free;

  Items.EndUpdate;

  if lbFolderChange then
    DoOnFolderChange;

end; {procedure, DeleteSelection}

{------------------------------------------------------------------------------}
{ TppItemList.RenameItem }

procedure TppItemList.RenameItem;
var
  lItem: TListItem;
begin

  lItem := Selected;

  if (lItem <> nil) and (Integer(lItem.Data) >= 0) then
    lItem.EditCaption;

end; {procedure, RenameItem}

{------------------------------------------------------------------------------}
{ TppItemList.SetSortModeDescription }

procedure TppItemList.SetSortModeDescription;
var
  lsSortDesc: String;
  liIndex: Integer;
begin

  Columns[0].Caption := ppLoadStr(569); {Name}
  Columns[1].Caption := ppLoadStr(583); {Size}
  Columns[2].Caption := ppLoadStr(588); {Type}
  Columns[3].Caption := ppLoadStr(568); {Modified}

  case FSortMode of
      1: lsSortDesc := ' ' + ppLoadStr(515); {(a > z)}
     -1: lsSortDesc := ' ' + ppLoadStr(520); {(z > a)}
      2: lsSortDesc := ' ' + ppLoadStr(519); {(small > large)}
     -2: lsSortDesc := ' ' + ppLoadStr(516); {(large > small)}
      3: lsSortDesc := ' ' + ppLoadStr(515); {(a > z)}
     -3: lsSortDesc := ' ' + ppLoadStr(520); {(z > a)}
      4: lsSortDesc := ' ' + ppLoadStr(518); {(older > newer)}
     -4: lsSortDesc := ' ' + ppLoadStr(517); {(newer > older)}
  end;

  if (FSortMode < 0) then
    liIndex := (FSortMode * -1) - 1
  else
    liIndex := FSortMode - 1;

 Columns[liIndex].Caption := Columns[liIndex].Caption + lsSortDesc;

end; {procedure, SetSortModeDescription}

{------------------------------------------------------------------------------}
{ TppItemList.GetSelectedItems }

procedure TppItemList.GetSelectedItems(aList: TStrings);
var
  lItem: TListItem;
begin

  lItem := Selected;

  while (lItem <> nil) do
    begin
      aList.AddObject(lItem.Caption, lItem);

      lItem := GetNextItem(lItem, sdAll, [isSelected]);
    end;

end; {procedure, GetSelectedItems}

{------------------------------------------------------------------------------}
{ TppItemList.GetItemsForFolder }

procedure TppItemList.GetItemsForFolder;
var
  lFolders: TStringList;
  lFolderInfo: TppFolderInfo;
  lItemNames: TStringList;
  lItem: TListItem;
  liIndex: Integer;
  lItemInfo: TppItemInfo;
  liTotalSize: Integer;
begin

  lFolders := TStringList.Create;
  lItemNames := TStringList.Create;

  Items.BeginUpdate;

  Items.Clear;

  FReportExplorer.GetChildFolders(FFolderId, lFolders);

  for liIndex := 0 to lFolders.Count - 1 do
    begin
      lFolderInfo := TppFolderInfo(lFolders.Objects[liIndex]);

      lItem := Items.Add;

      lItem.Caption := lFolderInfo.Name;
      lItem.Data := TObject(lFolderInfo.FolderId);
      lItem.ImageIndex := itFolder - 1;

      lItem.SubItems.Add('');
      lItem.SubItems.Add(ppGetTypeDesc(itFolder));

      lFolderInfo.Free;
    end;

  if (FItemTypeFilter <> itAllFolders) then
    FReportExplorer.GetItems(FFolderId, FItemTypeFilter, lItemNames)
  else
    FReportExplorer.GetItems(FFolderId, itAllFolders, lItemNames);

  liTotalSize := 0;

  for liIndex := 0 to lItemNames.Count - 1 do
    begin
      lItemInfo := TppItemInfo(lItemNames.Objects[liIndex]);

      lItem := Items.Add;

      lItem.Caption := lItemInfo.Name;
      lItem.ImageIndex := lItemInfo.ItemType - 1;
      lItem.Data := TObject(lItemInfo.FolderId);

      lItem.SubItems.Add(IntToStr(lItemInfo.Size div 1000) + ppLoadStr(565)); {KB}
      lItem.SubItems.Add(ppGetTypeDesc(lItemInfo.ItemType));
      lItem.SubItems.Add(FormatDateTime(ShortDateFormat + ' ' + ShortTimeFormat, lItemInfo.Modified));

      liTotalSize := liTotalSize + lItemInfo.Size;

      lItemInfo.Free;
    end;

  FSelectionCount := lItemNames.Count;
  FSelectionSize := liTotalSize;

  lFolders.Free;
  lItemNames.Free;

  Items.EndUpdate;

end; {procedure, GetItemsForFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ppGetTypeExtension }

function ppGetTypeExtension(aItemType: Integer): String;
begin

  case aItemType of
    itReport: Result := 'rtm';
    itCode:   Result := 'ctm';
    itData:   Result := 'dtm';
  end;

end; {function, ppGetTypeExtension}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ppGetTypeDesc }

function ppGetTypeDesc(aItemType: Integer): String;
begin

  case aItemType of
    itReport: Result := ppLoadStr(579); {Report}
    itFolder: Result := ppLoadStr(554); {Folder}
    itData:   Result := ppLoadStr(546); {Data Module}
    itCode: Result   := ppLoadStr(535); {Code Module}
  end;

end; {function, ppGetTypeDesc}

{******************************************************************************
 *
 ** R E P O R T   E X P L O R E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppReportExplorer.Create }

constructor TppReportExplorer.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDesigner := nil;
  FDialog := nil;
  FErrorMessage := '';
  FFolderFieldNames := TppFolderFieldNames.Create(Self);
  FFolderOptions := cDefaultFolderOptions;
  FFolderPipeline := nil;
  FForm := nil;
  FMergeMenu := nil;
  FReport := nil;
  FInitialized := False;
  FItemAction := iaOpenToDesign;
  FItemOptions := cDefaultItemOptions;
  FItemFieldNames := TppItemFieldNames.Create(Self);
  FItemFormat := ftBinary;
  FItemPipeline := nil;
  FModalForm := True;
  FValidateSettings := True;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppReportExplorer.Destroy }

destructor TppReportExplorer.Destroy;
begin

  FFolderFieldNames.Free;
  FItemFieldNames.Free;
  
  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppReportExplorer.Notify }

procedure TppReportExplorer.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator = FFolderPipeline) then
    FFolderPipeline := nil

  else if (aCommunicator = FItemPipeline) then
    FItemPipeline := nil

  else if (aCommunicator = FDesigner) then
    FDesigner := nil

  else if (aCommunicator = FReport) then
    FReport := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppReportExplorer.Notification }

procedure TppReportExplorer.Notification(aComponent: TComponent; Operation: TOperation);
begin

  inherited Notification(aComponent, Operation);

  if (aComponent = FMergeMenu) and (Operation = opRemove) then
    FMergeMenu := nil;

end; {procedure, Notification}

{------------------------------------------------------------------------------}
{ TppReportExplorer.GetForm }

function TppReportExplorer.GetForm: TForm;
begin
  Result := FForm;
end; {function, GetForm}

{------------------------------------------------------------------------------}
{ TppReportExplorer.Initialize }

function TppReportExplorer.Initialize: Boolean;
var
  lFileMenu: TMenuItem;
begin

  Result := FInitialized;

  if (FInitialized) then Exit;

  if (FDesigner <> nil) then
    begin
      SetReport(FDesigner.Report);

      FDesigner.OnClose := DesignerCloseEvent;

      {set menu options based on ItemOptions}
      lFileMenu := FDesigner.Menu.Items[0];
      lFileMenu.Items[0].Visible := (ioAllowNew in FItemOptions);
      lFileMenu.Items[1].Visible := (ioAllowNew in FItemOptions);
      lFileMenu.Items[6].Visible := (ioAllowRename in FItemOptions);
    end;

  {create form here}
  if ValidSettings then
    begin
      ConfigureReportTemplate;

      FCurrentFolderId := -1;
      FCurrentItemName := '';
      FCurrentItemType := -1;

      FInitialized := True;
    end;
    
  Result := FInitialized;

end; {procedure, Initialize}

{------------------------------------------------------------------------------}
{ TppReportExplorer.BeforeShowForm }

function TppReportExplorer.BeforeShowForm: Boolean;
var
  lFormClass: TFormClass;
begin

  Result := False;

  if (csDesigning in ComponentState) then Exit;

  lFormClass := ppGetFormClass(TppCustomTemplateDialog);

  if not(lFormClass = TppOpenSaveDialog) then
    begin
      FSaveFormClass := lFormClass;
      ppRegisterForm(TppCustomTemplateDialog, TppOpenSaveDialog);
    end;

  if not(Initialize) then Exit;

  lFormClass := ppGetFormClass(TppCustomReportExplorer);

  if (lFormClass = nil) then
    begin
      {No Report Explorer form class is registered.}
      FErrorMessage := ppLoadStr(573);

      Exit;
    end;

  Result := True;

  FForm := TppCustomReportExplorer(lFormClass.Create(Application));

  TppCustomReportExplorer(FForm).ReportExplorer := Self;
  TppCustomReportExplorer(FForm).LanguageIndex := FReport.LanguageIndex;

  TppCustomReportExplorer(Form).Initialize;

  if (FMergeMenu <> nil) then
    FForm.Menu.Merge(FMergeMenu);

end; {function, BeforeShowForm}

{------------------------------------------------------------------------------}
{ TppReportExplorer.AfterShowForm }

procedure TppReportExplorer.AfterShowForm;
begin

  {restore previously registered form}
  if (FSaveFormClass <> nil) then
    ppRegisterForm(TppCustomTemplateDialog, FSaveFormClass);

  FForm.Free;

  FForm := nil;

end; {procedure, AfterShowForm}

{------------------------------------------------------------------------------}
{ TppReportExplorer.Execute }

function TppReportExplorer.Execute: Boolean;
begin

  Result := ValidSettings;

  if not(Result) then Exit;

  if FModalForm then
    inherited ShowModal
  else
    inherited Show;

end; {function, Execute}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ValidSettings }

function TppReportExplorer.ValidSettings: Boolean;
var
  lFieldNames: TStrings;
  lDataType: TppDataType;
begin

  Result := False;

  FErrorMessage := '';

  if not(FValidateSettings) then
    begin
      Result := True;

      Exit;
    end;

  if (FDesigner = nil) then
    begin
      {Designer property is not assigned.}
      FErrorMessage := ppLoadStr(548);
      Exit;
    end;

  if (FDesigner.Report = nil) then
    begin
      {Report property of Designer is not assigned.}
      FErrorMessage := ppLoadStr(581);
      Exit;
    end;

  if (FDesigner.DataSettings.DataDictionary <> nil) and
     (FDesigner.DataSettings.UseDataDictionary) and not(FDesigner.DataSettings.DataDictionary.ValidSettings) then
    begin
      FErrorMessage := FDesigner.DataSettings.DataDictionary.ErrorMessage;
      Exit;
    end;

  if (FItemPipeline = nil) then
    begin
      {ItemPipeline property is not assigned.}
      FErrorMessage := ppLoadStr(563);
      Exit;
    end;

  {make sure pipelines can be opened}
  try
    FFolderPipeline.Open;
  except
    {FolderPipeline <name> could not be opened.}
    FErrorMessage := ppLoadStr(556);
    FErrorMessage := ppSetMessageParameters(FErrorMessage);
    FErrorMessage := Format(FErrorMessage, [FFolderPipeline.Name]);
    Exit;
  end;

  if not(FFolderPipeline.Active) then
    begin
      {FolderPipeline <name> could not be opened.}
      FErrorMessage := ppLoadStr(556);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, [FFolderPipeline.Name]);
      Exit;
    end;

  try
    FItemPipeline.Open;
  except
    {ItemPipeline <name> could not be opened.}
    FErrorMessage := ppLoadStr(564);
    FErrorMessage := ppSetMessageParameters(FErrorMessage);
    FErrorMessage := Format(FErrorMessage, [FItemPipeline.Name]);
    Exit;
  end;

  if not(FItemPipeline.Active) then
    begin
      {ItemPipeline <name> could not be opened.}
      FErrorMessage := ppLoadStr(564);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, [FItemPipeline.Name]);
      Exit;
    end;

  {make sure field names are valid}
  lFieldNames := TStringList.Create;

  FFolderPipeline.GetFieldNames(lFieldNames);

  if (lFieldNames.IndexOf(FFolderFieldNames.FolderId) = -1) then
    begin
      lFieldNames.Free;

      {FolderPipeline <name> field: '<name>' could not be found.}
      FErrorMessage := ppLoadStr(591);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, ['FolderId', FFolderFieldNames.FolderId]);

      Exit;
    end;

  if (lFieldNames.IndexOf(FFolderFieldNames.Name) = -1) then
    begin
      lFieldNames.Free;

      {FolderPipeline <name> field: '<name>' could not be found.}
      FErrorMessage := ppLoadStr(591);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, ['Name', FFolderFieldNames.Name]);

      Exit;
    end;

  if (lFieldNames.IndexOf(FFolderFieldNames.ParentId) = -1) then
    begin
      lFieldNames.Free;

      {FolderPipeline <name> field: '<name>' could not be found.}
      FErrorMessage := ppLoadStr(591);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, ['ParentId', FFolderFieldNames.ParentId]);

      Exit;
    end;

  {make sure field names are valid}
  lFieldNames.Clear;

  FItemPipeline.GetFieldNames(lFieldNames);

  if (lFieldNames.IndexOf(FItemFieldNames.Name) = -1) then
    begin
      lFieldNames.Free;

      {ItemPipeline <name> field: '<name>' could not be found.}
      FErrorMessage := ppLoadStr(561);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, ['Name', FItemFieldNames.Name]);

      Exit;
    end;

  if (lFieldNames.IndexOf(FItemFieldNames.FolderId) = -1) then
    begin
      lFieldNames.Free;

      {ItemPipeline <name> field: '<name>' could not be found.}
      FErrorMessage := ppLoadStr(561);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, ['FolderId', FItemFieldNames.FolderId]);

      Exit;
    end;

  if (lFieldNames.IndexOf(FItemFieldNames.Modified) = -1) then
    begin
      lFieldNames.Free;

      {ItemPipeline <name> field: '<name>' could not be found.}
      FErrorMessage := ppLoadStr(561);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, ['Modified', FItemFieldNames.Modified]);

      Exit;
    end;

  if (lFieldNames.IndexOf(FItemFieldNames.Size) = -1) then
    begin
      lFieldNames.Free;

      {ItemPipeline <name> field: '<name>' could not be found.}
      FErrorMessage := ppLoadStr(561);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, ['Size', FItemFieldNames.Size]);

      Exit;
    end;

  if (lFieldNames.IndexOf(FItemFieldNames.Template) = -1) then
    begin
      lFieldNames.Free;

      {ItemPipeline <name> field: '<name>' could not be found.}
      FErrorMessage := ppLoadStr(561);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, ['Template', FItemFieldNames.Template]);

      Exit;
    end;

  if (lFieldNames.IndexOf(FItemFieldNames.ItemId) = -1) then
    begin
      lFieldNames.Free;

      {ItemPipeline <name> field: '<name>' could not be found.}
      FErrorMessage := ppLoadStr(561);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, ['ItemId', FItemFieldNames.ItemId]);

      Exit;
    end;

  if (lFieldNames.IndexOf(FItemFieldNames.Deleted) = -1) then
    begin
      lFieldNames.Free;

      {ItemPipeline <name> field: '<name>' could not be found.}
      FErrorMessage := ppLoadStr(561);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, ['Deleted', FItemFieldNames.Deleted]);

      Exit;
    end;

  lFieldNames.Free;

  {set FItemFormat based on template field type}
  lDataType := FItemPipeline.GetFieldDataType(FItemFieldNames.Template);

  if (lDataType = dtMemo) then
    FItemFormat := ftASCII

  else if (lDataType = dtBLOB) then
    FItemFormat := ftBinary

  else
    begin
      {ItemPipeline Template field: '<name>' could not be found.}
      FErrorMessage := ppLoadStr(562);
      FErrorMessage := ppSetMessageParameters(FErrorMessage);
      FErrorMessage := Format(FErrorMessage, [FItemFieldNames.Template]);

      Exit;
    end;

  Result := True;

end; {function, ValidSettings}

{------------------------------------------------------------------------------}
{ TppReportExplorer.SetMergeMenu }

procedure TppReportExplorer.SetMergeMenu(aMenu: TMainMenu);
begin
  FMergeMenu := aMenu;
end; {procedure, SetMergeMenu}

{------------------------------------------------------------------------------}
{ TppReportExplorer.SetFolderOptions }

procedure TppReportExplorer.SetFolderOptions(aFolderOptions: TppFolderOptions);
begin

  FFolderOptions := aFolderOptions;

  if (foAllowDelete in FFolderOptions) and not(ioAllowDelete in FItemOptions) then
    Include(FItemOptions, ioAllowDelete);

end; {procedure, SetFolderOptions}

{------------------------------------------------------------------------------}
{ TppReportExplorer.SetItemAction }

procedure TppReportExplorer.SetItemAction(aItemAction: TppItemActionType);
begin
  FItemAction := aItemAction;
end; {procedure, SetItemAction}

{------------------------------------------------------------------------------}
{ TppReportExplorer.SetItemOptions }

procedure TppReportExplorer.SetItemOptions(aItemOptions: TppItemOptions);
begin

  FItemOptions := aItemOptions;

  {if design is not allowed, we cannot open to design}
  if (FItemAction = iaOpenToDesign) and not(ioAllowDesign in FItemOptions) then
    FItemAction := iaOpenToPreview;

  if (ioAllowDelete in FItemOptions) and not(foAllowDelete in FFolderOptions) then
    Include(FFolderOptions, foAllowDelete);

end; {procedure, SetItemOptions}

{------------------------------------------------------------------------------}
{ TppReportExplorer.SetFolderFieldNames }

procedure TppReportExplorer.SetFolderFieldNames(aFolderFieldNames: TppFolderFieldNames);
begin
  FFolderFieldNames.Assign(aFolderFieldNames);
end; {procedure, SetFolderFieldNames}

{------------------------------------------------------------------------------}
{ TppReportExplorer.SetItemFieldNames }

procedure TppReportExplorer.SetItemFieldNames(aItemFieldNames: TppItemFieldNames);
begin
  FItemFieldNames.Assign(aItemFieldNames);
end; {procedure, SetItemFieldNames}

{------------------------------------------------------------------------------}
{ TppReportExplorer.SetDesigner }

procedure TppReportExplorer.SetDesigner(aDesigner: TppDesigner);
begin

  if (FDesigner <> nil) then
    FDesigner.RemoveNotify(Self);

  FDesigner := aDesigner;

  if (FDesigner <> nil) then
    FDesigner.AddNotify(Self);

end; {procedure, SetDesigner}

{------------------------------------------------------------------------------}
{ TppReportExplorer.SetFolderPipeline }

procedure TppReportExplorer.SetFolderPipeline(aFolderPipeline: TppDataPipeline);
begin

  if (FFolderPipeline <> nil) then
    FFolderPipeline.RemoveNotify(Self);

  FFolderPipeline := aFolderPipeline;

  if (FFolderPipeline <> nil) then
    FFolderPipeline.AddNotify(Self);

end; {procedure, SetFolderPipeline}

{------------------------------------------------------------------------------}
{ TppReportExplorer.SetItemPipeline }

procedure TppReportExplorer.SetItemPipeline(aItemPipeline: TppDataPipeline);
begin

  if (FItemPipeline <> nil) then
    FItemPipeline.RemoveNotify(Self);

  FItemPipeline := aItemPipeline;

  if (FItemPipeline <> nil) then
    FItemPipeline.AddNotify(Self);

end; {procedure, SetItemPipeline}

{------------------------------------------------------------------------------}
{ TppReportExplorer.SetReport }

procedure TppReportExplorer.SetReport(aReport: TppReport);
begin

  if (FReport <> nil) then
    FReport.RemoveNotify(Self);

  FReport := aReport;

  if (FReport <> nil) then
    FReport.AddNotify(Self);

end; {procedure, SetReport}

{------------------------------------------------------------------------------}
{ TppReportExplorer.LoadReport }

procedure TppReportExplorer.LoadReport(const aReportName: String; aFolderId: Integer);
var
  lLanguage: TppLanguageType;
begin

  if not(Initialize) then Exit;

  lLanguage := FReport.Language;

  FCurrentFolderId := aFolderId;

  FReport.Template.DataBaseSettings.Name := aReportName;
  FReport.Template.LoadFromDatabase;

  ConfigureReportTemplate;

  FReport.Language := lLanguage;

end; {procedure, LoadReport}

{------------------------------------------------------------------------------}
{ TppReportExplorer.SaveReport }

procedure TppReportExplorer.SaveReport(const aReportName: String; aFolderId: Integer);
begin
  if not(Initialize) then Exit;

  FReport.Template.DataBaseSettings.Name := aReportName;
  FReport.Template.SaveToDatabase;
end; {procedure, SaveReport}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ReportCreateDialogEvent }

procedure TppReportExplorer.ReportCreateDialogEvent(Sender: TObject; aDialog: TObject);
var
  lDialog: TppOpenSaveDialog;
begin

  if (aDialog is TppOpenSaveDialog) then
    begin
      lDialog := TppOpenSaveDialog(aDialog);

      lDialog.ReportExplorer := Self;
      lDialog.FolderId := FCurrentFolderId;

      FCurrentItemType := ItemTypeForTemplate(TppTemplate(Sender));

      lDialog.ItemType := FCurrentItemType;

      if (lDialog.ItemType = itReport) then
        lDialog.ItemName := FCurrentItemName;

      lDialog.OnClose := DialogCloseEvent;

      FDialog := lDialog;
    end;

end; {procedure, ReportCreateDialogEvent}

{------------------------------------------------------------------------------}
{ TppReportExplorer.DialogCloseEvent }

procedure TppReportExplorer.DialogCloseEvent(Sender: TObject; var Action: TCloseAction);
begin

  if (FDialog.ModalResult = mrOK) then
    begin
      FCurrentFolderId := TppOpenSaveDialog(FDialog).FolderId;
      FCurrentItemName := TppOpenSaveDialog(FDialog).ItemName;
      FCurrentItemType := TppOpenSaveDialog(FDialog).ItemType;
    end;

  FDialog := nil;

end; {procedure, DialogCloseEvent}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ReportNewEvent }

procedure TppReportExplorer.ReportNewEvent(Sender: TObject);
var
  lReport: TComponent;
begin

  lReport := TppReportTemplate(Sender).Report;

  if (lReport = nil) or not(lReport is TppReport) then Exit;

  FCurrentItemName := GetNewReportName(FCurrentFolderId);

  TppReport(lReport).Template.DatabaseSettings.Name := FCurrentItemName;

end; {procedure, ReportNewEvent}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ReportLoadEndEvent }

procedure TppReportExplorer.ReportLoadEndEvent(Sender: TObject);
begin
  FCurrentFolderId := FItemPipeline.GetFieldValue(FItemFieldNames.FolderId);
  FCurrentItemName := FItemPipeline.GetFieldValue(FItemFieldNames.Name);
  FCurrentItemType := FItemPipeline.GetFieldValue(FItemFieldNames.ItemType);
end; {procedure, ReportLoadEndEvent}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ReportLocateRecordEvent }

function TppReportExplorer.ReportLocateRecordEvent(Sender: TObject; const aItemName: String): Boolean;
begin
  FCurrentItemType := ItemTypeForTemplate(TppTemplate(Sender));

  Result := LocateItemRecord(aItemName, FCurrentItemType, FCurrentFolderId);
end; {function, ReportLocateRecordEvent}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ReportSaveEndEvent }

procedure TppReportExplorer.ReportSaveEndEvent(Sender: TObject; aStream: TStream);
begin

  if (TppTemplate(Sender).SaveTo = stFile) then Exit;

  FItemPipeline.SetFieldValue(FItemFieldNames.ItemType, FCurrentItemType);
  FItemPipeline.SetFieldValue(FItemFieldNames.FolderId, FCurrentFolderId);
  FItemPipeline.SetFieldValue(FItemFieldNames.Size, aStream.Size);
  FItemPipeline.SetFieldValue(FItemFieldNames.Modified, Now);

end; {procedure, ReportSaveEndEvent}

{------------------------------------------------------------------------------}
{ TppReportExplorer.DesignerCloseEvent }

procedure TppReportExplorer.DesignerCloseEvent(Sender: TObject; var Action: TCloseAction);
begin
  if (FForm <> nil) then
    TppReportExplorerForm(FForm).Refresh;
end; {procedure, DesignerCloseEvent}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ValidItemName }

function TppReportExplorer.ValidItemName(const aItemName: String; aItemType, aFolderId: Integer): Boolean;
begin

  Result := False;

  if not(Initialize) then Exit;

  if (Length(aItemName) = 0) then Exit;

  Result := not(LocateItemRecord(aItemName, aItemType, aFolderId));

end; {function, ValidItemName}

{------------------------------------------------------------------------------}
{ TppReportExplorer.IsReport }

function TppReportExplorer.IsReport(const aItemName: String; aFolderId: Integer): Boolean;
begin

  Result := False;

  if not(Initialize) then Exit;

  Result := LocateItemRecord(aItemName, itReport, aFolderId);

end; {function, IsReport}

{------------------------------------------------------------------------------}
{ TppReportExplorer.LocateFolderRecord }

function TppReportExplorer.LocateFolderRecord(const aFolderName: String; aParentId: Integer): Boolean;
var
  lsFieldNames: String;
begin

  lsFieldNames := FFolderFieldNames.Name + ';' +
                  FFolderFieldNames.ParentId;

  Result := FFolderPipeline.Locate(lsFieldNames, VarArrayOf([aFolderName, aParentId]), [pploCaseInsensitive]);

end; {procedure, LocateFolderRecord}

{------------------------------------------------------------------------------}
{ TppReportExplorer.LocateItemRecord }

function TppReportExplorer.LocateItemRecord(const aItemName: String; aItemType, aFolderId: Integer): Boolean;
var
  lsFieldNames: String;
begin

  lsFieldNames := FItemFieldNames.FolderId + ';' +
                  FItemFieldNames.ItemType + ';' +
                  FItemFieldNames.Name;

  Result := FItemPipeline.Locate(lsFieldNames, VarArrayOf([aFolderId, aItemType, aItemName]), [pploCaseInsensitive]);

end; {procedure, LocateItemRecord}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ItemTypeForTemplate }

function TppReportExplorer.ItemTypeForTemplate(aTemplate: TppTemplate): Integer;
begin

  if CompareText(aTemplate.FileExtension, 'rtm') = 0 then
    Result := itReport
  else if CompareText(aTemplate.FileExtension, 'ctm') = 0 then
    Result := itCode
  else if CompareText(aTemplate.FileExtension, 'dtm') = 0 then
    Result := itData
  else
    Result := itReport;

end; {function, ItemTypeForTemplate}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ValidFolderName }

function TppReportExplorer.ValidFolderName(aParentId: Integer; aFolderName: String): Boolean;
var
  lsFieldNames: String;
begin

  Result := False;

  if not(Initialize) then Exit;

  if (Length(aFolderName) = 0) then Exit;
  
  lsFieldNames := FFolderFieldNames.Name + ';' + FFolderFieldNames.ParentId;

  Result := not(FFolderPipeline.Locate(lsFieldNames, VarArrayOf([aFolderName, aParentId]), [pploCaseInsensitive]));

end; {function, ValidFolderName}

{------------------------------------------------------------------------------}
{ TppReportExplorer.Open }

procedure TppReportExplorer.Open(const aReportName: String; aFolderId: Integer);
begin

  if not(Initialize) then Exit;

  if IsReport(aReportName, aFolderId)then
    begin
      LoadReport(aReportName, aFolderId);
      
      FDesigner.ShowModal;
    end;

end; {procedure, Open}

{------------------------------------------------------------------------------}
{ TppReportExplorer.Print }

procedure TppReportExplorer.Print(const aReportName: String; aFolderId: Integer);
begin

  if not(Initialize) then Exit;

  if IsReport(aReportName, aFolderId)then
    begin
      LoadReport(aReportName, aFolderId);

      FReport.DeviceType := dtPrinter;
      FReport.Print;
    end;

end; {procedure, Print}

{------------------------------------------------------------------------------}
{ TppReportExplorer.PrintPreview }

procedure TppReportExplorer.PrintPreview(const aReportName: String; aFolderId: Integer);
begin

  if not(Initialize) then Exit;

  if IsReport(aReportName, aFolderId)then
    begin
      LoadReport(aReportName, aFolderId);

      FReport.DeviceType := dtScreen;
      FReport.Print;
    end;

end; {procedure, PrintPreview}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ConfigureReportTemplate }

procedure TppReportExplorer.ConfigureReportTemplate;
begin

  FReport.Template.reOnCreateDialog := ReportCreateDialogEvent;
  FReport.Template.reOnNew := ReportNewEvent;
  FReport.Template.reOnSaveEnd := ReportSaveEndEvent;
  FReport.Template.reOnLoadEnd := ReportLoadEndEvent;
  FReport.Template.reOnLocateRecord := ReportLocateRecordEvent;

  FReport.SaveAsTemplate  := True;
  FReport.Template.SaveTo := stDatabase;
  FReport.Template.Format := FItemFormat;

  FReport.Template.DatabaseSettings.Name := FCurrentItemName;
  FReport.Template.DatabaseSettings.DataPipeline := FItemPipeline;
  FReport.Template.DatabaseSettings.NameField := FItemFieldNames.Name;
  FReport.Template.DatabaseSettings.TemplateField := FItemFieldNames.Template;

  FReport.Modified := False;
  
end; {procedure, ConfigureReportTemplate}

{------------------------------------------------------------------------------}
{ TppReportExplorer.New }

procedure TppReportExplorer.New(aFolderId: Integer);
begin

  if not(Initialize) then Exit;

  FCurrentFolderId := aFolderId;
  FCurrentItemName := GetNewReportName(aFolderId);
  FCurrentItemType := itReport;

  FReport.FreeModules;

  FReport.Template.New;

  ConfigureReportTemplate;

  FDesigner.ShowModal;

end; {procedure, New}

{------------------------------------------------------------------------------}
{ TppReportExplorer.GetNewFolderName }

function TppReportExplorer.GetNewFolderName(aParentId: Integer): String;
var
  lFolders: TStringList;
  liIndex: Integer;
  lsFolderName: String;
  liIncrement: Integer;
begin

  if not(Initialize) then Exit;

  lFolders := TStringList.Create;

  GetChildFolders(aParentId, lFolders);

  lsFolderName := ppLoadStr(570); {New Folder}
  liIndex := lFolders.IndexOf(lsFolderName);
  liIncrement := 2;

  while (liIndex <> -1) do
    begin
      lsFolderName := ppLoadStr(570) + ' (' + IntToStr(liIncrement) + ')';

      liIndex := lFolders.IndexOf(lsFolderName);

      Inc(liIncrement);
    end;

  for liIndex := 0 to lFolders.Count - 1 do
    TppFolderInfo(lFolders.Objects[liIndex]).Free;

  lFolders.Free;

  Result := lsFolderName;

end; {function, GetNewFolderName}

{------------------------------------------------------------------------------}
{ TppReportExplorer.GetNewReportName }

function TppReportExplorer.GetNewReportName(aFolderId: Integer): String;
var
  lReports: TStringList;
  liIndex: Integer;
  lsReportName: String;
  liIncrement: Integer;
begin

  if not(Initialize) then Exit;

  lReports := TStringList.Create;

  GetItems(aFolderId, itReport, lReports);

  lsReportName := ppLoadStr(571); {New Report}
  liIndex := lReports.IndexOf(lsReportName);
  liIncrement := 2;

  while (liIndex <> -1) do
    begin
      lsReportName := ppLoadStr(571) + ' (' + IntToStr(liIncrement) + ')';

      liIndex := lReports.IndexOf(lsReportName);

      Inc(liIncrement);
    end;

  for liIndex := 0 to lReports.Count - 1 do
    TppItemInfo(lReports.Objects[liIndex]).Free;

  lReports.Free;

  Result := lsReportName;

end; {function, GetNewReportName}

{------------------------------------------------------------------------------}
{ TppReportExplorer.AddFolder }

procedure TppReportExplorer.AddFolder(aParentId: Integer; aFolderName: String; var aFolderId: Integer);
begin

  if not(Initialize) then Exit;

  FFolderPipeline.Insert;
  FFolderPipeline.SetFieldValue(FFolderFieldNames.Name, aFolderName);
  FFolderPipeline.SetFieldValue(FFolderFieldNames.ParentId, aParentId);
  FFolderPipeline.Post;

  {note: the following is a workaround to refresh the buffer with the
         FolderId value that was auto generated by the database}
  if LocateFolderRecord(aFolderName, aParentId) then
    aFolderId := FFolderPipeline.GetFieldValue(FFolderFieldNames.FolderId)
  else
    aFolderId := -1;

  {a folder id of zero is invalid, since this id is used by itAllFolders. So
   if the DB returns zero, delete the record and create another one}
  if (aFolderId = 0) then
    begin
      FFolderPipeline.Delete;

      FFolderPipeline.Insert;
      FFolderPipeline.SetFieldValue(FFolderFieldNames.Name, aFolderName);
      FFolderPipeline.SetFieldValue(FFolderFieldNames.ParentId, aParentId);
      FFolderPipeline.Post;
      {note: the following is a workaround to refresh the buffer with the
             FolderId value that was auto generated by the database}
      if LocateFolderRecord(aFolderName, aParentId) then
        aFolderId := FFolderPipeline.GetFieldValue(FFolderFieldNames.FolderId)
      else
        aFolderId := -1;
    end;

end; {procedure, AddFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.GetParentId }

function TppReportExplorer.GetParentId(aFolderId: Integer): Integer;
begin

  Result := -1;

  if not(Initialize) then Exit;

  if FFolderPipeline.Locate(FFolderFieldNames.FolderId, aFolderId, [pploCaseInsensitive]) then
    Result := FFolderPipeline.GetFieldValue(FFolderFieldNames.ParentId)
  else
    Result := -1;

end; {procedure, GetParentId}

{------------------------------------------------------------------------------}
{ TppReportExplorer.GetFolderName }

function TppReportExplorer.GetFolderName(aFolderId: Integer): String;
begin

  Result := '';
  
  if not(Initialize) then Exit;

  if FFolderPipeline.Locate(FFolderFieldNames.FolderId, aFolderId, [pploCaseInsensitive]) then
    Result := FFolderPipeline.GetFieldValue(FFolderFieldNames.Name);

end; {procedure, GetFolderName}

{------------------------------------------------------------------------------}
{ TppReportExplorer.RenameFolder }

procedure TppReportExplorer.RenameFolder(aFolderId: Integer; const aNewName: String);
begin

  if not(Initialize) then Exit;

  if FFolderPipeline.Locate(FFolderFieldNames.FolderId, aFolderId, [pploCaseInsensitive]) then
    begin
      FFolderPipeline.Edit;
      FFolderPipeline.SetFieldValue(FFolderFieldNames.Name, aNewName);
      FFolderPipeline.Post;
    end;

end; {procedure, RenameFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ConfirmRenameFolder }

function TppReportExplorer.ConfirmRenameFolder(const aOldName, aNewName: String; aParentId: Integer): Boolean;
var
  lsCaption: String;
  lsMessage: String;
begin

  Result := ValidFolderName(aParentId, aNewName);

  if Result then Exit;

  lsCaption := ppLoadStr(552); {Error Renaming Folder}

  if (Length(aNewName) = 0) then
    lsMessage := ppLoadStr(1111) {You must type a folder name.}

  else
    begin
      {Cannot rename <name>: A folder with the name you specified already exists.}
      lsMessage := ppLoadStr(533);
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [aOldName]);
      lsMessage := lsMessage + #13#10 + #13#10 + ppLoadStr(584);
    end;

  ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);

end; {procedure, ConfirmRenameFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ConfirmRenameItem }

function TppReportExplorer.ConfirmRenameItem(const aOldName, aNewName: String; aItemType, aFolderId: Integer): Boolean;
var
  lsCaption: String;
  lsMessage: String;
begin

  Result := ValidItemName(aNewName, aItemType, aFolderId);

  if Result then Exit;

  lsCaption := ppLoadStr(553); {Error Renaming Item}

  if (Length(aNewName) = 0) then
    lsMessage := ppLoadStr(1112) {You must type an item name.}

  else
    begin
      {Cannot rename <name>: An item with the name you specified already exists.}
      lsMessage := ppLoadStr(534);
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [aOldName]);
      lsMessage := lsMessage + #13#10 + #13#10 + ppLoadStr(585);
    end;

  ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);

end; {procedure, ConfirmRenameItem}

{------------------------------------------------------------------------------}
{ TppReportExplorer.RejectMoveFolder }

procedure TppReportExplorer.RejectMoveFolder(const aFolderName: String);
var
  lsCaption: String;
  lsMessage: String;
begin

  lsCaption := ppLoadStr(551); {Error Moving Folder}

  {Cannot move <aFolderName>: The destination folder is the same as the source folder.}
  lsMessage := ppLoadStr(532);
  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [aFolderName]);

  ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);

end; {procedure, RejectMoveFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ConfirmReplaceFolder }

function TppReportExplorer.ConfirmReplaceFolder(const aFolderName: String): Word;
var
  lsCaption: String;
  lsMessage: String;
  lBitmapHandle: Longint;
begin

  lsCaption := ppLoadStr(537); {Confirm Folder Replace}

  {This folder already contains a folder called...}
  lsMessage := ppLoadStr(586);
  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [aFolderName]);
  lsMessage := lsMessage + #13#10 + #13#10 + ppLoadStr(592) + ' ' + ppLoadStr(593);

  lBitmapHandle := ppBitmapFromResource('PPREPLACEFOLDER');

  Result := ppMessageDlg(lsCaption, lsMessage, mtConfirmation, [mbYes, mbYesToAll, mbNo, mbCancel], lBitmapHandle);

end; {function, ConfirmReplaceFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ConfirmReplaceItem }

function TppReportExplorer.ConfirmReplaceItem(const aItemName: String): Boolean;
var
  lsCaption: String;
  lsMessage: String;
  lBitmapHandle: Longint;
begin

  lsCaption := ppLoadStr(540); {Confirm Item Replace}

  {This folder already contains an item called '<name>'. }
  lsMessage := ppLoadStr(587);
  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [aItemName]);
  lsMessage := lsMessage + #13#10 + #13#10 + ppLoadStr(590);

  lBitmapHandle := ppBitmapFromResource('PPREPLACEREPORT');

  Result := (ppMessageDlg(lsCaption, lsMessage, mtConfirmation, [mbYes, mbNo, mbCancel], lBitmapHandle) = mrYes);

end; {function, ConfirmReplaceItem}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ConfirmDeleteFolder }

function TppReportExplorer.ConfirmDeleteFolder(const aFolderName: String): Boolean;
var
  lsMessage: String;
  lsCaption: String;
  lBitmapHandle: Longint;
begin

  lsCaption := ppLoadStr(536); {Confirm Folder Delete}

  {Are you sure you want to remove the folder '<name>' and...}
  lsMessage := ppLoadStr(528);
  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [aFolderName]);

  lBitmapHandle := ppBitmapFromResource('PPRECYCLEFOLDER');

  Result := (ppMessageDlg(lsCaption, lsMessage, mtWarning, [mbYes, mbNo], lBitmapHandle) = mrYes);

end; {function, ConfirmDeleteFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ConfirmDeleteFolders }

function TppReportExplorer.ConfirmDeleteFolders(aList: TStrings): Boolean;
var
  lsCaption: String;
  lsMessage: String;
  lBitmapHandle: Longint;
begin

  Result := False;

  if (aList.Count = 0) then Exit;

  if (aList.Count = 1) then
    Result := ConfirmDeleteFolder(aList[0])
  else
    begin
      lsCaption := ppLoadStr(541); {Confirm Multiple Folder Delete}

      {Are you sure you want to delete these <count> folders...}
      lsMessage := ppLoadStr(526);
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [IntToStr(aList.Count)]);

      lBitmapHandle := ppBitmapFromResource('PPRECYCLEFOLDER');

      Result := (ppMessageDlg(lsCaption, lsMessage, mtWarning, [mbYes, mbNo], lBitmapHandle) = mrYes);
    end;

end; {function, ConfirmDeleteFolders}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ConfirmDeleteItem }

function TppReportExplorer.ConfirmDeleteItem(const aItemName: String): Boolean;
var
  lsMessage: String;
  lsCaption: String;
  lBitmapHandle: Longint;
begin

  lsCaption := ppLoadStr(539); {Confirm Item Delete}

  {Are you sure you want to delete '<name>'?}
  lsMessage := ppLoadStr(525);
  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [aItemName]);

  lBitmapHandle := ppBitmapFromResource('PPDELETEREPORT');

  Result := (ppMessageDlg(lsCaption, lsMessage, mtWarning, [mbYes, mbNo], lBitmapHandle) = mrYes);

end; {function, ConfirmDeleteItem}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ConfirmDeleteItems }

function TppReportExplorer.ConfirmDeleteItems(aList: TStrings): Boolean;
var
  lsCaption: String;
  lsMessage: String;
  lBitmapHandle: Longint;
begin

  Result := False;

  if (aList.Count = 0) then Exit;

  if (aList.Count = 1) then
    Result := ConfirmDeleteItem(aList[0])
  else
    begin
      lsCaption := ppLoadStr(543); {Confirm Multiple Item Delete}

      {Are you sure you want to delete these <count> items?}
      lsMessage := ppLoadStr(527);
      lsMessage := ppSetMessageParameters(lsMessage);
      lsMessage := Format(lsMessage, [IntToStr(aList.Count)]);

      lBitmapHandle := ppBitmapFromResource('PPDELETEREPORT');

      Result := (ppMessageDlg(lsCaption, lsMessage, mtWarning, [mbYes, mbNo], lBitmapHandle) = mrYes);
    end;

end; {function, ConfirmDeleteItems}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ConfirmRecycleItem }

function TppReportExplorer.ConfirmRecycleItem(const aItemName: String): Boolean;
var
  lsMessage: String;
  lsCaption: String;
  lBitmapHandle: Longint;
begin

  lsCaption := ppLoadStr(539); {Confirm Item Delete}

  {Are you sure you want to send '<name>' to the Recycle Bin?}
  lsMessage := ppLoadStr(529);
  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [aItemName]);

  lBitmapHandle := ppBitmapFromResource('PPRECYCLEREPORT');

  Result := (ppMessageDlg(lsCaption, lsMessage, mtWarning, [mbYes, mbNo], lBitmapHandle) = mrYes);

end; {function, ConfirmRecycleItem}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ConfirmRecycleItems }

function TppReportExplorer.ConfirmRecycleItems(aList: TStrings): Boolean;
var
  lsCaption: String;
  lsMessage: String;
  lBitmapHandle: Longint;
  lItem: TListItem;
  lbAllFolders: Boolean;
  liIndex: Integer;
begin

  Result := False;

  if (aList.Count = 0) then Exit;

  if (aList.Count = 1) then
    begin
      lItem := TListItem(aList.Objects[0]);

      if ((lItem.ImageIndex + 1) = itFolder) then
        Result := ConfirmDeleteFolder(aList[0])
      else
        Result := ConfirmRecycleItem(aList[0]);
    end
  else
    begin

      lbAllFolders := True;
      liIndex := 0;

      while lbAllFolders and (liIndex < aList.Count) do
        begin
          lItem := TListItem(aList.Objects[liIndex]);

          if ((lItem.ImageIndex + 1) <> itFolder) then
            lbAllFolders := False
          else
            Inc(liIndex);
        end;

      if lbAllFolders then
        Result := ConfirmDeleteFolders(aList)
      else
        begin
          lsCaption := ppLoadStr(543); {Confirm Multiple Item Delete}

          {Are you sure you want to send these <count> items to the Recycle Bin?}
          lsMessage := ppLoadStr(530);
          lsMessage := ppSetMessageParameters(lsMessage);
          lsMessage := Format(lsMessage, [IntToStr(aList.Count)]);

          lBitmapHandle := ppBitmapFromResource('PPRECYCLEREPORT');

          Result := (ppMessageDlg(lsCaption, lsMessage, mtWarning, [mbYes, mbNo], lBitmapHandle) = mrYes);
        end;
        
    end;

end; {function, ConfirmRecycleItems}

{------------------------------------------------------------------------------}
{ TppReportExplorer.DeleteFolder }

function TppReportExplorer.DeleteFolder(aFolderId: Integer): Boolean;
begin

  Result := False;

  if not(Initialize) then Exit;

  if (aFolderId = 0) or (aFolderId = -2) then Exit;

  {delete child folders}
  while FFolderPipeline.Locate(FFolderFieldNames.ParentId, aFolderId, [pploCaseInsensitive]) do
    DeleteFolder(FFolderPipeline.GetFieldValue(FFolderFieldNames.FolderId));

  {delete reports}
  DeleteItemsInFolder(aFolderId);

  {delete folder}
  if FFolderPipeline.Locate(FFolderFieldNames.FolderId, aFolderId, [pploCaseInsensitive]) then
    FFolderPipeline.Delete;

  Result := True;

end; {function, DeleteFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.DeleteItemsInFolder }

procedure TppReportExplorer.DeleteItemsInFolder(aFolderId: Integer);
begin
  while FItemPipeline.Locate(FItemFieldNames.FolderId, aFolderId, [pploCaseInsensitive]) do
    FItemPipeline.Delete;
end; {procedure, DeleteItemsInFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ChangeParentFolder }

function TppReportExplorer.ChangeParentFolder(aFolderId, aNewParentId: Integer): Boolean;
begin

  Result := False;

  if not(Initialize) then Exit;

  if (aFolderId = aNewParentId) then
    begin
      RejectMoveFolder(GetFolderName(aFolderId));

      Exit;
    end;

  if (aNewParentId = itRecycleBin) then
    FRecyclingItems := True;

  FYesToAll := False;

  Result := MoveFolderToFolder(aFolderId, aNewParentId);

  if (aNewParentId = itRecycleBin) then
    FRecyclingItems := False;

end; {procedure, ChangeParentFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.ChangeFolder }

function TppReportExplorer.ChangeFolder(const aItemName: String; aItemType, aFolderId, aNewFolderId: Integer): Boolean;
begin

  Result := False;

  if not(Initialize) then Exit;

  if (aNewFolderId = itRecycleBin) then
    FRecyclingItems := True;

  FShowMessages := True;

  Result := MoveItemToFolder(aItemName, aItemType, aFolderId, aNewFolderId);

  if (aNewFolderId = itRecycleBin) then
    FRecyclingItems := False;

end; {procedure, ChangeFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.MoveFolderToFolder }

function TppReportExplorer.MoveFolderToFolder(aFolderId, aNewParentId: Integer): Boolean;
var
  lsFolderName: String;
  liCollidingId: Integer;
  lbAllReportsMoved: Boolean;
  lbAllFoldersMoved: Boolean;
  lResult: Word;
begin

  Result := False;

  lsFolderName := GetFolderName(aFolderId);

  if FRecyclingItems then
    begin
      liCollidingId := -2;

      MoveFoldersToFolder(aFolderId, liCollidingId);
      MoveItemsToFolder(aFolderId, liCollidingId);

      DeleteFolder(aFolderId);

      Result := True;
    end

  else if not(ValidFolderName(aNewParentId, lsFolderName)) then
    begin

      liCollidingId := FFolderPipeline.GetFieldValue(FFolderFieldNames.FolderId);

      if not(FYesToAll) then
        begin
          lResult := ConfirmReplaceFolder(lsFolderName);

          case lResult of
            mrYesToAll:  FYesToAll := True;
            mrNo:        Exit;
            mrCancel:    Exit;
          end;

        end;

      lbAllFoldersMoved := MoveFoldersToFolder(aFolderId, liCollidingId);
      lbAllReportsMoved := MoveItemsToFolder(aFolderId, liCollidingId);

      if (lbAllReportsMoved) and (lbAllFoldersMoved) then
        DeleteFolder(aFolderId);

      Result := True;
    end

  else
    begin

      if (FFolderPipeline.Locate(FFolderFieldNames.FolderId, aFolderId, [pploCaseInsensitive])) then
        begin
          FFolderPipeline.Edit;
          FFolderPipeline.SetFieldValue(FFolderFieldNames.ParentId, aNewParentId);
          FFolderPipeline.Post;

          Result := True;
        end;
    end;

end; {procedure, MoveFolderToFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.MoveFoldersToFolder }

function TppReportExplorer.MoveFoldersToFolder(aOldFolderId, aNewFolderId: Integer): Boolean;
var
  lList: TStringList;
  liIndex: Integer;
  lFolderInfo: TppFolderInfo;
begin

  Result := True;

  lList := TStringList.Create;

  GetChildFolders(aOldFolderId, lList);

  for liIndex := 0 to lList.Count - 1 do
    begin
      lFolderInfo := TppFolderInfo(lList.Objects[liIndex]);

      if not(MoveFolderToFolder(lFolderInfo.FolderId, aNewFolderId)) then
        Result := False;

      lFolderInfo.Free;
    end;

  lList.Free;

end; {function, MoveFoldersToFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.MoveItemsToFolder }

function TppReportExplorer.MoveItemsToFolder(aOldFolderId, aNewFolderId: Integer): Boolean;
var
  lList: TStringList;
  lbSaveShowMessages: Boolean;
  liIndex: Integer;
  lItemInfo: TppItemInfo;
begin

  Result := True;

  lList := TStringList.Create;

  GetItems(aOldFolderId, itAllFolders, lList);

  lbSaveShowMessages := FShowMessages;
  FShowMessages := False;

  for liIndex := 0 to lList.Count - 1 do
    begin
      lItemInfo := TppItemInfo(lList.Objects[liIndex]);

      if not(MoveItemToFolder(lItemInfo.Name, lItemInfo.ItemType, lItemInfo.FolderId, aNewFolderId)) then
        Result := False;

      lItemInfo.Free;
    end;

  FShowMessages := lbSaveShowMessages;

  lList.Free;

end; {function, MoveItemsToFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.MoveItemToFolder }

function TppReportExplorer.MoveItemToFolder(const aItemName: String; aItemType, aFolderId, aNewFolderId: Integer): Boolean;
var
  lbUpdateFolder: Boolean;
  lbDeleteReport: Boolean;
begin

  Result := False;

  lbUpdateFolder := True;

  if not(FRecyclingItems) and (LocateItemRecord(aItemName, aItemType, aNewFolderId)) then
    begin

      if (FShowMessages) then
        lbDeleteReport := ConfirmReplaceItem(aItemName)
      else
        lbDeleteReport := True;

      if lbDeleteReport then
        Delete(aItemName, aItemType, aNewFolderId)
      else
        lbUpdateFolder := False;

    end;

  if lbUpdateFolder and (LocateItemRecord(aItemName, aItemType, aFolderId)) then
    begin
      FItemPipeline.Edit;
      FItemPipeline.SetFieldValue(FItemFieldNames.FolderId, aNewFolderId);
      FItemPipeline.Post;

      Result := True;
    end;

end; {procedure, MoveItemToFolder}

{------------------------------------------------------------------------------}
{ TppReportExplorer.Delete }

procedure TppReportExplorer.Delete(const aItemName: String; aItemType, aFolderId: Integer);
begin

  if not(Initialize) then Exit;

  if LocateItemRecord(aItemName, aItemType, aFolderId) then
    FItemPipeline.Delete;

end; {procedure, Delete}

{------------------------------------------------------------------------------}
{ TppReportExplorer.Rename }

procedure TppReportExplorer.Rename(const aItemName, aNewName: String; aItemType, aFolderId: Integer);
begin

  if not(Initialize) then Exit;

  if LocateItemRecord(aItemName, aItemType, aFolderId) then
    begin
      FItemPipeline.Edit;
      FItemPipeline.SetFieldValue(FItemFieldNames.Name, aNewName);
      FItemPipeline.Post;
    end;

end; {procedure, Rename}

{------------------------------------------------------------------------------}
{ TppReportExplorer.GetItems }

procedure TppReportExplorer.GetItems(aFolderId, aItemType: Integer; aList: TStrings);
var
  lItemInfo: TppItemInfo;
begin

  if not(Initialize) then Exit;

  aList.Clear;

  FItemPipeline.First;

  while not(FItemPipeline.EOF) do
    begin

      if (FItemPipeline.GetFieldValue(FItemFieldNames.FolderId) = aFolderId) and
         ((aItemType = 0) or (FItemPipeline.GetFieldValue(FItemFieldNames.ItemType) = aItemType)) then
        begin
          lItemInfo := TppItemInfo.Create;

          if (FItemPipeline.GetFieldValue(FItemFieldNames.Deleted) <> Null) then
            lItemInfo.Deleted := FItemPipeline.GetFieldValue(FItemFieldNames.Deleted);

          if (FItemPipeline.GetFieldValue(FItemFieldNames.Modified) <> Null) then
            lItemInfo.Modified := FItemPipeline.GetFieldValue(FItemFieldNames.Modified);

          lItemInfo.FolderId := FItemPipeline.GetFieldValue(FItemFieldNames.FolderId);
          lItemInfo.ItemId := FItemPipeline.GetFieldValue(FItemFieldNames.ItemId);
          lItemInfo.ItemType := FItemPipeline.GetFieldValue(FItemFieldNames.ItemType);
          lItemInfo.Name := FItemPipeline.GetFieldValue(FItemFieldNames.Name);
          lItemInfo.Size := FItemPipeline.GetFieldValue(FItemFieldNames.Size);

          aList.AddObject(lItemInfo.Name, lItemInfo);
        end;

      FItemPipeline.Next;
    end;

end; {procedure, GetItems}

{------------------------------------------------------------------------------}
{ TppReportExplorer.FreeItems }

procedure TppReportExplorer.FreeItems(aList: TStrings);
var
  liIndex: Integer;
  
begin

  for liIndex := 0 to aList.Count-1 do
    aList.Objects[liIndex].Free;

  aList.Clear;

end; {procedure, FreeItems}

{------------------------------------------------------------------------------}
{ TppReportExplorer.GetFolders }

procedure TppReportExplorer.GetFolders(aList: TStrings);
var
  lFolderInfo: TppFolderInfo;
begin

  if not(Initialize) then Exit;

  aList.Clear;

  FFolderPipeline.First;

  while not(FFolderPipeline.EOF) do
    begin
      lFolderInfo := TppFolderInfo.Create;

      lFolderInfo.Name := FFolderPipeline.GetFieldValue(FFolderFieldNames.Name);
      lFolderInfo.FolderId := FFolderPipeline.GetFieldValue(FFolderFieldNames.FolderId);
      lFolderInfo.ParentId := FFolderPipeline.GetFieldValue(FFolderFieldNames.ParentId);

      aList.AddObject(lFolderInfo.Name, lFolderInfo);

      FFolderPipeline.Next;
    end;

end; {procedure, GetFolders}

{------------------------------------------------------------------------------}
{ TppReportExplorer.GetParentFolders }

procedure TppReportExplorer.GetParentFolders(aFolderId: Integer; aList: TStrings);
var
  lFolderInfo: TppFolderInfo;
  liParentId: Integer;
begin

  if not(Initialize) then Exit;

  FFolderPipeline.First;

  if FFolderPipeline.Locate(FFolderFieldNames.FolderId, aFolderId, [pploCaseInsensitive]) then
    liParentId := FFolderPipeline.GetFieldValue(FFolderFieldNames.ParentId)
  else
    Exit;

  FFolderPipeline.First;

  if FFolderPipeline.Locate(FFolderFieldNames.FolderId, liParentId, [pploCaseInsensitive]) then
    begin
      lFolderInfo := TppFolderInfo.Create;

      lFolderInfo.Name := FFolderPipeline.GetFieldValue(FFolderFieldNames.Name);
      lFolderInfo.FolderId := FFolderPipeline.GetFieldValue(FFolderFieldNames.FolderId);
      lFolderInfo.ParentId := FFolderPipeline.GetFieldValue(FFolderFieldNames.ParentId);

      aList.AddObject(lFolderInfo.Name, lFolderInfo);

      GetParentFolders(lFolderInfo.FolderId, aList);
    end;

end; {procedure, GetParentFolders}

{------------------------------------------------------------------------------}
{ TppReportExplorer.GetChildFolders }

procedure TppReportExplorer.GetChildFolders(aFolderId: Integer; aList: TStrings);
var
  lFolderInfo: TppFolderInfo;
begin

  if not(Initialize) then Exit;

  aList.Clear;

  FFolderPipeline.First;

  while not(FFolderPipeline.EOF) do
    begin

      if (FFolderPipeline.GetFieldValue(FFolderFieldNames.ParentId) = aFolderId) then
        begin
          lFolderInfo := TppFolderInfo.Create;

          lFolderInfo.Name := FFolderPipeline.GetFieldValue(FFolderFieldNames.Name);
          lFolderInfo.FolderId := FFolderPipeline.GetFieldValue(FFolderFieldNames.FolderId);
          lFolderInfo.ParentId := FFolderPipeline.GetFieldValue(FFolderFieldNames.ParentId);

          aList.AddObject(lFolderInfo.Name, lFolderInfo);
        end;

      FFolderPipeline.Next;
    end;

end; {procedure, GetChildFolders}

{******************************************************************************
 *
 ** F O L D E R   F I E L D   N A M E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFolderFieldNames.Create }

constructor TppFolderFieldNames.Create(aExplorer: TppReportExplorer);
begin

  inherited Create;

  FReportExplorer := aExplorer;

  FFolderId := 'FolderId';
  FName := 'Name';
  FParentId := 'ParentId';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppFolderFieldNames.Assign }

procedure TppFolderFieldNames.Assign(Source: TPersistent);
var
  lSource: TppFolderFieldNames;
begin

  if not(Source is TppFolderFieldNames) then Exit;

  lSource := TppFolderFieldNames(Source);

  FFolderId := lSource.FolderId;
  FName := lSource.Name;
  FParentId := lSource.ParentId;

end; {procedure, Assign}

{******************************************************************************
 *
 ** I T E M   F I E L D   N A M E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppItemFieldNames.Create }

constructor TppItemFieldNames.Create(aExplorer: TppReportExplorer);
begin

  inherited Create;

  FReportExplorer := aExplorer;

  FDeleted := 'Deleted';
  FFolderId := 'FolderId';
  FItemId := 'ItemId';
  FItemType := 'ItemType';
  FModified := 'Modified';
  FName := 'Name';
  FSize := 'Size';
  FTemplate := 'Template';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppItemFieldNames.Assign }

procedure TppItemFieldNames.Assign(Source: TPersistent);
var
  lSource: TppItemFieldNames;
begin

  if not(Source is TppItemFieldNames) then Exit;

  lSource := TppItemFieldNames(Source);

  FDeleted := lSource.Deleted;
  FFolderId := lSource.FolderId;
  FItemId := lSource.ItemId;
  FItemType := lSource.ItemType;
  FModified := lSource.Modified;
  FName := lSource.Name;
  FSize := lSource.Size;
  FTemplate := lSource.Template;

end; {procedure, Assign}

{******************************************************************************
 *
 ** F O R M   W R A P P E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFormWrapper.Create }

constructor TppFormWrapper.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FFormCaption       := ppLoadStr(580); {Report Explorer}
  FFormHeight        := 400;
  FFormIcon          := TIcon.Create;
  FFormIcon.OnChange := IconChange;
  FFormLeft          := 100;
  FFormPosition      := poScreenCenter;
  FFormStyle         := fsNormal;
  FFormTop           := 50;
  FFormWidth         := 600;
  FFormState         := wsNormal;
  FFormTag           := 0;

  {events }
  FOnActivate        := nil;
  FOnClose           := nil;
  FOnCloseQuery      := nil;
  FOnCreate          := nil;
  FOnDeactivate      := nil;
  FOnDestroy         := nil;
  FOnHide            := nil;
  FOnShow            := nil;
  FOnResize          := nil;

{$IFDEF WINDOWS}
  FSetPositionNeeded := True;
{$ENDIF}

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppFormWrapper.Destroy }

destructor TppFormWrapper.Destroy;
begin

  FFormIcon.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppFormWrapper.BeforeShowForm }

function TppFormWrapper.BeforeShowForm: Boolean;
begin
  Result := True;
end; {function, BeforeShowForm}

{------------------------------------------------------------------------------}
{ TppFormWrapper.AfterShowForm }

procedure TppFormWrapper.AfterShowForm;
begin

end; {function, AfterShowForm}

{------------------------------------------------------------------------------}
{ TppFormWrapper.Show }

procedure TppFormWrapper.Show;
begin

  if not(BeforeShowForm) then Exit;

  PropertiesToForm;

  if Assigned(FOnCreate) and (GetForm <> nil) then FOnCreate(GetForm);

  if (GetForm <> nil) then
    begin
      GetForm.OnClose := FormCloseEvent;

      GetForm.Show;
    end;

end; {procedure, Show}

{------------------------------------------------------------------------------}
{ TppFormWrapper.ShowModal }

procedure TppFormWrapper.ShowModal;
begin

  if not(BeforeShowForm) then Exit;

  PropertiesToForm;

  if Assigned(FOnCreate) and (GetForm <> nil) then FOnCreate(GetForm);

  GetForm.ShowModal;

  AfterShowForm;

end; {procedure, ShowModal}

{------------------------------------------------------------------------------}
{ TppFormWrapper.FormCloseEvent }

procedure TppFormWrapper.FormCloseEvent(Sender: TObject; var Action: TCloseAction);
begin

  if Assigned(FOnClose) then FOnClose(Sender, Action);

  AfterShowForm;

end; {procedure, FormCloseEvent}

{------------------------------------------------------------------------------}
{ TppFormWrapper.PropertiesToForm }

procedure TppFormWrapper.PropertiesToForm;
var
  lForm: TForm;
begin

  lForm := GetForm;

  if (lForm = nil) then Exit;

  if (csDesigning in ComponentState) then Exit;

  lForm.Caption := FFormCaption;
  lForm.Icon := FFormIcon;

  if not(TppCustomReportExplorer(lForm).FormSettingsRemembered) then
    begin
      lForm.WindowState := FFormState;
      lForm.Position := FFormPosition;

      lForm.Height := FFormHeight;
      lForm.Left := FFormLeft;
      lForm.Top := FFormTop;
      lForm.Width := FFormWidth;
    end;

  lForm.Tag := FFormTag;

   {pass-thru events}
   lForm.OnActivate    := FOnActivate;
   lForm.OnClose       := FOnClose;
   lForm.OnCloseQuery  := FOnCloseQuery;
   lForm.OnDeactivate  := FOnDeactivate;
   lForm.OnHide        := FOnHide;
   lForm.OnResize      := FOnResize;
   lForm.OnShow        := FOnShow;

end; {procedure, PropertiesToForm}

{------------------------------------------------------------------------------}
{ TppFormWrapper.Close }

procedure TppFormWrapper.Close;
begin
  if (GetForm <> nil) then
    GetForm.Close;
end; {procedure, Close}

{------------------------------------------------------------------------------}
{ TppFormWrapper.Hide }

procedure TppFormWrapper.Hide;
begin
  if (GetForm <> nil) then
    GetForm.Hide;
end; {procedure, Hide}

{------------------------------------------------------------------------------}
{ TppFormWrapper.Invalidate }

procedure TppFormWrapper.Invalidate;
begin
  if (GetForm <> nil) then
    GetForm.Invalidate;
end; {procedure, Invalidate}

{------------------------------------------------------------------------------}
{ TppFormWrapper.BringToFront }

procedure TppFormWrapper.BringToFront;
begin
  if (GetForm <> nil) then
    GetForm.BringToFront;
end; {procedure, BringToFront}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SendToBack }

procedure TppFormWrapper.SendToBack;
begin
  if (GetForm <> nil) then
    GetForm.SendToBack;
end; {procedure, SendToBack}

{------------------------------------------------------------------------------}
{ TppFormWrapper.GetFormStyle }

function TppFormWrapper.GetFormStyle: TFormStyle;
begin
  if (GetForm = nil) then
    Result := FFormStyle
  else
    Result := GetForm.FormStyle;
end; {function, GetFormStyle}

{------------------------------------------------------------------------------}
{ TppFormWrapper.GetFormHeight }

function TppFormWrapper.GetFormHeight: Integer;
begin
  if (GetForm = nil) then
    Result := FFormHeight
  else
    Result := GetForm.Height;
end; {function, GetFormHeight}

{------------------------------------------------------------------------------}
{ TppFormWrapper.GetFormLeft }

function TppFormWrapper.GetFormLeft: Integer;
begin
  if (GetForm = nil) then
    Result := FFormLeft
  else
    Result := GetForm.Left;
end; {function, GetFormLeft}

{------------------------------------------------------------------------------}
{ TppFormWrapper.GetFormTop }

function TppFormWrapper.GetFormTop: Integer;
begin
  if (GetForm = nil) then
    Result := FFormTop
  else
    Result := GetForm.Top;
end; {function, GetFormTop}

{------------------------------------------------------------------------------}
{ TppFormWrapper.GetFormWidth }

function TppFormWrapper.GetFormWidth: Integer;
begin
  if (GetForm = nil) then
    Result := FFormWidth
  else
    Result := GetForm.Width;
end; {function, GetFormWidth}

{------------------------------------------------------------------------------}
{ TppFormWrapper.GetFormState }

function TppFormWrapper.GetFormState: TWindowState;
begin
  if (GetForm = nil) then
    Result := FFormState
  else
    Result := GetForm.WindowState;
end; {function, GetFormState}

{------------------------------------------------------------------------------}
{ TppFormWrapper.GetFormTag }

function TppFormWrapper.GetFormTag: LongInt;
begin
  if (GetForm = nil) then
    Result := FFormTag
  else
    Result := GetForm.Tag;
end; {function, GetFormTag}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetBounds }

procedure TppFormWrapper.SetBounds(aLeft, aTop, aWidth, aHeight: Integer);
begin
  if (GetForm <> nil) then
    GetForm.SetBounds(aLeft, aTop, aWidth, aHeight);
end; {procedure, SetBounds}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetFormCaption }

procedure TppFormWrapper.SetFormCaption(aCaption: String);
begin
  FFormCaption := aCaption;

  if (GetForm <> nil) then
    GetForm.Caption := FFormCaption;
end; {procedure, SetFormCaption}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetFormStyle }

procedure TppFormWrapper.SetFormStyle(aFormStyle: TFormStyle);
begin
  FFormStyle := aFormStyle;

  if (GetForm <> nil) then
    GetForm.FormStyle := FFormStyle;
end; {procedure, SetFormStyle}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetFormHeight }

procedure TppFormWrapper.SetFormHeight(aHeight: Integer);
begin
  FFormHeight := aHeight;

  if (GetForm <> nil) then
    GetForm.Height := FFormHeight;
end; {procedure, SetFormHeight}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetFormIcon }

procedure TppFormWrapper.SetFormIcon(aIcon: TIcon);
begin
  FFormIcon.Assign(aIcon);
end; {procedure, SetFormIcon}

{------------------------------------------------------------------------------}
{ TppFormWrapper.IconChange }

procedure TppFormWrapper.IconChange(Sender: TObject);
begin
  if (GetForm <> nil) then
    GetForm.Icon := FFormIcon;
end; {procedure, IconChange}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetFormLeft }

procedure TppFormWrapper.SetFormLeft(aLeft: Integer);
begin
  FFormLeft:= aLeft;

  if (GetForm <> nil) then
    GetForm.Left := FFormLeft;
end; {procedure, SetFormLeft}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetFormTop }

procedure TppFormWrapper.SetFormTop(aTop: Integer);
begin
  FFormTop:= aTop;

  if (GetForm <> nil) then
    GetForm.Top := FFormTop;
end; {procedure, SetFormTop}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetFormWidth }

procedure TppFormWrapper.SetFormWidth(aWidth: Integer);
begin
  FFormWidth := aWidth;

  if (GetForm <> nil) then
    GetForm.Width := FFormWidth;
end; {procedure, SetFormWidth}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetFormState }

procedure TppFormWrapper.SetFormState(aFormState: TWindowState);
begin
  FFormState := aFormState;

  if (GetForm <> nil) then
    GetForm.WindowState := aFormState;
end; {procedure, SetFormState}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetFormTag }

procedure TppFormWrapper.SetFormTag(aTag: LongInt);
begin
  FFormTag := aTag;

  if (GetForm <> nil) then
    GetForm.Tag := aTag;

end; {procedure, SetFormTag}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetFormPosition }

procedure TppFormWrapper.SetFormPosition(aPosition: TPosition);
begin

  FFormPosition := aPosition;

{$IFDEF WIN32}
  if (GetForm <> nil) then
    GetForm.Position := FFormPosition;
{$ELSE}

  {note: 1. D1 cannot support Position property because setting this calls
            RecreatWnd and TB97 for D1 cannot handle this (i.e. floating toolbars
            will no longer work) The SetInitialPosition procedure below is used
            to support poScreenCenter for D1.

         2. When reading/loading need to allow FormHeight, FormLeft,
            etc. to be read up. Therefore SetInitialPosition will be called
            prior to Show or ShowModal}


  if not (csReading in ComponentState) and not (csLoading in ComponentState) then
    SetInitialPosition;

{$ENDIF}


end; {procedure, SetFormPosition}

{$IFDEF WINDOWS}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetInitialPosition }

procedure TppFormWrapper.SetInitialPosition;
var
  liLeft: Integer;
  liTop: Integer;

begin

  if (GetForm = nil) then Exit;

  {center the designer window on the screen }

  if FFormPosition = poScreenCenter then
    begin

      if GetForm.FormStyle = fsMDIChild then
        begin
          liLeft := (Application.MainForm.ClientWidth  - GetForm.Width )  div 2;
          liTop  := (Application.MainForm.ClientHeight - GetForm.Height) div 2;
        end
      else
        begin
          liLeft := (Screen.Width  - GetForm.Width) div 2;
          liTop  := (Screen.Height - GetForm.Height) div 2;
        end;

      if liLeft < 0 then
        liLeft := 0;


      if liTop  < 0 then
        liTop := 0;

      SetBounds(liLeft, liTop, GetForm.Width, GetForm.Height);

  end;

end; {procedure, SetInitialPosition}

{$ENDIF}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetOnCreate }

procedure TppFormWrapper.SetOnCreate(aNotifyEvent: TNotifyEvent);
begin
  FOnCreate := aNotifyEvent;

  if (GetForm <> nil) then
    GetForm.OnCreate := FOnCreate;

end; {procedure, SetOnCreate}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetOnDestroy }

procedure TppFormWrapper.SetOnDestroy(aNotifyEvent: TNotifyEvent);
begin
  FOnDestroy := aNotifyEvent;

  if (GetForm <> nil) then
    GetForm.OnDestroy := FOnDestroy;

end; {procedure, SetOnDestroy}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetOnActivate }

procedure TppFormWrapper.SetOnActivate(aNotifyEvent: TNotifyEvent);
begin
  FOnActivate := aNotifyEvent;

  if (GetForm <> nil) then
    GetForm.OnActivate := FOnActivate;

end; {procedure, SetOnActivate}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetOnShow }

procedure TppFormWrapper.SetOnShow(aNotifyEvent: TNotifyEvent);
begin

  FOnShow := aNotifyEvent;

  if (GetForm <> nil) then
    GetForm.OnShow := FOnShow;

end; {procedure, SetOnShow}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetOnResize }

procedure TppFormWrapper.SetOnResize(aNotifyEvent: TNotifyEvent);
begin

  FOnResize := aNotifyEvent;

  if (GetForm <> nil) then
    GetForm.OnResize := FOnResize;

end; {procedure, SetOnResize}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetOnHide }

procedure TppFormWrapper.SetOnHide(aNotifyEvent: TNotifyEvent);
begin

  FOnHide := aNotifyEvent;

  if (GetForm <> nil) then
    GetForm.OnShow := FOnHide;

end; {procedure, SetOnHide}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetOnDeactivate }

procedure TppFormWrapper.SetOnDeactivate(aNotifyEvent: TNotifyEvent);
begin
  FOnDeactivate := aNotifyEvent;

  if (GetForm <> nil) then
    GetForm.OnDeactivate := FOnDeactivate;

end; {procedure, SetOnDeactivate}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetOnClose }

procedure TppFormWrapper.SetOnClose(aCloseEvent: TCloseEvent);
begin
  FOnClose := aCloseEvent;

  if (GetForm <> nil) then
    GetForm.OnClose := FOnClose;

end; {procedure, SetOnClose}

{------------------------------------------------------------------------------}
{ TppFormWrapper.SetOnCloseQuery }

procedure TppFormWrapper.SetOnCloseQuery(aCloseQueryEvent: TCloseQueryEvent);
begin
  FOnCloseQuery := aCloseQueryEvent;

  if (GetForm <> nil) then
    GetForm.OnCloseQuery := FOnCloseQuery;

end; {procedure, SetOnCloseQuery}




end.
